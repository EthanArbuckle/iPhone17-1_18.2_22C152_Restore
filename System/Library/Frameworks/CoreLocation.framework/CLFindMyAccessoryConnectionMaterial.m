@interface CLFindMyAccessoryConnectionMaterial
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToMaterial:(id)a3;
- (CLFindMyAccessoryConnectionMaterial)init;
- (CLFindMyAccessoryConnectionMaterial)initWithAddress:(id)a3 ltk:(id)a4;
- (CLFindMyAccessoryConnectionMaterial)initWithAddress:(id)a3 ltk:(id)a4 primaryIndex:(id)a5 secondaryIndex:(id)a6;
- (CLFindMyAccessoryConnectionMaterial)initWithCoder:(id)a3;
- (NSData)address;
- (NSData)ltk;
- (NSNumber)primaryIndex;
- (NSNumber)secondaryIndex;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)dictionaryDescription;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CLFindMyAccessoryConnectionMaterial

- (CLFindMyAccessoryConnectionMaterial)init
{
  return 0;
}

- (CLFindMyAccessoryConnectionMaterial)initWithAddress:(id)a3 ltk:(id)a4
{
  return (CLFindMyAccessoryConnectionMaterial *)MEMORY[0x1F4181798](self, sel_initWithAddress_ltk_primaryIndex_secondaryIndex_);
}

- (CLFindMyAccessoryConnectionMaterial)initWithAddress:(id)a3 ltk:(id)a4 primaryIndex:(id)a5 secondaryIndex:(id)a6
{
  v12.receiver = self;
  v12.super_class = (Class)CLFindMyAccessoryConnectionMaterial;
  v10 = [(CLFindMyAccessoryConnectionMaterial *)&v12 init];
  if (v10)
  {
    v10->_address = (NSData *)[a3 copy];
    v10->_ltk = (NSData *)[a4 copy];
    v10->_primaryIndex = (NSNumber *)[a5 copy];
    v10->_secondaryIndex = (NSNumber *)[a6 copy];
  }
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }

  return MEMORY[0x1F4181798](self, sel_isEqualToMaterial_);
}

- (BOOL)isEqualToMaterial:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLFindMyAccessoryConnectionMaterial.m", 83, @"Invalid parameter not satisfying: %@", @"[otherMaterial isKindOfClass:[CLFindMyAccessoryConnectionMaterial class]]");
  }
  uint64_t v6 = [a3 address];
  v7 = [(CLFindMyAccessoryConnectionMaterial *)self address];
  if (v6) {
    BOOL v8 = -[NSData isEqualToData:](v7, "isEqualToData:", [a3 address]);
  }
  else {
    BOOL v8 = v7 == 0;
  }
  if ([a3 ltk])
  {
    if (v8) {
      BOOL v8 = -[NSData isEqualToData:](-[CLFindMyAccessoryConnectionMaterial ltk](self, "ltk"), "isEqualToData:", [a3 ltk]);
    }
  }
  else if (v8)
  {
    BOOL v8 = [(CLFindMyAccessoryConnectionMaterial *)self ltk] == 0;
  }
  if ([a3 primaryIndex])
  {
    if (v8) {
      BOOL v8 = -[NSNumber isEqualToNumber:](-[CLFindMyAccessoryConnectionMaterial primaryIndex](self, "primaryIndex"), "isEqualToNumber:", [a3 primaryIndex]);
    }
  }
  else if (v8)
  {
    BOOL v8 = [(CLFindMyAccessoryConnectionMaterial *)self primaryIndex] == 0;
  }
  if (![a3 secondaryIndex])
  {
    if (v8) {
      return [(CLFindMyAccessoryConnectionMaterial *)self secondaryIndex] == 0;
    }
    return 0;
  }
  if (!v8) {
    return 0;
  }
  v9 = [(CLFindMyAccessoryConnectionMaterial *)self secondaryIndex];
  uint64_t v10 = [a3 secondaryIndex];

  return [(NSNumber *)v9 isEqualToNumber:v10];
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)[(CLFindMyAccessoryConnectionMaterial *)self address] hash];
  uint64_t v4 = [(NSData *)[(CLFindMyAccessoryConnectionMaterial *)self ltk] hash] ^ v3;
  uint64_t v5 = [(NSNumber *)[(CLFindMyAccessoryConnectionMaterial *)self primaryIndex] hash];
  return v4 ^ v5 ^ [(NSNumber *)[(CLFindMyAccessoryConnectionMaterial *)self secondaryIndex] hash];
}

- (id)debugDescription
{
  return (id)[NSString stringWithFormat:@"CLFindMyAccessoryConnectionMaterial <%p>, PrimaryIndex: %@, SecondaryIndex:%@, Address:%@, LTK:%@", self, -[CLFindMyAccessoryConnectionMaterial primaryIndex](self, "primaryIndex"), -[CLFindMyAccessoryConnectionMaterial secondaryIndex](self, "secondaryIndex"), -[CLFindMyAccessoryConnectionMaterial address](self, "address"), -[CLFindMyAccessoryConnectionMaterial ltk](self, "ltk")];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  id v5 = (id)[(NSData *)self->_address copy];
  id v6 = (id)[(NSData *)self->_ltk copy];
  id v7 = (id)[(NSNumber *)self->_primaryIndex copy];
  id v8 = (id)[(NSNumber *)self->_secondaryIndex copy];

  return (id)MEMORY[0x1F4181798](v4, sel_initWithAddress_ltk_primaryIndex_secondaryIndex_);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLFindMyAccessoryConnectionMaterial)initWithCoder:(id)a3
{
  [a3 decodeObjectOfClass:objc_opt_class() forKey:@"address"];
  [a3 decodeObjectOfClass:objc_opt_class() forKey:@"ltk"];
  [a3 decodeObjectOfClass:objc_opt_class() forKey:@"primaryIndex"];
  [a3 decodeObjectOfClass:objc_opt_class() forKey:@"secondaryIndex"];

  return (CLFindMyAccessoryConnectionMaterial *)MEMORY[0x1F4181798](self, sel_initWithAddress_ltk_primaryIndex_secondaryIndex_);
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->_address forKey:@"address"];
  [a3 encodeObject:self->_ltk forKey:@"ltk"];
  [a3 encodeObject:self->_primaryIndex forKey:@"primaryIndex"];
  secondaryIndex = self->_secondaryIndex;

  [a3 encodeObject:secondaryIndex forKey:@"secondaryIndex"];
}

- (id)dictionaryDescription
{
  uint64_t v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  address = self->_address;
  if ([(NSData *)address length] == 6)
  {
    id v5 = [(NSData *)address bytes];
    uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"%02X:%02X:%02X:%02X:%02X:%02X", *v5, v5[1], v5[2], v5[3], v5[4], v5[5]);
  }
  else
  {
    uint64_t v6 = 0;
  }
  [v3 setObject:v6 forKey:@"address"];
  ltk = self->_ltk;
  if (ltk)
  {
    if ([(NSData *)self->_ltk length] >= 0x10)
    {
      v9 = [(NSData *)ltk bytes];
      uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"%02X %02X %02X %02X %02X %02X %02X %02X %02X %02X %02X %02X %02X %02X %02X %02X", *v9, v9[1], v9[2], v9[3], v9[4], v9[5], v9[6], v9[7], v9[8], v9[9], v9[10], v9[11], v9[12], v9[13], v9[14], v9[15]);
    }
    else
    {
      uint64_t v8 = 0;
    }
    [v3 setObject:v8 forKey:@"ltk"];
  }
  primaryIndex = self->_primaryIndex;
  if (primaryIndex) {
    [v3 setObject:primaryIndex forKey:@"primaryIndex"];
  }
  secondaryIndex = self->_secondaryIndex;
  if (secondaryIndex) {
    [v3 setObject:secondaryIndex forKey:@"secondaryIndex"];
  }
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLFindMyAccessoryConnectionMaterial;
  [(CLFindMyAccessoryConnectionMaterial *)&v3 dealloc];
}

- (NSData)address
{
  return self->_address;
}

- (NSData)ltk
{
  return self->_ltk;
}

- (NSNumber)primaryIndex
{
  return self->_primaryIndex;
}

- (NSNumber)secondaryIndex
{
  return self->_secondaryIndex;
}

@end