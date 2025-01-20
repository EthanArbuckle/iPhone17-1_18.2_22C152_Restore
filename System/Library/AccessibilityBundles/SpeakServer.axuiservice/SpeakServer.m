uint64_t sub_1B28(uint64_t a1)
{
  uint64_t vars8;

  qword_CDB8 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

void sub_1EC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1EE0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _tryObservingNotifications];
}

void sub_20B8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_20D4(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  v6 = AXLogSpeakTyping();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_4B18(a2, v6);
  }

  if (a2 <= 1019)
  {
    if ((a2 - 1000) >= 2)
    {
      if (a2 == 1005)
      {
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
        [WeakRetained handleValueChange:v5];

        *(unsigned char *)(*(void *)(a1 + 32) + 16) = 0;
        goto LABEL_17;
      }
      if (a2 != 1018) {
        goto LABEL_17;
      }
    }
    goto LABEL_15;
  }
  if (a2 > 1053)
  {
    if (a2 != 5001)
    {
      if (a2 == 1054) {
        *(unsigned char *)(*(void *)(a1 + 32) + 16) = 1;
      }
      goto LABEL_17;
    }
LABEL_15:
    id v7 = objc_loadWeakRetained((id *)(a1 + 40));
    [v7 handleFirstValueChange];
    goto LABEL_16;
  }
  if (a2 == 1020) {
    goto LABEL_15;
  }
  if (a2 == 1052)
  {
    id v7 = objc_loadWeakRetained((id *)(a1 + 40));
    [v7 handleTextReplacementOccurred:v5];
LABEL_16:
  }
LABEL_17:
}

void sub_23CC()
{
  id v0 = objc_alloc_init((Class)AXIndexMap);
  AXLoadPunctuationTable();
  id v1 = v0;
  AXPerformBlockAsynchronouslyOnMainThread();
}

void sub_247C(uint64_t a1)
{
}

void sub_251C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!UIAccessibilityIsVoiceOverRunning())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (_AXSWordFeedbackEnabled() && [*(id *)(a1 + 32) length])
      {
        v4 = [*(id *)(a1 + 40) responderElement];
        id v5 = [v4 application];
        unsigned int v6 = [v5 isDictationListening];

        if (v6)
        {
          id v7 = AXLogSpeakTyping();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v9 = 0;
            _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Will not speak because app-dictation is running", v9, 2u);
          }
        }
        else
        {
          [*(id *)(a1 + 40) processWordOutput:*(void *)(a1 + 32)];
        }
      }
      *(CFAbsoluteTime *)(*(void *)(a1 + 40) + 120) = CFAbsoluteTimeGetCurrent();
      v8 = [v3 value];
      [*(id *)(a1 + 40) setElementValueText:v8];
    }
  }
}

void sub_26F4(uint64_t a1)
{
  _AXShouldDispatchNonMainThreadCallbacksOnMainThreadPushReason();
  uint64_t v2 = +[AXElement primaryApp];
  _AXShouldDispatchNonMainThreadCallbacksOnMainThreadPopReason();
  id v4 = *(id *)(a1 + 32);
  id v3 = v2;
  AXPerformBlockAsynchronouslyOnMainThread();
}

void sub_27AC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) firstResponder];
  (*(void (**)(uint64_t, id, void))(v2 + 16))(v2, v3, *(void *)(a1 + 32));
}

void sub_28B4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = AXLogSpeakTyping();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = [*(id *)(a1 + 32) responderElement];
    int v16 = 138543874;
    v17 = v8;
    __int16 v18 = 2114;
    id v19 = v5;
    __int16 v20 = 2114;
    id v21 = v6;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "First responder change: old: %{public}@ new: %{public}@ primary: %{public}@", (uint8_t *)&v16, 0x20u);
  }
  v9 = [*(id *)(a1 + 32) responderElement];
  unsigned __int8 v10 = [v9 isEqual:v5];

  if ((v10 & 1) == 0)
  {
    v11 = [*(id *)(a1 + 32) responderElement];
    unsigned int v12 = [v11 pid];

    [*(id *)(a1 + 32) setResponderElement:v5];
    v13 = [v5 value];
    [*(id *)(a1 + 32) setElementValueText:v13];

    if ([*(id *)(a1 + 32) isLastSpeechActionForResponderElement])
    {
      if (v12 != [v5 pid])
      {
        v14 = [*(id *)(a1 + 32) speechManager];
        [v14 stopSpeaking:0];
      }
    }
  }
  v15 = [*(id *)(a1 + 32) responderElement];

  if (v15) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

id sub_3020(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleValueChange:*(void *)(a1 + 40)];
}

void sub_38F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_3910(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _processTypingFeedback:*(void *)(a1 + 32)];
}

void sub_4350(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  v8 = [*(id *)(a1 + 32) _prepareSpeechAction];
  v9 = [*(id *)(a1 + 40) string];
  unsigned __int8 v10 = objc_msgSend(v9, "substringWithRange:", a3, a4);
  [v8 setString:v10];

  [v8 setShouldQueue:1];
  v11 = [v7 objectForKey:@"AXSpeakTypingPayloadKeyVolume"];

  if (v11)
  {
    v31[0] = 0;
    objc_opt_class();
    unsigned int v12 = [v7 objectForKey:@"AXSpeakTypingPayloadKeyVolume"];
    v13 = __UIAccessibilityCastAsClass();

    [v13 doubleValue];
    objc_msgSend(v8, "setVolume:");
  }
  v14 = objc_msgSend(v7, "objectForKey:", @"AXSpeakTypingPayloadKeyRate", *(void *)v31);

  if (v14)
  {
    v31[0] = 0;
    objc_opt_class();
    v15 = [v7 objectForKey:@"AXSpeakTypingPayloadKeyRate"];
    int v16 = __UIAccessibilityCastAsClass();

    [v16 doubleValue];
    objc_msgSend(v8, "setSpeakingRate:");
  }
  v17 = objc_msgSend(v7, "objectForKey:", @"AXSpeakTypingPayloadKeyLanguage", *(void *)v31);

  if (v17)
  {
    __int16 v18 = *(void **)(a1 + 32);
    id v19 = [v7 objectForKey:@"AXSpeakTypingPayloadKeyLanguage"];
    __int16 v20 = [v18 _massageKeyboardLanguage:v19];

    id v21 = AXLogSpeakTyping();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = [v7 objectForKey:@"AXSpeakTypingPayloadKeyLanguage"];
      *(_DWORD *)v31 = 138412546;
      *(void *)&v31[4] = v22;
      __int16 v32 = 2112;
      v33 = v20;
      _os_log_impl(&dword_0, v21, OS_LOG_TYPE_DEFAULT, "Desired language: %@, updated %@", v31, 0x16u);
    }
    if (!v20)
    {
      v23 = [v7 objectForKey:@"AXSpeakTypingPayloadKeyLanguage"];
      __int16 v20 = AXLanguageConvertToCanonicalForm();

      v24 = AXLogSpeakTyping();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v31 = 138412290;
        *(void *)&v31[4] = v20;
        _os_log_impl(&dword_0, v24, OS_LOG_TYPE_DEFAULT, "Went to canonical form: %@", v31, 0xCu);
      }
    }
    [v8 setLanguage:v20];
    v25 = +[AXSettings sharedInstance];
    v26 = [v8 language];
    v27 = [v25 speechVoiceIdentifierForLanguage:v26 sourceKey:AXSpeechSourceKeySpeechFeatures exists:0];

    v28 = AXLogSpeakTyping();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v29 = [v8 language];
      *(_DWORD *)v31 = 138412546;
      *(void *)&v31[4] = v27;
      __int16 v32 = 2112;
      v33 = v29;
      _os_log_impl(&dword_0, v28, OS_LOG_TYPE_DEFAULT, "Choosing voiceId: %@ from language %@", v31, 0x16u);
    }
    [v8 setVoiceIdentifier:v27];
  }
  [*(id *)(a1 + 32) _speakAction:v8 isForResponderElement:0];
  v30 = AXLogSpeakTyping();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v31 = 138412290;
    *(void *)&v31[4] = v8;
    _os_log_impl(&dword_0, v30, OS_LOG_TYPE_DEFAULT, "Speaking sub-action to speak: %@", v31, 0xCu);
  }
}

void sub_4B18(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "Recv notifiction: %d", (uint8_t *)v2, 8u);
}

void sub_4B90(void *a1, int a2, NSObject *a3)
{
  id v5 = [a1 responderElement];
  v6[0] = 67109378;
  v6[1] = a2;
  __int16 v7 = 2112;
  v8 = v5;
  _os_log_error_impl(&dword_0, a3, OS_LOG_TYPE_ERROR, "Attempted to speak autocorrections from an app that did not own the first responder. Pid: %i, responder element: %@", (uint8_t *)v6, 0x12u);
}

void sub_4C40(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Attempted to speak prediction from an app that did not own the first responder. Pid: %i", (uint8_t *)v2, 8u);
}

void sub_4CB8(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "process message: %@", (uint8_t *)&v2, 0xCu);
}

uint64_t AXCLanguageConvertToCanonicalForm()
{
  return _AXCLanguageConvertToCanonicalForm();
}

uint64_t AXIsInternalInstall()
{
  return _AXIsInternalInstall();
}

uint64_t AXLanguageCanonicalFormToGeneralLanguage()
{
  return _AXLanguageCanonicalFormToGeneralLanguage();
}

uint64_t AXLanguageConvertToCanonicalForm()
{
  return _AXLanguageConvertToCanonicalForm();
}

uint64_t AXLanguageIsSpeakableEmojiString()
{
  return _AXLanguageIsSpeakableEmojiString();
}

uint64_t AXLoadPunctuationTable()
{
  return _AXLoadPunctuationTable();
}

uint64_t AXLogSpeakTyping()
{
  return _AXLogSpeakTyping();
}

uint64_t AXPerformBlockAsynchronouslyOnMainThread()
{
  return _AXPerformBlockAsynchronouslyOnMainThread();
}

uint64_t AXUnicodeCodePointForCharacterString()
{
  return _AXUnicodeCodePointForCharacterString();
}

uint64_t AXVOLocalizedStringForCharacter()
{
  return _AXVOLocalizedStringForCharacter();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return _UIAccessibilityIsVoiceOverRunning();
}

uint64_t _AXSLetterFeedbackEnabled()
{
  return __AXSLetterFeedbackEnabled();
}

uint64_t _AXSPhoneticFeedbackEnabled()
{
  return __AXSPhoneticFeedbackEnabled();
}

uint64_t _AXSSetInUnitTestMode()
{
  return __AXSSetInUnitTestMode();
}

uint64_t _AXSSetLetterFeedbackEnabled()
{
  return __AXSSetLetterFeedbackEnabled();
}

uint64_t _AXSSetPhoneticFeedbackEnabled()
{
  return __AXSSetPhoneticFeedbackEnabled();
}

uint64_t _AXSSetWordFeedbackEnabled()
{
  return __AXSSetWordFeedbackEnabled();
}

uint64_t _AXSWordFeedbackEnabled()
{
  return __AXSWordFeedbackEnabled();
}

uint64_t _AXShouldDispatchNonMainThreadCallbacksOnMainThreadPopReason()
{
  return __AXShouldDispatchNonMainThreadCallbacksOnMainThreadPopReason();
}

uint64_t _AXShouldDispatchNonMainThreadCallbacksOnMainThreadPushReason()
{
  return __AXShouldDispatchNonMainThreadCallbacksOnMainThreadPushReason();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __UIAccessibilityCastAsClass()
{
  return ___UIAccessibilityCastAsClass();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
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

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
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

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_IPASpeechPhonemes(void *a1, const char *a2, ...)
{
  return [a1 IPASpeechPhonemes];
}

id objc_msgSend__observeSpeechAccessibilityPreferenceChanges(void *a1, const char *a2, ...)
{
  return [a1 _observeSpeechAccessibilityPreferenceChanges];
}

id objc_msgSend__prepareSpeechAction(void *a1, const char *a2, ...)
{
  return [a1 _prepareSpeechAction];
}

id objc_msgSend__tryObservingNotifications(void *a1, const char *a2, ...)
{
  return [a1 _tryObservingNotifications];
}

id objc_msgSend_application(void *a1, const char *a2, ...)
{
  return [a1 application];
}

id objc_msgSend_attributedString(void *a1, const char *a2, ...)
{
  return [a1 attributedString];
}

id objc_msgSend_availableLanguageCodes(void *a1, const char *a2, ...)
{
  return [a1 availableLanguageCodes];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_characterFeedbackDelayDuration(void *a1, const char *a2, ...)
{
  return [a1 characterFeedbackDelayDuration];
}

id objc_msgSend_clearSpeechQueue(void *a1, const char *a2, ...)
{
  return [a1 clearSpeechQueue];
}

id objc_msgSend_currentInputModeInPreference(void *a1, const char *a2, ...)
{
  return [a1 currentInputModeInPreference];
}

id objc_msgSend_currentLanguageCode(void *a1, const char *a2, ...)
{
  return [a1 currentLanguageCode];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_elementValueText(void *a1, const char *a2, ...)
{
  return [a1 elementValueText];
}

id objc_msgSend_firstResponder(void *a1, const char *a2, ...)
{
  return [a1 firstResponder];
}

id objc_msgSend_handleFirstValueChange(void *a1, const char *a2, ...)
{
  return [a1 handleFirstValueChange];
}

id objc_msgSend_isAXAttributedString(void *a1, const char *a2, ...)
{
  return [a1 isAXAttributedString];
}

id objc_msgSend_isDictationListening(void *a1, const char *a2, ...)
{
  return [a1 isDictationListening];
}

id objc_msgSend_isLastSpeechActionForResponderElement(void *a1, const char *a2, ...)
{
  return [a1 isLastSpeechActionForResponderElement];
}

id objc_msgSend_isRingerMuted(void *a1, const char *a2, ...)
{
  return [a1 isRingerMuted];
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return [a1 isValid];
}

id objc_msgSend_language(void *a1, const char *a2, ...)
{
  return [a1 language];
}

id objc_msgSend_lastSpeechAction(void *a1, const char *a2, ...)
{
  return [a1 lastSpeechAction];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_letterFeedbackEnabled(void *a1, const char *a2, ...)
{
  return [a1 letterFeedbackEnabled];
}

id objc_msgSend_letterPunctuationTable(void *a1, const char *a2, ...)
{
  return [a1 letterPunctuationTable];
}

id objc_msgSend_operationQueue(void *a1, const char *a2, ...)
{
  return [a1 operationQueue];
}

id objc_msgSend_phoneticFeedbackEnabled(void *a1, const char *a2, ...)
{
  return [a1 phoneticFeedbackEnabled];
}

id objc_msgSend_pid(void *a1, const char *a2, ...)
{
  return [a1 pid];
}

id objc_msgSend_primaryApp(void *a1, const char *a2, ...)
{
  return [a1 primaryApp];
}

id objc_msgSend_primaryLanguage(void *a1, const char *a2, ...)
{
  return [a1 primaryLanguage];
}

id objc_msgSend_quickSpeakSpeakingRate(void *a1, const char *a2, ...)
{
  return [a1 quickSpeakSpeakingRate];
}

id objc_msgSend_remoteParent(void *a1, const char *a2, ...)
{
  return [a1 remoteParent];
}

id objc_msgSend_removeAllDynamicDictionaries(void *a1, const char *a2, ...)
{
  return [a1 removeAllDynamicDictionaries];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_responderElement(void *a1, const char *a2, ...)
{
  return [a1 responderElement];
}

id objc_msgSend_selectedTextRange(void *a1, const char *a2, ...)
{
  return [a1 selectedTextRange];
}

id objc_msgSend_server(void *a1, const char *a2, ...)
{
  return [a1 server];
}

id objc_msgSend_sharedInputModeController(void *a1, const char *a2, ...)
{
  return [a1 sharedInputModeController];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_speakCorrectionsEnabled(void *a1, const char *a2, ...)
{
  return [a1 speakCorrectionsEnabled];
}

id objc_msgSend_speakableCharacters(void *a1, const char *a2, ...)
{
  return [a1 speakableCharacters];
}

id objc_msgSend_speechManager(void *a1, const char *a2, ...)
{
  return [a1 speechManager];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_traits(void *a1, const char *a2, ...)
{
  return [a1 traits];
}

id objc_msgSend_typingFeedbackEnabled(void *a1, const char *a2, ...)
{
  return [a1 typingFeedbackEnabled];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}

id objc_msgSend_voiceIdentifier(void *a1, const char *a2, ...)
{
  return [a1 voiceIdentifier];
}

id objc_msgSend_wordFeedbackEnabled(void *a1, const char *a2, ...)
{
  return [a1 wordFeedbackEnabled];
}