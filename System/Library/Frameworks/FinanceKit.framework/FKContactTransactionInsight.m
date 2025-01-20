@interface FKContactTransactionInsight
- (BOOL)isEqual:(id)a3;
- (FKContactTransactionInsight)initWithPeerPaymentCounterpartHandle:(id)a3;
- (NSString)peerPaymentCounterpartHandle;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation FKContactTransactionInsight

- (FKContactTransactionInsight)initWithPeerPaymentCounterpartHandle:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FKContactTransactionInsight;
  v5 = [(FKContactTransactionInsight *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    peerPaymentCounterpartHandle = v5->_peerPaymentCounterpartHandle;
    v5->_peerPaymentCounterpartHandle = (NSString *)v6;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v6 = [(NSString *)self->_peerPaymentCounterpartHandle copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  [v3 safelyAddObject:self->_peerPaymentCounterpartHandle];
  unint64_t v4 = FKCombinedHash(17, v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (FKContactTransactionInsight *)a3;
  p_isa = (void **)&v4->super.isa;
  if (self == v4)
  {
    char v6 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char v6 = FKEqualObjects(self->_peerPaymentCounterpartHandle, p_isa[1]);
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (NSString)peerPaymentCounterpartHandle
{
  return self->_peerPaymentCounterpartHandle;
}

- (void).cxx_destruct
{
}

@end