@interface BLCacheDelete
- (BLCacheDelete)init;
- (BLLibrary)library;
- (BOOL)isMultiUser;
- (id)_duplicateStoreBooksInPlist:(id)a3 inVolume:(id)a4;
- (id)_duplicatedPurchasedBooksInVolume:(id)a3;
- (id)_initWithLibrary:(id)a3 multiUser:(BOOL)a4;
- (id)_orphanedBookURLs:(id)a3 inVolume:(id)a4;
- (id)_orphanedPurchasedBookURLsInVolume:(id)a3;
- (id)_orphanedSharedBookURLsInVolume:(id)a3;
- (id)_scoreBooksInVolume:(id)a3;
- (id)purchasedPlist;
- (id)sharedPlist;
- (int64_t)periodicPurgeVolume:(id)a3 urgency:(int64_t)a4 requested:(id)a5;
- (int64_t)purgeVolume:(id)a3 urgency:(int64_t)a4 requested:(id)a5;
- (int64_t)purgeableAmountForVolume:(id)a3 urgency:(int64_t)a4;
- (void)_deleteBooks:(id)a3 fromPlist:(id)a4;
- (void)cancelPurge;
- (void)setLibrary:(id)a3;
- (void)setMultiUser:(BOOL)a3;
@end

@implementation BLCacheDelete

- (id)_initWithLibrary:(id)a3 multiUser:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BLCacheDelete;
  v8 = [(BLCacheDelete *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_multiUser = a4;
    objc_storeStrong((id *)&v8->_library, a3);
  }

  return v9;
}

- (BLCacheDelete)init
{
  v3 = +[BLLibrary defaultBookLibrary];
  v4 = [(BLCacheDelete *)self _initWithLibrary:v3 multiUser:+[BLLibraryUtility _isMultiUser]];

  return v4;
}

- (id)purchasedPlist
{
  v2 = [(BLCacheDelete *)self library];
  v3 = [v2 purchasedPlist];

  return v3;
}

- (id)sharedPlist
{
  v2 = [(BLCacheDelete *)self library];
  v3 = [v2 sharedPlist];

  return v3;
}

- (int64_t)purgeVolume:(id)a3 urgency:(int64_t)a4 requested:(id)a5
{
  id v35 = a3;
  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x2020000000;
  uint64_t v50 = 0;
  id v29 = a5;
  id v36 = [v29 integerValue];
  id v7 = [(BLCacheDelete *)self _orphanedPurchasedBookURLsInVolume:v35];
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_100015D1C;
  v46[3] = &unk_1001A1670;
  v46[4] = &v47;
  [v7 enumerateObjectsUsingBlock:v46];
  v30 = v7;
  v8 = [(BLCacheDelete *)self _orphanedSharedBookURLsInVolume:v35];
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_100015E68;
  v45[3] = &unk_1001A1670;
  v45[4] = &v47;
  [v8 enumerateObjectsUsingBlock:v45];
  v28 = v8;
  v9 = +[NSMutableArray array];
  v34 = [(BLCacheDelete *)self _duplicatedPurchasedBooksInVolume:v35];
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_100015FB4;
  v42[3] = &unk_1001A1698;
  v44 = &v47;
  id v33 = v9;
  id v43 = v33;
  [v34 enumerateObjectsUsingBlock:v42];
  v10 = [(BLCacheDelete *)self purchasedPlist];
  [(BLCacheDelete *)self _deleteBooks:v33 fromPlist:v10];

  if ([(BLCacheDelete *)self isMultiUser])
  {
    objc_super v11 = +[NSMutableArray array];
    uint64_t v12 = MaxPriorityForUrgency(a4);
    [(BLCacheDelete *)self _scoreBooksInVolume:v35];
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    id v14 = [v13 countByEnumeratingWithState:&v38 objects:v59 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v39;
LABEL_4:
      uint64_t v16 = 0;
      while (1)
      {
        if (*(void *)v39 != v15) {
          objc_enumerationMutation(v13);
        }
        if (v48[3] >= (uint64_t)v36) {
          break;
        }
        v17 = *(void **)(*((void *)&v38 + 1) + 8 * v16);
        if ((uint64_t)[v17 purgePriority] > v12) {
          break;
        }
        v37 = 0;
        v18 = [v17 path];
        unsigned int v19 = DeleteBook(v18, &v37);

        if (v19)
        {
          v20 = BLBookCacheDeleteLog();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            v21 = [v17 path];
            *(_DWORD *)buf = 138412546;
            id v52 = v21;
            __int16 v53 = 2050;
            v54 = v37;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Cache deleted shared book %@.  Recovered %{public}ld.", buf, 0x16u);
          }
          v48[3] += (uint64_t)v37;
          [v11 addObject:v17];
        }
        if (v14 == (id)++v16)
        {
          id v14 = [v13 countByEnumeratingWithState:&v38 objects:v59 count:16];
          if (v14) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    v22 = [(BLCacheDelete *)self sharedPlist];
    [(BLCacheDelete *)self _deleteBooks:v11 fromPlist:v22];
  }
  v23 = BLBookCacheDeleteLog();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v24 = MaxPriorityForUrgency(a4);
    uint64_t v25 = v48[3];
    *(_DWORD *)buf = 138413058;
    id v52 = v35;
    __int16 v53 = 2050;
    v54 = (char *)v24;
    __int16 v55 = 2050;
    id v56 = v36;
    __int16 v57 = 2050;
    uint64_t v58 = v25;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "purgeVolume:%@ urgency:%{public}ld requested:%{public}ld recovered:%{public}ld", buf, 0x2Au);
  }

  int64_t v26 = v48[3];
  _Block_object_dispose(&v47, 8);

  return v26;
}

- (int64_t)periodicPurgeVolume:(id)a3 urgency:(int64_t)a4 requested:(id)a5
{
  v5 = BLBookCacheDeleteLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Periodic purge is not supported.", v7, 2u);
  }

  return 0;
}

- (int64_t)purgeableAmountForVolume:(id)a3 urgency:(int64_t)a4
{
  id v6 = a3;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2020000000;
  uint64_t v33 = 0;
  id v7 = [(BLCacheDelete *)self _orphanedPurchasedBookURLsInVolume:v6];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100016520;
  v29[3] = &unk_1001A1670;
  v29[4] = &v30;
  [v7 enumerateObjectsUsingBlock:v29];
  v8 = [(BLCacheDelete *)self _orphanedSharedBookURLsInVolume:v6];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100016584;
  v28[3] = &unk_1001A1670;
  v28[4] = &v30;
  [v8 enumerateObjectsUsingBlock:v28];
  v9 = [(BLCacheDelete *)self _duplicatedPurchasedBooksInVolume:v6];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1000165E8;
  v27[3] = &unk_1001A16C0;
  v27[4] = &v30;
  [v9 enumerateObjectsUsingBlock:v27];
  uint64_t v10 = MaxPriorityForUrgency(a4);
  if ([(BLCacheDelete *)self isMultiUser])
  {
    [(BLCacheDelete *)self _scoreBooksInVolume:v6];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    id v12 = [v11 countByEnumeratingWithState:&v23 objects:v42 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v24;
LABEL_4:
      uint64_t v14 = 0;
      while (1)
      {
        if (*(void *)v24 != v13) {
          objc_enumerationMutation(v11);
        }
        uint64_t v15 = *(void **)(*((void *)&v23 + 1) + 8 * v14);
        if ((uint64_t)[v15 purgePriority] > v10) {
          break;
        }
        uint64_t v16 = [v15 path];
        v17 = FileSizeOfBook(v16);
        v31[3] += (uint64_t)v17;

        if (v12 == (id)++v14)
        {
          id v12 = [v11 countByEnumeratingWithState:&v23 objects:v42 count:16];
          if (v12) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
  }
  v18 = BLBookCacheDeleteLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = v31[3];
    *(_DWORD *)buf = 141558786;
    uint64_t v35 = 1752392040;
    __int16 v36 = 2112;
    id v37 = v6;
    __int16 v38 = 2050;
    uint64_t v39 = v10;
    __int16 v40 = 2050;
    uint64_t v41 = v19;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Purgeable amount for volume:%{mask.hash}@ urgency:%{public}ld = %{public}ld", buf, 0x2Au);
  }

  int64_t v20 = v31[3];
  _Block_object_dispose(&v30, 8);

  return v20;
}

- (void)cancelPurge
{
  v2 = BLBookCacheDeleteLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Cancel purge is not supported.", v3, 2u);
  }
}

- (id)_scoreBooksInVolume:(id)a3
{
  id v4 = a3;
  __int16 v38 = +[NSMutableArray array];
  v5 = +[NSMutableSet set];
  id v6 = +[NSMutableSet set];
  id v7 = [(BLCacheDelete *)self library];
  v8 = [v7 allBookItems];

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v9 = v8;
  id v10 = [v9 countByEnumeratingWithState:&v43 objects:v48 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v44;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v44 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        uint64_t v15 = [v14 permlink];

        if (v15)
        {
          uint64_t v16 = [v14 permlink];
          [v5 addObject:v16];
        }
        v17 = [v14 storeIdentifier];

        if (v17)
        {
          v18 = [v14 storeIdentifier];
          [v6 addObject:v18];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v43 objects:v48 count:16];
    }
    while (v11);
  }
  __int16 v36 = v9;
  id v37 = v6;

  uint64_t v19 = [(BLCacheDelete *)self sharedPlist];
  int64_t v20 = [(BLCacheDelete *)self sharedPlist];
  v21 = +[BLLibrary _bookItemsFromPlist:v19 sharedPlist:v20];

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v22 = v21;
  id v23 = [v22 countByEnumeratingWithState:&v39 objects:v47 count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v40;
    do
    {
      for (j = 0; j != v24; j = (char *)j + 1)
      {
        if (*(void *)v40 != v25) {
          objc_enumerationMutation(v22);
        }
        v27 = *(void **)(*((void *)&v39 + 1) + 8 * (void)j);
        v28 = [v27 fileURL];
        unsigned int v29 = objc_msgSend(v28, "bl_isInVolume:", v4);

        if (v29)
        {
          uint64_t v30 = [v27 permlink];
          if ([v5 containsObject:v30])
          {
            int v31 = 1;
          }
          else
          {
            uint64_t v32 = [v27 storeIdentifier];
            int v31 = [v37 containsObject:v32];
          }
          uint64_t v33 = [v27 lastUserAccessDate];
          objc_msgSend(v27, "setPurgePriority:", PurgePriority(v31, v33));

          [v38 addObject:v27];
        }
      }
      id v24 = [v22 countByEnumeratingWithState:&v39 objects:v47 count:16];
    }
    while (v24);
  }

  v34 = [v38 sortedArrayUsingComparator:&stru_1001A1700];

  return v34;
}

- (void)_deleteBooks:(id)a3 fromPlist:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = BLBookCacheDeleteLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Trimming the following paths from the shared list: %@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v56 = 0x3032000000;
  __int16 v57 = sub_100017038;
  uint64_t v58 = sub_100017048;
  id v59 = +[NSMutableArray array];
  uint64_t v45 = 0;
  long long v46 = &v45;
  uint64_t v47 = 0x3032000000;
  v48 = sub_100017038;
  uint64_t v49 = sub_100017048;
  id v50 = +[NSMutableArray array];
  uint64_t v39 = 0;
  long long v40 = &v39;
  uint64_t v41 = 0x3032000000;
  long long v42 = sub_100017038;
  long long v43 = sub_100017048;
  id v44 = +[NSMutableArray array];
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_100017050;
  v38[3] = &unk_1001A1728;
  v38[4] = &buf;
  v38[5] = &v45;
  v38[6] = &v39;
  [v5 enumerateObjectsUsingBlock:v38];
  v8 = BLBookCacheDeleteLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = (void *)v46[5];
    uint64_t v10 = v40[5];
    *(_DWORD *)v51 = 138412546;
    id v52 = v9;
    __int16 v53 = 2112;
    uint64_t v54 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Removing assets with storeIDs: %@ and permlinks: %@", v51, 0x16u);
  }

  [v6 addDeletedFiles:*(void *)(*((void *)&buf + 1) + 40)];
  id v11 = [v6 contents];
  uint64_t v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    id v13 = +[NSDictionary dictionary];
  }
  uint64_t v14 = v13;

  uint64_t v15 = [v6 unfilteredContents];
  uint64_t v16 = +[IMLibraryPlist booksArrayFromPlistEntry:v15];
  id v17 = [v16 count];

  v18 = [v6 path];
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_10001713C;
  v33[3] = &unk_1001A1750;
  uint64_t v35 = &v45;
  __int16 v36 = &v39;
  id v19 = v6;
  id v34 = v19;
  p_long long buf = &buf;
  int64_t v20 = objc_retainBlock(v33);
  v21 = +[BLLockFile iTunesSyncLockFile];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100017250;
  v28[3] = &unk_1001A1778;
  id v22 = v14;
  id v29 = v22;
  id v23 = v20;
  id v31 = v23;
  id v32 = v17;
  id v24 = v18;
  id v30 = v24;
  if (([v21 lockWithBlock:v28 error:0] & 1) == 0)
  {
    uint64_t v25 = BLBookCacheDeleteLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      long long v26 = [v19 path];
      v27 = [v26 lastPathComponent];
      *(_DWORD *)v51 = 138543362;
      id v52 = v27;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Failed to update %{public}@", v51, 0xCu);
    }
  }

  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v45, 8);

  _Block_object_dispose(&buf, 8);
}

- (id)_orphanedSharedBookURLsInVolume:(id)a3
{
  id v4 = a3;
  if ([(BLCacheDelete *)self isMultiUser])
  {
    id v5 = [(BLCacheDelete *)self sharedPlist];
    id v6 = [(BLCacheDelete *)self _orphanedBookURLs:v5 inVolume:v4];
  }
  else
  {
    id v6 = +[NSSet set];
  }

  return v6;
}

- (id)_orphanedPurchasedBookURLsInVolume:(id)a3
{
  id v4 = a3;
  id v5 = [(BLCacheDelete *)self purchasedPlist];
  id v6 = [(BLCacheDelete *)self _orphanedBookURLs:v5 inVolume:v4];

  return v6;
}

- (id)_orphanedBookURLs:(id)a3 inVolume:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[NSFileManager defaultManager];
  id v9 = +[NSMutableSet set];
  uint64_t v10 = [v6 directory];
  unsigned int v11 = objc_msgSend(v10, "bl_isInVolume:", v7);

  if (v11)
  {
    uint64_t v33 = v8;
    uint64_t v12 = +[NSMutableSet set];
    id v13 = [(BLCacheDelete *)self sharedPlist];
    uint64_t v14 = +[BLLibrary _bookItemsFromPlist:v6 sharedPlist:v13];

    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v15 = v14;
    id v16 = [v15 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v35;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v35 != v18) {
            objc_enumerationMutation(v15);
          }
          int64_t v20 = [*(id *)(*((void *)&v34 + 1) + 8 * i) path];
          v21 = [v20 lastPathComponent];
          [v12 addObject:v21];
        }
        id v17 = [v15 countByEnumeratingWithState:&v34 objects:v38 count:16];
      }
      while (v17);
    }

    id v22 = [v6 directory];
    id v23 = +[NSURL fileURLWithPath:v22];
    id v24 = [v33 enumeratorAtURL:v23 includingPropertiesForKeys:&__NSArray0__struct options:3 errorHandler:&stru_1001A17B8];

    uint64_t v25 = [v24 nextObject];
    if (v25)
    {
      long long v26 = (void *)v25;
      do
      {
        v27 = [v26 pathExtension];
        unint64_t v28 = BLBookTypeFromPathExtension();

        if (v28 <= 2)
        {
          id v29 = [v26 lastPathComponent];
          unsigned __int8 v30 = [v12 containsObject:v29];

          if ((v30 & 1) == 0) {
            [v9 addObject:v26];
          }
        }
        uint64_t v31 = [v24 nextObject];

        long long v26 = (void *)v31;
      }
      while (v31);
    }

    v8 = v33;
  }

  return v9;
}

- (id)_duplicatedPurchasedBooksInVolume:(id)a3
{
  id v4 = a3;
  id v5 = [(BLCacheDelete *)self purchasedPlist];
  id v6 = [(BLCacheDelete *)self _duplicateStoreBooksInPlist:v5 inVolume:v4];

  return v6;
}

- (id)_duplicateStoreBooksInPlist:(id)a3 inVolume:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[NSMutableSet set];
  id v9 = +[NSMutableSet set];
  uint64_t v10 = +[NSMutableSet set];
  unsigned int v11 = [(BLCacheDelete *)self sharedPlist];
  uint64_t v33 = v6;
  uint64_t v12 = +[BLLibrary _bookItemsFromPlist:v6 sharedPlist:v11];

  id v13 = [v12 reverseObjectEnumerator];
  uint64_t v14 = [v13 nextObject];
  if (v14)
  {
    id v15 = (void *)v14;
    do
    {
      id v16 = [v15 fileURL];
      unsigned int v17 = objc_msgSend(v16, "bl_isInVolume:", v7);

      if (v17)
      {
        uint64_t v18 = [v15 storeIdentifier];
        id v19 = [v18 length];

        if (v19)
        {
          int64_t v20 = [v15 storeIdentifier];
          unsigned int v21 = [v9 containsObject:v20];

          if (!v21)
          {
            id v22 = [v15 storeIdentifier];
            unsigned __int8 v30 = v9;
            goto LABEL_14;
          }
          [v8 addObject:v15];
          id v22 = BLBookCacheDeleteLog();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            id v23 = [v15 storeIdentifier];
            id v24 = [v15 path];
            *(_DWORD *)long long buf = 138412546;
            long long v35 = v23;
            __int16 v36 = 2112;
            long long v37 = v24;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Found duplicate book in plist with id %@ at %@", buf, 0x16u);
          }
LABEL_15:

          goto LABEL_16;
        }
        uint64_t v25 = [v15 permlink];

        if (v25)
        {
          long long v26 = [v15 permlink];
          unsigned int v27 = [v10 containsObject:v26];

          if (v27)
          {
            [v8 addObject:v15];
            id v22 = BLBookCacheDeleteLog();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              unint64_t v28 = [v15 permlink];
              id v29 = [v15 path];
              *(_DWORD *)long long buf = 138412546;
              long long v35 = v28;
              __int16 v36 = 2112;
              long long v37 = v29;
              _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Found duplicate book in plist with id %@ at %@", buf, 0x16u);
            }
            goto LABEL_15;
          }
          id v22 = [v15 permlink];
          unsigned __int8 v30 = v10;
LABEL_14:
          [v30 addObject:v22];
          goto LABEL_15;
        }
      }
LABEL_16:
      uint64_t v31 = [v13 nextObject];

      id v15 = (void *)v31;
    }
    while (v31);
  }

  return v8;
}

- (BLLibrary)library
{
  return self->_library;
}

- (void)setLibrary:(id)a3
{
}

- (BOOL)isMultiUser
{
  return self->_multiUser;
}

- (void)setMultiUser:(BOOL)a3
{
  self->_multiUser = a3;
}

- (void).cxx_destruct
{
}

@end