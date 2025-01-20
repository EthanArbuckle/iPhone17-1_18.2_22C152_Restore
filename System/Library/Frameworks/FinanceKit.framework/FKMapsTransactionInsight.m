@interface FKMapsTransactionInsight
- (BOOL)isEqual:(id)a3;
- (FKMapsBrand)brand;
- (FKMapsMerchant)merchant;
- (FKMapsTransactionInsight)initWithUpdatedAt:(id)a3 fallbackCategory:(unint64_t)a4 merchant:(id)a5 brand:(id)a6;
- (NSDate)updatedAt;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)fallbackCategory;
- (unint64_t)hash;
- (void)setBrand:(id)a3;
- (void)setFallbackCategory:(unint64_t)a3;
- (void)setMerchant:(id)a3;
- (void)setUpdatedAt:(id)a3;
@end

@implementation FKMapsTransactionInsight

- (FKMapsTransactionInsight)initWithUpdatedAt:(id)a3 fallbackCategory:(unint64_t)a4 merchant:(id)a5 brand:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v21.receiver = self;
  v21.super_class = (Class)FKMapsTransactionInsight;
  v13 = [(FKMapsTransactionInsight *)&v21 init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    updatedAt = v13->_updatedAt;
    v13->_updatedAt = (NSDate *)v14;

    v13->_fallbackCategory = a4;
    uint64_t v16 = [v11 copy];
    merchant = v13->_merchant;
    v13->_merchant = (FKMapsMerchant *)v16;

    uint64_t v18 = [v12 copy];
    brand = v13->_brand;
    v13->_brand = (FKMapsBrand *)v18;
  }
  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v6 = [(NSDate *)self->_updatedAt copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  v5[2] = self->_fallbackCategory;
  id v8 = [(FKMapsMerchant *)self->_merchant copyWithZone:a3];
  v9 = (void *)v5[3];
  v5[3] = v8;

  id v10 = [(FKMapsBrand *)self->_brand copyWithZone:a3];
  id v11 = (void *)v5[4];
  v5[4] = v10;

  return v5;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  [v3 safelyAddObject:self->_updatedAt];
  [v3 safelyAddObject:self->_merchant];
  [v3 safelyAddObject:self->_brand];
  uint64_t v4 = FKCombinedHash(17, v3);
  unint64_t v5 = FKIntegerHash(v4, self->_fallbackCategory);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (FKMapsTransactionInsight *)a3;
  unint64_t v5 = v4;
  if (self == v4)
  {
    char v7 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v6 = v5;
    if (FKEqualObjects(self->_updatedAt, v6[1])
      && (void *)self->_fallbackCategory == v6[2]
      && FKEqualObjects(self->_merchant, v6[3]))
    {
      char v7 = FKEqualObjects(self->_brand, v6[4]);
    }
    else
    {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (NSDate)updatedAt
{
  return self->_updatedAt;
}

- (void)setUpdatedAt:(id)a3
{
}

- (unint64_t)fallbackCategory
{
  return self->_fallbackCategory;
}

- (void)setFallbackCategory:(unint64_t)a3
{
  self->_fallbackCategory = a3;
}

- (FKMapsMerchant)merchant
{
  return self->_merchant;
}

- (void)setMerchant:(id)a3
{
}

- (FKMapsBrand)brand
{
  return self->_brand;
}

- (void)setBrand:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_brand, 0);
  objc_storeStrong((id *)&self->_merchant, 0);

  objc_storeStrong((id *)&self->_updatedAt, 0);
}

@end