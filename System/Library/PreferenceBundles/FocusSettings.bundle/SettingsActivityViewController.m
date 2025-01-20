@interface SettingsActivityViewController
+ (NSString)dndModeKey;
- (_TtC13FocusSettings30SettingsActivityViewController)init;
- (_TtC13FocusSettings30SettingsActivityViewController)initWithCoder:(id)a3;
- (_TtC13FocusSettings30SettingsActivityViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation SettingsActivityViewController

+ (NSString)dndModeKey
{
  NSString v2 = sub_14500();

  return (NSString *)v2;
}

- (_TtC13FocusSettings30SettingsActivityViewController)init
{
  uint64_t v3 = OBJC_IVAR____TtC13FocusSettings30SettingsActivityViewController_hostViewModel;
  sub_14250();
  swift_allocObject();
  v4 = self;
  *(void *)&self->PSViewController_opaque[v3] = sub_14240();
  *(void *)&v4->PSViewController_opaque[OBJC_IVAR____TtC13FocusSettings30SettingsActivityViewController_cancellableBag] = &_swiftEmptySetSingleton;

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for SettingsActivityViewController();
  return [(SettingsActivityViewController *)&v6 initWithNibName:0 bundle:0];
}

- (_TtC13FocusSettings30SettingsActivityViewController)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC13FocusSettings30SettingsActivityViewController_hostViewModel;
  sub_14250();
  swift_allocObject();
  id v6 = a3;
  *(void *)&self->PSViewController_opaque[v5] = sub_14240();
  *(void *)&self->PSViewController_opaque[OBJC_IVAR____TtC13FocusSettings30SettingsActivityViewController_cancellableBag] = &_swiftEmptySetSingleton;

  result = (_TtC13FocusSettings30SettingsActivityViewController *)sub_14780();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  NSString v2 = self;
  sub_D410();
}

- (_TtC13FocusSettings30SettingsActivityViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC13FocusSettings30SettingsActivityViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

  swift_bridgeObjectRelease();
}

@end