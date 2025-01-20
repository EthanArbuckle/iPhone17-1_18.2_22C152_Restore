@interface BWDeskCamNode
+ (void)initialize;
- (BWDeskCamNode)initWithOutputDimensions:(id)a3 cameraInfoByPortType:(id)a4 horizontalSensorBinningFactor:(int)a5 verticalSensorBinningFactor:(int)a6 stillImageCaptureEnabled:(BOOL)a7 objectMetadataIdentifiers:(id)a8 maxLossyCompressionLevel:(int)a9 portType:(id)a10 overheadCameraMode:(int)a11 captureDevice:(id)a12;
- (BWNodeInput)detectionMetadataInput;
- (BWNodeInput)stillImageInput;
- (BWNodeInput)videoCaptureInput;
- (BWNodeOutput)detectionMetadataOutput;
- (BWNodeOutput)stillImageOutput;
- (BWNodeOutput)videoCaptureOutput;
- (NSString)clientApplicationID;
- (id)nodeSubType;
- (id)nodeType;
- (uint64_t)_initDeskCamSession;
- (uint64_t)_updateFocusIfNeededWithFocusPoint:(uint64_t)result;
- (uint64_t)_updateOutputRequirements;
- (uint64_t)_updateTransportLayerAttachmentsForOutputSampleBuffer:(uint64_t)result;
- (void)_createMatchingPixelBufferFromSavedVideoBuffersWithTargetPts:(uint64_t)a1;
- (void)_newStillImageOutputPixelBufferFromVideoPixelBuffer:(uint64_t)a1;
- (void)_savePixelBufferForStillImageCaptureRequests:(long long *)a3 withPts:;
- (void)_supportedOutputPixelFormats;
- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5;
- (void)dealloc;
- (void)didChangeOverheadCameraMode:(int)a3;
- (void)didReachEndOfDataForInput:(id)a3;
- (void)prepareForCurrentConfigurationToBecomeLive;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
- (void)setClientApplicationID:(id)a3;
@end

@implementation BWDeskCamNode

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (BWDeskCamNode)initWithOutputDimensions:(id)a3 cameraInfoByPortType:(id)a4 horizontalSensorBinningFactor:(int)a5 verticalSensorBinningFactor:(int)a6 stillImageCaptureEnabled:(BOOL)a7 objectMetadataIdentifiers:(id)a8 maxLossyCompressionLevel:(int)a9 portType:(id)a10 overheadCameraMode:(int)a11 captureDevice:(id)a12
{
  BOOL v13 = a7;
  v32.receiver = self;
  v32.super_class = (Class)BWDeskCamNode;
  v18 = [(BWNode *)&v32 init];
  uint64_t v19 = (uint64_t)v18;
  if (v18)
  {
    v18->_outputDimensions = ($470D365275581EF16070F5A11344F73E)a3;
    v18->_cameraInfoByPortType = (NSDictionary *)a4;
    *(void *)(v19 + 264) = objc_alloc_init(BWDeviceOrientationMonitor);
    *(_DWORD *)(v19 + 152) = 0;
    if ((a5 - 3) >= 0xFFFFFFFE && (*(_DWORD *)(v19 + 156) = a5, (a6 - 3) >= 0xFFFFFFFE))
    {
      *(_DWORD *)(v19 + 160) = a6;
      *(_DWORD *)(v19 + 296) = a9;
      v20 = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v19 index:0];
      v21 = objc_alloc_init(BWVideoFormatRequirements);
      [(BWVideoFormatRequirements *)v21 setSupportedPixelFormats:FigCapturePixelFormatsByAddingCompressedVariants(&unk_1EFB03200, *(_DWORD *)(v19 + 296))];
      [(BWNodeInput *)v20 setFormatRequirements:v21];
      [(BWNodeInput *)v20 setPassthroughMode:0];
      [(id)v19 addInput:v20];
      *(void *)(v19 + 96) = v20;

      v22 = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:v19];
      v23 = objc_alloc_init(BWVideoFormatRequirements);
      -[BWVideoFormatRequirements setSupportedPixelFormats:](v23, "setSupportedPixelFormats:", -[BWDeskCamNode _supportedOutputPixelFormats](v19));
      [(BWNodeOutput *)v22 setFormatRequirements:v23];
      [(BWNodeOutput *)v22 setPassthroughMode:0];
      [(BWNodeOutputMediaConfiguration *)[(BWNodeOutput *)v22 primaryMediaConfiguration] setOwningNodeRetainedBufferCount:2];
      *(void *)(v19 + 104) = v22;
      [(id)v19 addOutput:v22];

      *(unsigned char *)(v19 + 284) = v13;
      if (v13)
      {
        v24 = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v19 index:1];
        v25 = objc_alloc_init(BWVideoFormatRequirements);
        [(BWVideoFormatRequirements *)v25 setSupportedPixelFormats:FigCapturePixelFormatsByAddingCompressedVariants(&unk_1EFB03200, *(_DWORD *)(v19 + 296))];
        [(BWNodeInput *)v24 setFormatRequirements:v25];
        [(BWNodeInput *)v24 setPassthroughMode:0];
        *(void *)(v19 + 112) = v24;
        [(id)v19 addInput:v24];

        v26 = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:v19];
        v27 = objc_alloc_init(BWVideoFormatRequirements);
        -[BWVideoFormatRequirements setSupportedPixelFormats:](v27, "setSupportedPixelFormats:", -[BWDeskCamNode _supportedOutputPixelFormats](v19));
        [(BWNodeOutput *)v26 setFormatRequirements:v27];
        [(BWNodeOutput *)v26 setPassthroughMode:0];
        [(BWNodeOutputMediaConfiguration *)[(BWNodeOutput *)v26 primaryMediaConfiguration] setProvidesPixelBufferPool:1];
        *(void *)(v19 + 120) = v26;
        [(id)v19 addOutput:v26];

        *(_OWORD *)(v19 + 184) = 0u;
        *(_OWORD *)(v19 + 200) = 0u;
        *(_OWORD *)(v19 + 216) = 0u;
        *(_OWORD *)(v19 + 232) = 0u;
        *(_DWORD *)(v19 + 248) = 0;
      }
      if (a8)
      {
        v28 = [[BWNodeInput alloc] initWithMediaType:1835365473 node:v19 index:2];
        *(void *)(v19 + 128) = v28;
        [(id)v19 addInput:v28];

        v29 = [[BWNodeOutput alloc] initWithMediaType:1836016234 node:v19];
        [(BWNodeOutput *)v29 setFormat:+[BWMetadataObjectFormat formatWithMetadataIdentifiers:a8]];
        *(void *)(v19 + 136) = v29;
        [(id)v19 addOutput:v29];
      }
      *(_DWORD *)(v19 + 280) = 5;
      *(void *)(v19 + 304) = [a10 copy];
      *(_DWORD *)(v19 + 312) = a11;
      id v30 = a12;
      *(void *)(v19 + 320) = v30;
      [v30 setOverheadCameraModeChangeDelegate:v19];
      -[BWDeskCamNode _updateOutputRequirements](v19);
      *(_WORD *)(v19 + 328) = 6;
      *(_WORD *)(v19 + 330) = 0;
    }
    else
    {
      return 0;
    }
  }
  return (BWDeskCamNode *)v19;
}

- (void)_supportedOutputPixelFormats
{
  if (!a1) {
    return 0;
  }
  v2 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithArray:", FigCapturePixelFormatsByAddingCompressedVariants(&unk_1EFB03200, *(_DWORD *)(a1 + 296)));
  int v3 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 96), "videoFormat"), "pixelFormat");
  if (v3)
  {
    char IsFullRange = FigCapturePixelFormatIsFullRange(v3);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __45__BWDeskCamNode__supportedOutputPixelFormats__block_invoke;
    v6[3] = &__block_descriptor_33_e35_B24__0__NSNumber_8__NSDictionary_16l;
    char v7 = IsFullRange;
    objc_msgSend(v2, "filterUsingPredicate:", objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithBlock:", v6));
  }
  return v2;
}

- (uint64_t)_updateOutputRequirements
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = objc_msgSend((id)objc_msgSend(*(id *)(result + 96), "videoFormat"), "colorSpaceProperties");
    if (v2)
    {
      v7[0] = [NSNumber numberWithInt:v2];
      uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
    }
    else
    {
      uint64_t v3 = 0;
    }
    objc_msgSend((id)objc_msgSend(*(id *)(v1 + 112), "videoFormat"), "colorSpaceProperties");
    v4 = -[BWDeskCamNode _supportedOutputPixelFormats](v1);
    v5 = (void *)[*(id *)(v1 + 104) formatRequirements];
    [v5 setWidth:*(int *)(v1 + 176)];
    [v5 setHeight:*(int *)(v1 + 180)];
    [v5 setSupportedColorSpaceProperties:v3];
    [v5 setSupportedPixelFormats:v4];
    v6 = (void *)[*(id *)(v1 + 120) formatRequirements];
    [v6 setWidth:*(int *)(v1 + 176)];
    [v6 setHeight:*(int *)(v1 + 180)];
    [v6 setSupportedColorSpaceProperties:v3];
    return [v6 setSupportedPixelFormats:v4];
  }
  return result;
}

- (void)dealloc
{
  stillImagePixelTransferSession = self->_stillImagePixelTransferSession;
  if (stillImagePixelTransferSession) {
    CFRelease(stillImagePixelTransferSession);
  }
  outputFormatDescription = self->_outputFormatDescription;
  if (outputFormatDescription) {
    CFRelease(outputFormatDescription);
  }
  if (self->_stillImageCaptureEnabled)
  {
    uint64_t v5 = 0;
    char v6 = 1;
    do
    {
      char v7 = v6;
      pixelBuffer = self->_stillCaptureQueue[v5].pixelBuffer;
      if (pixelBuffer) {
        CFRelease(pixelBuffer);
      }
      char v6 = 0;
      uint64_t v5 = 1;
    }
    while ((v7 & 1) != 0);
  }

  v9.receiver = self;
  v9.super_class = (Class)BWDeskCamNode;
  [(BWNode *)&v9 dealloc];
}

- (id)nodeType
{
  return @"Effect";
}

- (id)nodeSubType
{
  return @"DeskCam";
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  v3.receiver = self;
  v3.super_class = (Class)BWDeskCamNode;
  [(BWNode *)&v3 prepareForCurrentConfigurationToBecomeLive];
  -[BWDeskCamNode _initDeskCamSession]((uint64_t)self);
  [(BWDeviceOrientationMonitor *)self->_deviceOrientationMonitor start];
  if (self->_stillImageCaptureEnabled) {
    VTPixelTransferSessionCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], &self->_stillImagePixelTransferSession);
  }
}

- (uint64_t)_initDeskCamSession
{
  if (result)
  {
    uint64_t v1 = result;

    uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F58FA0]) initWithOutputDimensions:*(void *)(v1 + 176) portType:*(void *)(v1 + 304) deviceModelName:FigCaptureGetModelSpecificName()];
    *(void *)(v1 + 256) = v2;
    uint64_t v3 = *(unsigned int *)(v1 + 312);
    return [v2 setOutputType:v3];
  }
  return result;
}

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  if (self->_videoCaptureInput == a5)
  {
    uint64_t v5 = &OBJC_IVAR___BWDeskCamNode__videoCaptureOutput;
LABEL_8:
    objc_msgSend(*(id *)((char *)&self->super.super.isa + *v5), "makeConfiguredFormatLive", a3, a4);
    return;
  }
  if (self->_stillImageInput == a5)
  {
    uint64_t v5 = &OBJC_IVAR___BWDeskCamNode__stillImageOutput;
    goto LABEL_8;
  }
  if (self->_detectionMetadataInput == a5)
  {
    uint64_t v5 = &OBJC_IVAR___BWDeskCamNode__detectionMetadataOutput;
    goto LABEL_8;
  }
}

- (void)didReachEndOfDataForInput:(id)a3
{
  if (self->_videoCaptureInput == a3)
  {
    [(BWDeviceOrientationMonitor *)self->_deviceOrientationMonitor stop];
    [(BWNodeOutput *)self->_videoCaptureOutput markEndOfLiveOutput];

    self->_deskCamSession = 0;
  }
  else
  {
    if (self->_stillImageInput == a3)
    {
      uint64_t v4 = 120;
    }
    else
    {
      if (self->_detectionMetadataInput != a3) {
        return;
      }
      uint64_t v4 = 136;
    }
    uint64_t v5 = *(Class *)((char *)&self->super.super.isa + v4);
    [v5 markEndOfLiveOutput];
  }
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  uint64_t v4 = (os_unfair_lock_s *)MEMORY[0x1F4188790](self, a2, a3, a4);
  uint64_t v6 = v5;
  v8 = v7;
  uint64_t v9 = (uint64_t)v4;
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  v10 = v4 + 38;
  os_unfair_lock_lock(v4 + 38);
  CFTypeRef cf = 0;
  if (*(void *)(v9 + 112) == v6)
  {
    v11 = &OBJC_IVAR___BWDeskCamNode__stillImageOutput;
  }
  else if (*(void *)(v9 + 128) == v6)
  {
    v11 = &OBJC_IVAR___BWDeskCamNode__detectionMetadataOutput;
  }
  else
  {
    v11 = &OBJC_IVAR___BWDeskCamNode__videoCaptureOutput;
  }
  v12 = *(void **)(v9 + *v11);
  CFDictionaryRef v13 = (const __CFDictionary *)CMGetAttachment(v8, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(v13, (const void *)*MEMORY[0x1E4F530C0]);
  memset(&v49, 0, sizeof(v49));
  CMTimeMakeFromDictionary(&v49, Value);
  if (*(void *)(v9 + 96) != v6)
  {
    if (*(void *)(v9 + 112) == v6)
    {
      float64x2_t v51 = *(float64x2_t *)&v49.value;
      CMTimeEpoch epoch = v49.epoch;
      v15 = (__CVBuffer *)-[BWDeskCamNode _createMatchingPixelBufferFromSavedVideoBuffersWithTargetPts:](v9, (__CVBuffer **)&v51);
      if (!v15)
      {
        FigDebugAssert3();
        os_unfair_lock_unlock(v10);
        int CopyWithNewPixelBuffer = -12783;
        goto LABEL_38;
      }
    }
    else
    {
      v15 = 0;
    }
LABEL_31:
    if (*(void *)(v9 + 128) == v6)
    {
      int CopyWithNewPixelBuffer = 0;
      CFTypeRef v39 = v8;
    }
    else
    {
      int CopyWithNewPixelBuffer = BWCMSampleBufferCreateCopyWithNewPixelBuffer((opaqueCMSampleBuffer *)v8, v15, (CFTypeRef *)(v9 + 144), (CMSampleBufferRef *)&cf);
      if (!cf) {
        goto LABEL_36;
      }
      ImageBuffer = CMSampleBufferGetImageBuffer((CMSampleBufferRef)v8);
      CVBufferPropagateAttachments(ImageBuffer, v15);
      -[BWDeskCamNode _updateTransportLayerAttachmentsForOutputSampleBuffer:](v9, cf);
      CFTypeRef v39 = cf;
    }
    [v12 emitSampleBuffer:v39];
LABEL_36:
    os_unfair_lock_unlock(v10);
    if (!v15) {
      goto LABEL_38;
    }
    goto LABEL_37;
  }
  CFTypeRef v16 = CMGetAttachment(v8, @"OriginalCameraIntrinsicMatrix", 0);
  if (v16
    && (v17 = (void *)v16,
        (CFDictionaryRef v18 = (const __CFDictionary *)CMGetAttachment(v8, @"OriginalCameraIntrinsicMatrixReferenceDimensions", 0)) != 0))
  {
    CFDictionaryRef v19 = v18;
    uint64_t v20 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)v9, "output"), "primaryMediaProperties"), "livePixelBufferPool"), "newPixelBuffer");
    if (v20)
    {
      v15 = (__CVBuffer *)v20;
      lock = v10;
      v45 = v12;
      v21 = CMSampleBufferGetImageBuffer((CMSampleBufferRef)v8);
      size_t Width = CVPixelBufferGetWidth(v21);
      v43 = v21;
      size_t Height = CVPixelBufferGetHeight(v21);
      if (objc_msgSend((id)-[__CFDictionary objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", *MEMORY[0x1E4F54068]), "intValue") >= *(_DWORD *)(v9 + 280))uint64_t v42 = -[__CFDictionary objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", *MEMORY[0x1E4F53DC8]); {
      else
      }
        uint64_t v42 = 0;
      v25 = *(void **)(v9 + 168);
      int v26 = *(_DWORD *)(v9 + 156);
      int v27 = *(_DWORD *)(v9 + 160);
      float64x2_t v51 = *(float64x2_t *)&v49.value;
      CMTimeEpoch epoch = v49.epoch;
      id v28 = (id)FigCaptureCreateCalibrationDataDictionaryFromSampleBufferMetadataIncludeMaxRadius(v13, (long long *)&v51, v25, v26, v27, v17, v19, 0, 0, 1, 1);
      if (v28)
      {
        id v29 = v28;
        float v30 = (float)Width / (float)Height;
        if (objc_msgSend((id)-[__CFDictionary objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", *MEMORY[0x1E4F53FA0]), "unsignedIntValue"))
        {
          uint64_t v41 = 2143289344;
          v12 = v45;
        }
        else
        {
          bzero(&v51, 0x14A0uLL);
          float32x2_t v47 = 0;
          uint64_t v48 = 0;
          int MotionDataFromISP = FigMotionGetMotionDataFromISP(v13, &v51, 0, 110, (int *)&v48 + 1, &v47, 0, 0, 0);
          float32x2_t v32 = (float32x2_t)2143289344;
          if (MotionDataFromISP)
          {
            v12 = v45;
          }
          else
          {
            v12 = v45;
            if (SHIDWORD(v48) >= 1) {
              float32x2_t v32 = v47;
            }
          }
          uint64_t v41 = (uint64_t)v32;
        }
        uint64_t v33 = FigCaptureSensorIDFromSampleBufferMetadata(v13, *(void **)(v9 + 168));
        id v34 = objc_alloc(MEMORY[0x1E4F58FA8]);
        uint64_t v35 = [*(id *)(v9 + 264) mostRecentPortraitLandscapeOrientation];
        float64x2_t v51 = *(float64x2_t *)&v49.value;
        CMTimeEpoch epoch = v49.epoch;
        v36 = objc_msgSend(v34, "initWithDetectedObjectsInfo:cameraCalibrationData:cameraOrientation:timestamp:aspectRatio:sensorID:gravity:", v42, v29, v35, &v51, v33, COERCE_DOUBLE(__PAIR64__(HIDWORD(v49.value), LODWORD(v30))), *(double *)&v41);
        int CopyWithNewPixelBuffer = [*(id *)(v9 + 256) processPixelBuffer:v43 withMetadata:v36 outputPixelBuffer:v15];
        if (objc_msgSend((id)objc_msgSend(*(id *)(v9 + 320), "captureStream"), "hasFocus"))
        {
          ++*(_WORD *)(v9 + 330);
          [*(id *)(v9 + 256) focusPoint];
          if (-[BWDeskCamNode _updateFocusIfNeededWithFocusPoint:](v9, v37)) {
            *(_WORD *)(v9 + 330) = 0;
          }
        }

        if (!CopyWithNewPixelBuffer)
        {
          v10 = lock;
          if (*(unsigned char *)(v9 + 284))
          {
            float64x2_t v51 = *(float64x2_t *)&v49.value;
            CMTimeEpoch epoch = v49.epoch;
            -[BWDeskCamNode _savePixelBufferForStillImageCaptureRequests:withPts:](v9, v15, (long long *)&v51);
          }
          goto LABEL_31;
        }
        FigDebugAssert3();
      }
      else
      {
        FigDebugAssert3();
        int CopyWithNewPixelBuffer = -12784;
        v12 = v45;
      }
      os_unfair_lock_unlock(lock);
LABEL_37:
      CFRelease(v15);
      goto LABEL_38;
    }
    int CopyWithNewPixelBuffer = -12786;
  }
  else
  {
    FigDebugAssert3();
    int CopyWithNewPixelBuffer = 0;
  }
  os_unfair_lock_unlock(v10);
LABEL_38:
  if (cf) {
    CFRelease(cf);
  }
  if (CopyWithNewPixelBuffer)
  {
    CMSampleBufferGetPresentationTimeStamp(&v46, (CMSampleBufferRef)v8);
    id v40 = +[BWDroppedSample newDroppedSampleWithReason:0x1EFA68080 pts:&v46];
    [v12 emitDroppedSample:v40];
  }
}

- (uint64_t)_updateFocusIfNeededWithFocusPoint:(uint64_t)result
{
  if (result)
  {
    uint64_t v2 = result;
    result = objc_msgSend((id)objc_msgSend(*(id *)(result + 320), "captureStream"), "hasFocus");
    if (result)
    {
      if (*(unsigned __int16 *)(v2 + 330) == *(unsigned __int16 *)(v2 + 328))
      {
        if (*(float *)&a2 != -1.0 || *((float *)&a2 + 1) != -1.0) {
          objc_msgSend(*(id *)(v2 + 320), "setContinuousAutoFocusRect:isFocusRectInOverscanSpace:", 0, *(float *)&a2, *((float *)&a2 + 1), 0.0, 0.0);
        }
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

- (void)_savePixelBufferForStillImageCaptureRequests:(long long *)a3 withPts:
{
  if (a1)
  {
    uint64_t v6 = *(const void **)(a1 + 184 + 32 * *(unsigned int *)(a1 + 248));
    if (v6) {
      CFRelease(v6);
    }
    long long v10 = *a3;
    uint64_t v11 = *((void *)a3 + 2);
    if (cf) {
      CFRetain(cf);
    }
    uint64_t v7 = a1 + 184 + 32 * *(unsigned int *)(a1 + 248);
    *(void *)uint64_t v7 = cf;
    *(_OWORD *)(v7 + 8) = v10;
    *(void *)(v7 + 24) = v11;
    int v8 = *(_DWORD *)(a1 + 248);
    if (v8 == 1) {
      int v9 = 0;
    }
    else {
      int v9 = v8 + 1;
    }
    *(_DWORD *)(a1 + 248) = v9;
  }
}

- (void)_createMatchingPixelBufferFromSavedVideoBuffersWithTargetPts:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v3 = 0;
    uint64_t v4 = 0;
    uint64_t v5 = *a2;
    unint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
    char v7 = 1;
    while (1)
    {
      char v8 = v7;
      int v9 = (__CVBuffer **)(a1 + 184 + 32 * v3);
      uint64_t v11 = *v9;
      long long v10 = v9[1];
      uint64_t v12 = v5 - v10;
      if (v5 == v10) {
        break;
      }
      char v7 = 0;
      if (v12 < 0) {
        uint64_t v12 = -v12;
      }
      if (v6 > v12) {
        uint64_t v4 = v11;
      }
      if (v6 >= v12) {
        unint64_t v6 = v12;
      }
      uint64_t v3 = 1;
      if ((v8 & 1) == 0)
      {
        if (!v4) {
          return 0;
        }
        return -[BWDeskCamNode _newStillImageOutputPixelBufferFromVideoPixelBuffer:](a1, v4);
      }
    }
    uint64_t v4 = v11;
    if (v11) {
      return -[BWDeskCamNode _newStillImageOutputPixelBufferFromVideoPixelBuffer:](a1, v4);
    }
  }
  return 0;
}

- (uint64_t)_updateTransportLayerAttachmentsForOutputSampleBuffer:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    CFStringRef v4 = (const __CFString *)*MEMORY[0x1E4F531A8];
    uint64_t v5 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F531A8], 0);
    if (!v5)
    {
      uint64_t v5 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
      CMSetAttachment(target, v4, v5, 1u);
    }
    [*(id *)(v3 + 256) transformMatrix];
    objc_msgSend(v5, "setObject:forKeyedSubscript:", BWRowMajorArrayFrom3x3Matrix(v6, v7, v8), *MEMORY[0x1E4F556B8]);
    uint64_t v9 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(v3 + 256), "transformIsValid"));
    [v5 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F556B0]];
    uint64_t v10 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(v3 + 256), "isFrontFacingCamera"));
    [v5 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F556A0]];
    uint64_t v11 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(*(id *)(v3 + 256), "exifOrientation"));
    [v5 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F2FCA0]];
    uint64_t v12 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(*(id *)(v3 + 256), "outputType"));
    [v5 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F556A8]];
    result = [*(id *)(v3 + 256) autoZoomSupported];
    if (result)
    {
      CFDictionaryRef v13 = NSNumber;
      [*(id *)(v3 + 256) autoZoomValue];
      uint64_t v14 = objc_msgSend(v13, "numberWithFloat:");
      uint64_t v15 = *MEMORY[0x1E4F55698];
      return [v5 setObject:v14 forKeyedSubscript:v15];
    }
  }
  return result;
}

- (void)_newStillImageOutputPixelBufferFromVideoPixelBuffer:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  uint64_t v3 = 0;
  if (a2)
  {
    if (*(void *)(a1 + 288))
    {
      uint64_t v3 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 120), "primaryMediaProperties"), "livePixelBufferPool"), "newPixelBuffer");
      if (v3)
      {
        if (VTPixelTransferSessionTransferImage(*(VTPixelTransferSessionRef *)(a1 + 288), a2, (CVPixelBufferRef)v3))
        {
          CFRelease(v3);
          return 0;
        }
      }
    }
  }
  return v3;
}

BOOL __45__BWDeskCamNode__supportedOutputPixelFormats__block_invoke(uint64_t a1, void *a2)
{
  return *(unsigned __int8 *)(a1 + 32) == FigCapturePixelFormatIsFullRange([a2 intValue]);
}

- (void)didChangeOverheadCameraMode:(int)a3
{
  if (self->_overheadCameraMode != a3)
  {
    self->_overheadCameraMode = a3;
    -[DeskCamSession setOutputType:](self->_deskCamSession, "setOutputType:");
  }
}

- (BWNodeInput)videoCaptureInput
{
  return self->_videoCaptureInput;
}

- (BWNodeOutput)videoCaptureOutput
{
  return self->_videoCaptureOutput;
}

- (BWNodeInput)stillImageInput
{
  return self->_stillImageInput;
}

- (BWNodeOutput)stillImageOutput
{
  return self->_stillImageOutput;
}

- (BWNodeInput)detectionMetadataInput
{
  return self->_detectionMetadataInput;
}

- (BWNodeOutput)detectionMetadataOutput
{
  return self->_detectionMetadataOutput;
}

- (NSString)clientApplicationID
{
  return self->_clientApplicationID;
}

- (void)setClientApplicationID:(id)a3
{
}

@end