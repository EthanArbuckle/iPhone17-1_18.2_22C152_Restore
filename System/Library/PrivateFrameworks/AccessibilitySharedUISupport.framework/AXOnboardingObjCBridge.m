@interface AXOnboardingObjCBridge
+ (id)sharedInstance;
- (BOOL)_isListening;
- (BOOL)heySiriEnabled;
- (BOOL)isSameLangaugeFromLocaleIdentifier:(id)a3 secondLocaleIdentifier:(id)a4;
- (BOOL)shouldShowCapitalizationPage;
- (BOOL)voiceControlEnabled;
- (id)_keyboardNotificationsToObserve;
- (id)_setupKeyboardNotificationsIfNecessary;
- (id)getVoiceControlEnabledDefaultName;
- (id)localizedVoiceControlCommand:(id)a3;
- (void)_adjustForKeyboard;
- (void)_listenForKeyboardNotifications:(BOOL)a3;
- (void)disableSoftwareKeyboard;
- (void)enableSoftwareKeyboard;
- (void)enableVoiceControl:(BOOL)a3;
- (void)set_isListening:(BOOL)a3;
- (void)toggleVoiceControl;
@end

@implementation AXOnboardingObjCBridge

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedInstance___instance;
  return v2;
}

uint64_t __40__AXOnboardingObjCBridge_sharedInstance__block_invoke()
{
  sharedInstance___instance = objc_alloc_init(AXOnboardingObjCBridge);
  return MEMORY[0x270F9A758]();
}

- (id)_keyboardNotificationsToObserve
{
  return &unk_26DD4AAE0;
}

- (void)_listenForKeyboardNotifications:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v28 = *MEMORY[0x263EF8340];
  v5 = [(AXOnboardingObjCBridge *)self _keyboardNotificationsToObserve];
  v6 = [MEMORY[0x263F08A00] defaultCenter];
  BOOL v7 = [(AXOnboardingObjCBridge *)self _isListening];
  if (v3)
  {
    if (!v7)
    {
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v8 = v5;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v23;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v23 != v11) {
              objc_enumerationMutation(v8);
            }
            [v6 addObserver:self selector:sel__adjustForKeyboard name:*(void *)(*((void *)&v22 + 1) + 8 * i) object:0];
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v27 count:16];
        }
        while (v10);
      }
LABEL_19:

      [(AXOnboardingObjCBridge *)self set_isListening:v3];
    }
  }
  else if (v7)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v13 = v5;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v19;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v19 != v16) {
            objc_enumerationMutation(v13);
          }
          objc_msgSend(v6, "removeObserver:name:object:", self, *(void *)(*((void *)&v18 + 1) + 8 * j), 0, (void)v18);
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
      }
      while (v15);
    }
    goto LABEL_19;
  }
}

- (id)_setupKeyboardNotificationsIfNecessary
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__AXOnboardingObjCBridge__setupKeyboardNotificationsIfNecessary__block_invoke;
  block[3] = &unk_264855890;
  block[4] = self;
  if (_setupKeyboardNotificationsIfNecessary_onceToken != -1) {
    dispatch_once(&_setupKeyboardNotificationsIfNecessary_onceToken, block);
  }
  return 0;
}

void __64__AXOnboardingObjCBridge__setupKeyboardNotificationsIfNecessary__block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 addObserver:*(void *)(a1 + 32) selector:sel__adjustForKeyboard name:*MEMORY[0x263F83808] object:0];

  BOOL v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:*(void *)(a1 + 32) selector:sel__adjustForKeyboard name:*MEMORY[0x263F837A8] object:0];

  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 addObserver:*(void *)(a1 + 32) selector:sel__adjustForKeyboard name:*MEMORY[0x263F837F8] object:0];
}

- (void)_adjustForKeyboard
{
  [(AXOnboardingObjCBridge *)self _listenForKeyboardNotifications:0];
  [(AXOnboardingObjCBridge *)self disableSoftwareKeyboard];
  [(AXOnboardingObjCBridge *)self _listenForKeyboardNotifications:1];
}

- (void)enableSoftwareKeyboard
{
}

- (void)disableSoftwareKeyboard
{
  GSEventSetHardwareKeyboardAttached();
  v2 = [MEMORY[0x263F828B0] activeInstance];
  [v2 setAutomaticMinimizationEnabled:1];

  BOOL v3 = [MEMORY[0x263F828B0] activeInstance];
  [v3 dismissKeyboard];

  id v4 = [MEMORY[0x263F828B0] sharedInstance];
  [v4 setAutomaticMinimizationEnabled:1];

  id v5 = [MEMORY[0x263F828B0] sharedInstance];
  [v5 dismissKeyboard];
}

- (void)toggleVoiceControl
{
  uint64_t v3 = [(AXOnboardingObjCBridge *)self voiceControlEnabled] ^ 1;
  [(AXOnboardingObjCBridge *)self enableVoiceControl:v3];
}

- (id)localizedVoiceControlCommand:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (localizedVoiceControlCommand__onceToken != -1) {
    dispatch_once(&localizedVoiceControlCommand__onceToken, &__block_literal_global_278);
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = (id)localizedVoiceControlCommand___FlattenedCommandGroupsAndItems;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
LABEL_5:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v18 != v7) {
        objc_enumerationMutation(v4);
      }
      uint64_t v9 = *(void **)(*((void *)&v17 + 1) + 8 * v8);
      if (([v9 isGroup] & 1) == 0)
      {
        uint64_t v10 = [v9 identifier];
        int v11 = [v10 isEqualToString:v3];

        if (v11) {
          break;
        }
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v6) {
          goto LABEL_5;
        }
        goto LABEL_12;
      }
    }
    id v13 = [v9 identifier];
    if ([v13 isEqualToString:@"Text.Unselect"])
    {
      uint64_t v14 = [v9 locale];
      char v15 = [v14 hasPrefix:@"en"];

      if (v15)
      {
        v12 = @"Unselect that";
LABEL_18:

        goto LABEL_19;
      }
    }
    else
    {
    }
    v12 = [v9 displayString];
    goto LABEL_18;
  }
LABEL_12:

  NSLog(&cfstr_CannotFindName.isa, v3);
  v12 = &stru_26DD45540;
LABEL_19:

  return v12;
}

void __55__AXOnboardingObjCBridge_localizedVoiceControlCommand___block_invoke()
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2050000000;
  v0 = (void *)getCACSpokenCommandPresentationClass_softClass;
  uint64_t v9 = getCACSpokenCommandPresentationClass_softClass;
  if (!getCACSpokenCommandPresentationClass_softClass)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __getCACSpokenCommandPresentationClass_block_invoke;
    v5[3] = &unk_2648559A0;
    v5[4] = &v6;
    __getCACSpokenCommandPresentationClass_block_invoke((uint64_t)v5);
    v0 = (void *)v7[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v6, 8);
  v2 = objc_opt_new();
  uint64_t v3 = [v2 flattenedCommandGroupsAndItems];
  id v4 = (void *)localizedVoiceControlCommand___FlattenedCommandGroupsAndItems;
  localizedVoiceControlCommand___FlattenedCommandGroupsAndItems = v3;
}

- (void)enableVoiceControl:(BOOL)a3
{
}

- (BOOL)voiceControlEnabled
{
  return _AXSCommandAndControlEnabled() != 0;
}

- (BOOL)heySiriEnabled
{
  v2 = [MEMORY[0x263F85AF0] sharedPreferences];
  char v3 = [v2 voiceTriggerEnabled];

  return v3;
}

- (BOOL)isSameLangaugeFromLocaleIdentifier:(id)a3 secondLocaleIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2050000000;
  uint64_t v7 = (void *)getCACLocaleUtilitiesClass_softClass;
  uint64_t v14 = getCACLocaleUtilitiesClass_softClass;
  if (!getCACLocaleUtilitiesClass_softClass)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __getCACLocaleUtilitiesClass_block_invoke;
    v10[3] = &unk_2648559A0;
    v10[4] = &v11;
    __getCACLocaleUtilitiesClass_block_invoke((uint64_t)v10);
    uint64_t v7 = (void *)v12[3];
  }
  id v8 = v7;
  _Block_object_dispose(&v11, 8);
  LOBYTE(v8) = [v8 isSameLangaugeFromLocaleIdentifier:v5 secondLocaleIdentifier:v6];

  return (char)v8;
}

- (BOOL)shouldShowCapitalizationPage
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2050000000;
  char v3 = (void *)getCACPreferencesClass_softClass;
  uint64_t v13 = getCACPreferencesClass_softClass;
  if (!getCACPreferencesClass_softClass)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __getCACPreferencesClass_block_invoke;
    v9[3] = &unk_2648559A0;
    v9[4] = &v10;
    __getCACPreferencesClass_block_invoke((uint64_t)v9);
    char v3 = (void *)v11[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v10, 8);
  id v5 = [v4 sharedPreferences];
  id v6 = [v5 bestLocaleIdentifier];
  if ([(AXOnboardingObjCBridge *)self isSameLangaugeFromLocaleIdentifier:@"ja_JP" secondLocaleIdentifier:v6]|| [(AXOnboardingObjCBridge *)self isSameLangaugeFromLocaleIdentifier:@"zh_HK" secondLocaleIdentifier:v6])
  {
    LOBYTE(v7) = 0;
  }
  else
  {
    BOOL v7 = ![(AXOnboardingObjCBridge *)self isSameLangaugeFromLocaleIdentifier:@"zh_CN" secondLocaleIdentifier:v6];
  }

  return v7;
}

- (id)getVoiceControlEnabledDefaultName
{
  return @"voiceControlEnabledOnLaunch";
}

- (BOOL)_isListening
{
  return self->__isListening;
}

- (void)set_isListening:(BOOL)a3
{
  self->__isListening = a3;
}

@end