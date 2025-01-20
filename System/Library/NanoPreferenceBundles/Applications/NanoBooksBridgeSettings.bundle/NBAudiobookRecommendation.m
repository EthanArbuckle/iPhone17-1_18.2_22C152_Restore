@interface NBAudiobookRecommendation
+ (id)_missingArtImage;
+ (void)_fillArtworkMutableArray:(id)a3 toCount:(unint64_t)a4;
- (BOOL)isSelected;
- (MPArtworkCatalog)artworkCatalog;
- (NBAudiobookRecommendation)initWithAdamIDs:(id)a3 type:(unint64_t)a4;
- (NSArray)adamIDs;
- (NSDate)lastModifiedDate;
- (NSString)subtitle;
- (NSString)title;
- (id)_artworkCatalogsForAdamIDs:(id)a3;
- (id)_debugStringForType:(unint64_t)a3;
- (id)_tiledArtworkRequestForAdamIDs:(id)a3;
- (id)description;
- (unint64_t)type;
- (void)setSelected:(BOOL)a3;
@end

@implementation NBAudiobookRecommendation

- (NBAudiobookRecommendation)initWithAdamIDs:(id)a3 type:(unint64_t)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NBAudiobookRecommendation;
  v7 = [(NBAudiobookRecommendation *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_type = a4;
    v7->_selected = 1;
    v9 = (NSArray *)[v6 copy];
    adamIDs = v8->_adamIDs;
    v8->_adamIDs = v9;
  }
  return v8;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (NSString)title
{
  unint64_t type = self->_type;
  if (type == 1)
  {
    v3 = NBBundle();
    v4 = v3;
    CFStringRef v5 = @"Want to Read";
    goto LABEL_5;
  }
  if (!type)
  {
    v3 = NBBundle();
    v4 = v3;
    CFStringRef v5 = @"Continue";
LABEL_5:
    id v6 = [v3 localizedStringForKey:v5 value:&stru_20DD8 table:&stru_20DD8];

    goto LABEL_7;
  }
  id v6 = 0;
LABEL_7:

  return (NSString *)v6;
}

- (NSString)subtitle
{
  unint64_t type = self->_type;
  if (type == 1)
  {
    v3 = NBBundle();
    v4 = v3;
    CFStringRef v5 = @"Audiobooks to listen to next";
    goto LABEL_5;
  }
  if (!type)
  {
    v3 = NBBundle();
    v4 = v3;
    CFStringRef v5 = @"Audiobooks you\\U2019re listening to";
LABEL_5:
    id v6 = [v3 localizedStringForKey:v5 value:&stru_20DD8 table:&stru_20DD8];

    goto LABEL_7;
  }
  id v6 = 0;
LABEL_7:

  return (NSString *)v6;
}

- (MPArtworkCatalog)artworkCatalog
{
  if (!self->_artworkCatalog)
  {
    v3 = [(NBAudiobookRecommendation *)self adamIDs];
    id v4 = [v3 count];

    if (v4)
    {
      CFStringRef v5 = [(NBAudiobookRecommendation *)self adamIDs];
      id v6 = [v5 count];

      v7 = [(NBAudiobookRecommendation *)self adamIDs];
      v8 = v7;
      if ((unint64_t)v6 < 4)
      {
        v14 = [v7 firstObject];
        v22 = v14;
        v15 = +[NSArray arrayWithObjects:&v22 count:1];
        v16 = [(NBAudiobookRecommendation *)self _artworkCatalogsForAdamIDs:v15];
        v17 = [v16 firstObject];
        artworkCatalog = self->_artworkCatalog;
        self->_artworkCatalog = v17;
      }
      else
      {
        v9 = [(NBAudiobookRecommendation *)self _tiledArtworkRequestForAdamIDs:v7];

        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_7C44;
        v21[3] = &unk_209D8;
        v21[4] = self;
        [v9 setArtworkCatalogsBlock:v21];
        id v10 = objc_alloc((Class)MPArtworkCatalog);
        v11 = +[MPTiledArtworkDataSource sharedDataSource];
        objc_super v12 = (MPArtworkCatalog *)[v10 initWithToken:v9 dataSource:v11];
        v13 = self->_artworkCatalog;
        self->_artworkCatalog = v12;

        v8 = v9;
      }
    }
  }
  v19 = self->_artworkCatalog;

  return v19;
}

+ (id)_missingArtImage
{
  v2 = +[UIColor systemGrayColor];
  v6.width = 1.0;
  v6.height = 1.0;
  UIGraphicsBeginImageContextWithOptions(v6, 1, 0.0);
  [v2 setFill];
  v7.origin.x = 0.0;
  v7.origin.y = 0.0;
  v7.size.width = 1.0;
  v7.size.height = 1.0;
  UIRectFill(v7);
  v3 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v3;
}

+ (void)_fillArtworkMutableArray:(id)a3 toCount:(unint64_t)a4
{
  id v5 = a3;
  if ((unint64_t)[v5 count] < a4)
  {
    CGSize v6 = [(id)objc_opt_class() _missingArtImage];
    CGRect v7 = +[MPArtworkCatalog staticArtworkCatalogWithImage:v6];

    v8 = NBRecommendationsLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = 134218240;
      id v10 = [v5 count];
      __int16 v11 = 2048;
      unint64_t v12 = a4;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "Filling tiled artwork catalog %tu -> %tu", (uint8_t *)&v9, 0x16u);
    }

    while ((unint64_t)[v5 count] < a4)
      [v5 addObject:v7];
  }
}

- (id)_artworkCatalogsForAdamIDs:(id)a3
{
  id v3 = a3;
  +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_7F5C;
  v6[3] = &unk_20A00;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = v4;
  [v3 enumerateAdamIDsUsingBlock:v6];

  return v4;
}

- (id)_tiledArtworkRequestForAdamIDs:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)MPTiledArtworkRequest);
  [v5 setTileSpacing:2.0];
  if ((unint64_t)[v4 count] <= 3) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = 2;
  }
  [v5 setNumberOfRows:v6];
  [v5 setNumberOfColumns:v6];
  id v7 = +[NSNumber numberWithUnsignedInteger:[(NBAudiobookRecommendation *)self type]];
  [v5 setEntityIdentifier:v7];

  [v5 setNamespaceIdentifier:NBRecommendationTiledArtworkNamespace];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v4;
  id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = 0;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v8);
        }
        v11 += (uint64_t)objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "hash", (void)v16);
      }
      id v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }
  else
  {
    uint64_t v11 = 0;
  }

  v14 = +[NSNumber numberWithUnsignedInteger:v11];
  [v5 setRevisionIdentifier:v14];

  return v5;
}

- (id)_debugStringForType:(unint64_t)a3
{
  CFStringRef v3 = @"Unknown";
  if (a3 == 1) {
    CFStringRef v3 = @"Want to Read";
  }
  if (a3) {
    return (id)v3;
  }
  else {
    return @"Reading Now";
  }
}

- (id)description
{
  CFStringRef v3 = [(NBAudiobookRecommendation *)self title];
  id v4 = [(NBAudiobookRecommendation *)self subtitle];
  id v5 = [(NBAudiobookRecommendation *)self _debugStringForType:[(NBAudiobookRecommendation *)self type]];
  uint64_t v6 = +[NSString stringWithFormat:@"%@ - %@ (type = %@, count = %lu, selected = %ld)", v3, v4, v5, [(NSArray *)self->_adamIDs count], self->_selected];

  return v6;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (NSDate)lastModifiedDate
{
  return self->_lastModifiedDate;
}

- (NSArray)adamIDs
{
  return self->_adamIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adamIDs, 0);
  objc_storeStrong((id *)&self->_lastModifiedDate, 0);

  objc_storeStrong((id *)&self->_artworkCatalog, 0);
}

@end