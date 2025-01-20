@interface CTXPCServiceSubscriptionInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CTXPCServiceSubscriptionInfo)initWithCoder:(id)a3;
- (NSArray)subscriptions;
- (NSArray)subscriptionsInUse;
- (NSArray)subscriptionsValid;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)redactedDescription;
- (void)encodeWithCoder:(id)a3;
- (void)setSubscriptions:(id)a3;
- (void)setSubscriptionsInUse:(id)a3;
- (void)setSubscriptionsValid:(id)a3;
@end

@implementation CTXPCServiceSubscriptionInfo

- (CTXPCServiceSubscriptionInfo)initWithCoder:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CTXPCServiceSubscriptionInfo;
  v5 = [(CTXPCServiceSubscriptionInfo *)&v12 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
    v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"subscriptions"];
    subscriptions = v5->_subscriptions;
    v5->_subscriptions = (NSArray *)v9;
  }
  return v5;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  id v4 = [(CTXPCServiceSubscriptionInfo *)self subscriptions];
  [v3 appendFormat:@" subscriptions=%@", v4];

  [v3 appendString:@">"];

  return v3;
}

- (id)redactedDescription
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  [v3 appendString:@" subscriptions="];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id obj = [(CTXPCServiceSubscriptionInfo *)self subscriptions];
  uint64_t v4 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(obj);
        }
        if (v6 + i) {
          uint64_t v9 = ", ";
        }
        else {
          uint64_t v9 = "";
        }
        v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) redactedDescription];
        [v3 appendFormat:@"%s%@", v9, v10];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v13 objects:v17 count:16];
      v6 += i;
    }
    while (v5);
  }

  [v3 appendString:@">"];

  return v3;
}

- (NSArray)subscriptionsInUse
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA48] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [(CTXPCServiceSubscriptionInfo *)self subscriptions];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v9 isSimPresent]) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (NSArray)subscriptions
{
  return self->_subscriptions;
}

- (void)encodeWithCoder:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionsValid, 0);
  objc_storeStrong((id *)&self->_subscriptionsInUse, 0);

  objc_storeStrong((id *)&self->_subscriptions, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(CTXPCServiceSubscriptionInfo *)self subscriptions];
  uint64_t v6 = (void *)[v5 copy];
  [v4 setSubscriptions:v6];

  return v4;
}

- (void)setSubscriptions:(id)a3
{
}

- (NSArray)subscriptionsValid
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA48] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [(CTXPCServiceSubscriptionInfo *)self subscriptions];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v9 isSimPresent] && objc_msgSend(v9, "isSimGood")) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (CTXPCServiceSubscriptionInfo *)a3;
  if (v4 == self) {
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v8 = 0;
    goto LABEL_9;
  }
  subscriptions = self->_subscriptions;
  if (subscriptions) {
    goto LABEL_6;
  }
  uint64_t v6 = [(CTXPCServiceSubscriptionInfo *)v4 subscriptions];

  if (!v6)
  {
LABEL_7:
    char v8 = 1;
    goto LABEL_9;
  }
  subscriptions = self->_subscriptions;
LABEL_6:
  uint64_t v7 = [(CTXPCServiceSubscriptionInfo *)v4 subscriptions];
  char v8 = [(NSArray *)subscriptions isEqualToArray:v7];

LABEL_9:
  return v8;
}

- (void)setSubscriptionsInUse:(id)a3
{
}

- (void)setSubscriptionsValid:(id)a3
{
}

@end