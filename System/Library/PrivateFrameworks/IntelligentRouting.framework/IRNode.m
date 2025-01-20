@interface IRNode
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLocal;
- (IRNode)initWithCoder:(id)a3;
- (NSString)avOutpuDeviceIdentifier;
- (NSString)idsIdentifier;
- (NSString)name;
- (NSString)rapportIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAvOutpuDeviceIdentifier:(id)a3;
- (void)setIdsIdentifier:(id)a3;
- (void)setIsLocal:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setRapportIdentifier:(id)a3;
@end

@implementation IRNode

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(IRNode);
  uint64_t v5 = [(IRNode *)self avOutpuDeviceIdentifier];
  avOutpuDeviceIdentifier = v4->_avOutpuDeviceIdentifier;
  v4->_avOutpuDeviceIdentifier = (NSString *)v5;

  uint64_t v7 = [(IRNode *)self rapportIdentifier];
  rapportIdentifier = v4->_rapportIdentifier;
  v4->_rapportIdentifier = (NSString *)v7;

  uint64_t v9 = [(IRNode *)self idsIdentifier];
  idsIdentifier = v4->_idsIdentifier;
  v4->_idsIdentifier = (NSString *)v9;

  uint64_t v11 = [(IRNode *)self name];
  name = v4->_name;
  v4->_name = (NSString *)v11;

  v4->_isLocal = [(IRNode *)self isLocal];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  avOutpuDeviceIdentifier = self->_avOutpuDeviceIdentifier;
  id v5 = a3;
  [v5 encodeObject:avOutpuDeviceIdentifier forKey:@"avOutpuDeviceIdentifier"];
  [v5 encodeObject:self->_rapportIdentifier forKey:@"rapportIdentifier"];
  [v5 encodeObject:self->_idsIdentifier forKey:@"idsIdentifier"];
  [v5 encodeObject:self->_name forKey:@"name"];
  id v6 = [NSNumber numberWithBool:self->_isLocal];
  [v5 encodeObject:v6 forKey:@"isLocal"];
}

- (IRNode)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)IRNode;
  id v5 = [(IRNode *)&v22 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"avOutpuDeviceIdentifier"];
    uint64_t v7 = self;

    avOutpuDeviceIdentifier = v5->_avOutpuDeviceIdentifier;
    v5->_avOutpuDeviceIdentifier = (NSString *)v7;

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rapportIdentifier"];
    uint64_t v10 = self;

    rapportIdentifier = v5->_rapportIdentifier;
    v5->_rapportIdentifier = (NSString *)v10;

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"idsIdentifier"];
    uint64_t v13 = self;

    idsIdentifier = v5->_idsIdentifier;
    v5->_idsIdentifier = (NSString *)v13;

    v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    uint64_t v16 = self;

    name = v5->_name;
    v5->_name = (NSString *)v16;

    v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isLocal"];
    v19 = v18;
    if (v18)
    {
      char v20 = [(IRNode *)v18 BOOLValue];

      v5->_isLocal = v20;
      v19 = v5;
    }
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x263F089D8]);
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = (void *)[v3 initWithFormat:@"<%@: ", v5];

  [v6 appendFormat:@", name: %@", self->_name];
  [v6 appendFormat:@", avOutpuDeviceIdentifier: %@", self->_avOutpuDeviceIdentifier];
  [v6 appendFormat:@", rapportIdentifier: %@", self->_rapportIdentifier];
  [v6 appendFormat:@", idsIdentifier: %@", self->_idsIdentifier];
  uint64_t v7 = [NSNumber numberWithBool:self->_isLocal];
  [v6 appendFormat:@", isLocal: %@", v7];

  [v6 appendString:@">"];
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = [(IRNode *)self avOutpuDeviceIdentifier];
    uint64_t v7 = [v5 avOutpuDeviceIdentifier];
    if ([v6 isEqual:v7])
    {
    }
    else
    {
      uint64_t v9 = [(IRNode *)self avOutpuDeviceIdentifier];
      uint64_t v10 = [v5 avOutpuDeviceIdentifier];

      if (v9 != v10) {
        goto LABEL_15;
      }
    }
    uint64_t v11 = [(IRNode *)self rapportIdentifier];
    v12 = [v5 rapportIdentifier];
    if ([v11 isEqual:v12])
    {
    }
    else
    {
      uint64_t v13 = [(IRNode *)self rapportIdentifier];
      v14 = [v5 rapportIdentifier];

      if (v13 != v14) {
        goto LABEL_15;
      }
    }
    v15 = [(IRNode *)self idsIdentifier];
    uint64_t v16 = [v5 idsIdentifier];
    if ([v15 isEqual:v16])
    {
    }
    else
    {
      v17 = [(IRNode *)self idsIdentifier];
      v18 = [v5 idsIdentifier];

      if (v17 != v18) {
        goto LABEL_15;
      }
    }
    v19 = [(IRNode *)self name];
    char v20 = [v5 name];
    if ([v19 isEqual:v20])
    {

LABEL_16:
      BOOL v23 = [(IRNode *)self isLocal];
      int v8 = v23 ^ [v5 isLocal] ^ 1;
      goto LABEL_17;
    }
    v21 = [(IRNode *)self name];
    objc_super v22 = [v5 name];

    if (v21 == v22) {
      goto LABEL_16;
    }
LABEL_15:
    LOBYTE(v8) = 0;
LABEL_17:

    goto LABEL_18;
  }
  LOBYTE(v8) = 0;
LABEL_18:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_avOutpuDeviceIdentifier hash];
  NSUInteger v4 = [(NSString *)self->_rapportIdentifier hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_idsIdentifier hash];
  return v4 ^ v5 ^ [(NSString *)self->_name hash] ^ self->_isLocal;
}

- (NSString)avOutpuDeviceIdentifier
{
  return self->_avOutpuDeviceIdentifier;
}

- (void)setAvOutpuDeviceIdentifier:(id)a3
{
}

- (NSString)rapportIdentifier
{
  return self->_rapportIdentifier;
}

- (void)setRapportIdentifier:(id)a3
{
}

- (NSString)idsIdentifier
{
  return self->_idsIdentifier;
}

- (void)setIdsIdentifier:(id)a3
{
}

- (BOOL)isLocal
{
  return self->_isLocal;
}

- (void)setIsLocal:(BOOL)a3
{
  self->_isLocal = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_idsIdentifier, 0);
  objc_storeStrong((id *)&self->_rapportIdentifier, 0);
  objc_storeStrong((id *)&self->_avOutpuDeviceIdentifier, 0);
}

@end