@interface INGetIntentParameterDefaultValueForwardingAction
+ (BOOL)supportsSecureCoding;
+ (Class)responseClass;
- (BOOL)executeRemotelyWithVendorRemote:(id)a3 completionHandler:(id)a4;
- (INGetIntentParameterDefaultValueForwardingAction)initWithCoder:(id)a3;
- (INGetIntentParameterDefaultValueForwardingAction)initWithIntent:(id)a3 parameterName:(id)a4;
- (NSString)parameterName;
- (id)_completionHandlerWithActionCompletionHandler:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)executeLocallyWithIntentDeliverer:(id)a3 completionHandler:(id)a4;
@end

@implementation INGetIntentParameterDefaultValueForwardingAction

- (void).cxx_destruct
{
}

- (NSString)parameterName
{
  return self->_parameterName;
}

- (id)_completionHandlerWithActionCompletionHandler:(id)a3
{
  id v3 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __98__INGetIntentParameterDefaultValueForwardingAction__completionHandlerWithActionCompletionHandler___block_invoke;
  v7[3] = &unk_1E551F888;
  id v8 = v3;
  id v4 = v3;
  v5 = (void *)MEMORY[0x192F984C0](v7);

  return v5;
}

void __98__INGetIntentParameterDefaultValueForwardingAction__completionHandlerWithActionCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  v7 = [[INGetIntentParameterDefaultValueForwardingActionResponse alloc] initWithArchivedDefaultValue:v6 error:v5];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (INGetIntentParameterDefaultValueForwardingAction)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"intent"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"parameterName"];

  v7 = [(INGetIntentParameterDefaultValueForwardingAction *)self initWithIntent:v5 parameterName:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)INGetIntentParameterDefaultValueForwardingAction;
  id v4 = a3;
  [(INIntentForwardingAction *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_parameterName, @"parameterName", v5.receiver, v5.super_class);
}

- (void)executeLocallyWithIntentDeliverer:(id)a3 completionHandler:(id)a4
{
  parameterName = self->_parameterName;
  id v7 = a4;
  id v8 = a3;
  id v10 = [(INIntentForwardingAction *)self intent];
  v9 = [(INGetIntentParameterDefaultValueForwardingAction *)self _completionHandlerWithActionCompletionHandler:v7];

  [v8 getIntentParameterDefaultValue:parameterName forIntent:v10 completionBlock:v9];
}

- (BOOL)executeRemotelyWithVendorRemote:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)INGetIntentParameterDefaultValueForwardingAction;
  if (![(INIntentForwardingAction *)&v13 executeRemotelyWithVendorRemote:v6 completionHandler:v7])
  {
    id v8 = [(INIntentForwardingAction *)self intent];
    v9 = INIntentWithTypedIntent(v8);

    parameterName = self->_parameterName;
    v11 = [(INGetIntentParameterDefaultValueForwardingAction *)self _completionHandlerWithActionCompletionHandler:v7];
    [v6 getIntentParameterDefaultValue:parameterName forIntent:v9 completionBlock:v11];
  }
  return 1;
}

- (INGetIntentParameterDefaultValueForwardingAction)initWithIntent:(id)a3 parameterName:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)INGetIntentParameterDefaultValueForwardingAction;
  id v7 = [(INIntentForwardingAction *)&v11 initWithIntent:a3];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    parameterName = v7->_parameterName;
    v7->_parameterName = (NSString *)v8;
  }
  return v7;
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