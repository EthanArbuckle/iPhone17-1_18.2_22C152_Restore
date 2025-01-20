@interface HUNamedWallpaperCollectionViewController
- (HUNamedWallpaperCollectionViewController)initWithCollectionType:(int64_t)a3 horizontalInset:(double)a4 delegate:(id)a5;
- (HUNamedWallpaperCollectionViewControllerDelegate)delegate;
- (NSArray)wallpaperThumbnails;
- (NSArray)wallpapers;
- (NSMutableDictionary)wallpaperImageCache;
- (NSMutableDictionary)wallpaperThumbnailCache;
- (UIEdgeInsets)edgeInsets;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionType;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)setWallpaperImageCache:(id)a3;
- (void)setWallpaperThumbnailCache:(id)a3;
- (void)setWallpaperThumbnails:(id)a3;
- (void)setWallpapers:(id)a3;
- (void)viewDidLoad;
@end

@implementation HUNamedWallpaperCollectionViewController

- (HUNamedWallpaperCollectionViewController)initWithCollectionType:(int64_t)a3 horizontalInset:(double)a4 delegate:(id)a5
{
  id v8 = a5;
  id v9 = objc_alloc_init(MEMORY[0x1E4F42890]);
  [v9 setScrollDirection:1];
  [v9 setMinimumLineSpacing:8.0];
  v10 = [MEMORY[0x1E4F42D90] mainScreen];
  [v10 bounds];
  double v12 = v11;
  v13 = [MEMORY[0x1E4F42D90] mainScreen];
  [v13 bounds];
  double v15 = v12 / v14;

  [v9 setItemSize:ceil(v15 * 200.0)];
  v29.receiver = self;
  v29.super_class = (Class)HUNamedWallpaperCollectionViewController;
  v16 = [(HUNamedWallpaperCollectionViewController *)&v29 initWithCollectionViewLayout:v9];
  v17 = v16;
  if (v16)
  {
    v16->_collectionType = a3;
    objc_storeWeak((id *)&v16->_delegate, v8);
    v17->_edgeInsets.top = 0.0;
    v17->_edgeInsets.left = a4;
    v17->_edgeInsets.bottom = 0.0;
    v17->_edgeInsets.right = a4;
    v18 = [MEMORY[0x1E4F69780] sharedInstance];
    uint64_t v19 = [v18 allNamedWallpapersForWallpaperCollectionType:a3];
    wallpapers = v17->_wallpapers;
    v17->_wallpapers = (NSArray *)v19;

    v21 = [MEMORY[0x1E4F69780] sharedInstance];
    uint64_t v22 = [v21 allNamedWallpaperThumbnailsForWallpaperCollectionType:a3];
    wallpaperThumbnails = v17->_wallpaperThumbnails;
    v17->_wallpaperThumbnails = (NSArray *)v22;

    uint64_t v24 = [MEMORY[0x1E4F1CA60] dictionary];
    wallpaperThumbnailCache = v17->_wallpaperThumbnailCache;
    v17->_wallpaperThumbnailCache = (NSMutableDictionary *)v24;

    uint64_t v26 = [MEMORY[0x1E4F1CA60] dictionary];
    wallpaperImageCache = v17->_wallpaperImageCache;
    v17->_wallpaperImageCache = (NSMutableDictionary *)v26;

    -[HUNamedWallpaperCollectionViewController setPreferredContentSize:](v17, "setPreferredContentSize:", 0.0, 232.0);
  }

  return v17;
}

- (void)viewDidLoad
{
  v12.receiver = self;
  v12.super_class = (Class)HUNamedWallpaperCollectionViewController;
  [(HUNamedWallpaperCollectionViewController *)&v12 viewDidLoad];
  v3 = [(HUNamedWallpaperCollectionViewController *)self collectionView];
  uint64_t v4 = objc_opt_class();
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v3 registerClass:v4 forCellWithReuseIdentifier:v6];

  v7 = [MEMORY[0x1E4F428B8] clearColor];
  id v8 = [(HUNamedWallpaperCollectionViewController *)self collectionView];
  [v8 setBackgroundColor:v7];

  id v9 = [(HUNamedWallpaperCollectionViewController *)self collectionView];
  [v9 setShowsVerticalScrollIndicator:0];

  v10 = [(HUNamedWallpaperCollectionViewController *)self collectionView];
  [v10 setAlwaysBounceVertical:0];

  double v11 = [(HUNamedWallpaperCollectionViewController *)self collectionView];
  objc_msgSend(v11, "setContentInset:", 16.0, 16.0, 16.0, 16.0);
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  uint64_t v4 = [(HUNamedWallpaperCollectionViewController *)self wallpaperThumbnails];
  int64_t v5 = [v4 count];

  return v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(HUNamedWallpaperCollectionViewController *)self wallpaperThumbnails];
  id v9 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v6, "item"));

  v10 = [(HUNamedWallpaperCollectionViewController *)self wallpaperThumbnailCache];
  double v11 = [v9 assetIdentifier];
  objc_super v12 = [v10 objectForKeyedSubscript:v11];

  if (!v12)
  {
    v13 = [MEMORY[0x1E4F69780] sharedInstance];
    objc_super v12 = [v13 wallpaperImageForWallpaper:v9 variant:0];

    double v14 = [(HUNamedWallpaperCollectionViewController *)self wallpaperThumbnailCache];
    double v15 = [v9 assetIdentifier];
    [v14 setObject:v12 forKeyedSubscript:v15];
  }
  v16 = (objc_class *)objc_opt_class();
  v17 = NSStringFromClass(v16);
  v18 = [v7 dequeueReusableCellWithReuseIdentifier:v17 forIndexPath:v6];

  [v18 setImage:v12];
  objc_msgSend(v18, "setContentMode:", 2 * (objc_msgSend(v9, "type") != 2));

  return v18;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6 = a4;
  [a3 deselectItemAtIndexPath:v6 animated:1];
  id v7 = [(HUNamedWallpaperCollectionViewController *)self wallpapers];
  uint64_t v8 = [v6 item];

  id v14 = [v7 objectAtIndexedSubscript:v8];

  id v9 = [(HUNamedWallpaperCollectionViewController *)self wallpaperImageCache];
  v10 = [v14 assetIdentifier];
  double v11 = [v9 objectForKeyedSubscript:v10];

  if (!v11)
  {
    objc_super v12 = [MEMORY[0x1E4F69780] sharedInstance];
    double v11 = [v12 wallpaperImageForWallpaper:v14 variant:0];
  }
  v13 = [(HUNamedWallpaperCollectionViewController *)self delegate];
  [v13 namedWallpaperController:self didChooseWallpaper:v14 image:v11];
}

- (HUNamedWallpaperCollectionViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUNamedWallpaperCollectionViewControllerDelegate *)WeakRetained;
}

- (int64_t)collectionType
{
  return self->_collectionType;
}

- (UIEdgeInsets)edgeInsets
{
  double top = self->_edgeInsets.top;
  double left = self->_edgeInsets.left;
  double bottom = self->_edgeInsets.bottom;
  double right = self->_edgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (NSArray)wallpapers
{
  return self->_wallpapers;
}

- (void)setWallpapers:(id)a3
{
}

- (NSMutableDictionary)wallpaperImageCache
{
  return self->_wallpaperImageCache;
}

- (void)setWallpaperImageCache:(id)a3
{
}

- (NSArray)wallpaperThumbnails
{
  return self->_wallpaperThumbnails;
}

- (void)setWallpaperThumbnails:(id)a3
{
}

- (NSMutableDictionary)wallpaperThumbnailCache
{
  return self->_wallpaperThumbnailCache;
}

- (void)setWallpaperThumbnailCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wallpaperThumbnailCache, 0);
  objc_storeStrong((id *)&self->_wallpaperThumbnails, 0);
  objc_storeStrong((id *)&self->_wallpaperImageCache, 0);
  objc_storeStrong((id *)&self->_wallpapers, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end