@interface SKPaymentDiscount
- (NSNumber)timestamp;
- (NSString)identifier;
- (NSString)keyIdentifier;
- (NSString)signature;
- (NSUUID)nonce;
- (SKPaymentDiscount)initWithIdentifier:(NSString *)identifier keyIdentifier:(NSString *)keyIdentifier nonce:(NSUUID *)nonce signature:(NSString *)signature timestamp:(NSNumber *)timestamp;
@end

@implementation SKPaymentDiscount

- (SKPaymentDiscount)initWithIdentifier:(NSString *)identifier keyIdentifier:(NSString *)keyIdentifier nonce:(NSUUID *)nonce signature:(NSString *)signature timestamp:(NSNumber *)timestamp
{
  v12 = identifier;
  v13 = keyIdentifier;
  v14 = nonce;
  v15 = signature;
  v16 = timestamp;
  v17 = v16;
  if (v12 && v13 && v14 && v15 && v16)
  {
    v38.receiver = self;
    v38.super_class = (Class)SKPaymentDiscount;
    v18 = [(SKPaymentDiscount *)&v38 init];
    if (v18)
    {
      v19 = objc_alloc_init(SKPaymentDiscountInternal);
      id internal = v18->_internal;
      v18->_id internal = v19;

      uint64_t v21 = [(NSString *)v12 copy];
      v22 = v18->_internal;
      v23 = (void *)v22[1];
      v22[1] = v21;

      uint64_t v24 = [(NSString *)v13 copy];
      v25 = v18->_internal;
      v26 = (void *)v25[2];
      v25[2] = v24;

      uint64_t v27 = [(NSUUID *)v14 copy];
      v28 = v18->_internal;
      v29 = (void *)v28[3];
      v28[3] = v27;

      uint64_t v30 = [(NSString *)v15 copy];
      v31 = v18->_internal;
      v32 = (void *)v31[4];
      v31[4] = v30;

      uint64_t v33 = [(NSNumber *)v17 copy];
      v34 = v18->_internal;
      v35 = (void *)v34[5];
      v34[5] = v33;
    }
    self = v18;
    v36 = self;
  }
  else
  {
    NSLog(&cfstr_FoundNilParame.isa);
    v36 = 0;
  }

  return v36;
}

- (NSString)identifier
{
  return (NSString *)*((id *)self->_internal + 1);
}

- (NSString)keyIdentifier
{
  return (NSString *)*((id *)self->_internal + 2);
}

- (NSUUID)nonce
{
  return (NSUUID *)*((id *)self->_internal + 3);
}

- (NSString)signature
{
  return (NSString *)*((id *)self->_internal + 4);
}

- (NSNumber)timestamp
{
  return (NSNumber *)*((id *)self->_internal + 5);
}

- (void).cxx_destruct
{
}

@end