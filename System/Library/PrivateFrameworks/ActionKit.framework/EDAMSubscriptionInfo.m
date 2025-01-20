@interface EDAMSubscriptionInfo
+ (id)structFields;
+ (id)structName;
- (NSNumber)currentTime;
- (NSNumber)currentlySubscribed;
- (NSNumber)itunesReceiptRequested;
- (NSNumber)subscriptionCancellationPending;
- (NSNumber)subscriptionExpirationDate;
- (NSNumber)subscriptionPending;
- (NSNumber)subscriptionRecurring;
- (NSNumber)validUntil;
- (NSSet)serviceLevelsEligibleForPurchase;
- (NSString)currentSku;
- (void)setCurrentSku:(id)a3;
- (void)setCurrentTime:(id)a3;
- (void)setCurrentlySubscribed:(id)a3;
- (void)setItunesReceiptRequested:(id)a3;
- (void)setServiceLevelsEligibleForPurchase:(id)a3;
- (void)setSubscriptionCancellationPending:(id)a3;
- (void)setSubscriptionExpirationDate:(id)a3;
- (void)setSubscriptionPending:(id)a3;
- (void)setSubscriptionRecurring:(id)a3;
- (void)setValidUntil:(id)a3;
@end

@implementation EDAMSubscriptionInfo

+ (id)structFields
{
  v17[10] = *MEMORY[0x263EF8340];
  v2 = (void *)structFields_structFields_887;
  if (!structFields_structFields_887)
  {
    v16 = +[FATField fieldWithIndex:1 type:10 optional:0 name:@"currentTime"];
    v17[0] = v16;
    v15 = +[FATField fieldWithIndex:2 type:2 optional:0 name:@"currentlySubscribed"];
    v17[1] = v15;
    v3 = +[FATField fieldWithIndex:3 type:2 optional:0 name:@"subscriptionRecurring"];
    v17[2] = v3;
    v4 = +[FATField fieldWithIndex:4 type:10 optional:1 name:@"subscriptionExpirationDate"];
    v17[3] = v4;
    v5 = +[FATField fieldWithIndex:5 type:2 optional:0 name:@"subscriptionPending"];
    v17[4] = v5;
    v6 = +[FATField fieldWithIndex:6 type:2 optional:0 name:@"subscriptionCancellationPending"];
    v17[5] = v6;
    v7 = +[FATField fieldWithIndex:0 type:8 optional:1 name:0];
    v8 = +[FATField fieldWithIndex:7 type:14 optional:0 name:@"serviceLevelsEligibleForPurchase" valueField:v7];
    v17[6] = v8;
    v9 = +[FATField fieldWithIndex:8 type:11 optional:1 name:@"currentSku"];
    v17[7] = v9;
    v10 = +[FATField fieldWithIndex:9 type:10 optional:1 name:@"validUntil"];
    v17[8] = v10;
    v11 = +[FATField fieldWithIndex:10 type:2 optional:1 name:@"itunesReceiptRequested"];
    v17[9] = v11;
    uint64_t v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:10];
    v13 = (void *)structFields_structFields_887;
    structFields_structFields_887 = v12;

    v2 = (void *)structFields_structFields_887;
  }
  return v2;
}

+ (id)structName
{
  return @"SubscriptionInfo";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itunesReceiptRequested, 0);
  objc_storeStrong((id *)&self->_validUntil, 0);
  objc_storeStrong((id *)&self->_currentSku, 0);
  objc_storeStrong((id *)&self->_serviceLevelsEligibleForPurchase, 0);
  objc_storeStrong((id *)&self->_subscriptionCancellationPending, 0);
  objc_storeStrong((id *)&self->_subscriptionPending, 0);
  objc_storeStrong((id *)&self->_subscriptionExpirationDate, 0);
  objc_storeStrong((id *)&self->_subscriptionRecurring, 0);
  objc_storeStrong((id *)&self->_currentlySubscribed, 0);
  objc_storeStrong((id *)&self->_currentTime, 0);
}

- (void)setItunesReceiptRequested:(id)a3
{
}

- (NSNumber)itunesReceiptRequested
{
  return self->_itunesReceiptRequested;
}

- (void)setValidUntil:(id)a3
{
}

- (NSNumber)validUntil
{
  return self->_validUntil;
}

- (void)setCurrentSku:(id)a3
{
}

- (NSString)currentSku
{
  return self->_currentSku;
}

- (void)setServiceLevelsEligibleForPurchase:(id)a3
{
}

- (NSSet)serviceLevelsEligibleForPurchase
{
  return self->_serviceLevelsEligibleForPurchase;
}

- (void)setSubscriptionCancellationPending:(id)a3
{
}

- (NSNumber)subscriptionCancellationPending
{
  return self->_subscriptionCancellationPending;
}

- (void)setSubscriptionPending:(id)a3
{
}

- (NSNumber)subscriptionPending
{
  return self->_subscriptionPending;
}

- (void)setSubscriptionExpirationDate:(id)a3
{
}

- (NSNumber)subscriptionExpirationDate
{
  return self->_subscriptionExpirationDate;
}

- (void)setSubscriptionRecurring:(id)a3
{
}

- (NSNumber)subscriptionRecurring
{
  return self->_subscriptionRecurring;
}

- (void)setCurrentlySubscribed:(id)a3
{
}

- (NSNumber)currentlySubscribed
{
  return self->_currentlySubscribed;
}

- (void)setCurrentTime:(id)a3
{
}

- (NSNumber)currentTime
{
  return self->_currentTime;
}

@end