@interface UtilityServices
+ (BOOL)isSupportedInRegion:(id)a3;
+ (NSURLSession)defaultURLSession;
+ (id)environment;
+ (id)userDSID;
+ (void)allUtilitiesInRegion:(NSString *)a3 :(NSURLSession *)a4 completionHandler:(id)a5;
+ (void)authorizeAndSubscribeToSinglePremise:(NSString *)a3 utilityID:(NSString *)a4 authCode:(NSString *)a5 completionHandler:(id)a6;
+ (void)configuration:(NSURLSession *)a3 completionHandler:(id)a4;
+ (void)fetchPrivateAccessToken:(NSArray *)a3 completionHandler:(id)a4;
+ (void)generateGrandSlamTokenWithCompletionHandler:(id)a3;
+ (void)getUtilityInformation:(NSString *)a3 completionHandler:(id)a4;
+ (void)internalFrameworkConfiguration:(NSURLSession *)a3 completionHandler:(id)a4;
+ (void)searchUtilitiesNearLocation:(CLLocation *)a3 completionHandler:(id)a4;
+ (void)subscribePremiseToUsageData:(NSString *)a3 utilityID:(NSString *)a4 utilityHomeID:(NSString *)a5 completionHandler:(id)a6;
+ (void)tafAuthorizeAndSubscribeToSinglePremise:(NSString *)a3 utilityID:(NSString *)a4 fields:(NSDictionary *)a5 completionHandler:(id)a6;
+ (void)utilityConfigurationFor:(NSString *)a3 withSession:(NSURLSession *)a4 completionHandler:(id)a5;
+ (void)utilityIDLookupFor:(CLLocationCoordinate2D)a3 withSession:(NSURLSession *)a4 completionHandler:(id)a5;
+ (void)verifyServiceAddress:(_TtC19HomeUtilityServices21UtilityServiceAddress *)a3 withSession:(NSURLSession *)a4 completionHandler:(id)a5;
- (_TtC19HomeUtilityServices15UtilityServices)init;
@end

@implementation UtilityServices

+ (void)verifyServiceAddress:(_TtC19HomeUtilityServices21UtilityServiceAddress *)a3 withSession:(NSURLSession *)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C1D100);
  MEMORY[0x270FA5388](v9 - 8);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = a1;
  uint64_t v14 = sub_252831598();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_269C1D110;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_269C1D118;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  sub_25281EC2C((uint64_t)v11, (uint64_t)&unk_269C1D120, (uint64_t)v16);
  swift_release();
}

+ (NSURLSession)defaultURLSession
{
  id v2 = objc_msgSend(self, sel_ephemeralSessionConfiguration);
  id v3 = objc_msgSend(self, sel_sessionWithConfiguration_, v2);

  return (NSURLSession *)v3;
}

+ (void)configuration:(NSURLSession *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C1D100);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = a1;
  uint64_t v12 = sub_252831598();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_269C1D480;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_269C1D488;
  v14[5] = v13;
  v15 = a3;
  sub_25281EC2C((uint64_t)v9, (uint64_t)&unk_269C1D490, (uint64_t)v14);
  swift_release();
}

+ (BOOL)isSupportedInRegion:(id)a3
{
  uint64_t v3 = sub_2528312A8();
  uint64_t v5 = v4;
  uint64_t v6 = sub_2527BABD8();
  LOBYTE(v3) = sub_252787764(v3, v5, v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

- (_TtC19HomeUtilityServices15UtilityServices)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for UtilityServices();
  return [(UtilityServices *)&v3 init];
}

+ (void)utilityIDLookupFor:(CLLocationCoordinate2D)a3 withSession:(NSURLSession *)a4 completionHandler:(id)a5
{
  CLLocationDegrees longitude = a3.longitude;
  CLLocationDegrees latitude = a3.latitude;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C1D100);
  MEMORY[0x270FA5388](v10 - 8);
  uint64_t v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _Block_copy(a5);
  uint64_t v14 = (CLLocationDegrees *)swift_allocObject();
  v14[2] = latitude;
  v14[3] = longitude;
  *((void *)v14 + 4) = a4;
  *((void *)v14 + 5) = v13;
  *((void *)v14 + 6) = a1;
  uint64_t v15 = sub_252831598();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v12, 1, 1, v15);
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_269C1D460;
  v16[5] = v14;
  v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_269C1D468;
  v17[5] = v16;
  v18 = a4;
  sub_25281EC2C((uint64_t)v12, (uint64_t)&unk_269C1D470, (uint64_t)v17);
  swift_release();
}

+ (void)allUtilitiesInRegion:(NSString *)a3 :(NSURLSession *)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C1D100);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = a1;
  uint64_t v14 = sub_252831598();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_269C1D440;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_269C1D448;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  sub_25281EC2C((uint64_t)v11, (uint64_t)&unk_269C1D450, (uint64_t)v16);
  swift_release();
}

+ (void)utilityConfigurationFor:(NSString *)a3 withSession:(NSURLSession *)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C1D100);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = a1;
  uint64_t v14 = sub_252831598();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_269C1D420;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_269C1D428;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  sub_25281EC2C((uint64_t)v11, (uint64_t)&unk_269C1D430, (uint64_t)v16);
  swift_release();
}

+ (void)internalFrameworkConfiguration:(NSURLSession *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C1D100);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = a1;
  uint64_t v12 = sub_252831598();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_269C1DC80;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_269C1DC88;
  v14[5] = v13;
  uint64_t v15 = a3;
  sub_25281EC2C((uint64_t)v9, (uint64_t)&unk_269C1DC90, (uint64_t)v14);
  swift_release();
}

+ (void)fetchPrivateAccessToken:(NSArray *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C1D100);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = a1;
  uint64_t v12 = sub_252831598();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_269C1DC60;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_269C1DC68;
  v14[5] = v13;
  uint64_t v15 = a3;
  sub_25281EC2C((uint64_t)v9, (uint64_t)&unk_269C1DC70, (uint64_t)v14);
  swift_release();
}

+ (void)generateGrandSlamTokenWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C1D100);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = a1;
  uint64_t v10 = sub_252831598();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_269C1DC50;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_269C1D118;
  v12[5] = v11;
  sub_25281EC2C((uint64_t)v7, (uint64_t)&unk_269C1D120, (uint64_t)v12);
  swift_release();
}

+ (id)userDSID
{
  if (qword_269C1CE38 != -1) {
    swift_once();
  }
  sub_2527ACEB4((void *)qword_269C2D208);
  if (v2)
  {
    objc_super v3 = (void *)sub_252831298();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v3 = 0;
  }

  return v3;
}

+ (id)environment
{
  sub_25280DF84();
  uint64_t v2 = (void *)sub_252831298();
  swift_bridgeObjectRelease();

  return v2;
}

+ (void)searchUtilitiesNearLocation:(CLLocation *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C1D100);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = a1;
  uint64_t v12 = sub_252831598();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_269C1E910;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_269C1E918;
  v14[5] = v13;
  uint64_t v15 = a3;
  sub_25281EC2C((uint64_t)v9, (uint64_t)&unk_269C1E920, (uint64_t)v14);
  swift_release();
}

+ (void)getUtilityInformation:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C1D100);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = a1;
  uint64_t v12 = sub_252831598();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_269C1E8F0;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_269C1E8F8;
  v14[5] = v13;
  uint64_t v15 = a3;
  sub_25281EC2C((uint64_t)v9, (uint64_t)&unk_269C1E900, (uint64_t)v14);
  swift_release();
}

+ (void)authorizeAndSubscribeToSinglePremise:(NSString *)a3 utilityID:(NSString *)a4 authCode:(NSString *)a5 completionHandler:(id)a6
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C1D100);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = _Block_copy(a6);
  uint64_t v15 = (void *)swift_allocObject();
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
  v17[4] = &unk_269C1E8E0;
  v17[5] = v15;
  v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_269C1DE80;
  v18[5] = v17;
  uint64_t v19 = a3;
  v20 = a4;
  v21 = a5;
  sub_25281EC2C((uint64_t)v13, (uint64_t)&unk_269C1DE88, (uint64_t)v18);
  swift_release();
}

+ (void)tafAuthorizeAndSubscribeToSinglePremise:(NSString *)a3 utilityID:(NSString *)a4 fields:(NSDictionary *)a5 completionHandler:(id)a6
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C1D100);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = _Block_copy(a6);
  uint64_t v15 = (void *)swift_allocObject();
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
  v17[4] = &unk_269C1E8C0;
  v17[5] = v15;
  v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_269C1E8C8;
  v18[5] = v17;
  uint64_t v19 = a3;
  v20 = a4;
  v21 = a5;
  sub_25281EC2C((uint64_t)v13, (uint64_t)&unk_269C1E8D0, (uint64_t)v18);
  swift_release();
}

+ (void)subscribePremiseToUsageData:(NSString *)a3 utilityID:(NSString *)a4 utilityHomeID:(NSString *)a5 completionHandler:(id)a6
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_269C1D100);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = _Block_copy(a6);
  uint64_t v15 = (void *)swift_allocObject();
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
  v17[4] = &unk_269C1E8A0;
  v17[5] = v15;
  v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_269C1E8A8;
  v18[5] = v17;
  uint64_t v19 = a3;
  v20 = a4;
  v21 = a5;
  sub_25281EC2C((uint64_t)v13, (uint64_t)&unk_269C1E8B0, (uint64_t)v18);
  swift_release();
}

@end