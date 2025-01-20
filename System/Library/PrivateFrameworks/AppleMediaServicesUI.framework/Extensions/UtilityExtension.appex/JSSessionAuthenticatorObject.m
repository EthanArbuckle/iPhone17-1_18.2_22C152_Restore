@interface JSSessionAuthenticatorObject
- (_TtC16UtilityExtension28JSSessionAuthenticatorObject)init;
- (id)getCredentials;
- (id)refreshBillingPlan;
- (id)signOut;
- (id)startSignInSession:(id)a3;
@end

@implementation JSSessionAuthenticatorObject

- (id)refreshBillingPlan
{
  v2 = self;
  v3 = (void *)sub_1000290B4();

  return v3;
}

- (id)getCredentials
{
  v2 = self;
  v3 = (void *)sub_100029E68();

  return v3;
}

- (id)startSignInSession:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = (void *)sub_10002A408();

  return v6;
}

- (id)signOut
{
  v2 = self;
  v3 = (void *)sub_10002AA08();

  return v3;
}

- (_TtC16UtilityExtension28JSSessionAuthenticatorObject)init
{
  return (_TtC16UtilityExtension28JSSessionAuthenticatorObject *)sub_10002B330();
}

@end