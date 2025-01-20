@interface HMHearingAidAudiogramViewController.HearingAidAudiogramFooterView
- (CGSize)intrinsicContentSize;
- (_TtCE21HearingModeSettingsUICSo35HMHearingAidAudiogramViewController29HearingAidAudiogramFooterView)initWithCoder:(id)a3;
- (_TtCE21HearingModeSettingsUICSo35HMHearingAidAudiogramViewController29HearingAidAudiogramFooterView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation HMHearingAidAudiogramViewController.HearingAidAudiogramFooterView

- (CGSize)intrinsicContentSize
{
  v11.receiver = self;
  v11.super_class = (Class)_s29HearingAidAudiogramFooterViewCMa();
  v2 = (char *)v11.receiver;
  [(HMHearingAidAudiogramViewController.HearingAidAudiogramFooterView *)&v11 intrinsicContentSize];
  double v4 = v3;
  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtCE21HearingModeSettingsUICSo35HMHearingAidAudiogramViewController29HearingAidAudiogramFooterView_inLabel], sel_intrinsicContentSize, v11.receiver, v11.super_class);
  double v6 = v5;
  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtCE21HearingModeSettingsUICSo35HMHearingAidAudiogramViewController29HearingAidAudiogramFooterView_button], sel_intrinsicContentSize);
  double v8 = v7;

  double v9 = v6 + v8;
  double v10 = v4;
  result.height = v9;
  result.width = v10;
  return result;
}

- (void)layoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)_s29HearingAidAudiogramFooterViewCMa();
  id v2 = v10.receiver;
  [(HMHearingAidAudiogramViewController.HearingAidAudiogramFooterView *)&v10 layoutSubviews];
  objc_msgSend(v2, sel_frame, v10.receiver, v10.super_class);
  double v4 = v3;
  double v6 = v5;
  objc_msgSend(v2, sel_frame);
  double v8 = v7;
  objc_msgSend(v2, sel_intrinsicContentSize);
  objc_msgSend(v2, sel_setFrame_, v4, v6, v8, v9);
}

- (_TtCE21HearingModeSettingsUICSo35HMHearingAidAudiogramViewController29HearingAidAudiogramFooterView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_2512414D4();
}

- (_TtCE21HearingModeSettingsUICSo35HMHearingAidAudiogramViewController29HearingAidAudiogramFooterView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtCE21HearingModeSettingsUICSo35HMHearingAidAudiogramViewController29HearingAidAudiogramFooterView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCE21HearingModeSettingsUICSo35HMHearingAidAudiogramViewController29HearingAidAudiogramFooterView_inLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtCE21HearingModeSettingsUICSo35HMHearingAidAudiogramViewController29HearingAidAudiogramFooterView_button);
}

@end