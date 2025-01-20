@interface FCUIFocusCustomizationInvitationSwiftController
+ (id)welcomeControllerWithMode:(id)a3;
- (_TtC13FocusSettings47FCUIFocusCustomizationInvitationSwiftController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC13FocusSettings47FCUIFocusCustomizationInvitationSwiftController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)_nextButtonPressed:(id)a3;
- (void)viewDidLoad;
@end

@implementation FCUIFocusCustomizationInvitationSwiftController

+ (id)welcomeControllerWithMode:(id)a3
{
  id v4 = objc_allocWithZone((Class)swift_getObjCClassMetadata());
  id v5 = sub_B398(a3);

  return v5;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_B468();
}

- (void)_nextButtonPressed:(id)a3
{
  id v4 = (_TtC13FocusSettings47FCUIFocusCustomizationInvitationSwiftController *)a3;
  v7 = self;
  id v5 = [(FCUIBaseWelcomeController *)v7 setupNavigationController];
  if (v5)
  {
    v6 = (_TtC13FocusSettings47FCUIFocusCustomizationInvitationSwiftController *)v5;
    [(FCUISetupNavigationController *)v5 createDefaultModeConfigurationForMode:*(void *)&v7->super.OBWelcomeController_opaque[OBJC_IVAR____TtC13FocusSettings47FCUIFocusCustomizationInvitationSwiftController_mode]];

    id v4 = v7;
    v7 = v6;
  }
}

- (_TtC13FocusSettings47FCUIFocusCustomizationInvitationSwiftController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC13FocusSettings47FCUIFocusCustomizationInvitationSwiftController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC13FocusSettings47FCUIFocusCustomizationInvitationSwiftController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC13FocusSettings47FCUIFocusCustomizationInvitationSwiftController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end