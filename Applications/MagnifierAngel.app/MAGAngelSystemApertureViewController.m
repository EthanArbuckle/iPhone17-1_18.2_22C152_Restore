@interface MAGAngelSystemApertureViewController
- (BOOL)_canShowWhileLocked;
- (NSString)associatedAppBundleIdentifier;
- (NSString)elementIdentifier;
- (SBUISystemApertureAccessoryView)leadingView;
- (SBUISystemApertureAccessoryView)minimalView;
- (SBUISystemApertureAccessoryView)trailingView;
- (UIColor)keyColor;
- (_TtC14MagnifierAngel36MAGAngelSystemApertureViewController)initWithCoder:(id)a3;
- (_TtC14MagnifierAngel36MAGAngelSystemApertureViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (double)preferredHeightForBottomSafeArea;
- (int64_t)activeLayoutMode;
- (int64_t)contentRole;
- (int64_t)maximumLayoutMode;
- (int64_t)preferredLayoutMode;
- (void)setActiveLayoutMode:(int64_t)a3;
- (void)setAssociatedAppBundleIdentifier:(id)a3;
- (void)setContentRole:(int64_t)a3;
- (void)setElementIdentifier:(id)a3;
- (void)setMaximumLayoutMode:(int64_t)a3;
- (void)setPreferredHeightForBottomSafeArea:(double)a3;
- (void)setPreferredLayoutMode:(int64_t)a3;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation MAGAngelSystemApertureViewController

- (int64_t)activeLayoutMode
{
  return *(int64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_activeLayoutMode);
}

- (void)setActiveLayoutMode:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_activeLayoutMode) = (Class)a3;
}

- (int64_t)contentRole
{
  return *(int64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_contentRole);
}

- (void)setContentRole:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_contentRole) = (Class)a3;
}

- (int64_t)preferredLayoutMode
{
  return *(int64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_preferredLayoutMode);
}

- (void)setPreferredLayoutMode:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_preferredLayoutMode) = (Class)a3;
}

- (int64_t)maximumLayoutMode
{
  return *(int64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_maximumLayoutMode);
}

- (void)setMaximumLayoutMode:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_maximumLayoutMode) = (Class)a3;
}

- (NSString)elementIdentifier
{
  return (NSString *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                             + OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_elementIdentifier));
}

- (void)setElementIdentifier:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_elementIdentifier);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_elementIdentifier) = (Class)a3;
  id v3 = a3;
}

- (NSString)associatedAppBundleIdentifier
{
  if (*(void *)&self->angelPreferences[OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_associatedAppBundleIdentifier])
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
  v6 = (uint64_t *)((char *)self
                 + OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_associatedAppBundleIdentifier);
  uint64_t *v6 = v4;
  v6[1] = v5;

  swift_bridgeObjectRelease();
}

- (double)preferredHeightForBottomSafeArea
{
  return *(double *)((char *)&self->super.super.super.isa
                   + OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_preferredHeightForBottomSafeArea);
}

- (void)setPreferredHeightForBottomSafeArea:(double)a3
{
  *(double *)((char *)&self->super.super.super.isa
            + OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_preferredHeightForBottomSafeArea) = a3;
}

- (SBUISystemApertureAccessoryView)leadingView
{
  return (SBUISystemApertureAccessoryView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                    + OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_leadingView));
}

- (SBUISystemApertureAccessoryView)trailingView
{
  return (SBUISystemApertureAccessoryView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                    + OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_trailingView));
}

- (SBUISystemApertureAccessoryView)minimalView
{
  return (SBUISystemApertureAccessoryView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                    + OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_minimalView));
}

- (UIColor)keyColor
{
  return (UIColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_keyColor));
}

- (void)viewDidLoad
{
  NSString v2 = self;
  sub_1000236BC();
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain();
  v8 = self;
  sub_100024D18(a4, width, height);
  swift_unknownObjectRelease();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC14MagnifierAngel36MAGAngelSystemApertureViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC14MagnifierAngel36MAGAngelSystemApertureViewController *)sub_10002518C(v5, v7, a4);
}

- (_TtC14MagnifierAngel36MAGAngelSystemApertureViewController)initWithCoder:(id)a3
{
  return (_TtC14MagnifierAngel36MAGAngelSystemApertureViewController *)sub_1000254B0(a3);
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_elementIdentifier));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_leadingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_trailingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_minimalView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_leadingCustomView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_trailingCustomView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_magAngelLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_magAngelSubtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_stopButton));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_keyColor);
}

@end