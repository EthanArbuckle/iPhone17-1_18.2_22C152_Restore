@interface STStorageMediaItemCell
+ (id)specifierForMediaItem:(id)a3;
+ (id)specifierForMediaItemCollection:(id)a3;
- (void)refreshCellContentsWithSpecifier:(id)a3;
@end

@implementation STStorageMediaItemCell

+ (id)specifierForMediaItem:(id)a3
{
  id v3 = a3;
  v4 = +[PSSpecifier preferenceSpecifierNamed:&stru_2D2C0 target:0 set:0 get:0 detail:0 cell:-1 edit:0];
  [v4 setProperty:objc_opt_class() forKey:PSCellClassKey];
  v5 = +[NSNumber numberWithBool:1];
  [v4 setProperty:v5 forKey:PSEnabledKey];

  if (v3) {
    [v4 setProperty:v3 forKey:@"stMediaItem"];
  }

  return v4;
}

+ (id)specifierForMediaItemCollection:(id)a3
{
  id v3 = a3;
  v4 = +[PSSpecifier preferenceSpecifierNamed:&stru_2D2C0 target:0 set:0 get:0 detail:0 cell:-1 edit:0];
  [v4 setProperty:objc_opt_class() forKey:PSCellClassKey];
  v5 = +[NSNumber numberWithBool:1];
  [v4 setProperty:v5 forKey:PSEnabledKey];

  if (v3) {
    [v4 setProperty:v3 forKey:@"stMediaCollection"];
  }

  return v4;
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  id v4 = a3;
  v49.receiver = self;
  v49.super_class = (Class)STStorageMediaItemCell;
  [(STStorageMediaItemCell *)&v49 refreshCellContentsWithSpecifier:v4];
  v5 = [v4 propertyForKey:@"stMediaCollection"];
  v6 = v5;
  if (v5)
  {
    v7 = [v5 representativeItem];
    v8 = [v7 albumTitle];
    v9 = (char *)[v7 mediaType];
    if ((uint64_t)v9 <= 511)
    {
      v10 = @"SONGS_FMT";
      switch((unint64_t)v9)
      {
        case 1uLL:
          goto LABEL_31;
        case 2uLL:
          goto LABEL_25;
        case 3uLL:
        case 5uLL:
        case 6uLL:
        case 7uLL:
          goto LABEL_30;
        case 4uLL:
          v10 = @"BOOKS_FMT";
          break;
        case 8uLL:
          goto LABEL_27;
        default:
          if (v9 != (char *)&stru_B8.reserved2) {
            goto LABEL_30;
          }
          v10 = @"MOVIES_FMT";
          break;
      }
      goto LABEL_31;
    }
    if ((uint64_t)v9 > 2047)
    {
      if (v9 == byte_2000)
      {
LABEL_20:
        v10 = @"VIDEOS_FMT";
        goto LABEL_31;
      }
      if (v9 == "rameworks/Preferences.framework/Preferences")
      {
LABEL_27:
        v10 = @"LESSONS_FMT";
        goto LABEL_31;
      }
      if (v9 == (char *)&stru_7E0.vmsize) {
        goto LABEL_20;
      }
LABEL_30:
      v10 = @"ITEMS_FMT";
LABEL_31:
      [(STStorageMediaItemCell *)self setTitle:v8];
      v26 = STStorageLocStr(v10);
      v27 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v26, [v6 count]);
      [(STStorageMediaItemCell *)self setInfo:v27];

      id v12 = [v6 items];
      long long v45 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id v28 = [v12 countByEnumeratingWithState:&v45 objects:v50 count:16];
      if (v28)
      {
        id v29 = v28;
        v36 = v6;
        id v37 = v4;
        v24 = 0;
        uint64_t v30 = *(void *)v46;
        uint64_t v31 = MPMediaItemPropertyFileSize;
        do
        {
          for (i = 0; i != v29; i = (char *)i + 1)
          {
            if (*(void *)v46 != v30) {
              objc_enumerationMutation(v12);
            }
            v33 = [*(id *)(*((void *)&v45 + 1) + 8 * i) valueForProperty:v31];
            v24 = &v24[(void)[v33 unsignedLongLongValue]];
          }
          id v29 = [v12 countByEnumeratingWithState:&v45 objects:v50 count:16];
        }
        while (v29);
        v6 = v36;
        id v4 = v37;
      }
      else
      {
        v24 = 0;
      }
      goto LABEL_40;
    }
    if (v9 != &stru_1F8.sectname[8])
    {
      if (v9 != (char *)&stru_3D8.fileoff) {
        goto LABEL_30;
      }
LABEL_25:
      uint64_t v25 = [v7 podcastTitle];

      v8 = (void *)v25;
    }
    v10 = @"EPISODES_FMT";
    goto LABEL_31;
  }
  v7 = [v4 propertyForKey:@"stMediaItem"];
  v11 = [v7 title];
  [(STStorageMediaItemCell *)self setTitle:v11];

  v8 = [v7 assetURL];
  id v44 = 0;
  [v8 getResourceValue:&v44 forKey:NSURLCreationDateKey error:0];
  id v12 = v44;
  id v43 = 0;
  [v8 getResourceValue:&v43 forKey:NSURLContentAccessDateKey error:0];
  id v13 = v43;
  if (v13)
  {
    uint64_t v14 = [v12 laterDate:v13];

    id v12 = (id)v14;
  }
  id v42 = 0;
  [v8 getResourceValue:&v42 forKey:NSURLAttributeModificationDateKey error:0];
  id v15 = v42;

  if (v15)
  {
    uint64_t v16 = [v12 laterDate:v15];

    id v12 = (id)v16;
  }
  id v41 = 0;
  [v8 getResourceValue:&v41 forKey:NSURLAttributeModificationDateKey error:0];
  id v17 = v41;

  if (v17)
  {
    uint64_t v18 = [v12 laterDate:v17];

    id v12 = (id)v18;
  }
  if (!v12 || ([v12 timeIntervalSinceReferenceDate], v19 == 0.0))
  {
    v22 = 0;
  }
  else
  {
    if (qword_3A4F0 != -1) {
      dispatch_once(&qword_3A4F0, &stru_2CA48);
    }
    id v20 = (id)qword_3A4E8;
    v21 = STFormattedShortDate();
    v22 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v20, v21);
  }
  [(STStorageMediaItemCell *)self setInfo:v22];
  v23 = [v7 valueForProperty:MPMediaItemPropertyFileSize];
  v24 = (char *)[v23 unsignedLongLongValue];

LABEL_40:
  [(STStorageMediaItemCell *)self setSize:v24];
  v34 = dispatch_get_global_queue(25, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_3FC8;
  block[3] = &unk_2CA28;
  id v39 = v7;
  v40 = self;
  id v35 = v7;
  dispatch_async(v34, block);
}

@end