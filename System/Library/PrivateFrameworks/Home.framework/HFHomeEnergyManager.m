@interface HFHomeEnergyManager
+ (void)utilityConfiguration:(NSString *)a3 completionHandler:(id)a4;
- (BOOL)cachedHasEnergySite;
- (BOOL)cachedHasUtilitySubscription;
- (BOOL)effectiveGridForecastAvailable;
- (BOOL)isGridForecastAvailableForNewFeaturesView;
- (BOOL)isGridForecastEnabled;
- (BOOL)isGridForecastVisible;
- (BOOL)isHomeElectricitySupported;
- (BOOL)isHomeEnergyVisible;
- (CLLocation)temporaryLocation;
- (_TtC4Home19HFHomeEnergyManager)init;
- (_TtC4Home19HFHomeEnergyManager)initWithHome:(id)a3;
- (void)createUtilitySubscriptionWithHomeID:(NSString *)a3 utilityID:(NSString *)a4 serviceLocationID:(NSString *)a5 accessToken:(NSString *)a6 accessTokenExpirationDate:(NSDate *)a7 refreshToken:(NSString *)a8 address:(NSString *)a9 utilityCustomerName:(NSString *)a10 completionHandler:(id)a11;
- (void)homeRegionWithCompletionHandler:(id)a3;
- (void)isGridForecastAvailableInHomeRegionWithCompletionHandler:(id)a3;
- (void)isHomeElectricitySupportedInHomeRegionWithCompletionHandler:(id)a3;
- (void)revokeSubscriptionWithCompletionHandler:(id)a3;
- (void)setCachedHasEnergySite:(BOOL)a3;
- (void)setIsGridForecastEnabled:(BOOL)a3;
- (void)setIsHomeElectricitySupported:(BOOL)a3;
- (void)setTemporaryLocation:(id)a3;
- (void)updateHomeEnergyAvailableFeaturesWithCompletionHandler:(id)a3;
- (void)utilityDetailsWithCompletionHandler:(id)a3;
@end

@implementation HFHomeEnergyManager

- (_TtC4Home19HFHomeEnergyManager)initWithHome:(id)a3
{
  id v4 = objc_allocWithZone(MEMORY[0x263F00A40]);
  id v5 = a3;
  id v6 = objc_msgSend(v4, sel_init);
  v7 = objc_allocWithZone((Class)type metadata accessor for HFHomeEnergyManager());
  v8 = (_TtC4Home19HFHomeEnergyManager *)sub_20BAC5C5C(v5, (uint64_t)v6, v7);

  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v8;
}

- (CLLocation)temporaryLocation
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC4Home19HFHomeEnergyManager_temporaryLocation);
  swift_beginAccess();
  return (CLLocation *)*v2;
}

- (void)setTemporaryLocation:(id)a3
{
  id v4 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtC4Home19HFHomeEnergyManager_temporaryLocation);
  swift_beginAccess();
  id v5 = *v4;
  *id v4 = a3;
  id v6 = a3;
}

- (BOOL)isGridForecastVisible
{
  v2 = self;
  char v3 = sub_20BAB6AE0();

  return v3 & 1;
}

- (BOOL)isGridForecastEnabled
{
  v2 = self;
  char v3 = sub_20BAB6C18();

  return v3 & 1;
}

- (void)setIsGridForecastEnabled:(BOOL)a3
{
  id v4 = self;
  sub_20BAB6E80(a3);
}

- (BOOL)effectiveGridForecastAvailable
{
  char v3 = (unsigned __int8 *)self + OBJC_IVAR____TtC4Home19HFHomeEnergyManager_isGridForecastAvailable;
  swift_beginAccess();
  int v4 = *v3;
  if (v4 == 2)
  {
    id v5 = (char *)self + OBJC_IVAR____TtC4Home19HFHomeEnergyManager_cachedGridForecastAvailable;
    swift_beginAccess();
    LOBYTE(v4) = *v5;
  }
  return v4 & 1;
}

- (void)updateHomeEnergyAvailableFeaturesWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AB2E3E0);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_20BCE7870();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_2676AFA58;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_2676AFA60;
  v12[5] = v11;
  v13 = self;
  sub_20BAC5AB0((uint64_t)v7, (uint64_t)&unk_2676AFA68, (uint64_t)v12);
  swift_release();
}

- (BOOL)isHomeElectricitySupported
{
  v2 = self;
  char v3 = sub_20BAB8534();

  return v3 & 1;
}

- (void)setIsHomeElectricitySupported:(BOOL)a3
{
  int v4 = self;
  sub_20BAB8594(a3);
}

- (BOOL)cachedHasEnergySite
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC4Home19HFHomeEnergyManager_cachedHasEnergySite;
  swift_beginAccess();
  return *v2;
}

- (void)setCachedHasEnergySite:(BOOL)a3
{
  int v4 = (BOOL *)self + OBJC_IVAR____TtC4Home19HFHomeEnergyManager_cachedHasEnergySite;
  swift_beginAccess();
  *int v4 = a3;
}

- (BOOL)cachedHasUtilitySubscription
{
  v2 = self;
  char v3 = sub_20BAB89C0();

  return v3 & 1;
}

- (BOOL)isHomeEnergyVisible
{
  v2 = self;
  char v3 = sub_20BAB9030();

  return v3 & 1;
}

- (void)isHomeElectricitySupportedInHomeRegionWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AB2E3E0);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_20BCE7870();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_2676AFA38;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_2676AFA40;
  v12[5] = v11;
  v13 = self;
  sub_20BAC5AB0((uint64_t)v7, (uint64_t)&unk_2676AFA48, (uint64_t)v12);
  swift_release();
}

- (void)utilityDetailsWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AB2E3E0);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_20BCE7870();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_2676AFA18;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_2676AFA20;
  v12[5] = v11;
  v13 = self;
  sub_20BAC5AB0((uint64_t)v7, (uint64_t)&unk_2676AFA28, (uint64_t)v12);
  swift_release();
}

- (void)revokeSubscriptionWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AB2E3E0);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_20BCE7870();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_2676AF9F8;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_2676AFA00;
  v12[5] = v11;
  v13 = self;
  sub_20BAC5AB0((uint64_t)v7, (uint64_t)&unk_2676AFA08, (uint64_t)v12);
  swift_release();
}

- (void)isGridForecastAvailableInHomeRegionWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AB2E3E0);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_20BCE7870();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_2676AF9D8;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_2676AF9E0;
  v12[5] = v11;
  v13 = self;
  sub_20BAC5AB0((uint64_t)v7, (uint64_t)&unk_2676AF9E8, (uint64_t)v12);
  swift_release();
}

- (void)homeRegionWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AB2E3E0);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_20BCE7870();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_2676AF9B8;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_2676AF9C0;
  v12[5] = v11;
  v13 = self;
  sub_20BAC5AB0((uint64_t)v7, (uint64_t)&unk_2676AF9C8, (uint64_t)v12);
  swift_release();
}

- (BOOL)isGridForecastAvailableForNewFeaturesView
{
  return sub_20BAC644C() & 1;
}

+ (void)utilityConfiguration:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AB2E3E0);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = a1;
  uint64_t v12 = sub_20BCE7870();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_2676AFA78;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_2676AFA80;
  v14[5] = v13;
  v15 = a3;
  sub_20BAC5AB0((uint64_t)v9, (uint64_t)&unk_2676AFA88, (uint64_t)v14);
  swift_release();
}

- (void)createUtilitySubscriptionWithHomeID:(NSString *)a3 utilityID:(NSString *)a4 serviceLocationID:(NSString *)a5 accessToken:(NSString *)a6 accessTokenExpirationDate:(NSDate *)a7 refreshToken:(NSString *)a8 address:(NSString *)a9 utilityCustomerName:(NSString *)a10 completionHandler:(id)a11
{
  v37 = a9;
  v38 = a8;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AB2E3E0);
  MEMORY[0x270FA5388](v17 - 8);
  v36 = (char *)&v35 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = _Block_copy(a11);
  v20 = (void *)swift_allocObject();
  v20[2] = a3;
  v20[3] = a4;
  v20[4] = a5;
  v20[5] = a6;
  v21 = v38;
  v20[6] = a7;
  v20[7] = v21;
  v20[8] = a9;
  v20[9] = a10;
  v20[10] = v19;
  v20[11] = self;
  uint64_t v22 = sub_20BCE7870();
  uint64_t v23 = (uint64_t)v36;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v36, 1, 1, v22);
  v24 = (void *)swift_allocObject();
  v24[2] = 0;
  v24[3] = 0;
  v24[4] = &unk_2676AF988;
  v24[5] = v20;
  v25 = (void *)swift_allocObject();
  v25[2] = 0;
  v25[3] = 0;
  v25[4] = &unk_2676AEEB8;
  v25[5] = v24;
  v26 = a3;
  v27 = a4;
  v28 = a5;
  v29 = a6;
  v30 = a7;
  v31 = v38;
  v32 = v37;
  v33 = a10;
  v34 = self;
  sub_20BAC5AB0(v23, (uint64_t)&unk_2676AEEC0, (uint64_t)v25);
  swift_release();
}

- (_TtC4Home19HFHomeEnergyManager)init
{
  result = (_TtC4Home19HFHomeEnergyManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC4Home19HFHomeEnergyManager_geocoder);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end