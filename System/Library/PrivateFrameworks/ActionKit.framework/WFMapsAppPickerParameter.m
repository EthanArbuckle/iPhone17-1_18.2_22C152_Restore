@interface WFMapsAppPickerParameter
- (NSOrderedSet)supportedAppIdentifiers;
- (WFMapsAppPickerParameter)initWithDefinition:(id)a3;
- (id)localizedLabelForPossibleState:(id)a3;
- (id)possibleStates;
- (id)possibleStatesForLocalization;
- (void)addObservers;
- (void)dealloc;
- (void)refreshInstalledApps;
- (void)removeObservers;
- (void)wasAddedToWorkflow;
- (void)wasRemovedFromWorkflow;
@end

@implementation WFMapsAppPickerParameter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedAppIdentifiers, 0);
  objc_storeStrong((id *)&self->_possibleStates, 0);
}

- (NSOrderedSet)supportedAppIdentifiers
{
  return self->_supportedAppIdentifiers;
}

- (id)possibleStates
{
  return self->_possibleStates;
}

- (void)removeObservers
{
  id v5 = [MEMORY[0x263F86828] sharedRegistry];
  v3 = [(WFMapsAppPickerParameter *)self supportedAppIdentifiers];
  v4 = [v3 array];
  [v5 removeInstallStatusObserver:self forAppIdentifiers:v4];
}

- (void)addObservers
{
  id v5 = [MEMORY[0x263F86828] sharedRegistry];
  v3 = [(WFMapsAppPickerParameter *)self supportedAppIdentifiers];
  v4 = [v3 array];
  [v5 addInstallStatusObserver:self forAppIdentifiers:v4];
}

- (void)refreshInstalledApps
{
  v3 = [MEMORY[0x263F86828] sharedRegistry];
  v4 = [(WFMapsAppPickerParameter *)self supportedAppIdentifiers];
  id v5 = [v4 array];
  id v9 = [v3 appsWithIdentifiers:v5];

  objc_msgSend(v9, "if_compactMap:", &__block_literal_global_242);
  v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  possibleStates = self->_possibleStates;
  self->_possibleStates = v6;

  [(WFMapsAppPickerParameter *)self possibleStatesDidChange];
  v8 = [(WFMapsAppPickerParameter *)self possibleStates];
  -[WFMapsAppPickerParameter setHidden:](self, "setHidden:", (unint64_t)[v8 count] < 2);
}

id __48__WFMapsAppPickerParameter_refreshInstalledApps__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isInstalled])
  {
    id v3 = objc_alloc(MEMORY[0x263F86F00]);
    v4 = WFMapsAppNamesByIdentifier();
    id v5 = [v2 identifier];
    v6 = [v4 objectForKey:v5];
    v7 = (void *)[v3 initWithValue:v6];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)localizedLabelForPossibleState:(id)a3
{
  id v3 = [a3 value];
  v4 = WFLocalizedMapsAppNameForAppName(v3);

  return v4;
}

- (id)possibleStatesForLocalization
{
  id v2 = WFMapsAppNamesByIdentifier();
  id v3 = [v2 allValues];
  v4 = objc_msgSend(v3, "if_compactMap:", &__block_literal_global_237);

  return v4;
}

id __57__WFMapsAppPickerParameter_possibleStatesForLocalization__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (objc_class *)MEMORY[0x263F86F00];
  id v3 = a2;
  v4 = (void *)[[v2 alloc] initWithValue:v3];

  return v4;
}

- (void)dealloc
{
  [(WFMapsAppPickerParameter *)self removeObservers];
  v3.receiver = self;
  v3.super_class = (Class)WFMapsAppPickerParameter;
  [(WFMapsAppPickerParameter *)&v3 dealloc];
}

- (void)wasRemovedFromWorkflow
{
  v3.receiver = self;
  v3.super_class = (Class)WFMapsAppPickerParameter;
  [(WFMapsAppPickerParameter *)&v3 wasRemovedFromWorkflow];
  [(WFMapsAppPickerParameter *)self removeObservers];
}

- (void)wasAddedToWorkflow
{
  v3.receiver = self;
  v3.super_class = (Class)WFMapsAppPickerParameter;
  [(WFMapsAppPickerParameter *)&v3 wasAddedToWorkflow];
  [(WFMapsAppPickerParameter *)self refreshInstalledApps];
  [(WFMapsAppPickerParameter *)self addObservers];
}

- (WFMapsAppPickerParameter)initWithDefinition:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)WFMapsAppPickerParameter;
  id v5 = [(WFMapsAppPickerParameter *)&v19 initWithDefinition:v4];
  if (v5)
  {
    v6 = [v4 objectForKey:@"SupportedApps"];
    uint64_t v7 = objc_opt_class();
    id v8 = v6;
    if (v8 && (objc_opt_isKindOfClass() & 1) == 0)
    {
      v10 = getWFGeneralLogObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        v11 = objc_opt_class();
        *(_DWORD *)buf = 136315906;
        v21 = "WFEnforceClass";
        __int16 v22 = 2114;
        id v23 = v8;
        __int16 v24 = 2114;
        v25 = v11;
        __int16 v26 = 2114;
        uint64_t v27 = v7;
        id v12 = v11;
        _os_log_impl(&dword_23C364000, v10, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", buf, 0x2Au);
      }
      id v9 = 0;
    }
    else
    {
      id v9 = v8;
    }

    v13 = (void *)MEMORY[0x263EFF9D8];
    v14 = objc_msgSend(v9, "if_compactMap:", &__block_literal_global_4399);
    uint64_t v15 = [v13 orderedSetWithArray:v14];
    supportedAppIdentifiers = v5->_supportedAppIdentifiers;
    v5->_supportedAppIdentifiers = (NSOrderedSet *)v15;

    v17 = v5;
  }

  return v5;
}

id __47__WFMapsAppPickerParameter_initWithDefinition___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_super v3 = WFMapsAppNamesByIdentifier();
  id v4 = [v3 allKeysForObject:v2];

  id v5 = [v4 firstObject];

  return v5;
}

@end