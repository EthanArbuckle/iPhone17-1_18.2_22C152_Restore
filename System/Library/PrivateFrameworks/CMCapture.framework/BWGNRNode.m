@interface BWGNRNode
+ (void)initialize;
- (BOOL)_isBravoDepthDataCapture;
- (BOOL)_isBravoHDRDepthDataCapture;
- (BOOL)allowedToModifyInputBuffers;
- (BOOL)attachesInputBracketToOutputSampleBuffer;
- (BOOL)usesHDRPreBracketFrameForErrorRecoveryDownstream;
- (BWGNRNode)initWithSISEnabled:(BOOL)a3 OISEnabled:(BOOL)a4 LTMHDREnabled:(BOOL)a5 processingLTMHDRFusion:(BOOL)a6 portType:(id)a7 sensorID:(id)a8 sensorIDDictionary:(id)a9 telephotoPortType:(id)a10 telephotoSensorID:(id)a11 telephotoSensorIDDictionary:(id)a12;
- (id)_copyAndZoomSampleBuffer:(CGFloat)a3 usingNormalizedZoomRectangle:(CGFloat)a4;
- (id)_initWithSISEnabled:(BOOL)a3 OISEnabled:(BOOL)a4 LTMHDREnabled:(BOOL)a5 processingLTMHDRFusion:(BOOL)a6 portType:(id)a7 sensorID:(id)a8 sensorIDDictionary:(id)a9 telephotoPortType:(id)a10 telephotoSensorID:(id)a11 telephotoSensorIDDictionary:(id)a12 sbpCreationFunction:(void *)a13 treatSoftErrorsAsHardErrors:(BOOL)a14;
- (id)nodeSubType;
- (id)nodeType;
- (uint64_t)_gnrProcessingTypeWithMetadataDictionary:(uint64_t)result;
- (uint64_t)_isBravoTelephotoHDRDepthDataCapture;
- (uint64_t)_sampleBufferProcessorOutputReady:(CMAttachmentBearerRef)target sampleBuffer:;
- (uint64_t)_setExpectedFrameCountForPortType:(uint64_t)result;
- (uint64_t)_setPropertyOnSampleBufferProcessorWithKey:(uint64_t)a3 value:;
- (uint64_t)_setReferenceFrameBracketedCaptureSequenceNumberOnSampleBufferProcessor:(uint64_t)result;
- (uint64_t)_setupSampleBufferProcessor;
- (unint64_t)_worstCaseFrameRetainCount;
- (void)_clearCaptureRequestState;
- (void)_detectMissingPreBracketedFrameAndEmitBWNodeError;
- (void)_tuningDictionaryWithOnlyGNRParameters;
- (void)dealloc;
- (void)didSelectFormat:(id)a3 forInput:(id)a4;
- (void)handleNodeError:(id)a3 forInput:(id)a4;
- (void)handleStillImageReferenceFrameBracketedCaptureSequenceNumber:(int)a3 forInput:(id)a4;
- (void)prepareForCurrentConfigurationToBecomeLive;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
- (void)sbpOptionsDictionary;
- (void)setAllowedToModifyInputBuffers:(BOOL)a3;
- (void)setUsesHDRPreBracketFrameForErrorRecoveryDownstream:(BOOL)a3;
@end

@implementation BWGNRNode

+ (void)initialize
{
}

- (BWGNRNode)initWithSISEnabled:(BOOL)a3 OISEnabled:(BOOL)a4 LTMHDREnabled:(BOOL)a5 processingLTMHDRFusion:(BOOL)a6 portType:(id)a7 sensorID:(id)a8 sensorIDDictionary:(id)a9 telephotoPortType:(id)a10 telephotoSensorID:(id)a11 telephotoSensorIDDictionary:(id)a12
{
  LOBYTE(v13) = 0;
  return (BWGNRNode *)[(BWGNRNode *)self _initWithSISEnabled:a3 OISEnabled:a4 LTMHDREnabled:a5 processingLTMHDRFusion:a6 portType:a7 sensorID:a8 sensorIDDictionary:a9 telephotoPortType:a10 telephotoSensorID:a11 telephotoSensorIDDictionary:a12 sbpCreationFunction:gnrn_createSampleBufferProcessorFunction treatSoftErrorsAsHardErrors:v13];
}

- (id)_initWithSISEnabled:(BOOL)a3 OISEnabled:(BOOL)a4 LTMHDREnabled:(BOOL)a5 processingLTMHDRFusion:(BOOL)a6 portType:(id)a7 sensorID:(id)a8 sensorIDDictionary:(id)a9 telephotoPortType:(id)a10 telephotoSensorID:(id)a11 telephotoSensorIDDictionary:(id)a12 sbpCreationFunction:(void *)a13 treatSoftErrorsAsHardErrors:(BOOL)a14
{
  v27.receiver = self;
  v27.super_class = (Class)BWGNRNode;
  v20 = [(BWNode *)&v27 init];
  v21 = v20;
  if (v20)
  {
    v20->_sisEnabled = a3;
    v20->_oisEnabled = a4;
    v20->_hdrEnabled = a5;
    v20->_processingLTMHDRFusion = a6;
    v20->_previouslyCompletedFusionSettingsID = -1;
    v20->_receivedReferenceFrameBracketedCaptureSequenceNumber = -1;
    v20->_gnrFusionReferenceFrameBracketedCaptureSequenceNumber = -1;
    v20->_processingHDREV0BracketFrame = 0;
    v20->_hdrEV0BracketCaptureIdentifier = -1;
    v20->_hdrDisparityBracketedCaptureSequenceNumber = -1;
    v20->_portType = (NSString *)a7;
    v21->_sensorID = (NSString *)a8;
    v21->_sensorIDDictionary = (NSDictionary *)a9;
    v21->_telephotoPortType = (NSString *)a10;
    v21->_telephotoSensorID = (NSString *)a11;
    v21->_telephotoSensorIDDictionary = (NSDictionary *)a12;
    v21->_createSampleBufferProcessorFunction = a13;
    v22 = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v21];
    v23 = objc_alloc_init(BWVideoFormatRequirements);
    [(BWVideoFormatRequirements *)v23 setSupportedPixelFormats:&unk_1EFB02D98];
    [(BWNodeInput *)v22 setFormatRequirements:v23];

    [(BWNodeInput *)v22 setPassthroughMode:0];
    -[BWNodeInput setRetainedBufferCount:](v22, "setRetainedBufferCount:", -[BWGNRNode _worstCaseFrameRetainCount]((unint64_t)v21));
    [(BWNode *)v21 addInput:v22];

    v24 = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:v21];
    v25 = objc_alloc_init(BWVideoFormatRequirements);
    [(BWVideoFormatRequirements *)v25 setSupportedPixelFormats:&unk_1EFB02DB0];
    [(BWNodeOutput *)v24 setFormatRequirements:v25];

    [(BWNodeOutput *)v24 setProvidesPixelBufferPool:0];
    [(BWNodeOutput *)v24 setPassthroughMode:0];
    [(BWNode *)v21 addOutput:v24];
  }
  return v21;
}

- (unint64_t)_worstCaseFrameRetainCount
{
  if (result)
  {
    unsigned int v1 = 4 * *(unsigned __int8 *)(result + 96);
    int v2 = *(unsigned __int8 *)(result + 97);
    if (*(unsigned char *)(result + 98)) {
      unsigned int v3 = 3;
    }
    else {
      unsigned int v3 = 0;
    }
    if (v1 <= 4 * v2) {
      unsigned int v1 = 4 * v2;
    }
    if (v1 <= v3) {
      unsigned int v1 = v3;
    }
    if (v1 <= 1) {
      return 1;
    }
    else {
      return v1;
    }
  }
  return result;
}

- (void)dealloc
{
  -[BWGNRNode _clearCaptureRequestState]((uint64_t)self);
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

  v13.receiver = self;
  v13.super_class = (Class)BWGNRNode;
  [(BWNode *)&v13 dealloc];
}

- (void)_clearCaptureRequestState
{
  if (a1)
  {

    *(void *)(a1 + 176) = 0;
    *(_DWORD *)(a1 + 184) = 0;
    *(unsigned char *)(a1 + 188) = 0;
    *(unsigned char *)(a1 + 189) = 0;
    *(unsigned char *)(a1 + 190) = 0;
    *(_DWORD *)(a1 + 192) = 0;
    *(_DWORD *)(a1 + 196) = 0;
    *(unsigned char *)(a1 + 200) = 0;
    *(_DWORD *)(a1 + 204) = -1;
    *(_DWORD *)(a1 + 208) = -1;
    *(_DWORD *)(a1 + 216) = -1;
    *(_DWORD *)(a1 + 220) = -1;
    [*(id *)(a1 + 224) removeAllObjects];
    int v2 = *(const void **)(a1 + 232);
    if (v2)
    {
      CFRelease(v2);
      *(void *)(a1 + 232) = 0;
    }
  }
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

- (id)nodeType
{
  return @"Effect";
}

- (id)nodeSubType
{
  return @"GeneralNoiseReducerAndFusionProcessor";
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  v3.receiver = self;
  v3.super_class = (Class)BWGNRNode;
  [(BWNode *)&v3 prepareForCurrentConfigurationToBecomeLive];
  if (self->_sampleBufferProcessor || !-[BWGNRNode _setupSampleBufferProcessor]((uint64_t)self))
  {
    if (self->_hdrEnabled && self->_portType && self->_telephotoPortType && !self->_stereoFusedGNRHDRPixelConverter) {
      self->_stereoFusedGNRHDRPixelConverter = objc_alloc_init(FigCapturePixelConverter);
    }
    self->_inputAttachedMedia = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
}

- (uint64_t)_setupSampleBufferProcessor
{
  if (!a1) {
    return 0;
  }
  id v19 = 0;
  uint64_t v20 = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3052000000;
  v18[3] = __Block_byref_object_copy__10;
  v18[4] = __Block_byref_object_dispose__10;
  v18[5] = a1;
  int v2 = -[BWGNRNode sbpOptionsDictionary]((void *)a1);
  if (v2 && (objc_super v3 = *(uint64_t (**)(void, __CFString *, void *, uint64_t *))(a1 + 112)) != 0)
  {
    uint64_t v4 = *MEMORY[0x1E4F1CF80];
    uint64_t v5 = v3(*MEMORY[0x1E4F1CF80], @"GNR", v2, &v20);
    if (v5)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
      id v14 = 0;
    }
    else
    {
      uint64_t v6 = v20;
      *(void *)(a1 + 120) = v20;
      uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v7) {
        uint64_t v8 = v7;
      }
      else {
        uint64_t v8 = 0;
      }
      uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t (*)(), uint64_t))(v8 + 8);
      if (v9)
      {
        uint64_t v5 = v9(v6, gnrn_processorOutputReadyCallback, a1);
        if (v5)
        {
          id v14 = 0;
          goto LABEL_17;
        }
        uint64_t FigBaseObject = FigSampleBufferProcessorGetFigBaseObject();
        uint64_t v11 = *(void *)(CMBaseObjectGetVTable() + 8);
        if (v11) {
          uint64_t v12 = v11;
        }
        else {
          uint64_t v12 = 0;
        }
        objc_super v13 = *(uint64_t (**)(uint64_t, void, uint64_t, id *))(v12 + 48);
        if (v13)
        {
          uint64_t v5 = v13(FigBaseObject, *MEMORY[0x1E4F55900], v4, &v19);
          id v14 = v19;
          if (!v5)
          {
            v17[0] = MEMORY[0x1E4F143A8];
            v17[1] = 3221225472;
            v17[2] = __40__BWGNRNode__setupSampleBufferProcessor__block_invoke;
            v17[3] = &unk_1E5C256B8;
            v17[4] = v18;
            [v19 setReferenceFrameSelectionHandlerBlock:v17];
            v15 = (void *)[*(id *)(a1 + 8) videoFormat];
            objc_msgSend(v19, "prepareForProcessingPixelBuffersWithAttributes:", objc_msgSend(v15, "pixelBufferAttributes"));
            uint64_t v5 = 0;
            id v14 = v19;
          }
          goto LABEL_17;
        }
      }
      id v14 = 0;
      uint64_t v5 = 4294954514;
    }
  }
  else
  {
    id v14 = 0;
    uint64_t v5 = 0;
  }
LABEL_17:

  _Block_object_dispose(v18, 8);
  return v5;
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  if (!a3) {
    return;
  }
  uint64_t v6 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  if (!v6) {
    return;
  }
  uint64_t v7 = v6;
  uint64_t v8 = (void *)[v6 objectForKeyedSubscript:*MEMORY[0x1E4F54128]];
  uint64_t v9 = *MEMORY[0x1E4F53D38];
  signed int v78 = objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E4F53D38]), "intValue");
  int v10 = objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E4F54138]), "BOOLValue");
  int v11 = v10;
  uint64_t v12 = &OBJC_IVAR___BWPreviewStitcherNode__wantWideFallbackDueToTeleAEAF;
  if (!self->_sampleBufferProcessor) {
    goto LABEL_155;
  }
  if (self->_currentStillImageSettings)
  {
    if (v10) {
      goto LABEL_6;
    }
LABEL_30:
    unsigned int processingType = self->_processingType;
    BOOL v22 = processingType > 0xA;
    int v23 = (1 << processingType) & 0x431;
    BOOL v24 = v22 || v23 == 0;
    if (v24 && (v78 < 1 || v78 > self->_expectedFrameCount)) {
      return;
    }
    id v25 = [(BWStillImageCaptureSettings *)[(BWStillImageSettings *)self->_currentStillImageSettings captureSettings] captureStreamSettingsForPortType:v8];
    int v26 = self->_processingType;
    v76 = v25;
    if (v26 != 9 && v26 != 3
      || ([(BWStillImageCaptureSettings *)[(BWStillImageSettings *)self->_currentStillImageSettings captureSettings] captureFlags] & 0x400) == 0)
    {
      char v27 = 0;
      BOOL v28 = 0;
      v77 = a3;
LABEL_89:
      ++self->_receivedFrameCount;
      if (self->_hdrEnabled)
      {
        v48 = (void *)[v7 objectForKeyedSubscript:*MEMORY[0x1E4F53450]];
        if (v48)
        {
          [v48 doubleValue];
          if (v49 == 0.0)
          {
            self->_hdrEV0BracketCaptureIdentifier = objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E4F542D8]), "intValue");
            if (-[BWGNRNode _isBravoHDRDepthDataCapture]((uint64_t)self))
            {
              self->_processingHDREV0BracketFrame = 1;
              uint64_t v75 = *MEMORY[0x1E4F55910];
              -[BWGNRNode _setPropertyOnSampleBufferProcessorWithKey:value:]((uint64_t)self, *MEMORY[0x1E4F55910], (uint64_t)&unk_1EFAFE5B0);
              sampleBufferProcessor = self->_sampleBufferProcessor;
              uint64_t v51 = *(void *)(CMBaseObjectGetVTable() + 16);
              if (v51) {
                uint64_t v52 = v51;
              }
              else {
                uint64_t v52 = 0;
              }
              v53 = *(void (**)(OpaqueFigSampleBufferProcessor *, opaqueCMSampleBuffer *))(v52 + 16);
              if (v53) {
                v53(sampleBufferProcessor, a3);
              }
              -[BWGNRNode _setPropertyOnSampleBufferProcessorWithKey:value:]((uint64_t)self, *MEMORY[0x1E4F55908], 0);
              if (![(NSString *)self->_portType isEqualToString:*MEMORY[0x1E4F52DF0]])
              {
LABEL_149:
                -[BWGNRNode _clearCaptureRequestState]((uint64_t)self);
                goto LABEL_150;
              }
              -[BWGNRNode _setPropertyOnSampleBufferProcessorWithKey:value:]((uint64_t)self, v75, [NSNumber numberWithInt:self->_processingType]);
              self->_hdrDisparityBracketedCaptureSequenceNumber = objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", v9), "intValue");
            }
          }
        }
      }
      unsigned int v54 = self->_processingType;
      if (v54 > 0xA || ((1 << v54) & 0x431) == 0)
      {
        id v58 = BWSampleBufferCopyDictionaryOfAttachedMedia(v77);
        if (v58)
        {
          v59 = v58;
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_inputAttachedMedia, "setObject:forKeyedSubscript:", v58, [NSNumber numberWithInt:v78]);
        }
        BWSampleBufferRemoveAttachedMedia(a3, @"Depth");
      }
      if (v78 < 1) {
        char v55 = 1;
      }
      else {
        char v55 = v27;
      }
      unsigned int expectedFrameCount = self->_expectedFrameCount;
      if (v55)
      {
        if (expectedFrameCount)
        {
          int v57 = self->_receivedFrameCount >= expectedFrameCount;
          goto LABEL_117;
        }
      }
      else if (expectedFrameCount && self->_receivedFrameCount < expectedFrameCount)
      {
        if (v78 == expectedFrameCount) {
          int v57 = -[BWGNRNode _isBravoTelephotoHDRDepthDataCapture]((uint64_t)self) ^ 1;
        }
        else {
          int v57 = 0;
        }
LABEL_117:
        int v79 = v57;
        self->_receivedAllFrames = v57;
        collectedUnprocessedPreBracketHDR = self->_collectedUnprocessedPreBracketHDR;
        if (collectedUnprocessedPreBracketHDR)
        {
          v61 = self->_sampleBufferProcessor;
          uint64_t v62 = *(void *)(CMBaseObjectGetVTable() + 16);
          if (v62) {
            uint64_t v63 = v62;
          }
          else {
            uint64_t v63 = 0;
          }
          v64 = *(void (**)(OpaqueFigSampleBufferProcessor *, opaqueCMSampleBuffer *))(v63 + 16);
          if (v64) {
            v64(v61, collectedUnprocessedPreBracketHDR);
          }
          v65 = self->_collectedUnprocessedPreBracketHDR;
          if (v65)
          {
            CFRelease(v65);
            self->_collectedUnprocessedPreBracketHDR = 0;
          }
        }
        v66 = self->_sampleBufferProcessor;
        uint64_t v67 = *(void *)(CMBaseObjectGetVTable() + 16);
        if (v67) {
          uint64_t v68 = v67;
        }
        else {
          uint64_t v68 = 0;
        }
        v69 = *(void (**)(OpaqueFigSampleBufferProcessor *, opaqueCMSampleBuffer *))(v68 + 16);
        if (v69) {
          v69(v66, v77);
        }
        if ([v76 captureType] == 5
          && self->_receivedFrameCount == self->_expectedFrameCount - 1)
        {
          int v70 = [v76 timeMachineFrameCount];
          if (-[BWStillImageCaptureSettings bracketedCaptureSequenceNumberForOISLongExposure](-[BWStillImageSettings captureSettings](self->_currentStillImageSettings, "captureSettings"), "bracketedCaptureSequenceNumberForOISLongExposure")+ v70 == self->_expectedFrameCount)-[BWGNRNode _setPropertyOnSampleBufferProcessorWithKey:value:]((uint64_t)self, *MEMORY[0x1E4F55920], MEMORY[0x1E4F1CC38]); {
        }
          }
        if (!self->_receivedAllFrames)
        {
          unsigned int v71 = self->_processingType;
          if (v71 > 0xA || ((1 << v71) & 0x431) == 0)
          {
LABEL_148:
            if (!v79)
            {
              if (!v28) {
                return;
              }
              goto LABEL_153;
            }
            goto LABEL_149;
          }
        }
        -[BWGNRNode _detectMissingPreBracketedFrameAndEmitBWNodeError]((uint64_t)self);
        BOOL v72 = [(BWStillImageCaptureSettings *)[(BWStillImageSettings *)self->_currentStillImageSettings captureSettings] expectReferenceFrameBracketedCaptureSequenceNumber];
        uint64_t receivedReferenceFrameBracketedCaptureSequenceNumber = self->_receivedReferenceFrameBracketedCaptureSequenceNumber;
        if (v72)
        {
          if (receivedReferenceFrameBracketedCaptureSequenceNumber == -1)
          {
            if (self->_hdrDisparityBracketedCaptureSequenceNumber == -1)
            {
LABEL_150:
              if (!v28) {
                return;
              }
LABEL_153:
              CFRelease(v77);
              return;
            }
            goto LABEL_142;
          }
        }
        else if (receivedReferenceFrameBracketedCaptureSequenceNumber == -1)
        {
LABEL_142:
          uint64_t receivedReferenceFrameBracketedCaptureSequenceNumber = self->_hdrDisparityBracketedCaptureSequenceNumber;
        }
        if ((receivedReferenceFrameBracketedCaptureSequenceNumber & 0x80000000) == 0) {
          -[BWGNRNode _setReferenceFrameBracketedCaptureSequenceNumberOnSampleBufferProcessor:]((uint64_t)self, receivedReferenceFrameBracketedCaptureSequenceNumber);
        }
        -[BWGNRNode _setPropertyOnSampleBufferProcessorWithKey:value:]((uint64_t)self, *MEMORY[0x1E4F55908], 0);
        unsigned int v74 = self->_processingType;
        if (v74 > 0xA || ((1 << v74) & 0x431) == 0) {
          self->_previouslyCompletedFusionSettingsID = [(BWStillImageSettings *)self->_currentStillImageSettings settingsID];
        }
        goto LABEL_148;
      }
      int v57 = 1;
      goto LABEL_117;
    }
    CGSize v29 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    cf.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    cf.size = v29;
    if ([v8 isEqualToString:*MEMORY[0x1E4F52DD8]])
    {
      uint64_t v30 = *MEMORY[0x1E4F53260];
      if (FigCFDictionaryGetCGRectIfPresent()) {
        [v7 removeObjectForKey:v30];
      }
    }
    v31 = (void *)[v7 objectForKeyedSubscript:*MEMORY[0x1E4F53450]];
    if (v31 && ([v31 doubleValue], v32 == 0.0))
    {
      CMSetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F55928], (CFTypeRef)*MEMORY[0x1E4F1CFD0], 1u);
    }
    else if (!CGRectIsNull(cf))
    {
      v46 = -[BWGNRNode _copyAndZoomSampleBuffer:usingNormalizedZoomRectangle:]((id *)&self->super.super.isa, a3, cf.origin.x, cf.origin.y, cf.size.width, cf.size.height);
      BOOL v28 = v46 != 0;
      if (v46) {
        v47 = (opaqueCMSampleBuffer *)v46;
      }
      else {
        v47 = a3;
      }
      v77 = v47;
      goto LABEL_88;
    }
    BOOL v28 = 0;
    v77 = a3;
LABEL_88:
    char v27 = 1;
    goto LABEL_89;
  }
  objc_super v13 = (void *)CMGetAttachment(a3, @"StillSettings", 0);
  if (!v13 || (id v14 = v13, [v13 settingsID] == self->_previouslyCompletedFusionSettingsID))
  {
LABEL_155:
    uint64_t v34 = 4294954516;
    goto LABEL_56;
  }
  self->_currentStillImageSettings = (BWStillImageSettings *)v14;
  -[BWGNRNode _setExpectedFrameCountForPortType:]((uint64_t)self, (uint64_t)v8);
  uint64_t v15 = -[BWGNRNode _gnrProcessingTypeWithMetadataDictionary:]((uint64_t)self, v7);
  uint64_t v16 = -[BWGNRNode _setPropertyOnSampleBufferProcessorWithKey:value:]((uint64_t)self, *MEMORY[0x1E4F55910], [NSNumber numberWithInt:v15]);
  if (v16)
  {
    uint64_t v34 = v16;
    uint64_t v12 = &OBJC_IVAR___BWPreviewStitcherNode__wantWideFallbackDueToTeleAEAF;
    goto LABEL_56;
  }
  self->_unsigned int processingType = v15;
  int v17 = [(BWStillImageCaptureSettings *)[(BWStillImageSettings *)self->_currentStillImageSettings captureSettings] captureType];
  if ((v17 & 0xFFFFFFFE) == 4)
  {
    BOOL v18 = 1;
    uint64_t v12 = &OBJC_IVAR___BWPreviewStitcherNode__wantWideFallbackDueToTeleAEAF;
  }
  else
  {
    uint64_t v12 = &OBJC_IVAR___BWPreviewStitcherNode__wantWideFallbackDueToTeleAEAF;
    BOOL v18 = v17 == 3 && self->_hdrEnabled;
  }
  if (v18 && self->_allowedToModifyInputBuffers) {
    uint64_t v20 = (uint64_t *)MEMORY[0x1E4F1CFD0];
  }
  else {
    uint64_t v20 = (uint64_t *)MEMORY[0x1E4F1CFC8];
  }
  -[BWGNRNode _setPropertyOnSampleBufferProcessorWithKey:value:]((uint64_t)self, *MEMORY[0x1E4F34690], *v20);
  if (!v11) {
    goto LABEL_30;
  }
LABEL_6:
  self->_receivedPreBracketFrame = 1;
  if ([(BWStillImageCaptureSettings *)[(BWStillImageSettings *)self->_currentStillImageSettings captureSettings] captureType] == 3)
  {
    if (([(BWStillImageCaptureSettings *)[(BWStillImageSettings *)self->_currentStillImageSettings captureSettings] captureFlags] & 0x400) == 0)
    {
      if (self->_hdrEnabled)
      {
        self->_collectedUnprocessedPreBracketHDR = (opaqueCMSampleBuffer *)CFRetain(a3);
        if (![(BWStillImageCaptureSettings *)[(BWStillImageSettings *)self->_currentStillImageSettings captureSettings] deliverOriginalImage])return; {
      }
        }
      goto LABEL_52;
    }
    if (self->_portType && self->_telephotoPortType)
    {
      if ([(BWStillImageCaptureSettings *)[(BWStillImageSettings *)self->_currentStillImageSettings captureSettings] deliverOriginalImage])
      {
        cf.origin.x = 0.0;
        if (BWCMSampleBufferCreateCopyIncludingMetadata(a3, (CMSampleBufferRef *)&cf))
        {
          fig_log_get_emitter();
          FigDebugAssert3();
          return;
        }
        [(BWNodeOutput *)self->super._output emitSampleBuffer:*(void *)&cf.origin.x];
        if (*(void *)&cf.origin.x) {
          CFRelease(*(CFTypeRef *)&cf.origin.x);
        }
      }
      uint64_t v19 = 98;
LABEL_51:
      if (!*((unsigned char *)&self->super.super.isa + v19)) {
        return;
      }
      goto LABEL_52;
    }
    if (![(BWStillImageCaptureSettings *)[(BWStillImageSettings *)self->_currentStillImageSettings captureSettings] deliverOriginalImage])
    {
      uint64_t v19 = 256;
      goto LABEL_51;
    }
  }
LABEL_52:
  int v33 = self->_processingType;
  if ((v33 == 9 || v33 == 3)
    && ([(BWStillImageCaptureSettings *)[(BWStillImageSettings *)self->_currentStillImageSettings captureSettings] captureFlags] & 0x400) == 0)
  {
    uint64_t v34 = -[BWGNRNode _setPropertyOnSampleBufferProcessorWithKey:value:]((uint64_t)self, *MEMORY[0x1E4F55910], [NSNumber numberWithInt:0]);
    LOBYTE(v11) = 1;
    if (v34)
    {
LABEL_56:
      unsigned int v35 = self->_expectedFrameCount;
      if (v35 && (v35 == 1 || v78 == v35))
      {
        int v36 = 1;
        if ((v11 & 1) == 0)
        {
LABEL_60:
          -[BWGNRNode _detectMissingPreBracketedFrameAndEmitBWNodeError]((uint64_t)self);
          id v37 = +[BWNodeError newError:v34 sourceNode:self stillImageSettings:*(Class *)((char *)&self->super.super.isa + v12[274]) metadata:v7];
          [(BWNodeOutput *)self->super._output emitNodeError:v37];
        }
      }
      else
      {
        if (objc_msgSend((id)objc_msgSend(*(id *)((char *)&self->super.super.isa + v12[274]), "captureSettings"), "captureType") != 7)
        {
LABEL_83:
          -[BWGNRNode _clearCaptureRequestState]((uint64_t)self);
          return;
        }
        int v36 = 0;
        if ((v11 & 1) == 0) {
          goto LABEL_60;
        }
      }
      if (v36)
      {
        v38 = *(Class *)((char *)&self->super.super.isa + v12[274]);
        if (v38)
        {
          unsigned int v39 = self->_processingType;
          if (v39 > 0xA || ((1 << v39) & 0x431) == 0) {
            self->_previouslyCompletedFusionSettingsID = [v38 settingsID];
          }
        }
      }
      goto LABEL_83;
    }
  }
  else
  {
    LOBYTE(v11) = 0;
  }
  v40 = self->_sampleBufferProcessor;
  uint64_t v41 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v41) {
    uint64_t v42 = v41;
  }
  else {
    uint64_t v42 = 0;
  }
  v43 = *(void (**)(OpaqueFigSampleBufferProcessor *, opaqueCMSampleBuffer *))(v42 + 16);
  if (v43) {
    v43(v40, a3);
  }
  unsigned int v44 = self->_processingType;
  if (v44 <= 0xA && ((1 << v44) & 0x431) != 0)
  {
    -[BWGNRNode _setPropertyOnSampleBufferProcessorWithKey:value:]((uint64_t)self, *MEMORY[0x1E4F55908], 0);
    if ((v11 & 1) == 0) {
      return;
    }
  }
  else
  {
    if ((v11 & 1) == 0) {
      return;
    }
    -[BWGNRNode _setPropertyOnSampleBufferProcessorWithKey:value:]((uint64_t)self, *MEMORY[0x1E4F55908], 0);
  }
  uint64_t v45 = -[BWGNRNode _setPropertyOnSampleBufferProcessorWithKey:value:]((uint64_t)self, *MEMORY[0x1E4F55910], [NSNumber numberWithInt:self->_processingType]);
  if (v45)
  {
    uint64_t v34 = v45;
    LOBYTE(v11) = 1;
    goto LABEL_56;
  }
}

- (uint64_t)_setExpectedFrameCountForPortType:(uint64_t)result
{
  if (result)
  {
    uint64_t v2 = result;
    objc_super v3 = objc_msgSend((id)objc_msgSend(*(id *)(result + 176), "captureSettings"), "captureStreamSettingsForPortType:", a2);
    int v4 = [v3 captureType];
    result = [v3 bracketSettings];
    uint64_t v5 = (void *)result;
    if (result)
    {
      char v6 = [(id)result providePreBracketedEV0];
      int v7 = [v3 expectedFrameCount];
      result = [v5 providePreBracketedEV0];
      int v8 = v7 - result;
    }
    else
    {
      char v6 = 0;
      int v8 = 1;
    }
    if (!*(_DWORD *)(v2 + 192))
    {
      *(_DWORD *)(v2 + 192) = v8;
      *(unsigned char *)(v2 + 189) = v6;
      result = [v5 providePreBracketedEV0];
      if (result) {
        result = objc_msgSend((id)objc_msgSend(*(id *)(v2 + 176), "captureSettings"), "deliverOriginalImage");
      }
      *(unsigned char *)(v2 + 188) = result;
      if (v4 == 3)
      {
        if (*(unsigned char *)(v2 + 98))
        {
          result = -[BWGNRNode _isBravoHDRDepthDataCapture](v2);
          if (result)
          {
            result = [*(id *)(v2 + 128) isEqualToString:*MEMORY[0x1E4F52DD8]];
            if (result) {
              *(_DWORD *)(v2 + 192) = 1;
            }
          }
        }
        else
        {
          *(_DWORD *)(v2 + 192) = 1;
          result = -[BWGNRNode _isBravoTelephotoHDRDepthDataCapture](v2);
          if (result) {
            ++*(_DWORD *)(v2 + 192);
          }
          if (*(void *)(v2 + 128) && *(void *)(v2 + 152) && !*(unsigned char *)(v2 + 188)) {
            *(unsigned char *)(v2 + 189) = 0;
          }
        }
      }
    }
  }
  return result;
}

- (uint64_t)_gnrProcessingTypeWithMetadataDictionary:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    int v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(result + 176), "captureSettings"), "captureStreamSettingsForPortType:", objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E4F54128])), "captureType");
    unint64_t v5 = objc_msgSend((id)objc_msgSend(*(id *)(v3 + 176), "captureSettings"), "captureFlags") & 0x400;
    switch(v4)
    {
      case 1:
      case 2:
        unint64_t v6 = v5 >> 8;
        break;
      case 3:
        if (v5)
        {
          if (*(void *)(v3 + 128) && *(void *)(v3 + 152))
          {
            BOOL v7 = *(unsigned char *)(v3 + 98) == 0;
            int v8 = 9;
            int v9 = 5;
            goto LABEL_13;
          }
          LODWORD(v6) = 4;
        }
        else if (*(unsigned char *)(v3 + 98))
        {
          LODWORD(v6) = 9;
        }
        else
        {
          LODWORD(v6) = 0;
        }
        break;
      case 4:
        if (v5) {
          LODWORD(v6) = 6;
        }
        else {
          LODWORD(v6) = 1;
        }
        break;
      case 5:
        BOOL v7 = v5 == 0;
        int v8 = 7;
        int v9 = 2;
LABEL_13:
        if (v7) {
          LODWORD(v6) = v9;
        }
        else {
          LODWORD(v6) = v8;
        }
        break;
      default:
        LODWORD(v6) = 0;
        break;
    }
    uint64_t v10 = *MEMORY[0x1E4F540D8];
    if ([a2 objectForKeyedSubscript:*MEMORY[0x1E4F540D8]])
    {
      if (objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", v10), "BOOLValue")) {
        unsigned int v11 = 0;
      }
      else {
        unsigned int v11 = 10;
      }
    }
    else
    {
      unsigned int v11 = 0;
    }
    if (v6) {
      return v6;
    }
    else {
      return v11;
    }
  }
  return result;
}

- (uint64_t)_setPropertyOnSampleBufferProcessorWithKey:(uint64_t)a3 value:
{
  if (result)
  {
    uint64_t FigBaseObject = FigSampleBufferProcessorGetFigBaseObject();
    uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 8);
    if (v6) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
    int v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 56);
    if (v8)
    {
      return v8(FigBaseObject, a2, a3);
    }
    else
    {
      return 4294954514;
    }
  }
  return result;
}

- (id)_copyAndZoomSampleBuffer:(CGFloat)a3 usingNormalizedZoomRectangle:(CGFloat)a4
{
  if (result)
  {
    unsigned int v11 = result;
    CMAttachmentBearerRef target = 0;
    FormatDescription = CMSampleBufferGetFormatDescription(sbuf);
    CMVideoDimensions Dimensions = CMVideoFormatDescriptionGetDimensions(FormatDescription);
    if (objc_msgSend(v11[30], "updateOutputPixelFormat:dimensions:poolCapacity:colorSpaceProperties:alwaysUseHardwareForConversion:", objc_msgSend((id)objc_msgSend(v11[1], "videoFormat"), "pixelFormat"), Dimensions, 2, objc_msgSend((id)objc_msgSend(v11[1], "videoFormat"), "colorSpaceProperties"), 1))
    {
      fig_log_get_emitter();
    }
    else
    {
      if (!objc_msgSend(v11[30], "convertSampleBuffer:cropRect:outputSampleBuffer:", sbuf, &target, a3 * (double)Dimensions.width, a4 * (double)Dimensions.height, a5 * (double)Dimensions.width, a6 * (double)Dimensions.height))
      {
        LODWORD(v14) = objc_msgSend((id)objc_msgSend(v11[22], "requestedSettings"), "outputWidth");
        unsigned int v15 = objc_msgSend((id)objc_msgSend(v11[22], "requestedSettings"), "outputHeight");
        if (!v14 || v15 == 0)
        {
          unint64_t v14 = objc_msgSend((id)objc_msgSend(v11[2], "videoFormat"), "width");
          unint64_t v17 = objc_msgSend((id)objc_msgSend(v11[2], "videoFormat"), "height");
        }
        else
        {
          unint64_t v14 = v14;
          unint64_t v17 = v15;
        }
        CFTypeRef v18 = CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0);
        if (v18)
        {
          uint64_t v19 = (void *)v18;
          FigCaptureMetadataUtilitiesComputeDenormalizedStillImageCropRect(objc_msgSend((id)objc_msgSend(v11[1], "videoFormat"), "width"), objc_msgSend((id)objc_msgSend(v11[1], "videoFormat"), "height"), a3, a4, a5, a6, (double)v14 / (double)v17);
          CGFloat v21 = v20;
          CGFloat v23 = v22;
          CGFloat v25 = v24;
          CGFloat v27 = v26;
          unsigned int v28 = objc_msgSend((id)objc_msgSend(v11[1], "videoFormat"), "width");
          unsigned int v29 = objc_msgSend((id)objc_msgSend(v11[1], "videoFormat"), "height");
          FigCaptureMetadataUtilitiesUpdateMetadataForStillImageCrop(v19, v28 | ((unint64_t)v29 << 32), v14 | ((unint64_t)v17 << 32), v21, v23, v25, v27, *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
          FigCaptureMetadataUtilitiesPreventFurtherCropping(v19, v30);
          return (id *)target;
        }
      }
      fig_log_get_emitter();
    }
    FigDebugAssert3();
    return (id *)target;
  }
  return result;
}

- (BOOL)_isBravoHDRDepthDataCapture
{
  if (!a1 || objc_msgSend((id)objc_msgSend(*(id *)(a1 + 176), "captureSettings"), "captureType") != 3) {
    return 0;
  }
  return -[BWGNRNode _isBravoDepthDataCapture](a1);
}

- (uint64_t)_isBravoTelephotoHDRDepthDataCapture
{
  if (!a1
    || objc_msgSend((id)objc_msgSend(*(id *)(a1 + 176), "captureSettings"), "captureType") != 3
    || (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 176), "captureSettings"), "captureFlags") & 0x800) == 0)
  {
    return 0;
  }
  uint64_t v3 = *(void **)(a1 + 128);
  uint64_t v4 = *MEMORY[0x1E4F52DF0];
  return [v3 isEqualToString:v4];
}

- (void)_detectMissingPreBracketedFrameAndEmitBWNodeError
{
  if (a1 && *(unsigned char *)(a1 + 189) && !*(unsigned char *)(a1 + 190))
  {
    int v2 = *(unsigned __int8 *)(a1 + 256);
    if (*(unsigned char *)(a1 + 256)) {
      int v2 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 176), "captureSettings"), "captureType") == 3;
    }
    if (*(unsigned char *)(a1 + 188)) {
      BOOL v3 = 0;
    }
    else {
      BOOL v3 = v2 == 0;
    }
    if (!v3)
    {
      id v4 = +[BWNodeError newError:4294954516 sourceNode:a1 stillImageSettings:*(void *)(a1 + 176) metadata:0];
      [*(id *)(a1 + 16) emitNodeError:v4];
    }
  }
}

- (uint64_t)_setReferenceFrameBracketedCaptureSequenceNumberOnSampleBufferProcessor:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    if (-[BWGNRNode _isBravoDepthDataCapture](result))
    {
      int v4 = *(_DWORD *)(v3 + 184);
      BOOL v6 = v4 != 3 && v4 != 9;
    }
    else
    {
      BOOL v6 = 0;
    }
    -[BWGNRNode _setPropertyOnSampleBufferProcessorWithKey:value:](v3, *MEMORY[0x1E4F558F8], [NSNumber numberWithBool:v6]);
    uint64_t v7 = *MEMORY[0x1E4F55918];
    uint64_t v8 = [NSNumber numberWithInt:a2];
    return -[BWGNRNode _setPropertyOnSampleBufferProcessorWithKey:value:](v3, v7, v8);
  }
  return result;
}

- (void)handleStillImageReferenceFrameBracketedCaptureSequenceNumber:(int)a3 forInput:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  if (self->_receivedAllFrames)
  {
    [(BWStillImageCaptureSettings *)[(BWStillImageSettings *)self->_currentStillImageSettings captureSettings] expectReferenceFrameBracketedCaptureSequenceNumber];
    -[BWGNRNode _setReferenceFrameBracketedCaptureSequenceNumberOnSampleBufferProcessor:]((uint64_t)self, v4);
    -[BWGNRNode _setPropertyOnSampleBufferProcessorWithKey:value:]((uint64_t)self, *MEMORY[0x1E4F55908], 0);
    self->_previouslyCompletedFusionSettingsID = [(BWStillImageSettings *)self->_currentStillImageSettings settingsID];
    -[BWGNRNode _clearCaptureRequestState]((uint64_t)self);
  }
  else
  {
    self->_uint64_t receivedReferenceFrameBracketedCaptureSequenceNumber = a3;
  }
}

- (void)handleNodeError:(id)a3 forInput:(id)a4
{
  if (!self->_sampleBufferProcessor) {
    goto LABEL_20;
  }
  BOOL v6 = objc_msgSend(a3, "errorCode", a3, a4) == -16800 || objc_msgSend(a3, "errorCode") == -16802;
  if (objc_msgSend((id)objc_msgSend(a3, "stillImageSettings"), "settingsID") == self->_previouslyCompletedFusionSettingsID
    && !v6)
  {
    goto LABEL_13;
  }
  unsigned int processingType = self->_processingType;
  if (processingType < 0xB && ((0x431u >> processingType) & 1) != 0)
  {
LABEL_20:
    int v9 = 1;
    goto LABEL_14;
  }
  if (!self->_currentStillImageSettings)
  {
LABEL_13:
    int v9 = 0;
    goto LABEL_14;
  }
  -[BWGNRNode _setPropertyOnSampleBufferProcessorWithKey:value:]((uint64_t)self, *MEMORY[0x1E4F55908], 0);
  int v9 = 0;
  self->_previouslyCompletedFusionSettingsID = [(BWStillImageSettings *)self->_currentStillImageSettings settingsID];
LABEL_14:
  int isBravoTelephotoHDRDepthData = -[BWGNRNode _isBravoTelephotoHDRDepthDataCapture]((uint64_t)self);
  -[BWGNRNode _clearCaptureRequestState]((uint64_t)self);
  if (v9)
  {
    [(BWNodeOutput *)self->super._output emitNodeError:a3];
    if (isBravoTelephotoHDRDepthData)
    {
      output = self->super._output;
      [(BWNodeOutput *)output emitNodeError:a3];
    }
  }
}

- (void)setUsesHDRPreBracketFrameForErrorRecoveryDownstream:(BOOL)a3
{
  self->_usesHDRPreBracketFrameForErrorRecoveryDownstream = a3;
}

- (BOOL)usesHDRPreBracketFrameForErrorRecoveryDownstream
{
  return self->_usesHDRPreBracketFrameForErrorRecoveryDownstream;
}

- (void)setAllowedToModifyInputBuffers:(BOOL)a3
{
  self->_allowedToModifyInputBuffers = a3;
}

- (BOOL)allowedToModifyInputBuffers
{
  return self->_allowedToModifyInputBuffers;
}

- (BOOL)attachesInputBracketToOutputSampleBuffer
{
  return 0;
}

- (void)sbpOptionsDictionary
{
  v4[3] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    unsigned int v1 = result;
    result = -[BWGNRNode _tuningDictionaryWithOnlyGNRParameters](result);
    if (result)
    {
      uint64_t v2 = *MEMORY[0x1E4F558F0];
      v3[0] = *MEMORY[0x1E4F535B0];
      v3[1] = v2;
      v4[0] = result;
      v4[1] = &unk_1EFAFE5C8;
      v3[2] = *MEMORY[0x1E4F558E8];
      v4[2] = [NSNumber numberWithBool:*((unsigned __int8 *)v1 + 99)];
      return (void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:v3 count:3];
    }
  }
  return result;
}

- (void)_tuningDictionaryWithOnlyGNRParameters
{
  v33[3] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    unsigned int v1 = result;
    if (!result[16] || !result[17]) {
      return 0;
    }
    result = (void *)result[18];
    if (result)
    {
      result = (void *)[result objectForKeyedSubscript:@"GNRParameters"];
      if (result)
      {
        uint64_t v2 = (void *)v1[21];
        if (!v2)
        {
          uint64_t v18 = v1[16];
          uint64_t v19 = v1[17];
          v20[0] = @"DefaultSensorIDs";
          uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
          uint64_t v13 = v1[17];
          v20[1] = v1[16];
          v21[0] = v12;
          uint64_t v16 = v13;
          unint64_t v14 = @"GNRParameters";
          uint64_t v15 = [(id)v1[18] objectForKeyedSubscript:@"GNRParameters"];
          uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
          v21[1] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
          uint64_t v8 = (void *)MEMORY[0x1E4F1C9E8];
          int v9 = v21;
          uint64_t v10 = v20;
          uint64_t v11 = 2;
          return (void *)[v8 dictionaryWithObjects:v9 forKeys:v10 count:v11];
        }
        if (v1[19] && v1[20])
        {
          result = (void *)[v2 objectForKeyedSubscript:@"GNRParameters"];
          if (!result) {
            return result;
          }
          uint64_t v3 = v1[17];
          uint64_t v4 = v1[19];
          v30[0] = v1[16];
          v30[1] = v4;
          uint64_t v5 = v1[20];
          v31[0] = v3;
          v31[1] = v5;
          v32[0] = @"DefaultSensorIDs";
          v33[0] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:2];
          uint64_t v6 = v1[17];
          v32[1] = v1[16];
          uint64_t v28 = v6;
          double v26 = @"GNRParameters";
          uint64_t v27 = [(id)v1[18] objectForKeyedSubscript:@"GNRParameters"];
          uint64_t v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
          v33[1] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
          uint64_t v7 = v1[20];
          v32[2] = v1[19];
          uint64_t v24 = v7;
          double v22 = @"GNRParameters";
          uint64_t v23 = [(id)v1[21] objectForKeyedSubscript:@"GNRParameters"];
          uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
          v33[2] = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
          uint64_t v8 = (void *)MEMORY[0x1E4F1C9E8];
          int v9 = v33;
          uint64_t v10 = v32;
          uint64_t v11 = 3;
          return (void *)[v8 dictionaryWithObjects:v9 forKeys:v10 count:v11];
        }
        return 0;
      }
    }
  }
  return result;
}

uint64_t __40__BWGNRNode__setupSampleBufferProcessor__block_invoke(uint64_t result, int a2)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)(result + 32) + 8) + 40);
  if (v2) {
    *(_DWORD *)(v2 + 208) = a2;
  }
  return result;
}

- (BOOL)_isBravoDepthDataCapture
{
  if (result)
  {
    uint64_t v1 = result;
    if ((objc_msgSend((id)objc_msgSend(*(id *)(result + 176), "captureSettings"), "captureFlags") & 0x800) != 0)
    {
      uint64_t v2 = (void *)[*(id *)(v1 + 176) captureSettings];
      return [v2 captureStreamSettingsForPortType:*MEMORY[0x1E4F52DF0]] != 0;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (uint64_t)_sampleBufferProcessorOutputReady:(CMAttachmentBearerRef)target sampleBuffer:
{
  if (result)
  {
    uint64_t v6 = result;
    uint64_t v7 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0);
    int v8 = objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E4F54138]), "BOOLValue");
    int v9 = v8;
    if (a2) {
      BOOL v10 = target == 0;
    }
    else {
      BOOL v10 = 1;
    }
    char v11 = !v10;
    if (v10)
    {
      if (a2) {
        goto LABEL_16;
      }
    }
    else
    {
      int v12 = *(_DWORD *)(v6 + 184);
      BOOL v13 = v12 == 9 || v12 == 3;
      if (v13
        && (v8 & 1) == 0
        && (objc_msgSend((id)objc_msgSend(*(id *)(v6 + 176), "captureSettings"), "deliverOriginalImage") & 1) != 0)
      {
LABEL_16:
        fig_log_get_emitter();
        LODWORD(v30) = a2;
        FigDebugAssert3();
        id v14 = +[BWNodeError newError:sourceNode:stillImageSettings:metadata:](BWNodeError, "newError:sourceNode:stillImageSettings:metadata:", a2, v6, *(void *)(v6 + 176), v7, v30, v3);
        [*(id *)(v6 + 16) emitNodeError:v14];
        if (-[BWGNRNode _isBravoTelephotoHDRDepthDataCapture](v6)) {
          [*(id *)(v6 + 16) emitNodeError:v14];
        }

        return [+[BWAggdDataReporter sharedInstance] reportGNRSampleBufferProcessorProcessingStatus:a2];
      }
    }
    unsigned int v15 = *(_DWORD *)(v6 + 184);
    if (v15 != 9 && v15 != 3)
    {
      int v19 = 0;
LABEL_33:
      BOOL v20 = v15 > 0xA;
      int v21 = (1 << v15) & 0x431;
      BOOL v22 = v20 || v21 == 0;
      if (v22
        && (v19 | objc_msgSend((id)objc_msgSend(*(id *)(v6 + 176), "captureSettings"), "deliverOriginalImage") ^ 1) == 1)
      {
        CMSetAttachment(target, @"HasUnreliableBracketingMetadata", MEMORY[0x1E4F1CC38], 1u);
      }
      CMRemoveAttachment(target, (CFStringRef)*MEMORY[0x1E4F55928]);
      unsigned int v23 = *(_DWORD *)(v6 + 184);
      BOOL v20 = v23 > 0xA;
      int v24 = (1 << v23) & 0x431;
      BOOL v25 = v20 || v24 == 0;
      if (v25 && (v9 & 1) == 0 && (*(_DWORD *)(v6 + 208) & 0x80000000) == 0)
      {
        double v26 = objc_msgSend(*(id *)(v6 + 224), "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:"));
        if (v26)
        {
          v31[0] = MEMORY[0x1E4F143A8];
          v31[1] = 3221225472;
          void v31[2] = __60__BWGNRNode__sampleBufferProcessorOutputReady_sampleBuffer___block_invoke;
          v31[3] = &__block_descriptor_40_e25_v32__0__NSString_8_16_B24l;
          v31[4] = target;
          [v26 enumerateKeysAndObjectsUsingBlock:v31];
        }
      }
      [*(id *)(v6 + 16) emitSampleBuffer:target];
      return [+[BWAggdDataReporter sharedInstance] reportGNRSampleBufferProcessorProcessingStatus:a2];
    }
    int v17 = objc_msgSend((id)CMGetAttachment(target, @"StillImageProcessingFlags", 0), "unsignedIntValue");
    int v18 = v17;
    if (v11)
    {
      CMSetAttachment(target, @"StillImageProcessingFlags", (CFTypeRef)[NSNumber numberWithUnsignedInt:v17 | 0x400u], 1u);
    }
    else if (v9)
    {
      if (objc_msgSend((id)objc_msgSend(*(id *)(v6 + 176), "captureSettings"), "deliverOriginalImage"))
      {
        CMSetAttachment(target, @"StillImageProcessingFlags", (CFTypeRef)[NSNumber numberWithUnsignedInt:v18 | 1u], 1u);
        [v7 setObject:&unk_1EFAFE5E0 forKeyedSubscript:*MEMORY[0x1E4F53F30]];
      }
    }
    else if (!*(unsigned char *)(v6 + 212))
    {
      CMSetAttachment(target, @"StillImageProcessingFlags", (CFTypeRef)[NSNumber numberWithUnsignedInt:v17 | 2u], 1u);
      if (objc_msgSend((id)objc_msgSend(*(id *)(v6 + 176), "captureSettings"), "deliverOriginalImage")) {
        uint64_t v27 = 3;
      }
      else {
        uint64_t v27 = 2;
      }
      uint64_t v28 = [NSNumber numberWithShort:v27];
      [v7 setObject:v28 forKeyedSubscript:*MEMORY[0x1E4F53F30]];
      if (*(int *)(v6 + 216) < 1)
      {
        -[BWGNRNode _isBravoTelephotoHDRDepthDataCapture](v6);
      }
      else
      {
        uint64_t v29 = objc_msgSend(NSNumber, "numberWithInt:");
        [v7 setObject:v29 forKeyedSubscript:*MEMORY[0x1E4F542D8]];
      }
      int v19 = 1;
      goto LABEL_32;
    }
    int v19 = 0;
LABEL_32:
    *(unsigned char *)(v6 + 212) = 0;
    unsigned int v15 = *(_DWORD *)(v6 + 184);
    goto LABEL_33;
  }
  return result;
}

void __60__BWGNRNode__sampleBufferProcessorOutputReady_sampleBuffer___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

@end