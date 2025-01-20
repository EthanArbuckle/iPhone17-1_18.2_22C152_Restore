@interface ProfileAvatarView
- (BOOL)accessibilityIsEditable;
- (UIView)accessibilityRoundedEditButton;
- (UIVisualEffectView)accessibilityProfileEditButtonBackground;
- (_TtC12GameCenterUI16DynamicTypeLabel)accessibilityProfileEditLabel;
- (_TtC12GameCenterUI17ProfileAvatarView)initWithCoder:(id)a3;
- (_TtC12GameCenterUI17ProfileAvatarView)initWithFrame:(CGRect)a3;
- (void)didTap;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation ProfileAvatarView

- (_TtC12GameCenterUI17ProfileAvatarView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI17ProfileAvatarView *)ProfileAvatarView.init(frame:)();
}

- (_TtC12GameCenterUI17ProfileAvatarView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AF401F08();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1AF40266C();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1AF402AA0((uint64_t)a3);
}

- (void)didTap
{
  v2 = self;
  sub_1AF402B64();
}

- (BOOL)accessibilityIsEditable
{
  return sub_1AF4021B0() & 1;
}

- (UIVisualEffectView)accessibilityProfileEditButtonBackground
{
  id v2 = sub_1AF402E08();

  return (UIVisualEffectView *)v2;
}

- (UIView)accessibilityRoundedEditButton
{
  id v2 = sub_1AF402E48();

  return (UIView *)v2;
}

- (_TtC12GameCenterUI16DynamicTypeLabel)accessibilityProfileEditLabel
{
  id v2 = sub_1AF402E88();

  return (_TtC12GameCenterUI16DynamicTypeLabel *)v2;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI17ProfileAvatarView_profileEditButtonBackground));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI17ProfileAvatarView_profileEditLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI17ProfileAvatarView_roundedEditButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI17ProfileAvatarView_tapGestureRecognizer));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC12GameCenterUI17ProfileAvatarView_tapHandler);

  sub_1AF368930(v3);
}

@end