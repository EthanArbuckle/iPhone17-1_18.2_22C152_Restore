@interface WFEvernoteNotebookPickerParameter
+ (id)referencedActionResourceClasses;
- (Class)singleStateClass;
- (NSArray)possibleStates;
- (WFEvernoteAccessResource)evernoteAccessResource;
- (id)localizedLabelForPossibleState:(id)a3;
- (void)possibleStatesDidChange;
- (void)setActionResources:(id)a3;
- (void)setEvernoteAccessResource:(id)a3;
- (void)updateNotebooks;
- (void)wasAddedToWorkflow;
@end

@implementation WFEvernoteNotebookPickerParameter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_evernoteAccessResource, 0);
  objc_storeStrong((id *)&self->_possibleStates, 0);
}

- (WFEvernoteAccessResource)evernoteAccessResource
{
  return self->_evernoteAccessResource;
}

- (id)localizedLabelForPossibleState:(id)a3
{
  return (id)[a3 value];
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
    v8 = [v4 objectOfClasses:v7 forKey:@"WFEvernoteNotebooks"];

    objc_msgSend(v8, "if_compactMap:", &__block_literal_global_275);
    v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v10 = self->_possibleStates;
    self->_possibleStates = v9;

    possibleStates = self->_possibleStates;
  }
  return possibleStates;
}

id __51__WFEvernoteNotebookPickerParameter_possibleStates__block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x263F86F00];
  id v3 = a2;
  id v4 = [v2 alloc];
  v5 = [v3 name];

  uint64_t v6 = (void *)[v4 initWithValue:v5];
  return v6;
}

- (void)possibleStatesDidChange
{
  possibleStates = self->_possibleStates;
  self->_possibleStates = 0;

  v4.receiver = self;
  v4.super_class = (Class)WFEvernoteNotebookPickerParameter;
  [(WFEvernoteNotebookPickerParameter *)&v4 possibleStatesDidChange];
  [(WFEvernoteNotebookPickerParameter *)self defaultSerializedRepresentationDidChange];
}

- (void)updateNotebooks
{
  id v3 = +[WFEvernoteAccessResource evernoteSession];
  char v4 = [v3 isAuthenticated];

  if (v4)
  {
    v5 = +[WFEvernoteAccessResource evernoteSession];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __52__WFEvernoteNotebookPickerParameter_updateNotebooks__block_invoke;
    v7[3] = &unk_264E5EEE8;
    v7[4] = self;
    [v5 listWritableNotebooksWithCompletion:v7];
  }
  else
  {
    id v6 = +[WFDiskCache workflowCache];
    [v6 removeObjectForKey:@"WFEvernoteNotebooks" completion:0];
  }
}

void __52__WFEvernoteNotebookPickerParameter_updateNotebooks__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (!a2)
  {
    v9 = [v5 domain];
    if ([v9 isEqualToString:@"ENErrorDomain"])
    {
      uint64_t v10 = [v6 code];

      if (v10 != 2) {
        goto LABEL_7;
      }
      v9 = +[WFDiskCache workflowCache];
      [v9 removeObjectForKey:@"WFEvernoteNotebooks" completion:0];
    }

    goto LABEL_7;
  }
  v7 = objc_msgSend(a2, "if_map:", &__block_literal_global_47352);
  v8 = +[WFDiskCache workflowCache];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __52__WFEvernoteNotebookPickerParameter_updateNotebooks__block_invoke_3;
  v11[3] = &unk_264E5EE70;
  v11[4] = *(void *)(a1 + 32);
  [v8 setObject:v7 forKey:@"WFEvernoteNotebooks" completion:v11];

LABEL_7:
}

void __52__WFEvernoteNotebookPickerParameter_updateNotebooks__block_invoke_3(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__WFEvernoteNotebookPickerParameter_updateNotebooks__block_invoke_4;
  block[3] = &unk_264E5EE70;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __52__WFEvernoteNotebookPickerParameter_updateNotebooks__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) possibleStatesDidChange];
}

WFEvernoteNotebook *__52__WFEvernoteNotebookPickerParameter_updateNotebooks__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[WFEvernoteNotebook alloc] initWithNotebook:v2];

  return v3;
}

- (void)wasAddedToWorkflow
{
  v3.receiver = self;
  v3.super_class = (Class)WFEvernoteNotebookPickerParameter;
  [(WFEvernoteNotebookPickerParameter *)&v3 wasAddedToWorkflow];
  [(WFEvernoteNotebookPickerParameter *)self updateNotebooks];
}

- (void)setEvernoteAccessResource:(id)a3
{
  id v9 = a3;
  p_evernoteAccessResource = &self->_evernoteAccessResource;
  id v6 = (void *)MEMORY[0x263F873F0];
  if (self->_evernoteAccessResource)
  {
    v7 = [MEMORY[0x263F08A00] defaultCenter];
    [v7 removeObserver:self name:*v6 object:*p_evernoteAccessResource];
  }
  objc_storeStrong((id *)&self->_evernoteAccessResource, a3);
  if (*p_evernoteAccessResource)
  {
    v8 = [MEMORY[0x263F08A00] defaultCenter];
    [v8 addObserver:self selector:sel_updateNotebooks name:*v6 object:*p_evernoteAccessResource];
  }
}

- (void)setActionResources:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  char v4 = [a3 anyObject];
  uint64_t v5 = objc_opt_class();
  id v6 = v4;
  if (v6 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    v8 = getWFGeneralLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      int v10 = 136315906;
      v11 = "WFEnforceClass";
      __int16 v12 = 2114;
      id v13 = v6;
      __int16 v14 = 2114;
      id v15 = (id)objc_opt_class();
      __int16 v16 = 2114;
      uint64_t v17 = v5;
      id v9 = v15;
      _os_log_impl(&dword_23C364000, v8, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", (uint8_t *)&v10, 0x2Au);
    }
    id v7 = 0;
  }
  else
  {
    id v7 = v6;
  }

  [(WFEvernoteNotebookPickerParameter *)self setEvernoteAccessResource:v7];
}

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

+ (id)referencedActionResourceClasses
{
  id v2 = (void *)MEMORY[0x263EFFA08];
  uint64_t v3 = objc_opt_class();
  return (id)[v2 setWithObject:v3];
}

@end