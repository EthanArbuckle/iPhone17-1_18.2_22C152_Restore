@interface WFTranslateTextLanguagePickerParameter
- (BOOL)supportsLanguageDetection;
- (Class)singleStateClass;
- (NSArray)possibleStates;
- (WFTranslateTextLanguagePickerParameter)initWithDefinition:(id)a3;
- (id)defaultSerializedRepresentation;
- (id)localizedLabelForPossibleState:(id)a3;
- (id)possibleStatesForLocalization;
- (void)getAvailableLanguagesWithCompletionHandler:(id)a3;
- (void)possibleStatesDidChange;
- (void)wasAddedToWorkflow;
@end

@implementation WFTranslateTextLanguagePickerParameter

- (void).cxx_destruct
{
}

- (BOOL)supportsLanguageDetection
{
  return self->_supportsLanguageDetection;
}

- (void)getAvailableLanguagesWithCompletionHandler:(id)a3
{
  id v3 = a3;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2050000000;
  v4 = (void *)get_LTTranslatorClass_softClass_54083;
  uint64_t v13 = get_LTTranslatorClass_softClass_54083;
  if (!get_LTTranslatorClass_softClass_54083)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __get_LTTranslatorClass_block_invoke_54084;
    v9[3] = &unk_264E5EC88;
    v9[4] = &v10;
    __get_LTTranslatorClass_block_invoke_54084((uint64_t)v9);
    v4 = (void *)v11[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v10, 8);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __85__WFTranslateTextLanguagePickerParameter_getAvailableLanguagesWithCompletionHandler___block_invoke;
  v7[3] = &unk_264E5E5B8;
  id v8 = v3;
  id v6 = v3;
  [v5 availableLocalePairsForTask:5 completion:v7];
}

void __85__WFTranslateTextLanguagePickerParameter_getAvailableLanguagesWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = objc_opt_new();
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        v11 = [v10 sourceLocale];
        [v4 addObject:v11];

        uint64_t v12 = [v10 targetLocale];
        [v4 addObject:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v7);
  }

  uint64_t v13 = objc_opt_new();
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v14 = v4;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v25;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v25 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = *(void **)(*((void *)&v24 + 1) + 8 * j);
        v20 = objc_msgSend(v19, "wf_displayName", (void)v24);
        v21 = [v19 localeIdentifier];
        [v13 setObject:v20 forKey:v21];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v16);
  }

  uint64_t v22 = *(void *)(a1 + 32);
  v23 = (void *)[v13 copy];
  (*(void (**)(uint64_t, void *))(v22 + 16))(v22, v23);
}

- (id)localizedLabelForPossibleState:(id)a3
{
  id v3 = [a3 value];
  v4 = +[WFDiskCache workflowCache];
  id v5 = (void *)MEMORY[0x263EFFA08];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  uint64_t v8 = (objc_class *)objc_opt_class();
  v9 = NSStringFromClass(v8);
  uint64_t v10 = [v4 objectOfClasses:v7 forKey:v9];

  if ([v3 isEqualToString:@"Detect Language"]) {
    WFLocalizedString(@"Detected Language");
  }
  else {
  v11 = [v10 objectForKey:v3];
  }

  return v11;
}

- (id)possibleStatesForLocalization
{
  return (id)MEMORY[0x263EFFA68];
}

- (NSArray)possibleStates
{
  possibleStates = self->_possibleStates;
  if (possibleStates)
  {
LABEL_6:
    uint64_t v17 = possibleStates;
    goto LABEL_7;
  }
  v4 = +[WFDiskCache workflowCache];
  id v5 = (void *)MEMORY[0x263EFFA08];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
  uint64_t v8 = (objc_class *)objc_opt_class();
  v9 = NSStringFromClass(v8);
  uint64_t v10 = [v4 objectOfClasses:v7 forKey:v9];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v11 = [v10 keysSortedByValueUsingComparator:&__block_literal_global_54115];
    objc_msgSend(v11, "if_compactMap:", &__block_literal_global_191_54116);
    uint64_t v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
    if ([(WFTranslateTextLanguagePickerParameter *)self supportsLanguageDetection])
    {
      uint64_t v13 = (void *)[(NSArray *)v12 mutableCopy];
      id v14 = [(WFVariableSubstitutableParameterState *)[WFLanguageSubstitutableState alloc] initWithValue:@"Detect Language"];
      [v13 insertObject:v14 atIndex:0];

      uint64_t v15 = [v13 copy];
      uint64_t v12 = (NSArray *)v15;
    }
    uint64_t v16 = self->_possibleStates;
    self->_possibleStates = v12;

    possibleStates = self->_possibleStates;
    goto LABEL_6;
  }

  uint64_t v17 = 0;
LABEL_7:
  return v17;
}

WFLanguageSubstitutableState *__56__WFTranslateTextLanguagePickerParameter_possibleStates__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [(WFVariableSubstitutableParameterState *)[WFLanguageSubstitutableState alloc] initWithValue:v2];

  return v3;
}

uint64_t __56__WFTranslateTextLanguagePickerParameter_possibleStates__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "localizedCaseInsensitiveCompare:");
}

- (id)defaultSerializedRepresentation
{
  if ([(WFTranslateTextLanguagePickerParameter *)self supportsLanguageDetection]) {
    id v2 = @"Detect Language";
  }
  else {
    id v2 = @"en_US";
  }
  return +[WFStringSubstitutableState serializedRepresentationFromValue:v2];
}

- (void)possibleStatesDidChange
{
  possibleStates = self->_possibleStates;
  self->_possibleStates = 0;

  v4.receiver = self;
  v4.super_class = (Class)WFTranslateTextLanguagePickerParameter;
  [(WFTranslateTextLanguagePickerParameter *)&v4 possibleStatesDidChange];
}

- (void)wasAddedToWorkflow
{
  v4.receiver = self;
  v4.super_class = (Class)WFTranslateTextLanguagePickerParameter;
  [(WFTranslateTextLanguagePickerParameter *)&v4 wasAddedToWorkflow];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __60__WFTranslateTextLanguagePickerParameter_wasAddedToWorkflow__block_invoke;
  v3[3] = &unk_264E5E550;
  v3[4] = self;
  [(WFTranslateTextLanguagePickerParameter *)self getAvailableLanguagesWithCompletionHandler:v3];
}

void __60__WFTranslateTextLanguagePickerParameter_wasAddedToWorkflow__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if ([v3 count])
  {
    objc_super v4 = +[WFDiskCache workflowCache];
    id v5 = (objc_class *)objc_opt_class();
    uint64_t v6 = NSStringFromClass(v5);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __60__WFTranslateTextLanguagePickerParameter_wasAddedToWorkflow__block_invoke_177;
    v8[3] = &unk_264E5EE70;
    v8[4] = *(void *)(a1 + 32);
    [v4 setObject:v3 forKey:v6 completion:v8];
  }
  else
  {
    uint64_t v7 = getWFActionsLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v10 = "-[WFTranslateTextLanguagePickerParameter wasAddedToWorkflow]_block_invoke";
      _os_log_impl(&dword_23C364000, v7, OS_LOG_TYPE_ERROR, "%s Unable to get available languages for translation", buf, 0xCu);
    }
  }
}

void __60__WFTranslateTextLanguagePickerParameter_wasAddedToWorkflow__block_invoke_177(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__WFTranslateTextLanguagePickerParameter_wasAddedToWorkflow__block_invoke_2;
  block[3] = &unk_264E5EE70;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __60__WFTranslateTextLanguagePickerParameter_wasAddedToWorkflow__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) possibleStatesDidChange];
}

- (WFTranslateTextLanguagePickerParameter)initWithDefinition:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)WFTranslateTextLanguagePickerParameter;
  id v5 = [(WFTranslateTextLanguagePickerParameter *)&v15 initWithDefinition:v4];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKey:@"LanguageDetection"];
    uint64_t v7 = objc_opt_class();
    id v8 = v6;
    if (v8 && (objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v10 = getWFGeneralLogObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        uint64_t v11 = objc_opt_class();
        *(_DWORD *)buf = 136315906;
        uint64_t v17 = "WFEnforceClass";
        __int16 v18 = 2114;
        id v19 = v8;
        __int16 v20 = 2114;
        v21 = v11;
        __int16 v22 = 2114;
        uint64_t v23 = v7;
        id v12 = v11;
        _os_log_impl(&dword_23C364000, v10, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", buf, 0x2Au);
      }
      id v9 = 0;
    }
    else
    {
      id v9 = v8;
    }

    v5->_supportsLanguageDetection = [v9 BOOLValue];
    uint64_t v13 = v5;
  }

  return v5;
}

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

@end