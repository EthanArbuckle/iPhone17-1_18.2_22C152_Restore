@interface HUBlurGroupingEffectView
- (HUBlurGroupingEffectView)initWithCoder:(id)a3;
- (HUBlurGroupingEffectView)initWithFrame:(CGRect)a3;
- (void)backgroundEffectAddCaptureDependent:(id)a3 forBackgroundEffectIdentifier:(id)a4;
- (void)backgroundEffectRemoveCaptureDependent:(id)a3 forBackgroundEffectIdentifier:(id)a4;
- (void)layoutSubviews;
@end

@implementation HUBlurGroupingEffectView

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for BlurGroupingEffectView();
  id v2 = v5.receiver;
  [(HUBlurGroupingEffectView *)&v5 layoutSubviews];
  swift_beginAccess();
  id v3 = v2;
  uint64_t v4 = sub_1BE9C36A8();
  sub_1BE3ED1E8(v4, v3);
  swift_bridgeObjectRelease();
}

- (void)backgroundEffectAddCaptureDependent:(id)a3 forBackgroundEffectIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1BE3EC960(v6, v7);
}

- (void)backgroundEffectRemoveCaptureDependent:(id)a3 forBackgroundEffectIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_1BE3ED374(v6, v7);
}

- (HUBlurGroupingEffectView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___HUBlurGroupingEffectView_visualEffectViews) = (Class)MEMORY[0x1E4FBC868];
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for BlurGroupingEffectView();
  return -[HUBlurGroupingEffectView initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (HUBlurGroupingEffectView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___HUBlurGroupingEffectView_visualEffectViews) = (Class)MEMORY[0x1E4FBC868];
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for BlurGroupingEffectView();
  return [(HUBlurGroupingEffectView *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end