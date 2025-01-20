@interface WFSpeakTextVoicePickerParameter
- (BOOL)isHidden;
- (WFAction)action;
- (WFSpeakTextVoicePickerParameter)initWithDefinition:(id)a3;
- (id)enumeration:(id)a3 localizedLabelForPossibleState:(id)a4;
- (id)selectedLanguageCode;
- (void)action:(id)a3 parameterStateDidChangeForKey:(id)a4;
- (void)loadDefaultSerializedRepresentationForEnumeration:(id)a3 completionHandler:(id)a4;
- (void)loadPossibleStatesForEnumeration:(id)a3 searchTerm:(id)a4 completionHandler:(id)a5;
- (void)setAction:(id)a3;
@end

@implementation WFSpeakTextVoicePickerParameter

- (void).cxx_destruct
{
}

- (WFAction)action
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_action);
  return (WFAction *)WeakRetained;
}

- (void)loadPossibleStatesForEnumeration:(id)a3 searchTerm:(id)a4 completionHandler:(id)a5
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  v6 = (void (**)(id, void *, void))a5;
  v7 = [(WFSpeakTextVoicePickerParameter *)self selectedLanguageCode];
  if (v7)
  {
    v8 = objc_opt_new();
    v9 = objc_opt_new();
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    v33 = v7;
    id obj = +[WFSpeechSynthesisVoice voicesForLanguageCode:v7];
    uint64_t v10 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          v14 = v9;
          v15 = v8;
          if (*(void *)v36 != v12) {
            objc_enumerationMutation(obj);
          }
          v16 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          id v17 = objc_alloc(MEMORY[0x263F86F00]);
          v18 = [v16 identifier];
          v19 = (void *)[v17 initWithValue:v18];

          v20 = [v16 identifier];
          LODWORD(v18) = [v20 hasPrefix:@"com.apple.ttsbundle.gryphon"];

          BOOL v21 = v18 == 0;
          v8 = v15;
          v9 = v14;
          if (v21) {
            v22 = v14;
          }
          else {
            v22 = v8;
          }
          [v22 addObject:v19];
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
      }
      while (v11);
    }

    if ([v8 count])
    {
      id v23 = objc_alloc(MEMORY[0x263F0FCC0]);
      v24 = WFLocalizedString(@"Siri");
      v25 = (void *)[v23 initWithTitle:v24 items:v8];

      id v26 = objc_alloc(MEMORY[0x263F0FCC0]);
      v27 = WFLocalizedString(@"Other");
      v28 = (void *)[v26 initWithTitle:v27 items:v9];

      id v29 = objc_alloc(MEMORY[0x263F0FCB8]);
      v39[0] = v25;
      v39[1] = v28;
      v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:v39 count:2];
      v31 = (void *)[v29 initWithSections:v30];
      v6[2](v6, v31, 0);
    }
    else
    {
      v25 = (void *)[objc_alloc(MEMORY[0x263F0FCB8]) initWithItems:v9];
      v6[2](v6, v25, 0);
    }

    v7 = v33;
  }
  else
  {
    v32 = getWFActionsLogObject();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v42 = "-[WFSpeakTextVoicePickerParameter loadPossibleStatesForEnumeration:searchTerm:completionHandler:]";
      _os_log_impl(&dword_23C364000, v32, OS_LOG_TYPE_DEBUG, "%s No language code.", buf, 0xCu);
    }

    v6[2](v6, 0, 0);
  }
}

- (id)enumeration:(id)a3 localizedLabelForPossibleState:(id)a4
{
  v4 = objc_msgSend(a4, "value", a3);
  v5 = +[WFSpeechSynthesisVoice voiceForIdentifier:v4];
  v6 = [v5 name];

  return v6;
}

- (void)loadDefaultSerializedRepresentationForEnumeration:(id)a3 completionHandler:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __103__WFSpeakTextVoicePickerParameter_loadDefaultSerializedRepresentationForEnumeration_completionHandler___block_invoke;
  v7[3] = &unk_264E5B4A0;
  v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  [(WFDynamicEnumerationParameter *)self loadPossibleStatesWithCompletionHandler:v7];
}

void __103__WFSpeakTextVoicePickerParameter_loadDefaultSerializedRepresentationForEnumeration_completionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) selectedLanguageCode];
  id v12 = +[WFSpeechSynthesisVoice defaultVoiceForLanguageCode:v2];

  v3 = [*(id *)(a1 + 32) possibleStates];
  if (!v12)
  {
    uint64_t v10 = *(void *)(a1 + 40);
    v9 = [v3 firstObject];
    uint64_t v11 = [v9 value];
    (*(void (**)(uint64_t, void *, void))(v10 + 16))(v10, v11, 0);

    goto LABEL_5;
  }
  id v4 = objc_alloc(MEMORY[0x263F86F00]);
  id v5 = [v12 identifier];
  id v6 = (void *)[v4 initWithValue:v5];
  int v7 = [v3 containsObject:v6];

  uint64_t v8 = *(void *)(a1 + 40);
  if (v7)
  {
    v9 = [v12 identifier];
    (*(void (**)(uint64_t, void *, void))(v8 + 16))(v8, v9, 0);
LABEL_5:

    goto LABEL_7;
  }
  (*(void (**)(uint64_t, void, void))(v8 + 16))(v8, 0, 0);
LABEL_7:
}

- (void)action:(id)a3 parameterStateDidChangeForKey:(id)a4
{
  id v5 = a4;
  id v6 = [(WFSpeakTextVoicePickerParameter *)self definition];
  int v7 = [v6 objectForKey:@"WFSpeakTextLanguageKey"];
  int v8 = [v5 isEqualToString:v7];

  if (v8)
  {
    [(WFDynamicEnumerationParameter *)self reloadPossibleStates];
    [(WFDynamicEnumerationParameter *)self defaultSerializedRepresentationDidChange];
  }
}

- (BOOL)isHidden
{
  v3 = [(WFDynamicEnumerationParameter *)self possibleStates];

  if (!v3) {
    return 0;
  }
  id v4 = [(WFDynamicEnumerationParameter *)self possibleStates];
  BOOL v5 = (unint64_t)[v4 count] < 2;

  return v5;
}

- (id)selectedLanguageCode
{
  v3 = [(WFSpeakTextVoicePickerParameter *)self definition];
  id v4 = [v3 objectForKey:@"WFSpeakTextLanguageKey"];

  BOOL v5 = [(WFSpeakTextVoicePickerParameter *)self action];
  id v6 = [v5 parameterStateForKey:v4];

  int v7 = [v6 value];
  if ([v7 length])
  {
    int v8 = [v6 value];
  }
  else
  {
    int v8 = 0;
  }

  return v8;
}

- (void)setAction:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_action);

  if (WeakRetained != obj)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_action);
    [v5 removeEventObserver:self];

    id v6 = objc_storeWeak((id *)&self->_action, obj);
    [obj addEventObserver:self];
  }
}

- (WFSpeakTextVoicePickerParameter)initWithDefinition:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WFSpeakTextVoicePickerParameter;
  v3 = [(WFSpeakTextVoicePickerParameter *)&v7 initWithDefinition:a3];
  id v4 = v3;
  if (v3)
  {
    [(WFDynamicEnumerationParameter *)v3 setDataSource:v3];
    id v5 = v4;
  }

  return v4;
}

@end