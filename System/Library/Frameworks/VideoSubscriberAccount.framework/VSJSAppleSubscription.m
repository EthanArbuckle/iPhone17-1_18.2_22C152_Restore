@interface VSJSAppleSubscription
+ (id)appleSubscriptionsFromJSAppleSubscriptions:(id)a3;
+ (id)jsAppleSubscriptionsFromAppleSubscriptions:(id)a3;
- (NSArray)productCodes;
- (NSString)customerID;
- (VSJSAppleSubscription)init;
- (VSJSAppleSubscription)initWithAppleSubscription:(id)a3;
- (id)appleSubscription;
- (void)setCustomerID:(id)a3;
- (void)setProductCodes:(id)a3;
@end

@implementation VSJSAppleSubscription

- (VSJSAppleSubscription)init
{
  v3.receiver = self;
  v3.super_class = (Class)VSJSAppleSubscription;
  return [(VSJSObject *)&v3 init];
}

- (VSJSAppleSubscription)initWithAppleSubscription:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VSJSAppleSubscription;
  v5 = [(VSJSObject *)&v13 init];
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
  id v4 = [(VSJSAppleSubscription *)self customerID];
  v5 = [(VSJSAppleSubscription *)self productCodes];
  v6 = [(VSAppleSubscription *)v3 initWithCustomerID:v4 productCodes:v5];

  return v6;
}

+ (id)appleSubscriptionsFromJSAppleSubscriptions:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "appleSubscription", (void)v10);
        if (v8) {
          [v3 addObject:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  return v3;
}

+ (id)jsAppleSubscriptionsFromAppleSubscriptions:(id)a3
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