@interface INResolveIntentParametersForwardingActionResponse
+ (BOOL)supportsSecureCoding;
- (BOOL)isSuccess;
- (INIntent)updatedIntent;
- (INResolveIntentParametersForwardingActionResponse)initWithCoder:(id)a3;
- (INResolveIntentParametersForwardingActionResponse)initWithSuccess:(BOOL)a3 updatedIntent:(id)a4 parameterResolutionResults:(id)a5 error:(id)a6;
- (NSDictionary)parameterResolutionResults;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INResolveIntentParametersForwardingActionResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameterResolutionResults, 0);

  objc_storeStrong((id *)&self->_updatedIntent, 0);
}

- (NSDictionary)parameterResolutionResults
{
  return self->_parameterResolutionResults;
}

- (INIntent)updatedIntent
{
  return self->_updatedIntent;
}

- (BOOL)isSuccess
{
  return self->_success;
}

- (INResolveIntentParametersForwardingActionResponse)initWithCoder:(id)a3
{
  id v3 = a3;
  unsigned int v21 = [v3 decodeBoolForKey:@"success"];
  v20 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"updatedIntent"];
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v4, "setWithObjects:", v5, v6, objc_opt_class(), 0);
  v8 = [v3 decodeObjectOfClasses:v7 forKey:@"parameterResolutionResults"];
  v9 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  v16 = objc_msgSend(v9, "setWithObjects:", v10, v11, v12, v13, v14, v15, objc_opt_class(), 0);
  v17 = [v3 decodeObjectOfClasses:v16 forKey:@"error"];

  v18 = [(INResolveIntentParametersForwardingActionResponse *)self initWithSuccess:v21 updatedIntent:v20 parameterResolutionResults:v8 error:v17];
  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)INResolveIntentParametersForwardingActionResponse;
  id v4 = a3;
  [(INIntentForwardingActionResponse *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", self->_success, @"success", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_updatedIntent forKey:@"updatedIntent"];
  [v4 encodeObject:self->_parameterResolutionResults forKey:@"parameterResolutionResults"];
}

- (INResolveIntentParametersForwardingActionResponse)initWithSuccess:(BOOL)a3 updatedIntent:(id)a4 parameterResolutionResults:(id)a5 error:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)INResolveIntentParametersForwardingActionResponse;
  uint64_t v13 = [(INIntentForwardingActionResponse *)&v16 initWithError:a6];
  uint64_t v14 = v13;
  if (v13)
  {
    v13->_success = a3;
    objc_storeStrong((id *)&v13->_updatedIntent, a4);
    objc_storeStrong((id *)&v14->_parameterResolutionResults, a5);
  }

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end