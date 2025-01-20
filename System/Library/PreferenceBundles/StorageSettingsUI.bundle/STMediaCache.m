@interface STMediaCache
+ (id)mediaTypesForIdentifier:(id)a3;
+ (id)sharedCache;
- (NSMutableDictionary)mediaCache;
- (id)cacheItemForQuery:(id)a3 withGroupingType:(int64_t)a4;
- (id)cacheItemForQuery:(id)a3 withGroupingType:(int64_t)a4 splitByPropertyName:(id)a5 defaultPropertyValue:(id)a6;
- (id)mediaCollectionForKey:(id)a3;
- (id)mediaSpecifiersForApp:(id)a3;
- (id)mediaSpecifiersForIdentifier:(id)a3;
- (id)mediaTypesForStorageApp:(id)a3;
- (id)size:(id)a3;
- (unint64_t)totalSizeForApp:(id)a3;
- (void)reload;
- (void)setMediaCache:(id)a3;
@end

@implementation STMediaCache

+ (id)sharedCache
{
  if (qword_A4BF8 != -1) {
    dispatch_once(&qword_A4BF8, &stru_965F8);
  }
  v2 = (void *)qword_A4BF0;

  return v2;
}

+ (id)mediaTypesForIdentifier:(id)a3
{
  uint64_t v3 = qword_A4C08;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_A4C08, &stru_96618);
  }
  v5 = [(id)qword_A4C00 objectForKey:v4];

  return v5;
}

- (id)mediaTypesForStorageApp:(id)a3
{
  uint64_t v3 = [a3 appIdentifier];
  id v4 = +[STMediaCache mediaTypesForIdentifier:v3];

  return v4;
}

- (id)cacheItemForQuery:(id)a3 withGroupingType:(int64_t)a4 splitByPropertyName:(id)a5 defaultPropertyValue:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  v12 = objc_alloc_init(STUsageMediaCollection);
  v13 = +[MPMediaPropertyPredicate predicateWithValue:&__kCFBooleanTrue forProperty:MPMediaItemPropertyIsLocal];
  [v9 addFilterPredicate:v13];

  [v9 setGroupingType:a4];
  id v14 = [v9 collections];
  if ([v14 count])
  {
    id v15 = [v10 length];
    v54 = v12;
    id v56 = v9;
    id v64 = v11;
    id v65 = v10;
    if (v11 && v15)
    {
      v16 = +[NSMutableArray array];
      long long v82 = 0u;
      long long v83 = 0u;
      long long v84 = 0u;
      long long v85 = 0u;
      id obj = v14;
      id v60 = [obj countByEnumeratingWithState:&v82 objects:v90 count:16];
      if (v60)
      {
        id v58 = *(id *)v83;
        do
        {
          uint64_t v17 = 0;
          do
          {
            if (*(id *)v83 != v58) {
              objc_enumerationMutation(obj);
            }
            uint64_t v62 = v17;
            v18 = *(void **)(*((void *)&v82 + 1) + 8 * v17);
            v19 = +[NSMutableDictionary dictionary];
            v20 = [v18 items];
            long long v78 = 0u;
            long long v79 = 0u;
            long long v80 = 0u;
            long long v81 = 0u;
            id v21 = [v20 countByEnumeratingWithState:&v78 objects:v89 count:16];
            if (v21)
            {
              id v22 = v21;
              uint64_t v23 = *(void *)v79;
              do
              {
                for (i = 0; i != v22; i = (char *)i + 1)
                {
                  if (*(void *)v79 != v23) {
                    objc_enumerationMutation(v20);
                  }
                  v25 = *(void **)(*((void *)&v78 + 1) + 8 * i);
                  uint64_t v26 = [v25 valueForProperty:v65];
                  v27 = (void *)v26;
                  v28 = v64;
                  if (v26) {
                    v28 = (void *)v26;
                  }
                  id v29 = v28;

                  v30 = [v19 objectForKey:v29];
                  v31 = v30;
                  if (v30)
                  {
                    [v30 addObject:v25];
                  }
                  else
                  {
                    v32 = +[NSMutableArray arrayWithObject:v25];
                    [v19 setObject:v32 forKey:v29];
                  }
                }
                id v22 = [v20 countByEnumeratingWithState:&v78 objects:v89 count:16];
              }
              while (v22);
            }
            v33 = [v19 allKeys];
            long long v74 = 0u;
            long long v75 = 0u;
            long long v76 = 0u;
            long long v77 = 0u;
            id v34 = [v33 countByEnumeratingWithState:&v74 objects:v88 count:16];
            if (v34)
            {
              id v35 = v34;
              uint64_t v36 = *(void *)v75;
              do
              {
                for (j = 0; j != v35; j = (char *)j + 1)
                {
                  if (*(void *)v75 != v36) {
                    objc_enumerationMutation(v33);
                  }
                  v38 = [v19 objectForKey:*(void *)(*((void *)&v74 + 1) + 8 * (void)j)];
                  v39 = +[MPMediaItemCollection collectionWithItems:v38];
                  [v16 addObject:v39];
                }
                id v35 = [v33 countByEnumeratingWithState:&v74 objects:v88 count:16];
              }
              while (v35);
            }

            uint64_t v17 = v62 + 1;
          }
          while ((id)(v62 + 1) != v60);
          id v60 = [obj countByEnumeratingWithState:&v82 objects:v90 count:16];
        }
        while (v60);
      }
    }
    else
    {
      v16 = v14;
    }
    v63 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v16, "count", v54));
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    id v14 = v16;
    id v40 = [v14 countByEnumeratingWithState:&v70 objects:v87 count:16];
    if (v40)
    {
      id v41 = v40;
      uint64_t v42 = 0;
      uint64_t v61 = *(void *)v71;
      uint64_t v43 = MPMediaItemPropertyFileSize;
      id v59 = v14;
      do
      {
        for (k = 0; k != v41; k = (char *)k + 1)
        {
          if (*(void *)v71 != v61) {
            objc_enumerationMutation(v59);
          }
          v45 = [*(id *)(*((void *)&v70 + 1) + 8 * (void)k) items];
          long long v66 = 0u;
          long long v67 = 0u;
          long long v68 = 0u;
          long long v69 = 0u;
          id v46 = [v45 countByEnumeratingWithState:&v66 objects:v86 count:16];
          if (v46)
          {
            id v47 = v46;
            uint64_t v48 = 0;
            uint64_t v49 = *(void *)v67;
            do
            {
              for (m = 0; m != v47; m = (char *)m + 1)
              {
                if (*(void *)v67 != v49) {
                  objc_enumerationMutation(v45);
                }
                v51 = [*(id *)(*((void *)&v66 + 1) + 8 * (void)m) valueForProperty:v43];
                v48 += (uint64_t)[v51 longLongValue];
              }
              id v47 = [v45 countByEnumeratingWithState:&v66 objects:v86 count:16];
            }
            while (v47);
          }
          else
          {
            uint64_t v48 = 0;
          }
          v42 += v48;
          v52 = +[NSNumber numberWithLongLong:v48];
          [v63 addObject:v52];
        }
        id v14 = v59;
        id v41 = [v59 countByEnumeratingWithState:&v70 objects:v87 count:16];
      }
      while (v41);
    }
    else
    {
      uint64_t v42 = 0;
    }

    v12 = v55;
    [(STUsageMediaCollection *)v55 setGrouped:1];
    [(STUsageMediaCollection *)v55 setItems:v14];
    [(STUsageMediaCollection *)v55 setTotalSize:v42];
    [(STUsageMediaCollection *)v55 setItemSizes:v63];

    id v9 = v56;
    id v11 = v64;
    id v10 = v65;
  }

  return v12;
}

- (id)cacheItemForQuery:(id)a3 withGroupingType:(int64_t)a4
{
  return [(STMediaCache *)self cacheItemForQuery:a3 withGroupingType:a4 splitByPropertyName:0 defaultPropertyValue:0];
}

- (NSMutableDictionary)mediaCache
{
  mediaCache = self->_mediaCache;
  if (!mediaCache)
  {
    id v4 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v5 = self->_mediaCache;
    self->_mediaCache = v4;

    +[MPMediaQuery setFilteringDisabled:1];
    v6 = +[MPMediaLibrary deviceMediaLibrary];
    v7 = [v6 libraryDataProvider];
    +[MPMediaLibrary reloadDynamicPropertiesForLibraryDataProvider:v7];

    v8 = +[MPMediaQuery ITunesUAudioQuery];
    id v9 = [(STMediaCache *)self cacheItemForQuery:v8 withGroupingType:8];

    [(NSMutableDictionary *)self->_mediaCache setObject:v9 forKey:UsageMediaAudioCourses];
    id v10 = +[MPMediaQuery videoITunesUQuery];
    id v11 = [(STMediaCache *)self cacheItemForQuery:v10 withGroupingType:8];

    [(NSMutableDictionary *)self->_mediaCache setObject:v11 forKey:UsageMediaVideoCourses];
    v12 = +[MPMediaQuery audioPodcastsQuery];
    v13 = [(STMediaCache *)self cacheItemForQuery:v12 withGroupingType:8];

    [(NSMutableDictionary *)self->_mediaCache setObject:v13 forKey:UsageMediaAudioPodcasts];
    id v14 = +[MPMediaQuery videoPodcastsQuery];
    id v15 = [(STMediaCache *)self cacheItemForQuery:v14 withGroupingType:8];

    [(NSMutableDictionary *)self->_mediaCache setObject:v15 forKey:UsageMediaVideoPodcasts];
    v16 = +[MPMediaQuery audiobooksQuery];
    uint64_t v17 = [(STMediaCache *)self cacheItemForQuery:v16 withGroupingType:10 splitByPropertyName:MPMediaItemPropertyStorePlaylistID defaultPropertyValue:&off_9A5A0];

    [(NSMutableDictionary *)self->_mediaCache setObject:v17 forKey:UsageMediaAudioBooks];
    v18 = +[MPMediaQuery tvShowsQuery];
    v19 = [(STMediaCache *)self cacheItemForQuery:v18 withGroupingType:8];

    [(NSMutableDictionary *)self->_mediaCache setObject:v19 forKey:UsageMediaTVShows];
    mediaCache = self->_mediaCache;
  }

  return mediaCache;
}

- (id)mediaCollectionForKey:(id)a3
{
  id v4 = a3;
  v5 = [(STMediaCache *)self mediaCache];
  v6 = [v5 objectForKey:v4];

  return v6;
}

- (id)size:(id)a3
{
  id v3 = a3;
  id v4 = [v3 propertyForKey:@"stMediaCollection"];
  v5 = v4;
  if (v4)
  {
    v6 = [v4 items];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v7)
    {
      id v8 = v7;
      id v9 = 0;
      uint64_t v10 = *(void *)v19;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v6);
          }
          v12 = [*(id *)(*((void *)&v18 + 1) + 8 * i) assetURL];
          id v17 = 0;
          [v12 getResourceValue:&v17 forKey:NSURLFileSizeKey error:0];
          id v9 = &v9[(void)[v17 unsignedLongLongValue]];
        }
        id v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v8);
    }
    else
    {
      id v9 = 0;
    }
  }
  else
  {
    v6 = [v3 propertyForKey:@"stMediaItem"];
    v13 = [v6 assetURL];
    id v16 = 0;
    [v13 getResourceValue:&v16 forKey:NSURLFileSizeKey error:0];
    id v9 = (char *)[v16 unsignedLongLongValue];
  }
  if (v9)
  {
    STFormattedSize();
    id v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v14 = &stru_98A78;
  }

  return v14;
}

- (id)mediaSpecifiersForIdentifier:(id)a3
{
  id v4 = a3;
  v5 = +[NSMutableArray arrayWithCapacity:7];
  v6 = +[STMediaCache mediaTypesForIdentifier:v4];
  if ([v6 count])
  {
    id v45 = v4;
    if (!self->_mediaGroupsByKind)
    {
      id v7 = +[NSMutableDictionary dictionaryWithCapacity:7];
      mediaGroupsByKind = self->_mediaGroupsByKind;
      self->_mediaGroupsByKind = v7;
    }
    v71[0] = _NSConcreteStackBlock;
    v71[1] = 3221225472;
    v71[2] = sub_E908;
    v71[3] = &unk_96578;
    v71[4] = self;
    v44 = v6;
    id v9 = [v6 sortedArrayUsingComparator:v71];
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    id v57 = [v9 countByEnumeratingWithState:&v67 objects:v74 count:16];
    if (v57)
    {
      uint64_t v10 = *(void *)v68;
      uint64_t v56 = UsageGroupSpecifiers;
      uint64_t v51 = UsageGroupShowAll;
      uint64_t v46 = UsageGroupShowAllSpecifier;
      uint64_t v48 = MPMediaItemPropertyFileSize;
      uint64_t v47 = UsageGroupMediaType;
      uint64_t v11 = UsageMediaKindKey;
      uint64_t v54 = *(void *)v68;
      v55 = v9;
      uint64_t v49 = self;
      v50 = v5;
      do
      {
        for (i = 0; i != v57; i = (char *)i + 1)
        {
          if (*(void *)v68 != v10) {
            objc_enumerationMutation(v9);
          }
          uint64_t v13 = *(void *)(*((void *)&v67 + 1) + 8 * i);
          id v58 = [(STMediaCache *)self mediaCollectionForKey:v13];
          id v14 = [v58 items];
          id v15 = [v14 count];

          if (v15)
          {
            id v16 = [(NSMutableDictionary *)self->_mediaGroupsByKind objectForKey:v13];
            if (v16)
            {
              id v17 = v16;
              long long v18 = [v16 objectForKey:v56];
              id v19 = [v18 count];
              if (v19)
              {
                unint64_t v20 = (unint64_t)v19;
                long long v21 = v5;
                id v22 = v18;
                uint64_t v23 = [v17 objectForKey:v51];
                if ([v23 BOOLValue])
                {

                  v24 = 0;
                  goto LABEL_26;
                }
                v24 = [v17 objectForKey:v46];

                if (v20 < 6)
                {
LABEL_26:
                  long long v18 = v22;
                }
                else
                {
                  long long v18 = v22;
                  if (v24)
                  {
                    uint64_t v36 = objc_msgSend(v22, "subarrayWithRange:", 0, 6);
                    v5 = v21;
                    [v21 addObjectsFromArray:v36];

                    [v21 addObject:v24];
                    goto LABEL_36;
                  }
                }
                v5 = v21;
                [v21 addObjectsFromArray:v18];
LABEL_36:
                id v9 = v55;

                uint64_t v10 = v54;
              }

              goto LABEL_38;
            }
            [v58 sortItemsByMediaKey:v48];
            v25 = [v58 items];
            uint64_t v26 = +[NSMutableDictionary dictionaryWithCapacity:4];
            v24 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", (char *)[v25 count] + 1);
            [v26 setObject:v24 forKey:v56];
            unsigned int v27 = [v58 isGrouped];
            char v28 = v27;
            id v29 = +[NSNumber numberWithUnsignedInt:v27 ^ 1];
            v53 = v26;
            [v26 setObject:v29 forKey:v47];

            v52 = v25;
            if (v28)
            {
              long long v61 = 0uLL;
              long long v62 = 0uLL;
              long long v59 = 0uLL;
              long long v60 = 0uLL;
              id v30 = v25;
              id v31 = [v30 countByEnumeratingWithState:&v59 objects:v72 count:16];
              if (v31)
              {
                id v32 = v31;
                uint64_t v33 = *(void *)v60;
                do
                {
                  for (j = 0; j != v32; j = (char *)j + 1)
                  {
                    if (*(void *)v60 != v33) {
                      objc_enumerationMutation(v30);
                    }
                    id v35 = +[STStorageMediaItemCell specifierForMediaItemCollection:*(void *)(*((void *)&v59 + 1) + 8 * (void)j)];
                    [v35 setProperty:v13 forKey:v11];
                    [v24 addObject:v35];
                  }
                  id v32 = [v30 countByEnumeratingWithState:&v59 objects:v72 count:16];
                }
                while (v32);
              }
            }
            else
            {
              long long v65 = 0uLL;
              long long v66 = 0uLL;
              long long v63 = 0uLL;
              long long v64 = 0uLL;
              id v37 = v25;
              id v38 = [v37 countByEnumeratingWithState:&v63 objects:v73 count:16];
              if (v38)
              {
                id v39 = v38;
                uint64_t v40 = *(void *)v64;
                do
                {
                  for (k = 0; k != v39; k = (char *)k + 1)
                  {
                    if (*(void *)v64 != v40) {
                      objc_enumerationMutation(v37);
                    }
                    uint64_t v42 = +[STStorageMediaItemCell specifierForMediaItem:*(void *)(*((void *)&v63 + 1) + 8 * (void)k)];
                    [v42 setProperty:v13 forKey:v11];
                    [v24 addObject:v42];
                  }
                  id v39 = [v37 countByEnumeratingWithState:&v63 objects:v73 count:16];
                }
                while (v39);
              }
            }
            long long v18 = v52;

            v5 = v50;
            [v50 addObjectsFromArray:v24];
            self = v49;
            id v17 = v53;
            [(NSMutableDictionary *)v49->_mediaGroupsByKind setObject:v53 forKey:v13];
            goto LABEL_36;
          }
LABEL_38:
        }
        id v57 = [v9 countByEnumeratingWithState:&v67 objects:v74 count:16];
      }
      while (v57);
    }

    v6 = v44;
    id v4 = v45;
  }

  return v5;
}

- (unint64_t)totalSizeForApp:(id)a3
{
  id v4 = [(STMediaCache *)self mediaTypesForStorageApp:a3];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    unint64_t v7 = 0;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = [(STMediaCache *)self mediaCollectionForKey:*(void *)(*((void *)&v12 + 1) + 8 * i)];
        v7 += (unint64_t)[v10 totalSize];
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (id)mediaSpecifiersForApp:(id)a3
{
  id v4 = [a3 appIdentifier];
  id v5 = [(STMediaCache *)self mediaSpecifiersForIdentifier:v4];

  return v5;
}

- (void)reload
{
  mediaCache = self->_mediaCache;
  self->_mediaCache = 0;

  mediaGroupsByKind = self->_mediaGroupsByKind;
  self->_mediaGroupsByKind = 0;

  id v5 = [(STMediaCache *)self mediaCache];
  id v6 = +[STStorageDataNotifier sharedNotifier];
  [v6 postMediaSizesChanged];
}

- (void)setMediaCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaCache, 0);
  objc_storeStrong((id *)&self->_mediaGroupsByKind, 0);

  objc_storeStrong((id *)&self->_mediaDict, 0);
}

@end