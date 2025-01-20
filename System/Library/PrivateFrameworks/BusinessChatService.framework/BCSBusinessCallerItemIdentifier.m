@interface BCSBusinessCallerItemIdentifier
+ (BOOL)supportsSecureCoding;
+ (int64_t)_truncatedHashForPhoneNumber:(id)a3;
- (BCSBusinessCallerItemIdentifier)initWithCoder:(id)a3;
- (BCSBusinessCallerItemIdentifier)initWithPhoneNumber:(id)a3;
- (BCSBusinessCallerItemIdentifier)initWithTruncatedHash:(int64_t)a3;
- (BOOL)matchesItemIdentifying:(id)a3;
- (NSObject)itemIdentifier;
- (NSString)pirKey;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)computedTruncatedHash;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BCSBusinessCallerItemIdentifier

- (BCSBusinessCallerItemIdentifier)initWithPhoneNumber:(id)a3
{
  int64_t v4 = +[BCSBusinessCallerItemIdentifier _truncatedHashForPhoneNumber:a3];

  return [(BCSBusinessCallerItemIdentifier *)self initWithTruncatedHash:v4];
}

- (BCSBusinessCallerItemIdentifier)initWithTruncatedHash:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BCSBusinessCallerItemIdentifier;
  result = [(BCSBusinessCallerItemIdentifier *)&v5 init];
  if (result) {
    result->_computedTruncatedHash = a3;
  }
  return result;
}

- (NSObject)itemIdentifier
{
  v2 = NSNumber;
  int64_t v3 = [(BCSBusinessCallerItemIdentifier *)self truncatedHash];

  return [v2 numberWithLongLong:v3];
}

- (BOOL)matchesItemIdentifying:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(BCSBusinessCallerItemIdentifier *)self type];
  if (v5 == [v4 type])
  {
    int64_t v6 = [(BCSBusinessCallerItemIdentifier *)self truncatedHash];
    BOOL v7 = v6 == [v4 truncatedHash];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (int64_t)type
{
  return 3;
}

- (NSString)pirKey
{
  v2 = objc_msgSend(NSNumber, "numberWithLongLong:", -[BCSBusinessCallerItemIdentifier truncatedHash](self, "truncatedHash"));
  int64_t v3 = [v2 stringValue];

  return (NSString *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4) {
    v4[1] = [(BCSBusinessCallerItemIdentifier *)self computedTruncatedHash];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t v3 = NSNumber;
  int64_t computedTruncatedHash = self->_computedTruncatedHash;
  id v5 = a3;
  id v6 = [v3 numberWithLongLong:computedTruncatedHash];
  [v5 encodeObject:v6 forKey:@"TruncatedHash"];
}

- (BCSBusinessCallerItemIdentifier)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BCSBusinessCallerItemIdentifier;
  id v5 = [(BCSBusinessCallerItemIdentifier *)&v8 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"TruncatedHash"];
    v5->_int64_t computedTruncatedHash = [v6 longLongValue];
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (int64_t)_truncatedHashForPhoneNumber:(id)a3
{
  int64_t v3 = +[BCSPhoneNumberNormalizer normalizedPhoneNumberForPhoneNumber:a3];
  int64_t v4 = +[BCSHashService SHA256TruncatedHashForInputString:v3 includedBytes:8];

  return v4;
}

- (int64_t)computedTruncatedHash
{
  return self->_computedTruncatedHash;
}

@end