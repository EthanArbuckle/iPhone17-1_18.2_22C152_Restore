@interface TSSubscriptionAction
+ (id)subscriptionActionForSubscriptionSIMStatus:(id)a3;
- (NSString)carrierName;
- (NSString)phoneNumber;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)actionSubtype;
- (int64_t)actionType;
- (void)setCarrierName:(id)a3;
- (void)setPhoneNumber:(id)a3;
@end

@implementation TSSubscriptionAction

+ (id)subscriptionActionForSubscriptionSIMStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:kCTSIMSupportSIMStatusReady])
  {
    v4 = off_1000203D8;
LABEL_8:
    id v5 = objc_alloc_init(*v4);
    goto LABEL_9;
  }
  if ([v3 isEqualToString:kCTSIMSupportSIMStatusPINLocked])
  {
    v4 = off_1000203E0;
    goto LABEL_8;
  }
  if (([v3 isEqualToString:kCTSIMSupportSIMStatusPUKLocked] & 1) != 0
    || [v3 isEqualToString:kCTSIMSupportSIMStatusPermanentlyLocked])
  {
    v4 = &off_1000203E8;
    goto LABEL_8;
  }
  id v5 = 0;
LABEL_9:

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(NSString *)self->_phoneNumber copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(NSString *)self->_carrierName copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (int64_t)actionType
{
  return 0;
}

- (int64_t)actionSubtype
{
  return 0;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  unint64_t v4 = [(TSSubscriptionAction *)self actionType];
  if (v4 > 4) {
    CFStringRef v5 = @"???";
  }
  else {
    CFStringRef v5 = *(&off_100020848 + v4);
  }
  unint64_t v6 = [(TSSubscriptionAction *)self actionSubtype];
  if (v6 > 3) {
    CFStringRef v7 = @"???";
  }
  else {
    CFStringRef v7 = *(&off_100020870 + v6);
  }
  return +[NSString stringWithFormat:@"<%@: %p type:%@, sub.type:%@, mdn:%@, carrier:%@>", v3, self, v5, v7, self->_phoneNumber, self->_carrierName];
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
}

- (NSString)carrierName
{
  return self->_carrierName;
}

- (void)setCarrierName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_carrierName, 0);

  objc_storeStrong((id *)&self->_phoneNumber, 0);
}

@end