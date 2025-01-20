@interface AirDropSystemApertureViewController
+ (BOOL)_isSecureForRemoteViewService;
- (BOOL)_canShowWhileLocked;
- (BOOL)preventsInteractiveDismissal;
- (NSString)associatedScenePersistenceIdentifier;
- (NSString)elementIdentifier;
- (SBUISystemApertureAccessoryView)leadingView;
- (SBUISystemApertureAccessoryView)minimalView;
- (SBUISystemApertureAccessoryView)trailingView;
- (UIColor)keyColor;
- (_TtC9AirDropUI35AirDropSystemApertureViewController)initWithCoder:(id)a3;
- (_TtC9AirDropUI35AirDropSystemApertureViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (int64_t)activeLayoutMode;
- (int64_t)contentRole;
- (int64_t)maximumLayoutMode;
- (int64_t)preferredLayoutMode;
- (void)setActiveLayoutMode:(int64_t)a3;
- (void)setContentRole:(int64_t)a3;
- (void)setElementIdentifier:(id)a3;
- (void)setKeyColor:(id)a3;
- (void)setMaximumLayoutMode:(int64_t)a3;
- (void)setPreventsInteractiveDismissal:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviewsWithTransitionCoordinator:(id)a3;
@end

@implementation AirDropSystemApertureViewController

- (int64_t)activeLayoutMode
{
  return *(int64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9AirDropUI35AirDropSystemApertureViewController_activeLayoutMode);
}

- (void)setActiveLayoutMode:(int64_t)a3
{
  v4 = self;
  sub_10006F41C(a3);
}

- (int64_t)contentRole
{
  return *(int64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9AirDropUI35AirDropSystemApertureViewController_contentRole);
}

- (void)setContentRole:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC9AirDropUI35AirDropSystemApertureViewController_contentRole) = (Class)a3;
}

- (int64_t)preferredLayoutMode
{
  if (self->airDropTransferSession[OBJC_IVAR____TtC9AirDropUI35AirDropSystemApertureViewController_overridePreferredLayoutMode] != 1) {
    return *(int64_t *)((char *)&self->super.super.super.isa
  }
                             + OBJC_IVAR____TtC9AirDropUI35AirDropSystemApertureViewController_overridePreferredLayoutMode);
  v2 = self;
  uint64_t v3 = swift_retain();
  int64_t v4 = sub_10006F57C(v3);

  swift_release();
  return v4;
}

- (int64_t)maximumLayoutMode
{
  return *(int64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9AirDropUI35AirDropSystemApertureViewController_maximumLayoutMode);
}

- (void)setMaximumLayoutMode:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC9AirDropUI35AirDropSystemApertureViewController_maximumLayoutMode) = (Class)a3;
}

- (BOOL)preventsInteractiveDismissal
{
  return *((unsigned char *)&self->super.super.super.isa
         + OBJC_IVAR____TtC9AirDropUI35AirDropSystemApertureViewController_preventsInteractiveDismissal);
}

- (void)setPreventsInteractiveDismissal:(BOOL)a3
{
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC9AirDropUI35AirDropSystemApertureViewController_preventsInteractiveDismissal) = a3;
}

- (NSString)elementIdentifier
{
  return (NSString *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                             + OBJC_IVAR____TtC9AirDropUI35AirDropSystemApertureViewController_elementIdentifier));
}

- (void)setElementIdentifier:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9AirDropUI35AirDropSystemApertureViewController_elementIdentifier);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC9AirDropUI35AirDropSystemApertureViewController_elementIdentifier) = (Class)a3;
  id v3 = a3;
}

- (UIColor)keyColor
{
  return (UIColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtC9AirDropUI35AirDropSystemApertureViewController_keyColor));
}

- (void)setKeyColor:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9AirDropUI35AirDropSystemApertureViewController_keyColor);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC9AirDropUI35AirDropSystemApertureViewController_keyColor) = (Class)a3;
  id v3 = a3;
}

- (SBUISystemApertureAccessoryView)leadingView
{
  return (SBUISystemApertureAccessoryView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                    + OBJC_IVAR____TtC9AirDropUI35AirDropSystemApertureViewController_airDropIconView));
}

- (SBUISystemApertureAccessoryView)trailingView
{
  return (SBUISystemApertureAccessoryView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                    + OBJC_IVAR____TtC9AirDropUI35AirDropSystemApertureViewController_progressView));
}

- (SBUISystemApertureAccessoryView)minimalView
{
  return (SBUISystemApertureAccessoryView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                    + OBJC_IVAR____TtC9AirDropUI35AirDropSystemApertureViewController_airDropIconMitosisView));
}

- (NSString)associatedScenePersistenceIdentifier
{
  return (NSString *)0;
}

- (_TtC9AirDropUI35AirDropSystemApertureViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100075D30();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100070E68();
}

- (void)viewWillAppear:(BOOL)a3
{
  id v4 = self;
  sub_10007218C(a3);
}

- (void)viewWillLayoutSubviewsWithTransitionCoordinator:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_10007238C(a3);
  swift_unknownObjectRelease();
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC9AirDropUI35AirDropSystemApertureViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9AirDropUI35AirDropSystemApertureViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9AirDropUI35AirDropSystemApertureViewController_airDropPlatterView));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9AirDropUI35AirDropSystemApertureViewController_airDropIconView));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9AirDropUI35AirDropSystemApertureViewController_progressView));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9AirDropUI35AirDropSystemApertureViewController_airDropIconMitosisView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9AirDropUI35AirDropSystemApertureViewController_elementIdentifier));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9AirDropUI35AirDropSystemApertureViewController_keyColor);
}

@end