@interface ENManagerAdapter
+ (_TtC28HealthExposureNotificationUI16ENManagerAdapter)defaultAdapter;
+ (void)setDefaultAdapter:(id)a3;
- (BOOL)areAvailabilityAlertsEnabled;
- (BOOL)isAvailabilityAlertsSwitchEnabled;
- (BOOL)isExposureLoggingDataPresent;
- (BOOL)tccContainsRecordForBundleIdentifier:(id)a3;
- (ENManager)manager;
- (NSSet)statusChangeObservers;
- (_TtC28HealthExposureNotificationUI16ENManagerAdapter)init;
- (int64_t)exposureNotificationStatus;
- (void)allRegionConfigurations:(id)a3;
- (void)dealloc;
- (void)didEnterLegalConsentPageForRegion:(id)a3;
- (void)fetchAgencyModelForRegionCode:(id)a3 reason:(unsigned int)a4 completion:(id)a5;
- (void)fetchAllEntities:(id)a3;
- (void)fetchSubdivisionsForRegion:(id)a3 completion:(id)a4;
- (void)getAgencyModelForBundleID:(id)a3 completion:(id)a4;
- (void)getAgencyModelForRegionCode:(id)a3 completion:(id)a4;
- (void)getLastVisitedRegionWithCompletion:(id)a3;
- (void)isKeyReleasePreAuthorizedForRegion:(id)a3 completion:(id)a4;
- (void)isTravelStatusEnabledForRegion:(id)a3 completion:(id)a4;
- (void)latestExposureNotification:(id)a3;
- (void)notifyChangeObserversForChangeFrom:(int64_t)a3 to:(int64_t)a4;
- (void)onboardingDidStartForRegion:(id)a3 source:(int64_t)a4;
- (void)refreshStatusWithCompletion:(id)a3;
- (void)resetAllDataAndDisableExposureNotifications:(id)a3;
- (void)setActivePhaseOneAppWithBundleIdentifier:(id)a3 completion:(id)a4;
- (void)setActiveRegion:(id)a3 completion:(id)a4;
- (void)setAreAvailabilityAlertsEnabled:(BOOL)a3;
- (void)setAvailabilityAlertsEnabled:(BOOL)a3 completion:(id)a4;
- (void)setExposureNotificationEnabled:(BOOL)a3 completion:(id)a4;
- (void)setExposureNotificationStatus:(int64_t)a3;
- (void)setIsAvailabilityAlertsSwitchEnabled:(BOOL)a3;
- (void)setIsExposureLoggingDataPresent:(BOOL)a3;
- (void)setPreAuthorizeDiagnosisKeysEnabled:(BOOL)a3 forRegion:(id)a4 completion:(id)a5;
- (void)setShareAnalyticsEnabled:(BOOL)a3 region:(id)a4 version:(id)a5 completion:(id)a6;
- (void)setStatusChangeObservers:(id)a3;
- (void)setTravelStatusEnabled:(BOOL)a3 region:(id)a4 completion:(id)a5;
- (void)setUserConsent:(int64_t)a3 region:(id)a4 text:(id)a5 version:(id)a6 completion:(id)a7;
- (void)setWeeklySummaryEnabled:(BOOL)a3 completion:(id)a4;
@end

@implementation ENManagerAdapter

- (int64_t)exposureNotificationStatus
{
  v2 = (int64_t *)((char *)self
                        + OBJC_IVAR____TtC28HealthExposureNotificationUI16ENManagerAdapter_exposureNotificationStatus);
  swift_beginAccess();
  return *v2;
}

- (void)setExposureNotificationStatus:(int64_t)a3
{
  v4 = (int64_t *)((char *)self
                        + OBJC_IVAR____TtC28HealthExposureNotificationUI16ENManagerAdapter_exposureNotificationStatus);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (BOOL)isExposureLoggingDataPresent
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC28HealthExposureNotificationUI16ENManagerAdapter_isExposureLoggingDataPresent;
  swift_beginAccess();
  return *v2;
}

- (void)setIsExposureLoggingDataPresent:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR____TtC28HealthExposureNotificationUI16ENManagerAdapter_isExposureLoggingDataPresent;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)areAvailabilityAlertsEnabled
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC28HealthExposureNotificationUI16ENManagerAdapter_areAvailabilityAlertsEnabled;
  swift_beginAccess();
  return *v2;
}

- (void)setAreAvailabilityAlertsEnabled:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR____TtC28HealthExposureNotificationUI16ENManagerAdapter_areAvailabilityAlertsEnabled;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)isAvailabilityAlertsSwitchEnabled
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC28HealthExposureNotificationUI16ENManagerAdapter_isAvailabilityAlertsSwitchEnabled;
  swift_beginAccess();
  return *v2;
}

- (void)setIsAvailabilityAlertsSwitchEnabled:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR____TtC28HealthExposureNotificationUI16ENManagerAdapter_isAvailabilityAlertsSwitchEnabled;
  swift_beginAccess();
  BOOL *v4 = a3;
}

+ (_TtC28HealthExposureNotificationUI16ENManagerAdapter)defaultAdapter
{
  if (qword_26AF0EF18 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return (_TtC28HealthExposureNotificationUI16ENManagerAdapter *)(id)static ENManagerAdapter.defaultAdapter;
}

+ (void)setDefaultAdapter:(id)a3
{
  uint64_t v3 = qword_26AF0EF18;
  id v4 = a3;
  if (v3 != -1) {
    swift_once();
  }
  swift_beginAccess();
  v5 = (void *)static ENManagerAdapter.defaultAdapter;
  static ENManagerAdapter.defaultAdapter = (uint64_t)v4;
}

- (ENManager)manager
{
  return (ENManager *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                              + OBJC_IVAR____TtC28HealthExposureNotificationUI16ENManagerAdapter_manager));
}

- (NSSet)statusChangeObservers
{
  swift_beginAccess();
  type metadata accessor for ENManagerAdapter.StatusChangeObserver();
  sub_2293DF8EC((unint64_t *)&qword_2683171B8, (void (*)(uint64_t))type metadata accessor for ENManagerAdapter.StatusChangeObserver);
  swift_bridgeObjectRetain();
  v2 = (void *)sub_229419308();
  swift_bridgeObjectRelease();

  return (NSSet *)v2;
}

- (void)setStatusChangeObservers:(id)a3
{
  type metadata accessor for ENManagerAdapter.StatusChangeObserver();
  sub_2293DF8EC((unint64_t *)&qword_2683171B8, (void (*)(uint64_t))type metadata accessor for ENManagerAdapter.StatusChangeObserver);
  uint64_t v4 = sub_229419318();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC28HealthExposureNotificationUI16ENManagerAdapter_statusChangeObservers);
  swift_beginAccess();
  uint64_t *v5 = v4;
  swift_bridgeObjectRelease();
}

- (_TtC28HealthExposureNotificationUI16ENManagerAdapter)init
{
  return (_TtC28HealthExposureNotificationUI16ENManagerAdapter *)ENManagerAdapter.init()();
}

- (void)dealloc
{
  v2 = self;
  ENManagerAdapter.__deallocating_deinit();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI16ENManagerAdapter_manager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI16ENManagerAdapter_activationGroup));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI16ENManagerAdapter_statusObservation));

  swift_bridgeObjectRelease();
}

- (void)refreshStatusWithCompletion:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = (void *)swift_allocObject();
  v6[2] = self;
  v6[3] = sub_2293DF5BC;
  v6[4] = v5;
  v7 = self;
  swift_retain();
  sub_2293D43B4((uint64_t)sub_2293DFD74, (uint64_t)v6);

  swift_release();

  swift_release();
}

- (void)setExposureNotificationEnabled:(BOOL)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = self;
  *(unsigned char *)(v8 + 24) = a3;
  *(void *)(v8 + 32) = sub_2293D2F70;
  *(void *)(v8 + 40) = v7;
  v9 = self;
  swift_retain();
  sub_2293D43B4((uint64_t)sub_2293DFBBC, v8);

  swift_release();

  swift_release();
}

- (void)onboardingDidStartForRegion:(id)a3 source:(int64_t)a4
{
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = a4;
  v7[3] = self;
  v7[4] = a3;
  id v8 = a3;
  v9 = self;
  id v10 = v8;
  sub_2293D43B4((uint64_t)sub_2293B9F90, (uint64_t)v7);

  swift_release();
}

- (void)didEnterLegalConsentPageForRegion:(id)a3
{
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = self;
  *(void *)(v5 + 24) = a3;
  id v6 = a3;
  uint64_t v7 = self;
  id v8 = v6;
  sub_2293D43B4((uint64_t)sub_2293DFB98, v5);

  swift_release();
}

- (void)fetchSubdivisionsForRegion:(id)a3 completion:(id)a4
{
  id v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = (void *)swift_allocObject();
  v8[2] = self;
  v8[3] = a3;
  v8[4] = sub_2293DF564;
  v8[5] = v7;
  id v9 = a3;
  id v10 = self;
  id v11 = v9;
  swift_retain();
  sub_2293D43B4((uint64_t)sub_2293DFBB8, (uint64_t)v8);

  swift_release();

  swift_release();
}

- (void)setActiveRegion:(id)a3 completion:(id)a4
{
  id v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = (void *)swift_allocObject();
  v8[2] = self;
  v8[3] = a3;
  v8[4] = sub_2293DFBC0;
  v8[5] = v7;
  id v9 = a3;
  id v10 = self;
  id v11 = v9;
  swift_retain();
  sub_2293D43B4((uint64_t)sub_2293DFBB4, (uint64_t)v8);

  swift_release();

  swift_release();
}

- (void)setActivePhaseOneAppWithBundleIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  uint64_t v6 = sub_2294191A8();
  uint64_t v8 = v7;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v5;
  id v10 = (void *)swift_allocObject();
  v10[2] = self;
  v10[3] = v6;
  v10[4] = v8;
  v10[5] = sub_2293DFBC0;
  v10[6] = v9;
  id v11 = self;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_2293D43B4((uint64_t)sub_2293D6058, (uint64_t)v10);

  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
}

- (void)latestExposureNotification:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = (void *)swift_allocObject();
  v6[2] = self;
  v6[3] = sub_2293DFD78;
  v6[4] = v5;
  uint64_t v7 = self;
  swift_retain();
  sub_2293D43B4((uint64_t)sub_2293DFD70, (uint64_t)v6);

  swift_release();

  swift_release();
}

- (void)fetchAgencyModelForRegionCode:(id)a3 reason:(unsigned int)a4 completion:(id)a5
{
  uint64_t v7 = _Block_copy(a5);
  sub_2294191A8();
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  uint64_t v9 = self;
  id v10 = (void *)sub_229419178();
  id v11 = objc_msgSend(self, sel_regionWithCode_, v10);

  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v9;
  *(void *)(v12 + 24) = v11;
  *(_DWORD *)(v12 + 32) = a4;
  *(void *)(v12 + 40) = sub_2293DF504;
  *(void *)(v12 + 48) = v8;
  v13 = v9;
  id v14 = v11;
  swift_retain();
  sub_2293D43B4((uint64_t)sub_2293C7AA8, v12);

  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
}

- (void)fetchAllEntities:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = (void *)swift_allocObject();
  v6[2] = self;
  v6[3] = sub_2293DF4F8;
  v6[4] = v5;
  uint64_t v7 = self;
  swift_retain();
  sub_2293D43B4((uint64_t)sub_2293DFD6C, (uint64_t)v6);

  swift_release();

  swift_release();
}

- (void)getAgencyModelForBundleID:(id)a3 completion:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  uint64_t v6 = sub_2294191A8();
  uint64_t v8 = v7;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v5;
  id v10 = (void *)swift_allocObject();
  v10[2] = sub_2293DFD78;
  v10[3] = v9;
  v10[4] = v6;
  v10[5] = v8;
  id v11 = self;
  swift_retain();
  swift_bridgeObjectRetain();
  sub_2293D43B4((uint64_t)sub_2293DFBB0, (uint64_t)v10);

  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
}

- (void)getAgencyModelForRegionCode:(id)a3 completion:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  uint64_t v6 = sub_2294191A8();
  uint64_t v8 = v7;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v5;
  id v10 = (void *)swift_allocObject();
  v10[2] = sub_2293DF4DC;
  v10[3] = v9;
  v10[4] = v6;
  v10[5] = v8;
  id v11 = self;
  swift_retain();
  swift_bridgeObjectRetain();
  sub_2293D43B4((uint64_t)sub_2293DFBAC, (uint64_t)v10);

  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
}

- (void)getLastVisitedRegionWithCompletion:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = (void *)swift_allocObject();
  v6[2] = self;
  v6[3] = sub_2293DF4D0;
  v6[4] = v5;
  uint64_t v7 = self;
  swift_retain();
  sub_2293D43B4((uint64_t)sub_2293DFD68, (uint64_t)v6);

  swift_release();

  swift_release();
}

- (void)allRegionConfigurations:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = (void *)swift_allocObject();
  v6[2] = self;
  v6[3] = sub_2293DF4C4;
  v6[4] = v5;
  uint64_t v7 = self;
  swift_retain();
  sub_2293D43B4((uint64_t)sub_2293DFD64, (uint64_t)v6);

  swift_release();

  swift_release();
}

- (void)setShareAnalyticsEnabled:(BOOL)a3 region:(id)a4 version:(id)a5 completion:(id)a6
{
  uint64_t v9 = _Block_copy(a6);
  uint64_t v10 = sub_2294191A8();
  uint64_t v12 = v11;
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v9;
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v10;
  *(void *)(v14 + 24) = v12;
  *(unsigned char *)(v14 + 32) = a3;
  *(void *)(v14 + 40) = self;
  *(void *)(v14 + 48) = a4;
  *(void *)(v14 + 56) = sub_2293DFBC0;
  *(void *)(v14 + 64) = v13;
  id v15 = a4;
  v16 = self;
  id v17 = v15;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_2293D43B4((uint64_t)sub_2293D8A04, v14);

  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
}

- (void)isTravelStatusEnabledForRegion:(id)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  uint64_t v8 = (void *)swift_allocObject();
  v8[2] = self;
  v8[3] = a3;
  v8[4] = sub_2293DFB94;
  v8[5] = v7;
  id v9 = a3;
  uint64_t v10 = self;
  id v11 = v9;
  swift_retain();
  sub_2293D43B4((uint64_t)sub_2293DFBA8, (uint64_t)v8);

  swift_release();

  swift_release();
}

- (void)setTravelStatusEnabled:(BOOL)a3 region:(id)a4 completion:(id)a5
{
  uint64_t v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = self;
  *(unsigned char *)(v10 + 24) = a3;
  *(void *)(v10 + 32) = a4;
  *(void *)(v10 + 40) = sub_2293DFBC0;
  *(void *)(v10 + 48) = v9;
  id v11 = a4;
  uint64_t v12 = self;
  id v13 = v11;
  swift_retain();
  sub_2293D43B4((uint64_t)sub_2293D8E84, v10);

  swift_release();

  swift_release();
}

- (void)isKeyReleasePreAuthorizedForRegion:(id)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  uint64_t v8 = (void *)swift_allocObject();
  v8[2] = self;
  v8[3] = a3;
  v8[4] = sub_2293DF3EC;
  v8[5] = v7;
  id v9 = a3;
  uint64_t v10 = self;
  id v11 = v9;
  swift_retain();
  sub_2293D43B4((uint64_t)sub_2293DFBA4, (uint64_t)v8);

  swift_release();

  swift_release();
}

- (void)setPreAuthorizeDiagnosisKeysEnabled:(BOOL)a3 forRegion:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  uint64_t v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  id v10 = a4;
  id v11 = self;
  uint64_t v12 = [(ENManagerAdapter *)v11 manager];
  v14[4] = sub_2293DFBC0;
  v14[5] = v9;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 1107296256;
  v14[2] = sub_2293D4200;
  v14[3] = &block_descriptor_132;
  id v13 = _Block_copy(v14);
  swift_retain();
  swift_release();
  [(ENManager *)v12 setPreAuthorizeDiagnosisKeysEnabled:v6 region:v10 completionHandler:v13];
  _Block_release(v13);

  swift_release();
}

- (void)resetAllDataAndDisableExposureNotifications:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  BOOL v6 = (void *)swift_allocObject();
  v6[2] = self;
  v6[3] = sub_2293DFBC0;
  v6[4] = v5;
  uint64_t v7 = self;
  swift_retain();
  sub_2293D43B4((uint64_t)sub_2293DFD60, (uint64_t)v6);

  swift_release();

  swift_release();
}

- (void)setAvailabilityAlertsEnabled:(BOOL)a3 completion:(id)a4
{
  BOOL v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = self;
  *(unsigned char *)(v8 + 24) = a3;
  *(void *)(v8 + 32) = sub_2293DFBC0;
  *(void *)(v8 + 40) = v7;
  uint64_t v9 = self;
  swift_retain();
  sub_2293D43B4((uint64_t)sub_2293DFBA0, v8);

  swift_release();

  swift_release();
}

- (void)setWeeklySummaryEnabled:(BOOL)a3 completion:(id)a4
{
  BOOL v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = self;
  *(unsigned char *)(v8 + 24) = a3;
  *(void *)(v8 + 32) = sub_2293DFBC0;
  *(void *)(v8 + 40) = v7;
  uint64_t v9 = self;
  swift_retain();
  sub_2293D43B4((uint64_t)sub_2293DFB9C, v8);

  swift_release();

  swift_release();
}

- (void)setUserConsent:(int64_t)a3 region:(id)a4 text:(id)a5 version:(id)a6 completion:(id)a7
{
  id v11 = _Block_copy(a7);
  if (a5)
  {
    uint64_t v12 = sub_2294191A8();
    a5 = v13;
  }
  else
  {
    uint64_t v12 = 0;
  }
  uint64_t v14 = sub_2294191A8();
  uint64_t v16 = v15;
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v11;
  v18 = (void *)swift_allocObject();
  v18[2] = v14;
  v18[3] = v16;
  v18[4] = a3;
  v18[5] = v12;
  v18[6] = a5;
  v18[7] = self;
  v18[8] = a4;
  v18[9] = sub_2293DF39C;
  v18[10] = v17;
  swift_bridgeObjectRetain();
  swift_retain();
  id v19 = a4;
  v20 = self;
  id v21 = v19;
  swift_bridgeObjectRetain();
  sub_2293D43B4((uint64_t)sub_2293B972C, (uint64_t)v18);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
}

- (BOOL)tccContainsRecordForBundleIdentifier:(id)a3
{
  sub_2294191A8();
  uint64_t v4 = self;
  _s28HealthExposureNotificationUI16ENManagerAdapterC17tccContainsRecord19forBundleIdentifierSbSS_tF_0();
  char v6 = v5;

  swift_bridgeObjectRelease();
  return v6 & 1;
}

- (void)notifyChangeObserversForChangeFrom:(int64_t)a3 to:(int64_t)a4
{
  swift_beginAccess();
  uint64_t v7 = self;
  uint64_t v8 = swift_bridgeObjectRetain();
  sub_229404CC4(v8, a3, a4);

  swift_bridgeObjectRelease();
}

@end