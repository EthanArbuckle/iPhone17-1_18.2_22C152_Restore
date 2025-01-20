@interface BBSectionIcon
+ (BOOL)supportsSecureCoding;
- (BBSectionIcon)initWithCoder:(id)a3;
- (BBSectionIcon)initWithUNCSectionIcon:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSSet)variants;
- (id)_bestVariantForFormat:(int64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)toUNCSectionIcon;
- (unint64_t)hash;
- (void)addVariant:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setVariants:(id)a3;
@end

@implementation BBSectionIcon

- (BOOL)isEqual:(id)a3
{
  v4 = (BBSectionIcon *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      v5 = v4;
      v6 = [(BBSectionIcon *)self variants];
      v7 = [(BBSectionIcon *)v5 variants];

      char v8 = BSEqualObjects();
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (void).cxx_destruct
{
}

- (BBSectionIcon)initWithCoder:(id)a3
{
  v11[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(BBSectionIcon *)self init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    v11[0] = objc_opt_class();
    v11[1] = objc_opt_class();
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];
    char v8 = [v6 setWithArray:v7];
    v9 = [v4 decodeObjectOfClasses:v8 forKey:@"variants"];
    [(BBSectionIcon *)v5 setVariants:v9];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(BBSectionIcon *)self variants];
  [v4 encodeObject:v5 forKey:@"variants"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  id v5 = [(BBSectionIcon *)self variants];
  [v4 setVariants:v5];

  return v4;
}

- (NSSet)variants
{
  return self->_variants;
}

- (void)setVariants:(id)a3
{
}

- (BBSectionIcon)initWithUNCSectionIcon:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4
    && (v20.receiver = self,
        v20.super_class = (Class)BBSectionIcon,
        (self = [(BBSectionIcon *)&v20 init]) != 0))
  {
    id v5 = [MEMORY[0x263EFF9C0] set];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    v6 = objc_msgSend(v4, "variants", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v17;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = [[BBSectionIconVariant alloc] initWithUNCSectionIconVariant:*(void *)(*((void *)&v16 + 1) + 8 * v10)];
          [v5 addObject:v11];

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }
      while (v8);
    }

    v12 = (NSSet *)[v5 copy];
    variants = self->_variants;
    self->_variants = v12;

    self = self;
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)toUNCSectionIcon
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263F842C8]);
  id v4 = [MEMORY[0x263EFF9C0] set];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [(BBSectionIcon *)self variants];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = (void *)[objc_alloc(MEMORY[0x263F842D0]) initWithSectionIconVariant:*(void *)(*((void *)&v12 + 1) + 8 * i)];
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  [v3 setVariants:v4];
  return v3;
}

- (void)addVariant:(id)a3
{
  if (a3)
  {
    id v4 = (void *)MEMORY[0x263EFFA08];
    id v5 = a3;
    uint64_t v6 = [(BBSectionIcon *)self variants];
    id v8 = [v4 setWithSet:v6];

    uint64_t v7 = [v8 setByAddingObject:v5];

    [(BBSectionIcon *)self setVariants:v7];
  }
}

- (id)_bestVariantForFormat:(int64_t)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = [(BBSectionIcon *)self variants];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v15 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * v9);
      if ([v10 format] == a3) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v11 = v10;

    if (v11) {
      goto LABEL_12;
    }
  }
  else
  {
LABEL_9:
  }
  long long v12 = [(BBSectionIcon *)self variants];
  id v11 = [v12 anyObject];

LABEL_12:
  return v11;
}

- (unint64_t)hash
{
  v2 = [(BBSectionIcon *)self variants];
  unint64_t v3 = [v2 hash];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end