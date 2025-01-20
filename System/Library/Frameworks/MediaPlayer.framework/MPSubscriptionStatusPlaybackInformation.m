@interface MPSubscriptionStatusPlaybackInformation
- (BOOL)hasPlaybackCapability;
- (BOOL)isDefinitiveInformation;
- (BOOL)requiresCarrierManualVerification;
- (BOOL)shouldUseAccountLessStreaming;
- (BOOL)shouldUseLease;
- (MPSubscriptionStatusPlaybackInformation)initWithICSubscriptionStatus:(id)a3;
- (id)description;
@end

@implementation MPSubscriptionStatusPlaybackInformation

- (BOOL)shouldUseLease
{
  return self->_shouldUseLease;
}

- (void).cxx_destruct
{
}

- (MPSubscriptionStatusPlaybackInformation)initWithICSubscriptionStatus:(id)a3
{
  id v5 = a3;
  v6 = [(MPSubscriptionStatusPlaybackInformation *)self init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_subscriptionStatusObject, a3);
    uint64_t v8 = [v5 statusType];
    uint64_t v9 = [v5 carrierBundlingStatusType];
    uint64_t v10 = [v5 reasonType];
    if (v8 == 1)
    {
      uint64_t v11 = 17;
      uint64_t v12 = 16;
      uint64_t v13 = 19;
      if (v9 != 2 || v10) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
    if (v9 == 4)
    {
      uint64_t v11 = 16;
      uint64_t v12 = 18;
      goto LABEL_11;
    }
    if (v9 == 2)
    {
LABEL_8:
      uint64_t v11 = 16;
      uint64_t v12 = 17;
      uint64_t v13 = 20;
LABEL_9:
      *((unsigned char *)&v7->super.isa + v13) = 1;
LABEL_11:
      *((unsigned char *)&v7->super.isa + v12) = 1;
      *((unsigned char *)&v7->super.isa + v11) = 1;
    }
  }

  return v7;
}

- (BOOL)shouldUseAccountLessStreaming
{
  return self->_shouldUseAccountLessStreaming;
}

- (BOOL)requiresCarrierManualVerification
{
  return self->_requiresCarrierManualVerification;
}

- (BOOL)hasPlaybackCapability
{
  return self->_hasPlaybackCapability;
}

- (BOOL)isDefinitiveInformation
{
  return self->_definitiveInformation;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@ %p subscriptionStatusObject: %@>", v5, self, self->_subscriptionStatusObject];

  return v6;
}

@end