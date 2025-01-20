@interface WFTrelloBoardPickerParameter
- (Class)singleStateClass;
- (NSArray)possibleStates;
- (id)defaultSerializedRepresentation;
- (id)localizedLabelForPossibleState:(id)a3;
- (id)observer;
- (void)possibleStatesDidChange;
- (void)setObserver:(id)a3;
- (void)updateBoards;
- (void)wasAddedToWorkflow;
- (void)wasRemovedFromWorkflow;
@end

@implementation WFTrelloBoardPickerParameter

- (void).cxx_destruct
{
  objc_storeStrong(&self->_observer, 0);
  objc_storeStrong((id *)&self->_possibleStates, 0);
}

- (void)setObserver:(id)a3
{
}

- (id)observer
{
  return self->_observer;
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
  if (!possibleStates)
  {
    v4 = +[WFDiskCache workflowCache];
    v5 = (void *)MEMORY[0x263EFFA08];
    uint64_t v6 = objc_opt_class();
    v7 = objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0);
    v8 = [v4 objectOfClasses:v7 forKey:@"WFTrelloBoards"];

    objc_msgSend(v8, "if_compactMap:", &__block_literal_global_31424);
    v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v10 = self->_possibleStates;
    self->_possibleStates = v9;

    possibleStates = self->_possibleStates;
  }
  return possibleStates;
}

WFTrelloBoardSubstitutableState *__46__WFTrelloBoardPickerParameter_possibleStates__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [(WFVariableSubstitutableParameterState *)[WFTrelloBoardSubstitutableState alloc] initWithValue:v2];

  return v3;
}

- (id)defaultSerializedRepresentation
{
  id v2 = [(WFTrelloBoardPickerParameter *)self possibleStates];
  v3 = [v2 firstObject];
  v4 = [v3 serializedRepresentation];

  return v4;
}

- (void)possibleStatesDidChange
{
  possibleStates = self->_possibleStates;
  self->_possibleStates = 0;

  v4.receiver = self;
  v4.super_class = (Class)WFTrelloBoardPickerParameter;
  [(WFTrelloBoardPickerParameter *)&v4 possibleStatesDidChange];
  [(WFTrelloBoardPickerParameter *)self defaultSerializedRepresentationDidChange];
}

- (void)updateBoards
{
  v3 = +[WFAccount accounts];
  objc_super v4 = [v3 firstObject];

  if ([v4 isValid])
  {
    v5 = [WFTrelloSessionManager alloc];
    uint64_t v6 = [v4 token];
    v7 = [(WFTrelloSessionManager *)v5 initWithConfiguration:0 token:v6];

    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __44__WFTrelloBoardPickerParameter_updateBoards__block_invoke;
    v9[3] = &unk_264E5DB20;
    id v10 = v4;
    v11 = self;
    [(WFTrelloSessionManager *)v7 getOpenBoardsWithCompletionHandler:v9];
  }
  else
  {
    v8 = +[WFDiskCache workflowCache];
    [v8 removeObjectForKey:@"WFTrelloBoards" completion:0];
  }
}

void __44__WFTrelloBoardPickerParameter_updateBoards__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (v5)
  {
    v8 = +[WFDiskCache workflowCache];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __44__WFTrelloBoardPickerParameter_updateBoards__block_invoke_2;
    v11[3] = &unk_264E5EE70;
    v11[4] = *(void *)(a1 + 40);
    [v8 setObject:v5 forKey:@"WFTrelloBoards" completion:v11];
LABEL_6:

    goto LABEL_7;
  }
  v8 = [v6 domain];
  if (![v8 isEqualToString:@"WFTrelloErrorDomain"]) {
    goto LABEL_6;
  }
  uint64_t v9 = [v7 code];

  if (v9 == 100)
  {
    +[WFAccount deleteAccount:*(void *)(a1 + 32)];
    id v10 = +[WFDiskCache workflowCache];
    [v10 removeObjectForKey:@"WFTrelloBoards" completion:0];
  }
LABEL_7:
}

void __44__WFTrelloBoardPickerParameter_updateBoards__block_invoke_2(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__WFTrelloBoardPickerParameter_updateBoards__block_invoke_3;
  block[3] = &unk_264E5EE70;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __44__WFTrelloBoardPickerParameter_updateBoards__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) possibleStatesDidChange];
}

- (void)wasRemovedFromWorkflow
{
  v4.receiver = self;
  v4.super_class = (Class)WFTrelloBoardPickerParameter;
  [(WFTrelloBoardPickerParameter *)&v4 wasRemovedFromWorkflow];
  +[WFAccount removeAccountObserver:self->_observer];
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:@"WFTrelloBoardParameterNeedsUpdateNotification" object:0];
}

- (void)wasAddedToWorkflow
{
  v12.receiver = self;
  v12.super_class = (Class)WFTrelloBoardPickerParameter;
  [(WFTrelloBoardPickerParameter *)&v12 wasAddedToWorkflow];
  [(WFTrelloBoardPickerParameter *)self updateBoards];
  objc_initWeak(&location, self);
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  v8 = __50__WFTrelloBoardPickerParameter_wasAddedToWorkflow__block_invoke;
  uint64_t v9 = &unk_264E5B950;
  objc_copyWeak(&v10, &location);
  v3 = +[WFAccount addAccountObserver:&v6];
  id observer = self->_observer;
  self->_id observer = v3;

  id v5 = objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", v6, v7, v8, v9);
  [v5 addObserver:self selector:sel_possibleStatesDidChange name:@"WFTrelloBoardParameterNeedsUpdateNotification" object:0];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __50__WFTrelloBoardPickerParameter_wasAddedToWorkflow__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateBoards];
}

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

@end