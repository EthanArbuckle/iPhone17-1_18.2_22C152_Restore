@interface WFHealthQuantityFieldParameter
- (BOOL)isHidden;
- (HKQuantityType)quantityType;
- (WFAction)action;
- (id)localizedLabelForPossibleUnit:(id)a3 magnitude:(id)a4 style:(unint64_t)a5;
- (id)localizedLabelWithContext:(id)a3;
- (id)localizedPrompt;
- (id)possibleUnits;
- (void)action:(id)a3 parameterStateDidChangeForKey:(id)a4;
- (void)attributesDidChange;
- (void)setAction:(id)a3;
- (void)setPossibleUnits:(id)a3;
- (void)updatePossibleUnits;
- (void)wasAddedToWorkflow;
- (void)wasRemovedFromWorkflow;
@end

@implementation WFHealthQuantityFieldParameter

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_action);
  objc_storeStrong((id *)&self->_quantityType, 0);
  objc_storeStrong((id *)&self->_possibleUnits, 0);
}

- (WFAction)action
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_action);
  return (WFAction *)WeakRetained;
}

- (void)setPossibleUnits:(id)a3
{
}

- (id)possibleUnits
{
  return self->_possibleUnits;
}

- (void)action:(id)a3 parameterStateDidChangeForKey:(id)a4
{
  id v5 = a4;
  v6 = [(WFHealthQuantityFieldParameter *)self definition];
  v7 = [v6 objectForKey:@"QuantityTypeKey"];
  int v8 = [v5 isEqualToString:v7];

  if (v8)
  {
    [(WFHealthQuantityFieldParameter *)self attributesDidChange];
    [(WFHealthQuantityFieldParameter *)self updatePossibleUnits];
  }
}

- (BOOL)isHidden
{
  v2 = [(WFHealthQuantityFieldParameter *)self quantityType];
  BOOL v3 = v2 == 0;

  return v3;
}

- (id)localizedPrompt
{
  v2 = [(WFHealthQuantityFieldParameter *)self quantityType];
  if (objc_opt_respondsToSelector())
  {
    BOOL v3 = objc_msgSend(v2, "hk_localizedName");
  }
  else
  {
    v4 = [v2 identifier];
    BOOL v3 = +[WFHealthKitHelper readableSampleTypeIdentifierFromSampleTypeIdentifier:v4];
  }
  id v5 = NSString;
  v6 = WFLocalizedString(@"What’s the value for %@?");
  v7 = objc_msgSend(v5, "stringWithFormat:", v6, v3);

  return v7;
}

- (id)localizedLabelWithContext:(id)a3
{
  id v4 = a3;
  id v5 = [(WFHealthQuantityFieldParameter *)self quantityType];
  v6 = [v5 identifier];
  if ([v6 isEqualToString:*MEMORY[0x263F09C28]])
  {

LABEL_4:
    v9 = WFLocalizedStringResourceWithKey(@"Systolic", @"Systolic");
    v10 = [v4 localize:v9];

    goto LABEL_6;
  }
  v7 = [v5 identifier];
  int v8 = [v7 isEqualToString:*MEMORY[0x263F09C20]];

  if (v8) {
    goto LABEL_4;
  }
  v12.receiver = self;
  v12.super_class = (Class)WFHealthQuantityFieldParameter;
  v10 = [(WFHealthQuantityFieldParameter *)&v12 localizedLabelWithContext:v4];
LABEL_6:

  return v10;
}

- (void)attributesDidChange
{
  quantityType = self->_quantityType;
  self->_quantityType = 0;

  v4.receiver = self;
  v4.super_class = (Class)WFHealthQuantityFieldParameter;
  [(WFHealthQuantityFieldParameter *)&v4 attributesDidChange];
}

- (id)localizedLabelForPossibleUnit:(id)a3 magnitude:(id)a4 style:(unint64_t)a5
{
  v6 = objc_msgSend(MEMORY[0x263F0A830], "wf_safeUnitFromString:", a3, a4, a5);
  v7 = [(WFHealthQuantityFieldParameter *)self quantityType];
  int v8 = [v7 identifier];
  v9 = +[WFHealthKitHelper localizedDisplayNameForUnit:v6 quantityTypeIdentifier:v8];

  return v9;
}

- (void)updatePossibleUnits
{
  BOOL v3 = [(WFHealthQuantityFieldParameter *)self quantityType];
  objc_super v4 = v3;
  if (v3)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __53__WFHealthQuantityFieldParameter_updatePossibleUnits__block_invoke;
    v6[3] = &unk_264E5E238;
    id v7 = v3;
    int v8 = self;
    +[WFHealthKitHelper validUnitsForQuantityType:v7 completion:v6];
  }
  else
  {
    possibleUnits = self->_possibleUnits;
    self->_possibleUnits = 0;

    [(WFHealthQuantityFieldParameter *)self attributesDidChange];
  }
}

void __53__WFHealthQuantityFieldParameter_updatePossibleUnits__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__WFHealthQuantityFieldParameter_updatePossibleUnits__block_invoke_2;
  block[3] = &unk_264E5E938;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v8 = v4;
  uint64_t v9 = v5;
  id v10 = v3;
  id v6 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __53__WFHealthQuantityFieldParameter_updatePossibleUnits__block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) quantityType];
  LODWORD(v2) = [v2 isEqual:v3];

  if (v2)
  {
    uint64_t v4 = objc_msgSend(*(id *)(a1 + 48), "if_map:", &__block_literal_global_53122);
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = *(void **)(v5 + 184);
    *(void *)(v5 + 184) = v4;

    id v7 = *(void **)(a1 + 40);
    [v7 attributesDidChange];
  }
}

uint64_t __53__WFHealthQuantityFieldParameter_updatePossibleUnits__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 unitString];
}

- (HKQuantityType)quantityType
{
  quantityType = self->_quantityType;
  if (!quantityType)
  {
    uint64_t v4 = [(WFHealthQuantityFieldParameter *)self action];
    uint64_t v5 = [(WFHealthQuantityFieldParameter *)self definition];
    id v6 = [(id)v5 objectForKey:@"QuantityTypeKey"];
    id v7 = [v4 parameterStateForKey:v6];

    id v8 = [v7 value];
    objc_opt_class();
    LOBYTE(v5) = objc_opt_isKindOfClass();

    if (v5)
    {
      uint64_t v9 = [v7 value];
      id v10 = self->_quantityType;
      self->_quantityType = v9;
    }
    quantityType = self->_quantityType;
    if (!quantityType)
    {
      v11 = [(WFHealthQuantityFieldParameter *)self definition];
      objc_super v12 = [v11 objectForKey:@"QuantityType"];

      v13 = +[WFHealthKitHelper sampleTypeIdentifierFromReadableTypeIdentifier:v12];
      v14 = [MEMORY[0x263F0A658] quantityTypeForIdentifier:v13];
      v15 = self->_quantityType;
      self->_quantityType = v14;

      quantityType = self->_quantityType;
    }
  }
  return quantityType;
}

- (void)wasRemovedFromWorkflow
{
  v4.receiver = self;
  v4.super_class = (Class)WFHealthQuantityFieldParameter;
  [(WFHealthQuantityFieldParameter *)&v4 wasRemovedFromWorkflow];
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F0A018] object:0];
}

- (void)wasAddedToWorkflow
{
  v4.receiver = self;
  v4.super_class = (Class)WFHealthQuantityFieldParameter;
  [(WFHealthQuantityFieldParameter *)&v4 wasAddedToWorkflow];
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel_updatePossibleUnits name:*MEMORY[0x263F0A018] object:0];
}

- (void)setAction:(id)a3
{
  p_action = &self->_action;
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_action);
  [WeakRetained removeEventObserver:self];

  id v6 = objc_storeWeak((id *)p_action, obj);
  [obj addEventObserver:self];

  [(WFHealthQuantityFieldParameter *)self attributesDidChange];
  [(WFHealthQuantityFieldParameter *)self updatePossibleUnits];
}

@end