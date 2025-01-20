@interface UtilityCustomerAgreement
- (NSArray)meters;
- (NSArray)programs;
- (NSString)accountID;
- (NSString)alternateSupplier;
- (NSString)customerAgreementID;
- (_TtC19HomeUtilityServices24UtilityCustomerAgreement)init;
- (_TtC19HomeUtilityServices24UtilityCustomerAgreement)initWithCustomerAgreementID:(id)a3 accountID:(id)a4 meters:(id)a5 programs:(id)a6 alternateSupplier:(id)a7;
- (void)setAlternateSupplier:(id)a3;
@end

@implementation UtilityCustomerAgreement

- (NSString)customerAgreementID
{
  return (NSString *)sub_25278CACC();
}

- (NSString)accountID
{
  return (NSString *)sub_25278CACC();
}

- (NSArray)programs
{
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC19HomeUtilityServices24UtilityCustomerAgreement_programs))
  {
    type metadata accessor for UtilityProgram();
    swift_bridgeObjectRetain();
    v2 = (void *)sub_2528314E8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }

  return (NSArray *)v2;
}

- (NSArray)meters
{
  return (NSArray *)sub_2527958D8((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR____TtC19HomeUtilityServices24UtilityCustomerAgreement_meters, (void (*)(void))type metadata accessor for UtilityMeter);
}

- (NSString)alternateSupplier
{
  v2 = (char *)self + OBJC_IVAR____TtC19HomeUtilityServices24UtilityCustomerAgreement_alternateSupplier;
  swift_beginAccess();
  if (*((void *)v2 + 1))
  {
    swift_bridgeObjectRetain();
    v3 = (void *)sub_252831298();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }

  return (NSString *)v3;
}

- (void)setAlternateSupplier:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_2528312A8();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC19HomeUtilityServices24UtilityCustomerAgreement_alternateSupplier);
  swift_beginAccess();
  uint64_t *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (_TtC19HomeUtilityServices24UtilityCustomerAgreement)initWithCustomerAgreementID:(id)a3 accountID:(id)a4 meters:(id)a5 programs:(id)a6 alternateSupplier:(id)a7
{
  uint64_t v10 = sub_2528312A8();
  uint64_t v12 = v11;
  uint64_t v13 = sub_2528312A8();
  uint64_t v15 = v14;
  type metadata accessor for UtilityMeter();
  v16 = (objc_class *)sub_2528314F8();
  if (a6)
  {
    type metadata accessor for UtilityProgram();
    a6 = (id)sub_2528314F8();
  }
  if (a7)
  {
    a7 = (id)sub_2528312A8();
    v18 = v17;
  }
  else
  {
    v18 = 0;
  }
  v19 = (id *)((char *)&self->super.isa
             + OBJC_IVAR____TtC19HomeUtilityServices24UtilityCustomerAgreement_alternateSupplier);
  id *v19 = 0;
  v19[1] = 0;
  v20 = (uint64_t *)((char *)self + OBJC_IVAR____TtC19HomeUtilityServices24UtilityCustomerAgreement_customerAgreementID);
  uint64_t *v20 = v10;
  v20[1] = v12;
  v21 = (uint64_t *)((char *)self + OBJC_IVAR____TtC19HomeUtilityServices24UtilityCustomerAgreement_accountID);
  uint64_t *v21 = v13;
  v21[1] = v15;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC19HomeUtilityServices24UtilityCustomerAgreement_programs) = (Class)a6;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC19HomeUtilityServices24UtilityCustomerAgreement_meters) = v16;
  swift_beginAccess();
  id *v19 = a7;
  v19[1] = v18;
  swift_bridgeObjectRelease();
  v23.receiver = self;
  v23.super_class = (Class)type metadata accessor for UtilityCustomerAgreement();
  return [(UtilityCustomerAgreement *)&v23 init];
}

- (_TtC19HomeUtilityServices24UtilityCustomerAgreement)init
{
  result = (_TtC19HomeUtilityServices24UtilityCustomerAgreement *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end