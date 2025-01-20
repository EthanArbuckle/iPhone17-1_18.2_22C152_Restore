@interface GEOTransitPaymentMethod
- (BOOL)isEqual:(id)a3;
- (GEOTransitPaymentMethod)initWithPaymentMethod:(id)a3;
- (NSString)identifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)addValueNameType;
- (int)paymentMethodType;
- (unint64_t)muid;
@end

@implementation GEOTransitPaymentMethod

- (GEOTransitPaymentMethod)initWithPaymentMethod:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GEOTransitPaymentMethod;
  v6 = [(GEOTransitPaymentMethod *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_pbPaymentMethod, a3);
    uint64_t v8 = [v5 identifier];
    identifier = v7->identifier;
    v7->identifier = (NSString *)v8;

    v7->muid = [v5 muid];
    v7->paymentMethodType = 0;
    if ([v5 hasPaymentMethodType])
    {
      unsigned int v10 = [v5 paymentMethodType];
      if (v10 <= 4) {
        v7->paymentMethodType = v10;
      }
    }
    v7->addValueNameType = 0;
    if ([v5 hasAddValueName])
    {
      unsigned int v11 = [v5 addValueName];
      if (v11 <= 3) {
        v7->addValueNameType = v11 + 1;
      }
    }
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = +[GEOTransitPaymentMethod allocWithZone:](GEOTransitPaymentMethod, "allocWithZone:");
  id v6 = [(GEOPBTransitPaymentMethod *)self->_pbPaymentMethod copyWithZone:a3];
  v7 = [(GEOTransitPaymentMethod *)v5 initWithPaymentMethod:v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(GEOTransitPaymentMethod *)self identifier];
    id v6 = [v4 identifier];
    char v7 = [v5 isEqualToString:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v3 appendFormat:@" GEOTransitPaymentMethod:\n"];
  id v4 = [(GEOTransitPaymentMethod *)self identifier];
  [v3 appendFormat:@" identifier:   '%@'\n", v4];

  objc_msgSend(v3, "appendFormat:", @" muid:         '%llu'\n", -[GEOTransitPaymentMethod muid](self, "muid"));
  objc_msgSend(v3, "appendFormat:", @" type:         '%d'\n", -[GEOTransitPaymentMethod paymentMethodType](self, "paymentMethodType"));
  objc_msgSend(v3, "appendFormat:", @" addValueName: '%d'\n", -[GEOTransitPaymentMethod addValueNameType](self, "addValueNameType"));
  id v5 = (void *)[[NSString alloc] initWithString:v3];

  return v5;
}

- (NSString)identifier
{
  return self->identifier;
}

- (unint64_t)muid
{
  return self->muid;
}

- (int)paymentMethodType
{
  return self->paymentMethodType;
}

- (int)addValueNameType
{
  return self->addValueNameType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->identifier, 0);

  objc_storeStrong((id *)&self->_pbPaymentMethod, 0);
}

@end