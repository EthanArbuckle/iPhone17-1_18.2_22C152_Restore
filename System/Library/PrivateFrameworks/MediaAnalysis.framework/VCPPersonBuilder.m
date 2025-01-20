@interface VCPPersonBuilder
- (BOOL)_setAllFaceGroupsNeedPersonBuilding;
- (BOOL)performPersonBuildingWithCancelOrExtendTimeoutBlock:(id)a3 error:(id *)a4;
- (VCPPersonBuilder)initWithPhotoLibrary:(id)a3 andFaceClusterer:(id)a4 andContext:(id)a5;
- (void)_readFaceAnalysisState;
- (void)_setFaceAnalysisStateValue:(id)a3 forKey:(id)a4;
- (void)setLastMinimumFaceGroupSizeForCreatingMergeCandidate:(unint64_t)a3;
- (void)setPersonBuilderMergeCandidatesEnabled:(BOOL)a3;
@end

@implementation VCPPersonBuilder

- (VCPPersonBuilder)initWithPhotoLibrary:(id)a3 andFaceClusterer:(id)a4 andContext:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)VCPPersonBuilder;
  v12 = [(VCPPersonBuilder *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_photoLibrary, a3);
    objc_storeStrong((id *)&v13->_faceClusterer, a4);
    objc_storeStrong((id *)&v13->_context, a5);
    v14 = [[VCPPhotosPersistenceDelegate alloc] initWithPhotoLibrary:v13->_photoLibrary];
    persistenceDelegate = v13->_persistenceDelegate;
    v13->_persistenceDelegate = v14;

    v13->_lastMinimumFaceGroupSizeForCreatingMergeCandidates = 0;
    v13->_personBuilderMergeCandidatesEnabled = 0;
    [(VCPPersonBuilder *)v13 _readFaceAnalysisState];
  }

  return v13;
}

- (void)_readFaceAnalysisState
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CA60]);
  v4 = [(PHPhotoLibrary *)self->_photoLibrary vcp_faceAnalysisStateFilepath];
  v5 = (NSMutableDictionary *)[v3 initWithContentsOfFile:v4];
  state = self->_state;
  self->_state = v5;

  v7 = self->_state;
  if (v7)
  {
    v8 = [(NSMutableDictionary *)v7 objectForKeyedSubscript:@"PersonBuilderMergeCandidatesEnabled"];
    self->_personBuilderMergeCandidatesEnabled = [v8 BOOLValue];

    id v9 = [(NSMutableDictionary *)self->_state objectForKeyedSubscript:@"PersonBuilderLastMinimumFaceGroupSizeForCreatingMergeCandidates"];

    if (v9)
    {
      id v12 = [(NSMutableDictionary *)self->_state objectForKeyedSubscript:@"PersonBuilderLastMinimumFaceGroupSizeForCreatingMergeCandidates"];
      self->_lastMinimumFaceGroupSizeForCreatingMergeCandidates = [v12 unsignedIntegerValue];
    }
    else
    {
      self->_lastMinimumFaceGroupSizeForCreatingMergeCandidates = 0;
    }
  }
  else
  {
    id v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v11 = self->_state;
    self->_state = v10;
  }
}

- (void)_setFaceAnalysisStateValue:(id)a3 forKey:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  [(NSMutableDictionary *)v7->_state setObject:v10 forKeyedSubscript:v6];
  state = v7->_state;
  id v9 = [(PHPhotoLibrary *)v7->_photoLibrary vcp_faceAnalysisStateFilepath];
  [(NSMutableDictionary *)state writeToFile:v9 atomically:0];

  objc_sync_exit(v7);
}

- (void)setPersonBuilderMergeCandidatesEnabled:(BOOL)a3
{
  if (self->_personBuilderMergeCandidatesEnabled != a3)
  {
    self->_personBuilderMergeCandidatesEnabled = a3;
    objc_msgSend(NSNumber, "numberWithBool:");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(VCPPersonBuilder *)self _setFaceAnalysisStateValue:v4 forKey:@"PersonBuilderMergeCandidatesEnabled"];
  }
}

- (void)setLastMinimumFaceGroupSizeForCreatingMergeCandidate:(unint64_t)a3
{
  if (self->_lastMinimumFaceGroupSizeForCreatingMergeCandidates != a3)
  {
    self->_lastMinimumFaceGroupSizeForCreatingMergeCandidates = a3;
    objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(VCPPersonBuilder *)self _setFaceAnalysisStateValue:v4 forKey:@"PersonBuilderLastMinimumFaceGroupSizeForCreatingMergeCandidates"];
  }
}

- (BOOL)_setAllFaceGroupsNeedPersonBuilding
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F390A8]);
  [v3 setPhotoLibrary:self->_photoLibrary];
  [v3 setChunkSizeForFetch:500];
  char v4 = 1;
  v5 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"personBuilderState != %lu", 1);
  [v3 setPredicate:v5];

  id v6 = [MEMORY[0x1E4F39080] fetchFaceGroupsWithOptions:v3];
  if ([v6 count])
  {
    photoLibrary = self->_photoLibrary;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __55__VCPPersonBuilder__setAllFaceGroupsNeedPersonBuilding__block_invoke;
    v12[3] = &unk_1E6296FD0;
    id v13 = v6;
    id v11 = 0;
    char v4 = [(PHPhotoLibrary *)photoLibrary performChangesAndWait:v12 error:&v11];
    id v8 = v11;
    if ((v4 & 1) == 0 && (int)MediaAnalysisLogLevel() >= 3)
    {
      id v9 = VCPLogInstance();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v15 = v8;
        _os_log_impl(&dword_1BBEDA000, v9, OS_LOG_TYPE_ERROR, "Error resetting all FaceGroups Person Builder state: %@", buf, 0xCu);
      }
    }
  }

  return v4;
}

unint64_t __55__VCPPersonBuilder__setAllFaceGroupsNeedPersonBuilding__block_invoke(uint64_t a1)
{
  unint64_t result = [*(id *)(a1 + 32) count];
  if (result)
  {
    for (unint64_t i = 0; i < result; ++i)
    {
      char v4 = (void *)MEMORY[0x1C186D320]();
      v5 = [*(id *)(a1 + 32) objectAtIndexedSubscript:i];
      id v6 = [MEMORY[0x1E4F39088] changeRequestForFaceGroup:v5];
      [v6 setPersonBuilderState:1];

      unint64_t result = [*(id *)(a1 + 32) count];
    }
  }
  return result;
}

- (BOOL)performPersonBuildingWithCancelOrExtendTimeoutBlock:(id)a3 error:(id *)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (self->_lastMinimumFaceGroupSizeForCreatingMergeCandidates >= 0xF)
  {
    id v14 = 0;
  }
  else
  {
    uint64_t v7 = mach_absolute_time();
    id v8 = VCPSignPostLog();
    os_signpost_id_t v9 = os_signpost_id_generate(v8);

    id v10 = VCPSignPostLog();
    id v11 = v10;
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "VCPFaceProcessingCleanupMergeCandidates", "", (uint8_t *)&buf, 2u);
    }

    persistenceDelegate = self->_persistenceDelegate;
    id v38 = 0;
    BOOL v13 = [(VCPPhotosPersistenceDelegate *)persistenceDelegate cleanupMergeCandidatesWithMinimumFaceGroupSize:15 cancelOrExtendTimeoutBlock:v6 error:&v38];
    id v14 = v38;
    if (v13)
    {
      [(VCPPersonBuilder *)self setLastMinimumFaceGroupSizeForCreatingMergeCandidate:15];
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        id v15 = VCPLogInstance();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v14;
          _os_log_impl(&dword_1BBEDA000, v15, OS_LOG_TYPE_ERROR, "Failed to clean up merge candidates. Error: %@", (uint8_t *)&buf, 0xCu);
        }
      }
      if (a4) {
        *a4 = v14;
      }
    }
    uint64_t v16 = VCPSignPostLog();
    objc_super v17 = v16;
    if (v9 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v16))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v17, OS_SIGNPOST_INTERVAL_END, v9, "VCPFaceProcessingCleanupMergeCandidates", "", (uint8_t *)&buf, 2u);
    }

    if (v7)
    {
      mach_absolute_time();
      VCPPerformance_LogMeasurement();
    }
  }
  if (self->_personBuilderMergeCandidatesEnabled)
  {
    BOOL v18 = !self->_personBuilderMergeCandidatesEnabled;
  }
  else
  {
    [(PHPhotoLibrary *)self->_photoLibrary pn_faceProcessingProgress];
    if (v19 >= 0.9
      && [(VCPPersonBuilder *)self _setAllFaceGroupsNeedPersonBuilding])
    {
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        v20 = VCPLogInstance();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_1BBEDA000, v20, OS_LOG_TYPE_DEBUG, "->->-> Enabling personBuilderMergeCandidates", (uint8_t *)&buf, 2u);
        }
      }
      [(VCPPersonBuilder *)self setPersonBuilderMergeCandidatesEnabled:1];
      BOOL v18 = 0;
    }
    else
    {
      BOOL v18 = 1;
    }
  }
  [(VCPPhotosPersistenceDelegate *)self->_persistenceDelegate setPersonBuilderMergeCandidatesDisabled:v18];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__39;
  v44 = __Block_byref_object_dispose__39;
  id v45 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __78__VCPPersonBuilder_performPersonBuildingWithCancelOrExtendTimeoutBlock_error___block_invoke;
  aBlock[3] = &unk_1E629B548;
  aBlock[4] = &buf;
  v21 = _Block_copy(aBlock);
  v22 = self->_persistenceDelegate;
  v23 = [(VCPFaceClusterer *)self->_faceClusterer clusterer];
  [(VCPPhotosPersistenceDelegate *)v22 buildPersonWithFaceClusterer:v23 keyFaceUpdateBlock:v21 context:self->_context cancelOrExtendTimeoutBlock:v6];

  uint64_t v24 = mach_absolute_time();
  v25 = VCPSignPostLog();
  os_signpost_id_t v26 = os_signpost_id_generate(v25);

  v27 = VCPSignPostLog();
  v28 = v27;
  if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
  {
    *(_WORD *)v39 = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v28, OS_SIGNPOST_INTERVAL_BEGIN, v26, "VCPPersonBuilder_UpdateKeyface", "", v39, 2u);
  }

  v29 = self->_persistenceDelegate;
  id v36 = v14;
  BOOL v30 = [(VCPPhotosPersistenceDelegate *)v29 updateKeyFacesOfPersonsWithLocalIdentifiers:MEMORY[0x1E4F1CBF0] forceUpdate:0 cancelOrExtendTimeoutBlock:v6 error:&v36];
  id v31 = v36;

  if (!v30)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v32 = VCPLogInstance();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v39 = 138412290;
        id v40 = v31;
        _os_log_impl(&dword_1BBEDA000, v32, OS_LOG_TYPE_ERROR, "Failed to update key faces - %@", v39, 0xCu);
      }
    }
    if (a4) {
      *a4 = v31;
    }
  }
  v33 = VCPSignPostLog();
  v34 = v33;
  if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
  {
    *(_WORD *)v39 = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v34, OS_SIGNPOST_INTERVAL_END, v26, "VCPPersonBuilder_UpdateKeyface", "", v39, 2u);
  }

  if (v24)
  {
    mach_absolute_time();
    VCPPerformance_LogMeasurement();
  }

  _Block_object_dispose(&buf, 8);
  return 1;
}

void __78__VCPPersonBuilder_performPersonBuildingWithCancelOrExtendTimeoutBlock_error___block_invoke(uint64_t a1, void *a2)
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_persistenceDelegate, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_faceClusterer, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

@end