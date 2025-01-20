@interface HUWallpaperPickerInlineViewController
+ (BOOL)useWallpaperPickerCell;
- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4;
- (CGSize)imageSize;
- (CGSize)preferredContentSize;
- (HFWallpaper)customWallpaper;
- (HFWallpaper)selectedWallpaper;
- (HUWallpaperPhotoCell)customWallpaperCell;
- (HUWallpaperPickerInlineViewController)init;
- (HUWallpaperPickerInlineViewControllerDelegate)delegate;
- (NSArray)namedWallpaperThumbnails;
- (NSArray)namedWallpapers;
- (NSIndexPath)selectedIndexPath;
- (NSMutableDictionary)imageCache;
- (NSMutableDictionary)thumbnailCache;
- (UICollectionViewFlowLayout)flowLayout;
- (UIDropInteraction)dropInteraction;
- (UIImage)originalCustomImage;
- (UIImagePickerController)imagePicker;
- (double)preferedHeight;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4;
- (id)thumbnailWallpaperForIndexPath:(id)a3;
- (id)wallpaperForIndexPath:(id)a3;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (unint64_t)numberOfWallpapers;
- (unint64_t)numberOfWallpapersFittingInWidth;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)configureCell:(id)a3 image:(id)a4 wallpaper:(id)a5;
- (void)dropInteraction:(id)a3 performDrop:(id)a4;
- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4;
- (void)setCustomWallpaper:(id)a3;
- (void)setCustomWallpaper:(id)a3 image:(id)a4;
- (void)setCustomWallpaperCell:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDropInteraction:(id)a3;
- (void)setFlowLayout:(id)a3;
- (void)setImageCache:(id)a3;
- (void)setImagePicker:(id)a3;
- (void)setImageSize:(CGSize)a3;
- (void)setImageSizeToFitWidth:(double)a3 forNumberOfWallpapers:(unint64_t)a4;
- (void)setNamedWallpaperThumbnails:(id)a3;
- (void)setNamedWallpapers:(id)a3;
- (void)setNumberOfWallpapersFittingInWidth:(unint64_t)a3;
- (void)setOriginalCustomImage:(id)a3;
- (void)setSelectedIndexPath:(id)a3;
- (void)setSelectedIndexPath:(id)a3 animated:(BOOL)a4;
- (void)setSelectedWallpaper:(id)a3 animated:(BOOL)a4;
- (void)setThumbnailCache:(id)a3;
- (void)updateScrolling;
- (void)viewDidLoad;
- (void)wallpaperPhotoCellDidPressDeleteButton:(id)a3;
@end

@implementation HUWallpaperPickerInlineViewController

+ (BOOL)useWallpaperPickerCell
{
  return [MEMORY[0x1E4F69758] isAMac];
}

- (HUWallpaperPickerInlineViewController)init
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F42890]);
  [v3 setScrollDirection:1];
  [v3 setMinimumLineSpacing:20.0];
  v17.receiver = self;
  v17.super_class = (Class)HUWallpaperPickerInlineViewController;
  v4 = [(HUWallpaperPickerInlineViewController *)&v17 initWithCollectionViewLayout:v3];
  v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)&v4->_flowLayout, v3);
    v5->_imageSize = (CGSize)vdupq_n_s64(0x4049000000000000uLL);
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    imageCache = v5->_imageCache;
    v5->_imageCache = v6;

    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F429D0]) initWithDelegate:v5];
    dropInteraction = v5->_dropInteraction;
    v5->_dropInteraction = (UIDropInteraction *)v8;

    v10 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    namedWallpapers = v5->_namedWallpapers;
    v5->_namedWallpapers = v10;

    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    thumbnailCache = v5->_thumbnailCache;
    v5->_thumbnailCache = v12;

    v14 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    namedWallpaperThumbnails = v5->_namedWallpaperThumbnails;
    v5->_namedWallpaperThumbnails = v14;
  }
  return v5;
}

- (void)viewDidLoad
{
  v12.receiver = self;
  v12.super_class = (Class)HUWallpaperPickerInlineViewController;
  [(HUWallpaperPickerInlineViewController *)&v12 viewDidLoad];
  id v3 = [(HUWallpaperPickerInlineViewController *)self collectionView];
  [v3 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"HUWallpaperPhotoCell"];

  v4 = [(HUWallpaperPickerInlineViewController *)self collectionView];
  [v4 setDelegate:self];

  v5 = [(HUWallpaperPickerInlineViewController *)self collectionView];
  [v5 setDataSource:self];

  v6 = [MEMORY[0x1E4F428B8] clearColor];
  v7 = [(HUWallpaperPickerInlineViewController *)self collectionView];
  [v7 setBackgroundColor:v6];

  uint64_t v8 = [(HUWallpaperPickerInlineViewController *)self collectionView];
  [v8 setAllowsMultipleSelection:0];

  v9 = [(HUWallpaperPickerInlineViewController *)self collectionView];
  objc_msgSend(v9, "setContentInset:", 20.0, 20.0, 20.0, 20.0);

  v10 = [(HUWallpaperPickerInlineViewController *)self collectionView];
  v11 = [(HUWallpaperPickerInlineViewController *)self dropInteraction];
  [v10 addInteraction:v11];

  [(HUWallpaperPickerInlineViewController *)self updateScrolling];
}

- (CGSize)preferredContentSize
{
  id v3 = [(HUWallpaperPickerInlineViewController *)self view];
  [v3 frame];
  double v5 = v4;
  [(HUWallpaperPickerInlineViewController *)self imageSize];
  double v7 = v6;
  uint64_t v8 = [(HUWallpaperPickerInlineViewController *)self collectionView];
  [v8 contentInset];
  double v10 = v7 + v9;
  v11 = [(HUWallpaperPickerInlineViewController *)self collectionView];
  [v11 contentInset];
  double v13 = v10 + v12;

  double v14 = v5;
  double v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (void)setCustomWallpaper:(id)a3 image:(id)a4
{
  id v13 = a3;
  objc_storeStrong((id *)&self->_customWallpaper, a3);
  id v7 = a4;
  uint64_t v8 = [(HUWallpaperPickerInlineViewController *)self imageCache];
  double v9 = [v13 assetIdentifier];
  [v8 setValue:v7 forKey:v9];

  double v10 = [(HUWallpaperPickerInlineViewController *)self customWallpaperCell];
  [(HUWallpaperPickerInlineViewController *)self configureCell:v10 image:v7 wallpaper:v13];

  v11 = v13;
  if (!v13)
  {
    originalCustomImage = self->_originalCustomImage;
    self->_originalCustomImage = 0;

    v11 = 0;
  }
}

- (void)setNamedWallpapers:(id)a3
{
  objc_storeStrong((id *)&self->_namedWallpapers, a3);
  [(HUWallpaperPickerInlineViewController *)self updateScrolling];
  id v4 = [(HUWallpaperPickerInlineViewController *)self collectionView];
  [v4 reloadData];
}

- (void)setNamedWallpaperThumbnails:(id)a3
{
  objc_storeStrong((id *)&self->_namedWallpaperThumbnails, a3);
  [(HUWallpaperPickerInlineViewController *)self updateScrolling];
  id v4 = [(HUWallpaperPickerInlineViewController *)self collectionView];
  [v4 reloadData];
}

- (void)setImageSize:(CGSize)a3
{
  if (self->_imageSize.width != a3.width || self->_imageSize.height != a3.height)
  {
    self->_imageSize = a3;
    id v4 = [(HUWallpaperPickerInlineViewController *)self view];
    [v4 layoutIfNeeded];

    id v5 = [(HUWallpaperPickerInlineViewController *)self collectionViewLayout];
    [v5 invalidateLayout];
  }
}

- (void)setImageSizeToFitWidth:(double)a3 forNumberOfWallpapers:(unint64_t)a4
{
  id v7 = [(HUWallpaperPickerInlineViewController *)self flowLayout];
  [v7 minimumLineSpacing];
  double v9 = v8;

  double v10 = [(HUWallpaperPickerInlineViewController *)self collectionView];
  [v10 contentInset];
  double v12 = a3 - v11;
  id v13 = [(HUWallpaperPickerInlineViewController *)self collectionView];
  [v13 contentInset];
  double v15 = v12 - v14;

  v16 = [MEMORY[0x1E4F42D90] mainScreen];
  [v16 bounds];
  double v18 = v17;
  v19 = [MEMORY[0x1E4F42D90] mainScreen];
  [v19 bounds];
  double v21 = v18 / v20;

  double v22 = (v15 - v9
             * (double)([(HUWallpaperPickerInlineViewController *)self numberOfWallpapers] - 1))
      / (double)a4;
  -[HUWallpaperPickerInlineViewController setImageSize:](self, "setImageSize:", v22, round(v21 * v22));
  [(HUWallpaperPickerInlineViewController *)self setNumberOfWallpapersFittingInWidth:a4];

  [(HUWallpaperPickerInlineViewController *)self updateScrolling];
}

- (void)setSelectedWallpaper:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v21 = a3;
  double v6 = [(HUWallpaperPickerInlineViewController *)self selectedWallpaper];
  id v7 = v21;
  if (!v6) {
    goto LABEL_16;
  }
  double v8 = [v21 assetIdentifier];
  double v9 = [(HUWallpaperPickerInlineViewController *)self selectedWallpaper];
  double v10 = [v9 assetIdentifier];
  char v11 = [v8 isEqualToString:v10];

  id v7 = v21;
  if ((v11 & 1) == 0)
  {
LABEL_16:
    double v12 = [v7 assetIdentifier];
    id v13 = [(HUWallpaperPickerInlineViewController *)self customWallpaper];
    double v14 = [v13 assetIdentifier];
    int v15 = [v12 isEqualToString:v14];

    if (v15)
    {
      v16 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", -[HUWallpaperPickerInlineViewController numberOfWallpapers](self, "numberOfWallpapers") - 1, 0);
    }
    else
    {
      double v17 = [(HUWallpaperPickerInlineViewController *)self namedWallpapers];
      double v18 = objc_msgSend(v17, "na_map:", &__block_literal_global_25);

      v19 = [v21 assetIdentifier];
      uint64_t v20 = [v18 indexOfObject:v19];

      if (v20 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v16 = 0;
      }
      else
      {
        v16 = [MEMORY[0x1E4F28D58] indexPathForItem:v20 inSection:0];
      }
    }
    id v7 = v21;
    if (v16)
    {
      [(HUWallpaperPickerInlineViewController *)self setSelectedIndexPath:v16 animated:v4];

      id v7 = v21;
    }
  }
}

uint64_t __71__HUWallpaperPickerInlineViewController_setSelectedWallpaper_animated___block_invoke(uint64_t a1, void *a2)
{
  return [a2 assetIdentifier];
}

- (void)setSelectedIndexPath:(id)a3
{
}

- (void)setSelectedIndexPath:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double v6 = (NSIndexPath *)a3;
  id v7 = [(HUWallpaperPickerInlineViewController *)self collectionView];
  double v8 = [v7 cellForItemAtIndexPath:v6];
  [v8 showBorder:1 animated:v4];

  double v9 = [(HUWallpaperPickerInlineViewController *)self selectedIndexPath];

  if (v9)
  {
    double v10 = [(HUWallpaperPickerInlineViewController *)self collectionView];
    char v11 = [(HUWallpaperPickerInlineViewController *)self selectedIndexPath];
    double v12 = [v10 cellForItemAtIndexPath:v11];
    [v12 showBorder:0 animated:v4];
  }
  id v13 = [(HUWallpaperPickerInlineViewController *)self collectionView];
  int v14 = [v13 isScrollEnabled];

  if (v14)
  {
    int v15 = [(HUWallpaperPickerInlineViewController *)self collectionView];
    [v15 scrollToItemAtIndexPath:v6 atScrollPosition:32 animated:v4];
  }
  selectedIndexPath = self->_selectedIndexPath;
  self->_selectedIndexPath = v6;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 1;
}

- (void)configureCell:(id)a3 image:(id)a4 wallpaper:(id)a5
{
  id v12 = a3;
  id v7 = a4;
  id v8 = a5;
  [v12 setEmpty:v7 == 0];
  if (v7)
  {
    [v12 setImage:v7];
    uint64_t v9 = [v8 isCustomType];
  }
  else
  {
    double v10 = [MEMORY[0x1E4F42A80] systemImageNamed:@"photo.on.rectangle"];
    [v12 setImage:v10];

    uint64_t v9 = 0;
  }
  [v12 setRemovable:v9];
  if (v8)
  {
    char v11 = [v8 assetIdentifier];
    [v12 setAssetIdentifier:v11];
  }
  else
  {
    [v12 setAssetIdentifier:0];
  }
  [v12 setBusy:0];
  [v12 setHighlighted:0];
  objc_msgSend(v12, "setContentMode:", 2 * (objc_msgSend(v8, "type") != 2));
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = [a3 dequeueReusableCellWithReuseIdentifier:@"HUWallpaperPhotoCell" forIndexPath:v6];
  id v8 = [(HUWallpaperPickerInlineViewController *)self wallpaperForIndexPath:v6];
  if (!v8) {
    goto LABEL_10;
  }
  uint64_t v9 = [(HUWallpaperPickerInlineViewController *)self imageCache];
  double v10 = [v8 assetIdentifier];
  id v11 = [v9 objectForKeyedSubscript:v10];

  if (v11) {
    goto LABEL_13;
  }
  if (![v8 type]
    || [v8 type] == 2
    || [v8 type] == 3
    || [v8 type] == 4
    || [v8 type] == 5)
  {
    id v12 = [(HUWallpaperPickerInlineViewController *)self thumbnailWallpaperForIndexPath:v6];
    id v13 = [(HUWallpaperPickerInlineViewController *)self thumbnailCache];
    int v14 = [v12 assetIdentifier];
    int v15 = [v13 objectForKeyedSubscript:v14];
    v16 = v15;
    if (v15)
    {
      id v11 = v15;
    }
    else
    {
      double v17 = [MEMORY[0x1E4F69780] sharedInstance];
      id v11 = [v17 wallpaperImageForWallpaper:v12 variant:0];
    }
    double v18 = [(HUWallpaperPickerInlineViewController *)self thumbnailCache];
    v19 = [v12 assetIdentifier];
    [v18 setValue:v11 forKey:v19];
  }
  else
  {
LABEL_10:
    id v11 = 0;
  }
LABEL_13:
  [v7 setDelegate:self];
  [v7 setCornerRadius:10.0];
  uint64_t v20 = [MEMORY[0x1E4F428B8] clearColor];
  [v7 setBackgroundColor:v20];

  [(HUWallpaperPickerInlineViewController *)self configureCell:v7 image:v11 wallpaper:v8];
  id v21 = [(HUWallpaperPickerInlineViewController *)self selectedWallpaper];

  if (v21)
  {
    double v22 = [v8 assetIdentifier];
    v23 = [(HUWallpaperPickerInlineViewController *)self selectedWallpaper];
    v24 = [v23 assetIdentifier];
    objc_msgSend(v7, "showBorder:animated:", objc_msgSend(v22, "isEqualToString:", v24), 0);
  }
  uint64_t v25 = [v6 item];
  if (v25 == [(HUWallpaperPickerInlineViewController *)self numberOfWallpapers] - 1) {
    [(HUWallpaperPickerInlineViewController *)self setCustomWallpaperCell:v7];
  }

  return v7;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v37 = a3;
  id v6 = a4;
  uint64_t v7 = [(HUWallpaperPickerInlineViewController *)self selectedIndexPath];
  if (v7)
  {
    id v8 = (void *)v7;
    uint64_t v9 = [(HUWallpaperPickerInlineViewController *)self selectedIndexPath];
    uint64_t v10 = [v9 item];
    uint64_t v11 = [v6 item];

    if (v10 == v11)
    {
      id v12 = [(HUWallpaperPickerInlineViewController *)self delegate];

      if (!v12) {
        goto LABEL_25;
      }
      id v13 = [(HUWallpaperPickerInlineViewController *)self delegate];
      [v13 wallpaperPickerRequestOpenWallpaperEditor:self];
      goto LABEL_24;
    }
  }
  int v14 = [(HUWallpaperPickerInlineViewController *)self wallpaperForIndexPath:v6];

  if (!v14)
  {
    uint64_t v25 = [(HUWallpaperPickerInlineViewController *)self customWallpaper];

    if (v25) {
      goto LABEL_25;
    }
    id v26 = objc_alloc_init(MEMORY[0x1E4F42A90]);
    [(HUWallpaperPickerInlineViewController *)self setImagePicker:v26];

    v27 = [(HUWallpaperPickerInlineViewController *)self imagePicker];
    [v27 setDelegate:self];

    v28 = [(HUWallpaperPickerInlineViewController *)self imagePicker];
    [v28 setSourceType:0];

    v29 = [(HUWallpaperPickerInlineViewController *)self imagePicker];
    [v29 setModalPresentationStyle:2];

    id v13 = [(HUWallpaperPickerInlineViewController *)self popoverPresentationController];
    v30 = [v37 cellForItemAtIndexPath:v6];
    [v13 setSourceView:v30];

    v31 = [(HUWallpaperPickerInlineViewController *)self imagePicker];
    [(HUWallpaperPickerInlineViewController *)self presentViewController:v31 animated:1 completion:0];
    goto LABEL_23;
  }
  [(HUWallpaperPickerInlineViewController *)self setSelectedIndexPath:v6 animated:1];
  uint64_t v15 = [(HUWallpaperPickerInlineViewController *)self delegate];
  if (v15)
  {
    v16 = (void *)v15;
    double v17 = [(HUWallpaperPickerInlineViewController *)self selectedWallpaper];

    if (v17)
    {
      double v18 = [(HUWallpaperPickerInlineViewController *)self imageCache];
      v19 = [(HUWallpaperPickerInlineViewController *)self selectedWallpaper];
      uint64_t v20 = [v19 assetIdentifier];
      id v13 = [v18 objectForKeyedSubscript:v20];

      id v21 = [(HUWallpaperPickerInlineViewController *)self selectedWallpaper];
      double v22 = v21;
      if (v13)
      {
        if ([v21 isCustomType])
        {
          v23 = [(HUWallpaperPickerInlineViewController *)self originalCustomImage];

          if (v23)
          {
            uint64_t v24 = [(HUWallpaperPickerInlineViewController *)self originalCustomImage];
            goto LABEL_21;
          }
        }
        else
        {
        }
LABEL_22:
        v31 = [(HUWallpaperPickerInlineViewController *)self delegate];
        v36 = [(HUWallpaperPickerInlineViewController *)self selectedWallpaper];
        [v31 wallpaperPicker:self didSelectWallpaper:v36 withImage:v13];

LABEL_23:
LABEL_24:

        goto LABEL_25;
      }
      if ([v21 type])
      {
        v32 = [(HUWallpaperPickerInlineViewController *)self selectedWallpaper];
        if ([v32 type] != 4)
        {
          v33 = [(HUWallpaperPickerInlineViewController *)self selectedWallpaper];
          uint64_t v34 = [v33 type];

          if (v34 != 5) {
            goto LABEL_25;
          }
          goto LABEL_20;
        }
      }
LABEL_20:
      id v13 = [MEMORY[0x1E4F69780] sharedInstance];
      v35 = [(HUWallpaperPickerInlineViewController *)self selectedWallpaper];
      uint64_t v24 = [v13 wallpaperImageForWallpaper:v35 variant:0];

LABEL_21:
      id v13 = (void *)v24;
      if (!v24) {
        goto LABEL_25;
      }
      goto LABEL_22;
    }
  }
LABEL_25:
}

- (void)wallpaperPhotoCellDidPressDeleteButton:(id)a3
{
  BOOL v4 = [(HUWallpaperPickerInlineViewController *)self selectedWallpaper];
  int v5 = [v4 isCustomType];

  if (v5)
  {
    id v6 = [(HUWallpaperPickerInlineViewController *)self namedWallpapers];
    uint64_t v7 = [v6 lastObject];
    [(HUWallpaperPickerInlineViewController *)self setSelectedWallpaper:v7 animated:1];
  }
  id v8 = [(HUWallpaperPickerInlineViewController *)self customWallpaper];

  if (v8)
  {
    uint64_t v9 = [(HUWallpaperPickerInlineViewController *)self imageCache];
    uint64_t v10 = [(HUWallpaperPickerInlineViewController *)self customWallpaper];
    uint64_t v11 = [v10 assetIdentifier];
    [v9 removeObjectForKey:v11];

    [(HUWallpaperPickerInlineViewController *)self setCustomWallpaper:0];
  }
  id v12 = [(HUWallpaperPickerInlineViewController *)self customWallpaperCell];
  [(HUWallpaperPickerInlineViewController *)self configureCell:v12 image:0 wallpaper:0];

  uint64_t v13 = [(HUWallpaperPickerInlineViewController *)self delegate];
  if (v13)
  {
    int v14 = (void *)v13;
    uint64_t v15 = [(HUWallpaperPickerInlineViewController *)self selectedWallpaper];

    if (v15)
    {
      v16 = [(HUWallpaperPickerInlineViewController *)self imageCache];
      double v17 = [(HUWallpaperPickerInlineViewController *)self selectedWallpaper];
      double v18 = [v17 assetIdentifier];
      id v23 = [v16 objectForKeyedSubscript:v18];

      if (!v23)
      {
        v19 = [MEMORY[0x1E4F69780] sharedInstance];
        uint64_t v20 = [(HUWallpaperPickerInlineViewController *)self selectedWallpaper];
        id v23 = [v19 wallpaperImageForWallpaper:v20 variant:0];
      }
      id v21 = [(HUWallpaperPickerInlineViewController *)self delegate];
      double v22 = [(HUWallpaperPickerInlineViewController *)self selectedWallpaper];
      [v21 wallpaperPicker:self didSelectWallpaper:v22 withImage:v23];
    }
  }
}

- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4
{
  id v4 = a4;
  char v5 = [v4 canLoadObjectsOfClass:objc_opt_class()];

  return v5;
}

- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4
{
  id v4 = objc_msgSend(a4, "items", a3);
  BOOL v5 = (unint64_t)[v4 count] < 2;

  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F429D8]) initWithDropOperation:2 * v5];

  return v6;
}

- (void)dropInteraction:(id)a3 performDrop:(id)a4
{
  id v5 = a4;
  id v6 = [(HUWallpaperPickerInlineViewController *)self customWallpaperCell];
  [v6 layoutIfNeeded];

  uint64_t v7 = [v5 items];

  id v8 = [v7 firstObject];
  uint64_t v9 = [v8 itemProvider];
  uint64_t v10 = objc_opt_class();
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __69__HUWallpaperPickerInlineViewController_dropInteraction_performDrop___block_invoke;
  v12[3] = &unk_1E63864A0;
  v12[4] = self;
  id v11 = (id)[v9 loadObjectOfClass:v10 completionHandler:v12];
}

void __69__HUWallpaperPickerInlineViewController_dropInteraction_performDrop___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  uint64_t v7 = [*(id *)(a1 + 32) delegate];

  if (v7 && v6)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __69__HUWallpaperPickerInlineViewController_dropInteraction_performDrop___block_invoke_2;
    v8[3] = &unk_1E63850E0;
    v8[4] = *(void *)(a1 + 32);
    id v9 = v6;
    dispatch_async(MEMORY[0x1E4F14428], v8);
  }
}

void __69__HUWallpaperPickerInlineViewController_dropInteraction_performDrop___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 wallpaperPicker:*(void *)(a1 + 32) didReceiveDroppedImage:*(void *)(a1 + 40)];
}

- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4
{
  id v12 = a3;
  id v6 = [a4 objectForKey:*MEMORY[0x1E4F439A0]];
  uint64_t v7 = [(HUWallpaperPickerInlineViewController *)self delegate];

  if (v7 && v6)
  {
    id v8 = [(HUWallpaperPickerInlineViewController *)self collectionView];
    id v9 = [(HUWallpaperPickerInlineViewController *)self customWallpaperCell];
    uint64_t v10 = [v8 indexPathForCell:v9];

    [(HUWallpaperPickerInlineViewController *)self setSelectedIndexPath:v10 animated:1];
    id v11 = [(HUWallpaperPickerInlineViewController *)self delegate];
    [v11 wallpaperPicker:self didReceiveDroppedImage:v6];
  }
  [v12 dismissViewControllerAnimated:1 completion:0];
}

- (unint64_t)numberOfWallpapers
{
  id v2 = [(HUWallpaperPickerInlineViewController *)self namedWallpaperThumbnails];
  unint64_t v3 = [v2 count] + 1;

  return v3;
}

- (HFWallpaper)selectedWallpaper
{
  unint64_t v3 = [(HUWallpaperPickerInlineViewController *)self selectedIndexPath];

  if (v3)
  {
    id v4 = [(HUWallpaperPickerInlineViewController *)self selectedIndexPath];
    id v5 = [(HUWallpaperPickerInlineViewController *)self wallpaperForIndexPath:v4];
  }
  else
  {
    id v5 = 0;
  }

  return (HFWallpaper *)v5;
}

- (id)wallpaperForIndexPath:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 item];
  id v6 = [(HUWallpaperPickerInlineViewController *)self namedWallpapers];
  unint64_t v7 = [v6 count];

  if (v5 >= v7)
  {
    id v9 = [(HUWallpaperPickerInlineViewController *)self customWallpaper];
  }
  else
  {
    id v8 = [(HUWallpaperPickerInlineViewController *)self namedWallpapers];
    id v9 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v4, "item"));
  }

  return v9;
}

- (id)thumbnailWallpaperForIndexPath:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 item];
  id v6 = [(HUWallpaperPickerInlineViewController *)self namedWallpaperThumbnails];
  unint64_t v7 = [v6 count];

  if (v5 >= v7)
  {
    id v9 = 0;
  }
  else
  {
    id v8 = [(HUWallpaperPickerInlineViewController *)self namedWallpaperThumbnails];
    id v9 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v4, "item"));
  }

  return v9;
}

- (void)updateScrolling
{
  id v3 = [(HUWallpaperPickerInlineViewController *)self collectionView];
  objc_msgSend(v3, "setScrollEnabled:", -[HUWallpaperPickerInlineViewController numberOfWallpapers](self, "numberOfWallpapers") > -[HUWallpaperPickerInlineViewController numberOfWallpapersFittingInWidth](self, "numberOfWallpapersFittingInWidth"));
}

- (CGSize)imageSize
{
  double width = self->_imageSize.width;
  double height = self->_imageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (NSArray)namedWallpapers
{
  return self->_namedWallpapers;
}

- (NSArray)namedWallpaperThumbnails
{
  return self->_namedWallpaperThumbnails;
}

- (double)preferedHeight
{
  return self->_preferedHeight;
}

- (UIImage)originalCustomImage
{
  return self->_originalCustomImage;
}

- (void)setOriginalCustomImage:(id)a3
{
}

- (HUWallpaperPickerInlineViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUWallpaperPickerInlineViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableDictionary)imageCache
{
  return self->_imageCache;
}

- (void)setImageCache:(id)a3
{
}

- (NSMutableDictionary)thumbnailCache
{
  return self->_thumbnailCache;
}

- (void)setThumbnailCache:(id)a3
{
}

- (UIImagePickerController)imagePicker
{
  return self->_imagePicker;
}

- (void)setImagePicker:(id)a3
{
}

- (HUWallpaperPhotoCell)customWallpaperCell
{
  return self->_customWallpaperCell;
}

- (void)setCustomWallpaperCell:(id)a3
{
}

- (UICollectionViewFlowLayout)flowLayout
{
  return self->_flowLayout;
}

- (void)setFlowLayout:(id)a3
{
}

- (HFWallpaper)customWallpaper
{
  return self->_customWallpaper;
}

- (void)setCustomWallpaper:(id)a3
{
}

- (UIDropInteraction)dropInteraction
{
  return self->_dropInteraction;
}

- (void)setDropInteraction:(id)a3
{
}

- (NSIndexPath)selectedIndexPath
{
  return self->_selectedIndexPath;
}

- (unint64_t)numberOfWallpapersFittingInWidth
{
  return self->_numberOfWallpapersFittingInWidth;
}

- (void)setNumberOfWallpapersFittingInWidth:(unint64_t)a3
{
  self->_numberOfWallpapersFittingInWidth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedIndexPath, 0);
  objc_storeStrong((id *)&self->_dropInteraction, 0);
  objc_storeStrong((id *)&self->_customWallpaper, 0);
  objc_storeStrong((id *)&self->_flowLayout, 0);
  objc_storeStrong((id *)&self->_customWallpaperCell, 0);
  objc_storeStrong((id *)&self->_imagePicker, 0);
  objc_storeStrong((id *)&self->_thumbnailCache, 0);
  objc_storeStrong((id *)&self->_imageCache, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_originalCustomImage, 0);
  objc_storeStrong((id *)&self->_namedWallpaperThumbnails, 0);

  objc_storeStrong((id *)&self->_namedWallpapers, 0);
}

@end