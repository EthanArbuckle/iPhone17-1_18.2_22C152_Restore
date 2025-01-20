@interface VNTrackMaskDetector
+ (id)computeStagesToBindForConfigurationOptions:(id)a3;
+ (id)configurationOptionKeysForDetectorKey;
+ (id)espressoModelFileNameForConfigurationOptions:(id)a3;
+ (id)espressoModelInputImageDimensionsBlobNameForConfigurationOptions:(id)a3;
+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4;
+ (unint64_t)inputImageAspectRatioHandlingForConfigurationOptions:(id)a3;
+ (unsigned)networkRequiredInputImagePixelFormatForConfigurationOptions:(id)a3;
- (BOOL)_removeBackgroundFromPixelBuffer:(__CVBuffer *)a3 toPixelBuffer:(__CVBuffer *)a4 usingMask:(__CVBuffer *)a5 offset:(id *)a6 error:;
- (BOOL)_runInitializerModelWithLockedPixelBuffer:(__CVBuffer *)a3 forState:(id)a4 error:(id *)a5;
- (BOOL)_runUpdateModelWithLockedPixelBuffer:(__CVBuffer *)a3 forState:(id)a4 outputQualityEspressoBuffer:(id *)a5 error:(id *)a6;
- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4;
- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9;
- (__CVBuffer)_upsampleLowResMask:(id *)a3 reference:(__CVBuffer *)a4 error:(id *)a5;
- (id)_loadModelFromFileName:(id)a3 inputBlobNames:(id)a4 outputBlobNames:(id)a5 forComputeDevice:(id)a6 configurationOptions:(id)a7 error:(id *)a8;
- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9;
- (void)dealloc;
@end

@implementation VNTrackMaskDetector

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applyMaskComputeState, 0);
  objc_storeStrong((id *)&self->_postProcessingMetalContext, 0);
  objc_storeStrong((id *)&self->_bilinearUpsampler, 0);
  objc_storeStrong((id *)&self->updateModel, 0);

  objc_storeStrong((id *)&self->initializationModel, 0);
}

- (id)processRegionOfInterest:(CGRect)a3 croppedPixelBuffer:(const __CVBuffer *)a4 options:(id)a5 qosClass:(unsigned int)a6 warningRecorder:(id)a7 error:(id *)a8 progressHandler:(id)a9
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v14 = a5;
  id v64 = a7;
  id v65 = a9;
  v15 = [v14 valueForKey:@"VNTrackMaskDetectorProcessOption_State"];
  if (v15)
  {
    v16 = [v14 objectForKeyedSubscript:@"VNTrackMaskDetectorProcessorOption_GenerateCropRect"];
    int v17 = [v16 BOOLValue];

    v18 = [(VNDetector *)self validatedImageBufferFromOptions:v14 error:a8];
    if (!v18)
    {
      v21 = 0;
LABEL_52:

      goto LABEL_53;
    }
    v63 = +[VNValidationUtilities originatingRequestSpecifierInOptions:v14 error:a8];
    if (!v63) {
      goto LABEL_18;
    }
    [v18 timingInfo];
    CMTimeValue value = v67;
    CMTimeFlags flags = v69;
    CMTimeScale timescale = v68;
    int v61 = v17;
    if (v69)
    {
      CMTimeEpoch epoch = v70;
    }
    else
    {
      [v15 lastProcessedPTS];
      CMTimeMake(&rhs, 1, 30);
      CMTimeAdd(&v66, &lhs, &rhs);
      CMTimeValue value = v66.value;
      CMTimeFlags flags = v66.flags;
      CMTimeScale timescale = v66.timescale;
      CMTimeEpoch epoch = v66.epoch;
      CMTime v80 = v66;
      [v15 setLastProcessedPTS:&v80];
    }
    memset(&v79, 0, sizeof(v79));
    v78.CMTimeValue value = value;
    v78.CMTimeScale timescale = timescale;
    v78.CMTimeFlags flags = flags;
    v78.CMTimeEpoch epoch = epoch;
    [v15 lastUpdatePTS];
    CMTimeSubtract(&v79, &v78, &v77);
    [v15 frameUpdateSpacing];
    CMTime time2 = v79;
    int32_t v22 = CMTimeCompare(&time1, &time2);
    if (v22 < 0)
    {
      CMTimeValue v71 = value;
      CMTimeScale v72 = timescale;
      CMTimeFlags v73 = flags;
      CMTimeEpoch v74 = epoch;
      [v15 setLastUpdatePTS:&v71];
    }
    uint64_t v23 = objc_msgSend(v18, "bufferWithWidth:height:format:options:error:", objc_msgSend(v18, "width"), objc_msgSend(v18, "height"), 1111970369, v14, a8);
    if (!v23)
    {
LABEL_18:
      v21 = 0;
LABEL_51:

      goto LABEL_52;
    }
    texture = (__CVBuffer *)v23;
    if ([v15 firstFrame])
    {
      if (![(VNTrackMaskDetector *)self _runInitializerModelWithLockedPixelBuffer:a4 forState:v15 error:a8])
      {
        v31 = 0;
        CVPixelBufferRelease(texture);
        int v38 = 2;
        texture = 0;
        v36 = 0;
        v37 = 0;
        goto LABEL_47;
      }
      v24 = CVPixelBufferRetain((CVPixelBufferRef)[v15 inititalMask]);
      CVPixelBufferLockBaseAddress(v24, 1uLL);
      float v25 = 1.0;
      if (v24)
      {
        size_t Width = CVPixelBufferGetWidth(v24);
        size_t Height = CVPixelBufferGetHeight(v24);
        v28 = (int64x2_t *)operator new(0x20uLL);
        int64x2_t *v28 = vdupq_n_s64(1uLL);
        v28[1].i64[0] = Width;
        v28[1].i64[1] = Height;
        BaseAddress = CVPixelBufferGetBaseAddress(v24);
        id v30 = v15;
        *(void *)[v30 getOutputMaskBuffer] = BaseAddress;
        [v30 getOutputMaskBuffer];
        espresso_buffer_pack_tensor_shape();
        operator delete(v28);
        v31 = v24;
LABEL_32:
        [v15 setFirstFrame:0];
        size_t v39 = CVPixelBufferGetWidth(texture);
        size_t v40 = CVPixelBufferGetHeight(texture);
        uint64_t PixelFormatType = CVPixelBufferGetPixelFormatType(texture);
        v60 = +[VNCVPixelBufferHelper createPixelBufferUsingIOSurfaceWithWidth:height:pixelFormatType:error:]((uint64_t)VNCVPixelBufferHelper, v39, v40, PixelFormatType, a8);
        v42 = -[VNTrackMaskDetector _upsampleLowResMask:reference:error:](self, "_upsampleLowResMask:reference:error:", [v15 getOutputMaskBuffer], texture, a8);
        v36 = v60;
        if (!-[VNTrackMaskDetector _removeBackgroundFromPixelBuffer:toPixelBuffer:usingMask:offset:error:](self, "_removeBackgroundFromPixelBuffer:toPixelBuffer:usingMask:offset:error:", texture))
        {
          v37 = 0;
          int v38 = 1;
          if (!v31) {
            goto LABEL_47;
          }
          goto LABEL_46;
        }
        CFStringRef v43 = (const __CFString *)*MEMORY[0x1E4F24A00];
        if (CVBufferHasAttachment(a4, (CFStringRef)*MEMORY[0x1E4F24A00]))
        {
          LODWORD(v66.value) = 0;
          CFTypeRef v44 = CVBufferCopyAttachment(a4, v43, (CVAttachmentMode *)&v66);
          CVBufferSetAttachment(v60, v43, v44, v66.value);
          CFRelease(v44);
        }
        v37 = [[VNPixelBufferObservation alloc] initWithOriginatingRequestSpecifier:v63 featureName:0 CVPixelBuffer:v60];
        *(float *)&double v45 = v25;
        [(VNObservation *)v37 setConfidence:v45];
        if (v61)
        {
          double v46 = calculateCropSizeOfPixelBuffer(v42, 0, 0.1);
          double v48 = v47;
          double v50 = v49;
          double v52 = v51;
          size_t v53 = CVPixelBufferGetWidth(v42);
          size_t v54 = CVPixelBufferGetHeight(v42);
          double v55 = 0.0;
          double v56 = 0.0;
          double v57 = 0.0;
          if (v53)
          {
            double v56 = v46 / (double)v53;
            double v57 = v50 / (double)v53;
          }
          double v58 = 0.0;
          if (v54)
          {
            double v55 = v48 / (double)v54;
            double v58 = v52 / (double)v54;
          }
          if (v37)
          {
            int v38 = 0;
            v37->_croppedBoundingBox.origin.x = v56;
            v37->_croppedBoundingBox.origin.y = v55;
            v37->_croppedBoundingBox.size.width = v57;
            v37->_croppedBoundingBox.size.height = v58;
            if (!v31) {
              goto LABEL_47;
            }
            goto LABEL_46;
          }
        }
        int v38 = 0;
        if (v31) {
LABEL_46:
        }
          CVPixelBufferUnlockBaseAddress(v31, 1uLL);
LABEL_47:
        CVPixelBufferRelease(v31);
        CVPixelBufferRelease(v36);
        CVPixelBufferRelease(texture);
        if (v38)
        {
          v21 = 0;
        }
        else
        {
          v83 = v37;
          v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v83 count:1];
        }

        goto LABEL_51;
      }
LABEL_31:
      v31 = 0;
      goto LABEL_32;
    }
    if (v22 < 0)
    {
      if (![(VNTrackMaskDetector *)self _runUpdateModelWithLockedPixelBuffer:a4 forState:v15 outputQualityEspressoBuffer:&v66 error:a8])
      {
LABEL_27:
        v31 = 0;
        v36 = 0;
        v37 = 0;
        int v38 = 2;
        goto LABEL_47;
      }
    }
    else
    {
      if (![(VNEspressoModelFileBasedDetector *)self bindLockedPixelBuffer:a4 toNetworkInputBlobName:@"input_image" error:a8])goto LABEL_27; {
      id v32 = v15;
      }
      if (!-[VNEspressoModelFileBasedDetector bindClientBuffer:toNetworkInputBlobName:error:](self, "bindClientBuffer:toNetworkInputBlobName:error:", [v32 getKeyBuffer], @"prev_key", a8))goto LABEL_27; {
      id v33 = v32;
      }
      if (!-[VNEspressoModelFileBasedDetector bindClientBuffer:toNetworkInputBlobName:error:](self, "bindClientBuffer:toNetworkInputBlobName:error:", [v33 getValueBuffer], @"prev_value", a8))goto LABEL_27; {
      id v34 = v33;
      }
      if (!-[VNEspressoModelFileBasedDetector bindClientBuffer:toNetworkInputBlobName:error:](self, "bindClientBuffer:toNetworkInputBlobName:error:", [v34 getHiddenMaskBuffer], @"hidden_state", a8)|| !-[VNEspressoModelFileBasedDetector bindBuffer:toNetworkOutputBlobName:error:](self, "bindBuffer:toNetworkOutputBlobName:error:", objc_msgSend(v34, "getOutputMaskBuffer"), @"output", a8)|| !-[VNEspressoModelFileBasedDetector bindBuffer:toNetworkOutputBlobName:error:](self, "bindBuffer:toNetworkOutputBlobName:error:", &v66, @"quality", a8)|| !-[VNEspressoModelFileBasedDetector executePlanAndReturnError:](self, "executePlanAndReturnError:", a8))
      {
        goto LABEL_27;
      }
    }
    float v25 = *(float *)v66.value;
    LODWORD(v35) = *(_DWORD *)v66.value;
    [v15 setConfidence:v35];
    goto LABEL_31;
  }
  if (a8)
  {
    +[VNError errorForInternalErrorWithLocalizedDescription:@"State missing for processing"];
    v21 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = 0;
  }
LABEL_53:

  return v21;
}

- (BOOL)_runUpdateModelWithLockedPixelBuffer:(__CVBuffer *)a3 forState:(id)a4 outputQualityEspressoBuffer:(id *)a5 error:(id *)a6
{
  id v10 = a4;
  if (-[VNEspressoModelFileBasedDetector bindLockedPixelBuffer:toNetworkInputBlobName:forModel:error:](self, "bindLockedPixelBuffer:toNetworkInputBlobName:forModel:error:", a3, @"input_image", self->updateModel, a6)&& (id v11 = v10, -[VNEspressoModelFileBasedDetector bindClientBuffer:toNetworkInputBlobName:forModel:error:](self, "bindClientBuffer:toNetworkInputBlobName:forModel:error:", [v11 getKeyBuffer], @"prev_key", self->updateModel, a6))&& (v12 = objc_retainAutorelease(v11), -[VNEspressoModelFileBasedDetector bindClientBuffer:toNetworkInputBlobName:forModel:error:](self, "bindClientBuffer:toNetworkInputBlobName:forModel:error:", objc_msgSend(v12, "getValueBuffer"),
          @"prev_value",
          self->updateModel,
          a6))
    && (id v13 = v12,
        -[VNEspressoModelFileBasedDetector bindClientBuffer:toNetworkInputBlobName:forModel:error:](self, "bindClientBuffer:toNetworkInputBlobName:forModel:error:", [v13 getHiddenMaskBuffer], @"hidden_state", self->updateModel, a6))&& (id v14 = v13, -[VNEspressoModelFileBasedDetector bindBuffer:toNetworkOutputBlobName:forModel:error:](self, "bindBuffer:toNetworkOutputBlobName:forModel:error:", objc_msgSend(v14, "getOutputMaskBuffer"), @"output", self->updateModel, a6))&& -[VNEspressoModelFileBasedDetector bindBuffer:toNetworkOutputBlobName:forModel:error:](self, "bindBuffer:toNetworkOutputBlobName:forModel:error:", a5, @"quality",
         self->updateModel,
         a6)
    && (id v15 = v14,
        -[VNEspressoModelFileBasedDetector bindBuffer:toNetworkOutputBlobName:forModel:error:](self, "bindBuffer:toNetworkOutputBlobName:forModel:error:", [v15 getKeyBuffer], @"key", self->updateModel, a6))&& (id v16 = v15, -[VNEspressoModelFileBasedDetector bindBuffer:toNetworkOutputBlobName:forModel:error:](self, "bindBuffer:toNetworkOutputBlobName:forModel:error:", objc_msgSend(v16, "getValueBuffer"), @"value", self->updateModel, a6))&& -[VNEspressoModelFileBasedDetector bindBuffer:toNetworkOutputBlobName:forModel:error:](self, "bindBuffer:toNetworkOutputBlobName:forModel:error:", &v21, @"hidden",
         self->updateModel,
         a6)
    && [(VNEspressoModelFileBasedDetector *)self executePlanForModel:self->updateModel error:a6])
  {
    id v17 = v16;
    v18 = *(void **)[v17 getHiddenMaskBuffer];
    memcpy(v18, v21, 4 * *(void *)([v17 getHiddenMaskBuffer] + 152));
    BOOL v19 = 1;
  }
  else
  {
    BOOL v19 = 0;
  }

  return v19;
}

- (BOOL)_runInitializerModelWithLockedPixelBuffer:(__CVBuffer *)a3 forState:(id)a4 error:(id *)a5
{
  id v8 = a4;
  if (![v8 inititalMask])
  {
    if (a5)
    {
      *a5 = +[VNError errorForInternalErrorWithLocalizedDescription:@"Initial mask missing for processing"];
    }
    goto LABEL_13;
  }
  id v9 = v8;
  if (!-[VNEspressoModelFileBasedDetector bindBuffer:toNetworkOutputBlobName:error:](self, "bindBuffer:toNetworkOutputBlobName:error:", [v9 getHiddenMaskBuffer], @"hidden", a5)|| (id v10 = v9, v11 = *(void **)objc_msgSend(v10, "getHiddenMaskBuffer"), v12 = objc_retainAutorelease(v10), bzero(v11, 4 * *(void *)(objc_msgSend(v12, "getHiddenMaskBuffer") + 152)), !-[VNEspressoModelFileBasedDetector bindLockedPixelBuffer:toNetworkInputBlobName:forModel:error:](self, "bindLockedPixelBuffer:toNetworkInputBlobName:forModel:error:", a3, @"input_image", self->initializationModel, a5)))
  {
LABEL_13:
    int v21 = 2;
    goto LABEL_14;
  }
  CVPixelBufferLockBaseAddress((CVPixelBufferRef)[v12 inititalMask], 1uLL);
  size_t Width = CVPixelBufferGetWidth((CVPixelBufferRef)[v12 inititalMask]);
  size_t Height = CVPixelBufferGetHeight((CVPixelBufferRef)[v12 inititalMask]);
  id v15 = (int64x2_t *)operator new(0x20uLL);
  int64x2_t *v15 = vdupq_n_s64(1uLL);
  v15[1].i64[0] = Width;
  v15[1].i64[1] = Height;
  memset(v24, 0, 168);
  v24[0] = CVPixelBufferGetBaseAddress((CVPixelBufferRef)[v12 inititalMask]);
  espresso_buffer_pack_tensor_shape();
  if (-[VNEspressoModelFileBasedDetector bindClientBuffer:toNetworkInputBlobName:forModel:error:](self, "bindClientBuffer:toNetworkInputBlobName:forModel:error:", v24, @"mask", self->initializationModel, a5)&& (v16 = v12, -[VNEspressoModelFileBasedDetector bindClientBuffer:toNetworkInputBlobName:forModel:error:](self, "bindClientBuffer:toNetworkInputBlobName:forModel:error:", [v16 getHiddenMaskBuffer], @"hidden_state", self->initializationModel, a5))&& (id v17 = objc_retainAutorelease(v16), -[VNEspressoModelFileBasedDetector bindBuffer:toNetworkOutputBlobName:forModel:error:](self, "bindBuffer:toNetworkOutputBlobName:forModel:error:", objc_msgSend(v17, "getKeyBuffer"),
          @"key",
          self->initializationModel,
          a5))
    && (id v18 = v17,
        -[VNEspressoModelFileBasedDetector bindBuffer:toNetworkOutputBlobName:forModel:error:](self, "bindBuffer:toNetworkOutputBlobName:forModel:error:", [v18 getValueBuffer], @"value", self->initializationModel, a5))&& -[VNEspressoModelFileBasedDetector bindBuffer:toNetworkOutputBlobName:forModel:error:](self, "bindBuffer:toNetworkOutputBlobName:forModel:error:", &v23, @"hidden", self->initializationModel, a5)&& -[VNEspressoModelFileBasedDetector executePlanForModel:error:](self, "executePlanForModel:error:", self->initializationModel, a5))
  {
    id v19 = v18;
    v20 = *(void **)[v19 getHiddenMaskBuffer];
    memcpy(v20, v23, 4 * *(void *)([v19 getHiddenMaskBuffer] + 152));
    int v21 = 0;
  }
  else
  {
    int v21 = 1;
  }
  operator delete(v15);
LABEL_14:
  CVPixelBufferUnlockBaseAddress((CVPixelBufferRef)[v8 inititalMask], 1uLL);

  return v21 == 0;
}

- (BOOL)createRegionOfInterestCrop:(CGRect)a3 options:(id)a4 qosClass:(unsigned int)a5 warningRecorder:(id)a6 pixelBuffer:(__CVBuffer *)a7 error:(id *)a8 progressHandler:(id)a9
{
  uint64_t v13 = *(void *)&a5;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v19 = a4;
  id v20 = a6;
  id v21 = a9;
  [v19 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"VNImageBufferOption_CreateFromPixelBufferPool"];
  v23.receiver = self;
  v23.super_class = (Class)VNTrackMaskDetector;
  LOBYTE(a8) = -[VNEspressoModelFileBasedDetector createRegionOfInterestCrop:options:qosClass:warningRecorder:pixelBuffer:error:progressHandler:](&v23, sel_createRegionOfInterestCrop_options_qosClass_warningRecorder_pixelBuffer_error_progressHandler_, v19, v13, v20, a7, a8, v21, x, y, width, height);

  return (char)a8;
}

- (BOOL)completeInitializationForSession:(id)a3 error:(id *)a4
{
  v21.receiver = self;
  v21.super_class = (Class)VNTrackMaskDetector;
  if (!-[VNEspressoModelFileBasedDetector completeInitializationForSession:error:](&v21, sel_completeInitializationForSession_error_, a3))return 0; {
  v6 = [(VNDetector *)self boundComputeDeviceForComputeStage:@"VNComputeStageMain" error:a4];
  }
  if (v6)
  {
    v7 = [(VNDetector *)self configurationOptions];
    id v8 = [(VNTrackMaskDetector *)self _loadModelFromFileName:@"vmtracker_memory_v1_6.espresso" inputBlobNames:&unk_1EF7A7DA8 outputBlobNames:&unk_1EF7A7DC0 forComputeDevice:v6 configurationOptions:v7 error:a4];
    initializationModel = self->initializationModel;
    self->initializationModel = v8;

    if (self->initializationModel
      && ([(VNTrackMaskDetector *)self _loadModelFromFileName:@"vmtracker_mask_memory_v1_6.espresso" inputBlobNames:&unk_1EF7A7DD8 outputBlobNames:&unk_1EF7A7DF0 forComputeDevice:v6 configurationOptions:v7 error:a4], id v10 = (VNEspressoResources *)objc_claimAutoreleasedReturnValue(), updateModel = self->updateModel, self->updateModel = v10, updateModel, self->updateModel))
    {
      id v12 = [(VNDetector *)self boundComputeDeviceForComputeStage:@"VNComputeStagePostProcessing" error:a4];
      if (!v12) {
        goto LABEL_11;
      }
      uint64_t v13 = +[VNComputeDeviceUtilities metalDeviceForComputeDevice:v12];
      +[VNMetalContext metalContextForDevice:error:]((uint64_t)VNMetalContext, v13, a4);
      id v14 = (VNMetalContext *)objc_claimAutoreleasedReturnValue();
      postProcessingMetalContext = self->_postProcessingMetalContext;
      self->_postProcessingMetalContext = v14;

      id v16 = self->_postProcessingMetalContext;
      if (v16)
      {
        -[VNMetalContext computePipelineStateForFunctionWithName:error:]((uint64_t)v16, @"removebkgnd_maskimage_withThresholdFilter", (uint64_t)a4);
        id v17 = (MTLComputePipelineState *)objc_claimAutoreleasedReturnValue();
        applyMaskComputeState = self->_applyMaskComputeState;
        self->_applyMaskComputeState = v17;

        BOOL v19 = self->_applyMaskComputeState != 0;
      }
      else
      {
LABEL_11:
        BOOL v19 = 0;
      }
    }
    else
    {
      BOOL v19 = 0;
    }
  }
  else
  {
    BOOL v19 = 0;
  }

  return v19;
}

- (BOOL)_removeBackgroundFromPixelBuffer:(__CVBuffer *)a3 toPixelBuffer:(__CVBuffer *)a4 usingMask:(__CVBuffer *)a5 offset:(id *)a6 error:
{
  uint64_t v7 = v6;
  int v8 = (int)a6;
  uint64_t v13 = self->_postProcessingMetalContext;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __93__VNTrackMaskDetector__removeBackgroundFromPixelBuffer_toPixelBuffer_usingMask_offset_error___block_invoke;
  v17[3] = &unk_1E5B1D6B0;
  id v20 = a3;
  objc_super v21 = a4;
  int32_t v22 = a5;
  id v18 = v13;
  BOOL v19 = self;
  int v23 = v8;
  id v14 = v13;
  id v15 = _Block_copy(v17);
  LOBYTE(v7) = VNExecuteBlock(v15, v7);

  return v7;
}

BOOL __93__VNTrackMaskDetector__removeBackgroundFromPixelBuffer_toPixelBuffer_usingMask_offset_error___block_invoke(uint64_t a1, void *a2)
{
  v19[3] = *MEMORY[0x1E4F143B8];
  v4 = -[VNMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:plane:error:](*(void **)(a1 + 32), *(CVPixelBufferRef *)(a1 + 48), 80, a2);
  if (v4)
  {
    v5 = -[VNMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:plane:error:](*(void **)(a1 + 32), *(CVPixelBufferRef *)(a1 + 56), 80, a2);
    if (v5)
    {
      uint64_t v6 = -[VNMetalContext bindPixelBufferToMTL2DTexture:pixelFormat:plane:error:](*(void **)(a1 + 32), *(CVPixelBufferRef *)(a1 + 64), 55, a2);
      if (v6)
      {
        uint64_t v7 = -[VNMetalContext commandQueueReturnError:](*(os_unfair_lock_s **)(a1 + 32), a2);
        int v8 = v7;
        BOOL v9 = v7 != 0;
        if (v7)
        {
          id v10 = [v7 commandBuffer];
          id v15 = *(void **)(*(void *)(a1 + 40) + 128);
          uint64_t v16 = *(void *)(a1 + 32);
          uint64_t v11 = [v6 width];
          uint64_t v12 = [v6 height];
          v19[0] = v6;
          v19[1] = v4;
          v19[2] = v5;
          uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:3];
          v17[0] = MEMORY[0x1E4F143A8];
          v17[1] = 3221225472;
          v17[2] = __93__VNTrackMaskDetector__removeBackgroundFromPixelBuffer_toPixelBuffer_usingMask_offset_error___block_invoke_2;
          v17[3] = &__block_descriptor_36_e36_v16__0___MTLComputeCommandEncoder__8l;
          int v18 = *(_DWORD *)(a1 + 72);
          -[VNMetalContext encodeCommandsForBuffer:state:label:width:height:textures:buffers:block:](v16, v10, v15, v11, v12, v13, v17);

          [v10 commit];
          [v10 waitUntilCompleted];
        }
      }
      else
      {
        BOOL v9 = 0;
      }
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

uint64_t __93__VNTrackMaskDetector__removeBackgroundFromPixelBuffer_toPixelBuffer_usingMask_offset_error___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setBytes:a1 + 32 length:4 atIndex:0];
}

- (__CVBuffer)_upsampleLowResMask:(id *)a3 reference:(__CVBuffer *)a4 error:(id *)a5
{
  highResMaskPixelBuffer = self->highResMaskPixelBuffer;
  if (highResMaskPixelBuffer)
  {
    size_t Width = CVPixelBufferGetWidth(highResMaskPixelBuffer);
    size_t v11 = CVPixelBufferGetWidth(a4);
    highResMaskPixelBuffer = self->highResMaskPixelBuffer;
    if (Width == v11)
    {
      size_t Height = CVPixelBufferGetHeight(highResMaskPixelBuffer);
      if (Height == CVPixelBufferGetHeight(a4)) {
        goto LABEL_6;
      }
      highResMaskPixelBuffer = self->highResMaskPixelBuffer;
    }
  }
  CVPixelBufferRelease(highResMaskPixelBuffer);
  size_t v13 = CVPixelBufferGetWidth(a4);
  size_t v14 = CVPixelBufferGetHeight(a4);
  self->highResMaskPixelBuffer = +[VNCVPixelBufferHelper createPixelBufferUsingIOSurfaceWithWidth:height:pixelFormatType:error:]((uint64_t)VNCVPixelBufferHelper, v13, v14, 1278226534, a5);
LABEL_6:
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__VNTrackMaskDetector__upsampleLowResMask_reference_error___block_invoke;
  aBlock[3] = &unk_1E5B1D688;
  aBlock[5] = a4;
  aBlock[6] = a3;
  aBlock[4] = self;
  id v15 = _Block_copy(aBlock);
  char v16 = VNExecuteBlock(v15, (uint64_t)a5);
  id v17 = self->highResMaskPixelBuffer;
  if ((v16 & 1) == 0)
  {
    CVPixelBufferRelease(self->highResMaskPixelBuffer);
    id v17 = 0;
    self->highResMaskPixelBuffer = 0;
  }

  return v17;
}

uint64_t __59__VNTrackMaskDetector__upsampleLowResMask_reference_error___block_invoke(uint64_t a1, void *a2)
{
  long long v15 = *(_OWORD *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v16 = *(void *)(v4 + 104);
  v5 = *(void **)(v4 + 112);
  if (v5) {
    goto LABEL_5;
  }
  uint64_t v6 = [VNBGRBilinearUpsampler alloc];
  uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 120);
  if (v7) {
    uint64_t v7 = (void *)v7[1];
  }
  int v8 = v7;
  uint64_t v9 = [(VNBGRBilinearUpsampler *)v6 initWithMetalDevice:v8];
  uint64_t v10 = *(void *)(a1 + 32);
  size_t v11 = *(void **)(v10 + 112);
  *(void *)(v10 + 112) = v9;

  v5 = *(void **)(*(void *)(a1 + 32) + 112);
  if (v5)
  {
LABEL_5:
    if ([v5 handlePostProcessingRequest:&v15]) {
      return 1;
    }
    if (a2)
    {
      id v13 = +[VNError errorForOperationFailedErrorWithLocalizedDescription:@"image upsampling failed"];
      uint64_t result = 0;
      *a2 = v13;
      return result;
    }
  }
  else if (a2)
  {
    size_t v14 = (void *)[[NSString alloc] initWithFormat:@"unable to create upsampler for %@", *(void *)(*(void *)(a1 + 32) + 120)];
    *a2 = +[VNError errorForOperationFailedErrorWithLocalizedDescription:v14];
  }
  return 0;
}

- (id)_loadModelFromFileName:(id)a3 inputBlobNames:(id)a4 outputBlobNames:(id)a5 forComputeDevice:(id)a6 configurationOptions:(id)a7 error:(id *)a8
{
  id v13 = a3;
  id v14 = a4;
  id v29 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = [v16 objectForKeyedSubscript:@"VNDetectorOption_PreferBackgroundProcessing"];
  uint64_t v18 = [v17 BOOLValue];

  BOOL v19 = +[VNEspressoHelpers pathForEspressoNetworkModelFileWithName:v13 error:a8];
  if (v19
    && ([v16 objectForKeyedSubscript:@"VNDetectorInitOption_MemoryPoolId"],
        id v20 = objc_claimAutoreleasedReturnValue(),
        uint64_t v21 = [v20 unsignedLongLongValue],
        v20,
        unsigned int v31 = 0,
        +[VNValidationUtilities getEspressoPriority:&v31 forKey:@"VNDetectorOption_EspressoPlanPriority" inOptions:v16 withDefaultValue:0 error:a8]))
  {
    id v28 = v14;
    uint64_t v22 = v31;
    int v23 = [v16 objectForKeyedSubscript:@"VNEspressoModelFileBasedDetectorOption_NetworkConfiguration"];
    id v30 = 0;
    BOOL v24 = +[VNEspressoHelpers createSingleNetworkPlanFromModelPath:v19 forComputeDevice:v15 lowPriorityMode:v18 priority:v22 inputBlobNames:v28 outputBlobNames:v29 networkConfiguration:v23 memoryPoolId:v21 espressoResources:&v30 error:a8];
    id v25 = v30;

    if (v24) {
      id v26 = v25;
    }
    else {
      id v26 = 0;
    }
    id v14 = v28;
  }
  else
  {
    id v26 = 0;
  }

  return v26;
}

- (void)dealloc
{
  CVPixelBufferRelease(self->highResMaskPixelBuffer);
  self->highResMaskPixelBuffer = 0;
  v3.receiver = self;
  v3.super_class = (Class)VNTrackMaskDetector;
  [(VNDetector *)&v3 dealloc];
}

+ (unint64_t)inputImageAspectRatioHandlingForConfigurationOptions:(id)a3
{
  return 0;
}

+ (unsigned)networkRequiredInputImagePixelFormatForConfigurationOptions:(id)a3
{
  return 1111970369;
}

+ (id)espressoModelInputImageDimensionsBlobNameForConfigurationOptions:(id)a3
{
  return @"input_image";
}

+ (id)espressoModelFileNameForConfigurationOptions:(id)a3
{
  return @"vmtracker_mask_v1_6.espresso";
}

+ (id)configurationOptionKeysForDetectorKey
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__VNTrackMaskDetector_configurationOptionKeysForDetectorKey__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[VNTrackMaskDetector configurationOptionKeysForDetectorKey]::onceToken != -1) {
    dispatch_once(&+[VNTrackMaskDetector configurationOptionKeysForDetectorKey]::onceToken, block);
  }
  v2 = (void *)+[VNTrackMaskDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys;

  return v2;
}

void __60__VNTrackMaskDetector_configurationOptionKeysForDetectorKey__block_invoke(uint64_t a1)
{
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)&OBJC_METACLASS___VNTrackMaskDetector;
  v1 = objc_msgSendSuper2(&v5, sel_configurationOptionKeysForDetectorKey);
  v2 = (void *)[v1 mutableCopy];

  [v2 addObject:@"VNDetectorOption_PreferBackgroundProcessing"];
  uint64_t v3 = [v2 copy];
  uint64_t v4 = (void *)+[VNTrackMaskDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys;
  +[VNTrackMaskDetector configurationOptionKeysForDetectorKey]::configurationOptionKeys = v3;
}

+ (id)computeStagesToBindForConfigurationOptions:(id)a3
{
  v5[2] = *MEMORY[0x1E4F143B8];
  v5[0] = @"VNComputeStageMain";
  v5[1] = @"VNComputeStagePostProcessing";
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:2];

  return v3;
}

+ (id)supportedComputeStageDevicesForOptions:(id)a3 error:(id *)a4
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v8[0] = @"VNComputeStageMain";
  uint64_t v4 = +[VNComputeDeviceUtilities allNeuralEngineComputeDevices];
  v8[1] = @"VNComputeStagePostProcessing";
  v9[0] = v4;
  objc_super v5 = +[VNComputeDeviceUtilities allGPUComputeDevices];
  v9[1] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];

  return v6;
}

@end