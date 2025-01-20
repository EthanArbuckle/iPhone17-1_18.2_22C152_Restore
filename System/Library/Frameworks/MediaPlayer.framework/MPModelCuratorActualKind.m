@interface MPModelCuratorActualKind
+ (BOOL)supportsSecureCoding;
+ (id)identityKind;
+ (id)kindWithVariants:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (MPModelCuratorActualKind)initWithCoder:(id)a3;
- (id)humanDescription;
- (unint64_t)hash;
- (unint64_t)variants;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MPModelCuratorActualKind

- (unint64_t)variants
{
  return self->_variants;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MPModelCuratorActualKind;
  id v4 = a3;
  [(MPModelKind *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_variants, @"variants", v5.receiver, v5.super_class);
}

- (MPModelCuratorActualKind)initWithCoder:(id)a3
{
  +[MPModelCuratorActualKind kindWithVariants:](MPModelCuratorActualKind, "kindWithVariants:", [a3 decodeIntegerForKey:@"variants"]);
  id v4 = (MPModelCuratorActualKind *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)humanDescription
{
  v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:5];
  id v4 = v3;
  unint64_t variants = self->_variants;
  if (variants)
  {
    [v3 addObject:@"Apple editor"];
    unint64_t variants = self->_variants;
    if ((variants & 2) == 0)
    {
LABEL_3:
      if ((variants & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((variants & 2) == 0)
  {
    goto LABEL_3;
  }
  [v4 addObject:@"editorial genre"];
  unint64_t variants = self->_variants;
  if ((variants & 4) == 0)
  {
LABEL_4:
    if ((variants & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  [v4 addObject:@"radio show"];
  unint64_t variants = self->_variants;
  if ((variants & 8) == 0)
  {
LABEL_5:
    if ((variants & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  [v4 addObject:@"external curator"];
  unint64_t variants = self->_variants;
  if ((variants & 0x10) == 0)
  {
LABEL_6:
    if ((variants & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  [v4 addObject:@"activity"];
  if ((self->_variants & 0x20) != 0) {
LABEL_7:
  }
    [v4 addObject:@"editorial item"];
LABEL_8:
  v6 = NSString;
  v7 = [v4 componentsJoinedByString:@" or "];
  v8 = [v6 stringWithString:v7];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MPModelCuratorActualKind;
  if ([(MPModelKind *)&v7 isEqual:v4]) {
    BOOL v5 = self->_variants == v4[2];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  v5.receiver = self;
  v5.super_class = (Class)MPModelCuratorActualKind;
  unint64_t v3 = [(MPModelKind *)&v5 hash];
  return [(MPModelCuratorActualKind *)self variants] ^ v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)kindWithVariants:(unint64_t)a3
{
  objc_super v5 = objc_msgSend(NSString, "stringWithFormat:", @"Curator:v%lu", a3);
  uint64_t v6 = objc_opt_class();
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __45__MPModelCuratorActualKind_kindWithVariants___block_invoke;
  v9[3] = &__block_descriptor_40_e34_v16__0__MPModelCuratorActualKind_8l;
  v9[4] = a3;
  objc_super v7 = [a1 kindWithModelClass:v6 cacheKey:v5 block:v9];

  return v7;
}

uint64_t __45__MPModelCuratorActualKind_kindWithVariants___block_invoke(uint64_t result, uint64_t a2)
{
  *(void *)(a2 + 16) = *(void *)(result + 32);
  return result;
}

+ (id)identityKind
{
  uint64_t v2 = objc_opt_class();

  return +[MPModelKind kindWithModelClass:v2];
}

@end