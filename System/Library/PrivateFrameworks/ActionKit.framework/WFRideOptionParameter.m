@interface WFRideOptionParameter
- (BOOL)parameterStateIsValid:(id)a3;
- (Class)singleStateClass;
- (WFAction)action;
- (void)action:(id)a3 parameterStateDidChangeForKey:(id)a4;
- (void)setAction:(id)a3;
@end

@implementation WFRideOptionParameter

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
  id v5 = a4;
  v6 = [(WFRideOptionParameter *)self definition];
  v7 = [v6 objectForKey:@"PartySizeKey"];
  int v8 = [v5 isEqualToString:v7];

  if (v8)
  {
    [(WFRideOptionParameter *)self stateValidityCriteriaDidChange];
  }
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

- (BOOL)parameterStateIsValid:(id)a3
{
  id v5 = a3;
  id v6 = [(WFDynamicEnumerationParameter *)self possibleStates];
  if (!v6)
  {
    v3 = [(WFDynamicEnumerationParameter *)self possibleStatesLoadingError];
    if (!v3) {
      goto LABEL_9;
    }
  }
  v7 = [v5 value];

  if (!v6)
  {

    if (v7) {
      goto LABEL_5;
    }
LABEL_9:
    char v24 = 1;
    goto LABEL_14;
  }

  if (!v7) {
    goto LABEL_9;
  }
LABEL_5:
  int v8 = (void *)MEMORY[0x263EFFA08];
  v9 = [(WFDynamicEnumerationParameter *)self possibleStates];
  v10 = [v9 valueForKeyPath:@"value.name"];
  v11 = [v8 setWithArray:v10];

  v12 = [v5 value];
  v13 = [v12 name];
  int v14 = [v11 containsObject:v13];

  if (v14)
  {
    v15 = [(WFRideOptionParameter *)self action];
    v16 = [(WFRideOptionParameter *)self definition];
    v17 = [v16 objectForKey:@"PartySizeKey"];
    v18 = [v15 parameterStateForKey:v17];

    v19 = [v18 value];

    if (v19)
    {
      v20 = [v18 value];
      v21 = [v20 number];
      uint64_t v22 = [v21 unsignedIntegerValue];

      v23 = [v5 value];
      char v24 = objc_msgSend(v23, "wf_isAvailableForPartySize:", v22);
    }
    else
    {
      char v24 = 1;
    }
  }
  else
  {
    char v24 = 0;
  }

LABEL_14:
  return v24;
}

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

@end