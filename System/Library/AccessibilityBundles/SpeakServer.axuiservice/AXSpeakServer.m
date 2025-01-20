@interface AXSpeakServer
+ (BOOL)isSafeToProcessMessageFromUnentitledProcessWithIdentifier:(unint64_t)a3;
+ (id)requiredEntitlementForProcessingMessageWithIdentifier:(unint64_t)a3;
+ (id)sharedInstance;
- (AXCharacterSoundMap)characterSoundMap;
- (AXElement)responderElement;
- (AXSpeakServer)init;
- (BOOL)_isAllowedToSpeakForPid:(int)a3;
- (BOOL)isLastSpeechActionForResponderElement;
- (BOOL)typingFeedbackEnabled;
- (NSString)currentSTSLabel;
- (NSString)elementValueText;
- (OS_dispatch_queue)operationQueue;
- (TTSSpeechAction)lastSpeechAction;
- (TTSSpeechManager)speechManager;
- (double)lastTextReplacementOccurredTime;
- (id)_feedbackForCharacter:(id)a3 andVoiceIdentifier:(id)a4;
- (id)_massageKeyboardLanguage:(id)a3;
- (id)_prepareSpeechAction;
- (id)_processCharacterForPunctuation:(id)a3;
- (id)letterPunctuationTable;
- (id)processMessage:(id)a3 withIdentifier:(unint64_t)a4 fromClientWithIdentifier:(id)a5 pid:(int)a6 error:(id *)a7;
- (void)_observeNotifications:(BOOL)a3;
- (void)_observeSpeechAccessibilityPreferenceChanges;
- (void)_processTypingFeedback:(id)a3;
- (void)_speakAction:(id)a3 isForResponderElement:(BOOL)a4;
- (void)_tryObservingNotifications;
- (void)_updateSpokenLangugage:(id)a3;
- (void)dealloc;
- (void)handleFirstValueChange;
- (void)handleFirstValueChangeWithCompletion:(id)a3;
- (void)handleTextReplacementOccurred:(id)a3;
- (void)handleValueChange:(id)a3;
- (void)processAutocorrectionOutput:(id)a3;
- (void)processDelayedTypingFeedback:(id)a3;
- (void)processWordOutput:(id)a3;
- (void)setCharacterSoundMap:(id)a3;
- (void)setCurrentSTSLabel:(id)a3;
- (void)setElementValueText:(id)a3;
- (void)setIsLastSpeechActionForResponderElement:(BOOL)a3;
- (void)setLastSpeechAction:(id)a3;
- (void)setLastTextReplacementOccurredTime:(double)a3;
- (void)setOperationQueue:(id)a3;
- (void)setResponderElement:(id)a3;
- (void)setSpeechManager:(id)a3;
- (void)withFirstResponderOnMainQueue:(id)a3;
@end

@implementation AXSpeakServer

- (TTSSpeechManager)speechManager
{
  speechManager = self->_speechManager;
  if (!speechManager)
  {
    v4 = (TTSSpeechManager *)objc_alloc_init((Class)TTSSpeechManager);
    v5 = self->_speechManager;
    self->_speechManager = v4;

    [(TTSSpeechManager *)self->_speechManager setUsesAuxiliarySession:1];
    speechManager = self->_speechManager;
  }

  return speechManager;
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1B28;
  block[3] = &unk_8328;
  block[4] = a1;
  if (qword_CDC0 != -1) {
    dispatch_once(&qword_CDC0, block);
  }
  v2 = (void *)qword_CDB8;

  return v2;
}

- (AXSpeakServer)init
{
  v22.receiver = self;
  v22.super_class = (Class)AXSpeakServer;
  v2 = [(AXSpeakServer *)&v22 init];
  if (v2)
  {
    uint64_t v3 = +[TTSSpeechManager availableLanguageCodes];
    availableLanguages = v2->_availableLanguages;
    v2->_availableLanguages = (NSArray *)v3;

    id v5 = objc_allocWithZone((Class)NSDictionary);
    v6 = +[NSBundle bundleWithIdentifier:@"com.apple.AccessibilitySettingsLoader"];
    v7 = [v6 pathForResource:@"KeyboardToLanguage" ofType:@"plist"];
    v8 = (NSDictionary *)[v5 initWithContentsOfFile:v7];
    keyboardToLanguage = v2->_keyboardToLanguage;
    v2->_keyboardToLanguage = v8;

    dispatch_queue_t v10 = dispatch_queue_create("speak-corrections-punctuation", 0);
    punctuationLoaderQueue = v2->_punctuationLoaderQueue;
    v2->_punctuationLoaderQueue = (OS_dispatch_queue *)v10;

    v2->_pasteOperationOccurred = 0;
    v12 = (AXDispatchTimer *)[objc_alloc((Class)AXDispatchTimer) initWithTargetSerialQueue:&_dispatch_main_q];
    feedbackDelayTimer = v2->_feedbackDelayTimer;
    v2->_feedbackDelayTimer = v12;

    [(AXDispatchTimer *)v2->_feedbackDelayTimer setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:1];
    v14 = (AXCharacterSoundMap *)objc_alloc_init((Class)AXCharacterSoundMap);
    characterSoundMap = v2->_characterSoundMap;
    v2->_characterSoundMap = v14;

    v2->_lastTextReplacementOccurredTime = -3061152000.0;
    v16 = (AXIndexMap *)objc_alloc_init((Class)AXIndexMap);
    letterPunctuationTable = v2->_letterPunctuationTable;
    v2->_letterPunctuationTable = v16;

    dispatch_queue_t v18 = dispatch_queue_create("AXSpeakServer.Operation", 0);
    operationQueue = v2->_operationQueue;
    v2->_operationQueue = (OS_dispatch_queue *)v18;

    [(AXSpeakServer *)v2 _observeSpeechAccessibilityPreferenceChanges];
    [(AXSpeakServer *)v2 _tryObservingNotifications];
    v20 = v2;
  }

  return v2;
}

- (BOOL)typingFeedbackEnabled
{
  v2 = +[AXSettings sharedInstance];
  if (([v2 phoneticFeedbackEnabled] & 1) != 0
    || ([v2 wordFeedbackEnabled] & 1) != 0
    || ([v2 letterFeedbackEnabled] & 1) != 0)
  {
    unsigned __int8 v3 = 1;
  }
  else
  {
    unsigned __int8 v3 = [v2 speakCorrectionsEnabled];
  }

  return v3;
}

- (void)_observeSpeechAccessibilityPreferenceChanges
{
  objc_initWeak(&location, self);
  v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  dispatch_queue_t v10 = sub_1EE0;
  v11 = &unk_8350;
  objc_copyWeak(&v12, &location);
  unsigned __int8 v3 = objc_retainBlock(&v8);
  v4 = +[AXSettings sharedInstance];
  [v4 registerUpdateBlock:v3 forRetrieveSelector:"phoneticFeedbackEnabled" withListener:self];

  id v5 = +[AXSettings sharedInstance];
  [v5 registerUpdateBlock:v3 forRetrieveSelector:"wordFeedbackEnabled" withListener:self];

  v6 = +[AXSettings sharedInstance];
  [v6 registerUpdateBlock:v3 forRetrieveSelector:"letterFeedbackEnabled" withListener:self];

  v7 = +[AXSettings sharedInstance];
  [v7 registerUpdateBlock:v3 forRetrieveSelector:"speakCorrectionsEnabled" withListener:self];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)_tryObservingNotifications
{
  if ([(AXSpeakServer *)self typingFeedbackEnabled])
  {
    [(AXSpeakServer *)self _observeNotifications:1];
  }
}

- (void)dealloc
{
  [(AXSpeakServer *)self _observeNotifications:0];
  currentLanguage = self->_currentLanguage;
  self->_currentLanguage = 0;

  v4.receiver = self;
  v4.super_class = (Class)AXSpeakServer;
  [(AXSpeakServer *)&v4 dealloc];
}

- (void)_observeNotifications:(BOOL)a3
{
  if (a3)
  {
    objc_initWeak(&location, self);
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_20D4;
    v4[3] = &unk_8378;
    v4[4] = self;
    objc_copyWeak(&v5, &location);
    +[AXElement registerNotifications:&off_88D8 withIdentifier:@"SpeakTyping" withHandler:v4];
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
  else
  {
    +[AXElement unregisterNotifications:@"SpeakTyping"];
  }
}

- (id)_massageKeyboardLanguage:(id)a3
{
  objc_super v4 = AXCLanguageConvertToCanonicalForm();
  if (![(NSArray *)self->_availableLanguages containsObject:v4])
  {
    uint64_t v5 = [(NSDictionary *)self->_keyboardToLanguage objectForKey:v4];

    objc_super v4 = (void *)v5;
  }

  return v4;
}

- (void)_updateSpokenLangugage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AXSpeakServer *)self _massageKeyboardLanguage:v4];
  v6 = AXLogSpeakTyping();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    currentLanguage = self->_currentLanguage;
    *(_DWORD *)buf = 138412802;
    v11 = currentLanguage;
    __int16 v12 = 2112;
    id v13 = v4;
    __int16 v14 = 2112;
    uint64_t v15 = v5;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "Updating language: Current: %@ new: %@ [massaged: %@]", buf, 0x20u);
  }

  if (![(NSString *)self->_currentLanguage isEqualToString:v5]
    && (uint64_t)self->_currentLanguage | v5)
  {
    objc_storeStrong((id *)&self->_currentLanguage, (id)v5);
    [(AXIndexMap *)self->_letterPunctuationTable removeAllObjects];
    punctuationLoaderQueue = self->_punctuationLoaderQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_23CC;
    block[3] = &unk_83C8;
    block[4] = self;
    dispatch_async((dispatch_queue_t)punctuationLoaderQueue, block);
  }
}

- (void)handleTextReplacementOccurred:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_251C;
  v5[3] = &unk_83F0;
  id v6 = a3;
  v7 = self;
  id v4 = v6;
  [(AXSpeakServer *)self withFirstResponderOnMainQueue:v5];
}

- (void)withFirstResponderOnMainQueue:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AXSpeakServer *)self operationQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_26F4;
  block[3] = &unk_8440;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);
}

- (void)handleFirstValueChange
{
}

- (void)handleFirstValueChangeWithCompletion:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_28B4;
  v4[3] = &unk_84A8;
  uint64_t v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(AXSpeakServer *)v5 withFirstResponderOnMainQueue:v4];
}

- (void)handleValueChange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = AXLogSpeakTyping();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v45 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "Value change %@", buf, 0xCu);
  }

  if (!UIAccessibilityIsVoiceOverRunning())
  {
    if (CFAbsoluteTimeGetCurrent() - self->_lastTextReplacementOccurredTime < 0.1)
    {
      id v6 = AXLogSpeakTyping();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "Value change but we just had a text replacement occur", buf, 2u);
      }

      goto LABEL_20;
    }
    uint64_t v7 = [(AXSpeakServer *)self responderElement];
    if (v7)
    {
      id v8 = (void *)v7;
      uint64_t v9 = [(AXSpeakServer *)self responderElement];
      unsigned __int8 v10 = [v9 isValid];

      if (v10)
      {
        v11 = [(AXSpeakServer *)self responderElement];
        unint64_t v12 = (unint64_t)[v11 traits];
        unint64_t v13 = kAXSecureTextFieldTrait & ~v12;

        if (!v13) {
          goto LABEL_20;
        }
        __int16 v14 = [(AXSpeakServer *)self elementValueText];
        if ([v14 isAXAttributedString]
          && [v14 hasAttribute:UIAccessibilityTokenPlaceholder])
        {

          __int16 v14 = 0;
        }
        uint64_t v15 = [(AXSpeakServer *)self responderElement];
        [v15 updateCache:2006];

        v16 = [(AXSpeakServer *)self responderElement];
        v17 = [v16 value];

        dispatch_queue_t v18 = [(AXSpeakServer *)self responderElement];
        id v19 = [v18 selectedTextRange];
        uint64_t v40 = v20;
        id v41 = v19;

        v21 = +[UIKeyboardInputModeController sharedInputModeController];
        objc_super v22 = [v21 currentInputModeInPreference];
        v23 = [v22 primaryLanguage];

        [(AXSpeakServer *)self _updateSpokenLangugage:v23];
        v24 = [v14 length];
        v25 = [v17 length];
        v26 = [(AXSpeakServer *)self responderElement];
        v27 = [v26 application];
        unsigned int v28 = [v27 isDictationListening];

        if (v28)
        {
          v29 = AXLogSpeakTyping();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_0, v29, OS_LOG_TYPE_DEFAULT, "Will not speak because app-dictation is running", buf, 2u);
          }
        }
        else
        {
          if (self->_pasteOperationOccurred) {
            goto LABEL_36;
          }
          int64_t v31 = v24 - v25;
          if (_AXSLetterFeedbackEnabled() || _AXSPhoneticFeedbackEnabled())
          {
            v32 = +[AXFirstResponderValueChangeManager sharedInstance];
            LOBYTE(v39) = 1;
            v33 = objc_msgSend(v32, "outputValueChangeForNewValue:oldValue:selectedTextRange:shouldEchoDeletion:isSingleInsert:feedbackType:lastKeyboardKeyPress:shouldOutputSingleCharactersOnly:", v17, v14, v41, v40, 0, v31 == -1, CFAbsoluteTimeGetCurrent(), 1, v39);
            v34 = [v33 stringByReplacingOccurrencesOfString:@" " withString:&stru_8620];

            if (v34 && [v34 length])
            {
              v35 = AXLogSpeakTyping();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138477827;
                v45 = v34;
                _os_log_impl(&dword_0, v35, OS_LOG_TYPE_INFO, "New output string to process: %{private}@", buf, 0xCu);
              }

              [(AXSpeakServer *)self processDelayedTypingFeedback:v34];
            }
          }
          if (!_AXSWordFeedbackEnabled()) {
            goto LABEL_36;
          }
          v36 = +[AXFirstResponderValueChangeManager sharedInstance];
          v37 = objc_msgSend(v36, "outputValueChangeForNewValue:oldValue:selectedTextRange:shouldEchoDeletion:isSingleInsert:feedbackType:lastKeyboardKeyPress:", v17, v14, v41, v40, 0, v31 == -1, CFAbsoluteTimeGetCurrent(), 2);
          v29 = [v37 stringByReplacingOccurrencesOfString:@" " withString:&stru_8620];

          v38 = AXLogSpeakTyping();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138477827;
            v45 = v29;
            _os_log_impl(&dword_0, v38, OS_LOG_TYPE_INFO, "New output string to process: %{private}@", buf, 0xCu);
          }

          if ([v29 length]) {
            [(AXSpeakServer *)self processWordOutput:v29];
          }
        }

LABEL_36:
        [(AXSpeakServer *)self setElementValueText:v17];

        goto LABEL_20;
      }
    }
    v30 = AXLogSpeakTyping();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v30, OS_LOG_TYPE_INFO, "Need a new responder", buf, 2u);
    }

    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_3020;
    v42[3] = &unk_83A0;
    v42[4] = self;
    v43 = v4;
    [(AXSpeakServer *)self handleFirstValueChangeWithCompletion:v42];
  }
LABEL_20:
}

- (id)_prepareSpeechAction
{
  id v3 = objc_alloc_init((Class)TTSSpeechAction);
  [v3 setShouldProcessEmoji:1];
  if (self->_currentLanguage)
  {
    id v4 = AXLanguageCanonicalFormToGeneralLanguage();
  }
  else
  {
    uint64_t v5 = +[AVSpeechSynthesisVoice currentLanguageCode];
    id v4 = AXLanguageCanonicalFormToGeneralLanguage();
  }
  id v6 = +[AXSettings sharedInstance];
  uint64_t v7 = [v6 speechVoiceIdentifierForLanguage:v4 sourceKey:AXSpeechSourceKeySpeechFeatures exists:0];

  [v3 setVoiceIdentifier:v7];
  [v3 setLanguage:self->_currentLanguage];
  id v8 = +[AXSettings sharedInstance];
  [v8 quickSpeakSpeakingRate];
  [v3 setSpeakingRate:v9];

  return v3;
}

- (void)processAutocorrectionOutput:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AXSpeakServer *)self _prepareSpeechAction];
  [v5 setShouldQueue:1];
  [v5 setCannotInterrupt:1];
  id v6 = [(AXSpeakServer *)self speechManager];
  [v6 setSpeechEnabled:1];

  [v5 setString:v4];
  uint64_t v7 = AXLogSpeakTyping();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    float v9 = v5;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Process autocorrect: %@", (uint8_t *)&v8, 0xCu);
  }

  [(AXSpeakServer *)self _speakAction:v5 isForResponderElement:1];
}

- (void)processWordOutput:(id)a3
{
  feedbackDelayTimer = self->_feedbackDelayTimer;
  id v5 = a3;
  [(AXDispatchTimer *)feedbackDelayTimer cancel];
  id v6 = [(AXSpeakServer *)self _prepareSpeechAction];
  uint64_t v7 = [(AXSpeakServer *)self speechManager];
  [v7 setSpeechEnabled:1];

  [v6 setString:v5];
  int v8 = AXLogSpeakTyping();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    unsigned __int8 v10 = v6;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Process word: %@", (uint8_t *)&v9, 0xCu);
  }

  [(AXSpeakServer *)self _speakAction:v6 isForResponderElement:1];
}

- (id)letterPunctuationTable
{
  return self->_letterPunctuationTable;
}

- (id)_processCharacterForPunctuation:(id)a3
{
  id v4 = a3;
  id v5 = [v4 length];
  id v6 = v4;
  uint64_t v7 = v6;
  if ((unint64_t)v5 <= 2)
  {
    unsigned int v8 = AXUnicodeCodePointForCharacterString();
    if (v8 >= 0x10000)
    {
      uint64_t v7 = AXVOLocalizedStringForCharacter();
      id v10 = v6;
    }
    else
    {
      uint64_t v7 = v6;
      if ([v6 length] != (char *)&dword_0 + 1) {
        goto LABEL_8;
      }
      int v9 = [(AXSpeakServer *)self letterPunctuationTable];
      id v10 = [v9 objectForIndex:v8];

      if (v10)
      {
        id v10 = v10;

        uint64_t v7 = v10;
      }
      else
      {
        uint64_t v7 = v6;
      }
    }
  }
LABEL_8:

  return v7;
}

- (void)_processTypingFeedback:(id)a3
{
  id v4 = a3;
  id v5 = [(AXSpeakServer *)self _prepareSpeechAction];
  id v6 = [v5 voiceIdentifier];
  uint64_t v7 = [(AXSpeakServer *)self speechManager];
  [v7 setSpeechEnabled:1];

  if ([v4 length])
  {
    unsigned int v8 = [(AXSpeakServer *)self _feedbackForCharacter:v4 andVoiceIdentifier:v6];
    int v9 = +[AXLanguageManager sharedInstance];
    id v10 = [v5 language];
    v11 = [v9 dialectForLanguageID:v10];

    if (([v11 canSpeakString:v4] & 1) != 0
      || v11
      && ([v11 speakableCharacters],
          unint64_t v12 = objc_claimAutoreleasedReturnValue(),
          v12,
          !v12)
      || AXLanguageIsSpeakableEmojiString())
    {
      id v13 = v4;
    }
    else
    {
      id v13 = [(AXSpeakServer *)self _processCharacterForPunctuation:v4];
    }
    __int16 v14 = v13;
    if ([v13 isEqualToString:v4])
    {
      if ([v4 length] != (char *)&dword_0 + 1)
      {
LABEL_12:
        if (_AXSLetterFeedbackEnabled() && _AXSPhoneticFeedbackEnabled())
        {
          if (v8)
          {
            v17 = [v4 stringByAppendingString:@","];
            dispatch_queue_t v18 = [v17 stringByAppendingString:v8];

            id v19 = [v18 IPASpeechPhonemes];
            id v20 = [v19 length];

            if (v20)
            {
              int64_t v31 = AVSpeechSynthesisIPANotationAttribute;
              v21 = [v18 IPASpeechPhonemes];
              v32 = v21;
              objc_super v22 = +[NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
            }
            else
            {
              objc_super v22 = 0;
            }
            id v23 = objc_alloc((Class)NSAttributedString);
            v24 = v18;
LABEL_28:
            id v25 = [v23 initWithString:v24 attributes:v22];
            [v5 setAttributedString:v25];

            goto LABEL_29;
          }
        }
        else if (!_AXSLetterFeedbackEnabled())
        {
          if (!_AXSPhoneticFeedbackEnabled() || !v8) {
            goto LABEL_29;
          }
          dispatch_queue_t v18 = [v8 IPASpeechPhonemes];
          if ([v18 length])
          {
            v29 = AVSpeechSynthesisIPANotationAttribute;
            v30 = v18;
            objc_super v22 = +[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
          }
          else
          {
            objc_super v22 = 0;
          }
          id v23 = objc_alloc((Class)NSAttributedString);
          v24 = v8;
          goto LABEL_28;
        }
        [v5 setString:v4];
LABEL_29:

        goto LABEL_30;
      }
      id v15 = +[TTSSpeechManager literalStringMarkup:v6 string:v4 speakCap:1];
    }
    else
    {
      id v15 = v14;
    }
    id v16 = v15;

    id v4 = v16;
    goto LABEL_12;
  }
LABEL_30:
  v26 = [v5 string];
  if ([v26 length])
  {

LABEL_33:
    [(AXSpeakServer *)self _speakAction:v5 isForResponderElement:1];
    goto LABEL_34;
  }
  v27 = [v5 attributedString];
  id v28 = [v27 length];

  if (v28) {
    goto LABEL_33;
  }
LABEL_34:
}

- (void)processDelayedTypingFeedback:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = +[AXSettings sharedInstance];
    [v5 characterFeedbackDelayDuration];
    double v7 = v6;

    [(AXDispatchTimer *)self->_feedbackDelayTimer cancel];
    objc_initWeak(&location, self);
    feedbackDelayTimer = self->_feedbackDelayTimer;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_3910;
    v9[3] = &unk_84D0;
    objc_copyWeak(&v11, &location);
    id v10 = v4;
    [(AXDispatchTimer *)feedbackDelayTimer afterDelay:v9 processBlock:v7];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

+ (id)requiredEntitlementForProcessingMessageWithIdentifier:(unint64_t)a3
{
  if (a3 - 3 > 0xC) {
    return @"com.apple.accessibility.SpeakTypingServices";
  }
  else {
    return (id)qword_8518[a3 - 3];
  }
}

+ (BOOL)isSafeToProcessMessageFromUnentitledProcessWithIdentifier:(unint64_t)a3
{
  return (a3 < 0xF) & (0x4038u >> a3);
}

- (id)processMessage:(id)a3 withIdentifier:(unint64_t)a4 fromClientWithIdentifier:(id)a5 pid:(int)a6 error:(id *)a7
{
  uint64_t v7 = *(void *)&a6;
  id v11 = a3;
  id v12 = a5;
  id v13 = AXLogSpeakTyping();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    sub_4CB8((uint64_t)v11, v13);
  }

  __int16 v14 = [v11 objectForKey:@"AXSpeakTypingPayloadKeyLanguage"];
  id v15 = AXLanguageCanonicalFormToGeneralLanguage();

  if (v15) {
    [(AXSpeakServer *)self _updateSpokenLangugage:v15];
  }
  id v16 = [(AXSpeakServer *)self _prepareSpeechAction];
  v17 = 0;
  switch(a4)
  {
    case 3uLL:
      if ([(AXSpeakServer *)self _isAllowedToSpeakForPid:v7])
      {
        buf[0] = 0;
        objc_opt_class();
        dispatch_queue_t v18 = [v11 objectForKey:AXSpeakTypingPayloadKeyPrediction];
        id v19 = __UIAccessibilityCastAsClass();

        [v16 setString:v19];
        [(AXSpeakServer *)self _speakAction:v16 isForResponderElement:1];
        goto LABEL_53;
      }
      v52 = AXLogSpeakTyping();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
        sub_4C40(v7, v52);
      }
      goto LABEL_49;
    case 4uLL:
      id v20 = +[AXSpringBoardServer server];
      unsigned int v21 = [v20 isRingerMuted];

      if (v21 && !UIAccessibilityIsVoiceOverRunning()) {
        goto LABEL_54;
      }
      if ([(AXSpeakServer *)self _isAllowedToSpeakForPid:v7])
      {
        buf[0] = 0;
        objc_opt_class();
        objc_super v22 = [v11 objectForKey:AXSpeakTypingPayloadKeyWord];
        id v19 = __UIAccessibilityCastAsClass();

        id v23 = AXLogSpeakTyping();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138477827;
          v70 = v19;
          _os_log_impl(&dword_0, v23, OS_LOG_TYPE_DEFAULT, "autocorrect: %{private}@", buf, 0xCu);
        }

        [(AXSpeakServer *)self processAutocorrectionOutput:v19];
        goto LABEL_53;
      }
      v61 = AXLogSpeakTyping();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
        sub_4B90(self, v7, v61);
      }

      goto LABEL_54;
    case 5uLL:
      v24 = +[AXSpringBoardServer server];
      unsigned int v25 = [v24 isRingerMuted];

      v26 = [v11 objectForKey:@"fromAutocorrections"];
      unsigned int v27 = [v26 BOOLValue];

      if (v27 && v25)
      {
        if (UIAccessibilityIsVoiceOverRunning()) {
          goto LABEL_54;
        }
      }
      else if (v27)
      {
        goto LABEL_54;
      }
      v55 = [(AXSpeakServer *)self speechManager];
      [v55 stopSpeaking:0];

      v52 = [(AXSpeakServer *)self speechManager];
      [v52 clearSpeechQueue];
LABEL_49:

      goto LABEL_54;
    case 6uLL:
      id v28 = [(AXSpeakServer *)self speechManager];
      [v28 stopSpeaking:0];

      id v19 = [v11 objectForKey:AXSpeakTypingPayloadKeyWord];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_opt_class();
        v29 = __UIAccessibilityCastAsClass();
        objc_opt_class();
        v30 = [v11 objectForKey:@"AXSpeakTypingPayloadKeyRate"];
        int64_t v31 = __UIAccessibilityCastAsClass();

        [v31 doubleValue];
        double v33 = v32;

        buf[0] = 0;
        objc_opt_class();
        v34 = [v11 objectForKey:@"AXSpeakTypingPayloadKeyVolume"];
        v35 = __UIAccessibilityCastAsClass();

        [v35 doubleValue];
        double v37 = v36;

        [v16 setString:v29];
        if (v33 > 0.0) {
          [v16 setSpeakingRate:v33];
        }
        if (v37 > 0.0) {
          [v16 setVolume:v37];
        }
        [(AXSpeakServer *)self _speakAction:v16 isForResponderElement:0];
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_53;
        }
        uint64_t v56 = objc_opt_class();
        v29 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v56, objc_opt_class(), 0);
        buf[0] = 0;
        objc_opt_class();
        v57 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v29 fromData:v19 error:0];
        v58 = __UIAccessibilityCastAsClass();

        id v59 = [v58 length];
        v63[0] = _NSConcreteStackBlock;
        v63[1] = 3221225472;
        v63[2] = sub_4350;
        v63[3] = &unk_84F8;
        v63[4] = self;
        id v64 = v58;
        id v60 = v58;
        objc_msgSend(v60, "enumerateAttributesInRange:options:usingBlock:", 0, v59, 0, v63);
      }
LABEL_53:

LABEL_54:
      v17 = 0;
LABEL_64:

      return v17;
    case 7uLL:
      v38 = AXLogSpeakTyping();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v39 = [(AXSpeakServer *)self lastSpeechAction];
        *(_DWORD *)buf = 138477827;
        v70 = v39;
        _os_log_impl(&dword_0, v38, OS_LOG_TYPE_DEFAULT, "Retrieve last action: %{private}@", buf, 0xCu);
      }
      uint64_t v40 = [(AXSpeakServer *)self lastSpeechAction];
      id v41 = [v40 attributedString];
      v42 = [(AXSpeakServer *)self lastSpeechAction];
      v43 = v42;
      if (v41)
      {
        v44 = [v42 attributedString];
        uint64_t v45 = [v44 string];
      }
      else
      {
        uint64_t v45 = [v42 string];
      }

      if (v45) {
        v49 = (__CFString *)v45;
      }
      else {
        v49 = &stru_8620;
      }
      CFStringRef v65 = @"result";
      v66 = v49;
      v17 = +[NSDictionary dictionaryWithObjects:&v66 forKeys:&v65 count:1];
      goto LABEL_63;
    case 8uLL:
      uint64_t v46 = [(TTSSpeechAction *)self->_lastSpeechAction voiceIdentifier];
      v47 = (void *)v46;
      if (v46) {
        CFStringRef v48 = (const __CFString *)v46;
      }
      else {
        CFStringRef v48 = &stru_8620;
      }
      CFStringRef v67 = @"result";
      CFStringRef v68 = v48;
      v17 = +[NSDictionary dictionaryWithObjects:&v68 forKeys:&v67 count:1];

      goto LABEL_32;
    case 9uLL:
      v50 = AXLogSpeakTyping();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        v51 = [(AXSpeakServer *)self lastSpeechAction];
        *(_DWORD *)buf = 138477827;
        v70 = v51;
        _os_log_impl(&dword_0, v50, OS_LOG_TYPE_DEFAULT, "Clear last: %{private}@", buf, 0xCu);
      }
      [(AXSpeakServer *)self setLastSpeechAction:0];
      goto LABEL_54;
    case 0xAuLL:
      +[UIKeyboard removeAllDynamicDictionaries];
      v52 = +[AXSettings sharedInstance];
      v53 = [v11 objectForKey:@"voiceIdentifier"];
      v54 = [v11 objectForKey:@"language"];
      [v52 setSpeechVoiceIdentifier:v53 forLanguage:v54 sourceKey:AXSpeechSourceKeySpeechFeatures];

      goto LABEL_49;
    case 0xBuLL:
      if (!AXIsInternalInstall()) {
        goto LABEL_54;
      }
      v52 = [v11 objectForKey:@"enabled"];
      [v52 BOOLValue];
      _AXSSetLetterFeedbackEnabled();
      goto LABEL_49;
    case 0xCuLL:
      if (!AXIsInternalInstall()) {
        goto LABEL_54;
      }
      v52 = [v11 objectForKey:@"enabled"];
      [v52 BOOLValue];
      _AXSSetWordFeedbackEnabled();
      goto LABEL_49;
    case 0xDuLL:
LABEL_32:
      if (AXIsInternalInstall())
      {
        v49 = [v11 objectForKey:@"enabled"];
        [(__CFString *)v49 BOOLValue];
        _AXSSetPhoneticFeedbackEnabled();
LABEL_63:
      }
      goto LABEL_64;
    case 0xFuLL:
      if (AXIsInternalInstall()) {
        _AXSSetInUnitTestMode();
      }
      v17 = &off_88F0;
      goto LABEL_64;
    default:
      goto LABEL_64;
  }
}

- (BOOL)_isAllowedToSpeakForPid:(int)a3
{
  id v5 = [(AXSpeakServer *)self responderElement];
  unsigned int v6 = [v5 pid];

  if (v6 == a3) {
    return 1;
  }
  unsigned int v8 = [(AXSpeakServer *)self responderElement];

  if (!v8) {
    return 0;
  }
  int v9 = [(AXSpeakServer *)self responderElement];
  id v10 = [v9 remoteParent];

  if (!v10) {
    return 0;
  }
  uint64_t v11 = 9;
  while (1)
  {
    unsigned int v12 = [v10 pid];
    BOOL v7 = v12 == a3;
    if (v12 == a3) {
      break;
    }
    id v13 = [v10 remoteParent];

    if (v11-- != 0)
    {
      id v10 = v13;
      if (v13) {
        continue;
      }
    }
    goto LABEL_13;
  }
  id v13 = v10;
LABEL_13:

  return v7;
}

- (void)_speakAction:(id)a3 isForResponderElement:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  BOOL v7 = AXLogSpeakTyping();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v9 = 138477827;
    id v10 = v6;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "Will speak action: %{private}@", (uint8_t *)&v9, 0xCu);
  }

  [(AXSpeakServer *)self setLastSpeechAction:v6];
  [(AXSpeakServer *)self setIsLastSpeechActionForResponderElement:v4];
  unsigned int v8 = [(AXSpeakServer *)self speechManager];
  [v8 dispatchSpeechAction:v6];
}

- (id)_feedbackForCharacter:(id)a3 andVoiceIdentifier:(id)a4
{
  return [(AXCharacterSoundMap *)self->_characterSoundMap phoneticStringForCharacter:a3 forLanguage:self->_currentLanguage andVoiceIdentifier:a4];
}

- (TTSSpeechAction)lastSpeechAction
{
  return self->_lastSpeechAction;
}

- (void)setLastSpeechAction:(id)a3
{
}

- (AXElement)responderElement
{
  return self->_responderElement;
}

- (void)setResponderElement:(id)a3
{
}

- (NSString)elementValueText
{
  return self->_elementValueText;
}

- (void)setElementValueText:(id)a3
{
}

- (void)setSpeechManager:(id)a3
{
}

- (AXCharacterSoundMap)characterSoundMap
{
  return self->_characterSoundMap;
}

- (void)setCharacterSoundMap:(id)a3
{
}

- (BOOL)isLastSpeechActionForResponderElement
{
  return self->_isLastSpeechActionForResponderElement;
}

- (void)setIsLastSpeechActionForResponderElement:(BOOL)a3
{
  self->_isLastSpeechActionForResponderElement = a3;
}

- (NSString)currentSTSLabel
{
  return self->_currentSTSLabel;
}

- (void)setCurrentSTSLabel:(id)a3
{
}

- (double)lastTextReplacementOccurredTime
{
  return self->_lastTextReplacementOccurredTime;
}

- (void)setLastTextReplacementOccurredTime:(double)a3
{
  self->_lastTextReplacementOccurredTime = a3;
}

- (OS_dispatch_queue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_currentSTSLabel, 0);
  objc_storeStrong((id *)&self->_characterSoundMap, 0);
  objc_storeStrong((id *)&self->_speechManager, 0);
  objc_storeStrong((id *)&self->_elementValueText, 0);
  objc_storeStrong((id *)&self->_responderElement, 0);
  objc_storeStrong((id *)&self->_lastSpeechAction, 0);
  objc_storeStrong((id *)&self->_keyboardToLanguage, 0);
  objc_storeStrong((id *)&self->_availableLanguages, 0);
  objc_storeStrong((id *)&self->_punctuationLoaderQueue, 0);
  objc_storeStrong((id *)&self->_letterPunctuationTable, 0);
  objc_storeStrong((id *)&self->_feedbackDelayTimer, 0);

  objc_storeStrong((id *)&self->_currentLanguage, 0);
}

@end