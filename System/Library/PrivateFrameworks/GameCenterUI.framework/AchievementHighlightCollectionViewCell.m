@interface AchievementHighlightCollectionViewCell
- (BOOL)canBecomeFocused;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UILabel)accessibilitySubtitleLabel;
- (UILabel)accessibilityTitleLabel;
- (_TtC12GameCenterUI38AchievementHighlightCollectionViewCell)initWithCoder:(id)a3;
- (_TtC12GameCenterUI38AchievementHighlightCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation AchievementHighlightCollectionViewCell

- (_TtC12GameCenterUI38AchievementHighlightCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI38AchievementHighlightCollectionViewCell *)AchievementHighlightCollectionViewCell.init(frame:)();
}

- (_TtC12GameCenterUI38AchievementHighlightCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AF5B5DEC();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v5 = self;
  CGSize v6 = AchievementHighlightCollectionViewCell.sizeThatFits(_:)((CGSize)__PAIR128__(*(unint64_t *)&height, *(unint64_t *)&width));

  double v7 = v6.width;
  double v8 = v6.height;
  result.CGFloat height = v8;
  result.CGFloat width = v7;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  AchievementHighlightCollectionViewCell.layoutSubviews()();
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (UILabel)accessibilityTitleLabel
{
  id v2 = sub_1AF5B6C54();

  return (UILabel *)v2;
}

- (UILabel)accessibilitySubtitleLabel
{
  id v2 = sub_1AF5B6C94();

  return (UILabel *)v2;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI38AchievementHighlightCollectionViewCell_decorationView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI38AchievementHighlightCollectionViewCell_title));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC12GameCenterUI38AchievementHighlightCollectionViewCell_subtitle);
}

@end