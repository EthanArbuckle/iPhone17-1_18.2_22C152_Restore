@interface AvatarView
- (CGRect)jet_focusedFrame;
- (UIColor)backgroundColor;
- (_TtC12GameCenterUI10AvatarView)initWithCoder:(id)a3;
- (_TtC12GameCenterUI10AvatarView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setBackgroundColor:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation AvatarView

- (_TtC12GameCenterUI10AvatarView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI10AvatarView *)AvatarView.init(frame:)();
}

- (_TtC12GameCenterUI10AvatarView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AF60F950();
}

- (UIColor)backgroundColor
{
  v2 = self;
  id v3 = sub_1AF60FBAC();

  return (UIColor *)v3;
}

- (void)setBackgroundColor:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1AF60FC48(a3);
}

- (CGRect)jet_focusedFrame
{
  v2 = self;
  sub_1AF60FCF4();
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1AF60FD0C();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  double v6 = self;
  sub_1AF60FFB0((uint64_t)a3);
}

- (void).cxx_destruct
{
  double v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12GameCenterUI10AvatarView_messagesBadgeView);
}

@end