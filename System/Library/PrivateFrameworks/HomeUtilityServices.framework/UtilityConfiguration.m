@interface UtilityConfiguration
- (BOOL)missingDataRetryEnabled;
- (NSArray)tafFields;
- (NSArray)tafSections;
- (NSDictionary)alternateSuppliers;
- (NSString)name;
- (NSString)shortName;
- (NSString)termsAndAgreement;
- (NSURL)OAuthURL;
- (_TtC19HomeUtilityServices19UtilityOrganization)organizationInformation;
- (_TtC19HomeUtilityServices20UtilityConfiguration)init;
- (id)alternateSupplierNameFor:(id)a3;
- (int64_t)accessTokenValidity;
- (int64_t)authorizationRefreshPeriod;
- (int64_t)initialPollDelayInSeconds;
- (int64_t)refreshTokenValidity;
- (void)trustedAccountFingerprintEnabledWithCompletionHandler:(id)a3;
@end

@implementation UtilityConfiguration

- (NSString)name
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_252831298();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (NSString)shortName
{
  if (*(void *)&self->config[OBJC_IVAR____TtC19HomeUtilityServices20UtilityConfiguration_config + 296])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_252831298();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }

  return (NSString *)v2;
}

- (NSDictionary)alternateSuppliers
{
  v2 = self;
  uint64_t v3 = sub_252788B18();

  if (v3)
  {
    v4 = (void *)sub_252831218();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }

  return (NSDictionary *)v4;
}

- (id)alternateSupplierNameFor:(id)a3
{
  uint64_t v4 = sub_2528312A8();
  unint64_t v6 = v5;
  v7 = self;
  sub_252788D48(v4, v6);
  uint64_t v9 = v8;

  swift_bridgeObjectRelease();
  if (v9)
  {
    v10 = (void *)sub_252831298();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSArray)tafFields
{
  return (NSArray *)sub_25278940C(self, (uint64_t)a2, sub_25278918C, (void (*)(void))type metadata accessor for TAFField);
}

- (NSArray)tafSections
{
  return (NSArray *)sub_25278940C(self, (uint64_t)a2, sub_252789494, (void (*)(void))type metadata accessor for TAFSection);
}

- (NSURL)OAuthURL
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B22BD58);
  MEMORY[0x270FA5388](v3 - 8);
  unint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v6 = self;
  sub_252789760();

  uint64_t v7 = sub_252830BD8();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    uint64_t v9 = (void *)sub_252830B48();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }

  return (NSURL *)v9;
}

- (int64_t)accessTokenValidity
{
  uint64_t v2 = *(void *)&self->config[OBJC_IVAR____TtC19HomeUtilityServices20UtilityConfiguration_config + 88];
  int64_t result = 3600 * v2;
  if ((unsigned __int128)(v2 * (__int128)3600) >> 64 != (3600 * v2) >> 63) {
    __break(1u);
  }
  return result;
}

- (int64_t)refreshTokenValidity
{
  uint64_t v2 = *(void *)&self->config[OBJC_IVAR____TtC19HomeUtilityServices20UtilityConfiguration_config + 96];
  int64_t result = 3600 * v2;
  if ((unsigned __int128)(v2 * (__int128)3600) >> 64 != (3600 * v2) >> 63) {
    __break(1u);
  }
  return result;
}

- (NSString)termsAndAgreement
{
  swift_bridgeObjectRetain();
  uint64_t v2 = (void *)sub_252831298();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (_TtC19HomeUtilityServices19UtilityOrganization)organizationInformation
{
  uint64_t v2 = self;
  id v3 = sub_252789CF0();

  return (_TtC19HomeUtilityServices19UtilityOrganization *)v3;
}

- (int64_t)initialPollDelayInSeconds
{
  if (self->config[OBJC_IVAR____TtC19HomeUtilityServices20UtilityConfiguration_config + 208]) {
    return 60;
  }
  else {
    return *(void *)&self->config[OBJC_IVAR____TtC19HomeUtilityServices20UtilityConfiguration_config + 200];
  }
}

- (BOOL)missingDataRetryEnabled
{
  return self->config[OBJC_IVAR____TtC19HomeUtilityServices20UtilityConfiguration_config + 225] & 1;
}

- (int64_t)authorizationRefreshPeriod
{
  if (self->config[OBJC_IVAR____TtC19HomeUtilityServices20UtilityConfiguration_config + 224]) {
    return 0;
  }
  else {
    return *(void *)&self->config[OBJC_IVAR____TtC19HomeUtilityServices20UtilityConfiguration_config + 216];
  }
}

- (void)trustedAccountFingerprintEnabledWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C1D100);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_252831598();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_269C1D410;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_269C1D118;
  v12[5] = v11;
  v13 = self;
  sub_25281EC2C((uint64_t)v7, (uint64_t)&unk_269C1D120, (uint64_t)v12);
  swift_release();
}

- (_TtC19HomeUtilityServices20UtilityConfiguration)init
{
  int64_t result = (_TtC19HomeUtilityServices20UtilityConfiguration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  memcpy(v2, (char *)self + OBJC_IVAR____TtC19HomeUtilityServices20UtilityConfiguration_config, sizeof(v2));
  sub_252792DAC((uint64_t)v2);
}

@end