@interface ASCPublicKeyCredentialDescriptor
+ (BOOL)supportsSecureCoding;
+ (NSData)magicCredentialID;
+ (NSSet)cableTransports;
- (ASCPublicKeyCredentialDescriptor)initWithCoder:(id)a3;
- (ASCPublicKeyCredentialDescriptor)initWithCredentialID:(id)a3 transports:(id)a4;
- (BOOL)hasCABLETransport;
- (BOOL)hasInternalTransport;
- (BOOL)isEqual:(id)a3;
- (NSArray)transports;
- (NSData)credentialID;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASCPublicKeyCredentialDescriptor

+ (NSSet)cableTransports
{
  return (NSSet *)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"cable", @"hybrid", 0);
}

+ (NSData)magicCredentialID
{
  v2 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:@"QVbUFRZmiAZxElbC0CKP7zL/RGE=" options:0];

  return (NSData *)v2;
}

- (ASCPublicKeyCredentialDescriptor)initWithCredentialID:(id)a3 transports:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)ASCPublicKeyCredentialDescriptor;
  v8 = [(ASCPublicKeyCredentialDescriptor *)&v15 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    credentialID = v8->_credentialID;
    v8->_credentialID = (NSData *)v9;

    uint64_t v11 = [v7 copy];
    transports = v8->_transports;
    v8->_transports = (NSArray *)v11;

    v13 = v8;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(ASCPublicKeyCredentialDescriptor *)self credentialID];
  id v6 = [(ASCPublicKeyCredentialDescriptor *)self transports];
  id v7 = (void *)[v4 initWithCredentialID:v5 transports:v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([(ASCPublicKeyCredentialDescriptor *)self credentialID],
        v5 = objc_claimAutoreleasedReturnValue(),
        [v4 credentialID],
        id v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v5 isEqualToData:v6],
        v6,
        v5,
        v7))
  {
    v8 = [(ASCPublicKeyCredentialDescriptor *)self transports];
    uint64_t v9 = [v4 transports];
    char v10 = WBSIsEqual();
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (BOOL)hasInternalTransport
{
  return [(NSArray *)self->_transports containsObject:@"internal"];
}

- (BOOL)hasCABLETransport
{
  NSUInteger v3 = [(NSArray *)self->_transports count];
  if (v3)
  {
    id v4 = [MEMORY[0x263EFFA08] setWithArray:self->_transports];
    v5 = [(id)objc_opt_class() cableTransports];
    char v6 = [v4 intersectsSet:v5];

    LOBYTE(v3) = v6;
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCPublicKeyCredentialDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"credentialID"];
  char v6 = (void *)MEMORY[0x263EFFA08];
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"transports"];

  char v10 = [(ASCPublicKeyCredentialDescriptor *)self initWithCredentialID:v5 transports:v9];
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(ASCPublicKeyCredentialDescriptor *)self credentialID];
  [v4 encodeObject:v5 forKey:@"credentialID"];

  id v6 = [(ASCPublicKeyCredentialDescriptor *)self transports];
  [v4 encodeObject:v6 forKey:@"transports"];
}

- (NSData)credentialID
{
  return self->_credentialID;
}

- (NSArray)transports
{
  return self->_transports;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transports, 0);

  objc_storeStrong((id *)&self->_credentialID, 0);
}

@end