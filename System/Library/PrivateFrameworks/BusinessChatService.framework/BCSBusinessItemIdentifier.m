@interface BCSBusinessItemIdentifier
+ (BCSBusinessItemIdentifier)identifierWithBusinessItem:(uint64_t)a1;
+ (BCSBusinessItemIdentifier)identifierWithPhoneNumber:(uint64_t)a1;
- (BOOL)matchesItemIdentifying:(id)a3;
- (NSObject)itemIdentifier;
- (NSString)debugDescription;
- (NSString)description;
- (id)succinctDescriptionBuilder;
- (int64_t)truncatedHash;
- (int64_t)type;
@end

@implementation BCSBusinessItemIdentifier

+ (BCSBusinessItemIdentifier)identifierWithPhoneNumber:(uint64_t)a1
{
  id v2 = a2;
  self;
  v3 = [BCSBusinessItemIdentifier alloc];
  id v4 = v2;
  if (v3)
  {
    v8.receiver = v3;
    v8.super_class = (Class)BCSBusinessItemIdentifier;
    v3 = (BCSBusinessItemIdentifier *)objc_msgSendSuper2(&v8, sel_init);
    if (v3)
    {
      v5 = +[BCSPhoneNumberNormalizer normalizedPhoneNumberForPhoneNumber:v4];
      int64_t v6 = +[BCSHashService SHA256TruncatedHashForInputString:v5 includedBytes:8];

      v3->_computedTruncatedHash = v6;
    }
  }

  return v3;
}

+ (BCSBusinessItemIdentifier)identifierWithBusinessItem:(uint64_t)a1
{
  id v2 = a2;
  self;
  v3 = [BCSBusinessItemIdentifier alloc];
  id v4 = v2;
  if (v3)
  {
    v6.receiver = v3;
    v6.super_class = (Class)BCSBusinessItemIdentifier;
    v3 = (BCSBusinessItemIdentifier *)objc_msgSendSuper2(&v6, sel_init);
    if (v3) {
      v3->_computedTruncatedHash = [v4 phoneHash];
    }
  }

  return v3;
}

- (NSString)description
{
  if (self)
  {
    id v2 = -[BCSBusinessItemIdentifier succinctDescriptionBuilder](self);
    v3 = [v2 build];
  }
  else
  {
    v3 = 0;
  }

  return (NSString *)v3;
}

- (NSString)debugDescription
{
  id v2 = self;
  if (self)
  {
    v3 = -[BCSBusinessItemIdentifier succinctDescriptionBuilder](self);
    id v4 = (id)objc_msgSend(v3, "appendInt64:withName:", objc_msgSend(v2, "truncatedHash"), @"truncatedHash");
    id v2 = [v3 build];
  }

  return (NSString *)v2;
}

- (NSObject)itemIdentifier
{
  id v2 = NSNumber;
  int64_t v3 = [(BCSBusinessItemIdentifier *)self truncatedHash];

  return [v2 numberWithLongLong:v3];
}

- (int64_t)truncatedHash
{
  if (self) {
    return *(void *)(self + 8);
  }
  return self;
}

- (int64_t)type
{
  return 1;
}

- (BOOL)matchesItemIdentifying:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 type];
  if (v5 == [(BCSBusinessItemIdentifier *)self type])
  {
    objc_super v6 = [v4 itemIdentifier];
    v7 = [(BCSBusinessItemIdentifier *)self itemIdentifier];
    char v8 = [v6 isEqual:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)succinctDescriptionBuilder
{
  id v2 = [MEMORY[0x263F29C40] builderWithObject:a1];
  int64_t v3 = [a1 itemIdentifier];
  id v4 = (id)[v2 appendObject:v3 withName:@"itemIdentifier"];

  return v2;
}

@end