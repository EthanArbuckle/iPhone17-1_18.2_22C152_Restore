@interface RecentItemsView
- (_TtC14RecentsAvocado15RecentItemsView)initWithCoder:(id)a3;
- (_TtC14RecentsAvocado15RecentItemsView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation RecentItemsView

- (_TtC14RecentsAvocado15RecentItemsView)initWithFrame:(CGRect)a3
{
  sub_10010FE78(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (_TtC14RecentsAvocado15RecentItemsView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100112698();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1001105E4();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado15RecentItemsView_footerBackgroundViewHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado15RecentItemsView____lazy_storage___backgroundRowContainerStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado15RecentItemsView____lazy_storage___listStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC14RecentsAvocado15RecentItemsView____lazy_storage___footerBackgroundView));
  swift_bridgeObjectRelease();
  sub_1000391D4((uint64_t)self + OBJC_IVAR____TtC14RecentsAvocado15RecentItemsView_delegate);
  swift_bridgeObjectRelease();
}

@end