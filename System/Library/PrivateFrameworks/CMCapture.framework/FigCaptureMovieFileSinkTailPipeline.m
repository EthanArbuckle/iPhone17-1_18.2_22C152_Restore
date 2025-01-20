@interface FigCaptureMovieFileSinkTailPipeline
- ($2825F4736939C4A6D3AD43837233062D)offlineVISDimensions;
- (BOOL)recording;
- (BOOL)sceneClassifierSuspended;
- (BWMRCSceneObserver)mrcSceneObserver;
- (BWQuickTimeMovieFileSinkNode)movieFileSinkNode;
- (BWVideoCompressorNode)sdofCompressorNode;
- (BWVideoCompressorNode)videoCompressorNode;
- (CGRect)irisVISCleanOutputRectForCLAP;
- (FigCaptureMovieFileSinkTailPipeline)initWithConfiguration:(id)a3 tailIndex:(unint64_t)a4 numTailPipelines:(unint64_t)a5 graph:(id)a6 parentPipeline:(id)a7 captureDevice:(id)a8 inferenceScheduler:(id)a9 recordingStatusDelegate:(id)a10 workgroup:(id)a11;
- (FigCaptureVISPipeline)visPipeline;
- (id)_buildFaceDetectionNode:(void *)a3 parentPipeline:(uint64_t)a4 objectDetectionSourceOutput:(void *)a5 faceDetectionNodeOut:;
- (id)_metalCommandQueueWithName:(uint64_t)a1 priority:;
- (uint64_t)_appendBackPressureNodeToPreviousVideoOutput:(void *)a3 graph:(void *)a4 parentPipeline:(uint64_t)a5 pipelineStage:(uint64_t)a6 nodeName:(void *)a7 backPressureNodeOut:;
- (uint64_t)_buildMovieFileSinkTailPipeline:(uint64_t)a3 tailIndex:(uint64_t)a4 numTailPipelines:(void *)a5 graph:(id *)a6 parentPipeline:(void *)a7 captureDevice:(uint64_t)a8 inferenceScheduler:(uint64_t)a9 recordingStatusDelegate:(uint64_t)a10 workgroup:;
- (uint64_t)setUpBackPressureSemaphoresWithIrisIntermediateJPEGPhotoDecompressorNode:(void *)a3 videoDefringingNode:;
- (void)dealloc;
- (void)setMrcSceneObserver:(id)a3;
- (void)setRecording:(BOOL)a3;
- (void)setSceneClassifierSuspended:(BOOL)a3;
@end

@implementation FigCaptureMovieFileSinkTailPipeline

- (uint64_t)setUpBackPressureSemaphoresWithIrisIntermediateJPEGPhotoDecompressorNode:(void *)a3 videoDefringingNode:
{
  if (result)
  {
    uint64_t v6 = result;
    if (*(void *)(result + 96))
    {
      objc_msgSend(*(id *)(result + 96), "setInitialSemaphoreValue:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(result + 128), "output"), "primaryMediaProperties"), "resolvedRetainedBufferCount")- *(_DWORD *)(result + 144)+ 1);
      objc_msgSend(*(id *)(v6 + 128), "setEmitSampleBufferSemaphore:", objc_msgSend(*(id *)(v6 + 96), "semaphore"));
      result = [*(id *)(v6 + 96) setBackPressureSourceNode:*(void *)(v6 + 128)];
      if (*(void *)(v6 + 112))
      {
        objc_msgSend(*(id *)(v6 + 112), "setInitialSemaphoreValue:", objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[FigCaptureVISPipeline sdofVISNode](*(void *)(v6 + 40)), "output"), "primaryMediaProperties"), "resolvedRetainedBufferCount")- *(_DWORD *)(v6 + 144)+ 1);
        result = objc_msgSend((id)-[FigCaptureVISPipeline sdofVISNode](*(void *)(v6 + 40)), "setEmitSampleBufferSemaphore:", objc_msgSend(*(id *)(v6 + 112), "semaphore"));
      }
    }
    if (*(void *)(v6 + 88))
    {
      if (!*(void *)(v6 + 136))
      {
        int v7 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "output"), "primaryMediaProperties"), "resolvedRetainedBufferCount");
        if ((int)(v7 - objc_msgSend((id)objc_msgSend(a3, "input"), "delayedBufferCount") + 1) <= 0)
        {
          uint64_t v15 = v3;
          LODWORD(v14) = 0;
          FigDebugAssert3();
        }
        objc_msgSend(*(id *)(v6 + 88), "setInitialSemaphoreValue:", v14, v15);
        objc_msgSend(a2, "addEmitSampleBufferSemaphore:", objc_msgSend(*(id *)(v6 + 88), "semaphore"));
        v8 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(v6 + 88), "input"), "connection"), "output"), "node"), "input"), "connection"), "pipelineStage"), "queue");
        result = objc_msgSend(v8, "isEqual:", objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "input"), "connection"), "pipelineStage"), "queue"));
        if ((result & 1) == 0) {
          result = [*(id *)(v6 + 88) setSemaphoreSignalQueue:v8];
        }
      }
      if (*(void *)(v6 + 136) == 1)
      {
        v9 = @"SynchronizedSlaveFrame";
        int v10 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "output"), "mediaPropertiesForAttachedMediaKey:", @"SynchronizedSlaveFrame"), "resolvedRetainedBufferCount");
        if (!*(void *)(v6 + 136)) {
          v9 = @"PrimaryFormat";
        }
        uint64_t v11 = v10
            - objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "input"), "mediaConfigurationForAttachedMediaKey:", v9), "delayedBufferCount")+ 1;
        if ((int)v11 <= 0)
        {
          uint64_t v15 = v3;
          LODWORD(v14) = 0;
          FigDebugAssert3();
        }
        objc_msgSend(*(id *)(v6 + 88), "setInitialSemaphoreValue:", v11, v14, v15);
        result = objc_msgSend(a2, "addEmitSynchronizedSlaveSampleBufferSemaphore:", objc_msgSend(*(id *)(v6 + 88), "semaphore"));
      }
    }
    if (*(void *)(v6 + 104))
    {
      objc_msgSend(*(id *)(v6 + 104), "setInitialSemaphoreValue:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(v6 + 32), "output"), "primaryMediaProperties"), "resolvedRetainedBufferCount")+ 1);
      uint64_t v12 = [*(id *)(v6 + 104) semaphore];
      v13 = *(void **)(v6 + 32);
      return [v13 setEmitSampleBufferSemaphore:v12];
    }
  }
  return result;
}

- (id)_metalCommandQueueWithName:(uint64_t)a1 priority:
{
  if (!a1) {
    return 0;
  }
  id v1 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F55F60], "metalDevice"), "newCommandQueue");
  v2 = (void *)FigDispatchQueueCreateWithPriority();
  [v1 setCompletionQueue:v2];
  [v1 setSubmissionQueue:v2];

  return v1;
}

- (BWQuickTimeMovieFileSinkNode)movieFileSinkNode
{
  return self->_movieFileSinkNode;
}

- (BWVideoCompressorNode)videoCompressorNode
{
  return self->_videoCompressorNode;
}

- (BWVideoCompressorNode)sdofCompressorNode
{
  return self->_sdofCompressorNode;
}

- (uint64_t)_appendBackPressureNodeToPreviousVideoOutput:(void *)a3 graph:(void *)a4 parentPipeline:(uint64_t)a5 pipelineStage:(uint64_t)a6 nodeName:(void *)a7 backPressureNodeOut:
{
  if (!a1) {
    return 0;
  }
  uint64_t v17 = 0;
  uint64_t v14 = [[BWBackPressureNode alloc] initWithNumberOfInputsAndOutputs:1 initialSemaphoreValue:0];
  -[BWNode setName:](v14, "setName:", [NSString stringWithFormat:@"%@ %@", objc_msgSend(a1, "name"), a6]);
  if (([a4 addNode:v14 error:&v17] & 1) == 0
    || (objc_msgSend(a3, "connectOutput:toInput:pipelineStage:", a2, -[BWNode input](v14, "input"), a5) & 1) == 0)
  {
    FigDebugAssert3();
    return 0;
  }
  uint64_t v15 = [(BWNode *)v14 output];
  if (a7) {
    *a7 = v14;
  }
  return v15;
}

- (FigCaptureMovieFileSinkTailPipeline)initWithConfiguration:(id)a3 tailIndex:(unint64_t)a4 numTailPipelines:(unint64_t)a5 graph:(id)a6 parentPipeline:(id)a7 captureDevice:(id)a8 inferenceScheduler:(id)a9 recordingStatusDelegate:(id)a10 workgroup:(id)a11
{
  v20.receiver = self;
  v20.super_class = (Class)FigCaptureMovieFileSinkTailPipeline;
  uint64_t v17 = -[FigCapturePipeline initWithGraph:name:](&v20, sel_initWithGraph_name_, a6, objc_msgSend(NSString, "stringWithFormat:", @"Tail Pipeline %d", a4));
  v18 = v17;
  if (v17
    && -[FigCaptureMovieFileSinkTailPipeline _buildMovieFileSinkTailPipeline:tailIndex:numTailPipelines:graph:parentPipeline:captureDevice:inferenceScheduler:recordingStatusDelegate:workgroup:]((uint64_t)v17, a3, a4, a5, a6, (id *)a7, a8, (uint64_t)a9, (uint64_t)a10, (uint64_t)a11))
  {
    FigDebugAssert3();

    return 0;
  }
  return v18;
}

- (uint64_t)_buildMovieFileSinkTailPipeline:(uint64_t)a3 tailIndex:(uint64_t)a4 numTailPipelines:(void *)a5 graph:(id *)a6 parentPipeline:(void *)a7 captureDevice:(uint64_t)a8 inferenceScheduler:(uint64_t)a9 recordingStatusDelegate:(uint64_t)a10 workgroup:
{
  uint64_t v490 = *MEMORY[0x1E4F143B8];
  if (!result) {
    return result;
  }
  uint64_t v14 = result;
  unsigned int v479 = 0;
  id v478 = 0;
  *(void *)(result + 136) = a3;
  uint64_t v15 = [a2 movieFileSinkPipelineConfiguration];
  uint64_t v418 = a3;
  if (v15) {
    v16 = *(__CFString **)(v15 + 16);
  }
  else {
    v16 = 0;
  }
  uint64_t v17 = v15;
  v379 = (void *)[(__CFString *)v16 irisSinkConfiguration];
  int v18 = [(__CFString *)v16 irisVISEnabled];
  int v19 = [(__CFString *)v16 irisSDOFEnabled];
  uint64_t v423 = v17;
  if (v17) {
    objc_super v20 = *(void **)(v17 + 48);
  }
  else {
    objc_super v20 = 0;
  }
  unsigned int v389 = [v20 enabled];
  uint64_t v21 = [a2 movieFileSinkPipelineConfiguration];
  if (v21) {
    BOOL v22 = *(unsigned char *)(v21 + 196) != 0;
  }
  else {
    BOOL v22 = 0;
  }
  if ([a2 videoSourceOutput])
  {
    if (v379) {
      unsigned int v410 = 1;
    }
    else {
      unsigned int v410 = [(__CFString *)v16 livePhotoMetadataWritingEnabled];
    }
  }
  else
  {
    unsigned int v410 = 0;
  }
  v406 = v16;
  if ([a2 videoSourceOutput])
  {
    uint64_t v23 = v17;
    if (v17) {
      uint64_t v23 = *(void *)(v17 + 32);
    }
    BOOL v395 = v23 != 0;
  }
  else
  {
    BOOL v395 = 0;
  }
  v416 = a6;
  v24 = (void *)[MEMORY[0x1E4F1CA48] array];
  v25 = v24;
  BOOL v369 = v22;
  if (v22)
  {
    [v24 addObject:0x1EFA748E0];
    [v25 addObject:0x1EFA74900];
    [v25 addObject:@"HumanFullBodiesMask"];
    [v25 addObject:@"HumanSkinsMask"];
    [v25 addObject:0x1EFA74700];
  }
  uint64_t v26 = [a2 videoSourceOutput];
  uint64_t v27 = v26;
  uint64_t v28 = 1;
  if (v26) {
    uint64_t v28 = 2;
  }
  if (v19) {
    BOOL v29 = v28;
  }
  else {
    BOOL v29 = v26 != 0;
  }
  uint64_t v362 = [v25 count];
  uint64_t v30 = [a2 audioSourceOutput];
  uint64_t v31 = [a2 cinematicAudioSourceOutput];
  if (v30) {
    uint64_t v32 = (v31 != 0) + 1;
  }
  else {
    uint64_t v32 = v31 != 0;
  }
  uint64_t v363 = v32;
  BOOL v364 = v29;
  int v349 = v18;
  uint64_t v383 = a4;
  if (v27)
  {
    if (v423) {
      v33 = *(void **)(v423 + 8);
    }
    else {
      v33 = 0;
    }
    BOOL IsHDR = BWColorSpaceIsHDR([v33 colorSpace]);
  }
  else
  {
    BOOL IsHDR = 0;
  }
  v34 = (void *)[a2 metadataSourceOutputs];
  id v420 = (id)[a2 indexesOfDetectedObjectsInMetadataOutputs];
  uint64_t v392 = [v34 count];
  uint64_t v435 = [a2 videoSourceOutput];
  uint64_t v358 = [a2 audioSourceOutput];
  uint64_t v359 = [a2 cinematicAudioSourceOutput];
  v401 = +[BWPipelineStage pipelineStageWithName:priority:workgroup:](BWPipelineStage, "pipelineStageWithName:priority:workgroup:", objc_msgSend(NSString, "stringWithFormat:", @"com.apple.coremedia.capture.moviefile.tail.%d", v418), 14, a10);
  unsigned int v35 = [(__CFString *)v406 stereoVideoCaptureEnabled];
  if (v35) {
    v377 = +[BWPipelineStage pipelineStageWithName:priority:workgroup:](BWPipelineStage, "pipelineStageWithName:priority:workgroup:", objc_msgSend(NSString, "stringWithFormat:", @"com.apple.coremedia.capture.moviefile.stereo.companion.vis.tail.%d", v418), 14, a10);
  }
  else {
    v377 = 0;
  }
  obuint64_t j = +[BWPipelineStage pipelineStageWithName:priority:workgroup:](BWPipelineStage, "pipelineStageWithName:priority:workgroup:", objc_msgSend(NSString, "stringWithFormat:", @"com.apple.coremedia.capture.moviefile.compressor.tail.%d", v418), 14, a10);
  if (v19)
  {
    v375 = +[BWPipelineStage pipelineStageWithName:priority:workgroup:](BWPipelineStage, "pipelineStageWithName:priority:workgroup:", objc_msgSend(NSString, "stringWithFormat:", @"com.apple.coremedia.capture.moviefile.sdof-vis.tail.%d", v418), 14, a10);
    v354 = +[BWPipelineStage pipelineStageWithName:priority:workgroup:](BWPipelineStage, "pipelineStageWithName:priority:workgroup:", objc_msgSend(NSString, "stringWithFormat:", @"com.apple.coremedia.capture.moviefile.sdof-compressor.tail.%d", v418), 14, a10);
  }
  else
  {
    v375 = 0;
    v354 = 0;
  }
  if (v389)
  {
    uint64_t v36 = v418;
    v352 = +[BWPipelineStage pipelineStageWithName:priority:workgroup:](BWPipelineStage, "pipelineStageWithName:priority:workgroup:", objc_msgSend(NSString, "stringWithFormat:", @"com.apple.coremedia.capture.moviefile.depth-compressor.tail.%d", v418), 14, a10);
  }
  else
  {
    v352 = 0;
    uint64_t v36 = v418;
  }
  unint64_t v37 = 0x1E4F1C000uLL;
  uint64_t v430 = v14;
  unsigned int v414 = v35;
  uint64_t v380 = (uint64_t)v34;
  if ([v25 count])
  {
    id v431 = (id)[MEMORY[0x1E4F1CA60] dictionary];
    long long v474 = 0u;
    long long v475 = 0u;
    long long v476 = 0u;
    long long v477 = 0u;
    uint64_t v38 = [v25 countByEnumeratingWithState:&v474 objects:v489 count:16];
    if (v38)
    {
      uint64_t v39 = v38;
      uint64_t v40 = *(void *)v475;
      do
      {
        for (uint64_t i = 0; i != v39; ++i)
        {
          if (*(void *)v475 != v40) {
            objc_enumerationMutation(v25);
          }
          [v431 setObject:+[BWPipelineStage pipelineStageWithName:priority:workgroup:](BWPipelineStage, "pipelineStageWithName:priority:workgroup:", objc_msgSend(NSString, "stringWithFormat:", @"com.apple.coremedia.capture.moviefile.%@-compressor.tail.%d", -[__CFString lowercaseString](mfsp_pipelineNameFromSmartStyleAttachedMediaKey(*(void **)(*((void *)&v474 + 1) + 8 * i)), "lowercaseString"), v418), 14, a10), *(void *)(*((void *)&v474 + 1) + 8 * i) forKeyedSubscript];
        }
        uint64_t v39 = [v25 countByEnumeratingWithState:&v474 objects:v489 count:16];
      }
      while (v39);
      uint64_t v14 = v430;
      uint64_t v36 = v418;
      unint64_t v37 = 0x1E4F1C000;
    }
    else
    {
      uint64_t v36 = v418;
    }
  }
  else
  {
    id v431 = 0;
  }
  int CFPreferenceNumberWithDefault = FigGetCFPreferenceNumberWithDefault();
  uint64_t v386 = [MEMORY[0x1E4F1CA48] array];
  id v441 = (id)[*(id *)(v37 + 2656) dictionary];
  v43 = v416;
  if (v423)
  {
    uint64_t v44 = *(void *)(v423 + 80);
    uint64_t v45 = *(void *)(v423 + 88);
  }
  else
  {
    uint64_t v45 = 0;
    uint64_t v44 = 0;
  }
  v46 = (void *)[a2 irisIntermediateJPEGPhotoDecompressorNode];
  BOOL v371 = v46 != 0;
  if (v46) {
    v351 = +[BWPipelineStage pipelineStageWithName:priority:](BWPipelineStage, "pipelineStageWithName:priority:", objc_msgSend(NSString, "stringWithFormat:", @"com.apple.coremedia.capture.moviefile.iris.decompression.backpressure.%d", v36), 14);
  }
  else {
    v351 = 0;
  }
  if (v423)
  {
    *(_DWORD *)(v14 + 148) = *(_DWORD *)(v423 + 104);
    BOOL v397 = *(unsigned __int8 *)(v423 + 138) != 0;
  }
  else
  {
    BOOL v397 = 0;
    *(_DWORD *)(v14 + 148) = 0;
  }
  if (v416) {
    uint64_t v47 = [v416[7] irisStagingNode];
  }
  else {
    uint64_t v47 = 0;
  }
  v425 = a2;
  BOOL v48 = v423;
  if (v423) {
    BOOL v48 = *(unsigned char *)(v423 + 122) != 0;
  }
  BOOL v370 = 0;
  int v49 = !v397;
  if (!v48 && (v49 & 1) == 0) {
    BOOL v370 = (v36 | v47) == 0;
  }
  v394 = mfsp_avVideoCodec(v406);
  char v381 = [(__CFString *)v394 isEqualToString:@"hvc1"];
  if (v423) {
    v50 = *(void **)(v423 + 8);
  }
  else {
    v50 = 0;
  }
  unint64_t v51 = objc_msgSend((id)objc_msgSend(v50, "depthDataFormat"), "dimensions");
  if (v423)
  {
    unint64_t v52 = *(void *)(v423 + 56);
    if (HIDWORD(v52)) {
      BOOL v53 = v52 == 0;
    }
    else {
      BOOL v53 = 1;
    }
    if (!v53) {
      unint64_t v51 = *(void *)(v423 + 56);
    }
    uint64_t v390 = v51;
    unint64_t v353 = HIDWORD(v51);
    if (!v406)
    {
      uint64_t v368 = 0;
      v56 = v425;
      v57 = (void *)v386;
      BOOL v58 = v369;
      uint64_t v59 = v435;
LABEL_178:
      int v385 = [v56 vitalityScoringEnabled];
      uint64_t v152 = v423;
      goto LABEL_190;
    }
    *(unsigned char *)(v14 + 152) = *(unsigned char *)(v423 + 122);
    int v54 = *(_DWORD *)(v423 + 104);
  }
  else
  {
    uint64_t v390 = v51;
    unint64_t v353 = HIDWORD(v51);
    if (!v406)
    {
      v56 = v425;
      int v385 = [v425 vitalityScoringEnabled];
      uint64_t v368 = 0;
      int v160 = 0;
      uint64_t v14 = v430;
      v57 = (void *)v386;
      v43 = v416;
      uint64_t v36 = v418;
      goto LABEL_235;
    }
    int v54 = 0;
    uint64_t v14 = v430;
    *(unsigned char *)(v430 + 152) = 0;
  }
  uint64_t v372 = v44;
  BOOL v55 = +[FigCaptureVISPipeline visPipelineIsRequiredForFigCaptureVideoStabilizationType:]((uint64_t)FigCaptureVISPipeline, v54)|| *(unsigned char *)(v14 + 152) != 0;
  int v60 = v397 & FigCaptureMetadataUtilitiesShouldIncludeDiagnosticMetadata();
  if (v418) {
    BOOL v61 = 1;
  }
  else {
    BOOL v61 = *(unsigned char *)(v14 + 152) == 0;
  }
  BOOL v62 = !v61 && v397;
  if (!v62 || v60)
  {
    int v64 = !v370;
    int v63 = v55 && !v370;
  }
  else
  {
    int v63 = 0;
    int v64 = 0;
  }
  if (v423)
  {
    if ([*(id *)(v423 + 16) irisVISMethod] == 3)
    {
LABEL_95:
      BOOL v66 = v383 == 1;
      goto LABEL_97;
    }
    v65 = *(void **)(v423 + 16);
  }
  else
  {
    int v161 = [0 irisVISMethod];
    v65 = 0;
    if (v161 == 3) {
      goto LABEL_95;
    }
  }
  if ([v65 irisVISMethod] == 5) {
    goto LABEL_95;
  }
  BOOL v66 = 0;
LABEL_97:
  if (*(unsigned char *)(v430 + 152))
  {
    v63 &= !v66;
    v64 &= !v66;
  }
  if (v423) {
    char v384 = *(unsigned char *)(v423 + 141) != 0;
  }
  else {
    char v384 = 0;
  }
  uint64_t v67 = [v425 movieFileSinkPipelineConfiguration];
  if (v67)
  {
    char v68 = *(unsigned char *)(v67 + 195) ? v63 : 1;
    if ((v68 & 1) == 0)
    {
      v69 = [BWSmartStyleApplyNode alloc];
      uint64_t v70 = [v425 movieFileSinkPipelineConfiguration];
      if (v70) {
        uint64_t v71 = *(unsigned int *)(v70 + 200);
      }
      else {
        uint64_t v71 = 0;
      }
      v72 = [(BWSmartStyleApplyNode *)v69 initWithMetalCommandQueue:0 renderingMethod:v71];
      if (!v72)
      {
        FigDebugAssert3();
        unsigned int v479 = -12786;
        goto LABEL_611;
      }
      v73 = v72;
      [(BWNode *)v72 setName:@"SmartStyle Movie File Apply"];
      uint64_t v74 = [v425 movieFileSinkPipelineConfiguration];
      if (v74) {
        uint64_t v75 = *(unsigned int *)(v74 + 144);
      }
      else {
        uint64_t v75 = 0;
      }
      [(BWSmartStyleApplyNode *)v73 setMaxLossyCompressionLevel:v75];
      if (([v416 addNode:v73 error:&v478] & 1) == 0
        || (objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", v435, -[BWNode input](v73, "input"), v401) & 1) == 0)
      {
        goto LABEL_610;
      }
      uint64_t v435 = [(BWNode *)v73 output];
    }
  }
  uint64_t v76 = v423;
  if (v63)
  {
    if (v423)
    {
      v77 = v416;
      unsigned int v78 = v414;
      if ((*(_DWORD *)(v423 + 104) - 3) > 1) {
        v366 = 0;
      }
      else {
        v366 = +[BWPipelineStage pipelineStageWithName:priority:](BWPipelineStage, "pipelineStageWithName:priority:", objc_msgSend(NSString, "stringWithFormat:", @"com.apple.coremedia.capture.moviefile.post-isp-digital-zoom.tail.%d", v418), 14);
      }
      v87 = *(void **)(v423 + 16);
    }
    else
    {
      v366 = 0;
      v87 = 0;
      v77 = v416;
      unsigned int v78 = v414;
    }
    int v88 = objc_msgSend((id)objc_msgSend(v87, "irisSinkConfiguration"), "semanticStyleRenderingEnabled");
    unsigned __int8 v89 = v88;
    if (v88)
    {
      v90 = [[BWInferenceNode alloc] initWithConvEngineSupportWithCaptureDevice:a7 scheduler:a8 priority:13];
      -[BWNode setName:](v90, "setName:", objc_msgSend(NSString, "stringWithFormat:", @"Tail Pipeline %d Person Segmentation Inference Node", v418));
      if (([v77 addNode:v90 error:&v478] & 1) == 0) {
        goto LABEL_610;
      }
      v91 = [(BWInferenceConfiguration *)[BWStreamingPersonSegmentationConfiguration alloc] initWithInferenceType:105];
      [(BWStreamingPersonSegmentationConfiguration *)v91 setInputRotationAngle:0];
      [(BWStreamingPersonSegmentationConfiguration *)v91 setPropagateColorInput:0];
      LODWORD(v92) = 10.0;
      [(BWInferenceConfiguration *)v91 setMaximumFramesPerSecond:v92];
      [(BWInferenceConfiguration *)v91 setPropagatesFrameRatePrevention:1];
      [(BWStreamingPersonSegmentationConfiguration *)v91 setUseLowFrameRateOptimizedNetwork:1];
      [(BWInferenceNode *)v90 addInferenceOfType:105 version:BWInferenceVersionMakeMajor(1) & 0xFFFFFFFFFFFFLL configuration:v91];

      v93 = [(BWInferenceConfiguration *)[BWOpticalFlowInferenceConfiguration alloc] initWithInferenceType:117];
      [(BWOpticalFlowInferenceConfiguration *)v93 setInputDimensions:0xC000000100];
      [(BWOpticalFlowInferenceConfiguration *)v93 setOutputDimensions:0xC000000100];
      [(BWOpticalFlowInferenceConfiguration *)v93 setConcurrencyWidth:2];
      [(BWOpticalFlowInferenceConfiguration *)v93 setAttachedMediaKeyForPropagatedColorInput:0x1EFA6A440];
      [(BWInferenceNode *)v90 addInferenceOfType:117 version:BWInferenceVersionMakeMajor(1) & 0xFFFFFFFFFFFFLL configuration:v93];

      if ((objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", v435, -[BWNode input](v90, "input"), v401) & 1) == 0) {
        goto LABEL_610;
      }
      uint64_t v94 = [(BWNode *)v90 output];
      v95 = -[BWPersonSegmentationFilteringNode initWithGPUPriority:frameRateUpsamplingEnabled:metalCommandQueue:]([BWPersonSegmentationFilteringNode alloc], "initWithGPUPriority:frameRateUpsamplingEnabled:metalCommandQueue:", 1, 1, -[FigCaptureMovieFileSinkTailPipeline _metalCommandQueueWithName:priority:](v430));
      -[BWNode setName:](v95, "setName:", objc_msgSend(NSString, "stringWithFormat:", @"Tail Pipeline %d Person Segmentation Filtering Node", v418));
      if (([v77 addNode:v95 error:&v478] & 1) == 0) {
        goto LABEL_610;
      }
      v96 = &OBJC_IVAR___BWPreviewStitcherNode__wantWideFallbackDueToTeleAEAF;
      if ((objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", v94, -[BWNode input](v95, "input"), v401) & 1) == 0) {
        goto LABEL_610;
      }
      uint64_t v435 = [(BWNode *)v95 output];
      if (!v78) {
        goto LABEL_139;
      }
    }
    else
    {
      v96 = &OBJC_IVAR___BWPreviewStitcherNode__wantWideFallbackDueToTeleAEAF;
      if (!v78) {
        goto LABEL_139;
      }
    }
    v97 = [BWStereoVideoMetadataNode alloc];
    v98 = -[BWStereoVideoMetadataNode initWithPorts:secondaryPort:cameraInfoByPortType:errStatus:](v97, "initWithPorts:secondaryPort:cameraInfoByPortType:errStatus:", *MEMORY[0x1E4F52DD8], *MEMORY[0x1E4F52DE8], [a7 cameraInfoByPortType], &v479);
    if (!v98) {
      goto LABEL_610;
    }
    v99 = v98;
    [(BWNode *)v98 setName:@"Stereo Video Metadata Node"];
    if (([v416 addNode:v99 error:&v478] & 1) == 0) {
      goto LABEL_610;
    }
    v96 = &OBJC_IVAR___BWPreviewStitcherNode__wantWideFallbackDueToTeleAEAF;
    if ((objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", v435, -[BWNode input](v99, "input"), v401) & 1) == 0) {
      goto LABEL_610;
    }
    uint64_t v435 = [(BWNode *)v99 output];
LABEL_139:
    if (v66) {
      int v100 = 3;
    }
    else {
      int v100 = 0;
    }
    if (v49 | v60) {
      int v101 = v100;
    }
    else {
      int v101 = 3;
    }
    if (*(unsigned char *)(v430 + v96[171])) {
      int v102 = 4;
    }
    else {
      int v102 = v101;
    }
    v103 = [FigCaptureVISPipeline alloc];
    uint64_t v104 = objc_msgSend(NSString, "stringWithFormat:", @"Tail %d VIS Pipeline", v418);
    if (v423)
    {
      unsigned int v105 = *(_DWORD *)(v423 + 104);
      unsigned int v106 = *(_DWORD *)(v423 + 112);
      float v107 = *(float *)(v423 + 164);
      unsigned int v108 = *(_DWORD *)(v423 + 168);
    }
    else
    {
      unsigned int v105 = 0;
      unsigned int v106 = 0;
      unsigned int v108 = 0;
      float v107 = 0.0;
    }
    v56 = v425;
    uint64_t v109 = [v425 movieFileSinkPipelineConfiguration];
    if (v109) {
      uint64_t v110 = *(void *)(v109 + 96);
    }
    else {
      uint64_t v110 = 0;
    }
    uint64_t v111 = v423;
    if (v423)
    {
      unsigned int v112 = *(_DWORD *)(v423 + 144);
      unsigned __int8 v113 = *(unsigned char *)(v423 + 148) != 0;
      unsigned __int8 v114 = *(unsigned char *)(v423 + 149) != 0;
      char v115 = *(unsigned char *)(v423 + 192) != 0;
      unsigned __int8 v116 = *(unsigned char *)(v423 + 195) != 0;
      unsigned __int8 v117 = *(unsigned char *)(v423 + 196) != 0;
      unsigned __int8 v118 = *(unsigned char *)(v423 + 194) != 0;
      v119 = *(void **)(v423 + 128);
      uint64_t v111 = *(void *)(v423 + 152);
    }
    else
    {
      v119 = 0;
      unsigned __int8 v117 = 0;
      char v115 = 0;
      unsigned __int8 v113 = 0;
      unsigned int v112 = 0;
      unsigned __int8 v114 = 0;
      unsigned __int8 v116 = 0;
      unsigned __int8 v118 = 0;
    }
    int v348 = v102;
    v43 = v416;
    v120 = -[FigCaptureVISPipeline initWithUpstreamOutput:graph:name:parentPipeline:videoCaptureConnectionConfiguration:pipelineStage:sdofPipelineStage:videoStabilizationType:motionAttachmentsSource:fillExtendedRowsOfOutputBuffer:overCaptureEnabled:stereoMode:videoStabilizationOverscanOverride:videoStabilizationStrength:motionMetadataPreloadingEnabled:visExecutionMode:pipelineTraceID:captureDevice:outputDimensions:P3ToBT2020ConversionEnabled:stabilizeDepthAttachments:outputDepthDimensions:maxLossyCompressionLevel:videoSTFEnabled:videoGreenGhostMitigationEnabled:lightSourceMaskAndKeypointDescriptorDataEnabled:personSegmentationRenderingEnabled:smartStyleRenderingEnabled:smartStyleReversibilityEnabled:lowResImageUsedByVideoEncoderEnabled:portTypesWithGeometricDistortionCorrectionInVISEnabled:visProcessingSemaphore:](v103, v435, a5, v107, v104, v416, v406, v401, v375, v105, v106, v381, v397, v414, v108, 0, v348, 0x51u, a7,
             v110,
             v384,
             v389,
             v390,
             v112,
             v113,
             v114,
             v115,
             v89,
             v116,
             v117,
             v118,
             v119,
             v111);
    v121 = &OBJC_IVAR___BWPreviewStitcherNode__wantWideFallbackDueToTeleAEAF;
    uint64_t v14 = v430;
    *(void *)(v430 + 40) = v120;
    if (!v120)
    {
      FigDebugAssert3();
      unsigned int v479 = FigSignalErrorAt();
      goto LABEL_611;
    }
    uint64_t v122 = [(id)-[FigCaptureVISPipeline visNode]((uint64_t)v120) output];
    uint64_t v368 = [(id)-[FigCaptureVISPipeline sdofVISNode](*(void *)(v430 + 40)) output];
    if (v414)
    {
      v123 = [BWAttachedMediaSwapNode alloc];
      uint64_t v488 = *MEMORY[0x1E4F55CD8];
      v124 = -[BWAttachedMediaSwapNode initWithPrimaryFormatToAttachedMediaKey:attachedMediaKeyToPrimaryFormat:sampleBufferAttachmentsToTransfer:generatesDroppedSampleMarkerBuffers:](v123, "initWithPrimaryFormatToAttachedMediaKey:attachedMediaKeyToPrimaryFormat:sampleBufferAttachmentsToTransfer:generatesDroppedSampleMarkerBuffers:", 0x1EFA43D40, @"SynchronizedSlaveFrame", [MEMORY[0x1E4F1C978] arrayWithObjects:&v488 count:1], 0);
      if (!v124) {
        goto LABEL_610;
      }
      v125 = v124;
      [(BWNode *)v124 setName:@"Swap Primary and Synchronized Slave"];
      if (([v416 addNode:v125 error:&v478] & 1) == 0
        || (objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", v122, -[BWNode input](v125, "input"), v377) & 1) == 0)
      {
        goto LABEL_610;
      }
      uint64_t v126 = [(BWNode *)v125 output];
      v127 = [FigCaptureVISPipeline alloc];
      uint64_t v128 = objc_msgSend(NSString, "stringWithFormat:", @"Tail %d stereo video companion VIS Pipeline", v418);
      if (v423)
      {
        unsigned int v129 = *(_DWORD *)(v423 + 104);
        unsigned int v130 = *(_DWORD *)(v423 + 112);
        float v131 = *(float *)(v423 + 164);
        unsigned int v132 = *(_DWORD *)(v423 + 168);
      }
      else
      {
        unsigned int v129 = 0;
        unsigned int v130 = 0;
        unsigned int v132 = 0;
        float v131 = 0.0;
      }
      uint64_t v133 = [v425 movieFileSinkPipelineConfiguration];
      uint64_t v134 = v133 ? *(void *)(v133 + 96) : 0;
      v135 = (void *)v423;
      if (v423)
      {
        unsigned int v136 = *(_DWORD *)(v423 + 144);
        unsigned __int8 v137 = *(unsigned char *)(v423 + 148) != 0;
        unsigned __int8 v138 = *(unsigned char *)(v423 + 149) != 0;
        unsigned __int8 v139 = *(unsigned char *)(v423 + 195) != 0;
        unsigned __int8 v140 = *(unsigned char *)(v423 + 196) != 0;
        unsigned __int8 v141 = *(unsigned char *)(v423 + 194) != 0;
        v135 = *(void **)(v423 + 128);
      }
      else
      {
        unsigned __int8 v141 = 0;
        unsigned __int8 v139 = 0;
        unsigned __int8 v137 = 0;
        unsigned int v136 = 0;
        unsigned __int8 v138 = 0;
        unsigned __int8 v140 = 0;
      }
      v142 = -[FigCaptureVISPipeline initWithUpstreamOutput:graph:name:parentPipeline:videoCaptureConnectionConfiguration:pipelineStage:sdofPipelineStage:videoStabilizationType:motionAttachmentsSource:fillExtendedRowsOfOutputBuffer:overCaptureEnabled:stereoMode:videoStabilizationOverscanOverride:videoStabilizationStrength:motionMetadataPreloadingEnabled:visExecutionMode:pipelineTraceID:captureDevice:outputDimensions:P3ToBT2020ConversionEnabled:stabilizeDepthAttachments:outputDepthDimensions:maxLossyCompressionLevel:videoSTFEnabled:videoGreenGhostMitigationEnabled:lightSourceMaskAndKeypointDescriptorDataEnabled:personSegmentationRenderingEnabled:smartStyleRenderingEnabled:smartStyleReversibilityEnabled:lowResImageUsedByVideoEncoderEnabled:portTypesWithGeometricDistortionCorrectionInVISEnabled:visProcessingSemaphore:](v127, v126, a5, v131, v128, v416, v406, v377, 0, v129, v130, v381, 0, 2u, v132, 0, 0, 0x51u, a7,
               v134,
               0,
               0,
               0,
               v136,
               v137,
               v138,
               0,
               0,
               v139,
               v140,
               v141,
               v135,
               0);
      uint64_t v14 = v430;
      *(void *)(v430 + 48) = v142;
      uint64_t v143 = [(id)-[FigCaptureVISPipeline visNode]((uint64_t)v142) output];
      v144 = [[BWAttachedMediaSwapNode alloc] initWithPrimaryFormatToAttachedMediaKey:@"SynchronizedSlaveFrame" attachedMediaKeyToPrimaryFormat:0x1EFA43D40 sampleBufferAttachmentsToTransfer:0 generatesDroppedSampleMarkerBuffers:0];
      if (!v144) {
        goto LABEL_610;
      }
      v145 = v144;
      [(BWNode *)v144 setName:@"Unswap Primary and Synchronized Slave"];
      v56 = v425;
      v57 = (void *)v386;
      uint64_t v36 = v418;
      v121 = &OBJC_IVAR___BWPreviewStitcherNode__wantWideFallbackDueToTeleAEAF;
      if (([v416 addNode:v145 error:&v478] & 1) == 0
        || (objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", v143, -[BWNode input](v145, "input"), v377) & 1) == 0)
      {
        goto LABEL_610;
      }
      uint64_t v59 = [(BWNode *)v145 output];
      v43 = v416;
      if (!v46) {
        goto LABEL_174;
      }
    }
    else
    {
      v57 = (void *)v386;
      uint64_t v36 = v418;
      uint64_t v59 = v122;
      if (!v46)
      {
LABEL_174:
        if (v423)
        {
          if ((*(_DWORD *)(v423 + 104) - 3) <= 1)
          {
            uint64_t v147 = [(id)-[FigCaptureVISPipeline visNode](*(void *)(v14 + v121[157])) outputDimensions];
            uint64_t v148 = v59;
            uint64_t v149 = v36;
            v150 = *(void **)(v423 + 16);
            [(id)v14 name];
            v151 = v150;
            uint64_t v36 = v149;
            uint64_t v59 = mfsp_buildMovieFileScalerNode(v151, v148, v372, v147, a5, v43, (uint64_t)v366, (void *)(v14 + 32), v384, *(_DWORD *)(v423 + 144));
          }
          BOOL v58 = v369;
          BOOL v371 = v371;
          goto LABEL_178;
        }
        uint64_t v435 = v59;
        BOOL v371 = v371;
        int v385 = [v56 vitalityScoringEnabled];
        int v160 = 0;
LABEL_235:
        BOOL v58 = v369;
        goto LABEL_243;
      }
    }
    if (!*(unsigned char *)(v14 + 152))
    {
      uint64_t v146 = -[FigCaptureMovieFileSinkTailPipeline _appendBackPressureNodeToPreviousVideoOutput:graph:parentPipeline:pipelineStage:nodeName:backPressureNodeOut:]((void *)v14, v59, a5, v43, (uint64_t)v351, @"Iris Intermediate JPEG Decompression Back Pressure", (void *)(v14 + 88));
      if (!v146) {
        goto LABEL_610;
      }
      uint64_t v59 = v146;
      BOOL v371 = 0;
    }
    goto LABEL_174;
  }
  if (!v64)
  {
    uint64_t v14 = v430;
    v56 = v425;
    v57 = (void *)v386;
    v43 = v416;
    uint64_t v36 = v418;
    BOOL v58 = v369;
    uint64_t v59 = v435;
    goto LABEL_189;
  }
  uint64_t v14 = v430;
  v56 = v425;
  uint64_t v79 = v418;
  if (CFPreferenceNumberWithDefault)
  {
    v80 = objc_msgSend((id)-[__CFString sourceConfiguration](v406, "sourceConfiguration"), "requiredFormat");
    int v81 = objc_msgSend((id)-[__CFString sourceConfiguration](v406, "sourceConfiguration"), "imageControlMode");
    unsigned int v82 = [v80 horizontalSensorBinningFactor];
    unsigned int v83 = [v80 verticalSensorBinningFactor];
    [v80 maxSupportedFrameRate];
    if (v423) {
      unsigned int v85 = *(_DWORD *)(v423 + 112);
    }
    else {
      unsigned int v85 = 0;
    }
    uint64_t v86 = FigCaptureBuildMotionAttachmentsNode(v416, v435, v82, v83, v401, v85, [a7 sensorIDDictionaryByPortType], objc_msgSend(a7, "cameraInfoByPortType"), v84, objc_msgSend(a7, "activePortTypes"), v81 == 4, objc_msgSend(v379, "optimizesImagesForOfflineVideoStabilization"), 1, 0, &v479);
    if (v479) {
      goto LABEL_610;
    }
    uint64_t v435 = v86;
    uint64_t v14 = v430;
    uint64_t v76 = v423;
    v56 = v425;
    v43 = v416;
    uint64_t v79 = v418;
  }
  else
  {
    v43 = v416;
  }
  uint64_t v153 = v79;
  if (v76)
  {
    v154 = *(void **)(v76 + 16);
    uint64_t v155 = v76;
    [(id)v14 name];
    unsigned int v156 = *(_DWORD *)(v155 + 144);
  }
  else
  {
    [(id)v14 name];
    v154 = 0;
    unsigned int v156 = 0;
  }
  uint64_t v157 = mfsp_buildMovieFileScalerNode(v154, v435, v372, v45, a5, v43, (uint64_t)v401, (void *)(v14 + 32), v384, v156);
  objc_msgSend(v46, "setDownstreamIsSharingOutputPool:", objc_msgSend(*(id *)(v14 + 32), "passesBuffersThroughWhenPossible") | objc_msgSend(v46, "downstreamIsSharingOutputPool"));
  if ([*(id *)(v14 + 32) passesBuffersThroughWhenPossible])
  {
    v57 = (void *)v386;
    BOOL v58 = v369;
    uint64_t v36 = v153;
LABEL_188:
    uint64_t v59 = v157;
    goto LABEL_189;
  }
  v57 = (void *)v386;
  uint64_t v36 = v153;
  if (!v46)
  {
    BOOL v58 = v369;
    goto LABEL_188;
  }
  uint64_t v158 = -[FigCaptureMovieFileSinkTailPipeline _appendBackPressureNodeToPreviousVideoOutput:graph:parentPipeline:pipelineStage:nodeName:backPressureNodeOut:]((void *)v14, v157, a5, v43, (uint64_t)v351, @"Iris Intermediate JPEG Decompression Back Pressure", (void *)(v14 + 88));
  if (!v158) {
    goto LABEL_610;
  }
  uint64_t v59 = v158;
  BOOL v371 = 0;
  BOOL v58 = v369;
LABEL_189:
  int v385 = [v56 vitalityScoringEnabled];
  uint64_t v368 = 0;
  uint64_t v152 = v423;
  if (!v423)
  {
    uint64_t v435 = v59;
    goto LABEL_242;
  }
LABEL_190:
  uint64_t v435 = v59;
  if (!*(unsigned char *)(v152 + 108))
  {
LABEL_242:
    int v160 = 0;
    goto LABEL_243;
  }
  v159 = (void *)[v56 movieFileSinkPipelineConfiguration];
  if (v159) {
    v159 = (void *)v159[5];
  }
  int v160 = [v159 count];
LABEL_243:
  unsigned int v382 = v410 | v395;
  if (v410 | v395) {
    int v162 = 2;
  }
  else {
    int v162 = 1;
  }
  int v350 = v162 + v58 + IsHDR + v385;
  uint64_t v163 = (v350 + v160);
  if (v163 < 2)
  {
    v164 = 0;
  }
  else
  {
    v164 = [[BWFanOutNode alloc] initWithFanOutCount:v163 mediaType:1986618469];
    if (([v43 addNode:v164 error:&v478] & 1) == 0
      || (objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", v435, -[BWNode input](v164, "input"), obj) & 1) == 0)
    {
      goto LABEL_610;
    }
    uint64_t v435 = [(NSArray *)[(BWNode *)v164 outputs] objectAtIndexedSubscript:(v163 - 1)];
  }
  v402 = v164;
  if (v382)
  {
    v165 = v164;
    uint64_t v166 = v36;
    uint64_t v167 = [(NSArray *)[(BWNode *)v165 outputs] objectAtIndexedSubscript:0];
    id v168 = [[BWCameraInfoMetadataNode alloc] initForLivePhotosMetadata:v410 generateDebugMetadata:v395];
    if (([v43 addNode:v168 error:&v478] & 1) == 0
      || (objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", v167, objc_msgSend(v168, "input"), obj) & 1) == 0)
    {
      goto LABEL_610;
    }
    uint64_t v360 = [v168 boxedMetadataOutput];
    unsigned int v411 = 1;
    uint64_t v36 = v166;
    v164 = v402;
  }
  else
  {
    uint64_t v360 = 0;
    unsigned int v411 = 0;
  }
  if (IsHDR)
  {
    v169 = v164;
    uint64_t v170 = v36;
    uint64_t v171 = [(NSArray *)[(BWNode *)v169 outputs] objectAtIndexedSubscript:v411];
    v172 = objc_alloc_init(BWVideoPlaybackSupportMetadataNode);
    if (([v43 addNode:v172 error:&v478] & 1) == 0
      || (objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", v171, -[BWNode input](v172, "input"), obj) & 1) == 0)
    {
      goto LABEL_610;
    }
    ++v411;
    uint64_t v367 = [(BWVideoPlaybackSupportMetadataNode *)v172 boxedMetadataOutput];
    uint64_t v36 = v170;
    v164 = v402;
    if (!v58) {
      goto LABEL_260;
    }
  }
  else
  {
    uint64_t v367 = 0;
    if (!v58)
    {
LABEL_260:
      uint64_t v365 = 0;
      goto LABEL_265;
    }
  }
  v173 = v164;
  uint64_t v174 = v36;
  uint64_t v175 = [(NSArray *)[(BWNode *)v173 outputs] objectAtIndexedSubscript:v411];
  v176 = objc_alloc_init(BWSmartStyleInfoMetadataNode);
  if (([v43 addNode:v176 error:&v478] & 1) == 0
    || (objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", v175, -[BWNode input](v176, "input"), obj) & 1) == 0)
  {
    goto LABEL_610;
  }
  ++v411;
  uint64_t v365 = [(BWSmartStyleInfoMetadataNode *)v176 boxedMetadataOutput];
  uint64_t v36 = v174;
  v164 = v402;
LABEL_265:
  uint64_t v177 = [v56 movieFileSinkPipelineConfiguration];
  unint64_t v376 = v389 + (unint64_t)v58 + v382 + IsHDR + v392;
  if (v177 && v160 && *(void *)(v177 + 40))
  {
    id v473 = 0;
    unsigned int v479 = -[FigCaptureMovieFileSinkTailPipeline _buildFaceDetectionNode:parentPipeline:objectDetectionSourceOutput:faceDetectionNodeOut:](v14, (void *)[v56 movieFileSinkPipelineConfiguration], v43, (uint64_t)-[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v164, "outputs"), "objectAtIndexedSubscript:", v411), &v473);
    if (v479) {
      goto LABEL_610;
    }
    id v178 = (id)MEMORY[0x1E4F1CBF0];
    ++v411;
    if (v380) {
      v179 = (void *)v380;
    }
    else {
      v179 = (void *)MEMORY[0x1E4F1CBF0];
    }
    if (v420) {
      id v178 = v420;
    }
    id v421 = v178;
    v180 = (void *)[MEMORY[0x1E4F1CA48] array];
    v181 = (void *)[MEMORY[0x1E4F1CA48] array];
    v396 = v179;
    uint64_t v182 = [v179 count];
    long long v469 = 0u;
    long long v470 = 0u;
    long long v471 = 0u;
    long long v472 = 0u;
    id v393 = v473;
    v183 = (void *)[v473 boxedMetadataOutputs];
    uint64_t v184 = [v183 countByEnumeratingWithState:&v469 objects:v487 count:16];
    if (v184)
    {
      uint64_t v185 = v184;
      uint64_t v186 = *(void *)v470;
      do
      {
        for (uint64_t j = 0; j != v185; ++j)
        {
          if (*(void *)v470 != v186) {
            objc_enumerationMutation(v183);
          }
          [v180 addObject:*(void *)(*((void *)&v469 + 1) + 8 * j)];
          objc_msgSend(v181, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v182 + j));
        }
        uint64_t v185 = [v183 countByEnumeratingWithState:&v469 objects:v487 count:16];
        v182 += j;
      }
      while (v185);
    }
    uint64_t v380 = [v396 arrayByAddingObjectsFromArray:v180];
    id v420 = (id)[v421 arrayByAddingObjectsFromArray:v181];
    v376 += objc_msgSend((id)objc_msgSend(v393, "boxedMetadataOutputs"), "count");
    uint64_t v14 = v430;
    v56 = v425;
    v57 = (void *)v386;
    v43 = v416;
    uint64_t v36 = v418;
    unint64_t v188 = 0x1E4F29000;
    v164 = v402;
  }
  else
  {
    unint64_t v188 = 0x1E4F29000uLL;
  }
  if (v385)
  {
    uint64_t v189 = [(NSArray *)[(BWNode *)v164 outputs] objectAtIndexedSubscript:v411];
    uint64_t v190 = v36;
    v191 = +[BWPipelineStage pipelineStageWithName:priority:](BWPipelineStage, "pipelineStageWithName:priority:", objc_msgSend(*(id *)(v188 + 24), "stringWithFormat:", @"com.apple.coremedia.capture.moviefile.metadata.tail.%d", v36), 14);
    v192 = [[BWInferenceBufferingNode alloc] initWithConvEngineSupportWithCaptureDevice:a7 scheduler:a8 priority:13];
    -[BWNode setName:](v192, "setName:", objc_msgSend(*(id *)(v188 + 24), "stringWithFormat:", @"Tail Pipeline %lu Motion Analysis Inference Node", v190));
    if (v379) {
      [v379 irisMovieDuration];
    }
    else {
      memset(&time, 0, sizeof(time));
    }
    uint64_t v194 = (int)(CMTimeGetSeconds(&time) * 15.0 + 2.0);
    v195 = [[BWInferenceConfiguration alloc] initWithInferenceType:2001];
    LODWORD(v196) = 15.0;
    [(BWInferenceConfiguration *)v195 setMaximumFramesPerSecond:v196];
    [(BWInferenceBufferingNode *)v192 addInferenceOfType:2001 version:BWInferenceVersionMake(1u, 0, 0) & 0xFFFFFFFFFFFFLL configuration:v195 ringBufferCapacity:v194];
    uint64_t v193 = [(BWInferenceBufferingNode *)v192 ringBuffers];
    if (([v416 addNode:v192 error:&v478] & 1) == 0
      || (objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", v189, -[BWNode input](v192, "input"), v191) & 1) == 0)
    {
      goto LABEL_610;
    }
    uint64_t v356 = [(BWNode *)v192 output];
    v43 = v416;
    unint64_t v188 = 0x1E4F29000uLL;
  }
  else
  {
    uint64_t v356 = 0;
    uint64_t v193 = 0;
  }
  id v197 = (id)v435;
  if (v435) {
    unsigned int v198 = v389;
  }
  else {
    unsigned int v198 = 0;
  }
  if (v198 == 1)
  {
    v199 = [[BWRefinedCinematographyNode alloc] initWithAudioEnabled:0];
    -[BWNode setName:](v199, "setName:", [*(id *)(v188 + 24) stringWithFormat:@"%@ %@", objc_msgSend((id)v14, "name"), @"Refined Cinematography"]);
    if (([(id)v14 addNode:v199 error:&v478] & 1) == 0) {
      goto LABEL_610;
    }
    if (([v43 addNode:v199 error:&v478] & 1) == 0) {
      goto LABEL_610;
    }
    if ((objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", v435, -[BWRefinedCinematographyNode videoInput](v199, "videoInput"), obj) & 1) == 0)goto LABEL_610; {
    uint64_t v200 = [(BWRefinedCinematographyNode *)v199 videoOutput];
    }
    v201 = objc_alloc_init(BWCinematicVideoMetadataNode);
    -[BWNode setName:](v201, "setName:", [*(id *)(v188 + 24) stringWithFormat:@"%@ %@", objc_msgSend((id)v14, "name"), @"Cinematic Video Metadata"]);
    if (([(id)v14 addNode:v201 error:&v478] & 1) == 0) {
      goto LABEL_610;
    }
    if (([v416 addNode:v201 error:&v478] & 1) == 0) {
      goto LABEL_610;
    }
    if ((objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", v200, -[BWNode input](v201, "input"), obj) & 1) == 0) {
      goto LABEL_610;
    }
    uint64_t v202 = [(BWCinematicVideoMetadataNode *)v201 passthruOutput];
    uint64_t v357 = [(BWCinematicVideoMetadataNode *)v201 metadataOutput];
    v486[0] = @"PrimaryFormat";
    v486[1] = @"Depth";
    v203 = -[BWAttachedMediaSplitNode initWithAttachedMediaKeys:]([BWAttachedMediaSplitNode alloc], "initWithAttachedMediaKeys:", [MEMORY[0x1E4F1C978] arrayWithObjects:v486 count:2]);
    -[BWNode setName:](v203, "setName:", [*(id *)(v188 + 24) stringWithFormat:@"%@ %@", objc_msgSend((id)v14, "name"), @"Depth/YUV Splitter"]);
    if (([(id)v14 addNode:v203 error:&v478] & 1) == 0) {
      goto LABEL_610;
    }
    v43 = v416;
    if (([v416 addNode:v203 error:&v478] & 1) == 0
      || (objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", v202, -[BWNode input](v203, "input"), obj) & 1) == 0)
    {
      goto LABEL_610;
    }
    id v197 = [(NSArray *)[(BWNode *)v203 outputs] objectAtIndexedSubscript:0];
    [v197 setName:@"Primary"];
    v378 = [(NSArray *)[(BWNode *)v203 outputs] objectAtIndexedSubscript:1];
    [(BWNodeOutput *)v378 setName:@"Depth"];
  }
  else
  {
    uint64_t v357 = 0;
    v378 = 0;
  }
  uint64_t v361 = v193;
  if (!v197)
  {
    v437 = 0;
    uint64_t v210 = 0;
    goto LABEL_326;
  }
  if ([v25 count])
  {
    v204 = (void *)[MEMORY[0x1E4F1CA48] arrayWithObject:@"PrimaryFormat"];
    [v204 addObjectsFromArray:v25];
    v205 = [[BWAttachedMediaSplitNode alloc] initWithAttachedMediaKeys:v204];
    -[BWNode setName:](v205, "setName:", [*(id *)(v188 + 24) stringWithFormat:@"%@ %@", objc_msgSend((id)v14, "name"), @"Smart Style Media Splitter"]);
    [(BWAttachedMediaSplitNode *)v205 setEmitsDroppedSampleForMissingAttachedMedia:1];
    if (([(id)v14 addNode:v205 error:&v478] & 1) == 0
      || ([v43 addNode:v205 error:&v478] & 1) == 0
      || (objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", v197, -[BWNode input](v205, "input"), obj) & 1) == 0)
    {
      goto LABEL_610;
    }
    id v436 = [(NSArray *)[(BWNode *)v205 outputs] objectAtIndexedSubscript:0];
    [v436 setName:@"Primary"];
    v206 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
    if ((unint64_t)[v204 count] >= 2)
    {
      unint64_t v207 = 1;
      do
      {
        id v208 = [(NSArray *)[(BWNode *)v205 outputs] objectAtIndexedSubscript:v207];
        v209 = (void *)[v204 objectAtIndexedSubscript:v207];
        [v208 setName:mfsp_pipelineNameFromSmartStyleAttachedMediaKey(v209)];
        [v206 setObject:v208 forKeyedSubscript:v209];
        ++v207;
      }
      while ([v204 count] > v207);
    }
    if (v436)
    {
      v43 = v416;
      unint64_t v188 = 0x1E4F29000;
      goto LABEL_318;
    }
    v437 = v206;
    uint64_t v210 = 0;
    v43 = v416;
LABEL_326:
    uint64_t v217 = v368;
    goto LABEL_463;
  }
  id v436 = v197;
  v206 = 0;
LABEL_318:
  v412 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithCapacity:0];
  [v412 setObject:v394 forKeyedSubscript:@"AVVideoCodecKey"];
  if (![(__CFString *)v406 outputFormat])
  {
    [v412 setObject:&unk_1EFB05AA8 forKeyedSubscript:@"AVVideoCompressionPropertiesKey"];
    [(__CFString *)v394 isEqualToString:@"hvc1"];
  }
  if (*(unsigned char *)(v14 + 152))
  {
    [v412 setObject:0 forKeyedSubscript:@"AVVideoWidthKey"];
    v211 = v412;
    v212 = 0;
    goto LABEL_332;
  }
  if ((int)[(__CFString *)v406 outputWidth] >= 1
    && (int)[(__CFString *)v406 outputHeight] >= 1)
  {
    v213 = v412;
    objc_msgSend(v412, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", -[__CFString outputWidth](v406, "outputWidth")), @"AVVideoWidthKey");
    v214 = NSNumber;
    uint64_t v215 = [(__CFString *)v406 outputHeight];
    v216 = v214;
LABEL_330:
    v212 = (void *)[v216 numberWithInt:v215];
    v211 = v213;
    goto LABEL_332;
  }
  unint64_t v218 = objc_msgSend((id)objc_msgSend((id)-[__CFString sourceConfiguration](v406, "sourceConfiguration"), "requiredFormat"), "dimensions");
  if ((int)v218 >= 1)
  {
    unint64_t v219 = HIDWORD(v218);
    if (SHIDWORD(v218) >= 1)
    {
      v213 = v412;
      objc_msgSend(v412, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:"), @"AVVideoWidthKey");
      v216 = NSNumber;
      uint64_t v215 = v219;
      goto LABEL_330;
    }
  }
  [v412 setObject:&unk_1EFAFE490 forKeyedSubscript:@"AVVideoWidthKey"];
  v212 = &unk_1EFAFE4A8;
  v211 = v412;
LABEL_332:
  [v211 setObject:v212 forKeyedSubscript:@"AVVideoHeightKey"];
  if (v423) {
    v220 = *(void **)(v423 + 8);
  }
  else {
    v220 = 0;
  }
  objc_msgSend((id)objc_msgSend(v220, "requiredFormat"), "maxSupportedFrameRate");
  int v222 = v221;
  *(_DWORD *)(v14 + 144) = 2;
  if (v414) {
    ++*(_DWORD *)(v14 + 144);
  }
  objc_msgSend(v412, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", *(unsigned int *)(v14 + 144)), @"CVPixelBufferRecyclingSlop");
  if ([(__CFString *)v394 isEqualToString:@"hvc1"]) {
    [v412 setObject:&unk_1EFAFE4C0 forKeyedSubscript:@"AVVideoHEVCExtraRetainedBufferCount"];
  }
  unsigned int v223 = [v56 delayedCompressorCleanupEnabled];
  if (v418 == 1) {
    unsigned int v224 = 0;
  }
  else {
    unsigned int v224 = v223;
  }
  unsigned int v407 = v224;
  v225 = [BWVideoCompressorNode alloc];
  if (v423) {
    uint64_t v227 = *(unsigned int *)(v423 + 144);
  }
  else {
    uint64_t v227 = 0;
  }
  LODWORD(v226) = v222;
  v228 = [(BWVideoCompressorNode *)v225 initWithCompressionSettings:v412 overCaptureEnabled:v418 == 1 stereoVideoCompressionEnabled:v414 maxVideoFrameRate:v407 delayedCompressorCleanupEnabled:v227 maxLossyCompressionLevel:v226];
  if (([v43 addNode:v228 error:&v478] & 1) == 0) {
    goto LABEL_610;
  }
  *(void *)(v14 + 56) = v228;
  [*(id *)(v14 + 56) setName:objc_msgSend(*(id *)(v188 + 24), "stringWithFormat:", @"%@ Video Compressor", objc_msgSend((id)v14, "name"))];
  if (v418 == 1) {
    int v229 = 82;
  }
  else {
    int v229 = 81;
  }
  unsigned int v403 = v229;
  objc_msgSend(*(id *)(v14 + 56), "setPipelineTraceID:");
  if (v423)
  {
    [*(id *)(v14 + 56) setMaximumAllowedInFlightCompressedBytes:*(void *)(v423 + 184)];
    id v230 = v436;
    if (*(int *)(v423 + 168) < 3 || *(unsigned char *)(v14 + 152))
    {
      if (!v414) {
        goto LABEL_353;
      }
    }
    else
    {
      [*(id *)(v14 + 56) setCompressionDimensionsFromInputEnabled:1];
      if (!v414) {
        goto LABEL_353;
      }
    }
  }
  else
  {
    [*(id *)(v14 + 56) setMaximumAllowedInFlightCompressedBytes:0];
    id v230 = v436;
    if (!v414) {
      goto LABEL_353;
    }
  }
  LODWORD(v473) = 0;
  unsigned int v479 = BWStereoUtilitiesComputeStereoBaseline(*MEMORY[0x1E4F52DD8], *MEMORY[0x1E4F52DE8], (void *)[a7 cameraInfoByPortType], (float *)&v473);
  if (v479) {
    goto LABEL_610;
  }
  LODWORD(v231) = v473;
  [*(id *)(v14 + 56) setStereoVideoBaseline:v231];
LABEL_353:
  if (v397) {
    [*(id *)(v14 + 56) setPrioritizeEncodingSpeedOverQuality:1];
  }
  if ((objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", v230, objc_msgSend(*(id *)(v14 + 56), "input"), obj) & 1) == 0) {
    goto LABEL_610;
  }
  uint64_t v373 = [*(id *)(v14 + 56) output];
  if (v378)
  {
    v232 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v412];
    objc_msgSend(v232, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", v390), @"AVVideoWidthKey");
    objc_msgSend(v232, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", v353), @"AVVideoHeightKey");
    v233 = [BWVideoCompressorNode alloc];
    if (v423) {
      uint64_t v235 = *(unsigned int *)(v423 + 144);
    }
    else {
      uint64_t v235 = 0;
    }
    LODWORD(v234) = v222;
    v236 = [(BWVideoCompressorNode *)v233 initWithCompressionSettings:v232 overCaptureEnabled:v418 == 1 stereoVideoCompressionEnabled:0 maxVideoFrameRate:v407 delayedCompressorCleanupEnabled:v235 maxLossyCompressionLevel:v234];
    -[BWNode setName:](v236, "setName:", [*(id *)(v188 + 24) stringWithFormat:@"%@ Depth Compressor", objc_msgSend((id)v14, "name")]);
    [(BWVideoCompressorNode *)v236 setAlternateCompressionSettingsKey:0x1EFA731E0];
    if (([v43 addNode:v236 error:&v478] & 1) == 0
      || (objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", v378, -[BWNode input](v236, "input"), v352) & 1) == 0)
    {
      goto LABEL_610;
    }
    v378 = [(BWNode *)v236 output];
    *(void *)(v14 + 72) = v236;
  }
  else
  {
    v378 = 0;
  }
  long long v466 = 0u;
  long long v467 = 0u;
  long long v464 = 0u;
  long long v465 = 0u;
  v437 = v206;
  id obja = (id)[v206 allKeys];
  uint64_t v237 = [obja countByEnumeratingWithState:&v464 objects:v485 count:16];
  if (v237)
  {
    uint64_t v238 = v237;
    uint64_t v239 = *(void *)v465;
LABEL_365:
    uint64_t v240 = 0;
    while (1)
    {
      if (*(void *)v465 != v239) {
        objc_enumerationMutation(obja);
      }
      v241 = *(void **)(*((void *)&v464 + 1) + 8 * v240);
      v242 = [BWVideoCompressorNode alloc];
      uint64_t v244 = v423 ? *(unsigned int *)(v423 + 144) : 0;
      LODWORD(v243) = v222;
      v245 = [(BWVideoCompressorNode *)v242 initWithCompressionSettings:v412 overCaptureEnabled:v418 == 1 stereoVideoCompressionEnabled:v414 maxVideoFrameRate:v407 delayedCompressorCleanupEnabled:v244 maxLossyCompressionLevel:v243];
      if (([v416 addNode:v245 error:&v478] & 1) == 0) {
        goto LABEL_610;
      }
      -[BWNode setName:](v245, "setName:", [NSString stringWithFormat:@"%@ %@ Compressor", objc_msgSend((id)v14, "name"), mfsp_pipelineNameFromSmartStyleAttachedMediaKey(v241)]);
      [(BWVideoCompressorNode *)v245 setPipelineTraceID:v403];
      if (v423) {
        uint64_t v246 = *(void *)(v423 + 184);
      }
      else {
        uint64_t v246 = 0;
      }
      [(BWVideoCompressorNode *)v245 setMaximumAllowedInFlightCompressedBytes:v246];
      [(BWVideoCompressorNode *)v245 setCompressionDimensionsFromInputEnabled:1];
      char v247 = [v241 isEqualToString:@"HumanFullBodiesMask"];
      uint64_t v248 = 0x1EFA73200;
      if ((v247 & 1) == 0)
      {
        char v249 = [v241 isEqualToString:@"HumanSkinsMask"];
        uint64_t v248 = 0x1EFA73200;
        if ((v249 & 1) == 0)
        {
          char v250 = [v241 isEqualToString:0x1EFA74700];
          uint64_t v248 = 0x1EFA73200;
          if ((v250 & 1) == 0)
          {
            char v251 = [v241 isEqualToString:0x1EFA748E0];
            uint64_t v248 = 0x1EFA73220;
            if ((v251 & 1) == 0)
            {
              if ([v241 isEqualToString:0x1EFA74900]) {
                uint64_t v248 = 0x1EFA73240;
              }
              else {
                uint64_t v248 = 0;
              }
            }
          }
        }
      }
      [(BWVideoCompressorNode *)v245 setAlternateCompressionSettingsKey:v248];
      if ((objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", objc_msgSend(v206, "objectForKeyedSubscript:", v241), -[BWNode input](v245, "input"), objc_msgSend(v431, "objectForKeyedSubscript:", v241)) & 1) == 0)goto LABEL_610; {
      objc_msgSend(v206, "setObject:forKeyedSubscript:", -[BWNode output](v245, "output"), v241);
      }
      uint64_t v14 = v430;
      id v252 = *(id *)(v430 + 80);
      if (!v252)
      {
        id v252 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        *(void *)(v430 + 80) = v252;
      }
      [v252 setObject:v245 forKeyedSubscript:v241];
      if (v238 == ++v240)
      {
        uint64_t v253 = [obja countByEnumeratingWithState:&v464 objects:v485 count:16];
        uint64_t v238 = v253;
        if (v253) {
          goto LABEL_365;
        }
        break;
      }
    }
  }
  if (-[FigCaptureVISPipeline visNode](*(void *)(v14 + 40))) {
    BOOL v254 = *(unsigned char *)(v14 + 152) == 0;
  }
  else {
    BOOL v254 = 0;
  }
  v56 = v425;
  v57 = (void *)v386;
  v43 = v416;
  uint64_t v255 = v418;
  uint64_t v256 = v368;
  BOOL v257 = 0;
  BOOL v404 = v254;
  int v258 = v254 || v370;
  if (v254 || v370)
  {
    v259 = v206;
  }
  else
  {
    v259 = v206;
    if (!v356)
    {
      if (*(void *)(v14 + 32))
      {
        if (v416) {
          uint64_t v260 = [v416[7] irisStagingNode];
        }
        else {
          uint64_t v260 = 0;
        }
        BOOL v257 = v260 != 0;
      }
      else
      {
        BOOL v257 = 0;
      }
    }
  }
  unint64_t v261 = 0x1E5C1E000uLL;
  if (((v371 | v258) & 1) == 0 && !v356 && !v257) {
    goto LABEL_453;
  }
  BOOL objb = v257;
  int v262 = [v259 count];
  int v263 = v350;
  if (v378) {
    int v263 = v350 + 1;
  }
  v264 = [[BWBackPressureNode alloc] initWithNumberOfInputsAndOutputs:(v263 + v262) initialSemaphoreValue:0];
  if (([v416 addNode:v264 error:&v478] & 1) == 0) {
    goto LABEL_610;
  }
  v265 = +[BWPipelineStage pipelineStageWithName:priority:workgroup:](BWPipelineStage, "pipelineStageWithName:priority:workgroup:", objc_msgSend(NSString, "stringWithFormat:", @"com.apple.coremedia.capture.moviefile.post-compressor-backpressure.tail.%d", v418), 14, a10);
  if (v382)
  {
    BOOL v266 = v369;
    uint64_t v268 = v365;
    uint64_t v267 = v367;
    v269 = (void *)v373;
    if ((objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", v360, -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v264, "inputs"), "objectAtIndexedSubscript:", 0), v265) & 1) == 0)goto LABEL_610; {
    uint64_t v360 = [(NSArray *)[(BWNode *)v264 outputs] objectAtIndexedSubscript:0];
    }
    uint64_t v270 = 1;
  }
  else
  {
    uint64_t v270 = 0;
    BOOL v266 = v369;
    uint64_t v268 = v365;
    uint64_t v267 = v367;
    v269 = (void *)v373;
  }
  if (IsHDR)
  {
    if ((objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", v267, -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v264, "inputs"), "objectAtIndexedSubscript:", v270), v265) & 1) == 0)goto LABEL_610; {
    uint64_t v267 = [(NSArray *)[(BWNode *)v264 outputs] objectAtIndexedSubscript:v270++];
    }
  }
  if (v266)
  {
    if ((objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", v268, -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v264, "inputs"), "objectAtIndexedSubscript:", v270), v265) & 1) == 0)goto LABEL_610; {
    uint64_t v268 = [(NSArray *)[(BWNode *)v264 outputs] objectAtIndexedSubscript:v270++];
    }
  }
  if (v385)
  {
    if ((objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", v356, -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v264, "inputs"), "objectAtIndexedSubscript:", v270), v265) & 1) == 0)goto LABEL_610; {
    ++v270;
    }
  }
  if (objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", v269, -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v264, "inputs"), "objectAtIndexedSubscript:", v270), v265))
  {
    uint64_t v271 = objc_msgSend((id)objc_msgSend(v269, "connection"), "pipelineStage");
    if (v271 != objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(v430 + 56), "output"), "connection"), "pipelineStage"))
    {
      uint64_t v346 = v355;
      LODWORD(v344) = 0;
      FigDebugAssert3();
    }
    uint64_t v272 = v270 + 1;
    v432 = v264;
    uint64_t v365 = v268;
    uint64_t v367 = v267;
    uint64_t v373 = [(NSArray *)[(BWNode *)v264 outputs] objectAtIndexedSubscript:v270];
    if (v378)
    {
      if ((objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", v378, -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v264, "inputs"), "objectAtIndexedSubscript:", v270 + 1), v265) & 1) == 0)goto LABEL_610; {
      uint64_t v273 = [(BWNodeConnection *)[(BWNodeOutput *)v378 connection] pipelineStage];
      }
      if (v273 != objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(v430 + 72), "output"), "connection"), "pipelineStage"))
      {
        uint64_t v347 = v355;
        LODWORD(v345) = 0;
        FigDebugAssert3();
      }
      v378 = [(NSArray *)[(BWNode *)v264 outputs] objectAtIndexedSubscript:v270 + 1];
      uint64_t v272 = v270 + 2;
    }
    else
    {
      v378 = 0;
    }
    long long v462 = 0u;
    long long v463 = 0u;
    long long v460 = 0u;
    long long v461 = 0u;
    id v427 = (id)[v437 allKeys];
    uint64_t v274 = [v427 countByEnumeratingWithState:&v460 objects:v484 count:16];
    if (v274)
    {
      uint64_t v275 = v274;
      uint64_t v276 = *(void *)v461;
LABEL_433:
      uint64_t v277 = 0;
      while (1)
      {
        if (*(void *)v461 != v276) {
          objc_enumerationMutation(v427);
        }
        uint64_t v278 = *(void *)(*((void *)&v460 + 1) + 8 * v277);
        if (!objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", objc_msgSend(v437, "objectForKeyedSubscript:", v278), -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v432, "inputs"), "objectAtIndexedSubscript:", v272 + v277), v265))goto LABEL_610; {
        objc_msgSend(v437, "setObject:forKeyedSubscript:", -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v432, "outputs"), "objectAtIndexedSubscript:", v272 + v277++), v278);
        }
        if (v275 == v277)
        {
          uint64_t v275 = [v427 countByEnumeratingWithState:&v460 objects:v484 count:16];
          v272 += v277;
          if (v275) {
            goto LABEL_433;
          }
          break;
        }
      }
    }
    if (v404)
    {
      uint64_t v14 = v430;
      -[BWNode setName:](v432, "setName:", [NSString stringWithFormat:@"%@ VIS Back Pressure", objc_msgSend((id)v430, "name")]);
      *(void *)(v430 + 96) = v432;
      v56 = v425;
      v57 = (void *)v386;
      v43 = v416;
      uint64_t v255 = v418;
      uint64_t v256 = v368;
      unint64_t v261 = 0x1E5C1E000uLL;
      if ([v379 irisMovieCaptureEnabled] && !v349) {
        *(void *)(v430 + 128) = *(void *)(v430 + 32);
      }
      else {
        *(void *)(v430 + 128) = -[FigCaptureVISPipeline visNode](*(void *)(v430 + 40));
      }
      if (v371)
      {
LABEL_452:
        uint64_t v373 = -[FigCaptureMovieFileSinkTailPipeline _appendBackPressureNodeToPreviousVideoOutput:graph:parentPipeline:pipelineStage:nodeName:backPressureNodeOut:]((void *)v14, v373, a5, v43, (uint64_t)v351, @"Iris Intermediate JPEG Decompression Back Pressure", (void *)(v14 + 88));
        if (!v373) {
          goto LABEL_610;
        }
      }
    }
    else
    {
      v56 = v425;
      v57 = (void *)v386;
      v43 = v416;
      uint64_t v255 = v418;
      uint64_t v256 = v368;
      unint64_t v261 = 0x1E5C1E000;
      if (v370)
      {
        uint64_t v14 = v430;
        -[BWNode setName:](v432, "setName:", [NSString stringWithFormat:@"%@ Middle Pipeline VIS Back Pressure", objc_msgSend((id)v430, "name")]);
        *(void *)(v430 + 96) = v432;
        *(void *)(v430 + 128) = -[FigCaptureVISPipeline visNode](objc_msgSend((id)objc_msgSend(v416, "middlePipeline"), "visPipeline"));
        if (v371) {
          goto LABEL_452;
        }
      }
      else
      {
        if (v371)
        {
          uint64_t v14 = v430;
          -[BWNode setName:](v432, "setName:", [NSString stringWithFormat:@"%@ Iris Intermediate JPEG Decompression Back Pressure", objc_msgSend((id)v430, "name")]);
          v279 = v432;
          uint64_t v280 = 88;
        }
        else
        {
          if (v356)
          {
            uint64_t v14 = v430;
            -[BWNode setName:](v432, "setName:", [NSString stringWithFormat:@"%@ Motion Analysius Back Pressure", objc_msgSend((id)v430, "name")]);
            goto LABEL_453;
          }
          if (!objb)
          {
            uint64_t v14 = v430;
            goto LABEL_453;
          }
          uint64_t v14 = v430;
          -[BWNode setName:](v432, "setName:", [NSString stringWithFormat:@"%@ Scaler Back Pressure Node", objc_msgSend((id)v430, "name")]);
          v279 = v432;
          uint64_t v280 = 104;
        }
        *(void *)(v14 + v280) = v279;
      }
    }
LABEL_453:
    if (v256)
    {
      v281 = [BWVideoCompressorNode alloc];
      if (v423) {
        uint64_t v283 = *(unsigned int *)(v423 + 144);
      }
      else {
        uint64_t v283 = 0;
      }
      LODWORD(v282) = v222;
      v284 = [(BWVideoCompressorNode *)v281 initWithCompressionSettings:v412 overCaptureEnabled:v255 == 1 stereoVideoCompressionEnabled:0 maxVideoFrameRate:v407 delayedCompressorCleanupEnabled:v283 maxLossyCompressionLevel:v282];
      if (([v43 addNode:v284 error:&v478] & 1) == 0) {
        goto LABEL_610;
      }
      v285 = v284;
      *(void *)(v14 + 64) = v285;
      if ((objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", v256, -[BWNode input](v285, "input"), v354) & 1) == 0) {
        goto LABEL_610;
      }
      uint64_t v286 = [*(id *)(v14 + 64) output];
      *(void *)(v14 + 112) = (id)[objc_alloc(*(Class *)(v261 + 2000)) initWithNumberOfInputsAndOutputs:1 initialSemaphoreValue:0];
      [*(id *)(v14 + 112) setName:objc_msgSend(NSString, "stringWithFormat:", @"%@ Iris SDOF Back Pressure", objc_msgSend((id)v14, "name"))];
      if (([v416 addNode:*(void *)(v14 + 112) error:&v478] & 1) == 0
        || (objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", v286, objc_msgSend((id)objc_msgSend(*(id *)(v14 + 112), "inputs"), "objectAtIndexedSubscript:", 0), v354) & 1) == 0)
      {
        goto LABEL_610;
      }
      uint64_t v217 = objc_msgSend((id)objc_msgSend(*(id *)(v14 + 112), "outputs"), "objectAtIndexedSubscript:", 0);
      [(id)-[FigCaptureVISPipeline sdofVISNode](*(void *)(v14 + 40)) setName:objc_msgSend(NSString, "stringWithFormat:", @"%@ Iris SDOF VIS", objc_msgSend((id)v14, "name"))];
      [*(id *)(v14 + 64) setName:objc_msgSend(NSString, "stringWithFormat:", @"%@ Iris SDOF Compressor", objc_msgSend((id)v14, "name"))];
      [(id)-[FigCaptureVISPipeline visNode](*(void *)(v14 + 40)) setName:objc_msgSend(NSString, "stringWithFormat:", @"%@ Iris VIS", objc_msgSend((id)v14, "name"))];
      [*(id *)(v14 + 56) setName:objc_msgSend(NSString, "stringWithFormat:", @"%@ Iris Compressor", objc_msgSend((id)v14, "name"))];
      v43 = v416;
    }
    else
    {
      uint64_t v217 = 0;
    }
    uint64_t v210 = v373;
LABEL_463:
    v287 = -[BWQuickTimeMovieFileSinkNode initWithNumberOfVideoInputs:numberOfAuxiliaryPictureInputs:numberOfAudioInputs:numberOfMetadataInputs:cameraInfoByPortType:pipelineIndex:sinkID:]([BWQuickTimeMovieFileSinkNode alloc], "initWithNumberOfVideoInputs:numberOfAuxiliaryPictureInputs:numberOfAudioInputs:numberOfMetadataInputs:cameraInfoByPortType:pipelineIndex:sinkID:", v364, v362 + v389, v363, v376, [a7 cameraInfoByPortType], v418, objc_msgSend(v43, "sinkID"));
    [(BWQuickTimeMovieFileSinkNode *)v287 setIrisMotionAnalysisRingBuffer:v361];
    if (v423) {
      uint64_t v288 = *(void *)(v423 + 176);
    }
    else {
      uint64_t v288 = 0;
    }
    [(BWQuickTimeMovieFileSinkNode *)v287 setClientApplicationID:v288];
    if (v418 == 1) {
      uint64_t v289 = 82;
    }
    else {
      uint64_t v289 = 81;
    }
    [(BWQuickTimeMovieFileSinkNode *)v287 setPipelineTraceID:v289];
    if (v423) {
      uint64_t v290 = *(void *)(v423 + 184);
    }
    else {
      uint64_t v290 = 0;
    }
    [(BWQuickTimeMovieFileSinkNode *)v287 setMaximumAllowedInFlightCompressedBytes:v290];
    if (v379) {
      [v379 irisMovieDuration];
    }
    else {
      memset(&v459, 0, sizeof(v459));
    }
    float v291 = CMTimeGetSeconds(&v459) + 2.0;
    double v292 = v291;
    if (v379) {
      [v379 irisMovieVideoFrameDuration];
    }
    else {
      memset(&v458, 0, sizeof(v458));
    }
    float v293 = ceil(v292 / CMTimeGetSeconds(&v458));
    uint64_t v294 = (int)v293;
    if (v418 == 1) {
      [(BWQuickTimeMovieFileSinkNode *)v287 setupOverCaptureQualityMetricsForLivePhotoHistory:v294];
    }
    if ([v379 irisMovieCaptureEnabled]) {
      [(BWQuickTimeMovieFileSinkNode *)v287 setupRingBufferForStabilizedTrajectoryHomographies:v294];
    }
    if (([v43 addNode:v287 error:&v478] & 1) == 0) {
      goto LABEL_610;
    }
    *(void *)(v14 + 120) = v287;
    [(BWQuickTimeMovieFileSinkNode *)v287 setIrisSampleReferenceMoviesEnabled:0];
    [(BWFileSinkNode *)v287 setRecordingStatusDelegate:a9];
    if (v43) {
      v295 = (void *)[v43[7] videoOrientationMetadataNode];
    }
    else {
      v295 = 0;
    }
    -[BWQuickTimeMovieFileSinkNode setVideoOrientationTimeMachine:](v287, "setVideoOrientationTimeMachine:", [v295 videoOrientationTimeMachine]);
    -[BWNode setName:](v287, "setName:", objc_msgSend(NSString, "stringWithFormat:", @"Tail Pipeline %lu Movie File Sink Node", v418));
    if (v210)
    {
      if ((objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", v210, objc_msgSend((id)objc_msgSend(*(id *)(v14 + 120), "inputs"), "objectAtIndexedSubscript:", 0), objc_msgSend(v56, "movieFilePipelineStage")) & 1) == 0)goto LABEL_610; {
      uint64_t v296 = 1;
      }
      if (v217) {
        goto LABEL_486;
      }
    }
    else
    {
      uint64_t v296 = 0;
      if (v217)
      {
LABEL_486:
        if ((objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", v217, objc_msgSend((id)objc_msgSend(*(id *)(v14 + 120), "inputs"), "objectAtIndexedSubscript:", v296), objc_msgSend(v56, "movieFilePipelineStage")) & 1) == 0)goto LABEL_610; {
        unsigned int v424 = v296;
        }
        uint64_t v296 = (v296 + 1);
LABEL_490:
        [(BWQuickTimeMovieFileSinkNode *)v287 setStereoVideoCaptureEnabled:v414];
        -[BWQuickTimeMovieFileSinkNode setCinematicVideoEnabled:](v287, "setCinematicVideoEnabled:", [a7 cinematicVideoEnabled]);
        if (v378)
        {
          v297 = (void *)v380;
          if ((objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", v378, objc_msgSend((id)objc_msgSend(*(id *)(v14 + 120), "inputs"), "objectAtIndexedSubscript:", v296), objc_msgSend(v56, "movieFilePipelineStage")) & 1) == 0)goto LABEL_610; {
          unsigned int v428 = v296;
          }
          uint64_t v296 = (v296 + 1);
        }
        else
        {
          unsigned int v428 = -1;
          v297 = (void *)v380;
        }
        long long v456 = 0u;
        long long v457 = 0u;
        long long v454 = 0u;
        long long v455 = 0u;
        id v433 = (id)[v437 allKeys];
        uint64_t v298 = [v433 countByEnumeratingWithState:&v454 objects:v483 count:16];
        uint64_t v374 = v210;
        if (v298)
        {
          uint64_t v299 = v298;
          v300 = 0;
          uint64_t v301 = *(void *)v455;
LABEL_496:
          uint64_t v302 = 0;
          uint64_t v303 = (int)v296;
          uint64_t v304 = v296;
          while (1)
          {
            if (*(void *)v455 != v301) {
              objc_enumerationMutation(v433);
            }
            uint64_t v305 = *(void *)(*((void *)&v454 + 1) + 8 * v302);
            if (!objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", objc_msgSend(v437, "objectForKeyedSubscript:", v305), objc_msgSend((id)objc_msgSend(*(id *)(v430 + 120), "inputs"), "objectAtIndexedSubscript:", v303 + v302), objc_msgSend(v425, "movieFilePipelineStage")))goto LABEL_610; {
            objc_msgSend(v441, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", v304 + v302), v305);
            }
            if (!v300) {
              v300 = (void *)[MEMORY[0x1E4F1CA48] array];
            }
            objc_msgSend(v300, "addObject:", objc_msgSend(NSNumber, "numberWithInt:", v304 + v302++));
            if (v299 == v302)
            {
              LODWORD(v296) = v303 + v302;
              uint64_t v299 = [v433 countByEnumeratingWithState:&v454 objects:v483 count:16];
              if (v299) {
                goto LABEL_496;
              }
              uint64_t v296 = (v304 + v302);
              uint64_t v14 = v430;
              v56 = v425;
              v57 = (void *)v386;
              v297 = (void *)v380;
              goto LABEL_506;
            }
          }
        }
        v300 = 0;
LABEL_506:
        if (v358)
        {
          if ((objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", v358, objc_msgSend((id)objc_msgSend(*(id *)(v14 + 120), "inputs"), "objectAtIndexedSubscript:", (int)v296), objc_msgSend(v56, "movieFilePipelineStage")) & 1) == 0)goto LABEL_610; {
          unsigned int v405 = v296;
          }
          uint64_t v296 = (v296 + 1);
          if (v359) {
            goto LABEL_509;
          }
        }
        else
        {
          unsigned int v405 = -1;
          if (v359)
          {
LABEL_509:
            if ((objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", v359, objc_msgSend((id)objc_msgSend(*(id *)(v14 + 120), "inputs"), "objectAtIndexedSubscript:", (int)v296), objc_msgSend(v56, "movieFilePipelineStage")) & 1) == 0)goto LABEL_610; {
            unsigned int v415 = v296;
            }
            uint64_t v296 = (v296 + 1);
LABEL_513:
            if (v357)
            {
              if ((objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", v357, objc_msgSend((id)objc_msgSend(*(id *)(v14 + 120), "inputs"), "objectAtIndexedSubscript:", (int)v296), objc_msgSend(v56, "movieFilePipelineStage")) & 1) == 0)goto LABEL_610; {
              unsigned int v408 = v296;
              }
              uint64_t v296 = (v296 + 1);
            }
            else
            {
              unsigned int v408 = -1;
            }
            if ([v297 count])
            {
              uint64_t v306 = 0;
              while ((objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", objc_msgSend(v297, "objectAtIndexedSubscript:", v306), objc_msgSend((id)objc_msgSend(*(id *)(v14 + 120), "inputs"), "objectAtIndexedSubscript:", (int)v296 + v306), objc_msgSend(v56, "movieFilePipelineStage")) & 1) != 0)
              {
                if (++v306 >= (unint64_t)[v297 count])
                {
                  uint64_t v296 = (v296 + v306);
                  goto LABEL_522;
                }
              }
              goto LABEL_610;
            }
LABEL_522:
            uint64_t v419 = v296;
            if ([v56 indexOfAudioRemixInMetadataOutputs] == -1)
            {
              int v308 = -1;
            }
            else
            {
              int v307 = v296 - [v297 count];
              int v308 = v307 + [v56 indexOfAudioRemixInMetadataOutputs];
            }
            unsigned int v413 = v308;
            uint64_t v309 = [v297 count];
            long long v450 = 0u;
            long long v451 = 0u;
            long long v452 = 0u;
            long long v453 = 0u;
            uint64_t v310 = [v420 countByEnumeratingWithState:&v450 objects:v482 count:16];
            if (v310)
            {
              uint64_t v311 = v310;
              uint64_t v312 = *(void *)v451;
              uint64_t v313 = (int)v296 - v309;
              do
              {
                for (uint64_t k = 0; k != v311; ++k)
                {
                  if (*(void *)v451 != v312) {
                    objc_enumerationMutation(v420);
                  }
                  uint64_t v315 = [*(id *)(*((void *)&v450 + 1) + 8 * k) integerValue];
                  objc_msgSend(v57, "addObject:", objc_msgSend(NSNumber, "numberWithInteger:", v313 + v315));
                }
                uint64_t v311 = [v420 countByEnumeratingWithState:&v450 objects:v482 count:16];
              }
              while (v311);
            }
            if (([v56 indexOfVideoOrientationInMetadataOutputs] & 0x80000000) != 0)
            {
              int v317 = -1;
            }
            else
            {
              int v316 = v296 - [v297 count];
              int v317 = v316 + [v56 indexOfVideoOrientationInMetadataOutputs];
            }
            unsigned int v434 = v317;
            if (v360)
            {
              if ((objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", v360, objc_msgSend((id)objc_msgSend(*(id *)(v14 + 120), "inputs"), "objectAtIndexedSubscript:", (int)v296), objc_msgSend(v56, "movieFilePipelineStage")) & 1) == 0)goto LABEL_610; {
              unsigned int v426 = v296;
              }
              uint64_t v419 = (v296 + 1);
            }
            else
            {
              unsigned int v426 = -1;
            }
            if (v367)
            {
              if ((objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", v367, objc_msgSend((id)objc_msgSend(*(id *)(v14 + 120), "inputs"), "objectAtIndexedSubscript:", (int)v419), objc_msgSend(v56, "movieFilePipelineStage")) & 1) == 0)goto LABEL_610; {
              int v318 = v419;
              }
              uint64_t v419 = (v419 + 1);
              if (v365)
              {
LABEL_542:
                uint64_t v319 = v428;
                if ((objc_msgSend(a5, "connectOutput:toInput:pipelineStage:", v365, objc_msgSend((id)objc_msgSend(*(id *)(v14 + 120), "inputs"), "objectAtIndexedSubscript:", (int)v419), objc_msgSend(v56, "movieFilePipelineStage")) & 1) == 0)goto LABEL_610; {
LABEL_546:
                }
                int v429 = v318;
                [*(id *)(v14 + 120) setNonCriticalAudioVideoTrackInputIndices:v300];
                uint64_t v320 = [v437 count];
                uint64_t v321 = [v437 count];
                v440 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:12];
                id v422 = (id)[MEMORY[0x1E4F1CA48] arrayWithCapacity:10];
                v417 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
                v438 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:2 * v320 + 2];
                v322 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
                v323 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
                v324 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:2 * v321 + 6];
                if (v374)
                {
                  if (v424 != -1 || v319 != -1 || v408 != -1)
                  {
                    uint64_t v325 = [NSNumber numberWithInt:0];
                    if (v424 != -1)
                    {
                      objc_msgSend(v440, "addObject:", objc_msgSend(NSNumber, "numberWithInt:", v424));
                      [v440 addObject:v325];
                    }
                    v326 = v422;
                    if (v319 != -1)
                    {
                      uint64_t v327 = [NSNumber numberWithInt:v319];
                      [v438 addObject:v325];
                      [v438 addObject:v327];
                      [v324 addObject:v327];
                      [v324 addObject:@"com.apple.quicktime.video-map"];
                      [v324 addObject:v327];
                      [v324 addObject:@"com.apple.quicktime.video-map.depth"];
                      if (v408 != -1)
                      {
                        objc_msgSend(v440, "addObject:", objc_msgSend(NSNumber, "numberWithInt:", v408));
                        [v440 addObject:v325];
                        objc_msgSend(v422, "addObject:", objc_msgSend(NSNumber, "numberWithInt:", v408));
                        [v422 addObject:v325];
                        [v324 addObject:v327];
                        [v324 addObject:@"com.apple.quicktime.cinematic-video-map.depth"];
                      }
                    }
                    goto LABEL_561;
                  }
                  if ([v441 count]
                    || v419 != -1
                    || [v57 count]
                    || v434 != -1
                    || v426 != -1)
                  {
                    uint64_t v325 = [NSNumber numberWithInt:0];
                    v326 = v422;
LABEL_561:
                    long long v448 = 0u;
                    long long v449 = 0u;
                    long long v446 = 0u;
                    long long v447 = 0u;
                    uint64_t v328 = [v57 countByEnumeratingWithState:&v446 objects:v481 count:16];
                    if (v328)
                    {
                      uint64_t v329 = v328;
                      uint64_t v330 = *(void *)v447;
                      do
                      {
                        for (uint64_t m = 0; m != v329; ++m)
                        {
                          if (*(void *)v447 != v330) {
                            objc_enumerationMutation(v57);
                          }
                          uint64_t v332 = *(void *)(*((void *)&v446 + 1) + 8 * m);
                          [v440 addObject:v332];
                          [v440 addObject:v325];
                          [v326 addObject:v332];
                          [v326 addObject:v325];
                        }
                        uint64_t v329 = [v57 countByEnumeratingWithState:&v446 objects:v481 count:16];
                      }
                      while (v329);
                    }
                    if (v434 != -1)
                    {
                      objc_msgSend(v440, "addObject:", objc_msgSend(NSNumber, "numberWithInt:", v434));
                      [v440 addObject:v325];
                      objc_msgSend(v326, "addObject:", objc_msgSend(NSNumber, "numberWithInt:", v434));
                      [v326 addObject:v325];
                    }
                    if (v426 != -1)
                    {
                      objc_msgSend(v440, "addObject:", objc_msgSend(NSNumber, "numberWithInt:", v426));
                      [v440 addObject:v325];
                      objc_msgSend(v326, "addObject:", objc_msgSend(NSNumber, "numberWithInt:", v426));
                      [v326 addObject:v325];
                    }
                    v409 = v322;
                    if (v429 != -1)
                    {
                      objc_msgSend(v417, "addObject:", objc_msgSend(NSNumber, "numberWithInt:"));
                      [v417 addObject:v325];
                    }
                    long long v444 = 0u;
                    long long v445 = 0u;
                    long long v442 = 0u;
                    long long v443 = 0u;
                    uint64_t v333 = [v441 countByEnumeratingWithState:&v442 objects:v480 count:16];
                    if (v333)
                    {
                      uint64_t v334 = v333;
                      uint64_t v335 = *(void *)v443;
                      do
                      {
                        for (uint64_t n = 0; n != v334; ++n)
                        {
                          if (*(void *)v443 != v335) {
                            objc_enumerationMutation(v441);
                          }
                          v337 = *(void **)(*((void *)&v442 + 1) + 8 * n);
                          uint64_t v338 = [v441 objectForKeyedSubscript:v337];
                          [v438 addObject:v338];
                          [v438 addObject:v325];
                          [v324 addObject:v338];
                          char v339 = [v337 isEqualToString:@"HumanFullBodiesMask"];
                          v340 = @"com.apple.quicktime.video-map.person";
                          if ((v339 & 1) == 0)
                          {
                            char v341 = [v337 isEqualToString:@"HumanSkinsMask"];
                            v340 = @"com.apple.quicktime.video-map.skin";
                            if ((v341 & 1) == 0)
                            {
                              char v342 = [v337 isEqualToString:0x1EFA74700];
                              v340 = @"com.apple.quicktime.video-map.sky";
                              if ((v342 & 1) == 0)
                              {
                                char v343 = [v337 isEqualToString:0x1EFA748E0];
                                v340 = @"com.apple.quicktime.video-map.smart-style-linear-thumbnail";
                                if ((v343 & 1) == 0)
                                {
                                  if ([v337 isEqualToString:0x1EFA74900]) {
                                    v340 = @"com.apple.quicktime.video-map.smart-style-delta-map";
                                  }
                                  else {
                                    v340 = @"Unknown";
                                  }
                                }
                              }
                            }
                          }
                          [v324 addObject:v340];
                        }
                        uint64_t v334 = [v441 countByEnumeratingWithState:&v442 objects:v480 count:16];
                      }
                      while (v334);
                    }
                    if (v419 != -1)
                    {
                      objc_msgSend(v440, "addObject:", objc_msgSend(NSNumber, "numberWithInt:", v419));
                      [v440 addObject:v325];
                      objc_msgSend(v422, "addObject:", objc_msgSend(NSNumber, "numberWithInt:", v419));
                      [v422 addObject:v325];
                    }
                    v322 = v409;
                    if (v405 != -1 && v415 != -1)
                    {
                      objc_msgSend(v409, "addObject:", objc_msgSend(NSNumber, "numberWithInt:", v415));
                      objc_msgSend(v409, "addObject:", objc_msgSend(NSNumber, "numberWithInt:", v405));
                    }
                    uint64_t v14 = v430;
                    if (v415 != -1 && v413 != -1)
                    {
                      objc_msgSend(v323, "addObject:", objc_msgSend(NSNumber, "numberWithInt:", v413));
                      objc_msgSend(v323, "addObject:", objc_msgSend(NSNumber, "numberWithInt:", v415));
                    }
                  }
                }
                if ([v440 count]) {
                  [*(id *)(v14 + 120) setTrackReferenceListForMetadataInputs:v440];
                }
                if ([v417 count]) {
                  [*(id *)(v14 + 120) setTrackReferenceListForRenderMetadataInputs:v417];
                }
                if ([v422 count]) {
                  [*(id *)(v14 + 120) setStructuralDependentTrackReferenceListForMetadataInputs:v422];
                }
                if ([v438 count]) {
                  [*(id *)(v14 + 120) setTrackReferenceListForVideoInputs:v438];
                }
                if ([v322 count]) {
                  [*(id *)(v14 + 120) setTrackReferenceListForAudioInputs:v322];
                }
                if ([v323 count]) {
                  [*(id *)(v14 + 120) setTrackReferenceListForAudioRemixInputs:v323];
                }
                if ([v324 count]) {
                  [*(id *)(v14 + 120) setTaggedMediaCharacteristicsForInputs:v324];
                }
                goto LABEL_611;
              }
            }
            else
            {
              int v318 = -1;
              if (v365) {
                goto LABEL_542;
              }
            }
            uint64_t v419 = 0xFFFFFFFFLL;
            uint64_t v319 = v428;
            goto LABEL_546;
          }
        }
        unsigned int v415 = -1;
        goto LABEL_513;
      }
    }
    unsigned int v424 = -1;
    goto LABEL_490;
  }
LABEL_610:
  FigDebugAssert3();
LABEL_611:
  result = v479;
  if (!v479)
  {
    if (v478) {
      return [v478 code];
    }
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureMovieFileSinkTailPipeline;
  [(FigCapturePipeline *)&v3 dealloc];
}

- (CGRect)irisVISCleanOutputRectForCLAP
{
  visPipeline = self->_visPipeline;
  if (visPipeline)
  {
    double v3 = -[FigCaptureVISPipeline irisVISCleanOutputRect]((uint64_t)visPipeline);
  }
  else
  {
    double v3 = *MEMORY[0x1E4F1DB28];
    double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- ($2825F4736939C4A6D3AD43837233062D)offlineVISDimensions
{
  if (self->_offlineVISEnabled)
  {
    v2 = [(BWNodeInput *)[(BWNode *)self->_videoCompressorNode input] videoFormat];
    unsigned int v3 = [(BWVideoFormat *)v2 width];
    return ($2825F4736939C4A6D3AD43837233062D)(v3 | ((unint64_t)[(BWVideoFormat *)v2 height] << 32));
  }
  else
  {
    return ($2825F4736939C4A6D3AD43837233062D)0;
  }
}

- (id)_buildFaceDetectionNode:(void *)a3 parentPipeline:(uint64_t)a4 objectDetectionSourceOutput:(void *)a5 faceDetectionNodeOut:
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  v8 = a2;
  uint64_t v21 = 0;
  if (a2) {
    v9 = (void *)a2[5];
  }
  else {
    v9 = 0;
  }
  if ([v9 count])
  {
    int v10 = (void *)[MEMORY[0x1E4F1CA48] array];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    if (v8) {
      v8 = (void *)v8[5];
    }
    uint64_t v11 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend(v10, "addObject:", CMMetadataFormatDescriptionGetIdentifiers((CMMetadataFormatDescriptionRef)objc_msgSend(*(id *)(*((void *)&v17 + 1)+ 8 * i), "formatDescription")));
        }
        uint64_t v12 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v12);
    }
  }
  else
  {
    int v10 = 0;
  }
  id v15 = FigCaptureBuildObjectDetectionPipeline(a3, 0, v10, 0, a4, &v21, 0.0, 0.0, 1.0, 1.0);
  if (v15) {
    FigDebugAssert3();
  }
  else {
    *a5 = v21;
  }
  return v15;
}

- (BOOL)recording
{
  return self->_recording;
}

- (void)setRecording:(BOOL)a3
{
  self->_recording = a3;
}

- (BWMRCSceneObserver)mrcSceneObserver
{
  return self->_mrcSceneObserver;
}

- (void)setMrcSceneObserver:(id)a3
{
  self->_mrcSceneObserver = (BWMRCSceneObserver *)a3;
}

- (FigCaptureVISPipeline)visPipeline
{
  return self->_visPipeline;
}

- (BOOL)sceneClassifierSuspended
{
  return self->_sceneClassifierSuspended;
}

- (void)setSceneClassifierSuspended:(BOOL)a3
{
  self->_sceneClassifierSuspended = a3;
}

@end