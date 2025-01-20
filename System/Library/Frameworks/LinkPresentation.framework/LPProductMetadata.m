@interface LPProductMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (LPProductMetadata)init;
- (LPProductMetadata)initWithCoder:(id)a3;
- (NSArray)prices;
- (NSString)pluralTitle;
- (id)_initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setPluralTitle:(id)a3;
- (void)setPrices:(id)a3;
@end

@implementation LPProductMetadata

- (LPProductMetadata)init
{
  v6.receiver = self;
  v6.super_class = (Class)LPProductMetadata;
  v2 = [(LPProductMetadata *)&v6 init];
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

- (id)_initWithDictionary:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(LPProductMetadata *)self init];
  if (v5)
  {
    uint64_t v6 = stringForKey(v4, @"LPMetadataProductPluralTitle");
    pluralTitle = v5->_pluralTitle;
    v5->_pluralTitle = (NSString *)v6;

    v8 = arrayOfDictionariesForKey(v4, @"LPMetadataProductPrices");
    v9 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v21;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(v10);
          }
          uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 8 * v13);
          v15 = [LPPriceMetadata alloc];
          id v16 = -[LPPriceMetadata _initWithDictionary:](v15, "_initWithDictionary:", v14, (void)v20);
          if (v16) {
            [(NSArray *)v9 addObject:v16];
          }

          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v11);
    }

    prices = v5->_prices;
    v5->_prices = v9;

    v18 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LPProductMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)LPProductMetadata;
  v5 = [(LPProductMetadata *)&v12 init];
  if (v5)
  {
    uint64_t v6 = decodeStringForKey(v4, @"pluralTitle");
    pluralTitle = v5->_pluralTitle;
    v5->_pluralTitle = (NSString *)v6;

    uint64_t v8 = objc_msgSend(v4, "_lp_strictlyDecodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), @"prices");
    prices = v5->_prices;
    v5->_prices = (NSArray *)v8;

    id v10 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_pluralTitle, @"pluralTitle");
  objc_msgSend(v4, "_lp_encodeArrayIfNotEmpty:forKey:", self->_prices, @"prices");
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)LPProductMetadata;
  if ([(LPProductMetadata *)&v8 isEqual:v4])
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = (void **)v4;
      if (objectsAreEqual_0(v6[2], self->_pluralTitle)) {
        char v5 = objectsAreEqual_0(v6[1], self->_prices);
      }
      else {
        char v5 = 0;
      }
    }
    else
    {
      char v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  return [(NSArray *)self->_prices hash];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[LPProductMetadata allocWithZone:a3];
  if (v4)
  {
    char v5 = [(LPProductMetadata *)self pluralTitle];
    [(LPProductMetadata *)v4 setPluralTitle:v5];

    uint64_t v6 = [(LPProductMetadata *)self prices];
    [(LPProductMetadata *)v4 setPrices:v6];

    v7 = v4;
  }

  return v4;
}

- (NSArray)prices
{
  return self->_prices;
}

- (void)setPrices:(id)a3
{
}

- (NSString)pluralTitle
{
  return self->_pluralTitle;
}

- (void)setPluralTitle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pluralTitle, 0);

  objc_storeStrong((id *)&self->_prices, 0);
}

@end