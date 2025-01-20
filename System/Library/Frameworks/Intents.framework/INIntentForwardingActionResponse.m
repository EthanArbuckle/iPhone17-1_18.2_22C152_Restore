@interface INIntentForwardingActionResponse
+ (BOOL)supportsSecureCoding;
- (INIntentForwardingActionResponse)initWithCoder:(id)a3;
- (INIntentForwardingActionResponse)initWithError:(id)a3;
- (NSError)error;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INIntentForwardingActionResponse

- (void).cxx_destruct
{
}

- (NSError)error
{
  return self->_error;
}

- (INIntentForwardingActionResponse)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  v12 = objc_msgSend(v4, "setWithObjects:", v6, v7, v8, v9, v10, v11, objc_opt_class(), 0);
  v13 = [v5 decodeObjectOfClasses:v12 forKey:@"error"];

  v14 = [(INIntentForwardingActionResponse *)self initWithError:v13];
  return v14;
}

- (void)encodeWithCoder:(id)a3
{
}

- (INIntentForwardingActionResponse)initWithError:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)INIntentForwardingActionResponse;
  uint64_t v6 = [(INIntentForwardingActionResponse *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_error, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end