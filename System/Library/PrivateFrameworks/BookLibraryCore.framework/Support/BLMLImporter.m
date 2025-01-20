@interface BLMLImporter
+ (id)deviceMLImporter;
- (BLMLImporter)init;
- (BOOL)_addLibraryItems:(id)a3 toMusicLibrary:(id)a4 itemPids:(int64_t *)a5 error:(id *)a6;
- (BOOL)_removeDownloadWithIdentifier:(int64_t)a3 canceled:(BOOL)a4 inLibrary:(id)a5;
- (BOOL)addLibraryItems:(id)a3 error:(id *)a4;
- (int64_t)addLibraryItem:(id)a3 error:(id *)a4;
- (void)_commitScheduledLibraryItems;
- (void)_dispatchAsync:(id)a3;
- (void)_setDownloadPropertiesForTrack:(id)a3 usingLibraryItem:(id)a4;
- (void)commitScheduledLibraryItems;
- (void)dealloc;
- (void)deleteAllOTATracks;
- (void)removeDownloadWithIdentifier:(int64_t)a3 canceled:(BOOL)a4;
- (void)removeDownloadsWithIdentifiers:(id)a3 canceled:(BOOL)a4;
- (void)scheduleLibraryItem:(id)a3;
- (void)scheduleLibraryItems:(id)a3;
- (void)setAppleIdentifier:(id)a3 forAccountIdentifier:(unint64_t)a4;
@end

@implementation BLMLImporter

- (BLMLImporter)init
{
  if (MGGetSInt32Answer() == 4)
  {

    return 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)BLMLImporter;
    v3 = [(BLMLImporter *)&v9 init];
    if (v3)
    {
      dispatch_queue_t v4 = dispatch_queue_create("com.apple.bookassetd.BLMLImporter", 0);
      dispatchQueue = v3->_dispatchQueue;
      v3->_dispatchQueue = (OS_dispatch_queue *)v4;

      v6 = objc_alloc_init(BLOperationQueue);
      operationQueue = v3->_operationQueue;
      v3->_operationQueue = v6;

      [(BLOperationQueue *)v3->_operationQueue setMaxConcurrentOperationCount:3];
    }
  }
  return v3;
}

- (void)dealloc
{
  scheduledItemTimer = self->_scheduledItemTimer;
  if (scheduledItemTimer) {
    dispatch_source_cancel(scheduledItemTimer);
  }
  operationQueue = self->_operationQueue;
  if (operationQueue) {
    [(BLOperationQueue *)operationQueue cancelAllOperations];
  }
  v5.receiver = self;
  v5.super_class = (Class)BLMLImporter;
  [(BLMLImporter *)&v5 dealloc];
}

+ (id)deviceMLImporter
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D348;
  block[3] = &unk_1001A11C8;
  block[4] = a1;
  if (qword_1001C8138 != -1) {
    dispatch_once(&qword_1001C8138, block);
  }
  v2 = (void *)qword_1001C8130;

  return v2;
}

- (int64_t)addLibraryItem:(id)a3 error:(id *)a4
{
  int64_t v10 = 0;
  id v11 = a3;
  id v6 = a3;
  v7 = +[NSArray arrayWithObjects:&v11 count:1];
  v8 = +[ML3MusicLibrary autoupdatingSharedLibrary];

  [(BLMLImporter *)self _addLibraryItems:v7 toMusicLibrary:v8 itemPids:&v10 error:a4];
  return v10;
}

- (BOOL)addLibraryItems:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = +[ML3MusicLibrary autoupdatingSharedLibrary];
  LOBYTE(a4) = [(BLMLImporter *)self _addLibraryItems:v6 toMusicLibrary:v7 itemPids:0 error:a4];

  return (char)a4;
}

- (void)commitScheduledLibraryItems
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10000D534;
  v2[3] = &unk_1001A0FE8;
  v2[4] = self;
  [(BLMLImporter *)self _dispatchAsync:v2];
}

- (void)deleteAllOTATracks
{
  v3 = BLServiceLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    id v6 = (id)objc_opt_class();
    id v4 = v6;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%@: Deleting all OTA tracks", (uint8_t *)&v5, 0xCu);
  }
  [(BLMLImporter *)self _dispatchAsync:&stru_1001A1318];
}

- (void)removeDownloadsWithIdentifiers:(id)a3 canceled:(BOOL)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000D7BC;
  v7[3] = &unk_1001A1390;
  id v8 = a3;
  objc_super v9 = self;
  BOOL v10 = a4;
  id v6 = v8;
  [(BLMLImporter *)self _dispatchAsync:v7];
}

- (void)removeDownloadWithIdentifier:(int64_t)a3 canceled:(BOOL)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000DA28;
  v4[3] = &unk_1001A13E0;
  v4[4] = self;
  v4[5] = a3;
  BOOL v5 = a4;
  [(BLMLImporter *)self _dispatchAsync:v4];
}

- (void)scheduleLibraryItem:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(objc_alloc((Class)NSArray), "initWithObjects:", v4, 0);

  [(BLMLImporter *)self scheduleLibraryItems:v5];
}

- (void)scheduleLibraryItems:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = BLServiceLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = objc_opt_class();
      id v7 = v6;
      *(_DWORD *)buf = 138412546;
      id v11 = v6;
      __int16 v12 = 2048;
      id v13 = [v4 count];
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%@: Scheduling %lu iPod library items", buf, 0x16u);
    }
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10000DCBC;
    v8[3] = &unk_1001A11A8;
    v8[4] = self;
    id v9 = v4;
    [(BLMLImporter *)self _dispatchAsync:v8];
  }
}

- (void)setAppleIdentifier:(id)a3 forAccountIdentifier:(unint64_t)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000DF0C;
  v7[3] = &unk_1001A1408;
  id v8 = a3;
  unint64_t v9 = a4;
  id v6 = v8;
  [(BLMLImporter *)self _dispatchAsync:v7];
}

- (BOOL)_addLibraryItems:(id)a3 toMusicLibrary:(id)a4 itemPids:(int64_t *)a5 error:(id *)a6
{
  id v7 = a3;
  id v95 = a4;
  v101 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v7 count]);
  long long v106 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  id obj = v7;
  id v8 = [obj countByEnumeratingWithState:&v106 objects:v114 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v107;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v107 != v10) {
          objc_enumerationMutation(obj);
        }
        __int16 v12 = *(void **)(*((void *)&v106 + 1) + 8 * i);
        id v13 = [v12 itemMetadata];
        unsigned int v14 = +[BLMLImporterItem mediaTypeForStoreDownload:v13];

        id v15 = [v12 libraryPersistentIdentifier];
        v16 = BLServiceLog();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          v17 = objc_opt_class();
          *(_DWORD *)buf = 138412546;
          id v111 = v17;
          __int16 v112 = 2048;
          *(void *)v113 = v15;
          id v18 = v17;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%@: importing item with existing library pid %lld", buf, 0x16u);
        }
        if (v15) {
          BOOL v19 = v14 == 8;
        }
        else {
          BOOL v19 = 0;
        }
        if (v19)
        {
          v20 = BLServiceLog();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            v21 = objc_opt_class();
            *(_DWORD *)buf = 138412546;
            id v111 = v21;
            __int16 v112 = 2048;
            *(void *)v113 = v15;
            id v22 = v21;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%@: skipping import of item with existing library pid %lld", buf, 0x16u);
          }
        }
        else
        {
          [v101 addObject:v12];
        }
      }
      id v9 = [obj countByEnumeratingWithState:&v106 objects:v114 count:16];
    }
    while (v9);
  }
  v23 = obj;

  v24 = v101;
  if ([v101 count])
  {
    v25 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [obj count]);
    v96 = objc_alloc_init(BLML3TrackImporter);
    unsigned int v26 = [(BLML3TrackImporter *)v96 importLibraryItems:v101 toMusicLibrary:v95 importedItemPids:v25];
    v27 = BLServiceLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      v28 = objc_opt_class();
      v29 = "failed";
      if (v26) {
        v29 = "succeeded";
      }
      *(_DWORD *)buf = 138412546;
      id v111 = v28;
      __int16 v112 = 2080;
      *(void *)v113 = v29;
      id v30 = v28;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "%@: import %s", buf, 0x16u);
    }
    if (!v26)
    {
LABEL_86:
      v23 = obj;
      goto LABEL_88;
    }
    if ([v101 count])
    {
      unint64_t v31 = 0;
      do
      {
        v32 = [v101 objectAtIndex:v31];
        v33 = [v25 objectAtIndex:v31];
        objc_msgSend(v32, "setLibraryPersistentIdentifier:", objc_msgSend(v33, "longLongValue"));

        ++v31;
      }
      while ((unint64_t)[v101 count] > v31);
    }

    v23 = obj;
  }
  v90 = objc_opt_new();
  v96 = (BLML3TrackImporter *)objc_opt_new();
  if ([v23 count])
  {
    unint64_t v34 = 0;
    uint64_t v92 = ML3TrackPropertyBaseLocationID;
    uint64_t v93 = ML3TrackPropertyLocationFileName;
    uint64_t v91 = ML3TrackPropertyStoreFamilyAccountID;
    do
    {
      v35 = [v23 objectAtIndex:v34];
      v36 = [v35 itemMediaPath];
      id v103 = [v35 libraryPersistentIdentifier];
      if (a5) {
        a5[v34] = (int64_t)v103;
      }
      v37 = BLServiceLog();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        v38 = objc_opt_class();
        *(_DWORD *)buf = 138412802;
        id v111 = v38;
        __int16 v112 = 1024;
        *(_DWORD *)v113 = v34;
        *(_WORD *)&v113[4] = 2048;
        *(void *)&v113[6] = v103;
        id v39 = v38;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "%@: post process item %d. pid=%lld", buf, 0x1Cu);
      }
      id v40 = [objc_alloc((Class)ML3Track) initWithPersistentID:v103 inLibrary:v95];
      v99 = [v40 valueForProperty:v93];
      v41 = [v40 valueForProperty:v92];
      id v42 = [v41 longLongValue];

      v43 = [v36 stringByDeletingLastPathComponent];
      uint64_t v44 = [v43 lastPathComponent];

      v97 = (void *)v44;
      uint64_t v45 = ML3BaseLocationIDFromMediaRelativePathInLibrary();
      v98 = [v40 valueForProperty:v91];
      id v46 = [v98 longLongValue];
      v47 = BLServiceLog();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        v48 = objc_opt_class();
        *(_DWORD *)buf = 138412802;
        id v111 = v48;
        __int16 v112 = 2112;
        *(void *)v113 = v99;
        *(_WORD *)&v113[8] = 2112;
        *(void *)&v113[10] = v98;
        v49 = v35;
        v50 = v36;
        id v51 = v48;
        _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_INFO, "%@: existingPath=%@, existingFamilyAccoundID=%@", buf, 0x20u);

        v36 = v50;
        v35 = v49;
      }

      if (v36)
      {
        v52 = BLServiceLog();
        BOOL v53 = os_log_type_enabled(v52, OS_LOG_TYPE_INFO);
        if ((uint64_t)v42 <= v45 || v46)
        {
          v24 = v101;
          if (v53)
          {
            v61 = objc_opt_class();
            v62 = v36;
            id v63 = v61;
            id v64 = [v40 persistentID];
            *(_DWORD *)buf = 138412546;
            id v111 = v61;
            __int16 v112 = 2048;
            *(void *)v113 = v64;
            _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_INFO, "%@: Defering populating artwork for %lld", buf, 0x16u);

            v36 = v62;
          }

          [v90 addObject:v35];
          [(BLML3TrackImporter *)v96 addObject:v40];
          v23 = obj;
          v54 = v97;
          goto LABEL_56;
        }
        v24 = v101;
        v54 = v97;
        if (v53)
        {
          v55 = objc_opt_class();
          *(_DWORD *)buf = 138412802;
          id v111 = v55;
          __int16 v112 = 2048;
          *(void *)v113 = v103;
          *(_WORD *)&v113[8] = 2112;
          *(void *)&v113[10] = v99;
          id v56 = v55;
          _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_INFO, "%@: Skipping existing track with location data: %lld: \"%@\"", buf, 0x20u);
        }
        if ([v35 isDownloading]) {
          [(BLMLImporter *)self _setDownloadPropertiesForTrack:v40 usingLibraryItem:v35];
        }
        v57 = +[NSSet setWithObject:v36];
        ML3DeleteAssetsAtPaths();
      }
      else
      {
        v58 = BLServiceLog();
        v24 = v101;
        v54 = v97;
        if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
        {
          v59 = objc_opt_class();
          *(_DWORD *)buf = 138412546;
          id v111 = v59;
          __int16 v112 = 2048;
          *(void *)v113 = v103;
          id v60 = v59;
          _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_INFO, "%@: Skipping existing track, no location data: %lld", buf, 0x16u);
        }
        if (![v35 isDownloading])
        {
          v23 = obj;
          if ([v35 updateType] == (id)2)
          {
            v65 = [v35 itemArtworkData];
            if ([v65 length]) {
              [v40 populateArtworkCacheWithArtworkData:v65];
            }
          }
          goto LABEL_56;
        }
        [(BLMLImporter *)self _setDownloadPropertiesForTrack:v40 usingLibraryItem:v35];
      }
      v23 = obj;
LABEL_56:
      v66 = BLServiceLog();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        id v111 = v103;
        _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_INFO, "inserted track id %lld", buf, 0xCu);
      }

      ++v34;
    }
    while ((unint64_t)[v23 count] > v34);
  }
  v25 = v90;
  if ([v90 count])
  {
    uint64_t v67 = 0;
    uint64_t v100 = ML3TrackPropertyStoreFamilyAccountID;
    while (1)
    {
      v68 = [v25 objectAtIndex:v67];
      v69 = [(BLML3TrackImporter *)v96 objectAtIndex:v67];
      v70 = BLServiceLog();
      if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
      {
        v71 = objc_opt_class();
        id v72 = v71;
        id v73 = [v69 persistentID];
        *(_DWORD *)buf = 138412546;
        id v111 = v71;
        __int16 v112 = 2048;
        *(void *)v113 = v73;
        _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_INFO, "%@: Setting location data for track: %lld", buf, 0x16u);
      }
      v74 = [v68 itemArtworkData];
      if ([v74 length]) {
        [v69 populateArtworkCacheWithArtworkData:v74];
      }
      objc_opt_class();
      v75 = [v68 itemMetadata];
      v76 = [v75 sinfs];
      v77 = BUDynamicCast();

      if ([v77 count]) {
        v78 = [[BLDownloadDRM alloc] initWithSinfArray:v77];
      }
      else {
        v78 = 0;
      }
      id v79 = [v68 protectionType];
      id v80 = v79;
      if (v79 != (id)2 && v79 != (id)1)
      {
        if (v79 || !v78) {
          id v80 = 0;
        }
        else {
          id v80 = (id)([(BLDownloadDRM *)v78 isDRMFree] ^ 1);
        }
      }
      v81 = [v68 itemMediaPath];
      [v69 populateLocationPropertiesWithPath:v81 protectionType:v80];

      if (!v78) {
        goto LABEL_84;
      }
      uint64_t v82 = [(BLDownloadDRM *)v78 sinfsArray];
      if (!v82) {
        goto LABEL_84;
      }
      v83 = (void *)v82;
      objc_opt_class();
      id v105 = 0;
      id v84 = [v83 copyValueForField:4 error:&v105];
      id v85 = v105;
      uint64_t v86 = BUDynamicCast();

      if (!v86)
      {
        if (v85) {
          break;
        }
      }

      v25 = v90;
      if (v86)
      {
        [v69 setValue:v86 forProperty:v100];
        v83 = (void *)v86;
LABEL_83:
      }
LABEL_84:
      [(BLMLImporter *)self _setDownloadPropertiesForTrack:v69 usingLibraryItem:0];

      if (++v67 >= (unint64_t)[v25 count])
      {
        LOBYTE(v26) = 1;
        v24 = v101;
        goto LABEL_86;
      }
    }
    v87 = BLServiceLog();
    if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v111 = v85;
      _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_ERROR, "Error copying FamilyAccountID:  %@", buf, 0xCu);
    }

    v25 = v90;
    goto LABEL_83;
  }
  LOBYTE(v26) = 1;
LABEL_88:

  if (a6) {
    *a6 = 0;
  }

  return v26;
}

- (void)_commitScheduledLibraryItems
{
  if ([(NSMutableArray *)self->_scheduledItems count])
  {
    v3 = BLServiceLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      id v4 = objc_opt_class();
      scheduledItems = self->_scheduledItems;
      id v6 = v4;
      int v9 = 138412546;
      uint64_t v10 = v4;
      __int16 v11 = 2048;
      id v12 = [(NSMutableArray *)scheduledItems count];
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%@: Adding %lu scheduled iPod library items", (uint8_t *)&v9, 0x16u);
    }
    [(BLMLImporter *)self addLibraryItems:self->_scheduledItems error:0];
    [(NSMutableArray *)self->_scheduledItems removeAllObjects];
  }
  scheduledItemTimer = self->_scheduledItemTimer;
  if (scheduledItemTimer)
  {
    dispatch_source_cancel(scheduledItemTimer);
    id v8 = self->_scheduledItemTimer;
    self->_scheduledItemTimer = 0;
  }
}

- (void)_dispatchAsync:(id)a3
{
  id v4 = a3;
  id v5 = (void *)os_transaction_create();
  dispatchQueue = self->_dispatchQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000ED80;
  v9[3] = &unk_1001A1430;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async((dispatch_queue_t)dispatchQueue, v9);
}

- (BOOL)_removeDownloadWithIdentifier:(int64_t)a3 canceled:(BOOL)a4 inLibrary:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  id v8 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", @"%lld", a3);
  int v9 = (void *)ML3TrackPropertyDownloadIdentifier;
  id v10 = +[ML3ComparisonPredicate predicateWithProperty:ML3TrackPropertyDownloadIdentifier equalToValue:v8];
  id v11 = +[ML3Track anyInLibrary:v7 predicate:v10];
  if (v11)
  {
    v36[0] = ML3TrackPropertyLocationFileName;
    v36[1] = ML3TrackPropertyStoreSagaID;
    v36[2] = ML3TrackPropertyPurchaseHistoryID;
    v36[3] = ML3TrackPropertyStoreIsSubscription;
    v36[4] = ML3TrackPropertyIsRental;
    id v35 = 0;
    long long v33 = 0u;
    long long v34 = 0u;
    [v11 getValues:&v33 forProperties:v36 count:5];
    id v12 = v35;
    if ((objc_opt_respondsToSelector() & 1) != 0 && [v12 BOOLValue]) {
      [v11 setValue:&__kCFBooleanFalse forProperty:ML3TrackPropertyIsOTAPurchased];
    }
    objc_opt_class();
    id v13 = BUDynamicCast();
    if ([v13 length]
      || *((void *)&v33 + 1) && [*((id *)&v33 + 1) longLongValue]
      || (void)v34 && [(id)v34 longLongValue]
      || *((void *)&v34 + 1) && ([*((id *)&v34 + 1) BOOLValue] & 1) != 0)
    {
      id v30 = v10;
      id v14 = v8;
      id v15 = v12;
      v16 = v13;
      id v17 = v7;
      BOOL v18 = v5;
      BOOL v19 = BLServiceLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        v20 = objc_opt_class();
        id v21 = v20;
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v20;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = [v11 persistentID];
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "%@: Removing download properties from iPod library: %lld", buf, 0x16u);
      }
      *(void *)buf = v9;
      *(void *)&buf[8] = ML3TrackPropertyNeedsRestore;
      long long v31 = unk_1001A1450;
      [v11 setValues:&v31 forProperties:buf count:2];
      if (v18) {
        [v11 setValue:&off_1001AF5E0 forProperty:ML3EntityPropertyKeepLocal];
      }
      for (uint64_t i = 8; i != -8; i -= 8)

      uint64_t v23 = 8;
      id v7 = v17;
      do
      {

        v23 -= 8;
      }
      while (v23 != -8);
      unsigned __int8 v24 = 1;
      id v13 = v16;
      id v12 = v15;
      id v8 = v14;
      id v10 = v30;
    }
    else
    {
      v27 = BLServiceLog();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        v28 = objc_opt_class();
        id v29 = v28;
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v28;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = [v11 persistentID];
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "%@: Deleting download from iPod library: %lld", buf, 0x16u);
      }
      unsigned __int8 v24 = [v11 deleteFromLibrary];
    }

    for (uint64_t j = 4; j != -1; --j)
  }
  else
  {
    unsigned __int8 v24 = 1;
  }

  return v24;
}

- (void)_setDownloadPropertiesForTrack:(id)a3 usingLibraryItem:(id)a4
{
  id v5 = a3;
  id v6 = [a4 itemDownloadIdentifier];
  v11[0] = v6;
  v11[1] = &__kCFBooleanFalse;
  v10[0] = ML3TrackPropertyDownloadIdentifier;
  v10[1] = ML3TrackPropertyNeedsRestore;
  if (v6) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = 2;
  }
  [v5 setValues:v11 forProperties:v10 count:v7];
  for (uint64_t i = 1; i != -1; --i)

  for (uint64_t j = 1; j != -1; --j)
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduledItemTimer, 0);
  objc_storeStrong((id *)&self->_scheduledItems, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);

  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end