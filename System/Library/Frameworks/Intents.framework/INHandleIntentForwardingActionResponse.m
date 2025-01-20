@interface INHandleIntentForwardingActionResponse
+ (BOOL)supportsSecureCoding;
- (INHandleIntentForwardingActionResponse)initWithCoder:(id)a3;
- (INHandleIntentForwardingActionResponse)initWithIntentResponse:(id)a3 launchContextActivityData:(id)a4 cacheItems:(id)a5 error:(id)a6;
- (INIntentResponse)intentResponse;
- (NSData)launchContextActivityData;
- (NSSet)cacheItems;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INHandleIntentForwardingActionResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheItems, 0);
  objc_storeStrong((id *)&self->_launchContextActivityData, 0);

  objc_storeStrong((id *)&self->_intentResponse, 0);
}

- (NSSet)cacheItems
{
  return self->_cacheItems;
}

- (NSData)launchContextActivityData
{
  return self->_launchContextActivityData;
}

- (INIntentResponse)intentResponse
{
  return self->_intentResponse;
}

- (INHandleIntentForwardingActionResponse)initWithCoder:(id)a3
{
  id v3 = a3;
  v20 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"intentResponse"];
  v19 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"launchContextActivityData"];
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v5 = objc_opt_class();
  v6 = objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0);
  v7 = [v3 decodeObjectOfClasses:v6 forKey:@"cacheItems"];
  v8 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  v15 = objc_msgSend(v8, "setWithObjects:", v9, v10, v11, v12, v13, v14, objc_opt_class(), 0);
  v16 = [v3 decodeObjectOfClasses:v15 forKey:@"error"];

  v17 = [(INHandleIntentForwardingActionResponse *)self initWithIntentResponse:v20 launchContextActivityData:v19 cacheItems:v7 error:v16];
  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)INHandleIntentForwardingActionResponse;
  id v4 = a3;
  [(INIntentForwardingActionResponse *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_intentResponse, @"intentResponse", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_launchContextActivityData forKey:@"launchContextActivityData"];
  [v4 encodeObject:self->_cacheItems forKey:@"cacheItems"];
}

- (INHandleIntentForwardingActionResponse)initWithIntentResponse:(id)a3 launchContextActivityData:(id)a4 cacheItems:(id)a5 error:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)INHandleIntentForwardingActionResponse;
  uint64_t v14 = [(INIntentForwardingActionResponse *)&v17 initWithError:a6];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_intentResponse, a3);
    objc_storeStrong((id *)&v15->_launchContextActivityData, a4);
    objc_storeStrong((id *)&v15->_cacheItems, a5);
  }

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end