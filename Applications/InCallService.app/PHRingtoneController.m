@interface PHRingtoneController
- (BOOL)_isActivePreferredOutputPort:(id)a3;
- (BOOL)_shouldAnnounceCalls;
- (ICSCallAnnouncement)callAnnouncement;
- (OS_dispatch_queue)queue;
- (PHRingtoneController)init;
- (TUUserConfiguration)userConfiguration;
- (unsigned)audioSessionIdentifier;
- (unsigned)audioSessionIdentifierForSessionDescriptors:(id)a3;
- (void)_playCallAnnouncement:(id)a3;
- (void)dealloc;
- (void)handleAVSystemController_ServerConnectionDiedNotification:(id)a3;
- (void)handleAVSystemController_SomeSessionIsPlayingDidChangeNotification:(id)a3;
- (void)playAnnouncementForCall:(id)a3;
- (void)playDowntimeStartingAnnouncementForCall:(id)a3;
- (void)setAudioSessionIdentifier:(unsigned int)a3;
- (void)setCallAnnouncement:(id)a3;
- (void)startObservingNotificationsForAVSystemController:(id)a3;
- (void)stopAnnouncement;
- (void)stopObservingNotificationsForAVSystemController:(id)a3;
@end

@implementation PHRingtoneController

- (PHRingtoneController)init
{
  v13.receiver = self;
  v13.super_class = (Class)PHRingtoneController;
  v2 = [(PHRingtoneController *)&v13 init];
  v3 = v2;
  if (v2)
  {
    v2->_audioSessionIdentifier = 0;
    v4 = (TUUserConfiguration *)objc_alloc_init((Class)TUUserConfiguration);
    userConfiguration = v3->_userConfiguration;
    v3->_userConfiguration = v4;

    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.InCallService.PHRingtoneController", v6);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v7;

    v9 = v3->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100043EE0;
    block[3] = &unk_1002CD518;
    v12 = v3;
    dispatch_async(v9, block);
  }
  return v3;
}

- (void)dealloc
{
  v3 = +[AVSystemController sharedAVSystemController];
  [(PHRingtoneController *)self stopObservingNotificationsForAVSystemController:v3];

  v4.receiver = self;
  v4.super_class = (Class)PHRingtoneController;
  [(PHRingtoneController *)&v4 dealloc];
}

- (void)startObservingNotificationsForAVSystemController:(id)a3
{
  id v4 = a3;
  v5 = [(PHRingtoneController *)self queue];
  dispatch_assert_queue_V2(v5);

  v6 = [v4 attributeForKey:AVSystemController_PlayingSessionsDescriptionAttribute];
  if (v6) {
    [(PHRingtoneController *)self setAudioSessionIdentifier:[(PHRingtoneController *)self audioSessionIdentifierForSessionDescriptors:v6]];
  }
  v12[0] = AVSystemController_ServerConnectionDiedNotification;
  v12[1] = AVSystemController_SomeSessionIsPlayingDidChangeNotification;
  dispatch_queue_t v7 = +[NSArray arrayWithObjects:v12 count:2];
  id v11 = 0;
  unsigned int v8 = [v4 setAttribute:v7 forKey:AVSystemController_SubscribeToNotificationsAttribute error:&v11];
  id v9 = v11;
  if (v8)
  {
    v10 = +[NSNotificationCenter defaultCenter];
    [v10 addObserver:self selector:"handleAVSystemController_ServerConnectionDiedNotification:" name:AVSystemController_ServerConnectionDiedNotification object:v4];
    [v10 addObserver:self selector:"handleAVSystemController_SomeSessionIsPlayingDidChangeNotification:" name:AVSystemController_SomeSessionIsPlayingDidChangeNotification object:v4];
  }
  else
  {
    v10 = sub_1000D5130();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1001E986C((uint64_t)v9, v10);
    }
  }
}

- (void)stopObservingNotificationsForAVSystemController:(id)a3
{
  id v4 = a3;
  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self name:AVSystemController_ServerConnectionDiedNotification object:v4];
  [v5 removeObserver:self name:AVSystemController_SomeSessionIsPlayingDidChangeNotification object:v4];
}

- (BOOL)_isActivePreferredOutputPort:(id)a3
{
  id v3 = a3;
  id v4 = +[TUAudioSystemController sharedAudioSystemController];
  id v5 = [v3 UID];

  v6 = [v4 pickableRouteWithUniqueIdentifier:v5];

  unsigned int v7 = [v6 isPreferredAndActive];
  if (v7)
  {
    unsigned int v8 = sub_1000D5130();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      CFStringRef v11 = @"YES";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Preferred output port detected, setting preferredOutputPortEnabled = %@.", (uint8_t *)&v10, 0xCu);
    }
  }
  return v7;
}

- (BOOL)_shouldAnnounceCalls
{
  id v3 = [(PHRingtoneController *)self queue];
  dispatch_assert_queue_V2(v3);

  v53 = self;
  id v4 = [(PHRingtoneController *)self userConfiguration];
  id v5 = [v4 announceCalls];

  v6 = sub_1000D5130();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v7 = +[NSString tu_stringWithTUConfigurationAnnounceCalls:v5];
    *(_DWORD *)buf = 138412290;
    CFStringRef v59 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Call announcement preference set to %@", buf, 0xCu);
  }
  if (!v5) {
    goto LABEL_74;
  }
  if (UIAccessibilityIsVoiceOverRunning())
  {
    unsigned int v8 = sub_1000D5130();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Suppressing the call announcement, Voice Over is active.", buf, 2u);
    }

    goto LABEL_74;
  }
  id v9 = (id)[(PHRingtoneController *)v53 audioSessionIdentifier];
  if (!v9)
  {
    int v10 = sub_1000D5130();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Deferring call announcement until audio session is available.", buf, 2u);
    }
  }
  CFStringRef v11 = +[AVAudioSession retrieveSessionWithID:v9];
  v12 = v11;
  if (v11)
  {
    objc_super v13 = [(__CFString *)v11 currentRoute];
    v14 = [v13 outputs];

    if ([v14 count])
    {
      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      v15 = v14;
      id v16 = [v15 countByEnumeratingWithState:&v54 objects:v62 count:16];
      if (v16)
      {
        v48 = v14;
        v49 = v12;
        id v50 = v5;
        uint64_t v52 = 0;
        char v51 = 0;
        char v17 = 0;
        uint64_t v18 = *(void *)v55;
        while (1)
        {
          v19 = 0;
          do
          {
            if (*(void *)v55 != v18) {
              objc_enumerationMutation(v15);
            }
            v20 = *(void **)(*((void *)&v54 + 1) + 8 * (void)v19);
            v21 = sub_1000D5130();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              v22 = [v20 portName];
              id v23 = [v20 endpointType];
              *(_DWORD *)buf = 138412546;
              CFStringRef v59 = v22;
              __int16 v60 = 2048;
              id v61 = v23;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Verifying call announcement eligibility of output port %@ with endpoint type '%tu'.", buf, 0x16u);
            }
            uint64_t v24 = (uint64_t)[v20 endpointType];
            if (v24 <= 1953790302)
            {
              if (v24 != 1751412846)
              {
                if (v24 != 1936747378) {
                  goto LABEL_45;
                }
                v26 = sub_1000D5130();
                if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  CFStringRef v59 = @"YES";
                  _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Connected to an external speaker, setting speakerEnabled = %@.", buf, 0xCu);
                }

                goto LABEL_33;
              }
              v30 = sub_1000D5130();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                CFStringRef v59 = @"YES";
                v31 = v30;
                v32 = "Headphones output port detected, setting headphonesEnabled = %@.";
LABEL_42:
                _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, v32, buf, 0xCu);
              }
LABEL_43:

              BYTE4(v52) = [(PHRingtoneController *)v53 _isActivePreferredOutputPort:v20];
LABEL_44:
              char v17 = 1;
              goto LABEL_45;
            }
            switch(v24)
            {
              case 1953790303:
                v27 = sub_1000D5130();
                if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Call announcements via TTY are not supported.", buf, 2u);
                }

                break;
              case 1969977198:
                v28 = [v20 portType];
                unsigned int v29 = [v28 isEqualToString:AVAudioSessionPortBluetoothHFP];

                if (v29)
                {
                  v30 = sub_1000D5130();
                  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    CFStringRef v59 = @"YES";
                    v31 = v30;
                    v32 = "Bluetooth Hands-Free Profile output port detected, setting headphonesEnabled = %@.";
                    goto LABEL_42;
                  }
                  goto LABEL_43;
                }
                v33 = [v20 portType];
                unsigned int v34 = [v33 isEqualToString:AVAudioSessionPortHeadphones];

                if (v34)
                {
                  v35 = sub_1000D5130();
                  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    CFStringRef v59 = @"YES";
                    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Headphone or headset output port detected, setting headphonesEnabled = %@.", buf, 0xCu);
                  }

                  goto LABEL_44;
                }
                v36 = [v20 portType];
                unsigned int v37 = [v36 isEqualToString:AVAudioSessionPortBuiltInSpeaker];

                v38 = sub_1000D5130();
                BOOL v39 = os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT);
                if (v37)
                {
                  if (v39)
                  {
                    *(_DWORD *)buf = 138412290;
                    CFStringRef v59 = @"YES";
                    _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Built-in speaker output port detected, setting speakerEnabled = %@.", buf, 0xCu);
                  }

LABEL_33:
                  LOBYTE(v52) = 1;
                  break;
                }
                if (v39)
                {
                  v40 = [v20 portName];
                  *(_DWORD *)buf = 138412290;
                  CFStringRef v59 = v40;
                  _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Call announcements via %@ are not supported.", buf, 0xCu);
                }
                break;
              case 1986552684:
                v25 = sub_1000D5130();
                if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  CFStringRef v59 = @"YES";
                  _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Connected to a vehicle via bluetooth, setting connectedToVehicle = %@.", buf, 0xCu);
                }

                char v51 = 1;
                break;
            }
LABEL_45:
            v19 = (char *)v19 + 1;
          }
          while (v16 != v19);
          id v41 = [v15 countByEnumeratingWithState:&v54 objects:v62 count:16];
          id v16 = v41;
          if (!v41)
          {
            v12 = v49;
            id v5 = v50;
            v14 = v48;
            char v42 = v51;
            char v43 = v52;
            LOBYTE(v16) = BYTE4(v52);
            goto LABEL_68;
          }
        }
      }
      char v43 = 0;
    }
    else
    {
      v15 = sub_1000D5130();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        CFStringRef v59 = v12;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Suppressing the call announcement, could not retrieve any output routes for the specified audio session (%@).", buf, 0xCu);
      }
      id v5 = 0;
      char v43 = 0;
      LOBYTE(v16) = 0;
    }
    char v42 = 0;
    char v17 = 0;
LABEL_68:
  }
  else
  {
    v14 = sub_1000D5130();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1001E98E4((int)v9, v14);
    }
    char v43 = 0;
    LOBYTE(v16) = 0;
    char v42 = 0;
    char v17 = 0;
  }

  if (v12)
  {
    if (v5 == (id)1)
    {
      char v44 = v17 | v16;
      char v45 = v43 | v42;
    }
    else
    {
      if (v5 == (id)3)
      {
        char v46 = v17 & ((v43 & 1) == 0) | v16;
        return v46 & 1;
      }
      if (v5 != (id)2) {
        goto LABEL_74;
      }
      char v44 = v17 & ((v43 & 1) == 0);
      char v45 = v16 | v42;
    }
    char v46 = v44 | v45;
    return v46 & 1;
  }
LABEL_74:
  char v46 = 0;
  return v46 & 1;
}

- (void)_playCallAnnouncement:(id)a3
{
  id v4 = a3;
  if ([(PHRingtoneController *)self _shouldAnnounceCalls])
  {
    id v5 = [(PHRingtoneController *)self callAnnouncement];

    if (v5)
    {
      v6 = sub_1000D5130();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v7 = [(PHRingtoneController *)self callAnnouncement];
        int v10 = 138412546;
        id v11 = v7;
        __int16 v12 = 2112;
        id v13 = v4;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Announcements are enabled but already playing a call announcement (%@), so will not play call announcement (%@).", (uint8_t *)&v10, 0x16u);
      }
    }
    else
    {
      [v4 setAudioSessionIdentifier:[self audioSessionIdentifier]];
      [(PHRingtoneController *)self setCallAnnouncement:v4];
      unsigned int v8 = sub_1000D5130();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = [(PHRingtoneController *)self callAnnouncement];
        int v10 = 138412290;
        id v11 = v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Announcements are enabled, playing call announcement (%@).", (uint8_t *)&v10, 0xCu);
      }
      v6 = [(PHRingtoneController *)self callAnnouncement];
      [v6 start];
    }
  }
  else
  {
    v6 = sub_1000D5130();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Announcements are disabled, will not play call announcement (%@).", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)playAnnouncementForCall:(id)a3
{
  id v4 = +[ICSCallAnnouncement announcementWithCall:a3];
  id v5 = [(PHRingtoneController *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100044DA4;
  v7[3] = &unk_1002CDDE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)playDowntimeStartingAnnouncementForCall:(id)a3
{
  id v4 = +[ICSCallAnnouncement announcementWithCall:a3];
  [(PHRingtoneController *)self setCallAnnouncement:v4];
  id v5 = [(PHRingtoneController *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100044E74;
  block[3] = &unk_1002CD518;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);
}

- (void)stopAnnouncement
{
  id v3 = [(PHRingtoneController *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100044F04;
  block[3] = &unk_1002CD518;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (unsigned)audioSessionIdentifier
{
  id v3 = [(PHRingtoneController *)self queue];
  dispatch_assert_queue_V2(v3);

  return self->_audioSessionIdentifier;
}

- (void)setAudioSessionIdentifier:(unsigned int)a3
{
  id v5 = [(PHRingtoneController *)self queue];
  dispatch_assert_queue_V2(v5);

  if (self->_audioSessionIdentifier != a3)
  {
    self->_audioSessionIdentifier = a3;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100045088;
    block[3] = &unk_1002CD518;
    void block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)handleAVSystemController_ServerConnectionDiedNotification:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v11 = self;
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ is handling %@", buf, 0x16u);
  }

  id v6 = [v4 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    queue = self->_queue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100045248;
    v8[3] = &unk_1002CDDE0;
    v8[4] = self;
    id v9 = v6;
    dispatch_async(queue, v8);
  }
}

- (void)handleAVSystemController_SomeSessionIsPlayingDidChangeNotification:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    __int16 v12 = self;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ is handling %@", buf, 0x16u);
  }

  id v6 = [v4 userInfo];
  unsigned int v7 = [v6 objectForKeyedSubscript:AVSystemController_SomeSessionIsPlayingDidChangeNotificationParameter_Sessions];

  if (v7)
  {
    id v8 = [(PHRingtoneController *)self queue];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100045424;
    v9[3] = &unk_1002CDDE0;
    v9[4] = self;
    id v10 = v7;
    dispatch_async(v8, v9);
  }
}

- (unsigned)audioSessionIdentifierForSessionDescriptors:(id)a3
{
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v3 = a3;
  id v4 = [v3 countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (v4)
  {
    id v5 = v4;
    unsigned int v20 = 0;
    uint64_t v6 = *(void *)v28;
    uint64_t v22 = TUBundleIdentifierCallServicesDaemon;
    id v21 = v3;
    uint64_t v24 = *(void *)v28;
    while (1)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v28 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        id v9 = AVSystemController_PlayingSessionsDescriptionKey_ClientPID;
        id v10 = [v8 objectForKeyedSubscript:v9];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id v13 = 0;
          int v18 = 3;
          goto LABEL_25;
        }
        id v11 = +[RBSProcessIdentifier identifierWithPid:](RBSProcessIdentifier, "identifierWithPid:", [v10 intValue]);
        if (v11)
        {
          id v26 = 0;
          __int16 v12 = +[RBSProcessHandle handleForIdentifier:v11 error:&v26];
          id v13 = v26;
          if (v12)
          {
            id v14 = +[RBSProcessPredicate predicateMatchingServiceName:v22];
            if (v14)
            {
              id v25 = 0;
              v15 = +[RBSProcessHandle handleForPredicate:v14 error:&v25];
              id v23 = v25;

              if (v15 && [v12 isEqual:v15])
              {
                id v16 = AVSystemController_PlayingSessionsDescriptionKey_AudioSessionID;

                char v17 = [v8 objectForKeyedSubscript:v16];

                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  unsigned int v20 = [v17 unsignedIntValue];
                  int v18 = 2;
                }
                else
                {
                  int v18 = 3;
                }
                id v10 = v17;
                id v9 = v16;
              }
              else
              {
                int v18 = 3;
              }
              id v13 = v23;

              id v3 = v21;
              goto LABEL_23;
            }
          }
          else
          {
            id v14 = sub_1000D5130();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              id v32 = v13;
              _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Retrieving process handle failed with error %@", buf, 0xCu);
            }
          }
          int v18 = 3;
LABEL_23:

          uint64_t v6 = v24;
          goto LABEL_24;
        }
        id v13 = 0;
        int v18 = 3;
LABEL_24:

LABEL_25:
        if (v18 != 3) {
          goto LABEL_30;
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v27 objects:v33 count:16];
      if (!v5) {
        goto LABEL_30;
      }
    }
  }
  unsigned int v20 = 0;
LABEL_30:

  return v20;
}

- (TUUserConfiguration)userConfiguration
{
  return self->_userConfiguration;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (ICSCallAnnouncement)callAnnouncement
{
  return self->_callAnnouncement;
}

- (void)setCallAnnouncement:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callAnnouncement, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_userConfiguration, 0);
}

@end