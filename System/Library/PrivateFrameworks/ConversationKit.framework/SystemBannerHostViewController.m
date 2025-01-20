@interface SystemBannerHostViewController
- (BNPresentableContext)presentableContext;
- (BOOL)_canShowWhileLocked;
- (BOOL)canRequestAlertingAssertion;
- (BOOL)isDraggingDismissalEnabled;
- (BOOL)isDraggingInteractionEnabled;
- (BOOL)isTouchOutsideDismissalEnabled;
- (BSAnimationSettings)bannerSizeTransitionAnimationSettings;
- (CGSize)preferredContentSizeWithPresentationSize:(CGSize)a3 containerSize:(CGSize)a4;
- (NSSet)backgroundActivitiesToSuppress;
- (NSString)associatedAppBundleIdentifier;
- (NSString)elementIdentifier;
- (NSString)requestIdentifier;
- (NSString)requesterIdentifier;
- (SBUISystemApertureAccessoryView)detachedMinimalView;
- (SBUISystemApertureAccessoryView)leadingView;
- (SBUISystemApertureAccessoryView)minimalView;
- (SBUISystemApertureAccessoryView)trailingView;
- (SBUISystemApertureElement)systemApertureElementViewController;
- (UIColor)keyColor;
- (UIEdgeInsets)bannerContentOutsets;
- (UIViewController)viewController;
- (_TtC15ConversationKit30SystemBannerHostViewController)initWithCoder:(id)a3;
- (_TtC15ConversationKit30SystemBannerHostViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (int64_t)activeLayoutMode;
- (int64_t)contentRole;
- (int64_t)maximumLayoutMode;
- (int64_t)preferredLayoutMode;
- (unint64_t)presentationBehaviors;
- (void)callDisplayContextChanged:(id)a3;
- (void)callStatusChanged:(id)a3;
- (void)contextMenuDidDismiss:(id)a3;
- (void)contextMenuWillPresent:(id)a3;
- (void)dealloc;
- (void)didMoveToParentViewController:(id)a3;
- (void)handleSceneStateChangeNotification:(id)a3;
- (void)presentableDidAppearAsBanner:(id)a3;
- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4;
- (void)presentableWillAppearAsBanner:(id)a3;
- (void)setActiveLayoutMode:(int64_t)a3;
- (void)setCanRequestAlertingAssertion:(BOOL)a3;
- (void)setPresentableContext:(id)a3;
- (void)setRequesterIdentifier:(id)a3;
- (void)userInteractionDidEndForBannerForPresentable:(id)a3;
- (void)userInteractionWillBeginForBannerForPresentable:(id)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
- (void)viewWillLayoutSubviewsWithTransitionCoordinator:(id)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation SystemBannerHostViewController

- (NSString)requesterIdentifier
{
  uint64_t v2 = SystemBannerHostViewController.requesterIdentifier.getter();
  if (v3)
  {
    v4 = (void *)MEMORY[0x1C87730B0](v2);
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return (NSString *)v4;
}

- (void)setRequesterIdentifier:(id)a3
{
  if (a3)
  {
    uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  v7 = self;
  SystemBannerHostViewController.requesterIdentifier.setter(v4, v6);
}

- (BNPresentableContext)presentableContext
{
  uint64_t v2 = (void *)SystemBannerHostViewController.presentableContext.getter();
  return (BNPresentableContext *)v2;
}

- (void)setPresentableContext:(id)a3
{
  swift_unknownObjectRetain();
  uint64_t v4 = self;
  SystemBannerHostViewController.presentableContext.setter();
}

- (_TtC15ConversationKit30SystemBannerHostViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  SystemBannerHostViewController.init(coder:)();
}

- (void)dealloc
{
  uint64_t v2 = self;
  SystemBannerHostViewController.__deallocating_deinit();
}

- (void).cxx_destruct
{
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit30SystemBannerHostViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit30SystemBannerHostViewController_controlsManager));
  OUTLINED_FUNCTION_132_1();
  outlined destroy of ConversationControlsType((uint64_t)self + OBJC_IVAR____TtC15ConversationKit30SystemBannerHostViewController_controlsType);
  outlined destroy of ZStack<ModifiedContent<ConversationStatusView, _PaddingLayout>?>((uint64_t)self + OBJC_IVAR____TtC15ConversationKit30SystemBannerHostViewController_notice, &demangling cache variable for type metadata for Notice?);
  OUTLINED_FUNCTION_132_1();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit30SystemBannerHostViewController____lazy_storage___captureOnlyBackdropView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit30SystemBannerHostViewController_shadowView));
  swift_release();
  swift_release();
  outlined destroy of ZStack<ModifiedContent<ConversationStatusView, _PaddingLayout>?>((uint64_t)self + OBJC_IVAR____TtC15ConversationKit30SystemBannerHostViewController_overriddenSystemApertureContent, &demangling cache variable for type metadata for SystemBannerHostViewController.OverriddenSystemApertureContent?);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit30SystemBannerHostViewController_conversationControlsViewController));
  OUTLINED_FUNCTION_132_1();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit30SystemBannerHostViewController_layoutDescription));
  swift_unknownObjectRelease();
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit30SystemBannerHostViewController_presentableContext);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  id v3 = (char *)self + OBJC_IVAR____TtC15ConversationKit30SystemBannerHostViewController_activityUUID;
  type metadata accessor for UUID();
  OUTLINED_FUNCTION_0();
  (*(void (**)(char *))(v4 + 8))(v3);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit30SystemBannerHostViewController_features));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit30SystemBannerHostViewController_notificationCenter));
  OUTLINED_FUNCTION_132_1();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit30SystemBannerHostViewController_leadingViewContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit30SystemBannerHostViewController_trailingViewContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit30SystemBannerHostViewController_minimalViewContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit30SystemBannerHostViewController_detachedMinimalViewContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit30SystemBannerHostViewController_elementIdentifier));
  uint64_t v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC15ConversationKit30SystemBannerHostViewController_keyColor);
}

- (void)contextMenuWillPresent:(id)a3
{
}

- (void)contextMenuDidDismiss:(id)a3
{
}

- (void)handleSceneStateChangeNotification:(id)a3
{
}

- (void)callStatusChanged:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  SystemBannerHostViewController.callStatusChanged(_:)();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)callDisplayContextChanged:(id)a3
{
}

- (void)viewDidLoad
{
  uint64_t v2 = self;
  SystemBannerHostViewController.viewDidLoad()();
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  swift_unknownObjectRetain();
  uint64_t v6 = self;
  SystemBannerHostViewController.viewWillTransition(to:with:)(a4);

  swift_unknownObjectRelease();
}

- (void)viewWillLayoutSubviews
{
  uint64_t v2 = self;
  SystemBannerHostViewController.viewWillLayoutSubviews()();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)didMoveToParentViewController:(id)a3
{
  id v6 = a3;
  uint64_t v5 = self;
  SystemBannerHostViewController.didMove(toParent:)((UIViewController_optional *)a3);
}

- (void)userInteractionWillBeginForBannerForPresentable:(id)a3
{
}

- (void)userInteractionDidEndForBannerForPresentable:(id)a3
{
}

- (void)presentableWillAppearAsBanner:(id)a3
{
}

- (void)presentableDidAppearAsBanner:(id)a3
{
}

- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4
{
  swift_unknownObjectRetain();
  id v6 = a4;
  v7 = self;
  SystemBannerHostViewController.presentableDidDisappear(asBanner:withReason:)();
  swift_unknownObjectRelease();
}

- (UIViewController)viewController
{
  SystemBannerHostViewController.viewController.getter();
  return (UIViewController *)self;
}

- (NSString)requestIdentifier
{
  uint64_t v2 = SystemBannerHostViewController.requestIdentifier.getter();
  id v3 = (void *)MEMORY[0x1C87730B0](v2);
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (UIEdgeInsets)bannerContentOutsets
{
  uint64_t v2 = self;
  double v3 = SystemBannerHostViewController.bannerContentOutsets.getter();
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;

  double v10 = v3;
  double v11 = v5;
  double v12 = v7;
  double v13 = v9;
  result.right = v13;
  result.bottom = v12;
  result.left = v11;
  result.top = v10;
  return result;
}

- (BOOL)isTouchOutsideDismissalEnabled
{
  uint64_t v2 = self;
  BOOL v3 = SystemBannerHostViewController.isTouchOutsideDismissalEnabled.getter();

  return v3;
}

- (BOOL)isDraggingDismissalEnabled
{
  uint64_t v2 = self;
  char v3 = SystemBannerHostViewController.eligibleForDismissal.getter();

  return v3 & 1;
}

- (BOOL)isDraggingInteractionEnabled
{
  uint64_t v2 = self;
  char v3 = SystemBannerHostViewController.isDraggingInteractionEnabled.getter();

  return v3 & 1;
}

- (BSAnimationSettings)bannerSizeTransitionAnimationSettings
{
  uint64_t v2 = self;
  id v3 = SystemBannerHostViewController.bannerSizeTransitionAnimationSettings.getter();

  return (BSAnimationSettings *)v3;
}

- (CGSize)preferredContentSizeWithPresentationSize:(CGSize)a3 containerSize:(CGSize)a4
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  double v6 = self;
  CGSize v9 = SystemBannerHostViewController.preferredContentSize(withPresentationSize:containerSize:)((CGSize)__PAIR128__(*(unint64_t *)&height, *(unint64_t *)&width), (CGSize)__PAIR128__(v8, v7));

  double v10 = v9.width;
  double v11 = v9.height;
  result.CGFloat height = v11;
  result.CGFloat width = v10;
  return result;
}

- (SBUISystemApertureElement)systemApertureElementViewController
{
  uint64_t v2 = self;
  SystemBannerHostViewController.systemApertureElementViewController.getter();

  return (SBUISystemApertureElement *)v2;
}

- (int64_t)activeLayoutMode
{
  return SystemBannerHostViewController.activeLayoutMode.getter();
}

- (void)setActiveLayoutMode:(int64_t)a3
{
}

- (BOOL)canRequestAlertingAssertion
{
  return SystemBannerHostViewController.canRequestAlertingAssertion.getter() & 1;
}

- (void)setCanRequestAlertingAssertion:(BOOL)a3
{
  double v4 = self;
  SystemBannerHostViewController.canRequestAlertingAssertion.setter(a3);
}

- (int64_t)contentRole
{
  return SystemBannerHostViewController.contentRole.getter();
}

- (int64_t)preferredLayoutMode
{
  uint64_t v2 = self;
  SystemBannerHostViewController.preferredLayoutMode.getter();
  int64_t v4 = v3;

  return v4;
}

- (int64_t)maximumLayoutMode
{
  uint64_t v2 = self;
  int64_t v3 = SystemBannerHostViewController.maximumLayoutMode.getter();

  return v3;
}

- (SBUISystemApertureAccessoryView)leadingView
{
  uint64_t v2 = SystemBannerHostViewController.leadingView.getter();
  return (SBUISystemApertureAccessoryView *)v2;
}

- (SBUISystemApertureAccessoryView)trailingView
{
  uint64_t v2 = SystemBannerHostViewController.trailingView.getter();
  return (SBUISystemApertureAccessoryView *)v2;
}

- (SBUISystemApertureAccessoryView)minimalView
{
  uint64_t v2 = SystemBannerHostViewController.minimalView.getter();
  return (SBUISystemApertureAccessoryView *)v2;
}

- (SBUISystemApertureAccessoryView)detachedMinimalView
{
  uint64_t v2 = SystemBannerHostViewController.detachedMinimalView.getter();
  return (SBUISystemApertureAccessoryView *)v2;
}

- (NSString)elementIdentifier
{
  uint64_t v2 = SystemBannerHostViewController.elementIdentifier.getter();
  return (NSString *)v2;
}

- (NSString)associatedAppBundleIdentifier
{
  uint64_t v2 = self;
  uint64_t v3 = SystemBannerHostViewController.associatedAppBundleIdentifier.getter();
  uint64_t v5 = v4;

  if (v5)
  {
    double v6 = (void *)MEMORY[0x1C87730B0](v3, v5);
    swift_bridgeObjectRelease();
  }
  else
  {
    double v6 = 0;
  }
  return (NSString *)v6;
}

- (NSSet)backgroundActivitiesToSuppress
{
  uint64_t v2 = self;
  SystemBannerHostViewController.backgroundActivitiesToSuppress.getter();

  type metadata accessor for STBackgroundActivityIdentifier(0);
  lazy protocol witness table accessor for type STBackgroundActivityIdentifier and conformance STBackgroundActivityIdentifier();
  v3.super.isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSSet *)v3.super.isa;
}

- (unint64_t)presentationBehaviors
{
  uint64_t v2 = self;
  unint64_t v3 = SystemBannerHostViewController.presentationBehaviors.getter();

  return v3;
}

- (UIColor)keyColor
{
  uint64_t v2 = SystemBannerHostViewController.keyColor.getter();
  return (UIColor *)v2;
}

- (void)viewWillLayoutSubviewsWithTransitionCoordinator:(id)a3
{
  swift_unknownObjectRetain();
  uint64_t v4 = self;
  SystemBannerHostViewController.viewWillLayoutSubviews(with:)();

  swift_unknownObjectRelease();
}

- (_TtC15ConversationKit30SystemBannerHostViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v5 = a4;
  SystemBannerHostViewController.init(nibName:bundle:)();
}

@end