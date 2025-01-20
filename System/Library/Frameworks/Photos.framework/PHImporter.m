@interface PHImporter
+ (id)removeItemAtPath:(id)a3 type:(unint64_t)a4 recursive:(BOOL)a5;
+ (void)dumpImageData:(id)a3;
+ (void)dumpMetadataForData:(id)a3;
+ (void)importAssets:(id)a3 fromImportSource:(id)a4 intoLibrary:(id)a5 withOptions:(id)a6 progress:(id *)a7 delegate:(id)a8 atEnd:(id)a9;
- (BOOL)handleErrorsForRecord:(id)a3 batch:(id)a4 file:(char *)a5 line:(int)a6;
- (BOOL)shouldImportRecordAsReference:(id)a3;
- (BOOL)shouldIngestInPlace:(id)a3;
- (NSMutableSet)importedBurstUUIDs;
- (NSProgress)progress;
- (NSString)importSessionID;
- (PHImportOptions)options;
- (PHImportResults)results;
- (PHImportSource)source;
- (PHImporter)initWithLibrary:(id)a3 options:(id)a4 source:(id)a5 delegate:(id)a6 completionHandler:(id)a7;
- (PHPhotoLibrary)library;
- (PLCacheDeleteClient)cacheDeleteClient;
- (id)_importRecord:(id)a3 createdAlbumIdentifiers:(id)a4 createdFolderIdentifiers:(id)a5;
- (id)_recordsToImportWithCount:(unint64_t)a3;
- (id)beginImport:(id)a3;
- (id)createAlbumForPath:(id)a3 inFolder:(id)a4 error:(id *)a5;
- (id)createFolderForPath:(id)a3 inFolder:(id)a4 error:(id *)a5;
- (id)folderChangeRequestForFolder:(id)a3;
- (id)getDestinationUrlForImportAsset:(id)a3;
- (id)makeDownloadUrlForParentFolderPath:(id)a3;
- (id)relativePathComponentsForAlbumPath:(id)a3 fromRootPath:(id)a4;
- (id)removeImportDirectoryForLibrary:(id)a3;
- (void)_applyFastVideoModernizationToRecord:(id)a3;
- (void)addDescriptionPropertiesFromImportAsset:(id)a3 toCreationRequest:(id)a4;
- (void)addLibraryPropertiesFromImportAssetBundleAsset:(id)a3 toCreationRequest:(id)a4;
- (void)addRecordToResults:(id)a3;
- (void)cancellationHandler;
- (void)downloadNextAssetInRecord:(id)a3 toURL:(id)a4 subRecordEnumerator:(id)a5 completionHandler:(id)a6;
- (void)ensureContainersExistForAlbumPath:(id)a3 forAsset:(id)a4 completion:(id)a5;
- (void)ensureEnoughDiskSpaceAvailableIfNeededForAssets:(id)a3 completion:(id)a4;
- (void)finishImport;
- (void)importNextAsset:(id)a3;
- (void)importRecords:(id)a3;
- (void)importRecords:(id)a3 completionHandler:(id)a4;
- (void)importedBurstAsset:(id)a3;
- (void)performLegacyDiskSpaceCheckForRequiredBytes:(int64_t)a3 forPath:(id)a4 withCompletion:(id)a5;
- (void)setCacheDeleteClient:(id)a3;
- (void)setImportSessionID:(id)a3;
- (void)setImportedBurstUUIDs:(id)a3;
- (void)setLibrary:(id)a3;
- (void)setOptions:(id)a3;
- (void)setProgress:(id)a3;
- (void)setResults:(id)a3;
- (void)setSource:(id)a3;
- (void)updateAlbumCacheWithAlbumIdentifiers:(id)a3;
- (void)updateFolderCacheWithFolders:(id)a3;
- (void)validateSourceForAsset:(id)a3;
@end

@implementation PHImporter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheDeleteClient, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_importedBurstUUIDs, 0);
  objc_storeStrong((id *)&self->_importSessionID, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_folderRequestByFolderId, 0);
  objc_storeStrong((id *)&self->_albumRequestsByAlbumId, 0);
  objc_storeStrong((id *)&self->_albumByAlbumPath, 0);
  objc_storeStrong((id *)&self->_containerPathByLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_folderByFolderPath, 0);
  objc_storeStrong((id *)&self->_downloadedRecords, 0);
  objc_storeStrong((id *)&self->_parentFolderMapping, 0);
  objc_storeStrong((id *)&self->_additionalDcimImportFolders, 0);
  objc_storeStrong((id *)&self->_downloadFolderUrlByImportIdentifier, 0);
  objc_storeStrong((id *)&self->_importFileManager, 0);
  objc_storeStrong((id *)&self->_importQueue, 0);
  objc_storeStrong(&self->_completionHandler, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setCacheDeleteClient:(id)a3
{
}

- (PLCacheDeleteClient)cacheDeleteClient
{
  return self->_cacheDeleteClient;
}

- (void)setSource:(id)a3
{
}

- (PHImportSource)source
{
  return self->_source;
}

- (void)setImportedBurstUUIDs:(id)a3
{
}

- (NSMutableSet)importedBurstUUIDs
{
  return self->_importedBurstUUIDs;
}

- (void)setImportSessionID:(id)a3
{
}

- (NSString)importSessionID
{
  return self->_importSessionID;
}

- (void)setLibrary:(id)a3
{
}

- (PHPhotoLibrary)library
{
  return self->_library;
}

- (void)setResults:(id)a3
{
}

- (PHImportResults)results
{
  return self->_results;
}

- (void)setOptions:(id)a3
{
}

- (PHImportOptions)options
{
  return self->_options;
}

- (void)setProgress:(id)a3
{
}

- (NSProgress)progress
{
  return self->_progress;
}

- (id)removeImportDirectoryForLibrary:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 pathManager];
  int v6 = [v5 isUBF];

  if (v6)
  {
    v7 = [v4 pathManager];
    id v29 = 0;
    v8 = [v7 externalDirectoryWithSubType:1 leafType:1 additionalPathComponents:0 createIfNeeded:0 error:&v29];
    id v9 = v29;

    if (v8)
    {
      uint64_t v10 = [(id)objc_opt_class() removeItemAtPath:v8 type:1 recursive:1];

      id v9 = (id)v10;
    }
  }
  else
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_importQueue);
    v11 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSMutableDictionary count](self->_parentFolderMapping, "count"));
    parentFolderMapping = self->_parentFolderMapping;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __46__PHImporter_removeImportDirectoryForLibrary___block_invoke;
    v27[3] = &unk_1E5845A70;
    v27[4] = self;
    id v28 = v11;
    id v13 = v11;
    [(NSMutableDictionary *)parentFolderMapping enumerateKeysAndObjectsUsingBlock:v27];
    [(NSMutableDictionary *)self->_parentFolderMapping removeObjectsForKeys:v13];
    v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSMutableArray count](self->_additionalDcimImportFolders, "count"));

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v14 = self->_additionalDcimImportFolders;
    uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v23 objects:v30 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v24 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          importFileManager = self->_importFileManager;
          v21 = objc_msgSend(v19, "path", (void)v23);
          LODWORD(importFileManager) = [(PLImportFileManager *)importFileManager removeUnusedDCIMDirectoryAtPath:v21];

          if (importFileManager) {
            [v8 addObject:v19];
          }
        }
        uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v23 objects:v30 count:16];
      }
      while (v16);
    }

    [(NSMutableArray *)self->_additionalDcimImportFolders removeObjectsInArray:v8];
    id v9 = 0;
  }

  return v9;
}

void __46__PHImporter_removeImportDirectoryForLibrary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  v5 = *(void **)(*(void *)(a1 + 32) + 40);
  int v6 = [a3 path];
  LODWORD(v5) = [v5 removeUnusedDCIMDirectoryAtPath:v6];

  if (v5) {
    [*(id *)(a1 + 40) addObject:v7];
  }
}

- (void)importedBurstAsset:(id)a3
{
  id v4 = a3;
  importedBurstUUIDs = self->_importedBurstUUIDs;
  id v9 = v4;
  if (!importedBurstUUIDs)
  {
    int v6 = (NSMutableSet *)objc_opt_new();
    id v7 = self->_importedBurstUUIDs;
    self->_importedBurstUUIDs = v6;

    id v4 = v9;
    importedBurstUUIDs = self->_importedBurstUUIDs;
  }
  v8 = [v4 burstUUID];
  [(NSMutableSet *)importedBurstUUIDs addObject:v8];
}

- (void)cancellationHandler
{
  importQueue = self->_importQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__PHImporter_cancellationHandler__block_invoke;
  block[3] = &unk_1E5848578;
  block[4] = self;
  dispatch_async(importQueue, block);
}

void *__33__PHImporter_cancellationHandler__block_invoke(void *result)
{
  uint64_t v1 = result[4];
  if (!*(unsigned char *)(v1 + 80))
  {
    v2 = result;
    *(unsigned char *)(v1 + 80) = 1;
    [*(id *)(result[4] + 152) setResult:3];
    v3 = PLImportGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)int v6 = 0;
      _os_log_impl(&dword_19B043000, v3, OS_LOG_TYPE_DEBUG, "IMPORT CANCELLED: during download, finishing", v6, 2u);
    }

    id v4 = [(id)v2[4] cacheDeleteClient];

    if (v4)
    {
      v5 = [(id)v2[4] cacheDeleteClient];
      [v5 cancelDiskSpaceAvailabilityRequest];
    }
    result = (void *)v2[4];
    if (!*((unsigned char *)result + 32)) {
      return (void *)[result finishImport];
    }
  }
  return result;
}

- (id)createAlbumForPath:(id)a3 inFolder:(id)a4 error:(id *)a5
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v8 lastPathComponent];
  v11 = +[PHAssetCollectionChangeRequest creationRequestForAssetCollectionWithTitle:v10];

  v12 = [v11 placeholderForCreatedAssetCollection];
  if (v12)
  {
    [(NSMutableDictionary *)self->_albumByAlbumPath setObject:v12 forKeyedSubscript:v8];
    id v13 = [v12 localIdentifier];
    if (v13) {
      [(NSMutableDictionary *)self->_containerPathByLocalIdentifier setObject:v8 forKeyedSubscript:v13];
    }
    v14 = [(PHImporter *)self folderChangeRequestForFolder:v9];
    v21[0] = v12;
    uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
    [v14 addChildCollections:v15];

    uint64_t v16 = 0;
  }
  else
  {
    uint64_t v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = *MEMORY[0x1E4F28228];
    id v13 = [NSString stringWithFormat:@"No error was returned from -[PHPhotoLibrary performChangesAndWait:error:] but the album local identifier was nil for %@", v8];
    v20 = v13;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    uint64_t v16 = [v17 errorWithDomain:@"com.apple.ImportErrorDomain" code:-6 userInfo:v14];
  }

  if (a5) {
    *a5 = v16;
  }

  return v11;
}

- (void)ensureContainersExistForAlbumPath:(id)a3 forAsset:(id)a4 completion:(id)a5
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void *, id))a5;
  v11 = [(NSMutableDictionary *)self->_albumByAlbumPath objectForKeyedSubscript:v8];
  id v51 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v11)
  {
    albumRequestsByAlbumId = self->_albumRequestsByAlbumId;
    id v13 = [v11 localIdentifier];
    v14 = [(NSMutableDictionary *)albumRequestsByAlbumId objectForKeyedSubscript:v13];

    if (!v14)
    {
      v14 = +[PHAssetCollectionChangeRequest changeRequestForAssetCollection:v11];
      uint64_t v15 = [v11 localIdentifier];
      if (v15) {
        [(NSMutableDictionary *)self->_albumRequestsByAlbumId setObject:v14 forKeyedSubscript:v15];
      }
    }
    id v58 = v9;
    uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v58 count:1];
    [v14 addAssets:v16];
LABEL_7:
    uint64_t v17 = 0;
    goto LABEL_42;
  }
  v14 = [(PHImportSource *)self->_source prefix];
  v18 = [(NSMutableDictionary *)self->_folderByFolderPath objectForKeyedSubscript:v14];
  if (!v18)
  {
    uint64_t v16 = PLImportGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v36 = [v14 lastPathComponent];
      *(_DWORD *)buf = 138412290;
      id v61 = v36;
      _os_log_impl(&dword_19B043000, v16, OS_LOG_TYPE_ERROR, "Failed to create root folder '%@'", buf, 0xCu);
    }
    goto LABEL_7;
  }
  v45 = v10;
  uint64_t v19 = v18;
  v20 = [(PHImporter *)self relativePathComponentsForAlbumPath:v8 fromRootPath:v14];
  id v21 = v14;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  v22 = v20;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v54 objects:v64 count:16];
  v50 = v22;
  id v47 = v9;
  id v48 = v8;
  id v46 = v21;
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v55;
    long long v26 = v22;
    while (2)
    {
      uint64_t v27 = 0;
      id v28 = v21;
      id v29 = v19;
      do
      {
        if (*(void *)v55 != v25) {
          objc_enumerationMutation(v26);
        }
        id v21 = [v28 stringByAppendingPathComponent:*(void *)(*((void *)&v54 + 1) + 8 * v27)];

        v30 = [(NSMutableDictionary *)self->_folderByFolderPath objectForKeyedSubscript:v21];

        if (!v30)
        {
          id v53 = 0;
          uint64_t v31 = self;
          v32 = [(PHImporter *)self createFolderForPath:v21 inFolder:v29 error:&v53];
          id v33 = v53;
          if (v33)
          {
            id v37 = v33;
            v38 = PLImportGetLog();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            {
              v39 = [v21 lastPathComponent];
              *(_DWORD *)buf = 138412546;
              id v61 = v39;
              __int16 v62 = 2112;
              id v63 = v37;
              _os_log_impl(&dword_19B043000, v38, OS_LOG_TYPE_ERROR, "Failed to create folder '%@' (%@)", buf, 0x16u);
            }
            uint64_t v17 = 0;
            uint64_t v19 = v26;
            goto LABEL_40;
          }
          v30 = [v32 placeholderForCreatedCollectionList];
          v34 = [v30 localIdentifier];
          if (v34)
          {
            [v51 addObject:v34];
            [(NSMutableDictionary *)v31->_folderRequestByFolderId setObject:v32 forKeyedSubscript:v34];
          }
          else
          {
            v35 = PLImportGetLog();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
            {
              v49 = [v30 localizedTitle];
              *(_DWORD *)buf = 138412290;
              id v61 = v49;
              _os_log_impl(&dword_19B043000, v35, OS_LOG_TYPE_ERROR, "Failed to get a valid local identifier for collection '%@'", buf, 0xCu);
            }
            long long v26 = v50;
          }

          self = v31;
        }
        uint64_t v19 = v30;

        ++v27;
        id v28 = v21;
        id v29 = v19;
      }
      while (v24 != v27);
      uint64_t v24 = [v26 countByEnumeratingWithState:&v54 objects:v64 count:16];
      if (v24) {
        continue;
      }
      break;
    }

    if (v19)
    {
      id v9 = v47;
      id v8 = v48;
      goto LABEL_32;
    }
    uint64_t v17 = 0;
  }
  else
  {

LABEL_32:
    id v52 = 0;
    [(PHImporter *)self createAlbumForPath:v8 inFolder:v19 error:&v52];
    v32 = v40 = self;
    id v37 = v52;
    if (v37)
    {
      v38 = PLImportGetLog();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v61 = v8;
        __int16 v62 = 2112;
        id v63 = v37;
        _os_log_impl(&dword_19B043000, v38, OS_LOG_TYPE_ERROR, "Failed to lookup or create folder path to album '%@' (%@)", buf, 0x16u);
      }
      uint64_t v17 = 0;
    }
    else
    {
      v41 = v40;
      id v59 = v9;
      v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v59 count:1];
      [v32 addAssets:v42];

      v43 = [v32 placeholderForCreatedAssetCollection];
      v38 = [v43 localIdentifier];

      if (v38) {
        [(NSMutableDictionary *)v41->_albumRequestsByAlbumId setObject:v32 forKeyedSubscript:v38];
      }
      uint64_t v17 = [v32 placeholderForCreatedAssetCollection];
    }
    id v29 = v19;
LABEL_40:
  }
  id v9 = v47;
  id v8 = v48;
  uint64_t v10 = v45;

  v14 = v46;
  v11 = 0;
  uint64_t v16 = v50;
LABEL_42:

  if (v10)
  {
    v44 = [v17 localIdentifier];
    v10[2](v10, v44, v51);
  }
}

- (id)relativePathComponentsForAlbumPath:(id)a3 fromRootPath:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5 && (unint64_t v7 = [v5 length], v7 > objc_msgSend(v6, "length")))
  {
    id v8 = objc_msgSend(v5, "substringFromIndex:", objc_msgSend(v6, "length") + 1);
  }
  else
  {
    id v8 = 0;
  }
  id v9 = [v8 componentsSeparatedByString:@"/"];

  return v9;
}

- (void)addRecordToResults:(id)a3
{
  importQueue = self->_importQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(importQueue);
  id v6 = [(PHImporter *)self results];
  [v6 addImportRecord:v5];

  unint64_t v7 = [(PHImporter *)self progress];
  objc_msgSend(v7, "setCompletedUnitCount:", objc_msgSend(v7, "completedUnitCount") + 1);

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained completedImportRecord:v5];
}

- (void)updateFolderCacheWithFolders:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[PHFetchOptions fetchOptionsWithPhotoLibrary:self->_library orObject:0];
  id v6 = +[PHCollectionList fetchCollectionListsWithLocalIdentifiers:v4 options:v5];

  uint64_t v19 = v6;
  unint64_t v7 = [v6 fetchedObjects];
  if (![v7 count])
  {
    id v8 = PLImportGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v27 = v4;
      _os_log_impl(&dword_19B043000, v8, OS_LOG_TYPE_ERROR, "no PHCollectionLists for %@", buf, 0xCu);
    }
  }
  v20 = v4;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        containerPathByLocalIdentifier = self->_containerPathByLocalIdentifier;
        uint64_t v16 = [v14 localIdentifier];
        uint64_t v17 = [(NSMutableDictionary *)containerPathByLocalIdentifier objectForKeyedSubscript:v16];

        if (v17)
        {
          [(NSMutableDictionary *)self->_folderByFolderPath setObject:v14 forKeyedSubscript:v17];
        }
        else
        {
          v18 = PLImportGetLog();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19B043000, v18, OS_LOG_TYPE_ERROR, "pathKey should have existed unless we are trying to update a container that did not previously have a cached placeholder", buf, 2u);
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v11);
  }
}

- (void)updateAlbumCacheWithAlbumIdentifiers:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[PHFetchOptions fetchOptionsWithPhotoLibrary:self->_library orObject:0];
  id v6 = +[PHAssetCollection fetchAssetCollectionsWithLocalIdentifiers:v4 options:v5];

  uint64_t v19 = v6;
  unint64_t v7 = [v6 fetchedObjects];
  id v8 = v7;
  v20 = v4;
  if (v7)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v27 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v22 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          containerPathByLocalIdentifier = self->_containerPathByLocalIdentifier;
          uint64_t v15 = [v13 localIdentifier];
          uint64_t v16 = [(NSMutableDictionary *)containerPathByLocalIdentifier objectForKeyedSubscript:v15];

          if (v16)
          {
            [(NSMutableDictionary *)self->_albumByAlbumPath setObject:v13 forKeyedSubscript:v16];
          }
          else
          {
            uint64_t v17 = PLImportGetLog();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_19B043000, v17, OS_LOG_TYPE_ERROR, "pathKey should have existed unless we are trying to update a container that did not previously have a cached placeholder", buf, 2u);
            }
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v27 count:16];
      }
      while (v10);
    }
  }
  else
  {
    v18 = PLImportGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v4;
      _os_log_impl(&dword_19B043000, v18, OS_LOG_TYPE_ERROR, "no PHAssetCollection for identifiers: %@", buf, 0xCu);
    }
  }
}

- (id)folderChangeRequestForFolder:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  folderRequestByFolderId = self->_folderRequestByFolderId;
  id v6 = [v4 localIdentifier];
  unint64_t v7 = [(NSMutableDictionary *)folderRequestByFolderId objectForKeyedSubscript:v6];

  if (!v7)
  {
    unint64_t v7 = +[PHCollectionListChangeRequest changeRequestForCollectionList:v4];
    id v8 = [v4 localIdentifier];
    if (v8 && v7)
    {
      [(NSMutableDictionary *)self->_folderRequestByFolderId setObject:v7 forKeyedSubscript:v8];
    }
    else
    {
      uint64_t v9 = PLImportGetLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v11 = 134218240;
        uint64_t v12 = v8;
        __int16 v13 = 2048;
        v14 = v7;
        _os_log_impl(&dword_19B043000, v9, OS_LOG_TYPE_ERROR, "Failed to get a local identifier (%p) or request (%p) for collection", (uint8_t *)&v11, 0x16u);
      }
    }
  }

  return v7;
}

- (id)createFolderForPath:(id)a3 inFolder:(id)a4 error:(id *)a5
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    uint64_t v10 = [v8 lastPathComponent];
    int v11 = +[PHCollectionListChangeRequest creationRequestForCollectionListWithTitle:v10];

    uint64_t v12 = [v11 placeholderForCreatedCollectionList];
    if (v12)
    {
      __int16 v13 = [(PHImporter *)self folderChangeRequestForFolder:v9];
      v25[0] = v12;
      v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
      [v13 addChildCollections:v14];

      [(NSMutableDictionary *)self->_folderByFolderPath setObject:v12 forKeyedSubscript:v8];
      uint64_t v15 = [v12 localIdentifier];
      if (v15)
      {
        containerPathByLocalIdentifier = self->_containerPathByLocalIdentifier;
        uint64_t v17 = [v12 localIdentifier];
        [(NSMutableDictionary *)containerPathByLocalIdentifier setObject:v8 forKeyedSubscript:v17];
      }
      else
      {
        uint64_t v17 = PLImportGetLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v24 = v8;
          _os_log_impl(&dword_19B043000, v17, OS_LOG_TYPE_ERROR, "Failed to get a local identifier for collection created for %@", buf, 0xCu);
        }
      }

      uint64_t v19 = 0;
    }
    else
    {
      v18 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v21 = *MEMORY[0x1E4F28228];
      __int16 v13 = [NSString stringWithFormat:@"folder local identifier was nil for %@", v8];
      long long v22 = v13;
      uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
      uint64_t v19 = [v18 errorWithDomain:@"com.apple.ImportErrorDomain" code:-6 userInfo:v15];
    }

    if (a5) {
      *a5 = v19;
    }
  }
  else
  {
    int v11 = 0;
  }

  return v11;
}

- (void)validateSourceForAsset:(id)a3
{
  id v10 = a3;
  id v4 = [v10 source];
  char v5 = [v4 isAvailable];

  if ((v5 & 1) == 0)
  {
    id v6 = [(PHImporter *)self results];
    unint64_t v7 = [v10 source];
    id v8 = [v7 name];
    id v9 = (id)[v6 addExceptionWithType:3 path:v8 underlyingError:0 file:"/Library/Caches/com.apple.xbs/Sources/Photos/Projects/PhotoKit/Sources/Import/PHImporter.m" line:979];

    self->_isCanceled = 1;
  }
}

- (BOOL)handleErrorsForRecord:(id)a3 batch:(id)a4 file:(char *)a5 line:(int)a6
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = [v7 exceptions];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    id v10 = [v7 importAsset];

    if (v10)
    {
      int v11 = PLImportGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = [v7 exceptions];
        if ((unint64_t)[v12 count] <= 1) {
          __int16 v13 = @"]";
        }
        else {
          __int16 v13 = @"S]\n";
        }
        v14 = +[PHImportException logForAllExceptions:v7];
        int v17 = 138412546;
        v18 = v13;
        __int16 v19 = 2112;
        v20 = v14;
        _os_log_impl(&dword_19B043000, v11, OS_LOG_TYPE_ERROR, "[IMPORT ERROR%@ %@", (uint8_t *)&v17, 0x16u);
      }
      uint64_t v15 = [v7 importAsset];
      [(PHImporter *)self validateSourceForAsset:v15];

      [v7 cleanupAfterFailure];
    }
  }

  return v9 != 0;
}

- (void)finishImport
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_importQueue);
  if (self->_importState <= 2u)
  {
    v3 = PLImportGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B043000, v3, OS_LOG_TYPE_INFO, "IMPORT FINISHED", buf, 2u);
    }

    if (self->_isCanceled)
    {
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id v4 = self->_downloadedRecords;
      uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v41 objects:v51 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = *(void *)v42;
        do
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v42 != v7) {
              objc_enumerationMutation(v4);
            }
            [*(id *)(*((void *)&v41 + 1) + 8 * i) cleanupAfterFailure];
          }
          uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v41 objects:v51 count:16];
        }
        while (v6);
      }

      [(NSMutableArray *)self->_downloadedRecords removeAllObjects];
    }
    else
    {
      uint64_t v9 = [(PHImporter *)self progress];
      uint64_t v10 = [v9 totalUnitCount];
      int v11 = [(PHImporter *)self progress];
      [v11 setCompletedUnitCount:v10];
    }
    self->_importState = 3;
    if ([(NSMutableSet *)self->_importedBurstUUIDs count])
    {
      uint64_t v12 = [MEMORY[0x1E4F8A6A0] sharedAssetsSaver];
      __int16 v13 = [(NSMutableSet *)self->_importedBurstUUIDs allObjects];
      v14 = [(PHPhotoLibrary *)self->_library photoLibraryURL];
      uint64_t v15 = [v12 validateAvalanches:v13 inLibraryWithURL:v14];

      uint64_t v16 = [(PHImportOptions *)self->_options destinationAlbum];
      if (v16)
      {
        int v17 = (void *)v16;
        uint64_t v18 = [v15 count];

        if (v18)
        {
          library = self->_library;
          v39[0] = MEMORY[0x1E4F143A8];
          v39[1] = 3221225472;
          v39[2] = __26__PHImporter_finishImport__block_invoke;
          v39[3] = &unk_1E5848DF0;
          v39[4] = self;
          id v40 = v15;
          id v38 = 0;
          BOOL v20 = [(PHPhotoLibrary *)library performChangesAndWait:v39 error:&v38];
          id v21 = v38;
          if (!v20)
          {
            long long v22 = PLImportGetLog();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              long long v23 = [(PHImportOptions *)self->_options destinationAlbum];
              id v24 = [v23 localizedTitle];
              *(_DWORD *)buf = 138412546;
              uint64_t v46 = (uint64_t)v24;
              __int16 v47 = 2112;
              uint64_t v48 = (uint64_t)v21;
              _os_log_impl(&dword_19B043000, v22, OS_LOG_TYPE_ERROR, "Error adding bursts to album '%@': %@", buf, 0x16u);
            }
          }
        }
      }
    }
    uint64_t v25 = [(PHImporter *)self removeImportDirectoryForLibrary:self->_library];
    if (v25)
    {
      id v26 = PLImportGetLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v46 = (uint64_t)v25;
        _os_log_impl(&dword_19B043000, v26, OS_LOG_TYPE_ERROR, "Error removing empyt DCIM folder: %@", buf, 0xCu);
      }
    }
    id v27 = [(PHImporter *)self results];
    [v27 logPMR];

    completionHandler = (void (**)(id, void *))self->_completionHandler;
    if (completionHandler)
    {
      id v29 = [(PHImporter *)self results];
      completionHandler[2](completionHandler, v29);
    }
    v30 = PLImportGetLog();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v31 = [(PHImporter *)self results];
      uint64_t v32 = [v31 importedCount];
      id v33 = [(PHImporter *)self results];
      v34 = [v33 importSource];
      uint64_t v35 = objc_opt_class();
      v36 = [(PHImporter *)self results];
      id v37 = [v36 importSource];
      *(_DWORD *)buf = 134218498;
      uint64_t v46 = v32;
      __int16 v47 = 2114;
      uint64_t v48 = v35;
      __int16 v49 = 2048;
      v50 = v37;
      _os_log_impl(&dword_19B043000, v30, OS_LOG_TYPE_DEFAULT, "Finished importing %lu assets from %{public}@ <%p>", buf, 0x20u);
    }
  }
}

void __26__PHImporter_finishImport__block_invoke(uint64_t a1)
{
  id v6 = +[PHFetchOptions fetchOptionsWithPhotoLibrary:*(void *)(*(void *)(a1 + 32) + 160) orObject:0];
  v2 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"uuid in %@", *(void *)(a1 + 40)];
  [v6 setPredicate:v2];

  v3 = +[PHAsset fetchAssetsWithOptions:v6];
  if ([v3 count])
  {
    id v4 = [*(id *)(*(void *)(a1 + 32) + 144) destinationAlbum];
    uint64_t v5 = +[PHAssetCollectionChangeRequest changeRequestForAssetCollection:v4];

    [v5 addAssets:v3];
  }
}

- (void)addLibraryPropertiesFromImportAssetBundleAsset:(id)a3 toCreationRequest:(id)a4
{
  id v12 = a4;
  uint64_t v5 = [a3 assetBundle];
  uint64_t v6 = [v5 videoComplementVisibilityState];
  if (v6) {
    [v12 setPhotoIrisVisibilityState:v6];
  }
  uint64_t v7 = [v12 creationDate];

  if (!v7)
  {
    id v8 = [v5 libraryCreationDate];
    if (v8)
    {
      [v12 setCreationDate:v8];
      uint64_t v9 = [v5 libraryCreationDateTimeZone];
      if (v9) {
        [v12 setTimeZone:v9 withDate:v8];
      }
    }
  }
  uint64_t v10 = [v12 location];

  if (!v10)
  {
    int v11 = [v5 libraryLocation];
    if (v11)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        [v12 setLocation:v11];
      }
    }
  }
  if ([v5 spatialOvercaptureResourcesPurgeable]) {
    [v12 trashAllSpatialOverCaptureResources];
  }
}

- (void)addDescriptionPropertiesFromImportAsset:(id)a3 toCreationRequest:(id)a4
{
  id v14 = a3;
  id v5 = a4;
  uint64_t v6 = [v5 title];

  if (!v6)
  {
    uint64_t v7 = [v14 title];
    if (v7) {
      [v5 setTitle:v7];
    }
  }
  id v8 = [v5 keywordTitles];

  if (!v8)
  {
    uint64_t v9 = [v14 keywordTitles];
    if (v9) {
      [v5 setKeywordTitles:v9];
    }
  }
  uint64_t v10 = [v5 assetDescription];

  if (!v10)
  {
    int v11 = [v14 assetDescription];
    if (v11) {
      [v5 setAssetDescription:v11];
    }
  }
  id v12 = [v5 accessibilityDescription];

  if (!v12)
  {
    __int16 v13 = [v14 accessibilityDescription];
    if (v13) {
      [v5 setAccessibilityDescription:v13];
    }
  }
}

- (void)_applyFastVideoModernizationToRecord:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 importAsset];
  uint64_t v6 = [v4 timers];
  uint64_t v7 = [v6 startTiming:10 subtype:0];

  if ([v5 isMovie]
    && ![(PHImporter *)self shouldImportRecordAsReference:v4])
  {
    id v8 = [v5 metadata];
    uint64_t v9 = [v8 contentTypeFromFastModernizeVideoMedia];

    if (v9)
    {
      uint64_t v10 = [v5 contentType];
      char v11 = [v10 isEqual:v9];

      if ((v11 & 1) == 0)
      {
        uint64_t v12 = [v9 preferredFilenameExtension];
        __int16 v13 = [v4 downloadedPath];
        id v14 = [v13 stringByDeletingPathExtension];
        uint64_t v25 = (void *)v12;
        uint64_t v15 = [v14 stringByAppendingPathExtension:v12];

        uint64_t v16 = [MEMORY[0x1E4F28CB8] defaultManager];
        int v17 = (void *)MEMORY[0x1E4F1CB10];
        uint64_t v18 = [v4 downloadedPath];
        __int16 v19 = [v17 fileURLWithPath:v18];
        id v24 = (void *)v15;
        BOOL v20 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v15];
        id v26 = 0;
        LOBYTE(v17) = [v16 moveItemAtURL:v19 toURL:v20 error:&v26];
        id v21 = v26;

        if ((v17 & 1) == 0)
        {
          long long v22 = PLImportGetLog();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            id v28 = v21;
            _os_log_impl(&dword_19B043000, v22, OS_LOG_TYPE_ERROR, "Error renaming file for fast modernization: %@", buf, 0xCu);
          }
        }
        [v4 setDownloadedPath:v24];
      }
    }
  }
  long long v23 = [v4 timers];
  [v23 stopTiming:v7];
}

- (id)_importRecord:(id)a3 createdAlbumIdentifiers:(id)a4 createdFolderIdentifiers:(id)a5
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v52 = a5;
  uint64_t v10 = [v8 importAsset];
  [(PHImporter *)self _applyFastVideoModernizationToRecord:v8];
  id v49 = v9;
  if ([v10 shouldPreserveUUID])
  {
    char v11 = [v10 uuid];
    uint64_t v12 = +[PHAssetCreationRequest creationRequestForAssetWithUUID:v11];
  }
  else
  {
    uint64_t v12 = +[PHAssetCreationRequest creationRequestForAssetWithUUID:0];
  }
  objc_msgSend(v12, "setImportSessionID:", self->_importSessionID, v49);
  objc_msgSend(v12, "setImportedBy:", -[PHImportOptions importedBy](self->_options, "importedBy"));
  id v53 = v10;
  __int16 v13 = [v10 customAssetProperties];
  [v12 setCustomAssetProperties:v13];

  id v51 = v8;
  [v8 allImportRecords];
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = [obj countByEnumeratingWithState:&v59 objects:v64 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v55 = *(void *)v60;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v60 != v55) {
          objc_enumerationMutation(obj);
        }
        int v17 = *(void **)(*((void *)&v59 + 1) + 8 * i);
        uint64_t v18 = [v17 importAsset];
        [(PHImporter *)self addDescriptionPropertiesFromImportAsset:v18 toCreationRequest:v12];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [(PHImporter *)self addLibraryPropertiesFromImportAssetBundleAsset:v18 toCreationRequest:v12];
        }
        __int16 v19 = objc_alloc_init(PHAssetResourceCreationOptions);
        BOOL v20 = [(PHImporter *)self shouldImportRecordAsReference:v17];
        if (v20)
        {
          [(PHAssetResourceCreationOptions *)v19 setShouldMoveFile:0];
          id v21 = [v17 importAsset];
          -[PHAssetResourceCreationOptions setShouldIngestInPlace:](v19, "setShouldIngestInPlace:", [v21 hasOriginalResourceType]);
        }
        else
        {
          long long v22 = [(PHPhotoLibrary *)self->_library pathManager];
          int v23 = [v22 isUBF];

          if (v23)
          {
            [(PHAssetResourceCreationOptions *)v19 setShouldMoveFile:1];
            [(PHAssetResourceCreationOptions *)v19 setShouldIngestInPlace:0];
          }
          else
          {
            id v24 = [v17 importAsset];
            [(PHAssetResourceCreationOptions *)v19 setShouldIngestInPlace:[(PHImporter *)self shouldIngestInPlace:v24]];

            [(PHAssetResourceCreationOptions *)v19 setShouldMoveFile:[(PHAssetResourceCreationOptions *)v19 shouldIngestInPlace] ^ 1];
          }
        }
        uint64_t v25 = [v18 createdFileName];
        if (v25)
        {
          [(PHAssetResourceCreationOptions *)v19 setOriginalFilename:v25];
        }
        else
        {
          id v26 = [v18 fileName];
          [(PHAssetResourceCreationOptions *)v19 setOriginalFilename:v26];
        }
        id v27 = [v18 contentType];
        id v28 = [v27 identifier];
        [(PHAssetResourceCreationOptions *)v19 setUniformTypeIdentifier:v28];

        uint64_t v29 = [v18 fileCreationDate];
        [(PHAssetResourceCreationOptions *)v19 setAlternateImportImageDate:v29];

        -[PHAssetResourceCreationOptions setBurstPickType:](v19, "setBurstPickType:", [v18 burstPickType]);
        if (!v20)
        {
          uint64_t v31 = [v17 downloadedPath];

          if (v31)
          {
            uint64_t v32 = (void *)MEMORY[0x1E4F1CB10];
            id v33 = [v17 downloadedPath];
            v30 = [v32 fileURLWithPath:v33];

            if (!v30) {
              goto LABEL_27;
            }
LABEL_24:
            objc_msgSend(v12, "addResourceWithType:fileURL:options:", objc_msgSend(v18, "resourceType"), v30, v19);
          }
          else
          {
            v30 = objc_msgSend(MEMORY[0x1E4F28C58], "ph_genericErrorWithLocalizedDescription:", @"Importing as copy. Expected record to have a download path.");
            v34 = [v18 fileName];
            id v35 = (id)[v17 addExceptionWithType:0 path:v34 underlyingError:v30 file:"/Library/Caches/com.apple.xbs/Sources/Photos/Projects/PhotoKit/Sources/Import/PHImporter.m" line:785];
          }
          goto LABEL_27;
        }
        v30 = [v18 url];
        if (v30) {
          goto LABEL_24;
        }
LABEL_27:
      }
      uint64_t v15 = [obj countByEnumeratingWithState:&v59 objects:v64 count:16];
    }
    while (v15);
  }
  v36 = [v12 placeholderForCreatedAsset];
  id v37 = v36;
  if (!v36)
  {
    long long v42 = objc_msgSend(MEMORY[0x1E4F28C58], "ph_genericErrorWithLocalizedDescription:", @"Failed to get a placeholder object for asset");
    long long v43 = [v53 fileName];
    v39 = v51;
    id v44 = (id)[v51 addExceptionWithType:0 path:v43 underlyingError:v42 file:"/Library/Caches/com.apple.xbs/Sources/Photos/Projects/PhotoKit/Sources/Import/PHImporter.m" line:810];
    goto LABEL_33;
  }
  id v38 = [v36 localIdentifier];
  v39 = v51;
  [v51 setAssetIdentifier:v38];

  id v40 = [(PHImportOptions *)self->_options destinationAlbum];

  if (v40)
  {
    long long v41 = [(PHImportOptions *)self->_options destinationAlbum];
    long long v42 = +[PHAssetCollectionChangeRequest changeRequestForAssetCollection:v41];

    id v63 = v37;
    long long v43 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v63 count:1];
    [v42 addAssets:v43];
LABEL_33:

    goto LABEL_34;
  }
  if ([v53 canPreserveFolderStructure]
    && [(PHImportOptions *)self->_options preserveFolderStructure])
  {
    __int16 v47 = [v53 url];
    uint64_t v48 = [v47 path];
    long long v42 = [v48 stringByDeletingLastPathComponent];

    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __77__PHImporter__importRecord_createdAlbumIdentifiers_createdFolderIdentifiers___block_invoke;
    v56[3] = &unk_1E58467B8;
    id v57 = v50;
    id v58 = v52;
    [(PHImporter *)self ensureContainersExistForAlbumPath:v42 forAsset:v37 completion:v56];

    long long v43 = v57;
    goto LABEL_33;
  }
LABEL_34:
  v45 = [v12 placeholderForCreatedAsset];

  return v45;
}

void __77__PHImporter__importRecord_createdAlbumIdentifiers_createdFolderIdentifiers___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2) {
    [*(id *)(a1 + 32) addObject:a2];
  }
  [*(id *)(a1 + 40) addObjectsFromArray:v5];
}

- (void)importRecords:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_importQueue);
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__25201;
  v23[4] = __Block_byref_object_dispose__25202;
  id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v21[0] = 0;
  v21[1] = v21;
  void v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__25201;
  v21[4] = __Block_byref_object_dispose__25202;
  id v22 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v8 = [(PHImporter *)self library];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __46__PHImporter_importRecords_completionHandler___block_invoke;
  v16[3] = &unk_1E5847CB0;
  id v17 = v6;
  uint64_t v18 = self;
  __int16 v19 = v23;
  BOOL v20 = v21;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __46__PHImporter_importRecords_completionHandler___block_invoke_2;
  v11[3] = &unk_1E5845A48;
  v11[4] = self;
  uint64_t v14 = v23;
  uint64_t v15 = v21;
  id v9 = v17;
  id v12 = v9;
  id v10 = v7;
  id v13 = v10;
  [v8 performChanges:v16 completionHandler:v11];

  _Block_object_dispose(v21, 8);
  _Block_object_dispose(v23, 8);
}

void __46__PHImporter_importRecords_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v13;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = objc_msgSend(*(id *)(a1 + 40), "_importRecord:createdAlbumIdentifiers:createdFolderIdentifiers:", *(void *)(*((void *)&v12 + 1) + 8 * v6), *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), (void)v12);
        id v8 = [*(id *)(*(void *)(a1 + 40) + 144) libraryScope];

        if (v8)
        {
          id v9 = [*(id *)(*(void *)(a1 + 40) + 144) libraryScope];
          id v10 = +[PHLibraryScopeChangeRequest changeRequestForLibraryScope:v9];

          uint64_t v16 = v7;
          char v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
          [v10 moveToSharedLibrary:v11];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v12 objects:v17 count:16];
    }
    while (v4);
  }
}

void __46__PHImporter_importRecords_completionHandler___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(NSObject **)(v6 + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__PHImporter_importRecords_completionHandler___block_invoke_3;
  block[3] = &unk_1E5845A20;
  char v14 = a2;
  block[4] = v6;
  long long v13 = *(_OWORD *)(a1 + 56);
  id v10 = *(id *)(a1 + 40);
  id v11 = v5;
  id v12 = *(id *)(a1 + 48);
  id v8 = v5;
  dispatch_async(v7, block);
}

uint64_t __46__PHImporter_importRecords_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 80))
  {
    [*(id *)(*(void *)(a1 + 32) + 112) removeAllObjects];
    [*(id *)(*(void *)(v1 + 32) + 120) removeAllObjects];
    if ([*(id *)(*(void *)(*(void *)(v1 + 64) + 8) + 40) count]) {
      [*(id *)(v1 + 32) updateAlbumCacheWithAlbumIdentifiers:*(void *)(*(void *)(*(void *)(v1 + 64) + 8) + 40)];
    }
    if ([*(id *)(*(void *)(*(void *)(v1 + 72) + 8) + 40) count]) {
      [*(id *)(v1 + 32) updateFolderCacheWithFolders:*(void *)(*(void *)(*(void *)(v1 + 72) + 8) + 40)];
    }
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id obj = *(id *)(v1 + 40);
    uint64_t v2 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v2)
    {
      uint64_t v3 = v2;
      uint64_t v4 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v3; ++i)
        {
          if (*(void *)v30 != v4) {
            objc_enumerationMutation(obj);
          }
          uint64_t v6 = [*(id *)(*((void *)&v29 + 1) + 8 * i) importAsset];
          id v7 = [v6 burstUUID];

          if (v7) {
            [*(id *)(v1 + 32) importedBurstAsset:v6];
          }
        }
        uint64_t v3 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v3);
    }
  }
  else
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id obj = *(id *)(a1 + 40);
    uint64_t v23 = [obj countByEnumeratingWithState:&v25 objects:v33 count:16];
    if (v23)
    {
      uint64_t v21 = *(void *)v26;
      uint64_t v22 = v1;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v26 != v21) {
            objc_enumerationMutation(obj);
          }
          id v9 = *(void **)(*((void *)&v25 + 1) + 8 * j);
          id v10 = [v9 importAsset];
          id v11 = NSString;
          id v12 = [v10 fileName];
          long long v13 = [v10 rawAsset];
          if (v13)
          {
            char v14 = NSString;
            long long v15 = [v10 rawAsset];
            uint64_t v16 = [v15 fileName];
            id v17 = [v14 stringWithFormat:@", %@", v16];
            uint64_t v18 = [v11 stringWithFormat:@"%@%@", v12, v17];
          }
          else
          {
            uint64_t v18 = [v11 stringWithFormat:@"%@%@", v12, &stru_1EEAC1950];
          }

          uint64_t v1 = v22;
          id v19 = (id)[v9 addExceptionWithType:0 path:v18 underlyingError:*(void *)(v22 + 48) file:"/Library/Caches/com.apple.xbs/Sources/Photos/Projects/PhotoKit/Sources/Import/PHImporter.m" line:730];
        }
        uint64_t v23 = [obj countByEnumeratingWithState:&v25 objects:v33 count:16];
      }
      while (v23);
    }
  }

  return (*(uint64_t (**)(void))(*(void *)(v1 + 56) + 16))();
}

- (BOOL)shouldIngestInPlace:(id)a3
{
  unint64_t v3 = [a3 resourceType];
  return (v3 < 0xA) & (0x21Eu >> v3);
}

- (id)_recordsToImportWithCount:(unint64_t)a3
{
  id v5 = -[NSMutableArray subarrayWithRange:](self->_downloadedRecords, "subarrayWithRange:", 0, a3);
  -[NSMutableArray removeObjectsInRange:](self->_downloadedRecords, "removeObjectsInRange:", 0, a3);

  return v5;
}

- (void)importRecords:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_importQueue);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = &__28__PHImporter_importRecords___block_invoke;
  v6[3] = &unk_1E5848DF0;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  [(PHImporter *)self importRecords:v5 completionHandler:v6];
}

- (void)downloadNextAssetInRecord:(id)a3 toURL:(id)a4 subRecordEnumerator:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_importQueue);
  char v14 = [v12 nextObject];
  if (!v14)
  {
    importQueue = self->_importQueue;
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __84__PHImporter_downloadNextAssetInRecord_toURL_subRecordEnumerator_completionHandler___block_invoke;
    v39[3] = &unk_1E5848D50;
    id v40 = v13;
    dispatch_async(importQueue, v39);
    uint64_t v23 = v40;
    goto LABEL_7;
  }
  if ([(PHImporter *)self shouldImportRecordAsReference:v14]
    || ![v14 needsDownload])
  {
    uint64_t v22 = self->_importQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __84__PHImporter_downloadNextAssetInRecord_toURL_subRecordEnumerator_completionHandler___block_invoke_105;
    block[3] = &unk_1E5848AB0;
    block[4] = self;
    id v27 = v10;
    id v28 = v11;
    id v29 = v12;
    id v30 = v13;
    dispatch_async(v22, block);

    uint64_t v23 = v27;
LABEL_7:

    goto LABEL_8;
  }
  long long v15 = [v14 timers];
  uint64_t v16 = [v15 startTiming:1 subtype:0];

  id v17 = [v14 importAsset];
  long long v25 = [v17 fileName];
  uint64_t v18 = [v25 uppercaseString];
  id v19 = [v11 URLByAppendingPathComponent:v18];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __84__PHImporter_downloadNextAssetInRecord_toURL_subRecordEnumerator_completionHandler___block_invoke_2;
  v31[3] = &unk_1E58459F8;
  v31[4] = self;
  id v32 = v14;
  id v33 = v16;
  id v34 = v10;
  id v38 = v13;
  id v35 = v17;
  id v36 = v11;
  id v37 = v12;
  id v20 = v17;
  id v21 = v16;
  [v20 copyToURL:v19 completionHandler:v31];

LABEL_8:
}

uint64_t __84__PHImporter_downloadNextAssetInRecord_toURL_subRecordEnumerator_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __84__PHImporter_downloadNextAssetInRecord_toURL_subRecordEnumerator_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __84__PHImporter_downloadNextAssetInRecord_toURL_subRecordEnumerator_completionHandler___block_invoke_3;
  v12[3] = &unk_1E58459D0;
  id v13 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 32);
  id v14 = v8;
  uint64_t v15 = v9;
  id v16 = *(id *)(a1 + 56);
  id v17 = v5;
  id v18 = v6;
  id v22 = *(id *)(a1 + 88);
  id v19 = *(id *)(a1 + 64);
  id v20 = *(id *)(a1 + 72);
  id v21 = *(id *)(a1 + 80);
  id v10 = v6;
  id v11 = v5;
  dispatch_async(v7, v12);
}

uint64_t __84__PHImporter_downloadNextAssetInRecord_toURL_subRecordEnumerator_completionHandler___block_invoke_105(uint64_t a1)
{
  return [*(id *)(a1 + 32) downloadNextAssetInRecord:*(void *)(a1 + 40) toURL:*(void *)(a1 + 48) subRecordEnumerator:*(void *)(a1 + 56) completionHandler:*(void *)(a1 + 64)];
}

void __84__PHImporter_downloadNextAssetInRecord_toURL_subRecordEnumerator_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) timers];
  [v2 stopTiming:*(void *)(a1 + 40)];

  if (*(unsigned char *)(*(void *)(a1 + 48) + 32) == 3)
  {
    unint64_t v3 = PLImportGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      id v4 = *(void **)(a1 + 56);
      *(_DWORD *)buf = 138412290;
      id v42 = v4;
      _os_log_impl(&dword_19B043000, v3, OS_LOG_TYPE_DEBUG, "IMPORT CANCELLED: download completed after cancellation: %@", buf, 0xCu);
    }

    id v5 = [*(id *)(a1 + 64) path];
    [*(id *)(a1 + 32) setDownloadedPath:v5];

    [*(id *)(a1 + 56) cleanupAfterFailure];
    id v6 = (id)[*(id *)(a1 + 48) removeImportDirectoryForLibrary:*(void *)(*(void *)(a1 + 48) + 160)];
    return;
  }
  if (!*(void *)(a1 + 72))
  {
    id v8 = PLImportGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v9 = [*(id *)(a1 + 64) path];
      uint64_t v10 = *(void *)(a1 + 80);
      *(_DWORD *)buf = 138412546;
      id v42 = v9;
      __int16 v43 = 2112;
      uint64_t v44 = v10;
      _os_log_impl(&dword_19B043000, v8, OS_LOG_TYPE_DEBUG, "IMPORT DOWNLOAD: completed to path: %@, for asset: %@", buf, 0x16u);
    }
    if ([*(id *)(a1 + 80) isTIFF])
    {
      id v11 = [*(id *)(a1 + 80) url];

      if (!v11) {
        +[PHImportAsset determineIfTIFFIsRAW:*(void *)(a1 + 80) url:*(void *)(a1 + 64)];
      }
    }
    id v12 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v13 = [*(id *)(a1 + 64) path];
    id v38 = 0;
    id v14 = [v12 attributesOfItemAtPath:v13 error:&v38];
    id v15 = v38;

    if (v14)
    {
      uint64_t v16 = *MEMORY[0x1E4F28330];
      id v17 = [v14 objectForKeyedSubscript:*MEMORY[0x1E4F28330]];
      uint64_t v18 = [v17 integerValue];

      if ((v18 & 0x80) != 0)
      {
LABEL_24:
        id v27 = (void *)MEMORY[0x1E4F8B900];
        id v28 = [*(id *)(*(void *)(a1 + 48) + 160) photoLibrary];
        id v29 = [v28 managedObjectContextStoreUUID];
        [v27 persistString:v29 forKey:*MEMORY[0x1E4F8C360] fileURL:*(void *)(a1 + 64)];

        id v30 = [*(id *)(a1 + 64) path];
        [*(id *)(a1 + 32) setDownloadedPath:v30];

        uint64_t v31 = [*(id *)(a1 + 80) metadata];
        if (!v31) {
          goto LABEL_29;
        }
        id v32 = (void *)v31;
        if ((![*(id *)(a1 + 80) isJPEG]
           || [*(id *)(a1 + 80) isRender])
          && ([*(id *)(a1 + 80) isHEIF] & 1) == 0)
        {

          goto LABEL_32;
        }
        id v33 = [*(id *)(a1 + 80) source];
        char v34 = [v33 isAppleDevice];

        if ((v34 & 1) == 0)
        {
LABEL_29:
          uint64_t v35 = [*(id *)(a1 + 80) validateMetadataForImportRecord:*(void *)(a1 + 32)];
          if (v35)
          {
            id v36 = (void *)v35;
            (*(void (**)(void))(*(void *)(a1 + 104) + 16))();

LABEL_33:
            return;
          }
        }
LABEL_32:
        [*(id *)(a1 + 48) downloadNextAssetInRecord:*(void *)(a1 + 56) toURL:*(void *)(a1 + 88) subRecordEnumerator:*(void *)(a1 + 96) completionHandler:*(void *)(a1 + 104)];
        goto LABEL_33;
      }
      uint64_t v19 = v18 | 0x80;
      id v20 = [MEMORY[0x1E4F28CB8] defaultManager];
      uint64_t v39 = v16;
      id v21 = [NSNumber numberWithUnsignedInteger:v19];
      id v40 = v21;
      id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v40 forKeys:&v39 count:1];
      uint64_t v23 = [*(id *)(a1 + 64) path];
      id v37 = v15;
      char v24 = [v20 setAttributes:v22 ofItemAtPath:v23 error:&v37];
      id v25 = v37;

      if (v24)
      {
        id v15 = v25;
        goto LABEL_24;
      }
      long long v26 = PLImportGetLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v42 = v25;
        _os_log_impl(&dword_19B043000, v26, OS_LOG_TYPE_ERROR, "Unable to make read-only imported file writeable with error: %@", buf, 0xCu);
      }
      id v15 = v25;
    }
    else
    {
      long long v26 = PLImportGetLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v42 = v15;
        _os_log_impl(&dword_19B043000, v26, OS_LOG_TYPE_ERROR, "Unable to read file attributes at import downloaded file url, error: %@", buf, 0xCu);
      }
    }

    goto LABEL_24;
  }
  objc_msgSend(*(id *)(a1 + 56), "addException:");
  id v7 = *(void (**)(void))(*(void *)(a1 + 104) + 16);

  v7();
}

- (BOOL)shouldImportRecordAsReference:(id)a3
{
  id v4 = a3;
  if ([(PHImportOptions *)self->_options shouldImportAsReferenced]) {
    char v5 = [v4 canReference];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (void)importNextAsset:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_importQueue);
  if (!self->_isCanceled)
  {
    id v6 = [v5 nextObject];
    id v7 = v6;
    if (v6)
    {
      unint64_t v3 = [v6 importRecordForPrimaryAsset];
      if ([(PHImporter *)self handleErrorsForRecord:v3 batch:0 file:"/Library/Caches/com.apple.xbs/Sources/Photos/Projects/PhotoKit/Sources/Import/PHImporter.m" line:502])
      {
        [(PHImporter *)self addRecordToResults:v3];
        importQueue = self->_importQueue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __30__PHImporter_importNextAsset___block_invoke;
        block[3] = &unk_1E5848DF0;
        block[4] = self;
        id v28 = v5;
        dispatch_async(importQueue, block);

LABEL_18:
        goto LABEL_19;
      }
LABEL_11:
      uint64_t v10 = -[PHImporter getDestinationUrlForImportAsset:](self, "getDestinationUrlForImportAsset:", v7, v20, isCanceled);
      if (v10)
      {
        id v11 = [v3 allImportRecords];
        id v12 = [v11 objectEnumerator];
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __30__PHImporter_importNextAsset___block_invoke_3;
        v22[3] = &unk_1E5848EC0;
        v22[4] = self;
        id v23 = v3;
        id v24 = v5;
        [(PHImporter *)self downloadNextAssetInRecord:v23 toURL:v10 subRecordEnumerator:v12 completionHandler:v22];
      }
      else
      {
        id v13 = (void *)MEMORY[0x1E4F28C58];
        id v14 = [v7 fileName];
        id v15 = objc_msgSend(v13, "ph_genericErrorWithLocalizedDescription:", @"Unable to get a downloadPath for %@", v14);

        uint64_t v16 = [v7 url];
        id v17 = [v16 path];
        id v18 = (id)[v3 addExceptionWithType:0 path:v17 underlyingError:v15 file:"/Library/Caches/com.apple.xbs/Sources/Photos/Projects/PhotoKit/Sources/Import/PHImporter.m" line:511];

        [(PHImporter *)self handleErrorsForRecord:v3 batch:0 file:"/Library/Caches/com.apple.xbs/Sources/Photos/Projects/PhotoKit/Sources/Import/PHImporter.m" line:512];
        [(PHImporter *)self addRecordToResults:v3];
        uint64_t v19 = self->_importQueue;
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        void v25[2] = __30__PHImporter_importNextAsset___block_invoke_2;
        v25[3] = &unk_1E5848DF0;
        v25[4] = self;
        id v26 = v5;
        dispatch_async(v19, v25);
      }
      goto LABEL_18;
    }
    int importState = self->_importState;
    if (!self->_importState)
    {
      if (![(NSMutableArray *)self->_downloadedRecords count])
      {
        [(PHImporter *)self finishImport];
        goto LABEL_19;
      }
      self->_int importState = 2;
      unint64_t v3 = [(PHImporter *)self _recordsToImportWithCount:[(NSMutableArray *)self->_downloadedRecords count]];
      [(PHImporter *)self importRecords:v3];
      goto LABEL_18;
    }
    if (importState == 1)
    {
      self->_int importState = 2;
    }
    else if ((importState - 2) < 2)
    {
      id v20 = off_1E5845A90[(importState - 1)];
      BOOL isCanceled = self->_isCanceled;
      _PFAssertFailHandler();
      goto LABEL_11;
    }
LABEL_19:

    goto LABEL_20;
  }
  if (!self->_importState) {
    [(PHImporter *)self finishImport];
  }
LABEL_20:
}

uint64_t __30__PHImporter_importNextAsset___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) importNextAsset:*(void *)(a1 + 40)];
}

uint64_t __30__PHImporter_importNextAsset___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) importNextAsset:*(void *)(a1 + 40)];
}

uint64_t __30__PHImporter_importNextAsset___block_invoke_3(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) handleErrorsForRecord:*(void *)(a1 + 40) batch:0 file:"/Library/Caches/com.apple.xbs/Sources/Photos/Projects/PhotoKit/Sources/Import/PHImporter.m" line:519];
  unint64_t v3 = *(id **)(a1 + 32);
  if (v2)
  {
    [v3 addRecordToResults:*(void *)(a1 + 40)];
LABEL_3:
    uint64_t v4 = *(void *)(a1 + 32);
    goto LABEL_9;
  }
  [v3[9] addObject:*(void *)(a1 + 40)];
  uint64_t v4 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v4 + 80))
  {
    int v5 = *(unsigned __int8 *)(v4 + 32);
    if (*(unsigned char *)(v4 + 32))
    {
      if ((v5 - 2) >= 2) {
        goto LABEL_9;
      }
      uint64_t v10 = off_1E5845A90[(v5 - 1)];
      uint64_t v11 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 80);
      uint64_t v4 = _PFAssertFailHandler();
    }
    unint64_t v6 = objc_msgSend(*(id *)(v4 + 72), "count", v10, v11);
    uint64_t v4 = *(void *)(a1 + 32);
    if (v6 >= *(void *)(v4 + 128))
    {
      *(unsigned char *)(v4 + 32) = 1;
      uint64_t v9 = [*(id *)(a1 + 32) _recordsToImportWithCount:*(void *)(*(void *)(a1 + 32) + 128)];
      [*(id *)(a1 + 32) importRecords:v9];

      goto LABEL_3;
    }
  }
LABEL_9:
  uint64_t v7 = *(void *)(a1 + 48);

  return [(id)v4 importNextAsset:v7];
}

- (id)getDestinationUrlForImportAsset:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(PHPhotoLibrary *)self->_library pathManager];
  int v6 = [v5 isUBF];

  uint64_t v7 = [v4 parentFolderPath];
  id v8 = (void *)v7;
  if (v6)
  {
    if (v7)
    {
      uint64_t v9 = [(PHImporter *)self makeDownloadUrlForParentFolderPath:v7];
    }
    else
    {
      uint64_t v16 = PLImportGetLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v24 = v4;
        _os_log_impl(&dword_19B043000, v16, OS_LOG_TYPE_ERROR, "Didn't get a parent folder for asset %@", buf, 0xCu);
      }

      uint64_t v9 = 0;
    }
  }
  else
  {
    uint64_t v10 = [v4 importIdentifier];
    uint64_t v11 = [(NSMutableDictionary *)self->_downloadFolderUrlByImportIdentifier objectForKeyedSubscript:v10];
    if (v11)
    {
      uint64_t v9 = (void *)v11;
      id v12 = [(PHPhotoLibrary *)self->_library pathManager];
      id v22 = 0;
      id v13 = [v12 externalDirectoryWithSubType:1 createIfNeeded:1 error:&v22];
      id v14 = v22;

      if (v13)
      {
        uint64_t v15 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v13 isDirectory:1];

        if (v15)
        {
          [(NSMutableArray *)self->_additionalDcimImportFolders addObject:v15];
          uint64_t v9 = (void *)v15;
        }
        else
        {
          id v18 = PLImportGetLog();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19B043000, v18, OS_LOG_TYPE_ERROR, "Didn't get a url from the bundle path", buf, 2u);
          }

          uint64_t v9 = 0;
        }
      }
      else
      {
        id v17 = PLImportGetLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v24 = v14;
          _os_log_impl(&dword_19B043000, v17, OS_LOG_TYPE_ERROR, "Didn't get a bundle path from path manager (%@)", buf, 0xCu);
        }
      }
    }
    else if (v8)
    {
      uint64_t v9 = [(PHImporter *)self makeDownloadUrlForParentFolderPath:v8];
      if (v9) {
        [(NSMutableDictionary *)self->_downloadFolderUrlByImportIdentifier setObject:v9 forKeyedSubscript:v10];
      }
    }
    else
    {
      id v20 = PLImportGetLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        id v21 = [v4 uuid];
        *(_DWORD *)buf = 138412290;
        id v24 = v21;
        _os_log_impl(&dword_19B043000, v20, OS_LOG_TYPE_ERROR, "Didn't get a parent folder for asset %@", buf, 0xCu);
      }
      uint64_t v9 = 0;
    }
  }

  return v9;
}

- (id)makeDownloadUrlForParentFolderPath:(id)a3
{
  id v4 = a3;
  int v5 = [(NSMutableDictionary *)self->_parentFolderMapping objectForKeyedSubscript:v4];
  if (!v5)
  {
    int v6 = [(PHPhotoLibrary *)self->_library pathManager];
    if ([v6 isUBF])
    {
      uint64_t v17 = 0;
      uint64_t v7 = (id *)&v17;
      uint64_t v8 = [v6 externalDirectoryWithSubType:1 leafType:1 additionalPathComponents:v4 createIfNeeded:1 error:&v17];
    }
    else
    {
      uint64_t v16 = 0;
      uint64_t v7 = (id *)&v16;
      uint64_t v8 = [v6 externalDirectoryWithSubType:1 createIfNeeded:1 error:&v16];
    }
    uint64_t v9 = (void *)v8;
    id v10 = *v7;
    if (v9)
    {
      uint64_t v11 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v9 isDirectory:1];
      if (v11)
      {
        int v5 = (void *)v11;
        [(NSMutableDictionary *)self->_parentFolderMapping setObject:v11 forKeyedSubscript:v4];
LABEL_14:

        goto LABEL_15;
      }
      id v12 = PLImportGetLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v15 = 0;
        id v13 = "Didn't get a url from the bundle path";
        goto LABEL_12;
      }
    }
    else
    {
      id v12 = PLImportGetLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v15 = 0;
        id v13 = "Didn't get a bundle path from path manager";
LABEL_12:
        _os_log_impl(&dword_19B043000, v12, OS_LOG_TYPE_ERROR, v13, v15, 2u);
      }
    }

    int v5 = 0;
    goto LABEL_14;
  }
LABEL_15:

  return v5;
}

- (void)ensureEnoughDiskSpaceAvailableIfNeededForAssets:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, uint64_t))a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_importQueue);
  if (MEMORY[0x19F388C70]())
  {
    uint64_t v8 = PLImportGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      uint64_t v9 = "Skipping disk space check, as we are in a unit test environment.";
LABEL_7:
      _os_log_impl(&dword_19B043000, v8, OS_LOG_TYPE_INFO, v9, buf, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if ([(PHImportOptions *)self->_options skipDiskSpaceCheck])
  {
    uint64_t v8 = PLImportGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      uint64_t v9 = "Skipping disk space check, as specified by importer options.";
      goto LABEL_7;
    }
LABEL_8:

    v7[2](v7, 1);
    goto LABEL_17;
  }
  *(void *)buf = 0;
  id v29 = buf;
  uint64_t v30 = 0x2020000000;
  uint64_t v31 = 0x200000;
  unint64_t v10 = [v6 count];
  if (PHImportConcurrencyLimit_onceToken != -1) {
    dispatch_once(&PHImportConcurrencyLimit_onceToken, &__block_literal_global_4867);
  }
  unint64_t v11 = PHImportConcurrencyLimit_concurrencyLimit;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  void v25[2] = __73__PHImporter_ensureEnoughDiskSpaceAvailableIfNeededForAssets_completion___block_invoke;
  v25[3] = &unk_1E5845980;
  id v26 = v6;
  id v27 = buf;
  PHImportDispatchApply(v10, v11, 0, v25);
  id v12 = [(PHPhotoLibrary *)self->_library photoLibraryURL];
  id v13 = [v12 path];

  LODWORD(v12) = [MEMORY[0x1E4F8A6D0] hasEntitlementsForCacheDelete];
  id v14 = [(PHPhotoLibrary *)self->_library pathManager];
  uint64_t v15 = [v14 capabilities];
  int v16 = [v15 isNetworkVolume];

  if ((v12 ^ 1 | v16) == 1)
  {
    uint64_t v17 = PLImportGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v24 = 0;
      _os_log_impl(&dword_19B043000, v17, OS_LOG_TYPE_ERROR, "Performing Cache Delete requests from this process is NOT POSSIBLE due to entitlements or network volume, so falling back to just checking for available disk space, and failing if not.", v24, 2u);
    }

    unint64_t v18 = atomic_load((unint64_t *)v29 + 3);
    [(PHImporter *)self performLegacyDiskSpaceCheckForRequiredBytes:v18 forPath:v13 withCompletion:v7];
  }
  else
  {
    uint64_t v19 = (void *)[objc_alloc(MEMORY[0x1E4F8A6D0]) initWithQoSClass:25 pathForVolume:v13 callbackQueue:self->_importQueue];
    [(PHImporter *)self setCacheDeleteClient:v19];

    id v20 = [(PHImporter *)self cacheDeleteClient];
    unint64_t v21 = atomic_load((unint64_t *)v29 + 3);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __73__PHImporter_ensureEnoughDiskSpaceAvailableIfNeededForAssets_completion___block_invoke_80;
    v22[3] = &unk_1E58459A8;
    v22[4] = self;
    id v23 = v7;
    [v20 requestDiskSpaceAvailabilityOfSize:v21 completion:v22];
  }
  _Block_object_dispose(buf, 8);
LABEL_17:
}

void __73__PHImporter_ensureEnoughDiskSpaceAvailableIfNeededForAssets_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
  atomic_fetch_add((atomic_ullong *volatile)(*(void *)(*(void *)(a1 + 40) + 8) + 24), [v3 approximateBytesRequiredToImport]);
}

void __73__PHImporter_ensureEnoughDiskSpaceAvailableIfNeededForAssets_completion___block_invoke_80(uint64_t a1, int a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  unint64_t v10 = PLImportGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    unint64_t v11 = @"NO";
    *(_DWORD *)buf = 138544130;
    if (a2) {
      unint64_t v11 = @"YES";
    }
    id v29 = v11;
    __int16 v30 = 2048;
    uint64_t v31 = a3;
    __int16 v32 = 2048;
    uint64_t v33 = a4;
    __int16 v34 = 2112;
    id v35 = v9;
    _os_log_impl(&dword_19B043000, v10, OS_LOG_TYPE_INFO, "Requesting disk space succeeded: %{public}@. Bytes purged: %llu, Additional bytes required: %llu, Error: %@", buf, 0x2Au);
  }

  if (v9)
  {
    uint64_t v12 = [v9 code];
    if (!a2)
    {
      uint64_t v13 = v12;
      if ([v9 code] == 3)
      {
        id v14 = [MEMORY[0x1E4F28B68] stringFromByteCount:a4 countStyle:0];
        v26[0] = *MEMORY[0x1E4F28228];
        uint64_t v15 = [NSString stringWithFormat:@"Not enough storage space available for import. Additional space required: %@]", v14];
        v26[1] = @"MoreSpaceRequired";
        v27[0] = v15;
        v27[1] = v14;
        int v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:2];

        uint64_t v17 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.ImportErrorDomain" code:-5 userInfo:v16];
        unint64_t v18 = [*(id *)(a1 + 32) results];
        id v19 = (id)[v18 addExceptionWithType:5 path:0 underlyingError:v17 file:"/Library/Caches/com.apple.xbs/Sources/Photos/Projects/PhotoKit/Sources/Import/PHImporter.m" line:397];
      }
      else
      {
        if (v13 == 1)
        {
LABEL_14:
          id v20 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
          goto LABEL_15;
        }
        unint64_t v21 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v24 = *MEMORY[0x1E4F28A50];
        id v25 = v9;
        id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
        id v14 = [v21 errorWithDomain:@"com.apple.ImportErrorDomain" code:-8 userInfo:v22];

        int v16 = [*(id *)(a1 + 32) results];
        id v23 = (id)[v16 addExceptionWithType:6 path:0 underlyingError:v14 file:"/Library/Caches/com.apple.xbs/Sources/Photos/Projects/PhotoKit/Sources/Import/PHImporter.m" line:402];
      }

      goto LABEL_14;
    }
LABEL_10:
    id v20 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
LABEL_15:
    v20();
    goto LABEL_16;
  }
  if (a2) {
    goto LABEL_10;
  }
LABEL_16:
}

- (void)performLegacyDiskSpaceCheckForRequiredBytes:(int64_t)a3 forPath:(id)a4 withCompletion:(id)a5
{
  void v25[2] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = (void (**)(id, void))a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_importQueue);
  if (MEMORY[0x19F388C70]())
  {
    unint64_t v10 = PLImportGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B043000, v10, OS_LOG_TYPE_INFO, "Skipping disk space check, as we are in a unit test environment.", buf, 2u);
    }
  }
  else
  {
    uint64_t v11 = [MEMORY[0x1E4F8B8D8] diskSpaceAvailableForPath:v8];
    int64_t v12 = a3 - v11;
    if (a3 >= v11)
    {
      uint64_t v13 = v11;
      v24[0] = *MEMORY[0x1E4F28228];
      id v14 = NSString;
      uint64_t v15 = [NSNumber numberWithLongLong:a3];
      int v16 = [NSNumber numberWithLongLong:v13];
      uint64_t v17 = [v14 stringWithFormat:@"Not enough storage space available for import. Bytes required: %@. Bytes available: %@", v15, v16];
      v24[1] = @"MoreSpaceRequired";
      v25[0] = v17;
      unint64_t v18 = [MEMORY[0x1E4F28B68] stringFromByteCount:v12 countStyle:0];
      v25[1] = v18;
      id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2];

      id v20 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.ImportErrorDomain" code:-5 userInfo:v19];
      unint64_t v21 = [(PHImporter *)self results];
      id v22 = (id)[v21 addExceptionWithType:5 path:0 underlyingError:v20 file:"/Library/Caches/com.apple.xbs/Sources/Photos/Projects/PhotoKit/Sources/Import/PHImporter.m" line:339];

      [(NSProgress *)self->_progress cancel];
      v9[2](v9, 0);

      goto LABEL_8;
    }
  }
  v9[2](v9, 1);
LABEL_8:
}

- (id)beginImport:(id)a3
{
  v57[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(PHPhotoLibrary *)self->_library pathManager];
  int v6 = [v5 isUBF];

  if (v6) {
    id v7 = [(PHImporter *)self removeImportDirectoryForLibrary:self->_library];
  }
  id v8 = [(PHImporter *)self options];
  id v9 = [v8 sortDescriptor];

  if (v9)
  {
    unint64_t v10 = [(PHImporter *)self options];
    uint64_t v11 = [v10 sortDescriptor];
    v57[0] = v11;
    int64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:1];
    uint64_t v13 = [v4 sortedArrayUsingDescriptors:v12];
    id v14 = (void *)[v13 mutableCopy];
  }
  else
  {
    id v14 = (void *)[v4 mutableCopy];
  }
  if ([v4 count])
  {
    uint64_t v15 = [v4 objectAtIndexedSubscript:0];
    int v16 = [v15 canPreserveFolderStructure];

    if (v16)
    {
      if ([(PHImportOptions *)self->_options preserveFolderStructure])
      {
        uint64_t v17 = [(PHImportSource *)self->_source prefix];
        BOOL v18 = v17 == 0;

        if (!v18)
        {
          id v19 = [(PHImportOptions *)self->_options destinationFolder];
          if (!v19)
          {
            id v20 = +[PHFetchOptions fetchOptionsWithPhotoLibrary:self->_library orObject:0];
            unint64_t v21 = +[PHCollectionList fetchRootAlbumCollectionListWithOptions:v20];

            id v19 = [v21 firstObject];
          }
          uint64_t v51 = 0;
          id v52 = &v51;
          uint64_t v53 = 0x3032000000;
          long long v54 = __Block_byref_object_copy__25201;
          uint64_t v55 = __Block_byref_object_dispose__25202;
          id v56 = 0;
          v44[0] = 0;
          v44[1] = v44;
          v44[2] = 0x3032000000;
          v44[3] = __Block_byref_object_copy__25201;
          v44[4] = __Block_byref_object_dispose__25202;
          id v45 = 0;
          uint64_t v38 = 0;
          uint64_t v39 = &v38;
          uint64_t v40 = 0x3032000000;
          long long v41 = __Block_byref_object_copy__25201;
          id v42 = __Block_byref_object_dispose__25202;
          id v43 = 0;
          library = self->_library;
          v33[0] = MEMORY[0x1E4F143A8];
          v33[1] = 3221225472;
          v33[2] = __26__PHImporter_beginImport___block_invoke;
          v33[3] = &unk_1E5847198;
          id v35 = v44;
          v33[4] = self;
          id v23 = v19;
          id v34 = v23;
          uint64_t v36 = &v38;
          id v37 = &v51;
          id v32 = 0;
          [(PHPhotoLibrary *)library performChangesAndWait:v33 error:&v32];
          id v24 = v32;
          if (v39[5])
          {
            uint64_t v50 = v39[5];
            id v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v50 count:1];
            [(PHImporter *)self updateFolderCacheWithFolders:v25];
          }
          if (v52[5])
          {
            id v26 = PLImportGetLog();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              id v27 = [(PHImportSource *)self->_source prefix];
              id v28 = (void *)v52[5];
              *(_DWORD *)buf = 138412546;
              __int16 v47 = v27;
              __int16 v48 = 2112;
              id v49 = v28;
              _os_log_impl(&dword_19B043000, v26, OS_LOG_TYPE_ERROR, "Failed to create folder '%@' for import (%@)", buf, 0x16u);
            }
          }
          if (v24)
          {
            id v29 = PLImportGetLog();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              __int16 v30 = [(PHImportSource *)self->_source prefix];
              *(_DWORD *)buf = 138412546;
              __int16 v47 = v30;
              __int16 v48 = 2112;
              id v49 = v24;
              _os_log_impl(&dword_19B043000, v29, OS_LOG_TYPE_ERROR, "Failed to create folder '%@' for import (%@)", buf, 0x16u);
            }
          }

          _Block_object_dispose(&v38, 8);
          _Block_object_dispose(v44, 8);

          _Block_object_dispose(&v51, 8);
        }
      }
    }
  }

  return v14;
}

void __26__PHImporter_beginImport___block_invoke(void *a1)
{
  int v2 = (id *)a1[4];
  id v3 = [v2[23] prefix];
  uint64_t v4 = a1[5];
  id v15 = 0;
  uint64_t v5 = [v2 createFolderForPath:v3 inFolder:v4 error:&v15];
  id v6 = v15;
  uint64_t v7 = *(void *)(a1[6] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;

  id v9 = [*(id *)(*(void *)(a1[6] + 8) + 40) placeholderForCreatedCollectionList];
  uint64_t v10 = [v9 localIdentifier];
  uint64_t v11 = *(void *)(a1[7] + 8);
  int64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  uint64_t v13 = *(void *)(a1[8] + 8);
  id v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v6;
}

- (PHImporter)initWithLibrary:(id)a3 options:(id)a4 source:(id)a5 delegate:(id)a6 completionHandler:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v66.receiver = self;
  v66.super_class = (Class)PHImporter;
  BOOL v18 = [(PHImporter *)&v66 init];
  id v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_library, a3);
    if (v14) {
      id v20 = (PHImportOptions *)v14;
    }
    else {
      id v20 = objc_alloc_init(PHImportOptions);
    }
    options = v19->_options;
    v19->_options = v20;

    uint64_t v22 = objc_opt_new();
    results = v19->_results;
    v19->_results = (PHImportResults *)v22;

    uint64_t v24 = [MEMORY[0x1E4F8BA08] UUIDString];
    importSessionID = v19->_importSessionID;
    v19->_importSessionID = (NSString *)v24;

    v19->_int importState = 0;
    id v26 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v27 = dispatch_queue_attr_make_with_qos_class(v26, QOS_CLASS_USER_INITIATED, -1);
    dispatch_queue_t v28 = dispatch_queue_create("com.photos.import.serviceimporter", v27);
    importQueue = v19->_importQueue;
    v19->_importQueue = (OS_dispatch_queue *)v28;

    __int16 v30 = [v13 pathManager];
    LODWORD(v27) = [v30 isDCIM];

    unint64_t v31 = 0x1E4F1C000;
    unint64_t v32 = 0x1E4F1C000;
    if (v27)
    {
      id v33 = objc_alloc(MEMORY[0x1E4F8B940]);
      id v34 = [v13 photoLibraryBundle];
      [v34 pathManager];
      id v35 = a5;
      id v36 = v14;
      id v37 = v17;
      id v38 = v13;
      id v39 = v16;
      v41 = id v40 = v15;
      id v42 = v33;
      unint64_t v32 = 0x1E4F1C000uLL;
      uint64_t v43 = [v42 initWithPathManager:v41];
      importFileManager = v19->_importFileManager;
      v19->_importFileManager = (PLImportFileManager *)v43;

      id v15 = v40;
      id v16 = v39;
      id v13 = v38;
      id v17 = v37;
      id v14 = v36;
      a5 = v35;
      unint64_t v31 = 0x1E4F1C000uLL;

      id v45 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      downloadFolderUrlByImportIdentifier = v19->_downloadFolderUrlByImportIdentifier;
      v19->_downloadFolderUrlByImportIdentifier = v45;

      __int16 v47 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      additionalDcimImportFolders = v19->_additionalDcimImportFolders;
      v19->_additionalDcimImportFolders = v47;
    }
    id v49 = (NSMutableDictionary *)objc_alloc_init(*(Class *)(v31 + 2656));
    parentFolderMapping = v19->_parentFolderMapping;
    v19->_parentFolderMapping = v49;

    uint64_t v51 = (NSMutableArray *)objc_alloc_init(*(Class *)(v32 + 2632));
    downloadedRecords = v19->_downloadedRecords;
    v19->_downloadedRecords = v51;

    v19->_BOOL isCanceled = 0;
    objc_storeStrong((id *)&v19->_source, a5);
    objc_storeWeak((id *)&v19->_delegate, v16);
    uint64_t v53 = [v17 copy];
    id completionHandler = v19->_completionHandler;
    v19->_id completionHandler = (id)v53;

    uint64_t v55 = (NSMutableDictionary *)objc_alloc_init(*(Class *)(v31 + 2656));
    containerPathByLocalIdentifier = v19->_containerPathByLocalIdentifier;
    v19->_containerPathByLocalIdentifier = v55;

    id v57 = (NSMutableDictionary *)objc_alloc_init(*(Class *)(v31 + 2656));
    folderByFolderPath = v19->_folderByFolderPath;
    v19->_folderByFolderPath = v57;

    long long v59 = (NSMutableDictionary *)objc_alloc_init(*(Class *)(v31 + 2656));
    albumByAlbumPath = v19->_albumByAlbumPath;
    v19->_albumByAlbumPath = v59;

    long long v61 = (NSMutableDictionary *)objc_alloc_init(*(Class *)(v31 + 2656));
    albumRequestsByAlbumId = v19->_albumRequestsByAlbumId;
    v19->_albumRequestsByAlbumId = v61;

    id v63 = (NSMutableDictionary *)objc_alloc_init(*(Class *)(v31 + 2656));
    folderRequestByFolderId = v19->_folderRequestByFolderId;
    v19->_folderRequestByFolderId = v63;

    v19->_importBatchSize = 1;
  }

  return v19;
}

+ (void)dumpMetadataForData:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = CGImageSourceCreateWithData((CFDataRef)a3, 0);
  CFDictionaryRef v4 = CGImageSourceCopyPropertiesAtIndex(v3, 0, 0);
  uint64_t v5 = PLImportGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    CFDictionaryRef v7 = v4;
    _os_log_impl(&dword_19B043000, v5, OS_LOG_TYPE_INFO, "properties %@", (uint8_t *)&v6, 0xCu);
  }

  CFRelease(v3);
}

+ (void)dumpImageData:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  uint64_t v13 = *MEMORY[0x1E4F2FF48];
  uint64_t v3 = v13;
  uint64_t v4 = MEMORY[0x1E4F1CC38];
  v14[0] = MEMORY[0x1E4F1CC38];
  uint64_t v5 = (void *)MEMORY[0x1E4F1C9E8];
  CFDataRef v6 = (const __CFData *)a3;
  CFDictionaryRef v7 = [v5 dictionaryWithObjects:v14 forKeys:&v13 count:1];
  uint64_t v8 = CGImageSourceCreateWithData(v6, v7);

  uint64_t v11 = v3;
  uint64_t v12 = v4;
  CFDictionaryRef v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  CGImageRef ImageAtIndex = CGImageSourceCreateImageAtIndex(v8, 0, v9);

  if (ImageAtIndex) {
    CFAutorelease(ImageAtIndex);
  }
  CFRelease(v8);
  CGImageWriteToFile();
}

+ (id)removeItemAtPath:(id)a3 type:(unint64_t)a4 recursive:(BOOL)a5
{
  v39[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v33 = 0;
  CFDictionaryRef v9 = [v8 attributesOfItemAtPath:v7 error:&v33];
  id v10 = v33;
  if (!v9) {
    goto LABEL_21;
  }
  uint64_t v11 = [v9 fileType];
  uint64_t v12 = v11;
  if (a4 || v11 != (void *)*MEMORY[0x1E4F283C8])
  {
    uint64_t v13 = [v9 fileType];

    if (a4 != 1 || v13 != (void *)*MEMORY[0x1E4F283C0])
    {
      uint64_t v24 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v25 = *MEMORY[0x1E4F28568];
      v34[0] = *MEMORY[0x1E4F28328];
      v34[1] = v25;
      v35[0] = v7;
      id v26 = @"file";
      if (a4) {
        id v26 = @"folder";
      }
      id v27 = [NSString stringWithFormat:@"Attempting to delete '%@' as a %@", v7, v26];
      v35[1] = v27;
      dispatch_queue_t v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:2];
      uint64_t v29 = [v24 errorWithDomain:@"com.apple.PHImport" code:2 userInfo:v28];

      id v10 = (id)v29;
      goto LABEL_21;
    }
  }
  else
  {

    uint64_t v13 = (void *)*MEMORY[0x1E4F283C0];
  }
  id v14 = [v9 fileType];

  if (v14 == v13)
  {
    id v15 = [v8 enumeratorAtPath:v7];
    if (!v15)
    {
      id v16 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v17 = *MEMORY[0x1E4F28568];
      v38[0] = *MEMORY[0x1E4F28328];
      v38[1] = v17;
      v39[0] = v7;
      v39[1] = @"Can't get a directory enumerator";
      BOOL v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:2];
      uint64_t v19 = [v16 errorWithDomain:@"com.apple.PHImport" code:1 userInfo:v18];

      id v10 = (id)v19;
    }
    if (!v10)
    {
      id v20 = [v15 nextObject];

      if (v20)
      {
        if (!a5)
        {
          unint64_t v21 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v22 = *MEMORY[0x1E4F28568];
          v36[0] = *MEMORY[0x1E4F28328];
          v36[1] = v22;
          v37[0] = v7;
          v37[1] = @"Directory is not empty";
          id v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:2];
          id v10 = [v21 errorWithDomain:@"com.apple.PHImport" code:2 userInfo:v23];
        }
      }
    }

    if (!v10) {
      goto LABEL_17;
    }
  }
  else if (!v10)
  {
LABEL_17:
    id v32 = 0;
    [v8 removeItemAtPath:v7 error:&v32];
    id v10 = v32;
  }
LABEL_21:
  id v30 = v10;

  return v30;
}

+ (void)importAssets:(id)a3 fromImportSource:(id)a4 intoLibrary:(id)a5 withOptions:(id)a6 progress:(id *)a7 delegate:(id)a8 atEnd:(id)a9
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v27 = a6;
  id v17 = a8;
  id v18 = a9;
  uint64_t v19 = PLImportGetLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v35 = objc_opt_class();
    __int16 v36 = 2048;
    id v37 = v15;
    _os_log_impl(&dword_19B043000, v19, OS_LOG_TYPE_DEFAULT, "Importing assets from %{public}@ <%p>", buf, 0x16u);
  }

  if ([v14 count])
  {
    id v20 = [[PHImporter alloc] initWithLibrary:v16 options:v27 source:v15 delegate:v17 completionHandler:v18];
    if (a7)
    {
      if (*a7)
      {
        id v21 = *a7;
        objc_msgSend(v21, "setTotalUnitCount:", objc_msgSend(v14, "count"));
      }
      else
      {
        objc_msgSend(MEMORY[0x1E4F28F90], "discreteProgressWithTotalUnitCount:", objc_msgSend(v14, "count"));
        id v21 = objc_claimAutoreleasedReturnValue();
        *a7 = v21;
      }
    }
    else
    {
      id v21 = 0;
    }
    [v21 setCancellable:1];
    objc_initWeak((id *)buf, v20);
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __92__PHImporter_importAssets_fromImportSource_intoLibrary_withOptions_progress_delegate_atEnd___block_invoke;
    v32[3] = &unk_1E58479D0;
    objc_copyWeak(&v33, (id *)buf);
    [v21 setCancellationHandler:v32];
    id v25 = v16;
    [(PHImporter *)v20 setProgress:v21];
    importQueue = v20->_importQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __92__PHImporter_importAssets_fromImportSource_intoLibrary_withOptions_progress_delegate_atEnd___block_invoke_2;
    block[3] = &unk_1E58487E0;
    uint64_t v29 = v20;
    id v30 = v14;
    id v31 = v18;
    uint64_t v24 = v20;
    dispatch_async(importQueue, block);

    id v16 = v25;
    objc_destroyWeak(&v33);
    objc_destroyWeak((id *)buf);

LABEL_14:
    goto LABEL_15;
  }
  if (v18)
  {
    uint64_t v22 = PLImportGetLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      id v23 = [v15 name];
      *(_DWORD *)buf = 138543362;
      uint64_t v35 = (uint64_t)v23;
      _os_log_impl(&dword_19B043000, v22, OS_LOG_TYPE_INFO, "Nothing to import from '%{public}@'", buf, 0xCu);
    }
    uint64_t v24 = objc_alloc_init(PHImportResults);
    (*((void (**)(id, PHImportResults *))v18 + 2))(v18, v24);
    goto LABEL_14;
  }
LABEL_15:
}

void __92__PHImporter_importAssets_fromImportSource_intoLibrary_withOptions_progress_delegate_atEnd___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained cancellationHandler];
}

void __92__PHImporter_importAssets_fromImportSource_intoLibrary_withOptions_progress_delegate_atEnd___block_invoke_2(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) beginImport:*(void *)(a1 + 40)];
  uint64_t v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __92__PHImporter_importAssets_fromImportSource_intoLibrary_withOptions_progress_delegate_atEnd___block_invoke_3;
  v5[3] = &unk_1E5845950;
  id v6 = v3;
  id v7 = v2;
  id v8 = *(id *)(a1 + 48);
  id v4 = v2;
  [v6 ensureEnoughDiskSpaceAvailableIfNeededForAssets:v4 completion:v5];
}

void __92__PHImporter_importAssets_fromImportSource_intoLibrary_withOptions_progress_delegate_atEnd___block_invoke_3(uint64_t a1, int a2)
{
  if (a2)
  {
    int v2 = *(void **)(a1 + 32);
    id v4 = [*(id *)(a1 + 40) objectEnumerator];
    objc_msgSend(v2, "importNextAsset:");
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 48);
    id v4 = [*(id *)(a1 + 32) results];
    (*(void (**)(uint64_t))(v3 + 16))(v3);
  }
}

@end