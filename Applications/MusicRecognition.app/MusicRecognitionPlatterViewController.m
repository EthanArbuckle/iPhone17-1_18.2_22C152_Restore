@interface MusicRecognitionPlatterViewController
- (BOOL)_canShowWhileLocked;
- (SBUISystemApertureAccessoryView)leadingView;
- (SBUISystemApertureAccessoryView)minimalView;
- (SBUISystemApertureAccessoryView)trailingView;
- (UIColor)keyColor;
- (_TtC16MusicRecognition37MusicRecognitionPlatterViewController)initWithCoder:(id)a3;
- (_TtC16MusicRecognition37MusicRecognitionPlatterViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (int64_t)activeLayoutMode;
- (int64_t)contentRole;
- (int64_t)maximumLayoutMode;
- (int64_t)preferredLayoutMode;
- (unint64_t)presentationBehaviors;
- (void)dealloc;
- (void)receivedWithSpectralOutput:(id)a3;
- (void)setActiveLayoutMode:(int64_t)a3;
- (void)setContentRole:(int64_t)a3;
- (void)setKeyColor:(id)a3;
- (void)setMaximumLayoutMode:(int64_t)a3;
- (void)setPreferredLayoutMode:(int64_t)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviewsWithTransitionCoordinator:(id)a3;
@end

@implementation MusicRecognitionPlatterViewController

- (int64_t)activeLayoutMode
{
  return *(int64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC16MusicRecognition37MusicRecognitionPlatterViewController_activeLayoutMode);
}

- (void)setActiveLayoutMode:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicRecognition37MusicRecognitionPlatterViewController_activeLayoutMode) = (Class)a3;
}

- (UIColor)keyColor
{
  return (UIColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtC16MusicRecognition37MusicRecognitionPlatterViewController_keyColor));
}

- (void)setKeyColor:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MusicRecognition37MusicRecognitionPlatterViewController_keyColor);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicRecognition37MusicRecognitionPlatterViewController_keyColor) = (Class)a3;
  id v3 = a3;
}

- (int64_t)contentRole
{
  return *(int64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC16MusicRecognition37MusicRecognitionPlatterViewController_contentRole);
}

- (void)setContentRole:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicRecognition37MusicRecognitionPlatterViewController_contentRole) = (Class)a3;
}

- (int64_t)preferredLayoutMode
{
  return *(int64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC16MusicRecognition37MusicRecognitionPlatterViewController_preferredLayoutMode);
}

- (void)setPreferredLayoutMode:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicRecognition37MusicRecognitionPlatterViewController_preferredLayoutMode) = (Class)a3;
}

- (int64_t)maximumLayoutMode
{
  return *(int64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC16MusicRecognition37MusicRecognitionPlatterViewController_maximumLayoutMode);
}

- (void)setMaximumLayoutMode:(int64_t)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MusicRecognition37MusicRecognitionPlatterViewController_maximumLayoutMode) = (Class)a3;
}

- (SBUISystemApertureAccessoryView)leadingView
{
  return (SBUISystemApertureAccessoryView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                    + OBJC_IVAR____TtC16MusicRecognition37MusicRecognitionPlatterViewController_listeningAccessoryView));
}

- (SBUISystemApertureAccessoryView)trailingView
{
  return (SBUISystemApertureAccessoryView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                    + OBJC_IVAR____TtC16MusicRecognition37MusicRecognitionPlatterViewController_waveformAccessoryView));
}

- (SBUISystemApertureAccessoryView)minimalView
{
  return (SBUISystemApertureAccessoryView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                    + OBJC_IVAR____TtC16MusicRecognition37MusicRecognitionPlatterViewController_minimalAccessoryView));
}

- (unint64_t)presentationBehaviors
{
  return 24;
}

- (void)dealloc
{
  v2 = self;
  sub_100010DF8();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicRecognition37MusicRecognitionPlatterViewController_listeningAccessoryView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicRecognition37MusicRecognitionPlatterViewController_waveformAccessoryView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicRecognition37MusicRecognitionPlatterViewController_minimalAccessoryView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicRecognition37MusicRecognitionPlatterViewController_matchingFlowView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicRecognition37MusicRecognitionPlatterViewController_keyColor));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicRecognition37MusicRecognitionPlatterViewController_assertionTimer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicRecognition37MusicRecognitionPlatterViewController____lazy_storage___customLayoutHeightConstraint));

  swift_bridgeObjectRelease();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100011098();
}

- (void)viewWillAppear:(BOOL)a3
{
  id v4 = self;
  sub_1000115E0(a3);
}

- (void)viewWillLayoutSubviewsWithTransitionCoordinator:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_1000127AC(a3);

  swift_unknownObjectRelease();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC16MusicRecognition37MusicRecognitionPlatterViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC16MusicRecognition37MusicRecognitionPlatterViewController *)sub_100012A9C(v5, v7, a4);
}

- (_TtC16MusicRecognition37MusicRecognitionPlatterViewController)initWithCoder:(id)a3
{
  return (_TtC16MusicRecognition37MusicRecognitionPlatterViewController *)sub_100012D9C(a3);
}

- (void)receivedWithSpectralOutput:(id)a3
{
  uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = self;
  sub_10001304C(v4);

  swift_bridgeObjectRelease();
}

@end