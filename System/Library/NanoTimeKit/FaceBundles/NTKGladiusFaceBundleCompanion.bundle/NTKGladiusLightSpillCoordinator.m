@interface NTKGladiusLightSpillCoordinator
- (NSArray)majorHourLayers;
- (NSArray)minorHourLayers;
- (NSArray)minorMinuteLayers;
- (_TtC29NTKGladiusFaceBundleCompanion31NTKGladiusLightSpillCoordinator)init;
- (_TtC29NTKGladiusFaceBundleCompanion31NTKGladiusLightSpillCoordinator)initWithDevice:(id)a3;
- (_TtP29NTKGladiusFaceBundleCompanion45NTKGladiusLightSpillCoordinatorUpdateDelegate_)updateDelegate;
- (void)handleDialPaletteChangeWithHourStartColors:(id)a3 minuteStartColor:(id)a4 minuteEndColor:(id)a5 hourEndColor:(id)a6 hourTextColor:(id)a7;
- (void)lowFrequencyLightingTimerFired;
- (void)setMajorHourLayers:(id)a3;
- (void)setMinorHourLayers:(id)a3;
- (void)setMinorMinuteLayers:(id)a3;
- (void)setOverrideDate:(id)a3 duration:(double)a4;
- (void)setUpdateDelegate:(id)a3;
- (void)startSecondHandLightingAnimationAtDate:(id)a3;
- (void)stopSecondHandLightingAnimation;
- (void)updateLightingOverride;
@end

@implementation NTKGladiusLightSpillCoordinator

- (NSArray)minorMinuteLayers
{
  return (NSArray *)sub_EDF0((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR____TtC29NTKGladiusFaceBundleCompanion31NTKGladiusLightSpillCoordinator_minorMinuteLayers, &qword_2A5F8);
}

- (void)setMinorMinuteLayers:(id)a3
{
}

- (NSArray)minorHourLayers
{
  return (NSArray *)sub_EDF0((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR____TtC29NTKGladiusFaceBundleCompanion31NTKGladiusLightSpillCoordinator_minorHourLayers, (unint64_t *)&unk_2A600);
}

- (void)setMinorHourLayers:(id)a3
{
}

- (NSArray)majorHourLayers
{
  return (NSArray *)sub_EDF0((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR____TtC29NTKGladiusFaceBundleCompanion31NTKGladiusLightSpillCoordinator_majorHourLayers, &qword_2A5F8);
}

- (void)setMajorHourLayers:(id)a3
{
}

- (_TtP29NTKGladiusFaceBundleCompanion45NTKGladiusLightSpillCoordinatorUpdateDelegate_)updateDelegate
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (_TtP29NTKGladiusFaceBundleCompanion45NTKGladiusLightSpillCoordinatorUpdateDelegate_ *)Strong;
}

- (void)setUpdateDelegate:(id)a3
{
}

- (_TtC29NTKGladiusFaceBundleCompanion31NTKGladiusLightSpillCoordinator)initWithDevice:(id)a3
{
  id v3 = a3;
  v4 = (_TtC29NTKGladiusFaceBundleCompanion31NTKGladiusLightSpillCoordinator *)sub_139FC(v3);

  return v4;
}

- (void)handleDialPaletteChangeWithHourStartColors:(id)a3 minuteStartColor:(id)a4 minuteEndColor:(id)a5 hourEndColor:(id)a6 hourTextColor:(id)a7
{
  sub_14068(0, &qword_2A5E8);
  uint64_t v12 = sub_14F20();
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = self;
  sub_EF98(v12, v13, v14, v15, v16);

  swift_bridgeObjectRelease();
}

- (void)startSecondHandLightingAnimationAtDate:(id)a3
{
  uint64_t v4 = sub_14E60();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_14E50();
  v8 = self;
  sub_F39C((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)lowFrequencyLightingTimerFired
{
  v2 = self;
  sub_10938();
}

- (void)stopSecondHandLightingAnimation
{
  v2 = self;
  sub_10CE8();
}

- (void)setOverrideDate:(id)a3 duration:(double)a4
{
  uint64_t v7 = sub_BE38((uint64_t *)&unk_2A5A0);
  uint64_t v8 = __chkstk_darwin(v7 - 8);
  v10 = &v23[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v8);
  uint64_t v12 = &v23[-v11];
  uint64_t v13 = sub_BE38(&qword_2A3E8);
  uint64_t v14 = __chkstk_darwin(v13 - 8);
  id v16 = &v23[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v14);
  v18 = &v23[-v17];
  if (a3)
  {
    sub_14E50();
    uint64_t v19 = sub_14E60();
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v18, 0, 1, v19);
  }
  else
  {
    uint64_t v20 = sub_14E60();
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v18, 1, 1, v20);
  }
  v21 = (char *)self + OBJC_IVAR____TtC29NTKGladiusFaceBundleCompanion31NTKGladiusLightSpillCoordinator_dateOverride;
  swift_beginAccess();
  sub_D0FC((uint64_t)v21, (uint64_t)v10, (uint64_t *)&unk_2A5A0);
  sub_D0FC((uint64_t)v18, (uint64_t)v16, &qword_2A3E8);
  v22 = self;
  sub_D9F0((uint64_t)v10, (uint64_t)v16, (uint64_t)v12, a4);
  swift_beginAccess();
  sub_D094((uint64_t)v12, (uint64_t)v21);
  swift_endAccess();

  sub_D160((uint64_t)v18, &qword_2A3E8);
}

- (void)updateLightingOverride
{
  v2 = self;
  sub_11264();
}

- (_TtC29NTKGladiusFaceBundleCompanion31NTKGladiusLightSpillCoordinator)init
{
  result = (_TtC29NTKGladiusFaceBundleCompanion31NTKGladiusLightSpillCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_D160((uint64_t)self + OBJC_IVAR____TtC29NTKGladiusFaceBundleCompanion31NTKGladiusLightSpillCoordinator_dateOverride, (uint64_t *)&unk_2A5A0);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC29NTKGladiusFaceBundleCompanion31NTKGladiusLightSpillCoordinator_dateOverrideAnimationTimer));
  sub_140A4((uint64_t)self + OBJC_IVAR____TtC29NTKGladiusFaceBundleCompanion31NTKGladiusLightSpillCoordinator_updateDelegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC29NTKGladiusFaceBundleCompanion31NTKGladiusLightSpillCoordinator_device));
  sub_14000(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC29NTKGladiusFaceBundleCompanion31NTKGladiusLightSpillCoordinator_currentDialColors), *(void **)&self->minorMinuteLayers[OBJC_IVAR____TtC29NTKGladiusFaceBundleCompanion31NTKGladiusLightSpillCoordinator_currentDialColors], *(void **)&self->minorHourLayers[OBJC_IVAR____TtC29NTKGladiusFaceBundleCompanion31NTKGladiusLightSpillCoordinator_currentDialColors], *(void **)&self->majorHourLayers[OBJC_IVAR____TtC29NTKGladiusFaceBundleCompanion31NTKGladiusLightSpillCoordinator_currentDialColors], *(void **)&self->dateOverrideAnimationTimer[OBJC_IVAR____TtC29NTKGladiusFaceBundleCompanion31NTKGladiusLightSpillCoordinator_currentDialColors]);
  id v3 = (char *)self + OBJC_IVAR____TtC29NTKGladiusFaceBundleCompanion31NTKGladiusLightSpillCoordinator_log;
  uint64_t v4 = sub_14EE0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_bridgeObjectRelease();
}

@end