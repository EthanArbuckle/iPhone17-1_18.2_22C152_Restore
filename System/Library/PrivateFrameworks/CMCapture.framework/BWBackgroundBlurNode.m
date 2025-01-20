@interface BWBackgroundBlurNode
+ (void)initialize;
- (BOOL)effectBypassed;
- (BWBackgroundBlurNode)initWithStillImageCaptureEnabled:(BOOL)a3 maxLossyCompressionLevel:(int)a4 fastSwitchEnabled:(BOOL)a5 availableEffects:(unint64_t)a6 activeEffect:(unint64_t)a7 isHighQualitySupported:(BOOL)a8 upstreamDeviceOrientationCorrectionEnabled:(BOOL)a9 deviceType:(int)a10;
- (BWNodeInput)stillImageInput;
- (BWNodeInput)videoInput;
- (BWNodeOutput)stillImageOutput;
- (BWNodeOutput)videoOutput;
- (CVPixelBufferRef)_savePixelBufferForStillImageCaptureRequests:(long long *)a3 withPts:;
- (NSString)clientApplicationID;
- (id)nodeSubType;
- (id)nodeType;
- (int)continuityCameraClientDeviceClass;
- (int64_t)effectQuality;
- (uint64_t)_reportBackgroundBlurCoreAnalyticsData;
- (uint64_t)_updateActiveReactions:(long long *)a3 currentRenderPTS:(uint64_t)a4 requestedTriggers:;
- (uint64_t)_updateOutputRequirements;
- (unint64_t)_getActivePTEffectTypes;
- (unint64_t)activeBlurEffect;
- (unsigned)reactionCount;
- (void)_createMatchingPixelBufferFromSavedVideoBuffersWithTargetPts:(uint64_t)a1;
- (void)_newStillImageOutputPixelBufferFromVideoPixelBuffer:(uint64_t)a1;
- (void)_supportedInputPixelFormats;
- (void)_supportedOutputPixelFormats;
- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5;
- (void)dealloc;
- (void)didChangeBackgroundBlurAperture:(float)a3;
- (void)didChangeBackgroundReplacementPixelBuffer:(__CVBuffer *)a3;
- (void)didChangeGesturesEnabled:(BOOL)a3;
- (void)didChangePortraitEffectStudioLightQuality:(int64_t)a3;
- (void)didChangeStudioLightingIntensity:(float)a3;
- (void)didReachEndOfDataForInput:(id)a3;
- (void)didSelectFormat:(id)a3 forInput:(id)a4;
- (void)lowPowerModeChanged:(id)a3;
- (void)performReactionEffect:(id)a3;
- (void)prepareForCurrentConfigurationToBecomeLive;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
- (void)setActiveBlurEffect:(unint64_t)a3;
- (void)setClientApplicationID:(id)a3;
- (void)setContinuityCameraClientDeviceClass:(int)a3;
- (void)setEffectBypassed:(BOOL)a3;
- (void)setEffectQuality:(int64_t)a3;
- (void)setReactionsInProgressChangedHandler:(id)a3;
@end

@implementation BWBackgroundBlurNode

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
  if ([a4 passthroughMode])
  {
    if (self->_videoInput == a4)
    {
      v7 = &OBJC_IVAR___BWBackgroundBlurNode__videoOutput;
    }
    else
    {
      if (self->_stillImageInput != a4) {
        goto LABEL_7;
      }
      v7 = &OBJC_IVAR___BWBackgroundBlurNode__stillImageOutput;
    }
    [*(id *)((char *)&self->super.super.isa + *v7) setFormat:a3];
  }
LABEL_7:
  -[BWBackgroundBlurNode _updateOutputRequirements]((uint64_t)self);
}

BOOL __52__BWBackgroundBlurNode__supportedOutputPixelFormats__block_invoke(uint64_t a1, void *a2)
{
  return *(unsigned __int8 *)(a1 + 32) == FigCapturePixelFormatIsFullRange([a2 intValue]);
}

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  if (self->_videoInput == a5)
  {
    v6 = &OBJC_IVAR___BWBackgroundBlurNode__videoOutput;
    goto LABEL_5;
  }
  if (self->_stillImageInput == a5)
  {
    v6 = &OBJC_IVAR___BWBackgroundBlurNode__stillImageOutput;
LABEL_5:
    objc_msgSend(*(id *)((char *)&self->super.super.isa + *v6), "makeConfiguredFormatLive", a3, a4);
  }
  self->_previousEffectBypassed = 1;
}

- (id)nodeType
{
  return @"Effect";
}

- (void)setReactionsInProgressChangedHandler:(id)a3
{
  p_bufferServicingLock = &self->_bufferServicingLock;
  os_unfair_lock_lock(&self->_bufferServicingLock);
  id reactionsInProgressObserver = self->_reactionsInProgressObserver;
  if (reactionsInProgressObserver) {
    _Block_release(reactionsInProgressObserver);
  }
  self->_id reactionsInProgressObserver = _Block_copy(a3);
  os_unfair_lock_unlock(p_bufferServicingLock);
}

- (void)didChangeStudioLightingIntensity:(float)a3
{
  if (self->_studioLightingIntensity != a3)
  {
    p_bufferServicingLock = &self->_bufferServicingLock;
    os_unfair_lock_lock(&self->_bufferServicingLock);
    self->_studioLightingIntensity = a3;
    os_unfair_lock_unlock(p_bufferServicingLock);
  }
}

- (void)didChangeGesturesEnabled:(BOOL)a3
{
  if (self->_gesturesEnabled != a3)
  {
    p_bufferServicingLock = &self->_bufferServicingLock;
    os_unfair_lock_lock(&self->_bufferServicingLock);
    self->_gesturesEnabled = a3;
    os_unfair_lock_unlock(p_bufferServicingLock);
  }
}

- (void)didChangeBackgroundReplacementPixelBuffer:(__CVBuffer *)a3
{
  p_bufferServicingLock = &self->_bufferServicingLock;
  os_unfair_lock_lock(&self->_bufferServicingLock);
  backgroundReplacementPixelBuffer = self->_backgroundReplacementPixelBuffer;
  self->_backgroundReplacementPixelBuffer = a3;
  if (a3) {
    CFRetain(a3);
  }
  if (backgroundReplacementPixelBuffer) {
    CFRelease(backgroundReplacementPixelBuffer);
  }
  os_unfair_lock_unlock(p_bufferServicingLock);
}

- (void)didChangeBackgroundBlurAperture:(float)a3
{
  if (self->_backgroundBlurAperture != a3)
  {
    p_bufferServicingLock = &self->_bufferServicingLock;
    os_unfair_lock_lock(&self->_bufferServicingLock);
    self->_backgroundBlurAperture = a3;
    os_unfair_lock_unlock(p_bufferServicingLock);
  }
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  v12.receiver = self;
  v12.super_class = (Class)BWBackgroundBlurNode;
  [(BWNode *)&v12 prepareForCurrentConfigurationToBecomeLive];
  CMVideoFormatDescriptionRef formatDescriptionOut = 0;
  v3 = (void *)[MEMORY[0x1E4F55F60] metalDevice];
  if (v3)
  {
    v4 = (void *)[v3 newCommandQueue];
    v5 = v4;
    if (v4)
    {
      [v4 setGPUPriority:4];
      CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      if (!CMVideoFormatDescriptionCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], [(BWVideoFormat *)[(BWNodeInput *)self->super._input videoFormat] pixelFormat], [(BWVideoFormat *)[(BWNodeInput *)self->super._input videoFormat] width], [(BWVideoFormat *)[(BWNodeInput *)self->super._input videoFormat] height], 0, &formatDescriptionOut))
      {
        [(BWDeviceOrientationMonitor *)self->_deviceOrientationMonitor start];
        id v7 = (id)[objc_alloc((Class)getPTEffectDescriptorClass()) init];
        [v7 setMetalCommandQueue:v5];
        objc_msgSend(v7, "setColorSize:", (double)-[BWVideoFormat width](-[BWNodeInput videoFormat](self->super._input, "videoFormat"), "width"), (double)-[BWVideoFormat height](-[BWNodeInput videoFormat](self->super._input, "videoFormat"), "height"));
        objc_msgSend(v7, "setExternalDisparitySize:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
        [v7 setAvailableEffectTypes:self->_availablePTEffects];
        [v7 setActiveEffectType:-[BWBackgroundBlurNode _getActivePTEffectTypes]((unint64_t)self)];
        [v7 setEffectQuality:self->_effectQuality];
        [v7 setAllowSkipOutColorBufferWrite:1];
        [v7 setExternalCamera:self->_deviceType == 15];
        int v8 = [v7 availableEffectTypes];
        if ((v8 & [v7 activeEffectType] & 0x40) != 0) {
          [v7 setSyncInitialization:1];
        }
        os_unfair_lock_lock((os_unfair_lock_t)&sPTEffectSuspensionLock);
        v9 = (void *)sSuspendedPTEffect;
        if (sSuspendedPTEffect)
        {
          self->_ptEffect = (PTEffect *)sSuspendedPTEffect;
          sSuspendedPTEffect = 0;
          [v9 reconfigure:v7];
        }
        else
        {
          self->_ptEffect = (PTEffect *)[objc_alloc((Class)getPTEffectClass()) initWithDescriptor:v7];
        }
        os_unfair_lock_unlock((os_unfair_lock_t)&sPTEffectSuspensionLock);
        self->_ptEffectRenderRequest = (PTEffectRenderRequest *)[objc_alloc((Class)getPTEffectRenderRequestClass()) init];
        if (self->_ptEffect)
        {
          if (!self->_stillImageCaptureEnabled
            || (VTPixelTransferSessionCreate(v6, &self->_stillImagePixelTransferSession),
                self->_stillImagePixelTransferSession))
          {
            v10 = objc_alloc_init(BWStats);
            self->_backgroundBlurProcessingTimeStats = v10;
            [(BWStats *)v10 setMultiplier:0.000001];
            [(BWStats *)self->_backgroundBlurProcessingTimeStats setUnitDesignator:@"ms"];
            self->_numberOfFramesThatCouldNotBeBlurred = 0;
          }
        }
      }
    }
  }
  else
  {
    v5 = 0;
  }

  if (formatDescriptionOut) {
    CFRelease(formatDescriptionOut);
  }
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  p_bufferServicingLock = &self->_bufferServicingLock;
  os_unfair_lock_lock(&self->_bufferServicingLock);
  CFTypeRef v98 = 0;
  if (self->_stillImageInput == a4) {
    v9 = &OBJC_IVAR___BWBackgroundBlurNode__stillImageOutput;
  }
  else {
    v9 = &OBJC_IVAR___BWBackgroundBlurNode__videoOutput;
  }
  BOOL effectBypassed = self->_effectBypassed;
  BOOL v11 = !self->_effectBypassed;
  if (!a3) {
    goto LABEL_69;
  }
  objc_super v12 = *(Class *)((char *)&self->super.super.isa + *v9);
  v13 = (__CVBuffer *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  v14 = v13;
  if (!v13)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    goto LABEL_62;
  }
  memset(&v97, 0, sizeof(v97));
  CMTimeMakeFromDictionary(&v97, (CFDictionaryRef)[(__CVBuffer *)v13 objectForKeyedSubscript:*MEMORY[0x1E4F530C0]]);
  if ((v97.flags & 1) == 0)
  {
    CMSampleBufferGetPresentationTimeStamp((CMTime *)v88, a3);
    CMTime v97 = *(CMTime *)v88;
  }
  v81 = v14;
  if (self->_videoInput == a4)
  {
    CVImageBufferRef v17 = CMSampleBufferGetImageBuffer(a3);
    if (v17)
    {
      CVImageBufferRef v18 = v17;
      id v80 = a4;
      if (effectBypassed)
      {
        v19 = v12;
        CFTypeRef v98 = CFRetain(a3);
        v14 = (__CVBuffer *)CFRetain(v18);
        [(NSMutableArray *)self->_pendingPTEffectReactions removeAllObjects];
        int v20 = 0;
        BOOL effectBypassed = 1;
        goto LABEL_50;
      }
      imageBuffer = v17;
      if (self->_activeBlurEffect != 16)
      {
LABEL_24:
        HostTimeClock = CMClockGetHostTimeClock();
        CMClockGetTime(&v91, HostTimeClock);
        CMTimeConvertScale(&v90, &v91, 1000000000, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
        CMTimeValue value = v90.value;
        ptEffectRenderRequest = self->_ptEffectRenderRequest;
        *(CMTime *)v88 = v97;
        [(PTEffectRenderRequest *)ptEffectRenderRequest setFrameTimeSeconds:CMTimeGetSeconds((CMTime *)v88)];
        unint64_t ActivePTEffect = -[BWBackgroundBlurNode _getActivePTEffectTypes]((unint64_t)self);
        if ((ActivePTEffect & 0x10) != 0)
        {
          if ([(NSMutableArray *)self->_pendingPTEffectReactions count])
          {
            [(PTEffectRenderRequest *)self->_ptEffectRenderRequest setReactions:self->_pendingPTEffectReactions];

            self->_pendingPTEffectReactions = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
          }
        }
        else
        {
          [(PTEffectRenderRequest *)self->_ptEffectRenderRequest setReactions:0];
          [(NSMutableArray *)self->_pendingPTEffectReactions removeAllObjects];
        }
        [(PTEffectRenderRequest *)self->_ptEffectRenderRequest setEffectType:ActivePTEffect];
        if ([(PTEffect *)self->_ptEffect isRenderRequiredForRequest:self->_ptEffectRenderRequest])
        {
          v14 = (__CVBuffer *)objc_msgSend((id)objc_msgSend(v12, "livePixelBufferPool"), "newPixelBuffer");
          if (!v14) {
            goto LABEL_62;
          }
          CMTimeValue v76 = value;
          [(PTEffectRenderRequest *)self->_ptEffectRenderRequest setInColorBuffer:imageBuffer];
          [(PTEffectRenderRequest *)self->_ptEffectRenderRequest setOutColorBuffer:v14];
          [(PTEffectRenderRequest *)self->_ptEffectRenderRequest setEffectQuality:self->_effectQuality];
          v29 = self->_ptEffectRenderRequest;
          long long v30 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
          *(_OWORD *)v88 = *MEMORY[0x1E4F1DAB8];
          *(_OWORD *)&v88[16] = v30;
          long long v89 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
          [(PTEffectRenderRequest *)v29 setTransform:v88];
          *(float *)&double v31 = self->_backgroundBlurAperture;
          [(PTEffectRenderRequest *)self->_ptEffectRenderRequest setApertureSDOF:v31];
          *(float *)&double v32 = self->_studioLightingIntensity;
          [(PTEffectRenderRequest *)self->_ptEffectRenderRequest setRelightStrengthStudioLight:v32];
          [(PTEffectRenderRequest *)self->_ptEffectRenderRequest setInBackgroundReplacementBuffer:self->_backgroundReplacementPixelBuffer];
          v78 = (void *)[(__CVBuffer *)v81 objectForKeyedSubscript:*MEMORY[0x1E4F53DC8]];
          id v33 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
          id v34 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
          CFStringRef key = (const __CFString *)*MEMORY[0x1E4F52FC8];
          CFTypeRef v35 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F52FC8], 0);
          CFStringRef v74 = (const __CFString *)*MEMORY[0x1E4F52FC0];
          CFTypeRef v36 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F52FC0], 0);
          [v33 unionSet:v35];
          [v34 unionSet:v36];
          CFStringRef v73 = (const __CFString *)*MEMORY[0x1E4F53010];
          CFTypeRef v37 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53010], 0);
          CFStringRef v72 = (const __CFString *)*MEMORY[0x1E4F53008];
          CFTypeRef v38 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53008], 0);
          [v33 unionSet:v37];
          v77 = v34;
          [v34 unionSet:v38];
          if ([v33 count] || objc_msgSend(v34, "count"))
          {
            id v71 = (id)[v78 mutableCopy];
            uint64_t v70 = *MEMORY[0x1E4F538C8];
            id v67 = (id)objc_msgSend((id)objc_msgSend(v78, "objectForKeyedSubscript:"), "mutableCopy");
            uint64_t v69 = *MEMORY[0x1E4F538C0];
            id v68 = (id)objc_msgSend((id)objc_msgSend(v78, "objectForKeyedSubscript:"), "mutableCopy");
            id v39 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v33, "count"));
            uint64_t v40 = *MEMORY[0x1E4F538F8];
            [v67 setObject:v39 forKeyedSubscript:*MEMORY[0x1E4F538F8]];
            objc_msgSend(v68, "setObject:forKeyedSubscript:", (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v77, "count")), v40);
            [v71 setObject:v67 forKeyedSubscript:v70];
            [v71 setObject:v68 forKeyedSubscript:v69];
            [MEMORY[0x1E4F58FB0] filterDetectedObjects:v78 usedFaceIDs:v33 usedBodyIDs:v77 filteredObjects:v71];
            CMRemoveAttachment(a3, key);
            CMRemoveAttachment(a3, v74);
            CMRemoveAttachment(a3, v73);
            CMRemoveAttachment(a3, v72);
            uint64_t v41 = 1;
            v78 = v71;
          }
          else
          {
            uint64_t v41 = 0;
          }
          [(PTEffectRenderRequest *)self->_ptEffectRenderRequest setFocusOnAll:v41];
          [(PTEffectRenderRequest *)self->_ptEffectRenderRequest setDetectedObjects:v78];
          CFStringRef v42 = (const __CFString *)*MEMORY[0x1E4F52FD0];
          v43 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F52FD0], 0);
          if (v43)
          {
            v44 = v43;
            [v43 floatValue];
            if (v45 > 0.0)
            {
              [v44 floatValue];
              -[PTEffectRenderRequest setFocalLength:](self->_ptEffectRenderRequest, "setFocalLength:");
              CMRemoveAttachment(a3, v42);
            }
          }
          if (!self->_upstreamDeviceOrientationCorrectionEnabled
            && !BWDeviceTypeIsExtensionDeviceType(objc_msgSend((id)-[__CVBuffer objectForKeyedSubscript:](v81, "objectForKeyedSubscript:", *MEMORY[0x1E4F53DE0]), "integerValue")))
          {
            int v46 = [(BWDeviceOrientationMonitor *)self->_deviceOrientationMonitor mostRecentPortraitLandscapeOrientation];
            int v47 = objc_msgSend((id)-[__CVBuffer objectForKeyedSubscript:](v81, "objectForKeyedSubscript:", *MEMORY[0x1E4F54128]), "containsString:", @"Front");
            [(BWGraph *)[(BWNode *)self graph] clientExpectsCameraMountedInLandscapeOrientation];
            int v48 = FigCaptureRotationDegreesFromOrientation(v46, v47, 0, 0);
            CGSize EncodedSize = CVImageBufferGetEncodedSize(imageBuffer);
            long long v89 = 0u;
            memset(v88, 0, sizeof(v88));
            FigCaptureMakeMirrorAndRotateVideoTransform((int)EncodedSize.width, (int)EncodedSize.height, 0, v48, (uint64_t)v88);
            v50 = self->_ptEffectRenderRequest;
            *(_OWORD *)time = *(_OWORD *)v88;
            *(_OWORD *)&time[16] = *(_OWORD *)&v88[16];
            long long v87 = v89;
            [(PTEffectRenderRequest *)v50 setTransform:time];
          }
          uint64_t v51 = *MEMORY[0x1E4F54068];
          if ([(__CVBuffer *)v81 objectForKeyedSubscript:*MEMORY[0x1E4F54068]]) {
            objc_msgSend((id)-[__CVBuffer objectForKeyedSubscript:](v81, "objectForKeyedSubscript:", v51), "floatValue");
          }
          else {
            LODWORD(v52) = 2143289344;
          }
          [(PTEffectRenderRequest *)self->_ptEffectRenderRequest setLuxLevel:v52];
          uint64_t v53 = [(PTEffect *)self->_ptEffect render:self->_ptEffectRenderRequest];
          if (v53)
          {
            uint64_t v16 = v53;
            BOOL v15 = 0;
LABEL_72:
            if (self->_videoInput == a4)
            {
              CMSampleBufferGetPresentationTimeStamp(&v82, a3);
              objc_msgSend(v12, "emitDroppedSample:", +[BWDroppedSample newDroppedSampleWithReason:pts:](BWDroppedSample, "newDroppedSampleWithReason:pts:", 0x1EFA680A0, &v82));
            }
            else
            {
              id v64 = +[BWNodeError newError:v16 sourceNode:self stillImageSettings:CMGetAttachment(a3, @"StillSettings", 0) metadata:v81];
              [v12 emitNodeError:v64];
            }
            [(BWLimitedGMErrorLogger *)self->_limitedGMErrorLogger logErrorNumber:v16, @"Error : Emitting dropped buffer", v65, v66 errorString];
            if (v15) {
              goto LABEL_63;
            }
LABEL_62:
            ++self->_numberOfFramesThatCouldNotBeBlurred;
            goto LABEL_63;
          }
          if (![(PTEffectRenderRequest *)self->_ptEffectRenderRequest outColorBufferWriteSkipped])
          {
            v19 = v12;
            v54 = CMClockGetHostTimeClock();
            CMClockGetTime(&v85, v54);
            int v20 = 1;
            CMTimeConvertScale(&v84, &v85, 1000000000, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
            [(BWStats *)self->_backgroundBlurProcessingTimeStats addDataPoint:(double)(v84.value - v76)];
            BOOL effectBypassed = 0;
LABEL_49:
            v55 = (void *)[(PTEffect *)self->_ptEffect activeReactions];
            CMSampleBufferGetPresentationTimeStamp(&v83, a3);
            -[BWBackgroundBlurNode _updateActiveReactions:currentRenderPTS:requestedTriggers:]((uint64_t)self, v55, (long long *)&v83.value, objc_msgSend((id)-[PTEffectRenderRequest reactions](self->_ptEffectRenderRequest, "reactions"), "count"));
LABEL_50:
            v56 = v19;
            if (self->_stillImageCaptureEnabled)
            {
              *(CMTime *)v88 = v97;
              -[BWBackgroundBlurNode _savePixelBufferForStillImageCaptureRequests:withPts:]((CVPixelBufferRef)self, v14, (long long *)v88);
            }
            v57 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F55D48], 0);
            if (v57)
            {
              v58 = v57;
              int v59 = v20;
              v60 = p_bufferServicingLock;
              int maxThermalSystemPressureLevel = self->_maxThermalSystemPressureLevel;
              if (maxThermalSystemPressureLevel <= (int)[v57 intValue]) {
                int v62 = [v58 intValue];
              }
              else {
                int v62 = self->_maxThermalSystemPressureLevel;
              }
              self->_int maxThermalSystemPressureLevel = v62;
              p_bufferServicingLock = v60;
              int v20 = v59;
            }
            BOOL v15 = v20 != 0;
            BOOL v11 = !effectBypassed;
            objc_super v12 = v56;
            a4 = v80;
            if (v98) {
              goto LABEL_58;
            }
            goto LABEL_11;
          }
        }
        else
        {
          v14 = 0;
        }
        v19 = v12;
        CFTypeRef v98 = CFRetain(a3);
        CFRetain(imageBuffer);
        if (v14) {
          CFRelease(v14);
        }
        int v20 = 0;
        BOOL effectBypassed = 1;
        v14 = imageBuffer;
        goto LABEL_49;
      }
      if (!objc_msgSend((id)-[PTEffect activeReactions](self->_ptEffect, "activeReactions"), "count"))
      {
        uint64_t v24 = MEMORY[0x1E4F1F9F8];
        *(_OWORD *)&self->_framerateThrottleNextPTS.CMTimeValue value = *MEMORY[0x1E4F1F9F8];
        self->_framerateThrottleNextPTS.CMTimeEpoch epoch = *(void *)(v24 + 16);
        goto LABEL_24;
      }
      memset(v88, 0, 24);
      CMTimeMake((CMTime *)v88, 1, 30);
      p_framerateThrottleNextPTS = &self->_framerateThrottleNextPTS;
      if ((self->_framerateThrottleNextPTS.flags & 1) == 0)
      {
        *(_OWORD *)time = *(_OWORD *)v88;
        *(void *)&time[16] = *(void *)&v88[16];
        Float64 Seconds = CMTimeGetSeconds((CMTime *)time);
        CMTimeMakeWithSeconds(&rhs, Seconds + -0.005, v97.timescale);
        CMTime lhs = v97;
        CMTimeAdd((CMTime *)time, &lhs, &rhs);
        *(_OWORD *)&p_framerateThrottleNextPTS->CMTimeValue value = *(_OWORD *)time;
        CMTimeEpoch epoch = *(void *)&time[16];
LABEL_23:
        self->_framerateThrottleNextPTS.CMTimeEpoch epoch = epoch;
        goto LABEL_24;
      }
      *(CMTime *)time = v97;
      *(_OWORD *)&lhs.CMTimeValue value = *(_OWORD *)&p_framerateThrottleNextPTS->value;
      lhs.CMTimeEpoch epoch = self->_framerateThrottleNextPTS.epoch;
      if ((CMTimeCompare((CMTime *)time, &lhs) & 0x80000000) == 0)
      {
        memset(time, 0, 24);
        CMTime lhs = v97;
        *(_OWORD *)&v94.CMTimeValue value = *(_OWORD *)&p_framerateThrottleNextPTS->value;
        v94.CMTimeEpoch epoch = self->_framerateThrottleNextPTS.epoch;
        CMTimeSubtract((CMTime *)time, &lhs, &v94);
        CMTime lhs = v97;
        CMTime v94 = *(CMTime *)v88;
        CMTimeAdd(&v93, &lhs, &v94);
        CMTime lhs = *(CMTime *)time;
        CMTime v94 = *(CMTime *)v88;
        CMTimeRemainder();
        CMTimeSubtract(&lhs, &v93, &v92);
        *(_OWORD *)&p_framerateThrottleNextPTS->CMTimeValue value = *(_OWORD *)&lhs.value;
        CMTimeEpoch epoch = lhs.epoch;
        goto LABEL_23;
      }
    }
LABEL_69:
    v14 = 0;
    goto LABEL_62;
  }
  *(CMTime *)v88 = v97;
  v14 = (__CVBuffer *)-[BWBackgroundBlurNode _createMatchingPixelBufferFromSavedVideoBuffersWithTargetPts:]((uint64_t)self, (__CVBuffer **)v88);
  if (!v14)
  {
    fig_log_get_emitter();
    uint64_t v66 = v4;
    LODWORD(v65) = 0;
    FigDebugAssert3();
    BOOL v15 = 0;
    uint64_t v16 = 4294954513;
    goto LABEL_72;
  }
  BOOL v15 = 1;
LABEL_11:
  BWCMSampleBufferCreateCopyWithNewPixelBuffer(a3, v14, (CFTypeRef *)&self->_outputFormatDescription, (CMSampleBufferRef *)&v98);
  if (!v98)
  {
    uint64_t v16 = 4294954516;
    goto LABEL_72;
  }
LABEL_58:
  objc_msgSend(v12, "emitSampleBuffer:");
  if (!v11 && !self->_previousEffectBypassed)
  {
    -[BWBackgroundBlurNode _reportBackgroundBlurCoreAnalyticsData]((uint64_t)self);
    self->_int maxThermalSystemPressureLevel = 0;
    self->_numberOfFramesThatCouldNotBeBlurred = 0;

    v63 = objc_alloc_init(BWStats);
    self->_backgroundBlurProcessingTimeStats = v63;
    [(BWStats *)v63 setMultiplier:0.000001];
    [(BWStats *)self->_backgroundBlurProcessingTimeStats setUnitDesignator:@"ms"];
  }
  self->_previousEffectBypassed = effectBypassed;
  if (!v15) {
    goto LABEL_62;
  }
LABEL_63:
  if (v98) {
    CFRelease(v98);
  }
  if (v14) {
    CFRelease(v14);
  }
  os_unfair_lock_unlock(p_bufferServicingLock);
}

- (unint64_t)_getActivePTEffectTypes
{
  if (result)
  {
    uint64_t v1 = *(void *)(result + 296);
    if ((v1 & 0x10) != 0 && *(unsigned char *)(result + 344)) {
      unint64_t v2 = v1 | 0x20;
    }
    else {
      unint64_t v2 = v1 & 0xFFFFFFFFFFFFFFDFLL;
    }
    if (*(void *)(result + 352)) {
      BOOL v3 = 1;
    }
    else {
      BOOL v3 = (v2 & 0x40) == 0;
    }
    if (v3) {
      return v2;
    }
    else {
      return v2 & 0xFFFFFFFFFFFFFFBFLL;
    }
  }
  return result;
}

- (uint64_t)_updateActiveReactions:(long long *)a3 currentRenderPTS:(uint64_t)a4 requestedTriggers:
{
  if (result)
  {
    uint64_t v6 = result;
    if (a4
      || (uint64_t v7 = [a2 count], v7 != objc_msgSend(*(id *)(v6 + 408), "count"))
      || (result = [a2 count]) != 0
      && *(unsigned char *)(v6 + 344)
      && (result = objc_msgSend((id)objc_msgSend(*(id *)(v6 + 408), "allKeys"), "isEqual:", objc_msgSend(a2, "allKeys")),
          (result & 1) == 0))
    {
      int v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a2, "count") + objc_msgSend(*(id *)(v6 + 408), "count"));
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __82__BWBackgroundBlurNode__updateActiveReactions_currentRenderPTS_requestedTriggers___block_invoke;
      v14[3] = &unk_1E5C26560;
      v14[4] = v6;
      v14[5] = v8;
      [a2 enumerateKeysAndObjectsUsingBlock:v14];
      v9 = *(void **)(v6 + 408);
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __82__BWBackgroundBlurNode__updateActiveReactions_currentRenderPTS_requestedTriggers___block_invoke_2;
      v11[3] = &unk_1E5C26588;
      long long v12 = *a3;
      uint64_t v13 = *((void *)a3 + 2);
      v11[4] = v8;
      v11[5] = v6;
      [v9 enumerateKeysAndObjectsUsingBlock:v11];
      [v8 sortUsingComparator:&__block_literal_global_41];
      uint64_t v10 = *(void *)(v6 + 424);
      if (v10) {
        (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v8);
      }

      result = [a2 mutableCopy];
      *(void *)(v6 + 408) = result;
    }
  }
  return result;
}

- (uint64_t)_updateOutputRequirements
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = (id *)result;
    uint64_t v2 = objc_msgSend((id)objc_msgSend(*(id *)(result + 120), "videoFormat"), "colorSpaceProperties");
    if (v2)
    {
      v7[0] = [NSNumber numberWithInt:v2];
      uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
    }
    else
    {
      uint64_t v3 = 0;
    }
    objc_msgSend((id)objc_msgSend(v1[17], "videoFormat"), "colorSpaceProperties");
    uint64_t v4 = -[BWBackgroundBlurNode _supportedOutputPixelFormats]((uint64_t)v1);
    v5 = (void *)[v1[16] formatRequirements];
    objc_msgSend(v5, "setWidth:", objc_msgSend((id)objc_msgSend(v1[15], "videoFormat"), "width"));
    objc_msgSend(v5, "setHeight:", objc_msgSend((id)objc_msgSend(v1[15], "videoFormat"), "height"));
    [v5 setSupportedColorSpaceProperties:v3];
    [v5 setSupportedPixelFormats:v4];
    uint64_t v6 = (void *)[v1[18] formatRequirements];
    objc_msgSend(v6, "setWidth:", objc_msgSend((id)objc_msgSend(v1[15], "videoFormat"), "width"));
    objc_msgSend(v6, "setHeight:", objc_msgSend((id)objc_msgSend(v1[15], "videoFormat"), "height"));
    [v6 setSupportedColorSpaceProperties:v3];
    return [v6 setSupportedPixelFormats:v4];
  }
  return result;
}

- (BWBackgroundBlurNode)initWithStillImageCaptureEnabled:(BOOL)a3 maxLossyCompressionLevel:(int)a4 fastSwitchEnabled:(BOOL)a5 availableEffects:(unint64_t)a6 activeEffect:(unint64_t)a7 isHighQualitySupported:(BOOL)a8 upstreamDeviceOrientationCorrectionEnabled:(BOOL)a9 deviceType:(int)a10
{
  BOOL v15 = a3;
  v30.receiver = self;
  v30.super_class = (Class)BWBackgroundBlurNode;
  uint64_t v16 = [(BWNode *)&v30 init];
  uint64_t v17 = (uint64_t)v16;
  if (v16)
  {
    v16->_fastSwitchEnabled = a5;
    v16->_videoInput = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v16 index:0];
    CVImageBufferRef v18 = objc_alloc_init(BWVideoFormatRequirements);
    *(_DWORD *)(v17 + 236) = 0;
    *(_DWORD *)(v17 + 284) = a4;
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v18, "setSupportedPixelFormats:", -[BWBackgroundBlurNode _supportedInputPixelFormats](v17));
    [*(id *)(v17 + 120) setFormatRequirements:v18];
    [*(id *)(v17 + 120) setPassthroughMode:2];
    [*(id *)(v17 + 120) setRetainedBufferCount:1];
    [(id)v17 addInput:*(void *)(v17 + 120)];
    *(void *)(v17 + 128) = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:v17];
    v19 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v19, "setSupportedPixelFormats:", -[BWBackgroundBlurNode _supportedOutputPixelFormats](v17));
    [*(id *)(v17 + 128) setFormatRequirements:v19];
    [*(id *)(v17 + 128) setPassthroughMode:2];
    [*(id *)(v17 + 128) setProvidesPixelBufferPool:1];
    objc_msgSend((id)objc_msgSend(*(id *)(v17 + 128), "primaryMediaConfiguration"), "setOwningNodeRetainedBufferCount:", 2);
    [*(id *)(v17 + 128) setIndexOfInputWhichDrivesThisOutput:0];
    [(id)v17 addOutput:*(void *)(v17 + 128)];
    *(unsigned char *)(v17 + 152) = v15;
    if (v15)
    {
      objc_msgSend(*(id *)(v17 + 120), "setRetainedBufferCount:", objc_msgSend(*(id *)(v17 + 120), "retainedBufferCount") + 1);
      objc_msgSend(*(id *)(v17 + 120), "setIndefinitelyHeldBufferCount:", objc_msgSend(*(id *)(v17 + 120), "indefinitelyHeldBufferCount") + 1);
      *(void *)(v17 + 136) = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v17 index:1];
      int v20 = objc_alloc_init(BWVideoFormatRequirements);
      -[BWVideoFormatRequirements setSupportedPixelFormats:](v20, "setSupportedPixelFormats:", -[BWBackgroundBlurNode _supportedInputPixelFormats](v17));
      [*(id *)(v17 + 136) setFormatRequirements:v20];
      [*(id *)(v17 + 136) setPassthroughMode:0];
      [(id)v17 addInput:*(void *)(v17 + 136)];
      *(void *)(v17 + 144) = [[BWNodeOutput alloc] initWithMediaType:1986618469 node:v17];
      v21 = objc_alloc_init(BWVideoFormatRequirements);
      -[BWVideoFormatRequirements setSupportedPixelFormats:](v21, "setSupportedPixelFormats:", -[BWBackgroundBlurNode _supportedOutputPixelFormats](v17));
      [*(id *)(v17 + 144) setFormatRequirements:v21];
      [*(id *)(v17 + 144) setPassthroughMode:0];
      objc_msgSend((id)objc_msgSend(*(id *)(v17 + 144), "primaryMediaConfiguration"), "setProvidesPixelBufferPool:", 1);
      [*(id *)(v17 + 144) setIndexOfInputWhichDrivesThisOutput:1];
      [(id)v17 addOutput:*(void *)(v17 + 144)];
      *(_OWORD *)(v17 + 168) = 0u;
      *(_OWORD *)(v17 + 184) = 0u;
      *(_OWORD *)(v17 + 200) = 0u;
      *(_OWORD *)(v17 + 216) = 0u;
      *(_DWORD *)(v17 + 232) = 0;
    }
    *(void *)(v17 + 304) = (2 * (int)a6) & 0x20 | a6;
    [(id)v17 setActiveBlurEffect:a7];
    *(unsigned char *)(v17 + 288) = a8;
    *(unsigned char *)(v17 + 312) = a9;
    *(void *)(v17 + 320) = objc_alloc_init(BWDeviceOrientationMonitor);
    *(void *)(v17 + 456) = objc_alloc_init(BWDeviceThermalMonitor);
    if (*(unsigned char *)(v17 + 288)) {
      uint64_t v22 = 110;
    }
    else {
      uint64_t v22 = 100;
    }
    [(id)v17 setEffectQuality:v22];
    objc_initWeak(&location, (id)v17);
    v23 = *(void **)(v17 + 456);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __207__BWBackgroundBlurNode_initWithStillImageCaptureEnabled_maxLossyCompressionLevel_fastSwitchEnabled_availableEffects_activeEffect_isHighQualitySupported_upstreamDeviceOrientationCorrectionEnabled_deviceType___block_invoke;
    v27[3] = &unk_1E5C26518;
    objc_copyWeak(&v28, &location);
    [v23 setThermalHandler:v27];
    uint64_t v24 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    [v24 addObserver:v17 selector:sel_lowPowerModeChanged_ name:*MEMORY[0x1E4F287E8] object:0];
    *(_DWORD *)(v17 + 336) = 1077936128;
    *(_DWORD *)(v17 + 340) = 1056964608;
    *(unsigned char *)(v17 + 344) = 0;
    *(void *)(v17 + 352) = 0;
    *(void *)(v17 + 360) = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v25 = (_OWORD *)MEMORY[0x1E4F1F9F8];
    *(void *)(v17 + 448) = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
    *(_OWORD *)(v17 + 432) = *v25;
    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }
  return (BWBackgroundBlurNode *)v17;
}

- (void)_supportedOutputPixelFormats
{
  if (!a1) {
    return 0;
  }
  uint64_t v2 = (void *)[MEMORY[0x1E4F1CA48] arrayWithArray:-[BWBackgroundBlurNode _supportedInputPixelFormats](a1)];
  int v3 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 120), "videoFormat"), "pixelFormat");
  if (v3)
  {
    char IsFullRange = FigCapturePixelFormatIsFullRange(v3);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __52__BWBackgroundBlurNode__supportedOutputPixelFormats__block_invoke;
    v6[3] = &__block_descriptor_33_e35_B24__0__NSNumber_8__NSDictionary_16l;
    char v7 = IsFullRange;
    objc_msgSend(v2, "filterUsingPredicate:", objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithBlock:", v6));
  }
  return v2;
}

- (void)_supportedInputPixelFormats
{
  if (!a1) {
    return 0;
  }
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObjects:", &unk_1EFAFF048, &unk_1EFAFF060, 0);
  objc_msgSend(v2, "addObjectsFromArray:", FigCaptureSupportedPixelFormatsForCompressionType(4, 0, 0, *(_DWORD *)(a1 + 284)));
  return v2;
}

- (void)setEffectQuality:(int64_t)a3
{
  thermalMonitor = self->_thermalMonitor;
  if (thermalMonitor && [(BWDeviceThermalMonitor *)thermalMonitor thermalLevel] > 1)
  {
    int64_t v6 = 100;
  }
  else if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28F80], "processInfo"), "isLowPowerModeEnabled"))
  {
    int64_t v6 = 100;
  }
  else
  {
    int64_t v6 = a3;
  }
  os_unfair_lock_lock(&self->_bufferServicingLock);
  self->_effectQuality = v6;
  os_unfair_lock_unlock(&self->_bufferServicingLock);
}

- (void)setActiveBlurEffect:(unint64_t)a3
{
  p_bufferServicingLock = &self->_bufferServicingLock;
  os_unfair_lock_lock(&self->_bufferServicingLock);
  self->_activeBlurEffect = a3;
  os_unfair_lock_unlock(p_bufferServicingLock);
}

- (BWNodeOutput)videoOutput
{
  return self->_videoOutput;
}

- (BWNodeInput)videoInput
{
  return self->_videoInput;
}

- (void)setEffectBypassed:(BOOL)a3
{
  self->_BOOL effectBypassed = a3;
}

- (void)setContinuityCameraClientDeviceClass:(int)a3
{
  self->_continuityCameraClientDeviceClass = a3;
}

- (void)setClientApplicationID:(id)a3
{
}

- (BOOL)effectBypassed
{
  return self->_effectBypassed;
}

+ (void)initialize
{
}

id __207__BWBackgroundBlurNode_initWithStillImageCaptureEnabled_maxLossyCompressionLevel_fastSwitchEnabled_availableEffects_activeEffect_isHighQualitySupported_upstreamDeviceOrientationCorrectionEnabled_deviceType___block_invoke(uint64_t a1, void *a2)
{
  id result = objc_loadWeak((id *)(a1 + 32));
  if (a2)
  {
    uint64_t v4 = result;
    if (result)
    {
      id result = (id)[a2 thermalLevel];
      if ((int)result >= 2)
      {
        return (id)[v4 setEffectQuality:100];
      }
    }
  }
  return result;
}

- (void)dealloc
{
  os_unfair_lock_lock((os_unfair_lock_t)&sPTEffectSuspensionLock);
  if (sSuspendedPTEffect) {

  }
  int v3 = ++sSuspendedPTEffectID;
  sSuspendedPTEffect = (uint64_t)self->_ptEffect;
  self->_ptEffect = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)&sPTEffectSuspensionLock);
  dispatch_time_t v4 = dispatch_time(0, 2000000000);
  global_queue = dispatch_get_global_queue(21, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__BWBackgroundBlurNode_dealloc__block_invoke;
  block[3] = &__block_descriptor_36_e5_v8__0l;
  int v16 = v3;
  dispatch_after(v4, global_queue, block);
  outputFormatDescription = self->_outputFormatDescription;
  if (outputFormatDescription) {
    CFRelease(outputFormatDescription);
  }
  if (self->_stillImageCaptureEnabled)
  {
    uint64_t v7 = 0;
    char v8 = 1;
    do
    {
      char v9 = v8;
      pixelBuffer = self->_stillCaptureQueue[v7].pixelBuffer;
      if (pixelBuffer) {
        CFRelease(pixelBuffer);
      }
      char v8 = 0;
      uint64_t v7 = 1;
    }
    while ((v9 & 1) != 0);
  }
  stillImagePixelTransferSession = self->_stillImagePixelTransferSession;
  if (stillImagePixelTransferSession) {
    CFRelease(stillImagePixelTransferSession);
  }

  id reactionsInProgressObserver = self->_reactionsInProgressObserver;
  if (reactionsInProgressObserver) {
    _Block_release(reactionsInProgressObserver);
  }
  uint64_t v13 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  [v13 removeObserver:self name:*MEMORY[0x1E4F287E8] object:0];

  v14.receiver = self;
  v14.super_class = (Class)BWBackgroundBlurNode;
  [(BWNode *)&v14 dealloc];
}

void __31__BWBackgroundBlurNode_dealloc__block_invoke(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)&sPTEffectSuspensionLock);
  if (sSuspendedPTEffect && sSuspendedPTEffectID == *(_DWORD *)(a1 + 32))
  {

    sSuspendedPTEffect = 0;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&sPTEffectSuspensionLock);
}

- (id)nodeSubType
{
  return @"BackgroundBlurNode";
}

- (void)didReachEndOfDataForInput:(id)a3
{
  if (!self->_effectBypassed) {
    -[BWBackgroundBlurNode _reportBackgroundBlurCoreAnalyticsData]((uint64_t)self);
  }
  [(BWLimitedGMErrorLogger *)self->_limitedGMErrorLogger resetCurrentLoggingCounter];
  if (self->_videoInput == a3)
  {
    [(BWNodeOutput *)self->_videoOutput markEndOfLiveOutput];
    [(BWDeviceOrientationMonitor *)self->_deviceOrientationMonitor stop];
  }
  if (self->_stillImageInput == a3)
  {
    stillImageOutput = self->_stillImageOutput;
    [(BWNodeOutput *)stillImageOutput markEndOfLiveOutput];
  }
}

- (uint64_t)_reportBackgroundBlurCoreAnalyticsData
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = objc_alloc_init(BWBackgroundBlurSessionAnalyticsPayload);
    [(BWBackgroundBlurSessionAnalyticsPayload *)v2 setClientApplicationID:*(void *)(v1 + 248)];
    [(BWBackgroundBlurSessionAnalyticsPayload *)v2 setEffectQuality:*(void *)(v1 + 464)];
    [*(id *)(v1 + 264) average];
    -[BWBackgroundBlurSessionAnalyticsPayload setAverageProcessingTime:](v2, "setAverageProcessingTime:");
    [*(id *)(v1 + 264) max];
    -[BWBackgroundBlurSessionAnalyticsPayload setMaxProcessingTime:](v2, "setMaxProcessingTime:");
    -[BWBackgroundBlurSessionAnalyticsPayload setNumberOfFrames:](v2, "setNumberOfFrames:", [*(id *)(v1 + 264) numberOfSamples]);
    [(BWBackgroundBlurSessionAnalyticsPayload *)v2 setNumberOfFrameDrops:*(unsigned int *)(v1 + 272)];
    [(BWBackgroundBlurSessionAnalyticsPayload *)v2 setMaxThermalSystemPressureLevel:*(unsigned int *)(v1 + 276)];
    int v3 = +[BWCoreAnalyticsReporter sharedInstance];
    return [(BWCoreAnalyticsReporter *)v3 sendEvent:v2];
  }
  return result;
}

- (CVPixelBufferRef)_savePixelBufferForStillImageCaptureRequests:(long long *)a3 withPts:
{
  if (result)
  {
    CVPixelBufferRef v5 = result;
    int64_t v6 = (__CVBuffer *)*((void *)result + 4 * *((unsigned int *)result + 58) + 21);
    if (v6) {
      CVPixelBufferRelease(v6);
    }
    long long v10 = *a3;
    uint64_t v11 = *((void *)a3 + 2);
    id result = CVPixelBufferRetain(texture);
    uint64_t v7 = (uint64_t)v5 + 32 * *((unsigned int *)v5 + 58) + 168;
    *(void *)uint64_t v7 = result;
    *(void *)(v7 + 24) = v11;
    *(_OWORD *)(v7 + 8) = v10;
    int v8 = *((_DWORD *)v5 + 58);
    if (v8 == 1) {
      int v9 = 0;
    }
    else {
      int v9 = v8 + 1;
    }
    *((_DWORD *)v5 + 58) = v9;
  }
  return result;
}

- (void)_createMatchingPixelBufferFromSavedVideoBuffersWithTargetPts:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v3 = 0;
    dispatch_time_t v4 = 0;
    CVPixelBufferRef v5 = *a2;
    unint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
    char v7 = 1;
    while (1)
    {
      char v8 = v7;
      int v9 = (__CVBuffer **)(a1 + 168 + 32 * v3);
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
        dispatch_time_t v4 = v11;
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
        return -[BWBackgroundBlurNode _newStillImageOutputPixelBufferFromVideoPixelBuffer:](a1, v4);
      }
    }
    dispatch_time_t v4 = v11;
    if (v11) {
      return -[BWBackgroundBlurNode _newStillImageOutputPixelBufferFromVideoPixelBuffer:](a1, v4);
    }
  }
  return 0;
}

- (unint64_t)activeBlurEffect
{
  return self->_activeBlurEffect;
}

- (void)_newStillImageOutputPixelBufferFromVideoPixelBuffer:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  uint64_t v3 = 0;
  if (a2)
  {
    if (*(void *)(a1 + 160))
    {
      uint64_t v3 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 144), "primaryMediaProperties"), "livePixelBufferPool"), "newPixelBuffer");
      if (v3)
      {
        if (VTPixelTransferSessionTransferImage(*(VTPixelTransferSessionRef *)(a1 + 160), a2, (CVPixelBufferRef)v3))
        {
          CFRelease(v3);
          return 0;
        }
      }
    }
  }
  return v3;
}

uint64_t __82__BWBackgroundBlurNode__updateActiveReactions_currentRenderPTS_requestedTriggers___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v9[2] = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(a1 + 32) + 408) removeObjectForKey:a2];
  uint64_t result = bbn_StringForPTEffectReactionType([a3 effectType]);
  if (result)
  {
    unint64_t v6 = *(void **)(a1 + 40);
    v8[0] = @"ReactionType";
    v8[1] = @"StartTime";
    v9[0] = result;
    char v7 = NSNumber;
    [a3 startTime];
    v9[1] = objc_msgSend(v7, "numberWithDouble:");
    return objc_msgSend(v6, "addObject:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v9, v8, 2));
  }
  return result;
}

uint64_t __82__BWBackgroundBlurNode__updateActiveReactions_currentRenderPTS_requestedTriggers___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  v12[3] = *MEMORY[0x1E4F143B8];
  uint64_t result = bbn_StringForPTEffectReactionType([a3 effectType]);
  if (result)
  {
    uint64_t v6 = result;
    char v7 = *(void **)(a1 + 32);
    v12[0] = result;
    v11[0] = @"ReactionType";
    v11[1] = @"StartTime";
    char v8 = NSNumber;
    [a3 startTime];
    v12[1] = objc_msgSend(v8, "numberWithDouble:");
    v11[2] = @"EndTime";
    CMTime v10 = *(CMTime *)(a1 + 48);
    v12[2] = [NSNumber numberWithDouble:CMTimeGetSeconds(&v10)];
    objc_msgSend(v7, "addObject:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v12, v11, 3));
    int v9 = objc_alloc_init(BWReactionAnalyticsPayload);
    [(BWReactionAnalyticsPayload *)v9 setReactionType:v6];
    -[BWReactionAnalyticsPayload setUiTriggeredReaction:](v9, "setUiTriggeredReaction:", [a3 uiTriggeredReaction]);
    [(BWReactionAnalyticsPayload *)v9 setClientApplicationID:*(void *)(*(void *)(a1 + 40) + 248)];
    [(BWReactionAnalyticsPayload *)v9 setContinuityCameraClientDeviceClass:*(unsigned int *)(*(void *)(a1 + 40) + 256)];
    uint64_t result = [+[BWCoreAnalyticsReporter sharedInstance] sendEvent:v9];
    ++*(_DWORD *)(*(void *)(a1 + 40) + 376);
  }
  return result;
}

uint64_t __82__BWBackgroundBlurNode__updateActiveReactions_currentRenderPTS_requestedTriggers___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  dispatch_time_t v4 = (void *)[a2 objectForKeyedSubscript:@"StartTime"];
  uint64_t v5 = [a3 objectForKeyedSubscript:@"StartTime"];
  return [v4 compare:v5];
}

- (void)didChangePortraitEffectStudioLightQuality:(int64_t)a3
{
  if (self->_ptEffect)
  {
    if (self->_effectQuality != a3) {
      -[BWBackgroundBlurNode setEffectQuality:](self, "setEffectQuality:");
    }
  }
}

- (void)performReactionEffect:(id)a3
{
  p_bufferServicingLock = &self->_bufferServicingLock;
  os_unfair_lock_lock(&self->_bufferServicingLock);
  if (bbn_PTEffectReactionTypeForString_onceToken != -1) {
    dispatch_once(&bbn_PTEffectReactionTypeForString_onceToken, &__block_literal_global_279);
  }
  uint64_t v6 = (void *)[(id)bbn_PTEffectReactionTypeForString_sMapNameToReactionType objectForKeyedSubscript:a3];
  if (v6 && (unint64_t v7 = [v6 unsignedIntegerValue], v7 <= 7))
  {
    unint64_t v8 = v7;
    id v9 = objc_alloc_init((Class)getPTEffectReactionClass());
    [v9 setEffectType:v8];
    [v9 setUiTriggeredReaction:1];
    int64_t reactionCounterAPI = self->_reactionCounterAPI;
    self->_int64_t reactionCounterAPI = reactionCounterAPI + 1;
    [v9 setTriggerID:~reactionCounterAPI];
    [(NSMutableArray *)self->_pendingPTEffectReactions addObject:v9];
  }
  else
  {
    id v9 = 0;
  }

  os_unfair_lock_unlock(p_bufferServicingLock);
}

- (unsigned)reactionCount
{
  return self->_reactionCounterAll;
}

- (void)lowPowerModeChanged:(id)a3
{
  dispatch_time_t v4 = (void *)[a3 name];
  if ([v4 isEqualToString:*MEMORY[0x1E4F287E8]])
  {
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28F80], "processInfo"), "isLowPowerModeEnabled"))
    {
      uint64_t v5 = self;
      uint64_t v6 = 100;
    }
    else
    {
      if (!self->_isHighQualityEffectSupported) {
        return;
      }
      uint64_t v5 = self;
      uint64_t v6 = 110;
    }
    [(BWBackgroundBlurNode *)v5 setEffectQuality:v6];
  }
}

- (BWNodeInput)stillImageInput
{
  return self->_stillImageInput;
}

- (BWNodeOutput)stillImageOutput
{
  return self->_stillImageOutput;
}

- (NSString)clientApplicationID
{
  return self->_clientApplicationID;
}

- (int)continuityCameraClientDeviceClass
{
  return self->_continuityCameraClientDeviceClass;
}

- (int64_t)effectQuality
{
  return self->_effectQuality;
}

@end