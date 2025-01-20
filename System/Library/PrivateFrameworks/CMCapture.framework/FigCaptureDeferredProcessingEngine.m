@interface FigCaptureDeferredProcessingEngine
+ (id)sharedProcessingEngine;
+ (void)initialize;
- (BOOL)lastJobReusedGraph;
- (BWDeferredProcessingContainer)currentContainer;
- (BWStillImageSettings)_stillImageSettingsForContainer:(BWStillImageSettings *)result;
- (FigCaptureDeferredProcessingEngine)init;
- (FigCaptureDeferredProcessingJob)currentJob;
- (uint64_t)_reportCoreAnalyticsDataWithError:(void *)a3 job:;
- (uint64_t)_transientContainerForSettings:(void *)a3 processingSettings:(void *)a4 sourceAttributes:(void *)a5 videoFormat:(void *)a6 depthDataFormat:(uint64_t)a7 photoIdentifier:(void *)a8 applicationIdentifier:;
- (uint64_t)expectsGainMapForSettings:(void *)a3 captureSettings:;
- (void)_cleanupFromJob;
- (void)_ensureGraphForJob:(void *)a3 applicationID:;
- (void)_ensureGraphForProcessingContainer:(unsigned int)a3 sensorRawPixelFormat:(unint64_t)a4 sensorRawDimensions:(unint64_t)a5 ultraHighResSensorRawDimensions:(uint64_t)a6 depthDataDimensions:(uint64_t)a7 photoIdentifier:(void *)a8 applicationID:;
- (void)_handleJobCompletion:(void *)a1;
- (void)_handleProcessedStillImage:(uint64_t)a3 error:(void *)a4 settings:;
- (void)_releaseGraph;
- (void)_runJob;
- (void)_shouldReuseGraphForContainer:(uint64_t)a1;
- (void)dealloc;
- (void)ensureGraphForSettings:(id)a3 processingSettings:(id)a4 applicationID:(id)a5;
- (void)executeJob:(id)a3;
- (void)graph:(id)a3 didFinishStartingWithError:(int)a4;
- (void)immediateTermination;
- (void)releasePrewarmingResources;
- (void)releaseResourcesForClientPID:(int)a3;
@end

@implementation FigCaptureDeferredProcessingEngine

FigCaptureDeferredProcessingEngine *__60__FigCaptureDeferredProcessingEngine_sharedProcessingEngine__block_invoke()
{
  result = objc_alloc_init(FigCaptureDeferredProcessingEngine);
  sharedProcessingEngine_sEngine = (uint64_t)result;
  return result;
}

- (FigCaptureDeferredProcessingEngine)init
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)FigCaptureDeferredProcessingEngine;
  v2 = [(FigCaptureDeferredProcessingEngine *)&v18 init];
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v2->_workQueue = (OS_dispatch_queue *)FigDispatchQueueCreateWithPriority();
    v3 = (void *)MEMORY[0x1A6272C70]();
    v4 = [+[FigCaptureCameraParameters sharedInstance] cameraTuningParameters];
    v5 = (void *)[MEMORY[0x1E4F1CA80] set];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v6 = [(NSDictionary *)v4 allKeys];
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if ([v11 hasPrefix:@"PortType"]) {
            objc_msgSend(v5, "addObjectsFromArray:", objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", v11), "allKeys"));
          }
        }
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
      }
      while (v8);
    }
    v2->_allSensorIDStrings = (NSSet *)[v5 copy];
    uint64_t v12 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", @"DefaultSensorIDs"), "copy");
    v2->_memoryPool = 0;
    v2->_flushAssertion = 0;
    v2->_defaultSensorIDsByPortType = (NSDictionary *)v12;
  }
  return v2;
}

void __94__FigCaptureDeferredProcessingEngine_ensureGraphForSettings_processingSettings_applicationID___block_invoke(uint64_t a1)
{
  v72[16] = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) currentJob])
  {
    if (!dword_1EB4C4F30)
    {
LABEL_59:
      v32 = 0;
      goto LABEL_42;
    }
    LODWORD(v61[0]) = 0;
    type[0] = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
LABEL_58:
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    goto LABEL_59;
  }
  v2 = *(void **)(a1 + 48);
  int v3 = [v2 deferredSourceDeviceType];
  uint64_t v4 = [v2 deferredVideoFormatUniqueID];
  v5 = (void *)[v2 deferredDepthDataFormatUniqueID];
  v6 = objc_msgSend(+[FigCaptureSourceBackings sharedCaptureSourceBackings](FigCaptureSourceBackings, "sharedCaptureSourceBackings"), "sourceInfoDictionaries");
  *(void *)type = MEMORY[0x1E4F143A8];
  uint64_t v65 = 3221225472;
  v66 = __fcdpe_resolveFormatsAndUpdateSettings_block_invoke;
  v67 = &__block_descriptor_36_e29_B32__0__NSDictionary_8Q16_B24l;
  int v68 = v3;
  uint64_t v7 = [v6 indexOfObjectPassingTest:type];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_52;
  }
  uint64_t v8 = (void *)[v6 objectAtIndexedSubscript:v7];
  uint64_t v9 = (void *)[v8 objectForKeyedSubscript:0x1EFA53CC0];
  v10 = (void *)[v8 objectForKeyedSubscript:@"Formats"];
  v72[0] = MEMORY[0x1E4F143A8];
  v72[1] = 3221225472;
  v72[2] = __fcdpe_resolveFormatsAndUpdateSettings_block_invoke_2;
  v72[3] = &unk_1E5C26360;
  v72[4] = v4;
  uint64_t v11 = [v10 indexOfObjectPassingTest:v72];
  if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_52;
  }
  uint64_t v12 = (void *)[v10 objectAtIndexedSubscript:v11];
  v13 = v12;
  if (v5)
  {
    long long v14 = (void *)[v12 supportedDepthDataFormats];
    *(void *)v69 = MEMORY[0x1E4F143A8];
    *(void *)&v69[8] = 3221225472;
    *(void *)&v69[16] = __fcdpe_resolveFormatsAndUpdateSettings_block_invoke_3;
    v70 = &unk_1E5C26388;
    v71[0] = v5;
    uint64_t v15 = [v14 indexOfObjectPassingTest:v69];
    if (v15 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_52;
    }
    v5 = (void *)[v14 objectAtIndexedSubscript:v15];
    if (!v5) {
      goto LABEL_52;
    }
  }
  if (![v2 deferredPhotoProxyWidth]
    && ![v2 deferredPhotoProxyHeight])
  {
    unsigned int v16 = [v2 outputWidth];
    uint64_t v17 = [v2 outputHeight];
    if (v16 | v17)
    {
      unint64_t v19 = v17;
    }
    else
    {
      unint64_t v18 = [v13 dimensions];
      unsigned int v16 = v18;
      unint64_t v19 = HIDWORD(v18);
    }
    uint64_t v20 = (void *)[v13 highResStillImageDimensions];
    v61[0] = MEMORY[0x1E4F143A8];
    v61[1] = 3221225472;
    v61[2] = __fcdpe_resolveFormatsAndUpdateSettings_block_invoke_4;
    v61[3] = &__block_descriptor_40_e49_B32__0__FigCaptureSourceFormatDimensions_8Q16_B24l;
    unsigned int v62 = v16;
    int v63 = v19;
    uint64_t v21 = [v20 indexOfObjectPassingTest:v61];
    if (v21 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v22 = v21;
      objc_msgSend(v2, "setResolutionFlavor:", +[FigCaptureSourceFormatDimensions identifyResolutionFlavorFromDimensions:availableHighResStillImageDimensions:](FigCaptureSourceFormatDimensions, "identifyResolutionFlavorFromDimensions:availableHighResStillImageDimensions:", v16 | (v19 << 32), v20));
      v23 = (void *)[v20 objectAtIndexedSubscript:v22];
      unint64_t v24 = [v23 deferredPhotoProxyDimensions];
      unint64_t v25 = HIDWORD(v24);
      [v2 setDeferredPhotoProxyWidth:v24];
      [v2 setDeferredPhotoProxyHeight:v25];
      unint64_t v26 = [v23 dimensions];
      [v2 setDeferredPhotoFinalWidth:v26];
      [v2 setDeferredPhotoFinalHeight:HIDWORD(v26)];
      [v2 setOutputWidth:v26];
      [v2 setOutputHeight:HIDWORD(v26)];
      goto LABEL_14;
    }
LABEL_52:
    FigDebugAssert3();
    *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = -12780;
LABEL_53:
    FigDebugAssert3();
    LODWORD(v61[0]) = 0;
    type[0] = OS_LOG_TYPE_DEFAULT;
    v57 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v58 = v61[0];
    if (os_log_type_enabled(v57, type[0])) {
      unsigned int v59 = v58;
    }
    else {
      unsigned int v59 = v58 & 0xFFFFFFFE;
    }
    if (!v59) {
      goto LABEL_58;
    }
LABEL_57:
    uint64_t v60 = *(void *)(a1 + 48);
    *(_DWORD *)v69 = 136315394;
    *(void *)&v69[4] = "-[FigCaptureDeferredProcessingEngine ensureGraphForSettings:processingSettings:applicationID:]_block_invoke";
    *(_WORD *)&v69[12] = 2114;
    *(void *)&v69[14] = v60;
    _os_log_send_and_compose_impl();
    goto LABEL_58;
  }
LABEL_14:
  id v27 = v9;
  id v28 = v13;
  id v29 = v5;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
  if (!v28) {
    goto LABEL_53;
  }
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    FigDebugAssert3();
    LODWORD(v61[0]) = 0;
    type[0] = OS_LOG_TYPE_DEFAULT;
    v54 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v55 = v61[0];
    if (os_log_type_enabled(v54, type[0])) {
      unsigned int v56 = v55;
    }
    else {
      unsigned int v56 = v55 & 0xFFFFFFFE;
    }
    if (!v56) {
      goto LABEL_58;
    }
    goto LABEL_57;
  }
  v30 = v29;
  uint64_t v31 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29128], "UUID"), "UUIDString");
  v32 = (void *)-[FigCaptureDeferredProcessingEngine _transientContainerForSettings:processingSettings:sourceAttributes:videoFormat:depthDataFormat:photoIdentifier:applicationIdentifier:](*(void *)(a1 + 32), *(void **)(a1 + 48), *(void **)(a1 + 56), v27, v28, v30, v31, *(void **)(a1 + 40));
  uint64_t v33 = *(void *)(a1 + 32);
  if (!*(void *)(v33 + 48)) {
    goto LABEL_31;
  }
  if (!-[FigCaptureDeferredProcessingEngine _shouldReuseGraphForContainer:](v33, v32))
  {
    uint64_t v40 = *(void *)(a1 + 32);
    if (*(void *)(v40 + 48))
    {
      if (dword_1EB4C4F30)
      {
        LODWORD(v61[0]) = 0;
        type[0] = OS_LOG_TYPE_DEFAULT;
        v41 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        unsigned int v42 = v61[0];
        if (os_log_type_enabled(v41, type[0])) {
          unsigned int v43 = v42;
        }
        else {
          unsigned int v43 = v42 & 0xFFFFFFFE;
        }
        if (v43)
        {
          uint64_t v44 = *(void *)(a1 + 40);
          v45 = *(void **)(a1 + 48);
          uint64_t v46 = *(void *)(a1 + 56);
          *(_DWORD *)v69 = 136315906;
          *(void *)&v69[4] = "-[FigCaptureDeferredProcessingEngine ensureGraphForSettings:processingSettings:applicatio"
                               "nID:]_block_invoke";
          *(_WORD *)&v69[12] = 2112;
          *(void *)&v69[14] = v44;
          *(_WORD *)&v69[22] = 2112;
          v70 = v45;
          LOWORD(v71[0]) = 2112;
          *(void *)((char *)v71 + 2) = v46;
          _os_log_send_and_compose_impl();
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        uint64_t v40 = *(void *)(a1 + 32);
      }
      -[FigCaptureDeferredProcessingEngine _releaseGraph](v40);
LABEL_41:

      *(void *)(*(void *)(a1 + 32) + 80) = v32;
      -[FigCaptureDeferredProcessingEngine _ensureGraphForProcessingContainer:sensorRawPixelFormat:sensorRawDimensions:ultraHighResSensorRawDimensions:depthDataDimensions:photoIdentifier:applicationID:](*(void *)(a1 + 32), v32, [*(id *)(a1 + 56) sensorRawPixelFormat], objc_msgSend(*(id *)(a1 + 56), "sensorRawDimensions"), objc_msgSend(*(id *)(a1 + 56), "ultraHighResSensorRawDimensions"), objc_msgSend(v30, "soleHighResStillImageDimensions"), v31, *(void **)(a1 + 40));
      goto LABEL_42;
    }
LABEL_31:
    if (dword_1EB4C4F30)
    {
      LODWORD(v61[0]) = 0;
      type[0] = OS_LOG_TYPE_DEFAULT;
      v47 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v48 = v61[0];
      if (os_log_type_enabled(v47, type[0])) {
        unsigned int v49 = v48;
      }
      else {
        unsigned int v49 = v48 & 0xFFFFFFFE;
      }
      if (v49)
      {
        uint64_t v50 = *(void *)(a1 + 40);
        v51 = *(void **)(a1 + 48);
        uint64_t v52 = *(void *)(a1 + 56);
        *(_DWORD *)v69 = 136315906;
        *(void *)&v69[4] = "-[FigCaptureDeferredProcessingEngine ensureGraphForSettings:processingSettings:applicationI"
                             "D:]_block_invoke";
        *(_WORD *)&v69[12] = 2112;
        *(void *)&v69[14] = v50;
        *(_WORD *)&v69[22] = 2112;
        v70 = v51;
        LOWORD(v71[0]) = 2112;
        *(void *)((char *)v71 + 2) = v52;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    goto LABEL_41;
  }
  if (dword_1EB4C4F30)
  {
    LODWORD(v61[0]) = 0;
    type[0] = OS_LOG_TYPE_DEFAULT;
    v34 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v35 = v61[0];
    if (os_log_type_enabled(v34, type[0])) {
      unsigned int v36 = v35;
    }
    else {
      unsigned int v36 = v35 & 0xFFFFFFFE;
    }
    if (v36)
    {
      uint64_t v37 = *(void *)(a1 + 40);
      v38 = *(void **)(a1 + 48);
      uint64_t v39 = *(void *)(a1 + 56);
      *(_DWORD *)v69 = 136315906;
      *(void *)&v69[4] = "-[FigCaptureDeferredProcessingEngine ensureGraphForSettings:processingSettings:applicationID:]_block_invoke";
      *(_WORD *)&v69[12] = 2112;
      *(void *)&v69[14] = v37;
      *(_WORD *)&v69[22] = 2112;
      v70 = v38;
      LOWORD(v71[0]) = 2112;
      *(void *)((char *)v71 + 2) = v39;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
LABEL_42:
}

- (FigCaptureDeferredProcessingJob)currentJob
{
  return self->_job;
}

- (uint64_t)_transientContainerForSettings:(void *)a3 processingSettings:(void *)a4 sourceAttributes:(void *)a5 videoFormat:(void *)a6 depthDataFormat:(uint64_t)a7 photoIdentifier:(void *)a8 applicationIdentifier:
{
  v95[1] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  v81 = +[FigCaptureCameraParameters sharedInstance];
  uint64_t v83 = [MEMORY[0x1E4F1CB10] fileURLWithPath:NSTemporaryDirectory()];
  int v12 = [a2 deferredSourceDeviceType];
  if ((v12 & 0xFFFFFFFD) == 4 || (v12 & 0xFFFFFFFE) == 8) {
    int v14 = 2;
  }
  else {
    int v14 = v12;
  }
  uint64_t v15 = BWCaptureDevicePositionAndDeviceTypeToPortType([a2 deferredSourcePosition], v14);
  id obj = (id)[a3 cameraInfoByPortType];
  unsigned int v16 = (void *)[obj objectForKeyedSubscript:v15];
  id v17 = +[FigCaptureCameraParameters sensorIDStringFromModuleInfo:](FigCaptureCameraParameters, "sensorIDStringFromModuleInfo:", [v16 objectForKeyedSubscript:*MEMORY[0x1E4F52D08]]);
  unint64_t v18 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  if ([a2 rawOutputFormat])
  {
    uint64_t v19 = 1;
    unsigned int v71 = 0x10000;
    uint64_t v20 = 384;
  }
  else
  {
    if ([a2 depthDataDeliveryEnabled]) {
      uint64_t v20 = 5253120;
    }
    else {
      uint64_t v20 = 5251072;
    }
    uint64_t v19 = 12;
    unsigned int v71 = 4096;
  }
  int v21 = [a2 resolutionFlavor];
  if (v21 == 2)
  {
    uint64_t v24 = 0x100000010;
    if ((v20 & 0x80) == 0) {
      uint64_t v24 = 0x100000000;
    }
    v20 |= v24;
    if (![v18 objectForKeyedSubscript:v15]) {
      objc_msgSend(v18, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary"), v15);
    }
    objc_msgSend((id)objc_msgSend(v18, "objectForKeyedSubscript:", v15), "setObject:forKeyedSubscript:", FigCaptureDictionaryRepresentationForDimensions(objc_msgSend(a3, "ultraHighResSensorRawDimensions")), &unk_1EFAFEE68);
    uint64_t v73 = 0;
    uint64_t v74 = 0x100000000;
  }
  else if (v21 == 1)
  {
    v20 |= 0x200000000uLL;
    HIDWORD(v73) = [(FigCaptureCameraParameters *)v81 deepZoomVersion];
    [a3 uiZoomFactor];
    if (v22 >= 1.4118
      && [(FigCaptureCameraParameters *)v81 deepZoomTransferWithZoomedImageEnabledForPortType:v15 sensorIDString:v17])
    {
      int v23 = 4;
    }
    else
    {
      int v23 = 3;
    }
    LODWORD(v73) = v23;
    uint64_t v74 = 0x100000001;
  }
  else
  {
    uint64_t v73 = 0;
    uint64_t v74 = 0;
  }
  if ([v18 count]) {
    id v75 = (id)[v18 copy];
  }
  else {
    id v75 = 0;
  }
  v79 = a3;
  if ([a3 sensorRawPixelFormat])
  {
    v20 |= 4uLL;
    int v25 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", 0x1EFA6B9A0), "BOOLValue");
    int v26 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", 0x1EFA6B9C0), "BOOLValue");
    int v27 = v25 | 2;
    if (!v26) {
      int v27 = v25;
    }
    unsigned int v76 = v27;
  }
  else
  {
    unsigned int v76 = 0;
  }
  id v28 = a4;
  id v29 = [BWStillImageCaptureStreamSettings alloc];
  v30 = -[BWStillImageCaptureStreamSettings initWithPortType:captureType:captureFlags:referenceFrameIndex:timeMachineBracketedCaptureParams:preBracketFrameCaptureParams:unifiedBracketedCaptureParams:frameInfos:](v29, "initWithPortType:captureType:captureFlags:referenceFrameIndex:timeMachineBracketedCaptureParams:preBracketFrameCaptureParams:unifiedBracketedCaptureParams:frameInfos:", v15, v19, v20, 1, MEMORY[0x1E4F1CBF0], MEMORY[0x1E4F1CBF0]);
  [(BWStillImageCaptureStreamSettings *)v30 setSensorIDString:v17];
  uint64_t v31 = objc_alloc_init(BWStillImageCaptureMetadata);
  -[BWStillImageCaptureMetadata setDeviceType:](v31, "setDeviceType:", [a2 deferredSourceDeviceType]);
  -[BWStillImageCaptureMetadata setDevicePosition:](v31, "setDevicePosition:", [a2 deferredSourcePosition]);
  uint64_t v32 = v19;
  uint64_t v33 = [BWStillImageCaptureSettings alloc];
  uint64_t v34 = [a2 settingsID];
  v95[0] = v30;
  LOBYTE(v69) = 0;
  unsigned int v35 = -[BWStillImageCaptureSettings initWithSettingsID:captureType:captureFlags:sceneFlags:frameStatisticsByPortType:deliverOriginalImage:deliverSushiRaw:captureStreamSettings:](v33, "initWithSettingsID:captureType:captureFlags:sceneFlags:frameStatisticsByPortType:deliverOriginalImage:deliverSushiRaw:captureStreamSettings:", v34, v32, v20, 0, 0, 0, v69, [MEMORY[0x1E4F1C978] arrayWithObjects:v95 count:1]);
  [(BWStillImageCaptureSettings *)v35 setMasterPortType:v15];
  [(BWStillImageCaptureSettings *)v35 setMetadata:v31];

  unsigned int v36 = objc_alloc_init(BWDeferredPipelineParameters);
  id v37 = +[FigCaptureSourceBackings sharedCaptureSourceBackings];
  -[BWDeferredPipelineParameters setRawSensorDimensions:](v36, "setRawSensorDimensions:", [a5 sensorDimensions]);
  [(BWDeferredPipelineParameters *)v36 setNrfVersion:[(FigCaptureCameraParameters *)v81 nrfVersion]];
  -[BWDeferredPipelineParameters setNoiseReductionAndFusionScheme:](v36, "setNoiseReductionAndFusionScheme:", objc_msgSend((id)objc_msgSend(v28, "objectForKeyedSubscript:", 0x1EFA6BA20), "intValue"));
  [(BWDeferredPipelineParameters *)v36 setIntelligentDistortionCorrectionEnabled:0];
  [(BWDeferredPipelineParameters *)v36 setDimensionsByQSubResolutionFlavorByPortType:v75];
  [(BWDeferredPipelineParameters *)v36 setGeometricDistortionCorrectionEnabled:0];
  [(BWDeferredPipelineParameters *)v36 setDistortionCorrectionVersion:0];
  [(BWDeferredPipelineParameters *)v36 setDeepZoomVersion:HIDWORD(v73)];
  [(BWDeferredPipelineParameters *)v36 setDeepZoomMode:v73];
  int v38 = [a5 semanticRenderingSupported];
  uint64_t v39 = 0;
  if (v38) {
    uint64_t v39 = objc_msgSend((id)objc_msgSend(v37, "commonSettings", 0), "semanticRenderingVersion");
  }
  [(BWDeferredPipelineParameters *)v36 setSemanticRenderingVersion:v39];
  [(BWDeferredPipelineParameters *)v36 setGenerateInferencesForSemanticProcessingIfNeeded:v74];
  [(BWDeferredPipelineParameters *)v36 setQuadraProcessingSupportEnabled:HIDWORD(v74)];
  [(BWDeferredPipelineParameters *)v36 setCanProcessEnhancedResolution:v74];
  [(BWDeferredPipelineParameters *)v36 setSfhrMode:v76];
  [a5 sensorCenterOffset];
  -[BWDeferredPipelineParameters setSensorCenterOffset:](v36, "setSensorCenterOffset:");
  if ([a2 depthDataDeliveryEnabled])
  {
    if ([(BWDeferredPipelineParameters *)v36 intelligentDistortionCorrectionEnabled]|| [(BWDeferredPipelineParameters *)v36 geometricDistortionCorrectionEnabled])
    {
      -[BWDeferredPipelineParameters setDcProcessingWithDepthSupported:](v36, "setDcProcessingWithDepthSupported:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v28, "objectForKeyedSubscript:", @"DepthDataDeliveryConfigurations"), "objectForKeyedSubscript:", @"DCProcessingSupported"), "BOOLValue"));
    }
    [a5 maxContinuousZoomFactorForDepthDataDelivery];
    [(BWDeferredPipelineParameters *)v36 setContinuousZoomWithDepthSupported:v40 != 0.0];
    -[BWDeferredPipelineParameters setDepthDataType:](v36, "setDepthDataType:", objc_msgSend((id)objc_msgSend(v28, "objectForKeyedSubscript:", @"StillImageDepthDataType"), "intValue"));
    -[BWDeferredPipelineParameters setDepthDataDimensions:](v36, "setDepthDataDimensions:", [a6 soleHighResStillImageDimensions]);
    -[BWDeferredPipelineParameters setPearlModuleType:](v36, "setPearlModuleType:", objc_msgSend((id)objc_msgSend(v28, "objectForKeyedSubscript:", @"PearlModuleType"), "intValue"));
  }
  v78 = v36;
  if ([a5 isSmartStyleRenderingSupported])
  {
    uint64_t v41 = objc_msgSend((id)objc_msgSend(v37, "commonSettings"), "smartStyleRenderingVersion");
    [(BWDeferredPipelineParameters *)v36 setSmartStyleRenderingVersion:v41];
    if (v41)
    {
      if ([a5 isPhotoFormat]) {
        uint64_t v42 = FigCaptureClientApplicationIDIsCameraOrDerivative(a8);
      }
      else {
        uint64_t v42 = 0;
      }
      uint64_t v43 = a7;
      uint64_t v44 = v71;
      [(BWDeferredPipelineParameters *)v36 setSmartStyleReversibilityEnabled:v42];
      [(BWDeferredPipelineParameters *)v36 setSmartStyleLinearThumbnailDimensions:0x30000000400];
      [(BWDeferredPipelineParameters *)v36 setSmartStyleStyledThumbnailDimensions:0xC000000100];
      goto LABEL_50;
    }
  }
  else
  {
    [(BWDeferredPipelineParameters *)v36 setSmartStyleRenderingVersion:0];
  }
  [(BWDeferredPipelineParameters *)v36 setSmartStyleReversibilityEnabled:0];
  uint64_t v43 = a7;
  uint64_t v44 = v71;
LABEL_50:
  v82 = a2;
  v77 = [[BWPhotoDescriptor alloc] initWithPhotoIdentifier:v43 processingFlags:v44];
  id v45 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v93[0] = *MEMORY[0x1E4F24E10];
  v94[0] = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(a5, "sensorDimensions"));
  v93[1] = *MEMORY[0x1E4F24D08];
  uint64_t v46 = objc_msgSend(NSNumber, "numberWithInt:", (unint64_t)objc_msgSend(a5, "sensorDimensions") >> 32);
  uint64_t v47 = *MEMORY[0x1E4F24D70];
  v94[1] = v46;
  v94[2] = &unk_1EFAFEE98;
  uint64_t v48 = *MEMORY[0x1E4F24C98];
  v93[2] = v47;
  v93[3] = v48;
  uint64_t v49 = *MEMORY[0x1E4F24D78];
  v94[3] = &unk_1EFAFEEB0;
  v94[4] = &unk_1EFAFEEC8;
  uint64_t v50 = *MEMORY[0x1E4F24D20];
  v93[4] = v49;
  v93[5] = v50;
  uint64_t v91 = *MEMORY[0x1E4F2F268];
  uint64_t v92 = MEMORY[0x1E4F1CC28];
  uint64_t v51 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v92 forKeys:&v91 count:1];
  uint64_t v52 = *MEMORY[0x1E4F24CB0];
  v94[5] = v51;
  v94[6] = &unk_1EFB03140;
  uint64_t v53 = *MEMORY[0x1E4F24D30];
  v93[6] = v52;
  v93[7] = v53;
  v94[7] = MEMORY[0x1E4F1CC38];
  uint64_t v54 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v94 forKeys:v93 count:8];
  unsigned int v55 = [BWDeferredDictionaryIntermediate alloc];
  unsigned int v56 = [(BWDeferredDictionaryIntermediate *)v55 initWithDictionary:v54 tag:BWDeferredIntermediateTagSourceNodePixelBufferAttributes URL:v83];
  [v45 addObject:v56];

  long long v87 = 0u;
  long long v88 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  uint64_t v57 = [obj countByEnumeratingWithState:&v85 objects:v90 count:16];
  if (v57)
  {
    uint64_t v58 = v57;
    uint64_t v59 = *(void *)v86;
    do
    {
      for (uint64_t i = 0; i != v58; ++i)
      {
        if (*(void *)v86 != v59) {
          objc_enumerationMutation(obj);
        }
        v61 = -[BWDeferredDictionaryIntermediate initWithDictionary:tag:URL:]([BWDeferredDictionaryIntermediate alloc], "initWithDictionary:tag:URL:", [obj objectForKeyedSubscript:*(void *)(*((void *)&v85 + 1) + 8 * i)], objc_msgSend(NSString, "stringWithFormat:", @"%@-%@", BWDeferredIntermediateTagCameraInfoByPortTypePrefix, *(void *)(*((void *)&v85 + 1) + 8 * i)), v83);
        [v45 addObject:v61];
      }
      uint64_t v58 = [obj countByEnumeratingWithState:&v85 objects:v90 count:16];
    }
    while (v58);
  }
  uint64_t v62 = [v79 moduleCalibrationByPortType];
  if (v62)
  {
    uint64_t v63 = v62;
    v64 = [BWDeferredDictionaryIntermediate alloc];
    uint64_t v65 = [(BWDeferredDictionaryIntermediate *)v64 initWithDictionary:v63 tag:BWDeferredIntermediateTagModuleCalibrationByPortType URL:v83];
    [v45 addObject:v65];
  }
  v66 = +[BWDeferredProcessingContainerManager sharedInstance];
  v89 = v77;
  uint64_t v67 = -[BWDeferredProcessingContainerManager createTransientContainerWithApplicationID:resolvedSettings:unresolvedSettings:pipelineParameters:intermediates:photoDescriptors:](v66, "createTransientContainerWithApplicationID:resolvedSettings:unresolvedSettings:pipelineParameters:intermediates:photoDescriptors:", a8, v35, v82, v78, v45, [MEMORY[0x1E4F1C978] arrayWithObjects:&v89 count:1]);

  return v67;
}

- (void)ensureGraphForSettings:(id)a3 processingSettings:(id)a4 applicationID:(id)a5
{
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x2020000000;
  int v8 = 0;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __94__FigCaptureDeferredProcessingEngine_ensureGraphForSettings_processingSettings_applicationID___block_invoke;
  block[3] = &unk_1E5C262C8;
  block[4] = self;
  block[5] = a5;
  block[6] = a3;
  block[7] = a4;
  block[8] = v7;
  dispatch_sync(workQueue, block);
  _Block_object_dispose(v7, 8);
}

- (void)_ensureGraphForProcessingContainer:(unsigned int)a3 sensorRawPixelFormat:(unint64_t)a4 sensorRawDimensions:(unint64_t)a5 ultraHighResSensorRawDimensions:(uint64_t)a6 depthDataDimensions:(uint64_t)a7 photoIdentifier:(void *)a8 applicationID:
{
  v161[17] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  if (!_FigIsCurrentDispatchQueue())
  {
    uint64_t v104 = v115;
    LODWORD(v102) = 0;
    FigDebugAssert3();
  }
  id v150 = 0;
  unsigned int v149 = 0;
  v148[0] = 0;
  v148[1] = v148;
  v148[2] = 0x3052000000;
  v148[3] = __Block_byref_object_copy__15;
  v148[4] = __Block_byref_object_dispose__15;
  v148[5] = a1;
  uint64_t v132 = a1;
  v122 = objc_msgSend((id)a1, "currentJob", v102, v104);
  v117 = (void *)[a2 settings];
  uint64_t v128 = objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "masterPortType");
  uint64_t v12 = objc_msgSend((id)objc_msgSend(a2, "photoManifest"), "descriptorForIdentifier:", a7);
  if (!*(unsigned char *)(a1 + 56)) {
    [+[BWDeferredTransactionBroker sharedInstance] openTransaction:0];
  }
  id v131 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v130 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v123 = a8;
  v129 = (void *)[a2 pipelineParameters];
  v13 = +[FigCaptureCameraParameters sharedInstance];
  int v14 = [v129 nrfVersion];
  if (v14 != [(FigCaptureCameraParameters *)v13 nrfVersion]
    || [v129 deepZoomVersion]
    && (int v15 = [v129 deepZoomVersion],
        v15 != [(FigCaptureCameraParameters *)v13 deepZoomVersion])
    || [v129 distortionCorrectionVersion]
    && (int v16 = [v129 distortionCorrectionVersion],
        v16 != [(FigCaptureCameraParameters *)v13 distortionCorrectionVersion]))
  {
    id v28 = 0;
    uint64_t UpTimeNanoseconds = 0;
    v120 = 0;
    v124 = 0;
    id v37 = 0;
    int v44 = -16827;
    goto LABEL_158;
  }
  unint64_t v121 = objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags");
  if (*MEMORY[0x1E4F1EBA8] == 1)
  {
    [a2 captureRequestIdentifierBytesLow];
    [a2 captureRequestIdentifierBytesHigh];
    kdebug_trace();
  }
  -[BWMemoryPool ensureMemoryAsyncWithSize:withMaximizeSystemMemory:useOptimizedMemorySizeDistributionsIfAvailable:](+[BWMemoryPool sharedMemoryPool](BWMemoryPool, "sharedMemoryPool"), "ensureMemoryAsyncWithSize:withMaximizeSystemMemory:useOptimizedMemorySizeDistributionsIfAvailable:", 1, [v122 isInteractiveQoS], 0);
  *(void *)(a1 + 104) = +[BWMemoryPool sharedMemoryPool];
  uint64_t UpTimeNanoseconds = FigGetUpTimeNanoseconds();
  if (dword_1EB4C4F30)
  {
    unsigned int v147 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  __int16 v114 = objc_msgSend((id)objc_msgSend(a2, "captureSettings", v103, v105), "captureFlags");
  v161[0] = v128;
  uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v161 count:1];
  uint64_t v19 = (void *)[MEMORY[0x1E4F1CA48] arrayWithArray:v18];
  uint64_t v20 = (void *)[MEMORY[0x1E4F1CA48] arrayWithArray:v18];
  if ([v129 pearlModuleType]
    || (objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags") & 0x4000000000) != 0)
  {
    uint64_t v21 = objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "secondaryPortTypes");
    [v19 addObjectsFromArray:v21];
    [v20 addObjectsFromArray:v21];
    if ([v129 pearlModuleType]) {
      [v20 removeObject:*MEMORY[0x1E4F52E00]];
    }
  }
  long long v144 = 0u;
  long long v145 = 0u;
  long long v142 = 0u;
  long long v143 = 0u;
  uint64_t v22 = [v19 countByEnumeratingWithState:&v142 objects:v160 count:16];
  v119 = v20;
  v126 = (void *)v12;
  if (v22)
  {
    uint64_t v23 = *(void *)v143;
    while (2)
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v143 != v23) {
          objc_enumerationMutation(v19);
        }
        uint64_t v25 = *(void *)(*((void *)&v142 + 1) + 8 * i);
        uint64_t v26 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureStreamSettingsForPortType:", v25), "sensorIDString");
        if (!v26)
        {
          uint64_t v26 = [*(id *)(v132 + 96) objectForKeyedSubscript:v25];
          if (!v26)
          {
            uint64_t v105 = v115;
            LODWORD(v103) = 0;
            FigDebugAssert3();
            id v28 = 0;
            goto LABEL_61;
          }
        }
        if (([*(id *)(v132 + 88) containsObject:v26] & 1) == 0)
        {
          unsigned int v149 = -16134;
          unsigned int v147 = 0;
          os_log_type_t type = OS_LOG_TYPE_DEFAULT;
          uint64_t v32 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          unsigned int v33 = v147;
          if (os_log_type_enabled(v32, type)) {
            unsigned int v34 = v33;
          }
          else {
            unsigned int v34 = v33 & 0xFFFFFFFE;
          }
          if (v34)
          {
            uint64_t v35 = *(void *)(v132 + 88);
            int v156 = 136315650;
            v157 = "-[FigCaptureDeferredProcessingEngine _ensureGraphForProcessingContainer:sensorRawPixelFormat:sensorRa"
                   "wDimensions:ultraHighResSensorRawDimensions:depthDataDimensions:photoIdentifier:applicationID:]";
            __int16 v158 = 2114;
            *(void *)v159 = v26;
            *(_WORD *)&v159[8] = 2114;
            *(void *)&v159[10] = v35;
            LODWORD(v105) = 32;
            v103 = &v156;
            _os_log_send_and_compose_impl();
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();
LABEL_124:
          id v28 = 0;
          v124 = 0;
          id v37 = 0;
          v120 = 0;
          goto LABEL_159;
        }
        [v131 setObject:v26 forKeyedSubscript:v25];
        int v27 = (void *)[a2 copyDictionaryForTag:objc_msgSend(NSString, "stringWithFormat:", @"%@-%@", BWDeferredIntermediateTagCameraInfoByPortTypePrefix, v25), &v149 err];
        if (!v27) {
          goto LABEL_124;
        }
        [v130 setObject:v27 forKeyedSubscript:v25];
      }
      uint64_t v22 = [v19 countByEnumeratingWithState:&v142 objects:v160 count:16];
      if (v22) {
        continue;
      }
      break;
    }
  }
  if ([a2 hasTag:BWDeferredIntermediateTagModuleCalibrationByPortType])
  {
    id v28 = objc_msgSend(a2, "copyDictionaryForTag:customClasses:err:", BWDeferredIntermediateTagModuleCalibrationByPortType, objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObject:", objc_opt_class()), &v149);
    if (v149)
    {
      unsigned int v147 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      id v29 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v30 = v147;
      if (os_log_type_enabled(v29, type)) {
        unsigned int v31 = v30;
      }
      else {
        unsigned int v31 = v30 & 0xFFFFFFFE;
      }
      if (v31)
      {
        int v156 = 136315394;
        v157 = "-[FigCaptureDeferredProcessingEngine _ensureGraphForProcessingContainer:sensorRawPixelFormat:sensorRawDim"
               "ensions:ultraHighResSensorRawDimensions:depthDataDimensions:photoIdentifier:applicationID:]";
        __int16 v158 = 1024;
        *(_DWORD *)v159 = v149;
        LODWORD(v105) = 18;
        v103 = &v156;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  else
  {
    id v28 = 0;
  }
  if (objc_msgSend(a2, "hasTag:", BWDeferredIntermediateTagSourceNodePixelBufferAttributes, v103, v105))
  {
    uint64_t v36 = [a2 copyDictionaryForTag:BWDeferredIntermediateTagSourceNodePixelBufferAttributes err:&v149];
  }
  else
  {
    if (objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureType") != 12 || (v121 & 4) != 0)
    {
LABEL_60:
      uint64_t v105 = v115;
      LODWORD(v103) = 0;
      FigDebugAssert3();
LABEL_61:
      v124 = 0;
      id v37 = 0;
      v120 = 0;
      int v44 = -16131;
      goto LABEL_158;
    }
    uint64_t v36 = [a2 copyAttributesForBufferType:8 portType:v128 err:&v149];
  }
  id v37 = (void *)v36;
  if (!v36) {
    goto LABEL_60;
  }
  int v38 = -[FigCaptureDeferredProcessingEngine expectsGainMapForSettings:captureSettings:](v132, v117, (void *)[a2 captureSettings]);
  int v39 = [a2 hasBufferForType:19 portType:v128];
  unint64_t v40 = objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags");
  if (objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "downgradedDeepFusionEnhancedResolutionCapture"))LODWORD(v41) = objc_msgSend(v129, "generateInferencesForSemanticProcessingIfNeeded"); {
  else
  }
    uint64_t v41 = HIDWORD(v40) & 1;
  if (v38 | v39 | v41) {
    float v42 = 2.0;
  }
  else {
    float v42 = 0.0;
  }
  if ((v121 & 4) == 0) {
    goto LABEL_63;
  }
  int v43 = [v117 resolutionFlavor];
  if ((v43 - 1) < 2)
  {
    a4 = a5;
    goto LABEL_64;
  }
  if (v43) {
LABEL_63:
  }
    a4 = 0;
LABEL_64:
  id v45 = (void *)[v37 objectForKeyedSubscript:*MEMORY[0x1E4F24D70]];
  if (v45)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      unsigned int v112 = objc_msgSend((id)objc_msgSend(v45, "firstObject"), "unsignedIntValue");
    }
    else {
      unsigned int v112 = [v45 unsignedIntValue];
    }
  }
  else
  {
    if (objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureType") == 12) {
      int v46 = 1885745712;
    }
    else {
      int v46 = 875704422;
    }
    unsigned int v112 = v46;
  }
  if ([v129 intelligentDistortionCorrectionEnabled])
  {
    uint64_t v155 = v128;
    uint64_t v108 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v155 count:1];
  }
  else
  {
    uint64_t v108 = 0;
  }
  if ([v129 geometricDistortionCorrectionEnabled])
  {
    uint64_t v154 = v128;
    uint64_t v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v154 count:1];
  }
  else
  {
    uint64_t v47 = 0;
  }
  if (objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "learnedNRStereoPhotoFrameFlag")) {
    uint64_t v48 = (uint64_t)v119;
  }
  else {
    uint64_t v48 = v47;
  }
  uint64_t v113 = v48;
  int v49 = objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureType");
  unsigned int v111 = FigCaptureClientApplicationIDIsCameraOrDerivative(v123);
  v124 = objc_alloc_init(FigCaptureIrisSinkConfiguration);
  -[FigCaptureSinkConfiguration setSinkID:](v124, "setSinkID:", [(id)v132 description]);
  -[FigCaptureIrisSinkConfiguration setDemosaicedRawEnabled:](v124, "setDemosaicedRawEnabled:", ([v126 processingFlags] >> 16) & 1);
  -[FigCaptureIrisSinkConfiguration setStereoPhotoCaptureEnabled:](v124, "setStereoPhotoCaptureEnabled:", objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "learnedNRStereoPhotoFrameFlag") != 0);
  uint64_t v50 = [[BWGraph alloc] initWithConfigurationQueuePriority:39];
  *(void *)(v132 + 48) = v50;
  [(BWGraph *)v50 beginConfiguration];
  objc_msgSend(*(id *)(v132 + 48), "setStatusDelegate:");
  uint64_t v51 = *(void **)(v132 + 104);
  if (v51)
  {
    *(void *)(v132 + 112) = [v51 newFlushAssertion:@"DeferredProcessingGraph"];
    [*(id *)(v132 + 48) setMemoryPool:*(void *)(v132 + 104)];
  }
  uint64_t v52 = [[BWDeferredProcessingSourceNode alloc] initWithPortTypes:v119 attributes:v37 colorSpaceProperties:3];
  *(void *)(v132 + 64) = v52;
  if (([*(id *)(v132 + 48) addNode:v52 error:&v150] & 1) == 0)
  {
    uint64_t v105 = v115;
    LODWORD(v103) = 0;
    FigDebugAssert3();
    v120 = 0;
    int v44 = -12780;
    goto LABEL_158;
  }
  v120 = objc_alloc_init(BWInferenceScheduler);
  if ((v121 & 4) != 0) {
    LODWORD(v53) = 1;
  }
  else {
    unint64_t v53 = ((unint64_t)objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags") >> 7) & 1;
  }
  int v54 = [v129 noiseReductionAndFusionScheme];
  if (v53) {
    int v55 = 5;
  }
  else {
    int v55 = 4;
  }
  if (v54) {
    int v55 = v54;
  }
  if (v55 != 5)
  {
    if (v55 != 4)
    {
LABEL_157:
      uint64_t v105 = v115;
      LODWORD(v103) = 0;
      FigDebugAssert3();
      int v44 = -12786;
LABEL_158:
      unsigned int v149 = v44;
      goto LABEL_159;
    }
    unsigned int v56 = objc_alloc_init(FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration);
    [(FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration *)v56 setPipelineStagePriority:39];
    [(FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration *)v56 setInferencePriority:39];
    -[FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration setDeviceType:](v56, "setDeviceType:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "metadata"), "deviceType"));
    [(FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration *)v56 setSensorIDStringsByPortType:v131];
    [(FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration *)v56 setCameraInfoByPortType:v130];
    LODWORD(v57) = 2.0;
    [(FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration *)v56 setUbInferenceMainImageDownscalingFactor:v57];
    *(float *)&double v58 = v42;
    [(FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration *)v56 setGainMapMainImageDownscalingFactor:v58];
    [(FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration *)v56 setMaxLossyCompressionLevel:+[FigCaptureCameraParameters stillImageMaxLossyCompressionLevel]];
    [(FigCaptureBaseStillImageSinkPipelineConfiguration *)v56 setInputIs10Bit:FigCapturePixelFormatIsTenBit(v112)];
    [(FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration *)v56 setRedEyeReductionVersion:0];
    [(FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration *)v56 setSemanticRenderingVersion:0];
    [(FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration *)v56 setSemanticDevelopmentVersion:0];
    [(FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration *)v56 setPortTypesWithIntelligentDistortionCorrectionEnabled:v108];
    [(FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration *)v56 setPortTypesWithGeometricDistortionCorrectionEnabled:v113];
    [(FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration *)v56 setGdcInDCProcessorSupported:v113 != 0];
    -[FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration setDcProcessorVersion:](v56, "setDcProcessorVersion:", [v129 distortionCorrectionVersion]);
    -[FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration setDemosaicedRawPixelFormat:](v56, "setDemosaicedRawPixelFormat:", objc_msgSend((id)objc_msgSend(a2, "settings"), "rawOutputFormat"));
    [(FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration *)v56 setStillImageSinkPipelineProcessingMode:1];
    [(FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration *)v56 setDeepFusionSupported:v49 == 12];
    -[FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration setLearnedNRSupported:](v56, "setLearnedNRSupported:", ((unint64_t)objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags") >> 7) & 1);
    uint64_t v59 = v49 == 12
       || [(FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration *)v56 learnedNRSupported];
    [(FigCaptureBaseStillImageSinkPipelineConfiguration *)v56 setStillImageStabilizationSupported:v59];
    -[FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration setDeepZoomVersion:](v56, "setDeepZoomVersion:", [v129 deepZoomVersion]);
    [(FigCaptureBaseStillImageSinkPipelineConfiguration *)v56 setClientIsCameraOrDerivative:v111];
    -[FigCaptureIrisSinkConfiguration setPortraitEffectsMatteDeliveryEnabled:](v124, "setPortraitEffectsMatteDeliveryEnabled:", objc_msgSend((id)objc_msgSend(a2, "settings"), "portraitEffectsMatteDeliveryEnabled"));
    LODWORD(v69) = 2.0;
    [(FigCaptureBaseStillImageSinkPipelineConfiguration *)v56 setPortraitEffectsMatteMainImageDownscalingFactor:v69];
    -[FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration setSupportedSemanticSegmentationMatteURNs:](v56, "setSupportedSemanticSegmentationMatteURNs:", objc_msgSend((id)objc_msgSend(a2, "settings"), "enabledSemanticSegmentationMatteURNs"));
    -[FigCaptureStillImageUnifiedBracketingSinkPipelineConfiguration setEnabledSemanticSegmentationMatteURNs:](v56, "setEnabledSemanticSegmentationMatteURNs:", objc_msgSend((id)objc_msgSend(a2, "settings"), "enabledSemanticSegmentationMatteURNs"));
    [(FigCaptureBaseStillImageSinkPipelineConfiguration *)v56 setSinkConfiguration:v124];
    [(FigCaptureBaseStillImageSinkPipelineConfiguration *)v56 setNoiseReductionAndFusionScheme:4];
    v70 = objc_autorelease(-[FigCaptureStillImageUnifiedBracketingSinkPipeline initWithConfiguration:captureDevice:sourceOutputsByPortType:highResStillImageDimensions:supplementalPointCloudCaptureDevice:supplementalPointCloudSourceOutput:captureStatusDelegate:inferenceScheduler:cinematicFramingStatesProvider:graph:name:]([FigCaptureStillImageUnifiedBracketingSinkPipeline alloc], "initWithConfiguration:captureDevice:sourceOutputsByPortType:highResStillImageDimensions:supplementalPointCloudCaptureDevice:supplementalPointCloudSourceOutput:captureStatusDelegate:inferenceScheduler:cinematicFramingStatesProvider:graph:name:", v56, 0, [*(id *)(v132 + 64) outputsByPortType], 0, 0, 0, 0, v120, 0, *(void *)(v132 + 48), objc_msgSend(NSString, "stringWithFormat:", @"Deferred Processing %@",
                +[FigCaptureStillImageUnifiedBracketingSinkPipeline pipelineBaseName])));
LABEL_153:
    uint64_t v83 = v70;
    if (v70)
    {
      [(BWStillImageSampleBufferSinkNode *)[(FigCaptureStillImageUnifiedBracketingSinkPipeline *)v70 stillImageSinkNode] setDeferredPhotoProcessorEnabled:1];
      [(BWStillImageSampleBufferSinkNode *)[(FigCaptureStillImageUnifiedBracketingSinkPipeline *)v83 stillImageSinkNode] setClientIsCameraOrDerivative:v111];
      v133[0] = MEMORY[0x1E4F143A8];
      v133[1] = 3221225472;
      v133[2] = __196__FigCaptureDeferredProcessingEngine__ensureGraphForProcessingContainer_sensorRawPixelFormat_sensorRawDimensions_ultraHighResSensorRawDimensions_depthDataDimensions_photoIdentifier_applicationID___block_invoke;
      v133[3] = &unk_1E5C26318;
      v133[4] = v148;
      [(BWStillImageSampleBufferSinkNode *)[(FigCaptureStillImageUnifiedBracketingSinkPipeline *)v83 stillImageSinkNode] setSampleBufferAvailableHandler:v133];
      v84 = objc_alloc_init(BWStillImageSampleBufferSinkNodeAnalyticsConfiguration);
      -[BWStillImageSampleBufferSinkNodeAnalyticsConfiguration setFormatDimensionWidth:](v84, "setFormatDimensionWidth:", objc_msgSend((id)objc_msgSend(a2, "settings"), "outputWidth"));
      -[BWStillImageSampleBufferSinkNodeAnalyticsConfiguration setFormatDimensionHeight:](v84, "setFormatDimensionHeight:", objc_msgSend((id)objc_msgSend(a2, "settings"), "outputHeight"));
      LODWORD(v85) = 30.0;
      [(BWStillImageSampleBufferSinkNodeAnalyticsConfiguration *)v84 setFormatMaxFrameRate:v85];
      [(BWStillImageSampleBufferSinkNodeAnalyticsConfiguration *)v84 setIsHighQualityPhotoWithVideoFormatSupported:0];
      [(BWStillImageSampleBufferSinkNodeAnalyticsConfiguration *)v84 setIsPhotoFormat:1];
      [(BWStillImageSampleBufferSinkNodeAnalyticsConfiguration *)v84 setIsTimeLapse:0];
      [(BWStillImageSampleBufferSinkNodeAnalyticsConfiguration *)v84 setPixelFormat:v112];
      [(BWStillImageSampleBufferSinkNodeAnalyticsConfiguration *)v84 setBinned:0];
      -[BWStillImageSampleBufferSinkNodeAnalyticsConfiguration setIsSemanticStyleRenderingSupported:](v84, "setIsSemanticStyleRenderingSupported:", objc_msgSend((id)objc_msgSend(a2, "settings"), "semanticStyle") != 0);
      -[BWStillImageSampleBufferSinkNodeAnalyticsConfiguration setFastCapturePrioritizationEnabled:](v84, "setFastCapturePrioritizationEnabled:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "metadata"), "fastCapturePrioritizationEnabled"));
      [(BWStillImageSampleBufferSinkNode *)[(FigCaptureStillImageUnifiedBracketingSinkPipeline *)v83 stillImageSinkNode] setAnalyticsConfiguration:v84];
      if (([*(id *)(v132 + 48) commitConfigurationWithID:1 error:&v150] & 1) != 0
        && [*(id *)(v132 + 48) start:&v150])
      {
        *(unsigned char *)(v132 + 56) = 1;
      }
      else
      {
        uint64_t v105 = v115;
        LODWORD(v103) = 0;
        FigDebugAssert3();
      }
      goto LABEL_159;
    }
    goto LABEL_157;
  }
  v127 = objc_alloc_init(FigCapturePhotonicEngineSinkPipelineConfiguration);
  [(FigCapturePhotonicEngineSinkPipelineConfiguration *)v127 setPipelineStagePriority:39];
  [(FigCapturePhotonicEngineSinkPipelineConfiguration *)v127 setInferencePriority:39];
  -[FigCapturePhotonicEngineSinkPipelineConfiguration setDeviceType:](v127, "setDeviceType:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "metadata"), "deviceType"));
  if ((objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags") & 0x4000000000) != 0)
  {
    uint64_t v60 = objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "portTypes");
    if ([v60 count] != 2)
    {
      uint64_t v105 = v115;
      LODWORD(v103) = 0;
      FigDebugAssert3();
      unsigned int v149 = -12780;
      unsigned int v147 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      long long v86 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v87 = v147;
      if (os_log_type_enabled(v86, type)) {
        unsigned int v88 = v87;
      }
      else {
        unsigned int v88 = v87 & 0xFFFFFFFE;
      }
      if (v88)
      {
        int v89 = objc_msgSend(v60, "count", v103, v115);
        uint64_t v90 = objc_msgSend((id)objc_msgSend(a2, "settings"), "settingsID");
        int v156 = 136315650;
        v157 = "-[FigCaptureDeferredProcessingEngine _ensureGraphForProcessingContainer:sensorRawPixelFormat:sensorRawDim"
               "ensions:ultraHighResSensorRawDimensions:depthDataDimensions:photoIdentifier:applicationID:]";
        __int16 v158 = 1024;
        *(_DWORD *)v159 = v89;
        *(_WORD *)&v159[4] = 2048;
        *(void *)&v159[6] = v90;
        LODWORD(v105) = 28;
        v103 = &v156;
        _os_log_send_and_compose_impl();
      }
      goto LABEL_194;
    }
    if ([v60 containsObject:*MEMORY[0x1E4F52DD8]])
    {
      if ([v60 containsObject:*MEMORY[0x1E4F52DE8]])
      {
        [(FigCapturePhotonicEngineSinkPipelineConfiguration *)v127 setDeviceType:8];
        goto LABEL_101;
      }
      uint64_t v105 = v115;
      LODWORD(v103) = 0;
      FigDebugAssert3();
      unsigned int v149 = -12780;
      unsigned int v147 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      v94 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v95 = v147;
      if (os_log_type_enabled(v94, type)) {
        unsigned int v96 = v95;
      }
      else {
        unsigned int v96 = v95 & 0xFFFFFFFE;
      }
      if (!v96)
      {
LABEL_194:
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        goto LABEL_159;
      }
    }
    else
    {
      uint64_t v105 = v115;
      LODWORD(v103) = 0;
      FigDebugAssert3();
      unsigned int v149 = -12780;
      unsigned int v147 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      uint64_t v91 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v92 = v147;
      if (os_log_type_enabled(v91, type)) {
        unsigned int v93 = v92;
      }
      else {
        unsigned int v93 = v92 & 0xFFFFFFFE;
      }
      if (!v93) {
        goto LABEL_194;
      }
    }
    uint64_t v97 = objc_msgSend((id)objc_msgSend(a2, "settings", v103, v105), "settingsID");
    int v156 = 136315394;
    v157 = "-[FigCaptureDeferredProcessingEngine _ensureGraphForProcessingContainer:sensorRawPixelFormat:sensorRawDimensi"
           "ons:ultraHighResSensorRawDimensions:depthDataDimensions:photoIdentifier:applicationID:]";
    __int16 v158 = 2048;
    *(void *)v159 = v97;
    LODWORD(v105) = 22;
    v103 = &v156;
    _os_log_send_and_compose_impl();
    goto LABEL_194;
  }
LABEL_101:
  -[FigCapturePhotonicEngineSinkPipelineConfiguration setDevicePosition:](v127, "setDevicePosition:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "metadata"), "devicePosition"));
  [(FigCapturePhotonicEngineSinkPipelineConfiguration *)v127 setSensorIDStringsByPortType:v131];
  [(FigCapturePhotonicEngineSinkPipelineConfiguration *)v127 setCameraInfoByPortType:v130];
  [(FigCapturePhotonicEngineSinkPipelineConfiguration *)v127 setModuleCalibrationByPortType:v28];
  LODWORD(v61) = 2.0;
  [(FigCapturePhotonicEngineSinkPipelineConfiguration *)v127 setUbInferenceMainImageDownscalingFactor:v61];
  *(float *)&double v62 = v42;
  [(FigCapturePhotonicEngineSinkPipelineConfiguration *)v127 setGainMapMainImageDownscalingFactor:v62];
  int v106 = v49;
  v107 = v37;
  if ((v121 & 4) == 0)
  {
LABEL_142:
    id v37 = v107;
    [(FigCapturePhotonicEngineSinkPipelineConfiguration *)v127 setMaxLossyCompressionLevel:+[FigCaptureCameraParameters stillImageMaxLossyCompressionLevel]];
    [(FigCaptureBaseStillImageSinkPipelineConfiguration *)v127 setInputIs10Bit:FigCapturePixelFormatIsTenBit(v112)];
    [(FigCapturePhotonicEngineSinkPipelineConfiguration *)v127 setRedEyeReductionVersion:0];
    -[FigCapturePhotonicEngineSinkPipelineConfiguration setSemanticRenderingVersion:](v127, "setSemanticRenderingVersion:", [v129 semanticRenderingVersion]);
    [(FigCapturePhotonicEngineSinkPipelineConfiguration *)v127 setSemanticDevelopmentVersion:0];
    BOOL v77 = -[FigCapturePhotonicEngineSinkPipelineConfiguration semanticRenderingVersion](v127, "semanticRenderingVersion") >= 1&& objc_msgSend((id)objc_msgSend(a2, "settings"), "semanticStyle") != 0;
    [(FigCapturePhotonicEngineSinkPipelineConfiguration *)v127 setSemanticStyleRenderingEnabled:v77];
    -[FigCapturePhotonicEngineSinkPipelineConfiguration setGenerateInferencesForSemanticProcessingIfNeeded:](v127, "setGenerateInferencesForSemanticProcessingIfNeeded:", [v129 generateInferencesForSemanticProcessingIfNeeded]);
    -[FigCapturePhotonicEngineSinkPipelineConfiguration setSmartStyleRenderingVersion:](v127, "setSmartStyleRenderingVersion:", [v129 smartStyleRenderingVersion]);
    -[FigCapturePhotonicEngineSinkPipelineConfiguration setSmartStyleReversibilityEnabled:](v127, "setSmartStyleReversibilityEnabled:", [v129 smartStyleReversibilityEnabled]);
    -[FigCapturePhotonicEngineSinkPipelineConfiguration setSmartStyleLinearThumbnailDimensions:](v127, "setSmartStyleLinearThumbnailDimensions:", [v129 smartStyleLinearThumbnailDimensions]);
    -[FigCapturePhotonicEngineSinkPipelineConfiguration setSmartStyleStyledThumbnailDimensions:](v127, "setSmartStyleStyledThumbnailDimensions:", [v129 smartStyleStyledThumbnailDimensions]);
    [(FigCapturePhotonicEngineSinkPipelineConfiguration *)v127 setPortTypesWithIntelligentDistortionCorrectionEnabled:v108];
    [(FigCapturePhotonicEngineSinkPipelineConfiguration *)v127 setPortTypesWithGeometricDistortionCorrectionEnabled:v113];
    -[FigCapturePhotonicEngineSinkPipelineConfiguration setStillImageGDCSourceMode:](v127, "setStillImageGDCSourceMode:", [v129 stillImageGDCSourceMode]);
    [(FigCapturePhotonicEngineSinkPipelineConfiguration *)v127 setGdcInDCProcessorSupported:v113 != 0];
    -[FigCapturePhotonicEngineSinkPipelineConfiguration setDcProcessingWithDepthSupported:](v127, "setDcProcessingWithDepthSupported:", [v129 dcProcessingWithDepthSupported]);
    -[FigCapturePhotonicEngineSinkPipelineConfiguration setDcProcessorVersion:](v127, "setDcProcessorVersion:", [v129 distortionCorrectionVersion]);
    -[FigCapturePhotonicEngineSinkPipelineConfiguration setDemosaicedRawPixelFormat:](v127, "setDemosaicedRawPixelFormat:", [v117 rawOutputFormat]);
    [(FigCapturePhotonicEngineSinkPipelineConfiguration *)v127 setStillImageSinkPipelineProcessingMode:1];
    [(FigCapturePhotonicEngineSinkPipelineConfiguration *)v127 setDeepFusionSupported:v106 == 12];
    -[FigCapturePhotonicEngineSinkPipelineConfiguration setLearnedNRSupported:](v127, "setLearnedNRSupported:", ((unint64_t)objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags") >> 7) & 1);
    if (objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "learnedNRStereoPhotoFrameFlag"))
    {
      [(FigCapturePhotonicEngineSinkPipelineConfiguration *)v127 setLearnedNRSupported:1];
      [(FigCapturePhotonicEngineSinkPipelineConfiguration *)v127 setStereoPhotoOutputDimensions:0x7E000000A80];
    }
    uint64_t v78 = v106 == 12
       || [(FigCapturePhotonicEngineSinkPipelineConfiguration *)v127 learnedNRSupported];
    [(FigCaptureBaseStillImageSinkPipelineConfiguration *)v127 setStillImageStabilizationSupported:v78];
    -[FigCapturePhotonicEngineSinkPipelineConfiguration setDeepZoomVersion:](v127, "setDeepZoomVersion:", [v129 deepZoomVersion]);
    -[FigCapturePhotonicEngineSinkPipelineConfiguration setDeepZoomMode:](v127, "setDeepZoomMode:", [v129 deepZoomMode]);
    [(FigCapturePhotonicEngineSinkPipelineConfiguration *)v127 setSoftISPSupported:(v121 >> 2) & 1];
    -[FigCapturePhotonicEngineSinkPipelineConfiguration setSfhrMode:](v127, "setSfhrMode:", [v129 sfhrMode]);
    [(FigCaptureBaseStillImageSinkPipelineConfiguration *)v127 setClientIsCameraOrDerivative:v111];
    if ((v114 & 0x800) != 0)
    {
      [(FigCaptureIrisSinkConfiguration *)v124 setDepthDataDeliveryEnabled:1];
      [(FigCaptureIrisSinkConfiguration *)v124 setPreviewQualityAdjustedPhotoFilterRenderingEnabled:0];
      -[FigCaptureIrisSinkConfiguration setFilterRenderingEnabled:](v124, "setFilterRenderingEnabled:", BWCIFilterArrayContainsPortraitFilters(objc_msgSend((id)objc_msgSend(a2, "settings"), "processedImageFilters")));
      [(FigCaptureBaseStillImageSinkPipelineConfiguration *)v127 setDepthDataDimensions:a6];
      -[FigCapturePhotonicEngineSinkPipelineConfiguration setContinuousZoomWithDepthSupported:](v127, "setContinuousZoomWithDepthSupported:", [v129 continuousZoomWithDepthSupported]);
      -[FigCapturePhotonicEngineSinkPipelineConfiguration setPearlModuleType:](v127, "setPearlModuleType:", [v129 pearlModuleType]);
      -[FigCapturePhotonicEngineSinkPipelineConfiguration setDepthDataType:](v127, "setDepthDataType:", [v129 depthDataType]);
    }
    -[FigCaptureIrisSinkConfiguration setPortraitEffectsMatteDeliveryEnabled:](v124, "setPortraitEffectsMatteDeliveryEnabled:", objc_msgSend((id)objc_msgSend(a2, "settings"), "portraitEffectsMatteDeliveryEnabled"));
    LODWORD(v79) = 2.0;
    [(FigCaptureBaseStillImageSinkPipelineConfiguration *)v127 setPortraitEffectsMatteMainImageDownscalingFactor:v79];
    -[FigCapturePhotonicEngineSinkPipelineConfiguration setSupportedSemanticSegmentationMatteURNs:](v127, "setSupportedSemanticSegmentationMatteURNs:", objc_msgSend((id)objc_msgSend(a2, "settings"), "enabledSemanticSegmentationMatteURNs"));
    -[FigCapturePhotonicEngineSinkPipelineConfiguration setEnabledSemanticSegmentationMatteURNs:](v127, "setEnabledSemanticSegmentationMatteURNs:", objc_msgSend((id)objc_msgSend(a2, "settings"), "enabledSemanticSegmentationMatteURNs"));
    [(FigCaptureBaseStillImageSinkPipelineConfiguration *)v127 setSinkConfiguration:v124];
    [(FigCaptureBaseStillImageSinkPipelineConfiguration *)v127 setNoiseReductionAndFusionScheme:5];
    unsigned int v80 = objc_msgSend((id)objc_msgSend(a2, "settings"), "outputWidth");
    uint64_t v81 = objc_msgSend((id)objc_msgSend(a2, "settings"), "outputHeight");
    v151 = [[FigCaptureSourceFormatDimensions alloc] initWithDimensions:v80 | (unint64_t)(v81 << 32) deferredPhotoProxyDimensions:v80 | (unint64_t)(v81 << 32) isPrivate:0 flavor:0 maxUpscalingDimensions:v80 | (unint64_t)(v81 << 32)];
    uint64_t v82 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v151 count:1];
    v70 = objc_autorelease(-[FigCapturePhotonicEngineSinkPipeline initWithConfiguration:captureDevice:sourceOutputsByPortType:sourceSensorRawOutputsByPortType:highResStillImageDimensions:supplementalPointCloudCaptureDevice:supplementalPointCloudSourceOutput:captureStatusDelegate:inferenceScheduler:cinematicFramingStatesProvider:graph:name:]([FigCapturePhotonicEngineSinkPipeline alloc], "initWithConfiguration:captureDevice:sourceOutputsByPortType:sourceSensorRawOutputsByPortType:highResStillImageDimensions:supplementalPointCloudCaptureDevice:supplementalPointCloudSourceOutput:captureStatusDelegate:inferenceScheduler:cinematicFramingStatesProvider:graph:name:", v127, 0, [*(id *)(v132 + 64) outputsByPortType], 0, v82, 0, 0, 0, v120, 0, *(void *)(v132 + 48), objc_msgSend(NSString, "stringWithFormat:",
                @"Deferred Processing %@",
                +[FigCapturePhotonicEngineSinkPipeline pipelineBaseName])));
    goto LABEL_153;
  }
  uint64_t v63 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  if ((objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags") & 0x300000000) == 0)
  {
    if (objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "downgradedDeepFusionEnhancedResolutionCapture"))-[FigCapturePhotonicEngineSinkPipelineConfiguration setDowngradedDeepFusionEnhancedResolutionDimensions:](v127, "setDowngradedDeepFusionEnhancedResolutionDimensions:", objc_msgSend((id)objc_msgSend(a2, "settings"), "deferredPhotoFinalWidth") | (unint64_t)(objc_msgSend((id)objc_msgSend(a2, "settings"), "deferredPhotoFinalHeight") << 32)); {
    goto LABEL_127;
    }
  }
  if ((objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureFlags") & 0x200000000) != 0) {
    -[FigCapturePhotonicEngineSinkPipelineConfiguration setDeepFusionEnhancedResolutionDimensions:](v127, "setDeepFusionEnhancedResolutionDimensions:", objc_msgSend((id)objc_msgSend(a2, "settings"), "deferredPhotoFinalWidth") | (unint64_t)(objc_msgSend((id)objc_msgSend(a2, "settings"), "deferredPhotoFinalHeight") << 32));
  }
  if (FigCaptureVideoDimensionsAreValid(a5))
  {
    if (![v63 objectForKeyedSubscript:v128]) {
      objc_msgSend(v63, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary"), v128);
    }
    objc_msgSend((id)objc_msgSend(v63, "objectForKeyedSubscript:", v128), "setObject:forKeyedSubscript:", FigCaptureDictionaryRepresentationForDimensions(a5), &unk_1EFAFEE68);
    -[FigCapturePhotonicEngineSinkPipelineConfiguration setUltraHighResolutionProcessingEnabled:](v127, "setUltraHighResolutionProcessingEnabled:", objc_msgSend((id)objc_msgSend(a2, "settings"), "resolutionFlavor") == 2);
    if (objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "learnedNRStereoPhotoFrameFlag"))
    {
      long long v140 = 0u;
      long long v141 = 0u;
      long long v138 = 0u;
      long long v139 = 0u;
      v64 = objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "secondaryPortTypes");
      uint64_t v65 = [v64 countByEnumeratingWithState:&v138 objects:v153 count:16];
      if (v65)
      {
        uint64_t v66 = *(void *)v139;
        do
        {
          for (uint64_t j = 0; j != v65; ++j)
          {
            if (*(void *)v139 != v66) {
              objc_enumerationMutation(v64);
            }
            uint64_t v68 = *(void *)(*((void *)&v138 + 1) + 8 * j);
            if ((int)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureStreamSettingsForPortType:", v68), "expectedUltraHighResFrameCaptureCount") >= 1)
            {
              if (![v63 objectForKeyedSubscript:v68]) {
                objc_msgSend(v63, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary"), v68);
              }
              objc_msgSend((id)objc_msgSend(v63, "objectForKeyedSubscript:", v68), "setObject:forKeyedSubscript:", FigCaptureDictionaryRepresentationForDimensions(a5), &unk_1EFAFEE68);
              [(FigCapturePhotonicEngineSinkPipelineConfiguration *)v127 setUltraHighResolutionProcessingEnabled:1];
            }
          }
          uint64_t v65 = [v64 countByEnumeratingWithState:&v138 objects:v153 count:16];
        }
        while (v65);
      }
    }
LABEL_127:
    long long v136 = 0u;
    long long v137 = 0u;
    long long v134 = 0u;
    long long v135 = 0u;
    unsigned int v71 = objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "portTypes");
    uint64_t v72 = [v71 countByEnumeratingWithState:&v134 objects:v152 count:16];
    if (v72)
    {
      uint64_t v73 = *(void *)v135;
      do
      {
        for (uint64_t k = 0; k != v72; ++k)
        {
          if (*(void *)v135 != v73) {
            objc_enumerationMutation(v71);
          }
          uint64_t v75 = *(void *)(*((void *)&v134 + 1) + 8 * k);
          if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "captureStreamSettingsForPortType:", v75), "qsubResolutionFlavor") == 1)
          {
            if (![v63 objectForKeyedSubscript:v75]) {
              objc_msgSend(v63, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary"), v75);
            }
            objc_msgSend((id)objc_msgSend(v63, "objectForKeyedSubscript:", v75), "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v129, "dimensionsByQSubResolutionFlavorByPortType"), "objectForKeyedSubscript:", v128), "objectForKeyedSubscript:", &unk_1EFAFEE80), &unk_1EFAFEE80);
          }
        }
        uint64_t v72 = [v71 countByEnumeratingWithState:&v134 objects:v152 count:16];
      }
      while (v72);
    }
    [(FigCapturePhotonicEngineSinkPipelineConfiguration *)v127 setSensorRawPixelFormat:a3];
    -[FigCapturePhotonicEngineSinkPipelineConfiguration setQuadraProcessingSupportEnabled:](v127, "setQuadraProcessingSupportEnabled:", [v129 quadraProcessingSupportEnabled]);
    [(FigCapturePhotonicEngineSinkPipelineConfiguration *)v127 setRawSensorDimensions:a4];
    if ([v63 count]) {
      unsigned int v76 = v63;
    }
    else {
      unsigned int v76 = 0;
    }
    [(FigCapturePhotonicEngineSinkPipelineConfiguration *)v127 setDimensionsByQSubResolutionFlavorByPortType:v76];
    [v129 sensorCenterOffset];
    -[FigCapturePhotonicEngineSinkPipelineConfiguration setSensorCenterOffset:](v127, "setSensorCenterOffset:");
    goto LABEL_142;
  }
  unsigned int v149 = -12780;
  if (dword_1EB4C4F30)
  {
    unsigned int v147 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    v98 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v99 = v147;
    if (os_log_type_enabled(v98, type)) {
      unsigned int v100 = v99;
    }
    else {
      unsigned int v100 = v99 & 0xFFFFFFFE;
    }
    if (v100)
    {
      uint64_t v101 = objc_msgSend((id)objc_msgSend(a2, "settings"), "settingsID");
      int v156 = 136315394;
      v157 = "-[FigCaptureDeferredProcessingEngine _ensureGraphForProcessingContainer:sensorRawPixelFormat:sensorRawDimen"
             "sions:ultraHighResSensorRawDimensions:depthDataDimensions:photoIdentifier:applicationID:]";
      __int16 v158 = 2048;
      *(void *)v159 = v101;
      LODWORD(v105) = 22;
      v103 = &v156;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
LABEL_159:
  [v122 setPrepareGraphNS:FigGetUpTimeNanoseconds() - UpTimeNanoseconds];
  if (v150)
  {
    unsigned int v149 = [v150 code];
    if (!v149) {
      goto LABEL_164;
    }
    goto LABEL_163;
  }
  if (v149)
  {
LABEL_163:
    objc_msgSend(v122, "failedWithError:", v103, v105);
    -[FigCaptureDeferredProcessingEngine _handleJobCompletion:]((void *)v132, v149);
  }
LABEL_164:
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }

  if (v150) {
    [+[BWDeferredTransactionBroker sharedInstance] closeTransaction:0];
  }
  _Block_object_dispose(v148, 8);
}

- (uint64_t)expectsGainMapForSettings:(void *)a3 captureSettings:
{
  if (!result) {
    return result;
  }
  int v5 = [a3 captureType];
  unint64_t v6 = [a3 captureFlags];
  int v7 = [+[FigCaptureCameraParameters sharedInstance] gainMapVersion] >> 16;
  if (v7 != 2)
  {
    if (v7 == 1)
    {
      if ([a2 depthDataDeliveryEnabled])
      {
        uint64_t v8 = (v6 >> 7) & 1;
        if (v5 != 1) {
          LODWORD(v8) = 1;
        }
        return v8 & (v6 >> 11);
      }
      if (v5 != 1) {
        return (v6 & 0x100000) != 0 || (v5 - 11) < 2;
      }
      if ((v6 & 0x80) != 0) {
        return [+[FigCaptureCameraParameters sharedInstance] nrfVersion] > 2;
      }
    }
    return 0;
  }
  uint64_t v9 = (v6 >> 7) & 1;
  if (v5 != 1) {
    LODWORD(v9) = 1;
  }
  uint64_t v10 = (v6 >> 20) & 1;
  if ((v5 - 11) < 2) {
    LODWORD(v10) = 1;
  }
  if (v5 == 2) {
    LODWORD(v10) = 1;
  }
  if ((v6 & 0x880) != 0) {
    return v9;
  }
  else {
    return v10;
  }
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

+ (id)sharedProcessingEngine
{
  if (sharedProcessingEngine_sOnceEngineToken != -1) {
    dispatch_once(&sharedProcessingEngine_sOnceEngineToken, &__block_literal_global_39);
  }
  return (id)sharedProcessingEngine_sEngine;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureDeferredProcessingEngine;
  [(FigCaptureDeferredProcessingEngine *)&v3 dealloc];
}

- (BWDeferredProcessingContainer)currentContainer
{
  prewarmedContainer = self->_prewarmedContainer;
  objc_super v3 = [(FigCaptureDeferredProcessingJob *)self->_job container];
  if (prewarmedContainer) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = v3;
  }
  if (v3) {
    return v4;
  }
  else {
    return prewarmedContainer;
  }
}

- (void)graph:(id)a3 didFinishStartingWithError:(int)a4
{
  workQueue = self->_workQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __71__FigCaptureDeferredProcessingEngine_graph_didFinishStartingWithError___block_invoke;
  v5[3] = &unk_1E5C262A0;
  int v6 = a4;
  v5[4] = self;
  dispatch_async(workQueue, v5);
}

void __71__FigCaptureDeferredProcessingEngine_graph_didFinishStartingWithError___block_invoke(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 40);
  objc_super v3 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend((id)objc_msgSend(v3, "currentJob"), "failedWithError:", *(unsigned int *)(a1 + 40));
    uint64_t v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(unsigned int *)(a1 + 40);
    -[FigCaptureDeferredProcessingEngine _handleJobCompletion:](v4, v5);
  }
  else
  {
    int v6 = (void *)[v3 currentContainer];
    int v7 = (void *)[v6 pipelineParameters];

    *(void *)(*(void *)(a1 + 32) + 16) = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v6, "captureSettings"), "masterPortType"), "copy");
    *(void *)(*(void *)(a1 + 32) + 24) = [v7 copy];
    *(unsigned char *)(*(void *)(a1 + 32) + 32) = fcdpe_demosaicedRawEnabled(v6);
    *(unsigned char *)(*(void *)(a1 + 32) + 33) = (objc_msgSend((id)objc_msgSend(v6, "captureSettings"), "captureFlags") & 0x800) != 0;

    *(void *)(*(void *)(a1 + 32) + 40) = -[FigCaptureDeferredProcessingEngine _stillImageSettingsForContainer:](*(BWStillImageSettings **)(a1 + 32), v6);
    if ([*(id *)(a1 + 32) currentJob])
    {
      uint64_t v8 = *(BWStillImageSettings **)(a1 + 32);
      -[FigCaptureDeferredProcessingEngine _runJob](v8);
    }
  }
}

- (BWStillImageSettings)_stillImageSettingsForContainer:(BWStillImageSettings *)result
{
  if (result)
  {
    int v2 = -[BWStillImageSettings initWithRequestedSettings:captureSettings:processingSettings:]([BWStillImageSettings alloc], "initWithRequestedSettings:captureSettings:processingSettings:", [a2 settings], objc_msgSend(a2, "captureSettings"), -[BWStillImageProcessingSettings initWithPhotoManifest:processIntelligentDistortionCorrection:]([BWStillImageProcessingSettings alloc], "initWithPhotoManifest:processIntelligentDistortionCorrection:", objc_msgSend(a2, "photoManifest"), objc_msgSend((id)objc_msgSend(a2, "pipelineParameters"), "intelligentDistortionCorrectionEnabled")));
    return v2;
  }
  return result;
}

- (void)_runJob
{
  v23[2] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    objc_super v3 = (void *)[(BWStillImageSettings *)a1 currentJob];
    uint64_t v4 = (void *)[v3 container];
    if (!_FigIsCurrentDispatchQueue())
    {
      uint64_t v18 = v1;
      LODWORD(sampleTimingArray) = 0;
      FigDebugAssert3();
    }
    uint64_t v5 = (_DWORD *)MEMORY[0x1E4F1EBA8];
    if (*MEMORY[0x1E4F1EBA8] == 1)
    {
      [v4 captureRequestIdentifierBytesLow];
      [v4 captureRequestIdentifierBytesHigh];
      kdebug_trace();
    }
    objc_msgSend(v3, "start", sampleTimingArray, v18);
    int v6 = -[FigCaptureDeferredProcessingEngine _stillImageSettingsForContainer:](a1, v4);
    if ((-[BWStillImageCaptureSettings captureFlags](-[BWStillImageSettings captureSettings](v6, "captureSettings"), "captureFlags") & 0x100000000) == 0)objc_msgSend((id)-[objc_class outputForPortType:](a1[2].super.isa, "outputForPortType:", -[BWStillImageCaptureSettings masterPortType](-[BWStillImageSettings captureSettings](v6, "captureSettings"), "masterPortType")), "emitStillImagePrewarmMessageWithSettings:", v6); {
    CMSampleBufferRef v21 = 0;
    }
    long long v7 = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 48);
    *(_OWORD *)&v20.presentationTimeStamp.timescale = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 32);
    *(_OWORD *)&v20.decodeTimeStamp.value = v7;
    v20.decodeTimeStamp.epoch = *(void *)(MEMORY[0x1E4F1FA70] + 64);
    long long v8 = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 16);
    *(_OWORD *)&v20.duration.value = *MEMORY[0x1E4F1FA70];
    *(_OWORD *)&v20.duration.epoch = v8;
    id v9 = [(NSArray *)[(BWPhotoManifest *)[(BWStillImageProcessingSettings *)[(BWStillImageSettings *)v6 processingSettings] photoManifest] photoDescriptors] firstObject];
    if (v9) {
      [v9 presentationTimeStamp];
    }
    else {
      memset(&v19, 0, sizeof(v19));
    }
    v20.presentationTimeStamp = v19;
    OSStatus v10 = CMSampleBufferCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 1u, 0, 0, 0, 0, 1, &v20, 0, 0, &v21);
    uint64_t v11 = v10;
    if (v10)
    {
      LODWORD(sampleTimingArraya) = v10;
      FigDebugAssert3();
      objc_msgSend(v3, "failedWithError:", v11, sampleTimingArraya, v1);
      -[FigCaptureDeferredProcessingEngine _handleJobCompletion:](a1, v11);
    }
    else
    {
      uint64_t v12 = *MEMORY[0x1E4F542E0];
      v23[0] = MEMORY[0x1E4F1CC38];
      uint64_t v13 = *MEMORY[0x1E4F54128];
      v22[0] = v12;
      v22[1] = v13;
      v23[1] = [(BWStillImageCaptureSettings *)[(BWStillImageSettings *)v6 captureSettings] masterPortType];
      uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
      int v15 = (const void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v14];
      CMSetAttachment(v21, (CFStringRef)*MEMORY[0x1E4F53070], v15, 1u);
      CMSetAttachment(v21, @"StillSettings", v6, 1u);
      CMSetAttachment(v21, @"PhotoManifest", [(BWStillImageProcessingSettings *)[(BWStillImageSettings *)v6 processingSettings] photoManifest], 1u);
      CMSetAttachment(v21, @"BWStillImageCaptureSettings", (CFTypeRef)[v4 captureSettings], 1u);
      CMSetAttachment(v21, @"StillImageCaptureType", (CFTypeRef)objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend((id)objc_msgSend(v4, "captureSettings"), "captureType")), 1u);
      CMSetAttachment(v21, @"StillImageSettings", (CFTypeRef)[v4 settings], 1u);
      CMSetAttachment(v21, @"DeferredProcessingContainer", v4, 1u);
      [(objc_class *)a1[2].super.isa processBuffer:v21];
      if (v21) {
        CFRelease(v21);
      }
    }
    if (*v5 == 1) {
      kdebug_trace();
    }
  }
}

- (void)_handleJobCompletion:(void *)a1
{
  if (a1)
  {
    if (!_FigIsCurrentDispatchQueue())
    {
      uint64_t v6 = v2;
      LODWORD(v5) = 0;
      FigDebugAssert3();
    }
    -[FigCaptureDeferredProcessingEngine _reportCoreAnalyticsDataWithError:job:]((uint64_t)a1, a2, objc_msgSend(a1, "currentJob", v5, v6));
    -[FigCaptureDeferredProcessingEngine _cleanupFromJob]((uint64_t)a1);
  }
}

- (void)executeJob:(id)a3
{
  workQueue = self->_workQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __49__FigCaptureDeferredProcessingEngine_executeJob___block_invoke;
  v4[3] = &unk_1E5C24458;
  v4[4] = a3;
  v4[5] = self;
  dispatch_async(workQueue, v4);
}

void __49__FigCaptureDeferredProcessingEngine_executeJob___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (dword_1EB4C4F30)
  {
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  objc_msgSend(*(id *)(a1 + 32), "setInteractiveQoS:", qos_class_self() > 0x18, v10, v12);
  uint64_t v3 = *(void *)(a1 + 40);
  if (*(void *)(v3 + 72))
  {
    id v9 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], objc_msgSend(NSString, "stringWithFormat:", @"A client requested deferred processing for a container while a job was in-progress for another client", 0 reason userInfo]);
  }

  *(void *)(*(void *)(a1 + 40) + 80) = 0;
  *(void *)(*(void *)(a1 + 40) + 72) = *(id *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  if (*(void *)(v4 + 48))
  {
    unsigned __int8 v5 = -[FigCaptureDeferredProcessingEngine _shouldReuseGraphForContainer:](v4, (void *)[*(id *)(a1 + 32) container]);
    uint64_t v6 = *(void *)(a1 + 40);
    if (v5)
    {
      *(unsigned char *)(v6 + 120) = 1;
      if (dword_1EB4C4F30)
      {
        long long v7 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      -[FigCaptureDeferredProcessingEngine _runJob](*(BWStillImageSettings **)(a1 + 40));
      return;
    }
    -[FigCaptureDeferredProcessingEngine _releaseGraph](v6);
    uint64_t v4 = *(void *)(a1 + 40);
  }
  *(unsigned char *)(v4 + 120) = 0;
  if (dword_1EB4C4F30)
  {
    long long v8 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  -[FigCaptureDeferredProcessingEngine _ensureGraphForJob:applicationID:](*(void *)(a1 + 40), *(void **)(a1 + 32), objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "processorRequest", v11, v13), "applicationID"));
}

- (void)_shouldReuseGraphForContainer:(uint64_t)a1
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  uint64_t v2 = a2;
  uint64_t v4 = objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "masterPortType");
  uint64_t v5 = [v2 pipelineParameters];
  if (v2)
  {
    uint64_t v6 = (void *)v5;
    int v58 = 0;
    long long v7 = (void *)[v2 copyDictionaryForTag:BWDeferredIntermediateTagSourceNodePixelBufferAttributes err:&v58];
    long long v8 = v7;
    if (v58
      || (uint64_t v9 = objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E4F24E10]), "unsignedLongValue"),
          v10 = objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E4F24D08]), "unsignedLongValue"), (uint64_t v11 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 64), "outputForPortType:", v4), "primaryMediaProperties"), "resolvedVideoFormat")) == 0))
    {
      uint64_t v2 = 0;
    }
    else
    {
      uint64_t v12 = v11;
      uint64_t v13 = [v11 width];
      uint64_t v14 = [v12 height];
      int v15 = *(void **)(a1 + 16);
      if (v15 == (void *)v4) {
        int v57 = 1;
      }
      else {
        int v57 = [v15 isEqualToString:v4];
      }
      int v56 = [*(id *)(a1 + 24) isEqual:v6];
      int v55 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "captureSettings"), "captureType");
      int v54 = objc_msgSend((id)objc_msgSend(v2, "captureSettings"), "captureType");
      unsigned int v16 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "requestedSettings"), "deferredPhotoFinalWidth");
      if (v16 >= objc_msgSend((id)objc_msgSend(v2, "settings"), "deferredPhotoFinalWidth"))
      {
        unsigned int v18 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "requestedSettings"), "deferredPhotoFinalHeight");
        BOOL v17 = v18 >= objc_msgSend((id)objc_msgSend(v2, "settings"), "deferredPhotoFinalHeight");
      }
      else
      {
        BOOL v17 = 0;
      }
      BOOL v45 = v17;
      BOOL v20 = v13 == v9 && v14 == v10;
      int v52 = *(unsigned __int8 *)(a1 + 32);
      BOOL v53 = v20;
      int v21 = fcdpe_demosaicedRawEnabled(v2);
      int v50 = *(unsigned __int8 *)(a1 + 32);
      int v51 = v21;
      int v46 = v8;
      if ((objc_msgSend((id)objc_msgSend(v2, "captureSettings"), "captureFlags") & 0x200000000) != 0)
      {
        BOOL v23 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "requestedSettings"), "semanticStyle") == 0;
        int v22 = v23 ^ (objc_msgSend((id)objc_msgSend(v2, "settings"), "semanticStyle") != 0);
      }
      else
      {
        int v22 = 1;
      }
      int v49 = v22;
      uint64_t v24 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "captureSettings"), "captureFlags");
      uint8x8_t v25 = (uint8x8_t)vcnt_s8((int8x8_t)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "captureSettings"), "learnedNRStereoPhotoFrameFlag"));
      v25.i16[0] = vaddlv_u8(v25);
      __int32 v48 = v25.i32[0];
      uint8x8_t v26 = (uint8x8_t)vcnt_s8((int8x8_t)objc_msgSend((id)objc_msgSend(v2, "captureSettings"), "learnedNRStereoPhotoFrameFlag"));
      v26.i16[0] = vaddlv_u8(v26);
      __int32 v47 = v26.i32[0];
      int v27 = *(unsigned __int8 *)(a1 + 33);
      BOOL v28 = *(unsigned char *)(a1 + 33) != 0;
      id v29 = (void *)[v2 settings];
      unsigned int v30 = (void *)[v2 captureSettings];
      unsigned int v31 = (void *)[v2 applicationID];
      __int16 v32 = [v30 captureFlags];
      int v33 = FigCaptureClientApplicationIDIsCameraOrDerivative(v31);
      uint64_t v34 = [v30 captureFlags];
      int v35 = BWCIFilterArrayContainsPortraitFilters((void *)[v29 processedImageFilters]);
      uint64_t v36 = v32 & 0x800;
      int v37 = v28 ^ (v36 == 0);
      if (v27 && !v36 && v33)
      {
        int v38 = v35;
        if ([v6 continuousZoomWithDepthSupported])
        {
          if ((v34 & 0x100000000) != 0) {
            int v37 = 0;
          }
          else {
            int v37 = v38 ^ 1;
          }
        }
        else
        {
          int v37 = 0;
        }
      }
      if (BWCIFilterArrayContainsPortraitFilters(objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "requestedSettings"), "processedImageFilters")))int v39 = 1; {
      else
      }
        int v39 = BWCIFilterArrayContainsPortraitFilters(objc_msgSend((id)objc_msgSend(v2, "settings"), "processedImageFilters")) ^ 1;
      int v40 = v57 & v56;
      if (v55 != v54) {
        int v40 = 0;
      }
      int v41 = v40 & v45 & v53;
      if (v52 != v51) {
        int v41 = 0;
      }
      if (v50) {
        int v41 = 0;
      }
      if ((v24 & 0x100000000) != 0) {
        int v41 = 0;
      }
      int v42 = v41 & v49;
      if (v48 != v47) {
        int v42 = 0;
      }
      uint64_t v2 = (void *)(v42 & v37 & v39);
      if (dword_1EB4C4F30)
      {
        os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        long long v8 = v46;
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      else
      {
        long long v8 = v46;
      }
    }
  }
  else
  {
    long long v8 = 0;
  }

  return v2;
}

- (void)_releaseGraph
{
  if (a1)
  {
    int v2 = *(unsigned __int8 *)(a1 + 56);
    if (!_FigIsCurrentDispatchQueue()) {
      FigDebugAssert3();
    }
    if (*(unsigned char *)(a1 + 56)) {
      [*(id *)(a1 + 48) stop:0];
    }
    *(unsigned char *)(a1 + 56) = 0;

    *(void *)(a1 + 48) = 0;
    *(void *)(a1 + 64) = 0;

    *(void *)(a1 + 112) = 0;
    [*(id *)(a1 + 104) disable];

    *(void *)(a1 + 104) = 0;
    *(void *)(a1 + 16) = 0;

    *(void *)(a1 + 24) = 0;
    *(_WORD *)(a1 + 32) = 0;
    if (v2)
    {
      uint64_t v3 = +[BWDeferredTransactionBroker sharedInstance];
      [(BWDeferredTransactionBroker *)v3 closeTransaction:0];
    }
  }
}

- (void)_ensureGraphForJob:(void *)a3 applicationID:
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v6 = (void *)[a2 container];
    uint8x8_t v26 = (void *)[a2 processorRequest];
    id v29 = a3;
    unsigned int v30 = a2;
    int v27 = v6;
    uint64_t v28 = a1;
    if ((objc_msgSend((id)objc_msgSend(v6, "captureSettings"), "captureFlags") & 4) != 0
      && (long long v38 = 0u,
          long long v39 = 0u,
          long long v36 = 0u,
          long long v37 = 0u,
          long long v7 = (void *)[v6 intermediates],
          (uint64_t v8 = [v7 countByEnumeratingWithState:&v36 objects:v40 count:16]) != 0))
    {
      uint64_t v9 = v8;
      unint64_t v34 = 0;
      uint64_t v35 = 0;
      unsigned int v10 = 0;
      unsigned int v11 = 0;
      unsigned int v31 = 0;
      uint64_t v12 = *(void *)v37;
      uint64_t v33 = *MEMORY[0x1E4F24E10];
      uint64_t v32 = *MEMORY[0x1E4F24D08];
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v37 != v12) {
            objc_enumerationMutation(v7);
          }
          uint64_t v14 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          if ([v14 isMemberOfClass:objc_opt_class()])
          {
            if ([v14 bufferType] == 1)
            {
              int v15 = (void *)[v14 attributes];
              unsigned int v16 = objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", v33), "unsignedIntValue");
              uint64_t v17 = objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", v32), "unsignedIntValue");
              if ((int)(v17 * v16) > (int)(v11 * v35))
              {
                uint64_t v18 = v17;
                unsigned int v31 = [v14 pixelFormat];
                uint64_t v35 = v18;
                unsigned int v11 = v16;
              }
            }
            else if (!FigCaptureVideoDimensionsAreValid(v10 | (v34 << 32)))
            {
              if ([v14 bufferType] == 2001)
              {
                CMTime v19 = (void *)[v14 attributes];
                unsigned int v20 = objc_msgSend((id)objc_msgSend(v19, "objectForKeyedSubscript:", v33), "unsignedIntValue");
                unsigned int v21 = objc_msgSend((id)objc_msgSend(v19, "objectForKeyedSubscript:", v32), "unsignedIntValue");
                if (v20 >= v21) {
                  unint64_t v22 = v21;
                }
                else {
                  unint64_t v22 = v20;
                }
                unint64_t v34 = v22;
                if (v20 <= v21) {
                  unsigned int v10 = v21;
                }
                else {
                  unsigned int v10 = v20;
                }
              }
              else if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v30, "container"), "pipelineParameters"), "depthDataType") == 9)
              {
                unint64_t v23 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v30, "container"), "pipelineParameters"), "depthDataDimensions");
                unsigned int v10 = v23;
                unint64_t v34 = HIDWORD(v23);
              }
            }
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v36 objects:v40 count:16];
      }
      while (v9);
    }
    else
    {
      unint64_t v34 = 0;
      uint64_t v35 = 0;
      unsigned int v10 = 0;
      unsigned int v11 = 0;
      unsigned int v31 = 0;
    }
    if (FigCaptureVideoDimensionsAreValid(objc_msgSend((id)objc_msgSend((id)objc_msgSend(v30, "container"), "pipelineParameters"), "rawSensorDimensions")))
    {
      unint64_t v24 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v30, "container"), "pipelineParameters"), "rawSensorDimensions");
      unint64_t v25 = v11 | (unint64_t)(v35 << 32);
    }
    else
    {
      unint64_t v25 = v11 | (unint64_t)(v35 << 32);
      unint64_t v24 = v25;
    }
    -[FigCaptureDeferredProcessingEngine _ensureGraphForProcessingContainer:sensorRawPixelFormat:sensorRawDimensions:ultraHighResSensorRawDimensions:depthDataDimensions:photoIdentifier:applicationID:](v28, v27, v31, v24, v25, v10 | (v34 << 32), [v26 photoIdentifier], v29);
  }
}

- (void)releaseResourcesForClientPID:(int)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __67__FigCaptureDeferredProcessingEngine_releaseResourcesForClientPID___block_invoke;
  v5[3] = &unk_1E5C24F10;
  v5[4] = self;
  int v6 = a3;
  int v7 = 25;
  dispatch_block_t v4 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, v5);
  dispatch_async((dispatch_queue_t)self->_workQueue, v4);
  dispatch_block_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
}

void __67__FigCaptureDeferredProcessingEngine_releaseResourcesForClientPID___block_invoke(uint64_t a1)
{
  if (objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 72), "processorRequest"), "clientPID") == *(_DWORD *)(a1 + 40)|| !*(void *)(*(void *)(a1 + 32) + 72))
  {
    if (dword_1EB4C4F30)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    -[FigCaptureDeferredProcessingEngine _releaseGraph](*(void *)(a1 + 32));

    *(void *)(*(void *)(a1 + 32) + 40) = 0;
  }
  else
  {
    int v2 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
}

- (void)releasePrewarmingResources
{
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__FigCaptureDeferredProcessingEngine_releasePrewarmingResources__block_invoke;
  block[3] = &unk_1E5C24430;
  block[4] = self;
  dispatch_sync(workQueue, block);
}

void __64__FigCaptureDeferredProcessingEngine_releasePrewarmingResources__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 80) = 0;
}

- (void)immediateTermination
{
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__FigCaptureDeferredProcessingEngine_immediateTermination__block_invoke;
  block[3] = &unk_1E5C24430;
  block[4] = self;
  dispatch_sync(workQueue, block);
}

void __58__FigCaptureDeferredProcessingEngine_immediateTermination__block_invoke(uint64_t a1)
{
}

- (void)_cleanupFromJob
{
  if (a1)
  {
    if (!_FigIsCurrentDispatchQueue()) {
      FigDebugAssert3();
    }

    *(void *)(a1 + 72) = 0;
  }
}

void __196__FigCaptureDeferredProcessingEngine__ensureGraphForProcessingContainer_sensorRawPixelFormat_sensorRawDimensions_ultraHighResSensorRawDimensions_depthDataDimensions_photoIdentifier_applicationID___block_invoke(uint64_t a1, CFTypeRef cf, int a3, uint64_t a4)
{
  if (cf) {
    CFRetain(cf);
  }
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(NSObject **)(*(void *)(*(void *)(v8 + 8) + 40) + 8);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __196__FigCaptureDeferredProcessingEngine__ensureGraphForProcessingContainer_sensorRawPixelFormat_sensorRawDimensions_ultraHighResSensorRawDimensions_depthDataDimensions_photoIdentifier_applicationID___block_invoke_2;
  v10[3] = &unk_1E5C262F0;
  v10[5] = v8;
  v10[6] = cf;
  int v11 = a3;
  v10[4] = a4;
  dispatch_async(v9, v10);
}

void __196__FigCaptureDeferredProcessingEngine__ensureGraphForProcessingContainer_sensorRawPixelFormat_sensorRawDimensions_ultraHighResSensorRawDimensions_depthDataDimensions_photoIdentifier_applicationID___block_invoke_2(uint64_t a1)
{
  -[FigCaptureDeferredProcessingEngine _handleProcessedStillImage:error:settings:](*(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(void **)(a1 + 48), *(unsigned int *)(a1 + 56), *(void **)(a1 + 32));
  int v2 = *(const void **)(a1 + 48);
  if (v2)
  {
    CFRelease(v2);
  }
}

- (void)_handleProcessedStillImage:(uint64_t)a3 error:(void *)a4 settings:
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  if (!_FigIsCurrentDispatchQueue())
  {
    uint64_t v17 = v4;
    LODWORD(v15) = 0;
    FigDebugAssert3();
  }
  uint64_t v9 = objc_msgSend(a1, "currentJob", v15, v17);
  unsigned int v10 = (void *)[a4 captureRequestIdentifier];
  objc_msgSend((id)objc_msgSend(v9, "processorRequest"), "photoIdentifier");
  if (a3) {
    goto LABEL_19;
  }
  int v11 = [a4 outputFormat];
  BOOL IsDemosaicedRaw = FigCapturePixelFormatIsDemosaicedRaw([a4 rawOutputFormat]);
  if (v11 && IsDemosaicedRaw)
  {
    a3 = 4294954516;
LABEL_19:
    if (!v9) {
      return;
    }
  }
  if ((objc_msgSend(v10, "isEqualToString:", objc_msgSend((id)objc_msgSend(v9, "processorRequest"), "captureRequestIdentifier")) & 1) == 0)objc_exception_throw((id)objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C3C8], objc_msgSend(NSString, "stringWithFormat:", @"Finished processing of photo with capture request identifier %@ but for processing job with identifier %@", v10, objc_msgSend((id)objc_msgSend(v9, "processorRequest"), "captureRequestIdentifier")), 0)); {
  objc_msgSend(v9, "setNumberOfPhotosDelivered:", objc_msgSend(v9, "numberOfPhotosDelivered") + 1);
  }
  if (a3)
  {
    if (dword_1EB4C4F30)
    {
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    objc_msgSend(v9, "failedWithError:", a3, v16, v18);
  }
  else
  {
    objc_msgSend((id)CMGetAttachment(a2, @"StillImageProcessingFlags", 0), "unsignedIntValue");
    BWPixelBufferDimensionsFromSampleBuffer((opaqueCMSampleBuffer *)a2);
    if (dword_1EB4C4F30)
    {
      CMTime v19 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    objc_msgSend(v9, "completedWithSampleBuffer:", a2, v16, v18);
  }
  int v14 = [v9 numberOfPhotosDelivered];
  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "container"), "photoManifest"), "photoDescriptors"), "count") == v14)-[FigCaptureDeferredProcessingEngine _handleJobCompletion:](a1, a3); {
}
  }

- (uint64_t)_reportCoreAnalyticsDataWithError:(void *)a3 job:
{
  if (result)
  {
    result = [a3 container];
    uint64_t v5 = (void *)result;
    if (a2 == -16140)
    {
      uint64_t v6 = 0x1EFA64D00;
    }
    else if (a2)
    {
      result = +[FigCaptureDeferredProcessingJob isPotentiallyRecoverableError:a2];
      uint64_t v6 = result ? 0x1EFA44E20 : 0x1EFA64CE0;
    }
    else
    {
      uint64_t v6 = 0x1EFA64CC0;
    }
    if (v6 != 0x1EFA44E20)
    {
      int v7 = objc_alloc_init(BWDeferredProcessingAnalyticsPayload);
      [(BWDeferredProcessingAnalyticsPayload *)v7 setError:a2];
      [(BWDeferredProcessingAnalyticsPayload *)v7 setProcessingResult:v6];
      if (v5)
      {
        -[BWDeferredProcessingAnalyticsPayload setContainerAgeInSeconds:](v7, "setContainerAgeInSeconds:", [v5 ageSeconds]);
        -[BWDeferredProcessingAnalyticsPayload setContainerSizeInBytes:](v7, "setContainerSizeInBytes:", [v5 sizeBytes]);
        -[BWDeferredProcessingAnalyticsPayload setProcessingType:](v7, "setProcessingType:", [v5 processingType]);
        -[BWDeferredProcessingAnalyticsPayload setFileBacked:](v7, "setFileBacked:", [v5 isRemote] ^ 1);
        if (a2 == -16140) {
          uint64_t v8 = 0xFFFFFFFFLL;
        }
        else {
          uint64_t v8 = [v5 processingCount];
        }
        [(BWDeferredProcessingAnalyticsPayload *)v7 setContainerProcessingCount:v8];
      }
      -[BWDeferredProcessingAnalyticsPayload setInteractiveQoS:](v7, "setInteractiveQoS:", [a3 isInteractiveQoS]);
      -[BWDeferredProcessingAnalyticsPayload setGraphPrepareDurationInMilliseconds:](v7, "setGraphPrepareDurationInMilliseconds:", [a3 prepareGraphNS] / 0xF4240uLL);
      -[BWDeferredProcessingAnalyticsPayload setJobDurationInMilliseconds:](v7, "setJobDurationInMilliseconds:", [a3 durationNS] / 0xF4240uLL);
      uint64_t v9 = +[BWCoreAnalyticsReporter sharedInstance];
      return [(BWCoreAnalyticsReporter *)v9 sendEvent:v7];
    }
  }
  return result;
}

- (BOOL)lastJobReusedGraph
{
  return self->_lastJobReusedGraph;
}

@end