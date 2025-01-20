@interface VideoEffectsViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)shouldBeginTransitionToExpandedContentModule;
- (BOOL)shouldLoadFromSensor;
- (CCUIContentModuleContext)contentModuleContext;
- (NSArray)requiredVisualStyleCategories;
- (_TtC34VideoConferenceControlCenterModule26VideoEffectsViewController)initWithCoder:(id)a3;
- (_TtC34VideoConferenceControlCenterModule26VideoEffectsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (double)compactContinuousCornerRadius;
- (double)preferredExpandedContentHeight;
- (void)buttonDownWithSender:(id)a3;
- (void)buttonTappedWithSender:(id)a3;
- (void)chevronTappedWithSender:(id)a3;
- (void)effectsDidUpdate;
- (void)loadView;
- (void)setCompactContinuousCornerRadius:(double)a3;
- (void)setContentModuleContext:(id)a3;
- (void)setRequiredVisualStyleCategories:(id)a3;
- (void)setShouldLoadFromSensor:(BOOL)a3;
- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4;
- (void)sliderChangedWithSender:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation VideoEffectsViewController

- (BOOL)shouldLoadFromSensor
{
  v2 = (BOOL *)self
     + OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_shouldLoadFromSensor;
  swift_beginAccess();
  return *v2;
}

- (void)setShouldLoadFromSensor:(BOOL)a3
{
  v4 = (BOOL *)self
     + OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_shouldLoadFromSensor;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (CCUIContentModuleContext)contentModuleContext
{
  v2 = (id *)((char *)&self->super.super.super.isa
            + OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_contentModuleContext);
  swift_beginAccess();
  return (CCUIContentModuleContext *)*v2;
}

- (void)setContentModuleContext:(id)a3
{
  v5 = (void **)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_contentModuleContext);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a3;
  id v7 = a3;
  v8 = self;

  sub_36F00();
}

- (double)preferredExpandedContentHeight
{
  v2 = *(double (**)(void))((char *)&stru_248.offset + (swift_isaMask & (uint64_t)self->super.super.super.isa));
  v3 = self;
  double v4 = v2();

  return v4;
}

- (double)compactContinuousCornerRadius
{
  v2 = (double *)((char *)self
                + OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_compactContinuousCornerRadius);
  swift_beginAccess();
  return *v2;
}

- (void)setCompactContinuousCornerRadius:(double)a3
{
  v5 = (double *)((char *)self
                + OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_compactContinuousCornerRadius);
  swift_beginAccess();
  double *v5 = a3;
  v6 = *(uint64_t (**)(void))((char *)&stru_B8.flags + (swift_isaMask & (uint64_t)self->super.super.super.isa));
  id v7 = self;
  v8 = (void *)v6();
  double v9 = *v5;
  if (qword_7DE20 != -1) {
    swift_once();
  }
  [v8 _setContinuousCornerRadius:v9 - *(double *)&qword_7DE28];
}

- (NSArray)requiredVisualStyleCategories
{
  v2 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_requiredVisualStyleCategories);
  swift_beginAccess();
  if (*v2)
  {
    sub_42194(0, &qword_7DAE8);
    swift_bridgeObjectRetain();
    v3.super.isa = sub_4B340().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v3.super.isa = 0;
  }

  return (NSArray *)v3.super.isa;
}

- (void)setRequiredVisualStyleCategories:(id)a3
{
  uint64_t v3 = (uint64_t)a3;
  if (a3)
  {
    sub_42194(0, &qword_7DAE8);
    uint64_t v3 = sub_4B350();
  }
  v5 = (uint64_t *)((char *)self
                 + OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_requiredVisualStyleCategories);
  swift_beginAccess();
  uint64_t *v5 = v3;
  swift_bridgeObjectRelease();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)shouldBeginTransitionToExpandedContentModule
{
  v2 = *(uint64_t (**)(void))((char *)&stru_108.reloff + (swift_isaMask & (uint64_t)self->super.super.super.isa));
  uint64_t v3 = self;
  LOBYTE(v2) = v2();

  return (v2 & 1) == 0;
}

- (void)buttonDownWithSender:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_37414(v4);
}

- (void)buttonTappedWithSender:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_37860(v4);
}

- (void)sliderChangedWithSender:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_37EB4(v4);
}

- (void)chevronTappedWithSender:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_3814C(v4);
}

- (void)loadView
{
  v2 = self;
  sub_3A3C4();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_3A94C();
}

- (void)viewWillAppear:(BOOL)a3
{
  id v4 = self;
  sub_3B878(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v4 = self;
  sub_3BDE8(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  id v4 = self;
  sub_3C248(a3, 0xD000000000000011, 0x800000000005FCC0, (SEL *)&selRef_viewDidAppear_);
}

- (void)viewDidDisappear:(BOOL)a3
{
  id v4 = self;
  sub_3C248(a3, 0xD000000000000014, 0x800000000005FCE0, (SEL *)&selRef_viewDidDisappear_);
}

- (void)viewIsAppearing:(BOOL)a3
{
  id v4 = self;
  sub_3C248(a3, 0xD000000000000013, 0x800000000005FD00, (SEL *)&selRef_viewIsAppearing_);
}

- (_TtC34VideoConferenceControlCenterModule26VideoEffectsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_4B300();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC34VideoConferenceControlCenterModule26VideoEffectsViewController *)sub_3C4EC(v5, v7, a4);
}

- (_TtC34VideoConferenceControlCenterModule26VideoEffectsViewController)initWithCoder:(id)a3
{
  return (_TtC34VideoConferenceControlCenterModule26VideoEffectsViewController *)sub_3C9B4(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_previewViewContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_previewViewContainerHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_videoPreviewView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_containerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_unavailableLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_centerStageButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_portraitButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_studioLightButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_reactionsButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_contentModuleContext));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_videoEffectsManager));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_videoEffectsPreview));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC34VideoConferenceControlCenterModule26VideoEffectsViewController_platterStrokeVisualStylingProvider);
}

- (void)effectsDidUpdate
{
  v2 = self;
  sub_3CFAC();
}

- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4
{
  id v7 = a3;
  id v8 = self;
  sub_3D250(a3, a4);
}

@end