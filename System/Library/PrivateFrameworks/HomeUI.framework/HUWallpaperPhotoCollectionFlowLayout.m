@interface HUWallpaperPhotoCollectionFlowLayout
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (HUWallpaperPhotoCollectionFlowLayout)initWithAssetCollectionSubtype:(int64_t)a3;
- (int64_t)assetCollectionSubtype;
- (void)prepareLayout;
@end

@implementation HUWallpaperPhotoCollectionFlowLayout

- (HUWallpaperPhotoCollectionFlowLayout)initWithAssetCollectionSubtype:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HUWallpaperPhotoCollectionFlowLayout;
  v4 = [(UICollectionViewFlowLayout *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_assetCollectionSubtype = a3;
    [(UICollectionViewFlowLayout *)v4 setMinimumInteritemSpacing:1.0];
  }
  return v5;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  return 1;
}

- (void)prepareLayout
{
  v13.receiver = self;
  v13.super_class = (Class)HUWallpaperPhotoCollectionFlowLayout;
  [(UICollectionViewFlowLayout *)&v13 prepareLayout];
  v3 = [(HUWallpaperPhotoCollectionFlowLayout *)self collectionView];
  [v3 bounds];
  double v5 = v4;
  [(UICollectionViewFlowLayout *)self minimumInteritemSpacing];
  double v7 = (v5 + v6 * -3.0) * 0.25;

  int64_t v8 = [(HUWallpaperPhotoCollectionFlowLayout *)self assetCollectionSubtype];
  double v9 = 1.0;
  double v10 = v7;
  if (v8 == 201)
  {
    v11 = [(HUWallpaperPhotoCollectionFlowLayout *)self collectionView];
    [v11 bounds];
    double v10 = v12 + -16.0;

    double v9 = 8.0;
  }
  [(UICollectionViewFlowLayout *)self setMinimumLineSpacing:v9];
  -[UICollectionViewFlowLayout setItemSize:](self, "setItemSize:", v10, v7);
}

- (int64_t)assetCollectionSubtype
{
  return self->_assetCollectionSubtype;
}

@end