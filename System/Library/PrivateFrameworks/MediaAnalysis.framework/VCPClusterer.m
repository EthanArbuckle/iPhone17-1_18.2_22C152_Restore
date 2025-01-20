@interface VCPClusterer
+ (BOOL)removeClusteringStateCacheWithURL:(id)a3 error:(id *)a4;
- (BOOL)_performAndPersistClustersWithFaceTorsoprintsToAdd:(id)a3 groupingIdentifiersToAdd:(id)a4 faceTorsoprintsToRemove:(id)a5 updatedFaces:(id)a6 cancelOrExtendTimeoutBlock:(id)a7 error:(id *)a8;
- (BOOL)_processingQueueGetFaceClusterSequenceNumbersInClusterCache:(id *)a3 lastClusterSequenceNumber:(unint64_t *)a4 error:(id *)a5;
- (BOOL)_processingQueueGetVisionClusters:(id)a3 minimumClusterSize:(unint64_t)a4 returnClusterAsCountedSet:(BOOL)a5 excludedL0ClustersByL1ClusterId:(id *)a6 cancelOrExtendTimeoutBlock:(id)a7 error:(id *)a8;
- (BOOL)_processingQueuePerformForcedFaceClustering:(BOOL)a3 cancelOrExtendTimeoutBlock:(id)a4;
- (BOOL)_processingQueueResetClusterCache:(id *)a3;
- (BOOL)_processingQueueRestoreClusterCacheAndSyncWithLibrary:(BOOL)a3 cancelOrExtendTimeoutBlock:(id)a4 error:(id *)a5;
- (BOOL)_processingQueueRestoreClusteringCacheWithCacheDirectoryURL:(id)a3 clusterState:(id)a4 threshold:(id)a5 error:(id *)a6;
- (BOOL)_processingQueueRestoreFromClusterSnapshotFileAtURL:(id)a3 error:(id *)a4;
- (BOOL)_processingQueueSaveClusterCache:(id *)a3;
- (BOOL)getClusters:(id *)a3 threshold:(double *)a4 utilizingGPU:(BOOL *)a5 cancelOrExtendTimeoutBlock:(id)a6 error:(id *)a7;
- (BOOL)isReady;
- (BOOL)isReadyToReturnSuggestions;
- (BOOL)needsFullSync;
- (BOOL)needsUpdate;
- (VCPClusterer)initWithPhotoLibrary:(id)a3 andContext:(id)a4;
- (id)_bringUpStateDescription:(unint64_t)a3;
- (id)_faceTorsoprintsFromFaceCSNs:(id)a3;
- (id)_faceTorsoprintsFromFaceIdentifiers:(id)a3 assignClusterSeqNumberIfNeeded:(BOOL)a4 updatedFaces:(id)a5 groupingIdentifiers:(id)a6;
- (id)_faceTorsoprintsFromFaces:(id)a3 assignClusterSeqNumberIfNeeded:(BOOL)a4 updatedFaces:(id)a5;
- (id)_propertyDictionaryFileURL;
- (id)_resolveConflictingL0ClustersFromVNClusters:(id)a3 excludedL0ClustersByL1ClusterId:(id *)a4 cancelOrExtendTimeoutBlock:(id)a5;
- (id)_visionClusterMemmapFileInCacheDirectoryURL:(id)a3 clusterState:(id)a4 error:(id *)a5;
- (id)_visionClusterStateDataBlobFromClusterSnapshotFileAtURL:(id)a3 error:(id *)a4;
- (id)differencesBetweenClusterCacheAndLibrary:(id *)a3 excludedL0ClustersByL1ClusterId:(id *)a4 cancelOrExtendTimeoutBlock:(id)a5;
- (id)distanceBetweenLevel0ClusterIdentifiedByFaceCSN:(unint64_t)a3 andLevel0ClusterIdentifiedByFaceCSN:(unint64_t)a4 error:(id *)a5;
- (id)distancesFromClustersIdentifiedByFaceCSNs:(id)a3 toClustersIdentifiedByFaceCSNs:(id)a4 error:(id *)a5;
- (id)level0ClusterAsFaceCSNsByLevel0KeyFaceCSNForClusterIdentifiedByFaceCSN:(unint64_t)a3 error:(id *)a4;
- (id)requestSuggestionsForFaceClusterSequenceNumbers:(id)a3 withClusteringFlags:(id)a4 updateHandler:(id)a5 error:(id *)a6;
- (id)status;
- (id)suggestedFaceClusterSequenceNumbersForFaceClusterSequenceNumbersRepresentingClusters:(id)a3 error:(id *)a4;
- (unint64_t)clusterCount;
- (unint64_t)clusteredFaceCount;
- (unint64_t)clustererBringUpState;
- (unint64_t)clustererState;
- (unint64_t)numberOfAccumulatedClusterChanges;
- (unint64_t)restoreClusterCacheAndSyncWithLibrary:(BOOL)a3 cancelOrExtendTimeoutBlock:(id)a4 error:(id *)a5;
- (void)_cancelClusteringAndRestoreClusterCache:(BOOL)a3;
- (void)_processingQueueDetermineNextClusterTriggeringAccumulatedChangesCountIfNecessary;
- (void)_processingQueueQuickSyncClustererWithPhotoLibraryUsingFacesInClusterCache:(id)a3 visionClusters:(id *)a4 cancelOrExtendTimeoutBlock:(id)a5;
- (void)_processingQueueSyncClustererWithPhotoLibraryUsingFacesInClusterCache:(id)a3 cancelOrExtendTimeoutBlock:(id)a4;
- (void)_readPropertyDictionary;
- (void)_recordClusterRebuildRequired:(BOOL)a3;
- (void)_recordClusteringState:(BOOL)a3;
- (void)_recordCountOfPendingFacesToAdd:(unint64_t)a3;
- (void)_recordCurrentStatus:(id *)a3;
- (void)_recordIncrementCountOfPendingFacesToAdd:(unint64_t)a3;
- (void)_removeEmptyGroups;
- (void)_removeVisionClusterCacheFilesNotReferencedByVisionClusterState:(id)a3;
- (void)_setPropertyDictionaryValue:(id)a3 forKey:(id)a4;
- (void)cancelAllSuggestionRequests;
- (void)cancelClustering;
- (void)cancelSuggestionRequest:(id)a3;
- (void)clusterAndWaitWithCancelOrExtendTimeoutBlock:(id)a3;
- (void)clusterIfNecessaryAndWaitWithCancelOrExtendTimeoutBlock:(id)a3;
- (void)scheduleClusteringAfterRemovingFaceCSNs:(id)a3 addingFaceIdStrs:(id)a4;
- (void)setClustererBringUpState:(unint64_t)a3;
- (void)terminate;
@end

@implementation VCPClusterer

- (VCPClusterer)initWithPhotoLibrary:(id)a3 andContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ([v8 faceClusteringDisabled])
  {
    v9 = 0;
  }
  else
  {
    v49.receiver = self;
    v49.super_class = (Class)VCPClusterer;
    v10 = [(VCPClusterer *)&v49 init];
    v11 = v10;
    if (v10)
    {
      objc_storeStrong((id *)&v10->_photoLibrary, a3);
      objc_storeStrong((id *)&v11->_context, a4);
      v12 = [[VCPPhotosPersistenceDelegate alloc] initWithPhotoLibrary:v7];
      persistenceDelegate = v11->_persistenceDelegate;
      v11->_persistenceDelegate = v12;

      v14 = objc_msgSend(v7, "vcp_visionCacheStorageDirectoryURL");
      v15 = v14;
      if (v14)
      {
        v16 = v14;
        p_cacheDirUrl = &v11->_cacheDirUrl;
        cacheDirUrl = v11->_cacheDirUrl;
        v11->_cacheDirUrl = v16;
      }
      else
      {
        v19 = (void *)MEMORY[0x1E4F1CB10];
        cacheDirUrl = NSTemporaryDirectory();
        uint64_t v20 = [v19 fileURLWithPath:cacheDirUrl];
        p_cacheDirUrl = &v11->_cacheDirUrl;
        v21 = v11->_cacheDirUrl;
        v11->_cacheDirUrl = (NSURL *)v20;
      }
      uint64_t v22 = _cacheFileUrlFromDirectoryUrl(*p_cacheDirUrl);
      cacheFileUrl = v11->_cacheFileUrl;
      v11->_cacheFileUrl = (NSURL *)v22;

      dispatch_queue_t v24 = dispatch_queue_create("com.apple.mediaanalysisd.clusterer.processing", 0);
      processingQueue = v11->_processingQueue;
      v11->_processingQueue = (OS_dispatch_queue *)v24;

      dispatch_group_t v26 = dispatch_group_create();
      processingGroup = v11->_processingGroup;
      v11->_processingGroup = (OS_dispatch_group *)v26;

      objc_storeStrong((id *)&v11->_clusteringType, (id)*MEMORY[0x1E4F45BA8]);
      v28 = NSNumber;
      [(VCPPhotosFaceProcessingContext *)v11->_context faceClusteringThreshold];
      uint64_t v29 = objc_msgSend(v28, "numberWithFloat:");
      threshold = v11->_threshold;
      v11->_threshold = (NSNumber *)v29;

      v11->_nextSeqNum = 1;
      uint64_t v31 = [MEMORY[0x1E4F1CAD0] set];
      faceCSNsInClusterCache = v11->_faceCSNsInClusterCache;
      v11->_faceCSNsInClusterCache = (NSSet *)v31;

      uint64_t v33 = [MEMORY[0x1E4F1CA80] set];
      faceIdStrsToAdd = v11->_faceIdStrsToAdd;
      v11->_faceIdStrsToAdd = (NSMutableSet *)v33;

      uint64_t v35 = [MEMORY[0x1E4F1CA80] set];
      faceCSNsToRemove = v11->_faceCSNsToRemove;
      v11->_faceCSNsToRemove = (NSMutableSet *)v35;

      v37 = (VNCanceller *)objc_alloc_init(MEMORY[0x1E4F456C8]);
      visionCanceler = v11->_visionCanceler;
      v11->_visionCanceler = v37;

      uint64_t v39 = [MEMORY[0x1E4F1CA48] array];
      outstandingSuggestionRequests = v11->_outstandingSuggestionRequests;
      v11->_outstandingSuggestionRequests = (NSMutableArray *)v39;

      currentSuggestionRequest = v11->_currentSuggestionRequest;
      v11->_currentSuggestionRequest = 0;

      v42 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
      suggestionLock = v11->_suggestionLock;
      v11->_suggestionLock = v42;

      v44 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
      currentStatusSnapshotLock = v11->_currentStatusSnapshotLock;
      v11->_currentStatusSnapshotLock = v44;

      v46 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
      propertyDictionaryLock = v11->_propertyDictionaryLock;
      v11->_propertyDictionaryLock = v46;

      atomic_store(0, (unsigned __int8 *)&v11->_canceled);
      mach_timebase_info(&v11->_timebase);
      [(VCPClusterer *)v11 _readPropertyDictionary];
    }
    self = v11;
    v9 = self;
  }

  return v9;
}

- (void)terminate
{
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    v3 = VCPLogInstance();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v3, OS_LOG_TYPE_INFO, "VCPClusterer: Terminating ...", buf, 2u);
    }
  }
  [(VCPClusterer *)self _cancelClusteringAndRestoreClusterCache:0];
  [(VCPClusterer *)self cancelAllSuggestionRequests];
  atomic_store(1u, (unsigned __int8 *)&self->_canceled);
  dispatch_group_wait((dispatch_group_t)self->_processingGroup, 0xFFFFFFFFFFFFFFFFLL);
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_INFO, "VCPClusterer: Terminated", v5, 2u);
    }
  }
}

- (void)_processingQueueDetermineNextClusterTriggeringAccumulatedChangesCountIfNecessary
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (!self->_nextClusterTriggeringAccumulatedChangesCount)
  {
    unint64_t v3 = [(VCPPhotosPersistenceDelegate *)self->_persistenceDelegate countOfFaces] / 0xA;
    unint64_t v4 = [(VCPPhotosFaceProcessingContext *)self->_context minFaceCountToTriggerClustering];
    unint64_t v5 = [(VCPPhotosFaceProcessingContext *)self->_context maxFaceCountForClustering];
    if (v3 >= v5) {
      unint64_t v6 = v5;
    }
    else {
      unint64_t v6 = v3;
    }
    if (v4 > v6) {
      unint64_t v6 = v4;
    }
    if (v6 <= 0xA) {
      unint64_t v6 = 10;
    }
    self->_unint64_t nextClusterTriggeringAccumulatedChangesCount = v6;
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      id v7 = VCPLogInstance();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        unint64_t nextClusterTriggeringAccumulatedChangesCount = self->_nextClusterTriggeringAccumulatedChangesCount;
        int v9 = 134217984;
        unint64_t v10 = nextClusterTriggeringAccumulatedChangesCount;
        _os_log_impl(&dword_1BBEDA000, v7, OS_LOG_TYPE_DEBUG, "VCPClusterer: Cluster triggering set to %lu", (uint8_t *)&v9, 0xCu);
      }
    }
  }
}

- (void)scheduleClusteringAfterRemovingFaceCSNs:(id)a3 addingFaceIdStrs:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 count];
  if (v8 || [v6 count])
  {
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      int v9 = VCPLogInstance();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218240;
        uint64_t v21 = [v6 count];
        __int16 v22 = 2048;
        uint64_t v23 = [v7 count];
        _os_log_impl(&dword_1BBEDA000, v9, OS_LOG_TYPE_DEBUG, "VCPClusterer: Scheduling to remove %lu faces and add %lu faces", buf, 0x16u);
      }
    }
    unint64_t v10 = (void *)os_transaction_create();
    processingQueue = self->_processingQueue;
    processingGroup = self->_processingGroup;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __73__VCPClusterer_scheduleClusteringAfterRemovingFaceCSNs_addingFaceIdStrs___block_invoke;
    block[3] = &unk_1E6297410;
    id v15 = v10;
    v16 = self;
    uint64_t v19 = v8;
    id v17 = v6;
    id v18 = v7;
    id v13 = v10;
    dispatch_group_async(processingGroup, processingQueue, block);
  }
}

void __73__VCPClusterer_scheduleClusteringAfterRemovingFaceCSNs_addingFaceIdStrs___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  [*(id *)(a1 + 40) _recordIncrementCountOfPendingFacesToAdd:*(void *)(a1 + 64)];
  [*(id *)(*(void *)(a1 + 40) + 112) unionSet:*(void *)(a1 + 48)];
  [*(id *)(*(void *)(a1 + 40) + 104) unionSet:*(void *)(a1 + 56)];
  uint64_t v3 = [*(id *)(*(void *)(a1 + 40) + 112) count];
  *(void *)(*(void *)(a1 + 40) + 120) = [*(id *)(*(void *)(a1 + 40) + 104) count] + v3;
  [*(id *)(a1 + 40) _processingQueueDetermineNextClusterTriggeringAccumulatedChangesCountIfNecessary];
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    unint64_t v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v5 = [*(id *)(*(void *)(a1 + 40) + 112) count];
      uint64_t v6 = [*(id *)(*(void *)(a1 + 40) + 104) count];
      int v7 = 134218240;
      uint64_t v8 = v5;
      __int16 v9 = 2048;
      uint64_t v10 = v6;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_DEBUG, "VCPClusterer: total remove %lu faces and add %lu faces", (uint8_t *)&v7, 0x16u);
    }
  }
}

- (BOOL)_processingQueuePerformForcedFaceClustering:(BOOL)a3 cancelOrExtendTimeoutBlock:(id)a4
{
  BOOL v4 = a3;
  uint64_t v109 = *MEMORY[0x1E4F143B8];
  v99 = (uint64_t (**)(void))a4;
  unint64_t accumulatedChangesCount = self->_accumulatedChangesCount;
  if ((v4 && accumulatedChangesCount || accumulatedChangesCount >= self->_nextClusterTriggeringAccumulatedChangesCount)
    && (!v99 || (v99[2]() & 1) == 0))
  {
    [(VCPClusterer *)self _recordClusteringState:1];
    self->_unint64_t accumulatedChangesCount = 0;
    [(VCPClusterer *)self _processingQueueDetermineNextClusterTriggeringAccumulatedChangesCountIfNecessary];
    uint64_t v95 = [(NSMutableSet *)self->_faceCSNsToRemove count];
    uint64_t v93 = [(NSMutableSet *)self->_faceIdStrsToAdd count];
    v100 = self;
    if (v93 | v95)
    {
      uint64_t v8 = mach_absolute_time();
      __int16 v9 = VCPSignPostLog();
      os_signpost_id_t v10 = os_signpost_id_generate(v9);

      uint64_t v11 = VCPSignPostLog();
      v12 = v11;
      if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "VCPFaceProcessingClusterFacesCoreAnalyticsCollection", "", buf, 2u);
      }

      id v13 = [(VNClustererBuilder *)v100->_clusterBuilder allClusteredFaceIdsAndReturnError:0];
      uint64_t v92 = [v13 count];

      v14 = VCPSignPostLog();
      id v15 = v14;
      if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v15, OS_SIGNPOST_INTERVAL_END, v10, "VCPFaceProcessingClusterFacesCoreAnalyticsCollection", "", buf, 2u);
      }

      if (v8)
      {
        mach_absolute_time();
        self = v100;
        VCPPerformance_LogMeasurement();
      }
      else
      {
        self = v100;
      }
    }
    else
    {
      uint64_t v92 = 0;
    }
    double Current = CFAbsoluteTimeGetCurrent();
    double v17 = COERCE_DOUBLE([(NSMutableSet *)self->_faceCSNsToRemove count]);
    if (v17 != 0.0)
    {
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        id v18 = VCPLogInstance();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          double v106 = v17;
          _os_log_impl(&dword_1BBEDA000, v18, OS_LOG_TYPE_INFO, "VCPClusterer: Removing %lu faces from cluster cache", buf, 0xCu);
        }

        self = v100;
      }
      double v19 = CFAbsoluteTimeGetCurrent();
      uint64_t v20 = [(NSMutableSet *)self->_faceCSNsToRemove allObjects];
      uint64_t v21 = [(VCPClusterer *)self _faceTorsoprintsFromFaceCSNs:v20];

      __int16 v22 = v100;
      [(NSMutableSet *)v100->_faceCSNsToRemove removeAllObjects];
      [(VCPClusterer *)v100 setClustererBringUpState:60];
      id v102 = 0;
      BOOL v23 = [(VCPClusterer *)v100 _performAndPersistClustersWithFaceTorsoprintsToAdd:0 groupingIdentifiersToAdd:0 faceTorsoprintsToRemove:v21 updatedFaces:0 cancelOrExtendTimeoutBlock:v99 error:&v102];
      double v24 = COERCE_DOUBLE(v102);
      BOOL v25 = v24 == 0.0 && v23;
      if (!v25 && (int)MediaAnalysisLogLevel() >= 3)
      {
        dispatch_group_t v26 = VCPLogInstance();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          double v106 = v24;
          _os_log_impl(&dword_1BBEDA000, v26, OS_LOG_TYPE_ERROR, "VCPClusterer: Failed to cluster(removing) faces - %@", buf, 0xCu);
        }

        __int16 v22 = v100;
      }
      [(VCPClusterer *)v22 setClustererBringUpState:50];
      double v27 = CFAbsoluteTimeGetCurrent();
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        v28 = VCPLogInstance();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134218240;
          double v106 = v17;
          __int16 v107 = 2048;
          double v108 = v27 - v19;
          _os_log_impl(&dword_1BBEDA000, v28, OS_LOG_TYPE_INFO, "VCPClusterer: Removed %lu faces from cluster cache [time: %f secs]", buf, 0x16u);
        }
      }
      self = v100;
    }
    double v29 = COERCE_DOUBLE([(NSMutableSet *)self->_faceIdStrsToAdd count]);
    if (v29 != 0.0)
    {
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        v30 = VCPLogInstance();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          double v106 = v29;
          _os_log_impl(&dword_1BBEDA000, v30, OS_LOG_TYPE_INFO, "VCPClusterer: Adding %lu faces to cluster cache", buf, 0xCu);
        }

        self = v100;
      }
      double v31 = CFAbsoluteTimeGetCurrent();
      persistenceDelegate = self->_persistenceDelegate;
      uint64_t v33 = [(NSMutableSet *)self->_faceIdStrsToAdd allObjects];
      v94 = [(VCPPhotosPersistenceDelegate *)persistenceDelegate deterministicallyOrderedFaceIdentifiersWithLocalIdentifiers:v33 faceprintVersion:[(VCPPhotosFaceProcessingContext *)self->_context processingVersion]];

      v97 = [MEMORY[0x1E4F1CA48] arrayWithArray:v94];
      v34 = v100;
      double v35 = COERCE_DOUBLE([v97 count]);
      double v36 = COERCE_DOUBLE([(NSMutableSet *)v100->_faceIdStrsToAdd count]);
      if (*(void *)&v35 != *(void *)&v36)
      {
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          v37 = VCPLogInstance();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            double v106 = v35;
            __int16 v107 = 2048;
            double v108 = v36;
            _os_log_impl(&dword_1BBEDA000, v37, OS_LOG_TYPE_ERROR, "VCPClusterer: Number of orderedFaceIdentifiers (%lu) != number of _faceIdStrsToAdd (%lu)", buf, 0x16u);
          }

          v34 = v100;
        }
        v38 = [MEMORY[0x1E4F1CAD0] setWithArray:v94];
        uint64_t v39 = [MEMORY[0x1E4F1CA80] setWithSet:v34->_faceIdStrsToAdd];
        [v39 intersectSet:v38];
        v40 = [MEMORY[0x1E4F1CA80] setWithSet:v34->_faceIdStrsToAdd];
        [v40 minusSet:v39];
        [v40 enumerateObjectsUsingBlock:&__block_literal_global_7];

        v34 = v100;
      }
      unint64_t v96 = [(VCPPhotosFaceProcessingContext *)v34->_context maxFaceCountForClustering];
      *(void *)&long long v41 = 138412290;
      long long v91 = v41;
      do
      {
        if (v29 == 0.0) {
          break;
        }
        v42 = (void *)MEMORY[0x1C186D320]();
        if (v99 && (v99[2]() & 1) != 0)
        {
          char v43 = 0;
        }
        else
        {
          v44 = VCPSignPostLog();
          os_signpost_id_t spid = os_signpost_id_generate(v44);

          v45 = VCPSignPostLog();
          v46 = v45;
          if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v45))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v46, OS_SIGNPOST_INTERVAL_BEGIN, spid, "VCPClusteringBatch", "", buf, 2u);
          }

          if ((int)MediaAnalysisLogLevel() >= 7)
          {
            v47 = VCPLogInstance();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
            {
              CFAbsoluteTime v48 = CFAbsoluteTimeGetCurrent();
              *(_DWORD *)buf = 134218240;
              double v106 = v29;
              __int16 v107 = 2048;
              double v108 = v48 - v31;
              _os_log_impl(&dword_1BBEDA000, v47, OS_LOG_TYPE_DEBUG, "VCPClusterer: %lu faces to cluster, already took %f seconds", buf, 0x16u);
            }
          }
          objc_super v49 = v100;
          if (*(void *)&v29 <= v96 + v96 / 5)
          {
            id v53 = v97;
            [(NSMutableSet *)v100->_faceIdStrsToAdd removeAllObjects];
          }
          else
          {
            uint64_t v50 = objc_msgSend(v97, "subarrayWithRange:", 0, v96);
            [v97 removeObjectsInArray:v50];
            faceIdStrsToAdd = v100->_faceIdStrsToAdd;
            v52 = [MEMORY[0x1E4F1CAD0] setWithArray:v50];
            [(NSMutableSet *)faceIdStrsToAdd minusSet:v52];

            id v53 = (id)v50;
            double v29 = *(double *)&v96;
            objc_super v49 = v100;
          }
          if ((int)MediaAnalysisLogLevel() >= 7)
          {
            v54 = VCPLogInstance();
            if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
            {
              double v55 = COERCE_DOUBLE([(NSMutableSet *)v49->_faceIdStrsToAdd count]);
              *(_DWORD *)buf = 134218240;
              double v106 = v29;
              __int16 v107 = 2048;
              double v108 = v55;
              _os_log_impl(&dword_1BBEDA000, v54, OS_LOG_TYPE_DEBUG, "VCPClusterer: %lu faces in current batch, %lu faces remain", buf, 0x16u);
            }

            objc_super v49 = v100;
          }
          double v29 = COERCE_DOUBLE([(NSMutableSet *)v49->_faceIdStrsToAdd count]);
          double v56 = COERCE_DOUBLE([v53 count]);
          v57 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:*(void *)&v56];
          v58 = [MEMORY[0x1E4F1CA48] array];
          v59 = VCPSignPostLog();
          os_signpost_id_t v60 = os_signpost_id_generate(v59);

          v61 = VCPSignPostLog();
          v62 = v61;
          if (v60 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v61))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v62, OS_SIGNPOST_INTERVAL_BEGIN, v60, "VCPClusteringGetFaceObservations", "", buf, 2u);
          }

          v63 = [(VCPClusterer *)v100 _faceTorsoprintsFromFaceIdentifiers:v53 assignClusterSeqNumberIfNeeded:1 updatedFaces:v57 groupingIdentifiers:v58];
          v64 = VCPSignPostLog();
          v65 = v64;
          if (v60 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v64))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v65, OS_SIGNPOST_INTERVAL_END, v60, "VCPClusteringGetFaceObservations", "", buf, 2u);
          }

          double v66 = COERCE_DOUBLE([v63 count]);
          if (*(void *)&v66 != *(void *)&v56 && (int)MediaAnalysisLogLevel() >= 3)
          {
            v67 = VCPLogInstance();
            if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              double v106 = v66;
              __int16 v107 = 2048;
              double v108 = v56;
              _os_log_impl(&dword_1BBEDA000, v67, OS_LOG_TYPE_ERROR, "VCPClusterer: Number of faceTorsoprintsToAdd (%lu) !=  number to cluster (%lu)", buf, 0x16u);
            }
          }
          if (v66 != 0.0)
          {
            [(VCPClusterer *)v100 setClustererBringUpState:60];
            id v101 = 0;
            BOOL v68 = [(VCPClusterer *)v100 _performAndPersistClustersWithFaceTorsoprintsToAdd:v63 groupingIdentifiersToAdd:v58 faceTorsoprintsToRemove:0 updatedFaces:v57 cancelOrExtendTimeoutBlock:v99 error:&v101];
            double v69 = COERCE_DOUBLE(v101);
            BOOL v70 = v69 == 0.0 && v68;
            if (!v70 && (int)MediaAnalysisLogLevel() >= 3)
            {
              v71 = VCPLogInstance();
              if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v91;
                double v106 = v69;
                _os_log_impl(&dword_1BBEDA000, v71, OS_LOG_TYPE_ERROR, "VCPClusterer: Failed to cluster(adding) faces - %@", buf, 0xCu);
              }
            }
            [(VCPClusterer *)v100 _recordCountOfPendingFacesToAdd:*(void *)&v29];
            [(VCPClusterer *)v100 setClustererBringUpState:50];
          }
          if ((int)MediaAnalysisLogLevel() >= 7)
          {
            v72 = VCPLogInstance();
            if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 134217984;
              double v106 = v66;
              _os_log_impl(&dword_1BBEDA000, v72, OS_LOG_TYPE_DEBUG, "VCPClusterer: Added %lu faces to cluster cache", buf, 0xCu);
            }
          }
          v73 = VCPSignPostLog();
          v74 = v73;
          if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v73))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v74, OS_SIGNPOST_INTERVAL_END, spid, "VCPClusteringBatch", "", buf, 2u);
          }

          char v43 = 1;
        }
      }
      while ((v43 & 1) != 0);
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        v75 = VCPLogInstance();
        if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
        {
          CFAbsoluteTime v76 = CFAbsoluteTimeGetCurrent();
          *(_DWORD *)buf = 134217984;
          double v106 = v76 - v31;
          _os_log_impl(&dword_1BBEDA000, v75, OS_LOG_TYPE_INFO, "VCPClusterer: Added faces to cluster cache [time: %f secs]", buf, 0xCu);
        }
      }
      self = v100;
    }
    -[VCPClusterer _recordClusteringState:](self, "_recordClusteringState:", 0, v91);
    if (v93 | v95)
    {
      unint64_t v77 = [(PHPhotoLibrary *)self->_photoLibrary vcp_assetCountForTaskID:3];
      double v78 = CFAbsoluteTimeGetCurrent();
      v79 = +[VCPMADCoreAnalyticsManager sharedManager];
      v103[0] = @"ClusteringSequence";
      v80 = [MEMORY[0x1E4F1C9C8] now];
      v81 = [v80 description];
      v104[0] = v81;
      v103[1] = @"FacesAddToClustering";
      v82 = [NSNumber numberWithUnsignedInteger:v93];
      v104[1] = v82;
      v103[2] = @"FacesRemoveFromClustering";
      v83 = [NSNumber numberWithUnsignedInteger:v95];
      v104[2] = v83;
      v103[3] = @"FacesInClusterBeforeClustering";
      v84 = [NSNumber numberWithUnsignedInteger:v92];
      v104[3] = v84;
      v103[4] = @"ClusteringInterval";
      v85 = [NSNumber numberWithDouble:v78 - Current];
      v104[4] = v85;
      v103[5] = @"TotalAssetCount";
      v86 = [NSNumber numberWithUnsignedInteger:v77];
      v104[5] = v86;
      v103[6] = @"ProcessingQoS";
      qos_class_t v87 = qos_class_self();
      v88 = VCPMAQoSDescription(v87);
      v104[6] = v88;
      v89 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v104 forKeys:v103 count:7];
      [v79 sendEvent:@"com.apple.mediaanalysisd.photos.faceclustering" withAnalytics:v89];
    }
    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

void __87__VCPClusterer__processingQueuePerformForcedFaceClustering_cancelOrExtendTimeoutBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    uint64_t v3 = VCPLogInstance();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 138412290;
      id v5 = v2;
      _os_log_impl(&dword_1BBEDA000, v3, OS_LOG_TYPE_ERROR, "VCPClusterer: missing localIdentifiers : %@", (uint8_t *)&v4, 0xCu);
    }
  }
}

- (unint64_t)numberOfAccumulatedClusterChanges
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  dispatch_group_enter((dispatch_group_t)self->_processingGroup);
  processingQueue = self->_processingQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__VCPClusterer_numberOfAccumulatedClusterChanges__block_invoke;
  v6[3] = &unk_1E6297458;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(processingQueue, v6);
  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __49__VCPClusterer_numberOfAccumulatedClusterChanges__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(void *)(*(void *)(a1 + 32) + 120);
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 32));
}

- (unint64_t)clusteredFaceCount
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  dispatch_group_enter((dispatch_group_t)self->_processingGroup);
  processingQueue = self->_processingQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __34__VCPClusterer_clusteredFaceCount__block_invoke;
  v6[3] = &unk_1E6297458;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(processingQueue, v6);
  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __34__VCPClusterer_clusteredFaceCount__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 144) allClusteredFaceIdsAndReturnError:0];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 count];

  uint64_t v3 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  dispatch_group_leave(v3);
}

- (unint64_t)clusterCount
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  dispatch_group_enter((dispatch_group_t)self->_processingGroup);
  processingQueue = self->_processingQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __28__VCPClusterer_clusterCount__block_invoke;
  v6[3] = &unk_1E6297458;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(processingQueue, v6);
  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __28__VCPClusterer_clusterCount__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 144) getAllClustersAndReturnError:0];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 count];

  uint64_t v3 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  dispatch_group_leave(v3);
}

- (void)clusterIfNecessaryAndWaitWithCancelOrExtendTimeoutBlock:(id)a3
{
  id v4 = a3;
  id v5 = (void *)os_transaction_create();
  dispatch_group_enter((dispatch_group_t)self->_processingGroup);
  processingQueue = self->_processingQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __72__VCPClusterer_clusterIfNecessaryAndWaitWithCancelOrExtendTimeoutBlock___block_invoke;
  v8[3] = &unk_1E6297480;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_sync(processingQueue, v8);
}

void __72__VCPClusterer_clusterIfNecessaryAndWaitWithCancelOrExtendTimeoutBlock___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) needsFullSync] & 1) != 0
    || [*(id *)(a1 + 32) needsUpdate])
  {
    [*(id *)(a1 + 32) _processingQueueSyncClustererWithPhotoLibraryUsingFacesInClusterCache:*(void *)(*(void *)(a1 + 32) + 88) cancelOrExtendTimeoutBlock:*(void *)(a1 + 40)];
  }
  if ([*(id *)(a1 + 32) isReady]) {
    [*(id *)(a1 + 32) _processingQueuePerformForcedFaceClustering:0 cancelOrExtendTimeoutBlock:*(void *)(a1 + 40)];
  }
  id v2 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  dispatch_group_leave(v2);
}

- (void)clusterAndWaitWithCancelOrExtendTimeoutBlock:(id)a3
{
  id v4 = a3;
  id v5 = (void *)os_transaction_create();
  dispatch_group_enter((dispatch_group_t)self->_processingGroup);
  processingQueue = self->_processingQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__VCPClusterer_clusterAndWaitWithCancelOrExtendTimeoutBlock___block_invoke;
  v8[3] = &unk_1E6297480;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_sync(processingQueue, v8);
}

void __61__VCPClusterer_clusterAndWaitWithCancelOrExtendTimeoutBlock___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) needsFullSync] & 1) != 0
    || [*(id *)(a1 + 32) needsUpdate])
  {
    [*(id *)(a1 + 32) _processingQueueSyncClustererWithPhotoLibraryUsingFacesInClusterCache:*(void *)(*(void *)(a1 + 32) + 88) cancelOrExtendTimeoutBlock:*(void *)(a1 + 40)];
  }
  if ([*(id *)(a1 + 32) isReady]) {
    [*(id *)(a1 + 32) _processingQueuePerformForcedFaceClustering:1 cancelOrExtendTimeoutBlock:*(void *)(a1 + 40)];
  }
  id v2 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  dispatch_group_leave(v2);
}

- (void)_cancelClusteringAndRestoreClusterCache:(BOOL)a3
{
  BOOL v3 = a3;
  p_canceled = &self->_canceled;
  atomic_store(1u, (unsigned __int8 *)&self->_canceled);
  [(VNCanceller *)self->_visionCanceler signalCancellation];
  dispatch_group_wait((dispatch_group_t)self->_processingGroup, 0xFFFFFFFFFFFFFFFFLL);
  if (v3)
  {
    atomic_store(0, (unsigned __int8 *)p_canceled);
    clusterBuilder = self->_clusterBuilder;
    self->_clusterBuilder = 0;

    [(VCPClusterer *)self restoreClusterCacheAndSyncWithLibrary:1 cancelOrExtendTimeoutBlock:0 error:0];
  }
}

- (void)cancelClustering
{
}

- (void)_recordClusteringState:(BOOL)a3
{
  [(NSLock *)self->_currentStatusSnapshotLock lock];
  self->_currentStatusSnapshot.isClustering = a3;
  if (!a3) {
    self->_currentStatusSnapshot.rebuildRequired = 0;
  }
  self->_currentStatusSnapshotIsValid = 1;
  currentStatusSnapshotLock = self->_currentStatusSnapshotLock;
  [(NSLock *)currentStatusSnapshotLock unlock];
}

- (void)_recordClusterRebuildRequired:(BOOL)a3
{
  [(NSLock *)self->_currentStatusSnapshotLock lock];
  self->_currentStatusSnapshot.rebuildRequired = a3;
  self->_currentStatusSnapshotIsValid = 1;
  currentStatusSnapshotLock = self->_currentStatusSnapshotLock;
  [(NSLock *)currentStatusSnapshotLock unlock];
}

- (void)_recordCountOfPendingFacesToAdd:(unint64_t)a3
{
  [(NSLock *)self->_currentStatusSnapshotLock lock];
  self->_currentStatusSnapshot.countOfFacesPendingToAdd = a3;
  self->_currentStatusSnapshotIsValid = 1;
  currentStatusSnapshotLock = self->_currentStatusSnapshotLock;
  [(NSLock *)currentStatusSnapshotLock unlock];
}

- (void)_recordIncrementCountOfPendingFacesToAdd:(unint64_t)a3
{
  [(NSLock *)self->_currentStatusSnapshotLock lock];
  *(int64x2_t *)&self->_currentStatusSnapshot.countOfEligibleFaces = vaddq_s64(*(int64x2_t *)&self->_currentStatusSnapshot.countOfEligibleFaces, vdupq_n_s64(a3));
  self->_currentStatusSnapshotIsValid = 1;
  currentStatusSnapshotLock = self->_currentStatusSnapshotLock;
  [(NSLock *)currentStatusSnapshotLock unlock];
}

- (void)_recordCurrentStatus:(id *)a3
{
  [(NSLock *)self->_currentStatusSnapshotLock lock];
  long long v5 = *(_OWORD *)&a3->var0;
  *(void *)&self->_currentStatusSnapshot.isClustering = *(void *)&a3->var2;
  *(_OWORD *)&self->_currentStatusSnapshot.countOfEligibleFaces = v5;
  self->_currentStatusSnapshotIsValid = 1;
  currentStatusSnapshotLock = self->_currentStatusSnapshotLock;
  [(NSLock *)currentStatusSnapshotLock unlock];
}

- (id)status
{
  v14[4] = *MEMORY[0x1E4F143B8];
  [(NSLock *)self->_currentStatusSnapshotLock lock];
  if (self->_currentStatusSnapshotIsValid)
  {
    unint64_t countOfEligibleFaces = self->_currentStatusSnapshot.countOfEligibleFaces;
    unint64_t countOfFacesPendingToAdd = self->_currentStatusSnapshot.countOfFacesPendingToAdd;
    BOOL isClustering = self->_currentStatusSnapshot.isClustering;
    BOOL rebuildRequired = self->_currentStatusSnapshot.rebuildRequired;
    [(NSLock *)self->_currentStatusSnapshotLock unlock];
    v13[0] = @"VCPClusteringStatusIsClustering";
    id v7 = [NSNumber numberWithBool:isClustering];
    v14[0] = v7;
    v13[1] = @"VCPClusteringStatusClusterRebuildRequired";
    uint64_t v8 = [NSNumber numberWithBool:rebuildRequired];
    v14[1] = v8;
    v13[2] = @"VCPClusteringStatusEligibleFacesCount";
    id v9 = [NSNumber numberWithUnsignedInteger:countOfEligibleFaces];
    v14[2] = v9;
    v13[3] = @"VCPClusteringStatusPendingFacesCount";
    uint64_t v10 = [NSNumber numberWithUnsignedInteger:countOfFacesPendingToAdd];
    v14[3] = v10;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:4];
  }
  else
  {
    [(NSLock *)self->_currentStatusSnapshotLock unlock];
    uint64_t v11 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v11;
}

- (BOOL)_performAndPersistClustersWithFaceTorsoprintsToAdd:(id)a3 groupingIdentifiersToAdd:(id)a4 faceTorsoprintsToRemove:(id)a5 updatedFaces:(id)a6 cancelOrExtendTimeoutBlock:(id)a7 error:(id *)a8
{
  v110[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v79 = a4;
  id v80 = a5;
  id v75 = a6;
  v86 = (unsigned int (**)(void))a7;
  double v78 = v12;
  if (![v12 count] && !objc_msgSend(v80, "count")) {
    goto LABEL_84;
  }
  [(VCPClusterer *)self setClustererBringUpState:60];
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v13 = VCPLogInstance();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v13, OS_LOG_TYPE_INFO, "VCPClusterer: Start clustering", buf, 2u);
    }
  }
  *(void *)buf = 0;
  v97 = buf;
  uint64_t v98 = 0x3032000000;
  v99 = __Block_byref_object_copy__2;
  v100 = __Block_byref_object_dispose__2;
  id v101 = 0;
  uint64_t v14 = mach_absolute_time();
  visionCanceler = self->_visionCanceler;
  clusterBuilder = self->_clusterBuilder;
  double v17 = (id *)(v97 + 40);
  id obj = (id)*((void *)v97 + 5);
  unint64_t v77 = [(VNClustererBuilder *)clusterBuilder updateModelByAddingPersons:v12 withGroupingIdentifiers:v79 andRemovingPersons:v80 canceller:visionCanceler error:&obj];
  objc_storeStrong(v17, obj);
  uint64_t v18 = mach_absolute_time();
  uint64_t numer = self->_timebase.numer;
  uint32_t denom = self->_timebase.denom;
  unint64_t v21 = [v77 count];
  unint64_t v22 = v21;
  if (v21) {
    float v23 = (float)((float)((float)((v18 - v14) * numer) / (float)denom) / 1000000.0) / (float)v21;
  }
  else {
    float v23 = 0.0;
  }
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    double v24 = VCPLogInstance();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v104 = 134218240;
      *(void *)&v104[4] = v22;
      *(_WORD *)&v104[12] = 2048;
      *(double *)&v104[14] = v23;
      _os_log_impl(&dword_1BBEDA000, v24, OS_LOG_TYPE_INFO, "VCPClusterer: Finished clustering %lu faces, with normalized %.2f millisecond per face", v104, 0x16u);
    }
  }
  BOOL v25 = (void *)*((void *)v97 + 5);
  if (v25)
  {
    if (a8) {
      *a8 = v25;
    }
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      dispatch_group_t v26 = VCPLogInstance();
      v83 = v26;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        uint64_t v27 = *((void *)v97 + 5);
        *(_DWORD *)v104 = 138412290;
        *(void *)&v104[4] = v27;
        _os_log_impl(&dword_1BBEDA000, v26, OS_LOG_TYPE_ERROR, "VCPClusterer: Vision failed to cluster - %@", v104, 0xCu);
      }
      goto LABEL_24;
    }
LABEL_25:
    int v30 = 1;
    goto LABEL_82;
  }
  if (!v86 || !v86[2]())
  {
    v83 = [MEMORY[0x1E4F1CA60] dictionary];
    v81 = [MEMORY[0x1E4F1CA60] dictionary];
    v82 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v71 = mach_absolute_time();
    double v31 = VCPSignPostLog();
    os_signpost_id_t spid = os_signpost_id_generate(v31);

    v32 = VCPSignPostLog();
    uint64_t v33 = v32;
    if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
    {
      *(_WORD *)v104 = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v33, OS_SIGNPOST_INTERVAL_BEGIN, spid, "VCPVisionFgMapping_Prepare", "", v104, 2u);
    }

    long long v93 = 0u;
    long long v94 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    id v76 = v77;
    uint64_t v34 = [v76 countByEnumeratingWithState:&v91 objects:v108 count:16];
    if (!v34)
    {
LABEL_52:

      uint64_t v50 = VCPSignPostLog();
      v51 = v50;
      if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v50))
      {
        *(_WORD *)v104 = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v51, OS_SIGNPOST_INTERVAL_END, spid, "VCPVisionFgMapping_Prepare", "", v104, 2u);
      }

      if (v71)
      {
        mach_absolute_time();
        VCPPerformance_LogMeasurement();
      }
      if (![v83 count]) {
        goto LABEL_79;
      }
      *(void *)v104 = 0;
      *(void *)&v104[8] = v104;
      *(void *)&v104[16] = 0x2020000000;
      char v105 = 1;
      [(VCPClusterer *)self setClustererBringUpState:70];
      v52 = [MEMORY[0x1E4F1CA80] setWithCapacity:0];
      id v53 = [MEMORY[0x1E4F1CA80] setWithCapacity:0];
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __162__VCPClusterer__performAndPersistClustersWithFaceTorsoprintsToAdd_groupingIdentifiersToAdd_faceTorsoprintsToRemove_updatedFaces_cancelOrExtendTimeoutBlock_error___block_invoke_389;
      aBlock[3] = &unk_1E62974D0;
      aBlock[5] = v104;
      aBlock[4] = self;
      aBlock[6] = buf;
      v54 = _Block_copy(aBlock);
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        double v55 = VCPLogInstance();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)id v102 = 0;
          _os_log_impl(&dword_1BBEDA000, v55, OS_LOG_TYPE_INFO, "VCPClusterer: Start to update database models", v102, 2u);
        }
      }
      persistenceDelegate = self->_persistenceDelegate;
      v57 = (id *)(v97 + 40);
      id v87 = (id)*((void *)v97 + 5);
      BOOL v58 = [(VCPPhotosPersistenceDelegate *)persistenceDelegate persistChangesToAlgorithmicFaceGroups:v83 l1ClustersByFaceCSNRepresentingFaceGroup:v82 l0ClustersByFaceCSNRepresentingFaceGroup:v81 faceCSNByLocalIdentifierForNewlyClusteredFaces:v75 faceCSNsOfUnclusteredFaces:v52 localIdentifiersOfUnclusteredFaces:v53 persistenceCompletionBlock:v54 cancelOrExtendTimeoutBlock:v86 error:&v87];
      objc_storeStrong(v57, v87);
      *(unsigned char *)(*(void *)&v104[8] + 24) = v58;
      if ([v52 count] || objc_msgSend(v53, "count")) {
        [(VCPClusterer *)self scheduleClusteringAfterRemovingFaceCSNs:v52 addingFaceIdStrs:v53];
      }
      int v59 = *(unsigned __int8 *)(*(void *)&v104[8] + 24);
      if (*(unsigned char *)(*(void *)&v104[8] + 24))
      {
        if ((int)MediaAnalysisLogLevel() >= 6)
        {
          os_signpost_id_t v60 = VCPLogInstance();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)id v102 = 0;
            _os_log_impl(&dword_1BBEDA000, v60, OS_LOG_TYPE_INFO, "VCPClusterer: Updated database models", v102, 2u);
          }
        }
      }
      else
      {
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          v61 = VCPLogInstance();
          if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
          {
            uint64_t v62 = *((void *)v97 + 5);
            *(_DWORD *)id v102 = 138412290;
            uint64_t v103 = v62;
            _os_log_impl(&dword_1BBEDA000, v61, OS_LOG_TYPE_ERROR, "VCPClusterer: Failed to persist FaceGroups; will try next time - %@",
              v102,
              0xCu);
          }
        }
        v63 = (void *)MEMORY[0x1E4F1CAD0];
        v64 = [v75 allValues];
        v65 = [v63 setWithArray:v64];
        double v66 = (void *)MEMORY[0x1E4F1CAD0];
        v67 = [v75 allKeys];
        BOOL v68 = [v66 setWithArray:v67];
        [(VCPClusterer *)self scheduleClusteringAfterRemovingFaceCSNs:v65 addingFaceIdStrs:v68];

        if (a8) {
          *a8 = *((id *)v97 + 5);
        }
      }

      _Block_object_dispose(v104, 8);
      if (!v59) {
LABEL_71:
      }
        int v30 = 1;
      else {
LABEL_79:
      }
        int v30 = 0;

      goto LABEL_81;
    }
    uint64_t v35 = *(void *)v92;
    uint64_t v73 = *MEMORY[0x1E4F28760];
    uint64_t v74 = *MEMORY[0x1E4F28568];
LABEL_31:
    uint64_t v36 = 0;
    while (1)
    {
      if (*(void *)v92 != v35) {
        objc_enumerationMutation(v76);
      }
      v37 = *(void **)(*((void *)&v91 + 1) + 8 * v36);
      v38 = (void *)MEMORY[0x1C186D320]();
      if (v86 && v86[2]())
      {
        if (!a8)
        {
          int v42 = 0;
          goto LABEL_47;
        }
        uint64_t v39 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v106 = v74;
        v40 = [NSString stringWithFormat:@"Operation cancelled"];
        __int16 v107 = v40;
        long long v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v107 forKeys:&v106 count:1];
        [v39 errorWithDomain:v73 code:-128 userInfo:v41];
        int v42 = 0;
        *a8 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v40 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v37, "clusterId"));
        long long v41 = [v37 objects];
        if ([v41 count]) {
          [MEMORY[0x1E4F1CAD0] setWithArray:v41];
        }
        else {
        char v43 = [MEMORY[0x1E4F1CAD0] set];
        }
        [v83 setObject:v43 forKey:v40];
        if ((int)MediaAnalysisLogLevel() >= 7)
        {
          v44 = VCPLogInstance();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v45 = [v41 count];
            *(_DWORD *)v104 = 134217984;
            *(void *)&v104[4] = v45;
            _os_log_impl(&dword_1BBEDA000, v44, OS_LOG_TYPE_DEBUG, "[VisionFgMapping] Preparing Vision Clusters (size: %ld) to Photos FaceGroup", v104, 0xCu);
          }
        }
        v46 = [MEMORY[0x1E4F1CA80] set];
        [v82 setObject:v46 forKey:v40];
        v47 = -[VCPClusterer level0ClusterAsFaceCSNsByLevel0KeyFaceCSNForClusterIdentifiedByFaceCSN:error:](self, "level0ClusterAsFaceCSNsByLevel0KeyFaceCSNForClusterIdentifiedByFaceCSN:error:", [v40 longValue], 0);
        [v81 setObject:v47 forKeyedSubscript:v40];
        v89[0] = MEMORY[0x1E4F143A8];
        v89[1] = 3221225472;
        v89[2] = __162__VCPClusterer__performAndPersistClustersWithFaceTorsoprintsToAdd_groupingIdentifiersToAdd_faceTorsoprintsToRemove_updatedFaces_cancelOrExtendTimeoutBlock_error___block_invoke;
        v89[3] = &unk_1E62974A8;
        id v48 = v46;
        id v90 = v48;
        [v47 enumerateKeysAndObjectsUsingBlock:v89];

        int v42 = 1;
      }

LABEL_47:
      if (!v42)
      {

        goto LABEL_71;
      }
      if (v34 == ++v36)
      {
        uint64_t v49 = [v76 countByEnumeratingWithState:&v91 objects:v108 count:16];
        uint64_t v34 = v49;
        if (!v49) {
          goto LABEL_52;
        }
        goto LABEL_31;
      }
    }
  }
  if (!a8) {
    goto LABEL_25;
  }
  v28 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v109 = *MEMORY[0x1E4F28568];
  v83 = [NSString stringWithFormat:@"Operation cancelled"];
  v110[0] = v83;
  double v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v110 forKeys:&v109 count:1];
  *a8 = [v28 errorWithDomain:*MEMORY[0x1E4F28760] code:-128 userInfo:v29];

LABEL_24:
  int v30 = 1;
LABEL_81:

LABEL_82:
  _Block_object_dispose(buf, 8);

  if (!v30)
  {
LABEL_84:
    BOOL v69 = 1;
    goto LABEL_85;
  }
  BOOL v69 = 0;
LABEL_85:

  return v69;
}

void __162__VCPClusterer__performAndPersistClustersWithFaceTorsoprintsToAdd_groupingIdentifiersToAdd_faceTorsoprintsToRemove_updatedFaces_cancelOrExtendTimeoutBlock_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  BOOL v3 = *(void **)(a1 + 32);
  id v4 = [a3 array];
  objc_msgSend(v3, "addObjectsFromArray:");
}

void __162__VCPClusterer__performAndPersistClustersWithFaceTorsoprintsToAdd_groupingIdentifiersToAdd_faceTorsoprintsToRemove_updatedFaces_cancelOrExtendTimeoutBlock_error___block_invoke_389(void *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)a1[4];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v3 + 40);
  char v4 = [v2 _processingQueueSaveClusterCache:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v4;
  if (!*(unsigned char *)(*(void *)(a1[5] + 8) + 24) && (int)MediaAnalysisLogLevel() >= 3)
  {
    long long v5 = VCPLogInstance();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(*(void *)(a1[6] + 8) + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v9 = v6;
      _os_log_impl(&dword_1BBEDA000, v5, OS_LOG_TYPE_ERROR, "VCPClusterer: Failed to save cluster cache - %@", buf, 0xCu);
    }
  }
}

- (id)_faceTorsoprintsFromFaceCSNs:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  char v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = objc_alloc(MEMORY[0x1E4F45800]);
        uint64_t v11 = objc_msgSend(v10, "initWithFaceprint:torsoprint:", 0, 0, (void)v13);
        objc_msgSend(v11, "setPersonId:", objc_msgSend(v9, "integerValue"));
        [v4 addObject:v11];
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v4;
}

- (id)_faceTorsoprintsFromFaceIdentifiers:(id)a3 assignClusterSeqNumberIfNeeded:(BOOL)a4 updatedFaces:(id)a5 groupingIdentifiers:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  long long v13 = (void *)MEMORY[0x1C186D320]();
  long long v14 = [(VCPPhotosPersistenceDelegate *)self->_persistenceDelegate facesForClusteringWithLocalIdentifiers:v10 faceprintVersion:[(VCPPhotosFaceProcessingContext *)self->_context processingVersion] groupingIdentifiers:v12];
  long long v15 = [(VCPClusterer *)self _faceTorsoprintsFromFaces:v14 assignClusterSeqNumberIfNeeded:v8 updatedFaces:v11];

  return v15;
}

- (id)_faceTorsoprintsFromFaces:(id)a3 assignClusterSeqNumberIfNeeded:(BOOL)a4 updatedFaces:(id)a5
{
  BOOL v26 = a4;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v24 = a5;
  id v25 = [MEMORY[0x1E4F1CA48] array];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v6;
  uint64_t v7 = [obj countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v7)
  {
    uint64_t v29 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v32 != v29) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        id v10 = (void *)MEMORY[0x1C186D320]();
        id v11 = [v9 imageprintWrapper];
        if ([v11 type])
        {
          if ((int)MediaAnalysisLogLevel() < 3) {
            goto LABEL_28;
          }
          id v12 = VCPLogInstance();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            uint64_t v13 = [v11 type];
            *(_DWORD *)buf = 134217984;
            uint64_t v36 = v13;
            _os_log_impl(&dword_1BBEDA000, v12, OS_LOG_TYPE_ERROR, "VCPClusterer: Cannot cluster image print type %lu", buf, 0xCu);
          }
        }
        else
        {
          id v12 = [v11 data];
          if (v12)
          {
            id v30 = 0;
            long long v14 = +[VCPVNImageprintWrapper generateVNImageprintWithType:0 archiveData:v12 andError:&v30];
            long long v15 = v30;
            if (v14)
            {
              uint64_t v16 = [v9 clusterSequenceNumber];
              uint64_t nextSeqNum = v16;
              if (v26 && !v16)
              {
                uint64_t nextSeqNum = self->_nextSeqNum;
                self->_uint64_t nextSeqNum = nextSeqNum + 1;
                [v9 setClusterSequenceNumber:nextSeqNum];
                uint64_t v18 = [NSNumber numberWithInteger:nextSeqNum];
                double v19 = [v9 localIdentifier];
                [v24 setObject:v18 forKeyedSubscript:v19];
              }
              if (nextSeqNum >= 1)
              {
                [v14 setPersonId:nextSeqNum];
                [v25 addObject:v14];
                if (self->_nextSeqNum <= nextSeqNum) {
                  self->_uint64_t nextSeqNum = nextSeqNum + 1;
                }
              }
            }
            else if ((int)MediaAnalysisLogLevel() >= 6)
            {
              unint64_t v21 = VCPLogInstance();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
              {
                unint64_t v22 = [v9 localIdentifier];
                *(_DWORD *)buf = 138412546;
                uint64_t v36 = (uint64_t)v22;
                __int16 v37 = 2112;
                v38 = v15;
                _os_log_impl(&dword_1BBEDA000, v21, OS_LOG_TYPE_INFO, "VCPClusterer: Failed to get VNFaceTorsoprint from face %@ - %@", buf, 0x16u);
              }
            }

LABEL_26:
            goto LABEL_27;
          }
          if ((int)MediaAnalysisLogLevel() >= 6)
          {
            long long v15 = VCPLogInstance();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              uint64_t v20 = [v9 localIdentifier];
              *(_DWORD *)buf = 138412290;
              uint64_t v36 = (uint64_t)v20;
              _os_log_impl(&dword_1BBEDA000, v15, OS_LOG_TYPE_INFO, "VCPClusterer: Missing faceprint data for face %@", buf, 0xCu);
            }
            goto LABEL_26;
          }
        }
LABEL_27:

LABEL_28:
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v7);
  }

  return v25;
}

- (void)_removeEmptyGroups
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  persistenceDelegate = self->_persistenceDelegate;
  id v7 = 0;
  BOOL v3 = [(VCPPhotosPersistenceDelegate *)persistenceDelegate deleteEmptyGroupsAndReturnError:&v7];
  id v4 = v7;
  if (v4) {
    BOOL v5 = 0;
  }
  else {
    BOOL v5 = v3;
  }
  if (!v5 && (int)MediaAnalysisLogLevel() >= 3)
  {
    id v6 = VCPLogInstance();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = v4;
      _os_log_impl(&dword_1BBEDA000, v6, OS_LOG_TYPE_ERROR, "VCPClusterer: Failed to remove empty FaceGroup(s) - %@", buf, 0xCu);
    }
  }
}

- (void)_processingQueueQuickSyncClustererWithPhotoLibraryUsingFacesInClusterCache:(id)a3 visionClusters:(id *)a4 cancelOrExtendTimeoutBlock:(id)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  BOOL v8 = (uint64_t (**)(void))a5;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v9 = VCPLogInstance();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v9, OS_LOG_TYPE_INFO, "VCPClusterer: Start quick-syncing cluster cache with library", buf, 2u);
    }
  }
  double Current = CFAbsoluteTimeGetCurrent();
  unint64_t v11 = [v7 count];
  persistenceDelegate = self->_persistenceDelegate;
  id v35 = 0;
  BOOL v13 = [(VCPPhotosPersistenceDelegate *)persistenceDelegate cleanupUngroupedFacesWithNonZeroClusterSequenceNumbers:v8 error:&v35];
  id v14 = v35;
  if (v14) {
    BOOL v15 = 0;
  }
  else {
    BOOL v15 = v13;
  }
  if (!v15 && (int)MediaAnalysisLogLevel() >= 3)
  {
    uint64_t v16 = VCPLogInstance();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      double v37 = *(double *)&v14;
      _os_log_impl(&dword_1BBEDA000, v16, OS_LOG_TYPE_ERROR, "VCPClusterer: Failed to clean faces with valid CSN but not in any FaceGroup - %@", buf, 0xCu);
    }
  }
  if (v8 && (v8[2](v8) & 1) != 0)
  {
    id v17 = v14;
    goto LABEL_47;
  }
  uint64_t v18 = self->_persistenceDelegate;
  id v34 = v14;
  BOOL v19 = [(VCPPhotosPersistenceDelegate *)v18 cleanupGroupedFacesWithClusterSequenceNumberSetToZero:v8 error:&v34];
  id v17 = v34;

  if (v17) {
    BOOL v20 = 0;
  }
  else {
    BOOL v20 = v19;
  }
  if (!v20 && (int)MediaAnalysisLogLevel() >= 3)
  {
    unint64_t v21 = VCPLogInstance();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      double v37 = *(double *)&v17;
      _os_log_impl(&dword_1BBEDA000, v21, OS_LOG_TYPE_ERROR, "VCPClusterer: Failed to clean faces with CSN = 0 but found in any FaceGroup - %@", buf, 0xCu);
    }
  }
  if (!v8 || (v8[2](v8) & 1) == 0)
  {
    unint64_t v22 = [(VCPPhotosPersistenceDelegate *)self->_persistenceDelegate countOfClusteredFaces];
    if (v11 >= v22)
    {
      if (!v11 || (float v27 = (float)(v11 - v22) / (float)v11, v27 <= 0.1))
      {
        uint64_t v31 = 40;
        goto LABEL_43;
      }
      if ((int)MediaAnalysisLogLevel() < 6)
      {
LABEL_37:
        if (self->_timestampOfLastClusterComparison)
        {
          v28 = [MEMORY[0x1E4F1C9C8] date];
          [v28 timeIntervalSinceDate:self->_timestampOfLastClusterComparison];
          BOOL v30 = v29 < 10080.0;

          if (v30) {
            uint64_t v31 = 40;
          }
          else {
            uint64_t v31 = 10;
          }
        }
        else
        {
          uint64_t v31 = 10;
        }
LABEL_43:
        [(VCPClusterer *)self setClustererBringUpState:v31];
        if ((int)MediaAnalysisLogLevel() >= 6)
        {
          long long v32 = VCPLogInstance();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            CFAbsoluteTime v33 = CFAbsoluteTimeGetCurrent();
            *(_DWORD *)buf = 134217984;
            double v37 = v33 - Current;
            _os_log_impl(&dword_1BBEDA000, v32, OS_LOG_TYPE_INFO, "VCPClusterer: Finished quick-syncing cluster cache with library. Elapsed time: %f", buf, 0xCu);
          }
        }
        goto LABEL_47;
      }
      float v23 = VCPLogInstance();
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
LABEL_36:

        goto LABEL_37;
      }
      *(_DWORD *)buf = 134217984;
      double v37 = (float)(v27 * 100.0);
      id v24 = "VCPClusterer: Quick-syncing cluster cache with library, found > 10%% (%5.2f) difference in the number of fac"
            "es that are in the cluster cache versus library";
      id v25 = v23;
      uint32_t v26 = 12;
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() < 6) {
        goto LABEL_37;
      }
      float v23 = VCPLogInstance();
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_INFO)) {
        goto LABEL_36;
      }
      *(_DWORD *)buf = 134218240;
      double v37 = *(double *)&v11;
      __int16 v38 = 2048;
      unint64_t v39 = v22;
      id v24 = "VCPClusterer: Number of clustered faces in the cluster cache (%lu) < number of clustered faces in the library (%lu)";
      id v25 = v23;
      uint32_t v26 = 22;
    }
    _os_log_impl(&dword_1BBEDA000, v25, OS_LOG_TYPE_INFO, v24, buf, v26);
    goto LABEL_36;
  }
LABEL_47:
}

- (void)_processingQueueSyncClustererWithPhotoLibraryUsingFacesInClusterCache:(id)a3 cancelOrExtendTimeoutBlock:(id)a4
{
  uint64_t v137 = *MEMORY[0x1E4F143B8];
  id v108 = a3;
  id v6 = (unsigned int (**)(void))a4;
  id v7 = v6;
  if (!v6 || !v6[2](v6))
  {
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      id v9 = VCPLogInstance();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v9, OS_LOG_TYPE_INFO, "VCPClusterer: Start syncing cluster cache with library ...", buf, 2u);
      }
    }
    if (self->_clustererBringUpState)
    {
      BOOL v8 = 0;
      if (!v7) {
        goto LABEL_23;
      }
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        uint64_t v10 = VCPLogInstance();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          id v11 = [(VCPClusterer *)self _bringUpStateDescription:self->_clustererBringUpState];
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v11;
          _os_log_impl(&dword_1BBEDA000, v10, OS_LOG_TYPE_INFO, "VCPClusterer: Syncing cluster cache with library - %@", buf, 0xCu);
        }
      }
      id v132 = 0;
      [(VCPClusterer *)self _processingQueueQuickSyncClustererWithPhotoLibraryUsingFacesInClusterCache:v108 visionClusters:&v132 cancelOrExtendTimeoutBlock:v7];
      BOOL v8 = v132;
      if (!v7) {
        goto LABEL_23;
      }
    }
    if (v7[2](v7))
    {
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        id v12 = VCPLogInstance();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&uint8_t buf[4] = 1;
          _os_log_impl(&dword_1BBEDA000, v12, OS_LOG_TYPE_DEBUG, "VCPClusterer: Canceled syncing cluster cache [point: %d]", buf, 8u);
        }
      }
      goto LABEL_214;
    }
LABEL_23:
    if (self->_clustererBringUpState != 10)
    {
      int v106 = 1;
      goto LABEL_36;
    }
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      BOOL v13 = VCPLogInstance();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        id v14 = [(VCPClusterer *)self _bringUpStateDescription:self->_clustererBringUpState];
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v14;
        _os_log_impl(&dword_1BBEDA000, v13, OS_LOG_TYPE_INFO, "VCPClusterer: Syncing cluster cache with library - %@", buf, 0xCu);
      }
    }
    if (v8)
    {
      id v15 = 0;
    }
    else
    {
      BOOL v8 = [MEMORY[0x1E4F1CA48] array];
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        long long v32 = VCPLogInstance();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BBEDA000, v32, OS_LOG_TYPE_DEBUG, "VCPClusterer: Retrieving clusters from cluster cache ...", buf, 2u);
        }
      }
      id v131 = 0;
      BOOL v33 = [(VCPClusterer *)self _processingQueueGetVisionClusters:v8 minimumClusterSize:1 returnClusterAsCountedSet:1 excludedL0ClustersByL1ClusterId:0 cancelOrExtendTimeoutBlock:v7 error:&v131];
      id v15 = v131;
      if (!v33)
      {
        if ((int)MediaAnalysisLogLevel() >= 3)
        {
          uint64_t v16 = VCPLogInstance();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v15;
            id v17 = "VCPClusterer: Failed to retrieve clusters from cluster cache - %@";
            uint64_t v18 = v16;
            os_log_type_t v19 = OS_LOG_TYPE_ERROR;
            uint32_t v20 = 12;
            goto LABEL_112;
          }
LABEL_113:
        }
LABEL_114:

        goto LABEL_214;
      }
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        id v34 = VCPLogInstance();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1BBEDA000, v34, OS_LOG_TYPE_DEBUG, "VCPClusterer: Retrieved clusters from cluster cache", buf, 2u);
        }
      }
    }
    if (v7 && v7[2](v7))
    {
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        uint64_t v16 = VCPLogInstance();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&uint8_t buf[4] = 1;
          id v17 = "VCPClusterer: Canceled syncing cluster cache [point: %d]";
          uint64_t v18 = v16;
          os_log_type_t v19 = OS_LOG_TYPE_DEBUG;
          uint32_t v20 = 8;
LABEL_112:
          _os_log_impl(&dword_1BBEDA000, v18, v19, v17, buf, v20);
          goto LABEL_113;
        }
        goto LABEL_113;
      }
      goto LABEL_114;
    }

    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v28 = VCPLogInstance();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v28, OS_LOG_TYPE_DEBUG, "VCPClusterer: Retrieving clusters from library ...", buf, 2u);
      }
    }
    persistenceDelegate = self->_persistenceDelegate;
    id v130 = 0;
    BOOL v30 = [(VCPPhotosPersistenceDelegate *)persistenceDelegate groupedClusterSequenceNumbersOfFacesInFaceGroupsOfMinimumSize:1 error:&v130];
    id v107 = v130;
    if (v107)
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        uint64_t v31 = VCPLogInstance();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v107;
          _os_log_impl(&dword_1BBEDA000, v31, OS_LOG_TYPE_ERROR, "VCPClusterer: Failed to retrieve clusters from library - %@", buf, 0xCu);
        }
      }
      goto LABEL_214;
    }
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      id v35 = VCPLogInstance();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BBEDA000, v35, OS_LOG_TYPE_DEBUG, "VCPClusterer: Retrieved clusters from library", buf, 2u);
      }
    }
    v97 = [MEMORY[0x1E4F1CA48] array];
    unint64_t v96 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v95 = [MEMORY[0x1E4F28BD0] set];
    id v101 = [MEMORY[0x1E4F28BD0] set];
    v127[0] = MEMORY[0x1E4F143A8];
    v127[1] = 3221225472;
    v127[2] = __113__VCPClusterer__processingQueueSyncClustererWithPhotoLibraryUsingFacesInClusterCache_cancelOrExtendTimeoutBlock___block_invoke;
    v127[3] = &unk_1E62974F8;
    id v105 = v97;
    id v128 = v105;
    id v104 = v95;
    id v129 = v104;
    [v8 enumerateObjectsUsingBlock:v127];
    v124[0] = MEMORY[0x1E4F143A8];
    v124[1] = 3221225472;
    v124[2] = __113__VCPClusterer__processingQueueSyncClustererWithPhotoLibraryUsingFacesInClusterCache_cancelOrExtendTimeoutBlock___block_invoke_2;
    v124[3] = &unk_1E62974F8;
    id v36 = v96;
    id v125 = v36;
    id v37 = v101;
    id v126 = v37;
    [v30 enumerateObjectsUsingBlock:v124];

    v122[0] = MEMORY[0x1E4F143A8];
    v122[1] = 3221225472;
    v122[2] = __113__VCPClusterer__processingQueueSyncClustererWithPhotoLibraryUsingFacesInClusterCache_cancelOrExtendTimeoutBlock___block_invoke_4;
    v122[3] = &unk_1E6297540;
    id v123 = &__block_literal_global_396;
    [v105 sortUsingComparator:v122];
    v120[0] = MEMORY[0x1E4F143A8];
    v120[1] = 3221225472;
    v120[2] = __113__VCPClusterer__processingQueueSyncClustererWithPhotoLibraryUsingFacesInClusterCache_cancelOrExtendTimeoutBlock___block_invoke_5;
    v120[3] = &unk_1E6297540;
    id v121 = &__block_literal_global_396;
    [v36 sortUsingComparator:v120];
    if (v7 && v7[2](v7))
    {
      if ((int)MediaAnalysisLogLevel() < 7)
      {
        char v39 = 0;
        int v106 = 1;
LABEL_213:

        BOOL v8 = 0;
        if ((v39 & 1) == 0) {
          goto LABEL_214;
        }
LABEL_36:
        if (v7 && v7[2](v7))
        {
          if ((int)MediaAnalysisLogLevel() >= 7)
          {
            unint64_t v21 = VCPLogInstance();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)&uint8_t buf[4] = v106;
              _os_log_impl(&dword_1BBEDA000, v21, OS_LOG_TYPE_DEBUG, "VCPClusterer: Canceled syncing cluster cache [point: %d]", buf, 8u);
            }
          }
          goto LABEL_214;
        }
        if (self->_clustererBringUpState != 20) {
          goto LABEL_84;
        }
        if ((int)MediaAnalysisLogLevel() >= 6)
        {
          unint64_t v22 = VCPLogInstance();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            id v23 = [(VCPClusterer *)self _bringUpStateDescription:self->_clustererBringUpState];
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v23;
            _os_log_impl(&dword_1BBEDA000, v22, OS_LOG_TYPE_INFO, "VCPClusterer: Syncing cluster cache with library - %@", buf, 0xCu);
          }
        }
        id v113 = 0;
        BOOL v24 = [(VCPClusterer *)self _processingQueueResetClusterCache:&v113];
        id v25 = v113;
        if (v24)
        {
          [(VCPClusterer *)self setClustererBringUpState:30];
          if ((int)MediaAnalysisLogLevel() >= 7)
          {
            uint32_t v26 = VCPLogInstance();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
            {
              id v27 = [(VCPClusterer *)self _bringUpStateDescription:self->_clustererBringUpState];
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v27;
              _os_log_impl(&dword_1BBEDA000, v26, OS_LOG_TYPE_DEBUG, "VCPClusterer: Successfully reset cluster cache - %@", buf, 0xCu);
            }
LABEL_82:
          }
        }
        else if ((int)MediaAnalysisLogLevel() >= 3)
        {
          uint32_t v26 = VCPLogInstance();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            id v41 = [(VCPClusterer *)self _bringUpStateDescription:self->_clustererBringUpState];
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = v41;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v25;
            _os_log_impl(&dword_1BBEDA000, v26, OS_LOG_TYPE_ERROR, "VCPClusterer: Failed to reset cluster cache - %@ - %@", buf, 0x16u);
          }
          goto LABEL_82;
        }

LABEL_84:
        if (v7 && v7[2](v7))
        {
          if ((int)MediaAnalysisLogLevel() >= 7)
          {
            int v42 = VCPLogInstance();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)&uint8_t buf[4] = v106;
              _os_log_impl(&dword_1BBEDA000, v42, OS_LOG_TYPE_DEBUG, "VCPClusterer: Canceled syncing cluster cache [point: %d]", buf, 8u);
            }
          }
        }
        else
        {
          if (self->_clustererBringUpState == 30)
          {
            if ((int)MediaAnalysisLogLevel() >= 6)
            {
              char v43 = VCPLogInstance();
              if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
              {
                id v44 = [(VCPClusterer *)self _bringUpStateDescription:self->_clustererBringUpState];
                *(_DWORD *)buf = 138412290;
                *(void *)&uint8_t buf[4] = v44;
                _os_log_impl(&dword_1BBEDA000, v43, OS_LOG_TYPE_INFO, "VCPClusterer: Syncing cluster cache with library - %@", buf, 0xCu);
              }
            }
            if ((int)MediaAnalysisLogLevel() >= 6)
            {
              uint64_t v45 = VCPLogInstance();
              if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1BBEDA000, v45, OS_LOG_TYPE_INFO, "VCPClusterer: Deleting FaceGroups and reset CSN of all previously clustered faces", buf, 2u);
              }
            }
            v46 = 0;
            int v47 = 1;
            while (1)
            {
              id v48 = self->_persistenceDelegate;
              id v112 = v46;
              BOOL v49 = [(VCPPhotosPersistenceDelegate *)v48 resetLibraryClustersWithCancelOrExtendTimeoutBlock:v7 error:&v112];
              id v50 = v112;

              v46 = v50;
              if (v7)
              {
                if (v7[2](v7)) {
                  break;
                }
              }
              if (v49) {
                goto LABEL_142;
              }
              if ((int)MediaAnalysisLogLevel() >= 7)
              {
                v51 = VCPLogInstance();
                if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 67109376;
                  *(_DWORD *)&uint8_t buf[4] = v47;
                  *(_WORD *)&uint8_t buf[8] = 1024;
                  *(_DWORD *)&buf[10] = 3;
                  _os_log_impl(&dword_1BBEDA000, v51, OS_LOG_TYPE_DEBUG, "VCPClusterer: Retry deleting FaceGroups and reset CSN of all previously clustered faces. Attempt %d of %d.", buf, 0xEu);
                }
              }
              if (++v47 == 4) {
                goto LABEL_147;
              }
            }
            if ((int)MediaAnalysisLogLevel() >= 7)
            {
              BOOL v69 = VCPLogInstance();
              if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 67109120;
                *(_DWORD *)&uint8_t buf[4] = v106;
                _os_log_impl(&dword_1BBEDA000, v69, OS_LOG_TYPE_DEBUG, "VCPClusterer: Canceled syncing cluster cache [point: %d do loop]", buf, 8u);
              }
            }
            if (!v49)
            {
LABEL_147:
              if ((int)MediaAnalysisLogLevel() >= 3)
              {
                uint64_t v71 = VCPLogInstance();
                if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  *(void *)&uint8_t buf[4] = v50;
                  _os_log_impl(&dword_1BBEDA000, v71, OS_LOG_TYPE_ERROR, "VCPClusterer: Failed to delete face groups and reset CSN of all previously clustered faces - %@", buf, 0xCu);
                }
              }
              goto LABEL_151;
            }
LABEL_142:
            if ((int)MediaAnalysisLogLevel() >= 7)
            {
              BOOL v70 = VCPLogInstance();
              if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1BBEDA000, v70, OS_LOG_TYPE_DEBUG, "VCPClusterer: Deleted FaceGroups and reset CSN of all previously clustered faces", buf, 2u);
              }
            }
            [(VCPClusterer *)self setClustererBringUpState:40];
LABEL_151:
          }
          if (!v7 || !v7[2](v7))
          {
            if (self->_clustererBringUpState == 40)
            {
              if ((int)MediaAnalysisLogLevel() >= 6)
              {
                uint64_t v73 = VCPLogInstance();
                if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
                {
                  id v74 = [(VCPClusterer *)self _bringUpStateDescription:self->_clustererBringUpState];
                  *(_DWORD *)buf = 138412290;
                  *(void *)&uint8_t buf[4] = v74;
                  _os_log_impl(&dword_1BBEDA000, v73, OS_LOG_TYPE_INFO, "VCPClusterer: Syncing cluster cache with library - %@", buf, 0xCu);
                }
              }
              id v75 = [(VCPPhotosPersistenceDelegate *)self->_persistenceDelegate unclusteredClusteringEligibleFaceLocalIdentifiers:0];
              if ([v75 count]) {
                [(NSMutableSet *)self->_faceIdStrsToAdd unionSet:v75];
              }
              uint64_t v76 = [(NSMutableSet *)self->_faceIdStrsToAdd count];
              if (v76 && (int)MediaAnalysisLogLevel() >= 7)
              {
                unint64_t v77 = VCPLogInstance();
                if (os_log_type_enabled(v77, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 134217984;
                  *(void *)&uint8_t buf[4] = v76;
                  _os_log_impl(&dword_1BBEDA000, v77, OS_LOG_TYPE_DEBUG, "VCPClusterer: Schedule adding %lu faces to the cluster state", buf, 0xCu);
                }
              }
              double v78 = self->_persistenceDelegate;
              id v111 = 0;
              id v79 = [(VCPPhotosPersistenceDelegate *)v78 invalidFaceClusterSequenceNumbersInClusterSequenceNumbers:v108 cancelOrExtendTimeoutBlock:v7 error:&v111];
              id v80 = v111;
              if (v79)
              {
                [(NSMutableSet *)self->_faceCSNsToRemove unionSet:v79];
              }
              else if ((int)MediaAnalysisLogLevel() >= 4)
              {
                v81 = VCPLogInstance();
                if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1BBEDA000, v81, OS_LOG_TYPE_DEFAULT, "VCPClusterer: Failed to get faces that are no longer present in the library", buf, 2u);
                }
              }
              if (v7 && v7[2](v7))
              {
                if ((int)MediaAnalysisLogLevel() >= 7)
                {
                  v82 = VCPLogInstance();
                  if (os_log_type_enabled(v82, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 67109120;
                    *(_DWORD *)&uint8_t buf[4] = v106;
                    _os_log_impl(&dword_1BBEDA000, v82, OS_LOG_TYPE_DEBUG, "VCPClusterer: Canceled syncing cluster cache [point: %d]", buf, 8u);
                  }
                }
                goto LABEL_214;
              }
              uint64_t v83 = [(NSMutableSet *)self->_faceCSNsToRemove count];
              if (v83 && (int)MediaAnalysisLogLevel() >= 7)
              {
                v84 = VCPLogInstance();
                if (os_log_type_enabled(v84, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 134217984;
                  *(void *)&uint8_t buf[4] = v83;
                  _os_log_impl(&dword_1BBEDA000, v84, OS_LOG_TYPE_DEBUG, "VCPClusterer: Schedule removing %lu faces from the cluster state", buf, 0xCu);
                }
              }
              self->_unint64_t accumulatedChangesCount = v83 + v76;
              [(VCPClusterer *)self setClustererBringUpState:50];
              v109[0] = [(VCPPhotosPersistenceDelegate *)self->_persistenceDelegate countOfClusteringEligibleFaces];
              v109[1] = v76;
              __int16 v110 = 0;
              [(VCPClusterer *)self _recordCurrentStatus:v109];
            }
            if ((int)MediaAnalysisLogLevel() >= 6)
            {
              v85 = VCPLogInstance();
              if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
              {
                id v86 = [(VCPClusterer *)self _bringUpStateDescription:self->_clustererBringUpState];
                *(_DWORD *)buf = 138412290;
                *(void *)&uint8_t buf[4] = v86;
                _os_log_impl(&dword_1BBEDA000, v85, OS_LOG_TYPE_INFO, "VCPClusterer: Finished syncing cluster cache with library - %@", buf, 0xCu);
              }
            }
            goto LABEL_214;
          }
          if ((int)MediaAnalysisLogLevel() >= 7)
          {
            v72 = VCPLogInstance();
            if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)&uint8_t buf[4] = v106;
              _os_log_impl(&dword_1BBEDA000, v72, OS_LOG_TYPE_DEBUG, "VCPClusterer: Canceled syncing cluster cache [point: %d]", buf, 8u);
            }
          }
        }
LABEL_214:

        goto LABEL_215;
      }
      __int16 v38 = VCPLogInstance();
      v100 = v38;
      if (!os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
      {
        int v106 = 1;
        char v39 = 0;
        goto LABEL_212;
      }
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = 1;
      _os_log_impl(&dword_1BBEDA000, v38, OS_LOG_TYPE_DEBUG, "VCPClusterer: Canceled syncing cluster cache [point: %d]", buf, 8u);
      char v39 = 0;
      int v40 = 2;
LABEL_211:
      int v106 = v40;
LABEL_212:

      goto LABEL_213;
    }
    v52 = VCPCompareLibraryClustersWithVisionClusters(v36, v105);
    v100 = v52;
    v99 = (void *)[v104 mutableCopy];
    [v99 minusSet:v37];
    uint64_t v103 = (void *)[v37 mutableCopy];
    [v103 minusSet:v104];
    id v102 = [MEMORY[0x1E4F28BD0] set];
    *(void *)buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x2020000000;
    uint64_t v136 = 0;
    uint64_t v53 = [v52 count];
    uint64_t v54 = [v103 count];
    double v55 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v37, "count") + objc_msgSend(v36, "count"));
    uint64_t v98 = v55;
    if (v53)
    {
      uint64_t v94 = v54;
      double v56 = [v52 objectForKeyedSubscript:@"VisionClustersMinusLibraryClusters"];
      double v57 = COERCE_DOUBLE([v56 count]);
      if (v57 != 0.0)
      {
        v118[0] = MEMORY[0x1E4F143A8];
        v118[1] = 3221225472;
        v118[2] = __113__VCPClusterer__processingQueueSyncClustererWithPhotoLibraryUsingFacesInClusterCache_cancelOrExtendTimeoutBlock___block_invoke_397;
        v118[3] = &unk_1E6297568;
        id v119 = v102;
        [v56 enumerateObjectsUsingBlock:v118];
        if ((int)MediaAnalysisLogLevel() >= 7)
        {
          BOOL v58 = VCPLogInstance();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)v133 = 134217984;
            double v134 = v57;
            _os_log_impl(&dword_1BBEDA000, v58, OS_LOG_TYPE_DEBUG, "VCPClusterer: Syncing cluster cache with library, found %lu non-singleton clusters in the cluster cache that do not match those in the library", v133, 0xCu);
          }
        }
      }
      int v59 = [v52 objectForKeyedSubscript:@"LibraryClustersMinusVisionClusters"];
      double v60 = COERCE_DOUBLE([v59 count]);
      if (v60 != 0.0)
      {
        v117[0] = MEMORY[0x1E4F143A8];
        v117[1] = 3221225472;
        v117[2] = __113__VCPClusterer__processingQueueSyncClustererWithPhotoLibraryUsingFacesInClusterCache_cancelOrExtendTimeoutBlock___block_invoke_398;
        v117[3] = &unk_1E6297590;
        v117[4] = buf;
        [v59 enumerateObjectsUsingBlock:v117];
        if ((int)MediaAnalysisLogLevel() >= 7)
        {
          v61 = VCPLogInstance();
          if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)v133 = 134217984;
            double v134 = v60;
            _os_log_impl(&dword_1BBEDA000, v61, OS_LOG_TYPE_DEBUG, "VCPClusterer: Syncing cluster cache with library, found %lu clusters in the library cache that do not match those in the cluster cache", v133, 0xCu);
          }
        }
      }
      unint64_t v62 = [(VCPPhotosPersistenceDelegate *)self->_persistenceDelegate countOfClusteredFaces];
      unint64_t v63 = [v108 count];
      if (v62 <= v63) {
        unint64_t v64 = v63;
      }
      else {
        unint64_t v64 = v62;
      }
      if (v64)
      {
        uint64_t v65 = *(void *)(*(void *)&buf[8] + 24);
        float v66 = (float)(unint64_t)([v102 count] + v65) / (float)v64;
        if (v66 > 0.2)
        {
          if ((int)MediaAnalysisLogLevel() >= 7)
          {
            v67 = VCPLogInstance();
            if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)v133 = 134217984;
              double v134 = (float)(v66 * 100.0);
              _os_log_impl(&dword_1BBEDA000, v67, OS_LOG_TYPE_DEBUG, "VCPClusterer: Syncing cluster cache with library, found > 20%% (%5.2f) difference in the number of faces are in the cluster cache versus library", v133, 0xCu);
            }
          }
          double v55 = v98;
          uint64_t v68 = 20;
          goto LABEL_208;
        }
      }
      [(NSMutableSet *)self->_faceCSNsToRemove unionSet:v102];
      if (v60 != 0.0) {
        [v98 addObjectsFromArray:v59];
      }

      double v55 = v98;
      uint64_t v54 = v94;
    }
    if ([v99 count]) {
      [(NSMutableSet *)self->_faceCSNsToRemove unionSet:v99];
    }
    if (v54)
    {
      v115[0] = MEMORY[0x1E4F143A8];
      v115[1] = 3221225472;
      v115[2] = __113__VCPClusterer__processingQueueSyncClustererWithPhotoLibraryUsingFacesInClusterCache_cancelOrExtendTimeoutBlock___block_invoke_399;
      v115[3] = &unk_1E62975B8;
      id v116 = v55;
      [v103 enumerateObjectsUsingBlock:v115];
    }
    if ([v55 count])
    {
      id v87 = self->_persistenceDelegate;
      id v114 = 0;
      BOOL v88 = [(VCPPhotosPersistenceDelegate *)v87 ungroupFaceClusterSequenceNumbers:v55 batchSizeForUnclusteringFaces:500 cancelOrExtendTimeoutBlock:v7 error:&v114];
      double v89 = COERCE_DOUBLE(v114);
      if (!v88 && (int)MediaAnalysisLogLevel() >= 3)
      {
        id v90 = VCPLogInstance();
        if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v133 = 138412290;
          double v134 = v89;
          _os_log_impl(&dword_1BBEDA000, v90, OS_LOG_TYPE_ERROR, "VCPClusterer: Failed to ungroup faces - %@", v133, 0xCu);
        }

        double v55 = v98;
      }
      [(VCPClusterer *)self _removeEmptyGroups];

      if (!v88)
      {
        uint64_t v68 = 40;
        goto LABEL_210;
      }
    }
    long long v91 = [MEMORY[0x1E4F1C9C8] date];
    timestampOfLastClusterComparison = self->_timestampOfLastClusterComparison;
    self->_timestampOfLastClusterComparison = v91;

    long long v93 = NSNumber;
    [(NSDate *)self->_timestampOfLastClusterComparison timeIntervalSinceReferenceDate];
    double v56 = objc_msgSend(v93, "numberWithDouble:");
    [(VCPClusterer *)self _setPropertyDictionaryValue:v56 forKey:@"VCPClusterCompareTimestamp"];
    uint64_t v68 = 40;
LABEL_208:

LABEL_210:
    [(VCPClusterer *)self setClustererBringUpState:v68];

    _Block_object_dispose(buf, 8);
    char v39 = 1;
    int v40 = 1;
    goto LABEL_211;
  }
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    BOOL v8 = VCPLogInstance();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = 1;
      _os_log_impl(&dword_1BBEDA000, v8, OS_LOG_TYPE_DEBUG, "VCPClusterer: Canceled syncing cluster cache [point: %d]", buf, 8u);
    }
    goto LABEL_214;
  }
LABEL_215:
}

void __113__VCPClusterer__processingQueueSyncClustererWithPhotoLibraryUsingFacesInClusterCache_cancelOrExtendTimeoutBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((unint64_t)[v3 count] < 2) {
    [*(id *)(a1 + 40) unionSet:v3];
  }
  else {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

void __113__VCPClusterer__processingQueueSyncClustererWithPhotoLibraryUsingFacesInClusterCache_cancelOrExtendTimeoutBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((unint64_t)[v3 count] < 2) {
    [*(id *)(a1 + 40) unionSet:v3];
  }
  else {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

uint64_t __113__VCPClusterer__processingQueueSyncClustererWithPhotoLibraryUsingFacesInClusterCache_cancelOrExtendTimeoutBlock___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  unint64_t v5 = [a2 count];
  unint64_t v6 = [v4 count];
  if (v5 > v6) {
    uint64_t v7 = -1;
  }
  else {
    uint64_t v7 = v5 < v6;
  }

  return v7;
}

uint64_t __113__VCPClusterer__processingQueueSyncClustererWithPhotoLibraryUsingFacesInClusterCache_cancelOrExtendTimeoutBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __113__VCPClusterer__processingQueueSyncClustererWithPhotoLibraryUsingFacesInClusterCache_cancelOrExtendTimeoutBlock___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __113__VCPClusterer__processingQueueSyncClustererWithPhotoLibraryUsingFacesInClusterCache_cancelOrExtendTimeoutBlock___block_invoke_397(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) unionSet:a2];
}

void __113__VCPClusterer__processingQueueSyncClustererWithPhotoLibraryUsingFacesInClusterCache_cancelOrExtendTimeoutBlock___block_invoke_398(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += [v3 count];
}

void __113__VCPClusterer__processingQueueSyncClustererWithPhotoLibraryUsingFacesInClusterCache_cancelOrExtendTimeoutBlock___block_invoke_399(uint64_t a1, uint64_t a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [MEMORY[0x1E4F28BD0] setWithObject:a2];
  objc_msgSend(v2, "addObject:");
}

- (BOOL)_processingQueueGetFaceClusterSequenceNumbersInClusterCache:(id *)a3 lastClusterSequenceNumber:(unint64_t *)a4 error:(id *)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (void *)MEMORY[0x1C186D320](self, a2);
  clusterBuilder = self->_clusterBuilder;
  id v29 = 0;
  id v9 = [(VNClustererBuilder *)clusterBuilder allClusteredFaceIdsAndReturnError:&v29];
  id v10 = v29;
  if (!v10)
  {
    if (!v9)
    {
      id v9 = [MEMORY[0x1E4F1CAD0] set];
    }
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v15 = v9;
    a5 = 0;
    uint64_t v18 = [v15 countByEnumeratingWithState:&v25 objects:v38 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v26 != v19) {
            objc_enumerationMutation(v15);
          }
          unint64_t v21 = (id *)[*(id *)(*((void *)&v25 + 1) + 8 * i) unsignedIntegerValue];
          if (v21 > a5) {
            a5 = v21;
          }
        }
        uint64_t v18 = [v15 countByEnumeratingWithState:&v25 objects:v38 count:16];
      }
      while (v18);
    }
    id v9 = v15;
    goto LABEL_20;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    id v11 = VCPLogInstance();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v35 = @"VCPClusterer: Failed to get face CSNs from cluster cache, which should not be used";
      __int16 v36 = 2112;
      id v37 = v10;
      _os_log_impl(&dword_1BBEDA000, v11, OS_LOG_TYPE_ERROR, "%@ - %@", buf, 0x16u);
    }
  }
  if (a5)
  {
    id v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v32 = *MEMORY[0x1E4F28568];
    BOOL v13 = NSString;
    uint64_t v14 = *MEMORY[0x1E4F28A50];
    v30[0] = v32;
    v30[1] = v14;
    v31[0] = @"VCPClusterer: Failed to get face CSNs from cluster cache, which should not be used";
    v31[1] = v10;
    id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:2];
    uint64_t v16 = [v13 stringWithFormat:@"PVErrorInvalidClusterCacheFile - %@", v15];
    BOOL v33 = v16;
    id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
    *a5 = [v12 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v17];

    a5 = 0;
LABEL_20:
  }
  if (!v10)
  {
    *a3 = v9;
    *a4 = (unint64_t)a5;
  }

  return v10 == 0;
}

- (BOOL)_processingQueueSaveClusterCache:(id *)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = [(VCPClusterer *)self clustererBringUpState];
  if (v4 != 90 && v4 != 70)
  {
    uint64_t v14 = 0;
    goto LABEL_11;
  }
  clusterBuilder = self->_clusterBuilder;
  id v51 = 0;
  unint64_t v6 = [(VNClustererBuilder *)clusterBuilder saveAndReturnCurrentModelState:&v51];
  id v7 = v51;
  if (v7)
  {
    BOOL v8 = v7;
    id v9 = [NSString stringWithFormat:@"VCPClusterer: Failed to get Vision cluster state - %@", v7];
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      id v10 = VCPLogInstance();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        buf.A = 138412290;
        *(void *)&buf.B = v9;
        _os_log_impl(&dword_1BBEDA000, v10, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&buf, 0xCu);
      }
    }
    if (a3)
    {
      id v11 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v58 = *MEMORY[0x1E4F28568];
      id v12 = [NSString stringWithFormat:@"%@", v9];
      int v59 = v12;
      BOOL v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v59 forKeys:&v58 count:1];
      *a3 = [v11 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v13];
    }
    goto LABEL_34;
  }
  id v9 = (NSSet *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
  [(NSSet *)v9 encodeObject:v6 forKey:@"VisionClusterState"];
  [(NSSet *)v9 encodeObject:self->_clusteringType forKey:@"clusteringType"];
  [(NSSet *)v9 encodeObject:self->_threshold forKey:@"threshold"];
  [(NSSet *)v9 finishEncoding];
  unint64_t v21 = self->_cacheFileUrl;
  int v22 = open([(NSURL *)self->_cacheFileUrl fileSystemRepresentation], 0);
  if ((v22 & 0x80000000) == 0)
  {
    uint64_t v23 = _tempCacheFileUrlFromCacheFileUrl(v21);

    unint64_t v21 = (NSURL *)v23;
    close(v22);
  }
  BOOL v24 = v21;
  int v25 = open([(NSURL *)v24 fileSystemRepresentation], 1537, 438);
  if (v25 < 0)
  {

    BOOL v8 = 0;
LABEL_34:

LABEL_35:
    BOOL v20 = 0;
    goto LABEL_36;
  }
  strcpy((char *)__buf, "CLST");
  int v49 = 3;
  *(void *)md = 0;
  uint64_t v57 = 0;
  id v26 = [(NSSet *)v9 encodedData];
  long long v27 = (char *)[v26 bytes];
  unint64_t v28 = [v26 length];
  CC_MD5_Init(&buf);
  for (; v28; v28 -= v29)
  {
    if (v28 >= 0x4000) {
      uint64_t v29 = 0x4000;
    }
    else {
      uint64_t v29 = v28;
    }
    CC_MD5_Update(&buf, v27, v29);
    v27 += v29;
  }
  CC_MD5_Final(md, &buf);
  write(v25, __buf, 4uLL);
  write(v25, &v49, 4uLL);
  write(v25, md, 0x10uLL);
  id v30 = v26;
  write(v25, (const void *)[v30 bytes], objc_msgSend(v30, "length"));
  if (close(v25))
  {
    uint64_t v31 = [NSString stringWithFormat:@"VCPClusterer: Failed to write cluster snapshot to file '%@'", v24];
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      uint64_t v32 = VCPLogInstance();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        buf.A = 138412290;
        *(void *)&buf.B = v31;
        _os_log_impl(&dword_1BBEDA000, v32, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&buf, 0xCu);
      }
    }
    if (!a3) {
      goto LABEL_42;
    }
    BOOL v33 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v52 = *MEMORY[0x1E4F28568];
    id v34 = [NSString stringWithFormat:@"%@", v31];
    uint64_t v53 = v34;
    id v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v53 forKeys:&v52 count:1];
    *a3 = [v33 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v35];
  }
  else
  {
    if (v22 < 0)
    {
      BOOL v44 = 1;
      goto LABEL_43;
    }
    id v37 = [(NSURL *)v24 path];
    __int16 v38 = (const std::__fs::filesystem::path *)[v37 fileSystemRepresentation];
    id v39 = [(NSURL *)self->_cacheFileUrl path];
    int v40 = (const std::__fs::filesystem::path *)[v39 fileSystemRepresentation];
    rename(v38, v40, v41);
    int v43 = v42;

    BOOL v44 = v43 == 0;
    if (!a3 || !v43) {
      goto LABEL_43;
    }
    uint64_t v45 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v54 = *MEMORY[0x1E4F28568];
    uint64_t v31 = [NSString stringWithFormat:@"VCPClusterer: Failed to rename file from '%@' to '%@'. Error = %d", v24, self->_cacheFileUrl, *__error()];
    double v55 = v31;
    id v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v55 forKeys:&v54 count:1];
    *a3 = [v45 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v34];
  }

LABEL_42:
  BOOL v44 = 0;
LABEL_43:

  if (!v44)
  {
    BOOL v8 = 0;
    goto LABEL_35;
  }
  uint64_t v14 = v6;
LABEL_11:
  faceCSNsInClusterCache = self->_faceCSNsInClusterCache;
  self->_faceCSNsInClusterCache = 0;

  if ([v14 length]) {
    [(VCPClusterer *)self _removeVisionClusterCacheFilesNotReferencedByVisionClusterState:v14];
  }
  *(void *)&buf.A = 0;
  id v47 = 0;
  id v48 = 0;
  BOOL v16 = [(VCPClusterer *)self _processingQueueGetFaceClusterSequenceNumbersInClusterCache:&v48 lastClusterSequenceNumber:&buf error:&v47];
  id v9 = (NSSet *)v48;
  id v17 = v47;
  BOOL v8 = v17;
  if (!v16)
  {
    if (a3) {
      *a3 = v17;
    }
    unint64_t v6 = v14;
    goto LABEL_34;
  }
  uint64_t v18 = self->_faceCSNsInClusterCache;
  self->_faceCSNsInClusterCache = v9;
  uint64_t v19 = v9;

  self->_uint64_t nextSeqNum = *(void *)&buf.A + 1;
  [(VCPClusterer *)self setClustererBringUpState:50];
  BOOL v20 = 1;
  unint64_t v6 = v14;
LABEL_36:

  return v20;
}

- (id)_visionClusterMemmapFileInCacheDirectoryURL:(id)a3 clusterState:(id)a4 error:(id *)a5
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    id v9 = (void *)MEMORY[0x1E4F45718];
    id v10 = [v7 path];
    a5 = [v9 clustererModelFileNamesFromState:v8 storedInPath:v10 error:a5];
  }
  else if (a5)
  {
    id v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = *MEMORY[0x1E4F28568];
    id v12 = [NSString stringWithFormat:@"missing parameter clusterState"];
    v16[0] = v12;
    BOOL v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    *a5 = [v11 errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:v13];

    a5 = 0;
  }

  return a5;
}

- (BOOL)_processingQueueRestoreClusteringCacheWithCacheDirectoryURL:(id)a3 clusterState:(id)a4 threshold:(id)a5 error:(id *)a6
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v32 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (objc_class *)objc_opt_class();
  uint64_t v12 = VCPMAGetRevisionForVisionModel(v11, [(VCPPhotosFaceProcessingContext *)self->_context processingVersion]);
  BOOL v13 = (objc_class *)objc_opt_class();
  uint64_t v14 = VCPMAGetRevisionForVisionModel(v13, [(VCPPhotosFaceProcessingContext *)self->_context processingVersion]);
  id v15 = objc_alloc(MEMORY[0x1E4F45710]);
  BOOL v16 = [v32 path];
  [v10 floatValue];
  id v17 = objc_msgSend(v15, "initWithType:cachePath:state:threshold:torsoThreshold:requestRevision:torsoprintRequestRevision:", *MEMORY[0x1E4F45BB0], v16, v9, v12, v14);

  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    uint64_t v18 = VCPLogInstance();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      int v19 = [(VCPPhotosFaceProcessingContext *)self->_context processingVersion];
      id v30 = [v17 type];
      BOOL v20 = [v17 cachePath];
      uint64_t v21 = [v17 requestRevision];
      [v17 threshold];
      float v23 = v22;
      uint64_t v24 = [v17 torsoprintRequestRevision];
      [v17 torsoThreshold];
      *(_DWORD *)CC_MD5_CTX buf = 67110658;
      int v34 = v19;
      __int16 v35 = 2112;
      __int16 v36 = v30;
      __int16 v37 = 2112;
      __int16 v38 = v20;
      __int16 v39 = 2048;
      uint64_t v40 = v21;
      __int16 v41 = 2048;
      double v42 = v23;
      __int16 v43 = 2048;
      uint64_t v44 = v24;
      __int16 v45 = 2048;
      double v46 = v25;
      _os_log_impl(&dword_1BBEDA000, v18, OS_LOG_TYPE_DEBUG, "Creating VNClustererBuilder with context.processingVersion:%d, type: %@, cachePath: %@, faceprintRequestRevision-%lu threshold-%.2f, torsoprintRequestRevision-%lu threshold-%.2f", buf, 0x44u);
    }
  }
  uint64_t v26 = [MEMORY[0x1E4F45708] clustererBuilderWithOptions:v17 error:a6];
  clusterBuilder = self->_clusterBuilder;
  p_clusterBuilder = &self->_clusterBuilder;
  *p_clusterBuilder = (VNClustererBuilder *)v26;

  LOBYTE(p_clusterBuilder) = *p_clusterBuilder != 0;
  return (char)p_clusterBuilder;
}

- (BOOL)_processingQueueResetClusterCache:(id *)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    unint64_t v5 = VCPLogInstance();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)CC_MD5_CTX buf = 0;
      _os_log_impl(&dword_1BBEDA000, v5, OS_LOG_TYPE_INFO, "VCPClusterer: Started resetting cluster cache ... ", buf, 2u);
    }
  }
  clusterBuilder = self->_clusterBuilder;
  self->_clusterBuilder = 0;

  id v7 = objc_opt_class();
  cacheDirUrl = self->_cacheDirUrl;
  id v25 = 0;
  char v9 = [v7 removeClusteringStateCacheWithURL:cacheDirUrl error:&v25];
  id v10 = v25;
  if ((v9 & 1) == 0)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      id v11 = VCPLogInstance();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)CC_MD5_CTX buf = 138412290;
        id v27 = v10;
        _os_log_impl(&dword_1BBEDA000, v11, OS_LOG_TYPE_ERROR, "VCPClusterer: Failed to remove all cluster cache files - %@", buf, 0xCu);
      }
    }
    id v10 = 0;
  }
  uint64_t v12 = self->_cacheDirUrl;
  threshold = self->_threshold;
  id v24 = v10;
  BOOL v14 = [(VCPClusterer *)self _processingQueueRestoreClusteringCacheWithCacheDirectoryURL:v12 clusterState:0 threshold:threshold error:&v24];
  id v15 = v24;

  id v16 = v15;
  if (v14)
  {
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      id v17 = VCPLogInstance();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)CC_MD5_CTX buf = 0;
        _os_log_impl(&dword_1BBEDA000, v17, OS_LOG_TYPE_INFO, "VCPClusterer: Created a new cluster cache", buf, 2u);
      }
    }
    [(VCPClusterer *)self setClustererBringUpState:90];
    id v23 = v15;
    BOOL v18 = [(VCPClusterer *)self _processingQueueSaveClusterCache:&v23];
    id v19 = v23;

    if (v18)
    {
      if ((int)MediaAnalysisLogLevel() < 6)
      {
        BOOL v21 = 1;
        goto LABEL_31;
      }
      BOOL v20 = VCPLogInstance();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)CC_MD5_CTX buf = 0;
        _os_log_impl(&dword_1BBEDA000, v20, OS_LOG_TYPE_INFO, "VCPClusterer: Finished resetting cluster cache", buf, 2u);
      }
      BOOL v21 = 1;
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() < 3)
      {
        BOOL v21 = 0;
        goto LABEL_31;
      }
      BOOL v20 = VCPLogInstance();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)CC_MD5_CTX buf = 138412290;
        id v27 = v19;
        _os_log_impl(&dword_1BBEDA000, v20, OS_LOG_TYPE_ERROR, "VCPClusterer: Failed to save a new cluster cache - %@", buf, 0xCu);
      }
      BOOL v21 = 0;
    }
    goto LABEL_30;
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    BOOL v20 = VCPLogInstance();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)CC_MD5_CTX buf = 138412290;
      id v27 = v15;
      _os_log_impl(&dword_1BBEDA000, v20, OS_LOG_TYPE_ERROR, "VCPClusterer: Failed to create a new cluster cache - %@", buf, 0xCu);
    }
    BOOL v21 = 0;
    id v19 = v16;
LABEL_30:

    goto LABEL_31;
  }
  BOOL v21 = 0;
  id v19 = v16;
LABEL_31:
  if (a3 && v19) {
    *a3 = v19;
  }

  return v21;
}

- (id)_visionClusterStateDataBlobFromClusterSnapshotFileAtURL:(id)a3 error:(id *)a4
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  unint64_t v6 = (const char *)[v5 fileSystemRepresentation];
  int v7 = open(v6, 0);
  int v8 = v7;
  if ((v7 & 0x80000000) == 0)
  {
    unint64_t v9 = lseek(v7, 0, 2);
    if (v9 > 0x17)
    {
      __CC_MD5_CTX buf = 0;
      uint64_t v61 = 0;
      uint64_t v62 = 0;
      uint64_t md = 0;
      uint64_t v60 = 0;
      ssize_t v20 = pread(v8, (char *)&__buf + 4, 4uLL, 0);
      v21.i32[0] = HIDWORD(__buf);
      if (vmovn_s16((int16x8_t)vmovl_u8(v21)).u32[0] == 1414745155 && v20 == 4)
      {
        if (pread(v8, &__buf, 4uLL, 4) == 4 && __buf == 3)
        {
          if (pread(v8, &v61, 0x10uLL, 8) == 16)
          {
            lseek(v8, 24, 0);
            id v27 = malloc_type_malloc(0x4000uLL, 0xF507287CuLL);
            if (!v27) {
              goto LABEL_39;
            }
            CC_MD5_Init(&buf);
            size_t v28 = v9 - 24;
            if (v28)
            {
              unint64_t v29 = v28;
              while (1)
              {
                uint64_t v30 = v29 >= 0x4000 ? 0x4000 : v29;
                if (read(v8, v27, 0x4000uLL) != v30) {
                  break;
                }
                CC_MD5_Update(&buf, v27, v30);
                v29 -= v30;
                if (!v29) {
                  goto LABEL_25;
                }
              }
              if ((int)MediaAnalysisLogLevel() >= 4)
              {
                int v34 = VCPLogInstance();
                if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)uint64_t v65 = 134217984;
                  uint64_t v66 = v30;
                  _os_log_impl(&dword_1BBEDA000, v34, OS_LOG_TYPE_DEFAULT, "VCPClusterer - _calculateChecksumMD5ForFile: error reading %zu bytes from file", v65, 0xCu);
                }
              }
              close(v8);
              char v31 = 0;
            }
            else
            {
LABEL_25:
              char v31 = 1;
            }
            CC_MD5_Final((unsigned __int8 *)&md, &buf);
            free(v27);
            if (v31)
            {
              if (md == v61 && v60 == v62)
              {
                __int16 v39 = malloc_type_malloc(v28, 0x43BB1ABuLL);
                if (pread(v8, v39, v28, 24) == v28)
                {
                  id v19 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v39 length:v28 freeWhenDone:1];
                  if (v19)
                  {
                    BOOL v13 = 0;
                    goto LABEL_42;
                  }
                  __int16 v41 = (void *)MEMORY[0x1E4F28C58];
                  uint64_t v45 = *MEMORY[0x1E4F28568];
                  id v24 = objc_msgSend(NSString, "stringWithFormat:", @"VCPClusterer: Failed to read vision cluster state blob from '%s'", v6);
                  double v46 = v24;
                  id v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v46 forKeys:&v45 count:1];
                  uint64_t v26 = [v41 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v25];
                }
                else
                {
                  free(v39);
                  uint64_t v40 = (void *)MEMORY[0x1E4F28C58];
                  uint64_t v47 = *MEMORY[0x1E4F28568];
                  id v24 = objc_msgSend(NSString, "stringWithFormat:", @"VCPClusterer: Failed to read size of vision cluster state blob from '%s'", v6);
                  id v48 = v24;
                  id v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v48 forKeys:&v47 count:1];
                  uint64_t v26 = [v40 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v25];
                }
              }
              else
              {
                __int16 v36 = (void *)MEMORY[0x1E4F28C58];
                uint64_t v49 = *MEMORY[0x1E4F28568];
                id v24 = objc_msgSend(NSString, "stringWithFormat:", @"VCPClusterer: Failed MD5 check for '%s'", v6);
                id v50 = v24;
                id v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v50 forKeys:&v49 count:1];
                uint64_t v26 = [v36 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v25];
              }
            }
            else
            {
LABEL_39:
              __int16 v37 = (void *)MEMORY[0x1E4F28C58];
              uint64_t v51 = *MEMORY[0x1E4F28568];
              id v24 = objc_msgSend(NSString, "stringWithFormat:", @"VCPClusterer: Failed to compute MD5 of '%s'", v6);
              uint64_t v52 = v24;
              id v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v52 forKeys:&v51 count:1];
              uint64_t v26 = [v37 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v25];
            }
          }
          else
          {
            BOOL v33 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v53 = *MEMORY[0x1E4F28568];
            id v24 = objc_msgSend(NSString, "stringWithFormat:", @"VCPClusterer: Failed to read MD5 from header of '%s'", v6);
            uint64_t v54 = v24;
            id v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v54 forKeys:&v53 count:1];
            uint64_t v26 = [v33 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v25];
          }
        }
        else
        {
          id v32 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v55 = *MEMORY[0x1E4F28568];
          id v24 = [NSString stringWithFormat:@"VCPClusterer: Invalid version in '%s', %d != %d", v6, __buf, 3];
          double v56 = v24;
          id v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v56 forKeys:&v55 count:1];
          uint64_t v26 = [v32 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v25];
        }
      }
      else
      {
        id v23 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v57 = *MEMORY[0x1E4F28568];
        id v24 = objc_msgSend(NSString, "stringWithFormat:", @"VCPClusterer: Invalid magic number found in '%s'", v6);
        uint64_t v58 = v24;
        id v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v58 forKeys:&v57 count:1];
        uint64_t v26 = [v23 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v25];
      }
      BOOL v13 = (void *)v26;
    }
    else
    {
      id v10 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v63 = *MEMORY[0x1E4F28568];
      id v11 = objc_msgSend(NSString, "stringWithFormat:", @"VCPClusterer: Cluster snapshot file '%s' is too small", v6);
      unint64_t v64 = v11;
      uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v64 forKeys:&v63 count:1];
      BOOL v13 = [v10 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v12];
    }
    id v19 = 0;
LABEL_42:
    close(v8);
    goto LABEL_43;
  }
  BOOL v14 = objc_msgSend(NSString, "stringWithFormat:", @"VCPClusterer: Failed to open cluster cache file '%s'", v6);
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    id v15 = VCPLogInstance();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      buf.A = 138412290;
      *(void *)&buf.B = v14;
      _os_log_impl(&dword_1BBEDA000, v15, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&buf, 0xCu);
    }
  }
  id v16 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v43 = *MEMORY[0x1E4F28568];
  id v17 = [NSString stringWithFormat:@"%@", v14];
  uint64_t v44 = v17;
  BOOL v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
  BOOL v13 = [v16 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v18];

  id v19 = 0;
LABEL_43:
  if (a4) {
    *a4 = v13;
  }

  return v19;
}

- (void)_removeVisionClusterCacheFilesNotReferencedByVisionClusterState:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  cacheDirUrl = self->_cacheDirUrl;
  v31[1] = 0;
  id v23 = v4;
  id v25 = -[VCPClusterer _visionClusterMemmapFileInCacheDirectoryURL:clusterState:error:](self, "_visionClusterMemmapFileInCacheDirectoryURL:clusterState:error:", cacheDirUrl);
  id v6 = 0;
  if (v6 && (int)MediaAnalysisLogLevel() >= 3)
  {
    int v7 = VCPLogInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)CC_MD5_CTX buf = 0;
      _os_log_impl(&dword_1BBEDA000, v7, OS_LOG_TYPE_ERROR, "VCPClusterer: Failed to get old vision cluster cache filenames from vision cluster state", buf, 2u);
    }
  }
  int v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  unint64_t v9 = self->_cacheDirUrl;
  v31[0] = v6;
  id v24 = v8;
  id v10 = [v8 contentsOfDirectoryAtURL:v9 includingPropertiesForKeys:0 options:1 error:v31];
  id v11 = v31[0];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v27 objects:v36 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v28 != v14) {
          objc_enumerationMutation(v12);
        }
        id v16 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        id v17 = [v16 pathExtension];
        if (![v17 isEqualToString:@"cmap"])
        {
          id v21 = v11;
LABEL_18:

          goto LABEL_19;
        }
        BOOL v18 = [v16 lastPathComponent];
        char v19 = [v25 containsObject:v18];

        if (v19) {
          continue;
        }
        id v26 = v11;
        char v20 = [v24 removeItemAtURL:v16 error:&v26];
        id v21 = v26;

        if ((v20 & 1) == 0 && (int)MediaAnalysisLogLevel() >= 3)
        {
          id v17 = VCPLogInstance();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            float v22 = [v16 path];
            *(_DWORD *)CC_MD5_CTX buf = 138412546;
            BOOL v33 = v22;
            __int16 v34 = 2112;
            id v35 = v21;
            _os_log_impl(&dword_1BBEDA000, v17, OS_LOG_TYPE_ERROR, "VCPClusterer: Failed to remove cluster mmap file at '%@' - %@", buf, 0x16u);
          }
          goto LABEL_18;
        }
LABEL_19:
        id v11 = v21;
      }
      uint64_t v13 = [v12 countByEnumeratingWithState:&v27 objects:v36 count:16];
    }
    while (v13);
  }
}

- (BOOL)_processingQueueRestoreFromClusterSnapshotFileAtURL:(id)a3 error:(id *)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v30[1] = 0;
  id v24 = a3;
  id v5 = -[VCPClusterer _visionClusterStateDataBlobFromClusterSnapshotFileAtURL:error:](self, "_visionClusterStateDataBlobFromClusterSnapshotFileAtURL:error:");
  id v6 = 0;
  if (!v5)
  {
    BOOL v15 = 0;
    goto LABEL_23;
  }
  v30[0] = 0;
  id v29 = v6;
  int v7 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v5 error:&v29];
  id v8 = v29;

  if (v7)
  {
    unint64_t v9 = [v7 decodeObjectOfClass:objc_opt_class() forKey:@"CVMLClusterState"];
    id v10 = [v7 decodeObjectOfClass:objc_opt_class() forKey:@"clusteringType"];
    id v11 = [v7 decodeObjectOfClass:objc_opt_class() forKey:@"threshold"];
    int v12 = [v10 isEqualToString:@"CVMLClusteringAlgorithm_Greedy"];
    uint64_t v13 = (void *)MEMORY[0x1E4F45BA8];
    if (v12)
    {
      id v14 = (id)*MEMORY[0x1E4F45BA8];

      if (v9) {
        goto LABEL_10;
      }
    }
    else
    {
      id v14 = v10;
      if (v9) {
        goto LABEL_10;
      }
    }
    unint64_t v9 = [v7 decodeObjectOfClass:objc_opt_class() forKey:@"VisionClusterState"];
LABEL_10:
    [v7 finishDecoding];
    if (v11)
    {
      if (!v9) {
        goto LABEL_17;
      }
    }
    else
    {
      id v11 = (void *)[(NSNumber *)self->_threshold copy];
      if (!v9)
      {
LABEL_17:
        id v16 = 0;
        goto LABEL_18;
      }
    }
    if ([v14 isEqualToString:*v13])
    {
      id v17 = [v24 URLByDeletingLastPathComponent];
      id v28 = v8;
      BOOL v18 = [(VCPClusterer *)self _processingQueueRestoreClusteringCacheWithCacheDirectoryURL:v17 clusterState:v9 threshold:v11 error:&v28];
      id v23 = v28;

      if (v18)
      {
        id v26 = v23;
        id v27 = 0;
        BOOL v22 = [(VCPClusterer *)self _processingQueueGetFaceClusterSequenceNumbersInClusterCache:&v27 lastClusterSequenceNumber:v30 error:&v26];
        id v16 = v27;
        id v8 = v26;

        BOOL v19 = v22;
      }
      else if ((int)MediaAnalysisLogLevel() < 3)
      {
        id v16 = 0;
        BOOL v19 = 0;
        id v8 = v23;
      }
      else
      {
        id v21 = VCPLogInstance();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)CC_MD5_CTX buf = 138412290;
          id v32 = v23;
          _os_log_impl(&dword_1BBEDA000, v21, OS_LOG_TYPE_ERROR, "VCPClusterer: Failed to restore Vision clustering state - %@", buf, 0xCu);
        }

        id v16 = 0;
        BOOL v19 = 0;
        id v8 = v23;
      }
      goto LABEL_19;
    }
    goto LABEL_17;
  }
  id v14 = 0;
  id v11 = 0;
  id v16 = 0;
  unint64_t v9 = 0;
LABEL_18:
  BOOL v19 = 0;
LABEL_19:

  id v6 = v8;
  if (v19)
  {
    objc_storeStrong((id *)&self->_clusteringType, v14);
    objc_storeStrong((id *)&self->_threshold, v11);
    objc_storeStrong((id *)&self->_faceCSNsInClusterCache, v16);
    self->_uint64_t nextSeqNum = v30[0] + 1;
    if ([v9 length]) {
      [(VCPClusterer *)self _removeVisionClusterCacheFilesNotReferencedByVisionClusterState:v9];
    }
  }

  BOOL v15 = v19;
LABEL_23:
  if (a4 && !v15) {
    *a4 = v6;
  }

  return v15;
}

- (BOOL)_processingQueueRestoreClusterCacheAndSyncWithLibrary:(BOOL)a3 cancelOrExtendTimeoutBlock:(id)a4 error:(id *)a5
{
  BOOL v6 = a3;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  faceCSNsInClusterCache = self->_faceCSNsInClusterCache;
  self->_faceCSNsInClusterCache = 0;

  id v10 = _tempCacheFileUrlFromCacheFileUrl(self->_cacheFileUrl);
  if ([(VCPClusterer *)self _processingQueueRestoreFromClusterSnapshotFileAtURL:v10 error:0])
  {
    id v11 = [v10 path];
    int v12 = (const std::__fs::filesystem::path *)[v11 fileSystemRepresentation];
    id v13 = [(NSURL *)self->_cacheFileUrl path];
    id v14 = (const std::__fs::filesystem::path *)[v13 fileSystemRepresentation];
    rename(v12, v14, v15);
    LODWORD(v12) = v16;

    if (!v12)
    {
      id v25 = 0;
      if (!v6)
      {
LABEL_22:
        BOOL v28 = 1;
        goto LABEL_23;
      }
LABEL_20:
      if (self->_clustererBringUpState >= 0x28) {
        [(VCPClusterer *)self _processingQueueQuickSyncClustererWithPhotoLibraryUsingFacesInClusterCache:self->_faceCSNsInClusterCache visionClusters:0 cancelOrExtendTimeoutBlock:v8];
      }
      goto LABEL_22;
    }
    id v17 = [NSString stringWithFormat:@"VCPClusterer: Failed to rename file from '%@' to '%@'. Error = %d", v10, self->_cacheFileUrl, *__error()];
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      BOOL v18 = VCPLogInstance();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)CC_MD5_CTX buf = 138412290;
        id v35 = v17;
        _os_log_impl(&dword_1BBEDA000, v18, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
    BOOL v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v32 = *MEMORY[0x1E4F28568];
    char v20 = [NSString stringWithFormat:@"%@", v17];
    uint64_t v33 = v20;
    id v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
    id v22 = [v19 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v21];
  }
  else
  {
    cacheFileUrl = self->_cacheFileUrl;
    id v31 = 0;
    BOOL v24 = [(VCPClusterer *)self _processingQueueRestoreFromClusterSnapshotFileAtURL:cacheFileUrl error:&v31];
    id v22 = v31;
    id v25 = v22;
    if (v24) {
      goto LABEL_15;
    }
  }
  if ((int)MediaAnalysisLogLevel() >= 3)
  {
    id v26 = VCPLogInstance();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)CC_MD5_CTX buf = 138412290;
      id v35 = v22;
      _os_log_impl(&dword_1BBEDA000, v26, OS_LOG_TYPE_ERROR, "VCPClusterer: Resetting cluster cache files - %@", buf, 0xCu);
    }
  }
  id v30 = v22;
  BOOL v27 = [(VCPClusterer *)self _processingQueueResetClusterCache:&v30];
  id v25 = v30;

  if (v27)
  {
    [(VCPClusterer *)self setClustererBringUpState:30];
LABEL_15:
    if (!v6) {
      goto LABEL_22;
    }
    goto LABEL_20;
  }
  [(VCPClusterer *)self setClustererBringUpState:20];
  if (a5)
  {
    id v25 = v25;
    BOOL v28 = 0;
    *a5 = v25;
  }
  else
  {
    BOOL v28 = 0;
  }
LABEL_23:

  return v28;
}

- (unint64_t)restoreClusterCacheAndSyncWithLibrary:(BOOL)a3 cancelOrExtendTimeoutBlock:(id)a4 error:(id *)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    unint64_t v9 = VCPLogInstance();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)CC_MD5_CTX buf = 0;
      _os_log_impl(&dword_1BBEDA000, v9, OS_LOG_TYPE_INFO, "VCPClusterer: Started restoring cluster cache", buf, 2u);
    }
  }
  double Current = CFAbsoluteTimeGetCurrent();
  *(void *)CC_MD5_CTX buf = 0;
  BOOL v28 = buf;
  uint64_t v29 = 0x3032000000;
  id v30 = __Block_byref_object_copy__2;
  id v31 = __Block_byref_object_dispose__2;
  id v32 = 0;
  dispatch_group_enter((dispatch_group_t)self->_processingGroup);
  processingQueue = self->_processingQueue;
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  id v21 = __87__VCPClusterer_restoreClusterCacheAndSyncWithLibrary_cancelOrExtendTimeoutBlock_error___block_invoke;
  id v22 = &unk_1E62975E0;
  id v23 = self;
  BOOL v26 = a3;
  id v12 = v8;
  id v24 = v12;
  id v25 = buf;
  dispatch_sync(processingQueue, &v19);
  if (a5)
  {
    id v13 = (void *)*((void *)v28 + 5);
    if (v13) {
      *a5 = v13;
    }
  }
  [(VCPClusterer *)self _recordClusterRebuildRequired:[(VCPClusterer *)self needsFullSync]];
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v14 = VCPLogInstance();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      BOOL v15 = [(VCPClusterer *)self _bringUpStateDescription:self->_clustererBringUpState];
      CFAbsoluteTime v16 = CFAbsoluteTimeGetCurrent();
      *(_DWORD *)uint64_t v33 = 138412546;
      __int16 v34 = v15;
      __int16 v35 = 2048;
      double v36 = v16 - Current;
      _os_log_impl(&dword_1BBEDA000, v14, OS_LOG_TYPE_INFO, "VCPClusterer: Restored cluster cache. Clusterer bring-up state - %@, time to restore: %f secs", v33, 0x16u);
    }
  }
  unint64_t v17 = [(VCPClusterer *)self clustererState];

  _Block_object_dispose(buf, 8);
  return v17;
}

void __87__VCPClusterer_restoreClusterCacheAndSyncWithLibrary_cancelOrExtendTimeoutBlock_error___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(unsigned __int8 *)(a1 + 56);
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v8[0] = 0;
  char v5 = [v3 _processingQueueRestoreClusterCacheAndSyncWithLibrary:v2 cancelOrExtendTimeoutBlock:v4 error:v8];
  id v6 = v8[0];
  if ((v5 & 1) == 0 && (int)MediaAnalysisLogLevel() >= 3)
  {
    int v7 = VCPLogInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)CC_MD5_CTX buf = 138412290;
      id v10 = v6;
      _os_log_impl(&dword_1BBEDA000, v7, OS_LOG_TYPE_ERROR, "VCPClusterer: Failed to restore cluster cache - %@", buf, 0xCu);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 32));
}

- (id)suggestedFaceClusterSequenceNumbersForFaceClusterSequenceNumbersRepresentingClusters:(id)a3 error:(id *)a4
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([(VCPClusterer *)self needsFullSync])
  {
    if (a4)
    {
      int v7 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v29 = *MEMORY[0x1E4F28568];
      id v8 = [NSString stringWithFormat:@"VCPClusterer needs a full sync"];
      v30[0] = v8;
      unint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
      *a4 = [v7 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v9];

      a4 = 0;
    }
  }
  else if ([v6 count])
  {
    uint64_t v23 = 0;
    id v24 = &v23;
    uint64_t v25 = 0x3032000000;
    BOOL v26 = __Block_byref_object_copy__2;
    BOOL v27 = __Block_byref_object_dispose__2;
    id v28 = 0;
    uint64_t v17 = 0;
    BOOL v18 = &v17;
    uint64_t v19 = 0x3032000000;
    uint64_t v20 = __Block_byref_object_copy__2;
    id v21 = __Block_byref_object_dispose__2;
    id v22 = 0;
    dispatch_group_enter((dispatch_group_t)self->_processingGroup);
    processingQueue = self->_processingQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __107__VCPClusterer_suggestedFaceClusterSequenceNumbersForFaceClusterSequenceNumbersRepresentingClusters_error___block_invoke;
    block[3] = &unk_1E6297608;
    id v13 = v6;
    id v14 = self;
    BOOL v15 = &v23;
    CFAbsoluteTime v16 = &v17;
    dispatch_sync(processingQueue, block);
    if (a4) {
      *a4 = (id) v18[5];
    }
    a4 = (id *)(id)v24[5];

    _Block_object_dispose(&v17, 8);
    _Block_object_dispose(&v23, 8);
  }
  else
  {
    a4 = [MEMORY[0x1E4F1C978] array];
  }

  return a4;
}

void __107__VCPClusterer_suggestedFaceClusterSequenceNumbersForFaceClusterSequenceNumbersRepresentingClusters_error___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v16;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(v3);
        }
        [v2 setObject:&unk_1F15EB478 forKeyedSubscript:*(void *)(*((void *)&v15 + 1) + 8 * v6++)];
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v4);
  }

  uint64_t v7 = *(void *)(a1 + 40);
  id v8 = *(void **)(v7 + 144);
  [*(id *)(v7 + 48) facePrimarySuggestionsThreshold];
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 136);
  uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v10 + 40);
  uint64_t v11 = objc_msgSend(v8, "suggestionsForClustersWithFaceIds:affinityThreshold:canceller:error:", v2, v9, &obj);
  objc_storeStrong((id *)(v10 + 40), obj);
  uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
  id v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;

  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 40) + 32));
}

- (id)requestSuggestionsForFaceClusterSequenceNumbers:(id)a3 withClusteringFlags:(id)a4 updateHandler:(id)a5 error:(id *)a6
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v12)
  {
    if (![(VCPClusterer *)self needsFullSync])
    {
      id v14 = +[VCPSuggestionRequest requestWithFaceClusterIds:v10 clusterFlags:v11 updateHandler:v12];
      [(NSLock *)self->_suggestionLock lock];
      [(NSMutableArray *)self->_outstandingSuggestionRequests addObject:v14];
      [(NSLock *)self->_suggestionLock unlock];
      processingQueue = self->_processingQueue;
      processingGroup = self->_processingGroup;
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __104__VCPClusterer_requestSuggestionsForFaceClusterSequenceNumbers_withClusteringFlags_updateHandler_error___block_invoke;
      v21[3] = &unk_1E6296FF8;
      v21[4] = self;
      dispatch_group_async(processingGroup, processingQueue, v21);
      a6 = [v14 requestId];
      goto LABEL_9;
    }
    if (!a6) {
      goto LABEL_10;
    }
    id v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v22 = *MEMORY[0x1E4F28568];
    id v14 = [NSString stringWithFormat:@"VCPClusterer is not ready"];
    uint64_t v23 = v14;
    long long v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    *a6 = [v13 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v15];
  }
  else
  {
    if (!a6) {
      goto LABEL_10;
    }
    long long v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v24 = *MEMORY[0x1E4F28568];
    id v14 = [NSString stringWithFormat:@"missing updateHandler"];
    v25[0] = v14;
    long long v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
    *a6 = [v16 errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:v17];
  }
  a6 = 0;
LABEL_9:

LABEL_10:
  return a6;
}

void __104__VCPClusterer_requestSuggestionsForFaceClusterSequenceNumbers_withClusteringFlags_updateHandler_error___block_invoke(uint64_t a1)
{
  v33[1] = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(a1 + 32) + 176) lock];
  if ([*(id *)(*(void *)(a1 + 32) + 160) count])
  {
    uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 160) objectAtIndexedSubscript:0];
    [*(id *)(*(void *)(a1 + 32) + 160) removeObjectAtIndex:0];
  }
  else
  {
    uint64_t v2 = 0;
  }
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 168), v2);
  [*(id *)(*(void *)(a1 + 32) + 176) unlock];
  int v3 = [*(id *)(a1 + 32) needsFullSync];
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 168);
  if (!v3)
  {
    if (!v4) {
      goto LABEL_19;
    }
    id v11 = [v4 updateHandler];
    ((void (**)(void, __CFString *, void, void))v11)[2](v11, @"VCPSuggestionUpdateStarted", 0, 0);

    uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 168) canceller];
    int v12 = [v6 wasSignalled];
    uint64_t v13 = *(void *)(a1 + 32);
    if (v12)
    {
      id v14 = [*(id *)(v13 + 168) updateHandler];
      ((void (**)(void, __CFString *, void, void))v14)[2](v14, @"VCPSuggestionUpdateCancelled", 0, 0);

      goto LABEL_18;
    }
    long long v15 = *(void **)(v13 + 144);
    long long v16 = [*(id *)(v13 + 168) clusterFlagByClusterId];
    [*(id *)(*(void *)(a1 + 32) + 48) facePrimarySuggestionsThreshold];
    uint64_t v17 = *(void *)(*(void *)(a1 + 32) + 136);
    id v29 = 0;
    long long v18 = objc_msgSend(v15, "suggestionsForClustersWithFaceIds:affinityThreshold:canceller:error:", v16, v17, &v29);
    id v19 = v29;

    if (v19)
    {
      uint64_t v20 = [v19 domain];
      if ([v20 isEqualToString:*MEMORY[0x1E4F45BD0]])
      {
        BOOL v21 = [v19 code] == 1;

        if (v21)
        {
          uint64_t v22 = [*(id *)(*(void *)(a1 + 32) + 168) updateHandler];
          ((void (**)(void, __CFString *, void, void))v22)[2](v22, @"VCPSuggestionUpdateCancelled", 0, 0);
LABEL_17:

          goto LABEL_18;
        }
      }
      else
      {
      }
      uint64_t v23 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v30 = *MEMORY[0x1E4F28568];
      uint64_t v24 = [NSString stringWithFormat:@"VCPClusterer: Failed to get suggestions from Vision framework %@", v19];
      id v31 = v24;
      uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
      uint64_t v22 = [v23 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v25];

      BOOL v26 = [*(id *)(*(void *)(a1 + 32) + 168) updateHandler];
      ((void (**)(void, __CFString *, void, void))v26)[2](v26, @"VCPSuggestionUpdateFinished", 0, v22);

      goto LABEL_17;
    }
    uint64_t v22 = [*(id *)(*(void *)(a1 + 32) + 168) updateHandler];
    ((void (**)(void, __CFString *, void *, void))v22)[2](v22, @"VCPSuggestionUpdateFinished", v18, 0);
    goto LABEL_17;
  }
  uint64_t v5 = [v4 updateHandler];

  if (v5)
  {
    uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 168) updateHandler];
    uint64_t v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v32 = *MEMORY[0x1E4F28568];
    id v8 = [NSString stringWithFormat:@"VCPClusterer needs a full sync"];
    v33[0] = v8;
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:&v32 count:1];
    id v10 = [v7 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v9];
    ((void (**)(void, __CFString *, void, void *))v6)[2](v6, @"VCPSuggestionUpdateFinished", 0, v10);

LABEL_18:
  }
LABEL_19:
  [*(id *)(*(void *)(a1 + 32) + 176) lock];
  uint64_t v27 = *(void *)(a1 + 32);
  id v28 = *(void **)(v27 + 168);
  *(void *)(v27 + 168) = 0;

  [*(id *)(*(void *)(a1 + 32) + 176) unlock];
}

- (void)cancelSuggestionRequest:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(NSLock *)self->_suggestionLock lock];
  uint64_t v5 = [(VCPSuggestionRequest *)self->_currentSuggestionRequest requestId];
  int v6 = [v5 isEqualToString:v4];

  if (v6)
  {
    uint64_t v7 = [(VCPSuggestionRequest *)self->_currentSuggestionRequest canceller];
    [v7 signalCancellation];
  }
  else
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v8 = self->_outstandingSuggestionRequests;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      id v10 = 0;
      uint64_t v11 = *(void *)v17;
      while (2)
      {
        uint64_t v12 = 0;
        uint64_t v13 = v10;
        do
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          id v10 = *(id *)(*((void *)&v16 + 1) + 8 * v12);

          id v14 = objc_msgSend(v10, "requestId", (void)v16);
          char v15 = [v14 isEqualToString:v4];

          if (v15)
          {

            if (v10) {
              [(NSMutableArray *)self->_outstandingSuggestionRequests removeObject:v10];
            }
            goto LABEL_15;
          }
          ++v12;
          uint64_t v13 = v10;
        }
        while (v9 != v12);
        uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
    id v10 = 0;
LABEL_15:
  }
  [(NSLock *)self->_suggestionLock unlock];
}

- (void)cancelAllSuggestionRequests
{
  [(NSLock *)self->_suggestionLock lock];
  currentSuggestionRequest = self->_currentSuggestionRequest;
  if (currentSuggestionRequest)
  {
    id v4 = [(VCPSuggestionRequest *)currentSuggestionRequest canceller];
    [v4 signalCancellation];
  }
  [(NSMutableArray *)self->_outstandingSuggestionRequests removeAllObjects];
  suggestionLock = self->_suggestionLock;
  [(NSLock *)suggestionLock unlock];
}

- (BOOL)isReadyToReturnSuggestions
{
  unint64_t v2 = [(VCPClusterer *)self clustererBringUpState];
  return v2 != 60 && v2 != 70 && v2 != 80;
}

- (id)_resolveConflictingL0ClustersFromVNClusters:(id)a3 excludedL0ClustersByL1ClusterId:(id *)a4 cancelOrExtendTimeoutBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [MEMORY[0x1E4F1CA48] array];
  if (a4)
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  else
  {
    uint64_t v11 = 0;
  }
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __119__VCPClusterer__resolveConflictingL0ClustersFromVNClusters_excludedL0ClustersByL1ClusterId_cancelOrExtendTimeoutBlock___block_invoke;
  v18[3] = &unk_1E6297658;
  id v12 = v9;
  id v22 = v12;
  id v13 = v10;
  id v19 = v13;
  uint64_t v20 = self;
  id v14 = v11;
  id v21 = v14;
  [v8 enumerateObjectsUsingBlock:v18];
  if (a4) {
    *a4 = v14;
  }
  char v15 = v21;
  id v16 = v13;

  return v16;
}

void __119__VCPClusterer__resolveConflictingL0ClustersFromVNClusters_excludedL0ClustersByL1ClusterId_cancelOrExtendTimeoutBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  uint64_t v7 = *(void *)(a1 + 56);
  if (v7 && (*(unsigned int (**)(void))(v7 + 16))())
  {
    *a4 = 1;
  }
  else
  {
    id v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "clusterId"));
    id v9 = [v6 objects];
    if ([v9 count])
    {
      if ([v9 count] == 1)
      {
        id v10 = *(void **)(a1 + 32);
        uint64_t v11 = [MEMORY[0x1E4F1CAD0] setWithArray:v9];
        [v10 addObject:v11];
      }
      else
      {
        id v12 = objc_msgSend(*(id *)(a1 + 40), "level0ClusterAsFaceCSNsByLevel0KeyFaceCSNForClusterIdentifiedByFaceCSN:error:", objc_msgSend(v6, "clusterId"), 0);
        if ((int)MediaAnalysisLogLevel() >= 7)
        {
          id v13 = VCPLogInstance();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)CC_MD5_CTX buf = 138412546;
            uint64_t v32 = v8;
            __int16 v33 = 2048;
            uint64_t v34 = [v9 count];
            _os_log_impl(&dword_1BBEDA000, v13, OS_LOG_TYPE_DEBUG, "[VisionFgMapping] Checking l1-cluster %@ (%ld faces) for conflict", buf, 0x16u);
          }
        }
        id v14 = [*(id *)(*(void *)(a1 + 40) + 16) identifyConflictingL0Clusters:v12 csnToRejectedPersonForNewlyClusteredFaces:MEMORY[0x1E4F1CC08] csnToConfirmedPersonForNewlyClusteredFaces:MEMORY[0x1E4F1CC08]];
        if ([v14 count])
        {
          char v15 = [MEMORY[0x1E4F1CA80] setWithArray:v9];
          if (*(void *)(a1 + 48))
          {
            id v16 = [MEMORY[0x1E4F1CA48] array];
            long long v17 = *(void **)(a1 + 48);
            long long v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "clusterId"));
            [v17 setObject:v16 forKeyedSubscript:v18];
          }
          uint64_t v21 = MEMORY[0x1E4F143A8];
          uint64_t v22 = 3221225472;
          uint64_t v23 = __119__VCPClusterer__resolveConflictingL0ClustersFromVNClusters_excludedL0ClustersByL1ClusterId_cancelOrExtendTimeoutBlock___block_invoke_506;
          uint64_t v24 = &unk_1E6297630;
          id v25 = v8;
          id v26 = v12;
          id v27 = *(id *)(a1 + 32);
          id v28 = *(id *)(a1 + 48);
          id v29 = v6;
          id v19 = v15;
          id v30 = v19;
          [v14 enumerateObjectsUsingBlock:&v21];
          objc_msgSend(*(id *)(a1 + 32), "addObject:", v19, v21, v22, v23, v24);
        }
        else
        {
          uint64_t v20 = *(void **)(a1 + 32);
          id v19 = [MEMORY[0x1E4F1CAD0] setWithArray:v9];
          [v20 addObject:v19];
        }
      }
    }
  }
}

void __119__VCPClusterer__resolveConflictingL0ClustersFromVNClusters_excludedL0ClustersByL1ClusterId_cancelOrExtendTimeoutBlock___block_invoke_506(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v4 = VCPLogInstance();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v11 = 138412546;
      id v12 = v3;
      __int16 v13 = 2112;
      uint64_t v14 = v5;
      _os_log_impl(&dword_1BBEDA000, v4, OS_LOG_TYPE_INFO, "[VisionFgMapping] Resolving conflict l0-cluster %@ in l1-cluster %@", (uint8_t *)&v11, 0x16u);
    }
  }
  id v6 = [*(id *)(a1 + 40) objectForKeyedSubscript:v3];
  uint64_t v7 = [v6 set];

  [*(id *)(a1 + 48) addObject:v7];
  id v8 = *(void **)(a1 + 56);
  if (v8)
  {
    id v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 64), "clusterId"));
    id v10 = [v8 objectForKeyedSubscript:v9];
    [v10 addObject:v7];
  }
  [*(id *)(a1 + 72) minusSet:v7];
}

- (BOOL)_processingQueueGetVisionClusters:(id)a3 minimumClusterSize:(unint64_t)a4 returnClusterAsCountedSet:(BOOL)a5 excludedL0ClustersByL1ClusterId:(id *)a6 cancelOrExtendTimeoutBlock:(id)a7 error:(id *)a8
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a7;
  clusterBuilder = self->_clusterBuilder;
  id v26 = 0;
  long long v17 = [(VNClustererBuilder *)clusterBuilder l1ClusteredFaceIdsGroupedByL0ClustersForClustersContainingFaceIds:0 error:&v26];
  id v18 = v26;
  if (v18)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      id v19 = VCPLogInstance();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)CC_MD5_CTX buf = 138412290;
        id v28 = v18;
        _os_log_impl(&dword_1BBEDA000, v19, OS_LOG_TYPE_ERROR, "VCPClusterer: Failed to get Vision clusters - %@", buf, 0xCu);
      }
    }
    *a8 = v18;
  }
  else
  {
    uint64_t v20 = [(VCPClusterer *)self _resolveConflictingL0ClustersFromVNClusters:v17 excludedL0ClustersByL1ClusterId:a6 cancelOrExtendTimeoutBlock:v15];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __160__VCPClusterer__processingQueueGetVisionClusters_minimumClusterSize_returnClusterAsCountedSet_excludedL0ClustersByL1ClusterId_cancelOrExtendTimeoutBlock_error___block_invoke;
    v22[3] = &unk_1E6297680;
    unint64_t v24 = a4;
    id v23 = v14;
    BOOL v25 = a5;
    [v20 enumerateObjectsUsingBlock:v22];
  }
  return v18 == 0;
}

void __160__VCPClusterer__processingQueueGetVisionClusters_minimumClusterSize_returnClusterAsCountedSet_excludedL0ClustersByL1ClusterId_cancelOrExtendTimeoutBlock_error___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  if ((unint64_t)[v6 count] >= *(void *)(a1 + 40))
  {
    id v3 = *(void **)(a1 + 32);
    int v4 = *(unsigned __int8 *)(a1 + 48);
    if (*(unsigned char *)(a1 + 48))
    {
      uint64_t v5 = [MEMORY[0x1E4F28BD0] setWithSet:v6];
    }
    else
    {
      uint64_t v5 = v6;
    }
    [v3 addObject:v5];
    if (v4) {
  }
    }
}

- (id)differencesBetweenClusterCacheAndLibrary:(id *)a3 excludedL0ClustersByL1ClusterId:(id *)a4 cancelOrExtendTimeoutBlock:(id)a5
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  uint64_t v45 = 0;
  double v46 = &v45;
  uint64_t v47 = 0x3032000000;
  id v48 = __Block_byref_object_copy__2;
  uint64_t v49 = __Block_byref_object_dispose__2;
  id v50 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v39 = 0;
  uint64_t v40 = &v39;
  uint64_t v41 = 0x3032000000;
  double v42 = __Block_byref_object_copy__2;
  uint64_t v43 = __Block_byref_object_dispose__2;
  id v44 = 0;
  uint64_t v35 = 0;
  double v36 = &v35;
  uint64_t v37 = 0x2020000000;
  char v38 = 0;
  dispatch_group_enter((dispatch_group_t)self->_processingGroup);
  processingQueue = self->_processingQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __116__VCPClusterer_differencesBetweenClusterCacheAndLibrary_excludedL0ClustersByL1ClusterId_cancelOrExtendTimeoutBlock___block_invoke;
  block[3] = &unk_1E62976A8;
  id v31 = &v35;
  uint64_t v32 = &v45;
  void block[4] = self;
  uint64_t v34 = a4;
  id v10 = v8;
  id v30 = v10;
  __int16 v33 = &v39;
  dispatch_sync(processingQueue, block);
  if (*((unsigned char *)v36 + 24))
  {
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      int v11 = VCPLogInstance();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)CC_MD5_CTX buf = 0;
        _os_log_impl(&dword_1BBEDA000, v11, OS_LOG_TYPE_INFO, "VCPClusterer: Retrieving clusters in library ...", buf, 2u);
      }
    }
    id v12 = (void *)v40[5];
    v40[5] = 0;

    persistenceDelegate = self->_persistenceDelegate;
    id v14 = (id *)(v40 + 5);
    id obj = (id)v40[5];
    id v15 = [(VCPPhotosPersistenceDelegate *)persistenceDelegate groupedClusterSequenceNumbersOfFacesInFaceGroupsOfMinimumSize:1 error:&obj];
    objc_storeStrong(v14, obj);
    if (v40[5])
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        id v16 = VCPLogInstance();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          uint64_t v17 = v40[5];
          *(_DWORD *)CC_MD5_CTX buf = 138412290;
          uint64_t v52 = v17;
          _os_log_impl(&dword_1BBEDA000, v16, OS_LOG_TYPE_ERROR, "VCPClusterer: Failed to retrieve clusters in library - %@", buf, 0xCu);
        }
      }
      id v18 = 0;
      if (a3) {
        *a3 = (id) v40[5];
      }
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        uint64_t v21 = VCPLogInstance();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)CC_MD5_CTX buf = 0;
          _os_log_impl(&dword_1BBEDA000, v21, OS_LOG_TYPE_INFO, "VCPClusterer: Comparing clusters", buf, 2u);
        }
      }
      uint64_t v22 = (void *)v46[5];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __116__VCPClusterer_differencesBetweenClusterCacheAndLibrary_excludedL0ClustersByL1ClusterId_cancelOrExtendTimeoutBlock___block_invoke_2;
      v26[3] = &unk_1E62976F0;
      id v27 = &__block_literal_global_512;
      [v22 sortUsingComparator:v26];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __116__VCPClusterer_differencesBetweenClusterCacheAndLibrary_excludedL0ClustersByL1ClusterId_cancelOrExtendTimeoutBlock___block_invoke_3;
      v24[3] = &unk_1E6297540;
      id v25 = &__block_literal_global_512;
      [v15 sortUsingComparator:v24];
      id v18 = VCPCompareLibraryClustersWithVisionClusters(v15, (void *)v46[5]);
    }
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      id v19 = VCPLogInstance();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        uint64_t v20 = v40[5];
        *(_DWORD *)CC_MD5_CTX buf = 138412290;
        uint64_t v52 = v20;
        _os_log_impl(&dword_1BBEDA000, v19, OS_LOG_TYPE_ERROR, "VCPClusterer: Failed to retrieve clusters in cluster cache - %@", buf, 0xCu);
      }
    }
    id v18 = 0;
    if (a3) {
      *a3 = (id) v40[5];
    }
  }

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v39, 8);

  _Block_object_dispose(&v45, 8);
  return v18;
}

void __116__VCPClusterer_differencesBetweenClusterCacheAndLibrary_excludedL0ClustersByL1ClusterId_cancelOrExtendTimeoutBlock___block_invoke(void *a1)
{
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    unint64_t v2 = VCPLogInstance();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)CC_MD5_CTX buf = 0;
      _os_log_impl(&dword_1BBEDA000, v2, OS_LOG_TYPE_INFO, "VCPClusterer: Retrieving clusters in cluster cache ...", buf, 2u);
    }
  }
  uint64_t v3 = *(void *)(*(void *)(a1[7] + 8) + 40);
  uint64_t v4 = a1[9];
  uint64_t v5 = (void *)a1[4];
  uint64_t v6 = a1[5];
  uint64_t v7 = *(void *)(a1[8] + 8);
  id obj = *(id *)(v7 + 40);
  char v8 = [v5 _processingQueueGetVisionClusters:v3 minimumClusterSize:1 returnClusterAsCountedSet:1 excludedL0ClustersByL1ClusterId:v4 cancelOrExtendTimeoutBlock:v6 error:&obj];
  objc_storeStrong((id *)(v7 + 40), obj);
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v8;
  dispatch_group_leave(*(dispatch_group_t *)(a1[4] + 32));
}

uint64_t __116__VCPClusterer_differencesBetweenClusterCacheAndLibrary_excludedL0ClustersByL1ClusterId_cancelOrExtendTimeoutBlock___block_invoke_509(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  unint64_t v5 = [a2 count];
  unint64_t v6 = [v4 count];
  if (v5 > v6) {
    uint64_t v7 = -1;
  }
  else {
    uint64_t v7 = v5 < v6;
  }

  return v7;
}

uint64_t __116__VCPClusterer_differencesBetweenClusterCacheAndLibrary_excludedL0ClustersByL1ClusterId_cancelOrExtendTimeoutBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __116__VCPClusterer_differencesBetweenClusterCacheAndLibrary_excludedL0ClustersByL1ClusterId_cancelOrExtendTimeoutBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (BOOL)removeClusteringStateCacheWithURL:(id)a3 error:(id *)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v4 = (NSURL *)a3;
  uint64_t v37 = v4;
  char v38 = [MEMORY[0x1E4F28CB8] defaultManager];
  if (v4)
  {
    _cacheFileUrlFromDirectoryUrl(v4);
    unint64_t v5 = (NSURL *)objc_claimAutoreleasedReturnValue();
    double v36 = v5;
    if (v5
      && ([(NSURL *)v5 path],
          unint64_t v6 = objc_claimAutoreleasedReturnValue(),
          int v7 = [v38 fileExistsAtPath:v6],
          v6,
          v7))
    {
      id v45 = 0;
      char v8 = [v38 removeItemAtURL:v36 error:&v45];
      id v9 = v45;
      if ((v8 & 1) == 0 && (int)MediaAnalysisLogLevel() >= 3)
      {
        id v10 = VCPLogInstance();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          int v11 = [(NSURL *)v36 path];
          *(_DWORD *)CC_MD5_CTX buf = 138412546;
          id v48 = v11;
          __int16 v49 = 2112;
          id v50 = v9;
          _os_log_impl(&dword_1BBEDA000, v10, OS_LOG_TYPE_ERROR, "VCPClusterer: Failed to remove cluster snapshot at '%@': %@", buf, 0x16u);
        }
      }
    }
    else
    {
      id v9 = 0;
    }
    id v12 = _tempCacheFileUrlFromCacheFileUrl(v36);
    uint64_t v34 = v12;
    if (v12
      && ([v12 path],
          __int16 v13 = objc_claimAutoreleasedReturnValue(),
          int v14 = [v38 fileExistsAtPath:v13],
          v13,
          v14))
    {
      id v44 = v9;
      char v15 = [v38 removeItemAtURL:v34 error:&v44];
      id v16 = v44;

      if ((v15 & 1) == 0 && (int)MediaAnalysisLogLevel() >= 3)
      {
        uint64_t v17 = VCPLogInstance();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          id v18 = [(NSURL *)v36 path];
          *(_DWORD *)CC_MD5_CTX buf = 138412546;
          id v48 = v18;
          __int16 v49 = 2112;
          id v50 = v16;
          _os_log_impl(&dword_1BBEDA000, v17, OS_LOG_TYPE_ERROR, "VCPClusterer: Failed to remove cluster snapshot at '%@': %@", buf, 0x16u);
        }
      }
    }
    else
    {
      id v16 = v9;
    }
    id v19 = [v38 contentsOfDirectoryAtURL:v37 includingPropertiesForKeys:0 options:0 error:0];
    __int16 v33 = v19;
    if (v19)
    {
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id v20 = v19;
      uint64_t v21 = [v20 countByEnumeratingWithState:&v40 objects:v46 count:16];
      if (v21)
      {
        uint64_t v22 = *(void *)v41;
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v41 != v22) {
              objc_enumerationMutation(v20);
            }
            unint64_t v24 = *(void **)(*((void *)&v40 + 1) + 8 * i);
            id v25 = [v24 pathExtension];
            int v26 = [v25 isEqualToString:@"cmap"];

            if (v26)
            {
              id v39 = v16;
              char v27 = [v38 removeItemAtURL:v24 error:&v39];
              id v28 = v39;

              if ((v27 & 1) == 0 && (int)MediaAnalysisLogLevel() >= 3)
              {
                uint64_t v29 = VCPLogInstance();
                if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
                {
                  id v30 = [v24 path];
                  *(_DWORD *)CC_MD5_CTX buf = 138412546;
                  id v48 = v30;
                  __int16 v49 = 2112;
                  id v50 = v28;
                  _os_log_impl(&dword_1BBEDA000, v29, OS_LOG_TYPE_ERROR, "VCPClusterer: Failed to remove cluster mmap file at '%@': %@", buf, 0x16u);
                }
              }
              id v16 = v28;
            }
          }
          uint64_t v21 = [v20 countByEnumeratingWithState:&v40 objects:v46 count:16];
        }
        while (v21);
      }
    }
    BOOL v31 = v16 == 0;
    if (a4 && v16)
    {
      id v16 = v16;
      BOOL v31 = 0;
      *a4 = v16;
    }
  }
  else
  {
    id v16 = 0;
    BOOL v31 = 1;
  }

  return v31;
}

- (BOOL)getClusters:(id *)a3 threshold:(double *)a4 utilizingGPU:(BOOL *)a5 cancelOrExtendTimeoutBlock:(id)a6 error:(id *)a7
{
  id v11 = a6;
  uint64_t v41 = 0;
  long long v42 = (double *)&v41;
  uint64_t v43 = 0x2020000000;
  uint64_t v44 = 0;
  uint64_t v35 = 0;
  double v36 = &v35;
  uint64_t v37 = 0x3032000000;
  char v38 = __Block_byref_object_copy__2;
  id v39 = __Block_byref_object_dispose__2;
  id v40 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x3032000000;
  uint64_t v32 = __Block_byref_object_copy__2;
  __int16 v33 = __Block_byref_object_dispose__2;
  id v34 = 0;
  uint64_t v25 = 0;
  int v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  dispatch_group_enter((dispatch_group_t)self->_processingGroup);
  processingQueue = self->_processingQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__VCPClusterer_getClusters_threshold_utilizingGPU_cancelOrExtendTimeoutBlock_error___block_invoke;
  block[3] = &unk_1E6297718;
  uint64_t v21 = &v25;
  uint64_t v22 = &v35;
  void block[4] = self;
  id v13 = v11;
  id v20 = v13;
  id v23 = &v29;
  unint64_t v24 = &v41;
  dispatch_sync(processingQueue, block);
  int v14 = v26;
  if (*((unsigned char *)v26 + 24))
  {
    if (a4) {
      *a4 = v42[3];
    }
    if (a3) {
      *a3 = (id) v36[5];
    }
    if (a5)
    {
      id v15 = objc_alloc_init(MEMORY[0x1E4F45940]);
      [v15 setPreferBackgroundProcessing:1];
      [v15 setMetalContextPriority:1];
      *a5 = [v15 usesCPUOnly] ^ 1;
    }
    goto LABEL_10;
  }
  if (a7)
  {
    *a7 = (id) v30[5];
LABEL_10:
    int v14 = v26;
  }
  char v16 = *((unsigned char *)v14 + 24);

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v41, 8);

  return v16;
}

void __84__VCPClusterer_getClusters_threshold_utilizingGPU_cancelOrExtendTimeoutBlock_error___block_invoke(void *a1)
{
  uint64_t v2 = a1[8];
  uint64_t v3 = *(void *)(*(void *)(a1[7] + 8) + 40);
  id v4 = (void *)a1[4];
  uint64_t v5 = a1[5];
  uint64_t v6 = *(void *)(v2 + 8);
  id obj = *(id *)(v6 + 40);
  char v7 = [v4 _processingQueueGetVisionClusters:v3 minimumClusterSize:1 returnClusterAsCountedSet:0 excludedL0ClustersByL1ClusterId:0 cancelOrExtendTimeoutBlock:v5 error:&obj];
  objc_storeStrong((id *)(v6 + 40), obj);
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v7;
  if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
  {
    [*(id *)(a1[4] + 80) doubleValue];
    *(void *)(*(void *)(a1[9] + 8) + 24) = v8;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1[4] + 32));
}

- (id)_propertyDictionaryFileURL
{
  return [(NSURL *)self->_cacheDirUrl URLByAppendingPathComponent:@"clustererState.plist"];
}

- (void)_readPropertyDictionary
{
  id v18 = [(VCPClusterer *)self _propertyDictionaryFileURL];
  uint64_t v3 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithContentsOfURL:v18];
  propertyDictionary = self->_propertyDictionary;
  self->_propertyDictionary = v3;

  uint64_t v5 = self->_propertyDictionary;
  if (!v5)
  {
    uint64_t v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    char v7 = self->_propertyDictionary;
    self->_propertyDictionary = v6;

    uint64_t v5 = self->_propertyDictionary;
  }
  uint64_t v8 = [(NSMutableDictionary *)v5 objectForKeyedSubscript:@"VCPClustererBringUpState"];
  id v9 = v8;
  if (v8)
  {
    unint64_t v10 = [v8 unsignedIntegerValue];
    unint64_t v11 = 40;
    if (v10 <= 0x32) {
      unint64_t v11 = v10;
    }
    self->_clustererBringUpState = v11;
  }
  else
  {
    self->_clustererBringUpState = 40;
    id v12 = [NSNumber numberWithUnsignedInteger:40];
    [(VCPClusterer *)self _setPropertyDictionaryValue:v12 forKey:@"VCPClustererBringUpState"];
  }
  id v13 = [(NSMutableDictionary *)self->_propertyDictionary objectForKeyedSubscript:@"VCPClusterCompareTimestamp"];
  int v14 = v13;
  if (v13)
  {
    id v15 = (void *)MEMORY[0x1E4F1C9C8];
    [v13 doubleValue];
    objc_msgSend(v15, "dateWithTimeIntervalSinceReferenceDate:");
    char v16 = (NSDate *)objc_claimAutoreleasedReturnValue();
    timestampOfLastClusterComparison = self->_timestampOfLastClusterComparison;
    self->_timestampOfLastClusterComparison = v16;
  }
}

- (void)_setPropertyDictionaryValue:(id)a3 forKey:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  [(NSLock *)self->_propertyDictionaryLock lock];
  [(NSMutableDictionary *)self->_propertyDictionary setObject:v8 forKeyedSubscript:v6];
  char v7 = [(VCPClusterer *)self _propertyDictionaryFileURL];
  [(NSMutableDictionary *)self->_propertyDictionary writeToURL:v7 atomically:0];
  [(NSLock *)self->_propertyDictionaryLock unlock];
}

- (id)_bringUpStateDescription:(unint64_t)a3
{
  if ((uint64_t)a3 > 49)
  {
    if ((uint64_t)a3 <= 69)
    {
      if (a3 == 50) {
        return @"ready";
      }
      if (a3 == 60) {
        return @"clustering";
      }
    }
    else
    {
      switch(a3)
      {
        case 'F':
          return @"have unsaved cluster cache";
        case 'P':
          return @"saving cluster cache";
        case 'Z':
          return @"have new cluster cache";
      }
    }
  }
  else if ((uint64_t)a3 <= 19)
  {
    if (!a3) {
      return @"need full sync";
    }
    if (a3 == 10) {
      return @"need to compare clusters";
    }
  }
  else
  {
    switch(a3)
    {
      case 0x14uLL:
        return @"need to reset cluster cache";
      case 0x1EuLL:
        return @"need to reset library clusters";
      case 0x28uLL:
        return @"need update";
    }
  }
  return @"unknown (error)";
}

- (void)setClustererBringUpState:(unint64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  unint64_t clustererBringUpState = self->_clustererBringUpState;
  if (clustererBringUpState != a3)
  {
    self->_unint64_t clustererBringUpState = a3;
    id v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    [(VCPClusterer *)self _setPropertyDictionaryValue:v6 forKey:@"VCPClustererBringUpState"];

    if (a3 == 40) {
      [(VCPClusterer *)self _recordClusterRebuildRequired:0];
    }
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      char v7 = VCPLogInstance();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        id v8 = [(VCPClusterer *)self _bringUpStateDescription:clustererBringUpState];
        id v9 = [(VCPClusterer *)self _bringUpStateDescription:self->_clustererBringUpState];
        int v10 = 138412546;
        unint64_t v11 = v8;
        __int16 v12 = 2112;
        id v13 = v9;
        _os_log_impl(&dword_1BBEDA000, v7, OS_LOG_TYPE_INFO, "VCPClusterer: Bring-up state transition: %@ -> %@", (uint8_t *)&v10, 0x16u);
      }
    }
  }
}

- (unint64_t)clustererState
{
  if ([(VCPClusterer *)self needsFullSync]) {
    return 10;
  }
  if ([(VCPClusterer *)self needsUpdate]) {
    return 20;
  }
  if (self->_accumulatedChangesCount) {
    return 30;
  }
  if ([(VCPClusterer *)self isReady]) {
    return 40;
  }
  return 0;
}

- (BOOL)isReady
{
  return self->_clustererBringUpState == 50;
}

- (BOOL)needsFullSync
{
  return (self->_clustererBringUpState < 0x1F) & (0x40100401u >> self->_clustererBringUpState);
}

- (BOOL)needsUpdate
{
  return self->_clustererBringUpState == 40;
}

- (id)level0ClusterAsFaceCSNsByLevel0KeyFaceCSNForClusterIdentifiedByFaceCSN:(unint64_t)a3 error:(id *)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  clusterBuilder = self->_clusterBuilder;
  id v6 = [NSNumber numberWithUnsignedInteger:a3];
  char v7 = [(VNClustererBuilder *)clusterBuilder clusteredFaceIdsForClusterContainingFaceId:v6 error:a4];

  if (v7)
  {
    id v8 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v9);
          }
          id v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          uint64_t v14 = objc_msgSend(v13, "firstObject", (void)v16);
          [v8 setObject:v13 forKey:v14];
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)distanceBetweenLevel0ClusterIdentifiedByFaceCSN:(unint64_t)a3 andLevel0ClusterIdentifiedByFaceCSN:(unint64_t)a4 error:(id *)a5
{
  clusterBuilder = self->_clusterBuilder;
  id v8 = [NSNumber numberWithUnsignedInteger:a3];
  id v9 = [NSNumber numberWithUnsignedInteger:a4];
  uint64_t v10 = [(VNClustererBuilder *)clusterBuilder distanceBetweenClustersWithFaceId:v8 andFaceId:v9 error:a5];

  return v10;
}

- (id)distancesFromClustersIdentifiedByFaceCSNs:(id)a3 toClustersIdentifiedByFaceCSNs:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v27 = 0;
  char v28 = &v27;
  uint64_t v29 = 0x3032000000;
  id v30 = __Block_byref_object_copy__2;
  uint64_t v31 = __Block_byref_object_dispose__2;
  id v32 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  unint64_t v24 = __Block_byref_object_copy__2;
  uint64_t v25 = __Block_byref_object_dispose__2;
  id v26 = 0;
  dispatch_group_enter((dispatch_group_t)self->_processingGroup);
  processingQueue = self->_processingQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __95__VCPClusterer_distancesFromClustersIdentifiedByFaceCSNs_toClustersIdentifiedByFaceCSNs_error___block_invoke;
  block[3] = &unk_1E6297740;
  void block[4] = self;
  long long v19 = &v27;
  id v11 = v8;
  id v17 = v11;
  id v12 = v9;
  id v18 = v12;
  id v20 = &v21;
  dispatch_sync(processingQueue, block);
  if (a5)
  {
    id v13 = (void *)v22[5];
    if (v13) {
      *a5 = v13;
    }
  }
  id v14 = (id)v28[5];

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v14;
}

void __95__VCPClusterer_distancesFromClustersIdentifiedByFaceCSNs_toClustersIdentifiedByFaceCSNs_error___block_invoke(uint64_t a1)
{
  void v16[2] = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) needsFullSync])
  {
    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 144);
    uint64_t v3 = *(void *)(a1 + 48);
    v16[0] = *(void *)(a1 + 40);
    v16[1] = v3;
    id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
    uint64_t v5 = *(void *)(*(void *)(a1 + 64) + 8);
    id obj = *(id *)(v5 + 40);
    uint64_t v6 = [v2 distanceBetweenLevel1Clusters:v4 error:&obj];
    objc_storeStrong((id *)(v5 + 40), obj);
    uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  else
  {
    id v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = *MEMORY[0x1E4F28568];
    id v4 = [NSString stringWithFormat:@"VCPClusterer is not ready"];
    id v15 = v4;
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    uint64_t v10 = [v9 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v8];
    uint64_t v11 = *(void *)(*(void *)(a1 + 64) + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(void *)(a1 + 32) + 32));
}

- (unint64_t)clustererBringUpState
{
  return self->_clustererBringUpState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestampOfLastClusterComparison, 0);
  objc_storeStrong((id *)&self->_propertyDictionary, 0);
  objc_storeStrong((id *)&self->_propertyDictionaryLock, 0);
  objc_storeStrong((id *)&self->_currentStatusSnapshotLock, 0);
  objc_storeStrong((id *)&self->_suggestionLock, 0);
  objc_storeStrong((id *)&self->_currentSuggestionRequest, 0);
  objc_storeStrong((id *)&self->_outstandingSuggestionRequests, 0);
  objc_storeStrong((id *)&self->_clusterBuilder, 0);
  objc_storeStrong((id *)&self->_visionCanceler, 0);
  objc_storeStrong((id *)&self->_faceCSNsToRemove, 0);
  objc_storeStrong((id *)&self->_faceIdStrsToAdd, 0);
  objc_storeStrong((id *)&self->_faceCSNsInClusterCache, 0);
  objc_storeStrong((id *)&self->_threshold, 0);
  objc_storeStrong((id *)&self->_clusteringType, 0);
  objc_storeStrong((id *)&self->_cacheFileUrl, 0);
  objc_storeStrong((id *)&self->_cacheDirUrl, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_processingGroup, 0);
  objc_storeStrong((id *)&self->_processingQueue, 0);
  objc_storeStrong((id *)&self->_persistenceDelegate, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

void __87__VCPClusterer_restoreClusterCacheAndSyncWithLibrary_cancelOrExtendTimeoutBlock_error___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 16))(a1);
  int v5 = 136315138;
  uint64_t v6 = v4;
  _os_log_fault_impl(&dword_1BBEDA000, a3, OS_LOG_TYPE_FAULT, "VCPClusterer: Failed to restore cluster cache with std::exception %s", (uint8_t *)&v5, 0xCu);
}

void __87__VCPClusterer_restoreClusterCacheAndSyncWithLibrary_cancelOrExtendTimeoutBlock_error___block_invoke_cold_2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1BBEDA000, log, OS_LOG_TYPE_FAULT, "VCPClusterer: Failed to restore cluster cache", v1, 2u);
}

@end