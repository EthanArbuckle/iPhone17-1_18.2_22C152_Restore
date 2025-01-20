@interface FKBankMerchantInformationInsight
- (BOOL)isEqual:(id)a3;
- (CNPostalAddress)merchantAddress;
- (FKBankMerchantInformationInsight)initWithCategoryDescription:(id)a3 merchantAddress:(id)a4 merchantCategoryCode:(id)a5 merchantName:(id)a6 merchantNumber:(id)a7 standardIndustrialClassificationCode:(id)a8;
- (NSNumber)merchantCategoryCode;
- (NSString)categoryDescription;
- (NSString)merchantName;
- (NSString)merchantNumber;
- (NSString)standardIndustrialClassificationCode;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setCategoryDescription:(id)a3;
- (void)setMerchantAddress:(id)a3;
- (void)setMerchantCategoryCode:(id)a3;
- (void)setMerchantName:(id)a3;
- (void)setMerchantNumber:(id)a3;
- (void)setStandardIndustrialClassificationCode:(id)a3;
@end

@implementation FKBankMerchantInformationInsight

- (FKBankMerchantInformationInsight)initWithCategoryDescription:(id)a3 merchantAddress:(id)a4 merchantCategoryCode:(id)a5 merchantName:(id)a6 merchantNumber:(id)a7 standardIndustrialClassificationCode:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v34.receiver = self;
  v34.super_class = (Class)FKBankMerchantInformationInsight;
  v20 = [(FKBankMerchantInformationInsight *)&v34 init];
  if (v20)
  {
    uint64_t v21 = [v14 copy];
    categoryDescription = v20->_categoryDescription;
    v20->_categoryDescription = (NSString *)v21;

    uint64_t v23 = [v15 copy];
    merchantAddress = v20->_merchantAddress;
    v20->_merchantAddress = (CNPostalAddress *)v23;

    uint64_t v25 = [v16 copy];
    merchantCategoryCode = v20->_merchantCategoryCode;
    v20->_merchantCategoryCode = (NSNumber *)v25;

    uint64_t v27 = [v17 copy];
    merchantName = v20->_merchantName;
    v20->_merchantName = (NSString *)v27;

    uint64_t v29 = [v18 copy];
    merchantNumber = v20->_merchantNumber;
    v20->_merchantNumber = (NSString *)v29;

    uint64_t v31 = [v19 copy];
    standardIndustrialClassificationCode = v20->_standardIndustrialClassificationCode;
    v20->_standardIndustrialClassificationCode = (NSString *)v31;
  }
  return v20;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v6 = [(NSString *)self->_categoryDescription copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(CNPostalAddress *)self->_merchantAddress copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  uint64_t v10 = [(NSNumber *)self->_merchantCategoryCode copyWithZone:a3];
  v11 = (void *)v5[3];
  v5[3] = v10;

  uint64_t v12 = [(NSString *)self->_merchantName copyWithZone:a3];
  v13 = (void *)v5[4];
  v5[4] = v12;

  uint64_t v14 = [(NSString *)self->_merchantNumber copyWithZone:a3];
  id v15 = (void *)v5[5];
  v5[5] = v14;

  uint64_t v16 = [(NSString *)self->_standardIndustrialClassificationCode copyWithZone:a3];
  id v17 = (void *)v5[6];
  v5[6] = v16;

  return v5;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  [v3 safelyAddObject:self->_categoryDescription];
  [v3 safelyAddObject:self->_merchantAddress];
  [v3 safelyAddObject:self->_merchantCategoryCode];
  [v3 safelyAddObject:self->_merchantName];
  [v3 safelyAddObject:self->_merchantNumber];
  [v3 safelyAddObject:self->_standardIndustrialClassificationCode];
  unint64_t v4 = FKCombinedHash(17, v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (FKBankMerchantInformationInsight *)a3;
  v5 = v4;
  if (self == v4)
  {
    char v7 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v6 = v5;
    if (FKEqualObjects(self->_categoryDescription, v6[1])
      && FKEqualObjects(self->_merchantAddress, v6[2])
      && FKEqualObjects(self->_merchantCategoryCode, v6[3])
      && FKEqualObjects(self->_merchantName, v6[4])
      && FKEqualObjects(self->_merchantNumber, v6[5]))
    {
      char v7 = FKEqualObjects(self->_standardIndustrialClassificationCode, v6[6]);
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

- (NSString)categoryDescription
{
  return self->_categoryDescription;
}

- (void)setCategoryDescription:(id)a3
{
}

- (CNPostalAddress)merchantAddress
{
  return self->_merchantAddress;
}

- (void)setMerchantAddress:(id)a3
{
}

- (NSNumber)merchantCategoryCode
{
  return self->_merchantCategoryCode;
}

- (void)setMerchantCategoryCode:(id)a3
{
}

- (NSString)merchantName
{
  return self->_merchantName;
}

- (void)setMerchantName:(id)a3
{
}

- (NSString)merchantNumber
{
  return self->_merchantNumber;
}

- (void)setMerchantNumber:(id)a3
{
}

- (NSString)standardIndustrialClassificationCode
{
  return self->_standardIndustrialClassificationCode;
}

- (void)setStandardIndustrialClassificationCode:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_standardIndustrialClassificationCode, 0);
  objc_storeStrong((id *)&self->_merchantNumber, 0);
  objc_storeStrong((id *)&self->_merchantName, 0);
  objc_storeStrong((id *)&self->_merchantCategoryCode, 0);
  objc_storeStrong((id *)&self->_merchantAddress, 0);

  objc_storeStrong((id *)&self->_categoryDescription, 0);
}

@end