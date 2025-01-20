@interface SectionFooterView
- (BOOL)accessibilityAttachmentHasAction;
- (BOOL)accessibilityLabelHasAction;
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (UIEdgeInsets)layoutMargins;
- (_TtC12GameCenterUI16DynamicTypeLabel)accessibilityFooterLabel;
- (_TtC12GameCenterUI17SectionFooterView)initWithCoder:(id)a3;
- (_TtC12GameCenterUI17SectionFooterView)initWithFrame:(CGRect)a3;
- (void)handleTapWithGestureRecognizer:(id)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setLayoutMargins:(UIEdgeInsets)a3;
@end

@implementation SectionFooterView

- (_TtC12GameCenterUI17SectionFooterView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI17SectionFooterView *)sub_1AF70C4C0();
}

- (_TtC12GameCenterUI17SectionFooterView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AF70C854();
}

- (UIEdgeInsets)layoutMargins
{
  v2 = self;
  sub_1AF70CBD8();
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (void)setLayoutMargins:(UIEdgeInsets)a3
{
  double v3 = self;
  sub_1AF70CC88();
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain();
  double v8 = self;
  double v9 = sub_1AF70CD58((uint64_t)a4, width, height);
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  swift_unknownObjectRelease();

  double v16 = v9;
  double v17 = v11;
  double v18 = v13;
  double v19 = v15;
  result.var3 = v19;
  result.var2 = v18;
  result.var1 = v17;
  result.var0 = v16;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1AF70D024();
}

- (void)handleTapWithGestureRecognizer:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_1AF70D45C(v4);
}

- (void)prepareForReuse
{
  v2 = self;
  sub_1AF70D5CC();
}

- (BOOL)accessibilityLabelHasAction
{
  v2 = self;
  BOOL v3 = sub_1AF70F5F4();

  return v3;
}

- (BOOL)accessibilityAttachmentHasAction
{
  v2 = self;
  BOOL v3 = sub_1AF70F6A8();

  return v3;
}

- (_TtC12GameCenterUI16DynamicTypeLabel)accessibilityFooterLabel
{
  id v2 = sub_1AF70F75C();

  return (_TtC12GameCenterUI16DynamicTypeLabel *)v2;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI17SectionFooterView_footerLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI17SectionFooterView_attachmentView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI17SectionFooterView_tapGestureRecognizer));
  sub_1AF36EDB8((uint64_t)self + OBJC_IVAR____TtC12GameCenterUI17SectionFooterView_style);
  sub_1AF395058((uint64_t)self + OBJC_IVAR____TtC12GameCenterUI17SectionFooterView_attachment, &qword_1E9AC36F0);
  sub_1AF368930(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC12GameCenterUI17SectionFooterView_labelTapAction));
  sub_1AF368930(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC12GameCenterUI17SectionFooterView_attachmentTapAction));
  BOOL v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC12GameCenterUI17SectionFooterView_separator);
}

@end