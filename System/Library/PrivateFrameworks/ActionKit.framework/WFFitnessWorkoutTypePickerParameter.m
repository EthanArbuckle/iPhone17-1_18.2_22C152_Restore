@interface WFFitnessWorkoutTypePickerParameter
- (Class)singleStateClass;
- (WFAction)action;
- (WFFitnessWorkoutTypePickerParameter)initWithDefinition:(id)a3;
- (id)defaultSerializedWorkoutRepresentation;
- (id)enumeration:(id)a3 localizedLabelForPossibleState:(id)a4;
- (id)localizedPlaceholder;
- (void)defaultSerializedRepresentationDidChange;
- (void)loadDefaultSerializedRepresentationForEnumeration:(id)a3 completionHandler:(id)a4;
- (void)loadPossibleStatesForEnumeration:(id)a3 searchTerm:(id)a4 completionHandler:(id)a5;
- (void)saveStateIfNeeded;
- (void)setAction:(id)a3;
- (void)setDefaultSerializedWorkoutRepresentation:(id)a3;
- (void)wasAddedToWorkflow;
- (void)wasRemovedFromWorkflow;
- (void)wf_reloadFromAttributesDidChangeWithCompletionHandler:(id)a3;
@end

@implementation WFFitnessWorkoutTypePickerParameter

- (void).cxx_destruct
{
  objc_storeStrong(&self->_defaultSerializedWorkoutRepresentation, 0);
  objc_destroyWeak((id *)&self->_action);
}

- (void)setDefaultSerializedWorkoutRepresentation:(id)a3
{
}

- (id)defaultSerializedWorkoutRepresentation
{
  return self->_defaultSerializedWorkoutRepresentation;
}

- (WFAction)action
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_action);
  return (WFAction *)WeakRetained;
}

- (void)loadDefaultSerializedRepresentationForEnumeration:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void *, void))a4;
  v8 = [(WFFitnessWorkoutTypePickerParameter *)self defaultSerializedWorkoutRepresentation];

  if (v8)
  {
    v9 = [(WFFitnessWorkoutTypePickerParameter *)self defaultSerializedWorkoutRepresentation];
    v7[2](v7, v9, 0);
  }
  else
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __107__WFFitnessWorkoutTypePickerParameter_loadDefaultSerializedRepresentationForEnumeration_completionHandler___block_invoke;
    v10[3] = &unk_264E59398;
    v10[4] = self;
    v11 = v7;
    [(WFFitnessWorkoutTypePickerParameter *)self loadPossibleStatesForEnumeration:v6 searchTerm:0 completionHandler:v10];
  }
}

void __107__WFFitnessWorkoutTypePickerParameter_loadDefaultSerializedRepresentationForEnumeration_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v4 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = a3;
  id v6 = [v4 defaultSerializedWorkoutRepresentation];
  (*(void (**)(uint64_t, id, id))(v3 + 16))(v3, v6, v5);
}

- (void)loadPossibleStatesForEnumeration:(id)a3 searchTerm:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void *, void))a5;
  v11 = +[WFFitnessUIHelper allActivityTypes];
  v12 = objc_msgSend(v11, "if_map:", &__block_literal_global_23765);
  v13 = v12;
  if (!self->_defaultSerializedWorkoutRepresentation)
  {
    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x2020000000;
    uint64_t v22 = -1;
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __101__WFFitnessWorkoutTypePickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke_2;
    v18[3] = &unk_264E59370;
    v18[4] = &v19;
    [v12 enumerateObjectsUsingBlock:v18];
    if (v20[3]) {
      objc_msgSend(v13, "objectAtIndex:");
    }
    else {
    v14 = [v13 firstObject];
    }
    v15 = [v14 serializedRepresentation];
    id defaultSerializedWorkoutRepresentation = self->_defaultSerializedWorkoutRepresentation;
    self->_id defaultSerializedWorkoutRepresentation = v15;

    _Block_object_dispose(&v19, 8);
  }
  v17 = (void *)[objc_alloc(MEMORY[0x263F0FCB8]) initWithItems:v13];
  v10[2](v10, v17, 0);
}

void __101__WFFitnessWorkoutTypePickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = [a2 value];
  if ([v7 identifier] == 37 && (objc_msgSend(v7, "isIndoor") & 1) == 0)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
    *a4 = 1;
  }
}

WFFIUIWorkoutActivityTypeSubstitutableState *__101__WFFitnessWorkoutTypePickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [(WFVariableSubstitutableParameterState *)[WFFIUIWorkoutActivityTypeSubstitutableState alloc] initWithValue:v2];

  return v3;
}

- (id)enumeration:(id)a3 localizedLabelForPossibleState:(id)a4
{
  v4 = objc_msgSend(a4, "value", a3);
  id v5 = [v4 localizedName];

  return v5;
}

- (void)wf_reloadFromAttributesDidChangeWithCompletionHandler:(id)a3
{
  id v8 = a3;
  v4 = [(WFDynamicEnumerationParameter *)self possibleStates];

  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x263F0FCB8]);
    id v6 = [(WFDynamicEnumerationParameter *)self possibleStates];
    id v7 = (void *)[v5 initWithItems:v6];
    (*((void (**)(id, void *, void, void))v8 + 2))(v8, v7, 0, 0);
  }
}

- (id)localizedPlaceholder
{
  return WFLocalizedString(@"Workout Type");
}

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

- (void)wasRemovedFromWorkflow
{
  v3.receiver = self;
  v3.super_class = (Class)WFFitnessWorkoutTypePickerParameter;
  [(WFFitnessWorkoutTypePickerParameter *)&v3 wasRemovedFromWorkflow];
  if (notify_is_valid_token(self->_characteristicUpdateToken)) {
    notify_cancel(self->_characteristicUpdateToken);
  }
}

- (void)saveStateIfNeeded
{
  objc_super v3 = [(WFFitnessWorkoutTypePickerParameter *)self action];
  v4 = [(WFFitnessWorkoutTypePickerParameter *)self key];
  id v11 = [v3 parameterStateForKey:v4 fallingBackToDefaultValue:0];

  id v5 = v11;
  if (!v11)
  {
    id v6 = [(WFFitnessWorkoutTypePickerParameter *)self action];
    id v7 = [(WFFitnessWorkoutTypePickerParameter *)self key];
    id v8 = [v6 parameterStateForKey:v7 fallingBackToDefaultValue:1];

    id v9 = [(WFFitnessWorkoutTypePickerParameter *)self action];
    v10 = [(WFFitnessWorkoutTypePickerParameter *)self key];
    [v9 setParameterState:v8 forKey:v10];

    id v5 = 0;
  }
}

- (void)defaultSerializedRepresentationDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)WFFitnessWorkoutTypePickerParameter;
  [(WFDynamicEnumerationParameter *)&v3 defaultSerializedRepresentationDidChange];
  [(WFFitnessWorkoutTypePickerParameter *)self saveStateIfNeeded];
}

- (void)wasAddedToWorkflow
{
  v5.receiver = self;
  v5.super_class = (Class)WFFitnessWorkoutTypePickerParameter;
  [(WFFitnessWorkoutTypePickerParameter *)&v5 wasAddedToWorkflow];
  [(WFFitnessWorkoutTypePickerParameter *)self saveStateIfNeeded];
  objc_super v3 = (const char *)*MEMORY[0x263F0ADE8];
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __57__WFFitnessWorkoutTypePickerParameter_wasAddedToWorkflow__block_invoke;
  handler[3] = &unk_264E59328;
  handler[4] = self;
  notify_register_dispatch(v3, &self->_characteristicUpdateToken, MEMORY[0x263EF83A0], handler);
}

uint64_t __57__WFFitnessWorkoutTypePickerParameter_wasAddedToWorkflow__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadPossibleStates];
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

- (WFFitnessWorkoutTypePickerParameter)initWithDefinition:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WFFitnessWorkoutTypePickerParameter;
  objc_super v3 = [(WFFitnessWorkoutTypePickerParameter *)&v7 initWithDefinition:a3];
  v4 = v3;
  if (v3)
  {
    [(WFDynamicEnumerationParameter *)v3 setDataSource:v3];
    id v5 = v4;
  }

  return v4;
}

@end