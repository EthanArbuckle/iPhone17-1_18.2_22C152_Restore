@interface FTSelectedPNRSubscriptionCache
- (CTXPCContexts)activeSubscriptionInfo;
- (CTXPCServiceSubscriptionContext)selectedContext;
- (CTXPCServiceSubscriptionInfo)subscriptionInfo;
- (NSString)phoneNumber;
- (id)debugDescription;
- (int64_t)dualSIMCapability;
- (void)setActiveSubscriptionInfo:(id)a3;
- (void)setDualSIMCapability:(int64_t)a3;
- (void)setPhoneNumber:(id)a3;
- (void)setSelectedContext:(id)a3;
- (void)setSubscriptionInfo:(id)a3;
@end

@implementation FTSelectedPNRSubscriptionCache

- (CTXPCServiceSubscriptionInfo)subscriptionInfo
{
  return self->_subscriptionInfo;
}

- (void)setSubscriptionInfo:(id)a3
{
}

- (void)setSelectedContext:(id)a3
{
}

- (void)setPhoneNumber:(id)a3
{
}

- (void)setDualSIMCapability:(int64_t)a3
{
  self->_dualSIMCapability = a3;
}

- (void)setActiveSubscriptionInfo:(id)a3
{
}

- (CTXPCServiceSubscriptionContext)selectedContext
{
  return self->_selectedContext;
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (int64_t)dualSIMCapability
{
  return self->_dualSIMCapability;
}

- (CTXPCContexts)activeSubscriptionInfo
{
  return self->_activeSubscriptionInfo;
}

- (id)debugDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v7 = objc_msgSend_phoneNumber(self, v5, v6);
  uint64_t v10 = objc_msgSend_dualSIMCapability(self, v8, v9);
  v13 = objc_msgSend_selectedContext(self, v11, v12);
  v16 = objc_msgSend_subscriptionInfo(self, v14, v15);
  v19 = objc_msgSend_activeSubscriptionInfo(self, v17, v18);
  v21 = objc_msgSend_stringWithFormat_(v3, v20, @"<%@: %p phoneNumber: %@, dualSIMCapability: %ld, selectedContext: %@, subsriptionInfo: %@, activeSubscriptionInfo: %@>", v4, self, v7, v10, v13, v16, v19);

  return v21;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_selectedContext, 0);
  objc_storeStrong((id *)&self->_activeSubscriptionInfo, 0);

  objc_storeStrong((id *)&self->_subscriptionInfo, 0);
}

@end