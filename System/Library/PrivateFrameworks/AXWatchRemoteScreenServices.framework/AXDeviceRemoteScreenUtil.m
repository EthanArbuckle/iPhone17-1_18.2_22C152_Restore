@interface AXDeviceRemoteScreenUtil
+ (AXDeviceRemoteScreenUtil)sharedInstance;
+ (NSString)AXWatchRemoteScreenFeatureDomain;
+ (NSString)AXWatchRemoteScreenFeatureKey;
- (AXDeviceRemoteScreenUtil)init;
- (BOOL)isPairedGizmoHasStingSupport;
- (BOOL)isPairedGizmoSupported;
- (BOOL)isPairedGizmoSupportedWithDeviceID:(id)a3;
- (BOOL)isTwiceFeatureOn;
- (NSString)caErrorEvent;
- (NSString)caErrorKey;
- (NSString)caInactiveEvent;
- (NSString)caInactiveKey;
- (NSString)caSessionIntervalEvent;
- (NSString)caSessionIntervalKey;
- (id)currentPairedGizmo;
- (id)localizedStingStringWithKey:(id)a3;
- (id)localizedStringWithKey:(id)a3;
- (id)pairedGizmoName;
- (void)logInactiveSession;
- (void)logSessionErrorWithErrorName:(id)a3;
- (void)logSessionIntervalBeforeDate:(id)a3 afterDate:(id)a4;
@end

@implementation AXDeviceRemoteScreenUtil

+ (AXDeviceRemoteScreenUtil)sharedInstance
{
  if (qword_26837DC48 != -1) {
    swift_once();
  }
  v2 = (void *)qword_26837E118;
  return (AXDeviceRemoteScreenUtil *)v2;
}

+ (NSString)AXWatchRemoteScreenFeatureDomain
{
  if (qword_26837DC50 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  v2 = (void *)sub_22A60A6B0();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

+ (NSString)AXWatchRemoteScreenFeatureKey
{
  v2 = (void *)sub_22A60A6B0();
  return (NSString *)v2;
}

- (NSString)caSessionIntervalEvent
{
  return (NSString *)sub_22A6076C4();
}

- (NSString)caSessionIntervalKey
{
  return (NSString *)sub_22A6076C4();
}

- (NSString)caErrorEvent
{
  return (NSString *)sub_22A6076C4();
}

- (NSString)caErrorKey
{
  return (NSString *)sub_22A6076C4();
}

- (NSString)caInactiveEvent
{
  return (NSString *)sub_22A6076C4();
}

- (NSString)caInactiveKey
{
  return (NSString *)sub_22A6076C4();
}

- (BOOL)isTwiceFeatureOn
{
  v7 = &type metadata for AXDeviceRemoteScreenUtil.AXWatchRemoteScreenFeatureFlags;
  unint64_t v8 = sub_22A609318();
  v3 = self;
  char v4 = sub_22A60A640();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);

  return v4 & 1;
}

- (id)localizedStringWithKey:(id)a3
{
  return sub_22A607990(self);
}

- (id)localizedStingStringWithKey:(id)a3
{
  return sub_22A607990(self);
}

- (BOOL)isPairedGizmoHasStingSupport
{
  return _s27AXWatchRemoteScreenServices08AXDevicebC4UtilC28isPairedGizmoHasStingSupportSbyF_0() & 1;
}

- (BOOL)isPairedGizmoSupported
{
  return _s27AXWatchRemoteScreenServices08AXDevicebC4UtilC22isPairedGizmoSupportedSbyF_0() & 1;
}

- (BOOL)isPairedGizmoSupportedWithDeviceID:(id)a3
{
  sub_22A60A6C0();
  char v4 = self;
  char v5 = _s27AXWatchRemoteScreenServices08AXDevicebC4UtilC22isPairedGizmoSupported8deviceIDSbSS_tF_0();

  swift_bridgeObjectRelease();
  return v5 & 1;
}

- (id)pairedGizmoName
{
  _s27AXWatchRemoteScreenServices08AXDevicebC4UtilC15pairedGizmoNameSSSgyF_0();
  if (v2)
  {
    v3 = (void *)sub_22A60A6B0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)currentPairedGizmo
{
  id v2 = sub_22A60944C();
  return v2;
}

- (void)logSessionIntervalBeforeDate:(id)a3 afterDate:(id)a4
{
  uint64_t v5 = sub_22A60A5F0();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  MEMORY[0x270FA5388](v5, v8);
  uint64_t v9 = sub_22A60A5E0();
  MEMORY[0x270FA5388](v9, v10);
  v11 = (char *)aBlock - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22A60A5E0();
  v12 = self;
  sub_22A60A5D0();
  double v14 = v13;
  sub_22A60A5D0();
  double v16 = v14 - v15;
  v17 = (void *)sub_22A60A6B0();
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = v12;
  *(double *)(v18 + 24) = v16;
  aBlock[4] = sub_22A60A4E0;
  aBlock[5] = v18;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_22A5FFA0C;
  aBlock[3] = &block_descriptor_38;
  v19 = _Block_copy(aBlock);
  v20 = v12;
  swift_release();
  AnalyticsSendEventLazy();
  _Block_release(v19);

  v21 = *(void (**)(char *, uint64_t))(v6 + 8);
  v21(v11, v5);
  v21(v11, v5);
}

- (void)logSessionErrorWithErrorName:(id)a3
{
  uint64_t v4 = sub_22A60A6C0();
  uint64_t v6 = v5;
  uint64_t v7 = self;
  uint64_t v8 = (void *)sub_22A60A6B0();
  uint64_t v9 = (void *)swift_allocObject();
  v9[2] = v7;
  v9[3] = v4;
  v9[4] = v6;
  v12[4] = sub_22A60A518;
  v12[5] = v9;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 1107296256;
  v12[2] = sub_22A5FFA0C;
  v12[3] = &block_descriptor_31;
  uint64_t v10 = _Block_copy(v12);
  v11 = v7;
  swift_bridgeObjectRetain();
  swift_release();
  AnalyticsSendEventLazy();
  _Block_release(v10);

  swift_bridgeObjectRelease();
}

- (void)logInactiveSession
{
  id v2 = self;
  v3 = (void *)sub_22A60A6B0();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v2;
  v7[4] = sub_22A60A508;
  v7[5] = v4;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 1107296256;
  v7[2] = sub_22A5FFA0C;
  v7[3] = &block_descriptor_24;
  uint64_t v5 = _Block_copy(v7);
  uint64_t v6 = v2;
  swift_release();
  AnalyticsSendEventLazy();
  _Block_release(v5);
}

- (AXDeviceRemoteScreenUtil)init
{
  return (AXDeviceRemoteScreenUtil *)AXDeviceRemoteScreenUtil.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end