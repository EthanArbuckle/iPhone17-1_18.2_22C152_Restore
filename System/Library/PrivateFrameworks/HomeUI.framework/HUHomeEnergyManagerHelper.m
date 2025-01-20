@interface HUHomeEnergyManagerHelper
+ (BOOL)accountNotFound:(id)a3;
+ (BOOL)characterCount:(id)a3 min:(int64_t)a4 max:(int64_t)a5;
+ (BOOL)regexValidationWithPattern:(id)a3 text:(id)a4;
+ (BOOL)textValidation:(id)a3 field:(id)a4;
+ (NSString)homeEnergyErrorDomain;
+ (id)constructServiceAddress:(id)a3;
+ (int64_t)toAddressMatchTypeHelper:(int64_t)a3;
+ (void)setHasDismissedConnectAccountBannerWithHome:(id)a3;
+ (void)shouldShowConnectAccountBannerFor:(HMHome *)a3 checkLocation:(BOOL)a4 completionHandler:(id)a5;
+ (void)utilityInformation:(NSString *)a3 completionHandler:(id)a4;
- (HUHomeEnergyManagerHelper)init;
- (HUHomeEnergyManagerHelper)initWithHome:(id)a3;
- (void)fetchPillAdviceWithCompletionHandler:(id)a3;
- (void)homeLocationRegionWithCompletionHandler:(id)a3;
- (void)initializeGridForecastSnapshots;
- (void)revokeSubscriptionWithCompletionHandler:(id)a3;
- (void)updateHomeEnergyAvailableFeaturesWithCompletionHandler:(id)a3;
- (void)updateHomeLocationWithCompletionHandler:(id)a3;
- (void)utilityDetailsWithCompletionHandler:(id)a3;
@end

@implementation HUHomeEnergyManagerHelper

- (HUHomeEnergyManagerHelper)initWithHome:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___HUHomeEnergyManagerHelper_home) = (Class)a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for HomeEnergyManagerHelper();
  id v4 = a3;
  return [(HUHomeEnergyManagerHelper *)&v6 init];
}

- (void)updateHomeEnergyAvailableFeaturesWithCompletionHandler:(id)a3
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
  v11[4] = &unk_1EA1141E0;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1EA1141E8;
  v12[5] = v11;
  v13 = self;
  sub_1BE5AF20C((uint64_t)v7, (uint64_t)&unk_1EA1141F0, (uint64_t)v12);
  swift_release();
}

- (void)fetchPillAdviceWithCompletionHandler:(id)a3
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
  v11[4] = &unk_1EA1141C0;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1EA1141C8;
  v12[5] = v11;
  v13 = self;
  sub_1BE5AF20C((uint64_t)v7, (uint64_t)&unk_1EA1141D0, (uint64_t)v12);
  swift_release();
}

- (void)updateHomeLocationWithCompletionHandler:(id)a3
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
  v11[4] = &unk_1EA1141A0;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1EA1141A8;
  v12[5] = v11;
  v13 = self;
  sub_1BE5AF20C((uint64_t)v7, (uint64_t)&unk_1EA1141B0, (uint64_t)v12);
  swift_release();
}

- (void)initializeGridForecastSnapshots
{
  v2 = self;
  sub_1BE3CF6EC();
}

- (void)homeLocationRegionWithCompletionHandler:(id)a3
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
  v11[4] = &unk_1EA114180;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1EA114188;
  v12[5] = v11;
  v13 = self;
  sub_1BE5AF20C((uint64_t)v7, (uint64_t)&unk_1EA114190, (uint64_t)v12);
  swift_release();
}

- (void)utilityDetailsWithCompletionHandler:(id)a3
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
  v11[4] = &unk_1EA114158;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1EA114160;
  v12[5] = v11;
  v13 = self;
  sub_1BE5AF20C((uint64_t)v7, (uint64_t)&unk_1EA114168, (uint64_t)v12);
  swift_release();
}

- (void)revokeSubscriptionWithCompletionHandler:(id)a3
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
  v11[4] = &unk_1EA114148;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1EA113230;
  v12[5] = v11;
  v13 = self;
  sub_1BE5AF20C((uint64_t)v7, (uint64_t)&unk_1EA1167F0, (uint64_t)v12);
  swift_release();
}

+ (void)setHasDismissedConnectAccountBannerWithHome:(id)a3
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBA46780);
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1BE9C1158();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v11 = a3;
  id v12 = objc_msgSend(v11, sel_uniqueIdentifier);
  sub_1BE9C1128();

  uint64_t v13 = sub_1BE9C10F8();
  uint64_t v15 = v14;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  uint64_t v16 = sub_1BE9C4DD8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v6, 1, 1, v16);
  v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = v13;
  v17[5] = v15;
  sub_1BE3CDB00((uint64_t)v6, (uint64_t)&unk_1EA114238, (uint64_t)v17);

  swift_release();
}

+ (void)shouldShowConnectAccountBannerFor:(HMHome *)a3 checkLocation:(BOOL)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBA46780);
  MEMORY[0x1F4188790](v9 - 8);
  id v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v12 = _Block_copy(a5);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a3;
  *(unsigned char *)(v13 + 24) = a4;
  *(void *)(v13 + 32) = v12;
  *(void *)(v13 + 40) = a1;
  uint64_t v14 = sub_1BE9C4DD8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1EA114220;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1EA114228;
  v16[5] = v15;
  v17 = a3;
  sub_1BE5AF20C((uint64_t)v11, (uint64_t)&unk_1EA114230, (uint64_t)v16);
  swift_release();
}

+ (void)utilityInformation:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBA46780);
  MEMORY[0x1F4188790](v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  id v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = a1;
  uint64_t v12 = sub_1BE9C4DD8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1EA114200;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1EA114208;
  v14[5] = v13;
  uint64_t v15 = a3;
  sub_1BE5AF20C((uint64_t)v9, (uint64_t)&unk_1EA114210, (uint64_t)v14);
  swift_release();
}

+ (int64_t)toAddressMatchTypeHelper:(int64_t)a3
{
  if (a3 == 2) {
    return 2;
  }
  else {
    return a3 == 1;
  }
}

+ (id)constructServiceAddress:(id)a3
{
  uint64_t v3 = sub_1BE9C4908();
  uint64_t v4 = (void *)sub_1BE3D6C58(v3);
  swift_bridgeObjectRelease();

  return v4;
}

+ (BOOL)textValidation:(id)a3 field:(id)a4
{
  uint64_t v4 = sub_1BE9C49F8();
  unint64_t v6 = v5;
  swift_bridgeObjectRelease();
  uint64_t v7 = HIBYTE(v6) & 0xF;
  if ((v6 & 0x2000000000000000) == 0) {
    uint64_t v7 = v4 & 0xFFFFFFFFFFFFLL;
  }
  return v7 != 0;
}

+ (BOOL)characterCount:(id)a3 min:(int64_t)a4 max:(int64_t)a5
{
  uint64_t v7 = sub_1BE9C49F8();
  LOBYTE(a5) = sub_1BE3DBB34(v7, v8, a4, a5);
  swift_bridgeObjectRelease();
  return a5 & 1;
}

+ (BOOL)regexValidationWithPattern:(id)a3 text:(id)a4
{
  uint64_t v4 = sub_1BE9C49F8();
  unint64_t v6 = v5;
  uint64_t v7 = sub_1BE9C49F8();
  LOBYTE(v4) = sub_1BE3D6578(v4, v6, v7, v8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v4 & 1;
}

- (HUHomeEnergyManagerHelper)init
{
  result = (HUHomeEnergyManagerHelper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

+ (BOOL)accountNotFound:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA1145B0);
  if (swift_dynamicCast())
  {
    uint64_t v5 = sub_1BE9C23B8();
    uint64_t v6 = sub_1BE9C23B8();

    if (v5 == v6) {
      return 1;
    }
  }
  else
  {
  }
  return 0;
}

+ (NSString)homeEnergyErrorDomain
{
  v2 = (void *)sub_1BE9C49B8();

  return (NSString *)v2;
}

@end