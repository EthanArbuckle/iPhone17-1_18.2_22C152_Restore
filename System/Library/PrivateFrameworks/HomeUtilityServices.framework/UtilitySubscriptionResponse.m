@interface UtilitySubscriptionResponse
- (NSString)authorizationToken;
- (_TtC19HomeUtilityServices27UtilitySubscriptionResponse)init;
- (_TtC19HomeUtilityServices27UtilitySubscriptionResponse)initWithSubscription:(id)a3 authorizationToken:(id)a4;
- (_TtC19HomeUtilityServices30UtilitySubscriptionInformation)subscription;
@end

@implementation UtilitySubscriptionResponse

- (_TtC19HomeUtilityServices30UtilitySubscriptionInformation)subscription
{
  return (_TtC19HomeUtilityServices30UtilitySubscriptionInformation *)*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC19HomeUtilityServices27UtilitySubscriptionResponse_subscription);
}

- (NSString)authorizationToken
{
  return (NSString *)sub_25279A198((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC19HomeUtilityServices27UtilitySubscriptionResponse_authorizationToken);
}

- (_TtC19HomeUtilityServices27UtilitySubscriptionResponse)initWithSubscription:(id)a3 authorizationToken:(id)a4
{
  if (a4)
  {
    uint64_t v6 = sub_2528312A8();
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v7 = 0;
  }
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC19HomeUtilityServices27UtilitySubscriptionResponse_subscription) = (Class)a3;
  v8 = (uint64_t *)((char *)self + OBJC_IVAR____TtC19HomeUtilityServices27UtilitySubscriptionResponse_authorizationToken);
  uint64_t *v8 = v6;
  v8[1] = v7;
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for UtilitySubscriptionResponse();
  id v9 = a3;
  return [(UtilitySubscriptionResponse *)&v11 init];
}

- (_TtC19HomeUtilityServices27UtilitySubscriptionResponse)init
{
  result = (_TtC19HomeUtilityServices27UtilitySubscriptionResponse *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19HomeUtilityServices27UtilitySubscriptionResponse_subscription));

  swift_bridgeObjectRelease();
}

@end