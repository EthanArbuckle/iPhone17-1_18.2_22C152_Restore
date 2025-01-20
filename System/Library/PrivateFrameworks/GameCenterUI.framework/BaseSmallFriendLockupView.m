@interface BaseSmallFriendLockupView
- (BOOL)accessibilityActivate;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC12GameCenterUI16DynamicTypeLabel)accessibilitySubtitleLabel;
- (_TtC12GameCenterUI16DynamicTypeLabel)accessibilityTitleLabel;
- (_TtC12GameCenterUI25BaseSmallFriendLockupView)initWithCoder:(id)a3;
- (_TtC12GameCenterUI25BaseSmallFriendLockupView)initWithFrame:(CGRect)a3;
- (void)didTapAccessoryButton;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation BaseSmallFriendLockupView

- (_TtC12GameCenterUI25BaseSmallFriendLockupView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI25BaseSmallFriendLockupView *)BaseSmallFriendLockupView.init(frame:)();
}

- (_TtC12GameCenterUI25BaseSmallFriendLockupView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AF61BFE0();
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  sub_1AF61CDAC();
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3 = self;
  sub_1AF61CDC8();
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  swift_unknownObjectRetain();
  double v6 = self;
  sub_1AF61CE2C(a4);
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  swift_unknownObjectRelease();

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.var3 = v18;
  result.var2 = v17;
  result.var1 = v16;
  result.var0 = v15;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1AF61CF38();
}

- (BOOL)accessibilityActivate
{
  v2 = self;
  sub_1AF61D428();

  return 1;
}

- (void)didTapAccessoryButton
{
  v2 = self;
  sub_1AF61A5E8();
}

- (_TtC12GameCenterUI16DynamicTypeLabel)accessibilityTitleLabel
{
  id v2 = sub_1AF61A6DC();

  return (_TtC12GameCenterUI16DynamicTypeLabel *)v2;
}

- (_TtC12GameCenterUI16DynamicTypeLabel)accessibilitySubtitleLabel
{
  id v2 = sub_1AF61A6E8();

  return (_TtC12GameCenterUI16DynamicTypeLabel *)v2;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  double v6 = self;
  sub_1AF61D524((uint64_t)a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI25BaseSmallFriendLockupView_avatarView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI25BaseSmallFriendLockupView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI25BaseSmallFriendLockupView_subtitleLabel));
  sub_1AF61DC20(*(id *)((char *)&self->super.super.super.isa
                      + OBJC_IVAR____TtC12GameCenterUI25BaseSmallFriendLockupView_style));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI25BaseSmallFriendLockupView_chevronView));
  sub_1AF3D8594(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC12GameCenterUI25BaseSmallFriendLockupView_trailingViewConfiguration), *(void *)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC12GameCenterUI25BaseSmallFriendLockupView_trailingViewConfiguration), *(uint64_t *)((char *)&self->super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC12GameCenterUI25BaseSmallFriendLockupView_trailingViewConfiguration), *(uint64_t *)((char *)&self->super._constraintsExceptingSubviewAutoresizingConstraints+ OBJC_IVAR____TtC12GameCenterUI25BaseSmallFriendLockupView_trailingViewConfiguration), *(uint64_t *)((char *)&self->super._cachedTraitCollection+ OBJC_IVAR____TtC12GameCenterUI25BaseSmallFriendLockupView_trailingViewConfiguration), *(uint64_t *)((char *)&self->super._swiftAnimationInfo+ OBJC_IVAR____TtC12GameCenterUI25BaseSmallFriendLockupView_trailingViewConfiguration), *((unsigned char *)&self->super._traitChangeRegistry+ OBJC_IVAR____TtC12GameCenterUI25BaseSmallFriendLockupView_trailingViewConfiguration));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI25BaseSmallFriendLockupView_accessoryButton));

  swift_release();
}

@end