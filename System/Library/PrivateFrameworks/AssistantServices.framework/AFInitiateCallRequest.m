@interface AFInitiateCallRequest
+ (BOOL)supportsSecureCoding;
- (AFInitiateCallRequest)initWithCoder:(id)a3;
- (id)_initWithCall:(id)a3;
- (id)call;
- (id)createResponse;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AFInitiateCallRequest

- (void).cxx_destruct
{
}

- (AFInitiateCallRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AFInitiateCallRequest;
  v5 = [(AFSiriRequest *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Call"];
    call = v5->_call;
    v5->_call = (STCall *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AFInitiateCallRequest;
  id v4 = a3;
  [(AFSiriRequest *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_call, @"Call", v5.receiver, v5.super_class);
}

- (id)createResponse
{
  id v2 = [(AFSiriResponse *)[AFSiriRequestSucceededResponse alloc] _initWithRequest:self];
  return v2;
}

- (id)description
{
  v8[1] = *MEMORY[0x1E4F143B8];
  call = self->_call;
  v7 = @"call";
  v8[0] = call;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  objc_super v5 = [(AFSiriRequest *)self _descriptionWithProperties:v4];

  return v5;
}

- (id)call
{
  return self->_call;
}

- (id)_initWithCall:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AFInitiateCallRequest;
  uint64_t v6 = [(AFSiriRequest *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_call, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end