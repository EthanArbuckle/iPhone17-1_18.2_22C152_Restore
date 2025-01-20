@interface VoucherStore
- (VoucherStore)init;
@end

@implementation VoucherStore

- (VoucherStore)init
{
  v6.receiver = self;
  v6.super_class = (Class)VoucherStore;
  v2 = [(VoucherStore *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    vouchers = v2->_vouchers;
    v2->_vouchers = v3;
  }
  return v2;
}

- (void).cxx_destruct
{
}

@end