@interface CompoundScrollObserver
- (_TtC19AppStoreKitInternal22CompoundScrollObserver)init;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDecelerating:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
@end

@implementation CompoundScrollObserver

- (void)scrollViewDidScroll:(id)a3
{
  v4 = (UIScrollView *)a3;
  v5 = self;
  CompoundScrollObserver.scrollViewDidScroll(_:)(v4);
}

- (_TtC19AppStoreKitInternal22CompoundScrollObserver)init
{
  result = (_TtC19AppStoreKitInternal22CompoundScrollObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

- (void)scrollViewWillBeginDecelerating:(id)a3
{
  v4 = (UIScrollView *)a3;
  v5 = self;
  CompoundScrollObserver.scrollViewWillBeginDecelerating(_:)(v4);
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  v4 = (UIScrollView *)a3;
  v5 = self;
  CompoundScrollObserver.scrollViewDidEndDecelerating(_:)(v4);
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  v6 = (UIScrollView *)a3;
  v7 = self;
  CompoundScrollObserver.scrollViewDidEndDragging(_:willDecelerate:)(v6, a4);
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  v4 = (UIScrollView *)a3;
  v5 = self;
  CompoundScrollObserver.scrollViewWillBeginDragging(_:)(v4);
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y = a4.y;
  double x = a4.x;
  id v9 = a3;
  v10 = self;
  CompoundScrollObserver.scrollViewWillEndDragging(_:withVelocity:targetContentOffset:)((uint64_t)v9, (uint64_t)a5, x, y);
}

@end