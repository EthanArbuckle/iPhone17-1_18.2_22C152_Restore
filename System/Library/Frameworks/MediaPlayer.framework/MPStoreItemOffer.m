@interface MPStoreItemOffer
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (MPStoreItemOffer)initWithCoder:(id)a3;
- (MPStoreItemOffer)initWithLookupDictionary:(id)a3;
- (NSArray)assets;
- (NSDictionary)lookupDictionary;
- (NSNumber)price;
- (NSString)buyParameters;
- (NSString)formattedPrice;
- (NSString)offerType;
- (id)actionTextForType:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MPStoreItemOffer

- (void).cxx_destruct
{
}

- (NSDictionary)lookupDictionary
{
  return self->_lookupDictionary;
}

- (id)actionTextForType:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(NSDictionary *)self->_lookupDictionary objectForKey:@"actionText"];
    if (_NSIsNSDictionary())
    {
      v6 = [v5 objectForKey:v4];
      if (_NSIsNSString())
      {
LABEL_6:

        goto LABEL_8;
      }
    }
    v6 = 0;
    goto LABEL_6;
  }
  v6 = 0;
LABEL_8:

  return v6;
}

- (NSNumber)price
{
  v2 = [(NSDictionary *)self->_lookupDictionary objectForKey:@"price"];
  if ((_NSIsNSNumber() & 1) == 0)
  {

    v2 = 0;
  }

  return (NSNumber *)v2;
}

- (NSString)offerType
{
  v2 = [(NSDictionary *)self->_lookupDictionary objectForKey:@"type"];
  if ((_NSIsNSString() & 1) == 0)
  {

    v2 = 0;
  }

  return (NSString *)v2;
}

- (NSString)formattedPrice
{
  v2 = [(NSDictionary *)self->_lookupDictionary objectForKey:@"priceFormatted"];
  if ((_NSIsNSString() & 1) == 0)
  {

    v2 = 0;
  }

  return (NSString *)v2;
}

- (NSString)buyParameters
{
  v3 = [(NSDictionary *)self->_lookupDictionary objectForKey:@"buyParams"];
  if ((_NSIsNSString() & 1) == 0)
  {
    id v4 = [(NSDictionary *)self->_lookupDictionary objectForKey:@"action-params"];

    if (_NSIsNSString())
    {
      v3 = v4;
    }
    else
    {

      v3 = 0;
    }
  }

  return (NSString *)v3;
}

- (NSArray)assets
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = [(NSDictionary *)self->_lookupDictionary objectForKey:@"assets"];
  if (_NSIsNSArray())
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v3 = v2;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      v6 = 0;
      uint64_t v7 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v3);
          }
          uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
          if (_NSIsNSDictionary())
          {
            v10 = [MPStoreItemOfferAsset alloc];
            v11 = -[MPStoreItemOfferAsset initWithLookupDictionary:](v10, "initWithLookupDictionary:", v9, (void)v13);
            if (v11)
            {
              if (!v6) {
                v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
              }
              [v6 addObject:v11];
            }
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v5);
    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }

  return (NSArray *)v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  if ([v4 allowsKeyedCoding]) {
    [v4 encodeObject:self->_lookupDictionary forKey:@"MPStoreItemOfferLookupDictionary"];
  }
  else {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F28488] format:@"Only keyed archiving is supported."];
  }
}

- (MPStoreItemOffer)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MPStoreItemOffer;
  uint64_t v5 = [(MPStoreItemOffer *)&v10 init];
  if (v5)
  {
    v6 = [v4 decodePropertyListForKey:@"MPStoreItemOfferLookupDictionary"];
    if (_NSIsNSDictionary())
    {
      uint64_t v7 = [v6 copy];
      lookupDictionary = v5->_lookupDictionary;
      v5->_lookupDictionary = (NSDictionary *)v7;
    }
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MPStoreItemOffer *)a3;
  if (v4 == self) {
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v6 = 0;
    goto LABEL_7;
  }
  lookupDictionary = self->_lookupDictionary;
  if (lookupDictionary == v4->_lookupDictionary) {
LABEL_5:
  }
    char v6 = 1;
  else {
    char v6 = -[NSDictionary isEqualToDictionary:](lookupDictionary, "isEqualToDictionary:");
  }
LABEL_7:

  return v6;
}

- (unint64_t)hash
{
  return ~[(NSDictionary *)self->_lookupDictionary hash];
}

- (MPStoreItemOffer)initWithLookupDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPStoreItemOffer;
  uint64_t v5 = [(MPStoreItemOffer *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    lookupDictionary = v5->_lookupDictionary;
    v5->_lookupDictionary = (NSDictionary *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end