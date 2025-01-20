@interface FCUICustomModeWelcomeSwiftController
+ (id)welcomeControllerWithAllReservedModes:(id)a3;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (_TtC13FocusSettings36FCUICustomModeWelcomeSwiftController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC13FocusSettings36FCUICustomModeWelcomeSwiftController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)_saveButtonPressed:(id)a3;
- (void)_tapped;
- (void)setContentIsScrolling:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation FCUICustomModeWelcomeSwiftController

- (void)setContentIsScrolling:(BOOL)a3
{
  self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC13FocusSettings36FCUICustomModeWelcomeSwiftController_isContentScrolling] = a3;
}

+ (id)welcomeControllerWithAllReservedModes:(id)a3
{
  ObjCClassMetadata = (objc_class *)swift_getObjCClassMetadata();
  sub_F0B8(0, &qword_23B58);
  sub_13EDC();
  uint64_t v4 = sub_145C0();
  id v5 = objc_allocWithZone(ObjCClassMetadata);
  id v6 = sub_FFD4(v4);

  return v6;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_10198();
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  v7 = self;
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  id v11 = [v7 sharedApplication];
  [v11 sendAction:"resignFirstResponder" to:0 from:0 forEvent:0];

  return 0;
}

- (void)_saveButtonPressed:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_12EA4();
}

- (void)_tapped
{
  v3 = self;
  id v4 = self;
  id v5 = [v3 sharedApplication];
  [v5 sendAction:"resignFirstResponder" to:0 from:0 forEvent:0];
}

- (_TtC13FocusSettings36FCUICustomModeWelcomeSwiftController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC13FocusSettings36FCUICustomModeWelcomeSwiftController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC13FocusSettings36FCUICustomModeWelcomeSwiftController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC13FocusSettings36FCUICustomModeWelcomeSwiftController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = *(void **)&self->super.OBWelcomeController_opaque[OBJC_IVAR____TtC13FocusSettings36FCUICustomModeWelcomeSwiftController_keyboardDismissalTapRecognizer];
}

@end