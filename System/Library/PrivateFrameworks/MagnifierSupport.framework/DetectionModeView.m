@interface DetectionModeView
- (BOOL)accessibilityPerformMagicTap;
- (NSArray)accessibilityCustomActions;
- (_TtC16MagnifierSupport17DetectionModeView)initWithCoder:(id)a3;
- (_TtC16MagnifierSupport17DetectionModeView)initWithFrame:(CGRect)a3;
- (id)_accessibilitySupplementaryFooterViews;
- (uint64_t)toggleDetection;
- (void)didTapRecordButton:(id)a3;
- (void)didTapRestartButton:(id)a3;
- (void)didTapTapToRadarButton:(id)a3;
- (void)pauseSpeech;
- (void)setAccessibilityCustomActions:(id)a3;
@end

@implementation DetectionModeView

- (_TtC16MagnifierSupport17DetectionModeView)initWithCoder:(id)a3
{
  return 0;
}

- (void)pauseSpeech
{
  uint64_t v2 = qword_26AF13B78;
  v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2359484D8();
  swift_release();
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2359470F8();
  sub_2359484E8();
}

- (NSArray)accessibilityCustomActions
{
  uint64_t v2 = self;
  unint64_t v3 = sub_2358F524C();

  if (v3)
  {
    sub_2356594B0(0, (unint64_t *)&unk_26AF15330);
    v4 = (void *)sub_235949D58();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return (NSArray *)v4;
}

- (void)setAccessibilityCustomActions:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    sub_2356594B0(0, (unint64_t *)&unk_26AF15330);
    sub_235949D78();
    v6 = self;
    a3 = (id)sub_235949D58();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = self;
  }
  v8.receiver = self;
  v8.super_class = ObjectType;
  [(DetectionModeView *)&v8 setAccessibilityCustomActions:a3];
}

- (BOOL)accessibilityPerformMagicTap
{
  return 1;
}

- (id)_accessibilitySupplementaryFooterViews
{
  uint64_t v2 = self;
  id v3 = sub_2358F6138();

  if (v3)
  {
    v4 = (void *)sub_235949D58();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)didTapRecordButton:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_2358F6E60();
}

- (void)didTapTapToRadarButton:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC16MagnifierSupport17DetectionModeView_arDelegate;
  if (MEMORY[0x237DEA060]((char *)self + OBJC_IVAR____TtC16MagnifierSupport17DetectionModeView_arDelegate, a2))
  {
    uint64_t v6 = *((void *)v5 + 1);
    uint64_t ObjectType = swift_getObjectType();
    objc_super v8 = *(void (**)(uint64_t, uint64_t))(v6 + 24);
    id v9 = a3;
    v10 = self;
    v8(ObjectType, v6);

    swift_unknownObjectRelease();
  }
}

- (void)didTapRestartButton:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC16MagnifierSupport17DetectionModeView_arDelegate;
  if (MEMORY[0x237DEA060]((char *)self + OBJC_IVAR____TtC16MagnifierSupport17DetectionModeView_arDelegate, a2))
  {
    uint64_t v6 = *((void *)v5 + 1);
    uint64_t ObjectType = swift_getObjectType();
    objc_super v8 = *(void (**)(uint64_t, uint64_t))(v6 + 32);
    id v9 = a3;
    v10 = self;
    v8(ObjectType, v6);

    swift_unknownObjectRelease();
  }
}

- (_TtC16MagnifierSupport17DetectionModeView)initWithFrame:(CGRect)a3
{
  result = (_TtC16MagnifierSupport17DetectionModeView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_23566A2B4((uint64_t)self + OBJC_IVAR____TtC16MagnifierSupport17DetectionModeView_arDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17DetectionModeView__recordButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17DetectionModeView__tapToRadarButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17DetectionModeView__restartButton));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport17DetectionModeView_detectionLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MagnifierSupport17DetectionModeView_kDetectionFont);
}

- (uint64_t)toggleDetection
{
  if (qword_26AF13B78 != -1) {
    swift_once();
  }
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2359484D8();
  swift_release();
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2359470F8();
  sub_2359484E8();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_2359484D8();
  swift_release();
  uint64_t result = swift_release();
  if (v2 == 1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    sub_2359484D8();
    swift_release();
    uint64_t result = swift_release();
    if ((v1 & 1) == 0)
    {
      swift_getKeyPath();
      swift_getKeyPath();
      sub_2359470F8();
      sub_2359484E8();
      swift_getKeyPath();
      swift_getKeyPath();
      sub_2359470F8();
      return sub_2359484E8();
    }
  }
  return result;
}

@end