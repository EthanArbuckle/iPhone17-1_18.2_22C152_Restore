@interface VSApplicationAppleSubscription
+ (id)appleSubscriptionsFromApplicationAppleSubscriptions:(id)a3;
+ (id)applicationAppleSubscriptionsFromAppleSubscriptions:(id)a3;
- (NSArray)productCodes;
- (NSString)customerID;
- (VSApplicationAppleSubscription)init;
- (VSApplicationAppleSubscription)initWithAppleSubscription:(id)a3;
- (id)appleSubscription;
- (void)setCustomerID:(id)a3;
- (void)setProductCodes:(id)a3;
@end

@implementation VSApplicationAppleSubscription

- (VSApplicationAppleSubscription)init
{
  v3.receiver = self;
  v3.super_class = (Class)VSApplicationAppleSubscription;
  return [(VSApplicationAppleSubscription *)&v3 init];
}

- (VSApplicationAppleSubscription)initWithAppleSubscription:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VSApplicationAppleSubscription;
  v5 = [(VSApplicationAppleSubscription *)&v13 init];
  if (v5)
  {
    v6 = [v4 customerID];
    uint64_t v7 = [v6 copy];
    customerID = v5->_customerID;
    v5->_customerID = (NSString *)v7;

    v9 = [v4 productCodes];
    uint64_t v10 = [v9 copy];
    productCodes = v5->_productCodes;
    v5->_productCodes = (NSArray *)v10;
  }
  return v5;
}

- (id)appleSubscription
{
  objc_super v3 = [VSAppleSubscription alloc];
  id v4 = [(VSApplicationAppleSubscription *)self customerID];

  if (!v4) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The [self customerID] parameter must not be nil."];
  }
  v5 = [(VSApplicationAppleSubscription *)self customerID];
  v6 = (void *)[v5 copy];
  uint64_t v7 = [(VSApplicationAppleSubscription *)self productCodes];

  if (!v7) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The [self productCodes] parameter must not be nil."];
  }
  v8 = [(VSApplicationAppleSubscription *)self productCodes];
  v9 = (void *)[v8 copy];
  uint64_t v10 = [(VSAppleSubscription *)v3 initWithCustomerID:v6 productCodes:v9];

  return v10;
}

+ (id)appleSubscriptionsFromApplicationAppleSubscriptions:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "appleSubscription", (void)v12);
        if (v10) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)applicationAppleSubscriptionsFromAppleSubscriptions:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        id v11 = objc_alloc((Class)objc_opt_class());
        long long v12 = objc_msgSend(v11, "initWithAppleSubscription:", v10, (void)v14);
        [v4 addObject:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

- (NSString)customerID
{
  return self->_customerID;
}

- (void)setCustomerID:(id)a3
{
}

- (NSArray)productCodes
{
  return self->_productCodes;
}

- (void)setProductCodes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productCodes, 0);

  objc_storeStrong((id *)&self->_customerID, 0);
}

@end