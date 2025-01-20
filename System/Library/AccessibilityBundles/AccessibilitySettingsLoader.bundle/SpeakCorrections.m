@interface SpeakCorrections
+ (void)disable;
+ (void)enable;
+ (void)initialize;
+ (void)updateStatus;
- (SpeakCorrections)init;
- (void)_correctionDisplayed:(id)a3;
- (void)_speakCorrection:(id)a3;
- (void)dealloc;
- (void)loadUIAccessibilityIfNecessary;
@end

@implementation SpeakCorrections

+ (void)updateStatus
{
  v2 = (CFStringRef *)MEMORY[0x263F8B0F8];
  CFPreferencesAppSynchronize((CFStringRef)*MEMORY[0x263F8B0F8]);
  if (CFPreferencesGetAppBooleanValue(@"SpeakCorrectionsEnabled", *v2, 0))
  {
    +[SpeakCorrections enable];
  }
  else
  {
    +[SpeakCorrections disable];
  }
}

+ (void)disable
{
  [(id)_SpeakCorrectionsLock lock];
  v2 = (void *)_Corrections;
  _Corrections = 0;

  v3 = (void *)_SpeakCorrectionsLock;

  [v3 unlock];
}

+ (void)initialize
{
  _SpeakCorrectionsLock = [objc_allocWithZone(MEMORY[0x263F08958]) init];

  MEMORY[0x270F9A758]();
}

+ (void)enable
{
  [(id)_SpeakCorrectionsLock lock];
  if (!_Corrections)
  {
    uint64_t v2 = [objc_allocWithZone((Class)SpeakCorrections) init];
    v3 = (void *)_Corrections;
    _Corrections = v2;
  }
  v4 = (void *)_SpeakCorrectionsLock;

  [v4 unlock];
}

- (SpeakCorrections)init
{
  v3 = AXLogSpeakTyping();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24016D000, v3, OS_LOG_TYPE_INFO, "********** Accessibility: Loading SpeakCorrections", buf, 2u);
  }

  v19.receiver = self;
  v19.super_class = (Class)SpeakCorrections;
  v4 = [(SpeakCorrections *)&v19 init];
  if (v4)
  {
    dispatch_queue_t v5 = dispatch_queue_create("speak-corrections-speaking-queue", 0);
    speakingQueue = v4->_speakingQueue;
    v4->_speakingQueue = (OS_dispatch_queue *)v5;

    uint64_t v25 = 0;
    v26 = &v25;
    uint64_t v27 = 0x2050000000;
    v7 = (void *)getTTSSpeechSynthesizerClass_softClass;
    uint64_t v28 = getTTSSpeechSynthesizerClass_softClass;
    if (!getTTSSpeechSynthesizerClass_softClass)
    {
      *(void *)buf = MEMORY[0x263EF8330];
      uint64_t v21 = 3221225472;
      v22 = __getTTSSpeechSynthesizerClass_block_invoke;
      v23 = &unk_26509DAA8;
      v24 = &v25;
      __getTTSSpeechSynthesizerClass_block_invoke((uint64_t)buf);
      v7 = (void *)v26[3];
    }
    id v8 = v7;
    _Block_object_dispose(&v25, 8);
    uint64_t v9 = [v8 availableLanguageCodes];
    availableLanguageCodes = v4->_availableLanguageCodes;
    v4->_availableLanguageCodes = (NSArray *)v9;

    id v11 = objc_allocWithZone(NSDictionary);
    v12 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.AccessibilitySettingsLoader"];
    v13 = [v12 pathForResource:@"KeyboardToLanguage" ofType:@"plist"];
    uint64_t v14 = [v11 initWithContentsOfFile:v13];
    keyboardToLanguage = v4->_keyboardToLanguage;
    v4->_keyboardToLanguage = (NSDictionary *)v14;

    v16 = [MEMORY[0x263F08A00] defaultCenter];
    [v16 addObserver:v4 selector:sel__correctionDisplayed_ name:*MEMORY[0x263F1D400] object:0];

    v17 = v4;
  }

  return v4;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)SpeakCorrections;
  [(SpeakCorrections *)&v5 dealloc];
}

- (void)_correctionDisplayed:(id)a3
{
  v4 = [a3 userInfo];
  id v9 = [v4 objectForKey:@"correction"];

  [MEMORY[0x263F08B88] cancelPreviousPerformRequestsWithTarget:self];
  if (v9)
  {
    self->_correctionCanceled = 0;
    -[SpeakCorrections performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__speakCorrection_, 0.200000003);
  }
  else
  {
    objc_super v5 = [MEMORY[0x263F1C738] activeInstance];

    if (v5)
    {
      v6 = [MEMORY[0x263F1C738] sharedInstance];
      v7 = [v6 valueForKey:@"m_previousInputString"];

      if (([v7 isEqualToString:@" "] & 1) == 0)
      {
        self->_correctionCanceled = 1;
        id v8 = [getSpeakTypingServicesClass() sharedInstance];
        [v8 notifySpeakServicesToStopSpeakingAutocorrections];
      }
    }
  }
}

- (void)loadUIAccessibilityIfNecessary
{
  if (!loadUIAccessibilityIfNecessary___UIAccessibilityHandle)
  {
    uint64_t v2 = MEMORY[0x2455E0C00](self, a2);
    v3 = [v2 stringByAppendingPathComponent:@"/System/Library/PrivateFrameworks/UIAccessibility.framework/UIAccessibility"];

    id v4 = v3;
    loadUIAccessibilityIfNecessary___UIAccessibilityHandle = (uint64_t)dlopen((const char *)[v4 fileSystemRepresentation], 1);
    if (!loadUIAccessibilityIfNecessary___UIAccessibilityHandle) {
      NSLog(&cfstr_UnableToLoadUi.isa);
    }
  }
}

- (void)_speakCorrection:(id)a3
{
  id v4 = a3;
  if (!self->_correctionCanceled)
  {
    objc_super v5 = [MEMORY[0x263F1C748] sharedInputModeController];
    v6 = [v5 currentInputMode];
    v7 = [v6 primaryLanguage];

    id v8 = [v7 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];
    if (![(NSArray *)self->_availableLanguageCodes containsObject:v8])
    {
      uint64_t v9 = [(NSDictionary *)self->_keyboardToLanguage objectForKey:v7];

      id v8 = (void *)v9;
    }
    if (UIAccessibilityIsVoiceOverRunning())
    {
      [(SpeakCorrections *)self loadUIAccessibilityIfNecessary];
      id v10 = v4;
      if (v8)
      {
        uint64_t v23 = 0;
        v24 = &v23;
        uint64_t v25 = 0x2020000000;
        id v11 = (void (*)(__CFString *))getAXSafeClassFromStringSymbolLoc_ptr_0;
        v26 = getAXSafeClassFromStringSymbolLoc_ptr_0;
        if (!getAXSafeClassFromStringSymbolLoc_ptr_0)
        {
          uint64_t v18 = MEMORY[0x263EF8330];
          uint64_t v19 = 3221225472;
          v20 = __getAXSafeClassFromStringSymbolLoc_block_invoke_0;
          uint64_t v21 = &unk_26509DAA8;
          v22 = &v23;
          v12 = (void *)AccessibilityUtilitiesLibrary_0();
          v24[3] = (uint64_t)dlsym(v12, "AXSafeClassFromString");
          getAXSafeClassFromStringSymbolLoc_ptr_0 = *(_UNKNOWN **)(v22[1] + 24);
          id v11 = (void (*)(__CFString *))v24[3];
        }
        _Block_object_dispose(&v23, 8);
        if (!v11) {
          soft_AXSafeClassFromString_cold_1();
        }
        v11(@"AXAttributedString");
        v13 = [(id)objc_claimAutoreleasedReturnValue() axAttributedStringWithString:v10];

        [v13 setAttribute:v8 forKey:@"UIAccessibilityTokenLanguage"];
        id v10 = v13;
      }
      UIAccessibilityPostNotification(*MEMORY[0x263F1CDC8], v10);
    }
    else
    {
      speakingQueue = self->_speakingQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __37__SpeakCorrections__speakCorrection___block_invoke;
      block[3] = &unk_26509DB38;
      id v16 = v4;
      id v17 = v8;
      dispatch_async(speakingQueue, block);

      id v10 = v16;
    }
  }
}

void __37__SpeakCorrections__speakCorrection___block_invoke(uint64_t a1)
{
  uint64_t v2 = [getSpeakTypingServicesClass() sharedInstance];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  objc_super v5 = (void (*)(id))getAXLanguageCanonicalFormToGeneralLanguageSymbolLoc_ptr;
  id v11 = getAXLanguageCanonicalFormToGeneralLanguageSymbolLoc_ptr;
  if (!getAXLanguageCanonicalFormToGeneralLanguageSymbolLoc_ptr)
  {
    v6 = (void *)AccessibilityUtilitiesLibrary_0();
    v9[3] = (uint64_t)dlsym(v6, "AXLanguageCanonicalFormToGeneralLanguage");
    getAXLanguageCanonicalFormToGeneralLanguageSymbolLoc_ptr = (_UNKNOWN *)v9[3];
    objc_super v5 = (void (*)(id))v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (!v5) {
    __37__SpeakCorrections__speakCorrection___block_invoke_cold_1();
  }
  v7 = v5(v4);

  [v2 notifySpeakServicesForSpeakAutoCorrections:v3 forCurrentInputMode:v7];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speakingQueue, 0);
  objc_storeStrong((id *)&self->_availableLanguageCodes, 0);
  objc_storeStrong((id *)&self->_keyboardToLanguage, 0);

  objc_storeStrong((id *)&self->_synthesizer, 0);
}

void __37__SpeakCorrections__speakCorrection___block_invoke_cold_1()
{
  v0 = [MEMORY[0x263F08690] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *soft_AXLanguageCanonicalFormToGeneralLanguage(NSString *__strong)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AXSettingsLoaderSoftLinkages.h", 84, @"%s", dlerror());

  __break(1u);
}

@end