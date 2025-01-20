@interface SKProductDiscountInternal
@end

@implementation SKProductDiscountInternal

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_subscriptionPeriod, 0);
  objc_storeStrong((id *)&self->_priceLocale, 0);

  objc_storeStrong((id *)&self->_price, 0);
}

@end