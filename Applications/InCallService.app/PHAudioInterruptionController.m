@interface PHAudioInterruptionController
+ (id)sharedInstance;
- (PHAudioInterruptionController)init;
- (PHRingtoneController)ringtoneController;
- (id)bundleIdentifierForCall:(id)a3;
- (id)handlesForCall:(id)a3;
- (void)_callShouldSuppressRingtoneChanged:(id)a3;
- (void)_callStatusChanged:(id)a3;
- (void)_playAnnouncementForIncomingCallIfNecessary;
- (void)_playDowntimeStartingAnnouncementForCallIfNecessary;
- (void)_updateAudioInterruptionsForCall:(id)a3;
- (void)dealloc;
- (void)handleCommunicationPolicyChangedNotification;
- (void)handlePHRingtoneControllerAudioSessionIdentifierDidChangeNotification:(id)a3;
@end

@implementation PHAudioInterruptionController

+ (id)sharedInstance
{
  if (qword_100325DD0 != -1) {
    dispatch_once(&qword_100325DD0, &stru_1002CDE40);
  }
  v2 = (void *)qword_100325DC8;

  return v2;
}

- (PHAudioInterruptionController)init
{
  v15.receiver = self;
  v15.super_class = (Class)PHAudioInterruptionController;
  v2 = [(PHAudioInterruptionController *)&v15 init];
  if (v2)
  {
    v3 = objc_alloc_init(PHRingtoneController);
    ringtoneController = v2->_ringtoneController;
    v2->_ringtoneController = v3;

    v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:v2 selector:"_callStatusChanged:" name:TUCallCenterCallStatusChangedNotification object:0];
    [v5 addObserver:v2 selector:"_callShouldSuppressRingtoneChanged:" name:TUCallShouldSuppressRingingChangedNotification object:0];
    [v5 addObserver:v2 selector:"handlePHRingtoneControllerAudioSessionIdentifierDidChangeNotification:" name:@"PHRingtoneControllerAudioSessionIdentifierDidChangeNotification" object:v2->_ringtoneController];
    [v5 addObserver:v2 selector:"_callStatusChanged:" name:TUCallCenterVideoCallStatusChangedNotification object:0];
    v6 = sub_1000D5130();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "INTERRUPT: PHAudioInterruptionController Created", buf, 2u);
    }

    v7 = +[TUCallCenter sharedInstance];
    v8 = [v7 frontmostAudioOrVideoCall];

    if (v8)
    {
      v9 = sub_1000D5130();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v8;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "INTERRUPT: ... upon creation there was a current call, updating interruptions for %@", buf, 0xCu);
      }

      [(PHAudioInterruptionController *)v2 _updateAudioInterruptionsForCall:v8];
    }
    int out_token = 0;
    objc_initWeak((id *)buf, v2);
    id v10 = &_dispatch_main_q;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100026508;
    v12[3] = &unk_1002CDE68;
    objc_copyWeak(&v13, (id *)buf);
    notify_register_dispatch("com.apple.ScreenTimeAgent.CommunicationPolicyWarningNotification", &out_token, (dispatch_queue_t)&_dispatch_main_q, v12);

    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)buf);
  }
  return v2;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PHAudioInterruptionController;
  [(PHAudioInterruptionController *)&v4 dealloc];
}

- (void)_callStatusChanged:(id)a3
{
  id v4 = [a3 object];
  [(PHAudioInterruptionController *)self _updateAudioInterruptionsForCall:v4];
}

- (void)handleCommunicationPolicyChangedNotification
{
}

- (void)handlePHRingtoneControllerAudioSessionIdentifierDidChangeNotification:(id)a3
{
  id v4 = a3;
  v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412546;
    v7 = self;
    __int16 v8 = 2112;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ is handling %@", (uint8_t *)&v6, 0x16u);
  }

  [(PHAudioInterruptionController *)self _playAnnouncementForIncomingCallIfNecessary];
}

- (void)_updateAudioInterruptionsForCall:(id)a3
{
  id v4 = a3;
  v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = [v4 status];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "INTERRUPT: Call Status changing to: %d", (uint8_t *)v7, 8u);
  }

  int v6 = [(PHAudioInterruptionController *)self ringtoneController];
  [v6 stopAnnouncement];

  if ([v4 status] == 4) {
    [(PHAudioInterruptionController *)self _playAnnouncementForIncomingCallIfNecessary];
  }
}

- (void)_callShouldSuppressRingtoneChanged:(id)a3
{
  id v4 = [a3 object];
  v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    __int16 v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "INTERRUPT: shouldSuppressRingtoneChanged notification for call: %@", (uint8_t *)&v7, 0xCu);
  }

  if (v4 && [v4 status] == 4)
  {
    if ([v4 shouldSuppressRingtone])
    {
      int v6 = [(PHAudioInterruptionController *)self ringtoneController];
      [v6 stopAnnouncement];
    }
    else
    {
      [(PHAudioInterruptionController *)self _playAnnouncementForIncomingCallIfNecessary];
    }
  }
}

- (void)_playAnnouncementForIncomingCallIfNecessary
{
  v3 = +[TUCallCenter sharedInstance];
  id v4 = [v3 incomingCall];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    int v7 = +[TUCallCenter sharedInstance];
    id v6 = [v7 incomingVideoCall];
  }
  __int16 v8 = +[TUCallCenter sharedInstance];
  id v9 = [v8 displayedAudioAndVideoCalls];
  id v10 = [v9 firstObject];

  v11 = sub_1000D5130();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412290;
    *(void *)v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "INTERRUPT: incomingCall: %@", (uint8_t *)&v17, 0xCu);
  }

  if (v10
    || !v6
    || ([v6 shouldSuppressRingtone] & 1) != 0
    || ([v6 announceProviderIdentifier],
        v12 = objc_claimAutoreleasedReturnValue(),
        unsigned int v13 = [v12 isEqualToString:TUBundleIdentifierInCallServiceApplication],
        v12,
        !v13))
  {
    objc_super v15 = sub_1000D5130();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v16 = [v6 shouldSuppressRingtone];
      int v17 = 67109632;
      *(_DWORD *)v18 = v6 == 0;
      *(_WORD *)&v18[4] = 1024;
      *(_DWORD *)&v18[6] = v10 != 0;
      __int16 v19 = 1024;
      unsigned int v20 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Not playing call announcement since incomingCall is nil (%d) or activeCalls is non-nil (%d) or incomingCall shouldSuppressRingtone (%d)", (uint8_t *)&v17, 0x14u);
    }
  }
  else
  {
    v14 = sub_1000D5130();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      *(void *)v18 = v6;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Playing call announcement for incoming call %@", (uint8_t *)&v17, 0xCu);
    }

    objc_super v15 = [(PHAudioInterruptionController *)self ringtoneController];
    [v15 playAnnouncementForCall:v6];
  }
}

- (void)_playDowntimeStartingAnnouncementForCallIfNecessary
{
  v3 = +[TUCallCenter sharedInstance];
  id v4 = [v3 displayedAudioAndVideoCalls];
  v5 = [v4 firstObject];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    __int16 v8 = +[TUCallCenter sharedInstance];
    id v7 = [v8 frontmostAudioOrVideoCall];
  }
  id v9 = [(PHAudioInterruptionController *)self handlesForCall:v7];
  id v10 = [(PHAudioInterruptionController *)self bundleIdentifierForCall:v7];
  if ([v9 count] && objc_msgSend(v10, "length"))
  {
    v11 = +[TUCallCenter sharedInstance];
    v12 = [v11 callFilterController];
    unsigned int v13 = [v12 willRestrictAddresses:v9 forBundleIdentifier:v10];

    v14 = +[TUCallCenter sharedInstance];
    objc_super v15 = [v14 routeController];
    unsigned int v16 = [v15 pickedRoute];
    unsigned int v17 = [v16 isSpeaker];

    v18 = +[TUCallCenter sharedInstance];
    id v19 = [v18 countOfCallsPassingTest:&stru_1002CDEA8];

    unsigned int v20 = sub_1000D5130();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
    if (!v7 || !v13 || (v17 & 1) != 0 || v19)
    {
      if (v21)
      {
        int v22 = 67109634;
        *(_DWORD *)v23 = v13;
        *(_WORD *)&v23[4] = 1024;
        *(_DWORD *)&v23[6] = v17 ^ 1;
        __int16 v24 = 2112;
        id v25 = v7;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Not playing downtime starting alert: callWillEndDuringDowntime: %d currentRouteIsNotSpeaker: %d call: %@", (uint8_t *)&v22, 0x18u);
      }
    }
    else
    {
      if (v21)
      {
        int v22 = 138412290;
        *(void *)v23 = v7;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Playing downtime starting alert for call %@", (uint8_t *)&v22, 0xCu);
      }

      unsigned int v20 = [(PHAudioInterruptionController *)self ringtoneController];
      [v20 playDowntimeStartingAnnouncementForCall:v7];
    }
  }
}

- (id)handlesForCall:(id)a3
{
  id v3 = a3;
  id v4 = [v3 remoteParticipantHandles];
  v5 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v4 count]);

  if ([v3 isConversation])
  {
    id v6 = +[TUCallCenter sharedInstance];
    id v31 = v3;
    id v7 = [v6 activeConversationForCall:v3];

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    v30 = v7;
    __int16 v8 = [v7 activeRemoteParticipants];
    id v9 = [v8 countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v37;
      v12 = (void *)TUCallFilterUnknownCallerAddress;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v37 != v11) {
            objc_enumerationMutation(v8);
          }
          v14 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          objc_super v15 = [v14 handle];
          unsigned int v16 = [v15 value];
          if ([v16 length])
          {
            unsigned int v17 = [v14 handle];
            id v18 = [v17 value];
          }
          else
          {
            id v18 = v12;
          }

          [v5 addObject:v18];
        }
        id v10 = [v8 countByEnumeratingWithState:&v36 objects:v41 count:16];
      }
      while (v10);
    }

    id v3 = v31;
  }
  if (![v5 count])
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v19 = [v3 remoteParticipantHandles];
    id v20 = [v19 countByEnumeratingWithState:&v32 objects:v40 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v33;
      v23 = (void *)TUCallFilterUnknownCallerAddress;
      do
      {
        for (j = 0; j != v21; j = (char *)j + 1)
        {
          if (*(void *)v33 != v22) {
            objc_enumerationMutation(v19);
          }
          id v25 = *(void **)(*((void *)&v32 + 1) + 8 * (void)j);
          v26 = [v25 value];
          if ([v26 length])
          {
            id v27 = [v25 value];
          }
          else
          {
            id v27 = v23;
          }
          v28 = v27;

          [v5 addObject:v28];
        }
        id v21 = [v19 countByEnumeratingWithState:&v32 objects:v40 count:16];
      }
      while (v21);
    }
  }

  return v5;
}

- (id)bundleIdentifierForCall:(id)a3
{
  id v3 = a3;
  id v4 = [v3 provider];
  unsigned int v5 = [v4 isTelephonyProvider];

  if (v5)
  {
    id v6 = TUBundleIdentifierMobilePhoneApplication;
LABEL_5:
    id v9 = v6;
    goto LABEL_7;
  }
  id v7 = [v3 provider];
  unsigned int v8 = [v7 isFaceTimeProvider];

  if (v8)
  {
    TUPreferredFaceTimeBundleIdentifier();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  id v10 = [v3 provider];
  id v9 = [v10 bundleIdentifier];

LABEL_7:

  return v9;
}

- (PHRingtoneController)ringtoneController
{
  return self->_ringtoneController;
}

- (void).cxx_destruct
{
}

@end