@interface ASDSubscriptionEntitlement
+ (BOOL)supportsSecureCoding;
- (ASDSubscriptionEntitlement)initWithCoder:(id)a3;
- (ASDSubscriptionEntitlement)initWithDictionary:(id)a3 forAppAdamID:(id)a4 segment:(unint64_t)a5 hasFamily:(BOOL)a6;
- (BOOL)autoRenewEnabled;
- (BOOL)hasFamily;
- (BOOL)isInGracePeriod;
- (BOOL)isNewsAppPurchase;
- (BOOL)isOfferPeriod;
- (BOOL)isPurchaser;
- (BOOL)isTrialPeriod;
- (NSDate)expiryDate;
- (NSDate)startDate;
- (NSNumber)appAdamID;
- (NSNumber)appVersion;
- (NSNumber)chargeStoreFrontID;
- (NSNumber)entitlementSourceAdamID;
- (NSNumber)familyID;
- (NSNumber)familyRank;
- (NSNumber)featureAccessTypeID;
- (NSNumber)freeTrialPeriodID;
- (NSNumber)inAppAdamID;
- (NSNumber)initialPurchaseTimestamp;
- (NSNumber)originalPurchaseDownloadID;
- (NSNumber)promoScenarioID;
- (NSNumber)purchasabilityType;
- (NSNumber)purchaseDownloadID;
- (NSNumber)quantity;
- (NSNumber)serviceBeginsTimestamp;
- (NSNumber)subscriptionBundleID;
- (NSString)chargeCountryCode;
- (NSString)chargeCurrencyCode;
- (NSString)entitlementOriginType;
- (NSString)externalSubscriptionID;
- (NSString)inAppVersion;
- (NSString)offerID;
- (NSString)poolType;
- (NSString)productCode;
- (NSString)vendorAdHocOfferID;
- (NSString)vendorID;
- (id)_dateFromDateString:(uint64_t)a1;
- (id)_valueForKey:(uint64_t)a1 ofType:(uint64_t)a2;
- (unint64_t)segment;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASDSubscriptionEntitlement

- (ASDSubscriptionEntitlement)initWithDictionary:(id)a3 forAppAdamID:(id)a4 segment:(unint64_t)a5 hasFamily:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  v18.receiver = self;
  v18.super_class = (Class)ASDSubscriptionEntitlement;
  v12 = [(ASDSubscriptionEntitlement *)&v18 init];
  if (v12)
  {
    v13 = (void *)MEMORY[0x19F392F00]();
    v14 = (void *)[v10 mutableCopy];
    [v14 setObject:v11 forKeyedSubscript:@"appAdamId"];
    uint64_t v15 = [v14 copy];
    dictionary = v12->_dictionary;
    v12->_dictionary = (NSDictionary *)v15;

    v12->_segment = a5;
    v12->_hasFamily = a6;
  }

  return v12;
}

- (NSNumber)appAdamID
{
  objc_opt_class();
  return (NSNumber *)-[ASDSubscriptionEntitlement _valueForKey:ofType:]((uint64_t)self, @"appAdamId");
}

- (id)_valueForKey:(uint64_t)a1 ofType:(uint64_t)a2
{
  if (a1)
  {
    v2 = [*(id *)(a1 + 8) valueForKey:a2];
    v3 = (void *)[v2 copy];

    if (objc_opt_isKindOfClass()) {
      v4 = v3;
    }
    else {
      v4 = 0;
    }
    id v5 = v4;
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (NSNumber)appVersion
{
  objc_opt_class();
  return (NSNumber *)-[ASDSubscriptionEntitlement _valueForKey:ofType:]((uint64_t)self, @"appVersion");
}

- (BOOL)autoRenewEnabled
{
  objc_opt_class();
  v3 = -[ASDSubscriptionEntitlement _valueForKey:ofType:]((uint64_t)self, @"autoRenew");
  char v4 = [v3 BOOLValue];

  return v4;
}

- (NSString)chargeCountryCode
{
  objc_opt_class();
  return (NSString *)-[ASDSubscriptionEntitlement _valueForKey:ofType:]((uint64_t)self, @"chargeCountryCode");
}

- (NSString)chargeCurrencyCode
{
  objc_opt_class();
  return (NSString *)-[ASDSubscriptionEntitlement _valueForKey:ofType:]((uint64_t)self, @"chargeCurrencyCode");
}

- (NSNumber)chargeStoreFrontID
{
  objc_opt_class();
  return (NSNumber *)-[ASDSubscriptionEntitlement _valueForKey:ofType:]((uint64_t)self, @"chargeStoreFrontId");
}

- (NSString)entitlementOriginType
{
  objc_opt_class();
  return (NSString *)-[ASDSubscriptionEntitlement _valueForKey:ofType:]((uint64_t)self, @"entitlementOriginType");
}

- (NSNumber)entitlementSourceAdamID
{
  objc_opt_class();
  return (NSNumber *)-[ASDSubscriptionEntitlement _valueForKey:ofType:]((uint64_t)self, @"entitlementSourceAdamId");
}

- (NSDate)expiryDate
{
  objc_opt_class();
  v3 = -[ASDSubscriptionEntitlement _valueForKey:ofType:]((uint64_t)self, @"expireDate");
  char v4 = -[ASDSubscriptionEntitlement _dateFromDateString:]((uint64_t)self, v3);

  return (NSDate *)v4;
}

- (id)_dateFromDateString:(uint64_t)a1
{
  v2 = 0;
  if (a1 && a2)
  {
    v3 = (objc_class *)MEMORY[0x1E4F28C10];
    id v4 = a2;
    id v5 = objc_alloc_init(v3);
    v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA20]) initWithLocaleIdentifier:@"en_US_POSIX"];
    [v5 setLocale:v6];
    [v5 setDateFormat:@"EEE MMM dd HH:mm:ss z yyyy"];
    v2 = [v5 dateFromString:v4];
  }
  return v2;
}

- (NSString)externalSubscriptionID
{
  objc_opt_class();
  return (NSString *)-[ASDSubscriptionEntitlement _valueForKey:ofType:]((uint64_t)self, @"externalSubscriptionId");
}

- (NSNumber)familyID
{
  objc_opt_class();
  return (NSNumber *)-[ASDSubscriptionEntitlement _valueForKey:ofType:]((uint64_t)self, @"familyId");
}

- (NSNumber)familyRank
{
  objc_opt_class();
  return (NSNumber *)-[ASDSubscriptionEntitlement _valueForKey:ofType:]((uint64_t)self, @"familyRank");
}

- (NSNumber)featureAccessTypeID
{
  objc_opt_class();
  return (NSNumber *)-[ASDSubscriptionEntitlement _valueForKey:ofType:]((uint64_t)self, @"featureAccessTypeId");
}

- (NSNumber)freeTrialPeriodID
{
  objc_opt_class();
  return (NSNumber *)-[ASDSubscriptionEntitlement _valueForKey:ofType:]((uint64_t)self, @"freeTrialPeriodId");
}

- (BOOL)hasFamily
{
  return self->_hasFamily;
}

- (NSNumber)inAppAdamID
{
  objc_opt_class();
  return (NSNumber *)-[ASDSubscriptionEntitlement _valueForKey:ofType:]((uint64_t)self, @"inAppAdamId");
}

- (NSString)inAppVersion
{
  objc_opt_class();
  return (NSString *)-[ASDSubscriptionEntitlement _valueForKey:ofType:]((uint64_t)self, @"inAppVersion");
}

- (NSNumber)initialPurchaseTimestamp
{
  objc_opt_class();
  return (NSNumber *)-[ASDSubscriptionEntitlement _valueForKey:ofType:]((uint64_t)self, @"initialPurchaseTimestamp");
}

- (BOOL)isTrialPeriod
{
  objc_opt_class();
  v3 = -[ASDSubscriptionEntitlement _valueForKey:ofType:]((uint64_t)self, @"isTrialPeriod");
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)isOfferPeriod
{
  objc_opt_class();
  v3 = -[ASDSubscriptionEntitlement _valueForKey:ofType:]((uint64_t)self, @"isOfferPeriod");
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)isPurchaser
{
  objc_opt_class();
  v3 = -[ASDSubscriptionEntitlement _valueForKey:ofType:]((uint64_t)self, @"isPurchaser");
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)isNewsAppPurchase
{
  objc_opt_class();
  v3 = -[ASDSubscriptionEntitlement _valueForKey:ofType:]((uint64_t)self, @"isNewsAppPurchase");
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)isInGracePeriod
{
  objc_opt_class();
  v3 = -[ASDSubscriptionEntitlement _valueForKey:ofType:]((uint64_t)self, @"isGracePeriod");
  char v4 = [v3 BOOLValue];

  return v4;
}

- (NSString)offerID
{
  objc_opt_class();
  return (NSString *)-[ASDSubscriptionEntitlement _valueForKey:ofType:]((uint64_t)self, @"offerIdentifier");
}

- (NSNumber)originalPurchaseDownloadID
{
  objc_opt_class();
  return (NSNumber *)-[ASDSubscriptionEntitlement _valueForKey:ofType:]((uint64_t)self, @"originalPurchaseDownloadId");
}

- (NSString)poolType
{
  objc_opt_class();
  return (NSString *)-[ASDSubscriptionEntitlement _valueForKey:ofType:]((uint64_t)self, @"poolType");
}

- (NSString)productCode
{
  objc_opt_class();
  return (NSString *)-[ASDSubscriptionEntitlement _valueForKey:ofType:]((uint64_t)self, @"productCode");
}

- (NSNumber)promoScenarioID
{
  objc_opt_class();
  return (NSNumber *)-[ASDSubscriptionEntitlement _valueForKey:ofType:]((uint64_t)self, @"promoScenarioId");
}

- (NSNumber)purchasabilityType
{
  objc_opt_class();
  return (NSNumber *)-[ASDSubscriptionEntitlement _valueForKey:ofType:]((uint64_t)self, @"purchasabilityType");
}

- (NSNumber)purchaseDownloadID
{
  objc_opt_class();
  return (NSNumber *)-[ASDSubscriptionEntitlement _valueForKey:ofType:]((uint64_t)self, @"purchaseDownloadId");
}

- (unint64_t)segment
{
  return self->_segment;
}

- (NSNumber)serviceBeginsTimestamp
{
  objc_opt_class();
  return (NSNumber *)-[ASDSubscriptionEntitlement _valueForKey:ofType:]((uint64_t)self, @"serviceBeginsTimestamp");
}

- (NSDate)startDate
{
  objc_opt_class();
  v3 = -[ASDSubscriptionEntitlement _valueForKey:ofType:]((uint64_t)self, @"startDate");
  char v4 = -[ASDSubscriptionEntitlement _dateFromDateString:]((uint64_t)self, v3);

  return (NSDate *)v4;
}

- (NSNumber)subscriptionBundleID
{
  objc_opt_class();
  return (NSNumber *)-[ASDSubscriptionEntitlement _valueForKey:ofType:]((uint64_t)self, @"subscriptionBundleId");
}

- (NSNumber)quantity
{
  objc_opt_class();
  return (NSNumber *)-[ASDSubscriptionEntitlement _valueForKey:ofType:]((uint64_t)self, @"quantity");
}

- (NSString)vendorAdHocOfferID
{
  objc_opt_class();
  return (NSString *)-[ASDSubscriptionEntitlement _valueForKey:ofType:]((uint64_t)self, @"vendorAdHocOfferId");
}

- (NSString)vendorID
{
  objc_opt_class();
  return (NSString *)-[ASDSubscriptionEntitlement _valueForKey:ofType:]((uint64_t)self, @"vendorIdentifier");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (ASDSubscriptionEntitlement)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASDSubscriptionEntitlement;
  id v5 = [(ASDSubscriptionEntitlement *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodePropertyListForKey:@"dictionary"];
    dictionary = v5->_dictionary;
    v5->_dictionary = (NSDictionary *)v6;
  }
  return v5;
}

- (void).cxx_destruct
{
}

@end