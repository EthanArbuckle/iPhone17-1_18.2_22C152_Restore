@interface RadioRootViewController
- (_TtC5Media23RadioRootViewController)initWithCoder:(id)a3;
- (_TtC5Media23RadioRootViewController)initWithTransitionStyle:(int64_t)a3 navigationOrientation:(int64_t)a4 options:(id)a5;
- (void)dismissSettingsModal;
- (void)doneEditingFavoritesWithSender:(id)a3;
- (void)invalidate;
- (void)nowPlayingTapped;
- (void)segmentedControlChangedWithSender:(id)a3;
- (void)showOptionsPickerWithSender:(id)a3;
- (void)showSettings;
- (void)showSoundSettings;
- (void)showSourcePickerWithSender:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation RadioRootViewController

- (_TtC5Media23RadioRootViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10006FF3C();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_10006C978();
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for RadioRootViewController();
  id v2 = v3.receiver;
  [(RadioRootViewController *)&v3 viewDidLayoutSubviews];
  sub_10006D9B8();
}

- (void)invalidate
{
  id v2 = self;
  sub_10006D47C();
}

- (void)doneEditingFavoritesWithSender:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100070024();
}

- (void)segmentedControlChangedWithSender:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10006F1D8(v4);
}

- (void)showSettings
{
  id v2 = self;
  sub_10006F384();
}

- (void)showSoundSettings
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v5 = (id)Strong;
    id v4 = self;
    sub_10000A48C(0);
  }
}

- (void)nowPlayingTapped
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v5 = (id)Strong;
    id v4 = self;
    sub_10000A1F8();
  }
}

- (void)showSourcePickerWithSender:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10006F590((uint64_t)v4);
}

- (void)showOptionsPickerWithSender:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10006F754((uint64_t)v4);
}

- (void)dismissSettingsModal
{
  id v2 = self;
  sub_10006FC5C();
}

- (_TtC5Media23RadioRootViewController)initWithTransitionStyle:(int64_t)a3 navigationOrientation:(int64_t)a4 options:(id)a5
{
  result = (_TtC5Media23RadioRootViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Media23RadioRootViewController_sourcePickerButton));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Media23RadioRootViewController_segmentedControl));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Media23RadioRootViewController_optionsPicker));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC5Media23RadioRootViewController_sourcePicker);
}

@end