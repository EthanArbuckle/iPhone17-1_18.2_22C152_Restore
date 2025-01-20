@interface AFContextResponse
+ (BOOL)supportsSecureCoding;
- (AFContextResponse)initWithCoder:(id)a3;
- (id)_context;
- (id)_initWithRequest:(id)a3 context:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFContextResponse

- (void).cxx_destruct
{
}

- (AFContextResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AFContextResponse;
  v5 = [(AFSiriResponse *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"GetContextResponseContext"];
    context = v5->_context;
    v5->_context = (STSiriContext *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AFContextResponse;
  id v4 = a3;
  [(AFSiriResponse *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_context, @"GetContextResponseContext", v5.receiver, v5.super_class);
}

- (id)_context
{
  return self->_context;
}

- (id)_initWithRequest:(id)a3 context:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)AFContextResponse;
  v8 = [(AFSiriResponse *)&v11 _initWithRequest:a3];
  objc_super v9 = v8;
  if (v8) {
    objc_storeStrong(v8 + 2, a4);
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end