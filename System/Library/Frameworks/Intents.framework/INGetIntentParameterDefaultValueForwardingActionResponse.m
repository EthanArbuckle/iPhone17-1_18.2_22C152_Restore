@interface INGetIntentParameterDefaultValueForwardingActionResponse
+ (BOOL)supportsSecureCoding;
- (INGetIntentParameterDefaultValueForwardingActionResponse)initWithArchivedDefaultValue:(id)a3 error:(id)a4;
- (INGetIntentParameterDefaultValueForwardingActionResponse)initWithCoder:(id)a3;
- (NSData)archivedDefaultValue;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INGetIntentParameterDefaultValueForwardingActionResponse

- (void).cxx_destruct
{
}

- (NSData)archivedDefaultValue
{
  return self->_archivedDefaultValue;
}

- (INGetIntentParameterDefaultValueForwardingActionResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"archivedDefaultValue"];
  v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  v13 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, v11, v12, objc_opt_class(), 0);
  v14 = [v4 decodeObjectOfClasses:v13 forKey:@"error"];

  v15 = [(INGetIntentParameterDefaultValueForwardingActionResponse *)self initWithArchivedDefaultValue:v5 error:v14];
  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)INGetIntentParameterDefaultValueForwardingActionResponse;
  id v4 = a3;
  [(INIntentForwardingActionResponse *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_archivedDefaultValue, @"archivedDefaultValue", v5.receiver, v5.super_class);
}

- (INGetIntentParameterDefaultValueForwardingActionResponse)initWithArchivedDefaultValue:(id)a3 error:(id)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)INGetIntentParameterDefaultValueForwardingActionResponse;
  uint64_t v8 = [(INIntentForwardingActionResponse *)&v11 initWithError:a4];
  uint64_t v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_archivedDefaultValue, a3);
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end