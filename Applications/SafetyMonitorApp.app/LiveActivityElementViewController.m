@interface LiveActivityElementViewController
- (BOOL)_canShowWhileLocked;
- (NSString)associatedAppBundleIdentifier;
- (NSString)associatedScenePersistenceIdentifier;
- (NSURL)launchURL;
- (SBUISystemApertureAccessoryView)leadingView;
- (SBUISystemApertureAccessoryView)minimalView;
- (SBUISystemApertureAccessoryView)trailingView;
- (_TtC16SafetyMonitorApp33LiveActivityElementViewController)initWithCoder:(id)a3;
- (_TtC16SafetyMonitorApp33LiveActivityElementViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (double)preferredHeightForBottomSafeArea;
- (int64_t)activeLayoutMode;
- (int64_t)contentRole;
- (int64_t)maximumLayoutMode;
- (int64_t)preferredLayoutMode;
- (void)setActiveLayoutMode:(int64_t)a3;
- (void)setAssociatedAppBundleIdentifier:(id)a3;
- (void)setAssociatedScenePersistenceIdentifier:(id)a3;
- (void)setContentRole:(int64_t)a3;
- (void)setMaximumLayoutMode:(int64_t)a3;
- (void)setPreferredHeightForBottomSafeArea:(double)a3;
- (void)setPreferredLayoutMode:(int64_t)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviewsWithTransitionCoordinator:(id)a3;
@end

@implementation LiveActivityElementViewController

- (int64_t)activeLayoutMode
{
  return *(int64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_activeLayoutMode);
}

- (void)setActiveLayoutMode:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_activeLayoutMode) = (Class)a3;
}

- (int64_t)contentRole
{
  return *(int64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_contentRole);
}

- (void)setContentRole:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_contentRole) = (Class)a3;
}

- (int64_t)preferredLayoutMode
{
  return *(int64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_preferredLayoutMode);
}

- (void)setPreferredLayoutMode:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_preferredLayoutMode) = (Class)a3;
}

- (int64_t)maximumLayoutMode
{
  return *(int64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_maximumLayoutMode);
}

- (void)setMaximumLayoutMode:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_maximumLayoutMode) = (Class)a3;
}

- (double)preferredHeightForBottomSafeArea
{
  return *(double *)((char *)&self->super.super.super.isa
                   + OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_preferredHeightForBottomSafeArea);
}

- (void)setPreferredHeightForBottomSafeArea:(double)a3
{
  *(double *)((char *)&self->super.super.super.isa
            + OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_preferredHeightForBottomSafeArea) = a3;
}

- (NSString)associatedScenePersistenceIdentifier
{
  return (NSString *)sub_100002A3C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_associatedScenePersistenceIdentifier);
}

- (void)setAssociatedScenePersistenceIdentifier:(id)a3
{
}

- (NSString)associatedAppBundleIdentifier
{
  return (NSString *)sub_100002A3C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_associatedAppBundleIdentifier);
}

- (void)setAssociatedAppBundleIdentifier:(id)a3
{
}

- (NSURL)launchURL
{
  uint64_t v3 = sub_1000082B8(&qword_10001A008);
  __chkstk_darwin(v3 - 8, v4);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  sub_100002C38((uint64_t)v6);

  uint64_t v8 = type metadata accessor for URL();
  uint64_t v9 = *(void *)(v8 - 8);
  v11 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v6, 1, v8) != 1)
  {
    URL._bridgeToObjectiveC()(v10);
    v11 = v12;
    (*(void (**)(char *, uint64_t))(v9 + 8))(v6, v8);
  }

  return (NSURL *)v11;
}

- (SBUISystemApertureAccessoryView)leadingView
{
  return (SBUISystemApertureAccessoryView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                    + OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_leadingView));
}

- (SBUISystemApertureAccessoryView)trailingView
{
  return (SBUISystemApertureAccessoryView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                    + OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_trailingView));
}

- (SBUISystemApertureAccessoryView)minimalView
{
  return (SBUISystemApertureAccessoryView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                    + OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_minimalView));
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100003688();
}

- (void)viewWillLayoutSubviewsWithTransitionCoordinator:(id)a3
{
  swift_unknownObjectRetain();
  uint64_t v5 = self;
  sub_1000040F8(a3);
  swift_unknownObjectRelease();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC16SafetyMonitorApp33LiveActivityElementViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC16SafetyMonitorApp33LiveActivityElementViewController *)sub_100007BA8(v5, v7, a4);
}

- (_TtC16SafetyMonitorApp33LiveActivityElementViewController)initWithCoder:(id)a3
{
  return (_TtC16SafetyMonitorApp33LiveActivityElementViewController *)sub_100007E24(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_expandedController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_avatarView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_leadingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_trailingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_minimalView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_trailingGlyph));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16SafetyMonitorApp33LiveActivityElementViewController_minimalGlyph));

  swift_bridgeObjectRelease();
}

@end