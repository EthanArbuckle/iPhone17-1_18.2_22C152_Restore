@interface NTKEsterbrookSceneCoordinator
- (BOOL)isFrozen;
- (NTKEsterbrookColorPalette)colorPalette;
- (NTKEsterbrookSceneCoordinator)init;
- (NTKEsterbrookSceneCoordinator)initWithFrame:(CGRect)a3 device:(id)a4 handsView:(id)a5 colorPalette:(id)a6 faceState:(id)a7;
- (NTKEsterbrookSceneCoordinatorDelegate)delegate;
- (NTKEsterbrookSceneView)sceneView;
- (double)tritiumProgress;
- (void)applyFaceState:(id)a3;
- (void)cleanupAfterEditing;
- (void)dealloc;
- (void)didTransitionToTritiumOff;
- (void)didTransitionToTritiumOn;
- (void)handleSignificantTimeChange;
- (void)layoutForDateChange;
- (void)prepareForEditing;
- (void)prepareForTransitionToTritiumOn;
- (void)prepareNextSceneForDisplayMode:(int64_t)a3;
- (void)screenDidTurnOffWithAnimated:(BOOL)a3;
- (void)screenWillTurnOnAnimated:(BOOL)a3;
- (void)setColorPalette:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFrozen:(BOOL)a3;
- (void)setOverrideDate:(id)a3 duration:(double)a4;
- (void)setSceneView:(id)a3;
- (void)setTimeOffset:(double)a3;
- (void)setTritiumProgress:(double)a3;
- (void)unloadSceneForDisplayMode:(int64_t)a3;
@end

@implementation NTKEsterbrookSceneCoordinator

- (NTKEsterbrookSceneView)sceneView
{
  return (NTKEsterbrookSceneView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                           + OBJC_IVAR___NTKEsterbrookSceneCoordinator_sceneView));
}

- (void)setSceneView:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___NTKEsterbrookSceneCoordinator_sceneView);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___NTKEsterbrookSceneCoordinator_sceneView) = (Class)a3;
  id v3 = a3;
}

- (NTKEsterbrookSceneCoordinatorDelegate)delegate
{
  v2 = (void *)MEMORY[0x24C5411D0]((char *)self + OBJC_IVAR___NTKEsterbrookSceneCoordinator_delegate, a2);

  return (NTKEsterbrookSceneCoordinatorDelegate *)v2;
}

- (void)setDelegate:(id)a3
{
}

- (NTKEsterbrookColorPalette)colorPalette
{
  v2 = (void *)swift_unknownObjectRetain();

  return (NTKEsterbrookColorPalette *)v2;
}

- (void)setColorPalette:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___NTKEsterbrookSceneCoordinator_colorPalette) = (Class)a3;
  swift_unknownObjectRetain_n();
  id v4 = self;
  swift_unknownObjectRelease();
  sub_246AAF538();

  swift_unknownObjectRelease();
}

- (NTKEsterbrookSceneCoordinator)initWithFrame:(CGRect)a3 device:(id)a4 handsView:(id)a5 colorPalette:(id)a6 faceState:(id)a7
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v14 = a4;
  id v15 = a5;
  swift_unknownObjectRetain();
  return (NTKEsterbrookSceneCoordinator *)sub_246AAF940(v14, v15, a6, a7, x, y, width, height);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(NTKEsterbrookSceneCoordinator *)&v3 dealloc];
}

- (void).cxx_destruct
{
  swift_release();
  sub_246AABC84((uint64_t)self + OBJC_IVAR___NTKEsterbrookSceneCoordinator_delegate);
  sub_246AABBEC((uint64_t)self + OBJC_IVAR___NTKEsterbrookSceneCoordinator_overrideDate, (uint64_t *)&unk_2691C12C0);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___NTKEsterbrookSceneCoordinator____lazy_storage___sundayWakeStyle));

  swift_bridgeObjectRelease();
}

- (void)applyFaceState:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_246AAFE90(v4, 0);
}

- (void)screenWillTurnOnAnimated:(BOOL)a3
{
  uint64_t v3 = qword_2691C0220;
  id v4 = self;
  if (v3 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_246AD8AD0();
  sub_246A8AB74(v5, (uint64_t)qword_2691D4018);
  oslog = sub_246AD8AB0();
  os_log_type_t v6 = sub_246AD8CE0();
  if (os_log_type_enabled(oslog, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_246A80000, oslog, v6, "screenWillTurnOn", v7, 2u);
    MEMORY[0x24C541130](v7, -1, -1);
  }
}

- (void)screenDidTurnOffWithAnimated:(BOOL)a3
{
  uint64_t v3 = self;
  sub_246AB2DF8();
}

- (double)tritiumProgress
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR___NTKEsterbrookSceneCoordinator_tritiumProgress);
}

- (void)setTritiumProgress:(double)a3
{
  *(double *)((char *)&self->super.isa + OBJC_IVAR___NTKEsterbrookSceneCoordinator_tritiumProgress) = a3;
  uint64_t v3 = self;
  sub_246AB1770();
}

- (void)didTransitionToTritiumOn
{
  id v2 = self;
  sub_246AB1838();
}

- (void)didTransitionToTritiumOff
{
  id v2 = self;
  sub_246AB19AC();
}

- (void)prepareForTransitionToTritiumOn
{
  id v2 = self;
  sub_246AB1B1C();
}

- (void)layoutForDateChange
{
  id v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___NTKEsterbrookSceneCoordinator_sceneView);
  uint64_t v3 = self;
  id v4 = v2;
  sub_246AA89D8(1);
}

- (void)handleSignificantTimeChange
{
  id v2 = self;
  sub_246AB1CEC();
}

- (void)prepareNextSceneForDisplayMode:(int64_t)a3
{
  id v4 = self;
  sub_246AB0DF4(a3);
}

- (void)unloadSceneForDisplayMode:(int64_t)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___NTKEsterbrookSceneCoordinator_sceneView);
  uint64_t v5 = self;
  id v6 = v4;
  sub_246AA6F30(a3);
}

- (void)prepareForEditing
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR___NTKEsterbrookSceneCoordinator_isEditing) = 1;
  id v2 = self;
  sub_246AAF538();
}

- (void)cleanupAfterEditing
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR___NTKEsterbrookSceneCoordinator_isEditing) = 0;
  id v2 = self;
  sub_246AAF538();
}

- (void)setOverrideDate:(id)a3 duration:(double)a4
{
  uint64_t v6 = sub_246A8604C((uint64_t *)&unk_2691C12C0);
  MEMORY[0x270FA5388](v6 - 8);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_246AD8970();
    uint64_t v9 = sub_246AD8980();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 0, 1, v9);
  }
  else
  {
    uint64_t v10 = sub_246AD8980();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v8, 1, 1, v10);
  }
  v11 = (char *)self + OBJC_IVAR___NTKEsterbrookSceneCoordinator_overrideDate;
  swift_beginAccess();
  v12 = self;
  sub_246AB2B10((uint64_t)v8, (uint64_t)v11);
  swift_endAccess();
  id v13 = *(id *)((char *)&v12->super.isa + OBJC_IVAR___NTKEsterbrookSceneCoordinator_sceneView);
  sub_246AA89D8(1);

  sub_246AABBEC((uint64_t)v8, (uint64_t *)&unk_2691C12C0);
}

- (void)setTimeOffset:(double)a3
{
  uint64_t v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___NTKEsterbrookSceneCoordinator_sceneView);
  id v4 = self;
  id v5 = v3;
  sub_246AA89D8(1);
}

- (BOOL)isFrozen
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___NTKEsterbrookSceneCoordinator_isFrozen);
}

- (void)setFrozen:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR___NTKEsterbrookSceneCoordinator_isFrozen) = a3;
}

- (NTKEsterbrookSceneCoordinator)init
{
  result = (NTKEsterbrookSceneCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end