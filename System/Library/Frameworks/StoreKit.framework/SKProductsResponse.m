@interface SKProductsResponse
- (NSArray)invalidProductIdentifiers;
- (NSArray)products;
- (SKProductsResponse)init;
- (void)_setInvalidIdentifiers:(id)a3;
- (void)_setProducts:(id)a3;
@end

@implementation SKProductsResponse

- (void)_setProducts:(id)a3
{
  internal = self->_internal;
  if ((id)internal[2] != a3)
  {
    v7 = internal;
    uint64_t v5 = [a3 copy];
    v6 = (void *)internal[2];
    internal[2] = v5;
  }
}

- (void)_setInvalidIdentifiers:(id)a3
{
  internal = self->_internal;
  if ((id)internal[1] != a3)
  {
    v7 = internal;
    uint64_t v5 = [a3 copy];
    v6 = (void *)internal[1];
    internal[1] = v5;
  }
}

- (NSArray)products
{
  return (NSArray *)*((id *)self->_internal + 2);
}

- (NSArray)invalidProductIdentifiers
{
  return (NSArray *)*((id *)self->_internal + 1);
}

- (SKProductsResponse)init
{
  v6.receiver = self;
  v6.super_class = (Class)SKProductsResponse;
  v2 = [(SKProductsResponse *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(SKProductsResponseInternal);
    id internal = v2->_internal;
    v2->_id internal = v3;
  }
  return v2;
}

- (void).cxx_destruct
{
}

@end