@interface ConfirmationViewController
- (_TtC30FamilyControlsAuthenticationUI26ConfirmationViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC30FamilyControlsAuthenticationUI26ConfirmationViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation ConfirmationViewController

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ConfirmationViewController();
  id v4 = v5.receiver;
  [(ConfirmationViewController *)&v5 viewDidDisappear:v3];
  if (swift_unknownObjectWeakLoadStrong())
  {
    sub_10001002C();

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for ConfirmationViewController();
  id v2 = v4.receiver;
  [(ConfirmationViewController *)&v4 viewDidLoad];
  id v3 = [v2 navigationItem];
  [v3 setHidesBackButton:1 animated:0];
}

- (_TtC30FamilyControlsAuthenticationUI26ConfirmationViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = v10;
  if (!a4)
  {
    uint64_t v13 = 0;
    if (a5) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v14 = 0;
    uint64_t v16 = 0;
    return (_TtC30FamilyControlsAuthenticationUI26ConfirmationViewController *)sub_100007D30(v9, v11, (uint64_t)a4, v13, v14, v16, a6);
  }
  a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v13 = v12;
  if (!a5) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v16 = v15;
  return (_TtC30FamilyControlsAuthenticationUI26ConfirmationViewController *)sub_100007D30(v9, v11, (uint64_t)a4, v13, v14, v16, a6);
}

- (_TtC30FamilyControlsAuthenticationUI26ConfirmationViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (a4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    a4 = v10;
  }
  *(void *)&self->delegate[OBJC_IVAR____TtC30FamilyControlsAuthenticationUI26ConfirmationViewController_delegate] = 0;
  swift_unknownObjectWeakInit();
  id v11 = a5;
  NSString v12 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  if (a4)
  {
    NSString v13 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v13 = 0;
  }
  v16.receiver = self;
  v16.super_class = (Class)type metadata accessor for ConfirmationViewController();
  uint64_t v14 = [(ConfirmationViewController *)&v16 initWithTitle:v12 detailText:v13 icon:v11 contentLayout:a6];

  return v14;
}

- (void).cxx_destruct
{
}

@end