@interface UICollectionView
- (void)_maps_reloadDataWithoutFocus;
@end

@implementation UICollectionView

- (void)_maps_reloadDataWithoutFocus
{
  unsigned __int8 v3 = [(UICollectionView *)self remembersLastFocusedIndexPath];
  [(UICollectionView *)self setRemembersLastFocusedIndexPath:0];
  [(UICollectionView *)self reloadData];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1A33C;
  v4[3] = &unk_72698;
  v4[4] = self;
  unsigned __int8 v5 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

@end