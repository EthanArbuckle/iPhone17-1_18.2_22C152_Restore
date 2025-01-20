@interface BLTMessageDigest
+ (BOOL)supportsSecureCoding;
- (BLTMessageDigest)initWithCoder:(id)a3;
- (BLTMessageDigest)initWithMessage:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToMessageDigest:(id)a3;
- (NSData)messageDigest;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setMessageDigest:(id)a3;
@end

@implementation BLTMessageDigest

- (BLTMessageDigest)initWithMessage:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BLTMessageDigest;
  v5 = [(BLTMessageDigest *)&v9 init];
  if (v5)
  {
    if (!v4) {
      id v4 = objc_alloc_init(MEMORY[0x263EFF8F8]);
    }
    [v4 MD5:v10];
    uint64_t v6 = [MEMORY[0x263EFF8F8] dataWithBytes:v10 length:16];
    messageDigest = v5->_messageDigest;
    v5->_messageDigest = (NSData *)v6;
  }
  return v5;
}

- (BLTMessageDigest)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BLTMessageDigest;
  v5 = [(BLTMessageDigest *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"messageDigest"];
    messageDigest = v5->_messageDigest;
    v5->_messageDigest = (NSData *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (BOOL)isEqualToMessageDigest:(id)a3
{
  messageDigest = self->_messageDigest;
  id v4 = [a3 messageDigest];
  LOBYTE(messageDigest) = [(NSData *)messageDigest isEqual:v4];

  return (char)messageDigest;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (BLTMessageDigest *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(BLTMessageDigest *)self isEqualToMessageDigest:v4];
  }

  return v5;
}

- (unint64_t)hash
{
  return [(NSData *)self->_messageDigest hash];
}

- (NSData)messageDigest
{
  return self->_messageDigest;
}

- (void)setMessageDigest:(id)a3
{
}

- (void).cxx_destruct
{
}

@end