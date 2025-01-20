@interface RPSystemApertureElementViewController
- (NSString)associatedAppBundleIdentifier;
- (NSString)elementIdentifier;
- (NSURL)launchURL;
- (SBUISystemApertureAccessoryView)leadingView;
- (SBUISystemApertureAccessoryView)minimalView;
- (SBUISystemApertureAccessoryView)trailingView;
- (UIColor)keyColor;
- (_TtC14ReplayKitAngel37RPSystemApertureElementViewController)initWithCoder:(id)a3;
- (_TtC14ReplayKitAngel37RPSystemApertureElementViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (double)preferredHeightForBottomSafeArea;
- (int64_t)activeLayoutMode;
- (int64_t)contentRole;
- (int64_t)maximumLayoutMode;
- (int64_t)preferredLayoutMode;
- (unint64_t)presentationBehaviors;
- (unint64_t)statusBarStyleOverridesToSuppress;
- (void)deleteRecording;
- (void)didTapStopButton;
- (void)handleCompletionTimeout;
- (void)handleCustomViewLongPressEvent;
- (void)openPhotos;
- (void)setActiveLayoutMode:(int64_t)a3;
- (void)setAssociatedAppBundleIdentifier:(id)a3;
- (void)setContentRole:(int64_t)a3;
- (void)setCountdownState:(id)a3;
- (void)setElementIdentifier:(id)a3;
- (void)setKeyColor:(id)a3;
- (void)setLaunchURL:(id)a3;
- (void)setMaximumLayoutMode:(int64_t)a3;
- (void)setPreferredHeightForBottomSafeArea:(double)a3;
- (void)setPreferredLayoutMode:(int64_t)a3;
- (void)setPresentationBehaviors:(unint64_t)a3;
- (void)setStatusBarStyleOverridesToSuppress:(unint64_t)a3;
- (void)showSavedToPhotosBannerWithPhotosURL:(id)a3 identifier:(id)a4 sessionID:(id)a5;
- (void)startRecording;
- (void)stopButtonTapped;
- (void)updateTimer:(id)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviewsWithTransitionCoordinator:(id)a3;
@end

@implementation RPSystemApertureElementViewController

- (int64_t)activeLayoutMode
{
  v2 = (int64_t *)((char *)self
                        + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_activeLayoutMode);
  swift_beginAccess();
  return *v2;
}

- (void)setActiveLayoutMode:(int64_t)a3
{
  v4 = (int64_t *)((char *)self
                        + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_activeLayoutMode);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (int64_t)contentRole
{
  v2 = (int64_t *)((char *)self
                        + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_contentRole);
  swift_beginAccess();
  return *v2;
}

- (void)setContentRole:(int64_t)a3
{
  v4 = (int64_t *)((char *)self
                        + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_contentRole);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (int64_t)preferredLayoutMode
{
  v2 = (int64_t *)((char *)self
                        + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_preferredLayoutMode);
  swift_beginAccess();
  return *v2;
}

- (void)setPreferredLayoutMode:(int64_t)a3
{
  v4 = (int64_t *)((char *)self
                        + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_preferredLayoutMode);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (int64_t)maximumLayoutMode
{
  v2 = (int64_t *)((char *)self
                        + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_maximumLayoutMode);
  swift_beginAccess();
  return *v2;
}

- (void)setMaximumLayoutMode:(int64_t)a3
{
  v4 = (int64_t *)((char *)self
                        + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_maximumLayoutMode);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (unint64_t)statusBarStyleOverridesToSuppress
{
  v2 = (unint64_t *)((char *)self
                          + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_statusBarStyleOverridesToSuppress);
  swift_beginAccess();
  return *v2;
}

- (void)setStatusBarStyleOverridesToSuppress:(unint64_t)a3
{
  v4 = (unint64_t *)((char *)self
                          + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_statusBarStyleOverridesToSuppress);
  swift_beginAccess();
  unint64_t *v4 = a3;
}

- (double)preferredHeightForBottomSafeArea
{
  v2 = (double *)((char *)self
                + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_preferredHeightForBottomSafeArea);
  swift_beginAccess();
  return *v2;
}

- (void)setPreferredHeightForBottomSafeArea:(double)a3
{
  v4 = (double *)((char *)self
                + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_preferredHeightForBottomSafeArea);
  swift_beginAccess();
  double *v4 = a3;
}

- (unint64_t)presentationBehaviors
{
  v2 = (unint64_t *)((char *)self
                          + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_presentationBehaviors);
  swift_beginAccess();
  return *v2;
}

- (void)setPresentationBehaviors:(unint64_t)a3
{
  v4 = (unint64_t *)((char *)self
                          + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_presentationBehaviors);
  swift_beginAccess();
  unint64_t *v4 = a3;
}

- (NSString)elementIdentifier
{
  return (NSString *)sub_10000D030((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_elementIdentifier);
}

- (void)setElementIdentifier:(id)a3
{
}

- (SBUISystemApertureAccessoryView)leadingView
{
  return (SBUISystemApertureAccessoryView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                    + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_leadingView));
}

- (SBUISystemApertureAccessoryView)trailingView
{
  return (SBUISystemApertureAccessoryView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                    + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_trailingView));
}

- (SBUISystemApertureAccessoryView)minimalView
{
  return (SBUISystemApertureAccessoryView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                    + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_minimalView));
}

- (UIColor)keyColor
{
  return (UIColor *)sub_10000D030((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_keyColor);
}

- (void)setKeyColor:(id)a3
{
}

- (NSString)associatedAppBundleIdentifier
{
  v2 = (char *)self
     + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_associatedAppBundleIdentifier;
  swift_beginAccess();
  if (*((void *)v2 + 1))
  {
    swift_bridgeObjectRetain();
    NSString v3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v3 = 0;
  }

  return (NSString *)v3;
}

- (void)setAssociatedAppBundleIdentifier:(id)a3
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
  v7 = (uint64_t *)((char *)self
                 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_associatedAppBundleIdentifier);
  swift_beginAccess();
  uint64_t *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (NSURL)launchURL
{
  sub_10001D7EC(&qword_100047098);
  __chkstk_darwin();
  uint64_t v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = (char *)self + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_launchURL;
  swift_beginAccess();
  sub_10001EC30((uint64_t)v5, (uint64_t)v4, &qword_100047098);
  uint64_t v6 = type metadata accessor for URL();
  uint64_t v7 = *(void *)(v6 - 8);
  v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v4, 1, v6) != 1)
  {
    URL._bridgeToObjectiveC()(v8);
    v9 = v10;
    (*(void (**)(char *, uint64_t))(v7 + 8))(v4, v6);
  }

  return (NSURL *)v9;
}

- (void)setLaunchURL:(id)a3
{
  sub_10001D7EC(&qword_100047098);
  __chkstk_darwin();
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = type metadata accessor for URL();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 0, 1, v7);
  }
  else
  {
    uint64_t v8 = type metadata accessor for URL();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v6, 1, 1, v8);
  }
  v9 = (char *)self + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_launchURL;
  swift_beginAccess();
  v10 = self;
  sub_10001D830((uint64_t)v6, (uint64_t)v9);
  swift_endAccess();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_10000E2F0();
}

- (void)handleCustomViewLongPressEvent
{
  v2 = self;
  sub_100010AE4();
}

- (void)viewWillLayoutSubviewsWithTransitionCoordinator:(id)a3
{
  swift_unknownObjectRetain();
  uint64_t v5 = self;
  sub_100010EAC(a3);
  swift_unknownObjectRelease();
}

- (void)stopButtonTapped
{
  v2 = self;
  sub_100013F74();
}

- (void)updateTimer:(id)a3
{
}

- (void)showSavedToPhotosBannerWithPhotosURL:(id)a3 identifier:(id)a4 sessionID:(id)a5
{
  uint64_t v6 = type metadata accessor for URL();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v12 = v11;
  uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v15 = v14;
  v16 = self;
  sub_10001638C((unint64_t)v9, v10, v12, v13, v15);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)startRecording
{
  v2 = self;
  sub_100017970();
}

- (void)didTapStopButton
{
  v2 = self;
  sub_1000183B8();
}

- (void)setCountdownState:(id)a3
{
}

- (void)handleCompletionTimeout
{
  v2 = self;
  sub_100018C60();
}

- (void)openPhotos
{
  v2 = self;
  sub_10001A188();
}

- (void)deleteRecording
{
  v2 = self;
  sub_10001AC0C();
}

- (_TtC14ReplayKitAngel37RPSystemApertureElementViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC14ReplayKitAngel37RPSystemApertureElementViewController *)sub_10001BE20(v5, v7, a4);
}

- (_TtC14ReplayKitAngel37RPSystemApertureElementViewController)initWithCoder:(id)a3
{
  return (_TtC14ReplayKitAngel37RPSystemApertureElementViewController *)sub_10001C214(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_elementIdentifier));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_leadingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_trailingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_minimalView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_timerLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_screenRecordingLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_trailingPackageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_leadingPackageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController____lazy_storage___buttonStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController____lazy_storage___viewButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController____lazy_storage___deleteButton));
  sub_10001E2A0((uint64_t)self + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_photosURL, &qword_100047098);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController____lazy_storage___stopButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController____lazy_storage___customViewHeightConstraint[0]));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_customView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_keyColor));
  swift_bridgeObjectRelease();
  sub_10001E2A0((uint64_t)self + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_launchURL, &qword_100047098);
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_completionTimer);
}

@end