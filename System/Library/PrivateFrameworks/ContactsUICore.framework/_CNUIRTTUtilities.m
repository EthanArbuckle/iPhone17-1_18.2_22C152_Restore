@interface _CNUIRTTUtilities
- (BOOL)contactIsTTYContact:(id)a3;
- (BOOL)relayIsSupported;
- (RTTTelephonyUtilities)utilityProvider;
- (_CNUIRTTUtilities)init;
- (_CNUIRTTUtilities)initWithUtilityProvider:(id)a3;
- (id)nts_lazyUtilityProvider;
- (void)setUtilityProvider:(id)a3;
@end

@implementation _CNUIRTTUtilities

- (_CNUIRTTUtilities)init
{
  return [(_CNUIRTTUtilities *)self initWithUtilityProvider:0];
}

- (_CNUIRTTUtilities)initWithUtilityProvider:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_CNUIRTTUtilities;
  v6 = [(_CNUIRTTUtilities *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_utilityProvider, a3);
    v8 = v7;
  }

  return v7;
}

- (RTTTelephonyUtilities)utilityProvider
{
  v2 = cn_objectResultWithObjectLock();
  return (RTTTelephonyUtilities *)v2;
}

- (id)nts_lazyUtilityProvider
{
  utilityProvider = self->_utilityProvider;
  if (!utilityProvider)
  {
    v4 = [(objc_class *)getRTTTelephonyUtilitiesClass() sharedUtilityProvider];
    id v5 = self->_utilityProvider;
    self->_utilityProvider = v4;

    utilityProvider = self->_utilityProvider;
  }
  return utilityProvider;
}

- (BOOL)contactIsTTYContact:(id)a3
{
  id v4 = a3;
  id v5 = [(_CNUIRTTUtilities *)self utilityProvider];
  char v6 = [v5 contactIsTTYContact:v4];

  return v6;
}

- (BOOL)relayIsSupported
{
  v2 = [(_CNUIRTTUtilities *)self utilityProvider];
  char v3 = [v2 relayIsSupported];

  return v3;
}

- (void)setUtilityProvider:(id)a3
{
}

- (void).cxx_destruct
{
}

@end