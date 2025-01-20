@interface FigCaptureMovieFileSinkPipeline
+ (void)initialize;
- (BOOL)overCaptureEnabled;
- (BOOL)smartStyleReversibilityEnabled;
- (char)initWithConfiguration:(uint64_t)a3 videoSourceCaptureOutput:(uint64_t)a4 audioSourceCaptureOutput:(uint64_t)a5 audioSourceCinematicAudioCaptureOutput:(uint64_t)a6 smartCameraInferenceOutput:(void *)a7 detectedObjectBoxedMetadataOutputs:(uint64_t)a8 objectDetectionSourceOutput:(uint64_t)a9 metadataSourcePipelineOutputs:(uint64_t)a10 graph:(uint64_t)a11 name:(uint64_t)a12 inferenceScheduler:(void *)a13 captureDevice:(uint64_t)a14 audioSourceDelegate:(uint64_t)a15 fileCoordinatorStatusDelegate:(uint64_t)a16 recordingStatusDelegate:(uint64_t)a17 irisRequestDelegate:(uint64_t)a18 masterClock:(unsigned __int8)a19 delayedCompressorCleanupEnabled:;
- (double)irisVISCleanOutputRectForCLAP;
- (id)middlePipeline;
- (uint64_t)atLeastOneTailIsRecording;
- (uint64_t)captureDevice;
- (uint64_t)fileCoordinatorNode;
- (uint64_t)irisStagingNode;
- (uint64_t)ispProcessingSession;
- (uint64_t)movieFileSinkNodes;
- (uint64_t)movieFileVideoCaptureConnectionConfiguration;
- (uint64_t)sdofCompressorNodes;
- (uint64_t)setMrcSceneObserver:(uint64_t)result;
- (uint64_t)setSceneClassifierSuspended:(uint64_t)result;
- (uint64_t)setSemanticStyleSceneObserver:(uint64_t)result;
- (uint64_t)setUpBackPressureForResolvedRetainedBufferCounts;
- (uint64_t)videoCompressorNodes;
- (uint64_t)videoConnectionID;
- (uint64_t)videoOrientationMetadataNode;
- (uint64_t)videoSourceDeviceType;
- (uint64_t)videoSourceID;
- (uint64_t)videoStabilizationStrength;
- (unint64_t)setOverCaptureTailPipelineRenderingEnabled:(unint64_t)result;
- (unint64_t)setRecording:(unint64_t)a3 forTailPipelineIndex:;
- (unint64_t)setRecordingForAllTailPipelines:(unint64_t)result;
- (void)dealloc;
@end

@implementation FigCaptureMovieFileSinkPipeline

- (uint64_t)setUpBackPressureForResolvedRetainedBufferCounts
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    long long v8 = 0u;
    long long v9 = 0u;
    long long v6 = 0u;
    long long v7 = 0u;
    v2 = *(void **)(result + 72);
    result = [v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
    if (result)
    {
      uint64_t v3 = result;
      uint64_t v4 = *(void *)v7;
      do
      {
        uint64_t v5 = 0;
        do
        {
          if (*(void *)v7 != v4) {
            objc_enumerationMutation(v2);
          }
          -[FigCaptureMovieFileSinkTailPipeline setUpBackPressureSemaphoresWithIrisIntermediateJPEGPhotoDecompressorNode:videoDefringingNode:](*(void *)(*((void *)&v6 + 1) + 8 * v5++), (void *)[*(id *)(v1 + 56) irisIntermediateJPEGPhotoDecompressorNode], objc_msgSend(*(id *)(v1 + 56), "videoDefringingNode"));
        }
        while (v3 != v5);
        result = [v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
        uint64_t v3 = result;
      }
      while (result);
    }
  }
  return result;
}

- (uint64_t)videoSourceID
{
  if (result) {
    return [*(id *)(result + 56) videoSourceID];
  }
  return result;
}

- (uint64_t)videoSourceDeviceType
{
  if (result) {
    return [*(id *)(result + 56) videoSourceDeviceType];
  }
  return result;
}

- (uint64_t)irisStagingNode
{
  if (result) {
    return [*(id *)(result + 56) irisStagingNode];
  }
  return result;
}

- (uint64_t)setSemanticStyleSceneObserver:(uint64_t)result
{
  if (result) {
    return [*(id *)(result + 56) setSemanticStyleSceneObserver:a2];
  }
  return result;
}

- (uint64_t)setMrcSceneObserver:(uint64_t)result
{
  if (result) {
    return [*(id *)(result + 56) setMrcSceneObserver:a2];
  }
  return result;
}

- (uint64_t)videoOrientationMetadataNode
{
  if (result) {
    return [*(id *)(result + 56) videoOrientationMetadataNode];
  }
  return result;
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

- (char)initWithConfiguration:(uint64_t)a3 videoSourceCaptureOutput:(uint64_t)a4 audioSourceCaptureOutput:(uint64_t)a5 audioSourceCinematicAudioCaptureOutput:(uint64_t)a6 smartCameraInferenceOutput:(void *)a7 detectedObjectBoxedMetadataOutputs:(uint64_t)a8 objectDetectionSourceOutput:(uint64_t)a9 metadataSourcePipelineOutputs:(uint64_t)a10 graph:(uint64_t)a11 name:(uint64_t)a12 inferenceScheduler:(void *)a13 captureDevice:(uint64_t)a14 audioSourceDelegate:(uint64_t)a15 fileCoordinatorStatusDelegate:(uint64_t)a16 recordingStatusDelegate:(uint64_t)a17 irisRequestDelegate:(uint64_t)a18 masterClock:(unsigned __int8)a19 delayedCompressorCleanupEnabled:
{
  v19 = a1;
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (a2)
    {
      v26 = (void **)(a2 + 16);
      if (![*(id *)(a2 + 16) sinkConfiguration])
      {
        v26 = (void **)(a2 + 24);
        if (![*(id *)(a2 + 24) sinkConfiguration]) {
          goto LABEL_95;
        }
      }
      v27 = *v26;
    }
    else
    {
      uint64_t v69 = [0 sinkConfiguration];
      v27 = 0;
      if (!v69)
      {
        uint64_t v70 = [0 sinkConfiguration];
        v27 = 0;
        if (!v70) {
          goto LABEL_95;
        }
      }
    }
    if (objc_msgSend((id)objc_msgSend(v27, "sinkConfiguration"), "sinkID"))
    {
      uint64_t v28 = [a7 count];
      if (!a8 || !v28)
      {
        v91.receiver = v19;
        v91.super_class = (Class)FigCaptureMovieFileSinkPipeline;
        v19 = (char *)objc_msgSendSuper2(&v91, sel_initWithGraph_name_sinkID_);
        if (!v19)
        {
LABEL_87:
          objc_msgSend((id)objc_msgSend((id)objc_msgSend(v19, "graph"), "memoryAnalyticsPayload"), "setGraphContainsMovieFilePipeline:", 1);
          return v19;
        }
        v29 = a2 ? *(void **)(a2 + 48) : 0;
        uint64_t v76 = a2;
        uint64_t v74 = a6;
        uint64_t v73 = a4;
        if ([v29 enabled])
        {
          uint64_t v30 = BWCreateWorkgroupWithName();
          *((void *)v19 + 16) = v30;
        }
        else
        {
          uint64_t v30 = *((void *)v19 + 16);
        }
        v31 = +[BWPipelineStage pipelineStageWithName:@"com.apple.coremedia.capture.moviefile" priority:14 workgroup:v30];
        v32 = +[BWPipelineStage pipelineStageWithName:@"com.apple.coremedia.capture.moviefile.transfer" priority:14 workgroup:*((void *)v19 + 16)];
        v33 = objc_alloc_init(FigCaptureMovieFileSinkHeadPipelineConfiguration);
        [(FigCaptureMovieFileSinkHeadPipelineConfiguration *)v33 setMovieFileSinkPipelineConfiguration:a2];
        [(FigCaptureMovieFileSinkHeadPipelineConfiguration *)v33 setMovieFilePipelineStage:v31];
        [(FigCaptureMovieFileSinkHeadPipelineConfiguration *)v33 setTransferPipelineStage:v32];
        v34 = [FigCaptureMovieFileSinkHeadPipeline alloc];
        BOOL v35 = a2 && *(unsigned char *)(a2 + 149) != 0;
        LOBYTE(v72) = v35;
        *((void *)v19 + 7) = -[FigCaptureMovieFileSinkHeadPipeline initWithConfiguration:videoSourceCaptureOutput:audioSourceCaptureOutput:audioSourceCinematicAudioCaptureOutput:smartCameraInferenceOutput:detectedObjectBoxedMetadataOutputs:objectDetectionSourceOutput:metadataSourcePipelineOutputs:graph:parentPipeline:inferenceScheduler:captureDevice:audioSourceDelegate:fileCoordinatorStatusDelegate:irisRequestDelegate:masterClock:workgroup:videoGreenGhostMitigationEnabled:](v34, "initWithConfiguration:videoSourceCaptureOutput:audioSourceCaptureOutput:audioSourceCinematicAudioCaptureOutput:smartCameraInferenceOutput:detectedObjectBoxedMetadataOutputs:objectDetectionSourceOutput:metadataSourcePipelineOutputs:graph:parentPipeline:inferenceScheduler:captureDevice:audioSourceDelegate:fileCoordinatorStatusDelegate:irisRequestDelegate:masterClock:workgroup:videoGreenGhostMitigationEnabled:", v33, a3, v73, a5, v74, a7, a8, a9, a10, v19, a12, a13, a14,
                                 a15,
                                 a17,
                                 a18,
                                 *((void *)v19 + 16),
                                 v72);

        if (*((void *)v19 + 7))
        {
          v19[114] = 0;
          if (a2)
          {
            uint64_t v36 = 1;
            v37 = &OBJC_IVAR___BWPreviewStitcherNode__wantWideFallbackDueToTeleAEAF;
            if (*(unsigned char *)(v76 + 138))
            {
              v19[114] = 1;
              uint64_t v36 = 2;
            }
            v38 = *(void **)(v76 + 16);
          }
          else
          {
            v38 = 0;
            uint64_t v36 = 1;
            v37 = &OBJC_IVAR___BWPreviewStitcherNode__wantWideFallbackDueToTeleAEAF;
          }
          v19[115] = [v38 stereoVideoCaptureEnabled];
          if (v76)
          {
            *((_DWORD *)v19 + 29) = *(_DWORD *)(v76 + 168);
            BOOL v39 = *(unsigned char *)(v76 + 196) != 0;
          }
          else
          {
            BOOL v39 = 0;
            *((_DWORD *)v19 + 29) = 0;
          }
          v19[120] = v39;
          v40 = objc_alloc_init(FigCaptureMovieFileSinkMiddlePipelineConfiguration);
          [(FigCaptureMovieFileSinkMiddlePipelineConfiguration *)v40 setMovieFileSinkPipelineConfiguration:v76];
          [(FigCaptureMovieFileSinkMiddlePipelineConfiguration *)v40 setMovieFilePipelineStage:v31];
          *((void *)v19 + 8) = [[FigCaptureMovieFileSinkMiddlePipeline alloc] initWithConfiguration:v40 graph:a10 parentPipeline:v19 headPipeline:*((void *)v19 + 7) captureDevice:a13 workgroup:*(void *)&v19[v37[176]]];

          if (*((void *)v19 + 8))
          {
            *((void *)v19 + 9) = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v36];
            *((void *)v19 + 10) = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v36];
            *((void *)v19 + 11) = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v36];
            uint64_t v41 = 0;
            *((void *)v19 + 12) = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v36];
            do
            {
              v42 = v31;
              if (v41) {
                v42 = +[BWPipelineStage pipelineStageWithName:priority:workgroup:](BWPipelineStage, "pipelineStageWithName:priority:workgroup:", [NSString stringWithFormat:@"%@.tail.%d", -[BWPipelineStage name](v31, "name"), 1], 14, *(void *)&v19[v37[176]]);
              }
              v43 = objc_alloc_init(FigCaptureMovieFileSinkTailPipelineConfiguration);
              [(FigCaptureMovieFileSinkTailPipelineConfiguration *)v43 setMovieFileSinkPipelineConfiguration:v76];
              [(FigCaptureMovieFileSinkTailPipelineConfiguration *)v43 setMovieFilePipelineStage:v42];
              -[FigCaptureMovieFileSinkTailPipelineConfiguration setIrisIntermediateJPEGPhotoDecompressorNode:](v43, "setIrisIntermediateJPEGPhotoDecompressorNode:", [*((id *)v19 + 7) irisIntermediateJPEGPhotoDecompressorNode]);
              -[FigCaptureMovieFileSinkTailPipelineConfiguration setVideoSourceOutput:](v43, "setVideoSourceOutput:", [*((id *)v19 + 8) videoOutputForTailIndex:v41]);
              -[FigCaptureMovieFileSinkTailPipelineConfiguration setAudioSourceOutput:](v43, "setAudioSourceOutput:", [*((id *)v19 + 8) audioOutputForTailIndex:v41]);
              -[FigCaptureMovieFileSinkTailPipelineConfiguration setCinematicAudioSourceOutput:](v43, "setCinematicAudioSourceOutput:", [*((id *)v19 + 7) cinematicAudioOutput]);
              -[FigCaptureMovieFileSinkTailPipelineConfiguration setIndexOfAudioRemixInMetadataOutputs:](v43, "setIndexOfAudioRemixInMetadataOutputs:", [*((id *)v19 + 7) indexOfAudioRemixInMetadataOutputs]);
              -[FigCaptureMovieFileSinkTailPipelineConfiguration setMetadataSourceOutputs:](v43, "setMetadataSourceOutputs:", [*((id *)v19 + 8) metadataOutputsForTailIndex:v41]);
              -[FigCaptureMovieFileSinkTailPipelineConfiguration setIndexesOfDetectedObjectsInMetadataOutputs:](v43, "setIndexesOfDetectedObjectsInMetadataOutputs:", [*((id *)v19 + 7) indexesOfDetectedObjectsInMetadataOutputs]);
              -[FigCaptureMovieFileSinkTailPipelineConfiguration setIndexOfVideoOrientationInMetadataOutputs:](v43, "setIndexOfVideoOrientationInMetadataOutputs:", [*((id *)v19 + 7) indexOfVideoOrientationInMetadataOutputs]);
              BOOL v44 = 0;
              if (v76 && !v41) {
                BOOL v44 = *(unsigned char *)(v76 + 136) != 0;
              }
              [(FigCaptureMovieFileSinkTailPipelineConfiguration *)v43 setVitalityScoringEnabled:v44];
              [(FigCaptureMovieFileSinkTailPipelineConfiguration *)v43 setDelayedCompressorCleanupEnabled:a19];
              v37 = &OBJC_IVAR___BWPreviewStitcherNode__wantWideFallbackDueToTeleAEAF;
              v45 = [[FigCaptureMovieFileSinkTailPipeline alloc] initWithConfiguration:v43 tailIndex:v41 numTailPipelines:v36 graph:a10 parentPipeline:v19 captureDevice:a13 inferenceScheduler:a12 recordingStatusDelegate:a16 workgroup:*((void *)v19 + 16)];

              if (!v45) {
                goto LABEL_95;
              }
              [*((id *)v19 + 9) addObject:v45];
              objc_msgSend(*((id *)v19 + 10), "addObject:", -[FigCaptureMovieFileSinkTailPipeline movieFileSinkNode](v45, "movieFileSinkNode"));
              if ([(FigCaptureMovieFileSinkTailPipeline *)v45 videoCompressorNode]) {
                objc_msgSend(*((id *)v19 + 11), "addObject:", -[FigCaptureMovieFileSinkTailPipeline videoCompressorNode](v45, "videoCompressorNode"));
              }
              if ([(FigCaptureMovieFileSinkTailPipeline *)v45 sdofCompressorNode]) {
                objc_msgSend(*((id *)v19 + 12), "addObject:", -[FigCaptureMovieFileSinkTailPipeline sdofCompressorNode](v45, "sdofCompressorNode"));
              }
              ++v41;
            }
            while (v36 != v41);
            if (v76)
            {
              if ([*(id *)(v76 + 16) irisVISEnabled])
              {
                if (*(unsigned char *)(v76 + 138) && (FigCaptureMetadataUtilitiesShouldIncludeDiagnosticMetadata() & 1) == 0
                  || [*(id *)(v76 + 16) irisVISMethod] == 3)
                {
                  goto LABEL_44;
                }
                v46 = *(void **)(v76 + 16);
                goto LABEL_43;
              }
            }
            else if ([0 irisVISEnabled])
            {
              int v71 = [0 irisVISMethod];
              v46 = 0;
              if (v71 == 3) {
                goto LABEL_44;
              }
LABEL_43:
              if ([v46 irisVISMethod] == 5)
              {
LABEL_44:
                uint64_t v47 = 0;
                do
                {
                  if (!objc_msgSend((id)objc_msgSend(*((id *)v19 + 9), "objectAtIndexedSubscript:", v47), "movieFileSinkNode"))continue; {
                  if (v47 == 1)
                  }
                  {
                    if (!-[FigCaptureVISPipeline visNode]([*((id *)v19 + 8) overCaptureVISPipeline])) {
                      goto LABEL_53;
                    }
                    uint64_t v48 = [*((id *)v19 + 8) overCaptureVISPipeline];
                  }
                  else
                  {
                    if (v47 || !-[FigCaptureVISPipeline visNode]([*((id *)v19 + 8) visPipeline])) {
                      goto LABEL_53;
                    }
                    uint64_t v48 = [*((id *)v19 + 8) visPipeline];
                  }
                  v49 = (void *)-[FigCaptureVISPipeline visNode](v48);
                  if (v49) {
                    goto LABEL_54;
                  }
LABEL_53:
                  v49 = (void *)-[FigCaptureVISPipeline visNode](objc_msgSend((id)objc_msgSend(*((id *)v19 + 9), "objectAtIndexedSubscript:", v47), "visPipeline"));
                  if (v49)
                  {
LABEL_54:
                    v50 = objc_alloc_init(BWIrisStillImageMovieMetadataCache);
                    [v49 setIrisStillImageMovieMetadataCache:v50];
                    objc_msgSend((id)objc_msgSend((id)objc_msgSend(*((id *)v19 + 9), "objectAtIndexedSubscript:", v47), "movieFileSinkNode"), "setIrisStillImageMovieMetadataCache:", v50);
                  }
                }
                while (v36 != ++v47);
              }
            }
            long long v89 = 0u;
            long long v90 = 0u;
            long long v87 = 0u;
            long long v88 = 0u;
            obuint64_t j = (id)[v19 nodes];
            uint64_t v51 = [obj countByEnumeratingWithState:&v87 objects:v94 count:16];
            if (v51)
            {
              uint64_t v52 = v51;
              uint64_t v78 = *(void *)v88;
              do
              {
                for (uint64_t i = 0; i != v52; ++i)
                {
                  if (*(void *)v88 != v78) {
                    objc_enumerationMutation(obj);
                  }
                  v54 = *(void **)(*((void *)&v87 + 1) + 8 * i);
                  [v54 setDeferredPreparePriority:3];
                  long long v85 = 0u;
                  long long v86 = 0u;
                  long long v83 = 0u;
                  long long v84 = 0u;
                  v55 = (void *)[v54 inputs];
                  uint64_t v56 = [v55 countByEnumeratingWithState:&v83 objects:v93 count:16];
                  if (v56)
                  {
                    uint64_t v57 = v56;
                    uint64_t v58 = *(void *)v84;
                    do
                    {
                      for (uint64_t j = 0; j != v57; ++j)
                      {
                        if (*(void *)v84 != v58) {
                          objc_enumerationMutation(v55);
                        }
                        v60 = *(void **)(*((void *)&v83 + 1) + 8 * j);
                        if ((objc_msgSend((id)objc_msgSend(*((id *)v19 + 7), "inferenceConnections"), "containsObject:", objc_msgSend(v60, "connection")) & 1) == 0)objc_msgSend((id)objc_msgSend(v60, "connection"), "setWantsMessageCachingWhileSuspended:", 1); {
                      }
                        }
                      uint64_t v57 = [v55 countByEnumeratingWithState:&v83 objects:v93 count:16];
                    }
                    while (v57);
                  }
                }
                uint64_t v52 = [obj countByEnumeratingWithState:&v87 objects:v94 count:16];
              }
              while (v52);
            }
            long long v81 = 0u;
            long long v82 = 0u;
            long long v79 = 0u;
            long long v80 = 0u;
            v61 = (void *)[*((id *)v19 + 7) inferenceConnections];
            uint64_t v62 = [v61 countByEnumeratingWithState:&v79 objects:v92 count:16];
            if (v62)
            {
              uint64_t v63 = v62;
              uint64_t v64 = *(void *)v80;
              do
              {
                for (uint64_t k = 0; k != v63; ++k)
                {
                  if (*(void *)v80 != v64) {
                    objc_enumerationMutation(v61);
                  }
                  objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v79 + 1) + 8 * k), "input"), "node"), "setDeferredPreparePriority:", 0);
                }
                uint64_t v63 = [v61 countByEnumeratingWithState:&v79 objects:v92 count:16];
              }
              while (v63);
            }
            v66 = (void *)v76;
            if (![*((id *)v19 + 11) count])
            {

              *((void *)v19 + 11) = 0;
            }
            if (![*((id *)v19 + 12) count])
            {

              *((void *)v19 + 12) = 0;
            }
            *((void *)v19 + 6) = a13;
            if (v76) {
              v66 = *(void **)(v76 + 16);
            }
            *((void *)v19 + 13) = v66;
            v67 = (void *)[v66 irisSinkConfiguration];
            if ([v67 irisMovieCaptureEnabled]) {
              v19[112] = [v67 momentCaptureMovieRecordingEnabled];
            }
            goto LABEL_87;
          }
        }
      }
    }
LABEL_95:
    FigDebugAssert3();

    return 0;
  }
  return v19;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureMovieFileSinkPipeline;
  [(FigCaptureSinkPipeline *)&v3 dealloc];
}

- (id)middlePipeline
{
  return self->_middlePipeline;
}

- (uint64_t)videoConnectionID
{
  if (result) {
    return [*(id *)(result + 56) videoConnectionID];
  }
  return result;
}

- (uint64_t)fileCoordinatorNode
{
  if (result) {
    return [*(id *)(result + 56) fileCoordinatorNode];
  }
  return result;
}

- (uint64_t)ispProcessingSession
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    long long v7 = 0u;
    long long v8 = 0u;
    long long v5 = 0u;
    long long v6 = 0u;
    uint64_t v1 = *(void **)(result + 72);
    result = [v1 countByEnumeratingWithState:&v5 objects:v9 count:16];
    if (result)
    {
      uint64_t v2 = result;
      uint64_t v3 = *(void *)v6;
LABEL_4:
      uint64_t v4 = 0;
      while (1)
      {
        if (*(void *)v6 != v3) {
          objc_enumerationMutation(v1);
        }
        result = objc_msgSend((id)-[FigCaptureVISPipeline visNode](objc_msgSend(*(id *)(*((void *)&v5 + 1) + 8 * v4), "visPipeline")), "ispProcessingSession");
        if (result) {
          break;
        }
        if (v2 == ++v4)
        {
          result = [v1 countByEnumeratingWithState:&v5 objects:v9 count:16];
          uint64_t v2 = result;
          if (result) {
            goto LABEL_4;
          }
          return result;
        }
      }
    }
  }
  return result;
}

- (uint64_t)movieFileVideoCaptureConnectionConfiguration
{
  if (result) {
    return *(void *)(result + 104);
  }
  return result;
}

- (double)irisVISCleanOutputRectForCLAP
{
  if (!a1) {
    return 0.0;
  }
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 72), "objectAtIndexedSubscript:", 0), "irisVISCleanOutputRectForCLAP");
  return result;
}

- (uint64_t)setSceneClassifierSuspended:(uint64_t)result
{
  if (result) {
    return [*(id *)(result + 56) setSceneClassifierSuspended:a2];
  }
  return result;
}

- (unint64_t)setRecording:(unint64_t)a3 forTailPipelineIndex:
{
  if (result)
  {
    unint64_t v5 = result;
    double result = [*(id *)(result + 72) count];
    if (result < a3) {
      -[FigCaptureMovieFileSinkPipeline setRecording:forTailPipelineIndex:]();
    }
    if (a3 != 1 || *(unsigned char *)(v5 + 113))
    {
      long long v6 = (void *)[*(id *)(v5 + 72) objectAtIndexedSubscript:a3];
      return [v6 setRecording:a2];
    }
  }
  return result;
}

- (unint64_t)setRecordingForAllTailPipelines:(unint64_t)result
{
  if (result)
  {
    unint64_t v3 = result;
    double result = [*(id *)(result + 72) count];
    if (result)
    {
      for (unint64_t i = 0; i < result; ++i)
      {
        if (*(unsigned char *)(v3 + 113)) {
          BOOL v5 = 0;
        }
        else {
          BOOL v5 = i == 1;
        }
        if (!v5) {
          objc_msgSend((id)objc_msgSend(*(id *)(v3 + 72), "objectAtIndexedSubscript:", i), "setRecording:", a2);
        }
        double result = [*(id *)(v3 + 72) count];
      }
    }
  }
  return result;
}

- (uint64_t)atLeastOneTailIsRecording
{
  if (result)
  {
    uint64_t v1 = result;
    double result = [*(id *)(result + 72) count];
    if (result)
    {
      uint64_t v2 = 0;
      while (1)
      {
        BOOL v3 = !*(unsigned char *)(v1 + 113) && v2 == 1;
        if (!v3
          && (objc_msgSend((id)objc_msgSend(*(id *)(v1 + 72), "objectAtIndexedSubscript:", v2), "recording") & 1) != 0)
        {
          break;
        }
        if (++v2 >= (unint64_t)[*(id *)(v1 + 72) count]) {
          return 0;
        }
      }
      return 1;
    }
  }
  return result;
}

- (unint64_t)setOverCaptureTailPipelineRenderingEnabled:(unint64_t)result
{
  if (result)
  {
    unint64_t v3 = result;
    double result = [*(id *)(result + 72) count];
    if (result >= 2) {
      *(unsigned char *)(v3 + 113) = a2;
    }
  }
  return result;
}

- (uint64_t)movieFileSinkNodes
{
  if (result) {
    return *(void *)(result + 80);
  }
  return result;
}

- (uint64_t)videoCompressorNodes
{
  if (result) {
    return *(void *)(result + 88);
  }
  return result;
}

- (uint64_t)sdofCompressorNodes
{
  if (result) {
    return *(void *)(result + 96);
  }
  return result;
}

- (BOOL)overCaptureEnabled
{
  if (result) {
    return *(unsigned char *)(result + 114) != 0;
  }
  return result;
}

- (uint64_t)videoStabilizationStrength
{
  if (result) {
    return *(unsigned int *)(result + 116);
  }
  return result;
}

- (BOOL)smartStyleReversibilityEnabled
{
  if (result) {
    return *(unsigned char *)(result + 120) != 0;
  }
  return result;
}

- (uint64_t)captureDevice
{
  if (result) {
    return *(void *)(result + 48);
  }
  return result;
}

- (void)setRecording:forTailPipelineIndex:.cold.1()
{
  __assert_rtn("-[FigCaptureMovieFileSinkPipeline setRecording:forTailPipelineIndex:]", "FigCaptureMovieFileSinkPipeline.m", 4410, "tailIndex <= _tailPipelines.count");
}

@end