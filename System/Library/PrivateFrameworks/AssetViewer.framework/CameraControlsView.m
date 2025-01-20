@interface CameraControlsView
- (CGSize)intrinsicContentSize;
- (_TtC11AssetViewer18CameraControlsView)initWithCoder:(id)a3;
- (_TtC11AssetViewer18CameraControlsView)initWithFrame:(CGRect)a3;
- (void)buttonPressedWithSender:(id)a3;
@end

@implementation CameraControlsView

- (CGSize)intrinsicContentSize
{
  uint64_t v2 = qword_1EADCA458;
  v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  double v4 = *(double *)&qword_1EADD3B08;
  uint64_t v5 = qword_1EADD3B08;
  if (qword_1EADCA460 != -1)
  {
    swift_once();
    uint64_t v5 = qword_1EADD3B08;
  }
  double v6 = *(double *)&qword_1EADD3B10;

  double v7 = v4 + v6;
  double v8 = *(double *)&v5;
  result.height = v8;
  result.width = v7;
  return result;
}

- (_TtC11AssetViewer18CameraControlsView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1E2888B60();
}

- (void)buttonPressedWithSender:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1E2885E74();
}

- (_TtC11AssetViewer18CameraControlsView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC11AssetViewer18CameraControlsView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer18CameraControlsView_entityController));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer18CameraControlsView_rightButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer18CameraControlsView_downButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer18CameraControlsView_leftButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer18CameraControlsView_fastMovementButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer18CameraControlsView_zoomOutButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AssetViewer18CameraControlsView_zoomInButton));
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11AssetViewer18CameraControlsView_menuButton);
}

@end