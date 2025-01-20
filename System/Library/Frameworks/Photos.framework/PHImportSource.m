@interface PHImportSource
- (BOOL)_addSidecarAsset:(id)a3 toAsset:(id)a4;
- (BOOL)_pairDatSidecar:(id)a3 withMediaAssetIfHasAdjustments:(id)a4 orAaeInProcessedAssets:(id)a5;
- (BOOL)batchComplete;
- (BOOL)canAutolaunch;
- (BOOL)canDeleteContent;
- (BOOL)canEject;
- (BOOL)canReference;
- (BOOL)canShowProgress;
- (BOOL)confirmAsset:(id)a3 isBaseOf:(id)a4;
- (BOOL)confirmAsset:(id)a3 isRenderOf:(id)a4;
- (BOOL)confirmAsset:(id)a3 isSidecarOfAsset:(id)a4;
- (BOOL)confirmAsset:(id)a3 isSocOf:(id)a4;
- (BOOL)containsSupportedMediaWithImportExceptions:(id *)a3;
- (BOOL)date:(id)a3 matchesDate:(id)a4;
- (BOOL)deleteContentAllowed;
- (BOOL)isAppleDevice;
- (BOOL)isAvailable;
- (BOOL)isCamera;
- (BOOL)isConnectedDevice;
- (BOOL)isDone;
- (BOOL)isEjecting;
- (BOOL)isLibrary;
- (BOOL)isLivePhotoForImportIdentifier:(id)a3;
- (BOOL)isOptimizedCPLStorage;
- (BOOL)isPairedSidecar:(id)a3;
- (BOOL)open;
- (BOOL)processPotentialJpegAsset:(id)a3 plusRawAsset:(id)a4;
- (BOOL)rampBatchInterval;
- (BOOL)stalled;
- (CGImage)icon;
- (NSDateFormatter)dupeDateFormatter;
- (NSMutableArray)assets;
- (NSMutableArray)duplicateAssets;
- (NSMutableArray)errors;
- (NSMutableArray)items;
- (NSMutableArray)processed;
- (NSMutableArray)removedSourceFileIdentifiers;
- (NSMutableDictionary)importIdentifierToLivePhotoStateMap;
- (NSMutableDictionary)pairedSidecarsByImportIdentifier;
- (NSMutableSet)folders;
- (NSProgress)progress;
- (NSString)iconSymbolName;
- (NSString)name;
- (NSString)path;
- (NSString)prefix;
- (NSString)productKind;
- (NSString)uuid;
- (NSString)volumePath;
- (NSURL)autolaunchApplicationURL;
- (OS_dispatch_queue)batchQueue;
- (OS_dispatch_queue)controlQueue;
- (OS_dispatch_queue)dupPathCollectionQueue;
- (OS_dispatch_queue)itemProcessingQueue;
- (OS_dispatch_queue)itemQueue;
- (OS_dispatch_queue)processingQueue;
- (PFTimeZoneLookup)timeZoneLookup;
- (PHImportOptions)options;
- (PHImportSource)init;
- (PHPhotoLibrary)library;
- (double)batchInterval;
- (double)batchStart;
- (id)_adjustmentDataAssetFromAssets:(id)a3;
- (id)_adjustmentSecondaryDataAssetFromAssets:(id)a3;
- (id)_findDatAssetInProcessedAssets:(id)a3 toPairWithMediaAsset:(id)a4 ifAssetIsAdjustment:(id)a5;
- (id)assetsByProcessingItem:(id)a3;
- (id)assetsDescription;
- (id)completion;
- (id)deleteImportAssets:(id)a3 isConfirmed:(BOOL)a4 atEnd:(id)a5;
- (id)deleteImportAssets:(id)a3 isConfirmed:(BOOL)a4 isCancelable:(BOOL)a5 atEnd:(id)a6;
- (id)description;
- (id)loadAssetsForLibrary:(id)a3 allowDuplicates:(BOOL)a4 order:(int64_t)a5 atEnd:(id)a6;
- (id)loadAssetsForLibrary:(id)a3 allowDuplicates:(BOOL)a4 order:(int64_t)a5 batchInterval:(double)a6 atEnd:(id)a7;
- (id)loadAssetsForLibrary:(id)a3 allowDuplicates:(BOOL)a4 order:(int64_t)a5 batchSize:(unint64_t)a6 atEnd:(id)a7;
- (id)loadAssetsForLibrary:(id)a3 allowDuplicates:(BOOL)a4 order:(int64_t)a5 batchSize:(unint64_t)a6 batchInterval:(double)a7 atEnd:(id)a8;
- (id)nextItem;
- (id)processAssets:(id)a3;
- (id)requestDeleteAssetsForRecords:(id)a3;
- (int64_t)assetLoadOrder;
- (unint64_t)batchCount;
- (unint64_t)batchSize;
- (unint64_t)completedItems;
- (unint64_t)currentItemIndex;
- (unint64_t)nextItemIndex;
- (unsigned)sourceAccessState;
- (void)accessItems:(id)a3;
- (void)addImportSourceObserver:(id)a3;
- (void)addItems:(id)a3;
- (void)addPairedSidecar:(id)a3;
- (void)addRepresentationsForAsset:(id)a3;
- (void)addSourceFileIdentifiersForRemovedFiles:(id)a3;
- (void)beginProcessingWithCompletion:(id)a3;
- (void)beginWork;
- (void)dispatchAssetDataRequestAsync:(id)a3 usingBlock:(id)a4;
- (void)endBatch;
- (void)endWork;
- (void)findDuplicatesOfItems:(id)a3 considerItemsInTheTrash:(BOOL)a4;
- (void)loadSidecarsFor:(id)a3;
- (void)notifyObserversUsingBlock:(id)a3;
- (void)pauseAssetLoading;
- (void)processNextItems;
- (void)processRepresentation:(id)a3;
- (void)processResource:(id)a3;
- (void)removeAssets:(id)a3;
- (void)removeImportSourceObserver:(id)a3;
- (void)resumeAssetLoading;
- (void)setAssetLoadOrder:(int64_t)a3;
- (void)setAssets:(id)a3;
- (void)setAutolaunchApplicationURL:(id)a3;
- (void)setBatchCount:(unint64_t)a3;
- (void)setBatchInterval:(double)a3;
- (void)setBatchQueue:(id)a3;
- (void)setBatchSize:(unint64_t)a3;
- (void)setBatchStart:(double)a3;
- (void)setCompletedItems:(unint64_t)a3;
- (void)setCompletion:(id)a3;
- (void)setControlQueue:(id)a3;
- (void)setCurrentItemIndex:(unint64_t)a3;
- (void)setDeleteContentAllowed:(BOOL)a3;
- (void)setDupPathCollectionQueue:(id)a3;
- (void)setDupeDateFormatter:(id)a3;
- (void)setDuplicateAssets:(id)a3;
- (void)setErrors:(id)a3;
- (void)setFolders:(id)a3;
- (void)setImportIdentifierToLivePhotoStateMap:(id)a3;
- (void)setIsLivePhotoForImportIdentifier:(id)a3;
- (void)setItemProcessingQueue:(id)a3;
- (void)setItemQueue:(id)a3;
- (void)setItems:(id)a3;
- (void)setNextItemIndex:(unint64_t)a3;
- (void)setOpen:(BOOL)a3;
- (void)setOptions:(id)a3;
- (void)setPairedSidecarsByImportIdentifier:(id)a3;
- (void)setPrefix:(id)a3;
- (void)setProcessed:(id)a3;
- (void)setProcessingQueue:(id)a3;
- (void)setProgress:(id)a3;
- (void)setRampBatchInterval:(BOOL)a3;
- (void)setSourceAccessState:(unsigned __int8)a3;
- (void)setUuid:(id)a3;
- (void)stopAssetLoading;
@end

@implementation PHImportSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeZoneLookup, 0);
  objc_storeStrong((id *)&self->_pairedSidecarsByImportIdentifier, 0);
  objc_storeStrong((id *)&self->_prefix, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_errors, 0);
  objc_storeStrong((id *)&self->_folders, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_importIdentifierToLivePhotoStateMap, 0);
  objc_storeStrong((id *)&self->_processed, 0);
  objc_storeStrong((id *)&self->_dupeDateFormatter, 0);
  objc_storeStrong((id *)&self->_removedSourceFileIdentifiers, 0);
  objc_storeStrong((id *)&self->_itemProcessingQueue, 0);
  objc_storeStrong((id *)&self->_processingQueue, 0);
  objc_storeStrong((id *)&self->_duplicateAssets, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_dupPathCollectionQueue, 0);
  objc_storeStrong((id *)&self->_batchQueue, 0);
  objc_storeStrong((id *)&self->_itemQueue, 0);
  objc_storeStrong((id *)&self->_controlQueue, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_autolaunchApplicationURL, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_audioByImportIdentifier, 0);
  objc_storeStrong((id *)&self->_representationsByImportIdentifier, 0);

  objc_storeStrong((id *)&self->_assetsByImportIdentifier, 0);
}

- (PFTimeZoneLookup)timeZoneLookup
{
  return (PFTimeZoneLookup *)objc_getProperty(self, a2, 320, 1);
}

- (void)setPairedSidecarsByImportIdentifier:(id)a3
{
}

- (NSMutableDictionary)pairedSidecarsByImportIdentifier
{
  return self->_pairedSidecarsByImportIdentifier;
}

- (void)setPrefix:(id)a3
{
}

- (NSString)prefix
{
  return self->_prefix;
}

- (void)setAssetLoadOrder:(int64_t)a3
{
  self->_assetLoadOrder = a3;
}

- (int64_t)assetLoadOrder
{
  return self->_assetLoadOrder;
}

- (void)setProgress:(id)a3
{
}

- (NSProgress)progress
{
  return self->_progress;
}

- (void)setAssets:(id)a3
{
}

- (NSMutableArray)assets
{
  return self->_assets;
}

- (void)setOptions:(id)a3
{
}

- (PHImportOptions)options
{
  return self->_options;
}

- (void)setDeleteContentAllowed:(BOOL)a3
{
  self->_deleteContentAllowed = a3;
}

- (BOOL)deleteContentAllowed
{
  return self->_deleteContentAllowed;
}

- (BOOL)canShowProgress
{
  return self->_canShowProgress;
}

- (void)setOpen:(BOOL)a3
{
  self->_open = a3;
}

- (BOOL)open
{
  return self->_open;
}

- (void)setErrors:(id)a3
{
}

- (NSMutableArray)errors
{
  return (NSMutableArray *)objc_getProperty(self, a2, 264, 1);
}

- (void)setFolders:(id)a3
{
}

- (NSMutableSet)folders
{
  return self->_folders;
}

- (void)setItems:(id)a3
{
}

- (NSMutableArray)items
{
  return self->_items;
}

- (void)setBatchInterval:(double)a3
{
  self->_batchInterval = a3;
}

- (double)batchInterval
{
  return self->_batchInterval;
}

- (void)setBatchSize:(unint64_t)a3
{
  self->_batchSize = a3;
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (void)setImportIdentifierToLivePhotoStateMap:(id)a3
{
}

- (NSMutableDictionary)importIdentifierToLivePhotoStateMap
{
  return self->_importIdentifierToLivePhotoStateMap;
}

- (void)setRampBatchInterval:(BOOL)a3
{
  self->_rampBatchInterval = a3;
}

- (BOOL)rampBatchInterval
{
  return self->_rampBatchInterval;
}

- (void)setBatchCount:(unint64_t)a3
{
  self->_batchCount = a3;
}

- (unint64_t)batchCount
{
  return self->_batchCount;
}

- (void)setBatchStart:(double)a3
{
  self->_batchStart = a3;
}

- (double)batchStart
{
  return self->_batchStart;
}

- (void)setProcessed:(id)a3
{
}

- (NSMutableArray)processed
{
  return self->_processed;
}

- (void)setDupeDateFormatter:(id)a3
{
}

- (NSDateFormatter)dupeDateFormatter
{
  return self->_dupeDateFormatter;
}

- (NSMutableArray)removedSourceFileIdentifiers
{
  return self->_removedSourceFileIdentifiers;
}

- (void)setItemProcessingQueue:(id)a3
{
}

- (OS_dispatch_queue)itemProcessingQueue
{
  return self->_itemProcessingQueue;
}

- (void)setProcessingQueue:(id)a3
{
}

- (OS_dispatch_queue)processingQueue
{
  return self->_processingQueue;
}

- (void)setDuplicateAssets:(id)a3
{
}

- (NSMutableArray)duplicateAssets
{
  return self->_duplicateAssets;
}

- (void)setCompletion:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setDupPathCollectionQueue:(id)a3
{
}

- (OS_dispatch_queue)dupPathCollectionQueue
{
  return self->_dupPathCollectionQueue;
}

- (void)setBatchQueue:(id)a3
{
}

- (OS_dispatch_queue)batchQueue
{
  return self->_batchQueue;
}

- (void)setItemQueue:(id)a3
{
}

- (OS_dispatch_queue)itemQueue
{
  return self->_itemQueue;
}

- (void)setControlQueue:(id)a3
{
}

- (OS_dispatch_queue)controlQueue
{
  return self->_controlQueue;
}

- (void)setCompletedItems:(unint64_t)a3
{
  self->_completedItems = a3;
}

- (unint64_t)completedItems
{
  return self->_completedItems;
}

- (void)setNextItemIndex:(unint64_t)a3
{
  self->_nextItemIndex = a3;
}

- (unint64_t)nextItemIndex
{
  return self->_nextItemIndex;
}

- (void)setCurrentItemIndex:(unint64_t)a3
{
  self->_currentItemIndex = a3;
}

- (unint64_t)currentItemIndex
{
  return self->_currentItemIndex;
}

- (PHPhotoLibrary)library
{
  return self->_library;
}

- (void)setAutolaunchApplicationURL:(id)a3
{
}

- (NSURL)autolaunchApplicationURL
{
  return self->_autolaunchApplicationURL;
}

- (void)setSourceAccessState:(unsigned __int8)a3
{
  self->_sourceAccessState = a3;
}

- (unsigned)sourceAccessState
{
  return self->_sourceAccessState;
}

- (BOOL)canAutolaunch
{
  return self->_canAutolaunch;
}

- (BOOL)isEjecting
{
  return self->_ejecting;
}

- (void)setUuid:(id)a3
{
}

- (NSString)uuid
{
  return self->_uuid;
}

- (id)assetsDescription
{
  v2 = self;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  v3 = [(PHImportSource *)self assets];
  uint64_t v4 = [(__CFString *)v3 countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (!v4)
  {
    v20 = &stru_1EEAC1950;
LABEL_27:

    v3 = v20;
    goto LABEL_28;
  }
  uint64_t v5 = v4;
  v25 = v2;
  uint64_t v26 = 0;
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  uint64_t v33 = 0;
  uint64_t v34 = 0;
  uint64_t v29 = 0;
  uint64_t v30 = 0;
  uint64_t v27 = 0;
  uint64_t v28 = 0;
  uint64_t v31 = 0;
  uint64_t v32 = 0;
  uint64_t v35 = 0;
  obj = v3;
  uint64_t v8 = 0;
  uint64_t v9 = *(void *)v38;
  do
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v38 != v9) {
        objc_enumerationMutation(obj);
      }
      v11 = *(void **)(*((void *)&v37 + 1) + 8 * i);
      v12 = [v11 sidecarAssets];
      uint64_t v13 = [v12 count];

      v14 = [v11 largeRender];
      uint64_t v15 = v14 != 0;

      unsigned int v16 = [v11 hasAudioAttachment];
      if ([v11 isMovie])
      {
        ++v8;
        v6 += v13;
        v7 += v15;
      }
      else if (([v11 isAudio] & 1) == 0)
      {
        if ([v11 isRAW])
        {
          ++v33;
          v30 += v13;
          v29 += v15;
          v28 += v16;
        }
        else
        {
          v32 += v13;
          ++v34;
          v35 += v15;
          v31 += v16;
          if ([v11 isJpegPlusRAW])
          {
            ++v27;
          }
          else if ([v11 isLivePhoto])
          {
            ++v26;
            v17 = [v11 videoComplement];
            v18 = [v17 largeRender];
            uint64_t v19 = v35;
            if (v18) {
              uint64_t v19 = v35 + 1;
            }
            uint64_t v35 = v19;
          }
        }
      }
    }
    uint64_t v5 = [(__CFString *)obj countByEnumeratingWithState:&v37 objects:v41 count:16];
  }
  while (v5);

  if (v8)
  {
    v3 = [&stru_1EEAC1950 stringByAppendingFormat:@"Movie:\t\t%lu (adj: %lu, render: %lu)\n", v8, v6, v7];
  }
  else
  {
    v3 = &stru_1EEAC1950;
  }
  v2 = v25;
  if (v33)
  {
    uint64_t v21 = [(__CFString *)v3 stringByAppendingFormat:@"RAW:\t\t%lu (adj: %lu, render: %lu, audio: %lu)\n", v33, v30, v29, v28];

    v3 = (__CFString *)v21;
  }
  if (v34)
  {
    v20 = [(__CFString *)v3 stringByAppendingFormat:@"Non RAW:\t%lu (adj: %lu, render: %lu, audio: %lu, movie: %lu, raw: %lu)\n", v34, v32, v35, v31, v26, v27];
    goto LABEL_27;
  }
LABEL_28:
  v22 = [(PHImportSource *)v2 assets];
  v23 = -[__CFString stringByAppendingFormat:](v3, "stringByAppendingFormat:", @"Total:\t\t%lu\n", [v22 count]);

  return v23;
}

- (void)findDuplicatesOfItems:(id)a3 considerItemsInTheTrash:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = __Block_byref_object_copy__40842;
  v9[4] = __Block_byref_object_dispose__40843;
  id v10 = 0;
  uint64_t v7 = [[PHImportDuplicateChecker alloc] initWithLibrary:self->_library];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__PHImportSource_findDuplicatesOfItems_considerItemsInTheTrash___block_invoke;
  v8[3] = &unk_1E5847A20;
  v8[4] = v9;
  [(PHImportDuplicateChecker *)v7 findDuplicatesOfItems:v6 considerItemsInTrash:v4 forEach:0 atEnd:v8];

  _Block_object_dispose(v9, 8);
}

void __64__PHImportSource_findDuplicatesOfItems_considerItemsInTheTrash___block_invoke(uint64_t a1, void *a2)
{
}

- (void)loadSidecarsFor:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    folders = self->_folders;
    uint64_t v7 = [v4 parentFolderPath];
    LOBYTE(folders) = [(NSMutableSet *)folders containsObject:v7];

    if ((folders & 1) == 0)
    {
      [v5 loadSidecarFiles];
      goto LABEL_30;
    }
    uint64_t v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    assetsByImportIdentifier = self->_assetsByImportIdentifier;
    id v10 = [v5 importIdentifier];
    v11 = [(NSMutableDictionary *)assetsByImportIdentifier objectForKeyedSubscript:v10];

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v12 = v11;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v31 objects:v37 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v32 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          if ([v17 isSidecar])
          {
            [v5 addSidecarAsset:v17];
            [v8 addObject:v17];
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v31 objects:v37 count:16];
      }
      while (v14);
    }

    if ([v8 count]) {
      [v12 removeObjectsInArray:v8];
    }
    [v8 removeAllObjects];
    representationsByImportIdentifier = self->_representationsByImportIdentifier;
    uint64_t v19 = [v5 importIdentifier];
    v20 = [(NSMutableDictionary *)representationsByImportIdentifier objectForKeyedSubscript:v19];

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v21 = v20;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v27 objects:v36 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v28;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v28 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = *(void **)(*((void *)&v27 + 1) + 8 * j);
          if (objc_msgSend(v26, "isSidecar", (void)v27))
          {
            [v5 addSidecarAsset:v26];
            [v8 addObject:v26];
          }
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v27 objects:v36 count:16];
      }
      while (v23);
    }

    if ([v8 count]) {
      [v21 removeObjectsInArray:v8];
    }
  }
  else
  {
    uint64_t v8 = PLImportGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B043000, v8, OS_LOG_TYPE_DEBUG, "asset was nil", buf, 2u);
    }
  }

LABEL_30:
}

- (BOOL)confirmAsset:(id)a3 isSidecarOfAsset:(id)a4
{
  id v5 = a4;
  BOOL v6 = [a3 isSidecar]
    && (([v5 isImage] & 1) != 0 || objc_msgSend(v5, "isMovie"));

  return v6;
}

- (BOOL)confirmAsset:(id)a3 isBaseOf:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  unint64_t v6 = (unint64_t)a3;
  unint64_t v7 = (unint64_t)a4;
  if (!(v6 | v7))
  {
    id v10 = PLImportGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 134218240;
      uint64_t v15 = 0;
      __int16 v16 = 2048;
      uint64_t v17 = 0;
      _os_log_impl(&dword_19B043000, v10, OS_LOG_TYPE_DEBUG, "must provide base (%p) and orig (%p)", (uint8_t *)&v14, 0x16u);
    }

    goto LABEL_14;
  }
  if (![(id)v6 isBase]
    || (![(id)v6 isImage]
     || ![(id)v7 isImage]
     || (int v8 = [(id)v6 isLivePhoto], v8 != objc_msgSend((id)v7, "isLivePhoto")))
    && (![(id)v6 isMovie] || !objc_msgSend((id)v7, "isMovie")))
  {
LABEL_14:
    char v11 = 0;
    goto LABEL_15;
  }
  if [(id)v7 hasAdjustments] && (objc_msgSend((id)v7, "isImage"))
  {
    uint64_t v9 = [(id)v7 largeRender];
  }
  else
  {
    uint64_t v9 = [(id)v7 largeMovieRender];
  }
  uint64_t v13 = v9;

  if (v13)
  {
    char v11 = 1;
  }
  else
  {
    [(PHImportSource *)self loadSidecarsFor:v7];
    char v11 = [(id)v7 hasAdjustments];
  }
LABEL_15:

  return v11;
}

- (BOOL)confirmAsset:(id)a3 isSocOf:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = (unint64_t)a3;
  unint64_t v6 = (unint64_t)a4;
  if (v5 | v6)
  {
    if ([(id)v5 isSpatialOverCapture]
      && ([(id)v5 isJPEG] && (objc_msgSend((id)v6, "isJPEG") & 1) != 0
       || [(id)v5 isHEIF] && (objc_msgSend((id)v6, "isHEIF") & 1) != 0
       || [(id)v5 isMovie] && objc_msgSend((id)v6, "isMovie")))
    {
      int v7 = [(id)v6 isLivePhoto];
      if (v7 == [(id)v6 isLivePhoto])
      {
        uint64_t v8 = [(id)v5 spatialOverCaptureIdentifier];
        if (v8
          && (uint64_t v9 = (void *)v8,
              [(id)v6 spatialOverCaptureIdentifier],
              id v10 = objc_claimAutoreleasedReturnValue(),
              v10,
              v9,
              v10))
        {
          char v11 = [(id)v5 spatialOverCaptureIdentifier];
          id v12 = (void *)v6;
        }
        else
        {
          [(id)v6 loadMetadataSync];
          char v11 = [(id)v6 spatialOverCaptureIdentifier];
          if (!v11)
          {
            char v14 = 0;
            goto LABEL_22;
          }
          [(id)v5 loadMetadataSync];
          id v12 = (void *)v5;
        }
        __int16 v16 = [v12 spatialOverCaptureIdentifier];
        char v14 = [v11 isEqualToString:v16];

LABEL_22:
        goto LABEL_17;
      }
    }
  }
  else
  {
    uint64_t v13 = PLImportGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      int v17 = 134218240;
      uint64_t v18 = 0;
      __int16 v19 = 2048;
      uint64_t v20 = 0;
      _os_log_impl(&dword_19B043000, v13, OS_LOG_TYPE_DEBUG, "must provide soc (%p) and orig (%p)", (uint8_t *)&v17, 0x16u);
    }
  }
  char v14 = 0;
LABEL_17:

  return v14;
}

- (BOOL)confirmAsset:(id)a3 isRenderOf:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  unint64_t v6 = (unint64_t)a3;
  unint64_t v7 = (unint64_t)a4;
  if (!(v6 | v7))
  {
    uint64_t v9 = PLImportGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      int v11 = 134218240;
      uint64_t v12 = 0;
      __int16 v13 = 2048;
      uint64_t v14 = 0;
      _os_log_impl(&dword_19B043000, v9, OS_LOG_TYPE_DEBUG, "must provide render (%p) and orig (%p)", (uint8_t *)&v11, 0x16u);
    }

    goto LABEL_13;
  }
  if (![(id)v6 isRender]
    || (![(id)v6 isImage]
     || ([(id)v7 isImage] & 1) == 0 && (objc_msgSend((id)v7, "isMovie") & 1) == 0)
    && (![(id)v6 isMovie] || !objc_msgSend((id)v7, "isMovie")))
  {
LABEL_13:
    char v8 = 0;
    goto LABEL_14;
  }
  if ([(id)v7 hasAdjustments])
  {
    char v8 = 1;
  }
  else
  {
    [(PHImportSource *)self loadSidecarsFor:v7];
    char v8 = [(id)v7 hasAdjustments];
  }
LABEL_14:

  return v8;
}

- (void)setIsLivePhotoForImportIdentifier:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    unint64_t v7 = PLImportGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B043000, v7, OS_LOG_TYPE_DEBUG, "identifier was nil", buf, 2u);
    }
    goto LABEL_23;
  }
  unint64_t v5 = [(NSMutableDictionary *)self->_importIdentifierToLivePhotoStateMap objectForKeyedSubscript:v4];
  char v6 = [v5 BOOLValue];

  if ((v6 & 1) == 0)
  {
    [(NSMutableDictionary *)self->_importIdentifierToLivePhotoStateMap setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v4];
    unint64_t v7 = [(NSMutableDictionary *)self->_representationsByImportIdentifier objectForKeyedSubscript:v4];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v33 count:16];
    if (!v8)
    {
      int v11 = 0;
      id v10 = 0;
      goto LABEL_22;
    }
    uint64_t v9 = v8;
    id v10 = 0;
    int v11 = 0;
    uint64_t v12 = *(void *)v25;
    while (1)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(v7);
        }
        uint64_t v14 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if ([v14 resourceType] == 8)
        {
          uint64_t v15 = v11;
          __int16 v16 = v10;
          int v11 = v14;
        }
        else
        {
          uint64_t v15 = v10;
          __int16 v16 = v14;
          if ([v14 resourceType] != 12) {
            continue;
          }
        }
        id v17 = v14;

        id v10 = v16;
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v24 objects:v33 count:16];
      if (!v9)
      {
        if (v11 && v10)
        {
          [v11 takeAsVideoComplement:v10];
          uint64_t v18 = PLImportGetLog();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            __int16 v19 = [v10 redactedFileNameDescription];
            uint64_t v20 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v10, "resourceType"));
            long long v28 = v20;
            uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
            uint64_t v22 = PHDescriptionsForResourceTypes(v21);
            uint64_t v23 = [v22 componentsJoinedByString:@","];
            *(_DWORD *)buf = 138412546;
            long long v30 = v19;
            __int16 v31 = 2112;
            long long v32 = v23;
            _os_log_impl(&dword_19B043000, v18, OS_LOG_TYPE_DEBUG, "REMOVING: %@ (%@) as a processed representation", buf, 0x16u);
          }
          [v7 removeObject:v10];
        }
LABEL_22:

LABEL_23:
        break;
      }
    }
  }
}

- (BOOL)processPotentialJpegAsset:(id)a3 plusRawAsset:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 creationDate];
  uint64_t v9 = [v7 creationDate];
  BOOL v10 = [(PHImportSource *)self date:v8 matchesDate:v9];

  if (v10) {
    goto LABEL_4;
  }
  int v11 = [v6 fileCreationDate];
  uint64_t v12 = [v7 fileCreationDate];
  BOOL v13 = [(PHImportSource *)self date:v11 matchesDate:v12];

  if (v13) {
    goto LABEL_4;
  }
  [v6 loadMetadataSync];
  [v7 loadMetadataSync];
  uint64_t v14 = [v6 creationDate];
  uint64_t v15 = [v7 creationDate];
  BOOL v16 = [(PHImportSource *)self date:v14 matchesDate:v15];

  if (v16)
  {
LABEL_4:
    id v17 = PLImportGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v18 = [v7 redactedFileNameDescription];
      __int16 v19 = [v6 redactedFileNameDescription];
      int v29 = 138412546;
      long long v30 = v18;
      __int16 v31 = 2112;
      long long v32 = v19;
      _os_log_impl(&dword_19B043000, v17, OS_LOG_TYPE_DEBUG, "PAIRING: setting %@ as RAW of %@", (uint8_t *)&v29, 0x16u);
    }
    [v6 setRawAsset:v7];
    uint64_t v20 = [v6 largeRender];

    if (!v20)
    {
      uint64_t v21 = [v7 largeRender];
      [v6 setLargeRender:v21];

      [v7 setLargeRender:0];
    }
    uint64_t v22 = [v6 base];

    if (!v22)
    {
      uint64_t v23 = [v7 base];
      [v6 setBase:v23];

      [v7 setBase:0];
    }
    long long v24 = [v6 audioAsset];

    if (!v24)
    {
      long long v25 = [v7 audioAsset];
      [v6 setAudioAsset:v25];

      [v7 setAudioAsset:0];
    }
    long long v26 = [v6 sidecarAssetsByType];

    if (!v26)
    {
      long long v27 = [v7 sidecarAssetsByType];
      [v6 setSidecarAssetsByType:v27];

      [v7 setSidecarAssetsByType:0];
    }
    LOBYTE(v16) = 1;
  }

  return v16;
}

- (BOOL)batchComplete
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_processingQueue);
  unint64_t v3 = self->_batchCount + 1;
  self->_unint64_t batchCount = v3;
  unint64_t batchSize = self->_batchSize;
  if (batchSize)
  {
    if (v3 >= batchSize)
    {
      unint64_t v5 = PLImportGetLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        unint64_t batchCount = self->_batchCount;
        unint64_t v7 = self->_batchSize;
        int v16 = 134218240;
        double v17 = *(double *)&batchCount;
        __int16 v18 = 2048;
        double v19 = *(double *)&v7;
        _os_log_impl(&dword_19B043000, v5, OS_LOG_TYPE_DEBUG, "END BATCH: batch count (%lu) >= batch size (%lu)", (uint8_t *)&v16, 0x16u);
      }

LABEL_6:
      self->_unint64_t batchCount = 0;
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      self->_batchStart = v8;
      return 1;
    }
  }
  else
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v11 = v10 - self->_batchStart;
    if (v11 >= self->_batchInterval)
    {
      uint64_t v12 = PLImportGetLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        double batchInterval = self->_batchInterval;
        int v16 = 134218240;
        double v17 = v11;
        __int16 v18 = 2048;
        double v19 = batchInterval;
        _os_log_impl(&dword_19B043000, v12, OS_LOG_TYPE_DEBUG, "Batch duration: %g, Batch Interval: %g", (uint8_t *)&v16, 0x16u);
      }

      if (self->_rampBatchInterval)
      {
        double v14 = self->_batchInterval;
        if (v14 < 1.0)
        {
          double v15 = v14 * 1.5;
          self->_double batchInterval = v15;
          if (v15 > 1.0) {
            self->_double batchInterval = 1.0;
          }
        }
      }
      goto LABEL_6;
    }
  }
  return 0;
}

- (BOOL)date:(id)a3 matchesDate:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unint64_t v7 = [v6 dateByAddingTimeInterval:-30.0];
  double v8 = [v6 dateByAddingTimeInterval:30.0];

  BOOL v9 = ([v5 compare:v7] == 1 || !objc_msgSend(v5, "compare:", v7))
    && ([v5 compare:v8] == -1 || objc_msgSend(v5, "compare:", v8) == 0);

  return v9;
}

- (id)deleteImportAssets:(id)a3 isConfirmed:(BOOL)a4 isCancelable:(BOOL)a5 atEnd:(id)a6
{
  return 0;
}

- (void)removeAssets:(id)a3
{
  id v4 = a3;
  processingQueue = self->_processingQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __31__PHImportSource_removeAssets___block_invoke;
  v7[3] = &unk_1E5848DF0;
  id v8 = v4;
  BOOL v9 = self;
  id v6 = v4;
  dispatch_async(processingQueue, v7);
}

void __31__PHImportSource_removeAssets___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v12 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v8 = [*(id *)(*(void *)(a1 + 40) + 200) indexOfObject:v7];
        uint64_t v9 = *(void *)(a1 + 40);
        if (v8 == 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v10 = [*(id *)(v9 + 280) indexOfObject:v7];
          if (v10 != 0x7FFFFFFFFFFFFFFFLL)
          {
            [*(id *)(*(void *)(a1 + 40) + 280) removeObjectAtIndex:v10];
            [v12 addObject:v7];
          }
        }
        else
        {
          [*(id *)(v9 + 200) removeObjectAtIndex:v8];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v4);
  }

  if ([v12 count])
  {
    double v11 = *(void **)(a1 + 40);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __31__PHImportSource_removeAssets___block_invoke_2;
    v13[3] = &unk_1E58479F8;
    v13[4] = v11;
    id v14 = v12;
    [v11 notifyObserversUsingBlock:v13];
  }
}

uint64_t __31__PHImportSource_removeAssets___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 importSource:*(void *)(a1 + 32) didRemoveAssets:*(void *)(a1 + 40)];
}

- (void)addSourceFileIdentifiersForRemovedFiles:(id)a3
{
  id v4 = a3;
  processingQueue = self->_processingQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__PHImportSource_addSourceFileIdentifiersForRemovedFiles___block_invoke;
  v7[3] = &unk_1E5848DF0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(processingQueue, v7);
}

void __58__PHImportSource_addSourceFileIdentifiersForRemovedFiles___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) removedSourceFileIdentifiers];
  [v2 addObjectsFromArray:*(void *)(a1 + 40)];
}

- (void)addItems:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __27__PHImportSource_addItems___block_invoke;
  v6[3] = &unk_1E5848318;
  id v8 = &v9;
  v6[4] = self;
  id v5 = v4;
  id v7 = v5;
  [(PHImportSource *)self accessItems:v6];
  if (*((unsigned char *)v10 + 24)) {
    [(PHImportSource *)self processNextItems];
  }

  _Block_object_dispose(&v9, 8);
}

void __27__PHImportSource_addItems___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(*(void *)(a1 + 32) + 248) count] == 0;
  [*(id *)(*(void *)(a1 + 32) + 248) addObjectsFromArray:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 32) progress];
  objc_msgSend(v2, "setTotalUnitCount:", objc_msgSend(v2, "totalUnitCount") + objc_msgSend(*(id *)(a1 + 40), "count"));
}

- (BOOL)stalled
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __25__PHImportSource_stalled__block_invoke;
  v4[3] = &unk_1E5848D28;
  v4[4] = self;
  v4[5] = &v5;
  [(PHImportSource *)self accessItems:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __25__PHImportSource_stalled__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 248) count];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result == 0;
  return result;
}

- (BOOL)isDone
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __24__PHImportSource_isDone__block_invoke;
  v4[3] = &unk_1E5848D28;
  v4[4] = self;
  v4[5] = &v5;
  [(PHImportSource *)self accessItems:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __24__PHImportSource_isDone__block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v2 = *(void *)(result + 32);
  if (*(unsigned char *)(v2 + 68))
  {
    BOOL v3 = 0;
  }
  else
  {
    uint64_t result = [*(id *)(v2 + 248) count];
    BOOL v3 = result == 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(v1 + 40) + 8) + 24) = v3;
  return result;
}

- (id)nextItem
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  char v8 = __Block_byref_object_copy__40842;
  uint64_t v9 = __Block_byref_object_dispose__40843;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __26__PHImportSource_nextItem__block_invoke;
  v4[3] = &unk_1E5848D28;
  v4[4] = self;
  v4[5] = &v5;
  [(PHImportSource *)self accessItems:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __26__PHImportSource_nextItem__block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 248) count])
  {
    uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 248) objectAtIndexedSubscript:0];
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;

    uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 248);
    [v5 removeObjectAtIndex:0];
  }
  else
  {
    id v6 = PLImportGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_19B043000, v6, OS_LOG_TYPE_DEBUG, "Nothing to process", v7, 2u);
    }
  }
}

- (void)accessItems:(id)a3
{
  p_itemsLock = &self->_itemsLock;
  id v4 = (void (**)(void))a3;
  os_unfair_lock_lock(p_itemsLock);
  v4[2](v4);

  os_unfair_lock_unlock(p_itemsLock);
}

- (BOOL)isLivePhotoForImportIdentifier:(id)a3
{
  if (a3)
  {
    uint64_t v3 = -[NSMutableDictionary objectForKeyedSubscript:](self->_importIdentifierToLivePhotoStateMap, "objectForKeyedSubscript:");
    char v4 = [v3 BOOLValue];

    return v4;
  }
  else
  {
    id v6 = PLImportGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_19B043000, v6, OS_LOG_TYPE_DEBUG, "identifier was nil", v7, 2u);
    }

    return 0;
  }
}

- (void)addRepresentationsForAsset:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  char v4 = v3;
  if (v3)
  {
    if ([v3 resourceType] == 1 || objc_msgSend(v4, "resourceType") == 2)
    {
      representationsByImportIdentifier = self->_representationsByImportIdentifier;
      id v6 = [v4 importIdentifier];
      uint64_t v7 = [(NSMutableDictionary *)representationsByImportIdentifier objectForKeyedSubscript:v6];

      long long v27 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
      long long v37 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      obuint64_t j = v7;
      uint64_t v36 = [obj countByEnumeratingWithState:&v37 objects:v52 count:16];
      if (v36)
      {
        uint64_t v35 = *(void *)v38;
        *(void *)&long long v8 = 138412546;
        long long v26 = v8;
        do
        {
          for (uint64_t i = 0; i != v36; ++i)
          {
            if (*(void *)v38 != v35) {
              objc_enumerationMutation(obj);
            }
            id v10 = *(void **)(*((void *)&v37 + 1) + 8 * i);
            uint64_t v11 = PLImportGetLog();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
            {
              long long v30 = [v4 redactedFileNameDescription];
              uint64_t v33 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "resourceType"));
              v43 = v33;
              long long v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v43 count:1];
              __int16 v31 = PHDescriptionsForResourceTypes(v32);
              char v12 = [v31 componentsJoinedByString:@","];
              BOOL v13 = [v10 redactedFileNameDescription];
              id v14 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v10, "resourceType"));
              uint64_t v42 = v14;
              [MEMORY[0x1E4F1C978] arrayWithObjects:&v42 count:1];
              uint64_t v34 = v10;
              v16 = long long v15 = v4;
              long long v17 = PHDescriptionsForResourceTypes(v16);
              long long v18 = [v17 componentsJoinedByString:@","];
              *(_DWORD *)buf = 138413058;
              v45 = v30;
              __int16 v46 = 2112;
              v47 = v12;
              __int16 v48 = 2112;
              v49 = v13;
              __int16 v50 = 2112;
              v51 = v18;
              _os_log_impl(&dword_19B043000, v11, OS_LOG_TYPE_DEBUG, "ANALYZING asset: %@ (%@), representation: %@ (%@)", buf, 0x2Au);

              char v4 = v15;
              id v10 = v34;
            }
            switch([v10 resourceType])
            {
              case 5:
                if (([v4 resourceType] == 1 || objc_msgSend(v4, "resourceType") == 2)
                  && -[PHImportSource confirmAsset:isRenderOf:](self, "confirmAsset:isRenderOf:", v10, v4, v26))
                {
                  [v4 setLargeRender:v10];
                  goto LABEL_29;
                }
                break;
              case 6:
                if ([v4 resourceType] == 2)
                {
                  [v4 setLargeMovieRender:v10];
                  goto LABEL_29;
                }
                break;
              case 8:
                if ([v4 resourceType] == 1) {
                  goto LABEL_24;
                }
                break;
              case 12:
                if ([v4 resourceType] == 2)
                {
LABEL_24:
                  if (-[PHImportSource confirmAsset:isBaseOf:](self, "confirmAsset:isBaseOf:", v10, v4, v26))
                  {
                    [v4 setBase:v10];
                    goto LABEL_29;
                  }
                }
                break;
              case 13:
                goto LABEL_27;
              case 14:
                if ([v4 resourceType] == 2)
                {
LABEL_27:
                  if (-[PHImportSource confirmAsset:isSocOf:](self, "confirmAsset:isSocOf:", v10, v4, v26))
                  {
                    [v4 setSpatialOverCapture:v10];
LABEL_29:
                    objc_msgSend(v27, "addObject:", v10, v26);
                  }
                }
                break;
              default:
                double v19 = PLImportGetLog();
                if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
                {
                  uint64_t v20 = [v10 redactedFileNameDescription];
                  uint64_t v21 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v10, "resourceType"));
                  v41 = v21;
                  uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v41 count:1];
                  uint64_t v23 = PHDescriptionsForResourceTypes(v22);
                  long long v24 = [v23 componentsJoinedByString:@","];
                  *(_DWORD *)buf = v26;
                  v45 = v20;
                  __int16 v46 = 2112;
                  v47 = v24;
                  _os_log_impl(&dword_19B043000, v19, OS_LOG_TYPE_DEBUG, "Unexpected representation resource type for %@ (%@)", buf, 0x16u);
                }
                break;
            }
          }
          uint64_t v36 = [obj countByEnumeratingWithState:&v37 objects:v52 count:16];
        }
        while (v36);
      }

      [obj removeObjectsInArray:v27];
    }
    else
    {
      obuint64_t j = PLImportGetLog();
      if (os_log_type_enabled(obj, OS_LOG_TYPE_DEBUG))
      {
        long long v25 = [v4 redactedFileNameDescription];
        *(_DWORD *)buf = 138412290;
        v45 = v25;
        _os_log_impl(&dword_19B043000, obj, OS_LOG_TYPE_DEBUG, "'%@' is not a photo or video, not adding representations", buf, 0xCu);
      }
    }
  }
  else
  {
    obuint64_t j = PLImportGetLog();
    if (os_log_type_enabled(obj, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B043000, obj, OS_LOG_TYPE_DEBUG, "'asset' was nil", buf, 2u);
    }
  }
}

- (void)processResource:(id)a3
{
  uint64_t v121 = *MEMORY[0x1E4F143B8];
  char v4 = a3;
  if (v4)
  {
    uint64_t v5 = v4;
    id v82 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    assetsByImportIdentifier = self->_assetsByImportIdentifier;
    uint64_t v7 = [v5 importIdentifier];
    long long v8 = [(NSMutableDictionary *)assetsByImportIdentifier objectForKeyedSubscript:v7];

    long long v102 = 0u;
    long long v103 = 0u;
    long long v100 = 0u;
    long long v101 = 0u;
    obuint64_t j = v8;
    uint64_t v9 = [obj countByEnumeratingWithState:&v100 objects:v120 count:16];
    v84 = self;
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v101;
      uint64_t v83 = *(void *)v101;
      while (1)
      {
        uint64_t v12 = 0;
        uint64_t v85 = v10;
        do
        {
          if (*(void *)v101 != v11) {
            objc_enumerationMutation(obj);
          }
          BOOL v13 = *(void **)(*((void *)&v100 + 1) + 8 * v12);
          id v14 = PLImportGetLog();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            v86 = [v5 redactedFileNameDescription];
            v88 = objc_msgSend(NSNumber, "numberWithInteger:", -[NSObject resourceType](v5, "resourceType"));
            v111 = v88;
            [MEMORY[0x1E4F1C978] arrayWithObjects:&v111 count:1];
            v87 = v92 = v5;
            long long v15 = PHDescriptionsForResourceTypes(v87);
            [v15 componentsJoinedByString:@","];
            long long v16 = v90 = v12;
            long long v17 = [v13 redactedFileNameDescription];
            long long v18 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v13, "resourceType"));
            v110 = v18;
            [MEMORY[0x1E4F1C978] arrayWithObjects:&v110 count:1];
            v20 = double v19 = v13;
            uint64_t v21 = PHDescriptionsForResourceTypes(v20);
            uint64_t v22 = [v21 componentsJoinedByString:@","];
            *(_DWORD *)buf = 138413058;
            v113 = v86;
            __int16 v114 = 2112;
            v115 = v16;
            __int16 v116 = 2112;
            v117 = v17;
            __int16 v118 = 2112;
            v119 = v22;
            _os_log_impl(&dword_19B043000, v14, OS_LOG_TYPE_DEBUG, "ANALYZING asset: %@ (%@), processed: %@ (%@)", buf, 0x2Au);

            BOOL v13 = v19;
            uint64_t v11 = v83;

            self = v84;
            uint64_t v5 = v92;

            uint64_t v10 = v85;
            uint64_t v12 = v90;
          }

          uint64_t v23 = [v13 resourceType];
          if (v23 <= 15)
          {
            switch(v23)
            {
              case 1:
                uint64_t v24 = [v5 resourceType];
                if (v24 > 15)
                {
                  if ((unint64_t)(v24 - 16) < 2) {
                    goto LABEL_40;
                  }
                  if (v24 == 110) {
                    goto LABEL_36;
                  }
                }
                else
                {
                  switch(v24)
                  {
                    case 2:
                      if (![v5 isVideoComplementOf:v13]) {
                        goto LABEL_55;
                      }
                      long long v30 = [v5 importIdentifier];
                      [(PHImportSource *)self setIsLivePhotoForImportIdentifier:v30];

                      goto LABEL_53;
                    case 3:
                      __int16 v31 = [v13 audioAsset];

                      if (v31) {
                        goto LABEL_55;
                      }
                      [v13 setAudioAsset:v5];
                      goto LABEL_53;
                    case 7:
                      goto LABEL_40;
                  }
                }
                if (-[NSObject isRAW](v5, "isRAW") && [v13 isJPEG])
                {
                  if (![(PHImportSource *)self processPotentialJpegAsset:v13 plusRawAsset:v5])break; {
LABEL_53:
                  }

LABEL_54:
                  uint64_t v5 = 0;
                  break;
                }
                if ([v5 isJPEG]
                  && [v13 isRAW]
                  && [(PHImportSource *)self processPotentialJpegAsset:v5 plusRawAsset:v13])
                {
                  goto LABEL_20;
                }
                break;
              case 2:
                uint64_t v27 = [v5 resourceType];
                if (v27 <= 15)
                {
                  if (v27 != 1)
                  {
                    if (v27 != 7) {
                      break;
                    }
LABEL_40:
                    if (![(PHImportSource *)self _addSidecarAsset:v5 toAsset:v13]) {
                      break;
                    }
                    long long v28 = [(PHImportSource *)self _findDatAssetInProcessedAssets:obj toPairWithMediaAsset:v13 ifAssetIsAdjustment:v5];
                    if (v28) {
                      [v82 addObject:v28];
                    }

                    goto LABEL_54;
                  }
                  if ([v13 isVideoComplementOf:v5])
                  {
                    int v29 = [v5 importIdentifier];
                    [(PHImportSource *)self setIsLivePhotoForImportIdentifier:v29];

LABEL_20:
                    [v82 addObject:v13];
                  }
                }
                else
                {
                  if (v27 == 16 || v27 == 18) {
                    goto LABEL_40;
                  }
                  if (v27 == 110)
                  {
LABEL_36:
                    if ([(PHImportSource *)self _pairDatSidecar:v5 withMediaAssetIfHasAdjustments:v13 orAaeInProcessedAssets:obj])
                    {
                      goto LABEL_53;
                    }
                  }
                }
                break;
              case 7:
LABEL_17:
                if (([v5 resourceType] == 1
                   || [v5 resourceType] == 2)
                  && [(PHImportSource *)self _addSidecarAsset:v13 toAsset:v5])
                {
                  goto LABEL_20;
                }
                break;
              default:
LABEL_26:
                long long v25 = PLImportGetLog();
                if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
                {
                  long long v26 = [v13 redactedFileNameDescription];
                  *(_DWORD *)buf = 138412290;
                  v113 = v26;
                  _os_log_impl(&dword_19B043000, v25, OS_LOG_TYPE_DEBUG, "Unexpected asset resource type for %@", buf, 0xCu);
                }
                break;
            }
          }
          else
          {
            if ((unint64_t)(v23 - 16) < 3) {
              goto LABEL_17;
            }
            if (v23 != 110) {
              goto LABEL_26;
            }
            if ([(PHImportSource *)self _pairDatSidecar:v13 withMediaAssetIfHasAdjustments:v5 orAaeInProcessedAssets:obj])
            {
              goto LABEL_20;
            }
          }
LABEL_55:
          ++v12;
        }
        while (v10 != v12);
        uint64_t v32 = [obj countByEnumeratingWithState:&v100 objects:v120 count:16];
        uint64_t v10 = v32;
        if (!v32)
        {

          if (!v5) {
            goto LABEL_99;
          }
          goto LABEL_67;
        }
      }
    }

LABEL_67:
    if ([v5 isAudio])
    {
      audioByImportIdentifier = self->_audioByImportIdentifier;
      uint64_t v34 = [v5 importIdentifier];
      id v35 = [(NSMutableDictionary *)audioByImportIdentifier objectForKeyedSubscript:v34];

      if (!v35)
      {
        id v35 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        uint64_t v36 = self->_audioByImportIdentifier;
        long long v37 = [v5 importIdentifier];
        [(NSMutableDictionary *)v36 setObject:v35 forKeyedSubscript:v37];
      }
      long long v38 = PLImportGetLog();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
      {
        long long v39 = [v5 redactedFileNameDescription];
        long long v40 = objc_msgSend(NSNumber, "numberWithInteger:", -[NSObject resourceType](v5, "resourceType"));
        v109 = v40;
        v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v109 count:1];
        uint64_t v42 = PHDescriptionsForResourceTypes(v41);
        v43 = [v42 componentsJoinedByString:@","];
        *(_DWORD *)buf = 138412546;
        v113 = v39;
        __int16 v114 = 2112;
        v115 = v43;
        _os_log_impl(&dword_19B043000, v38, OS_LOG_TYPE_DEBUG, "ADDING: %@ (%@) as a processed asset", buf, 0x16u);
      }
      [v35 addObject:v5];
    }
    else
    {
      if ([v5 resourceType] == 1)
      {
        v44 = self->_audioByImportIdentifier;
        v45 = [v5 importIdentifier];
        __int16 v46 = [(NSMutableDictionary *)v44 objectForKeyedSubscript:v45];
        v47 = (void *)[v46 copy];

        memset(v99, 0, sizeof(v99));
        id v48 = v47;
        if ([v48 countByEnumeratingWithState:v99 objects:v108 count:16])
        {
          v49 = (void *)**((void **)&v99[0] + 1);
          [v5 setAudioAsset:**((void **)&v99[0] + 1)];
          __int16 v50 = PLImportGetLog();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
          {
            v51 = [v49 redactedFileNameDescription];
            v52 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v49, "resourceType"));
            v107 = v52;
            uint64_t v53 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v107 count:1];
            v54 = PHDescriptionsForResourceTypes(v53);
            v55 = [v54 componentsJoinedByString:@","];
            *(_DWORD *)buf = 138412546;
            v113 = v51;
            __int16 v114 = 2112;
            v115 = v55;
            _os_log_impl(&dword_19B043000, v50, OS_LOG_TYPE_DEBUG, "REMOVING: %@ (%@) as a processed asset", buf, 0x16u);
          }
          v56 = v84->_audioByImportIdentifier;
          v57 = [v5 importIdentifier];
          v58 = [(NSMutableDictionary *)v56 objectForKeyedSubscript:v57];
          v59 = v49;
          self = v84;
          [v58 removeObject:v59];
        }
      }
      if (!obj)
      {
        uint64_t v60 = [MEMORY[0x1E4F1CA48] array];
        v61 = self->_assetsByImportIdentifier;
        v62 = [v5 importIdentifier];
        obuint64_t j = (id)v60;
        [(NSMutableDictionary *)v61 setObject:v60 forKeyedSubscript:v62];
      }
      if (([v82 containsObject:v5] & 1) == 0)
      {
        v63 = PLImportGetLog();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
        {
          v64 = [v5 redactedFileNameDescription];
          v65 = objc_msgSend(NSNumber, "numberWithInteger:", -[NSObject resourceType](v5, "resourceType"));
          v106 = v65;
          v66 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v106 count:1];
          v67 = PHDescriptionsForResourceTypes(v66);
          v68 = [v67 componentsJoinedByString:@","];
          *(_DWORD *)buf = 138412546;
          v113 = v64;
          __int16 v114 = 2112;
          v115 = v68;
          _os_log_impl(&dword_19B043000, v63, OS_LOG_TYPE_DEBUG, "ADDING: %@ (%@) as a processed asset", buf, 0x16u);
        }
        if ([v5 isSidecar]) {
          [obj insertObject:v5 atIndex:0];
        }
        else {
          [obj addObject:v5];
        }
      }
      v93 = v5;
      long long v97 = 0u;
      long long v98 = 0u;
      long long v95 = 0u;
      long long v96 = 0u;
      id v69 = v82;
      uint64_t v70 = [v69 countByEnumeratingWithState:&v95 objects:v105 count:16];
      if (v70)
      {
        uint64_t v71 = v70;
        uint64_t v72 = *(void *)v96;
        uint64_t v89 = *(void *)v96;
        do
        {
          uint64_t v73 = 0;
          uint64_t v91 = v71;
          do
          {
            if (*(void *)v96 != v72) {
              objc_enumerationMutation(v69);
            }
            v74 = *(void **)(*((void *)&v95 + 1) + 8 * v73);
            v75 = PLImportGetLog();
            if (os_log_type_enabled(v75, OS_LOG_TYPE_DEBUG))
            {
              v76 = [v74 redactedFileNameDescription];
              id v77 = v69;
              v78 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v74, "resourceType"));
              v104 = v78;
              v79 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v104 count:1];
              v80 = PHDescriptionsForResourceTypes(v79);
              v81 = [v80 componentsJoinedByString:@","];
              *(_DWORD *)buf = 138412546;
              v113 = v76;
              __int16 v114 = 2112;
              v115 = v81;
              _os_log_impl(&dword_19B043000, v75, OS_LOG_TYPE_DEBUG, "REMOVING: %@ (%@) as a processed asset", buf, 0x16u);

              id v69 = v77;
              uint64_t v71 = v91;

              uint64_t v72 = v89;
            }

            [obj removeObject:v74];
            ++v73;
          }
          while (v71 != v73);
          uint64_t v71 = [v69 countByEnumeratingWithState:&v95 objects:v105 count:16];
        }
        while (v71);
      }

      if ([v69 count]) {
        [(PHImportSource *)v84 removeAssets:v69];
      }
      uint64_t v5 = v93;
    }
LABEL_99:
  }
  else
  {
    uint64_t v5 = PLImportGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B043000, v5, OS_LOG_TYPE_DEBUG, "'asset' was nil", buf, 2u);
    }
  }
}

- (BOOL)_pairDatSidecar:(id)a3 withMediaAssetIfHasAdjustments:(id)a4 orAaeInProcessedAssets:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(PHImportSource *)self _adjustmentDataAssetFromAssets:a5];
  BOOL v11 = (v10 || [v9 hasAdjustments])
     && [(PHImportSource *)self _addSidecarAsset:v8 toAsset:v9];

  return v11;
}

- (id)_findDatAssetInProcessedAssets:(id)a3 toPairWithMediaAsset:(id)a4 ifAssetIsAdjustment:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([a5 resourceType] == 7)
  {
    uint64_t v10 = [(PHImportSource *)self _adjustmentSecondaryDataAssetFromAssets:v8];
    if ([(PHImportSource *)self _addSidecarAsset:v10 toAsset:v9]) {
      goto LABEL_5;
    }
  }
  uint64_t v10 = 0;
LABEL_5:

  return v10;
}

- (id)_adjustmentSecondaryDataAssetFromAssets:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = a3;
  id v4 = (id)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v7, "resourceType", (void)v9) == 110)
        {
          id v4 = v7;
          goto LABEL_11;
        }
      }
      id v4 = (id)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (id)_adjustmentDataAssetFromAssets:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = a3;
  id v4 = (id)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v7, "resourceType", (void)v9) == 7)
        {
          id v4 = v7;
          goto LABEL_11;
        }
      }
      id v4 = (id)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (BOOL)_addSidecarAsset:(id)a3 toAsset:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6 && [(PHImportSource *)self confirmAsset:v6 isSidecarOfAsset:v7])
  {
    [v7 addSidecarAsset:v6];
    BOOL v8 = 1;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)processRepresentation:(id)a3
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    long long v12 = PLImportGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B043000, v12, OS_LOG_TYPE_DEBUG, "'asset' was nil", buf, 2u);
    }
    goto LABEL_51;
  }
  uint64_t v5 = v4;
  representationsByImportIdentifier = self->_representationsByImportIdentifier;
  id v7 = [v4 importIdentifier];
  BOOL v8 = [(NSMutableDictionary *)representationsByImportIdentifier objectForKeyedSubscript:v7];
  long long v9 = (void *)[v8 copy];

  v56 = self;
  long long v10 = self->_representationsByImportIdentifier;
  long long v11 = [v5 importIdentifier];
  v55 = [(NSMutableDictionary *)v10 objectForKeyedSubscript:v11];

  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v12 = v9;
  uint64_t v63 = [v12 countByEnumeratingWithState:&v64 objects:v83 count:16];
  if (!v63)
  {
LABEL_43:

    v43 = v55;
    if (!v55)
    {
      v43 = [MEMORY[0x1E4F1CA48] array];
      __int16 v46 = v56->_representationsByImportIdentifier;
      v47 = [v5 importIdentifier];
      [(NSMutableDictionary *)v46 setObject:v43 forKeyedSubscript:v47];
    }
    id v48 = PLImportGetLog();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
    {
      v49 = [v5 redactedFileNameDescription];
      objc_msgSend(NSNumber, "numberWithInteger:", -[NSObject resourceType](v5, "resourceType"));
      v51 = __int16 v50 = v43;
      v68 = v51;
      v52 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v68 count:1];
      uint64_t v53 = PHDescriptionsForResourceTypes(v52);
      v54 = [v53 componentsJoinedByString:@","];
      *(_DWORD *)buf = 138412546;
      v76 = v49;
      __int16 v77 = 2112;
      v78 = v54;
      _os_log_impl(&dword_19B043000, v48, OS_LOG_TYPE_DEBUG, "ADDING: %@ (%@) as a processed representation", buf, 0x16u);

      v43 = v50;
    }

    if ([v5 isRender]) {
      [v43 insertObject:v5 atIndex:0];
    }
    else {
      [v43 addObject:v5];
    }
    goto LABEL_50;
  }
  uint64_t v62 = *(void *)v65;
  v57 = v12;
  v58 = v5;
LABEL_4:
  uint64_t v13 = 0;
  while (2)
  {
    if (*(void *)v65 != v62) {
      objc_enumerationMutation(v12);
    }
    uint64_t v14 = *(void **)(*((void *)&v64 + 1) + 8 * v13);
    long long v15 = PLImportGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      long long v16 = [v5 redactedFileNameDescription];
      v61 = objc_msgSend(NSNumber, "numberWithInteger:", -[NSObject resourceType](v5, "resourceType"));
      v74 = v61;
      uint64_t v60 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v74 count:1];
      v59 = PHDescriptionsForResourceTypes(v60);
      long long v17 = [v59 componentsJoinedByString:@","];
      long long v18 = [v14 redactedFileNameDescription];
      double v19 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v14, "resourceType"));
      uint64_t v73 = v19;
      uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v73 count:1];
      PHDescriptionsForResourceTypes(v20);
      v22 = uint64_t v21 = v14;
      uint64_t v23 = [v22 componentsJoinedByString:@","];
      *(_DWORD *)buf = 138413058;
      v76 = v16;
      __int16 v77 = 2112;
      v78 = v17;
      __int16 v79 = 2112;
      v80 = v18;
      __int16 v81 = 2112;
      id v82 = v23;
      _os_log_impl(&dword_19B043000, v15, OS_LOG_TYPE_DEBUG, "ANALYZING asset: %@ (%@), processed: %@ (%@)", buf, 0x2Au);

      uint64_t v14 = v21;
      uint64_t v5 = v58;

      long long v12 = v57;
    }

    switch([v14 resourceType])
    {
      case 5:
        if ([v5 resourceType] == 6) {
          goto LABEL_25;
        }
        goto LABEL_29;
      case 6:
        if ([v5 resourceType] != 5
          || ![v14 isVideoComplementOf:v5])
        {
          goto LABEL_29;
        }
        id v35 = [v5 importIdentifier];
        [(PHImportSource *)v56 setIsLivePhotoForImportIdentifier:v35];

        uint64_t v36 = PLImportGetLog();
        if (!os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_42;
        }
        long long v38 = [v14 redactedFileNameDescription];
        long long v39 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v14, "resourceType"));
        uint64_t v72 = v39;
        long long v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v72 count:1];
        v41 = PHDescriptionsForResourceTypes(v40);
        uint64_t v42 = [v41 componentsJoinedByString:@","];
        *(_DWORD *)buf = 138412546;
        v76 = v38;
        __int16 v77 = 2112;
        v78 = v42;
        goto LABEL_41;
      case 8:
        if ([v5 resourceType] != 12) {
          goto LABEL_29;
        }
        long long v30 = [v5 importIdentifier];
        BOOL v31 = [(PHImportSource *)v56 isLivePhotoForImportIdentifier:v30];

        if (!v31) {
          goto LABEL_29;
        }
        [v14 takeAsVideoComplement:v5];
        goto LABEL_36;
      case 12:
        if ([v5 resourceType] != 8) {
          goto LABEL_29;
        }
        uint64_t v32 = [v5 importIdentifier];
        BOOL v33 = [(PHImportSource *)v56 isLivePhotoForImportIdentifier:v32];

        if (!v33) {
          goto LABEL_29;
        }
        [v5 takeAsVideoComplement:v14];
        uint64_t v36 = PLImportGetLog();
        if (!os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_42;
        }
        long long v38 = [v14 redactedFileNameDescription];
        long long v39 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v14, "resourceType"));
        uint64_t v71 = v39;
        long long v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v71 count:1];
        v41 = PHDescriptionsForResourceTypes(v40);
        uint64_t v42 = [v41 componentsJoinedByString:@","];
        *(_DWORD *)buf = 138412546;
        v76 = v38;
        __int16 v77 = 2112;
        v78 = v42;
        goto LABEL_41;
      case 13:
        if ([v5 resourceType] != 14) {
          goto LABEL_29;
        }
LABEL_25:
        if (![v5 isVideoComplementOf:v14])
        {
LABEL_29:
          if (v63 != ++v13) {
            continue;
          }
          uint64_t v63 = [v12 countByEnumeratingWithState:&v64 objects:v83 count:16];
          if (!v63) {
            goto LABEL_43;
          }
          goto LABEL_4;
        }
        uint64_t v34 = [v5 importIdentifier];
        [(PHImportSource *)v56 setIsLivePhotoForImportIdentifier:v34];

LABEL_36:
        uint64_t v5 = v12;
        v43 = v55;
LABEL_50:

LABEL_51:
        return;
      case 14:
        if ([v5 resourceType] != 13
          || ![v14 isVideoComplementOf:v5])
        {
          goto LABEL_29;
        }
        v45 = [v5 importIdentifier];
        [(PHImportSource *)v56 setIsLivePhotoForImportIdentifier:v45];

        uint64_t v36 = PLImportGetLog();
        if (!os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_42;
        }
        long long v38 = [v14 redactedFileNameDescription];
        long long v39 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v14, "resourceType"));
        uint64_t v70 = v39;
        long long v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v70 count:1];
        v41 = PHDescriptionsForResourceTypes(v40);
        uint64_t v42 = [v41 componentsJoinedByString:@","];
        *(_DWORD *)buf = 138412546;
        v76 = v38;
        __int16 v77 = 2112;
        v78 = v42;
LABEL_41:
        _os_log_impl(&dword_19B043000, v36, OS_LOG_TYPE_DEBUG, "REMOVING: %@ (%@) as a processed representation", buf, 0x16u);

LABEL_42:
        [v55 removeObject:v14];
        goto LABEL_43;
      default:
        uint64_t v24 = PLImportGetLog();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          long long v25 = [v14 redactedFileNameDescription];
          long long v26 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v14, "resourceType"));
          id v69 = v26;
          uint64_t v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v69 count:1];
          long long v28 = PHDescriptionsForResourceTypes(v27);
          int v29 = [v28 componentsJoinedByString:@","];
          *(_DWORD *)buf = 138412546;
          v76 = v25;
          __int16 v77 = 2112;
          v78 = v29;
          _os_log_impl(&dword_19B043000, v24, OS_LOG_TYPE_DEBUG, "Unexpected representation resource type for %@ (%@)", buf, 0x16u);
        }
        goto LABEL_29;
    }
  }
}

- (id)processAssets:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v33 = v4;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v43 objects:v53 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v44 != v9) {
            objc_enumerationMutation(v6);
          }
          long long v11 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          long long v12 = [v11 importIdentifier];

          if (v12)
          {
            if ([v11 isRepresentation]) {
              [(PHImportSource *)self processRepresentation:v11];
            }
            else {
              [(PHImportSource *)self processResource:v11];
            }
            [v5 addObject:v11];
          }
          else
          {
            uint64_t v13 = PLImportGetLog();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              uint64_t v14 = [v11 redactedFileNameDescription];
              long long v15 = (void *)MEMORY[0x1E4F8B8F0];
              long long v16 = [v11 parentFolderPath];
              long long v17 = [v15 descriptionWithPath:v16];
              *(_DWORD *)buf = 138412546;
              __int16 v50 = v14;
              __int16 v51 = 2112;
              v52 = v17;
              _os_log_impl(&dword_19B043000, v13, OS_LOG_TYPE_ERROR, "Invalid import identifier for %@ (parent path: %@)", buf, 0x16u);
            }
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v43 objects:v53 count:16];
      }
      while (v8);
    }

    uint64_t v34 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v18 = v5;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v39 objects:v48 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v40;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v40 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void **)(*((void *)&v39 + 1) + 8 * j);
          if (([v23 isSidecar] & 1) == 0)
          {
            if ([v23 isPrimary]) {
              [v34 addObject:v23];
            }
            assetsByImportIdentifier = self->_assetsByImportIdentifier;
            long long v25 = [v23 importIdentifier];
            long long v26 = [(NSMutableDictionary *)assetsByImportIdentifier objectForKeyedSubscript:v25];

            long long v37 = 0u;
            long long v38 = 0u;
            long long v35 = 0u;
            long long v36 = 0u;
            id v27 = v26;
            uint64_t v28 = [v27 countByEnumeratingWithState:&v35 objects:v47 count:16];
            if (v28)
            {
              uint64_t v29 = v28;
              uint64_t v30 = *(void *)v36;
              do
              {
                for (uint64_t k = 0; k != v29; ++k)
                {
                  if (*(void *)v36 != v30) {
                    objc_enumerationMutation(v27);
                  }
                  [(PHImportSource *)self addRepresentationsForAsset:*(void *)(*((void *)&v35 + 1) + 8 * k)];
                }
                uint64_t v29 = [v27 countByEnumeratingWithState:&v35 objects:v47 count:16];
              }
              while (v29);
            }
          }
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v39 objects:v48 count:16];
      }
      while (v20);
    }

    id v4 = v33;
  }
  else
  {
    long long v18 = PLImportGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B043000, v18, OS_LOG_TYPE_DEBUG, "'assets' was nil", buf, 2u);
    }
    uint64_t v34 = 0;
  }

  return v34;
}

- (id)deleteImportAssets:(id)a3 isConfirmed:(BOOL)a4 atEnd:(id)a5
{
  return 0;
}

- (BOOL)isPairedSidecar:(id)a3
{
  id v4 = a3;
  id v5 = [(PHImportSource *)self pairedSidecarsByImportIdentifier];
  id v6 = [v4 importIdentifier];
  uint64_t v7 = [v5 objectForKeyedSubscript:v6];
  uint64_t v8 = [v7 allValues];
  uint64_t v9 = [v4 url];

  long long v10 = [v9 path];
  char v11 = [v8 containsObject:v10];

  return v11;
}

- (void)addPairedSidecar:(id)a3
{
  id v4 = a3;
  id v13 = [v4 importIdentifier];
  id v5 = [(PHImportSource *)self pairedSidecarsByImportIdentifier];
  id v6 = [v5 objectForKeyedSubscript:v13];

  if (!v6)
  {
    id v6 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:4];
    uint64_t v7 = [(PHImportSource *)self pairedSidecarsByImportIdentifier];
    [v7 setObject:v6 forKeyedSubscript:v13];
  }
  uint64_t v8 = [v4 url];
  uint64_t v9 = [v8 path];
  long long v10 = NSNumber;
  uint64_t v11 = [v4 resourceType];

  long long v12 = [v10 numberWithInteger:v11];
  [v6 setObject:v9 forKeyedSubscript:v12];
}

- (void)endWork
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PLImportGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    long long v67 = "-[PHImportSource endWork]";
    _os_log_impl(&dword_19B043000, v2, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  id v3 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v4 = [(NSMutableDictionary *)self->_representationsByImportIdentifier count];
  id v5 = v3;
  id v6 = self;
  uint64_t v7 = [v5 arrayWithCapacity:v4];
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  uint64_t v8 = [(NSMutableDictionary *)self->_representationsByImportIdentifier allValues];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v62 objects:v75 count:16];
  long long v46 = v7;
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v63;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v63 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v62 + 1) + 8 * i);
        long long v58 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        id v14 = v13;
        uint64_t v15 = [v14 countByEnumeratingWithState:&v58 objects:v74 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v59;
          do
          {
            for (uint64_t j = 0; j != v16; ++j)
            {
              if (*(void *)v59 != v17) {
                objc_enumerationMutation(v14);
              }
              uint64_t v19 = *(void **)(*((void *)&v58 + 1) + 8 * j);
              [v46 addObject:v19];
              if ([v19 isImage])
              {
                [v19 setResourceType:1];
                if ([v19 isLivePhoto])
                {
                  uint64_t v20 = [v19 videoComplement];
                  [v20 setResourceType:9];
                }
              }
              else if ([v19 isMovie])
              {
                [v19 setResourceType:2];
              }
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v58 objects:v74 count:16];
          }
          while (v16);
        }

        uint64_t v7 = v46;
        if ([v46 count])
        {
          uint64_t v21 = [(PHImportSource *)self options];
          char v22 = [v21 allowDuplicates];

          if ((v22 & 1) == 0) {
            [(PHImportSource *)self findDuplicatesOfItems:v46 considerItemsInTheTrash:1];
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v62 objects:v75 count:16];
    }
    while (v10);
  }

  if ([v7 count])
  {
    uint64_t v23 = [(PHImportSource *)self assets];
    [v23 addObjectsFromArray:v7];

    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __25__PHImportSource_endWork__block_invoke;
    v56[3] = &unk_1E58479F8;
    v56[4] = self;
    id v57 = v7;
    [(PHImportSource *)self notifyObserversUsingBlock:v56];
    [(NSMutableDictionary *)self->_representationsByImportIdentifier removeAllObjects];
  }
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  obuint64_t j = self->_audioByImportIdentifier;
  uint64_t v44 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v52 objects:v73 count:16];
  if (v44)
  {
    uint64_t v43 = *(void *)v53;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v53 != v43) {
          objc_enumerationMutation(obj);
        }
        uint64_t v45 = v24;
        uint64_t v25 = *(void *)(*((void *)&v52 + 1) + 8 * v24);
        long long v48 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        long long v26 = [(NSMutableDictionary *)v6->_audioByImportIdentifier objectForKeyedSubscript:v25];
        uint64_t v27 = [v26 countByEnumeratingWithState:&v48 objects:v72 count:16];
        if (v27)
        {
          uint64_t v28 = v27;
          uint64_t v29 = *(void *)v49;
          do
          {
            for (uint64_t k = 0; k != v28; ++k)
            {
              if (*(void *)v49 != v29) {
                objc_enumerationMutation(v26);
              }
              BOOL v31 = *(void **)(*((void *)&v48 + 1) + 8 * k);
              uint64_t v32 = (void *)MEMORY[0x1E4F28C58];
              id v33 = [v31 fileName];
              uint64_t v34 = objc_msgSend(v32, "ph_genericErrorWithLocalizedDescription:", @"Unsupported: %@ was not an audio sidecar for any other resource", v33);

              long long v35 = [v31 url];
              long long v36 = [v35 path];
              id v37 = [(PHImportExceptionRecorder *)self addExceptionWithType:0 path:v36 underlyingError:v34 file:"/Library/Caches/com.apple.xbs/Sources/Photos/Projects/PhotoKit/Sources/Import/PHImportSource.m" line:481];
            }
            uint64_t v28 = [v26 countByEnumeratingWithState:&v48 objects:v72 count:16];
          }
          while (v28);
        }

        uint64_t v24 = v45 + 1;
        id v6 = self;
      }
      while (v45 + 1 != v44);
      uint64_t v44 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v52 objects:v73 count:16];
    }
    while (v44);
  }

  long long v38 = PLImportGetLog();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v39 = objc_opt_class();
    long long v40 = [(PHImportSource *)v6 assets];
    uint64_t v41 = [v40 count];
    *(_DWORD *)buf = 138543874;
    long long v67 = (const char *)v39;
    __int16 v68 = 2048;
    id v69 = v6;
    __int16 v70 = 2048;
    uint64_t v71 = v41;
    _os_log_impl(&dword_19B043000, v38, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p> loaded %lu assets", buf, 0x20u);
  }
}

uint64_t __25__PHImportSource_endWork__block_invoke(uint64_t a1, void *a2)
{
  return [a2 importSource:*(void *)(a1 + 32) didAddAssets:*(void *)(a1 + 40)];
}

- (void)endBatch
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_processingQueue);
  long long v46 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSMutableArray count](self->_processed, "count"));
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v3 = self->_processed;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v57 objects:v67 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v58;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v58 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v57 + 1) + 8 * i);
        uint64_t v9 = [(PHImportSource *)self removedSourceFileIdentifiers];
        uint64_t v10 = [v8 uuid];
        if ([v9 containsObject:v10])
        {
        }
        else
        {
          char v11 = [(NSMutableArray *)self->_assets containsObject:v8];

          if ((v11 & 1) == 0) {
            [v46 addObject:v8];
          }
        }
      }
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v57 objects:v67 count:16];
    }
    while (v5);
  }

  long long v12 = v46;
  if ([v46 count])
  {
    id v13 = [(PHImportSource *)self options];
    char v14 = [v13 allowDuplicates];

    if ((v14 & 1) == 0)
    {
      [(PHImportSource *)self findDuplicatesOfItems:v46 considerItemsInTheTrash:1];
      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      obuint64_t j = v46;
      uint64_t v15 = [obj countByEnumeratingWithState:&v53 objects:v66 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v54;
        uint64_t v43 = *(void *)v54;
        do
        {
          uint64_t v18 = 0;
          uint64_t v44 = v16;
          do
          {
            if (*(void *)v54 != v17) {
              objc_enumerationMutation(obj);
            }
            uint64_t v19 = *(void **)(*((void *)&v53 + 1) + 8 * v18);
            if ([v19 isDuplicate])
            {
              uint64_t v20 = [v19 duplicates];
              uint64_t v21 = +[PHImportDuplicateChecker duplicatesFromResults:v20 forLibrary:self->_library];

              long long v51 = 0u;
              long long v52 = 0u;
              long long v49 = 0u;
              long long v50 = 0u;
              id v22 = v21;
              uint64_t v23 = [v22 countByEnumeratingWithState:&v49 objects:v65 count:16];
              if (v23)
              {
                uint64_t v24 = v23;
                uint64_t v25 = *(void *)v50;
                while (2)
                {
                  for (uint64_t j = 0; j != v24; ++j)
                  {
                    if (*(void *)v50 != v25) {
                      objc_enumerationMutation(v22);
                    }
                    uint64_t v27 = *(void **)(*((void *)&v49 + 1) + 8 * j);
                    uint64_t v28 = [v19 uuid];
                    uint64_t v29 = [v27 uuid];
                    int v30 = [v28 isEqualToString:v29];

                    if (v30)
                    {
                      BOOL v31 = [MEMORY[0x1E4F29128] UUID];
                      uint64_t v32 = [v31 UUIDString];
                      [v19 setUuid:v32];

                      goto LABEL_30;
                    }
                  }
                  uint64_t v24 = [v22 countByEnumeratingWithState:&v49 objects:v65 count:16];
                  if (v24) {
                    continue;
                  }
                  break;
                }
              }
LABEL_30:

              uint64_t v17 = v43;
              uint64_t v16 = v44;
            }
            id v33 = PLImportGetLog();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v34 = [v19 uuid];
              long long v35 = [v19 duplicates];
              long long v36 = +[PHImportDuplicateChecker duplicatesFromResults:v35 forLibrary:self->_library];
              *(_DWORD *)buf = 138412546;
              long long v62 = v34;
              __int16 v63 = 2112;
              uint64_t v64 = (uint64_t)v36;
              _os_log_impl(&dword_19B043000, v33, OS_LOG_TYPE_DEBUG, "asset: %@\n duplicates: %@", buf, 0x16u);
            }
            ++v18;
          }
          while (v18 != v16);
          uint64_t v16 = [obj countByEnumeratingWithState:&v53 objects:v66 count:16];
        }
        while (v16);
      }

      long long v12 = v46;
    }
  }
  id v37 = PLImportGetLog();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v38 = [v12 count];
    *(_DWORD *)buf = 136315394;
    long long v62 = "-[PHImportSource endBatch]";
    __int16 v63 = 2048;
    uint64_t v64 = v38;
    _os_log_impl(&dword_19B043000, v37, OS_LOG_TYPE_DEBUG, "%s (%lu)", buf, 0x16u);
  }

  if ([v12 count])
  {
    uint64_t v39 = [(PHImportSource *)self assets];
    [v39 addObjectsFromArray:v12];

    long long v40 = dispatch_get_global_queue(25, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __26__PHImportSource_endBatch__block_invoke;
    block[3] = &unk_1E5848DF0;
    block[4] = self;
    id v48 = v12;
    dispatch_async(v40, block);
  }
  objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSMutableArray count](self->_processed, "count"));
  uint64_t v41 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  processed = self->_processed;
  self->_processed = v41;
}

void __26__PHImportSource_endBatch__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __26__PHImportSource_endBatch__block_invoke_2;
  v2[3] = &unk_1E58479F8;
  v2[4] = v1;
  id v3 = *(id *)(a1 + 40);
  [v1 notifyObserversUsingBlock:v2];
}

uint64_t __26__PHImportSource_endBatch__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 importSource:*(void *)(a1 + 32) didAddAssets:*(void *)(a1 + 40)];
}

- (id)assetsByProcessingItem:(id)a3
{
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"PHImportSource.m" lineNumber:404 description:@"Abstract Base Class Method"];

  return 0;
}

- (void)processNextItems
{
  processingQueue = self->_processingQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__PHImportSource_processNextItems__block_invoke;
  block[3] = &unk_1E5848578;
  block[4] = self;
  dispatch_async(processingQueue, block);
}

void __34__PHImportSource_processNextItems__block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) progress];
  char v3 = [v2 isCancelled];

  if ((v3 & 1) == 0)
  {
    do
    {
      uint64_t v4 = [*(id *)(a1 + 32) nextItem];
      if (!v4) {
        break;
      }
      uint64_t v5 = (void *)v4;
      uint64_t v6 = [*(id *)(a1 + 32) assetsByProcessingItem:v4];
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      uint64_t v7 = [v6 countByEnumeratingWithState:&v27 objects:v35 count:16];
      if (v7)
      {
        uint64_t v8 = v7;
        uint64_t v9 = *(void *)v28;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v28 != v9) {
              objc_enumerationMutation(v6);
            }
            uint64_t v11 = *(void *)(*((void *)&v27 + 1) + 8 * i);
            if (([*(id *)(*(void *)(a1 + 32) + 200) containsObject:v11] & 1) == 0) {
              [*(id *)(*(void *)(a1 + 32) + 200) addObject:v11];
            }
          }
          uint64_t v8 = [v6 countByEnumeratingWithState:&v27 objects:v35 count:16];
        }
        while (v8);
      }
      if ([*(id *)(a1 + 32) batchComplete]) {
        [*(id *)(a1 + 32) endBatch];
      }

      long long v12 = [*(id *)(a1 + 32) progress];
      int v13 = [v12 isCancelled];
    }
    while (!v13);
  }
  int v14 = [*(id *)(a1 + 32) isDone];
  uint64_t v15 = *(void **)(a1 + 32);
  if (v14)
  {
    [v15 endBatch];
    [*(id *)(a1 + 32) endWork];
    uint64_t v16 = PLImportGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v17 = [*(id *)(a1 + 32) assets];
      uint64_t v18 = [v17 count];
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      double v20 = v19 - *(double *)(*(void *)(a1 + 32) + 56);
      *(_DWORD *)buf = 134218240;
      uint64_t v32 = v18;
      __int16 v33 = 2048;
      double v34 = v20;
      _os_log_impl(&dword_19B043000, v16, OS_LOG_TYPE_DEBUG, "-----===== Time to load %lu assets: %g =====-----", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v21 = [v15 progress];
    int v22 = [v21 isCancelled];

    if (!v22) {
      return;
    }
  }
  uint64_t v23 = [*(id *)(a1 + 32) completion];

  if (v23)
  {
    uint64_t v24 = [*(id *)(a1 + 32) completion];
    uint64_t v25 = [*(id *)(a1 + 32) assets];
    long long v26 = [*(id *)(a1 + 32) exceptions];
    ((void (**)(void, void *, void *))v24)[2](v24, v25, v26);

    [*(id *)(a1 + 32) setCompletion:0];
  }
}

- (void)beginProcessingWithCompletion:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  char v3 = (void (**)(void))a3;
  uint64_t v4 = PLImportGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315138;
    uint64_t v6 = "-[PHImportSource beginProcessingWithCompletion:]";
    _os_log_impl(&dword_19B043000, v4, OS_LOG_TYPE_DEBUG, "%s", (uint8_t *)&v5, 0xCu);
  }

  v3[2](v3);
}

- (void)beginWork
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  char v3 = PLImportGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v6 = "-[PHImportSource beginWork]";
    _os_log_impl(&dword_19B043000, v3, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
  }

  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __27__PHImportSource_beginWork__block_invoke;
  v4[3] = &unk_1E5848578;
  v4[4] = self;
  [(PHImportSource *)self beginProcessingWithCompletion:v4];
}

uint64_t __27__PHImportSource_beginWork__block_invoke(uint64_t a1)
{
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  *(void *)(*(void *)(a1 + 32) + 56) = v2;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  *(void *)(*(void *)(a1 + 32) + 208) = v3;
  uint64_t v4 = *(void **)(a1 + 32);

  return [v4 processNextItems];
}

- (BOOL)containsSupportedMediaWithImportExceptions:(id *)a3
{
  return 0;
}

- (void)dispatchAssetDataRequestAsync:(id)a3 usingBlock:(id)a4
{
  objc_opt_class();

  NSRequestConcreteImplementation();
}

- (void)stopAssetLoading
{
  controlQueue = self->_controlQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__PHImportSource_stopAssetLoading__block_invoke;
  block[3] = &unk_1E5848578;
  block[4] = self;
  dispatch_sync(controlQueue, block);
}

uint64_t __34__PHImportSource_stopAssetLoading__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setOpen:0];
  uint64_t result = [*(id *)(a1 + 32) stalled];
  if (result)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    return [v3 processNextItems];
  }
  return result;
}

- (void)resumeAssetLoading
{
  controlQueue = self->_controlQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__PHImportSource_resumeAssetLoading__block_invoke;
  block[3] = &unk_1E5848578;
  block[4] = self;
  dispatch_sync(controlQueue, block);
}

void __36__PHImportSource_resumeAssetLoading__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) progress];
  int v3 = [v2 isPaused];

  if (v3)
  {
    uint64_t v4 = [*(id *)(a1 + 32) processingQueue];
    dispatch_resume(v4);
  }
}

- (void)pauseAssetLoading
{
  controlQueue = self->_controlQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__PHImportSource_pauseAssetLoading__block_invoke;
  block[3] = &unk_1E5848578;
  block[4] = self;
  dispatch_sync(controlQueue, block);
}

void __35__PHImportSource_pauseAssetLoading__block_invoke(uint64_t a1)
{
  uint64_t v4 = [*(id *)(a1 + 32) progress];
  if (([v4 isPaused] & 1) == 0)
  {
    uint64_t v2 = [*(id *)(a1 + 32) progress];
    char v3 = [v2 isCancelled];

    if (v3) {
      return;
    }
    uint64_t v4 = [*(id *)(a1 + 32) processingQueue];
    dispatch_suspend(v4);
  }
}

- (id)loadAssetsForLibrary:(id)a3 allowDuplicates:(BOOL)a4 order:(int64_t)a5 batchSize:(unint64_t)a6 batchInterval:(double)a7 atEnd:(id)a8
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a8;
  uint64_t v17 = PLImportGetLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v39 = objc_opt_class();
    __int16 v40 = 2048;
    uint64_t v41 = self;
    _os_log_impl(&dword_19B043000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p> loading assets", buf, 0x16u);
  }

  objc_storeStrong((id *)&self->_library, a3);
  uint64_t v18 = [v15 photoLibraryBundle];
  double v19 = [v18 timeZoneLookup];
  timeZoneLookup = self->_timeZoneLookup;
  self->_timeZoneLookup = v19;

  uint64_t v21 = _Block_copy(v16);
  id completion = self->_completion;
  self->_id completion = v21;

  self->_unint64_t batchSize = a6;
  double v23 = 0.25;
  if (a7 != 0.0) {
    double v23 = a7;
  }
  self->_double batchInterval = v23;
  self->_rampBatchInterval = a7 <= 0.0;
  self->_assetLoadOrder = a5;
  uint64_t v24 = (void *)MEMORY[0x1E4F28F90];
  uint64_t v25 = [(PHImportSource *)self items];
  long long v26 = objc_msgSend(v24, "discreteProgressWithTotalUnitCount:", objc_msgSend(v25, "count"));

  [v26 setCancellable:1];
  objc_initWeak((id *)buf, self);
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __91__PHImportSource_loadAssetsForLibrary_allowDuplicates_order_batchSize_batchInterval_atEnd___block_invoke;
  v36[3] = &unk_1E58479D0;
  objc_copyWeak(&v37, (id *)buf);
  [v26 setCancellationHandler:v36];
  [v26 setPausable:1];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __91__PHImportSource_loadAssetsForLibrary_allowDuplicates_order_batchSize_batchInterval_atEnd___block_invoke_2;
  v34[3] = &unk_1E58479D0;
  objc_copyWeak(&v35, (id *)buf);
  [v26 setPausingHandler:v34];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __91__PHImportSource_loadAssetsForLibrary_allowDuplicates_order_batchSize_batchInterval_atEnd___block_invoke_3;
  v32[3] = &unk_1E58479D0;
  objc_copyWeak(&v33, (id *)buf);
  [v26 setResumingHandler:v32];
  [v26 setCancellable:1];
  [(PHImportSource *)self setProgress:v26];
  long long v27 = dispatch_get_global_queue(25, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __91__PHImportSource_loadAssetsForLibrary_allowDuplicates_order_batchSize_batchInterval_atEnd___block_invoke_4;
  block[3] = &unk_1E58485A0;
  block[4] = self;
  BOOL v31 = a4;
  dispatch_async(v27, block);

  long long v28 = [(PHImportSource *)self progress];
  objc_destroyWeak(&v33);
  objc_destroyWeak(&v35);
  objc_destroyWeak(&v37);
  objc_destroyWeak((id *)buf);

  return v28;
}

void __91__PHImportSource_loadAssetsForLibrary_allowDuplicates_order_batchSize_batchInterval_atEnd___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained stopAssetLoading];
    id WeakRetained = v2;
  }
}

void __91__PHImportSource_loadAssetsForLibrary_allowDuplicates_order_batchSize_batchInterval_atEnd___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained pauseAssetLoading];
    id WeakRetained = v2;
  }
}

void __91__PHImportSource_loadAssetsForLibrary_allowDuplicates_order_batchSize_batchInterval_atEnd___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained resumeAssetLoading];
    id WeakRetained = v2;
  }
}

uint64_t __91__PHImportSource_loadAssetsForLibrary_allowDuplicates_order_batchSize_batchInterval_atEnd___block_invoke_4(uint64_t a1)
{
  id v2 = objc_opt_new();
  [*(id *)(a1 + 32) setOptions:v2];

  uint64_t v3 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v4 = [*(id *)(a1 + 32) options];
  [v4 setAllowDuplicates:v3];

  int v5 = *(void **)(a1 + 32);

  return [v5 beginWork];
}

- (id)loadAssetsForLibrary:(id)a3 allowDuplicates:(BOOL)a4 order:(int64_t)a5 batchInterval:(double)a6 atEnd:(id)a7
{
  if (a6 == 0.0) {
    a6 = 0.0;
  }
  return [(PHImportSource *)self loadAssetsForLibrary:a3 allowDuplicates:a4 order:a5 batchSize:0 batchInterval:a7 atEnd:a6];
}

- (id)loadAssetsForLibrary:(id)a3 allowDuplicates:(BOOL)a4 order:(int64_t)a5 batchSize:(unint64_t)a6 atEnd:(id)a7
{
  return [(PHImportSource *)self loadAssetsForLibrary:a3 allowDuplicates:a4 order:a5 batchSize:a6 batchInterval:a7 atEnd:0.0];
}

- (id)loadAssetsForLibrary:(id)a3 allowDuplicates:(BOOL)a4 order:(int64_t)a5 atEnd:(id)a6
{
  return [(PHImportSource *)self loadAssetsForLibrary:a3 allowDuplicates:a4 order:a5 batchSize:0 batchInterval:a6 atEnd:0.0];
}

- (BOOL)isOptimizedCPLStorage
{
  return 0;
}

- (BOOL)canReference
{
  return 0;
}

- (BOOL)canDeleteContent
{
  return 0;
}

- (id)requestDeleteAssetsForRecords:(id)a3
{
  return 0;
}

- (NSString)volumePath
{
  return 0;
}

- (BOOL)isAvailable
{
  return 1;
}

- (BOOL)isLibrary
{
  return 0;
}

- (BOOL)isConnectedDevice
{
  return 0;
}

- (BOOL)canEject
{
  return 0;
}

- (BOOL)isAppleDevice
{
  return 0;
}

- (BOOL)isCamera
{
  return 0;
}

- (NSString)iconSymbolName
{
  return 0;
}

- (CGImage)icon
{
  return 0;
}

- (NSString)path
{
  return 0;
}

- (NSString)productKind
{
  return (NSString *)&stru_1EEAC1950;
}

- (NSString)name
{
  return (NSString *)&stru_1EEAC1950;
}

- (void)notifyObserversUsingBlock:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(id, void))a3;
  p_observersLocuint64_t k = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  uint64_t v6 = [(NSHashTable *)self->_observers allObjects];
  os_unfair_lock_unlock(p_observersLock);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        v4[2](v4, *(void *)(*((void *)&v12 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)removeImportSourceObserver:(id)a3
{
  p_observersLocuint64_t k = &self->_observersLock;
  id v5 = a3;
  os_unfair_lock_lock(p_observersLock);
  [(NSHashTable *)self->_observers removeObject:v5];

  os_unfair_lock_unlock(p_observersLock);
}

- (void)addImportSourceObserver:(id)a3
{
  p_observersLocuint64_t k = &self->_observersLock;
  id v5 = a3;
  os_unfair_lock_lock(p_observersLock);
  [(NSHashTable *)self->_observers addObject:v5];

  os_unfair_lock_unlock(p_observersLock);
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(PHImportSource *)self name];
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p name = %@>", v4, self, v5];;

  return v6;
}

- (PHImportSource)init
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  v38.receiver = self;
  v38.super_class = (Class)PHImportSource;
  id v2 = [(PHImportExceptionRecorder *)&v38 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    uint64_t v4 = [v3 UUIDString];
    uuid = v2->_uuid;
    v2->_uuid = (NSString *)v4;

    uint64_t v6 = objc_opt_new();
    items = v2->_items;
    v2->_items = (NSMutableArray *)v6;

    uint64_t v8 = objc_opt_new();
    assets = v2->_assets;
    v2->_assets = (NSMutableArray *)v8;

    v2->_unint64_t batchSize = 0;
    v2->_unint64_t batchCount = 0;
    uint64_t v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    assetsByImportIdentifier = v2->_assetsByImportIdentifier;
    v2->_assetsByImportIdentifier = v10;

    long long v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    representationsByImportIdentifier = v2->_representationsByImportIdentifier;
    v2->_representationsByImportIdentifier = v12;

    long long v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    audioByImportIdentifier = v2->_audioByImportIdentifier;
    v2->_audioByImportIdentifier = v14;

    id v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    pairedSidecarsByImportIdentifier = v2->_pairedSidecarsByImportIdentifier;
    v2->_pairedSidecarsByImportIdentifier = v16;

    uint64_t v18 = objc_opt_new();
    processed = v2->_processed;
    v2->_processed = (NSMutableArray *)v18;

    uint64_t v20 = objc_opt_new();
    duplicateAssets = v2->_duplicateAssets;
    v2->_duplicateAssets = (NSMutableArray *)v20;

    int v22 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, -1);
    dispatch_queue_t v23 = dispatch_queue_create("dup path collection", v22);
    dupPathCollectionQueue = v2->_dupPathCollectionQueue;
    v2->_dupPathCollectionQueue = (OS_dispatch_queue *)v23;

    dispatch_queue_t v25 = dispatch_queue_create("control queue", v22);
    controlQueue = v2->_controlQueue;
    v2->_controlQueue = (OS_dispatch_queue *)v25;

    dispatch_queue_t v27 = dispatch_queue_create("processing queue", v22);
    processingQueue = v2->_processingQueue;
    v2->_processingQueue = (OS_dispatch_queue *)v27;

    v2->_itemsLock._os_unfair_lock_opaque = 0;
    uint64_t v29 = objc_opt_new();
    removedSourceFileIdentifiers = v2->_removedSourceFileIdentifiers;
    v2->_removedSourceFileIdentifiers = (NSMutableArray *)v29;

    v2->_sourceAccessState = 2;
    BOOL v31 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    importIdentifierToLivePhotoStateMap = v2->_importIdentifierToLivePhotoStateMap;
    v2->_importIdentifierToLivePhotoStateMap = v31;

    uint64_t v33 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v33;

    v2->_observersLock._os_unfair_lock_opaque = 0;
    id v35 = PLImportGetLog();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v36 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      uint64_t v40 = v36;
      __int16 v41 = 2048;
      uint64_t v42 = v2;
      _os_log_impl(&dword_19B043000, v35, OS_LOG_TYPE_DEFAULT, "Creating %{public}@ <%p>", buf, 0x16u);
    }
  }
  return v2;
}

@end