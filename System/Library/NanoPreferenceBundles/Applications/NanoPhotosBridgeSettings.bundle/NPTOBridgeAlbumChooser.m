@interface NPTOBridgeAlbumChooser
+ (void)initialize;
- (BOOL)_allowsRecentAlbumSelection;
- (BOOL)_allowsSharedAlbumSelection;
- (BOOL)_isTinkerPaired;
- (BOOL)_shouldShowAggregateItem;
- (BOOL)canBeShownFromSuspendedState;
- (BOOL)shouldShowAllPhotosItem;
- (BOOL)showAddNewAlbumPlaceholder;
- (BOOL)showsEmptyPlaceholderWhenEmpty;
- (BOOL)showsSeparatorBelowTopPlaceholdersSection;
- (BOOL)showsTopPlaceholdersSection;
- (NPTOBridgeAlbumChooser)init;
- (PSController)parentController;
- (PSRootController)rootController;
- (PSSpecifier)specifier;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_albumsSectionTitle;
- (id)_device;
- (id)_noneAlbumName;
- (id)_preferencesAccessor;
- (id)_title;
- (id)readPreferenceValue:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (int64_t)tableViewStyle;
- (void)_reloadData;
- (void)_syncedAlbumIdentifierPreferenceChanged;
- (void)dealloc;
- (void)handleURL:(id)a3 withCompletion:(id)a4;
- (void)photoLibraryDidChange:(id)a3;
- (void)setParentController:(id)a3;
- (void)setRootController:(id)a3;
- (void)setSpecifier:(id)a3;
- (void)showController:(id)a3;
- (void)showController:(id)a3 animate:(BOOL)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateNavigationBarAnimated:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)willBecomeActive;
@end

@implementation NPTOBridgeAlbumChooser

+ (void)initialize
{
}

- (NPTOBridgeAlbumChooser)init
{
  v3 = objc_opt_new();
  v8.receiver = self;
  v8.super_class = (Class)NPTOBridgeAlbumChooser;
  v4 = [(NPTOBridgeAlbumChooser *)&v8 initWithSpec:v3];
  if (v4)
  {
    v5 = +[PHPhotoLibrary sharedPhotoLibrary];
    [v5 registerChangeObserver:v4];
    v6 = [(NPTOBridgeAlbumChooser *)v4 _title];
    [(NPTOBridgeAlbumChooser *)v4 setTitle:v6];
  }
  return v4;
}

- (void)dealloc
{
  v3 = +[PHPhotoLibrary sharedPhotoLibrary];
  [v3 unregisterChangeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)NPTOBridgeAlbumChooser;
  [(NPTOBridgeAlbumChooser *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)NPTOBridgeAlbumChooser;
  [(NPTOBridgeAlbumChooser *)&v6 viewDidLoad];
  v3 = BPSBridgeTintColor();
  objc_super v4 = [(NPTOBridgeAlbumChooser *)self view];
  [v4 setTintColor:v3];

  v5 = [(NPTOBridgeAlbumChooser *)self _mainTableView];
  [v5 setSeparatorStyle:1];

  [(NPTOBridgeAlbumChooser *)self _reloadData];
}

- (void)viewWillAppear:(BOOL)a3
{
  v12.receiver = self;
  v12.super_class = (Class)NPTOBridgeAlbumChooser;
  [(NPTOBridgeAlbumChooser *)&v12 viewWillAppear:a3];
  objc_initWeak(&location, self);
  if (!self->_syncedAlbumIdentifierPreferenceObserver)
  {
    objc_super v4 = [(NPTOBridgeAlbumChooser *)self _preferencesAccessor];
    v5 = +[NSOperationQueue mainQueue];
    uint64_t v6 = NPTOPreferencesSyncedAlbumIdentifierKey;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_5A78;
    v9[3] = &unk_C420;
    objc_copyWeak(&v10, &location);
    v7 = [v4 changeObserverForKey:v6 queue:v5 block:v9];
    id syncedAlbumIdentifierPreferenceObserver = self->_syncedAlbumIdentifierPreferenceObserver;
    self->_id syncedAlbumIdentifierPreferenceObserver = v7;

    objc_destroyWeak(&v10);
  }
  objc_destroyWeak(&location);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NPTOBridgeAlbumChooser;
  [(NPTOBridgeAlbumChooser *)&v5 viewDidDisappear:a3];
  id syncedAlbumIdentifierPreferenceObserver = self->_syncedAlbumIdentifierPreferenceObserver;
  self->_id syncedAlbumIdentifierPreferenceObserver = 0;
}

- (void)updateNavigationBarAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)NPTOBridgeAlbumChooser;
  -[NPTOBridgeAlbumChooser updateNavigationBarAnimated:](&v6, "updateNavigationBarAnimated:");
  objc_super v5 = [(NPTOBridgeAlbumChooser *)self navigationItem];
  [v5 setRightBarButtonItems:0 animated:v3];
}

- (void)_reloadData
{
  BOOL v3 = +[NSMutableArray array];
  objc_super v4 = +[PHAssetCollection fetchAssetCollectionsWithType:2 subtype:203 options:0];
  if ([v4 count])
  {
    objc_super v5 = [v4 firstObject];
    [v3 addObject:v5];
  }
  if ([(NPTOBridgeAlbumChooser *)self _allowsRecentAlbumSelection])
  {
    objc_super v6 = +[PHAssetCollection fetchAssetCollectionsWithType:2 subtype:209 options:0];
    if ([v6 count])
    {
      v7 = [v6 firstObject];
      [v3 addObject:v7];
    }
  }
  id v8 = objc_alloc_init((Class)PHFetchOptions);
  v9 = +[NSSortDescriptor sortDescriptorWithKey:@"localizedTitle" ascending:1];
  id v10 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v9, 0);
  [v8 setSortDescriptors:v10];

  v11 = +[PHAssetCollection fetchAssetCollectionsWithType:1 subtype:0x7FFFFFFFFFFFFFFFLL options:v8];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_5DE4;
  v16[3] = &unk_C488;
  v16[4] = self;
  id v12 = v3;
  id v17 = v12;
  [v11 enumerateObjectsUsingBlock:v16];
  if ([v12 count])
  {
    id v13 = [v12 copy];
    v14 = +[PHCollectionList transientCollectionListWithCollections:v13 title:@"Albums"];

    id v15 = [objc_alloc((Class)PXPhotoKitCollectionsDataSourceManagerConfiguration) initWithCollectionList:v14];
    [v15 setSeparateSectionsForSmartAndUserCollections:0];
    [(NPTOBridgeAlbumChooser *)self setDataSourceManagerConfiguration:v15];
  }
  else
  {
    [(NPTOBridgeAlbumChooser *)self setDataSourceManagerConfiguration:0];
  }
}

- (void)_syncedAlbumIdentifierPreferenceChanged
{
  BOOL v3 = [(NPTOBridgeAlbumChooser *)self _mainTableView];
  objc_super v4 = [(NPTOBridgeAlbumChooser *)self _preferencesAccessor];
  objc_super v5 = objc_msgSend(v4, "npto_syncedAlbumIdentifier");

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = [v3 indexPathsForVisibleRows];
  id v6 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v26;
    uint64_t v23 = NPTOPreferencesSyncedAlbumIdentifierNone;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        id v11 = objc_msgSend(v10, "section", v23);
        if (v11 == [(NPTOBridgeAlbumChooser *)self topPlaceholdersSection])
        {
          id v12 = +[NSIndexPath indexPathForRow:0 inSection:[(NPTOBridgeAlbumChooser *)self topPlaceholdersSection]];
          id v13 = [v3 cellForRowAtIndexPath:v12];

          if ([v5 isEqualToString:v23]) {
            uint64_t v14 = 3;
          }
          else {
            uint64_t v14 = 0;
          }
          [v13 setAccessoryType:v14];
        }
        id v15 = [v10 section];
        v16 = [(NPTOBridgeAlbumChooser *)self albumsSections];
        if (v15 >= v16 && v15 - v16 < v17)
        {
          v19 = [(NPTOBridgeAlbumChooser *)self collectionAtIndexPath:v10];
          v20 = [v3 cellForRowAtIndexPath:v10];
          v21 = [v19 localIdentifier];
          if ([v21 isEqualToString:v5]) {
            uint64_t v22 = 3;
          }
          else {
            uint64_t v22 = 0;
          }
          [v20 setAccessoryType:v22];
        }
      }
      id v7 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v7);
  }
}

- (void)photoLibraryDidChange:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_610C;
  block[3] = &unk_C4B0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (BOOL)shouldShowAllPhotosItem
{
  return 0;
}

- (BOOL)showAddNewAlbumPlaceholder
{
  return 0;
}

- (BOOL)_shouldShowAggregateItem
{
  return 0;
}

- (BOOL)showsTopPlaceholdersSection
{
  return 1;
}

- (BOOL)showsSeparatorBelowTopPlaceholdersSection
{
  return 1;
}

- (BOOL)showsEmptyPlaceholderWhenEmpty
{
  return 0;
}

- (int64_t)tableViewStyle
{
  return 2;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(NPTOBridgeAlbumChooser *)self _preferencesAccessor];
  v9 = objc_msgSend(v8, "npto_syncedAlbumIdentifier");

  id v10 = [v7 section];
  if (v10 == [(NPTOBridgeAlbumChooser *)self topPlaceholdersSection])
  {
    id v11 = [v6 dequeueReusableCellWithIdentifier:@"NoAlbumCell"];
    if (!v11) {
      id v11 = [objc_alloc((Class)UITableViewCell) initWithStyle:0 reuseIdentifier:@"NoAlbumCell"];
    }
    id v12 = [(NPTOBridgeAlbumChooser *)self _noneAlbumName];
    id v13 = [v11 textLabel];
    [v13 setText:v12];

    if ([v9 isEqualToString:NPTOPreferencesSyncedAlbumIdentifierNone]) {
      uint64_t v14 = 3;
    }
    else {
      uint64_t v14 = 0;
    }
    [v11 setAccessoryType:v14];
  }
  else
  {
    id v15 = [v7 section];
    v16 = [(NPTOBridgeAlbumChooser *)self albumsSections];
    if (v15 < v16 || v15 - v16 >= v17)
    {
      v27.receiver = self;
      v27.super_class = (Class)NPTOBridgeAlbumChooser;
      id v11 = [(NPTOBridgeAlbumChooser *)&v27 tableView:v6 cellForRowAtIndexPath:v7];
    }
    else
    {
      v28.receiver = self;
      v28.super_class = (Class)NPTOBridgeAlbumChooser;
      id v11 = [(NPTOBridgeAlbumChooser *)&v28 tableView:v6 cellForRowAtIndexPath:v7];
      v18 = [(NPTOBridgeAlbumChooser *)self collectionAtIndexPath:v7];
      v19 = [v18 localIdentifier];
      if ([v19 isEqualToString:v9]) {
        uint64_t v20 = 3;
      }
      else {
        uint64_t v20 = 0;
      }
      [v11 setAccessoryType:v20];

      v21 = BPSForegroundColor();
      [v11 setBackgroundColor:v21];

      [v11 setSelectionStyle:3];
      id v22 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
      uint64_t v23 = BPSCellHightlightColor();
      [v22 setBackgroundColor:v23];

      [v11 setSelectedBackgroundView:v22];
      v24 = [(NPTOBridgeAlbumChooser *)self spec];
      [v24 stackSize];
      objc_msgSend(v11, "setSeparatorInset:", 0.0, v25 + 16.0 + 8.0, 0.0, 0.0);
    }
  }

  return v11;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  if ([(NPTOBridgeAlbumChooser *)self topPlaceholdersSection] == (id)a4)
  {
    id v7 = &dword_0 + 1;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)NPTOBridgeAlbumChooser;
    id v7 = [(NPTOBridgeAlbumChooser *)&v9 tableView:v6 numberOfRowsInSection:a4];
  }

  return (int64_t)v7;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 section];
  if (v8 == [(NPTOBridgeAlbumChooser *)self topPlaceholdersSection])
  {
    double v9 = UITableViewAutomaticDimension;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)NPTOBridgeAlbumChooser;
    [(NPTOBridgeAlbumChooser *)&v12 tableView:v6 heightForRowAtIndexPath:v7];
    double v9 = v10;
  }

  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 deselectRowAtIndexPath:v7 animated:1];
  id v8 = [v6 cellForRowAtIndexPath:v7];
  [v8 setAccessoryType:3];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  double v9 = objc_msgSend(v6, "visibleCells", 0);
  id v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v23;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if (v14 != v8) {
          [v14 setAccessoryType:0];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v11);
  }

  id v15 = [v7 section];
  if (v15 == [(NPTOBridgeAlbumChooser *)self topPlaceholdersSection])
  {
    v16 = [(NPTOBridgeAlbumChooser *)self _preferencesAccessor];
    [v16 setObject:NPTOPreferencesSyncedAlbumIdentifierNone forKey:NPTOPreferencesSyncedAlbumIdentifierKey];
LABEL_15:

    goto LABEL_16;
  }
  unint64_t v17 = [v7 section];
  v18 = [(NPTOBridgeAlbumChooser *)self albumsSections];
  if (v17 >= v18 && v17 - v18 < v19)
  {
    v16 = [(NPTOBridgeAlbumChooser *)self collectionAtIndexPath:v7];
    uint64_t v20 = [(NPTOBridgeAlbumChooser *)self _preferencesAccessor];
    v21 = [v16 localIdentifier];
    [v20 setObject:v21 forKey:NPTOPreferencesSyncedAlbumIdentifierKey];

    goto LABEL_15;
  }
LABEL_16:
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  if ([(NPTOBridgeAlbumChooser *)self topPlaceholdersSection] != (id)a4) {
    return UITableViewAutomaticDimension;
  }
  objc_super v5 = [(NPTOBridgeAlbumChooser *)self spec];
  [v5 sectionHeaderHeight];
  double v7 = v6;

  return v7;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  return UITableViewAutomaticDimension;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if ([(NPTOBridgeAlbumChooser *)self albumsSection] == (id)a4)
  {
    objc_super v5 = [(NPTOBridgeAlbumChooser *)self _albumsSectionTitle];
  }
  else
  {
    objc_super v5 = 0;
  }

  return v5;
}

- (void)showController:(id)a3
{
}

- (void)showController:(id)a3 animate:(BOOL)a4
{
}

- (void)handleURL:(id)a3 withCompletion:(id)a4
{
}

- (id)readPreferenceValue:(id)a3
{
  return 0;
}

- (void)willBecomeActive
{
}

- (BOOL)canBeShownFromSuspendedState
{
  return 1;
}

- (id)_preferencesAccessor
{
  preferencesAccessor = self->_preferencesAccessor;
  if (!preferencesAccessor)
  {
    id v4 = objc_alloc((Class)NPTOPreferencesAccessor);
    objc_super v5 = [(NPTOBridgeAlbumChooser *)self _device];
    double v6 = (NPTOPreferencesAccessor *)[v4 initWithDevice:v5];
    double v7 = self->_preferencesAccessor;
    self->_preferencesAccessor = v6;

    preferencesAccessor = self->_preferencesAccessor;
  }

  return preferencesAccessor;
}

- (id)_device
{
  v2 = +[NRPairedDeviceRegistry sharedInstance];
  BOOL v3 = +[NRPairedDeviceRegistry activePairedDeviceSelectorBlock];
  id v4 = [v2 getAllDevicesWithArchivedAltAccountDevicesMatching:v3];
  objc_super v5 = [v4 firstObject];

  return v5;
}

- (id)_title
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  BOOL v3 = [v2 localizedStringForKey:@"ALBUM_SPECIFIER_TITLE" value:&stru_C4F0 table:@"NanoPhotosBridgeSettings"];

  return v3;
}

- (id)_noneAlbumName
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  BOOL v3 = [v2 localizedStringForKey:@"ALBUM_NONE" value:&stru_C4F0 table:@"NanoPhotosBridgeSettings"];

  return v3;
}

- (id)_albumsSectionTitle
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  BOOL v3 = [v2 localizedStringForKey:@"ALBUM_ALBUMS_SECTION_TITLE" value:&stru_C4F0 table:@"NanoPhotosBridgeSettings"];

  return v3;
}

- (BOOL)_allowsRecentAlbumSelection
{
  return ![(NPTOBridgeAlbumChooser *)self _isTinkerPaired];
}

- (BOOL)_allowsSharedAlbumSelection
{
  return ![(NPTOBridgeAlbumChooser *)self _isTinkerPaired];
}

- (BOOL)_isTinkerPaired
{
  v2 = [(NPTOBridgeAlbumChooser *)self _device];
  BOOL v3 = [v2 valueForProperty:NRDevicePropertyIsAltAccount];
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (PSController)parentController
{
  return self->_parentController;
}

- (void)setParentController:(id)a3
{
  self->_parentController = (PSController *)a3;
}

- (PSRootController)rootController
{
  return self->_rootController;
}

- (void)setRootController:(id)a3
{
  self->_rootController = (PSRootController *)a3;
}

- (PSSpecifier)specifier
{
  return self->_specifier;
}

- (void)setSpecifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specifier, 0);
  objc_storeStrong((id *)&self->_preferencesAccessor, 0);

  objc_storeStrong(&self->_syncedAlbumIdentifierPreferenceObserver, 0);
}

@end