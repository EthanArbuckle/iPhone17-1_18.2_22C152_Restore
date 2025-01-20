@interface CLPhotosController
- (BOOL)_isSharedAlbumSpecifierSelected:(id)a3;
- (CLPhotosController)init;
- (NSArray)sharedAlbums;
- (id)_loadSharedAlbumsLocalIdentifiers;
- (id)_sharedAlbumIdentifierFromSpecifier:(id)a3;
- (id)_sharedAlbumSpecifiers;
- (id)isIncludeSharedAlbumsEnabled:(id)a3;
- (id)specifiers;
- (int64_t)tableViewStyle;
- (void)setIncludeSharedAlbumsEnabled:(id)a3 specifier:(id)a4;
- (void)setSharedAlbums:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation CLPhotosController

- (CLPhotosController)init
{
  v7.receiver = self;
  v7.super_class = (Class)CLPhotosController;
  v2 = [(CLPhotosController *)&v7 initWithNibName:0 bundle:0];
  if (v2)
  {
    v3 = +[CLPhotosUtilities sharedInstance];
    uint64_t v4 = [v3 sharedAlbums];
    sharedAlbums = v2->_sharedAlbums;
    v2->_sharedAlbums = (NSArray *)v4;
  }
  return v2;
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)CLPhotosController;
  [(CLPhotosController *)&v6 viewDidLoad];
  v3 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v4 = [v3 localizedStringForKey:@"PHOTOS" value:&stru_CBA0 table:@"CLPhotosController"];
  v5 = [(CLPhotosController *)self navigationItem];
  [v5 setTitle:v4];
}

- (id)_loadSharedAlbumsLocalIdentifiers
{
  uint64_t v6 = 0;
  objc_super v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_44BC;
  v10 = sub_44CC;
  id v11 = (id)objc_opt_new();
  v2 = +[PHAssetCollection fetchAssetCollectionsWithType:1 subtype:101 options:0];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_44D4;
  v5[3] = &unk_C788;
  v5[4] = &v6;
  [v2 enumerateObjectsUsingBlock:v5];

  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  uint64_t v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    v5 = [(CLPhotosController *)self loadSpecifiersFromPlistName:@"CLPhotosController" target:self];
    uint64_t v6 = +[CLFPhotosSettings sharedInstance];
    unsigned int v7 = [v6 includeSharedAlbums];

    if (v7)
    {
      uint64_t v8 = [(CLPhotosController *)self _sharedAlbumSpecifiers];
      [v5 addObjectsFromArray:v8];
    }
    id v9 = [v5 copy];
    v10 = *(void **)&self->PSListController_opaque[v3];
    *(void *)&self->PSListController_opaque[v3] = v9;

    uint64_t v4 = *(void **)&self->PSListController_opaque[v3];
  }

  return v4;
}

- (id)_sharedAlbumSpecifiers
{
  uint64_t v3 = +[NSMutableArray array];
  if ([(NSArray *)self->_sharedAlbums count])
  {
    uint64_t v4 = v3;
    v5 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v6 = [v5 localizedStringForKey:@"SHARED_ALBUMS_HEADER" value:&stru_CBA0 table:@"CLPhotosController"];
    uint64_t v7 = +[PSSpecifier groupSpecifierWithName:v6];

    uint64_t v3 = v4;
    v19 = v7;
    [v4 addObject:v7];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    obj = self->_sharedAlbums;
    id v8 = [(NSArray *)obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v23;
      uint64_t v11 = PSTitleKey;
      uint64_t v12 = PSCellClassKey;
      uint64_t v20 = PSAccessoryKey;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v23 != v10) {
            objc_enumerationMutation(obj);
          }
          v14 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          v15 = [v14 title];
          v16 = +[PSSpecifier preferenceSpecifierNamed:v15 target:self set:0 get:0 detail:0 cell:4 edit:0];
          [v16 setProperty:v15 forKey:v11];
          [v16 setProperty:v14 forKey:@"sharedAlbumIdentifier"];
          [v16 setProperty:objc_opt_class() forKey:v12];
          if ([(CLPhotosController *)self _isSharedAlbumSpecifierSelected:v16]) {
            [v16 setProperty:&off_CC60 forKey:v20];
          }
          uint64_t v3 = v4;
          [v4 addObject:v16];
        }
        id v9 = [(NSArray *)obj countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v9);
    }

    v17 = v19;
  }
  else
  {
    v17 = CLFLogCommon();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, "No shared albums found.", buf, 2u);
    }
  }

  return v3;
}

- (id)_sharedAlbumIdentifierFromSpecifier:(id)a3
{
  uint64_t v3 = [a3 propertyForKey:@"sharedAlbumIdentifier"];
  uint64_t v4 = [v3 cloudIdentifier];

  return v4;
}

- (BOOL)_isSharedAlbumSpecifierSelected:(id)a3
{
  uint64_t v3 = [(CLPhotosController *)self _sharedAlbumIdentifierFromSpecifier:a3];
  if (v3)
  {
    uint64_t v4 = +[CLFPhotosSettings sharedInstance];
    v5 = [v4 selectedSharedAlbumCloudIdentifiers];
    unsigned __int8 v6 = [v5 containsObject:v3];
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (id)isIncludeSharedAlbumsEnabled:(id)a3
{
  uint64_t v3 = +[CLFPhotosSettings sharedInstance];
  uint64_t v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v3 includeSharedAlbums]);

  return v4;
}

- (void)setIncludeSharedAlbumsEnabled:(id)a3 specifier:(id)a4
{
  id v5 = [a3 BOOLValue];
  unsigned __int8 v6 = +[CLFPhotosSettings sharedInstance];
  [v6 setIncludeSharedAlbums:v5];

  [(CLPhotosController *)self reloadSpecifiers];
}

- (int64_t)tableViewStyle
{
  return 2;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)CLPhotosController;
  [(CLPhotosController *)&v19 tableView:v6 didSelectRowAtIndexPath:v7];
  id v8 = [(CLPhotosController *)self specifierAtIndexPath:v7];
  id v9 = [(CLPhotosController *)self _sharedAlbumIdentifierFromSpecifier:v8];
  uint64_t v10 = CLFLogCommon();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_8F08((uint64_t)v7, (uint64_t)v9, v10);
  }

  if (v9)
  {
    uint64_t v11 = [v6 cellForRowAtIndexPath:v7];
    uint64_t v12 = +[CLFPhotosSettings sharedInstance];
    v13 = [v12 selectedSharedAlbumCloudIdentifiers];
    id v14 = [v13 mutableCopy];

    LODWORD(v13) = [v14 containsObject:v9];
    v15 = CLFLogCommon();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
    if (v13)
    {
      if (v16)
      {
        *(_DWORD *)buf = 138412290;
        id v21 = v9;
        _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "Removing shared album identifier: %@", buf, 0xCu);
      }

      [v11 setAccessoryType:0];
      [v14 removeObject:v9];
    }
    else
    {
      if (v16)
      {
        *(_DWORD *)buf = 138412290;
        id v21 = v9;
        _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "Adding shared album identifier: %@", buf, 0xCu);
      }

      [v11 setAccessoryType:3];
      [v14 addObject:v9];
    }
    v17 = CLFLogCommon();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v14;
      _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, "Updated shared album identifiers: %@", buf, 0xCu);
    }

    v18 = +[CLFPhotosSettings sharedInstance];
    [v18 setSelectedSharedAlbumCloudIdentifiers:v14];
  }
}

- (NSArray)sharedAlbums
{
  return self->_sharedAlbums;
}

- (void)setSharedAlbums:(id)a3
{
}

- (void).cxx_destruct
{
}

@end