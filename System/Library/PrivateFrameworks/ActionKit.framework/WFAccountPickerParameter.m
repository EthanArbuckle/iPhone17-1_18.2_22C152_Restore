@interface WFAccountPickerParameter
- (BOOL)isHidden;
- (Class)accountClass;
- (NSArray)possibleStates;
- (WFAccountPickerParameter)initWithDefinition:(id)a3;
- (id)accountWithName:(id)a3;
- (id)defaultSerializedRepresentation;
- (id)localizedLabelForPossibleState:(id)a3;
- (id)observer;
- (void)dealloc;
- (void)possibleStatesDidChange;
- (void)wasAddedToWorkflow;
@end

@implementation WFAccountPickerParameter

- (void).cxx_destruct
{
  objc_storeStrong(&self->_observer, 0);
  objc_storeStrong((id *)&self->_accountClass, 0);
  objc_storeStrong((id *)&self->_possibleStates, 0);
}

- (id)observer
{
  return self->_observer;
}

- (Class)accountClass
{
  return self->_accountClass;
}

- (id)accountWithName:(id)a3
{
  id v4 = a3;
  v5 = [(objc_class *)[(WFAccountPickerParameter *)self accountClass] accounts];
  v6 = [v5 objectMatchingKey:@"localizedName" value:v4];

  return v6;
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
    id v4 = [(objc_class *)[(WFAccountPickerParameter *)self accountClass] accounts];
    objc_msgSend(v4, "if_compactMap:", &__block_literal_global_7846);
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v6 = self->_possibleStates;
    self->_possibleStates = v5;

    possibleStates = self->_possibleStates;
  }
  return possibleStates;
}

id __42__WFAccountPickerParameter_possibleStates__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 localizedName];
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F86F00]);
    v5 = [v2 localizedName];
    v6 = (void *)[v4 initWithValue:v5];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)defaultSerializedRepresentation
{
  id v2 = [(objc_class *)[(WFAccountPickerParameter *)self accountClass] accounts];
  v3 = [v2 firstObject];
  id v4 = [v3 localizedName];

  if (v4)
  {
    v5 = [MEMORY[0x263F86F00] serializedRepresentationFromValue:v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isHidden
{
  return (unint64_t)[(objc_class *)[(WFAccountPickerParameter *)self accountClass] numberOfAccounts] < 2;
}

- (void)possibleStatesDidChange
{
  possibleStates = self->_possibleStates;
  self->_possibleStates = 0;

  [(WFAccountPickerParameter *)self defaultSerializedRepresentationDidChange];
  v4.receiver = self;
  v4.super_class = (Class)WFAccountPickerParameter;
  [(WFAccountPickerParameter *)&v4 possibleStatesDidChange];
}

- (void)wasAddedToWorkflow
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v12.receiver = self;
  v12.super_class = (Class)WFAccountPickerParameter;
  [(WFAccountPickerParameter *)&v12 wasAddedToWorkflow];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  v3 = [(objc_class *)[(WFAccountPickerParameter *)self accountClass] accounts];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) refreshWithCompletionHandler:0];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)dealloc
{
  v3 = [(WFAccountPickerParameter *)self accountClass];
  uint64_t v4 = [(WFAccountPickerParameter *)self observer];
  [(objc_class *)v3 removeAccountObserver:v4];

  v5.receiver = self;
  v5.super_class = (Class)WFAccountPickerParameter;
  [(WFAccountPickerParameter *)&v5 dealloc];
}

- (WFAccountPickerParameter)initWithDefinition:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)WFAccountPickerParameter;
  objc_super v5 = [(WFAccountPickerParameter *)&v22 initWithDefinition:v4];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKey:@"AccountClass"];
    uint64_t v7 = objc_opt_class();
    id v8 = v6;
    if (v8 && (objc_opt_isKindOfClass() & 1) == 0)
    {
      long long v10 = getWFGeneralLogObject();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        long long v11 = objc_opt_class();
        *(_DWORD *)buf = 136315906;
        v24 = "WFEnforceClass";
        __int16 v25 = 2114;
        id v26 = v8;
        __int16 v27 = 2114;
        v28 = v11;
        __int16 v29 = 2114;
        uint64_t v30 = v7;
        id v12 = v11;
        _os_log_impl(&dword_23C364000, v10, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", buf, 0x2Au);
      }
      long long v9 = 0;
    }
    else
    {
      long long v9 = (NSString *)v8;
    }

    uint64_t v13 = NSClassFromString(v9);
    Class accountClass = v5->_accountClass;
    v5->_Class accountClass = (Class)v13;

    objc_initWeak((id *)buf, v5);
    Class v15 = v5->_accountClass;
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __47__WFAccountPickerParameter_initWithDefinition___block_invoke;
    v20[3] = &unk_264E5B950;
    objc_copyWeak(&v21, (id *)buf);
    uint64_t v16 = [(objc_class *)v15 addAccountObserver:v20];
    id observer = v5->_observer;
    v5->_id observer = (id)v16;

    v18 = v5;
    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)buf);
  }

  return v5;
}

void __47__WFAccountPickerParameter_initWithDefinition___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained possibleStatesDidChange];
}

@end