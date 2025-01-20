@interface BWHDRNode
+ (void)initialize;
- (BOOL)_receivedExpectedNumberOfInputFramesOrErrors;
- (BOOL)alwaysRequestsPreBracketedEV0;
- (BOOL)attachesInputBracketToOutputSampleBuffer;
- (BOOL)supportsStereoFusionCaptures;
- (BWHDRNode)initWithClientPID:(int)a3 sensorIDDictionary:(id)a4;
- (id)_initWithClientPID:(int)a3 sensorIDDictionary:(id)a4 sbpCreationFunction:(void *)a5;
- (id)nodeSubType;
- (id)nodeType;
- (uint64_t)_configureCaptureRequestStateWithStillImageCaptureSettings:(uint64_t)result;
- (uint64_t)_setupSampleBufferProcessor;
- (void)_clearCaptureRequestState;
- (void)_emitNodeErrorToReportFailedOutputFrame;
- (void)_emitNodeErrorsIfNecessary;
- (void)_hdrProcessorOutputReady:(CMAttachmentBearerRef)target sampleBuffer:;
- (void)dealloc;
- (void)didSelectFormat:(id)a3 forInput:(id)a4;
- (void)handleNodeError:(id)a3 forInput:(id)a4;
- (void)prepareForCurrentConfigurationToBecomeLive;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
- (void)setAlwaysRequestsPreBracketedEV0:(BOOL)a3;
- (void)setSupportsStereoFusionCaptures:(BOOL)a3;
@end

@implementation BWHDRNode

+ (void)initialize
{
}

- (BWHDRNode)initWithClientPID:(int)a3 sensorIDDictionary:(id)a4
{
  return (BWHDRNode *)[(BWHDRNode *)self _initWithClientPID:*(void *)&a3 sensorIDDictionary:a4 sbpCreationFunction:hdrn_createSampleBufferProcessor];
}

- (void)dealloc
{
  sampleBufferProcessor = self->_sampleBufferProcessor;
  if (sampleBufferProcessor)
  {
    uint64_t v4 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v4) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = 0;
    }
    v6 = *(void (**)(OpaqueFigSampleBufferProcessor *, void, void))(v5 + 8);
    if (v6) {
      v6(sampleBufferProcessor, 0, 0);
    }
    uint64_t FigBaseObject = FigSampleBufferProcessorGetFigBaseObject();
    if (FigBaseObject)
    {
      uint64_t v8 = FigBaseObject;
      uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 8);
      uint64_t v10 = v9 ? v9 : 0;
      v11 = *(void (**)(uint64_t))(v10 + 24);
      if (v11) {
        v11(v8);
      }
    }
    v12 = self->_sampleBufferProcessor;
    if (v12)
    {
      CFRelease(v12);
      self->_sampleBufferProcessor = 0;
    }
  }
  -[BWHDRNode _clearCaptureRequestState]((uint64_t)self);

  telephotoHDREV0DisparityFormatDescription = self->_telephotoHDREV0DisparityFormatDescription;
  if (telephotoHDREV0DisparityFormatDescription) {
    CFRelease(telephotoHDREV0DisparityFormatDescription);
  }
  telephotoHDREV0DisparityCopySession = self->_telephotoHDREV0DisparityCopySession;
  if (telephotoHDREV0DisparityCopySession) {
    CFRelease(telephotoHDREV0DisparityCopySession);
  }
  v15.receiver = self;
  v15.super_class = (Class)BWHDRNode;
  [(BWNode *)&v15 dealloc];
}

- (void)_clearCaptureRequestState
{
  if (a1)
  {

    *(void *)(a1 + 144) = 0;
    if (*(int *)(a1 + 128) >= 1)
    {
      uint64_t v2 = 0;
      do
      {
        v3 = *(const void **)(a1 + 152 + 8 * v2);
        if (v3)
        {
          CFRelease(v3);
          *(void *)(a1 + 152 + 8 * v2) = 0;
        }
        ++v2;
      }
      while (v2 < *(int *)(a1 + 128));
    }
    *(unsigned char *)(a1 + 176) = 0;
    *(unsigned char *)(a1 + 177) = 0;

    *(void *)(a1 + 184) = 0;
    *(_DWORD *)(a1 + 192) = 0;
  }
}

- (id)_initWithClientPID:(int)a3 sensorIDDictionary:(id)a4 sbpCreationFunction:(void *)a5
{
  v16.receiver = self;
  v16.super_class = (Class)BWHDRNode;
  uint64_t v8 = [(BWNode *)&v16 init];
  uint64_t v9 = v8;
  if (v8)
  {
    v8->_clientPID = a3;
    v8->_sensorIDDictionary = (NSDictionary *)a4;
    uint64_t v10 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", &unk_1EFB05818, &unk_1EFB05828, &unk_1EFB05838, 0);
    v9->_exposureValues = v10;
    v9->_bracketCount = [(NSArray *)v10 count];
    v9->_createSampleBufferProcessorFunction = a5;
    v11 = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v9];
    [(BWNodeInput *)v11 setRetainedBufferCount:[(NSArray *)v9->_exposureValues count]];
    v12 = objc_alloc_init(BWVideoFormatRequirements);
    [(BWVideoFormatRequirements *)v12 setSupportedPixelFormats:&unk_1EFB04190];
    [(BWNodeInput *)v11 setFormatRequirements:v12];

    [(BWNode *)v9 addInput:v11];
    v13 = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:v9];
    v14 = objc_alloc_init(BWVideoFormatRequirements);
    [(BWVideoFormatRequirements *)v14 setSupportedPixelFormats:&unk_1EFB041A8];
    [(BWNodeOutput *)v13 setProvidesPixelBufferPool:0];
    [(BWNodeOutput *)v13 setFormatRequirements:v14];

    [(BWNode *)v9 addOutput:v13];
  }
  return v9;
}

- (id)nodeType
{
  return @"Effect";
}

- (id)nodeSubType
{
  return @"HDRProcessor";
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v6 = objc_alloc_init(BWVideoFormatRequirements);
  v9[0] = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a3, "pixelFormat"));
  -[BWVideoFormatRequirements setSupportedPixelFormats:](v6, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1]);
  -[BWVideoFormatRequirements setWidth:](v6, "setWidth:", [a3 width]);
  -[BWVideoFormatRequirements setHeight:](v6, "setHeight:", [a3 height]);
  [(BWVideoFormatRequirements *)v6 setSupportedCacheModes:+[BWVideoFormatRequirements cacheModesForOptimizedHWAccess]];
  if ([a3 colorSpaceProperties])
  {
    uint64_t v8 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(a3, "colorSpaceProperties"));
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v8 count:1];
  }
  else
  {
    uint64_t v7 = 0;
  }
  [(BWVideoFormatRequirements *)v6 setSupportedColorSpaceProperties:v7];
  [(BWNodeOutput *)self->super._output setFormatRequirements:v6];
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  v3.receiver = self;
  v3.super_class = (Class)BWHDRNode;
  [(BWNode *)&v3 prepareForCurrentConfigurationToBecomeLive];
  if (!self->_sampleBufferProcessor && -[BWHDRNode _setupSampleBufferProcessor]((uint64_t)self))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  if (self->_supportsStereoFusionCaptures && !self->_stereoFusionPixelConverter) {
    self->_stereoFusionPixelConverter = objc_alloc_init(FigCapturePixelConverter);
  }
}

- (uint64_t)_setupSampleBufferProcessor
{
  uint64_t v1 = a1;
  v17[1] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v15 = 0;
    uint64_t v2 = *(void *)(a1 + 112);
    if (v2)
    {
      uint64_t v16 = *MEMORY[0x1E4F53598];
      v17[0] = v2;
      uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    }
    else
    {
      uint64_t v3 = 0;
    }
    uint64_t v4 = *(void (**)(void, __CFString *, uint64_t, uint64_t *))(v1 + 96);
    if (!v4)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      return 0;
    }
    v4(*MEMORY[0x1E4F1CF80], @"HDR", v3, &v15);
    if (*(_DWORD *)(v1 + 104))
    {
      uint64_t v5 = objc_msgSend(NSNumber, "numberWithInt:");
      uint64_t FigBaseObject = FigSampleBufferProcessorGetFigBaseObject();
      uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 8);
      uint64_t v8 = v7 ? v7 : 0;
      uint64_t v9 = *(void (**)(uint64_t, void, uint64_t))(v8 + 56);
      if (v9) {
        v9(FigBaseObject, *MEMORY[0x1E4F34698], v5);
      }
    }
    uint64_t v10 = v15;
    *(void *)(v1 + 120) = v15;
    uint64_t v11 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v11) {
      uint64_t v12 = v11;
    }
    else {
      uint64_t v12 = 0;
    }
    v13 = *(uint64_t (**)(uint64_t, uint64_t (*)(), uint64_t))(v12 + 8);
    if (!v13)
    {
      uint64_t v1 = 4294954514;
LABEL_19:
      fig_log_get_emitter();
      FigDebugAssert3();
      return v1;
    }
    uint64_t v1 = v13(v10, hdrn_processorOutputReadyCallback, v1);
    if (v1) {
      goto LABEL_19;
    }
  }
  return v1;
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  CMSampleBufferRef v63 = 0;
  if (!a3) {
    return;
  }
  if (!self->_sampleBufferProcessor) {
    goto LABEL_78;
  }
  CFTypeRef v7 = CMGetAttachment(a3, @"StillSettings", 0);
  if (!v7
    || (uint64_t v8 = (void *)v7,
        CFStringRef v9 = (const __CFString *)*MEMORY[0x1E4F53070],
        (CFTypeRef v10 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0)) == 0))
  {
LABEL_77:
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_78;
  }
  uint64_t v11 = (void *)v10;
  if (!self->_currentStillImageSettings)
  {
    if (objc_msgSend((id)objc_msgSend(v8, "captureSettings"), "captureType") != 3)
    {
      output = self->super._output;
      [(BWNodeOutput *)output emitSampleBuffer:a3];
      return;
    }
    -[BWHDRNode _configureCaptureRequestStateWithStillImageCaptureSettings:]((uint64_t)self, v8);
  }
  int v12 = objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E4F53D38]), "intValue");
  int v13 = objc_msgSend((id)objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E4F54138]), "BOOLValue");
  uint64_t v14 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F54128]];
  if (!v13)
  {
    int v15 = v12 - 1;
    if (v12 < 1)
    {
LABEL_78:
      int v19 = 0;
      goto LABEL_79;
    }
    v60 = (void *)v14;
    if (v12 > self->_bracketCount)
    {
      fig_log_get_emitter();
      uint64_t v58 = v4;
      LODWORD(sampleTimingArray) = 0;
      FigDebugAssert3();
    }
    if (!self->_supportsStereoFusionCaptures)
    {
      v20 = self->_pendingBracketBuffers[v15];
      self->_pendingBracketBuffers[v15] = a3;
      CFRetain(a3);
      if (v20) {
        CFRelease(v20);
      }
      BOOL v21 = v12 == self->_bracketCount;
LABEL_35:
      v25 = objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E4F53450], sampleTimingArray);
      if (v25)
      {
        [v25 doubleValue];
        if (v26 == 0.0
          && (-[BWStillImageCaptureSettings captureFlags](-[BWStillImageSettings captureSettings](self->_currentStillImageSettings, "captureSettings"), "captureFlags") & 0x800) != 0&& [v60 isEqualToString:*MEMORY[0x1E4F52DF0]])
        {
          telephotoHDREV0DisparityBufferPool = self->_telephotoHDREV0DisparityBufferPool;
          if (!telephotoHDREV0DisparityBufferPool)
          {
            self->_telephotoHDREV0DisparityBufferPool = [[BWPixelBufferPool alloc] initWithVideoFormat:[(BWNodeOutput *)self->super._output videoFormat] capacity:1 name:@"HDR EV0 Disparity Pool"];
            VTPixelTransferSessionCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], &self->_telephotoHDREV0DisparityCopySession);
            telephotoHDREV0DisparityBufferPool = self->_telephotoHDREV0DisparityBufferPool;
          }
          uint64_t v28 = [(BWPixelBufferPool *)telephotoHDREV0DisparityBufferPool newPixelBuffer];
          cf.origin.x = 0.0;
          if (v28)
          {
            v29 = (__CVBuffer *)v28;
            telephotoHDREV0DisparityCopySession = self->_telephotoHDREV0DisparityCopySession;
            ImageBuffer = CMSampleBufferGetImageBuffer(a3);
            uint64_t v32 = VTPixelTransferSessionTransferImage(telephotoHDREV0DisparityCopySession, ImageBuffer, v29);
            if (v32)
            {
              id v33 = +[BWNodeError newError:v32 sourceNode:self stillImageSettings:self->_currentStillImageSettings metadata:v11];
              [(BWNodeOutput *)self->super._output emitNodeError:v33];
            }
            else
            {
              BWCMSampleBufferCreateCopyWithNewPixelBuffer(a3, v29, (CFTypeRef *)&self->_telephotoHDREV0DisparityFormatDescription, (CMSampleBufferRef *)&cf);
              [(BWNodeOutput *)self->super._output emitSampleBuffer:*(void *)&cf.origin.x];
            }
            CFRelease(v29);
            if (*(void *)&cf.origin.x) {
              CFRelease(*(CFTypeRef *)&cf.origin.x);
            }
          }
          else
          {
            id v52 = +[BWNodeError newError:4294954510 sourceNode:self stillImageSettings:self->_currentStillImageSettings metadata:v11];
            [(BWNodeOutput *)self->super._output emitNodeError:v52];
          }
        }
      }
      if (!v21) {
        goto LABEL_78;
      }
      uint64_t bracketCount = self->_bracketCount;
      if ((int)bracketCount < 1)
      {
        int v54 = 0;
      }
      else
      {
        int v54 = 0;
        pendingBracketBuffers = self->_pendingBracketBuffers;
        do
        {
          if (!*pendingBracketBuffers++) {
            ++v54;
          }
          --bracketCount;
        }
        while (bracketCount);
      }
      if (self->_preBracketedFrameExpected && !self->_preBracketedFrameReceived)
      {
        if (!self->_supportsStereoFusionCaptures) {
          goto LABEL_76;
        }
        -[BWHDRNode _emitNodeErrorToReportFailedOutputFrame]((uint64_t)self);
        ++self->_emittedFrameOrErrorCount;
      }
      if (!v54)
      {
        if (objc_msgSend((id)CMGetAttachment(self->_pendingBracketBuffers[1], @"StereoFusionFailed", 0), "BOOLValue"))
        {
          CMRemoveAttachment(self->_pendingBracketBuffers[1], @"StereoFusionFailed");
          -[BWHDRNode _hdrProcessorOutputReady:sampleBuffer:]((uint64_t)self, -12780, 0);
          goto LABEL_75;
        }
        if (!CMSampleBufferCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 1u, 0, 0, 0, 0, 0, 0, 0, 0, &v63))
        {
          CMSetAttachment(v63, (CFStringRef)*MEMORY[0x1E4F55950], self->_pendingBracketBuffers[2], 0);
          CMSetAttachment(v63, (CFStringRef)*MEMORY[0x1E4F55960], self->_pendingBracketBuffers[1], 0);
          CMSetAttachment(v63, (CFStringRef)*MEMORY[0x1E4F55958], self->_pendingBracketBuffers[0], 0);
          if (!FigSampleBufferProcessorProcessSampleBuffer((uint64_t)self->_sampleBufferProcessor, (uint64_t)v63))goto LABEL_75; {
        }
          }
      }
LABEL_76:
      fig_log_get_emitter();
      FigDebugAssert3();
LABEL_75:
      int v19 = 1;
      goto LABEL_79;
    }
    if (([(BWStillImageCaptureSettings *)[(BWStillImageSettings *)self->_currentStillImageSettings captureSettings] captureFlags] & 0x400) != 0)
    {
      CGSize v22 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
      cf.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
      cf.size = v22;
      if ([v60 isEqualToString:*MEMORY[0x1E4F52DD8]])
      {
        uint64_t v23 = *MEMORY[0x1E4F53260];
        if (FigCFDictionaryGetCGRectIfPresent()) {
          [v11 removeObjectForKey:v23];
        }
      }
      if (v12 != 2 && !CGRectIsNull(cf))
      {
        FormatDescription = CMSampleBufferGetFormatDescription(a3);
        CMVideoDimensions Dimensions = CMVideoFormatDescriptionGetDimensions(FormatDescription);
        [(FigCapturePixelConverter *)self->_stereoFusionPixelConverter updateOutputPixelFormat:[(BWVideoFormat *)[(BWNodeInput *)self->super._input videoFormat] pixelFormat] dimensions:Dimensions poolCapacity:2 colorSpaceProperties:[(BWVideoFormat *)[(BWNodeInput *)self->super._input videoFormat] colorSpaceProperties] alwaysUseHardwareForConversion:1];
        CMAttachmentBearerRef target = 0;
        -[FigCapturePixelConverter convertSampleBuffer:cropRect:outputSampleBuffer:](self->_stereoFusionPixelConverter, "convertSampleBuffer:cropRect:outputSampleBuffer:", a3, &target, cf.origin.x * (double)Dimensions.width, cf.origin.y * (double)Dimensions.height, cf.size.width * (double)Dimensions.width, cf.size.height * (double)Dimensions.height);
        Dimensions.width = [(FigCaptureStillImageSettings *)[(BWStillImageSettings *)self->_currentStillImageSettings requestedSettings] outputWidth];
        unsigned int v36 = [(FigCaptureStillImageSettings *)[(BWStillImageSettings *)self->_currentStillImageSettings requestedSettings] outputHeight];
        if (Dimensions.width && v36)
        {
          CMVideoDimensions Dimensions = (CMVideoDimensions)Dimensions.width;
          unint64_t v37 = v36;
        }
        else
        {
          CMVideoDimensions Dimensions = [(BWVideoFormat *)[(BWNodeOutput *)self->super._output videoFormat] width];
          unint64_t v37 = [(BWVideoFormat *)[(BWNodeOutput *)self->super._output videoFormat] height];
        }
        v59 = (void *)CMGetAttachment(target, v9, 0);
        uint64_t v38 = [(BWVideoFormat *)[(BWNodeInput *)self->super._input videoFormat] width];
        uint64_t v39 = [(BWVideoFormat *)[(BWNodeInput *)self->super._input videoFormat] height];
        FigCaptureMetadataUtilitiesComputeDenormalizedStillImageCropRect(v38, v39, cf.origin.x, cf.origin.y, cf.size.width, cf.size.height, (double)*(unint64_t *)&Dimensions / (double)v37);
        CGFloat v41 = v40;
        CGFloat v43 = v42;
        CGFloat v45 = v44;
        CGFloat v47 = v46;
        LODWORD(v38) = [(BWVideoFormat *)[(BWNodeInput *)self->super._input videoFormat] width];
        unsigned int v48 = [(BWVideoFormat *)[(BWNodeInput *)self->super._input videoFormat] height];
        FigCaptureMetadataUtilitiesUpdateMetadataForStillImageCrop(v59, v38 | ((unint64_t)v48 << 32), Dimensions.width | ((unint64_t)v37 << 32), v41, v43, v45, v47, *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
        FigCaptureMetadataUtilitiesPreventFurtherCropping(v59, v49);
        v50 = self->_pendingBracketBuffers[v15];
        CMAttachmentBearerRef v51 = target;
        self->_pendingBracketBuffers[v15] = (opaqueCMSampleBuffer *)target;
        if (v51) {
          CFRetain(v51);
        }
        if (v50) {
          CFRelease(v50);
        }
        if (target) {
          CFRelease(target);
        }
        goto LABEL_34;
      }
      uint64_t v16 = self->_pendingBracketBuffers;
    }
    else
    {
      uint64_t v16 = self->_pendingBracketBuffers;
    }
    v24 = v16[v15];
    v16[v15] = a3;
    CFRetain(a3);
    if (v24) {
      CFRelease(v24);
    }
LABEL_34:
    BOOL v21 = -[BWHDRNode _receivedExpectedNumberOfInputFramesOrErrors]((BOOL)self);
    goto LABEL_35;
  }
  if (self->_alwaysRequestsPreBracketedEV0)
  {
    if (!self->_preBracketedFrameExpected) {
      goto LABEL_78;
    }
    goto LABEL_22;
  }
  if (!self->_preBracketedFrameExpected) {
    goto LABEL_77;
  }
LABEL_22:
  self->_preBracketedFrameReceived = 1;
  [v11 setObject:&unk_1EFB010B8 forKeyedSubscript:*MEMORY[0x1E4F53F30]];
  v18 = (const void *)objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend((id)CMGetAttachment(a3, @"StillImageProcessingFlags", 0), "unsignedIntValue") | 1);
  CMSetAttachment(a3, @"StillImageProcessingFlags", v18, 1u);
  [(BWNodeOutput *)self->super._output emitSampleBuffer:a3];
  int v19 = 0;
  ++self->_emittedFrameOrErrorCount;
LABEL_79:
  if (v63)
  {
    CFRelease(v63);
    if ((v19 & 1) == 0) {
      return;
    }
  }
  else if (!v19)
  {
    return;
  }
  if (self->_supportsStereoFusionCaptures) {
    -[BWHDRNode _emitNodeErrorsIfNecessary]((uint64_t)self);
  }
  -[BWHDRNode _clearCaptureRequestState]((uint64_t)self);
}

- (uint64_t)_configureCaptureRequestStateWithStillImageCaptureSettings:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    *(void *)(result + 144) = a2;
    result = objc_msgSend((id)objc_msgSend(a2, "captureSettings"), "deliverOriginalImage");
    *(unsigned char *)(v3 + 176) = result;
  }
  return result;
}

- (BOOL)_receivedExpectedNumberOfInputFramesOrErrors
{
  if (result)
  {
    uint64_t v1 = *(unsigned int *)(result + 128);
    if ((int)v1 < 1)
    {
      int v2 = 0;
    }
    else
    {
      int v2 = 0;
      uint64_t v3 = (void *)(result + 152);
      do
      {
        if (*v3++) {
          ++v2;
        }
        --v1;
      }
      while (v1);
    }
    int v5 = v2 + *(unsigned __int8 *)(result + 177);
    return v5 + [*(id *)(result + 184) count] >= *(_DWORD *)(result + 128)
                                                                            + *(unsigned __int8 *)(result + 176);
  }
  return result;
}

- (void)_emitNodeErrorToReportFailedOutputFrame
{
  if (a1)
  {
    if ((unint64_t)[*(id *)(a1 + 184) count] < 2)
    {
      id v2 = +[BWNodeError newError:4294954516 sourceNode:a1 stillImageSettings:*(void *)(a1 + 144) metadata:0];
    }
    else
    {
      id v2 = (id)[*(id *)(a1 + 184) objectAtIndex:0];
      [*(id *)(a1 + 184) removeObjectAtIndex:0];
    }
    [*(id *)(a1 + 16) emitNodeError:v2];
  }
}

- (void)_hdrProcessorOutputReady:(CMAttachmentBearerRef)target sampleBuffer:
{
  if (a1)
  {
    CFTypeRef v6 = CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F55950], 0);
    if (a2)
    {
      CFTypeRef v7 = *(const void **)(a1 + 160);
    }
    else
    {
      CFTypeRef v7 = v6;
      if (!v6)
      {
        fig_log_get_emitter();
        LODWORD(v13) = 0;
        FigDebugAssert3();
        id v12 = +[BWNodeError newError:sourceNode:stillImageSettings:metadata:](BWNodeError, "newError:sourceNode:stillImageSettings:metadata:", 4294954510, a1, *(void *)(a1 + 144), 0, v13, v3);
        [*(id *)(a1 + 16) emitNodeError:v12];

        goto LABEL_10;
      }
      uint64_t v8 = (void *)CMGetAttachment(v6, (CFStringRef)*MEMORY[0x1E4F53070], 0);
      if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 144), "requestedSettings"), "providesOriginalImage")) {
        uint64_t v9 = 3;
      }
      else {
        uint64_t v9 = 2;
      }
      uint64_t v10 = [NSNumber numberWithShort:v9];
      [v8 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F53F30]];
      uint64_t v11 = (const void *)objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend((id)CMGetAttachment(v7, @"StillImageProcessingFlags", 0), "unsignedIntValue") | 2);
      CMSetAttachment(v7, @"StillImageProcessingFlags", v11, 1u);
      CMSetAttachment(v7, @"HasUnreliableBracketingMetadata", MEMORY[0x1E4F1CC38], 1u);
      CMRemoveAttachment(v7, (CFStringRef)*MEMORY[0x1E4F530E0]);
    }
    [*(id *)(a1 + 16) emitSampleBuffer:v7];
LABEL_10:
    ++*(_DWORD *)(a1 + 192);
  }
}

- (void)_emitNodeErrorsIfNecessary
{
  if (a1)
  {
    unsigned int v2 = *(unsigned __int8 *)(a1 + 176) + 1 - *(_DWORD *)(a1 + 192);
    if (v2)
    {
      if (v2 <= 1) {
        int v3 = 1;
      }
      else {
        int v3 = *(unsigned __int8 *)(a1 + 176) + 1 - *(_DWORD *)(a1 + 192);
      }
      do
      {
        -[BWHDRNode _emitNodeErrorToReportFailedOutputFrame](a1);
        --v3;
      }
      while (v3);
    }
  }
}

- (void)handleNodeError:(id)a3 forInput:(id)a4
{
  BOOL supportsStereoFusionCaptures = self->_supportsStereoFusionCaptures;
  currentStillImageSettings = self->_currentStillImageSettings;
  if (supportsStereoFusionCaptures)
  {
    if (!currentStillImageSettings) {
      -[BWHDRNode _configureCaptureRequestStateWithStillImageCaptureSettings:]((uint64_t)self, objc_msgSend(a3, "stillImageSettings", a3, a4));
    }
    receivedNodeErrors = self->_receivedNodeErrors;
    if (!receivedNodeErrors)
    {
      receivedNodeErrors = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      self->_receivedNodeErrors = receivedNodeErrors;
    }
    -[NSMutableArray addObject:](receivedNodeErrors, "addObject:", a3, a4);
    if (-[BWHDRNode _receivedExpectedNumberOfInputFramesOrErrors]((BOOL)self))
    {
      -[BWHDRNode _emitNodeErrorsIfNecessary]((uint64_t)self);
      -[BWHDRNode _clearCaptureRequestState]((uint64_t)self);
    }
  }
  else
  {
    if (currentStillImageSettings)
    {
      uint64_t v9 = [(BWStillImageSettings *)currentStillImageSettings requestedSettings];
      if (v9 == objc_msgSend((id)objc_msgSend(a3, "stillImageSettings"), "requestedSettings")) {
        -[BWHDRNode _clearCaptureRequestState]((uint64_t)self);
      }
    }
    output = self->super._output;
    -[BWNodeOutput emitNodeError:](output, "emitNodeError:", a3, a4);
  }
}

- (BOOL)attachesInputBracketToOutputSampleBuffer
{
  return 0;
}

- (void)setAlwaysRequestsPreBracketedEV0:(BOOL)a3
{
  self->_alwaysRequestsPreBracketedEV0 = a3;
}

- (BOOL)alwaysRequestsPreBracketedEV0
{
  return self->_alwaysRequestsPreBracketedEV0;
}

- (void)setSupportsStereoFusionCaptures:(BOOL)a3
{
  self->_BOOL supportsStereoFusionCaptures = a3;
}

- (BOOL)supportsStereoFusionCaptures
{
  return self->_supportsStereoFusionCaptures;
}

@end