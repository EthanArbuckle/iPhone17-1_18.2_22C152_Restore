@interface SmallPlayerCardView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (UIButton)accessibilityCloseButton;
- (UIButton)accessibilityInviteButton;
- (_TtC12GameCenterUI16DynamicTypeLabel)accessibilitySubtitleLabel;
- (_TtC12GameCenterUI16DynamicTypeLabel)accessibilityTitleLabel;
- (_TtC12GameCenterUI19SmallPlayerCardView)initWithCoder:(id)a3;
- (_TtC12GameCenterUI19SmallPlayerCardView)initWithFrame:(CGRect)a3;
- (void)didTapButton;
- (void)didTapCloseButton;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation SmallPlayerCardView

- (_TtC12GameCenterUI19SmallPlayerCardView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI19SmallPlayerCardView *)SmallPlayerCardView.init(frame:)();
}

- (_TtC12GameCenterUI19SmallPlayerCardView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AF3C43E4();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v3 = self;
  sub_1AF3A39CC();
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  sub_1AF3C4DE4();
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  swift_unknownObjectRetain();
  double v6 = self;
  double v7 = sub_1AF3C4E30(a4);
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  swift_unknownObjectRelease();

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.var3 = v17;
  result.var2 = v16;
  result.var1 = v15;
  result.var0 = v14;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1AF3C5208();
}

- (void)didTapCloseButton
{
  v2 = self;
  sub_1AF3C54FC();
}

- (void)didTapButton
{
  v2 = self;
  sub_1AF3C57A4();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  double v6 = self;
  sub_1AF3C584C(a3);
}

- (_TtC12GameCenterUI16DynamicTypeLabel)accessibilityTitleLabel
{
  id v2 = sub_1AF3C5F7C();

  return (_TtC12GameCenterUI16DynamicTypeLabel *)v2;
}

- (_TtC12GameCenterUI16DynamicTypeLabel)accessibilitySubtitleLabel
{
  id v2 = sub_1AF3C5FBC();

  return (_TtC12GameCenterUI16DynamicTypeLabel *)v2;
}

- (UIButton)accessibilityCloseButton
{
  id v2 = SmallPlayerCardView.closeButton.getter();

  return (UIButton *)v2;
}

- (UIButton)accessibilityInviteButton
{
  id v2 = sub_1AF3C6030();

  return (UIButton *)v2;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI19SmallPlayerCardView_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI19SmallPlayerCardView_contentViewBackground));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI19SmallPlayerCardView_closeButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI19SmallPlayerCardView_avatarView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI19SmallPlayerCardView_messagesBadge));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI19SmallPlayerCardView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI19SmallPlayerCardView_subtitleLabel));

  sub_1AF368930(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC12GameCenterUI19SmallPlayerCardView_closeButtonActionBlock));
  sub_1AF368930(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC12GameCenterUI19SmallPlayerCardView_buttonActionBlock));
  sub_1AF3C6A68((uint64_t)self + OBJC_IVAR____TtC12GameCenterUI19SmallPlayerCardView_currentImageFetch);
  double v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12GameCenterUI19SmallPlayerCardView_image);
}

@end