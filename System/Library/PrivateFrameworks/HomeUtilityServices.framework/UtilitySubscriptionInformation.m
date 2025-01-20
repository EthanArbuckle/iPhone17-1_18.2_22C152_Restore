@interface UtilitySubscriptionInformation
- (NSArray)customerAgreements;
- (NSString)startDate;
- (NSString)state;
- (NSString)subscriptionID;
- (_TtC19HomeUtilityServices22UtilityServiceLocation)serviceLocation;
- (_TtC19HomeUtilityServices30UtilitySubscriptionInformation)init;
- (_TtC19HomeUtilityServices30UtilitySubscriptionInformation)initWithSubscriptionID:(id)a3 state:(id)a4 startDate:(id)a5 serviceLocation:(id)a6 customerAgreements:(id)a7;
@end

@implementation UtilitySubscriptionInformation

- (NSString)subscriptionID
{
  return (NSString *)sub_25278CACC();
}

- (NSString)state
{
  return (NSString *)sub_25278CACC();
}

- (NSString)startDate
{
  return (NSString *)sub_25278CACC();
}

- (_TtC19HomeUtilityServices22UtilityServiceLocation)serviceLocation
{
  return (_TtC19HomeUtilityServices22UtilityServiceLocation *)*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC19HomeUtilityServices30UtilitySubscriptionInformation_serviceLocation);
}

- (NSArray)customerAgreements
{
  return (NSArray *)sub_2527958D8((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR____TtC19HomeUtilityServices30UtilitySubscriptionInformation_customerAgreements, (void (*)(void))type metadata accessor for UtilityCustomerAgreement);
}

- (_TtC19HomeUtilityServices30UtilitySubscriptionInformation)initWithSubscriptionID:(id)a3 state:(id)a4 startDate:(id)a5 serviceLocation:(id)a6 customerAgreements:(id)a7
{
  uint64_t v9 = sub_2528312A8();
  uint64_t v11 = v10;
  uint64_t v12 = sub_2528312A8();
  uint64_t v14 = v13;
  uint64_t v15 = sub_2528312A8();
  uint64_t v17 = v16;
  type metadata accessor for UtilityCustomerAgreement();
  v18 = (objc_class *)sub_2528314F8();
  v19 = (uint64_t *)((char *)self + OBJC_IVAR____TtC19HomeUtilityServices30UtilitySubscriptionInformation_subscriptionID);
  uint64_t *v19 = v9;
  v19[1] = v11;
  v20 = (uint64_t *)((char *)self + OBJC_IVAR____TtC19HomeUtilityServices30UtilitySubscriptionInformation_state);
  uint64_t *v20 = v12;
  v20[1] = v14;
  v21 = (uint64_t *)((char *)self + OBJC_IVAR____TtC19HomeUtilityServices30UtilitySubscriptionInformation_startDate);
  uint64_t *v21 = v15;
  v21[1] = v17;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC19HomeUtilityServices30UtilitySubscriptionInformation_serviceLocation) = (Class)a6;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC19HomeUtilityServices30UtilitySubscriptionInformation_customerAgreements) = v18;
  v24.receiver = self;
  v24.super_class = (Class)type metadata accessor for UtilitySubscriptionInformation();
  id v22 = a6;
  return [(UtilitySubscriptionInformation *)&v24 init];
}

- (_TtC19HomeUtilityServices30UtilitySubscriptionInformation)init
{
  result = (_TtC19HomeUtilityServices30UtilitySubscriptionInformation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19HomeUtilityServices30UtilitySubscriptionInformation_serviceLocation));

  swift_bridgeObjectRelease();
}

@end