@interface BWFaceTrackingNode
+ (void)initialize;
- (BOOL)faceTrackingPlusEnabled;
- (BOOL)frontCamera;
- (BOOL)mirrored;
- (BOOL)skipProcessing;
- (BOOL)usesFaceRecognition;
- (BWFaceTrackingNode)initWithFigThreadPriority:(unsigned int)a3 pearlModuleType:(int)a4 useUnfilteredDepth:(BOOL)a5 queueDepth:(unsigned int)a6 passthroughInputs:(BOOL)a7 allowPixelTransfer:(BOOL)a8;
- (float)networkFailureThresholdMultiplier;
- (float)trackingFailureFieldOfViewModifier;
- (id)nodeSubType;
- (id)nodeType;
- (int)maxFaces;
- (int)orientation;
- (uint64_t)_depthIntrinsicsExtrinsicsFromRGBIntrisics:(unint64_t)a3 colorWidth:(unint64_t)a4 colorHeight:(unint64_t)a5 depthWidth:(double)a6 depthHeight:(double)a7;
- (uint64_t)_prepareDecompressionResources;
- (uint64_t)_setupCVA;
- (void)_processSampleBuffer:(uint64_t)a1;
- (void)_releaseDecompressionResources;
- (void)_setupCVA;
- (void)_startProcessingSampleSampleBuffer:(uint64_t)a1;
- (void)dealloc;
- (void)didReachEndOfDataForInput:(id)a3;
- (void)didSelectFormat:(id)a3 forInput:(id)a4;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
- (void)setFaceTrackingPlusEnabled:(BOOL)a3;
- (void)setFrontCamera:(BOOL)a3;
- (void)setMaxFaces:(int)a3;
- (void)setMirrored:(BOOL)a3;
- (void)setNetworkFailureThresholdMultiplier:(float)a3;
- (void)setOrientation:(int)a3;
- (void)setSkipProcessing:(BOOL)a3;
- (void)setTrackingFailureFieldOfViewModifier:(float)a3;
- (void)setUsesFaceRecognition:(BOOL)a3;
@end

@implementation BWFaceTrackingNode

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  if (self->_passthroughInputs) {
    [(BWNodeOutput *)self->super._output setFormat:a3];
  }
  uint64_t v7 = FigCaptureUncompressedPixelFormatForPixelFormat([a3 pixelFormat]);
  if (v7 != [a3 pixelFormat])
  {
    v8 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWVideoFormatRequirements setWidth:](v8, "setWidth:", [a3 width]);
    -[BWVideoFormatRequirements setHeight:](v8, "setHeight:", [a3 height]);
    v11[0] = [NSNumber numberWithUnsignedInt:v7];
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v8, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1]);
    v10 = v8;
    self->_uncompressedVideoFormat = (BWVideoFormat *)+[BWVideoFormat formatByResolvingRequirements:](BWVideoFormat, "formatByResolvingRequirements:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v10 count:1]);
  }
  v9.receiver = self;
  v9.super_class = (Class)BWFaceTrackingNode;
  [(BWNode *)&v9 didSelectFormat:a3 forInput:a4];
}

- (id)nodeType
{
  return @"Effect";
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  if (self->_passthroughInputs
    || (v13 = (void *)CMGetAttachment(a3, @"DepthDisabled", 0), !self->_skipProcessing)
    && ([v13 BOOLValue] & 1) == 0)
  {
    v6 = (int *)MEMORY[0x1E4F1EBA8];
    if (*MEMORY[0x1E4F1EBA8] == 1)
    {
      CMSampleBufferGetPresentationTimeStamp(&v15, a3);
      CMTime time = v15;
      CMTimeGetSeconds(&time);
      kdebug_trace();
    }
    if (self->_nextSbufQueue)
    {
      os_unfair_lock_lock(&self->_processingLock);
      BOOL processing = self->_processing;
      int32_t Count = CMSimpleQueueGetCount(self->_nextSbufQueue);
      int32_t Capacity = CMSimpleQueueGetCapacity(self->_nextSbufQueue);
      if (a3) {
        CFRetain(a3);
      }
      if (self->_processing)
      {
        if (Count == Capacity)
        {
          v10 = CMSimpleQueueDequeue(self->_nextSbufQueue);
          if (v10) {
            CFRelease(v10);
          }
        }
        CMSimpleQueueEnqueue(self->_nextSbufQueue, a3);
      }
      self->_BOOL processing = 1;
      os_unfair_lock_unlock(&self->_processingLock);
      if (!processing) {
        -[BWFaceTrackingNode _startProcessingSampleSampleBuffer:]((uint64_t)self, (uint64_t)a3);
      }
      int v11 = *v6;
      if (!a3) {
        goto LABEL_26;
      }
      if (Count != Capacity || v11 != 1) {
        goto LABEL_26;
      }
      CMSampleBufferGetPresentationTimeStamp(&v14, a3);
      CMTime time = v14;
      CMTimeGetSeconds(&time);
      kdebug_trace();
    }
    else
    {
      -[BWFaceTrackingNode _processSampleBuffer:]((uint64_t)self, a3);
    }
    int v11 = *v6;
LABEL_26:
    if (v11 == 1) {
      kdebug_trace();
    }
  }
}

- (void)_processSampleBuffer:(uint64_t)a1
{
  uint64_t v187 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return;
  }
  v3 = v2;
  uint64_t v5 = a1;
  if (*(void *)(a1 + 136) && !_FigIsCurrentDispatchQueue()) {
    goto LABEL_147;
  }
  while (1)
  {
    if (*(unsigned char *)(v5 + 146))
    {
      v6 = (void *)CMGetAttachment(target, @"DepthDisabled", 0);
      if (*(unsigned char *)(v5 + 200) || [v6 BOOLValue])
      {
        uint64_t v7 = *(void **)(v5 + 16);
        [v7 emitSampleBuffer:target];
        return;
      }
    }
    uint64_t v165 = 0;
    v166 = &v165;
    uint64_t v167 = 0x3052000000;
    v168 = __Block_byref_object_copy__13;
    v169 = __Block_byref_object_dispose__13;
    uint64_t v170 = 0;
    if (-[BWFaceTrackingNode _setupCVA](v5))
    {
      id v8 = 0;
      goto LABEL_139;
    }
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    CVImageBufferRef ImageBuffer = CMSampleBufferGetImageBuffer((CMSampleBufferRef)target);
    CVImageBufferRef cf = ImageBuffer;
    if (!ImageBuffer) {
      break;
    }
    CFRetain(ImageBuffer);
    if (*(void *)(v5 + 208))
    {
      os_unfair_lock_lock((os_unfair_lock_t)(v5 + 232));
      if (-[BWFaceTrackingNode _prepareDecompressionResources]((const os_unfair_lock *)v5)
        || (v10 = (__CVBuffer *)[*(id *)(v5 + 216) newPixelBuffer]) == 0)
      {
LABEL_163:
        fig_log_get_emitter();
        FigDebugAssert3();
LABEL_138:
        CFRelease(cf);
        goto LABEL_139;
      }
      if (VTPixelTransferSessionTransferImage(*(VTPixelTransferSessionRef *)(v5 + 224), cf, v10)) {
        goto LABEL_138;
      }
      CFRelease(cf);
      os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 232));
      CVImageBufferRef cf = v10;
    }
    targeta[0] = 0;
    targeta[1] = targeta;
    *(void *)&long long v163 = 0x2020000000;
    int v11 = (void *)getkCVAFaceTracking_ColorSymbolLoc_ptr;
    *((void *)&v163 + 1) = getkCVAFaceTracking_ColorSymbolLoc_ptr;
    if (!getkCVAFaceTracking_ColorSymbolLoc_ptr)
    {
      time.duration.value = MEMORY[0x1E4F143A8];
      *(void *)&time.duration.timescale = 3221225472;
      time.duration.epoch = (CMTimeEpoch)__getkCVAFaceTracking_ColorSymbolLoc_block_invoke;
      time.presentationTimeStamp.value = (CMTimeValue)&unk_1E5C24978;
      *(void *)&time.presentationTimeStamp.timescale = targeta;
      v12 = (void *)AppleCVALibrary();
      v13 = dlsym(v12, "kCVAFaceTracking_Color");
      *(void *)(*(void *)(*(void *)&time.presentationTimeStamp.timescale + 8) + 24) = v13;
      getkCVAFaceTracking_ColorSymbolLoc_ptr = *(void *)(*(void *)(*(void *)&time.presentationTimeStamp.timescale
                                                                     + 8)
                                                         + 24);
      int v11 = (void *)*((void *)targeta[1] + 3);
    }
    _Block_object_dispose(targeta, 8);
    if (v11)
    {
      [v8 setObject:cf forKeyedSubscript:*v11];
      CMTime v14 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0);
      v145 = v14;
      if (!v14) {
        goto LABEL_163;
      }
      CMTime v15 = (void *)[v14 objectForKeyedSubscript:*MEMORY[0x1E4F53DC0]];
      v149 = (void *)[MEMORY[0x1E4F1CA48] array];
      BOOL IsExtensionDeviceType = BWDeviceTypeIsExtensionDeviceType(objc_msgSend((id)objc_msgSend(v145, "objectForKeyedSubscript:", *MEMORY[0x1E4F53DE0]), "integerValue"));
      v143 = v8;
      if ([v15 count])
      {
        int v17 = *(_DWORD *)(v5 + 164);
        int v18 = *(unsigned __int8 *)(v5 + 160);
        int v19 = *(unsigned __int8 *)(v5 + 168);
        objc_msgSend((id)objc_msgSend((id)v5, "graph"), "clientExpectsCameraMountedInLandscapeOrientation");
        int v20 = FigCaptureRotationDegreesFromOrientation(v17, v18 != 0, IsExtensionDeviceType, v19 != 0);
        memset(&time, 0, 48);
        FigCaptureMakeMirrorAndRotateVideoTransform(1, 1, *(unsigned __int8 *)(v5 + 168), v20, (uint64_t)&time);
        uint64_t v142 = v5;
        int v21 = *(unsigned __int8 *)(v5 + 168);
        *(_OWORD *)targeta = *(_OWORD *)&time.duration.value;
        long long v163 = *(_OWORD *)&time.duration.epoch;
        long long v164 = *(_OWORD *)&time.presentationTimeStamp.timescale;
        v22 = BWCreateTransformedFacesArray(v15, targeta, v20, v21);
        v141 = target;
        long long v158 = 0u;
        long long v159 = 0u;
        long long v160 = 0u;
        long long v161 = 0u;
        id obj = v22;
        uint64_t v5 = [v22 countByEnumeratingWithState:&v158 objects:v186 count:16];
        if (v5)
        {
          uint64_t v148 = *(void *)v159;
          uint64_t v147 = *MEMORY[0x1E4F53E70];
          uint64_t v23 = *MEMORY[0x1E4F54348];
          uint64_t v24 = *MEMORY[0x1E4F54180];
          uint64_t v25 = *MEMORY[0x1E4F53CB0];
          while (2)
          {
            target = 0;
            do
            {
              if (*(void *)v159 != v148) {
                objc_enumerationMutation(obj);
              }
              v26 = *(void **)(*((void *)&v158 + 1) + 8 * (void)target);
              v27 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", sampleTimingArray, v140);
              uint64_t v28 = [v26 objectForKeyedSubscript:v147];
              if (v28)
              {
                uint64_t v171 = 0;
                v172 = &v171;
                uint64_t v173 = 0x2020000000;
                v29 = (void *)getkCVAFaceTracking_DetectedFaceFaceIDSymbolLoc_ptr;
                uint64_t v174 = getkCVAFaceTracking_DetectedFaceFaceIDSymbolLoc_ptr;
                if (!getkCVAFaceTracking_DetectedFaceFaceIDSymbolLoc_ptr)
                {
                  targeta[0] = (CMAttachmentBearerRef)MEMORY[0x1E4F143A8];
                  targeta[1] = (CMAttachmentBearerRef)3221225472;
                  *(void *)&long long v163 = __getkCVAFaceTracking_DetectedFaceFaceIDSymbolLoc_block_invoke;
                  *((void *)&v163 + 1) = &unk_1E5C24978;
                  *(void *)&long long v164 = &v171;
                  v30 = (void *)AppleCVALibrary();
                  v31 = dlsym(v30, "kCVAFaceTracking_DetectedFaceFaceID");
                  *(void *)(*(void *)(v164 + 8) + 24) = v31;
                  getkCVAFaceTracking_DetectedFaceFaceIDSymbolLoc_ptr = *(void *)(*(void *)(v164 + 8) + 24);
                  v29 = (void *)v172[3];
                }
                _Block_object_dispose(&v171, 8);
                if (!v29)
                {
                  v3 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
                  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "CFStringRef getkCVAFaceTracking_DetectedFaceFaceID(void)"), @"BWFaceTrackingNode.m", 126, @"%s", dlerror());
                  goto LABEL_146;
                }
                [v27 setObject:v28 forKeyedSubscript:*v29];
              }
              uint64_t v32 = [v26 objectForKeyedSubscript:v23];
              if (v32) {
                [v27 setObject:v32 forKeyedSubscript:getkCVAFaceTracking_Timestamp()];
              }
              uint64_t v33 = [v26 objectForKeyedSubscript:v24];
              if (v33)
              {
                uint64_t v171 = 0;
                v172 = &v171;
                uint64_t v173 = 0x2020000000;
                v34 = (void *)getkCVAFaceTracking_DetectedFaceRectSymbolLoc_ptr;
                uint64_t v174 = getkCVAFaceTracking_DetectedFaceRectSymbolLoc_ptr;
                if (!getkCVAFaceTracking_DetectedFaceRectSymbolLoc_ptr)
                {
                  targeta[0] = (CMAttachmentBearerRef)MEMORY[0x1E4F143A8];
                  targeta[1] = (CMAttachmentBearerRef)3221225472;
                  *(void *)&long long v163 = __getkCVAFaceTracking_DetectedFaceRectSymbolLoc_block_invoke;
                  *((void *)&v163 + 1) = &unk_1E5C24978;
                  *(void *)&long long v164 = &v171;
                  v35 = (void *)AppleCVALibrary();
                  v36 = dlsym(v35, "kCVAFaceTracking_DetectedFaceRect");
                  *(void *)(*(void *)(v164 + 8) + 24) = v36;
                  getkCVAFaceTracking_DetectedFaceRectSymbolLoc_ptr = *(void *)(*(void *)(v164 + 8) + 24);
                  v34 = (void *)v172[3];
                }
                _Block_object_dispose(&v171, 8);
                if (!v34)
                {
                  v3 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
                  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "CFStringRef getkCVAFaceTracking_DetectedFaceRect(void)"), @"BWFaceTrackingNode.m", 128, @"%s", dlerror());
                  goto LABEL_146;
                }
                [v27 setObject:v33 forKeyedSubscript:*v34];
              }
              uint64_t v37 = [v26 objectForKeyedSubscript:v25];
              if (v37)
              {
                uint64_t v171 = 0;
                v172 = &v171;
                uint64_t v173 = 0x2020000000;
                v38 = (void *)getkCVAFaceTracking_DetectedFaceAngleInfoRollSymbolLoc_ptr;
                uint64_t v174 = getkCVAFaceTracking_DetectedFaceAngleInfoRollSymbolLoc_ptr;
                if (!getkCVAFaceTracking_DetectedFaceAngleInfoRollSymbolLoc_ptr)
                {
                  targeta[0] = (CMAttachmentBearerRef)MEMORY[0x1E4F143A8];
                  targeta[1] = (CMAttachmentBearerRef)3221225472;
                  *(void *)&long long v163 = __getkCVAFaceTracking_DetectedFaceAngleInfoRollSymbolLoc_block_invoke;
                  *((void *)&v163 + 1) = &unk_1E5C24978;
                  *(void *)&long long v164 = &v171;
                  v39 = (void *)AppleCVALibrary();
                  v40 = dlsym(v39, "kCVAFaceTracking_DetectedFaceAngleInfoRoll");
                  *(void *)(*(void *)(v164 + 8) + 24) = v40;
                  getkCVAFaceTracking_DetectedFaceAngleInfoRollSymbolLoc_ptr = *(void *)(*(void *)(v164 + 8) + 24);
                  v38 = (void *)v172[3];
                }
                _Block_object_dispose(&v171, 8);
                if (!v38)
                {
                  v3 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
                  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "CFStringRef getkCVAFaceTracking_DetectedFaceAngleInfoRoll(void)"), @"BWFaceTrackingNode.m", 130, @"%s", dlerror());
                  goto LABEL_146;
                }
                [v27 setObject:v37 forKeyedSubscript:*v38];
              }
              [v149 addObject:v27];
              target = (char *)target + 1;
            }
            while ((void *)v5 != target);
            uint64_t v5 = [obj countByEnumeratingWithState:&v158 objects:v186 count:16];
            if (v5) {
              continue;
            }
            break;
          }
        }

        target = v141;
        uint64_t v5 = v142;
        id v8 = v143;
      }
      targeta[0] = 0;
      targeta[1] = targeta;
      *(void *)&long long v163 = 0x2020000000;
      v41 = (void *)getkCVAFaceTracking_DetectedFacesArraySymbolLoc_ptr;
      *((void *)&v163 + 1) = getkCVAFaceTracking_DetectedFacesArraySymbolLoc_ptr;
      if (!getkCVAFaceTracking_DetectedFacesArraySymbolLoc_ptr)
      {
        time.duration.value = MEMORY[0x1E4F143A8];
        *(void *)&time.duration.timescale = 3221225472;
        time.duration.epoch = (CMTimeEpoch)__getkCVAFaceTracking_DetectedFacesArraySymbolLoc_block_invoke;
        time.presentationTimeStamp.value = (CMTimeValue)&unk_1E5C24978;
        *(void *)&time.presentationTimeStamp.timescale = targeta;
        v42 = (void *)AppleCVALibrary();
        v43 = dlsym(v42, "kCVAFaceTracking_DetectedFacesArray");
        *(void *)(*(void *)(*(void *)&time.presentationTimeStamp.timescale + 8) + 24) = v43;
        getkCVAFaceTracking_DetectedFacesArraySymbolLoc_ptr = *(void *)(*(void *)(*(void *)&time.presentationTimeStamp.timescale
                                                                                    + 8)
                                                                        + 24);
        v41 = (void *)*((void *)targeta[1] + 3);
      }
      _Block_object_dispose(targeta, 8);
      if (v41)
      {
        [v8 setObject:v149 forKeyedSubscript:*v41];
        v157[0] = MEMORY[0x1E4F143A8];
        v157[1] = 3221225472;
        v157[2] = __43__BWFaceTrackingNode__processSampleBuffer___block_invoke;
        v157[3] = &unk_1E5C25B28;
        v157[4] = v5;
        v157[5] = &v165;
        id v44 = (id)[v157 copy];
        targeta[0] = 0;
        targeta[1] = targeta;
        *(void *)&long long v163 = 0x2020000000;
        v45 = (void *)getkCVAFaceTracking_CallbackSymbolLoc_ptr;
        *((void *)&v163 + 1) = getkCVAFaceTracking_CallbackSymbolLoc_ptr;
        if (!getkCVAFaceTracking_CallbackSymbolLoc_ptr)
        {
          time.duration.value = MEMORY[0x1E4F143A8];
          *(void *)&time.duration.timescale = 3221225472;
          time.duration.epoch = (CMTimeEpoch)__getkCVAFaceTracking_CallbackSymbolLoc_block_invoke;
          time.presentationTimeStamp.value = (CMTimeValue)&unk_1E5C24978;
          *(void *)&time.presentationTimeStamp.timescale = targeta;
          v46 = (void *)AppleCVALibrary();
          v47 = dlsym(v46, "kCVAFaceTracking_Callback");
          *(void *)(*(void *)(*(void *)&time.presentationTimeStamp.timescale + 8) + 24) = v47;
          getkCVAFaceTracking_CallbackSymbolLoc_ptr = *(void *)(*(void *)(*(void *)&time.presentationTimeStamp.timescale
                                                                            + 8)
                                                                + 24);
          v45 = (void *)*((void *)targeta[1] + 3);
        }
        _Block_object_dispose(targeta, 8);
        if (v45)
        {
          [v8 setObject:v44 forKeyedSubscript:*v45];
          long long v155 = 0u;
          long long v156 = 0u;
          long long v154 = 0u;
          v48 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F1F218], 0);
          v49 = v48;
          if (!v48 || [v48 length] != 48) {
            goto LABEL_138;
          }
          objc_msgSend(v49, "getBytes:length:", &v154, objc_msgSend(v49, "length"));
          LODWORD(v50) = v154;
          int v51 = DWORD1(v155);
          double v150 = *(double *)&v156;
          v184[0] = [NSNumber numberWithFloat:v50];
          v184[1] = &unk_1EFAFEA78;
          v184[2] = [NSNumber numberWithFloat:v150];
          v185[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v184 count:3];
          v183[0] = &unk_1EFAFEA78;
          LODWORD(v52) = v51;
          uint64_t v53 = [NSNumber numberWithFloat:v52];
          HIDWORD(v54) = HIDWORD(v150);
          LODWORD(v54) = HIDWORD(v150);
          v183[1] = v53;
          v183[2] = [NSNumber numberWithFloat:v54];
          v185[1] = [MEMORY[0x1E4F1C978] arrayWithObjects:v183 count:3];
          v185[2] = &unk_1EFB02E88;
          uint64_t v55 = [MEMORY[0x1E4F1C978] arrayWithObjects:v185 count:3];
          v181[0] = getkCVAFaceTracking_Rotation();
          v182[0] = &unk_1EFB02F00;
          v181[1] = getkCVAFaceTracking_Translation();
          v182[1] = &unk_1EFB02EA0;
          uint64_t v56 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v182 forKeys:v181 count:2];
          v179[0] = getkCVAFaceTracking_Intrinsics();
          v180[0] = v55;
          v179[1] = getkCVAFaceTracking_Extrinsics();
          v180[1] = v56;
          uint64_t v57 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v180 forKeys:v179 count:2];
          targeta[0] = 0;
          targeta[1] = targeta;
          *(void *)&long long v163 = 0x2020000000;
          v58 = (void *)getkCVAFaceTracking_CameraColorSymbolLoc_ptr;
          *((void *)&v163 + 1) = getkCVAFaceTracking_CameraColorSymbolLoc_ptr;
          if (!getkCVAFaceTracking_CameraColorSymbolLoc_ptr)
          {
            time.duration.value = MEMORY[0x1E4F143A8];
            *(void *)&time.duration.timescale = 3221225472;
            time.duration.epoch = (CMTimeEpoch)__getkCVAFaceTracking_CameraColorSymbolLoc_block_invoke;
            time.presentationTimeStamp.value = (CMTimeValue)&unk_1E5C24978;
            *(void *)&time.presentationTimeStamp.timescale = targeta;
            v59 = (void *)AppleCVALibrary();
            v60 = dlsym(v59, "kCVAFaceTracking_CameraColor");
            *(void *)(*(void *)(*(void *)&time.presentationTimeStamp.timescale + 8) + 24) = v60;
            getkCVAFaceTracking_CameraColorSymbolLoc_ptr = *(void *)(*(void *)(*(void *)&time.presentationTimeStamp.timescale
                                                                                 + 8)
                                                                     + 24);
            v58 = (void *)*((void *)targeta[1] + 3);
          }
          _Block_object_dispose(targeta, 8);
          if (v58)
          {
            [v143 setObject:v57 forKeyedSubscript:*v58];
            memset(&v153, 0, sizeof(v153));
            CMSampleBufferGetPresentationTimeStamp(&v153, (CMSampleBufferRef)target);
            CFDictionaryRef v61 = (const __CFDictionary *)[v145 objectForKeyedSubscript:*MEMORY[0x1E4F530C0]];
            if (!v61)
            {
              CFAllocatorRef v62 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
              time.duration = v153;
              CFDictionaryRef v61 = CMTimeCopyAsDictionary(&time.duration, v62);
            }
            [v143 setObject:v61 forKeyedSubscript:getkCVAFaceTracking_Timestamp()];
            uint64_t v63 = objc_msgSend((id)objc_msgSend(v145, "objectForKeyedSubscript:", *MEMORY[0x1E4F54068]), "intValue");
            objc_msgSend((id)objc_msgSend(v145, "objectForKeyedSubscript:", *MEMORY[0x1E4F53E48]), "doubleValue");
            double v65 = v64;
            int v152 = 0;
            FigCaptureComputeImageGainFromMetadata();
            targeta[0] = 0;
            targeta[1] = targeta;
            *(void *)&long long v163 = 0x2020000000;
            v66 = (void *)getkCVAFaceTracking_LuxLevelSymbolLoc_ptr;
            *((void *)&v163 + 1) = getkCVAFaceTracking_LuxLevelSymbolLoc_ptr;
            if (!getkCVAFaceTracking_LuxLevelSymbolLoc_ptr)
            {
              time.duration.value = MEMORY[0x1E4F143A8];
              *(void *)&time.duration.timescale = 3221225472;
              time.duration.epoch = (CMTimeEpoch)__getkCVAFaceTracking_LuxLevelSymbolLoc_block_invoke;
              time.presentationTimeStamp.value = (CMTimeValue)&unk_1E5C24978;
              *(void *)&time.presentationTimeStamp.timescale = targeta;
              v67 = (void *)AppleCVALibrary();
              v68 = dlsym(v67, "kCVAFaceTracking_LuxLevel");
              *(void *)(*(void *)(*(void *)&time.presentationTimeStamp.timescale + 8) + 24) = v68;
              getkCVAFaceTracking_LuxLevelSymbolLoc_ptr = *(void *)(*(void *)(*(void *)&time.presentationTimeStamp.timescale
                                                                                + 8)
                                                                    + 24);
              v66 = (void *)*((void *)targeta[1] + 3);
            }
            _Block_object_dispose(targeta, 8);
            if (v66)
            {
              v177[0] = *v66;
              v178[0] = [NSNumber numberWithInt:v63];
              targeta[0] = 0;
              targeta[1] = targeta;
              *(void *)&long long v163 = 0x2020000000;
              v69 = (void *)getkCVAFaceTracking_ExposureTimeSymbolLoc_ptr;
              *((void *)&v163 + 1) = getkCVAFaceTracking_ExposureTimeSymbolLoc_ptr;
              if (!getkCVAFaceTracking_ExposureTimeSymbolLoc_ptr)
              {
                time.duration.value = MEMORY[0x1E4F143A8];
                *(void *)&time.duration.timescale = 3221225472;
                time.duration.epoch = (CMTimeEpoch)__getkCVAFaceTracking_ExposureTimeSymbolLoc_block_invoke;
                time.presentationTimeStamp.value = (CMTimeValue)&unk_1E5C24978;
                *(void *)&time.presentationTimeStamp.timescale = targeta;
                v70 = (void *)AppleCVALibrary();
                v71 = dlsym(v70, "kCVAFaceTracking_ExposureTime");
                *(void *)(*(void *)(*(void *)&time.presentationTimeStamp.timescale + 8) + 24) = v71;
                getkCVAFaceTracking_ExposureTimeSymbolLoc_ptr = *(void *)(*(void *)(*(void *)&time.presentationTimeStamp.timescale
                                                                                      + 8)
                                                                          + 24);
                v69 = (void *)*((void *)targeta[1] + 3);
              }
              _Block_object_dispose(targeta, 8);
              if (v69)
              {
                v177[1] = *v69;
                v178[1] = [NSNumber numberWithDouble:v65];
                targeta[0] = 0;
                targeta[1] = targeta;
                *(void *)&long long v163 = 0x2020000000;
                v72 = (void *)getkCVAFaceTracking_TotalGainSymbolLoc_ptr;
                *((void *)&v163 + 1) = getkCVAFaceTracking_TotalGainSymbolLoc_ptr;
                if (!getkCVAFaceTracking_TotalGainSymbolLoc_ptr)
                {
                  time.duration.value = MEMORY[0x1E4F143A8];
                  *(void *)&time.duration.timescale = 3221225472;
                  time.duration.epoch = (CMTimeEpoch)__getkCVAFaceTracking_TotalGainSymbolLoc_block_invoke;
                  time.presentationTimeStamp.value = (CMTimeValue)&unk_1E5C24978;
                  *(void *)&time.presentationTimeStamp.timescale = targeta;
                  v73 = (void *)AppleCVALibrary();
                  v74 = dlsym(v73, "kCVAFaceTracking_TotalGain");
                  *(void *)(*(void *)(*(void *)&time.presentationTimeStamp.timescale + 8) + 24) = v74;
                  getkCVAFaceTracking_TotalGainSymbolLoc_ptr = *(void *)(*(void *)(*(void *)&time.presentationTimeStamp.timescale
                                                                                     + 8)
                                                                         + 24);
                  v72 = (void *)*((void *)targeta[1] + 3);
                }
                _Block_object_dispose(targeta, 8);
                if (v72)
                {
                  v177[2] = *v72;
                  LODWORD(v75) = v152;
                  v178[2] = [NSNumber numberWithFloat:v75];
                  uint64_t v76 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v178 forKeys:v177 count:3];
                  targeta[0] = 0;
                  targeta[1] = targeta;
                  *(void *)&long long v163 = 0x2020000000;
                  v77 = (void *)getkCVAFaceTracking_ColorMetaDataSymbolLoc_ptr;
                  *((void *)&v163 + 1) = getkCVAFaceTracking_ColorMetaDataSymbolLoc_ptr;
                  if (!getkCVAFaceTracking_ColorMetaDataSymbolLoc_ptr)
                  {
                    time.duration.value = MEMORY[0x1E4F143A8];
                    *(void *)&time.duration.timescale = 3221225472;
                    time.duration.epoch = (CMTimeEpoch)__getkCVAFaceTracking_ColorMetaDataSymbolLoc_block_invoke;
                    time.presentationTimeStamp.value = (CMTimeValue)&unk_1E5C24978;
                    *(void *)&time.presentationTimeStamp.timescale = targeta;
                    v78 = (void *)AppleCVALibrary();
                    v79 = dlsym(v78, "kCVAFaceTracking_ColorMetaData");
                    *(void *)(*(void *)(*(void *)&time.presentationTimeStamp.timescale + 8) + 24) = v79;
                    getkCVAFaceTracking_ColorMetaDataSymbolLoc_ptr = *(void *)(*(void *)(*(void *)&time.presentationTimeStamp.timescale
                                                                                           + 8)
                                                                               + 24);
                    v77 = (void *)*((void *)targeta[1] + 3);
                  }
                  _Block_object_dispose(targeta, 8);
                  if (v77)
                  {
                    [v143 setObject:v76 forKeyedSubscript:*v77];
                    uint64_t v80 = [NSNumber numberWithBool:*(unsigned __int8 *)(v5 + 236)];
                    targeta[0] = 0;
                    targeta[1] = targeta;
                    *(void *)&long long v163 = 0x2020000000;
                    v81 = (void *)getkCVAFaceTracking_AddMeshSymbolLoc_ptr;
                    *((void *)&v163 + 1) = getkCVAFaceTracking_AddMeshSymbolLoc_ptr;
                    if (!getkCVAFaceTracking_AddMeshSymbolLoc_ptr)
                    {
                      time.duration.value = MEMORY[0x1E4F143A8];
                      *(void *)&time.duration.timescale = 3221225472;
                      time.duration.epoch = (CMTimeEpoch)__getkCVAFaceTracking_AddMeshSymbolLoc_block_invoke;
                      time.presentationTimeStamp.value = (CMTimeValue)&unk_1E5C24978;
                      *(void *)&time.presentationTimeStamp.timescale = targeta;
                      v82 = (void *)AppleCVALibrary();
                      v83 = dlsym(v82, "kCVAFaceTracking_AddMesh");
                      *(void *)(*(void *)(*(void *)&time.presentationTimeStamp.timescale + 8) + 24) = v83;
                      getkCVAFaceTracking_AddMeshSymbolLoc_ptr = *(void *)(*(void *)(*(void *)&time.presentationTimeStamp.timescale
                                                                                       + 8)
                                                                           + 24);
                      v81 = (void *)*((void *)targeta[1] + 3);
                    }
                    _Block_object_dispose(targeta, 8);
                    if (v81)
                    {
                      [v143 setObject:v80 forKeyedSubscript:*v81];
                      uint64_t v84 = [NSNumber numberWithBool:*(unsigned __int8 *)(v5 + 237)];
                      targeta[0] = 0;
                      targeta[1] = targeta;
                      *(void *)&long long v163 = 0x2020000000;
                      v85 = (uint64_t *)getkCVAFaceTracking_AddDebugInfoSymbolLoc_ptr;
                      *((void *)&v163 + 1) = getkCVAFaceTracking_AddDebugInfoSymbolLoc_ptr;
                      if (!getkCVAFaceTracking_AddDebugInfoSymbolLoc_ptr)
                      {
                        time.duration.value = MEMORY[0x1E4F143A8];
                        *(void *)&time.duration.timescale = 3221225472;
                        time.duration.epoch = (CMTimeEpoch)__getkCVAFaceTracking_AddDebugInfoSymbolLoc_block_invoke;
                        time.presentationTimeStamp.value = (CMTimeValue)&unk_1E5C24978;
                        *(void *)&time.presentationTimeStamp.timescale = targeta;
                        v86 = (void *)AppleCVALibrary();
                        v87 = dlsym(v86, "kCVAFaceTracking_AddDebugInfo");
                        *(void *)(*(void *)(*(void *)&time.presentationTimeStamp.timescale + 8) + 24) = v87;
                        getkCVAFaceTracking_AddDebugInfoSymbolLoc_ptr = *(void *)(*(void *)(*(void *)&time.presentationTimeStamp.timescale
                                                                                              + 8)
                                                                                  + 24);
                        v85 = (uint64_t *)*((void *)targeta[1] + 3);
                      }
                      _Block_object_dispose(targeta, 8);
                      if (v85)
                      {
                        uint64_t v88 = *v85;
                        id v8 = v143;
                        [v143 setObject:v84 forKeyedSubscript:v88];
                        uint64_t v89 = *(void *)(v5 + 152);
                        if (v89
                          && (AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(target, v89),
                              (v91 = AttachedMedia) != 0))
                        {
                          v92 = CMSampleBufferGetImageBuffer(AttachedMedia);
                          if (!v92) {
                            goto LABEL_163;
                          }
                          v93 = (void *)CMGetAttachment(v91, @"DepthPixelBufferType", 0);
                          if ([v93 isEqualToString:*MEMORY[0x1E4F537C8]])
                          {
                            targeta[0] = 0;
                            targeta[1] = targeta;
                            *(void *)&long long v163 = 0x2020000000;
                            v94 = (void *)getkCVAFaceTracking_DepthSymbolLoc_ptr;
                            *((void *)&v163 + 1) = getkCVAFaceTracking_DepthSymbolLoc_ptr;
                            if (!getkCVAFaceTracking_DepthSymbolLoc_ptr)
                            {
                              time.duration.value = MEMORY[0x1E4F143A8];
                              *(void *)&time.duration.timescale = 3221225472;
                              time.duration.epoch = (CMTimeEpoch)__getkCVAFaceTracking_DepthSymbolLoc_block_invoke;
                              time.presentationTimeStamp.value = (CMTimeValue)&unk_1E5C24978;
                              *(void *)&time.presentationTimeStamp.timescale = targeta;
                              v95 = (void *)AppleCVALibrary();
                              v96 = dlsym(v95, "kCVAFaceTracking_Depth");
                              *(void *)(*(void *)(*(void *)&time.presentationTimeStamp.timescale + 8) + 24) = v96;
                              getkCVAFaceTracking_DepthSymbolLoc_ptr = *(void *)(*(void *)(*(void *)&time.presentationTimeStamp.timescale
                                                                                             + 8)
                                                                                 + 24);
                              v94 = (void *)*((void *)targeta[1] + 3);
                            }
                            _Block_object_dispose(targeta, 8);
                            if (!v94)
                            {
                              v3 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
                              objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "CFStringRef getkCVAFaceTracking_Depth(void)"), @"BWFaceTrackingNode.m", 88, @"%s", dlerror());
                              goto LABEL_146;
                            }
                            [v143 setObject:v92 forKeyedSubscript:*v94];
                            targeta[0] = 0;
                            targeta[1] = targeta;
                            *(void *)&long long v163 = 0x2020000000;
                            v97 = (void *)getkCVAFaceTracking_DepthUnitSymbolLoc_ptr;
                            *((void *)&v163 + 1) = getkCVAFaceTracking_DepthUnitSymbolLoc_ptr;
                            if (!getkCVAFaceTracking_DepthUnitSymbolLoc_ptr)
                            {
                              time.duration.value = MEMORY[0x1E4F143A8];
                              *(void *)&time.duration.timescale = 3221225472;
                              time.duration.epoch = (CMTimeEpoch)__getkCVAFaceTracking_DepthUnitSymbolLoc_block_invoke;
                              time.presentationTimeStamp.value = (CMTimeValue)&unk_1E5C24978;
                              *(void *)&time.presentationTimeStamp.timescale = targeta;
                              v98 = (void *)AppleCVALibrary();
                              v99 = dlsym(v98, "kCVAFaceTracking_DepthUnit");
                              *(void *)(*(void *)(*(void *)&time.presentationTimeStamp.timescale + 8) + 24) = v99;
                              getkCVAFaceTracking_DepthUnitSymbolLoc_ptr = *(void *)(*(void *)(*(void *)&time.presentationTimeStamp.timescale
                                                                                                 + 8)
                                                                                     + 24);
                              v97 = (void *)*((void *)targeta[1] + 3);
                            }
                            _Block_object_dispose(targeta, 8);
                            if (!v97)
                            {
                              v3 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
                              objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "CFStringRef getkCVAFaceTracking_DepthUnit(void)"), @"BWFaceTrackingNode.m", 90, @"%s", dlerror());
                              goto LABEL_146;
                            }
                            [v143 setObject:&unk_1EFAFEAA8 forKeyedSubscript:*v97];
                          }
                          else
                          {
                            if (![v93 isEqualToString:*MEMORY[0x1E4F537E0]]) {
                              goto LABEL_138;
                            }
                            uint64_t v100 = objc_msgSend(NSNumber, "numberWithShort:", objc_msgSend((id)objc_msgSend((id)CVPixelBufferGetAttributes(), "objectForKeyedSubscript:", *MEMORY[0x1E4F24CF8]), "shortValue"));
                            targeta[0] = 0;
                            targeta[1] = targeta;
                            *(void *)&long long v163 = 0x2020000000;
                            v101 = (void *)getkCVAFaceTracking_DisparityInvalidValueSymbolLoc_ptr;
                            *((void *)&v163 + 1) = getkCVAFaceTracking_DisparityInvalidValueSymbolLoc_ptr;
                            if (!getkCVAFaceTracking_DisparityInvalidValueSymbolLoc_ptr)
                            {
                              time.duration.value = MEMORY[0x1E4F143A8];
                              *(void *)&time.duration.timescale = 3221225472;
                              time.duration.epoch = (CMTimeEpoch)__getkCVAFaceTracking_DisparityInvalidValueSymbolLoc_block_invoke;
                              time.presentationTimeStamp.value = (CMTimeValue)&unk_1E5C24978;
                              *(void *)&time.presentationTimeStamp.timescale = targeta;
                              v102 = (void *)AppleCVALibrary();
                              v103 = dlsym(v102, "kCVAFaceTracking_DisparityInvalidValue");
                              *(void *)(*(void *)(*(void *)&time.presentationTimeStamp.timescale + 8) + 24) = v103;
                              getkCVAFaceTracking_DisparityInvalidValueSymbolLoc_ptr = *(void *)(*(void *)(*(void *)&time.presentationTimeStamp.timescale + 8)
                                                                                                 + 24);
                              v101 = (void *)*((void *)targeta[1] + 3);
                            }
                            _Block_object_dispose(targeta, 8);
                            if (!v101)
                            {
                              v3 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
                              objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "CFStringRef getkCVAFaceTracking_DisparityInvalidValue(void)"), @"BWFaceTrackingNode.m", 96, @"%s", dlerror());
                              goto LABEL_146;
                            }
                            [v143 setObject:v100 forKeyedSubscript:*v101];
                            v104 = (void *)CMGetAttachment(v91, (CFStringRef)*MEMORY[0x1E4F52FE8], 0);
                            objc_msgSend((id)objc_msgSend(v104, "objectForKeyedSubscript:", *MEMORY[0x1E4F537D8]), "floatValue");
                            uint64_t v105 = objc_msgSend(NSNumber, "numberWithFloat:");
                            targeta[0] = 0;
                            targeta[1] = targeta;
                            *(void *)&long long v163 = 0x2020000000;
                            v106 = (void *)getkCVAFaceTracking_DisparityNormalizationOffsetSymbolLoc_ptr;
                            *((void *)&v163 + 1) = getkCVAFaceTracking_DisparityNormalizationOffsetSymbolLoc_ptr;
                            if (!getkCVAFaceTracking_DisparityNormalizationOffsetSymbolLoc_ptr)
                            {
                              time.duration.value = MEMORY[0x1E4F143A8];
                              *(void *)&time.duration.timescale = 3221225472;
                              time.duration.epoch = (CMTimeEpoch)__getkCVAFaceTracking_DisparityNormalizationOffsetSymbolLoc_block_invoke;
                              time.presentationTimeStamp.value = (CMTimeValue)&unk_1E5C24978;
                              *(void *)&time.presentationTimeStamp.timescale = targeta;
                              v107 = (void *)AppleCVALibrary();
                              v108 = dlsym(v107, "kCVAFaceTracking_DisparityNormalizationOffset");
                              *(void *)(*(void *)(*(void *)&time.presentationTimeStamp.timescale + 8) + 24) = v108;
                              getkCVAFaceTracking_DisparityNormalizationOffsetSymbolLoc_ptr = *(void *)(*(void *)(*(void *)&time.presentationTimeStamp.timescale + 8) + 24);
                              v106 = (void *)*((void *)targeta[1] + 3);
                            }
                            _Block_object_dispose(targeta, 8);
                            if (!v106)
                            {
                              v3 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
                              objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "CFStringRef getkCVAFaceTracking_DisparityNormalizationOffset(void)"), @"BWFaceTrackingNode.m", 94, @"%s", dlerror());
                              goto LABEL_146;
                            }
                            id v8 = v143;
                            [v143 setObject:v105 forKeyedSubscript:*v106];
                            objc_msgSend((id)objc_msgSend(v104, "objectForKeyedSubscript:", *MEMORY[0x1E4F537D0]), "floatValue");
                            uint64_t v109 = objc_msgSend(NSNumber, "numberWithFloat:");
                            targeta[0] = 0;
                            targeta[1] = targeta;
                            *(void *)&long long v163 = 0x2020000000;
                            v110 = (void *)getkCVAFaceTracking_DisparityNormalizationMultiplierSymbolLoc_ptr;
                            *((void *)&v163 + 1) = getkCVAFaceTracking_DisparityNormalizationMultiplierSymbolLoc_ptr;
                            if (!getkCVAFaceTracking_DisparityNormalizationMultiplierSymbolLoc_ptr)
                            {
                              time.duration.value = MEMORY[0x1E4F143A8];
                              *(void *)&time.duration.timescale = 3221225472;
                              time.duration.epoch = (CMTimeEpoch)__getkCVAFaceTracking_DisparityNormalizationMultiplierSymbolLoc_block_invoke;
                              time.presentationTimeStamp.value = (CMTimeValue)&unk_1E5C24978;
                              *(void *)&time.presentationTimeStamp.timescale = targeta;
                              v111 = (void *)AppleCVALibrary();
                              v112 = dlsym(v111, "kCVAFaceTracking_DisparityNormalizationMultiplier");
                              *(void *)(*(void *)(*(void *)&time.presentationTimeStamp.timescale + 8) + 24) = v112;
                              getkCVAFaceTracking_DisparityNormalizationMultiplierSymbolLoc_ptr = *(void *)(*(void *)(*(void *)&time.presentationTimeStamp.timescale + 8) + 24);
                              v110 = (void *)*((void *)targeta[1] + 3);
                            }
                            _Block_object_dispose(targeta, 8);
                            if (!v110)
                            {
                              v3 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
                              objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "CFStringRef getkCVAFaceTracking_DisparityNormalizationMultiplier(void)"), @"BWFaceTrackingNode.m", 98, @"%s", dlerror());
                              goto LABEL_146;
                            }
                            [v143 setObject:v109 forKeyedSubscript:*v110];
                            targeta[0] = 0;
                            targeta[1] = targeta;
                            *(void *)&long long v163 = 0x2020000000;
                            v113 = (void *)getkCVAFaceTracking_NormalizedDisparitySymbolLoc_ptr;
                            *((void *)&v163 + 1) = getkCVAFaceTracking_NormalizedDisparitySymbolLoc_ptr;
                            if (!getkCVAFaceTracking_NormalizedDisparitySymbolLoc_ptr)
                            {
                              time.duration.value = MEMORY[0x1E4F143A8];
                              *(void *)&time.duration.timescale = 3221225472;
                              time.duration.epoch = (CMTimeEpoch)__getkCVAFaceTracking_NormalizedDisparitySymbolLoc_block_invoke;
                              time.presentationTimeStamp.value = (CMTimeValue)&unk_1E5C24978;
                              *(void *)&time.presentationTimeStamp.timescale = targeta;
                              v114 = (void *)AppleCVALibrary();
                              v115 = dlsym(v114, "kCVAFaceTracking_NormalizedDisparity");
                              *(void *)(*(void *)(*(void *)&time.presentationTimeStamp.timescale + 8) + 24) = v115;
                              getkCVAFaceTracking_NormalizedDisparitySymbolLoc_ptr = *(void *)(*(void *)(*(void *)&time.presentationTimeStamp.timescale + 8)
                                                                                               + 24);
                              v113 = (void *)*((void *)targeta[1] + 3);
                            }
                            _Block_object_dispose(targeta, 8);
                            if (!v113)
                            {
                              v3 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
                              objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "CFStringRef getkCVAFaceTracking_NormalizedDisparity(void)"), @"BWFaceTrackingNode.m", 92, @"%s", dlerror());
                              goto LABEL_146;
                            }
                            [v143 setObject:v92 forKeyedSubscript:*v113];
                          }
                          targeta[0] = 0;
                          targeta[1] = targeta;
                          *(void *)&long long v163 = 0x2020000000;
                          v116 = (void *)getkCVAFaceTracking_SetCameraDepthFromColorSymbolLoc_ptr;
                          *((void *)&v163 + 1) = getkCVAFaceTracking_SetCameraDepthFromColorSymbolLoc_ptr;
                          if (!getkCVAFaceTracking_SetCameraDepthFromColorSymbolLoc_ptr)
                          {
                            time.duration.value = MEMORY[0x1E4F143A8];
                            *(void *)&time.duration.timescale = 3221225472;
                            time.duration.epoch = (CMTimeEpoch)__getkCVAFaceTracking_SetCameraDepthFromColorSymbolLoc_block_invoke;
                            time.presentationTimeStamp.value = (CMTimeValue)&unk_1E5C24978;
                            *(void *)&time.presentationTimeStamp.timescale = targeta;
                            v117 = (void *)AppleCVALibrary();
                            v118 = dlsym(v117, "kCVAFaceTracking_SetCameraDepthFromColor");
                            *(void *)(*(void *)(*(void *)&time.presentationTimeStamp.timescale + 8) + 24) = v118;
                            getkCVAFaceTracking_SetCameraDepthFromColorSymbolLoc_ptr = *(void *)(*(void *)(*(void *)&time.presentationTimeStamp.timescale + 8)
                                                                                                 + 24);
                            v116 = (void *)*((void *)targeta[1] + 3);
                          }
                          _Block_object_dispose(targeta, 8);
                          if (!v116)
                          {
                            v3 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
                            objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "CFStringRef getkCVAFaceTracking_SetCameraDepthFromColor(void)"), @"BWFaceTrackingNode.m", 104, @"%s", dlerror());
                            goto LABEL_146;
                          }
                          [v8 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:*v116];
                          size_t Width = CVPixelBufferGetWidth(cf);
                          size_t Height = CVPixelBufferGetHeight(cf);
                          size_t v121 = CVPixelBufferGetWidth(v92);
                          size_t v122 = CVPixelBufferGetHeight(v92);
                          uint64_t v123 = -[BWFaceTrackingNode _depthIntrinsicsExtrinsicsFromRGBIntrisics:colorWidth:colorHeight:depthWidth:depthHeight:](v5, Width, Height, v121, v122, *(double *)&v154, *(double *)&v155, *(double *)&v156);
                          targeta[0] = 0;
                          targeta[1] = targeta;
                          *(void *)&long long v163 = 0x2020000000;
                          v124 = (void *)getkCVAFaceTracking_CameraDepthSymbolLoc_ptr;
                          *((void *)&v163 + 1) = getkCVAFaceTracking_CameraDepthSymbolLoc_ptr;
                          if (!getkCVAFaceTracking_CameraDepthSymbolLoc_ptr)
                          {
                            time.duration.value = MEMORY[0x1E4F143A8];
                            *(void *)&time.duration.timescale = 3221225472;
                            time.duration.epoch = (CMTimeEpoch)__getkCVAFaceTracking_CameraDepthSymbolLoc_block_invoke;
                            time.presentationTimeStamp.value = (CMTimeValue)&unk_1E5C24978;
                            *(void *)&time.presentationTimeStamp.timescale = targeta;
                            v125 = (void *)AppleCVALibrary();
                            v126 = dlsym(v125, "kCVAFaceTracking_CameraDepth");
                            *(void *)(*(void *)(*(void *)&time.presentationTimeStamp.timescale + 8) + 24) = v126;
                            getkCVAFaceTracking_CameraDepthSymbolLoc_ptr = *(void *)(*(void *)(*(void *)&time.presentationTimeStamp.timescale
                                                                                                 + 8)
                                                                                     + 24);
                            v124 = (void *)*((void *)targeta[1] + 3);
                          }
                          _Block_object_dispose(targeta, 8);
                          if (!v124)
                          {
                            v3 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
                            objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "CFStringRef getkCVAFaceTracking_CameraDepth(void)"), @"BWFaceTrackingNode.m", 102, @"%s", dlerror());
                            goto LABEL_146;
                          }
                          [v8 setObject:v123 forKeyedSubscript:*v124];
                        }
                        else
                        {
                          v92 = 0;
                        }
                        if (getkCVAFaceTracking_DepthMetaData() && getkCVAFaceTracking_StructuredLightOccluded())
                        {
                          v127 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F55B30], 0);
                          if (v127 && [v127 intValue] == 1) {
                            *(unsigned char *)(v5 + 145) = 1;
                          }
                          if (v92) {
                            *(unsigned char *)(v5 + 145) = 0;
                          }
                          if (*(unsigned char *)(v5 + 145))
                          {
                            uint64_t v175 = getkCVAFaceTracking_StructuredLightOccluded();
                            uint64_t v176 = MEMORY[0x1E4F1CC38];
                            uint64_t v128 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v176 forKeys:&v175 count:1];
                          }
                          else
                          {
                            uint64_t v128 = 0;
                          }
                          [v8 setObject:v128 forKeyedSubscript:getkCVAFaceTracking_DepthMetaData()];
                        }
                        if (*MEMORY[0x1E4F1EBA8] == 1) {
                          kdebug_trace();
                        }
                        uint64_t v129 = *(void *)(v5 + 96);
                        targeta[0] = 0;
                        targeta[1] = targeta;
                        *(void *)&long long v163 = 0x2020000000;
                        v130 = (unsigned int (*)(uint64_t, id))getCVAFaceTrackingProcessSymbolLoc_ptr;
                        *((void *)&v163 + 1) = getCVAFaceTrackingProcessSymbolLoc_ptr;
                        if (!getCVAFaceTrackingProcessSymbolLoc_ptr)
                        {
                          time.duration.value = MEMORY[0x1E4F143A8];
                          *(void *)&time.duration.timescale = 3221225472;
                          time.duration.epoch = (CMTimeEpoch)__getCVAFaceTrackingProcessSymbolLoc_block_invoke;
                          time.presentationTimeStamp.value = (CMTimeValue)&unk_1E5C24978;
                          *(void *)&time.presentationTimeStamp.timescale = targeta;
                          v131 = (void *)AppleCVALibrary();
                          v132 = dlsym(v131, "CVAFaceTrackingProcess");
                          *(void *)(*(void *)(*(void *)&time.presentationTimeStamp.timescale + 8) + 24) = v132;
                          getCVAFaceTrackingProcessSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)&time.presentationTimeStamp.timescale
                                                                                            + 8)
                                                                                + 24);
                          v130 = (unsigned int (*)(uint64_t, id))*((void *)targeta[1] + 3);
                        }
                        _Block_object_dispose(targeta, 8);
                        if (v130)
                        {
                          if (v130(v129, v8)) {
                            goto LABEL_138;
                          }
                          dispatch_semaphore_wait(*(dispatch_semaphore_t *)(v5 + 120), 0xFFFFFFFFFFFFFFFFLL);
                          v133 = (void *)v166[5];
                          targeta[0] = 0;
                          targeta[1] = targeta;
                          *(void *)&long long v163 = 0x2020000000;
                          v134 = (void *)getkCVAFaceTracking_FailureTypeSymbolLoc_ptr;
                          *((void *)&v163 + 1) = getkCVAFaceTracking_FailureTypeSymbolLoc_ptr;
                          if (!getkCVAFaceTracking_FailureTypeSymbolLoc_ptr)
                          {
                            time.duration.value = MEMORY[0x1E4F143A8];
                            *(void *)&time.duration.timescale = 3221225472;
                            time.duration.epoch = (CMTimeEpoch)__getkCVAFaceTracking_FailureTypeSymbolLoc_block_invoke;
                            time.presentationTimeStamp.value = (CMTimeValue)&unk_1E5C24978;
                            *(void *)&time.presentationTimeStamp.timescale = targeta;
                            v135 = (void *)AppleCVALibrary();
                            v136 = dlsym(v135, "kCVAFaceTracking_FailureType");
                            *(void *)(*(void *)(*(void *)&time.presentationTimeStamp.timescale + 8) + 24) = v136;
                            getkCVAFaceTracking_FailureTypeSymbolLoc_ptr = *(void *)(*(void *)(*(void *)&time.presentationTimeStamp.timescale
                                                                                                 + 8)
                                                                                     + 24);
                            v134 = (void *)*((void *)targeta[1] + 3);
                          }
                          _Block_object_dispose(targeta, 8);
                          if (v134)
                          {
                            v137 = (void *)[v133 objectForKeyedSubscript:*v134];
                            if (!v137 || (int)[v137 intValue] <= 0)
                            {
                              if (*(unsigned char *)(v5 + 146))
                              {
                                CMSetAttachment(target, (CFStringRef)*MEMORY[0x1E4F531A0], (CFTypeRef)v166[5], 1u);
                              }
                              else
                              {
                                *(_OWORD *)&time.duration.value = *MEMORY[0x1E4F1F9F8];
                                time.duration.epoch = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
                                time.presentationTimeStamp = v153;
                                time.decodeTimeStamp = time.duration;
                                targeta[0] = 0;
                                OSStatus v138 = CMSampleBufferCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 1u, 0, 0, 0, 0, 1, &time, 0, 0, (CMSampleBufferRef *)targeta);
                                if (targeta[0] && !v138)
                                {
                                  CMSetAttachment(targeta[0], (CFStringRef)*MEMORY[0x1E4F531A0], (CFTypeRef)v166[5], 1u);
                                  [*(id *)(v5 + 16) emitSampleBuffer:targeta[0]];
                                  CFRelease(targeta[0]);
                                }
                              }
                            }
                            goto LABEL_138;
                          }
                          v3 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
                          objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "CFStringRef getkCVAFaceTracking_FailureType(void)"), @"BWFaceTrackingNode.m", 134, @"%s", dlerror());
                        }
                        else
                        {
                          v3 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
                          objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "int soft_CVAFaceTrackingProcess(CVAFaceTrackingRef, CFDictionaryRef)"), @"BWFaceTrackingNode.m", 136, @"%s", dlerror());
                        }
                      }
                      else
                      {
                        v3 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
                        objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "CFStringRef getkCVAFaceTracking_AddDebugInfo(void)"), @"BWFaceTrackingNode.m", 122, @"%s", dlerror());
                      }
                    }
                    else
                    {
                      v3 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
                      objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "CFStringRef getkCVAFaceTracking_AddMesh(void)"), @"BWFaceTrackingNode.m", 120, @"%s", dlerror());
                    }
                  }
                  else
                  {
                    v3 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
                    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "CFStringRef getkCVAFaceTracking_ColorMetaData(void)"), @"BWFaceTrackingNode.m", 108, @"%s", dlerror());
                  }
                }
                else
                {
                  v3 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
                  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "CFStringRef getkCVAFaceTracking_TotalGain(void)"), @"BWFaceTrackingNode.m", 114, @"%s", dlerror());
                }
              }
              else
              {
                v3 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
                objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "CFStringRef getkCVAFaceTracking_ExposureTime(void)"), @"BWFaceTrackingNode.m", 112, @"%s", dlerror());
              }
            }
            else
            {
              v3 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
              objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "CFStringRef getkCVAFaceTracking_LuxLevel(void)"), @"BWFaceTrackingNode.m", 110, @"%s", dlerror());
            }
          }
          else
          {
            v3 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
            objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "CFStringRef getkCVAFaceTracking_CameraColor(void)"), @"BWFaceTrackingNode.m", 100, @"%s", dlerror());
          }
        }
        else
        {
          v3 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
          objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "CFStringRef getkCVAFaceTracking_Callback(void)"), @"BWFaceTrackingNode.m", 132, @"%s", dlerror());
        }
      }
      else
      {
        v3 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
        objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "CFStringRef getkCVAFaceTracking_DetectedFacesArray(void)"), @"BWFaceTrackingNode.m", 124, @"%s", dlerror());
      }
    }
    else
    {
      v3 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "CFStringRef getkCVAFaceTracking_Color(void)"), @"BWFaceTrackingNode.m", 86, @"%s", dlerror());
    }
LABEL_146:
    __break(1u);
LABEL_147:
    fig_log_get_emitter();
    v140 = v3;
    LODWORD(sampleTimingArray) = 0;
    FigDebugAssert3();
  }
  fig_log_get_emitter();
  FigDebugAssert3();
LABEL_139:

  if (*(unsigned char *)(v5 + 146)) {
    [*(id *)(v5 + 16) emitSampleBuffer:target];
  }
  _Block_object_dispose(&v165, 8);
}

- (void)setSkipProcessing:(BOOL)a3
{
  self->_skipProcessing = a3;
  if (a3 && !self->_nextSbufQueue) {
    -[BWFaceTrackingNode _releaseDecompressionResources]((uint64_t)self);
  }
}

- (void)_releaseDecompressionResources
{
  if (a1)
  {
    os_unfair_lock_assert_not_owner((const os_unfair_lock *)(a1 + 232));
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 232));

    *(void *)(a1 + 216) = 0;
    v2 = *(const void **)(a1 + 224);
    if (v2)
    {
      CFRelease(v2);
      *(void *)(a1 + 224) = 0;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 232));
  }
}

- (void)setUsesFaceRecognition:(BOOL)a3
{
  self->_faceTrackingUsesFaceRecognition = a3;
}

- (void)setTrackingFailureFieldOfViewModifier:(float)a3
{
  self->_faceTrackingFailureFieldOfViewModifier = a3;
}

- (void)setOrientation:(int)a3
{
  self->_orientation = a3;
}

- (void)setNetworkFailureThresholdMultiplier:(float)a3
{
  self->_faceTrackingNetworkFailureThresholdMultiplier = a3;
}

- (void)setMirrored:(BOOL)a3
{
  self->_mirrored = a3;
}

- (void)setMaxFaces:(int)a3
{
  self->_faceTrackingMaxFaces = a3;
}

- (void)setFrontCamera:(BOOL)a3
{
  self->_frontCamera = a3;
}

- (void)setFaceTrackingPlusEnabled:(BOOL)a3
{
  self->_faceTrackingPlusEnabled = a3;
}

- (BWFaceTrackingNode)initWithFigThreadPriority:(unsigned int)a3 pearlModuleType:(int)a4 useUnfilteredDepth:(BOOL)a5 queueDepth:(unsigned int)a6 passthroughInputs:(BOOL)a7 allowPixelTransfer:(BOOL)a8
{
  uint64_t v10 = *(void *)&a6;
  BOOL v11 = a5;
  v24[1] = *MEMORY[0x1E4F143B8];
  v23.receiver = self;
  v23.super_class = (Class)BWFaceTrackingNode;
  v13 = [(BWNode *)&v23 init];
  if (v13)
  {
    v13->_processingSemaphore = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
    v13->_faceTrackingMachThreadPriority = FigThreadGetMachThreadPriorityValue();
    v13->_pearlModuleType = a4;
    v13->_faceTrackingFailureFieldOfViewModifier = -1.0;
    v13->_BOOL passthroughInputs = a7;
    if (v13->_pearlModuleType)
    {
      v13->_depthAttachedMediaKey = (NSString *)@"Depth";
      if (v11 && v13->_pearlModuleType == 2) {
        v13->_depthAttachedMediaKey = (NSString *)@"UnfilteredDepth";
      }
    }
    if (v10
      && (v13->_processingLock._os_unfair_lock_opaque = 0,
          v13->_processingQueue = (OS_dispatch_queue *)FigDispatchQueueCreateWithPriority(),
          CMSimpleQueueCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v10, &v13->_nextSbufQueue)))
    {
      fig_log_get_emitter();
      FigDebugAssert3();

      return 0;
    }
    else
    {
      CMTime v14 = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v13];
      [(BWNodeInput *)v14 setRetainedBufferCount:v10];
      [(BWNodeInput *)v14 setPassthroughMode:v13->_passthroughInputs];
      if (!a8)
      {
        CMTime v15 = objc_alloc_init(BWVideoFormatRequirements);
        [(BWVideoFormatRequirements *)v15 setSupportedPixelFormats:&unk_1EFB02E58];
        [(BWNodeInput *)v14 setFormatRequirements:v15];
      }
      if (v13->_depthAttachedMediaKey)
      {
        v16 = objc_alloc_init(BWNodeInputMediaConfiguration);
        int v17 = objc_alloc_init(BWVideoFormatRequirements);
        [(BWVideoFormatRequirements *)v17 setSupportedPixelFormats:&unk_1EFB02E70];
        if (v13->_nextSbufQueue) {
          [(BWNodeInputMediaConfiguration *)v16 setRetainedBufferCount:1];
        }
        [(BWNodeInputMediaConfiguration *)v16 setFormatRequirements:v17];
        [(BWNodeInput *)v14 setMediaConfiguration:v16 forAttachedMediaKey:v13->_depthAttachedMediaKey];
      }
      [(BWNode *)v13 addInput:v14];
      BOOL passthroughInputs = v13->_passthroughInputs;
      int v19 = [BWNodeOutput alloc];
      if (passthroughInputs)
      {
        int v20 = [(BWNodeOutput *)v19 initWithMediaType:1986618469 node:v13];
        int v21 = [(BWNodeOutput *)v20 primaryMediaConfiguration];
        [(BWNodeOutputMediaConfiguration *)v21 setFormatRequirements:[(BWNodeInputMediaConfiguration *)[(BWNodeInput *)v14 primaryMediaConfiguration] formatRequirements]];
        [(BWNodeOutputMediaConfiguration *)v21 setPassthroughMode:1];
      }
      else
      {
        int v20 = [(BWNodeOutput *)v19 initWithMediaType:1836016234 node:v13];
        v24[0] = *MEMORY[0x1E4F218A8];
        -[BWNodeOutput setFormat:](v20, "setFormat:", +[BWMetadataObjectFormat formatWithMetadataIdentifiers:](BWMetadataObjectFormat, "formatWithMetadataIdentifiers:", [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1]));
      }
      [(BWNode *)v13 addOutput:v20];
      v13->_addMesh = 1;
      v13->_addDebugInfo = 0;
      v13->_decompressionLock._os_unfair_lock_opaque = 0;
    }
  }
  return v13;
}

+ (void)initialize
{
}

- (void)dealloc
{
  faceTrackingRef = self->_faceTrackingRef;
  if (faceTrackingRef) {
    CFRelease(faceTrackingRef);
  }
  nextSbufQueue = self->_nextSbufQueue;
  if (nextSbufQueue) {
    CFRelease(nextSbufQueue);
  }

  -[BWFaceTrackingNode _releaseDecompressionResources]((uint64_t)self);
  v5.receiver = self;
  v5.super_class = (Class)BWFaceTrackingNode;
  [(BWNode *)&v5 dealloc];
}

- (BOOL)skipProcessing
{
  return self->_skipProcessing;
}

- (uint64_t)_prepareDecompressionResources
{
  v1 = a1;
  if (a1)
  {
    os_unfair_lock_assert_owner(a1 + 58);
    if (*(void *)&v1[52]._os_unfair_lock_opaque && !*(void *)&v1[54]._os_unfair_lock_opaque)
    {
      v2 = -[BWPixelBufferPool initWithVideoFormat:capacity:name:memoryPool:]([BWPixelBufferPool alloc], "initWithVideoFormat:capacity:name:memoryPool:", *(void *)&v1[52]._os_unfair_lock_opaque, 1, @"FaceTrackingNode uncompressed image pool", [*(id *)&v1[4]._os_unfair_lock_opaque memoryPool]);
      *(void *)&v1[54]._os_unfair_lock_opaque = v2;
      if (v2)
      {
        v1 = (const os_unfair_lock *)VTPixelTransferSessionCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (VTPixelTransferSessionRef *)&v1[56]);
        if (v1)
        {
          fig_log_get_emitter();
          FigDebugAssert3();
        }
      }
      else
      {
        fig_log_get_emitter();
        FigDebugAssert3();
        return 4294954510;
      }
    }
    else
    {
      return 0;
    }
  }
  return (uint64_t)v1;
}

- (id)nodeSubType
{
  return @"FaceTracking";
}

- (void)didReachEndOfDataForInput:(id)a3
{
  if (self->_nextSbufQueue)
  {
    processingQueue = self->_processingQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__BWFaceTrackingNode_didReachEndOfDataForInput___block_invoke;
    block[3] = &unk_1E5C24430;
    block[4] = self;
    dispatch_async(processingQueue, block);
  }
  else
  {
    output = self->super._output;
    [(BWNodeOutput *)output markEndOfLiveOutput];
  }
}

uint64_t __48__BWFaceTrackingNode_didReachEndOfDataForInput___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) markEndOfLiveOutput];
}

- (void)_startProcessingSampleSampleBuffer:(uint64_t)a1
{
  if (a1)
  {
    v2 = *(NSObject **)(a1 + 112);
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __57__BWFaceTrackingNode__startProcessingSampleSampleBuffer___block_invoke;
    v3[3] = &unk_1E5C24F10;
    v3[4] = a1;
    v3[5] = a2;
    dispatch_async(v2, v3);
  }
}

void __57__BWFaceTrackingNode__startProcessingSampleSampleBuffer___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 40);
  if (v1)
  {
    v3 = (_DWORD *)MEMORY[0x1E4F1EBA8];
    do
    {
      v4 = (void *)MEMORY[0x1A6272C70]();
      if (*v3 == 1) {
        kdebug_trace();
      }
      -[BWFaceTrackingNode _processSampleBuffer:](*(void *)(a1 + 32), v1);
      CFRelease(v1);
      os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 104));
      v1 = (void *)CMSimpleQueueDequeue(*(CMSimpleQueueRef *)(*(void *)(a1 + 32) + 136));
      *(unsigned char *)(*(void *)(a1 + 32) + 128) = v1 != 0;
      os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 104));
      if (*v3 == 1) {
        kdebug_trace();
      }
    }
    while (v1);
  }
}

- (uint64_t)_setupCVA
{
  if (!a1) {
    return 0;
  }
  if (*(void *)(a1 + 136) && !_FigIsCurrentDispatchQueue())
  {
    fig_log_get_emitter();
    uint64_t v37 = v1;
    LODWORD(v36) = 0;
    FigDebugAssert3();
  }
  if (*(unsigned char *)(a1 + 144)) {
    return 0;
  }
  uint64_t v3 = *(void *)(a1 + 152);
  v4 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithCapacity:5];
  uint64_t v5 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 172)];
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x2020000000;
  v6 = (void *)getkCVAFaceTracking_ThreadPrioritySymbolLoc_ptr;
  v41 = (void *)getkCVAFaceTracking_ThreadPrioritySymbolLoc_ptr;
  if (!getkCVAFaceTracking_ThreadPrioritySymbolLoc_ptr)
  {
    uint64_t v7 = (void *)AppleCVALibrary();
    v39[3] = (uint64_t)dlsym(v7, "kCVAFaceTracking_ThreadPriority");
    getkCVAFaceTracking_ThreadPrioritySymbolLoc_ptr = v39[3];
    v6 = (void *)v39[3];
  }
  _Block_object_dispose(&v38, 8);
  if (!v6) {
    -[BWFaceTrackingNode _setupCVA]();
  }
  [v4 setObject:v5 forKeyedSubscript:*v6];
  uint64_t v8 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 184)];
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x2020000000;
  objc_super v9 = (void *)getkCVAFaceTracking_UseRecognitionSymbolLoc_ptr;
  v41 = (void *)getkCVAFaceTracking_UseRecognitionSymbolLoc_ptr;
  if (!getkCVAFaceTracking_UseRecognitionSymbolLoc_ptr)
  {
    uint64_t v10 = (void *)AppleCVALibrary();
    v39[3] = (uint64_t)dlsym(v10, "kCVAFaceTracking_UseRecognition");
    getkCVAFaceTracking_UseRecognitionSymbolLoc_ptr = v39[3];
    objc_super v9 = (void *)v39[3];
  }
  _Block_object_dispose(&v38, 8);
  if (!v9) {
    -[BWFaceTrackingNode _setupCVA]();
  }
  [v4 setObject:v8 forKeyedSubscript:*v9];
  if (*(float *)(a1 + 188) > 0.0)
  {
    uint64_t v11 = objc_msgSend(NSNumber, "numberWithFloat:");
    uint64_t v38 = 0;
    v39 = &v38;
    uint64_t v40 = 0x2020000000;
    v12 = (void *)getkCVAFaceTracking_NetworkFailureThresholdMultiplierSymbolLoc_ptr;
    v41 = (void *)getkCVAFaceTracking_NetworkFailureThresholdMultiplierSymbolLoc_ptr;
    if (!getkCVAFaceTracking_NetworkFailureThresholdMultiplierSymbolLoc_ptr)
    {
      v13 = (void *)AppleCVALibrary();
      v39[3] = (uint64_t)dlsym(v13, "kCVAFaceTracking_NetworkFailureThresholdMultiplier");
      getkCVAFaceTracking_NetworkFailureThresholdMultiplierSymbolLoc_ptr = v39[3];
      v12 = (void *)v39[3];
    }
    _Block_object_dispose(&v38, 8);
    if (!v12) {
      -[BWFaceTrackingNode _setupCVA]();
    }
    [v4 setObject:v11 forKeyedSubscript:*v12];
  }
  if (*(float *)(a1 + 196) >= 0.0)
  {
    uint64_t v14 = objc_msgSend(NSNumber, "numberWithFloat:");
    uint64_t v38 = 0;
    v39 = &v38;
    uint64_t v40 = 0x2020000000;
    CMTime v15 = (void *)getkCVAFaceTracking_TrackingFailureFieldOfViewModifierSymbolLoc_ptr;
    v41 = (void *)getkCVAFaceTracking_TrackingFailureFieldOfViewModifierSymbolLoc_ptr;
    if (!getkCVAFaceTracking_TrackingFailureFieldOfViewModifierSymbolLoc_ptr)
    {
      v16 = (void *)AppleCVALibrary();
      v39[3] = (uint64_t)dlsym(v16, "kCVAFaceTracking_TrackingFailureFieldOfViewModifier");
      getkCVAFaceTracking_TrackingFailureFieldOfViewModifierSymbolLoc_ptr = v39[3];
      CMTime v15 = (void *)v39[3];
    }
    _Block_object_dispose(&v38, 8);
    if (!v15) {
      -[BWFaceTrackingNode _setupCVA]0();
    }
    [v4 setObject:v14 forKeyedSubscript:*v15];
  }
  uint64_t v17 = objc_msgSend(NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 192), v36, v37);
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x2020000000;
  int v18 = (void *)getkCVA_tmrLADzZUFnL94QtJ4Eb9fgiSymbolLoc_ptr;
  v41 = (void *)getkCVA_tmrLADzZUFnL94QtJ4Eb9fgiSymbolLoc_ptr;
  if (!getkCVA_tmrLADzZUFnL94QtJ4Eb9fgiSymbolLoc_ptr)
  {
    int v19 = (void *)AppleCVALibrary();
    v39[3] = (uint64_t)dlsym(v19, "kCVA_tmrLADzZUFnL94QtJ4Eb9fgi");
    getkCVA_tmrLADzZUFnL94QtJ4Eb9fgiSymbolLoc_ptr = v39[3];
    int v18 = (void *)v39[3];
  }
  _Block_object_dispose(&v38, 8);
  if (!v18) {
    -[BWFaceTrackingNode _setupCVA].cold.4();
  }
  [v4 setObject:v17 forKeyedSubscript:*v18];
  uint64_t v20 = [NSNumber numberWithBool:v3 == 0];
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x2020000000;
  int v21 = (void *)getkCVAFaceTracking_ColorOnlySymbolLoc_ptr;
  v41 = (void *)getkCVAFaceTracking_ColorOnlySymbolLoc_ptr;
  if (!getkCVAFaceTracking_ColorOnlySymbolLoc_ptr)
  {
    v22 = (void *)AppleCVALibrary();
    v39[3] = (uint64_t)dlsym(v22, "kCVAFaceTracking_ColorOnly");
    getkCVAFaceTracking_ColorOnlySymbolLoc_ptr = v39[3];
    int v21 = (void *)v39[3];
  }
  _Block_object_dispose(&v38, 8);
  if (!v21) {
    -[BWFaceTrackingNode _setupCVA].cold.5();
  }
  [v4 setObject:v20 forKeyedSubscript:*v21];
  int v23 = *(_DWORD *)(a1 + 176);
  if (v23 == 1 || v23 == 3)
  {
    uint64_t v38 = 0;
    v39 = &v38;
    uint64_t v40 = 0x2020000000;
    uint64_t v24 = (void *)getkCVAFaceTracking_DepthSource_PearlSymbolLoc_ptr;
    v41 = (void *)getkCVAFaceTracking_DepthSource_PearlSymbolLoc_ptr;
    if (!getkCVAFaceTracking_DepthSource_PearlSymbolLoc_ptr)
    {
      v26 = (void *)AppleCVALibrary();
      v39[3] = (uint64_t)dlsym(v26, "kCVAFaceTracking_DepthSource_Pearl");
      getkCVAFaceTracking_DepthSource_PearlSymbolLoc_ptr = v39[3];
      uint64_t v24 = (void *)v39[3];
    }
    _Block_object_dispose(&v38, 8);
    if (!v24) {
      -[BWFaceTrackingNode _setupCVA].cold.9();
    }
    goto LABEL_38;
  }
  if (v23 == 2)
  {
    uint64_t v38 = 0;
    v39 = &v38;
    uint64_t v40 = 0x2020000000;
    uint64_t v24 = (void *)getkCVAFaceTracking_DepthSource_SMPRawSymbolLoc_ptr;
    v41 = (void *)getkCVAFaceTracking_DepthSource_SMPRawSymbolLoc_ptr;
    if (!getkCVAFaceTracking_DepthSource_SMPRawSymbolLoc_ptr)
    {
      uint64_t v25 = (void *)AppleCVALibrary();
      v39[3] = (uint64_t)dlsym(v25, "kCVAFaceTracking_DepthSource_SMPRaw");
      getkCVAFaceTracking_DepthSource_SMPRawSymbolLoc_ptr = v39[3];
      uint64_t v24 = (void *)v39[3];
    }
    _Block_object_dispose(&v38, 8);
    if (!v24) {
      -[BWFaceTrackingNode _setupCVA].cold.8();
    }
LABEL_38:
    [v4 setObject:*v24 forKeyedSubscript:getkCVAFaceTracking_DepthSource()];
  }
  if (*(int *)(a1 + 180) >= 1)
  {
    uint64_t v27 = objc_msgSend(NSNumber, "numberWithInt:");
    uint64_t v38 = 0;
    v39 = &v38;
    uint64_t v40 = 0x2020000000;
    uint64_t v28 = (void *)getkCVAFaceTracking_NumTrackedFacesSymbolLoc_ptr;
    v41 = (void *)getkCVAFaceTracking_NumTrackedFacesSymbolLoc_ptr;
    if (!getkCVAFaceTracking_NumTrackedFacesSymbolLoc_ptr)
    {
      v29 = (void *)AppleCVALibrary();
      v39[3] = (uint64_t)dlsym(v29, "kCVAFaceTracking_NumTrackedFaces");
      getkCVAFaceTracking_NumTrackedFacesSymbolLoc_ptr = v39[3];
      uint64_t v28 = (void *)v39[3];
    }
    _Block_object_dispose(&v38, 8);
    if (!v28) {
      -[BWFaceTrackingNode _setupCVA].cold.6();
    }
    [v4 setObject:v27 forKeyedSubscript:*v28];
  }
  v30 = *(const void **)(a1 + 96);
  if (v30)
  {
    CFRelease(v30);
    *(void *)(a1 + 96) = 0;
  }
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x2020000000;
  v31 = (uint64_t (*)(void, void *, uint64_t))getCVAFaceTrackingCreateSymbolLoc_ptr;
  v41 = getCVAFaceTrackingCreateSymbolLoc_ptr;
  if (!getCVAFaceTrackingCreateSymbolLoc_ptr)
  {
    uint64_t v32 = (void *)AppleCVALibrary();
    v39[3] = (uint64_t)dlsym(v32, "CVAFaceTrackingCreate");
    getCVAFaceTrackingCreateSymbolLoc_ptr = (_UNKNOWN *)v39[3];
    v31 = (uint64_t (*)(void, void *, uint64_t))v39[3];
  }
  _Block_object_dispose(&v38, 8);
  if (!v31) {
    -[BWFaceTrackingNode _setupCVA].cold.7();
  }
  uint64_t v33 = v31(*MEMORY[0x1E4F1CF80], v4, a1 + 96);
  if (v33)
  {
    v35 = *(const void **)(a1 + 96);
    if (v35)
    {
      CFRelease(v35);
      *(void *)(a1 + 96) = 0;
    }
  }
  else
  {
    *(unsigned char *)(a1 + 144) = 1;
  }
  return v33;
}

intptr_t __43__BWFaceTrackingNode__processSampleBuffer___block_invoke(uint64_t a1, void *a2)
{
  if (*MEMORY[0x1E4F1EBA8] == 1) {
    kdebug_trace();
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = a2;
  v4 = *(NSObject **)(*(void *)(a1 + 32) + 120);
  return dispatch_semaphore_signal(v4);
}

- (uint64_t)_depthIntrinsicsExtrinsicsFromRGBIntrisics:(unint64_t)a3 colorWidth:(unint64_t)a4 colorHeight:(unint64_t)a5 depthWidth:(double)a6 depthHeight:(double)a7
{
  v43[3] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    double v9 = a6;
    *(float *)&a6 = (float)a4;
    float v10 = (float)a5;
    float v11 = (float)a4 / (float)a5;
    float v12 = (float)a2;
    float v13 = (float)a3;
    float v14 = (float)a2 / (float)a3;
    float v15 = *((float *)&a7 + 1);
    float v16 = *((float *)&a8 + 1);
    float v17 = v11 - v14;
    if (v11 < v14) {
      float v17 = v14 - v11;
    }
    if (v17 < 0.01)
    {
      float v18 = *(float *)&a6 / v12;
      float v19 = v10 / v13;
      *(float *)&a6 = *(float *)&v9 * (float)(*(float *)&a6 / v12);
      float v32 = *(float *)&a8;
      v42[0] = [NSNumber numberWithFloat:a6];
      v42[1] = &unk_1EFAFEA78;
      v42[2] = [NSNumber numberWithDouble:(v32 + 0.5) * v18 + -0.5];
      v43[0] = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:3];
      v41[0] = &unk_1EFAFEA78;
      *(float *)&double v20 = v15 * v19;
      v41[1] = [NSNumber numberWithFloat:v20];
      int v21 = &unk_1EFB02F78;
      v22 = &unk_1EFB02F18;
      int v23 = v43;
      uint64_t v24 = v41;
LABEL_11:
      void v24[2] = [NSNumber numberWithDouble:(v16 + 0.5) * v19 + -0.5];
      v23[1] = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:3];
      v23[2] = (uint64_t)v22;
      uint64_t v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:3];
      v36[0] = getkCVAFaceTracking_Rotation();
      v37[0] = v21;
      v36[1] = getkCVAFaceTracking_Translation();
      v37[1] = &unk_1EFB03008;
      uint64_t v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:2];
      v34[0] = getkCVAFaceTracking_Intrinsics();
      v35[0] = v29;
      v34[1] = getkCVAFaceTracking_Extrinsics();
      v35[1] = v30;
      return [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:2];
    }
    float v25 = 1.0 / v14;
    if (v11 >= v25) {
      float v26 = v11 - v25;
    }
    else {
      float v26 = v25 - v11;
    }
    if (v26 < 0.01)
    {
      float v19 = v10 / v12;
      float v27 = *(float *)&a6 / v13;
      *(float *)&a6 = *((float *)&a7 + 1) * (float)(*(float *)&a6 / v13);
      double v31 = v9;
      float v33 = *(float *)&a8;
      v39[0] = [NSNumber numberWithFloat:a6];
      v39[1] = &unk_1EFAFEA78;
      v39[2] = [NSNumber numberWithDouble:(double)a4 - (v16 + 0.5) * v27 + -0.5];
      uint64_t v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:3];
      v38[0] = &unk_1EFAFEA78;
      HIDWORD(v28) = HIDWORD(v31);
      *(float *)&double v28 = *(float *)&v31 * v19;
      int v21 = &unk_1EFB02FF0;
      v38[1] = [NSNumber numberWithFloat:v28];
      v22 = &unk_1EFB02F90;
      int v23 = &v40;
      uint64_t v24 = v38;
      float v16 = v33;
      goto LABEL_11;
    }
    return 0;
  }
  return result;
}

- (BOOL)frontCamera
{
  return self->_frontCamera;
}

- (BOOL)mirrored
{
  return self->_mirrored;
}

- (int)orientation
{
  return self->_orientation;
}

- (int)maxFaces
{
  return self->_faceTrackingMaxFaces;
}

- (BOOL)usesFaceRecognition
{
  return self->_faceTrackingUsesFaceRecognition;
}

- (BOOL)faceTrackingPlusEnabled
{
  return self->_faceTrackingPlusEnabled;
}

- (float)networkFailureThresholdMultiplier
{
  return self->_faceTrackingNetworkFailureThresholdMultiplier;
}

- (float)trackingFailureFieldOfViewModifier
{
  return self->_faceTrackingFailureFieldOfViewModifier;
}

- (void)_setupCVA
{
  v0 = (void *)[MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(NSString, "stringWithUTF8String:", "CFStringRef getkCVAFaceTracking_TrackingFailureFieldOfViewModifier(void)"), @"BWFaceTrackingNode.m", 78, @"%s", dlerror());
  __break(1u);
}

@end