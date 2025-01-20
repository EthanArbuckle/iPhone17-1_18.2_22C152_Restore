@interface CaptureSelfieView
- (UILabel)coachingPrompt;
- (UILabel)nagPrompt;
- (_TtC18CoreIDVRGBLiveness17CaptureSelfieView)initWithCoder:(id)a3;
- (_TtC18CoreIDVRGBLiveness17CaptureSelfieView)initWithFrame:(CGRect)a3;
- (void)setCoachingPromptText:(id)a3;
@end

@implementation CaptureSelfieView

- (UILabel)nagPrompt
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtC18CoreIDVRGBLiveness17CaptureSelfieView_nagPrompt));
}

- (UILabel)coachingPrompt
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR____TtC18CoreIDVRGBLiveness17CaptureSelfieView_coachingPrompt));
}

- (_TtC18CoreIDVRGBLiveness17CaptureSelfieView)initWithCoder:(id)a3
{
  id v3 = a3;
  return (_TtC18CoreIDVRGBLiveness17CaptureSelfieView *)sub_21EDFACFC();
}

- (void)setCoachingPromptText:(id)a3
{
  if (a3)
  {
    sub_21EE9AE68();
    uint64_t v5 = v4;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = self;
  v7 = [(CaptureSelfieView *)v6 coachingPrompt];
  if (v5) {
    v8 = (void *)sub_21EE9AE28();
  }
  else {
    v8 = 0;
  }
  [(UILabel *)v7 setText:v8];

  objc_msgSend(*(id *)((char *)&v6->super.super.super.isa+ OBJC_IVAR____TtC18CoreIDVRGBLiveness17CaptureSelfieView_coachingPromptScrollView), sel_setContentOffset_, 0.0, 0.0);

  swift_bridgeObjectRelease();
}

- (_TtC18CoreIDVRGBLiveness17CaptureSelfieView)initWithFrame:(CGRect)a3
{
  result = (_TtC18CoreIDVRGBLiveness17CaptureSelfieView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  memcpy(v3, (char *)self + OBJC_IVAR____TtC18CoreIDVRGBLiveness17CaptureSelfieView_captureConfig, sizeof(v3));
  sub_21EDFBC04((uint64_t)v3);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18CoreIDVRGBLiveness17CaptureSelfieView_cameraFeed));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18CoreIDVRGBLiveness17CaptureSelfieView_topContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18CoreIDVRGBLiveness17CaptureSelfieView_bottomContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18CoreIDVRGBLiveness17CaptureSelfieView_blurView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18CoreIDVRGBLiveness17CaptureSelfieView_coachingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18CoreIDVRGBLiveness17CaptureSelfieView_nagContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18CoreIDVRGBLiveness17CaptureSelfieView_nagPrompt));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18CoreIDVRGBLiveness17CaptureSelfieView_selfieView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18CoreIDVRGBLiveness17CaptureSelfieView_livenessButtonContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18CoreIDVRGBLiveness17CaptureSelfieView_coachingPromptScrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18CoreIDVRGBLiveness17CaptureSelfieView_coachingPromptContainer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18CoreIDVRGBLiveness17CaptureSelfieView_coachingPrompt));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18CoreIDVRGBLiveness17CaptureSelfieView_axOptionsPrompt));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18CoreIDVRGBLiveness17CaptureSelfieView_expandButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18CoreIDVRGBLiveness17CaptureSelfieView_livenessPrimaryButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18CoreIDVRGBLiveness17CaptureSelfieView_livenessSecondaryButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18CoreIDVRGBLiveness17CaptureSelfieView_inlineStepUpView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18CoreIDVRGBLiveness17CaptureSelfieView_coachingPromptBottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18CoreIDVRGBLiveness17CaptureSelfieView_axOptionsPromptBottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18CoreIDVRGBLiveness17CaptureSelfieView_topContainerLivenessHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18CoreIDVRGBLiveness17CaptureSelfieView_bottomContainerSelfieHeightConstraint));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18CoreIDVRGBLiveness17CaptureSelfieView_coachingViewCenterYConstraintLarge));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18CoreIDVRGBLiveness17CaptureSelfieView_coachingViewCenterYConstraintSmall));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18CoreIDVRGBLiveness17CaptureSelfieView_coachingViewWidthConstraintLarge));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18CoreIDVRGBLiveness17CaptureSelfieView_coachingViewWidthConstraintSmall));
  sub_21EDFBD10(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC18CoreIDVRGBLiveness17CaptureSelfieView_onExpandButtonTapped));
  sub_21EDFBD10(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC18CoreIDVRGBLiveness17CaptureSelfieView_onLivenessPrimaryButtonTapped));
  sub_21EDFBD10(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC18CoreIDVRGBLiveness17CaptureSelfieView_onLivenessSecondaryButtonTapped));
}

@end