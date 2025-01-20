@interface BLPDFInstallOperation
- (BAMetadataStoreManager)metadataStoreManager;
- (BLBookManifest)purchaseManifest;
- (BLBookManifest)syncManifest;
- (BLPDFInstallOperation)initWithInfo:(id)a3 metadataStoreManager:(id)a4;
- (BOOL)_installMediaAsset:(id)a3 assetInstalledPath:(id *)a4 error:(id *)a5;
- (NSString)bookPath;
- (id)_newManifestEntry;
- (void)_addPurchaseManifestItem;
- (void)_insertAdditionalEntryProperties:(id)a3;
- (void)_removeDuplicateEntry:(id)a3;
- (void)_repairManifestEntryIfNeeded:(id)a3 manifest:(id)a4;
- (void)_saveMigrationState;
- (void)main;
- (void)setBookPath:(id)a3;
- (void)setPurchaseManifest:(id)a3;
- (void)setSyncManifest:(id)a3;
@end

@implementation BLPDFInstallOperation

- (BLPDFInstallOperation)initWithInfo:(id)a3 metadataStoreManager:(id)a4
{
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)BLPDFInstallOperation;
  v8 = [(BLBaseBookInstallOperation *)&v15 initWithInfo:a3];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_metadataStoreManager, a4);
    uint64_t v10 = +[BLBookManifest purchasedBookManifest];
    purchaseManifest = v9->_purchaseManifest;
    v9->_purchaseManifest = (BLBookManifest *)v10;

    uint64_t v12 = +[BLBookManifest syncedBookManifest];
    syncManifest = v9->_syncManifest;
    v9->_syncManifest = (BLBookManifest *)v12;
  }
  return v9;
}

- (void)main
{
  v3 = [(BLBaseBookInstallOperation *)self installInfo];
  v4 = [v3 databaseManager];
  v5 = [(BLBaseBookInstallOperation *)self downloadID];
  [v4 syncSaveDownloadStateWithId:v5 state:8];

  v6 = +[NSUserDefaults standardUserDefaults];
  if ([v6 BOOLForKey:@"BKSimulateCrashAtInstallStart"])
  {
    id v7 = BLBookInstallLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = [(BLBaseBookInstallOperation *)self downloadID];
      *(_DWORD *)buf = 138543362;
      v75 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [PDFInstall-Op]: Simulating a crash during install start", buf, 0xCu);
    }
    [v6 removeObjectForKey:@"BKSimulateCrashAtInstallStart"];
    [v6 synchronize];
    raise(11);
  }
  v9 = [(BLBaseBookInstallOperation *)self downloadID];
  uint64_t v10 = [(BLBaseBookInstallOperation *)self installInfo];
  v11 = [(BLPDFInstallOperation *)self _bookManifest];
  uint64_t v12 = [v10 storeIdentifier];
  v13 = [v10 storePublicationVersion];
  v14 = [v11 bookPathForAdamID:v12 withPublicationVersion:v13];
  [(BLPDFInstallOperation *)self setBookPath:v14];

  objc_super v15 = [(BLPDFInstallOperation *)self bookPath];
  id v16 = [v15 length];

  if (v16)
  {
    v17 = BLBookInstallLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v75 = v9;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [PDFInstall-Op]: Skipping asset installation because we have an existing download.", buf, 0xCu);
    }
  }
  v18 = [(BLBaseBookInstallOperation *)self downloadedAssetPath];
  v19 = +[NSURL fileURLWithPath:v18];

  if (!v16)
  {
    v22 = [v10 databaseManager];
    [v22 syncSaveDownloadStateWithId:v9 state:11];

    v23 = [v10 encryptionKey];
    v24 = [v10 salt];
    id v73 = 0;
    LODWORD(v22) = +[BLPDFInstallUtils decryptFileAtURL:v19 encryptionKey:v23 salt:v24 error:&v73];
    id v25 = v73;

    v26 = [v10 databaseManager];
    [v26 syncSaveDownloadStateWithId:v9 state:12];

    if (!v22)
    {
      v37 = BLBookInstallLog();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138544130;
        v75 = v9;
        __int16 v76 = 2160;
        uint64_t v77 = 1752392040;
        __int16 v78 = 2112;
        v79 = v19;
        __int16 v80 = 2112;
        uint64_t v81 = (uint64_t)v25;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "(dID=%{public}@) [PDFInstall-Op] Failed processing %{mask.hash}@ due to error:  %@", buf, 0x2Au);
      }
      id v20 = 0;
      goto LABEL_40;
    }
    v67 = v25;
    v27 = [(BLBaseBookInstallOperation *)self downloadedAssetPath];
    uint64_t v28 = +[BLLibraryUtility generateFileUniqueIdFromPath:v27];
    [v10 setUniqueID:v28];

    v29 = BLBookInstallLog();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v75 = v9;
      __int16 v76 = 2112;
      uint64_t v77 = v28;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [PDFInstall-Op]: Added package hash: %@", buf, 0x16u);
    }

    v30 = [(BLPDFInstallOperation *)self purchaseManifest];
    v31 = +[IMLibraryPlist keyNameForUniqueId];
    [v30 manifestEntriesWithProperty:v31 equalToValue:v28 limitCount:1];
    v33 = v32 = v28;

    v69 = v32;
    if ([v33 count] == (id)1)
    {
      v34 = [v33 firstObject];
      v35 = [(BLPDFInstallOperation *)self purchaseManifest];
      [(BLPDFInstallOperation *)self _repairManifestEntryIfNeeded:v34 manifest:v35];

      v36 = BLBookInstallLog();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        v75 = v9;
        __int16 v76 = 2160;
        uint64_t v77 = 1752392040;
        __int16 v78 = 2112;
        v79 = v32;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [PDFInstall-Op]: Skipping asset installation because purchases manifest have an existing download with same uniqueID '%{mask.hash}@'.", buf, 0x20u);
      }
      id v25 = v67;
    }
    else
    {
      v38 = [(BLPDFInstallOperation *)self syncManifest];
      v39 = +[IMLibraryPlist keyNameForUniqueId];
      v40 = [v38 manifestEntriesWithProperty:v39 equalToValue:v32 limitCount:1];

      if ([v40 count] != (id)1)
      {
        v66 = v40;
        v43 = [(BLPDFInstallOperation *)self purchaseManifest];
        v44 = [v10 storeIdentifier];
        v45 = [v43 manifestEntriesWithProperty:@"s" equalToNumber:v44 limitCount:1];

        if ([v45 count] == (id)1)
        {
          objc_opt_class();
          v65 = v45;
          v46 = [v45 firstObject];
          v47 = BUDynamicCast();

          v48 = +[IMLibraryPlist keyNameForUniqueId];
          v49 = [v47 objectForKeyedSubscript:v48];

          v50 = BLBookInstallLog();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
          {
            v51 = [v10 storeIdentifier];
            *(_DWORD *)buf = 138544386;
            v75 = v9;
            __int16 v76 = 2160;
            uint64_t v77 = 1752392040;
            __int16 v78 = 2112;
            v79 = v51;
            __int16 v80 = 2160;
            uint64_t v81 = 1752392040;
            __int16 v82 = 2112;
            v83 = v49;
            _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [PDFInstall-Op]: Skipping asset installation because purchases manifest have an existing download with same storeID %{mask.hash}@ but different uniqueID '%{mask.hash}@'.", buf, 0x34u);
          }
        }
        else
        {
          v52 = [(BLPDFInstallOperation *)self syncManifest];
          v53 = [v10 storeIdentifier];
          v54 = [v52 manifestEntriesWithProperty:@"Item ID" equalToNumber:v53 limitCount:1];

          if ([v54 count] != (id)1)
          {

            id v71 = v67;
            id v72 = 0;
            unsigned int v60 = [(BLPDFInstallOperation *)self _installMediaAsset:v10 assetInstalledPath:&v72 error:&v71];
            id v20 = v72;
            id v21 = v71;

            if (!v60) {
              goto LABEL_41;
            }
            v61 = [v10 databaseManager];
            [v61 syncSaveDownloadStateWithId:v9 state:15];

            v37 = +[NSUserDefaults standardUserDefaults];
            if ([v37 BOOLForKey:@"BKSimulateCrashAtInstallDuringFinish"])
            {
              v62 = BLBookInstallLog();
              if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                v75 = v9;
                _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [PDFInstall-Op]: Simulating a crash during install finish", buf, 0xCu);
              }

              [v37 removeObjectForKey:@"BKSimulateCrashAtInstallDuringFinish"];
              [v37 synchronize];
              raise(11);
            }
            [(BLPDFInstallOperation *)self _addPurchaseManifestItem];
            v68 = [(BLBaseBookInstallOperation *)self installInfo];
            v70 = [v68 databaseManager];
            v63 = [(BLBaseBookInstallOperation *)self downloadID];
            [v70 syncSaveDownloadStateWithId:v63 state:16];

            id v25 = v21;
LABEL_40:

            id v21 = v25;
            goto LABEL_41;
          }
          objc_opt_class();
          v55 = [v54 firstObject];
          uint64_t v56 = BUDynamicCast();

          v47 = (void *)v56;
          v57 = +[IMLibraryPlist keyNameForUniqueId];
          v49 = [v47 objectForKeyedSubscript:v57];

          v50 = BLBookInstallLog();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
          {
            [v10 storeIdentifier];
            v65 = v54;
            v59 = v58 = v47;
            *(_DWORD *)buf = 138544386;
            v75 = v9;
            __int16 v76 = 2160;
            uint64_t v77 = 1752392040;
            __int16 v78 = 2112;
            v79 = v59;
            __int16 v80 = 2160;
            uint64_t v81 = 1752392040;
            __int16 v82 = 2112;
            v83 = v49;
            _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [PDFInstall-Op]: Skipping asset installation because sync manifest have an existing download with same storeID %{mask.hash}@ but different uniqueID '%{mask.hash}@'.", buf, 0x34u);

            v47 = v58;
          }
          else
          {
            v65 = v54;
          }
        }

        id v20 = 0;
        id v25 = v67;
        v37 = v69;
        goto LABEL_40;
      }
      v41 = [v40 firstObject];
      [(BLPDFInstallOperation *)self syncManifest];
      v42 = v33 = v40;
      [(BLPDFInstallOperation *)self _repairManifestEntryIfNeeded:v41 manifest:v42];

      v36 = BLBookInstallLog();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        v75 = v9;
        __int16 v76 = 2160;
        uint64_t v77 = 1752392040;
        __int16 v78 = 2112;
        v79 = v69;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [PDFInstall-Op]: Skipping asset installation because synced books manifest have an existing download with same uniqueID '%{mask.hash}@'.", buf, 0x20u);
      }
      id v25 = v67;
    }

    id v20 = 0;
    v37 = v69;
    goto LABEL_40;
  }
  id v20 = 0;
  id v21 = 0;
LABEL_41:
  -[BLBaseBookInstallOperation setError:](self, "setError:", v21, v65);
  v64 = [(BLBaseBookInstallOperation *)self error];
  [(BLBaseBookInstallOperation *)self setSuccess:v64 == 0];
}

- (void)_removeDuplicateEntry:(id)a3
{
  id v4 = a3;
  v5 = [(BLBaseBookInstallOperation *)self downloadID];
  v6 = [(BLBaseBookInstallOperation *)self installInfo];
  id v7 = [v6 uniqueID];

  v8 = [(BLBaseBookInstallOperation *)self installInfo];
  v9 = [v8 storeIdentifier];

  if (v7)
  {
    uint64_t v10 = BLBookInstallLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = [v4 manifestPath];
      int v25 = 138543618;
      v26 = v5;
      __int16 v27 = 2114;
      uint64_t v28 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [PDFInstall-Op]: Looking for duplicate from manifest with path %{public}@ for PDF book: ", (uint8_t *)&v25, 0x16u);
    }
    uint64_t v12 = +[IMLibraryPlist keyNameForUniqueId];
    v13 = [v4 manifestEntriesWithProperty:v12 equalToValue:v7 limitCount:1];

    id v14 = [v13 count];
    objc_super v15 = BLBookInstallLog();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if (v14 == (id)1)
    {
      if (v16)
      {
        v17 = [v13 firstObject];
        int v25 = 138543618;
        v26 = v5;
        __int16 v27 = 2112;
        uint64_t v28 = v17;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [PDFInstall-Op]: Removing for duplicate PDF book entry from manifest: %@", (uint8_t *)&v25, 0x16u);
      }
      [v4 removeManifestEntryWithPackageHash:v7];
    }
    else
    {
      if (v16)
      {
        int v25 = 138543362;
        v26 = v5;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [PDFInstall-Op]: Did not find a duplicate PDF book entry in manifest", (uint8_t *)&v25, 0xCu);
      }
    }
  }
  if (v9)
  {
    v18 = BLBookInstallLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = [v4 manifestPath];
      int v25 = 138543618;
      v26 = v5;
      __int16 v27 = 2114;
      uint64_t v28 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [PDFInstall-Op]: Looking for duplicate from manifest with path %{public}@ for store book: ", (uint8_t *)&v25, 0x16u);
    }
    id v20 = [v4 manifestEntriesWithProperty:@"s" equalToNumber:v9 limitCount:1];
    id v21 = [v20 count];
    v22 = BLBookInstallLog();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
    if (v21 == (id)1)
    {
      if (v23)
      {
        v24 = [v20 firstObject];
        int v25 = 138543618;
        v26 = v5;
        __int16 v27 = 2112;
        uint64_t v28 = v24;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [PDFInstall-Op]: Removing for duplicate store book entry from purchase manifest: %@", (uint8_t *)&v25, 0x16u);
      }
      [v4 removeManifestEntryWithStoreItemID:v9];
    }
    else
    {
      if (v23)
      {
        int v25 = 138543362;
        v26 = v5;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [PDFInstall-Op]: Did not find a duplicate store book entry in purchase manifest", (uint8_t *)&v25, 0xCu);
      }
    }
  }
}

- (void)_repairManifestEntryIfNeeded:(id)a3 manifest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(BLBaseBookInstallOperation *)self downloadID];
  v9 = [(BLBaseBookInstallOperation *)self installInfo];
  uint64_t v10 = [v9 uniqueID];
  v11 = +[IMLibraryPlist uniqueIdFromPlistEntry:v6];
  if ([v11 isEqualToString:v10])
  {
    uint64_t v12 = [v6 mutableCopy];
    v13 = [v9 storeIdentifier];
    v29 = [v9 storePlaylistIdentifier];
    if (![v29 longLongValue] || !v13) {
      goto LABEL_28;
    }
    uint64_t v28 = v8;
    id v26 = v7;
    id v14 = +[IMLibraryPlist storeIdFromPlistEntry:v6];
    objc_super v15 = +[IMLibraryPlist storePlaylistIdFromPlistEntry:v6];
    unsigned __int8 v16 = +[IMLibraryPlist isSupplementalContentFromPlistEntry:v6];
    __int16 v27 = v14;
    if (![v14 length] || (objc_msgSend(v15, "length") ? (unsigned __int8 v17 = v16) : (unsigned __int8 v17 = 0), (v17 & 1) == 0))
    {
      v22 = BLBookInstallLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        v31 = v28;
        __int16 v32 = 2160;
        uint64_t v33 = 1752392040;
        __int16 v34 = 2112;
        uint64_t v35 = (uint64_t)v10;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [PDFInstall-Op]: Will repair entry %{mask.hash}@ for missing supplemental content properties", buf, 0x20u);
      }
      id v7 = v26;
      goto LABEL_22;
    }
    int v25 = v13;
    v18 = [v29 stringValue];
    unsigned __int8 v19 = [v15 isEqual:v18];

    if (v19)
    {
      id v20 = [v25 stringValue];
      unsigned __int8 v21 = [v14 isEqual:v20];

      id v7 = v26;
      if (v21)
      {

        v13 = v25;
LABEL_24:
        v8 = v28;
LABEL_28:

        goto LABEL_29;
      }
      v22 = BLBookInstallLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138544642;
        v31 = v28;
        __int16 v32 = 2112;
        uint64_t v33 = (uint64_t)v10;
        __int16 v34 = 2160;
        uint64_t v35 = 1752392040;
        __int16 v36 = 2112;
        v37 = v27;
        __int16 v38 = 2160;
        uint64_t v39 = 1752392040;
        __int16 v40 = 2112;
        v13 = v25;
        v41 = v25;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "(dID=%{public}@) [PDFInstall-Op]: Will repair entry %@ for different storeID (old=%{mask.hash}@, new=%{mask.hash}@)", buf, 0x3Eu);
LABEL_22:

        BOOL v23 = [v9 storeInfoEntries];
        [v12 addEntriesFromDictionary:v23];

        [(BLPDFInstallOperation *)self _insertAdditionalEntryProperties:v12];
        if (![v7 removeManifestEntryWithPackageHash:v10])
        {
          v24 = BLBookInstallLog();
          v8 = v28;
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543874;
            v31 = v28;
            __int16 v32 = 2160;
            uint64_t v33 = 1752392040;
            __int16 v34 = 2112;
            uint64_t v35 = (uint64_t)v10;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [PDFInstall-Op]: During repair, failed to remove entry %{mask.hash}@", buf, 0x20u);
          }

          goto LABEL_28;
        }
        [v7 addManifestEntry:v12];
        [v7 synchronizeData];
        goto LABEL_24;
      }
    }
    else
    {
      v22 = BLBookInstallLog();
      id v7 = v26;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138544642;
        v31 = v28;
        __int16 v32 = 2112;
        uint64_t v33 = (uint64_t)v10;
        __int16 v34 = 2160;
        uint64_t v35 = 1752392040;
        __int16 v36 = 2112;
        v37 = v15;
        __int16 v38 = 2160;
        uint64_t v39 = 1752392040;
        __int16 v40 = 2112;
        v41 = v29;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "(dID=%{public}@) [PDFInstall-Op]: Will repair entry %@ for different storePlaylistID (old=%{mask.hash}@, new=%{mask.hash}@)", buf, 0x3Eu);
      }
    }
    v13 = v25;
    goto LABEL_22;
  }
  uint64_t v12 = BLBookInstallLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v31 = v8;
    __int16 v32 = 2160;
    uint64_t v33 = 1752392040;
    __int16 v34 = 2112;
    uint64_t v35 = (uint64_t)v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [PDFInstall-Op]: During repair, unexpected mismatch uniqueID %{mask.hash}@", buf, 0x20u);
  }
LABEL_29:
}

- (id)_newManifestEntry
{
  v3 = [(BLBaseBookInstallOperation *)self installInfo];
  id v4 = [v3 manifestEntry:1 withFileName:0];
  id v5 = [v4 mutableCopy];

  [(BLPDFInstallOperation *)self _insertAdditionalEntryProperties:v5];
  return v5;
}

- (void)_insertAdditionalEntryProperties:(id)a3
{
  id v4 = a3;
  id v5 = [(BLBaseBookInstallOperation *)self installInfo];
  id v6 = [v5 storePlaylistIdentifier];
  id v7 = [v6 longLongValue];
  v8 = BLBookInstallLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [(BLBaseBookInstallOperation *)self downloadID];
    uint64_t v10 = [v5 uniqueID];
    v11 = [v5 assetFlavor];
    int v12 = 138544898;
    v13 = v9;
    __int16 v14 = 1024;
    BOOL v15 = v7 != 0;
    __int16 v16 = 2160;
    uint64_t v17 = 1752392040;
    __int16 v18 = 2112;
    unsigned __int8 v19 = v10;
    __int16 v20 = 2160;
    uint64_t v21 = 1752392040;
    __int16 v22 = 2112;
    BOOL v23 = v6;
    __int16 v24 = 2114;
    int v25 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [PDFInstall-Op]: isSupplementalContent=%d, uniqueID=%{mask.hash}@, playlistIdentifier=%{mask.hash}@, flavor=%{public}@", (uint8_t *)&v12, 0x44u);
  }
  if (v7) {
    [v4 setObject:&__kCFBooleanTrue forKeyedSubscript:@"isSupplementalContent"];
  }
}

- (void)_addPurchaseManifestItem
{
  v3 = [(BLBaseBookInstallOperation *)self downloadID];
  id v4 = BLBookInstallLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v12 = 138543362;
    v13 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "(dID=%{public}@) [PDFInstall-Op]: Adding purchase manifest", (uint8_t *)&v12, 0xCu);
  }

  id v5 = [(BLPDFInstallOperation *)self _bookManifest];
  id v6 = BLBookInstallLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v5 manifestPath];
    int v12 = 138543618;
    v13 = v3;
    __int16 v14 = 2114;
    uint64_t v15 = (uint64_t)v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [PDFInstall-Op]: Updating purchase single user manifest: %{public}@", (uint8_t *)&v12, 0x16u);
  }
  v8 = [(BLBaseBookInstallOperation *)self destinationFilename];
  v9 = BLBookInstallLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543362;
    v13 = v3;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [PDFInstall-Op]: Updating purchase manifest since isRestore == NO.", (uint8_t *)&v12, 0xCu);
  }

  uint64_t v10 = [v5 manifestEntriesWithProperty:@"Path" equalToValue:v8 limitCount:1];
  if ([v10 count])
  {
    v11 = BLBookInstallLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138543874;
      v13 = v3;
      __int16 v14 = 2160;
      uint64_t v15 = 1752392040;
      __int16 v16 = 2112;
      uint64_t v17 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [PDFInstall-Op]: An entry with fileName %{mask.hash}@ already exists.", (uint8_t *)&v12, 0x20u);
    }
  }
  else
  {
    [(BLPDFInstallOperation *)self _removeDuplicateEntry:v5];
    v11 = [(BLPDFInstallOperation *)self _newManifestEntry];
    [v5 addManifestEntry:v11];
    [v5 synchronizeData];
  }
}

- (BOOL)_installMediaAsset:(id)a3 assetInstalledPath:(id *)a4 error:(id *)a5
{
  id v8 = a3;
  v9 = [(BLBaseBookInstallOperation *)self downloadID];
  id v10 = objc_alloc_init((Class)NSFileManager);
  v11 = [(BLBaseBookInstallOperation *)self downloadedAssetPath];
  if (([v10 fileExistsAtPath:v11] & 1) == 0)
  {
    __int16 v24 = BLBookInstallLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v35 = v9;
      __int16 v36 = 2112;
      v37 = v11;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "(dID=%{public}@) [PDFInstall-Op]: Could not install non-existant file: %@", buf, 0x16u);
    }

    v13 = +[NSString stringWithFormat:@"Could not install non-existant file: %@", v11];
    sub_10004B6AC(7, 0, v13);
    id v22 = (id)objc_claimAutoreleasedReturnValue();
    id v23 = 0;
    goto LABEL_15;
  }
  int v12 = [(BLPDFInstallOperation *)self _bookManifest];
  v13 = v12;
  if (!v12)
  {
    int v25 = BLBookInstallLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v35 = v9;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "(dID=%{public}@) [PDFInstall-Op]: No manifest entry found for book.", buf, 0xCu);
    }

    id v23 = 0;
    id v22 = 0;
LABEL_15:
    __int16 v16 = 0;
    goto LABEL_16;
  }
  v30 = a4;
  v31 = v8;
  __int16 v14 = [(__CFString *)v12 manifestPath];
  uint64_t v15 = [v14 stringByDeletingLastPathComponent];

  __int16 v16 = [(BLBaseBookInstallOperation *)self destinationFilename];
  uint64_t v17 = [v15 stringByAppendingPathComponent:v16];

  __int16 v18 = BLBookInstallLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v35 = v9;
    __int16 v36 = 2112;
    v37 = v17;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [PDFInstall-Op]: Saving Book to %@", buf, 0x16u);
  }

  unsigned int v19 = [v11 isEqualToString:v17];
  __int16 v20 = BLBookInstallLog();
  BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
  if (!v19)
  {
    if (v21)
    {
      *(_DWORD *)buf = 138543874;
      uint64_t v35 = v9;
      __int16 v36 = 2112;
      v37 = v11;
      __int16 v38 = 2112;
      uint64_t v39 = v17;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [PDFInstall-Op]: Moving file: %@ to path: %@", buf, 0x20u);
    }

    id v32 = 0;
    id v33 = v17;
    unsigned int v27 = [(BLBaseBookInstallOperation *)self _moveFile:v11 toPath:&v33 installBehavior:0 error:&v32];
    id v23 = v33;

    id v22 = v32;
    if (v27) {
      goto LABEL_22;
    }
    id v8 = v31;
LABEL_16:

    if (a5)
    {
      id v22 = v22;
      BOOL v26 = 0;
      *a5 = v22;
    }
    else
    {
      BOOL v26 = 0;
    }
    goto LABEL_27;
  }
  if (v21)
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v35 = v9;
    __int16 v36 = 2112;
    v37 = v17;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [PDFInstall-Op]: Book already at destination: %@", buf, 0x16u);
  }

  id v22 = 0;
  id v23 = v17;
LABEL_22:
  id v8 = v31;
  uint64_t v28 = [v31 fileAttributes];
  if ([v28 count]) {
    [v10 setAttributes:v28 ofItemAtPath:v23 error:0];
  }

  if (v30)
  {
    id v23 = v23;
    id *v30 = v23;
  }
  BOOL v26 = 1;
LABEL_27:

  return v26;
}

- (void)_saveMigrationState
{
  v3 = [(BLBaseBookInstallOperation *)self downloadID];
  id v4 = [(BLBaseBookInstallOperation *)self installInfo];
  id v5 = [v4 storeIdentifier];
  uint64_t v6 = BUStoreIdFromObject();
  id v7 = [(BLPDFInstallOperation *)self metadataStoreManager];
  id v8 = [v7 metadataStore];
  id v17 = 0;
  unsigned int v9 = [v8 setMigrationState:800 forStoreID:v6 error:&v17];
  id v10 = v17;

  v11 = BLBookInstallLog();
  int v12 = v11;
  if (v9)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138544130;
      unsigned int v19 = v3;
      __int16 v20 = 2048;
      uint64_t v21 = 800;
      __int16 v22 = 2160;
      uint64_t v23 = 1752392040;
      __int16 v24 = 2112;
      int v25 = v5;
      v13 = "(dID=%{public}@) [PDFInstall-Op] Saved migration state %lu for %{mask.hash}@";
      __int16 v14 = v12;
      os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
      uint32_t v16 = 42;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v14, v15, v13, buf, v16);
    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138544386;
    unsigned int v19 = v3;
    __int16 v20 = 2048;
    uint64_t v21 = 800;
    __int16 v22 = 2160;
    uint64_t v23 = 1752392040;
    __int16 v24 = 2112;
    int v25 = v5;
    __int16 v26 = 2112;
    id v27 = v10;
    v13 = "(dID=%{public}@) [PDFInstall-Op] Error saving migration state %lu for %{mask.hash}@:  %@";
    __int16 v14 = v12;
    os_log_type_t v15 = OS_LOG_TYPE_ERROR;
    uint32_t v16 = 52;
    goto LABEL_6;
  }
}

- (NSString)bookPath
{
  return self->_bookPath;
}

- (void)setBookPath:(id)a3
{
}

- (BAMetadataStoreManager)metadataStoreManager
{
  return self->_metadataStoreManager;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncManifest, 0);
  objc_storeStrong((id *)&self->_purchaseManifest, 0);
  objc_storeStrong((id *)&self->_metadataStoreManager, 0);

  objc_storeStrong((id *)&self->_bookPath, 0);
}

@end