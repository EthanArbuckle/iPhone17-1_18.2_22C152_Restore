@interface PHAssetExportRequest
+ (BOOL)errorIsLowDiskSpaceRelated:(id)a3;
+ (id)assetExportLog;
+ (id)exportRequestForAsset:(id)a3 error:(id *)a4;
+ (id)exportRequestForAsset:(id)a3 variants:(id)a4 error:(id *)a5;
+ (id)variantsForAsset:(id)a3 asUnmodifiedOriginal:(BOOL)a4 error:(id *)a5;
- (BOOL)assetMetadataRetrievalAttempted;
- (BOOL)reassembleAdjustmentsPropertyListIfNeeded:(id)a3 toOutputDirectory:(id)a4 outputURL:(id *)a5 error:(id *)a6;
- (BOOL)shouldSendTimingIntervalsToAnalytics;
- (NSDate)preparationStepSignpostIntervalStartTime;
- (NSDictionary)variants;
- (NSMutableDictionary)preparationStepTimingInfo;
- (NSProgress)progress;
- (NSString)analyticsActivityType;
- (NSString)description;
- (NSString)exportUUID;
- (PFMetadata)assetMetadata;
- (PHAsset)asset;
- (PHAssetExportRequest)init;
- (PHAssetExportRequest)initWithAsset:(id)a3 variants:(id)a4;
- (PHAssetExportRequestDelegate)delegate;
- (id)_generateAnalyticsPayloadWithTimingInfo:(id)a3 preparationOptions:(id)a4;
- (id)copyFileURLsIfNeeded:(id)a3 toOutputDirectory:(id)a4 options:(id)a5 originalFilenameBase:(id)a6 error:(id *)a7;
- (id)finalizeTotalPreparationDurationTimingInfoDictionary;
- (id)outputDirectory;
- (int64_t)prepareItemEventCPAnalyticsSignpostId;
- (unint64_t)signpostId;
- (unint64_t)state;
- (void)bundleResourcesIfNeededForAsset:(id)a3 withFileURLs:(id)a4 options:(id)a5 completion:(id)a6;
- (void)commitTimingInfoForPreparationStep:(id)a3 fromStartTime:(id)a4;
- (void)exportWithOptions:(id)a3 completionHandler:(id)a4;
- (void)handleResultWithFileURLs:(id)a3 cancelled:(BOOL)a4 withError:(id)a5 forAsset:(id)a6 withOptions:(id)a7 progress:(id)a8 processingUnitCount:(int64_t)a9 completionHandler:(id)a10;
- (void)performCompletionWithFileURLs:(id)a3 preparationOptions:(id)a4 error:(id)a5 completionHandler:(id)a6;
- (void)preflightExportWithOptions:(id)a3 assetAvailability:(int64_t *)a4 isProcessingRequired:(BOOL *)a5 fileURLs:(id *)a6 info:(id *)a7;
- (void)processResourcesAtFileURLs:(id)a3 forAsset:(id)a4 withOptions:(id)a5 progress:(id)a6 processingUnitCount:(int64_t)a7 completion:(id)a8;
- (void)resetPreparationStepTimingInfos;
- (void)sendPreparationCompletedEventWithPreparationTimingInfo:(id)a3 forActivityType:(id)a4 preparationOptions:(id)a5 withError:(id)a6 didCancel:(BOOL)a7;
- (void)setAnalyticsActivityType:(id)a3;
- (void)setAssetMetadataRetrievalAttempted:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setPreparationStepSignpostIntervalStartTime:(id)a3;
- (void)setPreparationStepTimingInfo:(id)a3;
- (void)setPrepareItemEventCPAnalyticsSignpostId:(int64_t)a3;
- (void)setShouldSendTimingIntervalsToAnalytics:(BOOL)a3;
- (void)setState:(unint64_t)a3;
- (void)updateSignpostIntervalsChangingFromState:(unint64_t)a3 toState:(unint64_t)a4;
@end

@implementation PHAssetExportRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preparationStepSignpostIntervalStartTime, 0);
  objc_storeStrong((id *)&self->_preparationStepTimingInfo, 0);
  objc_storeStrong((id *)&self->_exportUUID, 0);
  objc_storeStrong((id *)&self->_analyticsActivityType, 0);
  objc_storeStrong((id *)&self->_variants, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_assetMetadata, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_resourceProcessingQueue, 0);

  objc_storeStrong((id *)&self->_outputDirectory, 0);
}

- (void)setPrepareItemEventCPAnalyticsSignpostId:(int64_t)a3
{
  self->_prepareItemEventCPAnalyticsSignpostId = a3;
}

- (int64_t)prepareItemEventCPAnalyticsSignpostId
{
  return self->_prepareItemEventCPAnalyticsSignpostId;
}

- (void)setPreparationStepSignpostIntervalStartTime:(id)a3
{
}

- (NSDate)preparationStepSignpostIntervalStartTime
{
  return self->_preparationStepSignpostIntervalStartTime;
}

- (void)setPreparationStepTimingInfo:(id)a3
{
}

- (NSMutableDictionary)preparationStepTimingInfo
{
  return self->_preparationStepTimingInfo;
}

- (unint64_t)signpostId
{
  return self->_signpostId;
}

- (NSString)exportUUID
{
  return self->_exportUUID;
}

- (void)setAssetMetadataRetrievalAttempted:(BOOL)a3
{
  self->_assetMetadataRetrievalAttempted = a3;
}

- (BOOL)assetMetadataRetrievalAttempted
{
  return self->_assetMetadataRetrievalAttempted;
}

- (void)setAnalyticsActivityType:(id)a3
{
}

- (NSString)analyticsActivityType
{
  return self->_analyticsActivityType;
}

- (void)setShouldSendTimingIntervalsToAnalytics:(BOOL)a3
{
  self->_shouldSendTimingIntervalsToAnalytics = a3;
}

- (BOOL)shouldSendTimingIntervalsToAnalytics
{
  return self->_shouldSendTimingIntervalsToAnalytics;
}

- (NSDictionary)variants
{
  return self->_variants;
}

- (void)setDelegate:(id)a3
{
}

- (PHAssetExportRequestDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PHAssetExportRequestDelegate *)WeakRetained;
}

- (unint64_t)state
{
  return self->_state;
}

- (NSProgress)progress
{
  return self->_progress;
}

- (PHAsset)asset
{
  return self->_asset;
}

- (id)_generateAnalyticsPayloadWithTimingInfo:(id)a3 preparationOptions:(id)a4
{
  v38[6] = *MEMORY[0x1E4F143B8];
  id v31 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 treatLivePhotoAsStill];
  uint64_t v8 = [v6 shouldStripLocation];
  uint64_t v9 = [v6 shouldStripCaption];
  uint64_t v10 = [v6 shouldStripAccessibilityDescription];
  uint64_t v11 = [v6 includeAllAssetResources];
  v12 = (void *)MEMORY[0x1E4F1CA60];
  v37[0] = *MEMORY[0x1E4F56560];
  v13 = (objc_class *)objc_opt_class();
  v14 = NSStringFromClass(v13);
  v38[0] = v14;
  v37[1] = @"excludeLiveness";
  v15 = [NSNumber numberWithBool:v7];
  v38[1] = v15;
  v37[2] = @"excludeLocation";
  v16 = [NSNumber numberWithBool:v8];
  v38[2] = v16;
  v37[3] = @"excludeCaption";
  v17 = [NSNumber numberWithBool:v9];
  v38[3] = v17;
  v37[4] = @"excludeAccessibilityDescription";
  v18 = [NSNumber numberWithBool:v10];
  v38[4] = v18;
  v37[5] = @"sendAsOriginals";
  v19 = [NSNumber numberWithBool:v11];
  v38[5] = v19;
  v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:6];
  v21 = [v12 dictionaryWithDictionary:v20];

  v22 = [(PHAssetExportRequest *)self asset];
  [v21 setObject:v22 forKeyedSubscript:*MEMORY[0x1E4F56558]];

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v23 = v31;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v33 != v26) {
          objc_enumerationMutation(v23);
        }
        uint64_t v28 = *(void *)(*((void *)&v32 + 1) + 8 * i);
        v29 = objc_msgSend(v23, "objectForKeyedSubscript:", v28, v31);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v21 setObject:v29 forKeyedSubscript:v28];
        }
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v25);
  }

  return v21;
}

- (void)sendPreparationCompletedEventWithPreparationTimingInfo:(id)a3 forActivityType:(id)a4 preparationOptions:(id)a5 withError:(id)a6 didCancel:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a6;
  v14 = [(PHAssetExportRequest *)self _generateAnalyticsPayloadWithTimingInfo:a3 preparationOptions:a5];
  if ([v12 length]) {
    [v14 setObject:v12 forKeyedSubscript:@"activityType"];
  }
  if (v13)
  {
    [v14 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F56568]];
    v15 = @"Failed";
  }
  else if (v7)
  {
    v15 = @"Canceled";
  }
  else
  {
    v15 = @"Succeeded";
  }
  [v14 setObject:v15 forKeyedSubscript:@"preparationOutcome"];
  v16 = PLPhotoKitGetLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    int v19 = 138477827;
    v20 = v14;
    _os_log_impl(&dword_19B043000, v16, OS_LOG_TYPE_DEBUG, "[PHAssetExportRequest] CPAnalytics item preparation payload: %{private}@", (uint8_t *)&v19, 0xCu);
  }

  v17 = (void *)MEMORY[0x1E4F56658];
  int64_t v18 = [(PHAssetExportRequest *)self prepareItemEventCPAnalyticsSignpostId];
  [v17 endSignpost:v18 forEventName:*MEMORY[0x1E4F563F8] withPayload:v14];
  [(PHAssetExportRequest *)self setPrepareItemEventCPAnalyticsSignpostId:0];
}

- (id)finalizeTotalPreparationDurationTimingInfoDictionary
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = [(PHAssetExportRequest *)self preparationStepTimingInfo];
  v3 = (void *)[v2 mutableCopy];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    double v8 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = objc_msgSend(v4, "objectForKeyedSubscript:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15);
        [v10 doubleValue];
        double v8 = v8 + v11;
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }
  else
  {
    double v8 = 0.0;
  }

  id v12 = [NSNumber numberWithDouble:v8];
  [v4 setObject:v12 forKeyedSubscript:@"time_total"];

  id v13 = (void *)[v4 copy];

  return v13;
}

- (void)resetPreparationStepTimingInfos
{
  v7[6] = *MEMORY[0x1E4F143B8];
  v6[0] = @"time_assetExportPreflight";
  v6[1] = @"time_retrievingFromDisk";
  v7[0] = &unk_1EEB26E50;
  v7[1] = &unk_1EEB26E50;
  v6[2] = @"time_downloading";
  v6[3] = @"time_generatingDeferredResources";
  v7[2] = &unk_1EEB26E50;
  v7[3] = &unk_1EEB26E50;
  v6[4] = @"time_additionalProcessing";
  v6[5] = @"time_bundling";
  v7[4] = &unk_1EEB26E50;
  v7[5] = &unk_1EEB26E50;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:6];
  id v4 = (NSMutableDictionary *)[v3 mutableCopy];
  preparationStepTimingInfo = self->_preparationStepTimingInfo;
  self->_preparationStepTimingInfo = v4;
}

- (void)commitTimingInfoForPreparationStep:(id)a3 fromStartTime:(id)a4
{
  id v21 = a3;
  id v6 = a4;
  if (v21)
  {
    if (v6) {
      goto LABEL_3;
    }
  }
  else
  {
    long long v17 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v18 = [NSString stringWithUTF8String:"-[PHAssetExportRequest commitTimingInfoForPreparationStep:fromStartTime:]"];
    [v17 handleFailureInFunction:v18, @"PHAssetExportRequest.m", 1680, @"Invalid parameter not satisfying: %@", @"preparationStep" file lineNumber description];

    if (v6) {
      goto LABEL_3;
    }
  }
  int v19 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v20 = [NSString stringWithUTF8String:"-[PHAssetExportRequest commitTimingInfoForPreparationStep:fromStartTime:]"];
  [v19 handleFailureInFunction:v20, @"PHAssetExportRequest.m", 1681, @"Invalid parameter not satisfying: %@", @"startTime" file lineNumber description];

LABEL_3:
  uint64_t v7 = [(PHAssetExportRequest *)self preparationStepTimingInfo];

  if (!v7) {
    [(PHAssetExportRequest *)self resetPreparationStepTimingInfos];
  }
  double v8 = [MEMORY[0x1E4F1C9C8] date];
  [v8 timeIntervalSinceDate:v6];
  double v10 = v9;

  double v11 = [(PHAssetExportRequest *)self preparationStepTimingInfo];
  id v12 = [v11 objectForKeyedSubscript:v21];

  if (v12)
  {
    [v12 doubleValue];
    if (v13 > 0.0)
    {
      [v12 doubleValue];
      double v10 = v10 + v14;
    }
  }
  long long v15 = [NSNumber numberWithDouble:v10];
  long long v16 = [(PHAssetExportRequest *)self preparationStepTimingInfo];
  [v16 setObject:v15 forKeyedSubscript:v21];
}

- (void)updateSignpostIntervalsChangingFromState:(unint64_t)a3 toState:(unint64_t)a4
{
  uint64_t v7 = [(id)objc_opt_class() assetExportLog];
  os_signpost_id_t v8 = [(PHAssetExportRequest *)self signpostId];
  int v9 = [MEMORY[0x1E4F56658] isAllowed];
  if ([(PHAssetExportRequest *)self shouldSendTimingIntervalsToAnalytics])
  {
    if (v9)
    {
      int64_t v10 = [(PHAssetExportRequest *)self prepareItemEventCPAnalyticsSignpostId];
      if (a4)
      {
        if (!v10) {
          -[PHAssetExportRequest setPrepareItemEventCPAnalyticsSignpostId:](self, "setPrepareItemEventCPAnalyticsSignpostId:", [MEMORY[0x1E4F56658] startSignpost]);
        }
      }
    }
  }
  switch(a3)
  {
    case 1uLL:
      double v11 = [(PHAssetExportRequest *)self preparationStepSignpostIntervalStartTime];
      [(PHAssetExportRequest *)self commitTimingInfoForPreparationStep:@"time_assetExportPreflight" fromStartTime:v11];

      id v12 = v7;
      if (v8 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_26;
      }
      double v13 = v12;
      if (!os_signpost_enabled(v12)) {
        goto LABEL_26;
      }
      *(_WORD *)v44 = 0;
      double v14 = "PerformingAssetExportPreflight";
      break;
    case 2uLL:
      long long v15 = [(PHAssetExportRequest *)self preparationStepSignpostIntervalStartTime];
      [(PHAssetExportRequest *)self commitTimingInfoForPreparationStep:@"time_retrievingFromDisk" fromStartTime:v15];

      long long v16 = v7;
      if (v8 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_26;
      }
      double v13 = v16;
      if (!os_signpost_enabled(v16)) {
        goto LABEL_26;
      }
      *(_WORD *)v44 = 0;
      double v14 = "RetrievingFromDisk";
      break;
    case 3uLL:
      long long v17 = [(PHAssetExportRequest *)self preparationStepSignpostIntervalStartTime];
      [(PHAssetExportRequest *)self commitTimingInfoForPreparationStep:@"time_downloading" fromStartTime:v17];

      long long v18 = v7;
      if (v8 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_26;
      }
      double v13 = v18;
      if (!os_signpost_enabled(v18)) {
        goto LABEL_26;
      }
      *(_WORD *)v44 = 0;
      double v14 = "Downloading";
      break;
    case 4uLL:
      int v19 = [(PHAssetExportRequest *)self preparationStepSignpostIntervalStartTime];
      [(PHAssetExportRequest *)self commitTimingInfoForPreparationStep:@"time_generatingDeferredResources" fromStartTime:v19];

      uint64_t v20 = v7;
      if (v8 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_26;
      }
      double v13 = v20;
      if (!os_signpost_enabled(v20)) {
        goto LABEL_26;
      }
      *(_WORD *)v44 = 0;
      double v14 = "GeneratingDeferredResources";
      break;
    case 5uLL:
      id v21 = [(PHAssetExportRequest *)self preparationStepSignpostIntervalStartTime];
      [(PHAssetExportRequest *)self commitTimingInfoForPreparationStep:@"time_additionalProcessing" fromStartTime:v21];

      v22 = v7;
      if (v8 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_26;
      }
      double v13 = v22;
      if (!os_signpost_enabled(v22)) {
        goto LABEL_26;
      }
      *(_WORD *)v44 = 0;
      double v14 = "AdditionalProcessing";
      break;
    case 6uLL:
      id v23 = [(PHAssetExportRequest *)self preparationStepSignpostIntervalStartTime];
      [(PHAssetExportRequest *)self commitTimingInfoForPreparationStep:@"time_bundling" fromStartTime:v23];

      uint64_t v24 = v7;
      if (v8 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_26;
      }
      double v13 = v24;
      if (!os_signpost_enabled(v24)) {
        goto LABEL_26;
      }
      *(_WORD *)v44 = 0;
      double v14 = "Bundling";
      break;
    default:
      goto LABEL_27;
  }
  _os_signpost_emit_with_name_impl(&dword_19B043000, v13, OS_SIGNPOST_INTERVAL_END, v8, v14, " enableTelemetry=YES ", v44, 2u);
LABEL_26:

LABEL_27:
  switch(a4)
  {
    case 0uLL:
      uint64_t v25 = v7;
      if (v8 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_51;
      }
      uint64_t v26 = v25;
      if (!os_signpost_enabled(v25)) {
        goto LABEL_51;
      }
      *(_WORD *)v44 = 0;
      v27 = "AssetExportInactive";
      uint64_t v28 = (const char *)&unk_19B30018E;
      v29 = v26;
      os_signpost_type_t v30 = OS_SIGNPOST_EVENT;
      goto LABEL_50;
    case 1uLL:
      id v31 = [MEMORY[0x1E4F1C9C8] date];
      [(PHAssetExportRequest *)self setPreparationStepSignpostIntervalStartTime:v31];

      long long v32 = v7;
      if (v8 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_51;
      }
      long long v33 = v32;
      if (!os_signpost_enabled(v32)) {
        goto LABEL_51;
      }
      *(_WORD *)v44 = 0;
      v27 = "PerformingAssetExportPreflight";
      uint64_t v28 = " enableTelemetry=YES ";
      break;
    case 2uLL:
      long long v34 = [MEMORY[0x1E4F1C9C8] date];
      [(PHAssetExportRequest *)self setPreparationStepSignpostIntervalStartTime:v34];

      long long v35 = v7;
      if (v8 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_51;
      }
      long long v33 = v35;
      if (!os_signpost_enabled(v35)) {
        goto LABEL_51;
      }
      *(_WORD *)v44 = 0;
      v27 = "RetrievingFromDisk";
      uint64_t v28 = " enableTelemetry=YES ";
      break;
    case 3uLL:
      v36 = [MEMORY[0x1E4F1C9C8] date];
      [(PHAssetExportRequest *)self setPreparationStepSignpostIntervalStartTime:v36];

      v37 = v7;
      if (v8 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_51;
      }
      long long v33 = v37;
      if (!os_signpost_enabled(v37)) {
        goto LABEL_51;
      }
      *(_WORD *)v44 = 0;
      v27 = "Downloading";
      uint64_t v28 = " enableTelemetry=YES ";
      break;
    case 4uLL:
      v38 = [MEMORY[0x1E4F1C9C8] date];
      [(PHAssetExportRequest *)self setPreparationStepSignpostIntervalStartTime:v38];

      v39 = v7;
      if (v8 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_51;
      }
      long long v33 = v39;
      if (!os_signpost_enabled(v39)) {
        goto LABEL_51;
      }
      *(_WORD *)v44 = 0;
      v27 = "GeneratingDeferredResources";
      uint64_t v28 = " enableTelemetry=YES ";
      break;
    case 5uLL:
      v40 = [MEMORY[0x1E4F1C9C8] date];
      [(PHAssetExportRequest *)self setPreparationStepSignpostIntervalStartTime:v40];

      v41 = v7;
      if (v8 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_51;
      }
      long long v33 = v41;
      if (!os_signpost_enabled(v41)) {
        goto LABEL_51;
      }
      *(_WORD *)v44 = 0;
      v27 = "AdditionalProcessing";
      uint64_t v28 = " enableTelemetry=YES ";
      break;
    case 6uLL:
      v42 = [MEMORY[0x1E4F1C9C8] date];
      [(PHAssetExportRequest *)self setPreparationStepSignpostIntervalStartTime:v42];

      v43 = v7;
      if (v8 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
        goto LABEL_51;
      }
      long long v33 = v43;
      if (!os_signpost_enabled(v43)) {
        goto LABEL_51;
      }
      *(_WORD *)v44 = 0;
      v27 = "Bundling";
      uint64_t v28 = " enableTelemetry=YES ";
      break;
    default:
      goto LABEL_52;
  }
  v29 = v33;
  os_signpost_type_t v30 = OS_SIGNPOST_INTERVAL_BEGIN;
LABEL_50:
  _os_signpost_emit_with_name_impl(&dword_19B043000, v29, v30, v8, v27, v28, v44, 2u);
LABEL_51:

LABEL_52:
}

- (void)exportWithOptions:(id)a3 completionHandler:(id)a4
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  [v8 handleFailureInMethod:a2, self, @"PHAssetExportRequest.m", 1580, @"Method %s is a responsibility of subclasses of %@", "-[PHAssetExportRequest exportWithOptions:completionHandler:]", v7 object file lineNumber description];
}

- (void)preflightExportWithOptions:(id)a3 assetAvailability:(int64_t *)a4 isProcessingRequired:(BOOL *)a5 fileURLs:(id *)a6 info:(id *)a7
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4, a5, a6, a7);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  int v9 = (objc_class *)objc_opt_class();
  int64_t v10 = NSStringFromClass(v9);
  [v11 handleFailureInMethod:a2, self, @"PHAssetExportRequest.m", 1575, @"Method %s is a responsibility of subclasses of %@", "-[PHAssetExportRequest preflightExportWithOptions:assetAvailability:isProcessingRequired:fileURLs:info:]", v10 object file lineNumber description];
}

- (void)performCompletionWithFileURLs:(id)a3 preparationOptions:(id)a4 error:(id)a5 completionHandler:(id)a6
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  unint64_t v11 = (unint64_t)a3;
  id v12 = a4;
  unint64_t v13 = (unint64_t)a5;
  double v14 = (void (**)(id, id, id))a6;
  if (!(v11 | v13))
  {
    long long v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:a2, self, @"PHAssetExportRequest.m", 1543, @"Invalid parameter not satisfying: %@", @"fileURLs || error" object file lineNumber description];
LABEL_23:

    goto LABEL_4;
  }
  if (v11 && ![(id)v11 count])
  {
    long long v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:a2, self, @"PHAssetExportRequest.m", 1544, @"Invalid parameter not satisfying: %@", @"!fileURLs || fileURLs.count" object file lineNumber description];
    goto LABEL_23;
  }
LABEL_4:
  [(PHAssetExportRequest *)self setState:0];
  long long v15 = [(PHAssetExportRequest *)self finalizeTotalPreparationDurationTimingInfoDictionary];
  long long v16 = PLPhotoKitGetLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    long long v17 = [(PHAssetExportRequest *)self asset];
    long long v18 = [v17 uuid];
    *(_DWORD *)buf = 138543618;
    long long v35 = v18;
    __int16 v36 = 2114;
    v37 = v15;
    _os_log_impl(&dword_19B043000, v16, OS_LOG_TYPE_DEFAULT, "[PHAssetExportRequest] Preparation timing for asset %{public}@: %{public}@", buf, 0x16u);
  }
  int v19 = [MEMORY[0x1E4F56658] isAllowed];
  if ([(PHAssetExportRequest *)self shouldSendTimingIntervalsToAnalytics] && v19)
  {
    uint64_t v20 = [(id)v13 code];
    BOOL v21 = v20 == 1;
    if (v20 == 1) {
      v22 = 0;
    }
    else {
      v22 = (void *)v13;
    }
    id v23 = v22;
    uint64_t v24 = [(PHAssetExportRequest *)self analyticsActivityType];
    [(PHAssetExportRequest *)self sendPreparationCompletedEventWithPreparationTimingInfo:v15 forActivityType:v24 preparationOptions:v12 withError:v23 didCancel:v21];
  }
  [(PHAssetExportRequest *)self setPreparationStepTimingInfo:0];
  v14[2](v14, (id)v11, (id)v13);
  uint64_t v25 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v26 = [(PHAssetExportRequest *)self outputDirectory];
  id v33 = 0;
  int v27 = [v25 removeItemAtURL:v26 error:&v33];
  id v28 = v33;
  v29 = v28;
  if (v27) {
    goto LABEL_15;
  }
  os_signpost_type_t v30 = [v28 domain];
  if ([v30 isEqualToString:*MEMORY[0x1E4F28798]])
  {

LABEL_15:
    goto LABEL_16;
  }
  uint64_t v31 = [v29 code];

  if (v31 == 2) {
    goto LABEL_17;
  }
  uint64_t v25 = PLPhotoKitGetLog();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    long long v35 = v29;
    _os_log_impl(&dword_19B043000, v25, OS_LOG_TYPE_ERROR, "[PHAssetExportRequest] Failed to remove output directory: %@", buf, 0xCu);
  }
LABEL_16:

LABEL_17:
}

- (id)copyFileURLsIfNeeded:(id)a3 toOutputDirectory:(id)a4 options:(id)a5 originalFilenameBase:(id)a6 error:(id *)a7
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v48 = 0;
  v49 = &v48;
  uint64_t v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__2418;
  v52 = __Block_byref_object_dispose__2419;
  id v53 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__2418;
  v46 = __Block_byref_object_dispose__2419;
  id v47 = 0;
  if ([v14 disableUpdatingFileCreationDatesOnExportedFileURLs]) {
    goto LABEL_2;
  }
  if (![v14 shouldExportUnmodifiedOriginalResources])
  {
    if ([v14 disableMetadataCorrections])
    {
LABEL_2:
      long long v16 = 0;
      goto LABEL_14;
    }
    v22 = [(PHAssetExportRequest *)self asset];
    uint64_t v23 = [v22 creationDate];
LABEL_10:
    long long v16 = (void *)v23;

    if (!v16) {
      goto LABEL_14;
    }
    goto LABEL_11;
  }
  long long v17 = [(PHAssetExportRequest *)self asset];
  long long v16 = [v17 originalCreationDateWithTimeZone:0];

  if (!v16)
  {
    long long v18 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      long long v34 = [(PHAssetExportRequest *)self asset];
      int v19 = [v34 uuid];
      uint64_t v20 = [(PHAssetExportRequest *)self asset];
      BOOL v21 = [v20 creationDate];
      *(_DWORD *)buf = 138543619;
      v55 = v19;
      __int16 v56 = 2113;
      *(void *)v57 = v21;
      _os_log_impl(&dword_19B043000, v18, OS_LOG_TYPE_ERROR, "[PHAssetExportRequest] Unable to retrieve original creation date for asset: %{public}@. Falling back to creation date: %{private}@", buf, 0x16u);
    }
    v22 = [(PHAssetExportRequest *)self asset];
    uint64_t v23 = [v22 creationDate];
    goto LABEL_10;
  }
LABEL_11:
  uint64_t v24 = PLPhotoKitGetLog();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = [v14 shouldExportUnmodifiedOriginalResources];
    uint64_t v26 = [(PHAssetExportRequest *)self asset];
    int v27 = [v26 uuid];
    *(_DWORD *)buf = 138478339;
    v55 = v16;
    __int16 v56 = 1024;
    *(_DWORD *)v57 = v25;
    *(_WORD *)&v57[4] = 2112;
    *(void *)&v57[6] = v27;
    _os_log_impl(&dword_19B043000, v24, OS_LOG_TYPE_DEFAULT, "[PHAssetExportRequest] Setting file creation date %{private}@ for exported files of asset (unmodified originals = %{BOOL}d): %@", buf, 0x1Cu);
  }
LABEL_14:
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __98__PHAssetExportRequest_copyFileURLsIfNeeded_toOutputDirectory_options_originalFilenameBase_error___block_invoke;
  v35[3] = &unk_1E5842278;
  id v28 = v15;
  id v36 = v28;
  id v29 = v14;
  id v37 = v29;
  id v30 = v13;
  id v38 = v30;
  id v31 = v16;
  id v39 = v31;
  v40 = &v48;
  v41 = &v42;
  [v12 enumerateKeysAndObjectsUsingBlock:v35];
  if (a7) {
    *a7 = (id) v43[5];
  }
  id v32 = (id)v49[5];

  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v48, 8);

  return v32;
}

void __98__PHAssetExportRequest_copyFileURLsIfNeeded_toOutputDirectory_options_originalFilenameBase_error___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = *(id *)(a1 + 32);
  if (([v7 isEqualToString:@"PHAssetExportRequestAdjustmentDataFileURLKey"] & 1) != 0
    || [*(id *)(a1 + 40) includeAllAssetResources])
  {
    int64_t v10 = [v8 lastPathComponent];
    uint64_t v11 = [v10 stringByDeletingPathExtension];

    id v9 = (id)v11;
  }
  id v12 = *(void **)(a1 + 48);
  id v19 = 0;
  id v13 = PHAssetExportRequestCopyFileURL(v8, v12, v9, &v19);
  id v14 = v19;
  id v15 = v19;
  uint64_t v16 = *(void *)(a1 + 56);
  if (v16) {
    [MEMORY[0x1E4F8B908] setFileCreationDate:v16 forFileURL:v13 error:0];
  }
  uint64_t v17 = *(void *)(*(void *)(a1 + 64) + 8);
  long long v18 = *(void **)(v17 + 40);
  if (v13)
  {
    [v18 setObject:v13 forKeyedSubscript:v7];
  }
  else
  {
    *(void *)(v17 + 40) = 0;

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), v14);
    *a4 = 1;
  }
}

- (void)bundleResourcesIfNeededForAsset:(id)a3 withFileURLs:(id)a4 options:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    id v31 = [MEMORY[0x1E4F28B00] currentHandler];
    id v32 = [NSString stringWithUTF8String:"-[PHAssetExportRequest bundleResourcesIfNeededForAsset:withFileURLs:options:completion:]"];
    [v31 handleFailureInFunction:v32, @"PHAssetExportRequest.m", 1417, @"Invalid parameter not satisfying: %@", @"asset" file lineNumber description];

    if (v11)
    {
LABEL_3:
      if (v12) {
        goto LABEL_4;
      }
LABEL_27:
      long long v35 = [MEMORY[0x1E4F28B00] currentHandler];
      id v36 = [NSString stringWithUTF8String:"-[PHAssetExportRequest bundleResourcesIfNeededForAsset:withFileURLs:options:completion:]"];
      [v35 handleFailureInFunction:v36, @"PHAssetExportRequest.m", 1419, @"Invalid parameter not satisfying: %@", @"options" file lineNumber description];

      if (v13) {
        goto LABEL_5;
      }
      goto LABEL_28;
    }
  }
  id v33 = [MEMORY[0x1E4F28B00] currentHandler];
  long long v34 = [NSString stringWithUTF8String:"-[PHAssetExportRequest bundleResourcesIfNeededForAsset:withFileURLs:options:completion:]"];
  [v33 handleFailureInFunction:v34, @"PHAssetExportRequest.m", 1418, @"Invalid parameter not satisfying: %@", @"fileURLs" file lineNumber description];

  if (!v12) {
    goto LABEL_27;
  }
LABEL_4:
  if (v13) {
    goto LABEL_5;
  }
LABEL_28:
  id v37 = [MEMORY[0x1E4F28B00] currentHandler];
  id v38 = [NSString stringWithUTF8String:"-[PHAssetExportRequest bundleResourcesIfNeededForAsset:withFileURLs:options:completion:]"];
  [v37 handleFailureInFunction:v38, @"PHAssetExportRequest.m", 1420, @"Invalid parameter not satisfying: %@", @"completion" file lineNumber description];

LABEL_5:
  if (![v12 shouldBundleComplexAssetResources]) {
    goto LABEL_23;
  }
  id v14 = PHAssetExportRequestFilenameForAsset(v10, v12);
  if (![v12 includeAllAssetResources])
  {
    if (PHAssetExportRequestCanCreateLivePhotoBundleForAssetWithOptions(v10, v11, v12))
    {
      long long v18 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B043000, v18, OS_LOG_TYPE_DEFAULT, "[PHAssetExportRequest] Creating live photo bundle from asset resources", buf, 2u);
      }

      uint64_t v16 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
      id v19 = [v11 objectForKeyedSubscript:@"PHAssetExportRequestPhotoFileURLKey"];

      if (v19)
      {
        uint64_t v20 = [v11 objectForKeyedSubscript:@"PHAssetExportRequestPhotoFileURLKey"];
        [(PHAssetBundleExportSession *)v16 addObject:v20];
      }
      BOOL v21 = [v11 objectForKeyedSubscript:@"PHAssetExportRequestVideoFileURLKey"];

      if (v21)
      {
        v22 = [v11 objectForKeyedSubscript:@"PHAssetExportRequestVideoFileURLKey"];
        [(PHAssetBundleExportSession *)v16 addObject:v22];
      }
      id v39 = [[PHLivePhotoExportSession alloc] initWithResourceFileURLs:v16];
      uint64_t v23 = [(PHAssetExportRequest *)self outputDirectory];
      uint64_t v24 = [v23 URLByAppendingPathComponent:v14];
      int v25 = [v24 URLByAppendingPathExtension:*MEMORY[0x1E4F8CED8]];

      uint64_t v26 = [MEMORY[0x1E4F28CB8] defaultManager];
      buf[0] = 0;
      int v27 = [v25 path];
      char v28 = [v26 fileExistsAtPath:v27 isDirectory:buf];

      if ((v28 & 1) != 0 || buf[0]) {
        [v26 removeItemAtURL:v25 error:0];
      }
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __88__PHAssetExportRequest_bundleResourcesIfNeededForAsset_withFileURLs_options_completion___block_invoke_442;
      v40[3] = &unk_1E5842250;
      id v41 = v25;
      id v42 = v13;
      id v29 = v25;
      id v30 = [(PHLivePhotoExportSession *)v39 writeToFileURL:v29 options:0 completionHandler:v40];

      goto LABEL_21;
    }

LABEL_23:
    (*((void (**)(id, void, void))v13 + 2))(v13, MEMORY[0x1E4F1CC08], 0);
    goto LABEL_24;
  }
  id v15 = PLPhotoKitGetLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B043000, v15, OS_LOG_TYPE_DEFAULT, "[PHAssetExportRequest] Creating asset bundle from asset resources", buf, 2u);
  }

  uint64_t v16 = [[PHAssetBundleExportSession alloc] initWithAsset:v10 withAssetExportRequestFileURLs:v11];
  [(PHAssetBundleExportSession *)v16 setCustomFilenameBase:v14];
  uint64_t v17 = [(PHAssetExportRequest *)self outputDirectory];
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __88__PHAssetExportRequest_bundleResourcesIfNeededForAsset_withFileURLs_options_completion___block_invoke;
  v43[3] = &unk_1E5842228;
  v43[4] = self;
  id v44 = v13;
  [(PHAssetBundleExportSession *)v16 writeToDirectoryURL:v17 completionHandler:v43];

LABEL_21:
LABEL_24:
}

void __88__PHAssetExportRequest_bundleResourcesIfNeededForAsset_withFileURLs_options_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = [*(id *)(a1 + 32) outputDirectory];
      *(_DWORD *)buf = 138412546;
      id v14 = v8;
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_impl(&dword_19B043000, v7, OS_LOG_TYPE_ERROR, "Unable to create asset bundle at directory '%@' due to following error '%@'", buf, 0x16u);
    }
  }
  uint64_t v9 = *(void *)(a1 + 40);
  if (v5)
  {
    id v11 = @"PHAssetExportRequestAssetBundleURLKey";
    id v12 = v5;
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    (*(void (**)(uint64_t, void *, id))(v9 + 16))(v9, v10, v6);
  }
  else
  {
    (*(void (**)(uint64_t, void, id))(v9 + 16))(v9, 0, v6);
  }
}

void __88__PHAssetExportRequest_bundleResourcesIfNeededForAsset_withFileURLs_options_completion___block_invoke_442(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 objectForKeyedSubscript:@"PHLivePhotoExportSessionInfoBundleURLKey"];
  id v5 = [v3 objectForKeyedSubscript:@"PHLivePhotoExportSessionInfoErrorKey"];

  if (v5)
  {
    id v6 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      uint64_t v13 = v7;
      __int16 v14 = 2112;
      __int16 v15 = v5;
      _os_log_impl(&dword_19B043000, v6, OS_LOG_TYPE_ERROR, "Unable to create live photo bundle at '%@' due to following error '%@'", buf, 0x16u);
    }
  }
  uint64_t v8 = *(void *)(a1 + 40);
  if (v4)
  {
    id v10 = @"PHAssetExportRequestLivePhotoBundleURLKey";
    id v11 = v4;
    uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
    (*(void (**)(uint64_t, void *, void *))(v8 + 16))(v8, v9, v5);
  }
  else
  {
    (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v5);
  }
}

- (BOOL)reassembleAdjustmentsPropertyListIfNeeded:(id)a3 toOutputDirectory:(id)a4 outputURL:(id *)a5 error:(id *)a6
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if (v9
    && [MEMORY[0x1E4F8CBB8] adjustmentsPropertyListFileRequiresOverflowDataReassemblyAtURL:v9 predictedSize:0])
  {
    id v11 = [v9 lastPathComponent];
    id v12 = [v10 URLByAppendingPathComponent:v11];
    id v22 = 0;
    int v13 = PHAssetExportRequestCreateOutputDirectory(v10, &v22);
    id v14 = v22;
    if (v13)
    {
      id v21 = v14;
      int v15 = [MEMORY[0x1E4F8CBB8] writeReassembleAdjustmentsPropertyListAtURL:v9 toURL:v12 error:&v21];
      id v16 = v21;

      if (!v15) {
        goto LABEL_13;
      }
      if (a5) {
        *a5 = v12;
      }
      if (a6)
      {
        id v14 = v16;
        *a6 = v14;
      }
      else
      {
LABEL_13:
        id v14 = v16;
      }
    }
    else
    {
      long long v18 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        id v19 = [v10 path];
        *(_DWORD *)buf = 138412546;
        uint64_t v24 = v19;
        __int16 v25 = 2112;
        id v26 = v14;
        _os_log_impl(&dword_19B043000, v18, OS_LOG_TYPE_ERROR, "[PHAssetExportRequest] Unable to create output directory %@: %@", buf, 0x16u);
      }
    }

    BOOL v17 = 1;
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (void)processResourcesAtFileURLs:(id)a3 forAsset:(id)a4 withOptions:(id)a5 progress:(id)a6 processingUnitCount:(int64_t)a7 completion:(id)a8
{
  id v59 = a3;
  id v13 = a4;
  id v14 = a5;
  id v55 = a6;
  id v47 = a8;
  group = dispatch_group_create();
  uint64_t v15 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v39 = [MEMORY[0x1E4F1CA80] set];
  char v41 = ([v13 isCloudSharedAsset] & 1) == 0 && objc_msgSend(v14, "variant") == 2;
  id v16 = [(PHAssetExportRequest *)self assetMetadata];
  v83[0] = 0;
  uint64_t v44 = PHAssetExportRequestLocationMetadataOperationForAssetWithOptions(v13, v14, v16, v83);
  id v52 = v83[0];
  id v82 = 0;
  uint64_t v43 = PHAssetExportRequestCaptionMetadataOperationForAssetWithOptions(v13, v14, v16, &v82);
  id v51 = v82;
  id v81 = 0;
  v40 = v16;
  uint64_t v42 = PHAssetExportRequestAccessibilityDescriptionMetadataOperationForAssetWithOptions(v13, v14, v16, &v81);
  id v17 = v81;
  id v80 = 0;
  v49 = PHAssetExportRequestCustomDateForAssetWithOptions(v13, v14, &v80);
  id v48 = v80;
  v45 = [v14 videoExportPreset];
  uint64_t v18 = [v59 objectForKeyedSubscript:@"PHAssetExportRequestPhotoFileURLKey"];
  id v19 = [v59 objectForKeyedSubscript:@"PHAssetExportRequestVideoFileURLKey"];
  v46 = [v59 objectForKeyedSubscript:@"PHAssetExportRequestAdjustmentDataFileURLKey"];
  uint64_t v20 = (void *)v18;
  if (v18) {
    BOOL v21 = v19 == 0;
  }
  else {
    BOOL v21 = 1;
  }
  int v22 = v21;
  id v53 = [(PHAssetExportRequest *)self outputDirectory];
  __int16 v56 = (void *)v15;
  v57 = 0;
  if ([v13 playbackStyle] == 3)
  {
    uint64_t v23 = (void *)v39;
    uint64_t v24 = v20;
    if (v22) {
      goto LABEL_15;
    }
    __int16 v25 = [MEMORY[0x1E4F29128] UUID];
    v57 = [v25 UUIDString];
  }
  else
  {
    uint64_t v23 = (void *)v39;
  }
  uint64_t v24 = v20;
LABEL_15:
  [v13 fetchPropertySetsIfNeeded];
  v54 = PHAssetExportRequestFilenameForAsset(v13, v14);
  if (a7 >= 0) {
    int64_t v26 = a7;
  }
  else {
    int64_t v26 = a7 + 1;
  }
  uint64_t v27 = v26 >> 1;
  if (v22) {
    int64_t v28 = a7;
  }
  else {
    int64_t v28 = v27;
  }
  uint64_t v50 = v24;
  if (v24)
  {
    dispatch_group_enter(group);
    id v29 = [MEMORY[0x1E4F74900] imageSourceForFileURL:v24];
    v76[0] = MEMORY[0x1E4F143A8];
    v76[1] = 3221225472;
    v76[2] = __112__PHAssetExportRequest_processResourcesAtFileURLs_forAsset_withOptions_progress_processingUnitCount_completion___block_invoke;
    v76[3] = &unk_1E5842200;
    v76[4] = self;
    id v77 = v56;
    id v78 = v23;
    v79 = group;
    PHAssetExportRequestPerformMediaConversion(v29, 0, v41, v44, v52, v49, v48, v43, v51, v42, v17, 0, v55, v28, v53, v54, v57, v76);
  }
  id v30 = (void (**)(void, void))v47;
  id v31 = group;
  if (v19)
  {
    if (PHAssetExportRequestNeedsSloMoFlatteningForAssetWithOptions(v13, v14))
    {
      dispatch_group_enter(group);
      id v32 = [v14 videoExportPreset];
      id v33 = [v14 videoExportFileType];
      v72[0] = MEMORY[0x1E4F143A8];
      v72[1] = 3221225472;
      v72[2] = __112__PHAssetExportRequest_processResourcesAtFileURLs_forAsset_withOptions_progress_processingUnitCount_completion___block_invoke_3;
      v72[3] = &unk_1E5842200;
      v72[4] = self;
      id v73 = v56;
      id v74 = v23;
      v75 = group;
      id v30 = (void (**)(void, void))v47;
      PHAssetExportRequestPerformSlomoFlattening(v19, v46, v55, v28, v53, v54, v32, v33, v41, v44, v52, v43, v51, v42, v17, v72);

      id v31 = group;
      long long v34 = v73;
    }
    else
    {
      uint64_t v35 = [v14 variant];
      dispatch_group_enter(group);
      if (v35 != 3)
      {
        id v36 = [MEMORY[0x1E4F74900] videoSourceForFileURL:v19];
        v64[0] = MEMORY[0x1E4F143A8];
        v64[1] = 3221225472;
        v64[2] = __112__PHAssetExportRequest_processResourcesAtFileURLs_forAsset_withOptions_progress_processingUnitCount_completion___block_invoke_7;
        v64[3] = &unk_1E5842200;
        v64[4] = self;
        id v65 = v56;
        id v66 = v23;
        v67 = group;
        PHAssetExportRequestPerformMediaConversion(v36, 0, v41, v44, v52, v49, v48, v43, v51, v42, v17, v45, v55, v28, v53, v54, v57, v64);

        id v31 = group;
        goto LABEL_30;
      }
      v68[0] = MEMORY[0x1E4F143A8];
      v68[1] = 3221225472;
      v68[2] = __112__PHAssetExportRequest_processResourcesAtFileURLs_forAsset_withOptions_progress_processingUnitCount_completion___block_invoke_5;
      v68[3] = &unk_1E5842200;
      v68[4] = self;
      id v69 = v56;
      id v70 = v23;
      v71 = group;
      PHAssetExportRequestPerformGifConversion(v19, v55, v28, v53, v54, v68);

      long long v34 = v69;
    }

LABEL_30:
    uint64_t v24 = v50;
  }
  dispatch_group_wait(v31, 0xFFFFFFFFFFFFFFFFLL);
  if (v30)
  {
    serialQueue = self->_serialQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __112__PHAssetExportRequest_processResourcesAtFileURLs_forAsset_withOptions_progress_processingUnitCount_completion___block_invoke_9;
    block[3] = &unk_1E5848DF0;
    id v62 = v59;
    id v63 = v56;
    dispatch_sync(serialQueue, block);
    id v38 = [v23 anyObject];
    ((void (**)(void, void *))v30)[2](v30, v38);

    uint64_t v24 = v50;
  }
}

void __112__PHAssetExportRequest_processResourcesAtFileURLs_forAsset_withOptions_progress_processingUnitCount_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __112__PHAssetExportRequest_processResourcesAtFileURLs_forAsset_withOptions_progress_processingUnitCount_completion___block_invoke_2;
  v10[3] = &unk_1E5847D90;
  id v11 = v5;
  id v12 = *(id *)(a1 + 40);
  id v13 = *(id *)(a1 + 48);
  id v14 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_sync(v7, v10);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __112__PHAssetExportRequest_processResourcesAtFileURLs_forAsset_withOptions_progress_processingUnitCount_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __112__PHAssetExportRequest_processResourcesAtFileURLs_forAsset_withOptions_progress_processingUnitCount_completion___block_invoke_4;
  v10[3] = &unk_1E5847D90;
  id v11 = v5;
  id v12 = *(id *)(a1 + 40);
  id v13 = *(id *)(a1 + 48);
  id v14 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_sync(v7, v10);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __112__PHAssetExportRequest_processResourcesAtFileURLs_forAsset_withOptions_progress_processingUnitCount_completion___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __112__PHAssetExportRequest_processResourcesAtFileURLs_forAsset_withOptions_progress_processingUnitCount_completion___block_invoke_6;
  v10[3] = &unk_1E5847D90;
  id v11 = v5;
  id v12 = *(id *)(a1 + 40);
  id v13 = *(id *)(a1 + 48);
  id v14 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_sync(v7, v10);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __112__PHAssetExportRequest_processResourcesAtFileURLs_forAsset_withOptions_progress_processingUnitCount_completion___block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __112__PHAssetExportRequest_processResourcesAtFileURLs_forAsset_withOptions_progress_processingUnitCount_completion___block_invoke_8;
  v10[3] = &unk_1E5847D90;
  id v11 = v5;
  id v12 = *(id *)(a1 + 40);
  id v13 = *(id *)(a1 + 48);
  id v14 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_sync(v7, v10);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

uint64_t __112__PHAssetExportRequest_processResourcesAtFileURLs_forAsset_withOptions_progress_processingUnitCount_completion___block_invoke_9(uint64_t a1)
{
  return [*(id *)(a1 + 32) addEntriesFromDictionary:*(void *)(a1 + 40)];
}

uint64_t __112__PHAssetExportRequest_processResourcesAtFileURLs_forAsset_withOptions_progress_processingUnitCount_completion___block_invoke_8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    return [*(id *)(a1 + 40) setObject:v1 forKeyedSubscript:@"PHAssetExportRequestVideoFileURLKey"];
  }
  else {
    return [*(id *)(a1 + 48) addObject:*(void *)(a1 + 56)];
  }
}

uint64_t __112__PHAssetExportRequest_processResourcesAtFileURLs_forAsset_withOptions_progress_processingUnitCount_completion___block_invoke_6(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    return [*(id *)(a1 + 40) setObject:v1 forKeyedSubscript:@"PHAssetExportRequestVideoFileURLKey"];
  }
  else {
    return [*(id *)(a1 + 48) addObject:*(void *)(a1 + 56)];
  }
}

void __112__PHAssetExportRequest_processResourcesAtFileURLs_forAsset_withOptions_progress_processingUnitCount_completion___block_invoke_4(void *a1)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if (a1[4])
  {
    uint64_t v1 = (void *)a1[5];
    objc_msgSend(v1, "setObject:forKeyedSubscript:");
  }
  else
  {
    v2 = (void *)a1[6];
    if (a1[7])
    {
      id v3 = (void *)a1[6];
      objc_msgSend(v3, "addObject:");
    }
    else
    {
      id v4 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v5 = *MEMORY[0x1E4F8D278];
      uint64_t v9 = *MEMORY[0x1E4F28568];
      v10[0] = @"Failed to flatten slomo video.";
      id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
      uint64_t v7 = [v4 errorWithDomain:v5 code:0 userInfo:v6];
      id v8 = PHAssetExportRequestError(0, v7);
      [v2 addObject:v8];
    }
  }
}

uint64_t __112__PHAssetExportRequest_processResourcesAtFileURLs_forAsset_withOptions_progress_processingUnitCount_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1) {
    return [*(id *)(a1 + 40) setObject:v1 forKeyedSubscript:@"PHAssetExportRequestPhotoFileURLKey"];
  }
  else {
    return [*(id *)(a1 + 48) addObject:*(void *)(a1 + 56)];
  }
}

- (void)handleResultWithFileURLs:(id)a3 cancelled:(BOOL)a4 withError:(id)a5 forAsset:(id)a6 withOptions:(id)a7 progress:(id)a8 processingUnitCount:(int64_t)a9 completionHandler:(id)a10
{
  BOOL v14 = a4;
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a10;
  if (v14)
  {
    int v22 = PHAssetExportRequestError(1, v17);

    uint64_t v23 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v60 = v18;
      __int16 v61 = 2112;
      id v62 = v22;
      _os_log_impl(&dword_19B043000, v23, OS_LOG_TYPE_DEFAULT, "[PHAssetExportRequest] Cancelled download asset for export: %@, error: %@", buf, 0x16u);
    }

    uint64_t v24 = [v19 resultHandlerQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __137__PHAssetExportRequest_handleResultWithFileURLs_cancelled_withError_forAsset_withOptions_progress_processingUnitCount_completionHandler___block_invoke;
    block[3] = &unk_1E5848948;
    void block[4] = self;
    id v56 = v19;
    id v57 = v22;
    id v58 = v21;
    id v25 = v22;
    dispatch_async(v24, block);

    int64_t v26 = v56;
    goto LABEL_25;
  }
  if (!v16 || v17)
  {
    if (v17) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (![v16 count])
  {
LABEL_12:
    PHAssetExportRequestError(0, 0);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:
    id v29 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v60 = v18;
      __int16 v61 = 2112;
      id v62 = v17;
      _os_log_impl(&dword_19B043000, v29, OS_LOG_TYPE_ERROR, "[PHAssetExportRequest] Failed to download asset for export: %@, error: %@", buf, 0x16u);
    }

    id v30 = [v17 domain];
    int v31 = [v30 isEqualToString:*MEMORY[0x1E4F59778]];

    if (v31)
    {
      if ([v17 code] != 81 && objc_msgSend(v17, "code") != 80 && objc_msgSend(v17, "code") != 82)
      {
        if ([v17 code] == 1005)
        {
          uint64_t v32 = 3;
        }
        else
        {
          if ([v17 code] != 1006) {
            goto LABEL_24;
          }
          uint64_t v32 = 4;
        }
        goto LABEL_23;
      }
    }
    else
    {
      id v33 = [v17 domain];
      int v34 = [v33 isEqualToString:*MEMORY[0x1E4F289A0]];

      if ((v34 & 1) == 0)
      {
        id v37 = [v17 domain];
        char v38 = [v37 isEqualToString:@"PHAssetExportRequestErrorDomain"];

        if (v38) {
          goto LABEL_24;
        }
        uint64_t v39 = [(PHAssetExportRequest *)self asset];
        v40 = [v39 photoLibrary];
        if ([v40 wellKnownPhotoLibraryIdentifier] == 3)
        {

          uint64_t v32 = 5;
        }
        else
        {
          char v41 = [(PHAssetExportRequest *)self asset];
          int v42 = [v41 isGuestAsset];

          if (v42) {
            uint64_t v32 = 5;
          }
          else {
            uint64_t v32 = 0;
          }
        }
LABEL_23:
        uint64_t v35 = PHAssetExportRequestError(v32, v17);

        id v17 = (id)v35;
LABEL_24:
        id v36 = [v19 resultHandlerQueue];
        v51[0] = MEMORY[0x1E4F143A8];
        v51[1] = 3221225472;
        v51[2] = __137__PHAssetExportRequest_handleResultWithFileURLs_cancelled_withError_forAsset_withOptions_progress_processingUnitCount_completionHandler___block_invoke_418;
        v51[3] = &unk_1E5848948;
        v51[4] = self;
        id v52 = v19;
        id v53 = v17;
        id v54 = v21;
        id v25 = v17;
        dispatch_async(v36, v51);

        int64_t v26 = v52;
LABEL_25:

        goto LABEL_26;
      }
    }
    uint64_t v32 = 2;
    goto LABEL_23;
  }
  uint64_t v27 = PLPhotoKitGetLog();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    id v60 = v18;
    __int16 v61 = 2112;
    id v62 = v16;
    _os_log_impl(&dword_19B043000, v27, OS_LOG_TYPE_DEBUG, "[PHAssetExportRequest] Did download asset for export: %@, urls: %@", buf, 0x16u);
  }

  [(PHAssetExportRequest *)self setState:2];
  resourceProcessingQueue = self->_resourceProcessingQueue;
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __137__PHAssetExportRequest_handleResultWithFileURLs_cancelled_withError_forAsset_withOptions_progress_processingUnitCount_completionHandler___block_invoke_419;
  v43[3] = &unk_1E5843370;
  id v44 = v16;
  id v45 = v18;
  id v46 = v19;
  id v47 = self;
  id v48 = v20;
  int64_t v50 = a9;
  id v49 = v21;
  dispatch_async(resourceProcessingQueue, v43);

  id v25 = v44;
LABEL_26:
}

uint64_t __137__PHAssetExportRequest_handleResultWithFileURLs_cancelled_withError_forAsset_withOptions_progress_processingUnitCount_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) performCompletionWithFileURLs:0 preparationOptions:*(void *)(a1 + 40) error:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
}

uint64_t __137__PHAssetExportRequest_handleResultWithFileURLs_cancelled_withError_forAsset_withOptions_progress_processingUnitCount_completionHandler___block_invoke_418(uint64_t a1)
{
  return [*(id *)(a1 + 32) performCompletionWithFileURLs:0 preparationOptions:*(void *)(a1 + 40) error:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
}

void __137__PHAssetExportRequest_handleResultWithFileURLs_cancelled_withError_forAsset_withOptions_progress_processingUnitCount_completionHandler___block_invoke_419(uint64_t a1)
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  uint64_t v74 = 0;
  v75 = &v74;
  uint64_t v76 = 0x3032000000;
  id v77 = __Block_byref_object_copy__2418;
  id v78 = __Block_byref_object_dispose__2419;
  id v79 = (id)[*(id *)(a1 + 32) mutableCopy];
  uint64_t v68 = 0;
  id v69 = (id *)&v68;
  uint64_t v70 = 0x3032000000;
  v71 = __Block_byref_object_copy__2418;
  v72 = __Block_byref_object_dispose__2419;
  id v73 = 0;
  [*(id *)(a1 + 40) fetchPropertySetsIfNeeded];
  v2 = PHAssetExportRequestFilenameForAsset(*(void **)(a1 + 40), *(void **)(a1 + 48));
  id v3 = [*(id *)(a1 + 56) outputDirectory];
  id v67 = 0;
  char v4 = PHAssetExportRequestCreateOutputDirectory(v3, &v67);
  id v5 = v67;
  id v6 = v67;
  if ((v4 & 1) == 0)
  {
    uint64_t v7 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = [v3 path];
      *(_DWORD *)buf = 138412546;
      id v81 = v8;
      __int16 v82 = 2112;
      id v83 = v6;
      _os_log_impl(&dword_19B043000, v7, OS_LOG_TYPE_ERROR, "[PHAssetExportRequest] Unable to create output directory %@: %@", buf, 0x16u);
    }
    objc_storeStrong(v69 + 5, v5);
  }
  if (!v69[5])
  {
    uint64_t v9 = [(id)v75[5] objectForKeyedSubscript:@"PHAssetExportRequestAdjustmentDataFileURLKey"];
    BOOL v10 = v9 == 0;

    if (!v10)
    {
      id v11 = *(void **)(a1 + 56);
      id v12 = [(id)v75[5] objectForKeyedSubscript:@"PHAssetExportRequestAdjustmentDataFileURLKey"];
      id v65 = 0;
      id v66 = 0;
      [v11 reassembleAdjustmentsPropertyListIfNeeded:v12 toOutputDirectory:v3 outputURL:&v66 error:&v65];
      id v13 = v66;
      id v14 = v65;

      if (v13)
      {
        [(id)v75[5] setObject:v13 forKeyedSubscript:@"PHAssetExportRequestAdjustmentDataFileURLKey"];
      }
      else if (v14)
      {
        uint64_t v15 = PLPhotoKitGetLog();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v81 = v14;
          _os_log_impl(&dword_19B043000, v15, OS_LOG_TYPE_ERROR, "[PHAssetExportRequest] Error trying to reassemble adjustments plist and data blob: %@", buf, 0xCu);
        }

        uint64_t v16 = PHAssetExportRequestError(0, v14);
        id v17 = v69[5];
        v69[5] = (id)v16;
      }
    }
  }
  id v18 = *(void **)(a1 + 40);
  id v19 = *(void **)(a1 + 48);
  id v20 = [*(id *)(a1 + 56) assetMetadata];
  int v21 = PHAssetExportRequestProcessingRequiredForAssetWithOptions(v18, v19, v20);

  id v22 = v69[5];
  if (v22) {
    int v23 = 0;
  }
  else {
    int v23 = v21;
  }
  if (v23 == 1)
  {
    [*(id *)(a1 + 56) setState:5];
    uint64_t v24 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B043000, v24, OS_LOG_TYPE_DEFAULT, "[PHAssetExportRequest] Processing retrieved file urls for compatibility and/or metadata corrections", buf, 2u);
    }

    id v49 = v3;
    id v25 = v6;
    int64_t v26 = v2;
    dispatch_semaphore_t v27 = dispatch_semaphore_create(0);
    uint64_t v28 = v75[5];
    uint64_t v29 = *(void *)(a1 + 40);
    uint64_t v30 = *(void *)(a1 + 48);
    int v31 = *(void **)(a1 + 56);
    uint64_t v32 = *(void *)(a1 + 64);
    uint64_t v33 = *(void *)(a1 + 80);
    v62[0] = MEMORY[0x1E4F143A8];
    v62[1] = 3221225472;
    v62[2] = __137__PHAssetExportRequest_handleResultWithFileURLs_cancelled_withError_forAsset_withOptions_progress_processingUnitCount_completionHandler___block_invoke_420;
    v62[3] = &unk_1E5843B58;
    v64 = &v68;
    v62[4] = v31;
    int v34 = v27;
    uint64_t v63 = v34;
    [v31 processResourcesAtFileURLs:v28 forAsset:v29 withOptions:v30 progress:v32 processingUnitCount:v33 completion:v62];
    dispatch_semaphore_wait(v34, 0xFFFFFFFFFFFFFFFFLL);

    v2 = v26;
    id v6 = v25;
    id v3 = v49;

    id v22 = v69[5];
  }
  if (!v22)
  {
    [*(id *)(a1 + 56) setState:2];
    if (!v69[5])
    {
      if ([*(id *)(a1 + 48) shouldBundleComplexAssetResources])
      {
        dispatch_semaphore_t v35 = dispatch_semaphore_create(0);
        uint64_t v37 = *(void *)(a1 + 48);
        id v36 = *(void **)(a1 + 56);
        uint64_t v38 = v75[5];
        uint64_t v39 = *(void *)(a1 + 40);
        v58[0] = MEMORY[0x1E4F143A8];
        v58[1] = 3221225472;
        v58[2] = __137__PHAssetExportRequest_handleResultWithFileURLs_cancelled_withError_forAsset_withOptions_progress_processingUnitCount_completionHandler___block_invoke_422;
        v58[3] = &unk_1E58421B0;
        id v60 = &v74;
        __int16 v61 = &v68;
        v40 = v35;
        id v59 = v40;
        [v36 bundleResourcesIfNeededForAsset:v39 withFileURLs:v38 options:v37 completion:v58];
        dispatch_semaphore_wait(v40, 0xFFFFFFFFFFFFFFFFLL);
      }
    }
  }
  char v41 = v69 + 5;
  if (v69[5])
  {
    int v42 = 0;
  }
  else
  {
    uint64_t v43 = v75[5];
    uint64_t v45 = *(void *)(a1 + 48);
    id v44 = *(void **)(a1 + 56);
    id obj = 0;
    int v42 = (void *)[v44 copyFileURLsIfNeeded:v43 toOutputDirectory:v3 options:v45 originalFilenameBase:v2 error:&obj];
    objc_storeStrong(v41, obj);
  }
  id v46 = objc_msgSend(*(id *)(a1 + 48), "resultHandlerQueue", v49);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __137__PHAssetExportRequest_handleResultWithFileURLs_cancelled_withError_forAsset_withOptions_progress_processingUnitCount_completionHandler___block_invoke_2;
  block[3] = &unk_1E58421D8;
  id v56 = &v68;
  id v52 = v42;
  id v53 = *(id *)(a1 + 40);
  int8x16_t v50 = *(int8x16_t *)(a1 + 48);
  id v47 = (id)v50.i64[0];
  int8x16_t v54 = vextq_s8(v50, v50, 8uLL);
  id v55 = *(id *)(a1 + 72);
  id v48 = v42;
  dispatch_async(v46, block);

  _Block_object_dispose(&v68, 8);
  _Block_object_dispose(&v74, 8);
}

void __137__PHAssetExportRequest_handleResultWithFileURLs_cancelled_withError_forAsset_withOptions_progress_processingUnitCount_completionHandler___block_invoke_420(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  char v4 = v3;
  if (v3)
  {
    id v5 = [v3 domain];
    if ([v5 isEqualToString:*MEMORY[0x1E4F74A58]])
    {
      uint64_t v6 = [v4 code];

      if (v6 == 3) {
        goto LABEL_12;
      }
    }
    else
    {
    }
    uint64_t v7 = [v4 domain];
    if ([v7 isEqualToString:*MEMORY[0x1E4F8CED0]])
    {
      uint64_t v8 = [v4 code];

      if (v8 == 3) {
        goto LABEL_12;
      }
    }
    else
    {
    }
    uint64_t v9 = [v4 domain];
    if ([v9 isEqualToString:*MEMORY[0x1E4F8D278]])
    {
      uint64_t v10 = [v4 code];

      if (v10 == 1)
      {
LABEL_12:
        id v11 = PLPhotoKitGetLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v19) = 0;
          _os_log_impl(&dword_19B043000, v11, OS_LOG_TYPE_DEFAULT, "[PHAssetExportRequest] Cancelled while processing resources", (uint8_t *)&v19, 2u);
        }

        uint64_t v12 = 1;
LABEL_23:
        uint64_t v16 = PHAssetExportRequestError(v12, v4);
        uint64_t v17 = *(void *)(*(void *)(a1 + 48) + 8);
        id v18 = *(void **)(v17 + 40);
        *(void *)(v17 + 40) = v16;

        goto LABEL_24;
      }
    }
    else
    {
    }
    int v13 = [(id)objc_opt_class() errorIsLowDiskSpaceRelated:v4];
    id v14 = PLPhotoKitGetLog();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (v13)
    {
      if (v15)
      {
        int v19 = 138412290;
        id v20 = v4;
        _os_log_impl(&dword_19B043000, v14, OS_LOG_TYPE_ERROR, "[PHAssetExportRequest] Low disk space error while processing resources: %@", (uint8_t *)&v19, 0xCu);
      }

      uint64_t v12 = 3;
    }
    else
    {
      if (v15)
      {
        int v19 = 138412290;
        id v20 = v4;
        _os_log_impl(&dword_19B043000, v14, OS_LOG_TYPE_ERROR, "[PHAssetExportRequest] Error while processing resources: %@", (uint8_t *)&v19, 0xCu);
      }

      uint64_t v12 = 0;
    }
    goto LABEL_23;
  }
LABEL_24:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __137__PHAssetExportRequest_handleResultWithFileURLs_cancelled_withError_forAsset_withOptions_progress_processingUnitCount_completionHandler___block_invoke_422(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addEntriesFromDictionary:a2];
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
  id v8 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __137__PHAssetExportRequest_handleResultWithFileURLs_cancelled_withError_forAsset_withOptions_progress_processingUnitCount_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40))
  {
    v2 = *(void **)(a1 + 48);
    uint64_t v3 = *(void *)(a1 + 56);
    objc_msgSend(v2, "performCompletionWithFileURLs:preparationOptions:error:completionHandler:", 0, v3);
  }
  else
  {
    char v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v5 = objc_msgSend(*(id *)(a1 + 32), "allValues", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v27 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = [*(id *)(*((void *)&v17 + 1) + 8 * i) pathExtension];
          id v11 = (void *)v10;
          if (v10) {
            uint64_t v12 = (__CFString *)v10;
          }
          else {
            uint64_t v12 = &stru_1EEAC1950;
          }
          [v4 addObject:v12];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v27 count:16];
      }
      while (v7);
    }

    int v13 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = [*(id *)(a1 + 40) uuid];
      uint64_t v15 = *(void *)(a1 + 32);
      uint64_t v16 = [v4 componentsJoinedByString:@","];
      *(_DWORD *)buf = 138543874;
      id v22 = v14;
      __int16 v23 = 2112;
      uint64_t v24 = v15;
      __int16 v25 = 2114;
      int64_t v26 = v16;
      _os_log_impl(&dword_19B043000, v13, OS_LOG_TYPE_DEFAULT, "[PHAssetExportRequest] Did retrieve asset %{public}@ for export with urls: %@ (extensions: %{public}@)", buf, 0x20u);
    }
    [*(id *)(a1 + 48) performCompletionWithFileURLs:*(void *)(a1 + 32) preparationOptions:*(void *)(a1 + 56) error:0 completionHandler:*(void *)(a1 + 64)];
  }
}

- (PFMetadata)assetMetadata
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!self->_assetMetadata
    && ![(PHAssetExportRequest *)self assetMetadataRetrievalAttempted])
  {
    uint64_t v3 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      char v4 = [(PHAssetExportRequest *)self asset];
      id v5 = [v4 uuid];
      int v14 = 138543362;
      uint64_t v15 = v5;
      _os_log_impl(&dword_19B043000, v3, OS_LOG_TYPE_DEFAULT, "[PHAssetExportRequest] Retrieving metadata for asset %{public}@", (uint8_t *)&v14, 0xCu);
    }
    uint64_t v6 = [(PHAssetExportRequest *)self asset];
    PHAssetOriginalMetadataOfAsset(v6);
    uint64_t v7 = (PFMetadata *)objc_claimAutoreleasedReturnValue();
    assetMetadata = self->_assetMetadata;
    self->_assetMetadata = v7;

    [(PHAssetExportRequest *)self setAssetMetadataRetrievalAttempted:1];
    if (!self->_assetMetadata)
    {
      uint64_t v9 = PLPhotoKitGetLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        uint64_t v10 = [(PHAssetExportRequest *)self asset];
        id v11 = [v10 uuid];
        int v14 = 138543362;
        uint64_t v15 = v11;
        _os_log_impl(&dword_19B043000, v9, OS_LOG_TYPE_ERROR, "[PHAssetExportRequest] Metadata retrieved was nil for asset %{public}@", (uint8_t *)&v14, 0xCu);
      }
    }
  }
  uint64_t v12 = self->_assetMetadata;

  return v12;
}

- (id)outputDirectory
{
  outputDirectory = self->_outputDirectory;
  if (!outputDirectory)
  {
    char v4 = NSTemporaryDirectory();
    id v5 = [v4 stringByAppendingPathComponent:@"com.apple.mobileslideshow.export-request"];

    uint64_t v6 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v7 = [v6 UUIDString];
    uint64_t v8 = [v5 stringByAppendingPathComponent:v7];

    uint64_t v9 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v8];
    uint64_t v10 = self->_outputDirectory;
    self->_outputDirectory = v9;

    outputDirectory = self->_outputDirectory;
  }

  return outputDirectory;
}

- (NSString)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unint64_t state = self->_state;
  if (state > 6) {
    uint64_t v6 = @"unknown";
  }
  else {
    uint64_t v6 = off_1E58422D0[state];
  }
  return (NSString *)[v3 stringWithFormat:@"<%@: %p, asset: %@, state: %@, progress: %@, variants: %@>", v4, self, self->_asset, v6, self->_progress, self->_variants];
}

- (void)setState:(unint64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (self->_state != a3)
  {
    id v5 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t state = self->_state;
      if (state > 6) {
        uint64_t v7 = @"unknown";
      }
      else {
        uint64_t v7 = off_1E58422D0[state];
      }
      if (a3 > 6) {
        uint64_t v8 = @"unknown";
      }
      else {
        uint64_t v8 = off_1E58422D0[a3];
      }
      int v13 = 138543618;
      int v14 = v7;
      __int16 v15 = 2114;
      uint64_t v16 = v8;
      _os_log_impl(&dword_19B043000, v5, OS_LOG_TYPE_DEFAULT, "[PHAssetExportRequest] Changing state from \"%{public}@\" to \"%{public}@\"", (uint8_t *)&v13, 0x16u);
    }

    unint64_t v9 = self->_state;
    self->_unint64_t state = a3;
    [(PHAssetExportRequest *)self updateSignpostIntervalsChangingFromState:v9 toState:a3];
    uint64_t v10 = [(PHAssetExportRequest *)self delegate];
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      uint64_t v12 = [(PHAssetExportRequest *)self delegate];
      [v12 assetExportRequest:self didChangeToState:a3 fromState:v9];
    }
  }
}

- (PHAssetExportRequest)initWithAsset:(id)a3 variants:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    int64_t v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"PHAssetExportRequest.m", 282, @"Invalid parameter not satisfying: %@", @"asset" object file lineNumber description];
  }
  if (![v9 count])
  {
    dispatch_semaphore_t v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"PHAssetExportRequest.m", 283, @"Invalid parameter not satisfying: %@", @"variants.count" object file lineNumber description];
  }
  v28.receiver = self;
  v28.super_class = (Class)PHAssetExportRequest;
  uint64_t v10 = [(PHAssetExportRequest *)&v28 init];
  char v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_asset, a3);
    uint64_t v12 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:0];
    progress = v11->_progress;
    v11->_progress = (NSProgress *)v12;

    int v14 = [MEMORY[0x1E4F29128] UUID];
    __int16 v15 = [v14 UUIDString];
    uint64_t v16 = [v15 copy];
    exportUUID = v11->_exportUUID;
    v11->_exportUUID = (NSString *)v16;

    v11->_unint64_t state = 0;
    objc_storeStrong((id *)&v11->_variants, a4);
    long long v18 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v19 = dispatch_queue_create("PHAssetExportRequest.ResourceProcessingQueue", v18);
    resourceProcessingQueue = v11->_resourceProcessingQueue;
    v11->_resourceProcessingQueue = (OS_dispatch_queue *)v19;

    uint64_t v21 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v22 = dispatch_queue_create("PHAssetExportRequest.SerialQueue", v21);
    serialQueue = v11->_serialQueue;
    v11->_serialQueue = (OS_dispatch_queue *)v22;

    uint64_t v24 = [(id)objc_opt_class() assetExportLog];
    v11->_signpostId = os_signpost_id_make_with_pointer(v24, v11->_exportUUID);

    v11->_prepareItemEventCPAnalyticsSignpostId = 0;
  }

  return v11;
}

- (PHAssetExportRequest)init
{
  uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PHAssetExportRequest.m", 277, @"%s is not available as initializer", "-[PHAssetExportRequest init]");

  abort();
}

+ (id)assetExportLog
{
  if (assetExportLog_onceToken != -1) {
    dispatch_once(&assetExportLog_onceToken, &__block_literal_global_457);
  }
  v2 = (void *)assetExportLog_assetExportLog;

  return v2;
}

void __38__PHAssetExportRequest_assetExportLog__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.photos", "PHAssetExportRequest");
  uint64_t v1 = (void *)assetExportLog_assetExportLog;
  assetExportLog_assetExportLog = (uint64_t)v0;
}

+ (BOOL)errorIsLowDiskSpaceRelated:(id)a3
{
  id v4 = a3;
  id v5 = [v4 domain];
  if ([v5 isEqualToString:*MEMORY[0x1E4F28798]])
  {
    uint64_t v6 = [v4 code];

    if (v6 == 28)
    {
      char v7 = 1;
      goto LABEL_11;
    }
  }
  else
  {
  }
  id v8 = [v4 userInfo];
  uint64_t v9 = *MEMORY[0x1E4F28A50];
  uint64_t v10 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

  if (v10)
  {
    char v11 = [v4 userInfo];
    uint64_t v12 = [v11 objectForKeyedSubscript:v9];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char v7 = [a1 errorIsLowDiskSpaceRelated:v12];
    }
    else {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }
LABEL_11:

  return v7;
}

+ (id)exportRequestForAsset:(id)a3 variants:(id)a4 error:(id *)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if (!v9)
  {
    long long v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, a1, @"PHAssetExportRequest.m", 329, @"Invalid parameter not satisfying: %@", @"asset" object file lineNumber description];
  }
  if (([v9 isCloudSharedAsset] & 1) != 0 || objc_msgSend(v9, "isStreamedVideo"))
  {
    char v11 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = [v9 uuid];
      *(_DWORD *)buf = 138543362;
      long long v20 = v12;
      _os_log_impl(&dword_19B043000, v11, OS_LOG_TYPE_DEFAULT, "[PHAssetExportRequest] Asset %{public}@ is a shared-album asset. Creating a cloud shared export request.", buf, 0xCu);
    }
    uint64_t v13 = +[PHCloudSharedAssetExportRequest exportRequestForAsset:v9 error:a5];
  }
  else
  {
    int v14 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v15 = [v9 uuid];
      *(_DWORD *)buf = 138543362;
      long long v20 = v15;
      _os_log_impl(&dword_19B043000, v14, OS_LOG_TYPE_DEFAULT, "[PHAssetExportRequest] Asset %{public}@ is a regular, non-shared-album asset. Creating an internal asset export request.", buf, 0xCu);
    }
    uint64_t v13 = +[PHInternalAssetExportRequest exportRequestForAsset:v9 variants:v10 error:a5];
  }
  uint64_t v16 = (void *)v13;

  return v16;
}

+ (id)exportRequestForAsset:(id)a3 error:(id *)a4
{
  return (id)[a1 exportRequestForAsset:a3 variants:0 error:a4];
}

+ (id)variantsForAsset:(id)a3 asUnmodifiedOriginal:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  id v8 = off_1E5840358;
  if (([v7 isCloudSharedAsset] & 1) == 0 && !objc_msgSend(v7, "isStreamedVideo")) {
    id v8 = off_1E5840608;
  }
  id v9 = [(__objc2_class *)*v8 variantsForAsset:v7 asUnmodifiedOriginal:v6 error:a5];

  return v9;
}

@end