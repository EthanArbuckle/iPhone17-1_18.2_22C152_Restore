@interface FigCaptureMovieFileSinkHeadPipeline
- (BOOL)sceneClassifierSuspended;
- (BWFileCoordinatorNode)fileCoordinatorNode;
- (BWIrisStagingNode)irisStagingNode;
- (BWMRCSceneObserver)mrcSceneObserver;
- (BWNodeOutput)audioOutput;
- (BWNodeOutput)cinematicAudioOutput;
- (BWNodeOutput)videoOutput;
- (BWPhotoDecompressorNode)irisIntermediateJPEGPhotoDecompressorNode;
- (BWSemanticStyleSceneObserver)semanticStyleSceneObserver;
- (BWVideoDefringingNode)videoDefringingNode;
- (BWVideoOrientationMetadataNode)videoOrientationMetadataNode;
- (FigCaptureMovieFileSinkHeadPipeline)initWithConfiguration:(id)a3 videoSourceCaptureOutput:(id)a4 audioSourceCaptureOutput:(id)a5 audioSourceCinematicAudioCaptureOutput:(id)a6 smartCameraInferenceOutput:(id)a7 detectedObjectBoxedMetadataOutputs:(id)a8 objectDetectionSourceOutput:(id)a9 metadataSourcePipelineOutputs:(id)a10 graph:(id)a11 parentPipeline:(id)a12 inferenceScheduler:(id)a13 captureDevice:(id)a14 audioSourceDelegate:(id)a15 fileCoordinatorStatusDelegate:(id)a16 irisRequestDelegate:(id)a17 masterClock:(OpaqueCMClock *)a18 workgroup:(id)a19 videoGreenGhostMitigationEnabled:(BOOL)a20;
- (NSArray)indexesOfDetectedObjectsInMetadataOutputs;
- (NSArray)inferenceConnections;
- (NSArray)metadataOutputs;
- (NSString)videoConnectionID;
- (NSString)videoSourceID;
- (id)_buildFaceDetectionNode:(void *)a3 parentPipeline:(uint64_t)a4 objectDetectionSourceOutput:(void *)a5 faceDetectionNodeOut:;
- (int)indexOfAudioRemixInMetadataOutputs;
- (int)indexOfVideoOrientationInMetadataOutputs;
- (int)videoSourceDeviceType;
- (uint64_t)_buildMovieFileSinkHeadPipeline:(uint64_t)a1 videoSourceCaptureOutput:(void *)a2 audioSourceCaptureOutput:(uint64_t)a3 audioSourceCinematicAudioCaptureOutput:(uint64_t)a4 smartCameraInferenceOutput:(uint64_t)a5 detectedObjectBoxedMetadataOutputs:(uint64_t)a6 objectDetectionSourceOutput:(void *)a7 metadataSourcePipelineOutputs:(uint64_t)a8 graph:(void *)a9 parentPipeline:(void *)a10 inferenceScheduler:(void *)a11 captureDevice:(uint64_t)a12 audioSourceDelegate:(void *)a13 fileCoordinatorStatusDelegate:(uint64_t)a14 irisRequestDelegate:(uint64_t)a15 masterClock:(uint64_t)a16 workgroup:(uint64_t)a17 videoGreenGhostMitigationEnabled:(uint64_t)a18;
- (void)dealloc;
- (void)setMrcSceneObserver:(id)a3;
- (void)setSceneClassifierSuspended:(BOOL)a3;
- (void)setSemanticStyleSceneObserver:(id)a3;
@end

@implementation FigCaptureMovieFileSinkHeadPipeline

- (BWVideoDefringingNode)videoDefringingNode
{
  return self->_videoDefringingNode;
}

- (NSString)videoSourceID
{
  return self->_videoSourceID;
}

- (int)videoSourceDeviceType
{
  return self->_videoSourceDeviceType;
}

- (BWIrisStagingNode)irisStagingNode
{
  return self->_irisStagingNode;
}

- (NSArray)inferenceConnections
{
  return &self->_inferenceConnections->super;
}

- (NSArray)metadataOutputs
{
  return &self->_metadataOutputs->super;
}

- (BWPhotoDecompressorNode)irisIntermediateJPEGPhotoDecompressorNode
{
  return self->_irisIntermediateJPEGPhotoDecompressorNode;
}

- (BWNodeOutput)audioOutput
{
  return self->_audioOutput;
}

- (BWNodeOutput)videoOutput
{
  return self->_videoOutput;
}

- (NSArray)indexesOfDetectedObjectsInMetadataOutputs
{
  return self->_indexesOfDetectedObjectsInMetadataOutputs;
}

- (int)indexOfVideoOrientationInMetadataOutputs
{
  return self->_indexOfVideoOrientationInMetadataOutputs;
}

- (BWFileCoordinatorNode)fileCoordinatorNode
{
  return self->_fileCoordinatorNode;
}

- (BWNodeOutput)cinematicAudioOutput
{
  return self->_cinematicAudioOutput;
}

- (void)setSemanticStyleSceneObserver:(id)a3
{
}

- (void)setMrcSceneObserver:(id)a3
{
}

- (BWVideoOrientationMetadataNode)videoOrientationMetadataNode
{
  return self->_videoOrientationMetadataNode;
}

- (FigCaptureMovieFileSinkHeadPipeline)initWithConfiguration:(id)a3 videoSourceCaptureOutput:(id)a4 audioSourceCaptureOutput:(id)a5 audioSourceCinematicAudioCaptureOutput:(id)a6 smartCameraInferenceOutput:(id)a7 detectedObjectBoxedMetadataOutputs:(id)a8 objectDetectionSourceOutput:(id)a9 metadataSourcePipelineOutputs:(id)a10 graph:(id)a11 parentPipeline:(id)a12 inferenceScheduler:(id)a13 captureDevice:(id)a14 audioSourceDelegate:(id)a15 fileCoordinatorStatusDelegate:(id)a16 irisRequestDelegate:(id)a17 masterClock:(OpaqueCMClock *)a18 workgroup:(id)a19 videoGreenGhostMitigationEnabled:(BOOL)a20
{
  v29.receiver = self;
  v29.super_class = (Class)FigCaptureMovieFileSinkHeadPipeline;
  v26 = [(FigCapturePipeline *)&v29 initWithGraph:a11 name:@"Head Pipeline"];
  v27 = v26;
  if (v26)
  {
    v26->_indexOfVideoOrientationInMetadataOutputs = -1;
    v26->_inferenceConnections = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (-[FigCaptureMovieFileSinkHeadPipeline _buildMovieFileSinkHeadPipeline:videoSourceCaptureOutput:audioSourceCaptureOutput:audioSourceCinematicAudioCaptureOutput:smartCameraInferenceOutput:detectedObjectBoxedMetadataOutputs:objectDetectionSourceOutput:metadataSourcePipelineOutputs:graph:parentPipeline:inferenceScheduler:captureDevice:audioSourceDelegate:fileCoordinatorStatusDelegate:irisRequestDelegate:masterClock:workgroup:videoGreenGhostMitigationEnabled:]((uint64_t)v27, a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, (uint64_t)a7, a8, (uint64_t)a9, a10, a11, a12, (uint64_t)a13, a14, (uint64_t)a15, (uint64_t)a16, (uint64_t)a17, (uint64_t)a18, (uint64_t)a19))
    {
      FigDebugAssert3();

      return 0;
    }
  }
  return v27;
}

- (uint64_t)_buildMovieFileSinkHeadPipeline:(uint64_t)a1 videoSourceCaptureOutput:(void *)a2 audioSourceCaptureOutput:(uint64_t)a3 audioSourceCinematicAudioCaptureOutput:(uint64_t)a4 smartCameraInferenceOutput:(uint64_t)a5 detectedObjectBoxedMetadataOutputs:(uint64_t)a6 objectDetectionSourceOutput:(void *)a7 metadataSourcePipelineOutputs:(uint64_t)a8 graph:(void *)a9 parentPipeline:(void *)a10 inferenceScheduler:(void *)a11 captureDevice:(uint64_t)a12 audioSourceDelegate:(void *)a13 fileCoordinatorStatusDelegate:(uint64_t)a14 irisRequestDelegate:(uint64_t)a15 masterClock:(uint64_t)a16 workgroup:(uint64_t)a17 videoGreenGhostMitigationEnabled:(uint64_t)a18
{
  v258[1] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  id v243 = 0;
  uint64_t v22 = [a2 movieFileSinkPipelineConfiguration];
  uint64_t v23 = v22;
  if (v22) {
    v24 = *(void **)(v22 + 16);
  }
  else {
    v24 = 0;
  }
  v25 = (void *)[v24 irisSinkConfiguration];
  uint64_t v184 = [a2 movieFilePipelineStage];
  uint64_t v26 = [a2 movieFileSinkPipelineConfiguration];
  BOOL v192 = a3 != 0;
  BOOL v27 = a4 != 0;
  uint64_t v28 = 1;
  if (a4) {
    uint64_t v28 = 2;
  }
  if (a5) {
    BOOL v27 = v28;
  }
  BOOL v191 = v27;
  uint64_t v29 = [a9 count];
  v196 = (unsigned char *)v26;
  if (!v26 || !*(unsigned char *)(v26 + 108))
  {
    v30 = (void *)[a2 movieFileSinkPipelineConfiguration];
    if (v30) {
      v30 = (void *)v30[5];
    }
    v29 += [v30 count];
  }
  uint64_t v190 = v29;
  v185 = a2;
  uint64_t v200 = a1;
  BOOL v186 = v24 != 0;
  v204 = (void *)[MEMORY[0x1E4F1CA48] array];
  v31 = (void *)[MEMORY[0x1E4F1CA48] array];
  uint64_t v32 = [MEMORY[0x1E4F1CA48] array];
  if (v23) {
    BOOL v33 = *(unsigned char *)(v23 + 138) != 0;
  }
  else {
    BOOL v33 = 0;
  }
  if ((int)[v24 outputWidth] < 1441) {
    int v34 = 3;
  }
  else {
    int v34 = 4;
  }
  float v35 = (float)v34;
  objc_msgSend((id)objc_msgSend(+[FigCaptureSourceBackings sharedCaptureSourceBackings](FigCaptureSourceBackings, "sharedCaptureSourceBackings"), "commonSettings"), "livePhotoJPEGIntermediateCompressionRatioDefaultOverride");
  if (v36 > 0.0) {
    float v35 = v36;
  }
  if (v35 == 0.0) {
    float v37 = 0.8;
  }
  else {
    float v37 = 0.0;
  }
  int v38 = [v25 irisMovieCaptureEnabled];
  v189 = v24;
  v207 = (void *)v32;
  v199 = v25;
  uint64_t v194 = v23;
  if (!v38)
  {
    long long v222 = 0u;
    long long v223 = 0u;
    long long v220 = 0u;
    long long v221 = 0u;
    uint64_t v50 = [a9 countByEnumeratingWithState:&v220 objects:v249 count:16];
    if (v50)
    {
      uint64_t v51 = v50;
      uint64_t v52 = *(void *)v221;
      do
      {
        for (uint64_t i = 0; i != v51; ++i)
        {
          if (*(void *)v221 != v52) {
            objc_enumerationMutation(a9);
          }
          [v31 addObject:*(void *)(*((void *)&v220 + 1) + 8 * i)];
        }
        uint64_t v51 = [a9 countByEnumeratingWithState:&v220 objects:v249 count:16];
      }
      while (v51);
    }
    uint64_t v54 = a3;
    if (a3)
    {
      uint64_t v55 = v200;
      if (!v196 || !v196[151] || v196[150])
      {
        v56 = a7;
LABEL_67:
        obuint64_t j = v56;
        int v59 = 0;
        goto LABEL_173;
      }
      v58 = objc_alloc_init(BWFrameRateGovernorNode);
      [(BWNode *)v58 setName:@"Movie File Frame Rate Governor"];
      [(BWFrameRateGovernorNode *)v58 setDropsStartupFramesWithUnstableAE:1];
      [(BWFrameRateGovernorNode *)v58 setAeStabilityTuning:2];
      if (([a11 addNode:v58 error:&v243] & 1) == 0
        || (objc_msgSend(a10, "connectOutput:toInput:pipelineStage:", a3, -[BWNode input](v58, "input"), 0) & 1) == 0)
      {
        goto LABEL_278;
      }
      uint64_t v54 = [(BWNode *)v58 output];
    }
    uint64_t v55 = v200;
    v56 = a7;
    goto LABEL_67;
  }
  int v181 = v38;
  if (v23) {
    BOOL v39 = *(unsigned char *)(v23 + 136) != 0;
  }
  else {
    BOOL v39 = 0;
  }
  uint64_t v40 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPath:isDirectory:", NSTemporaryDirectory(), 1), "URLByAppendingPathComponent:isDirectory:", 0x1EFA57920, 1), "URLByAppendingPathComponent:isDirectory:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29128], "UUID"), "UUIDString"), 1);
  v41 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v257 = *MEMORY[0x1E4F28370];
  v258[0] = *MEMORY[0x1E4F28358];
  uint64_t v182 = v40;
  objc_msgSend(v41, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v40, 1, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v258, &v257, 1), 0);
  uint64_t v42 = a3;
  BOOL v183 = v39;
  if (!a3)
  {
    if (v23) {
      goto LABEL_69;
    }
LABEL_62:
    unint64_t v57 = 0;
    goto LABEL_70;
  }
  if (v23)
  {
    if (*(unsigned char *)(v23 + 193)) {
      char v43 = v33;
    }
    else {
      char v43 = 1;
    }
    if ((v43 & 1) == 0)
    {
      id v44 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      if ([a13 overCaptureEnabled]) {
        [v44 addObject:@"SynchronizedSlaveFrame"];
      }
      if (*(unsigned char *)(v23 + 195))
      {
        if (v196) {
          BOOL v45 = v196[196] != 0;
        }
        else {
          BOOL v45 = 0;
        }
        objc_msgSend(v44, "addObjectsFromArray:", BWAttachedMediaKeysRequiredBySmartStyleRenderingPipelines(1, v45));
      }
      v46 = [BWAttachedMediaSplitNode alloc];
      v256 = @"PrimaryFormat";
      v47 = -[BWAttachedMediaSplitNode initWithAttachedMediaKeys:attachedMediaToPropagateToPrimaryOutput:](v46, "initWithAttachedMediaKeys:attachedMediaToPropagateToPrimaryOutput:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v256 count:1], v44);
      [(BWNode *)v47 setName:@"Movie File Depth Remover"];
      if (([a11 addNode:v47 error:&v243] & 1) == 0
        || (objc_msgSend(a10, "connectOutput:toInput:pipelineStage:", a3, -[BWNode input](v47, "input"), 0) & 1) == 0)
      {
        goto LABEL_278;
      }
      uint64_t v42 = [(NSArray *)[(BWNode *)v47 outputs] objectAtIndexedSubscript:0];
      if (!v42)
      {
        LOBYTE(a3) = 1;
        BOOL v39 = v183;
        goto LABEL_69;
      }
    }
    LOBYTE(a3) = v43 ^ 1;
    v48 = *(void **)(v23 + 64);
  }
  else
  {
    LOBYTE(a3) = 0;
    v48 = 0;
  }
  if (!objc_msgSend((id)objc_msgSend(v48, "irisSinkConfiguration"), "irisFrameHarvestingEnabled"))
  {
    BOOL v39 = v183;
    if (v23) {
      goto LABEL_69;
    }
    goto LABEL_62;
  }
  v49 = objc_alloc_init(BWFrameRateGovernorNode);
  [(BWNode *)v49 setName:@"Movie File Frame Rate Governor"];
  [(BWFrameRateGovernorNode *)v49 setDropsStillBracketFramesToMaintainConsistentFrameRate:1];
  [(BWFrameRateGovernorNode *)v49 setDropsStartupFramesWithUnstableAE:1];
  [(BWFrameRateGovernorNode *)v49 setPreservesMotionDataFromDroppedFrames:1];
  BOOL v39 = v183;
  if (([a11 addNode:v49 error:&v243] & 1) == 0
    || (objc_msgSend(a10, "connectOutput:toInput:pipelineStage:", v42, -[BWNode input](v49, "input"), 0) & 1) == 0)
  {
    goto LABEL_278;
  }
  uint64_t v42 = [(BWNode *)v49 output];
  if (!v23) {
    goto LABEL_62;
  }
LABEL_69:
  unint64_t v57 = *(unsigned int *)(v23 + 116) | ((unint64_t)*(unsigned __int16 *)(v23 + 120) << 32);
LABEL_70:
  if (!v39)
  {
    a6 = 0;
    goto LABEL_79;
  }
  if (a6)
  {
LABEL_79:
    v180 = 0;
    goto LABEL_80;
  }
  v60 = [[BWFanOutNode alloc] initWithFanOutCount:2 mediaType:1986618469];
  [(BWNode *)v60 setName:@"Inferences (SmartCam and VitalityScoring) Splitter"];
  if (([a11 addNode:v60 error:&v243] & 1) == 0
    || (objc_msgSend(a10, "connectOutput:toInput:pipelineStage:", v42, -[BWNode input](v60, "input"), 0) & 1) == 0)
  {
    goto LABEL_278;
  }
  uint64_t v42 = [(NSArray *)[(BWNode *)v60 outputs] objectAtIndexedSubscript:0];
  v180 = +[BWPipelineStage pipelineStageWithName:@"com.apple.coremedia.capture.moviefile.smartmedia" priority:0 workgroup:a18 discardsLateSampleData:1];
  if (v23 && *(void *)(v23 + 72))
  {
    *(void *)&v255[0] = 0;
    *(void *)v252 = 0;
    v242 = 0;
    id v61 = FigCaptureBuildSceneClassifierPipeline(a11, [(NSArray *)[(BWNode *)v60 outputs] objectAtIndexedSubscript:1], v57 & 0xFFFFFFFFFFFFLL, 13, (uint64_t)v180, 1, 0, (uint64_t)a13, a12, v255, v252, &v242);
    if (v61)
    {
      id v65 = v61;
      goto LABEL_310;
    }
    a6 = [*(id *)v252 objectAtIndexedSubscript:0];
    *(void *)(v200 + 64) = v242;
    *(void *)(v200 + 104) = [(NSArray *)[(BWNode *)v60 outputs] objectAtIndexedSubscript:1];
    [*(id *)(v200 + 112) addObjectsFromArray:*(void *)&v255[0]];
  }
  else
  {
    v64 = FigCaptureCreateAndConfigureSmartCameraInferenceNode(13, v57 & 0xFFFFFFFFFFFFLL, (uint64_t)a13, a12, 0);
    if (([a11 addNode:v64 error:&v243] & 1) == 0
      || (objc_msgSend(a10, "connectOutput:toInput:pipelineStage:", -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v60, "outputs"), "objectAtIndexedSubscript:", 1), -[BWNode input](v64, "input"), v180) & 1) == 0)
    {
      goto LABEL_278;
    }
    a6 = [(BWNode *)v64 output];
    objc_msgSend(*(id *)(v200 + 112), "addObject:", -[BWNodeInput connection](-[BWNode input](v64, "input"), "connection"));
  }
  [(BWFanOutNode *)v60 setDiscardsAttachedMedia:1 forOutputIndex:1];
LABEL_80:
  uint64_t v187 = v42;
  if (v23)
  {
    int v62 = *(_DWORD *)(v23 + 104);
    if ([v24 irisVISMethod] == 3)
    {
      if (!v62)
      {
        int v63 = 0;
        goto LABEL_106;
      }
      goto LABEL_105;
    }
  }
  else
  {
    int v62 = 0;
    int v63 = 0;
    if ([v24 irisVISMethod] == 3) {
      goto LABEL_106;
    }
  }
  int v66 = [v24 irisVISMethod];
  int v63 = 0;
  if (!v62 || v66 != 5) {
    goto LABEL_106;
  }
LABEL_105:
  int v63 = 1;
LABEL_106:
  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v24, "sourceConfiguration"), "requiredFormat"), "semanticRenderingSupported"))BOOL v67 = (int)objc_msgSend((id)objc_msgSend(+[FigCaptureSourceBackings sharedCaptureSourceBackings](FigCaptureSourceBackings, "sharedCaptureSourceBackings"), "commonSettings"), "semanticRenderingVersion") > 2; {
  else
  }
    BOOL v67 = 0;
  uint64_t v68 = [a13 cameraInfoByPortType];
  v69 = [BWIrisStagingNode alloc];
  uint64_t v70 = [v199 irisMovieAutoTrimMethod];
  if (v23)
  {
    BOOL v74 = *(unsigned char *)(v23 + 137) != 0;
    BOOL v75 = *(unsigned char *)(v23 + 138) != 0;
    v76 = v196;
    uint64_t v77 = v182;
    BOOL v78 = (a3 & 1) == 0 && *(unsigned char *)(v23 + 193) != 0;
    LODWORD(v71) = *(_DWORD *)(v23 + 164);
    BOOL v79 = *(unsigned char *)(v23 + 139) != 0;
    v80 = v199;
  }
  else
  {
    BOOL v75 = 0;
    BOOL v74 = 0;
    BOOL v78 = 0;
    BOOL v79 = 0;
    double v71 = 0.0;
    v76 = v196;
    v80 = v199;
    uint64_t v77 = v182;
  }
  if (v76)
  {
    int v81 = *((_DWORD *)v76 + 36);
    BOOL v82 = v76[195] != 0;
    LOBYTE(v76) = v76[196] != 0;
  }
  else
  {
    BOOL v82 = 0;
    int v81 = 0;
  }
  BYTE1(v179) = (_BYTE)v76;
  LOBYTE(v179) = v82;
  HIDWORD(v177) = v81;
  BYTE1(v177) = v67;
  LOBYTE(v177) = v79;
  HIDWORD(v175) = v63;
  BYTE2(v175) = 1;
  BYTE1(v175) = v78;
  LOBYTE(v175) = v75;
  *(float *)&double v72 = v37;
  *(float *)&double v73 = v35;
  v83 = objc_autorelease(-[BWIrisStagingNode initWithNumberOfVideoInputs:numberOfAudioInputs:numberOfMetadataInputs:autoTrimMethod:vitalityScoringEnabled:captureDeviceHasOverCaptureEnabled:overCaptureEnabled:depthEnabled:videoStabilizationOverscanOverride:sequenceAdjusterEnabled:visMotionMetadataPreloadingMode:frameReconstructionEnabled:subjectRelightingEnabled:intermediateJPEGCompressionQuality:intermediateJPEGCompressionRate:maxLossyCompressionLevel:temporaryMovieDirectoryURL:cameraInfoByPortType:smartStyleRenderingEnabled:smartStyleReversibilityEnabled:irisRequestDelegate:](v69, "initWithNumberOfVideoInputs:numberOfAudioInputs:numberOfMetadataInputs:autoTrimMethod:vitalityScoringEnabled:captureDeviceHasOverCaptureEnabled:overCaptureEnabled:depthEnabled:videoStabilizationOverscanOverride:sequenceAdjusterEnabled:visMotionMetadataPreloadingMode:frameReconstructionEnabled:subjectRelightingEnabled:intermediateJPEGCompressionQuality:intermediateJPEGCompressionRate:maxLossyCompressionLevel:temporaryMovieDirectoryURL:cameraInfoByPortType:smartStyleRenderingEnabled:smartStyleReversibilityEnabled:irisRequestDelegate:", v192, v191, v190, v70, v183, v74, v71, v72, v73, v175, v177, v77,
            v68,
            v179,
            a16));
  if (([a11 addNode:v83 error:&v243] & 1) == 0) {
    goto LABEL_278;
  }
  *(void *)(v200 + 32) = v83;
  [(BWNode *)v83 setName:@"Movie File Staging Node"];
  if (v35 >= 0.0) {
    [(BWIrisStagingNode *)v83 setIntermediateJPEGDownstreamRetainedBufferCount:5];
  }
  if (v80) {
    [v80 irisMovieDuration];
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  CMTimeMultiplyByRatio(&v241, &time, 1, 2);
  CMTime v239 = v241;
  [(BWIrisStagingNode *)v83 setBufferingTime:&v239];
  if (v80)
  {
    [v80 irisMovieVideoFrameDuration];
  }
  else
  {
    long long v237 = 0uLL;
    uint64_t v238 = 0;
  }
  long long v235 = v237;
  uint64_t v236 = v238;
  [(BWIrisStagingNode *)v83 setTargetFrameDuration:&v235];
  if (v183) {
    [(BWIrisStagingNode *)v83 setVitalityScoringSmartCameraPipelineVersion:v57 & 0xFFFFFFFFFFFFLL];
  }
  [(BWIrisStagingNode *)v83 setMasterClock:a17];
  -[BWIrisStagingNode setApplyPreviewShift:](v83, "setApplyPreviewShift:", [v80 irisApplyPreviewShift]);
  if (dword_1EB4C5390)
  {
    LODWORD(v242) = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v85 = v242;
    if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT)) {
      unsigned int v86 = v85;
    }
    else {
      unsigned int v86 = v85 & 0xFFFFFFFE;
    }
    if (v86)
    {
      int v87 = [v199 irisMovieCaptureSuspended];
      *(_DWORD *)v252 = 136315394;
      *(void *)&v252[4] = "-[FigCaptureMovieFileSinkHeadPipeline _buildMovieFileSinkHeadPipeline:videoSourceCaptureOutp"
                            "ut:audioSourceCaptureOutput:audioSourceCinematicAudioCaptureOutput:smartCameraInferenceOutpu"
                            "t:detectedObjectBoxedMetadataOutputs:objectDetectionSourceOutput:metadataSourcePipelineOutpu"
                            "ts:graph:parentPipeline:inferenceScheduler:captureDevice:audioSourceDelegate:fileCoordinator"
                            "StatusDelegate:irisRequestDelegate:masterClock:workgroup:videoGreenGhostMitigationEnabled:]";
      __int16 v253 = 1024;
      int v254 = v87;
      LODWORD(v178) = 18;
      v176 = v252;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    v80 = v199;
  }
  if (objc_msgSend(v80, "irisMovieCaptureSuspended", v176, v178))
  {
    HostTimeClocuint64_t k = CMClockGetHostTimeClock();
    CMClockGetTime(&v233, HostTimeClock);
    CMTime v232 = v233;
    [(BWIrisStagingNode *)v83 setEndIrisMovieCaptureTime:&v232];
  }
  v89 = [(BWNode *)v83 inputs];
  v90 = [(BWNode *)v83 outputs];
  uint64_t v91 = a4;
  uint64_t v54 = v187;
  if (v187)
  {
    if ((objc_msgSend(a10, "connectOutput:toInput:pipelineStage:", v187, -[NSArray objectAtIndexedSubscript:](v89, "objectAtIndexedSubscript:", 0), 0) & 1) == 0)goto LABEL_278; {
    uint64_t v54 = [(NSArray *)v90 objectAtIndexedSubscript:0];
    }
    uint64_t v92 = 1;
    if (!a4) {
      goto LABEL_143;
    }
LABEL_141:
    if ((objc_msgSend(a10, "connectOutput:toInput:pipelineStage:", a4, -[NSArray objectAtIndexedSubscript:](v89, "objectAtIndexedSubscript:", v92), 0) & 1) == 0)goto LABEL_278; {
    uint64_t v91 = [(NSArray *)v90 objectAtIndexedSubscript:v92++];
    }
    goto LABEL_143;
  }
  uint64_t v92 = 0;
  if (a4) {
    goto LABEL_141;
  }
LABEL_143:
  long long v230 = 0u;
  long long v231 = 0u;
  long long v228 = 0u;
  long long v229 = 0u;
  uint64_t v93 = [a9 countByEnumeratingWithState:&v228 objects:v251 count:16];
  a4 = v91;
  if (v93)
  {
    uint64_t v94 = v93;
    uint64_t v95 = *(void *)v229;
    do
    {
      for (uint64_t j = 0; j != v94; ++j)
      {
        if (*(void *)v229 != v95) {
          objc_enumerationMutation(a9);
        }
        if (!objc_msgSend(a10, "connectOutput:toInput:pipelineStage:", *(void *)(*((void *)&v228 + 1) + 8 * j), -[NSArray objectAtIndexedSubscript:](v89, "objectAtIndexedSubscript:", v92 + j), 0))goto LABEL_278; {
        objc_msgSend(v31, "addObject:", -[NSArray objectAtIndexedSubscript:](v90, "objectAtIndexedSubscript:", v92 + j));
        }
      }
      uint64_t v94 = [a9 countByEnumeratingWithState:&v228 objects:v251 count:16];
      v92 += j;
    }
    while (v94);
    uint64_t v23 = v194;
  }
  uint64_t v97 = [a7 count];
  uint64_t v55 = v200;
  if (a8 || v97)
  {
    if (a8)
    {
      *(void *)&v255[0] = 0;
      id v98 = -[FigCaptureMovieFileSinkHeadPipeline _buildFaceDetectionNode:parentPipeline:objectDetectionSourceOutput:faceDetectionNodeOut:](v200, (void *)[v185 movieFileSinkPipelineConfiguration], a11, a8, v255);
      if (v98)
      {
        id v65 = v98;
        goto LABEL_310;
      }
      a7 = (void *)[*(id *)&v255[0] boxedMetadataOutputs];
      uint64_t v55 = v200;
    }
    obuint64_t j = (id)[MEMORY[0x1E4F1CA48] array];
    long long v224 = 0u;
    long long v225 = 0u;
    long long v226 = 0u;
    long long v227 = 0u;
    uint64_t v99 = [a7 countByEnumeratingWithState:&v224 objects:v250 count:16];
    if (v99)
    {
      uint64_t v100 = v99;
      uint64_t v101 = *(void *)v225;
      do
      {
        for (uint64_t k = 0; k != v100; ++k)
        {
          if (*(void *)v225 != v101) {
            objc_enumerationMutation(a7);
          }
          if (!objc_msgSend(a10, "connectOutput:toInput:pipelineStage:", *(void *)(*((void *)&v224 + 1) + 8 * k), -[NSArray objectAtIndexedSubscript:](v89, "objectAtIndexedSubscript:", v92 + k), 0))goto LABEL_278; {
          objc_msgSend(obj, "addObject:", -[NSArray objectAtIndexedSubscript:](v90, "objectAtIndexedSubscript:", v92 + k));
          }
        }
        uint64_t v100 = [a7 countByEnumeratingWithState:&v224 objects:v250 count:16];
        v92 += k;
      }
      while (v100);
      uint64_t v55 = v200;
      uint64_t v23 = v194;
    }
    else
    {
      uint64_t v23 = v194;
    }
  }
  else
  {
    obuint64_t j = a7;
  }
  if (a6)
  {
    if (v92 != [(NSArray *)v89 count] - 1) {
      -[FigCaptureMovieFileSinkHeadPipeline _buildMovieFileSinkHeadPipeline:videoSourceCaptureOutput:audioSourceCaptureOutput:audioSourceCinematicAudioCaptureOutput:smartCameraInferenceOutput:detectedObjectBoxedMetadataOutputs:objectDetectionSourceOutput:metadataSourcePipelineOutputs:graph:parentPipeline:inferenceScheduler:captureDevice:audioSourceDelegate:fileCoordinatorStatusDelegate:irisRequestDelegate:masterClock:workgroup:videoGreenGhostMitigationEnabled:]();
    }
    if ((objc_msgSend(a10, "connectOutput:toInput:pipelineStage:", a6, -[NSArray objectAtIndexedSubscript:](v89, "objectAtIndexedSubscript:", v92), v180) & 1) == 0)goto LABEL_278; {
  }
    }
  a8 = 0;
  int v59 = v181;
LABEL_173:
  uint64_t v103 = v59 ^ 1u;
  v104 = [BWFileCoordinatorNode alloc];
  if (v23) {
    uint64_t v23 = *(unsigned char *)(v23 + 138) != 0;
  }
  uint64_t v105 = v54;
  if (v196) {
    BOOL v106 = v196[151] != 0;
  }
  else {
    BOOL v106 = 0;
  }
  LOBYTE(v175) = v106;
  v107 = -[BWFileCoordinatorNode initWithNumberOfVideoInputs:numberOfAudioInputs:numberOfMetadataInputs:numberOfActionOnlyOutputs:overCaptureEnabled:allowLowLatencyWhenPossible:useTrueVideoFileRecordingStaging:motionDataTimeMachine:](v104, "initWithNumberOfVideoInputs:numberOfAudioInputs:numberOfMetadataInputs:numberOfActionOnlyOutputs:overCaptureEnabled:allowLowLatencyWhenPossible:useTrueVideoFileRecordingStaging:motionDataTimeMachine:", v192, v191, v190, v186, v23, v103, v175, [*(id *)(v55 + 32) motionDataTimeMachine]);
  -[BWFileCoordinatorNode setFlagsLastFrameForVideoCompressor:](v107, "setFlagsLastFrameForVideoCompressor:", [v199 irisMovieCaptureEnabled] ^ 1);
  [(BWFileCoordinatorNode *)v107 setAudioSourceDelegate:a14];
  [(BWFileCoordinatorNode *)v107 setFileCoordiatorStatusDelegate:a15];
  if (([a11 addNode:v107 error:&v243] & 1) == 0) {
    goto LABEL_278;
  }
  v108 = v107;
  *(void *)(v55 + 40) = v108;
  v109 = [(BWNode *)v108 inputs];
  v110 = (void *)[*(id *)(v55 + 40) outputs];
  if (v105)
  {
    if ((objc_msgSend(a10, "connectOutput:toInput:pipelineStage:", v105, -[NSArray objectAtIndexedSubscript:](v109, "objectAtIndexedSubscript:", 0), 0) & 1) == 0)goto LABEL_278; {
    id v202 = (id)[v110 objectAtIndexedSubscript:0];
    }
    unsigned int v111 = 1;
  }
  else
  {
    unsigned int v111 = 0;
    id v202 = 0;
  }
  if (a4)
  {
    if ((objc_msgSend(a10, "connectOutput:toInput:pipelineStage:", a4, -[NSArray objectAtIndexedSubscript:](v109, "objectAtIndexedSubscript:", v111), 0) & 1) == 0)goto LABEL_278; {
    uint64_t v193 = [v110 objectAtIndexedSubscript:v111++];
    }
  }
  else
  {
    uint64_t v193 = 0;
  }
  if (a5)
  {
    if ((objc_msgSend(a10, "connectOutput:toInput:pipelineStage:", a5, -[NSArray objectAtIndexedSubscript:](v109, "objectAtIndexedSubscript:", v111), 0) & 1) == 0)goto LABEL_278; {
    uint64_t v198 = [v110 objectAtIndexedSubscript:v111++];
    }
  }
  else
  {
    uint64_t v198 = 0;
  }
  long long v218 = 0u;
  long long v219 = 0u;
  long long v216 = 0u;
  long long v217 = 0u;
  uint64_t v112 = [v31 countByEnumeratingWithState:&v216 objects:v248 count:16];
  if (v112)
  {
    uint64_t v113 = v112;
    uint64_t v114 = *(void *)v217;
    do
    {
      uint64_t v115 = 0;
      unsigned int v116 = v111;
      do
      {
        if (*(void *)v217 != v114) {
          objc_enumerationMutation(v31);
        }
        if (!objc_msgSend(a10, "connectOutput:toInput:pipelineStage:", *(void *)(*((void *)&v216 + 1) + 8 * v115), -[NSArray objectAtIndexedSubscript:](v109, "objectAtIndexedSubscript:", (int)v111 + v115), 0))goto LABEL_278; {
        objc_msgSend(v207, "addObject:", objc_msgSend(v110, "objectAtIndexedSubscript:", (int)v111 + v115++));
        }
      }
      while (v113 != v115);
      v111 += v115;
      uint64_t v113 = [v31 countByEnumeratingWithState:&v216 objects:v248 count:16];
    }
    while (v113);
    signed int v117 = v116 + v115;
  }
  else
  {
    signed int v117 = v111;
  }
  uint64_t v118 = [obj count];
  uint64_t v119 = v200;
  uint64_t v120 = (uint64_t)v202;
  v121 = v189;
  v122 = v207;
  if (!a8 && !v118) {
    goto LABEL_217;
  }
  uint64_t v123 = [v185 movieFileSinkPipelineConfiguration];
  if (v123)
  {
    if (*(unsigned char *)(v123 + 108)) {
      goto LABEL_217;
    }
  }
  if (a8)
  {
    *(void *)&v255[0] = 0;
    id v124 = -[FigCaptureMovieFileSinkHeadPipeline _buildFaceDetectionNode:parentPipeline:objectDetectionSourceOutput:faceDetectionNodeOut:](v200, (void *)[v185 movieFileSinkPipelineConfiguration], a11, a8, v255);
    if (!v124)
    {
      obuint64_t j = (id)[*(id *)&v255[0] boxedMetadataOutputs];
      uint64_t v119 = v200;
      goto LABEL_207;
    }
    id v65 = v124;
LABEL_310:
    FigDebugAssert3();
    return (uint64_t)v65;
  }
LABEL_207:
  long long v214 = 0u;
  long long v215 = 0u;
  long long v212 = 0u;
  long long v213 = 0u;
  uint64_t v125 = [obj countByEnumeratingWithState:&v212 objects:v247 count:16];
  if (v125)
  {
    uint64_t v126 = v125;
    uint64_t v127 = *(void *)v213;
    do
    {
      uint64_t v128 = 0;
      signed int v129 = v117;
      do
      {
        if (*(void *)v213 != v127) {
          objc_enumerationMutation(obj);
        }
        if (!objc_msgSend(a10, "connectOutput:toInput:pipelineStage:", *(void *)(*((void *)&v212 + 1) + 8 * v128), objc_msgSend((id)objc_msgSend(*(id *)(v119 + 40), "inputs"), "objectAtIndexedSubscript:", v117 + v128), 0))goto LABEL_278; {
        v122 = v207;
        }
        objc_msgSend(v207, "addObject:", objc_msgSend(v110, "objectAtIndexedSubscript:", v117 + v128));
        objc_msgSend(v204, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v207, "count") - 1));
        ++v128;
      }
      while (v126 != v128);
      v117 += v128;
      uint64_t v126 = [obj countByEnumeratingWithState:&v212 objects:v247 count:16];
    }
    while (v126);
    signed int v117 = v129 + v128;
  }
  v121 = v189;
  uint64_t v120 = (uint64_t)v202;
LABEL_217:
  if (v121)
  {
    id obja = (id)[v110 objectAtIndexedSubscript:v117];
    objc_msgSend(v122, "addObject:");
    *(_DWORD *)(v119 + 184) = [v122 count] - 1;
  }
  else
  {
    id obja = 0;
  }
  uint64_t v130 = v194;
  v131 = +[BWPipelineStage pipelineStageWithName:@"com.apple.coremedia.capture.moviefile.head" priority:14 workgroup:a18];
  if (v120)
  {
    v132 = v131;
    if ([v199 irisMovieCaptureEnabled])
    {
      if (v35 >= 0.0)
      {
        v133 = [BWPhotoDecompressorNode alloc];
        if (v194) {
          BOOL v134 = *(unsigned char *)(v194 + 138) != 0;
        }
        else {
          BOOL v134 = 0;
        }
        v135 = [(BWPhotoDecompressorNode *)v133 initWithSynchronizedSlaveAttachedMediaDecompressionEnabled:v134];
        if (([a11 addNode:v135 error:&v243] & 1) == 0
          || (objc_msgSend(a10, "connectOutput:toInput:pipelineStage:", v120, -[BWNode input](v135, "input"), v132) & 1) == 0)
        {
          goto LABEL_278;
        }
        uint64_t v120 = [(BWNode *)v135 output];
        *(void *)(v200 + 48) = v135;
      }
    }
  }
  if (v194) {
    v136 = *(void **)(v194 + 8);
  }
  else {
    v136 = 0;
  }
  [v136 requiredMaxFrameRate];
  float v138 = v137;
  v139 = +[FigCaptureCameraParameters sharedInstance];
  long long v208 = 0u;
  long long v209 = 0u;
  long long v210 = 0u;
  long long v211 = 0u;
  v140 = (void *)[a13 captureStreams];
  uint64_t v141 = [v140 countByEnumeratingWithState:&v208 objects:v246 count:16];
  if (!v141)
  {
    uint64_t v148 = v200;
    v149 = v207;
LABEL_249:
    uint64_t v157 = v120;
    uint64_t v155 = v198;
LABEL_250:
    uint64_t v159 = v193;
    if (v193 && ([v199 irisMovieCaptureEnabled] & 1) == 0)
    {
      v160 = objc_alloc_init(BWAudioConverterNode);
      [(BWNode *)v160 setName:@"AudioConverterNode"];
      [(BWAudioConverterNode *)v160 setCinematicAudioCapture:0];
      if (([a11 addNode:v160 error:&v243] & 1) == 0) {
        goto LABEL_278;
      }
      v161 = v160;
      uint64_t v148 = v200;
      *(void *)(v200 + 72) = v161;
      if ((objc_msgSend(a10, "connectOutput:toInput:pipelineStage:", v193, -[BWNode input](v161, "input"), v184) & 1) == 0) {
        goto LABEL_278;
      }
      uint64_t v159 = [*(id *)(v200 + 72) output];
    }
    if (v196 && v196[160] && v155)
    {
      id v203 = (id)v157;
      *(_DWORD *)(v148 + 192) = -1;
      v162 = objc_alloc_init(BWAudioRemixAnalysisMetadataNode);
      if (!v162) {
        goto LABEL_278;
      }
      v163 = v162;
      if (![a11 addNode:v162 error:&v243]) {
        goto LABEL_278;
      }
      if (v243) {
        goto LABEL_278;
      }
      v164 = v163;
      *(void *)(v148 + 88) = v164;
      if ((objc_msgSend(a10, "connectOutput:toInput:pipelineStage:", v155, -[BWNode input](v164, "input"), v184) & 1) == 0) {
        goto LABEL_278;
      }
      uint64_t v165 = v159;
      uint64_t v166 = v148;
      uint64_t v167 = [*(id *)(v148 + 88) output];
      objc_msgSend(v149, "addObject:", objc_msgSend(*(id *)(v166 + 88), "metadataOutput"));
      *(_DWORD *)(v166 + 192) = [v149 count] - 1;
      v168 = objc_alloc_init(BWAudioConverterNode);
      [(BWNode *)v168 setName:@"Cinematic Audio Converter"];
      int v169 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v121, "sourceConfiguration"), "requiredFormat"), "format");
      if (!v169 || (FigCapturePixelFormatIs422(v169) & 1) == 0)
      {
        v255[0] = xmmword_1A5EFDD78;
        v255[1] = unk_1A5EFDD88;
        v244[0] = 0x1EFA48D60;
        v244[1] = 0x1EFA48DA0;
        v245[0] = &unk_1EFAFE460;
        v245[1] = &unk_1EFAFE478;
        v244[2] = 0x1EFA48EE0;
        v245[2] = [MEMORY[0x1E4F1C9B8] dataWithBytes:v255 length:32];
        -[BWAudioConverterNode setSettings:](v168, "setSettings:", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v245 forKeys:v244 count:3]);
      }
      [(BWAudioConverterNode *)v168 setCinematicAudioCapture:1];
      if (([a11 addNode:v168 error:&v243] & 1) == 0) {
        goto LABEL_278;
      }
      v170 = v168;
      *(void *)(v200 + 80) = v170;
      if ((objc_msgSend(a10, "connectOutput:toInput:pipelineStage:", v167, -[BWNode input](v170, "input"), v184) & 1) == 0) {
        goto LABEL_278;
      }
      uint64_t v148 = v200;
      uint64_t v159 = v165;
      uint64_t v155 = [*(id *)(v200 + 80) output];
      uint64_t v157 = (uint64_t)v203;
    }
    if (obja)
    {
      v171 = objc_alloc_init(BWVideoOrientationMetadataNode);
      if (v130)
      {
        -[BWVideoOrientationMetadataNode setSourcePosition:](v171, "setSourcePosition:", [*(id *)(v130 + 8) sourcePosition]);
        v172 = *(void **)(v130 + 8);
      }
      else
      {
        -[BWVideoOrientationMetadataNode setSourcePosition:](v171, "setSourcePosition:", [0 sourcePosition]);
        v172 = 0;
      }
      -[BWVideoOrientationMetadataNode setSourceDeviceType:](v171, "setSourceDeviceType:", [v172 sourceDeviceType]);
      [(BWVideoOrientationMetadataNode *)v171 setMasterClock:a17];
      -[BWVideoOrientationMetadataNode setPhysicalMirroringForMovieRecordingEnabled:](v171, "setPhysicalMirroringForMovieRecordingEnabled:", [v121 physicalMirroringForMovieRecordingEnabled]);
      if (([a11 addNode:v171 error:&v243] & 1) == 0
        || (objc_msgSend(a10, "connectOutput:toInput:pipelineStage:", obja, -[BWNode input](v171, "input"), v184) & 1) == 0)
      {
        goto LABEL_278;
      }
      objc_msgSend(v149, "setObject:atIndexedSubscript:", -[BWNode output](v171, "output"), *(int *)(v200 + 184));
      *(void *)(v200 + 120) = (id)[v121 connectionID];
      *(void *)(v200 + 128) = (id)objc_msgSend((id)objc_msgSend(v121, "sourceConfiguration"), "sourceID");
      *(_DWORD *)(v200 + 188) = [v121 underlyingDeviceType];
      v173 = v171;
      uint64_t v148 = v200;
      *(void *)(v200 + 96) = v173;
    }
    *(void *)(v148 + 144) = v157;
    *(void *)(v148 + 152) = v159;
    *(void *)(v148 + 160) = v155;
    if ([v149 count]) {
      *(void *)(v148 + 168) = v149;
    }
    if ([v204 count]) {
      *(void *)(v148 + 176) = v204;
    }
    goto LABEL_279;
  }
  uint64_t v142 = v141;
  uint64_t v143 = *(void *)v209;
LABEL_232:
  uint64_t v144 = 0;
  while (1)
  {
    if (*(void *)v209 != v143) {
      objc_enumerationMutation(v140);
    }
    v145 = *(void **)(*((void *)&v208 + 1) + 8 * v144);
    uint64_t v146 = [v145 portType];
    uint64_t v147 = [v145 sensorIDString];
    if (v138 <= 60.0) {
      break;
    }
    if ([(FigCaptureCameraParameters *)v139 chromaticDefringingEnabledForSlomoForPortType:v146 sensorIDString:v147])
    {
      goto LABEL_242;
    }
LABEL_239:
    if (v142 == ++v144)
    {
      uint64_t v142 = [v140 countByEnumeratingWithState:&v208 objects:v246 count:16];
      if (v142) {
        goto LABEL_232;
      }
      uint64_t v148 = v200;
      v121 = v189;
      v149 = v207;
      uint64_t v130 = v194;
      goto LABEL_249;
    }
  }
  if (![(FigCaptureCameraParameters *)v139 chromaticDefringingEnabledForVideoForPortType:v146 sensorIDString:v147])goto LABEL_239; {
LABEL_242:
  }
  uint64_t v150 = [v145 sensorIDString];
  uint64_t v151 = [v145 portType];
  uint64_t v130 = v194;
  if (v194) {
    BOOL v152 = *(unsigned char *)(v194 + 138) != 0;
  }
  else {
    BOOL v152 = 0;
  }
  v121 = v189;
  v149 = v207;
  uint64_t v153 = v120;
  v154 = [[BWVideoDefringingNode alloc] initWithSensorIDString:v150 portType:v151 propagateSynchronizedSlaveFrame:v152 isSlomo:v138 > 60.0];
  uint64_t v155 = v198;
  if (v154)
  {
    v156 = v154;
    if (([a11 addNode:v154 error:&v243] & 1) != 0
      && (objc_msgSend(a10, "connectOutput:toInput:pipelineStage:", v153, -[BWNode input](v156, "input"), +[BWPipelineStage pipelineStageWithName:priority:](BWPipelineStage, "pipelineStageWithName:priority:", @"com.apple.coremedia.capture.moviefile.defringing", 14)) & 1) != 0)
    {
      uint64_t v157 = [(BWNode *)v156 output];
      [*(id *)(v200 + 48) setDownstreamIsSharingOutputPool:1];
      v158 = v156;
      uint64_t v148 = v200;
      *(void *)(v200 + 56) = v158;
      goto LABEL_250;
    }
  }
LABEL_278:
  FigDebugAssert3();
LABEL_279:
  if (!v243) {
    return 0;
  }
  return [v243 code];
}

- (void)dealloc
{
  if ([(BWIrisStagingNode *)self->_irisStagingNode temporaryMovieDirectoryURL]) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "removeItemAtURL:error:", -[BWIrisStagingNode temporaryMovieDirectoryURL](self->_irisStagingNode, "temporaryMovieDirectoryURL"), 0);
  }

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureMovieFileSinkHeadPipeline;
  [(FigCapturePipeline *)&v3 dealloc];
}

- (BWMRCSceneObserver)mrcSceneObserver
{
  return [(BWSceneClassifierSinkNode *)self->_sceneClassifierSinkNode mrcSceneObserver];
}

- (BWSemanticStyleSceneObserver)semanticStyleSceneObserver
{
  return [(BWSceneClassifierSinkNode *)self->_sceneClassifierSinkNode semanticStyleSceneObserver];
}

- (void)setSceneClassifierSuspended:(BOOL)a3
{
  sceneClassifierSinkNode = self->_sceneClassifierSinkNode;
  if (sceneClassifierSinkNode)
  {
    BOOL v6 = a3;
    v7 = [(BWNodeConnection *)[(BWNodeInput *)[(BWNode *)sceneClassifierSinkNode input] connection] output];
    if (!v7)
    {
      uint64_t v10 = v3;
      LODWORD(v9) = 0;
      FigDebugAssert3();
    }
    -[BWNodeOutput setDiscardsSampleData:](v7, "setDiscardsSampleData:", v6, v9, v10);
    sceneClassifierPipelineUpstreamOutput = self->_sceneClassifierPipelineUpstreamOutput;
    if (!sceneClassifierPipelineUpstreamOutput)
    {
      FigDebugAssert3();
      sceneClassifierPipelineUpstreamOutput = self->_sceneClassifierPipelineUpstreamOutput;
    }
    [(BWNodeOutput *)sceneClassifierPipelineUpstreamOutput setDiscardsSampleData:v6];
  }
}

- (BOOL)sceneClassifierSuspended
{
  return [(BWNodeOutput *)self->_sceneClassifierPipelineUpstreamOutput discardsSampleData];
}

- (id)_buildFaceDetectionNode:(void *)a3 parentPipeline:(uint64_t)a4 objectDetectionSourceOutput:(void *)a5 faceDetectionNodeOut:
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  v8 = a2;
  v21 = 0;
  if (a2) {
    uint64_t v9 = (void *)a2[5];
  }
  else {
    uint64_t v9 = 0;
  }
  if ([v9 count])
  {
    uint64_t v10 = (void *)[MEMORY[0x1E4F1CA48] array];
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
    uint64_t v10 = 0;
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

- (NSString)videoConnectionID
{
  return self->_videoConnectionID;
}

- (int)indexOfAudioRemixInMetadataOutputs
{
  return self->_indexOfAudioRemixInMetadataOutputs;
}

- (void)_buildMovieFileSinkHeadPipeline:videoSourceCaptureOutput:audioSourceCaptureOutput:audioSourceCinematicAudioCaptureOutput:smartCameraInferenceOutput:detectedObjectBoxedMetadataOutputs:objectDetectionSourceOutput:metadataSourcePipelineOutputs:graph:parentPipeline:inferenceScheduler:captureDevice:audioSourceDelegate:fileCoordinatorStatusDelegate:irisRequestDelegate:masterClock:workgroup:videoGreenGhostMitigationEnabled:.cold.1()
{
  __assert_rtn("-[FigCaptureMovieFileSinkHeadPipeline _buildMovieFileSinkHeadPipeline:videoSourceCaptureOutput:audioSourceCaptureOutput:audioSourceCinematicAudioCaptureOutput:smartCameraInferenceOutput:detectedObjectBoxedMetadataOutputs:objectDetectionSourceOutput:metadataSourcePipelineOutputs:graph:parentPipeline:inferenceScheduler:captureDevice:audioSourceDelegate:fileCoordinatorStatusDelegate:irisRequestDelegate:masterClock:workgroup:videoGreenGhostMitigationEnabled:]", "FigCaptureMovieFileSinkPipeline.m", 1189, "curStagingIndex == irisStagingNodeInputs.count - 1");
}

@end