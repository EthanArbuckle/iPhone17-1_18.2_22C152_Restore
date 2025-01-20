@interface CAFUISoundSettingsViewController
- (_TtC5CAFUI32CAFUISoundSettingsViewController)initWithCoder:(id)a3;
- (_TtC5CAFUI32CAFUISoundSettingsViewController)initWithTransitionStyle:(int64_t)a3 navigationOrientation:(int64_t)a4 options:(id)a5;
- (void)segmentedControlChangedWithSender:(id)a3;
- (void)viewDidLoad;
@end

@implementation CAFUISoundSettingsViewController

- (_TtC5CAFUI32CAFUISoundSettingsViewController)initWithCoder:(id)a3
{
}

- (void)viewDidLoad
{
  v2 = self;
  CAFUISoundSettingsViewController.viewDidLoad()();
}

- (void)segmentedControlChangedWithSender:(id)a3
{
  id v4 = a3;
  v5 = self;
  CAFUISoundSettingsViewController.changePage(index:animated:)((uint64_t)objc_msgSend(v4, sel_selectedSegmentIndex), 0);
}

- (_TtC5CAFUI32CAFUISoundSettingsViewController)initWithTransitionStyle:(int64_t)a3 navigationOrientation:(int64_t)a4 options:(id)a5
{
  result = (_TtC5CAFUI32CAFUISoundSettingsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5CAFUI32CAFUISoundSettingsViewController_segmentedControl));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5CAFUI32CAFUISoundSettingsViewController_audioLogo));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5CAFUI32CAFUISoundSettingsViewController_resetButton));

  swift_bridgeObjectRelease();
}

@end