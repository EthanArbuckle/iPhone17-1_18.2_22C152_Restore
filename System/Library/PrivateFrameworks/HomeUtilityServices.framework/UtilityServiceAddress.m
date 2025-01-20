@interface UtilityServiceAddress
- (NSString)addressLine1;
- (NSString)addressLine2;
- (NSString)addressLine3;
- (NSString)city;
- (NSString)country;
- (NSString)postalCode;
- (NSString)state;
- (_TtC19HomeUtilityServices21UtilityServiceAddress)init;
- (_TtC19HomeUtilityServices21UtilityServiceAddress)initWithAddressLine1:(id)a3 addressLine2:(id)a4 addressLine3:(id)a5 city:(id)a6 state:(id)a7 postalCode:(id)a8 country:(id)a9;
- (id)data;
@end

@implementation UtilityServiceAddress

- (NSString)addressLine1
{
  return (NSString *)sub_25278CACC();
}

- (NSString)addressLine2
{
  return (NSString *)sub_25279A198((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC19HomeUtilityServices21UtilityServiceAddress_addressLine2);
}

- (NSString)addressLine3
{
  return (NSString *)sub_25279A198((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC19HomeUtilityServices21UtilityServiceAddress_addressLine3);
}

- (NSString)city
{
  return (NSString *)sub_25278CACC();
}

- (NSString)state
{
  return (NSString *)sub_25278CACC();
}

- (NSString)postalCode
{
  return (NSString *)sub_25278CACC();
}

- (NSString)country
{
  return (NSString *)sub_25278CACC();
}

- (_TtC19HomeUtilityServices21UtilityServiceAddress)initWithAddressLine1:(id)a3 addressLine2:(id)a4 addressLine3:(id)a5 city:(id)a6 state:(id)a7 postalCode:(id)a8 country:(id)a9
{
  uint64_t v12 = sub_2528312A8();
  uint64_t v38 = v13;
  uint64_t v39 = v12;
  if (!a4)
  {
    uint64_t v37 = 0;
    uint64_t v15 = 0;
    if (a5) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v16 = 0;
    goto LABEL_6;
  }
  uint64_t v37 = sub_2528312A8();
  uint64_t v15 = v14;
  if (!a5) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v16 = sub_2528312A8();
  a5 = v17;
LABEL_6:
  uint64_t v18 = sub_2528312A8();
  uint64_t v20 = v19;
  uint64_t v21 = sub_2528312A8();
  uint64_t v23 = v22;
  uint64_t v24 = sub_2528312A8();
  uint64_t v26 = v25;
  uint64_t v27 = sub_2528312A8();
  v28 = (uint64_t *)((char *)self + OBJC_IVAR____TtC19HomeUtilityServices21UtilityServiceAddress_addressLine1);
  uint64_t *v28 = v39;
  v28[1] = v38;
  v29 = (uint64_t *)((char *)self + OBJC_IVAR____TtC19HomeUtilityServices21UtilityServiceAddress_addressLine2);
  uint64_t *v29 = v37;
  v29[1] = v15;
  v30 = (uint64_t *)((char *)self + OBJC_IVAR____TtC19HomeUtilityServices21UtilityServiceAddress_addressLine3);
  uint64_t *v30 = v16;
  v30[1] = (uint64_t)a5;
  v31 = (uint64_t *)((char *)self + OBJC_IVAR____TtC19HomeUtilityServices21UtilityServiceAddress_city);
  uint64_t *v31 = v18;
  v31[1] = v20;
  v32 = (uint64_t *)((char *)self + OBJC_IVAR____TtC19HomeUtilityServices21UtilityServiceAddress_state);
  uint64_t *v32 = v21;
  v32[1] = v23;
  v33 = (uint64_t *)((char *)self + OBJC_IVAR____TtC19HomeUtilityServices21UtilityServiceAddress_postalCode);
  uint64_t *v33 = v24;
  v33[1] = v26;
  v34 = (uint64_t *)((char *)self + OBJC_IVAR____TtC19HomeUtilityServices21UtilityServiceAddress_country);
  uint64_t *v34 = v27;
  v34[1] = v35;
  v40.receiver = self;
  v40.super_class = (Class)type metadata accessor for UtilityServiceAddress();
  return [(UtilityServiceAddress *)&v40 init];
}

- (_TtC19HomeUtilityServices21UtilityServiceAddress)init
{
  result = (_TtC19HomeUtilityServices21UtilityServiceAddress *)_swift_stdlib_reportUnimplementedInitializer();
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
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (id)data
{
  v2 = self;
  uint64_t v3 = sub_2527DBE44();
  unint64_t v5 = v4;

  if (v5 >> 60 == 15)
  {
    v6 = 0;
  }
  else
  {
    v6 = (void *)sub_252830C48();
    sub_252783CC0(v3, v5);
  }

  return v6;
}

@end