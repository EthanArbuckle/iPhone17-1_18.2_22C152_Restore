@interface SKProduct
- (BOOL)downloadable;
- (BOOL)isDownloadable;
- (BOOL)isFamilyShareable;
- (NSArray)discounts;
- (NSArray)downloadContentLengths;
- (NSDecimalNumber)price;
- (NSLocale)priceLocale;
- (NSString)downloadContentVersion;
- (NSString)localizedDescription;
- (NSString)localizedTitle;
- (NSString)productIdentifier;
- (NSString)subscriptionGroupIdentifier;
- (SKProduct)init;
- (SKProductDiscount)introductoryPrice;
- (SKProductSubscriptionPeriod)subscriptionPeriod;
- (id)_productKind;
- (void)_setContentVersion:(id)a3;
- (void)_setDiscounts:(id)a3;
- (void)_setDownloadContentLengths:(id)a3;
- (void)_setDownloadable:(BOOL)a3;
- (void)_setFamilyShareable:(BOOL)a3;
- (void)_setIntroductoryPrice:(id)a3;
- (void)_setLocalizedDescription:(id)a3;
- (void)_setLocalizedTitle:(id)a3;
- (void)_setPrice:(id)a3;
- (void)_setPriceLocale:(id)a3;
- (void)_setProductIdentifier:(id)a3;
- (void)_setProductKind:(id)a3;
- (void)_setSubscriptionGroupIdentifier:(id)a3;
- (void)_setSubscriptionPeriod:(id)a3;
@end

@implementation SKProduct

- (NSString)productIdentifier
{
  return (NSString *)*((id *)self->_internal + 9);
}

- (SKProduct)init
{
  v6.receiver = self;
  v6.super_class = (Class)SKProduct;
  v2 = [(SKProduct *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(SKProductInternal);
    id internal = v2->_internal;
    v2->_id internal = v3;
  }
  return v2;
}

- (NSArray)downloadContentLengths
{
  return (NSArray *)*((id *)self->_internal + 3);
}

- (NSString)downloadContentVersion
{
  return (NSString *)*((id *)self->_internal + 1);
}

- (BOOL)isDownloadable
{
  return *((unsigned char *)self->_internal + 16);
}

- (BOOL)downloadable
{
  return *((unsigned char *)self->_internal + 16);
}

- (BOOL)isFamilyShareable
{
  return *((unsigned char *)self->_internal + 17);
}

- (SKProductDiscount)introductoryPrice
{
  return (SKProductDiscount *)*((id *)self->_internal + 4);
}

- (NSString)localizedDescription
{
  return (NSString *)*((id *)self->_internal + 5);
}

- (NSString)localizedTitle
{
  return (NSString *)*((id *)self->_internal + 6);
}

- (NSDecimalNumber)price
{
  return (NSDecimalNumber *)*((id *)self->_internal + 7);
}

- (NSLocale)priceLocale
{
  return (NSLocale *)*((id *)self->_internal + 8);
}

- (id)_productKind
{
  return *((id *)self->_internal + 10);
}

- (NSString)subscriptionGroupIdentifier
{
  return (NSString *)*((id *)self->_internal + 11);
}

- (SKProductSubscriptionPeriod)subscriptionPeriod
{
  return (SKProductSubscriptionPeriod *)*((id *)self->_internal + 12);
}

- (NSArray)discounts
{
  return (NSArray *)*((id *)self->_internal + 13);
}

- (void)_setContentVersion:(id)a3
{
  id internal = self->_internal;
  if ((id)internal[1] != a3)
  {
    v7 = internal;
    uint64_t v5 = [a3 copy];
    objc_super v6 = (void *)internal[1];
    internal[1] = v5;
  }
}

- (void)_setDownloadContentLengths:(id)a3
{
  id internal = self->_internal;
  if ((id)internal[3] != a3)
  {
    v7 = internal;
    uint64_t v5 = [a3 copy];
    objc_super v6 = (void *)internal[3];
    internal[3] = v5;
  }
}

- (void)_setDownloadable:(BOOL)a3
{
  *((unsigned char *)self->_internal + 16) = a3;
}

- (void)_setFamilyShareable:(BOOL)a3
{
  *((unsigned char *)self->_internal + 17) = a3;
}

- (void)_setIntroductoryPrice:(id)a3
{
  id v5 = a3;
  id internal = (char *)self->_internal;
  id v8 = (id)*((void *)internal + 4);
  v7 = (id *)(internal + 32);
  if (v8 != v5)
  {
    id v9 = v5;
    objc_storeStrong(v7, a3);
    id v5 = v9;
  }

  MEMORY[0x1F41817F8](v7, v5);
}

- (void)_setLocalizedDescription:(id)a3
{
  id internal = self->_internal;
  if ((id)internal[5] != a3)
  {
    v7 = internal;
    uint64_t v5 = [a3 copy];
    objc_super v6 = (void *)internal[5];
    internal[5] = v5;
  }
}

- (void)_setLocalizedTitle:(id)a3
{
  id internal = self->_internal;
  if ((id)internal[6] != a3)
  {
    v7 = internal;
    uint64_t v5 = [a3 copy];
    objc_super v6 = (void *)internal[6];
    internal[6] = v5;
  }
}

- (void)_setPrice:(id)a3
{
  id v5 = a3;
  id internal = (char *)self->_internal;
  id v8 = (id)*((void *)internal + 7);
  v7 = (id *)(internal + 56);
  if (v8 != v5)
  {
    id v9 = v5;
    objc_storeStrong(v7, a3);
    id v5 = v9;
  }

  MEMORY[0x1F41817F8](v7, v5);
}

- (void)_setPriceLocale:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_super v6 = (id *)self->_internal;
  if (v6[8] != v5) {
    objc_storeStrong(v6 + 8, a3);
  }
  [v6[4] _setPriceLocale:v5];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v6[13];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "_setPriceLocale:", v5, (void)v12);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)_setProductIdentifier:(id)a3
{
  id internal = self->_internal;
  if ((id)internal[9] != a3)
  {
    id v7 = internal;
    uint64_t v5 = [a3 copy];
    objc_super v6 = (void *)internal[9];
    internal[9] = v5;
  }
}

- (void)_setProductKind:(id)a3
{
  id internal = self->_internal;
  if ((id)internal[10] != a3)
  {
    id v7 = internal;
    uint64_t v5 = [a3 copy];
    objc_super v6 = (void *)internal[10];
    internal[10] = v5;
  }
}

- (void)_setSubscriptionGroupIdentifier:(id)a3
{
  id internal = self->_internal;
  if ((id)internal[11] != a3)
  {
    id v7 = internal;
    uint64_t v5 = [a3 copy];
    objc_super v6 = (void *)internal[11];
    internal[11] = v5;
  }
}

- (void)_setSubscriptionPeriod:(id)a3
{
  id v5 = a3;
  id internal = (char *)self->_internal;
  id v8 = (id)*((void *)internal + 12);
  id v7 = (id *)(internal + 96);
  if (v8 != v5)
  {
    id v9 = v5;
    objc_storeStrong(v7, a3);
    id v5 = v9;
  }

  MEMORY[0x1F41817F8](v7, v5);
}

- (void)_setDiscounts:(id)a3
{
  uint64_t v4 = [a3 copy];
  id internal = self->_internal;
  uint64_t v6 = internal[13];
  internal[13] = v4;

  MEMORY[0x1F41817F8](v4, v6);
}

- (void).cxx_destruct
{
}

@end