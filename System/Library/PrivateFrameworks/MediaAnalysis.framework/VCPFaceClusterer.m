@interface VCPFaceClusterer
- (BOOL)_resetFaceClusteringState:(id *)a3;
- (BOOL)clustererIsReadyToReturnSuggestions;
- (BOOL)getFaceClusters:(id *)a3 clusteringThreshold:(double *)a4 utilizingGPU:(BOOL *)a5 cancelOrExtendTimeoutBlock:(id)a6 error:(id *)a7;
- (BOOL)reclusterFacesWithThreshold:(id)a3 shouldRecluster:(BOOL)a4 error:(id *)a5;
- (BOOL)resetFaceClusteringState:(id *)a3;
- (VCPFaceClusterer)initWithPhotoLibrary:(id)a3 context:(id)a4 cancelOrExtendTimeoutBlock:(id)a5;
- (id)clusterer;
- (int)clusterFaces;
- (int)clusterFacesIfNecessary;
- (unint64_t)clustererState;
- (unint64_t)numberOfFacesPendingClustering;
- (void)scheduleClusteringOfFacesWithLocalIdentifiers:(id)a3;
- (void)scheduleUnclusteringOfFacesWithClusterSequenceNumbers:(id)a3;
@end

@implementation VCPFaceClusterer

- (VCPFaceClusterer)initWithPhotoLibrary:(id)a3 context:(id)a4 cancelOrExtendTimeoutBlock:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v27.receiver = self;
  v27.super_class = (Class)VCPFaceClusterer;
  v12 = [(VCPFaceClusterer *)&v27 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_photoLibrary, a3);
    objc_storeStrong((id *)&v13->_context, a4);
    v14 = [[VCPClusterer alloc] initWithPhotoLibrary:v13->_photoLibrary andContext:v13->_context];
    clusterer = v13->_clusterer;
    v13->_clusterer = v14;

    v16 = _Block_copy(v11);
    id cancelOrExtendTimeoutBlock = v13->_cancelOrExtendTimeoutBlock;
    v13->_id cancelOrExtendTimeoutBlock = v16;

    v18 = v13->_clusterer;
    id v19 = v13->_cancelOrExtendTimeoutBlock;
    id v26 = 0;
    uint64_t v20 = [(VCPClusterer *)v18 restoreClusterCacheAndSyncWithLibrary:1 cancelOrExtendTimeoutBlock:v19 error:&v26];
    id v21 = v26;
    if (v20)
    {
      v22 = v13;
      if ((int)MediaAnalysisLogLevel() < 6)
      {
LABEL_14:

        goto LABEL_15;
      }
      v23 = VCPLogInstance();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v29 = v20;
        _os_log_impl(&dword_1BBEDA000, v23, OS_LOG_TYPE_INFO, "[VCPFaceClusterer] Restored Face Clusterer with ClusterState = %ld", buf, 0xCu);
      }
      v22 = v13;
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() < 3)
      {
        v22 = 0;
        goto LABEL_14;
      }
      v23 = VCPLogInstance();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v29 = (uint64_t)v21;
        _os_log_impl(&dword_1BBEDA000, v23, OS_LOG_TYPE_ERROR, "[VCPFaceClusterer] Failed to restore clusterer (state unknown) - %@", buf, 0xCu);
      }
      v22 = 0;
    }

    goto LABEL_14;
  }
  v22 = 0;
LABEL_15:
  v24 = v22;

  return v24;
}

- (void)scheduleClusteringOfFacesWithLocalIdentifiers:(id)a3
{
}

- (void)scheduleUnclusteringOfFacesWithClusterSequenceNumbers:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
LABEL_5:
    v6 = v5;
    goto LABEL_14;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [MEMORY[0x1E4F1CAD0] setWithArray:v4];
    goto LABEL_5;
  }
  v6 = [MEMORY[0x1E4F1CA80] set];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(v6, "addObject:", *(void *)(*((void *)&v11 + 1) + 8 * v10++), (void)v11);
      }
      while (v8 != v10);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

LABEL_14:
  -[VCPClusterer scheduleClusteringAfterRemovingFaceCSNs:addingFaceIdStrs:](self->_clusterer, "scheduleClusteringAfterRemovingFaceCSNs:addingFaceIdStrs:", v6, 0, (void)v11);
}

- (unint64_t)numberOfFacesPendingClustering
{
  return [(VCPClusterer *)self->_clusterer numberOfAccumulatedClusterChanges];
}

- (BOOL)resetFaceClusteringState:(id *)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  clusterer = self->_clusterer;
  if (clusterer)
  {
    [(VCPClusterer *)self->_clusterer terminate];
    v6 = self->_clusterer;
    self->_clusterer = 0;
  }
  id v7 = [(PHPhotoLibrary *)self->_photoLibrary vcp_visionCacheStorageDirectoryURL];
  BOOL v8 = +[VCPClusterer removeClusteringStateCacheWithURL:v7 error:a3];
  if (clusterer)
  {
    uint64_t v9 = [[VCPClusterer alloc] initWithPhotoLibrary:self->_photoLibrary andContext:self->_context];
    uint64_t v10 = self->_clusterer;
    self->_clusterer = v9;

    long long v11 = self->_clusterer;
    id cancelOrExtendTimeoutBlock = self->_cancelOrExtendTimeoutBlock;
    id v21 = 0;
    uint64_t v13 = [(VCPClusterer *)v11 restoreClusterCacheAndSyncWithLibrary:1 cancelOrExtendTimeoutBlock:cancelOrExtendTimeoutBlock error:&v21];
    id v14 = v21;
    if (v14 || !v13)
    {
      if ((int)MediaAnalysisLogLevel() >= 4)
      {
        v15 = VCPLogInstance();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          uint64_t v23 = v13;
          __int16 v24 = 2112;
          id v25 = v14;
          uint64_t v16 = "Reset restore clusterer error (ClusterState = %ld): %@";
          v17 = v15;
          os_log_type_t v18 = OS_LOG_TYPE_DEFAULT;
          uint32_t v19 = 22;
          goto LABEL_12;
        }
LABEL_13:
      }
    }
    else if ((int)MediaAnalysisLogLevel() >= 6)
    {
      v15 = VCPLogInstance();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v23 = v13;
        uint64_t v16 = "Reset restored clusterer, ClusterState = %ld";
        v17 = v15;
        os_log_type_t v18 = OS_LOG_TYPE_INFO;
        uint32_t v19 = 12;
LABEL_12:
        _os_log_impl(&dword_1BBEDA000, v17, v18, v16, buf, v19);
        goto LABEL_13;
      }
      goto LABEL_13;
    }
  }
  return v8;
}

- (BOOL)getFaceClusters:(id *)a3 clusteringThreshold:(double *)a4 utilizingGPU:(BOOL *)a5 cancelOrExtendTimeoutBlock:(id)a6 error:(id *)a7
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v12 = a6;
  clusterer = self->_clusterer;
  if (clusterer)
  {
    LOBYTE(a7) = [(VCPClusterer *)clusterer getClusters:a3 threshold:a4 utilizingGPU:a5 cancelOrExtendTimeoutBlock:v12 error:a7];
  }
  else if (a7)
  {
    id v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = *MEMORY[0x1E4F28568];
    v15 = [NSString stringWithFormat:@"clusterer is not available"];
    v19[0] = v15;
    uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
    *a7 = [v14 errorWithDomain:*MEMORY[0x1E4F28760] code:-18 userInfo:v16];

    LOBYTE(a7) = 0;
  }

  return (char)a7;
}

- (unint64_t)clustererState
{
  return [(VCPClusterer *)self->_clusterer clustererState];
}

- (BOOL)clustererIsReadyToReturnSuggestions
{
  return [(VCPClusterer *)self->_clusterer isReadyToReturnSuggestions];
}

- (id)clusterer
{
  return self->_clusterer;
}

- (BOOL)_resetFaceClusteringState:(id *)a3
{
  clusterer = self->_clusterer;
  if (clusterer)
  {
    [(VCPClusterer *)self->_clusterer terminate];
    v6 = self->_clusterer;
    self->_clusterer = 0;
  }
  id v7 = [(PHPhotoLibrary *)self->_photoLibrary vcp_visionCacheStorageDirectoryURL];
  id v18 = 0;
  BOOL v8 = +[VCPClusterer removeClusteringStateCacheWithURL:v7 error:&v18];
  id v9 = v18;
  id v10 = v9;
  if (a3) {
    char v11 = v8;
  }
  else {
    char v11 = 1;
  }
  if ((v11 & 1) == 0) {
    *a3 = v9;
  }
  if (clusterer)
  {
    id v12 = [[VCPClusterer alloc] initWithPhotoLibrary:self->_photoLibrary andContext:self->_context];
    uint64_t v13 = self->_clusterer;
    self->_clusterer = v12;

    id v14 = self->_clusterer;
    id cancelOrExtendTimeoutBlock = self->_cancelOrExtendTimeoutBlock;
    id v17 = 0;
    [(VCPClusterer *)v14 restoreClusterCacheAndSyncWithLibrary:1 cancelOrExtendTimeoutBlock:cancelOrExtendTimeoutBlock error:&v17];
    id v10 = v17;
    BOOL v8 = v10 == 0;
  }

  return v8;
}

- (BOOL)reclusterFacesWithThreshold:(id)a3 shouldRecluster:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  v34[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = v8;
  if (!v8)
  {
LABEL_5:
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      char v11 = VCPLogInstance();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v32 = 0;
        _os_log_impl(&dword_1BBEDA000, v11, OS_LOG_TYPE_INFO, "Person Processing: Starting Reset Face Clustering", v32, 2u);
      }
    }
    uint64_t v12 = mach_absolute_time();
    uint64_t v13 = VCPSignPostLog();
    os_signpost_id_t v14 = os_signpost_id_generate(v13);

    v15 = VCPSignPostLog();
    uint64_t v16 = v15;
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_WORD *)v32 = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "VCPFaceProcessingResetFaceClusteringState", "", v32, 2u);
    }

    LODWORD(a5) = [(VCPFaceClusterer *)self resetFaceClusteringState:a5];
    id v17 = VCPSignPostLog();
    id v18 = v17;
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      *(_WORD *)v32 = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v18, OS_SIGNPOST_INTERVAL_END, v14, "VCPFaceProcessingResetFaceClusteringState", "", v32, 2u);
    }

    if (v12)
    {
      mach_absolute_time();
      VCPPerformance_LogMeasurement();
    }
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      uint32_t v19 = VCPLogInstance();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v32 = 0;
        _os_log_impl(&dword_1BBEDA000, v19, OS_LOG_TYPE_INFO, "Person Processing: Reset Face Clustering Done", v32, 2u);
      }
    }
    if ((a5 & v6) == 1)
    {
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        uint64_t v20 = VCPLogInstance();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v32 = 0;
          _os_log_impl(&dword_1BBEDA000, v20, OS_LOG_TYPE_INFO, "Person Processing: Starting Face Clustering", v32, 2u);
        }
      }
      uint64_t v21 = mach_absolute_time();
      v22 = VCPSignPostLog();
      os_signpost_id_t v23 = os_signpost_id_generate(v22);

      __int16 v24 = VCPSignPostLog();
      id v25 = v24;
      if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
      {
        *(_WORD *)v32 = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v25, OS_SIGNPOST_INTERVAL_BEGIN, v23, "VCPFaceProcessingPerformFaceClusteringAndWait", "", v32, 2u);
      }

      [(VCPFaceClusterer *)self clusterFaces];
      uint64_t v26 = VCPSignPostLog();
      objc_super v27 = v26;
      if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
      {
        *(_WORD *)v32 = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v27, OS_SIGNPOST_INTERVAL_END, v23, "VCPFaceProcessingPerformFaceClusteringAndWait", "", v32, 2u);
      }

      if (v21)
      {
        mach_absolute_time();
        VCPPerformance_LogMeasurement();
      }
      if ((int)MediaAnalysisLogLevel() < 6)
      {
        LOBYTE(a5) = 1;
        goto LABEL_42;
      }
      v28 = VCPLogInstance();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v32 = 0;
        _os_log_impl(&dword_1BBEDA000, v28, OS_LOG_TYPE_INFO, "Person Processing: Face Clustering Done", v32, 2u);
      }
      LOBYTE(a5) = 1;
      goto LABEL_40;
    }
    goto LABEL_42;
  }
  [v8 floatValue];
  if (v10 < 1.0 && v10 > 0.1)
  {
    -[VCPPhotosFaceProcessingContext setFaceClusteringThreshold:](self->_context, "setFaceClusteringThreshold:");
    goto LABEL_5;
  }
  if (a5)
  {
    uint64_t v29 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v33 = *MEMORY[0x1E4F28568];
    v28 = [NSString stringWithFormat:@"Face clustering threshold should be in the range: [0.1, 1.0]"];
    v34[0] = v28;
    uint64_t v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:&v33 count:1];
    *a5 = [v29 errorWithDomain:*MEMORY[0x1E4F28760] code:-50 userInfo:v30];

    LOBYTE(a5) = 0;
LABEL_40:
  }
LABEL_42:

  return (char)a5;
}

- (int)clusterFaces
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = VCPSignPostLog();
  os_signpost_id_t v4 = os_signpost_id_generate(v3);

  id v5 = VCPSignPostLog();
  BOOL v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    LOWORD(v17) = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "VCPFaceProcessingClusterFaces", "", (uint8_t *)&v17, 2u);
  }

  unint64_t v7 = [(VCPClusterer *)self->_clusterer clustererState];
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v8 = VCPLogInstance();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = [(VCPClusterer *)self->_clusterer status];
      int v17 = 134218242;
      unint64_t v18 = v7;
      __int16 v19 = 2112;
      uint64_t v20 = v9;
      _os_log_impl(&dword_1BBEDA000, v8, OS_LOG_TYPE_INFO, "---> Start face clustering (%ld) with clustering status: %@", (uint8_t *)&v17, 0x16u);
    }
  }
  [(VCPClusterer *)self->_clusterer clusterAndWaitWithCancelOrExtendTimeoutBlock:self->_cancelOrExtendTimeoutBlock];
  unint64_t v10 = [(VCPClusterer *)self->_clusterer clustererState];
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    char v11 = VCPLogInstance();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = [(VCPClusterer *)self->_clusterer status];
      int v17 = 134218242;
      unint64_t v18 = v10;
      __int16 v19 = 2112;
      uint64_t v20 = v12;
      _os_log_impl(&dword_1BBEDA000, v11, OS_LOG_TYPE_INFO, "---> Finished face clustering (%ld) with clustering status: %@", (uint8_t *)&v17, 0x16u);
    }
  }
  uint64_t v13 = VCPSignPostLog();
  os_signpost_id_t v14 = v13;
  if (v4 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v13))
  {
    LOWORD(v17) = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v14, OS_SIGNPOST_INTERVAL_END, v4, "VCPFaceProcessingClusterFaces", "", (uint8_t *)&v17, 2u);
  }

  if (v10 == 30 || v10 == 40) {
    return 0;
  }
  else {
    return -18;
  }
}

- (int)clusterFacesIfNecessary
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = VCPSignPostLog();
  os_signpost_id_t v4 = os_signpost_id_generate(v3);

  id v5 = VCPSignPostLog();
  BOOL v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    LOWORD(v17) = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "VCPFaceProcessingClusterFacesIfNecessary", "", (uint8_t *)&v17, 2u);
  }

  unint64_t v7 = [(VCPClusterer *)self->_clusterer clustererState];
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v8 = VCPLogInstance();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = [(VCPClusterer *)self->_clusterer status];
      int v17 = 134218242;
      unint64_t v18 = v7;
      __int16 v19 = 2112;
      uint64_t v20 = v9;
      _os_log_impl(&dword_1BBEDA000, v8, OS_LOG_TYPE_INFO, "---> Start face clustering as need (%ld) with clustering status: %@", (uint8_t *)&v17, 0x16u);
    }
  }
  [(VCPClusterer *)self->_clusterer clusterIfNecessaryAndWaitWithCancelOrExtendTimeoutBlock:self->_cancelOrExtendTimeoutBlock];
  unint64_t v10 = [(VCPClusterer *)self->_clusterer clustererState];
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    char v11 = VCPLogInstance();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = [(VCPClusterer *)self->_clusterer status];
      int v17 = 134218242;
      unint64_t v18 = v10;
      __int16 v19 = 2112;
      uint64_t v20 = v12;
      _os_log_impl(&dword_1BBEDA000, v11, OS_LOG_TYPE_INFO, "---> Finished face clustering (%ld) with clustering status: %@", (uint8_t *)&v17, 0x16u);
    }
  }
  uint64_t v13 = VCPSignPostLog();
  os_signpost_id_t v14 = v13;
  if (v4 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v13))
  {
    LOWORD(v17) = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v14, OS_SIGNPOST_INTERVAL_END, v4, "VCPFaceProcessingClusterFacesIfNecessary", "", (uint8_t *)&v17, 2u);
  }

  if (v10 == 30 || v10 == 40) {
    return 0;
  }
  else {
    return -18;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cancelOrExtendTimeoutBlock, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_clusterer, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

@end