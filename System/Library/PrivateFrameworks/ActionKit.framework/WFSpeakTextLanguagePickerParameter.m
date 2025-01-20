@interface WFSpeakTextLanguagePickerParameter
- (WFSpeakTextLanguagePickerParameter)initWithDefinition:(id)a3;
- (id)defaultLanguageCode;
- (id)enumeration:(id)a3 localizedLabelForPossibleState:(id)a4;
- (id)possibleStates;
- (void)loadDefaultSerializedRepresentationForEnumeration:(id)a3 completionHandler:(id)a4;
- (void)loadPossibleStatesForEnumeration:(id)a3 searchTerm:(id)a4 completionHandler:(id)a5;
@end

@implementation WFSpeakTextLanguagePickerParameter

- (void).cxx_destruct
{
}

- (id)possibleStates
{
  return self->_possibleStates;
}

- (void)loadDefaultSerializedRepresentationForEnumeration:(id)a3 completionHandler:(id)a4
{
  v5 = (void (**)(id, void *, void))a4;
  id v8 = [(WFSpeakTextLanguagePickerParameter *)self defaultLanguageCode];
  if ([v8 length]) {
    v6 = (void *)[objc_alloc(MEMORY[0x263F86F00]) initWithValue:v8];
  }
  else {
    v6 = 0;
  }
  v7 = [v6 serializedRepresentation];
  v5[2](v5, v7, 0);
}

- (id)enumeration:(id)a3 localizedLabelForPossibleState:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v4 = objc_msgSend(a4, "value", a3);
  v5 = [MEMORY[0x263EFF960] currentLocale];
  v6 = [v5 localizedStringForLocaleIdentifier:v4];
  v7 = [v6 capitalizedStringWithLocale:v5];

  if ([v7 length])
  {
    id v8 = v7;
  }
  else
  {
    v9 = getWFActionsLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      int v11 = 136315650;
      v12 = "-[WFSpeakTextLanguagePickerParameter enumeration:localizedLabelForPossibleState:]";
      __int16 v13 = 2114;
      v14 = v4;
      __int16 v15 = 2114;
      v16 = v5;
      _os_log_impl(&dword_23C364000, v9, OS_LOG_TYPE_FAULT, "%s getting localized string for language code %{public}@ failed, current locale: %{public}@", (uint8_t *)&v11, 0x20u);
    }

    id v8 = 0;
  }

  return v8;
}

- (void)loadPossibleStatesForEnumeration:(id)a3 searchTerm:(id)a4 completionHandler:(id)a5
{
  v6 = (void (**)(id, void *, void))a5;
  if (!self->_possibleStates)
  {
    v7 = [MEMORY[0x263EFF960] currentLocale];
    id v8 = +[WFSpeechSynthesisVoice availableLanguageCodes];
    v9 = [v8 allObjects];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __100__WFSpeakTextLanguagePickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke;
    v16[3] = &unk_264E5C240;
    id v17 = v7;
    id v10 = v7;
    int v11 = [v9 sortedArrayUsingComparator:v16];

    objc_msgSend(v11, "if_map:", &__block_literal_global_46478);
    v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
    possibleStates = self->_possibleStates;
    self->_possibleStates = v12;

    v14 = (void *)[objc_alloc(MEMORY[0x263F0FCB8]) initWithItems:self->_possibleStates];
    v6[2](v6, v14, 0);
  }
  __int16 v15 = (void *)[objc_alloc(MEMORY[0x263F0FCB8]) initWithItems:self->_possibleStates];
  v6[2](v6, v15, 0);
}

uint64_t __100__WFSpeakTextLanguagePickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a3;
  v7 = [v5 localizedStringForLocaleIdentifier:a2];
  id v8 = [v7 capitalizedStringWithLocale:*(void *)(a1 + 32)];

  v9 = [*(id *)(a1 + 32) localizedStringForLocaleIdentifier:v6];

  id v10 = [v9 capitalizedStringWithLocale:*(void *)(a1 + 32)];

  uint64_t v11 = [v8 localizedStandardCompare:v10];
  return v11;
}

id __100__WFSpeakTextLanguagePickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x263F86F00];
  id v3 = a2;
  v4 = (void *)[[v2 alloc] initWithValue:v3];

  return v4;
}

- (id)defaultLanguageCode
{
  v2 = +[WFSpeechSynthesisVoice defaultVoiceForLanguageCode:0];
  id v3 = [v2 languageCode];

  return v3;
}

- (WFSpeakTextLanguagePickerParameter)initWithDefinition:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WFSpeakTextLanguagePickerParameter;
  id v3 = [(WFSpeakTextLanguagePickerParameter *)&v7 initWithDefinition:a3];
  v4 = v3;
  if (v3)
  {
    [(WFDynamicEnumerationParameter *)v3 setDataSource:v3];
    v5 = v4;
  }

  return v4;
}

@end