@interface AchievementSummaryCollectionViewCell
- (_TtC18ASMessagesProvider36AchievementSummaryCollectionViewCell)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider36AchievementSummaryCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)configureBackgroundColor;
- (void)layoutSubviews;
@end

@implementation AchievementSummaryCollectionViewCell

- (_TtC18ASMessagesProvider36AchievementSummaryCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider36AchievementSummaryCollectionViewCell *)sub_26CA6C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider36AchievementSummaryCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_26DC14();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_26D5CC();
}

- (void)configureBackgroundColor
{
  v2 = self;
  sub_26D4CC();
}

- (void).cxx_destruct
{
  sub_411F8((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider36AchievementSummaryCollectionViewCell_itemLayoutContext);
  id v3 = (char *)self + OBJC_IVAR____TtC18ASMessagesProvider36AchievementSummaryCollectionViewCell_metrics;
  uint64_t v4 = sub_775710();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider36AchievementSummaryCollectionViewCell_shadowView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider36AchievementSummaryCollectionViewCell_containerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider36AchievementSummaryCollectionViewCell_achievementGroupView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider36AchievementSummaryCollectionViewCell_numberCompletedLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider36AchievementSummaryCollectionViewCell_outOfTotalLabel));
  v5 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC18ASMessagesProvider36AchievementSummaryCollectionViewCell_completedLabel);
}

@end