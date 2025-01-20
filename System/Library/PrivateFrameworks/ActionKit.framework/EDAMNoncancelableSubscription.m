@interface EDAMNoncancelableSubscription
+ (id)structFields;
+ (id)structName;
- (EDAMUser)user;
- (NSNumber)nextPaymentDue;
- (NSNumber)premiumLockUntil;
- (NSNumber)premiumServiceStatus;
- (NSNumber)subscriptionId;
- (NSNumber)unitPrice;
- (NSString)amazonPurchaseToken;
- (NSString)amazonUserId;
- (NSString)currency;
- (NSString)itunesOriginalTransactionId;
- (NSString)itunesReceiptData;
- (NSString)premiumCommerceService;
- (NSString)premiumServiceSku;
- (void)setAmazonPurchaseToken:(id)a3;
- (void)setAmazonUserId:(id)a3;
- (void)setCurrency:(id)a3;
- (void)setItunesOriginalTransactionId:(id)a3;
- (void)setItunesReceiptData:(id)a3;
- (void)setNextPaymentDue:(id)a3;
- (void)setPremiumCommerceService:(id)a3;
- (void)setPremiumLockUntil:(id)a3;
- (void)setPremiumServiceSku:(id)a3;
- (void)setPremiumServiceStatus:(id)a3;
- (void)setSubscriptionId:(id)a3;
- (void)setUnitPrice:(id)a3;
- (void)setUser:(id)a3;
@end

@implementation EDAMNoncancelableSubscription

+ (id)structFields
{
  v19[13] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_2883;
  if (!structFields_structFields_2883)
  {
    v18 = +[FATField fieldWithIndex:1 type:8 optional:0 name:@"subscriptionId"];
    v19[0] = v18;
    v17 = +[FATField fieldWithIndex:2 type:12 optional:1 name:@"user" structClass:objc_opt_class()];
    v19[1] = v17;
    v16 = +[FATField fieldWithIndex:3 type:8 optional:1 name:@"premiumServiceStatus"];
    v19[2] = v16;
    v3 = +[FATField fieldWithIndex:4 type:11 optional:1 name:@"premiumCommerceService"];
    v19[3] = v3;
    v4 = +[FATField fieldWithIndex:5 type:11 optional:1 name:@"itunesReceiptData"];
    v19[4] = v4;
    v5 = +[FATField fieldWithIndex:6 type:11 optional:1 name:@"amazonUserId"];
    v19[5] = v5;
    v6 = +[FATField fieldWithIndex:7 type:11 optional:1 name:@"amazonPurchaseToken"];
    v19[6] = v6;
    v7 = +[FATField fieldWithIndex:8 type:11 optional:1 name:@"premiumServiceSku"];
    v19[7] = v7;
    v8 = +[FATField fieldWithIndex:9 type:10 optional:1 name:@"nextPaymentDue"];
    v19[8] = v8;
    v9 = +[FATField fieldWithIndex:10 type:10 optional:1 name:@"premiumLockUntil"];
    v19[9] = v9;
    v10 = +[FATField fieldWithIndex:11 type:11 optional:1 name:@"currency"];
    v19[10] = v10;
    v11 = +[FATField fieldWithIndex:12 type:8 optional:1 name:@"unitPrice"];
    v19[11] = v11;
    v12 = +[FATField fieldWithIndex:13 type:11 optional:1 name:@"itunesOriginalTransactionId"];
    v19[12] = v12;
    uint64_t v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:13];
    v14 = (void *)structFields_structFields_2883;
    structFields_structFields_2883 = v13;

    v2 = (void *)structFields_structFields_2883;
  }
  return v2;
}

+ (id)structName
{
  return @"NoncancelableSubscription";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itunesOriginalTransactionId, 0);
  objc_storeStrong((id *)&self->_unitPrice, 0);
  objc_storeStrong((id *)&self->_currency, 0);
  objc_storeStrong((id *)&self->_premiumLockUntil, 0);
  objc_storeStrong((id *)&self->_nextPaymentDue, 0);
  objc_storeStrong((id *)&self->_premiumServiceSku, 0);
  objc_storeStrong((id *)&self->_amazonPurchaseToken, 0);
  objc_storeStrong((id *)&self->_amazonUserId, 0);
  objc_storeStrong((id *)&self->_itunesReceiptData, 0);
  objc_storeStrong((id *)&self->_premiumCommerceService, 0);
  objc_storeStrong((id *)&self->_premiumServiceStatus, 0);
  objc_storeStrong((id *)&self->_user, 0);
  objc_storeStrong((id *)&self->_subscriptionId, 0);
}

- (void)setItunesOriginalTransactionId:(id)a3
{
}

- (NSString)itunesOriginalTransactionId
{
  return self->_itunesOriginalTransactionId;
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

- (void)setPremiumLockUntil:(id)a3
{
}

- (NSNumber)premiumLockUntil
{
  return self->_premiumLockUntil;
}

- (void)setNextPaymentDue:(id)a3
{
}

- (NSNumber)nextPaymentDue
{
  return self->_nextPaymentDue;
}

- (void)setPremiumServiceSku:(id)a3
{
}

- (NSString)premiumServiceSku
{
  return self->_premiumServiceSku;
}

- (void)setAmazonPurchaseToken:(id)a3
{
}

- (NSString)amazonPurchaseToken
{
  return self->_amazonPurchaseToken;
}

- (void)setAmazonUserId:(id)a3
{
}

- (NSString)amazonUserId
{
  return self->_amazonUserId;
}

- (void)setItunesReceiptData:(id)a3
{
}

- (NSString)itunesReceiptData
{
  return self->_itunesReceiptData;
}

- (void)setPremiumCommerceService:(id)a3
{
}

- (NSString)premiumCommerceService
{
  return self->_premiumCommerceService;
}

- (void)setPremiumServiceStatus:(id)a3
{
}

- (NSNumber)premiumServiceStatus
{
  return self->_premiumServiceStatus;
}

- (void)setUser:(id)a3
{
}

- (EDAMUser)user
{
  return self->_user;
}

- (void)setSubscriptionId:(id)a3
{
}

- (NSNumber)subscriptionId
{
  return self->_subscriptionId;
}

@end