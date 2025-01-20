@interface HomeEnergyProxy
- (_TtC16HomeEnergyDaemon15HomeEnergyProxy)init;
- (void)clearCacheWithCompletionHandler:(id)a3;
- (void)completedOnboardingWithId:(NSString *)a3 completionHandler:(id)a4;
- (void)createUtilitySubscriptionWithSiteID:(NSString *)a3 utilityID:(NSString *)a4 serviceLocationID:(NSString *)a5 accessToken:(NSString *)a6 accessTokenExpirationDate:(NSDate *)a7 refreshToken:(NSString *)a8 address:(NSString *)a9 utilityCustomerName:(NSString *)a10 completionHandler:(id)a11;
- (void)createUtilitySubscriptionWithSiteID:(NSString *)a3 utilityID:(NSString *)a4 serviceLocationID:(NSString *)a5 accessToken:(NSString *)a6 accessTokenExpirationDate:(NSDate *)a7 refreshToken:(NSString *)a8 utilityCustomerName:(NSString *)a9 completionHandler:(id)a10;
- (void)createUtilitySubscriptionWithSiteID:(NSString *)a3 utilityID:(NSString *)a4 serviceLocationID:(NSString *)a5 accessToken:(NSString *)a6 refreshToken:(NSString *)a7 completionHandler:(id)a8;
- (void)deleteEnergySiteWithSite:(_TtC19EnergyKitFoundation12EKEnergySite *)a3 completionHandler:(id)a4;
- (void)disableAllNextCleanEnergyWindowNotificationsWithCompletionHandler:(id)a3;
- (void)disableEnergyForecastDataCollectionForGridID:(NSString *)a3 completionHandler:(id)a4;
- (void)disableEnergyForecastDataCollectionWithCompletionHandler:(id)a3;
- (void)disableNextCleanEnergyWindowNotificationsForGridID:(NSString *)a3 completionHandler:(id)a4;
- (void)disableNextCleanEnergyWindowNotificationsForGridID:(NSString *)a3 homeID:(NSString *)a4 completionHandler:(id)a5;
- (void)dumpAllDataWithCompletionHandler:(id)a3;
- (void)enableEnergyForecastDataCollectionForGridID:(NSString *)a3 completionHandler:(id)a4;
- (void)enableNextCleanEnergyWindowNotificationsForGridID:(NSString *)a3 notificationContext:(NSDictionary *)a4 completionHandler:(id)a5;
- (void)energyWindowsFor:(NSString *)a3 withCaching:(BOOL)a4 completionHandler:(id)a5;
- (void)forceIndependentTokenRotateWithToken:(NSString *)a3 utility:(NSString *)a4 completionHandler:(id)a5;
- (void)generateMockAMIDataWithSiteID:(NSString *)a3 startDate:(NSString *)a4 endDate:(NSString *)a5 forceAllReadingsToConstant:(BOOL)a6 recordInterval:(int64_t)a7 batchSize:(int64_t)a8 rateSchedule:(NSString *)a9 netMetering:(BOOL)a10 direction:(int64_t)a11 randomization:(BOOL)a12 completionHandler:(id)a13;
- (void)generateMultipleMeterMockAMIDataWithSiteID:(NSString *)a3 startDate:(NSString *)a4 endDate:(NSString *)a5 recordInterval:(int64_t)a6 rateSchedule:(NSString *)a7 multipleMeters:(int64_t)a8 completionHandler:(id)a9;
- (void)getAllSiteIDsWithCompletionHandler:(id)a3;
- (void)getAllUtilitiesWithCountryCode:(NSString *)a3 completionHandler:(id)a4;
- (void)getCurrentLocationWithCompletionHandler:(id)a3;
- (void)getKVSDictionaryWithKey:(NSString *)a3 completionHandler:(id)a4;
- (void)gridIDLookupWithCoordinate:(CLLocationCoordinate2D)a3 completionHandler:(id)a4;
- (void)historicalEnergyUsageWithInterval:(NSString *)a3 start:(NSDate *)a4 timezone:(NSString *)a5 utilityID:(NSString *)a6 subscriptionID:(NSString *)a7 completionHandler:(id)a8;
- (void)intervalReadingWithSubscriptionID:(NSString *)a3 utilityID:(NSString *)a4 interval:(NSString *)a5 start:(NSDate *)a6 end:(NSDate *)a7 timeZone:(NSTimeZone *)a8 flowDirection:(NSString *)a9 completionHandler:(id)a10;
- (void)isDataAvailableWithSiteID:(NSString *)a3 completionHandler:(id)a4;
- (void)isNextCleanEnergyWindowNotificationEnabledForGridID:(NSString *)a3 homeID:(NSString *)a4 completionHandler:(id)a5;
- (void)isTAFEnabledWithUtilityID:(NSString *)a3 completionHandler:(id)a4;
- (void)leanHistoricalEnergyUsageWithInterval:(NSString *)a3 start:(NSDate *)a4 end:(NSDate *)a5 subscriptionID:(NSString *)a6 utilityID:(NSString *)a7 timeZone:(NSTimeZone *)a8 flowDirection:(int64_t)a9 siteID:(NSString *)a10 completionHandler:(id)a11;
- (void)refreshCurrentUtilityPeakPeriodsWithSiteID:(NSString *)a3 start:(NSDate *)a4 completionHandler:(id)a5;
- (void)registerEnergySiteWithSite:(_TtC19EnergyKitFoundation12EKEnergySite *)a3 completionHandler:(id)a4;
- (void)renewUtilityAccessTokenWithSiteID:(NSString *)a3 completionHandler:(id)a4;
- (void)requestAddToShareForHomeUUID:(NSUUID *)a3 siteID:(NSString *)a4 completionHandler:(id)a5;
- (void)resetUtilityDataWithCompletionHandler:(id)a3;
- (void)revokeUtilitySubscriptionWithSiteID:(NSString *)a3 completionHandler:(id)a4;
- (void)setKVSDictionaryWithKey:(NSString *)a3 dict:(NSDictionary *)a4 completionHandler:(id)a5;
- (void)siteWithSiteID:(NSString *)a3 completionHandler:(id)a4;
- (void)submitTestTaskWithTaskID:(NSString *)a3 delay:(int64_t)a4 completionHandler:(id)a5;
- (void)testDelegateForGridIds:(NSSet *)a3 completionHandler:(id)a4;
- (void)testNotificationsForGridID:(NSString *)a3 notificationContext:(NSDictionary *)a4 completionHandler:(id)a5;
- (void)testSetMockURLSessionWithCompletionHandler:(id)a3;
- (void)triggerAMIFetchFromDropboxWithCompletionHandler:(id)a3;
- (void)updateCompletedOnboardingWithId:(NSString *)a3 value:(BOOL)a4 completionHandler:(id)a5;
- (void)updateFieldsWithSiteID:(NSString *)a3 from:(NSDictionary *)a4 completionHandler:(id)a5;
- (void)updateLocationWithSiteID:(NSString *)a3 location:(CLLocation *)a4 completionHandler:(id)a5;
- (void)updateStateWithSiteID:(NSString *)a3 state:(NSString *)a4 completionHandler:(id)a5;
- (void)updateSubscriptionWithSiteID:(NSString *)a3 utilityID:(NSString *)a4 subscriptionID:(NSString *)a5 accessToken:(NSString *)a6 refreshToken:(NSString *)a7 ckFunctionToken:(NSString *)a8 accountName:(NSString *)a9 accountNumber:(NSString *)a10 address:(NSString *)a11 serviceLocationID:(NSString *)a12 alternateSupplier:(NSString *)a13 accessTokenExpirationDate:(NSDate *)a14 completionHandler:(id)a15;
- (void)updateTimezoneWithSiteID:(NSString *)a3 timezone:(NSString *)a4 completionHandler:(id)a5;
- (void)useMockDataWithFilePath:(NSString *)a3 disableMock:(BOOL)a4 validityDate:(NSDate *)a5 completionHandler:(id)a6;
- (void)useUtilityMockDataWithEnableMock:(BOOL)a3 completionHandler:(id)a4;
- (void)utilitiesNearLocationWithLocation:(CLLocationCoordinate2D)a3 completionHandler:(id)a4;
- (void)utilityInformationWithUtilityID:(NSString *)a3 completionHandler:(id)a4;
@end

@implementation HomeEnergyProxy

- (void)dumpAllDataWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B223E60);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_2521B70B0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_269BF40F0;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_269BF40F8;
  v12[5] = v11;
  v13 = self;
  sub_252012AD0((uint64_t)v7, (uint64_t)&unk_269BF4100, (uint64_t)v12);
  swift_release();
}

- (void)useMockDataWithFilePath:(NSString *)a3 disableMock:(BOOL)a4 validityDate:(NSDate *)a5 completionHandler:(id)a6
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B223E60);
  MEMORY[0x270FA5388](v11 - 8);
  v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = _Block_copy(a6);
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = a3;
  *(unsigned char *)(v15 + 24) = a4;
  *(void *)(v15 + 32) = a5;
  *(void *)(v15 + 40) = v14;
  *(void *)(v15 + 48) = self;
  uint64_t v16 = sub_2521B70B0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_269BF40D0;
  v17[5] = v15;
  v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_269BF40D8;
  v18[5] = v17;
  v19 = a3;
  v20 = a5;
  v21 = self;
  sub_252012AD0((uint64_t)v13, (uint64_t)&unk_269BF40E0, (uint64_t)v18);
  swift_release();
}

- (void)testNotificationsForGridID:(NSString *)a3 notificationContext:(NSDictionary *)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B223E60);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_2521B70B0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_269BF40B0;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_269BF40B8;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_252012AD0((uint64_t)v11, (uint64_t)&unk_269BF40C0, (uint64_t)v16);
  swift_release();
}

- (void)testDelegateForGridIds:(NSSet *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B223E60);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_2521B70B0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_269BF4090;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_269BF4098;
  v14[5] = v13;
  uint64_t v15 = a3;
  uint64_t v16 = self;
  sub_252012AD0((uint64_t)v9, (uint64_t)&unk_269BF40A0, (uint64_t)v14);
  swift_release();
}

- (void)testSetMockURLSessionWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B223E60);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_2521B70B0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_269BF4070;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_269BF4078;
  v12[5] = v11;
  v13 = self;
  sub_252012AD0((uint64_t)v7, (uint64_t)&unk_269BF4080, (uint64_t)v12);
  swift_release();
}

- (void)isNextCleanEnergyWindowNotificationEnabledForGridID:(NSString *)a3 homeID:(NSString *)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B223E60);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_2521B70B0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_269BF4050;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_269BF4058;
  v16[5] = v15;
  uint64_t v17 = a3;
  v18 = a4;
  v19 = self;
  sub_252012AD0((uint64_t)v11, (uint64_t)&unk_269BF4060, (uint64_t)v16);
  swift_release();
}

- (void)enableNextCleanEnergyWindowNotificationsForGridID:(NSString *)a3 notificationContext:(NSDictionary *)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B223E60);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_2521B70B0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_269BF4030;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_269BF4038;
  v16[5] = v15;
  uint64_t v17 = a3;
  v18 = a4;
  v19 = self;
  sub_252012AD0((uint64_t)v11, (uint64_t)&unk_269BF4040, (uint64_t)v16);
  swift_release();
}

- (void)disableNextCleanEnergyWindowNotificationsForGridID:(NSString *)a3 homeID:(NSString *)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B223E60);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_2521B70B0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_269BF4010;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_269BF4018;
  v16[5] = v15;
  uint64_t v17 = a3;
  v18 = a4;
  v19 = self;
  sub_252012AD0((uint64_t)v11, (uint64_t)&unk_269BF4020, (uint64_t)v16);
  swift_release();
}

- (void)disableNextCleanEnergyWindowNotificationsForGridID:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B223E60);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_2521B70B0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_269BF3FF0;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_269BF3FF8;
  v14[5] = v13;
  uint64_t v15 = a3;
  uint64_t v16 = self;
  sub_252012AD0((uint64_t)v9, (uint64_t)&unk_269BF4000, (uint64_t)v14);
  swift_release();
}

- (void)disableAllNextCleanEnergyWindowNotificationsWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B223E60);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_2521B70B0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_269BF3FD0;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_269BF3FD8;
  v12[5] = v11;
  v13 = self;
  sub_252012AD0((uint64_t)v7, (uint64_t)&unk_269BF3FE0, (uint64_t)v12);
  swift_release();
}

- (void)enableEnergyForecastDataCollectionForGridID:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B223E60);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_2521B70B0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_269BF3FB0;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_269BF3FB8;
  v14[5] = v13;
  uint64_t v15 = a3;
  uint64_t v16 = self;
  sub_252012AD0((uint64_t)v9, (uint64_t)&unk_269BF3FC0, (uint64_t)v14);
  swift_release();
}

- (void)disableEnergyForecastDataCollectionWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B223E60);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_2521B70B0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_269BF3F90;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_269BF3F98;
  v12[5] = v11;
  v13 = self;
  sub_252012AD0((uint64_t)v7, (uint64_t)&unk_269BF3FA0, (uint64_t)v12);
  swift_release();
}

- (void)disableEnergyForecastDataCollectionForGridID:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B223E60);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_2521B70B0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_269BF3F70;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_269BF3F78;
  v14[5] = v13;
  uint64_t v15 = a3;
  uint64_t v16 = self;
  sub_252012AD0((uint64_t)v9, (uint64_t)&unk_269BF3F80, (uint64_t)v14);
  swift_release();
}

- (void)energyWindowsFor:(NSString *)a3 withCaching:(BOOL)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B223E60);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a3;
  *(unsigned char *)(v13 + 24) = a4;
  *(void *)(v13 + 32) = v12;
  *(void *)(v13 + 40) = self;
  uint64_t v14 = sub_2521B70B0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_269BF3F40;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_269BF3F48;
  v16[5] = v15;
  uint64_t v17 = a3;
  v18 = self;
  sub_252012AD0((uint64_t)v11, (uint64_t)&unk_269BF3F50, (uint64_t)v16);
  swift_release();
}

- (void)gridIDLookupWithCoordinate:(CLLocationCoordinate2D)a3 completionHandler:(id)a4
{
  CLLocationDegrees longitude = a3.longitude;
  CLLocationDegrees latitude = a3.latitude;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B223E60);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = _Block_copy(a4);
  uint64_t v12 = (CLLocationDegrees *)swift_allocObject();
  v12[2] = latitude;
  v12[3] = longitude;
  *((void *)v12 + 4) = v11;
  *((void *)v12 + 5) = self;
  uint64_t v13 = sub_2521B70B0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_269BF3F20;
  v14[5] = v12;
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_269BF3F28;
  v15[5] = v14;
  uint64_t v16 = self;
  sub_252012AD0((uint64_t)v10, (uint64_t)&unk_269BF3F30, (uint64_t)v15);
  swift_release();
}

- (_TtC16HomeEnergyDaemon15HomeEnergyProxy)init
{
  result = (_TtC16HomeEnergyDaemon15HomeEnergyProxy *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

- (void)registerEnergySiteWithSite:(_TtC19EnergyKitFoundation12EKEnergySite *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B223E60);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_2521B70B0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_269BF3F00;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_269BF3F08;
  v14[5] = v13;
  uint64_t v15 = a3;
  uint64_t v16 = self;
  sub_252012AD0((uint64_t)v9, (uint64_t)&unk_269BF3F10, (uint64_t)v14);
  swift_release();
}

- (void)getAllSiteIDsWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B223E60);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_2521B70B0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_269BF3EE0;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_269BF3EE8;
  v12[5] = v11;
  uint64_t v13 = self;
  sub_252012AD0((uint64_t)v7, (uint64_t)&unk_269BF3EF0, (uint64_t)v12);
  swift_release();
}

- (void)deleteEnergySiteWithSite:(_TtC19EnergyKitFoundation12EKEnergySite *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B223E60);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_2521B70B0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_269BF3EC0;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_269BF3EC8;
  v14[5] = v13;
  uint64_t v15 = a3;
  uint64_t v16 = self;
  sub_252012AD0((uint64_t)v9, (uint64_t)&unk_269BF3ED0, (uint64_t)v14);
  swift_release();
}

- (void)siteWithSiteID:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B223E60);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_2521B70B0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_269BF3EA0;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_269BF3EA8;
  v14[5] = v13;
  uint64_t v15 = a3;
  uint64_t v16 = self;
  sub_252012AD0((uint64_t)v9, (uint64_t)&unk_269BF3EB0, (uint64_t)v14);
  swift_release();
}

- (void)updateLocationWithSiteID:(NSString *)a3 location:(CLLocation *)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B223E60);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_2521B70B0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_269BF3E80;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_269BF3E88;
  v16[5] = v15;
  uint64_t v17 = a3;
  v18 = a4;
  uint64_t v19 = self;
  sub_252012AD0((uint64_t)v11, (uint64_t)&unk_269BF3E90, (uint64_t)v16);
  swift_release();
}

- (void)updateTimezoneWithSiteID:(NSString *)a3 timezone:(NSString *)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B223E60);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_2521B70B0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_269BF3E60;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_269BF3E68;
  v16[5] = v15;
  uint64_t v17 = a3;
  v18 = a4;
  uint64_t v19 = self;
  sub_252012AD0((uint64_t)v11, (uint64_t)&unk_269BF3E70, (uint64_t)v16);
  swift_release();
}

- (void)updateStateWithSiteID:(NSString *)a3 state:(NSString *)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B223E60);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_2521B70B0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_269BF3E40;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_269BF3E48;
  v16[5] = v15;
  uint64_t v17 = a3;
  v18 = a4;
  uint64_t v19 = self;
  sub_252012AD0((uint64_t)v11, (uint64_t)&unk_269BF3E50, (uint64_t)v16);
  swift_release();
}

- (void)updateFieldsWithSiteID:(NSString *)a3 from:(NSDictionary *)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B223E60);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_2521B70B0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_269BF3E20;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_269BF3E28;
  v16[5] = v15;
  uint64_t v17 = a3;
  v18 = a4;
  uint64_t v19 = self;
  sub_252012AD0((uint64_t)v11, (uint64_t)&unk_269BF3E30, (uint64_t)v16);
  swift_release();
}

- (void)updateSubscriptionWithSiteID:(NSString *)a3 utilityID:(NSString *)a4 subscriptionID:(NSString *)a5 accessToken:(NSString *)a6 refreshToken:(NSString *)a7 ckFunctionToken:(NSString *)a8 accountName:(NSString *)a9 accountNumber:(NSString *)a10 address:(NSString *)a11 serviceLocationID:(NSString *)a12 alternateSupplier:(NSString *)a13 accessTokenExpirationDate:(NSDate *)a14 completionHandler:(id)a15
{
  v49 = a8;
  v50 = self;
  v47 = a7;
  v48 = a14;
  v46 = a13;
  v44 = a3;
  v45 = a9;
  uint64_t v19 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B223E60);
  MEMORY[0x270FA5388](v19 - 8);
  v43 = (char *)&v43 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = _Block_copy(a15);
  uint64_t v22 = (void *)swift_allocObject();
  v22[2] = a3;
  v22[3] = a4;
  v22[4] = a5;
  v22[5] = a6;
  v23 = v49;
  v22[6] = v47;
  v22[7] = v23;
  v22[8] = a9;
  v22[9] = a10;
  v22[10] = a11;
  v22[11] = a12;
  v24 = v48;
  v22[12] = v46;
  v22[13] = v24;
  v25 = v50;
  v22[14] = v21;
  v22[15] = v25;
  uint64_t v26 = sub_2521B70B0();
  uint64_t v27 = (uint64_t)v43;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v43, 1, 1, v26);
  v28 = (void *)swift_allocObject();
  v28[2] = 0;
  v28[3] = 0;
  v28[4] = &unk_269BF3DF8;
  v28[5] = v22;
  v29 = (void *)swift_allocObject();
  v29[2] = 0;
  v29[3] = 0;
  v29[4] = &unk_269BF3E00;
  v29[5] = v28;
  v30 = v44;
  v31 = a4;
  v32 = a5;
  v33 = a6;
  v34 = v47;
  v35 = v49;
  v36 = v45;
  v37 = a10;
  v38 = a11;
  v39 = a12;
  v40 = v46;
  v41 = v48;
  v42 = v50;
  sub_252012AD0(v27, (uint64_t)&unk_269BF3E08, (uint64_t)v29);
  swift_release();
}

- (void)getCurrentLocationWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B223E60);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_2521B70B0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_269BF3DD0;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_269BF3DD8;
  v12[5] = v11;
  uint64_t v13 = self;
  sub_252012AD0((uint64_t)v7, (uint64_t)&unk_269BF3DE0, (uint64_t)v12);
  swift_release();
}

- (void)leanHistoricalEnergyUsageWithInterval:(NSString *)a3 start:(NSDate *)a4 end:(NSDate *)a5 subscriptionID:(NSString *)a6 utilityID:(NSString *)a7 timeZone:(NSTimeZone *)a8 flowDirection:(int64_t)a9 siteID:(NSString *)a10 completionHandler:(id)a11
{
  int64_t v36 = a9;
  v37 = self;
  uint64_t v18 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B223E60);
  MEMORY[0x270FA5388](v18 - 8);
  v35 = (char *)&v34 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = _Block_copy(a11);
  v21 = (void *)swift_allocObject();
  v21[2] = a3;
  v21[3] = a4;
  v21[4] = a5;
  v21[5] = a6;
  v21[6] = a7;
  v21[7] = a8;
  v21[8] = v36;
  v21[9] = a10;
  v21[10] = v20;
  v21[11] = self;
  uint64_t v22 = sub_2521B70B0();
  uint64_t v23 = (uint64_t)v35;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v35, 1, 1, v22);
  v24 = (void *)swift_allocObject();
  v24[2] = 0;
  v24[3] = 0;
  v24[4] = &unk_269BF3DA0;
  v24[5] = v21;
  v25 = (void *)swift_allocObject();
  v25[2] = 0;
  v25[3] = 0;
  v25[4] = &unk_269BF3DA8;
  v25[5] = v24;
  uint64_t v26 = a3;
  uint64_t v27 = a4;
  v28 = a5;
  v29 = a6;
  v30 = a7;
  v31 = a8;
  v32 = a10;
  v33 = v37;
  sub_252012AD0(v23, (uint64_t)&unk_269BF3DB0, (uint64_t)v25);
  swift_release();
}

- (void)historicalEnergyUsageWithInterval:(NSString *)a3 start:(NSDate *)a4 timezone:(NSString *)a5 utilityID:(NSString *)a6 subscriptionID:(NSString *)a7 completionHandler:(id)a8
{
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B223E60);
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v17 = (char *)&v29 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = _Block_copy(a8);
  uint64_t v19 = (void *)swift_allocObject();
  v19[2] = a3;
  v19[3] = a4;
  v19[4] = a5;
  v19[5] = a6;
  v19[6] = a7;
  v19[7] = v18;
  v19[8] = self;
  uint64_t v20 = sub_2521B70B0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v17, 1, 1, v20);
  v21 = (void *)swift_allocObject();
  v21[2] = 0;
  v21[3] = 0;
  v21[4] = &unk_269BF3D80;
  v21[5] = v19;
  uint64_t v22 = (void *)swift_allocObject();
  v22[2] = 0;
  v22[3] = 0;
  v22[4] = &unk_269BF3D88;
  v22[5] = v21;
  uint64_t v23 = a3;
  v24 = a4;
  v25 = a5;
  uint64_t v26 = a6;
  uint64_t v27 = a7;
  v28 = self;
  sub_252012AD0((uint64_t)v17, (uint64_t)&unk_269BF3D90, (uint64_t)v22);
  swift_release();
}

- (void)isDataAvailableWithSiteID:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B223E60);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_2521B70B0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_269BF3D58;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_269BF3D60;
  v14[5] = v13;
  uint64_t v15 = a3;
  uint64_t v16 = self;
  sub_252012AD0((uint64_t)v9, (uint64_t)&unk_269BF3D68, (uint64_t)v14);
  swift_release();
}

- (void)createUtilitySubscriptionWithSiteID:(NSString *)a3 utilityID:(NSString *)a4 serviceLocationID:(NSString *)a5 accessToken:(NSString *)a6 refreshToken:(NSString *)a7 completionHandler:(id)a8
{
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B223E60);
  MEMORY[0x270FA5388](v15 - 8);
  uint64_t v17 = (char *)&v29 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = _Block_copy(a8);
  uint64_t v19 = (void *)swift_allocObject();
  v19[2] = a3;
  v19[3] = a4;
  v19[4] = a5;
  v19[5] = a6;
  v19[6] = a7;
  v19[7] = v18;
  v19[8] = self;
  uint64_t v20 = sub_2521B70B0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v17, 1, 1, v20);
  v21 = (void *)swift_allocObject();
  v21[2] = 0;
  v21[3] = 0;
  v21[4] = &unk_269BF3D38;
  v21[5] = v19;
  uint64_t v22 = (void *)swift_allocObject();
  v22[2] = 0;
  v22[3] = 0;
  v22[4] = &unk_269BF3D40;
  v22[5] = v21;
  uint64_t v23 = a3;
  v24 = a4;
  v25 = a5;
  uint64_t v26 = a6;
  uint64_t v27 = a7;
  v28 = self;
  sub_252012AD0((uint64_t)v17, (uint64_t)&unk_269BF3D48, (uint64_t)v22);
  swift_release();
}

- (void)createUtilitySubscriptionWithSiteID:(NSString *)a3 utilityID:(NSString *)a4 serviceLocationID:(NSString *)a5 accessToken:(NSString *)a6 accessTokenExpirationDate:(NSDate *)a7 refreshToken:(NSString *)a8 utilityCustomerName:(NSString *)a9 completionHandler:(id)a10
{
  uint64_t v34 = a9;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B223E60);
  MEMORY[0x270FA5388](v17 - 8);
  v33 = (char *)&v33 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = _Block_copy(a10);
  uint64_t v20 = (void *)swift_allocObject();
  v20[2] = a3;
  v20[3] = a4;
  v20[4] = a5;
  v20[5] = a6;
  v20[6] = a7;
  v20[7] = a8;
  v20[8] = a9;
  v20[9] = v19;
  v20[10] = self;
  uint64_t v21 = sub_2521B70B0();
  uint64_t v22 = (uint64_t)v33;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v33, 1, 1, v21);
  uint64_t v23 = (void *)swift_allocObject();
  v23[2] = 0;
  v23[3] = 0;
  v23[4] = &unk_269BF3D18;
  v23[5] = v20;
  v24 = (void *)swift_allocObject();
  v24[2] = 0;
  v24[3] = 0;
  v24[4] = &unk_269BF3D20;
  v24[5] = v23;
  v25 = a3;
  uint64_t v26 = a4;
  uint64_t v27 = a5;
  v28 = a6;
  uint64_t v29 = a7;
  v30 = a8;
  v31 = v34;
  v32 = self;
  sub_252012AD0(v22, (uint64_t)&unk_269BF3D28, (uint64_t)v24);
  swift_release();
}

- (void)createUtilitySubscriptionWithSiteID:(NSString *)a3 utilityID:(NSString *)a4 serviceLocationID:(NSString *)a5 accessToken:(NSString *)a6 accessTokenExpirationDate:(NSDate *)a7 refreshToken:(NSString *)a8 address:(NSString *)a9 utilityCustomerName:(NSString *)a10 completionHandler:(id)a11
{
  v37 = a9;
  v38 = a8;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B223E60);
  MEMORY[0x270FA5388](v17 - 8);
  int64_t v36 = (char *)&v35 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = _Block_copy(a11);
  uint64_t v20 = (void *)swift_allocObject();
  v20[2] = a3;
  v20[3] = a4;
  v20[4] = a5;
  v20[5] = a6;
  uint64_t v21 = v38;
  v20[6] = a7;
  v20[7] = v21;
  v20[8] = a9;
  v20[9] = a10;
  v20[10] = v19;
  v20[11] = self;
  uint64_t v22 = sub_2521B70B0();
  uint64_t v23 = (uint64_t)v36;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v36, 1, 1, v22);
  v24 = (void *)swift_allocObject();
  v24[2] = 0;
  v24[3] = 0;
  v24[4] = &unk_269BF3CF8;
  v24[5] = v20;
  v25 = (void *)swift_allocObject();
  v25[2] = 0;
  v25[3] = 0;
  v25[4] = &unk_269BF3D00;
  v25[5] = v24;
  uint64_t v26 = a3;
  uint64_t v27 = a4;
  v28 = a5;
  uint64_t v29 = a6;
  v30 = a7;
  v31 = v38;
  v32 = v37;
  v33 = a10;
  uint64_t v34 = self;
  sub_252012AD0(v23, (uint64_t)&unk_269BF3D08, (uint64_t)v25);
  swift_release();
}

- (void)revokeUtilitySubscriptionWithSiteID:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B223E60);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_2521B70B0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_269BF3CD8;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_269BF3CE0;
  v14[5] = v13;
  uint64_t v15 = a3;
  uint64_t v16 = self;
  sub_252012AD0((uint64_t)v9, (uint64_t)&unk_269BF3CE8, (uint64_t)v14);
  swift_release();
}

- (void)renewUtilityAccessTokenWithSiteID:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B223E60);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_2521B70B0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_269BF3CB8;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_269BF3CC0;
  v14[5] = v13;
  uint64_t v15 = a3;
  uint64_t v16 = self;
  sub_252012AD0((uint64_t)v9, (uint64_t)&unk_269BF3CC8, (uint64_t)v14);
  swift_release();
}

- (void)completedOnboardingWithId:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B223E60);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_2521B70B0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_269BF3C98;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_269BF3CA0;
  v14[5] = v13;
  uint64_t v15 = a3;
  uint64_t v16 = self;
  sub_252012AD0((uint64_t)v9, (uint64_t)&unk_269BF3CA8, (uint64_t)v14);
  swift_release();
}

- (void)updateCompletedOnboardingWithId:(NSString *)a3 value:(BOOL)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B223E60);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a3;
  *(unsigned char *)(v13 + 24) = a4;
  *(void *)(v13 + 32) = v12;
  *(void *)(v13 + 40) = self;
  uint64_t v14 = sub_2521B70B0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_269BF3C78;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_269BF3C80;
  v16[5] = v15;
  uint64_t v17 = a3;
  uint64_t v18 = self;
  sub_252012AD0((uint64_t)v11, (uint64_t)&unk_269BF3C88, (uint64_t)v16);
  swift_release();
}

- (void)utilitiesNearLocationWithLocation:(CLLocationCoordinate2D)a3 completionHandler:(id)a4
{
  CLLocationDegrees longitude = a3.longitude;
  CLLocationDegrees latitude = a3.latitude;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B223E60);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = _Block_copy(a4);
  uint64_t v12 = (CLLocationDegrees *)swift_allocObject();
  v12[2] = latitude;
  v12[3] = longitude;
  *((void *)v12 + 4) = v11;
  *((void *)v12 + 5) = self;
  uint64_t v13 = sub_2521B70B0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_269BF3C58;
  v14[5] = v12;
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_269BF3C60;
  v15[5] = v14;
  uint64_t v16 = self;
  sub_252012AD0((uint64_t)v10, (uint64_t)&unk_269BF3C68, (uint64_t)v15);
  swift_release();
}

- (void)utilityInformationWithUtilityID:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B223E60);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_2521B70B0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_269BF3C38;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_269BF3C40;
  v14[5] = v13;
  uint64_t v15 = a3;
  uint64_t v16 = self;
  sub_252012AD0((uint64_t)v9, (uint64_t)&unk_269BF3C48, (uint64_t)v14);
  swift_release();
}

- (void)isTAFEnabledWithUtilityID:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B223E60);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_2521B70B0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_269BF3C18;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_269BF3C20;
  v14[5] = v13;
  uint64_t v15 = a3;
  uint64_t v16 = self;
  sub_252012AD0((uint64_t)v9, (uint64_t)&unk_269BF3C28, (uint64_t)v14);
  swift_release();
}

- (void)getAllUtilitiesWithCountryCode:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B223E60);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_2521B70B0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_269BF3BF8;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_269BF3C00;
  v14[5] = v13;
  uint64_t v15 = a3;
  uint64_t v16 = self;
  sub_252012AD0((uint64_t)v9, (uint64_t)&unk_269BF3C08, (uint64_t)v14);
  swift_release();
}

- (void)useUtilityMockDataWithEnableMock:(BOOL)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B223E60);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject();
  *(unsigned char *)(v11 + 16) = a3;
  *(void *)(v11 + 24) = v10;
  *(void *)(v11 + 32) = self;
  uint64_t v12 = sub_2521B70B0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_269BF3BD8;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_269BF3BE0;
  v14[5] = v13;
  uint64_t v15 = self;
  sub_252012AD0((uint64_t)v9, (uint64_t)&unk_269BF3BE8, (uint64_t)v14);
  swift_release();
}

- (void)clearCacheWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B223E60);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_2521B70B0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_269BF3BB8;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_269BF3BC0;
  v12[5] = v11;
  uint64_t v13 = self;
  sub_252012AD0((uint64_t)v7, (uint64_t)&unk_269BF3BC8, (uint64_t)v12);
  swift_release();
}

- (void)intervalReadingWithSubscriptionID:(NSString *)a3 utilityID:(NSString *)a4 interval:(NSString *)a5 start:(NSDate *)a6 end:(NSDate *)a7 timeZone:(NSTimeZone *)a8 flowDirection:(NSString *)a9 completionHandler:(id)a10
{
  uint64_t v34 = a9;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B223E60);
  MEMORY[0x270FA5388](v17 - 8);
  v33 = (char *)&v33 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = _Block_copy(a10);
  uint64_t v20 = (void *)swift_allocObject();
  v20[2] = a3;
  v20[3] = a4;
  v20[4] = a5;
  v20[5] = a6;
  v20[6] = a7;
  v20[7] = a8;
  v20[8] = a9;
  v20[9] = v19;
  v20[10] = self;
  uint64_t v21 = sub_2521B70B0();
  uint64_t v22 = (uint64_t)v33;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v33, 1, 1, v21);
  uint64_t v23 = (void *)swift_allocObject();
  v23[2] = 0;
  v23[3] = 0;
  v23[4] = &unk_269BF3B68;
  v23[5] = v20;
  v24 = (void *)swift_allocObject();
  v24[2] = 0;
  v24[3] = 0;
  v24[4] = &unk_269BF3B70;
  v24[5] = v23;
  v25 = a3;
  uint64_t v26 = a4;
  uint64_t v27 = a5;
  v28 = a6;
  uint64_t v29 = a7;
  v30 = a8;
  v31 = v34;
  v32 = self;
  sub_252012AD0(v22, (uint64_t)&unk_269BF3B78, (uint64_t)v24);
  swift_release();
}

- (void)generateMockAMIDataWithSiteID:(NSString *)a3 startDate:(NSString *)a4 endDate:(NSString *)a5 forceAllReadingsToConstant:(BOOL)a6 recordInterval:(int64_t)a7 batchSize:(int64_t)a8 rateSchedule:(NSString *)a9 netMetering:(BOOL)a10 direction:(int64_t)a11 randomization:(BOOL)a12 completionHandler:(id)a13
{
  int64_t v35 = a8;
  int64_t v36 = a4;
  int64_t v33 = a7;
  uint64_t v34 = self;
  v37 = a5;
  HIDWORD(v32) = a12;
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B223E60);
  MEMORY[0x270FA5388](v17 - 8);
  uint64_t v19 = (char *)&v32 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = _Block_copy(a13);
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = a3;
  *(void *)(v21 + 24) = a4;
  *(void *)(v21 + 32) = a5;
  *(unsigned char *)(v21 + 40) = a6;
  uint64_t v22 = v34;
  int64_t v23 = v35;
  *(void *)(v21 + 48) = v33;
  *(void *)(v21 + 56) = v23;
  *(void *)(v21 + 64) = a9;
  *(unsigned char *)(v21 + 72) = a10;
  *(void *)(v21 + 80) = a11;
  *(unsigned char *)(v21 + 88) = BYTE4(v32);
  *(void *)(v21 + 96) = v20;
  *(void *)(v21 + 104) = v22;
  uint64_t v24 = sub_2521B70B0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v19, 1, 1, v24);
  v25 = (void *)swift_allocObject();
  v25[2] = 0;
  v25[3] = 0;
  v25[4] = &unk_269BF3B48;
  v25[5] = v21;
  uint64_t v26 = (void *)swift_allocObject();
  v26[2] = 0;
  v26[3] = 0;
  v26[4] = &unk_269BF3B50;
  v26[5] = v25;
  uint64_t v27 = a3;
  v28 = v36;
  uint64_t v29 = v37;
  v30 = a9;
  v31 = v22;
  sub_252012AD0((uint64_t)v19, (uint64_t)&unk_269BF3B58, (uint64_t)v26);
  swift_release();
}

- (void)generateMultipleMeterMockAMIDataWithSiteID:(NSString *)a3 startDate:(NSString *)a4 endDate:(NSString *)a5 recordInterval:(int64_t)a6 rateSchedule:(NSString *)a7 multipleMeters:(int64_t)a8 completionHandler:(id)a9
{
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B223E60);
  MEMORY[0x270FA5388](v16 - 8);
  uint64_t v18 = (char *)&v29 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = _Block_copy(a9);
  uint64_t v20 = (void *)swift_allocObject();
  v20[2] = a3;
  v20[3] = a4;
  v20[4] = a5;
  v20[5] = a6;
  v20[6] = a7;
  v20[7] = a8;
  v20[8] = v19;
  v20[9] = self;
  uint64_t v21 = sub_2521B70B0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v18, 1, 1, v21);
  uint64_t v22 = (void *)swift_allocObject();
  v22[2] = 0;
  v22[3] = 0;
  v22[4] = &unk_269BF3B28;
  v22[5] = v20;
  int64_t v23 = (void *)swift_allocObject();
  v23[2] = 0;
  v23[3] = 0;
  v23[4] = &unk_269BF3B30;
  v23[5] = v22;
  uint64_t v24 = a3;
  v25 = a4;
  uint64_t v26 = a5;
  uint64_t v27 = a7;
  v28 = self;
  sub_252012AD0((uint64_t)v18, (uint64_t)&unk_269BF3B38, (uint64_t)v23);
  swift_release();
}

- (void)refreshCurrentUtilityPeakPeriodsWithSiteID:(NSString *)a3 start:(NSDate *)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B223E60);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_2521B70B0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_269BF3AF8;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_269BF3B00;
  v16[5] = v15;
  uint64_t v17 = a3;
  uint64_t v18 = a4;
  uint64_t v19 = self;
  sub_252012AD0((uint64_t)v11, (uint64_t)&unk_269BF3B08, (uint64_t)v16);
  swift_release();
}

- (void)triggerAMIFetchFromDropboxWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B223E60);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_2521B70B0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_269BF3AC0;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_269BF3AC8;
  v12[5] = v11;
  uint64_t v13 = self;
  sub_252012AD0((uint64_t)v7, (uint64_t)&unk_269BF3AD0, (uint64_t)v12);
  swift_release();
}

- (void)requestAddToShareForHomeUUID:(NSUUID *)a3 siteID:(NSString *)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B223E60);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_2521B70B0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_269BF3A88;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_269BF3A90;
  v16[5] = v15;
  uint64_t v17 = a3;
  uint64_t v18 = a4;
  uint64_t v19 = self;
  sub_252012AD0((uint64_t)v11, (uint64_t)&unk_269BF3A98, (uint64_t)v16);
  swift_release();
}

- (void)resetUtilityDataWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B223E60);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_2521B70B0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_269BF3A50;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_269BF3A58;
  v12[5] = v11;
  uint64_t v13 = self;
  sub_252012AD0((uint64_t)v7, (uint64_t)&unk_269BF3A60, (uint64_t)v12);
  swift_release();
}

- (void)submitTestTaskWithTaskID:(NSString *)a3 delay:(int64_t)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B223E60);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_2521B70B0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_269BF3A18;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_269BF3A20;
  v16[5] = v15;
  uint64_t v17 = a3;
  uint64_t v18 = self;
  sub_252012AD0((uint64_t)v11, (uint64_t)&unk_269BF3A28, (uint64_t)v16);
  swift_release();
}

- (void)setKVSDictionaryWithKey:(NSString *)a3 dict:(NSDictionary *)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B223E60);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_2521B70B0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_269BF39F0;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_269BF39F8;
  v16[5] = v15;
  uint64_t v17 = a3;
  uint64_t v18 = a4;
  uint64_t v19 = self;
  sub_252012AD0((uint64_t)v11, (uint64_t)&unk_269BF3A00, (uint64_t)v16);
  swift_release();
}

- (void)getKVSDictionaryWithKey:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B223E60);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_2521B70B0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_269BF39C8;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_269BF39D0;
  v14[5] = v13;
  uint64_t v15 = a3;
  uint64_t v16 = self;
  sub_252012AD0((uint64_t)v9, (uint64_t)&unk_269BF39D8, (uint64_t)v14);
  swift_release();
}

- (void)forceIndependentTokenRotateWithToken:(NSString *)a3 utility:(NSString *)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B223E60);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_2521B70B0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_269BF3980;
  v15[5] = v13;
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_269BF3990;
  v16[5] = v15;
  uint64_t v17 = a3;
  uint64_t v18 = a4;
  uint64_t v19 = self;
  sub_252012AD0((uint64_t)v11, (uint64_t)&unk_269BF39A0, (uint64_t)v16);
  swift_release();
}

@end