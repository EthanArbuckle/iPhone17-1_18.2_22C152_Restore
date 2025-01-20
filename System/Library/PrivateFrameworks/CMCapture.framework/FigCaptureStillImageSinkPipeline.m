@interface FigCaptureStillImageSinkPipeline
+ (NSString)pipelineBaseName;
+ (void)initialize;
- (BWCompressedShotBufferNode)compressedShotBufferNode;
- (BWPortraitHDRStagingNode)portraitHDRStagingNode;
- (BWStillImageCoordinatorNode)stillImageCoordinatorNode;
- (BWStillImageSampleBufferSinkNode)stillImageSinkNode;
- (FigCaptureStillImageSinkPipeline)initWithConfiguration:(id)a3 captureDevice:(id)a4 sourceOutputsByPortType:(id)a5 captureStatusDelegate:(id)a6 inferenceScheduler:(id)a7 graph:(id)a8 name:(id)a9;
- (uint64_t)_buildStillImageSinkPipelineWithConfiguration:(void *)a3 sourceOutputsByPortType:(uint64_t)a4 captureStatusDelegate:(uint64_t)a5 inferenceScheduler:(void *)a6 graph:;
- (void)dealloc;
- (void)enablePrepareTimeAllocationsForDeferredPrepare;
@end

@implementation FigCaptureStillImageSinkPipeline

+ (void)initialize
{
}

- (FigCaptureStillImageSinkPipeline)initWithConfiguration:(id)a3 captureDevice:(id)a4 sourceOutputsByPortType:(id)a5 captureStatusDelegate:(id)a6 inferenceScheduler:(id)a7 graph:(id)a8 name:(id)a9
{
  v17.receiver = self;
  v17.super_class = (Class)FigCaptureStillImageSinkPipeline;
  v15 = -[FigCaptureSinkPipeline initWithGraph:name:sinkID:](&v17, sel_initWithGraph_name_sinkID_, a8, a9, objc_msgSend((id)objc_msgSend(a3, "sinkConfiguration"), "sinkID"));
  if (v15)
  {
    v15->_captureDevice = (BWFigVideoCaptureDevice *)a4;
    if (-[FigCaptureStillImageSinkPipeline _buildStillImageSinkPipelineWithConfiguration:sourceOutputsByPortType:captureStatusDelegate:inferenceScheduler:graph:]((uint64_t)v15, a3, a5, (uint64_t)a6, (uint64_t)a7, a8))
    {
      fig_log_get_emitter();
      FigDebugAssert3();

      return 0;
    }
  }
  return v15;
}

- (uint64_t)_buildStillImageSinkPipelineWithConfiguration:(void *)a3 sourceOutputsByPortType:(uint64_t)a4 captureStatusDelegate:(uint64_t)a5 inferenceScheduler:(void *)a6 graph:
{
  uint64_t v391 = *MEMORY[0x1E4F143B8];
  if (!result) {
    return result;
  }
  v8 = (id *)result;
  unsigned int v370 = 0;
  id v369 = 0;
  [a2 sinkConfiguration];
  objc_opt_class();
  v292 = 0;
  if (objc_opt_isKindOfClass()) {
    v292 = (void *)[a2 sinkConfiguration];
  }
  v266 = objc_alloc_init(BWStillImageNodeConfiguration);
  [(BWStillImageNodeConfiguration *)v266 setFigThreadPriority:14];
  v9 = +[BWPipelineStage pipelineStageWithName:@"com.apple.coremedia.capture.stillimage" priority:14];
  uint64_t v10 = objc_msgSend((id)objc_msgSend(v8[6], "captureStream"), "portType");
  v11 = +[FigCaptureCameraParameters sharedInstance];
  uint64_t v265 = [(FigCaptureCameraParameters *)v11 cameraTuningParameters];
  uint64_t v287 = objc_msgSend((id)objc_msgSend(v8[6], "bravoTelephotoCaptureStream"), "portType");
  uint64_t v12 = objc_msgSend((id)objc_msgSend(v8[6], "pearlInfraredCaptureStream"), "portType");
  uint64_t v277 = v12;
  if (v12) {
    uint64_t v302 = [a3 objectForKeyedSubscript:v12];
  }
  else {
    uint64_t v302 = 0;
  }
  int v13 = [v8[6] isBravoVariant];
  uint64_t v14 = [v8[6] pearlInfraredCaptureStream];
  uint64_t v286 = objc_msgSend((id)objc_msgSend(v8[6], "captureStream"), "sensorIDDictionary");
  uint64_t v285 = objc_msgSend((id)objc_msgSend(v8[6], "bravoTelephotoCaptureStream"), "sensorIDDictionary");
  uint64_t v267 = objc_msgSend((id)objc_msgSend(v8[6], "pearlInfraredCaptureStream"), "sensorIDDictionary");
  uint64_t v15 = [v8[6] captureStream];
  int v289 = v13;
  if (v13)
  {
    uint64_t v15 = [v8[6] bravoTelephotoCaptureStream];
  }
  else if (v14)
  {
    uint64_t v15 = [v8[6] pearlInfraredCaptureStream];
  }
  v16 = (void *)v15;
  v305 = a6;
  [v8[6] setStillImageCaptureEnabled:1];
  objc_msgSend(v8[6], "setIrisFrameHarvestingEnabled:", objc_msgSend(v292, "irisFrameHarvestingEnabled"));
  objc_msgSend(v8[6], "setStillImageFusionScheme:", objc_msgSend(a2, "noiseReductionAndFusionScheme"));
  unsigned int v297 = [v292 depthDataDeliveryEnabled];
  uint64_t v276 = v14;
  if (a2) {
    BOOL v17 = a2[104] != 0;
  }
  else {
    BOOL v17 = 0;
  }
  unsigned int v18 = [v292 portraitEffectsMatteDeliveryEnabled];
  [a2 portraitEffectsMatteMainImageDownscalingFactor];
  int v20 = v19;
  if (a2 && a2[107])
  {
    BOOL v296 = a2[108] != 0;
    unsigned int v284 = 1;
  }
  else
  {
    unsigned int v284 = 0;
    BOOL v296 = 0;
  }
  unsigned int v269 = [a2 allowsMultipleInflightCaptures];
  unsigned int v281 = [v292 bravoConstituentPhotoDeliveryEnabled];
  int v21 = v297 | v281;
  uint64_t v288 = v10;
  int v293 = v297 | v281;
  if (a2 && (v21 & 1) == 0 && a2[105])
  {
    int v22 = 1;
    unsigned int v268 = 1;
  }
  else
  {
    unsigned int v268 = 0;
    int v22 = v281 | v21 & v289;
  }
  int v294 = v22;
  unsigned int v23 = [v292 filterRenderingEnabled];
  objc_msgSend(v8[6], "requestedZoomFactorRelativeToPortType:", objc_msgSend(v16, "portType"));
  int v25 = v24;
  uint64_t v26 = [v16 portType];
  uint64_t v27 = [v16 sensorIDString];
  LODWORD(v28) = v25;
  int v29 = [(FigCaptureCameraParameters *)v11 disparityRefinementTypeForPortType:v26 sensorIDString:v27 zoomFactor:v28];
  unsigned int v282 = v23;
  if ((v297 & v18) == 1)
  {
    if (v29) {
      unsigned int v30 = v23;
    }
    else {
      unsigned int v30 = 0;
    }
    unsigned int v261 = v30;
  }
  else
  {
    unsigned int v261 = 0;
  }
  [v8[6] setStillImageISPChromaNoiseReductionEnabled:v17];
  [v8[6] setStillImageGNRHDREnabled:v296];
  v291 = (void *)[MEMORY[0x1E4F1CA48] arrayWithObject:v288];
  v283 = v9;
  v31 = v9;
  v32 = v9;
  if (v294)
  {
    v32 = +[BWPipelineStage pipelineStageWithName:@"com.apple.coremedia.capture.stillimage.gnr.default" priority:14];
    v31 = +[BWPipelineStage pipelineStageWithName:@"com.apple.coremedia.capture.stillimage.gnr.telephoto" priority:14];
    v283 = +[BWPipelineStage pipelineStageWithName:@"com.apple.coremedia.capture.stillimage.stereofusion" priority:14];
  }
  v300 = v9;
  unsigned int v279 = v18;
  v257 = v31;
  v258 = v32;
  BOOL v273 = [a2 stillImageStabilizationSupported]
      && ([a2 allowedToModifyInputBuffers] & 1) != 0;
  unsigned int v264 = [v292 irisFrameHarvestingEnabled];
  id v33 = v8[6];
  v298 = a2;
  uint64_t v34 = [a2 stillImageStabilizationSupported];
  long long v371 = 0u;
  long long v372 = 0u;
  long long v373 = 0u;
  long long v374 = 0u;
  v35 = (void *)[v33 captureStreams];
  uint64_t v36 = [v35 countByEnumeratingWithState:&v371 objects:v390 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v372;
    while (2)
    {
      for (uint64_t i = 0; i != v37; ++i)
      {
        if (*(void *)v372 != v38) {
          objc_enumerationMutation(v35);
        }
        if ([*(id *)(*((void *)&v371 + 1) + 8 * i) hasSphere])
        {
          int v40 = 1;
          goto LABEL_44;
        }
      }
      uint64_t v37 = [v35 countByEnumeratingWithState:&v371 objects:v390 count:16];
      if (v37) {
        continue;
      }
      break;
    }
  }
  int v40 = 0;
LABEL_44:
  uint64_t v41 = [v298 noiseReductionAndFusionScheme];
  if ((int)v41 >= 3) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Only FigCaptureStillImageNoiseReductionAndFusionSchemeGeneralNoiseReductionAndFusion and bellow supported" userInfo:0]);
  }
  uint64_t v42 = v41;
  v260 = v11;
  v301 = v8;
  if (v41 == 2) {
    int v43 = 0;
  }
  else {
    int v43 = v34;
  }
  unsigned int v290 = v41;
  int v299 = v43;
  if (v284)
  {
    BOOL v44 = v41 == 2 && v296;
    uint64_t v45 = v296 & (v294 ^ 1u);
    if (v44)
    {
      v262 = 0;
      unsigned int v272 = v268;
    }
    else
    {
      v46 = [BWHDRNode alloc];
      if (v298) {
        uint64_t v47 = *((unsigned int *)v298 + 22);
      }
      else {
        uint64_t v47 = 0;
      }
      v48 = [(BWHDRNode *)v46 initWithClientPID:v47 sensorIDDictionary:v286];
      v368.receiver = v8;
      v368.super_class = (Class)FigCaptureStillImageSinkPipeline;
      if ((objc_msgSendSuper2(&v368, sel_addNode_error_, v48, &v369) & 1) == 0)
      {
        fig_log_get_emitter();
        goto LABEL_281;
      }
      [(BWHDRNode *)v48 setAttachesInputBracketToOutputSampleBuffer:0];
      [(BWHDRNode *)v48 setAlwaysRequestsPreBracketedEV0:v264];
      v262 = v48;
      [(BWHDRNode *)v48 setSupportsStereoFusionCaptures:v268];
      unsigned int v272 = v268;
      uint64_t v42 = v290;
    }
  }
  else
  {
    uint64_t v45 = 0;
    unsigned int v272 = 0;
    v262 = 0;
  }
  uint64_t v49 = v34 & v40;
  uint64_t v50 = objc_msgSend((id)objc_msgSend(v8[6], "captureStream"), "sensorIDString");
  uint64_t v51 = objc_msgSend((id)objc_msgSend(v8[6], "bravoTelephotoCaptureStream"), "sensorIDString");
  uint64_t v256 = objc_msgSend((id)objc_msgSend(v8[6], "pearlInfraredCaptureStream"), "sensorIDString");
  uint64_t v259 = v50;
  uint64_t v278 = v51;
  unsigned int v275 = v34;
  if (v42 == 2)
  {
    int v52 = v294 ^ 1;
    v53 = [BWGNRNode alloc];
    if ((v289 & (v294 ^ 1)) != 0) {
      uint64_t v54 = v287;
    }
    else {
      uint64_t v54 = 0;
    }
    if ((v289 & v52) != 0) {
      uint64_t v55 = v51;
    }
    else {
      uint64_t v55 = 0;
    }
    uint64_t v56 = v285;
    if ((v289 & v52) == 0) {
      uint64_t v56 = 0;
    }
    uint64_t v57 = v49;
    v58 = [(BWGNRNode *)v53 initWithSISEnabled:v34 OISEnabled:v49 LTMHDREnabled:v296 & v293 | v45 processingLTMHDRFusion:v45 portType:v288 sensorID:v50 sensorIDDictionary:v286 telephotoPortType:v54 telephotoSensorID:v55 telephotoSensorIDDictionary:v56];
    v367.receiver = v8;
    v367.super_class = (Class)FigCaptureStillImageSinkPipeline;
    if (!objc_msgSendSuper2(&v367, sel_addNode_error_, v58, &v369))
    {
      fig_log_get_emitter();
      goto LABEL_281;
    }
    v59 = v8;
    [(BWGNRNode *)v58 setAttachesInputBracketToOutputSampleBuffer:0];
    [(BWGNRNode *)v58 setUsesHDRPreBracketFrameForErrorRecoveryDownstream:v296];
    [(BWGNRNode *)v58 setAllowedToModifyInputBuffers:v273];
    [v8[6] registerForAEMatrixMetadata];
    if (v294) {
      v60 = (__CFString *)[NSString stringWithFormat:@"GNR-%@", v288];
    }
    else {
      v60 = @"GNR";
    }
    v61 = &classRef_BWColorConstancyProcessorController;
    uint64_t v62 = v287;
    uint64_t v42 = v290;
    uint64_t v63 = v302;
    v271 = (BWNoiseReducerNode *)v58;
    [(BWNode *)v58 setName:v60];
    uint64_t v49 = v57;
  }
  else
  {
    v271 = 0;
    v59 = v8;
    v61 = &classRef_BWColorConstancyProcessorController;
    uint64_t v62 = v287;
    uint64_t v63 = v302;
  }
  if (v299)
  {
    uint64_t v64 = v49;
    v65 = [[BWSISNode alloc] initWithCameraTuningDictionary:v265 sensorIDDictionary:v286 fusionScheme:v42];
    v66 = v65;
    if (v42 == 1) {
      v67 = @"TMBNR";
    }
    else {
      v67 = 0;
    }
    [(BWNode *)v65 setName:v67];
    v68 = (objc_class *)v61[153];
    v366.receiver = v59;
    v366.super_class = v68;
    if ((objc_msgSendSuper2(&v366, sel_addNode_error_, v66, &v369) & 1) == 0)
    {
      fig_log_get_emitter();
      goto LABEL_281;
    }
    [(BWSISNode *)v66 setAttachesInputBracketToOutputSampleBuffer:0];
    v280 = v66;
    [(BWSISNode *)v66 setAlwaysRequestsPreBracketedEV0:v264];
    if (v298) {
      BOOL v69 = v298[106] != 0;
    }
    else {
      BOOL v69 = 0;
    }
    v70 = v300;
    uint64_t v49 = v64;
    [(BWSISNode *)v280 setLivePhotoSupported:v69];
    [(BWSISNode *)v280 setOISSupported:v64];
    [v59[6] registerForAEMatrixMetadata];
    v59[12] = v280;
  }
  else
  {
    v280 = 0;
    v70 = v300;
  }
  if (v294)
  {
    if (v49) {
      uint64_t v49 = objc_msgSend((id)objc_msgSend(v59[6], "bravoTelephotoCaptureStream"), "hasSphere");
    }
    v71 = [[BWGNRNode alloc] initWithSISEnabled:v275 OISEnabled:v49 LTMHDREnabled:v296 & v293 processingLTMHDRFusion:v296 & v293 portType:v62 sensorID:v278 sensorIDDictionary:v285 telephotoPortType:0 telephotoSensorID:0 telephotoSensorIDDictionary:0];
    v72 = (objc_class *)v61[153];
    v365.receiver = v59;
    v365.super_class = v72;
    v73 = v305;
    if (!objc_msgSendSuper2(&v365, sel_addNode_error_, v71, &v369))
    {
      fig_log_get_emitter();
      goto LABEL_281;
    }
    [(BWGNRNode *)v71 setAttachesInputBracketToOutputSampleBuffer:0];
    [(BWGNRNode *)v71 setUsesHDRPreBracketFrameForErrorRecoveryDownstream:v296];
    [(BWGNRNode *)v71 setAllowedToModifyInputBuffers:v273];
    -[BWNode setName:](v71, "setName:", [NSString stringWithFormat:@"GNR-%@", v62]);
  }
  else
  {
    v71 = 0;
    v73 = v305;
  }
  v274 = v71;
  if (v63)
  {
    v74 = [BWAttachedMediaSplitNode alloc];
    v389 = @"Depth";
    v75 = -[BWAttachedMediaSplitNode initWithAttachedMediaKeys:](v74, "initWithAttachedMediaKeys:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v389 count:1]);
    v364.receiver = v59;
    v364.super_class = (Class)FigCaptureStillImageSinkPipeline;
    if ((objc_msgSendSuper2(&v364, sel_addNode_error_, v75, &v369) & 1) == 0
      || (objc_msgSend(v73, "connectOutput:toInput:pipelineStage:", v63, -[BWNode input](v75, "input"), v70) & 1) == 0)
    {
      fig_log_get_emitter();
      goto LABEL_281;
    }
    [(BWNode *)v75 setName:@"Still Image IR-Depth Splitter"];
    [(BWAttachedMediaSplitNode *)v75 setEmitsNodeErrorsForMissingAttachedMedia:1];
    uint64_t v63 = [(NSArray *)[(BWNode *)v75 outputs] objectAtIndexedSubscript:0];
  }
  if (v62 && [a3 objectForKeyedSubscript:v62]) {
    [v291 addObject:v62];
  }
  if (v277 && [a3 objectForKeyedSubscript:v277]) {
    [v291 addObject:v277];
  }
  if ([v59[6] zeroShutterLagEnabled])
  {
    v76 = [[BWStillImageTimeMachineFrameCoordinatorNode alloc] initWithPortTypes:v291];
    v363.receiver = v59;
    v363.super_class = (Class)FigCaptureStillImageSinkPipeline;
    if ((objc_msgSendSuper2(&v363, sel_addNode_error_, v76, &v369) & 1) == 0)
    {
      fig_log_get_emitter();
LABEL_281:
      FigDebugAssert3();
      goto LABEL_387;
    }
  }
  else
  {
    v76 = 0;
  }
  v77 = [[BWStillImageCoordinatorNode alloc] initWithCaptureDevice:v301[6] inputPortTypes:v291 sensorRawInputPortTypes:0 highResStillImageDimensions:0];
  [(BWStillImageCoordinatorNode *)v77 setStillImageCaptureStatusDelegate:a4];
  [(BWStillImageCoordinatorNode *)v77 setStillImageCapturePipeliningMode:v269];
  v362.receiver = v301;
  v362.super_class = (Class)FigCaptureStillImageSinkPipeline;
  if ((objc_msgSendSuper2(&v362, sel_addNode_error_, v77, &v369) & 1) == 0)
  {
    fig_log_get_emitter();
    goto LABEL_281;
  }
  v303 = v77;
  v301[7] = v77;
  if (v76)
  {
    long long v361 = 0uLL;
    long long v360 = 0uLL;
    long long v359 = 0uLL;
    long long v358 = 0uLL;
    uint64_t v78 = [a3 countByEnumeratingWithState:&v358 objects:v388 count:16];
    if (v78)
    {
      uint64_t v79 = v78;
      uint64_t v80 = *(void *)v359;
      uint64_t v81 = *MEMORY[0x1E4F52E00];
      while (2)
      {
        for (uint64_t j = 0; j != v79; ++j)
        {
          if (*(void *)v359 != v80) {
            objc_enumerationMutation(a3);
          }
          v83 = *(void **)(*((void *)&v358 + 1) + 8 * j);
          uint64_t v84 = [a3 objectForKeyedSubscript:v83];
          uint64_t v85 = [(BWStillImageTimeMachineFrameCoordinatorNode *)v76 inputForPortType:v83];
          if ([v83 isEqualToString:v81]) {
            uint64_t v86 = v63;
          }
          else {
            uint64_t v86 = v84;
          }
          if (([v305 connectOutput:v86 toInput:v85 pipelineStage:v300] & 1) == 0
            || (objc_msgSend(v305, "connectOutput:toInput:pipelineStage:", -[BWStillImageTimeMachineFrameCoordinatorNode outputForPortType:](v76, "outputForPortType:", v83), objc_msgSend(v301[7], "inputForPortType:", v83), v300) & 1) == 0)
          {
            fig_log_get_emitter();
            goto LABEL_281;
          }
        }
        v70 = v300;
        uint64_t v79 = [a3 countByEnumeratingWithState:&v358 objects:v388 count:16];
        if (v79) {
          continue;
        }
        break;
      }
    }
  }
  else
  {
    long long v357 = 0uLL;
    long long v356 = 0uLL;
    long long v355 = 0uLL;
    long long v354 = 0uLL;
    uint64_t v87 = [a3 countByEnumeratingWithState:&v354 objects:v387 count:16];
    if (v87)
    {
      uint64_t v88 = v87;
      uint64_t v89 = *(void *)v355;
      uint64_t v90 = *MEMORY[0x1E4F52E00];
      while (2)
      {
        for (uint64_t k = 0; k != v88; ++k)
        {
          if (*(void *)v355 != v89) {
            objc_enumerationMutation(a3);
          }
          v92 = *(void **)(*((void *)&v354 + 1) + 8 * k);
          uint64_t v93 = [a3 objectForKeyedSubscript:v92];
          uint64_t v94 = [v301[7] inputForPortType:v92];
          if ([v92 isEqualToString:v90]) {
            uint64_t v95 = v63;
          }
          else {
            uint64_t v95 = v93;
          }
          if (![v305 connectOutput:v95 toInput:v94 pipelineStage:v70])
          {
            fig_log_get_emitter();
            goto LABEL_281;
          }
        }
        uint64_t v88 = [a3 countByEnumeratingWithState:&v354 objects:v387 count:16];
        if (v88) {
          continue;
        }
        break;
      }
    }
  }
  v96 = [BWStillImageBufferRouterNode alloc];
  if (v290 == 2) {
    uint64_t v97 = v275;
  }
  else {
    uint64_t v97 = 0;
  }
  v98 = [(BWStillImageBufferRouterNode *)v96 initWithInputPortTypes:v291 HDRSupported:v284 SISSupported:v275 GNRSISSupported:v97 LTMHDRSupported:v296 depthDataDeliveryEnabled:v297];
  v353.receiver = v301;
  v353.super_class = (Class)FigCaptureStillImageSinkPipeline;
  if ((objc_msgSendSuper2(&v353, sel_addNode_error_, v98, &v369) & 1) == 0)
  {
    fig_log_get_emitter();
    goto LABEL_281;
  }
  long long v352 = 0u;
  long long v351 = 0u;
  long long v350 = 0u;
  long long v349 = 0u;
  uint64_t v99 = [v291 countByEnumeratingWithState:&v349 objects:v386 count:16];
  if (v99)
  {
    uint64_t v100 = v99;
    uint64_t v101 = *(void *)v350;
LABEL_135:
    uint64_t v102 = 0;
    while (1)
    {
      if (*(void *)v350 != v101) {
        objc_enumerationMutation(v291);
      }
      if (!objc_msgSend(v305, "connectOutput:toInput:pipelineStage:", -[BWStillImageCoordinatorNode outputForPortType:](v303, "outputForPortType:", *(void *)(*((void *)&v349 + 1) + 8 * v102)), -[BWStillImageBufferRouterNode inputForPortType:](v98, "inputForPortType:", *(void *)(*((void *)&v349 + 1) + 8 * v102)), v70))goto LABEL_454; {
      if (v100 == ++v102)
      }
      {
        uint64_t v100 = [v291 countByEnumeratingWithState:&v349 objects:v386 count:16];
        if (v100) {
          goto LABEL_135;
        }
        break;
      }
    }
  }
  uint64_t v103 = [(BWStillImageBufferRouterNode *)v98 defaultOutput];
  uint64_t v104 = [(BWStillImageBufferRouterNode *)v98 bravoTelephotoOutput];
  uint64_t v105 = [(BWStillImageBufferRouterNode *)v98 pearlInfraredOutput];
  if (!v262)
  {
    v106 = v280;
    goto LABEL_148;
  }
  v106 = v280;
  if (((v293 | v272) & 1) == 0)
  {
    if (objc_msgSend(v305, "connectOutput:toInput:pipelineStage:", -[BWStillImageBufferRouterNode HDROutput](v98, "HDROutput"), -[BWNode input](v262, "input"), v70))goto LABEL_148; {
    goto LABEL_454;
    }
  }
  if ((v293 & v289) == 1)
  {
    if (objc_msgSend(v305, "connectOutput:toInput:pipelineStage:", -[BWStillImageBufferRouterNode bravoTelephotoOutput](v98, "bravoTelephotoOutput"), -[BWNode input](v262, "input"), v70))
    {
      uint64_t v104 = [(BWNode *)v262 output];
      goto LABEL_148;
    }
LABEL_454:
    fig_log_get_emitter();
    goto LABEL_281;
  }
LABEL_148:
  if (v106
    && (objc_msgSend(v305, "connectOutput:toInput:pipelineStage:", -[BWStillImageBufferRouterNode SISOutput](v98, "SISOutput"), -[BWNode input](v106, "input"), v70) & 1) == 0)
  {
    goto LABEL_454;
  }
  if (v262) {
    int v107 = v272;
  }
  else {
    int v107 = 1;
  }
  int v108 = v293 | v107;
  if (v290) {
    BOOL v109 = 1;
  }
  else {
    BOOL v109 = v106 == 0;
  }
  int v110 = !v109;
  if (v108 != 1 || v110)
  {
    if (v108) {
      int v111 = 1;
    }
    else {
      int v111 = 2;
    }
    int v112 = v108 ^ 1;
    if (v110) {
      int v112 = v111;
    }
    v113 = [[BWFunnelNode alloc] initWithNumberOfInputs:(v112 + 1) mediaType:1986618469];
    v348.receiver = v301;
    v348.super_class = (Class)FigCaptureStillImageSinkPipeline;
    if ((objc_msgSendSuper2(&v348, sel_addNode_error_, v113, &v369) & 1) == 0
      || (objc_msgSend(v305, "connectOutput:toInput:pipelineStage:", -[BWStillImageBufferRouterNode defaultOutput](v98, "defaultOutput"), -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v113, "inputs"), "objectAtIndexedSubscript:", 0), v70) & 1) == 0)
    {
      goto LABEL_441;
    }
    if (v107)
    {
      uint64_t v114 = 1;
      if (!v110) {
        goto LABEL_175;
      }
    }
    else
    {
      if ((objc_msgSend(v305, "connectOutput:toInput:pipelineStage:", -[BWNode output](v262, "output"), -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v113, "inputs"), "objectAtIndexedSubscript:", 1), v70) & 1) == 0)goto LABEL_441; {
      uint64_t v114 = 2;
      }
      if (!v110)
      {
LABEL_175:
        uint64_t v103 = [(BWNode *)v113 output];
        goto LABEL_176;
      }
    }
    if (objc_msgSend(v305, "connectOutput:toInput:pipelineStage:", -[BWNode output](v280, "output"), -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v113, "inputs"), "objectAtIndexedSubscript:", v114), v70))goto LABEL_175; {
LABEL_441:
    }
    fig_log_get_emitter();
    goto LABEL_281;
  }
LABEL_176:
  if ((v289 ^ 1 | v294))
  {
    v115 = &classRef_BWColorConstancyProcessorController;
  }
  else
  {
    v116 = [[BWCrossoverNode alloc] initWithMediaType:1986618469 numberOfInputs:2];
    v115 = &classRef_BWColorConstancyProcessorController;
    v347.receiver = v301;
    v347.super_class = (Class)FigCaptureStillImageSinkPipeline;
    if ((objc_msgSendSuper2(&v347, sel_addNode_error_, v116, &v369) & 1) == 0
      || (objc_msgSend(v305, "connectOutput:toInput:pipelineStage:", v103, -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v116, "inputs"), "objectAtIndexedSubscript:", 0), v70) & 1) == 0|| (objc_msgSend(v305, "connectOutput:toInput:pipelineStage:", v104, -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v116, "inputs"), "objectAtIndexedSubscript:", 1), v70) & 1) == 0)
    {
      fig_log_get_emitter();
      goto LABEL_281;
    }
    uint64_t v103 = [(BWNode *)v116 output];
  }
  v117 = objc_alloc_init(BWPixelTransferNode);
  [(BWNode *)v117 setName:@"Still Image Format Converter"];
  -[BWPixelTransferNode setOutputPixelFormat:](v117, "setOutputPixelFormat:", [v298 outputPixelFormat]);
  -[BWPixelTransferNode setOutputColorSpaceProperties:](v117, "setOutputColorSpaceProperties:", [v298 outputColorSpaceProperties]);
  [(BWPixelTransferNode *)v117 setCropMode:3];
  v118 = (objc_class *)v115[153];
  v346.receiver = v301;
  v346.super_class = v118;
  if ((objc_msgSendSuper2(&v346, sel_addNode_error_, v117, &v369) & 1) == 0
    || (objc_msgSend(v305, "connectOutput:toInput:pipelineStage:", v103, -[BWNode input](v117, "input"), v70) & 1) == 0)
  {
    fig_log_get_emitter();
    goto LABEL_281;
  }
  obja = (BWNodeOutput *)v104;
  uint64_t v119 = [(BWNode *)v117 output];
  if (v274)
  {
    v120 = objc_alloc_init(BWPixelTransferNode);
    [(BWNode *)v120 setName:@"Telephoto Still Image Format Converter"];
    -[BWPixelTransferNode setOutputPixelFormat:](v120, "setOutputPixelFormat:", [v298 outputPixelFormat]);
    -[BWPixelTransferNode setOutputColorSpaceProperties:](v120, "setOutputColorSpaceProperties:", [v298 outputColorSpaceProperties]);
    [(BWPixelTransferNode *)v120 setCropMode:3];
    v121 = (objc_class *)v115[153];
    v345.receiver = v301;
    v345.super_class = v121;
    v122 = v305;
    if ((objc_msgSendSuper2(&v345, sel_addNode_error_, v120, &v369) & 1) == 0
      || (objc_msgSend(v305, "connectOutput:toInput:pipelineStage:", obja, -[BWNode input](v120, "input"), v70) & 1) == 0)
    {
      fig_log_get_emitter();
      goto LABEL_281;
    }
    obja = [(BWNode *)v120 output];
  }
  else
  {
    v122 = v305;
  }
  if (v105)
  {
    id v123 = [[BWDepthSynchronizerNode alloc] initForStreaming:0 separateDepthComponentsEnabled:0];
    v124 = (objc_class *)v115[153];
    v344.receiver = v301;
    v344.super_class = v124;
    if ((objc_msgSendSuper2(&v344, sel_addNode_error_, v123, &v369) & 1) == 0) {
      goto LABEL_410;
    }
    [v123 setName:@"Still Image Depth Synchronizer"];
    if ((objc_msgSend(v122, "connectOutput:toInput:pipelineStage:", v119, objc_msgSend(v123, "imageInput"), v70) & 1) == 0
      || (objc_msgSend(v122, "connectOutput:toInput:pipelineStage:", v105, objc_msgSend(v123, "depthInput"), v70) & 1) == 0)
    {
      goto LABEL_410;
    }
    uint64_t v119 = [v123 output];
  }
  v125 = v298;
  if (v271)
  {
    if ((objc_msgSend(v122, "connectOutput:toInput:pipelineStage:", v119, -[BWNode input](v271, "input"), v258) & 1) == 0) {
      goto LABEL_410;
    }
    uint64_t v119 = [(BWNode *)v271 output];
  }
  if (v274)
  {
    if (objc_msgSend(v122, "connectOutput:toInput:pipelineStage:", obja, -[BWNode input](v274, "input"), v257))
    {
      obja = [(BWNode *)v274 output];
      goto LABEL_200;
    }
LABEL_410:
    fig_log_get_emitter();
    goto LABEL_281;
  }
  if (v290 == 2) {
    goto LABEL_201;
  }
LABEL_200:
  v127 = [[BWNoiseReducerNode alloc] initWithCameraTuningDictionary:v265 sensorIDDictionary:v286];
  -[BWNoiseReducerNode setQuadraHighResStillImageCaptureEnabled:](v127, "setQuadraHighResStillImageCaptureEnabled:", [v301[6] quadraHighResStillImageCaptureEnabled]);
  v128 = (objc_class *)v115[153];
  v343.receiver = v301;
  v343.super_class = v128;
  if ((objc_msgSendSuper2(&v343, sel_addNode_error_, v127, &v369) & 1) == 0
    || (objc_msgSend(v122, "connectOutput:toInput:pipelineStage:", v119, -[BWNode input](v127, "input"), v70) & 1) == 0)
  {
    fig_log_get_emitter();
    goto LABEL_281;
  }
  v271 = v127;
  uint64_t v119 = [(BWNode *)v127 output];
  if (v290 == 1 && v280)
  {
    v129 = [[BWFunnelNode alloc] initWithNumberOfInputs:2 mediaType:1986618469];
    v130 = (objc_class *)v115[153];
    v342.receiver = v301;
    v342.super_class = v130;
    if ((objc_msgSendSuper2(&v342, sel_addNode_error_, v129, &v369) & 1) == 0
      || (objc_msgSend(v122, "connectOutput:toInput:pipelineStage:", v119, -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v129, "inputs"), "objectAtIndexedSubscript:", 0), v70) & 1) == 0|| (unsigned int v126 = v282, (objc_msgSend(v122, "connectOutput:toInput:pipelineStage:", -[BWNode output](v280, "output"), -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v129, "inputs"), "objectAtIndexedSubscript:", 1), v70) & 1) == 0))
    {
      fig_log_get_emitter();
      goto LABEL_281;
    }
    uint64_t v119 = [(BWNode *)v129 output];
  }
  else
  {
LABEL_201:
    unsigned int v126 = v282;
  }
  int v131 = v297 | v281;
  if (v276) {
    unsigned int v132 = v297;
  }
  else {
    unsigned int v132 = 0;
  }
  if ((v293 & v126) == 1)
  {
    v133 = objc_alloc_init(BWPortraitHDRStagingNode);
    v134 = (objc_class *)v115[153];
    v341.receiver = v301;
    v341.super_class = v134;
    if (objc_msgSendSuper2(&v341, sel_addNode_error_, v133, &v369))
    {
      v135 = v133;
      v301[11] = v135;
      if (v289)
      {
        if (objc_msgSend(v122, "connectOutput:toInput:pipelineStage:", obja, -[BWNode input](v135, "input"), v283))
        {
          obja = (BWNodeOutput *)[v301[11] output];
LABEL_221:
          int v131 = v297 | v281;
          goto LABEL_222;
        }
      }
      else
      {
        if (!v276) {
          goto LABEL_221;
        }
        if (objc_msgSend(v122, "connectOutput:toInput:pipelineStage:", v119, -[BWNode input](v135, "input"), v283))
        {
          uint64_t v119 = [v301[11] output];
          int v131 = v297 | v281;
LABEL_222:
          v125 = v298;
          goto LABEL_223;
        }
      }
    }
    fig_log_get_emitter();
    goto LABEL_281;
  }
LABEL_223:
  if (!v132)
  {
    unsigned int v304 = 0;
    uint64_t v139 = v278;
    if (!v294)
    {
      v142 = &OBJC_IVAR___BWStillImageFilterNode__renderList;
      goto LABEL_301;
    }
    goto LABEL_229;
  }
  v136 = [[BWInferenceNode alloc] initWithConvEngineSupportWithCaptureDevice:v301[6] scheduler:a5 priority:14];
  [(BWNode *)v136 setName:@"RGB Segmentation and Landmarks"];
  [(BWInferenceNode *)v136 addInferenceOfType:103 version:+[BWRGBPersonSegmentationInferenceConfiguration portraitVersion] & 0xFFFFFFFFFFFFLL];
  id v137 = +[BWLandmarksInferenceConfiguration configuration];
  objc_msgSend(v137, "setMaximumNumberOfFaces:", +[BWLandmarksInferenceConfiguration portraitMaximumNumberOfFaces](BWLandmarksInferenceConfiguration, "portraitMaximumNumberOfFaces"));
  -[BWInferenceNode addInferenceOfType:version:configuration:](v136, "addInferenceOfType:version:configuration:", 801, [v137 landmarksInferenceVersion] & 0xFFFFFFFFFFFFLL, v137);
  v340.receiver = v301;
  v340.super_class = (Class)FigCaptureStillImageSinkPipeline;
  if ((objc_msgSendSuper2(&v340, sel_addNode_error_, v136, &v369) & 1) == 0)
  {
LABEL_447:
    fig_log_get_emitter();
    goto LABEL_281;
  }
  uint64_t v138 = [(BWNode *)v136 input];
  if (!v294)
  {
    v115 = &classRef_BWColorConstancyProcessorController;
    if ([v122 connectOutput:v119 toInput:v138 pipelineStage:v70])
    {
      uint64_t v119 = [(BWNode *)v136 output];
      v142 = &OBJC_IVAR___BWStillImageFilterNode__renderList;
      uint64_t v139 = v278;
LABEL_298:
      LOBYTE(v254) = 0;
      v184 = -[BWDepthConverterNode initWithStillImageNodeConfiguration:cameraInfoByPortType:sensorIDDictionary:rgbPersonSegmentationEnabled:depthIsAlwaysHighQuality:depthOriginatesFromNeuralNetwork:backPressureDrivenPipelining:]([BWDepthConverterNode alloc], "initWithStillImageNodeConfiguration:cameraInfoByPortType:sensorIDDictionary:rgbPersonSegmentationEnabled:depthIsAlwaysHighQuality:depthOriginatesFromNeuralNetwork:backPressureDrivenPipelining:", 0, [*(id *)((char *)v301 + v142[121]) cameraInfoByPortType], v267, 1, objc_msgSend(v125, "clientIsCameraOrDerivative"), 0, v254);
      v185 = (objc_class *)v115[153];
      v328.receiver = v301;
      v328.super_class = v185;
      if ((objc_msgSendSuper2(&v328, sel_addNode_error_, v184, &v369) & 1) == 0
        || ([(BWNode *)v184 setName:@"Still Image Depth Converter"],
            -[BWDepthConverterNode setHorizontalSensorBinningFactor:](v184, "setHorizontalSensorBinningFactor:", [v125 horizontalSensorBinningFactor]), -[BWDepthConverterNode setVerticalSensorBinningFactor:](v184, "setVerticalSensorBinningFactor:", objc_msgSend(v125, "verticalSensorBinningFactor")), -[BWDepthConverterNode setStillGDRFilteringSupportEnabled:](v184, "setStillGDRFilteringSupportEnabled:", 1), -[BWDepthConverterNode setOutputFormat:](v184, "setOutputFormat:", 1751411059), -[BWDepthConverterNode setOutputDimensions:](v184, "setOutputDimensions:", objc_msgSend(v125, "depthDataDimensions")), -[BWDepthConverterNode setBaseRotationDegrees:](v184, "setBaseRotationDegrees:", 90), (objc_msgSend(v122, "connectOutput:toInput:pipelineStage:", v119, -[BWNode input](v184, "input"), v70) & 1) == 0))
      {
        fig_log_get_emitter();
        goto LABEL_281;
      }
      v301[10] = v184;
      uint64_t v119 = [(BWNode *)v184 output];
LABEL_301:
      if (v297)
      {
        uint64_t v186 = v288;
        if (v276) {
          uint64_t v186 = v277;
        }
        uint64_t v187 = v259;
        if (v276) {
          uint64_t v187 = v256;
        }
        uint64_t v188 = v286;
        if (v276) {
          uint64_t v188 = v267;
        }
        if (v289) {
          uint64_t v189 = v287;
        }
        else {
          uint64_t v189 = v186;
        }
        if (v289) {
          uint64_t v190 = v139;
        }
        else {
          uint64_t v190 = v187;
        }
        if (v289) {
          uint64_t v191 = v285;
        }
        else {
          uint64_t v191 = v188;
        }
        v192 = v301;
        v193 = -[BWSensorConfiguration initWithPortType:sensorIDString:sensorIDDictionary:cameraInfo:]([BWSensorConfiguration alloc], "initWithPortType:sensorIDString:sensorIDDictionary:cameraInfo:", v189, v190, v191, objc_msgSend((id)objc_msgSend(*(id *)((char *)v301 + v142[121]), "cameraInfoByPortType"), "objectForKeyedSubscript:", v189));
        LODWORD(v194) = v25;
        uint64_t v195 = [(FigCaptureCameraParameters *)v260 sdofRenderingVersionForPortType:v189 sensorIDString:v190 zoomFactor:v194];
        v196 = [BWStillImagePortraitMetadataNode alloc];
        uint64_t v381 = v189;
        objb = v193;
        v382 = v193;
        uint64_t v197 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v382 forKeys:&v381 count:1];
        LODWORD(v198) = v25;
        v199 = [(BWStillImagePortraitMetadataNode *)v196 initWithNodeConfiguration:0 sdofRenderingVersion:v195 sensorConfigurationsByPortType:v197 defaultPortType:v189 defaultZoomFactor:v198];
        v200 = (objc_class *)v115[153];
        v327.receiver = v301;
        v327.super_class = v200;
        if ((objc_msgSendSuper2(&v327, sel_addNode_error_, v199, &v369) & 1) == 0
          || (objc_msgSend(v122, "connectOutput:toInput:pipelineStage:", v119, -[BWNode input](v199, "input"), v70) & 1) == 0)
        {
          fig_log_get_emitter();
          goto LABEL_281;
        }
        uint64_t v119 = [(BWNode *)v199 output];
        v125 = v298;
      }
      else
      {
        uint64_t v189 = 0;
        objb = 0;
        v192 = v301;
      }
      if (v279)
      {
        if ((v282 & 1) == 0)
        {
          v201 = [[BWInferenceNode alloc] initWithConvEngineSupportWithCaptureDevice:*(id *)((char *)v192 + v142[121]) scheduler:a5 priority:14];
          [(BWNode *)v201 setName:@"Landmarks Inference Node"];
          id v202 = +[BWLandmarksInferenceConfiguration configuration];
          v115 = &classRef_BWColorConstancyProcessorController;
          objc_msgSend(v202, "setMaximumNumberOfFaces:", +[BWLandmarksInferenceConfiguration portraitMaximumNumberOfFaces](BWLandmarksInferenceConfiguration, "portraitMaximumNumberOfFaces"));
          -[BWInferenceNode addInferenceOfType:version:configuration:](v201, "addInferenceOfType:version:configuration:", 801, [v202 landmarksInferenceVersion] & 0xFFFFFFFFFFFFLL, v202);
          v326.receiver = v192;
          v326.super_class = (Class)FigCaptureStillImageSinkPipeline;
          if ((objc_msgSendSuper2(&v326, sel_addNode_error_, v201, &v369) & 1) == 0
            || (objc_msgSend(v122, "connectOutput:toInput:pipelineStage:", v119, -[BWNode input](v201, "input"), v70) & 1) == 0)
          {
            fig_log_get_emitter();
            goto LABEL_281;
          }
          uint64_t v119 = [(BWNode *)v201 output];
        }
        id v203 = +[BWStillImageConditionalRouterPersonSegmentationAndMattingConfiguration personSegmentationAndMattingConfiguration];
        v204 = [[BWStillImageConditionalRouterNode alloc] initWithRoutingConfiguration:v203];
        [(BWNode *)v204 setName:@"Person Segmentation and Matting Conditional Router"];
        v205 = (objc_class *)v115[153];
        v325.receiver = v192;
        v325.super_class = v205;
        if ((objc_msgSendSuper2(&v325, sel_addNode_error_, v204, &v369) & 1) == 0)
        {
          fig_log_get_emitter();
          goto LABEL_281;
        }
        v206 = v192;
        v207 = [[BWInferenceNode alloc] initWithConvEngineSupportWithCaptureDevice:v192[6] scheduler:a5 priority:14];
        uint64_t v208 = v286;
        if (v276) {
          uint64_t v208 = v267;
        }
        if (v289) {
          uint64_t v209 = v285;
        }
        else {
          uint64_t v209 = v208;
        }
        v210 = [(BWInferenceConfiguration *)[BWMattingInferenceConfiguration alloc] initWithInferenceType:201];
        [(BWInferenceConfiguration *)v210 setPriority:14];
        [(BWInferenceConfiguration *)v210 setTuningParameters:v209];
        LODWORD(v211) = v25;
        [(BWMattingInferenceConfiguration *)v210 setSdofRenderingTuningParameters:+[FigCaptureCameraParameters sdofTuningParametersForSensorIDDictionary:v209 zoomFactor:v211]];
        LODWORD(v212) = v20;
        [(BWMattingInferenceConfiguration *)v210 setMainImageDownscalingFactor:v212];
        [(BWMattingInferenceConfiguration *)v210 setRefinedDepthDeliveryEnabled:v261];
        [(BWMattingInferenceConfiguration *)v210 setMetalCommandQueue:0];
        uint64_t v213 = +[BWPersonSegmentationConfiguration portraitVersion] & 0xFFFFFFFFFFFFLL;
        [(BWInferenceNode *)v207 addInferenceOfType:102 version:v213];
        [(BWInferenceNode *)v207 addInferenceOfType:201 version:v213 configuration:v210];
        [(BWNode *)v207 setName:@"Person Segmentation and Matting Node"];
        v214 = (objc_class *)v115[153];
        v324.receiver = v206;
        v324.super_class = v214;
        if ((objc_msgSendSuper2(&v324, sel_addNode_error_, v207, &v369) & 1) == 0)
        {
          fig_log_get_emitter();
          goto LABEL_281;
        }
        v215 = [[BWFunnelNode alloc] initWithNumberOfInputs:2 mediaType:1986618469];
        [(BWNode *)v215 setName:@"Person Segmentation and Matting Funnel"];
        v216 = (objc_class *)v115[153];
        v323.receiver = v206;
        v323.super_class = v216;
        if ((objc_msgSendSuper2(&v323, sel_addNode_error_, v215, &v369) & 1) == 0
          || (objc_msgSend(v305, "connectOutput:toInput:pipelineStage:", v119, -[BWNode input](v204, "input"), v300) & 1) == 0
          || (objc_msgSend(v305, "connectOutput:toInput:pipelineStage:", -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v204, "outputs"), "objectAtIndexedSubscript:", objc_msgSend(v203, "defaultOutputIndex")), -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v215, "inputs"), "objectAtIndexedSubscript:", 0), v300) & 1) == 0|| (objc_msgSend(v305, "connectOutput:toInput:pipelineStage:", -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](v204, "outputs"), "objectAtIndexedSubscript:", objc_msgSend(v203, "personSegmentationAndMattingOuputIndex")), -[BWNode input](v207, "input"), v300) & 1) == 0|| (v70 = v300, (objc_msgSend(
                 v305,
                 "connectOutput:toInput:pipelineStage:",
                 [(BWNode *)v207 output],
                 [(NSArray *)[(BWNode *)v215 inputs] objectAtIndexedSubscript:1], v300) & 1) == 0))
        {
          fig_log_get_emitter();
          goto LABEL_281;
        }
        uint64_t v119 = [(BWNode *)v215 output];
        v192 = v301;
        v122 = v305;
        v142 = &OBJC_IVAR___BWStillImageFilterNode__renderList;
        v125 = v298;
        v115 = &classRef_BWColorConstancyProcessorController;
      }
      if (v282)
      {
        v217 = [BWStillImageFilterNode alloc];
        if (objb)
        {
          uint64_t v379 = [(BWSensorConfiguration *)objb portType];
          v380 = objb;
          uint64_t v219 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v380 forKeys:&v379 count:1];
        }
        else
        {
          uint64_t v219 = 0;
        }
        LOBYTE(v255) = 0;
        LODWORD(v254) = 0;
        LODWORD(v218) = v25;
        v220 = [(BWStillImageFilterNode *)v217 initWithNodeConfiguration:v266 sensorConfigurationsByPortType:v219 statusDelegate:0 depthDataDeliveryEnabled:v297 personSegmentationEnabled:v279 refinedDepthEnabled:v261 portraitRenderQuality:0.0 targetAspectRatio:v218 defaultPortType:v254 defaultZoomFactor:v189 backPressureDrivenPipelining:v255];
        v221 = (objc_class *)v115[153];
        v322.receiver = v192;
        v322.super_class = v221;
        if ((objc_msgSendSuper2(&v322, sel_addNode_error_, v220, &v369) & 1) == 0
          || (objc_msgSend(v122, "connectOutput:toInput:pipelineStage:", v119, -[BWNode input](v220, "input"), v283) & 1) == 0)
        {
          fig_log_get_emitter();
          goto LABEL_281;
        }
        uint64_t v119 = [(BWNode *)v220 output];
        v125 = v298;
      }
      if ([v125 allowsMultipleInflightCaptures])
      {
        v222 = [[BWStillImageTurnstileNode alloc] initWithStillImageCoordinator:v192[7]];
        v223 = (objc_class *)v115[153];
        v321.receiver = v192;
        v321.super_class = v223;
        if ((objc_msgSendSuper2(&v321, sel_addNode_error_, v222, &v369) & 1) == 0
          || (objc_msgSend(v122, "connectOutput:toInput:pipelineStage:", v119, -[BWNode input](v222, "input"), v70) & 1) == 0)
        {
          fig_log_get_emitter();
          goto LABEL_281;
        }
        uint64_t v119 = [(BWNode *)v222 output];
      }
      v224 = [[BWStillImageScalerNode alloc] initWithBasePoolCapacity:1 nodeConfiguration:0];
      [(BWStillImageScalerNode *)v224 setBlackFillingRequired:v281];
      v225 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
      [v125 portraitEffectsMatteMainImageDownscalingFactor];
      if (v226 != 0.0)
      {
        v227 = NSNumber;
        [v125 portraitEffectsMatteMainImageDownscalingFactor];
        objc_msgSend(v225, "setObject:forKeyedSubscript:", objc_msgSend(v227, "numberWithFloat:"), 0x1EFA74420);
      }
      [(BWStillImageScalerNode *)v224 setMainImageDownscalingFactorByAttachedMediaKey:v225];
      v228 = (objc_class *)v115[153];
      v320.receiver = v192;
      v320.super_class = v228;
      if ((objc_msgSendSuper2(&v320, sel_addNode_error_, v224, &v369) & 1) == 0
        || (objc_msgSend(v122, "connectOutput:toInput:pipelineStage:", v119, -[BWNode input](v224, "input"), v300) & 1) == 0)
      {
        fig_log_get_emitter();
        goto LABEL_281;
      }
      uint64_t v229 = [(BWNode *)v224 output];
      if (v296)
      {
        v230 = [[BWMeteorHeadroomNode alloc] initWithNodeConfiguration:0 sensorConfigurationsByPortType:0];
        [(BWMeteorHeadroomNode *)v230 setHeadroomProcessingType:[(FigCaptureCameraParameters *)v260 meteorHeadroomProcessingType]];
        v231 = (objc_class *)v115[153];
        v319.receiver = v192;
        v319.super_class = v231;
        if ((objc_msgSendSuper2(&v319, sel_addNode_error_, v230, &v369) & 1) == 0
          || (objc_msgSend(v122, "connectOutput:toInput:pipelineStage:", v229, -[BWNode input](v230, "input"), v300) & 1) == 0)
        {
          fig_log_get_emitter();
          goto LABEL_281;
        }
        uint64_t v229 = [(BWNode *)v230 output];
        v125 = v298;
      }
      LOBYTE(v254) = 0;
      v232 = [[BWPhotoEncoderNode alloc] initWithNodeConfiguration:v266 sensorConfigurationsByPortType:0 semanticDevelopmentVersion:0 inferenceScheduler:0 alwaysAwaitInference:0 portraitRenderQuality:0 deferredPhotoProcessorEnabled:v254];
      if (v125
        && v125[12]
        && [v125 outputPixelFormat] == 875704438
        && ![(BWNodeOutput *)[(BWNode *)v271 output] passthroughMode])
      {
        [(BWPhotoEncoderNode *)v232 setInputColorInfo:v125[12]];
      }
      -[BWPhotoEncoderNode setCameraSupportsFlash:](v232, "setCameraSupportsFlash:", [*(id *)((char *)v192 + v142[121]) hasFlash]);
      if (v279)
      {
        v233 = [BWPhotoEncoderNodeAttachedMediaConfiguration alloc];
        LODWORD(v234) = v20;
        v235 = [(BWPhotoEncoderNodeAttachedMediaConfiguration *)v233 initWithMainImageDownscalingFactor:0 propagationMode:v234];
        uint64_t v377 = 0x1EFA74420;
        v378 = v235;
        -[BWPhotoEncoderNode setAttachedMediaConfigurationByAttachedMediaKey:](v232, "setAttachedMediaConfigurationByAttachedMediaKey:", [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v378 forKeys:&v377 count:1]);
      }
      -[BWPhotoEncoderNode setUsesHighEncodingPriority:](v232, "setUsesHighEncodingPriority:", [v125 usesHighEncodingPriority]);
      -[BWPhotoEncoderNode setZeroShutterLagEnabled:](v232, "setZeroShutterLagEnabled:", [*(id *)((char *)v192 + v142[121]) zeroShutterLagEnabled]);
      v236 = (objc_class *)v115[153];
      v318.receiver = v192;
      v318.super_class = v236;
      if ((objc_msgSendSuper2(&v318, sel_addNode_error_, v232, &v369) & 1) != 0
        && (objc_msgSend(v305, "connectOutput:toInput:pipelineStage:", v229, -[BWNode input](v232, "input"), v300) & 1) != 0)
      {
        uint64_t v237 = [(BWNode *)v232 output];
        if (![v292 optimizesImagesForOfflineVideoStabilization]) {
          goto LABEL_370;
        }
        unsigned int v238 = [v125 horizontalSensorBinningFactor];
        unsigned int v239 = [v125 verticalSensorBinningFactor];
        [v125 maxSupportedFrameRate];
        uint64_t v241 = FigCaptureBuildMotionAttachmentsNode(v192, v237, v238, v239, v300, [v125 motionAttachmentsSource], objc_msgSend(*(id *)((char *)v192 + v142[121]), "sensorIDDictionaryByPortType"), objc_msgSend(*(id *)((char *)v192 + v142[121]), "cameraInfoByPortType"), v240, objc_msgSend(*(id *)((char *)v192 + v142[121]), "activePortTypes"), 0, 1, 1, 0, &v370);
        if (!v370)
        {
          uint64_t v237 = v241;
LABEL_370:
          v242 = -[BWStillImageSampleBufferSinkNode initWithSinkID:]([BWStillImageSampleBufferSinkNode alloc], "initWithSinkID:", [v192 sinkID]);
          [(BWNode *)v242 setName:@"Still Image Sink"];
          -[BWStillImageSampleBufferSinkNode setCameraSupportsFlash:](v242, "setCameraSupportsFlash:", [*(id *)((char *)v192 + v142[121]) hasFlash]);
          v317.receiver = v192;
          v317.super_class = (Class)FigCaptureStillImageSinkPipeline;
          if (objc_msgSendSuper2(&v317, sel_addNode_error_, v242, &v369))
          {
            v192[8] = v242;
            if (objc_msgSend(v305, "connectOutput:toInput:pipelineStage:", v237, -[BWNode input](v242, "input"), v300))
            {
              long long v315 = 0u;
              long long v316 = 0u;
              long long v313 = 0u;
              long long v314 = 0u;
              v243 = (void *)[v192 nodes];
              uint64_t v244 = [v243 countByEnumeratingWithState:&v313 objects:v376 count:16];
              if (v244)
              {
                uint64_t v245 = v244;
                uint64_t v246 = *(void *)v314;
                do
                {
                  for (uint64_t m = 0; m != v245; ++m)
                  {
                    if (*(void *)v314 != v246) {
                      objc_enumerationMutation(v243);
                    }
                    v248 = *(void **)(*((void *)&v313 + 1) + 8 * m);
                    [v248 setDeferredPreparePriority:1];
                    long long v311 = 0u;
                    long long v312 = 0u;
                    long long v309 = 0u;
                    long long v310 = 0u;
                    v249 = (void *)[v248 inputs];
                    uint64_t v250 = [v249 countByEnumeratingWithState:&v309 objects:v375 count:16];
                    if (v250)
                    {
                      uint64_t v251 = v250;
                      uint64_t v252 = *(void *)v310;
                      do
                      {
                        for (uint64_t n = 0; n != v251; ++n)
                        {
                          if (*(void *)v310 != v252) {
                            objc_enumerationMutation(v249);
                          }
                          objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v309 + 1) + 8 * n), "connection"), "setWantsMessageCachingWhileSuspended:", 1);
                        }
                        uint64_t v251 = [v249 countByEnumeratingWithState:&v309 objects:v375 count:16];
                      }
                      while (v251);
                    }
                  }
                  uint64_t v245 = [v243 countByEnumeratingWithState:&v313 objects:v376 count:16];
                }
                while (v245);
              }
              [v192[7] setDeferredPreparePriority:4];
              goto LABEL_387;
            }
          }
          fig_log_get_emitter();
          goto LABEL_281;
        }
      }
      fig_log_get_emitter();
      goto LABEL_281;
    }
    goto LABEL_447;
  }
  unsigned int v304 = v132;
  v115 = &classRef_BWColorConstancyProcessorController;
  if (([v122 connectOutput:obja toInput:v138 pipelineStage:v70] & 1) == 0) {
    goto LABEL_447;
  }
  obja = [(BWNode *)v136 output];
  uint64_t v139 = v278;
  int v131 = v297 | v281;
LABEL_229:
  if (v131)
  {
    v140 = objc_alloc_init(BWStillImageDisparitySplitterNode);
    [(BWNode *)v140 setName:@"Disparity/HDR Splitter"];
    v141 = (objc_class *)v115[153];
    v339.receiver = v301;
    v339.super_class = v141;
    if ((objc_msgSendSuper2(&v339, sel_addNode_error_, v140, &v369) & 1) == 0
      || (objc_msgSend(v122, "connectOutput:toInput:pipelineStage:", obja, -[BWNode input](v140, "input"), v283) & 1) == 0)
    {
      fig_log_get_emitter();
      goto LABEL_281;
    }
    obja = [(BWStillImageDisparitySplitterNode *)v140 disparityOutput];
  }
  else
  {
    if (!v268) {
      goto LABEL_273;
    }
    v140 = 0;
  }
  v385[0] = v288;
  v385[1] = v287;
  v143 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v385 count:2];
  v144 = [[BWStillImageMultiCameraDoserNode alloc] initWithPortTypes:v143];
  v145 = (objc_class *)v115[153];
  v338.receiver = v301;
  v338.super_class = v145;
  if ((objc_msgSendSuper2(&v338, sel_addNode_error_, v144, &v369) & 1) == 0) {
    goto LABEL_439;
  }
  uint64_t v146 = [v143 indexOfObject:v288];
  if (v146 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_392;
  }
  uint64_t v147 = v146;
  uint64_t v148 = [v143 indexOfObject:v287];
  if (v148 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_392;
  }
  uint64_t v149 = v148;
  if ((objc_msgSend(v305, "connectOutput:toInput:pipelineStage:", v119, -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v144, "inputs"), "objectAtIndexedSubscript:", v147), v283) & 1) == 0|| (v70 = v300, (objc_msgSend(v305, "connectOutput:toInput:pipelineStage:", obja, -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v144, "inputs"), "objectAtIndexedSubscript:", v149), v283) & 1) == 0))
  {
LABEL_439:
    fig_log_get_emitter();
    goto LABEL_281;
  }
  uint64_t v150 = [(BWStillImageMultiCameraDoserNode *)v144 outputIndexForPortType:v288];
  if (v150 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v151 = v150;
    uint64_t v152 = [(BWStillImageMultiCameraDoserNode *)v144 outputIndexForPortType:v287];
    if (v152 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v153 = v152;
      uint64_t v119 = [(NSArray *)[(BWNode *)v144 outputs] objectAtIndexedSubscript:v151];
      obja = [(NSArray *)[(BWNode *)v144 outputs] objectAtIndexedSubscript:v153];
      v295 = v140;
      if (v281)
      {
        v154 = (void *)[MEMORY[0x1E4F1CA48] array];
        v122 = v305;
        if ([v301[6] bravoTelephotoCaptureStream])
        {
          v155 = NSNumber;
          objc_msgSend((id)objc_msgSend(v301[6], "bravoTelephotoCaptureStream"), "baseZoomFactor");
          objc_msgSend(v154, "addObject:", objc_msgSend(v155, "numberWithFloat:"));
          v156 = NSNumber;
          objc_msgSend((id)objc_msgSend(v301[6], "masterCaptureStream"), "baseZoomFactor");
          objc_msgSend(v154, "addObject:", objc_msgSend(v156, "numberWithFloat:"));
        }
        v157 = [[BWStillImageDualPhotoFacePropagatorNode alloc] initWithBaseZoomFactors:v154];
        v337.receiver = v301;
        v337.super_class = (Class)FigCaptureStillImageSinkPipeline;
        if ((objc_msgSendSuper2(&v337, sel_addNode_error_, v157, &v369) & 1) == 0
          || (unsigned int v158 = v282,
              (objc_msgSend(v305, "connectOutput:toInput:pipelineStage:", v119, -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v157, "inputs"), "objectAtIndexedSubscript:", 0), v283) & 1) == 0)|| (v115 = &classRef_BWColorConstancyProcessorController, (objc_msgSend(v305, "connectOutput:toInput:pipelineStage:", obja, -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v157, "inputs"), "objectAtIndexedSubscript:", 1), v283) & 1) == 0))
        {
          fig_log_get_emitter();
          goto LABEL_281;
        }
        uint64_t v119 = [(NSArray *)[(BWNode *)v157 outputs] objectAtIndexedSubscript:0];
        obja = [(NSArray *)[(BWNode *)v157 outputs] objectAtIndexedSubscript:1];
        uint64_t v139 = v278;
      }
      else
      {
        v122 = v305;
        unsigned int v158 = v282;
      }
      v125 = v298;
      if (v268)
      {
        v159 = -[BWStereoFusionNode initWithTelephotoSensorIDDictionary:cameraInfoByPortType:]([BWStereoFusionNode alloc], "initWithTelephotoSensorIDDictionary:cameraInfoByPortType:", v285, [v301[6] cameraInfoByPortType]);
        v160 = (objc_class *)v115[153];
        v336.receiver = v301;
        v336.super_class = v160;
        if ((objc_msgSendSuper2(&v336, sel_addNode_error_, v159, &v369) & 1) == 0
          || (-[BWStereoFusionNode setAttachesInputBracketToOutputSampleBuffer:](v159, "setAttachesInputBracketToOutputSampleBuffer:", 0), (objc_msgSend(v122, "connectOutput:toInput:pipelineStage:", v119, -[BWStereoFusionNode wideInput](v159, "wideInput"), v283) & 1) == 0)|| (objc_msgSend(v122, "connectOutput:toInput:pipelineStage:", obja, -[BWStereoFusionNode telephotoInput](v159, "telephotoInput"), v283) & 1) == 0)
        {
          fig_log_get_emitter();
          goto LABEL_281;
        }
        uint64_t v161 = [(BWStereoFusionNode *)v159 defaultOutput];
        if (v272)
        {
          v162 = [[BWFunnelNode alloc] initWithNumberOfInputs:2 mediaType:1986618469];
          v163 = (objc_class *)v115[153];
          v335.receiver = v301;
          v335.super_class = v163;
          if ((objc_msgSendSuper2(&v335, sel_addNode_error_, v162, &v369) & 1) == 0)
          {
            fig_log_get_emitter();
            goto LABEL_281;
          }
          v164 = [[BWGNRNode alloc] initWithSISEnabled:0 OISEnabled:0 LTMHDREnabled:v296 processingLTMHDRFusion:v296 portType:v288 sensorID:v259 sensorIDDictionary:v286 telephotoPortType:v287 telephotoSensorID:v278 telephotoSensorIDDictionary:v285];
          v165 = (objc_class *)v115[153];
          v334.receiver = v301;
          v334.super_class = v165;
          if ((objc_msgSendSuper2(&v334, sel_addNode_error_, v164, &v369) & 1) == 0)
          {
            fig_log_get_emitter();
            goto LABEL_281;
          }
          [(BWGNRNode *)v164 setAttachesInputBracketToOutputSampleBuffer:0];
          [(BWNode *)v164 setName:@"GNR"];
          v166 = [[BWFunnelNode alloc] initWithNumberOfInputs:2 mediaType:1986618469];
          v167 = (objc_class *)v115[153];
          v333.receiver = v301;
          v333.super_class = v167;
          if ((objc_msgSendSuper2(&v333, sel_addNode_error_, v166, &v369) & 1) == 0) {
            goto LABEL_267;
          }
          if ((objc_msgSend(v305, "connectOutput:toInput:pipelineStage:", -[BWStillImageBufferRouterNode HDROutput](v98, "HDROutput"), -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v162, "inputs"), "objectAtIndexedSubscript:", 0), v300) & 1) == 0)goto LABEL_267; {
          v142 = &OBJC_IVAR___BWStillImageFilterNode__renderList;
          }
          if ((objc_msgSend(v305, "connectOutput:toInput:pipelineStage:", -[BWStereoFusionNode stereoHDROutput](v159, "stereoHDROutput"), -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v162, "inputs"), "objectAtIndexedSubscript:", 1), v300) & 1) == 0|| (objc_msgSend(v305, "connectOutput:toInput:pipelineStage:", -[BWStereoFusionNode defaultOutput](v159, "defaultOutput"), -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v166, "inputs"), "objectAtIndexedSubscript:", 0), v300) & 1) == 0|| (objc_msgSend(v305,
                  "connectOutput:toInput:pipelineStage:",
                  [(BWNode *)v164 output],
                  [(NSArray *)[(BWNode *)v166 inputs] objectAtIndexedSubscript:1], v300) & 1) == 0)
          {
            goto LABEL_267;
          }
          uint64_t v168 = [(BWNode *)v162 output];
          v115 = &classRef_BWColorConstancyProcessorController;
          if (v296)
          {
            v122 = v305;
            uint64_t v139 = v278;
            if ((objc_msgSend(v305, "connectOutput:toInput:pipelineStage:", v168, -[BWNode input](v164, "input"), v300) & 1) == 0)
            {
LABEL_267:
              fig_log_get_emitter();
              goto LABEL_281;
            }
          }
          else
          {
            v122 = v305;
            uint64_t v139 = v278;
            if ((objc_msgSend(v305, "connectOutput:toInput:pipelineStage:", v168, -[BWNode input](v262, "input"), v300) & 1) == 0
              || (objc_msgSend(v305, "connectOutput:toInput:pipelineStage:", -[BWNode output](v262, "output"), -[BWNode input](v164, "input"), v300) & 1) == 0)
            {
              goto LABEL_267;
            }
          }
          uint64_t v119 = [(BWNode *)v166 output];
          v70 = v300;
        }
        else
        {
          uint64_t v119 = v161;
          v142 = &OBJC_IVAR___BWStillImageFilterNode__renderList;
        }
LABEL_297:
        if (!v304) {
          goto LABEL_301;
        }
        goto LABEL_298;
      }
      if (v293)
      {
        v142 = &OBJC_IVAR___BWStillImageFilterNode__renderList;
        if (v158)
        {
          v169 = +[BWPipelineStage pipelineStageWithName:@"com.apple.coremedia.capture.stillimage.inference.bravo" priority:14];
          v170 = [[BWInferenceNode alloc] initWithConvEngineSupportWithCaptureDevice:v301[6] scheduler:a5 priority:14];
          [(BWNode *)v170 setName:@"Disparity/Landmarks Inference Node"];
          id v171 = +[BWLandmarksInferenceConfiguration configuration];
          objc_msgSend(v171, "setMaximumNumberOfFaces:", +[BWLandmarksInferenceConfiguration portraitMaximumNumberOfFaces](BWLandmarksInferenceConfiguration, "portraitMaximumNumberOfFaces"));
          -[BWInferenceNode addInferenceOfType:version:configuration:](v170, "addInferenceOfType:version:configuration:", 801, [v171 landmarksInferenceVersion] & 0xFFFFFFFFFFFFLL, v171);
          v332.receiver = v301;
          v332.super_class = (Class)FigCaptureStillImageSinkPipeline;
          if ((objc_msgSendSuper2(&v332, sel_addNode_error_, v170, &v369) & 1) == 0
            || (char v172 = objc_msgSend(v305, "connectOutput:toInput:pipelineStage:", -[BWStillImageDisparitySplitterNode processedOutput](v295, "processedOutput"), -[BWNode input](v170, "input"), v169), v125 = v298, (v172 & 1) == 0))
          {
            fig_log_get_emitter();
            goto LABEL_281;
          }
        }
        else
        {
          v170 = 0;
        }
        uint64_t v176 = [v125 depthDataDimensions];
        v177 = (void *)[v301[6] cameraInfoByPortType];
        v178 = -[BWSensorConfiguration initWithPortType:sensorIDString:sensorIDDictionary:cameraInfo:]([BWSensorConfiguration alloc], "initWithPortType:sensorIDString:sensorIDDictionary:cameraInfo:", v287, v278, v285, [v177 objectForKeyedSubscript:v287]);
        v179 = -[BWSensorConfiguration initWithPortType:sensorIDString:sensorIDDictionary:cameraInfo:]([BWSensorConfiguration alloc], "initWithPortType:sensorIDString:sensorIDDictionary:cameraInfo:", v288, v259, v286, [v177 objectForKeyedSubscript:v288]);
        v383[0] = v288;
        v383[1] = v287;
        v384[0] = v178;
        v384[1] = v179;
        uint64_t v180 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v384 forKeys:v383 count:2];

        v181 = [[BWStillImageBravoDisparityNode alloc] initWithNodeConfiguration:0 sensorConfigurationsByPortType:v180 disparityMapWidth:(int)v176 disparityMapHeight:v176 >> 32 outputDisparityBufferCount:0];
        v115 = &classRef_BWColorConstancyProcessorController;
        v331.receiver = v301;
        v331.super_class = (Class)FigCaptureStillImageSinkPipeline;
        if ((objc_msgSendSuper2(&v331, sel_addNode_error_, v181, &v369) & 1) == 0
          || (v182 = v170,
              v301[9] = v181,
              -[BWStillImageBravoDisparityNode setShouldComputeDisparityWhenCalibrationFails:](v181, "setShouldComputeDisparityWhenCalibrationFails:", [v301[6] shallowDepthOfFieldEffectEnabled] ^ 1), -[BWStillImageBravoDisparityNode setAttachesInputBracketToOutputSampleBuffer:](v181, "setAttachesInputBracketToOutputSampleBuffer:", 0), (objc_msgSend(v305, "connectOutput:toInput:pipelineStage:", v119, -[BWStillImageBravoDisparityNode wideInput](v181, "wideInput"), v283) & 1) == 0)|| (v70 = v300, v125 = v298, uint64_t v139 = v278, (objc_msgSend(v305, "connectOutput:toInput:pipelineStage:",
                 obja,
                 [(BWStillImageBravoDisparityNode *)v181 telephotoInput],
                 v283) & 1) == 0))
        {
          fig_log_get_emitter();
          goto LABEL_281;
        }
        uint64_t v119 = [(BWNode *)v181 output];
        if (!v282)
        {
          v122 = v305;
          goto LABEL_297;
        }
        v183 = [[BWInferenceSynchronizerNode alloc] initWithIndexOfInputProvidingOutputSampleBuffer:1 indexOfInputProvidingPreferredInferences:1 errorHandlingModel:0];
        [(BWNode *)v183 setName:@"Disparity/Landmarks Sync"];
        [(BWInferenceSynchronizerNode *)v183 setSynchronizesTopLevelAttachments:1];
        v330.receiver = v301;
        v330.super_class = (Class)FigCaptureStillImageSinkPipeline;
        if ((objc_msgSendSuper2(&v330, sel_addNode_error_, v183, &v369) & 1) == 0
          || (objc_msgSend(v305, "connectOutput:toInput:pipelineStage:", v119, -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v183, "inputs"), "objectAtIndexedSubscript:", 0), v283) & 1) == 0|| (objc_msgSend(v305, "connectOutput:toInput:pipelineStage:", -[BWNode output](v182, "output"), -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v183, "inputs"), "objectAtIndexedSubscript:", 1), v283) & 1) == 0)
        {
          fig_log_get_emitter();
          goto LABEL_281;
        }
        v122 = v305;
        uint64_t v175 = [(BWNode *)v183 output];
LABEL_292:
        uint64_t v119 = v175;
        goto LABEL_297;
      }
LABEL_273:
      v142 = &OBJC_IVAR___BWStillImageFilterNode__renderList;
      if (!v281) {
        goto LABEL_297;
      }
      v173 = [[BWFunnelNode alloc] initWithNumberOfInputs:2 mediaType:1986618469];
      v174 = (objc_class *)v115[153];
      v329.receiver = v301;
      v329.super_class = v174;
      if ((objc_msgSendSuper2(&v329, sel_addNode_error_, v173, &v369) & 1) == 0
        || (objc_msgSend(v122, "connectOutput:toInput:pipelineStage:", v119, -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v173, "inputs"), "objectAtIndexedSubscript:", 0), v283) & 1) == 0|| (objc_msgSend(v122, "connectOutput:toInput:pipelineStage:", obja, -[NSArray objectAtIndexedSubscript:](-[BWNode inputs](v173, "inputs"), "objectAtIndexedSubscript:", 1), v283) & 1) == 0)
      {
        fig_log_get_emitter();
        goto LABEL_281;
      }
      uint64_t v175 = [(NSArray *)[(BWNode *)v173 outputs] objectAtIndexedSubscript:0];
      goto LABEL_292;
    }
  }
LABEL_392:
  unsigned int v370 = -12780;
LABEL_387:
  result = v370;
  if (!v370)
  {
    if (v369) {
      return [v369 code];
    }
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureStillImageSinkPipeline;
  [(FigCaptureSinkPipeline *)&v3 dealloc];
}

+ (NSString)pipelineBaseName
{
  return (NSString *)@"Still Image Sink Pipeline";
}

- (BWStillImageCoordinatorNode)stillImageCoordinatorNode
{
  return self->_stillImageCoordinatorNode;
}

- (BWCompressedShotBufferNode)compressedShotBufferNode
{
  return 0;
}

- (BWStillImageSampleBufferSinkNode)stillImageSinkNode
{
  return self->_stillImageSinkNode;
}

- (BWPortraitHDRStagingNode)portraitHDRStagingNode
{
  return self->_portraitHDRStagingNode;
}

- (void)enablePrepareTimeAllocationsForDeferredPrepare
{
}

@end