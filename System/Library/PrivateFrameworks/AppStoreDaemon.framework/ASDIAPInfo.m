@interface ASDIAPInfo
+ (BOOL)supportsSecureCoding;
- (ASDIAPInfo)initWithCoder:(id)a3;
- (BOOL)autoRenewStatus;
- (BOOL)hasUsedFreeOffer;
- (BOOL)hasUsedIntroPricingOffer;
- (BOOL)isEqual:(id)a3;
- (NSDate)expirationDate;
- (NSDate)lastModifiedDate;
- (NSDate)purchaseDate;
- (NSNumber)adamId;
- (NSNumber)appAdamId;
- (NSNumber)expirationTimestamp;
- (NSNumber)lastModifiedTimestamp;
- (NSNumber)purchaseTimestamp;
- (NSString)subscriptionFamilyId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (uint64_t)_newCopyWithClass:(uint64_t)a3 zone:;
- (unsigned)type;
- (void)encodeWithCoder:(id)a3;
- (void)setAdamId:(id)a3;
- (void)setAppAdamId:(id)a3;
- (void)setAutoRenewStatus:(BOOL)a3;
- (void)setExpirationDate:(id)a3;
- (void)setHasUsedFreeOffer:(BOOL)a3;
- (void)setHasUsedIntroPricingOffer:(BOOL)a3;
- (void)setLastModifiedDate:(id)a3;
- (void)setPurchaseDate:(id)a3;
- (void)setSubscriptionFamilyId:(id)a3;
- (void)setType:(unsigned __int8)a3;
@end

@implementation ASDIAPInfo

- (NSNumber)expirationTimestamp
{
  expirationDate = self->_expirationDate;
  if (expirationDate)
  {
    v3 = NSNumber;
    [expirationDate timeIntervalSince1970];
    expirationDate = objc_msgSend(v3, "numberWithDouble:");
  }
  return (NSNumber *)expirationDate;
}

- (NSNumber)lastModifiedTimestamp
{
  lastModifiedDate = self->_lastModifiedDate;
  if (lastModifiedDate)
  {
    v3 = NSNumber;
    [lastModifiedDate timeIntervalSince1970];
    lastModifiedDate = objc_msgSend(v3, "numberWithDouble:");
  }
  return (NSNumber *)lastModifiedDate;
}

- (NSNumber)purchaseTimestamp
{
  purchaseDate = self->_purchaseDate;
  if (purchaseDate)
  {
    v3 = NSNumber;
    [purchaseDate timeIntervalSince1970];
    purchaseDate = objc_msgSend(v3, "numberWithDouble:");
  }
  return (NSNumber *)purchaseDate;
}

- (id)description
{
  v2 = @"YES";
  if (self->_hasUsedFreeOffer) {
    v3 = @"YES";
  }
  else {
    v3 = @"NO";
  }
  if (self->_hasUsedIntroPricingOffer) {
    v4 = @"YES";
  }
  else {
    v4 = @"NO";
  }
  if (!self->_autoRenewStatus) {
    v2 = @"NO";
  }
  return (id)[NSString stringWithFormat:@"AdamID: %@, AppAdamID: %@, PurchaseDate: %@, LastModifiedDate: %@, ExpirationDate: %@, Type: %i, HasUsedFreeOffer: %@, HasUsedIntroPricingOffer: %@, Subscription Family ID: %@, AutoRenewStatus: %@", *(_OWORD *)&self->_adamId, self->_purchaseDate, self->_lastModifiedDate, self->_expirationDate, self->_type, v3, v4, self->_subscriptionFamilyId, v2];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ASDIAPInfo *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      if (!self) {
        goto LABEL_34;
      }
      adamId = self->_adamId;
      v7 = v5->_adamId;
      if (adamId != v7)
      {
        BOOL v8 = 0;
        if (!adamId || !v7) {
          goto LABEL_35;
        }
        if (!-[NSNumber isEqual:](adamId, "isEqual:")) {
          goto LABEL_34;
        }
      }
      appAdamId = self->_appAdamId;
      v10 = v5->_appAdamId;
      if (appAdamId != v10)
      {
        BOOL v8 = 0;
        if (!appAdamId || !v10) {
          goto LABEL_35;
        }
        if (!-[NSNumber isEqual:](appAdamId, "isEqual:")) {
          goto LABEL_34;
        }
      }
      expirationDate = self->_expirationDate;
      v12 = v5->_expirationDate;
      if (expirationDate != v12)
      {
        BOOL v8 = 0;
        if (!expirationDate || !v12) {
          goto LABEL_35;
        }
        if (!-[NSDate isEqual:](expirationDate, "isEqual:")) {
          goto LABEL_34;
        }
      }
      if (self->_hasUsedFreeOffer != v5->_hasUsedFreeOffer
        || self->_hasUsedIntroPricingOffer != v5->_hasUsedIntroPricingOffer)
      {
        goto LABEL_34;
      }
      lastModifiedDate = self->_lastModifiedDate;
      v14 = v5->_lastModifiedDate;
      if (lastModifiedDate != v14)
      {
        BOOL v8 = 0;
        if (!lastModifiedDate || !v14) {
          goto LABEL_35;
        }
        if (!-[NSDate isEqual:](lastModifiedDate, "isEqual:")) {
          goto LABEL_34;
        }
      }
      purchaseDate = self->_purchaseDate;
      v16 = v5->_purchaseDate;
      if (purchaseDate != v16)
      {
        BOOL v8 = 0;
        if (!purchaseDate || !v16) {
          goto LABEL_35;
        }
        if (!-[NSDate isEqual:](purchaseDate, "isEqual:")) {
          goto LABEL_34;
        }
      }
      subscriptionFamilyId = self->_subscriptionFamilyId;
      v18 = v5->_subscriptionFamilyId;
      if (subscriptionFamilyId != v18)
      {
        BOOL v8 = 0;
        if (!subscriptionFamilyId || !v18) {
          goto LABEL_35;
        }
        if (!-[NSString isEqual:](subscriptionFamilyId, "isEqual:")) {
          goto LABEL_34;
        }
      }
      if (self->_type == v5->_type) {
        BOOL v8 = self->_autoRenewStatus == v5->_autoRenewStatus;
      }
      else {
LABEL_34:
      }
        BOOL v8 = 0;
LABEL_35:

      goto LABEL_36;
    }
    BOOL v8 = 0;
  }
LABEL_36:

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  if ([(ASDIAPInfo *)self isMemberOfClass:objc_opt_class()])
  {
    return self;
  }
  else
  {
    v5 = objc_opt_class();
    return (id)-[ASDIAPInfo _newCopyWithClass:zone:]((uint64_t)self, v5, (uint64_t)a3);
  }
}

- (uint64_t)_newCopyWithClass:(uint64_t)a3 zone:
{
  if (!a1) {
    return 0;
  }
  uint64_t v5 = objc_msgSend((id)objc_msgSend(a2, "allocWithZone:"), "init");
  uint64_t v6 = [*(id *)(a1 + 16) copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  uint64_t v8 = [*(id *)(a1 + 24) copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  uint64_t v10 = [*(id *)(a1 + 48) copyWithZone:a3];
  v11 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v10;

  uint64_t v12 = [*(id *)(a1 + 40) copyWithZone:a3];
  v13 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v12;

  uint64_t v14 = [*(id *)(a1 + 32) copyWithZone:a3];
  v15 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v14;

  *(unsigned char *)(v5 + 11) = *(unsigned char *)(a1 + 11);
  *(unsigned char *)(v5 + 9) = *(unsigned char *)(a1 + 9);
  *(unsigned char *)(v5 + 10) = *(unsigned char *)(a1 + 10);
  uint64_t v16 = [*(id *)(a1 + 56) copyWithZone:a3];
  v17 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v16;

  *(unsigned char *)(v5 + 8) = *(unsigned char *)(a1 + 8);
  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_opt_class();
  return (id)-[ASDIAPInfo _newCopyWithClass:zone:]((uint64_t)self, v5, (uint64_t)a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  adamId = self->_adamId;
  id v5 = a3;
  [v5 encodeObject:adamId forKey:@"ASDIAPInfoAdamIdCodingKey"];
  [v5 encodeObject:self->_appAdamId forKey:@"ASDIAPInfoAppAdamIdCodingKey"];
  [v5 encodeObject:self->_purchaseDate forKey:@"ASDIAPInfoPurchaseDateCodingKey"];
  [v5 encodeObject:self->_lastModifiedDate forKey:@"ASDIAPInfoLastModifiedDateCodingKey"];
  [v5 encodeObject:self->_expirationDate forKey:@"ASDIAPInfoExpirationDateCodingKey"];
  [v5 encodeInt:self->_type forKey:@"ASDIAPInfoTypeCodingKey"];
  [v5 encodeBool:self->_hasUsedFreeOffer forKey:@"ASDIAPInfoHasUsedFreeOfferCodingKey"];
  [v5 encodeBool:self->_hasUsedIntroPricingOffer forKey:@"ASDIAPInfoHasUsedIntroPricingOfferCodingKey"];
  [v5 encodeObject:self->_subscriptionFamilyId forKey:@"ASDIAPInfoSubscriptionFamilyIdCodingKey"];
  [v5 encodeBool:self->_autoRenewStatus forKey:@"ASDIAPInfoSubscriptionAutoRenewStatusCodingKey"];
}

- (ASDIAPInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)ASDIAPInfo;
  id v5 = [(ASDIAPInfo *)&v19 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ASDIAPInfoAdamIdCodingKey"];
    adamId = v5->_adamId;
    v5->_adamId = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ASDIAPInfoAppAdamIdCodingKey"];
    appAdamId = v5->_appAdamId;
    v5->_appAdamId = (NSNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ASDIAPInfoPurchaseDateCodingKey"];
    purchaseDate = v5->_purchaseDate;
    v5->_purchaseDate = (NSDate *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ASDIAPInfoLastModifiedDateCodingKey"];
    lastModifiedDate = v5->_lastModifiedDate;
    v5->_lastModifiedDate = (NSDate *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ASDIAPInfoExpirationDateCodingKey"];
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v14;

    v5->_type = [v4 decodeIntForKey:@"ASDIAPInfoTypeCodingKey"];
    v5->_hasUsedFreeOffer = [v4 decodeBoolForKey:@"ASDIAPInfoHasUsedFreeOfferCodingKey"];
    v5->_hasUsedIntroPricingOffer = [v4 decodeBoolForKey:@"ASDIAPInfoHasUsedIntroPricingOfferCodingKey"];
    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ASDIAPInfoSubscriptionFamilyIdCodingKey"];
    subscriptionFamilyId = v5->_subscriptionFamilyId;
    v5->_subscriptionFamilyId = (NSString *)v16;

    v5->_autoRenewStatus = [v4 decodeBoolForKey:@"ASDIAPInfoSubscriptionAutoRenewStatusCodingKey"];
  }

  return v5;
}

- (NSNumber)adamId
{
  return self->_adamId;
}

- (void)setAdamId:(id)a3
{
}

- (NSNumber)appAdamId
{
  return self->_appAdamId;
}

- (void)setAppAdamId:(id)a3
{
}

- (BOOL)autoRenewStatus
{
  return self->_autoRenewStatus;
}

- (void)setAutoRenewStatus:(BOOL)a3
{
  self->_autoRenewStatus = a3;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
}

- (BOOL)hasUsedFreeOffer
{
  return self->_hasUsedFreeOffer;
}

- (void)setHasUsedFreeOffer:(BOOL)a3
{
  self->_hasUsedFreeOffer = a3;
}

- (BOOL)hasUsedIntroPricingOffer
{
  return self->_hasUsedIntroPricingOffer;
}

- (void)setHasUsedIntroPricingOffer:(BOOL)a3
{
  self->_hasUsedIntroPricingOffer = a3;
}

- (NSDate)lastModifiedDate
{
  return self->_lastModifiedDate;
}

- (void)setLastModifiedDate:(id)a3
{
}

- (NSDate)purchaseDate
{
  return self->_purchaseDate;
}

- (void)setPurchaseDate:(id)a3
{
}

- (NSString)subscriptionFamilyId
{
  return self->_subscriptionFamilyId;
}

- (void)setSubscriptionFamilyId:(id)a3
{
}

- (unsigned)type
{
  return self->_type;
}

- (void)setType:(unsigned __int8)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionFamilyId, 0);
  objc_storeStrong((id *)&self->_purchaseDate, 0);
  objc_storeStrong((id *)&self->_lastModifiedDate, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_appAdamId, 0);
  objc_storeStrong((id *)&self->_adamId, 0);
}

@end