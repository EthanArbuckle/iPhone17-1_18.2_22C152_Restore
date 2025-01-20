@interface EffectControl
- (_TtC34AudioConferenceControlCenterModule13EffectControl)initWithCoder:(id)a3;
- (_TtC34AudioConferenceControlCenterModule13EffectControl)initWithFrame:(CGRect)a3;
- (id)visualStylingProviderForCategory:(int64_t)a3;
- (void)layoutSubviews;
@end

@implementation EffectControl

- (_TtC34AudioConferenceControlCenterModule13EffectControl)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1D4B8();
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for EffectControl();
  v2 = (char *)v4.receiver;
  [(EffectControl *)&v4 layoutSubviews];
  id v3 = *(void **)&v2[OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_backgroundView];
  objc_msgSend(v2, "_continuousCornerRadius", v4.receiver, v4.super_class);
  objc_msgSend(v3, "_setContinuousCornerRadius:");
}

- (_TtC34AudioConferenceControlCenterModule13EffectControl)initWithFrame:(CGRect)a3
{
  result = (_TtC34AudioConferenceControlCenterModule13EffectControl *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_buttonGlyph));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_expandChevron));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_intensityRow));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_continuousSlider));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_descriptionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_backgroundView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_platterFillVisualStylingProvider));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_platterStrokeVisualStylingProvider));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_sliderStylingProvider));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_effectImageView));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_effectTitleLabel);
}

- (id)visualStylingProviderForCategory:(int64_t)a3
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                 + OBJC_IVAR____TtC34AudioConferenceControlCenterModule13EffectControl_platterFillVisualStylingProvider));
}

@end