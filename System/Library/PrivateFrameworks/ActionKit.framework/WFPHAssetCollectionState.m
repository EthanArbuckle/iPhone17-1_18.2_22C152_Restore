@interface WFPHAssetCollectionState
+ (Class)processingValueClass;
+ (id)serializedRepresentationFromValue:(id)a3;
+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5;
- (WFPHAssetCollectionState)initWithCollection:(id)a3;
- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5;
@end

@implementation WFPHAssetCollectionState

- (void)processWithContext:(id)a3 userInputRequiredHandler:(id)a4 valueHandler:(id)a5
{
  id v8 = a3;
  v9 = (void (**)(id, void *, void))a4;
  id v10 = a5;
  v11 = [(WFVariableSubstitutableParameterState *)self variable];

  if (v11)
  {
    v12 = [(WFVariableSubstitutableParameterState *)self variable];
    if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v13 = [v12 prompt];
      v9[2](v9, v13, 0);
    }
    else
    {

      v14 = [(WFVariableSubstitutableParameterState *)self variable];
      uint64_t v15 = objc_opt_class();
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __85__WFPHAssetCollectionState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke;
      v17[3] = &unk_264E5E1E0;
      id v18 = v10;
      [v14 getObjectRepresentationForClass:v15 context:v8 completionHandler:v17];

      v12 = v18;
    }
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)WFPHAssetCollectionState;
    [(WFVariableSubstitutableParameterState *)&v16 processWithContext:v8 userInputRequiredHandler:v9 valueHandler:v10];
  }
}

void __85__WFPHAssetCollectionState_processWithContext_userInputRequiredHandler_valueHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = a2;
  uint64_t v8 = *(void *)(a1 + 32);
  id v12 = v7;
  if (v7)
  {
    id v9 = a5;
    id v10 = [[WFPHAssetCollectionDescriptor alloc] initWithLocalIdentifier:0 localizedTitle:v12];
    (*(void (**)(uint64_t, WFPHAssetCollectionDescriptor *, id))(v8 + 16))(v8, v10, v9);
  }
  else
  {
    v11 = *(void (**)(uint64_t, void, WFPHAssetCollectionDescriptor *))(v8 + 16);
    id v10 = a5;
    v11(v8, 0, v10);
  }
}

- (WFPHAssetCollectionState)initWithCollection:(id)a3
{
  id v4 = a3;
  v5 = [WFPHAssetCollectionDescriptor alloc];
  v6 = [v4 localIdentifier];
  id v7 = [v4 localizedTitle];

  uint64_t v8 = [(WFPHAssetCollectionDescriptor *)v5 initWithLocalIdentifier:v6 localizedTitle:v7];
  id v9 = [(WFVariableSubstitutableParameterState *)self initWithValue:v8];

  return v9;
}

+ (id)valueFromSerializedRepresentation:(id)a3 variableProvider:(id)a4 parameter:(id)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  id v7 = v5;
  if (v7)
  {
    if (objc_opt_isKindOfClass())
    {
      uint64_t v8 = [[WFPHAssetCollectionDescriptor alloc] initWithLocalIdentifier:0 localizedTitle:v7];

      goto LABEL_8;
    }
    id v9 = getWFGeneralLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      int v12 = 136315906;
      v13 = "WFEnforceClass";
      __int16 v14 = 2114;
      id v15 = v7;
      __int16 v16 = 2114;
      id v17 = (id)objc_opt_class();
      __int16 v18 = 2114;
      uint64_t v19 = v6;
      id v10 = v17;
      _os_log_impl(&dword_23C364000, v9, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", (uint8_t *)&v12, 0x2Au);
    }
  }
  uint64_t v8 = 0;
LABEL_8:

  return v8;
}

+ (id)serializedRepresentationFromValue:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v8 = [MEMORY[0x263F08690] currentHandler];
    [v8 handleFailureInMethod:a2, a1, @"WFPHAssetCollectionState.m", 98, @"Invalid parameter not satisfying: %@", @"[value isKindOfClass:[WFPHAssetCollectionDescriptor class]]" object file lineNumber description];
  }
  uint64_t v6 = [v5 localizedTitle];

  return v6;
}

+ (Class)processingValueClass
{
  return (Class)objc_opt_class();
}

@end