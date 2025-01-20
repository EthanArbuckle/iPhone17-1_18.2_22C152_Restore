id PHDefaultLog()
{
  void *v0;
  uint64_t vars8;

  if (qword_100069568 != -1) {
    dispatch_once(&qword_100069568, &stru_10005D2A0);
  }
  v0 = (void *)qword_100069560;

  return v0;
}

void sub_100004050(id a1)
{
  qword_100069560 = (uint64_t)os_log_create("com.apple.calls.mobilephone", "Default");

  _objc_release_x1();
}

id RTTUIUtilitiesClass()
{
  if (qword_100069578 != -1) {
    dispatch_once(&qword_100069578, &stru_10005D2C0);
  }
  v0 = (void *)qword_100069570;

  return v0;
}

void sub_1000040E8(id a1)
{
  qword_100069570 = CUTWeakLinkClass();
  if (!qword_100069570)
  {
    v1 = PHDefaultLog();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v2 = 0;
      _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "[WARN] Could not find class RTTUIUtilities; RTTUI.framework may have failed to link.",
        v2,
        2u);
    }
  }
}

void sub_100004960(uint64_t a1, int a2)
{
  if (a2 && !*(unsigned char *)(a1 + 40))
  {
    id v2 = [*(id *)(a1 + 32) contentUnavailableView];
    [v2 setHidden:1];
    [v2 removeFromSuperview];
  }
}

void sub_1000049C8(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) contentUnavailableView];
  if (*(unsigned char *)(a1 + 40))
  {
    id v2 = [*(id *)(a1 + 32) view];
    [v2 addSubview:v4];

    v3 = [*(id *)(a1 + 32) view];
    [v3 bringSubviewToFront:v4];

    [v4 setAlpha:1.0];
    [v4 setHidden:0];
  }
  else
  {
    [v4 setAlpha:0.0];
  }
}

void sub_100005620(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000564C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = PHDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Retrieved voicemail message (%@).", buf, 0xCu);
    }

    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100005780;
    v6[3] = &unk_10005D360;
    v6[4] = WeakRetained;
    id v7 = v3;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
  }
}

id sub_100005780(uint64_t a1)
{
  [*(id *)(a1 + 32) setVoicemailMessage:*(void *)(a1 + 40)];
  id v2 = *(void **)(a1 + 32);

  return [v2 reloadData];
}

uint64_t sub_100005C68(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100007778(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    if ([WeakRetained shouldHandleVoicemailChanges]) {
      [v3 handleVoicemailManagerVoicemailsDidChange];
    }
  }

  return _objc_release_x1();
}

void sub_100007D80(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) voicemailMessage];

  if (v2)
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = [v3 voicemailMessage];
    id v6 = [v3 localizedSubtitleForMessage:v4];

    v5 = [*(id *)(a1 + 32) messageView];
    [v5 setLocalizedSubheadline:v6];
  }
}

void sub_100008668(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000868C(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained setVoicemailMessage:v5];
  }
}

float PHVoicemailLowQualityConfidenceThresholdForTranscript()
{
  v0 = PHPreferencesGetValue(@"VoicemailTranscriptionLowQualityConfidenceThreshold");
  v1 = v0;
  if (v0)
  {
    [v0 floatValue];
    float v3 = v2;
  }
  else
  {
    float v3 = 0.6878;
  }

  return v3;
}

float PHVoicemailConfidenceThresholdForTranscript()
{
  v0 = PHPreferencesGetValue(@"VoicemailTranscriptionConfidenceThreshold");
  v1 = v0;
  if (v0)
  {
    [v0 floatValue];
    float v3 = v2;
  }
  else
  {
    float v3 = 0.45096;
  }

  return v3;
}

id PHVoicemailTranscriptAttributedPrefix()
{
  if (qword_100069588 != -1) {
    dispatch_once(&qword_100069588, &stru_10005D440);
  }
  v0 = (void *)qword_100069580;

  return v0;
}

void sub_1000099D0(id a1)
{
  id v1 = [UIApp userInterfaceLayoutDirection];
  float v2 = +[NSBundle mainBundle];
  float v3 = v2;
  if (v1 == (id)1) {
    CFStringRef v4 = @"VOICEMAIL_TRANSCRIPTION_QUOTE_SUFFIX";
  }
  else {
    CFStringRef v4 = @"VOICEMAIL_TRANSCRIPTION_QUOTE_PREFIX";
  }
  id v5 = [v2 localizedStringForKey:v4 value:&stru_10005E8B0 table:@"General"];

  id v6 = objc_alloc((Class)NSAttributedString);
  v12[0] = NSForegroundColorAttributeName;
  id v7 = +[UIColor colorWithRed:0.572549045 green:0.572549045 blue:0.572549045 alpha:1.0];
  v13[0] = v7;
  v12[1] = NSFontAttributeName;
  v8 = +[UIFont phPreferredTightLeadingFontForTextStyle:UIFontTextStyleBody];
  v13[1] = v8;
  id v9 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
  id v10 = [v6 initWithString:v5 attributes:v9];
  v11 = (void *)qword_100069580;
  qword_100069580 = (uint64_t)v10;
}

id PHVoicemailTranscriptAttributedSuffix()
{
  if (qword_100069598 != -1) {
    dispatch_once(&qword_100069598, &stru_10005D460);
  }
  v0 = (void *)qword_100069590;

  return v0;
}

void sub_100009BB4(id a1)
{
  id v1 = [UIApp userInterfaceLayoutDirection];
  float v2 = +[NSBundle mainBundle];
  float v3 = v2;
  if (v1 == (id)1) {
    CFStringRef v4 = @"VOICEMAIL_TRANSCRIPTION_QUOTE_PREFIX";
  }
  else {
    CFStringRef v4 = @"VOICEMAIL_TRANSCRIPTION_QUOTE_SUFFIX";
  }
  id v5 = [v2 localizedStringForKey:v4 value:&stru_10005E8B0 table:@"General"];

  id v6 = objc_alloc((Class)NSAttributedString);
  v12[0] = NSForegroundColorAttributeName;
  id v7 = +[UIColor colorWithRed:0.572549045 green:0.572549045 blue:0.572549045 alpha:1.0];
  v13[0] = v7;
  v12[1] = NSFontAttributeName;
  v8 = +[UIFont phPreferredTightLeadingFontForTextStyle:UIFontTextStyleBody];
  v13[1] = v8;
  id v9 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
  id v10 = [v6 initWithString:v5 attributes:v9];
  v11 = (void *)qword_100069590;
  qword_100069590 = (uint64_t)v10;
}

uint64_t PHVoicemailFeedbackReportingAvailable()
{
  return 0;
}

id PHPreferencesGetValue(void *a1)
{
  return PHPreferencesGetValueInDomain(a1, 0);
}

id PHPreferencesGetValueInDomain(void *a1, void *a2)
{
  float v3 = a1;
  CFStringRef v4 = a2;
  if (!v4)
  {
    id v5 = +[NSBundle mainBundle];
    CFStringRef v4 = [v5 bundleIdentifier];
  }
  if ([(__CFString *)v3 length] && [(__CFString *)v4 length]) {
    id v6 = (void *)CFPreferencesCopyValue(v3, v4, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
  }
  else {
    id v6 = 0;
  }

  return v6;
}

UIFont *__cdecl sub_10000EDE0(UIFont *self, SEL a2)
{
  UIFontDescriptorAttributeName v13 = UIFontDescriptorFeatureSettingsAttribute;
  v10[0] = UIFontFeatureTypeIdentifierKey;
  v10[1] = UIFontFeatureSelectorIdentifierKey;
  v11[0] = &off_10005F148;
  v11[1] = &off_10005F160;
  float v3 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
  v12 = v3;
  CFStringRef v4 = +[NSArray arrayWithObjects:&v12 count:1];
  v14 = v4;
  id v5 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];

  id v6 = [(UIFont *)self fontDescriptor];
  id v7 = [v6 fontDescriptorByAddingAttributes:v5];

  v8 = +[UIFont fontWithDescriptor:v7 size:0.0];

  return (UIFont *)v8;
}

void sub_1000119FC(id a1)
{
  qword_1000695A0 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleHeadline addingSymbolicTraits:0x8000 options:0];

  _objc_release_x1();
}

void sub_100011AA4(id a1)
{
  qword_1000695B0 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleCaption2 addingSymbolicTraits:0x8000 options:0];

  _objc_release_x1();
}

void sub_100011D08(id *a1)
{
  float v2 = a1 + 5;
  objc_copyWeak(&to, a1 + 5);
  id v3 = objc_loadWeakRetained(&to);

  if (v3)
  {
    CFStringRef v4 = [a1[6] sharedUtilityProvider];
    id v5 = [a1[4] UUIDString];
    id v6 = [v4 conversationForCallUID:v5];

    if (v6)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100011EA0;
      block[3] = &unk_10005D4C8;
      objc_copyWeak(&v10, v2);
      id v6 = v6;
      v8 = v6;
      id v9 = a1[4];
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

      objc_destroyWeak(&v10);
    }
  }
  else
  {
    id v6 = PHDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Stopped fetchRTTConversationForCallUUID because MPRTTTranscriptionMessage was deallocated before starting", buf, 2u);
    }
  }

  objc_destroyWeak(&to);
}

void sub_100011E88(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_100011EA0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained setConversation:*(void *)(a1 + 32)];
    CFStringRef v4 = PHDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Successfully finished fetchRTTConversationForCallUUID", v8, 2u);
    }

    id v5 = +[NSNotificationCenter defaultCenter];
    CFStringRef v9 = @"MPVoicemailRTTTranscriptDidLoadCallIDKey";
    id v6 = [*(id *)(a1 + 40) UUIDString];
    id v10 = v6;
    id v7 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
    [v5 postNotificationName:@"MPVoicemailRTTTranscriptDidLoadNotification" object:0 userInfo:v7];
  }
  else
  {
    id v5 = PHDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Stopped fetchRTTConversationForCallUUID because MPRTTTranscriptionMessage was deallocated when trying to write conversation", v8, 2u);
    }
  }
}

void sub_10001233C(id a1)
{
  qword_1000695C8 = (uint64_t)dispatch_queue_create("VMPlayerControllerAudioSessionQueue", 0);

  _objc_release_x1();
}

void sub_1000127DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100012808(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    float v2 = [WeakRetained delegate];
    char v3 = objc_opt_respondsToSelector();

    id WeakRetained = v5;
    if (v3)
    {
      CFStringRef v4 = [v5 delegate];
      [v5 currentTime];
      [v4 playerController:didChangeToCurrentTime:v5];

      id WeakRetained = v5;
    }
  }
}

void sub_100012F04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_100012F28(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    CFStringRef v4 = WeakRetained;
    if ([WeakRetained isAudioSessionActive])
    {
      float v2 = [v4 player];
      [v2 play];
    }
  }

  return _objc_release_x1();
}

void sub_10001386C(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000138F4;
  v2[3] = &unk_10005D568;
  uint64_t v1 = *(void **)(a1 + 40);
  v2[4] = *(void *)(a1 + 32);
  id v3 = v1;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
}

id sub_1000138F4(uint64_t a1)
{
  return [*(id *)(a1 + 32) activateAudioSessionIfNeededWithCompletion:*(void *)(a1 + 40)];
}

void sub_100013A54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_100013A70(uint64_t a1)
{
  float v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));

  if (WeakRetained)
  {
    CFStringRef v4 = *(id *)(a1 + 32);
    id v5 = +[AVAudioSession sharedInstance];
    id v6 = v5;
    if (v5)
    {
      -[NSObject setAudioSessionState:](v4, "setAudioSessionState:", [v5 deactivateVoicemailAudioSession]);
      [v4 updateAudioSessionNotifications];
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_100013BCC;
      v22[3] = &unk_10005D590;
      objc_copyWeak(&v23, v2);
      v22[4] = *(void *)(a1 + 32);
      dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v22);
      objc_destroyWeak(&v23);
    }
    else
    {
      v14 = PHDefaultLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_100041148(v14, v15, v16, v17, v18, v19, v20, v21);
      }
    }
  }
  else
  {
    CFStringRef v4 = PHDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100041110(v4, v7, v8, v9, v10, v11, v12, v13);
    }
  }
}

void sub_100013BCC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));

  if (WeakRetained)
  {
    id v3 = *(void **)(a1 + 32);
    [v3 updateProximityMonitoring];
  }
  else
  {
    CFStringRef v4 = PHDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100041180(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
}

void sub_1000142B8(uint64_t a1)
{
  float v2 = vm_ui_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v11 = 138412546;
    uint64_t v12 = v3;
    __int16 v13 = 2112;
    uint64_t v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%@ is handling <%@>", (uint8_t *)&v11, 0x16u);
  }

  uint64_t v5 = [*(id *)(a1 + 40) userInfo];
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 objectForKeyedSubscript:AVAudioSessionInterruptionTypeKey];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = [v7 unsignedIntegerValue];
      if (v8 == (id)1)
      {
        [*(id *)(a1 + 32) pause];
        [*(id *)(a1 + 32) deactivateAudioSession];
      }
      else if (!v8)
      {
        uint64_t v9 = [v6 objectForKeyedSubscript:AVAudioSessionInterruptionOptionKey];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v10 = [v9 unsignedIntegerValue];

          if (v10 == (id)1) {
            [*(id *)(a1 + 32) play];
          }
        }
        else
        {
        }
      }
    }
  }
}

void sub_1000144E4(uint64_t a1)
{
  float v2 = vm_ui_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v8 = 138412546;
    uint64_t v9 = v3;
    __int16 v10 = 2112;
    uint64_t v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%@ is handling <%@>", (uint8_t *)&v8, 0x16u);
  }

  uint64_t v5 = [*(id *)(a1 + 40) userInfo];
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 objectForKeyedSubscript:AVAudioSessionRouteChangeReasonKey];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (char *)[v7 unsignedIntegerValue] - 1 <= (char *)3) {
      [*(id *)(a1 + 32) updateProximityMonitoring];
    }
  }
}

id sub_1000146A0(uint64_t a1)
{
  float v2 = vm_ui_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 138412546;
    uint64_t v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%@ is handling <%@>", (uint8_t *)&v6, 0x16u);
  }

  return [*(id *)(a1 + 32) stop];
}

void sub_1000147EC(uint64_t a1)
{
  float v2 = vm_ui_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v8 = 138412546;
    uint64_t v9 = v3;
    __int16 v10 = 2112;
    uint64_t v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%@ is handling <%@>", (uint8_t *)&v8, 0x16u);
  }

  uint64_t v5 = [*(id *)(a1 + 32) delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    uint64_t v7 = [*(id *)(a1 + 32) delegate];
    [v7 playerControllerDidReset:*(void *)(a1 + 32)];
  }
}

void sub_10001497C(uint64_t a1)
{
  float v2 = vm_ui_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v8 = 138412546;
    uint64_t v9 = v3;
    __int16 v10 = 2112;
    uint64_t v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%@ is handling <%@>", (uint8_t *)&v8, 0x16u);
  }

  uint64_t v5 = [*(id *)(a1 + 40) object];
  if (v5)
  {
    char v6 = [*(id *)(a1 + 32) player];
    uint64_t v7 = [v6 currentItem];

    if (v5 == v7) {
      [*(id *)(a1 + 32) stop];
    }
  }
}

id sub_100014B14(uint64_t a1)
{
  float v2 = vm_ui_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v8 = 138412546;
    uint64_t v9 = v3;
    __int16 v10 = 2112;
    uint64_t v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%@ is handling <%@>", (uint8_t *)&v8, 0x16u);
  }

  id result = [*(id *)(a1 + 32) isAudioSessionActive];
  if (result)
  {
    char v6 = +[UIDevice currentDevice];
    unsigned int v7 = [v6 proximityState];

    id result = [*(id *)(a1 + 32) timeControlStatus];
    if ((unint64_t)result >= 2)
    {
      if (result == (id)2 && (v7 & 1) == 0) {
        return [*(id *)(a1 + 32) pause];
      }
    }
    else if (v7)
    {
      return [*(id *)(a1 + 32) play];
    }
  }
  return result;
}

void sub_100014CBC(uint64_t a1)
{
  float v2 = vm_ui_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v13 = 138412546;
    uint64_t v14 = v3;
    __int16 v15 = 2112;
    uint64_t v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%@ is handling <%@>", (uint8_t *)&v13, 0x16u);
  }

  uint64_t v5 = [*(id *)(a1 + 40) object];
  if (v5)
  {
    char v6 = [*(id *)(a1 + 32) player];
    unsigned int v7 = [v6 currentItem];

    if (v5 == v7)
    {
      int v8 = [*(id *)(a1 + 40) userInfo];
      uint64_t v9 = v8;
      if (v8)
      {
        __int16 v10 = [v8 objectForKeyedSubscript:AVPlayerItemFailedToPlayToEndTimeErrorKey];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v11 = v10;
          if (v11)
          {
            uint64_t v12 = vm_ui_log();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
              sub_1000411B8((uint64_t)v11, v12);
            }
          }
        }
      }
      [*(id *)(a1 + 32) stop];
    }
  }
}

void sub_100014F3C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100016560(id a1)
{
  qword_1000695D0 = +[UIImage tpImageForSymbolType:26 textStyle:UIFontTextStyleBody scale:3 isStaticSize:0];

  _objc_release_x1();
}

void sub_10001660C(id a1)
{
  qword_1000695E0 = +[UIImage tpImageForSymbolType:25 textStyle:UIFontTextStyleBody scale:3 isStaticSize:0];

  _objc_release_x1();
}

void sub_1000166B8(id a1)
{
  id v3 = +[UIFont preferredFontForTextStyle:UIFontTextStyleFootnote];
  uint64_t v1 = [v3 withCaseSensitiveAttribute];
  float v2 = (void *)qword_1000695F0;
  qword_1000695F0 = v1;
}

void sub_100016774(id a1)
{
  id v3 = +[UIFontDescriptor voicemailHeadlineShortFontDescriptor];
  uint64_t v1 = +[UIFont fontWithDescriptor:v3 size:0.0];
  float v2 = (void *)qword_100069600;
  qword_100069600 = v1;
}

void sub_100016840(id a1)
{
  id v4 = +[UIFontDescriptor voicemailCaptionRegularFontDescriptor];
  uint64_t v1 = +[UIFont fontWithDescriptor:v4 size:0.0];
  uint64_t v2 = [v1 withCaseSensitiveAttribute];
  id v3 = (void *)qword_100069610;
  qword_100069610 = v2;
}

uint64_t sub_100016A28()
{
  uint64_t v0 = sub_100041960();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  id v3 = (char *)v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100041970();
  __chkstk_darwin();
  sub_100041710();
  __chkstk_darwin();
  sub_100016EF4();
  sub_100041700();
  v5[1] = &_swiftEmptyArrayStorage;
  sub_100016F34(&qword_100068540, 255, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue_serial.Attributes);
  sub_100016F7C(&qword_100068548);
  sub_100016FC0();
  sub_100041A10();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for OS_dispatch_queue.AutoreleaseFrequency.workItem(_:), v0);
  uint64_t result = sub_100041980();
  qword_10006A230 = result;
  return result;
}

uint64_t sub_100016C80()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for VoicemailActor()
{
  return self;
}

uint64_t sub_100016CB4()
{
  if (qword_100068430 != -1) {
    swift_once();
  }
  return sub_100041990();
}

uint64_t sub_100016D0C()
{
  return swift_initStaticObject();
}

uint64_t sub_100016D1C()
{
  return static GlobalActor.sharedUnownedExecutor.getter(v0);
}

id sub_100016D64()
{
  if (qword_100068430 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_10006A230;
  qword_10006A238 = qword_10006A230;

  return v0;
}

id sub_100016DEC(uint64_t a1, uint64_t a2, void *a3, void **a4)
{
  if (*a3 != -1) {
    swift_once();
  }
  uint64_t v5 = *a4;

  return v5;
}

id sub_100016E3C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for VoicemailQueueManager();
  [super dealloc];
}

uint64_t type metadata accessor for VoicemailQueueManager()
{
  return self;
}

void type metadata accessor for VMTranscriptConfidenceRating(uint64_t a1)
{
}

uint64_t sub_100016EAC(uint64_t a1, uint64_t a2)
{
  return sub_100016F34((unint64_t *)&qword_100068530, a2, (void (*)(uint64_t))type metadata accessor for VoicemailActor);
}

unint64_t sub_100016EF4()
{
  unint64_t result = qword_100068538;
  if (!qword_100068538)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100068538);
  }
  return result;
}

uint64_t sub_100016F34(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a3(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100016F7C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100016FC0()
{
  unint64_t result = qword_100068550;
  if (!qword_100068550)
  {
    sub_10001701C(&qword_100068548);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100068550);
  }
  return result;
}

uint64_t sub_10001701C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

void type metadata accessor for Name(uint64_t a1)
{
}

void sub_100017078(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_1000170C0(uint64_t a1, uint64_t a2)
{
  return sub_1000173FC(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_1000170D8(uint64_t a1, id *a2)
{
  uint64_t result = sub_100041750();
  *a2 = 0;
  return result;
}

uint64_t sub_100017150(uint64_t a1, id *a2)
{
  char v3 = sub_100041760();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_1000171D0@<X0>(void *a1@<X8>)
{
  sub_100041770();
  NSString v2 = sub_100041740();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_100017214@<X0>(void *a1@<X8>)
{
  NSString v2 = sub_100041740();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_10001725C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100041770();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100017288(uint64_t a1)
{
  uint64_t v2 = sub_100016F34(&qword_100068578, 255, type metadata accessor for Name);
  uint64_t v3 = sub_100016F34((unint64_t *)&unk_100068580, 255, type metadata accessor for Name);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_10001734C()
{
  return sub_100016F34(&qword_100068560, 255, type metadata accessor for Name);
}

uint64_t sub_100017398()
{
  return sub_100016F34(&qword_100068568, 255, type metadata accessor for Name);
}

uint64_t sub_1000173E4(uint64_t a1, uint64_t a2)
{
  return sub_1000173FC(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_1000173FC(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_100041770();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_100017440()
{
  sub_100041770();
  sub_1000417A0();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100017494()
{
  sub_100041770();
  sub_100041CC0();
  sub_1000417A0();
  Swift::Int v0 = sub_100041CE0();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_100017508()
{
  uint64_t v0 = sub_100041770();
  uint64_t v2 = v1;
  if (v0 == sub_100041770() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_100041C40();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_100017594()
{
  return sub_100016F34(&qword_100068570, 255, type metadata accessor for Name);
}

id sub_1000177CC()
{
  return sub_100018568(type metadata accessor for VisualTranscriptionMessage);
}

uint64_t type metadata accessor for VisualTranscriptionMessage()
{
  return self;
}

id sub_100017B18(char *a1, uint64_t a2, SEL *a3)
{
  uint64_t v4 = *(void **)&a1[OBJC_IVAR___MPVisualMessage_vmMessage];
  char v5 = a1;
  id v6 = [v4 *a3];
  if (v6)
  {
    unsigned int v7 = v6;
    sub_100041770();

    NSString v8 = sub_100041740();
    swift_bridgeObjectRelease();
  }
  else
  {

    NSString v8 = 0;
  }

  return v8;
}

id sub_1000180C0(char *a1, uint64_t a2, void *a3, void *a4, uint64_t (*a5)(void))
{
  *(void *)&a1[*a4] = a3;
  v8.receiver = a1;
  v8.super_class = (Class)a5();
  id v6 = a3;
  return [super init];
}

uint64_t sub_100018134(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_100041BA0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v3 = &_swiftEmptyArrayStorage;
  if (!v2) {
    return (uint64_t)v3;
  }
  uint64_t v12 = &_swiftEmptyArrayStorage;
  uint64_t result = sub_100036704(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      uint64_t v5 = 0;
      uint64_t v3 = v12;
      do
      {
        sub_100041AE0();
        sub_100016F7C(&qword_1000687D0);
        swift_dynamicCast();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_100036704(0, v3[2] + 1, 1);
          uint64_t v3 = v12;
        }
        unint64_t v7 = v3[2];
        unint64_t v6 = v3[3];
        if (v7 >= v6 >> 1)
        {
          sub_100036704(v6 > 1, v7 + 1, 1);
          uint64_t v3 = v12;
        }
        ++v5;
        v3[2] = v7 + 1;
        sub_1000185D4(v11, &v3[4 * v7 + 4]);
      }
      while (v2 != v5);
    }
    else
    {
      unint64_t v8 = a1 + 32;
      uint64_t v3 = v12;
      do
      {
        swift_unknownObjectRetain();
        sub_100016F7C(&qword_1000687D0);
        swift_dynamicCast();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_100036704(0, v3[2] + 1, 1);
          uint64_t v3 = v12;
        }
        unint64_t v10 = v3[2];
        unint64_t v9 = v3[3];
        if (v10 >= v9 >> 1)
        {
          sub_100036704(v9 > 1, v10 + 1, 1);
          uint64_t v3 = v12;
        }
        v3[2] = v10 + 1;
        sub_1000185D4(v11, &v3[4 * v10 + 4]);
        v8 += 8;
        --v2;
      }
      while (v2);
    }
    return (uint64_t)v3;
  }
  __break(1u);
  return result;
}

id sub_100018550()
{
  return sub_100018568(type metadata accessor for VisualMessage);
}

id sub_100018568(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return [super dealloc];
}

uint64_t type metadata accessor for VisualMessage()
{
  return self;
}

_OWORD *sub_1000185D4(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t initializeBufferWithCopyOfBuffer for VoicemailManagerMessageChanges(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for VoicemailManagerMessageChanges()
{
  return swift_bridgeObjectRelease();
}

uint64_t assignWithCopy for VoicemailManagerMessageChanges(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for VoicemailManagerMessageChanges(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)uint64_t result = v2;
  return result;
}

uint64_t assignWithTake for VoicemailManagerMessageChanges(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for VoicemailManagerMessageChanges(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFD && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 253);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 3) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for VoicemailManagerMessageChanges(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)uint64_t result = a2 - 253;
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 9) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFD) {
      *(unsigned char *)(result + 9) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 8) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_100018744(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 8) <= 2u) {
    return *(unsigned __int8 *)(a1 + 8);
  }
  else {
    return (*(_DWORD *)a1 + 3);
  }
}

uint64_t sub_100018760(uint64_t result, unsigned int a2)
{
  if (a2 >= 3)
  {
    *(void *)uint64_t result = a2 - 3;
    LOBYTE(a2) = 3;
  }
  *(unsigned char *)(result + 8) = a2;
  return result;
}

ValueMetadata *type metadata accessor for VoicemailManagerMessageChanges()
{
  return &type metadata for VoicemailManagerMessageChanges;
}

unint64_t sub_100018788(uint64_t a1, char a2)
{
  unint64_t result = 0xD000000000000025;
  switch(a2)
  {
    case 1:
      sub_100041AC0(43);
      swift_bridgeObjectRelease();
      unint64_t v3 = 0xD000000000000028;
      goto LABEL_5;
    case 2:
      sub_100041AC0(42);
      swift_bridgeObjectRelease();
      unint64_t v3 = 0xD000000000000027;
LABEL_5:
      sub_100016F7C(&qword_1000687E0);
      goto LABEL_6;
    case 3:
      return result;
    default:
      sub_100041AC0(42);
      swift_bridgeObjectRelease();
      unint64_t v3 = 0xD000000000000027;
      type metadata accessor for MessageID(0);
LABEL_6:
      v4._countAndFlagsBits = sub_100041800();
      sub_1000417B0(v4);
      swift_bridgeObjectRelease();
      v5._countAndFlagsBits = 41;
      v5._object = (void *)0xE100000000000000;
      sub_1000417B0(v5);
      return v3;
  }
}

unint64_t sub_1000188F0()
{
  return sub_100018788(*(void *)v0, *(unsigned char *)(v0 + 8));
}

unint64_t sub_100018908@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = sub_10001A080(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

BOOL sub_10001893C(void *a1, void *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_100018950()
{
  Swift::UInt v1 = *v0;
  sub_100041CC0();
  sub_100041CD0(v1);
  return sub_100041CE0();
}

void sub_100018998()
{
  sub_100041CD0(*v0);
}

Swift::Int sub_1000189C4()
{
  Swift::UInt v1 = *v0;
  sub_100041CC0();
  sub_100041CD0(v1);
  return sub_100041CE0();
}

uint64_t *sub_100018A08@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *result;
  BOOL v3 = (unint64_t)*result > 2;
  if ((unint64_t)*result > 2) {
    uint64_t v2 = 0;
  }
  *(void *)a2 = v2;
  *(unsigned char *)(a2 + 8) = v3;
  return result;
}

void sub_100018A24(void *a1@<X8>)
{
  *a1 = *v1;
}

Swift::Int sub_100018A30()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100041340();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  Swift::String v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for MessageID.Value(0);
  __chkstk_darwin(v6);
  unint64_t v8 = (Swift::UInt *)((char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_100041CC0();
  sub_10001A9F0(v1, (uint64_t)v8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, Swift::UInt *, uint64_t))(v3 + 32))(v5, v8, v2);
    sub_100041CD0(1uLL);
    sub_100019FC8(&qword_1000688E8, (void (*)(uint64_t))&type metadata accessor for UUID);
    sub_100041730();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  else
  {
    Swift::UInt v9 = *v8;
    sub_100041CD0(0);
    sub_100041CD0(v9);
  }
  return sub_100041CE0();
}

BOOL sub_100018C0C(uint64_t a1, uint64_t a2)
{
  return (sub_10001A090(a2, a1) & 1) == 0;
}

BOOL sub_100018C38(uint64_t a1, uint64_t a2)
{
  return (sub_10001A090(a1, a2) & 1) == 0;
}

uint64_t sub_100018C58(uint64_t a1, uint64_t a2)
{
  return sub_10001A090(a2, a1);
}

void sub_100018C6C()
{
  uint64_t v1 = sub_100041340();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = __chkstk_darwin(v1);
  Swift::String v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v7 = (Swift::UInt *)((char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_10001A9F0(v0, (uint64_t)v7);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, Swift::UInt *, uint64_t))(v2 + 32))(v5, v7, v1);
    sub_100041CD0(1uLL);
    sub_100019FC8(&qword_1000688E8, (void (*)(uint64_t))&type metadata accessor for UUID);
    sub_100041730();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
  }
  else
  {
    Swift::UInt v8 = *v7;
    sub_100041CD0(0);
    sub_100041CD0(v8);
  }
}

Swift::Int sub_100018E28()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100041340();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  Swift::UInt v8 = (Swift::UInt *)((char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_100041CC0();
  sub_10001A9F0(v1, (uint64_t)v8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, Swift::UInt *, uint64_t))(v3 + 32))(v6, v8, v2);
    sub_100041CD0(1uLL);
    sub_100019FC8(&qword_1000688E8, (void (*)(uint64_t))&type metadata accessor for UUID);
    sub_100041730();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  }
  else
  {
    Swift::UInt v9 = *v8;
    sub_100041CD0(0);
    sub_100041CD0(v9);
  }
  return sub_100041CE0();
}

uint64_t sub_100019070()
{
  uint64_t v1 = sub_100041340();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for MessageID.Value(0);
  __chkstk_darwin(v5);
  uint64_t v7 = (void *)((char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_10001A9F0(v0 + OBJC_IVAR___MPMessageID_value, (uint64_t)v7);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, void *, uint64_t))(v2 + 32))(v4, v7, v1);
    uint64_t v8 = sub_1000412F0();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  else
  {
    v10[1] = *v7;
    return sub_100041C30();
  }
  return v8;
}

id sub_100019638()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return [super dealloc];
}

uint64_t sub_100019680()
{
  return type metadata accessor for MessageID(0);
}

uint64_t type metadata accessor for MessageID(uint64_t a1)
{
  return sub_100019758(a1, (uint64_t *)&unk_100068810);
}

uint64_t sub_1000196A8()
{
  uint64_t result = type metadata accessor for MessageID.Value(319);
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t type metadata accessor for MessageID.Value(uint64_t a1)
{
  return sub_100019758(a1, qword_100068890);
}

uint64_t sub_100019758(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1000197D0(uint64_t a1)
{
  swift_getObjectType();
  sub_10001AAB0(a1, (uint64_t)v6);
  if (!v7)
  {
    sub_10001AA54((uint64_t)v6, &qword_1000688F0);
    goto LABEL_5;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_5:
    char v3 = 0;
    return v3 & 1;
  }
  char v3 = sub_10001A478((uint64_t)v5 + OBJC_IVAR___MPMessageID_value, v1 + OBJC_IVAR___MPMessageID_value);

  return v3 & 1;
}

ValueMetadata *type metadata accessor for MessageFolder()
{
  return &type metadata for MessageFolder;
}

uint64_t *sub_100019910(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_100041340();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
  }
  return a1;
}

uint64_t sub_100019A0C(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  if (result == 1)
  {
    uint64_t v3 = sub_100041340();
    uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
    return v4(a1, v3);
  }
  return result;
}

void *sub_100019A88(void *a1, const void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_100041340();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

void *sub_100019B40(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_100019C08((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_100041340();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_100019C08(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for MessageID.Value(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *sub_100019C64(void *a1, const void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_100041340();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

void *sub_100019D1C(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_100019C08((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_100041340();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_100019DE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_100019E0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_100019E38()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_100019E48()
{
  uint64_t result = sub_100041340();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t sub_100019EE0()
{
  return sub_100019FC8(&qword_1000688C8, (void (*)(uint64_t))type metadata accessor for MessageID.Value);
}

unint64_t sub_100019F2C()
{
  unint64_t result = qword_1000688D0;
  if (!qword_1000688D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000688D0);
  }
  return result;
}

uint64_t sub_100019F80()
{
  return sub_100019FC8(&qword_1000688D8, (void (*)(uint64_t))type metadata accessor for MessageID);
}

uint64_t sub_100019FC8(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10001A010(uint64_t *a1, uint64_t *a2)
{
  return sub_10001A70C(*a1, *a2);
}

BOOL sub_10001A01C(uint64_t *a1, uint64_t *a2)
{
  return (sub_10001A70C(*a2, *a1) & 1) == 0;
}

BOOL sub_10001A048(uint64_t *a1, uint64_t *a2)
{
  return (sub_10001A70C(*a1, *a2) & 1) == 0;
}

uint64_t sub_10001A070(uint64_t *a1, uint64_t *a2)
{
  return sub_10001A70C(*a2, *a1);
}

unint64_t sub_10001A080(unint64_t result)
{
  if (result > 4) {
    return 0;
  }
  return result;
}

uint64_t sub_10001A090(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100041340();
  uint64_t v40 = *(void *)(v4 - 8);
  uint64_t v41 = v4;
  uint64_t v5 = ((uint64_t (*)(void))__chkstk_darwin)();
  v38 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v39 = (char *)&v37 - v7;
  uint64_t v8 = type metadata accessor for MessageID.Value(0);
  uint64_t v9 = __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v9);
  uint64_t v14 = (char *)&v37 - v13;
  uint64_t v15 = __chkstk_darwin(v12);
  uint64_t v17 = (char *)&v37 - v16;
  __chkstk_darwin(v15);
  uint64_t v19 = (unint64_t *)((char *)&v37 - v18);
  uint64_t v20 = sub_100016F7C(&qword_1000688E0);
  uint64_t v21 = __chkstk_darwin(v20 - 8);
  id v23 = (char *)&v37 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = &v23[*(int *)(v21 + 56)];
  sub_10001A9F0(a1, (uint64_t)v23);
  uint64_t v42 = a2;
  sub_10001A9F0(a2, (uint64_t)v24);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_10001A9F0((uint64_t)v23, (uint64_t)v17);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v26 = v39;
      uint64_t v25 = v40;
      v27 = *(void (**)(char *, char *, uint64_t))(v40 + 32);
      uint64_t v28 = v41;
      v27(v39, v17, v41);
      v29 = v38;
      v27(v38, v24, v28);
      if (sub_100041320())
      {
        v30 = *(void (**)(char *, uint64_t))(v25 + 8);
        v30(v29, v28);
        v30(v26, v28);
LABEL_7:
        sub_100019C08((uint64_t)v23);
        char v32 = 0;
        return v32 & 1;
      }
      char v32 = sub_100041310();
      v35 = *(void (**)(char *, uint64_t))(v25 + 8);
      v35(v29, v28);
      v35(v26, v28);
LABEL_18:
      sub_100019C08((uint64_t)v23);
      return v32 & 1;
    }
    (*(void (**)(char *, uint64_t))(v40 + 8))(v17, v41);
  }
  else
  {
    sub_10001A9F0((uint64_t)v23, (uint64_t)v19);
    unint64_t v31 = *v19;
    if (swift_getEnumCaseMultiPayload() != 1)
    {
      if (v31 == *(void *)v24) {
        goto LABEL_7;
      }
      char v32 = v31 < *(void *)v24;
      goto LABEL_18;
    }
  }
  sub_10001A9F0(a1, (uint64_t)v14);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_100019C08((uint64_t)v14);
    unint64_t v33 = 1;
  }
  else
  {
    unint64_t v33 = 0;
  }
  sub_10001A9F0(v42, (uint64_t)v11);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_100019C08((uint64_t)v11);
    unint64_t v34 = 1;
  }
  else
  {
    unint64_t v34 = 0;
  }
  char v32 = v33 < v34;
  sub_10001AA54((uint64_t)v23, &qword_1000688E0);
  return v32 & 1;
}

uint64_t sub_10001A478(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100041340();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for MessageID.Value(0);
  uint64_t v9 = __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v13 = (uint64_t *)((char *)&v22 - v12);
  uint64_t v14 = sub_100016F7C(&qword_1000688E0);
  uint64_t v15 = __chkstk_darwin(v14 - 8);
  uint64_t v17 = (char *)&v22 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = &v17[*(int *)(v15 + 56)];
  sub_10001A9F0(a1, (uint64_t)v17);
  sub_10001A9F0(a2, (uint64_t)v18);
  if (swift_getEnumCaseMultiPayload() != 1)
  {
    sub_10001A9F0((uint64_t)v17, (uint64_t)v13);
    if (swift_getEnumCaseMultiPayload() != 1)
    {
      char v19 = *v13 == *(void *)v18;
      goto LABEL_6;
    }
LABEL_8:
    sub_10001AA54((uint64_t)v17, &qword_1000688E0);
    char v19 = 0;
    return v19 & 1;
  }
  sub_10001A9F0((uint64_t)v17, (uint64_t)v11);
  if (swift_getEnumCaseMultiPayload() != 1)
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v11, v4);
    goto LABEL_8;
  }
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v18, v4);
  char v19 = sub_100041320();
  uint64_t v20 = *(void (**)(char *, uint64_t))(v5 + 8);
  v20(v7, v4);
  v20(v11, v4);
LABEL_6:
  sub_100019C08((uint64_t)v17);
  return v19 & 1;
}

uint64_t sub_10001A70C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100041340();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v28 - v9;
  uint64_t v11 = type metadata accessor for MessageID.Value(0);
  uint64_t v12 = __chkstk_darwin(v11);
  uint64_t v14 = (uint64_t *)((char *)&v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v28 - v15;
  uint64_t v17 = sub_100016F7C(&qword_1000688E0);
  uint64_t v18 = __chkstk_darwin(v17 - 8);
  uint64_t v20 = (char *)&v28 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = a1 + OBJC_IVAR___MPMessageID_value;
  uint64_t v22 = a2 + OBJC_IVAR___MPMessageID_value;
  id v23 = &v20[*(int *)(v18 + 56)];
  sub_10001A9F0(v21, (uint64_t)v20);
  sub_10001A9F0(v22, (uint64_t)v23);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_10001A9F0((uint64_t)v20, (uint64_t)v16);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v24 = *(void (**)(char *, char *, uint64_t))(v5 + 32);
      v24(v10, v16, v4);
      v24(v8, v23, v4);
      char v25 = sub_100041310();
      v26 = *(void (**)(char *, uint64_t))(v5 + 8);
      v26(v8, v4);
      v26(v10, v4);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v5 + 8))(v16, v4);
      sub_100019C08((uint64_t)v23);
      char v25 = 1;
    }
  }
  else
  {
    sub_10001A9F0((uint64_t)v20, (uint64_t)v14);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      sub_100019C08((uint64_t)v23);
      char v25 = 0;
    }
    else
    {
      char v25 = *v14 < *(void *)v23;
    }
  }
  sub_100019C08((uint64_t)v20);
  return v25 & 1;
}

uint64_t sub_10001A9F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MessageID.Value(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001AA54(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100016F7C(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10001AAB0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100016F7C(&qword_1000688F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

ValueMetadata *type metadata accessor for MessageType()
{
  return &type metadata for MessageType;
}

unint64_t sub_10001AB2C()
{
  unint64_t result = qword_100068900;
  if (!qword_100068900)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100068900);
  }
  return result;
}

uint64_t sub_10001AD58()
{
  return type metadata accessor for FTTranscriptionMessage(0);
}

uint64_t type metadata accessor for FTTranscriptionMessage(uint64_t a1)
{
  return sub_100019758(a1, (uint64_t *)&unk_100068940);
}

uint64_t sub_10001AD80()
{
  uint64_t result = sub_100041670();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

BOOL sub_10001AF64(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_10001AF78()
{
  Swift::UInt v1 = *v0;
  sub_100041CC0();
  sub_100041CD0(v1);
  return sub_100041CE0();
}

void sub_10001AFC0()
{
  sub_100041CD0(*v0);
}

Swift::Int sub_10001AFEC()
{
  Swift::UInt v1 = *v0;
  sub_100041CC0();
  sub_100041CD0(v1);
  return sub_100041CE0();
}

uint64_t sub_10001B400()
{
  LOWORD(result) = sub_100041490();
  if ((unsigned __int16)result < 3u) {
    return (unsigned __int16)result;
  }
  sub_100041AC0(23);
  swift_bridgeObjectRelease();
  sub_100041490();
  sub_100041570();
  v1._countAndFlagsBits = sub_100041790();
  sub_1000417B0(v1);
  swift_bridgeObjectRelease();
  uint64_t result = sub_100041B80();
  __break(1u);
  return result;
}

id sub_10001B5E8(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  swift_retain();
  a4(a3);
  uint64_t v7 = v6;
  swift_release();
  if (v7)
  {
    NSString v8 = sub_100041740();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v8 = 0;
  }

  return v8;
}

uint64_t sub_10001B674(SEL *a1)
{
  if (sub_1000414A0()) {
    return 0;
  }
  sub_1000414C0();
  uint64_t v2 = self;
  NSString v3 = sub_100041740();
  swift_bridgeObjectRelease();
  id v4 = [v2 normalizedHandleWithDestinationID:v3];

  if (!v4) {
    return 0;
  }
  id v5 = [v4 *a1];
  if (!v5)
  {

    return 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = sub_100041770();

  return v7;
}

uint64_t sub_10001B794(SEL *a1)
{
  sub_100041530();
  if (!v2) {
    return 0;
  }
  NSString v3 = self;
  NSString v4 = sub_100041740();
  swift_bridgeObjectRelease();
  id v5 = [v3 normalizedHandleWithDestinationID:v4];

  if (!v5) {
    return 0;
  }
  id v6 = [v5 *a1];
  if (!v6)
  {

    return 0;
  }
  uint64_t v7 = v6;
  uint64_t v8 = sub_100041770();

  return v8;
}

uint64_t sub_10001B8F0()
{
  if (*(unsigned char *)(v0 + 32) != 1) {
    return *(void *)(v0 + 24);
  }
  int v1 = (unsigned __int16)sub_100041480();
  uint64_t v2 = 1;
  if (v1 == 2) {
    uint64_t v2 = 2;
  }
  if (v1 == 1) {
    uint64_t result = 3;
  }
  else {
    uint64_t result = v2;
  }
  *(void *)(v0 + 24) = result;
  *(unsigned char *)(v0 + 32) = 0;
  return result;
}

uint64_t sub_10001B988()
{
  if (*(unsigned char *)(v0 + OBJC_IVAR____TtC37VoicemailMessageNotificationExtension9FTMessage_isDirty) == 1)
  {
    return sub_10001B8F0();
  }
  else
  {
    int v2 = (unsigned __int16)sub_100041480();
    uint64_t v3 = 1;
    if (v2 == 2) {
      uint64_t v3 = 2;
    }
    if (v2 == 1) {
      return 3;
    }
    else {
      return v3;
    }
  }
}

uint64_t sub_10001BA14()
{
  int v1 = *(unsigned __int8 *)(v0 + 33);
  if (v1 == 2)
  {
    char v2 = sub_1000414E0();
    *(unsigned char *)(v0 + 33) = v2 & 1;
  }
  else
  {
    char v2 = v1 & 1;
  }
  return v2 & 1;
}

void sub_10001BBF4()
{
  uint64_t v1 = sub_100016F7C(&qword_1000687D8);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)&v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100016F7C((uint64_t *)&unk_1000689D8);
  __chkstk_darwin(v4 - 8);
  id v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (sub_10001BE94() == 2 && (sub_1000414D0() & 1) != 0 && TUCallScreeningRTTEnabled())
  {
    if (*(unsigned char *)(v0 + OBJC_IVAR____TtC37VoicemailMessageNotificationExtension9FTMessage_didLoadTranscript) == 1
      && sub_10001C08C())
    {
      self;
      uint64_t v7 = (void *)swift_dynamicCastObjCClass();
      if (v7)
      {
        id v8 = [v7 conversation];
        swift_unknownObjectRelease();
        if (v8)
        {
          id v9 = [v8 utterances];

          if (v9)
          {
            [v9 count];
          }
          else
          {
            __break(1u);
          }
        }
      }
      else
      {
        swift_unknownObjectRelease();
      }
    }
  }
  else
  {
    int v10 = sub_10001BE94();
    if (v10)
    {
      if (v10 == 1) {
        return;
      }
      sub_10001C0FC((uint64_t)v6);
      uint64_t v14 = sub_100041670();
      (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48))(v6, 1, v14);
      uint64_t v12 = (uint64_t *)&unk_1000689D8;
      uint64_t v13 = (uint64_t)v6;
    }
    else
    {
      sub_10001CA40(&OBJC_IVAR____TtC37VoicemailMessageNotificationExtension9FTMessage____lazy_storage___transcriptURL, (uint64_t (*)(uint64_t))&dispatch thunk of Message.sandboxTranscriptFile.getter, (uint64_t)v3);
      uint64_t v11 = sub_100041290();
      (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48))(v3, 1, v11);
      uint64_t v12 = &qword_1000687D8;
      uint64_t v13 = (uint64_t)v3;
    }
    sub_10001AA54(v13, v12);
  }
}

uint64_t sub_10001BE94()
{
  unsigned __int16 v0 = sub_100041490();
  if (v0 < 3u) {
    return 0x10002u >> (8 * v0);
  }
  if (qword_100068448 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1000416D0();
  sub_10001F3C4(v2, (uint64_t)qword_10006A268);
  swift_retain_n();
  uint64_t v3 = sub_1000416B0();
  os_log_type_t v4 = sub_100041930();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136446210;
    sub_100041490();
    uint64_t v6 = sub_100041780();
    sub_10001F3FC(v6, v7, &v8);
    sub_1000419E0();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Unexpected Message type %{public}s", v5, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_release_n();
  }
  return 0;
}

uint64_t sub_10001C08C()
{
  uint64_t v1 = OBJC_IVAR____TtC37VoicemailMessageNotificationExtension9FTMessage____lazy_storage___transcript;
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC37VoicemailMessageNotificationExtension9FTMessage____lazy_storage___transcript);
  uint64_t v3 = v2;
  if (v2 == 1)
  {
    uint64_t v3 = (uint64_t)sub_10001D358(v0);
    uint64_t v4 = *(void *)(v0 + v1);
    *(void *)(v0 + v1) = v3;
    swift_unknownObjectRetain();
    sub_10001FB04(v4);
  }
  sub_10001FB14(v2);
  return v3;
}

uint64_t sub_10001C0FC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_100016F7C(&qword_100068AE8);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v6 = &v13[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v4);
  uint64_t v8 = &v13[-v7];
  uint64_t v9 = v1 + OBJC_IVAR____TtC37VoicemailMessageNotificationExtension9FTMessage____lazy_storage___transcriptData;
  swift_beginAccess();
  sub_10001FBB8(v9, (uint64_t)v8, &qword_100068AE8);
  uint64_t v10 = sub_100016F7C((uint64_t *)&unk_1000689D8);
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v11 + 48))(v8, 1, v10) != 1) {
    return sub_10001FC80((uint64_t)v8, a1, (uint64_t *)&unk_1000689D8);
  }
  sub_10001AA54((uint64_t)v8, &qword_100068AE8);
  sub_100041450();
  sub_10001FBB8(a1, (uint64_t)v6, (uint64_t *)&unk_1000689D8);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v11 + 56))(v6, 0, 1, v10);
  swift_beginAccess();
  sub_10001FC1C((uint64_t)v6, v9, &qword_100068AE8);
  return swift_endAccess();
}

uint64_t sub_10001C3A8()
{
  int v1 = *(unsigned __int8 *)(v0 + 34);
  if (v1 != 2) {
    return v1 & 1;
  }
  uint64_t result = 0;
  *(unsigned char *)(v0 + 34) = 0;
  return result;
}

uint64_t sub_10001C520@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_100016F7C(&qword_1000687D8);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v27 - v8;
  uint64_t v10 = sub_100016F7C(&qword_100068AF0);
  uint64_t v11 = __chkstk_darwin(v10 - 8);
  uint64_t v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v27 - v14;
  uint64_t v16 = v1 + OBJC_IVAR____TtC37VoicemailMessageNotificationExtension9FTMessage____lazy_storage___dataURL;
  swift_beginAccess();
  sub_10001FBB8(v16, (uint64_t)v15, &qword_100068AF0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v15, 1, v3) == 1)
  {
    sub_10001AA54((uint64_t)v15, &qword_100068AF0);
    uint64_t v17 = (void *)sub_100041430();
    uint64_t v18 = (void *)sub_100041690();

    if (v18)
    {
      uint64_t v28 = a1;
      uint64_t v19 = sub_100041290();
      uint64_t v27 = *(void *)(v19 - 8);
      uint64_t v20 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v27 + 56);
      v20(v7, 1, 1, v19);
      sub_10001FCE4(&qword_100068AF8, (void (*)(uint64_t))&type metadata accessor for URL);
      sub_100041C00();

      uint64_t v21 = v20;
      uint64_t v22 = v27;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48))(v7, 1, v19) == 1)
      {
        id v23 = v9;
        uint64_t v24 = 1;
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v9, v7, v19);
        id v23 = v9;
        uint64_t v24 = 0;
      }
      v21(v23, v24, 1, v19);
      a1 = v28;
    }
    else
    {
      uint64_t v25 = sub_100041290();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v9, 1, 1, v25);
    }
    sub_10001FBB8((uint64_t)v9, (uint64_t)v13, &qword_1000687D8);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v4 + 56))(v13, 0, 1, v3);
    swift_beginAccess();
    sub_10001FC1C((uint64_t)v13, v16, &qword_100068AF0);
    swift_endAccess();
  }
  else
  {
    uint64_t v9 = v15;
  }
  return sub_10001FC80((uint64_t)v9, a1, &qword_1000687D8);
}

uint64_t sub_10001CA40@<X0>(void *a1@<X0>, uint64_t (*a2)(uint64_t)@<X1>, uint64_t a3@<X8>)
{
  uint64_t v33 = a3;
  uint64_t v6 = sub_100016F7C(&qword_1000687D8);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v32 - v11;
  uint64_t v13 = sub_100016F7C(&qword_100068AF0);
  uint64_t v14 = __chkstk_darwin(v13 - 8);
  uint64_t v16 = (char *)&v32 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v32 - v17;
  uint64_t v19 = v3 + *a1;
  swift_beginAccess();
  sub_10001FBB8(v19, (uint64_t)v18, &qword_100068AF0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v18, 1, v6) == 1)
  {
    uint64_t v20 = sub_10001AA54((uint64_t)v18, &qword_100068AF0);
    uint64_t v21 = a2(v20);
    if (v21 && (v22 = (void *)v21, id v23 = (void *)sub_100041690(), v22, v23))
    {
      uint64_t v24 = sub_100041290();
      uint64_t v25 = *(void *)(v24 - 8);
      char v32 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v25 + 56);
      v32(v10, 1, 1, v24);
      sub_10001FCE4(&qword_100068AF8, (void (*)(uint64_t))&type metadata accessor for URL);
      sub_100041C00();

      int v26 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v25 + 48))(v10, 1, v24);
      uint64_t v27 = v33;
      if (v26 == 1)
      {
        uint64_t v28 = v12;
        uint64_t v29 = 1;
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v25 + 32))(v12, v10, v24);
        uint64_t v28 = v12;
        uint64_t v29 = 0;
      }
      v32(v28, v29, 1, v24);
    }
    else
    {
      uint64_t v30 = sub_100041290();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v12, 1, 1, v30);
      uint64_t v27 = v33;
    }
    sub_10001FBB8((uint64_t)v12, (uint64_t)v16, &qword_1000687D8);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v16, 0, 1, v6);
    swift_beginAccess();
    sub_10001FC1C((uint64_t)v16, v19, &qword_100068AF0);
    swift_endAccess();
  }
  else
  {
    uint64_t v12 = v18;
    uint64_t v27 = v33;
  }
  return sub_10001FC80((uint64_t)v12, v27, &qword_1000687D8);
}

uint64_t sub_10001CE2C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v7 = sub_100016F7C(&qword_100068AF0);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100016F7C(&qword_1000687D8);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_100041270();
    uint64_t v14 = sub_100041290();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v13, 0, 1, v14);
  }
  else
  {
    uint64_t v15 = sub_100041290();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v13, 1, 1, v15);
  }
  sub_10001FC80((uint64_t)v13, (uint64_t)v9, &qword_1000687D8);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v9, 0, 1, v10);
  uint64_t v16 = a1 + *a4;
  swift_beginAccess();
  swift_retain();
  sub_10001FC1C((uint64_t)v9, v16, &qword_100068AF0);
  swift_endAccess();
  return swift_release();
}

uint64_t sub_10001D050(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = swift_retain();
  LOBYTE(a3) = a3(v4);
  swift_release();
  return a3 & 1;
}

uint64_t sub_10001D0B4(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = swift_retain();
  LOBYTE(a3) = a3(v4);
  swift_release();
  return a3 & 1;
}

id sub_10001D0F4()
{
  uint64_t v0 = sub_100016F7C(&qword_1000687D8);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v11 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100041290();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001C520((uint64_t)v2);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) == 1)
  {
    sub_10001AA54((uint64_t)v2, &qword_1000687D8);
    return 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v6, v2, v3);
    id v8 = [self defaultManager];
    sub_100041280();
    NSString v9 = sub_100041740();
    swift_bridgeObjectRelease();
    id v7 = [v8 fileExistsAtPath:v9];

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  return v7;
}

id sub_10001D358(uint64_t a1)
{
  uint64_t v2 = sub_100016F7C(&qword_1000687D8);
  uint64_t v3 = __chkstk_darwin(v2);
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v41 - v4;
  uint64_t v6 = sub_100041290();
  uint64_t v46 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  id v8 = (char *)&v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100016F7C((uint64_t *)&unk_1000689D8);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v41 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100041670();
  uint64_t v45 = *(void *)(v12 - 8);
  uint64_t v13 = __chkstk_darwin(v12);
  v44 = (char *)&v41 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v43 = (char *)&v41 - v15;
  uint64_t v16 = sub_100041340();
  uint64_t v42 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  uint64_t v18 = (char *)&v41 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v47 = a1;
  int v19 = sub_10001BE94();
  if (!v19)
  {
    uint64_t v24 = v8;
    sub_10001CA40(&OBJC_IVAR____TtC37VoicemailMessageNotificationExtension9FTMessage____lazy_storage___transcriptURL, (uint64_t (*)(uint64_t))&dispatch thunk of Message.sandboxTranscriptFile.getter, (uint64_t)v5);
    uint64_t v25 = v46;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v46 + 48))(v5, 1, v6) == 1)
    {
      sub_10001AA54((uint64_t)v5, &qword_1000687D8);
      id v20 = 0;
      uint64_t v21 = v47;
      goto LABEL_13;
    }
    (*(void (**)(char *, char *, uint64_t))(v25 + 32))(v8, v5, v6);
    uint64_t v33 = sub_1000412A0();
    unint64_t v35 = v34;
    sub_10001FB24(0, &qword_100068AD8);
    sub_10001FB24(0, &qword_100068AE0);
    uint64_t v36 = sub_100041950();
    uint64_t v21 = v47;
    uint64_t v38 = v36;
    if (v36)
    {
      v39 = (objc_class *)type metadata accessor for VisualTranscriptionMessage();
      uint64_t v40 = (char *)objc_allocWithZone(v39);
      *(void *)&v40[OBJC_IVAR___MPVisualTranscriptionMessage_vmTranscript] = v38;
      v49.receiver = v40;
      v49.super_class = v39;
      [super init];
      sub_10001FB60(v33, v35);
      (*(void (**)(char *, uint64_t))(v46 + 8))(v24, v6);
      goto LABEL_13;
    }
    (*(void (**)(char *, uint64_t))(v46 + 8))(v24, v6);
    sub_10001FB60(v33, v35);
    goto LABEL_12;
  }
  id v20 = 0;
  uint64_t v21 = v47;
  if (v19 != 1)
  {
    if ((sub_1000414D0() & 1) != 0 && TUCallScreeningRTTEnabled())
    {
      sub_1000414F0();
      id v22 = objc_allocWithZone((Class)MPRTTTranscriptionMessage);
      Class isa = sub_100041300().super.isa;
      id v20 = [v22 initWithCallUUID:isa];

      (*(void (**)(char *, uint64_t))(v42 + 8))(v18, v16);
      goto LABEL_13;
    }
    sub_10001C0FC((uint64_t)v11);
    uint64_t v26 = v45;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v45 + 48))(v11, 1, v12) != 1)
    {
      uint64_t v27 = v43;
      (*(void (**)(char *, char *, uint64_t))(v26 + 32))(v43, v11, v12);
      uint64_t v28 = *(void (**)(char *, char *, uint64_t))(v26 + 16);
      uint64_t v29 = v44;
      v28(v44, v27, v12);
      uint64_t v30 = (objc_class *)type metadata accessor for FTTranscriptionMessage(0);
      unint64_t v31 = (char *)objc_allocWithZone(v30);
      *(void *)&v31[OBJC_IVAR____TtC37VoicemailMessageNotificationExtension22FTTranscriptionMessage_confidenceRating] = 0;
      *(void *)&v31[OBJC_IVAR____TtC37VoicemailMessageNotificationExtension22FTTranscriptionMessage_confidence] = 0x3FF0000000000000;
      v28(&v31[OBJC_IVAR____TtC37VoicemailMessageNotificationExtension22FTTranscriptionMessage_transcriptData], v29, v12);
      v48.receiver = v31;
      v48.super_class = v30;
      id v20 = [super init];
      char v32 = *(void (**)(char *, uint64_t))(v26 + 8);
      v32(v29, v12);
      v32(v27, v12);
      goto LABEL_13;
    }
    sub_10001AA54((uint64_t)v11, (uint64_t *)&unk_1000689D8);
LABEL_12:
    id v20 = 0;
  }
LABEL_13:
  *(unsigned char *)(v21 + OBJC_IVAR____TtC37VoicemailMessageNotificationExtension9FTMessage_didLoadTranscript) = 1;
  return v20;
}

uint64_t sub_10001DBF8(uint64_t a1)
{
  *(void *)(v1 + 24) = 0;
  *(unsigned char *)(v1 + 32) = 1;
  *(_WORD *)(v1 + 33) = 514;
  uint64_t v3 = v1 + OBJC_IVAR____TtC37VoicemailMessageNotificationExtension9FTMessage____lazy_storage___dataURL;
  uint64_t v4 = sub_100016F7C(&qword_1000687D8);
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  v5(v3, 1, 1, v4);
  v5(v1 + OBJC_IVAR____TtC37VoicemailMessageNotificationExtension9FTMessage____lazy_storage___thumbnailURL, 1, 1, v4);
  v5(v1 + OBJC_IVAR____TtC37VoicemailMessageNotificationExtension9FTMessage____lazy_storage___transcriptURL, 1, 1, v4);
  uint64_t v6 = v1 + OBJC_IVAR____TtC37VoicemailMessageNotificationExtension9FTMessage____lazy_storage___transcriptData;
  uint64_t v7 = sub_100016F7C((uint64_t *)&unk_1000689D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  *(void *)(v1 + OBJC_IVAR____TtC37VoicemailMessageNotificationExtension9FTMessage____lazy_storage___transcript) = 1;
  *(unsigned char *)(v1 + OBJC_IVAR____TtC37VoicemailMessageNotificationExtension9FTMessage_didLoadTranscript) = 0;
  *(unsigned char *)(v1 + OBJC_IVAR____TtC37VoicemailMessageNotificationExtension9FTMessage_isDirty) = 0;
  *(void *)(v1 + 16) = a1;
  return v1;
}

uint64_t sub_10001DD5C()
{
  sub_10001AA54((uint64_t)v0 + OBJC_IVAR____TtC37VoicemailMessageNotificationExtension9FTMessage____lazy_storage___dataURL, &qword_100068AF0);
  sub_10001AA54((uint64_t)v0 + OBJC_IVAR____TtC37VoicemailMessageNotificationExtension9FTMessage____lazy_storage___thumbnailURL, &qword_100068AF0);
  sub_10001AA54((uint64_t)v0 + OBJC_IVAR____TtC37VoicemailMessageNotificationExtension9FTMessage____lazy_storage___transcriptURL, &qword_100068AF0);
  sub_10001AA54((uint64_t)v0 + OBJC_IVAR____TtC37VoicemailMessageNotificationExtension9FTMessage____lazy_storage___transcriptData, &qword_100068AE8);
  sub_10001FB04(*(uint64_t *)((char *)v0
                           + OBJC_IVAR____TtC37VoicemailMessageNotificationExtension9FTMessage____lazy_storage___transcript));
  uint64_t v1 = *((unsigned int *)*v0 + 12);
  uint64_t v2 = *((unsigned __int16 *)*v0 + 26);

  return _swift_deallocClassInstance(v0, v1, v2);
}

uint64_t sub_10001DE2C()
{
  return type metadata accessor for FTMessage(0);
}

uint64_t type metadata accessor for FTMessage(uint64_t a1)
{
  return sub_100019758(a1, (uint64_t *)&unk_1000689B0);
}

void sub_10001DE54()
{
  sub_10001DF78(319, (unint64_t *)&unk_1000689C0, &qword_1000687D8);
  if (v0 <= 0x3F)
  {
    sub_10001DF78(319, &qword_1000689D0, (uint64_t *)&unk_1000689D8);
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

void sub_10001DF78(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  if (!*a2)
  {
    sub_10001701C(a3);
    unint64_t v4 = sub_1000419D0();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

BOOL sub_10001DFC8(double a1)
{
  if (*(unsigned char *)(v1 + OBJC_IVAR____TtC37VoicemailMessageNotificationExtension9FTMessage_isDirty))
  {
    if ((sub_10001BA14() & 1) == 0) {
      goto LABEL_3;
    }
    return 0;
  }
  if (sub_1000414E0()) {
    return 0;
  }
LABEL_3:
  if (a1 > 5.0) {
    return 1;
  }
  sub_100041500();
  return v4 / 3.0 < a1;
}

id sub_10001E098(void *a1)
{
  if (sub_1000414A0()) {
    return 0;
  }
  sub_1000414C0();
  uint64_t v2 = self;
  NSString v3 = sub_100041740();
  swift_bridgeObjectRelease();
  id v4 = [v2 normalizedHandleWithDestinationID:v3];

  if (!v4) {
    return 0;
  }
  id v5 = [v4 normalizedValue];
  if (!v5)
  {

    return 0;
  }
  uint64_t v6 = v5;
  uint64_t v7 = sub_100041770();
  unint64_t v9 = v8;

  swift_bridgeObjectRelease();
  uint64_t v10 = HIBYTE(v9) & 0xF;
  if ((v9 & 0x2000000000000000) == 0) {
    uint64_t v10 = v7 & 0xFFFFFFFFFFFFLL;
  }
  if (!v10) {
    return 0;
  }
  sub_1000414C0();
  NSString v11 = sub_100041740();
  swift_bridgeObjectRelease();
  sub_100016F7C(&qword_1000687D0);
  Class isa = sub_1000417E0().super.isa;
  id v13 = [a1 contactForDestinationId:v11 keysToFetch:isa];

  return v13;
}

uint64_t sub_10001E294(void *a1)
{
  uint64_t v2 = sub_1000414C0();
  unint64_t v4 = v3;
  swift_bridgeObjectRelease();
  uint64_t v5 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0) {
    uint64_t v5 = v2 & 0xFFFFFFFFFFFFLL;
  }
  if (!v5) {
    return 0;
  }
  sub_100016F7C((uint64_t *)&unk_100068B00);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_100056640;
  uint64_t v7 = self;
  *(void *)(v6 + 32) = [v7 descriptorForRequiredKeysForStyle:0];
  sub_100041810();
  id v8 = sub_10001E098(a1);
  swift_bridgeObjectRelease();
  if (!v8) {
    return sub_10001E414();
  }
  if (([v8 isSuggested] & 1) == 0)
  {
    id v10 = [v7 stringFromContact:v8 style:0];
    if (v10)
    {
      NSString v11 = v10;
      uint64_t v9 = sub_100041770();

      return v9;
    }

    return 0;
  }
  uint64_t v9 = sub_10001E414();

  return v9;
}

uint64_t sub_10001E414()
{
  unint64_t v0 = self;
  sub_1000414C0();
  NSString v1 = sub_100041740();
  swift_bridgeObjectRelease();
  id v2 = [v0 normalizedHandleWithDestinationID:v1];

  if (!v2) {
    return 0;
  }
  id v3 = [v2 normalizedValue];
  id v4 = [v2 isoCountryCode];
  id v5 = (id)TUFormattedPhoneNumber();

  if (!v5)
  {

    return 0;
  }
  uint64_t v6 = sub_100041770();

  return v6;
}

uint64_t sub_10001E5AC()
{
  uint64_t v92 = sub_100016F7C(&qword_1000687D8);
  __chkstk_darwin(v92);
  uint64_t v91 = (uint64_t)v84 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_1000412E0();
  uint64_t v89 = *(void *)(v2 - 8);
  uint64_t v90 = v2;
  __chkstk_darwin(v2);
  v88 = (char *)v84 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v87 = sub_100016F7C(&qword_1000688F8);
  __chkstk_darwin(v87);
  v85 = (char *)v84 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100041340();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)v84 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  NSString v11 = (char *)v84 - v10;
  uint64_t v96 = 0;
  unint64_t v97 = 0xE000000000000000;
  sub_100041AC0(699);
  v98._countAndFlagsBits = 0xD00000000000001ALL;
  uint64_t v86 = 0xD00000000000001ALL;
  v98._object = (void *)0x8000000100053C50;
  sub_1000417B0(v98);
  id v12 = *(id *)(v0 + 16);
  id v13 = [v12 description];
  uint64_t v14 = sub_100041770();
  uint64_t v16 = v15;

  v99._countAndFlagsBits = v14;
  v99._object = v16;
  sub_1000417B0(v99);

  swift_bridgeObjectRelease();
  v100._countAndFlagsBits = 0x3A6469202020200ALL;
  v100._object = (void *)0xE900000000000020;
  sub_1000417B0(v100);
  sub_100041440();
  uint64_t v17 = *(void (**)(char *, char *, uint64_t))(v6 + 16);
  v17(v9, v11, v5);
  uint64_t v18 = (objc_class *)type metadata accessor for MessageID(0);
  int v19 = (char *)objc_allocWithZone(v18);
  v17(&v19[OBJC_IVAR___MPMessageID_value], v9, v5);
  type metadata accessor for MessageID.Value(0);
  swift_storeEnumTagMultiPayload();
  v95.receiver = v19;
  v95.super_class = v18;
  [super init];
  uint64_t v21 = *(void (**)(char *, uint64_t))(v6 + 8);
  v21(v9, v5);
  v21(v11, v5);
  id v22 = [v20 description];
  uint64_t v23 = sub_100041770();
  uint64_t v25 = v24;

  v101._countAndFlagsBits = v23;
  v101._object = v25;
  sub_1000417B0(v101);

  swift_bridgeObjectRelease();
  v102._countAndFlagsBits = 0x6F7270202020200ALL;
  v102._object = (void *)0xEF203A7265646976;
  sub_1000417B0(v102);
  v103._countAndFlagsBits = sub_100041520();
  sub_1000417B0(v103);
  swift_bridgeObjectRelease();
  v104._countAndFlagsBits = 0x6C6163202020200ALL;
  v104._object = (void *)0xEF203A444955556CLL;
  sub_1000417B0(v104);
  uint64_t v26 = v85;
  sub_1000414F0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v6 + 56))(v26, 0, 1, v5);
  uint64_t v27 = v84[1];
  v105._countAndFlagsBits = sub_100041780();
  sub_1000417B0(v105);
  swift_bridgeObjectRelease();
  v106._countAndFlagsBits = 0xD000000000000012;
  v106._object = (void *)0x8000000100053C70;
  sub_1000417B0(v106);
  uint64_t v93 = sub_10001B400();
  sub_100041B60();
  v107._object = (void *)0x8000000100053C90;
  v107._countAndFlagsBits = v86;
  sub_1000417B0(v107);
  uint64_t v93 = sub_10001B674((SEL *)&selRef_normalizedValue);
  uint64_t v94 = v28;
  sub_100016F7C(&qword_100068AB0);
  v108._countAndFlagsBits = sub_100041780();
  sub_1000417B0(v108);
  swift_bridgeObjectRelease();
  v109._countAndFlagsBits = 0xD00000000000001BLL;
  v109._object = (void *)0x8000000100053CB0;
  sub_1000417B0(v109);
  uint64_t v93 = sub_10001B674((SEL *)&selRef_isoCountryCode);
  uint64_t v94 = v29;
  v110._countAndFlagsBits = sub_100041780();
  sub_1000417B0(v110);
  swift_bridgeObjectRelease();
  v111._object = (void *)0x8000000100053CD0;
  v111._countAndFlagsBits = 0xD00000000000001CLL;
  sub_1000417B0(v111);
  uint64_t v93 = sub_10001B794((SEL *)&selRef_normalizedValue);
  uint64_t v94 = v30;
  v112._countAndFlagsBits = sub_100041780();
  sub_1000417B0(v112);
  swift_bridgeObjectRelease();
  v113._countAndFlagsBits = 0xD00000000000001DLL;
  v113._object = (void *)0x8000000100053CF0;
  sub_1000417B0(v113);
  uint64_t v93 = sub_10001B794((SEL *)&selRef_isoCountryCode);
  uint64_t v94 = v31;
  v114._countAndFlagsBits = sub_100041780();
  sub_1000417B0(v114);
  swift_bridgeObjectRelease();
  v115._object = (void *)0x8000000100053D10;
  v115._countAndFlagsBits = 0xD00000000000001CLL;
  sub_1000417B0(v115);
  char v32 = sub_1000414A0();
  uint64_t v33 = 0;
  uint64_t v34 = 0;
  if ((v32 & 1) == 0) {
    uint64_t v33 = sub_1000414C0();
  }
  uint64_t v93 = v33;
  uint64_t v94 = v34;
  v116._countAndFlagsBits = sub_100041780();
  sub_1000417B0(v116);
  swift_bridgeObjectRelease();
  v117._countAndFlagsBits = 0xD000000000000012;
  v117._object = (void *)0x8000000100053D30;
  sub_1000417B0(v117);
  uint64_t v93 = sub_10001B8F0();
  sub_100041B60();
  v118._countAndFlagsBits = 0x6C6F66202020200ALL;
  v118._object = (void *)0xED0000203A726564;
  sub_1000417B0(v118);
  uint64_t v35 = OBJC_IVAR____TtC37VoicemailMessageNotificationExtension9FTMessage_isDirty;
  if (*(unsigned char *)(v27 + OBJC_IVAR____TtC37VoicemailMessageNotificationExtension9FTMessage_isDirty) == 1)
  {
    uint64_t v36 = *(void *)(v27 + 24);
  }
  else
  {
    int v37 = (unsigned __int16)sub_100041480();
    uint64_t v38 = 1;
    if (v37 == 2) {
      uint64_t v38 = 2;
    }
    BOOL v40 = v37 == 1;
    uint64_t v36 = 3;
    if (!v40) {
      uint64_t v36 = v38;
    }
  }
  uint64_t v93 = v36;
  sub_100041B60();
  v119._object = (void *)0x8000000100053D50;
  v119._countAndFlagsBits = 0xD000000000000010;
  sub_1000417B0(v119);
  char v39 = sub_10001BA14();
  BOOL v40 = (v39 & 1) == 0;
  if (v39) {
    v41._countAndFlagsBits = 1702195828;
  }
  else {
    v41._countAndFlagsBits = 0x65736C6166;
  }
  if (v40) {
    uint64_t v42 = (void *)0xE500000000000000;
  }
  else {
    uint64_t v42 = (void *)0xE400000000000000;
  }
  v41._object = v42;
  sub_1000417B0(v41);
  swift_bridgeObjectRelease();
  v120._countAndFlagsBits = 0x616572202020200ALL;
  v120._object = (void *)0xEB00000000203A64;
  sub_1000417B0(v120);
  char v43 = *(unsigned char *)(v27 + v35);
  uint64_t v87 = v35;
  if (v43)
  {
    if (*(unsigned char *)(v27 + 33))
    {
LABEL_17:
      v44 = (void *)0xE400000000000000;
      v45._countAndFlagsBits = 1702195828;
      goto LABEL_20;
    }
  }
  else if (sub_1000414E0())
  {
    goto LABEL_17;
  }
  v44 = (void *)0xE500000000000000;
  v45._countAndFlagsBits = 0x65736C6166;
LABEL_20:
  v45._object = v44;
  sub_1000417B0(v45);
  swift_bridgeObjectRelease();
  v121._object = (void *)0xEB00000000203A65;
  v121._countAndFlagsBits = 0x746164202020200ALL;
  sub_1000417B0(v121);
  uint64_t v46 = v88;
  sub_100041460();
  sub_10001FCE4(&qword_100068AB8, (void (*)(uint64_t))&type metadata accessor for Date);
  uint64_t v47 = v90;
  v122._countAndFlagsBits = sub_100041C30();
  sub_1000417B0(v122);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v89 + 8))(v46, v47);
  v123._countAndFlagsBits = 0xD00000000000001FLL;
  v123._object = (void *)0x8000000100053D70;
  sub_1000417B0(v123);
  sub_10001BBF4();
  BOOL v49 = (v48 & 1) == 0;
  if (v48) {
    v50._countAndFlagsBits = 1702195828;
  }
  else {
    v50._countAndFlagsBits = 0x65736C6166;
  }
  if (v49) {
    v51 = (void *)0xE500000000000000;
  }
  else {
    v51 = (void *)0xE400000000000000;
  }
  v50._object = v51;
  sub_1000417B0(v50);
  swift_bridgeObjectRelease();
  v124._countAndFlagsBits = 0x727564202020200ALL;
  v124._object = (void *)0xEF203A6E6F697461;
  sub_1000417B0(v124);
  sub_100041500();
  sub_1000418E0();
  v125._countAndFlagsBits = 0xD00000000000001BLL;
  v125._object = (void *)0x8000000100053D90;
  sub_1000417B0(v125);
  v126._countAndFlagsBits = 0x65736C6166;
  v126._object = (void *)0xE500000000000000;
  sub_1000417B0(v126);
  v127._countAndFlagsBits = 0xD000000000000015;
  v127._object = (void *)0x8000000100053DB0;
  sub_1000417B0(v127);
  v128._countAndFlagsBits = 0x65736C6166;
  v128._object = (void *)0xE500000000000000;
  sub_1000417B0(v128);
  v129._countAndFlagsBits = 0xD00000000000001DLL;
  v129._object = (void *)0x8000000100053DD0;
  sub_1000417B0(v129);
  sub_1000414B0();
  int v52 = (unsigned __int16)sub_1000416A0();
  unsigned __int16 v53 = sub_1000416A0();
  BOOL v54 = v52 == v53;
  if (v52 == v53) {
    v55._countAndFlagsBits = 0x65736C6166;
  }
  else {
    v55._countAndFlagsBits = 1702195828;
  }
  if (v54) {
    v56 = (void *)0xE500000000000000;
  }
  else {
    v56 = (void *)0xE400000000000000;
  }
  v55._object = v56;
  sub_1000417B0(v55);
  swift_bridgeObjectRelease();
  v130._object = (void *)0x8000000100053DF0;
  v130._countAndFlagsBits = 0xD000000000000010;
  sub_1000417B0(v130);
  sub_100041480();
  int v57 = (unsigned __int16)sub_100041680();
  unsigned __int16 v58 = sub_100041680();
  BOOL v59 = v57 == v58;
  if (v57 == v58) {
    v60._countAndFlagsBits = 1702195828;
  }
  else {
    v60._countAndFlagsBits = 0x65736C6166;
  }
  if (v59) {
    v61 = (void *)0xE400000000000000;
  }
  else {
    v61 = (void *)0xE500000000000000;
  }
  v60._object = v61;
  sub_1000417B0(v60);
  swift_bridgeObjectRelease();
  v131._object = (void *)0x8000000100053E10;
  v131._countAndFlagsBits = 0xD000000000000010;
  sub_1000417B0(v131);
  char v62 = sub_10001C3A8();
  BOOL v63 = (v62 & 1) == 0;
  if (v62) {
    v64._countAndFlagsBits = 1702195828;
  }
  else {
    v64._countAndFlagsBits = 0x65736C6166;
  }
  if (v63) {
    v65 = (void *)0xE500000000000000;
  }
  else {
    v65 = (void *)0xE400000000000000;
  }
  v64._object = v65;
  sub_1000417B0(v64);
  swift_bridgeObjectRelease();
  v132._countAndFlagsBits = 0xD000000000000012;
  v132._object = (void *)0x8000000100053E30;
  sub_1000417B0(v132);
  char v66 = sub_100041470();
  BOOL v67 = (v66 & 1) == 0;
  if (v66) {
    v68._countAndFlagsBits = 1702195828;
  }
  else {
    v68._countAndFlagsBits = 0x65736C6166;
  }
  if (v67) {
    v69 = (void *)0xE500000000000000;
  }
  else {
    v69 = (void *)0xE400000000000000;
  }
  v68._object = v69;
  sub_1000417B0(v68);
  swift_bridgeObjectRelease();
  v133._countAndFlagsBits = 0x746164202020200ALL;
  v133._object = (void *)0xEE00203A4C525561;
  sub_1000417B0(v133);
  uint64_t v70 = v91;
  sub_10001C520(v91);
  v134._countAndFlagsBits = sub_100041780();
  sub_1000417B0(v134);
  swift_bridgeObjectRelease();
  v135._countAndFlagsBits = 0xD000000000000013;
  v135._object = (void *)0x8000000100053E50;
  sub_1000417B0(v135);
  sub_10001CA40(&OBJC_IVAR____TtC37VoicemailMessageNotificationExtension9FTMessage____lazy_storage___thumbnailURL, (uint64_t (*)(uint64_t))&dispatch thunk of Message.sandboxThumbnailFile.getter, v70);
  v136._countAndFlagsBits = sub_100041780();
  sub_1000417B0(v136);
  swift_bridgeObjectRelease();
  v137._object = (void *)0x8000000100053E70;
  v137._countAndFlagsBits = 0xD000000000000014;
  sub_1000417B0(v137);
  sub_10001CA40(&OBJC_IVAR____TtC37VoicemailMessageNotificationExtension9FTMessage____lazy_storage___transcriptURL, (uint64_t (*)(uint64_t))&dispatch thunk of Message.sandboxTranscriptFile.getter, v70);
  v138._countAndFlagsBits = sub_100041780();
  sub_1000417B0(v138);
  swift_bridgeObjectRelease();
  v139._countAndFlagsBits = 0x527369202020200ALL;
  v139._object = (void *)0xEC000000203A5454;
  sub_1000417B0(v139);
  char v71 = sub_1000414D0();
  BOOL v72 = (v71 & 1) == 0;
  if (v71) {
    v73._countAndFlagsBits = 1702195828;
  }
  else {
    v73._countAndFlagsBits = 0x65736C6166;
  }
  if (v72) {
    v74 = (void *)0xE500000000000000;
  }
  else {
    v74 = (void *)0xE400000000000000;
  }
  v73._object = v74;
  sub_1000417B0(v73);
  swift_bridgeObjectRelease();
  v140._countAndFlagsBits = 0xD000000000000016;
  v140._object = (void *)0x8000000100053E90;
  sub_1000417B0(v140);
  unsigned __int8 v75 = sub_10001D0F4();
  BOOL v76 = (v75 & 1) == 0;
  if (v75) {
    v77._countAndFlagsBits = 1702195828;
  }
  else {
    v77._countAndFlagsBits = 0x65736C6166;
  }
  if (v76) {
    v78 = (void *)0xE500000000000000;
  }
  else {
    v78 = (void *)0xE400000000000000;
  }
  v77._object = v78;
  sub_1000417B0(v77);
  swift_bridgeObjectRelease();
  v141._countAndFlagsBits = 0xD000000000000011;
  v141._object = (void *)0x8000000100053EB0;
  sub_1000417B0(v141);
  uint64_t v93 = sub_10001C08C();
  sub_100016F7C(&qword_100068AC0);
  v142._countAndFlagsBits = sub_100041780();
  sub_1000417B0(v142);
  swift_bridgeObjectRelease();
  v143._countAndFlagsBits = 0xD000000000000018;
  v143._object = (void *)0x8000000100053ED0;
  sub_1000417B0(v143);
  if (*(unsigned char *)(v27 + OBJC_IVAR____TtC37VoicemailMessageNotificationExtension9FTMessage_didLoadTranscript)) {
    v79._countAndFlagsBits = 1702195828;
  }
  else {
    v79._countAndFlagsBits = 0x65736C6166;
  }
  if (*(unsigned char *)(v27 + OBJC_IVAR____TtC37VoicemailMessageNotificationExtension9FTMessage_didLoadTranscript)) {
    v80 = (void *)0xE400000000000000;
  }
  else {
    v80 = (void *)0xE500000000000000;
  }
  v79._object = v80;
  sub_1000417B0(v79);
  swift_bridgeObjectRelease();
  v144._countAndFlagsBits = 0x447369202020200ALL;
  v144._object = (void *)0xEE00203A79747269;
  sub_1000417B0(v144);
  if (*(unsigned char *)(v27 + v87)) {
    v81._countAndFlagsBits = 1702195828;
  }
  else {
    v81._countAndFlagsBits = 0x65736C6166;
  }
  if (*(unsigned char *)(v27 + v87)) {
    v82 = (void *)0xE400000000000000;
  }
  else {
    v82 = (void *)0xE500000000000000;
  }
  v81._object = v82;
  sub_1000417B0(v81);
  swift_bridgeObjectRelease();
  v145._object = (void *)0x8000000100053EF0;
  v145._countAndFlagsBits = 0xD000000000000014;
  sub_1000417B0(v145);
  LOBYTE(v93) = sub_10001BE94();
  sub_100041B60();
  v146._countAndFlagsBits = 0x202020202020200ALL;
  v146._object = (void *)0xEA00000000002920;
  sub_1000417B0(v146);
  return v96;
}

uint64_t sub_10001F3A0()
{
  return sub_10001E5AC();
}

uint64_t sub_10001F3C4(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_10001F3FC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10001F4D0(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10001FAA4((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_10001FAA4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10001FA54((uint64_t)v12);
  return v7;
}

uint64_t sub_10001F4D0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_1000419F0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_10001F68C(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = sub_100041B00();
  if (!v8)
  {
    sub_100041B70();
    __break(1u);
LABEL_17:
    uint64_t result = sub_100041BE0();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_10001F68C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10001F724(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10001F904(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10001F904(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10001F724(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_10001F89C(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_100041AD0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_100041B70();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_1000417C0();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_100041BE0();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_100041B70();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_10001F89C(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  sub_100016F7C(&qword_100068AC8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10001F904(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_100016F7C(&qword_100068AC8);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  id v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_100041BE0();
  __break(1u);
  return result;
}

uint64_t sub_10001FA54(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10001FAA4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10001FB04(uint64_t result)
{
  if (result != 1) {
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_10001FB14(uint64_t result)
{
  if (result != 1) {
    return swift_unknownObjectRetain();
  }
  return result;
}

uint64_t sub_10001FB24(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_10001FB60(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }

  return swift_release();
}

uint64_t sub_10001FBB8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100016F7C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10001FC1C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100016F7C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

uint64_t sub_10001FC80(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100016F7C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_10001FCE4(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unsigned char *initializeBufferWithCopyOfBuffer for FTMessageSource(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for FTMessageSource(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 2;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for FTMessageSource(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *uint64_t result = a2 + 2;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x10001FE98);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *uint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

uint64_t sub_10001FEC0(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_10001FEC8(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for FTMessageSource()
{
  return &type metadata for FTMessageSource;
}

unint64_t sub_10001FEE4()
{
  unint64_t result = qword_100068B10;
  if (!qword_100068B10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100068B10);
  }
  return result;
}

uint64_t sub_10001FF38()
{
  uint64_t v0 = sub_1000416D0();
  sub_1000289C8(v0, qword_100068B20);
  uint64_t v1 = sub_10001F3C4(v0, (uint64_t)qword_100068B20);
  if (qword_100068448 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10001F3C4(v0, (uint64_t)qword_10006A268);
  int v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

void sub_100020010(uint64_t a1)
{
  uint64_t v2 = a1 + 64;
  uint64_t v3 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v4 = -1;
  if (v3 < 64) {
    uint64_t v4 = ~(-1 << v3);
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v6 = (unint64_t)(v3 + 63) >> 6;
  swift_bridgeObjectRetain();
  int64_t v7 = 0;
  int v8 = (char *)&_swiftEmptyArrayStorage;
  if (v5) {
    goto LABEL_6;
  }
LABEL_7:
  int64_t v11 = v7 + 1;
  if (!__OFADD__(v7, 1))
  {
    if (v11 < v6)
    {
      unint64_t v12 = *(void *)(v2 + 8 * v11);
      ++v7;
      if (v12) {
        goto LABEL_22;
      }
      int64_t v7 = v11 + 1;
      if (v11 + 1 >= v6) {
        goto LABEL_33;
      }
      unint64_t v12 = *(void *)(v2 + 8 * v7);
      if (v12) {
        goto LABEL_22;
      }
      int64_t v7 = v11 + 2;
      if (v11 + 2 >= v6) {
        goto LABEL_33;
      }
      unint64_t v12 = *(void *)(v2 + 8 * v7);
      if (v12) {
        goto LABEL_22;
      }
      int64_t v7 = v11 + 3;
      if (v11 + 3 >= v6) {
        goto LABEL_33;
      }
      unint64_t v12 = *(void *)(v2 + 8 * v7);
      if (v12)
      {
LABEL_22:
        unint64_t v5 = (v12 - 1) & v12;
        for (unint64_t i = __clz(__rbit64(v12)) + (v7 << 6); ; unint64_t i = v9 | (v7 << 6))
        {
          uint64_t v14 = 8 * i;
          uint64_t v15 = *(void **)(*(void *)(a1 + 48) + v14);
          unint64_t v16 = *(void *)(*(void *)(a1 + 56) + v14);
          if (v16 >> 62)
          {
            swift_bridgeObjectRetain_n();
            id v24 = v15;
            uint64_t v25 = sub_100041BA0();
            swift_bridgeObjectRelease();
            if (v25 < 2)
            {
LABEL_5:
              swift_bridgeObjectRelease();

              if (!v5) {
                goto LABEL_7;
              }
              goto LABEL_6;
            }
          }
          else
          {
            uint64_t v17 = *(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10);
            swift_bridgeObjectRetain();
            id v18 = v15;
            if (v17 < 2) {
              goto LABEL_5;
            }
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            int v8 = sub_1000364A0(0, *((void *)v8 + 2) + 1, 1, v8);
          }
          int v19 = v8;
          unint64_t v20 = *((void *)v8 + 2);
          uint64_t v21 = v19;
          unint64_t v22 = *((void *)v19 + 3);
          if (v20 >= v22 >> 1) {
            uint64_t v21 = sub_1000364A0((char *)(v22 > 1), v20 + 1, 1, v21);
          }
          *((void *)v21 + 2) = v20 + 1;
          uint64_t v23 = &v21[16 * v20];
          int v8 = v21;
          *((void *)v23 + 4) = v15;
          *((void *)v23 + 5) = v16;
          if (!v5) {
            goto LABEL_7;
          }
LABEL_6:
          unint64_t v9 = __clz(__rbit64(v5));
          v5 &= v5 - 1;
        }
      }
      int64_t v13 = v11 + 4;
      if (v13 < v6)
      {
        unint64_t v12 = *(void *)(v2 + 8 * v13);
        if (v12)
        {
          int64_t v7 = v13;
          goto LABEL_22;
        }
        while (1)
        {
          int64_t v7 = v13 + 1;
          if (__OFADD__(v13, 1)) {
            goto LABEL_35;
          }
          if (v7 >= v6) {
            break;
          }
          unint64_t v12 = *(void *)(v2 + 8 * v7);
          ++v13;
          if (v12) {
            goto LABEL_22;
          }
        }
      }
    }
LABEL_33:
    swift_release();
    return;
  }
  __break(1u);
LABEL_35:
  __break(1u);
}

uint64_t sub_10002026C(uint64_t a1)
{
  uint64_t v2 = a1 + 64;
  uint64_t v3 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v4 = -1;
  if (v3 < 64) {
    uint64_t v4 = ~(-1 << v3);
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v6 = (unint64_t)(v3 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v8 = 0;
  unint64_t v9 = (char *)&_swiftEmptyArrayStorage;
  if (v5) {
    goto LABEL_6;
  }
LABEL_7:
  int64_t v12 = v8 + 1;
  if (!__OFADD__(v8, 1))
  {
    if (v12 < v6)
    {
      unint64_t v13 = *(void *)(v2 + 8 * v12);
      ++v8;
      if (v13) {
        goto LABEL_22;
      }
      int64_t v8 = v12 + 1;
      if (v12 + 1 >= v6) {
        goto LABEL_37;
      }
      unint64_t v13 = *(void *)(v2 + 8 * v8);
      if (v13) {
        goto LABEL_22;
      }
      int64_t v8 = v12 + 2;
      if (v12 + 2 >= v6) {
        goto LABEL_37;
      }
      unint64_t v13 = *(void *)(v2 + 8 * v8);
      if (v13) {
        goto LABEL_22;
      }
      int64_t v8 = v12 + 3;
      if (v12 + 3 >= v6) {
        goto LABEL_37;
      }
      unint64_t v13 = *(void *)(v2 + 8 * v8);
      if (v13)
      {
LABEL_22:
        unint64_t v5 = (v13 - 1) & v13;
        for (unint64_t i = __clz(__rbit64(v13)) + (v8 << 6); ; unint64_t i = v10 | (v8 << 6))
        {
          uint64_t v15 = 8 * i;
          unint64_t v16 = *(void **)(*(void *)(a1 + 48) + v15);
          unint64_t v17 = *(void *)(*(void *)(a1 + 56) + v15);
          if (v17 >> 62)
          {
            swift_bridgeObjectRetain_n();
            id v25 = v16;
            uint64_t result = sub_100041BA0();
            if (!result)
            {
LABEL_5:

              uint64_t result = swift_bridgeObjectRelease_n();
              if (!v5) {
                goto LABEL_7;
              }
              goto LABEL_6;
            }
          }
          else
          {
            uint64_t v18 = *(void *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10);
            swift_bridgeObjectRetain_n();
            uint64_t result = v16;
            if (!v18) {
              goto LABEL_5;
            }
          }
          if ((v17 & 0xC000000000000001) != 0)
          {
            uint64_t v19 = sub_100041AE0();
          }
          else
          {
            if (!*(void *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
              goto LABEL_40;
            }
            uint64_t v19 = *(void *)(v17 + 32);
            swift_unknownObjectRetain();
          }
          swift_bridgeObjectRelease_n();
          uint64_t result = swift_isUniquelyReferenced_nonNull_native();
          if ((result & 1) == 0)
          {
            uint64_t result = (uint64_t)sub_100036390(0, *((void *)v9 + 2) + 1, 1, v9);
            unint64_t v9 = (char *)result;
          }
          unint64_t v20 = v9;
          unint64_t v21 = *((void *)v9 + 2);
          uint64_t v22 = (uint64_t)v20;
          unint64_t v23 = *((void *)v20 + 3);
          if (v21 >= v23 >> 1)
          {
            uint64_t result = (uint64_t)sub_100036390((char *)(v23 > 1), v21 + 1, 1, (char *)v22);
            uint64_t v22 = result;
          }
          *(void *)(v22 + 16) = v21 + 1;
          unint64_t v24 = v22 + 16 * v21;
          unint64_t v9 = (char *)v22;
          *(void *)(v24 + 32) = v16;
          *(void *)(v24 + 40) = v19;
          if (!v5) {
            goto LABEL_7;
          }
LABEL_6:
          unint64_t v10 = __clz(__rbit64(v5));
          v5 &= v5 - 1;
        }
      }
      int64_t v14 = v12 + 4;
      if (v14 < v6)
      {
        unint64_t v13 = *(void *)(v2 + 8 * v14);
        if (v13)
        {
          int64_t v8 = v14;
          goto LABEL_22;
        }
        while (1)
        {
          int64_t v8 = v14 + 1;
          if (__OFADD__(v14, 1)) {
            goto LABEL_39;
          }
          if (v8 >= v6) {
            break;
          }
          unint64_t v13 = *(void *)(v2 + 8 * v8);
          ++v14;
          if (v13) {
            goto LABEL_22;
          }
        }
      }
    }
LABEL_37:
    swift_release();
    return (uint64_t)v9;
  }
  __break(1u);
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_100020504(uint64_t a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v2;
  uint64_t v7 = v2[1];
  swift_retain();
  swift_retain();
  unint64_t v8 = sub_100024670((uint64_t)a2, v6, v7);
  char v10 = v9;
  swift_release();
  uint64_t result = swift_release();
  if (v10)
  {
    sub_10002485C(a2);
    swift_unknownObjectRetain();
    sub_100041B10();
    sub_100041B40();
    sub_100041B50();
    uint64_t v15 = 0;
    goto LABEL_9;
  }
  if ((v8 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_11;
  }
  uint64_t v14 = v3[2];
  int64_t v12 = v3 + 2;
  uint64_t v13 = v14;
  if (v8 >= *(void *)(v14 + 16))
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  uint64_t v15 = *(void *)(v13 + 8 * v8 + 32);
  swift_unknownObjectRetain();
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  uint64_t *v12 = v13;
  if ((result & 1) == 0)
  {
    uint64_t result = sub_1000253F0(v13);
    uint64_t v13 = result;
    uint64_t *v12 = result;
  }
  if (v8 < *(void *)(v13 + 16))
  {
    swift_unknownObjectRetain();
    swift_unknownObjectRelease();
    *(void *)(v13 + 8 * v8 + 32) = a1;
LABEL_9:
    sub_100041B20();
    return v15;
  }
LABEL_12:
  __break(1u);
  return result;
}

uint64_t sub_100020654(uint64_t a1, id *a2, uint64_t a3, void **a4)
{
  uint64_t v6 = sub_1000412E0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  char v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  int64_t v12 = (char *)&v18 - v11;
  uint64_t v13 = *a4;
  id v14 = [*a2 date];
  sub_1000412D0();

  id v15 = [v13 date];
  sub_1000412D0();

  LOBYTE(v15) = sub_1000412C0();
  unint64_t v16 = *(void (**)(char *, uint64_t))(v7 + 8);
  v16(v10, v6);
  v16(v12, v6);
  return v15 & 1;
}

uint64_t sub_1000207C4(unint64_t a1, char a2)
{
  LOBYTE(v3) = a2;
  uint64_t v4 = a1;
  if (!(a1 >> 62))
  {
    uint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v5) {
      goto LABEL_3;
    }
LABEL_57:
    uint64_t result = swift_bridgeObjectRelease();
    if ((v3 & 1) == 0) {
      return result;
    }
LABEL_58:
    swift_beginAccess();
    uint64_t v43 = v2[2];
    uint64_t v42 = v2[3];
    uint64_t v44 = v2[4];
    swift_retain();
    swift_retain();
    swift_retain();
    sub_100027A68(v43, v42, v44);
    Swift::String v55 = v45;
    sub_10002884C(&v55, (uint64_t (*)(uint64_t *, uint64_t *, void **, uint64_t *))sub_100020654);
    swift_release();
    swift_release();
    swift_release();
    uint64_t v46 = v55[2];
    if (v46 == *(void *)(v44 + 16))
    {
      sub_100025A44((uint64_t)(v55 + 4), v46, v2 + 2);
      swift_release();
      return swift_endAccess();
    }
    goto LABEL_62;
  }
LABEL_56:
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_100041BA0();
  if (!v5) {
    goto LABEL_57;
  }
LABEL_3:
  if (v5 < 1)
  {
    __break(1u);
LABEL_62:
    __break(1u);
LABEL_63:
    __break(1u);
LABEL_64:
    __break(1u);
    swift_release();
    swift_release();
    swift_release();
    uint64_t result = swift_release();
    __break(1u);
    return result;
  }
  char v47 = (char)v3;
  uint64_t v6 = 0;
  uint64_t v3 = v2 + 2;
  uint64_t v49 = v4 + 32;
  uint64_t v7 = v2 + 3;
  char v48 = v2;
  v51 = v2 + 4;
  unint64_t v52 = v4 & 0xC000000000000001;
  uint64_t v50 = v5;
  unsigned __int16 v53 = v2 + 2;
  do
  {
    if (v52)
    {
      uint64_t v11 = (void *)sub_100041AE0();
    }
    else
    {
      uint64_t v11 = *(void **)(v49 + 8 * v6);
      swift_unknownObjectRetain();
    }
    id v12 = [v11 identifier];
    swift_beginAccess();
    uint64_t v13 = *v3;
    uint64_t v14 = *v7;
    uint64_t v4 = *(void *)(*v7 + 16);
    BOOL v54 = v12;
    if (*v3)
    {
      swift_unknownObjectRetain();
      swift_retain();
      swift_retain();
      unint64_t v15 = sub_100024BCC((uint64_t)v12, v14 + 32, v4, (Swift::Int *)(v13 + 16));
      char v17 = v16;
      uint64_t v4 = v18;
      swift_release();
      swift_release();
      if (v17) {
        goto LABEL_28;
      }
      goto LABEL_20;
    }
    if (!v4)
    {
      swift_unknownObjectRetain();
      swift_retain();
LABEL_27:
      swift_release();
LABEL_28:
      swift_unknownObjectRetain();
      unint64_t v24 = v54;
      id v25 = v54;
      sub_100041B10();
      sub_100041B40();
      sub_100041B50();
      sub_100041B20();
      uint64_t v26 = *v7;
      unint64_t v27 = *(void *)(*v7 + 16);
      uint64_t v3 = v53;
      uint64_t v28 = *v53;
      if (*v53)
      {
        swift_beginAccess();
        if (sub_1000413E0() >= (uint64_t)v27)
        {
          char isUniquelyReferenced_native = swift_isUniquelyReferenced_native();
          uint64_t v31 = *v53;
          if ((isUniquelyReferenced_native & 1) == 0)
          {
            if (!v31) {
              goto LABEL_64;
            }
            uint64_t v31 = sub_100041400();
            swift_release();
            *unsigned __int16 v53 = v31;
          }
          if (!v31) {
            goto LABEL_63;
          }
          sub_1000413A0();
          goto LABEL_9;
        }
        swift_beginAccess();
        uint64_t v29 = *(void *)(v28 + 24) & 0x3FLL;
        if (v27 <= 0xF && !v29)
        {
          swift_release();
          *unsigned __int16 v53 = 0;
LABEL_9:
          swift_unknownObjectRetain();
          sub_100041B10();
          sub_100041B40();
          sub_100041B50();
          goto LABEL_10;
        }
      }
      else
      {
        if (v27 <= 0xF) {
          goto LABEL_9;
        }
        uint64_t v29 = 0;
      }
      uint64_t v8 = sub_100041410();
      if (v29 <= v8) {
        uint64_t v9 = v8;
      }
      else {
        uint64_t v9 = v29;
      }
      uint64_t v10 = sub_100024A2C(v26, v9, 0, v29);
      swift_release();
      *unsigned __int16 v53 = v10;
      goto LABEL_9;
    }
    type metadata accessor for MessageID(0);
    uint64_t v19 = *(void **)(v14 + 32);
    swift_unknownObjectRetain();
    swift_retain();
    id v20 = v19;
    char v21 = sub_1000419C0();

    unint64_t v15 = 0;
    if ((v21 & 1) == 0)
    {
      if (v4 == 1) {
        goto LABEL_27;
      }
      id v32 = *(id *)(v14 + 40);
      char v33 = sub_1000419C0();

      if (v33)
      {
        unint64_t v15 = 1;
      }
      else
      {
        if (v4 == 2) {
          goto LABEL_27;
        }
        id v34 = *(id *)(v14 + 48);
        char v35 = sub_1000419C0();

        if (v35)
        {
          unint64_t v15 = 2;
        }
        else
        {
          if (v4 == 3) {
            goto LABEL_27;
          }
          id v36 = *(id *)(v14 + 56);
          char v37 = sub_1000419C0();

          if ((v37 & 1) == 0)
          {
            uint64_t v38 = 0;
            uint64_t v39 = v4 - 4;
            while (v39 != v38)
            {
              id v40 = *(id *)(v14 + 64 + 8 * v38);
              uint64_t v4 = sub_1000419C0();

              ++v38;
              if (v4)
              {
                unint64_t v15 = v38 + 3;
                goto LABEL_19;
              }
            }
            goto LABEL_27;
          }
          unint64_t v15 = 3;
        }
      }
    }
LABEL_19:
    swift_release();
LABEL_20:
    uint64_t v2 = v51;
    uint64_t v22 = *v51;
    swift_unknownObjectRetain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t *v51 = v22;
    uint64_t v3 = v53;
    unint64_t v24 = v54;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      uint64_t v22 = sub_1000253F0(v22);
      uint64_t *v51 = v22;
    }
    if ((v15 & 0x8000000000000000) != 0)
    {
      __break(1u);
LABEL_55:
      __break(1u);
      goto LABEL_56;
    }
    if (v15 >= *(void *)(v22 + 16)) {
      goto LABEL_55;
    }
    swift_unknownObjectRetain();
    swift_unknownObjectRelease();
    *(void *)(v22 + 8 * v15 + 32) = v11;
LABEL_10:
    sub_100041B20();

    ++v6;
    swift_endAccess();
    swift_unknownObjectRelease_n();
  }
  while (v6 != v50);
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v2 = v48;
  if (v47) {
    goto LABEL_58;
  }
  return result;
}

uint64_t sub_100020DE8(unint64_t a1, char a2)
{
  LOBYTE(v3) = a2;
  uint64_t v4 = a1;
  unint64_t v46 = (unint64_t)_swiftEmptyArrayStorage;
  if (a1 >> 62)
  {
LABEL_64:
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_100041BA0();
    if (v5) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v5)
    {
LABEL_3:
      char v40 = v3;
      uint64_t v6 = 0;
      uint64_t v7 = v2 + 2;
      uint64_t v43 = v5;
      unint64_t v44 = v4 & 0xC000000000000001;
      Swift::String v41 = v2;
      uint64_t v42 = v4 + 32;
      uint64_t v8 = (id **)(v2 + 3);
      while (1)
      {
        if (v44) {
          id v9 = (id)sub_100041AE0();
        }
        else {
          id v9 = *(id *)(v42 + 8 * v6);
        }
        uint64_t v10 = v9;
        if (__OFADD__(v6++, 1))
        {
          __break(1u);
LABEL_62:
          __break(1u);
LABEL_63:
          __break(1u);
          goto LABEL_64;
        }
        swift_beginAccess();
        uint64_t v2 = (Swift::Int *)*v7;
        id v12 = *v8;
        Swift::Int v3 = (Swift::Int)(*v8 + 4);
        uint64_t v13 = (uint64_t)(*v8)[2];
        if (*v7)
        {
          uint64_t v4 = (uint64_t)(v2 + 2);
          swift_retain();
          Swift::Int v3 = sub_100024BCC((uint64_t)v10, v3, v13, v2 + 2);
          char v15 = v14;
          uint64_t v17 = v16;
          swift_release();
          if ((v15 & 1) == 0) {
            goto LABEL_15;
          }
        }
        else if (v13)
        {
          uint64_t v2 = (Swift::Int *)type metadata accessor for MessageID(0);
          id v18 = *(id *)v3;
          uint64_t v4 = sub_1000419C0();

          Swift::Int v3 = 0;
          uint64_t v17 = 0;
          if (v4) {
            goto LABEL_15;
          }
          if (v13 != 1)
          {
            Swift::Int v3 = (Swift::Int)v12[5];
            uint64_t v4 = sub_1000419C0();

            if (v4)
            {
              uint64_t v17 = 0;
              Swift::Int v3 = 1;
              goto LABEL_15;
            }
            if (v13 != 2)
            {
              Swift::Int v3 = (Swift::Int)v12[6];
              uint64_t v4 = sub_1000419C0();

              if (v4)
              {
                uint64_t v17 = 0;
                Swift::Int v3 = 2;
                goto LABEL_15;
              }
              if (v13 != 3)
              {
                Swift::Int v3 = (Swift::Int)v12[7];
                uint64_t v4 = sub_1000419C0();

                if (v4)
                {
                  uint64_t v17 = 0;
                  Swift::Int v3 = 3;
                  goto LABEL_15;
                }
                if (v13 != 4)
                {
                  Swift::Int v3 = (Swift::Int)v12[8];
                  uint64_t v4 = sub_1000419C0();

                  if (v4)
                  {
                    uint64_t v17 = 0;
                    Swift::Int v3 = 4;
LABEL_15:
                    uint64_t v19 = (uint64_t)(*v8)[2];
                    id v20 = (Swift::Int *)*v7;
                    if (*v7)
                    {
                      swift_beginAccess();
                      if ((v20[2] & 0x3F) == (v20[3] & 0x3F))
                      {
                        if (!v19) {
                          goto LABEL_30;
                        }
                      }
                      else if (v19 <= sub_1000413F0())
                      {
                        goto LABEL_30;
                      }
                      char isUniquelyReferenced_native = swift_isUniquelyReferenced_native();
                      uint64_t v22 = *v7;
                      if ((isUniquelyReferenced_native & 1) == 0)
                      {
                        if (!v22) {
                          goto LABEL_71;
                        }
                        uint64_t v22 = sub_100041400();
                        swift_release();
                        *uint64_t v7 = v22;
                      }
                      if (!v22) {
                        goto LABEL_70;
                      }
                      uint64_t v2 = (Swift::Int *)(v22 + 16);
                      uint64_t v4 = v22 + 32;
                      swift_retain();
                      sub_100025404(v17, (Swift::Int *)(v22 + 16), v22 + 32, (uint64_t)v7);
                      if (__OFADD__(v3, 1)) {
                        goto LABEL_62;
                      }
                      if (v3 + 1 < v3) {
                        goto LABEL_63;
                      }
                      uint64_t v23 = (uint64_t)*v8;
                      swift_retain();
                      sub_1000255CC(v3, v3 + 1, v23, (Swift::Int *)(v22 + 16));
                      swift_release();
                      swift_release();
LABEL_29:
                      unint64_t v24 = (void *)sub_100025304(v3);
LABEL_43:

                      sub_100025304(v3);
                      swift_endAccess();
                      swift_unknownObjectRelease();
                      id v30 = v10;
                      uint64_t v2 = (Swift::Int *)&v46;
                      sub_1000417D0();
                      Swift::Int v3 = *(void *)((v46 & 0xFFFFFFFFFFFFFF8) + 0x10);
                      if ((unint64_t)v3 >= *(void *)((v46 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
                        sub_100041820();
                      }
                      sub_100041840();
                      sub_100041810();
                      goto LABEL_5;
                    }
                    if (v19) {
                      goto LABEL_29;
                    }
LABEL_30:
                    unint64_t v24 = (void *)sub_100025304(v3);
                    id v25 = (Swift::Int *)*v7;
                    uint64_t v26 = (uint64_t)*v8;
                    if (*v7)
                    {
                      swift_beginAccess();
                      uint64_t v4 = v25[3] & 0x3F;
                      unint64_t v27 = *(void *)(v26 + 16);
                      if (v4) {
                        goto LABEL_39;
                      }
                    }
                    else
                    {
                      uint64_t v4 = 0;
                      unint64_t v27 = *(void *)(v26 + 16);
                    }
                    if (v27 < 0x10)
                    {
                      swift_release();
                      *uint64_t v7 = 0;
                      goto LABEL_43;
                    }
LABEL_39:
                    uint64_t v28 = sub_100041410();
                    if (v4 <= v28) {
                      uint64_t v29 = v28;
                    }
                    else {
                      uint64_t v29 = v4;
                    }
                    uint64_t v4 = sub_100024A2C(v26, v29, 0, v4);
                    swift_release();
                    *uint64_t v7 = v4;
                    goto LABEL_43;
                  }
                  uint64_t v4 = 0;
                  uint64_t v31 = v13 - 5;
                  id v32 = v12 + 9;
                  while (v31 != v4)
                  {
                    id v33 = v32[v4];
                    LOBYTE(v3) = sub_1000419C0();

                    ++v4;
                    if (v3)
                    {
                      uint64_t v17 = 0;
                      Swift::Int v3 = v4 + 4;
                      goto LABEL_15;
                    }
                  }
                }
              }
            }
          }
        }
        swift_endAccess();
LABEL_5:

        if (v6 == v43)
        {
          swift_bridgeObjectRelease();
          uint64_t v2 = v41;
          if (v40) {
            goto LABEL_66;
          }
          return v46;
        }
      }
    }
  }
  swift_bridgeObjectRelease();
  if ((v3 & 1) == 0) {
    return v46;
  }
LABEL_66:
  swift_beginAccess();
  uint64_t v35 = v2[2];
  uint64_t v34 = v2[3];
  uint64_t v36 = v2[4];
  swift_retain();
  swift_retain();
  swift_retain();
  sub_100027A68(v35, v34, v36);
  Swift::String v45 = v37;
  sub_10002884C(&v45, (uint64_t (*)(uint64_t *, uint64_t *, void **, uint64_t *))sub_100020654);
  swift_release();
  swift_release();
  swift_release();
  uint64_t v38 = v45[2];
  if (v38 == *(void *)(v36 + 16))
  {
    sub_100025A44((uint64_t)(v45 + 4), v38, v2 + 2);
    swift_release();
    swift_endAccess();
    return v46;
  }
  __break(1u);
LABEL_70:
  __break(1u);
LABEL_71:
  __break(1u);
  swift_release();
  swift_release();
  swift_release();
  uint64_t result = swift_release();
  __break(1u);
  return result;
}

uint64_t sub_1000213DC()
{
  swift_release();
  swift_release();
  swift_release();

  return _swift_deallocClassInstance(v0, 40, 7);
}

uint64_t sub_100021438()
{
  type metadata accessor for VoicemailActor();
  swift_initStaticObject();
  sub_10002962C((unint64_t *)&qword_100068530, (void (*)(uint64_t))type metadata accessor for VoicemailActor);
  uint64_t v1 = sub_100041850();
  return _swift_task_switch(sub_1000214FC, v1, v0);
}

uint64_t sub_1000214FC()
{
  if (qword_100068440 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_1000416D0();
  sub_10001F3C4(v1, (uint64_t)qword_100068B20);
  uint64_t v2 = sub_1000416B0();
  os_log_type_t v3 = sub_100041930();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "This must be overriden, its a misuse to use this directly without overriding this property", v4, 2u);
    swift_slowDealloc();
  }

  uint64_t v5 = *(uint64_t (**)(void *))(v0 + 8);
  return v5(&_swiftEmptyArrayStorage);
}

uint64_t sub_10002161C()
{
  v1[12] = v0;
  sub_100016F7C((uint64_t *)&unk_100069380);
  v1[13] = swift_task_alloc();
  v1[14] = type metadata accessor for VoicemailActor();
  swift_initStaticObject();
  v1[15] = sub_10002962C((unint64_t *)&qword_100068530, (void (*)(uint64_t))type metadata accessor for VoicemailActor);
  uint64_t v3 = sub_100041850();
  v1[16] = v3;
  v1[17] = v2;
  return _swift_task_switch(sub_10002171C, v3, v2);
}

uint64_t sub_10002171C()
{
  uint64_t v35 = v0;
  if (qword_100068448 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_1000416D0();
  v0[18] = sub_10001F3C4(v1, (uint64_t)qword_10006A268);
  uint64_t v2 = sub_1000416B0();
  os_log_type_t v3 = sub_100041940();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    unint64_t v34 = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 136315138;
    v0[11] = sub_10001F3FC(0x73654D6863746566, 0xEF29287365676173, (uint64_t *)&v34);
    sub_1000419E0();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "CachedVoicemailManager: %s", v4, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  uint64_t v5 = v0[12];
  unint64_t v6 = *(void *)(v5 + 16);
  v0[19] = v6;
  if (v6 >> 62)
  {
    if (v6 >> 62 == 1)
    {
      uint64_t v7 = (void *)(v6 & 0x3FFFFFFFFFFFFFFFLL);
      uint64_t v8 = (void *)(v5 + 24);
      swift_retain();
      swift_beginAccess();
      uint64_t v9 = *(void *)(v5 + 24);
      uint64_t v10 = *(void *)(v9 + 16);
      if (v10)
      {
        swift_bridgeObjectRetain();
        uint64_t v11 = v9 + 40;
        do
        {
          id v12 = *(void (**)(unint64_t *))(v11 - 8);
          unint64_t v34 = v6 & 0x3FFFFFFFFFFFFFFFLL;
          swift_retain();
          v12(&v34);
          swift_release();
          v11 += 16;
          --v10;
        }
        while (v10);
        swift_bridgeObjectRelease();
      }
      void *v8 = _swiftEmptyArrayStorage;
      swift_bridgeObjectRelease();
      uint64_t v13 = sub_1000416B0();
      os_log_type_t v14 = sub_100041940();
      if (os_log_type_enabled(v13, v14))
      {
        char v15 = (uint8_t *)swift_slowAlloc();
        unint64_t v34 = swift_slowAlloc();
        *(_DWORD *)char v15 = 136315138;
        v0[9] = sub_10001F3FC(0x73654D6863746566, 0xEF29287365676173, (uint64_t *)&v34);
        sub_1000419E0();
        _os_log_impl((void *)&_mh_execute_header, v13, v14, "CachedVoicemailManager: %s returning voicemails", v15, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }

      swift_beginAccess();
      uint64_t v16 = v7[2];
      uint64_t v17 = v7[3];
      uint64_t v18 = v7[4];
      swift_retain();
      swift_retain();
      swift_retain();
      uint64_t v19 = sub_100024574(v16, v17, v18);
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      swift_task_dealloc();
      id v20 = (uint64_t (*)(void *))v0[1];
      return v20(v19);
    }
    uint64_t v26 = v0[15];
    uint64_t v27 = v0[13];
    uint64_t v28 = sub_1000418B0();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(v27, 1, 1, v28);
    uint64_t v29 = swift_allocObject();
    swift_weakInit();
    uint64_t inited = swift_initStaticObject();
    uint64_t v31 = (void *)swift_allocObject();
    v31[2] = inited;
    v31[3] = v26;
    v31[4] = v29;
    uint64_t v32 = sub_100039FA8(v27, (uint64_t)&unk_100068DA0, (uint64_t)v31);
    v0[21] = v32;
    *(void *)(v5 + 16) = v32;
    swift_retain();
    swift_release();
    id v33 = (void *)swift_task_alloc();
    v0[22] = v33;
    uint64_t v23 = type metadata accessor for CachedVoicemailManager.Cache();
    *id v33 = v0;
    v33[1] = sub_100022098;
    unint64_t v24 = v0 + 10;
    uint64_t v25 = v32;
  }
  else
  {
    swift_retain();
    uint64_t v22 = (void *)swift_task_alloc();
    v0[20] = v22;
    uint64_t v23 = type metadata accessor for CachedVoicemailManager.Cache();
    *uint64_t v22 = v0;
    v22[1] = sub_100021CEC;
    unint64_t v24 = v0 + 8;
    uint64_t v25 = v6;
  }
  return Task<>.value.getter(v24, v25, v23);
}

uint64_t sub_100021CEC()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 136);
  uint64_t v3 = *(void *)(v1 + 128);
  return _swift_task_switch(sub_100021E0C, v3, v2);
}

uint64_t sub_100021E0C()
{
  uint64_t v17 = v0;
  swift_release();
  uint64_t v1 = (void *)v0[8];
  uint64_t v2 = v0[12] + 24;
  swift_beginAccess();
  uint64_t v3 = *(void *)v2;
  uint64_t v4 = *(void *)(*(void *)v2 + 16);
  if (v4)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = v3 + 40;
    do
    {
      unint64_t v6 = *(void (**)(void **))(v5 - 8);
      uint64_t v16 = v1;
      swift_retain();
      v6(&v16);
      swift_release();
      v5 += 16;
      --v4;
    }
    while (v4);
    swift_bridgeObjectRelease();
  }
  *(void *)uint64_t v2 = _swiftEmptyArrayStorage;
  swift_bridgeObjectRelease();
  uint64_t v7 = sub_1000416B0();
  os_log_type_t v8 = sub_100041940();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v16 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 136315138;
    v0[9] = sub_10001F3FC(0x73654D6863746566, 0xEF29287365676173, (uint64_t *)&v16);
    sub_1000419E0();
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "CachedVoicemailManager: %s returning voicemails", v9, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  swift_beginAccess();
  uint64_t v10 = v1[2];
  uint64_t v11 = v1[3];
  uint64_t v12 = v1[4];
  swift_retain();
  swift_retain();
  swift_retain();
  uint64_t v13 = sub_100024574(v10, v11, v12);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_task_dealloc();
  os_log_type_t v14 = (uint64_t (*)(void *))v0[1];
  return v14(v13);
}

uint64_t sub_100022098()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 136);
  uint64_t v3 = *(void *)(v1 + 128);
  return _swift_task_switch(sub_1000221B8, v3, v2);
}

uint64_t sub_1000221B8()
{
  uint64_t v17 = v0;
  swift_release();
  uint64_t v1 = (void *)v0[10];
  uint64_t v2 = v0[12] + 24;
  swift_beginAccess();
  uint64_t v3 = *(void *)v2;
  uint64_t v4 = *(void *)(*(void *)v2 + 16);
  if (v4)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = v3 + 40;
    do
    {
      unint64_t v6 = *(void (**)(void **))(v5 - 8);
      uint64_t v16 = v1;
      swift_retain();
      v6(&v16);
      swift_release();
      v5 += 16;
      --v4;
    }
    while (v4);
    swift_bridgeObjectRelease();
  }
  *(void *)uint64_t v2 = _swiftEmptyArrayStorage;
  swift_bridgeObjectRelease();
  uint64_t v7 = sub_1000416B0();
  os_log_type_t v8 = sub_100041940();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v16 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 136315138;
    v0[9] = sub_10001F3FC(0x73654D6863746566, 0xEF29287365676173, (uint64_t *)&v16);
    sub_1000419E0();
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "CachedVoicemailManager: %s returning voicemails", v9, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  swift_beginAccess();
  uint64_t v10 = v1[2];
  uint64_t v11 = v1[3];
  uint64_t v12 = v1[4];
  swift_retain();
  swift_retain();
  swift_retain();
  uint64_t v13 = sub_100024574(v10, v11, v12);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_task_dealloc();
  os_log_type_t v14 = (uint64_t (*)(void *))v0[1];
  return v14(v13);
}

uint64_t sub_100022440(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[7] = a1;
  v4[8] = a4;
  type metadata accessor for VoicemailActor();
  swift_initStaticObject();
  sub_10002962C((unint64_t *)&qword_100068530, (void (*)(uint64_t))type metadata accessor for VoicemailActor);
  uint64_t v6 = sub_100041850();
  v4[9] = v6;
  v4[10] = v5;
  return _swift_task_switch(sub_100022508, v6, v5);
}

uint64_t sub_100022508()
{
  uint64_t v14 = v0;
  if (qword_100068448 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_1000416D0();
  *(void *)(v0 + 88) = sub_10001F3C4(v1, (uint64_t)qword_10006A268);
  uint64_t v2 = sub_1000416B0();
  os_log_type_t v3 = sub_100041940();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 136315138;
    *(void *)(v0 + 48) = sub_10001F3FC(0x73654D6863746566, 0xEF29287365676173, &v13);
    sub_1000419E0();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "CachedVoicemailManager: %s inside of a task", v4, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  *(void *)(v0 + 96) = Strong;
  if (Strong)
  {
    uint64_t v12 = (uint64_t (*)(void))(*(void *)(*(void *)Strong + 144) + **(int **)(*(void *)Strong + 144));
    uint64_t v6 = (void *)swift_task_alloc();
    *(void *)(v0 + 104) = v6;
    *uint64_t v6 = v0;
    v6[1] = sub_10002280C;
    uint64_t v7 = v12;
  }
  else
  {
    type metadata accessor for CachedVoicemailManager.Cache();
    uint64_t v9 = (void *)swift_allocObject();
    v9[2] = sub_100027BA8((uint64_t)_swiftEmptyArrayStorage);
    v9[3] = v10;
    v9[4] = v11;
    **(void **)(v0 + 56) = v9;
    uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
  }
  return v7();
}

uint64_t sub_10002280C(uint64_t a1)
{
  uint64_t v4 = *(void **)v2;
  *(void *)(*(void *)v2 + 112) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = v4[9];
    uint64_t v6 = v4[10];
    uint64_t v7 = sub_100022B04;
  }
  else
  {
    v4[15] = a1;
    uint64_t v5 = v4[9];
    uint64_t v6 = v4[10];
    uint64_t v7 = sub_100022934;
  }
  return _swift_task_switch(v7, v5, v6);
}

uint64_t sub_100022934()
{
  uint64_t v9 = v0;
  uint64_t v1 = *(void *)(v0 + 96);
  uint64_t v2 = sub_100028A2C(*(void *)(v0 + 120), (void *)1);
  *(void *)(v1 + 16) = v2 | 0x4000000000000000;
  swift_retain();
  swift_release();
  os_log_type_t v3 = sub_1000416B0();
  os_log_type_t v4 = sub_100041940();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136315138;
    *(void *)(v0 + 40) = sub_10001F3FC(0x73654D6863746566, 0xEF29287365676173, &v8);
    sub_1000419E0();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "CachedVoicemailManager: %s returning cache from a task", v5, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
    swift_release();
  }
  else
  {

    swift_release();
  }
  **(void **)(v0 + 56) = v2;
  uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t sub_100022B04()
{
  type metadata accessor for CachedVoicemailManager.Cache();
  uint64_t v1 = (void *)swift_allocObject();
  v1[2] = sub_100027BA8((uint64_t)_swiftEmptyArrayStorage);
  v1[3] = v2;
  v1[4] = v3;
  swift_errorRelease();
  swift_release();
  **(void **)(v0 + 56) = v1;
  os_log_type_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_100022D1C(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  type metadata accessor for VoicemailActor();
  swift_initStaticObject();
  sub_10002962C((unint64_t *)&qword_100068530, (void (*)(uint64_t))type metadata accessor for VoicemailActor);
  uint64_t v4 = sub_100041850();
  return _swift_task_switch(sub_100022DE4, v4, v3);
}

uint64_t sub_100022DE4()
{
  *(void *)(v0 + 32) = _Block_copy(*(const void **)(v0 + 16));
  swift_retain();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 40) = v1;
  void *v1 = v0;
  v1[1] = sub_100022E8C;
  return sub_10002161C();
}

uint64_t sub_100022E8C()
{
  uint64_t v1 = *(void (***)(void, void))(*v0 + 32);
  uint64_t v5 = *v0;
  swift_task_dealloc();
  swift_release();
  sub_100016F7C(&qword_1000687E0);
  Class isa = sub_1000417E0().super.isa;
  swift_bridgeObjectRelease();
  ((void (**)(void, Class))v1)[2](v1, isa);

  _Block_release(v1);
  uint64_t v3 = *(uint64_t (**)(void))(v5 + 8);
  return v3();
}

uint64_t sub_100023000(uint64_t a1)
{
  v2[9] = a1;
  v2[10] = v1;
  type metadata accessor for VoicemailActor();
  swift_initStaticObject();
  sub_10002962C((unint64_t *)&qword_100068530, (void (*)(uint64_t))type metadata accessor for VoicemailActor);
  uint64_t v4 = sub_100041850();
  v2[11] = v4;
  v2[12] = v3;
  return _swift_task_switch(sub_1000230C8, v4, v3);
}

uint64_t sub_1000230C8()
{
  unint64_t v1 = *(void *)(v0[10] + 16);
  v0[13] = v1;
  if (!(v1 >> 62))
  {
    swift_retain();
    uint64_t v13 = (void *)swift_task_alloc();
    v0[14] = v13;
    uint64_t v10 = type metadata accessor for CachedVoicemailManager.Cache();
    *uint64_t v13 = v0;
    v13[1] = sub_1000232A4;
    unint64_t v8 = (unint64_t)(v0 + 8);
    unint64_t v9 = v1;
    return Task<>.value.getter(v8, v9, v10);
  }
  if (v1 >> 62 != 1)
  {
    uint64_t v11 = 0;
    goto LABEL_12;
  }
  uint64_t v2 = (void *)v0[9];
  uint64_t v3 = (void *)(v1 & 0x3FFFFFFFFFFFFFFFLL);
  swift_beginAccess();
  uint64_t v4 = v3[2];
  uint64_t v5 = v3[3];
  uint64_t v6 = v3[4];
  swift_retain();
  id v7 = v2;
  swift_retain();
  swift_retain();
  swift_retain();
  unint64_t v8 = sub_100024670((uint64_t)v7, v4, v5);
  uint64_t v11 = 0;
  if ((v9 & 1) == 0)
  {
    if ((v8 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (v8 < *(void *)(v6 + 16))
    {
      uint64_t v11 = *(void *)(v6 + 8 * v8 + 32);
      swift_unknownObjectRetain();
      goto LABEL_7;
    }
    __break(1u);
    return Task<>.value.getter(v8, v9, v10);
  }
LABEL_7:
  uint64_t v12 = (void *)v0[9];
  swift_release();
  swift_release();
  swift_release();

  swift_release();
LABEL_12:
  uint64_t v14 = (uint64_t (*)(uint64_t))v0[1];
  return v14(v11);
}

uint64_t sub_1000232A4()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 96);
  uint64_t v3 = *(void *)(v1 + 88);
  return _swift_task_switch(sub_1000233C4, v3, v2);
}

unint64_t sub_1000233C4()
{
  uint64_t v1 = (void *)v0[8];
  uint64_t v2 = (void *)v0[9];
  swift_beginAccess();
  uint64_t v4 = v1[2];
  uint64_t v3 = v1[3];
  uint64_t v5 = v1[4];
  swift_retain();
  id v6 = v2;
  swift_retain();
  swift_retain();
  unint64_t result = sub_100024670((uint64_t)v6, v4, v3);
  uint64_t v8 = 0;
  if ((v9 & 1) == 0)
  {
    if ((result & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (result < *(void *)(v5 + 16))
    {
      uint64_t v8 = *(void *)(v5 + 8 * result + 32);
      swift_unknownObjectRetain();
      goto LABEL_5;
    }
    __break(1u);
    return result;
  }
LABEL_5:
  uint64_t v10 = (void *)v0[9];
  swift_release();

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v11 = (uint64_t (*)(uint64_t))v0[1];
  return v11(v8);
}

uint64_t sub_10002366C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  type metadata accessor for VoicemailActor();
  swift_initStaticObject();
  sub_10002962C((unint64_t *)&qword_100068530, (void (*)(uint64_t))type metadata accessor for VoicemailActor);
  uint64_t v5 = sub_100041850();
  return _swift_task_switch(sub_100023738, v5, v4);
}

uint64_t sub_100023738()
{
  uint64_t v1 = *(void **)(v0 + 16);
  *(void *)(v0 + 40) = _Block_copy(*(const void **)(v0 + 24));
  id v2 = v1;
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 48) = v3;
  void *v3 = v0;
  v3[1] = sub_1000237F8;
  uint64_t v4 = *(void *)(v0 + 16);
  return sub_100023000(v4);
}

uint64_t sub_1000237F8(uint64_t a1)
{
  uint64_t v3 = *(void (***)(void, void))(*v1 + 40);
  uint64_t v4 = *(void **)(*v1 + 16);
  uint64_t v7 = *v1;
  swift_task_dealloc();
  swift_release();

  v3[2](v3, a1);
  _Block_release(v3);
  swift_unknownObjectRelease();
  uint64_t v5 = *(uint64_t (**)(void))(v7 + 8);
  return v5();
}

uint64_t sub_100023964(uint64_t a1, unint64_t a2)
{
  return sub_1000207C4(a2, 1);
}

uint64_t sub_100023990(unint64_t a1, uint64_t *a2)
{
  uint64_t v5 = *(void *)(v2 + 16) >> 62;
  if (!v5)
  {
    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = a1;
    uint64_t v15 = (void *)(v2 + 24);
    swift_beginAccess();
    uint64_t v16 = *(void **)(v2 + 24);
    swift_bridgeObjectRetain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)(v2 + 24) = v16;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      uint64_t v16 = sub_1000365B0(0, v16[2] + 1, 1, v16);
      void *v15 = v16;
    }
    unint64_t v19 = v16[2];
    unint64_t v18 = v16[3];
    if (v19 >= v18 >> 1)
    {
      uint64_t v16 = sub_1000365B0((void *)(v18 > 1), v19 + 1, 1, v16);
      void *v15 = v16;
    }
    v16[2] = v19 + 1;
    id v20 = &v16[2 * v19];
    v20[4] = sub_1000295EC;
    v20[5] = v14;
    swift_endAccess();
    uint64_t v13 = 1;
    sub_100028974();
    swift_willThrowTypedImpl();
    goto LABEL_17;
  }
  if (v5 != 1)
  {
    sub_100028974();
    swift_willThrowTypedImpl();
    uint64_t v13 = 0;
    goto LABEL_17;
  }
  swift_retain();
  uint64_t v6 = sub_100020DE8(a1, 1);
  unint64_t v7 = swift_bridgeObjectRetain();
  uint64_t v8 = sub_100029478(v7);
  swift_bridgeObjectRelease();
  if ((v8 & 0xC000000000000001) != 0)
  {
    if (v8 < 0) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = v8 & 0xFFFFFFFFFFFFFF8;
    }
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_100041A40();
    Swift::Int v11 = sub_10002636C(v9, v10);
    swift_bridgeObjectRelease();
    uint64_t v8 = v11;
  }
  uint64_t v12 = (uint64_t)sub_100026554(v6, v8);
  uint64_t v13 = v12;
  if ((v12 & 0xC000000000000001) != 0)
  {
    if (sub_100041A40())
    {
LABEL_10:
      swift_bridgeObjectRelease();
      sub_100028974();
      swift_willThrowTypedImpl();
      swift_release();
LABEL_17:
      *a2 = v13;
      return (uint64_t)a2;
    }
  }
  else if (*(void *)(v12 + 16))
  {
    goto LABEL_10;
  }
  swift_release();
  if (v6 < 0 || (v6 & 0x4000000000000000) != 0)
  {
    a2 = sub_10002446C(v6, (void (*)(void *, uint64_t, unint64_t))sub_100039888);
    swift_bridgeObjectRelease();
    swift_release();
  }
  else
  {
    swift_release();
    return v6 & 0xFFFFFFFFFFFFFF8;
  }
  return (uint64_t)a2;
}

uint64_t sub_100023C28(unint64_t a1, uint64_t *a2)
{
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a1;
  uint64_t v6 = *(void *)(v2 + 16) >> 62;
  if (v6)
  {
    if (v6 == 1)
    {
      swift_bridgeObjectRetain();
      unint64_t v7 = (void *)swift_retain();
      sub_100023E20(v7, a1);
      swift_release();
      return swift_release();
    }
    sub_100028974();
    swift_bridgeObjectRetain();
    swift_willThrowTypedImpl();
    uint64_t result = swift_release();
    uint64_t v16 = 0;
  }
  else
  {
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = sub_100028908;
    *(void *)(v9 + 24) = v5;
    uint64_t v10 = (void *)(v2 + 24);
    swift_beginAccess();
    Swift::Int v11 = *(void **)(v2 + 24);
    swift_bridgeObjectRetain();
    swift_retain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)(v2 + 24) = v11;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      Swift::Int v11 = sub_1000365B0(0, v11[2] + 1, 1, v11);
      *uint64_t v10 = v11;
    }
    unint64_t v14 = v11[2];
    unint64_t v13 = v11[3];
    if (v14 >= v13 >> 1)
    {
      Swift::Int v11 = sub_1000365B0((void *)(v13 > 1), v14 + 1, 1, v11);
      *uint64_t v10 = v11;
    }
    _OWORD v11[2] = v14 + 1;
    uint64_t v15 = &v11[2 * v14];
    v15[4] = sub_100028948;
    v15[5] = v9;
    swift_endAccess();
    uint64_t v16 = 1;
    sub_100028974();
    swift_willThrowTypedImpl();
    uint64_t result = swift_release();
  }
  *a2 = v16;
  return result;
}

uint64_t sub_100023E20(void *a1, unint64_t a2)
{
  if (a2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_100041BA0();
    if (v4) {
      goto LABEL_3;
    }
LABEL_18:
    swift_bridgeObjectRelease();
    goto LABEL_19;
  }
  uint64_t v4 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v4) {
    goto LABEL_18;
  }
LABEL_3:
  if (v4 < 1) {
    goto LABEL_22;
  }
  uint64_t v5 = 0;
  unint64_t v24 = a1;
  p_types = &stru_100064FF8.types;
  unint64_t v7 = &unk_100068000;
  do
  {
    if ((a2 & 0xC000000000000001) != 0)
    {
      uint64_t v8 = (void *)sub_100041AE0();
    }
    else
    {
      uint64_t v8 = *(void **)(a2 + 8 * v5 + 32);
      swift_unknownObjectRetain();
    }
    id v9 = [v8 p_types[170] v24];
    swift_beginAccess();
    uint64_t v10 = sub_100020504((uint64_t)v8, v9);
    swift_endAccess();

    swift_unknownObjectRelease();
    if (v10)
    {
      swift_unknownObjectRelease();
    }
    else
    {
      if (v7[136] != -1) {
        swift_once();
      }
      uint64_t v11 = sub_1000416D0();
      sub_10001F3C4(v11, (uint64_t)qword_100068B20);
      swift_unknownObjectRetain_n();
      uint64_t v12 = sub_1000416B0();
      os_log_type_t v13 = sub_100041920();
      if (os_log_type_enabled(v12, v13))
      {
        uint64_t v14 = swift_slowAlloc();
        uint64_t v25 = v8;
        v26[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v14 = 136315138;
        swift_unknownObjectRetain();
        sub_100016F7C(&qword_1000687E0);
        uint64_t v15 = sub_100041790();
        *(void *)(v14 + 4) = sub_10001F3FC(v15, v16, v26);
        swift_unknownObjectRelease_n();
        p_types = (char **)(&stru_100064FF8 + 8);
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v12, v13, "CachedVoicemailmanager: Told to update message but no message was found with id: %s", (uint8_t *)v14, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        unint64_t v7 = (void *)&unk_100068000;
        swift_slowDealloc();
        swift_unknownObjectRelease();
      }
      else
      {

        swift_unknownObjectRelease_n();
      }
    }
    ++v5;
  }
  while (v4 != v5);
  swift_bridgeObjectRelease();
  a1 = v24;
LABEL_19:
  uint64_t v17 = a1 + 2;
  swift_beginAccess();
  uint64_t v18 = a1[2];
  uint64_t v19 = a1[3];
  uint64_t v20 = a1[4];
  swift_retain();
  swift_retain();
  swift_retain();
  sub_100027A68(v18, v19, v20);
  uint64_t v25 = v21;
  sub_10002884C(&v25, (uint64_t (*)(uint64_t *, uint64_t *, void **, uint64_t *))sub_100020654);
  swift_release();
  swift_release();
  swift_release();
  uint64_t v22 = v25[2];
  if (v22 == *(void *)(v20 + 16))
  {
    sub_100025A44((uint64_t)(v25 + 4), v22, v17);
    swift_release();
    return swift_endAccess();
  }
  __break(1u);
LABEL_22:
  __break(1u);
  swift_release();
  swift_release();
  swift_release();
  uint64_t result = swift_release();
  __break(1u);
  return result;
}

uint64_t sub_100024204()
{
  swift_release();
  swift_bridgeObjectRelease();

  return _swift_deallocClassInstance(v0, 32, 7);
}

uint64_t type metadata accessor for CachedVoicemailManager()
{
  return self;
}

uint64_t type metadata accessor for CachedVoicemailManager.Cache()
{
  return self;
}

void *initializeBufferWithCopyOfBuffer for CachedVoicemailManager.Cache.State(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  return a1;
}

uint64_t destroy for CachedVoicemailManager.Cache.State()
{
  return swift_release();
}

void *assignWithCopy for CachedVoicemailManager.Cache.State(void *a1, void *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  return a1;
}

void *initializeWithTake for CachedVoicemailManager.Cache.State(void *result, void *a2)
{
  *uint64_t result = *a2;
  return result;
}

void *assignWithTake for CachedVoicemailManager.Cache.State(void *a1, void *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for CachedVoicemailManager.Cache.State(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7E && *(unsigned char *)(a1 + 8)) {
    return (*(_DWORD *)a1 + 126);
  }
  unsigned int v3 = (((*(void *)a1 >> 57) >> 5) | (4 * ((*(void *)a1 >> 57) & 0x18 | *(void *)a1 & 7))) ^ 0x7F;
  if (v3 >= 0x7D) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for CachedVoicemailManager.Cache.State(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7D)
  {
    *(void *)uint64_t result = a2 - 126;
    if (a3 >= 0x7E) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7E) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2)
    {
      uint64_t v3 = (-a2 >> 2) & 0x1F | (32 * (-a2 & 0x7F));
      *(void *)uint64_t result = (v3 | (v3 << 57)) & 0xF000000000000007;
    }
  }
  return result;
}

uint64_t sub_100024404(void *a1)
{
  uint64_t v1 = *a1 >> 62;
  if (v1 <= 1) {
    return v1;
  }
  else {
    return (*a1 >> 3) + 2;
  }
}

void *sub_100024420(void *result)
{
  *result &= 0x3FFFFFFFFFFFFFFFuLL;
  return result;
}

unint64_t *sub_100024430(unint64_t *result, uint64_t a2)
{
  if (a2 < 2)
  {
    uint64_t v2 = *result & 0xFFFFFFFFFFFFFF8;
    unint64_t v3 = a2 << 62;
  }
  else
  {
    uint64_t v2 = 8 * (a2 - 2);
    unint64_t v3 = 0x8000000000000000;
  }
  *uint64_t result = v2 | v3;
  return result;
}

ValueMetadata *type metadata accessor for CachedVoicemailManager.Cache.State()
{
  return &type metadata for CachedVoicemailManager.Cache.State;
}

void *sub_10002446C(unint64_t a1, void (*a2)(void *, uint64_t, unint64_t))
{
  if (a1 >> 62) {
    goto LABEL_10;
  }
  uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v4) {
    return _swiftEmptyArrayStorage;
  }
  while (1)
  {
    if (v4 <= 0)
    {
      uint64_t v5 = _swiftEmptyArrayStorage;
    }
    else
    {
      sub_100016F7C((uint64_t *)&unk_100068B00);
      uint64_t v5 = (void *)swift_allocObject();
      int64_t v6 = j__malloc_size(v5);
      uint64_t v7 = v6 - 32;
      if (v6 < 32) {
        uint64_t v7 = v6 - 25;
      }
      void v5[2] = v4;
      v5[3] = (2 * (v7 >> 3)) | 1;
    }
    swift_bridgeObjectRetain();
    a2(v5 + 4, v4, a1);
    a2 = v8;
    swift_bridgeObjectRelease();
    if (a2 == (void (*)(void *, uint64_t, unint64_t))v4) {
      break;
    }
    __break(1u);
LABEL_10:
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_100041BA0();
    swift_bridgeObjectRelease();
    if (!v4) {
      return _swiftEmptyArrayStorage;
    }
  }
  return v5;
}

void *sub_100024574(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a3 + 16);
  if (!v3) {
    return _swiftEmptyArrayStorage;
  }
  sub_100016F7C((uint64_t *)&unk_100068B00);
  uint64_t v7 = (void *)swift_allocObject();
  int64_t v8 = j__malloc_size(v7);
  uint64_t v9 = v8 - 32;
  if (v8 < 32) {
    uint64_t v9 = v8 - 25;
  }
  v7[2] = v3;
  v7[3] = (2 * (v9 >> 3)) | 1;
  uint64_t v10 = sub_1000276D0(&v12, (uint64_t)(v7 + 4), v3, a1, a2, a3);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_release();
  swift_release();
  swift_release();
  if (v10 != (void *)v3)
  {
    __break(1u);
    return _swiftEmptyArrayStorage;
  }
  return v7;
}

uint64_t sub_100024670(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = (id *)(a3 + 32);
  uint64_t v5 = *(void *)(a3 + 16);
  if (!a2)
  {
    if (v5)
    {
      type metadata accessor for MessageID(0);
      id v9 = *v4;
      char v10 = sub_1000419C0();

      if (v10) {
        return 0;
      }
      if (v5 == 1) {
        return 0;
      }
      id v11 = *(id *)(a3 + 40);
      char v12 = sub_1000419C0();

      if (v12) {
        return 1;
      }
      if (v5 != 2)
      {
        id v14 = *(id *)(a3 + 48);
        char v15 = sub_1000419C0();

        if (v15) {
          return 2;
        }
        if (v5 != 3)
        {
          id v16 = *(id *)(a3 + 56);
          char v17 = sub_1000419C0();

          if (v17) {
            return 3;
          }
          uint64_t v18 = 0;
          uint64_t v19 = a3 + 64;
          while (v5 - 4 != v18)
          {
            id v20 = *(id *)(v19 + 8 * v18);
            char v21 = sub_1000419C0();

            ++v18;
            if (v21) {
              return v18 + 3;
            }
          }
          return 0;
        }
      }
    }
    return 0;
  }
  int64_t v6 = (Swift::Int *)(a2 + 16);
  swift_retain();
  Swift::Int v7 = sub_100024BCC(a1, (uint64_t)v4, v5, v6);
  swift_release();
  return v7;
}

uint64_t sub_10002485C(void *a1)
{
  id v2 = a1;
  sub_100041B10();
  sub_100041B40();
  sub_100041B50();
  uint64_t result = sub_100041B20();
  uint64_t v4 = *(void *)(v1[1] + 16);
  if (*v1)
  {
    swift_beginAccess();
    if (sub_1000413E0() >= v4)
    {
      uint64_t result = swift_isUniquelyReferenced_native();
      uint64_t v5 = *v1;
      if (!result)
      {
        if (!v5)
        {
LABEL_12:
          __break(1u);
          return result;
        }
        uint64_t v5 = sub_100041400();
        uint64_t result = swift_release();
        uint64_t *v1 = v5;
      }
      if (v5) {
        return sub_1000413A0();
      }
      __break(1u);
      goto LABEL_12;
    }
  }
  else if ((unint64_t)v4 < 0x10)
  {
    return result;
  }
  return sub_100024988();
}

uint64_t sub_100024988()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[1];
  if (*v0)
  {
    swift_beginAccess();
    uint64_t v3 = *(void *)(v1 + 24) & 0x3FLL;
    unint64_t v4 = *(void *)(v2 + 16);
    if (v3) {
      goto LABEL_7;
    }
  }
  else
  {
    uint64_t v3 = 0;
    unint64_t v4 = *(void *)(v2 + 16);
  }
  if (v4 < 0x10)
  {
    uint64_t v5 = 0;
    goto LABEL_11;
  }
LABEL_7:
  uint64_t v6 = sub_100041410();
  if (v3 <= v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = v3;
  }
  uint64_t v5 = sub_100024A2C(v2, v7, 0, v3);
LABEL_11:
  uint64_t result = swift_release();
  uint64_t *v0 = v5;
  return result;
}

uint64_t sub_100024A2C(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v8 = sub_100041410();
  uint64_t v9 = 0;
  if (a3) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = a2;
  }
  if (v10 <= v8) {
    uint64_t v10 = v8;
  }
  if (v10 <= a4) {
    uint64_t v11 = a4;
  }
  else {
    uint64_t v11 = v10;
  }
  if (v11 >= 5)
  {
    uint64_t v9 = sub_100041420();
    sub_100024AC0(v9 + 16, v9 + 32, a1);
  }
  return v9;
}

Swift::Int sub_100024AC0(Swift::Int result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a3 + 16);
  if (v3)
  {
    unint64_t v4 = (Swift::Int *)result;
    uint64_t v5 = 0;
    uint64_t v9 = a3 + 32;
    while (1)
    {
      Swift::Int v6 = *v4;
      id v7 = *(id *)(v9 + 8 * v5);
      uint64_t result = sub_1000419B0(v6);
      if (__OFSUB__(1 << *v4, 1)) {
        break;
      }
      uint64_t v8 = sub_100041380();

      if (v8)
      {
        while (1)
          sub_1000413D0();
      }
      uint64_t result = sub_1000413C0();
      if (++v5 == v3) {
        return result;
      }
    }
    __break(1u);
  }
  return result;
}

Swift::Int sub_100024BCC(uint64_t a1, uint64_t a2, uint64_t a3, Swift::Int *a4)
{
  Swift::Int result = sub_1000419B0(*a4);
  if (__OFSUB__(1 << *a4, 1))
  {
    __break(1u);
  }
  else
  {
    sub_100041380();
    uint64_t v7 = sub_1000413B0();
    if ((v8 & 1) == 0)
    {
      type metadata accessor for MessageID(0);
      do
      {
        id v9 = *(id *)(a2 + 8 * v7);
        char v10 = sub_1000419C0();

        if (v10) {
          break;
        }
        sub_1000413D0();
        uint64_t v7 = sub_1000413B0();
      }
      while ((v11 & 1) == 0);
    }
    return v7;
  }
  return result;
}

uint64_t sub_100024D10(uint64_t result, char a2)
{
  if (result < 0)
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  uint64_t v3 = v2;
  sub_100041B30();
  uint64_t v6 = *v2;
  uint64_t v5 = v2[1];
  if (*v2)
  {
    swift_beginAccess();
    uint64_t v7 = *(void *)(v6 + 16) & 0x3FLL;
    uint64_t v8 = sub_100041410();
    uint64_t v9 = v8;
    if (a2)
    {
      uint64_t v10 = v8;
      if (v7 >= v8) {
        goto LABEL_14;
      }
    }
    else
    {
      swift_beginAccess();
      uint64_t v10 = *(void *)(v6 + 24) & 0x3FLL;
      if (v7 >= v9) {
        goto LABEL_14;
      }
    }
LABEL_10:
    if (v10 <= v9) {
      uint64_t v12 = v9;
    }
    else {
      uint64_t v12 = v10;
    }
    goto LABEL_23;
  }
  uint64_t v11 = sub_100041410();
  uint64_t v9 = v11;
  uint64_t v7 = 0;
  if (a2) {
    uint64_t v10 = v11;
  }
  else {
    uint64_t v10 = 0;
  }
  if (v11 > 0) {
    goto LABEL_10;
  }
LABEL_14:
  if (v10 > v9) {
    uint64_t v9 = v10;
  }
  Swift::Int result = sub_100041410();
  if (result <= v9) {
    uint64_t v13 = v9;
  }
  else {
    uint64_t v13 = result;
  }
  if (v13 < v7)
  {
    if (v10 <= v13) {
      uint64_t v12 = v13;
    }
    else {
      uint64_t v12 = v10;
    }
LABEL_23:
    uint64_t v14 = sub_100024A2C(v5, v12, 0, v10);
    Swift::Int result = swift_release();
    uint64_t *v3 = v14;
    return result;
  }
  if (!v6 || (Swift::Int result = swift_isUniquelyReferenced_native(), result))
  {
    uint64_t v15 = *v3;
    if (*v3) {
      goto LABEL_28;
    }
LABEL_32:
    if (!v10) {
      return result;
    }
    __break(1u);
    goto LABEL_34;
  }
  Swift::Int result = *v3;
  if (!*v3)
  {
LABEL_35:
    __break(1u);
    return result;
  }
  uint64_t v15 = sub_100041400();
  Swift::Int result = swift_release();
  uint64_t *v3 = v15;
  if (!v15) {
    goto LABEL_32;
  }
LABEL_28:
  Swift::Int result = swift_beginAccess();
  if ((*(void *)(v15 + 24) & 0x3FLL) != v10) {
    *(void *)(v15 + 24) = *(void *)(v15 + 24) & 0xFFFFFFFFFFFFFFC0 | v10 & 0x3F;
  }
  return result;
}

uint64_t sub_100024EBC(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100016F7C(&qword_100068DB0);
  char v36 = a2;
  uint64_t v6 = sub_100041BC0();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v35 = v2;
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v9 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v10 = ~(-1 << v8);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v12 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v13 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v15 = 0;
    while (1)
    {
      if (v11)
      {
        unint64_t v21 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v22 = v21 | (v15 << 6);
      }
      else
      {
        if (__OFADD__(v15++, 1)) {
          goto LABEL_38;
        }
        if (v15 >= v12)
        {
LABEL_31:
          swift_release();
          uint64_t v3 = v35;
          if (v36)
          {
            uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
            if (v34 >= 64) {
              bzero((void *)(v5 + 64), ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
            }
            else {
              *uint64_t v9 = -1 << v34;
            }
            *(void *)(v5 + 16) = 0;
          }
          break;
        }
        unint64_t v24 = v9[v15];
        if (!v24)
        {
          int64_t v25 = v15 + 1;
          if (v15 + 1 >= v12) {
            goto LABEL_31;
          }
          unint64_t v24 = v9[v25];
          if (!v24)
          {
            while (1)
            {
              int64_t v15 = v25 + 1;
              if (__OFADD__(v25, 1)) {
                break;
              }
              if (v15 >= v12) {
                goto LABEL_31;
              }
              unint64_t v24 = v9[v15];
              ++v25;
              if (v24) {
                goto LABEL_20;
              }
            }
LABEL_37:
            __break(1u);
LABEL_38:
            __break(1u);
            return result;
          }
          ++v15;
        }
LABEL_20:
        unint64_t v11 = (v24 - 1) & v24;
        unint64_t v22 = __clz(__rbit64(v24)) + (v15 << 6);
      }
      uint64_t v26 = 8 * v22;
      uint64_t v27 = *(void **)(*(void *)(v5 + 48) + v26);
      uint64_t v28 = *(void *)(*(void *)(v5 + 56) + v26);
      if ((v36 & 1) == 0)
      {
        id v29 = v27;
        swift_bridgeObjectRetain();
      }
      uint64_t result = sub_1000419B0(*(void *)(v7 + 40));
      uint64_t v16 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v17 = result & ~v16;
      unint64_t v18 = v17 >> 6;
      if (((-1 << v17) & ~*(void *)(v13 + 8 * (v17 >> 6))) != 0)
      {
        unint64_t v19 = __clz(__rbit64((-1 << v17) & ~*(void *)(v13 + 8 * (v17 >> 6)))) | v17 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v30 = 0;
        unint64_t v31 = (unint64_t)(63 - v16) >> 6;
        do
        {
          if (++v18 == v31 && (v30 & 1) != 0)
          {
            __break(1u);
            goto LABEL_37;
          }
          BOOL v32 = v18 == v31;
          if (v18 == v31) {
            unint64_t v18 = 0;
          }
          v30 |= v32;
          uint64_t v33 = *(void *)(v13 + 8 * v18);
        }
        while (v33 == -1);
        unint64_t v19 = __clz(__rbit64(~v33)) + (v18 << 6);
      }
      *(void *)(v13 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
      uint64_t v20 = 8 * v19;
      *(void *)(*(void *)(v7 + 48) + v20) = v27;
      *(void *)(*(void *)(v7 + 56) + v20) = v28;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

void *sub_100025170()
{
  uint64_t v1 = v0;
  sub_100016F7C(&qword_100068DB0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_100041BB0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_24:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    if (__OFADD__(v9++, 1)) {
      goto LABEL_26;
    }
    if (v9 >= v13) {
      goto LABEL_24;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    if (!v21) {
      break;
    }
LABEL_23:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    unint64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = *(void *)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    *(void *)(*(void *)(v4 + 56) + v16) = v18;
    id v19 = v17;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v22 = v9 + 1;
  if (v9 + 1 >= v13) {
    goto LABEL_24;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    ++v9;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_24;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_23;
    }
  }
  __break(1u);
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_100025304(unint64_t a1)
{
  uint64_t v3 = *v1;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t *v1 = v3;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v3 = sub_1000253F0(v3);
    uint64_t *v1 = v3;
  }
  unint64_t v5 = *(void *)(v3 + 16);
  if (v5 <= a1)
  {
    __break(1u);
  }
  else
  {
    unint64_t v6 = v5 - 1;
    uint64_t v7 = v5 - 1 - a1;
    if (v7 >= 0)
    {
      uint64_t v8 = v3 + 8 * a1;
      uint64_t v9 = *(void *)(v8 + 32);
      memmove((void *)(v8 + 32), (const void *)(v8 + 40), 8 * v7);
      *(void *)(v3 + 16) = v6;
      sub_100041B20();
      return v9;
    }
  }
  uint64_t result = sub_100041BE0();
  __break(1u);
  return result;
}

uint64_t sub_1000253DC(void *a1)
{
  return sub_100036904(0, a1[2], 0, a1);
}

uint64_t sub_1000253F0(uint64_t a1)
{
  return specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(a1 + 16), 0, a1);
}

void sub_100025404(uint64_t a1, Swift::Int *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = a1;
  uint64_t v20 = sub_100041380();
  sub_1000413D0();
  if (v20)
  {
    uint64_t v7 = a1;
    uint64_t v8 = sub_100041390();
    while (1)
    {
      unint64_t v9 = sub_1000413B0();
      if (v10)
      {
LABEL_25:
        __break(1u);
        return;
      }
      if ((v9 & 0x8000000000000000) != 0)
      {
        __break(1u);
LABEL_23:
        __break(1u);
LABEL_24:
        __break(1u);
        goto LABEL_25;
      }
      uint64_t v11 = *(void *)(a4 + 8);
      if (v9 >= *(void *)(v11 + 16)) {
        goto LABEL_23;
      }
      Swift::Int v12 = *a2;
      id v13 = *(id *)(v11 + 8 * v9 + 32);
      Swift::Int v14 = sub_1000419B0(v12);

      uint64_t v15 = 1 << *a2;
      if (__OFSUB__(v15, 1)) {
        goto LABEL_24;
      }
      uint64_t v16 = (v15 - 1) & v14;
      if (v6 >= v8)
      {
        if (v16 >= v8 && v6 >= v16)
        {
LABEL_18:
          sub_1000413B0();
          sub_1000413A0();
          uint64_t v6 = v7;
        }
      }
      else if (v16 >= v8 || v6 >= v16)
      {
        goto LABEL_18;
      }
      sub_1000413D0();
      uint64_t v7 = a1;
    }
  }

  sub_1000413A0();
}

void sub_1000255CC(uint64_t a1, uint64_t a2, uint64_t a3, Swift::Int *a4)
{
  uint64_t v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_62:
    __break(1u);
    goto LABEL_63;
  }
  if (v5 >= 1)
  {
    unint64_t v9 = *(void *)(a3 + 16);
    uint64_t v10 = v9 - v5;
    if ((uint64_t)v9 < v5) {
      ++v10;
    }
    if (a1 < v10 >> 1)
    {
      if (sub_1000413E0() / 3 > a1)
      {
        if (a1 < 0)
        {
LABEL_66:
          __break(1u);
          goto LABEL_67;
        }
        if (v9 < a1)
        {
LABEL_67:
          __break(1u);
          goto LABEL_68;
        }
        if (a1)
        {
          swift_retain();
          uint64_t v11 = 0;
          while (1)
          {
            Swift::Int v12 = *a4;
            id v13 = *(id *)(a3 + 32 + 8 * v11);
            sub_1000419B0(v12);
            if (__OFSUB__(1 << *a4, 1)) {
              break;
            }
            if (sub_100041380())
            {
              while (1)
              {
                uint64_t v14 = sub_1000413B0();
                if ((v15 & 1) == 0 && v14 == v11) {
                  break;
                }
                sub_1000413D0();
              }
            }
            if (__OFADD__(v11, v5)) {
              goto LABEL_58;
            }
            ++v11;
            sub_1000413C0();

            if (v11 == a1)
            {
              swift_release();
              goto LABEL_20;
            }
          }
          __break(1u);
LABEL_58:
          __break(1u);
          goto LABEL_59;
        }
        goto LABEL_20;
      }
      sub_100041380();
      uint64_t v21 = sub_1000413B0();
      if ((v22 & 1) != 0 || v21 >= a1)
      {
LABEL_32:
        sub_1000413D0();
LABEL_20:
        uint64_t v16 = a4[1];
        if (__OFSUB__(v16 >> 6, v5))
        {
LABEL_64:
          __break(1u);
          goto LABEL_65;
        }
        uint64_t v17 = 1 << *a4;
        BOOL v18 = __OFSUB__(v17, 1);
        uint64_t v19 = v17 - 1;
        if (v18)
        {
LABEL_65:
          __break(1u);
          goto LABEL_66;
        }
        uint64_t v20 = (v19 & (((v16 >> 6) - v5) >> 63)) + (v16 >> 6) - v5;
        if (v20 < v19) {
          uint64_t v19 = 0;
        }
        a4[1] = a4[1] & 0x3F | ((v20 - v19) << 6);
        return;
      }
      if (!__OFADD__(v21, v5))
      {
        sub_1000413C0();
        goto LABEL_32;
      }
      __break(1u);
LABEL_38:
      sub_100041380();
      uint64_t v23 = sub_1000413B0();
      if ((v24 & 1) == 0 && v23 >= v4)
      {
        if (__OFSUB__(v23, v5))
        {
LABEL_59:
          __break(1u);
LABEL_60:
          __break(1u);
LABEL_61:
          __break(1u);
          goto LABEL_62;
        }
        sub_1000413C0();
      }
      sub_1000413D0();
      return;
    }
    uint64_t v4 = a2;
    if (__OFSUB__(v9, a2))
    {
LABEL_63:
      __break(1u);
      goto LABEL_64;
    }
    if ((uint64_t)(v9 - a2) >= sub_1000413E0() / 3) {
      goto LABEL_38;
    }
    if ((uint64_t)v9 < v4)
    {
LABEL_68:
      __break(1u);
      goto LABEL_69;
    }
    if (v4 < 0)
    {
LABEL_69:
      __break(1u);
      goto LABEL_70;
    }
    if (v9 != v4)
    {
      if (v9 <= v4)
      {
LABEL_70:
        __break(1u);
        return;
      }
      swift_retain();
      while (1)
      {
        Swift::Int v25 = *a4;
        id v26 = *(id *)(a3 + 32 + 8 * v4);
        sub_1000419B0(v25);
        if (__OFSUB__(1 << *a4, 1)) {
          goto LABEL_60;
        }
        if (sub_100041380())
        {
          while (1)
          {
            uint64_t v27 = sub_1000413B0();
            if ((v28 & 1) == 0 && v27 == v4) {
              break;
            }
            sub_1000413D0();
          }
        }
        if (__OFSUB__(v4, v5)) {
          goto LABEL_61;
        }
        ++v4;
        sub_1000413C0();

        if (v4 == v9)
        {
          swift_release();
          return;
        }
      }
    }
  }
}

uint64_t sub_100025A44(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_1000277C4(a1, a2, (void (*)(uint64_t *__return_ptr, id *))sub_1000277AC);
  uint64_t v7 = v6;
  uint64_t v8 = sub_100025B1C();
  uint64_t v9 = sub_100024A2C(v7, 0, 1, v8);
  if (*(void *)(v7 + 16) <= 0xFuLL)
  {
    swift_release();
    uint64_t v9 = 0;
  }
  *a3 = v9;
  a3[1] = v7;
  swift_release();
  swift_release();
  sub_1000277C4(a1, a2, (void (*)(uint64_t *__return_ptr, id *))sub_1000277B8);
  a3[2] = v10;
  return swift_release();
}

uint64_t sub_100025B1C()
{
  return 0;
}

uint64_t sub_100025B24(void **__src, void **a2, unint64_t a3, void **__dst, uint64_t (*a5)(void **, void **, void **, uint64_t *))
{
  uint64_t v6 = (char *)__dst;
  uint64_t v7 = a2;
  uint64_t v8 = __src;
  int64_t v9 = (char *)a2 - (char *)__src;
  int64_t v10 = (char *)a2 - (char *)__src + 15;
  if ((char *)a2 - (char *)__src >= 0) {
    int64_t v10 = (char *)a2 - (char *)__src;
  }
  uint64_t v11 = v10 >> 4;
  uint64_t v12 = a3 - (void)a2;
  uint64_t v13 = a3 - (void)a2 + 15;
  if ((uint64_t)(a3 - (void)a2) >= 0) {
    uint64_t v13 = a3 - (void)a2;
  }
  uint64_t v14 = v13 >> 4;
  unsigned __int16 v58 = __src;
  int v57 = __dst;
  if (v11 >= v13 >> 4)
  {
    if (v12 >= -15)
    {
      if (__dst != a2 || &a2[2 * v14] <= __dst) {
        memmove(__dst, a2, 16 * v14);
      }
      char v28 = &v6[16 * v14];
      v56 = v28;
      unsigned __int16 v58 = v7;
      if (v8 < v7)
      {
        uint64_t v29 = v5;
        if (v12 >= 16)
        {
          char v30 = (void **)(a3 - 16);
          unint64_t v31 = v7;
          unint64_t v44 = v6;
          v51 = v8;
          while (1)
          {
            unint64_t v45 = (unint64_t)v28;
            char v47 = v7;
            BOOL v32 = (void *)*((void *)v28 - 2);
            uint64_t v33 = v28 - 16;
            uint64_t v34 = *(v31 - 2);
            uint64_t v35 = (uint64_t)*(v31 - 1);
            v31 -= 2;
            BOOL v54 = (void *)*((void *)v28 - 1);
            Swift::String v55 = v32;
            uint64_t v52 = v35;
            unsigned __int16 v53 = v34;
            id v36 = v32;
            swift_unknownObjectRetain();
            id v37 = v34;
            swift_unknownObjectRetain();
            char v38 = a5(&v55, &v54, &v53, &v52);
            if (v29) {
              break;
            }
            char v39 = v38;
            char v40 = v30 + 2;

            swift_unknownObjectRelease();
            swift_unknownObjectRelease();
            if (v39)
            {
              char v28 = (char *)v45;
              Swift::String v41 = v44;
              unint64_t v42 = (unint64_t)v51;
              if (v40 != v47 || v30 >= v47) {
                *(_OWORD *)char v30 = *(_OWORD *)v31;
              }
              unsigned __int16 v58 = v31;
            }
            else
            {
              v56 = v33;
              Swift::String v41 = v44;
              unint64_t v42 = (unint64_t)v51;
              unint64_t v31 = v47;
              if ((unint64_t)v40 < v45 || (unint64_t)v30 >= v45 || v40 != (void **)v45) {
                *(_OWORD *)char v30 = *(_OWORD *)v33;
              }
              char v28 = v33;
            }
            uint64_t v29 = 0;
            if ((unint64_t)v31 > v42)
            {
              v30 -= 2;
              uint64_t v7 = v31;
              if (v28 > v41) {
                continue;
              }
            }
            goto LABEL_50;
          }

          swift_unknownObjectRelease();
LABEL_49:
          swift_unknownObjectRelease();
        }
      }
LABEL_50:
      sub_10002601C((void **)&v58, (const void **)&v57, &v56);
      return 1;
    }
  }
  else if (v9 >= -15)
  {
    uint64_t v15 = v5;
    if (__dst != __src || &__src[2 * v11] <= __dst) {
      memmove(__dst, __src, 16 * v11);
    }
    unint64_t v46 = &v6[16 * v11];
    v56 = v46;
    if ((unint64_t)v7 < a3 && v9 >= 16)
    {
      while (1)
      {
        uint64_t v50 = v8;
        uint64_t v16 = *v7;
        uint64_t v17 = v7[1];
        BOOL v18 = v7;
        uint64_t v19 = *(void **)v6;
        uint64_t v20 = *((void *)v6 + 1);
        uint64_t v21 = v6;
        BOOL v54 = v17;
        Swift::String v55 = v16;
        uint64_t v52 = v20;
        unsigned __int16 v53 = v19;
        id v22 = v16;
        swift_unknownObjectRetain();
        id v23 = v19;
        swift_unknownObjectRetain();
        char v24 = a5(&v55, &v54, &v53, &v52);
        if (v15)
        {

          swift_unknownObjectRelease();
          goto LABEL_49;
        }
        char v25 = v24;

        swift_unknownObjectRelease();
        swift_unknownObjectRelease();
        if (v25)
        {
          id v26 = v18 + 2;
          uint64_t v27 = v50;
          uint64_t v6 = v21;
          if (v50 >= v18 && v50 < v26)
          {
            uint64_t v15 = 0;
            if (v50 != v18) {
              *(_OWORD *)uint64_t v50 = *(_OWORD *)v18;
            }
            goto LABEL_23;
          }
          *(_OWORD *)uint64_t v50 = *(_OWORD *)v18;
        }
        else
        {
          uint64_t v27 = v50;
          if (v50 != (void **)v21) {
            *(_OWORD *)uint64_t v50 = *(_OWORD *)v21;
          }
          uint64_t v6 = v21 + 16;
          int v57 = (void **)(v21 + 16);
          id v26 = v18;
        }
        uint64_t v15 = 0;
LABEL_23:
        uint64_t v8 = v27 + 2;
        unsigned __int16 v58 = v8;
        if (v6 < v46)
        {
          uint64_t v7 = v26;
          if ((unint64_t)v26 < a3) {
            continue;
          }
        }
        goto LABEL_50;
      }
    }
    goto LABEL_50;
  }
  uint64_t result = sub_100041BE0();
  __break(1u);
  return result;
}

char *sub_100025F20(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_100016F7C(&qword_100068D70);
    int64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    int64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_10002601C(void **a1, const void **a2, void *a3)
{
  uint64_t v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 15;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -16)
  {
    uint64_t result = (char *)sub_100041BE0();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v7 = v5 >> 4;
    if (result != v3 || result >= &v3[16 * v7])
    {
      return (char *)memmove(result, v3, 16 * v7);
    }
  }
  return result;
}

char *sub_1000260D8(uint64_t a1)
{
  return sub_100025F20(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_1000260EC(void *a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0) {
      uint64_t v7 = *v2;
    }
    else {
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFF8;
    }
    swift_bridgeObjectRetain();
    id v8 = a2;
    uint64_t v9 = sub_100041A50();

    if (v9)
    {
      swift_bridgeObjectRelease();

      type metadata accessor for MessageID(0);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v27;
      swift_unknownObjectRelease();
      return 0;
    }
    uint64_t result = sub_100041A40();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    Swift::Int v22 = sub_10002636C(v7, result + 1);
    char v28 = (void *)v22;
    if (*(void *)(v22 + 24) <= *(void *)(v22 + 16))
    {
      id v26 = v8;
      sub_1000268F0();
      id v23 = v28;
    }
    else
    {
      id v23 = (void *)v22;
      id v24 = v8;
    }
    sub_100026B90((uint64_t)v8, v23);
    uint64_t *v3 = (uint64_t)v23;
  }
  else
  {
    Swift::Int v11 = *(void *)(v6 + 40);
    swift_bridgeObjectRetain();
    Swift::Int v12 = sub_1000419B0(v11);
    uint64_t v13 = -1 << *(unsigned char *)(v6 + 32);
    unint64_t v14 = v12 & ~v13;
    if ((*(void *)(v6 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14))
    {
      type metadata accessor for MessageID(0);
      id v15 = *(id *)(*(void *)(v6 + 48) + 8 * v14);
      char v16 = sub_1000419C0();

      if (v16)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        uint64_t v20 = *(void **)(*(void *)(*v3 + 48) + 8 * v14);
        *a1 = v20;
        id v21 = v20;
        return 0;
      }
      uint64_t v17 = ~v13;
      while (1)
      {
        unint64_t v14 = (v14 + 1) & v17;
        if (((*(void *)(v6 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14) & 1) == 0) {
          break;
        }
        id v18 = *(id *)(*(void *)(v6 + 48) + 8 * v14);
        char v19 = sub_1000419C0();

        if (v19) {
          goto LABEL_12;
        }
      }
    }
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v29 = *v3;
    uint64_t *v3 = 0x8000000000000000;
    id v8 = a2;
    sub_100027130((uint64_t)v8, v14, isUniquelyReferenced_nonNull_native);
    uint64_t *v3 = v29;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

Swift::Int sub_10002636C(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    sub_100016F7C(&qword_100068D88);
    uint64_t v2 = sub_100041AA0();
    uint64_t v14 = v2;
    sub_100041A30();
    if (sub_100041A60())
    {
      type metadata accessor for MessageID(0);
      do
      {
        swift_dynamicCast();
        uint64_t v2 = v14;
        if (*(void *)(v14 + 24) <= *(void *)(v14 + 16))
        {
          sub_1000268F0();
          uint64_t v2 = v14;
        }
        Swift::Int result = sub_1000419B0(*(void *)(v2 + 40));
        uint64_t v4 = v2 + 56;
        uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
        unint64_t v6 = result & ~v5;
        unint64_t v7 = v6 >> 6;
        if (((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6))) != 0)
        {
          unint64_t v8 = __clz(__rbit64((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6)))) | v6 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v9 = 0;
          unint64_t v10 = (unint64_t)(63 - v5) >> 6;
          do
          {
            if (++v7 == v10 && (v9 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v11 = v7 == v10;
            if (v7 == v10) {
              unint64_t v7 = 0;
            }
            v9 |= v11;
            uint64_t v12 = *(void *)(v4 + 8 * v7);
          }
          while (v12 == -1);
          unint64_t v8 = __clz(__rbit64(~v12)) + (v7 << 6);
        }
        *(void *)(v4 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
        *(void *)(*(void *)(v2 + 48) + 8 * v8) = v13;
        ++*(void *)(v2 + 16);
      }
      while (sub_100041A60());
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return (Swift::Int)&_swiftEmptySetSingleton;
  }
  return v2;
}

void *sub_100026554(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  if (!*(void *)(a2 + 16))
  {
    swift_release();
    return &_swiftEmptySetSingleton;
  }
  v35[0] = a1;
  unint64_t v33 = (unint64_t)a1 >> 62;
  if ((unint64_t)a1 >> 62)
  {
LABEL_30:
    swift_bridgeObjectRetain();
    if (sub_100041BA0()) {
      goto LABEL_4;
    }
LABEL_21:
    swift_bridgeObjectRelease();
    return (void *)v2;
  }
  uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v4) {
    goto LABEL_21;
  }
LABEL_4:
  unint64_t v5 = 0;
  uint64_t v6 = v2 + 56;
  unint64_t v34 = a1 & 0xC000000000000001;
  uint64_t v7 = a1 & 0xFFFFFFFFFFFFFF8;
  uint64_t v32 = a1 & 0xFFFFFFFFFFFFFF8;
  if (a1 < 0) {
    uint64_t v7 = a1;
  }
  uint64_t v30 = a1 + 32;
  uint64_t v31 = v7;
  while (1)
  {
    if (v34)
    {
      id v8 = (id)sub_100041AE0();
    }
    else
    {
      if (v5 >= *(void *)(v32 + 16)) {
        __break(1u);
      }
      id v8 = *(id *)(v30 + 8 * v5);
    }
    char v9 = v8;
    if (__OFADD__(v5++, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    Swift::Int v11 = sub_1000419B0(*(void *)(v2 + 40));
    uint64_t v12 = -1 << *(unsigned char *)(v2 + 32);
    unint64_t v13 = v11 & ~v12;
    if ((*(void *)(v6 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13)) {
      break;
    }
LABEL_19:

    if (v33)
    {
      swift_bridgeObjectRetain();
      uint64_t v19 = sub_100041BA0();
      swift_bridgeObjectRelease();
      if (v5 == v19) {
        goto LABEL_21;
      }
    }
    else if (v5 == *(void *)(v32 + 16))
    {
      goto LABEL_21;
    }
  }
  type metadata accessor for MessageID(0);
  id v14 = *(id *)(*(void *)(v2 + 48) + 8 * v13);
  char v15 = sub_1000419C0();

  if ((v15 & 1) == 0)
  {
    uint64_t v16 = ~v12;
    do
    {
      unint64_t v13 = (v13 + 1) & v16;
      if (((*(void *)(v6 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13) & 1) == 0) {
        goto LABEL_19;
      }
      id v17 = *(id *)(*(void *)(v2 + 48) + 8 * v13);
      char v18 = sub_1000419C0();
    }
    while ((v18 & 1) == 0);
  }

  v35[1] = v5;
  char v21 = *(unsigned char *)(v2 + 32);
  unint64_t v22 = (unint64_t)((1 << v21) + 63) >> 6;
  size_t v23 = 8 * v22;
  if ((v21 & 0x3Fu) < 0xE
    || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), isStackAllocationSafe))
  {
    __chkstk_darwin(isStackAllocationSafe);
    memcpy((char *)&v29 - ((v23 + 15) & 0x3FFFFFFFFFFFFFF0), (const void *)(v2 + 56), v23);
    sub_100026C14((unint64_t *)((char *)&v29 - ((v23 + 15) & 0x3FFFFFFFFFFFFFF0)), v22, v2, v13, v35);
    uint64_t v25 = v24;
    swift_release();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v26 = (void *)swift_slowAlloc();
    memcpy(v26, (const void *)(v2 + 56), v23);
    sub_100026C14((unint64_t *)v26, v22, v2, v13, v35);
    uint64_t v25 = v27;
    swift_release();
    swift_bridgeObjectRelease();
    swift_slowDealloc();
  }
  return (void *)v25;
}

uint64_t sub_1000268F0()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100016F7C(&qword_100068D88);
  uint64_t v3 = sub_100041A90();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    char v28 = v0;
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v6 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v7 = ~(-1 << v5);
    }
    else {
      uint64_t v7 = -1;
    }
    unint64_t v8 = v7 & *(void *)(v2 + 56);
    int64_t v9 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v10 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v12 = 0;
    while (1)
    {
      if (v8)
      {
        unint64_t v14 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        unint64_t v15 = v14 | (v12 << 6);
      }
      else
      {
        int64_t v16 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v9) {
          goto LABEL_33;
        }
        unint64_t v17 = v6[v16];
        ++v12;
        if (!v17)
        {
          int64_t v12 = v16 + 1;
          if (v16 + 1 >= v9) {
            goto LABEL_33;
          }
          unint64_t v17 = v6[v12];
          if (!v17)
          {
            int64_t v12 = v16 + 2;
            if (v16 + 2 >= v9) {
              goto LABEL_33;
            }
            unint64_t v17 = v6[v12];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v9)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v28;
                uint64_t v27 = 1 << *(unsigned char *)(v2 + 32);
                if (v27 > 63) {
                  bzero((void *)(v2 + 56), ((unint64_t)(v27 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v6 = -1 << v27;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v6[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v12 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v12 >= v9) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v6[v12];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v12 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v8 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
      }
      uint64_t v19 = *(void *)(*(void *)(v2 + 48) + 8 * v15);
      uint64_t result = sub_1000419B0(*(void *)(v4 + 40));
      uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v21 = result & ~v20;
      unint64_t v22 = v21 >> 6;
      if (((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6))) != 0)
      {
        unint64_t v13 = __clz(__rbit64((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v23 = 0;
        unint64_t v24 = (unint64_t)(63 - v20) >> 6;
        do
        {
          if (++v22 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v25 = v22 == v24;
          if (v22 == v24) {
            unint64_t v22 = 0;
          }
          v23 |= v25;
          uint64_t v26 = *(void *)(v10 + 8 * v22);
        }
        while (v26 == -1);
        unint64_t v13 = __clz(__rbit64(~v26)) + (v22 << 6);
      }
      *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      *(void *)(*(void *)(v4 + 48) + 8 * v13) = v19;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

unint64_t sub_100026B90(uint64_t a1, void *a2)
{
  sub_1000419B0(a2[5]);
  unint64_t result = sub_100041A20();
  *(void *)((char *)a2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 56) |= 1 << result;
  *(void *)(a2[6] + 8 * result) = a1;
  ++a2[2];
  return result;
}

void sub_100026C14(unint64_t *a1, uint64_t a2, uint64_t a3, unint64_t a4, void *a5)
{
  uint64_t v5 = a5;
  uint64_t v7 = *(void *)(a3 + 16);
  *(unint64_t *)((char *)a1 + ((a4 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a4) - 1;
  uint64_t v33 = v7 - 1;
  unint64_t v8 = a5[1];
  if (*a5 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_100041BA0();
    swift_bridgeObjectRelease();
    if (v8 == v9) {
      goto LABEL_3;
    }
  }
  else if (v8 == *(void *)((*a5 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_3:
    swift_retain();
    sub_100026ED0(a1, a2, v33, a3);
    return;
  }
  uint64_t v35 = a3 + 56;
  unint64_t v34 = v5;
  while (1)
  {
    uint64_t v10 = *v5;
    if ((*v5 & 0xC000000000000001) != 0)
    {
      id v11 = (id)sub_100041AE0();
      goto LABEL_10;
    }
    if ((v8 & 0x8000000000000000) != 0) {
      break;
    }
    if (v8 >= *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_31;
    }
    id v11 = *(id *)(v10 + 8 * v8 + 32);
LABEL_10:
    int64_t v12 = v11;
    uint64_t v13 = v5[1];
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_32;
    }
    v5[1] = v15;
    Swift::Int v16 = sub_1000419B0(*(void *)(a3 + 40));
    uint64_t v17 = -1 << *(unsigned char *)(a3 + 32);
    unint64_t v18 = v16 & ~v17;
    unint64_t v19 = v18 >> 6;
    uint64_t v20 = 1 << v18;
    if (((1 << v18) & *(void *)(v35 + 8 * (v18 >> 6))) == 0) {
      goto LABEL_18;
    }
    type metadata accessor for MessageID(0);
    id v21 = *(id *)(*(void *)(a3 + 48) + 8 * v18);
    char v22 = sub_1000419C0();

    if ((v22 & 1) == 0)
    {
      uint64_t v23 = ~v17;
      for (unint64_t i = v18 + 1; ; unint64_t i = v25 + 1)
      {
        unint64_t v25 = i & v23;
        if (((*(void *)(v35 + (((i & v23) >> 3) & 0xFFFFFFFFFFFFFF8)) >> (i & v23)) & 1) == 0) {
          break;
        }
        id v26 = *(id *)(*(void *)(a3 + 48) + 8 * v25);
        char v27 = sub_1000419C0();

        if (v27)
        {

          unint64_t v19 = v25 >> 6;
          uint64_t v20 = 1 << v25;
          goto LABEL_20;
        }
      }
LABEL_18:

      uint64_t v5 = v34;
      goto LABEL_23;
    }

LABEL_20:
    unint64_t v28 = a1[v19];
    a1[v19] = v28 & ~v20;
    uint64_t v5 = v34;
    if ((v20 & v28) != 0)
    {
      uint64_t v29 = v33 - 1;
      if (__OFSUB__(v33, 1)) {
        goto LABEL_33;
      }
      --v33;
      if (!v29) {
        return;
      }
    }
LABEL_23:
    unint64_t v8 = v5[1];
    if (*v5 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v30 = sub_100041BA0();
      swift_bridgeObjectRelease();
      if (v8 == v30) {
        goto LABEL_3;
      }
    }
    else if (v8 == *(void *)((*v5 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      goto LABEL_3;
    }
  }
  __break(1u);
LABEL_31:
  __break(1u);
LABEL_32:
  __break(1u);
LABEL_33:
  __break(1u);
}

uint64_t sub_100026ED0(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  if (!a3)
  {
    uint64_t v9 = &_swiftEmptySetSingleton;
LABEL_36:
    swift_release();
    return (uint64_t)v9;
  }
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3) {
    return v4;
  }
  sub_100016F7C(&qword_100068D88);
  uint64_t result = sub_100041AB0();
  uint64_t v9 = (void *)result;
  uint64_t v29 = a1;
  if (a2 < 1) {
    unint64_t v10 = 0;
  }
  else {
    unint64_t v10 = *a1;
  }
  uint64_t v11 = 0;
  uint64_t v12 = result + 56;
  while (1)
  {
    if (v10)
    {
      unint64_t v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v14 = v13 | (v11 << 6);
      goto LABEL_24;
    }
    uint64_t v15 = v11 + 1;
    if (__OFADD__(v11, 1)) {
      goto LABEL_39;
    }
    if (v15 >= a2) {
      goto LABEL_36;
    }
    unint64_t v16 = v29[v15];
    ++v11;
    if (!v16)
    {
      uint64_t v11 = v15 + 1;
      if (v15 + 1 >= a2) {
        goto LABEL_36;
      }
      unint64_t v16 = v29[v11];
      if (!v16)
      {
        uint64_t v11 = v15 + 2;
        if (v15 + 2 >= a2) {
          goto LABEL_36;
        }
        unint64_t v16 = v29[v11];
        if (!v16) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v10 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v11 << 6);
LABEL_24:
    Swift::Int v18 = v9[5];
    id v19 = *(id *)(*(void *)(v4 + 48) + 8 * v14);
    uint64_t result = sub_1000419B0(v18);
    uint64_t v20 = -1 << *((unsigned char *)v9 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v12 + 8 * (v21 >> 6))) != 0)
    {
      unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v12 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v26 = v22 == v25;
        if (v22 == v25) {
          unint64_t v22 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v12 + 8 * v22);
      }
      while (v27 == -1);
      unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
    }
    *(void *)(v12 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    *(void *)(v9[6] + 8 * v23) = v19;
    ++v9[2];
    if (__OFSUB__(v5--, 1))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (!v5) {
      goto LABEL_36;
    }
  }
  uint64_t v17 = v15 + 3;
  if (v17 >= a2) {
    goto LABEL_36;
  }
  unint64_t v16 = v29[v17];
  if (v16)
  {
    uint64_t v11 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    uint64_t v11 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v11 >= a2) {
      goto LABEL_36;
    }
    unint64_t v16 = v29[v11];
    ++v17;
    if (v16) {
      goto LABEL_23;
    }
  }
LABEL_40:
  __break(1u);
  return result;
}

void sub_100027130(uint64_t a1, unint64_t a2, char a3)
{
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_1000268F0();
  }
  else
  {
    if (v7 > v6)
    {
      sub_1000272A8();
      goto LABEL_14;
    }
    sub_100027454();
  }
  uint64_t v8 = *v3;
  Swift::Int v9 = sub_1000419B0(*(void *)(*v3 + 40));
  uint64_t v10 = -1 << *(unsigned char *)(v8 + 32);
  a2 = v9 & ~v10;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    type metadata accessor for MessageID(0);
    id v11 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
    char v12 = sub_1000419C0();

    if (v12)
    {
LABEL_13:
      sub_100041C60();
      __break(1u);
    }
    else
    {
      uint64_t v13 = ~v10;
      while (1)
      {
        a2 = (a2 + 1) & v13;
        if (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          break;
        }
        id v14 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
        char v15 = sub_1000419C0();

        if (v15) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v16 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(void *)(*(void *)(v16 + 48) + 8 * a2) = a1;
  uint64_t v17 = *(void *)(v16 + 16);
  BOOL v18 = __OFADD__(v17, 1);
  uint64_t v19 = v17 + 1;
  if (v18) {
    __break(1u);
  }
  else {
    *(void *)(v16 + 16) = v19;
  }
}

id sub_1000272A8()
{
  uint64_t v1 = v0;
  sub_100016F7C(&qword_100068D88);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_100041A80();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (id)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  id result = (id)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v18 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19)
      {
        int64_t v9 = v18 + 2;
        if (v18 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v19 = *(void *)(v6 + 8 * v9);
        if (!v19) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    id result = v17;
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v13) {
    goto LABEL_28;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_100027454()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100016F7C(&qword_100068D88);
  uint64_t v3 = sub_100041A90();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v4;
    return result;
  }
  unint64_t v28 = v0;
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v9 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v10 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v12 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v12 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v9) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v12;
    if (!v17)
    {
      int64_t v12 = v16 + 1;
      if (v16 + 1 >= v9) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v12);
      if (!v17)
      {
        int64_t v12 = v16 + 2;
        if (v16 + 2 >= v9) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v12);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
LABEL_24:
    Swift::Int v19 = *(void *)(v4 + 40);
    id v20 = *(id *)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t result = sub_1000419B0(v19);
    uint64_t v21 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v22 = result & ~v21;
    unint64_t v23 = v22 >> 6;
    if (((-1 << v22) & ~*(void *)(v10 + 8 * (v22 >> 6))) != 0)
    {
      unint64_t v13 = __clz(__rbit64((-1 << v22) & ~*(void *)(v10 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v21) >> 6;
      do
      {
        if (++v23 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v26 = v23 == v25;
        if (v23 == v25) {
          unint64_t v23 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v10 + 8 * v23);
      }
      while (v27 == -1);
      unint64_t v13 = __clz(__rbit64(~v27)) + (v23 << 6);
    }
    *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
    *(void *)(*(void *)(v4 + 48) + 8 * v13) = v20;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v9)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v28;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v12 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v12 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v12 >= v9) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v12);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

void *sub_1000276D0(void *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7 = result;
  if (!a2)
  {
LABEL_10:
    uint64_t v8 = 0;
    goto LABEL_14;
  }
  uint64_t v8 = a3;
  if (!a3)
  {
LABEL_14:
    *uint64_t v7 = a4;
    v7[1] = a5;
    v7[2] = a6;
    v7[3] = v8;
    return (void *)v8;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    uint64_t v9 = *(void *)(a6 + 16);
    if (v9)
    {
      uint64_t v14 = a4;
      uint64_t v15 = a5;
      uint64_t v11 = 0;
      uint64_t v12 = a3 - 1;
      while (1)
      {
        *(void *)(a2 + 8 * v11) = *(void *)(a6 + 32 + 8 * v11);
        if (v12 == v11) {
          break;
        }
        if (v9 - 1 == v11)
        {
          uint64_t v8 = v9;
          break;
        }
        unint64_t v13 = *(void *)(a6 + 16);
        swift_unknownObjectRetain();
        if (++v11 >= v13)
        {
          __break(1u);
          goto LABEL_10;
        }
      }
      swift_unknownObjectRetain();
      a4 = v14;
      a5 = v15;
    }
    else
    {
      uint64_t v8 = 0;
    }
    goto LABEL_14;
  }
  __break(1u);
  return result;
}

id sub_1000277AC@<X0>(void **a1@<X0>, void *a2@<X8>)
{
  uint64_t v2 = *a1;
  *a2 = v2;
  return v2;
}

uint64_t sub_1000277B8@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = *(void *)(a1 + 8);
  return swift_unknownObjectRetain();
}

void sub_1000277C4(uint64_t a1, uint64_t a2, void (*a3)(uint64_t *__return_ptr, id *))
{
  uint64_t v8 = a2;
  if (a2 > 0)
  {
    sub_100016F7C((uint64_t *)&unk_100068B00);
    uint64_t v4 = (void *)swift_allocObject();
    int64_t v10 = j__malloc_size(v4);
    uint64_t v11 = v10 - 32;
    if (v10 < 32) {
      uint64_t v11 = v10 - 25;
    }
    uint64_t i = v11 >> 3;
    v4[2] = v8;
    v4[3] = (2 * (v11 >> 3)) | 1;
    if (a1) {
      uint64_t v5 = a1 + 16 * v8;
    }
    else {
      uint64_t v5 = 0;
    }
    swift_retain();
    if (!a1) {
      goto LABEL_16;
    }
    uint64_t v6 = (i & 0x7FFFFFFFFFFFFFFFLL) - v8;
    uint64_t v12 = v8 - 1;
    uint64_t v7 = v4 + 5;
    for (uint64_t i = (uint64_t)a3; a1 != v5; a1 += 16)
    {
      uint64_t v8 = *(void *)(a1 + 8);
      id v33 = *(id *)a1;
      uint64_t v34 = v8;
      id v13 = v33;
      swift_unknownObjectRetain();
      a3(&v32, &v33);
      swift_unknownObjectRelease();

      *(v7 - 1) = v32;
      if (!v12) {
        goto LABEL_17;
      }
      --v12;
      ++v7;
    }
    __break(1u);
  }
  if (v8 < 0)
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v6 = _swiftEmptyArrayStorage[3] >> 1;
  uint64_t v4 = _swiftEmptyArrayStorage;
  if (a1)
  {
    uint64_t i = (uint64_t)a3;
    uint64_t v5 = a1 + 16 * v8;
    swift_retain();
    uint64_t v7 = &_swiftEmptyArrayStorage[4];
    while (1)
    {
      if (a1 == v5)
      {
        swift_release();
        goto LABEL_35;
      }
      uint64_t v14 = *(void *)(a1 + 8);
      id v33 = *(id *)a1;
      uint64_t v34 = v14;
      id v15 = v33;
      swift_unknownObjectRetain();
      ((void (*)(uint64_t *__return_ptr, id *))i)(&v32, &v33);
      swift_unknownObjectRelease();

      uint64_t v16 = v32;
      if (!v6)
      {
        unint64_t v17 = v4[3];
        if ((uint64_t)((v17 >> 1) + 0x4000000000000000) < 0) {
          goto LABEL_40;
        }
        int64_t v18 = v17 & 0xFFFFFFFFFFFFFFFELL;
        if (v18 <= 1) {
          uint64_t v19 = 1;
        }
        else {
          uint64_t v19 = v18;
        }
        sub_100016F7C((uint64_t *)&unk_100068B00);
        id v20 = (void *)swift_allocObject();
        int64_t v21 = j__malloc_size(v20);
        uint64_t v22 = v21 - 32;
        if (v21 < 32) {
          uint64_t v22 = v21 - 25;
        }
        uint64_t v23 = v22 >> 3;
        v20[2] = v19;
        v20[3] = (2 * (v22 >> 3)) | 1;
        unint64_t v24 = (unint64_t)(v20 + 4);
        uint64_t v25 = v4[3] >> 1;
        if (v4[2])
        {
          BOOL v26 = v4 + 4;
          if (v20 != v4 || v24 >= (unint64_t)v26 + 8 * v25) {
            memmove(v20 + 4, v26, 8 * v25);
          }
          v4[2] = 0;
        }
        uint64_t v7 = (void *)(v24 + 8 * v25);
        uint64_t v6 = (v23 & 0x7FFFFFFFFFFFFFFFLL) - v25;
        swift_release();
        uint64_t v4 = v20;
        uint64_t i = (uint64_t)a3;
      }
      BOOL v27 = __OFSUB__(v6--, 1);
      if (v27) {
        break;
      }
      *v7++ = v16;
LABEL_17:
      a1 += 16;
    }
    __break(1u);
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
LABEL_35:
  unint64_t v28 = v4[3];
  if (v28 >= 2)
  {
    unint64_t v29 = v28 >> 1;
    BOOL v27 = __OFSUB__(v29, v6);
    unint64_t v30 = v29 - v6;
    if (v27)
    {
LABEL_41:
      __break(1u);
      return;
    }
    v4[2] = v30;
  }
}

void sub_100027A68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3 = *(void *)(a3 + 16);
  if (!v3)
  {
    int64_t v10 = &_swiftEmptyArrayStorage[2];
    unint64_t v20 = _swiftEmptyArrayStorage[3];
    a2 = v20 >> 1;
    if (v20 < 2) {
      return;
    }
    goto LABEL_12;
  }
  sub_100016F7C(&qword_100068D78);
  uint64_t v6 = (unint64_t *)swift_allocObject();
  int64_t v7 = j__malloc_size(v6);
  uint64_t v8 = v7 - 32;
  if (v7 < 32) {
    uint64_t v8 = v7 - 17;
  }
  uint64_t v9 = v8 >> 4;
  v6[2] = v3;
  int64_t v10 = v6 + 2;
  v6[3] = 2 * v9;
  uint64_t v11 = *(void *)(a2 + 16);
  if (v11)
  {
    uint64_t v12 = (uint64_t *)(a2 + 32);
    id v13 = (uint64_t *)(a3 + 32);
    unint64_t v14 = v3 - 1;
    a2 = (v9 & 0x7FFFFFFFFFFFFFFFLL) - 1;
    uint64_t v15 = 4;
    while (1)
    {
      uint64_t v16 = (uint64_t *)&v6[v15];
      uint64_t v9 = *v12;
      uint64_t v17 = *v13;
      *uint64_t v16 = *v12;
      v16[1] = v17;
      if (!v14) {
        break;
      }
      id v18 = (id)v9;
      swift_unknownObjectRetain();
      ++v12;
      ++v13;
      --v14;
      v15 += 2;
      --a2;
      if (!--v11) {
        goto LABEL_8;
      }
    }
  }
  else
  {
LABEL_8:
    __break(1u);
  }
  id v19 = (id)v9;
  swift_unknownObjectRetain();
  unint64_t v20 = v6[3];
  if (v20 >= 2)
  {
LABEL_12:
    unint64_t v21 = v20 >> 1;
    BOOL v22 = __OFSUB__(v21, a2);
    unint64_t v23 = v21 - a2;
    if (v22) {
      __break(1u);
    }
    else {
      *int64_t v10 = v23;
    }
  }
}

uint64_t sub_100027BA8(uint64_t a1)
{
  uint64_t v2 = _swiftEmptyArrayStorage;
  if (((unint64_t)_swiftEmptyArrayStorage & 0xC000000000000000) != 0)
  {
    uint64_t v2 = sub_10002446C((unint64_t)_swiftEmptyArrayStorage, (void (*)(void *, uint64_t, unint64_t))sub_100039888);
    sub_10002446C((unint64_t)_swiftEmptyArrayStorage, (void (*)(void *, uint64_t, unint64_t))sub_100039674);
  }
  uint64_t v17 = 0;
  uint64_t v18 = (uint64_t)v2;
  uint64_t v3 = *(void *)(a1 + 16);
  sub_100024D10(v3, 0);
  sub_100041B30();
  if (v3)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = a1 + 40;
    while (1)
    {
      id v6 = *(id *)(v4 - 8);
      swift_unknownObjectRetain();
      uint64_t result = sub_100024670((uint64_t)v6, v17, v18);
      if ((v9 & 1) == 0)
      {
        __break(1u);
        return result;
      }
      uint64_t v5 = v8;
      id v10 = v6;
      sub_100041B10();
      sub_100041B40();
      sub_100041B50();
      sub_100041B20();
      uint64_t v11 = v17;
      unint64_t v12 = *(void *)(v18 + 16);
      if (v17)
      {
        swift_beginAccess();
        if (sub_1000413E0() >= (uint64_t)v12)
        {
          if ((swift_isUniquelyReferenced_native() & 1) == 0)
          {
            uint64_t v16 = sub_100041400();
            swift_release();
            uint64_t v17 = v16;
            uint64_t v11 = v16;
            if (!v16)
            {
              __break(1u);
LABEL_21:
              swift_bridgeObjectRelease();
              return v5;
            }
          }
          sub_1000413A0();
          uint64_t v5 = v11;
        }
        else
        {
          uint64_t v13 = *(void *)(v17 + 24) & 0x3FLL;
          if (v12 > 0xF || v13)
          {
LABEL_14:
            uint64_t v14 = sub_100041410();
            if (v13 <= v14) {
              uint64_t v15 = v14;
            }
            else {
              uint64_t v15 = v13;
            }
            uint64_t v5 = sub_100024A2C(v18, v15, 0, v13);
            swift_release();
            uint64_t v17 = v5;
            goto LABEL_6;
          }
          swift_release();
          uint64_t v5 = 0;
          uint64_t v17 = 0;
        }
      }
      else
      {
        uint64_t v13 = 0;
        uint64_t v5 = 0;
        if (v12 > 0xF) {
          goto LABEL_14;
        }
      }
LABEL_6:
      sub_100041B10();
      sub_100041B40();
      sub_100041B50();
      sub_100041B20();

      v4 += 16;
      if (!--v3) {
        goto LABEL_21;
      }
    }
  }
  return 0;
}

void sub_100027E64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t (*a5)(uint64_t *, uint64_t *, void **, uint64_t *))
{
  uint64_t v6 = v5;
  if (a3 != a2)
  {
    uint64_t v7 = a1;
    uint64_t v8 = *a4;
    uint64_t v9 = *a4 + 16 * a3 - 16;
LABEL_3:
    long long v10 = *(_OWORD *)(v8 + 16 * a3);
    uint64_t v19 = v9;
    uint64_t v20 = a3;
    while (1)
    {
      uint64_t v11 = *(void **)v9;
      uint64_t v12 = *(void *)(v9 + 8);
      uint64_t v25 = *((void *)&v10 + 1);
      uint64_t v26 = v10;
      uint64_t v23 = v12;
      unint64_t v24 = v11;
      id v22 = (id)v10;
      swift_unknownObjectRetain();
      id v13 = v11;
      swift_unknownObjectRetain();
      uint64_t v14 = v6;
      char v15 = a5(&v26, &v25, &v24, &v23);
      swift_unknownObjectRelease();

      swift_unknownObjectRelease();
      if (v14) {
        break;
      }
      if ((v15 & 1) == 0)
      {
        uint64_t v16 = v20;
        uint64_t v6 = 0;
LABEL_10:
        a3 = v16 + 1;
        uint64_t v9 = v19 + 16;
        uint64_t v7 = a1;
        if (a3 != a2) {
          goto LABEL_3;
        }
        return;
      }
      if (!v8)
      {
        __break(1u);
        return;
      }
      long long v10 = *(_OWORD *)(v9 + 16);
      *(_OWORD *)(v9 + 16) = *(_OWORD *)v9;
      *(_OWORD *)uint64_t v9 = v10;
      v9 -= 16;
      ++v7;
      uint64_t v16 = v20;
      uint64_t v6 = 0;
      if (v20 == v7) {
        goto LABEL_10;
      }
    }
  }
}

void sub_100027FC4(uint64_t *a1, uint64_t (*a2)(uint64_t *, uint64_t *, void **, uint64_t *))
{
  uint64_t v3 = v2;
  Swift::Int v5 = a1[1];
  Swift::Int v6 = sub_100041C20(v5);
  if (v6 >= v5)
  {
    if (v5 < 0) {
      goto LABEL_138;
    }
    if (v5) {
      sub_100027E64(0, v5, 1, a1, a2);
    }
    return;
  }
  if (v5 >= 0) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = v5 + 1;
  }
  if (v5 < -1) {
    goto LABEL_147;
  }
  Swift::Int v118 = v5;
  Swift::Int v114 = v6;
  Swift::String v110 = a1;
  if (v5 < 2)
  {
    long long v10 = (char *)_swiftEmptyArrayStorage;
    __dst = (void **)&_swiftEmptyArrayStorage[4];
    Swift::String v115 = _swiftEmptyArrayStorage;
    if (v5 != 1)
    {
      unint64_t v41 = _swiftEmptyArrayStorage[2];
      goto LABEL_102;
    }
  }
  else
  {
    uint64_t v8 = v7 >> 1;
    sub_100016F7C(&qword_100068D68);
    uint64_t v9 = sub_100041830();
    *(void *)(v9 + 16) = v8;
    Swift::String v115 = (void *)v9;
    __dst = (void **)(v9 + 32);
  }
  Swift::Int v11 = 0;
  uint64_t v12 = *a1;
  uint64_t v111 = *a1 + 40;
  uint64_t v109 = *a1 - 16;
  long long v10 = (char *)_swiftEmptyArrayStorage;
  Swift::Int v13 = v118;
  uint64_t v122 = *a1;
  while (1)
  {
    Swift::Int v14 = v11;
    Swift::Int v15 = v11 + 1;
    if (v11 + 1 < v13)
    {
      Swift::String v116 = v10;
      uint64_t v16 = v12 + 16 * v15;
      uint64_t v17 = *(void **)v16;
      uint64_t v18 = *(void *)(v16 + 8);
      uint64_t v19 = v12 + 16 * v14;
      uint64_t v20 = *(void **)v19;
      uint64_t v21 = *(void *)(v19 + 8);
      id v127 = v17;
      Swift::String v125 = v20;
      v126[0] = v18;
      uint64_t v124 = v21;
      id v22 = v17;
      swift_unknownObjectRetain();
      id v23 = v20;
      swift_unknownObjectRetain();
      int v24 = a2((uint64_t *)&v127, v126, &v125, &v124);
      if (v3)
      {
        swift_bridgeObjectRelease();
        swift_unknownObjectRelease();

        swift_unknownObjectRelease();
LABEL_116:
        v115[2] = 0;
        swift_bridgeObjectRelease();
        return;
      }
      int v25 = v24;
      swift_unknownObjectRelease();

      swift_unknownObjectRelease();
      Swift::Int v15 = v14 + 2;
      if (v14 + 2 < v118)
      {
        Swift::Int v112 = v14;
        uint64_t v26 = (uint64_t *)(v111 + 16 * v14);
        while (1)
        {
          Swift::Int v27 = v15;
          uint64_t v28 = *v26;
          unint64_t v29 = (void *)*(v26 - 3);
          uint64_t v30 = *(v26 - 2);
          id v127 = (id)*(v26 - 1);
          Swift::String v125 = v29;
          v126[0] = v28;
          uint64_t v124 = v30;
          id v31 = v127;
          swift_unknownObjectRetain();
          id v32 = v29;
          swift_unknownObjectRetain();
          LODWORD(v29) = a2((uint64_t *)&v127, v126, &v125, &v124);
          swift_unknownObjectRelease();

          swift_unknownObjectRelease();
          if ((v25 ^ v29)) {
            break;
          }
          Swift::Int v15 = v27 + 1;
          v26 += 2;
          if (v118 == v27 + 1)
          {
            Swift::Int v15 = v118;
            goto LABEL_21;
          }
        }
        Swift::Int v15 = v27;
LABEL_21:
        Swift::Int v14 = v112;
      }
      uint64_t v12 = v122;
      if (v25)
      {
        long long v10 = v116;
        if (v15 < v14) {
          goto LABEL_142;
        }
        if (v14 < v15)
        {
          id v33 = (long long *)(v109 + 16 * v15);
          Swift::Int v34 = v15;
          Swift::Int v35 = v14;
          id v36 = (long long *)(v122 + 16 * v14);
          do
          {
            if (v35 != --v34)
            {
              if (!v122) {
                goto LABEL_145;
              }
              long long v37 = *v36;
              *id v36 = *v33;
              *id v33 = v37;
            }
            ++v35;
            --v33;
            ++v36;
          }
          while (v35 < v34);
        }
      }
      else
      {
        long long v10 = v116;
      }
    }
    if (v15 >= v118) {
      goto LABEL_40;
    }
    if (__OFSUB__(v15, v14)) {
      goto LABEL_139;
    }
    if (v15 - v14 >= v114)
    {
LABEL_40:
      if (v15 < v14) {
        goto LABEL_137;
      }
      goto LABEL_41;
    }
    if (__OFADD__(v14, v114)) {
      goto LABEL_140;
    }
    Swift::Int v38 = v118;
    if (v14 + v114 < v118) {
      Swift::Int v38 = v14 + v114;
    }
    if (v38 < v14) {
      break;
    }
    if (v15 == v38) {
      goto LABEL_40;
    }
    uint64_t v120 = v3;
    Swift::String v117 = v10;
    uint64_t v89 = v109 + 16 * v15;
    Swift::Int v113 = v14;
    Swift::Int v107 = v38;
    do
    {
      long long v90 = *(_OWORD *)(v12 + 16 * v15);
      Swift::Int v91 = v14;
      uint64_t v108 = v89;
      uint64_t v92 = v89;
      while (1)
      {
        Swift::Int v93 = v15;
        uint64_t v94 = *(void **)v92;
        uint64_t v95 = *(void *)(v92 + 8);
        v126[0] = *((void *)&v90 + 1);
        id v127 = (id)v90;
        uint64_t v124 = v95;
        Swift::String v125 = v94;
        id v96 = (id)v90;
        swift_unknownObjectRetain();
        id v97 = v94;
        swift_unknownObjectRetain();
        char v98 = a2((uint64_t *)&v127, v126, &v125, &v124);
        if (v120)
        {
          swift_bridgeObjectRelease();
          swift_unknownObjectRelease();

          swift_unknownObjectRelease();
          goto LABEL_116;
        }
        char v99 = v98;
        swift_unknownObjectRelease();

        swift_unknownObjectRelease();
        if ((v99 & 1) == 0) {
          break;
        }
        uint64_t v12 = v122;
        if (!v122) {
          goto LABEL_144;
        }
        Swift::Int v15 = v93;
        long long v90 = *(_OWORD *)(v92 + 16);
        *(_OWORD *)(v92 + 16) = *(_OWORD *)v92;
        *(_OWORD *)uint64_t v92 = v90;
        v92 -= 16;
        if (v93 == ++v91) {
          goto LABEL_98;
        }
      }
      uint64_t v12 = v122;
      Swift::Int v15 = v93;
LABEL_98:
      ++v15;
      uint64_t v89 = v108 + 16;
      Swift::Int v14 = v113;
    }
    while (v15 != v107);
    Swift::Int v15 = v107;
    long long v10 = v117;
    uint64_t v3 = 0;
    if (v107 < v113) {
      goto LABEL_137;
    }
LABEL_41:
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      long long v10 = sub_100025F20(0, *((void *)v10 + 2) + 1, 1, v10);
    }
    unint64_t v40 = *((void *)v10 + 2);
    unint64_t v39 = *((void *)v10 + 3);
    unint64_t v41 = v40 + 1;
    uint64_t v12 = v122;
    Swift::Int v119 = v15;
    if (v40 >= v39 >> 1)
    {
      Swift::String v100 = sub_100025F20((char *)(v39 > 1), v40 + 1, 1, v10);
      uint64_t v12 = v122;
      long long v10 = v100;
    }
    *((void *)v10 + 2) = v41;
    unint64_t v42 = v10 + 32;
    uint64_t v43 = &v10[16 * v40 + 32];
    *(void *)uint64_t v43 = v14;
    *((void *)v43 + 1) = v119;
    if (v40)
    {
LABEL_46:
      unint64_t v44 = v41 - 1;
      if (v41 >= 4)
      {
        uint64_t v49 = &v42[16 * v41];
        uint64_t v50 = *((void *)v49 - 8);
        uint64_t v51 = *((void *)v49 - 7);
        BOOL v55 = __OFSUB__(v51, v50);
        uint64_t v52 = v51 - v50;
        if (v55) {
          goto LABEL_122;
        }
        uint64_t v54 = *((void *)v49 - 6);
        uint64_t v53 = *((void *)v49 - 5);
        BOOL v55 = __OFSUB__(v53, v54);
        uint64_t v47 = v53 - v54;
        char v48 = v55;
        if (v55) {
          goto LABEL_123;
        }
        unint64_t v56 = v41 - 2;
        int v57 = &v42[16 * v41 - 32];
        uint64_t v59 = *(void *)v57;
        uint64_t v58 = *((void *)v57 + 1);
        BOOL v55 = __OFSUB__(v58, v59);
        uint64_t v60 = v58 - v59;
        if (v55) {
          goto LABEL_125;
        }
        BOOL v55 = __OFADD__(v47, v60);
        uint64_t v61 = v47 + v60;
        if (v55) {
          goto LABEL_128;
        }
        if (v61 >= v52)
        {
          Swift::String v79 = &v42[16 * v44];
          uint64_t v81 = *(void *)v79;
          uint64_t v80 = *((void *)v79 + 1);
          BOOL v55 = __OFSUB__(v80, v81);
          uint64_t v82 = v80 - v81;
          if (v55) {
            goto LABEL_132;
          }
          BOOL v72 = v47 < v82;
        }
        else
        {
LABEL_59:
          if (v48) {
            goto LABEL_124;
          }
          unint64_t v56 = v41 - 2;
          char v62 = &v42[16 * v41 - 32];
          uint64_t v64 = *(void *)v62;
          uint64_t v63 = *((void *)v62 + 1);
          BOOL v65 = __OFSUB__(v63, v64);
          uint64_t v66 = v63 - v64;
          char v67 = v65;
          if (v65) {
            goto LABEL_127;
          }
          Swift::String v68 = &v42[16 * v44];
          uint64_t v70 = *(void *)v68;
          uint64_t v69 = *((void *)v68 + 1);
          BOOL v55 = __OFSUB__(v69, v70);
          uint64_t v71 = v69 - v70;
          if (v55) {
            goto LABEL_130;
          }
          if (__OFADD__(v66, v71)) {
            goto LABEL_131;
          }
          if (v66 + v71 < v47) {
            goto LABEL_71;
          }
          BOOL v72 = v47 < v71;
        }
        if (v72) {
          unint64_t v44 = v56;
        }
      }
      else
      {
        if (v41 == 3)
        {
          uint64_t v46 = *((void *)v10 + 4);
          uint64_t v45 = *((void *)v10 + 5);
          BOOL v55 = __OFSUB__(v45, v46);
          uint64_t v47 = v45 - v46;
          char v48 = v55;
          goto LABEL_59;
        }
        uint64_t v73 = *((void *)v10 + 4);
        uint64_t v74 = *((void *)v10 + 5);
        BOOL v55 = __OFSUB__(v74, v73);
        uint64_t v66 = v74 - v73;
        char v67 = v55;
LABEL_71:
        if (v67) {
          goto LABEL_126;
        }
        unsigned __int8 v75 = &v42[16 * v44];
        uint64_t v77 = *(void *)v75;
        uint64_t v76 = *((void *)v75 + 1);
        BOOL v55 = __OFSUB__(v76, v77);
        uint64_t v78 = v76 - v77;
        if (v55) {
          goto LABEL_129;
        }
        if (v78 < v66) {
          goto LABEL_88;
        }
      }
      unint64_t v83 = v44 - 1;
      if (v44 - 1 >= v41)
      {
        __break(1u);
LABEL_119:
        __break(1u);
LABEL_120:
        __break(1u);
LABEL_121:
        __break(1u);
LABEL_122:
        __break(1u);
LABEL_123:
        __break(1u);
LABEL_124:
        __break(1u);
LABEL_125:
        __break(1u);
LABEL_126:
        __break(1u);
LABEL_127:
        __break(1u);
LABEL_128:
        __break(1u);
LABEL_129:
        __break(1u);
LABEL_130:
        __break(1u);
LABEL_131:
        __break(1u);
LABEL_132:
        __break(1u);
LABEL_133:
        __break(1u);
LABEL_134:
        __break(1u);
LABEL_135:
        __break(1u);
LABEL_136:
        __break(1u);
LABEL_137:
        __break(1u);
LABEL_138:
        __break(1u);
LABEL_139:
        __break(1u);
LABEL_140:
        __break(1u);
        break;
      }
      if (!v12) {
        goto LABEL_143;
      }
      v84 = &v42[16 * v83];
      uint64_t v85 = *(void *)v84;
      uint64_t v86 = &v42[16 * v44];
      uint64_t v87 = *((void *)v86 + 1);
      sub_100025B24((void **)(v12 + 16 * *(void *)v84), (void **)(v12 + 16 * *(void *)v86), v12 + 16 * v87, __dst, (uint64_t (*)(void **, void **, void **, uint64_t *))a2);
      if (v3) {
        goto LABEL_113;
      }
      if (v87 < v85) {
        goto LABEL_119;
      }
      if (v44 > *((void *)v10 + 2)) {
        goto LABEL_120;
      }
      *(void *)v84 = v85;
      *(void *)&v42[16 * v83 + 8] = v87;
      unint64_t v88 = *((void *)v10 + 2);
      if (v44 >= v88) {
        goto LABEL_121;
      }
      unint64_t v41 = v88 - 1;
      memmove(&v42[16 * v44], v86 + 16, 16 * (v88 - 1 - v44));
      *((void *)v10 + 2) = v88 - 1;
      uint64_t v12 = v122;
      if (v88 <= 2) {
        goto LABEL_88;
      }
      goto LABEL_46;
    }
    unint64_t v41 = 1;
LABEL_88:
    Swift::Int v13 = v118;
    Swift::Int v11 = v119;
    if (v119 >= v118)
    {
LABEL_102:
      if (v41 >= 2)
      {
        uint64_t v101 = *v110;
        do
        {
          unint64_t v102 = v41 - 2;
          if (v41 < 2) {
            goto LABEL_133;
          }
          if (!v101) {
            goto LABEL_146;
          }
          uint64_t v103 = *(void *)&v10[16 * v102 + 32];
          uint64_t v104 = *(void *)&v10[16 * v41 + 24];
          sub_100025B24((void **)(v101 + 16 * v103), (void **)(v101 + 16 * *(void *)&v10[16 * v41 + 16]), v101 + 16 * v104, __dst, (uint64_t (*)(void **, void **, void **, uint64_t *))a2);
          if (v3) {
            break;
          }
          if (v104 < v103) {
            goto LABEL_134;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            long long v10 = sub_1000260D8((uint64_t)v10);
          }
          if (v102 >= *((void *)v10 + 2)) {
            goto LABEL_135;
          }
          Swift::String v105 = &v10[16 * v102 + 32];
          *(void *)Swift::String v105 = v103;
          *((void *)v105 + 1) = v104;
          unint64_t v106 = *((void *)v10 + 2);
          if (v41 > v106) {
            goto LABEL_136;
          }
          memmove(&v10[16 * v41 + 16], &v10[16 * v41 + 32], 16 * (v106 - v41));
          *((void *)v10 + 2) = v106 - 1;
          unint64_t v41 = v106 - 1;
        }
        while (v106 > 2);
      }
LABEL_113:
      swift_bridgeObjectRelease();
      goto LABEL_116;
    }
  }
  __break(1u);
LABEL_142:
  __break(1u);
LABEL_143:
  __break(1u);
LABEL_144:
  __break(1u);
LABEL_145:
  __break(1u);
LABEL_146:
  __break(1u);
LABEL_147:
  sub_100041B70();
  __break(1u);
}

void sub_10002884C(void **a1, uint64_t (*a2)(uint64_t *, uint64_t *, void **, uint64_t *))
{
  uint64_t v4 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v4 = (void *)sub_1000253DC(v4);
  }
  uint64_t v5 = v4[2];
  v6[0] = (uint64_t)(v4 + 4);
  v6[1] = v5;
  sub_100027FC4(v6, a2);
  *a1 = v4;
}

uint64_t sub_1000288D0()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100028908(void *a1)
{
  return sub_100023E20(a1, *(void *)(v1 + 16));
}

uint64_t sub_100028910()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100028948(void *a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
}

unint64_t sub_100028974()
{
  unint64_t result = qword_100068D80;
  if (!qword_100068D80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100068D80);
  }
  return result;
}

uint64_t *sub_1000289C8(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100028A2C(unint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  if (a1 >> 62)
  {
    uint64_t v5 = sub_100041BA0();
    char v94 = (char)v3;
    if (v5) {
      goto LABEL_3;
    }
LABEL_13:
    swift_bridgeObjectRelease();
    uint64_t v7 = _swiftEmptyArrayStorage;
    goto LABEL_14;
  }
  uint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  char v94 = (char)a2;
  if (!v5) {
    goto LABEL_13;
  }
LABEL_3:
  v98[0] = (uint64_t)_swiftEmptyArrayStorage;
  sub_100036724(0, v5 & ~(v5 >> 63), 0);
  if (v5 < 0)
  {
LABEL_77:
    __break(1u);
LABEL_78:
    swift_once();
    goto LABEL_51;
  }
  uint64_t v6 = 0;
  uint64_t v7 = (void *)v98[0];
  do
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      uint64_t v8 = (void *)sub_100041AE0();
    }
    else
    {
      uint64_t v8 = *(void **)(a1 + 8 * v6 + 32);
      swift_unknownObjectRetain();
    }
    id v9 = [v8 identifier];
    v98[0] = (uint64_t)v7;
    unint64_t v11 = v7[2];
    unint64_t v10 = v7[3];
    if (v11 >= v10 >> 1)
    {
      sub_100036724(v10 > 1, v11 + 1, 1);
      uint64_t v7 = (void *)v98[0];
    }
    ++v6;
    v7[2] = v11 + 1;
    uint64_t v12 = &v7[2 * v11];
    v12[4] = v9;
    v12[5] = v8;
  }
  while (v5 != v6);
  swift_bridgeObjectRelease();
LABEL_14:
  uint64_t v3 = (void *)sub_10002A36C((uint64_t)_swiftEmptyArrayStorage);
  uint64_t v13 = v7[2];
  if (v13)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = (uint64_t)(v7 + 5);
    uint64_t v95 = v7;
    while (1)
    {
      uint64_t v2 = *(void *)v5;
      uint64_t v14 = v3[2];
      id v15 = *(id *)(v5 - 8);
      uint64_t v16 = v15;
      if (v14)
      {
        id v17 = v15;
        swift_unknownObjectRetain_n();
        id v18 = v17;
        unint64_t v19 = sub_10003720C((uint64_t)v18);
        if (v20)
        {
          uint64_t v21 = *(void *)(v3[7] + 8 * v19);
          swift_bridgeObjectRetain();

          v98[0] = v21;
          swift_unknownObjectRetain();
          sub_1000417D0();
          if (*(void *)((v98[0] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v98[0] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
            sub_100041820();
          }
          sub_100041840();
          sub_100041810();
          uint64_t v22 = v98[0];
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          id v97 = v3;
          unint64_t v25 = sub_10003720C((uint64_t)v18);
          uint64_t v26 = v3[2];
          BOOL v27 = (v24 & 1) == 0;
          uint64_t v28 = v26 + v27;
          if (__OFADD__(v26, v27)) {
            goto LABEL_75;
          }
          char v29 = v24;
          if (v3[3] >= v28)
          {
            uint64_t v7 = v95;
            if (isUniquelyReferenced_nonNull_native)
            {
              uint64_t v32 = 8 * v25;
              if ((v24 & 1) == 0) {
                goto LABEL_45;
              }
            }
            else
            {
              sub_100025170();
              uint64_t v7 = v95;
              uint64_t v3 = v97;
              uint64_t v32 = 8 * v25;
              if ((v29 & 1) == 0) {
                goto LABEL_45;
              }
            }
          }
          else
          {
            sub_100024EBC(v28, isUniquelyReferenced_nonNull_native);
            uint64_t v3 = v97;
            unint64_t v30 = sub_10003720C((uint64_t)v18);
            if ((v29 & 1) != (v31 & 1)) {
              goto LABEL_81;
            }
            unint64_t v25 = v30;
            uint64_t v7 = v95;
            uint64_t v32 = 8 * v30;
            if ((v29 & 1) == 0)
            {
LABEL_45:
              v3[(v25 >> 6) + 8] |= 1 << v25;
              *(void *)(v3[6] + v32) = v18;
              *(void *)(v3[7] + v32) = v22;
              uint64_t v51 = v3[2];
              BOOL v48 = __OFADD__(v51, 1);
              uint64_t v52 = v51 + 1;
              if (v48) {
                goto LABEL_76;
              }
              v3[2] = v52;
              id v53 = v18;
              goto LABEL_47;
            }
          }
          *(void *)(v3[7] + v32) = v98[0];
          swift_bridgeObjectRelease();
LABEL_47:
          swift_bridgeObjectRelease();

          goto LABEL_18;
        }
      }
      else
      {
        swift_unknownObjectRetain_n();
        id v33 = v16;
      }
      sub_100016F7C((uint64_t *)&unk_100068B00);
      uint64_t v34 = swift_allocObject();
      *(_OWORD *)(v34 + 16) = xmmword_100056640;
      *(void *)(v34 + 32) = v2;
      v98[0] = v34;
      sub_100041810();
      uint64_t v35 = v98[0];
      id v36 = v16;
      swift_unknownObjectRetain();
      char v37 = swift_isUniquelyReferenced_nonNull_native();
      v98[0] = (uint64_t)v3;
      unint64_t v39 = sub_10003720C((uint64_t)v36);
      uint64_t v40 = v3[2];
      BOOL v41 = (v38 & 1) == 0;
      uint64_t v42 = v40 + v41;
      if (__OFADD__(v40, v41))
      {
        __break(1u);
LABEL_74:
        __break(1u);
LABEL_75:
        __break(1u);
LABEL_76:
        __break(1u);
        goto LABEL_77;
      }
      char v43 = v38;
      if (v3[3] >= v42)
      {
        uint64_t v7 = v95;
        if (v37)
        {
          if ((v38 & 1) == 0) {
            goto LABEL_37;
          }
        }
        else
        {
          sub_100025170();
          uint64_t v7 = v95;
          uint64_t v3 = (void *)v98[0];
          if ((v43 & 1) == 0) {
            goto LABEL_37;
          }
        }
      }
      else
      {
        sub_100024EBC(v42, v37);
        uint64_t v3 = (void *)v98[0];
        unint64_t v44 = sub_10003720C((uint64_t)v36);
        if ((v43 & 1) != (v45 & 1))
        {
LABEL_81:
          type metadata accessor for MessageID(0);
          sub_100041C70();
          __break(1u);
LABEL_82:
          swift_release();
          swift_release();
          swift_release();
          uint64_t result = swift_release();
          __break(1u);
          return result;
        }
        unint64_t v39 = v44;
        uint64_t v7 = v95;
        if ((v43 & 1) == 0)
        {
LABEL_37:
          v3[(v39 >> 6) + 8] |= 1 << v39;
          uint64_t v46 = 8 * v39;
          *(void *)(v3[6] + v46) = v36;
          *(void *)(v3[7] + v46) = v35;
          uint64_t v47 = v3[2];
          BOOL v48 = __OFADD__(v47, 1);
          uint64_t v49 = v47 + 1;
          if (v48) {
            goto LABEL_74;
          }
          v3[2] = v49;
          id v50 = v36;
          goto LABEL_17;
        }
      }
      *(void *)(v3[7] + 8 * v39) = v35;
      swift_bridgeObjectRelease();
LABEL_17:
      swift_bridgeObjectRelease();

LABEL_18:
      swift_unknownObjectRelease_n();
      v5 += 16;
      if (!--v13)
      {
        swift_bridgeObjectRelease();
        break;
      }
    }
  }
  uint64_t v5 = 0;
  sub_100020010((uint64_t)v3);
  uint64_t v2 = v54;
  if (!*(void *)(v54 + 16))
  {
    BOOL v72 = v7;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_100068440 == -1) {
      goto LABEL_62;
    }
    goto LABEL_80;
  }
  swift_bridgeObjectRelease();
  if (qword_100068440 != -1) {
    goto LABEL_78;
  }
LABEL_51:
  uint64_t v55 = sub_1000416D0();
  sub_10001F3C4(v55, (uint64_t)qword_100068B20);
  swift_bridgeObjectRetain_n();
  unint64_t v56 = sub_1000416B0();
  os_log_type_t v57 = sub_100041930();
  if (os_log_type_enabled(v56, v57))
  {
    uint64_t v96 = v5;
    uint64_t v58 = swift_slowAlloc();
    v98[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v58 = 136315394;
    int64_t v59 = *(void *)(v2 + 16);
    if (v59)
    {
      id v97 = _swiftEmptyArrayStorage;
      sub_100041B30();
      uint64_t v60 = (void **)(v2 + 32);
      int64_t v61 = v59;
      do
      {
        char v62 = *v60;
        v60 += 2;
        id v63 = v62;
        sub_100041B10();
        sub_100041B40();
        sub_100041B50();
        sub_100041B20();
        --v61;
      }
      while (v61);
    }
    type metadata accessor for MessageID(0);
    uint64_t v64 = sub_100041800();
    unint64_t v66 = v65;
    swift_bridgeObjectRelease();
    id v97 = (void *)sub_10001F3FC(v64, v66, v98);
    sub_1000419E0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v58 + 12) = 2080;
    if (v59)
    {
      Swift::Int v93 = v56;
      id v97 = _swiftEmptyArrayStorage;
      sub_100036754(0, v59, 0);
      char v67 = _swiftEmptyArrayStorage;
      unint64_t v68 = _swiftEmptyArrayStorage[2];
      uint64_t v69 = (uint64_t *)(v2 + 40);
      do
      {
        uint64_t v70 = *v69;
        id v97 = v67;
        unint64_t v71 = v67[3];
        swift_bridgeObjectRetain();
        if (v68 >= v71 >> 1)
        {
          sub_100036754(v71 > 1, v68 + 1, 1);
          char v67 = v97;
        }
        v67[2] = v68 + 1;
        v67[v68 + 4] = v70;
        v69 += 2;
        ++v68;
        --v59;
      }
      while (v59);
      unint64_t v56 = v93;
    }
    sub_100016F7C(&qword_100068DA8);
    uint64_t v78 = sub_100041800();
    unint64_t v80 = v79;
    swift_bridgeObjectRelease();
    id v97 = (void *)sub_10001F3FC(v78, v80, v98);
    sub_1000419E0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v56, v57, "CachedVoicemailManager.Cache.init(voicemails:) with duplicate keys: %s, voicemails: %s", (uint8_t *)v58, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v5 = v96;
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }
  uint64_t v77 = sub_10002026C((uint64_t)v3);
  swift_bridgeObjectRelease();
  while (1)
  {
    uint64_t v81 = sub_100027BA8(v77);
    uint64_t v83 = v82;
    uint64_t v85 = v84;
    swift_bridgeObjectRelease();
    type metadata accessor for CachedVoicemailManager.Cache();
    uint64_t v86 = (uint64_t *)swift_allocObject();
    v86[2] = v81;
    v86[3] = v83;
    v86[4] = v85;
    if ((v94 & 1) == 0) {
      return (uint64_t)v86;
    }
    swift_beginAccess();
    uint64_t v88 = v86[2];
    uint64_t v87 = v86[3];
    uint64_t v89 = v86[4];
    swift_retain();
    swift_retain();
    swift_retain();
    sub_100027A68(v88, v87, v89);
    id v97 = v90;
    sub_10002884C(&v97, (uint64_t (*)(uint64_t *, uint64_t *, void **, uint64_t *))sub_100020654);
    if (v5) {
      goto LABEL_82;
    }
    swift_release();
    swift_release();
    swift_release();
    BOOL v72 = v97;
    uint64_t v91 = v97[2];
    if (v91 == *(void *)(v89 + 16))
    {
      sub_100025A44((uint64_t)(v97 + 4), v91, v86 + 2);
      swift_release();
      swift_endAccess();
      return (uint64_t)v86;
    }
    __break(1u);
LABEL_80:
    swift_once();
LABEL_62:
    uint64_t v73 = sub_1000416D0();
    sub_10001F3C4(v73, (uint64_t)qword_100068B20);
    uint64_t v74 = sub_1000416B0();
    os_log_type_t v75 = sub_100041940();
    if (os_log_type_enabled(v74, v75))
    {
      uint64_t v76 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v76 = 0;
      _os_log_impl((void *)&_mh_execute_header, v74, v75, "CachedVoicemailManager.Cache.init(voicemails:) without duplicate keys", v76, 2u);
      swift_slowDealloc();
    }

    uint64_t v77 = (uint64_t)v72;
  }
}

uint64_t sub_100029478(unint64_t a1)
{
  unint64_t v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_100041BA0();
    swift_bridgeObjectRelease();
  }
  type metadata accessor for MessageID(0);
  sub_10002962C(&qword_100068D90, (void (*)(uint64_t))type metadata accessor for MessageID);
  uint64_t result = sub_100041900();
  uint64_t v10 = result;
  if (v2)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_100041BA0();
    uint64_t result = swift_bridgeObjectRelease();
    if (!v4) {
      return v10;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v4) {
      return v10;
    }
  }
  if (v4 >= 1)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        uint64_t v6 = (void *)sub_100041AE0();
        sub_1000260EC(&v9, v6);
      }
    }
    else
    {
      uint64_t v7 = (void **)(a1 + 32);
      do
      {
        uint64_t v8 = *v7++;
        sub_1000260EC(&v9, v8);

        --v4;
      }
      while (v4);
    }
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_1000295EC()
{
  sub_100020DE8(*(void *)(v0 + 16), 1);

  return swift_bridgeObjectRelease();
}

uint64_t sub_10002962C(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100029674()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000296AC()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_1000296EC(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_1000297A0;
  return sub_100022440(a1, v4, v5, v6);
}

uint64_t sub_1000297A0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100029894()
{
  _Block_release(*(const void **)(v0 + 24));
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_1000298DC()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_100029E9C;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_100068DB8 + dword_100068DB8);
  return v6(v2, v3, v4);
}

uint64_t sub_100029998()
{
  _Block_release(*(const void **)(v0 + 16));
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000299D8()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_100029E9C;
  uint64_t v5 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_100068DC8 + dword_100068DC8);
  return v5(v2, v3);
}

uint64_t sub_100029A88()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_100029E9C;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_100069438 + dword_100069438);
  return v6(v2, v3, v4);
}

uint64_t sub_100029B4C()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100029B8C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_100029E9C;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_100069448 + dword_100069448);
  return v8(a1, v4, v5, v6);
}

uint64_t *initializeBufferWithCopyOfBuffer for CachedVoicemailManager.Error(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  if ((unint64_t)*a2 >= 0xFFFFFFFF) {
    uint64_t v3 = swift_bridgeObjectRetain();
  }
  *a1 = v3;
  return a1;
}

unint64_t destroy for CachedVoicemailManager.Error(unint64_t *a1)
{
  unint64_t result = *a1;
  if (result >= 0xFFFFFFFF) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t *assignWithCopy for CachedVoicemailManager.Error(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a1;
  unint64_t v4 = *a2;
  if (v3 < 0xFFFFFFFF)
  {
    *a1 = v4;
    if (v4 >= 0xFFFFFFFF) {
      swift_bridgeObjectRetain();
    }
  }
  else if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    *a1 = *a2;
  }
  else
  {
    *a1 = v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  return a1;
}

unint64_t *assignWithTake for CachedVoicemailManager.Error(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3 = *a2;
  if (*a1 < 0xFFFFFFFF) {
    goto LABEL_5;
  }
  if (v3 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    *a1 = v3;
    return a1;
  }
  *a1 = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for CachedVoicemailManager.Error(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFE && *((unsigned char *)a1 + 8)) {
    return (*(_DWORD *)a1 + 2147483646);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  unsigned int v4 = v3 + 1;
  unsigned int v5 = v3 - 1;
  if (v4 >= 3) {
    return v5;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for CachedVoicemailManager.Error(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(void *)unint64_t result = 0;
    *(_DWORD *)unint64_t result = a2 - 2147483646;
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 8) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFE) {
      *(unsigned char *)(result + 8) = 0;
    }
    if (a2) {
      *(void *)unint64_t result = a2 + 1;
    }
  }
  return result;
}

uint64_t sub_100029E48(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_100029E60(void *result, int a2)
{
  if (a2 < 0)
  {
    unsigned int v2 = a2 ^ 0x80000000;
  }
  else
  {
    if (!a2) {
      return result;
    }
    unsigned int v2 = a2 - 1;
  }
  *unint64_t result = v2;
  return result;
}

ValueMetadata *type metadata accessor for CachedVoicemailManager.Error()
{
  return &type metadata for CachedVoicemailManager.Error;
}

void *sub_100029EA0(unint64_t a1)
{
  unint64_t v1 = a1;
  if (a1 >> 62) {
    goto LABEL_14;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    unint64_t result = _swiftEmptyArrayStorage;
    if (!v2) {
      break;
    }
    unint64_t result = (void *)sub_100041B30();
    if (v2 < 0)
    {
      __break(1u);
      return result;
    }
    unint64_t v13 = v1;
    uint64_t v4 = 0;
    unint64_t v14 = v1 & 0xC000000000000001;
    while (v2 != v4)
    {
      if (v14) {
        id v5 = (id)sub_100041AE0();
      }
      else {
        id v5 = *(id *)(v1 + 8 * v4 + 32);
      }
      id v6 = v5;
      ++v4;
      type metadata accessor for FTMessage(0);
      uint64_t v7 = swift_allocObject();
      *(void *)(v7 + 24) = 0;
      *(unsigned char *)(v7 + 32) = 1;
      *(_WORD *)(v7 + 33) = 514;
      uint64_t v8 = v7 + OBJC_IVAR____TtC37VoicemailMessageNotificationExtension9FTMessage____lazy_storage___dataURL;
      uint64_t v9 = sub_100016F7C(&qword_1000687D8);
      uint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56);
      v10(v8, 1, 1, v9);
      v10(v7 + OBJC_IVAR____TtC37VoicemailMessageNotificationExtension9FTMessage____lazy_storage___thumbnailURL, 1, 1, v9);
      v10(v7 + OBJC_IVAR____TtC37VoicemailMessageNotificationExtension9FTMessage____lazy_storage___transcriptURL, 1, 1, v9);
      uint64_t v11 = v7 + OBJC_IVAR____TtC37VoicemailMessageNotificationExtension9FTMessage____lazy_storage___transcriptData;
      uint64_t v12 = sub_100016F7C((uint64_t *)&unk_1000689D8);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 1, 1, v12);
      *(void *)(v7 + OBJC_IVAR____TtC37VoicemailMessageNotificationExtension9FTMessage____lazy_storage___transcript) = 1;
      *(unsigned char *)(v7 + OBJC_IVAR____TtC37VoicemailMessageNotificationExtension9FTMessage_didLoadTranscript) = 0;
      *(unsigned char *)(v7 + OBJC_IVAR____TtC37VoicemailMessageNotificationExtension9FTMessage_isDirty) = 0;
      *(void *)(v7 + 16) = v6;
      sub_100041B10();
      sub_100041B40();
      sub_100041B50();
      sub_100041B20();
      unint64_t v1 = v13;
      if (v2 == v4) {
        return _swiftEmptyArrayStorage;
      }
    }
    __break(1u);
LABEL_14:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_100041BA0();
    swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_10002A124(unint64_t a1)
{
  unint64_t v2 = v1;
  uint64_t v16 = sub_100041340();
  uint64_t v4 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  id v6 = (char *)v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 >> 62) {
    goto LABEL_15;
  }
  uint64_t v7 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    uint64_t v8 = _swiftEmptyArrayStorage;
    if (!v7) {
      return (uint64_t)v8;
    }
    id v17 = _swiftEmptyArrayStorage;
    uint64_t result = sub_100036774(0, v7 & ~(v7 >> 63), 0);
    if (v7 < 0) {
      break;
    }
    uint64_t v10 = 0;
    uint64_t v8 = v17;
    unint64_t v15 = a1 & 0xC000000000000001;
    v14[1] = v2;
    v14[2] = v4 + 32;
    unint64_t v11 = a1;
    while (v7 != v10)
    {
      if (v15) {
        sub_100041AE0();
      }
      else {
        swift_retain();
      }
      swift_beginAccess();
      swift_retain();
      sub_100041440();
      swift_endAccess();
      swift_release_n();
      id v17 = v8;
      unint64_t v13 = v8[2];
      unint64_t v12 = v8[3];
      unint64_t v2 = v13 + 1;
      if (v13 >= v12 >> 1)
      {
        sub_100036774(v12 > 1, v13 + 1, 1);
        uint64_t v8 = v17;
      }
      ++v10;
      v8[2] = v2;
      (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))((unint64_t)v8+ ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80))+ *(void *)(v4 + 72) * v13, v6, v16);
      a1 = v11;
      if (v7 == v10) {
        return (uint64_t)v8;
      }
    }
    __break(1u);
LABEL_15:
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_100041BA0();
    swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

unint64_t sub_10002A36C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    unint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100016F7C(&qword_100068DB0);
  unint64_t v2 = (void *)sub_100041BD0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 40);
  while (1)
  {
    uint64_t v5 = *v4;
    id v6 = (id)*(v4 - 1);
    swift_bridgeObjectRetain();
    unint64_t result = sub_10003720C((uint64_t)v6);
    if (v8) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v9 = 8 * result;
    *(void *)(v2[6] + v9) = v6;
    *(void *)(v2[7] + v9) = v5;
    uint64_t v10 = v2[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v2[2] = v12;
    v4 += 2;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_10002A478(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    unint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100016F7C(&qword_1000691B8);
  unint64_t v2 = (void *)sub_100041BD0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v5 = (uint64_t)*(v4 - 2);
    uint64_t v6 = (uint64_t)*(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    id v8 = v7;
    unint64_t result = sub_100037250(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    BOOL v11 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v11 = v5;
    v11[1] = v6;
    *(void *)(v2[7] + 8 * result) = v8;
    uint64_t v12 = v2[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v2[2] = v14;
    v4 += 3;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

void sub_10002A594(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_1000416D0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  BOOL v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v4, v8);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v12 = sub_1000416B0();
  os_log_type_t v13 = sub_100041940();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = swift_slowAlloc();
    uint64_t v23 = swift_slowAlloc();
    uint64_t v25 = v23;
    uint64_t aBlock = a1;
    *(_DWORD *)uint64_t v14 = 136315394;
    uint64_t v27 = a2;
    swift_bridgeObjectRetain();
    uint64_t v15 = sub_100041790();
    uint64_t v24 = a1;
    uint64_t aBlock = sub_10001F3FC(v15, v16, &v25);
    sub_1000419E0();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v14 + 12) = 2080;
    uint64_t aBlock = a3;
    swift_bridgeObjectRetain();
    sub_100016F7C(&qword_1000691A0);
    uint64_t v17 = sub_100041790();
    uint64_t aBlock = sub_10001F3FC(v17, v18, &v25);
    sub_1000419E0();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "VoiceMailAnalyticsLogger: logging core analytics for event of %s with dictionary %s", (uint8_t *)v14, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  NSString v19 = sub_100041740();
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = a3;
  unint64_t v30 = sub_10003810C;
  uint64_t v31 = v20;
  uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
  uint64_t v27 = 1107296256;
  uint64_t v28 = sub_10002A90C;
  char v29 = &unk_10005E150;
  uint64_t v21 = _Block_copy(&aBlock);
  swift_bridgeObjectRetain();
  swift_release();
  AnalyticsSendEventLazy();
  _Block_release(v21);
}

Class sub_10002A90C(uint64_t a1)
{
  unint64_t v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  uint64_t v3 = v1(v2);
  swift_release();
  if (v3)
  {
    sub_10001FB24(0, &qword_1000691A8);
    v4.super.Class isa = sub_100041720().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.Class isa = 0;
  }

  return v4.super.isa;
}

uint64_t sub_10002A9A8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = swift_allocObject();
  sub_100016F7C(&qword_100069230);
  uint64_t v4 = sub_100041650();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 72);
  unint64_t v7 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_1000568C0;
  uint64_t v9 = (uint64_t *)(v8 + v7);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = *(void *)(v1
                                    + OBJC_IVAR____TtC37VoicemailMessageNotificationExtension24FaceTimeVoicemailManager_providers);
  *uint64_t v9 = v10;
  BOOL v11 = *(void (**)(uint64_t *, void, uint64_t))(v5 + 104);
  v11(v9, enum case for MessageStoreQuery.providers(_:), v4);
  uint64_t v12 = (uint64_t *)((char *)v9 + v6);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = *(void *)(v1
                                    + OBJC_IVAR____TtC37VoicemailMessageNotificationExtension24FaceTimeVoicemailManager_messageTypes);
  uint64_t *v12 = v13;
  v11(v12, enum case for MessageStoreQuery.types(_:), v4);
  *(void *)(v3 + 16) = v8;
  *a1 = v3;
  v11(a1, enum case for MessageStoreQuery.and(_:), v4);
  swift_bridgeObjectRetain();

  return swift_bridgeObjectRetain();
}

uint64_t sub_10002AB6C()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC37VoicemailMessageNotificationExtension24FaceTimeVoicemailManager_logger;
  uint64_t v2 = sub_1000416D0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  sub_100038470(v0 + OBJC_IVAR____TtC37VoicemailMessageNotificationExtension24FaceTimeVoicemailManager_analyticsReporter, type metadata accessor for VoiceMailAnalyticsLogger);
  sub_100038460(*(void *)(v0
                          + OBJC_IVAR____TtC37VoicemailMessageNotificationExtension24FaceTimeVoicemailManager_onVoicemailsChanged));
  sub_10001FA54(v0 + OBJC_IVAR____TtC37VoicemailMessageNotificationExtension24FaceTimeVoicemailManager_messageStoreController);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  return swift_release();
}

uint64_t sub_10002AC60()
{
  uint64_t v1 = v0;
  uint64_t v2 = v0 + OBJC_IVAR____TtC37VoicemailMessageNotificationExtension24FaceTimeVoicemailManager_messageStoreController;
  sub_1000366C0((void *)(v0+ OBJC_IVAR____TtC37VoicemailMessageNotificationExtension24FaceTimeVoicemailManager_messageStoreController), *(void *)(v0+ OBJC_IVAR____TtC37VoicemailMessageNotificationExtension24FaceTimeVoicemailManager_messageStoreController+ 24));
  sub_1000415E0();
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v3 = v0 + OBJC_IVAR____TtC37VoicemailMessageNotificationExtension24FaceTimeVoicemailManager_logger;
  uint64_t v4 = sub_1000416D0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_100038470(v1 + OBJC_IVAR____TtC37VoicemailMessageNotificationExtension24FaceTimeVoicemailManager_analyticsReporter, type metadata accessor for VoiceMailAnalyticsLogger);
  sub_100038460(*(void *)(v1
                          + OBJC_IVAR____TtC37VoicemailMessageNotificationExtension24FaceTimeVoicemailManager_onVoicemailsChanged));
  sub_10001FA54(v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_10002AD88()
{
  sub_10002AC60();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v1, v2);
}

uint64_t sub_10002ADE0()
{
  return type metadata accessor for FaceTimeVoicemailManager(0);
}

uint64_t type metadata accessor for FaceTimeVoicemailManager(uint64_t a1)
{
  return sub_100019758(a1, (uint64_t *)&unk_100068E40);
}

uint64_t sub_10002AE08(uint64_t a1, char a2)
{
  swift_bridgeObjectRetain_n();
  uint64_t v4 = sub_1000416B0();
  os_log_type_t v5 = sub_100041940();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 136315138;
    uint64_t v7 = swift_bridgeObjectRetain();
    unint64_t v8 = sub_100018788(v7, a2);
    unint64_t v10 = v9;
    swift_bridgeObjectRelease();
    sub_10001F3FC(v8, v10, &v14);
    sub_1000419E0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "FaceTimeVoicemailManager: Is notifying listeners of messageChanges: %s", v6, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v11 = swift_allocObject();
  swift_weakInit();
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v11;
  *(void *)(v12 + 24) = a1;
  *(unsigned char *)(v12 + 32) = a2;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_100041350();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_10002B038(uint64_t a1, uint64_t a2, char a3)
{
  *(unsigned char *)(v3 + 49) = a3;
  *(void *)(v3 + 56) = a1;
  *(void *)(v3 + 64) = a2;
  type metadata accessor for VoicemailActor();
  swift_initStaticObject();
  sub_10003852C((unint64_t *)&qword_100068530, (void (*)(uint64_t))type metadata accessor for VoicemailActor);
  uint64_t v5 = sub_100041850();
  return _swift_task_switch(sub_10002B104, v5, v4);
}

uint64_t sub_10002B104()
{
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v2 = *(void (**)(void))(Strong
                          + OBJC_IVAR____TtC37VoicemailMessageNotificationExtension24FaceTimeVoicemailManager_onVoicemailsChanged);
    if (v2) {
      v2();
    }
    char v3 = *(unsigned char *)(v0 + 49);
    *(void *)(v0 + 40) = *(void *)(v0 + 64);
    *(unsigned char *)(v0 + 48) = v3;
    sub_1000416E0();
    swift_release();
  }
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_10002B1E0()
{
  v1[101] = v0;
  type metadata accessor for VoicemailActor();
  swift_initStaticObject();
  sub_10003852C((unint64_t *)&qword_100068530, (void (*)(uint64_t))type metadata accessor for VoicemailActor);
  uint64_t v3 = sub_100041850();
  v1[102] = v3;
  v1[103] = v2;
  return _swift_task_switch(sub_10002B2AC, v3, v2);
}

uint64_t sub_10002B2AC()
{
  *(void *)(v0 + 832) = OBJC_IVAR____TtC37VoicemailMessageNotificationExtension24FaceTimeVoicemailManager_logger;
  uint64_t v1 = sub_1000416B0();
  os_log_type_t v2 = sub_100041940();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Fetching Messages from FTMS", v3, 2u);
    swift_slowDealloc();
  }

  swift_retain_n();
  sub_10001701C(&qword_100069208);
  swift_asyncLet_begin();
  return _swift_asyncLet_get(v0 + 16, v0 + 696, sub_10002B3F4, v0 + 704);
}

uint64_t sub_10002B3F4()
{
  uint64_t v1 = v0[87];
  v0[105] = v1;
  swift_retain();
  os_log_type_t v2 = (void *)swift_task_alloc();
  v0[106] = v2;
  uint64_t v3 = sub_100016F7C(&qword_100069210);
  uint64_t v4 = sub_100016F7C(&qword_100069218);
  *os_log_type_t v2 = v0;
  v2[1] = sub_10002B4DC;
  return Task.value.getter(v0 + 99, v1, v3, v4, &protocol self-conformance witness table for Error);
}

uint64_t sub_10002B4DC()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 856) = v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v3 = *(void *)(v2 + 824);
  uint64_t v4 = *(void *)(v2 + 816);
  if (v0) {
    uint64_t v5 = sub_10002B868;
  }
  else {
    uint64_t v5 = sub_10002B630;
  }
  return _swift_task_switch(v5, v4, v3);
}

uint64_t sub_10002B630()
{
  unint64_t v1 = v0[99];
  swift_bridgeObjectRetain_n();
  uint64_t v2 = sub_1000416B0();
  os_log_type_t v3 = sub_100041940();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 134349056;
    if (v1 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v5 = sub_100041BA0();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v5 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    v0[100] = v5;
    sub_1000419E0();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Fetched %{public}ld message(s) from FTMS", v4, 0xCu);
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  v0[108] = sub_100029EA0(v1);
  swift_bridgeObjectRelease();
  return _swift_asyncLet_finish(v0 + 2, v0 + 87, sub_10002B7E0, v0 + 94);
}

uint64_t sub_10002B7E0()
{
  return _swift_task_switch(sub_10002B7FC, *(void *)(v0 + 816), *(void *)(v0 + 824));
}

uint64_t sub_10002B7FC()
{
  swift_release_n();
  unint64_t v1 = *(uint64_t (**)(uint64_t))(v0 + 8);
  uint64_t v2 = *(void *)(v0 + 864);
  return v1(v2);
}

uint64_t sub_10002B868()
{
  return _swift_asyncLet_finish(v0 + 16, v0 + 696, sub_10002B888, v0 + 656);
}

uint64_t sub_10002B888()
{
  return _swift_task_switch(sub_10002B8A4, *(void *)(v0 + 816), *(void *)(v0 + 824));
}

uint64_t sub_10002B8A4()
{
  swift_release_n();
  unint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10002B90C(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  v2[3] = a2;
  sub_100016F7C((uint64_t *)&unk_100069380);
  v2[4] = swift_task_alloc();
  return _swift_task_switch(sub_10002B9A0, 0, 0);
}

uint64_t sub_10002B9A0()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = v0[4];
  uint64_t v3 = (uint64_t *)v0[2];
  sub_100041880();
  uint64_t v4 = sub_1000418B0();
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v2, 0, 1, v4);
  uint64_t v5 = (void *)swift_allocObject();
  void v5[2] = 0;
  v5[3] = 0;
  v5[4] = v1;
  swift_retain();
  uint64_t *v3 = sub_10002C2C0(v2, (uint64_t)&unk_100069228, (uint64_t)v5);
  swift_task_dealloc();
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_10002BAA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[5] = a1;
  v4[6] = a4;
  v4[7] = sub_100041560();
  v4[8] = swift_task_alloc();
  uint64_t v5 = sub_100041620();
  v4[9] = v5;
  v4[10] = *(void *)(v5 - 8);
  v4[11] = swift_task_alloc();
  sub_100041650();
  v4[12] = swift_task_alloc();
  uint64_t v6 = sub_100041640();
  v4[13] = v6;
  v4[14] = *(void *)(v6 - 8);
  v4[15] = swift_task_alloc();
  return _swift_task_switch(sub_10002BC20, 0, 0);
}

uint64_t sub_10002BC20()
{
  uint64_t v1 = *(void *)(v0 + 88);
  uint64_t v2 = *(void *)(v0 + 72);
  uint64_t v3 = *(void *)(v0 + 80);
  uint64_t v4 = *(void *)(v0 + 48);
  sub_10002A9A8(*(uint64_t **)(v0 + 96));
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))(v1, enum case for MessageStoreFetchRequest.QuerySearchType.unsorted(_:), v2);
  *(void *)(v0 + 16) = _swiftEmptyArrayStorage;
  sub_10003852C(&qword_1000691D8, (void (*)(uint64_t))&type metadata accessor for MessageFetchOptions);
  sub_100016F7C(&qword_1000691E0);
  sub_1000384D0();
  sub_100041A10();
  sub_100041630();
  sub_1000366C0((void *)(v4+ OBJC_IVAR____TtC37VoicemailMessageNotificationExtension24FaceTimeVoicemailManager_messageStoreController), *(void *)(v4+ OBJC_IVAR____TtC37VoicemailMessageNotificationExtension24FaceTimeVoicemailManager_messageStoreController+ 24));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 128) = v5;
  void *v5 = v0;
  v5[1] = sub_10002BDD4;
  uint64_t v6 = *(void *)(v0 + 120);
  return MessageStoreController.getMessages(fetchRequest:)(v6);
}

uint64_t sub_10002BDD4(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 136) = a1;
  *(void *)(v3 + 144) = v1;
  swift_task_dealloc();
  if (v1) {
    uint64_t v4 = sub_10002C0B8;
  }
  else {
    uint64_t v4 = sub_10002BEE8;
  }
  return _swift_task_switch(v4, 0, 0);
}

uint64_t sub_10002BEE8()
{
  swift_bridgeObjectRetain_n();
  uint64_t v1 = sub_1000416B0();
  os_log_type_t v2 = sub_100041940();
  BOOL v3 = os_log_type_enabled(v1, v2);
  unint64_t v4 = v0[17];
  if (v3)
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 134349056;
    if (v4 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v6 = sub_100041BA0();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v6 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    v0[4] = v6;
    sub_1000419E0();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Loading FTMessages gave us %{public}ld message(s).", v5, 0xCu);
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  uint64_t v7 = v0[17];
  uint64_t v8 = (void *)v0[5];
  (*(void (**)(void, void))(v0[14] + 8))(v0[15], v0[13]);
  void *v8 = v7;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t sub_10002C0B8()
{
  (*(void (**)(void, void))(v0[14] + 8))(v0[15], v0[13]);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v1 = sub_1000416B0();
  os_log_type_t v2 = sub_100041920();
  if (os_log_type_enabled(v1, v2))
  {
    BOOL v3 = (uint8_t *)swift_slowAlloc();
    unint64_t v4 = (void *)swift_slowAlloc();
    *(_DWORD *)BOOL v3 = 138412290;
    swift_errorRetain();
    uint64_t v5 = _swift_stdlib_bridgeErrorToNSError();
    v0[3] = v5;
    sub_1000419E0();
    *unint64_t v4 = v5;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Error loading FTMessages %@", v3, 0xCu);
    sub_100016F7C(&qword_100068AD0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_errorRelease();
    swift_errorRelease();
  }
  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_10002C2C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_1000418B0();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_1000418A0();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_100038704(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_100041850();
    swift_unknownObjectRelease();
  }
LABEL_5:
  sub_100016F7C(&qword_100069210);
  return swift_task_create();
}

uint64_t sub_10002C440(uint64_t a1)
{
  v2[6] = a1;
  v2[7] = v1;
  uint64_t v4 = sub_100041620();
  v2[8] = v4;
  v2[9] = *(void *)(v4 - 8);
  v2[10] = swift_task_alloc();
  uint64_t v5 = sub_100041560();
  v2[11] = v5;
  v2[12] = *(void *)(v5 - 8);
  v2[13] = swift_task_alloc();
  uint64_t v6 = sub_100041650();
  v2[14] = v6;
  v2[15] = *(void *)(v6 - 8);
  uint8_t v2[16] = swift_task_alloc();
  uint64_t v7 = sub_100041640();
  v2[17] = v7;
  v2[18] = *(void *)(v7 - 8);
  v2[19] = swift_task_alloc();
  v2[20] = type metadata accessor for MessageID.Value(0);
  v2[21] = swift_task_alloc();
  uint64_t v8 = sub_100041340();
  v2[22] = v8;
  v2[23] = *(void *)(v8 - 8);
  v2[24] = swift_task_alloc();
  v2[25] = swift_task_alloc();
  v2[26] = type metadata accessor for VoicemailActor();
  v2[27] = swift_initStaticObject();
  unint64_t v9 = (void *)swift_task_alloc();
  v2[28] = v9;
  *unint64_t v9 = v2;
  v9[1] = sub_10002C708;
  return sub_100023000(a1);
}

uint64_t sub_10002C708(uint64_t a1)
{
  os_log_type_t v2 = (void *)*v1;
  v2[29] = a1;
  swift_task_dealloc();
  sub_10003852C((unint64_t *)&qword_100068530, (void (*)(uint64_t))type metadata accessor for VoicemailActor);
  uint64_t v4 = sub_100041850();
  v2[30] = v4;
  v2[31] = v3;
  return _swift_task_switch(sub_10002C884, v4, v3);
}

uint64_t sub_10002C884()
{
  uint64_t v1 = v0[29];
  if (!v1)
  {
    sub_10001A9F0(v0[6] + OBJC_IVAR___MPMessageID_value, v0[21]);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v2 = v0[25];
      uint64_t v4 = v0[22];
      uint64_t v3 = v0[23];
      uint64_t v5 = v0[15];
      uint64_t v24 = (uint64_t *)v0[16];
      uint64_t v25 = v0[14];
      uint64_t v6 = v0[9];
      uint64_t v26 = v0[10];
      uint64_t v27 = v0[8];
      uint64_t v29 = v0[7];
      (*(void (**)(uint64_t, void, uint64_t))(v3 + 32))(v2, v0[21], v4);
      uint64_t v7 = swift_allocObject();
      sub_100016F7C(&qword_100069040);
      unint64_t v8 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
      uint64_t v9 = swift_allocObject();
      *(_OWORD *)(v9 + 16) = xmmword_1000568D0;
      unint64_t v10 = *(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 16);
      v0[32] = v10;
      v0[33] = (v3 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
      v10(v9 + v8, v2, v4);
      *(void *)(v7 + 16) = v9;
      uint64_t *v24 = v7;
      (*(void (**)(uint64_t *, void, uint64_t))(v5 + 104))(v24, enum case for MessageStoreQuery.recordUUID(_:), v25);
      sub_100016F7C(&qword_1000691D0);
      uint64_t v11 = swift_allocObject();
      *(_OWORD *)(v11 + 16) = xmmword_1000568D0;
      sub_100041550();
      v0[3] = v11;
      sub_10003852C(&qword_1000691D8, (void (*)(uint64_t))&type metadata accessor for MessageFetchOptions);
      sub_100016F7C(&qword_1000691E0);
      sub_1000384D0();
      sub_100041A10();
      (*(void (**)(uint64_t, void, uint64_t))(v6 + 104))(v26, enum case for MessageStoreFetchRequest.QuerySearchType.unsorted(_:), v27);
      sub_100041630();
      sub_1000366C0((void *)(v29+ OBJC_IVAR____TtC37VoicemailMessageNotificationExtension24FaceTimeVoicemailManager_messageStoreController), *(void *)(v29+ OBJC_IVAR____TtC37VoicemailMessageNotificationExtension24FaceTimeVoicemailManager_messageStoreController+ 24));
      uint64_t v12 = (void *)swift_task_alloc();
      v0[34] = v12;
      void *v12 = v0;
      v12[1] = sub_10002CD64;
      uint64_t v13 = v0[19];
      return MessageStoreController.getMessages(fetchRequest:)(v13);
    }
    uint64_t v14 = (void *)v0[6];
    sub_100038470(v0[21], type metadata accessor for MessageID.Value);
    id v15 = v14;
    unint64_t v16 = sub_1000416B0();
    os_log_type_t v17 = sub_100041940();
    BOOL v18 = os_log_type_enabled(v16, v17);
    NSString v19 = v0[6];
    if (v18)
    {
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      uint64_t v28 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v20 = 138543362;
      v0[2] = v19;
      uint64_t v21 = v19;
      sub_1000419E0();
      *uint64_t v28 = v19;

      _os_log_impl((void *)&_mh_execute_header, v16, v17, "FaceTimeVoicemailManager received the incorrect type %{public}@ when it expected a uuid", v20, 0xCu);
      sub_100016F7C(&qword_100068AD0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      unint64_t v16 = v19;
    }
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v22 = (uint64_t (*)(uint64_t))v0[1];
  return v22(v1);
}

uint64_t sub_10002CD64(uint64_t a1)
{
  uint64_t v3 = *v2;
  uint64_t v4 = *v2;
  *(void *)(v4 + 280) = a1;
  *(void *)(v4 + 288) = v1;
  swift_task_dealloc();
  uint64_t v5 = *(void *)(v3 + 248);
  uint64_t v6 = *(void *)(v3 + 240);
  if (v1) {
    uint64_t v7 = sub_10002D1CC;
  }
  else {
    uint64_t v7 = sub_10002CEA8;
  }
  return _swift_task_switch(v7, v6, v5);
}

uint64_t sub_10002CEA8()
{
  unint64_t v1 = v0[35];
  uint64_t result = (*(uint64_t (**)(void, void))(v0[18] + 8))(v0[19], v0[17]);
  if (v1 >> 62) {
    goto LABEL_17;
  }
  if (*(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    do
    {
      if ((v1 & 0xC000000000000001) != 0)
      {
        id v3 = (id)sub_100041AE0();
      }
      else
      {
        if (!*(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
          return result;
        }
        id v3 = *(id *)(v0[35] + 32);
      }
      uint64_t v4 = v0[7];
      swift_bridgeObjectRelease();
      type metadata accessor for FTMessage(0);
      swift_allocObject();
      uint64_t v5 = sub_10001DBF8((uint64_t)v3);
      uint64_t v6 = *(void *)(v4
                     + OBJC_IVAR____TtC37VoicemailMessageNotificationExtension24FaceTimeVoicemailManager_messageTypes);
      unint64_t v1 = (unint64_t)v3;
      swift_bridgeObjectRetain();
      sub_100041490();
      uint64_t v7 = *(void *)(v6 + 16);
      if (!v7) {
        goto LABEL_15;
      }
      swift_bridgeObjectRetain();
      int v8 = (unsigned __int16)sub_100041570();
      if (v8 == (unsigned __int16)sub_100041570())
      {
LABEL_8:
        uint64_t v9 = v0[25];
        uint64_t v10 = v0[22];
        uint64_t v11 = v0[23];
        swift_bridgeObjectRelease_n();
        sub_100016F7C((uint64_t *)&unk_100068B00);
        uint64_t v12 = swift_allocObject();
        *(_OWORD *)(v12 + 16) = xmmword_100056640;
        *(void *)(v12 + 32) = v5;
        unint64_t v24 = v12;
        sub_100041810();
        swift_retain();
        sub_10002D554(v24);

        swift_bridgeObjectRelease();
        (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v9, v10);
        goto LABEL_19;
      }
      if (v7 == 1)
      {
LABEL_14:
        swift_bridgeObjectRelease();
LABEL_15:
        uint64_t v16 = v0[25];
        uint64_t v17 = v0[22];
        uint64_t v18 = v0[23];
        swift_bridgeObjectRelease();
        (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v16, v17);

        goto LABEL_19;
      }
      uint64_t v13 = 17;
      while (1)
      {
        uint64_t v14 = v13 - 15;
        if (__OFADD__(v13 - 16, 1)) {
          break;
        }
        int v15 = (unsigned __int16)sub_100041570();
        if (v15 == (unsigned __int16)sub_100041570()) {
          goto LABEL_8;
        }
        ++v13;
        if (v14 == v7) {
          goto LABEL_14;
        }
      }
      __break(1u);
LABEL_17:
      swift_bridgeObjectRetain();
      uint64_t v19 = sub_100041BA0();
      uint64_t result = swift_bridgeObjectRelease();
    }
    while (v19);
  }
  uint64_t v20 = v0[25];
  uint64_t v21 = v0[22];
  uint64_t v22 = v0[23];
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v20, v21);
  uint64_t v5 = 0;
LABEL_19:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v23 = (uint64_t (*)(uint64_t))v0[1];
  return v23(v5);
}

uint64_t sub_10002D1CC()
{
  uint64_t v26 = v0;
  unint64_t v1 = (void (*)(uint64_t, uint64_t, uint64_t))v0[32];
  uint64_t v3 = v0[24];
  uint64_t v2 = v0[25];
  uint64_t v4 = v0[22];
  (*(void (**)(void, void))(v0[18] + 8))(v0[19], v0[17]);
  v1(v3, v2, v4);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v5 = sub_1000416B0();
  os_log_type_t v6 = sub_100041940();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = v0[24];
    uint64_t v24 = v0[25];
    uint64_t v8 = v0[22];
    uint64_t v9 = v0[23];
    uint64_t v10 = swift_slowAlloc();
    uint64_t v22 = (void *)swift_slowAlloc();
    uint64_t v25 = swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 136446466;
    sub_10003852C(&qword_1000691F0, (void (*)(uint64_t))&type metadata accessor for UUID);
    uint64_t v23 = v8;
    uint64_t v11 = sub_100041C30();
    v0[4] = sub_10001F3FC(v11, v12, &v25);
    sub_1000419E0();
    swift_bridgeObjectRelease();
    uint64_t v13 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
    v13(v7, v8);
    *(_WORD *)(v10 + 12) = 2112;
    swift_errorRetain();
    uint64_t v14 = _swift_stdlib_bridgeErrorToNSError();
    v0[5] = v14;
    sub_1000419E0();
    *uint64_t v22 = v14;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "FaceTimeVoiceMailManager failed to retrieve message for uuid %{public}s because the message store threw an error %@", (uint8_t *)v10, 0x16u);
    sub_100016F7C(&qword_100068AD0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_errorRelease();
    v13(v24, v23);
  }
  else
  {
    uint64_t v16 = v0[24];
    uint64_t v15 = v0[25];
    uint64_t v17 = v0[22];
    uint64_t v18 = v0[23];
    swift_errorRelease();
    uint64_t v19 = *(void (**)(uint64_t, uint64_t))(v18 + 8);
    v19(v16, v17);
    swift_errorRelease();
    swift_errorRelease();

    v19(v15, v17);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v20 = (uint64_t (*)(void))v0[1];
  return v20(0);
}

uint64_t sub_10002D554(unint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *(void *)(v1 + 16) >> 62;
  if (!v4)
  {
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = a1;
    uint64_t v7 = (void *)(v1 + 24);
    swift_beginAccess();
    uint64_t v8 = *(void **)(v2 + 24);
    swift_bridgeObjectRetain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)(v2 + 24) = v8;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      uint64_t v8 = sub_1000365B0(0, v8[2] + 1, 1, v8);
      *uint64_t v7 = v8;
    }
    unint64_t v11 = v8[2];
    unint64_t v10 = v8[3];
    if (v11 >= v10 >> 1)
    {
      uint64_t v8 = sub_1000365B0((void *)(v10 > 1), v11 + 1, 1, v8);
      *uint64_t v7 = v8;
    }
    v8[2] = v11 + 1;
    unint64_t v12 = &v8[2 * v11];
    v12[4] = sub_100038134;
    v12[5] = v6;
    swift_endAccess();
    goto LABEL_11;
  }
  if (v4 != 1)
  {
LABEL_11:
    sub_100028974();
    return swift_willThrowTypedImpl();
  }
  swift_retain();
  sub_1000207C4(a1, 1);
  swift_release();

  return sub_10002AE08(a1, 1);
}

uint64_t sub_10002D868()
{
  uint64_t result = sub_1000416D0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_10002D92C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  type metadata accessor for VoicemailActor();
  swift_initStaticObject();
  sub_10003852C((unint64_t *)&qword_100068530, (void (*)(uint64_t))type metadata accessor for VoicemailActor);
  uint64_t v5 = sub_100041850();
  return _swift_task_switch(sub_10002D9F8, v5, v4);
}

uint64_t sub_10002D9F8()
{
  unint64_t v1 = *(void **)(v0 + 16);
  *(void *)(v0 + 40) = _Block_copy(*(const void **)(v0 + 24));
  id v2 = v1;
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 48) = v3;
  void *v3 = v0;
  v3[1] = sub_1000237F8;
  uint64_t v4 = *(void *)(v0 + 16);
  return sub_10002C440(v4);
}

uint64_t sub_10002DAB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[25] = a2;
  v3[26] = a3;
  v3[24] = a1;
  type metadata accessor for VoicemailActor();
  swift_initStaticObject();
  sub_10003852C((unint64_t *)&qword_100068530, (void (*)(uint64_t))type metadata accessor for VoicemailActor);
  uint64_t v5 = sub_100041850();
  return _swift_task_switch(sub_10002DB84, v5, v4);
}

uint64_t sub_10002DB84()
{
  unint64_t v67 = v0;
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  swift_bridgeObjectRetain_n();
  uint64_t v3 = sub_1000416B0();
  if (!Strong)
  {
    LOBYTE(inited) = sub_100041920();
    BOOL v8 = os_log_type_enabled(v3, (os_log_type_t)inited);
    unint64_t v9 = *(void *)(v0 + 208);
    if (!v8)
    {
      swift_bridgeObjectRelease_n();
      goto LABEL_45;
    }
    unint64_t v10 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)unint64_t v10 = 134217984;
    if (!(v9 >> 62))
    {
      uint64_t v11 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
LABEL_7:
      swift_bridgeObjectRelease();
      *(void *)(v0 + 168) = v11;
      sub_1000419E0();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v3, (os_log_type_t)inited, "ignoring %ld added messages, no more self", v10, 0xCu);
      swift_slowDealloc();
LABEL_45:

      goto LABEL_73;
    }
LABEL_79:
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_100041BA0();
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  os_log_type_t v4 = sub_100041940();
  unint64_t v62 = v0;
  uint64_t v60 = (uint64_t *)(v0 + 176);
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t inited = swift_slowAlloc();
    unint64_t v66 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t inited = 136315138;
    sub_100041540();
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_100041800();
    unint64_t v7 = v6;
    swift_bridgeObjectRelease();
    *(void *)(v0 + 184) = sub_10001F3FC(v5, v7, (uint64_t *)&v66);
    sub_1000419E0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "messageStoreDidAddMessages: %s", (uint8_t *)inited, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v12 = *(void *)(v0 + 208);
  uint64_t v13 = *(void *)(Strong
                  + OBJC_IVAR____TtC37VoicemailMessageNotificationExtension24FaceTimeVoicemailManager_messageTypes);
  unint64_t v66 = _swiftEmptyArrayStorage;
  if ((unint64_t)v12 >> 62) {
    goto LABEL_49;
  }
  uint64_t v14 = *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v15 = v12;
LABEL_11:
  if (v14)
  {
    unint64_t v0 = 0;
    uint64_t v63 = v12 & 0xFFFFFFFFFFFFFF8;
    unint64_t v64 = v12 & 0xC000000000000001;
    uint64_t v16 = v15 + 32;
    while (1)
    {
      if (v64)
      {
        id v17 = (id)sub_100041AE0();
      }
      else
      {
        if (v0 >= *(void *)(v63 + 16)) {
          goto LABEL_47;
        }
        id v17 = *(id *)(v16 + 8 * v0);
      }
      uint64_t v18 = v17;
      if (__OFADD__(v0++, 1)) {
        goto LABEL_48;
      }
      uint64_t v12 = (uint64_t)v17;
      uint64_t v20 = sub_100041490();
      uint64_t inited = *(void *)(v13 + 16);
      if (inited)
      {
        uint64_t v12 = v20;
        swift_bridgeObjectRetain();
        int v21 = (unsigned __int16)sub_100041570();
        if (v21 == (unsigned __int16)sub_100041570())
        {
LABEL_22:
          swift_bridgeObjectRelease();
          uint64_t v12 = (uint64_t)&v66;
          sub_100041B10();
          sub_100041B40();
          sub_100041B50();
          sub_100041B20();
          goto LABEL_15;
        }
        if (inited != 1)
        {
          uint64_t v22 = 17;
          while (1)
          {
            uint64_t v23 = v22 - 15;
            if (__OFADD__(v22 - 16, 1)) {
              break;
            }
            int v24 = (unsigned __int16)sub_100041570();
            if (v24 == (unsigned __int16)sub_100041570()) {
              goto LABEL_22;
            }
            ++v22;
            if (v23 == inited) {
              goto LABEL_13;
            }
          }
          __break(1u);
LABEL_47:
          __break(1u);
LABEL_48:
          __break(1u);
LABEL_49:
          if (v12 < 0) {
            unint64_t v0 = v12;
          }
          else {
            unint64_t v0 = v12 & 0xFFFFFFFFFFFFFF8;
          }
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          uint64_t v14 = sub_100041BA0();
          uint64_t v15 = *(void *)(v62 + 208);
          goto LABEL_11;
        }
LABEL_13:
        swift_bridgeObjectRelease();
      }

LABEL_15:
      if (v0 == v14)
      {
        uint64_t v65 = (uint64_t)v66;
        goto LABEL_32;
      }
    }
  }
  uint64_t v65 = (uint64_t)_swiftEmptyArrayStorage;
LABEL_32:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v25 = ((unint64_t)v65 >> 62) & 1;
  if (v65 < 0) {
    LODWORD(v25) = 1;
  }
  int v61 = v25;
  if (v25)
  {
    swift_bridgeObjectRetain_n();
    uint64_t v26 = sub_100041BA0();
    swift_release();
    if (!v26) {
      goto LABEL_54;
    }
  }
  else
  {
    uint64_t v26 = *(void *)(v65 + 16);
    swift_bridgeObjectRetain();
    if (!v26) {
      goto LABEL_54;
    }
  }
  if (v26 < 1)
  {
    __break(1u);
    goto LABEL_77;
  }
  for (uint64_t i = 0; i != v26; ++i)
  {
    if ((v65 & 0xC000000000000001) != 0) {
      id v28 = (id)sub_100041AE0();
    }
    else {
      id v28 = *(id *)(v65 + 8 * i + 32);
    }
    uint64_t v29 = v28;
    uint64_t v30 = sub_100041510();
    if ((v31 & 1) == 0)
    {
      uint64_t v32 = v30;
      sub_100016F7C(&qword_100069190);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_1000568E0;
      *(void *)(inited + 32) = 0x6D766C5F7369;
      *(void *)(inited + 40) = 0xE600000000000000;
      sub_10001FB24(0, &qword_100069198);
      sub_100041490();
      int v33 = (unsigned __int16)sub_100041570();
      Swift::Bool v34 = v33 == (unsigned __int16)sub_100041570();
      *(NSNumber *)(inited + 48) = sub_1000419A0(v34);
      *(void *)(inited + 56) = 0x6D76765F7369;
      *(void *)(inited + 64) = 0xE600000000000000;
      sub_100041490();
      int v35 = (unsigned __int16)sub_100041570();
      Swift::Bool v36 = v35 == (unsigned __int16)sub_100041570();
      *(NSNumber *)(inited + 72) = sub_1000419A0(v36);
      *(void *)(inited + 80) = 0x6E6F697461727564;
      *(void *)(inited + 88) = 0xE800000000000000;
      sub_100041500();
      *(void *)(inited + 96) = [objc_allocWithZone((Class)NSNumber) initWithDouble:round(v37)];
      *(void *)(inited + 104) = 0xD000000000000011;
      *(void *)(inited + 112) = 0x80000001000544F0;
      *(void *)(inited + 120) = [objc_allocWithZone((Class)NSNumber) initWithUnsignedLongLong:v32];
      unint64_t v38 = sub_10002A478(inited);
      sub_10002E8C0(v38);
      uint64_t v40 = v39;
      swift_bridgeObjectRelease();
      sub_10002A594(0xD00000000000002DLL, 0x8000000100054510, v40);
      swift_bridgeObjectRelease();
    }
  }
LABEL_54:
  swift_release();
  swift_bridgeObjectRetain_n();
  BOOL v41 = sub_1000416B0();
  os_log_type_t v42 = sub_100041940();
  unint64_t v10 = (uint8_t *)v42;
  if (os_log_type_enabled(v41, v42))
  {
    char v43 = (uint8_t *)swift_slowAlloc();
    unint64_t v66 = (void *)swift_slowAlloc();
    *(_DWORD *)char v43 = 136315138;
    LOBYTE(inited) = (_BYTE)v43 + 4;
    sub_100041540();
    swift_bridgeObjectRetain();
    uint64_t v44 = sub_100041800();
    unint64_t v46 = v45;
    swift_release();
    *uint64_t v60 = sub_10001F3FC(v44, v46, (uint64_t *)&v66);
    sub_1000419E0();
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl((void *)&_mh_execute_header, v41, (os_log_type_t)v10, "messageStoreDidAddMessages(filtered): %s", v43, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    if (v26) {
      goto LABEL_56;
    }
LABEL_59:
    swift_release();
    swift_release();
    unint64_t v0 = v62;
    goto LABEL_73;
  }

  swift_release_n();
  if (!v26) {
    goto LABEL_59;
  }
LABEL_56:
  if (v61)
  {
    swift_bridgeObjectRetain();
    unint64_t v0 = sub_100041BA0();
    swift_release();
  }
  else
  {
    unint64_t v0 = *(void *)(v65 + 16);
  }
  if (!v0)
  {
    swift_release();
    unint64_t v56 = (unint64_t)_swiftEmptyArrayStorage;
    goto LABEL_70;
  }
  unint64_t v66 = _swiftEmptyArrayStorage;
  uint64_t v3 = &v66;
  sub_100041B30();
  if ((v0 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_79;
  }
  uint64_t v47 = 0;
  do
  {
    if ((v65 & 0xC000000000000001) != 0) {
      id v48 = (id)sub_100041AE0();
    }
    else {
      id v48 = *(id *)(v65 + 8 * v47 + 32);
    }
    id v49 = v48;
    ++v47;
    type metadata accessor for FTMessage(0);
    uint64_t v50 = swift_allocObject();
    *(void *)(v50 + 24) = 0;
    *(unsigned char *)(v50 + 32) = 1;
    *(_WORD *)(v50 + 33) = 514;
    uint64_t v51 = v50 + OBJC_IVAR____TtC37VoicemailMessageNotificationExtension9FTMessage____lazy_storage___dataURL;
    uint64_t v52 = sub_100016F7C(&qword_1000687D8);
    id v53 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v52 - 8) + 56);
    v53(v51, 1, 1, v52);
    v53(v50 + OBJC_IVAR____TtC37VoicemailMessageNotificationExtension9FTMessage____lazy_storage___thumbnailURL, 1, 1, v52);
    v53(v50 + OBJC_IVAR____TtC37VoicemailMessageNotificationExtension9FTMessage____lazy_storage___transcriptURL, 1, 1, v52);
    uint64_t v54 = v50 + OBJC_IVAR____TtC37VoicemailMessageNotificationExtension9FTMessage____lazy_storage___transcriptData;
    uint64_t v55 = sub_100016F7C((uint64_t *)&unk_1000689D8);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v55 - 8) + 56))(v54, 1, 1, v55);
    *(void *)(v50 + OBJC_IVAR____TtC37VoicemailMessageNotificationExtension9FTMessage____lazy_storage___transcript) = 1;
    *(unsigned char *)(v50 + OBJC_IVAR____TtC37VoicemailMessageNotificationExtension9FTMessage_didLoadTranscript) = 0;
    *(unsigned char *)(v50 + OBJC_IVAR____TtC37VoicemailMessageNotificationExtension9FTMessage_isDirty) = 0;
    *(void *)(v50 + 16) = v49;
    sub_100041B10();
    sub_100041B40();
    sub_100041B50();
    sub_100041B20();
  }
  while (v0 != v47);
  unint64_t v56 = (unint64_t)v66;
  swift_release();
LABEL_70:
  unint64_t v0 = v62;
  if (v56 >> 62)
  {
LABEL_77:
    swift_bridgeObjectRetain();
    sub_100016F7C(&qword_1000687E0);
    unint64_t v57 = sub_100041B90();
    swift_bridgeObjectRelease();
    goto LABEL_72;
  }
  swift_bridgeObjectRetain();
  sub_100041C50();
  unint64_t v57 = v56;
LABEL_72:
  swift_bridgeObjectRelease();
  sub_10002D554(v57);
  swift_bridgeObjectRelease();
  swift_release();
LABEL_73:
  uint64_t v58 = *(uint64_t (**)(void))(v0 + 8);
  return v58();
}

void *sub_10002E6E8(unint64_t a1, unsigned int (**a2)(void, void))
{
  *(void *)(swift_allocObject() + 16) = a2;
  if (a1 >> 62)
  {
LABEL_16:
    _Block_copy(a2);
    uint64_t v4 = sub_100041BA0();
    if (v4) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    _Block_copy(a2);
    if (v4)
    {
LABEL_3:
      unint64_t v5 = 0;
      uint64_t v9 = v4;
      do
      {
        if ((a1 & 0xC000000000000001) != 0)
        {
          uint64_t v6 = sub_100041AE0();
          unint64_t v7 = v5 + 1;
          if (__OFADD__(v5, 1))
          {
LABEL_13:
            __break(1u);
            break;
          }
        }
        else
        {
          if (v5 >= *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            __break(1u);
            goto LABEL_16;
          }
          uint64_t v6 = *(void *)(a1 + 8 * v5 + 32);
          swift_unknownObjectRetain();
          unint64_t v7 = v5 + 1;
          if (__OFADD__(v5, 1)) {
            goto LABEL_13;
          }
        }
        if (a2[2](a2, v6))
        {
          sub_100041B10();
          sub_100041B40();
          sub_100041B50();
          sub_100041B20();
          uint64_t v4 = v9;
        }
        else
        {
          swift_unknownObjectRelease();
        }
        ++v5;
      }
      while (v7 != v4);
    }
  }
  swift_release();
  swift_bridgeObjectRelease();
  _Block_release(a2);
  return _swiftEmptyArrayStorage;
}

void sub_10002E8C0(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_100016F7C(&qword_1000691B0);
    id v2 = (void *)sub_100041BD0();
  }
  else
  {
    id v2 = &_swiftEmptyDictionarySingleton;
  }
  uint64_t v28 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v27 = (unint64_t)(63 - v3) >> 6;
  swift_bridgeObjectRetain();
  int64_t i = 0;
  if (v5) {
    goto LABEL_10;
  }
LABEL_11:
  int64_t v11 = i + 1;
  if (__OFADD__(i, 1)) {
    goto LABEL_35;
  }
  if (v11 >= v27) {
    goto LABEL_32;
  }
  unint64_t v12 = *(void *)(v28 + 8 * v11);
  int64_t v13 = i + 1;
  if (!v12)
  {
    int64_t v13 = i + 2;
    if (i + 2 >= v27) {
      goto LABEL_32;
    }
    unint64_t v12 = *(void *)(v28 + 8 * v13);
    if (!v12)
    {
      int64_t v13 = i + 3;
      if (i + 3 >= v27) {
        goto LABEL_32;
      }
      unint64_t v12 = *(void *)(v28 + 8 * v13);
      if (!v12)
      {
        int64_t v13 = i + 4;
        if (i + 4 >= v27) {
          goto LABEL_32;
        }
        unint64_t v12 = *(void *)(v28 + 8 * v13);
        if (!v12)
        {
          int64_t v14 = i + 5;
          if (i + 5 < v27)
          {
            unint64_t v12 = *(void *)(v28 + 8 * v14);
            if (v12)
            {
              int64_t v13 = i + 5;
              goto LABEL_26;
            }
            while (1)
            {
              int64_t v13 = v14 + 1;
              if (__OFADD__(v14, 1)) {
                goto LABEL_36;
              }
              if (v13 >= v27) {
                break;
              }
              unint64_t v12 = *(void *)(v28 + 8 * v13);
              ++v14;
              if (v12) {
                goto LABEL_26;
              }
            }
          }
LABEL_32:
          sub_10003812C();
          return;
        }
      }
    }
  }
LABEL_26:
  unint64_t v5 = (v12 - 1) & v12;
  unint64_t v10 = __clz(__rbit64(v12)) + (v13 << 6);
  for (i = v13; ; unint64_t v10 = v9 | (i << 6))
  {
    uint64_t v15 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v10);
    uint64_t v17 = *v15;
    uint64_t v16 = v15[1];
    uint64_t v18 = *(void **)(*(void *)(a1 + 56) + 8 * v10);
    swift_bridgeObjectRetain();
    id v19 = v18;
    unint64_t v20 = sub_100037250(v17, v16);
    unint64_t v21 = v20;
    if (v22)
    {
      unint64_t v7 = (uint64_t *)(v2[6] + 16 * v20);
      swift_bridgeObjectRelease();
      *unint64_t v7 = v17;
      v7[1] = v16;
      uint64_t v8 = v2[7];

      *(void *)(v8 + 8 * v21) = v19;
      if (!v5) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
    if (v2[2] >= v2[3]) {
      break;
    }
    *(void *)((char *)v2 + ((v20 >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << v20;
    uint64_t v23 = (uint64_t *)(v2[6] + 16 * v20);
    *uint64_t v23 = v17;
    v23[1] = v16;
    *(void *)(v2[7] + 8 * v20) = v19;
    uint64_t v24 = v2[2];
    BOOL v25 = __OFADD__(v24, 1);
    uint64_t v26 = v24 + 1;
    if (v25) {
      goto LABEL_34;
    }
    v2[2] = v26;
    if (!v5) {
      goto LABEL_11;
    }
LABEL_10:
    unint64_t v9 = __clz(__rbit64(v5));
    v5 &= v5 - 1;
  }
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
}

uint64_t sub_10002EB98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[7] = a2;
  v3[8] = a3;
  v3[6] = a1;
  type metadata accessor for VoicemailActor();
  swift_initStaticObject();
  sub_10003852C((unint64_t *)&qword_100068530, (void (*)(uint64_t))type metadata accessor for VoicemailActor);
  uint64_t v5 = sub_100041850();
  return _swift_task_switch(sub_10002EC64, v5, v4);
}

uint64_t sub_10002EC64()
{
  uint64_t v59 = v0;
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  swift_bridgeObjectRetain_n();
  id v2 = sub_1000416B0();
  uint64_t v53 = Strong;
  if (Strong)
  {
    os_log_type_t v3 = sub_100041940();
    uint64_t v52 = v0;
    uint64_t v51 = (uint64_t *)(v0 + 40);
    if (os_log_type_enabled(v2, v3))
    {
      logb = v2;
      uint64_t v4 = (uint8_t *)swift_slowAlloc();
      uint64_t v58 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v4 = 136315138;
      sub_100041540();
      swift_bridgeObjectRetain();
      uint64_t v5 = sub_100041800();
      unint64_t v7 = v6;
      swift_bridgeObjectRelease();
      *(void *)(v0 + 40) = sub_10001F3FC(v5, v7, (uint64_t *)&v58);
      sub_1000419E0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, logb, v3, "messageStoreDidUpdateMessages: %s", v4, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    unint64_t v13 = *(void *)(v0 + 64);
    uint64_t v14 = *(void *)(v53
                    + OBJC_IVAR____TtC37VoicemailMessageNotificationExtension24FaceTimeVoicemailManager_messageTypes);
    uint64_t v58 = _swiftEmptyArrayStorage;
    if (v13 >> 62) {
      goto LABEL_51;
    }
    uint64_t v15 = *(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v16 = v13;
LABEL_11:
    unint64_t v17 = (unint64_t)_swiftEmptyArrayStorage;
    uint64_t v54 = v15;
    if (v15)
    {
      unint64_t v18 = 0;
      os_log_t log = (os_log_t)(v13 & 0xC000000000000001);
      uint64_t v19 = v13 & 0xFFFFFFFFFFFFFF8;
      unint64_t v20 = v16 + 32;
      uint64_t v0 = v15;
      while (1)
      {
        while (1)
        {
          if (log)
          {
            id v21 = (id)sub_100041AE0();
          }
          else
          {
            if (v18 >= *(void *)(v19 + 16)) {
              goto LABEL_49;
            }
            id v21 = *(id *)(v20 + 8 * v18);
          }
          char v22 = v21;
          if (__OFADD__(v18++, 1)) {
            goto LABEL_50;
          }
          unint64_t v13 = (unint64_t)v21;
          uint64_t v24 = sub_100041490();
          uint64_t v25 = *(void *)(v14 + 16);
          if (v25) {
            break;
          }

          if (v18 == v0) {
            goto LABEL_30;
          }
        }
        unint64_t v13 = v24;
        swift_bridgeObjectRetain();
        int v26 = (unsigned __int16)sub_100041570();
        if (v26 == (unsigned __int16)sub_100041570())
        {
LABEL_20:
          swift_bridgeObjectRelease();
          sub_100041B10();
          sub_100041B40();
          sub_100041B50();
          unint64_t v13 = (unint64_t)&v58;
          sub_100041B20();
        }
        else
        {
          if (v25 != 1)
          {
            uint64_t v0 = 17;
            while (1)
            {
              uint64_t v27 = v0 - 15;
              if (__OFADD__(v0 - 16, 1)) {
                break;
              }
              int v28 = (unsigned __int16)sub_100041570();
              if (v28 == (unsigned __int16)sub_100041570()) {
                goto LABEL_20;
              }
              ++v0;
              if (v27 == v25) {
                goto LABEL_26;
              }
            }
            __break(1u);
LABEL_49:
            __break(1u);
LABEL_50:
            __break(1u);
LABEL_51:
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            uint64_t v15 = sub_100041BA0();
            unint64_t v16 = *(void *)(v0 + 64);
            goto LABEL_11;
          }
LABEL_26:
          swift_bridgeObjectRelease();
        }
        uint64_t v0 = v54;
        if (v18 == v54)
        {
LABEL_30:
          unint64_t v17 = (unint64_t)v58;
          uint64_t v0 = v52;
          break;
        }
      }
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain_n();
    uint64_t v29 = sub_1000416B0();
    os_log_type_t v30 = sub_100041940();
    if (os_log_type_enabled(v29, v30))
    {
      char v31 = (uint8_t *)swift_slowAlloc();
      uint64_t v58 = (void *)swift_slowAlloc();
      *(_DWORD *)char v31 = 136315138;
      sub_100041540();
      swift_bridgeObjectRetain();
      uint64_t v32 = sub_100041800();
      unint64_t v34 = v33;
      swift_release();
      uint64_t *v51 = sub_10001F3FC(v32, v34, (uint64_t *)&v58);
      sub_1000419E0();
      uint64_t v0 = v52;
      swift_bridgeObjectRelease();
      swift_release_n();
      _os_log_impl((void *)&_mh_execute_header, v29, v30, "messageStoreDidUpdateMessages(filtered): %s", v31, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_release_n();
    }
    if ((v17 & 0x8000000000000000) != 0 || (v17 & 0x4000000000000000) != 0)
    {
      swift_bridgeObjectRetain();
      uint64_t v48 = sub_100041BA0();
      swift_release();
      if (v48)
      {
        swift_bridgeObjectRetain();
        uint64_t v35 = sub_100041BA0();
        swift_release();
        if (!v35)
        {
          swift_release();
          unint64_t v46 = (unint64_t)_swiftEmptyArrayStorage;
          if (!((unint64_t)_swiftEmptyArrayStorage >> 62))
          {
LABEL_44:
            swift_bridgeObjectRetain();
            sub_100041C50();
            unint64_t v47 = v46;
LABEL_45:
            swift_bridgeObjectRelease();
            sub_10002F58C(v47);
            swift_bridgeObjectRelease();
LABEL_57:
            swift_release();
            goto LABEL_58;
          }
LABEL_63:
          swift_bridgeObjectRetain();
          sub_100016F7C(&qword_1000687E0);
          unint64_t v47 = sub_100041B90();
          swift_bridgeObjectRelease();
          goto LABEL_45;
        }
        uint64_t v58 = _swiftEmptyArrayStorage;
        sub_100041B30();
        if ((v35 & 0x8000000000000000) == 0)
        {
LABEL_38:
          uint64_t v36 = 0;
          os_log_t loga = (os_log_t)(v17 & 0xC000000000000001);
          double v37 = (void *)v17;
          do
          {
            if (loga) {
              id v38 = (id)sub_100041AE0();
            }
            else {
              id v38 = *(id *)(v17 + 8 * v36 + 32);
            }
            id v39 = v38;
            ++v36;
            type metadata accessor for FTMessage(0);
            uint64_t v40 = swift_allocObject();
            *(void *)(v40 + 24) = 0;
            *(unsigned char *)(v40 + 32) = 1;
            *(_WORD *)(v40 + 33) = 514;
            uint64_t v41 = v40 + OBJC_IVAR____TtC37VoicemailMessageNotificationExtension9FTMessage____lazy_storage___dataURL;
            uint64_t v42 = sub_100016F7C(&qword_1000687D8);
            char v43 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v42 - 8) + 56);
            v43(v41, 1, 1, v42);
            v43(v40 + OBJC_IVAR____TtC37VoicemailMessageNotificationExtension9FTMessage____lazy_storage___thumbnailURL, 1, 1, v42);
            v43(v40 + OBJC_IVAR____TtC37VoicemailMessageNotificationExtension9FTMessage____lazy_storage___transcriptURL, 1, 1, v42);
            uint64_t v44 = v40
                + OBJC_IVAR____TtC37VoicemailMessageNotificationExtension9FTMessage____lazy_storage___transcriptData;
            uint64_t v45 = sub_100016F7C((uint64_t *)&unk_1000689D8);
            (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v45 - 8) + 56))(v44, 1, 1, v45);
            *(void *)(v40
                      + OBJC_IVAR____TtC37VoicemailMessageNotificationExtension9FTMessage____lazy_storage___transcript) = 1;
            *(unsigned char *)(v40 + OBJC_IVAR____TtC37VoicemailMessageNotificationExtension9FTMessage_didLoadTranscript) = 0;
            *(unsigned char *)(v40 + OBJC_IVAR____TtC37VoicemailMessageNotificationExtension9FTMessage_isDirty) = 0;
            *(void *)(v40 + 16) = v39;
            sub_100041B10();
            sub_100041B40();
            sub_100041B50();
            sub_100041B20();
            unint64_t v17 = (unint64_t)v37;
          }
          while (v35 != v36);
          unint64_t v46 = (unint64_t)v58;
          swift_release();
          uint64_t v0 = v52;
          if (!(v46 >> 62)) {
            goto LABEL_44;
          }
          goto LABEL_63;
        }
        __break(1u);
      }
    }
    else
    {
      uint64_t v35 = *(void *)(v17 + 16);
      if (v35)
      {
        uint64_t v58 = _swiftEmptyArrayStorage;
        sub_100041B30();
        goto LABEL_38;
      }
    }
    swift_release();
    goto LABEL_57;
  }
  uint64_t v8 = sub_100041920();
  BOOL v9 = os_log_type_enabled(v2, (os_log_type_t)v8);
  unint64_t v10 = *(void *)(v0 + 64);
  if (v9)
  {
    int64_t v11 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)int64_t v11 = 134217984;
    if (v10 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v12 = sub_100041BA0();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v12 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    *(void *)(v0 + 40) = v12;
    sub_1000419E0();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v2, (os_log_type_t)v8, "ignoring %ld updated messages, no more self", v11, 0xCu);
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

LABEL_58:
  id v49 = *(uint64_t (**)(void))(v0 + 8);
  return v49();
}

uint64_t sub_10002F58C(unint64_t a1)
{
  sub_100023C28(a1, &v3);
  return sub_10002AE08(a1, 2);
}

uint64_t sub_10002F794(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[7] = a2;
  v3[8] = a3;
  v3[6] = a1;
  type metadata accessor for VoicemailActor();
  swift_initStaticObject();
  sub_10003852C((unint64_t *)&qword_100068530, (void (*)(uint64_t))type metadata accessor for VoicemailActor);
  uint64_t v5 = sub_100041850();
  return _swift_task_switch(sub_10002F860, v5, v4);
}

uint64_t sub_10002F860()
{
  uint64_t v59 = v0;
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  swift_bridgeObjectRetain_n();
  id v2 = sub_1000416B0();
  uint64_t v53 = Strong;
  if (Strong)
  {
    os_log_type_t v3 = sub_100041940();
    uint64_t v52 = v0;
    uint64_t v51 = (uint64_t *)(v0 + 40);
    if (os_log_type_enabled(v2, v3))
    {
      logb = v2;
      uint64_t v4 = (uint8_t *)swift_slowAlloc();
      uint64_t v58 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v4 = 136315138;
      sub_100041540();
      swift_bridgeObjectRetain();
      uint64_t v5 = sub_100041800();
      unint64_t v7 = v6;
      swift_bridgeObjectRelease();
      *(void *)(v0 + 40) = sub_10001F3FC(v5, v7, (uint64_t *)&v58);
      sub_1000419E0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, logb, v3, "messageStoreDidMoveToTrashMessages: %s", v4, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    unint64_t v13 = *(void *)(v0 + 64);
    uint64_t v14 = *(void *)(v53
                    + OBJC_IVAR____TtC37VoicemailMessageNotificationExtension24FaceTimeVoicemailManager_messageTypes);
    uint64_t v58 = _swiftEmptyArrayStorage;
    if (v13 >> 62) {
      goto LABEL_51;
    }
    uint64_t v15 = *(void *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v16 = v13;
LABEL_11:
    unint64_t v17 = (unint64_t)_swiftEmptyArrayStorage;
    uint64_t v54 = v15;
    if (v15)
    {
      unint64_t v18 = 0;
      os_log_t log = (os_log_t)(v13 & 0xC000000000000001);
      uint64_t v19 = v13 & 0xFFFFFFFFFFFFFF8;
      unint64_t v20 = v16 + 32;
      uint64_t v0 = v15;
      while (1)
      {
        while (1)
        {
          if (log)
          {
            id v21 = (id)sub_100041AE0();
          }
          else
          {
            if (v18 >= *(void *)(v19 + 16)) {
              goto LABEL_49;
            }
            id v21 = *(id *)(v20 + 8 * v18);
          }
          char v22 = v21;
          if (__OFADD__(v18++, 1)) {
            goto LABEL_50;
          }
          unint64_t v13 = (unint64_t)v21;
          uint64_t v24 = sub_100041490();
          uint64_t v25 = *(void *)(v14 + 16);
          if (v25) {
            break;
          }

          if (v18 == v0) {
            goto LABEL_30;
          }
        }
        unint64_t v13 = v24;
        swift_bridgeObjectRetain();
        int v26 = (unsigned __int16)sub_100041570();
        if (v26 == (unsigned __int16)sub_100041570())
        {
LABEL_20:
          swift_bridgeObjectRelease();
          sub_100041B10();
          sub_100041B40();
          sub_100041B50();
          unint64_t v13 = (unint64_t)&v58;
          sub_100041B20();
        }
        else
        {
          if (v25 != 1)
          {
            uint64_t v0 = 17;
            while (1)
            {
              uint64_t v27 = v0 - 15;
              if (__OFADD__(v0 - 16, 1)) {
                break;
              }
              int v28 = (unsigned __int16)sub_100041570();
              if (v28 == (unsigned __int16)sub_100041570()) {
                goto LABEL_20;
              }
              ++v0;
              if (v27 == v25) {
                goto LABEL_26;
              }
            }
            __break(1u);
LABEL_49:
            __break(1u);
LABEL_50:
            __break(1u);
LABEL_51:
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            uint64_t v15 = sub_100041BA0();
            unint64_t v16 = *(void *)(v0 + 64);
            goto LABEL_11;
          }
LABEL_26:
          swift_bridgeObjectRelease();
        }
        uint64_t v0 = v54;
        if (v18 == v54)
        {
LABEL_30:
          unint64_t v17 = (unint64_t)v58;
          uint64_t v0 = v52;
          break;
        }
      }
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain_n();
    uint64_t v29 = sub_1000416B0();
    os_log_type_t v30 = sub_100041940();
    if (os_log_type_enabled(v29, v30))
    {
      char v31 = (uint8_t *)swift_slowAlloc();
      uint64_t v58 = (void *)swift_slowAlloc();
      *(_DWORD *)char v31 = 136315138;
      sub_100041540();
      swift_bridgeObjectRetain();
      uint64_t v32 = sub_100041800();
      unint64_t v34 = v33;
      swift_release();
      uint64_t *v51 = sub_10001F3FC(v32, v34, (uint64_t *)&v58);
      sub_1000419E0();
      uint64_t v0 = v52;
      swift_bridgeObjectRelease();
      swift_release_n();
      _os_log_impl((void *)&_mh_execute_header, v29, v30, "messageStoreDidMoveToTrashMessages(filtered): %s", v31, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_release_n();
    }
    if ((v17 & 0x8000000000000000) != 0 || (v17 & 0x4000000000000000) != 0)
    {
      swift_bridgeObjectRetain();
      uint64_t v48 = sub_100041BA0();
      swift_release();
      if (v48)
      {
        swift_bridgeObjectRetain();
        uint64_t v35 = sub_100041BA0();
        swift_release();
        if (!v35)
        {
          swift_release();
          unint64_t v46 = (unint64_t)_swiftEmptyArrayStorage;
          if (!((unint64_t)_swiftEmptyArrayStorage >> 62))
          {
LABEL_44:
            swift_bridgeObjectRetain();
            sub_100041C50();
            unint64_t v47 = v46;
LABEL_45:
            swift_bridgeObjectRelease();
            sub_10002F58C(v47);
            swift_bridgeObjectRelease();
LABEL_57:
            swift_release();
            goto LABEL_58;
          }
LABEL_63:
          swift_bridgeObjectRetain();
          sub_100016F7C(&qword_1000687E0);
          unint64_t v47 = sub_100041B90();
          swift_bridgeObjectRelease();
          goto LABEL_45;
        }
        uint64_t v58 = _swiftEmptyArrayStorage;
        sub_100041B30();
        if ((v35 & 0x8000000000000000) == 0)
        {
LABEL_38:
          uint64_t v36 = 0;
          os_log_t loga = (os_log_t)(v17 & 0xC000000000000001);
          double v37 = (void *)v17;
          do
          {
            if (loga) {
              id v38 = (id)sub_100041AE0();
            }
            else {
              id v38 = *(id *)(v17 + 8 * v36 + 32);
            }
            id v39 = v38;
            ++v36;
            type metadata accessor for FTMessage(0);
            uint64_t v40 = swift_allocObject();
            *(void *)(v40 + 24) = 0;
            *(unsigned char *)(v40 + 32) = 1;
            *(_WORD *)(v40 + 33) = 514;
            uint64_t v41 = v40 + OBJC_IVAR____TtC37VoicemailMessageNotificationExtension9FTMessage____lazy_storage___dataURL;
            uint64_t v42 = sub_100016F7C(&qword_1000687D8);
            char v43 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v42 - 8) + 56);
            v43(v41, 1, 1, v42);
            v43(v40 + OBJC_IVAR____TtC37VoicemailMessageNotificationExtension9FTMessage____lazy_storage___thumbnailURL, 1, 1, v42);
            v43(v40 + OBJC_IVAR____TtC37VoicemailMessageNotificationExtension9FTMessage____lazy_storage___transcriptURL, 1, 1, v42);
            uint64_t v44 = v40
                + OBJC_IVAR____TtC37VoicemailMessageNotificationExtension9FTMessage____lazy_storage___transcriptData;
            uint64_t v45 = sub_100016F7C((uint64_t *)&unk_1000689D8);
            (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v45 - 8) + 56))(v44, 1, 1, v45);
            *(void *)(v40
                      + OBJC_IVAR____TtC37VoicemailMessageNotificationExtension9FTMessage____lazy_storage___transcript) = 1;
            *(unsigned char *)(v40 + OBJC_IVAR____TtC37VoicemailMessageNotificationExtension9FTMessage_didLoadTranscript) = 0;
            *(unsigned char *)(v40 + OBJC_IVAR____TtC37VoicemailMessageNotificationExtension9FTMessage_isDirty) = 0;
            *(void *)(v40 + 16) = v39;
            sub_100041B10();
            sub_100041B40();
            sub_100041B50();
            sub_100041B20();
            unint64_t v17 = (unint64_t)v37;
          }
          while (v35 != v36);
          unint64_t v46 = (unint64_t)v58;
          swift_release();
          uint64_t v0 = v52;
          if (!(v46 >> 62)) {
            goto LABEL_44;
          }
          goto LABEL_63;
        }
        __break(1u);
      }
    }
    else
    {
      uint64_t v35 = *(void *)(v17 + 16);
      if (v35)
      {
        uint64_t v58 = _swiftEmptyArrayStorage;
        sub_100041B30();
        goto LABEL_38;
      }
    }
    swift_release();
    goto LABEL_57;
  }
  uint64_t v8 = sub_100041920();
  BOOL v9 = os_log_type_enabled(v2, (os_log_type_t)v8);
  unint64_t v10 = *(void *)(v0 + 64);
  if (v9)
  {
    int64_t v11 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)int64_t v11 = 134217984;
    if (v10 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v12 = sub_100041BA0();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v12 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    *(void *)(v0 + 40) = v12;
    sub_1000419E0();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v2, (os_log_type_t)v8, "ignoring %ld deleted messages, no more self", v11, 0xCu);
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

LABEL_58:
  id v49 = *(uint64_t (**)(void))(v0 + 8);
  return v49();
}

uint64_t sub_1000301BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[10] = a2;
  v3[11] = a3;
  v3[9] = a1;
  uint64_t v4 = sub_100041340();
  v3[12] = v4;
  v3[13] = *(void *)(v4 - 8);
  v3[14] = swift_task_alloc();
  v3[15] = swift_task_alloc();
  type metadata accessor for VoicemailActor();
  swift_initStaticObject();
  sub_10003852C((unint64_t *)&qword_100068530, (void (*)(uint64_t))type metadata accessor for VoicemailActor);
  uint64_t v6 = sub_100041850();
  return _swift_task_switch(sub_1000302F4, v6, v5);
}

uint64_t sub_1000302F4()
{
  unint64_t v33 = v0;
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  swift_bridgeObjectRetain();
  if (Strong)
  {
    swift_bridgeObjectRetain();
    id v2 = sub_1000416B0();
    os_log_type_t v3 = sub_100041940();
    char v31 = v0;
    if (os_log_type_enabled(v2, v3))
    {
      uint64_t v4 = (uint8_t *)swift_slowAlloc();
      uint64_t v32 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v4 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v5 = sub_100041800();
      unint64_t v7 = v6;
      swift_bridgeObjectRelease();
      v0[8] = sub_10001F3FC(v5, v7, (uint64_t *)&v32);
      sub_1000419E0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v2, v3, "messageStoreDidDeleteMessagesWithUUIDs: %s", v4, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    uint64_t v13 = v0[11];
    uint64_t v14 = *(void *)(v13 + 16);
    uint64_t v15 = _swiftEmptyArrayStorage;
    if (v14)
    {
      os_log_type_t v30 = (objc_super *)(v0 + 5);
      uint64_t v16 = v0[13];
      uint64_t v32 = _swiftEmptyArrayStorage;
      sub_100041B30();
      unint64_t v17 = *(void (**)(char *, uint64_t, uint64_t))(v16 + 16);
      v16 += 16;
      uint64_t v18 = v13 + ((*(unsigned __int8 *)(v16 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 64));
      uint64_t v28 = *(void *)(v16 + 56);
      uint64_t v29 = v17;
      uint64_t v27 = (void (**)(char *, uint64_t))(v16 - 8);
      do
      {
        uint64_t v19 = (char *)v0[14];
        unint64_t v20 = (char *)v0[15];
        uint64_t v21 = v0[12];
        v29(v20, v18, v21);
        v29(v19, (uint64_t)v20, v21);
        char v22 = (objc_class *)type metadata accessor for MessageID(0);
        uint64_t v23 = (char *)objc_allocWithZone(v22);
        v29(&v23[OBJC_IVAR___MPMessageID_value], (uint64_t)v19, v21);
        type metadata accessor for MessageID.Value(0);
        uint64_t v0 = v31;
        swift_storeEnumTagMultiPayload();
        v31[5] = v23;
        v31[6] = v22;
        [(objc_super *)v30 init];
        uint64_t v24 = *v27;
        (*v27)(v19, v21);
        v24(v20, v21);
        sub_100041B10();
        sub_100041B40();
        sub_100041B50();
        sub_100041B20();
        v18 += v28;
        --v14;
      }
      while (v14);
      uint64_t v15 = v32;
    }
    sub_100030764((unint64_t)v15);
    swift_bridgeObjectRelease();
    swift_release();
  }
  else
  {
    uint64_t v8 = sub_1000416B0();
    uint64_t v9 = sub_100041920();
    BOOL v10 = os_log_type_enabled(v8, (os_log_type_t)v9);
    uint64_t v11 = v0[11];
    if (v10)
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v12 = 134217984;
      v0[7] = *(void *)(v11 + 16);
      sub_1000419E0();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v8, (os_log_type_t)v9, "ignoring %ld deleted messageUUIDs, no more self", v12, 0xCu);
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease();
    }
  }
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v25 = (uint64_t (*)(void))v0[1];
  return v25();
}

uint64_t sub_100030764(unint64_t a1)
{
  unint64_t v1 = sub_100023990(a1, &v11);
  swift_bridgeObjectRetain_n();
  id v2 = sub_1000416B0();
  os_log_type_t v3 = sub_100041940();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 136315138;
    type metadata accessor for MessageID(0);
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_100041800();
    unint64_t v7 = v6;
    swift_bridgeObjectRelease();
    sub_10001F3FC(v5, v7, &v10);
    sub_1000419E0();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "FaceTimeVoicemailManager did remove: %s", v4, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_100041BA0();
    swift_bridgeObjectRelease();
    if (!v9) {
      return swift_bridgeObjectRelease();
    }
    goto LABEL_6;
  }
  if (*(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
LABEL_6:
  }
    sub_10002AE08(v1, 0);
  return swift_bridgeObjectRelease();
}

uint64_t sub_100030B54(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void), uint64_t a5, uint64_t a6)
{
  v17[1] = a6;
  uint64_t v8 = sub_1000416D0();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  __chkstk_darwin(v8);
  a4(0);
  uint64_t v11 = sub_1000417F0();
  uint64_t v12 = a1 + OBJC_IVAR____TtC37VoicemailMessageNotificationExtension24FaceTimeVoicemailManager_logger;
  uint64_t v13 = swift_allocObject();
  swift_weakInit();
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v12, v8);
  unint64_t v14 = (*(unsigned __int8 *)(v9 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v13;
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v15 + v14, (char *)v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
  *(void *)(v15 + ((v10 + v14 + 7) & 0xFFFFFFFFFFFFFFF8)) = v11;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  sub_100041350();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_100030D3C(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 40) = a1;
  *(void *)(v2 + 48) = a2;
  type metadata accessor for VoicemailActor();
  swift_initStaticObject();
  sub_10003852C((unint64_t *)&qword_100068530, (void (*)(uint64_t))type metadata accessor for VoicemailActor);
  uint64_t v4 = sub_100041850();
  return _swift_task_switch(sub_100030E04, v4, v3);
}

uint64_t sub_100030E04()
{
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    *(void *)(Strong + 16) = 0x8000000000000000;
    swift_release();
    uint64_t v2 = sub_1000416B0();
    os_log_type_t v3 = sub_100041940();
    if (os_log_type_enabled(v2, v3))
    {
      uint64_t v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, v3, "messageStoreDidReconnect(), triggering onVoicemailsChanged().", v4, 2u);
      swift_slowDealloc();
    }

    sub_10002AE08(0, 3);
    swift_release();
  }
  else
  {
    uint64_t v5 = sub_1000416B0();
    os_log_type_t v6 = sub_100041920();
    if (os_log_type_enabled(v5, v6))
    {
      unint64_t v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "ignoring messageStoreDidReconnect(), no more self", v7, 2u);
      swift_slowDealloc();
    }
  }
  uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
  return v8();
}

uint64_t sub_100030FBC(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 40) = a1;
  *(void *)(v2 + 48) = a2;
  type metadata accessor for VoicemailActor();
  swift_initStaticObject();
  sub_10003852C((unint64_t *)&qword_100068530, (void (*)(uint64_t))type metadata accessor for VoicemailActor);
  uint64_t v4 = sub_100041850();
  return _swift_task_switch(sub_100031084, v4, v3);
}

uint64_t sub_100031084()
{
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    *(void *)(Strong + 16) = 0x8000000000000000;
    swift_release();
    uint64_t v2 = sub_1000416B0();
    os_log_type_t v3 = sub_100041940();
    if (os_log_type_enabled(v2, v3))
    {
      uint64_t v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, v3, "messageStoreRequiresRefetch(), triggering onVoicemailsChanged().", v4, 2u);
      swift_slowDealloc();
    }

    sub_10002AE08(0, 3);
    swift_release();
  }
  else
  {
    uint64_t v5 = sub_1000416B0();
    os_log_type_t v6 = sub_100041920();
    if (os_log_type_enabled(v5, v6))
    {
      unint64_t v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "ignoring messageStoreRequiresRefetch(), no more self", v7, 2u);
      swift_slowDealloc();
    }
  }
  uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
  return v8();
}

uint64_t sub_10003123C(uint64_t a1)
{
  uint64_t v2 = sub_1000416D0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  __chkstk_darwin(v2);
  uint64_t v5 = a1 + OBJC_IVAR____TtC37VoicemailMessageNotificationExtension24FaceTimeVoicemailManager_logger;
  uint64_t v6 = swift_allocObject();
  swift_weakInit();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v5, v2);
  unint64_t v7 = (*(unsigned __int8 *)(v3 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v6;
  (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v8 + v7, (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v2);
  swift_retain();
  swift_retain();
  sub_100041350();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

void *sub_1000313DC(unint64_t a1)
{
  uint64_t result = sub_10003A2F4(a1);
  if (!result)
  {
    swift_bridgeObjectRetain_n();
    uint64_t v2 = sub_1000416B0();
    os_log_type_t v3 = sub_100041920();
    if (os_log_type_enabled(v2, v3))
    {
      uint64_t v4 = (uint8_t *)swift_slowAlloc();
      uint64_t v5 = swift_slowAlloc();
      *(_DWORD *)uint64_t v4 = 136446210;
      sub_10001F3FC(0x654D3C7961727241, 0xEE003E6567617373, &v5);
      sub_1000419E0();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v2, v3, "FaceTimeVoicemailManager received the incorrect type %{public}s when it expected a FTMessage", v4, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    return _swiftEmptyArrayStorage;
  }
  return result;
}

uint64_t sub_1000315BC(uint64_t a1)
{
  void v2[5] = a1;
  v2[6] = v1;
  uint64_t v3 = sub_100041650();
  v2[7] = v3;
  v2[8] = *(void *)(v3 - 8);
  v2[9] = swift_task_alloc();
  type metadata accessor for VoicemailActor();
  swift_initStaticObject();
  sub_10003852C((unint64_t *)&qword_100068530, (void (*)(uint64_t))type metadata accessor for VoicemailActor);
  uint64_t v5 = sub_100041850();
  v2[10] = v5;
  v2[11] = v4;
  return _swift_task_switch(sub_1000316E0, v5, v4);
}

uint64_t sub_1000316E0()
{
  unint64_t v1 = (unint64_t)sub_1000313DC(v0[5]);
  v0[12] = v1;
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_100041BA0();
    swift_bridgeObjectRelease();
    v0[13] = v3;
    if (v3) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    v0[13] = v2;
    if (v2)
    {
LABEL_3:
      return _swift_task_switch(sub_1000317D8, 0, 0);
    }
  }
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_1000317D8()
{
  sub_100041870();
  *(void *)(v0 + 112) = sub_100041860();
  uint64_t v2 = sub_100041850();
  return _swift_task_switch(sub_10003186C, v2, v1);
}

uint64_t sub_10003186C()
{
  uint64_t v1 = v0[13];
  uint64_t v2 = swift_release();
  if (v1 < 1)
  {
    __break(1u);
  }
  else
  {
    unint64_t v5 = v0[12] & 0xC000000000000001;
    swift_bridgeObjectRetain();
    uint64_t v6 = 0;
    do
    {
      if (v5) {
        uint64_t v7 = sub_100041AE0();
      }
      else {
        uint64_t v7 = swift_retain();
      }
      uint64_t v8 = v0[13];
      ++v6;
      *(unsigned char *)(v7 + OBJC_IVAR____TtC37VoicemailMessageNotificationExtension9FTMessage_isDirty) = 1;
      *(unsigned char *)(v7 + 34) = 1;
      swift_release();
    }
    while (v6 != v8);
    swift_bridgeObjectRelease();
    uint64_t v3 = v0[10];
    uint64_t v4 = v0[11];
    uint64_t v2 = (uint64_t)sub_100031950;
  }
  return _swift_task_switch(v2, v3, v4);
}

uint64_t sub_100031950()
{
  uint64_t v2 = v0[8];
  uint64_t v1 = (uint64_t *)v0[9];
  uint64_t v4 = v0[6];
  uint64_t v3 = v0[7];
  uint64_t v5 = sub_10002A124(v0[12]);
  v0[15] = v5;
  swift_bridgeObjectRelease();
  sub_1000366C0((void *)(v4+ OBJC_IVAR____TtC37VoicemailMessageNotificationExtension24FaceTimeVoicemailManager_messageStoreController), *(void *)(v4+ OBJC_IVAR____TtC37VoicemailMessageNotificationExtension24FaceTimeVoicemailManager_messageStoreController+ 24));
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  uint64_t *v1 = v6;
  (*(void (**)(uint64_t *, void, uint64_t))(v2 + 104))(v1, enum case for MessageStoreQuery.recordUUID(_:), v3);
  swift_bridgeObjectRetain();
  uint64_t v7 = (void *)swift_task_alloc();
  v0[16] = v7;
  *uint64_t v7 = v0;
  v7[1] = sub_100031A94;
  uint64_t v8 = v0[9];
  return MessageStoreController.deleteMessages(query:)(v8);
}

uint64_t sub_100031A94()
{
  uint64_t v2 = (void *)*v1;
  v2[17] = v0;
  swift_task_dealloc();
  if (v0)
  {
    (*(void (**)(void, void))(v2[8] + 8))(v2[9], v2[7]);
    uint64_t v3 = v2[10];
    uint64_t v4 = v2[11];
    return _swift_task_switch(sub_100031C08, v3, v4);
  }
  else
  {
    (*(void (**)(void, void))(v2[8] + 8))(v2[9], v2[7]);
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    uint64_t v5 = (uint64_t (*)(void))v2[1];
    return v5();
  }
}

uint64_t sub_100031C08()
{
  uint64_t v12 = v0;
  swift_errorRetain();
  swift_bridgeObjectRetain();
  swift_errorRetain();
  uint64_t v1 = sub_1000416B0();
  os_log_type_t v2 = sub_100041920();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = swift_slowAlloc();
    uint64_t v4 = (void *)swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 136315394;
    sub_100041340();
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_100041800();
    unint64_t v7 = v6;
    swift_bridgeObjectRelease();
    v0[3] = sub_10001F3FC(v5, v7, &v11);
    sub_1000419E0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v3 + 12) = 2112;
    swift_errorRetain();
    uint64_t v8 = _swift_stdlib_bridgeErrorToNSError();
    v0[4] = v8;
    sub_1000419E0();
    *uint64_t v4 = v8;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "FaceTimeVoicemailManager failed to delete messages with recordUUIDs %s with error: %@", (uint8_t *)v3, 0x16u);
    sub_100016F7C(&qword_100068AD0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
    swift_errorRelease();
  }
  else
  {
    swift_errorRelease();

    swift_bridgeObjectRelease_n();
    swift_errorRelease();
    swift_errorRelease();
  }
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t sub_100032024(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  type metadata accessor for VoicemailActor();
  swift_initStaticObject();
  sub_10003852C((unint64_t *)&qword_100068530, (void (*)(uint64_t))type metadata accessor for VoicemailActor);
  uint64_t v5 = sub_100041850();
  return _swift_task_switch(sub_1000320F0, v5, v4);
}

uint64_t sub_1000320F0()
{
  *(void *)(v0 + 40) = _Block_copy(*(const void **)(v0 + 24));
  sub_100016F7C(&qword_1000687E0);
  uint64_t v1 = sub_1000417F0();
  *(void *)(v0 + 48) = v1;
  swift_retain();
  os_log_type_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v2;
  *os_log_type_t v2 = v0;
  v2[1] = sub_100038880;
  return sub_1000315BC(v1);
}

uint64_t sub_1000321C8(uint64_t a1)
{
  v2[4] = a1;
  void v2[5] = v1;
  sub_100016F7C(&qword_1000687D8);
  v2[6] = swift_task_alloc();
  sub_100016F7C(&qword_1000688F8);
  v2[7] = swift_task_alloc();
  v2[8] = swift_task_alloc();
  uint64_t v3 = sub_100041340();
  v2[9] = v3;
  v2[10] = *(void *)(v3 - 8);
  v2[11] = swift_task_alloc();
  type metadata accessor for VoicemailActor();
  swift_initStaticObject();
  sub_10003852C((unint64_t *)&qword_100068530, (void (*)(uint64_t))type metadata accessor for VoicemailActor);
  uint64_t v5 = sub_100041850();
  v2[12] = v5;
  v2[13] = v4;
  return _swift_task_switch(sub_10003235C, v5, v4);
}

uint64_t sub_10003235C()
{
  unint64_t v1 = (unint64_t)sub_1000313DC(v0[4]);
  v0[14] = v1;
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_100041BA0();
    swift_bridgeObjectRelease();
    v0[15] = v3;
    if (v3) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    v0[15] = v2;
    if (v2)
    {
LABEL_3:
      return _swift_task_switch(sub_100032480, 0, 0);
    }
  }
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_100032480()
{
  sub_100041870();
  *(void *)(v0 + 128) = sub_100041860();
  uint64_t v2 = sub_100041850();
  return _swift_task_switch(sub_100032514, v2, v1);
}

uint64_t sub_100032514()
{
  uint64_t v1 = v0[15];
  uint64_t v2 = swift_release();
  if (v1 < 1)
  {
    __break(1u);
  }
  else
  {
    unint64_t v5 = v0[14] & 0xC000000000000001;
    swift_bridgeObjectRetain();
    uint64_t v6 = 0;
    do
    {
      if (v5) {
        uint64_t v7 = sub_100041AE0();
      }
      else {
        uint64_t v7 = swift_retain();
      }
      uint64_t v8 = v0[15];
      ++v6;
      *(unsigned char *)(v7 + OBJC_IVAR____TtC37VoicemailMessageNotificationExtension9FTMessage_isDirty) = 1;
      *(unsigned char *)(v7 + 33) = 1;
      swift_release();
    }
    while (v6 != v8);
    swift_bridgeObjectRelease();
    uint64_t v3 = v0[12];
    uint64_t v4 = v0[13];
    uint64_t v2 = (uint64_t)sub_1000325F8;
  }
  return _swift_task_switch(v2, v3, v4);
}

uint64_t sub_1000325F8()
{
  unint64_t v1 = v0[14];
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_100041BA0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (v2)
  {
    uint64_t v3 = (void *)sub_100041B30();
    if (v2 < 0)
    {
      __break(1u);
      return MessageStoreController.updateMessages(_:)(v3);
    }
    uint64_t v4 = 0;
    unint64_t v5 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v0[10] + 56);
    do
    {
      if ((v0[14] & 0xC000000000000001) != 0) {
        sub_100041AE0();
      }
      else {
        swift_retain();
      }
      uint64_t v6 = v0[8];
      uint64_t v7 = v0[9];
      uint64_t v9 = v0[6];
      uint64_t v8 = v0[7];
      ++v4;
      sub_100041440();
      uint64_t v10 = *v5;
      (*v5)(v6, 1, 1, v7);
      v10(v8, 1, 1, v7);
      uint64_t v11 = sub_100041290();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v9, 1, 1, v11);
      id v12 = objc_allocWithZone((Class)sub_1000415A0());
      sub_100041580();
      swift_release();
      sub_100041B10();
      sub_100041B40();
      sub_100041B50();
      sub_100041B20();
    }
    while (v2 != v4);
  }
  v0[17] = _swiftEmptyArrayStorage;
  sub_1000366C0((void *)(v0[5]+ OBJC_IVAR____TtC37VoicemailMessageNotificationExtension24FaceTimeVoicemailManager_messageStoreController), *(void *)(v0[5]+ OBJC_IVAR____TtC37VoicemailMessageNotificationExtension24FaceTimeVoicemailManager_messageStoreController+ 24));
  uint64_t v13 = (void *)swift_task_alloc();
  v0[18] = v13;
  *uint64_t v13 = v0;
  v13[1] = sub_1000328C0;
  uint64_t v3 = _swiftEmptyArrayStorage;
  return MessageStoreController.updateMessages(_:)(v3);
}

uint64_t sub_1000328C0()
{
  uint64_t v2 = (void *)*v1;
  v2[19] = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = v2[12];
    uint64_t v4 = v2[13];
    return _swift_task_switch(sub_100032A38, v3, v4);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    unint64_t v5 = (uint64_t (*)(void))v2[1];
    return v5();
  }
}

uint64_t sub_100032A38()
{
  id v12 = v0;
  swift_bridgeObjectRelease();
  swift_errorRetain();
  swift_bridgeObjectRetain();
  swift_errorRetain();
  unint64_t v1 = sub_1000416B0();
  os_log_type_t v2 = sub_100041920();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = swift_slowAlloc();
    uint64_t v4 = (void *)swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 136315394;
    type metadata accessor for FTMessage(0);
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_100041800();
    unint64_t v7 = v6;
    swift_bridgeObjectRelease();
    v0[2] = sub_10001F3FC(v5, v7, &v11);
    sub_1000419E0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v3 + 12) = 2112;
    swift_errorRetain();
    uint64_t v8 = _swift_stdlib_bridgeErrorToNSError();
    v0[3] = v8;
    sub_1000419E0();
    *uint64_t v4 = v8;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "FaceTimeVoicemailManager failed to set messages %s as read with error: %@", (uint8_t *)v3, 0x16u);
    sub_100016F7C(&qword_100068AD0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
    swift_errorRelease();
  }
  else
  {
    swift_errorRelease();

    swift_bridgeObjectRelease_n();
    swift_errorRelease();
    swift_errorRelease();
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t sub_100032E7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  type metadata accessor for VoicemailActor();
  swift_initStaticObject();
  sub_10003852C((unint64_t *)&qword_100068530, (void (*)(uint64_t))type metadata accessor for VoicemailActor);
  uint64_t v5 = sub_100041850();
  return _swift_task_switch(sub_100032F48, v5, v4);
}

uint64_t sub_100032F48()
{
  *(void *)(v0 + 40) = _Block_copy(*(const void **)(v0 + 24));
  sub_100016F7C(&qword_1000687E0);
  uint64_t v1 = sub_1000417F0();
  *(void *)(v0 + 48) = v1;
  swift_retain();
  os_log_type_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v2;
  *os_log_type_t v2 = v0;
  v2[1] = sub_100033020;
  return sub_1000321C8(v1);
}

uint64_t sub_100033020()
{
  uint64_t v1 = *(void (***)(void))(*v0 + 40);
  uint64_t v4 = *v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_release();
  v1[2](v1);
  _Block_release(v1);
  os_log_type_t v2 = *(uint64_t (**)(void))(v4 + 8);
  return v2();
}

uint64_t sub_100033180(uint64_t a1)
{
  void v2[5] = a1;
  v2[6] = v1;
  sub_100016F7C(&qword_1000687D8);
  v2[7] = swift_task_alloc();
  sub_100016F7C(&qword_1000688F8);
  v2[8] = swift_task_alloc();
  v2[9] = swift_task_alloc();
  uint64_t v3 = sub_100041340();
  v2[10] = v3;
  v2[11] = *(void *)(v3 - 8);
  v2[12] = swift_task_alloc();
  v2[13] = swift_task_alloc();
  v2[14] = swift_task_alloc();
  type metadata accessor for VoicemailActor();
  swift_initStaticObject();
  sub_10003852C((unint64_t *)&qword_100068530, (void (*)(uint64_t))type metadata accessor for VoicemailActor);
  uint64_t v5 = sub_100041850();
  v2[15] = v5;
  uint8_t v2[16] = v4;
  return _swift_task_switch(sub_100033330, v5, v4);
}

uint64_t sub_100033330()
{
  unint64_t v1 = (unint64_t)sub_1000313DC(v0[5]);
  v0[17] = v1;
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_100041BA0();
    swift_bridgeObjectRelease();
    v0[18] = v3;
    if (v3) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    v0[18] = v2;
    if (v2)
    {
LABEL_3:
      return _swift_task_switch(sub_100033474, 0, 0);
    }
  }
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_100033474()
{
  sub_100041870();
  *(void *)(v0 + 152) = sub_100041860();
  uint64_t v2 = sub_100041850();
  return _swift_task_switch(sub_100033508, v2, v1);
}

uint64_t sub_100033508()
{
  uint64_t v1 = v0[18];
  uint64_t v2 = swift_release();
  if (v1 < 1)
  {
    __break(1u);
  }
  else
  {
    unint64_t v5 = v0[17] & 0xC000000000000001;
    swift_bridgeObjectRetain();
    uint64_t v6 = 0;
    do
    {
      if (v5) {
        uint64_t v7 = sub_100041AE0();
      }
      else {
        uint64_t v7 = swift_retain();
      }
      uint64_t v8 = v0[18];
      ++v6;
      *(unsigned char *)(v7 + OBJC_IVAR____TtC37VoicemailMessageNotificationExtension9FTMessage_isDirty) = 1;
      *(void *)(v7 + 24) = 2;
      *(unsigned char *)(v7 + 32) = 0;
      swift_release();
    }
    while (v6 != v8);
    swift_bridgeObjectRelease();
    uint64_t v3 = v0[15];
    uint64_t v4 = v0[16];
    uint64_t v2 = (uint64_t)sub_1000335FC;
  }
  return _swift_task_switch(v2, v3, v4);
}

uint64_t sub_1000335FC()
{
  uint64_t v24 = v0;
  unint64_t v1 = v0[17];
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_100041BA0();
    swift_bridgeObjectRelease();
    if (v2) {
      goto LABEL_3;
    }
LABEL_11:
    swift_bridgeObjectRelease();
    uint64_t v13 = _swiftEmptyArrayStorage;
    goto LABEL_12;
  }
  uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v2) {
    goto LABEL_11;
  }
LABEL_3:
  uint64_t v23 = _swiftEmptyArrayStorage;
  uint64_t v3 = sub_100041B30();
  if (v2 < 0)
  {
    __break(1u);
    return MessageStoreController.updateMessages(_:)(v3);
  }
  uint64_t v4 = 0;
  unint64_t v5 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v0[11] + 56);
  do
  {
    if ((v0[17] & 0xC000000000000001) != 0) {
      sub_100041AE0();
    }
    else {
      swift_retain();
    }
    uint64_t v6 = v0[9];
    uint64_t v7 = v0[10];
    uint64_t v9 = v0[7];
    uint64_t v8 = v0[8];
    ++v4;
    sub_100041440();
    uint64_t v10 = *v5;
    (*v5)(v6, 1, 1, v7);
    v10(v8, 1, 1, v7);
    uint64_t v11 = sub_100041290();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v9, 1, 1, v11);
    id v12 = objc_allocWithZone((Class)sub_1000415A0());
    sub_100041580();
    swift_release();
    sub_100041B10();
    sub_100041B40();
    sub_100041B50();
    sub_100041B20();
  }
  while (v2 != v4);
  uint64_t v13 = v23;
  swift_bridgeObjectRelease();
LABEL_12:
  uint64_t v14 = OBJC_IVAR____TtC37VoicemailMessageNotificationExtension24FaceTimeVoicemailManager_logger;
  v0[20] = v13;
  v0[21] = v14;
  swift_bridgeObjectRetain_n();
  uint64_t v15 = sub_1000416B0();
  os_log_type_t v16 = sub_100041920();
  if (os_log_type_enabled(v15, v16))
  {
    unint64_t v17 = (uint8_t *)swift_slowAlloc();
    uint64_t v23 = (void *)swift_slowAlloc();
    *(_DWORD *)unint64_t v17 = 136315138;
    sub_1000415A0();
    swift_bridgeObjectRetain();
    uint64_t v18 = sub_100041800();
    unint64_t v20 = v19;
    swift_bridgeObjectRelease();
    v0[4] = sub_10001F3FC(v18, v20, (uint64_t *)&v23);
    sub_1000419E0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "[moveToTrash] Updating messages in FaceTimeVoicemailManager - Updates: %s", v17, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  sub_1000366C0((void *)(v0[6]+ OBJC_IVAR____TtC37VoicemailMessageNotificationExtension24FaceTimeVoicemailManager_messageStoreController), *(void *)(v0[6]+ OBJC_IVAR____TtC37VoicemailMessageNotificationExtension24FaceTimeVoicemailManager_messageStoreController+ 24));
  uint64_t v21 = (void *)swift_task_alloc();
  v0[22] = v21;
  *uint64_t v21 = v0;
  v21[1] = sub_100033A30;
  uint64_t v3 = (uint64_t)v13;
  return MessageStoreController.updateMessages(_:)(v3);
}

uint64_t sub_100033A30()
{
  uint64_t v2 = (void *)*v1;
  v2[23] = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = v2[15];
    uint64_t v4 = v2[16];
    return _swift_task_switch(sub_100033BBC, v3, v4);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    unint64_t v5 = (uint64_t (*)(void))v2[1];
    return v5();
  }
}

uint64_t sub_100033BBC()
{
  char v31 = v0;
  swift_errorRetain();
  swift_bridgeObjectRetain();
  swift_errorRetain();
  unint64_t v1 = sub_1000416B0();
  os_log_type_t v2 = sub_100041920();
  if (os_log_type_enabled(v1, v2))
  {
    unint64_t v3 = v0[20];
    uint64_t v4 = swift_slowAlloc();
    int v26 = (void *)swift_slowAlloc();
    uint64_t v29 = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 136315394;
    if (v3 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v5 = sub_100041BA0();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v5 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    os_log_t log = v1;
    os_log_type_t v27 = v2;
    if (v5)
    {
      os_log_type_t v30 = _swiftEmptyArrayStorage;
      uint64_t result = sub_100036774(0, v5 & ~(v5 >> 63), 0);
      if (v5 < 0)
      {
        __break(1u);
        return result;
      }
      uint64_t v7 = v30;
      if ((v3 & 0xC000000000000001) != 0)
      {
        uint64_t v8 = 0;
        uint64_t v9 = v0[11];
        do
        {
          sub_100041AE0();
          sub_100041590();
          swift_unknownObjectRelease();
          os_log_type_t v30 = v7;
          unint64_t v11 = v7[2];
          unint64_t v10 = v7[3];
          if (v11 >= v10 >> 1)
          {
            sub_100036774(v10 > 1, v11 + 1, 1);
            uint64_t v7 = v30;
          }
          uint64_t v12 = v0[13];
          uint64_t v13 = v0[10];
          ++v8;
          v7[2] = v11 + 1;
          (*(void (**)(unint64_t, uint64_t, uint64_t))(v9 + 32))((unint64_t)v7+ ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80))+ *(void *)(v9 + 72) * v11, v12, v13);
        }
        while (v5 != v8);
      }
      else
      {
        uint64_t v14 = v0[11];
        uint64_t v15 = (id *)(v0[20] + 32);
        do
        {
          id v16 = *v15;
          sub_100041590();

          os_log_type_t v30 = v7;
          unint64_t v18 = v7[2];
          unint64_t v17 = v7[3];
          if (v18 >= v17 >> 1)
          {
            sub_100036774(v17 > 1, v18 + 1, 1);
            uint64_t v7 = v30;
          }
          uint64_t v19 = v0[12];
          uint64_t v20 = v0[10];
          v7[2] = v18 + 1;
          (*(void (**)(unint64_t, uint64_t, uint64_t))(v14 + 32))((unint64_t)v7+ ((*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80))+ *(void *)(v14 + 72) * v18, v19, v20);
          ++v15;
          --v5;
        }
        while (v5);
      }
    }
    uint64_t v21 = sub_100041800();
    unint64_t v23 = v22;
    swift_bridgeObjectRelease();
    v0[2] = sub_10001F3FC(v21, v23, &v29);
    sub_1000419E0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v4 + 12) = 2112;
    swift_errorRetain();
    uint64_t v24 = _swift_stdlib_bridgeErrorToNSError();
    v0[3] = v24;
    sub_1000419E0();
    void *v26 = v24;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, log, v27, "FaceTimeVoicemailManager failed to set messages %s as deleted with error: %@", (uint8_t *)v4, 0x16u);
    sub_100016F7C(&qword_100068AD0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
    swift_errorRelease();
  }
  else
  {
    swift_errorRelease();

    swift_bridgeObjectRelease_n();
    swift_errorRelease();
    swift_errorRelease();
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v25 = (uint64_t (*)(void))v0[1];
  return v25();
}

uint64_t sub_1000341E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  type metadata accessor for VoicemailActor();
  swift_initStaticObject();
  sub_10003852C((unint64_t *)&qword_100068530, (void (*)(uint64_t))type metadata accessor for VoicemailActor);
  uint64_t v5 = sub_100041850();
  return _swift_task_switch(sub_1000342AC, v5, v4);
}

uint64_t sub_1000342AC()
{
  *(void *)(v0 + 40) = _Block_copy(*(const void **)(v0 + 24));
  sub_100016F7C(&qword_1000687E0);
  uint64_t v1 = sub_1000417F0();
  *(void *)(v0 + 48) = v1;
  swift_retain();
  os_log_type_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v2;
  *os_log_type_t v2 = v0;
  v2[1] = sub_100038880;
  return sub_100033180(v1);
}

uint64_t sub_100034384(uint64_t a1)
{
  void v2[5] = a1;
  v2[6] = v1;
  sub_100016F7C(&qword_1000687D8);
  v2[7] = swift_task_alloc();
  sub_100016F7C(&qword_1000688F8);
  v2[8] = swift_task_alloc();
  v2[9] = swift_task_alloc();
  uint64_t v3 = sub_100041340();
  v2[10] = v3;
  v2[11] = *(void *)(v3 - 8);
  v2[12] = swift_task_alloc();
  v2[13] = swift_task_alloc();
  type metadata accessor for VoicemailActor();
  swift_initStaticObject();
  sub_10003852C((unint64_t *)&qword_100068530, (void (*)(uint64_t))type metadata accessor for VoicemailActor);
  uint64_t v5 = sub_100041850();
  v2[14] = v5;
  v2[15] = v4;
  return _swift_task_switch(sub_100034528, v5, v4);
}

uint64_t sub_100034528()
{
  unint64_t v1 = (unint64_t)sub_1000313DC(v0[5]);
  v0[16] = v1;
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_100041BA0();
    swift_bridgeObjectRelease();
    v0[17] = v3;
    if (v3) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    v0[17] = v2;
    if (v2)
    {
LABEL_3:
      return _swift_task_switch(sub_100034654, 0, 0);
    }
  }
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_100034654()
{
  sub_100041870();
  *(void *)(v0 + 144) = sub_100041860();
  uint64_t v2 = sub_100041850();
  return _swift_task_switch(sub_1000346E8, v2, v1);
}

uint64_t sub_1000346E8()
{
  uint64_t v1 = v0[17];
  uint64_t v2 = swift_release();
  if (v1 < 1)
  {
    __break(1u);
  }
  else
  {
    unint64_t v5 = v0[16] & 0xC000000000000001;
    swift_bridgeObjectRetain();
    uint64_t v6 = 0;
    do
    {
      if (v5) {
        uint64_t v7 = sub_100041AE0();
      }
      else {
        uint64_t v7 = swift_retain();
      }
      uint64_t v8 = v0[17];
      ++v6;
      *(unsigned char *)(v7 + OBJC_IVAR____TtC37VoicemailMessageNotificationExtension9FTMessage_isDirty) = 1;
      *(void *)(v7 + 24) = 1;
      *(unsigned char *)(v7 + 32) = 0;
      swift_release();
    }
    while (v6 != v8);
    swift_bridgeObjectRelease();
    uint64_t v3 = v0[14];
    uint64_t v4 = v0[15];
    uint64_t v2 = (uint64_t)sub_1000347D0;
  }
  return _swift_task_switch(v2, v3, v4);
}

uint64_t sub_1000347D0()
{
  uint64_t v24 = v0;
  unint64_t v1 = v0[16];
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_100041BA0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  v0[19] = v2;
  uint64_t v3 = _swiftEmptyArrayStorage;
  if (v2)
  {
    unint64_t v23 = _swiftEmptyArrayStorage;
    uint64_t v4 = sub_100041B30();
    if (v2 < 0)
    {
      __break(1u);
      return MessageStoreController.updateMessages(_:)(v4);
    }
    uint64_t v5 = 0;
    uint64_t v6 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v0[11] + 56);
    do
    {
      if ((v0[16] & 0xC000000000000001) != 0) {
        sub_100041AE0();
      }
      else {
        swift_retain();
      }
      uint64_t v7 = v0[9];
      uint64_t v8 = v0[10];
      uint64_t v10 = v0[7];
      uint64_t v9 = v0[8];
      ++v5;
      sub_100041440();
      unint64_t v11 = *v6;
      (*v6)(v7, 1, 1, v8);
      v11(v9, 1, 1, v8);
      uint64_t v12 = sub_100041290();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v10, 1, 1, v12);
      id v13 = objc_allocWithZone((Class)sub_1000415A0());
      sub_100041580();
      swift_release();
      sub_100041B10();
      sub_100041B40();
      sub_100041B50();
      sub_100041B20();
    }
    while (v2 != v5);
    uint64_t v3 = v23;
  }
  uint64_t v14 = OBJC_IVAR____TtC37VoicemailMessageNotificationExtension24FaceTimeVoicemailManager_logger;
  v0[20] = v3;
  v0[21] = v14;
  swift_bridgeObjectRetain_n();
  uint64_t v15 = sub_1000416B0();
  os_log_type_t v16 = sub_100041920();
  if (os_log_type_enabled(v15, v16))
  {
    unint64_t v17 = (uint8_t *)swift_slowAlloc();
    unint64_t v23 = (void *)swift_slowAlloc();
    *(_DWORD *)unint64_t v17 = 136315138;
    sub_1000415A0();
    swift_bridgeObjectRetain();
    uint64_t v18 = sub_100041800();
    unint64_t v20 = v19;
    swift_bridgeObjectRelease();
    v0[4] = sub_10001F3FC(v18, v20, (uint64_t *)&v23);
    sub_1000419E0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "[removeFromTrash] Updating messages in FaceTimeVoicemailManager - Updates: %s", v17, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  sub_1000366C0((void *)(v0[6]+ OBJC_IVAR____TtC37VoicemailMessageNotificationExtension24FaceTimeVoicemailManager_messageStoreController), *(void *)(v0[6]+ OBJC_IVAR____TtC37VoicemailMessageNotificationExtension24FaceTimeVoicemailManager_messageStoreController+ 24));
  uint64_t v21 = (void *)swift_task_alloc();
  v0[22] = v21;
  *uint64_t v21 = v0;
  v21[1] = sub_100034BEC;
  uint64_t v4 = (uint64_t)v3;
  return MessageStoreController.updateMessages(_:)(v4);
}

uint64_t sub_100034BEC()
{
  uint64_t v2 = (void *)*v1;
  v2[23] = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v0)
  {
    uint64_t v3 = v2[14];
    uint64_t v4 = v2[15];
    return _swift_task_switch(sub_100034D7C, v3, v4);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v5 = (uint64_t (*)(void))v2[1];
    return v5();
  }
}

uint64_t sub_100034D7C()
{
  int v26 = v0;
  swift_errorRetain();
  swift_bridgeObjectRetain();
  swift_errorRetain();
  unint64_t v1 = sub_1000416B0();
  os_log_type_t v2 = sub_100041920();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = v0[19];
    uint64_t v4 = swift_slowAlloc();
    uint64_t v5 = swift_slowAlloc();
    uint64_t v24 = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 136315394;
    os_log_t log = v1;
    os_log_type_t v22 = v2;
    uint64_t v21 = (void *)v5;
    if (v3)
    {
      uint64_t v6 = v0[19];
      uint64_t v25 = _swiftEmptyArrayStorage;
      uint64_t result = sub_100036774(0, v6 & ~(v6 >> 63), 0);
      if (v6 < 0)
      {
        __break(1u);
        return result;
      }
      uint64_t v8 = 0;
      uint64_t v9 = v0[11];
      uint64_t v10 = v25;
      do
      {
        if ((v0[16] & 0xC000000000000001) != 0) {
          sub_100041AE0();
        }
        else {
          swift_retain();
        }
        sub_100041440();
        swift_release();
        uint64_t v25 = v10;
        unint64_t v12 = v10[2];
        unint64_t v11 = v10[3];
        if (v12 >= v11 >> 1)
        {
          sub_100036774(v11 > 1, v12 + 1, 1);
          uint64_t v10 = v25;
        }
        uint64_t v13 = v0[19];
        uint64_t v14 = v0[12];
        uint64_t v15 = v0[10];
        ++v8;
        void v10[2] = v12 + 1;
        (*(void (**)(unint64_t, uint64_t, uint64_t))(v9 + 32))((unint64_t)v10+ ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80))+ *(void *)(v9 + 72) * v12, v14, v15);
      }
      while (v8 != v13);
    }
    uint64_t v16 = sub_100041800();
    unint64_t v18 = v17;
    swift_bridgeObjectRelease();
    v0[2] = sub_10001F3FC(v16, v18, &v24);
    sub_1000419E0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v4 + 12) = 2112;
    swift_errorRetain();
    uint64_t v19 = _swift_stdlib_bridgeErrorToNSError();
    v0[3] = v19;
    sub_1000419E0();
    *uint64_t v21 = v19;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, log, v22, "FaceTimeVoicemailManager failed to set messages %s as undeleted with error: %@", (uint8_t *)v4, 0x16u);
    sub_100016F7C(&qword_100068AD0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
    swift_errorRelease();
  }
  else
  {
    swift_errorRelease();

    swift_bridgeObjectRelease_n();
    swift_errorRelease();
    swift_errorRelease();
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v20 = (uint64_t (*)(void))v0[1];
  return v20();
}

uint64_t sub_1000352CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  type metadata accessor for VoicemailActor();
  swift_initStaticObject();
  sub_10003852C((unint64_t *)&qword_100068530, (void (*)(uint64_t))type metadata accessor for VoicemailActor);
  uint64_t v5 = sub_100041850();
  return _swift_task_switch(sub_100035398, v5, v4);
}

uint64_t sub_100035398()
{
  *(void *)(v0 + 40) = _Block_copy(*(const void **)(v0 + 24));
  sub_100016F7C(&qword_1000687E0);
  uint64_t v1 = sub_1000417F0();
  *(void *)(v0 + 48) = v1;
  swift_retain();
  os_log_type_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v2;
  *os_log_type_t v2 = v0;
  v2[1] = sub_100038880;
  return sub_100034384(v1);
}

uint64_t sub_1000355F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  v3[5] = type metadata accessor for VoicemailActor();
  swift_initStaticObject();
  v3[6] = sub_10003852C((unint64_t *)&qword_100068530, (void (*)(uint64_t))type metadata accessor for VoicemailActor);
  uint64_t v5 = sub_100041850();
  return _swift_task_switch(sub_1000356CC, v5, v4);
}

uint64_t sub_1000356CC()
{
  uint64_t v1 = *(const void **)(v0 + 24);
  os_log_type_t v2 = _Block_copy(*(const void **)(v0 + 16));
  *(void *)(v0 + 56) = v2;
  *(void *)(v0 + 64) = _Block_copy(v1);
  *(void *)(v0 + 72) = swift_initStaticObject();
  _Block_copy(v2);
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 80) = v3;
  void *v3 = v0;
  v3[1] = sub_1000357AC;
  return sub_10002161C();
}

uint64_t sub_1000357AC(uint64_t a1)
{
  *(void *)(*(void *)v1 + 88) = a1;
  swift_task_dealloc();
  uint64_t v3 = sub_100041850();
  return _swift_task_switch(sub_100035908, v3, v2);
}

uint64_t sub_100035908()
{
  uint64_t v1 = (unsigned int (**)(void, void))v0[7];
  uint64_t v2 = (void (**)(void, void))v0[8];
  sub_10002E6E8(v0[11], v1);
  _Block_release(v1);
  swift_release();
  sub_100016F7C(&qword_1000687E0);
  Class isa = sub_1000417E0().super.isa;
  swift_bridgeObjectRelease();
  ((void (**)(void, Class))v2)[2](v2, isa);

  _Block_release(v2);
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_1000359E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  type metadata accessor for VoicemailActor();
  swift_initStaticObject();
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v7;
  *uint64_t v7 = v5;
  v7[1] = sub_100029E9C;
  return sub_1000315BC(a5);
}

uint64_t sub_100035AB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  type metadata accessor for VoicemailActor();
  swift_initStaticObject();
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v7;
  *uint64_t v7 = v5;
  v7[1] = sub_100029E9C;
  return sub_1000321C8(a5);
}

uint64_t sub_100035B80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7 = sub_100016F7C((uint64_t *)&unk_100069380);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100016F7C(&qword_1000687E0);
  uint64_t v10 = sub_1000417F0();
  uint64_t v11 = sub_1000418B0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v9, 1, 1, v11);
  type metadata accessor for VoicemailActor();
  swift_retain_n();
  swift_bridgeObjectRetain();
  uint64_t inited = swift_initStaticObject();
  uint64_t v13 = sub_10003852C((unint64_t *)&qword_100068530, (void (*)(uint64_t))type metadata accessor for VoicemailActor);
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = inited;
  void v14[3] = v13;
  v14[4] = a1;
  v14[5] = v10;
  sub_10003A150((uint64_t)v9, a5, (uint64_t)v14);
  swift_release();
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_100035D1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  type metadata accessor for VoicemailActor();
  swift_initStaticObject();
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v7;
  *uint64_t v7 = v5;
  v7[1] = sub_100029E9C;
  return sub_100033180(a5);
}

uint64_t sub_100035DEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  type metadata accessor for VoicemailActor();
  swift_initStaticObject();
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v7;
  *uint64_t v7 = v5;
  v7[1] = sub_100029E9C;
  return sub_100034384(a5);
}

uint64_t sub_100035EBC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000416D0();
  uint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);

  return v5(a1, a2, v4);
}

uint64_t sub_100035F28(uint64_t a1)
{
  uint64_t v2 = sub_1000416D0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t sub_100035F8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000416D0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_100035FF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000416D0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_100036054(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000416D0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_1000360B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000416D0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_10003611C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100036130);
}

uint64_t sub_100036130(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000416D0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t sub_10003619C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000361B0);
}

uint64_t sub_1000361B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000416D0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

uint64_t type metadata accessor for VoiceMailAnalyticsLogger(uint64_t a1)
{
  return sub_100019758(a1, qword_100068FF0);
}

uint64_t sub_100036240()
{
  uint64_t result = sub_1000416D0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_1000362D0(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  void *v8 = v2;
  v8[1] = sub_100029E9C;
  return sub_100035DEC(a1, v4, v5, v7, v6);
}

char *sub_100036390(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_100016F7C(&qword_100069260);
      uint64_t v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 4);
      uint64_t v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v13 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[16 * v8 + 32]) {
          memmove(v13, a4 + 32, 16 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_100038248(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

char *sub_1000364A0(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_100016F7C(&qword_100069270);
      uint64_t v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 4);
      uint64_t v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v13 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[16 * v8 + 32]) {
          memmove(v13, a4 + 32, 16 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_10003813C(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_1000365B0(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_100016F7C(&qword_1000691C0);
      uint64_t v10 = (void *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      void v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = _swiftEmptyArrayStorage;
      uint64_t v13 = &_swiftEmptyArrayStorage[4];
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4]) {
          memmove(v13, a4 + 4, 16 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_100038354(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_1000366C0(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_100036704(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100036794(a1, a2, a3, *v3);
  void *v3 = (char *)result;
  return result;
}

uint64_t sub_100036724(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100036918(a1, a2, a3, (void *)*v3, &qword_100069260, &qword_100069268);
  uint64_t *v3 = result;
  return result;
}

uint64_t sub_100036754(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100036AA8(a1, a2, a3, (void *)*v3);
  uint64_t *v3 = result;
  return result;
}

uint64_t sub_100036774(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100036C34(a1, a2, a3, (void *)*v3);
  uint64_t *v3 = result;
  return result;
}

uint64_t sub_100036794(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_100016F7C(&qword_100069280);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8]) {
      memmove(v13, v14, 32 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[32 * v8] || v13 >= &v14[32 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_100041BE0();
  __break(1u);
  return result;
}

uint64_t sub_100036904(char a1, int64_t a2, char a3, void *a4)
{
  return sub_100036918(a1, a2, a3, a4, &qword_100068D78, &qword_100068D68);
}

uint64_t sub_100036918(char a1, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t *a6)
{
  if (a3)
  {
    unint64_t v9 = a4[3];
    int64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      int64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v10 = a2;
      }
    }
  }
  else
  {
    int64_t v10 = a2;
  }
  uint64_t v11 = a4[2];
  if (v10 <= v11) {
    uint64_t v12 = a4[2];
  }
  else {
    uint64_t v12 = v10;
  }
  if (v12)
  {
    sub_100016F7C(a5);
    uint64_t v13 = (void *)swift_allocObject();
    int64_t v14 = j__malloc_size(v13);
    uint64_t v15 = v14 - 32;
    if (v14 < 32) {
      uint64_t v15 = v14 - 17;
    }
    void v13[2] = v11;
    v13[3] = 2 * (v15 >> 4);
  }
  else
  {
    uint64_t v13 = _swiftEmptyArrayStorage;
  }
  unint64_t v16 = (unint64_t)(v13 + 4);
  unint64_t v17 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v13 != a4 || v16 >= v17 + 16 * v11) {
      memmove(v13 + 4, a4 + 4, 16 * v11);
    }
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v17 >= v16 + 16 * v11 || v16 >= v17 + 16 * v11)
  {
    sub_100016F7C(a6);
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_32:
  uint64_t result = sub_100041BE0();
  __break(1u);
  return result;
}

uint64_t sub_100036AA8(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_100016F7C(&qword_100069258);
    int64_t v10 = (void *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    void v10[2] = v8;
    v10[3] = 2 * (v12 >> 3);
  }
  else
  {
    int64_t v10 = _swiftEmptyArrayStorage;
  }
  unint64_t v13 = (unint64_t)(v10 + 4);
  unint64_t v14 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v13 >= v14 + 8 * v8) {
      memmove(v10 + 4, a4 + 4, 8 * v8);
    }
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v14 >= v13 + 8 * v8 || v13 >= v14 + 8 * v8)
  {
    sub_100016F7C(&qword_100068DA8);
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_100041BE0();
  __break(1u);
  return result;
}

uint64_t sub_100036C34(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    unint64_t v13 = _swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_100016F7C(&qword_100069040);
  uint64_t v10 = *(void *)(sub_100041340() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v13 = (void *)swift_allocObject();
  size_t v14 = j__malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v14 - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_34;
  }
  void v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(sub_100041340() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (char *)v13 + v17;
  uint64_t v19 = (char *)a4 + v17;
  if (a1)
  {
    if (v13 < a4 || v18 >= &v19[*(void *)(v16 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  uint64_t v20 = *(void *)(v16 + 72) * v8;
  uint64_t v21 = &v18[v20];
  unint64_t v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  uint64_t result = sub_100041BE0();
  __break(1u);
  return result;
}

uint64_t sub_100036E78(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  void *v8 = v2;
  v8[1] = sub_100029E9C;
  return sub_100035D1C(a1, v4, v5, v7, v6);
}

uint64_t sub_100036F3C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  void *v8 = v2;
  v8[1] = sub_1000297A0;
  return sub_100035AB0(a1, v4, v5, v7, v6);
}

uint64_t sub_100037000()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100037048(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  void *v8 = v2;
  v8[1] = sub_100029E9C;
  return sub_1000359E0(a1, v4, v5, v7, v6);
}

uint64_t sub_100037108()
{
  _Block_release(*(const void **)(v0 + 16));
  _Block_release(*(const void **)(v0 + 24));
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100037150()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_100029E9C;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_100069090 + dword_100069090);
  return v6(v2, v3, v4);
}

unint64_t sub_10003720C(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_1000419B0(*(void *)(v2 + 40));

  return sub_1000372C8(a1, v4);
}

unint64_t sub_100037250(uint64_t a1, uint64_t a2)
{
  sub_100041CC0();
  sub_1000417A0();
  Swift::Int v4 = sub_100041CE0();

  return sub_1000373D4(a1, a2, v4);
}

unint64_t sub_1000372C8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t i = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    type metadata accessor for MessageID(0);
    id v6 = *(id *)(*(void *)(v2 + 48) + 8 * i);
    char v7 = sub_1000419C0();

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = ~v4;
      for (unint64_t i = (i + 1) & v8; ((*(void *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v8)
      {
        id v9 = *(id *)(*(void *)(v2 + 48) + 8 * i);
        char v10 = sub_1000419C0();

        if (v10) {
          break;
        }
      }
    }
  }
  return i;
}

unint64_t sub_1000373D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    char v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_100041C40() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        unint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_100041C40() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_1000374B8()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000374F4()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_100029E9C;
  unint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_1000690A0 + dword_1000690A0);
  return v6(v2, v3, v4);
}

uint64_t sub_1000375B4()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_100029E9C;
  unint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_1000690C0 + dword_1000690C0);
  return v6(v2, v3, v4);
}

uint64_t sub_100037674()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_100029E9C;
  unint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_1000690E0 + dword_1000690E0);
  return v6(v2, v3, v4);
}

uint64_t sub_100037734()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_100029E9C;
  unint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_100069100 + dword_100069100);
  return v6(v2, v3, v4);
}

uint64_t sub_1000377F0()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100037828()
{
  swift_release();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 33, 7);
}

uint64_t sub_100037868()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  char v4 = *(unsigned char *)(v0 + 32);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_100029E9C;
  return sub_10002B038(v2, v3, v4);
}

uint64_t sub_100037914()
{
  uint64_t v2 = *(void *)(sub_1000416D0() - 8);
  uint64_t v3 = *(void *)(v0 + 16);
  uint64_t v4 = v0 + ((*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_100029E9C;
  return sub_100030FBC(v3, v4);
}

uint64_t sub_1000379EC()
{
  uint64_t v1 = sub_1000416D0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_100037AB8()
{
  uint64_t v2 = *(void *)(sub_1000416D0() - 8);
  uint64_t v3 = *(void *)(v0 + 16);
  uint64_t v4 = v0 + ((*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_100029E9C;
  return sub_100030D3C(v3, v4);
}

uint64_t sub_100037B90()
{
  uint64_t v2 = *(void *)(sub_1000416D0() - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = *(void *)(v0 + 16);
  uint64_t v5 = v0 + v3;
  uint64_t v6 = *(void *)(v0 + ((*(void *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v7;
  *uint64_t v7 = v1;
  v7[1] = sub_100029E9C;
  return sub_1000301BC(v4, v5, v6);
}

unint64_t sub_100037C9C(unint64_t result)
{
  if (result >= 2) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

unint64_t sub_100037CAC(unint64_t result)
{
  if (result >= 2) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_100037CC0()
{
  uint64_t v2 = *(void *)(sub_1000416D0() - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = *(void *)(v0 + 16);
  uint64_t v5 = v0 + v3;
  uint64_t v6 = *(void *)(v0 + ((*(void *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v7;
  *uint64_t v7 = v1;
  v7[1] = sub_100029E9C;
  return sub_10002F794(v4, v5, v6);
}

uint64_t sub_100037DD0()
{
  uint64_t v2 = *(void *)(sub_1000416D0() - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = *(void *)(v0 + 16);
  uint64_t v5 = v0 + v3;
  uint64_t v6 = *(void *)(v0 + ((*(void *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v7;
  *uint64_t v7 = v1;
  v7[1] = sub_100029E9C;
  return sub_10002EB98(v4, v5, v6);
}

uint64_t sub_100037EE0()
{
  uint64_t v1 = sub_1000416D0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, v6, v5);
}

uint64_t sub_100037FC8()
{
  uint64_t v2 = *(void *)(sub_1000416D0() - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = *(void *)(v0 + 16);
  uint64_t v5 = v0 + v3;
  uint64_t v6 = *(void *)(v0 + ((*(void *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v7;
  *uint64_t v7 = v1;
  v7[1] = sub_100029E9C;
  return sub_10002DAB8(v4, v5, v6);
}

uint64_t sub_1000380D4()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10003810C()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_100038114(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100038124()
{
  return swift_release();
}

uint64_t sub_10003812C()
{
  return swift_release();
}

uint64_t sub_100038134(uint64_t a1)
{
  return sub_100023964(a1, *(void *)(v1 + 16));
}

uint64_t sub_10003813C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      sub_100016F7C(&qword_100069278);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_100041BE0();
  __break(1u);
  return result;
}

uint64_t sub_100038248(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      sub_100016F7C(&qword_100069268);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_100041BE0();
  __break(1u);
  return result;
}

uint64_t sub_100038354(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      sub_100016F7C(&qword_1000691C8);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_100041BE0();
  __break(1u);
  return result;
}

uint64_t sub_100038460(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_100038470(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_1000384D0()
{
  unint64_t result = qword_1000691E8;
  if (!qword_1000691E8)
  {
    sub_10001701C(&qword_1000691E0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000691E8);
  }
  return result;
}

uint64_t sub_10003852C(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100038574(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_100029E9C;
  return sub_10002B90C(a1, v1);
}

uint64_t sub_100038610()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100038650(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_1000297A0;
  return sub_10002BAA8(a1, v4, v5, v6);
}

uint64_t sub_100038704(uint64_t a1)
{
  uint64_t v2 = sub_100016F7C((uint64_t *)&unk_100069380);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100038768()
{
  _Block_release(*(const void **)(v0 + 24));
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_1000387B0()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_100029E9C;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_100069238 + dword_100069238);
  return v6(v2, v3, v4);
}

uint64_t sub_100038884()
{
  uint64_t v0 = sub_1000416D0();
  sub_1000289C8(v0, qword_10006A268);
  sub_10001F3C4(v0, (uint64_t)qword_10006A268);
  return sub_1000416C0();
}

id sub_1000388FC()
{
  swift_unknownObjectRetain();
  swift_getAtKeyPath();
  swift_unknownObjectRelease();
  if (!v8) {
    return 0;
  }
  uint64_t v0 = HIBYTE(v8) & 0xF;
  if ((v8 & 0x2000000000000000) == 0) {
    uint64_t v0 = *(void *)v7 & 0xFFFFFFFFFFFFLL;
  }
  if (!v0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  swift_unknownObjectRetain();
  swift_getAtKeyPath();
  swift_unknownObjectRelease();
  uint64_t v1 = self;
  NSString v2 = sub_100041740();
  swift_bridgeObjectRelease();
  NSString v3 = sub_100041740();
  swift_bridgeObjectRelease();
  id v4 = [v1 normalizedPhoneNumberHandleForValue:v2 isoCountryCode:v3];

  if (!v4) {
    return 0;
  }
  id v5 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) initWithHandle:v4];

  return v5;
}

void sub_100038AE8(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_100038AF4(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_100038B00(id *a1@<X0>, SEL *a2@<X3>, uint64_t *a3@<X8>)
{
  id v4 = [*a1 *a2];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = sub_100041770();
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v8 = 0;
  }
  *a3 = v6;
  a3[1] = v8;
}

void *sub_100038B64(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = (void *)sub_100041BA0();
    uint64_t v2 = (uint64_t)result;
    if (result) {
      goto LABEL_3;
    }
LABEL_44:
    swift_bridgeObjectRelease();
    sub_10003915C((unint64_t)_swiftEmptyArrayStorage);
    return _swiftEmptyArrayStorage;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t result = (void *)swift_bridgeObjectRetain();
  if (!v2) {
    goto LABEL_44;
  }
LABEL_3:
  if (v2 >= 1)
  {
    uint64_t v4 = 0;
    unint64_t v5 = a1 & 0xC000000000000001;
    while (1)
    {
      if (v5) {
        sub_100041AE0();
      }
      else {
        swift_unknownObjectRetain();
      }
      id v6 = [(id)swift_unknownObjectRetain() senderDestinationID];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = sub_100041770();
        unint64_t v10 = v9;
        swift_unknownObjectRelease();

        uint64_t v11 = HIBYTE(v10) & 0xF;
        if ((v10 & 0x2000000000000000) == 0) {
          uint64_t v11 = v8 & 0xFFFFFFFFFFFFLL;
        }
        if (!v11)
        {
          swift_unknownObjectRelease();
          swift_bridgeObjectRelease();
          goto LABEL_7;
        }
        id v12 = [(id)swift_unknownObjectRetain() senderISOCountryCode];
        if (v12)
        {
          unint64_t v13 = v12;
          sub_100041770();
          swift_unknownObjectRelease();

          BOOL v14 = self;
          NSString v15 = sub_100041740();
          swift_bridgeObjectRelease();
          NSString v16 = sub_100041740();
          swift_bridgeObjectRelease();
          id v17 = [v14 normalizedPhoneNumberHandleForValue:v15 isoCountryCode:v16];

          if (v17)
          {
            id v18 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) initWithHandle:v17];
            swift_unknownObjectRelease();

            unint64_t v5 = a1 & 0xC000000000000001;
            if (v18)
            {
              sub_1000417D0();
              if (*(void *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
                sub_100041820();
              }
              sub_100041840();
              sub_100041810();
            }
          }
          else
          {
            swift_unknownObjectRelease();
            unint64_t v5 = a1 & 0xC000000000000001;
          }
          goto LABEL_7;
        }
        swift_bridgeObjectRelease();
      }
      swift_unknownObjectRelease_n();
LABEL_7:
      if (v2 == ++v4)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        uint64_t v19 = 0;
        uint64_t v20 = &selRef_setTitleLabelTopLayoutConstraint_;
        while (1)
        {
          if (v5) {
            sub_100041AE0();
          }
          else {
            swift_unknownObjectRetain();
          }
          id v21 = [(id)swift_unknownObjectRetain() v20[325]];
          if (v21)
          {
            unint64_t v22 = v21;
            uint64_t v23 = sub_100041770();
            unint64_t v25 = v24;
            swift_unknownObjectRelease();

            uint64_t v26 = HIBYTE(v25) & 0xF;
            if ((v25 & 0x2000000000000000) == 0) {
              uint64_t v26 = v23 & 0xFFFFFFFFFFFFLL;
            }
            if (!v26)
            {
              swift_unknownObjectRelease();
              swift_bridgeObjectRelease();
              goto LABEL_26;
            }
            id v27 = [(id)swift_unknownObjectRetain() receiverISOCountryCode];
            if (v27)
            {
              uint64_t v28 = v27;
              sub_100041770();
              swift_unknownObjectRelease();

              uint64_t v29 = self;
              NSString v30 = sub_100041740();
              swift_bridgeObjectRelease();
              NSString v31 = sub_100041740();
              swift_bridgeObjectRelease();
              id v32 = [v29 normalizedPhoneNumberHandleForValue:v30 isoCountryCode:v31];

              if (v32)
              {
                id v33 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) initWithHandle:v32];
                swift_unknownObjectRelease();

                unint64_t v5 = a1 & 0xC000000000000001;
                uint64_t v20 = &selRef_setTitleLabelTopLayoutConstraint_;
                if (v33)
                {
                  sub_1000417D0();
                  if (*(void *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
                    sub_100041820();
                  }
                  sub_100041840();
                  sub_100041810();
                }
              }
              else
              {
                swift_unknownObjectRelease();
                unint64_t v5 = a1 & 0xC000000000000001;
                uint64_t v20 = &selRef_setTitleLabelTopLayoutConstraint_;
              }
              goto LABEL_26;
            }
            swift_bridgeObjectRelease();
          }
          swift_unknownObjectRelease_n();
LABEL_26:
          if (v2 == ++v19) {
            goto LABEL_44;
          }
        }
      }
    }
  }
  __break(1u);
  return result;
}

unint64_t sub_10003911C()
{
  unint64_t result = qword_100069288;
  if (!qword_100069288)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100069288);
  }
  return result;
}

uint64_t sub_10003915C(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_100041BA0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (!((unint64_t)*v1 >> 62))
  {
    uint64_t v4 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t v5 = v4 + v3;
    if (!__OFADD__(v4, v3)) {
      goto LABEL_5;
    }
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  swift_bridgeObjectRetain();
  uint64_t v15 = sub_100041BA0();
  swift_bridgeObjectRelease();
  uint64_t v5 = v15 + v3;
  if (__OFADD__(v15, v3)) {
    goto LABEL_21;
  }
LABEL_5:
  unint64_t v6 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  uint64_t *v1 = v6;
  if (isUniquelyReferenced_nonNull_bridgeObject)
  {
    if ((v6 & 0x8000000000000000) == 0 && (v6 & 0x4000000000000000) == 0)
    {
      uint64_t v8 = v6 & 0xFFFFFFFFFFFFFF8;
      if (v5 <= *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        goto LABEL_11;
      }
    }
  }
  if (v6 >> 62) {
    goto LABEL_23;
  }
  while (1)
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_100041AF0();
    swift_bridgeObjectRelease();
    uint64_t *v1 = v9;
    uint64_t v8 = v9 & 0xFFFFFFFFFFFFFF8;
LABEL_11:
    uint64_t result = sub_1000398C4(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1, (void (*)(void))sub_10003911C, &qword_100069298, &qword_100069290, (uint64_t (*)(unsigned char *, uint64_t, unint64_t, uint64_t, uint64_t))sub_100039434);
    if (v11 >= v3) {
      break;
    }
LABEL_22:
    __break(1u);
LABEL_23:
    swift_bridgeObjectRetain();
    sub_100041BA0();
    swift_bridgeObjectRelease();
  }
  if (v11 >= 1)
  {
    uint64_t v12 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v13 = __OFADD__(v12, v11);
    uint64_t v14 = v12 + v11;
    if (v13)
    {
      __break(1u);
      return result;
    }
    *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
  }
  swift_bridgeObjectRelease();

  return sub_100041810();
}

uint64_t (*sub_100039360(uint64_t (**a1)(), unint64_t a2, uint64_t a3))()
{
  unint64_t v6 = (uint64_t (*)())malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_1000394E4(v6, a2, a3);
  return sub_1000393C8;
}

uint64_t (*sub_1000393CC(void (**a1)(id *a1), unint64_t a2, uint64_t a3))()
{
  unint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_10003956C(v6, a2, a3);
  return sub_1000393C8;
}

uint64_t (*sub_100039434(void (**a1)(id *), unint64_t a2, uint64_t a3))()
{
  unint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_1000395F4(v6, a2, a3);
  return sub_1000393C8;
}

void sub_10003949C(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

uint64_t (*sub_1000394E4(uint64_t (*result)(), unint64_t a2, uint64_t a3))()
{
  uint64_t v3 = (uint64_t *)result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    uint64_t v4 = sub_100041AE0();
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    uint64_t v4 = swift_unknownObjectRetain();
LABEL_5:
    uint64_t *v3 = v4;
    return sub_100039564;
  }
  __break(1u);
  return result;
}

uint64_t sub_100039564()
{
  return swift_unknownObjectRelease();
}

void (*sub_10003956C(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)sub_100041AE0();
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    id v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(void *)uint64_t v3 = v4;
    return sub_1000395EC;
  }
  __break(1u);
  return result;
}

void sub_1000395EC(id *a1)
{
}

void (*sub_1000395F4(void (*result)(id *), unint64_t a2, uint64_t a3))(id *)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)sub_100041AE0();
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    id v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(void *)uint64_t v3 = v4;
    return sub_100039B50;
  }
  __break(1u);
  return result;
}

uint64_t sub_100039674(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_100041BA0();
    swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      return a3;
    }
  }
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_100041BA0();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_100039B00(&qword_1000692B0, &qword_100068DA8);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          sub_100016F7C(&qword_100068DA8);
          uint64_t v12 = sub_100039360(v16, i, a3);
          uint64_t v14 = *v13;
          swift_unknownObjectRetain();
          ((void (*)(uint64_t (**)(), void))v12)(v16, 0);
          *(void *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v9 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_100016F7C(&qword_1000687E0);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_100041BE0();
  __break(1u);
  return result;
}

uint64_t sub_100039888(unint64_t a1, uint64_t a2, unint64_t a3)
{
  return sub_1000398C4(a1, a2, a3, (void (*)(void))type metadata accessor for MessageID, &qword_1000692A8, &qword_1000692A0, (uint64_t (*)(unsigned char *, uint64_t, unint64_t, uint64_t, uint64_t))sub_1000393CC);
}

uint64_t sub_1000398C4(unint64_t a1, uint64_t a2, unint64_t a3, void (*a4)(void), unint64_t *a5, uint64_t *a6, uint64_t (*a7)(unsigned char *, uint64_t, unint64_t, uint64_t, uint64_t))
{
  unint64_t v14 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v15 = sub_100041BA0();
    swift_bridgeObjectRelease();
    if (!v15) {
      return a3;
    }
  }
  else
  {
    uint64_t v15 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v15) {
      return a3;
    }
  }
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v16 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v14)
  {
    swift_bridgeObjectRetain();
    uint64_t v18 = sub_100041BA0();
    swift_bridgeObjectRelease();
    if (v18 <= a2)
    {
      if (v15 >= 1)
      {
        uint64_t v19 = sub_100039B00(a5, a6);
        swift_bridgeObjectRetain();
        for (uint64_t i = 0; i != v15; ++i)
        {
          uint64_t v21 = sub_100016F7C(a6);
          unint64_t v22 = (void (*)(unsigned char *, void))a7(v26, i, a3, v21, v19);
          id v24 = *v23;
          v22(v26, 0);
          *(void *)(a1 + 8 * i) = v24;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v17 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v17 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v16 + 32 >= a1 + 8 * v17 || v16 + 32 + 8 * v17 <= a1)
  {
    a4(0);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_100041BE0();
  __break(1u);
  return result;
}

const char *sub_100039AE8()
{
  return "senderISOCountryCode";
}

const char *sub_100039AF4()
{
  return "senderDestinationID";
}

uint64_t sub_100039B00(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10001701C(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

id sub_100039C4C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for VisualVoicemailManagerFactory();
  [super dealloc];
}

uint64_t type metadata accessor for VisualVoicemailManagerFactory()
{
  return self;
}

uint64_t sub_100039CA4()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100039CDC()
{
  return sub_1000407E4(*(void *)(v0 + 16));
}

void *sub_100039CE4(unint64_t a1)
{
  if (a1 >> 62) {
    goto LABEL_14;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    uint64_t result = _swiftEmptyArrayStorage;
    if (!v2) {
      break;
    }
    uint64_t result = (void *)sub_100041B30();
    if (v2 < 0)
    {
      __break(1u);
      return result;
    }
    uint64_t v4 = 0;
    while (v2 != v4)
    {
      if ((a1 & 0xC000000000000001) != 0) {
        uint64_t v5 = (char *)sub_100041AE0();
      }
      else {
        uint64_t v5 = (char *)*(id *)(a1 + 8 * v4 + 32);
      }
      unint64_t v6 = v5;
      ++v4;
      id v7 = *(id *)&v5[OBJC_IVAR___MPVisualMessage_vmMessage];

      sub_100041B10();
      sub_100041B40();
      sub_100041B50();
      sub_100041B20();
      if (v2 == v4) {
        return _swiftEmptyArrayStorage;
      }
    }
    __break(1u);
LABEL_14:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_100041BA0();
    swift_bridgeObjectRelease();
  }
  return result;
}

void *sub_100039E28(unint64_t a1)
{
  if (a1 >> 62) {
    goto LABEL_14;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    uint64_t result = _swiftEmptyArrayStorage;
    if (!v2) {
      break;
    }
    uint64_t v11 = _swiftEmptyArrayStorage;
    uint64_t result = (void *)sub_100041B30();
    if (v2 < 0)
    {
      __break(1u);
      return result;
    }
    uint64_t v4 = 0;
    while (v2 != v4)
    {
      if ((a1 & 0xC000000000000001) != 0) {
        id v5 = (id)sub_100041AE0();
      }
      else {
        id v5 = *(id *)(a1 + 8 * v4 + 32);
      }
      unint64_t v6 = v5;
      ++v4;
      id v7 = (objc_class *)type metadata accessor for VisualMessage();
      uint64_t v8 = (char *)objc_allocWithZone(v7);
      *(void *)&v8[OBJC_IVAR___MPVisualMessage_vmMessage] = v6;
      v10.receiver = v8;
      v10.super_class = v7;
      id v9 = v6;
      [super init];

      sub_100041B10();
      sub_100041B40();
      sub_100041B50();
      sub_100041B20();
      if (v2 == v4) {
        return v11;
      }
    }
    __break(1u);
LABEL_14:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_100041BA0();
    swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_100039FA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000418B0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_1000418A0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_100038704(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_100041850();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  type metadata accessor for CachedVoicemailManager.Cache();
  return swift_task_create();
}

uint64_t sub_10003A150(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000418B0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_1000418A0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_100038704(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_100041850();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

void *sub_10003A2F4(unint64_t a1)
{
  unint64_t v1 = a1;
  if (a1 >> 62) {
    goto LABEL_24;
  }
  sub_100041B30();
  uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (v2)
  {
    if ((v1 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; ; ++i)
      {
        uint64_t v4 = (void *)sub_100041AE0();
        uint64_t v5 = i + 1;
        if (__OFADD__(i, 1)) {
          break;
        }
        uint64_t v6 = v4;
        if (object_getClass(v4) != (Class)_TtC37VoicemailMessageNotificationExtension9FTMessage
          || v6 == 0)
        {
          swift_unknownObjectRelease();
          goto LABEL_21;
        }
        sub_100041B10();
        sub_100041B40();
        sub_100041B50();
        sub_100041B20();
        if (v5 == v2) {
          return _swiftEmptyArrayStorage;
        }
      }
      __break(1u);
    }
    else
    {
      uint64_t v8 = 0;
      id v9 = (char *)(v1 + 32);
      while (1)
      {
        uint64_t v10 = v8 + 1;
        if (__OFADD__(v8, 1)) {
          break;
        }
        unint64_t v1 = *(void *)&v9[8 * v8];
        if (object_getClass((id)v1) != (Class)_TtC37VoicemailMessageNotificationExtension9FTMessage
          || v1 == 0)
        {
LABEL_21:
          swift_release();
          return 0;
        }
        swift_unknownObjectRetain();
        sub_100041B10();
        sub_100041B40();
        sub_100041B50();
        sub_100041B20();
        ++v8;
        if (v10 == v2) {
          return _swiftEmptyArrayStorage;
        }
      }
    }
    __break(1u);
LABEL_24:
    swift_bridgeObjectRetain();
    sub_100041BA0();
    swift_bridgeObjectRelease();
    sub_100041B30();
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_100041BA0();
    swift_bridgeObjectRelease();
  }
  return _swiftEmptyArrayStorage;
}

void *sub_10003A4D4(unint64_t a1)
{
  uint64_t v1 = a1;
  if (a1 >> 62) {
    goto LABEL_18;
  }
  sub_100041B30();
  uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (v2)
  {
    if ((v1 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; ; ++i)
      {
        sub_100041AE0();
        uint64_t v4 = i + 1;
        if (__OFADD__(i, 1)) {
          break;
        }
        type metadata accessor for VisualMessage();
        if (!swift_dynamicCastClass())
        {
          swift_unknownObjectRelease();
          goto LABEL_15;
        }
        sub_100041B10();
        sub_100041B40();
        sub_100041B50();
        sub_100041B20();
        if (v4 == v2) {
          return _swiftEmptyArrayStorage;
        }
      }
      __break(1u);
    }
    else
    {
      for (uint64_t j = 0; ; ++j)
      {
        uint64_t v6 = j + 1;
        if (__OFADD__(j, 1)) {
          break;
        }
        type metadata accessor for VisualMessage();
        uint64_t v7 = swift_dynamicCastClass();
        if (!v7)
        {
LABEL_15:
          swift_release();
          return 0;
        }
        uint64_t v1 = v7;
        swift_unknownObjectRetain();
        sub_100041B10();
        sub_100041B40();
        sub_100041B50();
        sub_100041B20();
        if (v6 == v2) {
          return _swiftEmptyArrayStorage;
        }
      }
    }
    __break(1u);
LABEL_18:
    swift_bridgeObjectRetain();
    sub_100041BA0();
    swift_bridgeObjectRelease();
    sub_100041B30();
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_100041BA0();
    swift_bridgeObjectRelease();
  }
  return _swiftEmptyArrayStorage;
}

char *sub_10003A6E0(void *a1, uint64_t a2, uint64_t a3)
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v8 = OBJC_IVAR____TtC37VoicemailMessageNotificationExtension22VisualVoicemailManager_messagesChangedPublisher;
  sub_100016F7C(&qword_100069548);
  swift_allocObject();
  id v9 = v3;
  *(void *)&v3[v8] = sub_1000416F0();
  *(void *)&v9[OBJC_IVAR____TtC37VoicemailMessageNotificationExtension22VisualVoicemailManager_visualVoicemailManager] = a1;
  uint64_t v10 = &v9[OBJC_IVAR____TtC37VoicemailMessageNotificationExtension22VisualVoicemailManager_onVoicemailsChanged];
  *(void *)uint64_t v10 = a2;
  *((void *)v10 + 1) = a3;
  id v11 = a1;
  swift_retain();

  v17.receiver = v9;
  v17.super_class = ObjectType;
  uint64_t v12 = (char *)[super init];
  BOOL v13 = *(void **)&v12[OBJC_IVAR____TtC37VoicemailMessageNotificationExtension22VisualVoicemailManager_visualVoicemailManager];
  unint64_t v14 = v12;
  id v15 = v13;
  [v15 setDelegate:v14];

  swift_release();
  return v14;
}

uint64_t sub_10003A864(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  *(unsigned char *)(v6 + 25) = a6;
  *(void *)(v6 + 32) = a4;
  *(void *)(v6 + 40) = a5;
  type metadata accessor for VoicemailActor();
  swift_initStaticObject();
  sub_10003F0FC();
  uint64_t v8 = sub_100041850();
  return _swift_task_switch(sub_10003A900, v8, v7);
}

uint64_t sub_10003A900()
{
  char v1 = *(unsigned char *)(v0 + 25);
  uint64_t v2 = *(void *)(v0 + 40);
  (*(void (**)(void))(*(void *)(v0 + 32)
                    + OBJC_IVAR____TtC37VoicemailMessageNotificationExtension22VisualVoicemailManager_onVoicemailsChanged))();
  *(void *)(v0 + 16) = v2;
  *(unsigned char *)(v0 + 24) = v1;
  sub_1000416E0();
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_10003A99C()
{
  *(void *)(v1 + 40) = v0;
  type metadata accessor for VoicemailActor();
  swift_initStaticObject();
  sub_10003F0FC();
  uint64_t v3 = sub_100041850();
  return _swift_task_switch(sub_10003AA34, v3, v2);
}

uint64_t sub_10003AA34()
{
  id v24 = v0;
  p_super_class = &v0[2].super_class;
  id v2 = [*(id *)((char *)v0[2].super_class+ OBJC_IVAR____TtC37VoicemailMessageNotificationExtension22VisualVoicemailManager_visualVoicemailManager) allVoicemails];
  sub_10003F8BC();
  unint64_t v3 = sub_1000417F0();

  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_100041BA0();
    swift_bridgeObjectRelease();
    unint64_t v22 = &v0[2].super_class;
    if (v4) {
      goto LABEL_3;
    }
LABEL_11:
    swift_bridgeObjectRelease();
    unint64_t v11 = (unint64_t)_swiftEmptyArrayStorage;
    goto LABEL_12;
  }
  uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  unint64_t v22 = &v0[2].super_class;
  if (!v4) {
    goto LABEL_11;
  }
LABEL_3:
  uint64_t v23 = _swiftEmptyArrayStorage;
  uint64_t result = sub_100041B30();
  if (v4 < 0)
  {
    __break(1u);
    return result;
  }
  uint64_t v6 = 0;
  do
  {
    if ((v3 & 0xC000000000000001) != 0) {
      id v7 = (id)sub_100041AE0();
    }
    else {
      id v7 = *(id *)(v3 + 8 * v6 + 32);
    }
    id v8 = v7;
    ++v6;
    id v9 = (objc_class *)type metadata accessor for VisualMessage();
    uint64_t v10 = (char *)objc_allocWithZone(v9);
    *(void *)&v10[OBJC_IVAR___MPVisualMessage_vmMessage] = v8;
    v0[1].receiver = v10;
    v0[1].super_class = v9;
    [super init];
    sub_100041B10();
    sub_100041B40();
    sub_100041B50();
    sub_100041B20();
  }
  while (v4 != v6);
  unint64_t v11 = (unint64_t)v23;
  swift_bridgeObjectRelease();
  p_super_class = v22;
LABEL_12:
  if (qword_100068448 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_1000416D0();
  sub_10001F3C4(v12, (uint64_t)qword_10006A268);
  swift_bridgeObjectRetain_n();
  BOOL v13 = sub_1000416B0();
  os_log_type_t v14 = sub_100041940();
  if (os_log_type_enabled(v13, v14))
  {
    id v15 = (uint64_t *)(p_super_class - 1);
    uint64_t v16 = (uint8_t *)swift_slowAlloc();
    uint64_t v23 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v16 = 136315138;
    type metadata accessor for VisualMessage();
    swift_bridgeObjectRetain();
    uint64_t v17 = sub_100041800();
    unint64_t v19 = v18;
    swift_bridgeObjectRelease();
    uint64_t *v15 = sub_10001F3FC(v17, v19, (uint64_t *)&v23);
    sub_1000419E0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "Fetched %s from VMD", v16, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  swift_bridgeObjectRetain();
  if (v11 >> 62)
  {
    sub_100016F7C(&qword_1000687E0);
    uint64_t v20 = sub_100041B90();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_100041C50();
    uint64_t v20 = v11;
  }
  swift_bridgeObjectRelease();
  super_class = (uint64_t (*)(uint64_t))v0->super_class;
  return super_class(v20);
}

uint64_t sub_10003AF84(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  type metadata accessor for VoicemailActor();
  swift_initStaticObject();
  sub_10003F0FC();
  uint64_t v4 = sub_100041850();
  return _swift_task_switch(sub_10003B01C, v4, v3);
}

uint64_t sub_10003B01C()
{
  uint64_t v1 = *(void **)(v0 + 24);
  *(void *)(v0 + 32) = _Block_copy(*(const void **)(v0 + 16));
  id v2 = v1;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 40) = v3;
  void *v3 = v0;
  v3[1] = sub_10003B0C0;
  return sub_10003A99C();
}

uint64_t sub_10003B0C0()
{
  uint64_t v1 = *(void (***)(void, void))(*v0 + 32);
  id v2 = *(void **)(*v0 + 24);
  uint64_t v6 = *v0;
  swift_task_dealloc();

  sub_100016F7C(&qword_1000687E0);
  Class isa = sub_1000417E0().super.isa;
  swift_bridgeObjectRelease();
  ((void (**)(void, Class))v1)[2](v1, isa);

  _Block_release(v1);
  uint64_t v4 = *(uint64_t (**)(void))(v6 + 8);
  return v4();
}

uint64_t sub_10003B230(uint64_t a1)
{
  v2[4] = a1;
  void v2[5] = v1;
  uint64_t v3 = sub_1000416D0();
  v2[6] = v3;
  v2[7] = *(void *)(v3 - 8);
  v2[8] = swift_task_alloc();
  type metadata accessor for VoicemailActor();
  swift_initStaticObject();
  sub_10003F0FC();
  uint64_t v5 = sub_100041850();
  return _swift_task_switch(sub_10003B324, v5, v4);
}

uint64_t sub_10003B324()
{
  uint64_t v21 = v0;
  uint64_t v1 = sub_10003A4D4(v0[4]);
  if (v1)
  {
    id v2 = *(void **)(v0[5]
                  + OBJC_IVAR____TtC37VoicemailMessageNotificationExtension22VisualVoicemailManager_visualVoicemailManager);
    sub_100039CE4((unint64_t)v1);
    swift_bridgeObjectRelease();
    sub_10003F8BC();
    Class isa = sub_1000417E0().super.isa;
    swift_bridgeObjectRelease();
    id v4 = [v2 deleteVoicemails:isa];
  }
  else
  {
    if (qword_100068448 != -1) {
      swift_once();
    }
    uint64_t v6 = v0[7];
    uint64_t v5 = v0[8];
    uint64_t v7 = v0[6];
    uint64_t v8 = sub_10001F3C4(v7, (uint64_t)qword_10006A268);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v5, v8, v7);
    swift_bridgeObjectRetain();
    id v9 = sub_1000416B0();
    os_log_type_t v10 = sub_100041920();
    BOOL v11 = os_log_type_enabled(v9, v10);
    uint64_t v13 = v0[7];
    uint64_t v12 = v0[8];
    uint64_t v14 = v0[6];
    if (v11)
    {
      uint64_t v19 = v0[8];
      uint64_t v18 = v0[6];
      id v15 = (uint8_t *)swift_slowAlloc();
      uint64_t v20 = swift_slowAlloc();
      *(_DWORD *)id v15 = 136446210;
      v0[2] = sub_10001F3FC(0x654D3C7961727241, 0xEE003E6567617373, &v20);
      sub_1000419E0();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "Incorrect type passed into VisualVoicemailManager %{public}s but expected VisualMessage!", v15, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v19, v18);
    }
    else
    {
      swift_bridgeObjectRelease();

      (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
    }
  }
  swift_task_dealloc();
  uint64_t v16 = (uint64_t (*)(void))v0[1];
  return v16();
}

uint64_t sub_10003B760(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  type metadata accessor for VoicemailActor();
  swift_initStaticObject();
  sub_10003F0FC();
  uint64_t v5 = sub_100041850();
  return _swift_task_switch(sub_10003B7FC, v5, v4);
}

uint64_t sub_10003B7FC()
{
  uint64_t v1 = *(void **)(v0 + 32);
  *(void *)(v0 + 40) = _Block_copy(*(const void **)(v0 + 24));
  sub_100016F7C(&qword_1000687E0);
  uint64_t v2 = sub_1000417F0();
  *(void *)(v0 + 48) = v2;
  id v3 = v1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_1000406F0;
  return sub_10003B230(v2);
}

uint64_t sub_10003B8D0(uint64_t a1)
{
  v2[4] = a1;
  void v2[5] = v1;
  uint64_t v3 = sub_1000416D0();
  v2[6] = v3;
  v2[7] = *(void *)(v3 - 8);
  v2[8] = swift_task_alloc();
  type metadata accessor for VoicemailActor();
  swift_initStaticObject();
  sub_10003F0FC();
  uint64_t v5 = sub_100041850();
  return _swift_task_switch(sub_10003B9C4, v5, v4);
}

uint64_t sub_10003B9C4()
{
  uint64_t v21 = v0;
  uint64_t v1 = sub_10003A4D4(v0[4]);
  if (v1)
  {
    uint64_t v2 = *(void **)(v0[5]
                  + OBJC_IVAR____TtC37VoicemailMessageNotificationExtension22VisualVoicemailManager_visualVoicemailManager);
    sub_100039CE4((unint64_t)v1);
    swift_bridgeObjectRelease();
    sub_10003F8BC();
    Class isa = sub_1000417E0().super.isa;
    swift_bridgeObjectRelease();
    id v4 = [v2 markVoicemailsAsRead:isa];
  }
  else
  {
    if (qword_100068448 != -1) {
      swift_once();
    }
    uint64_t v6 = v0[7];
    uint64_t v5 = v0[8];
    uint64_t v7 = v0[6];
    uint64_t v8 = sub_10001F3C4(v7, (uint64_t)qword_10006A268);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v5, v8, v7);
    swift_bridgeObjectRetain();
    id v9 = sub_1000416B0();
    os_log_type_t v10 = sub_100041920();
    BOOL v11 = os_log_type_enabled(v9, v10);
    uint64_t v13 = v0[7];
    uint64_t v12 = v0[8];
    uint64_t v14 = v0[6];
    if (v11)
    {
      uint64_t v19 = v0[8];
      uint64_t v18 = v0[6];
      id v15 = (uint8_t *)swift_slowAlloc();
      uint64_t v20 = swift_slowAlloc();
      *(_DWORD *)id v15 = 136446210;
      v0[2] = sub_10001F3FC(0x654D3C7961727241, 0xEE003E6567617373, &v20);
      sub_1000419E0();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "Incorrect type passed into VisualVoicemailManager %{public}s but expected VisualMessage!", v15, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v19, v18);
    }
    else
    {
      swift_bridgeObjectRelease();

      (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
    }
  }
  swift_task_dealloc();
  uint64_t v16 = (uint64_t (*)(void))v0[1];
  return v16();
}

uint64_t sub_10003BE00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  type metadata accessor for VoicemailActor();
  swift_initStaticObject();
  sub_10003F0FC();
  uint64_t v5 = sub_100041850();
  return _swift_task_switch(sub_10003BE9C, v5, v4);
}

uint64_t sub_10003BE9C()
{
  uint64_t v1 = *(void **)(v0 + 32);
  *(void *)(v0 + 40) = _Block_copy(*(const void **)(v0 + 24));
  sub_100016F7C(&qword_1000687E0);
  uint64_t v2 = sub_1000417F0();
  *(void *)(v0 + 48) = v2;
  id v3 = v1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_10003BF70;
  return sub_10003B8D0(v2);
}

uint64_t sub_10003BF70()
{
  uint64_t v1 = *(void (***)(void))(*v0 + 40);
  uint64_t v2 = *(void **)(*v0 + 32);
  uint64_t v5 = *v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();

  v1[2](v1);
  _Block_release(v1);
  id v3 = *(uint64_t (**)(void))(v5 + 8);
  return v3();
}

uint64_t sub_10003C0CC(uint64_t a1)
{
  v2[4] = a1;
  void v2[5] = v1;
  uint64_t v3 = sub_1000416D0();
  v2[6] = v3;
  v2[7] = *(void *)(v3 - 8);
  v2[8] = swift_task_alloc();
  type metadata accessor for VoicemailActor();
  swift_initStaticObject();
  sub_10003F0FC();
  uint64_t v5 = sub_100041850();
  return _swift_task_switch(sub_10003C1C0, v5, v4);
}

uint64_t sub_10003C1C0()
{
  uint64_t v21 = v0;
  uint64_t v1 = sub_10003A4D4(v0[4]);
  if (v1)
  {
    uint64_t v2 = *(void **)(v0[5]
                  + OBJC_IVAR____TtC37VoicemailMessageNotificationExtension22VisualVoicemailManager_visualVoicemailManager);
    sub_100039CE4((unint64_t)v1);
    swift_bridgeObjectRelease();
    sub_10003F8BC();
    Class isa = sub_1000417E0().super.isa;
    swift_bridgeObjectRelease();
    id v4 = [v2 trashVoicemails:isa];
  }
  else
  {
    if (qword_100068448 != -1) {
      swift_once();
    }
    uint64_t v6 = v0[7];
    uint64_t v5 = v0[8];
    uint64_t v7 = v0[6];
    uint64_t v8 = sub_10001F3C4(v7, (uint64_t)qword_10006A268);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v5, v8, v7);
    swift_bridgeObjectRetain();
    id v9 = sub_1000416B0();
    os_log_type_t v10 = sub_100041920();
    BOOL v11 = os_log_type_enabled(v9, v10);
    uint64_t v13 = v0[7];
    uint64_t v12 = v0[8];
    uint64_t v14 = v0[6];
    if (v11)
    {
      uint64_t v19 = v0[8];
      uint64_t v18 = v0[6];
      id v15 = (uint8_t *)swift_slowAlloc();
      uint64_t v20 = swift_slowAlloc();
      *(_DWORD *)id v15 = 136446210;
      v0[2] = sub_10001F3FC(0x654D3C7961727241, 0xEE003E6567617373, &v20);
      sub_1000419E0();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "Incorrect type passed into VisualVoicemailManager %{public}s but expected VisualMessage!", v15, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v19, v18);
    }
    else
    {
      swift_bridgeObjectRelease();

      (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
    }
  }
  swift_task_dealloc();
  uint64_t v16 = (uint64_t (*)(void))v0[1];
  return v16();
}

uint64_t sub_10003C5FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  type metadata accessor for VoicemailActor();
  swift_initStaticObject();
  sub_10003F0FC();
  uint64_t v5 = sub_100041850();
  return _swift_task_switch(sub_10003C698, v5, v4);
}

uint64_t sub_10003C698()
{
  uint64_t v1 = *(void **)(v0 + 32);
  *(void *)(v0 + 40) = _Block_copy(*(const void **)(v0 + 24));
  sub_100016F7C(&qword_1000687E0);
  uint64_t v2 = sub_1000417F0();
  *(void *)(v0 + 48) = v2;
  id v3 = v1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_1000406F0;
  return sub_10003C0CC(v2);
}

uint64_t sub_10003C76C(uint64_t a1)
{
  v2[4] = a1;
  void v2[5] = v1;
  uint64_t v3 = sub_1000416D0();
  v2[6] = v3;
  v2[7] = *(void *)(v3 - 8);
  v2[8] = swift_task_alloc();
  type metadata accessor for VoicemailActor();
  swift_initStaticObject();
  sub_10003F0FC();
  uint64_t v5 = sub_100041850();
  return _swift_task_switch(sub_10003C860, v5, v4);
}

uint64_t sub_10003C860()
{
  uint64_t v21 = v0;
  uint64_t v1 = sub_10003A4D4(v0[4]);
  if (v1)
  {
    uint64_t v2 = *(void **)(v0[5]
                  + OBJC_IVAR____TtC37VoicemailMessageNotificationExtension22VisualVoicemailManager_visualVoicemailManager);
    sub_100039CE4((unint64_t)v1);
    swift_bridgeObjectRelease();
    sub_10003F8BC();
    Class isa = sub_1000417E0().super.isa;
    swift_bridgeObjectRelease();
    id v4 = [v2 removeVoicemailsFromTrash:isa];
  }
  else
  {
    if (qword_100068448 != -1) {
      swift_once();
    }
    uint64_t v6 = v0[7];
    uint64_t v5 = v0[8];
    uint64_t v7 = v0[6];
    uint64_t v8 = sub_10001F3C4(v7, (uint64_t)qword_10006A268);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v5, v8, v7);
    swift_bridgeObjectRetain();
    id v9 = sub_1000416B0();
    os_log_type_t v10 = sub_100041920();
    BOOL v11 = os_log_type_enabled(v9, v10);
    uint64_t v13 = v0[7];
    uint64_t v12 = v0[8];
    uint64_t v14 = v0[6];
    if (v11)
    {
      uint64_t v19 = v0[8];
      uint64_t v18 = v0[6];
      id v15 = (uint8_t *)swift_slowAlloc();
      uint64_t v20 = swift_slowAlloc();
      *(_DWORD *)id v15 = 136446210;
      v0[2] = sub_10001F3FC(0x654D3C7961727241, 0xEE003E6567617373, &v20);
      sub_1000419E0();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "Incorrect type passed into VisualVoicemailManager %{public}s but expected VisualMessage!", v15, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v19, v18);
    }
    else
    {
      swift_bridgeObjectRelease();

      (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
    }
  }
  swift_task_dealloc();
  uint64_t v16 = (uint64_t (*)(void))v0[1];
  return v16();
}

uint64_t sub_10003CC9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  type metadata accessor for VoicemailActor();
  swift_initStaticObject();
  sub_10003F0FC();
  uint64_t v5 = sub_100041850();
  return _swift_task_switch(sub_10003CD38, v5, v4);
}

uint64_t sub_10003CD38()
{
  uint64_t v1 = *(void **)(v0 + 32);
  *(void *)(v0 + 40) = _Block_copy(*(const void **)(v0 + 24));
  sub_100016F7C(&qword_1000687E0);
  uint64_t v2 = sub_1000417F0();
  *(void *)(v0 + 48) = v2;
  id v3 = v1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_1000406F0;
  return sub_10003C76C(v2);
}

uint64_t sub_10003CE0C(uint64_t a1)
{
  void v2[5] = a1;
  v2[6] = v1;
  v2[7] = type metadata accessor for MessageID.Value(0);
  v2[8] = swift_task_alloc();
  type metadata accessor for VoicemailActor();
  swift_initStaticObject();
  sub_10003F0FC();
  uint64_t v4 = sub_100041850();
  return _swift_task_switch(sub_10003CED4, v4, v3);
}

uint64_t sub_10003CED4()
{
  uint64_t v1 = (void **)(v0 + 40);
  sub_10001A9F0(*(void *)(v0 + 40) + OBJC_IVAR___MPMessageID_value, *(void *)(v0 + 64));
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  uint64_t v3 = *(void **)(v0 + 64);
  if (EnumCaseMultiPayload == 1)
  {
    sub_100019C08((uint64_t)v3);
    if (qword_100068448 != -1) {
      swift_once();
    }
    uint64_t v4 = *v1;
    uint64_t v5 = sub_1000416D0();
    sub_10001F3C4(v5, (uint64_t)qword_10006A268);
    id v6 = v4;
    uint64_t v7 = sub_1000416B0();
    os_log_type_t v8 = sub_100041920();
    BOOL v9 = os_log_type_enabled(v7, v8);
    os_log_type_t v10 = *v1;
    if (v9)
    {
      BOOL v11 = (uint8_t *)swift_slowAlloc();
      uint64_t v18 = (void *)swift_slowAlloc();
      *(_DWORD *)BOOL v11 = 138412290;
      *(void *)(v0 + 32) = v10;
      id v12 = v10;
      sub_1000419E0();
      void *v18 = v10;

      _os_log_impl((void *)&_mh_execute_header, v7, v8, "Incorrect id passed into VisualVoicemailManager %@, privacy: .public) but expected a VisualMessage ID!", v11, 0xCu);
      sub_100016F7C(&qword_100068AD0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    id v13 = 0;
  }
  else
  {
    id v13 = [*(id *)(*(void *)(v0 + 48)+ OBJC_IVAR____TtC37VoicemailMessageNotificationExtension22VisualVoicemailManager_visualVoicemailManager) voicemailWithIdentifier:*v3];
    if (v13)
    {
      uint64_t v14 = (objc_class *)type metadata accessor for VisualMessage();
      id v15 = (char *)objc_allocWithZone(v14);
      *(void *)&v15[OBJC_IVAR___MPVisualMessage_vmMessage] = v13;
      *(void *)(v0 + 16) = v15;
      *(void *)(v0 + 24) = v14;
      [v0 init];
    }
  }
  swift_task_dealloc();
  uint64_t v16 = *(uint64_t (**)(id))(v0 + 8);
  return v16(v13);
}

uint64_t sub_10003D2E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  type metadata accessor for VoicemailActor();
  swift_initStaticObject();
  sub_10003F0FC();
  uint64_t v5 = sub_100041850();
  return _swift_task_switch(sub_10003D37C, v5, v4);
}

uint64_t sub_10003D37C()
{
  uint64_t v1 = *(void **)(v0 + 32);
  uint64_t v2 = *(void **)(v0 + 16);
  *(void *)(v0 + 40) = _Block_copy(*(const void **)(v0 + 24));
  id v3 = v2;
  id v4 = v1;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 48) = v5;
  void *v5 = v0;
  v5[1] = sub_10003D438;
  uint64_t v6 = *(void *)(v0 + 16);
  return sub_10003CE0C(v6);
}

uint64_t sub_10003D438(uint64_t a1)
{
  id v3 = *(void (***)(void, void))(*v1 + 40);
  id v4 = *(void **)(*v1 + 32);
  uint64_t v5 = *(void **)(*v1 + 16);
  uint64_t v8 = *v1;
  swift_task_dealloc();

  v3[2](v3, a1);
  _Block_release(v3);
  swift_unknownObjectRelease();
  uint64_t v6 = *(uint64_t (**)(void))(v8 + 8);
  return v6();
}

uint64_t sub_10003D5A0(uint64_t a1, uint64_t a2)
{
  v3[10] = a2;
  v3[11] = v2;
  v3[9] = a1;
  type metadata accessor for VoicemailActor();
  swift_initStaticObject();
  sub_10003F0FC();
  uint64_t v5 = sub_100041850();
  return _swift_task_switch(sub_10003D63C, v5, v4);
}

uint64_t sub_10003D63C()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = v0[9];
  id v3 = *(void **)(v0[11]
                + OBJC_IVAR____TtC37VoicemailMessageNotificationExtension22VisualVoicemailManager_visualVoicemailManager);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v2;
  *(void *)(v4 + 24) = v1;
  v0[6] = sub_10003FE8C;
  v0[7] = v4;
  v0[2] = _NSConcreteStackBlock;
  v0[3] = 1107296256;
  v0[4] = sub_10003D83C;
  v0[5] = &unk_10005E520;
  uint64_t v5 = _Block_copy(v0 + 2);
  swift_retain();
  swift_release();
  id v6 = [v3 voicemailsPassingTest:v5];
  _Block_release(v5);
  sub_10003F8BC();
  unint64_t v7 = sub_1000417F0();

  uint64_t v8 = sub_100039E28(v7);
  swift_bridgeObjectRelease();
  uint64_t v9 = (uint64_t (*)(void *))v0[1];
  return v9(v8);
}

uint64_t sub_10003D7B0(void *a1, uint64_t (*a2)(id, uint64_t))
{
  uint64_t v4 = (objc_class *)type metadata accessor for VisualMessage();
  uint64_t v5 = (char *)objc_allocWithZone(v4);
  *(void *)&v5[OBJC_IVAR___MPVisualMessage_vmMessage] = a1;
  v10.receiver = v5;
  v10.super_class = v4;
  id v6 = a1;
  [super init];
  LOBYTE(a2) = a2(v7, v8);

  return a2 & 1;
}

uint64_t sub_10003D83C(uint64_t a1, void *a2)
{
  id v3 = *(uint64_t (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  LOBYTE(v3) = v3();
  swift_release();

  return v3 & 1;
}

uint64_t sub_10003DA18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  type metadata accessor for VoicemailActor();
  swift_initStaticObject();
  sub_10003F0FC();
  uint64_t v5 = sub_100041850();
  return _swift_task_switch(sub_10003DAB4, v5, v4);
}

uint64_t sub_10003DAB4()
{
  uint64_t v1 = *(const void **)(v0 + 24);
  uint64_t v2 = *(void **)(v0 + 32);
  id v3 = _Block_copy(*(const void **)(v0 + 16));
  *(void *)(v0 + 40) = _Block_copy(v1);
  uint64_t v4 = swift_allocObject();
  *(void *)(v0 + 48) = v4;
  *(void *)(v4 + 16) = v3;
  id v5 = v2;
  id v6 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v6;
  *id v6 = v0;
  v6[1] = sub_10003DBA8;
  return sub_10003D5A0((uint64_t)sub_10003FE64, v4);
}

uint64_t sub_10003DBA8()
{
  uint64_t v1 = *(void (***)(void, void))(*v0 + 40);
  uint64_t v2 = *(void **)(*v0 + 32);
  uint64_t v6 = *v0;
  swift_task_dealloc();
  swift_release();

  sub_100016F7C(&qword_1000687E0);
  Class isa = sub_1000417E0().super.isa;
  swift_bridgeObjectRelease();
  ((void (**)(void, Class))v1)[2](v1, isa);

  _Block_release(v1);
  uint64_t v4 = *(uint64_t (**)(void))(v6 + 8);
  return v4();
}

uint64_t type metadata accessor for VisualVoicemailManager()
{
  return self;
}

uint64_t sub_10003DDE8(uint64_t a1)
{
  uint64_t v3 = sub_100016F7C((uint64_t *)&unk_100069380);
  __chkstk_darwin(v3 - 8);
  id v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100041250();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100068448 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_1000416D0();
  sub_10001F3C4(v10, (uint64_t)qword_10006A268);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, v6);
  id v11 = v1;
  id v12 = sub_1000416B0();
  os_log_type_t v13 = sub_100041910();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = swift_slowAlloc();
    id v27 = v5;
    uint64_t v15 = v14;
    uint64_t v29 = swift_slowAlloc();
    *(_DWORD *)uint64_t v15 = 136315394;
    swift_getObjectType();
    uint64_t v16 = sub_100041CF0();
    uint64_t v28 = sub_10001F3FC(v16, v17, &v29);
    sub_1000419E0();

    swift_bridgeObjectRelease();
    *(_WORD *)(v15 + 12) = 2080;
    uint64_t v28 = sub_100041240();
    type metadata accessor for Name(0);
    uint64_t v18 = sub_100041780();
    uint64_t v28 = sub_10001F3FC(v18, v19, &v29);
    sub_1000419E0();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "%s is handling %s", (uint8_t *)v15, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    id v5 = v27;
    swift_slowDealloc();
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }

  uint64_t v20 = sub_1000418B0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v5, 1, 1, v20);
  type metadata accessor for VoicemailActor();
  id v21 = v11;
  uint64_t inited = swift_initStaticObject();
  unint64_t v23 = sub_10003F0FC();
  uint64_t v24 = swift_allocObject();
  *(void *)(v24 + 16) = inited;
  *(void *)(v24 + 24) = v23;
  *(void *)(v24 + 32) = v21;
  *(void *)(v24 + 40) = 0;
  *(unsigned char *)(v24 + 48) = 3;
  sub_10003A150((uint64_t)v5, (uint64_t)&unk_100069420, v24);
  return swift_release();
}

uint64_t sub_10003E2A4(char a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v9 = sub_100016F7C((uint64_t *)&unk_100069380);
  __chkstk_darwin(v9 - 8);
  id v11 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100068448 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_1000416D0();
  sub_10001F3C4(v12, (uint64_t)qword_10006A268);
  swift_bridgeObjectRetain_n();
  id v13 = v4;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  id v14 = v13;
  uint64_t v15 = sub_1000416B0();
  int v16 = sub_100041910();
  if (os_log_type_enabled(v15, (os_log_type_t)v16))
  {
    NSString v30 = v15;
    NSString v31 = v11;
    int v33 = v16;
    uint64_t v17 = swift_slowAlloc();
    uint64_t v32 = swift_slowAlloc();
    uint64_t v35 = v32;
    *(_DWORD *)uint64_t v17 = 136316162;
    swift_getObjectType();
    uint64_t v18 = sub_100041CF0();
    uint64_t v34 = sub_10001F3FC(v18, v19, &v35);
    sub_1000419E0();

    swift_bridgeObjectRelease();
    *(_WORD *)(v17 + 12) = 1024;
    LODWORD(v34) = a1 & 1;
    sub_1000419E0();
    *(_WORD *)(v17 + 18) = 2048;
    if (a3)
    {
      if (a3 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v20 = sub_100041BA0();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v20 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      id v11 = v31;
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v20 = 0;
      id v11 = v31;
    }
    uint64_t v34 = v20;
    sub_1000419E0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v17 + 28) = 2048;
    if (a4)
    {
      id v21 = v30;
      if (a4 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v22 = sub_100041BA0();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v22 = *(void *)((a4 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v22 = 0;
      id v21 = v30;
    }
    uint64_t v34 = v22;
    sub_1000419E0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v17 + 38) = 2048;
    if (a2)
    {
      if (a2 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v23 = sub_100041BA0();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v23 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v23 = 0;
    }
    uint64_t v34 = v23;
    sub_1000419E0();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v21, (os_log_type_t)v33, "%s voicemailsDidChangeInitial: %{BOOL}d added: %ld, deleted: %ld, updated: %ld", (uint8_t *)v17, 0x30u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  uint64_t v24 = sub_1000418B0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v11, 1, 1, v24);
  type metadata accessor for VoicemailActor();
  id v25 = v14;
  uint64_t inited = swift_initStaticObject();
  unint64_t v27 = sub_10003F0FC();
  uint64_t v28 = swift_allocObject();
  *(void *)(v28 + 16) = inited;
  *(void *)(v28 + 24) = v27;
  *(void *)(v28 + 32) = v25;
  *(void *)(v28 + 40) = 0;
  *(unsigned char *)(v28 + 48) = 3;
  sub_10003A150((uint64_t)v11, (uint64_t)&unk_100069418, v28);
  return swift_release();
}

void sub_10003EA24(const char *a1)
{
  if (qword_100068448 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_1000416D0();
  sub_10001F3C4(v3, (uint64_t)qword_10006A268);
  id v9 = v1;
  uint64_t v4 = sub_1000416B0();
  os_log_type_t v5 = sub_100041910();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 136315138;
    swift_getObjectType();
    uint64_t v7 = sub_100041CF0();
    sub_10001F3FC(v7, v8, &v10);
    sub_1000419E0();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v4, v5, a1, v6, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
}

uint64_t sub_10003EC54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  type metadata accessor for VoicemailActor();
  swift_initStaticObject();
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v7;
  *uint64_t v7 = v5;
  v7[1] = sub_100029E9C;
  return sub_10003B230(a5);
}

uint64_t sub_10003ED24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  type metadata accessor for VoicemailActor();
  swift_initStaticObject();
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v7;
  *uint64_t v7 = v5;
  v7[1] = sub_100029E9C;
  return sub_10003B8D0(a5);
}

uint64_t sub_10003EDF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  type metadata accessor for VoicemailActor();
  swift_initStaticObject();
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v7;
  *uint64_t v7 = v5;
  v7[1] = sub_100029E9C;
  return sub_10003C0CC(a5);
}

uint64_t sub_10003EEC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  type metadata accessor for VoicemailActor();
  swift_initStaticObject();
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v7;
  *uint64_t v7 = v5;
  v7[1] = sub_100029E9C;
  return sub_10003C76C(a5);
}

uint64_t sub_10003EF94(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7 = sub_100016F7C((uint64_t *)&unk_100069380);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100016F7C(&qword_1000687E0);
  uint64_t v10 = sub_1000417F0();
  uint64_t v11 = sub_1000418B0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v9, 1, 1, v11);
  type metadata accessor for VoicemailActor();
  id v12 = a1;
  swift_bridgeObjectRetain();
  uint64_t inited = swift_initStaticObject();
  unint64_t v14 = sub_10003F0FC();
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = inited;
  v15[3] = v14;
  v15[4] = v12;
  v15[5] = v10;
  sub_10003A150((uint64_t)v9, a5, (uint64_t)v15);

  swift_bridgeObjectRelease();
  return swift_release();
}

unint64_t sub_10003F0FC()
{
  unint64_t result = qword_100068530;
  if (!qword_100068530)
  {
    type metadata accessor for VoicemailActor();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100068530);
  }
  return result;
}

uint64_t sub_10003F158(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  void *v8 = v2;
  v8[1] = sub_100029E9C;
  return sub_10003EEC4(a1, v4, v5, v7, v6);
}

uint64_t sub_10003F218(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_10003F2F4;
  return v6(a1);
}

uint64_t sub_10003F2F4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10003F3EC(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_100029E9C;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1000693A8 + dword_1000693A8);
  return v6(a1, v4);
}

uint64_t sub_10003F4A4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_100029E9C;
  return v6();
}

uint64_t sub_10003F570(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  void *v5 = v4;
  v5[1] = sub_100029E9C;
  return v7();
}

uint64_t sub_10003F63C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000418B0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_1000418A0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_100038704(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_100041850();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_10003F7E0(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_1000406F4;
  return v6(a1);
}

unint64_t sub_10003F8BC()
{
  unint64_t result = qword_1000693C0;
  if (!qword_1000693C0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, &qword_1000693C0);
  }
  return result;
}

uint64_t sub_10003F900(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  void *v8 = v2;
  v8[1] = sub_100029E9C;
  return sub_10003EDF4(a1, v4, v5, v7, v6);
}

uint64_t sub_10003F9C4(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  void *v8 = v2;
  v8[1] = sub_1000297A0;
  return sub_10003ED24(a1, v4, v5, v7, v6);
}

uint64_t sub_10003FA88()
{
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10003FAD0(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  void *v8 = v2;
  v8[1] = sub_100029E9C;
  return sub_10003EC54(a1, v4, v5, v7, v6);
}

uint64_t sub_10003FB94(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 32);
  uint64_t v7 = *(void *)(v1 + 40);
  char v8 = *(unsigned char *)(v1 + 48);
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *uint64_t v9 = v2;
  v9[1] = sub_100029E9C;
  return sub_10003A864(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_10003FC60()
{
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 49, 7);
}

uint64_t sub_10003FCA8()
{
  _Block_release(*(const void **)(v0 + 16));
  _Block_release(*(const void **)(v0 + 24));

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10003FCF0()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_100029E9C;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_100069428 + dword_100069428);
  return v6(v2, v3, v4);
}

uint64_t sub_10003FDAC(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_100029E9C;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100069458 + dword_100069458);
  return v6(a1, v4);
}

uint64_t sub_10003FE64()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_10003FE8C(void *a1)
{
  return sub_10003D7B0(a1, *(uint64_t (**)(id, uint64_t))(v1 + 16));
}

uint64_t sub_10003FE94(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10003FEA4()
{
  return swift_release();
}

uint64_t sub_10003FEB0()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_100029E9C;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_100069470 + dword_100069470);
  return v6(v2, v3, v4);
}

uint64_t sub_10003FF70()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_100029E9C;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_1000694A0 + dword_1000694A0);
  return v6(v2, v3, v4);
}

uint64_t sub_100040030()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_100029E9C;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_1000694C0 + dword_1000694C0);
  return v6(v2, v3, v4);
}

uint64_t sub_1000400F0()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_100029E9C;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_1000694E0 + dword_1000694E0);
  return v6(v2, v3, v4);
}

uint64_t sub_1000401B0()
{
  _Block_release(*(const void **)(v0 + 24));

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_1000401F8()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_100029E9C;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_100069500 + dword_100069500);
  return v6(v2, v3, v4);
}

uint64_t sub_1000402B4()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000402F4()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_100029E9C;
  uint64_t v5 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_100069520 + dword_100069520);
  return v5(v2, v3);
}

uint64_t sub_1000403A8()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000403E0(uint64_t a1, int *a2)
{
  *(void *)(v2 + 24) = a1;
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v2 + 32) = v3;
  void *v3 = v2;
  v3[1] = sub_1000404C0;
  return v5(v2 + 16);
}

uint64_t sub_1000404C0()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void **)(*v0 + 24);
  uint64_t v5 = *v0;
  swift_task_dealloc();
  *uint64_t v2 = *(void *)(v1 + 16);
  uint64_t v3 = *(uint64_t (**)(void))(v5 + 8);
  return v3();
}

uint64_t sub_1000405F0()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100040628(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_1000297A0;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100069550 + dword_100069550);
  return v6(a1, v4);
}

uint64_t sub_1000407E4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 16))();
}

uint64_t sub_100040988()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000409C0()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_1000409D0(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t sub_100040A20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_1000418B0();
  __chkstk_darwin(v8 - 8);
  uint64_t v19 = sub_100041610();
  uint64_t v20 = &off_10005DC30;
  v18[0] = a3;
  uint64_t v9 = OBJC_IVAR____TtC37VoicemailMessageNotificationExtension24FaceTimeVoicemailManager_logger;
  uint64_t v10 = qword_100068448;
  swift_retain();
  if (v10 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_1000416D0();
  uint64_t v12 = sub_10001F3C4(v11, (uint64_t)qword_10006A268);
  id v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16);
  v13(a4 + v9, v12, v11);
  v13(a4 + OBJC_IVAR____TtC37VoicemailMessageNotificationExtension24FaceTimeVoicemailManager_analyticsReporter, v12, v11);
  *(void *)(a4 + OBJC_IVAR____TtC37VoicemailMessageNotificationExtension24FaceTimeVoicemailManager_providers) = &off_10005D758;
  *(void *)(a4 + OBJC_IVAR____TtC37VoicemailMessageNotificationExtension24FaceTimeVoicemailManager_messageTypes) = &off_10005D788;
  uint64_t v14 = OBJC_IVAR____TtC37VoicemailMessageNotificationExtension24FaceTimeVoicemailManager_messagesChangedPublisher;
  sub_100016F7C(&qword_100069548);
  swift_allocObject();
  *(void *)(a4 + v14) = sub_1000416F0();
  uint64_t v15 = OBJC_IVAR____TtC37VoicemailMessageNotificationExtension24FaceTimeVoicemailManager_operationQueue;
  sub_100041370();
  sub_100041890();
  *(void *)(a4 + v15) = sub_100041360();
  int v16 = (void *)(a4
                 + OBJC_IVAR____TtC37VoicemailMessageNotificationExtension24FaceTimeVoicemailManager_onVoicemailsChanged);
  *int v16 = a1;
  v16[1] = a2;
  sub_100040C84((uint64_t)v18, a4 + OBJC_IVAR____TtC37VoicemailMessageNotificationExtension24FaceTimeVoicemailManager_messageStoreController);
  swift_retain();
  swift_release();
  *(void *)(a4 + 16) = 0x8000000000000000;
  *(void *)(a4 + 24) = _swiftEmptyArrayStorage;
  sub_1000366C0(v18, v19);
  swift_retain();
  sub_1000415B0();
  swift_release();
  swift_release();
  sub_10001FA54((uint64_t)v18);
  return a4;
}

uint64_t sub_100040C84(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_100040CE8(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "The extension is not authorized to access contact data.", v1, 2u);
}

void sub_100040D2C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Could not construct a URL from the specified string (%@).", (uint8_t *)&v2, 0xCu);
}

void sub_100040DA4(uint64_t a1, NSObject *a2)
{
  int v2 = 138412546;
  CFStringRef v3 = @"TUDialRequestURL";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Could not find a value for key (%@) in the userInfo dictionary (%@).", (uint8_t *)&v2, 0x16u);
}

void sub_100040E30(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unable to get play/pause button frame. %@", (uint8_t *)&v2, 0xCu);
}

void sub_100040EA8(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to activate voicemail audio session: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100040F20(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to set audio category to %@: %@", (uint8_t *)&v3, 0x16u);
}

void sub_100040FA8(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to deactivate voicemail audio session: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100041020(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Could not create a CNPhoneNumber for the specified telephone number (%@).", (uint8_t *)&v2, 0xCu);
}

void sub_100041098(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%@ not updating audioSession notifications with pending audioSession deactivation", (uint8_t *)&v2, 0xCu);
}

void sub_100041110(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100041148(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100041180(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000411B8(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v2, 0xCu);
}

uint64_t sub_100041230()
{
  return static Notification._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100041240()
{
  return Notification.name.getter();
}

uint64_t sub_100041250()
{
  return type metadata accessor for Notification();
}

void sub_100041260(NSURL *retstr@<X8>)
{
}

uint64_t sub_100041270()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100041280()
{
  return URL.path.getter();
}

uint64_t sub_100041290()
{
  return type metadata accessor for URL();
}

uint64_t sub_1000412A0()
{
  return Data.init(contentsOf:options:)();
}

NSDate sub_1000412B0()
{
  return Date._bridgeToObjectiveC()();
}

uint64_t sub_1000412C0()
{
  return static Date.> infix(_:_:)();
}

uint64_t sub_1000412D0()
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000412E0()
{
  return type metadata accessor for Date();
}

uint64_t sub_1000412F0()
{
  return UUID.uuidString.getter();
}

NSUUID sub_100041300()
{
  return UUID._bridgeToObjectiveC()();
}

uint64_t sub_100041310()
{
  return static UUID.< infix(_:_:)();
}

uint64_t sub_100041320()
{
  return static UUID.== infix(_:_:)();
}

uint64_t sub_100041330()
{
  return static UUID._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100041340()
{
  return type metadata accessor for UUID();
}

uint64_t sub_100041350()
{
  return dispatch thunk of TaskQueue.async(_:)();
}

uint64_t sub_100041360()
{
  return TaskQueue.__allocating_init(priority:)();
}

uint64_t sub_100041370()
{
  return type metadata accessor for TaskQueue();
}

uint64_t sub_100041380()
{
  return _HashTable.UnsafeHandle._startIterator(bucket:)();
}

uint64_t sub_100041390()
{
  return _HashTable.UnsafeHandle.firstOccupiedBucketInChain(with:)();
}

uint64_t sub_1000413A0()
{
  return _HashTable.UnsafeHandle.subscript.setter();
}

uint64_t sub_1000413B0()
{
  return _HashTable.BucketIterator.currentValue.getter();
}

uint64_t sub_1000413C0()
{
  return _HashTable.BucketIterator.currentValue.setter();
}

void sub_1000413D0()
{
}

uint64_t sub_1000413E0()
{
  return static _HashTable.maximumCapacity(forScale:)();
}

uint64_t sub_1000413F0()
{
  return static _HashTable.minimumCapacity(forScale:)();
}

uint64_t sub_100041400()
{
  return _HashTable.copy()();
}

uint64_t sub_100041410()
{
  return static _HashTable.scale(forCapacity:)();
}

uint64_t sub_100041420()
{
  return _HashTable.init(scale:reservedScale:)();
}

uint64_t sub_100041430()
{
  return dispatch thunk of Message.sandboxMessageFile.getter();
}

uint64_t sub_100041440()
{
  return dispatch thunk of Message.recordUUID.getter();
}

uint64_t sub_100041450()
{
  return dispatch thunk of Message.transcript.getter();
}

uint64_t sub_100041460()
{
  return dispatch thunk of Message.dateCreated.getter();
}

uint64_t sub_100041470()
{
  return dispatch thunk of Message.isSensitive.getter();
}

uint64_t sub_100041480()
{
  return dispatch thunk of Message.mailboxType.getter();
}

uint64_t sub_100041490()
{
  return dispatch thunk of Message.messageType.getter();
}

uint64_t sub_1000414A0()
{
  return dispatch thunk of Message.isFromUnknown.getter();
}

uint64_t sub_1000414B0()
{
  return dispatch thunk of Message.transcriptionStatus.getter();
}

uint64_t sub_1000414C0()
{
  return dispatch thunk of Message.from.getter();
}

uint64_t sub_1000414D0()
{
  return dispatch thunk of Message.isRTT.getter();
}

uint64_t sub_1000414E0()
{
  return dispatch thunk of Message.isRead.getter();
}

uint64_t sub_1000414F0()
{
  return dispatch thunk of Message.callUUID.getter();
}

uint64_t sub_100041500()
{
  return dispatch thunk of Message.duration.getter();
}

uint64_t sub_100041510()
{
  return dispatch thunk of Message.fileSize.getter();
}

uint64_t sub_100041520()
{
  return dispatch thunk of Message.provider.getter();
}

uint64_t sub_100041530()
{
  return dispatch thunk of Message.recipient.getter();
}

uint64_t sub_100041540()
{
  return type metadata accessor for Message();
}

uint64_t sub_100041550()
{
  return static MessageFetchOptions.includeProtectedApps.getter();
}

uint64_t sub_100041560()
{
  return type metadata accessor for MessageFetchOptions();
}

uint64_t sub_100041570()
{
  return MessageType.rawValue.getter();
}

uint64_t sub_100041580()
{
  return MessageUpdate.init(recordUUID:callUUID:conversationID:from:provider:isRead:duration:mailboxType:recipient:transcriptionStatus:isRTT:transcriptURL:simID:undelete:)();
}

uint64_t sub_100041590()
{
  return MessageUpdate.recordUUID.getter();
}

uint64_t sub_1000415A0()
{
  return type metadata accessor for MessageUpdate();
}

uint64_t sub_1000415B0()
{
  return MessageStoreController.addDelegate(_:)();
}

uint64_t sub_1000415E0()
{
  return MessageStoreController.removeDelegate(_:)();
}

uint64_t sub_100041600()
{
  return static MessageStoreController.shared.getter();
}

uint64_t sub_100041610()
{
  return type metadata accessor for MessageStoreController();
}

uint64_t sub_100041620()
{
  return type metadata accessor for MessageStoreFetchRequest.QuerySearchType();
}

uint64_t sub_100041630()
{
  return MessageStoreFetchRequest.init(query:sortType:options:pageSize:page:originatingBundleID:)();
}

uint64_t sub_100041640()
{
  return type metadata accessor for MessageStoreFetchRequest();
}

uint64_t sub_100041650()
{
  return type metadata accessor for MessageStoreQuery();
}

uint64_t sub_100041660()
{
  return Transcript.text.getter();
}

uint64_t sub_100041670()
{
  return type metadata accessor for Transcript();
}

uint64_t sub_100041680()
{
  return MailboxType.rawValue.getter();
}

uint64_t sub_100041690()
{
  return dispatch thunk of SandboxExtendedURL.sandboxResolvedURL.getter();
}

uint64_t sub_1000416A0()
{
  return TranscriptionStatus.rawValue.getter();
}

uint64_t sub_1000416B0()
{
  return Logger.logObject.getter();
}

uint64_t sub_1000416C0()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_1000416D0()
{
  return type metadata accessor for Logger();
}

uint64_t sub_1000416E0()
{
  return PassthroughSubject.send(_:)();
}

uint64_t sub_1000416F0()
{
  return PassthroughSubject.init()();
}

uint64_t sub_100041700()
{
  return static DispatchQoS.userInteractive.getter();
}

uint64_t sub_100041710()
{
  return type metadata accessor for DispatchQoS();
}

NSDictionary sub_100041720()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_100041730()
{
  return dispatch thunk of Hashable.hash(into:)();
}

NSString sub_100041740()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100041750()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_100041760()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_100041770()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100041780()
{
  return String.init<A>(describing:)();
}

uint64_t sub_100041790()
{
  return String.init<A>(reflecting:)();
}

uint64_t sub_1000417A0()
{
  return String.hash(into:)();
}

void sub_1000417B0(Swift::String a1)
{
}

Swift::Int sub_1000417C0()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_1000417D0()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_1000417E0()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_1000417F0()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100041800()
{
  return Array.description.getter();
}

uint64_t sub_100041810()
{
  return specialized Array._endMutation()();
}

uint64_t sub_100041820()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_100041830()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t sub_100041840()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_100041850()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_100041860()
{
  return static MainActor.shared.getter();
}

uint64_t sub_100041870()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_100041880()
{
  return static TaskPriority.userInitiated.getter();
}

uint64_t sub_100041890()
{
  return static TaskPriority.high.getter();
}

uint64_t sub_1000418A0()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_1000418B0()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_1000418E0()
{
  return Double.write<A>(to:)();
}

uint64_t sub_1000418F0()
{
  return Set.description.getter();
}

uint64_t sub_100041900()
{
  return Set.init(minimumCapacity:)();
}

uint64_t sub_100041910()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_100041920()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_100041930()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_100041940()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_100041950()
{
  return static NSKeyedUnarchiver.unarchivedObject<A>(ofClass:from:)();
}

uint64_t sub_100041960()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t sub_100041970()
{
  return type metadata accessor for OS_dispatch_queue_serial.Attributes();
}

uint64_t sub_100041980()
{
  return OS_dispatch_queue_serial.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t sub_100041990()
{
  return OS_dispatch_queue_serial_executor.asUnownedSerialExecutor()();
}

NSNumber sub_1000419A0(Swift::Bool BOOLeanLiteral)
{
  return NSNumber.init(BOOLeanLiteral:)(BOOLeanLiteral);
}

Swift::Int sub_1000419B0(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t sub_1000419C0()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_1000419D0()
{
  return type metadata accessor for Optional();
}

uint64_t sub_1000419E0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_1000419F0()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_100041A00()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_100041A10()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_100041A20()
{
  return _HashTable.nextHole(atOrAfter:)();
}

uint64_t sub_100041A30()
{
  return __CocoaSet.makeIterator()();
}

uint64_t sub_100041A40()
{
  return __CocoaSet.count.getter();
}

uint64_t sub_100041A50()
{
  return __CocoaSet.member(for:)();
}

uint64_t sub_100041A60()
{
  return __CocoaSet.Iterator.next()();
}

uint64_t sub_100041A80()
{
  return static _SetStorage.copy(original:)();
}

uint64_t sub_100041A90()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t sub_100041AA0()
{
  return static _SetStorage.convert(_:capacity:)();
}

uint64_t sub_100041AB0()
{
  return static _SetStorage.allocate(capacity:)();
}

void sub_100041AC0(Swift::Int a1)
{
}

uint64_t sub_100041AD0()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100041AE0()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_100041AF0()
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_100041B00()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100041B10()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_100041B20()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_100041B30()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t sub_100041B40()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_100041B50()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_100041B60()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t sub_100041B70()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100041B80()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100041B90()
{
  return _bridgeCocoaArray<A>(_:)();
}

uint64_t sub_100041BA0()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_100041BB0()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_100041BC0()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_100041BD0()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_100041BE0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_100041C00()
{
  return dispatch thunk of static _ObjectiveCBridgeable._conditionallyBridgeFromObjectiveC(_:result:)();
}

Swift::Int sub_100041C20(Swift::Int a1)
{
  return _minimumMergeRunLength(_:)(a1);
}

uint64_t sub_100041C30()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_100041C40()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100041C50()
{
  return dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter();
}

uint64_t sub_100041C60()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_100041C70()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_100041C80()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_100041C90()
{
  return Error._code.getter();
}

uint64_t sub_100041CA0()
{
  return Error._domain.getter();
}

uint64_t sub_100041CB0()
{
  return Error._userInfo.getter();
}

uint64_t sub_100041CC0()
{
  return Hasher.init(_seed:)();
}

void sub_100041CD0(Swift::UInt a1)
{
}

Swift::Int sub_100041CE0()
{
  return Hasher._finalize()();
}

uint64_t sub_100041CF0()
{
  return _typeName(_:qualified:)();
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyValue(key, applicationID, userName, hostName);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return _CGRectContainsPoint(rect, point);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  return _CGRectInset(rect, dx, dy);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  return _CMTimeGetSeconds(time);
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return _CMTimeMake(retstr, value, timescale);
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return _CMTimeMakeWithSeconds(retstr, seconds, preferredTimescale);
}

uint64_t CPIsInternalDevice()
{
  return _CPIsInternalDevice();
}

uint64_t CUTWeakLinkClass()
{
  return _CUTWeakLinkClass();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

uint64_t TUCallScreeningRTTEnabled()
{
  return _TUCallScreeningRTTEnabled();
}

uint64_t TUDispatchMainIfNecessary()
{
  return _TUDispatchMainIfNecessary();
}

uint64_t TUFormattedPhoneNumber()
{
  return _TUFormattedPhoneNumber();
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return _UIAccessibilityIsVoiceOverRunning();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return _UIGraphicsGetImageFromCurrentImageContext();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

Class object_getClass(id a1)
{
  return _object_getClass(a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_allocError()
{
  return _swift_allocError();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return _swift_arrayInitWithTakeBackToFront();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return _swift_arrayInitWithTakeFrontToBack();
}

uint64_t swift_asyncLet_begin()
{
  return _swift_asyncLet_begin();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getAtKeyPath()
{
  return _swift_getAtKeyPath();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return _swift_initEnumMetadataMultiPayload();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_initStaticObject()
{
  return _swift_initStaticObject();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isUniquelyReferenced_native()
{
  return _swift_isUniquelyReferenced_native();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return _swift_isUniquelyReferenced_nonNull_bridgeObject();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_makeBoxUnique()
{
  return _swift_makeBoxUnique();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_release_n()
{
  return _swift_release_n();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_retain_n()
{
  return _swift_retain_n();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return _swift_stdlib_isStackAllocationSafe();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return _swift_storeEnumTagMultiPayload();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_create()
{
  return _swift_task_create();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRelease_n()
{
  return _swift_unknownObjectRelease_n();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectRetain_n()
{
  return _swift_unknownObjectRetain_n();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_weakDestroy()
{
  return _swift_weakDestroy();
}

uint64_t swift_weakInit()
{
  return _swift_weakInit();
}

uint64_t swift_weakLoadStrong()
{
  return _swift_weakLoadStrong();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

uint64_t swift_willThrowTypedImpl()
{
  return _swift_willThrowTypedImpl();
}

uint64_t ttyLocString()
{
  return _ttyLocString();
}

uint64_t vm_ui_log()
{
  return _vm_ui_log();
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return _[a1 URL];
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return [a1 URLWithString:];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _[a1 UUIDString];
}

id objc_msgSend__accessibilityHigherContrastTintColorForColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_accessibilityHigherContrastTintColorForColor:");
}

id objc_msgSend__audioSessionSerialQueue(void *a1, const char *a2, ...)
{
  return _[a1 _audioSessionSerialQueue];
}

id objc_msgSend__preferredMaxLayoutWidth(void *a1, const char *a2, ...)
{
  return _[a1 _preferredMaxLayoutWidth];
}

id objc_msgSend__refreshAttributedText(void *a1, const char *a2, ...)
{
  return _[a1 _refreshAttributedText];
}

id objc_msgSend__scaledValueForValue_(void *a1, const char *a2, ...)
{
  return [a1 _scaledValueForValue:];
}

id objc_msgSend__setInternalTitle_(void *a1, const char *a2, ...)
{
  return [_a1 _setInternalTitle:];
}

id objc_msgSend__setPreferredMaxLayoutWidth_(void *a1, const char *a2, ...)
{
  return [a1 _setPreferredMaxLayoutWidth:];
}

id objc_msgSend__setTouchInsets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setTouchInsets:");
}

id objc_msgSend__shouldShowRTTButton(void *a1, const char *a2, ...)
{
  return _[a1 _shouldShowRTTButton];
}

id objc_msgSend__thinSystemFontOfSize_(void *a1, const char *a2, ...)
{
  return [a1 _thinSystemFontOfSize:];
}

id objc_msgSend__updateButtonState(void *a1, const char *a2, ...)
{
  return _[a1 _updateButtonState];
}

id objc_msgSend__updateTextColor(void *a1, const char *a2, ...)
{
  return _[a1 _updateTextColor];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return _[a1 absoluteString];
}

id objc_msgSend_actionIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 actionIdentifier];
}

id objc_msgSend_activateAudioSessionIfNeededWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activateAudioSessionIfNeededWithCompletion:");
}

id objc_msgSend_activateConstraints_(void *a1, const char *a2, ...)
{
  return [a1 activateConstraints:];
}

id objc_msgSend_activateVoicemailAudioSession(void *a1, const char *a2, ...)
{
  return _[a1 activateVoicemailAudioSession];
}

id objc_msgSend_actualBackgroundColor(void *a1, const char *a2, ...)
{
  return _[a1 actualBackgroundColor];
}

id objc_msgSend_actualTintColor(void *a1, const char *a2, ...)
{
  return _[a1 actualTintColor];
}

id objc_msgSend_addAttribute_value_range_(void *a1, const char *a2, ...)
{
  return [a1 addAttribute:value:range:];
}

id objc_msgSend_addAttributes_range_(void *a1, const char *a2, ...)
{
  return [a1 addAttributes:range:];
}

id objc_msgSend_addGestureRecognizer_(void *a1, const char *a2, ...)
{
  return [a1 addGestureRecognizer:];
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return [a1 addObject:];
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return [a1 addObjectsFromArray:];
}

id objc_msgSend_addObserver_forKeyPath_options_context_(void *a1, const char *a2, ...)
{
  return [a1 addObserver:forKeyPath:options:context:];
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return [a1 addObserver:selector:name:object:];
}

id objc_msgSend_addPeriodicTimeObserverForInterval_queue_usingBlock_(void *a1, const char *a2, ...)
{
  return [a1 addPeriodicTimeObserverForInterval:queue:usingBlock:];
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return [a1 addSubview:];
}

id objc_msgSend_addTarget_action_forControlEvents_(void *a1, const char *a2, ...)
{
  return [a1 addTarget:action:forControlEvents:];
}

id objc_msgSend_alphaComponent(void *a1, const char *a2, ...)
{
  return _[a1 alphaComponent];
}

id objc_msgSend_animateWithDuration_delay_options_animations_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animateWithDuration:delay:options:animations:completion:");
}

id objc_msgSend_appendAttributedString_(void *a1, const char *a2, ...)
{
  return [a1 appendAttributedString:];
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return [a1 appendFormat:];
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return [a1 appendString:];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithObjects:count:];
}

id objc_msgSend_attributedStringWithAttachment_(void *a1, const char *a2, ...)
{
  return [a1 attributedStringWithAttachment:];
}

id objc_msgSend_attributedText(void *a1, const char *a2, ...)
{
  return _[a1 attributedText];
}

id objc_msgSend_audioRouteButton(void *a1, const char *a2, ...)
{
  return _[a1 audioRouteButton];
}

id objc_msgSend_audioSessionState(void *a1, const char *a2, ...)
{
  return _[a1 audioSessionState];
}

id objc_msgSend_authorizationStatusForEntityType_(void *a1, const char *a2, ...)
{
  return [a1 authorizationStatusForEntityType:];
}

id objc_msgSend_backgroundColor(void *a1, const char *a2, ...)
{
  return _[a1 backgroundColor];
}

id objc_msgSend_beginTrackingWithTouch_withEvent_(void *a1, const char *a2, ...)
{
  return [a1 beginTrackingWithTouch:withEvent:];
}

id objc_msgSend_bezierPathWithRoundedRect_cornerRadius_(void *a1, const char *a2, ...)
{
  return [a1 bezierPathWithRoundedRect:cornerRadius:];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return _[a1 bottomAnchor];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return _[a1 bounds];
}

id objc_msgSend_bringSubviewToFront_(void *a1, const char *a2, ...)
{
  return [a1 bringSubviewToFront:];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 bundleIdentifier];
}

id objc_msgSend_bundleWithPath_(void *a1, const char *a2, ...)
{
  return [a1 bundleWithPath:];
}

id objc_msgSend_buttonWithState_(void *a1, const char *a2, ...)
{
  return [a1 buttonWithState:];
}

id objc_msgSend_buttonWithType_(void *a1, const char *a2, ...)
{
  return [a1 buttonWithType:];
}

id objc_msgSend_cancelTrackingWithEvent_(void *a1, const char *a2, ...)
{
  return [a1 cancelTrackingWithEvent:];
}

id objc_msgSend_category(void *a1, const char *a2, ...)
{
  return _[a1 category];
}

id objc_msgSend_centerXAnchor(void *a1, const char *a2, ...)
{
  return _[a1 centerXAnchor];
}

id objc_msgSend_centerYAnchor(void *a1, const char *a2, ...)
{
  return _[a1 centerYAnchor];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return _[a1 clearColor];
}

id objc_msgSend_closestPositionToPoint_(void *a1, const char *a2, ...)
{
  return [a1 closestPositionToPoint:];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _[a1 code];
}

id objc_msgSend_colorWithAlphaComponent_(void *a1, const char *a2, ...)
{
  return [a1 colorWithAlphaComponent:];
}

id objc_msgSend_colorWithRed_green_blue_alpha_(void *a1, const char *a2, ...)
{
  return [a1 colorWithRed:green:blue:alpha:];
}

id objc_msgSend_colorWithWhite_alpha_(void *a1, const char *a2, ...)
{
  return [a1 colorWithWhite:alpha:];
}

id objc_msgSend_commonInit(void *a1, const char *a2, ...)
{
  return _[a1 commonInit];
}

id objc_msgSend_confidence(void *a1, const char *a2, ...)
{
  return _[a1 confidence];
}

id objc_msgSend_confidenceRating(void *a1, const char *a2, ...)
{
  return _[a1 confidenceRating];
}

id objc_msgSend_conformsToProtocol_(void *a1, const char *a2, ...)
{
  return [a1 conformsToProtocol:];
}

id objc_msgSend_constraintEqualToAnchor_(void *a1, const char *a2, ...)
{
  return [a1 constraintEqualToAnchor:];
}

id objc_msgSend_constraintEqualToAnchor_constant_(void *a1, const char *a2, ...)
{
  return [a1 constraintEqualToAnchor:];
}

id objc_msgSend_constraintEqualToConstant_(void *a1, const char *a2, ...)
{
  return [a1 constraintEqualToConstant:];
}

id objc_msgSend_constraintGreaterThanOrEqualToAnchor_(void *a1, const char *a2, ...)
{
  return [a1 constraintGreaterThanOrEqualToAnchor];
}

id objc_msgSend_constraintGreaterThanOrEqualToAnchor_constant_(void *a1, const char *a2, ...)
{
  return [a1 constraintGreaterThanOrEqualToAnchor:constant:];
}

id objc_msgSend_constraintLessThanOrEqualToAnchor_(void *a1, const char *a2, ...)
{
  return [a1 constraintLessThanOrEqualToAnchor:];
}

id objc_msgSend_constraintLessThanOrEqualToAnchor_constant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintLessThanOrEqualToAnchor:constant:");
}

id objc_msgSend_constraintsLoaded(void *a1, const char *a2, ...)
{
  return _[a1 constraintsLoaded];
}

id objc_msgSend_contact(void *a1, const char *a2, ...)
{
  return _[a1 contact];
}

id objc_msgSend_contactRelations(void *a1, const char *a2, ...)
{
  return _[a1 contactRelations];
}

id objc_msgSend_contactStore(void *a1, const char *a2, ...)
{
  return _[a1 contactStore];
}

id objc_msgSend_contactUsingContactStore_withKeysToFetch_(void *a1, const char *a2, ...)
{
  return [a1 contactUsingContactStore:withKeysToFetch:];
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return [a1 containsObject:];
}

id objc_msgSend_content(void *a1, const char *a2, ...)
{
  return _[a1 content];
}

id objc_msgSend_contentUnavailableView(void *a1, const char *a2, ...)
{
  return _[a1 contentUnavailableView];
}

id objc_msgSend_continueTrackingWithTouch_withEvent_(void *a1, const char *a2, ...)
{
  return [a1 continueTrackingWithTouch:withEvent:];
}

id objc_msgSend_conversationForCallUID_(void *a1, const char *a2, ...)
{
  return [a1 conversationForCallUID:];
}

id objc_msgSend_convertRect_fromView_(void *a1, const char *a2, ...)
{
  return [a1 convertRect:fromView:];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return _[a1 currentDevice];
}

id objc_msgSend_currentItem(void *a1, const char *a2, ...)
{
  return _[a1 currentItem];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return _[a1 currentLocale];
}

id objc_msgSend_currentRoute(void *a1, const char *a2, ...)
{
  return _[a1 currentRoute];
}

id objc_msgSend_currentThumbImage(void *a1, const char *a2, ...)
{
  return _[a1 currentThumbImage];
}

id objc_msgSend_currentTime(void *a1, const char *a2, ...)
{
  return _[a1 currentTime];
}

id objc_msgSend_dataURL(void *a1, const char *a2, ...)
{
  return _[a1 dataURL];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_dateFormatter(void *a1, const char *a2, ...)
{
  return _[a1 dateFormatter];
}

id objc_msgSend_dateLabel(void *a1, const char *a2, ...)
{
  return _[a1 dateLabel];
}

id objc_msgSend_dateLabelFirstBaselineAnchorLayoutConstraint(void *a1, const char *a2, ...)
{
  return _[a1 dateLabelFirstBaselineAnchorLayoutConstraint];
}

id objc_msgSend_dateLabelFirstBaselineAnchorLayoutConstraintConstant(void *a1, const char *a2, ...)
{
  return _[a1 dateLabelFirstBaselineAnchorLayoutConstraintConstant];
}

id objc_msgSend_deactivateAudioSession(void *a1, const char *a2, ...)
{
  return _[a1 deactivateAudioSession];
}

id objc_msgSend_deactivateConstraints_(void *a1, const char *a2, ...)
{
  return [a1 deactivateConstraints:];
}

id objc_msgSend_deactivateVoicemailAudioSession(void *a1, const char *a2, ...)
{
  return _[a1 deactivateVoicemailAudioSession];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _[a1 delegate];
}

id objc_msgSend_descriptorForRequiredKeysForStyle_(void *a1, const char *a2, ...)
{
  return [a1 descriptorForRequiredKeysForStyle:];
}

id objc_msgSend_detailScrubController(void *a1, const char *a2, ...)
{
  return _[a1 detailScrubController];
}

id objc_msgSend_detailSlider_didChangeElapsedTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "detailSlider:didChangeElapsedTime:");
}

id objc_msgSend_detailSliderTrackingDidBegin_(void *a1, const char *a2, ...)
{
  return [a1 detailSliderTrackingDidBegin:];
}

id objc_msgSend_detailSliderTrackingDidCancel_(void *a1, const char *a2, ...)
{
  return [a1 detailSliderTrackingDidCancel:];
}

id objc_msgSend_detailSliderTrackingDidEnd_(void *a1, const char *a2, ...)
{
  return [a1 detailSliderTrackingDidEnd:];
}

id objc_msgSend_deviceType(void *a1, const char *a2, ...)
{
  return _[a1 deviceType];
}

id objc_msgSend_dialRequestButton(void *a1, const char *a2, ...)
{
  return _[a1 dialRequestButton];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithObjects:forKeys:count:];
}

id objc_msgSend_displayNameUsingContactStore_(void *a1, const char *a2, ...)
{
  return [a1 displayNameUsingContactStore:];
}

id objc_msgSend_doesNotRecognizeSelector_(void *a1, const char *a2, ...)
{
  return [a1 doesNotRecognizeSelector:];
}

id objc_msgSend_donated(void *a1, const char *a2, ...)
{
  return _[a1 donated];
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return _[a1 duration];
}

id objc_msgSend_dynamicBackgroundColor(void *a1, const char *a2, ...)
{
  return _[a1 dynamicBackgroundColor];
}

id objc_msgSend_dynamicLabelColor(void *a1, const char *a2, ...)
{
  return _[a1 dynamicLabelColor];
}

id objc_msgSend_dynamicSecondaryLabelColor(void *a1, const char *a2, ...)
{
  return _[a1 dynamicSecondaryLabelColor];
}

id objc_msgSend_elapsedTime(void *a1, const char *a2, ...)
{
  return _[a1 elapsedTime];
}

id objc_msgSend_elapsedTimeLabel(void *a1, const char *a2, ...)
{
  return _[a1 elapsedTimeLabel];
}

id objc_msgSend_elapsedTimeLabelBottomAnchorLayoutConstraint(void *a1, const char *a2, ...)
{
  return _[a1 elapsedTimeLabelBottomAnchorLayoutConstraint];
}

id objc_msgSend_elapsedTimeLabelFirstBaselineAnchorLayoutConstraint(void *a1, const char *a2, ...)
{
  return _[a1 elapsedTimeLabelFirstBaselineAnchorLayoutConstraint];
}

id objc_msgSend_elapsedTimeLabelFirstBaselineAnchorLayoutConstraintConstant(void *a1, const char *a2, ...)
{
  return _[a1 elapsedTimeLabelFirstBaselineAnchorLayoutConstraintConstant];
}

id objc_msgSend_elapsedTimeLabelLeadingAnchorLayoutConstraint(void *a1, const char *a2, ...)
{
  return _[a1 elapsedTimeLabelLeadingAnchorLayoutConstraint];
}

id objc_msgSend_elapsedTimeLabelTrailingAnchorLayoutConstraint(void *a1, const char *a2, ...)
{
  return _[a1 elapsedTimeLabelTrailingAnchorLayoutConstraint];
}

id objc_msgSend_emailAddresses(void *a1, const char *a2, ...)
{
  return _[a1 emailAddresses];
}

id objc_msgSend_endTrackingWithTouch_withEvent_(void *a1, const char *a2, ...)
{
  return [a1 endTrackingWithTouch:withEvent:];
}

id objc_msgSend_extensionContext(void *a1, const char *a2, ...)
{
  return _[a1 extensionContext];
}

id objc_msgSend_featureFlags(void *a1, const char *a2, ...)
{
  return _[a1 featureFlags];
}

id objc_msgSend_feedbackTextView(void *a1, const char *a2, ...)
{
  return _[a1 feedbackTextView];
}

id objc_msgSend_fetchMetadataForMessages_(void *a1, const char *a2, ...)
{
  return [a1 fetchMetadataForMessages:];
}

id objc_msgSend_fetchRTTConversationForCallUUID_(void *a1, const char *a2, ...)
{
  return [a1 fetchRTTConversationForCallUUID:];
}

id objc_msgSend_fill(void *a1, const char *a2, ...)
{
  return _[a1 fill];
}

id objc_msgSend_firstBaselineAnchor(void *a1, const char *a2, ...)
{
  return _[a1 firstBaselineAnchor];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return _[a1 floatValue];
}

id objc_msgSend_font(void *a1, const char *a2, ...)
{
  return _[a1 font];
}

id objc_msgSend_fontDescriptor(void *a1, const char *a2, ...)
{
  return _[a1 fontDescriptor];
}

id objc_msgSend_fontDescriptorByAddingAttributes_(void *a1, const char *a2, ...)
{
  return [a1 fontDescriptorByAddingAttributes:];
}

id objc_msgSend_fontWithDescriptor_size_(void *a1, const char *a2, ...)
{
  return [a1 fontWithDescriptor:];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return _[a1 frame];
}

id objc_msgSend_gestureRecognizers(void *a1, const char *a2, ...)
{
  return _[a1 gestureRecognizers];
}

id objc_msgSend_getFTVoiceMailOnVoicemailsChanged_(void *a1, const char *a2, ...)
{
  return [a1 getFTVoiceMailOnVoicemailsChanged:];
}

id objc_msgSend_getVisualVoiceMailWithVisualVoicemailManager_onVoicemailsChanged_(void *a1, const char *a2, ...)
{
  return [a1 getVisualVoiceMailWithVisualVoicemailManager:onVoicemailsChanged:];
}

id objc_msgSend_handleVoicemailManagerVoicemailsDidChange(void *a1, const char *a2, ...)
{
  return _[a1 handleVoicemailManagerVoicemailsDidChange];
}

id objc_msgSend_hasAcceptableConfidenceForDisplay(void *a1, const char *a2, ...)
{
  return _[a1 hasAcceptableConfidenceForDisplay];
}

id objc_msgSend_headerView(void *a1, const char *a2, ...)
{
  return _[a1 headerView];
}

id objc_msgSend_headlineLabel(void *a1, const char *a2, ...)
{
  return _[a1 headlineLabel];
}

id objc_msgSend_headlineLabelFirstBaselineAnchorLayoutConstraint(void *a1, const char *a2, ...)
{
  return _[a1 headlineLabelFirstBaselineAnchorLayoutConstraint];
}

id objc_msgSend_headlineLabelFirstBaselineAnchorLayoutConstraintConstant(void *a1, const char *a2, ...)
{
  return _[a1 headlineLabelFirstBaselineAnchorLayoutConstraintConstant];
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return _[a1 heightAnchor];
}

id objc_msgSend_hideAccessoryViews(void *a1, const char *a2, ...)
{
  return _[a1 hideAccessoryViews];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_imageView(void *a1, const char *a2, ...)
{
  return _[a1 imageView];
}

id objc_msgSend_imageWithRenderingMode_(void *a1, const char *a2, ...)
{
  return [a1 imageWithRenderingMode:];
}

id objc_msgSend_indicatorView(void *a1, const char *a2, ...)
{
  return _[a1 indicatorView];
}

id objc_msgSend_indicatorViewTopLayoutConstraint(void *a1, const char *a2, ...)
{
  return _[a1 indicatorViewTopLayoutConstraint];
}

id objc_msgSend_indicatorViewTopLayoutConstraintConstant(void *a1, const char *a2, ...)
{
  return _[a1 indicatorViewTopLayoutConstraintConstant];
}

id objc_msgSend_initWithActivityIndicatorStyle_(void *a1, const char *a2, ...)
{
  return [a1 initWithActivityIndicatorStyle:];
}

id objc_msgSend_initWithArray_(void *a1, const char *a2, ...)
{
  return [a1 initWithArray:];
}

id objc_msgSend_initWithContactStore_(void *a1, const char *a2, ...)
{
  return [a1 initWithContactStore:];
}

id objc_msgSend_initWithDataProviders_(void *a1, const char *a2, ...)
{
  return [a1 initWithDataProviders:];
}

id objc_msgSend_initWithDonated_transcribing_transcriptionAttempted_transcriptionAvailable_messageTranscript_(void *a1, const char *a2, ...)
{
  return [a1 initWithDonated:transcribing:transcriptionAttempted:transcriptionAvailable:messageTranscript:];
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return [a1 initWithFrame:];
}

id objc_msgSend_initWithFrame_title_(void *a1, const char *a2, ...)
{
  return [a1 initWithFrame:title:];
}

id objc_msgSend_initWithHandle_(void *a1, const char *a2, ...)
{
  return [a1 initWithHandle:];
}

id objc_msgSend_initWithMPMessage_(void *a1, const char *a2, ...)
{
  return [a1 initWithMPMessage:];
}

id objc_msgSend_initWithManager_(void *a1, const char *a2, ...)
{
  return [a1 initWithManager:];
}

id objc_msgSend_initWithPlayer_(void *a1, const char *a2, ...)
{
  return [a1 initWithPlayer:];
}

id objc_msgSend_initWithPlayerItem_(void *a1, const char *a2, ...)
{
  return [a1 initWithPlayerItem:];
}

id objc_msgSend_initWithScrubbingControl_(void *a1, const char *a2, ...)
{
  return [a1 initWithScrubbingControl:];
}

id objc_msgSend_initWithSize_(void *a1, const char *a2, ...)
{
  return [a1 initWithSize:];
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return [a1 initWithString:];
}

id objc_msgSend_initWithString_attributes_(void *a1, const char *a2, ...)
{
  return [a1 initWithString:attributes:];
}

id objc_msgSend_initWithTabBarSystemItem_tag_(void *a1, const char *a2, ...)
{
  return [a1 initWithTabBarSystemItem:tag:];
}

id objc_msgSend_initWithTarget_action_(void *a1, const char *a2, ...)
{
  return [a1 initWithTarget:action:];
}

id objc_msgSend_initWithTitle_image_selectedImage_(void *a1, const char *a2, ...)
{
  return [a1 initWithTitle:image:selectedImage:];
}

id objc_msgSend_initWithType_(void *a1, const char *a2, ...)
{
  return [a1 initWithType:];
}

id objc_msgSend_initWithURL_(void *a1, const char *a2, ...)
{
  return [a1 initWithURL:];
}

id objc_msgSend_initWithUUIDString_(void *a1, const char *a2, ...)
{
  return [a1 initWithUUIDString:];
}

id objc_msgSend_initWithUuid_(void *a1, const char *a2, ...)
{
  return [a1 initWithUuid:];
}

id objc_msgSend_initWithVMTranscript_(void *a1, const char *a2, ...)
{
  return [a1 initWithVMTranscript:];
}

id objc_msgSend_initWithValue_(void *a1, const char *a2, ...)
{
  return [a1 initWithValue:];
}

id objc_msgSend_insertAttributedString_atIndex_(void *a1, const char *a2, ...)
{
  return [a1 insertAttributedString:atIndex:];
}

id objc_msgSend_instantMessageAddresses(void *a1, const char *a2, ...)
{
  return _[a1 instantMessageAddresses];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _[a1 intValue];
}

id objc_msgSend_isAccessibilityConstraintsEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isAccessibilityConstraintsEnabled];
}

id objc_msgSend_isAccessiblityConstraintsEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isAccessiblityConstraintsEnabled];
}

id objc_msgSend_isAudioSessionActive(void *a1, const char *a2, ...)
{
  return _[a1 isAudioSessionActive];
}

id objc_msgSend_isCategoryVoicemail(void *a1, const char *a2, ...)
{
  return _[a1 isCategoryVoicemail];
}

id objc_msgSend_isContinuous(void *a1, const char *a2, ...)
{
  return _[a1 isContinuous];
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isEnabled];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return [a1 isEqual:];
}

id objc_msgSend_isEqualToNumber_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToNumber:];
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToString:];
}

id objc_msgSend_isKeyAvailable_(void *a1, const char *a2, ...)
{
  return [a1 isKeyAvailable:];
}

id objc_msgSend_isLikePhoneNumber_(void *a1, const char *a2, ...)
{
  return [a1 isLikePhoneNumber:];
}

id objc_msgSend_isMe(void *a1, const char *a2, ...)
{
  return _[a1 isMe];
}

id objc_msgSend_isPreferredContentSizeCategoryAccessible(void *a1, const char *a2, ...)
{
  return _[a1 isPreferredContentSizeCategoryAccessible];
}

id objc_msgSend_isProximityMonitoringEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isProximityMonitoringEnabled];
}

id objc_msgSend_isRead(void *a1, const char *a2, ...)
{
  return _[a1 isRead];
}

id objc_msgSend_isReceiver(void *a1, const char *a2, ...)
{
  return _[a1 isReceiver];
}

id objc_msgSend_isRestricted(void *a1, const char *a2, ...)
{
  return _[a1 isRestricted];
}

id objc_msgSend_isSelected(void *a1, const char *a2, ...)
{
  return _[a1 isSelected];
}

id objc_msgSend_isSuggested(void *a1, const char *a2, ...)
{
  return _[a1 isSuggested];
}

id objc_msgSend_isTracking(void *a1, const char *a2, ...)
{
  return _[a1 isTracking];
}

id objc_msgSend_isTranscribing(void *a1, const char *a2, ...)
{
  return _[a1 isTranscribing];
}

id objc_msgSend_isTranscription(void *a1, const char *a2, ...)
{
  return _[a1 isTranscription];
}

id objc_msgSend_isTranscriptionAvailable(void *a1, const char *a2, ...)
{
  return _[a1 isTranscriptionAvailable];
}

id objc_msgSend_isTranscriptionRated(void *a1, const char *a2, ...)
{
  return _[a1 isTranscriptionRated];
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return _[a1 label];
}

id objc_msgSend_labeledValueForPhoneNumber_(void *a1, const char *a2, ...)
{
  return [a1 labeledValueForPhoneNumber:];
}

id objc_msgSend_labelsEnabled(void *a1, const char *a2, ...)
{
  return _[a1 labelsEnabled];
}

id objc_msgSend_lastBaselineAnchor(void *a1, const char *a2, ...)
{
  return _[a1 lastBaselineAnchor];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return _[a1 layer];
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 layoutIfNeeded];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return _[a1 leadingAnchor];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_loadAccessibilityConstraints(void *a1, const char *a2, ...)
{
  return _[a1 loadAccessibilityConstraints];
}

id objc_msgSend_loadConstraints(void *a1, const char *a2, ...)
{
  return _[a1 loadConstraints];
}

id objc_msgSend_loadLabelConstraints(void *a1, const char *a2, ...)
{
  return _[a1 loadLabelConstraints];
}

id objc_msgSend_loadSubviews(void *a1, const char *a2, ...)
{
  return _[a1 loadSubviews];
}

id objc_msgSend_loadSubviewsLayoutConstraints(void *a1, const char *a2, ...)
{
  return _[a1 loadSubviewsLayoutConstraints];
}

id objc_msgSend_loadView(void *a1, const char *a2, ...)
{
  return _[a1 loadView];
}

id objc_msgSend_loadViews(void *a1, const char *a2, ...)
{
  return _[a1 loadViews];
}

id objc_msgSend_localizedAttributedFeedbackText(void *a1, const char *a2, ...)
{
  return _[a1 localizedAttributedFeedbackText];
}

id objc_msgSend_localizedAttributedFeedbackTextForConfidence_locale_(void *a1, const char *a2, ...)
{
  return [a1 localizedAttributedFeedbackTextForConfidence:locale:];
}

id objc_msgSend_localizedAttributedText(void *a1, const char *a2, ...)
{
  return _[a1 localizedAttributedText];
}

id objc_msgSend_localizedAttributedTextForConfidence_(void *a1, const char *a2, ...)
{
  return [a1 localizedAttributedTextForConfidence:];
}

id objc_msgSend_localizedAttributedTitle(void *a1, const char *a2, ...)
{
  return _[a1 localizedAttributedTitle];
}

id objc_msgSend_localizedDate(void *a1, const char *a2, ...)
{
  return _[a1 localizedDate];
}

id objc_msgSend_localizedDisplayStringForLabel_propertyName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedDisplayStringForLabel:propertyName:");
}

id objc_msgSend_localizedHeadline(void *a1, const char *a2, ...)
{
  return _[a1 localizedHeadline];
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return [a1 localizedStringForKey:value:table:];
}

id objc_msgSend_localizedStringForTimeInterval_timeFormatter_(void *a1, const char *a2, ...)
{
  return [a1 localizedStringForTimeInterval:timeFormatter:];
}

id objc_msgSend_localizedSubheadline(void *a1, const char *a2, ...)
{
  return _[a1 localizedSubheadline];
}

id objc_msgSend_localizedSubtitleForMessage_(void *a1, const char *a2, ...)
{
  return [a1 localizedSubtitleForMessage:];
}

id objc_msgSend_locationInView_(void *a1, const char *a2, ...)
{
  return [a1 locationInView:];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return _[a1 mainBundle];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return _[a1 mainScreen];
}

id objc_msgSend_manager(void *a1, const char *a2, ...)
{
  return _[a1 manager];
}

id objc_msgSend_markVoicemailsAsRead_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "markVoicemailsAsRead:completion:");
}

id objc_msgSend_maxTrackColor(void *a1, const char *a2, ...)
{
  return _[a1 maxTrackColor];
}

id objc_msgSend_maximumTime(void *a1, const char *a2, ...)
{
  return _[a1 maximumTime];
}

id objc_msgSend_mediaPlayingPaused(void *a1, const char *a2, ...)
{
  return _[a1 mediaPlayingPaused];
}

id objc_msgSend_mediaPlayingStarted(void *a1, const char *a2, ...)
{
  return _[a1 mediaPlayingStarted];
}

id objc_msgSend_messageToolbar_handleActionForButtonType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "messageToolbar:handleActionForButtonType:");
}

id objc_msgSend_messageToolbarDidSelectRTTButton_(void *a1, const char *a2, ...)
{
  return [a1 messageToolbarDidSelectRTTButton:];
}

id objc_msgSend_messageToolbarShouldShowRTTButton_(void *a1, const char *a2, ...)
{
  return [a1 messageToolbarShouldShowRTTButton:];
}

id objc_msgSend_messageTranscriptAttributedText(void *a1, const char *a2, ...)
{
  return _[a1 messageTranscriptAttributedText];
}

id objc_msgSend_messageTranscriptConfidence(void *a1, const char *a2, ...)
{
  return _[a1 messageTranscriptConfidence];
}

id objc_msgSend_messageTranscriptConfidenceRating(void *a1, const char *a2, ...)
{
  return _[a1 messageTranscriptConfidenceRating];
}

id objc_msgSend_messageTranscriptView_didReceiveTapGesture_(void *a1, const char *a2, ...)
{
  return [a1 messageTranscriptView:didReceiveTapGesture:];
}

id objc_msgSend_messageTranscriptView_didReportFeedback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "messageTranscriptView:didReportFeedback:");
}

id objc_msgSend_messageView(void *a1, const char *a2, ...)
{
  return _[a1 messageView];
}

id objc_msgSend_metadataCache(void *a1, const char *a2, ...)
{
  return _[a1 metadataCache];
}

id objc_msgSend_metadataDestinationIDsForVMVoicemails_(void *a1, const char *a2, ...)
{
  return [a1 metadataDestinationIDsForVMVoicemails:];
}

id objc_msgSend_metadataForDestinationID_(void *a1, const char *a2, ...)
{
  return [a1 metadataForDestinationID:];
}

id objc_msgSend_metadataForProvider_(void *a1, const char *a2, ...)
{
  return [a1 metadataForProvider:];
}

id objc_msgSend_metricsCollectionValidForLocale_(void *a1, const char *a2, ...)
{
  return [a1 metricsCollectionValidForLocale:];
}

id objc_msgSend_metricsForTextStyle_(void *a1, const char *a2, ...)
{
  return [a1 metricsForTextStyle:];
}

id objc_msgSend_minimumTime(void *a1, const char *a2, ...)
{
  return _[a1 minimumTime];
}

id objc_msgSend_monospacedDigitSystemFontOfSize_weight_(void *a1, const char *a2, ...)
{
  return [a1 monospacedDigitSystemFontOfSize:];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return _[a1 navigationItem];
}

id objc_msgSend_negativeFeedbackURL(void *a1, const char *a2, ...)
{
  return _[a1 negativeFeedbackURL];
}

id objc_msgSend_neutralFeedbackURL(void *a1, const char *a2, ...)
{
  return _[a1 neutralFeedbackURL];
}

id objc_msgSend_normalizedHandleWithDestinationID_(void *a1, const char *a2, ...)
{
  return [a1 normalizedHandleWithDestinationID:];
}

id objc_msgSend_notification(void *a1, const char *a2, ...)
{
  return _[a1 notification];
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return _[a1 object];
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return [a1 objectForKey:];
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 objectForKeyedSubscript:];
}

id objc_msgSend_onVoicemailsChanged(void *a1, const char *a2, ...)
{
  return _[a1 onVoicemailsChanged];
}

id objc_msgSend_openFeedbackURL_(void *a1, const char *a2, ...)
{
  return [a1 openFeedbackURL];
}

id objc_msgSend_openURL_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 openURL:completionHandler:];
}

id objc_msgSend_outputs(void *a1, const char *a2, ...)
{
  return _[a1 outputs];
}

id objc_msgSend_pause(void *a1, const char *a2, ...)
{
  return _[a1 pause];
}

id objc_msgSend_phPreferredFontDescriptorForTextStyle_(void *a1, const char *a2, ...)
{
  return [a1 phPreferredFontDescriptorForTextStyle:];
}

id objc_msgSend_phPreferredFontDescriptorForTextStyle_addingSymbolicTraits_(void *a1, const char *a2, ...)
{
  return [a1 phPreferredFontDescriptorForTextStyle:addingSymbolicTraits:];
}

id objc_msgSend_phPreferredTightLeadingFontForTextStyle_(void *a1, const char *a2, ...)
{
  return [a1 phPreferredTightLeadingFontForTextStyle:];
}

id objc_msgSend_phoneNumberWithDigits_countryCode_(void *a1, const char *a2, ...)
{
  return [a1 phoneNumberWithDigits:countryCode:];
}

id objc_msgSend_phoneNumberWithStringValue_(void *a1, const char *a2, ...)
{
  return [a1 phoneNumberWithStringValue:];
}

id objc_msgSend_phoneNumbers(void *a1, const char *a2, ...)
{
  return _[a1 phoneNumbers];
}

id objc_msgSend_play(void *a1, const char *a2, ...)
{
  return _[a1 play];
}

id objc_msgSend_playPauseButton(void *a1, const char *a2, ...)
{
  return _[a1 playPauseButton];
}

id objc_msgSend_playbackControls_didRequestState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playbackControls:didRequestState:");
}

id objc_msgSend_player(void *a1, const char *a2, ...)
{
  return _[a1 player];
}

id objc_msgSend_playerControlButton(void *a1, const char *a2, ...)
{
  return _[a1 playerControlButton];
}

id objc_msgSend_playerControlButtonWidthLayoutConstraintConstant(void *a1, const char *a2, ...)
{
  return _[a1 playerControlButtonWidthLayoutConstraintConstant];
}

id objc_msgSend_playerController(void *a1, const char *a2, ...)
{
  return _[a1 playerController];
}

id objc_msgSend_playerController_didChangeToCurrentTime_(void *a1, const char *a2, ...)
{
  return [a1 playerController:didChangeToCurrentTime:];
}

id objc_msgSend_playerController_didChangeToDuration_(void *a1, const char *a2, ...)
{
  return [a1 playerController:didChangeToDuration:];
}

id objc_msgSend_playerController_didChangeToRate_(void *a1, const char *a2, ...)
{
  return [a1 playerController:didChangeToRate:];
}

id objc_msgSend_playerController_didChangeToStatus_(void *a1, const char *a2, ...)
{
  return [a1 playerController:didChangeToStatus:];
}

id objc_msgSend_playerController_didChangeToTimeControlStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playerController:didChangeToTimeControlStatus:");
}

id objc_msgSend_playerController_didSeekToTime_(void *a1, const char *a2, ...)
{
  return [a1 playerController:didSeekToTime:];
}

id objc_msgSend_playerController_willChangeToDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playerController:willChangeToDuration:");
}

id objc_msgSend_playerController_willChangeToRate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playerController:willChangeToRate:");
}

id objc_msgSend_playerController_willChangeToStatus_(void *a1, const char *a2, ...)
{
  return [a1 playerController:willChangeToStatus:];
}

id objc_msgSend_playerController_willChangeToTimeControlStatus_(void *a1, const char *a2, ...)
{
  return [a1 playerController:willChangeToTimeControlStatus:];
}

id objc_msgSend_playerController_willSeekToTime_(void *a1, const char *a2, ...)
{
  return [a1 playerController:willSeekToTime:];
}

id objc_msgSend_playerControllerDidReset_(void *a1, const char *a2, ...)
{
  return [a1 playerControllerDidReset:];
}

id objc_msgSend_playerControlsView(void *a1, const char *a2, ...)
{
  return _[a1 playerControlsView];
}

id objc_msgSend_playerControlsViewBottomAnchorLayoutConstraint(void *a1, const char *a2, ...)
{
  return _[a1 playerControlsViewBottomAnchorLayoutConstraint];
}

id objc_msgSend_playerControlsViewController(void *a1, const char *a2, ...)
{
  return _[a1 playerControlsViewController];
}

id objc_msgSend_playerControlsViewLayoutConstraints(void *a1, const char *a2, ...)
{
  return _[a1 playerControlsViewLayoutConstraints];
}

id objc_msgSend_playerControlsViewTopAnchorLayoutConstraint(void *a1, const char *a2, ...)
{
  return _[a1 playerControlsViewTopAnchorLayoutConstraint];
}

id objc_msgSend_playerControlsViewTopAnchorLayoutConstraintConstant(void *a1, const char *a2, ...)
{
  return _[a1 playerControlsViewTopAnchorLayoutConstraintConstant];
}

id objc_msgSend_playerItemWithURL_(void *a1, const char *a2, ...)
{
  return [a1 playerItemWithURL:];
}

id objc_msgSend_playerState(void *a1, const char *a2, ...)
{
  return _[a1 playerState];
}

id objc_msgSend_playerTimelineSlider_didChangeElapsedTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playerTimelineSlider:didChangeElapsedTime:");
}

id objc_msgSend_playerTimelineSliderScrubbingDidBegin_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playerTimelineSliderScrubbingDidBegin:");
}

id objc_msgSend_playerTimelineSliderScrubbingDidCancel_(void *a1, const char *a2, ...)
{
  return [a1 playerTimelineSliderScrubbingDidCancel:];
}

id objc_msgSend_playerTimelineSliderScrubbingDidEnd_(void *a1, const char *a2, ...)
{
  return [a1 playerTimelineSliderScrubbingDidEnd:];
}

id objc_msgSend_playerWithPlayerItem_(void *a1, const char *a2, ...)
{
  return [a1 playerWithPlayerItem:];
}

id objc_msgSend_pointSize(void *a1, const char *a2, ...)
{
  return _[a1 pointSize];
}

id objc_msgSend_portType(void *a1, const char *a2, ...)
{
  return _[a1 portType];
}

id objc_msgSend_positiveFeedbackURL(void *a1, const char *a2, ...)
{
  return _[a1 positiveFeedbackURL];
}

id objc_msgSend_postNotificationName_object_userInfo_(void *a1, const char *a2, ...)
{
  return [a1 postNotificationName:object:userInfo:];
}

id objc_msgSend_postalAddresses(void *a1, const char *a2, ...)
{
  return _[a1 postalAddresses];
}

id objc_msgSend_preferredContentSizeCategory(void *a1, const char *a2, ...)
{
  return _[a1 preferredContentSizeCategory];
}

id objc_msgSend_preferredFontDescriptorWithTextStyle_addingSymbolicTraits_options_(void *a1, const char *a2, ...)
{
  return [a1 preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:];
}

id objc_msgSend_preferredFontForTextStyle_(void *a1, const char *a2, ...)
{
  return [a1 preferredFontForTextStyle:];
}

id objc_msgSend_provider(void *a1, const char *a2, ...)
{
  return _[a1 provider];
}

id objc_msgSend_proximityState(void *a1, const char *a2, ...)
{
  return _[a1 proximityState];
}

id objc_msgSend_rangeOfString_(void *a1, const char *a2, ...)
{
  return [a1 rangeOfString:];
}

id objc_msgSend_rate(void *a1, const char *a2, ...)
{
  return _[a1 rate];
}

id objc_msgSend_regionCode(void *a1, const char *a2, ...)
{
  return _[a1 regionCode];
}

id objc_msgSend_reloadData(void *a1, const char *a2, ...)
{
  return _[a1 reloadData];
}

id objc_msgSend_remainingTime(void *a1, const char *a2, ...)
{
  return _[a1 remainingTime];
}

id objc_msgSend_remainingTimeLabel(void *a1, const char *a2, ...)
{
  return _[a1 remainingTimeLabel];
}

id objc_msgSend_remainingTimeLabelBottomAnchorLayoutConstraint(void *a1, const char *a2, ...)
{
  return _[a1 remainingTimeLabelBottomAnchorLayoutConstraint];
}

id objc_msgSend_remainingTimeLabelFirstBaselineAnchorLayoutConstraint(void *a1, const char *a2, ...)
{
  return _[a1 remainingTimeLabelFirstBaselineAnchorLayoutConstraint];
}

id objc_msgSend_remainingTimeLabelFirstBaselineAnchorLayoutConstraintConstant(void *a1, const char *a2, ...)
{
  return _[a1 remainingTimeLabelFirstBaselineAnchorLayoutConstraintConstant];
}

id objc_msgSend_remainingTimeLabelLeadingAnchorLayoutConstraint(void *a1, const char *a2, ...)
{
  return _[a1 remainingTimeLabelLeadingAnchorLayoutConstraint];
}

id objc_msgSend_remainingTimeLabelTrailingAnchorLayoutConstraint(void *a1, const char *a2, ...)
{
  return _[a1 remainingTimeLabelTrailingAnchorLayoutConstraint];
}

id objc_msgSend_removeAttribute_range_(void *a1, const char *a2, ...)
{
  return [a1 removeAttribute:range:];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return _[a1 removeFromSuperview];
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return [a1 removeObserver];
}

id objc_msgSend_removeObserver_forKeyPath_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:forKeyPath:context:");
}

id objc_msgSend_removeObserver_name_object_(void *a1, const char *a2, ...)
{
  return [a1 removeObserver:name:object:];
}

id objc_msgSend_removeTarget_forEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeTarget:forEvents:");
}

id objc_msgSend_replaceCharactersInRange_withString_(void *a1, const char *a2, ...)
{
  return [a1 replaceCharactersInRange:withString:];
}

id objc_msgSend_replaceCurrentItemWithPlayerItem_(void *a1, const char *a2, ...)
{
  return [a1 replaceCurrentItemWithPlayerItem:];
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return _[a1 request];
}

id objc_msgSend_resizableImageWithCapInsets_(void *a1, const char *a2, ...)
{
  return [a1 resizableImageWithCapInsets:];
}

id objc_msgSend_routeGlyphForDeviceType_displayStyle_color_(void *a1, const char *a2, ...)
{
  return [a1 routeGlyphForDeviceType:displayStyle:color:];
}

id objc_msgSend_rttButton(void *a1, const char *a2, ...)
{
  return _[a1 rttButton];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return _[a1 scale];
}

id objc_msgSend_scaledValueForValue_(void *a1, const char *a2, ...)
{
  return [a1 scaledValueForValue:];
}

id objc_msgSend_secondaryLabelColor(void *a1, const char *a2, ...)
{
  return _[a1 secondaryLabelColor];
}

id objc_msgSend_seekToTime_(void *a1, const char *a2, ...)
{
  return [a1 seekToTime:];
}

id objc_msgSend_sendActionsForControlEvents_(void *a1, const char *a2, ...)
{
  return [a1 sendActionsForControlEvents:];
}

id objc_msgSend_senderDestinationID(void *a1, const char *a2, ...)
{
  return _[a1 senderDestinationID];
}

id objc_msgSend_senderISOCountryCode(void *a1, const char *a2, ...)
{
  return _[a1 senderISOCountryCode];
}

id objc_msgSend_setAccessibilityConstraintsEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setAccessibilityConstraintsEnabled:];
}

id objc_msgSend_setAccessibilityLabel_(void *a1, const char *a2, ...)
{
  return [a1 setAccessibilityLabel:];
}

id objc_msgSend_setActionAtItemEnd_(void *a1, const char *a2, ...)
{
  return [a1 setActionAtItemEnd:];
}

id objc_msgSend_setActive_(void *a1, const char *a2, ...)
{
  return [a1 setActive:];
}

id objc_msgSend_setActive_error_(void *a1, const char *a2, ...)
{
  return [a1 setActive:error:];
}

id objc_msgSend_setActive_withOptions_error_(void *a1, const char *a2, ...)
{
  return [a1 setActive:withOptions:error:];
}

id objc_msgSend_setActualBackgroundColor_(void *a1, const char *a2, ...)
{
  return [a1 setActualBackgroundColor:];
}

id objc_msgSend_setActualTintColor_(void *a1, const char *a2, ...)
{
  return [a1 setActualTintColor:];
}

id objc_msgSend_setAdjustsFontSizeToFitWidth_(void *a1, const char *a2, ...)
{
  return [a1 setAdjustsFontSizeToFitWidth:];
}

id objc_msgSend_setAdjustsImageWhenDisabled_(void *a1, const char *a2, ...)
{
  return [a1 setAdjustsImageWhenDisabled:];
}

id objc_msgSend_setAlignment_(void *a1, const char *a2, ...)
{
  return [a1 setAlignment:];
}

id objc_msgSend_setAllowsExternalPlayback_(void *a1, const char *a2, ...)
{
  return [a1 setAllowsExternalPlayback:];
}

id objc_msgSend_setAlpha_(void *a1, const char *a2, ...)
{
  return [a1 setAlpha:];
}

id objc_msgSend_setAttributedText_(void *a1, const char *a2, ...)
{
  return [a1 setAttributedText:];
}

id objc_msgSend_setAudioSessionState_(void *a1, const char *a2, ...)
{
  return [a1 setAudioSessionState:];
}

id objc_msgSend_setAutoresizingMask_(void *a1, const char *a2, ...)
{
  return [a1 setAutoresizingMask:];
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return [a1 setBackgroundColor:];
}

id objc_msgSend_setBounds_(void *a1, const char *a2, ...)
{
  return [a1 setBounds:];
}

id objc_msgSend_setButtonType_enabled_(void *a1, const char *a2, ...)
{
  return [a1 setButtonType:enabled:];
}

id objc_msgSend_setCategory_error_(void *a1, const char *a2, ...)
{
  return [a1 setCategory:error:];
}

id objc_msgSend_setClipsToBounds_(void *a1, const char *a2, ...)
{
  return [a1 setClipsToBounds:];
}

id objc_msgSend_setConstant_(void *a1, const char *a2, ...)
{
  return [a1 setConstant:];
}

id objc_msgSend_setConstraintsLoaded_(void *a1, const char *a2, ...)
{
  return [a1 setConstraintsLoaded:];
}

id objc_msgSend_setContact_(void *a1, const char *a2, ...)
{
  return [a1 setContact:];
}

id objc_msgSend_setContentCompressionResistancePriority_forAxis_(void *a1, const char *a2, ...)
{
  return [a1 setContentCompressionResistancePriority:forAxis:];
}

id objc_msgSend_setContentHuggingPriority_forAxis_(void *a1, const char *a2, ...)
{
  return [a1 setContentHuggingPriority:forAxis:];
}

id objc_msgSend_setContentInset_(void *a1, const char *a2, ...)
{
  return [a1 setContentInset:];
}

id objc_msgSend_setConversation_(void *a1, const char *a2, ...)
{
  return [a1 setConversation];
}

id objc_msgSend_setCornerRadius_(void *a1, const char *a2, ...)
{
  return [a1 setCornerRadius:];
}

id objc_msgSend_setDataDetectorTypes_(void *a1, const char *a2, ...)
{
  return [a1 setDataDetectorTypes:];
}

id objc_msgSend_setDateStyle_(void *a1, const char *a2, ...)
{
  return [a1 setDateStyle:];
}

id objc_msgSend_setDelaysContentTouches_(void *a1, const char *a2, ...)
{
  return [a1 setDelaysContentTouches:];
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setDelegate:];
}

id objc_msgSend_setDeliversTouchesForGesturesToSuperview_(void *a1, const char *a2, ...)
{
  return [a1 setDeliversTouchesForGesturesToSuperview:];
}

id objc_msgSend_setDetailedScrubbingEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setDetailedScrubbingEnabled:];
}

id objc_msgSend_setDoesRelativeDateFormatting_(void *a1, const char *a2, ...)
{
  return [a1 setDoesRelativeDateFormatting:];
}

id objc_msgSend_setDuration_(void *a1, const char *a2, ...)
{
  return [a1 setDuration:];
}

id objc_msgSend_setEditable_(void *a1, const char *a2, ...)
{
  return [a1 setEditable:];
}

id objc_msgSend_setElapsedTime_(void *a1, const char *a2, ...)
{
  return [a1 setElapsedTime:];
}

id objc_msgSend_setElapsedTime_animated_(void *a1, const char *a2, ...)
{
  return [a1 setElapsedTime:animated:];
}

id objc_msgSend_setElapsedTime_animated_force_(void *a1, const char *a2, ...)
{
  return [a1 setElapsedTime:animated:force:];
}

id objc_msgSend_setElapsedTimeLabelBottomAnchorLayoutConstraint_(void *a1, const char *a2, ...)
{
  return [a1 setElapsedTimeLabelBottomAnchorLayoutConstraint:];
}

id objc_msgSend_setElapsedTimeLabelFirstBaselineAnchorLayoutConstraint_(void *a1, const char *a2, ...)
{
  return [a1 setElapsedTimeLabelFirstBaselineAnchorLayoutConstraint:];
}

id objc_msgSend_setElapsedTimeLabelLeadingAnchorLayoutConstraint_(void *a1, const char *a2, ...)
{
  return [a1 setElapsedTimeLabelLeadingAnchorLayoutConstraint:];
}

id objc_msgSend_setEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setEnabled:];
}

id objc_msgSend_setFeedbackTextViewBottomLayoutConstraint_(void *a1, const char *a2, ...)
{
  return [a1 setFeedbackTextViewBottomLayoutConstraint:];
}

id objc_msgSend_setFeedbackTextViewLeadingLayoutConstraint_(void *a1, const char *a2, ...)
{
  return [a1 setFeedbackTextViewLeadingLayoutConstraint:];
}

id objc_msgSend_setFeedbackTextViewTopLayoutConstraint_(void *a1, const char *a2, ...)
{
  return [a1 setFeedbackTextViewTopLayoutConstraint:];
}

id objc_msgSend_setFeedbackTextViewTrailingLayoutConstraint_(void *a1, const char *a2, ...)
{
  return [a1 setFeedbackTextViewTrailingLayoutConstraint:];
}

id objc_msgSend_setFill(void *a1, const char *a2, ...)
{
  return _[a1 setFill];
}

id objc_msgSend_setFont_(void *a1, const char *a2, ...)
{
  return [a1 setFont:];
}

id objc_msgSend_setHeadIndent_(void *a1, const char *a2, ...)
{
  return [a1 setHeadIndent:];
}

id objc_msgSend_setHidden_(void *a1, const char *a2, ...)
{
  return [a1 setHidden:];
}

id objc_msgSend_setHideAccessoryViews_(void *a1, const char *a2, ...)
{
  return [a1 setHideAccessoryViews:];
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setIdentifier:];
}

id objc_msgSend_setImage_(void *a1, const char *a2, ...)
{
  return [a1 setImage:];
}

id objc_msgSend_setImage_forState_(void *a1, const char *a2, ...)
{
  return [a1 setImage:forState:];
}

id objc_msgSend_setIndicatorViewCenterXLayoutConstraint_(void *a1, const char *a2, ...)
{
  return [a1 setIndicatorViewCenterXLayoutConstraint:];
}

id objc_msgSend_setIndicatorViewTopLayoutConstraint_(void *a1, const char *a2, ...)
{
  return [a1 setIndicatorViewTopLayoutConstraint:];
}

id objc_msgSend_setLayoutSize_withContentPriority_(void *a1, const char *a2, ...)
{
  return [a1 setLayoutSize:withContentPriority:];
}

id objc_msgSend_setLeftBarButtonItem_(void *a1, const char *a2, ...)
{
  return [a1 setLeftBarButtonItem:];
}

id objc_msgSend_setLineBreakMode_(void *a1, const char *a2, ...)
{
  return [a1 setLineBreakMode:];
}

id objc_msgSend_setLineFragmentPadding_(void *a1, const char *a2, ...)
{
  return [a1 setLineFragmentPadding:];
}

id objc_msgSend_setLineHeight_(void *a1, const char *a2, ...)
{
  return [a1 setLineHeight:];
}

id objc_msgSend_setLinkTextAttributes_(void *a1, const char *a2, ...)
{
  return [a1 setLinkTextAttributes:];
}

id objc_msgSend_setLocalizedDate_(void *a1, const char *a2, ...)
{
  return [a1 setLocalizedDate];
}

id objc_msgSend_setLocalizedHeadline_(void *a1, const char *a2, ...)
{
  return [a1 setLocalizedHeadline];
}

id objc_msgSend_setLocalizedSubheadline_(void *a1, const char *a2, ...)
{
  return [a1 setLocalizedSubheadline:];
}

id objc_msgSend_setMarkedVoicemailAsRead_(void *a1, const char *a2, ...)
{
  return [a1 setMarkedVoicemailAsRead:];
}

id objc_msgSend_setMasksToBounds_(void *a1, const char *a2, ...)
{
  return [a1 setMasksToBounds:];
}

id objc_msgSend_setMaximumNumberOfLines_(void *a1, const char *a2, ...)
{
  return [a1 setMaximumNumberOfLines:];
}

id objc_msgSend_setMaximumTime_(void *a1, const char *a2, ...)
{
  return [a1 setMaximumTime:];
}

id objc_msgSend_setMaximumTrackImage_forState_(void *a1, const char *a2, ...)
{
  return [a1 setMaximumTrackImage:forState:];
}

id objc_msgSend_setMessageView_(void *a1, const char *a2, ...)
{
  return [a1 setMessageView:];
}

id objc_msgSend_setMinimumTrackImage_forState_(void *a1, const char *a2, ...)
{
  return [a1 setMinimumTrackImage:forState:];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return _[a1 setNeedsLayout];
}

id objc_msgSend_setNeedsUpdateConstraints(void *a1, const char *a2, ...)
{
  return _[a1 setNeedsUpdateConstraints];
}

id objc_msgSend_setNumberOfLines_(void *a1, const char *a2, ...)
{
  return [a1 setNumberOfLines:];
}

id objc_msgSend_setNumberOfTouchesRequired_(void *a1, const char *a2, ...)
{
  return [a1 setNumberOfTouchesRequired:];
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forKeyedSubscript:];
}

id objc_msgSend_setOpaque_(void *a1, const char *a2, ...)
{
  return [a1 setOpaque:];
}

id objc_msgSend_setPlayPauseButton_(void *a1, const char *a2, ...)
{
  return [a1 setPlayPauseButton:];
}

id objc_msgSend_setPlayerControlsView_(void *a1, const char *a2, ...)
{
  return [a1 setPlayerControlsView:];
}

id objc_msgSend_setPlayerControlsViewBottomAnchorLayoutConstraint_(void *a1, const char *a2, ...)
{
  return [a1 setPlayerControlsViewBottomAnchorLayoutConstraint:];
}

id objc_msgSend_setPlayerControlsViewLayoutConstraints_(void *a1, const char *a2, ...)
{
  return [a1 setPlayerControlsViewLayoutConstraints:];
}

id objc_msgSend_setPlayerControlsViewTopAnchorLayoutConstraint_(void *a1, const char *a2, ...)
{
  return [a1 setPlayerControlsViewTopAnchorLayoutConstraint:];
}

id objc_msgSend_setPlayerItem_(void *a1, const char *a2, ...)
{
  return [a1 setPlayerItem:];
}

id objc_msgSend_setPlayerState_(void *a1, const char *a2, ...)
{
  return [a1 setPlayerState:];
}

id objc_msgSend_setPlayerState_enabled_(void *a1, const char *a2, ...)
{
  return [a1 setPlayerState:enabled:];
}

id objc_msgSend_setPreferredMaxLayoutWidth_(void *a1, const char *a2, ...)
{
  return [a1 setPreferredMaxLayoutWidth:];
}

id objc_msgSend_setPriority_(void *a1, const char *a2, ...)
{
  return [a1 setPriority:];
}

id objc_msgSend_setProximityMonitoringEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setProximityMonitoringEnabled:];
}

id objc_msgSend_setRate_(void *a1, const char *a2, ...)
{
  return [a1 setRate:];
}

id objc_msgSend_setRemainingTimeLabelBottomAnchorLayoutConstraint_(void *a1, const char *a2, ...)
{
  return [a1 setRemainingTimeLabelBottomAnchorLayoutConstraint:];
}

id objc_msgSend_setRemainingTimeLabelFirstBaselineAnchorLayoutConstraint_(void *a1, const char *a2, ...)
{
  return [a1 setRemainingTimeLabelFirstBaselineAnchorLayoutConstraint:];
}

id objc_msgSend_setRemainingTimeLabelLeadingAnchorLayoutConstraint_(void *a1, const char *a2, ...)
{
  return [a1 setRemainingTimeLabelLeadingAnchorLayoutConstraint:];
}

id objc_msgSend_setRemainingTimeLabelTrailingAnchorLayoutConstraint_(void *a1, const char *a2, ...)
{
  return [a1 setRemainingTimeLabelTrailingAnchorLayoutConstraint:];
}

id objc_msgSend_setRightBarButtonItem_(void *a1, const char *a2, ...)
{
  return [a1 setRightBarButtonItem:];
}

id objc_msgSend_setScrollEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setScrollEnabled:];
}

id objc_msgSend_setSelectable_(void *a1, const char *a2, ...)
{
  return [a1 setSelectable:];
}

id objc_msgSend_setSemanticContentAttribute_(void *a1, const char *a2, ...)
{
  return [a1 setSemanticContentAttribute:];
}

id objc_msgSend_setShouldDisplayTranscript_(void *a1, const char *a2, ...)
{
  return [a1 setShouldDisplayTranscript:];
}

id objc_msgSend_setShouldHandleVoicemailChanges_(void *a1, const char *a2, ...)
{
  return [a1 setShouldHandleVoicemailChanges:];
}

id objc_msgSend_setSliderBottomAnchorLayoutConstraint_(void *a1, const char *a2, ...)
{
  return [a1 setSliderBottomAnchorLayoutConstraint:];
}

id objc_msgSend_setSliderLeadingAnchorLayoutConstraint_(void *a1, const char *a2, ...)
{
  return [a1 setSliderLeadingAnchorLayoutConstraint:];
}

id objc_msgSend_setSliderTopAnchorLayoutConstraint_(void *a1, const char *a2, ...)
{
  return [a1 setSliderTopAnchorLayoutConstraint:];
}

id objc_msgSend_setSliderTrailingAnchorLayoutConstraint_(void *a1, const char *a2, ...)
{
  return [a1 setSliderTrailingAnchorLayoutConstraint:];
}

id objc_msgSend_setStandardConstraints_(void *a1, const char *a2, ...)
{
  return [a1 setStandardConstraints:];
}

id objc_msgSend_setState_(void *a1, const char *a2, ...)
{
  return [a1 setState:];
}

id objc_msgSend_setState_animated_(void *a1, const char *a2, ...)
{
  return [a1 setState:animated:];
}

id objc_msgSend_setStatus_(void *a1, const char *a2, ...)
{
  return [a1 setStatus:];
}

id objc_msgSend_setStyle_(void *a1, const char *a2, ...)
{
  return [a1 setStyle:];
}

id objc_msgSend_setTabBarItem_(void *a1, const char *a2, ...)
{
  return [a1 setTabBarItem:];
}

id objc_msgSend_setText_(void *a1, const char *a2, ...)
{
  return [a1 setText:];
}

id objc_msgSend_setTextAlignment_(void *a1, const char *a2, ...)
{
  return [a1 setTextAlignment:];
}

id objc_msgSend_setTextColor_(void *a1, const char *a2, ...)
{
  return [a1 setTextColor:];
}

id objc_msgSend_setTextContainerInset_(void *a1, const char *a2, ...)
{
  return [a1 setTextContainerInset:];
}

id objc_msgSend_setTextViewBottomLayoutConstraint_(void *a1, const char *a2, ...)
{
  return [a1 setTextViewBottomLayoutConstraint:];
}

id objc_msgSend_setTextViewFirstBaselineLayoutConstraint_(void *a1, const char *a2, ...)
{
  return [a1 setTextViewFirstBaselineLayoutConstraint:];
}

id objc_msgSend_setTextViewFirstBaselineWithoutAccessoryViewsLayoutConstraint_(void *a1, const char *a2, ...)
{
  return [a1 setTextViewFirstBaselineWithoutAccessoryViewsLayoutConstraint:];
}

id objc_msgSend_setTextViewLastBaselineLayoutConstraint_(void *a1, const char *a2, ...)
{
  return [a1 setTextViewLastBaselineLayoutConstraint:];
}

id objc_msgSend_setTextViewLeadingLayoutConstraint_(void *a1, const char *a2, ...)
{
  return [a1 setTextViewLeadingLayoutConstraint:];
}

id objc_msgSend_setTextViewTrailingLayoutConstraint_(void *a1, const char *a2, ...)
{
  return [a1 setTextViewTrailingLayoutConstraint:];
}

id objc_msgSend_setThumbImage_forState_(void *a1, const char *a2, ...)
{
  return [a1 setThumbImage:forState:];
}

id objc_msgSend_setThumbImageView_(void *a1, const char *a2, ...)
{
  return [a1 setThumbImageView:];
}

id objc_msgSend_setTimeControlStatus_(void *a1, const char *a2, ...)
{
  return [a1 setTimeControlStatus:];
}

id objc_msgSend_setTimeStyle_(void *a1, const char *a2, ...)
{
  return [a1 setTimeStyle:];
}

id objc_msgSend_setTintColor_(void *a1, const char *a2, ...)
{
  return [a1 setTintColor:];
}

id objc_msgSend_setTintColorDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setTintColorDelegate:];
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return [a1 setTitle:];
}

id objc_msgSend_setTitleLabelFirstBaselineLayoutConstraint_(void *a1, const char *a2, ...)
{
  return [a1 setTitleLabelFirstBaselineLayoutConstraint:];
}

id objc_msgSend_setTitleLabelLeadingLayoutConstraint_(void *a1, const char *a2, ...)
{
  return [a1 setTitleLabelLeadingLayoutConstraint:];
}

id objc_msgSend_setTitleLabelTopLayoutConstraint_(void *a1, const char *a2, ...)
{
  return [a1 setTitleLabelTopLayoutConstraint:];
}

id objc_msgSend_setTitleLabelTrailingLayoutConstraint_(void *a1, const char *a2, ...)
{
  return [a1 setTitleLabelTrailingLayoutConstraint:];
}

id objc_msgSend_setTranscriptSeparatorViewTopAnchorLayoutConstraint_(void *a1, const char *a2, ...)
{
  return [a1 setTranscriptSeparatorViewTopAnchorLayoutConstraint:];
}

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return [a1 setTranslatesAutoresizingMaskIntoConstraints:];
}

id objc_msgSend_setURL_(void *a1, const char *a2, ...)
{
  return [a1 setURL:];
}

id objc_msgSend_setUserInteractionEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setUserInteractionEnabled:];
}

id objc_msgSend_setValue_animated_(void *a1, const char *a2, ...)
{
  return [a1 setValue:animated:];
}

id objc_msgSend_setViewModel_(void *a1, const char *a2, ...)
{
  return [a1 setViewModel:];
}

id objc_msgSend_setVoicemailManager_(void *a1, const char *a2, ...)
{
  return [a1 setVoicemailManager:];
}

id objc_msgSend_setVoicemailMessage_(void *a1, const char *a2, ...)
{
  return [a1 setVoicemailMessage];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sharedUtilityProvider(void *a1, const char *a2, ...)
{
  return _[a1 sharedUtilityProvider];
}

id objc_msgSend_shouldDisplayTranscript(void *a1, const char *a2, ...)
{
  return _[a1 shouldDisplayTranscript];
}

id objc_msgSend_shouldEnableProximityMonitoring(void *a1, const char *a2, ...)
{
  return _[a1 shouldEnableProximityMonitoring];
}

id objc_msgSend_shouldHandleVoicemailChanges(void *a1, const char *a2, ...)
{
  return _[a1 shouldHandleVoicemailChanges];
}

id objc_msgSend_shouldMakeUIForDefaultPNG(void *a1, const char *a2, ...)
{
  return _[a1 shouldMakeUIForDefaultPNG];
}

id objc_msgSend_shouldMarkAsReadForPlaybackCurrentTime_(void *a1, const char *a2, ...)
{
  return [a1 shouldMarkAsReadForPlaybackCurrentTime:];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return _[a1 size];
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return _[a1 sizeToFit];
}

id objc_msgSend_slider(void *a1, const char *a2, ...)
{
  return _[a1 slider];
}

id objc_msgSend_sliderBottomAnchorLayoutConstraint(void *a1, const char *a2, ...)
{
  return _[a1 sliderBottomAnchorLayoutConstraint];
}

id objc_msgSend_sliderLeadingAnchorLayoutConstraint(void *a1, const char *a2, ...)
{
  return _[a1 sliderLeadingAnchorLayoutConstraint];
}

id objc_msgSend_sliderTopAnchorLayoutConstraint(void *a1, const char *a2, ...)
{
  return _[a1 sliderTopAnchorLayoutConstraint];
}

id objc_msgSend_sliderTrailingAnchorLayoutConstraint(void *a1, const char *a2, ...)
{
  return _[a1 sliderTrailingAnchorLayoutConstraint];
}

id objc_msgSend_socialProfiles(void *a1, const char *a2, ...)
{
  return _[a1 socialProfiles];
}

id objc_msgSend_standardConstraints(void *a1, const char *a2, ...)
{
  return _[a1 standardConstraints];
}

id objc_msgSend_startAnimating(void *a1, const char *a2, ...)
{
  return _[a1 startAnimating];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return _[a1 state];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return _[a1 status];
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return _[a1 stop];
}

id objc_msgSend_stopAnimating(void *a1, const char *a2, ...)
{
  return _[a1 stopAnimating];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return _[a1 string];
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return [a1 stringByAppendingString:];
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return [a1 stringByReplacingOccurrencesOfString:withString:];
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return [a1 stringFromDate:];
}

id objc_msgSend_stringFromSeconds_(void *a1, const char *a2, ...)
{
  return [a1 stringFromSeconds:];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 stringWithFormat:];
}

id objc_msgSend_style(void *a1, const char *a2, ...)
{
  return _[a1 style];
}

id objc_msgSend_subheadlineLabel(void *a1, const char *a2, ...)
{
  return _[a1 subheadlineLabel];
}

id objc_msgSend_subheadlineLabelFirstBaselineAnchorLayoutConstraint(void *a1, const char *a2, ...)
{
  return _[a1 subheadlineLabelFirstBaselineAnchorLayoutConstraint];
}

id objc_msgSend_subheadlineLabelFirstBaselineAnchorLayoutConstraintConstant(void *a1, const char *a2, ...)
{
  return _[a1 subheadlineLabelFirstBaselineAnchorLayoutConstraintConstant];
}

id objc_msgSend_subviewsLayoutConstraintsLoaded(void *a1, const char *a2, ...)
{
  return _[a1 subviewsLayoutConstraintsLoaded];
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return _[a1 superview];
}

id objc_msgSend_systemBlueColor(void *a1, const char *a2, ...)
{
  return _[a1 systemBlueColor];
}

id objc_msgSend_systemGrayColor(void *a1, const char *a2, ...)
{
  return _[a1 systemGrayColor];
}

id objc_msgSend_systemLightGrayColor(void *a1, const char *a2, ...)
{
  return _[a1 systemLightGrayColor];
}

id objc_msgSend_systemMidGrayColor(void *a1, const char *a2, ...)
{
  return _[a1 systemMidGrayColor];
}

id objc_msgSend_systemRedColor(void *a1, const char *a2, ...)
{
  return _[a1 systemRedColor];
}

id objc_msgSend_systemWhiteColor(void *a1, const char *a2, ...)
{
  return _[a1 systemWhiteColor];
}

id objc_msgSend_tabBarItemImage(void *a1, const char *a2, ...)
{
  return _[a1 tabBarItemImage];
}

id objc_msgSend_tabBarItemSelectedImage(void *a1, const char *a2, ...)
{
  return _[a1 tabBarItemSelectedImage];
}

id objc_msgSend_tabBarItemTitle(void *a1, const char *a2, ...)
{
  return _[a1 tabBarItemTitle];
}

id objc_msgSend_tabBarSystemItem(void *a1, const char *a2, ...)
{
  return _[a1 tabBarSystemItem];
}

id objc_msgSend_tabBarSystemItemTag(void *a1, const char *a2, ...)
{
  return _[a1 tabBarSystemItemTag];
}

id objc_msgSend_tabBarSystemItemTitle(void *a1, const char *a2, ...)
{
  return _[a1 tabBarSystemItemTitle];
}

id objc_msgSend_telephonyUIBodyShortEmphasizedFont(void *a1, const char *a2, ...)
{
  return _[a1 telephonyUIBodyShortEmphasizedFont];
}

id objc_msgSend_telephonyUIBodyShortFont(void *a1, const char *a2, ...)
{
  return _[a1 telephonyUIBodyShortFont];
}

id objc_msgSend_telephonyUIFootnoteShortFont(void *a1, const char *a2, ...)
{
  return _[a1 telephonyUIFootnoteShortFont];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return _[a1 text];
}

id objc_msgSend_textContainer(void *a1, const char *a2, ...)
{
  return _[a1 textContainer];
}

id objc_msgSend_textStylingAtPosition_inDirection_(void *a1, const char *a2, ...)
{
  return [a1 textStylingAtPosition:inDirection:];
}

id objc_msgSend_textView(void *a1, const char *a2, ...)
{
  return _[a1 textView];
}

id objc_msgSend_textViewBottomLayoutConstraint(void *a1, const char *a2, ...)
{
  return _[a1 textViewBottomLayoutConstraint];
}

id objc_msgSend_textViewFirstBaselineLayoutConstraint(void *a1, const char *a2, ...)
{
  return _[a1 textViewFirstBaselineLayoutConstraint];
}

id objc_msgSend_textViewFirstBaselineLayoutConstraintConstant(void *a1, const char *a2, ...)
{
  return _[a1 textViewFirstBaselineLayoutConstraintConstant];
}

id objc_msgSend_textViewFirstBaselineWithoutAccessoryViewsLayoutConstraint(void *a1, const char *a2, ...)
{
  return _[a1 textViewFirstBaselineWithoutAccessoryViewsLayoutConstraint];
}

id objc_msgSend_textViewLastBaselineLayoutConstraint(void *a1, const char *a2, ...)
{
  return _[a1 textViewLastBaselineLayoutConstraint];
}

id objc_msgSend_textViewLastBaselineLayoutConstraintConstant(void *a1, const char *a2, ...)
{
  return _[a1 textViewLastBaselineLayoutConstraintConstant];
}

id objc_msgSend_textViewLineHeight(void *a1, const char *a2, ...)
{
  return _[a1 textViewLineHeight];
}

id objc_msgSend_thumbHitRect(void *a1, const char *a2, ...)
{
  return _[a1 thumbHitRect];
}

id objc_msgSend_thumbImageView(void *a1, const char *a2, ...)
{
  return _[a1 thumbImageView];
}

id objc_msgSend_thumbRectForBounds_trackRect_value_(void *a1, const char *a2, ...)
{
  return [a1 thumbRectForBounds:trackRect:value:];
}

id objc_msgSend_timeControlStatus(void *a1, const char *a2, ...)
{
  return _[a1 timeControlStatus];
}

id objc_msgSend_timeFormatter(void *a1, const char *a2, ...)
{
  return _[a1 timeFormatter];
}

id objc_msgSend_timelineSlider(void *a1, const char *a2, ...)
{
  return _[a1 timelineSlider];
}

id objc_msgSend_timelineSliderTopAnchorConstraintAccessibilityConstant(void *a1, const char *a2, ...)
{
  return _[a1 timelineSliderTopAnchorConstraintAccessibilityConstant];
}

id objc_msgSend_tintColorDelegate(void *a1, const char *a2, ...)
{
  return _[a1 tintColorDelegate];
}

id objc_msgSend_tintColorForColor_(void *a1, const char *a2, ...)
{
  return [a1 tintColorForColor:];
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return _[a1 titleLabel];
}

id objc_msgSend_titleLabelFirstBaselineLayoutConstraint(void *a1, const char *a2, ...)
{
  return _[a1 titleLabelFirstBaselineLayoutConstraint];
}

id objc_msgSend_titleLabelFirstBaselineLayoutConstraintConstant(void *a1, const char *a2, ...)
{
  return _[a1 titleLabelFirstBaselineLayoutConstraintConstant];
}

id objc_msgSend_titleLabelTopLayoutConstraint(void *a1, const char *a2, ...)
{
  return _[a1 titleLabelTopLayoutConstraint];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return _[a1 topAnchor];
}

id objc_msgSend_tpImageForSymbolType_textStyle_scale_isStaticSize_(void *a1, const char *a2, ...)
{
  return [a1 tpImageForSymbolType:textStyle:scale:isStaticSize:];
}

id objc_msgSend_trackColor(void *a1, const char *a2, ...)
{
  return _[a1 trackColor];
}

id objc_msgSend_trackRectForBounds_(void *a1, const char *a2, ...)
{
  return [a1 trackRectForBounds:];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return _[a1 trailingAnchor];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return _[a1 traitCollection];
}

id objc_msgSend_transcript(void *a1, const char *a2, ...)
{
  return _[a1 transcript];
}

id objc_msgSend_transcriptSeparatorViewTopAnchorLayoutConstraint(void *a1, const char *a2, ...)
{
  return _[a1 transcriptSeparatorViewTopAnchorLayoutConstraint];
}

id objc_msgSend_transcriptSeparatorViewTopAnchorLayoutConstraintConstant(void *a1, const char *a2, ...)
{
  return _[a1 transcriptSeparatorViewTopAnchorLayoutConstraintConstant];
}

id objc_msgSend_transcriptView(void *a1, const char *a2, ...)
{
  return _[a1 transcriptView];
}

id objc_msgSend_transcriptionAttempted(void *a1, const char *a2, ...)
{
  return _[a1 transcriptionAttempted];
}

id objc_msgSend_trashButton(void *a1, const char *a2, ...)
{
  return _[a1 trashButton];
}

id objc_msgSend_trashVoicemails_completion_(void *a1, const char *a2, ...)
{
  return [a1 trashVoicemails:completion:];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _[a1 type];
}

id objc_msgSend_unloadConstraints(void *a1, const char *a2, ...)
{
  return _[a1 unloadConstraints];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntegerValue];
}

id objc_msgSend_updateAudioRouteButtonWithTouchUpInsideEnabled_(void *a1, const char *a2, ...)
{
  return [a1 updateAudioRouteButtonWithTouchUpInsideEnabled:];
}

id objc_msgSend_updateAudioSessionNotifications(void *a1, const char *a2, ...)
{
  return _[a1 updateAudioSessionNotifications];
}

id objc_msgSend_updateButtonGlyphImage(void *a1, const char *a2, ...)
{
  return _[a1 updateButtonGlyphImage];
}

id objc_msgSend_updateCacheWithDestinationIDs_(void *a1, const char *a2, ...)
{
  return [a1 updateCacheWithDestinationIDs:];
}

id objc_msgSend_updateConstraintsConstants(void *a1, const char *a2, ...)
{
  return _[a1 updateConstraintsConstants];
}

id objc_msgSend_updateElapsedTimeLabelText(void *a1, const char *a2, ...)
{
  return _[a1 updateElapsedTimeLabelText];
}

id objc_msgSend_updateMinimumTrackImage(void *a1, const char *a2, ...)
{
  return _[a1 updateMinimumTrackImage];
}

id objc_msgSend_updateProximityMonitoring(void *a1, const char *a2, ...)
{
  return _[a1 updateProximityMonitoring];
}

id objc_msgSend_updateThumbImage(void *a1, const char *a2, ...)
{
  return _[a1 updateThumbImage];
}

id objc_msgSend_updateTrackImages(void *a1, const char *a2, ...)
{
  return _[a1 updateTrackImages];
}

id objc_msgSend_urlAddresses(void *a1, const char *a2, ...)
{
  return _[a1 urlAddresses];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _[a1 userInfo];
}

id objc_msgSend_userInterfaceLayoutDirection(void *a1, const char *a2, ...)
{
  return _[a1 userInterfaceLayoutDirection];
}

id objc_msgSend_userInterfaceStyle(void *a1, const char *a2, ...)
{
  return _[a1 userInterfaceStyle];
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return _[a1 username];
}

id objc_msgSend_utterances(void *a1, const char *a2, ...)
{
  return _[a1 utterances];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return _[a1 value];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return _[a1 view];
}

id objc_msgSend_viewModel(void *a1, const char *a2, ...)
{
  return _[a1 viewModel];
}

id objc_msgSend_voicemailAudioRouteGlyphImage(void *a1, const char *a2, ...)
{
  return _[a1 voicemailAudioRouteGlyphImage];
}

id objc_msgSend_voicemailCaptionRegularFont(void *a1, const char *a2, ...)
{
  return _[a1 voicemailCaptionRegularFont];
}

id objc_msgSend_voicemailCaptionRegularFontDescriptor(void *a1, const char *a2, ...)
{
  return _[a1 voicemailCaptionRegularFontDescriptor];
}

id objc_msgSend_voicemailDeleteGlyphImage(void *a1, const char *a2, ...)
{
  return _[a1 voicemailDeleteGlyphImage];
}

id objc_msgSend_voicemailDialRequestGlyphImage(void *a1, const char *a2, ...)
{
  return _[a1 voicemailDialRequestGlyphImage];
}

id objc_msgSend_voicemailFootnoteFont(void *a1, const char *a2, ...)
{
  return _[a1 voicemailFootnoteFont];
}

id objc_msgSend_voicemailHeadlineShortFont(void *a1, const char *a2, ...)
{
  return _[a1 voicemailHeadlineShortFont];
}

id objc_msgSend_voicemailHeadlineShortFontDescriptor(void *a1, const char *a2, ...)
{
  return _[a1 voicemailHeadlineShortFontDescriptor];
}

id objc_msgSend_voicemailManager(void *a1, const char *a2, ...)
{
  return _[a1 voicemailManager];
}

id objc_msgSend_voicemailMessage(void *a1, const char *a2, ...)
{
  return _[a1 voicemailMessage];
}

id objc_msgSend_voicemailPauseGlyphImage(void *a1, const char *a2, ...)
{
  return _[a1 voicemailPauseGlyphImage];
}

id objc_msgSend_voicemailPlayGlyphImage(void *a1, const char *a2, ...)
{
  return _[a1 voicemailPlayGlyphImage];
}

id objc_msgSend_voicemailReportFeedbackGlyphImage(void *a1, const char *a2, ...)
{
  return _[a1 voicemailReportFeedbackGlyphImage];
}

id objc_msgSend_voicemailSearchEnabled(void *a1, const char *a2, ...)
{
  return _[a1 voicemailSearchEnabled];
}

id objc_msgSend_voicemailTTYGlyphImage(void *a1, const char *a2, ...)
{
  return _[a1 voicemailTTYGlyphImage];
}

id objc_msgSend_voicemailUndeleteGlyphImage(void *a1, const char *a2, ...)
{
  return _[a1 voicemailUndeleteGlyphImage];
}

id objc_msgSend_voicemailWithIdentifier_completion_(void *a1, const char *a2, ...)
{
  return [a1 voicemailWithIdentifier:completion:];
}

id objc_msgSend_wasTranscriptionAttempted(void *a1, const char *a2, ...)
{
  return _[a1 wasTranscriptionAttempted];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return _[a1 whiteColor];
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return _[a1 widthAnchor];
}

id objc_msgSend_withCaseSensitiveAttribute(void *a1, const char *a2, ...)
{
  return _[a1 withCaseSensitiveAttribute];
}