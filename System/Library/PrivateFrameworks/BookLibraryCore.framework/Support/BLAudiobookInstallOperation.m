@interface BLAudiobookInstallOperation
- (BAMetadataStoreManager)metadataStoreManager;
- (BLAudiobookInstallOperation)initWithInfo:(id)a3 mediaLibraryManager:(id)a4 metadataStoreManager:(id)a5;
- (BLMediaLibraryManager)mediaLibraryManager;
- (BOOL)_installAssetFrom:(id)a3 to:(id)a4 error:(id *)a5;
- (BOOL)_unprotectedMediaAsset:(id *)a3;
- (id)_destinationDirectoryPath;
- (id)_installDaemonOwnedDownload:(id *)a3;
- (id)_newMediaLibraryItem;
- (void)main;
@end

@implementation BLAudiobookInstallOperation

- (BLAudiobookInstallOperation)initWithInfo:(id)a3 mediaLibraryManager:(id)a4 metadataStoreManager:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)BLAudiobookInstallOperation;
  v11 = [(BLBaseBookInstallOperation *)&v19 initWithInfo:v8];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_mediaLibraryManager, a4);
    objc_storeStrong((id *)&v12->_metadataStoreManager, a5);
    v13 = [(BLBaseBookInstallOperation *)v12 error];
    if (v13)
    {
    }
    else
    {
      v14 = [v8 storeIdentifier];

      if (!v14)
      {
        v15 = BLBookInstallLog();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          v16 = [v8 downloadID];
          *(_DWORD *)buf = 138543362;
          v21 = v16;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "(dID=%{public}@) [Install-Op]: Required store identifier is missing.", buf, 0xCu);
        }
        v17 = sub_10004B6AC(0, 0, @"Required store identifier is missing.");
        [(BLBaseBookInstallOperation *)v12 setError:v17];

        [(BLBaseBookInstallOperation *)v12 setSuccess:0];
      }
    }
  }

  return v12;
}

- (BOOL)_unprotectedMediaAsset:(id *)a3
{
  v4 = [(BLBaseBookInstallOperation *)self installInfo];
  v5 = [v4 assetPath];
  id v6 = objc_alloc_init((Class)NSMutableDictionary);
  v7 = [v4 downloadID];
  id v8 = [v4 sinfs];
  if (v8) {
    [v6 setObject:v8 forKeyedSubscript:AVFileProcessorAttribute_Sinfs];
  }
  id v9 = +[AVFileProcessor fileProcessor];
  id v21 = 0;
  id v10 = [v9 processPurchasedItem:v5 withAttributes:v6 resultInfo:&v21];
  id v11 = v21;

  if (v10)
  {
    v12 = BLBookInstallLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v23 = v7;
      __int16 v24 = 2112;
      v25 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "(dID=%{public}@) [Install-Op-Audiobook] Unprotect failed with error:  %@", buf, 0x16u);
    }

    if (a3)
    {
      v20 = a3;
      v13 = [v4 downloadID];
      v14 = +[NSString stringWithFormat:@"Unprotect failed on audiobook with download id: %@", v13];
      v15 = +[NSError bu_errorWithDomain:@"BLErrorDomain" code:15 description:v14 underlyingError:v10];

      id v16 = v15;
      id *v20 = v16;
    }
    else
    {
      id v16 = v10;
    }
    v17 = +[NSFileManager defaultManager];
    [v17 removeItemAtPath:v5 error:0];

    v18 = BLBookInstallLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v23 = v7;
      __int16 v24 = 2112;
      v25 = v5;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [Install-Op-Audiobook] Because unprotect failed, deleting file: %@", buf, 0x16u);
    }
  }
  return v10 == 0;
}

- (void)main
{
  v3 = [(BLBaseBookInstallOperation *)self installInfo];
  v4 = [v3 databaseManager];
  v5 = [(BLBaseBookInstallOperation *)self downloadID];
  [v4 syncSaveDownloadStateWithId:v5 state:8];

  v56 = +[NSUserDefaults standardUserDefaults];
  if ([v56 BOOLForKey:@"BKSimulateCrashAtInstallStart"])
  {
    id v6 = BLBookInstallLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = [(BLBaseBookInstallOperation *)self downloadID];
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [Install-Op]: Simulating a crash during install start", buf, 0xCu);
    }
    [v56 removeObjectForKey:@"BKSimulateCrashAtInstallStart"];
    [v56 synchronize];
    raise(11);
  }
  v57 = [(BLBaseBookInstallOperation *)self installInfo];
  v55 = [v57 downloadID];
  v52 = [v57 assetPath];
  id v8 = [(BLBaseBookInstallOperation *)self installInfo];
  id v9 = [v8 storeIdentifier];
  v53 = +[BLMediaLibraryUtilities pathOfAudiobookTrackWithStoreIdentifier:v9];

  id v10 = [v53 length];
  if (v10)
  {
    id v11 = BLBookInstallLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v55;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [Install-Op-Audiobook] Skipping asset installation because audiobook already has a path in Media Library.", buf, 0xCu);
    }

    id v54 = v53;
  }
  else
  {
    id v54 = 0;
  }
  v12 = [(BLBaseBookInstallOperation *)self installInfo];
  v13 = [v12 databaseManager];
  v14 = [(BLBaseBookInstallOperation *)self downloadID];
  [v13 syncSaveDownloadStateWithId:v14 state:15];

  if (v10)
  {
    id v15 = 0;
    goto LABEL_15;
  }
  id v16 = BLBookInstallLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&uint8_t buf[4] = v55;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [Install-Op-Audiobook] Processing DRM for audiobook.", buf, 0xCu);
  }

  id v68 = 0;
  unsigned int v17 = [(BLAudiobookInstallOperation *)self _unprotectedMediaAsset:&v68];
  id v15 = v68;
  if (v17)
  {
LABEL_15:
    v18 = +[NSUserDefaults standardUserDefaults];
    if ([v18 BOOLForKey:@"BKSimulateCrashAtInstallDuringFinish"])
    {
      objc_super v19 = BLBookInstallLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = [(BLBaseBookInstallOperation *)self installInfo];
        id v21 = [v20 downloadID];
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v21;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [Install-Op]: Simulating a crash during install finish", buf, 0xCu);
      }
      [v18 removeObjectForKey:@"BKSimulateCrashAtInstallDuringFinish"];
      [v18 synchronize];
      raise(11);
    }
    if (v10)
    {
      BOOL v22 = 1;
LABEL_48:
      v41 = dispatch_group_create();
      dispatch_group_enter(v41);
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000;
      LOBYTE(v72) = 0;
      v42 = BLBookInstallLog();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v69 = 138543362;
        v70 = v55;
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [Install-Op-Audiobook] About to finalizing install.", v69, 0xCu);
      }

      v43 = [(BLBaseBookInstallOperation *)self installInfo];
      v44 = [v43 databaseManager];
      v45 = [(BLBaseBookInstallOperation *)self downloadID];
      v61[0] = _NSConcreteStackBlock;
      v61[1] = 3221225472;
      v61[2] = sub_10003D864;
      v61[3] = &unk_1001A2228;
      id v62 = v55;
      v63 = self;
      v64 = buf;
      v58[0] = _NSConcreteStackBlock;
      v58[1] = 3221225472;
      v58[2] = sub_10003D96C;
      v58[3] = &unk_1001A2250;
      id v59 = v62;
      v46 = v41;
      v60 = v46;
      [v44 finalizeOrCanceAndCleanupWithDownloadID:v45 cleanupBlock:v61 completion:v58];

      dispatch_group_wait(v46, 0xFFFFFFFFFFFFFFFFLL);
      if (*(unsigned char *)(*(void *)&buf[8] + 24))
      {
        uint64_t v47 = sub_10004B6AC(16, @"Download Cancelled By User", 0);

        BOOL v22 = 0;
        id v15 = (id)v47;
      }

      _Block_object_dispose(buf, 8);
      [(BLBaseBookInstallOperation *)self setSuccess:v22];
      if (v22) {
        id v27 = v54;
      }
      else {
        id v27 = 0;
      }
      goto LABEL_55;
    }
    v51 = [(BLAudiobookInstallOperation *)self _destinationDirectoryPath];
    v49 = [v57 destinationFilename];
    if (v51 && v49)
    {
      uint64_t v23 = objc_msgSend(v51, "stringByAppendingPathComponent:");

      id v24 = (id)v23;
    }
    else
    {
      id v24 = v54;
    }
    id v54 = v24;
    if ((objc_msgSend(v52, "isEqualToString:") & 1) == 0)
    {
      v28 = BLBookInstallLog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = v55;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v52;
        *(_WORD *)&buf[22] = 2112;
        id v72 = v54;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [Install-Op-Audiobook] moving audiobook asset into place (from %@ to %@)", buf, 0x20u);
      }

      id v67 = v15;
      unsigned __int8 v29 = [(BLAudiobookInstallOperation *)self _installAssetFrom:v52 to:v54 error:&v67];
      id v50 = v67;

      if ((v29 & 1) == 0)
      {
        v40 = BLBookInstallLog();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v55;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v50;
          _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "(dID=%{public}@) [Install-Op-Audiobook] Unable to install asset:  %@", buf, 0x16u);
        }
        BOOL v22 = 0;
        goto LABEL_47;
      }
      id v15 = v50;
    }
    id v66 = v15;
    uint64_t v48 = [(BLAudiobookInstallOperation *)self _installDaemonOwnedDownload:&v66];
    id v50 = v66;

    BOOL v22 = v48 != 0;
    if (!v48)
    {
      v30 = BLBookInstallLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v55;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v50;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "(dID=%{public}@) [Install-Op-Audiobook] Unable to update media library:  %@", buf, 0x16u);
      }
    }
    v31 = [(BLBaseBookInstallOperation *)self installInfo];
    v32 = [v31 storePlaylistIdentifier];

    if (v32)
    {
      v33 = [(BLAudiobookInstallOperation *)self metadataStoreManager];
      v34 = [v33 metadataStore];
      v35 = [(BLBaseBookInstallOperation *)self installInfo];
      v36 = [v35 racGUID];
      id v65 = 0;
      unsigned __int8 v37 = objc_msgSend(v34, "setRacGUID:forStoreID:error:", v36, objc_msgSend(v32, "longLongValue"), &v65);
      id v38 = v65;

      if ((v37 & 1) == 0)
      {
        v39 = BLBookInstallLog();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          *(void *)&uint8_t buf[4] = v55;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v38;
          _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "(dID=%{public}@) [Install-Op-Audiobook] Unable to set racGUID:  %@", buf, 0x16u);
        }
      }
    }
    else
    {
      id v38 = 0;
    }

    v40 = v48;
LABEL_47:

    id v15 = v50;
    goto LABEL_48;
  }
  v25 = BLBookInstallLog();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    v26 = [v57 downloadID];
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v26;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v15;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "(dID=%{public}@) [Install-Op-Audiobook] Processing DRM failed for audiobook. Error:  %@", buf, 0x16u);
  }
  [(BLBaseBookInstallOperation *)self setSuccess:0];
  id v27 = 0;
LABEL_55:
  [(BLBaseBookInstallOperation *)self setInstalledAssetPath:v27];
  [(BLBaseBookInstallOperation *)self setError:v15];
}

- (BOOL)_installAssetFrom:(id)a3 to:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_alloc_init((Class)NSFileManager);
  if (![v10 fileExistsAtPath:v8])
  {
    id v16 = 0;
    goto LABEL_7;
  }
  id v11 = [v9 stringByDeletingLastPathComponent];
  [v10 createDirectoryAtPath:v11 withIntermediateDirectories:1 attributes:0 error:0];
  id v25 = 0;
  unsigned __int8 v12 = [v10 removeItemAtPath:v9 error:&v25];
  id v13 = v25;
  v14 = v13;
  if (v12 & 1) != 0 || (objc_msgSend(v13, "bu_isNoSuchFileError"))
  {
    id v24 = v14;
    unsigned int v15 = [v10 moveItemAtPath:v8 toPath:v9 error:&v24];
    id v16 = v24;

    if (v15)
    {

LABEL_7:
      BOOL v17 = 1;
      goto LABEL_16;
    }
    v18 = BLBookInstallLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_super v19 = [(BLBaseBookInstallOperation *)self installInfo];
      v20 = [v19 downloadID];
      *(_DWORD *)buf = 138543618;
      id v27 = v20;
      __int16 v28 = 2112;
      id v29 = v16;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "(dID=%{public}@) [Install-Op-Audiobook] File move failed:  %@", buf, 0x16u);
    }
    v14 = v16;
  }
  else
  {
    v18 = BLBookInstallLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      id v21 = [(BLBaseBookInstallOperation *)self installInfo];
      BOOL v22 = [v21 downloadID];
      *(_DWORD *)buf = 138543618;
      id v27 = v22;
      __int16 v28 = 2112;
      id v29 = v14;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "(dID=%{public}@) [Install-Op-Audiobook] Failed to delete existing file:  %@", buf, 0x16u);
    }
  }

  if (a5)
  {
    id v16 = v14;
    BOOL v17 = 0;
    *a5 = v16;
  }
  else
  {
    BOOL v17 = 0;
    id v16 = v14;
  }
LABEL_16:

  return v17;
}

- (id)_destinationDirectoryPath
{
  v2 = +[NSURL bu_mediaURL];
  v3 = [v2 URLByAppendingPathComponent:@"ManagedPurchases/Books" isDirectory:1];

  v4 = [v3 path];

  return v4;
}

- (id)_installDaemonOwnedDownload:(id *)a3
{
  v5 = [(BLBaseBookInstallOperation *)self installInfo];
  id v6 = [(BLAudiobookInstallOperation *)self _newMediaLibraryItem];
  v7 = [v5 itunesMetadata];
  id v8 = [objc_alloc((Class)BLDownloadMetadata) initWithDictionary:v7];
  [v6 setItemMetadata:v8];
  id v9 = BLBookInstallLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [v5 downloadID];
    *(_DWORD *)buf = 138543618;
    v20 = v10;
    __int16 v21 = 2112;
    id v22 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "(dID=%{public}@) [Install-Op-Audiobook] Adding mediaItem for audiobook %@", buf, 0x16u);
  }
  id v11 = [(BLAudiobookInstallOperation *)self mediaLibraryManager];
  id v18 = 0;
  id v12 = [v11 addLibraryItem:v6 error:&v18];
  id v13 = v18;

  if (v12)
  {
    v14 = +[NSNumber numberWithLongLong:v12];
    if (!a3) {
      goto LABEL_11;
    }
    goto LABEL_9;
  }
  unsigned int v15 = BLBookInstallLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    id v16 = [v5 downloadID];
    *(_DWORD *)buf = 138543618;
    v20 = v16;
    __int16 v21 = 2112;
    id v22 = v13;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "(dID=%{public}@) [Install-Op-Audiobook] Could not install audiobook download:  %@", buf, 0x16u);
  }
  v14 = 0;
  if (a3)
  {
LABEL_9:
    if (!v14) {
      *a3 = v13;
    }
  }
LABEL_11:

  return v14;
}

- (id)_newMediaLibraryItem
{
  v3 = objc_alloc_init(BLMLImporterItem);
  v4 = [(BLBaseBookInstallOperation *)self installInfo];
  v5 = [v4 downloadID];
  [(BLMLImporterItem *)v3 setItemDownloadIdentifier:v5];

  id v6 = [v4 accountIdentifier];
  [(BLMLImporterItem *)v3 setValue:v6 forAdditionalEntityProperty:ML3TrackPropertyStoreAccountID];

  v7 = [v4 familyAccountIdentifier];
  [(BLMLImporterItem *)v3 setValue:v7 forAdditionalEntityProperty:ML3TrackPropertyStoreFamilyAccountID];

  id v8 = [v4 libraryItemIdentifier];
  id v9 = v8;
  if (v8) {
    -[BLMLImporterItem setLibraryPersistentIdentifier:](v3, "setLibraryPersistentIdentifier:", [v8 longLongValue]);
  }
  id v10 = [v4 isRestore];
  unsigned int v11 = [v10 BOOLValue];

  if (v11) {
    [(BLMLImporterItem *)v3 setDownloadType:1];
  }
  id v12 = [(BLAudiobookInstallOperation *)self _destinationDirectoryPath];
  uint64_t v13 = [v4 destinationFilename];
  v14 = (void *)v13;
  if (v12 && v13)
  {
    unsigned int v15 = [v12 stringByAppendingPathComponent:v13];
  }
  else
  {
    if (!v13) {
      goto LABEL_11;
    }
    unsigned int v15 = 0;
  }
  [(BLMLImporterItem *)v3 setItemMediaPath:v15];
  [(BLMLImporterItem *)v3 loadPropertiesFromMediaPath:v15 includeTracks:1];

LABEL_11:
  id v16 = [v4 artworkPath];
  if (v16)
  {
    id v17 = [objc_alloc((Class)NSData) initWithContentsOfFile:v16];
    [(BLMLImporterItem *)v3 setItemArtworkData:v17];
  }
  return v3;
}

- (BLMediaLibraryManager)mediaLibraryManager
{
  return self->_mediaLibraryManager;
}

- (BAMetadataStoreManager)metadataStoreManager
{
  return self->_metadataStoreManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataStoreManager, 0);

  objc_storeStrong((id *)&self->_mediaLibraryManager, 0);
}

@end