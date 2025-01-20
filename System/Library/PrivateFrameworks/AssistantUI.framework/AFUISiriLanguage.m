@interface AFUISiriLanguage
- (AFUISiriLanguage)init;
- (AFUISiriLanguage)initWithDelegate:(id)a3;
- (AFUISiriLanguageDelegate)_delegate;
- (BOOL)_setupAssistantHasCompletedInitialRunAvailable;
- (BOOL)setupAssistantHasCompletedInitialRunChecked;
- (NSString)spokenLanguageCode;
- (id)_computeSpokenLanguageCode;
- (void)_computeSpokenLanguageCode;
- (void)_setSpokenLanguageCode:(id)a3;
- (void)_updateSpokenLanguageCode;
- (void)dealloc;
- (void)setSetupAssistantHasCompletedInitialRunAvailable:(BOOL)a3;
- (void)setSetupAssistantHasCompletedInitialRunChecked:(BOOL)a3;
@end

@implementation AFUISiriLanguage

- (AFUISiriLanguage)initWithDelegate:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AFUISiriLanguage;
  v5 = [(AFUISiriLanguage *)&v12 init];
  v6 = v5;
  if (v5)
  {
    *(_WORD *)&v5->_setupAssistantHasCompletedInitialRunChecked = 0;
    objc_storeWeak((id *)&v5->_delegate, v4);
    uint64_t v7 = [(AFUISiriLanguage *)v6 _computeSpokenLanguageCode];
    spokenLanguageCode = v6->_spokenLanguageCode;
    v6->_spokenLanguageCode = (NSString *)v7;

    v9 = [MEMORY[0x263F08A00] defaultCenter];
    [v9 addObserver:v6 selector:sel__spokenLanguageDidChange_ name:*MEMORY[0x263F282E8] object:0];

    v10 = [MEMORY[0x263F08A00] defaultCenter];
    [v10 addObserver:v6 selector:sel__currentLocaleDidChange_ name:*MEMORY[0x263EFF458] object:0];
  }
  return v6;
}

- (AFUISiriLanguage)init
{
  return [(AFUISiriLanguage *)self initWithDelegate:0];
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)AFUISiriLanguage;
  [(AFUISiriLanguage *)&v4 dealloc];
}

- (void)_updateSpokenLanguageCode
{
  id v3 = [(AFUISiriLanguage *)self _computeSpokenLanguageCode];
  [(AFUISiriLanguage *)self _setSpokenLanguageCode:v3];
}

- (void)_setSpokenLanguageCode:(id)a3
{
  id v7 = a3;
  if (!-[NSString isEqualToString:](self->_spokenLanguageCode, "isEqualToString:"))
  {
    objc_super v4 = (NSString *)[v7 copy];
    spokenLanguageCode = self->_spokenLanguageCode;
    self->_spokenLanguageCode = v4;

    v6 = [(AFUISiriLanguage *)self _delegate];
    [v6 siriLanguageSpokenLanguageCodeDidChange:self];
  }
}

- (BOOL)_setupAssistantHasCompletedInitialRunAvailable
{
  if (self->_setupAssistantHasCompletedInitialRunChecked) {
    return self->_setupAssistantHasCompletedInitialRunAvailable;
  }
  BOOL result = SetupAssistantLibraryCore() != 0;
  self->_setupAssistantHasCompletedInitialRunAvailable = result;
  self->_setupAssistantHasCompletedInitialRunChecked = 1;
  return result;
}

- (id)_computeSpokenLanguageCode
{
  id v3 = [MEMORY[0x263F285A0] sharedPreferences];
  objc_super v4 = [v3 languageCode];

  if (!v4)
  {
    v5 = [MEMORY[0x263F285A0] sharedPreferences];
    objc_super v4 = [v5 bestSupportedLanguageCodeForLanguageCode:0];

    if ([(AFUISiriLanguage *)self _setupAssistantHasCompletedInitialRunAvailable])
    {
      uint64_t v9 = 0;
      v10 = &v9;
      uint64_t v11 = 0x2020000000;
      v6 = (uint64_t (*)(void))getBYSetupAssistantHasCompletedInitialRunSymbolLoc_ptr;
      objc_super v12 = getBYSetupAssistantHasCompletedInitialRunSymbolLoc_ptr;
      if (!getBYSetupAssistantHasCompletedInitialRunSymbolLoc_ptr)
      {
        v8[0] = MEMORY[0x263EF8330];
        v8[1] = 3221225472;
        v8[2] = __getBYSetupAssistantHasCompletedInitialRunSymbolLoc_block_invoke;
        v8[3] = &unk_264691928;
        v8[4] = &v9;
        __getBYSetupAssistantHasCompletedInitialRunSymbolLoc_block_invoke((uint64_t)v8);
        v6 = (uint64_t (*)(void))v10[3];
      }
      _Block_object_dispose(&v9, 8);
      if (!v6) {
        -[AFUISiriLanguage _computeSpokenLanguageCode]();
      }
      if ((v6() & 1) == 0) {
        VSPreferencesSetSpokenLanguageIdentifier();
      }
    }
  }

  return v4;
}

- (NSString)spokenLanguageCode
{
  return self->_spokenLanguageCode;
}

- (AFUISiriLanguageDelegate)_delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AFUISiriLanguageDelegate *)WeakRetained;
}

- (BOOL)setupAssistantHasCompletedInitialRunChecked
{
  return self->_setupAssistantHasCompletedInitialRunChecked;
}

- (void)setSetupAssistantHasCompletedInitialRunChecked:(BOOL)a3
{
  self->_setupAssistantHasCompletedInitialRunChecked = a3;
}

- (void)setSetupAssistantHasCompletedInitialRunAvailable:(BOOL)a3
{
  self->_setupAssistantHasCompletedInitialRunAvailable = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_spokenLanguageCode, 0);
}

- (void)_computeSpokenLanguageCode
{
  v0 = [MEMORY[0x263F08690] currentHandler];
  v1 = [NSString stringWithUTF8String:"BOOL soft_BYSetupAssistantHasCompletedInitialRun(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AFUISiriLanguage.m", 14, @"%s", dlerror());

  __break(1u);
}

@end