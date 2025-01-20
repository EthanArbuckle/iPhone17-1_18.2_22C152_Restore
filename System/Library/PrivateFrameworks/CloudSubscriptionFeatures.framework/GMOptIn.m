@interface GMOptIn
+ (_TtC25CloudSubscriptionFeatures7GMOptIn)shared;
- (BOOL)isOptedIn;
- (BOOL)isOptedInGlobalDomain;
- (_TtC25CloudSubscriptionFeatures7GMOptIn)init;
- (void)setIsOptedIn:(BOOL)a3;
@end

@implementation GMOptIn

- (BOOL)isOptedInGlobalDomain
{
  v2 = self;
  unsigned __int8 v3 = sub_1A8CB9C0C();

  return v3 & 1;
}

- (BOOL)isOptedIn
{
  v2 = self;
  char v3 = sub_1A8CB9D9C();

  return v3 & 1;
}

- (void)setIsOptedIn:(BOOL)a3
{
  v4 = self;
  sub_1A8CBA100(a3);
}

+ (_TtC25CloudSubscriptionFeatures7GMOptIn)shared
{
  id v2 = _s25CloudSubscriptionFeatures7GMOptInC7currentACSgvgZ_0();
  return (_TtC25CloudSubscriptionFeatures7GMOptIn *)v2;
}

- (_TtC25CloudSubscriptionFeatures7GMOptIn)init
{
  result = (_TtC25CloudSubscriptionFeatures7GMOptIn *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end