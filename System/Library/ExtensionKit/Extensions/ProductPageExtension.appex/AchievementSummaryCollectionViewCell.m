@interface AchievementSummaryCollectionViewCell
- (_TtC20ProductPageExtension36AchievementSummaryCollectionViewCell)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension36AchievementSummaryCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)configureBackgroundColor;
- (void)layoutSubviews;
@end

@implementation AchievementSummaryCollectionViewCell

- (_TtC20ProductPageExtension36AchievementSummaryCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension36AchievementSummaryCollectionViewCell *)sub_100201AD4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension36AchievementSummaryCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100202C7C();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100202634();
}

- (void)configureBackgroundColor
{
  v2 = self;
  sub_100202534();
}

- (void).cxx_destruct
{
  sub_1000105B0((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension36AchievementSummaryCollectionViewCell_itemLayoutContext);
  id v3 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension36AchievementSummaryCollectionViewCell_metrics;
  uint64_t v4 = sub_100773C90();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension36AchievementSummaryCollectionViewCell_shadowView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension36AchievementSummaryCollectionViewCell_containerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension36AchievementSummaryCollectionViewCell_achievementGroupView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension36AchievementSummaryCollectionViewCell_numberCompletedLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension36AchievementSummaryCollectionViewCell_outOfTotalLabel));
  v5 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension36AchievementSummaryCollectionViewCell_completedLabel);
}

@end