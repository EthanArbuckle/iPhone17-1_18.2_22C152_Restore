@interface CTLazuliOperationID
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCTLazuliOperationID:(id)a3;
- (CTLazuliOperationID)initWithCoder:(id)a3;
- (CTLazuliOperationID)initWithReflection:(const void *)a3;
- (NSString)uuid;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation CTLazuliOperationID

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@", objc_opt_class()];
  v4 = [(CTLazuliOperationID *)self uuid];
  [v3 appendFormat:@", uuid = %@", v4];

  [v3 appendString:@">"];

  return v3;
}

- (BOOL)isEqualToCTLazuliOperationID:(id)a3
{
  id v4 = a3;
  v5 = [(CTLazuliOperationID *)self uuid];
  v6 = [v4 uuid];
  char v7 = [v5 isEqualToString:v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CTLazuliOperationID *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(CTLazuliOperationID *)self isEqualToCTLazuliOperationID:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[CTLazuliOperationID allocWithZone:a3];
  [(CTLazuliOperationID *)v4 setUuid:self->_uuid];
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
}

- (CTLazuliOperationID)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTLazuliOperationID;
  v5 = [(CTLazuliOperationID *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kUuidKey"];
    uuid = v5->_uuid;
    v5->_uuid = (NSString *)v6;
  }
  return v5;
}

- (CTLazuliOperationID)initWithReflection:(const void *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CTLazuliOperationID;
  id v4 = [(CTLazuliOperationID *)&v9 init];
  if (v4)
  {
    if (*((char *)a3 + 23) >= 0) {
      v5 = a3;
    }
    else {
      v5 = *(const void **)a3;
    }
    uint64_t v6 = [NSString stringWithUTF8String:v5];
    uuid = v4->_uuid;
    v4->_uuid = (NSString *)v6;
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (void).cxx_destruct
{
}

@end