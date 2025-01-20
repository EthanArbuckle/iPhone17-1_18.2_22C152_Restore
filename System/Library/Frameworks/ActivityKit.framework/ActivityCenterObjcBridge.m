@interface ActivityCenterObjcBridge
+ (_TtC11ActivityKit24ActivityCenterObjcBridge)shared;
- (BOOL)areActivitiesEnabled;
- (BOOL)isActivityActiveWithIdentifier:(id)a3;
- (_TtC11ActivityKit24ActivityCenterObjcBridge)init;
- (id)observeActivitiesExceedingReducedPushBudgetWithHandler:(id)a3;
- (id)observeActivityContentUpdatesWithHandler:(id)a3;
- (id)observeDescriptorsWithHandler:(id)a3;
- (void)disableActivitiesWithBundleIdentifier:(id)a3;
- (void)endActivity:(id)a3;
@end

@implementation ActivityCenterObjcBridge

+ (_TtC11ActivityKit24ActivityCenterObjcBridge)shared
{
  if (qword_26B0B7548 != -1) {
    swift_once();
  }
  v2 = (void *)qword_26B0B7540;

  return (_TtC11ActivityKit24ActivityCenterObjcBridge *)v2;
}

- (_TtC11ActivityKit24ActivityCenterObjcBridge)init
{
  return (_TtC11ActivityKit24ActivityCenterObjcBridge *)sub_242FB3B74();
}

- (BOOL)areActivitiesEnabled
{
  return _s11ActivityKit0A6CenterC23liveActivitiesSupportedSbvgZ_0() & 1;
}

- (id)observeDescriptorsWithHandler:(id)a3
{
  return sub_242FB5D2C(self, (int)a2, a3, (uint64_t)&unk_26F878F60, (uint64_t)sub_242FB6C7C, (uint64_t (*)(uint64_t, uint64_t))sub_242FB3E80);
}

- (BOOL)isActivityActiveWithIdentifier:(id)a3
{
  uint64_t v4 = sub_242FDC0D0();
  uint64_t v6 = v5;
  v7 = self;
  LOBYTE(v4) = sub_242FB4478(v4, v6);

  swift_bridgeObjectRelease();
  return v4 & 1;
}

- (void)endActivity:(id)a3
{
  uint64_t v4 = sub_242FDC0D0();
  uint64_t v6 = v5;
  v7 = self;
  sub_242FB4744(v4, v6);

  swift_bridgeObjectRelease();
}

- (void)disableActivitiesWithBundleIdentifier:(id)a3
{
  uint64_t v4 = sub_242FDC0D0();
  uint64_t v6 = v5;
  v7 = self;
  sub_242FB6510(v4, v6);

  swift_bridgeObjectRelease();
}

- (id)observeActivityContentUpdatesWithHandler:(id)a3
{
  return sub_242FB5D2C(self, (int)a2, a3, (uint64_t)&unk_26F878F38, (uint64_t)sub_242F401E0, (uint64_t (*)(uint64_t, uint64_t))sub_242FB4A14);
}

- (id)observeActivitiesExceedingReducedPushBudgetWithHandler:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = self;
  id v7 = sub_242FB32EC((uint64_t)sub_242FB6C24, v5);

  swift_release();

  return v7;
}

- (void).cxx_destruct
{
  swift_release();

  swift_bridgeObjectRelease();
}

@end