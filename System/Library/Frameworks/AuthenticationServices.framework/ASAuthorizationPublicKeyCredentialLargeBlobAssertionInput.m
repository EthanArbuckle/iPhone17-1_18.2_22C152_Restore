@interface ASAuthorizationPublicKeyCredentialLargeBlobAssertionInput
+ (BOOL)supportsSecureCoding;
- (ASAuthorizationPublicKeyCredentialLargeBlobAssertionInput)initWithCoder:(id)a3;
- (ASAuthorizationPublicKeyCredentialLargeBlobAssertionInput)initWithOperation:(ASAuthorizationPublicKeyCredentialLargeBlobAssertionOperation)operation;
- (ASAuthorizationPublicKeyCredentialLargeBlobAssertionOperation)operation;
- (NSData)dataToWrite;
- (id)_initWithOperation:(int64_t)a3 dataToWrite:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setDataToWrite:(NSData *)dataToWrite;
@end

@implementation ASAuthorizationPublicKeyCredentialLargeBlobAssertionInput

- (ASAuthorizationPublicKeyCredentialLargeBlobAssertionInput)initWithOperation:(ASAuthorizationPublicKeyCredentialLargeBlobAssertionOperation)operation
{
  return (ASAuthorizationPublicKeyCredentialLargeBlobAssertionInput *)[(ASAuthorizationPublicKeyCredentialLargeBlobAssertionInput *)self _initWithOperation:operation dataToWrite:0];
}

- (id)_initWithOperation:(int64_t)a3 dataToWrite:(id)a4
{
  id v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ASAuthorizationPublicKeyCredentialLargeBlobAssertionInput;
  v7 = [(ASAuthorizationPublicKeyCredentialLargeBlobAssertionInput *)&v13 init];
  v8 = v7;
  if (v7)
  {
    v7->_operation = a3;
    uint64_t v9 = [v6 copy];
    dataToWrite = v8->_dataToWrite;
    v8->_dataToWrite = (NSData *)v9;

    v11 = v8;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[ASAuthorizationPublicKeyCredentialLargeBlobAssertionInput allocWithZone:a3];
  int64_t operation = self->_operation;
  dataToWrite = self->_dataToWrite;

  return [(ASAuthorizationPublicKeyCredentialLargeBlobAssertionInput *)v4 _initWithOperation:operation dataToWrite:dataToWrite];
}

- (void)encodeWithCoder:(id)a3
{
  int64_t operation = self->_operation;
  id v5 = a3;
  [v5 encodeInteger:operation forKey:@"operation"];
  [v5 encodeObject:self->_dataToWrite forKey:@"dataToWrite"];
}

- (ASAuthorizationPublicKeyCredentialLargeBlobAssertionInput)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"operation"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dataToWrite"];

  v7 = [(ASAuthorizationPublicKeyCredentialLargeBlobAssertionInput *)self _initWithOperation:v5 dataToWrite:v6];
  return v7;
}

- (ASAuthorizationPublicKeyCredentialLargeBlobAssertionOperation)operation
{
  return self->_operation;
}

- (NSData)dataToWrite
{
  return self->_dataToWrite;
}

- (void)setDataToWrite:(NSData *)dataToWrite
{
}

- (void).cxx_destruct
{
}

@end