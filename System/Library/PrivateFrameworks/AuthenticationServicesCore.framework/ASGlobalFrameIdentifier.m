@interface ASGlobalFrameIdentifier
+ (BOOL)supportsSecureCoding;
- (ASGlobalFrameIdentifier)initWithCoder:(id)a3;
- (ASGlobalFrameIdentifier)initWithCoreFrameIdentifier:(id)a3;
- (ASGlobalFrameIdentifier)initWithPageID:(id)a3 frameID:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSNumber)webFrameID;
- (NSNumber)webPageID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASGlobalFrameIdentifier

- (ASGlobalFrameIdentifier)initWithPageID:(id)a3 frameID:(id)a4
{
  v6 = (objc_class *)MEMORY[0x263F662B8];
  id v7 = a4;
  id v8 = a3;
  v9 = (void *)[[v6 alloc] initWithPageID:v8 frameID:v7];

  v10 = [(ASGlobalFrameIdentifier *)self initWithCoreFrameIdentifier:v9];
  return v10;
}

- (ASGlobalFrameIdentifier)initWithCoreFrameIdentifier:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ASGlobalFrameIdentifier;
  v6 = [(ASGlobalFrameIdentifier *)&v10 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_coreFrameIdentifier, a3);
    id v8 = v7;
  }

  return v7;
}

- (NSNumber)webPageID
{
  return (NSNumber *)[(WBSGlobalFrameIdentifier *)self->_coreFrameIdentifier webPageID];
}

- (NSNumber)webFrameID
{
  return (NSNumber *)[(WBSGlobalFrameIdentifier *)self->_coreFrameIdentifier webFrameID];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = +[ASGlobalFrameIdentifier allocWithZone:](ASGlobalFrameIdentifier, "allocWithZone:");
  v6 = (void *)[(WBSGlobalFrameIdentifier *)self->_coreFrameIdentifier copyWithZone:a3];
  id v7 = [(ASGlobalFrameIdentifier *)v5 initWithCoreFrameIdentifier:v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v5 = [(WBSGlobalFrameIdentifier *)self->_coreFrameIdentifier isEqual:v4[1]];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  return [(WBSGlobalFrameIdentifier *)self->_coreFrameIdentifier hash];
}

- (id)description
{
  return (id)[(WBSGlobalFrameIdentifier *)self->_coreFrameIdentifier description];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASGlobalFrameIdentifier)initWithCoder:(id)a3
{
  id v4 = a3;
  char v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"coreFrameIdentifierKey"];

  v6 = [(ASGlobalFrameIdentifier *)self initWithCoreFrameIdentifier:v5];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
}

- (void).cxx_destruct
{
}

@end