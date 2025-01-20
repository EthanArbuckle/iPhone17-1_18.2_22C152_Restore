@interface SKProductDiscount
- (NSDecimalNumber)price;
- (NSLocale)priceLocale;
- (NSString)identifier;
- (NSUInteger)numberOfPeriods;
- (SKProductDiscount)init;
- (SKProductDiscountPaymentMode)paymentMode;
- (SKProductDiscountType)type;
- (SKProductSubscriptionPeriod)subscriptionPeriod;
- (void)_setIdentifier:(id)a3;
- (void)_setNumberOfPeriods:(unint64_t)a3;
- (void)_setPaymentMode:(unint64_t)a3;
- (void)_setPrice:(id)a3;
- (void)_setPriceLocale:(id)a3;
- (void)_setSubscriptionPeriod:(id)a3;
- (void)_setType:(unint64_t)a3;
@end

@implementation SKProductDiscount

- (SKProductDiscount)init
{
  v6.receiver = self;
  v6.super_class = (Class)SKProductDiscount;
  v2 = [(SKProductDiscount *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(SKProductDiscountInternal);
    id internal = v2->_internal;
    v2->_id internal = v3;
  }
  return v2;
}

- (NSDecimalNumber)price
{
  return (NSDecimalNumber *)*((id *)self->_internal + 1);
}

- (NSLocale)priceLocale
{
  return (NSLocale *)*((id *)self->_internal + 2);
}

- (SKProductSubscriptionPeriod)subscriptionPeriod
{
  return (SKProductSubscriptionPeriod *)*((id *)self->_internal + 4);
}

- (NSUInteger)numberOfPeriods
{
  return *((void *)self->_internal + 5);
}

- (SKProductDiscountPaymentMode)paymentMode
{
  return *((void *)self->_internal + 3);
}

- (NSString)identifier
{
  return (NSString *)*((id *)self->_internal + 7);
}

- (SKProductDiscountType)type
{
  return *((void *)self->_internal + 6);
}

- (void)_setNumberOfPeriods:(unint64_t)a3
{
  *((void *)self->_internal + 5) = a3;
}

- (void)_setPaymentMode:(unint64_t)a3
{
  *((void *)self->_internal + 3) = a3;
}

- (void)_setPrice:(id)a3
{
  objc_storeStrong((id *)self->_internal + 1, a3);
  id v4 = a3;
}

- (void)_setPriceLocale:(id)a3
{
  objc_storeStrong((id *)self->_internal + 2, a3);
  id v4 = a3;
}

- (void)_setSubscriptionPeriod:(id)a3
{
  objc_storeStrong((id *)self->_internal + 4, a3);
  id v4 = a3;
}

- (void)_setIdentifier:(id)a3
{
  *((void *)self->_internal + 7) = [a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)_setType:(unint64_t)a3
{
  *((void *)self->_internal + 6) = a3;
}

- (void).cxx_destruct
{
}

@end