void sub_44B8(uint64_t a1, uint64_t a2)
{
  void block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_4D94;
  block[3] = &unk_4D9F0;
  block[4] = a2;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_4A90(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

void sub_4A98(uint64_t a1, void *a2)
{
  id v4 = a2;
  v3 = settingsLocString(@"ADD_VOCABULARY_PLACEHOLDER", @"CommandAndControlSettings");
  [v4 setPlaceholder:v3];

  [v4 setDelegate:*(void *)(a1 + 32)];
  [v4 addTarget:*(void *)(a1 + 32) action:"textFieldDidChange:" forControlEvents:0x20000];
}

void sub_4B2C(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) textFields];
  v3 = [v2 firstObject];
  id v5 = [v3 text];

  if ([*(id *)(a1 + 40) _isTextValidForVocabulary:v5])
  {
    id v4 = +[CACPreferences sharedPreferences];
    [v4 addVocabularyEntryWithString:v5];

    [*(id *)(a1 + 40) reloadSpecifiers];
  }
}

id sub_4D94(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

void sub_5164(uint64_t a1, uint64_t a2)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_5668;
  block[3] = &unk_4D9F0;
  block[4] = a2;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_5668(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

float sub_69FC(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) mutableAttributedStringByReplacingPlaceholderAttribute:kSRCSCommandDescriptionsFontPlaceholderAttributeName withAttributeName:NSFontAttributeName inAttributedString:a2 withValueTable:*(void *)(a1 + 40)];
  [v2 size];
  float v4 = v3;

  return v4;
}

id sub_78E0(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  v7 = [v5 textForItem:a2];
  v8 = [*(id *)(a1 + 32) textForItem:v6];

  id v9 = [v7 localizedCompare:v8];
  return v9;
}

uint64_t sub_7B98(uint64_t a1)
{
  return _NSRequestConcreteImplementation(v2, v1, a1);
}

id sub_840C(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_8480;
  v3[3] = &unk_4D980;
  v3[4] = v1;
  return [v1 dismissViewControllerAnimated:1 completion:v3];
}

id sub_8480(uint64_t a1)
{
  uint64_t v2 = +[CACPreferences sharedPreferences];
  uint64_t v3 = +[CACPreferences sharedPreferences];
  float v4 = [v3 bestLocaleIdentifier];
  [v2 setVocabularyEntries:&__NSArray0__struct forLocaleIdentifier:v4];

  id v5 = *(void **)(a1 + 32);

  return [v5 reloadSpecifiers];
}

void sub_85FC(uint64_t a1, uint64_t a2)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_9F28;
  block[3] = &unk_4D9F0;
  block[4] = a2;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_9818(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) appendString:a2];
  uint64_t v3 = *(void **)(a1 + 32);

  return [v3 appendString:@"*"];
}

BOOL sub_9860(uint64_t a1, void *a2)
{
  id v3 = a2;
  float v4 = +[CACPreferences sharedPreferences];
  id v5 = [v4 bestLocaleIdentifier];
  id v6 = +[SRCSSpokenCommandUtilities sharedSpokenCommandUtilities];
  v7 = [v6 commandStringsTableForLocaleIdentifier:v5];

  v8 = [v3 identifier];

  id v9 = +[SRCSCommandStringsTable activeTargetTypes];
  v10 = [v7 languageModelDictionaryForCommandIdentifier:v8 targetTypes:v9 parsingErrorString:0];

  v11 = [v4 builtInCommandsStringsTableForLocaleIdentifier:v5];
  v12 = [v7 spokenStringPermutationsOfLanguageModelDictionary:v10 stringsTable:v11];
  v13 = [v12 filteredArrayUsingPredicate:*(void *)(a1 + 32)];
  BOOL v14 = [v13 count] != 0;

  return v14;
}

id sub_9D98(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:&stru_4DB50];
}

void sub_9DAC(id a1)
{
  id v1 = +[CACPreferences sharedPreferences];
  [v1 deleteAllCustomCommandEntries];
}

id sub_9F28(uint64_t a1)
{
  return [*(id *)(a1 + 32) _commandSettingsDidChange];
}

id settingsLocString(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = (void *)qword_54DA0;
  if (!qword_54DA0)
  {
    uint64_t v6 = +[NSBundle bundleForClass:AXSafeClassFromString()];
    v7 = (void *)qword_54DA0;
    qword_54DA0 = v6;

    id v5 = (void *)qword_54DA0;
  }
  v8 = [v5 localizedStringForKey:v3 value:v3 table:v4];

  return v8;
}

id sub_A3FC(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

void sub_A9AC(uint64_t a1, uint64_t a2)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_AEB0;
  block[3] = &unk_4D9F0;
  block[4] = a2;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_AEB0(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

void sub_AF30(uint64_t a1, uint64_t a2)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_BDAC;
  block[3] = &unk_4D9F0;
  block[4] = a2;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

int64_t sub_BBA4(id a1, CACSpokenCommandItem *a2, CACSpokenCommandItem *a3)
{
  if ((unint64_t)a2 | (unint64_t)a3) {
    int64_t result = -1;
  }
  else {
    int64_t result = 0;
  }
  if (a2)
  {
    id v5 = a3;
    uint64_t v6 = [(CACSpokenCommandItem *)a2 untranslatedLocale];
    v7 = [(CACSpokenCommandItem *)v5 untranslatedLocale];

    id v8 = [v6 compare:v7];
    return (int64_t)v8;
  }
  return result;
}

id sub_BDAC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _commandSettingsDidChange];
}

void sub_BE2C(uint64_t a1, uint64_t a2)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_D0FC;
  block[3] = &unk_4D9F0;
  block[4] = a2;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_D0FC(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

void sub_D330(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_FC40;
  v3[3] = &unk_4DCA8;
  v3[4] = a3;
  void v3[5] = a2;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
}

void sub_DF94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id *location, id *a16)
{
  objc_destroyWeak(location);
  objc_destroyWeak(a16);
  objc_destroyWeak((id *)(v16 - 112));
  _Unwind_Resume(a1);
}

void sub_DFCC(uint64_t a1)
{
  objc_copyWeak(&v1, (id *)(a1 + 32));
  AXPerformBlockAsynchronouslyOnMainThread();
  objc_destroyWeak(&v1);
}

void sub_E054(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_E068(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained showDonationModalView];
}

void sub_E0A8(uint64_t a1)
{
  objc_copyWeak(&v1, (id *)(a1 + 32));
  AXPerformBlockAsynchronouslyOnMainThread();
  objc_destroyWeak(&v1);
}

void sub_E130(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_E144(uint64_t a1)
{
  uint64_t v2 = +[CACPreferences sharedPreferences];
  [v2 setDonationTipKitSeen:1];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifiers];

  UIAccessibilityNotifications v4 = UIAccessibilityLayoutChangedNotification;

  UIAccessibilityPostNotification(v4, 0);
}

void sub_E714(uint64_t a1)
{
  uint64_t v2 = +[CACPreferences sharedPreferences];
  id v3 = [v2 bestLocaleIdentifier];
  UIAccessibilityNotifications v4 = [v3 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];

  id v5 = +[CACLanguageAssetManager sharedManager];
  uint64_t v6 = [v5 installationStatus];
  v7 = [v6 objectForKey:v4];

  id v8 = +[CACLanguageAssetManager sharedManager];
  id v9 = [v8 downloadProgressForLanguage:v4];

  v10 = CACLogGeneral();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v7;
    _os_log_impl(&def_14E30, v10, OS_LOG_TYPE_INFO, "Installation status: %@", buf, 0xCu);
  }

  if ([v7 hasPrefix:kCACLanguageAssetInstallationStatusPrefixInstalled])
  {
    v11 = 0;
  }
  else if (([v7 hasPrefix:kCACLanguageAssetInstallationStatusPrefixInstalling] & 1) != 0 {
         || ([v7 hasPrefix:kCACLanguageAssetInstallationStatusPrefixWaitingToInstall] & 1) != 0)
  }
  {
    v11 = &def_14E30 + 1;
  }
  else if (v7)
  {
    v11 = &def_14E30 + 2;
  }
  else
  {
    v12 = [v9 objectForKey:kCACDownloadProgressDictionaryKeyTotalBytes];
    int v13 = [v12 intValue];

    if (v13 > 0) {
      v11 = &def_14E30 + 1;
    }
    else {
      v11 = &def_14E30 + 2;
    }
  }
  objc_initWeak((id *)buf, *(id *)(a1 + 32));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_E990;
  v14[3] = &unk_4DC48;
  objc_copyWeak(v15, (id *)buf);
  v15[1] = v11;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v14);
  objc_destroyWeak(v15);
  objc_destroyWeak((id *)buf);
}

void sub_E990(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    UIAccessibilityNotifications v4 = objc_loadWeakRetained(v2);
    id v5 = CACLogGeneral();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = v4[26];
      uint64_t v7 = *(void *)(a1 + 40);
      int v11 = 134218240;
      uint64_t v12 = v6;
      __int16 v13 = 2048;
      uint64_t v14 = v7;
      _os_log_impl(&def_14E30, v5, OS_LOG_TYPE_DEFAULT, "Checking if specifiers need update due to changed installation status. Old:%ld, New:%ld", (uint8_t *)&v11, 0x16u);
    }

    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = v4[26];
    v4[26] = v8;
    if (v8 != v9)
    {
      v10 = CACLogGeneral();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v11) = 0;
        _os_log_impl(&def_14E30, v10, OS_LOG_TYPE_DEFAULT, "Reloading specifiers due to language status update", (uint8_t *)&v11, 2u);
      }

      [v4 reloadSpecifiers];
    }
  }
}

void sub_F710(id a1, UIAlertAction *a2)
{
  id v3 = +[CACPreferences sharedPreferences];
  uint64_t v2 = +[NSDictionary dictionary];
  [v3 setUserHintsHistory:v2];
}

id sub_F8A8(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

void sub_F998(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) specifierForID:@"COMMAND_AND_CONTROL_DONATION_TipKit"];
  id v3 = [*(id *)(a1 + 32) cellForSpecifier:v2];
  [v3 instrinsicContentHeight];
  *(void *)(*(void *)(a1 + 32) + 192) = v4;

  [*(id *)(a1 + 32) reloadSpecifier:v2];
  *(unsigned char *)(*(void *)(a1 + 32) + 184) = 1;
  id v5 = AXLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = +[NSNumber numberWithDouble:*(double *)(*(void *)(a1 + 32) + 192)];
    int v7 = 138412290;
    uint64_t v8 = v6;
    _os_log_impl(&def_14E30, v5, OS_LOG_TYPE_DEFAULT, "Tip loaded, resetting specifier, height: %@", (uint8_t *)&v7, 0xCu);
  }
}

id sub_FC40(uint64_t a1)
{
  uint64_t v2 = CACLogAssetDownload();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_382A4(a1, v2);
  }

  return [*(id *)(a1 + 40) reloadSpecifiers];
}

id sub_10954(uint64_t a1, uint64_t a2)
{
  *(void *)&v2[OBJC_IVAR____TtC20VoiceControlSettings37CACPhoneticVocabularyRecordingManager_connection] = 0;
  id v5 = &v2[OBJC_IVAR____TtC20VoiceControlSettings37CACPhoneticVocabularyRecordingManager_recognizedPhonemesBlock];
  *(void *)id v5 = 0;
  *((void *)v5 + 1) = 0;
  uint64_t v6 = &v2[OBJC_IVAR____TtC20VoiceControlSettings37CACPhoneticVocabularyRecordingManager_didStart];
  *(void *)uint64_t v6 = 0;
  *((void *)v6 + 1) = 0;
  int v7 = &v2[OBJC_IVAR____TtC20VoiceControlSettings37CACPhoneticVocabularyRecordingManager_didEnd];
  *(void *)int v7 = 0;
  *((void *)v7 + 1) = 0;
  uint64_t v8 = &v2[OBJC_IVAR____TtC20VoiceControlSettings37CACPhoneticVocabularyRecordingManager_didError];
  *(void *)uint64_t v8 = 0;
  *((void *)v8 + 1) = 0;
  uint64_t v9 = &v2[OBJC_IVAR____TtC20VoiceControlSettings37CACPhoneticVocabularyRecordingManager_text];
  *(void *)uint64_t v9 = 0;
  *((void *)v9 + 1) = 0xE000000000000000;
  v10 = v2;
  sub_38410();
  int v11 = &v10[OBJC_IVAR____TtC20VoiceControlSettings37CACPhoneticVocabularyRecordingManager_locale];
  *(void *)int v11 = a1;
  *((void *)v11 + 1) = a2;

  v13.receiver = v10;
  v13.super_class = (Class)type metadata accessor for CACPhoneticVocabularyRecordingManager(0);
  return objc_msgSendSuper2(&v13, "init");
}

id sub_10A68()
{
  id v1 = *(void **)&v0[OBJC_IVAR____TtC20VoiceControlSettings37CACPhoneticVocabularyRecordingManager_connection];
  if (v1) {
    [v1 endSession];
  }
  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for CACPhoneticVocabularyRecordingManager(0);
  return objc_msgSendSuper2(&v3, "dealloc");
}

void sub_10C24()
{
  uint64_t v1 = v0;
  id v2 = [objc_allocWithZone((Class)AFDictationConnection) init];
  uint64_t v3 = OBJC_IVAR____TtC20VoiceControlSettings37CACPhoneticVocabularyRecordingManager_connection;
  uint64_t v4 = *(void **)(v0 + OBJC_IVAR____TtC20VoiceControlSettings37CACPhoneticVocabularyRecordingManager_connection);
  *(void *)(v0 + OBJC_IVAR____TtC20VoiceControlSettings37CACPhoneticVocabularyRecordingManager_connection) = v2;

  id v5 = *(void **)(v0 + v3);
  if (v5) {
    [v5 setDelegate:v0];
  }
  id v6 = [objc_allocWithZone((Class)AFDictationOptions) init];
  [v6 setTranscriptionMode:3];
  uint64_t v7 = sub_38370();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_38360();
  uint64_t v11 = sub_38350();
  unint64_t v13 = v12;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  sub_224F8(6, v11, v13, v14);
  swift_bridgeObjectRelease();
  sub_39000();
  swift_bridgeObjectRelease();
  v15 = (void *)sub_38FC0();
  swift_bridgeObjectRelease();
  [v6 setOrthography:v15];

  id v16 = [objc_allocWithZone((Class)AFSpeechRequestOptions) initWithActivationEvent:4];
  [v16 setIsEyesFree:1];
  [v16 setEndpointerOperationMode:3];
  v17 = *(void **)(v1 + v3);
  if (v17)
  {
    if ((*(void *)(v1 + OBJC_IVAR____TtC20VoiceControlSettings37CACPhoneticVocabularyRecordingManager_locale) != 0x4E492D6E65
       || *(void *)(v1 + OBJC_IVAR____TtC20VoiceControlSettings37CACPhoneticVocabularyRecordingManager_locale + 8) != 0xE500000000000000)
      && (sub_39280() & 1) == 0)
    {
      swift_bridgeObjectRetain();
    }
    id v19 = v17;
    v20 = (void *)sub_38FC0();
    swift_bridgeObjectRelease();
    [v19 startDictationWithLanguageCode:v20 options:v6 speechOptions:v16];

    v18 = v6;
  }
  else
  {
    v18 = v16;
    id v16 = v6;
  }
}

void sub_10F30()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC20VoiceControlSettings37CACPhoneticVocabularyRecordingManager_connection);
  if (v1)
  {
    [v1 stopSpeechWithOptions:0];
  }
  else
  {
    oslog = sub_38400();
    os_log_type_t v2 = sub_39140();
    if (os_log_type_enabled(oslog, v2))
    {
      uint64_t v3 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v3 = 0;
      _os_log_impl(&def_14E30, oslog, v2, "[Guard] Calling stopRecording() when connection is nil", v3, 2u);
      swift_slowDealloc();
    }
  }
}

void sub_11018()
{
  uint64_t v1 = v0;
  uint64_t v2 = OBJC_IVAR____TtC20VoiceControlSettings37CACPhoneticVocabularyRecordingManager_connection;
  uint64_t v3 = *(void **)&v0[OBJC_IVAR____TtC20VoiceControlSettings37CACPhoneticVocabularyRecordingManager_connection];
  if (v3)
  {
    uint64_t v4 = v0;
    id v5 = v3;
    id v6 = sub_38400();
    os_log_type_t v7 = sub_39110();
    if (os_log_type_enabled(v6, v7))
    {
      os_log_t oslog = v5;
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = swift_slowAlloc();
      *(_DWORD *)uint64_t v8 = 136315138;
      uint64_t v9 = *(void **)&v1[v2];
      if (v9)
      {
        id v10 = [v9 debugDescription];
        uint64_t v11 = sub_38FE0();
        unint64_t v13 = v12;
      }
      else
      {
        unint64_t v13 = 0xE300000000000000;
        uint64_t v11 = 7104878;
      }
      sub_217D4(v11, v13, &v19);
      sub_391B0();

      swift_bridgeObjectRelease();
      _os_log_impl(&def_14E30, v6, v7, "endSession() %s", v8, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      id v5 = oslog;
    }
    else
    {
    }
    [v5 endSession];
    id v16 = *(void **)&v1[v2];
    *(void *)&v1[v2] = 0;
  }
  else
  {
    osloga = sub_38400();
    os_log_type_t v14 = sub_39140();
    if (os_log_type_enabled(osloga, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v15 = 0;
      _os_log_impl(&def_14E30, osloga, v14, "[Guard] Calling endSession() when connection is nil", v15, 2u);
      swift_slowDealloc();
    }
  }
}

void sub_112A0(void *a1)
{
  uint64_t v3 = OBJC_IVAR____TtC20VoiceControlSettings37CACPhoneticVocabularyRecordingManager_connection;
  uint64_t v4 = *(void **)&v1[OBJC_IVAR____TtC20VoiceControlSettings37CACPhoneticVocabularyRecordingManager_connection];
  if (a1)
  {
    if (v4) {
      BOOL v5 = a1 == v4;
    }
    else {
      BOOL v5 = 0;
    }
    if (!v5)
    {
LABEL_16:
      v23 = v1;
      id v24 = a1;
      v25 = v23;
      id v26 = v24;
      log = sub_38400();
      os_log_type_t v27 = sub_39140();
      if (os_log_type_enabled(log, v27))
      {
        uint64_t v28 = swift_slowAlloc();
        v29 = (void *)swift_slowAlloc();
        uint64_t v38 = swift_slowAlloc();
        *(_DWORD *)uint64_t v28 = 136315394;
        sub_22BC4(&qword_54340);
        uint64_t v30 = sub_391A0();
        sub_217D4(v30, v31, &v38);
        sub_391B0();

        swift_bridgeObjectRelease();
        *(_WORD *)(v28 + 12) = 2112;
        v32 = *(void **)&v1[v3];
        if (v32) {
          id v33 = v32;
        }
        sub_391B0();
        void *v29 = v32;

        _os_log_impl(&def_14E30, log, v27, "[Guard] dictationConnectionSpeechRecordingDidBegin callback received for unexpected connection (%s. Expected: %@", (uint8_t *)v28, 0x16u);
        sub_22BC4(&qword_54348);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
      }
      return;
    }
  }
  else if (v4)
  {
    goto LABEL_16;
  }
  id v6 = v1;
  id v7 = a1;
  uint64_t v8 = v6;
  id v9 = v7;
  id v10 = sub_38400();
  os_log_type_t v11 = sub_39140();
  if (os_log_type_enabled(v10, v11))
  {
    os_log_type_t v36 = v11;
    uint64_t v12 = 0x53552D6E65;
    uint64_t v13 = swift_slowAlloc();
    uint64_t v38 = swift_slowAlloc();
    *(_DWORD *)uint64_t v13 = 136315650;
    os_log_type_t v14 = (uint64_t *)&v8[OBJC_IVAR____TtC20VoiceControlSettings37CACPhoneticVocabularyRecordingManager_locale];
    uint64_t v16 = *(void *)&v8[OBJC_IVAR____TtC20VoiceControlSettings37CACPhoneticVocabularyRecordingManager_locale];
    unint64_t v15 = *(void *)&v8[OBJC_IVAR____TtC20VoiceControlSettings37CACPhoneticVocabularyRecordingManager_locale + 8];
    unint64_t v17 = 0xE500000000000000;
    BOOL v18 = v16 == 0x4E492D6E65 && v15 == 0xE500000000000000;
    if (!v18 && (sub_39280() & 1) == 0)
    {
      swift_bridgeObjectRetain();
      uint64_t v12 = v16;
      unint64_t v17 = v15;
    }
    sub_217D4(v12, v17, &v38);
    sub_391B0();

    swift_bridgeObjectRelease();
    *(_WORD *)(v13 + 12) = 2080;
    uint64_t v19 = *v14;
    unint64_t v20 = v14[1];
    swift_bridgeObjectRetain();
    sub_217D4(v19, v20, &v38);
    sub_391B0();

    swift_bridgeObjectRelease();
    *(_WORD *)(v13 + 22) = 2080;
    sub_22BC4(&qword_54340);
    uint64_t v21 = sub_391A0();
    sub_217D4(v21, v22, &v38);
    sub_391B0();

    swift_bridgeObjectRelease();
    _os_log_impl(&def_14E30, v10, v36, "dictationConnectionSpeechRecordingDidBegin for locale: %s, actual VC locale: %s connection: %s", (uint8_t *)v13, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  v34 = *(void (**)(uint64_t))&v8[OBJC_IVAR____TtC20VoiceControlSettings37CACPhoneticVocabularyRecordingManager_didStart];
  if (v34)
  {
    uint64_t v35 = swift_retain();
    v34(v35);
    sub_24890((uint64_t)v34);
  }
}

uint64_t sub_11874(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *v1;
  int64_t v4 = *((void *)*v1 + 2);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }
  isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= *((void *)v3 + 3) >> 1)
  {
    unint64_t v8 = *(void *)(a1 + 16);
    if (v8) {
      goto LABEL_5;
    }
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
  if (v4 <= v5) {
    int64_t v15 = v4 + v2;
  }
  else {
    int64_t v15 = v4;
  }
  uint64_t v3 = sub_2D610(isUniquelyReferenced_nonNull_native, v15, 1, v3);
  unint64_t v8 = *(void *)(a1 + 16);
  if (!v8) {
    goto LABEL_18;
  }
LABEL_5:
  uint64_t v9 = *((void *)v3 + 2);
  if ((*((void *)v3 + 3) >> 1) - v9 < (uint64_t)v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v10 = (unint64_t)&v3[16 * v9 + 32];
  if (a1 + 32 < v10 + 16 * v8 && v10 < a1 + 32 + 16 * v8) {
    goto LABEL_24;
  }
  swift_arrayInitWithCopy();
  if (v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v12 = *((void *)v3 + 2);
  BOOL v13 = __OFADD__(v12, v8);
  uint64_t v14 = v12 + v8;
  if (!v13)
  {
    *((void *)v3 + 2) = v14;
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *uint64_t v1 = v3;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_39260();
  __break(1u);
  return result;
}

void sub_11A80(void *a1, uint64_t a2)
{
  sub_11BCC(a1, a2, "dictationConnectionSpeechRecordingDidFail %s connection: %s", "[Guard] speechRecordingDidFail callback received for unexpected connection (%s. Expected: %@");
}

void sub_11B64(void *a1, uint64_t a2)
{
  sub_11BCC(a1, a2, "dictationConnectionSpeechRecognitionDidFail %s connection: %s", "[Guard] speechRecognitionDidFail callback received for unexpected connection (%s. Expected: %@");
}

void sub_11BCC(void *a1, uint64_t a2, const char *a3, const char *a4)
{
  uint64_t v9 = OBJC_IVAR____TtC20VoiceControlSettings37CACPhoneticVocabularyRecordingManager_connection;
  unint64_t v10 = *(void **)&v4[OBJC_IVAR____TtC20VoiceControlSettings37CACPhoneticVocabularyRecordingManager_connection];
  if (a1)
  {
    if (v10) {
      BOOL v11 = a1 == v10;
    }
    else {
      BOOL v11 = 0;
    }
    if (!v11)
    {
LABEL_11:
      id v21 = a1;
      unint64_t v22 = v4;
      id v23 = v21;
      id v24 = v22;
      format = (char *)sub_38400();
      os_log_type_t v25 = sub_39140();
      if (os_log_type_enabled((os_log_t)format, v25))
      {
        v34 = a4;
        uint64_t v26 = swift_slowAlloc();
        os_log_type_t v27 = (void *)swift_slowAlloc();
        uint64_t v36 = swift_slowAlloc();
        *(_DWORD *)uint64_t v26 = 136315394;
        sub_22BC4(&qword_54340);
        uint64_t v28 = sub_391A0();
        sub_217D4(v28, v29, &v36);
        sub_391B0();

        swift_bridgeObjectRelease();
        *(_WORD *)(v26 + 12) = 2112;
        uint64_t v30 = *(void **)&v4[v9];
        if (v30) {
          id v31 = v30;
        }
        sub_391B0();
        *os_log_type_t v27 = v30;

        _os_log_impl(&def_14E30, (os_log_t)format, v25, v34, (uint8_t *)v26, 0x16u);
        sub_22BC4(&qword_54348);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
      }
      return;
    }
  }
  else if (v10)
  {
    goto LABEL_11;
  }
  swift_errorRetain();
  id v12 = a1;
  swift_errorRetain();
  id v13 = v12;
  uint64_t v14 = sub_38400();
  os_log_type_t v15 = sub_39120();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = swift_slowAlloc();
    uint64_t v36 = swift_slowAlloc();
    *(_DWORD *)uint64_t v16 = 136315394;
    if (!a2)
    {

      __break(1u);
      return;
    }
    swift_getErrorValue();
    uint64_t v17 = sub_39290();
    sub_217D4(v17, v18, &v36);
    sub_391B0();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    *(_WORD *)(v16 + 12) = 2080;
    sub_22BC4(&qword_54340);
    uint64_t v19 = sub_391A0();
    sub_217D4(v19, v20, &v36);
    sub_391B0();

    swift_bridgeObjectRelease();
    _os_log_impl(&def_14E30, v14, v15, a3, (uint8_t *)v16, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_errorRelease();
    swift_errorRelease();
  }
  v32 = *(void (**)(uint64_t))&v4[OBJC_IVAR____TtC20VoiceControlSettings37CACPhoneticVocabularyRecordingManager_didError];
  if (v32)
  {
    uint64_t v33 = swift_retain();
    v32(v33);
    sub_24890((uint64_t)v32);
  }
  sub_11018();
}

void sub_12114(void *a1)
{
  uint64_t v2 = OBJC_IVAR____TtC20VoiceControlSettings37CACPhoneticVocabularyRecordingManager_connection;
  uint64_t v3 = *(void **)&v1[OBJC_IVAR____TtC20VoiceControlSettings37CACPhoneticVocabularyRecordingManager_connection];
  if (a1)
  {
    if (v3) {
      BOOL v4 = a1 == v3;
    }
    else {
      BOOL v4 = 0;
    }
    if (!v4)
    {
LABEL_10:
      id v11 = a1;
      id v12 = v1;
      id v13 = v11;
      uint64_t v14 = v12;
      os_log_t oslog = sub_38400();
      os_log_type_t v15 = sub_39140();
      if (os_log_type_enabled(oslog, v15))
      {
        uint64_t v16 = swift_slowAlloc();
        uint64_t v17 = (void *)swift_slowAlloc();
        uint64_t v25 = swift_slowAlloc();
        *(_DWORD *)uint64_t v16 = 136315394;
        sub_22BC4(&qword_54340);
        uint64_t v18 = sub_391A0();
        sub_217D4(v18, v19, &v25);
        sub_391B0();

        swift_bridgeObjectRelease();
        *(_WORD *)(v16 + 12) = 2112;
        unint64_t v20 = *(void **)&v1[v2];
        if (v20) {
          id v21 = v20;
        }
        sub_391B0();
        void *v17 = v20;

        _os_log_impl(&def_14E30, oslog, v15, "[Guard] dictationConnectionSpeechRecordingDidCancel callback received for unexpected connection (%s. Expected: %@", (uint8_t *)v16, 0x16u);
        sub_22BC4(&qword_54348);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
      }
      return;
    }
  }
  else if (v3)
  {
    goto LABEL_10;
  }
  id v5 = a1;
  id v6 = sub_38400();
  os_log_type_t v7 = sub_39140();
  if (os_log_type_enabled(v6, v7))
  {
    unint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v25 = swift_slowAlloc();
    *(_DWORD *)unint64_t v8 = 136315138;
    sub_22BC4(&qword_54340);
    uint64_t v9 = sub_391A0();
    sub_217D4(v9, v10, &v25);
    sub_391B0();

    swift_bridgeObjectRelease();
    _os_log_impl(&def_14E30, v6, v7, "dictationConnectionSpeechRecordingDidCancel connection: %s", v8, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  unint64_t v22 = *(void (**)(uint64_t))&v1[OBJC_IVAR____TtC20VoiceControlSettings37CACPhoneticVocabularyRecordingManager_didError];
  if (v22)
  {
    uint64_t v23 = swift_retain();
    v22(v23);
    sub_24890((uint64_t)v22);
  }
  sub_11018();
}

void sub_125AC(void *a1)
{
  uint64_t v2 = OBJC_IVAR____TtC20VoiceControlSettings37CACPhoneticVocabularyRecordingManager_connection;
  uint64_t v3 = *(void **)&v1[OBJC_IVAR____TtC20VoiceControlSettings37CACPhoneticVocabularyRecordingManager_connection];
  if (a1)
  {
    if (v3) {
      BOOL v4 = a1 == v3;
    }
    else {
      BOOL v4 = 0;
    }
    if (!v4) {
      goto LABEL_10;
    }
  }
  else if (v3)
  {
LABEL_10:
    id v10 = a1;
    id v11 = v1;
    id v12 = v10;
    id v13 = v11;
    os_log_t oslog = sub_38400();
    os_log_type_t v14 = sub_39140();
    if (os_log_type_enabled(oslog, v14))
    {
      uint64_t v15 = swift_slowAlloc();
      uint64_t v16 = (void *)swift_slowAlloc();
      uint64_t v22 = swift_slowAlloc();
      *(_DWORD *)uint64_t v15 = 136315394;
      sub_22BC4(&qword_54340);
      uint64_t v17 = sub_391A0();
      sub_217D4(v17, v18, &v22);
      sub_391B0();

      swift_bridgeObjectRelease();
      *(_WORD *)(v15 + 12) = 2112;
      unint64_t v19 = *(void **)&v1[v2];
      if (v19) {
        id v20 = v19;
      }
      sub_391B0();
      *uint64_t v16 = v19;

      _os_log_impl(&def_14E30, oslog, v14, "[Guard] dictationConnectionSpeechRecognitionDidSucceed callback received for unexpected connection (%s. Expected: %@", (uint8_t *)v15, 0x16u);
      sub_22BC4(&qword_54348);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      goto LABEL_19;
    }

    goto LABEL_15;
  }
  id v5 = a1;
  os_log_t oslog = sub_38400();
  os_log_type_t v6 = sub_39140();
  if (os_log_type_enabled(oslog, v6))
  {
    os_log_type_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v22 = swift_slowAlloc();
    *(_DWORD *)os_log_type_t v7 = 136315138;
    sub_22BC4(&qword_54340);
    uint64_t v8 = sub_391A0();
    sub_217D4(v8, v9, &v22);
    sub_391B0();

    swift_bridgeObjectRelease();
    _os_log_impl(&def_14E30, oslog, v6, "dictationConnectionSpeechRecognitionDidSucceed connection: %s", v7, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
LABEL_19:
    swift_slowDealloc();

    return;
  }

LABEL_15:
}

void sub_129F8(void *a1)
{
  uint64_t v2 = OBJC_IVAR____TtC20VoiceControlSettings37CACPhoneticVocabularyRecordingManager_connection;
  uint64_t v3 = *(void **)&v1[OBJC_IVAR____TtC20VoiceControlSettings37CACPhoneticVocabularyRecordingManager_connection];
  if (a1)
  {
    if (v3) {
      BOOL v4 = a1 == v3;
    }
    else {
      BOOL v4 = 0;
    }
    if (!v4)
    {
LABEL_10:
      id v11 = a1;
      id v12 = v1;
      id v13 = v11;
      os_log_type_t v14 = v12;
      os_log_t oslog = sub_38400();
      os_log_type_t v15 = sub_39140();
      if (os_log_type_enabled(oslog, v15))
      {
        uint64_t v16 = swift_slowAlloc();
        uint64_t v17 = (void *)swift_slowAlloc();
        uint64_t v25 = swift_slowAlloc();
        *(_DWORD *)uint64_t v16 = 136315394;
        sub_22BC4(&qword_54340);
        uint64_t v18 = sub_391A0();
        sub_217D4(v18, v19, &v25);
        sub_391B0();

        swift_bridgeObjectRelease();
        *(_WORD *)(v16 + 12) = 2112;
        id v20 = *(void **)&v1[v2];
        if (v20) {
          id v21 = v20;
        }
        sub_391B0();
        void *v17 = v20;

        _os_log_impl(&def_14E30, oslog, v15, "[Guard] dictationConnectionSpeechRecordingDidEnd callback received for unexpected connection (%s. Expected: %@", (uint8_t *)v16, 0x16u);
        sub_22BC4(&qword_54348);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
      }
      return;
    }
  }
  else if (v3)
  {
    goto LABEL_10;
  }
  id v5 = a1;
  os_log_type_t v6 = sub_38400();
  os_log_type_t v7 = sub_39140();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v25 = swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 136315138;
    sub_22BC4(&qword_54340);
    uint64_t v9 = sub_391A0();
    sub_217D4(v9, v10, &v25);
    sub_391B0();

    swift_bridgeObjectRelease();
    _os_log_impl(&def_14E30, v6, v7, "dictationConnectionSpeechRecordingDidEnd connection: %s", v8, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  uint64_t v22 = *(void (**)(uint64_t))&v1[OBJC_IVAR____TtC20VoiceControlSettings37CACPhoneticVocabularyRecordingManager_didEnd];
  if (v22)
  {
    uint64_t v23 = swift_retain();
    v22(v23);
    sub_24890((uint64_t)v22);
  }
}

unint64_t CACDictationState.rawValue.getter(char a1)
{
  unint64_t result = 0xD000000000000010;
  switch(a1)
  {
    case 1:
      return result;
    case 2:
      unint64_t result = 0xD000000000000014;
      break;
    case 3:
      unint64_t result = 0x6E6964726F636572;
      break;
    case 4:
      unint64_t result = 0x6F636552656E6F64;
      break;
    case 5:
      unint64_t result = 0x64656873696E6966;
      break;
    case 6:
      unint64_t result = 0x6465726F727265;
      break;
    default:
      unint64_t result = 1701602409;
      break;
  }
  return result;
}

uint64_t sub_12FB0(unsigned __int8 *a1, char *a2)
{
  return sub_12FD4(*a1, *a2) & 1;
}

uint64_t sub_12FD4(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xD000000000000010;
  unint64_t v3 = 0x80000000000432D0;
  uint64_t v4 = a1;
  unint64_t v5 = 0xD000000000000010;
  switch(v4)
  {
    case 1:
      break;
    case 2:
      unint64_t v5 = 0xD000000000000014;
      unint64_t v3 = 0x80000000000432F0;
      break;
    case 3:
      unint64_t v3 = 0xE900000000000067;
      unint64_t v5 = 0x6E6964726F636572;
      break;
    case 4:
      unint64_t v3 = 0xED0000676E696472;
      unint64_t v5 = 0x6F636552656E6F64;
      break;
    case 5:
      unint64_t v3 = 0xE800000000000000;
      unint64_t v5 = 0x64656873696E6966;
      break;
    case 6:
      unint64_t v3 = 0xE700000000000000;
      unint64_t v5 = 0x6465726F727265;
      break;
    default:
      unint64_t v3 = 0xE400000000000000;
      unint64_t v5 = 1701602409;
      break;
  }
  unint64_t v6 = 0x80000000000432D0;
  switch(a2)
  {
    case 1:
      goto LABEL_18;
    case 2:
      unint64_t v6 = 0x80000000000432F0;
      if (v5 != 0xD000000000000014) {
        goto LABEL_22;
      }
      goto LABEL_19;
    case 3:
      unint64_t v6 = 0xE900000000000067;
      if (v5 != 0x6E6964726F636572) {
        goto LABEL_22;
      }
      goto LABEL_19;
    case 4:
      unint64_t v6 = 0xED0000676E696472;
      if (v5 != 0x6F636552656E6F64) {
        goto LABEL_22;
      }
      goto LABEL_19;
    case 5:
      unint64_t v6 = 0xE800000000000000;
      unint64_t v2 = 0x64656873696E6966;
LABEL_18:
      if (v5 == v2) {
        goto LABEL_19;
      }
      goto LABEL_22;
    case 6:
      unint64_t v6 = 0xE700000000000000;
      if (v5 != 0x6465726F727265) {
        goto LABEL_22;
      }
      goto LABEL_19;
    default:
      unint64_t v6 = 0xE400000000000000;
      if (v5 != 1701602409) {
        goto LABEL_22;
      }
LABEL_19:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_22:
      }
        char v7 = sub_39280();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

Swift::Int sub_13228()
{
  return sub_1336C();
}

uint64_t sub_13234()
{
  return sub_1323C();
}

uint64_t sub_1323C()
{
  sub_39010();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_13364()
{
  return sub_1336C();
}

Swift::Int sub_1336C()
{
  return sub_392C0();
}

uint64_t sub_134B0@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = _s20VoiceControlSettings17CACDictationStateO8rawValueACSgSS_tcfC_0(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

unint64_t sub_134E0@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = CACDictationState.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

void sub_1350C(unsigned char *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_13514(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v8 = sub_22C0C();

  return static EnvironmentKey<>._valuesEqual(_:_:)(a1, a2, a3, a4, v8);
}

uint64_t sub_13578()
{
  sub_257A0();
  sub_38850();
  return v1;
}

BOOL sub_135B4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_135C8()
{
  Swift::UInt v1 = *v0;
  sub_392A0();
  sub_392B0(v1);
  return sub_392C0();
}

void sub_13610()
{
  sub_392B0(*v0);
}

Swift::Int sub_1363C()
{
  Swift::UInt v1 = *v0;
  sub_392A0();
  sub_392B0(v1);
  return sub_392C0();
}

uint64_t sub_13680@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v42 = a2;
  uint64_t v43 = a3;
  uint64_t v44 = a1;
  *a4 = swift_getKeyPath();
  sub_22BC4(&qword_53EC8);
  swift_storeEnumTagMultiPayload();
  unint64_t v5 = (int *)type metadata accessor for CACPhoneticVocabularyRecordingView(0);
  unint64_t v6 = (uint64_t *)((char *)a4 + v5[7]);
  id v45 = [objc_allocWithZone((Class)AVSpeechSynthesizer) init];
  sub_266C4(0, &qword_54358);
  sub_38E50();
  uint64_t v7 = *((void *)&v47 + 1);
  *unint64_t v6 = v47;
  v6[1] = v7;
  unint64_t v8 = (char *)a4 + v5[9];
  LOBYTE(v45) = 0;
  sub_38E50();
  uint64_t v9 = *((void *)&v47 + 1);
  char *v8 = v47;
  *((void *)v8 + 1) = v9;
  unint64_t v10 = (char *)a4 + v5[10];
  LOBYTE(v45) = 0;
  sub_38E50();
  uint64_t v11 = *((void *)&v47 + 1);
  char *v10 = v47;
  *((void *)v10 + 1) = v11;
  id v12 = (char *)a4 + v5[11];
  id v45 = 0;
  unint64_t v46 = 0;
  sub_22BC4(&qword_54268);
  sub_38E50();
  uint64_t v13 = v48;
  *(_OWORD *)id v12 = v47;
  *((void *)v12 + 2) = v13;
  os_log_type_t v14 = (char *)a4 + v5[12];
  id v45 = 0;
  unint64_t v46 = 0xE000000000000000;
  sub_38E50();
  uint64_t v15 = v48;
  *(_OWORD *)os_log_type_t v14 = v47;
  *((void *)v14 + 2) = v15;
  sub_38410();
  uint64_t v16 = v5[14];
  sub_384C0();
  swift_allocObject();
  *(uint64_t *)((char *)a4 + v16) = sub_384B0();
  uint64_t v41 = v5[15];
  sub_266C4(0, &qword_54038);
  uint64_t v17 = sub_38FB0();
  v40[1] = v40;
  __chkstk_darwin(v17 - 8);
  sub_38FA0();
  uint64_t v18 = sub_39150();
  __chkstk_darwin(v18);
  *(void *)&long long v47 = _swiftEmptyArrayStorage;
  sub_26700(&qword_54360, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  sub_22BC4(&qword_54368);
  sub_26748(&qword_54370, &qword_54368);
  sub_391F0();
  uint64_t v19 = sub_39160();
  __chkstk_darwin(v19);
  (*(void (**)(char *, void))(v21 + 104))((char *)v40 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0), enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:));
  *(uint64_t *)((char *)a4 + v41) = sub_39190();
  uint64_t v22 = (char *)a4 + v5[16];
  LOBYTE(v45) = 0;
  sub_38E50();
  uint64_t v23 = *((void *)&v47 + 1);
  *uint64_t v22 = v47;
  *((void *)v22 + 1) = v23;
  id v24 = (char *)a4 + v5[17];
  LOBYTE(v45) = 0;
  sub_38E50();
  uint64_t v25 = *((void *)&v47 + 1);
  *id v24 = v47;
  *((void *)v24 + 1) = v25;
  uint64_t v26 = (char *)a4 + v5[18];
  LOBYTE(v45) = 0;
  sub_38E50();
  uint64_t v27 = *((void *)&v47 + 1);
  *uint64_t v26 = v47;
  *((void *)v26 + 1) = v27;
  uint64_t v28 = (char *)a4 + v5[19];
  LOBYTE(v45) = 0;
  sub_38E50();
  uint64_t v29 = *((void *)&v47 + 1);
  *uint64_t v28 = v47;
  *((void *)v28 + 1) = v29;
  uint64_t v30 = (uint64_t *)((char *)a4 + v5[8]);
  uint64_t v32 = v42;
  uint64_t v31 = v43;
  *uint64_t v30 = v42;
  v30[1] = v31;
  id v33 = objc_allocWithZone((Class)type metadata accessor for CACPhoneticVocabularyRecordingManager(0));
  swift_bridgeObjectRetain();
  id v34 = sub_10954(v32, v31);
  uint64_t v35 = (uint64_t *)((char *)a4 + v5[6]);
  id v45 = v34;
  sub_38E50();
  uint64_t v36 = *((void *)&v47 + 1);
  *uint64_t v35 = v47;
  v35[1] = v36;
  v37 = (uint64_t *)((char *)a4 + v5[5]);
  type metadata accessor for CACPhoneticVocabularyCoordinator();
  sub_2678C(&qword_54378, (void (*)(uint64_t))type metadata accessor for CACPhoneticVocabularyCoordinator);
  uint64_t result = sub_38650();
  uint64_t *v37 = result;
  v37[1] = v39;
  return result;
}

uint64_t sub_13C30@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v42 = a1;
  uint64_t v3 = type metadata accessor for CACPhoneticVocabularyRecordingView(0);
  uint64_t v4 = v3 - 8;
  uint64_t v41 = *(void *)(v3 - 8);
  uint64_t v40 = *(void *)(v41 + 64);
  __chkstk_darwin(v3);
  uint64_t v39 = (uint64_t)v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_383C0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_22BC4(&qword_53FA8);
  __chkstk_darwin(v10 - 8);
  uint64_t v35 = sub_22BC4(&qword_53FB0);
  uint64_t v36 = *(void *)(v35 - 8);
  __chkstk_darwin(v35);
  id v33 = (char *)v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = sub_22BC4(&qword_53FB8);
  uint64_t v37 = *(void *)(v38 - 8);
  __chkstk_darwin(v38);
  id v34 = (char *)v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32[1] = sub_14358();
  v32[0] = v13;
  sub_22BC4(&qword_53FC0);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_3D810;
  sub_38390();
  sub_383B0();
  sub_383A0();
  uint64_t v49 = v14;
  sub_2678C((unint64_t *)&qword_53FC8, (void (*)(uint64_t))&type metadata accessor for OnboardingTraits);
  sub_22BC4(&qword_53FD0);
  sub_26748(&qword_53FD8, &qword_53FD0);
  sub_391F0();
  sub_38EE0();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  uint64_t v46 = v2;
  uint64_t v45 = v2;
  sub_22BC4(&qword_53FE0);
  sub_22BC4(&qword_53FE8);
  sub_26748(&qword_53FF0, &qword_53FE0);
  sub_26748(&qword_53FF8, &qword_53FE8);
  uint64_t v15 = v33;
  sub_38380();
  sub_1987C();
  uint64_t v50 = v16;
  uint64_t v51 = v17;
  uint64_t v18 = v2 + *(int *)(v4 + 76);
  char v19 = *(unsigned char *)v18;
  uint64_t v20 = *(void *)(v18 + 8);
  char v47 = v19;
  uint64_t v48 = v20;
  sub_22BC4(&qword_54000);
  sub_38E80();
  uint64_t v44 = v2;
  uint64_t v43 = v2;
  sub_22BC4(&qword_54008);
  sub_26748(&qword_54010, &qword_53FB0);
  sub_2447C();
  sub_26748(&qword_54020, &qword_54008);
  uint64_t v21 = v35;
  uint64_t v22 = v34;
  sub_38D20();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v36 + 8))(v15, v21);
  uint64_t v23 = v2;
  uint64_t v24 = v39;
  sub_244D0(v23, v39);
  unint64_t v25 = (*(unsigned __int8 *)(v41 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v41 + 80);
  uint64_t v26 = swift_allocObject();
  sub_24538(v24, v26 + v25);
  uint64_t v27 = v37;
  uint64_t v28 = v42;
  uint64_t v29 = v38;
  (*(void (**)(uint64_t, char *, uint64_t))(v37 + 16))(v42, v22, v38);
  uint64_t v30 = (uint64_t (**)())(v28 + *(int *)(sub_22BC4(&qword_54028) + 36));
  *uint64_t v30 = sub_2459C;
  v30[1] = (uint64_t (*)())v26;
  v30[2] = 0;
  v30[3] = 0;
  return (*(uint64_t (**)(char *, uint64_t))(v27 + 8))(v22, v29);
}

uint64_t sub_14358()
{
  uint64_t v1 = v0;
  id v2 = [self sharedPreferences];
  if (!v2)
  {
    __break(1u);
LABEL_15:
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v3 = v2;
  unsigned int v4 = [v2 phoneticVocabularySkipPickingPronunciation];

  if (v4)
  {
    uint64_t v5 = (void *)sub_38FC0();
    uint64_t v6 = (void *)sub_38FC0();
    id v7 = settingsLocString(v5, v6);

    if (v7)
    {
      sub_38FE0();

      sub_39070();
      sub_22BC4(&qword_54310);
      uint64_t v8 = swift_allocObject();
      *(_OWORD *)(v8 + 16) = xmmword_3D820;
      uint64_t v9 = (uint64_t *)(*(void *)(v1
                                 + *(int *)(type metadata accessor for CACPhoneticVocabularyRecordingView(0) + 20)
                                 + 8)
                     + OBJC_IVAR____TtC20VoiceControlSettings32CACPhoneticVocabularyCoordinator_customWord);
      uint64_t v11 = *v9;
      uint64_t v10 = v9[1];
      *(void *)(v8 + 56) = &type metadata for String;
      *(void *)(v8 + 64) = sub_26558();
      *(void *)(v8 + 32) = v11;
      *(void *)(v8 + 40) = v10;
      swift_bridgeObjectRetain();
      uint64_t v12 = sub_38FF0();
LABEL_12:
      swift_bridgeObjectRelease();
      return v12;
    }
    goto LABEL_15;
  }
  uint64_t v13 = type metadata accessor for CACPhoneticVocabularyRecordingView(0);
  sub_22BC4(&qword_54058);
  sub_38E60();
  switch(v26)
  {
    case 5:
      swift_bridgeObjectRelease();
      goto LABEL_8;
    default:
      char v14 = sub_39280();
      swift_bridgeObjectRelease();
      if ((v14 & 1) == 0)
      {
        uint64_t v18 = (void *)sub_38FC0();
        char v19 = (void *)sub_38FC0();
        id v20 = settingsLocString(v18, v19);

        if (v20)
        {
          sub_38FE0();

          sub_39070();
          sub_22BC4(&qword_54310);
          uint64_t v21 = swift_allocObject();
          *(_OWORD *)(v21 + 16) = xmmword_3D820;
          uint64_t v22 = (uint64_t *)(*(void *)(v1 + *(int *)(v13 + 20) + 8)
                          + OBJC_IVAR____TtC20VoiceControlSettings32CACPhoneticVocabularyCoordinator_customWord);
          uint64_t v24 = *v22;
          uint64_t v23 = v22[1];
          *(void *)(v21 + 56) = &type metadata for String;
          *(void *)(v21 + 64) = sub_26558();
          *(void *)(v21 + 32) = v24;
          *(void *)(v21 + 40) = v23;
          swift_bridgeObjectRetain();
          uint64_t v12 = sub_38FF0();
          goto LABEL_12;
        }
LABEL_17:
        __break(1u);
        JUMPOUT(0x14818);
      }
LABEL_8:
      uint64_t v15 = (void *)sub_38FC0();
      uint64_t v16 = (void *)sub_38FC0();
      id v17 = settingsLocString(v15, v16);

      if (!v17) {
        goto LABEL_16;
      }
      sub_38FE0();

      return sub_39070();
  }
}

uint64_t sub_14834@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_22BC4(&qword_541A0);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  uint64_t v121 = (uint64_t)&v105 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v131 = (uint64_t *)((char *)&v105 - v7);
  uint64_t v8 = type metadata accessor for CACPhoneticVocabularyRecordingView(0);
  uint64_t v107 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v108 = v9;
  uint64_t v110 = (uint64_t)&v105 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_22BC4(&qword_54008);
  uint64_t v113 = *(void *)(v10 - 8);
  uint64_t v11 = __chkstk_darwin(v10);
  v109 = (char *)&v105 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v106 = (char *)&v105 - v13;
  uint64_t v14 = sub_22BC4(&qword_541A8);
  uint64_t v15 = __chkstk_darwin(v14 - 8);
  id v17 = (char *)&v105 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  v118 = (char *)&v105 - v18;
  uint64_t v19 = sub_22BC4(&qword_541B0);
  __chkstk_darwin(v19 - 8);
  v117 = (uint64_t *)((char *)&v105 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v116 = sub_22BC4(&qword_541B8);
  uint64_t v21 = __chkstk_darwin(v116);
  uint64_t v111 = (uint64_t)&v105 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = __chkstk_darwin(v21);
  uint64_t v115 = (uint64_t)&v105 - v24;
  __chkstk_darwin(v23);
  uint64_t v119 = (uint64_t)&v105 - v25;
  uint64_t v26 = sub_22BC4(&qword_541C0);
  uint64_t v27 = __chkstk_darwin(v26 - 8);
  uint64_t v29 = (char *)&v105 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v27);
  uint64_t v129 = a1;
  uint64_t v130 = (uint64_t)&v105 - v30;
  uint64_t v31 = a1 + *(int *)(v8 + 36);
  char v32 = *(unsigned char *)v31;
  uint64_t v33 = *(void *)(v31 + 8);
  LOBYTE(v133) = *(unsigned char *)v31;
  uint64_t v134 = v33;
  sub_22BC4(&qword_54058);
  sub_38E60();
  uint64_t v112 = v10;
  v114 = v17;
  switch(v135)
  {
    case 5:
      swift_bridgeObjectRelease();
      goto LABEL_4;
    default:
      char v34 = sub_39280();
      swift_bridgeObjectRelease();
      if ((v34 & 1) == 0) {
        goto LABEL_6;
      }
LABEL_4:
      id v35 = [self sharedPreferences];
      if (!v35) {
        goto LABEL_26;
      }
      uint64_t v36 = v35;
      unsigned int v37 = [v35 phoneticVocabularySkipPickingPronunciation];

      if (v37)
      {
LABEL_6:
        sub_15684();
        uint64_t v133 = v38;
        uint64_t v134 = v39;
        sub_2447C();
        uint64_t v40 = sub_38BE0();
        uint64_t v127 = v41;
        uint64_t v132 = v42;
        uint64_t v124 = v40;
        uint64_t v125 = v43 & 1;
        uint64_t KeyPath = swift_getKeyPath();
        LOBYTE(v126) = sub_38AE0();
        uint64_t v126 = v126;
        uint64_t v123 = 1;
        int v122 = 1;
      }
      else
      {
        uint64_t v124 = 0;
        uint64_t v125 = 0;
        uint64_t v126 = 0;
        uint64_t v127 = 0;
        uint64_t v132 = 0;
        uint64_t KeyPath = 0;
        uint64_t v123 = 0;
        int v122 = 0;
      }
      break;
  }
  LOBYTE(v133) = v32;
  uint64_t v134 = v33;
  sub_38E60();
  p_ivar_base_size = &AXInstructionalCellContentViewBridge__metaData.ivar_base_size;
  uint64_t v128 = KeyPath;
  switch(v135)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 6:
      char v46 = sub_39280();
      swift_bridgeObjectRelease();
      if (v46) {
        goto LABEL_11;
      }
      goto LABEL_13;
    case 5:
      swift_bridgeObjectRelease();
LABEL_11:
      char v47 = self;
      id v48 = [v47 sharedPreferences];
      if (!v48) {
        goto LABEL_27;
      }
      uint64_t v49 = v48;
      unsigned __int8 v50 = [v48 phoneticVocabularySkipPickingPronunciation];

      if (v50)
      {
LABEL_13:
        uint64_t v51 = sub_22BC4(&qword_541C8);
        uint64_t v52 = v130;
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v51 - 8) + 56))(v130, 1, 1, v51);
        v53 = v131;
        uint64_t v54 = v132;
        uint64_t v55 = KeyPath;
      }
      else
      {
        v56 = v117;
        uint64_t v57 = v129;
        sub_1589C(v117);
        uint64_t v58 = v57 + *(int *)(v8 + 76);
        char v59 = *(unsigned char *)v58;
        uint64_t v60 = *(void *)(v58 + 8);
        LOBYTE(v133) = v59;
        uint64_t v134 = v60;
        sub_22BC4(&qword_54000);
        sub_38E60();
        LOBYTE(v57) = sub_38AE0();
        sub_38520();
        uint64_t v62 = v61;
        uint64_t v64 = v63;
        uint64_t v66 = v65;
        uint64_t v68 = v67;
        uint64_t v69 = v115;
        sub_26660((uint64_t)v56, v115, &qword_541B0);
        uint64_t v70 = v69 + *(int *)(v116 + 36);
        *(unsigned char *)uint64_t v70 = v57;
        *(void *)(v70 + 8) = v62;
        *(void *)(v70 + 16) = v64;
        *(void *)(v70 + 24) = v66;
        *(void *)(v70 + 32) = v68;
        *(unsigned char *)(v70 + 40) = 0;
        sub_265A0((uint64_t)v56, &qword_541B0);
        uint64_t v71 = v119;
        sub_265FC(v69, v119, &qword_541B8);
        id v72 = [v47 sharedPreferences];
        if (!v72)
        {
LABEL_28:
          sub_25DE0(v124, v127, v125, v132);
          __break(1u);
          goto LABEL_29;
        }
        v73 = v72;
        unsigned __int8 v74 = [v72 phoneticVocabularyShowUserFacingIPAToggle];

        uint64_t v75 = (uint64_t)v118;
        if (v74)
        {
          id v76 = [v47 sharedPreferences];
          uint64_t v77 = (uint64_t)v114;
          uint64_t v78 = v113;
          if (!v76)
          {
LABEL_29:
            sub_25DE0(v124, v127, v125, v132);
            __break(1u);
            JUMPOUT(0x1564CLL);
          }
          v79 = v76;
          [v76 phoneticVocabularyShowUserFacingIPA];

          v117 = (uint64_t *)sub_388D0();
          uint64_t v80 = v110;
          sub_244D0(v129, v110);
          unint64_t v81 = (*(unsigned __int8 *)(v107 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v107 + 80);
          uint64_t v82 = swift_allocObject();
          sub_24538(v80, v82 + v81);
          v83 = v109;
          sub_38EB0();
          v84 = *(void (**)(char *, char *, uint64_t))(v78 + 32);
          v85 = v106;
          v86 = v83;
          uint64_t v87 = v112;
          v84(v106, v86, v112);
          uint64_t v75 = (uint64_t)v118;
          v84(v118, v85, v87);
          uint64_t v88 = 0;
          p_ivar_base_size = (_DWORD *)(&AXInstructionalCellContentViewBridge__metaData + 8);
          uint64_t v71 = v119;
        }
        else
        {
          uint64_t v88 = 1;
          uint64_t v77 = (uint64_t)v114;
          uint64_t v87 = v112;
          uint64_t v78 = v113;
        }
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v78 + 56))(v75, v88, 1, v87);
        uint64_t v89 = v111;
        sub_26660(v71, v111, &qword_541B8);
        sub_26660(v75, v77, &qword_541A8);
        sub_26660(v89, (uint64_t)v29, &qword_541B8);
        uint64_t v90 = sub_22BC4(&qword_541E0);
        sub_26660(v77, (uint64_t)&v29[*(int *)(v90 + 48)], &qword_541A8);
        sub_265A0(v75, &qword_541A8);
        sub_265A0(v71, &qword_541B8);
        sub_265A0(v77, &qword_541A8);
        sub_265A0(v89, &qword_541B8);
        uint64_t v91 = sub_22BC4(&qword_541C8);
        (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v91 - 8) + 56))(v29, 0, 1, v91);
        uint64_t v52 = v130;
        sub_265FC((uint64_t)v29, v130, &qword_541C0);
        v53 = v131;
        uint64_t v54 = v132;
        uint64_t v55 = v128;
      }
      id v92 = objc_msgSend(self, *((SEL *)p_ivar_base_size + 353));
      if (!v92)
      {
        sub_25DE0(v124, v127, v125, v54);
        __break(1u);
LABEL_26:
        __break(1u);
LABEL_27:
        sub_25DE0(v124, v127, v125, v132);
        __break(1u);
        goto LABEL_28;
      }
      v93 = v92;
      unsigned __int8 v94 = [v92 phoneticVocabularyShowDebugUI];

      if (v94)
      {
        sub_163A4(v53);
        uint64_t v95 = sub_22BC4(&qword_541D0);
        (*(void (**)(void *, void, uint64_t, uint64_t))(*(void *)(v95 - 8) + 56))(v53, 0, 1, v95);
      }
      else
      {
        uint64_t v96 = sub_22BC4(&qword_541D0);
        (*(void (**)(void *, uint64_t, uint64_t, uint64_t))(*(void *)(v96 - 8) + 56))(v53, 1, 1, v96);
      }
      sub_26660(v52, (uint64_t)v29, &qword_541C0);
      uint64_t v97 = v121;
      sub_26660((uint64_t)v53, v121, &qword_541A0);
      uint64_t v98 = v124;
      uint64_t v99 = v125;
      v120 = v29;
      uint64_t v100 = v127;
      *(void *)a2 = v124;
      *(void *)(a2 + 8) = v100;
      *(void *)(a2 + 16) = v99;
      *(void *)(a2 + 24) = v54;
      uint64_t v101 = v123;
      *(void *)(a2 + 32) = v55;
      *(void *)(a2 + 40) = v101;
      uint64_t v132 = v54;
      *(void *)(a2 + 48) = v126;
      *(_OWORD *)(a2 + 56) = 0u;
      *(_OWORD *)(a2 + 72) = 0u;
      *(unsigned char *)(a2 + 88) = v122;
      uint64_t v102 = sub_22BC4(&qword_541D8);
      sub_26660((uint64_t)v29, a2 + *(int *)(v102 + 48), &qword_541C0);
      sub_26660(v97, a2 + *(int *)(v102 + 64), &qword_541A0);
      uint64_t v103 = v132;
      sub_25E30(v98, v100, v99, v132);
      sub_265A0((uint64_t)v131, &qword_541A0);
      sub_265A0(v130, &qword_541C0);
      sub_265A0(v97, &qword_541A0);
      sub_265A0((uint64_t)v120, &qword_541C0);
      return sub_25DE0(v98, v100, v99, v103);
    default:
      JUMPOUT(0);
  }
}

void sub_15684()
{
  id v1 = [self currentDevice];
  id v2 = (char *)[v1 userInterfaceIdiom];

  if (v2 == (unsigned char *)&def_14E30 + 1)
  {
    uint64_t v3 = (void *)sub_38FC0();
    uint64_t v4 = (void *)sub_38FC0();
    id v5 = settingsLocString(v3, v4);

    if (v5)
    {
LABEL_5:
      sub_38FE0();

      sub_39070();
      sub_22BC4(&qword_54310);
      uint64_t v8 = swift_allocObject();
      *(_OWORD *)(v8 + 16) = xmmword_3D820;
      uint64_t v9 = (uint64_t *)(*(void *)(v0
                                 + *(int *)(type metadata accessor for CACPhoneticVocabularyRecordingView(0) + 20)
                                 + 8)
                     + OBJC_IVAR____TtC20VoiceControlSettings32CACPhoneticVocabularyCoordinator_customWord);
      uint64_t v11 = *v9;
      uint64_t v10 = v9[1];
      *(void *)(v8 + 56) = &type metadata for String;
      *(void *)(v8 + 64) = sub_26558();
      *(void *)(v8 + 32) = v11;
      *(void *)(v8 + 40) = v10;
      swift_bridgeObjectRetain();
      sub_38FF0();
      swift_bridgeObjectRelease();
      return;
    }
    __break(1u);
  }
  uint64_t v6 = (void *)sub_38FC0();
  uint64_t v7 = (void *)sub_38FC0();
  id v5 = settingsLocString(v6, v7);

  if (v5) {
    goto LABEL_5;
  }
  __break(1u);
}

void sub_1589C(uint64_t *a1@<X8>)
{
  unint64_t v81 = a1;
  uint64_t v2 = type metadata accessor for CACPhoneticVocabularyRecordingView(0);
  uint64_t v67 = *(void *)(v2 - 8);
  uint64_t v3 = *(void *)(v67 + 64);
  __chkstk_darwin(v2);
  uint64_t v75 = (uint64_t)&v55 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v72 = sub_22BC4(&qword_541E8);
  uint64_t v70 = *(void *)(v72 - 8);
  __chkstk_darwin(v72);
  uint64_t v68 = (char *)&v55 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v73 = sub_22BC4(&qword_541F0);
  uint64_t v71 = *(void *)(v73 - 8);
  __chkstk_darwin(v73);
  uint64_t v69 = (char *)&v55 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_22BC4(&qword_541F8);
  uint64_t v76 = *(void *)(v6 - 8);
  uint64_t v77 = v6;
  __chkstk_darwin(v6);
  unsigned __int8 v74 = (char *)&v55 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_22BC4(&qword_54200);
  uint64_t v79 = *(void *)(v8 - 8);
  uint64_t v80 = v8;
  uint64_t v9 = __chkstk_darwin(v8);
  uint64_t v78 = (char *)&v55 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v83 = (char *)&v55 - v11;
  uint64_t v12 = (void *)sub_38FC0();
  uint64_t v13 = (void *)sub_38FC0();
  id v14 = settingsLocString(v12, v13);

  if (v14)
  {
    uint64_t v15 = sub_38FE0();
    uint64_t v17 = v16;

    *(void *)&long long v86 = v15;
    *((void *)&v86 + 1) = v17;
    *(void *)&long long v86 = sub_39070();
    *((void *)&v86 + 1) = v18;
    sub_2447C();
    uint64_t v66 = sub_38BE0();
    uint64_t v64 = v19;
    uint64_t v65 = v20;
    int v63 = v21 & 1;
    uint64_t KeyPath = swift_getKeyPath();
    int v62 = sub_38AE0();
    uint64_t v58 = v1;
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_38460();
    swift_release();
    swift_release();
    swift_release();
    uint64_t v22 = *(void *)(v86 + 16);
    swift_bridgeObjectRelease();
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_38460();
    swift_release();
    swift_release();
    swift_release();
    int64_t v23 = sub_22170(0, v22, v86);
    swift_bridgeObjectRelease();
    uint64_t v56 = swift_getKeyPath();
    uint64_t v24 = v1 + *(int *)(v2 + 44);
    uint64_t v25 = *(void *)(v24 + 16);
    long long v84 = *(_OWORD *)v24;
    uint64_t v85 = v25;
    uint64_t v61 = sub_22BC4(&qword_54068);
    sub_38E80();
    long long v26 = v86;
    uint64_t v28 = v87;
    uint64_t v27 = v88;
    uint64_t v29 = v75;
    sub_244D0(v1, v75);
    uint64_t v30 = *(unsigned __int8 *)(v67 + 80);
    uint64_t v60 = ((v30 + 16) & ~v30) + v3;
    uint64_t v31 = (v30 + 16) & ~v30;
    uint64_t v67 = v31;
    uint64_t v59 = v30 | 7;
    uint64_t v32 = swift_allocObject();
    sub_24538(v29, v32 + v31);
    uint64_t v33 = swift_allocObject();
    uint64_t v57 = &v55;
    *(void *)(v33 + 16) = sub_25EA0;
    *(void *)(v33 + 24) = v32;
    *(void *)&long long v84 = v23;
    long long v86 = v26;
    uint64_t v87 = v28;
    uint64_t v88 = v27;
    __chkstk_darwin(v33);
    *(&v55 - 4) = (uint64_t)&v84;
    *(&v55 - 3) = v56;
    *(&v55 - 2) = (uint64_t)sub_25F38;
    *(&v55 - 1) = v33;
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    sub_22BC4(&qword_54208);
    sub_25F78();
    char v34 = v68;
    sub_38B80();
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v35 = sub_26748(&qword_54260, &qword_541E8);
    uint64_t v36 = v69;
    uint64_t v37 = v72;
    sub_38CE0();
    (*(void (**)(char *, uint64_t))(v70 + 8))(v34, v37);
    *(void *)&long long v86 = v37;
    *((void *)&v86 + 1) = v35;
    uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    uint64_t v39 = v73;
    uint64_t v40 = v74;
    sub_38CA0();
    (*(void (**)(char *, uint64_t))(v71 + 8))(v36, v39);
    uint64_t v41 = *(void *)(v24 + 16);
    long long v86 = *(_OWORD *)v24;
    uint64_t v87 = v41;
    sub_38E60();
    long long v86 = v84;
    sub_244D0(v58, v29);
    uint64_t v42 = swift_allocObject();
    sub_24538(v29, v42 + v67);
    sub_22BC4(&qword_54268);
    *(void *)&long long v84 = v39;
    *((void *)&v84 + 1) = OpaqueTypeConformance2;
    swift_getOpaqueTypeConformance2();
    sub_261AC();
    uint64_t v43 = v77;
    uint64_t v44 = v78;
    sub_38D60();
    swift_release();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v76 + 8))(v40, v43);
    uint64_t v46 = v79;
    uint64_t v45 = v80;
    char v47 = v83;
    (*(void (**)(char *, char *, uint64_t))(v79 + 32))(v83, v44, v80);
    id v48 = *(void (**)(char *, char *, uint64_t))(v46 + 16);
    v48(v44, v47, v45);
    uint64_t v49 = v81;
    uint64_t v50 = v66;
    uint64_t v51 = v64;
    *unint64_t v81 = v66;
    v49[1] = v51;
    LOBYTE(v47) = v63;
    *((unsigned char *)v49 + 16) = v63;
    uint64_t v52 = KeyPath;
    v49[3] = v65;
    v49[4] = v52;
    *((unsigned char *)v49 + 40) = 1;
    *((unsigned char *)v49 + 48) = v62;
    *(_OWORD *)(v49 + 7) = 0u;
    *(_OWORD *)(v49 + 9) = 0u;
    *((unsigned char *)v49 + 88) = 1;
    uint64_t v53 = sub_22BC4(&qword_54278);
    v48((char *)v49 + *(int *)(v53 + 48), v44, v45);
    sub_24ECC(v50, v51, (char)v47);
    uint64_t v54 = *(void (**)(char *, uint64_t))(v46 + 8);
    swift_bridgeObjectRetain();
    swift_retain();
    v54(v83, v45);
    v54(v44, v45);
    sub_250E4(v50, v51, (char)v47);
    swift_release();
    swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
}

id sub_16284()
{
  uint64_t v0 = self;
  id result = [v0 sharedPreferences];
  if (result)
  {
    uint64_t v2 = result;
    id result = [v0 sharedPreferences];
    if (result)
    {
      uint64_t v3 = result;
      unsigned int v4 = [result phoneticVocabularyShowUserFacingIPA];

      [v2 setPhoneticVocabularyShowUserFacingIPA:v4 ^ 1];
      type metadata accessor for CACPhoneticVocabularyRecordingView(0);
      swift_retain();
      sub_22BC4(&qword_54000);
      sub_38E60();
      sub_38E70();
      return (id)swift_release();
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_163A4@<X0>(void *a1@<X8>)
{
  uint64_t v76 = a1;
  uint64_t v96 = sub_22BC4(&qword_54008);
  uint64_t v90 = *(void *)(v96 - 8);
  uint64_t v2 = __chkstk_darwin(v96);
  unsigned __int8 v94 = (char *)&v70 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  uint64_t v88 = (char *)&v70 - v4;
  uint64_t v5 = sub_388C0();
  __chkstk_darwin(v5 - 8);
  uint64_t v95 = sub_22BC4(&qword_54330);
  uint64_t v87 = *(void *)(v95 - 8);
  uint64_t v6 = __chkstk_darwin(v95);
  uint64_t v89 = (char *)&v70 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v70 - v8;
  unint64_t v101 = 0;
  unint64_t v102 = 0xE000000000000000;
  sub_39210(22);
  swift_bridgeObjectRelease();
  unint64_t v101 = 0xD000000000000014;
  unint64_t v102 = 0x8000000000043A90;
  uint64_t v10 = type metadata accessor for CACPhoneticVocabularyRecordingView(0);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_38460();
  swift_release();
  swift_release();
  swift_release();
  v103._countAndFlagsBits = sub_390B0();
  sub_39040(v103);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  unint64_t v92 = sub_2447C();
  uint64_t v85 = sub_38BE0();
  uint64_t v84 = v11;
  LODWORD(v91) = v12;
  uint64_t v93 = v13;
  sub_388D0();
  id v14 = (long long *)(v1 + *(int *)(v10 + 48));
  long long v15 = *v14;
  uint64_t v16 = *((void *)v14 + 2);
  long long v99 = v15;
  uint64_t v100 = v16;
  sub_22BC4(&qword_54158);
  sub_38E80();
  long long v86 = v9;
  sub_38F60();
  sub_388B0();
  v104._countAndFlagsBits = 0xD000000000000018;
  v104._object = (void *)0x8000000000043AD0;
  sub_388A0(v104);
  uint64_t v17 = (char *)(v1 + *(int *)(v10 + 36));
  char v18 = *v17;
  unint64_t v19 = *((void *)v17 + 1);
  LOBYTE(v101) = v18;
  unint64_t v102 = v19;
  sub_22BC4(&qword_54058);
  sub_38E60();
  v20._countAndFlagsBits = 0xD000000000000010;
  char v21 = (void *)0x80000000000432D0;
  switch((char)v99)
  {
    case 1:
      break;
    case 2:
      char v21 = (void *)0x80000000000432F0;
      v20._countAndFlagsBits = 0xD000000000000014;
      break;
    case 3:
      char v21 = (void *)0xE900000000000067;
      v20._countAndFlagsBits = 0x6E6964726F636572;
      break;
    case 4:
      char v21 = (void *)0xED0000676E696472;
      v20._countAndFlagsBits = 0x6F636552656E6F64;
      break;
    case 5:
      char v21 = (void *)0xE800000000000000;
      v20._countAndFlagsBits = 0x64656873696E6966;
      break;
    case 6:
      char v21 = (void *)0xE700000000000000;
      v20._countAndFlagsBits = 0x6465726F727265;
      break;
    default:
      char v21 = (void *)0xE400000000000000;
      v20._countAndFlagsBits = 1701602409;
      break;
  }
  v20._object = v21;
  sub_38890(v20);
  swift_bridgeObjectRelease();
  v105._countAndFlagsBits = 0;
  v105._object = (void *)0xE000000000000000;
  sub_388A0(v105);
  sub_388E0();
  uint64_t v82 = sub_38BD0();
  uint64_t v81 = v22;
  int v77 = v23;
  uint64_t v83 = v24;
  unint64_t v101 = 0;
  unint64_t v102 = 0xE000000000000000;
  sub_39210(30);
  swift_bridgeObjectRelease();
  unint64_t v101 = 0xD00000000000001CLL;
  unint64_t v102 = 0x8000000000043AF0;
  uint64_t v25 = self;
  id v26 = [v25 sharedPreferences];
  unsigned int v27 = [v26 dictationIsEnabled];

  if (v27) {
    v28._countAndFlagsBits = 1702195828;
  }
  else {
    v28._countAndFlagsBits = 0x65736C6166;
  }
  uint64_t v29 = (void *)0xE400000000000000;
  if (v27) {
    uint64_t v30 = (void *)0xE400000000000000;
  }
  else {
    uint64_t v30 = (void *)0xE500000000000000;
  }
  v28._object = v30;
  sub_39040(v28);
  swift_bridgeObjectRelease();
  uint64_t v78 = sub_38BE0();
  uint64_t v80 = v31;
  char v33 = v32;
  uint64_t v79 = v34;
  unint64_t v101 = 0;
  unint64_t v102 = 0xE000000000000000;
  sub_39210(33);
  swift_bridgeObjectRelease();
  unint64_t v101 = 0xD00000000000001FLL;
  unint64_t v102 = 0x8000000000043B10;
  id v35 = [v25 sharedPreferences];
  unsigned int v36 = [v35 suppressDictationOptIn];

  if (v36) {
    v37._countAndFlagsBits = 1702195828;
  }
  else {
    v37._countAndFlagsBits = 0x65736C6166;
  }
  int v38 = v33 & 1;
  int v39 = v77 & 1;
  int v40 = v91 & 1;
  if (!v36) {
    uint64_t v29 = (void *)0xE500000000000000;
  }
  v37._object = v29;
  sub_39040(v37);
  swift_bridgeObjectRelease();
  uint64_t v75 = sub_38BE0();
  uint64_t v91 = v41;
  unint64_t v92 = v42;
  char v44 = v43 & 1;
  int v77 = v43 & 1;
  sub_388D0();
  uint64_t v45 = v88;
  sub_38EB0();
  char v46 = v40;
  int v74 = v40;
  LOBYTE(v101) = v40;
  char v47 = *(void (**)(char *, char *, uint64_t))(v87 + 16);
  id v48 = v89;
  uint64_t v49 = v95;
  v47(v89, v86, v95);
  int v71 = v39;
  LOBYTE(v99) = v39;
  char v98 = v38;
  int v72 = v38;
  char v97 = v44;
  uint64_t v73 = *(void (**)(char *, char *, uint64_t))(v90 + 16);
  v73(v94, v45, v96);
  uint64_t v50 = v76;
  uint64_t v51 = v84;
  *uint64_t v76 = v85;
  v50[1] = v51;
  *((unsigned char *)v50 + 16) = v46;
  v50[3] = v93;
  uint64_t v52 = (int *)sub_22BC4(&qword_54338);
  v47((char *)v50 + v52[12], v48, v49);
  uint64_t v53 = (char *)v50 + v52[16];
  uint64_t v54 = v82;
  uint64_t v55 = v81;
  *(void *)uint64_t v53 = v82;
  *((void *)v53 + 1) = v55;
  v53[16] = v39;
  *((void *)v53 + 3) = v83;
  uint64_t v56 = (char *)v50 + v52[20];
  uint64_t v57 = v78;
  uint64_t v58 = v80;
  *(void *)uint64_t v56 = v78;
  *((void *)v56 + 1) = v58;
  v56[16] = v38;
  *((void *)v56 + 3) = v79;
  uint64_t v59 = (char *)v50 + v52[24];
  uint64_t v60 = v75;
  uint64_t v61 = v91;
  *(void *)uint64_t v59 = v75;
  *((void *)v59 + 1) = v61;
  v59[16] = v77;
  *((void *)v59 + 3) = v92;
  v73((char *)v50 + v52[28], v94, v96);
  uint64_t v62 = v85;
  uint64_t v63 = v84;
  char v64 = v74;
  sub_24ECC(v85, v84, v74);
  swift_bridgeObjectRetain();
  sub_24ECC(v54, v55, v71);
  swift_bridgeObjectRetain();
  sub_24ECC(v57, v58, v72);
  swift_bridgeObjectRetain();
  uint64_t v65 = v60;
  sub_24ECC(v60, v91, v77);
  swift_bridgeObjectRetain();
  LOBYTE(v55) = v64;
  sub_24ECC(v62, v63, v64);
  uint64_t v66 = *(void (**)(char *, uint64_t))(v90 + 8);
  swift_bridgeObjectRetain();
  uint64_t v67 = v96;
  v66(v88, v96);
  uint64_t v68 = *(void (**)(char *, uint64_t))(v87 + 8);
  v68(v86, v95);
  sub_250E4(v62, v63, v55);
  swift_bridgeObjectRelease();
  v66(v94, v67);
  sub_250E4(v65, v91, v97);
  swift_bridgeObjectRelease();
  sub_250E4(v78, v80, v98);
  swift_bridgeObjectRelease();
  sub_250E4(v82, v81, v99);
  swift_bridgeObjectRelease();
  v68(v89, v95);
  sub_250E4(v62, v63, v101);
  return swift_bridgeObjectRelease();
}

void sub_16E00(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v63 = a1;
  uint64_t v66 = a2;
  uint64_t v2 = sub_22BC4(&qword_54088);
  __chkstk_darwin(v2 - 8);
  char v64 = (uint64_t *)&v60[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v62 = sub_22BC4(&qword_54090);
  uint64_t v4 = __chkstk_darwin(v62);
  uint64_t v6 = &v60[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v4);
  uint64_t v65 = &v60[-v7];
  uint64_t v8 = type metadata accessor for CACPhoneticVocabularyRecordingView(0);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  __chkstk_darwin(v8);
  uint64_t v11 = &v60[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  int v12 = self;
  id v13 = [v12 sharedPreferences];
  unsigned __int8 v14 = [v13 dictationIsEnabled];

  if ((v14 & 1) != 0
    || (id v15 = [v12 sharedPreferences],
        unsigned int v16 = [v15 suppressDictationOptIn],
        v15,
        !v16))
  {
    uint64_t v36 = v63;
    sub_244D0(v63, (uint64_t)&v60[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)]);
    unint64_t v37 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
    uint64_t v38 = swift_allocObject();
    sub_24538((uint64_t)v11, v38 + v37);
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v40 = v36 + *(int *)(v8 + 36);
    char v41 = *(unsigned char *)v40;
    uint64_t v42 = *(void *)(v40 + 8);
    LOBYTE(v105[0]) = v41;
    v105[1] = v42;
    sub_22BC4(&qword_54058);
    sub_38E60();
    int v61 = LOBYTE(v104[0]);
    uint64_t v43 = sub_38F40();
    uint64_t v45 = v44;
    sub_17690(v82, v36);
    long long v78 = v82[10];
    long long v79 = v82[11];
    uint64_t v80 = v83;
    long long v74 = v82[6];
    long long v75 = v82[7];
    long long v76 = v82[8];
    long long v77 = v82[9];
    long long v70 = v82[2];
    long long v71 = v82[3];
    long long v72 = v82[4];
    long long v73 = v82[5];
    long long v68 = v82[0];
    long long v69 = v82[1];
    LOBYTE(v37) = sub_38AE0();
    char v84 = 1;
    *(void *)uint64_t v85 = v43;
    *(void *)&v85[8] = v45;
    *(_OWORD *)&v85[176] = v78;
    *(_OWORD *)&v85[192] = v79;
    *(void *)&v85[208] = v80;
    *(_OWORD *)&v85[112] = v74;
    *(_OWORD *)&v85[128] = v75;
    *(_OWORD *)&v85[144] = v76;
    *(_OWORD *)&v85[160] = v77;
    *(_OWORD *)&v85[48] = v70;
    *(_OWORD *)&v85[64] = v71;
    *(_OWORD *)&v85[80] = v72;
    *(_OWORD *)&v85[96] = v73;
    *(_OWORD *)&v85[16] = v68;
    *(_OWORD *)&v85[32] = v69;
    v85[216] = v37;
    memset(&v85[224], 0, 32);
    v85[256] = 1;
    memcpy(&v67[7], v85, 0x101uLL);
    v86[0] = v43;
    v86[1] = v45;
    long long v97 = v78;
    long long v98 = v79;
    uint64_t v99 = v80;
    long long v93 = v74;
    long long v94 = v75;
    long long v96 = v77;
    long long v95 = v76;
    long long v89 = v70;
    long long v90 = v71;
    long long v92 = v73;
    long long v91 = v72;
    long long v88 = v69;
    long long v87 = v68;
    char v100 = v37;
    long long v101 = 0u;
    long long v102 = 0u;
    char v103 = 1;
    swift_retain();
    swift_retain();
    sub_24DC8((uint64_t)v85);
    swift_retain();
    swift_retain();
    sub_24EDC((uint64_t)v82);
    sub_24FE0((uint64_t)v86);
    swift_release();
    swift_release();
    v104[0] = sub_24DB0;
    v104[1] = v38;
    v104[2] = KeyPath;
    LOBYTE(v104[3]) = v61;
    memcpy((char *)&v104[3] + 1, v67, 0x108uLL);
    sub_250F4((uint64_t)v104);
    sub_265FC((uint64_t)v104, (uint64_t)v105, &qword_54098);
    sub_22BC4(&qword_540A0);
    sub_22BC4(&qword_540A8);
    sub_25100();
    sub_26748(&qword_540D8, &qword_540A8);
    sub_38980();
    sub_2521C((uint64_t)v82);
    uint64_t v34 = v36;
    swift_release();
    swift_release();
    memcpy(v105, v81, 0x122uLL);
    uint64_t v33 = (uint64_t)v65;
    char v32 = v66;
    id v35 = v64;
    goto LABEL_6;
  }
  uint64_t v17 = (void *)sub_38FC0();
  char v18 = (void *)sub_38FC0();
  id v19 = settingsLocString(v17, v18);

  if (v19)
  {
    uint64_t v20 = sub_38FE0();
    uint64_t v22 = v21;

    v105[0] = v20;
    v105[1] = v22;
    v105[0] = sub_39070();
    v105[1] = v23;
    sub_2447C();
    uint64_t v24 = sub_38BE0();
    uint64_t v26 = v25;
    LOBYTE(v22) = v27;
    uint64_t v29 = v28;
    uint64_t v30 = swift_getKeyPath();
    char v31 = sub_38AE0();
    v104[0] = v24;
    v104[1] = v26;
    LOBYTE(v104[2]) = v22 & 1;
    v104[3] = v29;
    v104[4] = v30;
    LOBYTE(v104[5]) = 1;
    LOBYTE(v104[6]) = v31;
    memset(&v104[7], 0, 32);
    LOBYTE(v104[11]) = 1;
    sub_25698((uint64_t)v104);
    sub_265FC((uint64_t)v104, (uint64_t)v81, &qword_54098);
    sub_22BC4(&qword_540A0);
    sub_22BC4(&qword_540A8);
    sub_25100();
    sub_26748(&qword_540D8, &qword_540A8);
    sub_38980();
    uint64_t v33 = (uint64_t)v65;
    char v32 = v66;
    uint64_t v34 = v63;
    id v35 = v64;
LABEL_6:
    uint64_t v46 = v62;
    *id v35 = sub_38F40();
    v35[1] = v47;
    sub_22BC4(&qword_540E0);
    sub_18608(v34);
    char v48 = sub_38B00();
    sub_38520();
    uint64_t v50 = v49;
    uint64_t v52 = v51;
    uint64_t v54 = v53;
    uint64_t v56 = v55;
    sub_26660((uint64_t)v35, (uint64_t)v6, &qword_54088);
    uint64_t v57 = &v6[*(int *)(v46 + 36)];
    *uint64_t v57 = v48;
    *((void *)v57 + 1) = v50;
    *((void *)v57 + 2) = v52;
    *((void *)v57 + 3) = v54;
    *((void *)v57 + 4) = v56;
    v57[40] = 0;
    sub_265A0((uint64_t)v35, &qword_54088);
    sub_265FC((uint64_t)v6, v33, &qword_54090);
    memcpy(v67, v105, sizeof(v67));
    sub_26660(v33, (uint64_t)v6, &qword_54090);
    memcpy(v81, v67, 0x122uLL);
    memcpy(v32, v67, 0x122uLL);
    uint64_t v58 = sub_22BC4(&qword_540E8);
    sub_26660((uint64_t)v6, (uint64_t)v32 + *(int *)(v58 + 48), &qword_54090);
    sub_25488((uint64_t)v81, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, _WORD))sub_25320);
    sub_265A0(v33, &qword_54090);
    sub_265A0((uint64_t)v6, &qword_54090);
    memcpy(v104, v67, 0x122uLL);
    sub_25488((uint64_t)v104, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, _WORD))sub_25524);
    uint64_t v59 = sub_22BC4(&qword_53FE8);
    (*(void (**)(void *, void, uint64_t, uint64_t))(*(void *)(v59 - 8) + 56))(v32, 0, 1, v59);
    return;
  }
  __break(1u);
}

#error "17FBC: switch analysis failed: failed to propagate the switch expression (funcsize=779)"

#error "19034: switch analysis failed: failed to propagate the switch expression (funcsize=820)"

void sub_19538(uint64_t a1@<X8>)
{
  uint64_t v23 = a1;
  uint64_t v1 = type metadata accessor for CACPhoneticVocabularyRecordingView(0);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(void *)(v2 + 64);
  __chkstk_darwin(v1 - 8);
  uint64_t v22 = sub_22BC4(&qword_54008);
  uint64_t v4 = *(void *)(v22 - 8);
  __chkstk_darwin(v22);
  uint64_t v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_22BC4(&qword_54110);
  uint64_t v7 = *(void *)(v21 - 8);
  __chkstk_darwin(v21);
  uint64_t v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = (void *)sub_38FC0();
  uint64_t v11 = (void *)sub_38FC0();
  id v12 = settingsLocString(v10, v11);

  if (v12)
  {
    uint64_t v13 = sub_38FE0();
    uint64_t v15 = v14;

    uint64_t v24 = v13;
    uint64_t v25 = v15;
    uint64_t v24 = sub_39070();
    uint64_t v25 = v16;
    sub_244D0(v20, (uint64_t)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
    unint64_t v17 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
    uint64_t v18 = swift_allocObject();
    sub_24538((uint64_t)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v18 + v17);
    sub_2447C();
    sub_38EC0();
    sub_26748(&qword_54020, &qword_54008);
    uint64_t v19 = v22;
    sub_38D10();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v19);
    (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(v23, v9, v21);
  }
  else
  {
    __break(1u);
  }
}

void sub_1987C()
{
  type metadata accessor for CACPhoneticVocabularyRecordingView(0);
  sub_22BC4(&qword_54060);
  sub_38E60();
  if (v7)
  {
    if (v7 != 1) {
      goto LABEL_7;
    }
    uint64_t v0 = (void *)sub_38FC0();
    uint64_t v1 = (void *)sub_38FC0();
    id v2 = settingsLocString(v0, v1);

    if (v2)
    {
LABEL_8:
      sub_38FE0();

      sub_39070();
      return;
    }
    __break(1u);
  }
  uint64_t v3 = (void *)sub_38FC0();
  uint64_t v4 = (void *)sub_38FC0();
  id v2 = settingsLocString(v3, v4);

  if (v2) {
    goto LABEL_8;
  }
  __break(1u);
LABEL_7:
  uint64_t v5 = (void *)sub_38FC0();
  uint64_t v6 = (void *)sub_38FC0();
  id v2 = settingsLocString(v5, v6);

  if (v2) {
    goto LABEL_8;
  }
  __break(1u);
}

void sub_19A6C(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_22BC4(&qword_54080);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_22BC4(&qword_54008);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = (void *)sub_38FC0();
  uint64_t v10 = (void *)sub_38FC0();
  id v11 = settingsLocString(v9, v10);

  if (v11)
  {
    uint64_t v12 = sub_38FE0();
    uint64_t v14 = v13;

    uint64_t v17 = v12;
    uint64_t v18 = v14;
    uint64_t v17 = sub_39070();
    uint64_t v18 = v15;
    sub_38500();
    uint64_t v16 = sub_38510();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v4, 0, 1, v16);
    sub_2447C();
    sub_38EA0();
    (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(a1, v8, v5);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_19CB8@<X0>(uint64_t a1@<X8>)
{
  sub_19D14();
  sub_2447C();
  uint64_t result = sub_38BE0();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

void sub_19D14()
{
  type metadata accessor for CACPhoneticVocabularyRecordingView(0);
  sub_22BC4(&qword_54060);
  sub_38E60();
  if (v15)
  {
    if (v15 != 1) {
      goto LABEL_9;
    }
    id v0 = [self currentDevice];
    uint64_t v1 = (char *)[v0 userInterfaceIdiom];

    if (v1 != (unsigned char *)&def_14E30 + 1) {
      goto LABEL_11;
    }
    uint64_t v2 = (void *)sub_38FC0();
    uint64_t v3 = (void *)sub_38FC0();
    id v4 = settingsLocString(v2, v3);

    if (v4)
    {
LABEL_14:
      sub_38FE0();

      sub_39070();
      return;
    }
    __break(1u);
  }
  id v5 = [self currentDevice];
  uint64_t v6 = (char *)[v5 userInterfaceIdiom];

  if (v6 != (unsigned char *)&def_14E30 + 1) {
    goto LABEL_13;
  }
  uint64_t v7 = (void *)sub_38FC0();
  uint64_t v8 = (void *)sub_38FC0();
  id v4 = settingsLocString(v7, v8);

  if (v4) {
    goto LABEL_14;
  }
  __break(1u);
LABEL_9:
  uint64_t v9 = (void *)sub_38FC0();
  uint64_t v10 = (void *)sub_38FC0();
  id v4 = settingsLocString(v9, v10);

  if (v4) {
    goto LABEL_14;
  }
  __break(1u);
LABEL_11:
  id v11 = (void *)sub_38FC0();
  uint64_t v12 = (void *)sub_38FC0();
  id v4 = settingsLocString(v11, v12);

  if (v4) {
    goto LABEL_14;
  }
  __break(1u);
LABEL_13:
  uint64_t v13 = (void *)sub_38FC0();
  uint64_t v14 = (void *)sub_38FC0();
  id v4 = settingsLocString(v13, v14);

  if (v4) {
    goto LABEL_14;
  }
  __break(1u);
}

uint64_t sub_1A04C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for CACPhoneticVocabularyRecordingView(0);
  uint64_t v3 = v2 - 8;
  uint64_t v4 = *(void *)(v2 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  swift_getKeyPath();
  char v32 = _swiftEmptyArrayStorage;
  swift_retain();
  sub_38470();
  uint64_t v7 = a1 + *(int *)(v3 + 32);
  uint64_t v8 = *(void *)(v7 + 8);
  char v32 = *(void **)v7;
  uint64_t v33 = v8;
  sub_22BC4(&qword_54030);
  sub_38E60();
  uint64_t v9 = v34;
  sub_244D0(a1, (uint64_t)v6);
  unint64_t v10 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v11 = swift_allocObject();
  sub_24538((uint64_t)v6, v11 + v10);
  uint64_t v12 = (uint64_t (**)())&v9[OBJC_IVAR____TtC20VoiceControlSettings37CACPhoneticVocabularyRecordingManager_didError];
  uint64_t v13 = *(void *)&v9[OBJC_IVAR____TtC20VoiceControlSettings37CACPhoneticVocabularyRecordingManager_didError];
  void *v12 = sub_24804;
  v12[1] = (uint64_t (*)())v11;
  sub_24890(v13);

  uint64_t v14 = *(void *)(v7 + 8);
  char v32 = *(void **)v7;
  uint64_t v33 = v14;
  sub_38E60();
  char v15 = v34;
  sub_244D0(a1, (uint64_t)v6);
  uint64_t v16 = swift_allocObject();
  sub_24538((uint64_t)v6, v16 + v10);
  uint64_t v17 = (uint64_t (**)())&v15[OBJC_IVAR____TtC20VoiceControlSettings37CACPhoneticVocabularyRecordingManager_didStart];
  uint64_t v18 = *(void *)&v15[OBJC_IVAR____TtC20VoiceControlSettings37CACPhoneticVocabularyRecordingManager_didStart];
  void *v17 = sub_248A4;
  v17[1] = (uint64_t (*)())v16;
  sub_24890(v18);

  uint64_t v19 = *(void *)(v7 + 8);
  char v32 = *(void **)v7;
  uint64_t v33 = v19;
  sub_38E60();
  uint64_t v20 = v34;
  sub_244D0(a1, (uint64_t)v6);
  uint64_t v21 = swift_allocObject();
  sub_24538((uint64_t)v6, v21 + v10);
  uint64_t v22 = (uint64_t (**)())&v20[OBJC_IVAR____TtC20VoiceControlSettings37CACPhoneticVocabularyRecordingManager_didEnd];
  uint64_t v23 = *(void *)&v20[OBJC_IVAR____TtC20VoiceControlSettings37CACPhoneticVocabularyRecordingManager_didEnd];
  *uint64_t v22 = sub_248C0;
  v22[1] = (uint64_t (*)())v21;
  sub_24890(v23);

  uint64_t v24 = *(void *)(v7 + 8);
  char v32 = *(void **)v7;
  uint64_t v33 = v24;
  sub_38E60();
  uint64_t v25 = v34;
  sub_244D0(a1, (uint64_t)v6);
  uint64_t v26 = swift_allocObject();
  sub_24538((uint64_t)v6, v26 + v10);
  char v27 = (uint64_t (**)(uint64_t))&v25[OBJC_IVAR____TtC20VoiceControlSettings37CACPhoneticVocabularyRecordingManager_recognizedPhonemesBlock];
  uint64_t v28 = *(void *)&v25[OBJC_IVAR____TtC20VoiceControlSettings37CACPhoneticVocabularyRecordingManager_recognizedPhonemesBlock];
  *char v27 = sub_248DC;
  v27[1] = (uint64_t (*)(uint64_t))v26;
  sub_24890(v28);

  sub_244D0(a1, (uint64_t)v6);
  uint64_t v29 = swift_allocObject();
  sub_24538((uint64_t)v6, v29 + v10);
  sub_249C0((uint64_t)sub_24950);
  sub_38490();
  swift_release();
  return sub_384A0();
}

uint64_t sub_1A3E0(uint64_t a1)
{
  uint64_t v2 = (int *)type metadata accessor for CACPhoneticVocabularyRecordingView(0);
  uint64_t v3 = (char *)(a1 + v2[9]);
  uint64_t v4 = *((void *)v3 + 1);
  char v31 = *v3;
  uint64_t v32 = v4;
  sub_22BC4(&qword_54058);
  sub_38E60();
  switch(v33)
  {
    case 6:
      swift_bridgeObjectRelease();
      goto LABEL_7;
    default:
      char v5 = sub_39280();
      swift_bridgeObjectRelease();
      if (v5)
      {
LABEL_7:
        uint64_t v22 = a1 + v2[13];
        uint64_t v23 = sub_38420();
        uint64_t v24 = *(void *)(v23 - 8);
        __chkstk_darwin(v23);
        uint64_t v26 = (char *)&v30 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
        (*(void (**)(char *, uint64_t, uint64_t))(v24 + 16))(v26, v22, v23);
        char v27 = sub_38400();
        os_log_type_t v28 = sub_39110();
        if (os_log_type_enabled(v27, v28))
        {
          uint64_t v29 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v29 = 0;
          _os_log_impl(&def_14E30, v27, v28, "recordingManager.didError, already in .errored state. no-op", v29, 2u);
          swift_slowDealloc();
        }

        return (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v26, v23);
      }
      else
      {
        uint64_t v6 = a1 + v2[13];
        uint64_t v7 = sub_38420();
        uint64_t v8 = *(void *)(v7 - 8);
        __chkstk_darwin(v7);
        unint64_t v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
        (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v6, v7);
        uint64_t v11 = sub_38400();
        os_log_type_t v12 = sub_39110();
        if (os_log_type_enabled(v11, v12))
        {
          uint64_t v13 = (uint8_t *)swift_slowAlloc();
          uint64_t v30 = (uint64_t)&v30;
          *(_WORD *)uint64_t v13 = 0;
          _os_log_impl(&def_14E30, v11, v12, "recordingManager.didError, dictationState -> .errored (unknownError)", v13, 2u);
          swift_slowDealloc();
        }

        (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
        uint64_t v14 = *((void *)v3 + 1);
        char v31 = *v3;
        uint64_t v32 = v14;
        char v33 = 6;
        sub_38E70();
        char v15 = (char *)(a1 + v2[18]);
        char v16 = *v15;
        uint64_t v17 = *((void *)v15 + 1);
        char v31 = v16;
        uint64_t v32 = v17;
        char v33 = 2;
        sub_22BC4(&qword_54060);
        sub_38E70();
        uint64_t v18 = (char *)(a1 + v2[17]);
        char v19 = *v18;
        uint64_t v20 = *((void *)v18 + 1);
        char v31 = v19;
        uint64_t v32 = v20;
        char v33 = 1;
        sub_22BC4(&qword_54000);
        return sub_38E70();
      }
  }
}

uint64_t sub_1A874(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for CACPhoneticVocabularyRecordingView(0);
  uint64_t v3 = a1 + *(int *)(v2 + 52);
  uint64_t v4 = sub_38420();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = &v15[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v5 + 16))(v7, v3, v4);
  uint64_t v8 = sub_38400();
  os_log_type_t v9 = sub_39110();
  if (os_log_type_enabled(v8, v9))
  {
    unint64_t v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v10 = 0;
    _os_log_impl(&def_14E30, v8, v9, "recordingManager.didStart, dictationState -> .recording", v10, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t v11 = (char *)(a1 + *(int *)(v2 + 36));
  char v12 = *v11;
  uint64_t v13 = *((void *)v11 + 1);
  v15[16] = v12;
  uint64_t v16 = v13;
  v15[15] = 3;
  sub_22BC4(&qword_54058);
  return sub_38E70();
}

uint64_t sub_1AA20(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for CACPhoneticVocabularyRecordingView(0);
  uint64_t v3 = __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v41 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __chkstk_darwin(v3);
  uint64_t v8 = (char *)&v41 - v7;
  uint64_t v9 = a1 + *(int *)(v6 + 36);
  uint64_t v10 = *(void *)(v9 + 8);
  LOBYTE(v49) = *(unsigned char *)v9;
  uint64_t v50 = v10;
  uint64_t v11 = sub_22BC4(&qword_54058);
  sub_38E60();
  unint64_t v46 = (unint64_t)"TY_CELL";
  switch((char)v48)
  {
    case 3:
      swift_bridgeObjectRelease();
      goto LABEL_4;
    default:
      char v12 = sub_39280();
      swift_bridgeObjectRelease();
      if (v12)
      {
LABEL_4:
        uint64_t v13 = a1 + *(int *)(v2 + 52);
        uint64_t v14 = sub_38420();
        uint64_t v15 = *(void *)(v14 - 8);
        __chkstk_darwin(v14);
        uint64_t v17 = (char *)&v41 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
        (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v17, v13, v14);
        sub_244D0(a1, (uint64_t)v8);
        uint64_t v18 = sub_38400();
        int v19 = sub_39110();
        if (os_log_type_enabled(v18, (os_log_type_t)v19))
        {
          int v43 = v19;
          uint64_t v44 = &v41;
          uint64_t v20 = (uint8_t *)swift_slowAlloc();
          uint64_t v42 = swift_slowAlloc();
          char v48 = (void *)v42;
          *(_DWORD *)uint64_t v20 = 136315138;
          uint64_t v21 = &v8[*(int *)(v2 + 36)];
          char v22 = *v21;
          uint64_t v23 = *((void *)v21 + 1);
          LOBYTE(v49) = v22;
          uint64_t v50 = v23;
          uint64_t v45 = (uint64_t *)v11;
          sub_38E60();
          unint64_t v24 = v46 | 0x8000000000000000;
          uint64_t v25 = 0xD000000000000010;
          switch(v47)
          {
            case 1:
              break;
            case 2:
              uint64_t v25 = 0xD000000000000014;
              unint64_t v24 = 0x80000000000432F0;
              break;
            case 3:
              uint64_t v25 = 0x6E6964726F636572;
              unint64_t v24 = 0xE900000000000067;
              break;
            case 4:
              unint64_t v24 = 0xED0000676E696472;
              uint64_t v25 = 0x6F636552656E6F64;
              break;
            case 5:
              unint64_t v24 = 0xE800000000000000;
              uint64_t v25 = 0x64656873696E6966;
              break;
            case 6:
              unint64_t v24 = 0xE700000000000000;
              uint64_t v25 = 0x6465726F727265;
              break;
            default:
              unint64_t v24 = 0xE400000000000000;
              uint64_t v25 = 1701602409;
              break;
          }
          uint64_t v49 = sub_217D4(v25, v24, (uint64_t *)&v48);
          sub_391B0();
          swift_bridgeObjectRelease();
          sub_24D50((uint64_t)v8);
          _os_log_impl(&def_14E30, v18, (os_log_type_t)v43, "recordingManager.didEnd, %s dictationState -> .doneRecording", v20, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
        }
        else
        {
          sub_24D50((uint64_t)v8);

          (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
        }
        uint64_t v40 = *(void *)(v9 + 8);
        LOBYTE(v49) = *(unsigned char *)v9;
        uint64_t v50 = v40;
        LOBYTE(v48) = 4;
        return sub_38E70();
      }
      else
      {
        uint64_t v26 = a1 + *(int *)(v2 + 52);
        uint64_t v27 = sub_38420();
        uint64_t v28 = *(void *)(v27 - 8);
        __chkstk_darwin(v27);
        uint64_t v30 = (char *)&v41 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
        (*(void (**)(char *, uint64_t, uint64_t))(v28 + 16))(v30, v26, v27);
        sub_244D0(a1, (uint64_t)v5);
        char v31 = sub_38400();
        os_log_type_t v32 = sub_39110();
        if (os_log_type_enabled(v31, v32))
        {
          uint64_t v45 = &v41;
          char v33 = (uint8_t *)swift_slowAlloc();
          uint64_t v44 = (uint64_t *)swift_slowAlloc();
          char v48 = v44;
          *(_DWORD *)char v33 = 136315138;
          uint64_t v34 = &v5[*(int *)(v2 + 36)];
          char v35 = *v34;
          uint64_t v36 = *((void *)v34 + 1);
          LOBYTE(v49) = v35;
          uint64_t v50 = v36;
          sub_38E60();
          unint64_t v37 = v46 | 0x8000000000000000;
          uint64_t v38 = 0xD000000000000010;
          switch(v47)
          {
            case 1:
              break;
            case 2:
              uint64_t v38 = 0xD000000000000014;
              unint64_t v37 = 0x80000000000432F0;
              break;
            case 3:
              uint64_t v38 = 0x6E6964726F636572;
              unint64_t v37 = 0xE900000000000067;
              break;
            case 4:
              unint64_t v37 = 0xED0000676E696472;
              uint64_t v38 = 0x6F636552656E6F64;
              break;
            case 5:
              unint64_t v37 = 0xE800000000000000;
              uint64_t v38 = 0x64656873696E6966;
              break;
            case 6:
              unint64_t v37 = 0xE700000000000000;
              uint64_t v38 = 0x6465726F727265;
              break;
            default:
              unint64_t v37 = 0xE400000000000000;
              uint64_t v38 = 1701602409;
              break;
          }
          uint64_t v49 = sub_217D4(v38, v37, (uint64_t *)&v48);
          sub_391B0();
          swift_bridgeObjectRelease();
          sub_24D50((uint64_t)v5);
          _os_log_impl(&def_14E30, v31, v32, "recordingManager.didEnd, state (%s) is not .recording, no-op.", v33, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          return (*(uint64_t (**)(char *, uint64_t))(v28 + 8))(v30, v27);
        }
        else
        {
          sub_24D50((uint64_t)v5);

          return (*(uint64_t (**)(char *, uint64_t))(v28 + 8))(v30, v27);
        }
      }
  }
}

uint64_t sub_1B25C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CACPhoneticVocabularyRecordingView(0);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  __chkstk_darwin(v4 - 8);
  sub_266C4(0, &qword_54038);
  uint64_t v21 = sub_39170();
  sub_244D0(a2, (uint64_t)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v7 = (*(unsigned __int8 *)(v5 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a1;
  sub_24538((uint64_t)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v8 + v7);
  aBlock[4] = sub_24C24;
  aBlock[5] = v8;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1C3B0;
  aBlock[3] = &unk_4E040;
  uint64_t v9 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  swift_release();
  uint64_t v10 = sub_38FB0();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_38FA0();
  uint64_t v14 = sub_38F90();
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v17 = (char *)&v20 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  aBlock[0] = _swiftEmptyArrayStorage;
  sub_26700(&qword_54040, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_22BC4(&qword_54048);
  sub_26748(&qword_54050, &qword_54048);
  sub_391F0();
  uint64_t v18 = (void *)v21;
  sub_39180();
  _Block_release(v9);

  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

uint64_t sub_1B5C4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = *(uint8_t **)(a1 + 16);
  if (v3)
  {
    uint64_t v98 = a2;
    long long v102 = _swiftEmptyArrayStorage;
    uint64_t v95 = a1 + 32;
    uint64_t v99 = (void (*)(char *, uint64_t))sub_38330();
    uint64_t v5 = *(void *)(*((void *)v99 - 1) + 64);
    uint64_t v6 = (void (**)(char *, void *))(*((void *)v99 - 1) + 8);
    uint64_t isUniquelyReferenced_nonNull_native = swift_bridgeObjectRetain();
    long long v96 = v3;
    uint64_t v97 = a1;
    uint64_t v8 = (uint64_t *)(a1 + 40);
    do
    {
      uint64_t v9 = *(v8 - 1);
      uint64_t v10 = *v8;
      uint64_t v105 = v9;
      uint64_t v106 = v10;
      __chkstk_darwin(isUniquelyReferenced_nonNull_native);
      swift_bridgeObjectRetain();
      sub_38320();
      sub_2447C();
      uint64_t v11 = sub_391D0();
      unint64_t v13 = v12;
      (*v6)((char *)v88 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v99);
      swift_bridgeObjectRelease();
      uint64_t v14 = HIBYTE(v13) & 0xF;
      if ((v13 & 0x2000000000000000) == 0) {
        uint64_t v14 = v11 & 0xFFFFFFFFFFFFLL;
      }
      if (v14)
      {
        uint64_t isUniquelyReferenced_nonNull_native = swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v15 = v102;
        uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          uint64_t isUniquelyReferenced_nonNull_native = sub_2D81C(0, v15[2] + 1, 1);
          uint64_t v15 = v102;
        }
        unint64_t v17 = v15[2];
        unint64_t v16 = v15[3];
        if (v17 >= v16 >> 1)
        {
          uint64_t isUniquelyReferenced_nonNull_native = sub_2D81C(v16 > 1, v17 + 1, 1);
          uint64_t v15 = v102;
        }
        id v15[2] = v17 + 1;
        uint64_t v18 = &v15[2 * v17];
        v18[4] = v9;
        v18[5] = v10;
      }
      v8 += 2;
      --v3;
    }
    while (v3);
    uint64_t v19 = v97;
    swift_bridgeObjectRelease();
    uint64_t v20 = v102[2];
    swift_release();
    uint64_t v2 = v98;
    if (!v20)
    {
      uint64_t v40 = (int *)type metadata accessor for CACPhoneticVocabularyRecordingView(0);
      uint64_t v41 = v2 + v40[13];
      uint64_t v42 = sub_38420();
      uint64_t v43 = *(void *)(v42 - 8);
      __chkstk_darwin(v42);
      uint64_t v93 = v44;
      uint64_t v94 = v41;
      unint64_t v45 = (v44 + 15) & 0xFFFFFFFFFFFFFFF0;
      long long v91 = *(void (**)(char *, uint64_t, uint64_t))(v43 + 16);
      uint64_t v92 = v43 + 16;
      v91((char *)v88 - v45, v41, v42);
      unint64_t v46 = sub_38400();
      os_log_type_t v47 = sub_39110();
      if (os_log_type_enabled(v46, v47))
      {
        char v48 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)char v48 = 0;
        _os_log_impl(&def_14E30, v46, v47, "recognizedPhonemesBlock, dictationState -> .finished", v48, 2u);
        uint64_t v2 = v98;
        swift_slowDealloc();
      }

      uint64_t v99 = *(void (**)(char *, uint64_t))(v43 + 8);
      v99((char *)v88 - v45, v42);
      uint64_t v49 = (char *)(v2 + v40[9]);
      char v50 = *v49;
      uint64_t v51 = *((void *)v49 + 1);
      LOBYTE(v105) = v50;
      uint64_t v106 = v51;
      LOBYTE(v102) = 5;
      sub_22BC4(&qword_54058);
      uint64_t v52 = sub_38E70();
      __chkstk_darwin(v52);
      uint64_t v53 = (char *)v88 - v45;
      v91((char *)v88 - v45, v94, v42);
      swift_bridgeObjectRetain_n();
      uint64_t v54 = sub_38400();
      os_log_type_t v55 = sub_39110();
      BOOL v56 = os_log_type_enabled(v54, v55);
      uint64_t v90 = v43 + 8;
      long long v89 = v40;
      if (v56)
      {
        uint64_t v57 = (uint8_t *)swift_slowAlloc();
        uint64_t v105 = swift_slowAlloc();
        *(_DWORD *)uint64_t v57 = 136315138;
        v88[0] = v57 + 4;
        swift_bridgeObjectRetain();
        uint64_t v58 = v42;
        uint64_t v59 = sub_390B0();
        v88[1] = v88;
        unint64_t v61 = v60;
        swift_bridgeObjectRelease();
        uint64_t v62 = v59;
        uint64_t v42 = v58;
        long long v102 = (void *)sub_217D4(v62, v61, &v105);
        uint64_t v2 = v98;
        sub_391B0();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&def_14E30, v54, v55, "phonemeSuggestions: %s", v57, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        uint64_t v40 = v89;
        swift_slowDealloc();

        v99(v53, v58);
      }
      else
      {

        swift_bridgeObjectRelease_n();
        v99((char *)v88 - v45, v42);
      }
      uint64_t v63 = v95 + 16 * (void)v96;
      uint64_t v64 = *(void *)(v63 - 16);
      uint64_t v65 = *(void *)(v63 - 8);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if (result)
      {
        uint64_t v66 = *(void *)(v19 + 16);
        if (v66) {
          goto LABEL_24;
        }
      }
      else
      {
        uint64_t result = (uint64_t)sub_224E4(v19);
        uint64_t v19 = result;
        uint64_t v66 = *(void *)(result + 16);
        if (v66)
        {
LABEL_24:
          *(void *)(v19 + 16) = v66 - 1;
          swift_bridgeObjectRelease();
          uint64_t v107 = (void *)v19;
          sub_21EDC(0, 0, v64, v65);
          uint64_t v67 = (uint64_t)v107;
          swift_getKeyPath();
          swift_getKeyPath();
          uint64_t v105 = v67;
          swift_retain();
          swift_bridgeObjectRetain();
          uint64_t v68 = sub_38470();
          __chkstk_darwin(v68);
          long long v70 = (char *)v88 - ((v69 + 15) & 0xFFFFFFFFFFFFFFF0);
          v91(v70, v94, v42);
          long long v71 = sub_38400();
          uint64_t v72 = v42;
          os_log_type_t v73 = sub_39110();
          if (os_log_type_enabled(v71, v73))
          {
            long long v74 = (uint8_t *)swift_slowAlloc();
            uint64_t v105 = swift_slowAlloc();
            uint64_t v97 = v72;
            *(_DWORD *)long long v74 = 136315138;
            long long v96 = v74 + 4;
            swift_beginAccess();
            swift_bridgeObjectRetain();
            uint64_t v75 = sub_390B0();
            unint64_t v77 = v76;
            uint64_t v2 = v98;
            swift_bridgeObjectRelease();
            long long v102 = (void *)sub_217D4(v75, v77, &v105);
            sub_391B0();
            swift_bridgeObjectRelease();
            _os_log_impl(&def_14E30, v71, v73, "rearrangedIPAs: %s", v74, 0xCu);
            swift_arrayDestroy();
            swift_slowDealloc();
            uint64_t v40 = v89;
            swift_slowDealloc();

            long long v78 = v70;
            uint64_t v79 = v97;
          }
          else
          {

            long long v78 = v70;
            uint64_t v79 = v72;
          }
          v99(v78, v79);
          swift_beginAccess();
          if (v107[2] != 1) {
            return swift_bridgeObjectRelease();
          }
          uint64_t v81 = v107[4];
          uint64_t v80 = v107[5];
          uint64_t v82 = (void *)(v2 + v40[11]);
          uint64_t v83 = (void *)*v82;
          uint64_t v84 = v82[1];
          uint64_t v85 = v82[2];
          long long v102 = (void *)*v82;
          uint64_t v103 = v84;
          uint64_t v104 = v85;
          uint64_t v100 = v81;
          uint64_t v101 = v80;
          swift_bridgeObjectRetain();
          sub_22BC4(&qword_54068);
          sub_38E70();
          uint64_t result = (uint64_t)[self sharedPreferences];
          if (result)
          {
            long long v86 = (void *)result;
            unsigned __int8 v87 = [(id)result phoneticVocabularySkipPickingPronunciation];

            if (v87) {
              return swift_bridgeObjectRelease();
            }
            long long v102 = v83;
            uint64_t v103 = v84;
            uint64_t v104 = v85;
            uint64_t result = sub_38E60();
            if (v101)
            {
              sub_1C0D4();
              swift_bridgeObjectRelease();
              return swift_bridgeObjectRelease();
            }
LABEL_36:
            __break(1u);
            return result;
          }
LABEL_35:
          __break(1u);
          goto LABEL_36;
        }
      }
      __break(1u);
      goto LABEL_35;
    }
  }
  uint64_t v21 = (int *)type metadata accessor for CACPhoneticVocabularyRecordingView(0);
  uint64_t v22 = v2 + v21[13];
  uint64_t v23 = sub_38420();
  uint64_t v24 = *(void *)(v23 - 8);
  __chkstk_darwin(v23);
  uint64_t v26 = (char *)v88 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v24 + 16))(v26, v22, v23);
  uint64_t v27 = sub_38400();
  os_log_type_t v28 = sub_39110();
  if (os_log_type_enabled(v27, v28))
  {
    uint64_t v29 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v29 = 0;
    _os_log_impl(&def_14E30, v27, v28, "recognizedPhonemesBlock empty phonemeSuggestions, dictationState -> .errored (noSpeechDetected)", v29, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v24 + 8))(v26, v23);
  uint64_t v30 = (char *)(v2 + v21[9]);
  char v31 = *v30;
  uint64_t v32 = *((void *)v30 + 1);
  LOBYTE(v105) = v31;
  uint64_t v106 = v32;
  LOBYTE(v102) = 6;
  sub_22BC4(&qword_54058);
  sub_38E70();
  char v33 = (char *)(v2 + v21[18]);
  char v34 = *v33;
  uint64_t v35 = *((void *)v33 + 1);
  LOBYTE(v105) = v34;
  uint64_t v106 = v35;
  LOBYTE(v102) = 1;
  sub_22BC4(&qword_54060);
  sub_38E70();
  uint64_t v36 = (char *)(v2 + v21[17]);
  char v37 = *v36;
  uint64_t v38 = *((void *)v36 + 1);
  LOBYTE(v105) = v37;
  uint64_t v106 = v38;
  LOBYTE(v102) = 1;
  sub_22BC4(&qword_54000);
  return sub_38E70();
}

void sub_1C0D4()
{
  type metadata accessor for CACPhoneticVocabularyRecordingView(0);
  sub_22BC4(&qword_54078);
  sub_38E60();
  [v12 setUsesApplicationAudioSession:0];

  sub_38E60();
  [v12 stopSpeakingAtBoundary:0];

  swift_bridgeObjectRetain();
  id v0 = (void *)sub_38FC0();
  swift_bridgeObjectRelease();
  id v1 = [self voiceWithLanguage:v0];

  uint64_t v2 = sub_38FC0();
  if (v1)
  {
    uint64_t v3 = (void *)v2;
    id v4 = [v1 language];
    if (!v4)
    {
      sub_38FE0();
      id v4 = (id)sub_38FC0();
      swift_bridgeObjectRelease();
    }
    id v5 = [self lhPhonemesFromIPA:v3 language:v4];

    if (v5)
    {
      uint64_t v6 = sub_38FE0();
      uint64_t v8 = v7;
    }
    else
    {
      uint64_t v6 = 0;
      uint64_t v8 = 0;
    }
    sub_39210(23);
    swift_bridgeObjectRelease();
    if (v8)
    {
      v13._countAndFlagsBits = v6;
      v13._object = v8;
      sub_39040(v13);
      swift_bridgeObjectRelease();
      v14._countAndFlagsBits = 0x726F3D696F745C1BLL;
      v14._object = (void *)0xEB000000005C6874;
      sub_39040(v14);
      id v9 = objc_allocWithZone((Class)AVSpeechUtterance);
      uint64_t v10 = (void *)sub_38FC0();
      swift_bridgeObjectRelease();
      id v11 = [v9 initWithString:v10];

      [v11 setVoice:v1];
      sub_38E60();
      [v12 speakUtterance:v11];

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_1C3B0(uint64_t a1)
{
  id v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_1C3F4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_384E0();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  unint64_t v7 = &v21[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v5);
  id v9 = &v21[-v8];
  sub_384F0();
  uint64_t v10 = *(void (**)(unsigned char *, void, uint64_t))(v4 + 104);
  v10(v7, enum case for NWPath.Status.satisfied(_:), v3);
  char v11 = sub_384D0();
  id v12 = *(void (**)(unsigned char *, uint64_t))(v4 + 8);
  v12(v7, v3);
  v12(v9, v3);
  if (v11)
  {
    Swift::String v13 = (char *)(a2 + *(int *)(type metadata accessor for CACPhoneticVocabularyRecordingView(0) + 64));
    char v14 = *v13;
    uint64_t v15 = *((void *)v13 + 1);
    char v23 = v14;
    uint64_t v24 = v15;
    char v22 = 1;
  }
  else
  {
    sub_384F0();
    v10(v7, enum case for NWPath.Status.unsatisfied(_:), v3);
    char v16 = sub_384D0();
    v12(v7, v3);
    uint64_t result = ((uint64_t (*)(unsigned char *, uint64_t))v12)(v9, v3);
    if ((v16 & 1) == 0) {
      return result;
    }
    uint64_t v18 = (char *)(a2 + *(int *)(type metadata accessor for CACPhoneticVocabularyRecordingView(0) + 64));
    char v19 = *v18;
    uint64_t v20 = *((void *)v18 + 1);
    char v23 = v19;
    uint64_t v24 = v20;
    char v22 = 0;
  }
  sub_22BC4(&qword_54000);
  return sub_38E70();
}

void sub_1C618()
{
  id v0 = [self sharedPreferences];
  [v0 setSuppressDictationOptIn:0];
}

uint64_t sub_1C67C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v31 = a2;
  uint64_t v39 = a5;
  uint64_t v38 = sub_38930();
  uint64_t v32 = *(void *)(v38 - 8);
  uint64_t v35 = v32;
  __chkstk_darwin(v38);
  char v37 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = sub_389F0();
  uint64_t v9 = *(void *)(v33 - 8);
  __chkstk_darwin(v33);
  char v11 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_22BC4(&qword_54240);
  __chkstk_darwin(v12 - 8);
  char v14 = (char *)&v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_22BC4(&qword_54228);
  __chkstk_darwin(v15);
  unint64_t v17 = (char *)&v30 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v34 = sub_22BC4(&qword_54290);
  uint64_t v36 = *(void *)(v34 - 8);
  __chkstk_darwin(v34);
  char v19 = (char *)&v30 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)char v14 = sub_38880();
  *((void *)v14 + 1) = 0;
  v14[16] = 1;
  uint64_t v20 = sub_22BC4(&qword_54298);
  sub_1CB48(a4, v31, a3, a1, &v14[*(int *)(v20 + 44)]);
  id v21 = [self tertiarySystemGroupedBackgroundColor];
  uint64_t v40 = sub_38DF0();
  swift_retain();
  uint64_t v22 = sub_38ED0();
  sub_26660((uint64_t)v14, (uint64_t)v17, &qword_54240);
  swift_release();
  *(void *)&v17[*(int *)(v15 + 36)] = v22;
  sub_265A0((uint64_t)v14, &qword_54240);
  sub_389E0();
  unint64_t v23 = sub_260CC();
  sub_38C90();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v33);
  sub_265A0((uint64_t)v17, &qword_54228);
  sub_22BC4(&qword_542A0);
  uint64_t v24 = v35;
  uint64_t v25 = swift_allocObject();
  *(_OWORD *)(v25 + 16) = xmmword_3D820;
  sub_38910();
  uint64_t v40 = v25;
  sub_2678C(&qword_542A8, (void (*)(uint64_t))&type metadata accessor for AccessibilityTraits);
  sub_22BC4(&qword_542B0);
  sub_26748(&qword_542B8, &qword_542B0);
  uint64_t v27 = v37;
  uint64_t v26 = v38;
  sub_391F0();
  uint64_t v40 = v15;
  unint64_t v41 = v23;
  swift_getOpaqueTypeConformance2();
  uint64_t v28 = v34;
  sub_38CD0();
  (*(void (**)(char *, uint64_t))(v24 + 8))(v27, v26);
  return (*(uint64_t (**)(char *, uint64_t))(v36 + 8))(v19, v28);
}

void sub_1CB48(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t a4@<X3>, char *a5@<X8>)
{
  uint64_t v191 = a4;
  v207 = a3;
  uint64_t v208 = a2;
  v186 = a5;
  sub_22BC4(&qword_542C0);
  ((void (*)(void))__chkstk_darwin)();
  v184 = (char *)v165 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v183 = sub_386A0();
  uint64_t v182 = *(void *)(v183 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v181 = (char *)v165 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v179 = sub_22BC4(&qword_542C8);
  uint64_t v8 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v202 = (uint64_t)v165 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v8);
  v180 = (void *)((char *)v165 - v11);
  __chkstk_darwin(v10);
  uint64_t v185 = (uint64_t)v165 - v12;
  uint64_t v188 = sub_22BC4(&qword_542D0);
  uint64_t v187 = *(void *)(v188 - 8);
  __chkstk_darwin(v188);
  uint64_t v176 = (uint64_t)v165 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v189 = sub_22BC4(&qword_542D8);
  uint64_t v178 = *(void *)(v189 - 8);
  uint64_t v14 = __chkstk_darwin(v189);
  uint64_t v174 = (uint64_t)v165 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  v173 = (char *)v165 - v16;
  uint64_t v17 = sub_22BC4(&qword_542E0);
  uint64_t v18 = __chkstk_darwin(v17 - 8);
  uint64_t v201 = (uint64_t)v165 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  uint64_t v204 = (uint64_t)v165 - v20;
  uint64_t v21 = sub_388C0();
  __chkstk_darwin(v21 - 8);
  v175 = (char *)v165 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_22BC4(&qword_542E8);
  uint64_t v24 = __chkstk_darwin(v23 - 8);
  uint64_t v200 = (uint64_t)v165 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v24);
  uint64_t v203 = (uint64_t)v165 - v26;
  uint64_t v196 = sub_38580();
  uint64_t v190 = *(void *)(v196 - 8);
  uint64_t v27 = __chkstk_darwin(v196);
  v195 = (char *)v165 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v27);
  uint64_t v194 = (uint64_t)v165 - v29;
  uint64_t v193 = sub_389D0();
  v197 = *(void (***)(char *, uint64_t))(v193 - 8);
  __chkstk_darwin(v193);
  uint64_t v31 = (char *)v165 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v177 = type metadata accessor for CACPhoneticVocabularyRecordingView(0);
  uint64_t v32 = *(void *)(v177 - 8);
  uint64_t v33 = *(void *)(v32 + 64);
  __chkstk_darwin(v177);
  uint64_t v192 = sub_22BC4(&qword_542F0);
  uint64_t v34 = *(void *)(v192 - 8);
  __chkstk_darwin(v192);
  uint64_t v36 = (char *)v165 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = sub_22BC4(&qword_542F8);
  uint64_t v205 = *(void *)(v37 - 8);
  uint64_t v38 = __chkstk_darwin(v37);
  uint64_t v40 = (void (**)(char *, uint64_t))((char *)v165 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v38);
  uint64_t v42 = (void (**)(char *, uint64_t))((char *)v165 - v41);
  uint64_t v206 = a1;
  sub_244D0(a1, (uint64_t)v165 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0));
  unint64_t v43 = (*(unsigned __int8 *)(v32 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v32 + 80);
  uint64_t v44 = swift_allocObject();
  sub_24538((uint64_t)v165 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0), v44 + v43);
  unint64_t v45 = (uint64_t *)(v44 + ((v33 + v43 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v46 = (uint64_t)v207;
  *unint64_t v45 = v208;
  v45[1] = v46;
  swift_bridgeObjectRetain();
  sub_38E90();
  sub_389C0();
  sub_26748(&qword_54300, &qword_542F0);
  sub_2678C(&qword_54308, (void (*)(uint64_t))&type metadata accessor for BorderlessButtonStyle);
  uint64_t v47 = v192;
  uint64_t v48 = v193;
  sub_38C10();
  v197[1](v31, v48);
  (*(void (**)(char *, uint64_t))(v34 + 8))(v36, v47);
  uint64_t v49 = *(void (**)(void (**)(char *, uint64_t), char *, uint64_t))(v205 + 32);
  v197 = v42;
  v198 = v40;
  uint64_t v199 = v37;
  v49(v42, (char *)v40, v37);
  char v50 = (void *)sub_38FC0();
  uint64_t v51 = (void *)sub_38FC0();
  id v52 = settingsLocString(v50, v51);

  if (!v52) {
    goto LABEL_26;
  }
  uint64_t v53 = sub_38FE0();
  uint64_t v55 = v54;

  *(void *)&long long v209 = v53;
  *((void *)&v209 + 1) = v55;
  sub_39070();
  uint64_t v56 = sub_22BC4(&qword_54310);
  uint64_t v57 = swift_allocObject();
  *(_OWORD *)(v57 + 16) = xmmword_3D820;
  uint64_t v58 = v191 + 1;
  if (__OFADD__(v191, 1))
  {
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  v172 = "ARY_UNKNOWN_ERROR_DESCRIPTION";
  long long v166 = xmmword_3D820;
  uint64_t v167 = v56;
  *(void *)(v57 + 56) = &type metadata for Int;
  *(void *)(v57 + 64) = &protocol witness table for Int;
  *(void *)(v57 + 32) = v58;
  uint64_t v59 = sub_38FD0();
  uint64_t v61 = v60;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(void *)&long long v209 = v59;
  *((void *)&v209 + 1) = v61;
  v165[1] = sub_2447C();
  uint64_t v62 = sub_38BE0();
  uint64_t v64 = v63;
  char v66 = v65;
  uint64_t v67 = v194;
  sub_211D4(&qword_53EC8, (uint64_t (*)(void))&type metadata accessor for ColorScheme, 0x686353726F6C6F43, 0xEB00000000656D65, v194);
  uint64_t v68 = v190;
  uint64_t v69 = *(void (**)(void))(v190 + 104);
  long long v70 = v195;
  unsigned int v169 = enum case for ColorScheme.light(_:);
  uint64_t v71 = v196;
  uint64_t v170 = v190 + 104;
  v168 = (void (*)(char *, void, uint64_t))v69;
  v69(v195);
  LOBYTE(v59) = sub_38570();
  uint64_t v72 = *(void (**)(char *, uint64_t))(v68 + 8);
  v72(v70, v71);
  v171 = (void (*)(uint64_t, uint64_t))v72;
  v72((char *)v67, v71);
  if (v59) {
    uint64_t v73 = sub_38DB0();
  }
  else {
    uint64_t v73 = sub_38DD0();
  }
  *(void *)&long long v209 = v73;
  uint64_t v74 = sub_38BA0();
  uint64_t v76 = v75;
  LODWORD(v193) = v77;
  uint64_t v79 = v78;
  sub_250E4(v62, v64, v66 & 1);
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v80 = (char *)self;
  id v81 = [v80 sharedPreferences];
  uint64_t v82 = v206;
  if (!v81) {
    goto LABEL_27;
  }
  uint64_t v83 = v81;
  uint64_t v190 = v76;
  unsigned int v84 = [v81 phoneticVocabularyShowDebugUI];

  uint64_t v192 = v79;
  uint64_t v191 = v74;
  if (v84)
  {
    sub_388B0();
    v214._countAndFlagsBits = 0x203A475542454428;
    v214._object = (void *)0xE800000000000000;
    sub_388A0(v214);
    v215._object = v207;
    v215._countAndFlagsBits = v208;
    sub_38890(v215);
    v216._countAndFlagsBits = 41;
    v216._object = (void *)0xE100000000000000;
    sub_388A0(v216);
    sub_388E0();
    uint64_t v85 = sub_38BD0();
    uint64_t v87 = v86;
    char v89 = v88 & 1;
    *(void *)&long long v209 = sub_38DA0();
    uint64_t v90 = sub_38BA0();
    v175 = v80;
    uint64_t v91 = v90;
    uint64_t v93 = v92;
    uint64_t v95 = v94;
    char v97 = v96 & 1;
    sub_250E4(v85, v87, v89);
    swift_release();
    swift_bridgeObjectRelease();
    *(void *)&long long v209 = v91;
    *((void *)&v209 + 1) = v93;
    LOBYTE(v210) = v97;
    uint64_t v211 = v95;
    uint64_t v98 = v203;
    sub_38C70();
    uint64_t v80 = v175;
    char v99 = v97;
    uint64_t v82 = v206;
    sub_250E4(v91, v93, v99);
    swift_bridgeObjectRelease();
    uint64_t v100 = 0;
  }
  else
  {
    uint64_t v100 = 1;
    uint64_t v98 = v203;
  }
  uint64_t v101 = v204;
  uint64_t v102 = v189;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v187 + 56))(v98, v100, 1, v188);
  id v103 = [v80 sharedPreferences];
  if (!v103) {
    goto LABEL_28;
  }
  uint64_t v104 = v103;
  unsigned int v105 = [v103 phoneticVocabularyShowUserFacingIPA];

  if (!v105)
  {
    uint64_t v129 = 1;
    char v130 = v193;
    goto LABEL_18;
  }
  uint64_t v106 = (void *)sub_38FC0();
  uint64_t v107 = (void *)sub_38FC0();
  id v108 = settingsLocString(v106, v107);

  if (v108)
  {
    uint64_t v109 = sub_38FE0();
    uint64_t v111 = v110;

    *(void *)&long long v209 = v109;
    *((void *)&v209 + 1) = v111;
    sub_39070();
    uint64_t v112 = swift_allocObject();
    *(_OWORD *)(v112 + 16) = v166;
    *(void *)(v112 + 56) = &type metadata for String;
    *(void *)(v112 + 64) = sub_26558();
    uint64_t v113 = v207;
    *(void *)(v112 + 32) = v208;
    *(void *)(v112 + 40) = v113;
    swift_bridgeObjectRetain();
    uint64_t v114 = sub_38FF0();
    uint64_t v116 = v115;
    swift_bridgeObjectRelease();
    *(void *)&long long v209 = v114;
    *((void *)&v209 + 1) = v116;
    uint64_t v117 = sub_38BE0();
    uint64_t v119 = v118;
    *(void *)&long long v209 = v117;
    *((void *)&v209 + 1) = v118;
    char v121 = v120 & 1;
    LOBYTE(v210) = v120 & 1;
    uint64_t v211 = v122;
    sub_38C70();
    sub_250E4(v117, v119, v121);
    swift_bridgeObjectRelease();
    uint64_t v123 = v194;
    sub_211D4(&qword_53EC8, (uint64_t (*)(void))&type metadata accessor for ColorScheme, 0x686353726F6C6F43, 0xEB00000000656D65, v194);
    uint64_t v124 = v195;
    uint64_t v125 = v196;
    v168(v195, v169, v196);
    LOBYTE(v117) = sub_38570();
    uint64_t v126 = v124;
    uint64_t v127 = v171;
    v171((uint64_t)v126, v125);
    v127(v123, v125);
    if (v117) {
      uint64_t v128 = sub_38DB0();
    }
    else {
      uint64_t v128 = sub_38DD0();
    }
    uint64_t v131 = v128;
    uint64_t v132 = v174;
    uint64_t v133 = (uint64_t)v173;
    char v130 = v193;
    uint64_t v134 = v176;
    sub_26660(v176, v174, &qword_542D0);
    *(void *)(v132 + *(int *)(v102 + 36)) = v131;
    sub_265A0(v134, &qword_542D0);
    sub_265FC(v132, v133, &qword_542D8);
    sub_265FC(v133, v101, &qword_542D8);
    uint64_t v129 = 0;
LABEL_18:
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v178 + 56))(v101, v129, 1, v102);
    uint64_t v135 = sub_38E10();
    v136 = (long long *)(v82 + *(int *)(v177 + 44));
    uint64_t v137 = *((void *)v136 + 2);
    long long v209 = *v136;
    uint64_t v210 = v137;
    sub_22BC4(&qword_54068);
    sub_38E60();
    if (v213)
    {
      if (v212 == v208 && v213 == v207)
      {
        swift_bridgeObjectRelease();
        double v138 = 1.0;
LABEL_24:
        char v140 = v130 & 1;
        v141 = v181;
        sub_38690();
        uint64_t v142 = v182;
        uint64_t v143 = (uint64_t)v184;
        uint64_t v144 = v183;
        (*(void (**)(char *, char *, uint64_t))(v182 + 16))(v184, v141, v183);
        v145 = v180;
        sub_26660(v143, (uint64_t)v180 + *(int *)(v179 + 36), &qword_542C0);
        uint64_t *v145 = v135;
        *((double *)v145 + 1) = v138;
        swift_retain();
        sub_265A0(v143, &qword_542C0);
        (*(void (**)(char *, uint64_t))(v142 + 8))(v141, v144);
        swift_release();
        uint64_t v146 = (uint64_t)v145;
        uint64_t v147 = v185;
        sub_265FC(v146, v185, &qword_542C8);
        uint64_t v148 = v205;
        v149 = *(void (**)(char *, void (**)(char *, uint64_t), uint64_t))(v205 + 16);
        v150 = v198;
        uint64_t v151 = v199;
        v149((char *)v198, v197, v199);
        LOBYTE(v209) = v140;
        uint64_t v152 = v98;
        uint64_t v153 = v200;
        sub_26660(v152, v200, &qword_542E8);
        uint64_t v154 = v101;
        uint64_t v155 = v201;
        sub_26660(v154, v201, &qword_542E0);
        sub_26660(v147, v202, &qword_542C8);
        v156 = v186;
        v149(v186, v150, v151);
        v157 = (int *)sub_22BC4(&qword_54318);
        v158 = &v156[v157[12]];
        uint64_t v159 = v191;
        uint64_t v160 = v190;
        *(void *)v158 = v191;
        *((void *)v158 + 1) = v160;
        v158[16] = v140;
        *((void *)v158 + 3) = v192;
        sub_26660(v153, (uint64_t)&v156[v157[16]], &qword_542E8);
        sub_26660(v155, (uint64_t)&v156[v157[20]], &qword_542E0);
        v161 = &v156[v157[24]];
        *(void *)v161 = 0;
        v161[8] = 1;
        uint64_t v162 = v202;
        sub_26660(v202, (uint64_t)&v156[v157[28]], &qword_542C8);
        sub_24ECC(v159, v160, v140);
        swift_bridgeObjectRetain();
        sub_24ECC(v159, v160, v140);
        swift_bridgeObjectRetain();
        sub_265A0(v147, &qword_542C8);
        sub_265A0(v204, &qword_542E0);
        sub_265A0(v203, &qword_542E8);
        sub_250E4(v159, v160, v140);
        swift_bridgeObjectRelease();
        v163 = *(void (**)(void, uint64_t))(v148 + 8);
        uint64_t v164 = v199;
        v163(v197, v199);
        sub_265A0(v162, &qword_542C8);
        sub_265A0(v201, &qword_542E0);
        sub_265A0(v200, &qword_542E8);
        sub_250E4(v159, v160, v209);
        swift_bridgeObjectRelease();
        v163(v198, v164);
        return;
      }
      char v139 = sub_39280();
      swift_bridgeObjectRelease();
      double v138 = 1.0;
      if (v139) {
        goto LABEL_24;
      }
    }
    double v138 = 0.0;
    goto LABEL_24;
  }
LABEL_29:
  __break(1u);
}

void sub_1DFA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  type metadata accessor for CACPhoneticVocabularyRecordingView(0);
  sub_22BC4(&qword_54068);
  sub_38E60();
  if (!v8) {
    goto LABEL_7;
  }
  if (v7 == a2 && v8 == a3)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v6 = sub_39280();
    swift_bridgeObjectRelease();
    if ((v6 & 1) == 0)
    {
LABEL_7:
      swift_bridgeObjectRetain();
      sub_38E70();
      return;
    }
  }
  sub_1C0D4();
}

uint64_t sub_1E0B0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_38E10();
  *a1 = result;
  return result;
}

uint64_t sub_1E0F4()
{
  type metadata accessor for CACPhoneticVocabularyRecordingView(0);
  sub_22BC4(&qword_54068);
  uint64_t result = sub_38E60();
  if (v1)
  {
    sub_1C0D4();
    return swift_bridgeObjectRelease();
  }
  return result;
}

void sub_1E17C(uint64_t a1)
{
  unint64_t v119 = 0xD000000000000010;
  uint64_t v2 = sub_22BC4(&qword_54170);
  __chkstk_darwin(v2 - 8);
  uint64_t v118 = (char *)v109 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = (int *)type metadata accessor for CACPhoneticVocabularyRecordingView(0);
  uint64_t v5 = *((void *)v4 - 1);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v117 = (uint64_t)v109 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v123 = (uint64_t)v109 - v9;
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v12 = (char *)v109 - v11;
  uint64_t v13 = __chkstk_darwin(v10);
  uint64_t v15 = (char *)v109 - v14;
  uint64_t v122 = v16;
  uint64_t v17 = __chkstk_darwin(v13);
  uint64_t v19 = (char *)v109 - v18;
  uint64_t v20 = a1 + *(int *)(v17 + 68);
  uint64_t v21 = *(void *)(v20 + 8);
  LOBYTE(v128) = *(unsigned char *)v20;
  uint64_t v129 = v21;
  LOBYTE(v127) = 0;
  sub_22BC4(&qword_54000);
  sub_38E70();
  uint64_t v22 = a1 + v4[9];
  char v23 = *(unsigned char *)v22;
  uint64_t v121 = v22;
  uint64_t v24 = *(void *)(v22 + 8);
  LOBYTE(v128) = v23;
  uint64_t v129 = v24;
  uint64_t v125 = sub_22BC4(&qword_54058);
  sub_38E60();
  unint64_t v124 = (unint64_t)"TY_CELL";
  os_log_t v120 = v5;
  switch((char)v127)
  {
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
      char v25 = sub_39280();
      swift_bridgeObjectRelease();
      sub_244D0(a1, (uint64_t)v19);
      if (v25) {
        goto LABEL_4;
      }
      uint64_t v26 = &v19[v4[9]];
      char v27 = *v26;
      uint64_t v28 = *((void *)v26 + 1);
      LOBYTE(v128) = v27;
      uint64_t v129 = v28;
      sub_38E60();
      switch((char)v127)
      {
        case 0:
        case 1:
        case 2:
        case 3:
        case 4:
        case 6:
          uint64_t v29 = v127;
          char v30 = sub_39280();
          swift_bridgeObjectRelease();
          sub_24D50((uint64_t)v19);
          sub_244D0(a1, (uint64_t)v15);
          if (v30) {
            goto LABEL_8;
          }
          uint64_t v78 = &v15[v4[9]];
          char v79 = *v78;
          uint64_t v80 = *((void *)v78 + 1);
          LOBYTE(v128) = v79;
          uint64_t v129 = v80;
          sub_38E60();
          switch(v29)
          {
            case 0:
            case 1:
            case 2:
            case 3:
            case 4:
            case 5:
              uint64_t v101 = v127;
              char v102 = sub_39280();
              swift_bridgeObjectRelease();
              sub_24D50((uint64_t)v15);
              if (v102) {
                goto LABEL_9;
              }
              uint64_t v103 = *(void *)(v121 + 8);
              LOBYTE(v128) = *(unsigned char *)v121;
              uint64_t v129 = v103;
              sub_38E60();
              switch(v101)
              {
                case 0:
                  uint64_t v104 = 1701602409;
                  goto LABEL_38;
                case 1:
                  goto LABEL_39;
                case 2:
                  unint64_t v119 = 0xD000000000000014;
                  goto LABEL_39;
                case 3:
                  swift_bridgeObjectRelease();
                  goto LABEL_40;
                case 4:
                  uint64_t v104 = 0x6F636552656E6F64;
                  goto LABEL_38;
                case 5:
                  uint64_t v104 = 0x64656873696E6966;
                  goto LABEL_38;
                case 6:
                  uint64_t v104 = 0x6465726F727265;
LABEL_38:
                  unint64_t v119 = v104;
LABEL_39:
                  char v105 = sub_39280();
                  swift_bridgeObjectRelease();
                  if ((v105 & 1) == 0) {
                    return;
                  }
LABEL_40:
                  uint64_t v106 = (uint64_t *)(a1 + v4[6]);
                  uint64_t v108 = *v106;
                  uint64_t v107 = v106[1];
                  uint64_t v128 = v108;
                  uint64_t v129 = v107;
                  sub_22BC4(&qword_54030);
                  sub_38E60();
                  uint64_t v93 = v127;
                  sub_10F30();
                  break;
                default:
                  goto LABEL_43;
              }
              break;
            case 6:
              swift_bridgeObjectRelease();
              goto LABEL_8;
            default:
              goto LABEL_43;
          }
          break;
        case 5:
          swift_bridgeObjectRelease();
          goto LABEL_4;
        default:
LABEL_43:
          JUMPOUT(0);
      }
      goto LABEL_41;
    default:
      swift_bridgeObjectRelease();
      sub_244D0(a1, (uint64_t)v19);
LABEL_4:
      sub_24D50((uint64_t)v19);
      sub_244D0(a1, (uint64_t)v15);
LABEL_8:
      sub_24D50((uint64_t)v15);
LABEL_9:
      uint64_t v31 = a1 + v4[16];
      char v32 = *(unsigned char *)v31;
      uint64_t v33 = *(void *)(v31 + 8);
      LOBYTE(v128) = v32;
      uint64_t v129 = v33;
      sub_38E60();
      if (v127 == 1)
      {
        uint64_t v34 = (uint64_t *)(a1 + v4[6]);
        uint64_t v35 = *v34;
        uint64_t v36 = v34[1];
        uint64_t v113 = v34;
        uint64_t v128 = v35;
        uint64_t v129 = v36;
        uint64_t v37 = sub_22BC4(&qword_54030);
        sub_38E60();
        uint64_t v38 = v127;
        uint64_t v39 = (uint64_t *)(a1 + v4[8]);
        uint64_t v41 = *v39;
        uint64_t v40 = v39[1];
        uint64_t v42 = &v127[OBJC_IVAR____TtC20VoiceControlSettings37CACPhoneticVocabularyRecordingManager_locale];
        *(void *)uint64_t v42 = v41;
        *((void *)v42 + 1) = v40;
        swift_bridgeObjectRetain();

        swift_bridgeObjectRelease();
        uint64_t v128 = v35;
        uint64_t v129 = v36;
        uint64_t v112 = v37;
        sub_38E60();
        unint64_t v43 = v127;
        uint64_t v44 = (uint64_t *)(*(void *)(a1 + v4[5] + 8)
                        + OBJC_IVAR____TtC20VoiceControlSettings32CACPhoneticVocabularyCoordinator_customWord);
        uint64_t v46 = *v44;
        uint64_t v45 = v44[1];
        uint64_t v47 = &v127[OBJC_IVAR____TtC20VoiceControlSettings37CACPhoneticVocabularyRecordingManager_text];
        *(void *)uint64_t v47 = v46;
        *((void *)v47 + 1) = v45;
        swift_bridgeObjectRetain();

        swift_bridgeObjectRelease();
        uint64_t v48 = a1 + v4[13];
        uint64_t v49 = sub_38420();
        uint64_t v116 = v109;
        uint64_t v50 = *(void *)(v49 - 8);
        __chkstk_darwin(v49);
        uint64_t v52 = a1;
        uint64_t v53 = (char *)v109 - ((v51 + 15) & 0xFFFFFFFFFFFFFFF0);
        uint64_t v54 = *(void (**)(char *, uint64_t))(v50 + 16);
        uint64_t v114 = v55;
        v54(v53, v48);
        uint64_t v115 = v52;
        sub_244D0(v52, (uint64_t)v12);
        sub_244D0((uint64_t)v12, v123);
        unint64_t isa_low = LOBYTE(v120[10].isa);
        uint64_t v57 = (isa_low + 16) & ~isa_low;
        unint64_t v119 = isa_low;
        uint64_t v111 = isa_low | 7;
        uint64_t v58 = swift_allocObject();
        sub_24538((uint64_t)v12, v58 + v57);
        os_log_t v120 = (os_log_t)sub_38400();
        os_log_type_t v59 = sub_39110();
        uint64_t v60 = swift_allocObject();
        *(unsigned char *)(v60 + 16) = 32;
        uint64_t v61 = swift_allocObject();
        *(unsigned char *)(v61 + 16) = 8;
        uint64_t v62 = swift_allocObject();
        *(void *)(v62 + 16) = sub_257F8;
        *(void *)(v62 + 24) = v58;
        uint64_t v63 = swift_allocObject();
        *(void *)(v63 + 16) = sub_2588C;
        *(void *)(v63 + 24) = v62;
        sub_22BC4(&qword_54178);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_3D810;
        *(void *)(inited + 32) = sub_25868;
        *(void *)(inited + 40) = v60;
        *(void *)(inited + 48) = sub_26B40;
        *(void *)(inited + 56) = v61;
        *(void *)(inited + 64) = sub_258B4;
        *(void *)(inited + 72) = v63;
        swift_retain();
        swift_retain();
        swift_retain();
        swift_retain();
        swift_retain();
        os_log_t v65 = v120;
        swift_bridgeObjectRelease();
        if (os_log_type_enabled(v65, v59))
        {
          v109[1] = v58;
          uint64_t v110 = v53;
          v109[0] = v50;
          uint64_t v66 = v114;
          uint64_t v67 = (uint8_t *)swift_slowAlloc();
          uint64_t v127 = (char *)swift_slowAlloc();
          *(_WORD *)uint64_t v67 = 258;
          v67[2] = 32;
          swift_release();
          v67[3] = 8;
          swift_release();
          uint64_t v68 = (char *)(v123 + v4[9]);
          char v69 = *v68;
          uint64_t v70 = *((void *)v68 + 1);
          LOBYTE(v128) = v69;
          uint64_t v129 = v70;
          sub_38E60();
          uint64_t v71 = v115;
          switch(v126)
          {
            case 5:
              swift_bridgeObjectRelease();
              goto LABEL_17;
            default:
              char v81 = sub_39280();
              swift_bridgeObjectRelease();
              if (v81)
              {
LABEL_17:
                uint64_t v82 = 0xD000000000000014;
                unint64_t v83 = 0x80000000000432F0;
              }
              else
              {
                unint64_t v83 = v124 | 0x8000000000000000;
                uint64_t v82 = 0xD000000000000010;
              }
              uint64_t v128 = sub_217D4(v82, v83, (uint64_t *)&v127);
              sub_391B0();
              swift_release();
              swift_release();
              swift_release();
              swift_bridgeObjectRelease();
              sub_24D50(v123);
              os_log_t v84 = v120;
              _os_log_impl(&def_14E30, v120, v59, "CACAudioButton, dictationState -> %s", v67, 0xCu);
              swift_arrayDestroy();
              swift_slowDealloc();
              swift_slowDealloc();

              (*(void (**)(char *, uint64_t))(v109[0] + 8))(v110, v66);
              uint64_t v76 = (char *)v121;
              unint64_t v77 = v119;
              break;
          }
        }
        else
        {
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          sub_24D50(v123);

          (*(void (**)(char *, uint64_t))(v50 + 8))(v53, v114);
          uint64_t v76 = (char *)v121;
          unint64_t v77 = v119;
          uint64_t v71 = v115;
        }
        char v85 = *v76;
        uint64_t v86 = *((void *)v76 + 1);
        LOBYTE(v128) = *v76;
        uint64_t v129 = v86;
        sub_38E60();
        switch((char)v127)
        {
          case 5:
            swift_bridgeObjectRelease();
            char v87 = 2;
            break;
          default:
            char v88 = sub_39280();
            swift_bridgeObjectRelease();
            if (v88) {
              char v87 = 2;
            }
            else {
              char v87 = 1;
            }
            break;
        }
        LOBYTE(v128) = v85;
        uint64_t v129 = v86;
        LOBYTE(v127) = v87;
        sub_38E70();
        char v89 = self;
        id v90 = [v89 sharedPreferences];
        unsigned int v91 = [v90 dictationIsEnabled];

        if (v91)
        {
          uint64_t v92 = v113[1];
          uint64_t v128 = *v113;
          uint64_t v129 = v92;
          sub_38E60();
          uint64_t v93 = v127;
          sub_10C24();
LABEL_41:
        }
        else
        {
          id v94 = [v89 sharedPreferences];
          unsigned __int8 v95 = [v94 suppressDictationOptIn];

          if ((v95 & 1) == 0)
          {
            uint64_t v96 = sub_39100();
            uint64_t v97 = (uint64_t)v118;
            (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v96 - 8) + 56))(v118, 1, 1, v96);
            uint64_t v98 = v117;
            sub_244D0(v71, v117);
            sub_390E0();
            uint64_t v99 = sub_390D0();
            uint64_t v100 = swift_allocObject();
            *(void *)(v100 + 16) = v99;
            *(void *)(v100 + 24) = &protocol witness table for MainActor;
            sub_24538(v98, v100 + ((v77 + 32) & ~v77));
            sub_1F8AC(v97, (uint64_t)&unk_54188, v100);
            swift_release();
          }
        }
      }
      else
      {
        uint64_t v72 = a1 + v4[18];
        char v73 = *(unsigned char *)v72;
        uint64_t v74 = *(void *)(v72 + 8);
        LOBYTE(v128) = v73;
        uint64_t v129 = v74;
        LOBYTE(v127) = 0;
        sub_22BC4(&qword_54060);
        sub_38E70();
        uint64_t v75 = *(void *)(v20 + 8);
        LOBYTE(v128) = *(unsigned char *)v20;
        uint64_t v129 = v75;
        LOBYTE(v127) = 1;
        sub_38E70();
      }
      return;
  }
}

unint64_t sub_1F2E0()
{
  type metadata accessor for CACPhoneticVocabularyRecordingView(0);
  sub_22BC4(&qword_54058);
  sub_38E60();
  if (sub_12FD4(v1, 5)) {
    return 0xD000000000000014;
  }
  else {
    return 0xD000000000000010;
  }
}

uint64_t sub_1F384(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[20] = a4;
  sub_390E0();
  v4[21] = sub_390D0();
  uint64_t v6 = sub_390C0();
  v4[22] = v6;
  v4[23] = v5;
  return _swift_task_switch(sub_1F41C, v6, v5);
}

uint64_t sub_1F41C()
{
  id v1 = [self sharedInstance];
  v0[24] = v1;
  if (v1)
  {
    uint64_t v2 = v1;
    v0[2] = v0;
    v0[7] = (char *)v0 + 201;
    v0[3] = sub_1F544;
    uint64_t v3 = swift_continuation_init();
    v0[10] = _NSConcreteStackBlock;
    v0[11] = 0x40000000;
    v0[12] = sub_1F888;
    v0[13] = &unk_4E220;
    v0[14] = v3;
    [v2 presentEnablementAndDataSharingPromptIfNeeded:v0 + 10];
    id v1 = v0 + 2;
  }
  else
  {
    __break(1u);
  }
  return _swift_continuation_await(v1);
}

uint64_t sub_1F544()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 184);
  uint64_t v2 = *(void *)(*(void *)v0 + 176);
  return _swift_task_switch(sub_1F64C, v2, v1);
}

uint64_t sub_1F64C()
{
  uint64_t v1 = *(void **)(v0 + 192);
  swift_release();
  int v2 = *(unsigned __int8 *)(v0 + 201);

  uint64_t v3 = type metadata accessor for CACPhoneticVocabularyRecordingView(0);
  uint64_t v4 = v3;
  if (v2 == 1)
  {
    uint64_t v5 = (uint64_t *)(*(void *)(v0 + 160) + *(int *)(v3 + 24));
    uint64_t v7 = *v5;
    uint64_t v6 = v5[1];
    *(void *)(v0 + 136) = v7;
    *(void *)(v0 + 144) = v6;
    sub_22BC4(&qword_54030);
    sub_38E60();
    uint64_t v8 = *(void **)(v0 + 152);
    sub_10C24();
  }
  else
  {
    uint64_t v9 = *(void *)(v0 + 160) + *(int *)(v3 + 52);
    uint64_t v10 = sub_38420();
    uint64_t v11 = *(void *)(v10 - 8);
    uint64_t v12 = swift_task_alloc();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v12, v9, v10);
    uint64_t v13 = sub_38400();
    os_log_type_t v14 = sub_39110();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl(&def_14E30, v13, v14, "CACAudioButton, dictationState -> .idle", v15, 2u);
      swift_slowDealloc();
    }
    uint64_t v16 = *(void *)(v0 + 160);

    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v12, v10);
    swift_task_dealloc();
    uint64_t v17 = (char *)(v16 + *(int *)(v4 + 36));
    char v18 = *v17;
    uint64_t v19 = *((void *)v17 + 1);
    *(unsigned char *)(v0 + 120) = v18;
    *(void *)(v0 + 128) = v19;
    *(unsigned char *)(v0 + 200) = 0;
    sub_22BC4(&qword_54058);
    sub_38E70();
  }
  uint64_t v20 = *(uint64_t (**)(void))(v0 + 8);
  return v20();
}

uint64_t sub_1F888(uint64_t a1, char a2)
{
  **(unsigned char **)(*(void *)(*(void *)(a1 + 32) + 64) + 40) = a2;
  return _swift_continuation_resume();
}

uint64_t sub_1F8AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_39100();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_390F0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_265A0(a1, &qword_54170);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_390C0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_1FA58@<X0>(unsigned char *a1@<X8>)
{
  sub_257A0();
  uint64_t result = sub_38850();
  *a1 = v3;
  return result;
}

uint64_t sub_1FAA8()
{
  return sub_38860();
}

id sub_1FAF4(uint64_t a1)
{
  int v2 = (int *)type metadata accessor for CACPhoneticVocabularyRecordingView(0);
  uint64_t v3 = __chkstk_darwin(v2);
  uint64_t v5 = (char *)v90 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __chkstk_darwin(v3);
  uint64_t v8 = (char *)v90 - v7;
  uint64_t v9 = a1 + *(int *)(v6 + 48);
  uint64_t v10 = *(void *)(v9 + 16);
  long long v99 = *(_OWORD *)v9;
  uint64_t v100 = v10;
  uint64_t v11 = sub_22BC4(&qword_54158);
  sub_38E60();
  uint64_t v13 = v101;
  unint64_t v12 = v102;
  swift_bridgeObjectRelease();
  uint64_t v14 = HIBYTE(v12) & 0xF;
  if ((v12 & 0x2000000000000000) == 0) {
    uint64_t v14 = v13 & 0xFFFFFFFFFFFFLL;
  }
  if (!v14)
  {
    uint64_t v29 = self;
    p_ivar_base_size = &AXInstructionalCellContentViewBridge__metaData.ivar_base_size;
    id result = [v29 sharedPreferences];
    if (result)
    {
      char v32 = result;
      unsigned int v33 = [result phoneticVocabularySkipPickingPronunciation];

      if (!v33)
      {
        uint64_t v58 = a1 + v2[11];
        uint64_t v59 = *(void *)(v58 + 16);
        long long v99 = *(_OWORD *)v58;
        uint64_t v100 = v59;
        sub_22BC4(&qword_54068);
        id result = (id)sub_38E60();
        unint64_t v60 = v102;
        if (!v102) {
          return result;
        }
        uint64_t v61 = v101;
        uint64_t v97 = (uint64_t)v2;
        uint64_t v62 = a1 + v2[13];
        uint64_t v63 = sub_38420();
        uint64_t v96 = v90;
        uint64_t v64 = *(void *)(v63 - 8);
        __chkstk_darwin(v63);
        uint64_t v66 = (char *)v90 - ((v65 + 15) & 0xFFFFFFFFFFFFFFF0);
        uint64_t v67 = *(void (**)(char *, uint64_t))(v64 + 16);
        uint64_t v93 = v68;
        v67(v66, v62);
        swift_bridgeObjectRetain_n();
        char v69 = sub_38400();
        os_log_type_t v70 = sub_39110();
        if (os_log_type_enabled(v69, v70))
        {
          uint64_t v94 = a1;
          uint64_t v71 = swift_slowAlloc();
          unsigned __int8 v95 = v29;
          uint64_t v72 = (uint8_t *)v71;
          uint64_t v92 = swift_slowAlloc();
          *(void *)&long long v99 = v92;
          unsigned int v91 = v72;
          *(_DWORD *)uint64_t v72 = 136315138;
          v90[1] = v72 + 4;
          sub_22BC4(&qword_54160);
          uint64_t v73 = swift_allocObject();
          *(_OWORD *)(v73 + 16) = xmmword_3D820;
          *(void *)(v73 + 32) = v61;
          *(void *)(v73 + 40) = v60;
          swift_bridgeObjectRetain();
          uint64_t v74 = sub_390B0();
          unint64_t v76 = v75;
          swift_bridgeObjectRelease();
          uint64_t v77 = v74;
          a1 = v94;
          uint64_t v101 = sub_217D4(v77, v76, (uint64_t *)&v99);
          sub_391B0();
          swift_bridgeObjectRelease_n();
          p_ivar_base_size = (_DWORD *)(&AXInstructionalCellContentViewBridge__metaData + 8);
          swift_bridgeObjectRelease();
          _os_log_impl(&def_14E30, v69, v70, "Phonetic vocabulary using selected IPA: %s", v91, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          uint64_t v29 = v95;
          swift_slowDealloc();
        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        (*(void (**)(char *, void *))(v64 + 8))(v66, v93);
        uint64_t v83 = *(void *)(a1 + *(int *)(v97 + 20) + 8);
        sub_22BC4(&qword_54160);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_3D820;
        *(void *)(inited + 32) = v61;
        *(void *)(inited + 40) = v60;
        swift_retain();
        CACPhoneticVocabularyCoordinator.saveIPAs(_:)((Swift::OpaquePointer)inited);
        swift_setDeallocating();
        swift_arrayDestroy();
        swift_release();
        id result = objc_msgSend(v29, *((SEL *)p_ivar_base_size + 353));
        if (result)
        {
          char v85 = result;
          swift_bridgeObjectRetain();
          uint64_t v86 = (void *)sub_38FC0();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRetain();
          char v87 = (void *)sub_39090();
          swift_bridgeObjectRelease();
          [v85 addVocabularyEntryWithWord:v86 IPAs:v87];

          uint64_t v57 = (void (**)(uint64_t))(v83
                                              + OBJC_IVAR____TtC20VoiceControlSettings32CACPhoneticVocabularyCoordinator_dismissEnrollmentFlow);
          goto LABEL_22;
        }
LABEL_27:
        __break(1u);
        return result;
      }
      uint64_t v34 = a1 + v2[13];
      uint64_t v35 = sub_38420();
      uint64_t v36 = *(void *)(v35 - 8);
      __chkstk_darwin(v35);
      uint64_t v38 = (char *)v90 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
      uint64_t v39 = *(void (**)(char *, uint64_t))(v36 + 16);
      uint64_t v96 = v40;
      v39(v38, v34);
      sub_244D0(a1, (uint64_t)v5);
      uint64_t v41 = sub_38400();
      uint64_t v42 = v2;
      os_log_type_t v43 = sub_39110();
      if (os_log_type_enabled(v41, v43))
      {
        uint64_t v94 = a1;
        uint64_t v44 = swift_slowAlloc();
        unsigned __int8 v95 = v29;
        uint64_t v45 = (uint8_t *)v44;
        uint64_t v46 = swift_slowAlloc();
        uint64_t v92 = v46;
        uint64_t v97 = (uint64_t)v42;
        *(_DWORD *)uint64_t v45 = 136315138;
        *(void *)&long long v99 = v46;
        unsigned int v91 = v45 + 4;
        swift_getKeyPath();
        uint64_t v93 = v90;
        swift_getKeyPath();
        swift_retain();
        sub_38460();
        swift_release();
        swift_release();
        swift_release();
        uint64_t v47 = sub_390B0();
        unint64_t v49 = v48;
        a1 = v94;
        swift_bridgeObjectRelease();
        uint64_t v101 = sub_217D4(v47, v49, (uint64_t *)&v99);
        uint64_t v42 = (int *)v97;
        sub_391B0();
        p_ivar_base_size = (_DWORD *)(&AXInstructionalCellContentViewBridge__metaData + 8);
        swift_bridgeObjectRelease();
        sub_24D50((uint64_t)v5);
        _os_log_impl(&def_14E30, v41, v43, "Phonetic vocabulary using all IPAs: %s", v45, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        uint64_t v29 = v95;
        swift_slowDealloc();
      }
      else
      {
        sub_24D50((uint64_t)v5);
      }

      (*(void (**)(char *, void *))(v36 + 8))(v38, v96);
      uint64_t v78 = a1 + v42[5];
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain_n();
      sub_38460();
      swift_release();
      swift_release();
      swift_release();
      CACPhoneticVocabularyCoordinator.saveIPAs(_:)((Swift::OpaquePointer)v99);
      swift_release();
      swift_bridgeObjectRelease();
      id result = objc_msgSend(v29, *((SEL *)p_ivar_base_size + 353));
      if (result)
      {
        char v79 = result;
        uint64_t v80 = *(void *)(v78 + 8);
        swift_bridgeObjectRetain();
        char v81 = (void *)sub_38FC0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        uint64_t v82 = (void *)sub_39090();
        swift_bridgeObjectRelease();
        [v79 addVocabularyEntryWithWord:v81 IPAs:v82];

        uint64_t v57 = (void (**)(uint64_t))(v80
                                            + OBJC_IVAR____TtC20VoiceControlSettings32CACPhoneticVocabularyCoordinator_dismissEnrollmentFlow);
        goto LABEL_22;
      }
LABEL_26:
      __break(1u);
      goto LABEL_27;
    }
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v97 = v11;
  uint64_t v15 = a1 + v2[13];
  uint64_t v16 = sub_38420();
  uint64_t v96 = v90;
  uint64_t v17 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  uint64_t v19 = (char *)v90 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = *(void (**)(char *, uint64_t))(v17 + 16);
  unsigned __int8 v95 = v21;
  v20(v19, v15);
  sub_244D0(a1, (uint64_t)v8);
  uint64_t v22 = sub_38400();
  os_log_type_t v23 = sub_39110();
  if (os_log_type_enabled(v22, v23))
  {
    uint64_t v24 = swift_slowAlloc();
    uint64_t v94 = a1;
    char v25 = (uint8_t *)v24;
    uint64_t v93 = (void *)swift_slowAlloc();
    uint64_t v98 = v93;
    *(_DWORD *)char v25 = 136315138;
    uint64_t v92 = (uint64_t)(v25 + 4);
    uint64_t v26 = &v8[v2[12]];
    long long v27 = *(_OWORD *)v26;
    uint64_t v28 = *((void *)v26 + 2);
    long long v99 = v27;
    uint64_t v100 = v28;
    sub_38E60();
    *(void *)&long long v99 = sub_217D4(v101, v102, (uint64_t *)&v98);
    sub_391B0();
    swift_bridgeObjectRelease();
    sub_24D50((uint64_t)v8);
    _os_log_impl(&def_14E30, v22, v23, "Phonetic vocabulary using IPA override: %s", v25, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    a1 = v94;
    swift_slowDealloc();
  }
  else
  {
    sub_24D50((uint64_t)v8);
  }

  (*(void (**)(char *, void *))(v17 + 8))(v19, v95);
  uint64_t v50 = *(void *)(a1 + v2[5] + 8);
  sub_22BC4(&qword_54160);
  uint64_t v51 = swift_initStackObject();
  *(_OWORD *)(v51 + 16) = xmmword_3D820;
  uint64_t v52 = *(void *)(v9 + 16);
  long long v99 = *(_OWORD *)v9;
  uint64_t v100 = v52;
  swift_retain();
  sub_38E60();
  unint64_t v53 = v102;
  *(void *)(v51 + 32) = v101;
  *(void *)(v51 + 40) = v53;
  CACPhoneticVocabularyCoordinator.saveIPAs(_:)((Swift::OpaquePointer)v51);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_release();
  id result = [self sharedPreferences];
  if (!result)
  {
    __break(1u);
    goto LABEL_25;
  }
  uint64_t v54 = result;
  swift_bridgeObjectRetain();
  uint64_t v55 = (void *)sub_38FC0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  uint64_t v56 = (void *)sub_39090();
  swift_bridgeObjectRelease();
  [v54 addVocabularyEntryWithWord:v55 IPAs:v56];

  uint64_t v57 = (void (**)(uint64_t))(v50
                                      + OBJC_IVAR____TtC20VoiceControlSettings32CACPhoneticVocabularyCoordinator_dismissEnrollmentFlow);
LABEL_22:
  swift_beginAccess();
  char v88 = *v57;
  uint64_t v89 = swift_retain();
  v88(v89);
  return (id)swift_release();
}

uint64_t sub_207E4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v16 = sub_38880();
  sub_208BC((uint64_t)&v17);
  uint64_t v2 = v17;
  char v3 = v18;
  uint64_t v4 = v19;
  uint64_t v5 = v20;
  char v6 = v21;
  uint64_t v7 = v22;
  uint64_t v8 = v23;
  char v9 = v24;
  char v10 = sub_38B40();
  uint64_t result = sub_38520();
  *(void *)a1 = v16;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  *(void *)(a1 + 24) = v2;
  *(unsigned char *)(a1 + 32) = v3;
  *(void *)(a1 + 40) = v4;
  *(void *)(a1 + 48) = v5;
  *(unsigned char *)(a1 + 56) = v6;
  *(void *)(a1 + 64) = v7;
  *(void *)(a1 + 72) = v8;
  *(unsigned char *)(a1 + 80) = v9;
  *(unsigned char *)(a1 + 88) = v10;
  *(void *)(a1 + 96) = v12;
  *(void *)(a1 + 104) = v13;
  *(void *)(a1 + 112) = v14;
  *(void *)(a1 + 120) = v15;
  *(unsigned char *)(a1 + 128) = 0;
  return result;
}

void sub_208BC(uint64_t a1@<X8>)
{
  uint64_t v2 = (void *)sub_38FC0();
  char v3 = (void *)sub_38FC0();
  id v4 = settingsLocString(v2, v3);

  if (v4)
  {
    sub_38FE0();

    sub_39070();
    sub_2447C();
    uint64_t v5 = sub_38BE0();
    uint64_t v7 = v6;
    char v9 = v8 & 1;
    uint64_t v10 = sub_38BB0();
    uint64_t v12 = v11;
    uint64_t v14 = v13;
    char v16 = v15 & 1;
    sub_250E4(v5, v7, v9);
    swift_bridgeObjectRelease();
    *(void *)a1 = 0;
    *(unsigned char *)(a1 + 8) = 1;
    *(void *)(a1 + 16) = v10;
    *(void *)(a1 + 24) = v12;
    *(unsigned char *)(a1 + 32) = v16;
    *(void *)(a1 + 40) = v14;
    *(void *)(a1 + 48) = 0;
    *(unsigned char *)(a1 + 56) = 1;
    sub_24ECC(v10, v12, v16);
    swift_bridgeObjectRetain();
    sub_250E4(v10, v12, v16);
    swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
}

id sub_20A50(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for CACPhoneticVocabularyRecordingView(0);
  uint64_t v3 = __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = a1 + *(int *)(v3 + 52);
  uint64_t v7 = sub_38420();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v6, v7);
  sub_244D0(a1, (uint64_t)v5);
  uint64_t v11 = sub_38400();
  os_log_type_t v12 = sub_39110();
  BOOL v13 = os_log_type_enabled(v11, v12);
  uint64_t v29 = v2;
  if (v13)
  {
    uint64_t v28 = a1;
    uint64_t v14 = swift_slowAlloc();
    uint64_t v27 = v7;
    char v15 = (uint8_t *)v14;
    v31[0] = swift_slowAlloc();
    *(_DWORD *)char v15 = 136315138;
    uint64_t v26 = v15 + 4;
    char v16 = (uint64_t *)(*(void *)&v5[*(int *)(v2 + 20) + 8]
                    + OBJC_IVAR____TtC20VoiceControlSettings32CACPhoneticVocabularyCoordinator_customWord);
    uint64_t v18 = *v16;
    unint64_t v17 = v16[1];
    swift_bridgeObjectRetain();
    uint64_t v30 = sub_217D4(v18, v17, v31);
    sub_391B0();
    a1 = v28;
    swift_bridgeObjectRelease();
    sub_24D50((uint64_t)v5);
    _os_log_impl(&def_14E30, v11, v12, "Phonetic vocabulary skipping recording for word \"%s\"", v15, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v27);
  }
  else
  {
    sub_24D50((uint64_t)v5);

    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
  id result = [self sharedPreferences];
  if (result)
  {
    uint64_t v20 = result;
    uint64_t v21 = *(void *)(a1 + *(int *)(v29 + 20) + 8);
    swift_bridgeObjectRetain();
    uint64_t v22 = (void *)sub_38FC0();
    swift_bridgeObjectRelease();
    [v20 addVocabularyEntryWithString:v22];

    uint64_t v23 = (void (**)(uint64_t))(v21
                                        + OBJC_IVAR____TtC20VoiceControlSettings32CACPhoneticVocabularyCoordinator_dismissEnrollmentFlow);
    swift_beginAccess();
    char v24 = *v23;
    uint64_t v25 = swift_retain();
    v24(v25);
    return (id)swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_20DD0()
{
  return sub_38C40();
}

void *variable initialization expression of CACPhoneticVocabularyCoordinator.ipas()
{
  return &_swiftEmptyArrayStorage;
}

uint64_t variable initialization expression of CACPhoneticVocabularyCoordinator.customWord()
{
  return 0;
}

uint64_t variable initialization expression of CACPhoneticVocabularyNavigationView._dismiss@<X0>(uint64_t *a1@<X8>)
{
  *a1 = swift_getKeyPath();
  sub_22BC4(&qword_53DE0);

  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_20E60()
{
  return sub_38760();
}

uint64_t sub_20E84(uint64_t a1)
{
  uint64_t v2 = sub_38580();
  __chkstk_darwin(v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_38770();
}

uint64_t sub_20F4C@<X0>(uint64_t a1@<X8>)
{
  return sub_211D4(&qword_53EC8, (uint64_t (*)(void))&type metadata accessor for ColorScheme, 0x686353726F6C6F43, 0xEB00000000656D65, a1);
}

uint64_t sub_20F88(uint64_t a1, char a2)
{
  uint64_t v4 = sub_38840();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 1) == 0)
  {
    swift_retain();
    os_log_type_t v8 = sub_39130();
    uint64_t v9 = sub_38AD0();
    os_log_type_t v10 = v8;
    if (os_log_type_enabled(v9, v8))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      uint64_t v14 = swift_slowAlloc();
      *(_DWORD *)uint64_t v11 = 136315138;
      uint64_t v13 = sub_217D4(0xD000000000000011, 0x800000000003D970, &v14);
      sub_391B0();
      _os_log_impl(&def_14E30, v9, v10, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v11, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    sub_38830();
    swift_getAtKeyPath();
    sub_26B20(a1, 0);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return v14;
  }
  return a1;
}

uint64_t sub_21194@<X0>(uint64_t a1@<X8>)
{
  return sub_211D4(&qword_53DE0, (uint64_t (*)(void))&type metadata accessor for DismissAction, 0x417373696D736944, 0xED00006E6F697463, a1);
}

uint64_t sub_211D4@<X0>(uint64_t *a1@<X0>, uint64_t (*a2)(void)@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v26 = a3;
  uint64_t v9 = v5;
  uint64_t v11 = sub_38840();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin();
  uint64_t v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22BC4(a1);
  __chkstk_darwin();
  char v16 = (char *)&v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_26660(v9, (uint64_t)v16, a1);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v17 = a2(0);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v17 - 8) + 32))(a5, v16, v17);
  }
  else
  {
    os_log_type_t v19 = sub_39130();
    uint64_t v20 = sub_38AD0();
    if (os_log_type_enabled(v20, v19))
    {
      unint64_t v24 = a4;
      uint64_t v21 = swift_slowAlloc();
      uint64_t v25 = a5;
      uint64_t v22 = (uint8_t *)v21;
      uint64_t v28 = swift_slowAlloc();
      *(_DWORD *)uint64_t v22 = 136315138;
      uint64_t v27 = sub_217D4(v26, v24, &v28);
      sub_391B0();
      _os_log_impl(&def_14E30, v20, v19, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v22, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    sub_38830();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
}

uint64_t sub_2148C@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_38460();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_2150C()
{
  return sub_38470();
}

uint64_t sub_21588(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_21664;
  return v6(a1);
}

uint64_t sub_21664()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_2175C(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_217D4(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  sub_391B0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_217D4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_218A8(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_24CF0((uint64_t)v12, *a3);
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
      sub_24CF0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_24CA0((uint64_t)v12);
  return v7;
}

uint64_t sub_218A8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_391C0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_21A64(a5, a6);
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
  uint64_t v8 = sub_39230();
  if (!v8)
  {
    sub_39250();
    __break(1u);
LABEL_17:
    uint64_t result = sub_39260();
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

uint64_t sub_21A64(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_21AFC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_21CDC(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_21CDC(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_21AFC(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_21C74(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_39220();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_39250();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_39060();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_39260();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_39250();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_21C74(uint64_t a1, uint64_t a2)
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
  sub_22BC4(&qword_54070);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_21CDC(char a1, int64_t a2, char a3, char *a4)
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
    sub_22BC4(&qword_54070);
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
  uint64_t v13 = a4 + 32;
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
  uint64_t result = sub_39260();
  __break(1u);
  return result;
}

uint64_t sub_21E2C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_387C0();
  *a1 = result;
  return result;
}

uint64_t sub_21E58()
{
  return sub_387D0();
}

uint64_t sub_21E84@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_38780();
  *a1 = result;
  return result;
}

uint64_t sub_21EB0()
{
  return sub_38790();
}

char *sub_21EDC(uint64_t a1, int64_t a2, uint64_t a3, uint64_t a4)
{
  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  unint64_t v6 = *v4;
  int64_t v7 = *((void *)*v4 + 2);
  if (v7 < a2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v9 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v10 = 1 - v9;
  if (__OFSUB__(1, v9))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  int64_t v11 = v7 + v10;
  if (__OFADD__(v7, v10))
  {
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  uint64_t isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || v11 > *((void *)v6 + 3) >> 1)
  {
    if (v7 <= v11) {
      int64_t v15 = v7 + v10;
    }
    else {
      int64_t v15 = v7;
    }
    unint64_t v6 = sub_2D610(isUniquelyReferenced_nonNull_native, v15, 1, v6);
  }
  char v16 = &v6[16 * a1 + 32];
  uint64_t result = (char *)swift_arrayDestroy();
  if (!v10) {
    goto LABEL_20;
  }
  uint64_t v18 = *((void *)v6 + 2);
  BOOL v19 = __OFSUB__(v18, a2);
  uint64_t v20 = v18 - a2;
  if (v19) {
    goto LABEL_26;
  }
  if ((v20 & 0x8000000000000000) == 0)
  {
    uint64_t result = v16 + 16;
    uint64_t v21 = &v6[16 * a2 + 32];
    if (v16 + 16 != v21 || result >= &v21[16 * v20]) {
      uint64_t result = (char *)memmove(result, v21, 16 * v20);
    }
    uint64_t v22 = *((void *)v6 + 2);
    BOOL v19 = __OFADD__(v22, v10);
    uint64_t v23 = v22 + v10;
    if (!v19)
    {
      *((void *)v6 + 2) = v23;
LABEL_20:
      *(void *)char v16 = a3;
      *((void *)v16 + 1) = a4;
      *unint64_t v4 = v6;
      return result;
    }
    goto LABEL_27;
  }
LABEL_28:
  uint64_t result = (char *)sub_39260();
  __break(1u);
  return result;
}

uint64_t sub_22060(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a3;
  *(void *)(v6 + 24) = a4;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  sub_22BC4(&qword_54280);
  sub_22BC4(&qword_54220);
  sub_26748(&qword_54288, &qword_54280);
  sub_25FEC();
  return sub_38F10();
}

int64_t sub_22170(int64_t result, uint64_t a2, uint64_t a3)
{
  int64_t v3 = a2 - result;
  if (__OFSUB__(a2, result))
  {
LABEL_58:
    __break(1u);
    goto LABEL_59;
  }
  uint64_t v5 = a2;
  int64_t v6 = result;
  unint64_t v7 = *(void *)(a3 + 16);
  if ((uint64_t)v7 >= v3) {
    uint64_t v8 = a2 - result;
  }
  else {
    uint64_t v8 = *(void *)(a3 + 16);
  }
  if (v8 > 0)
  {
    sub_22BC4(&qword_54328);
    uint64_t v9 = (void *)swift_allocObject();
    uint64_t result = j__malloc_size(v9);
    uint64_t v10 = (result - 32) / 24;
    v9[2] = v8;
    v9[3] = 2 * v10;
    if (v5 < v6)
    {
LABEL_60:
      __break(1u);
      goto LABEL_61;
    }
    if (!v7)
    {
LABEL_61:
      __break(1u);
      goto LABEL_62;
    }
    if (v8 - 1 >= v7)
    {
LABEL_62:
      __break(1u);
      goto LABEL_63;
    }
    uint64_t v11 = 0;
    uint64_t v12 = (v10 & 0x7FFFFFFFFFFFFFFFLL) - v8;
    uint64_t v13 = (uint64_t *)(a3 + 40);
    uint64_t v14 = v9 + 7;
    while (v3 != v11)
    {
      if (v7 == v11) {
        goto LABEL_54;
      }
      uint64_t v16 = *(v13 - 1);
      uint64_t v15 = *v13;
      *(v14 - 3) = v6 + v11;
      *(v14 - 2) = v16;
      *(v14 - 1) = v15;
      if (v8 - 1 == v11) {
        goto LABEL_15;
      }
      uint64_t result = swift_bridgeObjectRetain();
      ++v11;
      v13 += 2;
      v14 += 3;
      if (v6 + v11 < v6)
      {
        __break(1u);
LABEL_15:
        uint64_t result = swift_bridgeObjectRetain();
        if (v3 - 1 == v11) {
          goto LABEL_47;
        }
        uint64_t v17 = v6 + v11 + 1;
        uint64_t v5 = a2;
        if (a2 < v6) {
          goto LABEL_52;
        }
        goto LABEL_17;
      }
    }
    goto LABEL_53;
  }
  if (v8 < 0)
  {
LABEL_59:
    __break(1u);
    goto LABEL_60;
  }
  uint64_t v9 = _swiftEmptyArrayStorage;
  uint64_t v12 = _swiftEmptyArrayStorage[3] >> 1;
  if (result == a2) {
    goto LABEL_47;
  }
  uint64_t v14 = &_swiftEmptyArrayStorage[4];
  uint64_t v17 = result;
  if (a2 < result)
  {
LABEL_52:
    __break(1u);
LABEL_53:
    __break(1u);
LABEL_54:
    __break(1u);
LABEL_55:
    __break(1u);
LABEL_56:
    __break(1u);
LABEL_57:
    __break(1u);
    goto LABEL_58;
  }
LABEL_17:
  if (v17 < v6)
  {
LABEL_63:
    __break(1u);
    goto LABEL_64;
  }
  if (v17 >= v5)
  {
LABEL_64:
    __break(1u);
    goto LABEL_65;
  }
  if ((uint64_t)v7 <= v3)
  {
LABEL_47:
    unint64_t v33 = v9[3];
    if (v33 >= 2)
    {
      unint64_t v34 = v33 >> 1;
      BOOL v22 = __OFSUB__(v34, v12);
      unint64_t v35 = v34 - v12;
      if (v22)
      {
LABEL_65:
        __break(1u);
        goto LABEL_66;
      }
      v9[2] = v35;
    }
    return (int64_t)v9;
  }
  uint64_t result = swift_bridgeObjectRetain();
  unint64_t v37 = v7 - v8;
  if (v7 > v8)
  {
    uint64_t v18 = 0;
    uint64_t v38 = ~v17 + v5;
    BOOL v19 = (uint64_t *)(result + 16 * v8 + 40);
    do
    {
      uint64_t v20 = *(v19 - 1);
      uint64_t v21 = *v19;
      if (v12)
      {
        uint64_t result = swift_bridgeObjectRetain();
        BOOL v22 = __OFSUB__(v12--, 1);
        if (v22) {
          goto LABEL_55;
        }
      }
      else
      {
        unint64_t v23 = v9[3];
        if ((uint64_t)((v23 >> 1) + 0x4000000000000000) < 0) {
          goto LABEL_57;
        }
        int64_t v24 = v23 & 0xFFFFFFFFFFFFFFFELL;
        if (v24 <= 1) {
          uint64_t v25 = 1;
        }
        else {
          uint64_t v25 = v24;
        }
        sub_22BC4(&qword_54328);
        uint64_t v26 = (void *)swift_allocObject();
        uint64_t v27 = (uint64_t)(j__malloc_size(v26) - 32) / 24;
        v26[2] = v25;
        v26[3] = 2 * v27;
        uint64_t v28 = v26 + 4;
        uint64_t v29 = v9[3] >> 1;
        uint64_t v14 = &v26[3 * v29 + 4];
        uint64_t v30 = (v27 & 0x7FFFFFFFFFFFFFFFLL) - v29;
        if (v9[2])
        {
          if (v26 != v9 || v28 >= &v9[3 * v29 + 4]) {
            memmove(v28, v9 + 4, 24 * v29);
          }
          swift_bridgeObjectRetain();
          v9[2] = 0;
        }
        else
        {
          swift_bridgeObjectRetain();
        }
        uint64_t result = swift_release();
        uint64_t v9 = v26;
        uint64_t v5 = a2;
        BOOL v22 = __OFSUB__(v30, 1);
        uint64_t v12 = v30 - 1;
        if (v22) {
          goto LABEL_55;
        }
      }
      *uint64_t v14 = v17 + v18;
      v14[1] = v20;
      v14[2] = v21;
      if (v38 == v18) {
        break;
      }
      uint64_t v32 = v17 + v18 + 1;
      if (v32 < v6 || v32 >= v5) {
        goto LABEL_56;
      }
      v19 += 2;
      v14 += 3;
      ++v18;
    }
    while (v37 != v18);
    uint64_t result = swift_bridgeObjectRelease();
    goto LABEL_47;
  }
LABEL_66:
  __break(1u);
  return result;
}

char *sub_224E4(uint64_t a1)
{
  return sub_2D610(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_224F8(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    unint64_t v4 = a3;
    uint64_t v5 = a2;
    uint64_t v6 = HIBYTE(a3) & 0xF;
    if ((a3 & 0x2000000000000000) == 0) {
      uint64_t v6 = a2;
    }
    uint64_t v7 = 7;
    if (((a3 >> 60) & ((a2 & 0x800000000000000) == 0)) != 0) {
      uint64_t v7 = 11;
    }
    uint64_t v8 = v7 | (v6 << 16);
    uint64_t v9 = sub_39020();
    if (v10) {
      a2 = v8;
    }
    else {
      a2 = v9;
    }
    a1 = 15;
    a3 = v5;
    a4 = v4;
  }
  return String.subscript.getter(a1, a2, a3, a4);
}

void sub_22594(void *a1, uint64_t a2)
{
  int64_t v3 = v2;
  uint64_t v4 = OBJC_IVAR____TtC20VoiceControlSettings37CACPhoneticVocabularyRecordingManager_connection;
  uint64_t v5 = *(void **)&v2[OBJC_IVAR____TtC20VoiceControlSettings37CACPhoneticVocabularyRecordingManager_connection];
  if (a1)
  {
    if (v5) {
      BOOL v6 = a1 == v5;
    }
    else {
      BOOL v6 = 0;
    }
    if (!v6)
    {
LABEL_15:
      id v12 = a1;
      uint64_t v13 = v2;
      id v14 = v12;
      uint64_t v15 = v13;
      osloga = sub_38400();
      os_log_type_t v16 = sub_39140();
      if (os_log_type_enabled(osloga, v16))
      {
        uint64_t v17 = swift_slowAlloc();
        uint64_t v18 = (void *)swift_slowAlloc();
        v38[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v17 = 136315394;
        sub_22BC4(&qword_54340);
        uint64_t v19 = sub_391A0();
        sub_217D4(v19, v20, v38);
        sub_391B0();

        swift_bridgeObjectRelease();
        *(_WORD *)(v17 + 12) = 2112;
        uint64_t v21 = *(void **)&v2[v4];
        if (v21) {
          id v22 = v21;
        }
        sub_391B0();
        void *v18 = v21;

        _os_log_impl(&def_14E30, osloga, v16, "[Guard] didRecognizeTranscriptionObjects callback received for unexpected connection (%s. Expected: %@", (uint8_t *)v17, 0x16u);
        sub_22BC4(&qword_54348);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
      }
      return;
    }
  }
  else if (v5)
  {
    goto LABEL_15;
  }
  if (a2)
  {
    uint64_t v7 = *(void *)(a2 + 16);
    unint64_t v34 = v2;
    if (v7)
    {
      uint64_t v8 = a2 + 32;
      swift_bridgeObjectRetain();
      do
      {
        sub_24CF0(v8, (uint64_t)v38);
        sub_266C4(0, &qword_54350);
        if (swift_dynamicCast())
        {
          id v9 = [v37 phonemeSuggestions];
          if (!v9) {
            __break(1u);
          }
          char v10 = v9;
          uint64_t v11 = sub_390A0();

          sub_11874(v11);
        }
        v8 += 32;
        --v7;
      }
      while (v7);
      swift_bridgeObjectRelease();
      int64_t v3 = v34;
    }
    id v23 = a1;
    int64_t v24 = sub_38400();
    os_log_type_t v25 = sub_39110();
    if (os_log_type_enabled(v24, v25))
    {
      uint64_t v26 = swift_slowAlloc();
      v38[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v26 = 136315394;
      swift_beginAccess();
      swift_bridgeObjectRetain();
      uint64_t v27 = sub_390B0();
      unint64_t v29 = v28;
      swift_bridgeObjectRelease();
      sub_217D4(v27, v29, v38);
      sub_391B0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v26 + 12) = 2080;
      sub_22BC4(&qword_54340);
      uint64_t v30 = sub_391A0();
      sub_217D4(v30, v31, v38);
      sub_391B0();

      swift_bridgeObjectRelease();
      _os_log_impl(&def_14E30, v24, v25, "dictationConnectionDidRecognizeTranscriptionObjects %s connection: %s", (uint8_t *)v26, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      int64_t v3 = v34;
      swift_slowDealloc();
    }
    else
    {
    }
    uint64_t v32 = *(void (**)(uint64_t))&v3[OBJC_IVAR____TtC20VoiceControlSettings37CACPhoneticVocabularyRecordingManager_recognizedPhonemesBlock];
    if (v32)
    {
      swift_beginAccess();
      sub_249C0((uint64_t)v32);
      uint64_t v33 = swift_bridgeObjectRetain();
      v32(v33);
      sub_24890((uint64_t)v32);
      swift_bridgeObjectRelease();
    }
    sub_11018();
    swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
}

uint64_t _s20VoiceControlSettings17CACDictationStateO8rawValueACSgSS_tcfC_0(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_4DDD0;
  v6._object = a2;
  unint64_t v4 = sub_39270(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 7) {
    return 7;
  }
  else {
    return v4;
  }
}

uint64_t sub_22BC4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_22C0C()
{
  unint64_t result = qword_53DE8;
  if (!qword_53DE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_53DE8);
  }
  return result;
}

uint64_t sub_22C60()
{
  return type metadata accessor for CACPhoneticVocabularyRecordingManager(0);
}

uint64_t type metadata accessor for CACPhoneticVocabularyRecordingManager(uint64_t a1)
{
  return sub_2424C(a1, (uint64_t *)&unk_53EB8);
}

uint64_t sub_22C88()
{
  uint64_t result = sub_38420();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

unsigned char *initializeBufferWithCopyOfBuffer for CACDictationState(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for CACDictationState(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFA) {
    goto LABEL_17;
  }
  if (a2 + 6 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 6) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 6;
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
      return (*a1 | (v4 << 8)) - 6;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 6;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 7;
  int v8 = v6 - 7;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for CACDictationState(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 6 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 6) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFA) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF9)
  {
    unsigned int v6 = ((a2 - 250) >> 8) + 1;
    *uint64_t result = a2 + 6;
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
        JUMPOUT(0x22EACLL);
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
          *uint64_t result = a2 + 6;
        break;
    }
  }
  return result;
}

uint64_t sub_22ED4(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_22EDC(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for CACDictationState()
{
  return &type metadata for CACDictationState;
}

uint64_t *sub_22EF4(uint64_t *a1, uint64_t *a2, int *a3)
{
  unsigned int v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    unsigned int v4 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    sub_22BC4(&qword_53EC8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_38580();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(v4, a2, v7);
    }
    else
    {
      *unsigned int v4 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = a3[5];
    uint64_t v10 = a3[6];
    uint64_t v11 = (uint64_t *)((char *)v4 + v9);
    id v12 = (uint64_t *)((char *)a2 + v9);
    uint64_t v59 = v12[1];
    void *v11 = *v12;
    v11[1] = v59;
    uint64_t v13 = (uint64_t *)((char *)v4 + v10);
    id v14 = (char *)a2 + v10;
    uint64_t v61 = *(void **)v14;
    uint64_t v63 = *((void *)v14 + 1);
    void *v13 = *(void *)v14;
    v13[1] = v63;
    uint64_t v15 = a3[7];
    uint64_t v16 = a3[8];
    uint64_t v17 = (uint64_t *)((char *)v4 + v15);
    uint64_t v18 = (char *)a2 + v15;
    uint64_t v58 = *(void **)v18;
    uint64_t v60 = *((void *)v18 + 1);
    void *v17 = *(void *)v18;
    v17[1] = v60;
    uint64_t v19 = (uint64_t *)((char *)v4 + v16);
    unint64_t v20 = (uint64_t *)((char *)a2 + v16);
    uint64_t v62 = v20[1];
    *uint64_t v19 = *v20;
    v19[1] = v62;
    uint64_t v21 = a3[9];
    uint64_t v22 = a3[10];
    id v23 = (char *)v4 + v21;
    int64_t v24 = (char *)a2 + v21;
    char *v23 = *v24;
    *((void *)v23 + 1) = *((void *)v24 + 1);
    os_log_type_t v25 = (char *)v4 + v22;
    uint64_t v26 = (char *)a2 + v22;
    char *v25 = *v26;
    *((void *)v25 + 1) = *((void *)v26 + 1);
    uint64_t v27 = a3[11];
    uint64_t v28 = a3[12];
    unint64_t v29 = (uint64_t *)((char *)v4 + v27);
    uint64_t v30 = (uint64_t *)((char *)a2 + v27);
    uint64_t v31 = v30[1];
    void *v29 = *v30;
    v29[1] = v31;
    v29[2] = v30[2];
    uint64_t v32 = (uint64_t *)((char *)v4 + v28);
    uint64_t v33 = (uint64_t *)((char *)a2 + v28);
    uint64_t v34 = v33[1];
    void *v32 = *v33;
    v32[1] = v34;
    void v32[2] = v33[2];
    uint64_t v35 = a3[13];
    uint64_t v56 = (char *)a2 + v35;
    uint64_t v57 = (char *)v4 + v35;
    uint64_t v36 = sub_38420();
    uint64_t v55 = *(void (**)(char *, char *, uint64_t))(*(void *)(v36 - 8) + 16);
    swift_retain();
    id v37 = v61;
    swift_retain();
    id v38 = v58;
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    v55(v57, v56, v36);
    uint64_t v39 = a3[15];
    *(uint64_t *)((char *)v4 + a3[14]) = *(uint64_t *)((char *)a2 + a3[14]);
    uint64_t v40 = *(void **)((char *)a2 + v39);
    *(uint64_t *)((char *)v4 + v39) = (uint64_t)v40;
    uint64_t v41 = a3[16];
    uint64_t v42 = a3[17];
    os_log_type_t v43 = (char *)v4 + v41;
    uint64_t v44 = (char *)a2 + v41;
    *os_log_type_t v43 = *v44;
    *((void *)v43 + 1) = *((void *)v44 + 1);
    uint64_t v45 = (char *)v4 + v42;
    uint64_t v46 = (char *)a2 + v42;
    *uint64_t v45 = *v46;
    *((void *)v45 + 1) = *((void *)v46 + 1);
    uint64_t v47 = a3[18];
    uint64_t v48 = a3[19];
    unint64_t v49 = (char *)v4 + v47;
    uint64_t v50 = (char *)a2 + v47;
    *unint64_t v49 = *v50;
    *((void *)v49 + 1) = *((void *)v50 + 1);
    uint64_t v51 = (char *)v4 + v48;
    uint64_t v52 = (char *)a2 + v48;
    *uint64_t v51 = *v52;
    *((void *)v51 + 1) = *((void *)v52 + 1);
    swift_retain();
    id v53 = v40;
    swift_retain();
    swift_retain();
    swift_retain();
  }
  swift_retain();
  return v4;
}

uint64_t sub_2323C(uint64_t a1, int *a2)
{
  sub_22BC4(&qword_53EC8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_38580();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  swift_release();

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v5 = a1 + a2[13];
  uint64_t v6 = sub_38420();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  swift_release();

  swift_release();
  swift_release();
  swift_release();

  return swift_release();
}

void *sub_23410(void *a1, void *a2, int *a3)
{
  sub_22BC4(&qword_53EC8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_38580();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = (void *)((char *)a1 + v7);
  uint64_t v10 = (void *)((char *)a2 + v7);
  uint64_t v57 = v10[1];
  *uint64_t v9 = *v10;
  v9[1] = v57;
  uint64_t v11 = (void *)((char *)a1 + v8);
  id v12 = (char *)a2 + v8;
  uint64_t v59 = *(void **)v12;
  uint64_t v61 = *((void *)v12 + 1);
  void *v11 = *(void *)v12;
  v11[1] = v61;
  uint64_t v13 = a3[7];
  uint64_t v14 = a3[8];
  uint64_t v15 = (void *)((char *)a1 + v13);
  uint64_t v16 = (char *)a2 + v13;
  uint64_t v56 = *(void **)v16;
  uint64_t v58 = *((void *)v16 + 1);
  void *v15 = *(void *)v16;
  v15[1] = v58;
  uint64_t v17 = (void *)((char *)a1 + v14);
  uint64_t v18 = (void *)((char *)a2 + v14);
  uint64_t v60 = v18[1];
  void *v17 = *v18;
  v17[1] = v60;
  uint64_t v19 = a3[9];
  uint64_t v20 = a3[10];
  uint64_t v21 = (char *)a1 + v19;
  uint64_t v22 = (char *)a2 + v19;
  *uint64_t v21 = *v22;
  *((void *)v21 + 1) = *((void *)v22 + 1);
  id v23 = (char *)a1 + v20;
  int64_t v24 = (char *)a2 + v20;
  char *v23 = *v24;
  *((void *)v23 + 1) = *((void *)v24 + 1);
  uint64_t v25 = a3[11];
  uint64_t v26 = a3[12];
  uint64_t v27 = (void *)((char *)a1 + v25);
  uint64_t v28 = (void *)((char *)a2 + v25);
  uint64_t v29 = v28[1];
  *uint64_t v27 = *v28;
  v27[1] = v29;
  v27[2] = v28[2];
  uint64_t v30 = (void *)((char *)a1 + v26);
  uint64_t v31 = (void *)((char *)a2 + v26);
  uint64_t v32 = v31[1];
  *uint64_t v30 = *v31;
  v30[1] = v32;
  v30[2] = v31[2];
  uint64_t v33 = a3[13];
  uint64_t v54 = (char *)a2 + v33;
  uint64_t v55 = (char *)a1 + v33;
  uint64_t v34 = sub_38420();
  id v53 = *(void (**)(char *, char *, uint64_t))(*(void *)(v34 - 8) + 16);
  swift_retain();
  id v35 = v59;
  swift_retain();
  id v36 = v56;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  v53(v55, v54, v34);
  uint64_t v37 = a3[15];
  *(void *)((char *)a1 + a3[14]) = *(void *)((char *)a2 + a3[14]);
  id v38 = *(void **)((char *)a2 + v37);
  *(void *)((char *)a1 + v37) = v38;
  uint64_t v39 = a3[16];
  uint64_t v40 = a3[17];
  uint64_t v41 = (char *)a1 + v39;
  uint64_t v42 = (char *)a2 + v39;
  *uint64_t v41 = *v42;
  *((void *)v41 + 1) = *((void *)v42 + 1);
  os_log_type_t v43 = (char *)a1 + v40;
  uint64_t v44 = (char *)a2 + v40;
  *os_log_type_t v43 = *v44;
  *((void *)v43 + 1) = *((void *)v44 + 1);
  uint64_t v45 = a3[18];
  uint64_t v46 = a3[19];
  uint64_t v47 = (char *)a1 + v45;
  uint64_t v48 = (char *)a2 + v45;
  *uint64_t v47 = *v48;
  *((void *)v47 + 1) = *((void *)v48 + 1);
  unint64_t v49 = (char *)a1 + v46;
  uint64_t v50 = (char *)a2 + v46;
  *unint64_t v49 = *v50;
  *((void *)v49 + 1) = *((void *)v50 + 1);
  swift_retain();
  id v51 = v38;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

void *sub_2370C(void *a1, void *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_265A0((uint64_t)a1, &qword_53EC8);
    sub_22BC4(&qword_53EC8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_38580();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)((char *)a1 + v7);
  uint64_t v9 = (void *)((char *)a2 + v7);
  void *v8 = *v9;
  v8[1] = v9[1];
  swift_retain();
  swift_release();
  uint64_t v10 = a3[6];
  uint64_t v11 = (char *)a1 + v10;
  id v12 = (char *)a2 + v10;
  uint64_t v13 = *(void **)((char *)a2 + v10);
  uint64_t v14 = *(void **)v11;
  *(void *)uint64_t v11 = v13;
  id v15 = v13;

  *((void *)v11 + 1) = *((void *)v12 + 1);
  swift_retain();
  swift_release();
  uint64_t v16 = a3[7];
  uint64_t v17 = (char *)a1 + v16;
  uint64_t v18 = (char *)a2 + v16;
  uint64_t v19 = *(void **)((char *)a2 + v16);
  uint64_t v20 = *(void **)v17;
  *(void *)uint64_t v17 = v19;
  id v21 = v19;

  *((void *)v17 + 1) = *((void *)v18 + 1);
  swift_retain();
  swift_release();
  uint64_t v22 = a3[8];
  id v23 = (void *)((char *)a1 + v22);
  int64_t v24 = (void *)((char *)a2 + v22);
  void *v23 = *v24;
  v23[1] = v24[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v25 = a3[9];
  uint64_t v26 = (char *)a1 + v25;
  uint64_t v27 = (char *)a2 + v25;
  *uint64_t v26 = *v27;
  *((void *)v26 + 1) = *((void *)v27 + 1);
  swift_retain();
  swift_release();
  uint64_t v28 = a3[10];
  uint64_t v29 = (char *)a1 + v28;
  uint64_t v30 = (char *)a2 + v28;
  char *v29 = *v30;
  *((void *)v29 + 1) = *((void *)v30 + 1);
  swift_retain();
  swift_release();
  uint64_t v31 = a3[11];
  uint64_t v32 = (void *)((char *)a1 + v31);
  uint64_t v33 = (char *)a2 + v31;
  void *v32 = *(void *)((char *)a2 + v31);
  v32[1] = *(void *)((char *)a2 + v31 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  void v32[2] = *((void *)v33 + 2);
  swift_retain();
  swift_release();
  uint64_t v34 = a3[12];
  id v35 = (void *)((char *)a1 + v34);
  id v36 = (char *)a2 + v34;
  *id v35 = *(void *)((char *)a2 + v34);
  v35[1] = *(void *)((char *)a2 + v34 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v35[2] = *((void *)v36 + 2);
  swift_retain();
  swift_release();
  uint64_t v37 = a3[13];
  id v38 = (char *)a1 + v37;
  uint64_t v39 = (char *)a2 + v37;
  uint64_t v40 = sub_38420();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v40 - 8) + 24))(v38, v39, v40);
  *(void *)((char *)a1 + a3[14]) = *(void *)((char *)a2 + a3[14]);
  swift_retain();
  swift_release();
  uint64_t v41 = a3[15];
  uint64_t v42 = *(void **)((char *)a2 + v41);
  os_log_type_t v43 = *(void **)((char *)a1 + v41);
  *(void *)((char *)a1 + v41) = v42;
  id v44 = v42;

  uint64_t v45 = a3[16];
  uint64_t v46 = (char *)a1 + v45;
  uint64_t v47 = (char *)a2 + v45;
  *uint64_t v46 = *v47;
  *((void *)v46 + 1) = *((void *)v47 + 1);
  swift_retain();
  swift_release();
  uint64_t v48 = a3[17];
  unint64_t v49 = (char *)a1 + v48;
  uint64_t v50 = (char *)a2 + v48;
  *unint64_t v49 = *v50;
  *((void *)v49 + 1) = *((void *)v50 + 1);
  swift_retain();
  swift_release();
  uint64_t v51 = a3[18];
  uint64_t v52 = (char *)a1 + v51;
  id v53 = (char *)a2 + v51;
  *uint64_t v52 = *v53;
  *((void *)v52 + 1) = *((void *)v53 + 1);
  swift_retain();
  swift_release();
  uint64_t v54 = a3[19];
  uint64_t v55 = (char *)a1 + v54;
  uint64_t v56 = (char *)a2 + v54;
  *uint64_t v55 = *v56;
  *((void *)v55 + 1) = *((void *)v56 + 1);
  swift_retain();
  swift_release();
  return a1;
}

char *sub_23AC0(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_22BC4(&qword_53EC8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_38580();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = a3[6];
  *(_OWORD *)&a1[a3[5]] = *(_OWORD *)&a2[a3[5]];
  *(_OWORD *)&a1[v8] = *(_OWORD *)&a2[v8];
  uint64_t v9 = a3[8];
  *(_OWORD *)&a1[a3[7]] = *(_OWORD *)&a2[a3[7]];
  *(_OWORD *)&a1[v9] = *(_OWORD *)&a2[v9];
  uint64_t v10 = a3[10];
  *(_OWORD *)&a1[a3[9]] = *(_OWORD *)&a2[a3[9]];
  *(_OWORD *)&a1[v10] = *(_OWORD *)&a2[v10];
  uint64_t v11 = a3[11];
  uint64_t v12 = a3[12];
  uint64_t v13 = &a1[v11];
  uint64_t v14 = &a2[v11];
  *((void *)v13 + 2) = *((void *)v14 + 2);
  *(_OWORD *)uint64_t v13 = *(_OWORD *)v14;
  id v15 = &a1[v12];
  uint64_t v16 = &a2[v12];
  *((void *)v15 + 2) = *((void *)v16 + 2);
  long long v17 = *(_OWORD *)v16;
  uint64_t v18 = a3[13];
  uint64_t v19 = &a1[v18];
  uint64_t v20 = &a2[v18];
  *(_OWORD *)id v15 = v17;
  uint64_t v21 = sub_38420();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v21 - 8) + 32))(v19, v20, v21);
  uint64_t v22 = a3[15];
  *(void *)&a1[a3[14]] = *(void *)&a2[a3[14]];
  *(void *)&a1[v22] = *(void *)&a2[v22];
  uint64_t v23 = a3[17];
  *(_OWORD *)&a1[a3[16]] = *(_OWORD *)&a2[a3[16]];
  *(_OWORD *)&a1[v23] = *(_OWORD *)&a2[v23];
  uint64_t v24 = a3[19];
  *(_OWORD *)&a1[a3[18]] = *(_OWORD *)&a2[a3[18]];
  *(_OWORD *)&a1[v24] = *(_OWORD *)&a2[v24];
  return a1;
}

char *sub_23C84(char *a1, char *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_265A0((uint64_t)a1, &qword_53EC8);
    uint64_t v6 = sub_22BC4(&qword_53EC8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_38580();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
  }
  uint64_t v8 = a3[5];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v12 = *(void *)v10;
  uint64_t v11 = *((void *)v10 + 1);
  *(void *)uint64_t v9 = v12;
  *((void *)v9 + 1) = v11;
  swift_release();
  uint64_t v13 = a3[6];
  uint64_t v14 = &a1[v13];
  id v15 = &a2[v13];
  uint64_t v16 = *(void **)&a1[v13];
  *(void *)&a1[v13] = *(void *)&a2[v13];

  *((void *)v14 + 1) = *((void *)v15 + 1);
  swift_release();
  uint64_t v17 = a3[7];
  uint64_t v18 = &a1[v17];
  uint64_t v19 = &a2[v17];
  uint64_t v20 = *(void **)&a1[v17];
  *(void *)&a1[v17] = *(void *)&a2[v17];

  *((void *)v18 + 1) = *((void *)v19 + 1);
  swift_release();
  uint64_t v21 = a3[8];
  uint64_t v22 = &a1[v21];
  uint64_t v23 = &a2[v21];
  uint64_t v25 = *(void *)v23;
  uint64_t v24 = *((void *)v23 + 1);
  *(void *)uint64_t v22 = v25;
  *((void *)v22 + 1) = v24;
  swift_bridgeObjectRelease();
  uint64_t v26 = a3[9];
  uint64_t v27 = &a1[v26];
  uint64_t v28 = &a2[v26];
  *uint64_t v27 = *v28;
  *((void *)v27 + 1) = *((void *)v28 + 1);
  swift_release();
  uint64_t v29 = a3[10];
  uint64_t v30 = &a1[v29];
  uint64_t v31 = &a2[v29];
  *uint64_t v30 = *v31;
  *((void *)v30 + 1) = *((void *)v31 + 1);
  swift_release();
  uint64_t v32 = a3[11];
  uint64_t v33 = &a1[v32];
  uint64_t v34 = &a2[v32];
  uint64_t v35 = *(void *)&a2[v32 + 8];
  *(void *)uint64_t v33 = *(void *)&a2[v32];
  *((void *)v33 + 1) = v35;
  swift_bridgeObjectRelease();
  *((void *)v33 + 2) = *((void *)v34 + 2);
  swift_release();
  uint64_t v36 = a3[12];
  uint64_t v37 = &a1[v36];
  id v38 = &a2[v36];
  uint64_t v39 = *(void *)&a2[v36 + 8];
  *(void *)uint64_t v37 = *(void *)&a2[v36];
  *((void *)v37 + 1) = v39;
  swift_bridgeObjectRelease();
  *((void *)v37 + 2) = *((void *)v38 + 2);
  swift_release();
  uint64_t v40 = a3[13];
  uint64_t v41 = &a1[v40];
  uint64_t v42 = &a2[v40];
  uint64_t v43 = sub_38420();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v43 - 8) + 40))(v41, v42, v43);
  *(void *)&a1[a3[14]] = *(void *)&a2[a3[14]];
  swift_release();
  uint64_t v44 = a3[15];
  uint64_t v45 = *(void **)&a1[v44];
  *(void *)&a1[v44] = *(void *)&a2[v44];

  uint64_t v46 = a3[16];
  uint64_t v47 = &a1[v46];
  uint64_t v48 = &a2[v46];
  *uint64_t v47 = *v48;
  *((void *)v47 + 1) = *((void *)v48 + 1);
  swift_release();
  uint64_t v49 = a3[17];
  uint64_t v50 = &a1[v49];
  uint64_t v51 = &a2[v49];
  *uint64_t v50 = *v51;
  *((void *)v50 + 1) = *((void *)v51 + 1);
  swift_release();
  uint64_t v52 = a3[18];
  id v53 = &a1[v52];
  uint64_t v54 = &a2[v52];
  char *v53 = *v54;
  *((void *)v53 + 1) = *((void *)v54 + 1);
  swift_release();
  uint64_t v55 = a3[19];
  uint64_t v56 = &a1[v55];
  uint64_t v57 = &a2[v55];
  char *v56 = *v57;
  *((void *)v56 + 1) = *((void *)v57 + 1);
  swift_release();
  return a1;
}

uint64_t sub_23F9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_23FB0);
}

uint64_t sub_23FB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_22BC4(&qword_53ED0);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else if (a2 == 0x7FFFFFFF)
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
  else
  {
    uint64_t v11 = sub_38420();
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a3 + 52);
    return v12(v14, a2, v13);
  }
}

uint64_t sub_240E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_240F8);
}

uint64_t sub_240F8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_22BC4(&qword_53ED0);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else if (a3 == 0x7FFFFFFF)
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v11 = sub_38420();
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a4 + 52);
    return v12(v14, a2, a2, v13);
  }
  return result;
}

uint64_t type metadata accessor for CACPhoneticVocabularyRecordingView(uint64_t a1)
{
  return sub_2424C(a1, (uint64_t *)&unk_53F30);
}

uint64_t sub_2424C(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_24284()
{
  sub_243A0();
  if (v0 <= 0x3F)
  {
    sub_38420();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_243A0()
{
  if (!qword_53F40)
  {
    sub_38580();
    unint64_t v0 = sub_38590();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_53F40);
    }
  }
}

uint64_t sub_243F8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24414(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_2445C@<X0>(uint64_t a1@<X8>)
{
  return sub_14834(*(void *)(v1 + 16), a1);
}

void sub_24464(void *a1@<X8>)
{
  sub_16E00(*(void *)(v1 + 16), a1);
}

void sub_2446C(uint64_t a1@<X8>)
{
}

uint64_t sub_24474@<X0>(uint64_t a1@<X8>)
{
  return sub_19CB8(a1);
}

unint64_t sub_2447C()
{
  unint64_t result = qword_54018;
  if (!qword_54018)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_54018);
  }
  return result;
}

uint64_t sub_244D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CACPhoneticVocabularyRecordingView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24538(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CACPhoneticVocabularyRecordingView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2459C()
{
  return sub_2481C(sub_1A04C);
}

uint64_t sub_245B8()
{
  uint64_t v1 = (int *)type metadata accessor for CACPhoneticVocabularyRecordingView(0);
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*((void *)v1 - 1) + 64);
  uint64_t v5 = v0 + v3;
  sub_22BC4(&qword_53EC8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_38580();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v0 + v3, v6);
  }
  else
  {
    swift_release();
  }
  uint64_t v7 = v3 + v4;
  swift_release();

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v8 = v5 + v1[13];
  uint64_t v9 = sub_38420();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  swift_release();

  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, v7, v2 | 7);
}

uint64_t sub_24804()
{
  return sub_2481C(sub_1A3E0);
}

uint64_t sub_2481C(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = *(void *)(type metadata accessor for CACPhoneticVocabularyRecordingView(0) - 8);
  uint64_t v3 = v1 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));

  return a1(v3);
}

uint64_t sub_24890(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_248A4()
{
  return sub_2481C(sub_1A874);
}

uint64_t sub_248C0()
{
  return sub_2481C(sub_1AA20);
}

uint64_t sub_248DC(uint64_t a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for CACPhoneticVocabularyRecordingView(0) - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return sub_1B25C(a1, v4);
}

uint64_t sub_24950(uint64_t a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for CACPhoneticVocabularyRecordingView(0) - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return sub_1C3F4(a1, v4);
}

uint64_t sub_249C0(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_249D0()
{
  uint64_t v1 = (int *)type metadata accessor for CACPhoneticVocabularyRecordingView(0);
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = (v2 + 24) & ~v2;
  uint64_t v4 = *(void *)(*((void *)v1 - 1) + 64);
  swift_bridgeObjectRelease();
  uint64_t v5 = v0 + v3;
  sub_22BC4(&qword_53EC8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_38580();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v0 + v3, v6);
  }
  else
  {
    swift_release();
  }
  uint64_t v7 = v3 + v4;
  swift_release();

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v8 = v5 + v1[13];
  uint64_t v9 = sub_38420();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  swift_release();

  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, v7, v2 | 7);
}

uint64_t sub_24C24()
{
  uint64_t v1 = *(void *)(type metadata accessor for CACPhoneticVocabularyRecordingView(0) - 8);
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));

  return sub_1B5C4(v2, v3);
}

uint64_t sub_24C88(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_24C98()
{
  return swift_release();
}

uint64_t sub_24CA0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_24CF0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_24D50(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for CACPhoneticVocabularyRecordingView(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24DB0()
{
  return sub_2481C((uint64_t (*)(uint64_t))sub_1E17C);
}

uint64_t sub_24DC8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 72);
  uint64_t v3 = *(void *)(a1 + 80);
  char v4 = *(unsigned char *)(a1 + 88);
  uint64_t v7 = *(void *)(a1 + 168);
  uint64_t v8 = *(void *)(a1 + 160);
  char v6 = *(unsigned char *)(a1 + 176);
  sub_24ECC(*(void *)(a1 + 16), *(void *)(a1 + 24), *(unsigned char *)(a1 + 32));
  swift_bridgeObjectRetain();
  swift_retain();
  sub_24ECC(v2, v3, v4);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_24ECC(v8, v7, v6);
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t sub_24ECC(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_24EDC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  uint64_t v3 = *(void *)(a1 + 64);
  char v4 = *(unsigned char *)(a1 + 72);
  uint64_t v7 = *(void *)(a1 + 152);
  uint64_t v8 = *(void *)(a1 + 144);
  char v6 = *(unsigned char *)(a1 + 160);
  sub_24ECC(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
  swift_bridgeObjectRetain();
  swift_retain();
  sub_24ECC(v2, v3, v4);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_24ECC(v8, v7, v6);
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t sub_24FE0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 72);
  uint64_t v3 = *(void *)(a1 + 80);
  char v4 = *(unsigned char *)(a1 + 88);
  uint64_t v7 = *(void *)(a1 + 168);
  uint64_t v8 = *(void *)(a1 + 160);
  char v6 = *(unsigned char *)(a1 + 176);
  sub_250E4(*(void *)(a1 + 16), *(void *)(a1 + 24), *(unsigned char *)(a1 + 32));
  swift_release();
  swift_bridgeObjectRelease();
  sub_250E4(v2, v3, v4);
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  sub_250E4(v8, v7, v6);
  swift_release();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_250E4(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_250F4(uint64_t result)
{
  *(unsigned char *)(result + 289) = 1;
  return result;
}

unint64_t sub_25100()
{
  unint64_t result = qword_540B0;
  if (!qword_540B0)
  {
    sub_24414(&qword_540A0);
    sub_2517C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_540B0);
  }
  return result;
}

unint64_t sub_2517C()
{
  unint64_t result = qword_540B8;
  if (!qword_540B8)
  {
    sub_24414(&qword_540C0);
    sub_26748(&qword_540C8, &qword_540D0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_540B8);
  }
  return result;
}

uint64_t sub_2521C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  uint64_t v3 = *(void *)(a1 + 64);
  char v4 = *(unsigned char *)(a1 + 72);
  uint64_t v7 = *(void *)(a1 + 152);
  uint64_t v8 = *(void *)(a1 + 144);
  char v6 = *(unsigned char *)(a1 + 160);
  sub_250E4(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
  swift_release();
  swift_bridgeObjectRelease();
  sub_250E4(v2, v3, v4);
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  sub_250E4(v8, v7, v6);
  swift_release();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_25320(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,char a38)
{
  if (a38)
  {
    swift_retain();
    swift_retain();
    sub_24ECC(a7, a8, a9 & 1);
    swift_bridgeObjectRetain();
    swift_retain();
    sub_24ECC(a14, a15, a16 & 1);
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    a1 = a25;
    a2 = a26;
    char v40 = a27 & 1;
  }
  else
  {
    char v40 = a3 & 1;
  }
  sub_24ECC(a1, a2, v40);
  swift_bridgeObjectRetain();

  return swift_retain();
}

uint64_t sub_25488(uint64_t a1, void (*a2)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, _WORD))
{
  long long v5 = *(_OWORD *)(a1 + 240);
  long long v6 = *(_OWORD *)(a1 + 256);
  long long v4 = *(_OWORD *)(a1 + 208);
  a2(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128), *(void *)(a1 + 136), *(void *)(a1 + 144),
    *(void *)(a1 + 152),
    *(void *)(a1 + 160),
    *(void *)(a1 + 168),
    *(void *)(a1 + 176),
    *(void *)(a1 + 184),
    *(void *)(a1 + 192),
    *(void *)(a1 + 200),
    v4,
    *((void *)&v4 + 1),
    *(void *)(a1 + 224),
    *(void *)(a1 + 232),
    v5,
    *((void *)&v5 + 1),
    v6,
    *((void *)&v6 + 1),
    *(void *)(a1 + 272),
    *(void *)(a1 + 280),
    *(_WORD *)(a1 + 288));
  return a1;
}

uint64_t sub_25524(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,char a38)
{
  if (a38)
  {
    swift_release();
    swift_release();
    sub_250E4(a7, a8, a9 & 1);
    swift_release();
    swift_bridgeObjectRelease();
    sub_250E4(a14, a15, a16 & 1);
    swift_release();
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
    a1 = a25;
    a2 = a26;
    char v40 = a27 & 1;
  }
  else
  {
    char v40 = a3 & 1;
  }
  sub_250E4(a1, a2, v40);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_25698(uint64_t result)
{
  *(unsigned char *)(result + 289) = 0;
  return result;
}

uint64_t sub_256A4()
{
  return sub_2481C((uint64_t (*)(uint64_t))sub_1FAF4);
}

uint64_t sub_256BC@<X0>(uint64_t a1@<X8>)
{
  return sub_207E4(a1);
}

unint64_t sub_256C4()
{
  unint64_t result = qword_54128;
  if (!qword_54128)
  {
    sub_24414(&qword_54120);
    sub_26748(&qword_54130, &qword_54138);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_54128);
  }
  return result;
}

uint64_t sub_2576C()
{
  return _swift_deallocObject(v0, 17, 7);
}

unsigned char *sub_2577C(unsigned char *a1)
{
  return sub_35C94(a1, *(unsigned char *)(v1 + 16));
}

uint64_t sub_25788()
{
  return sub_2481C((uint64_t (*)(uint64_t))sub_20A50);
}

unint64_t sub_257A0()
{
  unint64_t result = qword_54168;
  if (!qword_54168)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_54168);
  }
  return result;
}

unint64_t sub_257F8()
{
  type metadata accessor for CACPhoneticVocabularyRecordingView(0);

  return sub_1F2E0();
}

uint64_t sub_25858()
{
  return _swift_deallocObject(v0, 17, 7);
}

unsigned char **sub_25868(unsigned char **result)
{
  uint64_t v2 = *result;
  unsigned char *v2 = *(unsigned char *)(v1 + 16);
  *unint64_t result = v2 + 1;
  return result;
}

uint64_t sub_2587C()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_2588C()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_258B4(uint64_t *a1, uint64_t a2, uint64_t *a3)
{
  return sub_2175C(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t sub_258BC()
{
  uint64_t v1 = (int *)type metadata accessor for CACPhoneticVocabularyRecordingView(0);
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = (v2 + 32) & ~v2;
  uint64_t v4 = *(void *)(*((void *)v1 - 1) + 64);
  swift_unknownObjectRelease();
  uint64_t v5 = v0 + v3;
  sub_22BC4(&qword_53EC8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_38580();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v0 + v3, v6);
  }
  else
  {
    swift_release();
  }
  uint64_t v7 = v3 + v4;
  swift_release();

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v8 = v5 + v1[13];
  uint64_t v9 = sub_38420();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  swift_release();

  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, v7, v2 | 7);
}

uint64_t sub_25B10(uint64_t a1)
{
  uint64_t v4 = *(void *)(type metadata accessor for CACPhoneticVocabularyRecordingView(0) - 8);
  uint64_t v5 = *(void *)(v1 + 16);
  uint64_t v6 = *(void *)(v1 + 24);
  uint64_t v7 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  void *v8 = v2;
  v8[1] = sub_25BFC;
  return sub_1F384(a1, v5, v6, v7);
}

uint64_t sub_25BFC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_25CF0()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_25D28(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_25BFC;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_54190 + dword_54190);
  return v6(a1, v4);
}

uint64_t sub_25DE0(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_250E4(result, a2, a3 & 1);
    swift_release();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_25E30(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_24ECC(result, a2, a3 & 1);
    swift_bridgeObjectRetain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_25E84()
{
  return sub_2481C((uint64_t (*)(uint64_t))sub_16284);
}

uint64_t sub_25EA0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v9 = *(void *)(type metadata accessor for CACPhoneticVocabularyRecordingView(0) - 8);
  uint64_t v10 = v4 + ((*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));

  return sub_1C67C(a1, a2, a3, v10, a4);
}

uint64_t sub_25F38(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(v1 + 16))(*a1, a1[1], a1[2]);
}

uint64_t sub_25F6C()
{
  return sub_22060(v0[2], v0[3], v0[4], v0[5]);
}

unint64_t sub_25F78()
{
  unint64_t result = qword_54210;
  if (!qword_54210)
  {
    sub_24414(&qword_54208);
    sub_25FEC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_54210);
  }
  return result;
}

unint64_t sub_25FEC()
{
  unint64_t result = qword_54218;
  if (!qword_54218)
  {
    sub_24414(&qword_54220);
    sub_24414(&qword_54228);
    sub_260CC();
    swift_getOpaqueTypeConformance2();
    sub_2678C(&qword_54258, (void (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_54218);
  }
  return result;
}

unint64_t sub_260CC()
{
  unint64_t result = qword_54230;
  if (!qword_54230)
  {
    sub_24414(&qword_54228);
    sub_26748(&qword_54238, &qword_54240);
    sub_26748(&qword_54248, &qword_54250);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_54230);
  }
  return result;
}

uint64_t sub_26194()
{
  return sub_2481C((uint64_t (*)(uint64_t))sub_1E0F4);
}

unint64_t sub_261AC()
{
  unint64_t result = qword_54270;
  if (!qword_54270)
  {
    sub_24414(&qword_54268);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_54270);
  }
  return result;
}

uint64_t sub_26218(long long *a1)
{
  uint64_t v2 = *(uint64_t (**)(long long *))(v1 + 16);
  uint64_t v3 = *((void *)a1 + 2);
  long long v5 = *a1;
  uint64_t v6 = v3;
  return v2(&v5);
}

uint64_t sub_2625C()
{
  uint64_t v1 = (int *)type metadata accessor for CACPhoneticVocabularyRecordingView(0);
  uint64_t v2 = *(unsigned __int8 *)(*((void *)v1 - 1) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*((void *)v1 - 1) + 64);
  uint64_t v5 = v0 + v3;
  sub_22BC4(&qword_53EC8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_38580();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v0 + v3, v6);
  }
  else
  {
    swift_release();
  }
  unint64_t v7 = (v4 + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_release();

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v8 = v5 + v1[13];
  uint64_t v9 = sub_38420();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  swift_release();

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, v7 + 16, v2 | 7);
}

void sub_264C8()
{
  uint64_t v1 = *(void *)(type metadata accessor for CACPhoneticVocabularyRecordingView(0) - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = v0 + v2;
  uint64_t v4 = (uint64_t *)(v0 + ((*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v5 = *v4;
  uint64_t v6 = v4[1];

  sub_1DFA8(v3, v5, v6);
}

unint64_t sub_26558()
{
  unint64_t result = qword_54320;
  if (!qword_54320)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_54320);
  }
  return result;
}

uint64_t sub_265A0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_22BC4(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_265FC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_22BC4(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_26660(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_22BC4(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_266C4(uint64_t a1, unint64_t *a2)
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

uint64_t sub_26700(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_26748(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_24414(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2678C(unint64_t *a1, void (*a2)(uint64_t))
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

ValueMetadata *type metadata accessor for CACDictationStateKey()
{
  return &type metadata for CACDictationStateKey;
}

uint64_t getEnumTagSinglePayload for CACPhoneticVocabularyRecordingView.ActiveAlert(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for CACPhoneticVocabularyRecordingView.ActiveAlert(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x26940);
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

ValueMetadata *type metadata accessor for CACPhoneticVocabularyRecordingView.ActiveAlert()
{
  return &type metadata for CACPhoneticVocabularyRecordingView.ActiveAlert;
}

unint64_t sub_2697C()
{
  unint64_t result = qword_54380;
  if (!qword_54380)
  {
    sub_24414(&qword_54028);
    sub_24414(&qword_53FB0);
    sub_24414(&qword_54008);
    sub_26748(&qword_54010, &qword_53FB0);
    sub_2447C();
    sub_26748(&qword_54020, &qword_54008);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_54380);
  }
  return result;
}

unint64_t sub_26ACC()
{
  unint64_t result = qword_54388;
  if (!qword_54388)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_54388);
  }
  return result;
}

uint64_t sub_26B20(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_release();
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for CACAudioButton(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t destroy for CACAudioButton()
{
  return swift_release();
}

void *assignWithCopy for CACAudioButton(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for CACAudioButton(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

_OWORD *assignWithTake for CACAudioButton(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for CACAudioButton(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CACAudioButton(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)__n128 result = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CACAudioButton()
{
  return &type metadata for CACAudioButton;
}

uint64_t sub_26C90()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_26CAC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v17 = a1;
  uint64_t v18 = a2;
  uint64_t v23 = a3;
  uint64_t v21 = sub_38710();
  uint64_t v19 = *(void *)(v21 - 8);
  __chkstk_darwin(v21);
  unsigned int v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_22BC4(&qword_54008);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  int v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_22BC4(&qword_543F0);
  uint64_t v22 = *(void *)(v20 - 8);
  __chkstk_darwin(v20);
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_388D0();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v17;
  *(void *)(v11 + 24) = v18;
  swift_retain();
  sub_38EB0();
  sub_38700();
  uint64_t v12 = sub_26748(&qword_54020, &qword_54008);
  sub_38C50();
  (*(void (**)(char *, uint64_t))(v19 + 8))(v4, v21);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v25 = v12;
  uint64_t v26 = KeyPath;
  char v27 = 0;
  uint64_t v24 = v5;
  swift_getOpaqueTypeConformance2();
  sub_2705C();
  uint64_t v14 = v20;
  sub_38C20();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v22 + 8))(v10, v14);
}

uint64_t sub_26FEC@<X0>(uint64_t a1@<X8>)
{
  return sub_26CAC(*v1, v1[1], a1);
}

uint64_t sub_26FF4()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_2702C()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

unint64_t sub_2705C()
{
  unint64_t result = qword_543F8;
  if (!qword_543F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_543F8);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for AudioButtonStyle(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  sub_270F8(*(void *)a2, v4);
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = v4;
  return a1;
}

uint64_t sub_270F8(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_retain();
  }
  return result;
}

uint64_t destroy for AudioButtonStyle(uint64_t a1)
{
  return sub_26B20(*(void *)a1, *(unsigned char *)(a1 + 8));
}

uint64_t assignWithCopy for AudioButtonStyle(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  char v4 = *(unsigned char *)(a2 + 8);
  sub_270F8(*(void *)a2, v4);
  uint64_t v5 = *(void *)a1;
  char v6 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = v4;
  sub_26B20(v5, v6);
  return a1;
}

uint64_t initializeWithTake for AudioButtonStyle(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)uint64_t result = v2;
  return result;
}

uint64_t assignWithTake for AudioButtonStyle(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  char v4 = *((unsigned char *)a2 + 8);
  uint64_t v5 = *(void *)a1;
  char v6 = *(unsigned char *)(a1 + 8);
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = v4;
  sub_26B20(v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for AudioButtonStyle(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for AudioButtonStyle(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)uint64_t result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 9) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 9) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 8) = -(char)a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AudioButtonStyle()
{
  return &type metadata for AudioButtonStyle;
}

uint64_t sub_27258()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_27328()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_27344@<X0>(uint64_t a1@<X1>, char a2@<W2>, uint64_t a3@<X8>)
{
  uint64_t v22 = a3;
  char v4 = a2 & 1;
  uint64_t v20 = sub_38930();
  uint64_t v5 = *(void *)(v20 - 8);
  __chkstk_darwin(v20);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_22BC4(&qword_54400);
  __chkstk_darwin(v8);
  uint64_t v10 = (uint64_t *)((char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v21 = sub_22BC4(&qword_54408);
  __chkstk_darwin(v21);
  uint64_t v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t *v10 = sub_38F40();
  v10[1] = v13;
  uint64_t v14 = sub_22BC4(&qword_54410);
  sub_27678(a1, v4, (uint64_t)v10 + *(int *)(v14 + 44));
  uint64_t v23 = sub_2915C(a1, v4);
  uint64_t v24 = v15;
  sub_26748(&qword_54418, &qword_54400);
  sub_2447C();
  sub_38C60();
  swift_bridgeObjectRelease();
  sub_265A0((uint64_t)v10, &qword_54400);
  sub_22BC4(&qword_542A0);
  uint64_t v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = xmmword_3DCB0;
  sub_38910();
  sub_38900();
  uint64_t v23 = v16;
  sub_2985C(&qword_542A8, (void (*)(uint64_t))&type metadata accessor for AccessibilityTraits);
  sub_22BC4(&qword_542B0);
  sub_26748(&qword_542B8, &qword_542B0);
  uint64_t v17 = v20;
  sub_391F0();
  sub_386B0();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v17);
  return sub_265A0((uint64_t)v12, &qword_54408);
}

uint64_t sub_27678@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v36 = a1;
  int v35 = a2 & 1;
  uint64_t v4 = sub_22BC4(&qword_54420);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  uint64_t v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (uint64_t *)((char *)&v26 - v8);
  uint64_t v10 = self;
  id v11 = [v10 systemGrayColor];
  uint64_t v12 = sub_38DF0();
  nullsub_6(75.0, 75.0);
  sub_38F40();
  sub_38600();
  uint64_t v34 = v37;
  int v33 = v38;
  uint64_t v32 = v39;
  int v31 = v40;
  uint64_t v29 = v42;
  uint64_t v30 = v41;
  id v13 = [v10 systemBackgroundColor];
  uint64_t v28 = sub_38DF0();
  nullsub_6(66.0, 66.0);
  sub_38F40();
  sub_38600();
  uint64_t v14 = v43;
  char v15 = v44;
  uint64_t v16 = v45;
  char v17 = v46;
  uint64_t v18 = v47;
  uint64_t v27 = v48;
  *uint64_t v9 = sub_38F40();
  v9[1] = v19;
  uint64_t v20 = sub_22BC4(&qword_54428);
  sub_27944(v36, v35, (uint64_t)v9 + *(int *)(v20 + 44));
  sub_26660((uint64_t)v9, (uint64_t)v7, &qword_54420);
  *(void *)a3 = v12;
  *(_WORD *)(a3 + 8) = 256;
  *(void *)(a3 + 16) = v34;
  *(unsigned char *)(a3 + 24) = v33;
  *(void *)(a3 + 32) = v32;
  *(unsigned char *)(a3 + 40) = v31;
  uint64_t v22 = v28;
  uint64_t v21 = v29;
  *(void *)(a3 + 48) = v30;
  *(void *)(a3 + 56) = v21;
  *(void *)(a3 + 64) = v22;
  *(_WORD *)(a3 + 72) = 256;
  *(void *)(a3 + 80) = v14;
  *(unsigned char *)(a3 + 88) = v15;
  *(void *)(a3 + 96) = v16;
  *(unsigned char *)(a3 + 104) = v17;
  uint64_t v23 = v27;
  *(void *)(a3 + 112) = v18;
  *(void *)(a3 + 120) = v23;
  uint64_t v24 = sub_22BC4(&qword_54430);
  sub_26660((uint64_t)v7, a3 + *(int *)(v24 + 64), &qword_54420);
  swift_retain();
  swift_retain();
  sub_265A0((uint64_t)v9, &qword_54420);
  sub_265A0((uint64_t)v7, &qword_54420);
  swift_release();
  return swift_release();
}

uint64_t sub_27944@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v177 = a1;
  uint64_t v173 = a3;
  unint64_t v125 = 0xD000000000000010;
  int v176 = a2 & 1;
  uint64_t v164 = sub_22BC4(&qword_54438);
  uint64_t v3 = __chkstk_darwin(v164);
  uint64_t v130 = (uint64_t)&v125 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v131 = (uint64_t)&v125 - v5;
  uint64_t v135 = sub_22BC4(&qword_54440);
  uint64_t v134 = *(void *)(v135 - 8);
  __chkstk_darwin(v135);
  uint64_t v133 = (char *)&v125 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v159 = sub_22BC4(&qword_54448);
  uint64_t v7 = __chkstk_darwin(v159);
  uint64_t v132 = (char *)&v125 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v136 = (uint64_t)&v125 - v9;
  uint64_t v161 = sub_22BC4(&qword_54450);
  __chkstk_darwin(v161);
  uint64_t v163 = (uint64_t)&v125 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v156 = sub_22BC4(&qword_54458);
  __chkstk_darwin(v156);
  uint64_t v157 = (uint64_t)&v125 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v162 = sub_22BC4(&qword_54460);
  __chkstk_darwin(v162);
  v158 = (char *)&v125 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v153 = sub_22BC4(&qword_54468);
  uint64_t v152 = *(void *)(v153 - 8);
  uint64_t v13 = __chkstk_darwin(v153);
  uint64_t v127 = (char *)&v125 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  double v138 = (char *)&v125 - v15;
  uint64_t v155 = sub_22BC4(&qword_54470);
  uint64_t v154 = *(void *)(v155 - 8);
  uint64_t v16 = __chkstk_darwin(v155);
  char v126 = (char *)&v125 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  uint64_t v137 = (char *)&v125 - v18;
  uint64_t v150 = sub_22BC4(&qword_54478);
  uint64_t v19 = __chkstk_darwin(v150);
  uint64_t v128 = (char *)&v125 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19);
  char v140 = (char *)&v125 - v21;
  uint64_t v160 = sub_22BC4(&qword_54480);
  uint64_t v22 = __chkstk_darwin(v160);
  uint64_t v129 = (uint64_t)&v125 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = __chkstk_darwin(v22);
  uint64_t v139 = (uint64_t)&v125 - v25;
  __chkstk_darwin(v24);
  uint64_t v141 = (uint64_t)&v125 - v26;
  uint64_t v27 = sub_22BC4(&qword_54488);
  uint64_t v28 = __chkstk_darwin(v27 - 8);
  v172 = (char *)&v125 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v28);
  uint64_t v171 = (uint64_t)&v125 - v30;
  uint64_t v31 = sub_386E0();
  uint64_t v32 = *(void *)(v31 - 8);
  __chkstk_darwin(v31);
  uint64_t v34 = (char *)&v125 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = sub_22BC4(&qword_54490);
  uint64_t v36 = *(void *)(v35 - 8);
  uint64_t v37 = __chkstk_darwin(v35);
  uint64_t v39 = (char *)&v125 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v37);
  uint64_t v41 = (char *)&v125 - v40;
  id v42 = objc_msgSend(self, "systemRedColor", v125);
  uint64_t v170 = sub_38DF0();
  nullsub_6(60.0, 60.0);
  sub_38F40();
  sub_38600();
  uint64_t v169 = v180;
  int v168 = v181;
  uint64_t v167 = v182;
  int v166 = v183;
  uint64_t v165 = v184;
  uint64_t v175 = v185;
  sub_38F80();
  sub_386F0();
  sub_38F50();
  uint64_t v43 = sub_2985C(&qword_54498, (void (*)(uint64_t))&type metadata accessor for ScaleTransition);
  sub_38560();
  swift_release();
  char v44 = *(void (**)(char *, uint64_t))(v32 + 8);
  uint64_t v149 = v32 + 8;
  v145 = v44;
  v44(v34, v31);
  uint64_t v45 = (uint64_t)v39;
  uint64_t v46 = v35;
  uint64_t v147 = *(void (**)(uint64_t, char *, uint64_t))(v36 + 16);
  uint64_t v146 = v36 + 16;
  v147(v45, v41, v35);
  uint64_t v142 = v31;
  uint64_t v178 = v31;
  uint64_t v179 = v43;
  uint64_t v144 = v43;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  uint64_t v174 = sub_38610();
  uint64_t v48 = *(void (**)(char *, uint64_t))(v36 + 8);
  uint64_t v151 = v36 + 8;
  uint64_t v148 = v48;
  v48(v41, v35);
  uint64_t v49 = v177;
  LOBYTE(v36) = v176;
  sub_270F8(v177, v176);
  char v50 = sub_20F88(v49, v36);
  sub_26B20(v49, v36);
  uint64_t v143 = OpaqueTypeConformance2;
  switch(v50)
  {
    case 3:
      swift_bridgeObjectRelease();
      goto LABEL_4;
    default:
      char v51 = sub_39280();
      swift_bridgeObjectRelease();
      if (v51)
      {
LABEL_4:
        sub_38E10();
        uint64_t v52 = v138;
        sub_38E30();
        swift_release();
        swift_getOpaqueTypeConformance2();
        id v53 = v137;
        uint64_t v54 = v153;
        sub_38D10();
        (*(void (**)(char *, uint64_t))(v152 + 8))(v52, v54);
        uint64_t v55 = sub_38DD0();
        uint64_t v56 = v154;
        uint64_t v57 = (uint64_t)v140;
        uint64_t v58 = v155;
        (*(void (**)(char *, char *, uint64_t))(v154 + 16))(v140, v53, v155);
        *(void *)(v57 + *(int *)(v150 + 36)) = v55;
        (*(void (**)(char *, uint64_t))(v56 + 8))(v53, v58);
        sub_38F80();
        sub_386F0();
        sub_38F50();
        uint64_t v59 = v142;
        sub_38560();
        swift_release();
        v145(v34, v59);
        v147(v45, v41, v46);
        uint64_t v60 = sub_38610();
        uint64_t v61 = v139;
        sub_26660(v57, v139, &qword_54478);
        *(void *)(v61 + *(int *)(v160 + 36)) = v60;
        v148(v41, v46);
        sub_265A0(v57, &qword_54478);
        uint64_t v62 = v141;
        sub_265FC(v61, v141, &qword_54480);
        sub_26660(v62, v157, &qword_54480);
        swift_storeEnumTagMultiPayload();
        sub_29464();
        sub_295F0();
        uint64_t v63 = (uint64_t)v158;
        sub_38980();
        sub_26660(v63, v163, &qword_54460);
        swift_storeEnumTagMultiPayload();
        sub_293E8();
        sub_296B4();
        uint64_t v64 = (uint64_t)v172;
        sub_38980();
        sub_265A0(v63, &qword_54460);
        sub_265A0(v62, &qword_54480);
        uint64_t v65 = sub_22BC4(&qword_544A0);
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v65 - 8) + 56))(v64, 0, 1, v65);
        uint64_t v66 = v171;
        sub_265FC(v64, v171, &qword_54488);
        uint64_t v67 = v173;
        uint64_t v69 = v169;
        uint64_t v68 = v170;
        char v70 = v168;
        uint64_t v71 = v167;
        char v72 = v166;
        uint64_t v73 = v165;
      }
      else
      {
        uint64_t v141 = v45;
        uint64_t v74 = v177;
        char v75 = v176;
        sub_270F8(v177, v176);
        char v76 = sub_20F88(v74, v75);
        sub_26B20(v74, v75);
        uint64_t v64 = (uint64_t)v172;
        switch(v76)
        {
          case 4:
            swift_bridgeObjectRelease();
            goto LABEL_8;
          default:
            char v77 = sub_39280();
            swift_bridgeObjectRelease();
            if (v77)
            {
LABEL_8:
              uint64_t v78 = v133;
              sub_385F0();
              uint64_t v79 = sub_38DD0();
              uint64_t KeyPath = swift_getKeyPath();
              uint64_t v81 = v134;
              uint64_t v82 = (uint64_t)v132;
              uint64_t v83 = v135;
              (*(void (**)(char *, char *, uint64_t))(v134 + 16))(v132, v78, v135);
              os_log_t v84 = (uint64_t *)(v82 + *(int *)(v159 + 36));
              *os_log_t v84 = KeyPath;
              v84[1] = v79;
              (*(void (**)(char *, uint64_t))(v81 + 8))(v78, v83);
              char v85 = &qword_54448;
              uint64_t v86 = v136;
              sub_265FC(v82, v136, &qword_54448);
              sub_26660(v86, v157, &qword_54448);
              swift_storeEnumTagMultiPayload();
              sub_29464();
              sub_295F0();
              uint64_t v87 = (uint64_t)v158;
              sub_38980();
              sub_26660(v87, v163, &qword_54460);
              swift_storeEnumTagMultiPayload();
              sub_293E8();
              sub_296B4();
              sub_38980();
              sub_265A0(v87, &qword_54460);
              uint64_t v88 = v86;
LABEL_21:
              sub_265A0(v88, v85);
              uint64_t v119 = sub_22BC4(&qword_544A0);
              (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v119 - 8) + 56))(v64, 0, 1, v119);
              uint64_t v66 = v171;
              sub_265FC(v64, v171, &qword_54488);
            }
            else
            {
              uint64_t v89 = v177;
              char v90 = v176;
              sub_270F8(v177, v176);
              char v91 = sub_20F88(v89, v90);
              sub_26B20(v89, v90);
              switch(v91)
              {
                case 5:
LABEL_13:
                  swift_bridgeObjectRelease();
                  goto LABEL_20;
                default:
                  char v92 = sub_39280();
                  swift_bridgeObjectRelease();
                  if (v92)
                  {
LABEL_20:
                    sub_38E10();
                    uint64_t v98 = v127;
                    sub_38E30();
                    swift_release();
                    swift_getOpaqueTypeConformance2();
                    long long v99 = v126;
                    uint64_t v100 = v153;
                    sub_38D10();
                    (*(void (**)(char *, uint64_t))(v152 + 8))(v98, v100);
                    uint64_t v101 = sub_38DD0();
                    uint64_t v102 = v154;
                    uint64_t v103 = (uint64_t)v128;
                    uint64_t v104 = v155;
                    (*(void (**)(char *, char *, uint64_t))(v154 + 16))(v128, v99, v155);
                    *(void *)(v103 + *(int *)(v150 + 36)) = v101;
                    (*(void (**)(char *, uint64_t))(v102 + 8))(v99, v104);
                    sub_38F80();
                    sub_386F0();
                    sub_38F50();
                    uint64_t v105 = v142;
                    sub_38560();
                    swift_release();
                    v145(v34, v105);
                    v147(v141, v41, v46);
                    uint64_t v106 = sub_38610();
                    uint64_t v107 = v129;
                    sub_26660(v103, v129, &qword_54478);
                    *(void *)(v107 + *(int *)(v160 + 36)) = v106;
                    v148(v41, v46);
                    sub_265A0(v103, &qword_54478);
                    LOBYTE(v106) = sub_38B00();
                    sub_38520();
                    uint64_t v109 = v108;
                    uint64_t v111 = v110;
                    uint64_t v113 = v112;
                    uint64_t v115 = v114;
                    uint64_t v116 = v130;
                    sub_26660(v107, v130, &qword_54480);
                    uint64_t v117 = v116 + *(int *)(v164 + 36);
                    *(unsigned char *)uint64_t v117 = v106;
                    *(void *)(v117 + 8) = v109;
                    *(void *)(v117 + 16) = v111;
                    *(void *)(v117 + 24) = v113;
                    *(void *)(v117 + 32) = v115;
                    *(unsigned char *)(v117 + 40) = 0;
                    sub_265A0(v107, &qword_54480);
                    char v85 = &qword_54438;
                    uint64_t v118 = v131;
                    sub_265FC(v116, v131, &qword_54438);
                    sub_26660(v118, v163, &qword_54438);
                    swift_storeEnumTagMultiPayload();
                    sub_293E8();
                    sub_296B4();
                    sub_38980();
                    uint64_t v88 = v118;
                    goto LABEL_21;
                  }
                  uint64_t v93 = v177;
                  char v94 = v176;
                  sub_270F8(v177, v176);
                  char v95 = sub_20F88(v93, v94);
                  sub_26B20(v93, v94);
                  switch(v95)
                  {
                    case 1:
                      goto LABEL_19;
                    case 2:
                      unint64_t v125 = 0xD000000000000014;
                      goto LABEL_19;
                    case 3:
                      unint64_t v125 = 0x6E6964726F636572;
                      goto LABEL_19;
                    case 4:
                      unint64_t v125 = 0x6F636552656E6F64;
                      goto LABEL_19;
                    case 5:
                      uint64_t v96 = 0x64656873696E6966;
                      goto LABEL_18;
                    case 6:
                      goto LABEL_13;
                    default:
                      uint64_t v96 = 1701602409;
LABEL_18:
                      unint64_t v125 = v96;
LABEL_19:
                      char v97 = sub_39280();
                      swift_bridgeObjectRelease();
                      if (v97) {
                        goto LABEL_20;
                      }
                      uint64_t v124 = sub_22BC4(&qword_544A0);
                      uint64_t v66 = v171;
                      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v124 - 8) + 56))(v171, 1, 1, v124);
                      break;
                  }
                  break;
              }
            }
            uint64_t v67 = v173;
            uint64_t v69 = v169;
            uint64_t v68 = v170;
            uint64_t v71 = v167;
            char v72 = v166;
            uint64_t v73 = v165;
            char v70 = v168;
            break;
        }
      }
      sub_26660(v66, v64, &qword_54488);
      *(void *)uint64_t v67 = v68;
      *(_WORD *)(v67 + 8) = 256;
      *(void *)(v67 + 16) = v69;
      *(unsigned char *)(v67 + 24) = v70;
      *(void *)(v67 + 32) = v71;
      *(unsigned char *)(v67 + 40) = v72;
      uint64_t v121 = v174;
      uint64_t v120 = v175;
      *(void *)(v67 + 48) = v73;
      *(void *)(v67 + 56) = v120;
      *(void *)(v67 + 64) = v121;
      uint64_t v122 = sub_22BC4(&qword_544A8);
      sub_26660(v64, v67 + *(int *)(v122 + 48), &qword_54488);
      swift_retain();
      swift_retain();
      sub_265A0(v66, &qword_54488);
      sub_265A0(v64, &qword_54488);
      swift_release();
      return swift_release();
  }
}

uint64_t sub_2915C(uint64_t a1, char a2)
{
  char v3 = a2 & 1;
  sub_270F8(a1, a2 & 1);
  char v4 = sub_20F88(a1, v3);
  sub_26B20(a1, v3);
  switch(v4)
  {
    case 1:
    case 2:
    case 3:
      uint64_t v5 = (void *)sub_38FC0();
      uint64_t v6 = (void *)sub_38FC0();
      id v7 = settingsLocString(v5, v6);

      if (!v7)
      {
        __break(1u);
        goto LABEL_4;
      }
      goto LABEL_9;
    case 4:
      goto LABEL_8;
    case 5:
    case 6:
LABEL_4:
      uint64_t v8 = (void *)sub_38FC0();
      uint64_t v9 = (void *)sub_38FC0();
      id v7 = settingsLocString(v8, v9);

      if (v7) {
        goto LABEL_9;
      }
      __break(1u);
LABEL_6:
      uint64_t v10 = (void *)sub_38FC0();
      uint64_t v11 = (void *)sub_38FC0();
      id v7 = settingsLocString(v10, v11);

      if (!v7)
      {
        __break(1u);
LABEL_8:
        uint64_t v12 = (void *)sub_38FC0();
        uint64_t v13 = (void *)sub_38FC0();
        id v7 = settingsLocString(v12, v13);

        if (!v7)
        {
          __break(1u);
          JUMPOUT(0x293C0);
        }
      }
LABEL_9:
      sub_38FE0();

      return sub_39070();
    default:
      goto LABEL_6;
  }
}

uint64_t sub_293DC@<X0>(uint64_t a1@<X8>)
{
  return sub_27344(*(void *)v1, *(unsigned char *)(v1 + 8), a1);
}

unint64_t sub_293E8()
{
  unint64_t result = qword_544B0;
  if (!qword_544B0)
  {
    sub_24414(&qword_54460);
    sub_29464();
    sub_295F0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_544B0);
  }
  return result;
}

unint64_t sub_29464()
{
  unint64_t result = qword_544B8;
  if (!qword_544B8)
  {
    sub_24414(&qword_54480);
    sub_29504();
    sub_26748(&qword_544D8, &qword_544E0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_544B8);
  }
  return result;
}

unint64_t sub_29504()
{
  unint64_t result = qword_544C0;
  if (!qword_544C0)
  {
    sub_24414(&qword_54478);
    sub_24414(&qword_54468);
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    sub_26748(&qword_544C8, &qword_544D0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_544C0);
  }
  return result;
}

unint64_t sub_295F0()
{
  unint64_t result = qword_544E8;
  if (!qword_544E8)
  {
    sub_24414(&qword_54448);
    sub_26748(&qword_544F0, &qword_54440);
    sub_26748(&qword_544F8, &qword_54500);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_544E8);
  }
  return result;
}

unint64_t sub_296B4()
{
  unint64_t result = qword_54508;
  if (!qword_54508)
  {
    sub_24414(&qword_54438);
    sub_29464();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_54508);
  }
  return result;
}

uint64_t sub_29730@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_38810();
  *a1 = result;
  return result;
}

uint64_t sub_2975C()
{
  return sub_38820();
}

unint64_t sub_2978C()
{
  unint64_t result = qword_54510;
  if (!qword_54510)
  {
    sub_24414(&qword_54408);
    sub_26748(&qword_54418, &qword_54400);
    sub_2985C(&qword_54258, (void (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_54510);
  }
  return result;
}

uint64_t sub_2985C(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_298AC(uint64_t a1@<X8>)
{
  uint64_t v36 = a1;
  uint64_t v1 = sub_383C0();
  uint64_t v32 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  char v3 = (char *)v31 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_22BC4(&qword_53FA8);
  __chkstk_darwin(v4 - 8);
  v31[6] = (char *)v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_22BC4(&qword_545F0);
  uint64_t v34 = *(void *)(v6 - 8);
  uint64_t v35 = v6;
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v33 = sub_22BC4(&qword_545F8);
  __chkstk_darwin(v33);
  uint64_t v10 = (char *)v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = (void *)sub_38FC0();
  uint64_t v12 = (void *)sub_38FC0();
  id v13 = settingsLocString(v11, v12);

  if (v13)
  {
    uint64_t v14 = sub_38FE0();
    uint64_t v16 = v15;

    uint64_t v37 = (void *)v14;
    uint64_t v38 = v16;
    uint64_t v17 = sub_39070();
    v31[4] = v18;
    v31[5] = v17;
    uint64_t v19 = (void *)sub_38FC0();
    uint64_t v20 = (void *)sub_38FC0();
    id v21 = settingsLocString(v19, v20);

    if (v21)
    {
      uint64_t v22 = sub_38FE0();
      uint64_t v24 = v23;

      uint64_t v37 = (void *)v22;
      uint64_t v38 = v24;
      uint64_t v25 = sub_39070();
      v31[1] = v26;
      v31[2] = v25;
      uint64_t v31[3] = v31;
      uint64_t v27 = __chkstk_darwin(v25);
      __chkstk_darwin(v27);
      uint64_t v37 = _swiftEmptyArrayStorage;
      sub_2C13C((unint64_t *)&qword_53FC8, (void (*)(uint64_t))&type metadata accessor for OnboardingTraits);
      sub_22BC4(&qword_53FD0);
      sub_26748(&qword_53FD8, &qword_53FD0);
      sub_391F0();
      sub_38EE0();
      (*(void (**)(char *, uint64_t))(v32 + 8))(v3, v1);
      sub_22BC4(&qword_54600);
      sub_22BC4(&qword_54608);
      sub_2BF50();
      sub_26748(&qword_54640, &qword_54608);
      sub_38380();
      uint64_t v29 = v34;
      uint64_t v28 = v35;
      (*(void (**)(char *, char *, uint64_t))(v34 + 16))(v10, v8, v35);
      uint64_t v30 = &v10[*(int *)(v33 + 36)];
      *(void *)uint64_t v30 = 0;
      *((void *)v30 + 1) = 0;
      *((void *)v30 + 2) = nullsub_6;
      *((void *)v30 + 3) = 0;
      (*(void (**)(char *, uint64_t))(v29 + 8))(v8, v28);
      sub_265FC((uint64_t)v10, v36, &qword_545F8);
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

void sub_29E20(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for VCAudioDonationView();
  uint64_t v49 = *(void *)(v4 - 8);
  uint64_t v5 = *(void *)(v49 + 64);
  __chkstk_darwin(v4);
  uint64_t v50 = (uint64_t)&v47 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_22BC4(&qword_54080);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = sub_383D0();
  uint64_t v9 = *(void *)(v51 - 8);
  __chkstk_darwin(v51);
  uint64_t v11 = (char *)&v47 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v48 = sub_22BC4(&qword_54620);
  __chkstk_darwin(v48);
  id v53 = (char *)&v47 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_22BC4(&qword_54600);
  __chkstk_darwin(v13);
  uint64_t v54 = (uint64_t)&v47 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = self;
  uint64_t v16 = (void *)sub_38FC0();
  id v17 = [v15 linkWithBundleIdentifier:v16];

  uint64_t v55 = (int *)v4;
  uint64_t v56 = a2;
  uint64_t v52 = v13;
  if (v17)
  {
    id v18 = [v17 bundle];

    id v19 = [v18 privacyFlow];
    if (!v19)
    {
      __break(1u);
      goto LABEL_9;
    }
    id v20 = [v19 localizedButtonTitle];

    if (v20)
    {
      sub_38FE0();

LABEL_7:
      uint64_t v27 = sub_38510();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v8, 1, 1, v27);
      uint64_t v28 = v50;
      sub_2C09C(a1, v50);
      uint64_t v29 = a1;
      unint64_t v30 = (*(unsigned __int8 *)(v49 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v49 + 80);
      uint64_t v31 = swift_allocObject();
      sub_2B61C(v28, v31 + v30);
      sub_383E0();
      char v32 = sub_38AE0();
      uint64_t v33 = (uint64_t)v53;
      uint64_t v34 = v51;
      (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v53, v11, v51);
      uint64_t v35 = v33 + *(int *)(v48 + 36);
      *(unsigned char *)uint64_t v35 = v32;
      *(_OWORD *)(v35 + 8) = 0u;
      *(_OWORD *)(v35 + 24) = 0u;
      *(unsigned char *)(v35 + 40) = 1;
      (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v34);
      uint64_t v55 = (int *)*(id *)(v29 + v55[6]);
      sub_38F40();
      sub_38600();
      uint64_t v36 = v57;
      char v37 = v58;
      uint64_t v38 = v59;
      char v39 = v60;
      uint64_t v41 = v61;
      uint64_t v40 = v62;
      uint64_t v42 = sub_38F40();
      uint64_t v44 = v43;
      uint64_t v45 = v54;
      sub_2C3B8(v33, v54);
      uint64_t v46 = v45 + *(int *)(v52 + 36);
      *(void *)uint64_t v46 = v55;
      *(void *)(v46 + 8) = v36;
      *(unsigned char *)(v46 + 16) = v37;
      *(void *)(v46 + 24) = v38;
      *(unsigned char *)(v46 + 32) = v39;
      *(void *)(v46 + 40) = v41;
      *(void *)(v46 + 48) = v40;
      *(void *)(v46 + 56) = v42;
      *(void *)(v46 + 64) = v44;
      sub_265A0(v33, &qword_54620);
      sub_265FC(v45, v56, &qword_54600);
      return;
    }
  }
  id v21 = (void *)sub_38FC0();
  uint64_t v22 = (void *)sub_38FC0();
  id v23 = settingsLocString(v21, v22);

  if (v23)
  {
    uint64_t v24 = sub_38FE0();
    uint64_t v26 = v25;

    uint64_t v57 = v24;
    uint64_t v58 = v26;
    sub_39070();
    goto LABEL_7;
  }
LABEL_9:
  __break(1u);
}

void sub_2A3B0(uint64_t a1)
{
  uint64_t v2 = (void *)sub_38FC0();
  id v3 = [self presenterForPrivacySplashWithIdentifier:v2];

  if (v3)
  {
    [v3 setPresentingViewController:*(void *)(a1 + *(int *)(type metadata accessor for VCAudioDonationView() + 24))];
    [v3 present];
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_2A474@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = sub_38940();
  *(void *)(a2 + 8) = 0;
  *(unsigned char *)(a2 + 16) = 1;
  uint64_t v4 = sub_22BC4(&qword_54648);
  sub_2A514(a1, (char *)(a2 + *(int *)(v4 + 44)));
  uint64_t v5 = sub_22BC4(&qword_54608);
  uint64_t v6 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56);

  return v6(a2, 0, 1, v5);
}

uint64_t sub_2A514@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v61 = a2;
  uint64_t v3 = sub_38A30();
  uint64_t v4 = *(void (**)(char *, uint64_t))(v3 - 8);
  uint64_t v58 = v3;
  uint64_t v59 = v4;
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v49 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for VCAudioDonationView();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  __chkstk_darwin(v7 - 8);
  uint64_t v10 = (char *)&v49 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v64 = sub_22BC4(&qword_540F0);
  uint64_t v52 = *(void *)(v64 - 8);
  uint64_t v11 = v52;
  uint64_t v12 = __chkstk_darwin(v64);
  char v60 = (char *)&v49 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v49 - v14;
  uint64_t v57 = sub_22BC4(&qword_540F8);
  uint64_t v63 = *(void *)(v57 - 8);
  uint64_t v16 = __chkstk_darwin(v57);
  id v18 = (char *)&v49 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  uint64_t v62 = (char *)&v49 - v19;
  uint64_t v51 = a1;
  sub_2C09C(a1, (uint64_t)v10);
  uint64_t v20 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v21 = (v20 + 16) & ~v20;
  uint64_t v56 = v21 + v9;
  uint64_t v55 = v20 | 7;
  uint64_t v22 = swift_allocObject();
  sub_2B61C((uint64_t)v10, v22 + v21);
  uint64_t v66 = a1;
  uint64_t v54 = sub_22BC4(&qword_54120);
  unint64_t v53 = sub_256C4();
  sub_38E90();
  sub_38A20();
  sub_26748(&qword_54140, &qword_540F0);
  sub_2C13C(&qword_54148, (void (*)(uint64_t))&type metadata accessor for BorderedProminentButtonStyle);
  id v23 = v18;
  uint64_t v24 = v64;
  uint64_t v25 = v58;
  sub_38C10();
  (*((void (**)(char *, uint64_t))v59 + 1))(v6, v25);
  uint64_t v26 = *(void (**)(char *, uint64_t))(v11 + 8);
  uint64_t v58 = v11 + 8;
  uint64_t v59 = v26;
  uint64_t v27 = v15;
  v26(v15, v24);
  uint64_t v29 = v62;
  uint64_t v28 = v63;
  unint64_t v30 = v23;
  uint64_t v31 = v57;
  (*(void (**)(char *, char *, uint64_t))(v63 + 32))(v62, v23, v57);
  uint64_t v32 = v51;
  sub_2C09C(v51, (uint64_t)v10);
  uint64_t v33 = swift_allocObject();
  sub_2B61C((uint64_t)v10, v33 + v21);
  uint64_t v65 = v32;
  sub_38E90();
  sub_38F40();
  sub_38600();
  uint64_t v56 = v67;
  LODWORD(v55) = v68;
  uint64_t v54 = v69;
  LODWORD(v53) = v70;
  uint64_t v51 = v71;
  uint64_t v50 = v72;
  uint64_t v34 = *(void (**)(char *, char *, uint64_t))(v28 + 16);
  uint64_t v35 = v30;
  uint64_t v36 = v29;
  uint64_t v37 = v31;
  v34(v30, v36, v31);
  uint64_t v38 = *(void (**)(char *, char *, uint64_t))(v52 + 16);
  char v39 = v60;
  uint64_t v40 = v15;
  uint64_t v41 = v64;
  v38(v60, v40, v64);
  uint64_t v42 = v61;
  v34(v61, v35, v37);
  uint64_t v43 = sub_22BC4(&qword_54650);
  v38(&v42[*(int *)(v43 + 48)], v39, v41);
  uint64_t v44 = &v42[*(int *)(v43 + 64)];
  *(void *)uint64_t v44 = 0;
  v44[8] = 1;
  *((void *)v44 + 2) = v56;
  v44[24] = v55;
  *((void *)v44 + 4) = v54;
  v44[40] = v53;
  uint64_t v45 = v50;
  *((void *)v44 + 6) = v51;
  *((void *)v44 + 7) = v45;
  uint64_t v46 = v59;
  v59(v27, v41);
  uint64_t v47 = *(void (**)(char *, uint64_t))(v63 + 8);
  v47(v62, v37);
  v46(v39, v41);
  return ((uint64_t (*)(char *, uint64_t))v47)(v35, v37);
}

void sub_2AB94(uint64_t a1@<X8>)
{
  uint64_t v2 = (void *)sub_38FC0();
  uint64_t v3 = (void *)sub_38FC0();
  id v4 = settingsLocString(v2, v3);

  if (v4)
  {
    sub_38FE0();

    sub_39070();
    sub_2447C();
    uint64_t v5 = sub_38BE0();
    uint64_t v7 = v6;
    char v9 = v8 & 1;
    uint64_t v10 = sub_38BB0();
    uint64_t v12 = v11;
    uint64_t v14 = v13;
    char v16 = v15 & 1;
    sub_250E4(v5, v7, v9);
    swift_bridgeObjectRelease();
    *(void *)a1 = 0;
    *(unsigned char *)(a1 + 8) = 1;
    *(void *)(a1 + 16) = v10;
    *(void *)(a1 + 24) = v12;
    *(unsigned char *)(a1 + 32) = v16;
    *(void *)(a1 + 40) = v14;
    *(void *)(a1 + 48) = 0;
    *(unsigned char *)(a1 + 56) = 1;
    sub_24ECC(v10, v12, v16);
    swift_bridgeObjectRetain();
    sub_250E4(v10, v12, v16);
    swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
}

id sub_2AD28()
{
  uint64_t v0 = sub_38630();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  _AXSSetAudioDonationSiriImprovementEnabled();
  id result = [self sharedPreferences];
  if (result)
  {
    uint64_t v5 = result;
    [result setDonationTipKitSeen:1];

    uint64_t v6 = CFNotificationCenterGetDarwinNotifyCenter();
    uint64_t v7 = (__CFString *)sub_38FC0();
    CFNotificationCenterPostNotification(v6, v7, 0, 0, 1u);

    sub_21194((uint64_t)v3);
    sub_38620();
    return (id)(*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2AE98@<X0>(uint64_t a1@<X0>, void (*a2)(uint64_t *__return_ptr, uint64_t)@<X1>, uint64_t a3@<X8>)
{
  uint64_t v19 = sub_38880();
  a2(&v20, a1);
  uint64_t v6 = v20;
  char v7 = v21;
  uint64_t v8 = v22;
  uint64_t v9 = v23;
  char v10 = v24;
  uint64_t v11 = v25;
  uint64_t v12 = v26;
  char v13 = v27;
  LOBYTE(a2) = sub_38B40();
  uint64_t result = sub_38520();
  *(void *)a3 = v19;
  *(void *)(a3 + 8) = 0;
  *(unsigned char *)(a3 + 16) = 1;
  *(void *)(a3 + 24) = v6;
  *(unsigned char *)(a3 + 32) = v7;
  *(void *)(a3 + 40) = v8;
  *(void *)(a3 + 48) = v9;
  *(unsigned char *)(a3 + 56) = v10;
  *(void *)(a3 + 64) = v11;
  *(void *)(a3 + 72) = v12;
  *(unsigned char *)(a3 + 80) = v13;
  *(unsigned char *)(a3 + 88) = (_BYTE)a2;
  *(void *)(a3 + 96) = v15;
  *(void *)(a3 + 104) = v16;
  *(void *)(a3 + 112) = v17;
  *(void *)(a3 + 120) = v18;
  *(unsigned char *)(a3 + 128) = 0;
  return result;
}

void sub_2AF78(uint64_t a1@<X8>)
{
  uint64_t v2 = (void *)sub_38FC0();
  uint64_t v3 = (void *)sub_38FC0();
  id v4 = settingsLocString(v2, v3);

  if (v4)
  {
    sub_38FE0();

    sub_39070();
    sub_2447C();
    uint64_t v5 = sub_38BE0();
    uint64_t v7 = v6;
    char v9 = v8 & 1;
    uint64_t v10 = sub_38BB0();
    uint64_t v12 = v11;
    uint64_t v14 = v13;
    char v16 = v15 & 1;
    sub_250E4(v5, v7, v9);
    swift_bridgeObjectRelease();
    *(void *)a1 = 0;
    *(unsigned char *)(a1 + 8) = 1;
    *(void *)(a1 + 16) = v10;
    *(void *)(a1 + 24) = v12;
    *(unsigned char *)(a1 + 32) = v16;
    *(void *)(a1 + 40) = v14;
    *(void *)(a1 + 48) = 0;
    *(unsigned char *)(a1 + 56) = 1;
    sub_24ECC(v10, v12, v16);
    swift_bridgeObjectRetain();
    sub_250E4(v10, v12, v16);
    swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
}

uint64_t static VCAudioDonationViewBridge.makeViewController()()
{
  uint64_t v0 = type metadata accessor for VCAudioDonationView();
  uint64_t v1 = v0 - 8;
  uint64_t v2 = __chkstk_darwin(v0);
  id v4 = (uint64_t *)((char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v11 - v5;
  *id v4 = swift_getKeyPath();
  sub_22BC4(&qword_53DE0);
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = (uint64_t *)((char *)v4 + *(int *)(v1 + 28));
  void *v7 = 0xD000000000000024;
  v7[1] = 0x8000000000043D70;
  uint64_t v8 = *(int *)(v1 + 32);
  *(uint64_t *)((char *)v4 + v8) = (uint64_t)[objc_allocWithZone((Class)UIViewController) init];
  sub_2B61C((uint64_t)v4, (uint64_t)v6);
  id v9 = objc_allocWithZone((Class)sub_22BC4(&qword_54518));
  return sub_38970();
}

uint64_t type metadata accessor for VCAudioDonationView()
{
  uint64_t result = qword_545A8;
  if (!qword_545A8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

id CACPhoneticVocabularyNavigationViewWrapper.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

id VCAudioDonationViewBridge.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for VCAudioDonationViewBridge();
  return objc_msgSendSuper2(&v2, "init");
}

id VCAudioDonationViewBridge.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for VCAudioDonationViewBridge();
  return objc_msgSendSuper2(&v2, "dealloc");
}

id sub_2B494()
{
  return *v0;
}

uint64_t sub_2B4A8()
{
  return sub_38A60();
}

uint64_t sub_2B4E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_2C538();

  return static UIViewControllerRepresentable._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_2B548(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_2C538();

  return static UIViewControllerRepresentable._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

void sub_2B5AC()
{
}

uint64_t sub_2B5D4()
{
  return sub_387E0();
}

uint64_t sub_2B5F8()
{
  return sub_387E0();
}

uint64_t sub_2B61C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for VCAudioDonationView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for VCAudioDonationViewBridge()
{
  return self;
}

uint64_t *sub_2B6A4(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    sub_22BC4(&qword_53DE0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_38630();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = *(int *)(a3 + 20);
    uint64_t v10 = *(int *)(a3 + 24);
    uint64_t v11 = (uint64_t *)((char *)a1 + v9);
    uint64_t v12 = (uint64_t *)((char *)a2 + v9);
    uint64_t v13 = v12[1];
    void *v11 = *v12;
    v11[1] = v13;
    uint64_t v14 = *(void **)((char *)a2 + v10);
    *(uint64_t *)((char *)a1 + v10) = (uint64_t)v14;
    swift_bridgeObjectRetain();
    id v15 = v14;
  }
  return a1;
}

void sub_2B7D8(uint64_t a1, uint64_t a2)
{
  sub_22BC4(&qword_53DE0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_38630();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  swift_bridgeObjectRelease();
  int v5 = *(void **)(a1 + *(int *)(a2 + 24));
}

void *sub_2B888(void *a1, void *a2, uint64_t a3)
{
  sub_22BC4(&qword_53DE0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_38630();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = (void *)((char *)a1 + v7);
  uint64_t v10 = (void *)((char *)a2 + v7);
  uint64_t v11 = v10[1];
  *uint64_t v9 = *v10;
  v9[1] = v11;
  uint64_t v12 = *(void **)((char *)a2 + v8);
  *(void *)((char *)a1 + v8) = v12;
  swift_bridgeObjectRetain();
  id v13 = v12;
  return a1;
}

void *sub_2B96C(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_265A0((uint64_t)a1, &qword_53DE0);
    sub_22BC4(&qword_53DE0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_38630();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)((char *)a1 + v7);
  uint64_t v9 = (void *)((char *)a2 + v7);
  void *v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = *(void **)((char *)a2 + v10);
  uint64_t v12 = *(void **)((char *)a1 + v10);
  *(void *)((char *)a1 + v10) = v11;
  id v13 = v11;

  return a1;
}

char *sub_2BA88(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_22BC4(&qword_53DE0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_38630();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = *(int *)(a3 + 24);
  *(_OWORD *)&a1[*(int *)(a3 + 20)] = *(_OWORD *)&a2[*(int *)(a3 + 20)];
  *(void *)&a1[v8] = *(void *)&a2[v8];
  return a1;
}

char *sub_2BB64(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_265A0((uint64_t)a1, &qword_53DE0);
    uint64_t v6 = sub_22BC4(&qword_53DE0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_38630();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
  }
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v12 = *(void *)v10;
  uint64_t v11 = *((void *)v10 + 1);
  *(void *)uint64_t v9 = v12;
  *((void *)v9 + 1) = v11;
  swift_bridgeObjectRelease();
  uint64_t v13 = *(int *)(a3 + 24);
  uint64_t v14 = *(void **)&a1[v13];
  *(void *)&a1[v13] = *(void *)&a2[v13];

  return a1;
}

uint64_t sub_2BC74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_2BC88);
}

uint64_t sub_2BC88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_22BC4(&qword_54548);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_2BD50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_2BD64);
}

uint64_t sub_2BD64(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_22BC4(&qword_54548);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  }
  return result;
}

void sub_2BE28()
{
  sub_2BECC();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_2BECC()
{
  if (!qword_545B8)
  {
    sub_38630();
    unint64_t v0 = sub_38590();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_545B8);
    }
  }
}

uint64_t sub_2BF24()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_2BF40(uint64_t a1@<X8>)
{
  sub_29E20(*(void *)(v1 + 16), a1);
}

uint64_t sub_2BF48@<X0>(uint64_t a1@<X8>)
{
  return sub_2A474(*(void *)(v1 + 16), a1);
}

unint64_t sub_2BF50()
{
  unint64_t result = qword_54610;
  if (!qword_54610)
  {
    sub_24414(&qword_54600);
    sub_2BFF0();
    sub_26748(&qword_54630, &qword_54638);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_54610);
  }
  return result;
}

unint64_t sub_2BFF0()
{
  unint64_t result = qword_54618;
  if (!qword_54618)
  {
    sub_24414(&qword_54620);
    sub_2C13C(&qword_54628, (void (*)(uint64_t))&type metadata accessor for AXOnboardingButton);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_54618);
  }
  return result;
}

uint64_t sub_2C09C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for VCAudioDonationView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

id sub_2C104()
{
  return sub_2C190();
}

uint64_t sub_2C10C@<X0>(uint64_t a1@<X8>)
{
  return sub_2AE98(*(void *)(v1 + 16), (void (*)(uint64_t *__return_ptr, uint64_t))sub_2AB94, a1);
}

uint64_t sub_2C13C(unint64_t *a1, void (*a2)(uint64_t))
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

id sub_2C188()
{
  return sub_2C190();
}

id sub_2C190()
{
  return sub_2AD28();
}

uint64_t sub_2C1F4@<X0>(uint64_t a1@<X8>)
{
  return sub_2AE98(*(void *)(v1 + 16), (void (*)(uint64_t *__return_ptr, uint64_t))sub_2AF78, a1);
}

uint64_t sub_2C228()
{
  uint64_t v1 = type metadata accessor for VCAudioDonationView();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  sub_22BC4(&qword_53DE0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_38630();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v0 + v3, v5);
  }
  else
  {
    swift_release();
  }
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

void sub_2C358()
{
  uint64_t v1 = *(void *)(type metadata accessor for VCAudioDonationView() - 8);
  uint64_t v2 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));

  sub_2A3B0(v2);
}

uint64_t sub_2C3B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_22BC4(&qword_54620);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

ValueMetadata *type metadata accessor for PrivacyPresenterBridge()
{
  return &type metadata for PrivacyPresenterBridge;
}

unint64_t sub_2C434()
{
  unint64_t result = qword_54658;
  if (!qword_54658)
  {
    sub_24414(&qword_545F8);
    sub_26748(&qword_54660, &qword_545F0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_54658);
  }
  return result;
}

void *sub_2C4D4()
{
  return &protocol witness table for Never;
}

unint64_t sub_2C4E4()
{
  unint64_t result = qword_54668;
  if (!qword_54668)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_54668);
  }
  return result;
}

unint64_t sub_2C538()
{
  unint64_t result = qword_54670;
  if (!qword_54670)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_54670);
  }
  return result;
}

id CACPhoneticVocabularyNavigationViewWrapper.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CACPhoneticVocabularyNavigationViewWrapper();
  return objc_msgSendSuper2(&v2, "init");
}

id CACPhoneticVocabularyNavigationViewWrapper.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CACPhoneticVocabularyNavigationViewWrapper();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t _s20VoiceControlSettings42CACPhoneticVocabularyNavigationViewWrapperC6create6locale17completionHandlerSo16UIViewControllerCSS_yyctFZ_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for CACPhoneticVocabularyNavigationView();
  uint64_t v9 = (int *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v20 - v13;
  *(void *)uint64_t v12 = sub_36398;
  *((void *)v12 + 1) = 0;
  v12[16] = 0;
  id v15 = (uint64_t *)&v12[v9[7]];
  uint64_t *v15 = swift_getKeyPath();
  sub_22BC4(&qword_53DE0);
  swift_storeEnumTagMultiPayload();
  char v16 = &v12[v9[9]];
  uint64_t v17 = &v12[v9[8]];
  *(void *)uint64_t v17 = a1;
  *((void *)v17 + 1) = a2;
  *(void *)char v16 = a3;
  *((void *)v16 + 1) = a4;
  sub_2C8B8((uint64_t)v12, (uint64_t)v14);
  sub_2C91C((uint64_t)v14, (uint64_t)v12);
  objc_allocWithZone((Class)sub_22BC4(&qword_546A0));
  swift_bridgeObjectRetain();
  swift_retain();
  uint64_t v18 = sub_38970();
  sub_2C980((uint64_t)v14);
  return v18;
}

uint64_t type metadata accessor for CACPhoneticVocabularyNavigationViewWrapper()
{
  return self;
}

uint64_t sub_2C874()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_2C8AC()
{
  return sub_2DF48(*(void *)(v0 + 16));
}

uint64_t sub_2C8B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CACPhoneticVocabularyNavigationView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2C91C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CACPhoneticVocabularyNavigationView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2C980(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for CACPhoneticVocabularyNavigationView();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

BOOL static CACPhoneticVocabularyCoordinator.Stage.__derived_enum_equals(_:_:)(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

void CACPhoneticVocabularyCoordinator.Stage.hash(into:)(uint64_t a1, char a2)
{
}

Swift::Int CACPhoneticVocabularyCoordinator.Stage.hashValue.getter(char a1)
{
  return sub_392C0();
}

BOOL sub_2CA5C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t property wrapper backing initializer of CACPhoneticVocabularyCoordinator.navigationPath(uint64_t a1)
{
  return sub_2CAA0(a1, &qword_546A8);
}

uint64_t sub_2CA80()
{
  return sub_2CAF8();
}

uint64_t property wrapper backing initializer of CACPhoneticVocabularyCoordinator.ipaCandidates(uint64_t a1)
{
  return sub_2CAA0(a1, &qword_546B0);
}

uint64_t sub_2CAA0(uint64_t a1, uint64_t *a2)
{
  return sub_38440();
}

uint64_t sub_2CAE4()
{
  return sub_2CAF8();
}

uint64_t sub_2CAF8()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_38460();
  swift_release();
  swift_release();
  return v1;
}

uint64_t (*variable initialization expression of CACPhoneticVocabularyNavigationView.completionHandler())()
{
  return nullsub_6;
}

uint64_t CACPhoneticVocabularyCoordinator.dismissEnrollmentFlow.getter()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC20VoiceControlSettings32CACPhoneticVocabularyCoordinator_dismissEnrollmentFlow);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_retain();
  return v2;
}

uint64_t CACPhoneticVocabularyCoordinator.dismissEnrollmentFlow.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + OBJC_IVAR____TtC20VoiceControlSettings32CACPhoneticVocabularyCoordinator_dismissEnrollmentFlow);
  swift_beginAccess();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return swift_release();
}

uint64_t (*CACPhoneticVocabularyCoordinator.dismissEnrollmentFlow.modify())()
{
  return j__swift_endAccess;
}

Swift::Void __swiftcall CACPhoneticVocabularyCoordinator.saveName(name:)(Swift::String name)
{
  uint64_t v2 = v1;
  Swift::String v11 = name;
  uint64_t v3 = sub_38330();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_38320();
  sub_2447C();
  uint64_t v7 = sub_391D0();
  uint64_t v9 = v8;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  uint64_t v10 = (uint64_t *)(v2 + OBJC_IVAR____TtC20VoiceControlSettings32CACPhoneticVocabularyCoordinator_customWord);
  uint64_t *v10 = v7;
  v10[1] = v9;
  swift_bridgeObjectRelease();
}

Swift::Void __swiftcall CACPhoneticVocabularyCoordinator.saveIPAs(_:)(Swift::OpaquePointer a1)
{
  int64_t v2 = *((void *)a1._rawValue + 2);
  uint64_t v3 = _swiftEmptyArrayStorage;
  if (v2)
  {
    uint64_t v20 = _swiftEmptyArrayStorage;
    sub_2D81C(0, v2, 0);
    uint64_t isUniquelyReferenced_nonNull_native = sub_38330();
    uint64_t v17 = isUniquelyReferenced_nonNull_native;
    uint64_t v6 = *(void *)(*(void *)(isUniquelyReferenced_nonNull_native - 8) + 64);
    uint64_t v7 = (void (**)(char *, uint64_t))(*(void *)(isUniquelyReferenced_nonNull_native - 8) + 8);
    uint64_t v8 = (uint64_t *)((char *)a1._rawValue + 40);
    do
    {
      uint64_t v9 = *v8;
      uint64_t v18 = *(v8 - 1);
      uint64_t v19 = v9;
      __chkstk_darwin(isUniquelyReferenced_nonNull_native);
      swift_bridgeObjectRetain();
      sub_38320();
      sub_2447C();
      uint64_t v10 = sub_391D0();
      uint64_t v12 = v11;
      (*v7)((char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v17);
      swift_bridgeObjectRelease();
      uint64_t v3 = v20;
      uint64_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        uint64_t isUniquelyReferenced_nonNull_native = sub_2D81C(0, v3[2] + 1, 1);
        uint64_t v3 = v20;
      }
      unint64_t v14 = v3[2];
      unint64_t v13 = v3[3];
      if (v14 >= v13 >> 1)
      {
        uint64_t isUniquelyReferenced_nonNull_native = sub_2D81C(v13 > 1, v14 + 1, 1);
        uint64_t v3 = v20;
      }
      v8 += 2;
      v3[2] = v14 + 1;
      id v15 = &v3[2 * v14];
      v15[4] = v10;
      v15[5] = v12;
      --v2;
    }
    while (v2);
    uint64_t v1 = v16[1];
  }
  *(void *)(v1 + OBJC_IVAR____TtC20VoiceControlSettings32CACPhoneticVocabularyCoordinator_ipas) = v3;
  swift_bridgeObjectRelease();
}

Swift::Void __swiftcall CACPhoneticVocabularyCoordinator.navigateToRecordAudio()()
{
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v0 = (void (*)(uint64_t *, void))sub_38450();
  int64_t v2 = v1;
  uint64_t v3 = *v1;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  void *v2 = v3;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v3 = sub_2D720(0, v3[2] + 1, 1, v3);
    void *v2 = v3;
  }
  unint64_t v6 = v3[2];
  unint64_t v5 = v3[3];
  if (v6 >= v5 >> 1)
  {
    uint64_t v3 = sub_2D720((void *)(v5 > 1), v6 + 1, 1, v3);
    void *v2 = v3;
  }
  v3[2] = v6 + 1;
  *((unsigned char *)v3 + v6 + 32) = 1;
  v0(&v7, 0);
  swift_release();
  swift_release();
}

uint64_t CACPhoneticVocabularyCoordinator.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC20VoiceControlSettings32CACPhoneticVocabularyCoordinator__navigationPath;
  uint64_t v2 = sub_22BC4(&qword_546C0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC20VoiceControlSettings32CACPhoneticVocabularyCoordinator__ipaCandidates;
  uint64_t v4 = sub_22BC4(&qword_546D0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return v0;
}

uint64_t CACPhoneticVocabularyCoordinator.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC20VoiceControlSettings32CACPhoneticVocabularyCoordinator__navigationPath;
  uint64_t v2 = sub_22BC4(&qword_546C0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC20VoiceControlSettings32CACPhoneticVocabularyCoordinator__ipaCandidates;
  uint64_t v4 = sub_22BC4(&qword_546D0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v5 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v6 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v5, v6);
}

uint64_t sub_2D2BC()
{
  uint64_t v1 = sub_22BC4(&qword_546D0);
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_22BC4(&qword_546C0);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = v0 + OBJC_IVAR____TtC20VoiceControlSettings32CACPhoneticVocabularyCoordinator__navigationPath;
  id v15 = _swiftEmptyArrayStorage;
  sub_22BC4(&qword_546A8);
  sub_38440();
  (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(v9, v8, v5);
  uint64_t v10 = v0 + OBJC_IVAR____TtC20VoiceControlSettings32CACPhoneticVocabularyCoordinator__ipaCandidates;
  id v15 = _swiftEmptyArrayStorage;
  sub_22BC4(&qword_546B0);
  sub_38440();
  (*(void (**)(uint64_t, char *, uint64_t))(v2 + 32))(v10, v4, v1);
  uint64_t v11 = (void *)(v0 + OBJC_IVAR____TtC20VoiceControlSettings32CACPhoneticVocabularyCoordinator_customWord);
  void *v11 = 0;
  v11[1] = 0xE000000000000000;
  *(void *)(v0 + OBJC_IVAR____TtC20VoiceControlSettings32CACPhoneticVocabularyCoordinator_ipas) = _swiftEmptyArrayStorage;
  uint64_t v12 = (void *)(v0 + OBJC_IVAR____TtC20VoiceControlSettings32CACPhoneticVocabularyCoordinator_dismissEnrollmentFlow);
  void *v12 = nullsub_6;
  v12[1] = 0;
  return v0;
}

uint64_t sub_2D4D4@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for CACPhoneticVocabularyCoordinator();
  uint64_t result = sub_38430();
  *a1 = result;
  return result;
}

uint64_t sub_2D514@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_38460();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_2D594()
{
  return sub_38470();
}

char *sub_2D610(char *result, int64_t a2, char a3, char *a4)
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
      sub_22BC4(&qword_54160);
      uint64_t v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 4);
      unint64_t v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
      unint64_t v13 = (char *)&_swiftEmptyArrayStorage + 32;
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
    sub_2DD64(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_2D720(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    int64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  int64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      int64_t v7 = a2;
    }
LABEL_8:
    int64_t v8 = a4[2];
    if (v7 <= v8) {
      int64_t v9 = a4[2];
    }
    else {
      int64_t v9 = v7;
    }
    if (v9)
    {
      sub_22BC4(&qword_54880);
      uint64_t v10 = (void *)swift_allocObject();
      size_t v11 = j__malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * v11 - 64;
      uint64_t v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= (void *)((char *)a4 + v8 + 32)) {
          memmove(v12, a4 + 4, v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = _swiftEmptyArrayStorage;
      uint64_t v12 = &_swiftEmptyArrayStorage[4];
      if (result) {
        goto LABEL_13;
      }
    }
    sub_2DE60(0, v8, (char *)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_2D81C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_2DBF8(a1, a2, a3, *v3);
  void *v3 = (char *)result;
  return result;
}

unint64_t sub_2D848()
{
  unint64_t result = qword_546D8;
  if (!qword_546D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_546D8);
  }
  return result;
}

void *sub_2D89C()
{
  return &protocol witness table for ObservableObjectPublisher;
}

uint64_t sub_2D8A8()
{
  return type metadata accessor for CACPhoneticVocabularyCoordinator();
}

uint64_t type metadata accessor for CACPhoneticVocabularyCoordinator()
{
  uint64_t result = qword_54708;
  if (!qword_54708) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_2D8FC()
{
  sub_2DA08(319, &qword_54718, &qword_546A8);
  if (v0 <= 0x3F)
  {
    sub_2DA08(319, (unint64_t *)&unk_54720, &qword_546B0);
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

void sub_2DA08(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  if (!*a2)
  {
    sub_24414(a3);
    unint64_t v4 = sub_38480();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t getEnumTagSinglePayload for CACPhoneticVocabularyCoordinator.Stage(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
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
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for CACPhoneticVocabularyCoordinator.Stage(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *uint64_t result = a2 + 1;
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
        JUMPOUT(0x2DBB4);
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
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

unsigned char *sub_2DBDC(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for CACPhoneticVocabularyCoordinator.Stage()
{
  return &type metadata for CACPhoneticVocabularyCoordinator.Stage;
}

uint64_t sub_2DBF8(char a1, int64_t a2, char a3, char *a4)
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
    sub_22BC4(&qword_54160);
    uint64_t v10 = (char *)swift_allocObject();
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
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  unint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_39260();
  __break(1u);
  return result;
}

uint64_t sub_2DD64(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_39260();
  __break(1u);
  return result;
}

char *sub_2DE60(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  size_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = (char *)(a4 + a1 + 32);
    unint64_t v6 = &__dst[v4];
    if (v5 >= &__dst[v4] || &v5[v4] <= __dst)
    {
      memcpy(__dst, v5, v4);
      return v6;
    }
  }
  uint64_t result = (char *)sub_39260();
  __break(1u);
  return result;
}

uint64_t sub_2DF48(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 16))();
}

uint64_t AXInstructionalCellContentViewBridge.makeContentCellView(title:image:imageIgnoresInvertColors:description:linkTitle:linkCallback:closeCallback:)(uint64_t a1, uint64_t a2, void *a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  return sub_30DF4(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12);
}

id AXInstructionalCellContentViewBridge.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AXInstructionalCellContentViewBridge();
  return objc_msgSendSuper2(&v2, "init");
}

id AXInstructionalCellContentViewBridge.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AXInstructionalCellContentViewBridge();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_2E198@<X0>(uint64_t *a1@<X8>)
{
  FunctionReplacement = (uint64_t (*)(void))swift_getFunctionReplacement();
  if (FunctionReplacement)
  {
    return FunctionReplacement();
  }
  else
  {
    uint64_t v5 = sub_38930();
    uint64_t v123 = &v81;
    uint64_t v118 = *(void *)(v5 - 8);
    uint64_t v119 = v5;
    __chkstk_darwin(v5);
    uint64_t v114 = (char *)&v81 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v7 = sub_389F0();
    uint64_t v122 = &v81;
    uint64_t v107 = *(void *)(v7 - 8);
    uint64_t v108 = v7;
    __chkstk_darwin(v7);
    uint64_t v105 = (char *)&v81 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v9 = sub_38740();
    uint64_t v121 = &v81;
    uint64_t v95 = v9 - 8;
    __chkstk_darwin(v9 - 8);
    uint64_t v93 = (char *)&v81 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v87 = sub_38580();
    uint64_t v120 = &v81;
    uint64_t v11 = *(void *)(v87 - 8);
    uint64_t v12 = __chkstk_darwin(v87);
    char v85 = (char *)&v81 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v117 = &v81;
    __chkstk_darwin(v12);
    uint64_t v84 = (uint64_t)&v81 - v14;
    uint64_t v15 = sub_22BC4(&qword_54970);
    uint64_t v116 = &v81;
    uint64_t v16 = __chkstk_darwin(v15 - 8);
    uint64_t v18 = (char *)&v81 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v115 = &v81;
    __chkstk_darwin(v16);
    uint64_t v20 = (char *)&v81 - v19;
    uint64_t v21 = sub_22BC4(&qword_54978);
    uint64_t v113 = &v81;
    __chkstk_darwin(v21 - 8);
    uint64_t v23 = (char *)&v81 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v24 = sub_22BC4(&qword_54980);
    uint64_t v112 = &v81;
    uint64_t v83 = v24 - 8;
    __chkstk_darwin(v24 - 8);
    uint64_t v111 = a1;
    uint64_t v26 = (char *)&v81 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v86 = sub_22BC4(&qword_54988);
    uint64_t v110 = &v81;
    __chkstk_darwin(v86);
    uint64_t v28 = (char *)&v81 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v94 = sub_22BC4(&qword_54990);
    uint64_t v109 = &v81;
    uint64_t v96 = *(void *)(v94 - 8);
    __chkstk_darwin(v94);
    uint64_t v88 = (char *)&v81 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v97 = sub_22BC4(&qword_54998);
    uint64_t v106 = &v81;
    uint64_t v100 = *(void *)(v97 - 8);
    __chkstk_darwin(v97);
    uint64_t v89 = (char *)&v81 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v98 = sub_22BC4(&qword_549A0);
    uint64_t v104 = &v81;
    uint64_t v31 = __chkstk_darwin(v98);
    uint64_t v99 = (uint64_t)&v81 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v103 = &v81;
    uint64_t v33 = __chkstk_darwin(v31);
    char v90 = (char *)&v81 - v34;
    uint64_t v102 = &v81;
    uint64_t v35 = __chkstk_darwin(v33);
    char v91 = (char *)&v81 - v36;
    uint64_t v101 = &v81;
    __chkstk_darwin(v35);
    uint64_t v92 = (uint64_t)&v81 - v37;
    *(void *)uint64_t v23 = sub_38950();
    *((void *)v23 + 1) = 0;
    v23[16] = 1;
    uint64_t v38 = &v23[*(int *)(sub_22BC4(&qword_549A8) + 44)];
    *(void *)uint64_t v20 = sub_38870();
    *((void *)v20 + 1) = 0x4024000000000000;
    v20[16] = 0;
    uint64_t v39 = (uint64_t)&v20[*(int *)(sub_22BC4(&qword_549B0) + 44)];
    uint64_t v82 = v1;
    sub_2EDCC(v1, v39);
    sub_26660((uint64_t)v20, (uint64_t)v18, &qword_54970);
    *(void *)uint64_t v38 = 0x4024000000000000;
    v38[8] = 0;
    uint64_t v40 = sub_22BC4(&qword_549B8);
    sub_26660((uint64_t)v18, (uint64_t)&v38[*(int *)(v40 + 48)], &qword_54970);
    sub_265A0((uint64_t)v20, &qword_54970);
    sub_265A0((uint64_t)v18, &qword_54970);
    uint64_t v41 = v84;
    sub_20F4C(v84);
    uint64_t v42 = v85;
    uint64_t v43 = v87;
    (*(void (**)(char *, void, uint64_t))(v11 + 104))(v85, enum case for ColorScheme.dark(_:), v87);
    char v44 = sub_38570();
    uint64_t v45 = *(void (**)(char *, uint64_t))(v11 + 8);
    v45(v42, v43);
    v45((char *)v41, v43);
    uint64_t v46 = self;
    uint64_t v47 = &selRef_secondarySystemBackgroundColor;
    if ((v44 & 1) == 0) {
      uint64_t v47 = &selRef_systemBackgroundColor;
    }
    id v48 = [v46 *v47];
    uint64_t v49 = sub_38DF0();
    char v50 = sub_38AE0();
    sub_26660((uint64_t)v23, (uint64_t)v26, &qword_54978);
    uint64_t v51 = &v26[*(int *)(v83 + 44)];
    *(void *)uint64_t v51 = v49;
    v51[8] = v50;
    sub_265A0((uint64_t)v23, &qword_54978);
    uint64_t v52 = v93;
    unint64_t v53 = &v93[*(int *)(v95 + 28)];
    uint64_t v54 = enum case for RoundedCornerStyle.continuous(_:);
    uint64_t v55 = sub_388F0();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v55 - 8) + 104))(v53, v54, v55);
    __asm { FMOV            V0.2D, #16.0 }
    uint64_t v61 = (uint64_t)v52;
    *uint64_t v52 = _Q0;
    uint64_t v62 = v86;
    uint64_t v63 = (uint64_t)&v28[*(int *)(v86 + 36)];
    sub_31E60(v61, v63, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle);
    *(_WORD *)(v63 + *(int *)(sub_22BC4(&qword_549C0) + 36)) = 256;
    sub_26660((uint64_t)v26, (uint64_t)v28, &qword_54980);
    sub_31B34(v61);
    sub_265A0((uint64_t)v26, &qword_54980);
    uint64_t v64 = v105;
    sub_389E0();
    unint64_t v65 = sub_31B90();
    uint64_t v66 = v88;
    uint64_t v67 = v62;
    sub_38C90();
    (*(void (**)(char *, uint64_t))(v107 + 8))(v64, v108);
    uint64_t v68 = sub_265A0((uint64_t)v28, &qword_54988);
    __chkstk_darwin(v68);
    *(&v81 - 2) = v82;
    uint64_t v69 = sub_22BC4(&qword_549F8);
    uint64_t v124 = v67;
    unint64_t v125 = v65;
    uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    uint64_t v71 = sub_26748(&qword_54A00, &qword_549F8);
    uint64_t v72 = v89;
    uint64_t v73 = v94;
    sub_38C80();
    (*(void (**)(char *, uint64_t))(v96 + 8))(v66, v73);
    uint64_t v74 = v114;
    sub_38920();
    uint64_t v124 = v73;
    unint64_t v125 = v69;
    uint64_t v126 = OpaqueTypeConformance2;
    uint64_t v127 = v71;
    swift_getOpaqueTypeConformance2();
    uint64_t v75 = (uint64_t)v90;
    uint64_t v76 = v97;
    sub_38CF0();
    (*(void (**)(char *, uint64_t))(v118 + 8))(v74, v119);
    (*(void (**)(char *, uint64_t))(v100 + 8))(v72, v76);
    char v77 = v91;
    sub_386C0();
    sub_265A0(v75, &qword_549A0);
    uint64_t v78 = (uint64_t)v77;
    uint64_t v79 = v92;
    sub_265FC(v78, v92, &qword_549A0);
    sub_26660(v79, v99, &qword_549A0);
    sub_31CFC();
    uint64_t v80 = sub_38ED0();
    uint64_t result = sub_265A0(v79, &qword_549A0);
    *uint64_t v111 = v80;
  }
  return result;
}

uint64_t sub_2EDCC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v63 = a1;
  uint64_t v74 = a2;
  uint64_t v3 = sub_22BC4(&qword_54A18);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v73 = (uint64_t)&v58 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v72 = (uint64_t *)((char *)&v58 - v6);
  uint64_t v71 = sub_22BC4(&qword_549C0) - 8;
  __chkstk_darwin(v71);
  uint64_t v70 = (uint64_t)&v58 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v65 = sub_38740() - 8;
  __chkstk_darwin(v65);
  uint64_t v62 = (char *)&v58 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_38E20();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v58 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_22BC4(&qword_54A20);
  uint64_t v14 = v13 - 8;
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v58 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v68 = sub_22BC4(&qword_54A28) - 8;
  __chkstk_darwin(v68);
  uint64_t v66 = (uint64_t)&v58 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v69 = sub_22BC4(&qword_54A30) - 8;
  uint64_t v18 = __chkstk_darwin(v69);
  uint64_t v20 = (char *)&v58 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  uint64_t v67 = (uint64_t)&v58 - v21;
  uint64_t v64 = type metadata accessor for AXInstructionalCellContentView();
  id v22 = *(id *)(a1 + *(int *)(v64 + 28));
  sub_38E00();
  (*(void (**)(char *, void, uint64_t))(v10 + 104))(v12, enum case for Image.ResizingMode.stretch(_:), v9);
  uint64_t v23 = sub_38E40();
  swift_release();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  sub_38F40();
  sub_38600();
  uint64_t v24 = v75;
  int v61 = v76;
  uint64_t v25 = v77;
  char v26 = v78;
  uint64_t v60 = v79;
  uint64_t v59 = v80;
  uint64_t v27 = v62;
  uint64_t v28 = &v62[*(int *)(v65 + 28)];
  uint64_t v29 = enum case for RoundedCornerStyle.continuous(_:);
  uint64_t v30 = sub_388F0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v30 - 8) + 104))(v28, v29, v30);
  __asm { FMOV            V0.2D, #16.0 }
  *uint64_t v27 = _Q0;
  uint64_t v36 = v70;
  sub_31E60((uint64_t)v27, v70, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle);
  *(_WORD *)(v36 + *(int *)(v71 + 44)) = 256;
  sub_26660(v36, (uint64_t)&v16[*(int *)(v14 + 44)], &qword_549C0);
  *(void *)uint64_t v16 = v23;
  *((void *)v16 + 1) = 0;
  *((_WORD *)v16 + 8) = 1;
  *((void *)v16 + 3) = v24;
  v16[32] = v61;
  *((void *)v16 + 5) = v25;
  v16[48] = v26;
  uint64_t v37 = v59;
  *((void *)v16 + 7) = v60;
  *((void *)v16 + 8) = v37;
  swift_retain();
  sub_265A0(v36, &qword_549C0);
  sub_31B34((uint64_t)v27);
  swift_release();
  LOBYTE(v28) = sub_38B10();
  sub_38520();
  uint64_t v39 = v38;
  uint64_t v41 = v40;
  uint64_t v43 = v42;
  uint64_t v45 = v44;
  uint64_t v46 = v66;
  sub_26660((uint64_t)v16, v66, &qword_54A20);
  uint64_t v47 = v46 + *(int *)(v68 + 44);
  *(unsigned char *)uint64_t v47 = (_BYTE)v28;
  *(void *)(v47 + 8) = v39;
  *(void *)(v47 + 16) = v41;
  *(void *)(v47 + 24) = v43;
  *(void *)(v47 + 32) = v45;
  *(unsigned char *)(v47 + 40) = 0;
  sub_265A0((uint64_t)v16, &qword_54A20);
  uint64_t v48 = v63;
  LOBYTE(v28) = *(unsigned char *)(v63 + *(int *)(v64 + 32));
  sub_26660(v46, (uint64_t)v20, &qword_54A28);
  v20[*(int *)(v69 + 44)] = (char)v28;
  sub_265A0(v46, &qword_54A28);
  uint64_t v49 = v67;
  sub_265FC((uint64_t)v20, v67, &qword_54A30);
  uint64_t v50 = sub_38950();
  uint64_t v51 = v72;
  *uint64_t v72 = v50;
  v51[1] = 0;
  *((unsigned char *)v51 + 16) = 1;
  uint64_t v52 = (uint64_t)v51;
  uint64_t v53 = sub_22BC4(&qword_54A38);
  sub_2F434(v48, v52 + *(int *)(v53 + 44));
  sub_26660(v49, (uint64_t)v20, &qword_54A30);
  uint64_t v54 = v73;
  sub_26660(v52, v73, &qword_54A18);
  uint64_t v55 = v74;
  sub_26660((uint64_t)v20, v74, &qword_54A30);
  uint64_t v56 = sub_22BC4(&qword_54A40);
  sub_26660(v54, v55 + *(int *)(v56 + 48), &qword_54A18);
  sub_265A0(v52, &qword_54A18);
  sub_265A0(v49, &qword_54A30);
  sub_265A0(v54, &qword_54A18);
  return sub_265A0((uint64_t)v20, &qword_54A30);
}

uint64_t sub_2F434@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v147 = a2;
  uint64_t v133 = (void *)sub_38730();
  uint64_t v132 = *(v133 - 1);
  __chkstk_darwin(v133);
  uint64_t v131 = (char *)&v116 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for AXInstructionalCellContentView();
  uint64_t v117 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v118 = v5;
  uint64_t v119 = (uint64_t)&v116 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v124 = sub_22BC4(&qword_54008);
  uint64_t v123 = *(void *)(v124 - 8);
  __chkstk_darwin(v124);
  uint64_t v121 = (char *)&v116 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v120 = sub_22BC4(&qword_54A48);
  __chkstk_darwin(v120);
  uint64_t v122 = (char *)&v116 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v125 = sub_22BC4(&qword_54A50);
  __chkstk_darwin(v125);
  uint64_t v126 = (uint64_t)&v116 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v130 = sub_22BC4(&qword_54A58);
  uint64_t v129 = *(void *)(v130 - 8);
  uint64_t v9 = __chkstk_darwin(v130);
  uint64_t v136 = (char *)&v116 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v135 = (char *)&v116 - v11;
  uint64_t v128 = sub_38F00();
  uint64_t v127 = *(void *)(v128 - 8);
  uint64_t v12 = __chkstk_darwin(v128);
  uint64_t v134 = (char *)&v116 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v137 = (char *)&v116 - v14;
  uint64_t v15 = sub_22BC4(&qword_54A60);
  uint64_t v16 = __chkstk_darwin(v15 - 8);
  uint64_t v146 = (unint64_t *)((char *)&v116 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v16);
  uint64_t v145 = (uint64_t)&v116 - v18;
  uint64_t v19 = sub_22BC4(&qword_54A68);
  __chkstk_darwin(v19 - 8);
  uint64_t v21 = (char *)&v116 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_22BC4(&qword_54A70);
  uint64_t v23 = __chkstk_darwin(v22);
  uint64_t v144 = (uint64_t)&v116 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = __chkstk_darwin(v23);
  uint64_t v27 = (uint64_t)&v116 - v26;
  __chkstk_darwin(v25);
  uint64_t v29 = (char *)&v116 - v28;
  *(void *)uint64_t v21 = sub_38870();
  *((void *)v21 + 1) = 0x4024000000000000;
  v21[16] = 0;
  uint64_t v30 = sub_22BC4(&qword_54A78);
  sub_30130(a1, &v21[*(int *)(v30 + 44)]);
  unsigned __int8 v31 = sub_38B30();
  char v32 = sub_38B20();
  sub_38B20();
  if (sub_38B20() != v31) {
    char v32 = sub_38B20();
  }
  sub_38520();
  uint64_t v34 = v33;
  uint64_t v36 = v35;
  uint64_t v38 = v37;
  uint64_t v40 = v39;
  sub_26660((uint64_t)v21, v27, &qword_54A68);
  uint64_t v41 = v27 + *(int *)(v22 + 36);
  *(unsigned char *)uint64_t v41 = v32;
  *(void *)(v41 + 8) = v34;
  *(void *)(v41 + 16) = v36;
  *(void *)(v41 + 24) = v38;
  *(void *)(v41 + 32) = v40;
  *(unsigned char *)(v41 + 40) = 0;
  sub_265A0((uint64_t)v21, &qword_54A68);
  uint64_t v143 = v29;
  sub_265FC(v27, (uint64_t)v29, &qword_54A70);
  uint64_t v42 = (uint64_t *)(a1 + *(int *)(v4 + 24));
  uint64_t v43 = v42[1];
  uint64_t v149 = *v42;
  uint64_t v150 = v43;
  unint64_t v44 = sub_2447C();
  swift_bridgeObjectRetain();
  unint64_t v116 = v44;
  uint64_t v45 = sub_38BE0();
  uint64_t v47 = v46;
  char v49 = v48 & 1;
  sub_38DE0();
  uint64_t v138 = v4;
  uint64_t v50 = sub_38B90();
  uint64_t v52 = v51;
  LOBYTE(v44) = v53;
  swift_release();
  sub_250E4(v45, v47, v49);
  swift_bridgeObjectRelease();
  sub_38B60();
  uint64_t v54 = sub_38BC0();
  uint64_t v140 = v55;
  uint64_t v141 = v54;
  LODWORD(v27) = v56;
  uint64_t v142 = v57;
  swift_release();
  sub_250E4(v50, v52, v44 & 1);
  swift_bridgeObjectRelease();
  int v139 = sub_38B30();
  sub_38520();
  uint64_t v59 = v58;
  uint64_t v61 = v60;
  uint64_t v63 = v62;
  uint64_t v65 = v64;
  uint64_t v66 = (uint64_t *)(a1 + *(int *)(v138 + 36));
  uint64_t v68 = *v66;
  uint64_t v67 = v66[1];
  if (!*v66 && v67 == 0xE000000000000000 || (sub_39280() & 1) != 0)
  {
    uint64_t v69 = sub_22BC4(&qword_54AA0);
    uint64_t v70 = v145;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v69 - 8) + 56))(v145, 1, 1, v69);
    uint64_t v71 = (uint64_t)v146;
  }
  else
  {
    sub_38EF0();
    uint64_t v149 = v68;
    uint64_t v150 = v67;
    uint64_t v72 = v119;
    sub_31E60(a1, v119, (uint64_t (*)(void))type metadata accessor for AXInstructionalCellContentView);
    unint64_t v73 = (*(unsigned __int8 *)(v117 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v117 + 80);
    uint64_t v74 = swift_allocObject();
    sub_31ECC(v72, v74 + v73);
    swift_bridgeObjectRetain();
    uint64_t v75 = v121;
    sub_38EC0();
    uint64_t v76 = sub_38DC0();
    char v77 = sub_38AE0();
    uint64_t v78 = v123;
    uint64_t v79 = *(void (**)(char *, char *, uint64_t))(v123 + 16);
    LODWORD(v138) = v27;
    uint64_t v80 = (uint64_t)v122;
    uint64_t v81 = v124;
    v79(v122, v75, v124);
    uint64_t v82 = v80 + *(int *)(v120 + 36);
    *(void *)uint64_t v82 = v76;
    *(unsigned char *)(v82 + 8) = v77;
    (*(void (**)(char *, uint64_t))(v78 + 8))(v75, v81);
    uint64_t v83 = sub_38D90();
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v85 = v126;
    sub_26660(v80, v126, &qword_54A48);
    uint64_t v86 = (uint64_t *)(v85 + *(int *)(v125 + 36));
    uint64_t *v86 = KeyPath;
    v86[1] = v83;
    sub_265A0(v80, &qword_54A48);
    uint64_t v87 = v131;
    sub_38720();
    sub_31FB4();
    sub_32118(&qword_54A90, (void (*)(uint64_t))&type metadata accessor for PlainButtonStyle);
    uint64_t v88 = v136;
    uint64_t v89 = v133;
    sub_38C10();
    (*(void (**)(char *, void *))(v132 + 8))(v87, v89);
    sub_265A0(v85, &qword_54A50);
    uint64_t v90 = v129;
    char v91 = v135;
    uint64_t v92 = v130;
    (*(void (**)(char *, char *, uint64_t))(v129 + 32))(v135, v88, v130);
    LOBYTE(v149) = 1;
    uint64_t v93 = v127;
    uint64_t v133 = *(void **)(v127 + 16);
    uint64_t v94 = v134;
    uint64_t v27 = v128;
    ((void (*)(char *, char *, uint64_t))v133)(v134, v137, v128);
    char v148 = 1;
    uint64_t v95 = *(void (**)(char *, char *, uint64_t))(v90 + 16);
    v95(v88, v91, v92);
    uint64_t v96 = (void (*)(uint64_t, char *, uint64_t))v95;
    char v97 = v149;
    uint64_t v71 = (uint64_t)v146;
    *uint64_t v146 = 0;
    *(unsigned char *)(v71 + 8) = v97;
    uint64_t v98 = (int *)sub_22BC4(&qword_54A98);
    ((void (*)(uint64_t, char *, uint64_t))v133)(v71 + v98[12], v94, v27);
    uint64_t v99 = v71 + v98[16];
    char v100 = v148;
    *(void *)uint64_t v99 = 0;
    *(unsigned char *)(v99 + 8) = v100;
    uint64_t v101 = v136;
    v96(v71 + v98[20], v136, v92);
    uint64_t v102 = *(void (**)(char *, uint64_t))(v90 + 8);
    v102(v135, v92);
    uint64_t v103 = *(void (**)(char *, uint64_t))(v93 + 8);
    v103(v137, v27);
    v102(v101, v92);
    uint64_t v104 = v27;
    LOBYTE(v27) = v138;
    v103(v134, v104);
    uint64_t v105 = sub_22BC4(&qword_54AA0);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v105 - 8) + 56))(v71, 0, 1, v105);
    uint64_t v70 = v145;
    sub_265FC(v71, v145, &qword_54A60);
  }
  char v106 = v27 & 1;
  uint64_t v107 = (uint64_t)v143;
  uint64_t v108 = v144;
  sub_26660((uint64_t)v143, v144, &qword_54A70);
  sub_26660(v70, v71, &qword_54A60);
  uint64_t v109 = v147;
  sub_26660(v108, v147, &qword_54A70);
  uint64_t v110 = (int *)sub_22BC4(&qword_54AA8);
  uint64_t v111 = v109 + v110[12];
  uint64_t v113 = v140;
  uint64_t v112 = v141;
  *(void *)uint64_t v111 = v141;
  *(void *)(v111 + 8) = v113;
  *(unsigned char *)(v111 + 16) = v106;
  *(void *)(v111 + 24) = v142;
  *(unsigned char *)(v111 + 32) = v139;
  *(void *)(v111 + 40) = v59;
  *(void *)(v111 + 48) = v61;
  *(void *)(v111 + 56) = v63;
  *(void *)(v111 + 64) = v65;
  *(unsigned char *)(v111 + 72) = 0;
  sub_26660(v71, v109 + v110[16], &qword_54A60);
  uint64_t v114 = v109 + v110[20];
  *(void *)uint64_t v114 = 0x4024000000000000;
  *(unsigned char *)(v114 + 8) = 0;
  sub_24ECC(v112, v113, v106);
  swift_bridgeObjectRetain();
  sub_265A0(v70, &qword_54A60);
  sub_265A0(v107, &qword_54A70);
  sub_265A0(v71, &qword_54A60);
  sub_250E4(v112, v113, v106);
  swift_bridgeObjectRelease();
  return sub_265A0(v108, &qword_54A70);
}

uint64_t sub_30130@<X0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v57 = a1;
  uint64_t v69 = a2;
  uint64_t v3 = type metadata accessor for AXInstructionalCellContentView();
  uint64_t v4 = v3 - 8;
  uint64_t v60 = *(void *)(v3 - 8);
  uint64_t v59 = *(void *)(v60 + 64);
  __chkstk_darwin(v3);
  uint64_t v58 = (uint64_t)&v56 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_22BC4(&qword_54AB0);
  uint64_t v67 = *(void *)(v6 - 8);
  uint64_t v68 = v6;
  __chkstk_darwin(v6);
  uint64_t v61 = (char *)&v56 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v65 = sub_22BC4(&qword_54AB8) - 8;
  __chkstk_darwin(v65);
  uint64_t v62 = (char *)&v56 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v66 = sub_22BC4(&qword_54AC0) - 8;
  uint64_t v9 = __chkstk_darwin(v66);
  uint64_t v63 = (uint64_t)&v56 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v64 = (uint64_t)&v56 - v11;
  uint64_t v12 = (void *)(a1 + *(int *)(v4 + 28));
  uint64_t v13 = v12[1];
  *(void *)&long long v83 = *v12;
  *((void *)&v83 + 1) = v13;
  sub_2447C();
  swift_bridgeObjectRetain();
  uint64_t v14 = sub_38BE0();
  uint64_t v16 = v15;
  char v18 = v17 & 1;
  sub_38B50();
  uint64_t v19 = sub_38BC0();
  uint64_t v21 = v20;
  char v23 = v22;
  swift_release();
  sub_250E4(v14, v16, v18);
  swift_bridgeObjectRelease();
  uint64_t v24 = sub_38BB0();
  uint64_t v26 = v25;
  uint64_t v28 = v27;
  char v30 = v29 & 1;
  sub_250E4(v19, v21, v23 & 1);
  swift_bridgeObjectRelease();
  uint64_t v31 = sub_38F20();
  sub_30708(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)&v83, 0.0, 1, 0.0, 1, v31, v32, v24, v26, v30, v28);
  sub_250E4(v24, v26, v30);
  swift_bridgeObjectRelease();
  long long v76 = v89;
  long long v77 = v90;
  long long v78 = v91;
  long long v72 = v85;
  long long v73 = v86;
  long long v74 = v87;
  long long v75 = v88;
  long long v70 = v83;
  long long v71 = v84;
  uint64_t v33 = v58;
  sub_31E60(v57, v58, (uint64_t (*)(void))type metadata accessor for AXInstructionalCellContentView);
  unint64_t v34 = (*(unsigned __int8 *)(v60 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v60 + 80);
  uint64_t v35 = swift_allocObject();
  sub_31ECC(v33, v35 + v34);
  sub_22BC4(&qword_54AC8);
  sub_32340();
  uint64_t v36 = v61;
  sub_38E90();
  sub_38F30();
  sub_38600();
  uint64_t v38 = v67;
  uint64_t v37 = v68;
  uint64_t v39 = (uint64_t)v62;
  (*(void (**)(char *, char *, uint64_t))(v67 + 16))(v62, v36, v68);
  uint64_t v40 = (_OWORD *)(v39 + *(int *)(v65 + 44));
  long long v41 = v80;
  *uint64_t v40 = v79;
  v40[1] = v41;
  void v40[2] = v81;
  (*(void (**)(char *, uint64_t))(v38 + 8))(v36, v37);
  uint64_t v42 = v63;
  sub_26660(v39, v63, &qword_54AB8);
  *(_WORD *)(v42 + *(int *)(v66 + 44)) = 257;
  sub_265A0(v39, &qword_54AB8);
  uint64_t v43 = v64;
  sub_265FC(v42, v64, &qword_54AC0);
  sub_26660(v43, v42, &qword_54AC0);
  long long v44 = v77;
  v82[6] = v76;
  v82[7] = v77;
  long long v45 = v78;
  v82[8] = v78;
  long long v46 = v72;
  long long v47 = v73;
  v82[2] = v72;
  v82[3] = v73;
  long long v49 = v74;
  long long v48 = v75;
  v82[4] = v74;
  v82[5] = v75;
  long long v51 = v70;
  long long v50 = v71;
  v82[0] = v70;
  v82[1] = v71;
  uint64_t v52 = v69;
  v69[6] = v76;
  v52[7] = v44;
  v52[8] = v45;
  v52[2] = v46;
  v52[3] = v47;
  v52[4] = v49;
  v52[5] = v48;
  *uint64_t v52 = v51;
  v52[1] = v50;
  char v53 = v52;
  uint64_t v54 = sub_22BC4(&qword_54AD8);
  sub_26660(v42, (uint64_t)v53 + *(int *)(v54 + 48), &qword_54AC0);
  sub_323E0((uint64_t)v82);
  sub_265A0(v43, &qword_54AC0);
  sub_265A0(v42, &qword_54AC0);
  long long v89 = v76;
  long long v90 = v77;
  long long v91 = v78;
  long long v85 = v72;
  long long v86 = v73;
  long long v87 = v74;
  long long v88 = v75;
  long long v83 = v70;
  long long v84 = v71;
  return sub_32420((uint64_t)&v83);
}

uint64_t sub_30708@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19)
{
  uint64_t v20 = a19;
  char v21 = a18;
  uint64_t v22 = a17;
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_39130();
    uint64_t v31 = (void *)sub_38AD0();
    sub_383F0();

    char v21 = a18;
    uint64_t v20 = a19;
    uint64_t v22 = a17;
  }
  sub_38750();
  *(void *)a9 = a16;
  *(void *)(a9 + 8) = v22;
  *(unsigned char *)(a9 + 16) = v21 & 1;
  *(void *)(a9 + 24) = v20;
  *(_OWORD *)(a9 + 96) = v37;
  *(_OWORD *)(a9 + 112) = v38;
  *(_OWORD *)(a9 + 128) = v39;
  *(_OWORD *)(a9 + 32) = v33;
  *(_OWORD *)(a9 + 48) = v34;
  *(_OWORD *)(a9 + 64) = v35;
  *(_OWORD *)(a9 + 80) = v36;
  sub_24ECC(a16, v22, v21 & 1);

  return swift_bridgeObjectRetain();
}

uint64_t sub_308FC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_38E10();
  uint64_t v3 = sub_38DE0();
  uint64_t result = swift_getKeyPath();
  *a1 = v2;
  a1[1] = result;
  a1[2] = v3;
  return result;
}

void sub_30958(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v43 = a2;
  uint64_t v38 = type metadata accessor for AXInstructionalCellContentView();
  uint64_t v3 = *(void *)(v38 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  __chkstk_darwin(v38);
  uint64_t v5 = sub_22BC4(&qword_54008);
  uint64_t v39 = *(void *)(v5 - 8);
  uint64_t v6 = __chkstk_darwin(v5);
  uint64_t v42 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v6);
  long long v41 = (char *)&v37 - v9;
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v40 = (char *)&v37 - v11;
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v37 - v13;
  __chkstk_darwin(v12);
  long long v44 = (char *)&v37 - v15;
  uint64_t v16 = (void *)sub_38FC0();
  id v17 = [self bundleWithIdentifier:v16];

  if (v17)
  {
    uint64_t v18 = sub_38340();
    uint64_t v20 = v19;

    uint64_t v45 = v18;
    uint64_t v46 = v20;
    sub_31E60(a1, (uint64_t)&v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for AXInstructionalCellContentView);
    uint64_t v21 = *(unsigned __int8 *)(v3 + 80);
    uint64_t v22 = (char *)&v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
    uint64_t v23 = (v21 + 16) & ~v21;
    uint64_t v24 = swift_allocObject();
    sub_31ECC((uint64_t)v22, v24 + v23);
    sub_2447C();
    sub_38EC0();
    uint64_t v25 = v39;
    (*(void (**)(char *, char *, uint64_t))(v39 + 32))(v44, v14, v5);
    uint64_t v26 = (uint64_t *)(a1 + *(int *)(v38 + 36));
    uint64_t v27 = v26[1];
    uint64_t v45 = *v26;
    uint64_t v46 = v27;
    sub_31E60(a1, (uint64_t)v22, (uint64_t (*)(void))type metadata accessor for AXInstructionalCellContentView);
    uint64_t v28 = swift_allocObject();
    sub_31ECC((uint64_t)v22, v28 + v23);
    swift_bridgeObjectRetain();
    char v29 = v40;
    sub_38EC0();
    char v30 = *(void (**)(char *, char *, uint64_t))(v25 + 16);
    uint64_t v31 = v41;
    uint64_t v32 = v44;
    v30(v41, v44, v5);
    long long v33 = v42;
    v30(v42, v29, v5);
    long long v34 = v43;
    v30(v43, v31, v5);
    uint64_t v35 = sub_22BC4(&qword_54A10);
    v30(&v34[*(int *)(v35 + 48)], v33, v5);
    long long v36 = *(void (**)(char *, uint64_t))(v25 + 8);
    v36(v29, v5);
    v36(v32, v5);
    v36(v33, v5);
    v36(v31, v5);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_30DF4(uint64_t a1, uint64_t a2, void *a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  int v30 = a4;
  uint64_t v31 = a11;
  uint64_t v32 = a7;
  uint64_t v29 = a9;
  uint64_t v18 = type metadata accessor for AXInstructionalCellContentView();
  uint64_t v19 = (int *)(v18 - 8);
  __chkstk_darwin(v18);
  uint64_t v21 = (uint64_t *)((char *)&v29 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0));
  *uint64_t v21 = swift_getKeyPath();
  sub_22BC4(&qword_53EC8);
  swift_storeEnumTagMultiPayload();
  uint64_t v22 = (uint64_t *)((char *)v21 + v19[7]);
  *uint64_t v22 = a1;
  v22[1] = a2;
  uint64_t v23 = (uint64_t *)((char *)v21 + v19[8]);
  void *v23 = a5;
  v23[1] = a6;
  *(uint64_t *)((char *)v21 + v19[9]) = (uint64_t)a3;
  *((unsigned char *)v21 + v19[10]) = v30;
  uint64_t v24 = (uint64_t *)((char *)v21 + v19[11]);
  *uint64_t v24 = v32;
  v24[1] = a8;
  uint64_t v25 = (uint64_t *)((char *)v21 + v19[12]);
  void *v25 = v29;
  v25[1] = a10;
  uint64_t v26 = (uint64_t *)((char *)v21 + v19[13]);
  *uint64_t v26 = v31;
  v26[1] = a12;
  objc_allocWithZone((Class)sub_22BC4(&qword_548B0));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v27 = a3;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  return sub_38970();
}

uint64_t type metadata accessor for AXInstructionalCellContentViewBridge()
{
  return self;
}

uint64_t sub_30FA4()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_30FDC()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t type metadata accessor for AXInstructionalCellContentView()
{
  uint64_t result = qword_54910;
  if (!qword_54910) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void *sub_31040(void *a1, void *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    uint64_t v4 = (void *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    sub_22BC4(&qword_53EC8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_38580();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(v4, a2, v7);
    }
    else
    {
      *uint64_t v4 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = a3[5];
    uint64_t v10 = a3[6];
    uint64_t v11 = (void *)((char *)v4 + v9);
    uint64_t v12 = (void *)((char *)a2 + v9);
    uint64_t v13 = v12[1];
    void *v11 = *v12;
    v11[1] = v13;
    uint64_t v14 = (void *)((char *)v4 + v10);
    uint64_t v15 = (void *)((char *)a2 + v10);
    uint64_t v16 = v15[1];
    *uint64_t v14 = *v15;
    v14[1] = v16;
    uint64_t v17 = a3[7];
    uint64_t v18 = a3[8];
    uint64_t v19 = *(void **)((char *)a2 + v17);
    *(void *)((char *)v4 + v17) = v19;
    *((unsigned char *)v4 + v18) = *((unsigned char *)a2 + v18);
    uint64_t v20 = a3[9];
    uint64_t v21 = a3[10];
    uint64_t v22 = (void *)((char *)v4 + v20);
    uint64_t v23 = (void *)((char *)a2 + v20);
    uint64_t v24 = v23[1];
    *uint64_t v22 = *v23;
    v22[1] = v24;
    uint64_t v25 = (void *)((char *)v4 + v21);
    uint64_t v26 = (void *)((char *)a2 + v21);
    uint64_t v27 = v26[1];
    void *v25 = *v26;
    v25[1] = v27;
    uint64_t v28 = a3[11];
    uint64_t v29 = (void *)((char *)v4 + v28);
    int v30 = (void *)((char *)a2 + v28);
    uint64_t v31 = v30[1];
    void *v29 = *v30;
    v29[1] = v31;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    id v32 = v19;
    swift_bridgeObjectRetain();
    swift_retain();
  }
  swift_retain();
  return v4;
}

uint64_t sub_311F4(uint64_t a1, uint64_t a2)
{
  sub_22BC4(&qword_53EC8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = sub_38580();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_release();

  return swift_release();
}

void *sub_312E4(void *a1, void *a2, int *a3)
{
  sub_22BC4(&qword_53EC8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_38580();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = (void *)((char *)a1 + v7);
  uint64_t v10 = (void *)((char *)a2 + v7);
  uint64_t v11 = v10[1];
  *uint64_t v9 = *v10;
  v9[1] = v11;
  uint64_t v12 = (void *)((char *)a1 + v8);
  uint64_t v13 = (void *)((char *)a2 + v8);
  uint64_t v14 = v13[1];
  void *v12 = *v13;
  v12[1] = v14;
  uint64_t v15 = a3[7];
  uint64_t v16 = a3[8];
  uint64_t v17 = *(void **)((char *)a2 + v15);
  *(void *)((char *)a1 + v15) = v17;
  *((unsigned char *)a1 + v16) = *((unsigned char *)a2 + v16);
  uint64_t v18 = a3[9];
  uint64_t v19 = a3[10];
  uint64_t v20 = (void *)((char *)a1 + v18);
  uint64_t v21 = (void *)((char *)a2 + v18);
  uint64_t v22 = v21[1];
  void *v20 = *v21;
  v20[1] = v22;
  uint64_t v23 = (void *)((char *)a1 + v19);
  uint64_t v24 = (void *)((char *)a2 + v19);
  uint64_t v25 = v24[1];
  void *v23 = *v24;
  v23[1] = v25;
  uint64_t v26 = a3[11];
  uint64_t v27 = (void *)((char *)a1 + v26);
  uint64_t v28 = (void *)((char *)a2 + v26);
  uint64_t v29 = v28[1];
  *uint64_t v27 = *v28;
  v27[1] = v29;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v30 = v17;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  return a1;
}

void *sub_3144C(void *a1, void *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_265A0((uint64_t)a1, &qword_53EC8);
    sub_22BC4(&qword_53EC8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = sub_38580();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)((char *)a1 + v7);
  uint64_t v9 = (void *)((char *)a2 + v7);
  void *v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = a3[6];
  uint64_t v11 = (void *)((char *)a1 + v10);
  uint64_t v12 = (void *)((char *)a2 + v10);
  void *v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v13 = a3[7];
  uint64_t v14 = *(void **)((char *)a2 + v13);
  uint64_t v15 = *(void **)((char *)a1 + v13);
  *(void *)((char *)a1 + v13) = v14;
  id v16 = v14;

  *((unsigned char *)a1 + a3[8]) = *((unsigned char *)a2 + a3[8]);
  uint64_t v17 = a3[9];
  uint64_t v18 = (void *)((char *)a1 + v17);
  uint64_t v19 = (void *)((char *)a2 + v17);
  void *v18 = *v19;
  v18[1] = v19[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v20 = a3[10];
  uint64_t v21 = (void *)((char *)a1 + v20);
  uint64_t v22 = (void *)((char *)a2 + v20);
  uint64_t v23 = v22[1];
  *uint64_t v21 = *v22;
  v21[1] = v23;
  swift_retain();
  swift_release();
  uint64_t v24 = a3[11];
  uint64_t v25 = (void *)((char *)a1 + v24);
  uint64_t v26 = (void *)((char *)a2 + v24);
  uint64_t v27 = v26[1];
  void *v25 = *v26;
  v25[1] = v27;
  swift_retain();
  swift_release();
  return a1;
}

char *sub_31614(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_22BC4(&qword_53EC8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = sub_38580();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = a3[6];
  *(_OWORD *)&a1[a3[5]] = *(_OWORD *)&a2[a3[5]];
  *(_OWORD *)&a1[v8] = *(_OWORD *)&a2[v8];
  uint64_t v9 = a3[8];
  *(void *)&a1[a3[7]] = *(void *)&a2[a3[7]];
  a1[v9] = a2[v9];
  uint64_t v10 = a3[10];
  *(_OWORD *)&a1[a3[9]] = *(_OWORD *)&a2[a3[9]];
  *(_OWORD *)&a1[v10] = *(_OWORD *)&a2[v10];
  *(_OWORD *)&a1[a3[11]] = *(_OWORD *)&a2[a3[11]];
  return a1;
}

char *sub_31724(char *a1, char *a2, int *a3)
{
  if (a1 != a2)
  {
    sub_265A0((uint64_t)a1, &qword_53EC8);
    uint64_t v6 = sub_22BC4(&qword_53EC8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = sub_38580();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
  }
  uint64_t v8 = a3[5];
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  uint64_t v12 = *(void *)v10;
  uint64_t v11 = *((void *)v10 + 1);
  *(void *)uint64_t v9 = v12;
  *((void *)v9 + 1) = v11;
  swift_bridgeObjectRelease();
  uint64_t v13 = a3[6];
  uint64_t v14 = &a1[v13];
  uint64_t v15 = &a2[v13];
  uint64_t v17 = *(void *)v15;
  uint64_t v16 = *((void *)v15 + 1);
  *(void *)uint64_t v14 = v17;
  *((void *)v14 + 1) = v16;
  swift_bridgeObjectRelease();
  uint64_t v18 = a3[7];
  uint64_t v19 = *(void **)&a1[v18];
  *(void *)&a1[v18] = *(void *)&a2[v18];

  uint64_t v20 = a3[9];
  a1[a3[8]] = a2[a3[8]];
  uint64_t v21 = &a1[v20];
  uint64_t v22 = &a2[v20];
  uint64_t v24 = *(void *)v22;
  uint64_t v23 = *((void *)v22 + 1);
  *(void *)uint64_t v21 = v24;
  *((void *)v21 + 1) = v23;
  swift_bridgeObjectRelease();
  *(_OWORD *)&a1[a3[10]] = *(_OWORD *)&a2[a3[10]];
  swift_release();
  *(_OWORD *)&a1[a3[11]] = *(_OWORD *)&a2[a3[11]];
  swift_release();
  return a1;
}

uint64_t sub_318A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_318B8);
}

uint64_t sub_318B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_22BC4(&qword_53ED0);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_31980(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_31994);
}

uint64_t sub_31994(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_22BC4(&qword_53ED0);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  }
  return result;
}

void sub_31A58()
{
  sub_243A0();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t sub_31B18()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_31B34(uint64_t a1)
{
  uint64_t v2 = sub_38740();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_31B90()
{
  unint64_t result = qword_549C8;
  if (!qword_549C8)
  {
    sub_24414(&qword_54988);
    sub_31C30();
    sub_26748(&qword_549F0, &qword_549C0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_549C8);
  }
  return result;
}

unint64_t sub_31C30()
{
  unint64_t result = qword_549D0;
  if (!qword_549D0)
  {
    sub_24414(&qword_54980);
    sub_26748(&qword_549D8, &qword_54978);
    sub_26748(&qword_549E0, &qword_549E8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_549D0);
  }
  return result;
}

void sub_31CF4(char *a1@<X8>)
{
  sub_30958(*(void *)(v1 + 16), a1);
}

unint64_t sub_31CFC()
{
  unint64_t result = qword_54A08;
  if (!qword_54A08)
  {
    sub_24414(&qword_549A0);
    sub_24414(&qword_54990);
    sub_24414(&qword_549F8);
    sub_24414(&qword_54988);
    sub_31B90();
    swift_getOpaqueTypeConformance2();
    sub_26748(&qword_54A00, &qword_549F8);
    swift_getOpaqueTypeConformance2();
    sub_32118(&qword_54258, (void (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_54A08);
  }
  return result;
}

uint64_t sub_31E60(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_31ECC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AXInstructionalCellContentView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_31F40()
{
  uint64_t v1 = type metadata accessor for AXInstructionalCellContentView();
  return (*(uint64_t (**)(void))(v0
                              + *(int *)(v1 + 40)
                              + ((*(unsigned __int8 *)(*(void *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v1 - 8) + 80))))();
}

unint64_t sub_31FB4()
{
  unint64_t result = qword_54A80;
  if (!qword_54A80)
  {
    sub_24414(&qword_54A50);
    sub_32054();
    sub_26748(&qword_544F8, &qword_54500);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_54A80);
  }
  return result;
}

unint64_t sub_32054()
{
  unint64_t result = qword_54A88;
  if (!qword_54A88)
  {
    sub_24414(&qword_54A48);
    sub_26748(&qword_54020, &qword_54008);
    sub_26748(&qword_549E0, &qword_549E8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_54A88);
  }
  return result;
}

uint64_t sub_32118(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_32164()
{
  uint64_t v1 = type metadata accessor for AXInstructionalCellContentView();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  sub_22BC4(&qword_53EC8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_38580();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v0 + v3, v5);
  }
  else
  {
    swift_release();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_322D4()
{
  uint64_t v1 = type metadata accessor for AXInstructionalCellContentView();
  return (*(uint64_t (**)(void))(v0
                              + *(int *)(v1 + 44)
                              + ((*(unsigned __int8 *)(*(void *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v1 - 8) + 80))))();
}

unint64_t sub_32340()
{
  unint64_t result = qword_54AD0;
  if (!qword_54AD0)
  {
    sub_24414(&qword_54AC8);
    sub_26748(&qword_544F8, &qword_54500);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_54AD0);
  }
  return result;
}

uint64_t sub_323E0(uint64_t a1)
{
  return a1;
}

uint64_t sub_32420(uint64_t a1)
{
  return a1;
}

void *sub_32460()
{
  return &protocol witness table for AnyView;
}

uint64_t initializeBufferWithCopyOfBuffer for CACPhoneticVocabularyAddEntryView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for CACPhoneticVocabularyAddEntryView()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  return swift_release();
}

uint64_t initializeWithCopy for CACPhoneticVocabularyAddEntryView(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for CACPhoneticVocabularyAddEntryView(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for CACPhoneticVocabularyAddEntryView(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(__n128 *)(a1 + 16) = result;
  *(_OWORD *)(a1 + 32) = v3;
  return result;
}

uint64_t assignWithTake for CACPhoneticVocabularyAddEntryView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release();
  *(unsigned char *)(a1 + 40) = *(unsigned char *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_release();
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for CACPhoneticVocabularyAddEntryView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 80)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CACPhoneticVocabularyAddEntryView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 80) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 80) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CACPhoneticVocabularyAddEntryView()
{
  return &type metadata for CACPhoneticVocabularyAddEntryView;
}

uint64_t sub_327BC()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_327D8(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_383C0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v53 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_22BC4(&qword_53FA8);
  __chkstk_darwin(v6 - 8);
  uint64_t v55 = sub_22BC4(&qword_54AE0);
  uint64_t v54 = *(void *)(v55 - 8);
  __chkstk_darwin(v55);
  uint64_t v66 = (char *)v53 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = sub_22BC4(&qword_54AE8);
  uint64_t v58 = *(void *)(v60 - 8);
  __chkstk_darwin(v60);
  uint64_t v56 = (char *)v53 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_22BC4(&qword_54AF0);
  uint64_t v62 = *(void *)(v9 - 8);
  uint64_t v63 = v9;
  __chkstk_darwin(v9);
  uint64_t v61 = (char *)v53 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v57 = sub_22BC4(&qword_54AF8);
  __chkstk_darwin(v57);
  uint64_t v59 = (char *)v53 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = (void *)sub_38FC0();
  uint64_t v64 = "ARY_UNKNOWN_ERROR_DESCRIPTION";
  uint64_t v13 = (void *)sub_38FC0();
  id v14 = settingsLocString(v12, v13);

  if (!v14)
  {
    __break(1u);
    goto LABEL_6;
  }
  v53[0] = a1;
  uint64_t v15 = sub_38FE0();
  uint64_t v17 = v16;

  uint64_t v67 = v15;
  uint64_t v68 = v17;
  v53[2] = sub_39070();
  v53[1] = v18;
  uint64_t v19 = (void *)sub_38FC0();
  uint64_t v20 = (void *)sub_38FC0();
  id v21 = settingsLocString(v19, v20);

  if (!v21)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  uint64_t v22 = sub_38FE0();
  uint64_t v24 = v23;

  uint64_t v67 = v22;
  uint64_t v68 = v24;
  sub_39070();
  sub_22BC4(&qword_53FC0);
  uint64_t v25 = swift_allocObject();
  *(_OWORD *)(v25 + 16) = xmmword_3D810;
  sub_38390();
  sub_383B0();
  sub_383A0();
  uint64_t v67 = v25;
  sub_355C0();
  sub_22BC4(&qword_53FD0);
  sub_26748(&qword_53FD8, &qword_53FD0);
  sub_391F0();
  sub_38EE0();
  uint64_t v26 = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  __chkstk_darwin(v26);
  uint64_t v27 = v65;
  sub_22BC4(&qword_54B00);
  sub_35620();
  sub_38380();
  uint64_t v28 = (void *)sub_38FC0();
  uint64_t v29 = (void *)sub_38FC0();
  id v30 = settingsLocString(v28, v29);

  if (v30)
  {
    uint64_t v31 = sub_38FE0();
    long long v33 = v32;

    uint64_t v67 = v31;
    uint64_t v68 = v33;
    uint64_t v74 = sub_39070();
    uint64_t v75 = v34;
    long long v73 = v27[4];
    sub_22BC4(&qword_54000);
    uint64_t v35 = sub_38E80();
    long long v36 = v27;
    __chkstk_darwin(v35);
    uint64_t v64 = (char *)sub_22BC4(&qword_54008);
    uint64_t v37 = sub_26748(&qword_54B80, &qword_54AE0);
    unint64_t v38 = sub_2447C();
    uint64_t v52 = sub_26748(&qword_54020, &qword_54008);
    uint64_t v39 = v56;
    uint64_t v40 = v55;
    long long v41 = v66;
    sub_38D30();
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v42 = (*(uint64_t (**)(char *, uint64_t))(v54 + 8))(v41, v40);
    __chkstk_darwin(v42);
    sub_22BC4(&qword_54B88);
    uint64_t v67 = v40;
    uint64_t v68 = &type metadata for String;
    uint64_t v69 = v64;
    uint64_t v70 = v37;
    unint64_t v71 = v38;
    uint64_t v72 = v52;
    swift_getOpaqueTypeConformance2();
    sub_26748(&qword_54B90, &qword_54B88);
    uint64_t v43 = v61;
    uint64_t v44 = v60;
    sub_38D50();
    (*(void (**)(char *, uint64_t))(v58 + 8))(v39, v44);
    uint64_t v45 = (_OWORD *)swift_allocObject();
    long long v46 = v36[3];
    v45[3] = v36[2];
    v45[4] = v46;
    v45[5] = v36[4];
    long long v47 = v36[1];
    v45[1] = *v36;
    v45[2] = v47;
    uint64_t v49 = v62;
    uint64_t v48 = v63;
    uint64_t v50 = (uint64_t)v59;
    (*(void (**)(char *, char *, uint64_t))(v62 + 16))(v59, v43, v63);
    long long v51 = (void *)(v50 + *(int *)(v57 + 36));
    *long long v51 = sub_35A94;
    v51[1] = v45;
    v51[2] = 0;
    v51[3] = 0;
    sub_35A98((uint64_t)v36);
    (*(void (**)(char *, uint64_t))(v49 + 8))(v43, v48);
    sub_265FC(v50, v53[0], &qword_54AF8);
    return;
  }
LABEL_7:
  __break(1u);
}

void sub_33178(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v138 = a2;
  uint64_t v136 = sub_38740();
  __chkstk_darwin(v136);
  uint64_t v137 = (char *)&v99 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_38680();
  uint64_t v134 = *(void *)(v4 - 8);
  uint64_t v135 = v4;
  __chkstk_darwin(v4);
  uint64_t v131 = (char *)&v99 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v124 = sub_385D0();
  uint64_t v123 = *(void *)(v124 - 8);
  __chkstk_darwin(v124);
  uint64_t v119 = (char *)&v99 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_22BC4(&qword_54BD8);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v99 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v102 = sub_22BC4(&qword_54330);
  uint64_t v100 = *(void *)(v102 - 8);
  __chkstk_darwin(v102);
  uint64_t v99 = (char *)&v99 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v104 = sub_22BC4(&qword_54B70);
  uint64_t v103 = *(void *)(v104 - 8);
  __chkstk_darwin(v104);
  uint64_t v101 = (char *)&v99 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v108 = sub_22BC4(&qword_54B68);
  uint64_t v106 = *(void *)(v108 - 8);
  __chkstk_darwin(v108);
  uint64_t v105 = (char *)&v99 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v110 = sub_22BC4(&qword_54B60);
  uint64_t v109 = *(void *)(v110 - 8);
  __chkstk_darwin(v110);
  uint64_t v107 = (char *)&v99 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v115 = sub_22BC4(&qword_54B58);
  uint64_t v112 = *(void *)(v115 - 8);
  __chkstk_darwin(v115);
  uint64_t v111 = (char *)&v99 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v118 = sub_22BC4(&qword_54B50);
  uint64_t v116 = *(void *)(v118 - 8);
  __chkstk_darwin(v118);
  uint64_t v114 = (char *)&v99 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v122 = sub_22BC4(&qword_54BE0);
  uint64_t v120 = *(void *)(v122 - 8);
  __chkstk_darwin(v122);
  uint64_t v117 = (char *)&v99 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v113 = sub_22BC4(&qword_54B48);
  __chkstk_darwin(v113);
  uint64_t v126 = (char *)&v99 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v121 = sub_22BC4(&qword_54B38);
  __chkstk_darwin(v121);
  uint64_t v128 = (uint64_t)&v99 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v125 = sub_22BC4(&qword_54B28);
  __chkstk_darwin(v125);
  uint64_t v129 = (char *)&v99 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v127 = sub_22BC4(&qword_54B18);
  __chkstk_darwin(v127);
  uint64_t v130 = (uint64_t)&v99 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v132 = sub_22BC4(&qword_54B00);
  __chkstk_darwin(v132);
  uint64_t v133 = (uint64_t)&v99 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = (void *)sub_38FC0();
  uint64_t v23 = (void *)sub_38FC0();
  id v24 = settingsLocString(v22, v23);

  if (v24)
  {
    uint64_t v25 = sub_38FE0();
    uint64_t v27 = v26;

    *(void *)&long long v141 = v25;
    *((void *)&v141 + 1) = v27;
    uint64_t v28 = sub_39070();
    uint64_t v30 = v29;
    long long v144 = *(_OWORD *)(a1 + 16);
    uint64_t v145 = *(void *)(a1 + 32);
    long long v139 = *(_OWORD *)(a1 + 16);
    uint64_t v140 = *(void *)(a1 + 32);
    sub_22BC4(&qword_54158);
    sub_38E80();
    *(void *)&long long v141 = v28;
    *((void *)&v141 + 1) = v30;
    sub_2447C();
    uint64_t v31 = v99;
    sub_38F70();
    uint64_t v32 = sub_26748(&qword_54B78, &qword_54330);
    long long v33 = v101;
    uint64_t v34 = v102;
    sub_38CB0();
    (*(void (**)(char *, uint64_t))(v100 + 8))(v31, v34);
    sub_38A00();
    uint64_t v35 = sub_38A10();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v35 - 8) + 56))(v9, 0, 1, v35);
    *(void *)&long long v141 = v34;
    *((void *)&v141 + 1) = v32;
    uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    uint64_t v37 = v105;
    uint64_t v38 = v104;
    sub_38D00();
    sub_265A0((uint64_t)v9, &qword_54BD8);
    (*(void (**)(char *, uint64_t))(v103 + 8))(v33, v38);
    long long v141 = v144;
    uint64_t v142 = v145;
    sub_38E60();
    long long v141 = v139;
    uint64_t v39 = (_OWORD *)swift_allocObject();
    long long v40 = *(_OWORD *)(a1 + 48);
    v39[3] = *(_OWORD *)(a1 + 32);
    v39[4] = v40;
    v39[5] = *(_OWORD *)(a1 + 64);
    long long v41 = *(_OWORD *)(a1 + 16);
    v39[1] = *(_OWORD *)a1;
    v39[2] = v41;
    sub_35A98(a1);
    *(void *)&long long v139 = v38;
    *((void *)&v139 + 1) = OpaqueTypeConformance2;
    uint64_t v42 = swift_getOpaqueTypeConformance2();
    uint64_t v43 = v107;
    uint64_t v44 = v108;
    sub_38D60();
    swift_release();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v106 + 8))(v37, v44);
    uint64_t v45 = v119;
    sub_385C0();
    *(void *)&long long v141 = v44;
    *((void *)&v141 + 1) = &type metadata for String;
    uint64_t v142 = v42;
    uint64_t v143 = &protocol witness table for String;
    uint64_t v46 = swift_getOpaqueTypeConformance2();
    long long v47 = v111;
    uint64_t v48 = v110;
    sub_38C30();
    (*(void (**)(char *, uint64_t))(v123 + 8))(v45, v124);
    (*(void (**)(char *, uint64_t))(v109 + 8))(v43, v48);
    uint64_t v49 = (_OWORD *)swift_allocObject();
    long long v50 = *(_OWORD *)(a1 + 48);
    v49[3] = *(_OWORD *)(a1 + 32);
    v49[4] = v50;
    v49[5] = *(_OWORD *)(a1 + 64);
    long long v51 = *(_OWORD *)(a1 + 16);
    v49[1] = *(_OWORD *)a1;
    v49[2] = v51;
    sub_35A98(a1);
    uint64_t v52 = v131;
    sub_38670();
    *(void *)&long long v141 = v48;
    *((void *)&v141 + 1) = v46;
    uint64_t v53 = swift_getOpaqueTypeConformance2();
    uint64_t v54 = v114;
    uint64_t v55 = v115;
    sub_38D70();
    swift_release();
    (*(void (**)(char *, uint64_t))(v134 + 8))(v52, v135);
    (*(void (**)(char *, uint64_t))(v112 + 8))(v47, v55);
    long long v139 = *(_OWORD *)(a1 + 40);
    LOBYTE(v140) = *(unsigned char *)(a1 + 56);
    sub_22BC4(&qword_54B98);
    sub_38540();
    *(void *)&long long v141 = v55;
    *((void *)&v141 + 1) = v53;
    swift_getOpaqueTypeConformance2();
    uint64_t v56 = v117;
    uint64_t v57 = v118;
    sub_38D40();
    swift_release();
    swift_release();
    (*(void (**)(char *, uint64_t))(v116 + 8))(v54, v57);
    LOBYTE(v57) = sub_38AE0();
    sub_38520();
    uint64_t v59 = v58;
    uint64_t v61 = v60;
    uint64_t v63 = v62;
    uint64_t v65 = v64;
    uint64_t v66 = v120;
    uint64_t v67 = (uint64_t)v126;
    uint64_t v68 = v122;
    (*(void (**)(char *, char *, uint64_t))(v120 + 16))(v126, v56, v122);
    uint64_t v69 = v67 + *(int *)(v113 + 36);
    *(unsigned char *)uint64_t v69 = v57;
    *(void *)(v69 + 8) = v59;
    *(void *)(v69 + 16) = v61;
    *(void *)(v69 + 24) = v63;
    *(void *)(v69 + 32) = v65;
    *(unsigned char *)(v69 + 40) = 0;
    (*(void (**)(char *, uint64_t))(v66 + 8))(v56, v68);
    id v70 = [self tertiarySystemFillColor];
    uint64_t v71 = sub_38D80();
    LOBYTE(v68) = sub_38AE0();
    uint64_t v72 = v128;
    sub_26660(v67, v128, &qword_54B48);
    uint64_t v73 = v72 + *(int *)(v121 + 36);
    *(void *)uint64_t v73 = v71;
    *(unsigned char *)(v73 + 8) = v68;
    sub_265A0(v67, &qword_54B48);
    uint64_t v74 = v137;
    uint64_t v75 = &v137[*(int *)(v136 + 20)];
    uint64_t v76 = enum case for RoundedCornerStyle.continuous(_:);
    uint64_t v77 = sub_388F0();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v77 - 8) + 104))(v75, v76, v77);
    __asm { FMOV            V0.2D, #12.0 }
    *uint64_t v74 = _Q0;
    uint64_t v83 = (uint64_t)v129;
    uint64_t v84 = (uint64_t)&v129[*(int *)(v125 + 36)];
    sub_35F98((uint64_t)v74, v84);
    *(_WORD *)(v84 + *(int *)(sub_22BC4(&qword_549C0) + 36)) = 256;
    sub_26660(v72, v83, &qword_54B38);
    sub_31B34((uint64_t)v74);
    sub_265A0(v72, &qword_54B38);
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v86 = v130;
    sub_26660(v83, v130, &qword_54B28);
    uint64_t v87 = v86 + *(int *)(v127 + 36);
    *(void *)uint64_t v87 = KeyPath;
    *(unsigned char *)(v87 + 8) = 1;
    sub_265A0(v83, &qword_54B28);
    LOBYTE(v76) = sub_38AF0();
    char v88 = sub_38B20();
    sub_38B20();
    if (sub_38B20() != v76) {
      char v88 = sub_38B20();
    }
    sub_38520();
    uint64_t v90 = v89;
    uint64_t v92 = v91;
    uint64_t v94 = v93;
    uint64_t v96 = v95;
    uint64_t v97 = v133;
    sub_26660(v86, v133, &qword_54B18);
    uint64_t v98 = v97 + *(int *)(v132 + 36);
    *(unsigned char *)uint64_t v98 = v88;
    *(void *)(v98 + 8) = v90;
    *(void *)(v98 + 16) = v92;
    *(void *)(v98 + 24) = v94;
    *(void *)(v98 + 32) = v96;
    *(unsigned char *)(v98 + 40) = 0;
    sub_265A0(v86, &qword_54B18);
    sub_265FC(v97, v138, &qword_54B00);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_341CC(uint64_t a1)
{
  long long v6 = *(_OWORD *)(a1 + 16);
  uint64_t v7 = *(void *)(a1 + 32);
  long long v4 = *(_OWORD *)(a1 + 16);
  uint64_t v5 = *(void *)(a1 + 32);
  sub_22BC4(&qword_54158);
  sub_38E60();
  char v1 = sub_342E0();
  uint64_t result = swift_bridgeObjectRelease();
  if (v1)
  {
    sub_265FC((uint64_t)&v7, (uint64_t)v9, &qword_54BE8);
    long long v8 = v6;
    long long v4 = v6;
    uint64_t v5 = v7;
    sub_36050((uint64_t)&v8);
    sub_3607C((uint64_t)v9);
    sub_38E60();
    sub_343FC(&v3);
    long long v4 = v6;
    uint64_t v5 = v7;
    sub_38E70();
    sub_360A8((uint64_t)&v8);
    return sub_360D4((uint64_t)v9);
  }
  return result;
}

uint64_t sub_342E0()
{
  swift_bridgeObjectRetain();
  while (1)
  {
    uint64_t result = sub_39050();
    unint64_t v2 = v1;
    if (!v1)
    {
LABEL_17:
      swift_bridgeObjectRelease();
      return v2 != 0;
    }
    if (!((v1 & 0x2000000000000000) != 0 ? HIBYTE(v1) & 0xF : result & 0xFFFFFFFFFFFFLL)) {
      break;
    }
    if ((v1 & 0x1000000000000000) != 0)
    {
      int v4 = sub_39200();
    }
    else
    {
      if ((v1 & 0x2000000000000000) == 0 && (result & 0x1000000000000000) == 0) {
        sub_39230();
      }
      int v4 = sub_39240();
    }
    int v5 = v4;
    swift_bridgeObjectRelease();
    if ((v5 - 14) > 0xFFFFFFFB || (v5 - 8232) < 2 || v5 == 133) {
      goto LABEL_17;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_343FC(void *a1)
{
  swift_bridgeObjectRetain();
  uint64_t result = sub_39050();
  if (v3)
  {
    uint64_t v4 = result;
    unint64_t v5 = v3;
    while ((v5 & 0x2000000000000000) != 0 ? HIBYTE(v5) & 0xF : v4 & 0xFFFFFFFFFFFFLL)
    {
      if ((v5 & 0x1000000000000000) != 0)
      {
        int v8 = sub_39200();
      }
      else
      {
        if ((v5 & 0x2000000000000000) == 0 && (v4 & 0x1000000000000000) == 0) {
          sub_39230();
        }
        int v8 = sub_39240();
      }
      if ((v8 - 14) <= 0xFFFFFFFB && (v8 - 8232) >= 2 && v8 != 133)
      {
        v9._countAndFlagsBits = v4;
        v9._object = (void *)v5;
        sub_39030(v9);
      }
      swift_bridgeObjectRelease();
      uint64_t result = sub_39050();
      uint64_t v4 = result;
      unint64_t v5 = v6;
      if (!v6) {
        goto LABEL_18;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_18:
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    *a1 = 0;
    a1[1] = 0xE000000000000000;
  }
  return result;
}

uint64_t sub_34568(long long *a1)
{
  long long v21 = a1[1];
  uint64_t v22 = *((void *)a1 + 4);
  sub_22BC4(&qword_54158);
  sub_38E60();
  char v2 = sub_35CA8(v24, *((uint64_t *)&v24 + 1));
  swift_bridgeObjectRelease();
  if (v2)
  {
    unint64_t v3 = a1 + 1;
    long long v24 = *a1;
    uint64_t v4 = *((void *)&v24 + 1);
    long long v21 = *v3;
    uint64_t v22 = *((void *)v3 + 2);
    swift_retain();
    sub_38E60();
    long long v21 = v23;
    uint64_t v5 = sub_38330();
    uint64_t v6 = *(void *)(v5 - 8);
    __chkstk_darwin(v5);
    int v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_38320();
    sub_2447C();
    uint64_t v9 = sub_391D0();
    uint64_t v11 = v10;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    uint64_t v12 = (uint64_t *)(v4 + OBJC_IVAR____TtC20VoiceControlSettings32CACPhoneticVocabularyCoordinator_customWord);
    uint64_t *v12 = v9;
    v12[1] = v11;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_35E84((uint64_t)&v24);
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    uint64_t v13 = (void (*)(long long *, void))sub_38450();
    uint64_t v15 = v14;
    uint64_t v16 = *v14;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    void *v15 = v16;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      uint64_t v16 = sub_2D720(0, v16[2] + 1, 1, v16);
      void *v15 = v16;
    }
    unint64_t v19 = v16[2];
    unint64_t v18 = v16[3];
    if (v19 >= v18 >> 1)
    {
      uint64_t v16 = sub_2D720((void *)(v18 > 1), v19 + 1, 1, v16);
      void *v15 = v16;
    }
    void v16[2] = v19 + 1;
    *((unsigned char *)v16 + v19 + 32) = 1;
    v13(&v21, 0);
    swift_release();
    swift_release();
    return sub_35E84((uint64_t)&v24);
  }
  else
  {
    sub_22BC4(&qword_54000);
    return sub_38E70();
  }
}

void sub_34840(_OWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_22BC4(&qword_54080);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_22BC4(&qword_54008);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = (void *)sub_38FC0();
  uint64_t v12 = (void *)sub_38FC0();
  id v13 = settingsLocString(v11, v12);

  if (v13)
  {
    uint64_t v14 = sub_38FE0();
    uint64_t v16 = v15;

    uint64_t v22 = v14;
    uint64_t v23 = v16;
    uint64_t v22 = sub_39070();
    uint64_t v23 = v17;
    sub_38500();
    uint64_t v18 = sub_38510();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v6, 0, 1, v18);
    unint64_t v19 = (_OWORD *)swift_allocObject();
    long long v20 = a1[3];
    v19[3] = a1[2];
    v19[4] = v20;
    v19[5] = a1[4];
    long long v21 = a1[1];
    v19[1] = *a1;
    v19[2] = v21;
    sub_35A98((uint64_t)a1);
    sub_2447C();
    sub_38EA0();
    (*(void (**)(uint64_t, char *, uint64_t))(v8 + 32))(a2, v10, v7);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_34ACC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v20 = a2;
  uint64_t v19 = sub_22BC4(&qword_54BA0);
  __chkstk_darwin(v19);
  uint64_t v4 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_22BC4(&qword_54BA8);
  uint64_t v5 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_389B0();
  __chkstk_darwin(v8 - 8);
  uint64_t v9 = sub_22BC4(&qword_54BB0);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_38990();
  uint64_t v22 = a1;
  sub_22BC4(&qword_54008);
  sub_26748(&qword_54020, &qword_54008);
  sub_385E0();
  sub_389A0();
  uint64_t v21 = a1;
  sub_22BC4(&qword_54BB8);
  sub_35B10();
  sub_385E0();
  id v13 = &v4[*(int *)(v19 + 48)];
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v4, v12, v9);
  uint64_t v14 = v13;
  uint64_t v15 = v18;
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v14, v7, v18);
  sub_38960();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v15);
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

uint64_t sub_34DF0(_OWORD *a1)
{
  char v2 = (_OWORD *)swift_allocObject();
  long long v3 = a1[3];
  v2[3] = a1[2];
  v2[4] = v3;
  v2[5] = a1[4];
  long long v4 = a1[1];
  v2[1] = *a1;
  v2[2] = v4;
  sub_35A98((uint64_t)a1);
  return sub_38E90();
}

uint64_t sub_34EA8(uint64_t a1)
{
  unint64_t v1 = (void (**)(uint64_t))(*(void *)(a1 + 8)
                                     + OBJC_IVAR____TtC20VoiceControlSettings32CACPhoneticVocabularyCoordinator_dismissEnrollmentFlow);
  swift_beginAccess();
  char v2 = *v1;
  uint64_t v3 = swift_retain();
  v2(v3);
  return swift_release();
}

void sub_34F18(uint64_t a1@<X8>)
{
  char v2 = (void *)sub_38FC0();
  uint64_t v3 = (void *)sub_38FC0();
  id v4 = settingsLocString(v2, v3);

  if (v4)
  {
    sub_38FE0();

    sub_39070();
    sub_2447C();
    *(void *)a1 = sub_38BE0();
    *(void *)(a1 + 8) = v5;
    *(unsigned char *)(a1 + 16) = v6 & 1;
    *(void *)(a1 + 24) = v7;
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_3500C@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_22BC4(&qword_54008);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = &v16[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = (_OWORD *)swift_allocObject();
  long long v9 = a1[3];
  v8[3] = a1[2];
  v8[4] = v9;
  v8[5] = a1[4];
  long long v10 = a1[1];
  v8[1] = *a1;
  v8[2] = v10;
  uint64_t v17 = a1;
  sub_35A98((uint64_t)a1);
  sub_38E90();
  long long v18 = a1[1];
  uint64_t v19 = *((void *)a1 + 4);
  sub_22BC4(&qword_54158);
  sub_38E60();
  char v11 = sub_35CA8(v20, v21);
  swift_bridgeObjectRelease();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v13 = swift_allocObject();
  *(unsigned char *)(v13 + 16) = (v11 & 1) == 0;
  (*(void (**)(uint64_t, unsigned char *, uint64_t))(v5 + 16))(a2, v7, v4);
  uint64_t v14 = (uint64_t *)(a2 + *(int *)(sub_22BC4(&qword_54BB8) + 36));
  *uint64_t v14 = KeyPath;
  v14[1] = (uint64_t)sub_35E6C;
  v14[2] = v13;
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_35228(long long *a1)
{
  long long v1 = a1[1];
  long long v22 = *a1;
  uint64_t v2 = *((void *)&v22 + 1);
  long long v19 = v1;
  uint64_t v20 = *((void *)a1 + 4);
  swift_retain();
  sub_22BC4(&qword_54158);
  sub_38E60();
  long long v19 = v21;
  uint64_t v3 = sub_38330();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_38320();
  sub_2447C();
  uint64_t v7 = sub_391D0();
  uint64_t v9 = v8;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  long long v10 = (uint64_t *)(v2 + OBJC_IVAR____TtC20VoiceControlSettings32CACPhoneticVocabularyCoordinator_customWord);
  uint64_t *v10 = v7;
  v10[1] = v9;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_35E84((uint64_t)&v22);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  char v11 = (void (*)(long long *, void))sub_38450();
  uint64_t v13 = v12;
  uint64_t v14 = *v12;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  void *v13 = v14;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v14 = sub_2D720(0, v14[2] + 1, 1, v14);
    void *v13 = v14;
  }
  unint64_t v17 = v14[2];
  unint64_t v16 = v14[3];
  if (v17 >= v16 >> 1)
  {
    uint64_t v14 = sub_2D720((void *)(v16 > 1), v17 + 1, 1, v14);
    void *v13 = v14;
  }
  v14[2] = v17 + 1;
  *((unsigned char *)v14 + v17 + 32) = 1;
  v11(&v19, 0);
  swift_release();
  swift_release();
  return sub_35E84((uint64_t)&v22);
}

void sub_3547C(uint64_t a1@<X8>)
{
  uint64_t v2 = (void *)sub_38FC0();
  uint64_t v3 = (void *)sub_38FC0();
  id v4 = settingsLocString(v2, v3);

  if (v4)
  {
    sub_38FE0();

    sub_39070();
    sub_2447C();
    *(void *)a1 = sub_38BE0();
    *(void *)(a1 + 8) = v5;
    *(unsigned char *)(a1 + 16) = v6 & 1;
    *(void *)(a1 + 24) = v7;
  }
  else
  {
    __break(1u);
  }
}

void sub_3557C(uint64_t a1@<X8>)
{
}

unint64_t sub_355C0()
{
  unint64_t result = qword_53FC8;
  if (!qword_53FC8)
  {
    sub_383C0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_53FC8);
  }
  return result;
}

void sub_35618(uint64_t a1@<X8>)
{
  sub_33178(*(void *)(v1 + 16), a1);
}

unint64_t sub_35620()
{
  unint64_t result = qword_54B08;
  if (!qword_54B08)
  {
    sub_24414(&qword_54B00);
    sub_3569C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_54B08);
  }
  return result;
}

unint64_t sub_3569C()
{
  unint64_t result = qword_54B10;
  if (!qword_54B10)
  {
    sub_24414(&qword_54B18);
    sub_3573C();
    sub_26748(&qword_540C8, &qword_540D0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_54B10);
  }
  return result;
}

unint64_t sub_3573C()
{
  unint64_t result = qword_54B20;
  if (!qword_54B20)
  {
    sub_24414(&qword_54B28);
    sub_357DC();
    sub_26748(&qword_549F0, &qword_549C0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_54B20);
  }
  return result;
}

unint64_t sub_357DC()
{
  unint64_t result = qword_54B30;
  if (!qword_54B30)
  {
    sub_24414(&qword_54B38);
    sub_3587C();
    sub_26748(&qword_549E0, &qword_549E8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_54B30);
  }
  return result;
}

unint64_t sub_3587C()
{
  unint64_t result = qword_54B40;
  if (!qword_54B40)
  {
    sub_24414(&qword_54B48);
    sub_24414(&qword_54B50);
    sub_24414(&qword_54B58);
    sub_24414(&qword_54B60);
    sub_24414(&qword_54B68);
    sub_24414(&qword_54B70);
    sub_24414(&qword_54330);
    sub_26748(&qword_54B78, &qword_54330);
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_54B40);
  }
  return result;
}

void sub_35A80(uint64_t a1@<X8>)
{
  sub_34840(*(_OWORD **)(v1 + 16), a1);
}

uint64_t sub_35A88@<X0>(uint64_t a1@<X8>)
{
  return sub_34ACC(*(void *)(v1 + 16), a1);
}

uint64_t sub_35A98(uint64_t a1)
{
  return a1;
}

uint64_t sub_35B00()
{
  return sub_34DF0(*(_OWORD **)(v0 + 16));
}

uint64_t sub_35B08@<X0>(uint64_t a1@<X8>)
{
  return sub_3500C(*(_OWORD **)(v1 + 16), a1);
}

unint64_t sub_35B10()
{
  unint64_t result = qword_54BC0;
  if (!qword_54BC0)
  {
    sub_24414(&qword_54BB8);
    sub_26748(&qword_54020, &qword_54008);
    sub_26748(&qword_54BC8, &qword_54BD0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_54BC0);
  }
  return result;
}

uint64_t sub_35BD8()
{
  return sub_35228((long long *)(v0 + 16));
}

void sub_35BE0(uint64_t a1@<X8>)
{
}

uint64_t sub_35BE8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_387A0();
  *a1 = result;
  return result;
}

uint64_t sub_35C14()
{
  return sub_387B0();
}

uint64_t sub_35C3C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_387F0();
  *a1 = result & 1;
  return result;
}

uint64_t sub_35C6C()
{
  return sub_38800();
}

unsigned char *sub_35C94(unsigned char *result, char a2)
{
  *result &= a2 ^ 1;
  return result;
}

uint64_t sub_35CA8(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = a1;
  uint64_t v15 = a2;
  uint64_t v4 = sub_38330();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_38320();
  sub_2447C();
  uint64_t v8 = sub_391D0();
  unint64_t v10 = v9;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  swift_bridgeObjectRelease();
  uint64_t v11 = HIBYTE(v10) & 0xF;
  if ((v10 & 0x2000000000000000) == 0) {
    uint64_t v11 = v8 & 0xFFFFFFFFFFFFLL;
  }
  if (v11)
  {
    uint64_t v14 = a1;
    uint64_t v15 = a2;
    v13[0] = 45506;
    v13[1] = 0xA200000000000000;
    LOBYTE(v11) = sub_391E0() ^ 1;
  }
  return v11 & 1;
}

uint64_t sub_35E04@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_387F0();
  *a1 = result & 1;
  return result;
}

uint64_t sub_35E34()
{
  return sub_38800();
}

uint64_t sub_35E5C()
{
  return _swift_deallocObject(v0, 17, 7);
}

unsigned char *sub_35E6C(unsigned char *result)
{
  *result &= ~*(unsigned char *)(v1 + 16) & 1;
  return result;
}

uint64_t sub_35E84(uint64_t a1)
{
  return a1;
}

uint64_t sub_35EBC()
{
  return sub_34EA8(v0 + 16);
}

void sub_35EC4(uint64_t a1@<X8>)
{
}

uint64_t sub_35ED0()
{
  return sub_38530();
}

uint64_t sub_35F2C()
{
  return sub_341CC(v0 + 16);
}

uint64_t sub_35F38()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 96, 7);
}

uint64_t sub_35F90()
{
  return sub_34568((long long *)(v0 + 16));
}

uint64_t sub_35F98(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_38740();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_35FFC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_387A0();
  *a1 = result;
  return result;
}

uint64_t sub_36028()
{
  return sub_387B0();
}

uint64_t sub_36050(uint64_t a1)
{
  return a1;
}

uint64_t sub_3607C(uint64_t a1)
{
  return a1;
}

uint64_t sub_360A8(uint64_t a1)
{
  return a1;
}

uint64_t sub_360D4(uint64_t a1)
{
  return a1;
}

unint64_t sub_36104()
{
  unint64_t result = qword_54BF0;
  if (!qword_54BF0)
  {
    sub_24414(&qword_54AF8);
    sub_24414(&qword_54AE8);
    sub_24414(&qword_54B88);
    sub_24414(&qword_54AE0);
    sub_24414(&qword_54008);
    sub_26748(&qword_54B80, &qword_54AE0);
    sub_2447C();
    sub_26748(&qword_54020, &qword_54008);
    swift_getOpaqueTypeConformance2();
    sub_26748(&qword_54B90, &qword_54B88);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_54BF0);
  }
  return result;
}

uint64_t CACPhoneticVocabularyNavigationView.init(locale:completionHandler:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  *(void *)a5 = sub_36398;
  *(void *)(a5 + 8) = 0;
  *(unsigned char *)(a5 + 16) = 0;
  unint64_t v10 = (int *)type metadata accessor for CACPhoneticVocabularyNavigationView();
  uint64_t v11 = (uint64_t *)(a5 + v10[5]);
  uint64_t *v11 = swift_getKeyPath();
  sub_22BC4(&qword_53DE0);
  uint64_t result = swift_storeEnumTagMultiPayload();
  uint64_t v13 = (void *)(a5 + v10[7]);
  uint64_t v14 = (void *)(a5 + v10[6]);
  *uint64_t v14 = a1;
  v14[1] = a2;
  void *v13 = a3;
  v13[1] = a4;
  return result;
}

uint64_t (*variable initialization expression of CACPhoneticVocabularyNavigationView._coordinator())()
{
  return sub_36398;
}

uint64_t sub_36398()
{
  return sub_2D2BC();
}

uint64_t type metadata accessor for CACPhoneticVocabularyNavigationView()
{
  uint64_t result = qword_54CA8;
  if (!qword_54CA8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t CACPhoneticVocabularyNavigationView.completionHandler.getter()
{
  uint64_t v1 = *(void *)(v0 + *(int *)(type metadata accessor for CACPhoneticVocabularyNavigationView() + 28));
  swift_retain();
  return v1;
}

uint64_t CACPhoneticVocabularyNavigationView.completionHandler.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)(v2 + *(int *)(type metadata accessor for CACPhoneticVocabularyNavigationView() + 28));
  uint64_t result = swift_release();
  *uint64_t v5 = a1;
  v5[1] = a2;
  return result;
}

double (*CACPhoneticVocabularyNavigationView.completionHandler.modify())(double, double)
{
  return nullsub_6;
}

uint64_t CACPhoneticVocabularyNavigationView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v23 = a1;
  uint64_t v3 = type metadata accessor for CACPhoneticVocabularyNavigationView();
  uint64_t v21 = *(void *)(v3 - 8);
  v19[1] = *(void *)(v21 + 64);
  __chkstk_darwin(v3 - 8);
  v19[0] = (uint64_t)v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_22BC4(&qword_54BF8);
  uint64_t v20 = *(void *)(v22 - 8);
  __chkstk_darwin(v22);
  uint64_t v6 = (char *)v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for CACPhoneticVocabularyCoordinator();
  sub_36D88(&qword_54378, (void (*)(uint64_t))type metadata accessor for CACPhoneticVocabularyCoordinator);
  sub_385B0();
  swift_getKeyPath();
  sub_38660();
  swift_release();
  swift_release();
  uint64_t v31 = v33;
  long long v32 = v34;
  uint64_t v24 = v1;
  sub_22BC4(&qword_546A8);
  sub_22BC4(&qword_54C00);
  sub_26748(&qword_54C08, &qword_546A8);
  sub_26748(&qword_54C10, &qword_546A8);
  sub_26748(&qword_54C18, &qword_546A8);
  uint64_t v7 = sub_24414(&qword_54C20);
  unint64_t v8 = sub_36C88();
  unint64_t v9 = sub_36DD0();
  uint64_t v25 = v7;
  uint64_t v26 = &type metadata for CACPhoneticVocabularyCoordinator.Stage;
  uint64_t v27 = v7;
  unint64_t v28 = v8;
  unint64_t v29 = v9;
  unint64_t v30 = v8;
  swift_getOpaqueTypeConformance2();
  sub_386D0();
  uint64_t v10 = v2;
  uint64_t v11 = v19[0];
  sub_380A4(v10, v19[0], (uint64_t (*)(void))type metadata accessor for CACPhoneticVocabularyNavigationView);
  unint64_t v12 = (*(unsigned __int8 *)(v21 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
  uint64_t v13 = swift_allocObject();
  sub_2C8B8(v11, v13 + v12);
  uint64_t v14 = v20;
  uint64_t v16 = v22;
  uint64_t v15 = v23;
  (*(void (**)(uint64_t, char *, uint64_t))(v20 + 16))(v23, v6, v22);
  unint64_t v17 = (uint64_t (**)())(v15 + *(int *)(sub_22BC4(&qword_54C48) + 36));
  _OWORD *v17 = sub_372F0;
  v17[1] = (uint64_t (*)())v13;
  v17[2] = 0;
  v17[3] = 0;
  return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v6, v16);
}

uint64_t sub_368E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v30 = a2;
  uint64_t v3 = type metadata accessor for CACPhoneticVocabularyNavigationView();
  uint64_t v29 = *(void *)(v3 - 8);
  uint64_t v27 = *(void *)(v29 + 64);
  __chkstk_darwin(v3 - 8);
  uint64_t v26 = (uint64_t)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_22BC4(&qword_54CF8);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = sub_22BC4(&qword_54C20);
  __chkstk_darwin(v28);
  unint64_t v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for CACPhoneticVocabularyCoordinator();
  sub_36D88(&qword_54378, (void (*)(uint64_t))type metadata accessor for CACPhoneticVocabularyCoordinator);
  sub_385A0();
  uint64_t v10 = sub_38650();
  uint64_t v12 = v11;
  uint64_t v31 = 0;
  unint64_t v32 = 0xE000000000000000;
  sub_38E50();
  long long v25 = v33;
  uint64_t v13 = v34;
  char v14 = sub_38550();
  uint64_t v16 = v15;
  char v18 = v17;
  LOBYTE(v31) = 0;
  sub_38E50();
  char v19 = v33;
  uint64_t v20 = *((void *)&v33 + 1);
  *(void *)uint64_t v7 = v10;
  *((void *)v7 + 1) = v12;
  *((_OWORD *)v7 + 1) = v25;
  *((void *)v7 + 4) = v13;
  v7[40] = v14 & 1;
  *((void *)v7 + 6) = v16;
  v7[56] = v18 & 1;
  v7[64] = v19;
  *((void *)v7 + 9) = v20;
  swift_storeEnumTagMultiPayload();
  type metadata accessor for CACPhoneticVocabularyRecordingView(0);
  sub_36D34();
  sub_36D88(&qword_54C38, (void (*)(uint64_t))type metadata accessor for CACPhoneticVocabularyRecordingView);
  sub_38980();
  uint64_t v21 = v26;
  sub_380A4(a1, v26, (uint64_t (*)(void))type metadata accessor for CACPhoneticVocabularyNavigationView);
  unint64_t v22 = (*(unsigned __int8 *)(v29 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v29 + 80);
  uint64_t v23 = swift_allocObject();
  sub_2C8B8(v21, v23 + v22);
  sub_36C88();
  sub_36DD0();
  sub_38CC0();
  swift_release();
  return sub_265A0((uint64_t)v9, &qword_54C20);
}

uint64_t sub_36C80@<X0>(uint64_t a1@<X8>)
{
  return sub_368E0(*(void *)(v1 + 16), a1);
}

unint64_t sub_36C88()
{
  unint64_t result = qword_54C28;
  if (!qword_54C28)
  {
    sub_24414(&qword_54C20);
    sub_36D34();
    sub_36D88(&qword_54C38, (void (*)(uint64_t))type metadata accessor for CACPhoneticVocabularyRecordingView);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_54C28);
  }
  return result;
}

unint64_t sub_36D34()
{
  unint64_t result = qword_54C30;
  if (!qword_54C30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_54C30);
  }
  return result;
}

uint64_t sub_36D88(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_36DD0()
{
  unint64_t result = qword_54C40;
  if (!qword_54C40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_54C40);
  }
  return result;
}

uint64_t sub_36E24@<X0>(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  *(void *)&long long v24 = a2;
  uint64_t v25 = a4;
  uint64_t v26 = type metadata accessor for CACPhoneticVocabularyRecordingView(0);
  __chkstk_darwin(v26);
  uint64_t v7 = (uint64_t *)((char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = sub_22BC4(&qword_54CF8);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for CACPhoneticVocabularyCoordinator();
  sub_36D88(&qword_54378, (void (*)(uint64_t))type metadata accessor for CACPhoneticVocabularyCoordinator);
  uint64_t v11 = sub_385A0();
  if (a1)
  {
    swift_bridgeObjectRetain();
    sub_13680(v11, v24, a3, v7);
    sub_380A4((uint64_t)v7, (uint64_t)v10, type metadata accessor for CACPhoneticVocabularyRecordingView);
    swift_storeEnumTagMultiPayload();
    sub_36D34();
    sub_36D88(&qword_54C38, (void (*)(uint64_t))type metadata accessor for CACPhoneticVocabularyRecordingView);
    sub_38980();
    return sub_24D50((uint64_t)v7);
  }
  else
  {
    uint64_t v12 = sub_38650();
    uint64_t v14 = v13;
    uint64_t v27 = 0;
    unint64_t v28 = 0xE000000000000000;
    sub_38E50();
    long long v24 = v29;
    uint64_t v15 = v30;
    char v16 = sub_38550();
    uint64_t v18 = v17;
    char v20 = v19;
    LOBYTE(v27) = 0;
    sub_38E50();
    char v21 = v29;
    uint64_t v22 = *((void *)&v29 + 1);
    *(void *)uint64_t v10 = v12;
    *((void *)v10 + 1) = v14;
    *((_OWORD *)v10 + 1) = v24;
    *((void *)v10 + 4) = v15;
    v10[40] = v16 & 1;
    *((void *)v10 + 6) = v18;
    v10[56] = v20 & 1;
    v10[64] = v21;
    *((void *)v10 + 9) = v22;
    swift_storeEnumTagMultiPayload();
    sub_36D34();
    sub_36D88(&qword_54C38, (void (*)(uint64_t))type metadata accessor for CACPhoneticVocabularyRecordingView);
    return sub_38980();
  }
}

uint64_t sub_37134(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for CACPhoneticVocabularyNavigationView();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  __chkstk_darwin(v2 - 8);
  type metadata accessor for CACPhoneticVocabularyCoordinator();
  sub_36D88(&qword_54378, (void (*)(uint64_t))type metadata accessor for CACPhoneticVocabularyCoordinator);
  uint64_t v5 = sub_385A0();
  sub_380A4(a1, (uint64_t)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for CACPhoneticVocabularyNavigationView);
  unint64_t v6 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = swift_allocObject();
  sub_2C8B8((uint64_t)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v7 + v6);
  uint64_t v8 = (uint64_t (**)())(v5
                      + OBJC_IVAR____TtC20VoiceControlSettings32CACPhoneticVocabularyCoordinator_dismissEnrollmentFlow);
  swift_beginAccess();
  _OWORD *v8 = sub_37E40;
  v8[1] = (uint64_t (*)())v7;
  swift_release();
  return swift_release();
}

uint64_t sub_372E8()
{
  return swift_release();
}

uint64_t sub_372F0()
{
  return sub_37E58(sub_37134);
}

uint64_t sub_37308()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_37324(uint64_t a1)
{
  uint64_t v2 = sub_38630();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for CACPhoneticVocabularyNavigationView();
  sub_21194((uint64_t)v5);
  sub_38620();
  uint64_t v7 = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(uint64_t))(a1 + *(int *)(v6 + 28)))(v7);
}

void *initializeBufferWithCopyOfBuffer for CACPhoneticVocabularyNavigationView(void *a1, uint64_t *a2, int *a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *a1 = *a2;
    uint64_t v4 = (void *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    uint64_t v7 = *a2;
    uint64_t v8 = a2[1];
    char v9 = *((unsigned char *)a2 + 16);
    sub_3758C();
    *uint64_t v4 = v7;
    v4[1] = v8;
    *((unsigned char *)v4 + 16) = v9;
    uint64_t v10 = a3[5];
    uint64_t v11 = (void *)((char *)v4 + v10);
    uint64_t v12 = (uint64_t *)((char *)a2 + v10);
    sub_22BC4(&qword_53DE0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v13 = sub_38630();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
    }
    else
    {
      void *v11 = *v12;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v15 = a3[6];
    uint64_t v16 = a3[7];
    uint64_t v17 = (void *)((char *)v4 + v15);
    uint64_t v18 = (uint64_t *)((char *)a2 + v15);
    uint64_t v19 = v18[1];
    void *v17 = *v18;
    v17[1] = v19;
    char v20 = (void *)((char *)v4 + v16);
    char v21 = (uint64_t *)((char *)a2 + v16);
    uint64_t v22 = v21[1];
    void *v20 = *v21;
    v20[1] = v22;
    swift_bridgeObjectRetain();
  }
  swift_retain();
  return v4;
}

uint64_t sub_3758C()
{
  return swift_retain();
}

uint64_t destroy for CACPhoneticVocabularyNavigationView(uint64_t a1, uint64_t a2)
{
  sub_372E8();
  uint64_t v4 = a1 + *(int *)(a2 + 20);
  sub_22BC4(&qword_53DE0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = sub_38630();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }
  else
  {
    swift_release();
  }
  swift_bridgeObjectRelease();

  return swift_release();
}

uint64_t initializeWithCopy for CACPhoneticVocabularyNavigationView(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v6 = *a2;
  uint64_t v7 = a2[1];
  char v8 = *((unsigned char *)a2 + 16);
  sub_3758C();
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v7;
  *(unsigned char *)(a1 + 16) = v8;
  uint64_t v9 = a3[5];
  uint64_t v10 = (void *)(a1 + v9);
  uint64_t v11 = (uint64_t *)((char *)a2 + v9);
  sub_22BC4(&qword_53DE0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v12 = sub_38630();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
  }
  else
  {
    void *v10 = *v11;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v13 = a3[6];
  uint64_t v14 = a3[7];
  uint64_t v15 = (void *)(a1 + v13);
  uint64_t v16 = (uint64_t *)((char *)a2 + v13);
  uint64_t v17 = v16[1];
  void *v15 = *v16;
  v15[1] = v17;
  uint64_t v18 = (void *)(a1 + v14);
  uint64_t v19 = (uint64_t *)((char *)a2 + v14);
  uint64_t v20 = v19[1];
  void *v18 = *v19;
  v18[1] = v20;
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for CACPhoneticVocabularyNavigationView(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v6 = *a2;
  uint64_t v7 = a2[1];
  char v8 = *((unsigned char *)a2 + 16);
  sub_3758C();
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = v7;
  *(unsigned char *)(a1 + 16) = v8;
  sub_372E8();
  if ((uint64_t *)a1 != a2)
  {
    uint64_t v9 = a3[5];
    uint64_t v10 = (void *)(a1 + v9);
    uint64_t v11 = (uint64_t *)((char *)a2 + v9);
    sub_265A0(a1 + v9, &qword_53DE0);
    sub_22BC4(&qword_53DE0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v12 = sub_38630();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v12 - 8) + 16))(v10, v11, v12);
    }
    else
    {
      void *v10 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v13 = a3[6];
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = (uint64_t *)((char *)a2 + v13);
  *uint64_t v14 = *v15;
  v14[1] = v15[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v16 = a3[7];
  uint64_t v17 = (void *)(a1 + v16);
  uint64_t v18 = (uint64_t *)((char *)a2 + v16);
  uint64_t v19 = v18[1];
  void *v17 = *v18;
  v17[1] = v19;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t initializeWithTake for CACPhoneticVocabularyNavigationView(uint64_t a1, uint64_t a2, int *a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  uint64_t v6 = a3[5];
  uint64_t v7 = (void *)(a1 + v6);
  char v8 = (const void *)(a2 + v6);
  uint64_t v9 = sub_22BC4(&qword_53DE0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v10 = sub_38630();
    (*(void (**)(void *, const void *, uint64_t))(*(void *)(v10 - 8) + 32))(v7, v8, v10);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v7, v8, *(void *)(*(void *)(v9 - 8) + 64));
  }
  uint64_t v11 = a3[7];
  *(_OWORD *)(a1 + a3[6]) = *(_OWORD *)(a2 + a3[6]);
  *(_OWORD *)(a1 + v11) = *(_OWORD *)(a2 + v11);
  return a1;
}

uint64_t assignWithTake for CACPhoneticVocabularyNavigationView(uint64_t a1, uint64_t a2, int *a3)
{
  char v6 = *(unsigned char *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v6;
  sub_372E8();
  if (a1 != a2)
  {
    uint64_t v7 = a3[5];
    char v8 = (void *)(a1 + v7);
    uint64_t v9 = (const void *)(a2 + v7);
    sub_265A0(a1 + v7, &qword_53DE0);
    uint64_t v10 = sub_22BC4(&qword_53DE0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v11 = sub_38630();
      (*(void (**)(void *, const void *, uint64_t))(*(void *)(v11 - 8) + 32))(v8, v9, v11);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v8, v9, *(void *)(*(void *)(v10 - 8) + 64));
    }
  }
  uint64_t v12 = a3[6];
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (uint64_t *)(a2 + v12);
  uint64_t v16 = *v14;
  uint64_t v15 = v14[1];
  void *v13 = v16;
  v13[1] = v15;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for CACPhoneticVocabularyNavigationView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_37B40);
}

uint64_t sub_37B40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_22BC4(&qword_54548);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1 + *(int *)(a3 + 20);
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v10(v9, a2, v8);
  }
  else
  {
    unint64_t v12 = *(void *)(a1 + *(int *)(a3 + 24) + 8);
    if (v12 >= 0xFFFFFFFF) {
      LODWORD(v12) = -1;
    }
    return (v12 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for CACPhoneticVocabularyNavigationView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_37C20);
}

uint64_t sub_37C20(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_22BC4(&qword_54548);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = result;
    uint64_t v11 = a1 + *(int *)(a4 + 20);
    unint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v12(v11, a2, a2, v10);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 24) + 8) = (a2 - 1);
  }
  return result;
}

void sub_37CE8()
{
  sub_2BECC();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

unint64_t sub_37D9C()
{
  unint64_t result = qword_54CE8;
  if (!qword_54CE8)
  {
    sub_24414(&qword_54C48);
    sub_26748(&qword_54CF0, &qword_54BF8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_54CE8);
  }
  return result;
}

uint64_t sub_37E40()
{
  return sub_37E58(sub_37324);
}

uint64_t sub_37E58(uint64_t (*a1)(uint64_t))
{
  uint64_t v2 = *(void *)(type metadata accessor for CACPhoneticVocabularyNavigationView() - 8);
  uint64_t v3 = v1 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));

  return a1(v3);
}

uint64_t sub_37ED0()
{
  uint64_t v1 = type metadata accessor for CACPhoneticVocabularyNavigationView();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  sub_372E8();
  uint64_t v5 = v0 + v3 + *(int *)(v1 + 20);
  sub_22BC4(&qword_53DE0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = sub_38630();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_38020@<X0>(char *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = type metadata accessor for CACPhoneticVocabularyNavigationView();
  uint64_t v6 = (uint64_t *)(v2
                 + ((*(unsigned __int8 *)(*(void *)(v5 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v5 - 8) + 80))
                 + *(int *)(v5 + 24));
  return sub_36E24(*a1, *v6, v6[1], a2);
}

uint64_t sub_380A4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_3810C()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

void sub_382A4(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&def_14E30, a2, OS_LOG_TYPE_DEBUG, "Settings got notification: %@", (uint8_t *)&v3, 0xCu);
}

uint64_t sub_38320()
{
  return static CharacterSet.whitespacesAndNewlines.getter();
}

uint64_t sub_38330()
{
  return type metadata accessor for CharacterSet();
}

uint64_t sub_38340()
{
  return NSLocalizedString(_:tableName:bundle:value:comment:)();
}

uint64_t sub_38350()
{
  return UUID.uuidString.getter();
}

uint64_t sub_38360()
{
  return UUID.init()();
}

uint64_t sub_38370()
{
  return type metadata accessor for UUID();
}

uint64_t sub_38380()
{
  return AXOnboardingView.init(title:description:iconName:traits:content:button:)();
}

uint64_t sub_38390()
{
  return static OnboardingTraits.hasNavigationElements.getter();
}

uint64_t sub_383A0()
{
  return static OnboardingTraits.useScrollBounceBehavior.getter();
}

uint64_t sub_383B0()
{
  return static OnboardingTraits.allowNavigationBarBackButton.getter();
}

uint64_t sub_383C0()
{
  return type metadata accessor for OnboardingTraits();
}

uint64_t sub_383D0()
{
  return type metadata accessor for AXOnboardingButton();
}

uint64_t sub_383E0()
{
  return AXOnboardingButton.init(_:contentLabel:role:action:)();
}

uint64_t sub_383F0()
{
  return os_log(_:dso:log:_:_:)();
}

uint64_t sub_38400()
{
  return Logger.logObject.getter();
}

uint64_t sub_38410()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_38420()
{
  return type metadata accessor for Logger();
}

uint64_t sub_38430()
{
  return ObservableObject<>.objectWillChange.getter();
}

uint64_t sub_38440()
{
  return Published.init(initialValue:)();
}

uint64_t sub_38450()
{
  return static Published.subscript.modify();
}

uint64_t sub_38460()
{
  return static Published.subscript.getter();
}

uint64_t sub_38470()
{
  return static Published.subscript.setter();
}

uint64_t sub_38480()
{
  return type metadata accessor for Published();
}

uint64_t sub_38490()
{
  return NWPathMonitor.pathUpdateHandler.setter();
}

uint64_t sub_384A0()
{
  return NWPathMonitor.start(queue:)();
}

uint64_t sub_384B0()
{
  return NWPathMonitor.init()();
}

uint64_t sub_384C0()
{
  return type metadata accessor for NWPathMonitor();
}

uint64_t sub_384D0()
{
  return static NWPath.Status.== infix(_:_:)();
}

uint64_t sub_384E0()
{
  return type metadata accessor for NWPath.Status();
}

uint64_t sub_384F0()
{
  return NWPath.status.getter();
}

uint64_t sub_38500()
{
  return static ButtonRole.cancel.getter();
}

uint64_t sub_38510()
{
  return type metadata accessor for ButtonRole();
}

uint64_t sub_38520()
{
  return EdgeInsets.init(_all:)();
}

uint64_t sub_38530()
{
  return FocusState.wrappedValue.setter();
}

uint64_t sub_38540()
{
  return FocusState.projectedValue.getter();
}

uint64_t sub_38550()
{
  return FocusState.init<>()();
}

uint64_t sub_38560()
{
  return Transition.animation(_:)();
}

uint64_t sub_38570()
{
  return static ColorScheme.== infix(_:_:)();
}

uint64_t sub_38580()
{
  return type metadata accessor for ColorScheme();
}

uint64_t sub_38590()
{
  return type metadata accessor for Environment.Content();
}

uint64_t sub_385A0()
{
  return StateObject.wrappedValue.getter();
}

uint64_t sub_385B0()
{
  return StateObject.projectedValue.getter();
}

uint64_t sub_385C0()
{
  return static SubmitLabel.continue.getter();
}

uint64_t sub_385D0()
{
  return type metadata accessor for SubmitLabel();
}

uint64_t sub_385E0()
{
  return ToolbarItem<>.init(placement:content:)();
}

uint64_t sub_385F0()
{
  return ProgressView<>.init<>()();
}

uint64_t sub_38600()
{
  return _FrameLayout.init(width:height:alignment:)();
}

uint64_t sub_38610()
{
  return AnyTransition.init<A>(_:)();
}

void sub_38620()
{
}

uint64_t sub_38630()
{
  return type metadata accessor for DismissAction();
}

uint64_t sub_38650()
{
  return ObservedObject.init(wrappedValue:)();
}

uint64_t sub_38660()
{
  return ObservedObject.Wrapper.subscript.getter();
}

uint64_t sub_38670()
{
  return static SubmitTriggers.text.getter();
}

uint64_t sub_38680()
{
  return type metadata accessor for SubmitTriggers();
}

uint64_t sub_38690()
{
  return TintShapeStyle.init()();
}

uint64_t sub_386A0()
{
  return type metadata accessor for TintShapeStyle();
}

uint64_t sub_386B0()
{
  return ModifiedContent<>.accessibilityAddTraits(_:)();
}

uint64_t sub_386C0()
{
  return ModifiedContent<>.accessibilityIdentifier(_:)();
}

uint64_t sub_386D0()
{
  return NavigationStack.init<>(path:root:)();
}

uint64_t sub_386E0()
{
  return type metadata accessor for ScaleTransition();
}

uint64_t sub_386F0()
{
  return ScaleTransition.init(_:anchor:)();
}

uint64_t sub_38700()
{
  return static KeyboardShortcut.defaultAction.getter();
}

uint64_t sub_38710()
{
  return type metadata accessor for KeyboardShortcut();
}

uint64_t sub_38720()
{
  return PlainButtonStyle.init()();
}

uint64_t sub_38730()
{
  return type metadata accessor for PlainButtonStyle();
}

uint64_t sub_38740()
{
  return type metadata accessor for RoundedRectangle();
}

uint64_t sub_38750()
{
  return _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
}

uint64_t sub_38760()
{
  return EnvironmentValues.colorScheme.getter();
}

uint64_t sub_38770()
{
  return EnvironmentValues.colorScheme.setter();
}

uint64_t sub_38780()
{
  return EnvironmentValues.foregroundColor.getter();
}

uint64_t sub_38790()
{
  return EnvironmentValues.foregroundColor.setter();
}

uint64_t sub_387A0()
{
  return EnvironmentValues.multilineTextAlignment.getter();
}

uint64_t sub_387B0()
{
  return EnvironmentValues.multilineTextAlignment.setter();
}

uint64_t sub_387C0()
{
  return EnvironmentValues.font.getter();
}

uint64_t sub_387D0()
{
  return EnvironmentValues.font.setter();
}

uint64_t sub_387E0()
{
  return EnvironmentValues.dismiss.getter();
}

uint64_t sub_387F0()
{
  return EnvironmentValues.isEnabled.getter();
}

uint64_t sub_38800()
{
  return EnvironmentValues.isEnabled.setter();
}

uint64_t sub_38810()
{
  return EnvironmentValues.tintColor.getter();
}

uint64_t sub_38820()
{
  return EnvironmentValues.tintColor.setter();
}

uint64_t sub_38830()
{
  return EnvironmentValues.init()();
}

uint64_t sub_38840()
{
  return type metadata accessor for EnvironmentValues();
}

uint64_t sub_38850()
{
  return EnvironmentValues.subscript.getter();
}

uint64_t sub_38860()
{
  return EnvironmentValues.subscript.setter();
}

uint64_t sub_38870()
{
  return static VerticalAlignment.top.getter();
}

uint64_t sub_38880()
{
  return static VerticalAlignment.center.getter();
}

void sub_38890(Swift::String a1)
{
}

void sub_388A0(Swift::String a1)
{
}

uint64_t sub_388B0()
{
  return LocalizedStringKey.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_388C0()
{
  return type metadata accessor for LocalizedStringKey.StringInterpolation();
}

uint64_t sub_388D0()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t sub_388E0()
{
  return LocalizedStringKey.init(stringInterpolation:)();
}

uint64_t sub_388F0()
{
  return type metadata accessor for RoundedCornerStyle();
}

uint64_t sub_38900()
{
  return static AccessibilityTraits.playsSound.getter();
}

uint64_t sub_38910()
{
  return static AccessibilityTraits.startsMediaSession.getter();
}

uint64_t sub_38920()
{
  return static AccessibilityTraits.isButton.getter();
}

uint64_t sub_38930()
{
  return type metadata accessor for AccessibilityTraits();
}

uint64_t sub_38940()
{
  return static HorizontalAlignment.center.getter();
}

uint64_t sub_38950()
{
  return static HorizontalAlignment.leading.getter();
}

uint64_t sub_38960()
{
  return TupleToolbarContent.init(_:)();
}

uint64_t sub_38970()
{
  return UIHostingController.init(rootView:)();
}

uint64_t sub_38980()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t sub_38990()
{
  return static ToolbarItemPlacement.topBarLeading.getter();
}

uint64_t sub_389A0()
{
  return static ToolbarItemPlacement.topBarTrailing.getter();
}

uint64_t sub_389B0()
{
  return type metadata accessor for ToolbarItemPlacement();
}

uint64_t sub_389C0()
{
  return BorderlessButtonStyle.init()();
}

uint64_t sub_389D0()
{
  return type metadata accessor for BorderlessButtonStyle();
}

uint64_t sub_389E0()
{
  return static AccessibilityChildBehavior.combine.getter();
}

uint64_t sub_389F0()
{
  return type metadata accessor for AccessibilityChildBehavior();
}

uint64_t sub_38A00()
{
  return static TextInputAutocapitalization.never.getter();
}

uint64_t sub_38A10()
{
  return type metadata accessor for TextInputAutocapitalization();
}

uint64_t sub_38A20()
{
  return BorderedProminentButtonStyle.init()();
}

uint64_t sub_38A30()
{
  return type metadata accessor for BorderedProminentButtonStyle();
}

uint64_t sub_38A40()
{
  return UIViewControllerRepresentable._resetUIViewController(_:coordinator:destroy:)();
}

uint64_t sub_38A50()
{
  return static UIViewControllerRepresentable.dismantleUIViewController(_:coordinator:)();
}

uint64_t sub_38A60()
{
  return UIViewControllerRepresentable.sizeThatFits(_:uiViewController:context:)();
}

uint64_t sub_38A80()
{
  return static UIViewControllerRepresentable._layoutOptions(_:)();
}

uint64_t sub_38A90()
{
  return UIViewControllerRepresentable._identifiedViewTree(in:)();
}

uint64_t sub_38AA0()
{
  return UIViewControllerRepresentable.body.getter();
}

uint64_t sub_38AC0()
{
  return UIViewControllerRepresentable<>.makeCoordinator()();
}

uint64_t sub_38AD0()
{
  return static Log.runtimeIssuesLog.getter();
}

uint64_t sub_38AE0()
{
  return static Edge.Set.all.getter();
}

uint64_t sub_38AF0()
{
  return static Edge.Set.top.getter();
}

uint64_t sub_38B00()
{
  return static Edge.Set.bottom.getter();
}

uint64_t sub_38B10()
{
  return static Edge.Set.leading.getter();
}

uint64_t sub_38B20()
{
  return Edge.Set.init(rawValue:)();
}

uint64_t sub_38B30()
{
  return static Edge.Set.trailing.getter();
}

uint64_t sub_38B40()
{
  return static Edge.Set.vertical.getter();
}

uint64_t sub_38B50()
{
  return static Font.subheadline.getter();
}

uint64_t sub_38B60()
{
  return static Font.caption.getter();
}

uint64_t sub_38B70()
{
  return static Font.footnote.getter();
}

uint64_t sub_38B80()
{
  return List.init(selection:content:)();
}

uint64_t sub_38B90()
{
  return Text.foregroundColor(_:)();
}

uint64_t sub_38BA0()
{
  return Text.foregroundStyle<A>(_:)();
}

uint64_t sub_38BB0()
{
  return Text.bold()();
}

uint64_t sub_38BC0()
{
  return Text.font(_:)();
}

uint64_t sub_38BD0()
{
  return Text.init(_:tableName:bundle:comment:)();
}

uint64_t sub_38BE0()
{
  return Text.init<A>(_:)();
}

uint64_t sub_38BF0()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_38C00()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_38C10()
{
  return View.buttonStyle<A>(_:)();
}

uint64_t sub_38C20()
{
  return View.buttonStyle<A>(_:)();
}

uint64_t sub_38C30()
{
  return View.submitLabel(_:)();
}

uint64_t sub_38C40()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_38C50()
{
  return View.keyboardShortcut(_:)();
}

uint64_t sub_38C60()
{
  return View.accessibilityLabel<A>(_:)();
}

uint64_t sub_38C70()
{
  return View.accessibilityHidden(_:)();
}

uint64_t sub_38C80()
{
  return View.accessibilityActions<A>(_:)();
}

uint64_t sub_38C90()
{
  return View.accessibilityElement(children:)();
}

uint64_t sub_38CA0()
{
  return View.listHasStackBehavior()();
}

uint64_t sub_38CB0()
{
  return View.disableAutocorrection(_:)();
}

uint64_t sub_38CC0()
{
  return View.navigationDestination<A, B>(for:destination:)();
}

uint64_t sub_38CD0()
{
  return View.accessibilityAddTraits(_:)();
}

uint64_t sub_38CE0()
{
  return View.scrollContentBackground(_:)();
}

uint64_t sub_38CF0()
{
  return View.accessibilityRemoveTraits(_:)();
}

uint64_t sub_38D00()
{
  return View.textInputAutocapitalization(_:)();
}

uint64_t sub_38D10()
{
  return View.bold(_:)();
}

uint64_t sub_38D20()
{
  return View.alert<A, B, C>(_:isPresented:actions:message:)();
}

uint64_t sub_38D30()
{
  return View.alert<A, B>(_:isPresented:actions:)();
}

uint64_t sub_38D40()
{
  return View.focused(_:)();
}

uint64_t sub_38D50()
{
  return View.toolbar<A>(content:)();
}

uint64_t sub_38D60()
{
  return View.onChange<A>(of:initial:_:)();
}

uint64_t sub_38D70()
{
  return View.onSubmit(of:_:)();
}

uint64_t sub_38D80()
{
  return Color.init(uiColor:)();
}

uint64_t sub_38D90()
{
  return static Color.blue.getter();
}

uint64_t sub_38DA0()
{
  return static Color.gray.getter();
}

uint64_t sub_38DB0()
{
  return static Color.black.getter();
}

uint64_t sub_38DC0()
{
  return static Color.clear.getter();
}

uint64_t sub_38DD0()
{
  return static Color.white.getter();
}

uint64_t sub_38DE0()
{
  return static Color.secondary.getter();
}

uint64_t sub_38DF0()
{
  return Color.init(_:)();
}

uint64_t sub_38E00()
{
  return Image.init(uiImage:)();
}

uint64_t sub_38E10()
{
  return Image.init(systemName:)();
}

uint64_t sub_38E20()
{
  return type metadata accessor for Image.ResizingMode();
}

uint64_t sub_38E30()
{
  return Image.imageSizeModifier(_:)();
}

uint64_t sub_38E40()
{
  return Image.resizable(capInsets:resizingMode:)();
}

uint64_t sub_38E50()
{
  return State.init(wrappedValue:)();
}

uint64_t sub_38E60()
{
  return State.wrappedValue.getter();
}

uint64_t sub_38E70()
{
  return State.wrappedValue.setter();
}

uint64_t sub_38E80()
{
  return State.projectedValue.getter();
}

uint64_t sub_38E90()
{
  return Button.init(action:label:)();
}

uint64_t sub_38EA0()
{
  return Button<>.init<A>(_:role:action:)();
}

uint64_t sub_38EB0()
{
  return Button<>.init(_:action:)();
}

uint64_t sub_38EC0()
{
  return Button<>.init<A>(_:action:)();
}

uint64_t sub_38ED0()
{
  return AnyView.init<A>(_:)();
}

uint64_t sub_38EE0()
{
  return static Binding.constant(_:)();
}

uint64_t sub_38EF0()
{
  return Divider.init()();
}

uint64_t sub_38F00()
{
  return type metadata accessor for Divider();
}

uint64_t sub_38F10()
{
  return ForEach<>.init(_:id:content:)();
}

uint64_t sub_38F20()
{
  return static Alignment.topLeading.getter();
}

uint64_t sub_38F30()
{
  return static Alignment.topTrailing.getter();
}

uint64_t sub_38F40()
{
  return static Alignment.center.getter();
}

uint64_t sub_38F50()
{
  return static Animation.easeInOut.getter();
}

uint64_t sub_38F60()
{
  return TextField<>.init(_:text:onEditingChanged:onCommit:)();
}

uint64_t sub_38F70()
{
  return TextField<>.init<A>(_:text:onEditingChanged:onCommit:)();
}

uint64_t sub_38F80()
{
  return static UnitPoint.center.getter();
}

uint64_t sub_38F90()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_38FA0()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_38FB0()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t sub_38FC0()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_38FD0()
{
  return static String.localizedStringWithFormat(_:_:)();
}

uint64_t sub_38FE0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_38FF0()
{
  return String.init(format:_:)();
}

uint64_t sub_39000()
{
  return static String._fromSubstring(_:)();
}

uint64_t sub_39010()
{
  return String.hash(into:)();
}

uint64_t sub_39020()
{
  return String.index(_:offsetBy:limitedBy:)();
}

void sub_39030(Swift::String a1)
{
}

void sub_39040(Swift::String a1)
{
}

uint64_t sub_39050()
{
  return String.Iterator.next()().value._countAndFlagsBits;
}

Swift::Int sub_39060()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_39070()
{
  return String.init<A>(_:)();
}

uint64_t sub_39090()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_390A0()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_390B0()
{
  return Array.description.getter();
}

uint64_t sub_390C0()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_390D0()
{
  return static MainActor.shared.getter();
}

uint64_t sub_390E0()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_390F0()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_39100()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_39110()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_39120()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_39130()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_39140()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_39150()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t sub_39160()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t sub_39170()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_39180()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t sub_39190()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t sub_391A0()
{
  return Optional.debugDescription.getter();
}

uint64_t sub_391B0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_391C0()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_391D0()
{
  return StringProtocol.trimmingCharacters(in:)();
}

uint64_t sub_391E0()
{
  return StringProtocol.contains<A>(_:)();
}

uint64_t sub_391F0()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_39200()
{
  return _StringGuts.foreignErrorCorrectedScalar(startingAt:)();
}

void sub_39210(Swift::Int a1)
{
}

uint64_t sub_39220()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_39230()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_39240()
{
  return _decodeScalar(_:startingAt:)();
}

uint64_t sub_39250()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_39260()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int sub_39270(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_39280()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_39290()
{
  return Error.localizedDescription.getter();
}

uint64_t sub_392A0()
{
  return Hasher.init(_seed:)();
}

void sub_392B0(Swift::UInt a1)
{
}

Swift::Int sub_392C0()
{
  return Hasher._finalize()();
}

uint64_t AXFormatFloatWithPercentage()
{
  return _AXFormatFloatWithPercentage();
}

uint64_t AXFormatInteger()
{
  return _AXFormatInteger();
}

uint64_t AXLocalizedTimeSummary()
{
  return _AXLocalizedTimeSummary();
}

uint64_t AXLogCommon()
{
  return _AXLogCommon();
}

uint64_t AXPerformBlockAsynchronouslyOnMainThread()
{
  return _AXPerformBlockAsynchronouslyOnMainThread();
}

uint64_t AXPerformBlockOnMainThreadAfterDelay()
{
  return _AXPerformBlockOnMainThreadAfterDelay();
}

uint64_t AXProcessIsSetup()
{
  return _AXProcessIsSetup();
}

uint64_t AXSafeClassFromString()
{
  return _AXSafeClassFromString();
}

uint64_t CACLogAssetDownload()
{
  return _CACLogAssetDownload();
}

uint64_t CACLogGeneral()
{
  return _CACLogGeneral();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

uint64_t CreateDetailControllerInstanceWithClass()
{
  return _CreateDetailControllerInstanceWithClass();
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return _NSStringFromRange(range);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
}

uint64_t _AXAssert()
{
  return __AXAssert();
}

uint64_t _AXSAttentionAwarenessFeaturesEnabled()
{
  return __AXSAttentionAwarenessFeaturesEnabled();
}

uint64_t _AXSAudioDonationSiriImprovementEnabled()
{
  return __AXSAudioDonationSiriImprovementEnabled();
}

uint64_t _AXSCommandAndControlEnabled()
{
  return __AXSCommandAndControlEnabled();
}

uint64_t _AXSSetAudioDonationSiriImprovementEnabled()
{
  return __AXSSetAudioDonationSiriImprovementEnabled();
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

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
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
  return _objc_msgSendSuper2(a1, a2);
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

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
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

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
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

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getFunctionReplacement()
{
  return _swift_getFunctionReplacement();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
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

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_retain_n()
{
  return _swift_retain_n();
}

uint64_t swift_setDeallocating()
{
  return _swift_setDeallocating();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
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

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

id objc_msgSend_CGRectValue(void *a1, const char *a2, ...)
{
  return _[a1 CGRectValue];
}

id objc_msgSend__attributedStringDescriptionForCommandIdentifier_textViewWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_attributedStringDescriptionForCommandIdentifier:textViewWidth:");
}

id objc_msgSend__commandItemBelongsToDifferentLocale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_commandItemBelongsToDifferentLocale:");
}

id objc_msgSend__commandSettingsDidChange(void *a1, const char *a2, ...)
{
  return _[a1 _commandSettingsDidChange];
}

id objc_msgSend__fetchInstallationStatus(void *a1, const char *a2, ...)
{
  return _[a1 _fetchInstallationStatus];
}

id objc_msgSend__handleDoneButtonTapped_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleDoneButtonTapped:");
}

id objc_msgSend__isTextValidForVocabulary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isTextValidForVocabulary:");
}

id objc_msgSend__languageMatchesSystem(void *a1, const char *a2, ...)
{
  return _[a1 _languageMatchesSystem];
}

id objc_msgSend__opticalBoldSystemFontOfSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_opticalBoldSystemFontOfSize:");
}

id objc_msgSend__preferredFontForTextStyle_maximumContentSizeCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_preferredFontForTextStyle:maximumContentSizeCategory:");
}

id objc_msgSend__refreshGroupCommands(void *a1, const char *a2, ...)
{
  return _[a1 _refreshGroupCommands];
}

id objc_msgSend__setupSearch(void *a1, const char *a2, ...)
{
  return _[a1 _setupSearch];
}

id objc_msgSend__sortedCustomCommandsArrayByLanguage(void *a1, const char *a2, ...)
{
  return _[a1 _sortedCustomCommandsArrayByLanguage];
}

id objc_msgSend__updateEditButton(void *a1, const char *a2, ...)
{
  return _[a1 _updateEditButton];
}

id objc_msgSend__updateRightLabelWithValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateRightLabelWithValue:");
}

id objc_msgSend__updatedDownloadString(void *a1, const char *a2, ...)
{
  return _[a1 _updatedDownloadString];
}

id objc_msgSend_accessibilityLabel(void *a1, const char *a2, ...)
{
  return _[a1 accessibilityLabel];
}

id objc_msgSend_actionWithTitle_style_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionWithTitle:style:handler:");
}

id objc_msgSend_activateConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activateConstraints:");
}

id objc_msgSend_activeTargetTypes(void *a1, const char *a2, ...)
{
  return _[a1 activeTargetTypes];
}

id objc_msgSend_addAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAction:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addSpecifier_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSpecifier:animated:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_addTarget_action_forControlEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addTarget:action:forControlEvents:");
}

id objc_msgSend_addTextFieldWithConfigurationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addTextFieldWithConfigurationHandler:");
}

id objc_msgSend_addVocabularyEntryWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addVocabularyEntryWithString:");
}

id objc_msgSend_alertControllerWithTitle_message_preferredStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alertControllerWithTitle:message:preferredStyle:");
}

id objc_msgSend_allCustomCommandProperties(void *a1, const char *a2, ...)
{
  return _[a1 allCustomCommandProperties];
}

id objc_msgSend_alwaysShowOverlayType(void *a1, const char *a2, ...)
{
  return _[a1 alwaysShowOverlayType];
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendString:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayByAddingObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayByAddingObjectsFromArray:");
}

id objc_msgSend_arrayWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithArray:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_attentionAwareAction(void *a1, const char *a2, ...)
{
  return _[a1 attentionAwareAction];
}

id objc_msgSend_attribute_atIndex_longestEffectiveRange_inRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attribute:atIndex:longestEffectiveRange:inRange:");
}

id objc_msgSend_axArrayByIgnoringNilElementsWithCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "axArrayByIgnoringNilElementsWithCount:");
}

id objc_msgSend_axSafeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "axSafeObjectAtIndex:");
}

id objc_msgSend_bestLocaleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 bestLocaleIdentifier];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return _[a1 bottomAnchor];
}

id objc_msgSend_builtInCommandsStringsTableForLocaleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "builtInCommandsStringsTableForLocaleIdentifier:");
}

id objc_msgSend_bundle(void *a1, const char *a2, ...)
{
  return _[a1 bundle];
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_cellForSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cellForSpecifier:");
}

id objc_msgSend_cellType(void *a1, const char *a2, ...)
{
  return _[a1 cellType];
}

id objc_msgSend_centerYAnchor(void *a1, const char *a2, ...)
{
  return _[a1 centerYAnchor];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return _[a1 clearColor];
}

id objc_msgSend_clearConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 clearConfiguration];
}

id objc_msgSend_commandGroup(void *a1, const char *a2, ...)
{
  return _[a1 commandGroup];
}

id objc_msgSend_commandItem(void *a1, const char *a2, ...)
{
  return _[a1 commandItem];
}

id objc_msgSend_commandItems(void *a1, const char *a2, ...)
{
  return _[a1 commandItems];
}

id objc_msgSend_commandPresentation(void *a1, const char *a2, ...)
{
  return _[a1 commandPresentation];
}

id objc_msgSend_commandStringsTableForLocaleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "commandStringsTableForLocaleIdentifier:");
}

id objc_msgSend_commandsArray(void *a1, const char *a2, ...)
{
  return _[a1 commandsArray];
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compare:");
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsJoinedByString:");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_constraintEqualToAnchor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintEqualToAnchor:");
}

id objc_msgSend_constraintEqualToAnchor_constant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintEqualToAnchor:constant:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_contentScrollView(void *a1, const char *a2, ...)
{
  return _[a1 contentScrollView];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return _[a1 contentView];
}

id objc_msgSend_control(void *a1, const char *a2, ...)
{
  return _[a1 control];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createWithLocale_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createWithLocale:completionHandler:");
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return _[a1 currentDevice];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return _[a1 currentLocale];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultControllerWithStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultControllerWithStyle:");
}

id objc_msgSend_defaultExportURL(void *a1, const char *a2, ...)
{
  return _[a1 defaultExportURL];
}

id objc_msgSend_defaultMetrics(void *a1, const char *a2, ...)
{
  return _[a1 defaultMetrics];
}

id objc_msgSend_defaultParagraphStyle(void *a1, const char *a2, ...)
{
  return _[a1 defaultParagraphStyle];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _[a1 delegate];
}

id objc_msgSend_deleteAllCustomCommandEntries(void *a1, const char *a2, ...)
{
  return _[a1 deleteAllCustomCommandEntries];
}

id objc_msgSend_deleteItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteItem:");
}

id objc_msgSend_deselectRowAtIndexPath_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deselectRowAtIndexPath:animated:");
}

id objc_msgSend_detailControllerClass(void *a1, const char *a2, ...)
{
  return _[a1 detailControllerClass];
}

id objc_msgSend_detailTextForItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "detailTextForItem:");
}

id objc_msgSend_detailViewControllerClass(void *a1, const char *a2, ...)
{
  return _[a1 detailViewControllerClass];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_didAddGridSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 didAddGridSpecifiers];
}

id objc_msgSend_didAddOverlaySpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 didAddOverlaySpecifiers];
}

id objc_msgSend_didShowOnboarding(void *a1, const char *a2, ...)
{
  return _[a1 didShowOnboarding];
}

id objc_msgSend_dimmingSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 dimmingSpecifiers];
}

id objc_msgSend_dismissViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissViewControllerAnimated:completion:");
}

id objc_msgSend_displayAlertForViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayAlertForViewController:");
}

id objc_msgSend_displayString(void *a1, const char *a2, ...)
{
  return _[a1 displayString];
}

id objc_msgSend_donationTipKitSeen(void *a1, const char *a2, ...)
{
  return _[a1 donationTipKitSeen];
}

id objc_msgSend_downloadProgressForLanguage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadProgressForLanguage:");
}

id objc_msgSend_downloadingView(void *a1, const char *a2, ...)
{
  return _[a1 downloadingView];
}

id objc_msgSend_emptyGroupSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 emptyGroupSpecifier];
}

id objc_msgSend_enumerateSubstringsInRange_options_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateSubstringsInRange:options:usingBlock:");
}

id objc_msgSend_errorStatusForLanguage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorStatusForLanguage:");
}

id objc_msgSend_exportToURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "exportToURL:");
}

id objc_msgSend_filteredArrayUsingPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filteredArrayUsingPredicate:");
}

id objc_msgSend_filteredCommandList_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filteredCommandList:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return _[a1 floatValue];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return _[a1 frame];
}

id objc_msgSend_getCommandAndControlFooterText(void *a1, const char *a2, ...)
{
  return _[a1 getCommandAndControlFooterText];
}

id objc_msgSend_getCommandAndControlFooterTextLearnMore(void *a1, const char *a2, ...)
{
  return _[a1 getCommandAndControlFooterTextLearnMore];
}

id objc_msgSend_gridOverlayCustomColumnsCount(void *a1, const char *a2, ...)
{
  return _[a1 gridOverlayCustomColumnsCount];
}

id objc_msgSend_gridOverlayCustomColumnsEnabled(void *a1, const char *a2, ...)
{
  return _[a1 gridOverlayCustomColumnsEnabled];
}

id objc_msgSend_gridOverlayCustomRowsCount(void *a1, const char *a2, ...)
{
  return _[a1 gridOverlayCustomRowsCount];
}

id objc_msgSend_gridOverlayCustomRowsEnabled(void *a1, const char *a2, ...)
{
  return _[a1 gridOverlayCustomRowsEnabled];
}

id objc_msgSend_gridOverlayMaxLevel(void *a1, const char *a2, ...)
{
  return _[a1 gridOverlayMaxLevel];
}

id objc_msgSend_gridOverlayPressOnFirstLevelEnabled(void *a1, const char *a2, ...)
{
  return _[a1 gridOverlayPressOnFirstLevelEnabled];
}

id objc_msgSend_gridSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 gridSpecifiers];
}

id objc_msgSend_groupSpecifierWithID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupSpecifierWithID:");
}

id objc_msgSend_groupSpecifierWithID_name_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupSpecifierWithID:name:");
}

id objc_msgSend_groupSpecifierWithName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupSpecifierWithName:");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_imageNamed_inBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageNamed:inBundle:");
}

id objc_msgSend_importFromURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "importFromURL:");
}

id objc_msgSend_indexOfObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfObject:");
}

id objc_msgSend_initForExportingURLs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initForExportingURLs:");
}

id objc_msgSend_initForOpeningContentTypes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initForOpeningContentTypes:");
}

id objc_msgSend_initWithActivityIndicatorStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithActivityIndicatorStyle:");
}

id objc_msgSend_initWithBarButtonSystemItem_target_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBarButtonSystemItem:target:action:");
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFrame:");
}

id objc_msgSend_initWithGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithGroup:");
}

id objc_msgSend_initWithRootViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRootViewController:");
}

id objc_msgSend_initWithSearchResultsController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSearchResultsController:");
}

id objc_msgSend_initWithTextAlignment_location_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTextAlignment:location:options:");
}

id objc_msgSend_initialValue(void *a1, const char *a2, ...)
{
  return _[a1 initialValue];
}

id objc_msgSend_insertObject_atIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertObject:atIndex:");
}

id objc_msgSend_installationStatus(void *a1, const char *a2, ...)
{
  return _[a1 installationStatus];
}

id objc_msgSend_instrinsicContentHeight(void *a1, const char *a2, ...)
{
  return _[a1 instrinsicContentHeight];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _[a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_isAssetsInstalledForBestLocale(void *a1, const char *a2, ...)
{
  return _[a1 isAssetsInstalledForBestLocale];
}

id objc_msgSend_isConfirmationRequired(void *a1, const char *a2, ...)
{
  return _[a1 isConfirmationRequired];
}

id objc_msgSend_isCurrentlyAppearing(void *a1, const char *a2, ...)
{
  return _[a1 isCurrentlyAppearing];
}

id objc_msgSend_isCustom(void *a1, const char *a2, ...)
{
  return _[a1 isCustom];
}

id objc_msgSend_isEditing(void *a1, const char *a2, ...)
{
  return _[a1 isEditing];
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isEnabled];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isGroup(void *a1, const char *a2, ...)
{
  return _[a1 isGroup];
}

id objc_msgSend_isSameLangaugeFromLocaleIdentifier_secondLocaleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSameLangaugeFromLocaleIdentifier:secondLocaleIdentifier:");
}

id objc_msgSend_items(void *a1, const char *a2, ...)
{
  return _[a1 items];
}

id objc_msgSend_labelColor(void *a1, const char *a2, ...)
{
  return _[a1 labelColor];
}

id objc_msgSend_languageModelDictionaryForCommandIdentifier_targetTypes_parsingErrorString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "languageModelDictionaryForCommandIdentifier:targetTypes:parsingErrorString:");
}

id objc_msgSend_languageModelStatus(void *a1, const char *a2, ...)
{
  return _[a1 languageModelStatus];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _[a1 lastObject];
}

id objc_msgSend_launchOnboardingViewService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "launchOnboardingViewService:");
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return _[a1 layer];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return _[a1 leadingAnchor];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_linkWithBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "linkWithBundleIdentifier:");
}

id objc_msgSend_loadSpecifiersFromPlistName_target_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadSpecifiersFromPlistName:target:");
}

id objc_msgSend_localeIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 localeIdentifier];
}

id objc_msgSend_localizedButtonTitle(void *a1, const char *a2, ...)
{
  return _[a1 localizedButtonTitle];
}

id objc_msgSend_localizedCapitalizedString(void *a1, const char *a2, ...)
{
  return _[a1 localizedCapitalizedString];
}

id objc_msgSend_localizedCompare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedCompare:");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_localizedStringForLocaleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForLocaleIdentifier:");
}

id objc_msgSend_localizedStringFromNumber_numberStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringFromNumber:numberStyle:");
}

id objc_msgSend_localizedStringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringWithFormat:");
}

id objc_msgSend_makeContentCellViewWithTitle_image_imageIgnoresInvertColors_description_linkTitle_linkCallback_closeCallback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeContentCellViewWithTitle:image:imageIgnoresInvertColors:description:linkTitle:linkCallback:closeCallback:");
}

id objc_msgSend_makeViewController(void *a1, const char *a2, ...)
{
  return _[a1 makeViewController];
}

id objc_msgSend_maxNumberOfColumnsForDevice(void *a1, const char *a2, ...)
{
  return _[a1 maxNumberOfColumnsForDevice];
}

id objc_msgSend_maxNumberOfRowsForDevice(void *a1, const char *a2, ...)
{
  return _[a1 maxNumberOfRowsForDevice];
}

id objc_msgSend_maximumNumberOfAllowedEntries(void *a1, const char *a2, ...)
{
  return _[a1 maximumNumberOfAllowedEntries];
}

id objc_msgSend_mutableAttributedStringByReplacingPlaceholderAttribute_withAttributeName_inAttributedString_withValueTable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mutableAttributedStringByReplacingPlaceholderAttribute:withAttributeName:inAttributedString:withValueTable:");
}

id objc_msgSend_mutableAttributedStringCommandDescriptionForCommandIdentifier_calculateDisplayedAttributedStringWidthBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mutableAttributedStringCommandDescriptionForCommandIdentifier:calculateDisplayedAttributedStringWidthBlock:");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_navigationBar(void *a1, const char *a2, ...)
{
  return _[a1 navigationBar];
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return _[a1 navigationController];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return _[a1 navigationItem];
}

id objc_msgSend_nestedCommandGroupsAndItems(void *a1, const char *a2, ...)
{
  return _[a1 nestedCommandGroupsAndItems];
}

id objc_msgSend_newCommandItemWithLocale_scope_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newCommandItemWithLocale:scope:");
}

id objc_msgSend_numberFromString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberFromString:");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithFloat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithFloat:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_orPredicateWithSubpredicates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "orPredicateWithSubpredicates:");
}

id objc_msgSend_overlayFadeDelay(void *a1, const char *a2, ...)
{
  return _[a1 overlayFadeDelay];
}

id objc_msgSend_overlayFadeOpacity(void *a1, const char *a2, ...)
{
  return _[a1 overlayFadeOpacity];
}

id objc_msgSend_overlayFadingEnabled(void *a1, const char *a2, ...)
{
  return _[a1 overlayFadingEnabled];
}

id objc_msgSend_playSoundUponRecognition(void *a1, const char *a2, ...)
{
  return _[a1 playSoundUponRecognition];
}

id objc_msgSend_pointSize(void *a1, const char *a2, ...)
{
  return _[a1 pointSize];
}

id objc_msgSend_popViewControllerAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "popViewControllerAnimated:");
}

id objc_msgSend_predicateWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateWithBlock:");
}

id objc_msgSend_predicateWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateWithFormat:");
}

id objc_msgSend_preferenceSpecifierNamed_target_set_get_detail_cell_edit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:");
}

id objc_msgSend_present(void *a1, const char *a2, ...)
{
  return _[a1 present];
}

id objc_msgSend_presentCustomAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentCustomAction:");
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_presenterForPrivacySplashWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presenterForPrivacySplashWithIdentifier:");
}

id objc_msgSend_privacyFlow(void *a1, const char *a2, ...)
{
  return _[a1 privacyFlow];
}

id objc_msgSend_properties(void *a1, const char *a2, ...)
{
  return _[a1 properties];
}

id objc_msgSend_propertyForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertyForKey:");
}

id objc_msgSend_pushViewController_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pushViewController:animated:");
}

id objc_msgSend_rangeOfString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfString:");
}

id objc_msgSend_registerForCallback(void *a1, const char *a2, ...)
{
  return _[a1 registerForCallback];
}

id objc_msgSend_registerForKeyboardNotifications(void *a1, const char *a2, ...)
{
  return _[a1 registerForKeyboardNotifications];
}

id objc_msgSend_reloadSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadSpecifier:");
}

id objc_msgSend_reloadSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 reloadSpecifiers];
}

id objc_msgSend_removeAttribute_range_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeAttribute:range:");
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectAtIndex:");
}

id objc_msgSend_removeSpecifier_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeSpecifier:animated:");
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return _[a1 row];
}

id objc_msgSend_safeAreaLayoutGuide(void *a1, const char *a2, ...)
{
  return _[a1 safeAreaLayoutGuide];
}

id objc_msgSend_saveAction(void *a1, const char *a2, ...)
{
  return _[a1 saveAction];
}

id objc_msgSend_saveToPreferences(void *a1, const char *a2, ...)
{
  return _[a1 saveToPreferences];
}

id objc_msgSend_scaledFontForFont_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scaledFontForFont:");
}

id objc_msgSend_searchBar(void *a1, const char *a2, ...)
{
  return _[a1 searchBar];
}

id objc_msgSend_searchController(void *a1, const char *a2, ...)
{
  return _[a1 searchController];
}

id objc_msgSend_searchResultSpecifierSelected_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "searchResultSpecifierSelected:");
}

id objc_msgSend_searchResultWithGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "searchResultWithGroup:");
}

id objc_msgSend_searchResults(void *a1, const char *a2, ...)
{
  return _[a1 searchResults];
}

id objc_msgSend_searchResultsController(void *a1, const char *a2, ...)
{
  return _[a1 searchResultsController];
}

id objc_msgSend_searchResultsUpdater(void *a1, const char *a2, ...)
{
  return _[a1 searchResultsUpdater];
}

id objc_msgSend_secondaryLabelColor(void *a1, const char *a2, ...)
{
  return _[a1 secondaryLabelColor];
}

id objc_msgSend_section(void *a1, const char *a2, ...)
{
  return _[a1 section];
}

id objc_msgSend_selectRowAtIndexPath_animated_scrollPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "selectRowAtIndexPath:animated:scrollPosition:");
}

id objc_msgSend_separatorColor(void *a1, const char *a2, ...)
{
  return _[a1 separatorColor];
}

id objc_msgSend_server(void *a1, const char *a2, ...)
{
  return _[a1 server];
}

id objc_msgSend_setAccessibilityContainerType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessibilityContainerType:");
}

id objc_msgSend_setAccessibilityLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessibilityLabel:");
}

id objc_msgSend_setAccessoryView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessoryView:");
}

id objc_msgSend_setAdjustsFontForContentSizeCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdjustsFontForContentSizeCategory:");
}

id objc_msgSend_setAlignment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlignment:");
}

id objc_msgSend_setAllSpecifiersUnsearchable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllSpecifiersUnsearchable:");
}

id objc_msgSend_setAlwaysShowOverlayType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlwaysShowOverlayType:");
}

id objc_msgSend_setAttentionAwareAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAttentionAwareAction:");
}

id objc_msgSend_setAttributedText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAttributedText:");
}

id objc_msgSend_setAutocapitalizationType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutocapitalizationType:");
}

id objc_msgSend_setAutocorrectionType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutocorrectionType:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setBackgroundConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundConfiguration:");
}

id objc_msgSend_setBackgroundImage_forBarMetrics_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundImage:forBarMetrics:");
}

id objc_msgSend_setButtonAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setButtonAction:");
}

id objc_msgSend_setChecked_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setChecked:");
}

id objc_msgSend_setCommandItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCommandItem:");
}

id objc_msgSend_setCommandItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCommandItems:");
}

id objc_msgSend_setCommandPresentation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCommandPresentation:");
}

id objc_msgSend_setContentInset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentInset:");
}

id objc_msgSend_setContinuous_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContinuous:");
}

id objc_msgSend_setControllerLoadAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setControllerLoadAction:");
}

id objc_msgSend_setCornerRadius_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCornerRadius:");
}

id objc_msgSend_setCountStringInsignificantRowCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCountStringInsignificantRowCount:");
}

id objc_msgSend_setDefinesPresentationContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDefinesPresentationContext:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDimmingSpecifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDimmingSpecifiers:");
}

id objc_msgSend_setDonationTipKitSeen_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDonationTipKitSeen:");
}

id objc_msgSend_setDownloading_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDownloading:");
}

id objc_msgSend_setEdgeToEdgeCells_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEdgeToEdgeCells:");
}

id objc_msgSend_setEditing_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEditing:animated:");
}

id objc_msgSend_setEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnabled:");
}

id objc_msgSend_setFirstLineHeadIndent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFirstLineHeadIndent:");
}

id objc_msgSend_setFont_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFont:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setGridOverlayCustomColumnsCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGridOverlayCustomColumnsCount:");
}

id objc_msgSend_setGridOverlayCustomColumnsEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGridOverlayCustomColumnsEnabled:");
}

id objc_msgSend_setGridOverlayCustomRowsCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGridOverlayCustomRowsCount:");
}

id objc_msgSend_setGridOverlayCustomRowsEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGridOverlayCustomRowsEnabled:");
}

id objc_msgSend_setGridOverlayMaxLevel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGridOverlayMaxLevel:");
}

id objc_msgSend_setGridOverlayPressOnFirstLevelEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGridOverlayPressOnFirstLevelEnabled:");
}

id objc_msgSend_setGridSpecifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGridSpecifiers:");
}

id objc_msgSend_setHeadIndent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHeadIndent:");
}

id objc_msgSend_setHidden_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHidden:");
}

id objc_msgSend_setHidesSearchBarWhenScrolling_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHidesSearchBarWhenScrolling:");
}

id objc_msgSend_setIndexHidden_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIndexHidden:animated:");
}

id objc_msgSend_setIsConfirmationRequired_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsConfirmationRequired:");
}

id objc_msgSend_setIsCurrentlyAppearing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsCurrentlyAppearing:");
}

id objc_msgSend_setIsCustom_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsCustom:");
}

id objc_msgSend_setIsEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsEnabled:");
}

id objc_msgSend_setKeyboardType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKeyboardType:");
}

id objc_msgSend_setLabelText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLabelText:");
}

id objc_msgSend_setLayoutMargins_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLayoutMargins:");
}

id objc_msgSend_setModalPresentationStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setModalPresentationStyle:");
}

id objc_msgSend_setNumberOfLines_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberOfLines:");
}

id objc_msgSend_setNumberStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberStyle:");
}

id objc_msgSend_setObject_atIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:atIndexedSubscript:");
}

id objc_msgSend_setObscuresBackgroundDuringPresentation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObscuresBackgroundDuringPresentation:");
}

id objc_msgSend_setOverlayFadeDelay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOverlayFadeDelay:");
}

id objc_msgSend_setOverlayFadeOpacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOverlayFadeOpacity:");
}

id objc_msgSend_setOverlayFadingEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOverlayFadingEnabled:");
}

id objc_msgSend_setParagraphSpacing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setParagraphSpacing:");
}

id objc_msgSend_setParagraphSpacingBefore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setParagraphSpacingBefore:");
}

id objc_msgSend_setPlaceholder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlaceholder:");
}

id objc_msgSend_setPlaySoundUponRecognition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlaySoundUponRecognition:");
}

id objc_msgSend_setPresentingViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPresentingViewController:");
}

id objc_msgSend_setProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProperties:");
}

id objc_msgSend_setProperty_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProperty:forKey:");
}

id objc_msgSend_setRightBarButtonItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRightBarButtonItem:");
}

id objc_msgSend_setSaveAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSaveAction:");
}

id objc_msgSend_setScrollIndicatorInsets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScrollIndicatorInsets:");
}

id objc_msgSend_setSearchController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSearchController:");
}

id objc_msgSend_setSearchResults_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSearchResults:");
}

id objc_msgSend_setSearchResultsUpdater_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSearchResultsUpdater:");
}

id objc_msgSend_setSeparatorInset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSeparatorInset:");
}

id objc_msgSend_setShadowImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShadowImage:");
}

id objc_msgSend_setShowTextResponseUponRecognition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowTextResponseUponRecognition:");
}

id objc_msgSend_setTabStops_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTabStops:");
}

id objc_msgSend_setText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setText:");
}

id objc_msgSend_setTextColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextColor:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setToolbarHidden_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setToolbarHidden:animated:");
}

id objc_msgSend_setToolbarItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setToolbarItems:");
}

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:");
}

id objc_msgSend_setUsedByPreferences_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUsedByPreferences:");
}

id objc_msgSend_setUserHintsFeatures_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserHintsFeatures:");
}

id objc_msgSend_setUserHintsForCommandSuggestionsEnabled_specifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserHintsForCommandSuggestionsEnabled:specifier:");
}

id objc_msgSend_setUserHintsForNextStepSuggestionsEnabled_specifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserHintsForNextStepSuggestionsEnabled:specifier:");
}

id objc_msgSend_setUserHintsHistory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserHintsHistory:");
}

id objc_msgSend_setValue_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:animated:");
}

id objc_msgSend_setVocabularyEntries_forLocaleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVocabularyEntries:forLocaleIdentifier:");
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return _[a1 sharedManager];
}

id objc_msgSend_sharedPreferences(void *a1, const char *a2, ...)
{
  return _[a1 sharedPreferences];
}

id objc_msgSend_sharedSpokenCommandUtilities(void *a1, const char *a2, ...)
{
  return _[a1 sharedSpokenCommandUtilities];
}

id objc_msgSend_showController_withSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showController:withSpecifier:");
}

id objc_msgSend_showDonationModalView(void *a1, const char *a2, ...)
{
  return _[a1 showDonationModalView];
}

id objc_msgSend_showTextResponseUponRecognition(void *a1, const char *a2, ...)
{
  return _[a1 showTextResponseUponRecognition];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return _[a1 size];
}

id objc_msgSend_sortedArrayUsingComparator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortedArrayUsingComparator:");
}

id objc_msgSend_specifier(void *a1, const char *a2, ...)
{
  return _[a1 specifier];
}

id objc_msgSend_specifierAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "specifierAtIndexPath:");
}

id objc_msgSend_specifierForID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "specifierForID:");
}

id objc_msgSend_specifierForIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "specifierForIndexPath:");
}

id objc_msgSend_specifiers(void *a1, const char *a2, ...)
{
  return _[a1 specifiers];
}

id objc_msgSend_spokenStringPermutationsOfLanguageModelDictionary_stringsTable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "spokenStringPermutationsOfLanguageModelDictionary:stringsTable:");
}

id objc_msgSend_startAccessingSecurityScopedResource(void *a1, const char *a2, ...)
{
  return _[a1 startAccessingSecurityScopedResource];
}

id objc_msgSend_startAnimating(void *a1, const char *a2, ...)
{
  return _[a1 startAnimating];
}

id objc_msgSend_stopAccessingSecurityScopedResource(void *a1, const char *a2, ...)
{
  return _[a1 stopAccessingSecurityScopedResource];
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:");
}

id objc_msgSend_stringByTrimmingCharactersInSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByTrimmingCharactersInSet:");
}

id objc_msgSend_stringFromNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromNumber:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_subviews(void *a1, const char *a2, ...)
{
  return _[a1 subviews];
}

id objc_msgSend_systemFontOfSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemFontOfSize:");
}

id objc_msgSend_table(void *a1, const char *a2, ...)
{
  return _[a1 table];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return _[a1 text];
}

id objc_msgSend_textFields(void *a1, const char *a2, ...)
{
  return _[a1 textFields];
}

id objc_msgSend_textForItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textForItem:");
}

id objc_msgSend_textLabel(void *a1, const char *a2, ...)
{
  return _[a1 textLabel];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return _[a1 topAnchor];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return _[a1 trailingAnchor];
}

id objc_msgSend_typeWithFilenameExtension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "typeWithFilenameExtension:");
}

id objc_msgSend_untranslatedDisplayString(void *a1, const char *a2, ...)
{
  return _[a1 untranslatedDisplayString];
}

id objc_msgSend_untranslatedLocale(void *a1, const char *a2, ...)
{
  return _[a1 untranslatedLocale];
}

id objc_msgSend_updateSearchResultsForSearchController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateSearchResultsForSearchController:");
}

id objc_msgSend_updateTableCheckedSelection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateTableCheckedSelection:");
}

id objc_msgSend_userHintsFeatures(void *a1, const char *a2, ...)
{
  return _[a1 userHintsFeatures];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _[a1 userInfo];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return _[a1 userInterfaceIdiom];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return _[a1 value];
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_valueWithNonretainedObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueWithNonretainedObject:");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return _[a1 view];
}

id objc_msgSend_viewControllers(void *a1, const char *a2, ...)
{
  return _[a1 viewControllers];
}

id objc_msgSend_vocabularyEntries(void *a1, const char *a2, ...)
{
  return _[a1 vocabularyEntries];
}

id objc_msgSend_vocabularyEntriesForLocaleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "vocabularyEntriesForLocaleIdentifier:");
}

id objc_msgSend_whitespaceCharacterSet(void *a1, const char *a2, ...)
{
  return _[a1 whitespaceCharacterSet];
}