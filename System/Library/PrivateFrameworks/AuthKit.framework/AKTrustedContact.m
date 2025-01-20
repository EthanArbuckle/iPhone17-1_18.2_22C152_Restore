@interface AKTrustedContact
+ (BOOL)supportsSecureCoding;
- (AKTrustedContact)initWithCoder:(id)a3;
- (AKTrustedContact)initWithUUID:(id)a3 status:(int64_t)a4;
- (NSString)hashedWrappingKeyRKC;
- (NSUUID)uuid;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)status;
- (void)encodeWithCoder:(id)a3;
- (void)setHashedWrappingKeyRKC:(id)a3;
- (void)setStatus:(int64_t)a3;
- (void)setUuid:(id)a3;
@end

@implementation AKTrustedContact

- (AKTrustedContact)initWithUUID:(id)a3 status:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AKTrustedContact;
  v8 = [(AKTrustedContact *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_uuid, a3);
    v9->_status = a4;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [AKTrustedContact alloc];
  v5 = (void *)[(NSUUID *)self->_uuid copy];
  v6 = [(AKTrustedContact *)v4 initWithUUID:v5 status:self->_status];

  uint64_t v7 = [(NSString *)self->_hashedWrappingKeyRKC copy];
  hashedWrappingKeyRKC = v6->_hashedWrappingKeyRKC;
  v6->_hashedWrappingKeyRKC = (NSString *)v7;

  return v6;
}

- (AKTrustedContact)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_uuid"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"_status"];
  if (v5) {
    self = [(AKTrustedContact *)self initWithUUID:v5 status:v6];
  }
  if (self)
  {
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_hashedWrappingKeyRKC"];
    hashedWrappingKeyRKC = self->_hashedWrappingKeyRKC;
    self->_hashedWrappingKeyRKC = v7;
  }
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  uuid = self->_uuid;
  id v5 = a3;
  [v5 encodeObject:uuid forKey:@"_uuid"];
  [v5 encodeInteger:self->_status forKey:@"_status"];
  [v5 encodeObject:self->_hashedWrappingKeyRKC forKey:@"_hashedWrappingKeyRKC"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (NSString)hashedWrappingKeyRKC
{
  return self->_hashedWrappingKeyRKC;
}

- (void)setHashedWrappingKeyRKC:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hashedWrappingKeyRKC, 0);

  objc_storeStrong((id *)&self->_uuid, 0);
}

@end