@interface CNPosterOnboardingPrivacyViewWrapper
- (UIViewController)hostingController;
- (_TtC10ContactsUI34CNPosterOnboardingPrivacyViewModel)model;
- (_TtC10ContactsUI36CNPosterOnboardingPrivacyViewWrapper)init;
- (_TtC10ContactsUI36CNPosterOnboardingPrivacyViewWrapper)initWithDelegate:(id)a3;
- (void)setHostingController:(id)a3;
- (void)setModel:(id)a3;
@end

@implementation CNPosterOnboardingPrivacyViewWrapper

- (UIViewController)hostingController
{
  v2 = (id *)((char *)&self->super.isa
            + OBJC_IVAR____TtC10ContactsUI36CNPosterOnboardingPrivacyViewWrapper_hostingController);
  swift_beginAccess();
  return (UIViewController *)*v2;
}

- (void)setHostingController:(id)a3
{
}

- (_TtC10ContactsUI34CNPosterOnboardingPrivacyViewModel)model
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC10ContactsUI36CNPosterOnboardingPrivacyViewWrapper_model);
  swift_beginAccess();
  return (_TtC10ContactsUI34CNPosterOnboardingPrivacyViewModel *)*v2;
}

- (void)setModel:(id)a3
{
}

- (_TtC10ContactsUI36CNPosterOnboardingPrivacyViewWrapper)initWithDelegate:(id)a3
{
  return (_TtC10ContactsUI36CNPosterOnboardingPrivacyViewWrapper *)CNPosterOnboardingPrivacyViewWrapper.init(delegate:)();
}

- (_TtC10ContactsUI36CNPosterOnboardingPrivacyViewWrapper)init
{
  result = (_TtC10ContactsUI36CNPosterOnboardingPrivacyViewWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10ContactsUI36CNPosterOnboardingPrivacyViewWrapper_hostingController));
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10ContactsUI36CNPosterOnboardingPrivacyViewWrapper_model);
}

@end