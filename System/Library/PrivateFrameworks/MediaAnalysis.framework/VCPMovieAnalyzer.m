@interface VCPMovieAnalyzer
+ (BOOL)canAnalyzeUndegraded:(id)a3 withResources:(id)a4;
+ (BOOL)enableAudioVideoFusion;
+ (BOOL)getEnableMovieHumanAction;
+ (BOOL)isHeuristicStickerScoreEnabled;
+ (BOOL)persistAudioEmbedding;
+ (float)getMaximumHighlightInSec;
+ (id)analyzerWithVCPAsset:(id)a3 withExistingAnalysis:(id)a4 forAnalysisTypes:(unint64_t)a5 withOptions:(id)a6;
+ (void)purgeCachedModels;
- (BOOL)allowStreaming;
- (BOOL)faceDominated;
- (BOOL)onDemand;
- (VCPMovieAnalyzer)initWithPHAsset:(id)a3 existingAnalysis:(id)a4 analysisTypes:(unint64_t)a5 downloadedData:(id)a6;
- (VCPMovieAnalyzer)initWithPHAsset:(id)a3 withExistingAnalysis:(id)a4 forAnalysisTypes:(unint64_t)a5;
- (VCPMovieAnalyzer)initWithPHAsset:(id)a3 withPausedAnalysis:(id)a4 forAnalysisTypes:(unint64_t)a5;
- (VCPMovieAnalyzer)initWithVCPAsset:(id)a3 withExistingAnalysis:(id)a4 forAnalysisTypes:(unint64_t)a5 withOptions:(id)a6;
- (float)maxAnalysisLength;
- (float)maxHighlightDuration;
- (id)analyzeAsset:(id)a3 streamed:(BOOL *)a4;
- (id)createDecoderForTrack:(id)a3 timerange:(id *)a4 forAnalysisTypes:(unint64_t)a5 decodedFrameRate:(float *)a6 withLossySetting:(BOOL)a7;
- (id)createVideoAnalyzerWithOrientation:(int)a3 preferredTransform:(CGAffineTransform *)a4 embeddings:(id)a5;
- (id)privateResults;
- (id)processExistingAnalysisForTimeRange:(id *)a3 analysisTypes:(unint64_t *)a4;
- (int)analyzeVideoSegment:(id)a3 timerange:(id *)a4 forAnalysisTypes:(unint64_t)a5 cancel:(id)a6;
- (int)analyzeVideoTrack:(id)a3 start:(id *)a4 forAnalysisTypes:(unint64_t)a5 cancel:(id)a6;
- (int)generateKeyFrameResource:(id)a3;
- (int)performMetadataAnalysisOnAsset:(id)a3 withCancelBlock:(id)a4;
- (int)postProcessAutoPlayable:(id)a3;
- (int64_t)status;
- (unint64_t)errorCode;
- (unint64_t)errorLine;
- (void)loadPropertiesForAsset:(id)a3;
- (void)setAllowStreaming:(BOOL)a3;
- (void)setFaceDominated:(BOOL)a3;
- (void)setMaxAnalysisLength:(float)a3;
- (void)setMaxHighlightDuration:(float)a3;
- (void)setOnDemand:(BOOL)a3;
@end

@implementation VCPMovieAnalyzer

+ (void)purgeCachedModels
{
}

+ (BOOL)canAnalyzeUndegraded:(id)a3 withResources:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (objc_msgSend(v5, "vcp_isVideoSlowmo")) {
    char v7 = objc_msgSend(v6, "vcp_hasLocalSlowmo:", objc_msgSend(v5, "vcp_hasAdjustments:", v6));
  }
  else {
    char v7 = objc_msgSend(v6, "vcp_hasLocalMovie:", objc_msgSend(v5, "hasAdjustments"));
  }
  BOOL v8 = v7;

  return v8;
}

+ (float)getMaximumHighlightInSec
{
  v2 = &OBJC_METACLASS___VCPPhotoAnalyzer;
  {
    v2 = &OBJC_METACLASS___VCPPhotoAnalyzer;
    if (v4)
    {
      +[VCPMovieAnalyzer getMaximumHighlightInSec]::length = 1092616192;
      v2 = &OBJC_METACLASS___VCPPhotoAnalyzer;
    }
  }
  return *(float *)&v2[65].superclass;
}

+ (BOOL)enableAudioVideoFusion
{
  {
    +[VCPMovieAnalyzer enableAudioVideoFusion]::enable = +[VCPAudioVideoEmbeddingFuser supportFusionForVersion:](VCPAudioVideoEmbeddingFuser, "supportFusionForVersion:", [(id)objc_opt_class() embeddingVersion]);
  }
  return +[VCPMovieAnalyzer enableAudioVideoFusion]::enable;
}

+ (BOOL)getEnableMovieHumanAction
{
  return 0;
}

+ (BOOL)isHeuristicStickerScoreEnabled
{
  return 0;
}

+ (BOOL)persistAudioEmbedding
{
  return 0;
}

- (VCPMovieAnalyzer)initWithVCPAsset:(id)a3 withExistingAnalysis:(id)a4 forAnalysisTypes:(unint64_t)a5 withOptions:(id)a6
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v42.receiver = self;
  v42.super_class = (Class)VCPMovieAnalyzer;
  v14 = [(VCPMovieAnalyzer *)&v42 init];
  if (!v14) {
    goto LABEL_42;
  }
  v15 = [v11 modificationDate];
  BOOL v16 = v15 == 0;

  if (v16)
  {
    if (!v14->_errorCode) {
      v14->_errorCode = 45;
    }
    v14->_status = 3;
    p_super = &v14->_analysis->super.super;
    v14->_analysis = 0;
    goto LABEL_41;
  }
  *(_WORD *)&v14->_allowStreaming = 0;
  [(id)objc_opt_class() getMaximumHighlightInSec];
  v14->_maxHighlightDuration = v17;
  v14->_errorCode = 0;
  v14->_errorLine = 0;
  v14->_status = 1;
  p_asset = (id *)&v14->_asset;
  v14->_unint64_t requestedAnalyses = a5;
  objc_storeStrong((id *)&v14->_asset, a3);
  uint64_t v19 = [MEMORY[0x1E4F1CA60] dictionary];
  analysis = v14->_analysis;
  v14->_analysis = (NSMutableDictionary *)v19;

  uint64_t v21 = [MEMORY[0x1E4F1CA60] dictionary];
  privateResults = v14->_privateResults;
  v14->_privateResults = (NSMutableDictionary *)v21;

  v14->_prepareLivePhotoScenes = 0;
  if ((int)SocType() < 247) {
    char v23 = 0;
  }
  else {
    char v23 = [v11 isLivePhoto] ^ 1;
  }
  v14->_supportConditionalAnalysis = v23;
  objc_storeStrong((id *)&v14->_options, a6);
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    v25 = VCPLogInstance();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      v26 = [*p_asset localIdentifier];
      v27 = MediaAnalysisTypeShortDescription(v14->_requestedAnalyses);
      *(_DWORD *)buf = 138412546;
      v44 = v26;
      __int16 v45 = 2112;
      v46 = v27;
      _os_log_impl(&dword_1BBEDA000, v25, OS_LOG_TYPE_DEBUG, "[%@][MovieAnalyzer] Initialize to process (%@)", buf, 0x16u);
    }
  }
  if (v12)
  {
    uint64_t v28 = objc_msgSend(v12, "vcp_version");
    uint64_t v29 = 70;
    if (v28 == 70)
    {
      v30 = (NSDictionary *)v12;
      existingAnalysis = v14->_existingAnalysis;
      v14->_existingAnalysis = v30;
      uint64_t v29 = v28;
      goto LABEL_18;
    }
  }
  else
  {
    uint64_t v29 = 70;
  }
  existingAnalysis = v14->_existingAnalysis;
  v14->_existingAnalysis = 0;
LABEL_18:

  [(NSMutableDictionary *)v14->_analysis vcp_setVersion:v29];
  v32 = v14->_analysis;
  v33 = [v11 modificationDate];
  [(NSMutableDictionary *)v32 vcp_setDateModified:v33];

  [(NSMutableDictionary *)v14->_analysis vcp_setStatsFlags:0];
  unint64_t requestedAnalyses = v14->_requestedAnalyses;
  if ((requestedAnalyses & 0x40000) != 0)
  {
    requestedAnalyses |= 0x40142089CuLL;
    v14->_unint64_t requestedAnalyses = requestedAnalyses;
  }
  if ((requestedAnalyses & 0x80000000000) != 0)
  {
    int v35 = [(id)objc_opt_class() enableAudioVideoFusion];
    unint64_t requestedAnalyses = v14->_requestedAnalyses;
    if (v35)
    {
      requestedAnalyses |= 0x800000000000uLL;
      v14->_unint64_t requestedAnalyses = requestedAnalyses;
    }
  }
  if ((requestedAnalyses & 0x200000000000) != 0)
  {
    int v36 = [v11 isLivePhoto];
    uint64_t v37 = 0x40000000;
    if (!v36) {
      uint64_t v37 = 0x80000000000;
    }
    unint64_t requestedAnalyses = v14->_requestedAnalyses | v37;
    v14->_unint64_t requestedAnalyses = requestedAnalyses;
  }
  if ((requestedAnalyses & 0x8000) != 0 && v14->_supportConditionalAnalysis)
  {
    requestedAnalyses |= 0x4088uLL;
    v14->_unint64_t requestedAnalyses = requestedAnalyses;
  }
  unint64_t v38 = (requestedAnalyses >> 7) & 0x80 | (requestedAnalyses >> 20) & 0x20000 | requestedAnalyses;
  if ((requestedAnalyses & 0x2000004000) != 0) {
    v14->_unint64_t requestedAnalyses = v38;
  }
  if ((requestedAnalyses >> 7) & 0x80 | requestedAnalyses & 0x80)
  {
    v14->_unint64_t requestedAnalyses = v38 | 0x1018;
    if (v14->_supportConditionalAnalysis)
    {
      v38 |= 0x5018uLL;
      v14->_unint64_t requestedAnalyses = v38;
    }
    else
    {
      v38 |= 0x1018uLL;
    }
  }
  if ((v38 & 0x4000004000) != 0) {
    v14->_unint64_t requestedAnalyses = (v38 << 28) & 0x40000000000 | (((v38 >> 38) & 1) << 40) | v38;
  }
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    p_super = VCPLogInstance();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG))
    {
      v39 = [*p_asset localIdentifier];
      v40 = MediaAnalysisTypeShortDescription(v14->_requestedAnalyses);
      *(_DWORD *)buf = 138412546;
      v44 = v39;
      __int16 v45 = 2112;
      v46 = v40;
      _os_log_impl(&dword_1BBEDA000, p_super, OS_LOG_TYPE_DEBUG, "[%@][MovieAnalyzer] Initialized to process (%@)", buf, 0x16u);
    }
LABEL_41:
  }
LABEL_42:

  return v14;
}

+ (id)analyzerWithVCPAsset:(id)a3 withExistingAnalysis:(id)a4 forAnalysisTypes:(unint64_t)a5 withOptions:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = (void *)[objc_alloc((Class)objc_opt_class()) initWithVCPAsset:v9 withExistingAnalysis:v10 forAnalysisTypes:a5 withOptions:v11];

  return v12;
}

- (VCPMovieAnalyzer)initWithPHAsset:(id)a3 withPausedAnalysis:(id)a4 forAnalysisTypes:(unint64_t)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  objc_storeStrong((id *)&self->_phAsset, a3);
  if (!v10)
  {
LABEL_10:
    char v23 = +[VCPPhotosAsset assetWithPHAsset:v9];
    v15 = [(VCPMovieAnalyzer *)self initWithVCPAsset:v23 withExistingAnalysis:0 forAnalysisTypes:a5 withOptions:0];

    goto LABEL_11;
  }
  if (objc_msgSend(v10, "vcp_version") != 70
    || (objc_msgSend(v10, "vcp_dateModified"),
        id v11 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v9, "vcp_modificationDate"),
        id v12 = objc_claimAutoreleasedReturnValue(),
        char v13 = [v11 isEqualToDate:v12],
        v12,
        v11,
        (v13 & 1) == 0))
  {
    if ((int)MediaAnalysisLogLevel() >= 5)
    {
      uint64_t v21 = VCPLogInstance();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = [v9 localIdentifier];
        *(_DWORD *)buf = 138412290;
        v27 = v22;
        _os_log_impl(&dword_1BBEDA000, v21, OS_LOG_TYPE_DEFAULT, "  [%@] Existing analysis outdated; dropping",
          buf,
          0xCu);
      }
    }
    goto LABEL_10;
  }
  v14 = +[VCPPhotosAsset assetWithPHAsset:v9];
  v15 = [(VCPMovieAnalyzer *)self initWithVCPAsset:v14 withExistingAnalysis:0 forAnalysisTypes:a5 withOptions:0];

  if (v15)
  {
    uint64_t v16 = objc_msgSend(v10, "vcp_types");
    analysis = v15->_analysis;
    v15->_requestedAnalyses &= ~v16;
    -[NSMutableDictionary vcp_setTypes:](analysis, "vcp_setTypes:", objc_msgSend(v10, "vcp_types"));
    -[NSMutableDictionary vcp_setFlags:](v15->_analysis, "vcp_setFlags:", objc_msgSend(v10, "vcp_flags"));
    -[NSMutableDictionary vcp_setStatsFlags:](v15->_analysis, "vcp_setStatsFlags:", objc_msgSend(v10, "vcp_statsFlags"));
    v18 = v15->_analysis;
    uint64_t v19 = objc_msgSend(v10, "vcp_results");
    [(NSMutableDictionary *)v18 vcp_addEntriesFromResults:v19];

    v20 = v15->_analysis;
    objc_msgSend(v10, "vcp_syncPoint");
    [(NSMutableDictionary *)v20 vcp_setSyncPoint:v25];
  }
LABEL_11:

  return v15;
}

- (VCPMovieAnalyzer)initWithPHAsset:(id)a3 existingAnalysis:(id)a4 analysisTypes:(unint64_t)a5 downloadedData:(id)a6
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  objc_storeStrong((id *)&self->_phAsset, a3);
  if (!v12)
  {
LABEL_9:
    v22 = +[VCPPhotosAsset assetWithPHAsset:v11 downloadedData:v13];
    uint64_t v19 = [(VCPMovieAnalyzer *)self initWithVCPAsset:v22 withExistingAnalysis:0 forAnalysisTypes:a5 withOptions:0];

    goto LABEL_10;
  }
  if (objc_msgSend(v12, "vcp_version") != 70
    || (objc_msgSend(v12, "vcp_dateModified"),
        v14 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v11, "vcp_modificationDate"),
        v15 = objc_claimAutoreleasedReturnValue(),
        char v16 = [v14 isEqualToDate:v15],
        v15,
        v14,
        (v16 & 1) == 0))
  {
    if ((int)MediaAnalysisLogLevel() >= 5)
    {
      v20 = VCPLogInstance();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v21 = [v11 localIdentifier];
        int v24 = 138412290;
        v25 = v21;
        _os_log_impl(&dword_1BBEDA000, v20, OS_LOG_TYPE_DEFAULT, "  [%@] Existing analysis outdated; dropping",
          (uint8_t *)&v24,
          0xCu);
      }
    }
    goto LABEL_9;
  }
  float v17 = +[VCPPhotosAsset assetWithPHAsset:v11 downloadedData:v13];
  v18 = MediaAnalysisStripOutdatedAnalysis(v11, v12);
  uint64_t v19 = [(VCPMovieAnalyzer *)self initWithVCPAsset:v17 withExistingAnalysis:v18 forAnalysisTypes:a5 withOptions:0];

LABEL_10:
  return v19;
}

- (VCPMovieAnalyzer)initWithPHAsset:(id)a3 withExistingAnalysis:(id)a4 forAnalysisTypes:(unint64_t)a5
{
  return [(VCPMovieAnalyzer *)self initWithPHAsset:a3 existingAnalysis:a4 analysisTypes:a5 downloadedData:0];
}

- (id)privateResults
{
  return self->_privateResults;
}

- (void)loadPropertiesForAsset:(id)a3
{
  v18[3] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = *MEMORY[0x1E4F15BE0];
  v17[0] = *MEMORY[0x1E4F15BA8];
  v17[1] = v4;
  v18[0] = &unk_1F15EE4C0;
  v18[1] = &unk_1F15EE4D8;
  v17[2] = *MEMORY[0x1E4F15C18];
  v18[2] = &unk_1F15EE4F0;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:3];
  id v6 = dispatch_group_create();
  dispatch_group_t v7 = dispatch_group_create();
  dispatch_group_enter(v6);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __43__VCPMovieAnalyzer_loadPropertiesForAsset___block_invoke;
  v12[3] = &unk_1E6299898;
  id v13 = v5;
  id v8 = v3;
  id v14 = v8;
  dispatch_group_t v15 = v7;
  char v16 = v6;
  id v9 = v6;
  id v10 = v7;
  id v11 = v5;
  [v8 loadValuesAsynchronouslyForKeys:&unk_1F15EE508 completionHandler:v12];
  dispatch_group_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_group_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
}

void __43__VCPMovieAnalyzer_loadPropertiesForAsset___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __43__VCPMovieAnalyzer_loadPropertiesForAsset___block_invoke_2;
  v3[3] = &unk_1E629A410;
  v2 = *(void **)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 enumerateKeysAndObjectsUsingBlock:v3];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __43__VCPMovieAnalyzer_loadPropertiesForAsset___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = [*(id *)(a1 + 32) tracksWithMediaType:a2];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v13 + 1) + 8 * v9);
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __43__VCPMovieAnalyzer_loadPropertiesForAsset___block_invoke_3;
        v11[3] = &unk_1E6296FF8;
        id v12 = *(id *)(a1 + 40);
        [v10 loadValuesAsynchronouslyForKeys:v5 completionHandler:v11];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

void __43__VCPMovieAnalyzer_loadPropertiesForAsset___block_invoke_3(uint64_t a1)
{
}

- (id)processExistingAnalysisForTimeRange:(id *)a3 analysisTypes:(unint64_t *)a4
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v29 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSDictionary *)self->_existingAnalysis vcp_degraded])
  {
    if ((int)MediaAnalysisLogLevel() < 3) {
      goto LABEL_38;
    }
    id v5 = VCPLogInstance();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf.start.value) = 0;
      _os_log_impl(&dword_1BBEDA000, v5, OS_LOG_TYPE_ERROR, "Existing analysis degraded, skip", (uint8_t *)&buf, 2u);
    }
    goto LABEL_37;
  }
  existingAnalysis = self->_existingAnalysis;
  if (existingAnalysis)
  {
    uint64_t v7 = [(NSDictionary *)existingAnalysis objectForKey:@"performedAnalysisTypes"];

    if (v7)
    {
      *a4 = self->_requestedAnalyses & [(NSDictionary *)self->_existingAnalysis vcp_types];
      long long v56 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      uint64_t v8 = [(NSDictionary *)self->_existingAnalysis vcp_results];
      id v5 = [v8 allKeys];

      uint64_t v9 = [v5 countByEnumeratingWithState:&v56 objects:v61 count:16];
      if (v9)
      {
        obj = v5;
        uint64_t v30 = *(void *)v57;
        id v10 = (CMTime *)MEMORY[0x1E4F1FA48];
        do
        {
          uint64_t v11 = 0;
          uint64_t v31 = v9;
          do
          {
            if (*(void *)v57 != v30) {
              objc_enumerationMutation(obj);
            }
            id v12 = *(void **)(*((void *)&v56 + 1) + 8 * v11);
            long long v13 = [MEMORY[0x1E4F1CA48] array];
            long long v54 = 0u;
            long long v55 = 0u;
            long long v52 = 0u;
            long long v53 = 0u;
            long long v14 = [(NSDictionary *)self->_existingAnalysis vcp_results];
            long long v15 = [v14 objectForKeyedSubscript:v12];

            v33 = v12;
            uint64_t v16 = [v15 countByEnumeratingWithState:&v52 objects:v60 count:16];
            if (v16)
            {
              uint64_t v17 = *(void *)v53;
              do
              {
                uint64_t v18 = 0;
                do
                {
                  if (*(void *)v53 != v17) {
                    objc_enumerationMutation(v15);
                  }
                  CFDictionaryRef v19 = *(const __CFDictionary **)(*((void *)&v52 + 1) + 8 * v18);
                  memset(&buf, 0, sizeof(buf));
                  CMTimeRangeMakeFromDictionary(&buf, v19);
                  if ((buf.start.flags & 1) == 0) {
                    goto LABEL_18;
                  }
                  if ((buf.duration.flags & 1) == 0) {
                    goto LABEL_18;
                  }
                  if (buf.duration.epoch) {
                    goto LABEL_18;
                  }
                  if (buf.duration.value < 0) {
                    goto LABEL_18;
                  }
                  CMTimeRange range = buf;
                  long long v20 = *(_OWORD *)&a3->var0.var3;
                  *(_OWORD *)&otherRange.start.value = *(_OWORD *)&a3->var0.var0;
                  *(_OWORD *)&otherRange.start.epoch = v20;
                  *(_OWORD *)&otherRange.duration.timescale = *(_OWORD *)&a3->var1.var1;
                  CMTimeRangeGetIntersection(&v50, &range, &otherRange);
                  if ((v50.start.flags & 1) == 0) {
                    goto LABEL_18;
                  }
                  CMTimeRange v46 = buf;
                  long long v21 = *(_OWORD *)&a3->var0.var3;
                  *(_OWORD *)&v45.start.value = *(_OWORD *)&a3->var0.var0;
                  *(_OWORD *)&v45.start.epoch = v21;
                  *(_OWORD *)&v45.duration.timescale = *(_OWORD *)&a3->var1.var1;
                  CMTimeRangeGetIntersection(&v47, &v46, &v45);
                  if ((v47.duration.flags & 1) == 0) {
                    goto LABEL_18;
                  }
                  CMTimeRange v43 = buf;
                  long long v22 = *(_OWORD *)&a3->var0.var3;
                  *(_OWORD *)&v42.start.value = *(_OWORD *)&a3->var0.var0;
                  *(_OWORD *)&v42.start.epoch = v22;
                  *(_OWORD *)&v42.duration.timescale = *(_OWORD *)&a3->var1.var1;
                  CMTimeRangeGetIntersection(&v44, &v43, &v42);
                  if (v44.duration.epoch) {
                    goto LABEL_18;
                  }
                  CMTimeRange v40 = buf;
                  long long v23 = *(_OWORD *)&a3->var0.var3;
                  *(_OWORD *)&v39.start.value = *(_OWORD *)&a3->var0.var0;
                  *(_OWORD *)&v39.start.epoch = v23;
                  *(_OWORD *)&v39.duration.timescale = *(_OWORD *)&a3->var1.var1;
                  CMTimeRangeGetIntersection(&v41, &v40, &v39);
                  if (v41.duration.value < 0) {
                    goto LABEL_18;
                  }
                  CMTimeRange v36 = buf;
                  long long v24 = *(_OWORD *)&a3->var0.var3;
                  *(_OWORD *)&v35.start.value = *(_OWORD *)&a3->var0.var0;
                  *(_OWORD *)&v35.start.epoch = v24;
                  *(_OWORD *)&v35.duration.timescale = *(_OWORD *)&a3->var1.var1;
                  CMTimeRangeGetIntersection(&v37, &v36, &v35);
                  CMTime time1 = v37.duration;
                  CMTime time2 = *v10;
                  if (CMTimeCompare(&time1, &time2)) {
LABEL_18:
                  }
                    [v13 addObject:v19];
                  ++v18;
                }
                while (v16 != v18);
                uint64_t v25 = [v15 countByEnumeratingWithState:&v52 objects:v60 count:16];
                uint64_t v16 = v25;
              }
              while (v25);
            }

            if ([v13 count]) {
              [v29 setObject:v13 forKey:v33];
            }
            else {
              *a4 &= ~MediaAnalysisResultsKeyToAnalysisType(v33);
            }

            ++v11;
          }
          while (v11 != v31);
          uint64_t v9 = [obj countByEnumeratingWithState:&v56 objects:v61 count:16];
        }
        while (v9);
        id v5 = obj;
      }
LABEL_37:
    }
  }
LABEL_38:
  return v29;
}

- (int)performMetadataAnalysisOnAsset:(id)a3 withCancelBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = VCPSignPostLog();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  id v10 = VCPSignPostLog();
  uint64_t v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)CMTimeRange buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "VCPMovieAnalyzer_Metadata", "", buf, 2u);
  }

  unint64_t requestedAnalyses = self->_requestedAnalyses;
  uint64_t v13 = [(NSMutableDictionary *)self->_analysis vcp_types];
  uint64_t v14 = requestedAnalyses & 0x40 | (4 * ((requestedAnalyses & 0xC) == 4));
  if ((requestedAnalyses & 0x880) != 0) {
    v14 |= 0x80uLL;
  }
  uint64_t v15 = (v14 | requestedAnalyses & 0x4000014030000200) & ~v13;
  if (v15)
  {
    uint64_t v16 = VCPSignPostLog();
    os_signpost_id_t v17 = os_signpost_id_generate(v16);

    uint64_t v18 = VCPSignPostLog();
    CFDictionaryRef v19 = v18;
    unint64_t v20 = v17 - 1;
    if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      *(_WORD *)CMTimeRange buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "VCPMovieAnalyzer_Metadata_VCPLightVideoAnalyzer", "", buf, 2u);
    }

    long long v21 = [[VCPLightVideoAnalyzer alloc] initWithAVAsset:v6 forAnalysisTypes:v15];
    [(VCPAsset *)self->_asset photoOffsetSeconds];
    -[VCPLightVideoAnalyzer setPhotoOffset:](v21, "setPhotoOffset:");
    if (v21)
    {
      os_signpost_id_t spid = v17;
      *(void *)CMTimeRange buf = 0;
      int v22 = [(VCPLightVideoAnalyzer *)v21 analyzeAsset:v7 flags:buf];
      if (v22)
      {
        if (!self->_errorCode) {
          self->_errorCode = 38;
        }
      }
      else
      {
        id v32 = v7;
        id v33 = v6;
        analysis = self->_analysis;
        long long v24 = [(VCPLightVideoAnalyzer *)v21 publicResults];
        [(NSMutableDictionary *)analysis vcp_addEntriesFromResults:v24];

        [(NSMutableDictionary *)self->_analysis vcp_addFlags:*(void *)buf];
        [(NSMutableDictionary *)self->_analysis vcp_addTypes:v15 & 0xBFFFFEFFCFFFFDFFLL];
        privateResults = self->_privateResults;
        uint64_t v26 = [(VCPLightVideoAnalyzer *)v21 privateResults];
        [(NSMutableDictionary *)privateResults addEntriesFromDictionary:v26];

        id v7 = v32;
        id v6 = v33;
        v27 = VCPSignPostLog();
        uint64_t v28 = v27;
        if (v20 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
        {
          *(_WORD *)CMTimeRange v35 = 0;
          _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v28, OS_SIGNPOST_INTERVAL_END, spid, "VCPMovieAnalyzer_Metadata_VCPLightVideoAnalyzer", "", v35, 2u);
        }

        id v29 = VCPSignPostLog();
        uint64_t v30 = v29;
        if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
        {
          *(_WORD *)CMTimeRange v35 = 0;
          _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v30, OS_SIGNPOST_INTERVAL_END, v9, "VCPMovieAnalyzer_Metadata", "", v35, 2u);
        }
      }
    }
    else
    {
      if (!self->_errorCode) {
        self->_errorCode = 38;
      }
      int v22 = -108;
    }
  }
  else
  {
    int v22 = 0;
    if (!self->_errorCode) {
      self->_errorCode = 45;
    }
  }

  return v22;
}

- (id)createDecoderForTrack:(id)a3 timerange:(id *)a4 forAnalysisTypes:(unint64_t)a5 decodedFrameRate:(float *)a6 withLossySetting:(BOOL)a7
{
  BOOL v7 = a7;
  v38[2] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  uint64_t v13 = v12;
  if ((a5 & 0x4004000000) != 0)
  {
    uint64_t v14 = [NSNumber numberWithUnsignedInt:875704422];
    v38[0] = v14;
    uint64_t v15 = [NSNumber numberWithUnsignedInt:875704438];
    v38[1] = v15;
    uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:2];

    uint64_t v36 = *MEMORY[0x1E4F24D70];
    CMTimeRange v37 = v16;
    os_signpost_id_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
    [v13 nominalFrameRate];
    *(_DWORD *)a6 = v18;
    CFDictionaryRef v19 = [[VCPVideoTrackStandardDecoder alloc] initWithTrack:v13 timerange:a4 withSettings:v17 applyTransform:0];
LABEL_10:
    v27 = v19;

    goto LABEL_11;
  }
  if ((a5 & 0x20000000) != 0)
  {
    if (v7)
    {
      long long v23 = [NSNumber numberWithUnsignedInt:758670896];
      v35[0] = v23;
      long long v24 = [NSNumber numberWithUnsignedInt:758674992];
      v35[1] = v24;
      uint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:2];
    }
    else
    {
      long long v23 = [NSNumber numberWithUnsignedInt:875704422];
      v34[0] = v23;
      long long v24 = [NSNumber numberWithUnsignedInt:875704438];
      v34[1] = v24;
      uint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:2];
    }
    uint64_t v16 = (void *)v25;

    uint64_t v32 = *MEMORY[0x1E4F24D70];
    id v33 = v16;
    os_signpost_id_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
    [v13 nominalFrameRate];
    *(_DWORD *)a6 = v26;
    CFDictionaryRef v19 = [[VCPVideoTrackStandardDecoder alloc] initWithTrack:v13 timerange:a4 withSettings:v17 applyTransform:0];
    goto LABEL_10;
  }
  [v12 nominalFrameRate];
  time.epoch = 0;
  *(_OWORD *)&time.value = kSampleInterval;
  if (1.25 / CMTimeGetSeconds(&time) >= v20)
  {
    [v13 nominalFrameRate];
    *(_DWORD *)a6 = v29;
    if ([(VCPAsset *)self->_asset isSlowmo])
    {
      v27 = 0;
      goto LABEL_11;
    }
    int v22 = [[VCPVideoTrackStandardDecoder alloc] initWithTrack:v13 timerange:a4];
  }
  else
  {
    v30.epoch = 0;
    *(_OWORD *)&v30.value = kSampleInterval;
    float v21 = 1.0 / CMTimeGetSeconds(&v30);
    *a6 = v21;
    int v22 = [[VCPVideoTrackSubsamplingDecoder alloc] initWithTrack:v13 timerange:a4 atInterval:&kSampleInterval];
  }
  v27 = v22;
LABEL_11:

  return v27;
}

- (id)createVideoAnalyzerWithOrientation:(int)a3 preferredTransform:(CGAffineTransform *)a4 embeddings:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a5;
  os_signpost_id_t v9 = [(NSMutableDictionary *)self->_privateResults objectForKey:@"OrientationResults"];
  id v10 = [VCPFullVideoAnalyzer alloc];
  long long v11 = *(_OWORD *)&a4->c;
  v26[0] = *(_OWORD *)&a4->a;
  v26[1] = v11;
  v26[2] = *(_OWORD *)&a4->tx;
  privateResults = self->_privateResults;
  BOOL v13 = [(VCPAsset *)self->_asset isTimelapse];
  BOOL v14 = [(VCPAsset *)self->_asset isLivePhoto];
  [(VCPAsset *)self->_asset photoOffsetSeconds];
  int v16 = v15;
  [(VCPAsset *)self->_asset exposureTimeSeconds];
  int v18 = v17;
  [(VCPAsset *)self->_asset slowmoRate];
  LODWORD(v20) = v19;
  BYTE1(v25) = self->_faceDominated;
  LOBYTE(v25) = v14;
  LODWORD(v21) = v16;
  LODWORD(v22) = v18;
  long long v23 = -[VCPFullVideoAnalyzer initWithVideoOrientation:preferredTransform:metaOrientation:privateResults:embeddings:isTimelapse:isIris:irisPhotoOffsetSec:irisPhotoExposureSec:slowMoRate:faceDominated:](v10, "initWithVideoOrientation:preferredTransform:metaOrientation:privateResults:embeddings:isTimelapse:isIris:irisPhotoOffsetSec:irisPhotoExposureSec:slowMoRate:faceDominated:", v6, v26, v9, privateResults, v8, v13, v21, v22, v20, v25);

  return v23;
}

- (int)analyzeVideoSegment:(id)a3 timerange:(id *)a4 forAnalysisTypes:(unint64_t)a5 cancel:(id)a6
{
  uint64_t v501 = *MEMORY[0x1E4F143B8];
  id v412 = a3;
  id v398 = a6;
  os_signpost_id_t v9 = VCPSignPostLog();
  os_signpost_id_t v10 = os_signpost_id_generate(v9);

  long long v11 = VCPSignPostLog();
  id v12 = v11;
  unint64_t v383 = v10 - 1;
  os_signpost_id_t spid = v10;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)CMTimeRange buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "VCPMovieAnalyzer_AnalyzeVideoSegment", "", buf, 2u);
  }

  uint64_t v487 = 0;
  long long v13 = *(_OWORD *)&a4->var0.var3;
  v486[0] = *(_OWORD *)&a4->var0.var0;
  v486[1] = v13;
  v486[2] = *(_OWORD *)&a4->var1.var1;
  uint64_t v14 = [(VCPMovieAnalyzer *)self processExistingAnalysisForTimeRange:v486 analysisTypes:&v487];
  uint64_t v15 = v487;
  v408 = (void *)v14;
  v393 = (void *)MEMORY[0x1C186D320]([(NSMutableDictionary *)self->_analysis vcp_addTypes:v487]);
  context = (void *)MEMORY[0x1C186D320]();
  int v16 = [VCPVideoEmbeddings alloc];
  int v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", +[VCPVideoTransformerBackbone embeddingVersion](VCPVideoTransformerBackbone, "embeddingVersion"));
  v401 = [(VCPVideoEmbeddings *)v16 initWithEmbeddingType:2 version:v17];

  unint64_t v18 = a5 & ~v15;
  int v485 = 0;
  if ((v18 & 0x20000000) == 0)
  {
    int v19 = 0;
    v388 = 0;
    if ((v18 & 0x4000000000) == 0)
    {
LABEL_6:
      v407 = v19;
      v400 = 0;
      double v20 = v412;
LABEL_7:
      long long v21 = *(_OWORD *)&a4->var0.var3;
      *(_OWORD *)CMTimeRange buf = *(_OWORD *)&a4->var0.var0;
      long long v499 = v21;
      long long v500 = *(_OWORD *)&a4->var1.var1;
      goto LABEL_8;
    }
    goto LABEL_36;
  }
  long long v23 = [(NSMutableDictionary *)self->_privateResults objectForKeyedSubscript:@"MetaInterpolatedFrameKey"];
  if ([v23 count])
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      long long v24 = VCPLogInstance();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)CMTimeRange buf = 0;
        _os_log_impl(&dword_1BBEDA000, v24, OS_LOG_TYPE_ERROR, "Video has already been FRC processed", buf, 2u);
      }
    }
    v407 = 0;
    if (!self->_errorCode) {
      self->_errorCode = 45;
    }
    int v28 = -18;
LABEL_25:
    int v389 = v28;
LABEL_26:

    double v22 = 0;
    v396 = 0;
    v397 = 0;
    v403 = 0;
    v404 = 0;
    v399 = 0;
    v400 = 0;
    v395 = 0;
    v417 = 0;
    v418 = 0;
    v416 = 0;
    v406 = 0;
    obuint64_t j = 0;
    v402 = 0;
    v409 = 0;
    uint64_t v385 = 0;
LABEL_34:
    int v29 = 8;
    goto LABEL_223;
  }
  uint64_t v25 = [VCPVideoInterpolator alloc];
  privateResults = self->_privateResults;
  v27 = [(VCPAsset *)self->_asset localIdentifier];
  v407 = [(VCPVideoInterpolator *)v25 initWithTimestamps:privateResults andIdentifier:v27 andTrack:v412];

  if (!v407)
  {
    v407 = 0;
    if (!self->_errorCode) {
      self->_errorCode = 45;
    }
    int v28 = -108;
    goto LABEL_25;
  }
  if (self->_requestedAnalyses == 0x20000000 && [(VCPVideoInterpolator *)v407 processAborted])
  {
    int v389 = 0;
    if (!self->_errorCode) {
      self->_errorCode = 0;
    }
    goto LABEL_26;
  }
  [(VCPVideoInterpolator *)v407 adjustedTimeRange];
  v388 = [(VCPMovieAnalyzer *)self createDecoderForTrack:v412 timerange:buf forAnalysisTypes:v18 decodedFrameRate:&v485 withLossySetting:[(VCPVideoInterpolator *)v407 enableStyle]];

  if ((v18 & 0x4000000000) == 0)
  {
    double v20 = v412;
    if (v388)
    {
      v400 = 0;
      goto LABEL_39;
    }
    int v19 = v407;
    goto LABEL_6;
  }
  int v19 = v407;
LABEL_36:
  v407 = v19;
  CMTime v30 = [(NSMutableDictionary *)self->_analysis objectForKeyedSubscript:@"metadataRanges"];
  uint64_t v31 = [v30 objectForKeyedSubscript:@"VideoStabilizationResults"];
  uint64_t v32 = [v31 objectAtIndexedSubscript:0];
  id v33 = [v32 objectForKeyedSubscript:@"attributes"];
  v34 = [v33 objectForKeyedSubscript:@"stabilizationRecipe"];

  v400 = [[VCPSettlingEffectAnalyzer alloc] initWithTimestamps:self->_privateResults andTrack:v412 andRecipe:v34 withOptions:self->_options];
  if (!v400)
  {
    if (!self->_errorCode) {
      self->_errorCode = 45;
    }

    v397 = 0;
    v404 = 0;
    v400 = 0;
    goto LABEL_78;
  }

  if (v388)
  {
    double v20 = v412;
    goto LABEL_39;
  }
  double v20 = v412;
  if ([(VCPSettlingEffectAnalyzer *)v400 processAborted]) {
    goto LABEL_7;
  }
  [(VCPSettlingEffectAnalyzer *)v400 adjustedTimeRange];
LABEL_8:
  v388 = [(VCPMovieAnalyzer *)self createDecoderForTrack:v20 timerange:buf forAnalysisTypes:v18 decodedFrameRate:&v485 withLossySetting:0];
  if (!v388)
  {
    double v22 = 0;
    v396 = 0;
    v397 = 0;
    v403 = 0;
    v404 = 0;
    v395 = 0;
    v399 = 0;
    v417 = 0;
    v418 = 0;
    v416 = 0;
    v406 = 0;
    obuint64_t j = 0;
    v402 = 0;
    v409 = 0;
    uint64_t v385 = 0;
    if (!self->_errorCode) {
      self->_errorCode = 45;
    }
    int v389 = -18;
    goto LABEL_34;
  }
LABEL_39:
  if ((v18 & 0x880) == 0)
  {
    obuint64_t j = 0;
    goto LABEL_48;
  }
  uint64_t v35 = objc_msgSend(v20, "vcp_orientation");
  if (v20) {
    [v20 preferredTransform];
  }
  else {
    memset(v484, 0, sizeof(v484));
  }
  obuint64_t j = [(VCPMovieAnalyzer *)self createVideoAnalyzerWithOrientation:v35 preferredTransform:v484 embeddings:v401];
  if (!obj)
  {
    CMTimeRange v44 = self;
    if (!self->_errorCode)
    {
      v396 = 0;
      v397 = 0;
      v403 = 0;
      v404 = 0;
      v395 = 0;
      v399 = 0;
      v417 = 0;
      v418 = 0;
      v416 = 0;
      v406 = 0;
      obuint64_t j = 0;
      v402 = 0;
      v409 = 0;
      uint64_t v385 = 0;
      uint64_t v57 = 62;
      goto LABEL_220;
    }
    v397 = 0;
    v404 = 0;
LABEL_78:
    v395 = 0;
    v396 = 0;
    v403 = 0;
    v399 = 0;
    v417 = 0;
    v418 = 0;
    v416 = 0;
    v406 = 0;
    obuint64_t j = 0;
    goto LABEL_136;
  }
LABEL_48:
  if ((v18 & 8) != 0)
  {
    uint64_t v36 = [(NSMutableDictionary *)self->_analysis vcp_results];
    CMTimeRange v37 = [v36 objectForKeyedSubscript:@"FacePrintResults"];

    long long v38 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v483[0] = *MEMORY[0x1E4F1DAB8];
    v483[1] = v38;
    v483[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    uint64_t v39 = +[VCPVideoFaceDetector faceDetectorWithTransform:v483 withExistingFaceprints:v37 tracking:[(VCPAsset *)self->_asset isLivePhoto] ^ 1 faceDominated:self->_faceDominated cancel:v398];
    if (!v39)
    {
      if (!self->_errorCode) {
        self->_errorCode = 45;
      }

      v396 = 0;
      v397 = 0;
      v403 = 0;
      v404 = 0;
      v395 = 0;
      v399 = 0;
      v417 = 0;
      v418 = 0;
      v416 = 0;
      v406 = 0;
      goto LABEL_136;
    }
    v406 = (void *)v39;

    double v20 = v412;
    if ((v18 & 0x8000) == 0) {
      goto LABEL_55;
    }
  }
  else
  {
    v406 = 0;
    if ((v18 & 0x8000) == 0)
    {
LABEL_55:
      v416 = 0;
      goto LABEL_56;
    }
  }
  if ((int)SocType() < 247 || [(VCPAsset *)self->_asset isLivePhoto]) {
    goto LABEL_55;
  }
  v416 = objc_alloc_init(VCPVideoActivityAnalyzer);
  if (!v416)
  {
    CMTimeRange v44 = self;
    if (self->_errorCode)
    {
      v396 = 0;
      v397 = 0;
      v403 = 0;
      v404 = 0;
      v395 = 0;
      v399 = 0;
      v417 = 0;
      v418 = 0;
      v416 = 0;
      goto LABEL_136;
    }
    v396 = 0;
    v397 = 0;
    v403 = 0;
    v404 = 0;
    v395 = 0;
    v399 = 0;
    v417 = 0;
    v418 = 0;
    v416 = 0;
    v402 = 0;
    v409 = 0;
    uint64_t v385 = 0;
    uint64_t v57 = 61;
    goto LABEL_220;
  }
LABEL_56:
  if ((v18 & 0x4000) != 0)
  {
    v417 = objc_alloc_init(VCPVideoSceneClassifier);
    if (!v417)
    {
      CMTimeRange v44 = self;
      if (self->_errorCode)
      {
        v396 = 0;
        v397 = 0;
        v403 = 0;
        v404 = 0;
        v395 = 0;
        v399 = 0;
        v417 = 0;
        v418 = 0;
        goto LABEL_136;
      }
      v396 = 0;
      v397 = 0;
      v403 = 0;
      v404 = 0;
      v395 = 0;
      v399 = 0;
      v417 = 0;
      v418 = 0;
      goto LABEL_219;
    }
  }
  else
  {
    v417 = 0;
  }
  if ((v18 & 0x1000) != 0)
  {
    CMTimeRange v40 = [VCPVideoSaliencyAnalyzer alloc];
    long long v41 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v482[0] = *MEMORY[0x1E4F1DAB8];
    v482[1] = v41;
    v482[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    v418 = [(VCPVideoSaliencyAnalyzer *)v40 initWithTransform:v482];
    if (!v418)
    {
      CMTimeRange v44 = self;
      if (self->_errorCode)
      {
        v396 = 0;
        v397 = 0;
        v403 = 0;
        v404 = 0;
        v395 = 0;
        v399 = 0;
        v418 = 0;
        goto LABEL_136;
      }
      v396 = 0;
      v397 = 0;
      v403 = 0;
      v404 = 0;
      v395 = 0;
      v399 = 0;
      v418 = 0;
      v402 = 0;
      v409 = 0;
      uint64_t v385 = 0;
      uint64_t v57 = 79;
      goto LABEL_220;
    }
  }
  else
  {
    v418 = 0;
  }
  if ((v18 & 0x20000) != 0 && DeviceHasANE())
  {
    CMTimeRange v42 = [VCPVideoPetsAnalyzer alloc];
    long long v43 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v481[0] = *MEMORY[0x1E4F1DAB8];
    v481[1] = v43;
    v481[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    v399 = [(VCPVideoPetsAnalyzer *)v42 initWithTransform:v481];
    if (!v399)
    {
      CMTimeRange v44 = self;
      if (self->_errorCode)
      {
        v396 = 0;
        v397 = 0;
        v403 = 0;
        v404 = 0;
        v395 = 0;
        v399 = 0;
LABEL_136:
        v402 = 0;
        v409 = 0;
        uint64_t v385 = 0;
LABEL_221:
        int v389 = -108;
        int v29 = 8;
        goto LABEL_222;
      }
      v396 = 0;
      v397 = 0;
      v403 = 0;
      v404 = 0;
      v395 = 0;
      v399 = 0;
      v402 = 0;
      v409 = 0;
      uint64_t v385 = 0;
      uint64_t v57 = 78;
LABEL_220:
      v44->_errorCode = v57;
      goto LABEL_221;
    }
  }
  else
  {
    v399 = 0;
  }
  if ((v18 & 0x2000000000) != 0 && DeviceHasANE())
  {
    v397 = [[VCPVideoPetsActionAnalyzer alloc] initWithTimeOfInterest:0];
    if (!v397)
    {
      CMTimeRange v44 = self;
      if (!self->_errorCode)
      {
        v396 = 0;
        v397 = 0;
        v403 = 0;
        v404 = 0;
        v395 = 0;
        v402 = 0;
        v409 = 0;
        uint64_t v385 = 0;
        uint64_t v57 = 77;
        goto LABEL_220;
      }
      v397 = 0;
      goto LABEL_131;
    }
  }
  else
  {
    v397 = 0;
  }
  if ((v18 & 0x40000) != 0)
  {
    CMTimeRange v46 = self->_privateResults;
    if (!v46
      || (-[NSMutableDictionary objectForKeyedSubscript:](v46, "objectForKeyedSubscript:", @"MetaLensSwitchResults"), CMTimeRange v47 = objc_claimAutoreleasedReturnValue(), v48 = [v47 count] == 0, v47, v46 = self->_privateResults, v48))
    {
      unsigned int v410 = 0;
    }
    else
    {
      v49 = [(NSMutableDictionary *)v46 objectForKeyedSubscript:@"MetaLensSwitchResults"];
      CMTimeRange v50 = [v49 objectAtIndexedSubscript:0];
      v51 = [v50 objectForKeyedSubscript:@"quality"];
      unsigned int v410 = [v51 BOOLValue];

      CMTimeRange v46 = self->_privateResults;
    }
    long long v52 = [(NSMutableDictionary *)v46 objectForKeyedSubscript:@"MetaLensSwitchResults"];
    long long v53 = [v52 objectAtIndexedSubscript:0];
    long long v54 = [v53 objectForKeyedSubscript:@"ZoomChangeScore"];
    char v405 = [v54 BOOLValue];

    long long v55 = [VCPMovieCurationAnalyzer alloc];
    uint64_t v56 = [(NSMutableDictionary *)self->_analysis vcp_types];
    if (v412) {
      [v412 preferredTransform];
    }
    else {
      memset(v480, 0, sizeof(v480));
    }
    long long v58 = *(_OWORD *)&a4->var0.var3;
    v479[0] = *(_OWORD *)&a4->var0.var0;
    v479[1] = v58;
    v479[2] = *(_OWORD *)&a4->var1.var1;
    BOOL v59 = [(VCPAsset *)self->_asset isLivePhoto];
    [(VCPAsset *)self->_asset photoOffsetSeconds];
    int v61 = v60;
    BOOL v62 = [(VCPAsset *)self->_asset hadFlash];
    v63 = [v408 objectForKeyedSubscript:@"KeyFrameResults"];
    BOOL v64 = [(VCPAsset *)self->_asset isTimelapse];
    asset = self->_asset;
    if (asset) {
      [(VCPAsset *)asset slomoRange];
    }
    else {
      memset(v478, 0, sizeof(v478));
    }
    v66 = [v412 asset];
    LOBYTE(v356) = v64;
    LOBYTE(v355) = v405;
    LODWORD(v67) = v61;
    v68 = [(VCPMovieCurationAnalyzer *)v55 initWithAnalysisTypes:v56 | v18 transform:v480 timeRange:v479 isLivePhoto:v59 photoOffset:v62 hadFlash:v410 hadZoom:v67 settlingHadZoom:v355 keyFrameResults:v63 isTimelapse:v356 preferredTimeRange:v478 asset:v66];

    if (!v68)
    {
      CMTimeRange v44 = self;
      if (!self->_errorCode)
      {
        v403 = 0;
        v404 = 0;
        v395 = 0;
        v396 = 0;
        v402 = 0;
        v409 = 0;
        uint64_t v385 = 0;
        uint64_t v57 = 46;
        goto LABEL_220;
      }
LABEL_131:
      v403 = 0;
      v404 = 0;
      v395 = 0;
      v396 = 0;
      goto LABEL_136;
    }
    *(float *)&double v69 = self->_maxHighlightDuration;
    double v20 = v412;
    CMTimeRange v45 = v68;
    [(VCPMovieCurationAnalyzer *)v68 setMaxHighlightDuration:v69];
  }
  else
  {
    CMTimeRange v45 = 0;
  }
  v396 = v45;
  if ((v18 & 0x4000000) != 0)
  {
    v395 = +[VCPVideoStabilizer videoStabilizerforAnalysisType:withMetadata:sourceSize:cropRect:](VCPVideoStabilizer, "videoStabilizerforAnalysisType:withMetadata:sourceSize:cropRect:", 0x4000000, 0, *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8), *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    if (v395) {
      goto LABEL_109;
    }
    CMTimeRange v44 = self;
    if (self->_errorCode)
    {
      v403 = 0;
      v404 = 0;
      v395 = 0;
      goto LABEL_136;
    }
    v403 = 0;
    v404 = 0;
    v395 = 0;
LABEL_219:
    v402 = 0;
    v409 = 0;
    uint64_t v385 = 0;
    uint64_t v57 = 45;
    goto LABEL_220;
  }
  v395 = 0;
LABEL_109:
  if (+[VCPMovieAnalyzer getEnableMovieHumanAction]) {
    char HasANE = 1;
  }
  else {
    char HasANE = DeviceHasANE();
  }
  if ((v18 & 0x80040040000) == 0) {
    goto LABEL_120;
  }
  if ([(VCPAsset *)self->_asset isLivePhoto])
  {
    uint64_t v71 = [(VCPAsset *)self->_asset faces];
    v72 = NSNumber;
    [(VCPAsset *)self->_asset photoOffsetSeconds];
    objc_msgSend(v72, "numberWithFloat:");
    int v73 = 0;
    char HasANE = 1;
    v382 = v381 = (void *)v71;
    goto LABEL_121;
  }
  if ((v18 & 0x40000000) == 0
    || ![(VCPAsset *)self->_asset isMovie]
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || (phAsset = self->_phAsset) == 0
    || [(PHAsset *)phAsset vcp_quickFaceClassificationDone])
  {
LABEL_120:
    v381 = 0;
    v382 = 0;
    int v73 = 0;
    goto LABEL_121;
  }
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    v233 = VCPLogInstance();
    if (os_log_type_enabled(v233, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)CMTimeRange buf = 0;
      _os_log_impl(&dword_1BBEDA000, v233, OS_LOG_TYPE_DEBUG, "Movie analyzer perform VCPPhotosQuickFaceDetection", buf, 2u);
    }
  }
  v411 = (void *)MEMORY[0x1C186D320]();
  v234 = VCPSignPostLog();
  os_signpost_id_t v235 = os_signpost_id_generate(v234);

  v236 = VCPSignPostLog();
  v237 = v236;
  if (v235 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v236))
  {
    *(_WORD *)CMTimeRange buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v237, OS_SIGNPOST_INTERVAL_BEGIN, v235, "VCPMovieAnalyzer_Video_VCPPhotosQuickFaceDetection", "", buf, 2u);
  }

  v238 = [VCPPhotosQuickFaceDetectionManager alloc];
  v239 = [(PHAsset *)self->_phAsset photoLibrary];
  v240 = [(VCPPhotosQuickFaceDetectionManager *)v238 initWithPhotoLibrary:v239];

  if (v240)
  {
    int v389 = [(VCPPhotosQuickFaceDetectionManager *)v240 processAsset:self->_phAsset];
    if (!v389)
    {
      v277 = VCPSignPostLog();
      v278 = v277;
      if (v235 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v277))
      {
        *(_WORD *)CMTimeRange buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v278, OS_SIGNPOST_INTERVAL_END, v235, "VCPMovieAnalyzer_Video_VCPPhotosQuickFaceDetection", "", buf, 2u);
      }

      int v29 = 0;
      int v389 = 0;
      char v241 = 1;
      goto LABEL_446;
    }
    char v241 = 0;
    if (!self->_errorCode) {
      self->_errorCode = 45;
    }
  }
  else
  {
    char v241 = 0;
    if (!self->_errorCode) {
      self->_errorCode = 45;
    }
    int v389 = -18;
  }
  int v29 = 8;
LABEL_446:

  double v20 = v412;
  if ((v241 & 1) == 0)
  {
    v381 = 0;
    v377 = 0;
    v403 = 0;
    v404 = 0;
    v402 = 0;
    v409 = 0;
    uint64_t v385 = 0;

    goto LABEL_363;
  }
  v381 = 0;
  v382 = 0;
  int v73 = v389;
LABEL_121:
  if ((v18 & 0x40400000) != 0
    && +[VCPCNNEspressoContext supportGPU]
    && !self->_faceDominated)
  {
    v403 = [[VCPVideoHumanActionAnalyzer alloc] initWithTimeOfInterest:v382 phFaces:v381];
    if (!v403)
    {
      if (!self->_errorCode)
      {
        v377 = 0;
        v403 = 0;
        v404 = 0;
        v402 = 0;
        v409 = 0;
        uint64_t v385 = 0;
        self->_errorCode = 68;
        goto LABEL_214;
      }
      v377 = 0;
      v403 = 0;
      v404 = 0;
      goto LABEL_212;
    }
  }
  else
  {
    v403 = 0;
  }
  if ((v18 & 0x200000000000) != 0)
  {
    v75 = [VCPVideoCaptionAnalyzer alloc];
    int v76 = v485;
    if (v20)
    {
      [v20 timeRange];
    }
    else
    {
      HIDWORD(v77) = 0;
      memset(v477, 0, sizeof(v477));
    }
    LODWORD(v77) = v76;
    uint64_t v81 = [(VCPVideoCaptionAnalyzer *)v75 initWithModelType:2 frameRate:v477 timeRange:v77];
  }
  else
  {
    if ((v18 & 0x100000000) == 0)
    {
      v404 = 0;
      goto LABEL_150;
    }
    v78 = [VCPVideoCaptionAnalyzer alloc];
    int v79 = v485;
    if (v20)
    {
      [v20 timeRange];
    }
    else
    {
      HIDWORD(v80) = 0;
      memset(v476, 0, sizeof(v476));
    }
    LODWORD(v80) = v79;
    uint64_t v81 = [(VCPVideoCaptionAnalyzer *)v78 initWithModelType:1 frameRate:v476 timeRange:v80];
  }
  v404 = (void *)v81;
  if (!v81)
  {
    v87 = self;
    if (self->_errorCode)
    {
      v377 = 0;
      v404 = 0;
LABEL_212:
      v402 = 0;
      v409 = 0;
      goto LABEL_213;
    }
    v377 = 0;
    v404 = 0;
    v402 = 0;
    v409 = 0;
    uint64_t v385 = 0;
    uint64_t v127 = 63;
LABEL_360:
    v87->_errorCode = v127;
    goto LABEL_361;
  }
LABEL_150:
  char v82 = HasANE ^ 1;
  if ((v18 & 0x240040000) == 0) {
    char v82 = 1;
  }
  if ((v18 & 0x80000000000) != 0 || (v82 & 1) == 0)
  {
    v84 = [VCPVideoCNNAnalyzer alloc];
    int v85 = v485;
    BOOL v86 = [(VCPAsset *)self->_asset isLivePhoto];
    if (v20) {
      [v20 timeRange];
    }
    else {
      memset(v475, 0, sizeof(v475));
    }
    [(VCPAsset *)self->_asset photoOffsetSeconds];
    LODWORD(v89) = v88;
    LODWORD(v90) = v85;
    v83 = [(VCPVideoCNNAnalyzer *)v84 initWithTimeOfInteret:v382 frameRate:v86 isLivePhoto:v381 phFaces:v475 timeRange:v401 withEmbeddings:v18 requestedAnalyses:v90 photoOffset:v89];
    if (v83) {
      goto LABEL_161;
    }
    v87 = self;
    if (self->_errorCode)
    {
      v377 = 0;
      goto LABEL_212;
    }
    v377 = 0;
    v402 = 0;
    v409 = 0;
    uint64_t v385 = 0;
    uint64_t v127 = 64;
    goto LABEL_360;
  }
  v83 = 0;
LABEL_161:
  v409 = v83;
  if ((~self->_requestedAnalyses & 0x880000000000) != 0
    || ![(id)objc_opt_class() enableAudioVideoFusion])
  {
    v402 = 0;
  }
  else
  {
    int v91 = _os_feature_enabled_impl();
    v92 = [VCPAudioVideoEmbeddingFuser alloc];
    if (v91) {
      uint64_t v93 = 5;
    }
    else {
      uint64_t v93 = 4;
    }
    v402 = [(VCPAudioVideoEmbeddingFuser *)v92 initWithEmbeddingVersion:v93];
    if (!v402)
    {
      v87 = self;
      if (self->_errorCode)
      {
        v377 = 0;
        v402 = 0;
LABEL_213:
        uint64_t v385 = 0;
LABEL_214:
        int v389 = -108;
        int v29 = 8;
        goto LABEL_362;
      }
      v377 = 0;
      v402 = 0;
LABEL_359:
      uint64_t v385 = 0;
      uint64_t v127 = 45;
      goto LABEL_360;
    }
  }
  if ((v18 & 0x40000000000) != 0)
  {
    v95 = objc_alloc_init(MADVideoSafetyClassifier);
    v94 = v95;
    if (!v95)
    {
      v87 = self;
      if (self->_errorCode)
      {
        v377 = 0;
        uint64_t v385 = 0;
LABEL_361:
        int v389 = -108;
        int v29 = 8;
        goto LABEL_362;
      }
      v377 = 0;
      goto LABEL_359;
    }
    long long v473 = *(_OWORD *)&a4->var1.var0;
    int64_t var3 = a4->var1.var3;
    [(MADVideoSafetyClassifier *)v95 configureProcessTimeIntervalFrom:&v473];
  }
  else
  {
    v94 = 0;
  }
  v372 = v94;
  BOOL v97 = self->_supportConditionalAnalysis && v417 != 0;
  int v376 = v73;
  if (v83)
  {
    v98 = [VCPVideoCNNHighlightTimeRangePredictor alloc];
    uint64_t v99 = [(VCPVideoCNNAnalyzer *)v83 highlightEnabled];
    uint64_t v100 = [(VCPVideoCNNAnalyzer *)v83 postInference];
    [(VCPVideoCNNAnalyzer *)v83 minProcessingInterval];
    int v102 = v101;
    [(VCPVideoCNNAnalyzer *)v83 timeStart];
    LODWORD(v103) = v102;
    v104 = [(VCPVideoCNNHighlightTimeRangePredictor *)v98 initWithHightlightEnabled:v99 postInference:v100 minProcessingInterval:v472 startTime:v103];
  }
  else
  {
    v104 = 0;
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __74__VCPMovieAnalyzer_analyzeVideoSegment_timerange_forAnalysisTypes_cancel___block_invoke;
  aBlock[3] = &unk_1E629B428;
  id v105 = v398;
  id v471 = v105;
  aBlock[4] = self;
  v106 = v407;
  v462 = v106;
  id v370 = v406;
  id v463 = v370;
  v366 = v417;
  v464 = v366;
  v363 = v418;
  v465 = v363;
  v371 = v104;
  v466 = v371;
  v375 = v403;
  v467 = v375;
  id v374 = v404;
  id v468 = v374;
  v362 = v399;
  v469 = v362;
  v361 = v397;
  v470 = v361;
  v380 = _Block_copy(aBlock);
  v457[0] = MEMORY[0x1E4F143A8];
  v457[1] = 3221225472;
  v457[2] = __74__VCPMovieAnalyzer_analyzeVideoSegment_timerange_forAnalysisTypes_cancel___block_invoke_576;
  v457[3] = &unk_1E629B450;
  id v107 = v105;
  id v459 = v107;
  v457[4] = self;
  id v368 = obj;
  id v458 = v368;
  BOOL v460 = v97;
  v379 = _Block_copy(v457);
  v447[0] = MEMORY[0x1E4F143A8];
  v447[1] = 3221225472;
  v447[2] = __74__VCPMovieAnalyzer_analyzeVideoSegment_timerange_forAnalysisTypes_cancel___block_invoke_583;
  v447[3] = &unk_1E629B478;
  id v108 = v107;
  id v456 = v108;
  v357 = v106;
  v448 = v357;
  v449 = self;
  v365 = v416;
  v450 = v365;
  v360 = v45;
  v451 = v360;
  v373 = v83;
  v452 = v373;
  id v359 = v395;
  id v453 = v359;
  v358 = v400;
  v454 = v358;
  v377 = v372;
  v455 = v377;
  v378 = _Block_copy(v447);
  v386 = (void *)MEMORY[0x1C186D320]();
  v109 = VCPSignPostLog();
  os_signpost_id_t v390 = os_signpost_id_generate(v109);

  v110 = VCPSignPostLog();
  v111 = v110;
  if (v390 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v110))
  {
    *(_WORD *)CMTimeRange buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v111, OS_SIGNPOST_INTERVAL_BEGIN, v390, "VCPMovieAnalyzer_AnalyzeVideoSegment_FrameProcessing", "", buf, 2u);
  }

  if DeviceHasANE() && (_os_feature_enabled_impl())
  {
    v112 = [VCPVideoAnalysisPipelineManager alloc];
    v113 = _Block_copy(v380);
    v497[0] = v113;
    v114 = _Block_copy(v379);
    v497[1] = v114;
    v115 = _Block_copy(v378);
    v497[2] = v115;
    v116 = [MEMORY[0x1E4F1C978] arrayWithObjects:v497 count:3];
    v117 = [(VCPVideoAnalysisPipelineManager *)v112 initWithVideoAnalysisBlocks:v116 videoDecoder:v388 maxBufferedFrames:20 cancelBlock:v108];

    int v118 = [v117 run];
    if (v118)
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v119 = VCPLogInstance();
        if (os_log_type_enabled(v119, OS_LOG_TYPE_ERROR))
        {
          id v120 = (id)objc_opt_class();
          *(_DWORD *)CMTimeRange buf = 138412290;
          *(void *)&uint8_t buf[4] = v120;
          _os_log_impl(&dword_1BBEDA000, v119, OS_LOG_TYPE_ERROR, "[%@] Failed on running VCPVideoAnalysisPipelineManager, bail out.", buf, 0xCu);
        }
      }
      uint64_t v385 = 0;
      if (!self->_errorCode) {
        self->_errorCode = 45;
      }
      int v29 = 8;
      int v376 = v118;
    }
    else
    {
      uint64_t v385 = [v117 flags];
LABEL_319:

      v195 = VCPSignPostLog();
      v117 = v195;
      if (v390 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v195))
      {
        *(_WORD *)CMTimeRange buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v117, OS_SIGNPOST_INTERVAL_END, v390, "VCPMovieAnalyzer_AnalyzeVideoSegment_FrameProcessing", "", buf, 2u);
      }
      int v29 = 0;
    }
    goto LABEL_326;
  }
  v121 = 0;
  v117 = 0;
  uint64_t v385 = 0;
  while (1)
  {
    uint64_t v122 = [v388 copyNextSampleBuffer];
    id v123 = v121;

    v117 = v123;
    if (v122)
    {
      v124 = [[VCPVideoAnalysisPipelineFrameResource alloc] initWithSampleBuffer:v122];

      v121 = v124;
    }
    else
    {
      v121 = 0;
      v124 = (VCPVideoAnalysisPipelineFrameResource *)v123;
    }

    if ((unint64_t)v123 | (unint64_t)v121) {
      int v125 = 0;
    }
    else {
      int v125 = 98;
    }
    if (!v123) {
      goto LABEL_207;
    }
    int v126 = (*((uint64_t (**)(void *, id, opaqueCMSampleBuffer *))v380 + 2))(v380, v123, [(VCPVideoAnalysisPipelineFrameResource *)v121 frameSampleBuffer]);
    if (v126)
    {
      if ((int)MediaAnalysisLogLevel() < 3) {
        goto LABEL_310;
      }
      v190 = VCPLogInstance();
      if (os_log_type_enabled(v190, OS_LOG_TYPE_ERROR))
      {
        id v191 = (id)objc_opt_class();
        *(_DWORD *)CMTimeRange buf = 138412290;
        *(void *)&uint8_t buf[4] = v191;
        _os_log_impl(&dword_1BBEDA000, v190, OS_LOG_TYPE_ERROR, "[%@] Failed on executing pipelineBlock0, bail out.", buf, 0xCu);
      }
      goto LABEL_309;
    }
    int v126 = (*((uint64_t (**)(void *, id, opaqueCMSampleBuffer *))v379 + 2))(v379, v123, [(VCPVideoAnalysisPipelineFrameResource *)v121 frameSampleBuffer]);
    if (v126)
    {
      if ((int)MediaAnalysisLogLevel() < 3) {
        goto LABEL_310;
      }
      v190 = VCPLogInstance();
      if (os_log_type_enabled(v190, OS_LOG_TYPE_ERROR))
      {
        id v192 = (id)objc_opt_class();
        *(_DWORD *)CMTimeRange buf = 138412290;
        *(void *)&uint8_t buf[4] = v192;
        _os_log_impl(&dword_1BBEDA000, v190, OS_LOG_TYPE_ERROR, "[%@] Failed on executing pipelineBlock1, bail out.", buf, 0xCu);
      }
      goto LABEL_309;
    }
    int v126 = (*((uint64_t (**)(void *, id, opaqueCMSampleBuffer *))v378 + 2))(v378, v123, [(VCPVideoAnalysisPipelineFrameResource *)v121 frameSampleBuffer]);
    if (v126) {
      break;
    }
    int v125 = 0;
    v385 |= [v123 frameFlags];
LABEL_207:
    if (v125)
    {
      if ([v388 status] == 2)
      {

        goto LABEL_319;
      }
      p_errorCode = &self->_errorCode;
      int v126 = -19;
      if (self->_errorCode)
      {
        int v376 = -19;
        goto LABEL_317;
      }
      goto LABEL_315;
    }
  }
  if ((int)MediaAnalysisLogLevel() < 3) {
    goto LABEL_310;
  }
  v190 = VCPLogInstance();
  if (os_log_type_enabled(v190, OS_LOG_TYPE_ERROR))
  {
    id v193 = (id)objc_opt_class();
    *(_DWORD *)CMTimeRange buf = 138412290;
    *(void *)&uint8_t buf[4] = v193;
    _os_log_impl(&dword_1BBEDA000, v190, OS_LOG_TYPE_ERROR, "[%@] Failed on executing pipelineBlock2, bail out.", buf, 0xCu);
  }
LABEL_309:

LABEL_310:
  p_errorCode = &self->_errorCode;
  if (self->_errorCode) {
    goto LABEL_316;
  }
LABEL_315:
  unint64_t *p_errorCode = 45;
LABEL_316:
  int v376 = v126;
LABEL_317:

  int v29 = 8;
LABEL_326:

  if (v29)
  {
    int v389 = v376;
    goto LABEL_357;
  }
  v196 = VCPSignPostLog();
  os_signpost_id_t v364 = os_signpost_id_generate(v196);

  v197 = VCPSignPostLog();
  v198 = v197;
  if (v364 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v197))
  {
    *(_WORD *)CMTimeRange buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v198, OS_SIGNPOST_INTERVAL_BEGIN, v364, "VCPMovieAnalyzer_AnalyzeVideoSegment_PostProcessing", "", buf, 2u);
  }

  if (!v370)
  {
LABEL_340:
    if (v368)
    {
      v207 = VCPSignPostLog();
      os_signpost_id_t v208 = os_signpost_id_generate(v207);

      v209 = VCPSignPostLog();
      v210 = v209;
      if (v208 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v209))
      {
        *(_WORD *)CMTimeRange buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v210, OS_SIGNPOST_INTERVAL_BEGIN, v208, "VCPMovieAnalyzer_Video_VCPFullVideoAnalyzer", "", buf, 2u);
      }

      long long v211 = *(_OWORD *)&a4->var0.var3;
      v445[0] = *(_OWORD *)&a4->var0.var0;
      v445[1] = v211;
      v445[2] = *(_OWORD *)&a4->var1.var1;
      int v389 = [v368 finishAnalysisPass:v445];
      if (v389) {
        goto LABEL_354;
      }
      v212 = [v368 results];
      [v408 addEntriesFromDictionary:v212];

      v213 = self->_privateResults;
      v214 = [v368 privateResults];
      [(NSMutableDictionary *)v213 addEntriesFromDictionary:v214];

      v215 = VCPSignPostLog();
      v216 = v215;
      if (v208 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v215))
      {
        *(_WORD *)CMTimeRange buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v216, OS_SIGNPOST_INTERVAL_END, v208, "VCPMovieAnalyzer_Video_VCPFullVideoAnalyzer", "", buf, 2u);
      }
    }
    if (v417)
    {
      v217 = VCPSignPostLog();
      os_signpost_id_t v218 = os_signpost_id_generate(v217);

      v219 = VCPSignPostLog();
      v220 = v219;
      if (v218 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v219))
      {
        *(_WORD *)CMTimeRange buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v220, OS_SIGNPOST_INTERVAL_BEGIN, v218, "VCPMovieAnalyzer_Video_VCPVideoSceneClassifier", "", buf, 2u);
      }

      v221 = [v408 objectForKeyedSubscript:@"SceneResults"];
      [(VCPVideoSceneClassifier *)v366 setSceneResults:v221];

      v222 = [v408 objectForKeyedSubscript:@"QualityResults"];
      [(VCPVideoSceneClassifier *)v366 setQualityResults:v222];

      long long v223 = *(_OWORD *)&a4->var0.var3;
      v444[0] = *(_OWORD *)&a4->var0.var0;
      v444[1] = v223;
      v444[2] = *(_OWORD *)&a4->var1.var1;
      int v389 = [(VCPVideoSceneClassifier *)v366 finishAnalysisPass:v444];
      if (v389) {
        goto LABEL_354;
      }
      v224 = [(VCPVideoSceneClassifier *)v366 results];
      [v408 addEntriesFromDictionary:v224];

      v225 = VCPSignPostLog();
      v226 = v225;
      if (v218 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v225))
      {
        *(_WORD *)CMTimeRange buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v226, OS_SIGNPOST_INTERVAL_END, v218, "VCPMovieAnalyzer_Video_VCPVideoSceneClassifier", "", buf, 2u);
      }
    }
    if (v365)
    {
      v227 = VCPSignPostLog();
      os_signpost_id_t v391 = os_signpost_id_generate(v227);

      v228 = VCPSignPostLog();
      v229 = v228;
      if (v391 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v228))
      {
        *(_WORD *)CMTimeRange buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v229, OS_SIGNPOST_INTERVAL_BEGIN, v391, "VCPMovieAnalyzer_Video_VCPVideoActivityAnalyzer", "", buf, 2u);
      }

      BOOL v230 = [(VCPAsset *)self->_asset isSlowmo];
      v231 = self->_asset;
      if (v230) {
        [(VCPAsset *)v231 slowmoRate];
      }
      else {
        [(VCPAsset *)v231 timelapseRate];
      }
      unsigned int v242 = v232;
      v243 = [v408 objectForKeyedSubscript:@"QualityResults"];
      v244 = [v408 objectForKeyedSubscript:@"InterestingnessResults"];
      v245 = [v408 objectForKeyedSubscript:@"ObstructionResults"];
      v246 = [v408 objectForKeyedSubscript:@"ClassificationResults"];
      v247 = [v408 objectForKeyedSubscript:@"FineSubjectMotionResults"];
      v248 = [v408 objectForKeyedSubscript:@"FaceResults"];
      [v368 getSceneSwichFrequency];
      -[VCPVideoActivityAnalyzer preProcessQualityResults:interestingnessResults:obstructionResults:classificationResults:fineActionResults:faceResults:sceneSwitchFrequency:](v365, "preProcessQualityResults:interestingnessResults:obstructionResults:classificationResults:fineActionResults:faceResults:sceneSwitchFrequency:", v243, v244, v245, v246, v247, v248);

      long long v249 = *(_OWORD *)&a4->var0.var3;
      v442[0] = *(_OWORD *)&a4->var0.var0;
      v442[1] = v249;
      long long v443 = *(_OWORD *)&a4->var1.var1;
      LODWORD(v386) = [(VCPVideoActivityAnalyzer *)v365 finishAnalysisPass:v442 fpsRate:COERCE_DOUBLE(__PAIR64__(DWORD1(v443), v242))];
      if (v386)
      {
        if (!self->_errorCode) {
          self->_errorCode = 61;
        }
        int v29 = 1;
LABEL_391:
        int v389 = v376;
        goto LABEL_357;
      }
      v250 = [(VCPVideoActivityAnalyzer *)v365 results];
      [v408 addEntriesFromDictionary:v250];

      v251 = VCPSignPostLog();
      v252 = v251;
      if (v391 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v251))
      {
        *(_WORD *)CMTimeRange buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v252, OS_SIGNPOST_INTERVAL_END, v391, "VCPMovieAnalyzer_Video_VCPVideoActivityAnalyzer", "", buf, 2u);
      }
    }
    if (v363)
    {
      v253 = VCPSignPostLog();
      os_signpost_id_t v254 = os_signpost_id_generate(v253);

      v255 = VCPSignPostLog();
      v256 = v255;
      if (v254 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v255))
      {
        *(_WORD *)CMTimeRange buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v256, OS_SIGNPOST_INTERVAL_BEGIN, v254, "VCPMovieAnalyzer_Video_VCPVideoSaliencyAnalyzer", "", buf, 2u);
      }

      long long v257 = *(_OWORD *)&a4->var0.var3;
      v441[0] = *(_OWORD *)&a4->var0.var0;
      v441[1] = v257;
      v441[2] = *(_OWORD *)&a4->var1.var1;
      int v389 = [(VCPVideoSaliencyAnalyzer *)v363 finishAnalysisPass:v441];
      if (v389)
      {
        if (!self->_errorCode)
        {
          LODWORD(v386) = 0;
          unint64_t v258 = 79;
LABEL_515:
          self->_errorCode = v258;
          goto LABEL_516;
        }
        goto LABEL_513;
      }
      v259 = [(VCPVideoSaliencyAnalyzer *)v363 results];
      [v408 addEntriesFromDictionary:v259];

      v260 = VCPSignPostLog();
      v261 = v260;
      if (v254 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v260))
      {
        *(_WORD *)CMTimeRange buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v261, OS_SIGNPOST_INTERVAL_END, v254, "VCPMovieAnalyzer_Video_VCPVideoSaliencyAnalyzer", "", buf, 2u);
      }
    }
    if (v375)
    {
      v262 = VCPSignPostLog();
      os_signpost_id_t v263 = os_signpost_id_generate(v262);

      v264 = VCPSignPostLog();
      v265 = v264;
      if (v263 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v264))
      {
        *(_WORD *)CMTimeRange buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v265, OS_SIGNPOST_INTERVAL_BEGIN, v263, "VCPMovieAnalyzer_Video_VCPVideoHumanActionAnalyzer", "", buf, 2u);
      }

      long long v266 = *(_OWORD *)&a4->var0.var3;
      v440[0] = *(_OWORD *)&a4->var0.var0;
      v440[1] = v266;
      v440[2] = *(_OWORD *)&a4->var1.var1;
      int v389 = [(VCPVideoHumanActionAnalyzer *)v375 finishAnalysisPass:v440];
      if (v389)
      {
        if (!self->_errorCode)
        {
          LODWORD(v386) = 0;
          unint64_t v258 = 68;
          goto LABEL_515;
        }
LABEL_513:
        LODWORD(v386) = 0;
LABEL_516:
        int v29 = 8;
        goto LABEL_357;
      }
      v267 = [(VCPVideoHumanActionAnalyzer *)v375 results];
      [v408 addEntriesFromDictionary:v267];

      v268 = self->_privateResults;
      v269 = [(VCPVideoHumanActionAnalyzer *)v375 privateResults];
      [(NSMutableDictionary *)v268 addEntriesFromDictionary:v269];

      v270 = VCPSignPostLog();
      v271 = v270;
      if (v263 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v270))
      {
        *(_WORD *)CMTimeRange buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v271, OS_SIGNPOST_INTERVAL_END, v263, "VCPMovieAnalyzer_Video_VCPVideoHumanActionAnalyzer", "", buf, 2u);
      }
    }
    if (v374)
    {
      v272 = VCPSignPostLog();
      os_signpost_id_t v273 = os_signpost_id_generate(v272);

      v274 = VCPSignPostLog();
      v275 = v274;
      if (v273 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v274))
      {
        *(_WORD *)CMTimeRange buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v275, OS_SIGNPOST_INTERVAL_BEGIN, v273, "VCPMovieAnalyzer_Video_videoCaptionAnalyzer", "", buf, 2u);
      }

      long long v276 = *(_OWORD *)&a4->var0.var3;
      v439[0] = *(_OWORD *)&a4->var0.var0;
      v439[1] = v276;
      v439[2] = *(_OWORD *)&a4->var1.var1;
      int v389 = [v374 finishAnalysisPass:v439];
      if (v389)
      {
        if (!self->_errorCode)
        {
          LODWORD(v386) = 0;
          unint64_t v258 = 63;
          goto LABEL_515;
        }
        goto LABEL_513;
      }
      v279 = [v374 results];
      [v408 addEntriesFromDictionary:v279];

      v280 = VCPSignPostLog();
      v281 = v280;
      if (v273 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v280))
      {
        *(_WORD *)CMTimeRange buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v281, OS_SIGNPOST_INTERVAL_END, v273, "VCPMovieAnalyzer_Video_videoCaptionAnalyzer", "", buf, 2u);
      }
    }
    if (v362)
    {
      v282 = VCPSignPostLog();
      os_signpost_id_t v283 = os_signpost_id_generate(v282);

      v284 = VCPSignPostLog();
      v285 = v284;
      if (v283 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v284))
      {
        *(_WORD *)CMTimeRange buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v285, OS_SIGNPOST_INTERVAL_BEGIN, v283, "VCPMovieAnalyzer_Video_VCPVideoPetsAnalyzer", "", buf, 2u);
      }

      long long v286 = *(_OWORD *)&a4->var0.var3;
      v438[0] = *(_OWORD *)&a4->var0.var0;
      v438[1] = v286;
      v438[2] = *(_OWORD *)&a4->var1.var1;
      int v389 = [(VCPVideoPetsAnalyzer *)v362 finishAnalysisPass:v438];
      if (v389)
      {
        if (!self->_errorCode)
        {
          LODWORD(v386) = 0;
          unint64_t v258 = 78;
          goto LABEL_515;
        }
        goto LABEL_513;
      }
      v287 = [(VCPVideoPetsAnalyzer *)v362 results];
      [v408 addEntriesFromDictionary:v287];

      v288 = VCPSignPostLog();
      v289 = v288;
      if (v283 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v288))
      {
        *(_WORD *)CMTimeRange buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v289, OS_SIGNPOST_INTERVAL_END, v283, "VCPMovieAnalyzer_Video_VCPVideoPetsAnalyzer", "", buf, 2u);
      }
    }
    if (v361)
    {
      v290 = VCPSignPostLog();
      os_signpost_id_t v291 = os_signpost_id_generate(v290);

      v292 = VCPSignPostLog();
      v293 = v292;
      if (v291 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v292))
      {
        *(_WORD *)CMTimeRange buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v293, OS_SIGNPOST_INTERVAL_BEGIN, v291, "VCPMovieAnalyzer_Video_VCPVideoPetActionAnalyzer", "", buf, 2u);
      }

      long long v294 = *(_OWORD *)&a4->var0.var3;
      v437[0] = *(_OWORD *)&a4->var0.var0;
      v437[1] = v294;
      v437[2] = *(_OWORD *)&a4->var1.var1;
      int v389 = [(VCPVideoPetsActionAnalyzer *)v361 finishAnalysisPass:v437];
      if (v389)
      {
        if (!self->_errorCode)
        {
          LODWORD(v386) = 0;
          unint64_t v258 = 77;
          goto LABEL_515;
        }
        goto LABEL_513;
      }
      v295 = [(VCPVideoPetsActionAnalyzer *)v361 results];
      [v408 addEntriesFromDictionary:v295];

      v296 = VCPSignPostLog();
      v297 = v296;
      if (v291 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v296))
      {
        *(_WORD *)CMTimeRange buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v297, OS_SIGNPOST_INTERVAL_END, v291, "VCPMovieAnalyzer_Video_VCPVideoPetActionAnalyzer", "", buf, 2u);
      }
    }
    if (v360)
    {
      v298 = VCPSignPostLog();
      os_signpost_id_t v299 = os_signpost_id_generate(v298);

      v300 = VCPSignPostLog();
      v301 = v300;
      if (v299 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v300))
      {
        *(_WORD *)CMTimeRange buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v301, OS_SIGNPOST_INTERVAL_BEGIN, v299, "VCPMovieAnalyzer_Video_VCPMovieCurationAnalyzer", "", buf, 2u);
      }

      [v412 naturalSize];
      double v392 = v302;
      double v387 = v303;
      if (v412)
      {
        [v412 preferredTransform];
        float64x2_t v369 = v434;
        float64x2_t v304 = v435;
      }
      else
      {
        float64x2_t v435 = 0u;
        long long v436 = 0u;
        float64x2_t v304 = 0uLL;
        float64x2_t v369 = 0u;
        float64x2_t v434 = 0u;
      }
      float64x2_t v367 = v304;
      v305 = [(NSMutableDictionary *)self->_analysis vcp_results];
      v306 = [(VCPVideoCNNAnalyzer *)v373 privateResults];
      v307 = [v370 faceRanges];
      [(VCPMovieCurationAnalyzer *)v360 loadVideoAnalysisResults:v408 audioAnalysisResults:v305 videoCNNResults:v306 andFaceRanges:v307 frameSize:vabsq_f64(vmlaq_n_f64(vmulq_n_f64(v367, v387), v369, v392))];

      int v389 = [(VCPMovieCurationAnalyzer *)v360 generateMovieCurations];
      if (v389)
      {
        if (!self->_errorCode)
        {
          LODWORD(v386) = 0;
          unint64_t v258 = 46;
          goto LABEL_515;
        }
        goto LABEL_513;
      }
      v308 = [(VCPMovieCurationAnalyzer *)v360 results];
      [v408 addEntriesFromDictionary:v308];

      v309 = VCPSignPostLog();
      v310 = v309;
      if (v299 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v309))
      {
        *(_WORD *)CMTimeRange buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v310, OS_SIGNPOST_INTERVAL_END, v299, "VCPMovieAnalyzer_Video_VCPMovieCurationAnalyzer", "", buf, 2u);
      }
    }
    if (v359)
    {
      v311 = VCPSignPostLog();
      os_signpost_id_t v312 = os_signpost_id_generate(v311);

      v313 = VCPSignPostLog();
      v314 = v313;
      if (v312 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v313))
      {
        *(_WORD *)CMTimeRange buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v314, OS_SIGNPOST_INTERVAL_BEGIN, v312, "VCPMovieAnalyzer_Video_VCPVideoStabilizer", "", buf, 2u);
      }

      int v389 = [v359 convertAnalysisResult];
      if (v389) {
        goto LABEL_512;
      }
      long long v315 = *(_OWORD *)&a4->var0.var3;
      v433[0] = *(_OWORD *)&a4->var0.var0;
      v433[1] = v315;
      v433[2] = *(_OWORD *)&a4->var1.var1;
      int v389 = [v359 finishAnalysisPass:v433];
      if (v389) {
        goto LABEL_512;
      }
      v316 = [v359 results];
      [v408 addEntriesFromDictionary:v316];

      v317 = VCPSignPostLog();
      v318 = v317;
      if (v312 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v317))
      {
        *(_WORD *)CMTimeRange buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v318, OS_SIGNPOST_INTERVAL_END, v312, "VCPMovieAnalyzer_Video_VCPVideoStabilizer", "", buf, 2u);
      }
    }
    if (!v357 || [(VCPVideoInterpolator *)v357 processAborted]) {
      goto LABEL_498;
    }
    v319 = VCPSignPostLog();
    os_signpost_id_t v320 = os_signpost_id_generate(v319);

    v321 = VCPSignPostLog();
    v322 = v321;
    if (v320 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v321))
    {
      *(_WORD *)CMTimeRange buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v322, OS_SIGNPOST_INTERVAL_BEGIN, v320, "VCPMovieAnalyzer_Video_VCPVideoInterpolator", "", buf, 2u);
    }

    long long v323 = *(_OWORD *)&a4->var0.var3;
    v432[0] = *(_OWORD *)&a4->var0.var0;
    v432[1] = v323;
    v432[2] = *(_OWORD *)&a4->var1.var1;
    int v389 = [(VCPVideoInterpolator *)v357 finishAnalysisPass:v432];
    if (!v389)
    {
      v324 = [(VCPVideoInterpolator *)v357 results];
      [v408 addEntriesFromDictionary:v324];

      v325 = VCPSignPostLog();
      v326 = v325;
      if (v320 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v325))
      {
        *(_WORD *)CMTimeRange buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v326, OS_SIGNPOST_INTERVAL_END, v320, "VCPMovieAnalyzer_Video_VCPVideoInterpolator", "", buf, 2u);
      }

LABEL_498:
      if (v358)
      {
        v327 = VCPSignPostLog();
        os_signpost_id_t v328 = os_signpost_id_generate(v327);

        v329 = VCPSignPostLog();
        v330 = v329;
        if (v328 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v329))
        {
          *(_WORD *)CMTimeRange buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v330, OS_SIGNPOST_INTERVAL_BEGIN, v328, "VCPMovieAnalyzer_Video_VCPSettlingEffectAnalyzer", "", buf, 2u);
        }

        if (![(VCPSettlingEffectAnalyzer *)v358 processAborted])
        {
          objc_msgSend(v412, "vcp_fullFrameSize");
          double v340 = v339;
          double v342 = v341;
          *(_DWORD *)CMTimeRange buf = 0;
          v343 = [(NSDictionary *)self->_options objectForKeyedSubscript:@"LivePhotoKeyFrameTimestamp"];
          BOOL v344 = v343 == 0;

          if (v344)
          {
            if (v340 >= v342) {
              double v354 = v340;
            }
            else {
              double v354 = v342;
            }
            v348 = [(VCPAsset *)self->_asset imageWithPreferredDimension:(unint64_t)v354 orientation:buf];
          }
          else
          {
            v345 = [v412 asset];
            CFDictionaryRef v346 = [(NSDictionary *)self->_options objectForKeyedSubscript:@"LivePhotoKeyFrameTimestamp"];
            CMTimeMakeFromDictionary(&v431, v346);
            if (v340 >= v342) {
              double v347 = v340;
            }
            else {
              double v347 = v342;
            }
            v348 = (__CVBuffer *)objc_msgSend(v345, "vcp_frameAtTimeStamp:withMaxDimension:", &v431, (unint64_t)v347);
          }
          [(VCPSettlingEffectAnalyzer *)v358 adjustedTimeRange];
          int v389 = [(VCPSettlingEffectAnalyzer *)v358 finishAnalysisPass:v430 withStillImageBuffer:v348];
          if (v389)
          {
            if (!self->_errorCode) {
              self->_errorCode = 51;
            }
            goto LABEL_513;
          }
          if (v348) {
            CFRelease(v348);
          }
        }
        v331 = [(VCPSettlingEffectAnalyzer *)v358 results];
        [v408 addEntriesFromDictionary:v331];

        v332 = VCPSignPostLog();
        v333 = v332;
        if (v328 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v332))
        {
          *(_WORD *)CMTimeRange buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v333, OS_SIGNPOST_INTERVAL_END, v328, "VCPMovieAnalyzer_Video_VCPSettlingEffectAnalyzer", "", buf, 2u);
        }
      }
      if (v377)
      {
        v334 = VCPSignPostLog();
        os_signpost_id_t v335 = os_signpost_id_generate(v334);

        v336 = VCPSignPostLog();
        v337 = v336;
        if (v335 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v336))
        {
          *(_WORD *)CMTimeRange buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v337, OS_SIGNPOST_INTERVAL_BEGIN, v335, "VCPMovieAnalyzer_Video_MADVideoSafetyClassifier", "", buf, 2u);
        }

        long long v338 = *(_OWORD *)&a4->var0.var3;
        v429[0] = *(_OWORD *)&a4->var0.var0;
        v429[1] = v338;
        v429[2] = *(_OWORD *)&a4->var1.var1;
        int v389 = [(MADVideoSafetyClassifier *)v377 finishAnalysisPass:v429];
        if (v389) {
          goto LABEL_512;
        }
        v349 = [(MADVideoSafetyClassifier *)v377 results];
        [v408 addEntriesFromDictionary:v349];

        v350 = VCPSignPostLog();
        v351 = v350;
        if (v335 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v350))
        {
          *(_WORD *)CMTimeRange buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v351, OS_SIGNPOST_INTERVAL_END, v335, "VCPMovieAnalyzer_Video_MADVideoSafetyClassifier", "", buf, 2u);
        }
      }
      v352 = VCPSignPostLog();
      v353 = v352;
      if (v364 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v352))
      {
        *(_WORD *)CMTimeRange buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v353, OS_SIGNPOST_INTERVAL_END, v364, "VCPMovieAnalyzer_AnalyzeVideoSegment_PostProcessing", "", buf, 2u);
      }

      int v29 = 0;
      LODWORD(v386) = 0;
      goto LABEL_391;
    }
LABEL_512:
    if (!self->_errorCode)
    {
      LODWORD(v386) = 0;
      unint64_t v258 = 45;
      goto LABEL_515;
    }
    goto LABEL_513;
  }
  v199 = VCPSignPostLog();
  os_signpost_id_t v200 = os_signpost_id_generate(v199);

  v201 = VCPSignPostLog();
  v202 = v201;
  if (v200 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v201))
  {
    *(_WORD *)CMTimeRange buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v202, OS_SIGNPOST_INTERVAL_BEGIN, v200, "VCPMovieAnalyzer_Video_VCPVideoFaceDetector", "", buf, 2u);
  }

  long long v203 = *(_OWORD *)&a4->var0.var3;
  v446[0] = *(_OWORD *)&a4->var0.var0;
  v446[1] = v203;
  v446[2] = *(_OWORD *)&a4->var1.var1;
  int v389 = [v370 finishAnalysisPass:v446];
  if (!v389)
  {
    v204 = [v370 results];
    [v408 addEntriesFromDictionary:v204];

    v205 = VCPSignPostLog();
    v206 = v205;
    if (v200 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v205))
    {
      *(_WORD *)CMTimeRange buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v206, OS_SIGNPOST_INTERVAL_END, v200, "VCPMovieAnalyzer_Video_VCPVideoFaceDetector", "", buf, 2u);
    }

    goto LABEL_340;
  }
LABEL_354:
  if (!self->_errorCode) {
    self->_errorCode = 45;
  }
  int v29 = 8;
LABEL_357:

  v403 = v375;
  v404 = v374;
  v409 = v373;
LABEL_362:

LABEL_363:
LABEL_222:
  double v22 = v388;
LABEL_223:

  if (v29)
  {
LABEL_224:
    int v128 = v389;
    goto LABEL_283;
  }
  if (v409)
  {
    v129 = VCPSignPostLog();
    os_signpost_id_t v130 = os_signpost_id_generate(v129);

    v131 = VCPSignPostLog();
    v132 = v131;
    if (v130 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v131))
    {
      *(_WORD *)CMTimeRange buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v132, OS_SIGNPOST_INTERVAL_BEGIN, v130, "VCPMovieAnalyzer_AnalyzeVideoSegment_PostProcessing", "", buf, 2u);
    }

    v133 = VCPSignPostLog();
    os_signpost_id_t v134 = os_signpost_id_generate(v133);

    v135 = VCPSignPostLog();
    v136 = v135;
    if (v134 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v135))
    {
      *(_WORD *)CMTimeRange buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v136, OS_SIGNPOST_INTERVAL_BEGIN, v134, "VCPMovieAnalyzer_Video_VCPVideoCNNAnalyzer", "", buf, 2u);
    }

    v137 = [(NSMutableDictionary *)self->_analysis vcp_results];
    v138 = [v137 objectForKeyedSubscript:@"VoiceResults"];
    int v128 = [(VCPVideoCNNAnalyzer *)v409 loadAnalysisResults:v408 audioResults:v138];

    if (v128
      || (long long v139 = *(_OWORD *)&a4->var0.var3,
          v428[0] = *(_OWORD *)&a4->var0.var0,
          v428[1] = v139,
          v428[2] = *(_OWORD *)&a4->var1.var1,
          (int v128 = [(VCPVideoCNNAnalyzer *)v409 finishAnalysisPass:v428]) != 0))
    {
      if (!self->_errorCode) {
        self->_errorCode = 64;
      }
      int v29 = 8;
      goto LABEL_283;
    }
    v140 = [(VCPVideoCNNAnalyzer *)v409 results];
    [v408 addEntriesFromDictionary:v140];

    v141 = VCPSignPostLog();
    v142 = v141;
    if (v134 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v141))
    {
      *(_WORD *)CMTimeRange buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v142, OS_SIGNPOST_INTERVAL_END, v134, "VCPMovieAnalyzer_Video_VCPVideoCNNAnalyzer", "", buf, 2u);
    }

    v143 = VCPSignPostLog();
    v144 = v143;
    if (v130 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v143))
    {
      *(_WORD *)CMTimeRange buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v144, OS_SIGNPOST_INTERVAL_END, v130, "VCPMovieAnalyzer_AnalyzeVideoSegment_PostProcessing", "", buf, 2u);
    }
  }
  int v145 = ![(VCPAsset *)self->_asset isLivePhoto];
  if ((v18 & 0x200000000000) == 0) {
    LOBYTE(v145) = 1;
  }
  if ((v145 & 1) == 0)
  {
    v146 = [(VCPVideoCNNAnalyzer *)v409 results];
    v147 = [v146 objectForKeyedSubscript:@"HumanActionClassificationResults"];
    BOOL v148 = v147 == 0;

    float v150 = 0.0;
    if (!v148)
    {
      long long v426 = 0u;
      long long v427 = 0u;
      long long v424 = 0u;
      long long v425 = 0u;
      v151 = [(VCPVideoCNNAnalyzer *)v409 results];
      id obja = [v151 objectForKeyedSubscript:@"HumanActionClassificationResults"];

      uint64_t v152 = [obja countByEnumeratingWithState:&v424 objects:v496 count:16];
      if (v152)
      {
        uint64_t v419 = *(void *)v425;
        do
        {
          for (uint64_t i = 0; i != v152; ++i)
          {
            if (*(void *)v425 != v419) {
              objc_enumerationMutation(obja);
            }
            v154 = [*(id *)(*((void *)&v424 + 1) + 8 * i) objectForKeyedSubscript:@"attributes"];
            v155 = [v154 objectForKeyedSubscript:@"humanActions"];

            v156 = [v155 allKeys];
            long long v422 = 0u;
            long long v423 = 0u;
            long long v420 = 0u;
            long long v421 = 0u;
            id v157 = v156;
            uint64_t v158 = [v157 countByEnumeratingWithState:&v420 objects:v495 count:16];
            if (v158)
            {
              uint64_t v159 = *(void *)v421;
              do
              {
                for (uint64_t j = 0; j != v158; ++j)
                {
                  if (*(void *)v421 != v159) {
                    objc_enumerationMutation(v157);
                  }
                  v161 = *(void **)(*((void *)&v420 + 1) + 8 * j);
                  if ([v161 intValue])
                  {
                    v162 = [v155 objectForKeyedSubscript:v161];
                    [v162 floatValue];
                    BOOL v164 = v163 > v150;

                    if (v164)
                    {
                      v165 = [v155 objectForKeyedSubscript:v161];
                      [v165 floatValue];
                      float v150 = v166;
                    }
                  }
                }
                uint64_t v158 = [v157 countByEnumeratingWithState:&v420 objects:v495 count:16];
              }
              while (v158);
            }
          }
          uint64_t v152 = [obja countByEnumeratingWithState:&v424 objects:v496 count:16];
        }
        while (v152);

        if (v150 > 0.1)
        {
          uint64_t v167 = 1;
          goto LABEL_269;
        }
      }
      else
      {
      }
    }
    uint64_t v167 = 0;
LABEL_269:
    v493 = @"VideoCaptionPreferenceResults";
    v490 = @"attributes";
    v488[0] = @"videoCaptionPreferenceScore";
    *(float *)&double v149 = v150;
    v168 = [NSNumber numberWithFloat:v149];
    v489[0] = v168;
    v488[1] = @"videoCaptionPreference";
    v169 = [NSNumber numberWithBool:v167];
    v489[1] = v169;
    v170 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v489 forKeys:v488 count:2];
    v491 = v170;
    v171 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v491 forKeys:&v490 count:1];
    v492 = v171;
    v172 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v492 count:1];
    v494 = v172;
    v173 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v494 forKeys:&v493 count:1];

    [v408 addEntriesFromDictionary:v173];
  }
  int v128 = v389;
  if (v402)
  {
    v174 = VCPSignPostLog();
    os_signpost_id_t v175 = os_signpost_id_generate(v174);

    v176 = VCPSignPostLog();
    v177 = v176;
    if (v175 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v176))
    {
      *(_WORD *)CMTimeRange buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v177, OS_SIGNPOST_INTERVAL_BEGIN, v175, "VCPMovieAnalyzer_Video_VCPAudioVideoEmbeddingFuser", "", buf, 2u);
    }

    v178 = [(NSMutableDictionary *)self->_analysis vcp_results];
    v179 = [v178 objectForKeyedSubscript:@"AudioEmbeddingResults"];
    v180 = [v408 objectForKeyedSubscript:@"VideoEmbeddingResults"];
    int v181 = [(VCPAudioVideoEmbeddingFuser *)v402 loadAudioEmbeddingResults:v179 andVideoEmbeddingResults:v180];

    if (v181)
    {
      if (!self->_errorCode) {
        self->_errorCode = 45;
      }
      int v29 = 1;
      int v128 = v389;
      LODWORD(v386) = v181;
    }
    else
    {
      int v182 = [(VCPAudioVideoEmbeddingFuser *)v402 fuse:v398];
      int v128 = v389;
      if (!v182)
      {
        v187 = [(VCPAudioVideoEmbeddingFuser *)v402 results];
        [v408 addEntriesFromDictionary:v187];

        v188 = VCPSignPostLog();
        v189 = v188;
        if (v175 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v188))
        {
          *(_WORD *)CMTimeRange buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v189, OS_SIGNPOST_INTERVAL_END, v175, "VCPMovieAnalyzer_Video_VCPAudioVideoEmbeddingFuser", "", buf, 2u);
        }

        int v29 = 0;
        goto LABEL_224;
      }
      if (!self->_errorCode) {
        self->_errorCode = 45;
      }
      int v29 = 1;
      LODWORD(v386) = v182;
    }
  }
  else
  {
    int v29 = 0;
  }
LABEL_283:

  v183 = v408;
  if (v29 == 8)
  {
LABEL_289:
    LODWORD(v386) = v128;
  }
  else if (!v29)
  {
    [(VCPMovieAnalyzer *)self postProcessAutoPlayable:v408];
    [(NSMutableDictionary *)self->_analysis vcp_addFlags:v385];
    [(NSMutableDictionary *)self->_analysis vcp_appendResults:v408];
    v184 = VCPSignPostLog();
    v185 = v184;
    if (v383 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v184))
    {
      *(_WORD *)CMTimeRange buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v185, OS_SIGNPOST_INTERVAL_END, spid, "VCPMovieAnalyzer_AnalyzeVideoSegment", "", buf, 2u);
    }

    v183 = v408;
    goto LABEL_289;
  }

  return (int)v386;
}

uint64_t __74__VCPMovieAnalyzer_analyzeVideoSegment_timerange_forAnalysisTypes_cancel___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v106 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = VCPSignPostLog();
  os_signpost_id_t v5 = os_signpost_id_generate(v4);

  uint64_t v6 = VCPSignPostLog();
  BOOL v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    LOWORD(buf.value) = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "VCPMovieAnalyzer_AnalyzeVideoSegment_FramePipelineBlock0", "", (uint8_t *)&buf, 2u);
  }

  uint64_t v102 = 0;
  if ((*(uint64_t (**)(void))(*(void *)(a1 + 112) + 16))())
  {
    uint64_t v8 = 4294967168;
    goto LABEL_37;
  }
  if (!v3)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v27 = VCPLogInstance();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        LODWORD(v105.value) = 138412290;
        *(CMTimeValue *)((char *)&v105.value + 4) = (CMTimeValue)@"[pipelineBlock0]";
        _os_log_impl(&dword_1BBEDA000, v27, OS_LOG_TYPE_ERROR, "%@ Invalid currFrameResource.", (uint8_t *)&v105, 0xCu);
      }
      goto LABEL_33;
    }
LABEL_34:
    uint64_t v28 = *(void *)(a1 + 32);
    if (!*(void *)(v28 + 104)) {
      *(void *)(v28 + 104) = 45;
    }
    uint64_t v8 = 4294967278;
    goto LABEL_37;
  }
  os_signpost_id_t v9 = (opaqueCMSampleBuffer *)[v3 frameSampleBuffer];
  os_signpost_id_t v10 = v9;
  if (!v9)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v27 = VCPLogInstance();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        LODWORD(v105.value) = 138412290;
        *(CMTimeValue *)((char *)&v105.value + 4) = (CMTimeValue)@"[pipelineBlock0]";
        _os_log_impl(&dword_1BBEDA000, v27, OS_LOG_TYPE_ERROR, "%@ Invalid frameSampleBuffer.", (uint8_t *)&v105, 0xCu);
      }
LABEL_33:

      goto LABEL_34;
    }
    goto LABEL_34;
  }
  CMSampleBufferGetPresentationTimeStamp(&v105, v9);
  CMTime buf = v105;
  CMSampleBufferGetDuration(&v105, v10);
  CMTime v103 = v105;
  ImageBuffer = CMSampleBufferGetImageBuffer(v10);
  uint64_t v102 = [v3 frameFlags];
  if (*(void *)(a1 + 40) || (uint64_t v8 = CVPixelBufferFillExtendedPixels(ImageBuffer), !v8))
  {
    if (*(void *)(a1 + 48))
    {
      id v12 = VCPSignPostLog();
      os_signpost_id_t v13 = os_signpost_id_generate(v12);

      uint64_t v14 = VCPSignPostLog();
      uint64_t v15 = v14;
      if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
      {
        LOWORD(v105.value) = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "VCPMovieAnalyzer_Video_VCPVideoFaceDetector", "", (uint8_t *)&v105, 2u);
      }

      int v16 = *(void **)(a1 + 48);
      CMTime v101 = buf;
      CMTime v100 = v103;
      int v17 = [v3 frameStats];
      uint64_t v8 = [v16 analyzeFrame:ImageBuffer timestamp:&v101 duration:&v100 frameStats:v17 flags:&v102];

      if (v8) {
        goto LABEL_23;
      }
      unint64_t v18 = VCPSignPostLog();
      int v19 = v18;
      if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
      {
        LOWORD(v105.value) = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v19, OS_SIGNPOST_INTERVAL_END, v13, "VCPMovieAnalyzer_Video_VCPVideoFaceDetector", "", (uint8_t *)&v105, 2u);
      }
    }
    if (*(void *)(a1 + 56))
    {
      double v20 = VCPSignPostLog();
      os_signpost_id_t v21 = os_signpost_id_generate(v20);

      double v22 = VCPSignPostLog();
      long long v23 = v22;
      if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
      {
        LOWORD(v105.value) = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v23, OS_SIGNPOST_INTERVAL_BEGIN, v21, "VCPMovieAnalyzer_Video_VCPVideoSceneClassifier", "", (uint8_t *)&v105, 2u);
      }

      long long v24 = *(void **)(a1 + 56);
      CMTime v99 = buf;
      CMTime v98 = v103;
      uint64_t v8 = [v24 analyzeFrame:ImageBuffer withTimestamp:&v99 andDuration:&v98 flags:&v102];
      if (v8)
      {
LABEL_23:
        uint64_t v25 = *(void *)(a1 + 32);
        if (*(void *)(v25 + 104)) {
          goto LABEL_37;
        }
        uint64_t v26 = 45;
        goto LABEL_25;
      }
      id v33 = [*(id *)(a1 + 56) frameScenes];
      [v3 setSceneAnalysisResults:v33];

      v34 = VCPSignPostLog();
      uint64_t v35 = v34;
      if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
      {
        LOWORD(v105.value) = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v35, OS_SIGNPOST_INTERVAL_END, v21, "VCPMovieAnalyzer_Video_VCPVideoSceneClassifier", "", (uint8_t *)&v105, 2u);
      }
    }
    if (*(void *)(a1 + 64))
    {
      uint64_t v36 = VCPSignPostLog();
      os_signpost_id_t v37 = os_signpost_id_generate(v36);

      long long v38 = VCPSignPostLog();
      uint64_t v39 = v38;
      if (v37 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
      {
        LOWORD(v105.value) = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v39, OS_SIGNPOST_INTERVAL_BEGIN, v37, "VCPMovieAnalyzer_Video_VCPVideoSaliencyAnalyzer", "", (uint8_t *)&v105, 2u);
      }

      CMTimeRange v40 = *(void **)(a1 + 64);
      CMTime v97 = buf;
      CMTime v96 = v103;
      uint64_t v8 = [v40 analyzeFrame:ImageBuffer withTimestamp:&v97 andDuration:&v96 flags:&v102];
      if (v8)
      {
        uint64_t v25 = *(void *)(a1 + 32);
        if (!*(void *)(v25 + 104))
        {
          uint64_t v26 = 79;
LABEL_25:
          *(void *)(v25 + 104) = v26;
          goto LABEL_37;
        }
        goto LABEL_37;
      }
      long long v41 = VCPSignPostLog();
      CMTimeRange v42 = v41;
      if (v37 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v41))
      {
        LOWORD(v105.value) = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v42, OS_SIGNPOST_INTERVAL_END, v37, "VCPMovieAnalyzer_Video_VCPVideoSaliencyAnalyzer", "", (uint8_t *)&v105, 2u);
      }
    }
    long long v43 = *(void **)(a1 + 72);
    if (v43)
    {
      CMTime v92 = buf;
      [v43 timeRangeAtTime:&v92];
      v91[0] = v93;
      v91[1] = v94;
      v91[2] = v95;
      [v3 setPredictedTimeRange:v91];
      CMTimeRange v44 = *(void **)(a1 + 72);
      CMTime v90 = buf;
      [v44 updateForTime:&v90];
    }
    if (*(void *)(a1 + 80))
    {
      CMTimeRange v45 = VCPSignPostLog();
      os_signpost_id_t v46 = os_signpost_id_generate(v45);

      CMTimeRange v47 = VCPSignPostLog();
      BOOL v48 = v47;
      if (v46 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v47))
      {
        LOWORD(v105.value) = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v48, OS_SIGNPOST_INTERVAL_BEGIN, v46, "VCPMovieAnalyzer_Video_VCPVideoHumanActionAnalyzer", "", (uint8_t *)&v105, 2u);
      }

      v49 = *(void **)(a1 + 80);
      CMTime v89 = buf;
      CMTime v88 = v103;
      CMTimeRange v50 = [v3 frameStats];
      uint64_t v8 = [v49 analyzeFrame:ImageBuffer timestamp:&v89 duration:&v88 frameStats:v50 flags:&v102];

      if (v8)
      {
        uint64_t v25 = *(void *)(a1 + 32);
        if (!*(void *)(v25 + 104))
        {
          uint64_t v26 = 68;
          goto LABEL_25;
        }
LABEL_37:
        int v29 = VCPSignPostLog();
        CMTime v30 = v29;
        if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
        {
          LOWORD(v105.value) = 0;
          _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v30, OS_SIGNPOST_INTERVAL_END, v5, "VCPMovieAnalyzer_AnalyzeVideoSegment_FramePipelineBlock0", "", (uint8_t *)&v105, 2u);
        }

        goto LABEL_41;
      }
      [v3 predictedTimeRange];
      long long v51 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
      *(_OWORD *)&range2.start.value = *MEMORY[0x1E4F1FA20];
      *(_OWORD *)&range2.start.epoch = v51;
      *(_OWORD *)&range2.duration.timescale = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 32);
      if (!CMTimeRangeEqual(&range1, &range2))
      {
        long long v52 = *(void **)(a1 + 80);
        [v3 predictedTimeRange];
        long long v53 = [v52 clipResults:v85];
        [v3 setActionAnalysisResults:v53];
      }
      long long v54 = VCPSignPostLog();
      long long v55 = v54;
      if (v46 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v54))
      {
        LOWORD(v105.value) = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v55, OS_SIGNPOST_INTERVAL_END, v46, "VCPMovieAnalyzer_Video_VCPVideoHumanActionAnalyzer", "", (uint8_t *)&v105, 2u);
      }
    }
    if (*(void *)(a1 + 88))
    {
      uint64_t v56 = VCPSignPostLog();
      os_signpost_id_t v57 = os_signpost_id_generate(v56);

      long long v58 = VCPSignPostLog();
      BOOL v59 = v58;
      if (v57 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v58))
      {
        LOWORD(v105.value) = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v59, OS_SIGNPOST_INTERVAL_BEGIN, v57, "VCPMovieAnalyzer_Video_VCPVideoCaptionAnalyzer", "", (uint8_t *)&v105, 2u);
      }

      int v60 = *(void **)(a1 + 88);
      CMTime v84 = buf;
      CMTime v83 = v103;
      uint64_t v8 = [v60 analyzeFrame:ImageBuffer withTimestamp:&v84 andDuration:&v83 flags:&v102];
      if (v8)
      {
        uint64_t v25 = *(void *)(a1 + 32);
        if (!*(void *)(v25 + 104))
        {
          uint64_t v26 = 63;
          goto LABEL_25;
        }
        goto LABEL_37;
      }
      int v61 = VCPSignPostLog();
      BOOL v62 = v61;
      if (v57 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v61))
      {
        LOWORD(v105.value) = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v62, OS_SIGNPOST_INTERVAL_END, v57, "VCPMovieAnalyzer_Video_VCPVideoCaptionAnalyzer", "", (uint8_t *)&v105, 2u);
      }
    }
    if (*(void *)(a1 + 96))
    {
      v63 = VCPSignPostLog();
      os_signpost_id_t v64 = os_signpost_id_generate(v63);

      v65 = VCPSignPostLog();
      v66 = v65;
      if (v64 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v65))
      {
        LOWORD(v105.value) = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v66, OS_SIGNPOST_INTERVAL_BEGIN, v64, "VCPMovieAnalyzer_Video_VCPVideoPetsAnalyzer", "", (uint8_t *)&v105, 2u);
      }

      double v67 = *(void **)(a1 + 96);
      CMTime v82 = buf;
      CMTime v81 = v103;
      v68 = [v3 frameStats];
      uint64_t v8 = [v67 analyzeFrame:ImageBuffer withTimestamp:&v82 andDuration:&v81 flags:&v102 frameStats:v68];

      if (v8)
      {
        uint64_t v25 = *(void *)(a1 + 32);
        if (!*(void *)(v25 + 104))
        {
          uint64_t v26 = 78;
          goto LABEL_25;
        }
        goto LABEL_37;
      }
      double v69 = VCPSignPostLog();
      v70 = v69;
      if (v64 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v69))
      {
        LOWORD(v105.value) = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v70, OS_SIGNPOST_INTERVAL_END, v64, "VCPMovieAnalyzer_Video_VCPVideoPetsAnalyzer", "", (uint8_t *)&v105, 2u);
      }
    }
    if (*(void *)(a1 + 104))
    {
      uint64_t v71 = VCPSignPostLog();
      os_signpost_id_t v72 = os_signpost_id_generate(v71);

      int v73 = VCPSignPostLog();
      v74 = v73;
      if (v72 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v73))
      {
        LOWORD(v105.value) = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v74, OS_SIGNPOST_INTERVAL_BEGIN, v72, "VCPMovieAnalyzer_Video_VCPVideoPetActionAnalyzer", "", (uint8_t *)&v105, 2u);
      }

      v75 = *(void **)(a1 + 104);
      CMTime v80 = buf;
      int v76 = objc_msgSend(v3, "frameStats", *(_OWORD *)&v103.value, v103.epoch);
      uint64_t v8 = [v75 analyzeFrame:ImageBuffer timestamp:&v80 duration:&v79 frameStats:v76 flags:&v102];

      if (v8)
      {
        uint64_t v25 = *(void *)(a1 + 32);
        if (!*(void *)(v25 + 104))
        {
          uint64_t v26 = 77;
          goto LABEL_25;
        }
        goto LABEL_37;
      }
      double v77 = VCPSignPostLog();
      v78 = v77;
      if (v72 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v77))
      {
        LOWORD(v105.value) = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v78, OS_SIGNPOST_INTERVAL_END, v72, "VCPMovieAnalyzer_Video_VCPVideoPetActionAnalyzer", "", (uint8_t *)&v105, 2u);
      }
    }
    [v3 setFrameFlags:v102];
    uint64_t v8 = 0;
    goto LABEL_37;
  }
  uint64_t v32 = *(void *)(a1 + 32);
  if (!*(void *)(v32 + 104)) {
    *(void *)(v32 + 104) = 45;
  }
LABEL_41:

  return v8;
}

uint64_t __74__VCPMovieAnalyzer_analyzeVideoSegment_timerange_forAnalysisTypes_cancel___block_invoke_576(uint64_t a1, void *a2, opaqueCMSampleBuffer *a3)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = VCPSignPostLog();
  os_signpost_id_t v7 = os_signpost_id_generate(v6);

  uint64_t v8 = VCPSignPostLog();
  os_signpost_id_t v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(buf.value) = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "VCPMovieAnalyzer_AnalyzeVideoSegment_FramePipelineBlock1", "", (uint8_t *)&buf, 2u);
  }

  uint64_t v47 = 0;
  if ((*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))())
  {
    uint64_t v10 = 4294967168;
    goto LABEL_45;
  }
  if (v5)
  {
    long long v11 = (opaqueCMSampleBuffer *)[v5 frameSampleBuffer];
    id v12 = v11;
    if (v11)
    {
      CMSampleBufferGetPresentationTimeStamp(&v50, v11);
      CMTime buf = v50;
      CMSampleBufferGetDuration(&v50, v12);
      CMTime v48 = v50;
      CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(v12);
      uint64_t v14 = [v5 frameFlags];
      uint64_t v47 = v14;
      if (*(void *)(a1 + 40))
      {
        if (objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "isSlowmo", v14))
        {
          if (a3) {
            CVImageBufferRef v15 = CMSampleBufferGetImageBuffer(a3);
          }
          else {
            CVImageBufferRef v15 = 0;
          }
          [*(id *)(a1 + 40) setNextCaptureFrame:v15];
        }
        if (*(unsigned char *)(a1 + 56))
        {
          unint64_t v18 = *(void **)(a1 + 40);
          int v19 = [v5 sceneAnalysisResults];
          [v18 prepareVideoAnalysisByScenes:v19];
        }
        uint64_t v20 = *(void *)(a1 + 32);
        if (!*(unsigned char *)(v20 + 56) && [*(id *)(v20 + 32) isLivePhoto])
        {
          uint64_t v21 = *(void *)(a1 + 32);
          if (!*(unsigned char *)(v21 + 57))
          {
            double v22 = *(void **)(a1 + 40);
            long long v23 = [*(id *)(v21 + 32) scenes];
            [v22 prepareLivePhotoAnalysisByScenes:v23];

            uint64_t v21 = *(void *)(a1 + 32);
          }
          long long v24 = *(void **)(a1 + 40);
          uint64_t v25 = [*(id *)(v21 + 32) scenes];
          [v24 prepareVideoAnalysisByScenes:v25];

          *(unsigned char *)(*(void *)(a1 + 32) + 56) = 1;
        }
        uint64_t v26 = +[VCPSaliencyRegion salientRegionsFromPixelBuffer:ImageBuffer];
        +[VCPSaliencyRegion attachSalientRegions:v26 toPixelBuffer:ImageBuffer];

        v27 = VCPSignPostLog();
        os_signpost_id_t v28 = os_signpost_id_generate(v27);

        int v29 = VCPSignPostLog();
        CMTime v30 = v29;
        if (v28 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
        {
          LOWORD(v50.value) = 0;
          _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v30, OS_SIGNPOST_INTERVAL_BEGIN, v28, "VCPMovieAnalyzer_Video_VCPFullVideoAnalyzer", "", (uint8_t *)&v50, 2u);
        }

        uint64_t v31 = *(void **)(a1 + 40);
        CMTime v46 = buf;
        CMTime v45 = v48;
        uint64_t v32 = [v5 frameStats];
        uint64_t v10 = [v31 analyzeFrame:ImageBuffer timestamp:&v46 duration:&v45 frameStats:v32 flags:&v47 cancel:*(void *)(a1 + 48)];

        if (v10)
        {
          uint64_t v33 = *(void *)(a1 + 32);
          if (!*(void *)(v33 + 104)) {
            *(void *)(v33 + 104) = 62;
          }
          goto LABEL_45;
        }
        [v5 predictedTimeRange];
        long long v34 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
        *(_OWORD *)&range2.start.value = *MEMORY[0x1E4F1FA20];
        *(_OWORD *)&range2.start.epoch = v34;
        *(_OWORD *)&range2.duration.timescale = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 32);
        if (!CMTimeRangeEqual(&range1, &range2))
        {
          uint64_t v35 = *(void **)(a1 + 40);
          [v5 predictedTimeRange];
          uint64_t v36 = [v35 clipResults:&v42];
          [v5 setFullAnalysisResults:v36];
        }
        os_signpost_id_t v37 = VCPSignPostLog();
        long long v38 = v37;
        if (v28 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
        {
          LOWORD(v50.value) = 0;
          _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v38, OS_SIGNPOST_INTERVAL_END, v28, "VCPMovieAnalyzer_Video_VCPFullVideoAnalyzer", "", (uint8_t *)&v50, 2u);
        }

        uint64_t v14 = v47;
      }
      [v5 setFrameFlags:v14];
      uint64_t v10 = 0;
      goto LABEL_45;
    }
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      int v16 = VCPLogInstance();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        LODWORD(v50.value) = 138412290;
        *(CMTimeValue *)((char *)&v50.value + 4) = (CMTimeValue)@"[pipelineBlock1]";
        _os_log_impl(&dword_1BBEDA000, v16, OS_LOG_TYPE_ERROR, "%@ Invalid frameSampleBuffer.", (uint8_t *)&v50, 0xCu);
      }
LABEL_19:
    }
  }
  else if ((int)MediaAnalysisLogLevel() >= 3)
  {
    int v16 = VCPLogInstance();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v50.value) = 138412290;
      *(CMTimeValue *)((char *)&v50.value + 4) = (CMTimeValue)@"[pipelineBlock1]";
      _os_log_impl(&dword_1BBEDA000, v16, OS_LOG_TYPE_ERROR, "%@ Invalid currFrameResource.", (uint8_t *)&v50, 0xCu);
    }
    goto LABEL_19;
  }
  uint64_t v17 = *(void *)(a1 + 32);
  if (!*(void *)(v17 + 104)) {
    *(void *)(v17 + 104) = 45;
  }
  uint64_t v10 = 4294967278;
LABEL_45:
  uint64_t v39 = VCPSignPostLog();
  CMTimeRange v40 = v39;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v39))
  {
    LOWORD(v50.value) = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v40, OS_SIGNPOST_INTERVAL_END, v7, "VCPMovieAnalyzer_AnalyzeVideoSegment_FramePipelineBlock1", "", (uint8_t *)&v50, 2u);
  }

  return v10;
}

uint64_t __74__VCPMovieAnalyzer_analyzeVideoSegment_timerange_forAnalysisTypes_cancel___block_invoke_583(uint64_t a1, void *a2)
{
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = VCPSignPostLog();
  os_signpost_id_t v5 = os_signpost_id_generate(v4);

  uint64_t v6 = VCPSignPostLog();
  os_signpost_id_t v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    LOWORD(buf.value) = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "VCPMovieAnalyzer_AnalyzeVideoSegment_FramePipelineBlock2", "", (uint8_t *)&buf, 2u);
  }

  uint64_t v94 = 0;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 96) + 16))())
  {
    uint64_t v8 = *(void **)(a1 + 32);
    if (v8) {
      [v8 setCancelled:1];
    }
  }
  if ((*(uint64_t (**)(void))(*(void *)(a1 + 96) + 16))())
  {
    uint64_t v9 = 4294967168;
    goto LABEL_29;
  }
  if (v3)
  {
    uint64_t v10 = (opaqueCMSampleBuffer *)[v3 frameSampleBuffer];
    long long v11 = v10;
    if (v10)
    {
      CMSampleBufferGetPresentationTimeStamp(&v97, v10);
      CMTime buf = v97;
      CMSampleBufferGetDuration(&v97, v11);
      CMTime v95 = v97;
      CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer(v11);
      uint64_t v94 = [v3 frameFlags];
      if (*(void *)(a1 + 48))
      {
        id v12 = VCPSignPostLog();
        os_signpost_id_t v13 = os_signpost_id_generate(v12);

        uint64_t v14 = VCPSignPostLog();
        CVImageBufferRef v15 = v14;
        if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
        {
          LOWORD(v97.value) = 0;
          _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "VCPMovieAnalyzer_Video_VCPVideoActivityAnalyzer", "", (uint8_t *)&v97, 2u);
        }

        int v16 = *(void **)(a1 + 48);
        CMTime v93 = buf;
        CMTime v92 = v95;
        uint64_t v17 = [v3 frameStats];
        uint64_t v9 = [v16 analyzeFrame:ImageBuffer timestamp:&v93 duration:&v92 frameStats:v17 flags:&v94];

        if (v9)
        {
          uint64_t v18 = *(void *)(a1 + 40);
          if (*(void *)(v18 + 104)) {
            goto LABEL_29;
          }
          uint64_t v19 = 61;
LABEL_108:
          *(void *)(v18 + 104) = v19;
          goto LABEL_29;
        }
        uint64_t v25 = VCPSignPostLog();
        uint64_t v26 = v25;
        if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
        {
          LOWORD(v97.value) = 0;
          _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v26, OS_SIGNPOST_INTERVAL_END, v13, "VCPMovieAnalyzer_Video_VCPVideoActivityAnalyzer", "", (uint8_t *)&v97, 2u);
        }
      }
      if (*(void *)(a1 + 56))
      {
        v27 = VCPSignPostLog();
        os_signpost_id_t v28 = os_signpost_id_generate(v27);

        int v29 = VCPSignPostLog();
        CMTime v30 = v29;
        if (v28 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
        {
          LOWORD(v97.value) = 0;
          _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v30, OS_SIGNPOST_INTERVAL_BEGIN, v28, "VCPMovieAnalyzer_Video_VCPMovieCurationAnalyzer", "", (uint8_t *)&v97, 2u);
        }

        uint64_t v31 = *(void **)(a1 + 56);
        CMTime v91 = buf;
        CMTime v90 = v95;
        uint64_t v32 = [v3 frameStats];
        [*(id *)(*(void *)(a1 + 40) + 32) photoOffsetSeconds];
        uint64_t v9 = objc_msgSend(v31, "analyzeKeyFrame:timestamp:duration:frameStats:flags:photoOffset:", ImageBuffer, &v91, &v90, v32, &v94);

        if (v9)
        {
          uint64_t v18 = *(void *)(a1 + 40);
          if (*(void *)(v18 + 104)) {
            goto LABEL_29;
          }
          uint64_t v19 = 46;
          goto LABEL_108;
        }
        uint64_t v33 = VCPSignPostLog();
        long long v34 = v33;
        if (v28 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
        {
          LOWORD(v97.value) = 0;
          _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v34, OS_SIGNPOST_INTERVAL_END, v28, "VCPMovieAnalyzer_Video_VCPMovieCurationAnalyzer", "", (uint8_t *)&v97, 2u);
        }
      }
      if (*(void *)(a1 + 64))
      {
        uint64_t v35 = VCPSignPostLog();
        os_signpost_id_t v36 = os_signpost_id_generate(v35);

        os_signpost_id_t v37 = VCPSignPostLog();
        long long v38 = v37;
        if (v36 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
        {
          LOWORD(v97.value) = 0;
          _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v38, OS_SIGNPOST_INTERVAL_BEGIN, v36, "VCPMovieAnalyzer_Video_VCPVideoCNNAnalyzer", "", (uint8_t *)&v97, 2u);
        }

        uint64_t v39 = *(void **)(a1 + 64);
        CMTimeRange v40 = [v3 fullAnalysisResults];
        long long v41 = [v3 actionAnalysisResults];
        [v3 predictedTimeRange];
        CMTime v88 = buf;
        uint64_t v9 = [v39 loadFullAnalysisResults:v40 actionAnalysisResults:v41 predictedTimeRange:v89 timestamp:&v88];

        if (v9
          || (uint64_t v42 = *(void **)(a1 + 64),
              CMTime v87 = buf,
              CMTime v86 = v95,
              uint64_t v9 = [v42 analyzeFrame:ImageBuffer withTimestamp:&v87 andDuration:&v86 flags:&v94],
              v9))
        {
          uint64_t v18 = *(void *)(a1 + 40);
          if (*(void *)(v18 + 104)) {
            goto LABEL_29;
          }
          uint64_t v19 = 64;
          goto LABEL_108;
        }
        long long v43 = VCPSignPostLog();
        CMTimeRange v44 = v43;
        if (v36 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v43))
        {
          LOWORD(v97.value) = 0;
          _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v44, OS_SIGNPOST_INTERVAL_END, v36, "VCPMovieAnalyzer_Video_VCPVideoCNNAnalyzer", "", (uint8_t *)&v97, 2u);
        }
      }
      if (*(void *)(a1 + 72))
      {
        CMTime v45 = VCPSignPostLog();
        os_signpost_id_t v46 = os_signpost_id_generate(v45);

        uint64_t v47 = VCPSignPostLog();
        CMTime v48 = v47;
        if (v46 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v47))
        {
          LOWORD(v97.value) = 0;
          _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v48, OS_SIGNPOST_INTERVAL_BEGIN, v46, "VCPMovieAnalyzer_Video_VCPVideoStabilizerPixel", "", (uint8_t *)&v97, 2u);
        }

        v49 = *(void **)(a1 + 72);
        CMTime v85 = buf;
        CMTime v84 = v95;
        uint64_t v9 = [v49 analyzeFrame:ImageBuffer withTimestamp:&v85 andDuration:&v84 flags:&v94];
        if (v9) {
          goto LABEL_105;
        }
        CMTime v50 = VCPSignPostLog();
        uint64_t v51 = v50;
        if (v46 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v50))
        {
          LOWORD(v97.value) = 0;
          _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v51, OS_SIGNPOST_INTERVAL_END, v46, "VCPMovieAnalyzer_Video_VCPVideoStabilizerPixel", "", (uint8_t *)&v97, 2u);
        }
      }
      long long v52 = *(void **)(a1 + 32);
      if (v52 && ([v52 processAborted] & 1) == 0)
      {
        long long v53 = VCPSignPostLog();
        os_signpost_id_t v54 = os_signpost_id_generate(v53);

        long long v55 = VCPSignPostLog();
        uint64_t v56 = v55;
        if (v54 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v55))
        {
          LOWORD(v97.value) = 0;
          _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v56, OS_SIGNPOST_INTERVAL_BEGIN, v54, "VCPMovieAnalyzer_Video_VCPVideoInterpolator", "", (uint8_t *)&v97, 2u);
        }

        os_signpost_id_t v57 = *(void **)(a1 + 32);
        CMTime v83 = buf;
        CMTime v82 = v95;
        uint64_t v9 = [v57 analyzeFrame:ImageBuffer withTimestamp:&v83 andDuration:&v82 flags:&v94];
        uint64_t v18 = *(void *)(a1 + 40);
        if (v9) {
          goto LABEL_106;
        }
        if (*(void *)(v18 + 8) == 0x20000000 && [*(id *)(a1 + 32) processAborted])
        {
          uint64_t v58 = *(void *)(a1 + 40);
          if (!*(void *)(v58 + 104))
          {
            uint64_t v59 = 45;
LABEL_95:
            *(void *)(v58 + 104) = v59;
            goto LABEL_113;
          }
          goto LABEL_113;
        }
        int v60 = VCPSignPostLog();
        int v61 = v60;
        if (v54 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v60))
        {
          LOWORD(v97.value) = 0;
          _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v61, OS_SIGNPOST_INTERVAL_END, v54, "VCPMovieAnalyzer_Video_VCPVideoInterpolator", "", (uint8_t *)&v97, 2u);
        }
      }
      BOOL v62 = *(void **)(a1 + 80);
      if (v62 && ([v62 processAborted] & 1) == 0)
      {
        v63 = VCPSignPostLog();
        os_signpost_id_t v64 = os_signpost_id_generate(v63);

        v65 = VCPSignPostLog();
        v66 = v65;
        if (v64 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v65))
        {
          LOWORD(v97.value) = 0;
          _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v66, OS_SIGNPOST_INTERVAL_BEGIN, v64, "VCPMovieAnalyzer_Video_VCPSettlingEffectAnalyzer", "", (uint8_t *)&v97, 2u);
        }

        double v67 = *(void **)(a1 + 80);
        CMTime v81 = buf;
        CMTime v80 = v95;
        uint64_t v9 = [v67 analyzeFrame:ImageBuffer withTimestamp:&v81 andDuration:&v80 flags:&v94];
        uint64_t v18 = *(void *)(a1 + 40);
        if (v9)
        {
          if (*(void *)(v18 + 104)) {
            goto LABEL_29;
          }
          uint64_t v19 = 51;
          goto LABEL_108;
        }
        if (*(void *)(v18 + 8) == 0x4000000000 && [*(id *)(a1 + 80) processAborted])
        {
          uint64_t v58 = *(void *)(a1 + 40);
          if (!*(void *)(v58 + 104))
          {
            uint64_t v59 = 51;
            goto LABEL_95;
          }
LABEL_113:
          [v3 setFrameFlags:v94];
          uint64_t v9 = 0;
          goto LABEL_29;
        }
        v68 = VCPSignPostLog();
        double v69 = v68;
        if (v64 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v68))
        {
          LOWORD(v97.value) = 0;
          _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v69, OS_SIGNPOST_INTERVAL_END, v64, "VCPMovieAnalyzer_Video_VCPSettlingEffectAnalyzer", "", (uint8_t *)&v97, 2u);
        }
      }
      if (!*(void *)(a1 + 88)) {
        goto LABEL_113;
      }
      v70 = VCPSignPostLog();
      os_signpost_id_t v71 = os_signpost_id_generate(v70);

      os_signpost_id_t v72 = VCPSignPostLog();
      int v73 = v72;
      if (v71 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v72))
      {
        LOWORD(v97.value) = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v73, OS_SIGNPOST_INTERVAL_BEGIN, v71, "VCPMovieAnalyzer_Video_MADVideoSafetyClassifier", "", (uint8_t *)&v97, 2u);
      }

      v74 = *(void **)(a1 + 88);
      CMTime v79 = buf;
      CMTime v78 = v95;
      uint64_t v9 = [v74 analyzeFrameWithSampleBuffer:v11 timestamp:&v79 duration:&v78 andFlags:&v94];
      if (!v9)
      {
        v75 = VCPSignPostLog();
        int v76 = v75;
        if (v71 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v75))
        {
          LOWORD(v97.value) = 0;
          _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v76, OS_SIGNPOST_INTERVAL_END, v71, "VCPMovieAnalyzer_Video_MADVideoSafetyClassifier", "", (uint8_t *)&v97, 2u);
        }

        goto LABEL_113;
      }
LABEL_105:
      uint64_t v18 = *(void *)(a1 + 40);
LABEL_106:
      if (*(void *)(v18 + 104)) {
        goto LABEL_29;
      }
      uint64_t v19 = 45;
      goto LABEL_108;
    }
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      uint64_t v20 = VCPLogInstance();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        LODWORD(v97.value) = 138412290;
        *(CMTimeValue *)((char *)&v97.value + 4) = (CMTimeValue)@"[pipelineBlock2]";
        _os_log_impl(&dword_1BBEDA000, v20, OS_LOG_TYPE_ERROR, "%@ Invalid frameSampleBuffer.", (uint8_t *)&v97, 0xCu);
      }
LABEL_25:
    }
  }
  else if ((int)MediaAnalysisLogLevel() >= 3)
  {
    uint64_t v20 = VCPLogInstance();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v97.value) = 138412290;
      *(CMTimeValue *)((char *)&v97.value + 4) = (CMTimeValue)@"[pipelineBlock2]";
      _os_log_impl(&dword_1BBEDA000, v20, OS_LOG_TYPE_ERROR, "%@ Invalid currFrameResource.", (uint8_t *)&v97, 0xCu);
    }
    goto LABEL_25;
  }
  uint64_t v21 = *(void *)(a1 + 40);
  if (!*(void *)(v21 + 104)) {
    *(void *)(v21 + 104) = 45;
  }
  uint64_t v9 = 4294967278;
LABEL_29:
  double v22 = VCPSignPostLog();
  long long v23 = v22;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    LOWORD(v97.value) = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v23, OS_SIGNPOST_INTERVAL_END, v5, "VCPMovieAnalyzer_AnalyzeVideoSegment_FramePipelineBlock2", "", (uint8_t *)&v97, 2u);
  }

  return v9;
}

- (int)postProcessAutoPlayable:(id)a3
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"MovieSummaryResults"];

  if (v4)
  {
    os_signpost_id_t v5 = [v3 objectForKeyedSubscript:@"MovieSummaryResults"];
    uint64_t v6 = [v5 objectAtIndexedSubscript:0];
    os_signpost_id_t v7 = (void *)[v6 mutableCopy];

    uint64_t v8 = [v7 objectForKeyedSubscript:@"flags"];
    if (([v8 intValue] & 0x80000) != 0)
    {
      uint64_t v9 = [v7 objectForKeyedSubscript:@"quality"];
      [v9 floatValue];
      float v11 = v10;

      if (v11 <= 0.5)
      {
        id v12 = NSNumber;
        os_signpost_id_t v13 = [v7 objectForKeyedSubscript:@"flags"];
        uint64_t v14 = objc_msgSend(v12, "numberWithUnsignedLongLong:", (int)(objc_msgSend(v13, "intValue") & 0xFFF7FFFF));
        [v7 setObject:v14 forKeyedSubscript:@"flags"];

        v25[0] = v7;
        CVImageBufferRef v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
        [v3 setObject:v15 forKeyedSubscript:@"MovieSummaryResults"];
      }
    }
    else
    {
    }
    if (!+[VCPMovieAnalyzer isHeuristicStickerScoreEnabled])
    {
      int v16 = [v3 objectForKeyedSubscript:@"AnimatedStickerResults"];
      BOOL v17 = v16 == 0;

      if (!v17)
      {
        uint64_t v18 = [v3 objectForKeyedSubscript:@"AnimatedStickerResults"];
        uint64_t v19 = [v18 objectAtIndexedSubscript:0];
        uint64_t v20 = (void *)[v19 mutableCopy];

        uint64_t v21 = [v7 objectForKeyedSubscript:@"quality"];
        [v20 setObject:v21 forKeyedSubscript:@"quality"];

        long long v24 = v20;
        double v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
        [v3 setObject:v22 forKeyedSubscript:@"AnimatedStickerResults"];
      }
    }
  }
  return 0;
}

- (int)analyzeVideoTrack:(id)a3 start:(id *)a4 forAnalysisTypes:(unint64_t)a5 cancel:(id)a6
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  float v10 = (uint64_t (**)(void))a6;
  uint64_t v47 = v10;
  if (v9) {
    [v9 timeRange];
  }
  else {
    memset(&range, 0, sizeof(range));
  }
  CMTime time = (CMTime)*a4;
  if (!CMTimeRangeContainsTime(&range, &time))
  {
    if (!self->_errorCode) {
      self->_errorCode = 45;
    }
    int v13 = -50;
    goto LABEL_60;
  }
  {
    CMTimeMake((CMTime *)&-[VCPMovieAnalyzer analyzeVideoTrack:start:forAnalysisTypes:cancel:]::kMaxSegmentDuration, 300, 1);
  }
  long long v63 = 0uLL;
  CMTimeEpoch v64 = 0;
  if (v9)
  {
    objc_msgSend(v9, "vcp_endTime");
    p_float maxAnalysisLength = &self->_maxAnalysisLength;
    float maxAnalysisLength = self->_maxAnalysisLength;
    if (maxAnalysisLength <= 0.0) {
      goto LABEL_16;
    }
    objc_msgSend(v9, "vcp_endTime");
  }
  else
  {
    p_float maxAnalysisLength = &self->_maxAnalysisLength;
    float maxAnalysisLength = self->_maxAnalysisLength;
    if (maxAnalysisLength <= 0.0) {
      goto LABEL_16;
    }
    memset(&v62, 0, sizeof(v62));
  }
  if (CMTimeGetSeconds(&v62) > maxAnalysisLength)
  {
    CMTimeMakeWithSeconds((CMTime *)lhs, *p_maxAnalysisLength, 600);
    long long v63 = *(_OWORD *)lhs;
    CMTimeEpoch v64 = *(void *)&lhs[16];
  }
LABEL_16:
  CMTime v48 = [(NSMutableDictionary *)self->_privateResults objectForKeyedSubscript:@"MetaSegmentResults"];
  id v46 = v9;
  if (v9) {
    [v9 timeRange];
  }
  else {
    memset(lhs, 0, 48);
  }
  *(_OWORD *)&time1.start.CMTimeValue value = *(_OWORD *)&lhs[24];
  time1.start.epoch = *(void *)&lhs[40];
  uint64_t v14 = &-[VCPMovieAnalyzer analyzeVideoTrack:start:forAnalysisTypes:cancel:]::kMaxSegmentDuration;
  *(_OWORD *)&time2.start.CMTimeValue value = -[VCPMovieAnalyzer analyzeVideoTrack:start:forAnalysisTypes:cancel:]::kMaxSegmentDuration;
  time2.start.epoch = qword_1EB723A60;
  if (CMTimeCompare(&time1.start, &time2.start) < 1 && (unint64_t)[v48 count] < 2)
  {
    char v42 = 0;
    unint64_t v15 = a5;
  }
  else
  {
    unint64_t v15 = a5 & 0xFFFFFBFFFFFFFFFFLL;
    char v42 = 1;
  }
  memset(&time1, 0, sizeof(time1));
  unint64_t v16 = [v48 count];
  BOOL v17 = (_OWORD *)MEMORY[0x1E4F1FA20];
  if (v16 < 2)
  {
    long long v19 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
    *(_OWORD *)&time1.start.CMTimeValue value = *MEMORY[0x1E4F1FA20];
    *(_OWORD *)&time1.start.epoch = v19;
    *(_OWORD *)&time1.duration.CMTimeScale timescale = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 32);
  }
  else
  {
    CFDictionaryRef v18 = [v48 objectAtIndexedSubscript:0];
    CMTimeRangeMakeFromDictionary(&time1, v18);
  }
  uint64_t v44 = 0;
  unint64_t v45 = v15;
  while (1)
  {
    *(_OWORD *)lhs = *(_OWORD *)&a4->var0;
    *(void *)&lhs[16] = a4->var3;
    *(_OWORD *)&time2.start.CMTimeValue value = v63;
    time2.start.epoch = v64;
    if ((CMTimeCompare((CMTime *)lhs, &time2.start) & 0x80000000) == 0) {
      break;
    }
    memset(&time2.duration, 0, sizeof(time2.duration));
    *(_OWORD *)&time2.start.CMTimeValue value = *(_OWORD *)&a4->var0;
    time2.start.epoch = a4->var3;
    *(_OWORD *)lhs = v63;
    *(void *)&lhs[16] = v64;
    CMTime rhs = (CMTime)*a4;
    CMTimeSubtract(&duration, (CMTime *)lhs, &rhs);
    *(CMTime *)lhs = duration;
    *(_OWORD *)&rhs.CMTimeValue value = *v14;
    rhs.epoch = *((void *)v14 + 2);
    int32_t v20 = CMTimeCompare((CMTime *)lhs, &rhs);
    uint64_t v21 = &duration;
    if (v20 >= 0) {
      uint64_t v21 = (CMTime *)v14;
    }
    time2.CMTime duration = *v21;
    if ((time1.start.flags & 1) != 0
      && (time1.duration.flags & 1) != 0
      && !time1.duration.epoch
      && (time1.duration.value & 0x8000000000000000) == 0)
    {
      CMTimeRange v59 = time2;
      CMTimeRange otherRange = time1;
      CMTimeRangeGetIntersection((CMTimeRange *)lhs, &v59, &otherRange);
      CMTimeRange time2 = *(CMTimeRange *)lhs;
      CMTimeRange v57 = *(CMTimeRange *)lhs;
      CMTimeRangeGetEnd(&duration, &v57);
      CMTimeRange v55 = time1;
      CMTimeRangeGetEnd(&v56, &v55);
      *(CMTime *)lhs = duration;
      CMTime rhs = v56;
      if (!CMTimeCompare((CMTime *)lhs, &rhs))
      {
        if ([v48 count] > (unint64_t)++v44)
        {
          objc_msgSend(v48, "objectAtIndexedSubscript:");
          CFDictionaryRef v23 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
          CMTimeRangeMakeFromDictionary((CMTimeRange *)lhs, v23);
          CMTimeRange time1 = *(CMTimeRange *)lhs;
        }
        else
        {
          long long v24 = v17[1];
          *(_OWORD *)&time1.start.CMTimeValue value = *v17;
          *(_OWORD *)&time1.start.epoch = v24;
          *(_OWORD *)&time1.duration.CMTimeScale timescale = v17[2];
        }
      }
    }
    memset(&v56, 0, sizeof(v56));
    CMTimeRange v54 = time2;
    CMTimeRangeGetEnd(&v56, &v54);
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      uint64_t v25 = VCPLogInstance();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v26 = v14;
        v27 = self;
        int v28 = [v9 trackID];
        CMTimeValue value = time2.start.value;
        CMTimeScale timescale = time2.start.timescale;
        CMTime start = time2.start;
        Float64 Seconds = CMTimeGetSeconds(&start);
        CMTimeValue v32 = v56.value;
        CMTimeScale v33 = v56.timescale;
        CMTime v52 = v56;
        Float64 v34 = CMTimeGetSeconds(&v52);
        *(_DWORD *)lhs = 67110656;
        *(_DWORD *)&lhs[4] = v28;
        *(_WORD *)&lhs[8] = 2048;
        *(void *)&lhs[10] = value;
        *(_WORD *)&lhs[18] = 1024;
        *(_DWORD *)&lhs[20] = timescale;
        *(_WORD *)&lhs[24] = 2048;
        *(Float64 *)&lhs[26] = Seconds;
        *(_WORD *)&lhs[34] = 2048;
        *(void *)&lhs[36] = v32;
        *(_WORD *)&lhs[44] = 1024;
        *(_DWORD *)&lhs[46] = v33;
        __int16 v70 = 2048;
        Float64 v71 = v34;
        _os_log_impl(&dword_1BBEDA000, v25, OS_LOG_TYPE_DEBUG, "    Analyzing Video Segment - Track ID: %d Start: %lld/%d (%0.3fs) End: %lld/%d (%0.3fs)", lhs, 0x3Cu);
        self = v27;
        id v9 = v46;
        float v10 = v47;
        uint64_t v14 = v26;
        unint64_t v15 = v45;
        BOOL v17 = (_OWORD *)MEMORY[0x1E4F1FA20];
      }
    }
    if (v10 && (v10[2](v10) & 1) != 0)
    {
      int v13 = -128;
      goto LABEL_59;
    }
    int v13 = [(VCPMovieAnalyzer *)self analyzeVideoSegment:v9 timerange:&time2 forAnalysisTypes:v15 cancel:v10];
    if (v13)
    {
      if (!self->_errorCode) {
        self->_errorCode = 45;
      }
      goto LABEL_59;
    }
    CMTime rhs = (CMTime)*a4;
    CMTime duration = time2.duration;
    CMTimeAdd((CMTime *)lhs, &rhs, &duration);
    *(_OWORD *)&a4->var0 = *(_OWORD *)lhs;
    uint64_t v35 = *(void *)&lhs[16];
    a4->int64_t var3 = *(void *)&lhs[16];
    analysis = self->_analysis;
    long long v50 = *(_OWORD *)&a4->var0;
    uint64_t v51 = v35;
    [(NSMutableDictionary *)analysis vcp_setSyncPoint:&v50];
  }
  char v37 = v42 ^ 1;
  if ((a5 & 0x40000000000) == 0) {
    char v37 = 1;
  }
  if ((v37 & 1) == 0)
  {
    long long v38 = [(VCPAsset *)self->_asset mainFileURL];
    uint64_t v39 = [(VCPAsset *)self->_asset localIdentifier];
    if (v9) {
      [v9 timeRange];
    }
    else {
      memset(v49, 0, sizeof(v49));
    }
    CMTimeRange v40 = +[MADVideoSafetyClassifier analyzeVideoAssetOnDemandWithURL:v38 localIdentifier:v39 timeRange:v49 cancelBlock:v10 andProgressHandler:0];

    [(NSMutableDictionary *)self->_analysis vcp_appendResults:v40];
  }
  if (([(id)objc_opt_class() persistAudioEmbedding] & 1) == 0) {
    [(NSMutableDictionary *)self->_analysis vcp_removeResultForKey:@"AudioEmbeddingResults"];
  }
  int v13 = 0;
LABEL_59:

LABEL_60:
  return v13;
}

- (id)analyzeAsset:(id)a3 streamed:(BOOL *)a4
{
  uint64_t v197 = *MEMORY[0x1E4F143B8];
  os_signpost_id_t v7 = (uint64_t (**)(void))a3;
  if (a4) {
    *a4 = 0;
  }
  if (self->_status != 1) {
    goto LABEL_144;
  }
  uint64_t v8 = VCPSignPostLog();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  float v10 = VCPSignPostLog();
  float v11 = v10;
  os_signpost_id_t spid = v9;
  unint64_t v150 = v9 - 1;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)CMTime buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "VCPMovieAnalyzer", "", buf, 2u);
  }

  unint64_t requestedAnalyses = self->_requestedAnalyses;
  if (v7 && (v7[2](v7) & 1) != 0)
  {
LABEL_135:
    self->_status = 4;
    p_analysis = &self->_analysis;
    analysis = self->_analysis;
    if (analysis)
    {
      [(NSMutableDictionary *)analysis vcp_syncPoint];
      if (buf[12]) {
        goto LABEL_140;
      }
    }
    goto LABEL_139;
  }
  context = (void *)MEMORY[0x1C186D320]();
  int v13 = [(VCPAsset *)self->_asset movie];
  if (!v13)
  {
    if (![(VCPMovieAnalyzer *)self allowStreaming]) {
      goto LABEL_28;
    }
    int32_t v20 = VCPSignPostLog();
    os_signpost_id_t v21 = os_signpost_id_generate(v20);

    double v22 = VCPSignPostLog();
    CFDictionaryRef v23 = v22;
    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      *(_WORD *)CMTime buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v23, OS_SIGNPOST_INTERVAL_BEGIN, v21, "VCPMovieAnalyzer_ResourceDownload", "", buf, 2u);
    }

    [(NSMutableDictionary *)self->_analysis vcp_addFlags:0x20000000];
    if (a4) {
      *a4 = 1;
    }
    int v13 = [(VCPAsset *)self->_asset streamedMovie:[(VCPMovieAnalyzer *)self onDemand]];
    if (v13) {
      [(VCPMovieAnalyzer *)self loadPropertiesForAsset:v13];
    }
    long long v24 = VCPSignPostLog();
    uint64_t v4 = (uint64_t)v24;
    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      *(_WORD *)CMTime buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, (os_log_t)v4, OS_SIGNPOST_INTERVAL_END, v21, "VCPMovieAnalyzer_ResourceDownload", "", buf, 2u);
    }

    if (!v13)
    {
LABEL_28:
      int v13 = 0;
      if (!self->_errorCode) {
        self->_errorCode = 45;
      }
      goto LABEL_41;
    }
  }
  if ([(VCPAsset *)self->_asset isMovie] && ([(VCPAsset *)self->_asset duration], v14 < 1.0)
    || objc_msgSend(v13, "vcp_isMontage"))
  {
    unint64_t v15 = self->_analysis;
    unint64_t v16 = [MEMORY[0x1E4F1C9C8] date];
    [(NSMutableDictionary *)v15 vcp_setDateAnalyzed:v16];

    [(NSMutableDictionary *)self->_analysis vcp_setFlags:0];
    [(NSMutableDictionary *)self->_analysis vcp_setQuality:0.0];
    [(NSMutableDictionary *)self->_analysis vcp_setStatsFlags:4];
    [(NSMutableDictionary *)self->_analysis vcp_setTypes:0x7FFFFFFFFFFFFFFFLL];
    self->_status = 2;
    if ((self->_requestedAnalyses & 0x20000000) != 0) {
      +[VCPVideoInterpolator sendPreGatedAnalytics];
    }
    uint64_t v4 = self->_analysis;
    int v17 = 0;
    BOOL v18 = 1;
    int v19 = 1;
    goto LABEL_109;
  }
  uint64_t v25 = requestedAnalyses & 0x820408A00010;
  if ((requestedAnalyses & 0x820408A00010) != 0)
  {
    uint64_t v26 = (void *)MEMORY[0x1C186D320]();
    v27 = VCPSignPostLog();
    os_signpost_id_t v28 = os_signpost_id_generate(v27);

    int v29 = VCPSignPostLog();
    uint64_t v4 = (uint64_t)v29;
    if (v28 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
    {
      *(_WORD *)CMTime buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, (os_log_t)v4, OS_SIGNPOST_INTERVAL_BEGIN, v28, "VCPMovieAnalyzer_Audio", "", buf, 2u);
    }

    CMTime v30 = [[VCPAudioAnalyzer alloc] initWithAnalysisTypes:v25 forStreaming:0];
    uint64_t v31 = v30;
    if (v30)
    {
      id v162 = 0;
      int v17 = [(VCPAudioAnalyzer *)v30 analyzeAsset:v13 cancel:v7 results:&v162];
      uint64_t v4 = (uint64_t)v162;
      if (v17)
      {
        if (!self->_errorCode) {
          self->_errorCode = 2;
        }
        int v19 = 4;
      }
      else
      {
        [(NSMutableDictionary *)self->_analysis vcp_addEntriesFromResults:v4];
        [(NSMutableDictionary *)self->_analysis vcp_addTypes:v25];
        CMTimeScale v33 = VCPSignPostLog();
        Float64 v34 = v33;
        if (v28 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v33))
        {
          *(_WORD *)CMTime buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v34, OS_SIGNPOST_INTERVAL_END, v28, "VCPMovieAnalyzer_Audio", "", buf, 2u);
        }

        int v19 = 0;
      }
    }
    else
    {
      if (!self->_errorCode) {
        self->_errorCode = 2;
      }
      int v19 = 4;
      int v17 = -18;
    }

    if (v19) {
      goto LABEL_108;
    }
    int v32 = v17;
  }
  else
  {
    int v32 = 0;
  }
  int v17 = [(VCPMovieAnalyzer *)self performMetadataAnalysisOnAsset:v13 withCancelBlock:v7];
  if (v17)
  {
    if (!self->_errorCode) {
      self->_errorCode = 45;
    }
    goto LABEL_107;
  }
  unint64_t v35 = self->_requestedAnalyses;
  int v145 = v32;
  if ((v35 & 0x4000010010000000) != 0)
  {
    os_signpost_id_t v36 = VCPSignPostLog();
    os_signpost_id_t v146 = os_signpost_id_generate(v36);

    char v37 = VCPSignPostLog();
    uint64_t v4 = (uint64_t)v37;
    if (v146 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
    {
      *(_WORD *)CMTime buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, (os_log_t)v4, OS_SIGNPOST_INTERVAL_BEGIN, v146, "VCPMovieAnalyzer_Stabilization", "", buf, 2u);
    }

    v147 = [(NSMutableDictionary *)self->_privateResults objectForKeyedSubscript:@"MetaStabilizationResults"];
    if ((self->_requestedAnalyses & 0x10000000000) != 0)
    {
      uint64_t v4 = @"LivePhotoKeyFrameTimestamp";
      CMTimeRange v40 = [(NSDictionary *)self->_options objectForKeyedSubscript:@"LivePhotoKeyFrameTimestamp"];
      BOOL v41 = v40 == 0;

      if (v41)
      {
        id v39 = [(NSMutableDictionary *)self->_privateResults objectForKeyedSubscript:@"MetaStillImageHomographyResults"];
      }
      else
      {
        id v42 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        v194 = @"attributes";
        v193[0] = &unk_1F15EE520;
        v192[0] = @"MetaStillImagePerspectiveTransformResults";
        v192[1] = @"MetaPresentationTimeResults";
        long long v43 = [(NSDictionary *)self->_options objectForKeyedSubscript:@"LivePhotoKeyFrameTimestamp"];
        v193[1] = v43;
        uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v193 forKeys:v192 count:2];
        uint64_t v195 = v4;
        uint64_t v44 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v195 forKeys:&v194 count:1];
        [v42 addObject:v44];

        id v39 = v42;
      }
      if (![v39 count]) {
        goto LABEL_77;
      }
      uint64_t v38 = [v147 count];
    }
    else
    {
      uint64_t v38 = [v147 count];
      id v39 = 0;
    }
    if (v38)
    {
      unint64_t v45 = objc_msgSend(v13, "vcp_firstEnabledTrackWithMediaType:", *MEMORY[0x1E4F15C18]);
      if (!v45) {
        goto LABEL_103;
      }
      uint64_t v4 = @"LivePhotoKeyFrameTimestamp";
      v144 = v45;
      id v46 = [(NSDictionary *)self->_options objectForKeyedSubscript:@"LivePhotoKeyFrameTimestamp"];
      if (v46)
      {
        [v45 timeRange];
        CMTimeRangeGetEnd(&v161, &range);
        uint64_t v4 = [(NSDictionary *)self->_options objectForKeyedSubscript:@"LivePhotoKeyFrameTimestamp"];
        CMTimeMakeFromDictionary(&v159, (CFDictionaryRef)v4);
        *(CMTime *)CMTime buf = v161;
        CMTime time2 = v159;
        int32_t v47 = CMTimeCompare((CMTime *)buf, &time2);

        if (v47 < 0)
        {
          v190 = @"PathConstraintsStabilizationResults";
          v187 = @"attributes";
          v185 = @"settlingEffectStatus";
          v183 = @"settlingEffectLivePhotoKeyFrameTimeOutOfBoundFailure";
          uint64_t v184 = MEMORY[0x1E4F1CC38];
          CMTime v91 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v184 forKeys:&v183 count:1];
          v186 = v91;
          CMTime v92 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v186 forKeys:&v185 count:1];
          v188 = v92;
          CMTime v93 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v188 forKeys:&v187 count:1];
          v189 = v93;
          uint64_t v94 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v189 count:1];
          id v191 = v94;
          CMTime v95 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v191 forKeys:&v190 count:1];

          [(NSMutableDictionary *)self->_analysis vcp_addEntriesFromResults:v95];
          [(NSMutableDictionary *)self->_analysis vcp_addTypes:0x10000000000];
          unint64_t v96 = self->_requestedAnalyses;
          if ((v96 & 0x4000000000) != 0) {
            self->_unint64_t requestedAnalyses = v96 & 0xFFFFFFBFFFFFFFFFLL;
          }
          [(NSMutableDictionary *)self->_analysis vcp_addTypes:0x4000000000];

          goto LABEL_151;
        }
      }
      objc_msgSend(v45, "vcp_fullFrameSize");
      double v50 = v49;
      double v51 = v48;
      if (v49 < 1.0 || v48 < 1.0)
      {
        if ((int)MediaAnalysisLogLevel() < 3) {
          goto LABEL_103;
        }
        uint64_t v4 = VCPLogInstance();
        if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)CMTime buf = 134218240;
          *(double *)&uint8_t buf[4] = v50;
          *(_WORD *)&buf[12] = 2048;
          *(double *)&buf[14] = v51;
          _os_log_impl(&dword_1BBEDA000, (os_log_t)v4, OS_LOG_TYPE_ERROR, "    Video track has invalid full frame dimensions (%.f,%.f)", buf, 0x16u);
        }
LABEL_102:

LABEL_103:
        if (self->_errorCode)
        {
LABEL_105:
          int v17 = -18;
LABEL_106:

LABEL_107:
          int v19 = 4;
LABEL_108:
          BOOL v18 = 1;
          goto LABEL_109;
        }
LABEL_104:
        self->_errorCode = 45;
        goto LABEL_105;
      }
      objc_msgSend(v45, "vcp_cleanApertureRect");
      double x = v199.origin.x;
      double y = v199.origin.y;
      double width = v199.size.width;
      double height = v199.size.height;
      if (CGRectIsEmpty(v199))
      {
        if ((int)MediaAnalysisLogLevel() < 3) {
          goto LABEL_103;
        }
        uint64_t v4 = VCPLogInstance();
        if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)CMTime buf = 0;
          _os_log_impl(&dword_1BBEDA000, (os_log_t)v4, OS_LOG_TYPE_ERROR, "    Video track has invalid clean aperture rect", buf, 2u);
        }
        goto LABEL_102;
      }
      uint64_t v4 = [v147 objectForKeyedSubscript:@"MetaHomographyDimensionResults"];
      NSSize v116 = NSSizeFromString((NSString *)v4);

      if (v116.width == *MEMORY[0x1E4F1DB30] && v116.height == *(double *)(MEMORY[0x1E4F1DB30] + 8))
      {
        if (self->_errorCode) {
          goto LABEL_105;
        }
        goto LABEL_104;
      }
      long long v182 = 0u;
      memset(buf, 0, sizeof(buf));
      if ((self->_requestedAnalyses & 0x10000000000) != 0)
      {
        +[VCPSettlingEffectAnalyzer getSettlingEffectTimeRange:v45 withOptions:self->_options];
        if ((self->_requestedAnalyses & 0x10000000000) != 0
          && ((buf[12] & 1) == 0
           || (BYTE4(v182) & 1) == 0
           || *((void *)&v182 + 1)
           || (*(void *)&buf[24] & 0x8000000000000000) != 0))
        {
          if ((int)MediaAnalysisLogLevel() >= 7)
          {
            v129 = VCPLogInstance();
            if (os_log_type_enabled(v129, OS_LOG_TYPE_DEBUG))
            {
              id v130 = [(VCPAsset *)self->_asset localIdentifier];
              LODWORD(time2.value) = 138412290;
              *(CMTimeValue *)((char *)&time2.value + 4) = (CMTimeValue)v130;
              _os_log_impl(&dword_1BBEDA000, v129, OS_LOG_TYPE_DEBUG, "  [%@] Asset has invalid time range for path constraint stabilization", (uint8_t *)&time2, 0xCu);
            }
          }
          v179 = @"PathConstraintsStabilizationResults";
          v176 = @"attributes";
          v174 = @"settlingEffectStatus";
          v172 = @"settlingEffectInvalidTimeRange";
          uint64_t v173 = MEMORY[0x1E4F1CC38];
          v131 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v173 forKeys:&v172 count:1];
          os_signpost_id_t v175 = v131;
          v132 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v175 forKeys:&v174 count:1];
          v177 = v132;
          v133 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v177 forKeys:&v176 count:1];
          v178 = v133;
          os_signpost_id_t v134 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v178 count:1];
          v180 = v134;
          uint64_t v127 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v180 forKeys:&v179 count:1];

          [(NSMutableDictionary *)self->_analysis vcp_addEntriesFromResults:v127];
          [(NSMutableDictionary *)self->_analysis vcp_addTypes:0x10000000000];
          unint64_t v135 = self->_requestedAnalyses;
          if ((v135 & 0x4000000000) != 0) {
            self->_unint64_t requestedAnalyses = v135 & 0xFFFFFFBFFFFFFFFFLL;
          }
          [(NSMutableDictionary *)self->_analysis vcp_addTypes:0x4000000000];
LABEL_245:

LABEL_151:
          double v67 = v144;
          goto LABEL_152;
        }
      }
      else
      {
        long long v117 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 16);
        *(_OWORD *)CMTime buf = *MEMORY[0x1E4F1FA20];
        *(_OWORD *)&uint8_t buf[16] = v117;
        long long v182 = *(_OWORD *)(MEMORY[0x1E4F1FA20] + 32);
      }
      id v120 = VCPSignPostLog();
      os_signpost_id_t v121 = os_signpost_id_generate(v120);

      uint64_t v122 = VCPSignPostLog();
      id v123 = v122;
      if (v121 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v122))
      {
        LOWORD(time2.value) = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v123, OS_SIGNPOST_INTERVAL_BEGIN, v121, "VCPMovieAnalyzer_Stabilization_VCPVideoStabilizerGyro", "", (uint8_t *)&time2, 2u);
      }

      v124 = [VCPVideoGyroStabilizer alloc];
      uint64_t v4 = [v147 objectForKeyedSubscript:@"MetaStabilizationFrameResults"];
      float v125 = v116.width / v50;
      float v126 = v116.height / v51;
      v158[0] = *(_OWORD *)buf;
      v158[1] = *(_OWORD *)&buf[16];
      v158[2] = v182;
      uint64_t v127 = -[VCPVideoGyroStabilizer initWithMetadata:sourceSize:cropRect:stillImageMetadata:timeRange:](v124, "initWithMetadata:sourceSize:cropRect:stillImageMetadata:timeRange:", v4, v39, v158, v116.width, v116.height, x * v125, y * v126, width * v125, height * v126);

      if (!v127)
      {
        p_errorCode = &self->_errorCode;
        int v17 = -108;
        if (self->_errorCode) {
          goto LABEL_221;
        }
        goto LABEL_220;
      }
      int v17 = [(VCPVideoGyroStabilizer *)v127 convertAnalysisResult];
      if (v17)
      {
LABEL_219:
        p_errorCode = &self->_errorCode;
        if (self->_errorCode)
        {
LABEL_221:

          unint64_t v45 = v144;
          goto LABEL_106;
        }
LABEL_220:
        unint64_t *p_errorCode = 45;
        goto LABEL_221;
      }
      if ((self->_requestedAnalyses & 0x4000000000000000) != 0)
      {
        [v144 preferredTransform];
        [(VCPVideoGyroStabilizer *)v127 storeAnalytics:v157 isLivePhoto:[(VCPAsset *)self->_asset isLivePhoto]];
      }
      [(NSMutableDictionary *)self->_analysis vcp_addTypes:0x4000000000000000];
      unint64_t v136 = self->_requestedAnalyses;
      if ((v136 & 0x10000000) != 0)
      {
        self->_unint64_t requestedAnalyses = v136 & 0xFFFFFFFFFBFFFFFFLL;
        long long v137 = *(_OWORD *)(MEMORY[0x1E4F1FA30] + 16);
        v156[0] = *MEMORY[0x1E4F1FA30];
        v156[1] = v137;
        v156[2] = *(_OWORD *)(MEMORY[0x1E4F1FA30] + 32);
        int v17 = [(VCPVideoStabilizer *)v127 finishAnalysisPass:v156];
        if (v17) {
          goto LABEL_219;
        }
        v138 = self->_analysis;
        uint64_t v4 = [(VCPVideoStabilizer *)v127 results];
        [(NSMutableDictionary *)v138 vcp_addEntriesFromResults:v4];

        [(NSMutableDictionary *)self->_analysis vcp_addTypes:335544320];
        unint64_t v136 = self->_requestedAnalyses;
      }
      if ((v136 & 0x10000000000) != 0)
      {
        long long v141 = *(_OWORD *)(MEMORY[0x1E4F1FA30] + 16);
        v155[0] = *MEMORY[0x1E4F1FA30];
        v155[1] = v141;
        v155[2] = *(_OWORD *)(MEMORY[0x1E4F1FA30] + 32);
        int v17 = [(VCPVideoStabilizer *)v127 finishAnalysisPass:v155];
        if (v17) {
          goto LABEL_219;
        }
        v142 = self->_analysis;
        v143 = [(VCPVideoStabilizer *)v127 results];
        [(NSMutableDictionary *)v142 vcp_addEntriesFromResults:v143];

        [(NSMutableDictionary *)self->_analysis vcp_addTypes:0x10000000000];
        if ((self->_requestedAnalyses & 0x4000000000) != 0)
        {
          if ([(VCPVideoStabilizer *)v127 stabilizationFaild]) {
            self->_requestedAnalyses &= ~0x4000000000uLL;
          }
          [(NSMutableDictionary *)self->_analysis vcp_addTypes:0x4000000000];
        }
      }
      long long v139 = VCPSignPostLog();
      v140 = v139;
      if (v121 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v139))
      {
        LOWORD(time2.value) = 0;
        _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v140, OS_SIGNPOST_INTERVAL_END, v121, "VCPMovieAnalyzer_Stabilization_VCPVideoStabilizerGyro", "", (uint8_t *)&time2, 2u);
      }

      goto LABEL_245;
    }
LABEL_77:
    unint64_t v56 = self->_requestedAnalyses;
    if ((v56 & 0x4000000000000000) != 0)
    {
      [(NSMutableDictionary *)self->_analysis vcp_addTypes:0x4000000000000000];
      unint64_t v56 = self->_requestedAnalyses;
    }
    if ((v56 & 0x10000000) != 0)
    {
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        CMTimeRange v57 = VCPLogInstance();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
        {
          id v58 = [(VCPAsset *)self->_asset localIdentifier];
          *(_DWORD *)CMTime buf = 138412290;
          *(void *)&uint8_t buf[4] = v58;
          _os_log_impl(&dword_1BBEDA000, v57, OS_LOG_TYPE_DEBUG, "  [%@] Asset doesn't have gyro metadata", buf, 0xCu);
        }
      }
      [(NSMutableDictionary *)self->_analysis vcp_addTypes:0x10000000];
      unint64_t v56 = self->_requestedAnalyses;
    }
    if ((v56 & 0x10000000000) == 0) {
      goto LABEL_153;
    }
    if (![v147 count] && (int)MediaAnalysisLogLevel() >= 7)
    {
      CMTimeRange v59 = VCPLogInstance();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
      {
        id v60 = [(VCPAsset *)self->_asset localIdentifier];
        *(_DWORD *)CMTime buf = 138412290;
        *(void *)&uint8_t buf[4] = v60;
        _os_log_impl(&dword_1BBEDA000, v59, OS_LOG_TYPE_DEBUG, "  [%@] Asset doesn't have gyro metadata", buf, 0xCu);
      }
    }
    if (![v39 count] && (int)MediaAnalysisLogLevel() >= 7)
    {
      int v61 = VCPLogInstance();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
      {
        id v62 = [(VCPAsset *)self->_asset localIdentifier];
        *(_DWORD *)CMTime buf = 138412290;
        *(void *)&uint8_t buf[4] = v62;
        _os_log_impl(&dword_1BBEDA000, v61, OS_LOG_TYPE_DEBUG, "  [%@] Asset doesn't have still image metadata", buf, 0xCu);
      }
    }
    v170 = @"PathConstraintsStabilizationResults";
    uint64_t v167 = @"attributes";
    v165 = @"settlingEffectStatus";
    float v163 = @"settlingEffectMissingMetadata";
    uint64_t v164 = MEMORY[0x1E4F1CC38];
    long long v63 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v164 forKeys:&v163 count:1];
    float v166 = v63;
    CMTimeEpoch v64 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v166 forKeys:&v165 count:1];
    v168 = v64;
    v65 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v168 forKeys:&v167 count:1];
    v169 = v65;
    v66 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v169 count:1];
    v171 = v66;
    double v67 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v171 forKeys:&v170 count:1];

    [(NSMutableDictionary *)self->_analysis vcp_addEntriesFromResults:v67];
    [(NSMutableDictionary *)self->_analysis vcp_addTypes:0x10000000000];
    unint64_t v68 = self->_requestedAnalyses;
    if ((v68 & 0x4000000000) != 0) {
      self->_unint64_t requestedAnalyses = v68 & 0xFFFFFFBFFFFFFFFFLL;
    }
    [(NSMutableDictionary *)self->_analysis vcp_addTypes:0x4000000000];
LABEL_152:

LABEL_153:
    CMTime v97 = VCPSignPostLog();
    uint64_t v4 = (uint64_t)v97;
    if (v146 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v97))
    {
      *(_WORD *)CMTime buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBEDA000, (os_log_t)v4, OS_SIGNPOST_INTERVAL_END, v146, "VCPMovieAnalyzer_Stabilization", "", buf, 2u);
    }

    unint64_t v35 = self->_requestedAnalyses;
    int v32 = v145;
  }
  if ((v35 & 0x2C636446D888) == 0)
  {
    int v19 = 0;
    BOOL v18 = 1;
    int v17 = v32;
    goto LABEL_109;
  }
  uint64_t v98 = VCPSignPostLog();
  os_signpost_id_t v99 = os_signpost_id_generate(v98);

  CMTime v100 = VCPSignPostLog();
  uint64_t v4 = (uint64_t)v100;
  if (v99 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v100))
  {
    *(_WORD *)CMTime buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, (os_log_t)v4, OS_SIGNPOST_INTERVAL_BEGIN, v99, "VCPMovieAnalyzer_Video", "", buf, 2u);
  }

  CMTime v101 = objc_msgSend(v13, "vcp_firstEnabledTrackWithMediaType:", *MEMORY[0x1E4F15C18]);
  uint64_t v102 = v101;
  if (!v101)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v110 = VCPLogInstance();
      uint64_t v4 = 16;
      if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR))
      {
        id v111 = [(VCPAsset *)self->_asset localIdentifier];
        v112 = [v13 tracks];
        uint64_t v113 = [v112 count];
        v114 = [v13 tracks];
        *(_DWORD *)CMTime buf = 138412802;
        *(void *)&uint8_t buf[4] = v111;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v113;
        *(_WORD *)&buf[22] = 2112;
        *(void *)&buf[24] = v114;
        _os_log_impl(&dword_1BBEDA000, v110, OS_LOG_TYPE_ERROR, "  [%@] Asset does not have valid video track; all %lu tracks: %@",
          buf,
          0x20u);
      }
    }
    goto LABEL_179;
  }
  [v101 naturalSize];
  double v105 = v104;
  double v106 = v103;
  if (v104 < 1.0 || v103 < 1.0)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      uint64_t v4 = VCPLogInstance();
      if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)CMTime buf = 134218240;
        *(double *)&uint8_t buf[4] = v105;
        *(_WORD *)&buf[12] = 2048;
        *(double *)&buf[14] = v106;
        _os_log_impl(&dword_1BBEDA000, (os_log_t)v4, OS_LOG_TYPE_ERROR, "    Video track has invalid dimensions (%.f,%.f)", buf, 0x16u);
      }
    }
LABEL_179:
    if (!self->_errorCode) {
      self->_errorCode = 45;
    }

LABEL_41:
    int v19 = 4;
    BOOL v18 = 1;
    int v17 = -18;
    goto LABEL_109;
  }
  [v102 nominalFrameRate];
  BOOL v18 = v107 < 25.0;
  memset(&v161, 0, sizeof(v161));
  id v108 = self->_analysis;
  if (v108) {
    [(NSMutableDictionary *)v108 vcp_syncPoint];
  }
  *(CMTime *)CMTime buf = v161;
  CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F8];
  if (CMTimeCompare((CMTime *)buf, &time2))
  {
    [v102 timeRange];
    CMTime time = v161;
    if (!CMTimeRangeContainsTime(&v154, &time))
    {
      v109 = &self->_errorCode;
      int v17 = -18;
      if (!self->_errorCode) {
        goto LABEL_189;
      }
      goto LABEL_190;
    }
  }
  else
  {
    objc_msgSend(v102, "vcp_startTime");
    CMTime v161 = *(CMTime *)buf;
  }
  unint64_t v115 = self->_requestedAnalyses;
  if ((v115 & 0x4024000000) != 0)
  {
    CMTime v152 = v161;
    int v17 = [(VCPMovieAnalyzer *)self analyzeVideoTrack:v102 start:&v152 forAnalysisTypes:v115 & 0x4024000000 cancel:v7];
    if (v17) {
      goto LABEL_188;
    }
    unint64_t v115 = self->_requestedAnalyses;
  }
  if ((v115 & 0x2C234046D888) != 0)
  {
    CMTime v151 = v161;
    int v17 = [(VCPMovieAnalyzer *)self analyzeVideoTrack:v102 start:&v151 forAnalysisTypes:v115 & 0xFFFFFFBFDBFFFFFFLL cancel:v7];
    if (v17) {
      goto LABEL_188;
    }
    unint64_t v115 = self->_requestedAnalyses;
  }
  if ((v115 & 8) != 0)
  {
    [(NSMutableDictionary *)self->_analysis vcp_addTypes:12];
    unint64_t v115 = self->_requestedAnalyses;
  }
  if ((v115 & 0x880) != 0)
  {
    [(NSMutableDictionary *)self->_analysis vcp_addTypes:192];
    [(NSMutableDictionary *)self->_analysis vcp_addTypes:2048];
    unint64_t v115 = self->_requestedAnalyses;
  }
  if ((v115 & 0x40000) != 0)
  {
    [(NSMutableDictionary *)self->_analysis vcp_addTypes:0x40000];
    if (![(VCPAsset *)self->_asset isLivePhoto])
    {
      int v17 = [(VCPMovieAnalyzer *)self generateKeyFrameResource:v13];
      if (v17)
      {
LABEL_188:
        v109 = &self->_errorCode;
        if (!self->_errorCode) {
LABEL_189:
        }
          unint64_t *v109 = 45;
LABEL_190:

        int v19 = 4;
        goto LABEL_109;
      }
    }
  }
  unint64_t v118 = self->_requestedAnalyses;
  if ((v118 & 0x80000000000) != 0) {
    [(NSMutableDictionary *)self->_analysis vcp_addTypes:0x1000000000000];
  }
  if ((v118 & 0x200000000000) != 0) {
    [(NSMutableDictionary *)self->_analysis vcp_addTypes:0x2000000000000];
  }
  [(NSMutableDictionary *)self->_analysis vcp_addTypes:v118 & 0x2C617542D000];
  v119 = VCPSignPostLog();
  uint64_t v4 = (uint64_t)v119;
  if (v99 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v119))
  {
    *(_WORD *)CMTime buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, (os_log_t)v4, OS_SIGNPOST_INTERVAL_END, v99, "VCPMovieAnalyzer_Video", "", buf, 2u);
  }

  int v19 = 0;
  int v17 = v145;
LABEL_109:

  if (v19 == 4) {
    goto LABEL_133;
  }
  if (v19) {
    goto LABEL_145;
  }
  [(NSMutableDictionary *)self->_analysis vcp_removeSyncPoint];
  double v69 = self->_analysis;
  __int16 v70 = [MEMORY[0x1E4F1C9C8] date];
  [(NSMutableDictionary *)v69 vcp_setDateAnalyzed:v70];

  Float64 v71 = [(NSMutableDictionary *)self->_analysis vcp_results];
  uint64_t v72 = [v71 objectForKey:@"QualityResults"];
  BOOL v73 = [v72 count] == 0;

  if (!v73)
  {
    v74 = objc_alloc_init(VCPVideoGlobalAnalyzer);
    BOOL v75 = [(VCPAsset *)self->_asset isSlowmo];
    asset = self->_asset;
    if (v75) {
      [(VCPAsset *)asset slowmoRate];
    }
    else {
      [(VCPAsset *)asset timelapseRate];
    }
    -[VCPVideoGlobalAnalyzer analyzeOverallQuality:withFpsRate:](v74, "analyzeOverallQuality:withFpsRate:", self->_analysis);
    double v78 = v77;
    if (v78 != -1.0) {
      -[NSMutableDictionary vcp_setQuality:](self->_analysis, "vcp_setQuality:", v78, -1.0);
    }
    if ((self->_requestedAnalyses & 0x80000000) != 0)
    {
      if ([(VCPAsset *)self->_asset isLivePhoto] && ![(VCPAsset *)self->_asset hadFlash])
      {
        CMTime v79 = [(NSMutableDictionary *)self->_analysis objectForKey:@"metadataRanges"];
        [(VCPVideoGlobalAnalyzer *)v74 generateLivePhotoRecommendationForResults:v79 andPrivateResults:self->_privateResults usingFaceAction:v18];
      }
      [(NSMutableDictionary *)self->_analysis vcp_addTypes:0x80000000];
    }
  }
  if (([(NSMutableDictionary *)self->_analysis vcp_types] & 0x80) != 0)
  {
    CMTime v80 = [(NSMutableDictionary *)self->_analysis vcp_results];
    BOOL v81 = v80 == 0;

    if (!v81)
    {
      CMTime v82 = objc_alloc_init(VCPVideoGlobalAnalyzer);
      CMTime v83 = [(NSMutableDictionary *)self->_analysis vcp_results];
      int v84 = [(VCPVideoGlobalAnalyzer *)v82 setActivityLevel:v83];

      if (v84)
      {
        if (!self->_errorCode) {
          self->_errorCode = 67;
        }

        int v17 = v84;
        goto LABEL_133;
      }
    }
  }
  if ([(VCPAsset *)self->_asset isMovie]) {
    [(NSMutableDictionary *)self->_analysis vcp_addStatsFlags:4];
  }
  self->_status = 2;
LABEL_133:
  if (!v17) {
    goto LABEL_140;
  }
  if (v17 == -128) {
    goto LABEL_135;
  }
  self->_status = 3;
  p_analysis = &self->_analysis;
LABEL_139:
  CMTime v87 = *p_analysis;
  *p_analysis = 0;

LABEL_140:
  CMTime v88 = VCPSignPostLog();
  CMTime v89 = v88;
  if (v150 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v88))
  {
    *(_WORD *)CMTime buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBEDA000, v89, OS_SIGNPOST_INTERVAL_END, spid, "VCPMovieAnalyzer", "", buf, 2u);
  }

LABEL_144:
  uint64_t v4 = self->_analysis;
LABEL_145:

  return (id)v4;
}

- (int)generateKeyFrameResource:(id)a3
{
  id v4 = a3;
  os_signpost_id_t v5 = [(NSMutableDictionary *)self->_analysis vcp_results];
  uint64_t v6 = [v5 objectForKeyedSubscript:@"MovieSummaryResults"];

  if (![v6 count]) {
    goto LABEL_6;
  }
  os_signpost_id_t v7 = [v6 objectAtIndexedSubscript:0];
  uint64_t v8 = [v7 objectForKeyedSubscript:@"attributes"];

  if (![v8 count]
    || ([MEMORY[0x1E4F16368] assetImageGeneratorWithAsset:v4],
        os_signpost_id_t v9 = objc_claimAutoreleasedReturnValue(),
        (float v10 = v9) == 0))
  {
    if (!self->_errorCode) {
      self->_errorCode = 45;
    }
    goto LABEL_12;
  }
  [v9 setAppliesPreferredTrackTransform:1];
  objc_msgSend(v10, "setMaximumSize:", (double)580, (double)580);
  float v11 = (long long *)MEMORY[0x1E4F1FA48];
  long long v23 = *MEMORY[0x1E4F1FA48];
  uint64_t v24 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  [v10 setRequestedTimeToleranceAfter:&v23];
  long long v21 = *v11;
  uint64_t v22 = *((void *)v11 + 2);
  [v10 setRequestedTimeToleranceBefore:&v21];
  memset(&v20, 0, sizeof(v20));
  id v12 = [v6 objectAtIndexedSubscript:0];
  CFDictionaryRef v13 = [v12 objectForKeyedSubscript:@"start"];
  CMTimeMakeFromDictionary(&v20, v13);

  CMTime v19 = v20;
  double v14 = (void *)[v10 copyCGImageAtTime:&v19 actualTime:0 error:0];
  if (!v14)
  {
    if (!self->_errorCode) {
      self->_errorCode = 45;
    }

LABEL_12:
    int v17 = -18;
    goto LABEL_13;
  }
  analysis = self->_analysis;
  unint64_t v16 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", v14, 0);
  [(NSMutableDictionary *)analysis vcp_appendResult:v16 forKey:@"KeyFrameResourceResults"];

LABEL_6:
  int v17 = 0;
LABEL_13:

  return v17;
}

- (BOOL)allowStreaming
{
  return self->_allowStreaming;
}

- (void)setAllowStreaming:(BOOL)a3
{
  self->_allowStreaming = a3;
}

- (BOOL)onDemand
{
  return self->_onDemand;
}

- (void)setOnDemand:(BOOL)a3
{
  self->_onDemand = a3;
}

- (float)maxHighlightDuration
{
  return self->_maxHighlightDuration;
}

- (void)setMaxHighlightDuration:(float)a3
{
  self->_maxHighlightDuration = a3;
}

- (BOOL)faceDominated
{
  return self->_faceDominated;
}

- (void)setFaceDominated:(BOOL)a3
{
  self->_faceDominated = a3;
}

- (float)maxAnalysisLength
{
  return self->_maxAnalysisLength;
}

- (void)setMaxAnalysisLength:(float)a3
{
  self->_float maxAnalysisLength = a3;
}

- (int64_t)status
{
  return self->_status;
}

- (unint64_t)errorCode
{
  return self->_errorCode;
}

- (unint64_t)errorLine
{
  return self->_errorLine;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_phAsset, 0);
  objc_storeStrong((id *)&self->_existingAnalysis, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_privateResults, 0);
  objc_storeStrong((id *)&self->_analysis, 0);
}

@end