@interface EDAMBackupPaymentInfo
+ (id)structFields;
+ (id)structName;
- (NSNumber)paymentMethodId;
- (NSNumber)unitPrice;
- (NSString)currency;
- (NSString)premiumCommerceService;
- (NSString)premiumServiceSKU;
- (void)setCurrency:(id)a3;
- (void)setPaymentMethodId:(id)a3;
- (void)setPremiumCommerceService:(id)a3;
- (void)setPremiumServiceSKU:(id)a3;
- (void)setUnitPrice:(id)a3;
@end

@implementation EDAMBackupPaymentInfo

+ (id)structFields
{
  v11[5] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_399;
  if (!structFields_structFields_399)
  {
    v3 = +[FATField fieldWithIndex:1 type:11 optional:0 name:@"premiumCommerceService"];
    v4 = +[FATField fieldWithIndex:2, 11, 0, @"premiumServiceSKU", v3 type optional name];
    v11[1] = v4;
    v5 = +[FATField fieldWithIndex:3 type:11 optional:0 name:@"currency"];
    v11[2] = v5;
    v6 = +[FATField fieldWithIndex:4 type:8 optional:0 name:@"unitPrice"];
    v11[3] = v6;
    v7 = +[FATField fieldWithIndex:5 type:8 optional:0 name:@"paymentMethodId"];
    v11[4] = v7;
    uint64_t v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:5];
    v9 = (void *)structFields_structFields_399;
    structFields_structFields_399 = v8;

    v2 = (void *)structFields_structFields_399;
  }
  return v2;
}

+ (id)structName
{
  return @"BackupPaymentInfo";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentMethodId, 0);
  objc_storeStrong((id *)&self->_unitPrice, 0);
  objc_storeStrong((id *)&self->_currency, 0);
  objc_storeStrong((id *)&self->_premiumServiceSKU, 0);
  objc_storeStrong((id *)&self->_premiumCommerceService, 0);
}

- (void)setPaymentMethodId:(id)a3
{
}

- (NSNumber)paymentMethodId
{
  return self->_paymentMethodId;
}

- (void)setUnitPrice:(id)a3
{
}

- (NSNumber)unitPrice
{
  return self->_unitPrice;
}

- (void)setCurrency:(id)a3
{
}

- (NSString)currency
{
  return self->_currency;
}

- (void)setPremiumServiceSKU:(id)a3
{
}

- (NSString)premiumServiceSKU
{
  return self->_premiumServiceSKU;
}

- (void)setPremiumCommerceService:(id)a3
{
}

- (NSString)premiumCommerceService
{
  return self->_premiumCommerceService;
}

@end