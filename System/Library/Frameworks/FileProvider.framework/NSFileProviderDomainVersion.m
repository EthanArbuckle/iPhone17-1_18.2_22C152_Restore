@interface NSFileProviderDomainVersion
+ (BOOL)supportsSecureCoding;
+ (NSFileProviderDomainVersion)domainVersionWithVersion:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (NSComparisonResult)compare:(NSFileProviderDomainVersion *)otherVersion;
- (NSFileProviderDomainVersion)init;
- (NSFileProviderDomainVersion)initWithCoder:(id)a3;
- (NSFileProviderDomainVersion)initWithVersion:(int64_t)a3;
- (NSFileProviderDomainVersion)next;
- (id)description;
- (int64_t)version;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSFileProviderDomainVersion

- (NSFileProviderDomainVersion)init
{
  return [(NSFileProviderDomainVersion *)self initWithVersion:1];
}

- (NSFileProviderDomainVersion)initWithVersion:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NSFileProviderDomainVersion;
  v5 = [(NSFileProviderDomainVersion *)&v8 init];
  if (v5)
  {
    if (!a3)
    {
      v6 = [MEMORY[0x1E4F28B00] currentHandler];
      [v6 handleFailureInMethod:a2 object:v5 file:@"NSFileProviderDomain.m" lineNumber:42 description:@"Never build a NSFileProviderDomainVersion with version 0"];
    }
    v5->_version = a3;
  }
  return v5;
}

+ (NSFileProviderDomainVersion)domainVersionWithVersion:(int64_t)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithVersion:a3];

  return (NSFileProviderDomainVersion *)v3;
}

- (NSFileProviderDomainVersion)next
{
  int64_t version = self->_version;
  if ((unint64_t)(version + 1) > 1) {
    uint64_t v3 = version + 1;
  }
  else {
    uint64_t v3 = 1;
  }
  v4 = [[NSFileProviderDomainVersion alloc] initWithVersion:v3];

  return v4;
}

- (NSComparisonResult)compare:(NSFileProviderDomainVersion *)otherVersion
{
  v4 = otherVersion;
  v5 = v4;
  if (v4)
  {
    if (v4 == self)
    {
      NSComparisonResult v10 = NSOrderedSame;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v12 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v13 = *MEMORY[0x1E4F1C3C8];
        v14 = [NSString stringWithFormat:@"Unable to compare %@ with object of different class: %@", self, v5];
        id v15 = [v12 exceptionWithName:v13 reason:v14 userInfo:0];

        objc_exception_throw(v15);
      }
      int64_t version = self->_version;
      int64_t v7 = v5->_version;
      BOOL v8 = version < v7;
      BOOL v9 = version != v7;
      if (v8) {
        NSComparisonResult v10 = NSOrderedAscending;
      }
      else {
        NSComparisonResult v10 = v9;
      }
    }
  }
  else
  {
    NSComparisonResult v10 = NSOrderedDescending;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (NSFileProviderDomainVersion)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NSFileProviderDomainVersion;
  v5 = [(NSFileProviderDomainVersion *)&v7 init];
  if (v5) {
    v5->_int64_t version = [v4 decodeIntegerForKey:@"_version"];
  }

  return v5;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%ld", self->_version);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->_version == v4[1];

  return v5;
}

- (unint64_t)hash
{
  v2 = [NSNumber numberWithInteger:self->_version];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (int64_t)version
{
  return self->_version;
}

@end