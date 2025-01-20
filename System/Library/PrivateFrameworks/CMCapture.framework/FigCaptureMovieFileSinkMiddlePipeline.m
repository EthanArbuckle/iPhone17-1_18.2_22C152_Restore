@interface FigCaptureMovieFileSinkMiddlePipeline
- (FigCaptureMovieFileSinkMiddlePipeline)initWithConfiguration:(id)a3 graph:(id)a4 parentPipeline:(id)a5 headPipeline:(id)a6 captureDevice:(id)a7 workgroup:(id)a8;
- (FigCaptureVISPipeline)overCaptureVISPipeline;
- (FigCaptureVISPipeline)visPipeline;
- (id)audioOutputForTailIndex:(unint64_t)a3;
- (id)metadataOutputsForTailIndex:(unint64_t)a3;
- (id)videoOutputForTailIndex:(unint64_t)a3;
- (uint64_t)_buildMovieFileSinkExtendedCVISMiddleWithConfiguration:(void *)a3 graph:(id *)a4 parentPipeline:(void *)a5 headPipeline:(void *)a6 captureDevice:(uint64_t)a7 workgroup:;
- (void)dealloc;
@end

@implementation FigCaptureMovieFileSinkMiddlePipeline

- (uint64_t)_buildMovieFileSinkExtendedCVISMiddleWithConfiguration:(void *)a3 graph:(id *)a4 parentPipeline:(void *)a5 headPipeline:(void *)a6 captureDevice:(uint64_t)a7 workgroup:
{
  v68[1] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v11 = result;
    id v67 = 0;
    uint64_t v12 = [a2 movieFileSinkPipelineConfiguration];
    uint64_t v13 = [a2 movieFilePipelineStage];
    v66 = +[BWPipelineStage pipelineStageWithName:@"com.apple.coremedia.capture.moviefile.middle" priority:14 workgroup:a7];
    uint64_t v14 = [*(id *)(v11 + 72) videoOutput];
    if (!v14) {
      goto LABEL_54;
    }
    uint64_t v15 = v14;
    if (v12)
    {
      v16 = *(__CFString **)(v12 + 16);
      if (+[FigCaptureVISPipeline visPipelineIsRequiredForFigCaptureVideoStabilizationType:]((uint64_t)FigCaptureVISPipeline, *(_DWORD *)(v12 + 104))|| *(unsigned char *)(v12 + 122))
      {
LABEL_6:
        v62 = v16;
        uint64_t v65 = objc_msgSend((id)objc_msgSend(a5, "irisStagingNode"), "motionDataTimeMachine");
        char v61 = [(__CFString *)mfsp_avVideoCodec(v16) isEqualToString:@"hvc1"];
        if (v12 && *(unsigned char *)(v12 + 122))
        {
          v17 = [FigCaptureVISPipeline alloc];
          int v18 = 1;
          int v60 = 4;
        }
        else
        {
          if (a4) {
            uint64_t v19 = [a4[7] irisStagingNode];
          }
          else {
            uint64_t v19 = 0;
          }
          BOOL v20 = v19 != 0;
          v17 = [FigCaptureVISPipeline alloc];
          int v60 = v20;
          if (!v12)
          {
            v21 = v17;
            uint64_t v58 = 0;
            int v57 = 0;
            unsigned int v59 = 0;
            unsigned int v23 = 0;
            float v22 = 0.0;
LABEL_14:
            uint64_t v24 = [a2 movieFileSinkPipelineConfiguration];
            if (v24) {
              uint64_t v25 = *(void *)(v24 + 96);
            }
            else {
              uint64_t v25 = 0;
            }
            v26 = v66;
            if (v12)
            {
              unsigned int v27 = *(_DWORD *)(v12 + 144);
              unsigned __int8 v28 = *(unsigned char *)(v12 + 148) != 0;
              unsigned __int8 v29 = *(unsigned char *)(v12 + 149) != 0;
              char v30 = *(unsigned char *)(v12 + 192) != 0;
              unsigned __int8 v31 = *(unsigned char *)(v12 + 195) != 0;
              unsigned __int8 v32 = *(unsigned char *)(v12 + 196) != 0;
              v33 = *(void **)(v12 + 128);
            }
            else
            {
              unsigned __int8 v32 = 0;
              char v30 = 0;
              unsigned __int8 v28 = 0;
              unsigned int v27 = 0;
              unsigned __int8 v29 = 0;
              unsigned __int8 v31 = 0;
              v33 = 0;
            }
            v34 = -[FigCaptureVISPipeline initWithUpstreamOutput:graph:name:parentPipeline:videoCaptureConnectionConfiguration:pipelineStage:sdofPipelineStage:videoStabilizationType:motionAttachmentsSource:fillExtendedRowsOfOutputBuffer:overCaptureEnabled:stereoMode:videoStabilizationOverscanOverride:videoStabilizationStrength:motionMetadataPreloadingEnabled:visExecutionMode:pipelineTraceID:captureDevice:outputDimensions:P3ToBT2020ConversionEnabled:stabilizeDepthAttachments:outputDepthDimensions:maxLossyCompressionLevel:videoSTFEnabled:videoGreenGhostMitigationEnabled:lightSourceMaskAndKeypointDescriptorDataEnabled:personSegmentationRenderingEnabled:smartStyleRenderingEnabled:smartStyleReversibilityEnabled:lowResImageUsedByVideoEncoderEnabled:portTypesWithGeometricDistortionCorrectionInVISEnabled:visProcessingSemaphore:](v21, v15, a3, v22, @"Middle Over-Capture VIS Pipeline Transforms", a4, v62, v66, 0, v59, HIDWORD(v58), v61, v58, 0, v23, v65 != 0, v60, 0x50u, a6,
                    v25,
                    0,
                    0,
                    0,
                    v27,
                    v28,
                    v29,
                    v30,
                    0,
                    v31,
                    v32,
                    0,
                    v33,
                    0);
            *(void *)(v11 + 32) = v34;
            if (v34)
            {
              if (v12) {
                BOOL v35 = *(unsigned char *)(v12 + 138) != 0;
              }
              else {
                BOOL v35 = 0;
              }
              unsigned int v36 = (v57 | v35) ^ 1;
              if (v65) {
                uint64_t v37 = v36;
              }
              else {
                uint64_t v37 = 0;
              }
              [(id)-[FigCaptureVISPipeline visNode]((uint64_t)v34) setGeneratesDroppedSampleMarkerBuffers:v37];
              if (v65)
              {
                uint64_t v38 = [(id)-[FigCaptureVISPipeline visNode](*(void *)(v11 + 32)) cinematicLookAheadFrameCount];
                v39 = (void *)[a5 fileCoordinatorNode];
                uint64_t v40 = v38;
                v26 = v66;
                [v39 setCinematicLookAheadFrameCount:v40];
              }
              uint64_t v15 = [(id)-[FigCaptureVISPipeline visNode](*(void *)(v11 + 32)) output];
              if (!v12 || !*(unsigned char *)(v12 + 138)) {
                goto LABEL_45;
              }
              v41 = [BWAttachedMediaSwapNode alloc];
              v68[0] = *MEMORY[0x1E4F55CE0];
              v42 = -[BWAttachedMediaSwapNode initWithPrimaryFormatToAttachedMediaKey:attachedMediaKeyToPrimaryFormat:sampleBufferAttachmentsToTransfer:generatesDroppedSampleMarkerBuffers:](v41, "initWithPrimaryFormatToAttachedMediaKey:attachedMediaKeyToPrimaryFormat:sampleBufferAttachmentsToTransfer:generatesDroppedSampleMarkerBuffers:", 0x1EFA43D40, @"SynchronizedSlaveFrame", [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:1], 0);
              if (!v42) {
                goto LABEL_70;
              }
              v43 = v42;
              [(BWNode *)v42 setName:@"Swap Primary and Synchronized Slave"];
              if (([a4 addNode:v43 error:&v67] & 1) == 0
                || (objc_msgSend(a3, "connectOutput:toInput:pipelineStage:", v15, -[BWNode input](v43, "input"), v26) & 1) == 0)
              {
                goto LABEL_70;
              }
              uint64_t v44 = [(BWNode *)v43 output];
              v45 = v26;
              int v46 = *(unsigned __int8 *)(v12 + 122);
              if (*(unsigned char *)(v12 + 122)) {
                int v47 = 4;
              }
              else {
                int v47 = 2;
              }
              v48 = -[FigCaptureVISPipeline initWithUpstreamOutput:graph:name:parentPipeline:videoCaptureConnectionConfiguration:pipelineStage:sdofPipelineStage:videoStabilizationType:motionAttachmentsSource:fillExtendedRowsOfOutputBuffer:overCaptureEnabled:stereoMode:videoStabilizationOverscanOverride:videoStabilizationStrength:motionMetadataPreloadingEnabled:visExecutionMode:pipelineTraceID:captureDevice:outputDimensions:P3ToBT2020ConversionEnabled:stabilizeDepthAttachments:outputDepthDimensions:maxLossyCompressionLevel:videoSTFEnabled:videoGreenGhostMitigationEnabled:lightSourceMaskAndKeypointDescriptorDataEnabled:personSegmentationRenderingEnabled:smartStyleRenderingEnabled:smartStyleReversibilityEnabled:lowResImageUsedByVideoEncoderEnabled:portTypesWithGeometricDistortionCorrectionInVISEnabled:visProcessingSemaphore:]([FigCaptureVISPipeline alloc], v44, a3, *(float *)(v12 + 164), @"Middle Over-Capture VIS Pipeline Synchronized Slave Transforms", a4, v62, v45, 0, *(_DWORD *)(v12 + 104), *(_DWORD *)(v12 + 112), v61, *(unsigned char *)(v12 + 138), 0, *(_DWORD *)(v12 + 168), 0, v47, 0x50u, a6,
                      *(void *)(v12 + 96),
                      0,
                      0,
                      0,
                      *(_DWORD *)(v12 + 144),
                      *(_WORD *)(v12 + 148),
                      HIBYTE(*(_WORD *)(v12 + 148)),
                      *(unsigned char *)(v12 + 192),
                      0,
                      *(_WORD *)(v12 + 195),
                      HIBYTE(*(_WORD *)(v12 + 195)),
                      0,
                      *(void **)(v12 + 128),
                      0);
              *(void *)(v11 + 48) = v48;
              if (v48)
              {
                uint64_t v49 = [(id)-[FigCaptureVISPipeline visNode]((uint64_t)v48) output];
                if (v65) {
                  BOOL v50 = v46 == 0;
                }
                else {
                  BOOL v50 = 0;
                }
                uint64_t v37 = v50;
                v51 = [[BWAttachedMediaSwapNode alloc] initWithPrimaryFormatToAttachedMediaKey:@"SynchronizedSlaveFrame" attachedMediaKeyToPrimaryFormat:0x1EFA43D40 sampleBufferAttachmentsToTransfer:0 generatesDroppedSampleMarkerBuffers:v37];
                if (!v51) {
                  goto LABEL_70;
                }
                v52 = v51;
                [(BWNode *)v51 setName:@"Unswap Primary and Synchronized Slave"];
                if (([a4 addNode:v52 error:&v67] & 1) == 0) {
                  goto LABEL_70;
                }
                v26 = v66;
                if ((objc_msgSend(a3, "connectOutput:toInput:pipelineStage:", v49, -[BWNode input](v52, "input"), v66) & 1) == 0) {
                  goto LABEL_70;
                }
                uint64_t v15 = [(BWNode *)v52 output];
LABEL_45:
                if (!a4) {
                  goto LABEL_47;
                }
                goto LABEL_46;
              }
            }
            FigDebugAssert3();
            result = FigSignalErrorAt();
            if (result) {
              return result;
            }
            goto LABEL_67;
          }
          int v18 = 0;
        }
        v21 = v17;
        int v57 = v18;
        HIDWORD(v58) = *(_DWORD *)(v12 + 112);
        unsigned int v59 = *(_DWORD *)(v12 + 104);
        LOBYTE(v58) = *(unsigned char *)(v12 + 138) != 0;
        float v22 = *(float *)(v12 + 164);
        unsigned int v23 = *(_DWORD *)(v12 + 168);
        goto LABEL_14;
      }
    }
    else if (+[FigCaptureVISPipeline visPipelineIsRequiredForFigCaptureVideoStabilizationType:]((uint64_t)FigCaptureVISPipeline, 0))
    {
      v16 = 0;
      goto LABEL_6;
    }
    uint64_t v37 = 0;
    v26 = v66;
    if (!a4)
    {
LABEL_47:
      if (v12 && *(unsigned char *)(v12 + 138))
      {
        v53 = [[BWOverCaptureAttachedMediaSplitNode alloc] initWithBackPressureExtraRetainBufferCount:0];
      }
      else
      {
        v53 = [[BWFanOutNode alloc] initWithFanOutCount:1 mediaType:1986618469];
        [(BWNode *)v53 setName:@"Just Here To Drop Tagged Buffers"];
      }
      [(BWNodeInput *)[(BWNode *)v53 input] setDiscardsSampleDataTaggedToBeDropped:v37];
      if (([a4 addNode:v53 error:0] & 1) == 0
        || (objc_msgSend(a3, "connectOutput:toInput:pipelineStage:", v15, -[BWNode input](v53, "input"), v26) & 1) == 0)
      {
        goto LABEL_70;
      }
      *(void *)(v11 + 40) = v53;
LABEL_54:
      if ([*(id *)(v11 + 72) audioOutput] && *(void *)(v11 + 80) >= 2uLL)
      {
        v54 = [(BWFanOutNode *)[BWOverCaptureFanOutNode alloc] initWithFanOutCount:2 mediaType:1936684398];
        if (([a4 addNode:v54 error:0] & 1) == 0
          || (objc_msgSend(a3, "connectOutput:toInput:pipelineStage:", objc_msgSend(*(id *)(v11 + 72), "audioOutput"), -[BWNode input](v54, "input"), v13) & 1) == 0)
        {
          goto LABEL_70;
        }
        *(void *)(v11 + 56) = v54;
      }
      result = objc_msgSend((id)objc_msgSend(*(id *)(v11 + 72), "metadataOutputs"), "count");
      if (!result) {
        goto LABEL_67;
      }
      if (*(void *)(v11 + 80) < 2uLL) {
        goto LABEL_66;
      }
      *(void *)(v11 + 64) = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend((id)objc_msgSend(*(id *)(v11 + 72), "metadataOutputs"), "count"));
      result = objc_msgSend((id)objc_msgSend(*(id *)(v11 + 72), "metadataOutputs"), "count");
      if (!result) {
        goto LABEL_67;
      }
      uint64_t v55 = 0;
      while (1)
      {
        v56 = [(BWFanOutNode *)[BWOverCaptureFanOutNode alloc] initWithFanOutCount:2 mediaType:1835365473];
        if (([a4 addNode:v56 error:0] & 1) == 0
          || (objc_msgSend(a3, "connectOutput:toInput:pipelineStage:", objc_msgSend((id)objc_msgSend(*(id *)(v11 + 72), "metadataOutputs"), "objectAtIndexedSubscript:", v55), -[BWNode input](v56, "input"), v13) & 1) == 0)
        {
          break;
        }
        [*(id *)(v11 + 64) addObject:v56];
        if (objc_msgSend((id)objc_msgSend(*(id *)(v11 + 72), "metadataOutputs"), "count") <= (unint64_t)++v55) {
          goto LABEL_66;
        }
      }
LABEL_70:
      FigDebugAssert3();
LABEL_66:
      result = 0;
LABEL_67:
      if (v67) {
        return [v67 code];
      }
      return result;
    }
LABEL_46:
    [a4[7] irisStagingNode];
    goto LABEL_47;
  }
  return result;
}

- (FigCaptureVISPipeline)visPipeline
{
  return self->_visPipeline;
}

- (id)videoOutputForTailIndex:(unint64_t)a3
{
  if (self->_videoFanOut)
  {
    v4 = [(BWNode *)self->_videoFanOut outputs];
    return [(NSArray *)v4 objectAtIndexedSubscript:a3];
  }
  else
  {
    headPipeline = self->_headPipeline;
    return [(FigCaptureMovieFileSinkHeadPipeline *)headPipeline videoOutput];
  }
}

- (id)metadataOutputsForTailIndex:(unint64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  metadataFanOuts = self->_metadataFanOuts;
  if (metadataFanOuts)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSMutableArray count](metadataFanOuts, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v7 = self->_metadataFanOuts;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v7);
          }
          objc_msgSend(v6, "addObject:", objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v11++), "outputs"), "objectAtIndexedSubscript:", a3));
        }
        while (v9 != v11);
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }
    return v6;
  }
  else
  {
    headPipeline = self->_headPipeline;
    return [(FigCaptureMovieFileSinkHeadPipeline *)headPipeline metadataOutputs];
  }
}

- (FigCaptureMovieFileSinkMiddlePipeline)initWithConfiguration:(id)a3 graph:(id)a4 parentPipeline:(id)a5 headPipeline:(id)a6 captureDevice:(id)a7 workgroup:(id)a8
{
  v23.receiver = self;
  v23.super_class = (Class)FigCaptureMovieFileSinkMiddlePipeline;
  long long v14 = [(FigCapturePipeline *)&v23 initWithGraph:a4 name:@"Middle Pipeline"];
  if (!v14) {
    return v14;
  }
  uint64_t v15 = [a3 movieFileSinkPipelineConfiguration];
  if (v15)
  {
    uint64_t v16 = 1;
    if (*(unsigned char *)(v15 + 138)) {
      uint64_t v16 = 2;
    }
  }
  else
  {
    uint64_t v16 = 1;
  }
  v14->_numberOfTailsToSupport = v16;
  long long v17 = (void *)[a3 movieFileSinkPipelineConfiguration];
  if (v17) {
    long long v17 = (void *)v17[2];
  }
  if ([v17 irisVISMethod] == 3) {
    goto LABEL_11;
  }
  int v18 = (void *)[a3 movieFileSinkPipelineConfiguration];
  if (v18) {
    int v18 = (void *)v18[2];
  }
  if ([v18 irisVISMethod] == 5) {
LABEL_11:
  }
    BOOL v19 = v14->_numberOfTailsToSupport == 1;
  else {
    BOOL v19 = 0;
  }
  v14->_headPipeline = (FigCaptureMovieFileSinkHeadPipeline *)a6;
  uint64_t v20 = [a3 movieFileSinkPipelineConfiguration];
  if (!v20)
  {
    if (!v19) {
      return v14;
    }
    goto LABEL_18;
  }
  if (*(unsigned char *)(v20 + 138)) {
    char v21 = 1;
  }
  else {
    char v21 = v19;
  }
  if (v21)
  {
LABEL_18:
    if (-[FigCaptureMovieFileSinkMiddlePipeline _buildMovieFileSinkExtendedCVISMiddleWithConfiguration:graph:parentPipeline:headPipeline:captureDevice:workgroup:]((uint64_t)v14, a3, a4, (id *)a5, a6, a7, (uint64_t)a8))
    {
      FigDebugAssert3();

      return 0;
    }
  }
  return v14;
}

- (id)audioOutputForTailIndex:(unint64_t)a3
{
  if (self->_audioFanOut)
  {
    v4 = [(BWNode *)self->_audioFanOut outputs];
    return [(NSArray *)v4 objectAtIndexedSubscript:a3];
  }
  else
  {
    headPipeline = self->_headPipeline;
    return [(FigCaptureMovieFileSinkHeadPipeline *)headPipeline audioOutput];
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureMovieFileSinkMiddlePipeline;
  [(FigCapturePipeline *)&v3 dealloc];
}

- (FigCaptureVISPipeline)overCaptureVISPipeline
{
  return self->_overCaptureVISPipeline;
}

@end