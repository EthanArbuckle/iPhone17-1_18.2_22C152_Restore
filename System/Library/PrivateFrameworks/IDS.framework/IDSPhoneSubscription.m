@interface IDSPhoneSubscription
+ (BOOL)supportsSecureCoding;
+ (id)CTSIMSFromPhoneSubscriptions:(id)a3;
+ (id)phoneSubscriptionWithLabelID:(id)a3;
+ (id)phoneSubscriptionWithSIM:(id)a3;
+ (id)phoneSubscriptionWithSubscriptionSlot:(int64_t)a3;
+ (id)phoneSubscriptionWithSubscriptionSlot:(int64_t)a3 andLabelID:(id)a4;
+ (id)phoneSubscriptionsFromCTSIMs:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPhoneSubscription:(id)a3;
- (IDSPhoneSubscription)initWithCoder:(id)a3;
- (IDSPhoneSubscription)initWithSubscriptionSlot:(int64_t)a3 labelID:(id)a4;
- (NSString)labelID;
- (id)description;
- (int64_t)subscriptionSlot;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setLabelID:(id)a3;
- (void)setSubscriptionSlot:(int64_t)a3;
@end

@implementation IDSPhoneSubscription

+ (id)CTSIMSFromPhoneSubscriptions:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = sub_19194F5F8(*(void **)(*((void *)&v13 + 1) + 8 * i));
          if (v10) {
            objc_msgSend(v4, "addObject:", v10, (void)v13);
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }

    v11 = (void *)[v4 copy];
  }
  else
  {
    v11 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v11;
}

+ (id)phoneSubscriptionsFromCTSIMs:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = +[IDSPhoneSubscription phoneSubscriptionWithSIM:](IDSPhoneSubscription, "phoneSubscriptionWithSIM:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
          if (v10) {
            [v4 addObject:v10];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }

    v11 = (void *)[v4 copy];
  }
  else
  {
    v11 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v11;
}

+ (id)phoneSubscriptionWithSIM:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    uint64_t v5 = [v4 slot];
    uint64_t v6 = 1;
    if (v5 == 1) {
      uint64_t v6 = 2;
    }
    if (v5 == 2) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = v6;
    }
    uint64_t v8 = [v4 SIMIdentifier];

    v9 = [a1 phoneSubscriptionWithSubscriptionSlot:v7 andLabelID:v8];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (IDSPhoneSubscription)initWithSubscriptionSlot:(int64_t)a3 labelID:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)IDSPhoneSubscription;
  uint64_t v8 = [(IDSPhoneSubscription *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_subscriptionSlot = a3;
    objc_storeStrong((id *)&v8->_labelID, a4);
  }

  return v9;
}

+ (id)phoneSubscriptionWithSubscriptionSlot:(int64_t)a3 andLabelID:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (v6) {
    BOOL v8 = [v6 length] != 0;
  }
  else {
    BOOL v8 = 0;
  }
  v9 = 0;
  if ((unint64_t)(a3 - 1) < 2) {
    BOOL v8 = 1;
  }
  if ((unint64_t)a3 <= 2 && v8) {
    v9 = (void *)[objc_alloc((Class)a1) initWithSubscriptionSlot:a3 labelID:v7];
  }

  return v9;
}

+ (id)phoneSubscriptionWithSubscriptionSlot:(int64_t)a3
{
  return (id)[a1 phoneSubscriptionWithSubscriptionSlot:a3 andLabelID:0];
}

+ (id)phoneSubscriptionWithLabelID:(id)a3
{
  return (id)[a1 phoneSubscriptionWithSubscriptionSlot:0 andLabelID:a3];
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p; slot: %d; labelID: %@>",
               objc_opt_class(),
               self,
               self->_subscriptionSlot,
               self->_labelID);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (IDSPhoneSubscription *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(IDSPhoneSubscription *)self isEqualToPhoneSubscription:v4];
  }

  return v5;
}

- (BOOL)isEqualToPhoneSubscription:(id)a3
{
  id v4 = a3;
  if (self->_subscriptionSlot == v4[1])
  {
    labelID = self->_labelID;
    if (labelID == (NSString *)v4[2]) {
      char v6 = 1;
    }
    else {
      char v6 = -[NSString isEqual:](labelID, "isEqual:");
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  int64_t subscriptionSlot = self->_subscriptionSlot;
  return [(NSString *)self->_labelID hash] ^ subscriptionSlot;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t subscriptionSlot = self->_subscriptionSlot;
  id v5 = a3;
  [v5 encodeInteger:subscriptionSlot forKey:@"subSlot"];
  [v5 encodeObject:self->_labelID forKey:@"subLableID"];
}

- (IDSPhoneSubscription)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"subSlot"];
  char v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subLableID"];

  id v7 = [(IDSPhoneSubscription *)self initWithSubscriptionSlot:v5 labelID:v6];
  return v7;
}

- (int64_t)subscriptionSlot
{
  return self->_subscriptionSlot;
}

- (void)setSubscriptionSlot:(int64_t)a3
{
  self->_int64_t subscriptionSlot = a3;
}

- (NSString)labelID
{
  return self->_labelID;
}

- (void)setLabelID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end