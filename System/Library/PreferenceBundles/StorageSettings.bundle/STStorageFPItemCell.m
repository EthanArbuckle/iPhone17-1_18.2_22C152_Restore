@interface STStorageFPItemCell
+ (id)specifierForFPItem:(id)a3 recurseIntoFolders:(BOOL)a4;
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation STStorageFPItemCell

+ (id)specifierForFPItem:(id)a3 recurseIntoFolders:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  v6 = v5;
  if (v4)
  {
    v7 = [v5 childItemCount];
    id v8 = [v7 longValue];

    if ((uint64_t)v8 <= 0) {
      uint64_t v9 = -1;
    }
    else {
      uint64_t v9 = 2;
    }
  }
  else
  {
    uint64_t v9 = -1;
  }
  v10 = +[PSSpecifier preferenceSpecifierNamed:&stru_2D2C0 target:0 set:0 get:0 detail:0 cell:v9 edit:0];
  [v10 setProperty:objc_opt_class() forKey:PSCellClassKey];
  [v10 setProperty:v6 forKey:STStorageFPItemKey];

  return v10;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)STStorageFPItemCell;
  [(STStorageFPItemCell *)&v18 refreshCellContentsWithSpecifier:v4];
  id v5 = [v4 propertyForKey:STStorageFPItemKey];
  id v6 = objc_alloc((Class)QLThumbnailGenerationRequest);
  ScreenScale();
  id v8 = objc_msgSend(v6, "initWithFPItem:size:scale:representationTypes:", v5, -1, 29.0, 29.0, v7);
  objc_initWeak(&location, self);
  uint64_t v9 = +[QLThumbnailGenerator sharedGenerator];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1DE54;
  v15[3] = &unk_2D240;
  objc_copyWeak(&v16, &location);
  [v9 generateBestRepresentationForRequest:v8 completionHandler:v15];

  v10 = [v5 displayName];
  [(STStorageFPItemCell *)self setTitle:v10];

  v11 = [v5 documentSize];
  -[STStorageFPItemCell setSize:](self, "setSize:", [v11 longLongValue]);

  v12 = [v5 childItemCount];
  if (v12)
  {
    v13 = STStorageLocStr(@"ITEMS_FMT");
    +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v13, [v12 longValue]);
  }
  else
  {
    v13 = [v5 contentModificationDate];
    STFormattedShortDate();
  v14 = };
  [(STStorageFPItemCell *)self setInfo:v14];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

@end