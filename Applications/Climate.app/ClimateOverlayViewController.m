@interface ClimateOverlayViewController
- (_TtC7Climate28ClimateOverlayViewController)initWithCoder:(id)a3;
- (_TtC7Climate28ClimateOverlayViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)didTapClimateStatusBarButton:(id)a3;
- (void)handleTapOutsidePopoverFrames;
- (void)viewDidLoad;
@end

@implementation ClimateOverlayViewController

- (_TtC7Climate28ClimateOverlayViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10002323C();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_10001DC04();
}

- (_TtC7Climate28ClimateOverlayViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC7Climate28ClimateOverlayViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Climate28ClimateOverlayViewController_leftView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Climate28ClimateOverlayViewController_rightView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Climate28ClimateOverlayViewController_leftPopover));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Climate28ClimateOverlayViewController_rightPopover));
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)didTapClimateStatusBarButton:(id)a3
{
  swift_unknownObjectRetain();
  id v4 = self;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  sub_1000214A0((uint64_t)v5);

  sub_10000AC28((uint64_t)v5);
}

- (void)handleTapOutsidePopoverFrames
{
  v2 = self;
  sub_10001F6E0();
}

@end