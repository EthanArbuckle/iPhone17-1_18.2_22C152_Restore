@interface BaseCalendarViewController
- (_TtC8HealthUI26BaseCalendarViewController)initWithCoder:(id)a3;
- (_TtC8HealthUI26BaseCalendarViewController)initWithCollectionViewLayout:(id)a3;
- (_TtC8HealthUI26BaseCalendarViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidEndScrollingAnimation:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
@end

@implementation BaseCalendarViewController

- (_TtC8HealthUI26BaseCalendarViewController)initWithCollectionViewLayout:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8HealthUI26BaseCalendarViewController_collectionViewDataSource) = 0;
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC8HealthUI26BaseCalendarViewController_isYearOverlayVisible) = 0;
  v4 = (char *)self + OBJC_IVAR____TtC8HealthUI26BaseCalendarViewController_decelerationTargetContentOffset;
  *(void *)v4 = 0;
  *((void *)v4 + 1) = 0;
  v4[16] = 1;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8HealthUI26BaseCalendarViewController____lazy_storage___yearOverlay) = (Class)1;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for BaseCalendarViewController();
  return [(BaseCalendarViewController *)&v6 initWithCollectionViewLayout:a3];
}

- (_TtC8HealthUI26BaseCalendarViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_1E0ECD1D0();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC8HealthUI26BaseCalendarViewController *)BaseCalendarViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC8HealthUI26BaseCalendarViewController)initWithCoder:(id)a3
{
  return (_TtC8HealthUI26BaseCalendarViewController *)BaseCalendarViewController.init(coder:)(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8HealthUI26BaseCalendarViewController_collectionViewDataSource));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8HealthUI26BaseCalendarViewController____lazy_storage___yearOverlay);
  sub_1E0DFF84C(v3);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  BaseCalendarViewController.updateYearOverlay()();
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4 = (char *)self + OBJC_IVAR____TtC8HealthUI26BaseCalendarViewController_decelerationTargetContentOffset;
  *(void *)id v4 = 0;
  *((void *)v4 + 1) = 0;
  v4[16] = 1;
  id v5 = a3;
  uint64_t v6 = self;
  BaseCalendarViewController.updateYearOverlay()();
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  CGFloat x = a5->x;
  CGFloat y = a5->y;
  id v8 = a3;
  v9 = self;
  BaseCalendarViewController.updateYearOverlayForScrollViewWillEndDragging(targetContentOffset:)((CGPoint)__PAIR128__(*(unint64_t *)&y, *(unint64_t *)&x));
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  sub_1E0DFF170(a4);
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1E0DFF340("[%{public}s] scrollViewDidEndScrollingAnimation: resuming data fetching");
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1E0DFF340("[%{public}s] scrollViewDidEndDecelerating: resuming data fetching");
}

@end