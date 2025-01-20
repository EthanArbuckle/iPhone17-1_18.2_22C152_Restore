@interface WFTrelloListPickerParameter
- (Class)singleStateClass;
- (NSArray)possibleStates;
- (WFAction)action;
- (id)defaultSerializedRepresentation;
- (id)localizedLabelForPossibleState:(id)a3;
- (id)observer;
- (void)action:(id)a3 parameterStateDidChangeForKey:(id)a4;
- (void)possibleStatesDidChange;
- (void)setAction:(id)a3;
- (void)setObserver:(id)a3;
- (void)updateLists;
- (void)wasAddedToWorkflow;
- (void)wasRemovedFromWorkflow;
@end

@implementation WFTrelloListPickerParameter

- (void).cxx_destruct
{
  objc_storeStrong(&self->_observer, 0);
  objc_destroyWeak((id *)&self->_action);
  objc_storeStrong((id *)&self->_possibleStates, 0);
}

- (void)setObserver:(id)a3
{
}

- (id)observer
{
  return self->_observer;
}

- (WFAction)action
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_action);
  return (WFAction *)WeakRetained;
}

- (void)action:(id)a3 parameterStateDidChangeForKey:(id)a4
{
  id v5 = a4;
  v6 = [(WFTrelloListPickerParameter *)self definition];
  id v7 = [v6 objectForKey:@"BoardKey"];

  LODWORD(v6) = [v5 isEqualToString:v7];
  if (v6)
  {
    [(WFTrelloListPickerParameter *)self possibleStatesDidChange];
    [(WFTrelloListPickerParameter *)self updateLists];
  }
}

- (id)localizedLabelForPossibleState:(id)a3
{
  v3 = [a3 value];
  v4 = [v3 name];

  return v4;
}

- (NSArray)possibleStates
{
  possibleStates = self->_possibleStates;
  if (possibleStates) {
    goto LABEL_4;
  }
  v4 = [(WFTrelloListPickerParameter *)self action];
  id v5 = [(WFTrelloListPickerParameter *)self definition];
  v6 = [v5 objectForKey:@"BoardKey"];
  id v7 = [v4 parameterStateForKey:v6];

  v8 = [v7 value];

  if (v8)
  {
    v9 = +[WFDiskCache workflowCache];
    v10 = (void *)MEMORY[0x263EFFA08];
    uint64_t v11 = objc_opt_class();
    v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v13 = [v7 value];
    v14 = [v13 identifier];
    v15 = objc_msgSend(v9, "objectOfClasses:forKeyComponents:", v12, v14, @"WFTrelloLists", 0);

    objc_msgSend(v15, "if_compactMap:", &__block_literal_global_42255);
    v16 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v17 = self->_possibleStates;
    self->_possibleStates = v16;

    possibleStates = self->_possibleStates;
LABEL_4:
    v18 = possibleStates;
    goto LABEL_5;
  }

  v18 = 0;
LABEL_5:
  return v18;
}

WFTrelloListSubstitutableState *__45__WFTrelloListPickerParameter_possibleStates__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [(WFVariableSubstitutableParameterState *)[WFTrelloListSubstitutableState alloc] initWithValue:v2];

  return v3;
}

- (id)defaultSerializedRepresentation
{
  id v2 = [(WFTrelloListPickerParameter *)self possibleStates];
  v3 = [v2 firstObject];
  v4 = [v3 serializedRepresentation];

  return v4;
}

- (void)possibleStatesDidChange
{
  possibleStates = self->_possibleStates;
  self->_possibleStates = 0;

  v4.receiver = self;
  v4.super_class = (Class)WFTrelloListPickerParameter;
  [(WFTrelloListPickerParameter *)&v4 possibleStatesDidChange];
  [(WFTrelloListPickerParameter *)self defaultSerializedRepresentationDidChange];
}

- (void)updateLists
{
  v3 = +[WFAccount accounts];
  objc_super v4 = [v3 firstObject];

  if ([v4 isValid])
  {
    id v5 = [(WFTrelloListPickerParameter *)self action];
    v6 = [(WFTrelloListPickerParameter *)self definition];
    id v7 = [v6 objectForKey:@"BoardKey"];
    v8 = [v5 parameterStateForKey:v7];

    v9 = [v8 value];

    if (v9)
    {
      v10 = [v8 value];
      uint64_t v11 = [v10 identifier];
      v19 = WFDiskCacheKey(v11, v12, v13, v14, v15, v16, v17, v18, @"WFTrelloLists");

      v20 = [WFTrelloSessionManager alloc];
      v21 = [v4 token];
      v22 = [(WFTrelloSessionManager *)v20 initWithConfiguration:0 token:v21];

      v23 = [v8 value];
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __42__WFTrelloListPickerParameter_updateLists__block_invoke;
      v26[3] = &unk_264E5EBA0;
      id v27 = v4;
      id v28 = v19;
      v29 = self;
      id v24 = v19;
      [(WFTrelloSessionManager *)v22 getListsForBoard:v23 completionHandler:v26];
    }
  }
  else
  {
    v25 = +[WFDiskCache workflowCache];
    [v25 removeObjectForKey:@"WFTrelloLists" completion:0];
  }
}

void __42__WFTrelloListPickerParameter_updateLists__block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5)
  {
    v8 = +[WFDiskCache workflowCache];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __42__WFTrelloListPickerParameter_updateLists__block_invoke_2;
    v11[3] = &unk_264E5EE70;
    uint64_t v9 = a1[5];
    v11[4] = a1[6];
    [v8 setObject:v5 forKey:v9 completion:v11];
LABEL_6:

    goto LABEL_7;
  }
  v8 = [v6 domain];
  if (![v8 isEqualToString:@"WFTrelloErrorDomain"]) {
    goto LABEL_6;
  }
  uint64_t v10 = [v7 code];

  if (v10 == 100)
  {
    +[WFAccount deleteAccount:a1[4]];
    v8 = +[WFDiskCache workflowCache];
    [v8 removeObjectForKey:a1[5] completion:0];
    goto LABEL_6;
  }
LABEL_7:
}

void __42__WFTrelloListPickerParameter_updateLists__block_invoke_2(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__WFTrelloListPickerParameter_updateLists__block_invoke_3;
  block[3] = &unk_264E5EE70;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __42__WFTrelloListPickerParameter_updateLists__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) possibleStatesDidChange];
}

- (void)wasRemovedFromWorkflow
{
  v4.receiver = self;
  v4.super_class = (Class)WFTrelloListPickerParameter;
  [(WFTrelloListPickerParameter *)&v4 wasRemovedFromWorkflow];
  +[WFAccount removeAccountObserver:self->_observer];
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:@"WFTrelloListParameterNeedsUpdate" object:0];
}

- (void)wasAddedToWorkflow
{
  v12.receiver = self;
  v12.super_class = (Class)WFTrelloListPickerParameter;
  [(WFTrelloListPickerParameter *)&v12 wasAddedToWorkflow];
  [(WFTrelloListPickerParameter *)self updateLists];
  objc_initWeak(&location, self);
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  v8 = __49__WFTrelloListPickerParameter_wasAddedToWorkflow__block_invoke;
  uint64_t v9 = &unk_264E5B950;
  objc_copyWeak(&v10, &location);
  v3 = +[WFAccount addAccountObserver:&v6];
  id observer = self->_observer;
  self->_id observer = v3;

  id v5 = objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", v6, v7, v8, v9);
  [v5 addObserver:self selector:sel_possibleStatesDidChange name:@"WFTrelloListParameterNeedsUpdate" object:0];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __49__WFTrelloListPickerParameter_wasAddedToWorkflow__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateLists];
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

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

@end