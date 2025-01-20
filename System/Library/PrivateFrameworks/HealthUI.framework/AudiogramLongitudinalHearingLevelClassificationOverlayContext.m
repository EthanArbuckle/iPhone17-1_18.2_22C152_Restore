@interface AudiogramLongitudinalHearingLevelClassificationOverlayContext
- (_TtC8HealthUI61AudiogramLongitudinalHearingLevelClassificationOverlayContext)init;
- (id)contextItemForLastUpdate;
- (id)overlayDisplayTypeForTimeScope:(int64_t)a3;
- (id)sampleTypeForDateRangeUpdates;
- (int64_t)resolutionForTimeScope:(int64_t)a3 traitResolution:(int64_t)a4;
- (void)updateContextItemForDateInterval:(id)a3 overlayController:(id)a4 timeScope:(int64_t)a5 resolution:(int64_t)a6 completion:(id)a7;
@end

@implementation AudiogramLongitudinalHearingLevelClassificationOverlayContext

- (id)sampleTypeForDateRangeUpdates
{
  sub_1E0DF2C04(0, (unint64_t *)&qword_1EAD6DB78);
  id v2 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_audiogramSampleType);
  return v2;
}

- (id)overlayDisplayTypeForTimeScope:(int64_t)a3
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR____TtC8HealthUI61AudiogramLongitudinalHearingLevelClassificationOverlayContext_overlayDisplayType));
}

- (void)updateContextItemForDateInterval:(id)a3 overlayController:(id)a4 timeScope:(int64_t)a5 resolution:(int64_t)a6 completion:(id)a7
{
  uint64_t v12 = sub_1E0ECB3C0();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x1F4188790](v12, v14);
  v16 = (char *)&v20 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = _Block_copy(a7);
  sub_1E0ECB370();
  _Block_copy(v17);
  id v18 = a4;
  v19 = self;
  sub_1E0E69E8C((uint64_t)v16, v18, a5, a6, v19, (void (**)(void, void, void))v17);
  _Block_release(v17);
  _Block_release(v17);

  (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v12);
}

- (id)contextItemForLastUpdate
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR____TtC8HealthUI61AudiogramLongitudinalHearingLevelClassificationOverlayContext_lastUpdatedItem));
}

- (int64_t)resolutionForTimeScope:(int64_t)a3 traitResolution:(int64_t)a4
{
  return 0;
}

- (_TtC8HealthUI61AudiogramLongitudinalHearingLevelClassificationOverlayContext)init
{
  result = (_TtC8HealthUI61AudiogramLongitudinalHearingLevelClassificationOverlayContext *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8HealthUI61AudiogramLongitudinalHearingLevelClassificationOverlayContext_baseDisplayType));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8HealthUI61AudiogramLongitudinalHearingLevelClassificationOverlayContext_overlayDisplayType));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8HealthUI61AudiogramLongitudinalHearingLevelClassificationOverlayContext_applicationItems));
  swift_unknownObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC8HealthUI61AudiogramLongitudinalHearingLevelClassificationOverlayContext_lastUpdatedItem);
}

@end