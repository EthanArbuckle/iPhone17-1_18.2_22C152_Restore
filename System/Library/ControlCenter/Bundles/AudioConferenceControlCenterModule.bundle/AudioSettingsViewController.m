@interface AudioSettingsViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)shouldBeginTransitionToExpandedContentModule;
- (BOOL)shouldLoadFromSensor;
- (CCUIContentModuleContext)contentModuleContext;
- (_TtC34AudioConferenceControlCenterModule27AudioSettingsViewController)initWithCoder:(id)a3;
- (_TtC34AudioConferenceControlCenterModule27AudioSettingsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (double)compactContinuousCornerRadius;
- (double)preferredExpandedContentHeight;
- (void)buttonDownWithSender:(id)a3;
- (void)buttonTappedWithSender:(id)a3;
- (void)displayLinkUpdate:(id)a3;
- (void)effectsDidUpdate;
- (void)loadView;
- (void)setCompactContinuousCornerRadius:(double)a3;
- (void)setContentModuleContext:(id)a3;
- (void)setShouldLoadFromSensor:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation AudioSettingsViewController

- (BOOL)shouldLoadFromSensor
{
  v2 = (BOOL *)self
     + OBJC_IVAR____TtC34AudioConferenceControlCenterModule27AudioSettingsViewController_shouldLoadFromSensor;
  swift_beginAccess();
  return *v2;
}

- (void)setShouldLoadFromSensor:(BOOL)a3
{
  v4 = (BOOL *)self
     + OBJC_IVAR____TtC34AudioConferenceControlCenterModule27AudioSettingsViewController_shouldLoadFromSensor;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (CCUIContentModuleContext)contentModuleContext
{
  v2 = (id *)((char *)&self->super.super.super.isa
            + OBJC_IVAR____TtC34AudioConferenceControlCenterModule27AudioSettingsViewController_contentModuleContext);
  swift_beginAccess();
  return (CCUIContentModuleContext *)*v2;
}

- (void)setContentModuleContext:(id)a3
{
  v5 = (void **)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC34AudioConferenceControlCenterModule27AudioSettingsViewController_contentModuleContext);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a3;
  id v7 = a3;
  v8 = self;

  sub_E8B8();
}

- (double)preferredExpandedContentHeight
{
  uint64_t v2 = qword_318A0;
  v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  double v4 = *(double *)&qword_318A8;
  if (qword_31880 != -1) {
    swift_once();
  }
  double v5 = *(double *)&qword_31888;
  if (qword_31870 != -1) {
    swift_once();
  }
  double v6 = v4 * 4.0 + v5 * 3.0 + 0.0;
  double v7 = *(double *)&qword_31878;

  return v6 + v7 + v7;
}

- (double)compactContinuousCornerRadius
{
  uint64_t v2 = (double *)((char *)self
                + OBJC_IVAR____TtC34AudioConferenceControlCenterModule27AudioSettingsViewController_compactContinuousCornerRadius);
  swift_beginAccess();
  return *v2;
}

- (void)setCompactContinuousCornerRadius:(double)a3
{
  double v5 = (double *)((char *)self
                + OBJC_IVAR____TtC34AudioConferenceControlCenterModule27AudioSettingsViewController_compactContinuousCornerRadius);
  swift_beginAccess();
  *double v5 = a3;
  double v6 = *(uint64_t (**)(void))&stru_B8.sectname[swift_isaMask & (uint64_t)self->super.super.super.isa];
  double v7 = self;
  uint64_t v8 = v6();
  if (v8)
  {
    v9 = (_TtC34AudioConferenceControlCenterModule27AudioSettingsViewController *)v8;
    double v10 = *v5;
    if (qword_31870 != -1) {
      swift_once();
    }
    [(AudioSettingsViewController *)v9 _setContinuousCornerRadius:v10 - *(double *)&qword_31878];

    double v7 = v9;
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)shouldBeginTransitionToExpandedContentModule
{
  uint64_t v2 = *(uint64_t (**)(void))((char *)&stru_B8.offset + (swift_isaMask & (uint64_t)self->super.super.super.isa));
  v3 = self;
  LOBYTE(v2) = v2();

  return (v2 & 1) == 0;
}

- (void)loadView
{
  uint64_t v2 = self;
  sub_EF00();
}

- (void)viewDidLoad
{
  uint64_t v2 = self;
  sub_F3B8();
}

- (void)buttonDownWithSender:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_10144(v4);
}

- (void)buttonTappedWithSender:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_10590(v4);
}

- (void)viewWillLayoutSubviews
{
  uint64_t v2 = self;
  sub_128F8();
}

- (void)viewWillAppear:(BOOL)a3
{
  id v4 = self;
  sub_12E98(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v4 = self;
  sub_130D4(a3);
}

- (void)displayLinkUpdate:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_16BB8();
}

- (_TtC34AudioConferenceControlCenterModule27AudioSettingsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_1E340();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC34AudioConferenceControlCenterModule27AudioSettingsViewController *)sub_14310(v5, v7, a4);
}

- (_TtC34AudioConferenceControlCenterModule27AudioSettingsViewController)initWithCoder:(id)a3
{
  return (_TtC34AudioConferenceControlCenterModule27AudioSettingsViewController *)sub_14668(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC34AudioConferenceControlCenterModule27AudioSettingsViewController_previewView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC34AudioConferenceControlCenterModule27AudioSettingsViewController_displayLink));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC34AudioConferenceControlCenterModule27AudioSettingsViewController_containerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC34AudioConferenceControlCenterModule27AudioSettingsViewController_standardButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC34AudioConferenceControlCenterModule27AudioSettingsViewController_voiceIsolationButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC34AudioConferenceControlCenterModule27AudioSettingsViewController_wideSpectrumButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC34AudioConferenceControlCenterModule27AudioSettingsViewController_autoButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC34AudioConferenceControlCenterModule27AudioSettingsViewController_unavailableLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC34AudioConferenceControlCenterModule27AudioSettingsViewController_contentModuleContext));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC34AudioConferenceControlCenterModule27AudioSettingsViewController_audioEffectsManager));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC34AudioConferenceControlCenterModule27AudioSettingsViewController_platterStrokeVisualStylingProvider);
}

- (void)effectsDidUpdate
{
  uint64_t v2 = self;
  sub_14A78();
}

@end