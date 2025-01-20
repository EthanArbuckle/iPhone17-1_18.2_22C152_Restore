@interface JSSessionAuthenticatorObject
- (_TtC34AppleMediaServicesUIDynamicService28JSSessionAuthenticatorObject)init;
- (id)getCredentials;
- (id)refreshBillingPlan;
- (id)signOut;
- (id)startSignInSession:(id)a3;
@end

@implementation JSSessionAuthenticatorObject

- (id)refreshBillingPlan
{
  v2 = self;
  v3 = (void *)sub_10002834C();

  return v3;
}

- (id)getCredentials
{
  v2 = self;
  v3 = (void *)sub_100029100();

  return v3;
}

- (id)startSignInSession:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = (void *)sub_1000296A0();

  return v6;
}

- (id)signOut
{
  v2 = self;
  v3 = (void *)sub_100029CA0();

  return v3;
}

- (_TtC34AppleMediaServicesUIDynamicService28JSSessionAuthenticatorObject)init
{
  return (_TtC34AppleMediaServicesUIDynamicService28JSSessionAuthenticatorObject *)sub_10002A5C8();
}

@end