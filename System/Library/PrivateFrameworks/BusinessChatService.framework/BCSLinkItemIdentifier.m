@interface BCSLinkItemIdentifier
+ (BCSLinkItemIdentifier)identifierWithHash:(uint64_t)a1;
+ (id)identifierWithNormalizedURL:(uint64_t)a1;
+ (id)identifierWithURL:(uint64_t)a1;
- (BOOL)matchesItemIdentifying:(id)a3;
- (NSObject)itemIdentifier;
- (NSString)debugDescription;
- (NSString)description;
- (id)_initWithNormalizedURL:(id *)a1;
- (id)succinctDescriptionBuilder;
- (int64_t)_truncatedDomainHashForNormalizedURL:(int64_t)result;
- (int64_t)truncatedHash;
- (int64_t)type;
@end

@implementation BCSLinkItemIdentifier

+ (id)identifierWithURL:(uint64_t)a1
{
  id v2 = a2;
  self;
  v3 = +[BCSURLNormalizer normalizedURLForURL:v2];

  if (v3) {
    v4 = -[BCSLinkItemIdentifier _initWithNormalizedURL:]((id *)[BCSLinkItemIdentifier alloc], v3);
  }
  else {
    v4 = 0;
  }

  return v4;
}

- (id)_initWithNormalizedURL:(id *)a1
{
  id v4 = a2;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)BCSLinkItemIdentifier;
    v5 = (id *)objc_msgSendSuper2(&v12, sel_init);
    a1 = v5;
    if (v5)
    {
      objc_storeStrong(v5 + 2, a2);
      v6 = [a1[2] absoluteString];
      uint64_t v7 = +[BCSHashService SHA256HashForInputString:v6];

      id v8 = a1[1];
      a1[1] = (id)v7;

      v9 = [a1[2] absoluteString];
      int64_t v10 = +[BCSHashService SHA256TruncatedHashForInputString:v9 includedBytes:8];

      a1[4] = (id)v10;
    }
  }

  return a1;
}

+ (id)identifierWithNormalizedURL:(uint64_t)a1
{
  id v2 = a2;
  self;
  v3 = -[BCSLinkItemIdentifier _initWithNormalizedURL:]((id *)[BCSLinkItemIdentifier alloc], v2);

  return v3;
}

+ (BCSLinkItemIdentifier)identifierWithHash:(uint64_t)a1
{
  id v3 = a2;
  self;
  if (+[BCSHashService isValidFullHash:v3])
  {
    id v4 = [BCSLinkItemIdentifier alloc];
    id v5 = v3;
    if (v4)
    {
      v8.receiver = v4;
      v8.super_class = (Class)BCSLinkItemIdentifier;
      v6 = (BCSLinkItemIdentifier *)objc_msgSendSuper2(&v8, sel_init);
      id v4 = v6;
      if (v6)
      {
        objc_storeStrong((id *)&v6->_fullHash, a2);
        v4->_computedTruncatedHash = +[BCSHashService truncatedHashForFullHash:v5 includedBytes:8];
      }
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (NSString)description
{
  if (self)
  {
    id v2 = -[BCSLinkItemIdentifier succinctDescriptionBuilder](self);
    id v3 = [v2 build];
  }
  else
  {
    id v3 = 0;
  }

  return (NSString *)v3;
}

- (NSString)debugDescription
{
  p_isa = (id *)&self->super.isa;
  if (self)
  {
    id v3 = -[BCSLinkItemIdentifier succinctDescriptionBuilder](self);
    id v4 = (id)objc_msgSend(v3, "appendInt64:withName:", objc_msgSend(p_isa, "truncatedHash"), @"truncatedHash");
    id v5 = (void *)[p_isa[1] copy];
    id v6 = (id)[v3 appendObject:v5 withName:@"fullHash"];

    p_isa = [v3 build];
  }

  return p_isa;
}

- (int64_t)_truncatedDomainHashForNormalizedURL:(int64_t)result
{
  if (result)
  {
    id v2 = [a2 host];
    int64_t v3 = +[BCSHashService SHA256TruncatedHashForInputString:v2 includedBytes:8];

    return v3;
  }
  return result;
}

- (NSObject)itemIdentifier
{
  if (self)
  {
    self = (BCSLinkItemIdentifier *)[(NSString *)self->_fullHash copy];
    uint64_t v2 = vars8;
  }
  return self;
}

- (int64_t)truncatedHash
{
  if (self) {
    return *(void *)(self + 32);
  }
  return self;
}

- (int64_t)type
{
  return 2;
}

- (BOOL)matchesItemIdentifying:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 type];
  if (v5 == [(BCSLinkItemIdentifier *)self type])
  {
    id v6 = [v4 itemIdentifier];
    uint64_t v7 = [(BCSLinkItemIdentifier *)self itemIdentifier];
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
  uint64_t v2 = [MEMORY[0x263F29C40] builderWithObject:a1];
  id v3 = (id)[v2 appendObject:a1[2] withName:@"url" skipIfNil:1];
  id v4 = [a1 itemIdentifier];
  id v5 = (id)[v2 appendObject:v4 withName:@"itemIdentifier"];

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);

  objc_storeStrong((id *)&self->_fullHash, 0);
}

@end