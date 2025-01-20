@interface WFVPNPickerParameter
- (BOOL)enumerationAllowsMultipleValues:(id)a3;
- (Class)singleStateClass;
- (WFVPNPickerParameter)initWithDefinition:(id)a3;
- (id)accessoryIconForPossibleState:(id)a3;
- (id)enumeration:(id)a3 localizedLabelForPossibleState:(id)a4;
- (id)enumeration:(id)a3 localizedSubtitleLabelForPossibleState:(id)a4;
- (void)loadPossibleStatesForEnumeration:(id)a3 searchTerm:(id)a4 completionHandler:(id)a5;
@end

@implementation WFVPNPickerParameter

- (void)loadPossibleStatesForEnumeration:(id)a3 searchTerm:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2050000000;
  v10 = (void *)getNEVPNManagerClass_softClass;
  uint64_t v19 = getNEVPNManagerClass_softClass;
  if (!getNEVPNManagerClass_softClass)
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __getNEVPNManagerClass_block_invoke;
    v15[3] = &unk_264E5EC88;
    v15[4] = &v16;
    __getNEVPNManagerClass_block_invoke((uint64_t)v15);
    v10 = (void *)v17[3];
  }
  id v11 = v10;
  _Block_object_dispose(&v16, 8);
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __86__WFVPNPickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke;
  v13[3] = &unk_264E5CE88;
  id v14 = v9;
  id v12 = v9;
  [v11 loadAllFromPreferencesWithCompletionHandler:v13];
}

void __86__WFVPNPickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if ([v5 count])
  {
    id v7 = objc_alloc(MEMORY[0x263F0FCB8]);
    id v8 = objc_msgSend(v5, "if_compactMap:", &__block_literal_global_46139);
    id v9 = (void *)[v7 initWithItems:v8];

    v10 = getWFActionsLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      id v11 = [v9 allItems];
      int v13 = 136315394;
      id v14 = "-[WFVPNPickerParameter loadPossibleStatesForEnumeration:searchTerm:completionHandler:]_block_invoke";
      __int16 v15 = 2048;
      uint64_t v16 = [v11 count];
      _os_log_impl(&dword_23C364000, v10, OS_LOG_TYPE_DEBUG, "%s Returning %lu available NEVPNManagers", (uint8_t *)&v13, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v12 = getWFActionsLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 136315138;
      id v14 = "-[WFVPNPickerParameter loadPossibleStatesForEnumeration:searchTerm:completionHandler:]_block_invoke";
      _os_log_impl(&dword_23C364000, v12, OS_LOG_TYPE_DEBUG, "%s No NEVPNManagers found.", (uint8_t *)&v13, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

WFVPNParameterState *__86__WFVPNPickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke_174(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v2 = a2;
  uint64_t v3 = [v2 identifier];
  if (v3
    && (v4 = (void *)v3,
        [v2 localizedDescription],
        id v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 length],
        v5,
        v4,
        v6))
  {
    id v7 = [v2 appBundleIdentifier];
    if ([v7 length])
    {
      id v8 = (void *)[objc_alloc(MEMORY[0x263F0F988]) initWithBundleIdentifier:v7];
      id v9 = [MEMORY[0x263F0F9B0] sharedResolver];
      v10 = [v9 resolvedAppMatchingDescriptor:v8];
    }
    else
    {
      v10 = 0;
    }
    id v14 = [WFVPNConfiguration alloc];
    __int16 v15 = [v2 identifier];
    uint64_t v16 = [v2 localizedDescription];
    uint64_t v17 = [(WFVPNConfiguration *)v14 initWithIdentifier:v15 title:v16 appDescriptor:v10];

    int v13 = [(WFVariableSubstitutableParameterState *)[WFVPNParameterState alloc] initWithValue:v17];
  }
  else
  {
    id v11 = getWFActionsLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v12 = [v2 description];
      int v19 = 136315394;
      v20 = "-[WFVPNPickerParameter loadPossibleStatesForEnumeration:searchTerm:completionHandler:]_block_invoke";
      __int16 v21 = 2112;
      v22 = v12;
      _os_log_impl(&dword_23C364000, v11, OS_LOG_TYPE_ERROR, "%s Skipping VPNManager because of missing fields: %@", (uint8_t *)&v19, 0x16u);
    }
    int v13 = 0;
  }

  return v13;
}

- (BOOL)enumerationAllowsMultipleValues:(id)a3
{
  return 0;
}

- (id)accessoryIconForPossibleState:(id)a3
{
  uint64_t v3 = [a3 value];
  v4 = [v3 appDescriptor];

  if ([v4 isInstalled])
  {
    id v5 = objc_alloc(MEMORY[0x263F85148]);
    uint64_t v6 = [v4 bundleIdentifier];
    id v7 = (void *)[v5 initWithBundleIdentifier:v6];
  }
  else
  {
    id v8 = objc_alloc(MEMORY[0x263F85438]);
    id v9 = objc_alloc(MEMORY[0x263F852F8]);
    uint64_t v6 = [MEMORY[0x263F851A8] colorWithPaletteColor:7];
    v10 = (void *)[v9 initWithColor:v6];
    id v7 = (void *)[v8 initWithSymbolName:@"network.connected.to.line.below.fill" background:v10];
  }
  return v7;
}

- (id)enumeration:(id)a3 localizedSubtitleLabelForPossibleState:(id)a4
{
  v4 = objc_msgSend(a4, "value", a3);
  id v5 = [v4 appDescriptor];
  uint64_t v6 = [v5 localizedName];

  return v6;
}

- (id)enumeration:(id)a3 localizedLabelForPossibleState:(id)a4
{
  v4 = objc_msgSend(a4, "value", a3);
  id v5 = [v4 title];

  return v5;
}

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

- (WFVPNPickerParameter)initWithDefinition:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WFVPNPickerParameter;
  uint64_t v3 = [(WFVPNPickerParameter *)&v7 initWithDefinition:a3];
  v4 = v3;
  if (v3)
  {
    [(WFDynamicEnumerationParameter *)v3 setDataSource:v3];
    id v5 = v4;
  }

  return v4;
}

@end