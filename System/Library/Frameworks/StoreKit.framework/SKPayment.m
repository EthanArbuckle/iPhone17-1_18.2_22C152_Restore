@interface SKPayment
+ (SKPayment)paymentWithProduct:(SKProduct *)product;
+ (id)paymentFromPurchaseIntentWithProduct:(id)a3;
+ (id)paymentWithProductIdentifier:(NSString *)identifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)isStoreOriginated;
- (BOOL)simulatesAskToBuyInSandbox;
- (NSData)requestData;
- (NSDictionary)requestParameters;
- (NSInteger)quantity;
- (NSString)applicationUsername;
- (NSString)partnerIdentifier;
- (NSString)partnerTransactionIdentifier;
- (NSString)productIdentifier;
- (NSString)productKind;
- (SKPayment)init;
- (SKPaymentAppleIDAuthorizationRequest)appleIDAuthorizationClientInfo;
- (SKPaymentDiscount)paymentDiscount;
- (SKProductSubscriptionPeriod)subscriptionPeriod;
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation SKPayment

- (SKPayment)init
{
  v6.receiver = self;
  v6.super_class = (Class)SKPayment;
  v2 = [(SKPayment *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(SKPaymentInternal);
    id internal = v2->_internal;
    v2->_id internal = v3;
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[SKPayment allocWithZone:](SKPayment, "allocWithZone:") init];
  uint64_t v6 = [self->_internal copyWithZone:a3];
  id internal = v5->_internal;
  v5->_id internal = (id)v6;

  return v5;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v5 = [(SKPayment *)+[SKMutablePayment allocWithZone:](SKMutablePayment, "allocWithZone:") init];
  uint64_t v6 = [self->_internal copyWithZone:a3];
  id internal = v5->super._internal;
  v5->super._id internal = (id)v6;

  return v5;
}

+ (SKPayment)paymentWithProduct:(SKProduct *)product
{
  v4 = product;
  v5 = (id *)objc_alloc_init((Class)a1);
  uint64_t v6 = v5[1];
  v7 = [(SKProduct *)v4 productIdentifier];
  uint64_t v8 = [v7 copy];
  v9 = (void *)v6[4];
  v6[4] = v8;

  v10 = [(SKProduct *)v4 _productKind];
  uint64_t v11 = [v10 copy];
  v12 = (void *)v6[5];
  v6[5] = v11;

  uint64_t v13 = [(SKProduct *)v4 subscriptionPeriod];
  v14 = (void *)v6[10];
  v6[10] = v13;

  if (__currentPurchaseIntentProductIdentifier)
  {
    v15 = [(SKProduct *)v4 productIdentifier];
    int v16 = [v15 isEqualToString:__currentPurchaseIntentProductIdentifier];

    if (v16) {
      *((unsigned char *)v6 + 88) = 1;
    }
  }

  return (SKPayment *)v5;
}

+ (id)paymentFromPurchaseIntentWithProduct:(id)a3
{
  id v4 = a3;
  v5 = (id *)objc_alloc_init((Class)a1);
  uint64_t v6 = v5[1];
  v7 = [v4 productIdentifier];
  uint64_t v8 = [v7 copy];
  v9 = (void *)v6[4];
  v6[4] = v8;

  *((unsigned char *)v6 + 88) = 1;
  v10 = (void *)__currentPurchaseIntentProductIdentifier;
  if (__currentPurchaseIntentProductIdentifier)
  {
    __currentPurchaseIntentProductIdentifier = 0;
  }
  uint64_t v11 = [v4 productIdentifier];
  uint64_t v12 = [v11 copy];
  uint64_t v13 = (void *)__currentPurchaseIntentProductIdentifier;
  __currentPurchaseIntentProductIdentifier = v12;

  return v5;
}

+ (id)paymentWithProductIdentifier:(NSString *)identifier
{
  id v4 = identifier;
  v5 = (id *)objc_alloc_init((Class)a1);
  uint64_t v6 = v5[1];
  uint64_t v7 = [(NSString *)v4 copy];

  uint64_t v8 = (void *)v6[4];
  v6[4] = v7;

  return v5;
}

- (NSString)applicationUsername
{
  return (NSString *)*((id *)self->_internal + 1);
}

- (unint64_t)hash
{
  id v3 = *((id *)self->_internal + 4);
  id v4 = v3;
  if (v3)
  {
    id v5 = (id)[v3 hash];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SKPayment;
    id v5 = [(SKPayment *)&v8 hash];
  }
  unint64_t v6 = (unint64_t)v5;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  int v5 = (objc_opt_isKindOfClass() & 1) != 0 && *((void *)self->_internal + 6) == *(void *)(v4[1] + 48);
  id v6 = *((id *)self->_internal + 4);
  id v7 = *(id *)(v4[1] + 32);
  objc_super v8 = v7;
  if (v5)
  {
    if (v6 == v7) {
      LOBYTE(v5) = 1;
    }
    else {
      LOBYTE(v5) = [v6 isEqualToString:v7];
    }
  }

  return v5;
}

- (NSString)productIdentifier
{
  return (NSString *)*((id *)self->_internal + 4);
}

- (NSInteger)quantity
{
  return *((void *)self->_internal + 6);
}

- (NSData)requestData
{
  return (NSData *)*((id *)self->_internal + 7);
}

- (BOOL)simulatesAskToBuyInSandbox
{
  return *((unsigned char *)self->_internal + 72);
}

- (SKPaymentDiscount)paymentDiscount
{
  return (SKPaymentDiscount *)*((id *)self->_internal + 12);
}

- (BOOL)isStoreOriginated
{
  return *((unsigned char *)self->_internal + 88);
}

- (NSString)partnerIdentifier
{
  return (NSString *)*((id *)self->_internal + 2);
}

- (NSString)partnerTransactionIdentifier
{
  return (NSString *)*((id *)self->_internal + 3);
}

- (NSString)productKind
{
  return (NSString *)*((id *)self->_internal + 5);
}

- (NSDictionary)requestParameters
{
  return (NSDictionary *)*((id *)self->_internal + 8);
}

- (SKProductSubscriptionPeriod)subscriptionPeriod
{
  return (SKProductSubscriptionPeriod *)*((id *)self->_internal + 10);
}

- (SKPaymentAppleIDAuthorizationRequest)appleIDAuthorizationClientInfo
{
  return (SKPaymentAppleIDAuthorizationRequest *)*((id *)self->_internal + 13);
}

- (void).cxx_destruct
{
}

@end