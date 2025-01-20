@interface NBFamilyListViewController
- (NBFamilyListViewController)initWithDSIDs:(id)a3 excludeStoreIDs:(id)a4;
- (NBSelectAudiobookDelegate)delegate;
- (NSArray)audiobooks;
- (NSSet)dsids;
- (NSSet)excludeStoreIDs;
- (id)_specifierForJaliscoItem:(id)a3;
- (id)specifiers;
- (void)_reloadData;
- (void)setAudiobooks:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDsids:(id)a3;
- (void)setExcludeStoreIDs:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation NBFamilyListViewController

- (NBFamilyListViewController)initWithDSIDs:(id)a3 excludeStoreIDs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)NBFamilyListViewController;
  v8 = [(NBFamilyListViewController *)&v14 init];
  if (v8)
  {
    v9 = (NSSet *)[v6 copy];
    dsids = v8->_dsids;
    v8->_dsids = v9;

    v11 = (NSSet *)[v7 copy];
    excludeStoreIDs = v8->_excludeStoreIDs;
    v8->_excludeStoreIDs = v11;
  }
  return v8;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)NBFamilyListViewController;
  [(NBFamilyListViewController *)&v3 viewDidLoad];
  [(NBFamilyListViewController *)self _reloadData];
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    v5 = +[NSMutableArray array];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v6 = [(NBFamilyListViewController *)self audiobooks];
    id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        v10 = 0;
        do
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = [(NBFamilyListViewController *)self _specifierForJaliscoItem:*(void *)(*((void *)&v15 + 1) + 8 * (void)v10)];
          [v5 addObject:v11];

          v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }

    id v12 = [v5 copy];
    v13 = *(void **)&self->PSListController_opaque[v3];
    *(void *)&self->PSListController_opaque[v3] = v12;

    v4 = *(void **)&self->PSListController_opaque[v3];
  }

  return v4;
}

- (void)_reloadData
{
  uint64_t v3 = +[NBBridgeUtilities isExplicitMaterialAllowed] ^ 1;
  v4 = NBDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = [(NBFamilyListViewController *)self dsids];
    id v6 = [(NBFamilyListViewController *)self excludeStoreIDs];
    int v12 = 138412802;
    v13 = v5;
    __int16 v14 = 2112;
    long long v15 = v6;
    __int16 v16 = 1024;
    int v17 = v3;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Fetching family audiobooks for (%@). Excluding storeIDs:(%@) isExplicitRestricted:(%i)", (uint8_t *)&v12, 0x1Cu);
  }
  id v7 = +[BLJaliscoReadOnlyDAAPClient sharedClient];
  id v8 = [(NBFamilyListViewController *)self dsids];
  uint64_t v9 = [v8 allObjects];
  v10 = [(NBFamilyListViewController *)self excludeStoreIDs];
  v11 = [v7 fetchItemsForDSIDs:v9 excludeStoreIDs:v10 isExplicitRestricted:v3];
  [(NBFamilyListViewController *)self setAudiobooks:v11];

  [(NBFamilyListViewController *)self reloadSpecifiers];
}

- (id)_specifierForJaliscoItem:(id)a3
{
  id v4 = a3;
  v5 = [v4 title];
  id v6 = +[PSSpecifier preferenceSpecifierNamed:v5 target:self set:0 get:0 detail:0 cell:3 edit:0];

  [v6 setProperty:objc_opt_class() forKey:PSCellClassKey];
  id v7 = [v4 title];
  [v6 setProperty:v7 forKey:NMBUISpecifierTitleKey];

  id v8 = [v4 artist];
  [v6 setProperty:v8 forKey:NMBUISpecifierSubtitleKey];

  [v6 setProperty:&off_21A60 forKey:PSTableCellStyleOverrideKey];
  uint64_t v9 = [v4 artworkCatalog];
  [v6 setProperty:v9 forKey:NMBUISpecifierArtworkCatalogKey];

  v10 = +[NBBridgeUtilities audiobookArtworkPlaceholderImage];
  [v6 setProperty:v10 forKey:NMBUISpecifierPlaceholderImageKey];

  v11 = [v4 storeID];

  int v12 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v11 longLongValue]);

  v13 = [(NBFamilyListViewController *)self delegate];
  LODWORD(v10) = [v13 selectAudiobookAdamIdAlreadyPinned:v12];

  if (v10) {
    [v6 setProperty:&__kCFBooleanFalse forKey:PSEnabledKey];
  }

  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 row];
  uint64_t v9 = [(NBFamilyListViewController *)self audiobooks];
  id v10 = [v9 count];

  if (v8 >= v10)
  {
    long long v15 = NBDefaultLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_13E48(self, v7, v15);
    }
    goto LABEL_9;
  }
  objc_opt_class();
  v11 = [(NBFamilyListViewController *)self audiobooks];
  int v12 = objc_msgSend(v11, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
  v13 = BUDynamicCast();

  if (!v13)
  {
    long long v15 = NBDefaultLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_13D90(self, v7, v15);
    }
    goto LABEL_9;
  }
  __int16 v14 = [v13 storeID];
  long long v15 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v14, "nb_uint64_t"));

  if (v15)
  {
    __int16 v16 = [(NBFamilyListViewController *)self delegate];
    [v16 selectAudiobookDidSelectAudiobookWithAdamId:v15];

LABEL_9:
  }
  [v6 deselectRowAtIndexPath:v7 animated:1];
}

- (NBSelectAudiobookDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NBSelectAudiobookDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSSet)dsids
{
  return self->_dsids;
}

- (void)setDsids:(id)a3
{
}

- (NSArray)audiobooks
{
  return self->_audiobooks;
}

- (void)setAudiobooks:(id)a3
{
}

- (NSSet)excludeStoreIDs
{
  return self->_excludeStoreIDs;
}

- (void)setExcludeStoreIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_excludeStoreIDs, 0);
  objc_storeStrong((id *)&self->_audiobooks, 0);
  objc_storeStrong((id *)&self->_dsids, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end