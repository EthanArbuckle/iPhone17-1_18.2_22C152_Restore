@interface GroupSessionSystemApertureViewController
+ (BOOL)_isSecureForRemoteViewService;
- (BNPresentableContext)presentableContext;
- (BOOL)_canShowWhileLocked;
- (BOOL)preventsAutomaticDismissal;
- (NSString)associatedAppBundleIdentifier;
- (NSString)associatedScenePersistenceIdentifier;
- (NSString)elementIdentifier;
- (SBUISystemApertureAccessoryView)leadingView;
- (SBUISystemApertureAccessoryView)minimalView;
- (SBUISystemApertureAccessoryView)trailingView;
- (_TtC13MediaRemoteUI40GroupSessionSystemApertureViewController)initWithCoder:(id)a3;
- (double)preferredHeightForBottomSafeArea;
- (int64_t)activeLayoutMode;
- (int64_t)contentRole;
- (int64_t)maximumLayoutMode;
- (int64_t)preferredCustomLayout;
- (int64_t)preferredLayoutMode;
- (unint64_t)presentationBehaviors;
- (void)setActiveLayoutMode:(int64_t)a3;
- (void)setPresentableContext:(id)a3;
- (void)viewDidLoad;
@end

@implementation GroupSessionSystemApertureViewController

- (_TtC13MediaRemoteUI40GroupSessionSystemApertureViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100008C74();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100007F84();
}

- (int64_t)activeLayoutMode
{
  return *(int64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC13MediaRemoteUI40GroupSessionSystemApertureViewController_activeLayoutMode);
}

- (void)setActiveLayoutMode:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC13MediaRemoteUI40GroupSessionSystemApertureViewController_activeLayoutMode) = (Class)a3;
}

- (NSString)associatedAppBundleIdentifier
{
  NSString v2 = String._bridgeToObjectiveC()();

  return (NSString *)v2;
}

- (NSString)associatedScenePersistenceIdentifier
{
  return (NSString *)0;
}

- (NSString)elementIdentifier
{
  NSString v2 = self;
  NSString v3 = String._bridgeToObjectiveC()();

  return (NSString *)v3;
}

- (int64_t)contentRole
{
  return 1;
}

- (int64_t)maximumLayoutMode
{
  return 4;
}

- (int64_t)preferredLayoutMode
{
  return 4;
}

- (int64_t)preferredCustomLayout
{
  return 4;
}

- (unint64_t)presentationBehaviors
{
  return 2;
}

- (BOOL)preventsAutomaticDismissal
{
  return 1;
}

- (SBUISystemApertureAccessoryView)leadingView
{
  return (SBUISystemApertureAccessoryView *)0;
}

- (SBUISystemApertureAccessoryView)trailingView
{
  return (SBUISystemApertureAccessoryView *)0;
}

- (SBUISystemApertureAccessoryView)minimalView
{
  return (SBUISystemApertureAccessoryView *)0;
}

- (double)preferredHeightForBottomSafeArea
{
  return 44.0;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (BNPresentableContext)presentableContext
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (BNPresentableContext *)Strong;
}

- (void)setPresentableContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI40GroupSessionSystemApertureViewController_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI40GroupSessionSystemApertureViewController_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI40GroupSessionSystemApertureViewController____lazy_storage___labelStack));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI40GroupSessionSystemApertureViewController____lazy_storage___routeIcon));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI40GroupSessionSystemApertureViewController_trailingIcon));
  NSString v3 = (char *)self + OBJC_IVAR____TtC13MediaRemoteUI40GroupSessionSystemApertureViewController_presentableContext;

  sub_100008C10((uint64_t)v3);
}

@end