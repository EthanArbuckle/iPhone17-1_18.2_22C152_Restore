@interface WFListeningModePickerParameter
- (Class)singleStateClass;
- (WFAction)action;
- (WFListeningModePickerParameter)initWithDefinition:(id)a3;
- (id)enumeration:(id)a3 localizedLabelForPossibleState:(id)a4;
- (void)action:(id)a3 parameterStateDidChangeForKey:(id)a4;
- (void)loadPossibleStatesForEnumeration:(id)a3 searchTerm:(id)a4 completionHandler:(id)a5;
- (void)setAction:(id)a3;
@end

@implementation WFListeningModePickerParameter

- (void).cxx_destruct
{
}

- (WFAction)action
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_action);
  return (WFAction *)WeakRetained;
}

- (void)action:(id)a3 parameterStateDidChangeForKey:(id)a4
{
  if ([a4 isEqualToString:@"WFRoute"])
  {
    [(WFDynamicEnumerationParameter *)self clearPossibleStates];
  }
}

- (id)enumeration:(id)a3 localizedLabelForPossibleState:(id)a4
{
  id v4 = a4;
  v5 = [v4 value];
  char v6 = [v5 isEqualToString:@"Normal"];

  if (v6)
  {
    v7 = @"Off";
LABEL_9:
    v14 = WFLocalizedString(v7);
    goto LABEL_10;
  }
  v8 = [v4 value];
  char v9 = [v8 isEqualToString:@"ActiveNoiseCancellation"];

  if (v9)
  {
    v7 = @"Noise Cancellation";
    goto LABEL_9;
  }
  v10 = [v4 value];
  char v11 = [v10 isEqualToString:@"Transparency"];

  if (v11)
  {
    v7 = @"Transparency";
    goto LABEL_9;
  }
  v12 = [v4 value];
  int v13 = [v12 isEqualToString:@"Adaptive"];

  if (v13)
  {
    v7 = @"Adaptive";
    goto LABEL_9;
  }
  v14 = 0;
LABEL_10:

  return v14;
}

- (void)loadPossibleStatesForEnumeration:(id)a3 searchTerm:(id)a4 completionHandler:(id)a5
{
  v21[1] = *MEMORY[0x263EF8340];
  id v6 = a5;
  v7 = [(WFListeningModePickerParameter *)self action];
  v8 = [v7 parameterStateForKey:@"WFRoute"];

  char v9 = [v8 value];
  if (v9)
  {
    v10 = objc_opt_new();
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __96__WFListeningModePickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke;
    v16[3] = &unk_264E58F30;
    id v19 = v6;
    id v17 = v9;
    id v18 = v10;
    id v11 = v10;
    [v11 findRouteMatchingDescriptor:v17 timeout:v16 completionHandler:15.0];

    v12 = v19;
  }
  else
  {
    int v13 = (void *)MEMORY[0x263F087E8];
    uint64_t v14 = *MEMORY[0x263F870B8];
    uint64_t v20 = *MEMORY[0x263F08320];
    WFLocalizedString(@"Please select a valid route first");
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    v21[0] = v11;
    v12 = [NSDictionary dictionaryWithObjects:v21 forKeys:&v20 count:1];
    v15 = [v13 errorWithDomain:v14 code:5 userInfo:v12];
    (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v15);
  }
}

void __96__WFListeningModePickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v31[1] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (!v5) {
    goto LABEL_7;
  }
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2050000000;
  v7 = (void *)getMPAVOutputDeviceRouteClass_softClass_21339;
  uint64_t v27 = getMPAVOutputDeviceRouteClass_softClass_21339;
  if (!getMPAVOutputDeviceRouteClass_softClass_21339)
  {
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __getMPAVOutputDeviceRouteClass_block_invoke_21340;
    v23[3] = &unk_264E5EC88;
    v23[4] = &v24;
    __getMPAVOutputDeviceRouteClass_block_invoke_21340((uint64_t)v23);
    v7 = (void *)v25[3];
  }
  id v8 = v7;
  _Block_object_dispose(&v24, 8);
  if (objc_opt_isKindOfClass())
  {
    id v9 = v5;
    v10 = WFAvailableListeningModesForRoute(v9);
    if ([v10 count])
    {
      id v11 = objc_msgSend(v10, "if_map:", &__block_literal_global_21347);
      v12 = (void *)[objc_alloc(MEMORY[0x263F0FCB8]) initWithItems:v11];
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    else
    {
      uint64_t v17 = *(void *)(a1 + 48);
      id v18 = (void *)MEMORY[0x263F087E8];
      uint64_t v28 = *MEMORY[0x263F08320];
      id v19 = NSString;
      id v11 = WFLocalizedString(@"Noise Control mode is not supported on %@");
      v12 = [v9 routeName];
      uint64_t v20 = objc_msgSend(v19, "localizedStringWithFormat:", v11, v12);
      v29 = v20;
      v21 = [NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
      v22 = [v18 errorWithDomain:*MEMORY[0x263F870B8] code:5 userInfo:v21];
      (*(void (**)(uint64_t, void, void *))(v17 + 16))(v17, 0, v22);
    }
  }
  else
  {
LABEL_7:
    uint64_t v13 = *(void *)(a1 + 48);
    uint64_t v14 = (void *)MEMORY[0x263F087E8];
    uint64_t v30 = *MEMORY[0x263F08320];
    v15 = NSString;
    WFLocalizedStringWithKey(@"Could Not Find “%@” (Listening Mode)", @"Could Not Find “%@”");
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = [*(id *)(a1 + 32) routeName];
    id v11 = objc_msgSend(v15, "localizedStringWithFormat:", v9, v10);
    v31[0] = v11;
    v12 = [NSDictionary dictionaryWithObjects:v31 forKeys:&v30 count:1];
    v16 = [v14 errorWithDomain:*MEMORY[0x263F870B8] code:5 userInfo:v12];
    (*(void (**)(uint64_t, void, void *))(v13 + 16))(v13, 0, v16);
  }
}

id __96__WFListeningModePickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x263F86F00];
  id v3 = a2;
  id v4 = (void *)[[v2 alloc] initWithValue:v3];

  return v4;
}

- (void)setAction:(id)a3
{
  p_action = &self->_action;
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_action);
  [WeakRetained removeEventObserver:self];

  id v6 = objc_storeWeak((id *)p_action, obj);
  [obj addEventObserver:self];
}

- (WFListeningModePickerParameter)initWithDefinition:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WFListeningModePickerParameter;
  id v3 = [(WFListeningModePickerParameter *)&v7 initWithDefinition:a3];
  id v4 = v3;
  if (v3)
  {
    [(WFDynamicEnumerationParameter *)v3 setDataSource:v3];
    id v5 = v4;
  }

  return v4;
}

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

@end