@interface HUWallpaperPickerViewController
- (BOOL)shouldShowPhotoLibrary;
- (HUNamedWallpaperCollectionViewController)namedWallpaperController;
- (HUWallpaperPickerViewController)initWithCollectionType:(int64_t)a3 namedSectionTitle:(id)a4 delegate:(id)a5;
- (HUWallpaperPickerViewController)initWithStyle:(int64_t)a3;
- (HUWallpaperPickerViewControllerDelegate)delegate;
- (NSArray)assetCollections;
- (NSMutableDictionary)assetCollectionsToAssetFetchResults;
- (NSString)namedSectionTitle;
- (PHCachingImageManager)imageManager;
- (id)currentSectionIdentifiers;
- (id)identifierForSection:(unint64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)collectionType;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)contentSizeCategoryDidChange;
- (void)loadAssetCollections;
- (void)namedWallpaperController:(id)a3 didChooseWallpaper:(id)a4 image:(id)a5;
- (void)photoCollectionController:(id)a3 didChooseWallpaper:(id)a4 image:(id)a5;
- (void)photoLibraryDidChange:(id)a3;
- (void)setAssetCollections:(id)a3;
- (void)setAssetCollectionsToAssetFetchResults:(id)a3;
- (void)setCollectionType:(int64_t)a3;
- (void)setImageManager:(id)a3;
- (void)setNamedSectionTitle:(id)a3;
- (void)setNamedWallpaperController:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)wallpaperEditing:(id)a3 didFinishWithWallpaper:(id)a4 image:(id)a5;
- (void)wallpaperEditingDidCancel:(id)a3;
@end

@implementation HUWallpaperPickerViewController

- (HUWallpaperPickerViewController)initWithCollectionType:(int64_t)a3 namedSectionTitle:(id)a4 delegate:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HUWallpaperPickerViewController;
  v11 = [(HUTableViewController *)&v16 initWithStyle:1];
  v12 = v11;
  if (v11)
  {
    v11->_collectionType = a3;
    objc_storeStrong((id *)&v11->_namedSectionTitle, a4);
    v13 = (PHCachingImageManager *)objc_alloc_init(MEMORY[0x1E4F38FB0]);
    imageManager = v12->_imageManager;
    v12->_imageManager = v13;

    objc_storeWeak((id *)&v12->_delegate, v10);
  }

  return v12;
}

- (HUWallpaperPickerViewController)initWithStyle:(int64_t)a3
{
  v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  v6 = NSStringFromSelector(sel_initWithCollectionType_namedSectionTitle_delegate_);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUWallpaperPickerViewController.m", 68, @"%s is unavailable; use %@ instead",
    "-[HUWallpaperPickerViewController initWithStyle:]",
    v6);

  return 0;
}

- (void)viewDidLoad
{
  v19.receiver = self;
  v19.super_class = (Class)HUWallpaperPickerViewController;
  [(HUTableViewController *)&v19 viewDidLoad];
  v3 = _HULocalizedStringWithDefaultValue(@"HUWallpaperPickerTitle", @"HUWallpaperPickerTitle", 1);
  [(HUWallpaperPickerViewController *)self setTitle:v3];

  v4 = [(HUWallpaperPickerViewController *)self tableView];
  [v4 setSeparatorStyle:0];

  v5 = [(HUWallpaperPickerViewController *)self tableView];
  uint64_t v6 = objc_opt_class();
  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  [v5 registerClass:v6 forCellReuseIdentifier:v8];

  id v9 = [(HUWallpaperPickerViewController *)self tableView];
  uint64_t v10 = objc_opt_class();
  v11 = (objc_class *)objc_opt_class();
  v12 = NSStringFromClass(v11);
  [v9 registerClass:v10 forCellReuseIdentifier:v12];

  v13 = [(HUWallpaperPickerViewController *)self tableView];
  uint64_t v14 = objc_opt_class();
  v15 = (objc_class *)objc_opt_class();
  objc_super v16 = NSStringFromClass(v15);
  [v13 registerClass:v14 forHeaderFooterViewReuseIdentifier:v16];

  v17 = [MEMORY[0x1E4F39228] sharedPhotoLibrary];
  [v17 registerChangeObserver:self];

  [(HUWallpaperPickerViewController *)self loadAssetCollections];
  v18 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v18 addObserver:self selector:sel_contentSizeCategoryDidChange name:*MEMORY[0x1E4F43788] object:0];
}

- (void)contentSizeCategoryDidChange
{
  id v2 = [(HUWallpaperPickerViewController *)self tableView];
  [v2 setNeedsLayout];
}

- (BOOL)shouldShowPhotoLibrary
{
  return 1;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  v3 = [(HUWallpaperPickerViewController *)self currentSectionIdentifiers];
  int64_t v4 = [v3 count];

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  v5 = [(HUWallpaperPickerViewController *)self identifierForSection:a4];
  if ([v5 isEqualToString:@"HUWallpaperPickerNamedSectionIdentifier"])
  {
    int64_t v6 = 1;
  }
  else
  {
    v7 = [(HUWallpaperPickerViewController *)self assetCollections];
    int64_t v6 = [v7 count];
  }
  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v50[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  v8 = -[HUWallpaperPickerViewController identifierForSection:](self, "identifierForSection:", [v6 section]);
  if ([v8 isEqualToString:@"HUWallpaperPickerNamedSectionIdentifier"])
  {
    id v9 = (objc_class *)objc_opt_class();
    uint64_t v10 = NSStringFromClass(v9);
    v11 = [v7 dequeueReusableCellWithIdentifier:v10 forIndexPath:v6];

    v12 = [(HUWallpaperPickerViewController *)self namedWallpaperController];

    if (!v12)
    {
      v13 = [HUNamedWallpaperCollectionViewController alloc];
      int64_t v14 = [(HUWallpaperPickerViewController *)self collectionType];
      v15 = [(HUWallpaperPickerViewController *)self tableView];
      [v15 separatorInset];
      v17 = [(HUNamedWallpaperCollectionViewController *)v13 initWithCollectionType:v14 horizontalInset:self delegate:v16];
      [(HUWallpaperPickerViewController *)self setNamedWallpaperController:v17];
    }
    v18 = [(HUWallpaperPickerViewController *)self namedWallpaperController];
    [v11 setViewController:v18];
  }
  else
  {
    objc_super v19 = (objc_class *)objc_opt_class();
    v20 = NSStringFromClass(v19);
    v11 = [v7 dequeueReusableCellWithIdentifier:v20 forIndexPath:v6];

    v21 = [(HUWallpaperPickerViewController *)self assetCollections];
    uint64_t v22 = [v6 row];

    v23 = [v21 objectAtIndexedSubscript:v22];

    v24 = [(HUWallpaperPickerViewController *)self assetCollectionsToAssetFetchResults];
    v25 = [v24 objectForKeyedSubscript:v23];

    if (!v25) {
      NSLog(&cfstr_UnableToLocate.isa, v23);
    }
    v26 = [v23 localizedTitle];
    [v11 setTitleText:v26];

    [v11 setAccessoryType:1];
    objc_msgSend(v11, "setImageSize:", 70.0, 70.0);
    v27 = NSString;
    v28 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v25, "count"));
    v29 = [v27 localizedStringWithFormat:@"%@", v28];
    [v11 setDescriptionText:v29];

    id v30 = objc_alloc_init(MEMORY[0x1E4F390A0]);
    v31 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:1];
    v50[0] = v31;
    v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:1];
    [v30 setSortDescriptors:v32];

    v33 = [MEMORY[0x1E4F38EB8] fetchKeyAssetsInAssetCollection:v23 options:v30];
    if ([v33 count])
    {
      [v11 imageSize];
      double v35 = v34;
      v36 = [MEMORY[0x1E4F42D90] mainScreen];
      [v36 scale];
      double v38 = v35 * v37;
      [v11 imageSize];
      double v40 = v39;
      v41 = [MEMORY[0x1E4F42D90] mainScreen];
      [v41 scale];
      double v43 = v40 * v42;

      v44 = [(HUWallpaperPickerViewController *)self imageManager];
      v45 = [v33 firstObject];
      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = __67__HUWallpaperPickerViewController_tableView_cellForRowAtIndexPath___block_invoke;
      v48[3] = &unk_1E6389518;
      id v49 = v11;
      objc_msgSend(v44, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v45, 1, 0, v48, v38, v43);

      v46 = v49;
    }
    else
    {
      v46 = HUImageNamed(@"emptyPhotoAlbum");
      [v11 setImage:v46];
    }
  }

  return v11;
}

void __67__HUWallpaperPickerViewController_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __67__HUWallpaperPickerViewController_tableView_cellForRowAtIndexPath___block_invoke_2;
  v5[3] = &unk_1E63850E0;
  id v6 = *(id *)(a1 + 32);
  id v7 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __67__HUWallpaperPickerViewController_tableView_cellForRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setImage:*(void *)(a1 + 40)];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (objc_msgSend((id)+[HUWallpaperPickerViewController superclass](HUWallpaperPickerViewController, "superclass"), "instancesRespondToSelector:", a2))
  {
    v18.receiver = self;
    v18.super_class = (Class)HUWallpaperPickerViewController;
    [(HUWallpaperPickerViewController *)&v18 tableView:v7 didSelectRowAtIndexPath:v8];
  }
  [v7 deselectRowAtIndexPath:v8 animated:1];
  id v9 = -[HUWallpaperPickerViewController identifierForSection:](self, "identifierForSection:", [v8 section]);
  if ([v9 isEqualToString:@"HUWallpaperPickerPhotosSectionIdentifier"])
  {
    uint64_t v10 = [(HUWallpaperPickerViewController *)self assetCollections];
    v11 = objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v8, "row"));

    v12 = [(HUWallpaperPickerViewController *)self assetCollectionsToAssetFetchResults];
    v13 = [v12 objectForKeyedSubscript:v11];

    if (v13)
    {
      int64_t v14 = [HUWallpaperPhotoCollectionViewController alloc];
      v15 = [v11 localizedTitle];
      double v16 = -[HUWallpaperPhotoCollectionViewController initWithTitle:fetchResult:assetCollectionSubtype:delegate:](v14, "initWithTitle:fetchResult:assetCollectionSubtype:delegate:", v15, v13, [v11 assetCollectionSubtype], self);

      v17 = [(HUWallpaperPickerViewController *)self navigationController];
      [v17 pushViewController:v16 animated:1];
    }
    else
    {
      NSLog(&cfstr_UnableToLocate.isa, v11);
    }
  }
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6 = (void *)MEMORY[0x1E4F42B58];
  id v7 = a3;
  id v8 = [v6 groupedHeaderConfiguration];
  id v9 = [(HUWallpaperPickerViewController *)self identifierForSection:a4];
  if ([v9 isEqualToString:@"HUWallpaperPickerNamedSectionIdentifier"])
  {
    uint64_t v10 = [(HUWallpaperPickerViewController *)self namedSectionTitle];
LABEL_5:
    v11 = (void *)v10;
    [v8 setText:v10];
    goto LABEL_7;
  }
  if ([v9 isEqualToString:@"HUWallpaperPickerPhotosSectionIdentifier"])
  {
    uint64_t v10 = _HULocalizedStringWithDefaultValue(@"HUWallpaperPickerPhotosSection", @"HUWallpaperPickerPhotosSection", 1);
    goto LABEL_5;
  }
  v11 = v8;
  id v8 = 0;
LABEL_7:

  v12 = (objc_class *)objc_opt_class();
  v13 = NSStringFromClass(v12);
  int64_t v14 = [v7 dequeueReusableHeaderFooterViewWithIdentifier:v13];

  [v14 setContentConfiguration:v8];

  return v14;
}

- (void)photoLibraryDidChange:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__HUWallpaperPickerViewController_photoLibraryDidChange___block_invoke;
  v6[3] = &unk_1E63850E0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __57__HUWallpaperPickerViewController_photoLibraryDidChange___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F1CA48] array];
  id v3 = [*(id *)(a1 + 32) assetCollections];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57__HUWallpaperPickerViewController_photoLibraryDidChange___block_invoke_2;
  v8[3] = &unk_1E6389540;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 32);
  id v9 = v4;
  uint64_t v10 = v5;
  id v6 = v2;
  id v11 = v6;
  [v3 enumerateObjectsUsingBlock:v8];

  if ([v6 count])
  {
    id v7 = [*(id *)(a1 + 32) tableView];
    [v7 reloadRowsAtIndexPaths:v6 withRowAnimation:100];
  }
}

void __57__HUWallpaperPickerViewController_photoLibraryDidChange___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v15 = a2;
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) assetCollectionsToAssetFetchResults];
  id v7 = [v6 objectForKeyedSubscript:v15];
  id v8 = [v5 changeDetailsForFetchResult:v7];

  if (v8)
  {
    id v9 = [v8 fetchResultAfterChanges];
    uint64_t v10 = [*(id *)(a1 + 40) assetCollectionsToAssetFetchResults];
    [v10 setObject:v9 forKeyedSubscript:v15];

    id v11 = [*(id *)(a1 + 40) currentSectionIdentifiers];
    uint64_t v12 = [v11 indexOfObject:@"HUWallpaperPickerPhotosSectionIdentifier"];

    if (v12 == 0x7FFFFFFFFFFFFFFFLL) {
      NSLog(&cfstr_ReceivedPhotoC.isa);
    }
    v13 = *(void **)(a1 + 48);
    int64_t v14 = [MEMORY[0x1E4F28D58] indexPathForRow:a3 inSection:v12];
    [v13 addObject:v14];
  }
}

- (void)namedWallpaperController:(id)a3 didChooseWallpaper:(id)a4 image:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [[HUWallpaperEditingViewController alloc] initWithWallpaper:v8 image:v7 delegate:self];

  [(HUWallpaperEditingViewController *)v9 setModalPresentationStyle:0];
  [(HUWallpaperPickerViewController *)self presentViewController:v9 animated:1 completion:0];
}

- (void)photoCollectionController:(id)a3 didChooseWallpaper:(id)a4 image:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [[HUWallpaperEditingViewController alloc] initWithWallpaper:v8 image:v7 delegate:self];

  [(HUWallpaperEditingViewController *)v9 setModalPresentationStyle:0];
  [(HUWallpaperPickerViewController *)self presentViewController:v9 animated:1 completion:0];
}

- (void)wallpaperEditing:(id)a3 didFinishWithWallpaper:(id)a4 image:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  [(HUWallpaperPickerViewController *)self dismissViewControllerAnimated:1 completion:0];
  id v9 = [(HUWallpaperPickerViewController *)self delegate];
  [v9 wallpaperPickerDidFinish:self wallpaper:v8 image:v7];
}

- (void)wallpaperEditingDidCancel:(id)a3
{
}

- (id)currentSectionIdentifiers
{
  id v3 = [MEMORY[0x1E4F1CA48] arrayWithObject:@"HUWallpaperPickerNamedSectionIdentifier"];
  id v4 = [(HUWallpaperPickerViewController *)self assetCollections];
  uint64_t v5 = [v4 count];

  if (v5) {
    [v3 addObject:@"HUWallpaperPickerPhotosSectionIdentifier"];
  }

  return v3;
}

- (id)identifierForSection:(unint64_t)a3
{
  id v4 = [(HUWallpaperPickerViewController *)self currentSectionIdentifiers];
  if ([v4 count] <= a3) {
    NSLog(&cfstr_ReceivedIdenti.isa, a3, [v4 count]);
  }
  if ([v4 count] <= a3)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = [v4 objectAtIndexedSubscript:a3];
  }

  return v5;
}

- (void)loadAssetCollections
{
  id v3 = [(HUWallpaperPickerViewController *)self assetCollectionsToAssetFetchResults];
  if (v3)
  {

LABEL_4:
    NSLog(&cfstr_AssetCollectio.isa);
    goto LABEL_5;
  }
  id v4 = [(HUWallpaperPickerViewController *)self assetCollections];

  if (v4) {
    goto LABEL_4;
  }
LABEL_5:
  uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
  id v6 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  v21 = __55__HUWallpaperPickerViewController_loadAssetCollections__block_invoke;
  uint64_t v22 = &unk_1E6389568;
  id v23 = v6;
  id v24 = v5;
  id v7 = v5;
  id v8 = v6;
  id v9 = (void (**)(void *, void *))_Block_copy(&v19);
  uint64_t v10 = objc_msgSend(MEMORY[0x1E4F38EE8], "fetchAssetCollectionsWithType:subtype:options:", 2, 209, 0, v19, v20, v21, v22);
  v9[2](v9, v10);

  id v11 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:2 subtype:203 options:0];
  v9[2](v9, v11);

  uint64_t v12 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:2 subtype:210 options:0];
  v9[2](v9, v12);

  v13 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:2 subtype:201 options:0];
  v9[2](v9, v13);

  int64_t v14 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:2 subtype:207 options:0];
  v9[2](v9, v14);

  id v15 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:2 subtype:211 options:0];
  v9[2](v9, v15);

  double v16 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:1 subtype:2 options:0];
  v9[2](v9, v16);

  v17 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:1 subtype:3 options:0];
  v9[2](v9, v17);

  objc_super v18 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:1 subtype:101 options:0];
  v9[2](v9, v18);

  [(HUWallpaperPickerViewController *)self setAssetCollectionsToAssetFetchResults:v7];
  [(HUWallpaperPickerViewController *)self setAssetCollections:v8];
}

void __55__HUWallpaperPickerViewController_loadAssetCollections__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id obj = a2;
  uint64_t v3 = [obj countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v13 + 1) + 8 * v6);
        id v8 = objc_alloc_init(MEMORY[0x1E4F390A0]);
        id v9 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:1];
        v17 = v9;
        uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
        [v8 setSortDescriptors:v10];

        id v11 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:v7 options:v8];
        if ([v11 count])
        {
          [*(id *)(a1 + 32) addObject:v7];
          [*(id *)(a1 + 40) setObject:v11 forKeyedSubscript:v7];
        }

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [obj countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v4);
  }
}

- (HUWallpaperPickerViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUWallpaperPickerViewControllerDelegate *)WeakRetained;
}

- (int64_t)collectionType
{
  return self->_collectionType;
}

- (void)setCollectionType:(int64_t)a3
{
  self->_collectionType = a3;
}

- (HUNamedWallpaperCollectionViewController)namedWallpaperController
{
  return self->_namedWallpaperController;
}

- (void)setNamedWallpaperController:(id)a3
{
}

- (NSString)namedSectionTitle
{
  return self->_namedSectionTitle;
}

- (void)setNamedSectionTitle:(id)a3
{
}

- (PHCachingImageManager)imageManager
{
  return self->_imageManager;
}

- (void)setImageManager:(id)a3
{
}

- (NSMutableDictionary)assetCollectionsToAssetFetchResults
{
  return self->_assetCollectionsToAssetFetchResults;
}

- (void)setAssetCollectionsToAssetFetchResults:(id)a3
{
}

- (NSArray)assetCollections
{
  return self->_assetCollections;
}

- (void)setAssetCollections:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetCollections, 0);
  objc_storeStrong((id *)&self->_assetCollectionsToAssetFetchResults, 0);
  objc_storeStrong((id *)&self->_imageManager, 0);
  objc_storeStrong((id *)&self->_namedSectionTitle, 0);
  objc_storeStrong((id *)&self->_namedWallpaperController, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end