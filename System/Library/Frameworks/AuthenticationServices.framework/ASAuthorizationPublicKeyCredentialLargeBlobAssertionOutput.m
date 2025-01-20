@interface ASAuthorizationPublicKeyCredentialLargeBlobAssertionOutput
+ (BOOL)supportsSecureCoding;
+ (id)_outputWithData:(id)a3 didWrite:(BOOL)a4;
- (ASAuthorizationPublicKeyCredentialLargeBlobAssertionOutput)initWithCoder:(id)a3;
- (BOOL)didWrite;
- (NSData)readData;
- (id)_initWithData:(id)a3 didWrite:(BOOL)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASAuthorizationPublicKeyCredentialLargeBlobAssertionOutput

+ (id)_outputWithData:(id)a3 didWrite:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = (void *)[objc_alloc((Class)a1) _initWithData:v6 didWrite:v4];

  return v7;
}

- (id)_initWithData:(id)a3 didWrite:(BOOL)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ASAuthorizationPublicKeyCredentialLargeBlobAssertionOutput;
  v7 = [(ASAuthorizationPublicKeyCredentialLargeBlobAssertionOutput *)&v12 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    readData = v7->_readData;
    v7->_readData = (NSData *)v8;

    v7->_didWrite = a4;
    v10 = v7;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BOOL v4 = +[ASAuthorizationPublicKeyCredentialLargeBlobAssertionOutput allocWithZone:a3];
  readData = self->_readData;
  BOOL didWrite = self->_didWrite;

  return [(ASAuthorizationPublicKeyCredentialLargeBlobAssertionOutput *)v4 _initWithData:readData didWrite:didWrite];
}

- (void)encodeWithCoder:(id)a3
{
  readData = self->_readData;
  id v5 = a3;
  [v5 encodeObject:readData forKey:@"readData"];
  [v5 encodeBool:self->_didWrite forKey:@"didWrite"];
}

- (ASAuthorizationPublicKeyCredentialLargeBlobAssertionOutput)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"readData"];
  uint64_t v6 = [v4 decodeBoolForKey:@"didWrite"];

  v7 = [(ASAuthorizationPublicKeyCredentialLargeBlobAssertionOutput *)self _initWithData:v5 didWrite:v6];
  return v7;
}

- (NSData)readData
{
  return self->_readData;
}

- (BOOL)didWrite
{
  return self->_didWrite;
}

- (void).cxx_destruct
{
}

@end