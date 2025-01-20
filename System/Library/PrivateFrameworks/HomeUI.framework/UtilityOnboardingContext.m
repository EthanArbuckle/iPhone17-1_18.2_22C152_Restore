@interface UtilityOnboardingContext
- (BOOL)allRequiredFieldsComplete;
- (BOOL)didAttemptPasswordlessMethod;
- (BOOL)quickLookupHasAllFields;
- (BOOL)showInvalidEmailAlert;
- (HMHome)home;
- (HUUtilityConfigurationHelper)config;
- (NSArray)allUtilities;
- (NSArray)otpFactors;
- (NSDictionary)tafResponses;
- (NSDictionary)tokens;
- (NSString)utilityID;
- (UIImage)utilityLogo;
- (_TtC6HomeUI24UtilityOnboardingContext)init;
- (_TtC6HomeUI24UtilityOnboardingContext)initWithHome:(id)a3;
- (int64_t)onboardingMethod;
- (void)createAccessTokenWithAuthCode:(NSString *)a3 completionHandler:(id)a4;
- (void)populateFieldsFromMeContact;
- (void)requestOTPWithCompletionHandler:(id)a3;
- (void)setAllUtilities:(id)a3;
- (void)setConfig:(id)a3;
- (void)setDidAttemptPasswordlessMethod:(BOOL)a3;
- (void)setOnboardingMethod:(int64_t)a3;
- (void)setOtpFactors:(id)a3;
- (void)setResponseFor:(id)a3 value:(id)a4;
- (void)setSelectedOTPMethodWithFactor:(id)a3;
- (void)setTafResponses:(id)a3;
- (void)setTokens:(id)a3;
- (void)setUtilityID:(id)a3;
- (void)setUtilityLogo:(id)a3;
- (void)updateIconWithHeaderView:(id)a3 axID:(id)a4;
- (void)verifyAddressAndSubmitTAFWithCompletionHandler:(id)a3;
@end

@implementation UtilityOnboardingContext

- (HMHome)home
{
  return (HMHome *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                           + OBJC_IVAR____TtC6HomeUI24UtilityOnboardingContext_home));
}

- (_TtC6HomeUI24UtilityOnboardingContext)initWithHome:(id)a3
{
  id v3 = a3;
  v4 = (_TtC6HomeUI24UtilityOnboardingContext *)sub_1BE39D554(v3);

  return v4;
}

- (NSString)utilityID
{
  v2 = (char *)self + OBJC_IVAR____TtC6HomeUI24UtilityOnboardingContext_utilityID;
  swift_beginAccess();
  if (*((void *)v2 + 1))
  {
    sub_1BE9C36A8();
    id v3 = (void *)sub_1BE9C49B8();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v3 = 0;
  }

  return (NSString *)v3;
}

- (void)setUtilityID:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_1BE9C49F8();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC6HomeUI24UtilityOnboardingContext_utilityID);
  swift_beginAccess();
  uint64_t *v7 = v4;
  v7[1] = v6;
  v8 = self;
  swift_bridgeObjectRelease();
  sub_1BE387884(MEMORY[0x1E4FBD390], &OBJC_IVAR____TtC6HomeUI24UtilityOnboardingContext_utilityID, "Setting utility id %s");
}

- (HUUtilityConfigurationHelper)config
{
  return (HUUtilityConfigurationHelper *)sub_1BE3840E0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC6HomeUI24UtilityOnboardingContext_config);
}

- (void)setConfig:(id)a3
{
}

- (UIImage)utilityLogo
{
  return (UIImage *)sub_1BE3840E0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC6HomeUI24UtilityOnboardingContext_utilityLogo);
}

- (void)setUtilityLogo:(id)a3
{
}

- (NSArray)allUtilities
{
  return (NSArray *)sub_1BE387248();
}

- (void)setAllUtilities:(id)a3
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA116050);
  uint64_t v4 = sub_1BE9C4C18();
  uint64_t v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC6HomeUI24UtilityOnboardingContext_allUtilities);
  swift_beginAccess();
  *uint64_t v5 = v4;
  swift_bridgeObjectRelease();
}

- (NSDictionary)tafResponses
{
  return (NSDictionary *)sub_1BE38827C();
}

- (void)setTafResponses:(id)a3
{
}

- (int64_t)onboardingMethod
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR____TtC6HomeUI24UtilityOnboardingContext_onboardingMethod);
  swift_beginAccess();
  return *v2;
}

- (void)setOnboardingMethod:(int64_t)a3
{
  uint64_t v4 = (int64_t *)((char *)self + OBJC_IVAR____TtC6HomeUI24UtilityOnboardingContext_onboardingMethod);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (BOOL)didAttemptPasswordlessMethod
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC6HomeUI24UtilityOnboardingContext_didAttemptPasswordlessMethod;
  swift_beginAccess();
  return *v2;
}

- (void)setDidAttemptPasswordlessMethod:(BOOL)a3
{
  uint64_t v4 = (BOOL *)self + OBJC_IVAR____TtC6HomeUI24UtilityOnboardingContext_didAttemptPasswordlessMethod;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (void)setResponseFor:(id)a3 value:(id)a4
{
}

- (void)populateFieldsFromMeContact
{
  v2 = self;
  sub_1BE386260();
}

- (BOOL)allRequiredFieldsComplete
{
  v2 = self;
  char v3 = sub_1BE386C14();

  return v3 & 1;
}

- (BOOL)quickLookupHasAllFields
{
  v2 = self;
  char v3 = sub_1BE386D18();

  return v3 & 1;
}

- (BOOL)showInvalidEmailAlert
{
  v2 = self;
  char v3 = sub_1BE386FCC();

  return v3 & 1;
}

- (NSArray)otpFactors
{
  return (NSArray *)sub_1BE387248();
}

- (void)setOtpFactors:(id)a3
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA116050);
  uint64_t v4 = sub_1BE9C4C18();
  uint64_t v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC6HomeUI24UtilityOnboardingContext_otpFactors);
  swift_beginAccess();
  *uint64_t v5 = v4;
  uint64_t v6 = self;
  swift_bridgeObjectRelease();
  sub_1BE38855C(MEMORY[0x1E4FBD390], &OBJC_IVAR____TtC6HomeUI24UtilityOnboardingContext_otpFactors, "Setting factors %s");
}

- (NSDictionary)tokens
{
  return (NSDictionary *)sub_1BE38827C();
}

- (void)setTokens:(id)a3
{
}

- (void)setSelectedOTPMethodWithFactor:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1BE388DDC(v4);
}

- (void)verifyAddressAndSubmitTAFWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBA46780);
  MEMORY[0x1F4188790](v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_1BE9C4DD8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1EA113268;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1EA113270;
  v12[5] = v11;
  v13 = self;
  sub_1BE5AF20C((uint64_t)v7, (uint64_t)&unk_1EA113278, (uint64_t)v12);
  swift_release();
}

- (void)requestOTPWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBA46780);
  MEMORY[0x1F4188790](v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_1BE9C4DD8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1EA113248;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1EA113250;
  v12[5] = v11;
  v13 = self;
  sub_1BE5AF20C((uint64_t)v7, (uint64_t)&unk_1EA113258, (uint64_t)v12);
  swift_release();
}

- (void)createAccessTokenWithAuthCode:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBA46780);
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_1BE9C4DD8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1EA113228;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1EA113230;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_1BE5AF20C((uint64_t)v9, (uint64_t)&unk_1EA1167F0, (uint64_t)v14);
  swift_release();
}

- (void)updateIconWithHeaderView:(id)a3 axID:(id)a4
{
}

- (_TtC6HomeUI24UtilityOnboardingContext)init
{
  result = (_TtC6HomeUI24UtilityOnboardingContext *)_swift_stdlib_reportUnimplementedInitializer();
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
  swift_bridgeObjectRelease();
  sub_1BE39DA0C((uint64_t)self + OBJC_IVAR____TtC6HomeUI24UtilityOnboardingContext_expirationDate, (uint64_t *)&unk_1EA113010);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end