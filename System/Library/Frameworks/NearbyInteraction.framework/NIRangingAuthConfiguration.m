@interface NIRangingAuthConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isResponder;
- (NIDiscoveryToken)peerToken;
- (NIRangingAuthConfiguration)initWithCoder:(id)a3;
- (NSData)macAddress;
- (NSData)secureKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)descriptionInternal;
- (id)initAsResponder:(BOOL)a3 macAddress:(id)a4 key:(id)a5;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NIRangingAuthConfiguration

- (id)initAsResponder:(BOOL)a3 macAddress:(id)a4 key:(id)a5
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)NIRangingAuthConfiguration;
  v11 = [(NIConfiguration *)&v19 initInternal];
  v12 = v11;
  if (v11)
  {
    *((unsigned char *)v11 + 32) = a3;
    objc_storeStrong(v11 + 6, a4);
    objc_storeStrong(v12 + 7, a5);
    v20[0] = &unk_1EF5DB920;
    id v13 = v12[6];
    v20[1] = &unk_1EF5DB938;
    v21[0] = v13;
    v21[1] = v12[7];
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
    v15 = (void *)MEMORY[0x1A623D5F0](v14, 8, 0);
    v16 = [[NIDiscoveryToken alloc] initWithBytes:v15];
    id v17 = v12[5];
    v12[5] = v16;
  }
  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)NIRangingAuthConfiguration;
  v4 = [(NIConfiguration *)&v12 copyWithZone:a3];
  v4[32] = self->_isResponder;
  uint64_t v5 = [(NIDiscoveryToken *)self->_peerToken copy];
  v6 = (void *)*((void *)v4 + 5);
  *((void *)v4 + 5) = v5;

  uint64_t v7 = [(NSData *)self->_macAddress copy];
  v8 = (void *)*((void *)v4 + 6);
  *((void *)v4 + 6) = v7;

  uint64_t v9 = [(NSData *)self->_secureKey copy];
  id v10 = (void *)*((void *)v4 + 7);
  *((void *)v4 + 7) = v9;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)NIRangingAuthConfiguration;
  [(NIConfiguration *)&v5 encodeWithCoder:v4];
  [v4 encodeBool:self->_isResponder forKey:@"isResponder"];
  [v4 encodeObject:self->_macAddress forKey:@"macAddress"];
  [v4 encodeObject:self->_secureKey forKey:@"secureKey"];
  [v4 encodeObject:self->_peerToken forKey:@"peerToken"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NIRangingAuthConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NIRangingAuthConfiguration;
  objc_super v5 = [(NIConfiguration *)&v11 initWithCoder:v4];
  if (v5)
  {
    v5->_isResponder = [v4 decodeBoolForKey:@"isResponder"];
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"macAddress"];
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"secureKey"];
    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"peerToken"];
    if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      uint64_t v9 = 0;
    }
    else
    {
      objc_storeStrong((id *)&v5->_macAddress, v6);
      objc_storeStrong((id *)&v5->_secureKey, v7);
      objc_storeStrong((id *)&v5->_peerToken, v8);
      uint64_t v9 = v5;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_super v5 = (NIRangingAuthConfiguration *)v4;
    v6 = v5;
    if (v5 == self)
    {
      char v17 = 1;
    }
    else
    {
      int isResponder = self->_isResponder;
      int v8 = [(NIRangingAuthConfiguration *)v5 isResponder];
      uint64_t v9 = [(NIRangingAuthConfiguration *)v6 macAddress];
      int v10 = [v9 isEqualToData:self->_macAddress];

      objc_super v11 = [(NIRangingAuthConfiguration *)v6 secureKey];
      char v12 = [v11 isEqualToData:self->_secureKey];

      unint64_t peerToken = (unint64_t)v6->_peerToken;
      BOOL v14 = (peerToken | (unint64_t)self->_peerToken) == 0;
      char v15 = objc_msgSend((id)peerToken, "isEqual:");
      if (isResponder == v8) {
        int v16 = v10;
      }
      else {
        int v16 = 0;
      }
      if (v16 == 1) {
        char v17 = v12 & (v14 | v15);
      }
      else {
        char v17 = 0;
      }
    }
  }
  else
  {
    char v17 = 0;
  }

  return v17;
}

- (unint64_t)hash
{
  BOOL isResponder = self->_isResponder;
  uint64_t v4 = [(NSData *)self->_macAddress hash] ^ isResponder;
  uint64_t v5 = [(NSData *)self->_secureKey hash];
  return v4 ^ v5 ^ [(NIDiscoveryToken *)self->_peerToken hash];
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  v6 = [(NIRangingAuthConfiguration *)self descriptionInternal];
  uint64_t v7 = [v3 stringWithFormat:@"<%@: %@>", v5, v6];

  return v7;
}

- (id)descriptionInternal
{
  v2 = NSString;
  if (self->_isResponder) {
    v3 = @"Yes";
  }
  else {
    v3 = @"No";
  }
  uint64_t v4 = [(NIDiscoveryToken *)self->_peerToken descriptionInternal];
  uint64_t v5 = [v2 stringWithFormat:@", isResponder: %@, peerToken: %@", v3, v4];

  return v5;
}

- (BOOL)isResponder
{
  return self->_isResponder;
}

- (NIDiscoveryToken)peerToken
{
  return self->_peerToken;
}

- (NSData)macAddress
{
  return self->_macAddress;
}

- (NSData)secureKey
{
  return self->_secureKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secureKey, 0);
  objc_storeStrong((id *)&self->_macAddress, 0);

  objc_storeStrong((id *)&self->_peerToken, 0);
}

@end