@interface AirTagCustomEmojiViewController
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (_TtC18SharingViewService31AirTagCustomEmojiViewController)initWithContentView:(id)a3;
- (void)handleEmojiButtonTapped;
- (void)textFieldDidBeginEditing:(id)a3;
- (void)textFieldDidEndEditing:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation AirTagCustomEmojiViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_1000742B0();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v4 = (char *)v5.receiver;
  [(AirTagCustomEmojiViewController *)&v5 viewDidAppear:v3];
  [*(id *)&v4[OBJC_IVAR____TtC18SharingViewService31AirTagCustomEmojiViewController_hiddenEmojiField] becomeFirstResponder];
}

- (void)handleEmojiButtonTapped
{
}

- (_TtC18SharingViewService31AirTagCustomEmojiViewController)initWithContentView:(id)a3
{
  id v3 = a3;
  result = (_TtC18SharingViewService31AirTagCustomEmojiViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();

  id v3 = *(void **)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC18SharingViewService31AirTagCustomEmojiViewController_selectedEmojiLabel];
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v7 = a3;
  v8 = self;
  BOOL v9 = sub_100075DC0();

  swift_bridgeObjectRelease();
  return v9;
}

- (void)textFieldDidBeginEditing:(id)a3
{
}

- (void)textFieldDidEndEditing:(id)a3
{
}

@end