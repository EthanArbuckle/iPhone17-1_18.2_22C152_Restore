@interface AlarmApertureElementController
- (BOOL)preventsInteractiveDismissal;
- (NSString)associatedAppBundleIdentifier;
- (NSString)elementIdentifier;
- (NSURL)launchURL;
- (SBUISystemApertureAccessoryView)leadingView;
- (SBUISystemApertureAccessoryView)minimalView;
- (SBUISystemApertureAccessoryView)trailingView;
- (UIColor)keyColor;
- (_TtC10ClockAngel30AlarmApertureElementController)init;
- (_TtC10ClockAngel30AlarmApertureElementController)initWithCoder:(id)a3;
- (_TtC10ClockAngel30AlarmApertureElementController)initWithNibName:(id)a3 bundle:(id)a4;
- (double)preferredHeightForBottomSafeArea;
- (int64_t)activeLayoutMode;
- (int64_t)contentRole;
- (int64_t)maximumLayoutMode;
- (int64_t)preferredLayoutMode;
- (unint64_t)presentationBehaviors;
- (void)collapse;
- (void)dealloc;
- (void)setActiveLayoutMode:(int64_t)a3;
- (void)setAssociatedAppBundleIdentifier:(id)a3;
- (void)setContentRole:(int64_t)a3;
- (void)setElementIdentifier:(id)a3;
- (void)setLaunchURL:(id)a3;
- (void)setMaximumLayoutMode:(int64_t)a3;
- (void)setPreferredLayoutMode:(int64_t)a3;
- (void)setPresentationBehaviors:(unint64_t)a3;
- (void)setPreventsInteractiveDismissal:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation AlarmApertureElementController

- (unint64_t)presentationBehaviors
{
  return *(unint64_t *)((char *)&self->super.super.super.super.isa
                             + OBJC_IVAR____TtC10ClockAngel30AlarmApertureElementController_presentationBehaviors);
}

- (void)setPresentationBehaviors:(unint64_t)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC10ClockAngel30AlarmApertureElementController_presentationBehaviors) = (Class)a3;
}

- (int64_t)activeLayoutMode
{
  return *(int64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC10ClockAngel30AlarmApertureElementController_activeLayoutMode);
}

- (void)setActiveLayoutMode:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC10ClockAngel30AlarmApertureElementController_activeLayoutMode) = (Class)a3;
}

- (int64_t)contentRole
{
  return *(int64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC10ClockAngel30AlarmApertureElementController_contentRole);
}

- (void)setContentRole:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC10ClockAngel30AlarmApertureElementController_contentRole) = (Class)a3;
}

- (int64_t)preferredLayoutMode
{
  return *(int64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC10ClockAngel30AlarmApertureElementController_preferredLayoutMode);
}

- (void)setPreferredLayoutMode:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC10ClockAngel30AlarmApertureElementController_preferredLayoutMode) = (Class)a3;
}

- (int64_t)maximumLayoutMode
{
  return *(int64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC10ClockAngel30AlarmApertureElementController_maximumLayoutMode);
}

- (void)setMaximumLayoutMode:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC10ClockAngel30AlarmApertureElementController_maximumLayoutMode) = (Class)a3;
}

- (double)preferredHeightForBottomSafeArea
{
  v2 = self;
  id v3 = [(AlarmApertureElementController *)v2 view];
  if (v3)
  {
    v5 = v3;
    id v6 = [v3 SBUISA_systemApertureObstructedAreaLayoutGuide];

    [v6 layoutFrame];
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;

    v17.origin.x = v8;
    v17.origin.y = v10;
    v17.size.width = v12;
    v17.size.height = v14;
    double Height = CGRectGetHeight(v17);
    double v16 = *(double *)((char *)&v2->super.super.super.super.isa
                    + OBJC_IVAR____TtC10ClockAngel30AlarmApertureElementController_buttonSize);

    return v16 + 34.0 - Height;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (NSURL)launchURL
{
  uint64_t v3 = sub_100007830((uint64_t *)&unk_1000C3FF0);
  __chkstk_darwin(v3 - 8);
  v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = (char *)self + OBJC_IVAR____TtC10ClockAngel30AlarmApertureElementController_launchURL;
  swift_beginAccess();
  sub_100027FB8((uint64_t)v6, (uint64_t)v5);
  uint64_t v7 = type metadata accessor for URL();
  uint64_t v8 = *(void *)(v7 - 8);
  CGFloat v10 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    URL._bridgeToObjectiveC()(v9);
    CGFloat v10 = v11;
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }

  return (NSURL *)v10;
}

- (void)setLaunchURL:(id)a3
{
  uint64_t v5 = sub_100007830((uint64_t *)&unk_1000C3FF0);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v8 = type metadata accessor for URL();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    uint64_t v9 = type metadata accessor for URL();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  CGFloat v10 = (char *)self + OBJC_IVAR____TtC10ClockAngel30AlarmApertureElementController_launchURL;
  swift_beginAccess();
  double v11 = self;
  sub_100027F50((uint64_t)v7, (uint64_t)v10);
  swift_endAccess();
}

- (NSString)associatedAppBundleIdentifier
{
  if (*(void *)&self->observerId[OBJC_IVAR____TtC10ClockAngel30AlarmApertureElementController_associatedAppBundleIdentifier])
  {
    swift_bridgeObjectRetain();
    NSString v2 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v2 = 0;
  }

  return (NSString *)v2;
}

- (void)setAssociatedAppBundleIdentifier:(id)a3
{
  if (a3)
  {
    uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
  }
  uint64_t v6 = (uint64_t *)((char *)self
                 + OBJC_IVAR____TtC10ClockAngel30AlarmApertureElementController_associatedAppBundleIdentifier);
  *uint64_t v6 = v4;
  v6[1] = v5;

  swift_bridgeObjectRelease();
}

- (NSString)elementIdentifier
{
  return (NSString *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                             + OBJC_IVAR____TtC10ClockAngel30AlarmApertureElementController_elementIdentifier));
}

- (void)setElementIdentifier:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC10ClockAngel30AlarmApertureElementController_elementIdentifier);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC10ClockAngel30AlarmApertureElementController_elementIdentifier) = (Class)a3;
  id v3 = a3;
}

- (BOOL)preventsInteractiveDismissal
{
  return *((unsigned char *)&self->super.super.super.super.isa
         + OBJC_IVAR____TtC10ClockAngel30AlarmApertureElementController_preventsInteractiveDismissal);
}

- (void)setPreventsInteractiveDismissal:(BOOL)a3
{
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC10ClockAngel30AlarmApertureElementController_preventsInteractiveDismissal) = a3;
}

- (SBUISystemApertureAccessoryView)leadingView
{
  return (SBUISystemApertureAccessoryView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                                    + OBJC_IVAR____TtC10ClockAngel30AlarmApertureElementController_leadingView));
}

- (SBUISystemApertureAccessoryView)trailingView
{
  return (SBUISystemApertureAccessoryView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                                    + OBJC_IVAR____TtC10ClockAngel30AlarmApertureElementController_trailingView));
}

- (SBUISystemApertureAccessoryView)minimalView
{
  return (SBUISystemApertureAccessoryView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                                    + OBJC_IVAR____TtC10ClockAngel30AlarmApertureElementController_minimalView));
}

- (UIColor)keyColor
{
  return (UIColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                            + OBJC_IVAR____TtC10ClockAngel30AlarmApertureElementController_keyColor));
}

- (void)viewDidLoad
{
  NSString v2 = self;
  sub_100020FC8();
}

- (_TtC10ClockAngel30AlarmApertureElementController)initWithCoder:(id)a3
{
  return (_TtC10ClockAngel30AlarmApertureElementController *)sub_100021674(a3);
}

- (_TtC10ClockAngel30AlarmApertureElementController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC10ClockAngel30AlarmApertureElementController *)sub_100021BB4(v5, v7, a4);
}

- (void)dealloc
{
  NSString v2 = self;
  sub_100022160();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10ClockAngel30AlarmApertureElementController_compressedSnoozeTrailingHost));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10ClockAngel30AlarmApertureElementController_compressedSnoozeLeadingHost));
  sub_10000FAF8((uint64_t)self + OBJC_IVAR____TtC10ClockAngel30AlarmApertureElementController_launchURL, (uint64_t *)&unk_1000C3FF0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10ClockAngel30AlarmApertureElementController_elementIdentifier));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10ClockAngel30AlarmApertureElementController_leadingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10ClockAngel30AlarmApertureElementController_trailingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10ClockAngel30AlarmApertureElementController_minimalView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10ClockAngel30AlarmApertureElementController_keyColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10ClockAngel30AlarmApertureElementController_alarmAlertLeadingHost));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10ClockAngel30AlarmApertureElementController_alarmAlertTrailingHost));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10ClockAngel30AlarmApertureElementController_alarmSnoozeExpandedHostLeading));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10ClockAngel30AlarmApertureElementController_alarmSnoozeExpandedHostTrailing));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10ClockAngel30AlarmApertureElementController_voiceOverTimer));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC10ClockAngel30AlarmApertureElementController_alarmAnimationView);
}

- (void)viewWillAppear:(BOOL)a3
{
  id v4 = self;
  sub_100022620(a3);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for AlarmApertureElementController();
  swift_unknownObjectRetain();
  id v7 = v12.receiver;
  -[AlarmApertureElementController viewWillTransitionToSize:withTransitionCoordinator:](&v12, "viewWillTransitionToSize:withTransitionCoordinator:", a4, width, height);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  v11[4] = sub_100027EE0;
  v11[5] = v8;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 1107296256;
  v11[2] = sub_10008822C;
  v11[3] = &unk_1000B3860;
  uint64_t v9 = _Block_copy(v11);
  id v10 = v7;
  swift_release();
  [a4 animateAlongsideTransition:v9 completion:0];
  _Block_release(v9);
  swift_unknownObjectRelease();
}

- (void)collapse
{
  NSString v2 = self;
  [v2 systemApertureElementContext].requestTransitionToPreferredLayoutMode();

  swift_unknownObjectRelease();
}

- (_TtC10ClockAngel30AlarmApertureElementController)init
{
  double result = (_TtC10ClockAngel30AlarmApertureElementController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end