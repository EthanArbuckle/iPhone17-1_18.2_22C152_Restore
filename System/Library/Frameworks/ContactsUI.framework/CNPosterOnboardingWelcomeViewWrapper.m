@interface CNPosterOnboardingWelcomeViewWrapper
- (UIViewController)hostingController;
- (_TtC10ContactsUI36CNPosterOnboardingWelcomeViewWrapper)init;
- (_TtC10ContactsUI36CNPosterOnboardingWelcomeViewWrapper)initWithContact:(id)a3 hasOptionToSkip:(BOOL)a4 hasExistingNickname:(BOOL)a5 navigationBarHeight:(double)a6 delegate:(id)a7 windowScene:(id)a8;
- (void)setHostingController:(id)a3;
@end

@implementation CNPosterOnboardingWelcomeViewWrapper

- (UIViewController)hostingController
{
  v2 = (id *)((char *)&self->super.isa
            + OBJC_IVAR____TtC10ContactsUI36CNPosterOnboardingWelcomeViewWrapper_hostingController);
  swift_beginAccess();
  return (UIViewController *)*v2;
}

- (void)setHostingController:(id)a3
{
  v4 = (void **)((char *)&self->super.isa
               + OBJC_IVAR____TtC10ContactsUI36CNPosterOnboardingWelcomeViewWrapper_hostingController);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  id v6 = a3;
}

- (_TtC10ContactsUI36CNPosterOnboardingWelcomeViewWrapper)initWithContact:(id)a3 hasOptionToSkip:(BOOL)a4 hasExistingNickname:(BOOL)a5 navigationBarHeight:(double)a6 delegate:(id)a7 windowScene:(id)a8
{
  BOOL v11 = a5;
  BOOL v12 = a4;
  id v13 = a3;
  swift_unknownObjectRetain();
  id v14 = a8;
  v15 = (_TtC10ContactsUI36CNPosterOnboardingWelcomeViewWrapper *)sub_18B6C8B14(v13, v12, v11, a6, (uint64_t)a7, v14);

  swift_unknownObjectRelease();
  return v15;
}

- (_TtC10ContactsUI36CNPosterOnboardingWelcomeViewWrapper)init
{
  result = (_TtC10ContactsUI36CNPosterOnboardingWelcomeViewWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10ContactsUI36CNPosterOnboardingWelcomeViewWrapper_hostingController));
}

@end