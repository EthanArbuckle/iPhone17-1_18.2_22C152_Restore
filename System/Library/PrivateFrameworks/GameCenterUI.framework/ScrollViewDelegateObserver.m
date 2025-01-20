@interface ScrollViewDelegateObserver
- (_TtC12GameCenterUI26ScrollViewDelegateObserver)init;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDecelerating:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
@end

@implementation ScrollViewDelegateObserver

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AF6645C8();
}

- (void)scrollViewWillBeginDecelerating:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AF66465C();
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AF6646F0();
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  id v5 = a3;
  v6 = self;
  sub_1AF664784();
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1AF664820();
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y = a4.y;
  double x = a4.x;
  id v9 = a3;
  v10 = self;
  sub_1AF6648B4((uint64_t)v9, (uint64_t)a5, x, y);
}

- (_TtC12GameCenterUI26ScrollViewDelegateObserver)init
{
  return (_TtC12GameCenterUI26ScrollViewDelegateObserver *)sub_1AF664968();
}

- (void).cxx_destruct
{
}

@end