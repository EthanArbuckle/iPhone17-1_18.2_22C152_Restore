@interface TitleWithHighlightsCollectionViewCell
- (BOOL)canBecomeFocused;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC12GameCenterUI37TitleWithHighlightsCollectionViewCell)initWithCoder:(id)a3;
- (_TtC12GameCenterUI37TitleWithHighlightsCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation TitleWithHighlightsCollectionViewCell

- (_TtC12GameCenterUI37TitleWithHighlightsCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI37TitleWithHighlightsCollectionViewCell *)TitleWithHighlightsCollectionViewCell.init(frame:)();
}

- (_TtC12GameCenterUI37TitleWithHighlightsCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AF5C246C();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v5 = self;
  CGSize v6 = TitleWithHighlightsCollectionViewCell.sizeThatFits(_:)((CGSize)__PAIR128__(*(unint64_t *)&height, *(unint64_t *)&width));

  double v7 = v6.width;
  double v8 = v6.height;
  result.CGFloat height = v8;
  result.CGFloat width = v7;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  TitleWithHighlightsCollectionViewCell.layoutSubviews()();
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI37TitleWithHighlightsCollectionViewCell_title));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC12GameCenterUI37TitleWithHighlightsCollectionViewCell_separator);
}

@end