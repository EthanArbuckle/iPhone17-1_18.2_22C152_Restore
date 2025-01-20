@interface CNPosterOnboardingSettingsAnimationViewController
+ (BOOL)isAnimationPausable;
+ (BOOL)pausableAnimationStartingValue;
+ (void)controllerFor:(id)a3 isRTL:(BOOL)a4 windowScene:(id)a5 shouldDefaultToCleanState:(BOOL)a6 completion:(id)a7;
- (BOOL)isAnimationPaused;
- (_TtC10ContactsUI49CNPosterOnboardingSettingsAnimationViewController)initWithCoder:(id)a3;
- (_TtC10ContactsUI49CNPosterOnboardingSettingsAnimationViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)setIsAnimationPaused:(BOOL)a3;
- (void)toggleAnimation;
- (void)viewWillLayoutSubviews;
@end

@implementation CNPosterOnboardingSettingsAnimationViewController

+ (void)controllerFor:(id)a3 isRTL:(BOOL)a4 windowScene:(id)a5 shouldDefaultToCleanState:(BOOL)a6 completion:(id)a7
{
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E913B5D0);
  MEMORY[0x1F4188790](v12 - 8, v13);
  v15 = (char *)&v26 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = _Block_copy(a7);
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v16;
  uint64_t v18 = sub_18B986078();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v15, 1, 1, v18);
  sub_18B986048();
  id v19 = a3;
  id v20 = a5;
  id v21 = v19;
  id v22 = v20;
  swift_retain();
  uint64_t v23 = sub_18B986038();
  uint64_t v24 = swift_allocObject();
  uint64_t v25 = MEMORY[0x1E4FBCFD8];
  *(void *)(v24 + 16) = v23;
  *(void *)(v24 + 24) = v25;
  *(void *)(v24 + 32) = v21;
  *(unsigned char *)(v24 + 40) = a4;
  *(void *)(v24 + 48) = v22;
  *(unsigned char *)(v24 + 56) = a6;
  *(void *)(v24 + 64) = sub_18B71FA00;
  *(void *)(v24 + 72) = v17;
  sub_18B67D538((uint64_t)v15, (uint64_t)&unk_1E913E2C0, v24);
  swift_release();
  swift_release();
}

- (_TtC10ContactsUI49CNPosterOnboardingSettingsAnimationViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC10ContactsUI49CNPosterOnboardingSettingsAnimationViewController_animationLayer) = 0;
  uint64_t v4 = OBJC_IVAR____TtC10ContactsUI49CNPosterOnboardingSettingsAnimationViewController_isAnimationPaused;
  id v5 = a3;
  *((unsigned char *)&self->super.super.super.isa + v4) = !UIAccessibilityIsVideoAutoplayEnabled();

  result = (_TtC10ContactsUI49CNPosterOnboardingSettingsAnimationViewController *)sub_18B986768();
  __break(1u);
  return result;
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  sub_18B71E05C();
}

+ (BOOL)isAnimationPausable
{
  return UIAccessibilityIsReduceMotionEnabled() || !UIAccessibilityIsVideoAutoplayEnabled();
}

+ (BOOL)pausableAnimationStartingValue
{
  return !UIAccessibilityIsVideoAutoplayEnabled();
}

- (BOOL)isAnimationPaused
{
  v2 = (BOOL *)self + OBJC_IVAR____TtC10ContactsUI49CNPosterOnboardingSettingsAnimationViewController_isAnimationPaused;
  swift_beginAccess();
  return *v2;
}

- (void)setIsAnimationPaused:(BOOL)a3
{
  uint64_t v4 = (BOOL *)self + OBJC_IVAR____TtC10ContactsUI49CNPosterOnboardingSettingsAnimationViewController_isAnimationPaused;
  swift_beginAccess();
  *uint64_t v4 = a3;
}

- (void)toggleAnimation
{
  v2 = self;
  sub_18B71E41C();
}

- (_TtC10ContactsUI49CNPosterOnboardingSettingsAnimationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC10ContactsUI49CNPosterOnboardingSettingsAnimationViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = *(void **)((char *)&self->super.super._responderFlags
                + OBJC_IVAR____TtC10ContactsUI49CNPosterOnboardingSettingsAnimationViewController_dataSource);
  id v4 = *(FBSSceneIdentityToken **)((char *)&self->super.super.__layeringSceneIdentity
                                 + OBJC_IVAR____TtC10ContactsUI49CNPosterOnboardingSettingsAnimationViewController_dataSource);
  id v5 = *(UIViewControllerTransitioningDelegate **)((char *)&self->super._overrideTransitioningDelegate
                                                 + OBJC_IVAR____TtC10ContactsUI49CNPosterOnboardingSettingsAnimationViewController_dataSource);
  v6 = *(UIView **)((char *)&self->super._view
                  + OBJC_IVAR____TtC10ContactsUI49CNPosterOnboardingSettingsAnimationViewController_dataSource);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10ContactsUI49CNPosterOnboardingSettingsAnimationViewController_dataSource));

  v7 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC10ContactsUI49CNPosterOnboardingSettingsAnimationViewController_animationLayer);
}

@end