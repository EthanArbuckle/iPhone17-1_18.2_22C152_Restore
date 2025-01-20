@interface TimerApertureElementController
- (NSString)associatedAppBundleIdentifier;
- (NSString)elementIdentifier;
- (NSURL)launchURL;
- (SBUISystemApertureAccessoryView)leadingView;
- (SBUISystemApertureAccessoryView)minimalView;
- (SBUISystemApertureAccessoryView)trailingView;
- (UIColor)keyColor;
- (_TtC10ClockAngel30TimerApertureElementController)init;
- (_TtC10ClockAngel30TimerApertureElementController)initWithCoder:(id)a3;
- (_TtC10ClockAngel30TimerApertureElementController)initWithNibName:(id)a3 bundle:(id)a4;
- (double)preferredHeightForBottomSafeArea;
- (id)_timelinesForDateInterval:(id)a3;
- (int64_t)activeLayoutMode;
- (int64_t)contentRole;
- (int64_t)maximumLayoutMode;
- (int64_t)preferredLayoutMode;
- (unint64_t)presentationBehaviors;
- (void)_updateWithFrameSpecifier:(id)a3 completion:(id)a4;
- (void)collapse;
- (void)dealloc;
- (void)playPausedAction;
- (void)setActiveLayoutMode:(int64_t)a3;
- (void)setAssociatedAppBundleIdentifier:(id)a3;
- (void)setContentRole:(int64_t)a3;
- (void)setElementIdentifier:(id)a3;
- (void)setLaunchURL:(id)a3;
- (void)setMaximumLayoutMode:(int64_t)a3;
- (void)setPreferredLayoutMode:(int64_t)a3;
- (void)setPresentationBehaviors:(unint64_t)a3;
- (void)stopAction;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation TimerApertureElementController

- (unint64_t)presentationBehaviors
{
  return *(unint64_t *)((char *)&self->super.super.super.super.isa
                             + OBJC_IVAR____TtC10ClockAngel30TimerApertureElementController_presentationBehaviors);
}

- (void)setPresentationBehaviors:(unint64_t)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC10ClockAngel30TimerApertureElementController_presentationBehaviors) = (Class)a3;
}

- (int64_t)activeLayoutMode
{
  return *(int64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC10ClockAngel30TimerApertureElementController_activeLayoutMode);
}

- (void)setActiveLayoutMode:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC10ClockAngel30TimerApertureElementController_activeLayoutMode) = (Class)a3;
}

- (int64_t)contentRole
{
  return *(int64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC10ClockAngel30TimerApertureElementController_contentRole);
}

- (void)setContentRole:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC10ClockAngel30TimerApertureElementController_contentRole) = (Class)a3;
}

- (int64_t)preferredLayoutMode
{
  return *(int64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC10ClockAngel30TimerApertureElementController_preferredLayoutMode);
}

- (void)setPreferredLayoutMode:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC10ClockAngel30TimerApertureElementController_preferredLayoutMode) = (Class)a3;
}

- (int64_t)maximumLayoutMode
{
  return *(int64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC10ClockAngel30TimerApertureElementController_maximumLayoutMode);
}

- (void)setMaximumLayoutMode:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC10ClockAngel30TimerApertureElementController_maximumLayoutMode) = (Class)a3;
}

- (double)preferredHeightForBottomSafeArea
{
  v2 = self;
  id v3 = [(TimerApertureElementController *)v2 view];
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
                    + OBJC_IVAR____TtC10ClockAngel30TimerApertureElementController_buttonSize);

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
  id v6 = (char *)self + OBJC_IVAR____TtC10ClockAngel30TimerApertureElementController_launchURL;
  swift_beginAccess();
  sub_10000FA94((uint64_t)v6, (uint64_t)v5, (uint64_t *)&unk_1000C3FF0);
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
  CGFloat v10 = (char *)self + OBJC_IVAR____TtC10ClockAngel30TimerApertureElementController_launchURL;
  swift_beginAccess();
  double v11 = self;
  sub_10001EFF4((uint64_t)v7, (uint64_t)v10, (uint64_t *)&unk_1000C3FF0);
  swift_endAccess();
}

- (NSString)associatedAppBundleIdentifier
{
  if (*(void *)&self->observerId[OBJC_IVAR____TtC10ClockAngel30TimerApertureElementController_associatedAppBundleIdentifier])
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
                 + OBJC_IVAR____TtC10ClockAngel30TimerApertureElementController_associatedAppBundleIdentifier);
  *uint64_t v6 = v4;
  v6[1] = v5;

  swift_bridgeObjectRelease();
}

- (NSString)elementIdentifier
{
  return (NSString *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                             + OBJC_IVAR____TtC10ClockAngel30TimerApertureElementController_elementIdentifier));
}

- (void)setElementIdentifier:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC10ClockAngel30TimerApertureElementController_elementIdentifier);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC10ClockAngel30TimerApertureElementController_elementIdentifier) = (Class)a3;
  id v3 = a3;
}

- (SBUISystemApertureAccessoryView)leadingView
{
  return (SBUISystemApertureAccessoryView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                                    + OBJC_IVAR____TtC10ClockAngel30TimerApertureElementController_leadingView));
}

- (SBUISystemApertureAccessoryView)trailingView
{
  return (SBUISystemApertureAccessoryView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                                    + OBJC_IVAR____TtC10ClockAngel30TimerApertureElementController_trailingView));
}

- (SBUISystemApertureAccessoryView)minimalView
{
  return (SBUISystemApertureAccessoryView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                                    + OBJC_IVAR____TtC10ClockAngel30TimerApertureElementController_minimalView));
}

- (UIColor)keyColor
{
  return (UIColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                            + OBJC_IVAR____TtC10ClockAngel30TimerApertureElementController_keyColor));
}

- (void)viewDidLoad
{
  NSString v2 = self;
  sub_10007B2A0();
}

- (_TtC10ClockAngel30TimerApertureElementController)initWithCoder:(id)a3
{
  return (_TtC10ClockAngel30TimerApertureElementController *)sub_10007BC14(a3);
}

- (_TtC10ClockAngel30TimerApertureElementController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC10ClockAngel30TimerApertureElementController *)sub_10007C204(v5, v7, a4);
}

- (void)dealloc
{
  NSString v2 = self;
  sub_10007C868();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10000FAF8((uint64_t)self + OBJC_IVAR____TtC10ClockAngel30TimerApertureElementController_launchURL, (uint64_t *)&unk_1000C3FF0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10ClockAngel30TimerApertureElementController_elementIdentifier));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10ClockAngel30TimerApertureElementController_leadingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10ClockAngel30TimerApertureElementController_trailingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10ClockAngel30TimerApertureElementController_minimalView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10ClockAngel30TimerApertureElementController_keyColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10ClockAngel30TimerApertureElementController_compressedRunningHost));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10ClockAngel30TimerApertureElementController_compressedPausedHost));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10ClockAngel30TimerApertureElementController_expandedLabelHost));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10ClockAngel30TimerApertureElementController_expandedCountdownHost));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10ClockAngel30TimerApertureElementController_expandedTimerAlertingHost));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10ClockAngel30TimerApertureElementController_voiceOverTimer));
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10ClockAngel30TimerApertureElementController_pausePlayPackage));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10ClockAngel30TimerApertureElementController_playPauseButton));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC10ClockAngel30TimerApertureElementController_stopButton);
}

- (void)viewWillAppear:(BOOL)a3
{
  id v4 = self;
  sub_10007CC24(a3);
}

- (void)playPausedAction
{
  NSString v2 = self;
  sub_1000824B8();
}

- (void)stopAction
{
  NSString v2 = self;
  sub_100082B34();
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain();
  id v8 = self;
  sub_100082F64(a4, width, height);
  swift_unknownObjectRelease();
}

- (void)collapse
{
  NSString v2 = self;
  [v2 systemApertureElementContext].requestTransitionToPreferredLayoutMode;

  swift_unknownObjectRelease();
}

- (_TtC10ClockAngel30TimerApertureElementController)init
{
  double result = (_TtC10ClockAngel30TimerApertureElementController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_10008654C(a3);
}

- (id)_timelinesForDateInterval:(id)a3
{
  uint64_t v4 = type metadata accessor for DateInterval();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static DateInterval._unconditionallyBridgeFromObjectiveC(_:)();
  id v8 = self;
  Class isa = DateInterval._bridgeToObjectiveC()().super.isa;
  CGFloat v10 = (objc_class *)type metadata accessor for TimerApertureElementController(0);
  v14.receiver = v8;
  v14.super_class = v10;
  id v11 = [(TimerApertureElementController *)&v14 _timelinesForDateInterval:isa];

  sub_100014314(0, (unint64_t *)&unk_1000C6DD0);
  static Array._unconditionallyBridgeFromObjectiveC(_:)();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v12.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v12.super.isa;
}

- (void)_updateWithFrameSpecifier:(id)a3 completion:(id)a4
{
  uint64_t v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = sub_100086C00;
  *(void *)(v8 + 24) = v7;
  aBlock[4] = sub_100086C48;
  aBlock[5] = v8;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10001C5B8;
  aBlock[3] = &unk_1000B5AF0;
  uint64_t v9 = _Block_copy(aBlock);
  id v10 = a3;
  id v11 = self;
  swift_retain();
  swift_release();
  v12.receiver = v11;
  v12.super_class = (Class)type metadata accessor for TimerApertureElementController(0);
  [(TimerApertureElementController *)&v12 _updateWithFrameSpecifier:v10 completion:v9];
  _Block_release(v9);

  swift_release();
}

@end