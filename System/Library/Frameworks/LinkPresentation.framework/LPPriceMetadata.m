@interface LPPriceMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (LPPriceMetadata)init;
- (LPPriceMetadata)initWithCoder:(id)a3;
- (NSString)amount;
- (NSString)currency;
- (id)_initWithDictionary:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAmount:(id)a3;
- (void)setCurrency:(id)a3;
@end

@implementation LPPriceMetadata

- (LPPriceMetadata)init
{
  v6.receiver = self;
  v6.super_class = (Class)LPPriceMetadata;
  v2 = [(LPPriceMetadata *)&v6 init];
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

- (id)_initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [(LPPriceMetadata *)self init];
  if (v5)
  {
    uint64_t v6 = stringForKey(v4, @"LPMetadataPriceAmount");
    amount = v5->_amount;
    v5->_amount = (NSString *)v6;

    uint64_t v8 = stringForKey(v4, @"LPMetadataPriceCurrency");
    currency = v5->_currency;
    v5->_currency = (NSString *)v8;

    v10 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LPPriceMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)LPPriceMetadata;
  v5 = [(LPPriceMetadata *)&v12 init];
  if (v5)
  {
    uint64_t v6 = decodeStringForKey(v4, @"amount");
    amount = v5->_amount;
    v5->_amount = (NSString *)v6;

    uint64_t v8 = decodeStringForKey(v4, @"currency");
    currency = v5->_currency;
    v5->_currency = (NSString *)v8;

    v10 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_amount, @"amount");
  objc_msgSend(v4, "_lp_encodeStringIfNotNil:forKey:", self->_currency, @"currency");
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)LPPriceMetadata;
  if ([(LPPriceMetadata *)&v8 isEqual:v4])
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = (void **)v4;
      if (objectsAreEqual_0(v6[1], self->_amount)) {
        char v5 = objectsAreEqual_0(v6[2], self->_currency);
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
  return [(NSString *)self->_amount hash];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[LPPriceMetadata allocWithZone:a3];
  if (v4)
  {
    char v5 = [(LPPriceMetadata *)self amount];
    [(LPPriceMetadata *)v4 setAmount:v5];

    uint64_t v6 = [(LPPriceMetadata *)self currency];
    [(LPPriceMetadata *)v4 setCurrency:v6];

    v7 = v4;
  }

  return v4;
}

- (NSString)amount
{
  return self->_amount;
}

- (void)setAmount:(id)a3
{
}

- (NSString)currency
{
  return self->_currency;
}

- (void)setCurrency:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currency, 0);

  objc_storeStrong((id *)&self->_amount, 0);
}

@end