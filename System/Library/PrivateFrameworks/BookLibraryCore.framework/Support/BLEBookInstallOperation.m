@interface BLEBookInstallOperation
- (BLBookManifest)purchaseManifest;
- (BLBookManifest)sharedManifest;
- (BLBookManifest)syncManifest;
- (BLEBookInstallOperation)initWithInfo:(id)a3;
- (BOOL)_installMediaAsset:(id)a3 assetInstalledPath:(id *)a4 fileName:(id *)a5 drmPath:(id *)a6 error:(id *)a7;
- (BOOL)_prepareOperation:(id *)a3;
- (BOOL)_unzipAsset:(id)a3 unzippedPath:(id *)a4 error:(id *)a5;
- (BOOL)sharedDownload;
- (BOOL)shouldSkipAssetInstallation;
- (NSString)bookPath;
- (NSString)drmPath;
- (id)_bookManifest;
- (id)_existingManifestEntry;
- (id)_initWithInfo:(id)a3 syncManifest:(id)a4 purchaseManifest:(id)a5 sharedManifest:(id)a6;
- (id)_manifestEntriesForInstallInfo:(id)a3 inManifest:(id)a4;
- (id)_manifestEntryForInstallInfo:(id)a3 inManifest:(id)a4;
- (id)_newManifestEntry:(BOOL)a3 withFileName:(id)a4;
- (id)_newManifestEntry:(id)a3;
- (void)_addPurchaseManifestItem:(BOOL)a3;
- (void)_installEpubRights:(id)a3;
- (void)_installITunesArtwork:(id)a3 isDirectory:(BOOL)a4;
- (void)_installITunesMetadataPlist:(id)a3 isDirectory:(BOOL)a4;
- (void)_removeDuplicateEntry:(id)a3;
- (void)main;
- (void)run;
- (void)setBookPath:(id)a3;
- (void)setDrmPath:(id)a3;
- (void)setPurchaseManifest:(id)a3;
- (void)setSharedManifest:(id)a3;
- (void)setShouldSkipAssetInstallation:(BOOL)a3;
- (void)setSyncManifest:(id)a3;
@end

@implementation BLEBookInstallOperation

- (id)_initWithInfo:(id)a3 syncManifest:(id)a4 purchaseManifest:(id)a5 sharedManifest:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [(BLEBookInstallOperation *)self initWithInfo:a3];
  p_isa = (id *)&v14->super.super.super.isa;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_syncManifest, a4);
    objc_storeStrong(p_isa + 8, a5);
    objc_storeStrong(p_isa + 10, a6);
  }

  return p_isa;
}

- (BLEBookInstallOperation)initWithInfo:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)BLEBookInstallOperation;
  v3 = [(BLBaseBookInstallOperation *)&v13 initWithInfo:a3];
  if (v3)
  {
    v4 = +[BLBookManifest syncedBookManifest];
    v5 = +[BLBookManifest purchasedBookManifest];
    uint64_t v6 = +[BLBookManifest sharedPurchasedBookManifest];
    syncManifest = v3->_syncManifest;
    v3->_syncManifest = v4;
    v8 = v4;

    purchaseManifest = v3->_purchaseManifest;
    v3->_purchaseManifest = v5;
    v10 = v5;

    sharedManifest = v3->_sharedManifest;
    v3->_sharedManifest = (BLBookManifest *)v6;
  }
  return v3;
}

- (id)_manifestEntriesForInstallInfo:(id)a3 inManifest:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v41 = v5;
  v7 = [v5 storeIdentifier];
  v8 = [v6 manifestEntriesWithProperty:@"s" equalToNumber:v7 limitCount:0x7FFFFFFFFFFFFFFFLL];

  id v9 = [v8 count];
  v10 = BLBookInstallLog();
  id v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      CFStringRef v49 = @"s";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "[Install-Op]: Restore item found with key: %{public}@", buf, 0xCu);
    }

    id v12 = v8;
LABEL_11:
    v18 = v12;
    v19 = v12;
    goto LABEL_12;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    CFStringRef v49 = @"s";
    __int16 v50 = 2114;
    CFStringRef v51 = @"Item ID";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[Install-Op]: Could not find restore item with key: \"%{public}@\" ... now trying with key: \"%{public}@\"", buf, 0x16u);
  }

  objc_super v13 = [v5 storeIdentifier];
  v14 = [v6 manifestEntriesWithProperty:@"Item ID" equalToNumber:v13 limitCount:0x7FFFFFFFFFFFFFFFLL];

  id v15 = [v14 count];
  v16 = BLBookInstallLog();
  v17 = v16;
  if (v15)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      CFStringRef v49 = @"Item ID";
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "[Install-Op]: Restore item found with key: %{public}@", buf, 0xCu);
    }

    id v12 = v14;
    goto LABEL_11;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    CFStringRef v49 = @"Item ID";
    __int16 v50 = 2114;
    CFStringRef v51 = @"Name";
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "[Install-Op]: Could not find restore item with key: \"%{public}@\" ... now trying with key: \"%{public}@\"", buf, 0x16u);
  }

  v21 = [v5 title];
  v18 = [v6 manifestEntriesWithProperty:@"Name" equalToValue:v21 limitCount:5];

  if ([(__CFString *)v18 count])
  {
    id v22 = [(__CFString *)v18 count];
    v23 = BLBookInstallLog();
    v24 = v23;
    if (v22 == (id)1)
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        CFStringRef v49 = @"Name";
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "[Install-Op]: Restore item found with key: %{public}@", buf, 0xCu);
      }

      v25 = [(__CFString *)v18 firstObject];
      v47 = v25;
      v19 = +[NSArray arrayWithObjects:&v47 count:1];
    }
    else
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        v28 = [v41 title];
        *(_DWORD *)buf = 138412290;
        CFStringRef v49 = v28;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "[Install-Op]: Found multiple restore items with title: \"%@\".  De-duping by artistName", buf, 0xCu);
      }
      v29 = [v41 artistName];

      if (v29)
      {
        id v40 = v6;
        v19 = objc_opt_new();
        long long v42 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        v18 = v18;
        id v30 = [(__CFString *)v18 countByEnumeratingWithState:&v42 objects:v46 count:16];
        if (v30)
        {
          id v31 = v30;
          uint64_t v32 = *(void *)v43;
          do
          {
            for (i = 0; i != v31; i = (char *)i + 1)
            {
              if (*(void *)v43 != v32) {
                objc_enumerationMutation(v18);
              }
              v34 = *(void **)(*((void *)&v42 + 1) + 8 * i);
              v35 = objc_msgSend(v34, "objectForKeyedSubscript:", @"Artist", v40);
              v36 = [v41 artistName];
              unsigned int v37 = [v35 isEqualToString:v36];

              if (v37)
              {
                v38 = BLBookInstallLog();
                if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "[Install-Op]: Found book with our artist name.", buf, 2u);
                }

                [v19 addObject:v34];
              }
            }
            id v31 = [(__CFString *)v18 countByEnumeratingWithState:&v42 objects:v46 count:16];
          }
          while (v31);
        }

        id v6 = v40;
      }
      else
      {
        v18 = v18;
        v39 = BLBookInstallLog();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          CFStringRef v49 = v18;
          _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "[Install-Op]: ArtistName was not recorded in installIInfo. Returning matching entries: %@", buf, 0xCu);
        }

        v19 = v18;
      }
    }
  }
  else
  {
    v26 = BLBookInstallLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      v27 = [v41 title];
      *(_DWORD *)buf = 138412290;
      CFStringRef v49 = v27;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "[Install-Op]: Entry not found title: \"%@\"", buf, 0xCu);
    }
    v19 = 0;
  }
LABEL_12:

  return v19;
}

- (id)_manifestEntryForInstallInfo:(id)a3 inManifest:(id)a4
{
  [(BLEBookInstallOperation *)self _manifestEntriesForInstallInfo:a3 inManifest:a4];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [obj countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v19;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        objc_opt_class();
        id v9 = [v8 objectForKey:@"Backup-Path"];
        v10 = BUDynamicCast();

        id v11 = +[NSFileManager defaultManager];
        unsigned __int8 v12 = [v11 fileExistsAtPath:v10];

        objc_super v13 = BLBookInstallLog();
        BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
        if ((v12 & 1) == 0)
        {
          if (v14)
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "[Install-Op]: Prepare ... restore entry found.", buf, 2u);
          }

          id v15 = v8;
          goto LABEL_15;
        }
        if (v14)
        {
          *(_DWORD *)buf = 138412290;
          v23 = v10;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "[Install-Op]: Prepare ... File already restored for purchase manifest entry at path %@. Still looking...", buf, 0xCu);
        }
      }
      id v5 = [obj countByEnumeratingWithState:&v18 objects:v24 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  id v15 = 0;
LABEL_15:

  return v15;
}

- (BOOL)_prepareOperation:(id *)a3
{
  id v5 = [(BLBaseBookInstallOperation *)self installInfo];
  uint64_t v6 = [v5 persistentIdentifier];

  v7 = [v5 persistentIdentifier];
  id v8 = [v7 integerValue];

  id v9 = [v5 isRestore];
  unsigned int v10 = [v9 BOOLValue];

  if (v8) {
    BOOL v11 = v6 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11 && !v10)
  {
    unsigned __int8 v12 = 0;
    BOOL v13 = 1;
    if (!a3) {
      goto LABEL_31;
    }
    goto LABEL_30;
  }
  BOOL v14 = BLBookInstallLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = [v5 persistentIdentifier];
    v16 = [v5 storeIdentifier];
    int v39 = 138543618;
    id v40 = v15;
    __int16 v41 = 2112;
    long long v42 = v16;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[Install-Op]: Prepare ... persistentID == %{public}@, storeID == %@, isRestore == YES", (uint8_t *)&v39, 0x16u);
  }
  v17 = BLBookInstallLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    LOWORD(v39) = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "[Install-Op]: Prepare ... Looking for restore entry in the purchase manifest.", (uint8_t *)&v39, 2u);
  }

  long long v18 = [(BLEBookInstallOperation *)self purchaseManifest];
  long long v19 = [(BLEBookInstallOperation *)self _manifestEntryForInstallInfo:v5 inManifest:v18];

  long long v20 = BLBookInstallLog();
  BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
  if (v19)
  {
    if (!v21) {
      goto LABEL_22;
    }
    LOWORD(v39) = 0;
    id v22 = "[Install-Op]: Prepare ... restore item found in the purchase manifest.";
    goto LABEL_21;
  }
  if (v21)
  {
    LOWORD(v39) = 0;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "[Install-Op]: Prepare ... Looking for restore entry in the sync manifest.", (uint8_t *)&v39, 2u);
  }

  v23 = [(BLEBookInstallOperation *)self syncManifest];
  long long v19 = [(BLEBookInstallOperation *)self _manifestEntryForInstallInfo:v5 inManifest:v23];

  v24 = BLBookInstallLog();
  long long v20 = v24;
  if (!v19)
  {
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v34 = [v5 downloadID];
      v35 = [v5 persistentIdentifier];
      v36 = [v5 storeIdentifier];
      unsigned int v37 = [v5 title];
      v38 = [v5 artistName];
      int v39 = 138544386;
      id v40 = v34;
      __int16 v41 = 2114;
      long long v42 = v35;
      __int16 v43 = 2112;
      long long v44 = v36;
      __int16 v45 = 2112;
      v46 = v37;
      __int16 v47 = 2112;
      v48 = v38;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "(dID=%{public}@) [Install-Op]: Error: could not find manifest entry for restore book: [persistentID:%{public}@, storeID: %@, title:%@, author:%@]", (uint8_t *)&v39, 0x34u);
    }
    unsigned __int8 v12 = sub_10004B6AC(36, @"Bad backup plist", @"This plist entry for representing this download could not be found.");
    BOOL v13 = 0;
    if (a3) {
      goto LABEL_30;
    }
    goto LABEL_31;
  }
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v39) = 0;
    id v22 = "[Install-Op]: Prepare ... restore item found in the sync manifest.";
LABEL_21:
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, v22, (uint8_t *)&v39, 2u);
  }
LABEL_22:

  objc_opt_class();
  v25 = [v19 objectForKey:@"Backup-Path"];
  v26 = BUDynamicCast();

  BOOL v13 = v26 != 0;
  if (v26)
  {
    v27 = [v26 lastPathComponent];
    [v5 setDestinationFilename:v27];

    [v5 setFullRestoreFilePath:v26];
    v28 = BLBookInstallLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v29 = [v5 fullRestoreFilePath];
      int v39 = 138543362;
      id v40 = v29;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "[Install-Op]: Prepare ... overriding install path to: %{public}@", (uint8_t *)&v39, 0xCu);
    }
    unsigned __int8 v12 = 0;
  }
  else
  {
    id v30 = BLBookInstallLog();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      id v31 = [v5 persistentIdentifier];
      uint64_t v32 = [v5 title];
      int v39 = 138543618;
      id v40 = v31;
      __int16 v41 = 2112;
      long long v42 = v32;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "[Install-Op]: Prepare ... backup path not found on a restore.  This is fatal ... persitentID == %{public}@, title == %@", (uint8_t *)&v39, 0x16u);
    }
    unsigned __int8 v12 = sub_10004B6AC(36, @"Bad backup plist", @"This backup path for this entry could not be found.");
  }

  if (a3) {
LABEL_30:
  }
    *a3 = v12;
LABEL_31:

  return v13;
}

- (BOOL)sharedDownload
{
  if (+[BLLibraryUtility _isMultiUser])
  {
    v3 = [(BLBaseBookInstallOperation *)self installInfo];
    id v4 = [v3 isSample];
    unsigned int v5 = [v4 BOOLValue] ^ 1;
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (void)main
{
  v3 = BLBookInstallLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(BLBaseBookInstallOperation *)self downloadID];
    *(_DWORD *)buf = 138543362;
    v62 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [Install-Op]: Operation began for download", buf, 0xCu);
  }
  id v58 = 0;
  unsigned __int8 v5 = [(BLEBookInstallOperation *)self _prepareOperation:&v58];
  uint64_t v6 = (__CFString *)v58;
  if (v5)
  {
    v7 = [(BLBaseBookInstallOperation *)self installInfo];
    id v8 = [v7 databaseManager];
    id v9 = [(BLBaseBookInstallOperation *)self downloadID];
    [v8 syncSaveDownloadStateWithId:v9 state:8];

    unsigned int v10 = +[NSUserDefaults standardUserDefaults];
    if ([v10 BOOLForKey:@"BKSimulateCrashAtInstallStart"])
    {
      BOOL v11 = BLBookInstallLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        unsigned __int8 v12 = [(BLBaseBookInstallOperation *)self downloadID];
        *(_DWORD *)buf = 138543362;
        v62 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [Install-Op]: Simulating a crash during install start", buf, 0xCu);
      }
      [v10 removeObjectForKey:@"BKSimulateCrashAtInstallStart"];
      [v10 synchronize];
      raise(11);
    }
    if (+[BLLibraryUtility _isMultiUser]) {
      [(BLEBookInstallOperation *)self sharedManifest];
    }
    else {
    id v15 = [(BLEBookInstallOperation *)self purchaseManifest];
    }
    v16 = [(BLBaseBookInstallOperation *)self installInfo];
    v17 = [v16 permlink];

    long long v18 = [(BLBaseBookInstallOperation *)self installInfo];
    unsigned int v19 = [v18 isStoreDownload];

    if (v19)
    {
      long long v20 = [(BLBaseBookInstallOperation *)self installInfo];
      BOOL v21 = [v20 storeIdentifier];
      id v22 = [(BLBaseBookInstallOperation *)self installInfo];
      v23 = [v22 storePublicationVersion];
      v24 = [v15 bookPathForAdamID:v21 withPublicationVersion:v23];
      [(BLEBookInstallOperation *)self setBookPath:v24];
    }
    else
    {
      if (![v17 length]) {
        goto LABEL_19;
      }
      long long v20 = [v15 bookPathPermalink:v17];
      [(BLEBookInstallOperation *)self setBookPath:v20];
    }

LABEL_19:
    unsigned int v25 = [(BLEBookInstallOperation *)self sharedDownload];
    v26 = [(BLEBookInstallOperation *)self bookPath];
    id v27 = [v26 length];

    if (!v25)
    {
      unsigned int v37 = BLBookInstallLog();
      BOOL v38 = os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT);
      if (v27)
      {
        if (v38)
        {
          int v39 = [(BLBaseBookInstallOperation *)self downloadID];
          *(_DWORD *)buf = 138543362;
          v62 = v39;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [Install-Op]: We have an existing, non-shared download", buf, 0xCu);
        }
        [(BLEBookInstallOperation *)self setShouldSkipAssetInstallation:1];
LABEL_36:
        if ([(BLEBookInstallOperation *)self shouldSkipAssetInstallation])
        {
          long long v44 = 0;
        }
        else
        {
          __int16 v45 = [BLDownloadDRMOperation alloc];
          v46 = [(BLBaseBookInstallOperation *)self installInfo];
          long long v44 = [(BLDownloadDRMOperation *)v45 initWithInstallInfo:v46];

          [(BLDownloadDRMOperation *)v44 start];
          if (![(BLDownloadDRMOperation *)v44 success])
          {
            [(BLBaseBookInstallOperation *)self setSuccess:0];
            __int16 v47 = [(BLDownloadDRMOperation *)v44 error];
            [(BLBaseBookInstallOperation *)self setError:v47];

            goto LABEL_41;
          }
        }
        [(BLEBookInstallOperation *)self run];
LABEL_41:
        if ([(BLBaseBookInstallOperation *)self success]
          && [(BLEBookInstallOperation *)self sharedDownload])
        {
          v59 = BLSharedStorageUseChangedSourceKey;
          CFStringRef v60 = @"installOperation";
          v48 = +[NSDictionary dictionaryWithObjects:&v60 forKeys:&v59 count:1];
          CFStringRef v49 = +[NSNotificationCenter defaultCenter];
          [v49 postNotificationName:BLSharedStorageUseChangedNotification object:0 userInfo:v48];
        }
        __int16 v50 = [(BLBaseBookInstallOperation *)self error];

        CFStringRef v51 = BLBookInstallLog();
        v52 = v51;
        if (v50)
        {
          if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
          {
            v53 = [(BLBaseBookInstallOperation *)self downloadID];
            if ([(BLBaseBookInstallOperation *)self success]) {
              CFStringRef v54 = @"succeeded";
            }
            else {
              CFStringRef v54 = @"failed";
            }
            v55 = [(BLBaseBookInstallOperation *)self error];
            *(_DWORD *)buf = 138543874;
            v62 = v53;
            __int16 v63 = 2114;
            CFStringRef v64 = v54;
            __int16 v65 = 2112;
            v66 = v55;
            _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, "(dID=%{public}@) [Install-Op]: Operation %{public}@ for download, error:  %@", buf, 0x20u);

LABEL_54:
          }
        }
        else if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          v53 = [(BLBaseBookInstallOperation *)self downloadID];
          unsigned int v56 = [(BLBaseBookInstallOperation *)self success];
          CFStringRef v57 = @"failed";
          if (v56) {
            CFStringRef v57 = @"succeeded";
          }
          *(_DWORD *)buf = 138543618;
          v62 = v53;
          __int16 v63 = 2114;
          CFStringRef v64 = v57;
          _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [Install-Op]: Operation %{public}@ for download", buf, 0x16u);
          goto LABEL_54;
        }

        goto LABEL_56;
      }
      if (v38)
      {
        id v40 = [(BLBaseBookInstallOperation *)self downloadID];
        *(_DWORD *)buf = 138543362;
        v62 = v40;
        __int16 v41 = "(dID=%{public}@) [Install-Op]: We have a new, non-shared download";
        long long v42 = v37;
        os_log_type_t v43 = OS_LOG_TYPE_DEFAULT;
        goto LABEL_34;
      }
LABEL_35:

      goto LABEL_36;
    }
    if (v27)
    {
      v28 = [(BLEBookInstallOperation *)self _bookManifest];
      v29 = [v28 manifestPath];
      id v30 = [v29 stringByDeletingLastPathComponent];
      id v31 = [(BLEBookInstallOperation *)self bookPath];
      uint64_t v32 = [v30 stringByAppendingPathComponent:v31];
      [(BLEBookInstallOperation *)self setDrmPath:v32];

      [(BLEBookInstallOperation *)self setShouldSkipAssetInstallation:1];
      v33 = BLBookInstallLog();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        v34 = [(BLBaseBookInstallOperation *)self downloadID];
        v35 = [(BLEBookInstallOperation *)self bookPath];
        v36 = [(BLEBookInstallOperation *)self drmPath];
        *(_DWORD *)buf = 138543874;
        v62 = v34;
        __int16 v63 = 2112;
        CFStringRef v64 = v35;
        __int16 v65 = 2112;
        v66 = v36;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [Install-Op]: We have an existing shared download. Book at %@, sinf at %@.", buf, 0x20u);
      }
    }
    else
    {
      v28 = BLBookInstallLog();
      if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_30;
      }
      v33 = [(BLBaseBookInstallOperation *)self downloadID];
      *(_DWORD *)buf = 138543362;
      v62 = v33;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [Install-Op]: We have a new shared download.", buf, 0xCu);
    }

LABEL_30:
    unsigned int v37 = BLBookInstallLog();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    {
      id v40 = +[IMLibraryPlist sharedRepositoryPath];
      *(_DWORD *)buf = 138543362;
      v62 = v40;
      __int16 v41 = "[Install-Op]: Shared book container location is: %{public}@";
      long long v42 = v37;
      os_log_type_t v43 = OS_LOG_TYPE_DEBUG;
LABEL_34:
      _os_log_impl((void *)&_mh_execute_header, v42, v43, v41, buf, 0xCu);

      goto LABEL_35;
    }
    goto LABEL_35;
  }
  BOOL v13 = BLBookInstallLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    BOOL v14 = [(BLBaseBookInstallOperation *)self downloadID];
    *(_DWORD *)buf = 138543618;
    v62 = v14;
    __int16 v63 = 2112;
    CFStringRef v64 = v6;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "(dID=%{public}@) [Install-Op]: Prepare failed. Bailing install. Error:  %@", buf, 0x16u);
  }
  [(BLBaseBookInstallOperation *)self setSuccess:0];
  [(BLBaseBookInstallOperation *)self setError:v6];
LABEL_56:
}

- (void)run
{
  v3 = [(BLEBookInstallOperation *)self drmPath];
  if ([(BLEBookInstallOperation *)self shouldSkipAssetInstallation])
  {
    if (v3)
    {
      if ([v3 length]) {
        CFStringRef v4 = @"not empty";
      }
      else {
        CFStringRef v4 = @"empty";
      }
    }
    else
    {
      CFStringRef v4 = @"nil";
    }
    BOOL v13 = BLBookInstallLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v14 = [(BLBaseBookInstallOperation *)self installInfo];
      id v15 = [v14 downloadID];
      *(_DWORD *)buf = 138543874;
      uint64_t v32 = v15;
      __int16 v33 = 2112;
      v34 = v3;
      __int16 v35 = 2114;
      CFStringRef v36 = v4;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [Install-Op] Skipping installMediaAsset because shouldSkipAssetIntallation is true. drmPath is %@ (is %{public}@).", buf, 0x20u);
    }
    id v10 = 0;
    id v7 = 0;
    id v8 = 0;
  }
  else
  {
    unsigned __int8 v5 = [(BLBaseBookInstallOperation *)self installInfo];
    id v29 = 0;
    id v30 = 0;
    id v27 = 0;
    id v28 = v3;
    unsigned int v6 = [(BLEBookInstallOperation *)self _installMediaAsset:v5 assetInstalledPath:&v30 fileName:&v29 drmPath:&v28 error:&v27];
    id v7 = v30;
    id v8 = v29;
    id v9 = v28;

    id v10 = v27;
    if (!v6)
    {
      uint64_t v11 = 0;
      id v12 = 0;
      v3 = v9;
      goto LABEL_20;
    }
    v3 = v9;
  }
  v16 = [(BLBaseBookInstallOperation *)self installInfo];
  v17 = [v16 databaseManager];
  long long v18 = [(BLBaseBookInstallOperation *)self downloadID];
  [v17 syncSaveDownloadStateWithId:v18 state:15];

  if (![(BLEBookInstallOperation *)self shouldSkipAssetInstallation])
  {
    id v19 = objc_alloc_init((Class)NSFileManager);
    buf[0] = 0;
    [v19 fileExistsAtPath:v7 isDirectory:buf];
    [(BLEBookInstallOperation *)self _installITunesArtwork:v7 isDirectory:buf[0]];
    [(BLEBookInstallOperation *)self _installITunesMetadataPlist:v7 isDirectory:buf[0]];
  }
  long long v20 = +[NSUserDefaults standardUserDefaults];
  if ([v20 BOOLForKey:@"BKSimulateCrashAtInstallDuringFinish"])
  {
    BOOL v21 = BLBookInstallLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      id v22 = [(BLBaseBookInstallOperation *)self installInfo];
      v23 = [v22 downloadID];
      *(_DWORD *)buf = 138543362;
      uint64_t v32 = v23;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [Install-Op]: Simulating a crash during install finish", buf, 0xCu);
    }
    [v20 removeObjectForKey:@"BKSimulateCrashAtInstallDuringFinish"];
    [v20 synchronize];
    raise(11);
  }
  [(BLEBookInstallOperation *)self _installEpubRights:v3];
  [(BLEBookInstallOperation *)self _addPurchaseManifestItem:[(BLEBookInstallOperation *)self shouldSkipAssetInstallation]];
  v24 = [(BLBaseBookInstallOperation *)self installInfo];
  unsigned int v25 = [v24 databaseManager];
  v26 = [(BLBaseBookInstallOperation *)self downloadID];
  [v25 syncSaveDownloadStateWithId:v26 state:16];

  uint64_t v11 = 1;
  id v12 = v7;
LABEL_20:
  [(BLBaseBookInstallOperation *)self setSuccess:v11];
  [(BLBaseBookInstallOperation *)self setInstalledAssetPath:v12];
  [(BLBaseBookInstallOperation *)self setError:v10];
}

- (void)_installITunesMetadataPlist:(id)a3 isDirectory:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(BLEBookInstallOperation *)self _bookManifest];
  id v8 = [(BLEBookInstallOperation *)self purchaseManifest];
  if (v7 == v8)
  {
    BOOL v13 = [(BLBaseBookInstallOperation *)self plistPath];
    id v14 = [v13 length];

    if (v14)
    {
      if (v4)
      {
        uint64_t v11 = [v6 stringByAppendingPathComponent:@"iTunesMetadata.plist"];
      }
      else
      {
        id v15 = [v6 stringByDeletingPathExtension];
        uint64_t v11 = [v15 stringByAppendingPathExtension:@"plist"];
      }
      v16 = [(BLBaseBookInstallOperation *)self plistPath];
      id v21 = 0;
      unsigned __int8 v17 = [(BLBaseBookInstallOperation *)self _moveFile:v16 toPath:v11 error:&v21];
      id v18 = v21;

      if ((v17 & 1) == 0)
      {
        id v19 = BLBookInstallLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          long long v20 = [(BLBaseBookInstallOperation *)self downloadID];
          *(_DWORD *)buf = 138543618;
          v23 = v20;
          __int16 v24 = 2112;
          id v25 = v18;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "(dID=%{public}@) [Install-Op]: Failed to install iTunesMetadata.plist. Error:  %@", buf, 0x16u);
        }
      }

      goto LABEL_15;
    }
  }
  else
  {
  }
  id v9 = [(BLBaseBookInstallOperation *)self plistPath];
  id v10 = [v9 length];

  if (!v10)
  {
    uint64_t v11 = BLBookInstallLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [(BLBaseBookInstallOperation *)self downloadID];
      *(_DWORD *)buf = 138543362;
      v23 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [Install-Op]: No iTunesMetadata.plist to install.", buf, 0xCu);
    }
LABEL_15:
  }
}

- (void)_installITunesArtwork:(id)a3 isDirectory:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(BLBaseBookInstallOperation *)self artworkPath];
  id v8 = [v7 length];

  if (v8)
  {
    if (v4)
    {
      id v9 = [v6 stringByAppendingPathComponent:@"iTunesArtwork"];
    }
    else
    {
      id v12 = [v6 stringByDeletingPathExtension];
      id v9 = [v12 stringByAppendingPathExtension:@"jpg"];
    }
    BOOL v13 = BLBookInstallLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = [(BLBaseBookInstallOperation *)self downloadID];
      id v15 = [(BLBaseBookInstallOperation *)self artworkPath];
      *(_DWORD *)buf = 138543874;
      id v25 = v14;
      __int16 v26 = 2112;
      id v27 = v15;
      __int16 v28 = 2112;
      id v29 = v9;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [Install-Op]: Moving asset %@ to %@.", buf, 0x20u);
    }
    v16 = [(BLBaseBookInstallOperation *)self artworkPath];
    id v22 = 0;
    id v23 = v9;
    unsigned int v17 = [(BLBaseBookInstallOperation *)self _moveFile:v16 toPath:&v23 installBehavior:0 error:&v22];
    id v10 = v23;

    id v18 = v22;
    if (v17)
    {
      id v19 = [(BLBaseBookInstallOperation *)self installInfo];
      long long v20 = [v19 fileAttributes];

      if ([v20 count])
      {
        id v21 = +[NSFileManager defaultManager];
        [v21 setAttributes:v20 ofItemAtPath:v10 error:0];
      }
    }
  }
  else
  {
    id v10 = BLBookInstallLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [(BLBaseBookInstallOperation *)self downloadID];
      *(_DWORD *)buf = 138543362;
      id v25 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [Install-Op]: No iTunesArtwork to install.", buf, 0xCu);
    }
  }
}

- (void)_installEpubRights:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(BLBaseBookInstallOperation *)self installInfo];
  id v6 = [v5 epubRightsPath];
  id v7 = [v6 length];

  if (v7)
  {
    id v8 = +[NSFileManager defaultManager];
    id v9 = [v4 stringByAppendingPathComponent:@"META-INF"];
    id v10 = [v9 stringByAppendingPathComponent:@"sinf.xml"];
    uint64_t v11 = BLBookInstallLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [(BLBaseBookInstallOperation *)self installInfo];
      BOOL v13 = [v12 downloadID];
      *(_DWORD *)buf = 138543618;
      __int16 v35 = v13;
      __int16 v36 = 2112;
      unsigned int v37 = v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [Install-Op]: Writing EPR data for download to path: %@", buf, 0x16u);
    }
    unsigned __int8 v33 = 0;
    unsigned int v14 = [v8 fileExistsAtPath:v9 isDirectory:&v33];
    id v15 = 0;
    int v16 = v33;
    if (v14 && !v33)
    {
      id v32 = 0;
      unsigned int v17 = [v8 removeItemAtPath:v9 error:&v32];
      id v15 = v32;
      if (!v17)
      {
        __int16 v24 = BLBookInstallLog();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          __int16 v28 = [(BLBaseBookInstallOperation *)self installInfo];
          id v29 = [v28 downloadID];
          *(_DWORD *)buf = 138543874;
          __int16 v35 = v29;
          __int16 v36 = 2114;
          unsigned int v37 = v9;
          __int16 v38 = 2112;
          id v39 = v15;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "(dID=%{public}@) [Install-Op]: Something exists at DRM Path %{public}@ and could not be removed. Error:  %@", buf, 0x20u);
        }
        id v20 = v15;
        goto LABEL_23;
      }
      int v16 = v33;
    }
    if (v16) {
      char v18 = v14;
    }
    else {
      char v18 = 0;
    }
    if ((v18 & 1) == 0)
    {
      id v31 = v15;
      unsigned int v19 = [v8 createDirectoryAtPath:v9 withIntermediateDirectories:1 attributes:0 error:&v31];
      id v20 = v31;

      if (!v19)
      {
        __int16 v24 = BLBookInstallLog();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          id v25 = [(BLBaseBookInstallOperation *)self installInfo];
          __int16 v26 = [v25 downloadID];
          *(_DWORD *)buf = 138543874;
          __int16 v35 = v26;
          __int16 v36 = 2114;
          unsigned int v37 = v9;
          __int16 v38 = 2112;
          id v39 = v20;
          id v27 = "(dID=%{public}@) [Install-Op]: Unable to create DRM directory at path: %{public}@. Error:  %@";
          goto LABEL_22;
        }
LABEL_23:

        goto LABEL_24;
      }
      id v15 = v20;
    }
    id v21 = [(BLBaseBookInstallOperation *)self installInfo];
    id v22 = [v21 epubRightsPath];
    id v30 = v15;
    unsigned __int8 v23 = [v8 moveItemAtPath:v22 toPath:v10 error:&v30];
    id v20 = v30;

    if (v23)
    {
LABEL_24:

      goto LABEL_25;
    }
    __int16 v24 = BLBookInstallLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      id v25 = [(BLBaseBookInstallOperation *)self installInfo];
      __int16 v26 = [v25 downloadID];
      *(_DWORD *)buf = 138543874;
      __int16 v35 = v26;
      __int16 v36 = 2114;
      unsigned int v37 = v9;
      __int16 v38 = 2112;
      id v39 = v20;
      id v27 = "(dID=%{public}@) [Install-Op]: Error EPR data for download to path: %{public}@. Error:  %@";
LABEL_22:
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, v27, buf, 0x20u);

      goto LABEL_23;
    }
    goto LABEL_23;
  }
LABEL_25:
}

- (id)_newManifestEntry:(id)a3
{
  return [(BLEBookInstallOperation *)self _newManifestEntry:0 withFileName:a3];
}

- (id)_newManifestEntry:(BOOL)a3 withFileName:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(BLBaseBookInstallOperation *)self installInfo];
  id v8 = [v7 manifestEntry:v4 withFileName:v6];

  return v8;
}

- (void)_removeDuplicateEntry:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = [(BLBaseBookInstallOperation *)self installInfo];
  id v6 = [v5 storeIdentifier];

  if (v6)
  {
    id v7 = BLBookInstallLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v23) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[Install-Op]: Looking for duplicate from purchase manifest for store book", (uint8_t *)&v23, 2u);
    }

    id v8 = [v4 manifestEntriesWithProperty:@"s" equalToNumber:v6 limitCount:1];
    id v9 = [v8 count];
    id v10 = BLBookInstallLog();
    uint64_t v11 = v10;
    if (v9 == (id)1)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        id v12 = [v8 firstObject];
        int v23 = 138412290;
        __int16 v24 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[Install-Op]: Removing for duplicate store book entry from purchase manifest: %@", (uint8_t *)&v23, 0xCu);
      }
      [v4 removeManifestEntryWithStoreItemID:v6];
    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v23) = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "[Install-Op]: Did not find a duplicate store book entry in purchase manifest", (uint8_t *)&v23, 2u);
      }
    }
LABEL_21:

    goto LABEL_22;
  }
  BOOL v13 = [(BLBaseBookInstallOperation *)self installInfo];
  unsigned int v14 = [v13 permlink];
  id v15 = [v14 length];

  if (v15)
  {
    int v16 = BLBookInstallLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v23) = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "[Install-Op]: Looking for duplicate entry from purchase manifest for edu mode book", (uint8_t *)&v23, 2u);
    }

    unsigned int v17 = [(BLBaseBookInstallOperation *)self installInfo];
    char v18 = [v17 permlink];
    id v8 = [v4 manifestEntriesWithProperty:@"iTunesU Permlink" equalToValue:v18 limitCount:1];

    id v19 = [v8 count];
    id v20 = BLBookInstallLog();
    id v21 = v20;
    if (v19 == (id)1)
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        LOWORD(v23) = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "[Install-Op]: Removing for duplicate store book entry from purchase manifest", (uint8_t *)&v23, 2u);
      }

      id v21 = [(BLBaseBookInstallOperation *)self installInfo];
      id v22 = [v21 permlink];
      [v4 removeManifestEntryWithDownloadPermalink:v22];
    }
    else if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v23) = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "[Install-Op]: Did not find a duplicate store book entry in purchase manifest", (uint8_t *)&v23, 2u);
    }

    goto LABEL_21;
  }
LABEL_22:
}

- (void)_addPurchaseManifestItem:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned __int8 v5 = BLBookInstallLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LOWORD(v27) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[Install-Op]: Adding purchase manifest", (uint8_t *)&v27, 2u);
  }

  id v6 = [(BLEBookInstallOperation *)self _bookManifest];
  if ([(BLEBookInstallOperation *)self sharedDownload])
  {
    id v7 = BLBookInstallLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [v6 manifestPath];
      int v27 = 138543362;
      __int16 v28 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[Install-Op]: Updating purchase manifest for shared download at user path: %{public}@", (uint8_t *)&v27, 0xCu);
    }
    [(BLEBookInstallOperation *)self _removeDuplicateEntry:v6];
    if (v3) {
      bookPath = self->_bookPath;
    }
    else {
      bookPath = 0;
    }
    uint64_t v11 = [(BLEBookInstallOperation *)self _newManifestEntry:bookPath];
    [v6 addManifestEntry:v11];
    [v6 synchronizeData];
    if (!v3)
    {
      BOOL v13 = [(BLEBookInstallOperation *)self sharedManifest];
      unsigned int v14 = BLBookInstallLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = [v13 manifestPath];
        int v27 = 138543362;
        __int16 v28 = v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[Install-Op]: Updating shared manifest at path: %{public}@", (uint8_t *)&v27, 0xCu);
      }
      [(BLEBookInstallOperation *)self _removeDuplicateEntry:v13];
      id v16 = [(BLEBookInstallOperation *)self _newManifestEntry:1 withFileName:0];
      [v13 addManifestEntry:v16];
      [v13 synchronizeData];
    }
    goto LABEL_26;
  }
  unsigned int v10 = [(BLEBookInstallOperation *)self shouldSkipAssetInstallation];
  uint64_t v11 = BLBookInstallLog();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (!v10)
  {
    if (v12)
    {
      unsigned int v17 = [v6 manifestPath];
      int v27 = 138543362;
      __int16 v28 = v17;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[Install-Op]: Updating purchase single user manifest: %{public}@", (uint8_t *)&v27, 0xCu);
    }
    uint64_t v11 = [(BLBaseBookInstallOperation *)self destinationFilename];
    char v18 = [(BLBaseBookInstallOperation *)self installInfo];
    id v19 = [v18 persistentIdentifier];
    if (v19)
    {
    }
    else
    {
      id v20 = [(BLBaseBookInstallOperation *)self installInfo];
      id v21 = [v20 isRestore];
      unsigned __int8 v22 = [v21 BOOLValue];

      if ((v22 & 1) == 0)
      {
        id v25 = BLBookInstallLog();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v27) = 0;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "[Install-Op]: Updating purchase manifest since isRestore == NO.", (uint8_t *)&v27, 2u);
        }

        __int16 v24 = [v6 manifestEntriesWithProperty:@"Path" equalToValue:v11 limitCount:1];
        if ([v24 count]) {
          goto LABEL_25;
        }
        int v23 = [(BLEBookInstallOperation *)self _existingManifestEntry];
        if (v23) {
          [(BLEBookInstallOperation *)self _removeDuplicateEntry:v6];
        }
        id v26 = [(BLEBookInstallOperation *)self _newManifestEntry:0];
        [v6 addManifestEntry:v26];
        [v6 synchronizeData];

LABEL_24:
LABEL_25:

        goto LABEL_26;
      }
    }
    int v23 = BLBookInstallLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v27) = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "[Install-Op]: Not updating purchase manifest because this is a restore download.", (uint8_t *)&v27, 2u);
    }
    __int16 v24 = 0;
    goto LABEL_24;
  }
  if (v12)
  {
    LOWORD(v27) = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "[Install-Op]: Skip insertion of manifest entry for existing asset.", (uint8_t *)&v27, 2u);
  }
LABEL_26:
}

- (id)_bookManifest
{
  BOOL v3 = [(BLEBookInstallOperation *)self purchaseManifest];
  id v4 = [(BLEBookInstallOperation *)self syncManifest];
  unsigned __int8 v5 = [(BLBaseBookInstallOperation *)self installInfo];
  id v6 = [v5 libraryItemIdentifier];

  id v7 = BLBookInstallLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v29 = 138412290;
    id v30 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[Install-Op]: Looking for book manifest for libraryItemIdentifier: %@ ...", (uint8_t *)&v29, 0xCu);
  }

  if (!v6) {
    goto LABEL_14;
  }
  id v8 = [v4 manifestEntriesWithProperty:@"Persistent ID" equalToValue:v6 limitCount:1];
  if ([v8 count] == (id)1)
  {
    id v9 = v4;
    unsigned int v10 = BLBookInstallLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v29) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[Install-Op]: Using sync manifest.", (uint8_t *)&v29, 2u);
    }
  }
  else
  {
    uint64_t v11 = [v3 manifestEntriesWithProperty:@"Persistent ID" equalToValue:v6 limitCount:1];

    if ([v11 count] != (id)1)
    {

      goto LABEL_14;
    }
    id v9 = v3;
    unsigned int v10 = BLBookInstallLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v29) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[Install-Op]: Using purchase manifest.", (uint8_t *)&v29, 2u);
    }
    id v8 = v11;
  }

  if (!v9)
  {
LABEL_14:
    BOOL v12 = BLBookInstallLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v13 = [(BLBaseBookInstallOperation *)self downloadedAssetPath];
      int v29 = 138543362;
      id v30 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[Install-Op]: Manifest not found by using the libraryItemIdentifier ... using downloadedAssetPath: %{public}@", (uint8_t *)&v29, 0xCu);
    }
    unsigned int v14 = [(BLBaseBookInstallOperation *)self downloadedAssetPath];
    id v15 = [(BLBaseBookInstallOperation *)self installInfo];
    id v16 = [v15 isRestore];
    unsigned int v17 = [v16 BOOLValue];

    if (v17)
    {
      char v18 = [(BLBaseBookInstallOperation *)self installInfo];
      uint64_t v19 = [v18 fullRestoreFilePath];

      unsigned int v14 = (void *)v19;
    }
    id v20 = +[IMLibraryPlist purchasesRepositoryPath];
    unsigned int v21 = [v14 hasPrefix:v20];

    if (v21)
    {
      id v9 = v3;
      unsigned __int8 v22 = BLBookInstallLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v29) = 0;
        int v23 = "[Install-Op]: Using purchase manifest.";
LABEL_26:
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, v23, (uint8_t *)&v29, 2u);
      }
    }
    else
    {
      __int16 v24 = +[NSURL bu_booksRepositoryURL];
      id v25 = [v24 path];
      unsigned int v26 = [v14 hasPrefix:v25];

      if (v26)
      {
        id v9 = v4;
        unsigned __int8 v22 = BLBookInstallLog();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v29) = 0;
          int v23 = "[Install-Op]: Using sync manifest.";
          goto LABEL_26;
        }
      }
      else
      {
        id v9 = v3;
        unsigned __int8 v22 = BLBookInstallLog();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v29) = 0;
          int v23 = "[Install-Op]: Defaulting to purchase manifest.";
          goto LABEL_26;
        }
      }
    }
  }
  id v27 = v9;

  return v27;
}

- (id)_existingManifestEntry
{
  BOOL v3 = [(BLBaseBookInstallOperation *)self installInfo];
  id v4 = [v3 libraryItemIdentifier];

  unsigned __int8 v5 = [(BLBaseBookInstallOperation *)self installInfo];
  id v6 = [v5 storeIdentifier];

  if (v4)
  {
    id v7 = [(BLEBookInstallOperation *)self syncManifest];
    id v8 = [v7 manifestEntriesWithProperty:@"Persistent ID" equalToValue:v4 limitCount:1];

    if ([v8 count] == (id)1) {
      goto LABEL_9;
    }
    id v9 = [(BLEBookInstallOperation *)self purchaseManifest];
    unsigned int v10 = v9;
    CFStringRef v11 = @"Persistent ID";
    BOOL v12 = v4;
LABEL_7:
    unsigned int v14 = [v9 manifestEntriesWithProperty:v11 equalToValue:v12 limitCount:1];

    if ([v14 count] != (id)1)
    {
      id v15 = 0;
      goto LABEL_11;
    }
    id v8 = v14;
LABEL_9:
    id v15 = [v8 objectAtIndex:0];
    unsigned int v14 = v8;
LABEL_11:

    goto LABEL_12;
  }
  if (v6)
  {
    BOOL v13 = [(BLEBookInstallOperation *)self syncManifest];
    id v8 = [v13 manifestEntriesWithProperty:@"s" equalToValue:v6 limitCount:1];

    if ([v8 count] == (id)1) {
      goto LABEL_9;
    }
    id v9 = [(BLEBookInstallOperation *)self purchaseManifest];
    unsigned int v10 = v9;
    CFStringRef v11 = @"s";
    BOOL v12 = v6;
    goto LABEL_7;
  }
  id v15 = 0;
LABEL_12:

  return v15;
}

- (BOOL)_unzipAsset:(id)a3 unzippedPath:(id *)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = [v7 assetPath];
  id v9 = [v8 stringByAppendingPathExtension:@"ext"];
  unsigned int v10 = [BLExtractFileOperation alloc];
  CFStringRef v11 = [v7 fileAttributes];
  BOOL v12 = [(BLExtractFileOperation *)v10 initWithSoucePath:v8 destinationPath:v9 fileAttributes:v11 installInfo:v7];

  [(BLExtractFileOperation *)v12 start];
  unsigned int v13 = [(BLExtractFileOperation *)v12 success];
  unsigned int v14 = [(BLExtractFileOperation *)v12 error];
  id v15 = v14;
  if (v13)
  {
    unsigned int v14 = v9;
    if (!a4) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  a4 = a5;
  if (a5) {
LABEL_5:
  }
    *a4 = v14;
LABEL_6:

  return v13;
}

- (BOOL)_installMediaAsset:(id)a3 assetInstalledPath:(id *)a4 fileName:(id *)a5 drmPath:(id *)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = objc_alloc_init((Class)NSFileManager);
  unsigned int v14 = [(BLBaseBookInstallOperation *)self downloadedAssetPath];
  char v97 = 0;
  if (([v13 fileExistsAtPath:v14 isDirectory:&v97] & 1) == 0)
  {
    unsigned __int8 v22 = BLBookInstallLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v99 = v14;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "[Install-Op]: Could not install non-existant file: %@", buf, 0xCu);
    }

    int v23 = +[NSString stringWithFormat:@"%@: Could not install non-existant file: %@", objc_opt_class(), v14];
    __int16 v24 = sub_10004B6AC(7, 0, v23);
LABEL_11:

    id v19 = 0;
    id v27 = 0;
    __int16 v28 = 0;
    BOOL v29 = 0;
    if (!a7) {
      goto LABEL_67;
    }
    goto LABEL_12;
  }
  id v15 = [(BLEBookInstallOperation *)self _bookManifest];
  if (!v15)
  {
    BLBookInstallLog();
    int v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_ERROR))
    {
      id v25 = [(BLBaseBookInstallOperation *)self installInfo];
      unsigned int v26 = [v25 downloadID];
      *(_DWORD *)buf = 138543362;
      v99 = v26;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v23, OS_LOG_TYPE_ERROR, "(dID=%{public}@) No manifest entry found for book.", buf, 0xCu);
    }
    __int16 v24 = 0;
    goto LABEL_11;
  }
  id v16 = v15;
  v81 = a4;
  v82 = a5;
  v87 = a6;
  unsigned int v17 = [v15 manifestPath];
  char v18 = [v17 stringByDeletingLastPathComponent];

  id v19 = [(BLBaseBookInstallOperation *)self destinationFilename];
  uint64_t v20 = [(BLEBookInstallOperation *)self syncManifest];
  v85 = v16;
  v86 = a7;
  if (v16 == (void *)v20)
  {
    id v30 = [(BLBaseBookInstallOperation *)self installInfo];
    id v31 = [v30 isRestore];
    unsigned __int8 v32 = [v31 BOOLValue];

    if (v32) {
      goto LABEL_22;
    }
    unsigned int v21 = [v19 pathExtension];
    unsigned __int8 v33 = [v14 lastPathComponent];

    if ([v21 length])
    {
      v34 = [v33 pathExtension];
      id v35 = [v34 length];

      if (!v35)
      {
        uint64_t v36 = [v33 stringByAppendingPathExtension:v21];

        unsigned __int8 v33 = v36;
      }
    }
    unsigned int v37 = BLBookInstallLog();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v38 = [(BLBaseBookInstallOperation *)self destinationFilename];
      id v39 = [v12 title];
      *(_DWORD *)buf = 138412802;
      v99 = v38;
      __int16 v100 = 2112;
      v101 = v33;
      __int16 v102 = 2112;
      v103 = v39;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "[Install-Op]: Alert: just hit the unlikely code path: [original filename: %@ | new filename: %@ | book title: %@]", buf, 0x20u);
    }
    id v19 = v33;
  }
  else
  {
    unsigned int v21 = (void *)v20;
  }

LABEL_22:
  id v27 = [v18 stringByAppendingPathComponent:v19];
  if ([(BLEBookInstallOperation *)self sharedDownload])
  {
    id v40 = +[IMLibraryPlist sharedRepositoryPath];
    __int16 v28 = [v40 stringByAppendingPathComponent:v19];

    __int16 v41 = BLBookInstallLog();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v99 = v28;
      __int16 v100 = 2112;
      v101 = v27;
      long long v42 = "[Install-Op]: Saving Book to %@, DRM to %@";
      os_log_type_t v43 = v41;
      uint32_t v44 = 22;
LABEL_27:
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, v42, buf, v44);
    }
  }
  else
  {
    __int16 v28 = [v27 copy];

    __int16 v41 = BLBookInstallLog();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v99 = v28;
      long long v42 = "[Install-Op]: Saving Book to %@";
      os_log_type_t v43 = v41;
      uint32_t v44 = 12;
      goto LABEL_27;
    }
  }

  __int16 v45 = [(BLBaseBookInstallOperation *)self installInfo];
  v46 = [v45 databaseManager];
  __int16 v47 = [(BLBaseBookInstallOperation *)self downloadID];
  [v46 syncSaveDownloadStateWithId:v47 state:13];

  v88 = +[NSUserDefaults standardUserDefaults];
  if ([v88 BOOLForKey:@"BKSimulateCrashAtInstallDuringUnzip"])
  {
    v48 = BLBookInstallLog();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v49 = [(BLBaseBookInstallOperation *)self installInfo];
      __int16 v50 = [v49 downloadID];
      *(_DWORD *)buf = 138543362;
      v99 = v50;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [Install-Op]: Simulating a crash during unzip", buf, 0xCu);
    }
    [v88 removeObjectForKey:@"BKSimulateCrashAtInstallDuringUnzip"];
    [v88 synchronize];
    raise(11);
  }
  if (v97)
  {
    unsigned int v51 = [v14 isEqualToString:v28];
    v52 = BLBookInstallLog();
    BOOL v53 = os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT);
    if (v51)
    {
      if (v53)
      {
        *(_DWORD *)buf = 138412290;
        v99 = v28;
        _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "[Install-Op]: Book already at destination: %@", buf, 0xCu);
      }

      char v54 = 0;
      __int16 v24 = 0;
      unsigned int v55 = 1;
    }
    else
    {
      if (v53)
      {
        *(_DWORD *)buf = 138412546;
        v99 = v14;
        __int16 v100 = 2112;
        v101 = v28;
        _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "[Install-Op]: Moving file: %@ to path: %@", buf, 0x16u);
      }

      v96 = v28;
      id v95 = 0;
      unsigned int v55 = [(BLBaseBookInstallOperation *)self _moveFile:v14 toPath:&v96 installBehavior:0 error:&v95];
      v61 = v96;

      __int16 v24 = v95;
      char v54 = 0;
      __int16 v28 = v61;
    }
  }
  else
  {
    unsigned int v56 = [(BLBaseBookInstallOperation *)self installInfo];
    id v93 = 0;
    id v94 = 0;
    unsigned int v57 = [(BLEBookInstallOperation *)self _unzipAsset:v56 unzippedPath:&v94 error:&v93];
    id v58 = v94;
    v83 = v93;

    char v80 = v57;
    v79 = v58;
    if (v57)
    {
      v92 = v28;
      [(BLBaseBookInstallOperation *)self _moveFile:v58 toPath:&v92 installBehavior:0 error:0];
      v59 = v92;

      CFStringRef v60 = BLBookInstallLog();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v99 = v59;
        _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "[Install-Op]: Installed file: %@", buf, 0xCu);
      }
      __int16 v24 = 0;
      unsigned int v55 = 1;
    }
    else
    {
      id v91 = 0;
      unsigned __int8 v62 = [v13 removeItemAtPath:v58 error:&v91];
      v78 = v91;
      if ((v62 & 1) == 0)
      {
        __int16 v63 = BLBookInstallLog();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v99 = v78;
          _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_ERROR, "[Install-Op]: Error trying to clean up unzippedPath after unzip failed:  %@", buf, 0xCu);
        }
      }
      CFStringRef v64 = [v28 pathExtension];
      v77 = v64;
      if (([v64 isEqualToString:@"epub"] & 1) != 0
        || [v64 isEqualToString:@"ibooks"])
      {
        __int16 v65 = BLBookInstallLog();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v99 = v14;
          __int16 v100 = 2112;
          v101 = v83;
          _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_ERROR, "[Install-Op]: Failing install after unzip failure for file: %{public}@, error:  %@", buf, 0x16u);
        }

        __int16 v24 = v83;
        unsigned int v55 = 0;
      }
      else
      {
        unsigned int v73 = [v14 isEqualToString:v28];
        v74 = BLBookInstallLog();
        BOOL v75 = os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT);
        if (v73)
        {
          if (v75)
          {
            *(_DWORD *)buf = 138412290;
            v99 = v28;
            _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "[Install-Op]: Book already at destination: %@", buf, 0xCu);
          }

          __int16 v24 = 0;
          unsigned int v55 = 1;
        }
        else
        {
          if (v75)
          {
            *(_DWORD *)buf = 138412546;
            v99 = v14;
            __int16 v100 = 2112;
            v101 = v28;
            _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "[Install-Op]: Moving file: %@ to path: %@", buf, 0x16u);
          }

          id v89 = 0;
          v90 = v28;
          unsigned int v55 = [(BLBaseBookInstallOperation *)self _moveFile:v14 toPath:&v90 installBehavior:0 error:&v89];
          v76 = v90;

          __int16 v24 = v89;
          __int16 v28 = v76;
        }
      }

      v59 = v28;
      CFStringRef v60 = v78;
    }

    __int16 v28 = v59;
    char v54 = v80;
  }
  if (v55 && (v54 & 1) == 0)
  {
    v66 = [v12 fileAttributes];
    if ([v66 count]) {
      [v13 setAttributes:v66 ofItemAtPath:v28 error:0];
    }
  }
  v84 = v14;
  id v67 = v13;
  id v68 = v12;
  v69 = [(BLBaseBookInstallOperation *)self installInfo];
  v70 = [v69 databaseManager];
  v71 = [(BLBaseBookInstallOperation *)self downloadID];
  [v70 syncSaveDownloadStateWithId:v71 state:14];

  BOOL v29 = v55 != 0;
  if (v87 && v55)
  {
    id *v81 = v28;
    id *v87 = v27;
  }
  a7 = v86;
  id v12 = v68;
  if (v19 && v55)
  {
    id v19 = v19;
    id *v82 = v19;
    BOOL v29 = 1;
    id v13 = v67;
    unsigned int v14 = v84;
    goto LABEL_67;
  }
  id v13 = v67;
  unsigned int v14 = v84;
  if (!v86) {
    goto LABEL_67;
  }
LABEL_12:
  if (!v29)
  {
    __int16 v24 = v24;
    *a7 = v24;
  }
LABEL_67:

  return v29;
}

- (NSString)bookPath
{
  return self->_bookPath;
}

- (void)setBookPath:(id)a3
{
}

- (BOOL)shouldSkipAssetInstallation
{
  return self->_shouldSkipAssetInstallation;
}

- (void)setShouldSkipAssetInstallation:(BOOL)a3
{
  self->_shouldSkipAssetInstallation = a3;
}

- (NSString)drmPath
{
  return self->_drmPath;
}

- (void)setDrmPath:(id)a3
{
}

- (BLBookManifest)purchaseManifest
{
  return self->_purchaseManifest;
}

- (void)setPurchaseManifest:(id)a3
{
}

- (BLBookManifest)syncManifest
{
  return self->_syncManifest;
}

- (void)setSyncManifest:(id)a3
{
}

- (BLBookManifest)sharedManifest
{
  return self->_sharedManifest;
}

- (void)setSharedManifest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedManifest, 0);
  objc_storeStrong((id *)&self->_syncManifest, 0);
  objc_storeStrong((id *)&self->_purchaseManifest, 0);
  objc_storeStrong((id *)&self->_drmPath, 0);

  objc_storeStrong((id *)&self->_bookPath, 0);
}

@end