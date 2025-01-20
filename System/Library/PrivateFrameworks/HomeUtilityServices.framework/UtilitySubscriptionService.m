@interface UtilitySubscriptionService
+ (void)fetchSubscriptionDetailsWithAccessToken:(NSString *)a3 subscriptionID:(NSString *)a4 utilityID:(NSString *)a5 :(NSURLSession *)a6 completionHandler:(id)a7;
+ (void)renewAccessTokenWithRefreshToken:(NSString *)a3 utilityID:(NSString *)a4 :(NSURLSession *)a5 completionHandler:(id)a6;
+ (void)renewAuthorizationTokenWithUtilityID:(NSString *)a3 authorizationToken:(NSString *)a4 accessToken:(NSString *)a5 :(NSURLSession *)a6 completionHandler:(id)a7;
+ (void)resendHistoricalDataWithAccessToken:(NSString *)a3 subscriptionID:(NSString *)a4 utilityID:(NSString *)a5 start:(NSDate *)a6 end:(NSDate *)a7 :(NSURLSession *)a8 completionHandler:(id)a9;
+ (void)resendHistoricalDataWithAuthorizationToken:(NSString *)a3 subscriptionID:(NSString *)a4 utilityID:(NSString *)a5 start:(NSDate *)a6 end:(NSDate *)a7 :(NSURLSession *)a8 completionHandler:(id)a9;
+ (void)revokeSubscriptionWithAccessToken:(NSString *)a3 subscriptionID:(NSString *)a4 utilityID:(NSString *)a5 :(NSURLSession *)a6 completionHandler:(id)a7;
+ (void)revokeSubscriptionWithAuthorizationToken:(NSString *)a3 subscriptionID:(NSString *)a4 utilityID:(NSString *)a5 :(NSURLSession *)a6 completionHandler:(id)a7;
- (_TtC19HomeUtilityServices20UtilityConfiguration)configuration;
- (_TtC19HomeUtilityServices26UtilitySubscriptionService)init;
- (_TtC19HomeUtilityServices26UtilitySubscriptionService)initWithConfiguration:(id)a3;
- (void)authorizeAccountWithTAFWithFields:(NSDictionary *)a3 :(NSURLSession *)a4 completionHandler:(id)a5;
- (void)createAccessToken:(NSString *)a3 :(NSURLSession *)a4 completionHandler:(id)a5;
- (void)createUtilitySubscriptionWithServiceLocation:(_TtC19HomeUtilityServices22UtilityServiceLocation *)a3 accessToken:(NSString *)a4 siteID:(NSString *)a5 :(NSURLSession *)a6 completionHandler:(id)a7;
- (void)createUtilitySubscriptionWithServiceLocationID:(NSString *)a3 accessToken:(NSString *)a4 :(NSURLSession *)a5 completionHandler:(id)a6;
- (void)createUtilitySubscriptionWithServiceLocationID:(NSString *)a3 accessToken:(NSString *)a4 siteID:(NSString *)a5 :(NSURLSession *)a6 completionHandler:(id)a7;
- (void)createUtilitySubscriptionWithServiceLocationID:(NSString *)a3 accessToken:(NSString *)a4 zoneName:(NSString *)a5 :(NSURLSession *)a6 completionHandler:(id)a7;
- (void)fetchServiceLocations:(NSString *)a3 :(NSURLSession *)a4 completionHandler:(id)a5;
- (void)initiateOTPForAccountForFactor:(_TtC19HomeUtilityServices21TAFVerificationFactor *)a3 :(NSURLSession *)a4 completionHandler:(id)a5;
- (void)verifyOTPForAccountWithFactor:(_TtC19HomeUtilityServices21TAFVerificationFactor *)a3 oneTimePasscode:(NSString *)a4 :(NSURLSession *)a5 completionHandler:(id)a6;
@end

@implementation UtilitySubscriptionService

- (_TtC19HomeUtilityServices20UtilityConfiguration)configuration
{
  return (_TtC19HomeUtilityServices20UtilityConfiguration *)*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC19HomeUtilityServices26UtilitySubscriptionService_configuration);
}

- (_TtC19HomeUtilityServices26UtilitySubscriptionService)initWithConfiguration:(id)a3
{
  uint64_t v5 = sub_252830DE8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = (uint64_t *)((char *)self + OBJC_IVAR____TtC19HomeUtilityServices26UtilitySubscriptionService_sessionID);
  v10 = (objc_class *)a3;
  v11 = self;
  sub_252830DD8();
  uint64_t v12 = sub_252830DC8();
  uint64_t v14 = v13;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t *v9 = v12;
  v9[1] = v14;
  *(Class *)((char *)&v11->super.isa + OBJC_IVAR____TtC19HomeUtilityServices26UtilitySubscriptionService_configuration) = v10;
  v15 = v10;

  v16 = (objc_class *)type metadata accessor for UtilitySubscriptionService();
  v19.receiver = v11;
  v19.super_class = v16;
  v17 = [(UtilitySubscriptionService *)&v19 init];

  return v17;
}

- (void)authorizeAccountWithTAFWithFields:(NSDictionary *)a3 :(NSURLSession *)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C1D100);
  MEMORY[0x270FA5388](v9 - 8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_252831598();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_269C1DE18;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_269C1DE20;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  objc_super v19 = self;
  sub_25281EC2C((uint64_t)v11, (uint64_t)&unk_269C1DE28, (uint64_t)v16);
  swift_release();
}

- (void)initiateOTPForAccountForFactor:(_TtC19HomeUtilityServices21TAFVerificationFactor *)a3 :(NSURLSession *)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C1D100);
  MEMORY[0x270FA5388](v9 - 8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_252831598();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_269C1DDF8;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_269C1DE00;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  objc_super v19 = self;
  sub_25281EC2C((uint64_t)v11, (uint64_t)&unk_269C1DE08, (uint64_t)v16);
  swift_release();
}

- (void)createAccessToken:(NSString *)a3 :(NSURLSession *)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C1D100);
  MEMORY[0x270FA5388](v9 - 8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_252831598();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_269C1DDD8;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_269C1DDE0;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  objc_super v19 = self;
  sub_25281EC2C((uint64_t)v11, (uint64_t)&unk_269C1DDE8, (uint64_t)v16);
  swift_release();
}

- (void)fetchServiceLocations:(NSString *)a3 :(NSURLSession *)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C1D100);
  MEMORY[0x270FA5388](v9 - 8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_252831598();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_269C1DDB8;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_269C1DDC0;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  objc_super v19 = self;
  sub_25281EC2C((uint64_t)v11, (uint64_t)&unk_269C1DDC8, (uint64_t)v16);
  swift_release();
}

- (void)createUtilitySubscriptionWithServiceLocationID:(NSString *)a3 accessToken:(NSString *)a4 :(NSURLSession *)a5 completionHandler:(id)a6
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C1D100);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = _Block_copy(a6);
  v15 = (void *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  uint64_t v16 = sub_252831598();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_269C1DDA8;
  v17[5] = v15;
  v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_269C1D118;
  v18[5] = v17;
  objc_super v19 = a3;
  uint64_t v20 = a4;
  v21 = a5;
  v22 = self;
  sub_25281EC2C((uint64_t)v13, (uint64_t)&unk_269C1D120, (uint64_t)v18);
  swift_release();
}

+ (void)renewAccessTokenWithRefreshToken:(NSString *)a3 utilityID:(NSString *)a4 :(NSURLSession *)a5 completionHandler:(id)a6
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C1D100);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = _Block_copy(a6);
  v15 = (void *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = a1;
  uint64_t v16 = sub_252831598();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_269C1DEB8;
  v17[5] = v15;
  v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_269C1DEC0;
  v18[5] = v17;
  objc_super v19 = a3;
  uint64_t v20 = a4;
  v21 = a5;
  sub_25281EC2C((uint64_t)v13, (uint64_t)&unk_269C1DEC8, (uint64_t)v18);
  swift_release();
}

+ (void)fetchSubscriptionDetailsWithAccessToken:(NSString *)a3 subscriptionID:(NSString *)a4 utilityID:(NSString *)a5 :(NSURLSession *)a6 completionHandler:(id)a7
{
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C1D100);
  MEMORY[0x270FA5388](v13 - 8);
  v15 = (char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = _Block_copy(a7);
  v17 = (void *)swift_allocObject();
  v17[2] = a3;
  v17[3] = a4;
  v17[4] = a5;
  v17[5] = a6;
  v17[6] = v16;
  v17[7] = a1;
  uint64_t v18 = sub_252831598();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v15, 1, 1, v18);
  objc_super v19 = (void *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_269C1DE98;
  v19[5] = v17;
  uint64_t v20 = (void *)swift_allocObject();
  v20[2] = 0;
  v20[3] = 0;
  v20[4] = &unk_269C1DEA0;
  v20[5] = v19;
  v21 = a3;
  uint64_t v22 = a4;
  uint64_t v23 = a5;
  v24 = a6;
  sub_25281EC2C((uint64_t)v15, (uint64_t)&unk_269C1DEA8, (uint64_t)v20);
  swift_release();
}

+ (void)renewAuthorizationTokenWithUtilityID:(NSString *)a3 authorizationToken:(NSString *)a4 accessToken:(NSString *)a5 :(NSURLSession *)a6 completionHandler:(id)a7
{
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C1D100);
  MEMORY[0x270FA5388](v13 - 8);
  v15 = (char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = _Block_copy(a7);
  v17 = (void *)swift_allocObject();
  v17[2] = a3;
  v17[3] = a4;
  v17[4] = a5;
  v17[5] = a6;
  v17[6] = v16;
  v17[7] = a1;
  uint64_t v18 = sub_252831598();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v15, 1, 1, v18);
  objc_super v19 = (void *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_269C1DE78;
  v19[5] = v17;
  uint64_t v20 = (void *)swift_allocObject();
  v20[2] = 0;
  v20[3] = 0;
  v20[4] = &unk_269C1DE80;
  v20[5] = v19;
  v21 = a3;
  uint64_t v22 = a4;
  uint64_t v23 = a5;
  v24 = a6;
  sub_25281EC2C((uint64_t)v15, (uint64_t)&unk_269C1DE88, (uint64_t)v20);
  swift_release();
}

+ (void)revokeSubscriptionWithAuthorizationToken:(NSString *)a3 subscriptionID:(NSString *)a4 utilityID:(NSString *)a5 :(NSURLSession *)a6 completionHandler:(id)a7
{
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C1D100);
  MEMORY[0x270FA5388](v13 - 8);
  v15 = (char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = _Block_copy(a7);
  v17 = (void *)swift_allocObject();
  v17[2] = a3;
  v17[3] = a4;
  v17[4] = a5;
  v17[5] = a6;
  v17[6] = v16;
  v17[7] = a1;
  uint64_t v18 = sub_252831598();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v15, 1, 1, v18);
  objc_super v19 = (void *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_269C1DE58;
  v19[5] = v17;
  uint64_t v20 = (void *)swift_allocObject();
  v20[2] = 0;
  v20[3] = 0;
  v20[4] = &unk_269C1DE60;
  v20[5] = v19;
  v21 = a3;
  uint64_t v22 = a4;
  uint64_t v23 = a5;
  v24 = a6;
  sub_25281EC2C((uint64_t)v15, (uint64_t)&unk_269C1DE68, (uint64_t)v20);
  swift_release();
}

+ (void)resendHistoricalDataWithAuthorizationToken:(NSString *)a3 subscriptionID:(NSString *)a4 utilityID:(NSString *)a5 start:(NSDate *)a6 end:(NSDate *)a7 :(NSURLSession *)a8 completionHandler:(id)a9
{
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C1D100);
  MEMORY[0x270FA5388](v16 - 8);
  uint64_t v18 = (char *)&v30 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_super v19 = _Block_copy(a9);
  uint64_t v20 = (void *)swift_allocObject();
  v20[2] = a3;
  v20[3] = a4;
  v20[4] = a5;
  v20[5] = a6;
  v20[6] = a7;
  v20[7] = a8;
  v20[8] = v19;
  v20[9] = a1;
  uint64_t v21 = sub_252831598();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v18, 1, 1, v21);
  uint64_t v22 = (void *)swift_allocObject();
  v22[2] = 0;
  v22[3] = 0;
  v22[4] = &unk_269C1DE38;
  v22[5] = v20;
  uint64_t v23 = (void *)swift_allocObject();
  v23[2] = 0;
  v23[3] = 0;
  v23[4] = &unk_269C1DE40;
  v23[5] = v22;
  v24 = a3;
  uint64_t v25 = a4;
  v26 = a5;
  v27 = a6;
  v28 = a7;
  v29 = a8;
  sub_25281EC2C((uint64_t)v18, (uint64_t)&unk_269C1DE48, (uint64_t)v23);
  swift_release();
}

- (_TtC19HomeUtilityServices26UtilitySubscriptionService)init
{
  result = (_TtC19HomeUtilityServices26UtilitySubscriptionService *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC19HomeUtilityServices26UtilitySubscriptionService_configuration);
}

- (void)createUtilitySubscriptionWithServiceLocation:(_TtC19HomeUtilityServices22UtilityServiceLocation *)a3 accessToken:(NSString *)a4 siteID:(NSString *)a5 :(NSURLSession *)a6 completionHandler:(id)a7
{
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C1D100);
  MEMORY[0x270FA5388](v13 - 8);
  v15 = (char *)&v26 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = _Block_copy(a7);
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = a3;
  v17[3] = a4;
  v17[4] = a5;
  v17[5] = a6;
  v17[6] = v16;
  v17[7] = self;
  uint64_t v18 = sub_252831598();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v15, 1, 1, v18);
  objc_super v19 = (void *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_269C1E880;
  v19[5] = v17;
  uint64_t v20 = (void *)swift_allocObject();
  v20[2] = 0;
  v20[3] = 0;
  v20[4] = &unk_269C1E888;
  v20[5] = v19;
  uint64_t v21 = a3;
  uint64_t v22 = a4;
  uint64_t v23 = a5;
  v24 = a6;
  uint64_t v25 = self;
  sub_25281EC2C((uint64_t)v15, (uint64_t)&unk_269C1E890, (uint64_t)v20);
  swift_release();
}

- (void)verifyOTPForAccountWithFactor:(_TtC19HomeUtilityServices21TAFVerificationFactor *)a3 oneTimePasscode:(NSString *)a4 :(NSURLSession *)a5 completionHandler:(id)a6
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C1D100);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = _Block_copy(a6);
  v15 = (void *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  uint64_t v16 = sub_252831598();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_269C1E860;
  v17[5] = v15;
  uint64_t v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_269C1E868;
  v18[5] = v17;
  objc_super v19 = a3;
  uint64_t v20 = a4;
  uint64_t v21 = a5;
  uint64_t v22 = self;
  sub_25281EC2C((uint64_t)v13, (uint64_t)&unk_269C1E870, (uint64_t)v18);
  swift_release();
}

- (void)createUtilitySubscriptionWithServiceLocationID:(NSString *)a3 accessToken:(NSString *)a4 siteID:(NSString *)a5 :(NSURLSession *)a6 completionHandler:(id)a7
{
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C1D100);
  MEMORY[0x270FA5388](v13 - 8);
  v15 = (char *)&v26 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = _Block_copy(a7);
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = a3;
  v17[3] = a4;
  v17[4] = a5;
  v17[5] = a6;
  v17[6] = v16;
  v17[7] = self;
  uint64_t v18 = sub_252831598();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v15, 1, 1, v18);
  objc_super v19 = (void *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_269C1E840;
  v19[5] = v17;
  uint64_t v20 = (void *)swift_allocObject();
  v20[2] = 0;
  v20[3] = 0;
  v20[4] = &unk_269C1E848;
  v20[5] = v19;
  uint64_t v21 = a3;
  uint64_t v22 = a4;
  uint64_t v23 = a5;
  v24 = a6;
  uint64_t v25 = self;
  sub_25281EC2C((uint64_t)v15, (uint64_t)&unk_269C1E850, (uint64_t)v20);
  swift_release();
}

- (void)createUtilitySubscriptionWithServiceLocationID:(NSString *)a3 accessToken:(NSString *)a4 zoneName:(NSString *)a5 :(NSURLSession *)a6 completionHandler:(id)a7
{
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C1D100);
  MEMORY[0x270FA5388](v13 - 8);
  v15 = (char *)&v26 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = _Block_copy(a7);
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = a3;
  v17[3] = a4;
  v17[4] = a5;
  v17[5] = a6;
  v17[6] = v16;
  v17[7] = self;
  uint64_t v18 = sub_252831598();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v15, 1, 1, v18);
  objc_super v19 = (void *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_269C1E820;
  v19[5] = v17;
  uint64_t v20 = (void *)swift_allocObject();
  v20[2] = 0;
  v20[3] = 0;
  v20[4] = &unk_269C1E828;
  v20[5] = v19;
  uint64_t v21 = a3;
  uint64_t v22 = a4;
  uint64_t v23 = a5;
  v24 = a6;
  uint64_t v25 = self;
  sub_25281EC2C((uint64_t)v15, (uint64_t)&unk_269C1E830, (uint64_t)v20);
  swift_release();
}

+ (void)resendHistoricalDataWithAccessToken:(NSString *)a3 subscriptionID:(NSString *)a4 utilityID:(NSString *)a5 start:(NSDate *)a6 end:(NSDate *)a7 :(NSURLSession *)a8 completionHandler:(id)a9
{
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C1D100);
  MEMORY[0x270FA5388](v16 - 8);
  uint64_t v18 = (char *)&v30 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_super v19 = _Block_copy(a9);
  uint64_t v20 = (void *)swift_allocObject();
  v20[2] = a3;
  v20[3] = a4;
  v20[4] = a5;
  v20[5] = a6;
  v20[6] = a7;
  v20[7] = a8;
  v20[8] = v19;
  v20[9] = a1;
  uint64_t v21 = sub_252831598();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v18, 1, 1, v21);
  uint64_t v22 = (void *)swift_allocObject();
  v22[2] = 0;
  v22[3] = 0;
  v22[4] = &unk_269C1E810;
  v22[5] = v20;
  uint64_t v23 = (void *)swift_allocObject();
  v23[2] = 0;
  v23[3] = 0;
  v23[4] = &unk_269C1DC88;
  v23[5] = v22;
  v24 = a3;
  uint64_t v25 = a4;
  uint64_t v26 = a5;
  v27 = a6;
  v28 = a7;
  v29 = a8;
  sub_25281EC2C((uint64_t)v18, (uint64_t)&unk_269C1DC90, (uint64_t)v23);
  swift_release();
}

+ (void)revokeSubscriptionWithAccessToken:(NSString *)a3 subscriptionID:(NSString *)a4 utilityID:(NSString *)a5 :(NSURLSession *)a6 completionHandler:(id)a7
{
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C1D100);
  MEMORY[0x270FA5388](v13 - 8);
  v15 = (char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = _Block_copy(a7);
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = a3;
  v17[3] = a4;
  v17[4] = a5;
  v17[5] = a6;
  v17[6] = v16;
  v17[7] = a1;
  uint64_t v18 = sub_252831598();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v15, 1, 1, v18);
  objc_super v19 = (void *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_269C1E7E0;
  v19[5] = v17;
  uint64_t v20 = (void *)swift_allocObject();
  v20[2] = 0;
  v20[3] = 0;
  v20[4] = &unk_269C1D118;
  v20[5] = v19;
  uint64_t v21 = a3;
  uint64_t v22 = a4;
  uint64_t v23 = a5;
  v24 = a6;
  sub_25281EC2C((uint64_t)v15, (uint64_t)&unk_269C1D120, (uint64_t)v20);
  swift_release();
}

@end