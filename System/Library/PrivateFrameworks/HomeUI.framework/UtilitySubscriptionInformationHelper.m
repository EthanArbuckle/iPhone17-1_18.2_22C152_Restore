@interface UtilitySubscriptionInformationHelper
- (NSArray)accountIds;
- (NSDictionary)serviceLocation;
- (NSString)subscriptionID;
- (_TtC6HomeUI36UtilitySubscriptionInformationHelper)init;
- (_TtC6HomeUI36UtilitySubscriptionInformationHelper)initWithSubscriptionID:(id)a3 serviceLocation:(id)a4 accountIds:(id)a5;
@end

@implementation UtilitySubscriptionInformationHelper

- (NSString)subscriptionID
{
  return (NSString *)sub_1BE4D16E4();
}

- (NSDictionary)serviceLocation
{
  sub_1BE9C36A8();
  v2 = (void *)sub_1BE9C48E8();
  swift_bridgeObjectRelease();

  return (NSDictionary *)v2;
}

- (NSArray)accountIds
{
  sub_1BE9C36A8();
  v2 = (void *)sub_1BE9C4BF8();
  swift_bridgeObjectRelease();

  return (NSArray *)v2;
}

- (_TtC6HomeUI36UtilitySubscriptionInformationHelper)initWithSubscriptionID:(id)a3 serviceLocation:(id)a4 accountIds:(id)a5
{
  uint64_t v6 = sub_1BE9C49F8();
  uint64_t v8 = v7;
  v9 = (objc_class *)sub_1BE9C4908();
  v10 = (objc_class *)sub_1BE9C4C18();
  v11 = (uint64_t *)((char *)self + OBJC_IVAR____TtC6HomeUI36UtilitySubscriptionInformationHelper_subscriptionID);
  uint64_t *v11 = v6;
  v11[1] = v8;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC6HomeUI36UtilitySubscriptionInformationHelper_serviceLocation) = v9;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC6HomeUI36UtilitySubscriptionInformationHelper_accountIds) = v10;
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for UtilitySubscriptionInformationHelper();
  return [(UtilitySubscriptionInformationHelper *)&v13 init];
}

- (_TtC6HomeUI36UtilitySubscriptionInformationHelper)init
{
  result = (_TtC6HomeUI36UtilitySubscriptionInformationHelper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end