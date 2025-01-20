@interface UICollectionViewCell
- (void)_maps_setCollectionViewCellBackgroundConfiguration;
@end

@implementation UICollectionViewCell

- (void)_maps_setCollectionViewCellBackgroundConfiguration
{
  objc_initWeak(&location, self);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1A03C;
  v3[3] = &unk_72670;
  objc_copyWeak(&v4, &location);
  [(UICollectionViewCell *)self _setBackgroundViewConfigurationProvider:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

@end