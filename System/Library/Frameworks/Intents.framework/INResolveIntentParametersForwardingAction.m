@interface INResolveIntentParametersForwardingAction
+ (BOOL)supportsSecureCoding;
+ (Class)responseClass;
- (BOOL)executeRemotelyWithVendorRemote:(id)a3 completionHandler:(id)a4;
- (BOOL)resolvesAllParameters;
- (INResolveIntentParametersForwardingAction)initWithCoder:(id)a3;
- (INResolveIntentParametersForwardingAction)initWithIntent:(id)a3 parameterName:(id)a4;
- (INResolveIntentParametersForwardingAction)initWithIntent:(id)a3 parameterNames:(id)a4;
- (NSArray)parameterNames;
- (id)_completionHandlerForMultipleParametersWithActionCompletionHandler:(id)a3;
- (id)_completionHandlerForSingleParameterNamed:(id)a3 withActionCompletionHandler:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)executeLocallyWithIntentDeliverer:(id)a3 completionHandler:(id)a4;
@end

@implementation INResolveIntentParametersForwardingAction

- (void).cxx_destruct
{
}

- (NSArray)parameterNames
{
  return self->_parameterNames;
}

- (BOOL)resolvesAllParameters
{
  return self->_resolvesAllParameters;
}

- (id)_completionHandlerForSingleParameterNamed:(id)a3 withActionCompletionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __115__INResolveIntentParametersForwardingAction__completionHandlerForSingleParameterNamed_withActionCompletionHandler___block_invoke;
  v11[3] = &unk_1E5516968;
  id v12 = v5;
  id v13 = v6;
  id v7 = v6;
  id v8 = v5;
  v9 = (void *)MEMORY[0x192F984C0](v11);

  return v9;
}

void __115__INResolveIntentParametersForwardingAction__completionHandlerForSingleParameterNamed_withActionCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [[INExtensionContextSlotResolutionResult alloc] initWithResult:-1 data:v3];

  id v5 = [INResolveIntentParametersForwardingActionResponse alloc];
  uint64_t v8 = *(void *)(a1 + 32);
  v9[0] = v4;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  id v7 = [(INResolveIntentParametersForwardingActionResponse *)v5 initWithSuccess:1 updatedIntent:0 parameterResolutionResults:v6 error:0];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)_completionHandlerForMultipleParametersWithActionCompletionHandler:(id)a3
{
  id v3 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __112__INResolveIntentParametersForwardingAction__completionHandlerForMultipleParametersWithActionCompletionHandler___block_invoke;
  v7[3] = &unk_1E5516940;
  id v8 = v3;
  id v4 = v3;
  id v5 = (void *)MEMORY[0x192F984C0](v7);

  return v5;
}

void __112__INResolveIntentParametersForwardingAction__completionHandlerForMultipleParametersWithActionCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a4;
  id v8 = a3;
  v9 = [[INResolveIntentParametersForwardingActionResponse alloc] initWithSuccess:a2 updatedIntent:v8 parameterResolutionResults:v7 error:0];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (INResolveIntentParametersForwardingAction)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"intent"];
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  id v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v9 = [v4 decodeObjectOfClasses:v8 forKey:@"parameterNames"];

  v10 = [(INResolveIntentParametersForwardingAction *)self initWithIntent:v5 parameterNames:v9];
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)INResolveIntentParametersForwardingAction;
  id v4 = a3;
  [(INIntentForwardingAction *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_parameterNames, @"parameterNames", v5.receiver, v5.super_class);
}

- (void)executeLocallyWithIntentDeliverer:(id)a3 completionHandler:(id)a4
{
  BOOL resolvesAllParameters = self->_resolvesAllParameters;
  parameterNames = self->_parameterNames;
  id v8 = a4;
  id v9 = a3;
  if (resolvesAllParameters)
  {
    id v12 = [(INIntentForwardingAction *)self intent];
    v10 = [(INResolveIntentParametersForwardingAction *)self _completionHandlerForMultipleParametersWithActionCompletionHandler:v8];

    [v9 resolveIntentParameters:parameterNames forIntent:v12 completionBlock:v10];
  }
  else
  {
    id v12 = [(NSArray *)parameterNames firstObject];
    v10 = [(INIntentForwardingAction *)self intent];
    uint64_t v11 = [(INResolveIntentParametersForwardingAction *)self _completionHandlerForSingleParameterNamed:v12 withActionCompletionHandler:v8];

    [v9 resolveIntentParameter:v12 forIntent:v10 completionBlock:v11];
    id v9 = (id)v11;
  }
}

- (BOOL)executeRemotelyWithVendorRemote:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)INResolveIntentParametersForwardingAction;
  if (![(INIntentForwardingAction *)&v14 executeRemotelyWithVendorRemote:v6 completionHandler:v7])
  {
    id v8 = [(INIntentForwardingAction *)self intent];
    id v9 = INIntentWithTypedIntent(v8);

    parameterNames = self->_parameterNames;
    if (self->_resolvesAllParameters)
    {
      uint64_t v11 = [(INResolveIntentParametersForwardingAction *)self _completionHandlerForMultipleParametersWithActionCompletionHandler:v7];
      [v6 resolveIntentSlots:parameterNames forIntent:v9 completionBlock:v11];
    }
    else
    {
      uint64_t v11 = [(NSArray *)self->_parameterNames firstObject];
      id v12 = [(INResolveIntentParametersForwardingAction *)self _completionHandlerForSingleParameterNamed:v11 withActionCompletionHandler:v7];
      [v6 resolveIntentSlot:v11 forIntent:v9 completionBlock:v12];
    }
  }

  return 1;
}

- (INResolveIntentParametersForwardingAction)initWithIntent:(id)a3 parameterName:(id)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)INResolveIntentParametersForwardingAction;
  id v7 = [(INIntentForwardingAction *)&v11 initWithIntent:a3];
  if (v7)
  {
    v12[0] = v6;
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    parameterNames = v7->_parameterNames;
    v7->_parameterNames = (NSArray *)v8;

    v7->_BOOL resolvesAllParameters = 0;
  }

  return v7;
}

- (INResolveIntentParametersForwardingAction)initWithIntent:(id)a3 parameterNames:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)INResolveIntentParametersForwardingAction;
  uint64_t v8 = [(INIntentForwardingAction *)&v11 initWithIntent:a3];
  id v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_parameterNames, a4);
    v9->_BOOL resolvesAllParameters = 1;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)responseClass
{
  return (Class)objc_opt_class();
}

@end