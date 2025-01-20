@interface BCSBusinessEmailItemIdentifier
+ (BOOL)supportsSecureCoding;
- (BCSBusinessEmailItemIdentifier)initWithCoder:(id)a3;
- (BOOL)hasMatchingTruncatedHash;
- (BOOL)isEqual:(id)a3;
- (BOOL)matchesItemIdentifying:(id)a3;
- (NSArray)truncatedHashes;
- (NSObject)itemIdentifier;
- (NSString)pirKey;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)_truncatedHashForString:(id)a3;
- (int64_t)matchingTruncatedHash;
- (int64_t)truncatedHash;
- (int64_t)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)initWithEmail:(void *)a1;
- (void)initWithEmail:(void *)a1 fullDomain:(void *)a2 topLevelDomain:;
- (void)setEmail:(id)a3;
- (void)setFullDomain:(id)a3;
- (void)setHasMatchingTruncatedHash:(BOOL)a3;
- (void)setMatchingTruncatedHash:(int64_t)a3;
- (void)setTopLevelDomain:(id)a3;
- (void)setTruncatedHash:(int64_t)a3;
- (void)setTruncatedHashes:(id)a3;
@end

@implementation BCSBusinessEmailItemIdentifier

- (void)initWithEmail:(void *)a1
{
  v12[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (a1)
  {
    v11.receiver = a1;
    v11.super_class = (Class)BCSBusinessEmailItemIdentifier;
    a1 = objc_msgSendSuper2(&v11, sel_init);
    if (a1)
    {
      uint64_t v4 = [v3 lowercaseString];
      v5 = (void *)a1[3];
      a1[3] = v4;

      uint64_t v6 = [a1 _truncatedHashForString:a1[3]];
      a1[6] = v6;
      v7 = [NSNumber numberWithLongLong:v6];
      v12[0] = v7;
      uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
      v9 = (void *)a1[7];
      a1[7] = v8;
    }
  }

  return a1;
}

- (void)initWithEmail:(void *)a1 fullDomain:(void *)a2 topLevelDomain:
{
  v14[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (a1)
  {
    v13.receiver = a1;
    v13.super_class = (Class)BCSBusinessEmailItemIdentifier;
    a1 = objc_msgSendSuper2(&v13, sel_init);
    if (a1)
    {
      uint64_t v4 = [v3 lowercaseString];
      v5 = (void *)a1[3];
      a1[3] = v4;

      uint64_t v6 = [a1 _truncatedHashForString:a1[3]];
      a1[6] = v6;
      v7 = (void *)MEMORY[0x263EFF980];
      uint64_t v8 = [NSNumber numberWithLongLong:v6];
      v14[0] = v8;
      v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
      uint64_t v10 = [v7 arrayWithArray:v9];

      objc_super v11 = (void *)a1[7];
      a1[7] = v10;
    }
  }

  return a1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(BCSBusinessEmailItemIdentifier *)self matchesItemIdentifying:v4];

  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_email hash];
  NSUInteger v4 = [(NSString *)self->_fullDomain hash] ^ v3;
  return v4 ^ [(NSString *)self->_topLevelDomain hash];
}

- (int64_t)_truncatedHashForString:(id)a3
{
  return +[BCSHashService SHA256TruncatedHashForInputString:a3 includedBytes:8];
}

- (NSObject)itemIdentifier
{
  v2 = NSNumber;
  int64_t v3 = [(BCSBusinessEmailItemIdentifier *)self truncatedHash];

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
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_10;
  }
  uint64_t v5 = [v4 type];
  if (v5 != [(BCSBusinessEmailItemIdentifier *)self type]) {
    goto LABEL_10;
  }
  uint64_t v6 = [v4 itemIdentifier];
  v7 = [(BCSBusinessEmailItemIdentifier *)self itemIdentifier];
  int v8 = [v6 isEqual:v7];

  if (!v8) {
    goto LABEL_10;
  }
  if (![v4 conformsToProtocol:&unk_26C62ECA0]) {
    goto LABEL_10;
  }
  v9 = [(BCSBusinessEmailItemIdentifier *)self truncatedHashes];

  if (v9)
  {
    uint64_t v10 = [(BCSBusinessEmailItemIdentifier *)self truncatedHashes];
    objc_super v11 = [v4 truncatedHashes];
    int v12 = [v10 isEqualToArray:v11];

    if (!v12) {
      goto LABEL_10;
    }
  }
  objc_super v13 = [v4 truncatedHashes];

  if (!v13
    || ([v4 truncatedHashes],
        v14 = objc_claimAutoreleasedReturnValue(),
        [(BCSBusinessEmailItemIdentifier *)self truncatedHashes],
        v15 = objc_claimAutoreleasedReturnValue(),
        int v16 = [v14 isEqualToArray:v15],
        v15,
        v14,
        v16))
  {
    BOOL v17 = 1;
  }
  else
  {
LABEL_10:
    BOOL v17 = 0;
  }

  return v17;
}

- (void)setMatchingTruncatedHash:(int64_t)a3
{
  self->_matchingTruncatedHash = a3;
  [(BCSBusinessEmailItemIdentifier *)self setHasMatchingTruncatedHash:1];
}

- (NSString)pirKey
{
  if (![(BCSBusinessEmailItemIdentifier *)self hasMatchingTruncatedHash]
    || (!self ? (email = 0) : (email = self->_email),
        int64_t v4 = [(BCSBusinessEmailItemIdentifier *)self _truncatedHashForString:email],
        v4 == [(BCSBusinessEmailItemIdentifier *)self matchingTruncatedHash]))
  {
LABEL_5:
    if (self)
    {
      uint64_t v5 = 24;
LABEL_7:
      uint64_t v6 = *(Class *)((char *)&self->super.isa + v5);
      goto LABEL_8;
    }
    goto LABEL_21;
  }
  if (self) {
    fullDomain = self->_fullDomain;
  }
  else {
    fullDomain = 0;
  }
  int64_t v9 = [(BCSBusinessEmailItemIdentifier *)self _truncatedHashForString:fullDomain];
  if (v9 != [(BCSBusinessEmailItemIdentifier *)self matchingTruncatedHash])
  {
    if (self) {
      topLevelDomain = self->_topLevelDomain;
    }
    else {
      topLevelDomain = 0;
    }
    int64_t v11 = [(BCSBusinessEmailItemIdentifier *)self _truncatedHashForString:topLevelDomain];
    if (v11 == [(BCSBusinessEmailItemIdentifier *)self matchingTruncatedHash])
    {
      if (self)
      {
        uint64_t v5 = 40;
        goto LABEL_7;
      }
      goto LABEL_21;
    }
    goto LABEL_5;
  }
  if (self)
  {
    uint64_t v5 = 32;
    goto LABEL_7;
  }
LABEL_21:
  uint64_t v6 = 0;
LABEL_8:

  return (NSString *)v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    *(void *)(v5 + 48) = [(BCSBusinessEmailItemIdentifier *)self truncatedHash];
    uint64_t v6 = [(BCSBusinessEmailItemIdentifier *)self truncatedHashes];
    uint64_t v7 = [v6 copyWithZone:a3];
    int v8 = *(void **)(v5 + 56);
    *(void *)(v5 + 56) = v7;

    if (self)
    {
      objc_storeStrong((id *)(v5 + 24), self->_email);
      fullDomain = self->_fullDomain;
    }
    else
    {
      int v12 = *(void **)(v5 + 24);
      *(void *)(v5 + 24) = 0;

      fullDomain = 0;
    }
    objc_storeStrong((id *)(v5 + 32), fullDomain);
    if (self) {
      topLevelDomain = self->_topLevelDomain;
    }
    else {
      topLevelDomain = 0;
    }
    objc_storeStrong((id *)(v5 + 40), topLevelDomain);
  }
  return (id)v5;
}

- (void)encodeWithCoder:(id)a3
{
  email = self->_email;
  id v5 = a3;
  [v5 encodeObject:email forKey:@"Email"];
  [v5 encodeObject:self->_fullDomain forKey:@"FullDomain"];
  [v5 encodeObject:self->_topLevelDomain forKey:@"TopLevelDomain"];
}

- (BCSBusinessEmailItemIdentifier)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Email"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FullDomain"];
  uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"TopLevelDomain"];

  int v8 = (BCSBusinessEmailItemIdentifier *)-[BCSBusinessEmailItemIdentifier initWithEmail:fullDomain:topLevelDomain:](self, v5);
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)matchingTruncatedHash
{
  return self->_matchingTruncatedHash;
}

- (void)setEmail:(id)a3
{
}

- (void)setFullDomain:(id)a3
{
}

- (void)setTopLevelDomain:(id)a3
{
}

- (void)setTruncatedHash:(int64_t)a3
{
  self->_truncatedHash = a3;
}

- (NSArray)truncatedHashes
{
  return self->_truncatedHashes;
}

- (void)setTruncatedHashes:(id)a3
{
}

- (BOOL)hasMatchingTruncatedHash
{
  return self->_hasMatchingTruncatedHash;
}

- (void)setHasMatchingTruncatedHash:(BOOL)a3
{
  self->_hasMatchingTruncatedHash = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_truncatedHashes, 0);
  objc_storeStrong((id *)&self->_topLevelDomain, 0);
  objc_storeStrong((id *)&self->_fullDomain, 0);

  objc_storeStrong((id *)&self->_email, 0);
}

@end