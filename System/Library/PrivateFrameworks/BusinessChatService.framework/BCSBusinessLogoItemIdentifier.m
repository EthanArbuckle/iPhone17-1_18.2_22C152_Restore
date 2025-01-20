@interface BCSBusinessLogoItemIdentifier
+ (BOOL)supportsSecureCoding;
- (BCSBusinessLogoItemIdentifier)initWithCoder:(id)a3;
- (BOOL)matchesItemIdentifying:(id)a3;
- (NSObject)itemIdentifier;
- (NSString)pirKey;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)_truncatedHashForString:(id)a3;
- (int64_t)truncatedHash;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)initWithBusinessId:(void *)a1;
- (void)setBusinessId:(id)a3;
- (void)setTruncatedHash:(int64_t)a3;
@end

@implementation BCSBusinessLogoItemIdentifier

- (void)initWithBusinessId:(void *)a1
{
  id v4 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)BCSBusinessLogoItemIdentifier;
    id v5 = objc_msgSendSuper2(&v7, sel_init);
    a1 = v5;
    if (v5)
    {
      objc_storeStrong((id *)v5 + 1, a2);
      a1[2] = [a1 _truncatedHashForString:a1[1]];
    }
  }

  return a1;
}

- (int64_t)_truncatedHashForString:(id)a3
{
  return +[BCSHashService SHA256TruncatedHashForInputString:a3 includedBytes:8];
}

- (NSObject)itemIdentifier
{
  v2 = NSNumber;
  int64_t v3 = [(BCSBusinessLogoItemIdentifier *)self truncatedHash];

  return [v2 numberWithLongLong:v3];
}

- (int64_t)truncatedHash
{
  return self->_truncatedHash;
}

- (int64_t)type
{
  return 4;
}

- (BOOL)matchesItemIdentifying:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 type];
  if (v5 == [(BCSBusinessLogoItemIdentifier *)self type])
  {
    v6 = [v4 itemIdentifier];
    objc_super v7 = [(BCSBusinessLogoItemIdentifier *)self itemIdentifier];
    char v8 = [v6 isEqual:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (NSString)pirKey
{
  if (self) {
    self = (BCSBusinessLogoItemIdentifier *)self->_businessId;
  }
  return (NSString *)self;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    *(void *)(v4 + 16) = [(BCSBusinessLogoItemIdentifier *)self truncatedHash];
    if (self) {
      businessId = self->_businessId;
    }
    else {
      businessId = 0;
    }
    objc_storeStrong((id *)(v4 + 8), businessId);
  }
  return (id)v4;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4 = NSNumber;
  int64_t truncatedHash = self->_truncatedHash;
  id v7 = a3;
  v6 = [v4 numberWithLongLong:truncatedHash];
  [v7 encodeObject:v6 forKey:@"TruncatedHash"];

  [v7 encodeObject:self->_businessId forKey:@"BusinessId"];
}

- (BCSBusinessLogoItemIdentifier)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BCSBusinessLogoItemIdentifier;
  uint64_t v5 = [(BCSBusinessLogoItemIdentifier *)&v10 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"TruncatedHash"];
    v5->_int64_t truncatedHash = [v6 longLongValue];
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"BusinessId"];
    businessId = v5->_businessId;
    v5->_businessId = (NSString *)v7;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setBusinessId:(id)a3
{
}

- (void)setTruncatedHash:(int64_t)a3
{
  self->_int64_t truncatedHash = a3;
}

- (void).cxx_destruct
{
}

@end