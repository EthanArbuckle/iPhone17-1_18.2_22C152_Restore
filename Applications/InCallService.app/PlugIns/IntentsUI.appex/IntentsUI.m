id RTTUIUtilitiesClass()
{
  void *v0;
  uint64_t vars8;

  if (qword_1000A20B8 != -1) {
    dispatch_once(&qword_1000A20B8, &stru_10008D6C8);
  }
  v0 = (void *)qword_1000A20B0;

  return v0;
}

void sub_100004D20(id a1)
{
  qword_1000A20B0 = CUTWeakLinkClass();
  if (!qword_1000A20B0)
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

UIFont *__cdecl sub_100005010(UIFont *self, SEL a2)
{
  UIFontDescriptorAttributeName v13 = UIFontDescriptorFeatureSettingsAttribute;
  v10[0] = UIFontFeatureTypeIdentifierKey;
  v10[1] = UIFontFeatureSelectorIdentifierKey;
  v11[0] = &off_100090530;
  v11[1] = &off_100090548;
  v3 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
  v12 = v3;
  v4 = +[NSArray arrayWithObjects:&v12 count:1];
  v14 = v4;
  v5 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];

  v6 = [(UIFont *)self fontDescriptor];
  v7 = [v6 fontDescriptorByAddingAttributes:v5];

  v8 = +[UIFont fontWithDescriptor:v7 size:0.0];

  return (UIFont *)v8;
}

void sub_1000051C4(id a1)
{
  qword_1000A20C0 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleHeadline addingSymbolicTraits:0x8000 options:0];

  _objc_release_x1();
}

void sub_10000526C(id a1)
{
  qword_1000A20D0 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleCaption2 addingSymbolicTraits:0x8000 options:0];

  _objc_release_x1();
}

uint64_t sub_100005360(uint64_t a1)
{
  qword_1000A20E0 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

void sub_1000054A8(uint64_t a1)
{
  +[TUCallCapabilities initializeCachedValues];
  id v2 = objc_alloc_init((Class)TUCallProviderManager);
  [*(id *)(a1 + 32) setCallProviderManager:v2];
  v3 = +[CNContactStore contactStore];
  [*(id *)(a1 + 32) setContactStore:v3];

  v4 = +[CNContactStore suggestedContactStore];
  [*(id *)(a1 + 32) setSuggestedContactStore:v4];

  id v5 = objc_alloc_init((Class)TUCallDirectoryMetadataCacheDataProvider);
  v14[0] = v5;
  id v6 = objc_alloc_init((Class)TUMapsMetadataCacheDataProvider);
  v14[1] = v6;
  id v7 = objc_alloc_init((Class)TUSuggestionsMetadataCacheDataProvider);
  v14[2] = v7;
  id v8 = objc_alloc_init((Class)TUGeoLocationMetadataCacheDataProvider);
  v14[3] = v8;
  v9 = +[NSArray arrayWithObjects:v14 count:4];

  id v10 = [objc_alloc((Class)TUMetadataCache) initWithDataProviders:v9];
  [*(id *)(a1 + 32) setMetadataCache:v10];

  if (+[PHDevice isGeminiCapable])
  {
    v11 = [v2 telephonyProvider];
    v12 = [v11 identifier];
    id v13 = [v2 providerWithIdentifier:v12];
  }
  [*(id *)(a1 + 32) setInitializationBlockQueued:0];
}

void sub_1000058A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_1000058C0(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12));
  id v2 = *(id *)(*(void *)(a1 + 32) + 16);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12));

  return v2;
}

uint64_t sub_10000591C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000592C(uint64_t a1)
{
}

uint64_t sub_100005934(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

  return _objc_release_x1();
}

void sub_100005CCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100005CE4(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12));
  id v2 = *(id *)(*(void *)(a1 + 32) + 24);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12));

  return v2;
}

uint64_t sub_100005D40(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

  return _objc_release_x1();
}

void sub_100005FB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100005FC8(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12));
  id v2 = *(id *)(*(void *)(a1 + 32) + 40);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12));

  return v2;
}

uint64_t sub_100006024(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

  return _objc_release_x1();
}

void sub_100006288(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_1000062A0(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12));
  id v2 = *(id *)(*(void *)(a1 + 32) + 32);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12));

  return v2;
}

uint64_t sub_1000062FC(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

  return _objc_release_x1();
}

id PHDefaultLog()
{
  if (qword_1000A20F8 != -1) {
    dispatch_once(&qword_1000A20F8, &stru_10008D818);
  }
  v0 = (void *)qword_1000A20F0;

  return v0;
}

void sub_1000064B4(id a1)
{
  qword_1000A20F0 = (uint64_t)os_log_create("com.apple.calls.mobilephone", "Default");

  _objc_release_x1();
}

void sub_100006AF8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id PHPreferencesGetValue(void *a1)
{
  return PHPreferencesGetValueInDomain(a1, 0);
}

id PHPreferencesGetValueInDomain(void *a1, void *a2)
{
  v3 = a1;
  v4 = a2;
  if (!v4)
  {
    id v5 = +[NSBundle mainBundle];
    v4 = [v5 bundleIdentifier];
  }
  if ([(__CFString *)v3 length] && [(__CFString *)v4 length]) {
    id v6 = (void *)CFPreferencesCopyValue(v3, v4, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
  }
  else {
    id v6 = 0;
  }

  return v6;
}

void PHPreferencesSetValueInDomain(void *a1, void *a2, void *a3)
{
  key = a1;
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    id v7 = +[NSBundle mainBundle];
    id v6 = [v7 bundleIdentifier];
  }
  if ([(__CFString *)key length] && [(__CFString *)v6 length])
  {
    CFPreferencesSetValue(key, v5, v6, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
    CFPreferencesSynchronize(v6, kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
  }
}

void sub_100006D1C(id a1)
{
  id v3 = +[UIFont preferredFontForTextStyle:UIFontTextStyleFootnote];
  uint64_t v1 = [v3 withCaseSensitiveAttribute];
  id v2 = (void *)qword_1000A2100;
  qword_1000A2100 = v1;
}

void sub_100006DD8(id a1)
{
  id v3 = +[UIFontDescriptor voicemailHeadlineShortFontDescriptor];
  uint64_t v1 = +[UIFont fontWithDescriptor:v3 size:0.0];
  id v2 = (void *)qword_1000A2110;
  qword_1000A2110 = v1;
}

void sub_100006EA4(id a1)
{
  id v4 = +[UIFontDescriptor voicemailCaptionRegularFontDescriptor];
  uint64_t v1 = +[UIFont fontWithDescriptor:v4 size:0.0];
  uint64_t v2 = [v1 withCaseSensitiveAttribute];
  id v3 = (void *)qword_1000A2120;
  qword_1000A2120 = v2;
}

void sub_1000094F8(uint64_t a1)
{
  uint64_t v2 = PHDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) intent];
    id v4 = [*(id *)(a1 + 32) extensionContext];
    int v12 = 138412546;
    id v13 = v3;
    __int16 v14 = 2112;
    v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "countdown completed, request handling of intent: %@ on extension context: %@", (uint8_t *)&v12, 0x16u);
  }
  id v6 = *(void **)(a1 + 32);
  id v5 = (id *)(a1 + 32);
  id v7 = [v6 intent];

  if (v7)
  {
    id v8 = [*v5 extensionContext];
    uint64_t v9 = [*v5 intent];
    [v8 _requestHandlingOfIntent:v9];
  }
  else
  {
    id v8 = PHDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10006123C(v5, v8);
    }
  }

  id v10 = PHDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v12) = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Enabling application idleTimer for CallIntentCountdown: countdownCompleted", (uint8_t *)&v12, 2u);
  }

  v11 = +[UIApplication sharedApplication];
  [v11 _setIdleTimerDisabled:0 forReason:@"CallIntentCountdown"];
}

void sub_100009CAC(id a1)
{
  qword_1000A2130 = (uint64_t)objc_alloc_init((Class)CHManager);

  _objc_release_x1();
}

void sub_100009D3C(id a1)
{
  qword_1000A2140 = (uint64_t)objc_alloc_init((Class)NSCache);

  _objc_release_x1();
}

void sub_10000B220(id a1)
{
  qword_1000A2150 = (uint64_t)objc_alloc_init((Class)NSCache);

  _objc_release_x1();
}

void sub_10000B98C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_10000D8E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000D904(uint64_t a1)
{
  --*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  uint64_t v2 = [*(id *)(a1 + 32) countdownLabel];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000DA30;
  v9[3] = &unk_10008D920;
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = v3;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000DAB4;
  v5[3] = &unk_10008D948;
  uint64_t v4 = *(void *)(a1 + 56);
  uint64_t v7 = v3;
  uint64_t v8 = v4;
  v5[4] = v10;
  id v6 = *(id *)(a1 + 40);
  +[UIView transitionWithView:v2 duration:5242880 options:v9 animations:v5 completion:0.200000003];
}

void sub_10000DA30(uint64_t a1)
{
  id v3 = +[NSString stringWithFormat:@"%ld", *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
  uint64_t v2 = [*(id *)(a1 + 32) countdownLabel];
  [v2 setText:v3];
}

uint64_t sub_10000DAB4(uint64_t result)
{
  if (!*(void *)(*(void *)(*(void *)(result + 48) + 8) + 24))
  {
    uint64_t v1 = result;
    uint64_t v2 = PHDefaultLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(v1 + 56);
      int v4 = 134217984;
      uint64_t v5 = v3;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "completed count down from number: %ld", (uint8_t *)&v4, 0xCu);
    }

    [*(id *)(v1 + 32) cancel];
    return (*(uint64_t (**)(void))(*(void *)(v1 + 40) + 16))();
  }
  return result;
}

id sub_10000E704(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 handle];
  uint64_t v8 = [v7 value];

  if ([v8 length])
  {
    uint64_t v9 = *(void **)(a1 + 32);
    uint64_t v10 = [v6 UUID];
    LODWORD(v9) = [v9 isEmergencyNumberForDigits:v8 senderIdentityUUID:v10];

    if (v9) {
      [v5 setDialType:1];
    }
  }
  if ([v5 dialType] == (id)1
    && [*(id *)(a1 + 40) canMakeEmergencyCallForSenderIdentity:v6])
  {
    id v11 = v6;
    int v12 = PHDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412546;
      id v17 = v5;
      __int16 v18 = 2112;
      id v19 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Updating emergency dial request %@ to use sender identity %@", (uint8_t *)&v16, 0x16u);
    }

    id v13 = [v11 UUID];
    [v5 setLocalSenderIdentityUUID:v13];

    __int16 v14 = [v11 accountUUID];
    [v5 setLocalSenderIdentityAccountUUID:v14];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

void sub_100011DF4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) gridView];
  [v2 setArrangedSubviewRows:&__NSArray0__struct];

  uint64_t v3 = [*(id *)(a1 + 32) titleStackView];
  [v3 setArrangedSubviews:&__NSArray0__struct];

  id v4 = [*(id *)(a1 + 32) subtitleStackView];
  [v4 setArrangedSubviews:&__NSArray0__struct];
}

void sub_100012B4C(id a1)
{
  uint64_t v1 = objc_alloc_init(PHDevice);
  uint64_t v2 = qword_1000A2160;
  qword_1000A2160 = (uint64_t)v1;

  _objc_release_x1(v1, v2);
}

void sub_100012BCC(id a1)
{
  int v4 = 0;
  CFBooleanRef v1 = (const __CFBoolean *)MGCopyAnswerWithError();
  if (v1)
  {
    CFBooleanRef v2 = v1;
    byte_1000A2170 = CFBooleanGetValue(v1) != 0;
    CFRelease(v2);
  }
  else
  {
    uint64_t v3 = PHDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_1000617B8(v3);
    }
  }
}

id sub_100012D84(uint64_t a1)
{
  id v2 = objc_alloc((Class)RadiosPreferences);
  uint64_t v3 = [*(id *)(a1 + 32) dispatchQueue];
  id v4 = [v2 initWithQueue:v3];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v4;

  [*(id *)(*(void *)(a1 + 32) + 24) setDelegate:];
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = [*(id *)(a1 + 32) fetchCellularRadioEnabled];
  id result = [*(id *)(a1 + 32) fetchRingerSwitchEnabled];
  *(unsigned char *)(*(void *)(a1 + 32) + 9) = (_BYTE)result;
  return result;
}

void sub_100012F40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100012F58(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 8);
  return result;
}

void sub_100013004(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned __int8 *)(v1 + 8) != v2)
  {
    *(unsigned char *)(v1 + 8) = v2;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100013094;
    block[3] = &unk_10008D758;
    block[4] = *(void *)(a1 + 32);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

void sub_100013094(uint64_t a1)
{
  id v2 = +[NSNotificationCenter defaultCenter];
  [v2 postNotificationName:@"PHDeviceCellularRadioEnabledDidChangeNotification" object:*(void *)(a1 + 32)];
}

void sub_1000131B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000131CC(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 9);
  return result;
}

void sub_100013278(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned __int8 *)(v1 + 9) != v2)
  {
    *(unsigned char *)(v1 + 9) = v2;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100013308;
    block[3] = &unk_10008D758;
    block[4] = *(void *)(a1 + 32);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

void sub_100013308(uint64_t a1)
{
  id v2 = +[NSNotificationCenter defaultCenter];
  [v2 postNotificationName:@"PHDeviceRingerSwitchDidChangeNotification" object:*(void *)(a1 + 32)];
}

void sub_10001347C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100013494(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000134A4(uint64_t a1)
{
}

void sub_1000134AC(uint64_t a1)
{
}

void sub_100013600(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100013624(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setRingerSwitchEnabled:[WeakRetained fetchRingerSwitchEnabled]];
}

id sub_1000137CC(id a1, SEL a2, id a3)
{
  id v4 = a3;
  uint64_t v5 = [v4 senderDestinationID];
  if ([v5 length])
  {
    id v6 = [v4 senderISOCountryCode];
    uint64_t v7 = +[TUHandle normalizedPhoneNumberHandleForValue:v5 isoCountryCode:v6];

    if (v7) {
      id v8 = [objc_alloc((Class)a1) initWithHandle:v7];
    }
    else {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

id sub_100013894(id a1, SEL a2, id a3)
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableOrderedSet);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v3;
  id v5 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v22;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v10 = [v9 receiverDestinationID];
        if ([v10 length])
        {
          id v11 = [v9 receiverISOCountryCode];
          int v12 = +[TUHandle normalizedPhoneNumberHandleForValue:v10 isoCountryCode:v11];

          if (v12) {
            id v13 = [objc_alloc((Class)TUMetadataDestinationID) initWithHandle:v12];
          }
          else {
            id v13 = 0;
          }
          [v4 addObject:v13];
        }
        else
        {
          id v13 = 0;
        }
        __int16 v14 = [v9 senderDestinationID];

        if ([v14 length])
        {
          v15 = [v9 senderISOCountryCode];
          int v16 = +[TUHandle normalizedPhoneNumberHandleForValue:v14 isoCountryCode:v15];

          if (v16)
          {
            id v17 = [objc_alloc((Class)TUMetadataDestinationID) initWithHandle:v16];

            id v13 = v17;
          }
          [v4 addObject:v13];
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v6);
  }

  __int16 v18 = [v4 array];

  return v18;
}

void sub_100013F18(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) fetchContactFormatter];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 64);
  *(void *)(v3 + 64) = v2;

  uint64_t v5 = [*(id *)(a1 + 32) fetchNumberFormatter];
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(v6 + 88);
  *(void *)(v6 + 88) = v5;

  id v8 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void **)(v9 + 80);
  *(void *)(v9 + 80) = v8;

  [*(id *)(a1 + 32) updateRecentCalls];
  [*(id *)(a1 + 32) setUnreadCallCount:[*(id *)(*(void *)(a1 + 32) + 24) unreadCallCount]];
  id v11 = +[NSNotificationCenter defaultCenter];
  [v11 addObserver:*(void *)(a1 + 32) selector:"handleCNContactStoreDidChangeNotification:" name:CNContactStoreDidChangeNotification object:0];
  [v11 addObserver:*(void *)(a1 + 32) selector:"handleIDSServiceAvailabilityDidChangeNotification:" name:IDSServiceAvailabilityDidChangeNotification object:0];
  [v11 addObserver:*(void *)(a1 + 32) selector:"handleNSCurrentLocaleDidChangeNotification:" name:NSCurrentLocaleDidChangeNotification object:0];
  [v11 addObserver:*(void *)(a1 + 32) selector:"handleTUCallHistoryControllerRecentCallsDidChangeNotification:" name:TUCallHistoryControllerRecentCallsDidChangeNotification object:0];
  [v11 addObserver:*(void *)(a1 + 32) selector:"handleTUCallHistoryControllerUnreadCallCountDidChangeNotification:" name:TUCallHistoryControllerUnreadCallCountDidChangeNotification object:0];
  [v11 addObserver:*(void *)(a1 + 32) selector:"handleTUMetadataCacheDidFinishUpdatingNotification:" name:TUMetadataCacheDidFinishUpdatingNotification object:*(void *)(*(void *)(a1 + 32) + 96)];
  [v11 addObserver:*(void *)(a1 + 32) selector:"handleUIApplicationSignificantTimeChangeNotification:" name:UIApplicationSignificantTimeChangeNotification object:0];
  [v11 addObserver:*(void *)(a1 + 32) selector:"handleUIApplicationDidBecomeActiveNotification:" name:UIApplicationDidBecomeActiveNotification object:0];
  objc_initWeak(&location, *(id *)(a1 + 32));
  if (qword_1000A2190 != -1) {
    dispatch_once(&qword_1000A2190, &stru_10008DC48);
  }
  int v12 = (const char *)qword_1000A2198;
  uint64_t v13 = *(void *)(a1 + 32);
  __int16 v14 = (int *)(v13 + 16);
  v15 = *(NSObject **)(v13 + 48);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000141F8;
  handler[3] = &unk_10008DAA0;
  objc_copyWeak(&v18, &location);
  id v17 = *(id *)(a1 + 32);
  notify_register_dispatch(v12, v14, v15, handler);
  [*(id *)(a1 + 32) setInitializationBlockQueued:0];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void sub_1000141D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000141F8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = PHDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      if (qword_1000A2190 != -1) {
        dispatch_once(&qword_1000A2190, &stru_10008DC48);
      }
      *(_DWORD *)buf = 136315138;
      uint64_t v10 = qword_1000A2198;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Handling %s by fetching metadata for recent calls", buf, 0xCu);
    }

    id v4 = [*(id *)(a1 + 32) recentCalls];
    if ([v4 count])
    {
      uint64_t v5 = [*(id *)(a1 + 32) serialQueue];
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_10001438C;
      v6[3] = &unk_10008DA78;
      id v7 = *(id *)(a1 + 32);
      id v8 = v4;
      dispatch_async(v5, v6);
    }
  }
}

id sub_10001438C(uint64_t a1)
{
  return [*(id *)(a1 + 32) fetchMetadataForRecentCalls:*(void *)(a1 + 40)];
}

void sub_1000146E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_1000146F8(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12));
  id v2 = *(id *)(*(void *)(a1 + 32) + 104);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12));

  return v2;
}

uint64_t sub_100014754(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100014764(uint64_t a1)
{
}

uint64_t sub_10001476C(uint64_t a1)
{
  uint64_t v2 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return _objc_release_x1(v2, v4);
}

void sub_100014A84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100014AA0(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) contactForHandle:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return _objc_release_x1(v2, v4);
}

void sub_100014C00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100014C18(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) itemCache];
  uint64_t v2 = [*(id *)(a1 + 40) uniqueId];
  uint64_t v3 = [v6 objectForKeyedSubscript:v2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void sub_100014DF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100014E08(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) callHistoryController];
  id v3 = [v2 coalescingStrategy];

  if (v3 == (id)2)
  {
    uint64_t v4 = (id *)&kCHCoalescingStrategyCollapseIfEqual;
  }
  else
  {
    if (v3 != (id)1) {
      return;
    }
    uint64_t v4 = (id *)&kCHCoalescingStrategyRecents;
  }
  id v5 = *v4;
  if (v5)
  {
    id v9 = v5;
    uint64_t v6 = [*(id *)(a1 + 40) coalescedCallWithCall:*(void *)(a1 + 48) usingStrategy:v5];
    uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
}

void sub_100014F60(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) callHistoryController];
  [v1 deleteAllRecentCalls];
}

void sub_100015058(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) callHistoryController];
  [v2 deleteRecentCalls:*(void *)(a1 + 40)];
}

void sub_10001517C(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) callHistoryController];
  [v1 markRecentCallsAsRead];
}

void sub_100015248(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) callHistoryController];
  [v1 markRecentAudioCallsAsRead];
}

void sub_100015448(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100015460(uint64_t a1)
{
  id v7 = [*(id *)(a1 + 32) contactsByHandleForRecentCall:*(void *)(a1 + 40) keyDescriptors:*(void *)(a1 + 48)];
  id v2 = [v7 allValues];
  id v3 = [v2 firstObject];
  uint64_t v4 = [v3 firstObject];
  uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

void sub_100015638(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100015650(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) contactsByHandleForRecentCall:*(void *)(a1 + 40) keyDescriptors:*(void *)(a1 + 48)];
  if (v2)
  {
    uint64_t v3 = +[NSMutableDictionary dictionary];
    uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v6 = [v2 allKeys];
    id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          int v12 = [v2 objectForKeyedSubscript:v11];
          uint64_t v13 = [v12 firstObject];
          [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setObject:v13 forKeyedSubscript:v11];
        }
        id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }
  }
}

void sub_1000158E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000158FC(uint64_t a1)
{
  id v2 = PHDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v12 = 138412290;
    uint64_t v13 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Attempting to create a dial request for recent call %@", (uint8_t *)&v12, 0xCu);
  }

  uint64_t v4 = [*(id *)(a1 + 40) callProviderManager];
  uint64_t v5 = [v4 dialRequestForRecentCall:*(void *)(a1 + 32)];
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id v8 = [*(id *)(a1 + 32) validRemoteParticipantHandles];
    uint64_t v9 = [v8 anyObject];

    if (v9)
    {
      uint64_t v10 = [*(id *)(a1 + 40) contactForHandle:v9];
      uint64_t v11 = [v10 identifier];
      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setContactIdentifier:v11];
    }
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setOriginatingUIType:8];
  }
  else
  {
    uint64_t v9 = PHDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100061878((uint64_t *)(a1 + 32), v9);
    }
  }
}

void sub_100015BD8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = PHDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000618F4(a1, (uint64_t)v3, v4);
    }
  }
}

id sub_100016460(uint64_t a1)
{
  return _[*(id *)(a1 + 32) recentsController:*(void *)(a1 + 40) didUpdateCalls:*(void *)(a1 + 48)];
}

id sub_100016470(uint64_t a1)
{
  return _[*(id *)(a1 + 32) recentsController:*(void *)(a1 + 40) didChangeCalls:*(void *)(*(void *)(a1 + 48) + 104)];
}

id sub_10001665C(uint64_t a1)
{
  return _[*(id *)(a1 + 32) recentsController:*(void *)(a1 + 40) didChangeCalls:*(void *)(a1 + 48)];
}

id sub_100016824(uint64_t a1)
{
  return _[*(id *)(a1 + 32) recentsController:*(void *)(a1 + 40) didChangeUnreadCallCount:*(void *)(a1 + 48)];
}

id sub_1000169E8(uint64_t a1)
{
  return _[*(id *)(a1 + 32) recentsControllerDidChangeMessages:*(void *)(a1 + 40)];
}

void sub_100017EB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100017ECC(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) identifier];
  uint64_t v4 = +[CNContactViewController descriptorForRequiredKeys];
  uint64_t v9 = v4;
  uint64_t v5 = +[NSArray arrayWithObjects:&v9 count:1];
  uint64_t v6 = [v2 fetchUnifiedContactForID:v3 withDescriptors:v5];
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

id sub_100019B6C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (![v3 length]) {
    goto LABEL_6;
  }
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4 == 1)
  {
    uint64_t v5 = TUBundle();
    uint64_t v6 = [v5 localizedStringForKey:@"%@_AND_ONE_OTHER" value:&stru_10008F308 table:@"TelephonyUtilities"];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v3);
    id v7 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_7;
  }
  if (v4 >= 2)
  {
    id v8 = TUBundle();
    uint64_t v9 = [v8 localizedStringForKey:@"%@_AND_%@_OTHERS" value:&stru_10008F308 table:@"TelephonyUtilities"];
    uint64_t v10 = [*(id *)(a1 + 32) numberFormatter];
    uint64_t v11 = +[NSNumber numberWithInteger:*(void *)(a1 + 40)];
    int v12 = [v10 stringFromNumber:v11];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v3, v12);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_6:
    id v7 = v3;
  }
LABEL_7:

  return v7;
}

void sub_100019ECC(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) featureFlags];
  unsigned int v3 = [v2 phoneRecentsAvatarsEnabled];

  if (v3)
  {
    uint64_t v4 = [*(id *)(a1 + 32) serialQueue];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100019F98;
    v7[3] = &unk_10008DA78;
    id v5 = *(id *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 32);
    id v8 = v5;
    uint64_t v9 = v6;
    dispatch_async(v4, v7);
  }
}

void sub_100019F98(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count])
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v2 = *(id *)(a1 + 32);
    id v3 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v3)
    {
      id v4 = v3;
      uint64_t v5 = *(void *)v16;
      do
      {
        for (i = 0; i != v4; i = (char *)i + 1)
        {
          if (*(void *)v16 != v5) {
            objc_enumerationMutation(v2);
          }
          id v7 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          id v8 = [v7 uniqueId];
          uint64_t v9 = [*(id *)(a1 + 40) itemCache];
          uint64_t v10 = [v9 objectForKeyedSubscript:v8];
          id v11 = [v10 mutableCopy];

          if (v11)
          {
            int v12 = [*(id *)(a1 + 40) localizedSubtitleForRecentCall:v7];
            [v11 setLocalizedSubtitle:v12];

            id v13 = [v11 copy];
            long long v14 = [*(id *)(a1 + 40) itemCache];
            [v14 setObject:v13 forKeyedSubscript:v8];
          }
        }
        id v4 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v4);
    }

    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 40) + 12));
    [*(id *)(a1 + 40) notifyDelegatesRecentsController:*(void *)(a1 + 40) didUpdateCalls:*(void *)(a1 + 32)];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 40) + 12));
  }
}

void sub_10001A97C(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) recentCalls];
  if ([v6 count])
  {
    id v2 = [*(id *)(a1 + 32) contactCache];
    [v2 removeAllObjects];

    id v3 = *(void **)(a1 + 32);
    id v4 = [v3 recentCalls];
    [v3 fetchContactsForRecentCalls:v4];

    uint64_t v5 = [*(id *)(a1 + 32) itemCache];
    [v5 removeAllObjects];

    [*(id *)(a1 + 32) populateItemCacheForRecentCalls:v6];
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12));
    [*(id *)(a1 + 32) notifyDelegatesRecentsController:*(void *)(a1 + 32) didChangeCalls:v6];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12));
  }
}

id sub_10001ABC8(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateRecentCalls];
}

void sub_10001AD38(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) fetchContactFormatter];
  [*(id *)(a1 + 32) setContactFormatter:v2];

  id v3 = [*(id *)(a1 + 32) fetchNumberFormatter];
  [*(id *)(a1 + 32) setNumberFormatter:v3];

  id v8 = [*(id *)(a1 + 32) recentCalls];
  if ([v8 count])
  {
    id v4 = [*(id *)(a1 + 32) itemCache];
    [v4 removeAllObjects];

    [*(id *)(a1 + 32) populateItemCacheForRecentCalls:v8];
    uint64_t v5 = [*(id *)(a1 + 32) featureFlags];
    unsigned int v6 = [v5 phoneRecentsAvatarsEnabled];

    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12));
    id v7 = *(void **)(a1 + 32);
    if (v6) {
      [v7 notifyDelegatesRecentsController:v7 didUpdateCalls:v8];
    }
    else {
      [v7 notifyDelegatesRecentsController:v7 didChangeCalls:v8];
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12));
  }
}

id sub_10001B01C(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateRecentCalls];
}

void sub_10001B314(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) recentCalls];
  if ([v2 count])
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v16 = v2;
    id v3 = v2;
    id v4 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v18;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v18 != v6) {
            objc_enumerationMutation(v3);
          }
          id v8 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          uint64_t v9 = [v8 uniqueId];
          uint64_t v10 = [*(id *)(a1 + 32) itemCache];
          id v11 = [v10 objectForKeyedSubscript:v9];
          id v12 = [v11 mutableCopy];

          if (v12)
          {
            id v13 = [*(id *)(a1 + 32) localizedSubtitleForRecentCall:v8];
            [v12 setLocalizedSubtitle:v13];

            id v14 = [v12 copy];
            long long v15 = [*(id *)(a1 + 32) itemCache];
            [v15 setObject:v14 forKeyedSubscript:v9];
          }
        }
        id v5 = [v3 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v5);
    }

    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12));
    [*(id *)(a1 + 32) notifyDelegatesRecentsController:*(void *)(a1 + 32) didChangeCalls:v3];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12));
    id v2 = v16;
  }
}

void sub_10001B660(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) recentCalls];
  if ([v3 count])
  {
    id v2 = [*(id *)(a1 + 32) itemCache];
    [v2 removeAllObjects];

    [*(id *)(a1 + 32) populateItemCacheForRecentCalls:v3];
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12));
    [*(id *)(a1 + 32) notifyDelegatesRecentsController:*(void *)(a1 + 32) didChangeCalls:v3];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12));
  }
}

id sub_10001B868(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateRecentCalls];
}

void sub_10001C5BC(id a1)
{
  id v3 = +[NSBundle mainBundle];
  uint64_t v1 = [v3 localizedStringForKey:@"UNKNOWN_LABEL" value:&stru_10008F308 table:@"PHRecents"];
  id v2 = (void *)qword_1000A2180;
  qword_1000A2180 = v1;
}

void sub_10001C794(id a1)
{
  uint64_t v1 = (uint64_t *)CUTWeakLinkSymbol();
  if (v1) {
    qword_1000A2198 = *v1;
  }
}

void sub_10001C7CC(id a1)
{
  v4[0] = CNContactPhoneNumbersKey;
  v4[1] = CNContactEmailAddressesKey;
  uint64_t v1 = +[CNContactFormatter descriptorForRequiredKeysForStyle:0];
  v4[2] = v1;
  v4[3] = CNContactSocialProfilesKey;
  uint64_t v2 = +[NSArray arrayWithObjects:v4 count:4];
  id v3 = (void *)qword_1000A21A0;
  qword_1000A21A0 = v2;
}

void sub_10001CA9C(id *a1)
{
  uint64_t v2 = a1 + 5;
  objc_copyWeak(&to, a1 + 5);
  id v3 = objc_loadWeakRetained(&to);

  if (v3)
  {
    id v4 = [a1[6] sharedUtilityProvider];
    id v5 = [a1[4] UUIDString];
    uint64_t v6 = [v4 conversationForCallUID:v5];

    if (v6)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10001CC34;
      block[3] = &unk_10008DC90;
      objc_copyWeak(&v10, v2);
      uint64_t v6 = v6;
      id v8 = v6;
      id v9 = a1[4];
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

      objc_destroyWeak(&v10);
    }
  }
  else
  {
    uint64_t v6 = PHDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Stopped fetchRTTConversationForCallUUID because MPRTTTranscriptionMessage was deallocated before starting", buf, 2u);
    }
  }

  objc_destroyWeak(&to);
}

void sub_10001CC1C(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_10001CC34(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained setConversation:*(void *)(a1 + 32)];
    id v4 = PHDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Successfully finished fetchRTTConversationForCallUUID", v8, 2u);
    }

    id v5 = +[NSNotificationCenter defaultCenter];
    CFStringRef v9 = @"MPVoicemailRTTTranscriptDidLoadCallIDKey";
    uint64_t v6 = [*(id *)(a1 + 40) UUIDString];
    id v10 = v6;
    id v7 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
    [v5 postNotificationName:@"MPVoicemailRTTTranscriptDidLoadNotification" object:0 userInfo:v7];
  }
  else
  {
    id v5 = PHDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Stopped fetchRTTConversationForCallUUID because MPRTTTranscriptionMessage was deallocated when trying to write conversation", v8, 2u);
    }
  }
}

void sub_100021E84(uint64_t a1)
{
  uint64_t v2 = PHDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "MPVoicemailController initWithVoicemailManager, inside serialDispatchQueue", buf, 2u);
  }

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 96), &_dispatch_main_q);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 32);
  *(void *)(v3 + 32) = &__NSArray0__struct;

  id v5 = *(void **)(a1 + 32);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002208C;
  v7[3] = &unk_10008DCE0;
  id v8 = v5;
  [v8 fetchMessagesCompletion:v7];
  uint64_t v6 = +[NSNotificationCenter defaultCenter];
  [v6 addObserver:*(void *)(a1 + 32) selector:"handleCNContactStoreDidChangeNotification:" name:CNContactStoreDidChangeNotification object:0];
  [v6 addObserver:*(void *)(a1 + 32) selector:"handleNSCurrentLocaleDidChangeNotification:" name:NSCurrentLocaleDidChangeNotification object:0];
  [v6 addObserver:*(void *)(a1 + 32) selector:"handleTUMetadataCacheDidFinishUpdatingNotification:" name:TUMetadataCacheDidFinishUpdatingNotification object:0];
  [v6 addObserver:*(void *)(a1 + 32) selector:"handleUIApplicationSignificantTimeChangeNotification:" name:UIApplicationSignificantTimeChangeNotification object:0];
  [v6 addObserver:*(void *)(a1 + 32) selector:"handleUIApplicationWillEnterForegroundNotification:" name:UIApplicationWillEnterForegroundNotification object:0];
  [v6 addObserver:*(void *)(a1 + 32) selector:"handleRecentsChangedNotification:" name:kCallHistoryDatabaseChangedNotification object:0];
  [v6 addObserver:*(void *)(a1 + 32) selector:"handleVoicemailsChangedNotification:" name:@"PHVoicemailManagerVoicemailsChanged" object:0];
}

void sub_10002208C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = PHDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "MPVoicemailController initWithVoicemailManager, fetchMessagesCompletion", v5, 2u);
  }

  [*(id *)(a1 + 32) setMessages:v3];
}

void sub_10002225C(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

uint64_t sub_100022270(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    id WeakRetained = (id)(*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
    id v3 = v5;
  }

  return _objc_release_x1(WeakRetained, v3);
}

void sub_1000223BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000223D4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000223E4(uint64_t a1)
{
}

void sub_1000223EC(uint64_t a1)
{
}

void sub_1000224E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100022500(uint64_t a1)
{
}

void sub_1000225B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000225D0(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 40);
  return result;
}

void sub_100022810(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100022828(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) identifier];
  id v43 = +[NSString stringWithFormat:@"%@", v2];

  id v3 = [*(id *)(a1 + 40) localizedSubtitleCache];
  uint64_t v4 = [v3 objectForKey:v43];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if (![*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) length])
  {
    id v7 = [*(id *)(a1 + 32) senderDestinationID];
    if ([v7 length])
    {
      id v8 = [*(id *)(a1 + 32) senderISOCountryCode];
      CFStringRef v9 = [*(id *)(a1 + 40) senderContactForMessage:*(void *)(a1 + 32)];
      id v10 = +[TUHandle normalizedHandleWithDestinationID:v7];
      id v11 = v10;
      if (v9 && [v10 type] == (id)2)
      {
        id v12 = +[CNPhoneNumber phoneNumberWithDigits:v7 countryCode:v8];
        if (v12)
        {
          id v13 = [v9 labeledValueForPhoneNumber:v12];
        }
        else
        {
          id v13 = 0;
        }
        id v14 = [v13 label];
        uint64_t v15 = +[CNLabeledValue localizedDisplayStringForLabel:v14 propertyName:CNContactPhoneNumbersKey];
        uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8);
        long long v17 = *(void **)(v16 + 40);
        *(void *)(v16 + 40) = v15;
      }
      if (![*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) length])
      {
        id v18 = [objc_alloc((Class)TUMetadataDestinationID) initWithHandle:v11];
        if (v18)
        {
          long long v19 = [*(id *)(a1 + 40) metadataCache];
          long long v20 = [v19 metadataForDestinationID:v18];

          uint64_t v21 = [v20 metadataForProvider:objc_opt_class()];
          uint64_t v22 = *(void *)(*(void *)(a1 + 48) + 8);
          long long v23 = *(void **)(v22 + 40);
          *(void *)(v22 + 40) = v21;

          if (![*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) length])
          {
            uint64_t v24 = [v20 metadataForProvider:objc_opt_class()];
            uint64_t v25 = *(void *)(*(void *)(a1 + 48) + 8);
            v26 = *(void **)(v25 + 40);
            *(void *)(v25 + 40) = v24;
          }
          if (![*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) length])
          {
            uint64_t v27 = [v20 metadataForProvider:objc_opt_class()];
            uint64_t v28 = *(void *)(*(void *)(a1 + 48) + 8);
            v29 = *(void **)(v28 + 40);
            *(void *)(v28 + 40) = v27;
          }
        }
      }
    }
    v30 = [*(id *)(a1 + 40) featureFlags];
    unsigned int v31 = [v30 callScreeningEnabledM3];

    if (v31)
    {
      v32 = [*(id *)(a1 + 32) provider];
      unsigned int v33 = [v32 isEqual:@"com.apple.telephonyutilities.callservicesd.FaceTimeProvider"];

      if (v33)
      {
        v34 = +[NSBundle mainBundle];
        uint64_t v35 = [v34 localizedStringForKey:@"MPVOICEMAIL_TABLE_VIEW_CELL_TITLE_FaceTime_Audio" value:&stru_10008F308 table:@"MPVoicemail"];
        uint64_t v36 = *(void *)(*(void *)(a1 + 48) + 8);
        v37 = *(void **)(v36 + 40);
        *(void *)(v36 + 40) = v35;
      }
    }
    if (![*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) length])
    {
      v38 = +[NSBundle mainBundle];
      uint64_t v39 = [v38 localizedStringForKey:@"MPVOICEMAIL_TABLE_VIEW_CELL_SUBTITLE_UNKNOWN" value:&stru_10008F308 table:@"MPVoicemail"];
      uint64_t v40 = *(void *)(*(void *)(a1 + 48) + 8);
      v41 = *(void **)(v40 + 40);
      *(void *)(v40 + 40) = v39;
    }
    v42 = [*(id *)(a1 + 40) localizedSubtitleCache];
    [v42 setObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) forKey:v43];
  }
}

void sub_100022E24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100022E3C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) identifier];
  id v21 = +[NSString stringWithFormat:@"%@", v2];

  id v3 = [*(id *)(a1 + 40) localizedDowntimeTitleCache];
  uint64_t v4 = [v3 objectForKey:v21];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id v7 = [*(id *)(a1 + 40) senderContactForMessage:*(void *)(a1 + 32)];
    id v8 = [*(id *)(a1 + 40) contactFormatter];
    CFStringRef v9 = [v8 stringFromContact:v7];

    if (![v9 length])
    {
      uint64_t v10 = [*(id *)(a1 + 40) localizedHandleTitleFromMessage:*(void *)(a1 + 32)];

      CFStringRef v9 = (void *)v10;
    }
    if (![v9 length])
    {
      id v11 = +[NSBundle mainBundle];
      uint64_t v12 = [v11 localizedStringForKey:@"MPVOICEMAIL_TABLE_VIEW_CELL_TITLE_UNKNOWN" value:&stru_10008F308 table:@"MPVoicemail"];

      CFStringRef v9 = (void *)v12;
    }
    id v13 = *(void **)(a1 + 40);
    id v14 = TUBundle();
    uint64_t v15 = [v14 localizedStringForKey:@"DOWNTIME_CALLER_%@" value:&stru_10008F308 table:@"TelephonyUtilities"];
    uint64_t v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v15, v9);
    uint64_t v17 = [v13 attributedStringForDowntimeMessage:v16];
    uint64_t v18 = *(void *)(*(void *)(a1 + 48) + 8);
    long long v19 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = v17;

    long long v20 = [*(id *)(a1 + 40) localizedDowntimeTitleCache];
    [v20 setObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) forKey:v21];
  }
}

void sub_100023178(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100023190(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) identifier];
  id v20 = +[NSString stringWithFormat:@"%@", v2];

  id v3 = [*(id *)(a1 + 40) localizedTitleCache];
  uint64_t v4 = [v3 objectForKey:v20];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id v7 = [*(id *)(a1 + 40) senderContactForMessage:*(void *)(a1 + 32)];
    id v8 = [*(id *)(a1 + 40) contactFormatter];
    uint64_t v9 = [v8 stringFromContact:v7];
    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
    id v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    if (![*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) length])
    {
      uint64_t v12 = [*(id *)(a1 + 40) localizedHandleTitleFromMessage:*(void *)(a1 + 32)];
      uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
      id v14 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = v12;
    }
    if (![*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) length])
    {
      uint64_t v15 = +[NSBundle mainBundle];
      uint64_t v16 = [v15 localizedStringForKey:@"MPVOICEMAIL_TABLE_VIEW_CELL_TITLE_UNKNOWN" value:&stru_10008F308 table:@"MPVoicemail"];
      uint64_t v17 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v18 = *(void **)(v17 + 40);
      *(void *)(v17 + 40) = v16;
    }
    long long v19 = [*(id *)(a1 + 40) localizedTitleCache];
    [v19 setObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) forKey:v20];
  }
}

void sub_1000236EC(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_100023700(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = +[NSMutableArray array];
    id v4 = WeakRetained[4];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v13;
      do
      {
        id v8 = 0;
        do
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * (void)v8);
          if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))()) {
            [v3 addObject:v9];
          }
          id v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }
    uint64_t v10 = *(void *)(a1 + 40);
    id v11 = [v3 copy];
    (*(void (**)(uint64_t, id))(v10 + 16))(v10, v11);
  }
}

void sub_100023ADC(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_100023AF0(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = +[NSMutableArray array];
    id v4 = WeakRetained[3];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v13;
      do
      {
        id v8 = 0;
        do
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * (void)v8);
          if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))()) {
            [v3 addObject:v9];
          }
          id v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }
    uint64_t v10 = *(void *)(a1 + 40);
    id v11 = [v3 copy];
    (*(void (**)(uint64_t, id))(v10 + 16))(v10, v11);
  }
}

id sub_100023D3C(uint64_t a1)
{
  return _[*(id *)(a1 + 32) deleteVoicemails:*(void *)(a1 + 40)];
}

id sub_100023E20(uint64_t a1)
{
  return _[*(id *)(a1 + 32) markVoicemailsAsRead:*(void *)(a1 + 40)];
}

id sub_100023F04(uint64_t a1)
{
  return _[*(id *)(a1 + 32) trashVoicemails:*(void *)(a1 + 40)];
}

id sub_100023FE8(uint64_t a1)
{
  return _[*(id *)(a1 + 32) removeVoicemailsFromTrash:*(void *)(a1 + 40)];
}

void sub_1000240DC(void *a1)
{
  uint64_t v1 = (void *)a1[4];
  uint64_t v2 = a1[5];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100024170;
  v4[3] = &unk_10008DD80;
  id v3 = (void *)a1[7];
  void v4[4] = a1[6];
  id v5 = v3;
  [v1 voicemailWithIdentifier:v2 completion:v4];
}

void sub_100024170(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) completionDispatchQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100024234;
  v7[3] = &unk_10008DD58;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t sub_100024234(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

BOOL sub_100024728(id a1, MPMessage *a2, NSDictionary *a3)
{
  return [(MPMessage *)a2 messageType] != (id)2;
}

id sub_100024868(id result)
{
  uint64_t v1 = *((void *)result + 4);
  uint64_t v2 = *((void *)result + 5);
  if (*(void *)(v1 + 40) != v2)
  {
    *(void *)(v1 + 40) = v2;
    return _[*((id *)result + 4) postMPVoicemailControllerUnreadMessageCountDidChangeNotification];
  }
  return result;
}

void sub_100024A90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100024AA8(uint64_t a1)
{
  id v7 = [*(id *)(a1 + 32) senderDestinationID];
  if ([v7 length])
  {
    uint64_t v2 = [*(id *)(a1 + 40) contactCache];
    id v3 = [v2 objectForKeyedSubscript:v7];
    uint64_t v4 = [v3 value];
    uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
}

void sub_100024FD0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) serialDispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100025098;
  block[3] = &unk_10008DE38;
  uint64_t v5 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, block);
}

uint64_t sub_100025098(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = [v2 contactKeyDescriptors];
  [v2 fetchContactsForMessages:v3 keyDescriptors:v4];

  [*(id *)(a1 + 32) fetchMetadataForMessages:*(void *)(a1 + 40)];
  uint64_t v5 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v5();
}

void sub_1000252A8(id a1)
{
  dispatch_queue_t v3 = dispatch_queue_create("com.apple.mobilephone.voicemail", 0);
  id v1 = [objc_alloc((Class)CoreTelephonyClient) initWithQueue:v3];
  uint64_t v2 = (void *)qword_1000A21B0;
  qword_1000A21B0 = (uint64_t)v1;
}

void sub_1000253D8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v6)
  {
    uint64_t v24 = 0;
    id v7 = dispatch_group_create();
    uint64_t v28 = +[NSMutableArray array];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v25 = v5;
    id v8 = [v5 subscriptions];
    id v31 = [v8 countByEnumeratingWithState:&v41 objects:v45 count:16];
    if (!v31) {
      goto LABEL_20;
    }
    uint64_t v30 = *(void *)v42;
    v26 = v8;
    uint64_t v27 = a1;
    while (1)
    {
      for (i = 0; i != v31; i = (char *)i + 1)
      {
        if (*(void *)v42 != v30) {
          objc_enumerationMutation(v8);
        }
        uint64_t v10 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        id v11 = [v10 context:v24];
        long long v12 = [*(id *)(a1 + 32) accountManager];
        long long v13 = [v12 accounts];
        v40[0] = _NSConcreteStackBlock;
        v40[1] = 3221225472;
        v40[2] = sub_1000257F0;
        v40[3] = &unk_10008DEA8;
        v40[4] = v10;
        long long v14 = [v13 tu_firstObjectPassingTest:v40];

        if (v14)
        {
          long long v15 = [*(id *)(a1 + 32) accountManager];
          uint64_t v16 = [v14 UUID];
          if ([v15 isAccountSubscribed:v16])
          {

            goto LABEL_17;
          }
          uint64_t v17 = [*(id *)(a1 + 32) accountManager];
          if ((objc_opt_respondsToSelector() & 1) == 0)
          {

LABEL_16:
            dispatch_group_enter(v7);
            id v21 = *(void **)(a1 + 40);
            v35[0] = _NSConcreteStackBlock;
            v35[1] = 3221225472;
            v35[2] = sub_100025864;
            v35[3] = &unk_10008DED0;
            uint64_t v36 = v7;
            id v37 = v28;
            id v38 = v14;
            uint64_t v39 = v10;
            [v21 getVoicemailInfo:v11 completion:v35];

            long long v15 = v36;
LABEL_17:

            goto LABEL_18;
          }
          uint64_t v18 = [*(id *)(a1 + 32) accountManager];
          [v14 UUID];
          v20 = long long v19 = v7;
          unsigned int v29 = [v18 isCallVoicemailSupportedForAccountUUID:v20];

          id v7 = v19;
          a1 = v27;

          id v8 = v26;
          if (v29) {
            goto LABEL_16;
          }
        }
LABEL_18:
      }
      id v31 = [v8 countByEnumeratingWithState:&v41 objects:v45 count:16];
      if (!v31)
      {
LABEL_20:

        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1000259F8;
        block[3] = &unk_10008DD58;
        id v22 = *(id *)(a1 + 48);
        id v33 = v28;
        id v34 = v22;
        id v23 = v28;
        dispatch_group_notify(v7, (dispatch_queue_t)&_dispatch_main_q, block);

        id v6 = v24;
        id v5 = v25;
        goto LABEL_21;
      }
    }
  }
  id v7 = PHDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_100061AF8((uint64_t)v6, v7);
  }
LABEL_21:
}

id sub_1000257F0(uint64_t a1, void *a2)
{
  dispatch_queue_t v3 = [a2 UUID];
  uint64_t v4 = [v3 UUIDString];
  id v5 = [*(id *)(a1 + 32) labelID];
  id v6 = [v4 isEqualToString:v5];

  return v6;
}

void sub_100025864(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = PHDefaultLog();
  id v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100061B70((uint64_t)v9, v11);
    }
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      if (a2) {
        CFStringRef v12 = @"YES";
      }
      else {
        CFStringRef v12 = @"NO";
      }
      int v17 = 138412546;
      CFStringRef v18 = v12;
      __int16 v19 = 1024;
      unsigned int v20 = [v8 intValue];
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Voicemail info returned available=%@, count=%d", (uint8_t *)&v17, 0x12u);
    }

    long long v13 = *(void **)(a1 + 40);
    long long v14 = [MPLegacyVoicemail alloc];
    id v11 = [*(id *)(a1 + 48) UUID];
    long long v15 = [*(id *)(a1 + 56) label];
    uint64_t v16 = [(MPLegacyVoicemail *)v14 initWithAccountID:v11 label:v15 hasUnreadMessages:a2];
    [v13 addObject:v16];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t sub_1000259F8(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

id sub_100025B68(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) contactCache];
  [v2 removeAllObjects];

  dispatch_queue_t v3 = [*(id *)(a1 + 32) localizedSubtitleCache];
  [v3 removeAllObjects];

  uint64_t v4 = [*(id *)(a1 + 32) localizedTitleCache];
  [v4 removeAllObjects];

  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = v5[4];
  id v7 = [v5 contactKeyDescriptors];
  [v5 fetchContactsForMessages:v6 keyDescriptors:v7];

  id v8 = *(void **)(a1 + 32);

  return [v8 postMPVoicemailControllerMessagesDidChangeNotification];
}

id sub_100025D74(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) localizedSubtitleCache];
  [v2 removeAllObjects];

  dispatch_queue_t v3 = [*(id *)(a1 + 32) localizedTitleCache];
  [v3 removeAllObjects];

  uint64_t v4 = *(void **)(a1 + 32);

  return [v4 postMPVoicemailControllerMessagesDidChangeNotification];
}

id sub_100025F34(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  dispatch_queue_t v3 = *(void **)(v2 + 144);
  *(void *)(v2 + 144) = 0;

  uint64_t v4 = [*(id *)(a1 + 32) localizedSubtitleCache];
  [v4 removeAllObjects];

  id v5 = [*(id *)(a1 + 32) localizedTitleCache];
  [v5 removeAllObjects];

  uint64_t v6 = *(void **)(a1 + 32);

  return [v6 postMPVoicemailControllerMessagesDidChangeNotification];
}

id sub_100026104(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) localizedSubtitleCache];
  [v2 removeAllObjects];

  dispatch_queue_t v3 = [*(id *)(a1 + 32) localizedTitleCache];
  [v3 removeAllObjects];

  uint64_t v4 = [*(id *)(a1 + 32) localizedDowntimeTitleCache];
  [v4 removeAllObjects];

  id v5 = *(void **)(a1 + 32);

  return [v5 postMPVoicemailControllerMessagesDidChangeNotification];
}

id sub_1000264F0(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100026560;
  v3[3] = &unk_10008DCE0;
  v3[4] = v1;
  return [v1 fetchMessagesCompletion:v3];
}

id sub_100026560(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setMessages:a2];
}

void sub_1000265F4(uint64_t a1)
{
  id v2 = +[NSNotificationCenter defaultCenter];
  [v2 postNotificationName:@"MPVoicemailControllerMessagesDidChangeNotification" object:*(void *)(a1 + 32)];
}

void sub_1000266DC(uint64_t a1)
{
  id v2 = +[NSNotificationCenter defaultCenter];
  [v2 postNotificationName:@"MPVoicemailControllerUnreadMessageCountDidChangeNotification" object:*(void *)(a1 + 32)];
}

void sub_1000274C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v7 = [*(id *)(a1 + 32) _accessibilityHigherContrastTintColorForColor:a2];
  id v8 = *(void **)(a1 + 40);
  NSAttributedStringKey v10 = NSForegroundColorAttributeName;
  id v11 = v7;
  id v9 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  [v8 setAttributes:v9 range:a3, a4];
}

void sub_10002B0AC(uint64_t a1)
{
  uint64_t v2 = *(unsigned __int8 *)(a1 + 40);
  dispatch_queue_t v3 = [*(id *)(a1 + 32) metadataView];
  [v3 setExpanded:v2];

  uint64_t v4 = *(unsigned __int8 *)(a1 + 40);
  id v5 = [*(id *)(a1 + 32) metadataViewTapGestureRecognizer];
  [v5 setEnabled:v4];
}

id sub_10002B12C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) transcriptView];
  [v2 setNeedsUpdateConstraints];

  [*(id *)(a1 + 32) setNeedsUpdateConstraints];
  dispatch_queue_t v3 = [*(id *)(a1 + 32) transcriptView];
  [v3 layoutIfNeeded];

  uint64_t v4 = *(void **)(a1 + 32);

  return [v4 layoutIfNeeded];
}

id PHIsInAirplaneMode()
{
  id v0 = objc_alloc_init((Class)RadiosPreferences);
  id v1 = [v0 airplaneMode];

  return v1;
}

void sub_10002C9D4(id a1)
{
  uint64_t v1 = +[UIImage tpImageForSymbolType:26 textStyle:UIFontTextStyleBody scale:3 isStaticSize:0];
  uint64_t v2 = qword_1000A21C0;
  qword_1000A21C0 = v1;

  _objc_release_x1(v1, v2);
}

void sub_10002CA80(id a1)
{
  uint64_t v1 = +[UIImage tpImageForSymbolType:25 textStyle:UIFontTextStyleBody scale:3 isStaticSize:0];
  uint64_t v2 = qword_1000A21D0;
  qword_1000A21D0 = v1;

  _objc_release_x1(v1, v2);
}

id PHVoicemailCellDateFormatter()
{
  id v0 = (void *)qword_1000A21E0;
  if (!qword_1000A21E0)
  {
    id v1 = objc_alloc_init((Class)NSDateFormatter);
    uint64_t v2 = (void *)qword_1000A21E0;
    qword_1000A21E0 = (uint64_t)v1;

    [(id)qword_1000A21E0 setTimeStyle:1];
    [(id)qword_1000A21E0 setDateStyle:3];
    id v0 = (void *)qword_1000A21E0;
  }

  return v0;
}

id PHVoicemailDurationFormatter()
{
  if (qword_1000A21F0 != -1) {
    dispatch_once(&qword_1000A21F0, &stru_10008DF80);
  }
  id v0 = (void *)qword_1000A21E8;

  return v0;
}

void sub_10002F344(id a1)
{
  id v1 = objc_alloc_init((Class)NSDateComponentsFormatter);
  uint64_t v2 = (void *)qword_1000A21E8;
  qword_1000A21E8 = (uint64_t)v1;

  [(id)qword_1000A21E8 setAllowedUnits:192];
  dispatch_queue_t v3 = (void *)qword_1000A21E8;

  _[v3 setZeroFormattingBehavior:0x10000];
}

id PHVoicemailFormatTime(double a1)
{
  id v1 = &stru_10008F308;
  if (a1 >= 0.0)
  {
    double v2 = a1;
  }
  else
  {
    id v1 = @"-";
    double v2 = -a1;
  }
  dispatch_queue_t v3 = v1;
  uint64_t v4 = PHVoicemailDurationFormatter();
  id v5 = [v4 stringFromTimeInterval:v2];

  uint64_t v6 = +[NSString stringWithFormat:@"%@%@", v3, v5];

  return v6;
}

float PHVoicemailLowQualityConfidenceThresholdForTranscript()
{
  id v0 = PHPreferencesGetValue(@"VoicemailTranscriptionLowQualityConfidenceThreshold");
  id v1 = v0;
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
  id v0 = PHPreferencesGetValue(@"VoicemailTranscriptionConfidenceThreshold");
  id v1 = v0;
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
  if (qword_1000A2200 != -1) {
    dispatch_once(&qword_1000A2200, &stru_10008DFA0);
  }
  id v0 = (void *)qword_1000A21F8;

  return v0;
}

void sub_10002F564(id a1)
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
  id v5 = [v2 localizedStringForKey:v4 value:&stru_10008F308 table:@"General"];

  id v6 = objc_alloc((Class)NSAttributedString);
  v12[0] = NSForegroundColorAttributeName;
  id v7 = +[UIColor colorWithRed:0.572549045 green:0.572549045 blue:0.572549045 alpha:1.0];
  v13[0] = v7;
  v12[1] = NSFontAttributeName;
  id v8 = +[UIFont phPreferredTightLeadingFontForTextStyle:UIFontTextStyleBody];
  v13[1] = v8;
  id v9 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
  id v10 = [v6 initWithString:v5 attributes:v9];
  id v11 = (void *)qword_1000A21F8;
  qword_1000A21F8 = (uint64_t)v10;
}

id PHVoicemailTranscriptAttributedSuffix()
{
  if (qword_1000A2210[0] != -1) {
    dispatch_once(qword_1000A2210, &stru_10008DFC0);
  }
  id v0 = (void *)qword_1000A2208;

  return v0;
}

void sub_10002F748(id a1)
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
  id v5 = [v2 localizedStringForKey:v4 value:&stru_10008F308 table:@"General"];

  id v6 = objc_alloc((Class)NSAttributedString);
  v12[0] = NSForegroundColorAttributeName;
  id v7 = +[UIColor colorWithRed:0.572549045 green:0.572549045 blue:0.572549045 alpha:1.0];
  v13[0] = v7;
  v12[1] = NSFontAttributeName;
  id v8 = +[UIFont phPreferredTightLeadingFontForTextStyle:UIFontTextStyleBody];
  v13[1] = v8;
  id v9 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
  id v10 = [v6 initWithString:v5 attributes:v9];
  id v11 = (void *)qword_1000A2208;
  qword_1000A2208 = (uint64_t)v10;
}

uint64_t PHVoicemailFeedbackReportingAvailable()
{
  return 0;
}

uint64_t sub_100031A94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[46] = a5;
  v6[47] = a6;
  v6[45] = a4;
  uint64_t v7 = sub_100061DD0();
  v6[48] = v7;
  v6[49] = *(void *)(v7 - 8);
  v6[50] = swift_task_alloc();
  v6[51] = swift_task_alloc();
  uint64_t v8 = sub_100061E60();
  v6[52] = v8;
  v6[53] = *(void *)(v8 - 8);
  v6[54] = swift_task_alloc();
  v6[55] = swift_task_alloc();
  v6[56] = sub_100035DD8(&qword_1000A0F70);
  v6[57] = swift_task_alloc();
  sub_100035DD8(&qword_1000A0F78);
  v6[58] = swift_task_alloc();
  uint64_t v9 = sub_100035DD8(&qword_1000A0F80);
  v6[59] = v9;
  v6[60] = *(void *)(v9 - 8);
  v6[61] = swift_task_alloc();
  uint64_t v10 = sub_100035DD8(&qword_1000A0F88);
  v6[62] = v10;
  v6[63] = *(void *)(v10 - 8);
  v6[64] = swift_task_alloc();
  v6[65] = sub_100062410();
  v6[66] = sub_100062400();
  uint64_t v12 = sub_1000623E0();
  v6[67] = v12;
  v6[68] = v11;
  return _swift_task_switch(sub_100031D34, v12, v11);
}

uint64_t sub_100031D34()
{
  uint64_t v1 = *(void *)(v0 + 480);
  uint64_t v2 = *(void *)(v0 + 488);
  uint64_t v3 = *(void *)(v0 + 472);
  *(void *)(v0 + 552) = sub_100036330(&qword_1000A0F68, (void (*)(uint64_t))&type metadata accessor for LiveVoicemailTip);
  sub_100062210();
  sub_100062730();
  sub_100036378(&qword_1000A0F90, &qword_1000A0F70);
  sub_100062480();
  sub_100062770();
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v2, v3);
  sub_100062760();
  swift_beginAccess();
  *(_DWORD *)(v0 + 640) = enum case for TPTipsHelper.Entry.Kind.voicemailDetail(_:);
  uint64_t v4 = sub_100062400();
  *(void *)(v0 + 560) = v4;
  uint64_t v7 = (uint64_t (*)(uint64_t, void *, uint64_t))((char *)&dword_1000A0F98 + dword_1000A0F98);
  id v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 568) = v5;
  void *v5 = v0;
  v5[1] = sub_100031F4C;
  return v7(v4, &protocol witness table for MainActor, v0 + 336);
}

uint64_t sub_100031F4C(char a1)
{
  uint64_t v2 = *v1;
  *(unsigned char *)(*v1 + 644) = a1;
  swift_task_dealloc();
  swift_release();
  uint64_t v3 = *(void *)(v2 + 544);
  uint64_t v4 = *(void *)(v2 + 536);
  return _swift_task_switch(sub_100032098, v4, v3);
}

uint64_t sub_100032098()
{
  uint64_t v59 = v0;
  if (*(unsigned char *)(v0 + 644) == 2
    || (Strong = (void *)swift_unknownObjectWeakLoadStrong(), (*(void *)(v0 + 576) = Strong) == 0))
  {
    (*(void (**)(void, void))(*(void *)(v0 + 504) + 8))(*(void *)(v0 + 512), *(void *)(v0 + 496));
    swift_release();
  }
  else
  {
    if ((*(unsigned char *)(v0 + 644) & 1) == 0)
    {
      if (qword_1000A0EA8 != -1) {
        swift_once();
      }
      uint64_t v2 = *(void *)(v0 + 440);
      uint64_t v3 = *(void *)(v0 + 416);
      uint64_t v4 = *(void *)(v0 + 424);
      uint64_t v5 = *(void *)(v0 + 360);
      uint64_t v6 = sub_1000621F0();
      sub_100034CF4(v6, (uint64_t)qword_1000A2EA0);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v2, v5, v3);
      uint64_t v7 = sub_1000621D0();
      os_log_type_t v8 = sub_1000624F0();
      if (os_log_type_enabled(v7, v8))
      {
        uint64_t v54 = *(void *)(v0 + 440);
        uint64_t v10 = *(void *)(v0 + 416);
        uint64_t v9 = *(void *)(v0 + 424);
        uint64_t v11 = swift_slowAlloc();
        uint64_t v58 = swift_slowAlloc();
        *(_DWORD *)uint64_t v11 = 136315394;
        uint64_t v12 = sub_100062900();
        *(void *)(v0 + 328) = sub_10005B9C0(v12, v13, &v58);
        sub_100062590();
        swift_bridgeObjectRelease();
        *(_WORD *)(v11 + 12) = 2080;
        uint64_t v14 = sub_100062200();
        *(void *)(v0 + 320) = sub_10005B9C0(v14, v15, &v58);
        sub_100062590();
        swift_bridgeObjectRelease();
        (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v54, v10);
        _os_log_impl((void *)&_mh_execute_header, v7, v8, "%s: Stopping observation of tip %s", (uint8_t *)v11, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        (*(void (**)(void, void))(*(void *)(v0 + 424) + 8))(*(void *)(v0 + 440), *(void *)(v0 + 416));
      }

      sub_100061E40();
      id v34 = (void *)swift_task_alloc();
      *(void *)(v0 + 624) = v34;
      void *v34 = v0;
      uint64_t v35 = sub_100032C10;
      goto LABEL_20;
    }
    CFStringRef v18 = Strong;
    id v19 = [Strong voicemailTipView];

    if (!v19)
    {
      uint64_t v36 = *(void *)(v0 + 552);
      uint64_t v37 = *(void *)(v0 + 416);
      uint64_t v38 = *(void *)(v0 + 424);
      uint64_t v39 = *(void *)(v0 + 376);
      uint64_t v40 = *(void *)(v0 + 360);
      *(void *)(v0 + 200) = v37;
      *(void *)(v0 + 208) = v36;
      long long v41 = sub_100036134((uint64_t *)(v0 + 176));
      long long v42 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v38 + 16);
      *(void *)(v0 + 584) = v42;
      *(void *)(v0 + 592) = (v38 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
      v42(v41, v40, v37);
      uint64_t v43 = swift_allocObject();
      swift_unknownObjectWeakInit();
      uint64_t v44 = swift_allocObject();
      *(void *)(v44 + 16) = v43;
      *(void *)(v44 + 24) = v39;
      id v45 = objc_allocWithZone((Class)sub_100062220());
      v46 = (void *)sub_100062230();
      *(void *)(v0 + 600) = v46;
      [v46 setTranslatesAutoresizingMaskIntoConstraints:0];
      sub_100061E40();
      id v34 = (void *)swift_task_alloc();
      *(void *)(v0 + 608) = v34;
      void *v34 = v0;
      uint64_t v35 = sub_1000327E4;
LABEL_20:
      v34[1] = v35;
      return static TPTipsHelper.shared.getter();
    }
    swift_release();
    if (qword_1000A0EA8 != -1) {
      swift_once();
    }
    uint64_t v21 = *(void *)(v0 + 424);
    uint64_t v20 = *(void *)(v0 + 432);
    uint64_t v22 = *(void *)(v0 + 416);
    uint64_t v23 = *(void *)(v0 + 360);
    uint64_t v24 = sub_1000621F0();
    sub_100034CF4(v24, (uint64_t)qword_1000A2EA0);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v21 + 16))(v20, v23, v22);
    id v25 = sub_1000621D0();
    os_log_type_t v26 = sub_1000624F0();
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v55 = *(void *)(v0 + 504);
      uint64_t v56 = *(void *)(v0 + 496);
      uint64_t v57 = *(void *)(v0 + 512);
      uint64_t v27 = *(void *)(v0 + 424);
      uint64_t v53 = *(void *)(v0 + 432);
      uint64_t v28 = *(void *)(v0 + 416);
      uint64_t v29 = swift_slowAlloc();
      uint64_t v58 = swift_slowAlloc();
      *(_DWORD *)uint64_t v29 = 136315394;
      uint64_t v30 = sub_100062900();
      *(void *)(v0 + 312) = sub_10005B9C0(v30, v31, &v58);
      sub_100062590();
      swift_bridgeObjectRelease();
      *(_WORD *)(v29 + 12) = 2080;
      uint64_t v32 = sub_100062200();
      *(void *)(v0 + 352) = sub_10005B9C0(v32, v33, &v58);
      sub_100062590();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v53, v28);
      _os_log_impl((void *)&_mh_execute_header, v25, v26, "%s: Already tracking tip %s, ignoring to add new one.", (uint8_t *)v29, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(uint64_t, uint64_t))(v55 + 8))(v57, v56);
    }
    else
    {
      uint64_t v48 = *(void *)(v0 + 504);
      uint64_t v47 = *(void *)(v0 + 512);
      uint64_t v49 = *(void *)(v0 + 496);
      uint64_t v51 = *(void *)(v0 + 424);
      uint64_t v50 = *(void *)(v0 + 432);
      uint64_t v52 = *(void *)(v0 + 416);

      (*(void (**)(uint64_t, uint64_t))(v51 + 8))(v50, v52);
      (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v47, v49);
    }
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v16 = *(uint64_t (**)(void))(v0 + 8);
  return v16();
}

uint64_t sub_1000327E4(uint64_t a1)
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 616) = a1;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 544);
  uint64_t v4 = *(void *)(v2 + 536);
  return _swift_task_switch(sub_10003290C, v4, v3);
}

uint64_t sub_10003290C()
{
  uint64_t v1 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v0 + 584);
  uint64_t v2 = *(void *)(v0 + 552);
  uint64_t v3 = *(void *)(v0 + 416);
  uint64_t v4 = *(void *)(v0 + 360);
  (*(void (**)(void, void, void))(*(void *)(v0 + 392) + 104))(*(void *)(v0 + 408), *(unsigned int *)(v0 + 640), *(void *)(v0 + 384));
  *(void *)(v0 + 240) = v3;
  *(void *)(v0 + 248) = v2;
  uint64_t v5 = sub_100036134((uint64_t *)(v0 + 216));
  v1(v5, v4, v3);
  uint64_t v6 = (void (*)(uint64_t, void))sub_100061DA0();
  os_log_type_t v8 = v7;
  if (*(void *)(v0 + 240))
  {
    uint64_t v9 = *(void *)(v0 + 408);
    uint64_t v10 = *(void *)(v0 + 384);
    uint64_t v11 = *(void *)(v0 + 392);
    sub_100036294((long long *)(v0 + 216), v0 + 16);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v28 = *v8;
    uint64_t *v8 = 0x8000000000000000;
    sub_1000353F8((long long *)(v0 + 16), v9, isUniquelyReferenced_nonNull_native);
    uint64_t *v8 = v28;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v9, v10);
  }
  else
  {
    uint64_t v13 = *(void *)(v0 + 408);
    sub_1000363BC(v0 + 216, &qword_1000A0FA0);
    swift_bridgeObjectRetain();
    unint64_t v14 = sub_1000546EC(v13);
    LOBYTE(v13) = v15;
    swift_bridgeObjectRelease();
    if (v13)
    {
      char v16 = swift_isUniquelyReferenced_nonNull_native();
      *(void *)(v0 + 344) = *v8;
      uint64_t *v8 = 0x8000000000000000;
      if ((v16 & 1) == 0) {
        sub_10003B1B0();
      }
      uint64_t v17 = *(void *)(v0 + 392);
      CFStringRef v18 = *(void (**)(unint64_t, void))(v17 + 8);
      v18(*(void *)(*(void *)(v0 + 344) + 48) + *(void *)(v17 + 72) * v14, *(void *)(v0 + 384));
      uint64_t v19 = *(void *)(v0 + 344);
      sub_100036294((long long *)(*(void *)(v19 + 56) + 40 * v14), v0 + 56);
      sub_1000350DC(v14, v19);
      uint64_t *v8 = v19;
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v20 = *(void *)(v0 + 392);
      *(_OWORD *)(v0 + 56) = 0u;
      *(_OWORD *)(v0 + 72) = 0u;
      *(void *)(v0 + 88) = 0;
      CFStringRef v18 = *(void (**)(unint64_t, void))(v20 + 8);
    }
    v18(*(void *)(v0 + 408), *(void *)(v0 + 384));
    sub_1000363BC(v0 + 56, &qword_1000A0FA0);
  }
  uint64_t v21 = *(void **)(v0 + 616);
  uint64_t v22 = *(void **)(v0 + 600);
  uint64_t v23 = *(void **)(v0 + 576);
  v6(v0 + 256, 0);

  [v23 setVoicemailTipView:v22];
  uint64_t v24 = sub_100062400();
  *(void *)(v0 + 560) = v24;
  uint64_t v27 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_1000A0F98 + dword_1000A0F98);
  id v25 = (void *)swift_task_alloc();
  *(void *)(v0 + 568) = v25;
  *id v25 = v0;
  v25[1] = sub_100031F4C;
  return v27(v24, (uint64_t)&protocol witness table for MainActor);
}

uint64_t sub_100032C10(uint64_t a1)
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 632) = a1;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 544);
  uint64_t v4 = *(void *)(v2 + 536);
  return _swift_task_switch(sub_100032D38, v4, v3);
}

uint64_t sub_100032D38()
{
  uint64_t v1 = *(void **)(v0 + 632);
  uint64_t v2 = *(unsigned int *)(v0 + 640);
  uint64_t v4 = *(void *)(v0 + 392);
  uint64_t v3 = *(void *)(v0 + 400);
  uint64_t v5 = *(void *)(v0 + 384);
  swift_release();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 104))(v3, v2, v5);
  uint64_t v6 = sub_100061DB0();

  if (*(void *)(v6 + 16) && (unint64_t v7 = sub_1000546EC(*(void *)(v0 + 400)), (v8 & 1) != 0))
  {
    sub_100036198(*(void *)(v6 + 56) + 40 * v7, v0 + 136);
  }
  else
  {
    *(void *)(v0 + 168) = 0;
    *(_OWORD *)(v0 + 136) = 0u;
    *(_OWORD *)(v0 + 152) = 0u;
  }
  uint64_t v10 = *(void *)(v0 + 392);
  uint64_t v9 = *(void *)(v0 + 400);
  uint64_t v11 = *(void *)(v0 + 384);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
  if (!*(void *)(v0 + 160))
  {
    char v16 = *(void **)(v0 + 576);
    (*(void (**)(void, void))(*(void *)(v0 + 504) + 8))(*(void *)(v0 + 512), *(void *)(v0 + 496));

    sub_1000363BC(v0 + 136, &qword_1000A0FA0);
    goto LABEL_14;
  }
  sub_100036294((long long *)(v0 + 136), v0 + 96);
  sub_1000362AC((void *)(v0 + 96), *(void *)(v0 + 120));
  uint64_t v12 = sub_100062200();
  uint64_t v14 = v13;
  if (v12 == sub_100062200() && v14 == v15)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v17 = sub_100062850();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v17 & 1) == 0)
    {
      uint64_t v23 = *(void **)(v0 + 576);
      (*(void (**)(void, void))(*(void *)(v0 + 504) + 8))(*(void *)(v0 + 512), *(void *)(v0 + 496));

      goto LABEL_13;
    }
  }
  CFStringRef v18 = *(void **)(v0 + 576);
  uint64_t v20 = *(void *)(v0 + 504);
  uint64_t v19 = *(void *)(v0 + 512);
  uint64_t v21 = *(void *)(v0 + 496);
  id v22 = [v18 voicemailTipView];
  [v22 removeFromSuperview];

  [v18 setVoicemailTipView:0];
  [v18 loadExpandedViewsIfNecessary];

  (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v19, v21);
LABEL_13:
  sub_1000361FC(v0 + 96);
LABEL_14:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v24 = *(uint64_t (**)(void))(v0 + 8);
  return v24();
}

uint64_t sub_100033028(uint64_t a1, uint64_t a2)
{
  v3[7] = a2;
  v3[8] = v2;
  v3[6] = a1;
  uint64_t v5 = sub_100035DD8(&qword_1000A0F88);
  v3[9] = v5;
  v3[10] = *(void *)(v5 - 8);
  v3[11] = swift_task_alloc();
  sub_100035DD8(&qword_1000A0FB0);
  v3[12] = swift_task_alloc();
  uint64_t v6 = sub_100062240();
  v3[13] = v6;
  v3[14] = *(void *)(v6 - 8);
  v3[15] = swift_task_alloc();
  if (a1)
  {
    swift_getObjectType();
    uint64_t v7 = sub_1000623E0();
    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v9 = 0;
  }
  v3[16] = v7;
  v3[17] = v9;
  return _swift_task_switch(sub_1000331B8, v7, v9);
}

uint64_t sub_1000331B8()
{
  v0[18] = sub_100062740();
  sub_100035DD8(&qword_1000A0F78);
  sub_100036378(&qword_1000A0FB8, &qword_1000A0F78);
  uint64_t v1 = (void *)swift_task_alloc();
  v0[19] = v1;
  void *v1 = v0;
  v1[1] = sub_1000332B4;
  uint64_t v2 = v0[12];
  uint64_t v3 = v0[6];
  uint64_t v4 = v0[7];
  return _sScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTj(v2, v3, v4);
}

uint64_t sub_1000332B4()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 128);
    uint64_t v4 = *(void *)(v2 + 136);
    uint64_t v5 = sub_1000335EC;
  }
  else
  {
    (*(void (**)(void))(v2 + 144))();
    uint64_t v3 = *(void *)(v2 + 128);
    uint64_t v4 = *(void *)(v2 + 136);
    uint64_t v5 = sub_1000333DC;
  }
  return _swift_task_switch(v5, v3, v4);
}

uint64_t sub_1000333DC()
{
  uint64_t v1 = v0[13];
  uint64_t v2 = v0[14];
  uint64_t v3 = v0[12];
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    sub_1000363BC(v3, &qword_1000A0FB0);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v4 = (uint64_t (*)(uint64_t))v0[1];
    return v4(2);
  }
  else
  {
    uint64_t v7 = v0[10];
    uint64_t v6 = v0[11];
    uint64_t v9 = v0[8];
    uint64_t v8 = v0[9];
    (*(void (**)(void, uint64_t, uint64_t))(v2 + 32))(v0[15], v3, v1);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v6, v9, v8);
    uint64_t v10 = (int *)sub_100062750();
    v0[20] = v11;
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
    uint64_t v14 = (int *)((char *)v10 + *v10);
    uint64_t v12 = (void *)swift_task_alloc();
    v0[21] = v12;
    void *v12 = v0;
    v12[1] = sub_100033688;
    uint64_t v13 = v0[15];
    return ((uint64_t (*)(void *, uint64_t))v14)(v0 + 22, v13);
  }
}

uint64_t sub_1000335EC()
{
  (*(void (**)(void))(v0 + 144))();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100033688()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 120);
  uint64_t v3 = *(void *)(*v0 + 112);
  uint64_t v4 = *(void *)(*v0 + 104);
  swift_task_dealloc();
  swift_release();
  *(unsigned char *)(v1 + 177) = *(unsigned char *)(v1 + 176);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  uint64_t v5 = *(void *)(v1 + 136);
  uint64_t v6 = *(void *)(v1 + 128);
  return _swift_task_switch(sub_100033834, v6, v5);
}

uint64_t sub_100033834()
{
  uint64_t v1 = *(unsigned __int8 *)(v0 + 177);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

void sub_1000338BC()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (void *)Strong;
    if (qword_1000A0EA8 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_1000621F0();
    sub_100034CF4(v2, (uint64_t)qword_1000A2EA0);
    uint64_t v3 = sub_1000621D0();
    os_log_type_t v4 = sub_1000624F0();
    if (os_log_type_enabled(v3, v4))
    {
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      uint64_t v10 = swift_slowAlloc();
      *(_DWORD *)uint64_t v5 = 136315138;
      uint64_t v6 = sub_100062900();
      sub_10005B9C0(v6, v7, &v10);
      sub_100062590();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "%s: Calling voicemailMessageTableViewCellShouldPresentWelcomeViewController", v5, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    id v8 = [v1 delegate];
    if (v8)
    {
      uint64_t v9 = v8;
      if ([v8 respondsToSelector:"voicemailMessageTableViewCellShouldPresentWelcomeViewController:"])[v9 voicemailMessageTableViewCellShouldPresentWelcomeViewController:v1]; {

      }
      swift_unknownObjectRelease();
    }
    else
    {
    }
  }
}

uint64_t sub_100033AC0()
{
  uint64_t ObjectType = swift_getObjectType();
  if (qword_1000A0EA8 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_1000621F0();
  sub_100034CF4(v1, (uint64_t)qword_1000A2EA0);
  uint64_t v2 = sub_1000621D0();
  os_log_type_t v3 = sub_1000624F0();
  if (os_log_type_enabled(v2, v3))
  {
    os_log_type_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    *(_DWORD *)os_log_type_t v4 = 136315138;
    uint64_t v5 = sub_100062900();
    sub_10005B9C0(v5, v6, &v10);
    sub_100062590();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "%s: Starting observation of tips", v4, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  sub_100061E40();
  sub_100061E30();
  uint64_t v7 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  *(void *)(v8 + 24) = ObjectType;
  swift_retain();
  sub_100061E70();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_100033CE8(uint64_t a1, uint64_t a2)
{
  v2[7] = a1;
  v2[8] = a2;
  uint64_t v3 = sub_100061E60();
  v2[9] = v3;
  v2[10] = *(void *)(v3 - 8);
  v2[11] = swift_task_alloc();
  sub_100061E40();
  os_log_type_t v4 = (void *)swift_task_alloc();
  v2[12] = v4;
  void *v4 = v2;
  v4[1] = sub_100033DE4;
  return static TPTipsHelper.shared.getter();
}

uint64_t sub_100033DE4(uint64_t a1)
{
  *(void *)(*(void *)v1 + 104) = a1;
  swift_task_dealloc();
  return _swift_task_switch(sub_100033EE4, 0, 0);
}

uint64_t sub_100033EE4()
{
  *(void *)(v0 + 112) = sub_100062410();
  *(void *)(v0 + 120) = sub_100062400();
  uint64_t v2 = sub_1000623E0();
  return _swift_task_switch(sub_100033F7C, v2, v1);
}

uint64_t sub_100033F7C()
{
  uint64_t v1 = *(void **)(v0 + 104);
  swift_release();
  sub_100061E00();

  return _swift_task_switch(sub_100033FF0, 0, 0);
}

uint64_t sub_100033FF0()
{
  uint64_t v19 = v0;
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  v0[16] = Strong;
  if (Strong)
  {
    if (qword_1000A0EA8 != -1) {
      swift_once();
    }
    uint64_t v2 = sub_1000621F0();
    sub_100034CF4(v2, (uint64_t)qword_1000A2EA0);
    uint64_t v3 = sub_1000621D0();
    os_log_type_t v4 = sub_1000624F0();
    if (os_log_type_enabled(v3, v4))
    {
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      uint64_t v18 = swift_slowAlloc();
      *(_DWORD *)uint64_t v5 = 136315138;
      uint64_t v6 = sub_100062900();
      v0[6] = sub_10005B9C0(v6, v7, &v18);
      sub_100062590();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "%s: Observing LiveVoicemailTip", v5, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    sub_100061E50();
    v0[17] = sub_100062400();
    uint64_t v8 = (void *)swift_task_alloc();
    v0[18] = v8;
    void *v8 = v0;
    v8[1] = sub_1000343B8;
    uint64_t v9 = v0[11];
    return sub_100035698(v9);
  }
  else
  {
    if (qword_1000A0EA8 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_1000621F0();
    sub_100034CF4(v11, (uint64_t)qword_1000A2EA0);
    uint64_t v12 = sub_1000621D0();
    os_log_type_t v13 = sub_1000624F0();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      uint64_t v18 = swift_slowAlloc();
      *(_DWORD *)uint64_t v14 = 136315138;
      uint64_t v15 = sub_100062900();
      v0[5] = sub_10005B9C0(v15, v16, &v18);
      sub_100062590();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "%s: Observing tip failed because self is nil", v14, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    swift_task_dealloc();
    char v17 = (uint64_t (*)(void))v0[1];
    return v17();
  }
}

uint64_t sub_1000343B8()
{
  swift_task_dealloc();
  uint64_t v1 = sub_1000623E0();
  return _swift_task_switch(sub_1000344F4, v1, v0);
}

uint64_t sub_1000344F4()
{
  uint64_t v2 = v0[10];
  uint64_t v1 = v0[11];
  uint64_t v3 = v0[9];
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  return _swift_task_switch(sub_100034584, 0, 0);
}

uint64_t sub_100034584()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100034634()
{
  swift_getObjectType();
  if (qword_1000A0EA8 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1000621F0();
  sub_100034CF4(v0, (uint64_t)qword_1000A2EA0);
  uint64_t v1 = sub_1000621D0();
  os_log_type_t v2 = sub_1000624F0();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 136315138;
    uint64_t v4 = sub_100062900();
    sub_10005B9C0(v4, v5, &v7);
    sub_100062590();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "%s: Stopping observation of tips", v3, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  sub_100061E40();
  sub_100061E30();
  sub_100061E70();
  swift_release();
  return swift_release();
}

uint64_t sub_1000347F8()
{
  uint64_t v1 = sub_100061DD0();
  v0[2] = v1;
  v0[3] = *(void *)(v1 - 8);
  v0[4] = swift_task_alloc();
  sub_100061E40();
  os_log_type_t v2 = (void *)swift_task_alloc();
  v0[5] = v2;
  *os_log_type_t v2 = v0;
  v2[1] = sub_1000348F0;
  return static TPTipsHelper.shared.getter();
}

uint64_t sub_1000348F0(uint64_t a1)
{
  *(void *)(*(void *)v1 + 48) = a1;
  swift_task_dealloc();
  return _swift_task_switch(sub_1000349F0, 0, 0);
}

uint64_t sub_1000349F0()
{
  (*(void (**)(void, void, void))(v0[3] + 104))(v0[4], enum case for TPTipsHelper.Entry.Kind.voicemailDetail(_:), v0[2]);
  sub_100062410();
  v0[7] = sub_100062400();
  uint64_t v2 = sub_1000623E0();
  return _swift_task_switch(sub_100034AA8, v2, v1);
}

uint64_t sub_100034AA8()
{
  uint64_t v1 = (void *)v0[6];
  uint64_t v3 = v0[3];
  uint64_t v2 = v0[4];
  uint64_t v4 = v0[2];
  swift_release();
  sub_100061DC0();

  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_task_dealloc();
  unint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

void type metadata accessor for VMTranscriptConfidenceRating(uint64_t a1)
{
}

uint64_t sub_100034BA0(uint64_t a1, uint64_t a2)
{
  return sub_100034E74(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_100034BB8(uint64_t a1, id *a2)
{
  uint64_t result = sub_1000622E0();
  *a2 = 0;
  return result;
}

uint64_t sub_100034C30(uint64_t a1, id *a2)
{
  char v3 = sub_1000622F0();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_100034CB0@<X0>(void *a1@<X8>)
{
  sub_100062300();
  NSString v2 = sub_1000622D0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_100034CF4(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100034D2C@<X0>(void *a1@<X8>)
{
  NSString v2 = sub_1000622D0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_100034D74@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100062300();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100034DA0(uint64_t a1)
{
  uint64_t v2 = sub_100036330(&qword_1000A0FE0, type metadata accessor for Name);
  uint64_t v3 = sub_100036330(&qword_1000A0FE8, type metadata accessor for Name);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_100034E5C(uint64_t a1, uint64_t a2)
{
  return sub_100034E74(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_100034E74(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_100062300();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_100034EB8()
{
  sub_100062300();
  sub_100062330();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100034F0C()
{
  sub_100062300();
  sub_1000628D0();
  sub_100062330();
  Swift::Int v0 = sub_1000628F0();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_100034F80()
{
  uint64_t v0 = sub_100062300();
  uint64_t v2 = v1;
  if (v0 == sub_100062300() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_100062850();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_10003500C()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100035044()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  void *v4 = v1;
  v4[1] = sub_100036550;
  return sub_100033CE8(v2, v3);
}

unint64_t sub_1000350DC(int64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100061DD0();
  uint64_t v5 = *(void *)(v4 - 8);
  unint64_t result = __chkstk_darwin();
  uint64_t v8 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = a2 + 64;
  uint64_t v10 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v11 = (a1 + 1) & ~v10;
  if (((1 << v11) & *(void *)(a2 + 64 + 8 * (v11 >> 6))) != 0)
  {
    uint64_t v12 = ~v10;
    unint64_t result = sub_1000625D0();
    if ((*(void *)(v9 + 8 * (v11 >> 6)) & (1 << v11)) != 0)
    {
      os_log_type_t v13 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
      unint64_t v37 = (result + 1) & v12;
      uint64_t v38 = v13;
      uint64_t v14 = *(void *)(v5 + 72);
      uint64_t v39 = v5 + 16;
      uint64_t v36 = (uint64_t (**)(char *, uint64_t))(v5 + 8);
      uint64_t v15 = v12;
      do
      {
        uint64_t v16 = v9;
        uint64_t v17 = v14;
        int64_t v18 = v14 * v11;
        uint64_t v19 = v15;
        v38(v8, *(void *)(a2 + 48) + v14 * v11, v4);
        sub_100036330(&qword_1000A0FA8, (void (*)(uint64_t))&type metadata accessor for TPTipsHelper.Entry.Kind);
        uint64_t v20 = sub_1000622A0();
        unint64_t result = (*v36)(v8, v4);
        uint64_t v15 = v19;
        unint64_t v21 = v20 & v19;
        if (a1 >= (uint64_t)v37)
        {
          if (v21 >= v37 && a1 >= (uint64_t)v21)
          {
LABEL_16:
            uint64_t v24 = *(void *)(a2 + 48);
            unint64_t result = v24 + v17 * a1;
            uint64_t v9 = v16;
            if (v17 * a1 < v18 || (uint64_t v14 = v17, result >= v24 + v18 + v17))
            {
              unint64_t result = swift_arrayInitWithTakeFrontToBack();
LABEL_21:
              uint64_t v14 = v17;
              uint64_t v15 = v19;
            }
            else if (v17 * a1 != v18)
            {
              unint64_t result = swift_arrayInitWithTakeBackToFront();
              goto LABEL_21;
            }
            uint64_t v25 = *(void *)(a2 + 56);
            unint64_t v26 = v25 + 40 * a1;
            uint64_t v27 = (long long *)(v25 + 40 * v11);
            if (a1 != v11 || (a1 = v11, v26 >= (unint64_t)v27 + 40))
            {
              long long v28 = *v27;
              long long v29 = v27[1];
              *(void *)(v26 + 32) = *((void *)v27 + 4);
              *(_OWORD *)unint64_t v26 = v28;
              *(_OWORD *)(v26 + 16) = v29;
              a1 = v11;
            }
            goto LABEL_5;
          }
        }
        else if (v21 >= v37 || a1 >= (uint64_t)v21)
        {
          goto LABEL_16;
        }
        uint64_t v9 = v16;
        uint64_t v14 = v17;
LABEL_5:
        unint64_t v11 = (v11 + 1) & v15;
      }
      while (((*(void *)(v9 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) != 0);
    }
    uint64_t v30 = (uint64_t *)(v9 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v31 = *v30;
    uint64_t v32 = (-1 << a1) - 1;
  }
  else
  {
    uint64_t v30 = (uint64_t *)(v9 + 8 * ((unint64_t)a1 >> 6));
    uint64_t v32 = *v30;
    uint64_t v31 = (-1 << a1) - 1;
  }
  uint64_t *v30 = v32 & v31;
  uint64_t v33 = *(void *)(a2 + 16);
  BOOL v34 = __OFSUB__(v33, 1);
  uint64_t v35 = v33 - 1;
  if (v34)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v35;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_1000353F8(long long *a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = sub_100061DD0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin();
  unint64_t v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = (void *)*v3;
  unint64_t v14 = sub_1000546EC(a2);
  uint64_t v15 = v12[2];
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_15;
  }
  char v18 = v13;
  uint64_t v19 = v12[3];
  if (v19 < v17 || (a3 & 1) == 0)
  {
    if (v19 >= v17 && (a3 & 1) == 0)
    {
      sub_10003B1B0();
      goto LABEL_7;
    }
    sub_10003AA88(v17, a3 & 1);
    unint64_t v23 = sub_1000546EC(a2);
    if ((v18 & 1) == (v24 & 1))
    {
      unint64_t v14 = v23;
      uint64_t v20 = *v4;
      if (v18) {
        goto LABEL_8;
      }
LABEL_13:
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
      return sub_1000355D4(v14, (uint64_t)v11, a1, v20);
    }
LABEL_15:
    uint64_t result = sub_100062880();
    __break(1u);
    return result;
  }
LABEL_7:
  uint64_t v20 = *v4;
  if ((v18 & 1) == 0) {
    goto LABEL_13;
  }
LABEL_8:
  uint64_t v21 = v20[7] + 40 * v14;
  sub_1000361FC(v21);

  return sub_100036294(a1, v21);
}

uint64_t sub_1000355D4(unint64_t a1, uint64_t a2, long long *a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = sub_100061DD0();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v8 + *(void *)(*(void *)(v9 - 8) + 72) * a1, a2, v9);
  uint64_t result = sub_100036294(a3, a4[7] + 40 * a1);
  uint64_t v11 = a4[2];
  BOOL v12 = __OFADD__(v11, 1);
  uint64_t v13 = v11 + 1;
  if (v12) {
    __break(1u);
  }
  else {
    a4[2] = v13;
  }
  return result;
}

uint64_t sub_100035698(uint64_t a1)
{
  v2[12] = a1;
  v2[13] = v1;
  v2[14] = swift_getObjectType();
  uint64_t v3 = sub_100061DD0();
  v2[15] = v3;
  uint8_t v2[16] = *(void *)(v3 - 8);
  v2[17] = swift_task_alloc();
  v2[18] = swift_task_alloc();
  uint64_t v4 = sub_100061DE0();
  v2[19] = v4;
  v2[20] = *(void *)(v4 - 8);
  v2[21] = swift_task_alloc();
  uint64_t v5 = sub_100061E60();
  v2[22] = v5;
  uint64_t v6 = *(void *)(v5 - 8);
  v2[23] = v6;
  v2[24] = *(void *)(v6 + 64);
  v2[25] = swift_task_alloc();
  sub_100035DD8(&qword_1000A0F50);
  v2[26] = swift_task_alloc();
  v2[27] = sub_100062410();
  v2[28] = sub_100062400();
  uint64_t v8 = sub_1000623E0();
  v2[29] = v8;
  v2[30] = v7;
  return _swift_task_switch(sub_10003589C, v8, v7);
}

uint64_t sub_10003589C()
{
  uint64_t v1 = v0[26];
  uint64_t v3 = v0[24];
  uint64_t v2 = v0[25];
  uint64_t v4 = v0[22];
  uint64_t v5 = v0[23];
  uint64_t v16 = v0[14];
  uint64_t v6 = v0[12];
  uint64_t v7 = sub_100062450();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v1, 1, 1, v7);
  uint64_t v8 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  v0[31] = v9;
  v0[32] = (v5 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v9(v2, v6, v4);
  swift_retain();
  uint64_t v10 = sub_100062400();
  unint64_t v11 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  unint64_t v12 = (v3 + v11 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v10;
  *(void *)(v13 + 24) = &protocol witness table for MainActor;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v5 + 32))(v13 + v11, v2, v4);
  *(void *)(v13 + v12) = v8;
  *(void *)(v13 + ((v12 + 15) & 0xFFFFFFFFFFFFFFF8)) = v16;
  swift_release();
  v0[33] = sub_10005FDB0(v1, (uint64_t)&unk_1000A0F60, v13);
  sub_100061E40();
  unint64_t v14 = (void *)swift_task_alloc();
  v0[34] = v14;
  void *v14 = v0;
  v14[1] = sub_100035AA8;
  return static TPTipsHelper.shared.getter();
}

uint64_t sub_100035AA8(uint64_t a1)
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 280) = a1;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 240);
  uint64_t v4 = *(void *)(v2 + 232);
  return _swift_task_switch(sub_100035BD0, v4, v3);
}

uint64_t sub_100035BD0()
{
  uint64_t v13 = (void *)v0[35];
  unint64_t v12 = (void (*)(uint64_t *, uint64_t, uint64_t))v0[31];
  uint64_t v1 = v0[21];
  uint64_t v2 = v0[22];
  uint64_t v3 = v0[20];
  uint64_t v14 = v0[19];
  uint64_t v4 = v0[18];
  uint64_t v11 = v0[17];
  uint64_t v6 = v0[15];
  uint64_t v5 = v0[16];
  uint64_t v7 = v0[12];
  swift_release();
  (*(void (**)(uint64_t, void, uint64_t))(v5 + 104))(v4, enum case for TPTipsHelper.Entry.Kind.voicemailDetail(_:), v6);
  v0[5] = v2;
  v0[6] = sub_100036330(&qword_1000A0F68, (void (*)(uint64_t))&type metadata accessor for LiveVoicemailTip);
  uint64_t v8 = sub_100036134(v0 + 2);
  v12(v8, v7, v2);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v11, v4, v6);
  sub_100036198((uint64_t)(v0 + 2), (uint64_t)(v0 + 7));
  swift_retain();
  sub_100061DF0();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  sub_1000361FC((uint64_t)(v0 + 2));
  sub_100061E20();

  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v14);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t sub_100035DD8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100035E1C()
{
  uint64_t v1 = sub_100061E60();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 8;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();

  return _swift_deallocObject(v0, v6, v5);
}

uint64_t sub_100035F0C(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_100061E60() - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  unint64_t v6 = (*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v7 = *(void *)(v1 + 16);
  uint64_t v8 = *(void *)(v1 + 24);
  uint64_t v9 = v1 + v5;
  uint64_t v10 = *(void *)(v1 + v6);
  uint64_t v11 = *(void *)(v1 + ((v6 + 15) & 0xFFFFFFFFFFFFFFF8));
  unint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v12;
  void *v12 = v2;
  v12[1] = sub_100036040;
  return sub_100031A94(a1, v7, v8, v9, v10, v11);
}

uint64_t sub_100036040()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t *sub_100036134(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_100036198(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1000361FC(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10003624C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100036294(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

void *sub_1000362AC(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_1000362F0()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_100036328()
{
}

uint64_t sub_100036330(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100036378(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10003624C(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000363BC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100035DD8(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void type metadata accessor for Name(uint64_t a1)
{
}

void sub_10003642C(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_100036474()
{
  return sub_100036330(&qword_1000A0FC8, type metadata accessor for Name);
}

uint64_t sub_1000364BC()
{
  return sub_100036330(&qword_1000A0FD0, type metadata accessor for Name);
}

uint64_t sub_100036504()
{
  return sub_100036330(&qword_1000A0FD8, type metadata accessor for Name);
}

uint64_t sub_100036554()
{
  uint64_t v0 = sub_1000621F0();
  sub_10003F720(v0, qword_1000A1170);
  uint64_t v1 = sub_100034CF4(v0, (uint64_t)qword_1000A1170);
  if (qword_1000A0EA0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100034CF4(v0, (uint64_t)qword_1000A2E88);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);

  return v3(v1, v2, v0);
}

void sub_10003662C(uint64_t a1)
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
  uint64_t v8 = (char *)&_swiftEmptyArrayStorage;
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
            uint64_t v25 = sub_1000627B0();
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
            uint64_t v8 = sub_1000544CC(0, *((void *)v8 + 2) + 1, 1, v8);
          }
          uint64_t v19 = v8;
          unint64_t v20 = *((void *)v8 + 2);
          uint64_t v21 = v19;
          unint64_t v22 = *((void *)v19 + 3);
          if (v20 >= v22 >> 1) {
            uint64_t v21 = sub_1000544CC((char *)(v22 > 1), v20 + 1, 1, v21);
          }
          *((void *)v21 + 2) = v20 + 1;
          unint64_t v23 = &v21[16 * v20];
          uint64_t v8 = v21;
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

uint64_t sub_100036888(uint64_t a1)
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
            uint64_t result = sub_1000627B0();
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
            uint64_t v19 = sub_1000626A0();
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
            uint64_t result = (uint64_t)sub_1000543BC(0, *((void *)v9 + 2) + 1, 1, v9);
            unint64_t v9 = (char *)result;
          }
          unint64_t v20 = v9;
          unint64_t v21 = *((void *)v9 + 2);
          uint64_t v22 = (uint64_t)v20;
          unint64_t v23 = *((void *)v20 + 3);
          if (v21 >= v23 >> 1)
          {
            uint64_t result = (uint64_t)sub_1000543BC((char *)(v23 > 1), v21 + 1, 1, (char *)v22);
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

uint64_t sub_100036B20(uint64_t a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v2;
  uint64_t v7 = v2[1];
  swift_retain();
  swift_retain();
  unint64_t v8 = sub_10003B80C((uint64_t)a2, v6, v7);
  char v10 = v9;
  swift_release();
  uint64_t result = swift_release();
  if (v10)
  {
    sub_10003B9F8(a2);
    swift_unknownObjectRetain();
    sub_1000626D0();
    sub_100062700();
    sub_100062710();
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
    uint64_t result = sub_10003C144(v13);
    uint64_t v13 = result;
    uint64_t *v12 = result;
  }
  if (v8 < *(void *)(v13 + 16))
  {
    swift_unknownObjectRetain();
    swift_unknownObjectRelease();
    *(void *)(v13 + 8 * v8 + 32) = a1;
LABEL_9:
    sub_1000626E0();
    return v15;
  }
LABEL_12:
  __break(1u);
  return result;
}

uint64_t sub_100036C70(uint64_t a1, id *a2, uint64_t a3, void **a4)
{
  uint64_t v6 = sub_100061D20();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = ((uint64_t (*)(void))__chkstk_darwin)();
  char v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  int64_t v12 = (char *)&v18 - v11;
  uint64_t v13 = *a4;
  id v14 = [*a2 date];
  sub_100061D10();

  id v15 = [v13 date];
  sub_100061D10();

  LOBYTE(v15) = sub_100061D00();
  unint64_t v16 = *(void (**)(char *, uint64_t))(v7 + 8);
  v16(v10, v6);
  v16(v12, v6);
  return v15 & 1;
}

uint64_t sub_100036DE0(unint64_t a1, char a2)
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
    sub_10003E7BC(v43, v42, v44);
    uint64_t v55 = v45;
    sub_10003F5A0(&v55, (uint64_t (*)(uint64_t *, uint64_t *, void **, uint64_t *))sub_100036C70);
    swift_release();
    swift_release();
    swift_release();
    uint64_t v46 = v55[2];
    if (v46 == *(void *)(v44 + 16))
    {
      sub_10003C798((uint64_t)(v55 + 4), v46, v2 + 2);
      swift_release();
      return swift_endAccess();
    }
    goto LABEL_62;
  }
LABEL_56:
  swift_bridgeObjectRetain();
  uint64_t v5 = sub_1000627B0();
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
  uint64_t v48 = v2;
  uint64_t v51 = v2 + 4;
  unint64_t v52 = v4 & 0xC000000000000001;
  uint64_t v50 = v5;
  uint64_t v53 = v2 + 2;
  do
  {
    if (v52)
    {
      uint64_t v11 = (void *)sub_1000626A0();
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
    uint64_t v54 = v12;
    if (*v3)
    {
      swift_unknownObjectRetain();
      swift_retain();
      swift_retain();
      unint64_t v15 = sub_10003BD68((uint64_t)v12, v14 + 32, v4, (Swift::Int *)(v13 + 16));
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
      sub_1000626D0();
      sub_100062700();
      sub_100062710();
      sub_1000626E0();
      uint64_t v26 = *v7;
      unint64_t v27 = *(void *)(*v7 + 16);
      uint64_t v3 = v53;
      uint64_t v28 = *v53;
      if (*v53)
      {
        swift_beginAccess();
        if (sub_100061F00() >= (uint64_t)v27)
        {
          char isUniquelyReferenced_native = swift_isUniquelyReferenced_native();
          uint64_t v31 = *v53;
          if ((isUniquelyReferenced_native & 1) == 0)
          {
            if (!v31) {
              goto LABEL_64;
            }
            uint64_t v31 = sub_100061F20();
            swift_release();
            *uint64_t v53 = v31;
          }
          if (!v31) {
            goto LABEL_63;
          }
          sub_100061EC0();
          goto LABEL_9;
        }
        swift_beginAccess();
        uint64_t v29 = *(void *)(v28 + 24) & 0x3FLL;
        if (v27 <= 0xF && !v29)
        {
          swift_release();
          *uint64_t v53 = 0;
LABEL_9:
          swift_unknownObjectRetain();
          sub_1000626D0();
          sub_100062700();
          sub_100062710();
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
      uint64_t v8 = sub_100061F30();
      if (v29 <= v8) {
        uint64_t v9 = v8;
      }
      else {
        uint64_t v9 = v29;
      }
      uint64_t v10 = sub_10003BBC8(v26, v9, 0, v29);
      swift_release();
      *uint64_t v53 = v10;
      goto LABEL_9;
    }
    type metadata accessor for MessageID(0);
    uint64_t v19 = *(void **)(v14 + 32);
    swift_unknownObjectRetain();
    swift_retain();
    id v20 = v19;
    char v21 = sub_100062570();

    unint64_t v15 = 0;
    if ((v21 & 1) == 0)
    {
      if (v4 == 1) {
        goto LABEL_27;
      }
      id v32 = *(id *)(v14 + 40);
      char v33 = sub_100062570();

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
        char v35 = sub_100062570();

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
          char v37 = sub_100062570();

          if ((v37 & 1) == 0)
          {
            uint64_t v38 = 0;
            uint64_t v39 = v4 - 4;
            while (v39 != v38)
            {
              id v40 = *(id *)(v14 + 64 + 8 * v38);
              uint64_t v4 = sub_100062570();

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
    *uint64_t v51 = v22;
    uint64_t v3 = v53;
    unint64_t v24 = v54;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      uint64_t v22 = sub_10003C144(v22);
      *uint64_t v51 = v22;
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
    sub_1000626E0();

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

uint64_t sub_100037404(unint64_t a1, char a2)
{
  LOBYTE(v3) = a2;
  uint64_t v4 = a1;
  unint64_t v46 = (unint64_t)_swiftEmptyArrayStorage;
  if (a1 >> 62)
  {
LABEL_64:
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_1000627B0();
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
      long long v41 = v2;
      uint64_t v42 = v4 + 32;
      uint64_t v8 = (id **)(v2 + 3);
      while (1)
      {
        if (v44) {
          id v9 = (id)sub_1000626A0();
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
          Swift::Int v3 = sub_10003BD68((uint64_t)v10, v3, v13, v2 + 2);
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
          uint64_t v4 = sub_100062570();

          Swift::Int v3 = 0;
          uint64_t v17 = 0;
          if (v4) {
            goto LABEL_15;
          }
          if (v13 != 1)
          {
            Swift::Int v3 = (Swift::Int)v12[5];
            uint64_t v4 = sub_100062570();

            if (v4)
            {
              uint64_t v17 = 0;
              Swift::Int v3 = 1;
              goto LABEL_15;
            }
            if (v13 != 2)
            {
              Swift::Int v3 = (Swift::Int)v12[6];
              uint64_t v4 = sub_100062570();

              if (v4)
              {
                uint64_t v17 = 0;
                Swift::Int v3 = 2;
                goto LABEL_15;
              }
              if (v13 != 3)
              {
                Swift::Int v3 = (Swift::Int)v12[7];
                uint64_t v4 = sub_100062570();

                if (v4)
                {
                  uint64_t v17 = 0;
                  Swift::Int v3 = 3;
                  goto LABEL_15;
                }
                if (v13 != 4)
                {
                  Swift::Int v3 = (Swift::Int)v12[8];
                  uint64_t v4 = sub_100062570();

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
                      else if (v19 <= sub_100061F10())
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
                        uint64_t v22 = sub_100061F20();
                        swift_release();
                        uint64_t *v7 = v22;
                      }
                      if (!v22) {
                        goto LABEL_70;
                      }
                      uint64_t v2 = (Swift::Int *)(v22 + 16);
                      uint64_t v4 = v22 + 32;
                      swift_retain();
                      sub_10003C158(v17, (Swift::Int *)(v22 + 16), v22 + 32, (uint64_t)v7);
                      if (__OFADD__(v3, 1)) {
                        goto LABEL_62;
                      }
                      if (v3 + 1 < v3) {
                        goto LABEL_63;
                      }
                      uint64_t v23 = (uint64_t)*v8;
                      swift_retain();
                      sub_10003C320(v3, v3 + 1, v23, (Swift::Int *)(v22 + 16));
                      swift_release();
                      swift_release();
LABEL_29:
                      unint64_t v24 = (void *)sub_10003C058(v3);
LABEL_43:

                      sub_10003C058(v3);
                      swift_endAccess();
                      swift_unknownObjectRelease();
                      id v30 = v10;
                      uint64_t v2 = (Swift::Int *)&v46;
                      sub_100062360();
                      Swift::Int v3 = *(void *)((v46 & 0xFFFFFFFFFFFFFF8) + 0x10);
                      if ((unint64_t)v3 >= *(void *)((v46 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
                        sub_1000623B0();
                      }
                      sub_1000623D0();
                      sub_1000623A0();
                      goto LABEL_5;
                    }
                    if (v19) {
                      goto LABEL_29;
                    }
LABEL_30:
                    unint64_t v24 = (void *)sub_10003C058(v3);
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
                      uint64_t *v7 = 0;
                      goto LABEL_43;
                    }
LABEL_39:
                    uint64_t v28 = sub_100061F30();
                    if (v4 <= v28) {
                      uint64_t v29 = v28;
                    }
                    else {
                      uint64_t v29 = v4;
                    }
                    uint64_t v4 = sub_10003BBC8(v26, v29, 0, v4);
                    swift_release();
                    uint64_t *v7 = v4;
                    goto LABEL_43;
                  }
                  uint64_t v4 = 0;
                  uint64_t v31 = v13 - 5;
                  id v32 = v12 + 9;
                  while (v31 != v4)
                  {
                    id v33 = v32[v4];
                    LOBYTE(v3) = sub_100062570();

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
  sub_10003E7BC(v35, v34, v36);
  id v45 = v37;
  sub_10003F5A0(&v45, (uint64_t (*)(uint64_t *, uint64_t *, void **, uint64_t *))sub_100036C70);
  swift_release();
  swift_release();
  swift_release();
  uint64_t v38 = v45[2];
  if (v38 == *(void *)(v36 + 16))
  {
    sub_10003C798((uint64_t)(v45 + 4), v38, v2 + 2);
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

uint64_t sub_1000379F8()
{
  swift_release();
  swift_release();
  swift_release();

  return _swift_deallocClassInstance(v0, 40, 7);
}

uint64_t sub_100037A54()
{
  type metadata accessor for VoicemailActor();
  swift_initStaticObject();
  sub_100040864((unint64_t *)&qword_1000A1510, (void (*)(uint64_t))type metadata accessor for VoicemailActor);
  uint64_t v1 = sub_1000623E0();
  return _swift_task_switch(sub_100037B18, v1, v0);
}

uint64_t sub_100037B18()
{
  if (qword_1000A0E80 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_1000621F0();
  sub_100034CF4(v1, (uint64_t)qword_1000A1170);
  uint64_t v2 = sub_1000621D0();
  os_log_type_t v3 = sub_1000624E0();
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

uint64_t sub_100037C38()
{
  v1[12] = v0;
  sub_100035DD8(&qword_1000A0F50);
  v1[13] = swift_task_alloc();
  v1[14] = type metadata accessor for VoicemailActor();
  swift_initStaticObject();
  v1[15] = sub_100040864((unint64_t *)&qword_1000A1510, (void (*)(uint64_t))type metadata accessor for VoicemailActor);
  uint64_t v3 = sub_1000623E0();
  v1[16] = v3;
  v1[17] = v2;
  return _swift_task_switch(sub_100037D38, v3, v2);
}

uint64_t sub_100037D38()
{
  uint64_t v35 = v0;
  if (qword_1000A0EA0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_1000621F0();
  v0[18] = sub_100034CF4(v1, (uint64_t)qword_1000A2E88);
  uint64_t v2 = sub_1000621D0();
  os_log_type_t v3 = sub_1000624F0();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    unint64_t v34 = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 136315138;
    v0[11] = sub_10005B9C0(0x73654D6863746566, 0xEF29287365676173, (uint64_t *)&v34);
    sub_100062590();
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
      uint64_t v13 = sub_1000621D0();
      os_log_type_t v14 = sub_1000624F0();
      if (os_log_type_enabled(v13, v14))
      {
        char v15 = (uint8_t *)swift_slowAlloc();
        unint64_t v34 = swift_slowAlloc();
        *(_DWORD *)char v15 = 136315138;
        v0[9] = sub_10005B9C0(0x73654D6863746566, 0xEF29287365676173, (uint64_t *)&v34);
        sub_100062590();
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
      uint64_t v19 = sub_10003B710(v16, v17, v18);
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
    uint64_t v28 = sub_100062450();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(v27, 1, 1, v28);
    uint64_t v29 = swift_allocObject();
    swift_weakInit();
    uint64_t inited = swift_initStaticObject();
    uint64_t v31 = (void *)swift_allocObject();
    v31[2] = inited;
    v31[3] = v26;
    v31[4] = v29;
    uint64_t v32 = sub_10005FF54(v27, (uint64_t)&unk_1000A13F0, (uint64_t)v31);
    v0[21] = v32;
    *(void *)(v5 + 16) = v32;
    swift_retain();
    swift_release();
    id v33 = (void *)swift_task_alloc();
    v0[22] = v33;
    uint64_t v23 = type metadata accessor for CachedVoicemailManager.Cache();
    *id v33 = v0;
    v33[1] = sub_1000386B4;
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
    v22[1] = sub_100038308;
    unint64_t v24 = v0 + 8;
    uint64_t v25 = v6;
  }
  return Task<>.value.getter(v24, v25, v23);
}

uint64_t sub_100038308()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 136);
  uint64_t v3 = *(void *)(v1 + 128);
  return _swift_task_switch(sub_100038428, v3, v2);
}

uint64_t sub_100038428()
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
  uint64_t v7 = sub_1000621D0();
  os_log_type_t v8 = sub_1000624F0();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v16 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 136315138;
    v0[9] = sub_10005B9C0(0x73654D6863746566, 0xEF29287365676173, (uint64_t *)&v16);
    sub_100062590();
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
  uint64_t v13 = sub_10003B710(v10, v11, v12);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_task_dealloc();
  os_log_type_t v14 = (uint64_t (*)(void *))v0[1];
  return v14(v13);
}

uint64_t sub_1000386B4()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 136);
  uint64_t v3 = *(void *)(v1 + 128);
  return _swift_task_switch(sub_1000387D4, v3, v2);
}

uint64_t sub_1000387D4()
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
  uint64_t v7 = sub_1000621D0();
  os_log_type_t v8 = sub_1000624F0();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v16 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 136315138;
    v0[9] = sub_10005B9C0(0x73654D6863746566, 0xEF29287365676173, (uint64_t *)&v16);
    sub_100062590();
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
  uint64_t v13 = sub_10003B710(v10, v11, v12);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_task_dealloc();
  os_log_type_t v14 = (uint64_t (*)(void *))v0[1];
  return v14(v13);
}

uint64_t sub_100038A5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[7] = a1;
  v4[8] = a4;
  type metadata accessor for VoicemailActor();
  swift_initStaticObject();
  sub_100040864((unint64_t *)&qword_1000A1510, (void (*)(uint64_t))type metadata accessor for VoicemailActor);
  uint64_t v6 = sub_1000623E0();
  v4[9] = v6;
  v4[10] = v5;
  return _swift_task_switch(sub_100038B24, v6, v5);
}

uint64_t sub_100038B24()
{
  uint64_t v14 = v0;
  if (qword_1000A0EA0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_1000621F0();
  *(void *)(v0 + 88) = sub_100034CF4(v1, (uint64_t)qword_1000A2E88);
  uint64_t v2 = sub_1000621D0();
  os_log_type_t v3 = sub_1000624F0();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 136315138;
    *(void *)(v0 + 48) = sub_10005B9C0(0x73654D6863746566, 0xEF29287365676173, &v13);
    sub_100062590();
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
    void *v6 = v0;
    v6[1] = sub_100038E28;
    uint64_t v7 = v12;
  }
  else
  {
    type metadata accessor for CachedVoicemailManager.Cache();
    uint64_t v9 = (void *)swift_allocObject();
    v9[2] = sub_10003E8FC((uint64_t)_swiftEmptyArrayStorage);
    v9[3] = v10;
    void v9[4] = v11;
    **(void **)(v0 + 56) = v9;
    uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
  }
  return v7();
}

uint64_t sub_100038E28(uint64_t a1)
{
  uint64_t v4 = *(void **)v2;
  *(void *)(*(void *)v2 + 112) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v5 = v4[9];
    uint64_t v6 = v4[10];
    uint64_t v7 = sub_100039120;
  }
  else
  {
    v4[15] = a1;
    uint64_t v5 = v4[9];
    uint64_t v6 = v4[10];
    uint64_t v7 = sub_100038F50;
  }
  return _swift_task_switch(v7, v5, v6);
}

uint64_t sub_100038F50()
{
  uint64_t v9 = v0;
  uint64_t v1 = *(void *)(v0 + 96);
  uint64_t v2 = sub_10003F784(*(void *)(v0 + 120), (void *)1);
  *(void *)(v1 + 16) = v2 | 0x4000000000000000;
  swift_retain();
  swift_release();
  os_log_type_t v3 = sub_1000621D0();
  os_log_type_t v4 = sub_1000624F0();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136315138;
    *(void *)(v0 + 40) = sub_10005B9C0(0x73654D6863746566, 0xEF29287365676173, &v8);
    sub_100062590();
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

uint64_t sub_100039120()
{
  type metadata accessor for CachedVoicemailManager.Cache();
  uint64_t v1 = (void *)swift_allocObject();
  v1[2] = sub_10003E8FC((uint64_t)_swiftEmptyArrayStorage);
  v1[3] = v2;
  v1[4] = v3;
  swift_errorRelease();
  swift_release();
  **(void **)(v0 + 56) = v1;
  os_log_type_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_100039338(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  type metadata accessor for VoicemailActor();
  swift_initStaticObject();
  sub_100040864((unint64_t *)&qword_1000A1510, (void (*)(uint64_t))type metadata accessor for VoicemailActor);
  uint64_t v4 = sub_1000623E0();
  return _swift_task_switch(sub_100039400, v4, v3);
}

uint64_t sub_100039400()
{
  *(void *)(v0 + 32) = _Block_copy(*(const void **)(v0 + 16));
  swift_retain();
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 40) = v1;
  void *v1 = v0;
  v1[1] = sub_1000394A8;
  return sub_100037C38();
}

uint64_t sub_1000394A8()
{
  uint64_t v1 = *(void (***)(void, void))(*v0 + 32);
  uint64_t v5 = *v0;
  swift_task_dealloc();
  swift_release();
  sub_100035DD8(&qword_1000A1500);
  Class isa = sub_100062370().super.isa;
  swift_bridgeObjectRelease();
  ((void (**)(void, Class))v1)[2](v1, isa);

  _Block_release(v1);
  uint64_t v3 = *(uint64_t (**)(void))(v5 + 8);
  return v3();
}

uint64_t sub_10003961C(uint64_t a1)
{
  v2[9] = a1;
  v2[10] = v1;
  type metadata accessor for VoicemailActor();
  swift_initStaticObject();
  sub_100040864((unint64_t *)&qword_1000A1510, (void (*)(uint64_t))type metadata accessor for VoicemailActor);
  uint64_t v4 = sub_1000623E0();
  v2[11] = v4;
  v2[12] = v3;
  return _swift_task_switch(sub_1000396E4, v4, v3);
}

uint64_t sub_1000396E4()
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
    v13[1] = sub_1000398C0;
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
  unint64_t v8 = sub_10003B80C((uint64_t)v7, v4, v5);
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

uint64_t sub_1000398C0()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 96);
  uint64_t v3 = *(void *)(v1 + 88);
  return _swift_task_switch(sub_1000399E0, v3, v2);
}

unint64_t sub_1000399E0()
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
  unint64_t result = sub_10003B80C((uint64_t)v6, v4, v3);
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

uint64_t sub_100039C88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  type metadata accessor for VoicemailActor();
  swift_initStaticObject();
  sub_100040864((unint64_t *)&qword_1000A1510, (void (*)(uint64_t))type metadata accessor for VoicemailActor);
  uint64_t v5 = sub_1000623E0();
  return _swift_task_switch(sub_100039D54, v5, v4);
}

uint64_t sub_100039D54()
{
  uint64_t v1 = *(void **)(v0 + 16);
  *(void *)(v0 + 40) = _Block_copy(*(const void **)(v0 + 24));
  id v2 = v1;
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 48) = v3;
  void *v3 = v0;
  v3[1] = sub_100039E14;
  uint64_t v4 = *(void *)(v0 + 16);
  return sub_10003961C(v4);
}

uint64_t sub_100039E14(uint64_t a1)
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

uint64_t sub_100039F80(uint64_t a1, unint64_t a2)
{
  return sub_100036DE0(a2, 1);
}

uint64_t sub_100039FAC(unint64_t a1, uint64_t *a2)
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
      uint64_t v16 = sub_1000545DC(0, v16[2] + 1, 1, v16);
      void *v15 = v16;
    }
    unint64_t v19 = v16[2];
    unint64_t v18 = v16[3];
    if (v19 >= v18 >> 1)
    {
      uint64_t v16 = sub_1000545DC((void *)(v18 > 1), v19 + 1, 1, v16);
      void *v15 = v16;
    }
    v16[2] = v19 + 1;
    id v20 = &v16[2 * v19];
    v20[4] = sub_100040334;
    v20[5] = v14;
    swift_endAccess();
    uint64_t v13 = 1;
    sub_10003F6CC();
    swift_willThrowTypedImpl();
    goto LABEL_17;
  }
  if (v5 != 1)
  {
    sub_10003F6CC();
    swift_willThrowTypedImpl();
    uint64_t v13 = 0;
    goto LABEL_17;
  }
  swift_retain();
  uint64_t v6 = sub_100037404(a1, 1);
  unint64_t v7 = swift_bridgeObjectRetain();
  uint64_t v8 = sub_1000401C0(v7);
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
    uint64_t v10 = sub_100062600();
    Swift::Int v11 = sub_10003D0C0(v9, v10);
    swift_bridgeObjectRelease();
    uint64_t v8 = v11;
  }
  uint64_t v12 = (uint64_t)sub_10003D2A8(v6, v8);
  uint64_t v13 = v12;
  if ((v12 & 0xC000000000000001) != 0)
  {
    if (sub_100062600())
    {
LABEL_10:
      swift_bridgeObjectRelease();
      sub_10003F6CC();
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
    a2 = sub_10003B608(v6, (void (*)(void *, uint64_t, unint64_t))sub_10005F71C);
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

uint64_t sub_10003A244(unint64_t a1, uint64_t *a2)
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
      sub_10003A43C(v7, a1);
      swift_release();
      return swift_release();
    }
    sub_10003F6CC();
    swift_bridgeObjectRetain();
    swift_willThrowTypedImpl();
    uint64_t result = swift_release();
    uint64_t v16 = 0;
  }
  else
  {
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = sub_10003F660;
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
      Swift::Int v11 = sub_1000545DC(0, v11[2] + 1, 1, v11);
      *uint64_t v10 = v11;
    }
    unint64_t v14 = v11[2];
    unint64_t v13 = v11[3];
    if (v14 >= v13 >> 1)
    {
      Swift::Int v11 = sub_1000545DC((void *)(v13 > 1), v14 + 1, 1, v11);
      *uint64_t v10 = v11;
    }
    void v11[2] = v14 + 1;
    uint64_t v15 = &v11[2 * v14];
    v15[4] = sub_10003F6A0;
    v15[5] = v9;
    swift_endAccess();
    uint64_t v16 = 1;
    sub_10003F6CC();
    swift_willThrowTypedImpl();
    uint64_t result = swift_release();
  }
  *a2 = v16;
  return result;
}

uint64_t sub_10003A43C(void *a1, unint64_t a2)
{
  if (a2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_1000627B0();
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
  uint64_t v6 = &selRef_activateConstraints_;
  unint64_t v7 = &off_1000A0000;
  do
  {
    if ((a2 & 0xC000000000000001) != 0)
    {
      uint64_t v8 = (void *)sub_1000626A0();
    }
    else
    {
      uint64_t v8 = *(void **)(a2 + 8 * v5 + 32);
      swift_unknownObjectRetain();
    }
    id v9 = [v8 v6[295] v24];
    swift_beginAccess();
    uint64_t v10 = sub_100036B20((uint64_t)v8, v9);
    swift_endAccess();

    swift_unknownObjectRelease();
    if (v10)
    {
      swift_unknownObjectRelease();
    }
    else
    {
      if (v7[464] != (_UNKNOWN *)-1) {
        swift_once();
      }
      uint64_t v11 = sub_1000621F0();
      sub_100034CF4(v11, (uint64_t)qword_1000A1170);
      swift_unknownObjectRetain_n();
      uint64_t v12 = sub_1000621D0();
      os_log_type_t v13 = sub_1000624D0();
      if (os_log_type_enabled(v12, v13))
      {
        uint64_t v14 = swift_slowAlloc();
        uint64_t v25 = v8;
        v26[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v14 = 136315138;
        swift_unknownObjectRetain();
        sub_100035DD8(&qword_1000A1500);
        uint64_t v15 = sub_100062320();
        *(void *)(v14 + 4) = sub_10005B9C0(v15, v16, v26);
        swift_unknownObjectRelease_n();
        uint64_t v6 = &selRef_activateConstraints_;
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v12, v13, "CachedVoicemailmanager: Told to update message but no message was found with id: %s", (uint8_t *)v14, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        unint64_t v7 = &off_1000A0000;
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
  sub_10003E7BC(v18, v19, v20);
  uint64_t v25 = v21;
  sub_10003F5A0(&v25, (uint64_t (*)(uint64_t *, uint64_t *, void **, uint64_t *))sub_100036C70);
  swift_release();
  swift_release();
  swift_release();
  uint64_t v22 = v25[2];
  if (v22 == *(void *)(v20 + 16))
  {
    sub_10003C798((uint64_t)(v25 + 4), v22, v17);
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

uint64_t sub_10003A820()
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

uint64_t sub_10003AA20(void *a1)
{
  uint64_t v1 = *a1 >> 62;
  if (v1 <= 1) {
    return v1;
  }
  else {
    return (*a1 >> 3) + 2;
  }
}

void *sub_10003AA3C(void *result)
{
  *result &= 0x3FFFFFFFFFFFFFFFuLL;
  return result;
}

unint64_t *sub_10003AA4C(unint64_t *result, uint64_t a2)
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

uint64_t sub_10003AA88(uint64_t a1, int a2)
{
  unint64_t v3 = v2;
  uint64_t v44 = sub_100061DD0();
  uint64_t v5 = *(void *)(v44 - 8);
  __chkstk_darwin();
  unint64_t v7 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v2;
  sub_100035DD8((uint64_t *)&unk_1000A1440);
  int v45 = a2;
  uint64_t v9 = sub_1000627D0();
  uint64_t v10 = v9;
  if (!*(void *)(v8 + 16)) {
    goto LABEL_41;
  }
  uint64_t v11 = 1 << *(unsigned char *)(v8 + 32);
  uint64_t v12 = *(void *)(v8 + 64);
  char v40 = (void *)(v8 + 64);
  if (v11 < 64) {
    uint64_t v13 = ~(-1 << v11);
  }
  else {
    uint64_t v13 = -1;
  }
  unint64_t v14 = v13 & v12;
  uint64_t v38 = v2;
  int64_t v39 = (unint64_t)(v11 + 63) >> 6;
  long long v41 = (void (**)(char *, unint64_t, uint64_t))(v5 + 16);
  unint64_t v46 = (void (**)(char *, unint64_t, uint64_t))(v5 + 32);
  uint64_t v15 = v9 + 64;
  uint64_t result = swift_retain();
  int64_t v17 = 0;
  uint64_t v42 = v8;
  uint64_t v43 = v7;
  while (1)
  {
    if (v14)
    {
      unint64_t v19 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v20 = v19 | (v17 << 6);
      goto LABEL_22;
    }
    int64_t v21 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v21 >= v39) {
      break;
    }
    uint64_t v22 = v40;
    unint64_t v23 = v40[v21];
    ++v17;
    if (!v23)
    {
      int64_t v17 = v21 + 1;
      if (v21 + 1 >= v39) {
        goto LABEL_34;
      }
      unint64_t v23 = v40[v17];
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v39)
        {
LABEL_34:
          swift_release();
          unint64_t v3 = v38;
          if ((v45 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v23 = v40[v24];
        if (!v23)
        {
          while (1)
          {
            int64_t v17 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_43;
            }
            if (v17 >= v39) {
              goto LABEL_34;
            }
            unint64_t v23 = v40[v17];
            ++v24;
            if (v23) {
              goto LABEL_21;
            }
          }
        }
        int64_t v17 = v24;
      }
    }
LABEL_21:
    unint64_t v14 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v17 << 6);
LABEL_22:
    uint64_t v25 = v5;
    uint64_t v26 = *(void *)(v5 + 72);
    unint64_t v27 = *(void *)(v8 + 48) + v26 * v20;
    uint64_t v28 = v43;
    uint64_t v29 = v44;
    if (v45)
    {
      (*v46)(v43, v27, v44);
      sub_100036294((long long *)(*(void *)(v8 + 56) + 40 * v20), (uint64_t)v47);
    }
    else
    {
      (*v41)(v43, v27, v44);
      sub_100036198(*(void *)(v8 + 56) + 40 * v20, (uint64_t)v47);
    }
    sub_100040864(&qword_1000A0FA8, (void (*)(uint64_t))&type metadata accessor for TPTipsHelper.Entry.Kind);
    uint64_t result = sub_1000622A0();
    uint64_t v30 = -1 << *(unsigned char *)(v10 + 32);
    unint64_t v31 = result & ~v30;
    unint64_t v32 = v31 >> 6;
    if (((-1 << v31) & ~*(void *)(v15 + 8 * (v31 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v31) & ~*(void *)(v15 + 8 * (v31 >> 6)))) | v31 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v33 = 0;
      unint64_t v34 = (unint64_t)(63 - v30) >> 6;
      do
      {
        if (++v32 == v34 && (v33 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v35 = v32 == v34;
        if (v32 == v34) {
          unint64_t v32 = 0;
        }
        v33 |= v35;
        uint64_t v36 = *(void *)(v15 + 8 * v32);
      }
      while (v36 == -1);
      unint64_t v18 = __clz(__rbit64(~v36)) + (v32 << 6);
    }
    *(void *)(v15 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    (*v46)((char *)(*(void *)(v10 + 48) + v26 * v18), (unint64_t)v28, v29);
    uint64_t result = sub_100036294(v47, *(void *)(v10 + 56) + 40 * v18);
    ++*(void *)(v10 + 16);
    uint64_t v5 = v25;
    uint64_t v8 = v42;
  }
  swift_release();
  unint64_t v3 = v38;
  uint64_t v22 = v40;
  if ((v45 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v37 = 1 << *(unsigned char *)(v8 + 32);
  if (v37 >= 64) {
    bzero(v22, ((unint64_t)(v37 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v22 = -1 << v37;
  }
  *(void *)(v8 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  uint64_t *v3 = v10;
  return result;
}

uint64_t sub_10003AED8(uint64_t a1, char a2)
{
  unint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100035DD8(&qword_1000A1400);
  uint64_t v6 = sub_1000627D0();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  BOOL v35 = v2;
  uint64_t v36 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v11 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v12 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v14 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    int64_t v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v11) {
      break;
    }
    unint64_t v23 = (void *)(v5 + 64);
    unint64_t v24 = *(void *)(v36 + 8 * v22);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v22 + 1;
      if (v22 + 1 >= v11) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v36 + 8 * v14);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v11)
        {
LABEL_33:
          swift_release();
          unint64_t v3 = v35;
          if ((a2 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v36 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v14 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_42;
            }
            if (v14 >= v11) {
              goto LABEL_33;
            }
            unint64_t v24 = *(void *)(v36 + 8 * v14);
            ++v25;
            if (v24) {
              goto LABEL_30;
            }
          }
        }
        int64_t v14 = v25;
      }
    }
LABEL_30:
    unint64_t v10 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    uint64_t v30 = 8 * v21;
    unint64_t v31 = *(void **)(*(void *)(v5 + 48) + v30);
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + v30);
    if ((a2 & 1) == 0)
    {
      id v33 = v31;
      swift_bridgeObjectRetain();
    }
    uint64_t result = sub_100062560(*(void *)(v7 + 40));
    uint64_t v15 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v28 = v17 == v27;
        if (v17 == v27) {
          unint64_t v17 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      unint64_t v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    uint64_t v19 = 8 * v18;
    *(void *)(*(void *)(v7 + 48) + v19) = v31;
    *(void *)(*(void *)(v7 + 56) + v19) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  unint64_t v3 = v35;
  unint64_t v23 = (void *)(v5 + 64);
  if ((a2 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *unint64_t v23 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

void *sub_10003B1B0()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100061DD0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100035DD8((uint64_t *)&unk_1000A1440);
  uint64_t v6 = *v0;
  uint64_t v7 = sub_1000627C0();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_25:
    uint64_t *v1 = v8;
    return result;
  }
  unint64_t v23 = v1;
  uint64_t result = (void *)(v7 + 64);
  unint64_t v10 = (unint64_t)((1 << *(unsigned char *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 64 + 8 * v10) {
    uint64_t result = memmove(result, (const void *)(v6 + 64), 8 * v10);
  }
  uint64_t v24 = v6 + 64;
  int64_t v11 = 0;
  *(void *)(v8 + 16) = *(void *)(v6 + 16);
  uint64_t v12 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  unint64_t v14 = v13 & *(void *)(v6 + 64);
  int64_t v25 = (unint64_t)(v12 + 63) >> 6;
  uint64_t v26 = v3 + 16;
  while (1)
  {
    if (v14)
    {
      unint64_t v15 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v16 = v15 | (v11 << 6);
      goto LABEL_9;
    }
    int64_t v19 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v19 >= v25) {
      goto LABEL_23;
    }
    unint64_t v20 = *(void *)(v24 + 8 * v19);
    ++v11;
    if (!v20)
    {
      int64_t v11 = v19 + 1;
      if (v19 + 1 >= v25) {
        goto LABEL_23;
      }
      unint64_t v20 = *(void *)(v24 + 8 * v11);
      if (!v20) {
        break;
      }
    }
LABEL_22:
    unint64_t v14 = (v20 - 1) & v20;
    unint64_t v16 = __clz(__rbit64(v20)) + (v11 << 6);
LABEL_9:
    unint64_t v17 = *(void *)(v3 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(void *)(v6 + 48) + v17, v2);
    uint64_t v18 = 40 * v16;
    sub_100036198(*(void *)(v6 + 56) + v18, (uint64_t)v27);
    (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(void *)(v8 + 48) + v17, v5, v2);
    uint64_t result = (void *)sub_100036294(v27, *(void *)(v8 + 56) + v18);
  }
  int64_t v21 = v19 + 2;
  if (v21 >= v25)
  {
LABEL_23:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v23;
    goto LABEL_25;
  }
  unint64_t v20 = *(void *)(v24 + 8 * v21);
  if (v20)
  {
    int64_t v11 = v21;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v11 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v11 >= v25) {
      goto LABEL_23;
    }
    unint64_t v20 = *(void *)(v24 + 8 * v11);
    ++v21;
    if (v20) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

void *sub_10003B45C()
{
  uint64_t v1 = v0;
  sub_100035DD8(&qword_1000A1400);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1000627C0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
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
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21) {
        break;
      }
    }
LABEL_25:
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
  int64_t v22 = v20 + 2;
  if (v22 >= v13) {
    goto LABEL_26;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_10003B608(unint64_t a1, void (*a2)(void *, uint64_t, unint64_t))
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
      sub_100035DD8((uint64_t *)&unk_1000A1EB0);
      uint64_t v5 = (void *)swift_allocObject();
      int64_t v6 = j__malloc_size(v5);
      uint64_t v7 = v6 - 32;
      if (v6 < 32) {
        uint64_t v7 = v6 - 25;
      }
      v5[2] = v4;
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
    uint64_t v4 = sub_1000627B0();
    swift_bridgeObjectRelease();
    if (!v4) {
      return _swiftEmptyArrayStorage;
    }
  }
  return v5;
}

void *sub_10003B710(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a3 + 16);
  if (!v3) {
    return _swiftEmptyArrayStorage;
  }
  sub_100035DD8((uint64_t *)&unk_1000A1EB0);
  uint64_t v7 = (void *)swift_allocObject();
  int64_t v8 = j__malloc_size(v7);
  uint64_t v9 = v8 - 32;
  if (v8 < 32) {
    uint64_t v9 = v8 - 25;
  }
  v7[2] = v3;
  v7[3] = (2 * (v9 >> 3)) | 1;
  uint64_t v10 = sub_10003E424(&v12, (uint64_t)(v7 + 4), v3, a1, a2, a3);
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

uint64_t sub_10003B80C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = (id *)(a3 + 32);
  uint64_t v5 = *(void *)(a3 + 16);
  if (!a2)
  {
    if (v5)
    {
      type metadata accessor for MessageID(0);
      id v9 = *v4;
      char v10 = sub_100062570();

      if (v10) {
        return 0;
      }
      if (v5 == 1) {
        return 0;
      }
      id v11 = *(id *)(a3 + 40);
      char v12 = sub_100062570();

      if (v12) {
        return 1;
      }
      if (v5 != 2)
      {
        id v14 = *(id *)(a3 + 48);
        char v15 = sub_100062570();

        if (v15) {
          return 2;
        }
        if (v5 != 3)
        {
          id v16 = *(id *)(a3 + 56);
          char v17 = sub_100062570();

          if (v17) {
            return 3;
          }
          uint64_t v18 = 0;
          uint64_t v19 = a3 + 64;
          while (v5 - 4 != v18)
          {
            id v20 = *(id *)(v19 + 8 * v18);
            char v21 = sub_100062570();

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
  Swift::Int v7 = sub_10003BD68(a1, (uint64_t)v4, v5, v6);
  swift_release();
  return v7;
}

uint64_t sub_10003B9F8(void *a1)
{
  id v2 = a1;
  sub_1000626D0();
  sub_100062700();
  sub_100062710();
  uint64_t result = sub_1000626E0();
  uint64_t v4 = *(void *)(v1[1] + 16);
  if (*v1)
  {
    swift_beginAccess();
    if (sub_100061F00() >= v4)
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
        uint64_t v5 = sub_100061F20();
        uint64_t result = swift_release();
        uint64_t *v1 = v5;
      }
      if (v5) {
        return sub_100061EC0();
      }
      __break(1u);
      goto LABEL_12;
    }
  }
  else if ((unint64_t)v4 < 0x10)
  {
    return result;
  }
  return sub_10003BB24();
}

uint64_t sub_10003BB24()
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
  uint64_t v6 = sub_100061F30();
  if (v3 <= v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = v3;
  }
  uint64_t v5 = sub_10003BBC8(v2, v7, 0, v3);
LABEL_11:
  uint64_t result = swift_release();
  uint64_t *v0 = v5;
  return result;
}

uint64_t sub_10003BBC8(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v8 = sub_100061F30();
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
    uint64_t v9 = sub_100061F40();
    sub_10003BC5C(v9 + 16, v9 + 32, a1);
  }
  return v9;
}

Swift::Int sub_10003BC5C(Swift::Int result, uint64_t a2, uint64_t a3)
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
      uint64_t result = sub_100062560(v6);
      if (__OFSUB__(1 << *v4, 1)) {
        break;
      }
      uint64_t v8 = sub_100061EA0();

      if (v8)
      {
        while (1)
          sub_100061EF0();
      }
      uint64_t result = sub_100061EE0();
      if (++v5 == v3) {
        return result;
      }
    }
    __break(1u);
  }
  return result;
}

Swift::Int sub_10003BD68(uint64_t a1, uint64_t a2, uint64_t a3, Swift::Int *a4)
{
  Swift::Int result = sub_100062560(*a4);
  if (__OFSUB__(1 << *a4, 1))
  {
    __break(1u);
  }
  else
  {
    sub_100061EA0();
    uint64_t v7 = sub_100061ED0();
    if ((v8 & 1) == 0)
    {
      type metadata accessor for MessageID(0);
      do
      {
        id v9 = *(id *)(a2 + 8 * v7);
        char v10 = sub_100062570();

        if (v10) {
          break;
        }
        sub_100061EF0();
        uint64_t v7 = sub_100061ED0();
      }
      while ((v11 & 1) == 0);
    }
    return v7;
  }
  return result;
}

uint64_t sub_10003BEAC(uint64_t result, char a2)
{
  if (result < 0)
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  uint64_t v3 = v2;
  sub_1000626F0();
  uint64_t v6 = *v2;
  uint64_t v5 = v2[1];
  if (*v2)
  {
    swift_beginAccess();
    uint64_t v7 = *(void *)(v6 + 16) & 0x3FLL;
    uint64_t v8 = sub_100061F30();
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
  uint64_t v11 = sub_100061F30();
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
  Swift::Int result = sub_100061F30();
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
    uint64_t v14 = sub_10003BBC8(v5, v12, 0, v10);
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
  uint64_t v15 = sub_100061F20();
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

uint64_t sub_10003C058(unint64_t a1)
{
  uint64_t v3 = *v1;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t *v1 = v3;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v3 = sub_10003C144(v3);
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
      sub_1000626E0();
      return v9;
    }
  }
  uint64_t result = sub_1000627F0();
  __break(1u);
  return result;
}

uint64_t sub_10003C130(void *a1)
{
  return sub_100054C80(0, a1[2], 0, a1);
}

uint64_t sub_10003C144(uint64_t a1)
{
  return specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(a1 + 16), 0, a1);
}

void sub_10003C158(uint64_t a1, Swift::Int *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = a1;
  uint64_t v20 = sub_100061EA0();
  sub_100061EF0();
  if (v20)
  {
    uint64_t v7 = a1;
    uint64_t v8 = sub_100061EB0();
    while (1)
    {
      unint64_t v9 = sub_100061ED0();
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
      Swift::Int v14 = sub_100062560(v12);

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
          sub_100061ED0();
          sub_100061EC0();
          uint64_t v6 = v7;
        }
      }
      else if (v16 >= v8 || v6 >= v16)
      {
        goto LABEL_18;
      }
      sub_100061EF0();
      uint64_t v7 = a1;
    }
  }

  sub_100061EC0();
}

void sub_10003C320(uint64_t a1, uint64_t a2, uint64_t a3, Swift::Int *a4)
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
      if (sub_100061F00() / 3 > a1)
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
            sub_100062560(v12);
            if (__OFSUB__(1 << *a4, 1)) {
              break;
            }
            if (sub_100061EA0())
            {
              while (1)
              {
                uint64_t v14 = sub_100061ED0();
                if ((v15 & 1) == 0 && v14 == v11) {
                  break;
                }
                sub_100061EF0();
              }
            }
            if (__OFADD__(v11, v5)) {
              goto LABEL_58;
            }
            ++v11;
            sub_100061EE0();

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
      sub_100061EA0();
      uint64_t v21 = sub_100061ED0();
      if ((v22 & 1) != 0 || v21 >= a1)
      {
LABEL_32:
        sub_100061EF0();
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
        sub_100061EE0();
        goto LABEL_32;
      }
      __break(1u);
LABEL_38:
      sub_100061EA0();
      uint64_t v23 = sub_100061ED0();
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
        sub_100061EE0();
      }
      sub_100061EF0();
      return;
    }
    uint64_t v4 = a2;
    if (__OFSUB__(v9, a2))
    {
LABEL_63:
      __break(1u);
      goto LABEL_64;
    }
    if ((uint64_t)(v9 - a2) >= sub_100061F00() / 3) {
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
        sub_100062560(v25);
        if (__OFSUB__(1 << *a4, 1)) {
          goto LABEL_60;
        }
        if (sub_100061EA0())
        {
          while (1)
          {
            uint64_t v27 = sub_100061ED0();
            if ((v28 & 1) == 0 && v27 == v4) {
              break;
            }
            sub_100061EF0();
          }
        }
        if (__OFSUB__(v4, v5)) {
          goto LABEL_61;
        }
        ++v4;
        sub_100061EE0();

        if (v4 == v9)
        {
          swift_release();
          return;
        }
      }
    }
  }
}

uint64_t sub_10003C798(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  sub_10003E518(a1, a2, (void (*)(uint64_t *__return_ptr, id *))sub_10003E500);
  uint64_t v7 = v6;
  uint64_t v8 = sub_10003C870();
  uint64_t v9 = sub_10003BBC8(v7, 0, 1, v8);
  if (*(void *)(v7 + 16) <= 0xFuLL)
  {
    swift_release();
    uint64_t v9 = 0;
  }
  *a3 = v9;
  a3[1] = v7;
  swift_release();
  swift_release();
  sub_10003E518(a1, a2, (void (*)(uint64_t *__return_ptr, id *))sub_10003E50C);
  a3[2] = v10;
  return swift_release();
}

uint64_t sub_10003C870()
{
  return 0;
}

uint64_t sub_10003C878(void **__src, void **a2, unint64_t a3, void **__dst, uint64_t (*a5)(void **, void **, void **, uint64_t *))
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
  uint64_t v58 = __src;
  uint64_t v57 = __dst;
  if (v11 >= v13 >> 4)
  {
    if (v12 >= -15)
    {
      if (__dst != a2 || &a2[2 * v14] <= __dst) {
        memmove(__dst, a2, 16 * v14);
      }
      char v28 = &v6[16 * v14];
      uint64_t v56 = v28;
      uint64_t v58 = v7;
      if (v8 < v7)
      {
        uint64_t v29 = v5;
        if (v12 >= 16)
        {
          uint64_t v30 = (void **)(a3 - 16);
          unint64_t v31 = v7;
          uint64_t v44 = v6;
          uint64_t v51 = v8;
          while (1)
          {
            unint64_t v45 = (unint64_t)v28;
            char v47 = v7;
            uint64_t v32 = (void *)*((void *)v28 - 2);
            id v33 = v28 - 16;
            uint64_t v34 = *(v31 - 2);
            uint64_t v35 = (uint64_t)*(v31 - 1);
            v31 -= 2;
            uint64_t v54 = (void *)*((void *)v28 - 1);
            uint64_t v55 = v32;
            uint64_t v52 = v35;
            uint64_t v53 = v34;
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
              long long v41 = v44;
              unint64_t v42 = (unint64_t)v51;
              if (v40 != v47 || v30 >= v47) {
                *(_OWORD *)uint64_t v30 = *(_OWORD *)v31;
              }
              uint64_t v58 = v31;
            }
            else
            {
              uint64_t v56 = v33;
              long long v41 = v44;
              unint64_t v42 = (unint64_t)v51;
              unint64_t v31 = v47;
              if ((unint64_t)v40 < v45 || (unint64_t)v30 >= v45 || v40 != (void **)v45) {
                *(_OWORD *)uint64_t v30 = *(_OWORD *)v33;
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
      sub_10003CD70((void **)&v58, (const void **)&v57, &v56);
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
    uint64_t v56 = v46;
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
        uint64_t v54 = v17;
        uint64_t v55 = v16;
        uint64_t v52 = v20;
        uint64_t v53 = v19;
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
          uint64_t v57 = (void **)(v21 + 16);
          id v26 = v18;
        }
        uint64_t v15 = 0;
LABEL_23:
        uint64_t v8 = v27 + 2;
        uint64_t v58 = v8;
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
  uint64_t result = sub_1000627F0();
  __break(1u);
  return result;
}

char *sub_10003CC74(char *result, int64_t a2, char a3, char *a4)
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
    sub_100035DD8(&qword_1000A13C0);
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

char *sub_10003CD70(void **a1, const void **a2, void *a3)
{
  uint64_t v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 15;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -16)
  {
    uint64_t result = (char *)sub_1000627F0();
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

char *sub_10003CE2C(uint64_t a1)
{
  return sub_10003CC74(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_10003CE40(void *a1, void *a2)
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
    uint64_t v9 = sub_100062610();

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
    uint64_t result = sub_100062600();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    Swift::Int v22 = sub_10003D0C0(v7, result + 1);
    char v28 = (void *)v22;
    if (*(void *)(v22 + 24) <= *(void *)(v22 + 16))
    {
      id v26 = v8;
      sub_10003D644();
      id v23 = v28;
    }
    else
    {
      id v23 = (void *)v22;
      id v24 = v8;
    }
    sub_10003D8E4((uint64_t)v8, v23);
    uint64_t *v3 = (uint64_t)v23;
  }
  else
  {
    Swift::Int v11 = *(void *)(v6 + 40);
    swift_bridgeObjectRetain();
    Swift::Int v12 = sub_100062560(v11);
    uint64_t v13 = -1 << *(unsigned char *)(v6 + 32);
    unint64_t v14 = v12 & ~v13;
    if ((*(void *)(v6 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14))
    {
      type metadata accessor for MessageID(0);
      id v15 = *(id *)(*(void *)(v6 + 48) + 8 * v14);
      char v16 = sub_100062570();

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
        char v19 = sub_100062570();

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
    sub_10003DE84((uint64_t)v8, v14, isUniquelyReferenced_nonNull_native);
    uint64_t *v3 = v29;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

Swift::Int sub_10003D0C0(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    sub_100035DD8(&qword_1000A13D8);
    uint64_t v2 = sub_100062660();
    uint64_t v14 = v2;
    sub_1000625F0();
    if (sub_100062620())
    {
      type metadata accessor for MessageID(0);
      do
      {
        swift_dynamicCast();
        uint64_t v2 = v14;
        if (*(void *)(v14 + 24) <= *(void *)(v14 + 16))
        {
          sub_10003D644();
          uint64_t v2 = v14;
        }
        Swift::Int result = sub_100062560(*(void *)(v2 + 40));
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
      while (sub_100062620());
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

void *sub_10003D2A8(uint64_t a1, uint64_t a2)
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
    if (sub_1000627B0()) {
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
      id v8 = (id)sub_1000626A0();
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
    Swift::Int v11 = sub_100062560(*(void *)(v2 + 40));
    uint64_t v12 = -1 << *(unsigned char *)(v2 + 32);
    unint64_t v13 = v11 & ~v12;
    if ((*(void *)(v6 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13)) {
      break;
    }
LABEL_19:

    if (v33)
    {
      swift_bridgeObjectRetain();
      uint64_t v19 = sub_1000627B0();
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
  char v15 = sub_100062570();

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
      char v18 = sub_100062570();
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
    sub_10003D968((unint64_t *)((char *)&v29 - ((v23 + 15) & 0x3FFFFFFFFFFFFFF0)), v22, v2, v13, v35);
    uint64_t v25 = v24;
    swift_release();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v26 = (void *)swift_slowAlloc();
    memcpy(v26, (const void *)(v2 + 56), v23);
    sub_10003D968((unint64_t *)v26, v22, v2, v13, v35);
    uint64_t v25 = v27;
    swift_release();
    swift_bridgeObjectRelease();
    swift_slowDealloc();
  }
  return (void *)v25;
}

uint64_t sub_10003D644()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100035DD8(&qword_1000A13D8);
  uint64_t v3 = sub_100062650();
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
                  void *v6 = -1 << v27;
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
      uint64_t result = sub_100062560(*(void *)(v4 + 40));
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

unint64_t sub_10003D8E4(uint64_t a1, void *a2)
{
  sub_100062560(a2[5]);
  unint64_t result = sub_1000625E0();
  *(void *)((char *)a2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 56) |= 1 << result;
  *(void *)(a2[6] + 8 * result) = a1;
  ++a2[2];
  return result;
}

void sub_10003D968(unint64_t *a1, uint64_t a2, uint64_t a3, unint64_t a4, void *a5)
{
  uint64_t v5 = a5;
  uint64_t v7 = *(void *)(a3 + 16);
  *(unint64_t *)((char *)a1 + ((a4 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a4) - 1;
  uint64_t v33 = v7 - 1;
  unint64_t v8 = a5[1];
  if (*a5 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_1000627B0();
    swift_bridgeObjectRelease();
    if (v8 == v9) {
      goto LABEL_3;
    }
  }
  else if (v8 == *(void *)((*a5 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_3:
    swift_retain();
    sub_10003DC24(a1, a2, v33, a3);
    return;
  }
  uint64_t v35 = a3 + 56;
  unint64_t v34 = v5;
  while (1)
  {
    uint64_t v10 = *v5;
    if ((*v5 & 0xC000000000000001) != 0)
    {
      id v11 = (id)sub_1000626A0();
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
    Swift::Int v16 = sub_100062560(*(void *)(a3 + 40));
    uint64_t v17 = -1 << *(unsigned char *)(a3 + 32);
    unint64_t v18 = v16 & ~v17;
    unint64_t v19 = v18 >> 6;
    uint64_t v20 = 1 << v18;
    if (((1 << v18) & *(void *)(v35 + 8 * (v18 >> 6))) == 0) {
      goto LABEL_18;
    }
    type metadata accessor for MessageID(0);
    id v21 = *(id *)(*(void *)(a3 + 48) + 8 * v18);
    char v22 = sub_100062570();

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
        char v27 = sub_100062570();

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
      uint64_t v30 = sub_1000627B0();
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

uint64_t sub_10003DC24(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
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
  sub_100035DD8(&qword_1000A13D8);
  uint64_t result = sub_100062670();
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
    uint64_t result = sub_100062560(v18);
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

void sub_10003DE84(uint64_t a1, unint64_t a2, char a3)
{
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_10003D644();
  }
  else
  {
    if (v7 > v6)
    {
      sub_10003DFFC();
      goto LABEL_14;
    }
    sub_10003E1A8();
  }
  uint64_t v8 = *v3;
  Swift::Int v9 = sub_100062560(*(void *)(*v3 + 40));
  uint64_t v10 = -1 << *(unsigned char *)(v8 + 32);
  a2 = v9 & ~v10;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    type metadata accessor for MessageID(0);
    id v11 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
    char v12 = sub_100062570();

    if (v12)
    {
LABEL_13:
      sub_100062870();
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
        char v15 = sub_100062570();

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

id sub_10003DFFC()
{
  uint64_t v1 = v0;
  sub_100035DD8(&qword_1000A13D8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_100062640();
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

uint64_t sub_10003E1A8()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100035DD8(&qword_1000A13D8);
  uint64_t v3 = sub_100062650();
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
    uint64_t result = sub_100062560(v19);
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

void *sub_10003E424(void *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
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
    void *v7 = a4;
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

id sub_10003E500@<X0>(void **a1@<X0>, void *a2@<X8>)
{
  uint64_t v2 = *a1;
  *a2 = v2;
  return v2;
}

uint64_t sub_10003E50C@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  *a2 = *(void *)(a1 + 8);
  return swift_unknownObjectRetain();
}

void sub_10003E518(uint64_t a1, uint64_t a2, void (*a3)(uint64_t *__return_ptr, id *))
{
  uint64_t v8 = a2;
  if (a2 > 0)
  {
    sub_100035DD8((uint64_t *)&unk_1000A1EB0);
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
        sub_100035DD8((uint64_t *)&unk_1000A1EB0);
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

void sub_10003E7BC(uint64_t a1, uint64_t a2, uint64_t a3)
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
  sub_100035DD8(&qword_1000A13C8);
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

uint64_t sub_10003E8FC(uint64_t a1)
{
  uint64_t v2 = _swiftEmptyArrayStorage;
  if (((unint64_t)_swiftEmptyArrayStorage & 0xC000000000000000) != 0)
  {
    uint64_t v2 = sub_10003B608((unint64_t)_swiftEmptyArrayStorage, (void (*)(void *, uint64_t, unint64_t))sub_10005F71C);
    sub_10003B608((unint64_t)_swiftEmptyArrayStorage, (void (*)(void *, uint64_t, unint64_t))sub_10005F508);
  }
  uint64_t v17 = 0;
  uint64_t v18 = (uint64_t)v2;
  uint64_t v3 = *(void *)(a1 + 16);
  sub_10003BEAC(v3, 0);
  sub_1000626F0();
  if (v3)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = a1 + 40;
    while (1)
    {
      id v6 = *(id *)(v4 - 8);
      swift_unknownObjectRetain();
      uint64_t result = sub_10003B80C((uint64_t)v6, v17, v18);
      if ((v9 & 1) == 0)
      {
        __break(1u);
        return result;
      }
      uint64_t v5 = v8;
      id v10 = v6;
      sub_1000626D0();
      sub_100062700();
      sub_100062710();
      sub_1000626E0();
      uint64_t v11 = v17;
      unint64_t v12 = *(void *)(v18 + 16);
      if (v17)
      {
        swift_beginAccess();
        if (sub_100061F00() >= (uint64_t)v12)
        {
          if ((swift_isUniquelyReferenced_native() & 1) == 0)
          {
            uint64_t v16 = sub_100061F20();
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
          sub_100061EC0();
          uint64_t v5 = v11;
        }
        else
        {
          uint64_t v13 = *(void *)(v17 + 24) & 0x3FLL;
          if (v12 > 0xF || v13)
          {
LABEL_14:
            uint64_t v14 = sub_100061F30();
            if (v13 <= v14) {
              uint64_t v15 = v14;
            }
            else {
              uint64_t v15 = v13;
            }
            uint64_t v5 = sub_10003BBC8(v18, v15, 0, v13);
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
      sub_1000626D0();
      sub_100062700();
      sub_100062710();
      sub_1000626E0();

      v4 += 16;
      if (!--v3) {
        goto LABEL_21;
      }
    }
  }
  return 0;
}

void sub_10003EBB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t (*a5)(uint64_t *, uint64_t *, void **, uint64_t *))
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

void sub_10003ED18(uint64_t *a1, uint64_t (*a2)(uint64_t *, uint64_t *, void **, uint64_t *))
{
  uint64_t v3 = v2;
  Swift::Int v5 = a1[1];
  Swift::Int v6 = sub_100062830(v5);
  if (v6 >= v5)
  {
    if (v5 < 0) {
      goto LABEL_138;
    }
    if (v5) {
      sub_10003EBB8(0, v5, 1, a1, a2);
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
  v110 = a1;
  if (v5 < 2)
  {
    long long v10 = (char *)_swiftEmptyArrayStorage;
    __dst = (void **)&_swiftEmptyArrayStorage[4];
    v115 = _swiftEmptyArrayStorage;
    if (v5 != 1)
    {
      unint64_t v41 = _swiftEmptyArrayStorage[2];
      goto LABEL_102;
    }
  }
  else
  {
    uint64_t v8 = v7 >> 1;
    sub_100035DD8(&qword_1000A13B8);
    uint64_t v9 = sub_1000623C0();
    *(void *)(v9 + 16) = v8;
    v115 = (void *)v9;
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
      v116 = v10;
      uint64_t v16 = v12 + 16 * v15;
      uint64_t v17 = *(void **)v16;
      uint64_t v18 = *(void *)(v16 + 8);
      uint64_t v19 = v12 + 16 * v14;
      uint64_t v20 = *(void **)v19;
      uint64_t v21 = *(void *)(v19 + 8);
      id v127 = v17;
      v125 = v20;
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
          v125 = v29;
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
    v117 = v10;
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
        v94 = *(void **)v92;
        uint64_t v95 = *(void *)(v92 + 8);
        v126[0] = *((void *)&v90 + 1);
        id v127 = (id)v90;
        uint64_t v124 = v95;
        v125 = v94;
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
      long long v10 = sub_10003CC74(0, *((void *)v10 + 2) + 1, 1, v10);
    }
    unint64_t v40 = *((void *)v10 + 2);
    unint64_t v39 = *((void *)v10 + 3);
    unint64_t v41 = v40 + 1;
    uint64_t v12 = v122;
    Swift::Int v119 = v15;
    if (v40 >= v39 >> 1)
    {
      v100 = sub_10003CC74((char *)(v39 > 1), v40 + 1, 1, v10);
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
        uint64_t v57 = &v42[16 * v41 - 32];
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
          v79 = &v42[16 * v44];
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
          v62 = &v42[16 * v41 - 32];
          uint64_t v64 = *(void *)v62;
          uint64_t v63 = *((void *)v62 + 1);
          BOOL v65 = __OFSUB__(v63, v64);
          uint64_t v66 = v63 - v64;
          char v67 = v65;
          if (v65) {
            goto LABEL_127;
          }
          v68 = &v42[16 * v44];
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
        v75 = &v42[16 * v44];
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
      v86 = &v42[16 * v44];
      uint64_t v87 = *((void *)v86 + 1);
      sub_10003C878((void **)(v12 + 16 * *(void *)v84), (void **)(v12 + 16 * *(void *)v86), v12 + 16 * v87, __dst, (uint64_t (*)(void **, void **, void **, uint64_t *))a2);
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
          sub_10003C878((void **)(v101 + 16 * v103), (void **)(v101 + 16 * *(void *)&v10[16 * v41 + 16]), v101 + 16 * v104, __dst, (uint64_t (*)(void **, void **, void **, uint64_t *))a2);
          if (v3) {
            break;
          }
          if (v104 < v103) {
            goto LABEL_134;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            long long v10 = sub_10003CE2C((uint64_t)v10);
          }
          if (v102 >= *((void *)v10 + 2)) {
            goto LABEL_135;
          }
          v105 = &v10[16 * v102 + 32];
          *(void *)v105 = v103;
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
  sub_100062780();
  __break(1u);
}

void sub_10003F5A0(void **a1, uint64_t (*a2)(uint64_t *, uint64_t *, void **, uint64_t *))
{
  uint64_t v4 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v4 = (void *)sub_10003C130(v4);
  }
  uint64_t v5 = v4[2];
  v6[0] = (uint64_t)(v4 + 4);
  v6[1] = v5;
  sub_10003ED18(v6, a2);
  *a1 = v4;
}

uint64_t sub_10003F628()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10003F660(void *a1)
{
  return sub_10003A43C(a1, *(void *)(v1 + 16));
}

uint64_t sub_10003F668()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10003F6A0(void *a1)
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
}

unint64_t sub_10003F6CC()
{
  unint64_t result = qword_1000A13D0;
  if (!qword_1000A13D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000A13D0);
  }
  return result;
}

uint64_t *sub_10003F720(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_10003F784(unint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  if (a1 >> 62)
  {
    uint64_t v5 = sub_1000627B0();
    char v96 = (char)v3;
    if (v5) {
      goto LABEL_3;
    }
LABEL_13:
    swift_bridgeObjectRelease();
    uint64_t v7 = _swiftEmptyArrayStorage;
    goto LABEL_14;
  }
  uint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  char v96 = (char)a2;
  if (!v5) {
    goto LABEL_13;
  }
LABEL_3:
  v100[0] = (uint64_t)_swiftEmptyArrayStorage;
  sub_100054BF0(0, v5 & ~(v5 >> 63), 0);
  if (v5 < 0)
  {
LABEL_77:
    __break(1u);
LABEL_78:
    swift_once();
    goto LABEL_51;
  }
  uint64_t v6 = 0;
  uint64_t v7 = (void *)v100[0];
  do
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      uint64_t v8 = (void *)sub_1000626A0();
    }
    else
    {
      uint64_t v8 = *(void **)(a1 + 8 * v6 + 32);
      swift_unknownObjectRetain();
    }
    id v9 = [v8 identifier];
    v100[0] = (uint64_t)v7;
    unint64_t v11 = v7[2];
    unint64_t v10 = v7[3];
    if (v11 >= v10 >> 1)
    {
      sub_100054BF0(v10 > 1, v11 + 1, 1);
      uint64_t v7 = (void *)v100[0];
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
  uint64_t v3 = (void *)sub_100047A60((uint64_t)_swiftEmptyArrayStorage);
  uint64_t v13 = v7[2];
  if (v13)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = (uint64_t)(v7 + 5);
    id v97 = v7;
    while (1)
    {
      uint64_t v2 = *(void *)v5;
      uint64_t v15 = v3[2];
      id v16 = *(id *)(v5 - 8);
      uint64_t v17 = v16;
      if (v15)
      {
        id v18 = v16;
        swift_unknownObjectRetain_n();
        id v19 = v18;
        unint64_t v20 = sub_100054784((uint64_t)v19);
        if (v21)
        {
          uint64_t v22 = *(void *)(v3[7] + 8 * v20);
          swift_bridgeObjectRetain();

          v100[0] = v22;
          swift_unknownObjectRetain();
          sub_100062360();
          if (*(void *)((v100[0] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v100[0] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
            sub_1000623B0();
          }
          sub_1000623D0();
          sub_1000623A0();
          uint64_t v23 = v100[0];
          char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          char v99 = v3;
          unint64_t v26 = sub_100054784((uint64_t)v19);
          uint64_t v27 = v3[2];
          BOOL v28 = (v25 & 1) == 0;
          uint64_t v29 = v27 + v28;
          if (__OFADD__(v27, v28)) {
            goto LABEL_75;
          }
          char v30 = v25;
          if (v3[3] >= v29)
          {
            if (isUniquelyReferenced_nonNull_native)
            {
              uint64_t v33 = 8 * v26;
              if ((v25 & 1) == 0) {
                goto LABEL_45;
              }
            }
            else
            {
              sub_10003B45C();
              uint64_t v3 = v99;
              uint64_t v33 = 8 * v26;
              if ((v30 & 1) == 0) {
                goto LABEL_45;
              }
            }
          }
          else
          {
            sub_10003AED8(v29, isUniquelyReferenced_nonNull_native);
            uint64_t v3 = v99;
            unint64_t v31 = sub_100054784((uint64_t)v19);
            if ((v30 & 1) != (v32 & 1)) {
              goto LABEL_81;
            }
            unint64_t v26 = v31;
            uint64_t v33 = 8 * v31;
            if ((v30 & 1) == 0)
            {
LABEL_45:
              v3[(v26 >> 6) + 8] |= 1 << v26;
              *(void *)(v3[6] + v33) = v19;
              *(void *)(v3[7] + v33) = v23;
              uint64_t v53 = v3[2];
              BOOL v49 = __OFADD__(v53, 1);
              uint64_t v54 = v53 + 1;
              if (v49) {
                goto LABEL_76;
              }
              v3[2] = v54;
              id v55 = v19;
              goto LABEL_47;
            }
          }
          uint64_t v52 = v3[7];
          swift_bridgeObjectRelease();
          *(void *)(v52 + v33) = v100[0];
LABEL_47:
          swift_bridgeObjectRelease();

          goto LABEL_18;
        }
      }
      else
      {
        swift_unknownObjectRetain_n();
        id v34 = v17;
      }
      sub_100035DD8((uint64_t *)&unk_1000A1EB0);
      uint64_t v35 = swift_allocObject();
      *(_OWORD *)(v35 + 16) = xmmword_100085330;
      *(void *)(v35 + 32) = v2;
      v100[0] = v35;
      sub_1000623A0();
      uint64_t v36 = v100[0];
      id v37 = v17;
      swift_unknownObjectRetain();
      char v38 = swift_isUniquelyReferenced_nonNull_native();
      v100[0] = (uint64_t)v3;
      unint64_t v40 = sub_100054784((uint64_t)v37);
      uint64_t v41 = v3[2];
      BOOL v42 = (v39 & 1) == 0;
      uint64_t v43 = v41 + v42;
      if (__OFADD__(v41, v42))
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
      char v44 = v39;
      if (v3[3] >= v43)
      {
        if (v38)
        {
          if ((v39 & 1) == 0) {
            goto LABEL_37;
          }
        }
        else
        {
          sub_10003B45C();
          uint64_t v3 = (void *)v100[0];
          if ((v44 & 1) == 0) {
            goto LABEL_37;
          }
        }
      }
      else
      {
        sub_10003AED8(v43, v38);
        uint64_t v3 = (void *)v100[0];
        unint64_t v45 = sub_100054784((uint64_t)v37);
        if ((v44 & 1) != (v46 & 1))
        {
LABEL_81:
          type metadata accessor for MessageID(0);
          sub_100062880();
          __break(1u);
LABEL_82:
          swift_release();
          swift_release();
          swift_release();
          uint64_t result = swift_release();
          __break(1u);
          return result;
        }
        unint64_t v40 = v45;
        if ((v44 & 1) == 0)
        {
LABEL_37:
          v3[(v40 >> 6) + 8] |= 1 << v40;
          uint64_t v47 = 8 * v40;
          *(void *)(v3[6] + v47) = v37;
          *(void *)(v3[7] + v47) = v36;
          uint64_t v48 = v3[2];
          BOOL v49 = __OFADD__(v48, 1);
          uint64_t v50 = v48 + 1;
          if (v49) {
            goto LABEL_74;
          }
          v3[2] = v50;
          id v51 = v37;
          goto LABEL_17;
        }
      }
      uint64_t v14 = v3[7];
      swift_bridgeObjectRelease();
      *(void *)(v14 + 8 * v40) = v36;
LABEL_17:
      swift_bridgeObjectRelease();

LABEL_18:
      swift_unknownObjectRelease_n();
      uint64_t v7 = v97;
      v5 += 16;
      if (!--v13)
      {
        swift_bridgeObjectRelease();
        break;
      }
    }
  }
  uint64_t v5 = 0;
  sub_10003662C((uint64_t)v3);
  uint64_t v2 = v56;
  if (!*(void *)(v56 + 16))
  {
    uint64_t v74 = v7;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_1000A0E80 == -1) {
      goto LABEL_62;
    }
    goto LABEL_80;
  }
  swift_bridgeObjectRelease();
  if (qword_1000A0E80 != -1) {
    goto LABEL_78;
  }
LABEL_51:
  uint64_t v57 = sub_1000621F0();
  sub_100034CF4(v57, (uint64_t)qword_1000A1170);
  swift_bridgeObjectRetain_n();
  uint64_t v58 = sub_1000621D0();
  os_log_type_t v59 = sub_1000624E0();
  if (os_log_type_enabled(v58, v59))
  {
    uint64_t v98 = v5;
    uint64_t v60 = swift_slowAlloc();
    v100[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v60 = 136315394;
    int64_t v61 = *(void *)(v2 + 16);
    if (v61)
    {
      char v99 = _swiftEmptyArrayStorage;
      sub_1000626F0();
      v62 = (void **)(v2 + 32);
      int64_t v63 = v61;
      do
      {
        uint64_t v64 = *v62;
        v62 += 2;
        id v65 = v64;
        sub_1000626D0();
        sub_100062700();
        sub_100062710();
        sub_1000626E0();
        --v63;
      }
      while (v63);
    }
    type metadata accessor for MessageID(0);
    uint64_t v66 = sub_100062390();
    unint64_t v68 = v67;
    swift_bridgeObjectRelease();
    char v99 = (void *)sub_10005B9C0(v66, v68, v100);
    sub_100062590();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v60 + 12) = 2080;
    if (v61)
    {
      uint64_t v95 = v58;
      char v99 = _swiftEmptyArrayStorage;
      sub_100054C20(0, v61, 0);
      uint64_t v69 = _swiftEmptyArrayStorage;
      unint64_t v70 = _swiftEmptyArrayStorage[2];
      uint64_t v71 = (uint64_t *)(v2 + 40);
      do
      {
        uint64_t v72 = *v71;
        char v99 = v69;
        unint64_t v73 = v69[3];
        swift_bridgeObjectRetain();
        if (v70 >= v73 >> 1)
        {
          sub_100054C20(v73 > 1, v70 + 1, 1);
          uint64_t v69 = v99;
        }
        v69[2] = v70 + 1;
        v69[v70 + 4] = v72;
        v71 += 2;
        ++v70;
        --v61;
      }
      while (v61);
      uint64_t v58 = v95;
    }
    sub_100035DD8(&qword_1000A13F8);
    uint64_t v80 = sub_100062390();
    unint64_t v82 = v81;
    swift_bridgeObjectRelease();
    char v99 = (void *)sub_10005B9C0(v80, v82, v100);
    sub_100062590();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v58, v59, "CachedVoicemailManager.Cache.init(voicemails:) with duplicate keys: %s, voicemails: %s", (uint8_t *)v60, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v5 = v98;
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }
  uint64_t v79 = sub_100036888((uint64_t)v3);
  swift_bridgeObjectRelease();
  while (1)
  {
    uint64_t v83 = sub_10003E8FC(v79);
    uint64_t v85 = v84;
    uint64_t v87 = v86;
    swift_bridgeObjectRelease();
    type metadata accessor for CachedVoicemailManager.Cache();
    unint64_t v88 = (uint64_t *)swift_allocObject();
    v88[2] = v83;
    v88[3] = v85;
    v88[4] = v87;
    if ((v96 & 1) == 0) {
      return (uint64_t)v88;
    }
    swift_beginAccess();
    uint64_t v90 = v88[2];
    uint64_t v89 = v88[3];
    uint64_t v91 = v88[4];
    swift_retain();
    swift_retain();
    swift_retain();
    sub_10003E7BC(v90, v89, v91);
    char v99 = v92;
    sub_10003F5A0(&v99, (uint64_t (*)(uint64_t *, uint64_t *, void **, uint64_t *))sub_100036C70);
    if (v5) {
      goto LABEL_82;
    }
    swift_release();
    swift_release();
    swift_release();
    uint64_t v74 = v99;
    uint64_t v93 = v99[2];
    if (v93 == *(void *)(v91 + 16))
    {
      sub_10003C798((uint64_t)(v99 + 4), v93, v88 + 2);
      swift_release();
      swift_endAccess();
      return (uint64_t)v88;
    }
    __break(1u);
LABEL_80:
    swift_once();
LABEL_62:
    uint64_t v75 = sub_1000621F0();
    sub_100034CF4(v75, (uint64_t)qword_1000A1170);
    uint64_t v76 = sub_1000621D0();
    os_log_type_t v77 = sub_1000624F0();
    if (os_log_type_enabled(v76, v77))
    {
      uint64_t v78 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v78 = 0;
      _os_log_impl((void *)&_mh_execute_header, v76, v77, "CachedVoicemailManager.Cache.init(voicemails:) without duplicate keys", v78, 2u);
      swift_slowDealloc();
    }

    uint64_t v79 = (uint64_t)v74;
  }
}

uint64_t sub_1000401C0(unint64_t a1)
{
  unint64_t v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_1000627B0();
    swift_bridgeObjectRelease();
  }
  type metadata accessor for MessageID(0);
  sub_100040864(&qword_1000A13E0, (void (*)(uint64_t))type metadata accessor for MessageID);
  uint64_t result = sub_1000624B0();
  uint64_t v10 = result;
  if (v2)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_1000627B0();
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
        uint64_t v6 = (void *)sub_1000626A0();
        sub_10003CE40(&v9, v6);
      }
    }
    else
    {
      uint64_t v7 = (void **)(a1 + 32);
      do
      {
        uint64_t v8 = *v7++;
        sub_10003CE40(&v9, v8);

        --v4;
      }
      while (v4);
    }
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_100040334()
{
  sub_100037404(*(void *)(v0 + 16), 1);

  return swift_bridgeObjectRelease();
}

uint64_t sub_100040374()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000403AC()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_1000403EC(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_100036040;
  return sub_100038A5C(a1, v4, v5, v6);
}

uint64_t sub_1000404A0()
{
  _Block_release(*(const void **)(v0 + 24));
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_1000404E8()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_100036550;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_1000A1408 + dword_1000A1408);
  return v6(v2, v3, v4);
}

uint64_t sub_1000405A4(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_100036550;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_1000A19C8 + dword_1000A19C8);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_100040670()
{
  _Block_release(*(const void **)(v0 + 16));
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000406B0()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  void *v4 = v1;
  v4[1] = sub_100036550;
  uint64_t v5 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_1000A1420 + dword_1000A1420);
  return v5(v2, v3);
}

uint64_t sub_100040760()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_100036550;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_1000A19C0 + dword_1000A19C0);
  return v6(v2, v3, v4);
}

uint64_t sub_100040824()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100040864(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100040A9C(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_100040AB8(void *result, int a2)
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

void *sub_100040AF4(unint64_t a1)
{
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
    unint64_t result = (void *)sub_1000626F0();
    if (v2 < 0)
    {
      __break(1u);
      return result;
    }
    uint64_t v4 = 0;
    while (v2 != v4)
    {
      if ((a1 & 0xC000000000000001) != 0) {
        unsigned int v5 = (char *)sub_1000626A0();
      }
      else {
        unsigned int v5 = (char *)*(id *)(a1 + 8 * v4 + 32);
      }
      uint64_t v6 = v5;
      ++v4;
      id v7 = *(id *)&v5[OBJC_IVAR___MPVisualMessage_vmMessage];

      sub_1000626D0();
      sub_100062700();
      sub_100062710();
      sub_1000626E0();
      if (v2 == v4) {
        return _swiftEmptyArrayStorage;
      }
    }
    __break(1u);
LABEL_14:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_1000627B0();
    swift_bridgeObjectRelease();
  }
  return result;
}

void *sub_100040C38(unint64_t a1)
{
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
    unint64_t v11 = _swiftEmptyArrayStorage;
    unint64_t result = (void *)sub_1000626F0();
    if (v2 < 0)
    {
      __break(1u);
      return result;
    }
    uint64_t v4 = 0;
    while (v2 != v4)
    {
      if ((a1 & 0xC000000000000001) != 0) {
        id v5 = (id)sub_1000626A0();
      }
      else {
        id v5 = *(id *)(a1 + 8 * v4 + 32);
      }
      uint64_t v6 = v5;
      ++v4;
      id v7 = (objc_class *)type metadata accessor for VisualMessage();
      uint64_t v8 = (char *)objc_allocWithZone(v7);
      *(void *)&v8[OBJC_IVAR___MPVisualMessage_vmMessage] = v6;
      v10.receiver = v8;
      v10.super_class = v7;
      id v9 = v6;
      [super init];

      sub_1000626D0();
      sub_100062700();
      sub_100062710();
      sub_1000626E0();
      if (v2 == v4) {
        return v11;
      }
    }
    __break(1u);
LABEL_14:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_1000627B0();
    swift_bridgeObjectRelease();
  }
  return result;
}

char *sub_100040DE0(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v8 = OBJC_IVAR____TtC9IntentsUI22VisualVoicemailManager_messagesChangedPublisher;
  sub_100035DD8((uint64_t *)&unk_1000A14F0);
  swift_allocObject();
  id v9 = v3;
  *(void *)&v3[v8] = sub_100062260();
  *(void *)&v9[OBJC_IVAR____TtC9IntentsUI22VisualVoicemailManager_visualVoicemailManager] = a1;
  objc_super v10 = &v9[OBJC_IVAR____TtC9IntentsUI22VisualVoicemailManager_onVoicemailsChanged];
  *(void *)objc_super v10 = a2;
  *((void *)v10 + 1) = a3;
  id v11 = a1;
  swift_retain();

  v17.receiver = v9;
  v17.super_class = ObjectType;
  uint64_t v12 = (char *)[super init];
  uint64_t v13 = *(void **)&v12[OBJC_IVAR____TtC9IntentsUI22VisualVoicemailManager_visualVoicemailManager];
  uint64_t v14 = v12;
  id v15 = v13;
  [v15 setDelegate:v14];

  swift_release();
  return v14;
}

uint64_t sub_100040F64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  *(unsigned char *)(v6 + 25) = a6;
  *(void *)(v6 + 32) = a4;
  *(void *)(v6 + 40) = a5;
  type metadata accessor for VoicemailActor();
  swift_initStaticObject();
  sub_100045834();
  uint64_t v8 = sub_1000623E0();
  return _swift_task_switch(sub_100041000, v8, v7);
}

uint64_t sub_100041000()
{
  char v1 = *(unsigned char *)(v0 + 25);
  uint64_t v2 = *(void *)(v0 + 40);
  (*(void (**)(void))(*(void *)(v0 + 32) + OBJC_IVAR____TtC9IntentsUI22VisualVoicemailManager_onVoicemailsChanged))();
  *(void *)(v0 + 16) = v2;
  *(unsigned char *)(v0 + 24) = v1;
  sub_100062250();
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_10004109C()
{
  *(void *)(v1 + 40) = v0;
  type metadata accessor for VoicemailActor();
  swift_initStaticObject();
  sub_100045834();
  uint64_t v3 = sub_1000623E0();
  return _swift_task_switch(sub_100041134, v3, v2);
}

uint64_t sub_100041134()
{
  int v24 = v0;
  p_super_class = &v0[2].super_class;
  id v2 = [*(id *)((char *)v0[2].super_class + OBJC_IVAR____TtC9IntentsUI22VisualVoicemailManager_visualVoicemailManager) allVoicemails];
  sub_100045950();
  unint64_t v3 = sub_100062380();

  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_1000627B0();
    swift_bridgeObjectRelease();
    uint64_t v22 = &v0[2].super_class;
    if (v4) {
      goto LABEL_3;
    }
LABEL_11:
    swift_bridgeObjectRelease();
    unint64_t v11 = (unint64_t)_swiftEmptyArrayStorage;
    goto LABEL_12;
  }
  uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v22 = &v0[2].super_class;
  if (!v4) {
    goto LABEL_11;
  }
LABEL_3:
  uint64_t v23 = _swiftEmptyArrayStorage;
  uint64_t result = sub_1000626F0();
  if (v4 < 0)
  {
    __break(1u);
    return result;
  }
  uint64_t v6 = 0;
  do
  {
    if ((v3 & 0xC000000000000001) != 0) {
      id v7 = (id)sub_1000626A0();
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
    sub_1000626D0();
    sub_100062700();
    sub_100062710();
    sub_1000626E0();
  }
  while (v4 != v6);
  unint64_t v11 = (unint64_t)v23;
  swift_bridgeObjectRelease();
  p_super_class = v22;
LABEL_12:
  if (qword_1000A0EA0 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_1000621F0();
  sub_100034CF4(v12, (uint64_t)qword_1000A2E88);
  swift_bridgeObjectRetain_n();
  uint64_t v13 = sub_1000621D0();
  os_log_type_t v14 = sub_1000624F0();
  if (os_log_type_enabled(v13, v14))
  {
    id v15 = (uint64_t *)(p_super_class - 1);
    id v16 = (uint8_t *)swift_slowAlloc();
    uint64_t v23 = (void *)swift_slowAlloc();
    *(_DWORD *)id v16 = 136315138;
    type metadata accessor for VisualMessage();
    swift_bridgeObjectRetain();
    uint64_t v17 = sub_100062390();
    unint64_t v19 = v18;
    swift_bridgeObjectRelease();
    uint64_t *v15 = sub_10005B9C0(v17, v19, (uint64_t *)&v23);
    sub_100062590();
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
    sub_100035DD8(&qword_1000A1500);
    uint64_t v20 = sub_1000627A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_100062860();
    uint64_t v20 = v11;
  }
  swift_bridgeObjectRelease();
  super_class = (uint64_t (*)(uint64_t))v0->super_class;
  return super_class(v20);
}

uint64_t sub_100041684(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = a2;
  type metadata accessor for VoicemailActor();
  swift_initStaticObject();
  sub_100045834();
  uint64_t v4 = sub_1000623E0();
  return _swift_task_switch(sub_10004171C, v4, v3);
}

uint64_t sub_10004171C()
{
  uint64_t v1 = *(void **)(v0 + 24);
  *(void *)(v0 + 32) = _Block_copy(*(const void **)(v0 + 16));
  id v2 = v1;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 40) = v3;
  void *v3 = v0;
  v3[1] = sub_1000417C0;
  return sub_10004109C();
}

uint64_t sub_1000417C0()
{
  uint64_t v1 = *(void (***)(void, void))(*v0 + 32);
  id v2 = *(void **)(*v0 + 24);
  uint64_t v6 = *v0;
  swift_task_dealloc();

  sub_100035DD8(&qword_1000A1500);
  Class isa = sub_100062370().super.isa;
  swift_bridgeObjectRelease();
  ((void (**)(void, Class))v1)[2](v1, isa);

  _Block_release(v1);
  uint64_t v4 = *(uint64_t (**)(void))(v6 + 8);
  return v4();
}

uint64_t sub_100041930(uint64_t a1)
{
  v2[4] = a1;
  v2[5] = v1;
  uint64_t v3 = sub_1000621F0();
  v2[6] = v3;
  v2[7] = *(void *)(v3 - 8);
  v2[8] = swift_task_alloc();
  type metadata accessor for VoicemailActor();
  swift_initStaticObject();
  sub_100045834();
  uint64_t v5 = sub_1000623E0();
  return _swift_task_switch(sub_100041A24, v5, v4);
}

uint64_t sub_100041A24()
{
  char v21 = v0;
  uint64_t v1 = sub_100047C88(v0[4]);
  if (v1)
  {
    id v2 = *(void **)(v0[5] + OBJC_IVAR____TtC9IntentsUI22VisualVoicemailManager_visualVoicemailManager);
    sub_100040AF4((unint64_t)v1);
    swift_bridgeObjectRelease();
    sub_100045950();
    Class isa = sub_100062370().super.isa;
    swift_bridgeObjectRelease();
    id v4 = [v2 deleteVoicemails:isa];
  }
  else
  {
    if (qword_1000A0EA0 != -1) {
      swift_once();
    }
    uint64_t v6 = v0[7];
    uint64_t v5 = v0[8];
    uint64_t v7 = v0[6];
    uint64_t v8 = sub_100034CF4(v7, (uint64_t)qword_1000A2E88);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v5, v8, v7);
    swift_bridgeObjectRetain();
    id v9 = sub_1000621D0();
    os_log_type_t v10 = sub_1000624D0();
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
      v0[2] = sub_10005B9C0(0x654D3C7961727241, 0xEE003E6567617373, &v20);
      sub_100062590();
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
  id v16 = (uint64_t (*)(void))v0[1];
  return v16();
}

uint64_t sub_100041E60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  type metadata accessor for VoicemailActor();
  swift_initStaticObject();
  sub_100045834();
  uint64_t v5 = sub_1000623E0();
  return _swift_task_switch(sub_100041EFC, v5, v4);
}

uint64_t sub_100041EFC()
{
  uint64_t v1 = *(void **)(v0 + 32);
  *(void *)(v0 + 40) = _Block_copy(*(const void **)(v0 + 24));
  sub_100035DD8(&qword_1000A1500);
  uint64_t v2 = sub_100062380();
  *(void *)(v0 + 48) = v2;
  id v3 = v1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v4;
  void *v4 = v0;
  v4[1] = sub_1000464A0;
  return sub_100041930(v2);
}

uint64_t sub_100041FD0(uint64_t a1)
{
  v2[4] = a1;
  v2[5] = v1;
  uint64_t v3 = sub_1000621F0();
  v2[6] = v3;
  v2[7] = *(void *)(v3 - 8);
  v2[8] = swift_task_alloc();
  type metadata accessor for VoicemailActor();
  swift_initStaticObject();
  sub_100045834();
  uint64_t v5 = sub_1000623E0();
  return _swift_task_switch(sub_1000420C4, v5, v4);
}

uint64_t sub_1000420C4()
{
  char v21 = v0;
  uint64_t v1 = sub_100047C88(v0[4]);
  if (v1)
  {
    uint64_t v2 = *(void **)(v0[5] + OBJC_IVAR____TtC9IntentsUI22VisualVoicemailManager_visualVoicemailManager);
    sub_100040AF4((unint64_t)v1);
    swift_bridgeObjectRelease();
    sub_100045950();
    Class isa = sub_100062370().super.isa;
    swift_bridgeObjectRelease();
    id v4 = [v2 markVoicemailsAsRead:isa];
  }
  else
  {
    if (qword_1000A0EA0 != -1) {
      swift_once();
    }
    uint64_t v6 = v0[7];
    uint64_t v5 = v0[8];
    uint64_t v7 = v0[6];
    uint64_t v8 = sub_100034CF4(v7, (uint64_t)qword_1000A2E88);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v5, v8, v7);
    swift_bridgeObjectRetain();
    id v9 = sub_1000621D0();
    os_log_type_t v10 = sub_1000624D0();
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
      v0[2] = sub_10005B9C0(0x654D3C7961727241, 0xEE003E6567617373, &v20);
      sub_100062590();
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
  id v16 = (uint64_t (*)(void))v0[1];
  return v16();
}

uint64_t sub_100042500(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  type metadata accessor for VoicemailActor();
  swift_initStaticObject();
  sub_100045834();
  uint64_t v5 = sub_1000623E0();
  return _swift_task_switch(sub_10004259C, v5, v4);
}

uint64_t sub_10004259C()
{
  uint64_t v1 = *(void **)(v0 + 32);
  *(void *)(v0 + 40) = _Block_copy(*(const void **)(v0 + 24));
  sub_100035DD8(&qword_1000A1500);
  uint64_t v2 = sub_100062380();
  *(void *)(v0 + 48) = v2;
  id v3 = v1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v4;
  void *v4 = v0;
  v4[1] = sub_100042670;
  return sub_100041FD0(v2);
}

uint64_t sub_100042670()
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

uint64_t sub_1000427CC(uint64_t a1)
{
  v2[4] = a1;
  v2[5] = v1;
  uint64_t v3 = sub_1000621F0();
  v2[6] = v3;
  v2[7] = *(void *)(v3 - 8);
  v2[8] = swift_task_alloc();
  type metadata accessor for VoicemailActor();
  swift_initStaticObject();
  sub_100045834();
  uint64_t v5 = sub_1000623E0();
  return _swift_task_switch(sub_1000428C0, v5, v4);
}

uint64_t sub_1000428C0()
{
  char v21 = v0;
  uint64_t v1 = sub_100047C88(v0[4]);
  if (v1)
  {
    uint64_t v2 = *(void **)(v0[5] + OBJC_IVAR____TtC9IntentsUI22VisualVoicemailManager_visualVoicemailManager);
    sub_100040AF4((unint64_t)v1);
    swift_bridgeObjectRelease();
    sub_100045950();
    Class isa = sub_100062370().super.isa;
    swift_bridgeObjectRelease();
    id v4 = [v2 trashVoicemails:isa];
  }
  else
  {
    if (qword_1000A0EA0 != -1) {
      swift_once();
    }
    uint64_t v6 = v0[7];
    uint64_t v5 = v0[8];
    uint64_t v7 = v0[6];
    uint64_t v8 = sub_100034CF4(v7, (uint64_t)qword_1000A2E88);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v5, v8, v7);
    swift_bridgeObjectRetain();
    id v9 = sub_1000621D0();
    os_log_type_t v10 = sub_1000624D0();
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
      v0[2] = sub_10005B9C0(0x654D3C7961727241, 0xEE003E6567617373, &v20);
      sub_100062590();
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
  id v16 = (uint64_t (*)(void))v0[1];
  return v16();
}

uint64_t sub_100042CFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  type metadata accessor for VoicemailActor();
  swift_initStaticObject();
  sub_100045834();
  uint64_t v5 = sub_1000623E0();
  return _swift_task_switch(sub_100042D98, v5, v4);
}

uint64_t sub_100042D98()
{
  uint64_t v1 = *(void **)(v0 + 32);
  *(void *)(v0 + 40) = _Block_copy(*(const void **)(v0 + 24));
  sub_100035DD8(&qword_1000A1500);
  uint64_t v2 = sub_100062380();
  *(void *)(v0 + 48) = v2;
  id v3 = v1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v4;
  void *v4 = v0;
  v4[1] = sub_1000464A0;
  return sub_1000427CC(v2);
}

uint64_t sub_100042E6C(uint64_t a1)
{
  v2[4] = a1;
  v2[5] = v1;
  uint64_t v3 = sub_1000621F0();
  v2[6] = v3;
  v2[7] = *(void *)(v3 - 8);
  v2[8] = swift_task_alloc();
  type metadata accessor for VoicemailActor();
  swift_initStaticObject();
  sub_100045834();
  uint64_t v5 = sub_1000623E0();
  return _swift_task_switch(sub_100042F60, v5, v4);
}

uint64_t sub_100042F60()
{
  char v21 = v0;
  uint64_t v1 = sub_100047C88(v0[4]);
  if (v1)
  {
    uint64_t v2 = *(void **)(v0[5] + OBJC_IVAR____TtC9IntentsUI22VisualVoicemailManager_visualVoicemailManager);
    sub_100040AF4((unint64_t)v1);
    swift_bridgeObjectRelease();
    sub_100045950();
    Class isa = sub_100062370().super.isa;
    swift_bridgeObjectRelease();
    id v4 = [v2 removeVoicemailsFromTrash:isa];
  }
  else
  {
    if (qword_1000A0EA0 != -1) {
      swift_once();
    }
    uint64_t v6 = v0[7];
    uint64_t v5 = v0[8];
    uint64_t v7 = v0[6];
    uint64_t v8 = sub_100034CF4(v7, (uint64_t)qword_1000A2E88);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v5, v8, v7);
    swift_bridgeObjectRetain();
    id v9 = sub_1000621D0();
    os_log_type_t v10 = sub_1000624D0();
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
      v0[2] = sub_10005B9C0(0x654D3C7961727241, 0xEE003E6567617373, &v20);
      sub_100062590();
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
  id v16 = (uint64_t (*)(void))v0[1];
  return v16();
}

uint64_t sub_10004339C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  type metadata accessor for VoicemailActor();
  swift_initStaticObject();
  sub_100045834();
  uint64_t v5 = sub_1000623E0();
  return _swift_task_switch(sub_100043438, v5, v4);
}

uint64_t sub_100043438()
{
  uint64_t v1 = *(void **)(v0 + 32);
  *(void *)(v0 + 40) = _Block_copy(*(const void **)(v0 + 24));
  sub_100035DD8(&qword_1000A1500);
  uint64_t v2 = sub_100062380();
  *(void *)(v0 + 48) = v2;
  id v3 = v1;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v4;
  void *v4 = v0;
  v4[1] = sub_1000464A0;
  return sub_100042E6C(v2);
}

uint64_t sub_10004350C(uint64_t a1)
{
  v2[5] = a1;
  v2[6] = v1;
  v2[7] = type metadata accessor for MessageID.Value(0);
  v2[8] = swift_task_alloc();
  type metadata accessor for VoicemailActor();
  swift_initStaticObject();
  sub_100045834();
  uint64_t v4 = sub_1000623E0();
  return _swift_task_switch(sub_1000435D4, v4, v3);
}

uint64_t sub_1000435D4()
{
  uint64_t v1 = (void **)(v0 + 40);
  sub_100045F60(*(void *)(v0 + 40) + OBJC_IVAR___MPMessageID_value, *(void *)(v0 + 64));
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  uint64_t v3 = *(void **)(v0 + 64);
  if (EnumCaseMultiPayload == 1)
  {
    sub_100045FC4((uint64_t)v3);
    if (qword_1000A0EA0 != -1) {
      swift_once();
    }
    uint64_t v4 = *v1;
    uint64_t v5 = sub_1000621F0();
    sub_100034CF4(v5, (uint64_t)qword_1000A2E88);
    id v6 = v4;
    uint64_t v7 = sub_1000621D0();
    os_log_type_t v8 = sub_1000624D0();
    BOOL v9 = os_log_type_enabled(v7, v8);
    os_log_type_t v10 = *v1;
    if (v9)
    {
      BOOL v11 = (uint8_t *)swift_slowAlloc();
      uint64_t v18 = (void *)swift_slowAlloc();
      *(_DWORD *)BOOL v11 = 138412290;
      *(void *)(v0 + 32) = v10;
      id v12 = v10;
      sub_100062590();
      *uint64_t v18 = v10;

      _os_log_impl((void *)&_mh_execute_header, v7, v8, "Incorrect id passed into VisualVoicemailManager %@, privacy: .public) but expected a VisualMessage ID!", v11, 0xCu);
      sub_100035DD8(&qword_1000A15E0);
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
    id v13 = [*(id *)(*(void *)(v0 + 48) + OBJC_IVAR____TtC9IntentsUI22VisualVoicemailManager_visualVoicemailManager) voicemailWithIdentifier:*v3];
    if (v13)
    {
      uint64_t v14 = (objc_class *)type metadata accessor for VisualMessage();
      id v15 = (char *)objc_allocWithZone(v14);
      *(void *)&v15[OBJC_IVAR___MPVisualMessage_vmMessage] = v13;
      *(void *)(v0 + 16) = v15;
      *(void *)(v0 + 24) = v14;
      [super init];
    }
  }
  swift_task_dealloc();
  id v16 = *(uint64_t (**)(id))(v0 + 8);
  return v16(v13);
}

uint64_t sub_1000439E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  type metadata accessor for VoicemailActor();
  swift_initStaticObject();
  sub_100045834();
  uint64_t v5 = sub_1000623E0();
  return _swift_task_switch(sub_100043A7C, v5, v4);
}

uint64_t sub_100043A7C()
{
  uint64_t v1 = *(void **)(v0 + 32);
  uint64_t v2 = *(void **)(v0 + 16);
  *(void *)(v0 + 40) = _Block_copy(*(const void **)(v0 + 24));
  id v3 = v2;
  id v4 = v1;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 48) = v5;
  void *v5 = v0;
  v5[1] = sub_100043B38;
  uint64_t v6 = *(void *)(v0 + 16);
  return sub_10004350C(v6);
}

uint64_t sub_100043B38(uint64_t a1)
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

uint64_t sub_100043CA0(uint64_t a1, uint64_t a2)
{
  v3[10] = a2;
  v3[11] = v2;
  v3[9] = a1;
  type metadata accessor for VoicemailActor();
  swift_initStaticObject();
  sub_100045834();
  uint64_t v5 = sub_1000623E0();
  return _swift_task_switch(sub_100043D3C, v5, v4);
}

uint64_t sub_100043D3C()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = v0[9];
  id v3 = *(void **)(v0[11] + OBJC_IVAR____TtC9IntentsUI22VisualVoicemailManager_visualVoicemailManager);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v2;
  *(void *)(v4 + 24) = v1;
  v0[6] = sub_100045E80;
  v0[7] = v4;
  v0[2] = _NSConcreteStackBlock;
  v0[3] = 1107296256;
  v0[4] = sub_100043F3C;
  v0[5] = &unk_10008E6F0;
  uint64_t v5 = _Block_copy(v0 + 2);
  swift_retain();
  swift_release();
  id v6 = [v3 voicemailsPassingTest:v5];
  _Block_release(v5);
  sub_100045950();
  unint64_t v7 = sub_100062380();

  uint64_t v8 = sub_100040C38(v7);
  swift_bridgeObjectRelease();
  uint64_t v9 = (uint64_t (*)(void *))v0[1];
  return v9(v8);
}

uint64_t sub_100043EB0(void *a1, uint64_t (*a2)(id, uint64_t))
{
  uint64_t v4 = (objc_class *)type metadata accessor for VisualMessage();
  uint64_t v5 = (char *)objc_allocWithZone(v4);
  *(void *)&v5[OBJC_IVAR___MPVisualMessage_vmMessage] = a1;
  v10.receiver = v5;
  v10.super_class = v4;
  id v6 = a1;
  id v7 = [super init];
  LOBYTE(a2) = a2(v7, v8);

  return a2 & 1;
}

uint64_t sub_100043F3C(uint64_t a1, void *a2)
{
  id v3 = *(uint64_t (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  LOBYTE(v3) = v3();
  swift_release();

  return v3 & 1;
}

uint64_t sub_100044118(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  type metadata accessor for VoicemailActor();
  swift_initStaticObject();
  sub_100045834();
  uint64_t v5 = sub_1000623E0();
  return _swift_task_switch(sub_1000441B4, v5, v4);
}

uint64_t sub_1000441B4()
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
  void *v6 = v0;
  v6[1] = sub_1000442A8;
  return sub_100043CA0((uint64_t)sub_100045E40, v4);
}

uint64_t sub_1000442A8()
{
  uint64_t v1 = *(void (***)(void, void))(*v0 + 40);
  uint64_t v2 = *(void **)(*v0 + 32);
  uint64_t v6 = *v0;
  swift_task_dealloc();
  swift_release();

  sub_100035DD8(&qword_1000A1500);
  Class isa = sub_100062370().super.isa;
  swift_bridgeObjectRelease();
  ((void (**)(void, Class))v1)[2](v1, isa);

  _Block_release(v1);
  uint64_t v4 = *(uint64_t (**)(void))(v6 + 8);
  return v4();
}

id sub_100044464()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return [super dealloc];
}

uint64_t type metadata accessor for VisualVoicemailManager()
{
  return self;
}

uint64_t sub_100044520(uint64_t a1)
{
  uint64_t v3 = sub_100035DD8(&qword_1000A0F50);
  __chkstk_darwin(v3 - 8);
  id v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100061C90();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1000A0EA0 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_1000621F0();
  sub_100034CF4(v10, (uint64_t)qword_1000A2E88);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, v6);
  id v11 = v1;
  id v12 = sub_1000621D0();
  os_log_type_t v13 = sub_1000624C0();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = swift_slowAlloc();
    uint64_t v27 = v5;
    uint64_t v15 = v14;
    uint64_t v29 = swift_slowAlloc();
    *(_DWORD *)uint64_t v15 = 136315394;
    swift_getObjectType();
    uint64_t v16 = sub_100062900();
    uint64_t v28 = sub_10005B9C0(v16, v17, &v29);
    sub_100062590();

    swift_bridgeObjectRelease();
    *(_WORD *)(v15 + 12) = 2080;
    uint64_t v28 = sub_100061C80();
    type metadata accessor for Name(0);
    uint64_t v18 = sub_100062310();
    uint64_t v28 = sub_10005B9C0(v18, v19, &v29);
    sub_100062590();
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

  uint64_t v20 = sub_100062450();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v5, 1, 1, v20);
  type metadata accessor for VoicemailActor();
  id v21 = v11;
  uint64_t inited = swift_initStaticObject();
  unint64_t v23 = sub_100045834();
  uint64_t v24 = swift_allocObject();
  *(void *)(v24 + 16) = inited;
  *(void *)(v24 + 24) = v23;
  *(void *)(v24 + 32) = v21;
  *(void *)(v24 + 40) = 0;
  *(unsigned char *)(v24 + 48) = 3;
  sub_10005FDB0((uint64_t)v5, (uint64_t)&unk_1000A1588, v24);
  return swift_release();
}

uint64_t sub_1000449DC(char a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v9 = sub_100035DD8(&qword_1000A0F50);
  __chkstk_darwin(v9 - 8);
  id v11 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1000A0EA0 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_1000621F0();
  sub_100034CF4(v12, (uint64_t)qword_1000A2E88);
  swift_bridgeObjectRetain_n();
  id v13 = v4;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  id v14 = v13;
  uint64_t v15 = sub_1000621D0();
  int v16 = sub_1000624C0();
  if (os_log_type_enabled(v15, (os_log_type_t)v16))
  {
    char v30 = v15;
    unint64_t v31 = v11;
    int v33 = v16;
    uint64_t v17 = swift_slowAlloc();
    uint64_t v32 = swift_slowAlloc();
    uint64_t v35 = v32;
    *(_DWORD *)uint64_t v17 = 136316162;
    swift_getObjectType();
    uint64_t v18 = sub_100062900();
    uint64_t v34 = sub_10005B9C0(v18, v19, &v35);
    sub_100062590();

    swift_bridgeObjectRelease();
    *(_WORD *)(v17 + 12) = 1024;
    LODWORD(v34) = a1 & 1;
    sub_100062590();
    *(_WORD *)(v17 + 18) = 2048;
    if (a3)
    {
      if (a3 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v20 = sub_1000627B0();
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
    sub_100062590();
    swift_bridgeObjectRelease();
    *(_WORD *)(v17 + 28) = 2048;
    if (a4)
    {
      id v21 = v30;
      if (a4 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v22 = sub_1000627B0();
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
    sub_100062590();
    swift_bridgeObjectRelease();
    *(_WORD *)(v17 + 38) = 2048;
    if (a2)
    {
      if (a2 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v23 = sub_1000627B0();
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
    sub_100062590();
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
  uint64_t v24 = sub_100062450();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v11, 1, 1, v24);
  type metadata accessor for VoicemailActor();
  id v25 = v14;
  uint64_t inited = swift_initStaticObject();
  unint64_t v27 = sub_100045834();
  uint64_t v28 = swift_allocObject();
  *(void *)(v28 + 16) = inited;
  *(void *)(v28 + 24) = v27;
  *(void *)(v28 + 32) = v25;
  *(void *)(v28 + 40) = 0;
  *(unsigned char *)(v28 + 48) = 3;
  sub_10005FDB0((uint64_t)v11, (uint64_t)&unk_1000A1580, v28);
  return swift_release();
}

void sub_10004515C(const char *a1)
{
  if (qword_1000A0EA0 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_1000621F0();
  sub_100034CF4(v3, (uint64_t)qword_1000A2E88);
  id v9 = v1;
  uint64_t v4 = sub_1000621D0();
  os_log_type_t v5 = sub_1000624C0();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 136315138;
    swift_getObjectType();
    uint64_t v7 = sub_100062900();
    sub_10005B9C0(v7, v8, &v10);
    sub_100062590();

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

uint64_t sub_10004538C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  type metadata accessor for VoicemailActor();
  swift_initStaticObject();
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v7;
  void *v7 = v5;
  v7[1] = sub_100036550;
  return sub_100041930(a5);
}

uint64_t sub_10004545C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  type metadata accessor for VoicemailActor();
  swift_initStaticObject();
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v7;
  void *v7 = v5;
  v7[1] = sub_100036550;
  return sub_100041FD0(a5);
}

uint64_t sub_10004552C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  type metadata accessor for VoicemailActor();
  swift_initStaticObject();
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v7;
  void *v7 = v5;
  v7[1] = sub_100036550;
  return sub_1000427CC(a5);
}

uint64_t sub_1000455FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  type metadata accessor for VoicemailActor();
  swift_initStaticObject();
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v7;
  void *v7 = v5;
  v7[1] = sub_100036550;
  return sub_100042E6C(a5);
}

uint64_t sub_1000456CC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7 = sub_100035DD8(&qword_1000A0F50);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100035DD8(&qword_1000A1500);
  uint64_t v10 = sub_100062380();
  uint64_t v11 = sub_100062450();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v9, 1, 1, v11);
  type metadata accessor for VoicemailActor();
  id v12 = a1;
  swift_bridgeObjectRetain();
  uint64_t inited = swift_initStaticObject();
  unint64_t v14 = sub_100045834();
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = inited;
  v15[3] = v14;
  v15[4] = v12;
  v15[5] = v10;
  sub_10005FDB0((uint64_t)v9, a5, (uint64_t)v15);

  swift_bridgeObjectRelease();
  return swift_release();
}

unint64_t sub_100045834()
{
  unint64_t result = qword_1000A1510;
  if (!qword_1000A1510)
  {
    type metadata accessor for VoicemailActor();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000A1510);
  }
  return result;
}

uint64_t sub_100045890(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  void *v8 = v2;
  v8[1] = sub_100036550;
  return sub_1000455FC(a1, v4, v5, v7, v6);
}

unint64_t sub_100045950()
{
  unint64_t result = qword_1000A1528;
  if (!qword_1000A1528)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, &qword_1000A1528);
  }
  return result;
}

uint64_t sub_100045994(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  void *v8 = v2;
  v8[1] = sub_100036550;
  return sub_10004552C(a1, v4, v5, v7, v6);
}

uint64_t sub_100045A58(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  void *v8 = v2;
  v8[1] = sub_100036040;
  return sub_10004545C(a1, v4, v5, v7, v6);
}

uint64_t sub_100045B1C()
{
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100045B64(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  void *v8 = v2;
  v8[1] = sub_100036550;
  return sub_10004538C(a1, v4, v5, v7, v6);
}

uint64_t sub_100045C28(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 32);
  uint64_t v7 = *(void *)(v1 + 40);
  char v8 = *(unsigned char *)(v1 + 48);
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  void *v9 = v2;
  v9[1] = sub_100036550;
  return sub_100040F64(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_100045CF4()
{
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 49, 7);
}

uint64_t sub_100045D3C()
{
  _Block_release(*(const void **)(v0 + 16));
  _Block_release(*(const void **)(v0 + 24));

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100045D84()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_100036550;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_1000A1590 + dword_1000A1590);
  return v6(v2, v3, v4);
}

uint64_t sub_100045E40(uint64_t a1)
{
  return sub_10004804C(a1, *(void *)(v1 + 16));
}

uint64_t sub_100045E48()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100045E80(void *a1)
{
  return sub_100043EB0(a1, *(uint64_t (**)(id, uint64_t))(v1 + 16));
}

uint64_t sub_100045E88(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100045E98()
{
  return swift_release();
}

uint64_t sub_100045EA4()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_100036550;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_1000A15B8 + dword_1000A15B8);
  return v6(v2, v3, v4);
}

uint64_t sub_100045F60(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MessageID.Value(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100045FC4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for MessageID.Value(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100046024()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_100036550;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_1000A15E8 + dword_1000A15E8);
  return v6(v2, v3, v4);
}

uint64_t sub_1000460E4()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_100036550;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_1000A1608 + dword_1000A1608);
  return v6(v2, v3, v4);
}

uint64_t sub_1000461A4()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_100036550;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_1000A1628 + dword_1000A1628);
  return v6(v2, v3, v4);
}

uint64_t sub_100046264()
{
  _Block_release(*(const void **)(v0 + 24));

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_1000462AC()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_100036550;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_1000A1648 + dword_1000A1648);
  return v6(v2, v3, v4);
}

uint64_t sub_100046368()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000463A8()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  void *v4 = v1;
  v4[1] = sub_100036550;
  uint64_t v5 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_1000A1668 + dword_1000A1668);
  return v5(v2, v3);
}

uint64_t sub_10004645C()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100046494()
{
  return sub_100060CB8(*(void *)(v0 + 16));
}

uint64_t sub_100046590(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_1000627B0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v3 = _swiftEmptyArrayStorage;
  if (!v2) {
    return (uint64_t)v3;
  }
  id v12 = _swiftEmptyArrayStorage;
  uint64_t result = sub_100054C40(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      uint64_t v5 = 0;
      uint64_t v3 = v12;
      do
      {
        sub_1000626A0();
        sub_100035DD8(&qword_1000A16F0);
        swift_dynamicCast();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_100054C40(0, v3[2] + 1, 1);
          uint64_t v3 = v12;
        }
        unint64_t v7 = v3[2];
        unint64_t v6 = v3[3];
        if (v7 >= v6 >> 1)
        {
          sub_100054C40(v6 > 1, v7 + 1, 1);
          uint64_t v3 = v12;
        }
        ++v5;
        v3[2] = v7 + 1;
        sub_100047584(v11, &v3[4 * v7 + 4]);
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
        sub_100035DD8(&qword_1000A16F0);
        swift_dynamicCast();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_100054C40(0, v3[2] + 1, 1);
          uint64_t v3 = v12;
        }
        unint64_t v10 = v3[2];
        unint64_t v9 = v3[3];
        if (v10 >= v9 >> 1)
        {
          sub_100054C40(v9 > 1, v10 + 1, 1);
          uint64_t v3 = v12;
        }
        v3[2] = v10 + 1;
        sub_100047584(v11, &v3[4 * v10 + 4]);
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

id sub_1000469BC()
{
  return sub_100047518(type metadata accessor for VisualTranscriptionMessage);
}

uint64_t type metadata accessor for VisualTranscriptionMessage()
{
  return self;
}

id sub_100046D08(char *a1, uint64_t a2, SEL *a3)
{
  uint64_t v4 = *(void **)&a1[OBJC_IVAR___MPVisualMessage_vmMessage];
  uint64_t v5 = a1;
  id v6 = [v4 *a3];
  if (v6)
  {
    unint64_t v7 = v6;
    sub_100062300();

    NSString v8 = sub_1000622D0();
    swift_bridgeObjectRelease();
  }
  else
  {

    NSString v8 = 0;
  }

  return v8;
}

id sub_1000472B0(char *a1, uint64_t a2, void *a3, void *a4, uint64_t (*a5)(void))
{
  *(void *)&a1[*a4] = a3;
  v8.receiver = a1;
  v8.super_class = (Class)a5();
  id v6 = a3;
  return [super init];
}

id sub_100047500()
{
  return sub_100047518(type metadata accessor for VisualMessage);
}

id sub_100047518(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return [super dealloc];
}

uint64_t type metadata accessor for VisualMessage()
{
  return self;
}

_OWORD *sub_100047584(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void *sub_100047594(unint64_t a1)
{
  unint64_t v1 = a1;
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
    uint64_t result = (void *)sub_1000626F0();
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
        id v5 = (id)sub_1000626A0();
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
      uint64_t v8 = v7 + OBJC_IVAR____TtC9IntentsUI9FTMessage____lazy_storage___dataURL;
      uint64_t v9 = sub_100035DD8(&qword_1000A16F8);
      unint64_t v10 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56);
      v10(v8, 1, 1, v9);
      v10(v7 + OBJC_IVAR____TtC9IntentsUI9FTMessage____lazy_storage___thumbnailURL, 1, 1, v9);
      v10(v7 + OBJC_IVAR____TtC9IntentsUI9FTMessage____lazy_storage___transcriptURL, 1, 1, v9);
      uint64_t v11 = v7 + OBJC_IVAR____TtC9IntentsUI9FTMessage____lazy_storage___transcriptData;
      uint64_t v12 = sub_100035DD8(&qword_1000A1AB0);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 1, 1, v12);
      *(void *)(v7 + OBJC_IVAR____TtC9IntentsUI9FTMessage____lazy_storage___transcript) = 1;
      *(unsigned char *)(v7 + OBJC_IVAR____TtC9IntentsUI9FTMessage_didLoadTranscript) = 0;
      *(unsigned char *)(v7 + OBJC_IVAR____TtC9IntentsUI9FTMessage_isDirty) = 0;
      *(void *)(v7 + 16) = v6;
      sub_1000626D0();
      sub_100062700();
      sub_100062710();
      sub_1000626E0();
      unint64_t v1 = v13;
      if (v2 == v4) {
        return _swiftEmptyArrayStorage;
      }
    }
    __break(1u);
LABEL_14:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_1000627B0();
    swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_100047818(unint64_t a1)
{
  unint64_t v2 = v1;
  uint64_t v16 = sub_100061D90();
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
    uint64_t v17 = _swiftEmptyArrayStorage;
    uint64_t result = sub_100054C60(0, v7 & ~(v7 >> 63), 0);
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
        sub_1000626A0();
      }
      else {
        swift_retain();
      }
      swift_beginAccess();
      swift_retain();
      sub_100061F60();
      swift_endAccess();
      swift_release_n();
      uint64_t v17 = v8;
      unint64_t v13 = v8[2];
      unint64_t v12 = v8[3];
      unint64_t v2 = v13 + 1;
      if (v13 >= v12 >> 1)
      {
        sub_100054C60(v12 > 1, v13 + 1, 1);
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
    uint64_t v7 = sub_1000627B0();
    swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

unint64_t sub_100047A60(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    unint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100035DD8(&qword_1000A1400);
  unint64_t v2 = (void *)sub_1000627E0();
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
    unint64_t result = sub_100054784((uint64_t)v6);
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

unint64_t sub_100047B6C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    unint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100035DD8(&qword_1000A1B00);
  unint64_t v2 = (void *)sub_1000627E0();
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
    unint64_t result = sub_1000547C8(v5, v6);
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

void *sub_100047C88(unint64_t a1)
{
  uint64_t v1 = a1;
  if (a1 >> 62) {
    goto LABEL_18;
  }
  sub_1000626F0();
  uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (v2)
  {
    if ((v1 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; ; ++i)
      {
        sub_1000626A0();
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
        sub_1000626D0();
        sub_100062700();
        sub_100062710();
        sub_1000626E0();
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
        sub_1000626D0();
        sub_100062700();
        sub_100062710();
        sub_1000626E0();
        if (v6 == v2) {
          return _swiftEmptyArrayStorage;
        }
      }
    }
    __break(1u);
LABEL_18:
    swift_bridgeObjectRetain();
    sub_1000627B0();
    swift_bridgeObjectRelease();
    sub_1000626F0();
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_1000627B0();
    swift_bridgeObjectRelease();
  }
  return _swiftEmptyArrayStorage;
}

void *sub_100047E6C(unint64_t a1)
{
  unint64_t v1 = a1;
  if (a1 >> 62) {
    goto LABEL_24;
  }
  sub_1000626F0();
  uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (v2)
  {
    if ((v1 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; ; ++i)
      {
        uint64_t v4 = (void *)sub_1000626A0();
        uint64_t v5 = i + 1;
        if (__OFADD__(i, 1)) {
          break;
        }
        uint64_t v6 = v4;
        if (object_getClass(v4) != (Class)_TtC9IntentsUI9FTMessage || v6 == 0)
        {
          swift_unknownObjectRelease();
          goto LABEL_21;
        }
        sub_1000626D0();
        sub_100062700();
        sub_100062710();
        sub_1000626E0();
        if (v5 == v2) {
          return _swiftEmptyArrayStorage;
        }
      }
      __break(1u);
    }
    else
    {
      uint64_t v8 = 0;
      uint64_t v9 = (char *)(v1 + 32);
      while (1)
      {
        uint64_t v10 = v8 + 1;
        if (__OFADD__(v8, 1)) {
          break;
        }
        unint64_t v1 = *(void *)&v9[8 * v8];
        if (object_getClass((id)v1) != (Class)_TtC9IntentsUI9FTMessage || v1 == 0)
        {
LABEL_21:
          swift_release();
          return 0;
        }
        swift_unknownObjectRetain();
        sub_1000626D0();
        sub_100062700();
        sub_100062710();
        sub_1000626E0();
        ++v8;
        if (v10 == v2) {
          return _swiftEmptyArrayStorage;
        }
      }
    }
    __break(1u);
LABEL_24:
    swift_bridgeObjectRetain();
    sub_1000627B0();
    swift_bridgeObjectRelease();
    sub_1000626F0();
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_1000627B0();
    swift_bridgeObjectRelease();
  }
  return _swiftEmptyArrayStorage;
}

uint64_t sub_10004804C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, a1);
}

void sub_100048078(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_1000621F0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  BOOL v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v4, v8);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v12 = sub_1000621D0();
  os_log_type_t v13 = sub_1000624F0();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = swift_slowAlloc();
    uint64_t v23 = swift_slowAlloc();
    uint64_t v25 = v23;
    uint64_t aBlock = a1;
    *(_DWORD *)uint64_t v14 = 136315394;
    uint64_t v27 = a2;
    swift_bridgeObjectRetain();
    uint64_t v15 = sub_100062320();
    uint64_t v24 = a1;
    uint64_t aBlock = sub_10005B9C0(v15, v16, &v25);
    sub_100062590();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v14 + 12) = 2080;
    uint64_t aBlock = a3;
    swift_bridgeObjectRetain();
    sub_100035DD8(&qword_1000A1AE8);
    uint64_t v17 = sub_100062320();
    uint64_t aBlock = sub_10005B9C0(v17, v18, &v25);
    sub_100062590();
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
  NSString v19 = sub_1000622D0();
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = a3;
  char v30 = sub_10005649C;
  uint64_t v31 = v20;
  uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
  uint64_t v27 = 1107296256;
  uint64_t v28 = sub_1000483F0;
  uint64_t v29 = &unk_10008EF58;
  id v21 = _Block_copy(&aBlock);
  swift_bridgeObjectRetain();
  swift_release();
  AnalyticsSendEventLazy();
  _Block_release(v21);
}

Class sub_1000483F0(uint64_t a1)
{
  unint64_t v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  uint64_t v3 = v1(v2);
  swift_release();
  if (v3)
  {
    sub_1000564BC(0, &qword_1000A1AF0);
    v4.super.Class isa = sub_100062290().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.Class isa = 0;
  }

  return v4.super.isa;
}

uint64_t sub_10004848C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v3 = swift_allocObject();
  sub_100035DD8(&qword_1000A1B78);
  uint64_t v4 = sub_100062170();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 72);
  unint64_t v7 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_1000854B0;
  uint64_t v9 = (uint64_t *)(v8 + v7);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = *(void *)(v1 + OBJC_IVAR____TtC9IntentsUI24FaceTimeVoicemailManager_providers);
  uint64_t *v9 = v10;
  BOOL v11 = *(void (**)(uint64_t *, void, uint64_t))(v5 + 104);
  v11(v9, enum case for MessageStoreQuery.providers(_:), v4);
  uint64_t v12 = (uint64_t *)((char *)v9 + v6);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = *(void *)(v1 + OBJC_IVAR____TtC9IntentsUI24FaceTimeVoicemailManager_messageTypes);
  uint64_t *v12 = v13;
  v11(v12, enum case for MessageStoreQuery.types(_:), v4);
  *(void *)(v3 + 16) = v8;
  *a1 = v3;
  v11(a1, enum case for MessageStoreQuery.and(_:), v4);
  swift_bridgeObjectRetain();

  return swift_bridgeObjectRetain();
}

uint64_t sub_100048650()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC9IntentsUI24FaceTimeVoicemailManager_logger;
  uint64_t v2 = sub_1000621F0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  sub_10005683C(v0 + OBJC_IVAR____TtC9IntentsUI24FaceTimeVoicemailManager_analyticsReporter, type metadata accessor for VoiceMailAnalyticsLogger);
  sub_10005682C(*(void *)(v0 + OBJC_IVAR____TtC9IntentsUI24FaceTimeVoicemailManager_onVoicemailsChanged));
  sub_1000361FC(v0 + OBJC_IVAR____TtC9IntentsUI24FaceTimeVoicemailManager_messageStoreController);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  return swift_release();
}

uint64_t sub_100048744()
{
  uint64_t v1 = v0;
  uint64_t v2 = v0 + OBJC_IVAR____TtC9IntentsUI24FaceTimeVoicemailManager_messageStoreController;
  sub_1000362AC((void *)(v0 + OBJC_IVAR____TtC9IntentsUI24FaceTimeVoicemailManager_messageStoreController), *(void *)(v0 + OBJC_IVAR____TtC9IntentsUI24FaceTimeVoicemailManager_messageStoreController + 24));
  sub_100062100();
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v3 = v0 + OBJC_IVAR____TtC9IntentsUI24FaceTimeVoicemailManager_logger;
  uint64_t v4 = sub_1000621F0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_10005683C(v1 + OBJC_IVAR____TtC9IntentsUI24FaceTimeVoicemailManager_analyticsReporter, type metadata accessor for VoiceMailAnalyticsLogger);
  sub_10005682C(*(void *)(v1 + OBJC_IVAR____TtC9IntentsUI24FaceTimeVoicemailManager_onVoicemailsChanged));
  sub_1000361FC(v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_10004886C()
{
  sub_100048744();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v1, v2);
}

uint64_t sub_1000488C4()
{
  return type metadata accessor for FaceTimeVoicemailManager(0);
}

uint64_t type metadata accessor for FaceTimeVoicemailManager(uint64_t a1)
{
  return sub_100053D24(a1, (uint64_t *)&unk_1000A1758);
}

uint64_t sub_1000488EC(uint64_t a1, char a2)
{
  swift_bridgeObjectRetain_n();
  uint64_t v4 = sub_1000621D0();
  os_log_type_t v5 = sub_1000624F0();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 136315138;
    uint64_t v7 = swift_bridgeObjectRetain();
    unint64_t v8 = sub_100060B40(v7, a2);
    unint64_t v10 = v9;
    swift_bridgeObjectRelease();
    sub_10005B9C0(v8, v10, &v14);
    sub_100062590();
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
  sub_100061E70();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_100048B1C(uint64_t a1, uint64_t a2, char a3)
{
  *(unsigned char *)(v3 + 49) = a3;
  *(void *)(v3 + 56) = a1;
  *(void *)(v3 + 64) = a2;
  type metadata accessor for VoicemailActor();
  swift_initStaticObject();
  sub_100056B90((unint64_t *)&qword_1000A1510, (void (*)(uint64_t))type metadata accessor for VoicemailActor);
  uint64_t v5 = sub_1000623E0();
  return _swift_task_switch(sub_100048BE8, v5, v4);
}

uint64_t sub_100048BE8()
{
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    uint64_t v2 = *(void (**)(void))(Strong + OBJC_IVAR____TtC9IntentsUI24FaceTimeVoicemailManager_onVoicemailsChanged);
    if (v2) {
      v2();
    }
    char v3 = *(unsigned char *)(v0 + 49);
    *(void *)(v0 + 40) = *(void *)(v0 + 64);
    *(unsigned char *)(v0 + 48) = v3;
    sub_100062250();
    swift_release();
  }
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_100048CC4()
{
  v1[101] = v0;
  type metadata accessor for VoicemailActor();
  swift_initStaticObject();
  sub_100056B90((unint64_t *)&qword_1000A1510, (void (*)(uint64_t))type metadata accessor for VoicemailActor);
  uint64_t v3 = sub_1000623E0();
  v1[102] = v3;
  v1[103] = v2;
  return _swift_task_switch(sub_100048D90, v3, v2);
}

uint64_t sub_100048D90()
{
  *(void *)(v0 + 832) = OBJC_IVAR____TtC9IntentsUI24FaceTimeVoicemailManager_logger;
  uint64_t v1 = sub_1000621D0();
  os_log_type_t v2 = sub_1000624F0();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Fetching Messages from FTMS", v3, 2u);
    swift_slowDealloc();
  }

  swift_retain_n();
  sub_10003624C(&qword_1000A1B50);
  swift_asyncLet_begin();
  return _swift_asyncLet_get(v0 + 16, v0 + 696, sub_100048ED8, v0 + 704);
}

uint64_t sub_100048ED8()
{
  uint64_t v1 = v0[87];
  v0[105] = v1;
  swift_retain();
  os_log_type_t v2 = (void *)swift_task_alloc();
  v0[106] = v2;
  uint64_t v3 = sub_100035DD8(&qword_1000A1B58);
  uint64_t v4 = sub_100035DD8(&qword_1000A1B60);
  *os_log_type_t v2 = v0;
  v2[1] = sub_100048FC0;
  return Task.value.getter(v0 + 99, v1, v3, v4, &protocol self-conformance witness table for Error);
}

uint64_t sub_100048FC0()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 856) = v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v3 = *(void *)(v2 + 824);
  uint64_t v4 = *(void *)(v2 + 816);
  if (v0) {
    uint64_t v5 = sub_10004934C;
  }
  else {
    uint64_t v5 = sub_100049114;
  }
  return _swift_task_switch(v5, v4, v3);
}

uint64_t sub_100049114()
{
  unint64_t v1 = v0[99];
  swift_bridgeObjectRetain_n();
  uint64_t v2 = sub_1000621D0();
  os_log_type_t v3 = sub_1000624F0();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 134349056;
    if (v1 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v5 = sub_1000627B0();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v5 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    v0[100] = v5;
    sub_100062590();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Fetched %{public}ld message(s) from FTMS", v4, 0xCu);
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  v0[108] = sub_100047594(v1);
  swift_bridgeObjectRelease();
  return _swift_asyncLet_finish(v0 + 2, v0 + 87, sub_1000492C4, v0 + 94);
}

uint64_t sub_1000492C4()
{
  return _swift_task_switch(sub_1000492E0, *(void *)(v0 + 816), *(void *)(v0 + 824));
}

uint64_t sub_1000492E0()
{
  swift_release_n();
  unint64_t v1 = *(uint64_t (**)(uint64_t))(v0 + 8);
  uint64_t v2 = *(void *)(v0 + 864);
  return v1(v2);
}

uint64_t sub_10004934C()
{
  return _swift_asyncLet_finish(v0 + 16, v0 + 696, sub_10004936C, v0 + 656);
}

uint64_t sub_10004936C()
{
  return _swift_task_switch(sub_100049388, *(void *)(v0 + 816), *(void *)(v0 + 824));
}

uint64_t sub_100049388()
{
  swift_release_n();
  unint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1000493F0(uint64_t a1, uint64_t a2)
{
  v2[2] = a1;
  v2[3] = a2;
  sub_100035DD8(&qword_1000A0F50);
  v2[4] = swift_task_alloc();
  return _swift_task_switch(sub_100049484, 0, 0);
}

uint64_t sub_100049484()
{
  uint64_t v1 = v0[3];
  uint64_t v2 = v0[4];
  uint64_t v3 = (uint64_t *)v0[2];
  sub_100062420();
  uint64_t v4 = sub_100062450();
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v2, 0, 1, v4);
  uint64_t v5 = (void *)swift_allocObject();
  v5[2] = 0;
  v5[3] = 0;
  v5[4] = v1;
  swift_retain();
  uint64_t *v3 = sub_100049DA4(v2, (uint64_t)&unk_1000A1B70, (uint64_t)v5);
  swift_task_dealloc();
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_10004958C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void v4[5] = a1;
  v4[6] = a4;
  v4[7] = sub_100062080();
  v4[8] = swift_task_alloc();
  uint64_t v5 = sub_100062140();
  v4[9] = v5;
  v4[10] = *(void *)(v5 - 8);
  v4[11] = swift_task_alloc();
  sub_100062170();
  v4[12] = swift_task_alloc();
  uint64_t v6 = sub_100062160();
  v4[13] = v6;
  v4[14] = *(void *)(v6 - 8);
  v4[15] = swift_task_alloc();
  return _swift_task_switch(sub_100049704, 0, 0);
}

uint64_t sub_100049704()
{
  uint64_t v1 = *(void *)(v0 + 88);
  uint64_t v2 = *(void *)(v0 + 72);
  uint64_t v3 = *(void *)(v0 + 80);
  uint64_t v4 = *(void *)(v0 + 48);
  sub_10004848C(*(uint64_t **)(v0 + 96));
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))(v1, enum case for MessageStoreFetchRequest.QuerySearchType.unsorted(_:), v2);
  *(void *)(v0 + 16) = _swiftEmptyArrayStorage;
  sub_100056B90(&qword_1000A1B20, (void (*)(uint64_t))&type metadata accessor for MessageFetchOptions);
  sub_100035DD8(&qword_1000A1B28);
  sub_10005689C();
  sub_1000625C0();
  sub_100062150();
  sub_1000362AC((void *)(v4 + OBJC_IVAR____TtC9IntentsUI24FaceTimeVoicemailManager_messageStoreController), *(void *)(v4 + OBJC_IVAR____TtC9IntentsUI24FaceTimeVoicemailManager_messageStoreController + 24));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v0 + 128) = v5;
  void *v5 = v0;
  v5[1] = sub_1000498B8;
  uint64_t v6 = *(void *)(v0 + 120);
  return MessageStoreController.getMessages(fetchRequest:)(v6);
}

uint64_t sub_1000498B8(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 136) = a1;
  *(void *)(v3 + 144) = v1;
  swift_task_dealloc();
  if (v1) {
    uint64_t v4 = sub_100049B9C;
  }
  else {
    uint64_t v4 = sub_1000499CC;
  }
  return _swift_task_switch(v4, 0, 0);
}

uint64_t sub_1000499CC()
{
  swift_bridgeObjectRetain_n();
  uint64_t v1 = sub_1000621D0();
  os_log_type_t v2 = sub_1000624F0();
  BOOL v3 = os_log_type_enabled(v1, v2);
  unint64_t v4 = v0[17];
  if (v3)
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 134349056;
    if (v4 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v6 = sub_1000627B0();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v6 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    v0[4] = v6;
    sub_100062590();
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

uint64_t sub_100049B9C()
{
  (*(void (**)(void, void))(v0[14] + 8))(v0[15], v0[13]);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v1 = sub_1000621D0();
  os_log_type_t v2 = sub_1000624D0();
  if (os_log_type_enabled(v1, v2))
  {
    BOOL v3 = (uint8_t *)swift_slowAlloc();
    unint64_t v4 = (void *)swift_slowAlloc();
    *(_DWORD *)BOOL v3 = 138412290;
    swift_errorRetain();
    uint64_t v5 = _swift_stdlib_bridgeErrorToNSError();
    v0[3] = v5;
    sub_100062590();
    void *v4 = v5;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Error loading FTMessages %@", v3, 0xCu);
    sub_100035DD8(&qword_1000A15E0);
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

uint64_t sub_100049DA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_100062450();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_100062440();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_1000556F8(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1000623E0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  sub_100035DD8(&qword_1000A1B58);
  return swift_task_create();
}

uint64_t sub_100049F24(uint64_t a1)
{
  v2[6] = a1;
  v2[7] = v1;
  uint64_t v4 = sub_100062140();
  v2[8] = v4;
  v2[9] = *(void *)(v4 - 8);
  v2[10] = swift_task_alloc();
  uint64_t v5 = sub_100062080();
  v2[11] = v5;
  v2[12] = *(void *)(v5 - 8);
  v2[13] = swift_task_alloc();
  uint64_t v6 = sub_100062170();
  v2[14] = v6;
  v2[15] = *(void *)(v6 - 8);
  uint8_t v2[16] = swift_task_alloc();
  uint64_t v7 = sub_100062160();
  v2[17] = v7;
  v2[18] = *(void *)(v7 - 8);
  v2[19] = swift_task_alloc();
  v2[20] = type metadata accessor for MessageID.Value(0);
  v2[21] = swift_task_alloc();
  uint64_t v8 = sub_100061D90();
  v2[22] = v8;
  v2[23] = *(void *)(v8 - 8);
  v2[24] = swift_task_alloc();
  v2[25] = swift_task_alloc();
  v2[26] = type metadata accessor for VoicemailActor();
  v2[27] = swift_initStaticObject();
  unint64_t v9 = (void *)swift_task_alloc();
  v2[28] = v9;
  void *v9 = v2;
  v9[1] = sub_10004A1EC;
  return sub_10003961C(a1);
}

uint64_t sub_10004A1EC(uint64_t a1)
{
  os_log_type_t v2 = (void *)*v1;
  v2[29] = a1;
  swift_task_dealloc();
  sub_100056B90((unint64_t *)&qword_1000A1510, (void (*)(uint64_t))type metadata accessor for VoicemailActor);
  uint64_t v4 = sub_1000623E0();
  v2[30] = v4;
  v2[31] = v3;
  return _swift_task_switch(sub_10004A368, v4, v3);
}

uint64_t sub_10004A368()
{
  uint64_t v1 = v0[29];
  if (!v1)
  {
    sub_100045F60(v0[6] + OBJC_IVAR___MPMessageID_value, v0[21]);
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
      sub_100035DD8(&qword_1000A1960);
      unint64_t v8 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
      uint64_t v9 = swift_allocObject();
      *(_OWORD *)(v9 + 16) = xmmword_1000854C0;
      unint64_t v10 = *(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 16);
      v0[32] = v10;
      v0[33] = (v3 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
      v10(v9 + v8, v2, v4);
      *(void *)(v7 + 16) = v9;
      *uint64_t v24 = v7;
      (*(void (**)(uint64_t *, void, uint64_t))(v5 + 104))(v24, enum case for MessageStoreQuery.recordUUID(_:), v25);
      sub_100035DD8(&qword_1000A1B18);
      uint64_t v11 = swift_allocObject();
      *(_OWORD *)(v11 + 16) = xmmword_1000854C0;
      sub_100062070();
      v0[3] = v11;
      sub_100056B90(&qword_1000A1B20, (void (*)(uint64_t))&type metadata accessor for MessageFetchOptions);
      sub_100035DD8(&qword_1000A1B28);
      sub_10005689C();
      sub_1000625C0();
      (*(void (**)(uint64_t, void, uint64_t))(v6 + 104))(v26, enum case for MessageStoreFetchRequest.QuerySearchType.unsorted(_:), v27);
      sub_100062150();
      sub_1000362AC((void *)(v29 + OBJC_IVAR____TtC9IntentsUI24FaceTimeVoicemailManager_messageStoreController), *(void *)(v29 + OBJC_IVAR____TtC9IntentsUI24FaceTimeVoicemailManager_messageStoreController + 24));
      uint64_t v12 = (void *)swift_task_alloc();
      v0[34] = v12;
      void *v12 = v0;
      v12[1] = sub_10004A848;
      uint64_t v13 = v0[19];
      return MessageStoreController.getMessages(fetchRequest:)(v13);
    }
    uint64_t v14 = (void *)v0[6];
    sub_10005683C(v0[21], type metadata accessor for MessageID.Value);
    id v15 = v14;
    unint64_t v16 = sub_1000621D0();
    os_log_type_t v17 = sub_1000624F0();
    BOOL v18 = os_log_type_enabled(v16, v17);
    NSString v19 = v0[6];
    if (v18)
    {
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      uint64_t v28 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v20 = 138543362;
      v0[2] = v19;
      id v21 = v19;
      sub_100062590();
      *uint64_t v28 = v19;

      _os_log_impl((void *)&_mh_execute_header, v16, v17, "FaceTimeVoicemailManager received the incorrect type %{public}@ when it expected a uuid", v20, 0xCu);
      sub_100035DD8(&qword_1000A15E0);
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

uint64_t sub_10004A848(uint64_t a1)
{
  uint64_t v3 = *v2;
  uint64_t v4 = *v2;
  *(void *)(v4 + 280) = a1;
  *(void *)(v4 + 288) = v1;
  swift_task_dealloc();
  uint64_t v5 = *(void *)(v3 + 248);
  uint64_t v6 = *(void *)(v3 + 240);
  if (v1) {
    uint64_t v7 = sub_10004ACB0;
  }
  else {
    uint64_t v7 = sub_10004A98C;
  }
  return _swift_task_switch(v7, v6, v5);
}

uint64_t sub_10004A98C()
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
        id v3 = (id)sub_1000626A0();
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
      uint64_t v5 = sub_10005A1F4((uint64_t)v3);
      uint64_t v6 = *(void *)(v4 + OBJC_IVAR____TtC9IntentsUI24FaceTimeVoicemailManager_messageTypes);
      unint64_t v1 = (unint64_t)v3;
      swift_bridgeObjectRetain();
      sub_100061FB0();
      uint64_t v7 = *(void *)(v6 + 16);
      if (!v7) {
        goto LABEL_15;
      }
      swift_bridgeObjectRetain();
      int v8 = (unsigned __int16)sub_100062090();
      if (v8 == (unsigned __int16)sub_100062090())
      {
LABEL_8:
        uint64_t v9 = v0[25];
        uint64_t v10 = v0[22];
        uint64_t v11 = v0[23];
        swift_bridgeObjectRelease_n();
        sub_100035DD8((uint64_t *)&unk_1000A1EB0);
        uint64_t v12 = swift_allocObject();
        *(_OWORD *)(v12 + 16) = xmmword_100085330;
        *(void *)(v12 + 32) = v5;
        unint64_t v24 = v12;
        sub_1000623A0();
        swift_retain();
        sub_10004B038(v24);

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
        int v15 = (unsigned __int16)sub_100062090();
        if (v15 == (unsigned __int16)sub_100062090()) {
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
      uint64_t v19 = sub_1000627B0();
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

uint64_t sub_10004ACB0()
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
  uint64_t v5 = sub_1000621D0();
  os_log_type_t v6 = sub_1000624F0();
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
    sub_100056B90(&qword_1000A1B38, (void (*)(uint64_t))&type metadata accessor for UUID);
    uint64_t v23 = v8;
    uint64_t v11 = sub_100062840();
    v0[4] = sub_10005B9C0(v11, v12, &v25);
    sub_100062590();
    swift_bridgeObjectRelease();
    uint64_t v13 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
    v13(v7, v8);
    *(_WORD *)(v10 + 12) = 2112;
    swift_errorRetain();
    uint64_t v14 = _swift_stdlib_bridgeErrorToNSError();
    v0[5] = v14;
    sub_100062590();
    *uint64_t v22 = v14;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "FaceTimeVoiceMailManager failed to retrieve message for uuid %{public}s because the message store threw an error %@", (uint8_t *)v10, 0x16u);
    sub_100035DD8(&qword_1000A15E0);
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

uint64_t sub_10004B038(unint64_t a1)
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
      uint64_t v8 = sub_1000545DC(0, v8[2] + 1, 1, v8);
      void *v7 = v8;
    }
    unint64_t v11 = v8[2];
    unint64_t v10 = v8[3];
    if (v11 >= v10 >> 1)
    {
      uint64_t v8 = sub_1000545DC((void *)(v10 > 1), v11 + 1, 1, v8);
      void *v7 = v8;
    }
    v8[2] = v11 + 1;
    unint64_t v12 = &v8[2 * v11];
    v12[4] = sub_100056500;
    v12[5] = v6;
    swift_endAccess();
    goto LABEL_11;
  }
  if (v4 != 1)
  {
LABEL_11:
    sub_10003F6CC();
    return swift_willThrowTypedImpl();
  }
  swift_retain();
  sub_100036DE0(a1, 1);
  swift_release();

  return sub_1000488EC(a1, 1);
}

uint64_t sub_10004B34C()
{
  uint64_t result = sub_1000621F0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_10004B410(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  type metadata accessor for VoicemailActor();
  swift_initStaticObject();
  sub_100056B90((unint64_t *)&qword_1000A1510, (void (*)(uint64_t))type metadata accessor for VoicemailActor);
  uint64_t v5 = sub_1000623E0();
  return _swift_task_switch(sub_10004B4DC, v5, v4);
}

uint64_t sub_10004B4DC()
{
  unint64_t v1 = *(void **)(v0 + 16);
  *(void *)(v0 + 40) = _Block_copy(*(const void **)(v0 + 24));
  id v2 = v1;
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 48) = v3;
  void *v3 = v0;
  v3[1] = sub_100039E14;
  uint64_t v4 = *(void *)(v0 + 16);
  return sub_100049F24(v4);
}

uint64_t sub_10004B59C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[25] = a2;
  v3[26] = a3;
  v3[24] = a1;
  type metadata accessor for VoicemailActor();
  swift_initStaticObject();
  sub_100056B90((unint64_t *)&qword_1000A1510, (void (*)(uint64_t))type metadata accessor for VoicemailActor);
  uint64_t v5 = sub_1000623E0();
  return _swift_task_switch(sub_10004B668, v5, v4);
}

uint64_t sub_10004B668()
{
  unint64_t v67 = v0;
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  swift_bridgeObjectRetain_n();
  uint64_t v3 = sub_1000621D0();
  if (!Strong)
  {
    LOBYTE(inited) = sub_1000624D0();
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
      sub_100062590();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v3, (os_log_type_t)inited, "ignoring %ld added messages, no more self", v10, 0xCu);
      swift_slowDealloc();
LABEL_45:

      goto LABEL_73;
    }
LABEL_79:
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_1000627B0();
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  os_log_type_t v4 = sub_1000624F0();
  unint64_t v62 = v0;
  uint64_t v60 = (uint64_t *)(v0 + 176);
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t inited = swift_slowAlloc();
    uint64_t v66 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t inited = 136315138;
    sub_100062060();
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_100062390();
    unint64_t v7 = v6;
    swift_bridgeObjectRelease();
    *(void *)(v0 + 184) = sub_10005B9C0(v5, v7, (uint64_t *)&v66);
    sub_100062590();
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
  uint64_t v13 = *(void *)(Strong + OBJC_IVAR____TtC9IntentsUI24FaceTimeVoicemailManager_messageTypes);
  uint64_t v66 = _swiftEmptyArrayStorage;
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
        id v17 = (id)sub_1000626A0();
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
      uint64_t v20 = sub_100061FB0();
      uint64_t inited = *(void *)(v13 + 16);
      if (inited)
      {
        uint64_t v12 = v20;
        swift_bridgeObjectRetain();
        int v21 = (unsigned __int16)sub_100062090();
        if (v21 == (unsigned __int16)sub_100062090())
        {
LABEL_22:
          swift_bridgeObjectRelease();
          uint64_t v12 = (uint64_t)&v66;
          sub_1000626D0();
          sub_100062700();
          sub_100062710();
          sub_1000626E0();
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
            int v24 = (unsigned __int16)sub_100062090();
            if (v24 == (unsigned __int16)sub_100062090()) {
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
          uint64_t v14 = sub_1000627B0();
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
    uint64_t v26 = sub_1000627B0();
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
      id v28 = (id)sub_1000626A0();
    }
    else {
      id v28 = *(id *)(v65 + 8 * i + 32);
    }
    uint64_t v29 = v28;
    uint64_t v30 = sub_100062030();
    if ((v31 & 1) == 0)
    {
      uint64_t v32 = v30;
      sub_100035DD8(&qword_1000A1AD8);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_1000854D0;
      *(void *)(inited + 32) = 0x6D766C5F7369;
      *(void *)(inited + 40) = 0xE600000000000000;
      sub_1000564BC(0, &qword_1000A1AE0);
      sub_100061FB0();
      int v33 = (unsigned __int16)sub_100062090();
      Swift::Bool v34 = v33 == (unsigned __int16)sub_100062090();
      *(NSNumber *)(inited + 48) = sub_100062550(v34);
      *(void *)(inited + 56) = 0x6D76765F7369;
      *(void *)(inited + 64) = 0xE600000000000000;
      sub_100061FB0();
      int v35 = (unsigned __int16)sub_100062090();
      Swift::Bool v36 = v35 == (unsigned __int16)sub_100062090();
      *(NSNumber *)(inited + 72) = sub_100062550(v36);
      *(void *)(inited + 80) = 0x6E6F697461727564;
      *(void *)(inited + 88) = 0xE800000000000000;
      sub_100062020();
      *(void *)(inited + 96) = [objc_allocWithZone((Class)NSNumber) initWithDouble:round(v37)];
      *(void *)(inited + 104) = 0xD000000000000011;
      *(void *)(inited + 112) = 0x8000000100071550;
      *(void *)(inited + 120) = [objc_allocWithZone((Class)NSNumber) initWithUnsignedLongLong:v32];
      unint64_t v38 = sub_100047B6C(inited);
      sub_10004C3A4(v38);
      uint64_t v40 = v39;
      swift_bridgeObjectRelease();
      sub_100048078(0xD00000000000002DLL, 0x8000000100071570, v40);
      swift_bridgeObjectRelease();
    }
  }
LABEL_54:
  swift_release();
  swift_bridgeObjectRetain_n();
  uint64_t v41 = sub_1000621D0();
  os_log_type_t v42 = sub_1000624F0();
  unint64_t v10 = (uint8_t *)v42;
  if (os_log_type_enabled(v41, v42))
  {
    uint64_t v43 = (uint8_t *)swift_slowAlloc();
    uint64_t v66 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v43 = 136315138;
    LOBYTE(inited) = (_BYTE)v43 + 4;
    sub_100062060();
    swift_bridgeObjectRetain();
    uint64_t v44 = sub_100062390();
    unint64_t v46 = v45;
    swift_release();
    *uint64_t v60 = sub_10005B9C0(v44, v46, (uint64_t *)&v66);
    sub_100062590();
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
    unint64_t v0 = sub_1000627B0();
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
  uint64_t v66 = _swiftEmptyArrayStorage;
  uint64_t v3 = &v66;
  sub_1000626F0();
  if ((v0 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_79;
  }
  uint64_t v47 = 0;
  do
  {
    if ((v65 & 0xC000000000000001) != 0) {
      id v48 = (id)sub_1000626A0();
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
    uint64_t v51 = v50 + OBJC_IVAR____TtC9IntentsUI9FTMessage____lazy_storage___dataURL;
    uint64_t v52 = sub_100035DD8(&qword_1000A16F8);
    uint64_t v53 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v52 - 8) + 56);
    v53(v51, 1, 1, v52);
    v53(v50 + OBJC_IVAR____TtC9IntentsUI9FTMessage____lazy_storage___thumbnailURL, 1, 1, v52);
    v53(v50 + OBJC_IVAR____TtC9IntentsUI9FTMessage____lazy_storage___transcriptURL, 1, 1, v52);
    uint64_t v54 = v50 + OBJC_IVAR____TtC9IntentsUI9FTMessage____lazy_storage___transcriptData;
    uint64_t v55 = sub_100035DD8(&qword_1000A1AB0);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v55 - 8) + 56))(v54, 1, 1, v55);
    *(void *)(v50 + OBJC_IVAR____TtC9IntentsUI9FTMessage____lazy_storage___transcript) = 1;
    *(unsigned char *)(v50 + OBJC_IVAR____TtC9IntentsUI9FTMessage_didLoadTranscript) = 0;
    *(unsigned char *)(v50 + OBJC_IVAR____TtC9IntentsUI9FTMessage_isDirty) = 0;
    *(void *)(v50 + 16) = v49;
    sub_1000626D0();
    sub_100062700();
    sub_100062710();
    sub_1000626E0();
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
    sub_100035DD8(&qword_1000A1500);
    unint64_t v57 = sub_1000627A0();
    swift_bridgeObjectRelease();
    goto LABEL_72;
  }
  swift_bridgeObjectRetain();
  sub_100062860();
  unint64_t v57 = v56;
LABEL_72:
  swift_bridgeObjectRelease();
  sub_10004B038(v57);
  swift_bridgeObjectRelease();
  swift_release();
LABEL_73:
  uint64_t v58 = *(uint64_t (**)(void))(v0 + 8);
  return v58();
}

void *sub_10004C1CC(unint64_t a1, unsigned int (**a2)(void, void))
{
  *(void *)(swift_allocObject() + 16) = a2;
  if (a1 >> 62)
  {
LABEL_16:
    _Block_copy(a2);
    uint64_t v4 = sub_1000627B0();
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
          uint64_t v6 = sub_1000626A0();
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
          sub_1000626D0();
          sub_100062700();
          sub_100062710();
          sub_1000626E0();
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

void sub_10004C3A4(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_100035DD8(&qword_1000A1AF8);
    id v2 = (void *)sub_1000627E0();
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
          sub_1000564F8();
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
    unint64_t v20 = sub_1000547C8(v17, v16);
    unint64_t v21 = v20;
    if (v22)
    {
      unint64_t v7 = (uint64_t *)(v2[6] + 16 * v20);
      swift_bridgeObjectRelease();
      uint64_t *v7 = v17;
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

uint64_t sub_10004C67C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[7] = a2;
  v3[8] = a3;
  v3[6] = a1;
  type metadata accessor for VoicemailActor();
  swift_initStaticObject();
  sub_100056B90((unint64_t *)&qword_1000A1510, (void (*)(uint64_t))type metadata accessor for VoicemailActor);
  uint64_t v5 = sub_1000623E0();
  return _swift_task_switch(sub_10004C748, v5, v4);
}

uint64_t sub_10004C748()
{
  uint64_t v59 = v0;
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  swift_bridgeObjectRetain_n();
  id v2 = sub_1000621D0();
  uint64_t v53 = Strong;
  if (Strong)
  {
    os_log_type_t v3 = sub_1000624F0();
    uint64_t v52 = v0;
    uint64_t v51 = (uint64_t *)(v0 + 40);
    if (os_log_type_enabled(v2, v3))
    {
      logb = v2;
      uint64_t v4 = (uint8_t *)swift_slowAlloc();
      uint64_t v58 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v4 = 136315138;
      sub_100062060();
      swift_bridgeObjectRetain();
      uint64_t v5 = sub_100062390();
      unint64_t v7 = v6;
      swift_bridgeObjectRelease();
      *(void *)(v0 + 40) = sub_10005B9C0(v5, v7, (uint64_t *)&v58);
      sub_100062590();
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
    uint64_t v14 = *(void *)(v53 + OBJC_IVAR____TtC9IntentsUI24FaceTimeVoicemailManager_messageTypes);
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
            id v21 = (id)sub_1000626A0();
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
          uint64_t v24 = sub_100061FB0();
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
        int v26 = (unsigned __int16)sub_100062090();
        if (v26 == (unsigned __int16)sub_100062090())
        {
LABEL_20:
          swift_bridgeObjectRelease();
          sub_1000626D0();
          sub_100062700();
          sub_100062710();
          unint64_t v13 = (unint64_t)&v58;
          sub_1000626E0();
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
              int v28 = (unsigned __int16)sub_100062090();
              if (v28 == (unsigned __int16)sub_100062090()) {
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
            uint64_t v15 = sub_1000627B0();
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
    uint64_t v29 = sub_1000621D0();
    os_log_type_t v30 = sub_1000624F0();
    if (os_log_type_enabled(v29, v30))
    {
      char v31 = (uint8_t *)swift_slowAlloc();
      uint64_t v58 = (void *)swift_slowAlloc();
      *(_DWORD *)char v31 = 136315138;
      sub_100062060();
      swift_bridgeObjectRetain();
      uint64_t v32 = sub_100062390();
      unint64_t v34 = v33;
      swift_release();
      *uint64_t v51 = sub_10005B9C0(v32, v34, (uint64_t *)&v58);
      sub_100062590();
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
      uint64_t v48 = sub_1000627B0();
      swift_release();
      if (v48)
      {
        swift_bridgeObjectRetain();
        uint64_t v35 = sub_1000627B0();
        swift_release();
        if (!v35)
        {
          swift_release();
          unint64_t v46 = (unint64_t)_swiftEmptyArrayStorage;
          if (!((unint64_t)_swiftEmptyArrayStorage >> 62))
          {
LABEL_44:
            swift_bridgeObjectRetain();
            sub_100062860();
            unint64_t v47 = v46;
LABEL_45:
            swift_bridgeObjectRelease();
            sub_10004D070(v47);
            swift_bridgeObjectRelease();
LABEL_57:
            swift_release();
            goto LABEL_58;
          }
LABEL_63:
          swift_bridgeObjectRetain();
          sub_100035DD8(&qword_1000A1500);
          unint64_t v47 = sub_1000627A0();
          swift_bridgeObjectRelease();
          goto LABEL_45;
        }
        uint64_t v58 = _swiftEmptyArrayStorage;
        sub_1000626F0();
        if ((v35 & 0x8000000000000000) == 0)
        {
LABEL_38:
          uint64_t v36 = 0;
          os_log_t loga = (os_log_t)(v17 & 0xC000000000000001);
          double v37 = (void *)v17;
          do
          {
            if (loga) {
              id v38 = (id)sub_1000626A0();
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
            uint64_t v41 = v40 + OBJC_IVAR____TtC9IntentsUI9FTMessage____lazy_storage___dataURL;
            uint64_t v42 = sub_100035DD8(&qword_1000A16F8);
            uint64_t v43 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v42 - 8) + 56);
            v43(v41, 1, 1, v42);
            v43(v40 + OBJC_IVAR____TtC9IntentsUI9FTMessage____lazy_storage___thumbnailURL, 1, 1, v42);
            v43(v40 + OBJC_IVAR____TtC9IntentsUI9FTMessage____lazy_storage___transcriptURL, 1, 1, v42);
            uint64_t v44 = v40 + OBJC_IVAR____TtC9IntentsUI9FTMessage____lazy_storage___transcriptData;
            uint64_t v45 = sub_100035DD8(&qword_1000A1AB0);
            (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v45 - 8) + 56))(v44, 1, 1, v45);
            *(void *)(v40 + OBJC_IVAR____TtC9IntentsUI9FTMessage____lazy_storage___transcript) = 1;
            *(unsigned char *)(v40 + OBJC_IVAR____TtC9IntentsUI9FTMessage_didLoadTranscript) = 0;
            *(unsigned char *)(v40 + OBJC_IVAR____TtC9IntentsUI9FTMessage_isDirty) = 0;
            *(void *)(v40 + 16) = v39;
            sub_1000626D0();
            sub_100062700();
            sub_100062710();
            sub_1000626E0();
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
        sub_1000626F0();
        goto LABEL_38;
      }
    }
    swift_release();
    goto LABEL_57;
  }
  uint64_t v8 = sub_1000624D0();
  BOOL v9 = os_log_type_enabled(v2, (os_log_type_t)v8);
  unint64_t v10 = *(void *)(v0 + 64);
  if (v9)
  {
    int64_t v11 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)int64_t v11 = 134217984;
    if (v10 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v12 = sub_1000627B0();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v12 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    *(void *)(v0 + 40) = v12;
    sub_100062590();
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

uint64_t sub_10004D070(unint64_t a1)
{
  sub_10003A244(a1, &v3);
  return sub_1000488EC(a1, 2);
}

uint64_t sub_10004D278(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[7] = a2;
  v3[8] = a3;
  v3[6] = a1;
  type metadata accessor for VoicemailActor();
  swift_initStaticObject();
  sub_100056B90((unint64_t *)&qword_1000A1510, (void (*)(uint64_t))type metadata accessor for VoicemailActor);
  uint64_t v5 = sub_1000623E0();
  return _swift_task_switch(sub_10004D344, v5, v4);
}

uint64_t sub_10004D344()
{
  uint64_t v59 = v0;
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  swift_bridgeObjectRetain_n();
  id v2 = sub_1000621D0();
  uint64_t v53 = Strong;
  if (Strong)
  {
    os_log_type_t v3 = sub_1000624F0();
    uint64_t v52 = v0;
    uint64_t v51 = (uint64_t *)(v0 + 40);
    if (os_log_type_enabled(v2, v3))
    {
      logb = v2;
      uint64_t v4 = (uint8_t *)swift_slowAlloc();
      uint64_t v58 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v4 = 136315138;
      sub_100062060();
      swift_bridgeObjectRetain();
      uint64_t v5 = sub_100062390();
      unint64_t v7 = v6;
      swift_bridgeObjectRelease();
      *(void *)(v0 + 40) = sub_10005B9C0(v5, v7, (uint64_t *)&v58);
      sub_100062590();
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
    uint64_t v14 = *(void *)(v53 + OBJC_IVAR____TtC9IntentsUI24FaceTimeVoicemailManager_messageTypes);
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
            id v21 = (id)sub_1000626A0();
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
          uint64_t v24 = sub_100061FB0();
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
        int v26 = (unsigned __int16)sub_100062090();
        if (v26 == (unsigned __int16)sub_100062090())
        {
LABEL_20:
          swift_bridgeObjectRelease();
          sub_1000626D0();
          sub_100062700();
          sub_100062710();
          unint64_t v13 = (unint64_t)&v58;
          sub_1000626E0();
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
              int v28 = (unsigned __int16)sub_100062090();
              if (v28 == (unsigned __int16)sub_100062090()) {
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
            uint64_t v15 = sub_1000627B0();
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
    uint64_t v29 = sub_1000621D0();
    os_log_type_t v30 = sub_1000624F0();
    if (os_log_type_enabled(v29, v30))
    {
      char v31 = (uint8_t *)swift_slowAlloc();
      uint64_t v58 = (void *)swift_slowAlloc();
      *(_DWORD *)char v31 = 136315138;
      sub_100062060();
      swift_bridgeObjectRetain();
      uint64_t v32 = sub_100062390();
      unint64_t v34 = v33;
      swift_release();
      *uint64_t v51 = sub_10005B9C0(v32, v34, (uint64_t *)&v58);
      sub_100062590();
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
      uint64_t v48 = sub_1000627B0();
      swift_release();
      if (v48)
      {
        swift_bridgeObjectRetain();
        uint64_t v35 = sub_1000627B0();
        swift_release();
        if (!v35)
        {
          swift_release();
          unint64_t v46 = (unint64_t)_swiftEmptyArrayStorage;
          if (!((unint64_t)_swiftEmptyArrayStorage >> 62))
          {
LABEL_44:
            swift_bridgeObjectRetain();
            sub_100062860();
            unint64_t v47 = v46;
LABEL_45:
            swift_bridgeObjectRelease();
            sub_10004D070(v47);
            swift_bridgeObjectRelease();
LABEL_57:
            swift_release();
            goto LABEL_58;
          }
LABEL_63:
          swift_bridgeObjectRetain();
          sub_100035DD8(&qword_1000A1500);
          unint64_t v47 = sub_1000627A0();
          swift_bridgeObjectRelease();
          goto LABEL_45;
        }
        uint64_t v58 = _swiftEmptyArrayStorage;
        sub_1000626F0();
        if ((v35 & 0x8000000000000000) == 0)
        {
LABEL_38:
          uint64_t v36 = 0;
          os_log_t loga = (os_log_t)(v17 & 0xC000000000000001);
          double v37 = (void *)v17;
          do
          {
            if (loga) {
              id v38 = (id)sub_1000626A0();
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
            uint64_t v41 = v40 + OBJC_IVAR____TtC9IntentsUI9FTMessage____lazy_storage___dataURL;
            uint64_t v42 = sub_100035DD8(&qword_1000A16F8);
            uint64_t v43 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v42 - 8) + 56);
            v43(v41, 1, 1, v42);
            v43(v40 + OBJC_IVAR____TtC9IntentsUI9FTMessage____lazy_storage___thumbnailURL, 1, 1, v42);
            v43(v40 + OBJC_IVAR____TtC9IntentsUI9FTMessage____lazy_storage___transcriptURL, 1, 1, v42);
            uint64_t v44 = v40 + OBJC_IVAR____TtC9IntentsUI9FTMessage____lazy_storage___transcriptData;
            uint64_t v45 = sub_100035DD8(&qword_1000A1AB0);
            (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v45 - 8) + 56))(v44, 1, 1, v45);
            *(void *)(v40 + OBJC_IVAR____TtC9IntentsUI9FTMessage____lazy_storage___transcript) = 1;
            *(unsigned char *)(v40 + OBJC_IVAR____TtC9IntentsUI9FTMessage_didLoadTranscript) = 0;
            *(unsigned char *)(v40 + OBJC_IVAR____TtC9IntentsUI9FTMessage_isDirty) = 0;
            *(void *)(v40 + 16) = v39;
            sub_1000626D0();
            sub_100062700();
            sub_100062710();
            sub_1000626E0();
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
        sub_1000626F0();
        goto LABEL_38;
      }
    }
    swift_release();
    goto LABEL_57;
  }
  uint64_t v8 = sub_1000624D0();
  BOOL v9 = os_log_type_enabled(v2, (os_log_type_t)v8);
  unint64_t v10 = *(void *)(v0 + 64);
  if (v9)
  {
    int64_t v11 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)int64_t v11 = 134217984;
    if (v10 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v12 = sub_1000627B0();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v12 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    *(void *)(v0 + 40) = v12;
    sub_100062590();
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

uint64_t sub_10004DCA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[10] = a2;
  v3[11] = a3;
  v3[9] = a1;
  uint64_t v4 = sub_100061D90();
  v3[12] = v4;
  v3[13] = *(void *)(v4 - 8);
  v3[14] = swift_task_alloc();
  v3[15] = swift_task_alloc();
  type metadata accessor for VoicemailActor();
  swift_initStaticObject();
  sub_100056B90((unint64_t *)&qword_1000A1510, (void (*)(uint64_t))type metadata accessor for VoicemailActor);
  uint64_t v6 = sub_1000623E0();
  return _swift_task_switch(sub_10004DDD8, v6, v5);
}

uint64_t sub_10004DDD8()
{
  unint64_t v33 = v0;
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  swift_bridgeObjectRetain();
  if (Strong)
  {
    swift_bridgeObjectRetain();
    id v2 = sub_1000621D0();
    os_log_type_t v3 = sub_1000624F0();
    char v31 = v0;
    if (os_log_type_enabled(v2, v3))
    {
      uint64_t v4 = (uint8_t *)swift_slowAlloc();
      uint64_t v32 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v4 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v5 = sub_100062390();
      unint64_t v7 = v6;
      swift_bridgeObjectRelease();
      v0[8] = sub_10005B9C0(v5, v7, (uint64_t *)&v32);
      sub_100062590();
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
      sub_1000626F0();
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
        sub_1000626D0();
        sub_100062700();
        sub_100062710();
        sub_1000626E0();
        v18 += v28;
        --v14;
      }
      while (v14);
      uint64_t v15 = v32;
    }
    sub_10004E248((unint64_t)v15);
    swift_bridgeObjectRelease();
    swift_release();
  }
  else
  {
    uint64_t v8 = sub_1000621D0();
    uint64_t v9 = sub_1000624D0();
    BOOL v10 = os_log_type_enabled(v8, (os_log_type_t)v9);
    uint64_t v11 = v0[11];
    if (v10)
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v12 = 134217984;
      v0[7] = *(void *)(v11 + 16);
      sub_100062590();
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

uint64_t sub_10004E248(unint64_t a1)
{
  unint64_t v1 = sub_100039FAC(a1, &v11);
  swift_bridgeObjectRetain_n();
  id v2 = sub_1000621D0();
  os_log_type_t v3 = sub_1000624F0();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 136315138;
    type metadata accessor for MessageID(0);
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_100062390();
    unint64_t v7 = v6;
    swift_bridgeObjectRelease();
    sub_10005B9C0(v5, v7, &v10);
    sub_100062590();
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
    uint64_t v9 = sub_1000627B0();
    swift_bridgeObjectRelease();
    if (!v9) {
      return swift_bridgeObjectRelease();
    }
    goto LABEL_6;
  }
  if (*(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
LABEL_6:
  }
    sub_1000488EC(v1, 0);
  return swift_bridgeObjectRelease();
}

uint64_t sub_10004E638(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void), uint64_t a5, uint64_t a6)
{
  v17[1] = a6;
  uint64_t v8 = sub_1000621F0();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  __chkstk_darwin(v8);
  a4(0);
  uint64_t v11 = sub_100062380();
  uint64_t v12 = a1 + OBJC_IVAR____TtC9IntentsUI24FaceTimeVoicemailManager_logger;
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
  sub_100061E70();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_10004E820(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 40) = a1;
  *(void *)(v2 + 48) = a2;
  type metadata accessor for VoicemailActor();
  swift_initStaticObject();
  sub_100056B90((unint64_t *)&qword_1000A1510, (void (*)(uint64_t))type metadata accessor for VoicemailActor);
  uint64_t v4 = sub_1000623E0();
  return _swift_task_switch(sub_10004E8E8, v4, v3);
}

uint64_t sub_10004E8E8()
{
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    *(void *)(Strong + 16) = 0x8000000000000000;
    swift_release();
    uint64_t v2 = sub_1000621D0();
    os_log_type_t v3 = sub_1000624F0();
    if (os_log_type_enabled(v2, v3))
    {
      uint64_t v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, v3, "messageStoreDidReconnect(), triggering onVoicemailsChanged().", v4, 2u);
      swift_slowDealloc();
    }

    sub_1000488EC(0, 3);
    swift_release();
  }
  else
  {
    uint64_t v5 = sub_1000621D0();
    os_log_type_t v6 = sub_1000624D0();
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

uint64_t sub_10004EAA0(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 40) = a1;
  *(void *)(v2 + 48) = a2;
  type metadata accessor for VoicemailActor();
  swift_initStaticObject();
  sub_100056B90((unint64_t *)&qword_1000A1510, (void (*)(uint64_t))type metadata accessor for VoicemailActor);
  uint64_t v4 = sub_1000623E0();
  return _swift_task_switch(sub_10004EB68, v4, v3);
}

uint64_t sub_10004EB68()
{
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    *(void *)(Strong + 16) = 0x8000000000000000;
    swift_release();
    uint64_t v2 = sub_1000621D0();
    os_log_type_t v3 = sub_1000624F0();
    if (os_log_type_enabled(v2, v3))
    {
      uint64_t v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, v3, "messageStoreRequiresRefetch(), triggering onVoicemailsChanged().", v4, 2u);
      swift_slowDealloc();
    }

    sub_1000488EC(0, 3);
    swift_release();
  }
  else
  {
    uint64_t v5 = sub_1000621D0();
    os_log_type_t v6 = sub_1000624D0();
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

uint64_t sub_10004ED20(uint64_t a1)
{
  uint64_t v2 = sub_1000621F0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  __chkstk_darwin(v2);
  uint64_t v5 = a1 + OBJC_IVAR____TtC9IntentsUI24FaceTimeVoicemailManager_logger;
  uint64_t v6 = swift_allocObject();
  swift_weakInit();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v5, v2);
  unint64_t v7 = (*(unsigned __int8 *)(v3 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v6;
  (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v8 + v7, (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v2);
  swift_retain();
  swift_retain();
  sub_100061E70();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

void *sub_10004EEC0(unint64_t a1)
{
  uint64_t result = sub_100047E6C(a1);
  if (!result)
  {
    swift_bridgeObjectRetain_n();
    uint64_t v2 = sub_1000621D0();
    os_log_type_t v3 = sub_1000624D0();
    if (os_log_type_enabled(v2, v3))
    {
      uint64_t v4 = (uint8_t *)swift_slowAlloc();
      uint64_t v5 = swift_slowAlloc();
      *(_DWORD *)uint64_t v4 = 136446210;
      sub_10005B9C0(0x654D3C7961727241, 0xEE003E6567617373, &v5);
      sub_100062590();
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

uint64_t sub_10004F0A0(uint64_t a1)
{
  v2[5] = a1;
  v2[6] = v1;
  uint64_t v3 = sub_100062170();
  v2[7] = v3;
  v2[8] = *(void *)(v3 - 8);
  v2[9] = swift_task_alloc();
  type metadata accessor for VoicemailActor();
  swift_initStaticObject();
  sub_100056B90((unint64_t *)&qword_1000A1510, (void (*)(uint64_t))type metadata accessor for VoicemailActor);
  uint64_t v5 = sub_1000623E0();
  v2[10] = v5;
  v2[11] = v4;
  return _swift_task_switch(sub_10004F1C4, v5, v4);
}

uint64_t sub_10004F1C4()
{
  unint64_t v1 = (unint64_t)sub_10004EEC0(v0[5]);
  v0[12] = v1;
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_1000627B0();
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
      return _swift_task_switch(sub_10004F2BC, 0, 0);
    }
  }
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_10004F2BC()
{
  sub_100062410();
  *(void *)(v0 + 112) = sub_100062400();
  uint64_t v2 = sub_1000623E0();
  return _swift_task_switch(sub_10004F350, v2, v1);
}

uint64_t sub_10004F350()
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
        uint64_t v7 = sub_1000626A0();
      }
      else {
        uint64_t v7 = swift_retain();
      }
      uint64_t v8 = v0[13];
      ++v6;
      *(unsigned char *)(v7 + OBJC_IVAR____TtC9IntentsUI9FTMessage_isDirty) = 1;
      *(unsigned char *)(v7 + 34) = 1;
      swift_release();
    }
    while (v6 != v8);
    swift_bridgeObjectRelease();
    uint64_t v3 = v0[10];
    uint64_t v4 = v0[11];
    uint64_t v2 = (uint64_t)sub_10004F434;
  }
  return _swift_task_switch(v2, v3, v4);
}

uint64_t sub_10004F434()
{
  uint64_t v2 = v0[8];
  uint64_t v1 = (uint64_t *)v0[9];
  uint64_t v4 = v0[6];
  uint64_t v3 = v0[7];
  uint64_t v5 = sub_100047818(v0[12]);
  v0[15] = v5;
  swift_bridgeObjectRelease();
  sub_1000362AC((void *)(v4 + OBJC_IVAR____TtC9IntentsUI24FaceTimeVoicemailManager_messageStoreController), *(void *)(v4 + OBJC_IVAR____TtC9IntentsUI24FaceTimeVoicemailManager_messageStoreController + 24));
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  uint64_t *v1 = v6;
  (*(void (**)(uint64_t *, void, uint64_t))(v2 + 104))(v1, enum case for MessageStoreQuery.recordUUID(_:), v3);
  swift_bridgeObjectRetain();
  uint64_t v7 = (void *)swift_task_alloc();
  v0[16] = v7;
  void *v7 = v0;
  v7[1] = sub_10004F578;
  uint64_t v8 = v0[9];
  return MessageStoreController.deleteMessages(query:)(v8);
}

uint64_t sub_10004F578()
{
  uint64_t v2 = (void *)*v1;
  v2[17] = v0;
  swift_task_dealloc();
  if (v0)
  {
    (*(void (**)(void, void))(v2[8] + 8))(v2[9], v2[7]);
    uint64_t v3 = v2[10];
    uint64_t v4 = v2[11];
    return _swift_task_switch(sub_10004F6EC, v3, v4);
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

uint64_t sub_10004F6EC()
{
  uint64_t v12 = v0;
  swift_errorRetain();
  swift_bridgeObjectRetain();
  swift_errorRetain();
  uint64_t v1 = sub_1000621D0();
  os_log_type_t v2 = sub_1000624D0();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = swift_slowAlloc();
    uint64_t v4 = (void *)swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 136315394;
    sub_100061D90();
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_100062390();
    unint64_t v7 = v6;
    swift_bridgeObjectRelease();
    v0[3] = sub_10005B9C0(v5, v7, &v11);
    sub_100062590();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v3 + 12) = 2112;
    swift_errorRetain();
    uint64_t v8 = _swift_stdlib_bridgeErrorToNSError();
    v0[4] = v8;
    sub_100062590();
    void *v4 = v8;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "FaceTimeVoicemailManager failed to delete messages with recordUUIDs %s with error: %@", (uint8_t *)v3, 0x16u);
    sub_100035DD8(&qword_1000A15E0);
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

uint64_t sub_10004FB08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  type metadata accessor for VoicemailActor();
  swift_initStaticObject();
  sub_100056B90((unint64_t *)&qword_1000A1510, (void (*)(uint64_t))type metadata accessor for VoicemailActor);
  uint64_t v5 = sub_1000623E0();
  return _swift_task_switch(sub_10004FBD4, v5, v4);
}

uint64_t sub_10004FBD4()
{
  *(void *)(v0 + 40) = _Block_copy(*(const void **)(v0 + 24));
  sub_100035DD8(&qword_1000A1500);
  uint64_t v1 = sub_100062380();
  *(void *)(v0 + 48) = v1;
  swift_retain();
  os_log_type_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v2;
  *os_log_type_t v2 = v0;
  v2[1] = sub_100056BEC;
  return sub_10004F0A0(v1);
}

uint64_t sub_10004FCAC(uint64_t a1)
{
  v2[4] = a1;
  v2[5] = v1;
  sub_100035DD8(&qword_1000A16F8);
  v2[6] = swift_task_alloc();
  sub_100035DD8(&qword_1000A1958);
  v2[7] = swift_task_alloc();
  v2[8] = swift_task_alloc();
  uint64_t v3 = sub_100061D90();
  v2[9] = v3;
  v2[10] = *(void *)(v3 - 8);
  v2[11] = swift_task_alloc();
  type metadata accessor for VoicemailActor();
  swift_initStaticObject();
  sub_100056B90((unint64_t *)&qword_1000A1510, (void (*)(uint64_t))type metadata accessor for VoicemailActor);
  uint64_t v5 = sub_1000623E0();
  v2[12] = v5;
  v2[13] = v4;
  return _swift_task_switch(sub_10004FE40, v5, v4);
}

uint64_t sub_10004FE40()
{
  unint64_t v1 = (unint64_t)sub_10004EEC0(v0[4]);
  v0[14] = v1;
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_1000627B0();
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
      return _swift_task_switch(sub_10004FF64, 0, 0);
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

uint64_t sub_10004FF64()
{
  sub_100062410();
  *(void *)(v0 + 128) = sub_100062400();
  uint64_t v2 = sub_1000623E0();
  return _swift_task_switch(sub_10004FFF8, v2, v1);
}

uint64_t sub_10004FFF8()
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
        uint64_t v7 = sub_1000626A0();
      }
      else {
        uint64_t v7 = swift_retain();
      }
      uint64_t v8 = v0[15];
      ++v6;
      *(unsigned char *)(v7 + OBJC_IVAR____TtC9IntentsUI9FTMessage_isDirty) = 1;
      *(unsigned char *)(v7 + 33) = 1;
      swift_release();
    }
    while (v6 != v8);
    swift_bridgeObjectRelease();
    uint64_t v3 = v0[12];
    uint64_t v4 = v0[13];
    uint64_t v2 = (uint64_t)sub_1000500DC;
  }
  return _swift_task_switch(v2, v3, v4);
}

uint64_t sub_1000500DC()
{
  unint64_t v1 = v0[14];
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_1000627B0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (v2)
  {
    uint64_t v3 = (void *)sub_1000626F0();
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
        sub_1000626A0();
      }
      else {
        swift_retain();
      }
      uint64_t v6 = v0[8];
      uint64_t v7 = v0[9];
      uint64_t v9 = v0[6];
      uint64_t v8 = v0[7];
      ++v4;
      sub_100061F60();
      uint64_t v10 = *v5;
      (*v5)(v6, 1, 1, v7);
      v10(v8, 1, 1, v7);
      uint64_t v11 = sub_100061CD0();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v9, 1, 1, v11);
      id v12 = objc_allocWithZone((Class)sub_1000620C0());
      sub_1000620A0();
      swift_release();
      sub_1000626D0();
      sub_100062700();
      sub_100062710();
      sub_1000626E0();
    }
    while (v2 != v4);
  }
  v0[17] = _swiftEmptyArrayStorage;
  sub_1000362AC((void *)(v0[5] + OBJC_IVAR____TtC9IntentsUI24FaceTimeVoicemailManager_messageStoreController), *(void *)(v0[5] + OBJC_IVAR____TtC9IntentsUI24FaceTimeVoicemailManager_messageStoreController + 24));
  uint64_t v13 = (void *)swift_task_alloc();
  v0[18] = v13;
  *uint64_t v13 = v0;
  v13[1] = sub_1000503A4;
  uint64_t v3 = _swiftEmptyArrayStorage;
  return MessageStoreController.updateMessages(_:)(v3);
}

uint64_t sub_1000503A4()
{
  uint64_t v2 = (void *)*v1;
  v2[19] = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = v2[12];
    uint64_t v4 = v2[13];
    return _swift_task_switch(sub_10005051C, v3, v4);
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

uint64_t sub_10005051C()
{
  id v12 = v0;
  swift_bridgeObjectRelease();
  swift_errorRetain();
  swift_bridgeObjectRetain();
  swift_errorRetain();
  unint64_t v1 = sub_1000621D0();
  os_log_type_t v2 = sub_1000624D0();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = swift_slowAlloc();
    uint64_t v4 = (void *)swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 136315394;
    type metadata accessor for FTMessage(0);
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_100062390();
    unint64_t v7 = v6;
    swift_bridgeObjectRelease();
    v0[2] = sub_10005B9C0(v5, v7, &v11);
    sub_100062590();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v3 + 12) = 2112;
    swift_errorRetain();
    uint64_t v8 = _swift_stdlib_bridgeErrorToNSError();
    v0[3] = v8;
    sub_100062590();
    void *v4 = v8;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "FaceTimeVoicemailManager failed to set messages %s as read with error: %@", (uint8_t *)v3, 0x16u);
    sub_100035DD8(&qword_1000A15E0);
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

uint64_t sub_100050960(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  type metadata accessor for VoicemailActor();
  swift_initStaticObject();
  sub_100056B90((unint64_t *)&qword_1000A1510, (void (*)(uint64_t))type metadata accessor for VoicemailActor);
  uint64_t v5 = sub_1000623E0();
  return _swift_task_switch(sub_100050A2C, v5, v4);
}

uint64_t sub_100050A2C()
{
  *(void *)(v0 + 40) = _Block_copy(*(const void **)(v0 + 24));
  sub_100035DD8(&qword_1000A1500);
  uint64_t v1 = sub_100062380();
  *(void *)(v0 + 48) = v1;
  swift_retain();
  os_log_type_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v2;
  *os_log_type_t v2 = v0;
  v2[1] = sub_100050B04;
  return sub_10004FCAC(v1);
}

uint64_t sub_100050B04()
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

uint64_t sub_100050C64(uint64_t a1)
{
  v2[5] = a1;
  v2[6] = v1;
  sub_100035DD8(&qword_1000A16F8);
  v2[7] = swift_task_alloc();
  sub_100035DD8(&qword_1000A1958);
  v2[8] = swift_task_alloc();
  v2[9] = swift_task_alloc();
  uint64_t v3 = sub_100061D90();
  v2[10] = v3;
  v2[11] = *(void *)(v3 - 8);
  v2[12] = swift_task_alloc();
  v2[13] = swift_task_alloc();
  v2[14] = swift_task_alloc();
  type metadata accessor for VoicemailActor();
  swift_initStaticObject();
  sub_100056B90((unint64_t *)&qword_1000A1510, (void (*)(uint64_t))type metadata accessor for VoicemailActor);
  uint64_t v5 = sub_1000623E0();
  v2[15] = v5;
  uint8_t v2[16] = v4;
  return _swift_task_switch(sub_100050E14, v5, v4);
}

uint64_t sub_100050E14()
{
  unint64_t v1 = (unint64_t)sub_10004EEC0(v0[5]);
  v0[17] = v1;
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_1000627B0();
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
      return _swift_task_switch(sub_100050F58, 0, 0);
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

uint64_t sub_100050F58()
{
  sub_100062410();
  *(void *)(v0 + 152) = sub_100062400();
  uint64_t v2 = sub_1000623E0();
  return _swift_task_switch(sub_100050FEC, v2, v1);
}

uint64_t sub_100050FEC()
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
        uint64_t v7 = sub_1000626A0();
      }
      else {
        uint64_t v7 = swift_retain();
      }
      uint64_t v8 = v0[18];
      ++v6;
      *(unsigned char *)(v7 + OBJC_IVAR____TtC9IntentsUI9FTMessage_isDirty) = 1;
      *(void *)(v7 + 24) = 2;
      *(unsigned char *)(v7 + 32) = 0;
      swift_release();
    }
    while (v6 != v8);
    swift_bridgeObjectRelease();
    uint64_t v3 = v0[15];
    uint64_t v4 = v0[16];
    uint64_t v2 = (uint64_t)sub_1000510E0;
  }
  return _swift_task_switch(v2, v3, v4);
}

uint64_t sub_1000510E0()
{
  uint64_t v24 = v0;
  unint64_t v1 = v0[17];
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_1000627B0();
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
  uint64_t v3 = sub_1000626F0();
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
      sub_1000626A0();
    }
    else {
      swift_retain();
    }
    uint64_t v6 = v0[9];
    uint64_t v7 = v0[10];
    uint64_t v9 = v0[7];
    uint64_t v8 = v0[8];
    ++v4;
    sub_100061F60();
    uint64_t v10 = *v5;
    (*v5)(v6, 1, 1, v7);
    v10(v8, 1, 1, v7);
    uint64_t v11 = sub_100061CD0();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v9, 1, 1, v11);
    id v12 = objc_allocWithZone((Class)sub_1000620C0());
    sub_1000620A0();
    swift_release();
    sub_1000626D0();
    sub_100062700();
    sub_100062710();
    sub_1000626E0();
  }
  while (v2 != v4);
  uint64_t v13 = v23;
  swift_bridgeObjectRelease();
LABEL_12:
  uint64_t v14 = OBJC_IVAR____TtC9IntentsUI24FaceTimeVoicemailManager_logger;
  v0[20] = v13;
  v0[21] = v14;
  swift_bridgeObjectRetain_n();
  uint64_t v15 = sub_1000621D0();
  os_log_type_t v16 = sub_1000624D0();
  if (os_log_type_enabled(v15, v16))
  {
    unint64_t v17 = (uint8_t *)swift_slowAlloc();
    uint64_t v23 = (void *)swift_slowAlloc();
    *(_DWORD *)unint64_t v17 = 136315138;
    sub_1000620C0();
    swift_bridgeObjectRetain();
    uint64_t v18 = sub_100062390();
    unint64_t v20 = v19;
    swift_bridgeObjectRelease();
    v0[4] = sub_10005B9C0(v18, v20, (uint64_t *)&v23);
    sub_100062590();
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
  sub_1000362AC((void *)(v0[6] + OBJC_IVAR____TtC9IntentsUI24FaceTimeVoicemailManager_messageStoreController), *(void *)(v0[6] + OBJC_IVAR____TtC9IntentsUI24FaceTimeVoicemailManager_messageStoreController + 24));
  uint64_t v21 = (void *)swift_task_alloc();
  v0[22] = v21;
  *uint64_t v21 = v0;
  v21[1] = sub_100051514;
  uint64_t v3 = (uint64_t)v13;
  return MessageStoreController.updateMessages(_:)(v3);
}

uint64_t sub_100051514()
{
  uint64_t v2 = (void *)*v1;
  v2[23] = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = v2[15];
    uint64_t v4 = v2[16];
    return _swift_task_switch(sub_1000516A0, v3, v4);
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

uint64_t sub_1000516A0()
{
  char v31 = v0;
  swift_errorRetain();
  swift_bridgeObjectRetain();
  swift_errorRetain();
  unint64_t v1 = sub_1000621D0();
  os_log_type_t v2 = sub_1000624D0();
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
      uint64_t v5 = sub_1000627B0();
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
      uint64_t result = sub_100054C60(0, v5 & ~(v5 >> 63), 0);
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
          sub_1000626A0();
          sub_1000620B0();
          swift_unknownObjectRelease();
          os_log_type_t v30 = v7;
          unint64_t v11 = v7[2];
          unint64_t v10 = v7[3];
          if (v11 >= v10 >> 1)
          {
            sub_100054C60(v10 > 1, v11 + 1, 1);
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
          sub_1000620B0();

          os_log_type_t v30 = v7;
          unint64_t v18 = v7[2];
          unint64_t v17 = v7[3];
          if (v18 >= v17 >> 1)
          {
            sub_100054C60(v17 > 1, v18 + 1, 1);
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
    uint64_t v21 = sub_100062390();
    unint64_t v23 = v22;
    swift_bridgeObjectRelease();
    v0[2] = sub_10005B9C0(v21, v23, &v29);
    sub_100062590();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v4 + 12) = 2112;
    swift_errorRetain();
    uint64_t v24 = _swift_stdlib_bridgeErrorToNSError();
    v0[3] = v24;
    sub_100062590();
    void *v26 = v24;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, log, v27, "FaceTimeVoicemailManager failed to set messages %s as deleted with error: %@", (uint8_t *)v4, 0x16u);
    sub_100035DD8(&qword_1000A15E0);
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

uint64_t sub_100051CC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  type metadata accessor for VoicemailActor();
  swift_initStaticObject();
  sub_100056B90((unint64_t *)&qword_1000A1510, (void (*)(uint64_t))type metadata accessor for VoicemailActor);
  uint64_t v5 = sub_1000623E0();
  return _swift_task_switch(sub_100051D90, v5, v4);
}

uint64_t sub_100051D90()
{
  *(void *)(v0 + 40) = _Block_copy(*(const void **)(v0 + 24));
  sub_100035DD8(&qword_1000A1500);
  uint64_t v1 = sub_100062380();
  *(void *)(v0 + 48) = v1;
  swift_retain();
  os_log_type_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v2;
  *os_log_type_t v2 = v0;
  v2[1] = sub_100056BEC;
  return sub_100050C64(v1);
}

uint64_t sub_100051E68(uint64_t a1)
{
  v2[5] = a1;
  v2[6] = v1;
  sub_100035DD8(&qword_1000A16F8);
  v2[7] = swift_task_alloc();
  sub_100035DD8(&qword_1000A1958);
  v2[8] = swift_task_alloc();
  v2[9] = swift_task_alloc();
  uint64_t v3 = sub_100061D90();
  v2[10] = v3;
  v2[11] = *(void *)(v3 - 8);
  v2[12] = swift_task_alloc();
  v2[13] = swift_task_alloc();
  type metadata accessor for VoicemailActor();
  swift_initStaticObject();
  sub_100056B90((unint64_t *)&qword_1000A1510, (void (*)(uint64_t))type metadata accessor for VoicemailActor);
  uint64_t v5 = sub_1000623E0();
  v2[14] = v5;
  v2[15] = v4;
  return _swift_task_switch(sub_10005200C, v5, v4);
}

uint64_t sub_10005200C()
{
  unint64_t v1 = (unint64_t)sub_10004EEC0(v0[5]);
  v0[16] = v1;
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_1000627B0();
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
      return _swift_task_switch(sub_100052138, 0, 0);
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

uint64_t sub_100052138()
{
  sub_100062410();
  *(void *)(v0 + 144) = sub_100062400();
  uint64_t v2 = sub_1000623E0();
  return _swift_task_switch(sub_1000521CC, v2, v1);
}

uint64_t sub_1000521CC()
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
        uint64_t v7 = sub_1000626A0();
      }
      else {
        uint64_t v7 = swift_retain();
      }
      uint64_t v8 = v0[17];
      ++v6;
      *(unsigned char *)(v7 + OBJC_IVAR____TtC9IntentsUI9FTMessage_isDirty) = 1;
      *(void *)(v7 + 24) = 1;
      *(unsigned char *)(v7 + 32) = 0;
      swift_release();
    }
    while (v6 != v8);
    swift_bridgeObjectRelease();
    uint64_t v3 = v0[14];
    uint64_t v4 = v0[15];
    uint64_t v2 = (uint64_t)sub_1000522B4;
  }
  return _swift_task_switch(v2, v3, v4);
}

uint64_t sub_1000522B4()
{
  uint64_t v24 = v0;
  unint64_t v1 = v0[16];
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_1000627B0();
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
    uint64_t v4 = sub_1000626F0();
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
        sub_1000626A0();
      }
      else {
        swift_retain();
      }
      uint64_t v7 = v0[9];
      uint64_t v8 = v0[10];
      uint64_t v10 = v0[7];
      uint64_t v9 = v0[8];
      ++v5;
      sub_100061F60();
      unint64_t v11 = *v6;
      (*v6)(v7, 1, 1, v8);
      v11(v9, 1, 1, v8);
      uint64_t v12 = sub_100061CD0();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v10, 1, 1, v12);
      id v13 = objc_allocWithZone((Class)sub_1000620C0());
      sub_1000620A0();
      swift_release();
      sub_1000626D0();
      sub_100062700();
      sub_100062710();
      sub_1000626E0();
    }
    while (v2 != v5);
    uint64_t v3 = v23;
  }
  uint64_t v14 = OBJC_IVAR____TtC9IntentsUI24FaceTimeVoicemailManager_logger;
  v0[20] = v3;
  v0[21] = v14;
  swift_bridgeObjectRetain_n();
  uint64_t v15 = sub_1000621D0();
  os_log_type_t v16 = sub_1000624D0();
  if (os_log_type_enabled(v15, v16))
  {
    unint64_t v17 = (uint8_t *)swift_slowAlloc();
    unint64_t v23 = (void *)swift_slowAlloc();
    *(_DWORD *)unint64_t v17 = 136315138;
    sub_1000620C0();
    swift_bridgeObjectRetain();
    uint64_t v18 = sub_100062390();
    unint64_t v20 = v19;
    swift_bridgeObjectRelease();
    v0[4] = sub_10005B9C0(v18, v20, (uint64_t *)&v23);
    sub_100062590();
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
  sub_1000362AC((void *)(v0[6] + OBJC_IVAR____TtC9IntentsUI24FaceTimeVoicemailManager_messageStoreController), *(void *)(v0[6] + OBJC_IVAR____TtC9IntentsUI24FaceTimeVoicemailManager_messageStoreController + 24));
  uint64_t v21 = (void *)swift_task_alloc();
  v0[22] = v21;
  *uint64_t v21 = v0;
  v21[1] = sub_1000526D0;
  uint64_t v4 = (uint64_t)v3;
  return MessageStoreController.updateMessages(_:)(v4);
}

uint64_t sub_1000526D0()
{
  uint64_t v2 = (void *)*v1;
  v2[23] = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v0)
  {
    uint64_t v3 = v2[14];
    uint64_t v4 = v2[15];
    return _swift_task_switch(sub_100052860, v3, v4);
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

uint64_t sub_100052860()
{
  int v26 = v0;
  swift_errorRetain();
  swift_bridgeObjectRetain();
  swift_errorRetain();
  unint64_t v1 = sub_1000621D0();
  os_log_type_t v2 = sub_1000624D0();
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
      uint64_t result = sub_100054C60(0, v6 & ~(v6 >> 63), 0);
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
          sub_1000626A0();
        }
        else {
          swift_retain();
        }
        sub_100061F60();
        swift_release();
        uint64_t v25 = v10;
        unint64_t v12 = v10[2];
        unint64_t v11 = v10[3];
        if (v12 >= v11 >> 1)
        {
          sub_100054C60(v11 > 1, v12 + 1, 1);
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
    uint64_t v16 = sub_100062390();
    unint64_t v18 = v17;
    swift_bridgeObjectRelease();
    v0[2] = sub_10005B9C0(v16, v18, &v24);
    sub_100062590();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v4 + 12) = 2112;
    swift_errorRetain();
    uint64_t v19 = _swift_stdlib_bridgeErrorToNSError();
    v0[3] = v19;
    sub_100062590();
    *uint64_t v21 = v19;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, log, v22, "FaceTimeVoicemailManager failed to set messages %s as undeleted with error: %@", (uint8_t *)v4, 0x16u);
    sub_100035DD8(&qword_1000A15E0);
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

uint64_t sub_100052DB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  type metadata accessor for VoicemailActor();
  swift_initStaticObject();
  sub_100056B90((unint64_t *)&qword_1000A1510, (void (*)(uint64_t))type metadata accessor for VoicemailActor);
  uint64_t v5 = sub_1000623E0();
  return _swift_task_switch(sub_100052E7C, v5, v4);
}

uint64_t sub_100052E7C()
{
  *(void *)(v0 + 40) = _Block_copy(*(const void **)(v0 + 24));
  sub_100035DD8(&qword_1000A1500);
  uint64_t v1 = sub_100062380();
  *(void *)(v0 + 48) = v1;
  swift_retain();
  os_log_type_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v2;
  *os_log_type_t v2 = v0;
  v2[1] = sub_100056BEC;
  return sub_100051E68(v1);
}

uint64_t sub_1000530DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  void v3[5] = type metadata accessor for VoicemailActor();
  swift_initStaticObject();
  v3[6] = sub_100056B90((unint64_t *)&qword_1000A1510, (void (*)(uint64_t))type metadata accessor for VoicemailActor);
  uint64_t v5 = sub_1000623E0();
  return _swift_task_switch(sub_1000531B0, v5, v4);
}

uint64_t sub_1000531B0()
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
  v3[1] = sub_100053290;
  return sub_100037C38();
}

uint64_t sub_100053290(uint64_t a1)
{
  *(void *)(*(void *)v1 + 88) = a1;
  swift_task_dealloc();
  uint64_t v3 = sub_1000623E0();
  return _swift_task_switch(sub_1000533EC, v3, v2);
}

uint64_t sub_1000533EC()
{
  uint64_t v1 = (unsigned int (**)(void, void))v0[7];
  uint64_t v2 = (void (**)(void, void))v0[8];
  sub_10004C1CC(v0[11], v1);
  _Block_release(v1);
  swift_release();
  sub_100035DD8(&qword_1000A1500);
  Class isa = sub_100062370().super.isa;
  swift_bridgeObjectRelease();
  ((void (**)(void, Class))v2)[2](v2, isa);

  _Block_release(v2);
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_1000534C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  type metadata accessor for VoicemailActor();
  swift_initStaticObject();
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v7;
  void *v7 = v5;
  v7[1] = sub_100036550;
  return sub_10004F0A0(a5);
}

uint64_t sub_100053594(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  type metadata accessor for VoicemailActor();
  swift_initStaticObject();
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v7;
  void *v7 = v5;
  v7[1] = sub_100036550;
  return sub_10004FCAC(a5);
}

uint64_t sub_100053664(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7 = sub_100035DD8(&qword_1000A0F50);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100035DD8(&qword_1000A1500);
  uint64_t v10 = sub_100062380();
  uint64_t v11 = sub_100062450();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v9, 1, 1, v11);
  type metadata accessor for VoicemailActor();
  swift_retain_n();
  swift_bridgeObjectRetain();
  uint64_t inited = swift_initStaticObject();
  uint64_t v13 = sub_100056B90((unint64_t *)&qword_1000A1510, (void (*)(uint64_t))type metadata accessor for VoicemailActor);
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = inited;
  void v14[3] = v13;
  void v14[4] = a1;
  v14[5] = v10;
  sub_10005FDB0((uint64_t)v9, a5, (uint64_t)v14);
  swift_release();
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_100053800(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  type metadata accessor for VoicemailActor();
  swift_initStaticObject();
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v7;
  void *v7 = v5;
  v7[1] = sub_100036550;
  return sub_100050C64(a5);
}

uint64_t sub_1000538D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  type metadata accessor for VoicemailActor();
  swift_initStaticObject();
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v7;
  void *v7 = v5;
  v7[1] = sub_100036550;
  return sub_100051E68(a5);
}

uint64_t sub_1000539A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000621F0();
  uint64_t v5 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8);

  return v5(a1, a2, v4);
}

uint64_t sub_100053A0C(uint64_t a1)
{
  uint64_t v2 = sub_1000621F0();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t sub_100053A70(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000621F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_100053AD4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000621F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_100053B38(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000621F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_100053B9C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000621F0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_100053C00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100053C14);
}

uint64_t sub_100053C14(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000621F0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t sub_100053C80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100053C94);
}

uint64_t sub_100053C94(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000621F0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

uint64_t type metadata accessor for VoiceMailAnalyticsLogger(uint64_t a1)
{
  return sub_100053D24(a1, qword_1000A1908);
}

uint64_t sub_100053D24(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100053D5C()
{
  uint64_t result = sub_1000621F0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_100053DEC(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  void *v8 = v2;
  v8[1] = sub_100036550;
  return sub_1000538D0(a1, v4, v5, v7, v6);
}

uint64_t sub_100053EAC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  void *v4 = v3;
  v4[1] = sub_100036550;
  return v6();
}

uint64_t sub_100053F78(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  void *v5 = v4;
  v5[1] = sub_100036550;
  return v7();
}

uint64_t sub_100054044(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100062450();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_100062440();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_1000556F8(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1000623E0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_1000541E8(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_1000542C4;
  return v6(a1);
}

uint64_t sub_1000542C4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  unint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

char *sub_1000543BC(char *result, int64_t a2, char a3, char *a4)
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
      sub_100035DD8(&qword_1000A1BB0);
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
    sub_100056614(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

char *sub_1000544CC(char *result, int64_t a2, char a3, char *a4)
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
      sub_100035DD8(&qword_1000A1BC0);
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
    sub_100056508(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_1000545DC(void *result, int64_t a2, char a3, void *a4)
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
      sub_100035DD8(&qword_1000A1B08);
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
    sub_100056720(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

unint64_t sub_1000546EC(uint64_t a1)
{
  sub_100061DD0();
  sub_100056B90(&qword_1000A0FA8, (void (*)(uint64_t))&type metadata accessor for TPTipsHelper.Entry.Kind);
  uint64_t v2 = sub_1000622A0();

  return sub_100054840(a1, v2);
}

unint64_t sub_100054784(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_100062560(*(void *)(v2 + 40));

  return sub_100054A00(a1, v4);
}

unint64_t sub_1000547C8(uint64_t a1, uint64_t a2)
{
  sub_1000628D0();
  sub_100062330();
  Swift::Int v4 = sub_1000628F0();

  return sub_100054B0C(a1, a2, v4);
}

unint64_t sub_100054840(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a1;
  uint64_t v4 = sub_100061DD0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = v2;
  uint64_t v8 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v9 = a2 & ~v8;
  uint64_t v18 = v2 + 64;
  if ((*(void *)(v2 + 64 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9))
  {
    uint64_t v10 = ~v8;
    uint64_t v13 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    uint64_t v12 = v5 + 16;
    int64_t v11 = v13;
    uint64_t v14 = *(void *)(v12 + 56);
    do
    {
      v11(v7, *(void *)(v20 + 48) + v14 * v9, v4);
      sub_100056B90(&qword_1000A1BD0, (void (*)(uint64_t))&type metadata accessor for TPTipsHelper.Entry.Kind);
      char v15 = sub_1000622C0();
      (*(void (**)(char *, uint64_t))(v12 - 8))(v7, v4);
      if (v15) {
        break;
      }
      unint64_t v9 = (v9 + 1) & v10;
    }
    while (((*(void *)(v18 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) != 0);
  }
  return v9;
}

unint64_t sub_100054A00(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t i = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    type metadata accessor for MessageID(0);
    id v6 = *(id *)(*(void *)(v2 + 48) + 8 * i);
    char v7 = sub_100062570();

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = ~v4;
      for (unint64_t i = (i + 1) & v8; ((*(void *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v8)
      {
        id v9 = *(id *)(*(void *)(v2 + 48) + 8 * i);
        char v10 = sub_100062570();

        if (v10) {
          break;
        }
      }
    }
  }
  return i;
}

unint64_t sub_100054B0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    char v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_100062850() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_100062850() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_100054BF0(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100054C94(a1, a2, a3, (void *)*v3, &qword_1000A1BB0, &qword_1000A1BB8);
  uint64_t *v3 = result;
  return result;
}

uint64_t sub_100054C20(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100054E24(a1, a2, a3, (void *)*v3);
  uint64_t *v3 = result;
  return result;
}

uint64_t sub_100054C40(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100054FB0(a1, a2, a3, *v3);
  uint64_t *v3 = (char *)result;
  return result;
}

uint64_t sub_100054C60(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100055120(a1, a2, a3, (void *)*v3);
  uint64_t *v3 = result;
  return result;
}

uint64_t sub_100054C80(char a1, int64_t a2, char a3, void *a4)
{
  return sub_100054C94(a1, a2, a3, a4, &qword_1000A13C8, &qword_1000A13B8);
}

uint64_t sub_100054C94(char a1, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t *a6)
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
    sub_100035DD8(a5);
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
    sub_100035DD8(a6);
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_32:
  uint64_t result = sub_1000627F0();
  __break(1u);
  return result;
}

uint64_t sub_100054E24(char a1, int64_t a2, char a3, void *a4)
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
    sub_100035DD8(&qword_1000A1BA8);
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
    sub_100035DD8(&qword_1000A13F8);
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_1000627F0();
  __break(1u);
  return result;
}

uint64_t sub_100054FB0(char a1, int64_t a2, char a3, char *a4)
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
    sub_100035DD8(&qword_1000A1BA0);
    int64_t v10 = (char *)swift_allocObject();
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
    int64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  unint64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
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
  uint64_t result = sub_1000627F0();
  __break(1u);
  return result;
}

uint64_t sub_100055120(char a1, int64_t a2, char a3, void *a4)
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
  sub_100035DD8(&qword_1000A1960);
  uint64_t v10 = *(void *)(sub_100061D90() - 8);
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
  uint64_t v16 = *(void *)(sub_100061D90() - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  uint64_t v18 = (char *)v13 + v17;
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
  uint64_t result = sub_1000627F0();
  __break(1u);
  return result;
}

uint64_t sub_100055364(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  void *v8 = v2;
  v8[1] = sub_100036550;
  return sub_100053800(a1, v4, v5, v7, v6);
}

uint64_t sub_100055428(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  void *v8 = v2;
  v8[1] = sub_100036040;
  return sub_100053594(a1, v4, v5, v7, v6);
}

uint64_t sub_1000554EC()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100055534(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  void *v8 = v2;
  v8[1] = sub_100036550;
  return sub_1000534C4(a1, v4, v5, v7, v6);
}

uint64_t sub_1000555F4()
{
  _Block_release(*(const void **)(v0 + 16));
  _Block_release(*(const void **)(v0 + 24));
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10005563C()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_100036550;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_1000A19B0 + dword_1000A19B0);
  return v6(v2, v3, v4);
}

uint64_t sub_1000556F8(uint64_t a1)
{
  uint64_t v2 = sub_100035DD8(&qword_1000A0F50);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100055758()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100055790(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_100036550;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1000A19D0 + dword_1000A19D0);
  return v6(a1, v4);
}

uint64_t sub_100055848()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100055884()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_100036550;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_1000A19E0 + dword_1000A19E0);
  return v6(v2, v3, v4);
}

uint64_t sub_100055944()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_100036550;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_1000A1A00 + dword_1000A1A00);
  return v6(v2, v3, v4);
}

uint64_t sub_100055A04()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_100036550;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_1000A1A20 + dword_1000A1A20);
  return v6(v2, v3, v4);
}

uint64_t sub_100055AC4()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_100036550;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_1000A1A40 + dword_1000A1A40);
  return v6(v2, v3, v4);
}

uint64_t sub_100055B80()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100055BB8()
{
  swift_release();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 33, 7);
}

uint64_t sub_100055BF8()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = *(void *)(v0 + 24);
  char v4 = *(unsigned char *)(v0 + 32);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_100036550;
  return sub_100048B1C(v2, v3, v4);
}

uint64_t sub_100055CA4()
{
  uint64_t v2 = *(void *)(sub_1000621F0() - 8);
  uint64_t v3 = *(void *)(v0 + 16);
  uint64_t v4 = v0 + ((*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_100036550;
  return sub_10004EAA0(v3, v4);
}

uint64_t sub_100055D7C()
{
  uint64_t v1 = sub_1000621F0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_100055E48()
{
  uint64_t v2 = *(void *)(sub_1000621F0() - 8);
  uint64_t v3 = *(void *)(v0 + 16);
  uint64_t v4 = v0 + ((*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_100036550;
  return sub_10004E820(v3, v4);
}

uint64_t sub_100055F20()
{
  uint64_t v2 = *(void *)(sub_1000621F0() - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = *(void *)(v0 + 16);
  uint64_t v5 = v0 + v3;
  uint64_t v6 = *(void *)(v0 + ((*(void *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v7;
  void *v7 = v1;
  v7[1] = sub_100036550;
  return sub_10004DCA0(v4, v5, v6);
}

unint64_t sub_10005602C(unint64_t result)
{
  if (result >= 2) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

unint64_t sub_10005603C(unint64_t result)
{
  if (result >= 2) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_100056050()
{
  uint64_t v2 = *(void *)(sub_1000621F0() - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = *(void *)(v0 + 16);
  uint64_t v5 = v0 + v3;
  uint64_t v6 = *(void *)(v0 + ((*(void *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v7;
  void *v7 = v1;
  v7[1] = sub_100036550;
  return sub_10004D278(v4, v5, v6);
}

uint64_t sub_100056160()
{
  uint64_t v2 = *(void *)(sub_1000621F0() - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = *(void *)(v0 + 16);
  uint64_t v5 = v0 + v3;
  uint64_t v6 = *(void *)(v0 + ((*(void *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v7;
  void *v7 = v1;
  v7[1] = sub_100036550;
  return sub_10004C67C(v4, v5, v6);
}

uint64_t sub_100056270()
{
  uint64_t v1 = sub_1000621F0();
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

uint64_t sub_100056358()
{
  uint64_t v2 = *(void *)(sub_1000621F0() - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = *(void *)(v0 + 16);
  uint64_t v5 = v0 + v3;
  uint64_t v6 = *(void *)(v0 + ((*(void *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v7;
  void *v7 = v1;
  v7[1] = sub_100036550;
  return sub_10004B59C(v4, v5, v6);
}

uint64_t sub_100056464()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10005649C()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_1000564A4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000564B4()
{
  return swift_release();
}

uint64_t sub_1000564BC(uint64_t a1, unint64_t *a2)
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

uint64_t sub_1000564F8()
{
  return swift_release();
}

uint64_t sub_100056500(uint64_t a1)
{
  return sub_100039F80(a1, *(void *)(v1 + 16));
}

uint64_t sub_100056508(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      sub_100035DD8(&qword_1000A1BC8);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_1000627F0();
  __break(1u);
  return result;
}

uint64_t sub_100056614(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      sub_100035DD8(&qword_1000A1BB8);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_1000627F0();
  __break(1u);
  return result;
}

uint64_t sub_100056720(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      sub_100035DD8(&qword_1000A1B10);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_1000627F0();
  __break(1u);
  return result;
}

uint64_t sub_10005682C(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_10005683C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_10005689C()
{
  unint64_t result = qword_1000A1B30;
  if (!qword_1000A1B30)
  {
    sub_10003624C(&qword_1000A1B28);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000A1B30);
  }
  return result;
}

uint64_t sub_1000568F8(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_100036550;
  return sub_1000493F0(a1, v1);
}

uint64_t sub_100056994()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_1000569D4(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_100036040;
  return sub_10004958C(a1, v4, v5, v6);
}

uint64_t sub_100056A8C()
{
  _Block_release(*(const void **)(v0 + 24));
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100056AD4()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  void *v5 = v1;
  v5[1] = sub_100036550;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_1000A1B80 + dword_1000A1B80);
  return v6(v2, v3, v4);
}

uint64_t sub_100056B90(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100056BF0()
{
  uint64_t v0 = sub_100062510();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100062520();
  __chkstk_darwin(v4);
  uint64_t v5 = sub_100062280();
  __chkstk_darwin(v5 - 8);
  sub_1000570A8();
  sub_100062270();
  v7[1] = _swiftEmptyArrayStorage;
  sub_1000570E8(&qword_1000A1CA0, 255, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue_serial.Attributes);
  sub_100035DD8(&qword_1000A1CA8);
  sub_100057130();
  sub_1000625C0();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for OS_dispatch_queue.AutoreleaseFrequency.workItem(_:), v0);
  uint64_t result = sub_100062530();
  qword_1000A2E40 = result;
  return result;
}

uint64_t sub_100056E48()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for VoicemailActor()
{
  return self;
}

uint64_t sub_100056E7C()
{
  if (qword_1000A0E88 != -1) {
    swift_once();
  }
  return sub_100062540();
}

uint64_t sub_100056ED4()
{
  return swift_initStaticObject();
}

uint64_t sub_100056EE4()
{
  return static GlobalActor.sharedUnownedExecutor.getter(v0);
}

id sub_100056F2C()
{
  if (qword_1000A0E88 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_1000A2E40;
  qword_1000A2E48 = qword_1000A2E40;

  return v0;
}

id sub_100056FB4(uint64_t a1, uint64_t a2, void *a3, void **a4)
{
  if (*a3 != -1) {
    swift_once();
  }
  uint64_t v5 = *a4;

  return v5;
}

id sub_100057004()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for VoicemailQueueManager();
  return [super dealloc];
}

uint64_t type metadata accessor for VoicemailQueueManager()
{
  return self;
}

uint64_t sub_100057060(uint64_t a1, uint64_t a2)
{
  return sub_1000570E8((unint64_t *)&qword_1000A1510, a2, (void (*)(uint64_t))type metadata accessor for VoicemailActor);
}

unint64_t sub_1000570A8()
{
  unint64_t result = qword_1000A1C98;
  if (!qword_1000A1C98)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1000A1C98);
  }
  return result;
}

uint64_t sub_1000570E8(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

unint64_t sub_100057130()
{
  unint64_t result = qword_1000A1CB0;
  if (!qword_1000A1CB0)
  {
    sub_10003624C(&qword_1000A1CA8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000A1CB0);
  }
  return result;
}

uint64_t sub_100057354()
{
  return type metadata accessor for FTTranscriptionMessage(0);
}

uint64_t type metadata accessor for FTTranscriptionMessage(uint64_t a1)
{
  return sub_100053D24(a1, (uint64_t *)&unk_1000A1CF0);
}

uint64_t sub_10005737C()
{
  uint64_t result = sub_100062190();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

BOOL sub_100057560(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_100057574()
{
  Swift::UInt v1 = *v0;
  sub_1000628D0();
  sub_1000628E0(v1);
  return sub_1000628F0();
}

void sub_1000575BC()
{
  sub_1000628E0(*v0);
}

Swift::Int sub_1000575E8()
{
  Swift::UInt v1 = *v0;
  sub_1000628D0();
  sub_1000628E0(v1);
  return sub_1000628F0();
}

uint64_t sub_1000579FC()
{
  LOWORD(result) = sub_100061FB0();
  if ((unsigned __int16)result < 3u) {
    return (unsigned __int16)result;
  }
  sub_100062680(23);
  swift_bridgeObjectRelease();
  sub_100061FB0();
  sub_100062090();
  v1._countAndFlagsBits = sub_100062320();
  sub_100062340(v1);
  swift_bridgeObjectRelease();
  uint64_t result = sub_100062790();
  __break(1u);
  return result;
}

id sub_100057BE4(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  swift_retain();
  a4(a3);
  uint64_t v7 = v6;
  swift_release();
  if (v7)
  {
    NSString v8 = sub_1000622D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v8 = 0;
  }

  return v8;
}

uint64_t sub_100057C70(SEL *a1)
{
  if (sub_100061FC0()) {
    return 0;
  }
  sub_100061FE0();
  objc_super v2 = self;
  NSString v3 = sub_1000622D0();
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
  uint64_t v7 = sub_100062300();

  return v7;
}

uint64_t sub_100057D90(SEL *a1)
{
  sub_100062050();
  if (!v2) {
    return 0;
  }
  NSString v3 = self;
  NSString v4 = sub_1000622D0();
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
  uint64_t v8 = sub_100062300();

  return v8;
}

uint64_t sub_100057EEC()
{
  if (*(unsigned char *)(v0 + 32) != 1) {
    return *(void *)(v0 + 24);
  }
  int v1 = (unsigned __int16)sub_100061FA0();
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

uint64_t sub_100057F84()
{
  if (*(unsigned char *)(v0 + OBJC_IVAR____TtC9IntentsUI9FTMessage_isDirty) == 1)
  {
    return sub_100057EEC();
  }
  else
  {
    int v2 = (unsigned __int16)sub_100061FA0();
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

uint64_t sub_100058010()
{
  int v1 = *(unsigned __int8 *)(v0 + 33);
  if (v1 == 2)
  {
    char v2 = sub_100062000();
    *(unsigned char *)(v0 + 33) = v2 & 1;
  }
  else
  {
    char v2 = v1 & 1;
  }
  return v2 & 1;
}

void sub_1000581F0()
{
  uint64_t v1 = sub_100035DD8(&qword_1000A16F8);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)&v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100035DD8(&qword_1000A1AB0);
  __chkstk_darwin(v4 - 8);
  id v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (sub_100058490() == 2 && (sub_100061FF0() & 1) != 0 && TUCallScreeningRTTEnabled())
  {
    if (*(unsigned char *)(v0 + OBJC_IVAR____TtC9IntentsUI9FTMessage_didLoadTranscript) == 1 && sub_100058688())
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
    int v10 = sub_100058490();
    if (v10)
    {
      if (v10 == 1) {
        return;
      }
      sub_1000586F8((uint64_t)v6);
      uint64_t v14 = sub_100062190();
      (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v14 - 8) + 48))(v6, 1, v14);
      unint64_t v12 = &qword_1000A1AB0;
      uint64_t v13 = (uint64_t)v6;
    }
    else
    {
      sub_10005903C(&OBJC_IVAR____TtC9IntentsUI9FTMessage____lazy_storage___transcriptURL, (uint64_t (*)(uint64_t))&dispatch thunk of Message.sandboxTranscriptFile.getter, (uint64_t)v3);
      uint64_t v11 = sub_100061CD0();
      (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48))(v3, 1, v11);
      unint64_t v12 = &qword_1000A16F8;
      uint64_t v13 = (uint64_t)v3;
    }
    sub_1000363BC(v13, v12);
  }
}

uint64_t sub_100058490()
{
  unsigned __int16 v0 = sub_100061FB0();
  if (v0 < 3u) {
    return 0x10002u >> (8 * v0);
  }
  if (qword_1000A0EA0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_1000621F0();
  sub_100034CF4(v2, (uint64_t)qword_1000A2E88);
  swift_retain_n();
  uint64_t v3 = sub_1000621D0();
  os_log_type_t v4 = sub_1000624E0();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136446210;
    sub_100061FB0();
    uint64_t v6 = sub_100062310();
    sub_10005B9C0(v6, v7, &v8);
    sub_100062590();
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

uint64_t sub_100058688()
{
  uint64_t v1 = OBJC_IVAR____TtC9IntentsUI9FTMessage____lazy_storage___transcript;
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC9IntentsUI9FTMessage____lazy_storage___transcript);
  uint64_t v3 = v2;
  if (v2 == 1)
  {
    uint64_t v3 = (uint64_t)sub_100059954(v0);
    uint64_t v4 = *(void *)(v0 + v1);
    *(void *)(v0 + v1) = v3;
    swift_unknownObjectRetain();
    sub_10005C074(v4);
  }
  sub_10005C084(v2);
  return v3;
}

uint64_t sub_1000586F8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_100035DD8(&qword_1000A1E98);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v6 = &v13[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v4);
  uint64_t v8 = &v13[-v7];
  uint64_t v9 = v1 + OBJC_IVAR____TtC9IntentsUI9FTMessage____lazy_storage___transcriptData;
  swift_beginAccess();
  sub_10005C0EC(v9, (uint64_t)v8, &qword_1000A1E98);
  uint64_t v10 = sub_100035DD8(&qword_1000A1AB0);
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v11 + 48))(v8, 1, v10) != 1) {
    return sub_10005C1B4((uint64_t)v8, a1, &qword_1000A1AB0);
  }
  sub_1000363BC((uint64_t)v8, &qword_1000A1E98);
  sub_100061F70();
  sub_10005C0EC(a1, (uint64_t)v6, &qword_1000A1AB0);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v11 + 56))(v6, 0, 1, v10);
  swift_beginAccess();
  sub_10005C150((uint64_t)v6, v9, &qword_1000A1E98);
  return swift_endAccess();
}

uint64_t sub_1000589A4()
{
  int v1 = *(unsigned __int8 *)(v0 + 34);
  if (v1 != 2) {
    return v1 & 1;
  }
  uint64_t result = 0;
  *(unsigned char *)(v0 + 34) = 0;
  return result;
}

uint64_t sub_100058B1C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_100035DD8(&qword_1000A16F8);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v27 - v8;
  uint64_t v10 = sub_100035DD8(&qword_1000A1EA0);
  uint64_t v11 = __chkstk_darwin(v10 - 8);
  uint64_t v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v27 - v14;
  uint64_t v16 = v1 + OBJC_IVAR____TtC9IntentsUI9FTMessage____lazy_storage___dataURL;
  swift_beginAccess();
  sub_10005C0EC(v16, (uint64_t)v15, &qword_1000A1EA0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v15, 1, v3) == 1)
  {
    sub_1000363BC((uint64_t)v15, &qword_1000A1EA0);
    unint64_t v17 = (void *)sub_100061F50();
    uint64_t v18 = (void *)sub_1000621B0();

    if (v18)
    {
      uint64_t v28 = a1;
      uint64_t v19 = sub_100061CD0();
      uint64_t v27 = *(void *)(v19 - 8);
      uint64_t v20 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v27 + 56);
      v20(v7, 1, 1, v19);
      sub_10005C218(&qword_1000A1EA8, (void (*)(uint64_t))&type metadata accessor for URL);
      sub_100062810();

      uint64_t v21 = v20;
      uint64_t v22 = v27;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48))(v7, 1, v19) == 1)
      {
        unint64_t v23 = v9;
        uint64_t v24 = 1;
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v9, v7, v19);
        unint64_t v23 = v9;
        uint64_t v24 = 0;
      }
      v21(v23, v24, 1, v19);
      a1 = v28;
    }
    else
    {
      uint64_t v25 = sub_100061CD0();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v9, 1, 1, v25);
    }
    sub_10005C0EC((uint64_t)v9, (uint64_t)v13, &qword_1000A16F8);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v4 + 56))(v13, 0, 1, v3);
    swift_beginAccess();
    sub_10005C150((uint64_t)v13, v16, &qword_1000A1EA0);
    swift_endAccess();
  }
  else
  {
    uint64_t v9 = v15;
  }
  return sub_10005C1B4((uint64_t)v9, a1, &qword_1000A16F8);
}

uint64_t sub_10005903C@<X0>(void *a1@<X0>, uint64_t (*a2)(uint64_t)@<X1>, uint64_t a3@<X8>)
{
  uint64_t v33 = a3;
  uint64_t v6 = sub_100035DD8(&qword_1000A16F8);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v32 - v11;
  uint64_t v13 = sub_100035DD8(&qword_1000A1EA0);
  uint64_t v14 = __chkstk_darwin(v13 - 8);
  uint64_t v16 = (char *)&v32 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v32 - v17;
  uint64_t v19 = v3 + *a1;
  swift_beginAccess();
  sub_10005C0EC(v19, (uint64_t)v18, &qword_1000A1EA0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v18, 1, v6) == 1)
  {
    uint64_t v20 = sub_1000363BC((uint64_t)v18, &qword_1000A1EA0);
    uint64_t v21 = a2(v20);
    if (v21 && (uint64_t v22 = (void *)v21, v23 = (void *)sub_1000621B0(), v22, v23))
    {
      uint64_t v24 = sub_100061CD0();
      uint64_t v25 = *(void *)(v24 - 8);
      uint64_t v32 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v25 + 56);
      v32(v10, 1, 1, v24);
      sub_10005C218(&qword_1000A1EA8, (void (*)(uint64_t))&type metadata accessor for URL);
      sub_100062810();

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
      uint64_t v30 = sub_100061CD0();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v12, 1, 1, v30);
      uint64_t v27 = v33;
    }
    sub_10005C0EC((uint64_t)v12, (uint64_t)v16, &qword_1000A16F8);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v16, 0, 1, v6);
    swift_beginAccess();
    sub_10005C150((uint64_t)v16, v19, &qword_1000A1EA0);
    swift_endAccess();
  }
  else
  {
    uint64_t v12 = v18;
    uint64_t v27 = v33;
  }
  return sub_10005C1B4((uint64_t)v12, v27, &qword_1000A16F8);
}

uint64_t sub_100059428(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v7 = sub_100035DD8(&qword_1000A1EA0);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100035DD8(&qword_1000A16F8);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_100061CB0();
    uint64_t v14 = sub_100061CD0();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v13, 0, 1, v14);
  }
  else
  {
    uint64_t v15 = sub_100061CD0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v13, 1, 1, v15);
  }
  sub_10005C1B4((uint64_t)v13, (uint64_t)v9, &qword_1000A16F8);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v9, 0, 1, v10);
  uint64_t v16 = a1 + *a4;
  swift_beginAccess();
  swift_retain();
  sub_10005C150((uint64_t)v9, v16, &qword_1000A1EA0);
  swift_endAccess();
  return swift_release();
}

uint64_t sub_10005964C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = swift_retain();
  LOBYTE(a3) = a3(v4);
  swift_release();
  return a3 & 1;
}

uint64_t sub_1000596B0(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = swift_retain();
  LOBYTE(a3) = a3(v4);
  swift_release();
  return a3 & 1;
}

id sub_1000596F0()
{
  uint64_t v0 = sub_100035DD8(&qword_1000A16F8);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v11 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_100061CD0();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100058B1C((uint64_t)v2);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) == 1)
  {
    sub_1000363BC((uint64_t)v2, &qword_1000A16F8);
    return 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v6, v2, v3);
    id v8 = [self defaultManager];
    sub_100061CC0();
    NSString v9 = sub_1000622D0();
    swift_bridgeObjectRelease();
    id v7 = [v8 fileExistsAtPath:v9];

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  return v7;
}

id sub_100059954(uint64_t a1)
{
  uint64_t v2 = sub_100035DD8(&qword_1000A16F8);
  uint64_t v3 = __chkstk_darwin(v2);
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v41 - v4;
  uint64_t v6 = sub_100061CD0();
  uint64_t v46 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  id v8 = (char *)&v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100035DD8(&qword_1000A1AB0);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v41 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100062190();
  uint64_t v45 = *(void *)(v12 - 8);
  uint64_t v13 = __chkstk_darwin(v12);
  uint64_t v44 = (char *)&v41 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v43 = (char *)&v41 - v15;
  uint64_t v16 = sub_100061D90();
  uint64_t v42 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  uint64_t v18 = (char *)&v41 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v47 = a1;
  int v19 = sub_100058490();
  if (!v19)
  {
    uint64_t v24 = v8;
    sub_10005903C(&OBJC_IVAR____TtC9IntentsUI9FTMessage____lazy_storage___transcriptURL, (uint64_t (*)(uint64_t))&dispatch thunk of Message.sandboxTranscriptFile.getter, (uint64_t)v5);
    uint64_t v25 = v46;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v46 + 48))(v5, 1, v6) == 1)
    {
      sub_1000363BC((uint64_t)v5, &qword_1000A16F8);
      id v20 = 0;
      uint64_t v21 = v47;
      goto LABEL_13;
    }
    (*(void (**)(char *, char *, uint64_t))(v25 + 32))(v8, v5, v6);
    uint64_t v33 = sub_100061CE0();
    unint64_t v35 = v34;
    sub_1000564BC(0, &qword_1000A1E88);
    sub_1000564BC(0, &qword_1000A1E90);
    uint64_t v36 = sub_100062500();
    uint64_t v21 = v47;
    uint64_t v38 = v36;
    if (v36)
    {
      id v39 = (objc_class *)type metadata accessor for VisualTranscriptionMessage();
      uint64_t v40 = (char *)objc_allocWithZone(v39);
      *(void *)&v40[OBJC_IVAR___MPVisualTranscriptionMessage_vmTranscript] = v38;
      v49.receiver = v40;
      v49.super_class = v39;
      [super init];
      sub_10005C094(v33, v35);
      (*(void (**)(char *, uint64_t))(v46 + 8))(v24, v6);
      goto LABEL_13;
    }
    (*(void (**)(char *, uint64_t))(v46 + 8))(v24, v6);
    sub_10005C094(v33, v35);
    goto LABEL_12;
  }
  id v20 = 0;
  uint64_t v21 = v47;
  if (v19 != 1)
  {
    if ((sub_100061FF0() & 1) != 0 && TUCallScreeningRTTEnabled())
    {
      sub_100062010();
      id v22 = objc_allocWithZone((Class)MPRTTTranscriptionMessage);
      Class isa = sub_100061D40().super.isa;
      id v20 = [v22 initWithCallUUID:isa];

      (*(void (**)(char *, uint64_t))(v42 + 8))(v18, v16);
      goto LABEL_13;
    }
    sub_1000586F8((uint64_t)v11);
    uint64_t v26 = v45;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v45 + 48))(v11, 1, v12) != 1)
    {
      uint64_t v27 = v43;
      (*(void (**)(char *, char *, uint64_t))(v26 + 32))(v43, v11, v12);
      uint64_t v28 = *(void (**)(char *, char *, uint64_t))(v26 + 16);
      uint64_t v29 = v44;
      v28(v44, v27, v12);
      uint64_t v30 = (objc_class *)type metadata accessor for FTTranscriptionMessage(0);
      char v31 = (char *)objc_allocWithZone(v30);
      *(void *)&v31[OBJC_IVAR____TtC9IntentsUI22FTTranscriptionMessage_confidenceRating] = 0;
      *(void *)&v31[OBJC_IVAR____TtC9IntentsUI22FTTranscriptionMessage_confidence] = 0x3FF0000000000000;
      v28(&v31[OBJC_IVAR____TtC9IntentsUI22FTTranscriptionMessage_transcriptData], v29, v12);
      v48.receiver = v31;
      v48.super_class = v30;
      id v20 = [super init];
      uint64_t v32 = *(void (**)(char *, uint64_t))(v26 + 8);
      v32(v29, v12);
      v32(v27, v12);
      goto LABEL_13;
    }
    sub_1000363BC((uint64_t)v11, &qword_1000A1AB0);
LABEL_12:
    id v20 = 0;
  }
LABEL_13:
  *(unsigned char *)(v21 + OBJC_IVAR____TtC9IntentsUI9FTMessage_didLoadTranscript) = 1;
  return v20;
}

uint64_t sub_10005A1F4(uint64_t a1)
{
  *(void *)(v1 + 24) = 0;
  *(unsigned char *)(v1 + 32) = 1;
  *(_WORD *)(v1 + 33) = 514;
  uint64_t v3 = v1 + OBJC_IVAR____TtC9IntentsUI9FTMessage____lazy_storage___dataURL;
  uint64_t v4 = sub_100035DD8(&qword_1000A16F8);
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  v5(v3, 1, 1, v4);
  v5(v1 + OBJC_IVAR____TtC9IntentsUI9FTMessage____lazy_storage___thumbnailURL, 1, 1, v4);
  v5(v1 + OBJC_IVAR____TtC9IntentsUI9FTMessage____lazy_storage___transcriptURL, 1, 1, v4);
  uint64_t v6 = v1 + OBJC_IVAR____TtC9IntentsUI9FTMessage____lazy_storage___transcriptData;
  uint64_t v7 = sub_100035DD8(&qword_1000A1AB0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  *(void *)(v1 + OBJC_IVAR____TtC9IntentsUI9FTMessage____lazy_storage___transcript) = 1;
  *(unsigned char *)(v1 + OBJC_IVAR____TtC9IntentsUI9FTMessage_didLoadTranscript) = 0;
  *(unsigned char *)(v1 + OBJC_IVAR____TtC9IntentsUI9FTMessage_isDirty) = 0;
  *(void *)(v1 + 16) = a1;
  return v1;
}

uint64_t sub_10005A358()
{
  sub_1000363BC((uint64_t)v0 + OBJC_IVAR____TtC9IntentsUI9FTMessage____lazy_storage___dataURL, &qword_1000A1EA0);
  sub_1000363BC((uint64_t)v0 + OBJC_IVAR____TtC9IntentsUI9FTMessage____lazy_storage___thumbnailURL, &qword_1000A1EA0);
  sub_1000363BC((uint64_t)v0 + OBJC_IVAR____TtC9IntentsUI9FTMessage____lazy_storage___transcriptURL, &qword_1000A1EA0);
  sub_1000363BC((uint64_t)v0 + OBJC_IVAR____TtC9IntentsUI9FTMessage____lazy_storage___transcriptData, &qword_1000A1E98);
  sub_10005C074(*(uint64_t *)((char *)v0 + OBJC_IVAR____TtC9IntentsUI9FTMessage____lazy_storage___transcript));
  uint64_t v1 = *((unsigned int *)*v0 + 12);
  uint64_t v2 = *((unsigned __int16 *)*v0 + 26);

  return _swift_deallocClassInstance(v0, v1, v2);
}

uint64_t sub_10005A428()
{
  return type metadata accessor for FTMessage(0);
}

uint64_t type metadata accessor for FTMessage(uint64_t a1)
{
  return sub_100053D24(a1, (uint64_t *)&unk_1000A1D60);
}

void sub_10005A450()
{
  sub_10005A574(319, (unint64_t *)&unk_1000A1D70, &qword_1000A16F8);
  if (v0 <= 0x3F)
  {
    sub_10005A574(319, qword_1000A1D80, &qword_1000A1AB0);
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

void sub_10005A574(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  if (!*a2)
  {
    sub_10003624C(a3);
    unint64_t v4 = sub_100062580();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

BOOL sub_10005A5C4(double a1)
{
  if (*(unsigned char *)(v1 + OBJC_IVAR____TtC9IntentsUI9FTMessage_isDirty))
  {
    if ((sub_100058010() & 1) == 0) {
      goto LABEL_3;
    }
    return 0;
  }
  if (sub_100062000()) {
    return 0;
  }
LABEL_3:
  if (a1 > 5.0) {
    return 1;
  }
  sub_100062020();
  return v4 / 3.0 < a1;
}

id sub_10005A694(void *a1)
{
  if (sub_100061FC0()) {
    return 0;
  }
  sub_100061FE0();
  uint64_t v2 = self;
  NSString v3 = sub_1000622D0();
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
  uint64_t v7 = sub_100062300();
  unint64_t v9 = v8;

  swift_bridgeObjectRelease();
  uint64_t v10 = HIBYTE(v9) & 0xF;
  if ((v9 & 0x2000000000000000) == 0) {
    uint64_t v10 = v7 & 0xFFFFFFFFFFFFLL;
  }
  if (!v10) {
    return 0;
  }
  sub_100061FE0();
  NSString v11 = sub_1000622D0();
  swift_bridgeObjectRelease();
  sub_100035DD8(&qword_1000A16F0);
  Class isa = sub_100062370().super.isa;
  id v13 = [a1 contactForDestinationId:v11 keysToFetch:isa];

  return v13;
}

uint64_t sub_10005A890(void *a1)
{
  uint64_t v2 = sub_100061FE0();
  unint64_t v4 = v3;
  swift_bridgeObjectRelease();
  uint64_t v5 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0) {
    uint64_t v5 = v2 & 0xFFFFFFFFFFFFLL;
  }
  if (!v5) {
    return 0;
  }
  sub_100035DD8((uint64_t *)&unk_1000A1EB0);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_100085330;
  uint64_t v7 = self;
  *(void *)(v6 + 32) = [v7 descriptorForRequiredKeysForStyle:0];
  sub_1000623A0();
  id v8 = sub_10005A694(a1);
  swift_bridgeObjectRelease();
  if (!v8) {
    return sub_10005AA10();
  }
  if (([v8 isSuggested] & 1) == 0)
  {
    id v10 = [v7 stringFromContact:v8 style:0];
    if (v10)
    {
      NSString v11 = v10;
      uint64_t v9 = sub_100062300();

      return v9;
    }

    return 0;
  }
  uint64_t v9 = sub_10005AA10();

  return v9;
}

uint64_t sub_10005AA10()
{
  unint64_t v0 = self;
  sub_100061FE0();
  NSString v1 = sub_1000622D0();
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
  uint64_t v6 = sub_100062300();

  return v6;
}

uint64_t sub_10005ABA8()
{
  uint64_t v92 = sub_100035DD8(&qword_1000A16F8);
  __chkstk_darwin(v92);
  uint64_t v91 = (uint64_t)v84 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_100061D20();
  uint64_t v89 = *(void *)(v2 - 8);
  uint64_t v90 = v2;
  __chkstk_darwin(v2);
  unint64_t v88 = (char *)v84 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v87 = sub_100035DD8(&qword_1000A1958);
  __chkstk_darwin(v87);
  uint64_t v85 = (char *)v84 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100061D90();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)v84 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  NSString v11 = (char *)v84 - v10;
  uint64_t v96 = 0;
  unint64_t v97 = 0xE000000000000000;
  sub_100062680(699);
  v98._countAndFlagsBits = 0xD00000000000001ALL;
  uint64_t v86 = 0xD00000000000001ALL;
  v98._object = (void *)0x8000000100071A60;
  sub_100062340(v98);
  id v12 = *(id *)(v0 + 16);
  id v13 = [v12 description];
  uint64_t v14 = sub_100062300();
  uint64_t v16 = v15;

  v99._countAndFlagsBits = v14;
  v99._object = v16;
  sub_100062340(v99);

  swift_bridgeObjectRelease();
  v100._countAndFlagsBits = 0x3A6469202020200ALL;
  v100._object = (void *)0xE900000000000020;
  sub_100062340(v100);
  sub_100061F60();
  uint64_t v17 = *(void (**)(char *, char *, uint64_t))(v6 + 16);
  v17(v9, v11, v5);
  uint64_t v18 = (objc_class *)type metadata accessor for MessageID(0);
  int v19 = (char *)objc_allocWithZone(v18);
  v17(&v19[OBJC_IVAR___MPMessageID_value], v9, v5);
  type metadata accessor for MessageID.Value(0);
  swift_storeEnumTagMultiPayload();
  v95.receiver = v19;
  v95.super_class = v18;
  id v20 = [super init];
  uint64_t v21 = *(void (**)(char *, uint64_t))(v6 + 8);
  v21(v9, v5);
  v21(v11, v5);
  id v22 = [v20 description];
  uint64_t v23 = sub_100062300();
  uint64_t v25 = v24;

  v101._countAndFlagsBits = v23;
  v101._object = v25;
  sub_100062340(v101);

  swift_bridgeObjectRelease();
  v102._countAndFlagsBits = 0x6F7270202020200ALL;
  v102._object = (void *)0xEF203A7265646976;
  sub_100062340(v102);
  v103._countAndFlagsBits = sub_100062040();
  sub_100062340(v103);
  swift_bridgeObjectRelease();
  v104._countAndFlagsBits = 0x6C6163202020200ALL;
  v104._object = (void *)0xEF203A444955556CLL;
  sub_100062340(v104);
  uint64_t v26 = v85;
  sub_100062010();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v6 + 56))(v26, 0, 1, v5);
  uint64_t v27 = v84[1];
  v105._countAndFlagsBits = sub_100062310();
  sub_100062340(v105);
  swift_bridgeObjectRelease();
  v106._countAndFlagsBits = 0xD000000000000012;
  v106._object = (void *)0x8000000100071A80;
  sub_100062340(v106);
  uint64_t v93 = sub_1000579FC();
  sub_100062720();
  v107._object = (void *)0x8000000100071AA0;
  v107._countAndFlagsBits = v86;
  sub_100062340(v107);
  uint64_t v93 = sub_100057C70((SEL *)&selRef_normalizedValue);
  uint64_t v94 = v28;
  sub_100035DD8(&qword_1000A1E60);
  v108._countAndFlagsBits = sub_100062310();
  sub_100062340(v108);
  swift_bridgeObjectRelease();
  v109._countAndFlagsBits = 0xD00000000000001BLL;
  v109._object = (void *)0x8000000100071AC0;
  sub_100062340(v109);
  uint64_t v93 = sub_100057C70((SEL *)&selRef_isoCountryCode);
  uint64_t v94 = v29;
  v110._countAndFlagsBits = sub_100062310();
  sub_100062340(v110);
  swift_bridgeObjectRelease();
  v111._object = (void *)0x8000000100071AE0;
  v111._countAndFlagsBits = 0xD00000000000001CLL;
  sub_100062340(v111);
  uint64_t v93 = sub_100057D90((SEL *)&selRef_normalizedValue);
  uint64_t v94 = v30;
  v112._countAndFlagsBits = sub_100062310();
  sub_100062340(v112);
  swift_bridgeObjectRelease();
  v113._countAndFlagsBits = 0xD00000000000001DLL;
  v113._object = (void *)0x8000000100071B00;
  sub_100062340(v113);
  uint64_t v93 = sub_100057D90((SEL *)&selRef_isoCountryCode);
  uint64_t v94 = v31;
  v114._countAndFlagsBits = sub_100062310();
  sub_100062340(v114);
  swift_bridgeObjectRelease();
  v115._object = (void *)0x8000000100071B20;
  v115._countAndFlagsBits = 0xD00000000000001CLL;
  sub_100062340(v115);
  char v32 = sub_100061FC0();
  uint64_t v33 = 0;
  uint64_t v34 = 0;
  if ((v32 & 1) == 0) {
    uint64_t v33 = sub_100061FE0();
  }
  uint64_t v93 = v33;
  uint64_t v94 = v34;
  v116._countAndFlagsBits = sub_100062310();
  sub_100062340(v116);
  swift_bridgeObjectRelease();
  v117._countAndFlagsBits = 0xD000000000000012;
  v117._object = (void *)0x8000000100071B40;
  sub_100062340(v117);
  uint64_t v93 = sub_100057EEC();
  sub_100062720();
  v118._countAndFlagsBits = 0x6C6F66202020200ALL;
  v118._object = (void *)0xED0000203A726564;
  sub_100062340(v118);
  uint64_t v35 = OBJC_IVAR____TtC9IntentsUI9FTMessage_isDirty;
  if (*(unsigned char *)(v27 + OBJC_IVAR____TtC9IntentsUI9FTMessage_isDirty) == 1)
  {
    uint64_t v36 = *(void *)(v27 + 24);
  }
  else
  {
    int v37 = (unsigned __int16)sub_100061FA0();
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
  sub_100062720();
  v119._object = (void *)0x8000000100071B60;
  v119._countAndFlagsBits = 0xD000000000000010;
  sub_100062340(v119);
  char v39 = sub_100058010();
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
  sub_100062340(v41);
  swift_bridgeObjectRelease();
  v120._countAndFlagsBits = 0x616572202020200ALL;
  v120._object = (void *)0xEB00000000203A64;
  sub_100062340(v120);
  char v43 = *(unsigned char *)(v27 + v35);
  uint64_t v87 = v35;
  if (v43)
  {
    if (*(unsigned char *)(v27 + 33))
    {
LABEL_17:
      uint64_t v44 = (void *)0xE400000000000000;
      v45._countAndFlagsBits = 1702195828;
      goto LABEL_20;
    }
  }
  else if (sub_100062000())
  {
    goto LABEL_17;
  }
  uint64_t v44 = (void *)0xE500000000000000;
  v45._countAndFlagsBits = 0x65736C6166;
LABEL_20:
  v45._object = v44;
  sub_100062340(v45);
  swift_bridgeObjectRelease();
  v121._object = (void *)0xEB00000000203A65;
  v121._countAndFlagsBits = 0x746164202020200ALL;
  sub_100062340(v121);
  uint64_t v46 = v88;
  sub_100061F80();
  sub_10005C218(&qword_1000A1E68, (void (*)(uint64_t))&type metadata accessor for Date);
  uint64_t v47 = v90;
  v122._countAndFlagsBits = sub_100062840();
  sub_100062340(v122);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v89 + 8))(v46, v47);
  v123._countAndFlagsBits = 0xD00000000000001FLL;
  v123._object = (void *)0x8000000100071B80;
  sub_100062340(v123);
  sub_1000581F0();
  BOOL v49 = (v48 & 1) == 0;
  if (v48) {
    v50._countAndFlagsBits = 1702195828;
  }
  else {
    v50._countAndFlagsBits = 0x65736C6166;
  }
  if (v49) {
    uint64_t v51 = (void *)0xE500000000000000;
  }
  else {
    uint64_t v51 = (void *)0xE400000000000000;
  }
  v50._object = v51;
  sub_100062340(v50);
  swift_bridgeObjectRelease();
  v124._countAndFlagsBits = 0x727564202020200ALL;
  v124._object = (void *)0xEF203A6E6F697461;
  sub_100062340(v124);
  sub_100062020();
  sub_100062490();
  v125._countAndFlagsBits = 0xD00000000000001BLL;
  v125._object = (void *)0x8000000100071BA0;
  sub_100062340(v125);
  v126._countAndFlagsBits = 0x65736C6166;
  v126._object = (void *)0xE500000000000000;
  sub_100062340(v126);
  v127._countAndFlagsBits = 0xD000000000000015;
  v127._object = (void *)0x8000000100071BC0;
  sub_100062340(v127);
  v128._countAndFlagsBits = 0x65736C6166;
  v128._object = (void *)0xE500000000000000;
  sub_100062340(v128);
  v129._countAndFlagsBits = 0xD00000000000001DLL;
  v129._object = (void *)0x8000000100071BE0;
  sub_100062340(v129);
  sub_100061FD0();
  int v52 = (unsigned __int16)sub_1000621C0();
  unsigned __int16 v53 = sub_1000621C0();
  BOOL v54 = v52 == v53;
  if (v52 == v53) {
    v55._countAndFlagsBits = 0x65736C6166;
  }
  else {
    v55._countAndFlagsBits = 1702195828;
  }
  if (v54) {
    unint64_t v56 = (void *)0xE500000000000000;
  }
  else {
    unint64_t v56 = (void *)0xE400000000000000;
  }
  v55._object = v56;
  sub_100062340(v55);
  swift_bridgeObjectRelease();
  v130._object = (void *)0x8000000100071C00;
  v130._countAndFlagsBits = 0xD000000000000010;
  sub_100062340(v130);
  sub_100061FA0();
  int v57 = (unsigned __int16)sub_1000621A0();
  unsigned __int16 v58 = sub_1000621A0();
  BOOL v59 = v57 == v58;
  if (v57 == v58) {
    v60._countAndFlagsBits = 1702195828;
  }
  else {
    v60._countAndFlagsBits = 0x65736C6166;
  }
  if (v59) {
    int v61 = (void *)0xE400000000000000;
  }
  else {
    int v61 = (void *)0xE500000000000000;
  }
  v60._object = v61;
  sub_100062340(v60);
  swift_bridgeObjectRelease();
  v131._object = (void *)0x8000000100071C20;
  v131._countAndFlagsBits = 0xD000000000000010;
  sub_100062340(v131);
  char v62 = sub_1000589A4();
  BOOL v63 = (v62 & 1) == 0;
  if (v62) {
    v64._countAndFlagsBits = 1702195828;
  }
  else {
    v64._countAndFlagsBits = 0x65736C6166;
  }
  if (v63) {
    uint64_t v65 = (void *)0xE500000000000000;
  }
  else {
    uint64_t v65 = (void *)0xE400000000000000;
  }
  v64._object = v65;
  sub_100062340(v64);
  swift_bridgeObjectRelease();
  v132._countAndFlagsBits = 0xD000000000000012;
  v132._object = (void *)0x8000000100071C40;
  sub_100062340(v132);
  char v66 = sub_100061F90();
  BOOL v67 = (v66 & 1) == 0;
  if (v66) {
    v68._countAndFlagsBits = 1702195828;
  }
  else {
    v68._countAndFlagsBits = 0x65736C6166;
  }
  if (v67) {
    uint64_t v69 = (void *)0xE500000000000000;
  }
  else {
    uint64_t v69 = (void *)0xE400000000000000;
  }
  v68._object = v69;
  sub_100062340(v68);
  swift_bridgeObjectRelease();
  v133._countAndFlagsBits = 0x746164202020200ALL;
  v133._object = (void *)0xEE00203A4C525561;
  sub_100062340(v133);
  uint64_t v70 = v91;
  sub_100058B1C(v91);
  v134._countAndFlagsBits = sub_100062310();
  sub_100062340(v134);
  swift_bridgeObjectRelease();
  v135._countAndFlagsBits = 0xD000000000000013;
  v135._object = (void *)0x8000000100071C60;
  sub_100062340(v135);
  sub_10005903C(&OBJC_IVAR____TtC9IntentsUI9FTMessage____lazy_storage___thumbnailURL, (uint64_t (*)(uint64_t))&dispatch thunk of Message.sandboxThumbnailFile.getter, v70);
  v136._countAndFlagsBits = sub_100062310();
  sub_100062340(v136);
  swift_bridgeObjectRelease();
  v137._object = (void *)0x8000000100071C80;
  v137._countAndFlagsBits = 0xD000000000000014;
  sub_100062340(v137);
  sub_10005903C(&OBJC_IVAR____TtC9IntentsUI9FTMessage____lazy_storage___transcriptURL, (uint64_t (*)(uint64_t))&dispatch thunk of Message.sandboxTranscriptFile.getter, v70);
  v138._countAndFlagsBits = sub_100062310();
  sub_100062340(v138);
  swift_bridgeObjectRelease();
  v139._countAndFlagsBits = 0x527369202020200ALL;
  v139._object = (void *)0xEC000000203A5454;
  sub_100062340(v139);
  char v71 = sub_100061FF0();
  BOOL v72 = (v71 & 1) == 0;
  if (v71) {
    v73._countAndFlagsBits = 1702195828;
  }
  else {
    v73._countAndFlagsBits = 0x65736C6166;
  }
  if (v72) {
    uint64_t v74 = (void *)0xE500000000000000;
  }
  else {
    uint64_t v74 = (void *)0xE400000000000000;
  }
  v73._object = v74;
  sub_100062340(v73);
  swift_bridgeObjectRelease();
  v140._countAndFlagsBits = 0xD000000000000016;
  v140._object = (void *)0x8000000100071CA0;
  sub_100062340(v140);
  unsigned __int8 v75 = sub_1000596F0();
  BOOL v76 = (v75 & 1) == 0;
  if (v75) {
    v77._countAndFlagsBits = 1702195828;
  }
  else {
    v77._countAndFlagsBits = 0x65736C6166;
  }
  if (v76) {
    uint64_t v78 = (void *)0xE500000000000000;
  }
  else {
    uint64_t v78 = (void *)0xE400000000000000;
  }
  v77._object = v78;
  sub_100062340(v77);
  swift_bridgeObjectRelease();
  v141._countAndFlagsBits = 0xD000000000000011;
  v141._object = (void *)0x8000000100071CC0;
  sub_100062340(v141);
  uint64_t v93 = sub_100058688();
  sub_100035DD8(&qword_1000A1E70);
  v142._countAndFlagsBits = sub_100062310();
  sub_100062340(v142);
  swift_bridgeObjectRelease();
  v143._countAndFlagsBits = 0xD000000000000018;
  v143._object = (void *)0x8000000100071CE0;
  sub_100062340(v143);
  if (*(unsigned char *)(v27 + OBJC_IVAR____TtC9IntentsUI9FTMessage_didLoadTranscript)) {
    v79._countAndFlagsBits = 1702195828;
  }
  else {
    v79._countAndFlagsBits = 0x65736C6166;
  }
  if (*(unsigned char *)(v27 + OBJC_IVAR____TtC9IntentsUI9FTMessage_didLoadTranscript)) {
    uint64_t v80 = (void *)0xE400000000000000;
  }
  else {
    uint64_t v80 = (void *)0xE500000000000000;
  }
  v79._object = v80;
  sub_100062340(v79);
  swift_bridgeObjectRelease();
  v144._countAndFlagsBits = 0x447369202020200ALL;
  v144._object = (void *)0xEE00203A79747269;
  sub_100062340(v144);
  if (*(unsigned char *)(v27 + v87)) {
    v81._countAndFlagsBits = 1702195828;
  }
  else {
    v81._countAndFlagsBits = 0x65736C6166;
  }
  if (*(unsigned char *)(v27 + v87)) {
    unint64_t v82 = (void *)0xE400000000000000;
  }
  else {
    unint64_t v82 = (void *)0xE500000000000000;
  }
  v81._object = v82;
  sub_100062340(v81);
  swift_bridgeObjectRelease();
  v145._object = (void *)0x8000000100071D00;
  v145._countAndFlagsBits = 0xD000000000000014;
  sub_100062340(v145);
  LOBYTE(v93) = sub_100058490();
  sub_100062720();
  v146._countAndFlagsBits = 0x202020202020200ALL;
  v146._object = (void *)0xEA00000000002920;
  sub_100062340(v146);
  return v96;
}

uint64_t sub_10005B99C()
{
  return sub_10005ABA8();
}

uint64_t sub_10005B9C0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10005BA94(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10005C018((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_10005C018((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_1000361FC((uint64_t)v12);
  return v7;
}

uint64_t sub_10005BA94(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_1000625A0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_10005BC50(a5, a6);
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
  uint64_t v8 = sub_1000626C0();
  if (!v8)
  {
    sub_100062780();
    __break(1u);
LABEL_17:
    uint64_t result = sub_1000627F0();
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

uint64_t sub_10005BC50(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10005BCE8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10005BEC8(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10005BEC8(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10005BCE8(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_10005BE60(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_100062690();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_100062780();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_100062350();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_1000627F0();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_100062780();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_10005BE60(uint64_t a1, uint64_t a2)
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
  sub_100035DD8((uint64_t *)&unk_1000A1E78);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10005BEC8(char a1, int64_t a2, char a3, char *a4)
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
    sub_100035DD8((uint64_t *)&unk_1000A1E78);
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
  uint64_t result = sub_1000627F0();
  __break(1u);
  return result;
}

uint64_t sub_10005C018(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10005C074(uint64_t result)
{
  if (result != 1) {
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_10005C084(uint64_t result)
{
  if (result != 1) {
    return swift_unknownObjectRetain();
  }
  return result;
}

uint64_t sub_10005C094(uint64_t a1, unint64_t a2)
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

uint64_t sub_10005C0EC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100035DD8(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10005C150(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100035DD8(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

uint64_t sub_10005C1B4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100035DD8(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_10005C218(unint64_t *a1, void (*a2)(uint64_t))
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
        JUMPOUT(0x10005C3CCLL);
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

uint64_t sub_10005C3F4(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_10005C3FC(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for FTMessageSource()
{
  return &type metadata for FTMessageSource;
}

unint64_t sub_10005C418()
{
  unint64_t result = qword_1000A1EC0;
  if (!qword_1000A1EC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000A1EC0);
  }
  return result;
}

unint64_t sub_10005C474@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result = sub_10005E480(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

BOOL sub_10005C4A8(void *a1, void *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_10005C4BC()
{
  Swift::UInt v1 = *v0;
  sub_1000628D0();
  sub_1000628E0(v1);
  return sub_1000628F0();
}

void sub_10005C504()
{
  sub_1000628E0(*v0);
}

Swift::Int sub_10005C530()
{
  Swift::UInt v1 = *v0;
  sub_1000628D0();
  sub_1000628E0(v1);
  return sub_1000628F0();
}

uint64_t *sub_10005C574@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
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

void sub_10005C590(void *a1@<X8>)
{
  *a1 = *v1;
}

Swift::Int sub_10005C59C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100061D90();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for MessageID.Value(0);
  __chkstk_darwin(v6);
  int v8 = (Swift::UInt *)((char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1000628D0();
  sub_100045F60(v1, (uint64_t)v8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, Swift::UInt *, uint64_t))(v3 + 32))(v5, v8, v2);
    sub_1000628E0(1uLL);
    sub_10005DA68(&qword_1000A1FD0, (void (*)(uint64_t))&type metadata accessor for UUID);
    sub_1000622B0();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  else
  {
    Swift::UInt v9 = *v8;
    sub_1000628E0(0);
    sub_1000628E0(v9);
  }
  return sub_1000628F0();
}

BOOL sub_10005C778(uint64_t a1, uint64_t a2)
{
  return (sub_10005DDB4(a2, a1) & 1) == 0;
}

BOOL sub_10005C7A4(uint64_t a1, uint64_t a2)
{
  return (sub_10005DDB4(a1, a2) & 1) == 0;
}

uint64_t sub_10005C7C4(uint64_t a1, uint64_t a2)
{
  return sub_10005DDB4(a2, a1);
}

void sub_10005C7D8()
{
  uint64_t v1 = sub_100061D90();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = __chkstk_darwin(v1);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v7 = (Swift::UInt *)((char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_100045F60(v0, (uint64_t)v7);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, Swift::UInt *, uint64_t))(v2 + 32))(v5, v7, v1);
    sub_1000628E0(1uLL);
    sub_10005DA68(&qword_1000A1FD0, (void (*)(uint64_t))&type metadata accessor for UUID);
    sub_1000622B0();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
  }
  else
  {
    Swift::UInt v8 = *v7;
    sub_1000628E0(0);
    sub_1000628E0(v8);
  }
}

Swift::Int sub_10005C994()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100061D90();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  Swift::UInt v8 = (Swift::UInt *)((char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1000628D0();
  sub_100045F60(v1, (uint64_t)v8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, Swift::UInt *, uint64_t))(v3 + 32))(v6, v8, v2);
    sub_1000628E0(1uLL);
    sub_10005DA68(&qword_1000A1FD0, (void (*)(uint64_t))&type metadata accessor for UUID);
    sub_1000622B0();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  }
  else
  {
    Swift::UInt v9 = *v8;
    sub_1000628E0(0);
    sub_1000628E0(v9);
  }
  return sub_1000628F0();
}

uint64_t sub_10005CBDC()
{
  uint64_t v1 = sub_100061D90();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for MessageID.Value(0);
  __chkstk_darwin(v5);
  uint64_t v7 = (void *)((char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_100045F60(v0 + OBJC_IVAR___MPMessageID_value, (uint64_t)v7);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, void *, uint64_t))(v2 + 32))(v4, v7, v1);
    uint64_t v8 = sub_100061D30();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  else
  {
    v10[1] = *v7;
    return sub_100062840();
  }
  return v8;
}

uint64_t sub_10005D1B4()
{
  return type metadata accessor for MessageID(0);
}

uint64_t type metadata accessor for MessageID(uint64_t a1)
{
  return sub_100053D24(a1, (uint64_t *)&unk_1000A1EF8);
}

uint64_t sub_10005D1DC()
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
  return sub_100053D24(a1, qword_1000A1F78);
}

uint64_t sub_10005D2CC(uint64_t a1)
{
  swift_getObjectType();
  sub_10005E490(a1, (uint64_t)v6);
  if (!v7)
  {
    sub_1000363BC((uint64_t)v6, &qword_1000A1FD8);
    goto LABEL_5;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_5:
    char v3 = 0;
    return v3 & 1;
  }
  char v3 = sub_10005DB20((uint64_t)v5 + OBJC_IVAR___MPMessageID_value, v1 + OBJC_IVAR___MPMessageID_value);

  return v3 & 1;
}

uint64_t *sub_10005D3FC(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
      uint64_t v7 = sub_100061D90();
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

uint64_t sub_10005D4F8(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  if (result == 1)
  {
    uint64_t v3 = sub_100061D90();
    uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
    return v4(a1, v3);
  }
  return result;
}

void *sub_10005D574(void *a1, const void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_100061D90();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

void *sub_10005D62C(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_100045FC4((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_100061D90();
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

void *sub_10005D6F4(void *a1, const void *a2, uint64_t a3)
{
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_100061D90();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

void *sub_10005D7AC(void *a1, const void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_100045FC4((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_100061D90();
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

uint64_t sub_10005D874(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_10005D89C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_10005D8C8()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_10005D8D8()
{
  uint64_t result = sub_100061D90();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for MessageFolder()
{
  return &type metadata for MessageFolder;
}

unint64_t sub_10005D984()
{
  unint64_t result = qword_1000A1FB0;
  if (!qword_1000A1FB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000A1FB0);
  }
  return result;
}

uint64_t sub_10005D9D8()
{
  return sub_10005DA68(&qword_1000A1FB8, (void (*)(uint64_t))type metadata accessor for MessageID.Value);
}

uint64_t sub_10005DA20()
{
  return sub_10005DA68(&qword_1000A1FC0, (void (*)(uint64_t))type metadata accessor for MessageID);
}

uint64_t sub_10005DA68(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10005DAB0(uint64_t *a1, uint64_t *a2)
{
  return sub_10005E19C(*a1, *a2);
}

BOOL sub_10005DABC(uint64_t *a1, uint64_t *a2)
{
  return (sub_10005E19C(*a2, *a1) & 1) == 0;
}

BOOL sub_10005DAE8(uint64_t *a1, uint64_t *a2)
{
  return (sub_10005E19C(*a1, *a2) & 1) == 0;
}

uint64_t sub_10005DB10(uint64_t *a1, uint64_t *a2)
{
  return sub_10005E19C(*a2, *a1);
}

uint64_t sub_10005DB20(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100061D90();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for MessageID.Value(0);
  uint64_t v9 = __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  id v13 = (uint64_t *)((char *)&v22 - v12);
  uint64_t v14 = sub_100035DD8(&qword_1000A1FC8);
  uint64_t v15 = __chkstk_darwin(v14 - 8);
  uint64_t v17 = (char *)&v22 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = &v17[*(int *)(v15 + 56)];
  sub_100045F60(a1, (uint64_t)v17);
  sub_100045F60(a2, (uint64_t)v18);
  if (swift_getEnumCaseMultiPayload() != 1)
  {
    sub_100045F60((uint64_t)v17, (uint64_t)v13);
    if (swift_getEnumCaseMultiPayload() != 1)
    {
      char v19 = *v13 == *(void *)v18;
      goto LABEL_6;
    }
LABEL_8:
    sub_1000363BC((uint64_t)v17, &qword_1000A1FC8);
    char v19 = 0;
    return v19 & 1;
  }
  sub_100045F60((uint64_t)v17, (uint64_t)v11);
  if (swift_getEnumCaseMultiPayload() != 1)
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v11, v4);
    goto LABEL_8;
  }
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v18, v4);
  char v19 = sub_100061D60();
  id v20 = *(void (**)(char *, uint64_t))(v5 + 8);
  v20(v7, v4);
  v20(v11, v4);
LABEL_6:
  sub_100045FC4((uint64_t)v17);
  return v19 & 1;
}

uint64_t sub_10005DDB4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100061D90();
  uint64_t v40 = *(void *)(v4 - 8);
  uint64_t v41 = v4;
  uint64_t v5 = __chkstk_darwin(v4);
  uint64_t v38 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  char v39 = (char *)&v37 - v7;
  uint64_t v8 = type metadata accessor for MessageID.Value(0);
  uint64_t v9 = __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v9);
  uint64_t v14 = (char *)&v37 - v13;
  uint64_t v15 = __chkstk_darwin(v12);
  uint64_t v17 = (char *)&v37 - v16;
  __chkstk_darwin(v15);
  char v19 = (unint64_t *)((char *)&v37 - v18);
  uint64_t v20 = sub_100035DD8(&qword_1000A1FC8);
  uint64_t v21 = __chkstk_darwin(v20 - 8);
  uint64_t v23 = (char *)&v37 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = &v23[*(int *)(v21 + 56)];
  sub_100045F60(a1, (uint64_t)v23);
  uint64_t v42 = a2;
  sub_100045F60(a2, (uint64_t)v24);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_100045F60((uint64_t)v23, (uint64_t)v17);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v26 = v39;
      uint64_t v25 = v40;
      uint64_t v27 = *(void (**)(char *, char *, uint64_t))(v40 + 32);
      uint64_t v28 = v41;
      v27(v39, v17, v41);
      uint64_t v29 = v38;
      v27(v38, v24, v28);
      if (sub_100061D60())
      {
        uint64_t v30 = *(void (**)(char *, uint64_t))(v25 + 8);
        v30(v29, v28);
        v30(v26, v28);
LABEL_7:
        sub_100045FC4((uint64_t)v23);
        char v32 = 0;
        return v32 & 1;
      }
      char v32 = sub_100061D50();
      uint64_t v35 = *(void (**)(char *, uint64_t))(v25 + 8);
      v35(v29, v28);
      v35(v26, v28);
LABEL_18:
      sub_100045FC4((uint64_t)v23);
      return v32 & 1;
    }
    (*(void (**)(char *, uint64_t))(v40 + 8))(v17, v41);
  }
  else
  {
    sub_100045F60((uint64_t)v23, (uint64_t)v19);
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
  sub_100045F60(a1, (uint64_t)v14);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_100045FC4((uint64_t)v14);
    unint64_t v33 = 1;
  }
  else
  {
    unint64_t v33 = 0;
  }
  sub_100045F60(v42, (uint64_t)v11);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_100045FC4((uint64_t)v11);
    unint64_t v34 = 1;
  }
  else
  {
    unint64_t v34 = 0;
  }
  char v32 = v33 < v34;
  sub_1000363BC((uint64_t)v23, &qword_1000A1FC8);
  return v32 & 1;
}

uint64_t sub_10005E19C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100061D90();
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
  uint64_t v17 = sub_100035DD8(&qword_1000A1FC8);
  uint64_t v18 = __chkstk_darwin(v17 - 8);
  uint64_t v20 = (char *)&v28 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = a1 + OBJC_IVAR___MPMessageID_value;
  uint64_t v22 = a2 + OBJC_IVAR___MPMessageID_value;
  uint64_t v23 = &v20[*(int *)(v18 + 56)];
  sub_100045F60(v21, (uint64_t)v20);
  sub_100045F60(v22, (uint64_t)v23);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_100045F60((uint64_t)v20, (uint64_t)v16);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v24 = *(void (**)(char *, char *, uint64_t))(v5 + 32);
      v24(v10, v16, v4);
      v24(v8, v23, v4);
      char v25 = sub_100061D50();
      uint64_t v26 = *(void (**)(char *, uint64_t))(v5 + 8);
      v26(v8, v4);
      v26(v10, v4);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v5 + 8))(v16, v4);
      sub_100045FC4((uint64_t)v23);
      char v25 = 1;
    }
  }
  else
  {
    sub_100045F60((uint64_t)v20, (uint64_t)v14);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      sub_100045FC4((uint64_t)v23);
      char v25 = 0;
    }
    else
    {
      char v25 = *v14 < *(void *)v23;
    }
  }
  sub_100045FC4((uint64_t)v20);
  return v25 & 1;
}

unint64_t sub_10005E480(unint64_t result)
{
  if (result > 4) {
    return 0;
  }
  return result;
}

uint64_t sub_10005E490(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100035DD8(&qword_1000A1FD8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

ValueMetadata *type metadata accessor for MessageType()
{
  return &type metadata for MessageType;
}

unint64_t sub_10005E50C()
{
  unint64_t result = qword_1000A1FE0;
  if (!qword_1000A1FE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000A1FE0);
  }
  return result;
}

uint64_t sub_10005E708()
{
  uint64_t v0 = sub_100061D90();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100061D80();
  uint64_t v4 = (objc_class *)type metadata accessor for LegacyVoicemail();
  uint64_t v5 = objc_allocWithZone(v4);
  (*(void (**)(unsigned char *, char *, uint64_t))(v1 + 16))(&v5[OBJC_IVAR___MPLegacyVoicemail_accountID], v3, v0);
  uint64_t v6 = &v5[OBJC_IVAR___MPLegacyVoicemail_label];
  void *v6 = 0x7972616D697250;
  v6[1] = 0xE700000000000000;
  v5[OBJC_IVAR___MPLegacyVoicemail_hasUnreadMessages] = 1;
  v9.receiver = v5;
  v9.super_class = v4;
  [super init];
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  qword_1000A2E68 = (uint64_t)v7;
  return result;
}

id sub_10005E8F0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LegacyVoicemail();
  [super dealloc];
}

uint64_t sub_10005E9AC()
{
  return type metadata accessor for LegacyVoicemail();
}

uint64_t type metadata accessor for LegacyVoicemail()
{
  uint64_t result = qword_1000A2010;
  if (!qword_1000A2010) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10005EA00()
{
  uint64_t result = sub_100061D90();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

id sub_10005EAA4()
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
  unint64_t v1 = self;
  NSString v2 = sub_1000622D0();
  swift_bridgeObjectRelease();
  NSString v3 = sub_1000622D0();
  swift_bridgeObjectRelease();
  id v4 = [v1 normalizedPhoneNumberHandleForValue:v2 isoCountryCode:v3];

  if (!v4) {
    return 0;
  }
  id v5 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) initWithHandle:v4];

  return v5;
}

void sub_10005EC90(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_10005EC9C(id *a1@<X0>, uint64_t *a2@<X8>)
{
}

void sub_10005ECA8(id *a1@<X0>, SEL *a2@<X3>, uint64_t *a3@<X8>)
{
  id v4 = [*a1 *a2];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = sub_100062300();
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

void *sub_10005ED0C(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = (void *)sub_1000627B0();
    uint64_t v2 = (uint64_t)result;
    if (result) {
      goto LABEL_3;
    }
LABEL_44:
    swift_bridgeObjectRelease();
    sub_10005F304((unint64_t)_swiftEmptyArrayStorage);
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
        sub_1000626A0();
      }
      else {
        swift_unknownObjectRetain();
      }
      id v6 = [(id)swift_unknownObjectRetain() senderDestinationID];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = sub_100062300();
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
          uint64_t v13 = v12;
          sub_100062300();
          swift_unknownObjectRelease();

          uint64_t v14 = self;
          NSString v15 = sub_1000622D0();
          swift_bridgeObjectRelease();
          NSString v16 = sub_1000622D0();
          swift_bridgeObjectRelease();
          id v17 = [v14 normalizedPhoneNumberHandleForValue:v15 isoCountryCode:v16];

          if (v17)
          {
            id v18 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) initWithHandle:v17];
            swift_unknownObjectRelease();

            unint64_t v5 = a1 & 0xC000000000000001;
            if (v18)
            {
              sub_100062360();
              if (*(void *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
                sub_1000623B0();
              }
              sub_1000623D0();
              sub_1000623A0();
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
        uint64_t v20 = &selRef_negativeFeedbackURL;
        while (1)
        {
          if (v5) {
            sub_1000626A0();
          }
          else {
            swift_unknownObjectRetain();
          }
          id v21 = [(id)swift_unknownObjectRetain() v20[83]];
          if (v21)
          {
            uint64_t v22 = v21;
            uint64_t v23 = sub_100062300();
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
              sub_100062300();
              swift_unknownObjectRelease();

              uint64_t v29 = self;
              NSString v30 = sub_1000622D0();
              swift_bridgeObjectRelease();
              NSString v31 = sub_1000622D0();
              swift_bridgeObjectRelease();
              id v32 = [v29 normalizedPhoneNumberHandleForValue:v30 isoCountryCode:v31];

              if (v32)
              {
                id v33 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) initWithHandle:v32];
                swift_unknownObjectRelease();

                unint64_t v5 = a1 & 0xC000000000000001;
                uint64_t v20 = &selRef_negativeFeedbackURL;
                if (v33)
                {
                  sub_100062360();
                  if (*(void *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
                    sub_1000623B0();
                  }
                  sub_1000623D0();
                  sub_1000623A0();
                }
              }
              else
              {
                swift_unknownObjectRelease();
                unint64_t v5 = a1 & 0xC000000000000001;
                uint64_t v20 = &selRef_negativeFeedbackURL;
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

unint64_t sub_10005F2C4()
{
  unint64_t result = qword_1000A2020;
  if (!qword_1000A2020)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1000A2020);
  }
  return result;
}

uint64_t sub_10005F304(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_1000627B0();
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
  uint64_t v15 = sub_1000627B0();
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
    uint64_t v9 = sub_1000626B0();
    swift_bridgeObjectRelease();
    uint64_t *v1 = v9;
    uint64_t v8 = v9 & 0xFFFFFFFFFFFFFF8;
LABEL_11:
    uint64_t result = sub_10005F758(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1, (void (*)(void))sub_10005F2C4, &qword_1000A2030, &qword_1000A2028, (uint64_t (*)(unsigned char *, uint64_t, unint64_t, uint64_t, uint64_t))sub_10005FA50);
    if (v11 >= v3) {
      break;
    }
LABEL_22:
    __break(1u);
LABEL_23:
    swift_bridgeObjectRetain();
    sub_1000627B0();
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

  return sub_1000623A0();
}

uint64_t sub_10005F508(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_1000627B0();
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
    uint64_t v10 = sub_1000627B0();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_10005FCA8(&qword_1000A2048, &qword_1000A13F8);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          sub_100035DD8(&qword_1000A13F8);
          uint64_t v12 = sub_10005F97C(v16, i, a3);
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
    sub_100035DD8(&qword_1000A1500);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_1000627F0();
  __break(1u);
  return result;
}

uint64_t sub_10005F71C(unint64_t a1, uint64_t a2, unint64_t a3)
{
  return sub_10005F758(a1, a2, a3, (void (*)(void))type metadata accessor for MessageID, &qword_1000A2040, &qword_1000A2038, (uint64_t (*)(unsigned char *, uint64_t, unint64_t, uint64_t, uint64_t))sub_10005F9E8);
}

uint64_t sub_10005F758(unint64_t a1, uint64_t a2, unint64_t a3, void (*a4)(void), unint64_t *a5, uint64_t *a6, uint64_t (*a7)(unsigned char *, uint64_t, unint64_t, uint64_t, uint64_t))
{
  unint64_t v14 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v15 = sub_1000627B0();
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
    uint64_t v18 = sub_1000627B0();
    swift_bridgeObjectRelease();
    if (v18 <= a2)
    {
      if (v15 >= 1)
      {
        uint64_t v19 = sub_10005FCA8(a5, a6);
        swift_bridgeObjectRetain();
        for (uint64_t i = 0; i != v15; ++i)
        {
          uint64_t v21 = sub_100035DD8(a6);
          uint64_t v22 = (void (*)(unsigned char *, void))a7(v26, i, a3, v21, v19);
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
  uint64_t result = sub_1000627F0();
  __break(1u);
  return result;
}

uint64_t (*sub_10005F97C(uint64_t (**a1)(), unint64_t a2, uint64_t a3))()
{
  unint64_t v6 = (uint64_t (*)())malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_10005FB00(v6, a2, a3);
  return sub_10005F9E4;
}

uint64_t (*sub_10005F9E8(void (**a1)(id *a1), unint64_t a2, uint64_t a3))()
{
  unint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_10005FB88(v6, a2, a3);
  return sub_10005F9E4;
}

uint64_t (*sub_10005FA50(void (**a1)(id *), unint64_t a2, uint64_t a3))()
{
  unint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_10005FC10(v6, a2, a3);
  return sub_10005F9E4;
}

void sub_10005FAB8(void *a1)
{
  unint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

uint64_t (*sub_10005FB00(uint64_t (*result)(), unint64_t a2, uint64_t a3))()
{
  uint64_t v3 = (uint64_t *)result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    uint64_t v4 = sub_1000626A0();
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
    return sub_10005FB80;
  }
  __break(1u);
  return result;
}

uint64_t sub_10005FB80()
{
  return swift_unknownObjectRelease();
}

void (*sub_10005FB88(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)sub_1000626A0();
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
    return sub_10005FC08;
  }
  __break(1u);
  return result;
}

void sub_10005FC08(id *a1)
{
}

void (*sub_10005FC10(void (*result)(id *), unint64_t a2, uint64_t a3))(id *)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)sub_1000626A0();
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
    return sub_10005FCF8;
  }
  __break(1u);
  return result;
}

const char *sub_10005FC90()
{
  return "senderISOCountryCode";
}

const char *sub_10005FC9C()
{
  return "senderDestinationID";
}

uint64_t sub_10005FCA8(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10003624C(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10005FCFC(uint64_t a1)
{
  return sub_10005FD38(a1, qword_1000A2E88);
}

uint64_t sub_10005FD1C(uint64_t a1)
{
  return sub_10005FD38(a1, qword_1000A2EA0);
}

uint64_t sub_10005FD38(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_1000621F0();
  sub_10003F720(v3, a2);
  sub_100034CF4(v3, (uint64_t)a2);
  return sub_1000621E0();
}

uint64_t sub_10005FDB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100062450();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_100062440();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_1000556F8(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1000623E0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_10005FF54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100062450();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_100062440();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_1000556F8(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1000623E0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  type metadata accessor for CachedVoicemailManager.Cache();
  return swift_task_create();
}

uint64_t sub_1000600FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  *(unsigned char *)(v5 + 32) = a5;
  *(void *)(v5 + 16) = a4;
  sub_100062410();
  *(void *)(v5 + 24) = sub_100062400();
  uint64_t v7 = sub_1000623E0();
  return _swift_task_switch(sub_100060198, v7, v6);
}

uint64_t sub_100060198()
{
  uint64_t v1 = *(unsigned __int8 *)(v0 + 32);
  uint64_t v2 = *(void *)(v0 + 16);
  swift_release();
  [*(id *)(v2 + OBJC_IVAR____TtC9IntentsUI22VisualVoicemailManager_visualVoicemailManager) requestInitialStateIfNecessaryAndSendNotifications:v1];
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_100060358()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 41, 7);
}

uint64_t sub_100060398(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 32);
  char v7 = *(unsigned char *)(v1 + 40);
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  void *v8 = v2;
  v8[1] = sub_100036040;
  return sub_1000600FC(a1, v4, v5, v6, v7);
}

uint64_t sub_10006045C()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100060494(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_100036550;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1000A2060 + dword_1000A2060);
  return v6(a1, v4);
}

uint64_t sub_10006054C(uint64_t a1, int *a2)
{
  *(void *)(v2 + 24) = a1;
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v2 + 32) = v3;
  void *v3 = v2;
  v3[1] = sub_10006062C;
  return v5(v2 + 16);
}

uint64_t sub_10006062C()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void **)(*v0 + 24);
  uint64_t v5 = *v0;
  swift_task_dealloc();
  *uint64_t v2 = *(void *)(v1 + 16);
  uint64_t v3 = *(uint64_t (**)(void))(v5 + 8);
  return v3();
}

uint64_t sub_10006075C(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_100036040;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1000A2070 + dword_1000A2070);
  return v6(a1, v4);
}

id sub_100060910()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for VisualVoicemailManagerFactory();
  return [super dealloc];
}

uint64_t type metadata accessor for VisualVoicemailManagerFactory()
{
  return self;
}

uint64_t sub_100060968()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
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

uint64_t sub_100060B00(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 8) <= 2u) {
    return *(unsigned __int8 *)(a1 + 8);
  }
  else {
    return (*(_DWORD *)a1 + 3);
  }
}

uint64_t sub_100060B18(uint64_t result, unsigned int a2)
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

unint64_t sub_100060B40(uint64_t a1, char a2)
{
  unint64_t result = 0xD000000000000025;
  switch(a2)
  {
    case 1:
      sub_100062680(43);
      swift_bridgeObjectRelease();
      unint64_t v3 = 0xD000000000000028;
      goto LABEL_5;
    case 2:
      sub_100062680(42);
      swift_bridgeObjectRelease();
      unint64_t v3 = 0xD000000000000027;
LABEL_5:
      sub_100035DD8(&qword_1000A1500);
      goto LABEL_6;
    case 3:
      return result;
    default:
      sub_100062680(42);
      swift_bridgeObjectRelease();
      unint64_t v3 = 0xD000000000000027;
      type metadata accessor for MessageID(0);
LABEL_6:
      v4._countAndFlagsBits = sub_100062390();
      sub_100062340(v4);
      swift_bridgeObjectRelease();
      v5._countAndFlagsBits = 41;
      v5._object = (void *)0xE100000000000000;
      sub_100062340(v5);
      return v3;
  }
}

unint64_t sub_100060CA8()
{
  return sub_100060B40(*(void *)v0, *(unsigned char *)(v0 + 8));
}

uint64_t sub_100060CB8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 16))();
}

uint64_t sub_100060E5C()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100060E94()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_100060EA4(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t sub_100060EF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_100062450();
  __chkstk_darwin(v8 - 8);
  uint64_t v19 = sub_100062130();
  uint64_t v20 = &off_10008EA10;
  v18[0] = a3;
  uint64_t v9 = OBJC_IVAR____TtC9IntentsUI24FaceTimeVoicemailManager_logger;
  uint64_t v10 = qword_1000A0EA0;
  swift_retain();
  if (v10 != -1) {
    swift_once();
  }
  uint64_t v11 = sub_1000621F0();
  uint64_t v12 = sub_100034CF4(v11, (uint64_t)qword_1000A2E88);
  BOOL v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 16);
  v13(a4 + v9, v12, v11);
  v13(a4 + OBJC_IVAR____TtC9IntentsUI24FaceTimeVoicemailManager_analyticsReporter, v12, v11);
  *(void *)(a4 + OBJC_IVAR____TtC9IntentsUI24FaceTimeVoicemailManager_providers) = &off_10008E0E8;
  *(void *)(a4 + OBJC_IVAR____TtC9IntentsUI24FaceTimeVoicemailManager_messageTypes) = &off_10008E118;
  uint64_t v14 = OBJC_IVAR____TtC9IntentsUI24FaceTimeVoicemailManager_messagesChangedPublisher;
  sub_100035DD8((uint64_t *)&unk_1000A14F0);
  swift_allocObject();
  *(void *)(a4 + v14) = sub_100062260();
  uint64_t v15 = OBJC_IVAR____TtC9IntentsUI24FaceTimeVoicemailManager_operationQueue;
  sub_100061E90();
  sub_100062430();
  *(void *)(a4 + v15) = sub_100061E80();
  uint64_t v16 = (void *)(a4 + OBJC_IVAR____TtC9IntentsUI24FaceTimeVoicemailManager_onVoicemailsChanged);
  *uint64_t v16 = a1;
  v16[1] = a2;
  sub_100036198((uint64_t)v18, a4 + OBJC_IVAR____TtC9IntentsUI24FaceTimeVoicemailManager_messageStoreController);
  swift_retain();
  swift_release();
  *(void *)(a4 + 16) = 0x8000000000000000;
  *(void *)(a4 + 24) = _swiftEmptyArrayStorage;
  sub_1000362AC(v18, v19);
  swift_retain();
  sub_1000620D0();
  swift_release();
  swift_release();
  sub_1000361FC((uint64_t)v18);
  return a4;
}

void sub_100061158(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000611D0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10006123C(id *a1, NSObject *a2)
{
  unint64_t v3 = [*a1 intent];
  int v4 = 138412290;
  Swift::String v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "unexpected intent: %@", (uint8_t *)&v4, 0xCu);
}

void sub_1000612D8(void *a1)
{
  uint64_t v1 = [a1 intent];
  sub_10000B974();
  sub_10000B98C((void *)&_mh_execute_header, v2, v3, "Attempted to invoke UI extension with unsupported intent: %@ interaction: %@", v4, v5, v6, v7, v8);
}

void sub_100061368(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Intent response contains no call records", v1, 2u);
}

void sub_1000613AC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Could not extract call records from intent response", v1, 2u);
}

void sub_1000613F0(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Could not find CHRecentCall for INCallRecord: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100061468(void *a1)
{
  [a1 count];
  sub_10000B974();
  sub_10000B98C((void *)&_mh_execute_header, v1, v2, "Found %ld calls matching call unique ID: %@", v3, v4, v5, v6, v7);
}

void sub_1000614E4(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Could not find VMVoicemail for INCallRecord with identifier: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10006155C(char a1, uint64_t a2, os_log_t log)
{
  v3[0] = 67109378;
  v3[1] = a1 & 1;
  __int16 v4 = 2112;
  uint64_t v5 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "isTranscriptionAvailable: %d voicemail: %@", (uint8_t *)v3, 0x12u);
}

void sub_1000615E8(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v6 = [a1 localizedName];
  uint8_t v7 = [a1 supportedHandleTypes];
  int v8 = 134218498;
  uint64_t v9 = a2;
  __int16 v10 = 2112;
  uint64_t v11 = v6;
  __int16 v12 = 2112;
  BOOL v13 = v7;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Could not create a dial request due to an invalid handle type (%zd). For call provider %@, the supported handle types are (%@).", (uint8_t *)&v8, 0x20u);
}

void sub_1000616B8(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "User activity does not contains a user info dictionary.", v1, 2u);
}

void sub_1000616FC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "User activity is missing the required key TUCallUserActivityProviderIdentifierKey.", v1, 2u);
}

void sub_100061740(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Could not retrieve a call provider for the specified identifier %@.", (uint8_t *)&v2, 0xCu);
}

void sub_1000617B8(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Could not retreive Dual SIM activation policy", v1, 2u);
}

void sub_1000617FC(int *a1, NSObject *a2)
{
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Could not retreive Dual SIM activation policy, mobileGestaltErrorCode: %d", (uint8_t *)v3, 8u);
}

void sub_100061878(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Could not create a dial request for the recent call (%@).", (uint8_t *)&v3, 0xCu);
}

void sub_1000618F4(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Error initiating dial request %@: %@", (uint8_t *)&v4, 0x16u);
}

void sub_100061980(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to fetch unified contact for identifier: %@", (uint8_t *)&v2, 0xCu);
}

void sub_1000619F8(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Could not create a CNPhoneNumber for the specified telephone number (%@).", (uint8_t *)&v2, 0xCu);
}

void sub_100061A70(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "Multiple instances of MPVoicemailController detected in same process which is not yet supported. (existing: %@, self: %@)", (uint8_t *)&v3, 0x16u);
}

void sub_100061AF8(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unable to get subscription information: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100061B70(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unable to get voicemail information: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100061BE8(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Cannot show transcript view due to unknown confidence value.", v1, 2u);
}

void sub_100061C2C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "-[CHRecentCall handleType] returned a value of CHHandleTypeUnknown", v1, 2u);
}

uint64_t sub_100061C70()
{
  return static Notification._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100061C80()
{
  return Notification.name.getter();
}

uint64_t sub_100061C90()
{
  return type metadata accessor for Notification();
}

void sub_100061CA0(NSURL *retstr@<X8>)
{
}

uint64_t sub_100061CB0()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100061CC0()
{
  return URL.path.getter();
}

uint64_t sub_100061CD0()
{
  return type metadata accessor for URL();
}

uint64_t sub_100061CE0()
{
  return Data.init(contentsOf:options:)();
}

NSDate sub_100061CF0()
{
  return Date._bridgeToObjectiveC()();
}

uint64_t sub_100061D00()
{
  return static Date.> infix(_:_:)();
}

uint64_t sub_100061D10()
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100061D20()
{
  return type metadata accessor for Date();
}

uint64_t sub_100061D30()
{
  return UUID.uuidString.getter();
}

NSUUID sub_100061D40()
{
  return UUID._bridgeToObjectiveC()();
}

uint64_t sub_100061D50()
{
  return static UUID.< infix(_:_:)();
}

uint64_t sub_100061D60()
{
  return static UUID.== infix(_:_:)();
}

uint64_t sub_100061D70()
{
  return static UUID._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100061D80()
{
  return UUID.init()();
}

uint64_t sub_100061D90()
{
  return type metadata accessor for UUID();
}

uint64_t sub_100061DA0()
{
  return dispatch thunk of TPTipsHelper.currentTip.modify();
}

uint64_t sub_100061DB0()
{
  return dispatch thunk of TPTipsHelper.currentTip.getter();
}

uint64_t sub_100061DC0()
{
  return dispatch thunk of TPTipsHelper.removeEntries(_:)();
}

uint64_t sub_100061DD0()
{
  return type metadata accessor for TPTipsHelper.Entry.Kind();
}

uint64_t sub_100061DE0()
{
  return type metadata accessor for TPTipsHelper.Entry();
}

uint64_t sub_100061DF0()
{
  return TPTipsHelper.Entry.init(_:tip:observationTask:)();
}

uint64_t sub_100061E00()
{
  return dispatch thunk of TPTipsHelper.setup()();
}

uint64_t sub_100061E20()
{
  return dispatch thunk of TPTipsHelper.addEntry(_:)();
}

uint64_t sub_100061E30()
{
  return static TPTipsHelper.taskQueue.getter();
}

uint64_t sub_100061E40()
{
  return type metadata accessor for TPTipsHelper();
}

uint64_t sub_100061E50()
{
  return LiveVoicemailTip.init()();
}

uint64_t sub_100061E60()
{
  return type metadata accessor for LiveVoicemailTip();
}

uint64_t sub_100061E70()
{
  return dispatch thunk of TaskQueue.async(_:)();
}

uint64_t sub_100061E80()
{
  return TaskQueue.__allocating_init(priority:)();
}

uint64_t sub_100061E90()
{
  return type metadata accessor for TaskQueue();
}

uint64_t sub_100061EA0()
{
  return _HashTable.UnsafeHandle._startIterator(bucket:)();
}

uint64_t sub_100061EB0()
{
  return _HashTable.UnsafeHandle.firstOccupiedBucketInChain(with:)();
}

uint64_t sub_100061EC0()
{
  return _HashTable.UnsafeHandle.subscript.setter();
}

uint64_t sub_100061ED0()
{
  return _HashTable.BucketIterator.currentValue.getter();
}

uint64_t sub_100061EE0()
{
  return _HashTable.BucketIterator.currentValue.setter();
}

void sub_100061EF0()
{
}

uint64_t sub_100061F00()
{
  return static _HashTable.maximumCapacity(forScale:)();
}

uint64_t sub_100061F10()
{
  return static _HashTable.minimumCapacity(forScale:)();
}

uint64_t sub_100061F20()
{
  return _HashTable.copy()();
}

uint64_t sub_100061F30()
{
  return static _HashTable.scale(forCapacity:)();
}

uint64_t sub_100061F40()
{
  return _HashTable.init(scale:reservedScale:)();
}

uint64_t sub_100061F50()
{
  return dispatch thunk of Message.sandboxMessageFile.getter();
}

uint64_t sub_100061F60()
{
  return dispatch thunk of Message.recordUUID.getter();
}

uint64_t sub_100061F70()
{
  return dispatch thunk of Message.transcript.getter();
}

uint64_t sub_100061F80()
{
  return dispatch thunk of Message.dateCreated.getter();
}

uint64_t sub_100061F90()
{
  return dispatch thunk of Message.isSensitive.getter();
}

uint64_t sub_100061FA0()
{
  return dispatch thunk of Message.mailboxType.getter();
}

uint64_t sub_100061FB0()
{
  return dispatch thunk of Message.messageType.getter();
}

uint64_t sub_100061FC0()
{
  return dispatch thunk of Message.isFromUnknown.getter();
}

uint64_t sub_100061FD0()
{
  return dispatch thunk of Message.transcriptionStatus.getter();
}

uint64_t sub_100061FE0()
{
  return dispatch thunk of Message.from.getter();
}

uint64_t sub_100061FF0()
{
  return dispatch thunk of Message.isRTT.getter();
}

uint64_t sub_100062000()
{
  return dispatch thunk of Message.isRead.getter();
}

uint64_t sub_100062010()
{
  return dispatch thunk of Message.callUUID.getter();
}

uint64_t sub_100062020()
{
  return dispatch thunk of Message.duration.getter();
}

uint64_t sub_100062030()
{
  return dispatch thunk of Message.fileSize.getter();
}

uint64_t sub_100062040()
{
  return dispatch thunk of Message.provider.getter();
}

uint64_t sub_100062050()
{
  return dispatch thunk of Message.recipient.getter();
}

uint64_t sub_100062060()
{
  return type metadata accessor for Message();
}

uint64_t sub_100062070()
{
  return static MessageFetchOptions.includeProtectedApps.getter();
}

uint64_t sub_100062080()
{
  return type metadata accessor for MessageFetchOptions();
}

uint64_t sub_100062090()
{
  return MessageType.rawValue.getter();
}

uint64_t sub_1000620A0()
{
  return MessageUpdate.init(recordUUID:callUUID:conversationID:from:provider:isRead:duration:mailboxType:recipient:transcriptionStatus:isRTT:transcriptURL:simID:undelete:)();
}

uint64_t sub_1000620B0()
{
  return MessageUpdate.recordUUID.getter();
}

uint64_t sub_1000620C0()
{
  return type metadata accessor for MessageUpdate();
}

uint64_t sub_1000620D0()
{
  return MessageStoreController.addDelegate(_:)();
}

uint64_t sub_100062100()
{
  return MessageStoreController.removeDelegate(_:)();
}

uint64_t sub_100062120()
{
  return static MessageStoreController.shared.getter();
}

uint64_t sub_100062130()
{
  return type metadata accessor for MessageStoreController();
}

uint64_t sub_100062140()
{
  return type metadata accessor for MessageStoreFetchRequest.QuerySearchType();
}

uint64_t sub_100062150()
{
  return MessageStoreFetchRequest.init(query:sortType:options:pageSize:page:originatingBundleID:)();
}

uint64_t sub_100062160()
{
  return type metadata accessor for MessageStoreFetchRequest();
}

uint64_t sub_100062170()
{
  return type metadata accessor for MessageStoreQuery();
}

uint64_t sub_100062180()
{
  return Transcript.text.getter();
}

uint64_t sub_100062190()
{
  return type metadata accessor for Transcript();
}

uint64_t sub_1000621A0()
{
  return MailboxType.rawValue.getter();
}

uint64_t sub_1000621B0()
{
  return dispatch thunk of SandboxExtendedURL.sandboxResolvedURL.getter();
}

uint64_t sub_1000621C0()
{
  return TranscriptionStatus.rawValue.getter();
}

uint64_t sub_1000621D0()
{
  return Logger.logObject.getter();
}

uint64_t sub_1000621E0()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_1000621F0()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100062200()
{
  return dispatch thunk of Tip.id.getter();
}

uint64_t sub_100062210()
{
  return Tip.shouldDisplayUpdates.getter();
}

uint64_t sub_100062220()
{
  return type metadata accessor for TipUIView();
}

uint64_t sub_100062230()
{
  return TipUIView.init(_:arrowEdge:actionHandler:)();
}

uint64_t sub_100062240()
{
  return type metadata accessor for Tips.Status();
}

uint64_t sub_100062250()
{
  return PassthroughSubject.send(_:)();
}

uint64_t sub_100062260()
{
  return PassthroughSubject.init()();
}

uint64_t sub_100062270()
{
  return static DispatchQoS.userInteractive.getter();
}

uint64_t sub_100062280()
{
  return type metadata accessor for DispatchQoS();
}

NSDictionary sub_100062290()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_1000622A0()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t sub_1000622B0()
{
  return dispatch thunk of Hashable.hash(into:)();
}

uint64_t sub_1000622C0()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString sub_1000622D0()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_1000622E0()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_1000622F0()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_100062300()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100062310()
{
  return String.init<A>(describing:)();
}

uint64_t sub_100062320()
{
  return String.init<A>(reflecting:)();
}

uint64_t sub_100062330()
{
  return String.hash(into:)();
}

void sub_100062340(Swift::String a1)
{
}

Swift::Int sub_100062350()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_100062360()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_100062370()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_100062380()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100062390()
{
  return Array.description.getter();
}

uint64_t sub_1000623A0()
{
  return specialized Array._endMutation()();
}

uint64_t sub_1000623B0()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_1000623C0()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t sub_1000623D0()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_1000623E0()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_100062400()
{
  return static MainActor.shared.getter();
}

uint64_t sub_100062410()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_100062420()
{
  return static TaskPriority.userInitiated.getter();
}

uint64_t sub_100062430()
{
  return static TaskPriority.high.getter();
}

uint64_t sub_100062440()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_100062450()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_100062480()
{
  return dispatch thunk of AsyncSequence.makeAsyncIterator()();
}

uint64_t sub_100062490()
{
  return Double.write<A>(to:)();
}

uint64_t sub_1000624A0()
{
  return Set.description.getter();
}

uint64_t sub_1000624B0()
{
  return Set.init(minimumCapacity:)();
}

uint64_t sub_1000624C0()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_1000624D0()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_1000624E0()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_1000624F0()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_100062500()
{
  return static NSKeyedUnarchiver.unarchivedObject<A>(ofClass:from:)();
}

uint64_t sub_100062510()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t sub_100062520()
{
  return type metadata accessor for OS_dispatch_queue_serial.Attributes();
}

uint64_t sub_100062530()
{
  return OS_dispatch_queue_serial.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t sub_100062540()
{
  return OS_dispatch_queue_serial_executor.asUnownedSerialExecutor()();
}

NSNumber sub_100062550(Swift::Bool BOOLeanLiteral)
{
  return NSNumber.init(BOOLeanLiteral:)(BOOLeanLiteral);
}

Swift::Int sub_100062560(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t sub_100062570()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_100062580()
{
  return type metadata accessor for Optional();
}

uint64_t sub_100062590()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_1000625A0()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_1000625B0()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_1000625C0()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_1000625D0()
{
  return _HashTable.previousHole(before:)();
}

uint64_t sub_1000625E0()
{
  return _HashTable.nextHole(atOrAfter:)();
}

uint64_t sub_1000625F0()
{
  return __CocoaSet.makeIterator()();
}

uint64_t sub_100062600()
{
  return __CocoaSet.count.getter();
}

uint64_t sub_100062610()
{
  return __CocoaSet.member(for:)();
}

uint64_t sub_100062620()
{
  return __CocoaSet.Iterator.next()();
}

uint64_t sub_100062640()
{
  return static _SetStorage.copy(original:)();
}

uint64_t sub_100062650()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t sub_100062660()
{
  return static _SetStorage.convert(_:capacity:)();
}

uint64_t sub_100062670()
{
  return static _SetStorage.allocate(capacity:)();
}

void sub_100062680(Swift::Int a1)
{
}

uint64_t sub_100062690()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_1000626A0()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_1000626B0()
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_1000626C0()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_1000626D0()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_1000626E0()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_1000626F0()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t sub_100062700()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_100062710()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_100062720()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t sub_100062730()
{
  return AsyncMapSequence.base.getter();
}

uint64_t sub_100062740()
{
  return AsyncMapSequence.Iterator.baseIterator.modify();
}

uint64_t sub_100062750()
{
  return AsyncMapSequence.Iterator.transform.getter();
}

uint64_t sub_100062760()
{
  return AsyncMapSequence.Iterator.init(_:transform:)();
}

uint64_t sub_100062770()
{
  return AsyncMapSequence.transform.getter();
}

uint64_t sub_100062780()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100062790()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_1000627A0()
{
  return _bridgeCocoaArray<A>(_:)();
}

uint64_t sub_1000627B0()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_1000627C0()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_1000627D0()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_1000627E0()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_1000627F0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_100062810()
{
  return dispatch thunk of static _ObjectiveCBridgeable._conditionallyBridgeFromObjectiveC(_:result:)();
}

Swift::Int sub_100062830(Swift::Int a1)
{
  return _minimumMergeRunLength(_:)(a1);
}

uint64_t sub_100062840()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_100062850()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100062860()
{
  return dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter();
}

uint64_t sub_100062870()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_100062880()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_100062890()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_1000628A0()
{
  return Error._code.getter();
}

uint64_t sub_1000628B0()
{
  return Error._domain.getter();
}

uint64_t sub_1000628C0()
{
  return Error._userInfo.getter();
}

uint64_t sub_1000628D0()
{
  return Hasher.init(_seed:)();
}

void sub_1000628E0(Swift::UInt a1)
{
}

Swift::Int sub_1000628F0()
{
  return Hasher._finalize()();
}

uint64_t sub_100062900()
{
  return _typeName(_:qualified:)();
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyValue(key, applicationID, userName, hostName);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesSynchronize(applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return _CGImageCreateWithImageInRect(image, rect);
}

void CGImageRelease(CGImageRef image)
{
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

uint64_t CPIsInternalDevice()
{
  return _CPIsInternalDevice();
}

uint64_t CUTWeakLinkClass()
{
  return _CUTWeakLinkClass();
}

uint64_t CUTWeakLinkSymbol()
{
  return _CUTWeakLinkSymbol();
}

uint64_t MGCopyAnswerWithError()
{
  return _MGCopyAnswerWithError();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void NSLog(NSString *format, ...)
{
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return _NSSelectorFromString(aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

uint64_t PNCreateFormattedStringWithCountry()
{
  return _PNCreateFormattedStringWithCountry();
}

uint64_t TUBundle()
{
  return _TUBundle();
}

uint64_t TUCallScreeningRTTEnabled()
{
  return _TUCallScreeningRTTEnabled();
}

uint64_t TUCountryCodeForIncomingCall()
{
  return _TUCountryCodeForIncomingCall();
}

uint64_t TUFormattedPhoneNumber()
{
  return _TUFormattedPhoneNumber();
}

uint64_t TUHomeCountryCode()
{
  return _TUHomeCountryCode();
}

uint64_t TUNumberToDial()
{
  return _TUNumberToDial();
}

uint64_t TUOpenSensitiveURL()
{
  return _TUOpenSensitiveURL();
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return _UIContentSizeCategoryIsAccessibilityCategory(category);
}

void UIGraphicsBeginImageContext(CGSize size)
{
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

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _TUAssertShouldCrashApplication()
{
  return __TUAssertShouldCrashApplication();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return _dispatch_get_specific(key);
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
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

void *__cdecl dispatch_queue_get_specific(dispatch_queue_t queue, const void *key)
{
  return _dispatch_queue_get_specific(queue, key);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

long double fmod(long double __x, long double __y)
{
  return _fmod(__x, __y);
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

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return _notify_get_state(token, state64);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
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

void objc_exception_throw(id exception)
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

uint64_t objc_opt_new()
{
  return _objc_opt_new();
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

id objc_retainAutorelease(id a1)
{
  return _a1;
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

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t swift_allocBox()
{
  return _swift_allocBox();
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

uint64_t swift_unknownObjectWeakDestroy()
{
  return _swift_unknownObjectWeakDestroy();
}

uint64_t swift_unknownObjectWeakInit()
{
  return _swift_unknownObjectWeakInit();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return _swift_unknownObjectWeakLoadStrong();
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

id objc_msgSend_CGImage(void *a1, const char *a2, ...)
{
  return _[a1 CGImage];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _[a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _[a1 UUIDString];
}

id objc_msgSend__accessibilityHigherContrastTintColorForColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_accessibilityHigherContrastTintColorForColor:");
}

id objc_msgSend__carScreen(void *a1, const char *a2, ...)
{
  return _[a1 _carScreen];
}

id objc_msgSend__currentTraitCollection(void *a1, const char *a2, ...)
{
  return _[a1 _currentTraitCollection];
}

id objc_msgSend__phImageNamed_inBundle_compatibleWithTraitCollection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_phImageNamed:inBundle:compatibleWithTraitCollection:");
}

id objc_msgSend__preferredMaxLayoutWidth(void *a1, const char *a2, ...)
{
  return _[a1 _preferredMaxLayoutWidth];
}

id objc_msgSend__refreshAttributedText(void *a1, const char *a2, ...)
{
  return _[a1 _refreshAttributedText];
}

id objc_msgSend__requestHandlingOfIntent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_requestHandlingOfIntent:");
}

id objc_msgSend__scaledValueForValue_(void *a1, const char *a2, ...)
{
  return [a1 _scaledValueForValue:];
}

id objc_msgSend__setIdleTimerDisabled_forReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setIdleTimerDisabled:forReason:");
}

id objc_msgSend__setPreferredMaxLayoutWidth_(void *a1, const char *a2, ...)
{
  return [_a1 _setPreferredMaxLayoutWidth:];
}

id objc_msgSend__setTouchInsets_(void *a1, const char *a2, ...)
{
  return [a1 _setTouchInsets:];
}

id objc_msgSend__shouldShowRTTButton(void *a1, const char *a2, ...)
{
  return _[a1 _shouldShowRTTButton];
}

id objc_msgSend__tableView(void *a1, const char *a2, ...)
{
  return _[a1 _tableView];
}

id objc_msgSend__telephonyClient(void *a1, const char *a2, ...)
{
  return _[a1 _telephonyClient];
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

id objc_msgSend_accessoryType(void *a1, const char *a2, ...)
{
  return _[a1 accessoryType];
}

id objc_msgSend_accountManager(void *a1, const char *a2, ...)
{
  return _[a1 accountManager];
}

id objc_msgSend_accountUUID(void *a1, const char *a2, ...)
{
  return _[a1 accountUUID];
}

id objc_msgSend_accounts(void *a1, const char *a2, ...)
{
  return _[a1 accounts];
}

id objc_msgSend_actionButton(void *a1, const char *a2, ...)
{
  return _[a1 actionButton];
}

id objc_msgSend_activateConstraints_(void *a1, const char *a2, ...)
{
  return [a1 activateConstraints:];
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

id objc_msgSend_addDelegate_queue_(void *a1, const char *a2, ...)
{
  return [a1 addDelegate:queue:];
}

id objc_msgSend_addGestureRecognizer_(void *a1, const char *a2, ...)
{
  return [a1 addGestureRecognizer:];
}

id objc_msgSend_addLayoutGuide_(void *a1, const char *a2, ...)
{
  return [a1 addLayoutGuide:];
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return [a1 addObject:];
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return [a1 addObjectsFromArray:];
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return [a1 addObserver:selector:name:object:];
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return [a1 addSubview:];
}

id objc_msgSend_addTarget_action_forControlEvents_(void *a1, const char *a2, ...)
{
  return [a1 addTarget:action:forControlEvents:];
}

id objc_msgSend_addTarget_action_forEvents_(void *a1, const char *a2, ...)
{
  return [a1 addTarget:action:forEvents:];
}

id objc_msgSend_airplaneMode(void *a1, const char *a2, ...)
{
  return _[a1 airplaneMode];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _[a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _[a1 allObjects];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return _[a1 allValues];
}

id objc_msgSend_allocWithZone_(void *a1, const char *a2, ...)
{
  return [a1 allocWithZone:];
}

id objc_msgSend_alphaComponent(void *a1, const char *a2, ...)
{
  return _[a1 alphaComponent];
}

id objc_msgSend_animateWithDuration_animations_(void *a1, const char *a2, ...)
{
  return [a1 animateWithDuration:];
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return _[a1 anyObject];
}

id objc_msgSend_appendAttributedString_(void *a1, const char *a2, ...)
{
  return [a1 appendAttributedString:];
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return [a1 appendString:];
}

id objc_msgSend_areKeysAvailable_(void *a1, const char *a2, ...)
{
  return [a1 areKeysAvailable:];
}

id objc_msgSend_arrangedSubviews(void *a1, const char *a2, ...)
{
  return _[a1 arrangedSubviews];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayByAddingObjectsFromArray_(void *a1, const char *a2, ...)
{
  return [a1 arrayByAddingObjectsFromArray:];
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithCapacity:];
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithObjects:count:];
}

id objc_msgSend_attributedStringForDowntimeMessage_(void *a1, const char *a2, ...)
{
  return [a1 attributedStringForDowntimeMessage];
}

id objc_msgSend_attributedStringWithAttachment_(void *a1, const char *a2, ...)
{
  return [a1 attributedStringWithAttachment:];
}

id objc_msgSend_attributedText(void *a1, const char *a2, ...)
{
  return _[a1 attributedText];
}

id objc_msgSend_audioMessages(void *a1, const char *a2, ...)
{
  return _[a1 audioMessages];
}

id objc_msgSend_audioRouteButton(void *a1, const char *a2, ...)
{
  return _[a1 audioRouteButton];
}

id objc_msgSend_authorizationStatus(void *a1, const char *a2, ...)
{
  return _[a1 authorizationStatus];
}

id objc_msgSend_avatarViewController(void *a1, const char *a2, ...)
{
  return _[a1 avatarViewController];
}

id objc_msgSend_backgroundColor(void *a1, const char *a2, ...)
{
  return _[a1 backgroundColor];
}

id objc_msgSend_badgeView(void *a1, const char *a2, ...)
{
  return _[a1 badgeView];
}

id objc_msgSend_badgeViewTrailingToSubtitleLeadingConstrant(void *a1, const char *a2, ...)
{
  return _[a1 badgeViewTrailingToSubtitleLeadingConstrant];
}

id objc_msgSend_beginTrackingWithTouch_withEvent_(void *a1, const char *a2, ...)
{
  return [a1 beginTrackingWithTouch:withEvent:];
}

id objc_msgSend_bezierPathWithRoundedRect_cornerRadius_(void *a1, const char *a2, ...)
{
  return [a1 bezierPathWithRoundedRect:cornerRadius:];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return _[a1 blackColor];
}

id objc_msgSend_blockedByExtension(void *a1, const char *a2, ...)
{
  return _[a1 blockedByExtension];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_boostQualityOfService(void *a1, const char *a2, ...)
{
  return _[a1 boostQualityOfService];
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

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return [a1 bundleForClass:];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 bundleIdentifier];
}

id objc_msgSend_bundleWithPath_(void *a1, const char *a2, ...)
{
  return [a1 bundleWithPath:];
}

id objc_msgSend_button(void *a1, const char *a2, ...)
{
  return _[a1 button];
}

id objc_msgSend_buttonLayoutGuide(void *a1, const char *a2, ...)
{
  return _[a1 buttonLayoutGuide];
}

id objc_msgSend_buttonWithState_(void *a1, const char *a2, ...)
{
  return [a1 buttonWithState:];
}

id objc_msgSend_buttonWithType_(void *a1, const char *a2, ...)
{
  return [a1 buttonWithType:];
}

id objc_msgSend_calculatedHeightForCallRecordCellsWithWidth_(void *a1, const char *a2, ...)
{
  return [a1 calculatedHeightForCallRecordCellsWithWidth:];
}

id objc_msgSend_callButton(void *a1, const char *a2, ...)
{
  return _[a1 callButton];
}

id objc_msgSend_callButtonImage(void *a1, const char *a2, ...)
{
  return _[a1 callButtonImage];
}

id objc_msgSend_callButtonTappedHandler(void *a1, const char *a2, ...)
{
  return _[a1 callButtonTappedHandler];
}

id objc_msgSend_callDirectoryIdentityType(void *a1, const char *a2, ...)
{
  return _[a1 callDirectoryIdentityType];
}

id objc_msgSend_callDirectoryManagerIdentificationEntriesChangedNotificationToken(void *a1, const char *a2, ...)
{
  return _[a1 callDirectoryManagerIdentificationEntriesChangedNotificationToken];
}

id objc_msgSend_callFilterController(void *a1, const char *a2, ...)
{
  return _[a1 callFilterController];
}

id objc_msgSend_callHistoryCache(void *a1, const char *a2, ...)
{
  return _[a1 callHistoryCache];
}

id objc_msgSend_callHistoryController(void *a1, const char *a2, ...)
{
  return _[a1 callHistoryController];
}

id objc_msgSend_callHistoryControllerWithCoalescingStrategy_options_(void *a1, const char *a2, ...)
{
  return [a1 callHistoryControllerWithCoalescingStrategy:options:];
}

id objc_msgSend_callHistoryManager(void *a1, const char *a2, ...)
{
  return _[a1 callHistoryManager];
}

id objc_msgSend_callOccurrences(void *a1, const char *a2, ...)
{
  return _[a1 callOccurrences];
}

id objc_msgSend_callProviderCache(void *a1, const char *a2, ...)
{
  return _[a1 callProviderCache];
}

id objc_msgSend_callProviderIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 callProviderIdentifier];
}

id objc_msgSend_callProviderManager(void *a1, const char *a2, ...)
{
  return _[a1 callProviderManager];
}

id objc_msgSend_callRecordType(void *a1, const char *a2, ...)
{
  return _[a1 callRecordType];
}

id objc_msgSend_callRecords(void *a1, const char *a2, ...)
{
  return _[a1 callRecords];
}

id objc_msgSend_callScreeningEnabledM3(void *a1, const char *a2, ...)
{
  return _[a1 callScreeningEnabledM3];
}

id objc_msgSend_callService(void *a1, const char *a2, ...)
{
  return _[a1 callService];
}

id objc_msgSend_callStatus(void *a1, const char *a2, ...)
{
  return _[a1 callStatus];
}

id objc_msgSend_callTypeIconLayoutGuideLeadingAnchorLayoutConstraintConstant(void *a1, const char *a2, ...)
{
  return _[a1 callTypeIconLayoutGuideLeadingAnchorLayoutConstraintConstant];
}

id objc_msgSend_callTypeIconLayoutGuideLeadingAnchorLayoutConstraintConstantForContentCategorySize_(void *a1, const char *a2, ...)
{
  return [a1 callTypeIconLayoutGuideLeadingAnchorLayoutConstraintConstantForContentCategorySize:];
}

id objc_msgSend_callTypeIconLayoutGuideWidthAnchorLayoutConstraintConstant_(void *a1, const char *a2, ...)
{
  return [a1 callTypeIconLayoutGuideWidthAnchorLayoutConstraintConstant];
}

id objc_msgSend_callTypeIconSizingView(void *a1, const char *a2, ...)
{
  return _[a1 callTypeIconSizingView];
}

id objc_msgSend_callTypeIconView(void *a1, const char *a2, ...)
{
  return _[a1 callTypeIconView];
}

id objc_msgSend_callerCountLabel(void *a1, const char *a2, ...)
{
  return _[a1 callerCountLabel];
}

id objc_msgSend_callerDateLabel(void *a1, const char *a2, ...)
{
  return _[a1 callerDateLabel];
}

id objc_msgSend_callerId(void *a1, const char *a2, ...)
{
  return _[a1 callerId];
}

id objc_msgSend_callerIdForDisplay(void *a1, const char *a2, ...)
{
  return _[a1 callerIdForDisplay];
}

id objc_msgSend_callerIdIsBlocked(void *a1, const char *a2, ...)
{
  return _[a1 callerIdIsBlocked];
}

id objc_msgSend_callsWithPredicate_limit_offset_batchSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "callsWithPredicate:limit:offset:batchSize:");
}

id objc_msgSend_canAttemptEmergencyCallsWithoutCellularConnectionWithUUID_(void *a1, const char *a2, ...)
{
  return [a1 canAttemptEmergencyCallsWithoutCellularConnectionWithUUID:];
}

id objc_msgSend_canExceedUnifyingThreshold(void *a1, const char *a2, ...)
{
  return _[a1 canExceedUnifyingThreshold];
}

id objc_msgSend_canMakeEmergencyCallForSenderIdentity_(void *a1, const char *a2, ...)
{
  return [a1 canMakeEmergencyCallForSenderIdentity:];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return _[a1 cancel];
}

id objc_msgSend_cancelTrackingWithEvent_(void *a1, const char *a2, ...)
{
  return [a1 cancelTrackingWithEvent:];
}

id objc_msgSend_canonicalHandleForISOCountryCode_(void *a1, const char *a2, ...)
{
  return [a1 canonicalHandleForISOCountryCode:];
}

id objc_msgSend_capHeight(void *a1, const char *a2, ...)
{
  return _[a1 capHeight];
}

id objc_msgSend_centerXAnchor(void *a1, const char *a2, ...)
{
  return _[a1 centerXAnchor];
}

id objc_msgSend_centerYAnchor(void *a1, const char *a2, ...)
{
  return _[a1 centerYAnchor];
}

id objc_msgSend_circleDiameter(void *a1, const char *a2, ...)
{
  return _[a1 circleDiameter];
}

id objc_msgSend_circleView(void *a1, const char *a2, ...)
{
  return _[a1 circleView];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return _[a1 clearColor];
}

id objc_msgSend_closestPositionToPoint_(void *a1, const char *a2, ...)
{
  return [a1 closestPositionToPoint:];
}

id objc_msgSend_coalescedCallWithCall_usingStrategy_(void *a1, const char *a2, ...)
{
  return [a1 coalescedCallWithCall:usingStrategy:];
}

id objc_msgSend_coalescingStrategy(void *a1, const char *a2, ...)
{
  return _[a1 coalescingStrategy];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _[a1 code];
}

id objc_msgSend_collapsedBottomConstraint(void *a1, const char *a2, ...)
{
  return _[a1 collapsedBottomConstraint];
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

id objc_msgSend_completionDispatchQueue(void *a1, const char *a2, ...)
{
  return _[a1 completionDispatchQueue];
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return [a1 componentsSeparatedByString:];
}

id objc_msgSend_confidence(void *a1, const char *a2, ...)
{
  return _[a1 confidence];
}

id objc_msgSend_confidenceRating(void *a1, const char *a2, ...)
{
  return _[a1 confidenceRating];
}

id objc_msgSend_configureForCallHistory(void *a1, const char *a2, ...)
{
  return _[a1 configureForCallHistory];
}

id objc_msgSend_configureForImage_(void *a1, const char *a2, ...)
{
  return [a1 configureForImage:];
}

id objc_msgSend_configureGridViewArrangedSubviews(void *a1, const char *a2, ...)
{
  return _[a1 configureGridViewArrangedSubviews];
}

id objc_msgSend_configureRecentCallTableViewCell_forRecentCall_numberOfOccurences_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configureRecentCallTableViewCell:forRecentCall:numberOfOccurences:");
}

id objc_msgSend_configureViewForEmergencyCountdown(void *a1, const char *a2, ...)
{
  return _[a1 configureViewForEmergencyCountdown];
}

id objc_msgSend_configureVoicemailTableViewCell_forVoicemail_(void *a1, const char *a2, ...)
{
  return [a1 configureVoicemailTableViewCell:forVoicemail:];
}

id objc_msgSend_configureWithRecentsItem_recentCall_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configureWithRecentsItem:recentCall:");
}

id objc_msgSend_configureWithViewModel_(void *a1, const char *a2, ...)
{
  return [a1 configureWithViewModel:];
}

id objc_msgSend_configureWithVoicemailMessageViewModel_expanded_shouldGrayForeground_(void *a1, const char *a2, ...)
{
  return [a1 configureWithVoicemailMessageViewModel:expanded:shouldGrayForeground:];
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

id objc_msgSend_constraintEqualToSystemSpacingBelowAnchor_multiplier_(void *a1, const char *a2, ...)
{
  return [a1 constraintEqualToSystemSpacingBelowAnchor:multiplier:];
}

id objc_msgSend_constraintGreaterThanOrEqualToAnchor_(void *a1, const char *a2, ...)
{
  return [a1 constraintGreaterThanOrEqualToAnchor:];
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
  return [a1 constraintLessThanOrEqualToAnchor:constant:];
}

id objc_msgSend_constraintLessThanOrEqualToConstant_(void *a1, const char *a2, ...)
{
  return [a1 constraintLessThanOrEqualToConstant:];
}

id objc_msgSend_constraintsForLayouts(void *a1, const char *a2, ...)
{
  return _[a1 constraintsForLayouts];
}

id objc_msgSend_constraintsKeyForAccessibleLayout_expanded_editing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintsKeyForAccessibleLayout:expanded:editing:");
}

id objc_msgSend_constraintsLoaded(void *a1, const char *a2, ...)
{
  return _[a1 constraintsLoaded];
}

id objc_msgSend_contactCache(void *a1, const char *a2, ...)
{
  return _[a1 contactCache];
}

id objc_msgSend_contactForHandle_(void *a1, const char *a2, ...)
{
  return [a1 contactForHandle:];
}

id objc_msgSend_contactForHandle_isoCountryCode_metadataCache_(void *a1, const char *a2, ...)
{
  return [a1 contactForHandle:isoCountryCode:metadataCache:];
}

id objc_msgSend_contactForRecentCall_metadataCache_(void *a1, const char *a2, ...)
{
  return [a1 contactForRecentCall:metadataCache:];
}

id objc_msgSend_contactFormatter(void *a1, const char *a2, ...)
{
  return _[a1 contactFormatter];
}

id objc_msgSend_contactHandlesForHandle_(void *a1, const char *a2, ...)
{
  return [a1 contactHandlesForHandle:];
}

id objc_msgSend_contactHandlesForRecentCalls_(void *a1, const char *a2, ...)
{
  return [a1 contactHandlesForRecentCalls];
}

id objc_msgSend_contactKeyDescriptors(void *a1, const char *a2, ...)
{
  return _[a1 contactKeyDescriptors];
}

id objc_msgSend_contactRelations(void *a1, const char *a2, ...)
{
  return _[a1 contactRelations];
}

id objc_msgSend_contactStore(void *a1, const char *a2, ...)
{
  return _[a1 contactStore];
}

id objc_msgSend_contactType(void *a1, const char *a2, ...)
{
  return _[a1 contactType];
}

id objc_msgSend_contactsByHandleForRecentCall_keyDescriptors_(void *a1, const char *a2, ...)
{
  return [a1 contactsByHandleForRecentCall:keyDescriptors:];
}

id objc_msgSend_contactsForHandles_keyDescriptors_(void *a1, const char *a2, ...)
{
  return [a1 contactsForHandles:keyDescriptors:];
}

id objc_msgSend_contactsForHandles_keyDescriptors_alwaysUnifyLabeledValues_(void *a1, const char *a2, ...)
{
  return [a1 contactsForHandles:keyDescriptors:alwaysUnifyLabeledValues:];
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return [a1 containsObject:];
}

id objc_msgSend_containsRestrictedHandle_forBundleIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 containsRestrictedHandle:forBundleIdentifier:];
}

id objc_msgSend_contentLayoutGuide(void *a1, const char *a2, ...)
{
  return _[a1 contentLayoutGuide];
}

id objc_msgSend_contentScrollView(void *a1, const char *a2, ...)
{
  return _[a1 contentScrollView];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return _[a1 contentView];
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return _[a1 context];
}

id objc_msgSend_continueTrackingWithTouch_withEvent_(void *a1, const char *a2, ...)
{
  return [a1 continueTrackingWithTouch:withEvent:];
}

id objc_msgSend_conversationForCallUID_(void *a1, const char *a2, ...)
{
  return [a1 conversationForCallUID:];
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
  return [a1 countByEnumeratingWithState:objects:count:];
}

id objc_msgSend_countOfExcludedHandles(void *a1, const char *a2, ...)
{
  return _[a1 countOfExcludedHandles];
}

id objc_msgSend_countdownCancelled(void *a1, const char *a2, ...)
{
  return _[a1 countdownCancelled];
}

id objc_msgSend_countdownLabel(void *a1, const char *a2, ...)
{
  return _[a1 countdownLabel];
}

id objc_msgSend_countdownTimer(void *a1, const char *a2, ...)
{
  return _[a1 countdownTimer];
}

id objc_msgSend_countdownView(void *a1, const char *a2, ...)
{
  return _[a1 countdownView];
}

id objc_msgSend_createConstraints(void *a1, const char *a2, ...)
{
  return _[a1 createConstraints];
}

id objc_msgSend_createConstraintsForAccessibleExpandedLayout(void *a1, const char *a2, ...)
{
  return _[a1 createConstraintsForAccessibleExpandedLayout];
}

id objc_msgSend_createConstraintsForAccessibleNonExpandedLayoutForEditing_(void *a1, const char *a2, ...)
{
  return [a1 createConstraintsForAccessibleNonExpandedLayoutForEditing:];
}

id objc_msgSend_createConstraintsForNonAccessibleExpandedLayout(void *a1, const char *a2, ...)
{
  return _[a1 createConstraintsForNonAccessibleExpandedLayout];
}

id objc_msgSend_createConstraintsForNonAccessibleNonExpandedLayoutForEditing_(void *a1, const char *a2, ...)
{
  return [a1 createConstraintsForNonAccessibleNonExpandedLayoutForEditing];
}

id objc_msgSend_createFixedConstraintsForAccessibleLayout(void *a1, const char *a2, ...)
{
  return _[a1 createFixedConstraintsForAccessibleLayout];
}

id objc_msgSend_createFixedConstraintsForNonAccessibleLayout(void *a1, const char *a2, ...)
{
  return _[a1 createFixedConstraintsForNonAccessibleLayout];
}

id objc_msgSend_currentActiveFixedConstraints(void *a1, const char *a2, ...)
{
  return _[a1 currentActiveFixedConstraints];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return _[a1 currentLocale];
}

id objc_msgSend_currentRequiredConstraints(void *a1, const char *a2, ...)
{
  return _[a1 currentRequiredConstraints];
}

id objc_msgSend_currentRequiredConstraintsKey(void *a1, const char *a2, ...)
{
  return _[a1 currentRequiredConstraintsKey];
}

id objc_msgSend_currentThumbImage(void *a1, const char *a2, ...)
{
  return _[a1 currentThumbImage];
}

id objc_msgSend_currentViewModel(void *a1, const char *a2, ...)
{
  return _[a1 currentViewModel];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_dateLabelTrailingLayoutConstraintConstant(void *a1, const char *a2, ...)
{
  return _[a1 dateLabelTrailingLayoutConstraintConstant];
}

id objc_msgSend_deactivateConstraints_(void *a1, const char *a2, ...)
{
  return [a1 deactivateConstraints:];
}

id objc_msgSend_decodeBoolForKey_(void *a1, const char *a2, ...)
{
  return [a1 decodeBoolForKey:];
}

id objc_msgSend_decodeObjectOfClass_forKey_(void *a1, const char *a2, ...)
{
  return [a1 decodeObjectOfClass:forKey:];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _[a1 delegate];
}

id objc_msgSend_delegateToQueue(void *a1, const char *a2, ...)
{
  return _[a1 delegateToQueue];
}

id objc_msgSend_deleteAllRecentCalls(void *a1, const char *a2, ...)
{
  return _[a1 deleteAllRecentCalls];
}

id objc_msgSend_deleteRecentCalls_(void *a1, const char *a2, ...)
{
  return [a1 deleteRecentCalls:];
}

id objc_msgSend_dequeueReusableCellWithIdentifier_forIndexPath_(void *a1, const char *a2, ...)
{
  return [a1 dequeueReusableCellWithIdentifier:forIndexPath:];
}

id objc_msgSend_descriptorForRequiredKeys(void *a1, const char *a2, ...)
{
  return _[a1 descriptorForRequiredKeys];
}

id objc_msgSend_descriptorForRequiredKeysForStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "descriptorForRequiredKeysForStyle:");
}

id objc_msgSend_deselectRowAtIndexPath_animated_(void *a1, const char *a2, ...)
{
  return [a1 deselectRowAtIndexPath:animated:];
}

id objc_msgSend_desiredSize(void *a1, const char *a2, ...)
{
  return _[a1 desiredSize];
}

id objc_msgSend_detailScrubController(void *a1, const char *a2, ...)
{
  return _[a1 detailScrubController];
}

id objc_msgSend_detailSlider_didChangeElapsedTime_(void *a1, const char *a2, ...)
{
  return [a1 detailSlider:didChangeElapsedTime:];
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

id objc_msgSend_dialRequestForCallProvider_handle_(void *a1, const char *a2, ...)
{
  return [a1 dialRequestForCallProvider:handle:];
}

id objc_msgSend_dialRequestForRecentCall_(void *a1, const char *a2, ...)
{
  return [a1 dialRequestForRecentCall:];
}

id objc_msgSend_dialType(void *a1, const char *a2, ...)
{
  return _[a1 dialType];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithObjects:forKeys:count:];
}

id objc_msgSend_dimmedColor(void *a1, const char *a2, ...)
{
  return _[a1 dimmedColor];
}

id objc_msgSend_directionalLayoutMargins(void *a1, const char *a2, ...)
{
  return _[a1 directionalLayoutMargins];
}

id objc_msgSend_dispatchQueue(void *a1, const char *a2, ...)
{
  return _[a1 dispatchQueue];
}

id objc_msgSend_doesNotRecognizeSelector_(void *a1, const char *a2, ...)
{
  return [a1 doesNotRecognizeSelector:];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return _[a1 domain];
}

id objc_msgSend_donated(void *a1, const char *a2, ...)
{
  return _[a1 donated];
}

id objc_msgSend_drawInRect_(void *a1, const char *a2, ...)
{
  return [a1 drawInRect:];
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return _[a1 duration];
}

id objc_msgSend_dynamicLabelColor(void *a1, const char *a2, ...)
{
  return _[a1 dynamicLabelColor];
}

id objc_msgSend_dynamicSecondaryLabelColor(void *a1, const char *a2, ...)
{
  return _[a1 dynamicSecondaryLabelColor];
}

id objc_msgSend_dynamicTertiaryLabelColor(void *a1, const char *a2, ...)
{
  return _[a1 dynamicTertiaryLabelColor];
}

id objc_msgSend_effectiveBaselineOffsetFromBottom(void *a1, const char *a2, ...)
{
  return _[a1 effectiveBaselineOffsetFromBottom];
}

id objc_msgSend_effectiveBaselineOffsetFromContentBottom(void *a1, const char *a2, ...)
{
  return _[a1 effectiveBaselineOffsetFromContentBottom];
}

id objc_msgSend_effectiveFirstBaselineOffsetFromContentTop(void *a1, const char *a2, ...)
{
  return _[a1 effectiveFirstBaselineOffsetFromContentTop];
}

id objc_msgSend_effectiveFirstBaselineOffsetFromTop(void *a1, const char *a2, ...)
{
  return _[a1 effectiveFirstBaselineOffsetFromTop];
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

id objc_msgSend_encodeBool_forKey_(void *a1, const char *a2, ...)
{
  return [a1 encodeBool:forKey:];
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return [a1 encodeObject:forKey:];
}

id objc_msgSend_endTrackingWithTouch_withEvent_(void *a1, const char *a2, ...)
{
  return [a1 endTrackingWithTouch:withEvent:];
}

id objc_msgSend_enumerateAttribute_inRange_options_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:");
}

id objc_msgSend_exceptionWithName_reason_userInfo_(void *a1, const char *a2, ...)
{
  return [a1 exceptionWithName:reason:userInfo:];
}

id objc_msgSend_executeFetchRequest_error_(void *a1, const char *a2, ...)
{
  return [a1 executeFetchRequest:error:];
}

id objc_msgSend_expandedConstraints(void *a1, const char *a2, ...)
{
  return _[a1 expandedConstraints];
}

id objc_msgSend_extensionContext(void *a1, const char *a2, ...)
{
  return _[a1 extensionContext];
}

id objc_msgSend_faceTimeProvider(void *a1, const char *a2, ...)
{
  return _[a1 faceTimeProvider];
}

id objc_msgSend_familyName(void *a1, const char *a2, ...)
{
  return _[a1 familyName];
}

id objc_msgSend_featureFlags(void *a1, const char *a2, ...)
{
  return _[a1 featureFlags];
}

id objc_msgSend_feedbackTextView(void *a1, const char *a2, ...)
{
  return _[a1 feedbackTextView];
}

id objc_msgSend_fetchCallProviderForRecentCall_(void *a1, const char *a2, ...)
{
  return [a1 fetchCallProviderForRecentCall:];
}

id objc_msgSend_fetchCellularRadioEnabled(void *a1, const char *a2, ...)
{
  return _[a1 fetchCellularRadioEnabled];
}

id objc_msgSend_fetchContactFormatter(void *a1, const char *a2, ...)
{
  return _[a1 fetchContactFormatter];
}

id objc_msgSend_fetchContactsForHandles_(void *a1, const char *a2, ...)
{
  return [a1 fetchContactsForHandles:];
}

id objc_msgSend_fetchContactsForMessages_keyDescriptors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchContactsForMessages:keyDescriptors:");
}

id objc_msgSend_fetchContactsForRecentCalls_(void *a1, const char *a2, ...)
{
  return [a1 fetchContactsForRecentCalls];
}

id objc_msgSend_fetchImageForRecentCall_(void *a1, const char *a2, ...)
{
  return [a1 fetchImageForRecentCall];
}

id objc_msgSend_fetchMessagesCompletion_(void *a1, const char *a2, ...)
{
  return [a1 fetchMessagesCompletion:];
}

id objc_msgSend_fetchMessagesWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 fetchMessagesWithCompletion:];
}

id objc_msgSend_fetchMetadataForMessages_(void *a1, const char *a2, ...)
{
  return [a1 fetchMetadataForMessages:];
}

id objc_msgSend_fetchMetadataForRecentCalls_(void *a1, const char *a2, ...)
{
  return [a1 fetchMetadataForRecentCalls];
}

id objc_msgSend_fetchMutableItemForRecentCall_(void *a1, const char *a2, ...)
{
  return [a1 fetchMutableItemForRecentCall];
}

id objc_msgSend_fetchMutableItemForRecentCall_numberOfOccurences_(void *a1, const char *a2, ...)
{
  return [a1 fetchMutableItemForRecentCall:numberOfOccurences:];
}

id objc_msgSend_fetchNumberFormatter(void *a1, const char *a2, ...)
{
  return _[a1 fetchNumberFormatter];
}

id objc_msgSend_fetchRTTConversationForCallUUID_(void *a1, const char *a2, ...)
{
  return [a1 fetchRTTConversationForCallUUID:];
}

id objc_msgSend_fetchRecentCalls(void *a1, const char *a2, ...)
{
  return _[a1 fetchRecentCalls];
}

id objc_msgSend_fetchRingerSwitchEnabled(void *a1, const char *a2, ...)
{
  return _[a1 fetchRingerSwitchEnabled];
}

id objc_msgSend_fetchUnifiedContactForID_withDescriptors_(void *a1, const char *a2, ...)
{
  return [a1 fetchUnifiedContactForID:withDescriptors:];
}

id objc_msgSend_fill(void *a1, const char *a2, ...)
{
  return _[a1 fill];
}

id objc_msgSend_filteredArrayUsingPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filteredArrayUsingPredicate:");
}

id objc_msgSend_firstBaselineAnchor(void *a1, const char *a2, ...)
{
  return _[a1 firstBaselineAnchor];
}

id objc_msgSend_firstItem(void *a1, const char *a2, ...)
{
  return _[a1 firstItem];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return _[a1 floatValue];
}

id objc_msgSend_folder(void *a1, const char *a2, ...)
{
  return _[a1 folder];
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

id objc_msgSend_fontName(void *a1, const char *a2, ...)
{
  return _[a1 fontName];
}

id objc_msgSend_fontWithDescriptor_size_(void *a1, const char *a2, ...)
{
  return [a1 fontWithDescriptor:];
}

id objc_msgSend_foregroundView(void *a1, const char *a2, ...)
{
  return _[a1 foregroundView];
}

id objc_msgSend_foregroundViewTapGestureRecognizer(void *a1, const char *a2, ...)
{
  return _[a1 foregroundViewTapGestureRecognizer];
}

id objc_msgSend_formattedNameForHandle_countryCode_(void *a1, const char *a2, ...)
{
  return [a1 formattedNameForHandle:countryCode:];
}

id objc_msgSend_frameLayoutGuide(void *a1, const char *a2, ...)
{
  return _[a1 frameLayoutGuide];
}

id objc_msgSend_fullDateLabel(void *a1, const char *a2, ...)
{
  return _[a1 fullDateLabel];
}

id objc_msgSend_fullName(void *a1, const char *a2, ...)
{
  return _[a1 fullName];
}

id objc_msgSend_gestureRecognizers(void *a1, const char *a2, ...)
{
  return _[a1 gestureRecognizers];
}

id objc_msgSend_getActiveContextsWithCallback_(void *a1, const char *a2, ...)
{
  return [a1 getActiveContextsWithCallback:];
}

id objc_msgSend_getVisualVoiceMailWithVisualVoicemailManager_onVoicemailsChanged_(void *a1, const char *a2, ...)
{
  return [a1 getVisualVoiceMailWithVisualVoicemailManager:onVoicemailsChanged:];
}

id objc_msgSend_getVoicemailInfo_completion_(void *a1, const char *a2, ...)
{
  return [a1 getVoicemailInfo:completion:];
}

id objc_msgSend_givenName(void *a1, const char *a2, ...)
{
  return _[a1 givenName];
}

id objc_msgSend_gridView(void *a1, const char *a2, ...)
{
  return _[a1 gridView];
}

id objc_msgSend_handle(void *a1, const char *a2, ...)
{
  return _[a1 handle];
}

id objc_msgSend_handleForCHRecentCall_(void *a1, const char *a2, ...)
{
  return [a1 handleForCHRecentCall];
}

id objc_msgSend_handleType(void *a1, const char *a2, ...)
{
  return _[a1 handleType];
}

id objc_msgSend_handleWithDestinationID_(void *a1, const char *a2, ...)
{
  return [a1 handleWithDestinationID:];
}

id objc_msgSend_hasSuffix_(void *a1, const char *a2, ...)
{
  return [a1 hasSuffix:];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return _[a1 hash];
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return _[a1 heightAnchor];
}

id objc_msgSend_hideAccessoryViews(void *a1, const char *a2, ...)
{
  return _[a1 hideAccessoryViews];
}

id objc_msgSend_hideUnreadIndicatorMetadataViewLeadingConstraint(void *a1, const char *a2, ...)
{
  return _[a1 hideUnreadIndicatorMetadataViewLeadingConstraint];
}

id objc_msgSend_hostedViewMaximumAllowedSize(void *a1, const char *a2, ...)
{
  return _[a1 hostedViewMaximumAllowedSize];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_identityExtension(void *a1, const char *a2, ...)
{
  return _[a1 identityExtension];
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return _[a1 image];
}

id objc_msgSend_imageNamed_inBundle_compatibleWithTraitCollection_(void *a1, const char *a2, ...)
{
  return [a1 imageNamed:inBundle:compatibleWithTraitCollection:];
}

id objc_msgSend_imageOrientation(void *a1, const char *a2, ...)
{
  return _[a1 imageOrientation];
}

id objc_msgSend_imageURL(void *a1, const char *a2, ...)
{
  return _[a1 imageURL];
}

id objc_msgSend_imageWithCGImage_scale_orientation_(void *a1, const char *a2, ...)
{
  return [a1 imageWithCGImage:scale:orientation:];
}

id objc_msgSend_imageWithRenderingMode_(void *a1, const char *a2, ...)
{
  return [a1 imageWithRenderingMode:];
}

id objc_msgSend_indexOfObject_(void *a1, const char *a2, ...)
{
  return [a1 indexOfObject:];
}

id objc_msgSend_indexPathForCell_(void *a1, const char *a2, ...)
{
  return [a1 indexPathForCell:];
}

id objc_msgSend_indexPathForRow_inSection_(void *a1, const char *a2, ...)
{
  return [a1 indexPathForRow:inSection:];
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

id objc_msgSend_infoButton(void *a1, const char *a2, ...)
{
  return _[a1 infoButton];
}

id objc_msgSend_initWithAccessibleLayout_(void *a1, const char *a2, ...)
{
  return [a1 initWithAccessibleLayout:];
}

id objc_msgSend_initWithAccountID_label_hasUnreadMessages_(void *a1, const char *a2, ...)
{
  return [a1 initWithAccountID:label:hasUnreadMessages:];
}

id objc_msgSend_initWithActivityIndicatorStyle_(void *a1, const char *a2, ...)
{
  return [a1 initWithActivityIndicatorStyle:];
}

id objc_msgSend_initWithArray_(void *a1, const char *a2, ...)
{
  return [a1 initWithArray:];
}

id objc_msgSend_initWithAttributedString_(void *a1, const char *a2, ...)
{
  return [a1 initWithAttributedString:];
}

id objc_msgSend_initWithCallHistoryController_callProviderManager_contactStore_suggestedContactStore_metadataCache_(void *a1, const char *a2, ...)
{
  return [a1 initWithCallHistoryController:callHistoryController callProviderManager:callProviderManager contactStore:contactStore suggestedContactStore:suggestedContactStore metadataCache:metadataCache];
}

id objc_msgSend_initWithCallProviderManager_(void *a1, const char *a2, ...)
{
  return [a1 initWithCallProviderManager:];
}

id objc_msgSend_initWithDataProviders_(void *a1, const char *a2, ...)
{
  return [a1 initWithDataProviders:];
}

id objc_msgSend_initWithDestinationID_isoCountryCode_(void *a1, const char *a2, ...)
{
  return [a1 initWithDestinationID:isoCountryCode:];
}

id objc_msgSend_initWithDiameter_(void *a1, const char *a2, ...)
{
  return [a1 initWithDiameter:];
}

id objc_msgSend_initWithDonated_transcribing_transcriptionAttempted_transcriptionAvailable_messageTranscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDonated:transcribing:transcriptionAttempted:transcriptionAvailable:messageTranscript:");
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return [a1 initWithFrame:];
}

id objc_msgSend_initWithFrame_style_(void *a1, const char *a2, ...)
{
  return [a1 initWithFrame:style:];
}

id objc_msgSend_initWithHandle_(void *a1, const char *a2, ...)
{
  return [a1 initWithHandle:];
}

id objc_msgSend_initWithHandles_(void *a1, const char *a2, ...)
{
  return [a1 initWithHandles:];
}

id objc_msgSend_initWithImage_(void *a1, const char *a2, ...)
{
  return [a1 initWithImage:];
}

id objc_msgSend_initWithKeysToFetch_(void *a1, const char *a2, ...)
{
  return [a1 initWithKeysToFetch:];
}

id objc_msgSend_initWithMPMessage_(void *a1, const char *a2, ...)
{
  return [a1 initWithMPMessage:];
}

id objc_msgSend_initWithMetadataCache_callProviderManager_(void *a1, const char *a2, ...)
{
  return [a1 initWithMetadataCache:callProviderManager:];
}

id objc_msgSend_initWithProvider_(void *a1, const char *a2, ...)
{
  return [a1 initWithProvider:];
}

id objc_msgSend_initWithQueue_(void *a1, const char *a2, ...)
{
  return [a1 initWithQueue:];
}

id objc_msgSend_initWithRemoteMembers_(void *a1, const char *a2, ...)
{
  return [a1 initWithRemoteMembers:];
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

id objc_msgSend_initWithTarget_action_(void *a1, const char *a2, ...)
{
  return [a1 initWithTarget:action:];
}

id objc_msgSend_initWithTitle_(void *a1, const char *a2, ...)
{
  return [a1 initWithTitle:];
}

id objc_msgSend_initWithType_(void *a1, const char *a2, ...)
{
  return [a1 initWithType:];
}

id objc_msgSend_initWithType_value_(void *a1, const char *a2, ...)
{
  return [a1 initWithType:value:];
}

id objc_msgSend_initWithUrlString_username_userIdentifier_service_(void *a1, const char *a2, ...)
{
  return [a1 initWithUrlString:username:userIdentifier:service:];
}

id objc_msgSend_initWithVMTranscript_(void *a1, const char *a2, ...)
{
  return [a1 initWithVMTranscript];
}

id objc_msgSend_initWithVMVoicemail_(void *a1, const char *a2, ...)
{
  return [a1 initWithVMVoicemail:];
}

id objc_msgSend_initWithValue_(void *a1, const char *a2, ...)
{
  return [a1 initWithValue:];
}

id objc_msgSend_initWithVoicemailManager_accountManager_callProviderManager_contactStore_suggestedContactStore_metadataCache_(void *a1, const char *a2, ...)
{
  return [a1 initWithVoicemailManager:accountManager:callProviderManager:contactStore:suggestedContactStore:metadataCache:];
}

id objc_msgSend_initialConstraints(void *a1, const char *a2, ...)
{
  return _[a1 initialConstraints];
}

id objc_msgSend_initializeCachedValues(void *a1, const char *a2, ...)
{
  return _[a1 initializeCachedValues];
}

id objc_msgSend_insertArrangedSubview_atIndex_(void *a1, const char *a2, ...)
{
  return [a1 insertArrangedSubview:atIndex:];
}

id objc_msgSend_insertAttributedString_atIndex_(void *a1, const char *a2, ...)
{
  return [a1 insertAttributedString:atIndex:];
}

id objc_msgSend_insertColumnAtIndex_withArrangedSubviews_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertColumnAtIndex:withArrangedSubviews:");
}

id objc_msgSend_instantMessageAddresses(void *a1, const char *a2, ...)
{
  return _[a1 instantMessageAddresses];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _[a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_intent(void *a1, const char *a2, ...)
{
  return _[a1 intent];
}

id objc_msgSend_intentResponse(void *a1, const char *a2, ...)
{
  return _[a1 intentResponse];
}

id objc_msgSend_interaction(void *a1, const char *a2, ...)
{
  return _[a1 interaction];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _[a1 invalidate];
}

id objc_msgSend_invitationPreferencesForRecentCall(void *a1, const char *a2, ...)
{
  return _[a1 invitationPreferencesForRecentCall];
}

id objc_msgSend_isAccessibilityConstraintsEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isAccessibilityConstraintsEnabled];
}

id objc_msgSend_isAccessiblityConstraintsEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isAccessiblityConstraintsEnabled];
}

id objc_msgSend_isAccountSubscribed_(void *a1, const char *a2, ...)
{
  return [a1 isAccountSubscribed:];
}

id objc_msgSend_isCallVoicemailSupportedForAccountUUID_(void *a1, const char *a2, ...)
{
  return [a1 isCallVoicemailSupportedForAccountUUID:];
}

id objc_msgSend_isContinuous(void *a1, const char *a2, ...)
{
  return _[a1 isContinuous];
}

id objc_msgSend_isDeleted(void *a1, const char *a2, ...)
{
  return _[a1 isDeleted];
}

id objc_msgSend_isDragging(void *a1, const char *a2, ...)
{
  return _[a1 isDragging];
}

id objc_msgSend_isEditing(void *a1, const char *a2, ...)
{
  return _[a1 isEditing];
}

id objc_msgSend_isEmergencyNumberForDigits_senderIdentityUUID_(void *a1, const char *a2, ...)
{
  return [a1 isEmergencyNumberForDigits:senderIdentityUUID:];
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isEnabled];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return [a1 isEqual:];
}

id objc_msgSend_isEqualToArray_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToArray:];
}

id objc_msgSend_isEqualToAttributedString_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToAttributedString:];
}

id objc_msgSend_isEqualToDate_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToDate:];
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToString:];
}

id objc_msgSend_isEqualToVoicemailMessageViewModel_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToVoicemailMessageViewModel:];
}

id objc_msgSend_isExpanded(void *a1, const char *a2, ...)
{
  return _[a1 isExpanded];
}

id objc_msgSend_isFaceTimeProvider(void *a1, const char *a2, ...)
{
  return _[a1 isFaceTimeProvider];
}

id objc_msgSend_isGeminiCapable(void *a1, const char *a2, ...)
{
  return _[a1 isGeminiCapable];
}

id objc_msgSend_isHidden(void *a1, const char *a2, ...)
{
  return _[a1 isHidden];
}

id objc_msgSend_isInitializationBlockQueued(void *a1, const char *a2, ...)
{
  return _[a1 isInitializationBlockQueued];
}

id objc_msgSend_isJunk(void *a1, const char *a2, ...)
{
  return _[a1 isJunk];
}

id objc_msgSend_isKeyAvailable_(void *a1, const char *a2, ...)
{
  return [a1 isKeyAvailable:];
}

id objc_msgSend_isLikePhoneNumber_(void *a1, const char *a2, ...)
{
  return [a1 isLikePhoneNumber:];
}

id objc_msgSend_isLocalizedSubtitleUnknown_(void *a1, const char *a2, ...)
{
  return [a1 isLocalizedSubtitleUnknown];
}

id objc_msgSend_isMe(void *a1, const char *a2, ...)
{
  return _[a1 isMe];
}

id objc_msgSend_isPreferredContentSizeCategoryAccessible(void *a1, const char *a2, ...)
{
  return _[a1 isPreferredContentSizeCategoryAccessible];
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

id objc_msgSend_isTelephonyProvider(void *a1, const char *a2, ...)
{
  return _[a1 isTelephonyProvider];
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

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return _[a1 isValid];
}

id objc_msgSend_isoCountryCode(void *a1, const char *a2, ...)
{
  return _[a1 isoCountryCode];
}

id objc_msgSend_item(void *a1, const char *a2, ...)
{
  return _[a1 item];
}

id objc_msgSend_itemCache(void *a1, const char *a2, ...)
{
  return _[a1 itemCache];
}

id objc_msgSend_itemForRecentCall_numberOfOccurences_(void *a1, const char *a2, ...)
{
  return [a1 itemForRecentCall:numberOfOccurences:];
}

id objc_msgSend_junkIdentificationCategory(void *a1, const char *a2, ...)
{
  return _[a1 junkIdentificationCategory];
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return _[a1 label];
}

id objc_msgSend_labelID(void *a1, const char *a2, ...)
{
  return _[a1 labelID];
}

id objc_msgSend_labeledValueForEmailAddress_(void *a1, const char *a2, ...)
{
  return [a1 labeledValueForEmailAddress:];
}

id objc_msgSend_labeledValueForPhoneNumber_(void *a1, const char *a2, ...)
{
  return [a1 labeledValueForPhoneNumber:];
}

id objc_msgSend_labeledValueForSocialProfileWithUsername_(void *a1, const char *a2, ...)
{
  return [a1 labeledValueForSocialProfileWithUsername:];
}

id objc_msgSend_labeledValueWithLabel_value_(void *a1, const char *a2, ...)
{
  return [a1 labeledValueWithLabel:value:];
}

id objc_msgSend_labelsEnabled(void *a1, const char *a2, ...)
{
  return _[a1 labelsEnabled];
}

id objc_msgSend_largestCallTypeIconWidth(void *a1, const char *a2, ...)
{
  return _[a1 largestCallTypeIconWidth];
}

id objc_msgSend_lastBaselineAnchor(void *a1, const char *a2, ...)
{
  return _[a1 lastBaselineAnchor];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _[a1 lastObject];
}

id objc_msgSend_launchAppForDialRequest_completion_(void *a1, const char *a2, ...)
{
  return [a1 launchAppForDialRequest:completion:];
}

id objc_msgSend_launchAppForJoinRequest_(void *a1, const char *a2, ...)
{
  return [a1 launchAppForJoinRequest:];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return _[a1 layer];
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 layoutIfNeeded];
}

id objc_msgSend_layoutIsAccessible(void *a1, const char *a2, ...)
{
  return _[a1 layoutIsAccessible];
}

id objc_msgSend_layoutMarginsGuide(void *a1, const char *a2, ...)
{
  return _[a1 layoutMarginsGuide];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return _[a1 leadingAnchor];
}

id objc_msgSend_leftAnchor(void *a1, const char *a2, ...)
{
  return _[a1 leftAnchor];
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

id objc_msgSend_loadExpandedViewsIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 loadExpandedViewsIfNecessary];
}

id objc_msgSend_loadLabelConstraints(void *a1, const char *a2, ...)
{
  return _[a1 loadLabelConstraints];
}

id objc_msgSend_loadRootViewAndContentViews(void *a1, const char *a2, ...)
{
  return _[a1 loadRootViewAndContentViews];
}

id objc_msgSend_loadSubviews(void *a1, const char *a2, ...)
{
  return _[a1 loadSubviews];
}

id objc_msgSend_loadView(void *a1, const char *a2, ...)
{
  return _[a1 loadView];
}

id objc_msgSend_loadViews(void *a1, const char *a2, ...)
{
  return _[a1 loadViews];
}

id objc_msgSend_localParticipantUUID(void *a1, const char *a2, ...)
{
  return _[a1 localParticipantUUID];
}

id objc_msgSend_localSenderIdentityAccountUUID(void *a1, const char *a2, ...)
{
  return _[a1 localSenderIdentityAccountUUID];
}

id objc_msgSend_localizedAttributedFeedbackText(void *a1, const char *a2, ...)
{
  return _[a1 localizedAttributedFeedbackText];
}

id objc_msgSend_localizedAttributedFeedbackTextForConfidence_locale_(void *a1, const char *a2, ...)
{
  return [a1 localizedAttributedFeedbackTextForConfidence:locale:];
}

id objc_msgSend_localizedAttributedRestrictedAlertTitle(void *a1, const char *a2, ...)
{
  return _[a1 localizedAttributedRestrictedAlertTitle];
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

id objc_msgSend_localizedBlockedByExtensionName(void *a1, const char *a2, ...)
{
  return _[a1 localizedBlockedByExtensionName];
}

id objc_msgSend_localizedCount(void *a1, const char *a2, ...)
{
  return _[a1 localizedCount];
}

id objc_msgSend_localizedDate(void *a1, const char *a2, ...)
{
  return _[a1 localizedDate];
}

id objc_msgSend_localizedDisplayStringForLabel_propertyName_(void *a1, const char *a2, ...)
{
  return [a1 localizedDisplayStringForLabel:propertyName:];
}

id objc_msgSend_localizedDowntimeTitleCache(void *a1, const char *a2, ...)
{
  return _[a1 localizedDowntimeTitleCache];
}

id objc_msgSend_localizedDuration(void *a1, const char *a2, ...)
{
  return _[a1 localizedDuration];
}

id objc_msgSend_localizedHandleTitleFromMessage_(void *a1, const char *a2, ...)
{
  return [a1 localizedHandleTitleFromMessage:];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return _[a1 localizedName];
}

id objc_msgSend_localizedSenderIdentityTitle(void *a1, const char *a2, ...)
{
  return _[a1 localizedSenderIdentityTitle];
}

id objc_msgSend_localizedShortName(void *a1, const char *a2, ...)
{
  return _[a1 localizedShortName];
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return [a1 localizedStringForKey:value:table:];
}

id objc_msgSend_localizedStringForTimeInterval_timeFormatter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForTimeInterval:timeFormatter:");
}

id objc_msgSend_localizedSubtitle(void *a1, const char *a2, ...)
{
  return _[a1 localizedSubtitle];
}

id objc_msgSend_localizedSubtitleCache(void *a1, const char *a2, ...)
{
  return _[a1 localizedSubtitleCache];
}

id objc_msgSend_localizedSubtitleForMessage_(void *a1, const char *a2, ...)
{
  return [a1 localizedSubtitleForMessage:];
}

id objc_msgSend_localizedSubtitleForRecentCall_(void *a1, const char *a2, ...)
{
  return [a1 localizedSubtitleForRecentCall:];
}

id objc_msgSend_localizedSubtitleForRecentEmergencyCall_(void *a1, const char *a2, ...)
{
  return [a1 localizedSubtitleForRecentEmergencyCall];
}

id objc_msgSend_localizedTitle(void *a1, const char *a2, ...)
{
  return _[a1 localizedTitle];
}

id objc_msgSend_localizedTitleCache(void *a1, const char *a2, ...)
{
  return _[a1 localizedTitleCache];
}

id objc_msgSend_localizedTitleForMessage_(void *a1, const char *a2, ...)
{
  return [a1 localizedTitleForMessage:];
}

id objc_msgSend_localizedTranscriptionMessage(void *a1, const char *a2, ...)
{
  return _[a1 localizedTranscriptionMessage];
}

id objc_msgSend_localizedValidHandlesTitle(void *a1, const char *a2, ...)
{
  return _[a1 localizedValidHandlesTitle];
}

id objc_msgSend_locationInView_(void *a1, const char *a2, ...)
{
  return [a1 locationInView:];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return _[a1 longLongValue];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return _[a1 mainBundle];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return _[a1 mainScreen];
}

id objc_msgSend_markRecentAudioCallsAsRead(void *a1, const char *a2, ...)
{
  return _[a1 markRecentAudioCallsAsRead];
}

id objc_msgSend_markRecentCallsAsRead(void *a1, const char *a2, ...)
{
  return _[a1 markRecentCallsAsRead];
}

id objc_msgSend_maxTrackColor(void *a1, const char *a2, ...)
{
  return _[a1 maxTrackColor];
}

id objc_msgSend_maximumAllowedHeight(void *a1, const char *a2, ...)
{
  return _[a1 maximumAllowedHeight];
}

id objc_msgSend_maximumColumnsWithAccessibility(void *a1, const char *a2, ...)
{
  return _[a1 maximumColumnsWithAccessibility];
}

id objc_msgSend_maximumColumnsWithoutAccessibility(void *a1, const char *a2, ...)
{
  return _[a1 maximumColumnsWithoutAccessibility];
}

id objc_msgSend_maximumHeightConstraint(void *a1, const char *a2, ...)
{
  return _[a1 maximumHeightConstraint];
}

id objc_msgSend_maximumTime(void *a1, const char *a2, ...)
{
  return _[a1 maximumTime];
}

id objc_msgSend_mediaType(void *a1, const char *a2, ...)
{
  return _[a1 mediaType];
}

id objc_msgSend_messageMetadataView_didTapButtonType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "messageMetadataView:didTapButtonType:");
}

id objc_msgSend_messageToolbar_handleActionForButtonType_(void *a1, const char *a2, ...)
{
  return [a1 messageToolbar:handleActionForButtonType:];
}

id objc_msgSend_messageToolbarDidSelectRTTButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "messageToolbarDidSelectRTTButton:");
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
  return _objc_msgSend(a1, "messageTranscriptView:didReceiveTapGesture:");
}

id objc_msgSend_messageTranscriptView_didReportFeedback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "messageTranscriptView:didReportFeedback:");
}

id objc_msgSend_messageType(void *a1, const char *a2, ...)
{
  return _[a1 messageType];
}

id objc_msgSend_messages(void *a1, const char *a2, ...)
{
  return _[a1 messages];
}

id objc_msgSend_metadataCache(void *a1, const char *a2, ...)
{
  return _[a1 metadataCache];
}

id objc_msgSend_metadataDestinationIDsForCHRecentCall_(void *a1, const char *a2, ...)
{
  return [a1 metadataDestinationIDsForCHRecentCall:];
}

id objc_msgSend_metadataDestinationIDsForCHRecentCalls_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metadataDestinationIDsForCHRecentCalls:");
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

id objc_msgSend_metadataView(void *a1, const char *a2, ...)
{
  return _[a1 metadataView];
}

id objc_msgSend_metadataViewLeadingConstraint(void *a1, const char *a2, ...)
{
  return _[a1 metadataViewLeadingConstraint];
}

id objc_msgSend_metadataViewLeadingLayoutConstraintConstant(void *a1, const char *a2, ...)
{
  return _[a1 metadataViewLeadingLayoutConstraintConstant];
}

id objc_msgSend_metadataViewLeadingLayoutConstraintConstantForContentSizeCategory_(void *a1, const char *a2, ...)
{
  return [a1 metadataViewLeadingLayoutConstraintConstantForContentSizeCategory:];
}

id objc_msgSend_metadataViewTapGestureRecognizer(void *a1, const char *a2, ...)
{
  return _[a1 metadataViewTapGestureRecognizer];
}

id objc_msgSend_metadataViewTopConstraint(void *a1, const char *a2, ...)
{
  return _[a1 metadataViewTopConstraint];
}

id objc_msgSend_metadataViewTrailingLayoutConstraintConstant(void *a1, const char *a2, ...)
{
  return _[a1 metadataViewTrailingLayoutConstraintConstant];
}

id objc_msgSend_metadataViewWithoutUnreadIndicatorImageViewLeadingLayoutConstraintConstant(void *a1, const char *a2, ...)
{
  return _[a1 metadataViewWithoutUnreadIndicatorImageViewLeadingLayoutConstraintConstant];
}

id objc_msgSend_metadataViewWithoutUnreadIndicatorImageViewLeadingLayoutConstraintConstant_(void *a1, const char *a2, ...)
{
  return [a1 metadataViewWithoutUnreadIndicatorImageViewLeadingLayoutConstraintConstant];
}

id objc_msgSend_methodForSelector_(void *a1, const char *a2, ...)
{
  return [a1 methodForSelector:];
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

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_negativeFeedbackURL(void *a1, const char *a2, ...)
{
  return _[a1 negativeFeedbackURL];
}

id objc_msgSend_neutralFeedbackURL(void *a1, const char *a2, ...)
{
  return _[a1 neutralFeedbackURL];
}

id objc_msgSend_newestSuggestedContactForDestinationID_(void *a1, const char *a2, ...)
{
  return [a1 newestSuggestedContactForDestinationID:];
}

id objc_msgSend_normalizedHandleWithDestinationID_(void *a1, const char *a2, ...)
{
  return [a1 normalizedHandleWithDestinationID:];
}

id objc_msgSend_normalizedPhoneNumberHandleForValue_isoCountryCode_(void *a1, const char *a2, ...)
{
  return [a1 normalizedPhoneNumberHandleForValue:isoCountryCode:];
}

id objc_msgSend_normalizedValue(void *a1, const char *a2, ...)
{
  return _[a1 normalizedValue];
}

id objc_msgSend_notifyDelegatesRecentsController_didChangeCalls_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notifyDelegatesRecentsController:didChangeCalls:");
}

id objc_msgSend_notifyDelegatesRecentsController_didChangeUnreadCallCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notifyDelegatesRecentsController:didChangeUnreadCallCount:");
}

id objc_msgSend_notifyDelegatesRecentsController_didUpdateCalls_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notifyDelegatesRecentsController:didUpdateCalls:");
}

id objc_msgSend_numberForKey_defaultValue_(void *a1, const char *a2, ...)
{
  return [a1 numberForKey:defaultValue:];
}

id objc_msgSend_numberFormatter(void *a1, const char *a2, ...)
{
  return _[a1 numberFormatter];
}

id objc_msgSend_numberOfCalls(void *a1, const char *a2, ...)
{
  return _[a1 numberOfCalls];
}

id objc_msgSend_numberOfColumns(void *a1, const char *a2, ...)
{
  return _[a1 numberOfColumns];
}

id objc_msgSend_numberOfOccurrences(void *a1, const char *a2, ...)
{
  return _[a1 numberOfOccurrences];
}

id objc_msgSend_numberOfRows(void *a1, const char *a2, ...)
{
  return _[a1 numberOfRows];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return [a1 numberWithBool:];
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return [a1 numberWithInteger:];
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedInt:];
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedInteger:];
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return _[a1 object];
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 objectAtIndexedSubscript:];
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return [a1 objectForKey:];
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 objectForKeyedSubscript:];
}

id objc_msgSend_openFeedbackURL_(void *a1, const char *a2, ...)
{
  return [a1 openFeedbackURL:];
}

id objc_msgSend_outgoingIndicator(void *a1, const char *a2, ...)
{
  return _[a1 outgoingIndicator];
}

id objc_msgSend_outgoingLocalParticipantUUID(void *a1, const char *a2, ...)
{
  return _[a1 outgoingLocalParticipantUUID];
}

id objc_msgSend_pathForResource_ofType_(void *a1, const char *a2, ...)
{
  return [a1 pathForResource:ofType:];
}

id objc_msgSend_performDialRequest_(void *a1, const char *a2, ...)
{
  return [a1 performDialRequest:];
}

id objc_msgSend_performDialRequestForRecentCall_(void *a1, const char *a2, ...)
{
  return [a1 performDialRequestForRecentCall];
}

id objc_msgSend_performJoinRequestForRecentCall_(void *a1, const char *a2, ...)
{
  return [a1 performJoinRequestForRecentCall];
}

id objc_msgSend_performSynchronousBlock_(void *a1, const char *a2, ...)
{
  return [a1 performSynchronousBlock:];
}

id objc_msgSend_phPathForImageNamed_inBundle_(void *a1, const char *a2, ...)
{
  return [a1 phPathForImageNamed:inBundle:];
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

id objc_msgSend_ph_supportsLocalParticipantBadge(void *a1, const char *a2, ...)
{
  return [a1 ph_supportsLocalParticipantBadge];
}

id objc_msgSend_phoneAppVoicemailURLForRecordID_(void *a1, const char *a2, ...)
{
  return [a1 phoneAppVoicemailURLForRecordID:];
}

id objc_msgSend_phoneKit_isAuthorized(void *a1, const char *a2, ...)
{
  return [a1 phoneKit_isAuthorized];
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

id objc_msgSend_phoneRecentsAvatarsEnabled(void *a1, const char *a2, ...)
{
  return _[a1 phoneRecentsAvatarsEnabled];
}

id objc_msgSend_playPauseButton(void *a1, const char *a2, ...)
{
  return _[a1 playPauseButton];
}

id objc_msgSend_playbackControls_didRequestState_(void *a1, const char *a2, ...)
{
  return [a1 playbackControls:didRequestState:];
}

id objc_msgSend_playerControlButton(void *a1, const char *a2, ...)
{
  return _[a1 playerControlButton];
}

id objc_msgSend_playerControlButtonWidthLayoutConstraintConstant(void *a1, const char *a2, ...)
{
  return _[a1 playerControlButtonWidthLayoutConstraintConstant];
}

id objc_msgSend_playerControlsView(void *a1, const char *a2, ...)
{
  return _[a1 playerControlsView];
}

id objc_msgSend_playerControlsViewRightLayoutConstraintConstant(void *a1, const char *a2, ...)
{
  return _[a1 playerControlsViewRightLayoutConstraintConstant];
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
  return [a1 playerTimelineSliderScrubbingDidBegin:];
}

id objc_msgSend_playerTimelineSliderScrubbingDidCancel_(void *a1, const char *a2, ...)
{
  return [a1 playerTimelineSliderScrubbingDidCancel:];
}

id objc_msgSend_playerTimelineSliderScrubbingDidEnd_(void *a1, const char *a2, ...)
{
  return [a1 playerTimelineSliderScrubbingDidEnd:];
}

id objc_msgSend_pointSize(void *a1, const char *a2, ...)
{
  return _[a1 pointSize];
}

id objc_msgSend_populateCachesForRecentCalls_(void *a1, const char *a2, ...)
{
  return [a1 populateCachesForRecentCalls:];
}

id objc_msgSend_populateItemCacheForRecentCalls_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "populateItemCacheForRecentCalls:");
}

id objc_msgSend_positiveFeedbackURL(void *a1, const char *a2, ...)
{
  return _[a1 positiveFeedbackURL];
}

id objc_msgSend_postMPVoicemailControllerMessagesDidChangeNotification(void *a1, const char *a2, ...)
{
  return _[a1 postMPVoicemailControllerMessagesDidChangeNotification];
}

id objc_msgSend_postNotificationName_object_(void *a1, const char *a2, ...)
{
  return [a1 postNotificationName:object:];
}

id objc_msgSend_postNotificationName_object_userInfo_(void *a1, const char *a2, ...)
{
  return [a1 postNotificationName:object:userInfo:];
}

id objc_msgSend_postalAddresses(void *a1, const char *a2, ...)
{
  return _[a1 postalAddresses];
}

id objc_msgSend_predicateForContactsMatchingHandleStrings_(void *a1, const char *a2, ...)
{
  return [a1 predicateForContactsMatchingHandleStrings:];
}

id objc_msgSend_predicateWithBlock_(void *a1, const char *a2, ...)
{
  return [a1 predicateWithBlock:];
}

id objc_msgSend_predicateWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 predicateWithFormat:];
}

id objc_msgSend_preferencesValueForKey_(void *a1, const char *a2, ...)
{
  return [a1 preferencesValueForKey:];
}

id objc_msgSend_preferencesValueForKey_domain_(void *a1, const char *a2, ...)
{
  return [a1 preferencesValueForKey:domain:];
}

id objc_msgSend_preferredContentSizeCategory(void *a1, const char *a2, ...)
{
  return _[a1 preferredContentSizeCategory];
}

id objc_msgSend_preferredContentSizeCategoryAllowsMultilineTitleForDoubleLineCells(void *a1, const char *a2, ...)
{
  return _[a1 preferredContentSizeCategoryAllowsMultilineTitleForDoubleLineCells];
}

id objc_msgSend_preferredFontDescriptorWithTextStyle_addingSymbolicTraits_options_(void *a1, const char *a2, ...)
{
  return [a1 preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:];
}

id objc_msgSend_preferredFontForTextStyle_(void *a1, const char *a2, ...)
{
  return [a1 preferredFontForTextStyle:];
}

id objc_msgSend_presentScreenTimeShield(void *a1, const char *a2, ...)
{
  return _[a1 presentScreenTimeShield];
}

id objc_msgSend_prioritizedSenderIdentities(void *a1, const char *a2, ...)
{
  return _[a1 prioritizedSenderIdentities];
}

id objc_msgSend_prototypeRecentCallCell(void *a1, const char *a2, ...)
{
  return _[a1 prototypeRecentCallCell];
}

id objc_msgSend_prototypeVoicemailCell(void *a1, const char *a2, ...)
{
  return _[a1 prototypeVoicemailCell];
}

id objc_msgSend_provider(void *a1, const char *a2, ...)
{
  return _[a1 provider];
}

id objc_msgSend_providerForRecentCall_(void *a1, const char *a2, ...)
{
  return [a1 providerForRecentCall:];
}

id objc_msgSend_providerWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 providerWithIdentifier:];
}

id objc_msgSend_providerWithService_video_(void *a1, const char *a2, ...)
{
  return [a1 providerWithService:video:];
}

id objc_msgSend_providers(void *a1, const char *a2, ...)
{
  return _[a1 providers];
}

id objc_msgSend_rangeOfString_(void *a1, const char *a2, ...)
{
  return [a1 rangeOfString:];
}

id objc_msgSend_receiverDestinationID(void *a1, const char *a2, ...)
{
  return _[a1 receiverDestinationID];
}

id objc_msgSend_receiverISOCountryCode(void *a1, const char *a2, ...)
{
  return _[a1 receiverISOCountryCode];
}

id objc_msgSend_recentCallForCallRecord_(void *a1, const char *a2, ...)
{
  return [a1 recentCallForCallRecord:];
}

id objc_msgSend_recentCalls(void *a1, const char *a2, ...)
{
  return _[a1 recentCalls];
}

id objc_msgSend_recentsController(void *a1, const char *a2, ...)
{
  return _[a1 recentsController];
}

id objc_msgSend_recentsItemCache(void *a1, const char *a2, ...)
{
  return _[a1 recentsItemCache];
}

id objc_msgSend_recentsItemForCall_numberOfOccurences_(void *a1, const char *a2, ...)
{
  return [a1 recentsItemForCall:numberOfOccurences:];
}

id objc_msgSend_recentsOutgoingAudioCallGlyphImage(void *a1, const char *a2, ...)
{
  return _[a1 recentsOutgoingAudioCallGlyphImage];
}

id objc_msgSend_recentsOutgoingVideoCallGlyphImage(void *a1, const char *a2, ...)
{
  return _[a1 recentsOutgoingVideoCallGlyphImage];
}

id objc_msgSend_recentsTTYDirectGlyphImage(void *a1, const char *a2, ...)
{
  return _[a1 recentsTTYDirectGlyphImage];
}

id objc_msgSend_recentsTTYRelayGlyphImage(void *a1, const char *a2, ...)
{
  return _[a1 recentsTTYRelayGlyphImage];
}

id objc_msgSend_recentsVerifiedCheckmarkImage(void *a1, const char *a2, ...)
{
  return _[a1 recentsVerifiedCheckmarkImage];
}

id objc_msgSend_redColor(void *a1, const char *a2, ...)
{
  return _[a1 redColor];
}

id objc_msgSend_regionCode(void *a1, const char *a2, ...)
{
  return _[a1 regionCode];
}

id objc_msgSend_registerClass_forCellReuseIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 registerClass:forCellReuseIdentifier:];
}

id objc_msgSend_registerForRingerStateNotifications(void *a1, const char *a2, ...)
{
  return _[a1 registerForRingerStateNotifications];
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

id objc_msgSend_remoteParticipantHandles(void *a1, const char *a2, ...)
{
  return _[a1 remoteParticipantHandles];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _[a1 removeAllObjects];
}

id objc_msgSend_removeArrangedSubview_(void *a1, const char *a2, ...)
{
  return [a1 removeArrangedSubview:];
}

id objc_msgSend_removeAttribute_range_(void *a1, const char *a2, ...)
{
  return [a1 removeAttribute:range:];
}

id objc_msgSend_removeConstraint_(void *a1, const char *a2, ...)
{
  return [a1 removeConstraint];
}

id objc_msgSend_removeConstraints_(void *a1, const char *a2, ...)
{
  return [a1 removeConstraints:];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return _[a1 removeFromSuperview];
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return [a1 removeObjectForKey:];
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return [a1 removeObserver];
}

id objc_msgSend_removeTarget_forEvents_(void *a1, const char *a2, ...)
{
  return [a1 removeTarget:forEvents:];
}

id objc_msgSend_replaceCharactersInRange_withString_(void *a1, const char *a2, ...)
{
  return [a1 replaceCharactersInRange:withString:];
}

id objc_msgSend_requestInitialStateIfNecessaryAndSendNotifications_(void *a1, const char *a2, ...)
{
  return [a1 requestInitialStateIfNecessaryAndSendNotifications:];
}

id objc_msgSend_resizableImageWithCapInsets_(void *a1, const char *a2, ...)
{
  return [a1 resizableImageWithCapInsets:];
}

id objc_msgSend_restrictedView(void *a1, const char *a2, ...)
{
  return _[a1 restrictedView];
}

id objc_msgSend_restrictedViewBottomConstraint(void *a1, const char *a2, ...)
{
  return _[a1 restrictedViewBottomConstraint];
}

id objc_msgSend_reuseIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 reuseIdentifier];
}

id objc_msgSend_rightAnchor(void *a1, const char *a2, ...)
{
  return _[a1 rightAnchor];
}

id objc_msgSend_ringerStateNotifyToken(void *a1, const char *a2, ...)
{
  return _[a1 ringerStateNotifyToken];
}

id objc_msgSend_rootView(void *a1, const char *a2, ...)
{
  return _[a1 rootView];
}

id objc_msgSend_rootViewLayoutMargins(void *a1, const char *a2, ...)
{
  return _[a1 rootViewLayoutMargins];
}

id objc_msgSend_routeGlyphForDeviceType_displayStyle_color_(void *a1, const char *a2, ...)
{
  return [a1 routeGlyphForDeviceType:displayStyle:color:];
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return _[a1 row];
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

id objc_msgSend_scheduledTimerWithTimeInterval_repeats_block_(void *a1, const char *a2, ...)
{
  return [a1 scheduledTimerWithTimeInterval:repeats:block:];
}

id objc_msgSend_secondItem(void *a1, const char *a2, ...)
{
  return _[a1 secondItem];
}

id objc_msgSend_secondaryLabelColor(void *a1, const char *a2, ...)
{
  return _[a1 secondaryLabelColor];
}

id objc_msgSend_sendActionsForControlEvents_(void *a1, const char *a2, ...)
{
  return [a1 sendActionsForControlEvents:];
}

id objc_msgSend_senderContactForMessage_(void *a1, const char *a2, ...)
{
  return [a1 senderContactForMessage:];
}

id objc_msgSend_senderDestinationID(void *a1, const char *a2, ...)
{
  return _[a1 senderDestinationID];
}

id objc_msgSend_senderHandle(void *a1, const char *a2, ...)
{
  return _[a1 senderHandle];
}

id objc_msgSend_senderISOCountryCode(void *a1, const char *a2, ...)
{
  return _[a1 senderISOCountryCode];
}

id objc_msgSend_senderIdentityForAccountUUID_(void *a1, const char *a2, ...)
{
  return [a1 senderIdentityForAccountUUID:];
}

id objc_msgSend_senderIdentityForHandle_(void *a1, const char *a2, ...)
{
  return [a1 senderIdentityForHandle:];
}

id objc_msgSend_separatorInsetForContentSizeCategory_(void *a1, const char *a2, ...)
{
  return [a1 separatorInsetForContentSizeCategory:];
}

id objc_msgSend_serialDispatchQueue(void *a1, const char *a2, ...)
{
  return _[a1 serialDispatchQueue];
}

id objc_msgSend_serialQueue(void *a1, const char *a2, ...)
{
  return _[a1 serialQueue];
}

id objc_msgSend_serviceProvider(void *a1, const char *a2, ...)
{
  return _[a1 serviceProvider];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _[a1 set];
}

id objc_msgSend_setAccessibilityConstraintsEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setAccessibilityConstraintsEnabled:];
}

id objc_msgSend_setAccessibilityIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setAccessibilityIdentifier:];
}

id objc_msgSend_setAccessibilityLabel_(void *a1, const char *a2, ...)
{
  return [a1 setAccessibilityLabel:];
}

id objc_msgSend_setAccessoryType_(void *a1, const char *a2, ...)
{
  return [a1 setAccessoryType:];
}

id objc_msgSend_setAccessoryView_(void *a1, const char *a2, ...)
{
  return [a1 setAccessoryView:];
}

id objc_msgSend_setActive_(void *a1, const char *a2, ...)
{
  return [a1 setActive:];
}

id objc_msgSend_setActualBackgroundColor_(void *a1, const char *a2, ...)
{
  return [a1 setActualBackgroundColor:];
}

id objc_msgSend_setActualTintColor_(void *a1, const char *a2, ...)
{
  return [a1 setActualTintColor:];
}

id objc_msgSend_setAdjustsFontForContentSizeCategory_(void *a1, const char *a2, ...)
{
  return [a1 setAdjustsFontForContentSizeCategory:];
}

id objc_msgSend_setAdjustsFontSizeToFitWidth_(void *a1, const char *a2, ...)
{
  return [a1 setAdjustsFontSizeToFitWidth:];
}

id objc_msgSend_setAdjustsImageSizeForAccessibilityContentSizeCategory_(void *a1, const char *a2, ...)
{
  return [a1 setAdjustsImageSizeForAccessibilityContentSizeCategory:];
}

id objc_msgSend_setAdjustsImageWhenDisabled_(void *a1, const char *a2, ...)
{
  return [a1 setAdjustsImageWhenDisabled:];
}

id objc_msgSend_setAlignment_(void *a1, const char *a2, ...)
{
  return [a1 setAlignment:];
}

id objc_msgSend_setAlignment_forView_inAxis_(void *a1, const char *a2, ...)
{
  return [a1 setAlignment:forView:inAxis:];
}

id objc_msgSend_setAllowedUnits_(void *a1, const char *a2, ...)
{
  return [a1 setAllowedUnits:];
}

id objc_msgSend_setAlpha_(void *a1, const char *a2, ...)
{
  return [a1 setAlpha:];
}

id objc_msgSend_setArrangedSubviewRows_(void *a1, const char *a2, ...)
{
  return [a1 setArrangedSubviewRows:];
}

id objc_msgSend_setArrangedSubviews_(void *a1, const char *a2, ...)
{
  return [a1 setArrangedSubviews:];
}

id objc_msgSend_setAttributedText_(void *a1, const char *a2, ...)
{
  return [a1 setAttributedText:];
}

id objc_msgSend_setAttributes_range_(void *a1, const char *a2, ...)
{
  return [a1 setAttributes:range:];
}

id objc_msgSend_setAxis_(void *a1, const char *a2, ...)
{
  return [a1 setAxis:];
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return [a1 setBackgroundColor:];
}

id objc_msgSend_setBadgeView_(void *a1, const char *a2, ...)
{
  return [a1 setBadgeView:];
}

id objc_msgSend_setBaselineRelativeArrangement_(void *a1, const char *a2, ...)
{
  return [a1 setBaselineRelativeArrangement:];
}

id objc_msgSend_setBounds_(void *a1, const char *a2, ...)
{
  return [a1 setBounds:];
}

id objc_msgSend_setButtonType_enabled_(void *a1, const char *a2, ...)
{
  return [a1 setButtonType:enabled:];
}

id objc_msgSend_setCallButtonImage_(void *a1, const char *a2, ...)
{
  return [a1 setCallButtonImage:];
}

id objc_msgSend_setCallProviderManager_(void *a1, const char *a2, ...)
{
  return [a1 setCallProviderManager:];
}

id objc_msgSend_setCallerID_(void *a1, const char *a2, ...)
{
  return [a1 setCallerID:];
}

id objc_msgSend_setClipsToBounds_(void *a1, const char *a2, ...)
{
  return [a1 setClipsToBounds:];
}

id objc_msgSend_setCollapsedBottomConstraint_(void *a1, const char *a2, ...)
{
  return [a1 setCollapsedBottomConstraint:];
}

id objc_msgSend_setColumnSpacing_(void *a1, const char *a2, ...)
{
  return [a1 setColumnSpacing:];
}

id objc_msgSend_setConstant_(void *a1, const char *a2, ...)
{
  return [a1 setConstant:];
}

id objc_msgSend_setConstraintsForLayouts_(void *a1, const char *a2, ...)
{
  return [a1 setConstraintsForLayouts:];
}

id objc_msgSend_setConstraintsLoaded_(void *a1, const char *a2, ...)
{
  return [a1 setConstraintsLoaded:];
}

id objc_msgSend_setContactFormatter_(void *a1, const char *a2, ...)
{
  return [a1 setContactFormatter:];
}

id objc_msgSend_setContactIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setContactIdentifier];
}

id objc_msgSend_setContactStore_(void *a1, const char *a2, ...)
{
  return [a1 setContactStore:];
}

id objc_msgSend_setContactType_(void *a1, const char *a2, ...)
{
  return [a1 setContactType:];
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
  return [a1 setConversation:];
}

id objc_msgSend_setCornerRadius_(void *a1, const char *a2, ...)
{
  return [a1 setCornerRadius:];
}

id objc_msgSend_setCountdownCancelled_(void *a1, const char *a2, ...)
{
  return [a1 setCountdownCancelled:];
}

id objc_msgSend_setCountdownTimer_(void *a1, const char *a2, ...)
{
  return [a1 setCountdownTimer:];
}

id objc_msgSend_setCountdownView_(void *a1, const char *a2, ...)
{
  return [a1 setCountdownView:];
}

id objc_msgSend_setCurrentActiveFixedConstraints_(void *a1, const char *a2, ...)
{
  return [a1 setCurrentActiveFixedConstraints:];
}

id objc_msgSend_setCurrentRequiredConstraints_(void *a1, const char *a2, ...)
{
  return [a1 setCurrentRequiredConstraints:];
}

id objc_msgSend_setCurrentRequiredConstraintsKey_(void *a1, const char *a2, ...)
{
  return [a1 setCurrentRequiredConstraintsKey:];
}

id objc_msgSend_setCurrentViewModel_(void *a1, const char *a2, ...)
{
  return [a1 setCurrentViewModel:];
}

id objc_msgSend_setCustomBaselineOffsetFromBottom_(void *a1, const char *a2, ...)
{
  return [a1 setCustomBaselineOffsetFromBottom:];
}

id objc_msgSend_setCustomFirstBaselineOffsetFromTop_(void *a1, const char *a2, ...)
{
  return [a1 setCustomFirstBaselineOffsetFromTop:];
}

id objc_msgSend_setDataDetectorTypes_(void *a1, const char *a2, ...)
{
  return [a1 setDataDetectorTypes:];
}

id objc_msgSend_setDataSource_(void *a1, const char *a2, ...)
{
  return [a1 setDataSource:];
}

id objc_msgSend_setDate_(void *a1, const char *a2, ...)
{
  return [a1 setDate:];
}

id objc_msgSend_setDateStyle_(void *a1, const char *a2, ...)
{
  return [a1 setDateStyle:];
}

id objc_msgSend_setDebugBoundingBoxesEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setDebugBoundingBoxesEnabled:];
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

id objc_msgSend_setDialType_(void *a1, const char *a2, ...)
{
  return [a1 setDialType:];
}

id objc_msgSend_setDirectionalLayoutMargins_(void *a1, const char *a2, ...)
{
  return [a1 setDirectionalLayoutMargins:];
}

id objc_msgSend_setDuration_(void *a1, const char *a2, ...)
{
  return [a1 setDuration:];
}

id objc_msgSend_setEditable_(void *a1, const char *a2, ...)
{
  return [a1 setEditable:];
}

id objc_msgSend_setEditing_(void *a1, const char *a2, ...)
{
  return [a1 setEditing:];
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

id objc_msgSend_setEmailAddresses_(void *a1, const char *a2, ...)
{
  return [a1 setEmailAddresses:];
}

id objc_msgSend_setEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setEnabled:];
}

id objc_msgSend_setExpanded_(void *a1, const char *a2, ...)
{
  return [a1 setExpanded:];
}

id objc_msgSend_setExpanded_animated_(void *a1, const char *a2, ...)
{
  return [a1 setExpanded:animated:];
}

id objc_msgSend_setExpandedConstraints_(void *a1, const char *a2, ...)
{
  return [a1 setExpandedConstraints:];
}

id objc_msgSend_setFamilyName_(void *a1, const char *a2, ...)
{
  return [a1 setFamilyName:];
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

id objc_msgSend_setForegroundColor_(void *a1, const char *a2, ...)
{
  return [a1 setForegroundColor:];
}

id objc_msgSend_setForegroundView_(void *a1, const char *a2, ...)
{
  return [a1 setForegroundView:];
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return [a1 setFrame:];
}

id objc_msgSend_setGivenName_(void *a1, const char *a2, ...)
{
  return [a1 setGivenName:];
}

id objc_msgSend_setHandle_(void *a1, const char *a2, ...)
{
  return [a1 setHandle:];
}

id objc_msgSend_setHeadIndent_(void *a1, const char *a2, ...)
{
  return [a1 setHeadIndent:];
}

id objc_msgSend_setHidden_(void *a1, const char *a2, ...)
{
  return [a1 setHidden:];
}

id objc_msgSend_setHideUnreadIndicatorMetadataViewLeadingConstraint_(void *a1, const char *a2, ...)
{
  return [a1 setHideUnreadIndicatorMetadataViewLeadingConstraint:];
}

id objc_msgSend_setHitTestsAsOpaque_(void *a1, const char *a2, ...)
{
  return [a1 setHitTestsAsOpaque:];
}

id objc_msgSend_setHorizontalAlignment_(void *a1, const char *a2, ...)
{
  return [a1 setHorizontalAlignment:];
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

id objc_msgSend_setImage_forStates_(void *a1, const char *a2, ...)
{
  return [a1 setImage:forStates:];
}

id objc_msgSend_setIndicatorViewCenterXLayoutConstraint_(void *a1, const char *a2, ...)
{
  return [a1 setIndicatorViewCenterXLayoutConstraint:];
}

id objc_msgSend_setIndicatorViewTopLayoutConstraint_(void *a1, const char *a2, ...)
{
  return [a1 setIndicatorViewTopLayoutConstraint:];
}

id objc_msgSend_setInitialConstraints_(void *a1, const char *a2, ...)
{
  return [a1 setInitialConstraints:];
}

id objc_msgSend_setInitializationBlockQueued_(void *a1, const char *a2, ...)
{
  return [a1 setInitializationBlockQueued:];
}

id objc_msgSend_setInteraction_(void *a1, const char *a2, ...)
{
  return [a1 setInteraction:];
}

id objc_msgSend_setInvitationPreferences_(void *a1, const char *a2, ...)
{
  return [a1 setInvitationPreferences:];
}

id objc_msgSend_setIsDeleted_(void *a1, const char *a2, ...)
{
  return [a1 setIsDeleted:];
}

id objc_msgSend_setIsMissedCall_(void *a1, const char *a2, ...)
{
  return [a1 setIsMissedCall:];
}

id objc_msgSend_setIsRead_(void *a1, const char *a2, ...)
{
  return [a1 setIsRead:];
}

id objc_msgSend_setItem_(void *a1, const char *a2, ...)
{
  return [a1 setItem:];
}

id objc_msgSend_setLayoutIsAccessible_(void *a1, const char *a2, ...)
{
  return [a1 setLayoutIsAccessible:];
}

id objc_msgSend_setLayoutMarginsRelativeArrangement_(void *a1, const char *a2, ...)
{
  return [a1 setLayoutMarginsRelativeArrangement:];
}

id objc_msgSend_setLayoutSize_withContentPriority_(void *a1, const char *a2, ...)
{
  return [a1 setLayoutSize:withContentPriority:];
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

id objc_msgSend_setLocalSenderIdentityAccountUUID_(void *a1, const char *a2, ...)
{
  return [a1 setLocalSenderIdentityAccountUUID:];
}

id objc_msgSend_setLocalSenderIdentityUUID_(void *a1, const char *a2, ...)
{
  return [a1 setLocalSenderIdentityUUID:];
}

id objc_msgSend_setLocalizedAttributedRestrictedAlertTitle_(void *a1, const char *a2, ...)
{
  return [a1 setLocalizedAttributedRestrictedAlertTitle:];
}

id objc_msgSend_setLocalizedCount_(void *a1, const char *a2, ...)
{
  return [a1 setLocalizedCount];
}

id objc_msgSend_setLocalizedDate_(void *a1, const char *a2, ...)
{
  return [a1 setLocalizedDate];
}

id objc_msgSend_setLocalizedDuration_(void *a1, const char *a2, ...)
{
  return [a1 setLocalizedDuration];
}

id objc_msgSend_setLocalizedSenderIdentityTitle_(void *a1, const char *a2, ...)
{
  return [a1 setLocalizedSenderIdentityTitle:];
}

id objc_msgSend_setLocalizedSubtitle_(void *a1, const char *a2, ...)
{
  return [a1 setLocalizedSubtitle:];
}

id objc_msgSend_setLocalizedTitle_(void *a1, const char *a2, ...)
{
  return [a1 setLocalizedTitle:];
}

id objc_msgSend_setLocalizedValidHandlesTitle_(void *a1, const char *a2, ...)
{
  return [a1 setLocalizedValidHandlesTitle:];
}

id objc_msgSend_setMasksToBounds_(void *a1, const char *a2, ...)
{
  return [a1 setMasksToBounds:];
}

id objc_msgSend_setMaximumAllowedHeight_(void *a1, const char *a2, ...)
{
  return [a1 setMaximumAllowedHeight:];
}

id objc_msgSend_setMaximumColumnsWithAccessibility_(void *a1, const char *a2, ...)
{
  return [a1 setMaximumColumnsWithAccessibility:];
}

id objc_msgSend_setMaximumColumnsWithoutAccessibility_(void *a1, const char *a2, ...)
{
  return [a1 setMaximumColumnsWithoutAccessibility];
}

id objc_msgSend_setMaximumHeightConstraint_(void *a1, const char *a2, ...)
{
  return [a1 setMaximumHeightConstraint:];
}

id objc_msgSend_setMaximumLayoutSize_(void *a1, const char *a2, ...)
{
  return [a1 setMaximumLayoutSize:];
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

id objc_msgSend_setMessages_(void *a1, const char *a2, ...)
{
  return [a1 setMessages:];
}

id objc_msgSend_setMetadataCache_(void *a1, const char *a2, ...)
{
  return [a1 setMetadataCache:];
}

id objc_msgSend_setMetadataViewLeadingConstraint_(void *a1, const char *a2, ...)
{
  return [a1 setMetadataViewLeadingConstraint:];
}

id objc_msgSend_setMetadataViewTopConstraint_(void *a1, const char *a2, ...)
{
  return [a1 setMetadataViewTopConstraint:];
}

id objc_msgSend_setMinimumLayoutSize_(void *a1, const char *a2, ...)
{
  return [a1 setMinimumLayoutSize:];
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

id objc_msgSend_setNumber_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setNumber:forKey:];
}

id objc_msgSend_setNumberFormatter_(void *a1, const char *a2, ...)
{
  return [a1 setNumberFormatter:];
}

id objc_msgSend_setNumberOfLines_(void *a1, const char *a2, ...)
{
  return [a1 setNumberOfLines:];
}

id objc_msgSend_setNumberOfTouchesRequired_(void *a1, const char *a2, ...)
{
  return [a1 setNumberOfTouchesRequired:];
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forKey:];
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forKeyedSubscript:];
}

id objc_msgSend_setOpaque_(void *a1, const char *a2, ...)
{
  return [a1 setOpaque:];
}

id objc_msgSend_setOrganizationName_(void *a1, const char *a2, ...)
{
  return [a1 setOrganizationName:];
}

id objc_msgSend_setOriginatingUIType_(void *a1, const char *a2, ...)
{
  return [a1 setOriginatingUIType:];
}

id objc_msgSend_setPhoneNumbers_(void *a1, const char *a2, ...)
{
  return [a1 setPhoneNumbers:];
}

id objc_msgSend_setPlayPauseButton_(void *a1, const char *a2, ...)
{
  return [a1 setPlayPauseButton:];
}

id objc_msgSend_setPlayerControlsView_(void *a1, const char *a2, ...)
{
  return [a1 setPlayerControlsView:];
}

id objc_msgSend_setPlayerState_(void *a1, const char *a2, ...)
{
  return [a1 setPlayerState:];
}

id objc_msgSend_setPlayerState_enabled_(void *a1, const char *a2, ...)
{
  return [a1 setPlayerState:enabled:];
}

id objc_msgSend_setPreFetchingPredicate_(void *a1, const char *a2, ...)
{
  return [a1 setPreFetchingPredicate:];
}

id objc_msgSend_setPredicate_(void *a1, const char *a2, ...)
{
  return [a1 setPredicate:];
}

id objc_msgSend_setPreferencesValue_forKey_domain_(void *a1, const char *a2, ...)
{
  return [a1 setPreferencesValue:forKey:domain:];
}

id objc_msgSend_setPreferredMaxLayoutWidth_(void *a1, const char *a2, ...)
{
  return [a1 setPreferredMaxLayoutWidth:];
}

id objc_msgSend_setPreservesSuperviewLayoutMargins_(void *a1, const char *a2, ...)
{
  return [a1 setPreservesSuperviewLayoutMargins:];
}

id objc_msgSend_setPriority_(void *a1, const char *a2, ...)
{
  return [a1 setPriority:];
}

id objc_msgSend_setPriorityOfConstraints_to_(void *a1, const char *a2, ...)
{
  return [a1 setPriorityOfConstraints:to:];
}

id objc_msgSend_setPrototypeRecentCallCell_(void *a1, const char *a2, ...)
{
  return [a1 setPrototypeRecentCallCell:];
}

id objc_msgSend_setPrototypeVoicemailCell_(void *a1, const char *a2, ...)
{
  return [a1 setPrototypeVoicemailCell];
}

id objc_msgSend_setProvider_(void *a1, const char *a2, ...)
{
  return [a1 setProvider:];
}

id objc_msgSend_setRead_(void *a1, const char *a2, ...)
{
  return [a1 setRead:];
}

id objc_msgSend_setRecentCalls_(void *a1, const char *a2, ...)
{
  return [a1 setRecentCalls:];
}

id objc_msgSend_setRecentsController_(void *a1, const char *a2, ...)
{
  return [a1 setRecentsController:];
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

id objc_msgSend_setRestricted_(void *a1, const char *a2, ...)
{
  return [a1 setRestricted:];
}

id objc_msgSend_setRestrictedViewBottomConstraint_(void *a1, const char *a2, ...)
{
  return [a1 setRestrictedViewBottomConstraint:];
}

id objc_msgSend_setRingerSwitchEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setRingerSwitchEnabled:];
}

id objc_msgSend_setRowHeight_(void *a1, const char *a2, ...)
{
  return [a1 setRowHeight:];
}

id objc_msgSend_setRowSpacing_(void *a1, const char *a2, ...)
{
  return [a1 setRowSpacing:];
}

id objc_msgSend_setScrollEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setScrollEnabled:];
}

id objc_msgSend_setSelectable_(void *a1, const char *a2, ...)
{
  return [a1 setSelectable:];
}

id objc_msgSend_setSelectionStyle_(void *a1, const char *a2, ...)
{
  return [a1 setSelectionStyle:];
}

id objc_msgSend_setSemanticContentAttribute_(void *a1, const char *a2, ...)
{
  return [a1 setSemanticContentAttribute:];
}

id objc_msgSend_setSeparatorInset_(void *a1, const char *a2, ...)
{
  return [a1 setSeparatorInset:];
}

id objc_msgSend_setShowsPlayerControls_(void *a1, const char *a2, ...)
{
  return [a1 setShowsPlayerControls:];
}

id objc_msgSend_setShowsTranscriptionView_(void *a1, const char *a2, ...)
{
  return [a1 setShowsTranscriptionView:];
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

id objc_msgSend_setSocialProfiles_(void *a1, const char *a2, ...)
{
  return [a1 setSocialProfiles:];
}

id objc_msgSend_setSpacing_(void *a1, const char *a2, ...)
{
  return [a1 setSpacing:];
}

id objc_msgSend_setStandardConstraints_(void *a1, const char *a2, ...)
{
  return [a1 setStandardConstraints:];
}

id objc_msgSend_setStyle_(void *a1, const char *a2, ...)
{
  return [a1 setStyle:];
}

id objc_msgSend_setSuggestedContactStore_(void *a1, const char *a2, ...)
{
  return [a1 setSuggestedContactStore:];
}

id objc_msgSend_setTableView_(void *a1, const char *a2, ...)
{
  return [a1 setTableView:];
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

id objc_msgSend_setTitleLabel_(void *a1, const char *a2, ...)
{
  return [a1 setTitleLabel:];
}

id objc_msgSend_setTitleLabelFirstBaselineAnchorLayoutConstraint_(void *a1, const char *a2, ...)
{
  return [a1 setTitleLabelFirstBaselineAnchorLayoutConstraint:];
}

id objc_msgSend_setTitleLabelFirstBaselineLayoutConstraint_(void *a1, const char *a2, ...)
{
  return [a1 setTitleLabelFirstBaselineLayoutConstraint:];
}

id objc_msgSend_setTitleLabelLastBaselineAnchorLayoutConstraint_(void *a1, const char *a2, ...)
{
  return [a1 setTitleLabelLastBaselineAnchorLayoutConstraint:];
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

id objc_msgSend_setToolbarBottomConstraint_(void *a1, const char *a2, ...)
{
  return [a1 setToolbarBottomConstraint:];
}

id objc_msgSend_setTranscriptBottomConstraint_(void *a1, const char *a2, ...)
{
  return [a1 setTranscriptBottomConstraint:];
}

id objc_msgSend_setTranscriptViewModel_(void *a1, const char *a2, ...)
{
  return [a1 setTranscriptViewModel:];
}

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return [a1 setTranslatesAutoresizingMaskIntoConstraints:];
}

id objc_msgSend_setUnreadCallCount_(void *a1, const char *a2, ...)
{
  return [a1 setUnreadCallCount:];
}

id objc_msgSend_setUserInteractionEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setUserInteractionEnabled:];
}

id objc_msgSend_setValue_animated_(void *a1, const char *a2, ...)
{
  return [a1 setValue:animated:];
}

id objc_msgSend_setVerified_(void *a1, const char *a2, ...)
{
  return [a1 setVerified:];
}

id objc_msgSend_setVerifiedBadgeView_(void *a1, const char *a2, ...)
{
  return [a1 setVerifiedBadgeView:];
}

id objc_msgSend_setVideo_(void *a1, const char *a2, ...)
{
  return [a1 setVideo:];
}

id objc_msgSend_setVideoEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setVideoEnabled:];
}

id objc_msgSend_setViewModel_(void *a1, const char *a2, ...)
{
  return [a1 setViewModel:];
}

id objc_msgSend_setVoicemailController_(void *a1, const char *a2, ...)
{
  return [a1 setVoicemailController:];
}

id objc_msgSend_setVoicemailManager_(void *a1, const char *a2, ...)
{
  return [a1 setVoicemailManager:];
}

id objc_msgSend_setWithCapacity_(void *a1, const char *a2, ...)
{
  return [a1 setWithCapacity:];
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return [a1 setWithObject:];
}

id objc_msgSend_setupCollapsedView(void *a1, const char *a2, ...)
{
  return _[a1 setupCollapsedView];
}

id objc_msgSend_setupExpandedView(void *a1, const char *a2, ...)
{
  return _[a1 setupExpandedView];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return _[a1 sharedApplication];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sharedUtilityProvider(void *a1, const char *a2, ...)
{
  return _[a1 sharedUtilityProvider];
}

id objc_msgSend_shortDateLabel(void *a1, const char *a2, ...)
{
  return _[a1 shortDateLabel];
}

id objc_msgSend_shortDurationLabel(void *a1, const char *a2, ...)
{
  return _[a1 shortDurationLabel];
}

id objc_msgSend_shouldRestrictDialRequest_performSynchronously_(void *a1, const char *a2, ...)
{
  return [a1 shouldRestrictDialRequest:performSynchronously:];
}

id objc_msgSend_shouldRestrictJoinConversationRequest_performSynchronously_(void *a1, const char *a2, ...)
{
  return [a1 shouldRestrictJoinConversationRequest:performSynchronously:];
}

id objc_msgSend_shouldShowRestrictedAlertView(void *a1, const char *a2, ...)
{
  return _[a1 shouldShowRestrictedAlertView];
}

id objc_msgSend_shouldShowTranscriptView(void *a1, const char *a2, ...)
{
  return _[a1 shouldShowTranscriptView];
}

id objc_msgSend_showsPlayerControls(void *a1, const char *a2, ...)
{
  return _[a1 showsPlayerControls];
}

id objc_msgSend_showsRestrictedAlertView(void *a1, const char *a2, ...)
{
  return _[a1 showsRestrictedAlertView];
}

id objc_msgSend_showsTranscriptionView(void *a1, const char *a2, ...)
{
  return _[a1 showsTranscriptionView];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return _[a1 size];
}

id objc_msgSend_sizeThatFits_(void *a1, const char *a2, ...)
{
  return [a1 sizeThatFits:];
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

id objc_msgSend_startCountdownFromNumber_withTimeInterval_completion_(void *a1, const char *a2, ...)
{
  return [a1 startCountdownFromNumber:withTimeInterval:completion:];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return _[a1 state];
}

id objc_msgSend_stateForNotifyToken_(void *a1, const char *a2, ...)
{
  return [a1 stateForNotifyToken:];
}

id objc_msgSend_stopAnimating(void *a1, const char *a2, ...)
{
  return _[a1 stopAnimating];
}

id objc_msgSend_storeWithOptions_(void *a1, const char *a2, ...)
{
  return [a1 storeWithOptions:];
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

id objc_msgSend_stringFromContact_(void *a1, const char *a2, ...)
{
  return [a1 stringFromContact:];
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return [a1 stringFromDate:];
}

id objc_msgSend_stringFromNumber_(void *a1, const char *a2, ...)
{
  return [a1 stringFromNumber:];
}

id objc_msgSend_stringFromSeconds_(void *a1, const char *a2, ...)
{
  return [a1 stringFromSeconds:];
}

id objc_msgSend_stringFromTimeInterval_(void *a1, const char *a2, ...)
{
  return [a1 stringFromTimeInterval:];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 stringWithFormat:];
}

id objc_msgSend_style(void *a1, const char *a2, ...)
{
  return _[a1 style];
}

id objc_msgSend_subscriptions(void *a1, const char *a2, ...)
{
  return _[a1 subscriptions];
}

id objc_msgSend_subtitleForRecentEmergencyCall_(void *a1, const char *a2, ...)
{
  return [a1 subtitleForRecentEmergencyCall:];
}

id objc_msgSend_subtitleLabel(void *a1, const char *a2, ...)
{
  return _[a1 subtitleLabel];
}

id objc_msgSend_subtitleLabelFirstBaselineLayoutConstraintConstant(void *a1, const char *a2, ...)
{
  return _[a1 subtitleLabelFirstBaselineLayoutConstraintConstant];
}

id objc_msgSend_subtitleLabelLastBaselineLayoutConstraintConstant(void *a1, const char *a2, ...)
{
  return _[a1 subtitleLabelLastBaselineLayoutConstraintConstant];
}

id objc_msgSend_subtitleLabelTextColor(void *a1, const char *a2, ...)
{
  return _[a1 subtitleLabelTextColor];
}

id objc_msgSend_subtitleLeadingToLayoutMarginConstrant(void *a1, const char *a2, ...)
{
  return _[a1 subtitleLeadingToLayoutMarginConstrant];
}

id objc_msgSend_subtitleStackView(void *a1, const char *a2, ...)
{
  return _[a1 subtitleStackView];
}

id objc_msgSend_suggestedContactForHandle_isoCountryCode_metadataCache_(void *a1, const char *a2, ...)
{
  return [a1 suggestedContactForHandle:isoCountryCode:metadataCache:];
}

id objc_msgSend_suggestedContactStore(void *a1, const char *a2, ...)
{
  return _[a1 suggestedContactStore];
}

id objc_msgSend_suggestionsEnabled(void *a1, const char *a2, ...)
{
  return _[a1 suggestionsEnabled];
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return _[a1 superview];
}

id objc_msgSend_supportedHandleTypes(void *a1, const char *a2, ...)
{
  return _[a1 supportedHandleTypes];
}

id objc_msgSend_supportsHandleType_(void *a1, const char *a2, ...)
{
  return [a1 supportsHandleType:];
}

id objc_msgSend_systemBlueColor(void *a1, const char *a2, ...)
{
  return _[a1 systemBlueColor];
}

id objc_msgSend_systemFontOfSize_weight_(void *a1, const char *a2, ...)
{
  return [a1 systemFontOfSize:];
}

id objc_msgSend_systemGrayColor(void *a1, const char *a2, ...)
{
  return _[a1 systemGrayColor];
}

id objc_msgSend_systemImageNamed_(void *a1, const char *a2, ...)
{
  return [a1 systemImageNamed:];
}

id objc_msgSend_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:");
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

id objc_msgSend_tableView(void *a1, const char *a2, ...)
{
  return _[a1 tableView];
}

id objc_msgSend_tableView_accessoryButtonTappedForRowWithIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tableView:accessoryButtonTappedForRowWithIndexPath:");
}

id objc_msgSend_tapTargets(void *a1, const char *a2, ...)
{
  return _[a1 tapTargets];
}

id objc_msgSend_telephonyProvider(void *a1, const char *a2, ...)
{
  return _[a1 telephonyProvider];
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

id objc_msgSend_telephonyUIInfoButtonGlyphImage(void *a1, const char *a2, ...)
{
  return _[a1 telephonyUIInfoButtonGlyphImage];
}

id objc_msgSend_telephonyUISubheadlineShortFont(void *a1, const char *a2, ...)
{
  return _[a1 telephonyUISubheadlineShortFont];
}

id objc_msgSend_telephonyUIUnreadIndicatorGlyphImage(void *a1, const char *a2, ...)
{
  return _[a1 telephonyUIUnreadIndicatorGlyphImage];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return _[a1 text];
}

id objc_msgSend_textColor(void *a1, const char *a2, ...)
{
  return _[a1 textColor];
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

id objc_msgSend_tipKitStartObservation(void *a1, const char *a2, ...)
{
  return _[a1 tipKitStartObservation];
}

id objc_msgSend_tipKitStopObservation(void *a1, const char *a2, ...)
{
  return _[a1 tipKitStopObservation];
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return _[a1 titleLabel];
}

id objc_msgSend_titleLabelBaselineAnchorLayoutConstraintConstant(void *a1, const char *a2, ...)
{
  return _[a1 titleLabelBaselineAnchorLayoutConstraintConstant];
}

id objc_msgSend_titleLabelFirstBaselineAnchorLayoutConstraint(void *a1, const char *a2, ...)
{
  return _[a1 titleLabelFirstBaselineAnchorLayoutConstraint];
}

id objc_msgSend_titleLabelFirstBaselineLayoutConstraint(void *a1, const char *a2, ...)
{
  return _[a1 titleLabelFirstBaselineLayoutConstraint];
}

id objc_msgSend_titleLabelFirstBaselineLayoutConstraintConstant(void *a1, const char *a2, ...)
{
  return _[a1 titleLabelFirstBaselineLayoutConstraintConstant];
}

id objc_msgSend_titleLabelLastBaselineAnchorLayoutConstraint(void *a1, const char *a2, ...)
{
  return _[a1 titleLabelLastBaselineAnchorLayoutConstraint];
}

id objc_msgSend_titleLabelLeadingAnchorLayoutConstraintConstantForContentCategorySize_(void *a1, const char *a2, ...)
{
  return [a1 titleLabelLeadingAnchorLayoutConstraintConstantForContentCategorySize:];
}

id objc_msgSend_titleLabelLeadingLayoutConstraintConstant(void *a1, const char *a2, ...)
{
  return _[a1 titleLabelLeadingLayoutConstraintConstant];
}

id objc_msgSend_titleLabelTopLayoutConstraint(void *a1, const char *a2, ...)
{
  return _[a1 titleLabelTopLayoutConstraint];
}

id objc_msgSend_titleLabelTrailingLayoutConstraintConstant(void *a1, const char *a2, ...)
{
  return _[a1 titleLabelTrailingLayoutConstraintConstant];
}

id objc_msgSend_titleStackView(void *a1, const char *a2, ...)
{
  return _[a1 titleStackView];
}

id objc_msgSend_toolbar(void *a1, const char *a2, ...)
{
  return _[a1 toolbar];
}

id objc_msgSend_toolbarBottomConstraint(void *a1, const char *a2, ...)
{
  return _[a1 toolbarBottomConstraint];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return _[a1 topAnchor];
}

id objc_msgSend_touchesBegan_withEvent_(void *a1, const char *a2, ...)
{
  return [a1 touchesBegan:withEvent:];
}

id objc_msgSend_touchesCancelled_withEvent_(void *a1, const char *a2, ...)
{
  return [a1 touchesCancelled:withEvent:];
}

id objc_msgSend_touchesEnded_withEvent_(void *a1, const char *a2, ...)
{
  return [a1 touchesEnded:withEvent:];
}

id objc_msgSend_touchesMoved_withEvent_(void *a1, const char *a2, ...)
{
  return [a1 touchesMoved:withEvent:];
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

id objc_msgSend_transcriptBottomConstraint(void *a1, const char *a2, ...)
{
  return _[a1 transcriptBottomConstraint];
}

id objc_msgSend_transcriptView(void *a1, const char *a2, ...)
{
  return _[a1 transcriptView];
}

id objc_msgSend_transcriptViewModel(void *a1, const char *a2, ...)
{
  return _[a1 transcriptViewModel];
}

id objc_msgSend_transcriptionAttempted(void *a1, const char *a2, ...)
{
  return _[a1 transcriptionAttempted];
}

id objc_msgSend_transitionWithView_duration_options_animations_completion_(void *a1, const char *a2, ...)
{
  return [a1 transitionWithView:duration:options:animations:completion:];
}

id objc_msgSend_trashButton(void *a1, const char *a2, ...)
{
  return _[a1 trashButton];
}

id objc_msgSend_ttyType(void *a1, const char *a2, ...)
{
  return _[a1 ttyType];
}

id objc_msgSend_tuHandle(void *a1, const char *a2, ...)
{
  return _[a1 tuHandle];
}

id objc_msgSend_tu_firstObjectPassingTest_(void *a1, const char *a2, ...)
{
  return [a1 tu_firstObjectPassingTest:];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _[a1 type];
}

id objc_msgSend_unifiedContactWithIdentifier_keysToFetch_error_(void *a1, const char *a2, ...)
{
  return [a1 unifiedContactWithIdentifier:keysToFetch:error:];
}

id objc_msgSend_uniqueId(void *a1, const char *a2, ...)
{
  return _[a1 uniqueId];
}

id objc_msgSend_unknownLabel(void *a1, const char *a2, ...)
{
  return _[a1 unknownLabel];
}

id objc_msgSend_unloadConstraints(void *a1, const char *a2, ...)
{
  return _[a1 unloadConstraints];
}

id objc_msgSend_unreadCallCount(void *a1, const char *a2, ...)
{
  return _[a1 unreadCallCount];
}

id objc_msgSend_unreadIndicatorImageView(void *a1, const char *a2, ...)
{
  return _[a1 unreadIndicatorImageView];
}

id objc_msgSend_unreadIndicatorImageViewLeadingLayoutConstraintConstant(void *a1, const char *a2, ...)
{
  return _[a1 unreadIndicatorImageViewLeadingLayoutConstraintConstant];
}

id objc_msgSend_unreadIndicatorImageViewLeadingLayoutConstraintConstantForContentSizeCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unreadIndicatorImageViewLeadingLayoutConstraintConstantForContentSizeCategory:");
}

id objc_msgSend_unreadIndicatorImageViewTopLayoutConstraintConstant(void *a1, const char *a2, ...)
{
  return _[a1 unreadIndicatorImageViewTopLayoutConstraintConstant];
}

id objc_msgSend_unreadIndicatorImageViewWidthLayoutConstraintConstant(void *a1, const char *a2, ...)
{
  return _[a1 unreadIndicatorImageViewWidthLayoutConstraintConstant];
}

id objc_msgSend_unreadIndicatorImageViewWidthLayoutConstraintConstantForContentSizeCategory_(void *a1, const char *a2, ...)
{
  return [a1 unreadIndicatorImageViewWidthLayoutConstraintConstantForContentSizeCategory:];
}

id objc_msgSend_unregisterForRingerStateNotifications(void *a1, const char *a2, ...)
{
  return _[a1 unregisterForRingerStateNotifications];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntegerValue];
}

id objc_msgSend_updateAudioRouteButtonWithTouchUpInsideEnabled_(void *a1, const char *a2, ...)
{
  return [a1 updateAudioRouteButtonWithTouchUpInsideEnabled:];
}

id objc_msgSend_updateButtonGlyphImage(void *a1, const char *a2, ...)
{
  return _[a1 updateButtonGlyphImage];
}

id objc_msgSend_updateCacheWithDestinationIDs_(void *a1, const char *a2, ...)
{
  return [a1 updateCacheWithDestinationIDs:];
}

id objc_msgSend_updateCacheWithDestinationIDs_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateCacheWithDestinationIDs:completion:");
}

id objc_msgSend_updateConstraintsForExpandedState_(void *a1, const char *a2, ...)
{
  return [a1 updateConstraintsForExpandedState:];
}

id objc_msgSend_updateElapsedTimeLabelText(void *a1, const char *a2, ...)
{
  return _[a1 updateElapsedTimeLabelText];
}

id objc_msgSend_updateExpandedViewsWithViewModel_(void *a1, const char *a2, ...)
{
  return [a1 updateExpandedViewsWithViewModel:];
}

id objc_msgSend_updateFonts(void *a1, const char *a2, ...)
{
  return _[a1 updateFonts];
}

id objc_msgSend_updateFontsAndLayoutMetrics(void *a1, const char *a2, ...)
{
  return _[a1 updateFontsAndLayoutMetrics];
}

id objc_msgSend_updateFontsLayoutMetricsAndSeparatorInset(void *a1, const char *a2, ...)
{
  return _[a1 updateFontsLayoutMetricsAndSeparatorInset];
}

id objc_msgSend_updateLabelColors(void *a1, const char *a2, ...)
{
  return _[a1 updateLabelColors];
}

id objc_msgSend_updateMinimumTrackImage(void *a1, const char *a2, ...)
{
  return _[a1 updateMinimumTrackImage];
}

id objc_msgSend_updateRecentCalls(void *a1, const char *a2, ...)
{
  return _[a1 updateRecentCalls];
}

id objc_msgSend_updateRootView(void *a1, const char *a2, ...)
{
  return _[a1 updateRootView];
}

id objc_msgSend_updateSubviewConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 updateSubviewConfiguration];
}

id objc_msgSend_updateTextColor(void *a1, const char *a2, ...)
{
  return _[a1 updateTextColor];
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

id objc_msgSend_validRemoteParticipantHandles(void *a1, const char *a2, ...)
{
  return _[a1 validRemoteParticipantHandles];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return _[a1 value];
}

id objc_msgSend_verificationStatus(void *a1, const char *a2, ...)
{
  return _[a1 verificationStatus];
}

id objc_msgSend_verified(void *a1, const char *a2, ...)
{
  return _[a1 verified];
}

id objc_msgSend_verifiedBadgeView(void *a1, const char *a2, ...)
{
  return _[a1 verifiedBadgeView];
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

id objc_msgSend_voicemailController(void *a1, const char *a2, ...)
{
  return _[a1 voicemailController];
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

id objc_msgSend_voicemailForCallRecord_(void *a1, const char *a2, ...)
{
  return [a1 voicemailForCallRecord:];
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

id objc_msgSend_voicemailMessageCellDidTapToCollapse_(void *a1, const char *a2, ...)
{
  return [a1 voicemailMessageCellDidTapToCollapse:];
}

id objc_msgSend_voicemailMessageTableViewCell_actionButtonTappedForRowWithIndexPath_(void *a1, const char *a2, ...)
{
  return [a1 voicemailMessageTableViewCell:actionButtonTappedForRowWithIndexPath:];
}

id objc_msgSend_voicemailMessageTableViewCell_audioRouteButtonTappedForRowWithIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "voicemailMessageTableViewCell:audioRouteButtonTappedForRowWithIndexPath:");
}

id objc_msgSend_voicemailMessageTableViewCell_dialRequestButtonTappedForRowWithIndexPath_(void *a1, const char *a2, ...)
{
  return [a1 voicemailMessageTableViewCell:dialRequestButtonTappedForRowWithIndexPath:];
}

id objc_msgSend_voicemailMessageTableViewCell_didChangeElapsedTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "voicemailMessageTableViewCell:didChangeElapsedTime:");
}

id objc_msgSend_voicemailMessageTableViewCell_didReceiveTranscriptFeedback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "voicemailMessageTableViewCell:didReceiveTranscriptFeedback:");
}

id objc_msgSend_voicemailMessageTableViewCell_didReceiveTranscriptTapGesture_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "voicemailMessageTableViewCell:didReceiveTranscriptTapGesture:");
}

id objc_msgSend_voicemailMessageTableViewCell_didRequestPlayState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "voicemailMessageTableViewCell:didRequestPlayState:");
}

id objc_msgSend_voicemailMessageTableViewCell_moveButtonTappedForRowWithIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "voicemailMessageTableViewCell:moveButtonTappedForRowWithIndexPath:");
}

id objc_msgSend_voicemailMessageTableViewCell_rttButtonTappedForRowWithIndexPath_(void *a1, const char *a2, ...)
{
  return [a1 voicemailMessageTableViewCell:rttButtonTappedForRowWithIndexPath:];
}

id objc_msgSend_voicemailMessageTableViewCell_shouldShowRTTButtonForRowWithIndexPath_(void *a1, const char *a2, ...)
{
  return [a1 voicemailMessageTableViewCell:shouldShowRTTButtonForRowWithIndexPath:];
}

id objc_msgSend_voicemailMessageTableViewCellDidBeginScrubbing_(void *a1, const char *a2, ...)
{
  return [a1 voicemailMessageTableViewCellDidBeginScrubbing:];
}

id objc_msgSend_voicemailMessageTableViewCellDidCancelScrubbing_(void *a1, const char *a2, ...)
{
  return [a1 voicemailMessageTableViewCellDidCancelScrubbing:];
}

id objc_msgSend_voicemailMessageTableViewCellDidEndScrubbing_(void *a1, const char *a2, ...)
{
  return [a1 voicemailMessageTableViewCellDidEndScrubbing:];
}

id objc_msgSend_voicemailMessageViewModelForVoicemail_(void *a1, const char *a2, ...)
{
  return [a1 voicemailMessageViewModelForVoicemail:];
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

id objc_msgSend_voicemailTipView(void *a1, const char *a2, ...)
{
  return _[a1 voicemailTipView];
}

id objc_msgSend_voicemailUndeleteGlyphImage(void *a1, const char *a2, ...)
{
  return _[a1 voicemailUndeleteGlyphImage];
}

id objc_msgSend_voicemailWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 voicemailWithIdentifier:];
}

id objc_msgSend_voicemailWithIdentifier_completion_(void *a1, const char *a2, ...)
{
  return [a1 voicemailWithIdentifier:completion:];
}

id objc_msgSend_wasEmergencyCall(void *a1, const char *a2, ...)
{
  return _[a1 wasEmergencyCall];
}

id objc_msgSend_wasTranscriptionAttempted(void *a1, const char *a2, ...)
{
  return _[a1 wasTranscriptionAttempted];
}

id objc_msgSend_weakToStrongObjectsMapTable(void *a1, const char *a2, ...)
{
  return _[a1 weakToStrongObjectsMapTable];
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

id objc_msgSend_withPriority_(void *a1, const char *a2, ...)
{
  return [a1 withPriority:];
}