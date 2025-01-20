@interface BWIrisStagingNode
+ (void)initialize;
- ($2ACC23B9A21F50F5CC728381CA870116)vitalityScoringSmartCameraPipelineVersion;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)beginIrisMovieCaptureTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)bufferingTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)endIrisMovieCaptureTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)targetFrameDuration;
- (BOOL)_haveEnoughVideoStagedToStartFirstIrisRecording:(CMTime *)a3 currentTime:(CMTime *)a4 emitEndTimeOut:;
- (BOOL)applyPreviewShift;
- (BOOL)valveIsOpen;
- (BOOL)waitUntilReadyToReceiveRequestsWithTimeout:(float)a3;
- (BWIrisStagingNode)initWithNumberOfVideoInputs:(unint64_t)a3 numberOfAudioInputs:(unint64_t)a4 numberOfMetadataInputs:(unint64_t)a5 autoTrimMethod:(int)a6 vitalityScoringEnabled:(BOOL)a7 captureDeviceHasOverCaptureEnabled:(BOOL)a8 overCaptureEnabled:(BOOL)a9 depthEnabled:(BOOL)a10 videoStabilizationOverscanOverride:(float)a11 sequenceAdjusterEnabled:(BOOL)a12 visMotionMetadataPreloadingMode:(int)a13 frameReconstructionEnabled:(BOOL)a14 subjectRelightingEnabled:(BOOL)a15 intermediateJPEGCompressionQuality:(float)a16 intermediateJPEGCompressionRate:(float)a17 maxLossyCompressionLevel:(int)a18 temporaryMovieDirectoryURL:(id)a19 cameraInfoByPortType:(id)a20 smartStyleRenderingEnabled:(BOOL)a21 smartStyleReversibilityEnabled:(BOOL)a22 irisRequestDelegate:(id)a23;
- (BWMotionDataTimeMachine)motionDataTimeMachine;
- (CMTime)_adjustedStartTimeForTrimmedStartTime:(CMTime *)a3@<X2> ensuringAtLeast3FramesBeforeStillTime:(int)a4@<W3> ensuringFrameIsAfterTrimmedStartTime:(CMTime *)a5@<X4> butNotEarlierThanOriginalStartTime:(uint64_t *)a6@<X5> adjustedStartBufferIndexOut:(uint64_t)a7@<X8>;
- (CMTime)_earliestAllowedStillHostPTS;
- (CMTime)_emitSampleBuffer:(uint64_t)a3 forInputIndex:;
- (CMTime)_hostPTSForSampleBuffer:(uint64_t)a3@<X8>;
- (CMTime)_maxPTSForIrisRequest:(uint64_t)a3@<X8>;
- (CMTime)_mostRecentCuttingBufferPTSBeforePTS:(uint64_t *)a3@<X2> cuttingBufferIndexOut:(uint64_t)a4@<X8>;
- (NSURL)temporaryMovieDirectoryURL;
- (OpaqueCMClock)masterClock;
- (__n128)_prepareToEmitFramesFromStartTime:(uint64_t)a3 throughEndTime:;
- (double)_resumeStaging;
- (float)_appliedZoomFromSampleBuffer:(uint64_t)a1;
- (int)enqueueIrisRequest:(id)a3;
- (int)intermediateJPEGDownstreamRetainedBufferCount;
- (int)openValveWithIrisRequest:(id)a3;
- (uint64_t)_adjustedStartTimeForSmartStyle:(int)a3@<W2> allowSearchBackward:(CMTime *)a4@<X3> searchEndPTS:(uint64_t *)a5@<X4> adjustedStartBufferIndexOut:(CMTime *)a6@<X8>;
- (uint64_t)_emissionStatusForSampleBuffer:(uint64_t)result;
- (uint64_t)_emitBuffersThroughPTS:(uint64_t)a3 forInputIndex:(unint64_t *)a4 inOutBufferIndex:(unint64_t)a5 bufferCount:;
- (uint64_t)_emitBuffersThroughPTS:(uint64_t)result;
- (uint64_t)_emitIrisRequest:(uint64_t)a3 withEndingVideoSampleTimingInfo:;
- (uint64_t)_emitIrisRequestsOlderThanTime:(long long *)a3 withEndingVideoSampleTimingInfo:;
- (uint64_t)_emittingInputsCount;
- (uint64_t)_enqueueIrisRequest:(uint64_t)result;
- (uint64_t)_feedTrimmerWithInferencesSampleBuffer:(uint64_t)result;
- (uint64_t)_feedTrimmerWithVideoSampleBuffer:(uint64_t)result;
- (uint64_t)_fillInRefMovieStartAndTrimTimesForStillImageTimesBeforeTime:(uint64_t)result;
- (uint64_t)_fillInStartAndTrimTimesForMasterMovieWithInfo:(uint64_t)result;
- (uint64_t)_flushAndSuspendStaging;
- (uint64_t)_indexOfBufferBeforeOrEqualToHostPTS:(uint64_t)a3 inputIndex:(CMTime *)a4 tolerance:;
- (uint64_t)_informDelegateOfSoonToBeEmittedIrisRequestsForTime:(uint64_t)result;
- (uint64_t)_momentCaptureMovieRecordingInProgress;
- (uint64_t)_processQueuedVideoFrames;
- (uint64_t)_sbufHasSmartStyleReversibilityAttachedMedia:(uint64_t)a1;
- (uint64_t)_setupDepthMediaConfigurationForInput:(uint64_t)a3 attachedMediaKey:;
- (uint64_t)_setupDepthMediaConfigurationForOutput:(uint64_t)a3 attachedMediaKey:;
- (uint64_t)_setupSmartStyleMediaConfigurationsForInput:(uint64_t)result;
- (uint64_t)_setupSmartStyleMediaConfigurationsForOutput:(uint64_t)result;
- (uint64_t)_suspendStaging;
- (uint64_t)_tagStillImageVISKeyFrames;
- (uint64_t)_updateRetainedBufferCount;
- (uint64_t)_updateSmartStyleRenderingBypassedForIrisMovieInfo:(uint64_t)a3 startBufferIndex:;
- (unint64_t)_indexOfBufferBeforeOrEqualToPTS:(id *)a3 inputIndex:(unint64_t)a4 applyFrameDropsMitigation:(BOOL)a5;
- (unint64_t)_trimQueueForInputIndex:(unint64_t)result;
- (void)_emitIrisMovieRequestWithInfo:(void *)a1;
- (void)_findAndMarkCuttingBufferForVideoSbuf:(uint64_t)a1;
- (void)_serviceIrisRequestsForCurrentTime:(int)a3 emitBuffers:(int)a4 ensureStillImageTimesAreStaged:;
- (void)_signalReadyToReceiveRequestsWithEarliestAllowedStillHostPTS:(uint64_t)a1;
- (void)closeValve;
- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5;
- (void)dealloc;
- (void)didReachEndOfDataForInput:(id)a3;
- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5;
- (void)handleDroppedSample:(id)a3 forInput:(id)a4;
- (void)handleNodeError:(id)a3 forInput:(id)a4;
- (void)prepareForCurrentConfigurationToBecomeLive;
- (void)prepareToFinishAllEnqueuedIrisRequestsWithEndTime:(id *)a3;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
- (void)setApplyPreviewShift:(BOOL)a3;
- (void)setBeginIrisMovieCaptureTime:(id *)a3;
- (void)setBufferingTime:(id *)a3;
- (void)setEndIrisMovieCaptureTime:(id *)a3;
- (void)setIntermediateJPEGDownstreamRetainedBufferCount:(int)a3;
- (void)setMasterClock:(OpaqueCMClock *)a3;
- (void)setMomentCaptureMovieRecordingMasterEndTime:(id *)a3 forRequestWithSettingsID:(int64_t)a4;
- (void)setStagingQueues:(id)a3;
- (void)setTargetFrameDuration:(id *)a3;
- (void)setVitalityScoringSmartCameraPipelineVersion:(id)a3;
@end

@implementation BWIrisStagingNode

- (CMTime)_earliestAllowedStillHostPTS
{
  if (result)
  {
    v3 = result;
    FigSimpleMutexCheckIsLockedOnThisThread();
    v4 = (void *)[*(id *)&v3[15].timescale objectAtIndexedSubscript:0];
    uint64_t v5 = MEMORY[0x1E4F1FA10];
    *(_OWORD *)a2 = *MEMORY[0x1E4F1FA10];
    *(void *)(a2 + 16) = *(void *)(v5 + 16);
    result = (CMTime *)[v4 count];
    if ((unint64_t)result >= 2)
    {
      -[BWIrisStagingNode _hostPTSForSampleBuffer:]((void *)[v4 objectAtIndexedSubscript:1], v3, (uint64_t)&v8);
      *(CMTime *)a2 = v8;
      CMTimeMake(&rhs, *(_DWORD *)(a2 + 8) / 1000, *(_DWORD *)(a2 + 8));
      CMTime v6 = *(CMTime *)a2;
      result = CMTimeAdd(&v8, &v6, &rhs);
      *(CMTime *)a2 = v8;
    }
  }
  else
  {
    *(void *)a2 = 0;
    *(void *)(a2 + 8) = 0;
    *(void *)(a2 + 16) = 0;
  }
  return result;
}

- (uint64_t)_feedTrimmerWithVideoSampleBuffer:(uint64_t)result
{
  v49[3] = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v3 = result;
    v4 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0);
    uint64_t v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F53F90]];
    CMTime v6 = *(void **)(v3 + 496);
    [(BWIrisStagingNode *)target _hostPTSForSampleBuffer:(uint64_t)v46];
    result = [v6 processISPMotionData:v5 forHostTime:v46];
    if (*(unsigned char *)(v3 + 484))
    {
      v45.origin.x = 0.0;
      v45.origin.y = 0.0;
      __asm { FMOV            V0.2D, #1.0 }
      v45.size = _Q0;
      if (FigCFDictionaryGetCGRectIfPresent())
      {
        v51.origin.x = 0.0;
        v51.origin.y = 0.0;
        v51.size.CGFloat width = 1.0;
        v51.size.height = 1.0;
        BOOL v31 = !CGRectEqualToRect(v45, v51);
      }
      else
      {
        BOOL v31 = 0;
      }
      v33 = (void *)[v4 objectForKeyedSubscript:*MEMORY[0x1E4F53DC8]];
      result = [v33 count];
      if (result)
      {
        uint64_t v12 = *MEMORY[0x1E4F538A0];
        v49[0] = *MEMORY[0x1E4F538C8];
        v49[1] = v12;
        v49[2] = *MEMORY[0x1E4F538B0];
        long long v41 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        id obj = (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:3];
        result = [obj countByEnumeratingWithState:&v41 objects:v48 count:16];
        if (result)
        {
          uint64_t v13 = result;
          uint64_t v27 = v3;
          uint64_t v14 = 0;
          uint64_t v15 = *(void *)v42;
          uint64_t v30 = *MEMORY[0x1E4F538F8];
          uint64_t v28 = *MEMORY[0x1E4F54348];
          uint64_t v32 = -1;
          do
          {
            uint64_t v16 = 0;
            do
            {
              if (*(void *)v42 != v15) {
                objc_enumerationMutation(obj);
              }
              v17 = (void *)[v33 objectForKeyedSubscript:*(void *)(*((void *)&v41 + 1) + 8 * v16)];
              if (v17)
              {
                v18 = v17;
                v19 = (void *)[v17 objectForKeyedSubscript:v30];
                v20 = v19;
                if (v31)
                {
                  long long v39 = 0u;
                  long long v40 = 0u;
                  long long v37 = 0u;
                  long long v38 = 0u;
                  uint64_t v21 = [v19 countByEnumeratingWithState:&v37 objects:v47 count:16];
                  if (v21)
                  {
                    uint64_t v22 = v21;
                    uint64_t v23 = *(void *)v38;
                    do
                    {
                      for (uint64_t i = 0; i != v22; ++i)
                      {
                        if (*(void *)v38 != v23) {
                          objc_enumerationMutation(v20);
                        }
                        memset(&v36, 0, sizeof(v36));
                        if (FigCFDictionaryGetCGRectIfPresent())
                        {
                          CGRect v50 = CGRectIntersection(v36, v45);
                          if (v50.size.width * v50.size.height <= v36.size.width * v36.size.height * 0.5) {
                            uint64_t v14 = v14;
                          }
                          else {
                            uint64_t v14 = (v14 + 1);
                          }
                        }
                      }
                      uint64_t v22 = [v20 countByEnumeratingWithState:&v37 objects:v47 count:16];
                    }
                    while (v22);
                  }
                }
                else
                {
                  uint64_t v14 = v14 + [v19 count];
                }
                if (v32 < 0) {
                  uint64_t v32 = objc_msgSend((id)objc_msgSend(v18, "objectForKeyedSubscript:", v28), "longLongValue");
                }
              }
              ++v16;
            }
            while (v16 != v13);
            result = [obj countByEnumeratingWithState:&v41 objects:v48 count:16];
            uint64_t v13 = result;
          }
          while (result);
          if ((int)v14 >= 1 && (v32 & 0x8000000000000000) == 0)
          {
            memset(&v36, 0, 24);
            int64_t v25 = FigHostTimeToNanoseconds();
            CMTimeMake((CMTime *)&v36, v25, 1000000000);
            v26 = *(void **)(v27 + 496);
            CGPoint origin = v36.origin;
            CGFloat width = v36.size.width;
            return [v26 processCountOfVisibleVitalityObjects:v14 forHostTime:&origin];
          }
        }
      }
    }
  }
  return result;
}

- (CMTime)_hostPTSForSampleBuffer:(uint64_t)a3@<X8>
{
  if (result)
  {
    uint64_t v5 = (uint64_t)result;
    uint64_t v6 = MEMORY[0x1E4F1F9F8];
    *(_OWORD *)a3 = *MEMORY[0x1E4F1F9F8];
    *(void *)(a3 + 16) = *(void *)(v6 + 16);
    CFDictionaryRef v7 = (const __CFDictionary *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F530C0], 0);
    if (v7)
    {
      result = CMTimeMakeFromDictionary(&v13, v7);
      *(_OWORD *)a3 = *(_OWORD *)&v13.value;
      CMTimeEpoch epoch = v13.epoch;
    }
    else
    {
      memset(&v13, 0, sizeof(v13));
      CMSampleBufferGetPresentationTimeStamp(&v13, (CMSampleBufferRef)target);
      v9 = *(const void **)(v5 + 472);
      CMClockRef HostTimeClock = CMClockGetHostTimeClock();
      CMTime v11 = v13;
      result = CMSyncConvertTime(&v12, &v11, v9, HostTimeClock);
      *(_OWORD *)a3 = *(_OWORD *)&v12.value;
      CMTimeEpoch epoch = v12.epoch;
    }
    *(void *)(a3 + 16) = epoch;
  }
  else
  {
    *(void *)a3 = 0;
    *(void *)(a3 + 8) = 0;
    *(void *)(a3 + 16) = 0;
  }
  return result;
}

- (uint64_t)_updateRetainedBufferCount
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    v2 = (void *)[(id)result inputs];
    result = [v2 count];
    if (result)
    {
      if (*(unsigned char *)(v1 + 108) & 1) != 0 && (*(unsigned char *)(v1 + 132))
      {
        CMTime time1 = *(CMTime *)(v1 + 120);
        CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
        result = CMTimeCompare(&time1, &time2);
        if ((int)result >= 1)
        {
          uint64_t v3 = (void *)[v2 objectAtIndexedSubscript:0];
          CMTime time1 = *(CMTime *)(v1 + 96);
          double Seconds = CMTimeGetSeconds(&time1);
          CMTime time1 = *(CMTime *)(v1 + 120);
          double v5 = ceil(Seconds / CMTimeGetSeconds(&time1)) + 1.0 + 3.0;
          uint64_t v6 = (int *)(int)(v5
                                        + (double)(int)[*(id *)(v1 + 552) audioOffsetForOriginalStillImageTimeMaximumFrameLatency]);
          int v7 = [*(id *)(v1 + 552) audioOffsetForOriginalStillImageTimeMaximumFrameLatency];
          uint64_t v8 = ((7 - *(_DWORD *)(v1 + 608) - v7) & ~((7 - *(_DWORD *)(v1 + 608) - v7) >> 31)) + v6;
          if (*(_DWORD *)(v1 + 576))
          {
            uint64_t v6 = &OBJC_IVAR___FigCaptureSessionParsedConfiguration__parsedDepthDataSinkConfigurations;
            v9 = *(void **)(v1 + 568);
            if (v9)
            {

              *(void *)(v1 + 568) = 0;
            }
            int v10 = (int)((double)(int)v8 * 1.5);
            *(void *)(v1 + 568) = [[BWMotionDataTimeMachine alloc] initWithCapacity:v10 synchronizedSlaveMotionDataCachingEnabled:*(_DWORD *)(v1 + 576) == 2 cacheEntireMetadataDictionary:0];
            double v11 = (double)v10;
          }
          else
          {
            double v11 = 0.0;
          }
          if (*(unsigned char *)(v1 + 640))
          {
            [v3 setRetainedBufferCount:0];
            [v3 setDelayedBufferCount:0];
            *(_DWORD *)(v1 + 612) = v8;
          }
          else
          {
            [v3 setDelayedBufferCount:v8];
          }
          double v12 = BWSmartStyleLearningMaxFrameRate();
          CMTime time1 = *(CMTime *)(v1 + 120);
          double v13 = CMTimeGetSeconds(&time1);
          long long v24 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          uint64_t v14 = objc_msgSend(v3, "specifiedAttachedMediaKeys", 0);
          result = [v14 countByEnumeratingWithState:&v24 objects:v30 count:16];
          if (result)
          {
            uint64_t v15 = result;
            double v16 = v12 / (1.0 / v13);
            uint64_t v17 = *(void *)v25;
            LODWORD(v6) = vcvtpd_s64_f64(v16 * (double)(int)v8);
            double v18 = ceil(v11 * v16);
            do
            {
              uint64_t v19 = 0;
              do
              {
                if (*(void *)v25 != v17) {
                  objc_enumerationMutation(v14);
                }
                v20 = *(void **)(*((void *)&v24 + 1) + 8 * v19);
                uint64_t v21 = (void *)[v3 mediaConfigurationForAttachedMediaKey:v20];
                [v21 setDelayedBufferCount:v8];
                if ([(id)BWAttachedMediaKeysAvailableOnSmartStyleLearnedFramesOnly() containsObject:v20])objc_msgSend(v21, "setDelayedBufferCount:", v6); {
                if ([v20 isEqualToString:0x1EFA74840])
                }
                {
                  int v22 = [v21 delayedBufferCount];
                  double v23 = v18;
                  if (v18 < (double)v22) {
                    double v23 = (double)(int)objc_msgSend(v21, "delayedBufferCount", v18);
                  }
                  [v21 setDelayedBufferCount:(int)v23];
                }
                ++v19;
              }
              while (v15 != v19);
              result = [v14 countByEnumeratingWithState:&v24 objects:v30 count:16];
              uint64_t v15 = result;
            }
            while (result);
          }
        }
      }
    }
  }
  return result;
}

- (void)setVitalityScoringSmartCameraPipelineVersion:(id)a3
{
  HIWORD(self->_trimMethod) = a3.var2;
  *(_DWORD *)((char *)&self->_masterClock + 6) = *(_DWORD *)&a3.var0;
}

- (void)setTargetFrameDuration:(id *)a3
{
  int64_t var3 = a3->var3;
  *(_OWORD *)&self->_targetFrameDuration.value = *(_OWORD *)&a3->var0;
  self->_targetFrameDuration.CMTimeEpoch epoch = var3;
  -[BWIrisStagingNode _updateRetainedBufferCount]((uint64_t)self);
}

- (void)setMasterClock:(OpaqueCMClock *)a3
{
  firstEmittedPTSArray = self->_firstEmittedPTSArray;
  self->_firstEmittedPTSArray = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)a3;
  if (a3) {
    CFRetain(a3);
  }
  if (firstEmittedPTSArray)
  {
    CFRelease(firstEmittedPTSArray);
  }
}

- (void)setIntermediateJPEGDownstreamRetainedBufferCount:(int)a3
{
  LODWORD(self->_intermediateJPEGCompressionQuality) = a3;
  -[BWIrisStagingNode _updateRetainedBufferCount]((uint64_t)self);
}

- (void)setBufferingTime:(id *)a3
{
  int64_t var3 = a3->var3;
  *(_OWORD *)&self->_bufferingTime.value = *(_OWORD *)&a3->var0;
  self->_bufferingTime.CMTimeEpoch epoch = var3;
  -[BWIrisStagingNode _updateRetainedBufferCount]((uint64_t)self);
}

- (void)setApplyPreviewShift:(BOOL)a3
{
  LOBYTE(self->_subjectRelightingResult) = a3;
}

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  if (objc_msgSend(a5, "index", a3, a4) != *(void *)&self->_trimLivePhotoMovieAtWideAndSuperWideAutoSwitching)
  {
    id v7 = -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](self, "outputs"), "objectAtIndexedSubscript:", [a5 index]);
    [v7 makeConfiguredFormatLive];
  }
}

- (void)handleDroppedSample:(id)a3 forInput:(id)a4
{
  if (![a4 index])
  {
    memset(&v9[1], 0, sizeof(CMTime));
    if (a3) {
      [a3 pts];
    }
    CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    v9[0] = v9[1];
    CFDictionaryRef v7 = CMTimeCopyAsDictionary(v9, v6);
    if (v7)
    {
      CFDictionaryRef v8 = v7;
      [(NSMutableArray *)self->_lastEmittedBuffers addObject:v7];
      CFRelease(v8);
    }
  }
}

uint64_t __45__BWIrisStagingNode__trimQueueForInputIndex___block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  int v6 = [*(id *)(a1 + 32) mediaType];
  uint64_t result = a2;
  if (v6 != 1835365473)
  {
    if (*(void *)(a1 + 56) - 1 <= a3) {
      return 0;
    }
    uint64_t result = [*(id *)(a1 + 40) objectAtIndexedSubscript:a3 + 1];
  }
  if (!result) {
    return result;
  }
  CMSampleBufferGetPresentationTimeStamp(&time1, (CMSampleBufferRef)result);
  CMTime v8 = *(CMTime *)(a1 + 72);
  if ((CMTimeCompare(&time1, &v8) & 0x80000000) == 0) {
    return 0;
  }
  if ([*(id *)(*(void *)(a1 + 48) + 376) objectAtIndexedSubscript:*(void *)(a1 + 64)] == a2) {
    objc_msgSend(*(id *)(*(void *)(a1 + 48) + 376), "setObject:atIndexedSubscript:", objc_msgSend(MEMORY[0x1E4F1CA98], "null"), *(void *)(a1 + 64));
  }
  return 1;
}

- (BWMotionDataTimeMachine)motionDataTimeMachine
{
  return (BWMotionDataTimeMachine *)self->_sequenceAdjuster;
}

- (BWIrisStagingNode)initWithNumberOfVideoInputs:(unint64_t)a3 numberOfAudioInputs:(unint64_t)a4 numberOfMetadataInputs:(unint64_t)a5 autoTrimMethod:(int)a6 vitalityScoringEnabled:(BOOL)a7 captureDeviceHasOverCaptureEnabled:(BOOL)a8 overCaptureEnabled:(BOOL)a9 depthEnabled:(BOOL)a10 videoStabilizationOverscanOverride:(float)a11 sequenceAdjusterEnabled:(BOOL)a12 visMotionMetadataPreloadingMode:(int)a13 frameReconstructionEnabled:(BOOL)a14 subjectRelightingEnabled:(BOOL)a15 intermediateJPEGCompressionQuality:(float)a16 intermediateJPEGCompressionRate:(float)a17 maxLossyCompressionLevel:(int)a18 temporaryMovieDirectoryURL:(id)a19 cameraInfoByPortType:(id)a20 smartStyleRenderingEnabled:(BOOL)a21 smartStyleReversibilityEnabled:(BOOL)a22 irisRequestDelegate:(id)a23
{
  BOOL v73 = a8;
  unint64_t v23 = a4 + a3;
  size_t v78 = a4 + a3 + a5;
  if (!v78)
  {
    v67 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v68 = *MEMORY[0x1E4F1C3C8];
    v69 = @"Need at least 1 input";
    goto LABEL_70;
  }
  BOOL v27 = a7;
  unint64_t v31 = a3;
  if (a9 && !a8)
  {
    v67 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v68 = *MEMORY[0x1E4F1C3C8];
    v69 = @"captureDeviceHasOverCaptureEnabled must be true when overCaptureEnabled is true";
LABEL_70:
    objc_exception_throw((id)objc_msgSend(v67, "exceptionWithName:reason:userInfo:", v68, v69, 0, *(void *)&a6, a7));
  }
  v79.receiver = self;
  v79.super_class = (Class)BWIrisStagingNode;
  uint64_t v32 = [(BWNode *)&v79 init];
  uint64_t v33 = (uint64_t)v32;
  if (!v32) {
    return (BWIrisStagingNode *)v33;
  }
  unint64_t v71 = a5;
  unint64_t v72 = a4;
  [(BWNode *)v32 setSupportsConcurrentLiveInputCallbacks:1];
  *(void *)(v33 + 368) = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  *(void *)(v33 + 376) = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  *(void *)(v33 + 384) = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  *(void *)(v33 + 432) = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  *(void *)(v33 + 440) = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  *(void *)(v33 + 648) = a20;
  *(void *)(v33 + 584) = a23;
  v34 = (long long *)MEMORY[0x1E4F1F9F8];
  uint64_t v76 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  *(void *)(v33 + 212) = v76;
  long long v75 = *v34;
  *(_OWORD *)(v33 + 196) = *v34;
  *(unsigned char *)(v33 + 786) = a21;
  BOOL v70 = v27;
  *(unsigned char *)(v33 + 787) = a22;
  *(_DWORD *)(v33 + 480) = a6;
  *(unsigned char *)(v33 + 484) = v27;
  BOOL v35 = a10;
  *(unsigned char *)(v33 + 764) = a15;
  *(void *)(v33 + 456) = FigSimpleMutexCreate();
  *(void *)(v33 + 464) = malloc_type_calloc(v78, 0x18uLL, 0x1000040504FFAC1uLL);
  *(float *)(v33 + 600) = a16;
  *(float *)(v33 + 604) = a17;
  BOOL v36 = a17 > 0.0;
  if (*(float *)(v33 + 600) > 0.0) {
    BOOL v36 = 1;
  }
  *(unsigned char *)(v33 + 640) = v36;
  v77 = (void *)[MEMORY[0x1E4F1CA48] array];
  uint64_t v37 = 0;
  unint64_t v38 = 0;
  unint64_t v74 = v23;
  do
  {
    if (v38 >= v31) {
      unsigned int v39 = 1936684398;
    }
    else {
      unsigned int v39 = 1986618469;
    }
    BOOL v40 = v38 < v23 && v38 < v31;
    if (v38 >= v23) {
      uint64_t v41 = 1835365473;
    }
    else {
      uint64_t v41 = v39;
    }
    objc_msgSend(v77, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v41));
    long long v42 = [[BWNodeInput alloc] initWithMediaType:v41 node:v33 index:v38];
    if (v40)
    {
      long long v43 = objc_alloc_init(BWVideoFormatRequirements);
      if (*(unsigned char *)(v33 + 640))
      {
        long long v44 = (void *)[MEMORY[0x1E4F1CA48] arrayWithArray:&unk_1EFB030C8];
        objc_msgSend(v44, "addObjectsFromArray:", FigCaptureSupportedPixelFormatsForCompressionType(4, 0, 0, a18));
        [(BWVideoFormatRequirements *)v43 setSupportedPixelFormats:v44];
      }
      [(BWNodeInput *)v42 setFormatRequirements:v43];

      [(BWNodeInput *)v42 setPassthroughMode:*(unsigned char *)(v33 + 640) == 0];
      *(unsigned char *)(v33 + 684) = v73;
      if (v73)
      {
        if (*(unsigned char *)(v33 + 640)) {
          BOOL v45 = a9;
        }
        else {
          BOOL v45 = 0;
        }
        *(unsigned char *)(v33 + 220) = v45;
        v46 = objc_alloc_init(BWNodeInputMediaConfiguration);
        [(BWNodeInputMediaConfiguration *)v46 setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
        if (a9)
        {
          [(BWNodeInputMediaConfiguration *)v46 setPassthroughMode:*(unsigned char *)(v33 + 220) == 0];
          [(BWNodeInput *)v42 setMediaConfiguration:v46 forAttachedMediaKey:@"SynchronizedSlaveFrame"];
          *(_DWORD *)(v33 + 688) = 1053609165;
        }
        else
        {
          [(BWNodeInputMediaConfiguration *)v46 setPassthroughMode:0];
          [(BWNodeInput *)v42 setMediaConfiguration:v46 forAttachedMediaKey:@"SynchronizedSlaveFrame"];
        }
        BOOL v35 = a10;
      }
      unint64_t v23 = v74;
      if (v35)
      {
        -[BWIrisStagingNode _setupDepthMediaConfigurationForInput:attachedMediaKey:](v33, v42, @"DepthData_DX");
        -[BWIrisStagingNode _setupDepthMediaConfigurationForInput:attachedMediaKey:](v33, v42, @"DepthData_DY");
      }
      *(float *)(v33 + 680) = a11;
    }
    [(id)v33 addInput:v42];
    v47 = [[BWNodeOutput alloc] initWithMediaType:v41 node:v33];
    if (v40)
    {
      v48 = objc_alloc_init(BWVideoFormatRequirements);
      [(BWNodeOutput *)v47 setFormatRequirements:v48];
      [(BWNodeOutput *)v47 setPassthroughMode:*(unsigned char *)(v33 + 640) == 0];
      [(BWNodeOutput *)v47 setIndexOfInputWhichDrivesThisOutput:v38];

      if (a9)
      {
        v49 = objc_alloc_init(BWVideoFormatRequirements);
        CGRect v50 = objc_alloc_init(BWNodeOutputMediaConfiguration);
        [(BWNodeOutputMediaConfiguration *)v50 setFormatRequirements:v49];
        [(BWNodeOutputMediaConfiguration *)v50 setPassthroughMode:*(unsigned char *)(v33 + 220) == 0];
        [(BWNodeOutputMediaConfiguration *)v50 setIndexOfInputWhichDrivesThisOutput:v38];
        [(BWNodeOutputMediaConfiguration *)v50 setAttachedMediaKeyOfInputWhichDrivesThisOutput:@"SynchronizedSlaveFrame"];
        if (*(unsigned char *)(v33 + 220)) {
          CGRect v51 = @"CompressedSynchronizedSlaveFrame";
        }
        else {
          CGRect v51 = @"SynchronizedSlaveFrame";
        }
        v52 = v50;
        unint64_t v23 = v74;
        [(BWNodeOutput *)v47 setMediaConfiguration:v52 forAttachedMediaKey:v51];
      }
      if (v35)
      {
        -[BWIrisStagingNode _setupDepthMediaConfigurationForOutput:attachedMediaKey:](v33, v47, @"DepthData_DX");
        -[BWIrisStagingNode _setupDepthMediaConfigurationForOutput:attachedMediaKey:](v33, v47, @"DepthData_DY");
      }
      if (*(unsigned char *)(v33 + 786))
      {
        -[BWIrisStagingNode _setupSmartStyleMediaConfigurationsForInput:](v33, v42);
        -[BWIrisStagingNode _setupSmartStyleMediaConfigurationsForOutput:](v33, v47);
      }
    }
    [(id)v33 addOutput:v47];
    objc_msgSend(*(id *)(v33 + 368), "addObject:", objc_msgSend(MEMORY[0x1E4F1CA48], "array"));
    objc_msgSend(*(id *)(v33 + 376), "addObject:", objc_msgSend(MEMORY[0x1E4F1CA98], "null"));
    uint64_t v53 = *(void *)(v33 + 464) + v37;
    *(_OWORD *)uint64_t v53 = v75;
    *(void *)(v53 + 16) = v76;

    ++v38;
    v37 += 24;
  }
  while (v78 != v38);
  if (v70)
  {
    *(void *)(v33 + 536) = v78;
    v54 = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v33 index:*(void *)(v33 + 536)];
    v55 = objc_alloc_init(BWVideoFormatRequirements);
    [(BWNodeInput *)v54 setFormatRequirements:v55];

    [(id)v33 addInput:v54];
  }
  else
  {
    *(void *)(v33 + 536) = -1;
  }
  unsigned int v56 = v71;
  *(_DWORD *)(v33 + 576) = a13;
  *(void *)(v33 + 544) = -[BWMotionDataPreserver initWithName:]([BWMotionDataPreserver alloc], "initWithName:", [(id)v33 description]);
  if (a12)
  {
    int v57 = *(_DWORD *)(v33 + 576);
    if (a22) {
      uint64_t v58 = BWAttachedMediaKeysAvailableOnSmartStyleLearnedFramesOnly();
    }
    else {
      uint64_t v58 = 0;
    }
    *(void *)(v33 + 552) = [[BWIrisSequenceAdjuster alloc] initWithMediaTypes:v77 visMotionMetadataPreloadingEnabled:v57 != 0 generateIFrames:a14 attachedMediaKeysToPreserve:v58];
  }
  *(void *)(v33 + 344) = a19;
  if (!v31) {
    *(unsigned char *)(v33 + 665) = 1;
  }
  unint64_t v59 = v72;
  if (!v72) {
    *(unsigned char *)(v33 + 664) = 1;
  }
  v60 = malloc_type_malloc(8 * v78, 0x100004000313F17uLL);
  *(void *)(v33 + 656) = v60;
  if (v23 < v78)
  {
    unint64_t v61 = v71;
    v62 = v60;
    unint64_t v63 = v23;
    do
    {
      *v62++ = v63++;
      --v61;
    }
    while (v61);
    if (!v31) {
      goto LABEL_63;
    }
    goto LABEL_60;
  }
  unsigned int v56 = 0;
  if (v31)
  {
LABEL_60:
    for (uint64_t i = 0; i != v31; ++i)
      v60[v56 + i] = i;
    v56 += i;
  }
LABEL_63:
  if (v23 > v31)
  {
    v65 = &v60[v56];
    do
    {
      *v65++ = v31++;
      --v59;
    }
    while (v59);
  }
  *(void *)(v33 + 752) = [[BWLimitedGMErrorLogger alloc] initWithName:@"BWIrisStagingNode" maxLoggingCount:10];
  *(void *)(v33 + 592) = 1000;
  *(_DWORD *)(v33 + 616) = 0;
  *(unsigned char *)(v33 + 528) = 1;
  return (BWIrisStagingNode *)v33;
}

- (void)_signalReadyToReceiveRequestsWithEarliestAllowedStillHostPTS:(uint64_t)a1
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    *(unsigned char *)(a1 + 666) = 1;
    if (dword_1EB4C5070)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    double v5 = *(void **)(a1 + 584);
    CMTime time = *a2;
    objc_msgSend(v5, "stagingNode:readyToReceiveRequestsWithEarliestAllowedStillImageCaptureHostPTS:", a1, &time, v7, v8);
    int v6 = *(NSObject **)(a1 + 672);
    if (v6)
    {
      dispatch_group_leave(v6);

      *(void *)(a1 + 672) = 0;
    }
  }
}

- (unint64_t)_trimQueueForInputIndex:(unint64_t)result
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    unint64_t v3 = result;
    uint64_t v4 = MEMORY[0x1E4F1F9F8];
    CMTimeValue value = *MEMORY[0x1E4F1F9F8];
    CMTimeScale timescale = *(_DWORD *)(MEMORY[0x1E4F1F9F8] + 8);
    double v5 = (void *)[*(id *)(result + 368) objectAtIndexedSubscript:a2];
    uint64_t v6 = [v5 count];
    uint64_t v7 = objc_msgSend((id)objc_msgSend((id)v3, "inputs"), "objectAtIndexedSubscript:", a2);
    uint64_t v8 = (void *)[*(id *)(v3 + 368) objectAtIndexedSubscript:0];
    uint64_t v9 = [v8 count];
    uint64_t result = FigSimpleMutexCheckIsLockedOnThisThread();
    if (a2)
    {
      if (v9)
      {
        uint64_t result = (unint64_t)CMSampleBufferGetPresentationTimeStamp(&v22, (CMSampleBufferRef)[v8 objectAtIndexedSubscript:0]);
        CMTimeValue value = v22.value;
        CMTimeFlags flags = v22.flags;
        CMTimeScale timescale = v22.timescale;
        CMTimeEpoch epoch = v22.epoch;
        if ((v22.flags & 1) == 0) {
          return result;
        }
      }
      else
      {
        CMTimeFlags flags = *(_DWORD *)(v4 + 12);
        CMTimeEpoch epoch = *(void *)(v4 + 16);
        if ((flags & 1) == 0) {
          return result;
        }
      }
    }
    else
    {
      memset(&v22, 0, sizeof(v22));
      CMSampleBufferGetPresentationTimeStamp(&v22, (CMSampleBufferRef)[v5 lastObject]);
      CMTime lhs = v22;
      CMTime rhs = *(CMTime *)(v3 + 120);
      CMTimeAdd(&v21, &lhs, &rhs);
      CMTime v22 = v21;
      memset(&v21, 0, sizeof(v21));
      CMTime lhs = *(CMTime *)(v3 + 120);
      CMTimeMultiply(&v18, &lhs, 3);
      CMTime lhs = *(CMTime *)(v3 + 96);
      CMTimeAdd(&v21, &lhs, &v18);
      CMTime rhs = v22;
      CMTime v17 = v21;
      uint64_t result = (unint64_t)CMTimeSubtract(&lhs, &rhs, &v17);
      CMTimeValue value = lhs.value;
      CMTimeFlags flags = lhs.flags;
      CMTimeScale timescale = lhs.timescale;
      CMTimeEpoch epoch = lhs.epoch;
      if ((lhs.flags & 1) == 0) {
        return result;
      }
    }
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __45__BWIrisStagingNode__trimQueueForInputIndex___block_invoke;
    v13[3] = &unk_1E5C260A8;
    v13[4] = v7;
    v13[5] = v5;
    CMTimeScale v14 = timescale;
    CMTimeFlags v15 = flags;
    CMTimeEpoch v16 = epoch;
    v13[6] = v3;
    v13[7] = v6;
    v13[8] = a2;
    v13[9] = value;
    uint64_t result = objc_msgSend(v5, "removeObjectsAtIndexes:", objc_msgSend(v5, "indexesOfObjectsPassingTest:", v13));
    if (!a2)
    {
      if (*(unsigned char *)(v3 + 640)) {
        int v12 = *(_DWORD *)(v3 + 612);
      }
      else {
        int v12 = [v7 delayedBufferCount];
      }
      uint64_t result = [v5 count];
      if (result > v12) {
        return objc_msgSend(v5, "removeObjectsInRange:", 0, objc_msgSend(v5, "count") - v12);
      }
    }
  }
  return result;
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  uint64_t v189 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [a4 index];
  uint64_t v8 = *(void *)&self->_trimLivePhotoMovieAtWideAndSuperWideAutoSwitching;
  if (v7 == v8) {
    uint64_t v158 = 0;
  }
  else {
    uint64_t v158 = [(NSURL *)self->_spatialOverCaptureMasterMovieURL objectAtIndexedSubscript:v7];
  }
  CMSampleBufferRef v178 = 0;
  CMSampleBufferRef sampleBufferOut = 0;
  CGFloat v187 = *MEMORY[0x1E4F1F9F8];
  CMTimeScale timescale = *(_DWORD *)(MEMORY[0x1E4F1F9F8] + 8);
  memset(&v176, 0, sizeof(v176));
  CMSampleBufferRef v177 = 0;
  CMSampleBufferGetPresentationTimeStamp(&v176, a3);
  pthread_mutex_lock(*(pthread_mutex_t **)&self->_emittedIrisRequestCount);
  if ([a4 mediaType] == 1936684398)
  {
    if (!LOBYTE(self->_emissionMap))
    {
      if (dword_1EB4C5070)
      {
        uint64_t v156 = v7;
        *(_DWORD *)CMTime lhs = 0;
        LOBYTE(type.origin.x) = 0;
        os_log_and_send_and_compose_flags_and_os_log_CGRect type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        unsigned int v10 = *(_DWORD *)lhs;
        if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, LOBYTE(type.origin.x))) {
          unsigned int v11 = v10;
        }
        else {
          unsigned int v11 = v10 & 0xFFFFFFFE;
        }
        if (v11)
        {
          time[0] = v176;
          Float64 Seconds = CMTimeGetSeconds(time);
          *(_DWORD *)CMTime rhs = 136315650;
          *(void *)&rhs[4] = "-[BWIrisStagingNode renderSampleBuffer:forInput:]";
          *(_WORD *)&rhs[12] = 2048;
          *(void *)&rhs[14] = self;
          *(_WORD *)&rhs[22] = 2048;
          *(Float64 *)&rhs[24] = Seconds;
          LODWORD(v150) = 32;
          v148 = rhs;
          _os_log_send_and_compose_impl();
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        uint64_t v7 = v156;
      }
      LOBYTE(self->_emissionMap) = 1;
    }
  }
  else if (!v7)
  {
    if (self->_stagingSuspended && !BYTE2(self->_emissionMap))
    {
      memset(time, 0, 24);
      CMClockRef HostTimeClock = CMClockGetHostTimeClock();
      CMClockGetTime(time, HostTimeClock);
      *(CMTime *)CMTime rhs = time[0];
      -[BWIrisStagingNode _signalReadyToReceiveRequestsWithEarliestAllowedStillHostPTS:]((uint64_t)self, (CMTime *)rhs);
    }
    if (BYTE4(self->_limitedGMErrorLogger))
    {
      if (!*(void *)&self->_numberOfVideoFramesReceived)
      {
        int limitedGMErrorLogger = (int)self->_limitedGMErrorLogger;
        LODWORD(self->_limitedGMErrorLogger) = limitedGMErrorLogger + 1;
        if (limitedGMErrorLogger >= 2)
        {
          if (LOBYTE(self->_emissionMap))
          {
            CMTimeFlags v15 = objc_alloc_init(BWSubjectRelightingCalculator);
            *(void *)&self->_numberOfVideoFramesReceived = v15;
            -[BWSubjectRelightingCalculator prepareForVideoFormatAsync:](v15, "prepareForVideoFormatAsync:", [a4 videoFormat]);
          }
        }
      }
    }
  }
  if (self->_stagingSuspended) {
    goto LABEL_157;
  }
  if (v7)
  {
    if (v7 == v8)
    {
      -[BWIrisStagingNode _feedTrimmerWithInferencesSampleBuffer:]((uint64_t)self, a3);
LABEL_157:
      v20 = 0;
      goto LABEL_193;
    }
    v20 = 0;
    CMTime v21 = (void *)v158;
    goto LABEL_184;
  }
  memset(&v175, 0, sizeof(v175));
  CMTimeEpoch v16 = CMClockGetHostTimeClock();
  CMClockGetTime(&v175, v16);
  if (self->_lastReceivedVideoTime.epoch)
  {
    time[0] = v175;
    *(_OWORD *)CMTime rhs = *(_OWORD *)((char *)&self->_recommendedMasterPortType + 4);
    *(void *)&rhs[16] = *(int64_t *)((char *)&self->_lastReceivedVideoTime.value + 4);
    CMTimeSubtract(&v174, time, (CMTime *)rhs);
    double v17 = CMTimeGetSeconds(&v174);
    objc_msgSend(self->_lastReceivedVideoTime.epoch, "addDataPoint:");
    overallVideoFrameReceptionStats = self->_overallVideoFrameReceptionStats;
    uint64_t v19 = (void *)v158;
    if (overallVideoFrameReceptionStats) {
      [(BWStats *)overallVideoFrameReceptionStats addDataPoint:v17];
    }
  }
  else
  {
    CMTime v22 = objc_alloc_init(BWStats);
    self->_lastReceivedVideoTime.CMTimeEpoch epoch = (int64_t)v22;
    [(BWStats *)v22 setMultiplier:1000.0];
    [self->_lastReceivedVideoTime.epoch setUnitDesignator:@"ms"];
    uint64_t v19 = (void *)v158;
  }
  *(CMTime *)((char *)&self->_recommendedMasterPortType + 4) = v175;
  memset(&v173, 0, sizeof(v173));
  if ((self->_frameGovernorReferenceTime.value & 0x100000000) != 0)
  {
    time[0] = v176;
    *(_OWORD *)CMTime rhs = *(_OWORD *)&self->_frameGovernorNextFrameThreshold.epoch;
    *(void *)&rhs[16] = *(void *)&self->_frameGovernorReferenceTime.timescale;
    CMTimeSubtract(&v173, time, (CMTime *)rhs);
  }
  else
  {
    CMTime v173 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
  }
  memset(&v172, 0, sizeof(v172));
  if (objc_msgSend(v19, "count", v148, v150))
  {
    CMSampleBufferGetPresentationTimeStamp(&v171, (CMSampleBufferRef)[v19 lastObject]);
    time[0] = v176;
    CMTimeSubtract(&v172, time, &v171);
  }
  else
  {
    CMTime v172 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
  }
  unint64_t v23 = (void *)CMGetAttachment(a3, @"LastRecommendedMasterSelectionReason", 0);
  long long v24 = v23;
  if (v23) {
    LODWORD(self->_recommendedMasterPortType) = [v23 intValue];
  }
  if (BYTE4(self->_readyToReceiveRequestsGroup))
  {
    float videoStabilizationOverscanOverride = self->_videoStabilizationOverscanOverride;
    float v26 = *(float *)&self->_readyToReceiveRequestsGroup;
    AttachedMedia = (void *)BWSampleBufferGetAttachedMedia(a3, @"SynchronizedSlaveFrame");
    if (AttachedMedia)
    {
      uint64_t v28 = AttachedMedia;
      float v29 = 1.0;
      float v30 = ((float)(v26 + 1.0) + 0.2) * (float)(videoStabilizationOverscanOverride + 1.0);
      unint64_t v31 = (void *)CMGetAttachment(AttachedMedia, @"TotalZoomFactor", 0);
      float v32 = 1.0;
      if (v31)
      {
        [v31 floatValue];
        float v32 = v33;
      }
      float v34 = -[BWIrisStagingNode _appliedZoomFromSampleBuffer:]((uint64_t)self, a3);
      if ((float)(v32 / v30) >= 1.0) {
        float v29 = v32 / v30;
      }
      CFStringRef v152 = (const __CFString *)*MEMORY[0x1E4F53070];
      BOOL v35 = objc_msgSend((id)CMGetAttachment(v28, (CFStringRef)*MEMORY[0x1E4F53070], 0), "objectForKeyedSubscript:", *MEMORY[0x1E4F54128]);
      CFTypeRef v36 = CMGetAttachment(a3, @"RecommendedMasterPortType", 0);
      if (v36)
      {
        uint64_t v37 = (void *)v36;
      }
      else
      {
        CFTypeRef v40 = CMGetAttachment(v28, @"RecommendedMasterPortType", 0);
        if (v40) {
          uint64_t v37 = (void *)v40;
        }
        else {
          uint64_t v37 = *(void **)&self->_spatialOverCapturePercentageToApply;
        }
      }
      uint64_t v41 = *(void **)&self->_spatialOverCapturePercentageToApply;
      if (v37 != v41)
      {

        *(void *)&self->_spatialOverCapturePercentageToApply = v37;
      }
      if (v24 || (long long v24 = (void *)CMGetAttachment(v28, @"LastRecommendedMasterSelectionReason", 0)) != 0) {
        LODWORD(self->_recommendedMasterPortType) = [v24 intValue];
      }
      if (v32 < v34
        || [v35 isEqualToString:*MEMORY[0x1E4F52DD8]]
        && ([v37 isEqualToString:v35] & 1) != 0
        || [v35 isEqualToString:*MEMORY[0x1E4F52DE8]]
        && [v37 isEqualToString:v35]
        && (LODWORD(self->_recommendedMasterPortType) - 1) <= 1)
      {
        BWCMSampleBufferCreateCopyIncludingMetadata((CMSampleBufferRef)v28, &sampleBufferOut);
        if (!sampleBufferOut) {
          goto LABEL_212;
        }
        long long v42 = objc_msgSend((id)CMGetAttachment(a3, @"AttachedMedia", 0), "mutableCopy");
        if (BYTE2(self->_subjectRelightingResult))
        {
          long long v169 = 0u;
          long long v170 = 0u;
          long long v167 = 0u;
          long long v168 = 0u;
          long long v43 = BWAttachedMediaKeysRequiredBySmartStyleRenderingPipelines(1, 1);
          uint64_t v44 = [v43 countByEnumeratingWithState:&v167 objects:v185 count:16];
          if (v44)
          {
            uint64_t v45 = v44;
            uint64_t v46 = *(void *)v168;
            do
            {
              for (uint64_t i = 0; i != v45; ++i)
              {
                if (*(void *)v168 != v46) {
                  objc_enumerationMutation(v43);
                }
                objc_msgSend(v42, "setObject:forKeyedSubscript:", BWSampleBufferGetAttachedMedia(v28, *(void *)(*((void *)&v167 + 1) + 8 * i)), *(void *)(*((void *)&v167 + 1) + 8 * i));
              }
              uint64_t v45 = [v43 countByEnumeratingWithState:&v167 objects:v185 count:16];
            }
            while (v45);
          }
        }
        if ([v42 count])
        {
          v48 = (void *)[v42 copy];
          CMSetAttachment(sampleBufferOut, @"AttachedMedia", v48, 1u);
        }
        time[0].int32_t value = 0;
        BWCMSampleBufferCreateCopyIncludingMetadata((CMSampleBufferRef)v28, (CMSampleBufferRef *)time);
        uint64_t v7 = 0;
        uint64_t v39 = MEMORY[0x1E4F1F9F8];
        if (!time[0].value) {
          goto LABEL_212;
        }
        BWSampleBufferRemoveAllAttachedMedia((const void *)time[0].value);
        BWSampleBufferSetAttachedMedia(sampleBufferOut, @"SynchronizedSlaveFrame", time[0].value);
        CFRelease((CFTypeRef)time[0].value);
        BWSampleBufferRemoveAllAttachedMedia(a3);
        a3 = sampleBufferOut;
        CMSampleBufferGetPresentationTimeStamp(time, sampleBufferOut);
        CMTime v176 = time[0];
      }
      else if (v29 >= v34)
      {
        BWCMSampleBufferCreateCopyIncludingMetadata(a3, &v178);
        uint64_t v7 = 0;
        uint64_t v39 = MEMORY[0x1E4F1F9F8];
        if (!v178) {
          goto LABEL_212;
        }
        BWSampleBufferRemoveAllAttachedMedia(v178);
        BWSampleBufferPropagateAttachedMedia(v28, v178);
        BWSampleBufferSetAttachedMedia(a3, @"SynchronizedSlaveFrame", (uint64_t)v178);
      }
      else
      {
        uint64_t v7 = 0;
        uint64_t v39 = MEMORY[0x1E4F1F9F8];
      }
      if (self->_videoStabilizationOverscanOverride > 0.0)
      {
        v49 = (const void *)BWSampleBufferGetAttachedMedia(a3, @"SynchronizedSlaveFrame");
        if (!v49) {
          goto LABEL_212;
        }
        CGRect v50 = v49;
        CGRect v51 = (void *)CMGetAttachment(v49, @"FinalCropRectScaleFactorAtBaseZoom", 0);
        if (v51) {
          [v51 floatValue];
        }
        CMGetAttachment(v50, v152, 0);
        *(_OWORD *)&time[0].int32_t value = 0uLL;
        __asm { FMOV            V0.2D, #1.0 }
        *(_OWORD *)&time[0].CMTimeEpoch epoch = _Q0;
        FigCFDictionaryGetCGRectIfPresent();
        CGSize v57 = *(CGSize *)&time[0].epoch;
        CGPoint v58 = *(CGPoint *)&time[0].value;
        v190.CGPoint origin = *(CGPoint *)&time[0].value;
        v190.size = *(CGSize *)&time[0].epoch;
        CGRectGetWidth(v190);
        v191.CGPoint origin = v58;
        v191.size = v57;
        CGRectGetHeight(v191);
        v192.CGPoint origin = v58;
        v192.size = v57;
        CGRectGetMidX(v192);
        v193.CGPoint origin = v58;
        v193.size = v57;
        CGRectGetMidY(v193);
        FigCFDictionarySetCGRect();
        float v59 = *(float *)&self->_readyToReceiveRequestsGroup;
        uint64_t v7 = 0;
        if (v59 > 0.0) {
          FigCaptureMetadataUtilitiesScaleFinalCropRectForPadding(v50, v59);
        }
      }
      if (LOBYTE(self->_subjectRelightingResult))
      {
        CFDictionaryRef v60 = (const __CFDictionary *)CMGetAttachment(a3, @"PreviewShift", 0);
        if (v60)
        {
          *(_OWORD *)CMTime rhs = *MEMORY[0x1E4F1DAD8];
          CGPointMakeWithDictionaryRepresentation(v60, (CGPoint *)rhs);
          CMGetAttachment(a3, v152, 0);
          long long v61 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
          *(_OWORD *)&time[0].int32_t value = *MEMORY[0x1E4F1DB28];
          *(_OWORD *)&time[0].CMTimeEpoch epoch = v61;
          if (!FigCFDictionaryGetCGRectIfPresent()) {
            goto LABEL_212;
          }
          __asm { FMOV            V0.2D, #1.0 }
          float64x2_t v63 = vsubq_f64(_Q0, *(float64x2_t *)&time[0].epoch);
          float64x2_t v64 = vaddq_f64(*(float64x2_t *)&time[0].value, *(float64x2_t *)rhs);
          float64x2_t v65 = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v64, v63), (int8x16_t)v63, (int8x16_t)v64);
          *(int8x16_t *)&time[0].int32_t value = vbicq_s8((int8x16_t)v65, (int8x16_t)vcltzq_f64(v65));
          FigCFDictionarySetCGRect();
          uint64_t v7 = 0;
        }
      }
    }
    else
    {
      uint64_t v39 = MEMORY[0x1E4F1F9F8];
    }
    float v66 = *(float *)&self->_readyToReceiveRequestsGroup;
    if (v66 > 0.0)
    {
      FigCaptureMetadataUtilitiesScaleFinalCropRectForPadding(a3, v66);
      if (self->_videoStabilizationOverscanOverride > 0.0)
      {
        uint64_t v67 = v7;
        uint64_t v68 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(a3, @"SynchronizedSlaveFrame");
        if (v68)
        {
          v69 = v68;
          CFStringRef v70 = (const __CFString *)*MEMORY[0x1E4F53070];
          unint64_t v71 = (void *)CMGetAttachment(v68, (CFStringRef)*MEMORY[0x1E4F53070], 0);
          if (objc_msgSend((id)objc_msgSend(v71, "objectForKeyedSubscript:", *MEMORY[0x1E4F54128]), "isEqualToString:", objc_msgSend((id)CMGetAttachment(a3, v70, 0), "objectForKeyedSubscript:", *MEMORY[0x1E4F54128])))
          {
            memset(time, 0, 32);
            if (FigCFDictionaryGetCGRectIfPresent())
            {
              memset(rhs, 0, sizeof(rhs));
              if (FigCFDictionaryGetCGRectIfPresent())
              {
                ImageBuffer = CMSampleBufferGetImageBuffer(v69);
                double Width = (double)CVPixelBufferGetWidth(ImageBuffer);
                double Height = (double)CVPixelBufferGetHeight(ImageBuffer);
                memset(lhs, 0, sizeof(lhs));
                if (FigCFDictionaryGetCGRectIfPresent())
                {
                  double v75 = *(double *)&lhs[24];
                  double v76 = *(double *)&lhs[16];
                }
                else
                {
                  *(_OWORD *)CMTime lhs = 0uLL;
                  double v75 = Height;
                  double v76 = Width;
                  *(double *)&lhs[16] = Width;
                  *(double *)&lhs[24] = Height;
                }
                double v77 = v76 / Width;
                double v78 = v75 / Height;
                objc_super v79 = CMSampleBufferGetImageBuffer(a3);
                double v80 = (double)CVPixelBufferGetWidth(v79);
                double v81 = (double)CVPixelBufferGetHeight(v79);
                memset(&type, 0, sizeof(type));
                if (!FigCFDictionaryGetCGRectIfPresent())
                {
                  type.CGPoint origin = 0uLL;
                  type.size.CGFloat width = v80;
                  type.size.height = v81;
                }
                double v82 = v77 / *(double *)&time[0].epoch + -1.0;
                double v83 = v78 / *(double *)&time[1].value + -1.0;
                if (v82 >= INFINITY) {
                  double v84 = INFINITY;
                }
                else {
                  double v84 = v82 + 1.0;
                }
                float v85 = *(double *)&rhs[16] * v84;
                if (v83 >= INFINITY) {
                  double v86 = INFINITY;
                }
                else {
                  double v86 = v83 + 1.0;
                }
                float v87 = *(double *)&rhs[24] * v86;
                float v88 = v80 * v85;
                CGFloat v89 = (double)(int)FigCaptureFloorFloatToMultipleOf(4, v88);
                float v90 = v81 * v87;
                CGFloat v91 = (double)(int)FigCaptureFloorFloatToMultipleOf(4, v90);
                float v92 = type.origin.x - (v89 - type.size.width) * 0.5;
                CGFloat v93 = (double)(int)FigCaptureCeilFloatToMultipleOf(2, v92);
                float v94 = type.origin.y - (v91 - type.size.height) * 0.5;
                v194.origin.y = (double)(int)FigCaptureCeilFloatToMultipleOf(2, v94);
                v194.origin.x = v93;
                v194.size.CGFloat width = v89;
                v194.size.height = v91;
                CGRect v195 = CGRectIntersection(v194, type);
                if (!CGRectEqualToRect(v195, type)) {
                  FigCFDictionarySetCGRect();
                }
                goto LABEL_112;
              }
              uint64_t v151 = v154;
              LODWORD(v149) = 0;
            }
            else
            {
              uint64_t v151 = v154;
              LODWORD(v149) = 0;
            }
            FigDebugAssert3();
          }
        }
LABEL_112:
        uint64_t v7 = v67;
      }
    }
  }
  else
  {
    float v38 = *(float *)&self->_readyToReceiveRequestsGroup;
    if (v38 > 0.0) {
      FigCaptureMetadataUtilitiesScaleFinalCropRectForPadding(a3, v38);
    }
    uint64_t v39 = MEMORY[0x1E4F1F9F8];
  }
  double v95 = *(double *)(v39 + 16);
  if (objc_msgSend((id)CMGetAttachment(a3, @"IsHarvestedUltraHighResolutionStillFrame", 0), "BOOLValue"))
  {
    CMTimeMake(time, 16, 1000);
    CGFloat v187 = *(double *)&time[0].value;
    CMTimeFlags flags = time[0].flags;
    CMTimeScale timescale = time[0].timescale;
    CMTimeEpoch epoch = time[0].epoch;
    int64_t v98 = objc_msgSend((id)objc_msgSend((id)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0), "objectForKeyedSubscript:", *MEMORY[0x1E4F53EE8]), "integerValue");
    if (v98 >= 1)
    {
      CMTimeMake(time, v98, 1000000);
      CGFloat v187 = *(double *)&time[0].value;
      CMTimeFlags flags = time[0].flags;
      CMTimeScale timescale = time[0].timescale;
      CMTimeEpoch epoch = time[0].epoch;
    }
    memset(lhs, 0, 24);
    time[0] = v176;
    *(CGFloat *)CMTime rhs = v187;
    *(_DWORD *)&rhs[8] = timescale;
    CMTimeFlags v153 = flags;
    *(_DWORD *)&rhs[12] = flags;
    *(void *)&rhs[16] = epoch;
    CMTimeAdd((CMTime *)lhs, time, (CMTime *)rhs);
    if (dword_1EB4C5070)
    {
      uint64_t v99 = v7;
      LODWORD(type.origin.x) = 0;
      os_log_type_t v166 = OS_LOG_TYPE_DEFAULT;
      v100 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int x_low = LODWORD(type.origin.x);
      if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT)) {
        unsigned int v102 = x_low;
      }
      else {
        unsigned int v102 = x_low & 0xFFFFFFFE;
      }
      if (v102)
      {
        time[0] = v176;
        Float64 v103 = CMTimeGetSeconds(time);
        time[0] = *(CMTime *)lhs;
        Float64 v104 = CMTimeGetSeconds(time);
        *(CGFloat *)&time[0].int32_t value = v187;
        *(void *)&time[0].CMTimeScale timescale = __PAIR64__(flags, timescale);
        time[0].CMTimeEpoch epoch = epoch;
        Float64 v105 = CMTimeGetSeconds(time);
        *(_DWORD *)CMTime rhs = 136315906;
        *(void *)&rhs[4] = "-[BWIrisStagingNode renderSampleBuffer:forInput:]";
        *(_WORD *)&rhs[12] = 2048;
        *(Float64 *)&rhs[14] = v103;
        *(_WORD *)&rhs[22] = 2048;
        *(Float64 *)&rhs[24] = v104;
        __int16 v183 = 2048;
        Float64 v184 = v105;
        LODWORD(v151) = 42;
        v149 = rhs;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      uint64_t v7 = v99;
      uint64_t v39 = MEMORY[0x1E4F1F9F8];
    }
    time[0] = *(CMTime *)lhs;
    *(_OWORD *)CMTime rhs = *(_OWORD *)v39;
    *(double *)&rhs[16] = v95;
    BWCMSampleBufferCreateCopyWithNewTimingIncludingMetadata(a3, time, (long long *)rhs, &v177);
    v106 = v177;
    if (v177)
    {
      double v95 = *(double *)&epoch;
      p_CMTimeEpoch epoch = &self->_frameGovernorNextFrameThreshold.epoch;
      goto LABEL_127;
    }
LABEL_212:
    FigDebugAssert3();
    goto LABEL_157;
  }
  CMTimeFlags v153 = *(_DWORD *)(v39 + 12);
  v106 = v177;
  p_CMTimeEpoch epoch = &self->_frameGovernorNextFrameThreshold.epoch;
  if (v177)
  {
LABEL_127:
    BWSynchronizeSmartStyleAttachedMediaPTS(v106);
    a3 = v106;
  }
  if (*(void *)&self->_vitalityScoringSmartCameraPipelineVersion.minor) {
    -[BWIrisStagingNode _feedTrimmerWithVideoSampleBuffer:]((uint64_t)self, a3);
  }
  -[BWIrisStagingNode _findAndMarkCuttingBufferForVideoSbuf:]((uint64_t)self, a3);
  if (!LOBYTE(self->_emissionMap)) {
    goto LABEL_157;
  }
  CGFloat v155 = v95;
  if (!BYTE1(self->_emissionMap))
  {
    if (dword_1EB4C5070)
    {
      uint64_t v108 = v7;
      *(_DWORD *)CMTime lhs = 0;
      LOBYTE(type.origin.x) = 0;
      v109 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v110 = *(_DWORD *)lhs;
      if (os_log_type_enabled(v109, LOBYTE(type.origin.x))) {
        unsigned int v111 = v110;
      }
      else {
        unsigned int v111 = v110 & 0xFFFFFFFE;
      }
      if (v111)
      {
        time[0] = v176;
        Float64 v112 = CMTimeGetSeconds(time);
        *(_DWORD *)CMTime rhs = 136315650;
        *(void *)&rhs[4] = "-[BWIrisStagingNode renderSampleBuffer:forInput:]";
        *(_WORD *)&rhs[12] = 2048;
        *(void *)&rhs[14] = self;
        *(_WORD *)&rhs[22] = 2048;
        *(Float64 *)&rhs[24] = v112;
        LODWORD(v151) = 32;
        v149 = rhs;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      uint64_t v7 = v108;
    }
    BYTE1(self->_emissionMap) = 1;
  }
  p_compressSynchronizedSlaveAttachedMedia = &self->_compressSynchronizedSlaveAttachedMedia;
  if ((self->_frameGovernorNextFrameThreshold.value & 0x100000000) != 0)
  {
    CMTimeMake(&v164, 5, 1000);
    *(_OWORD *)&time[0].int32_t value = *(_OWORD *)p_compressSynchronizedSlaveAttachedMedia;
    time[0].CMTimeEpoch epoch = *(void *)&self->_frameGovernorNextFrameThreshold.timescale;
    CMTimeSubtract(&time2, time, &v164);
    time[0] = v173;
    if (CMTimeCompare(time, &time2) < 0)
    {
      [self->_inferencesInputIndex preserveMotionDataForSoonToBeDroppedSampleBuffer:a3];
      goto LABEL_157;
    }
  }
  if ((*((unsigned char *)p_epoch + 12) & 1) == 0) {
    goto LABEL_144;
  }
  time[0] = (CMTime)self->_targetFrameDuration;
  CMTimeMultiply(&v163, time, 2);
  time[0] = v172;
  if (CMTimeCompare(time, &v163) > 0
    || (time[0] = v173,
        *(_OWORD *)CMTime rhs = *(_OWORD *)p_compressSynchronizedSlaveAttachedMedia,
        *(void *)&rhs[16] = *(void *)&self->_frameGovernorNextFrameThreshold.timescale,
        CMTimeSubtract(&time1, time, (CMTime *)rhs),
        CMTimeMake(&v161, 5, 1000),
        CMTimeCompare(&time1, &v161) < 0))
  {
LABEL_144:
    *(CMTime *)p_CMTimeEpoch epoch = v176;
    CMTime v173 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
  }
  memset(time, 0, 24);
  int32_t v114 = self->_targetFrameDuration.timescale;
  int32_t value = self->_targetFrameDuration.value;
  *(CMTime *)CMTime rhs = v173;
  CMTimeMultiplyByRatio(time, (CMTime *)rhs, v114, value);
  *(_OWORD *)CMTime lhs = *(_OWORD *)&self->_targetFrameDuration.value;
  *(void *)&lhs[16] = self->_targetFrameDuration.epoch;
  CMTimeMultiply((CMTime *)rhs, (CMTime *)lhs, time[0].value / time[0].timescale + 1);
  *(void *)&self->_frameGovernorNextFrameThreshold.CMTimeScale timescale = *(void *)&rhs[16];
  *(_OWORD *)p_compressSynchronizedSlaveAttachedMedia = *(_OWORD *)rhs;
  v116 = (_DWORD *)MEMORY[0x1E4F1EBA8];
  if (*MEMORY[0x1E4F1EBA8] == 1)
  {
    time[0] = v176;
    CMTimeGetSeconds(time);
    kdebug_trace();
  }
  objc_msgSend(self->_inferencesInputIndex, "prependPreservedMotionDataToSampleBuffer:", a3, v149, v151);
  if (!LOBYTE(self->_synchronizedSlaveJPEGCompressor))
  {
    v20 = 0;
    goto LABEL_170;
  }
  uint64_t v117 = v7;
  int v118 = LODWORD(self->_intermediateJPEGCompressionQuality) + LODWORD(self->_intermediateJPEGCompressionRate);
  uint64_t v119 = BWSampleBufferGetAttachedMedia(a3, @"SynchronizedSlaveFrame");
  if (v119)
  {
    if (self->_videoStabilizationOverscanOverride <= 0.0)
    {
      if (!BYTE4(self->_readyToReceiveRequestsGroup)) {
        -[BWStats logErrorNumber:errorString:](self->_valveActiveVideoFrameReceptionStats, "logErrorNumber:errorString:", 0xFFFFFFFFLL, [NSString stringWithFormat:@"Primary media contains unexpected SynchronizedSlaveFrame."]);
      }
      v125 = 0;
    }
    else
    {
      v120 = (opaqueCMSampleBuffer *)v119;
      intermediateJPEGCompressor = self->_intermediateJPEGCompressor;
      if (!intermediateJPEGCompressor)
      {
        v122 = [BWIntermediateJPEGCompressor alloc];
        LODWORD(v123) = self->_compressedBufferPoolAllocationTimeoutMS;
        LODWORD(v124) = HIDWORD(self->_compressedBufferPoolAllocationTimeoutMS);
        intermediateJPEGCompressor = [(BWIntermediateJPEGCompressor *)v122 initWithCompressionQuality:(self->_intermediateJPEGDownstreamRetainedBufferCount+ LODWORD(self->_intermediateJPEGCompressionRate)) compressionRate:(self->_intermediateJPEGDownstreamRetainedBufferCount + v118) jpegSurfacePoolLowWaterBufferCount:self->_delegate jpegSurfacePoolHighWaterBufferCount:@"synchronizedSlaveJPEGCompressor" compressedBufferPoolAllocationTimeoutMS:v123 name:v124];
        self->_intermediateJPEGCompressor = intermediateJPEGCompressor;
      }
      v125 = [(BWIntermediateJPEGCompressor *)intermediateJPEGCompressor newJPEGSampleBufferFromUncompressedSampleBuffer:v120];
      if (!v125)
      {
        valveActiveVideoFrameReceptionStats = self->_valveActiveVideoFrameReceptionStats;
        v127 = NSString;
        CMSampleBufferGetPresentationTimeStamp(&v160, v120);
        -[BWStats logErrorNumber:errorString:](valveActiveVideoFrameReceptionStats, "logErrorNumber:errorString:", 0xFFFFFFFFLL, objc_msgSend(v127, "stringWithFormat:", @"Could not create intermediate JPEG for synchronized slave frame at %.4f", CMTimeGetSeconds(&v160)));
        BWSampleBufferRemoveAttachedMedia(a3, @"SynchronizedSlaveFrame");
        v20 = 0;
        a3 = 0;
        uint64_t v7 = v117;
        goto LABEL_170;
      }
    }
    BWSampleBufferRemoveAttachedMedia(a3, @"SynchronizedSlaveFrame");
  }
  else
  {
    v125 = 0;
  }
  v128 = *(BWIntermediateJPEGCompressor **)&self->_additionalCompressedBufferCount;
  uint64_t v7 = v117;
  if (!v128)
  {
    v129 = [BWIntermediateJPEGCompressor alloc];
    LODWORD(v130) = self->_compressedBufferPoolAllocationTimeoutMS;
    LODWORD(v131) = HIDWORD(self->_compressedBufferPoolAllocationTimeoutMS);
    uint64_t v7 = v117;
    v128 = [(BWIntermediateJPEGCompressor *)v129 initWithCompressionQuality:(self->_intermediateJPEGDownstreamRetainedBufferCount+ LODWORD(self->_intermediateJPEGCompressionRate)) compressionRate:(self->_intermediateJPEGDownstreamRetainedBufferCount + v118) jpegSurfacePoolLowWaterBufferCount:self->_delegate jpegSurfacePoolHighWaterBufferCount:@"intermediateJPEGCompressor" compressedBufferPoolAllocationTimeoutMS:v130 name:v131];
    *(void *)&self->_additionalCompressedBufferCount = v128;
  }
  v132 = [(BWIntermediateJPEGCompressor *)v128 newJPEGSampleBufferFromUncompressedSampleBuffer:a3];
  v20 = v132;
  if (v132)
  {
    if (!v125)
    {
LABEL_169:
      a3 = v20;
      goto LABEL_170;
    }
    BWSampleBufferSetAttachedMedia(v132, 0x1EFA742E0, (uint64_t)v125);
LABEL_168:
    CFRelease(v125);
    goto LABEL_169;
  }
  v133 = self->_valveActiveVideoFrameReceptionStats;
  v134 = NSString;
  CMSampleBufferGetPresentationTimeStamp(&v159, a3);
  Float64 v135 = CMTimeGetSeconds(&v159);
  v136 = v134;
  uint64_t v7 = v117;
  -[BWStats logErrorNumber:errorString:](v133, "logErrorNumber:errorString:", 0xFFFFFFFFLL, objc_msgSend(v136, "stringWithFormat:", @"Could not create intermediate JPEG for primary frame at %.4f", *(void *)&v135));
  if (v125) {
    goto LABEL_168;
  }
  v20 = 0;
  a3 = 0;
LABEL_170:
  uint64_t v157 = v7;
  if (*v116 == 1) {
    kdebug_trace();
  }
  if (a3)
  {
    sequenceAdjuster = self->_sequenceAdjuster;
    if (sequenceAdjuster)
    {
      uint64_t v138 = [(BWIrisSequenceAdjuster *)sequenceAdjuster addMotionDataToCacheForSampleBuffer:a3];
      CFStringRef v139 = (const __CFString *)*MEMORY[0x1E4F53070];
      v140 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0);
      uint64_t v141 = [NSNumber numberWithUnsignedLongLong:v138];
      uint64_t v142 = *MEMORY[0x1E4F55720];
      [v140 setObject:v141 forKeyedSubscript:*MEMORY[0x1E4F55720]];
      v143 = (const void *)BWSampleBufferGetAttachedMedia(a3, @"SynchronizedSlaveFrame");
      if (v143)
      {
        if (self->_sequenceAdjuster) {
          objc_msgSend((id)CMGetAttachment(v143, v139, 0), "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", v138), v142);
        }
      }
    }
    if (self->_motionDataPreserver)
    {
      memset(time, 0, 24);
      CFDictionaryRef v144 = (const __CFDictionary *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F530C0], 0);
      CMTimeMakeFromDictionary(time, v144);
      CMTime v21 = (void *)v158;
      if ((time[0].flags & 1) == 0) {
        time[0] = v176;
      }
      uint64_t v145 = objc_msgSend((id)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0), "objectForKeyedSubscript:", *MEMORY[0x1E4F53D38]);
      int v146 = objc_msgSend((id)CMGetAttachment(a3, @"StillImageCaptureType", 0), "intValue");
      if (v153)
      {
        *(CMTime *)CMTime lhs = time[0];
        type.origin.x = v187;
        *(void *)&type.origin.y = __PAIR64__(v153, timescale);
        type.size.CGFloat width = v155;
        CMTimeAdd((CMTime *)rhs, (CMTime *)lhs, (CMTime *)&type);
        time[0] = *(CMTime *)rhs;
      }
      motionDataPreserver = self->_motionDataPreserver;
      *(CMTime *)CMTime rhs = v176;
      *(CMTime *)CMTime lhs = time[0];
      [(BWMotionDataPreserver *)motionDataPreserver enqueueVideoBufferTime:rhs nativeTime:lhs isBracketFrame:v145 != 0 isSISFrame:v146 == 4];
      uint64_t v7 = v157;
    }
    else
    {
      uint64_t v7 = v157;
      CMTime v21 = (void *)v158;
    }
LABEL_184:
    objc_msgSend(v21, "addObject:", a3, v148);
    if (!BYTE2(self->_emissionMap))
    {
      memset(time, 0, 24);
      [(BWIrisStagingNode *)(CMTime *)self _earliestAllowedStillHostPTS];
      if (time[0].flags)
      {
        *(CMTime *)CMTime rhs = time[0];
        *(_OWORD *)CMTime lhs = *MEMORY[0x1E4F1FA10];
        *(void *)&lhs[16] = *(void *)(MEMORY[0x1E4F1FA10] + 16);
        if (CMTimeCompare((CMTime *)rhs, (CMTime *)lhs) < 0)
        {
          *(CMTime *)CMTime rhs = time[0];
          -[BWIrisStagingNode _signalReadyToReceiveRequestsWithEarliestAllowedStillHostPTS:]((uint64_t)self, (CMTime *)rhs);
        }
      }
    }
    -[BWIrisStagingNode _trimQueueForInputIndex:]((unint64_t)self, v7);
    if (LOBYTE(self->_droppedFramePTSs))
    {
      if (BYTE2(self->_droppedFramePTSs))
      {
        -[BWIrisStagingNode _emitSampleBuffer:forInputIndex:]((CMTime *)self, a3, v7);
      }
      else if (!v7)
      {
        time[0] = v176;
        -[BWIrisStagingNode _serviceIrisRequestsForCurrentTime:emitBuffers:ensureStillImageTimesAreStaged:]((uint64_t)self, time, 1, 1);
      }
    }
  }
LABEL_193:
  pthread_mutex_unlock(*(pthread_mutex_t **)&self->_emittedIrisRequestCount);
  if (v177) {
    CFRelease(v177);
  }
  if (v20) {
    CFRelease(v20);
  }
  if (sampleBufferOut) {
    CFRelease(sampleBufferOut);
  }
  if (v178) {
    CFRelease(v178);
  }
}

- (void)_findAndMarkCuttingBufferForVideoSbuf:(uint64_t)a1
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v4 = (const void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 368), "objectAtIndexedSubscript:", 0), "lastObject");
    if (v4)
    {
      double v5 = v4;
      CFStringRef v6 = (const __CFString *)*MEMORY[0x1E4F53070];
      uint64_t v7 = (void *)CMGetAttachment(v4, (CFStringRef)*MEMORY[0x1E4F53070], 0);
      uint64_t v8 = (void *)CMGetAttachment(a2, v6, 0);
      if (*(unsigned char *)(a1 + 528)
        && (*(_DWORD *)(a1 + 704) - 1) <= 1
        && ((uint64_t v9 = *MEMORY[0x1E4F54128],
             unsigned int v10 = (void *)[v7 objectForKeyedSubscript:*MEMORY[0x1E4F54128]],
             unsigned int v11 = (void *)[v8 objectForKeyedSubscript:v9],
             uint64_t v12 = *MEMORY[0x1E4F52DD8],
             int v13 = [v10 isEqualToString:*MEMORY[0x1E4F52DD8]],
             uint64_t v14 = *MEMORY[0x1E4F52DE8],
             v13)
         && ([v11 isEqualToString:*MEMORY[0x1E4F52DE8]] & 1) != 0
         || [v10 isEqualToString:v14]
         && [v11 isEqualToString:v12]))
      {
        if (dword_1EB4C5070)
        {
          unsigned int v28 = 0;
          os_log_type_t type = OS_LOG_TYPE_DEFAULT;
          os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          int v24 = 1;
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        else
        {
          int v24 = 1;
        }
      }
      else
      {
        int v24 = 0;
      }
      if (!*(unsigned char *)(a1 + 786)
        || (uint64_t v15 = *MEMORY[0x1E4F53500],
            CMTimeEpoch v16 = objc_msgSend(+[FigCaptureSmartStyle createFromDictionary:](FigCaptureSmartStyle, "createFromDictionary:", objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E4F53500])), "cast"), v17 = objc_msgSend(+[FigCaptureSmartStyle createFromDictionary:](FigCaptureSmartStyle, "createFromDictionary:", objc_msgSend(v8, "objectForKeyedSubscript:", v15)), "cast"), v16 == (void *)v17)|| (v18 = v17, (objc_msgSend(v16, "isEqual:", v17) & 1) != 0))
      {
        if (!v24) {
          return;
        }
      }
      else if (dword_1EB4C5070)
      {
        unsigned int v28 = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        uint64_t v19 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        unsigned int v20 = v28;
        if (os_log_type_enabled(v19, type)) {
          unsigned int v21 = v20;
        }
        else {
          unsigned int v21 = v20 & 0xFFFFFFFE;
        }
        if (v21)
        {
          CMSampleBufferGetPresentationTimeStamp(&v26, (CMSampleBufferRef)a2);
          Float64 Seconds = CMTimeGetSeconds(&v26);
          int v29 = 136315906;
          float v30 = "-[BWIrisStagingNode _findAndMarkCuttingBufferForVideoSbuf:]";
          __int16 v31 = 2048;
          Float64 v32 = Seconds;
          __int16 v33 = 2112;
          float v34 = v16;
          __int16 v35 = 2112;
          uint64_t v36 = v18;
          _os_log_send_and_compose_impl();
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      unint64_t v23 = (const void *)*MEMORY[0x1E4F1CFD0];
      CMSetAttachment(a2, @"BufferRequiresCuttingInLivePhotoMovie", (CFTypeRef)*MEMORY[0x1E4F1CFD0], 1u);
      CMSetAttachment(v5, (CFStringRef)*MEMORY[0x1E4F1F288], v23, 1u);
    }
  }
}

- (float)_appliedZoomFromSampleBuffer:(uint64_t)a1
{
  if (!a1) {
    return 0.0;
  }
  unint64_t v3 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 648), "objectForKeyedSubscript:", objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E4F54128]));
  objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E4F52C78]), "floatValue");
  float v6 = v5;
  if (v5 <= 0.0)
  {
    FigDebugAssert3();
  }
  else
  {
    uint64_t v7 = (void *)[v3 objectForKeyedSubscript:*MEMORY[0x1E4F54380]];
    if (v7)
    {
      [v7 floatValue];
      return v6 * v8;
    }
  }
  return v6;
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5
{
  v20[1] = *MEMORY[0x1E4F143B8];
  if ([a4 index] != *(void *)&self->_trimLivePhotoMovieAtWideAndSuperWideAutoSwitching)
  {
    id v9 = -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](self, "outputs"), "objectAtIndexedSubscript:", [a4 index]);
    BOOL v10 = [a4 mediaType] == 1986618469
       && LOBYTE(self->_synchronizedSlaveJPEGCompressor) != 0;
    id v11 = a5;
    if (BYTE4(self->_stagingResumedTime.epoch))
    {
      if ([a5 isEqualToString:@"SynchronizedSlaveFrame"]) {
        id v11 = @"CompressedSynchronizedSlaveFrame";
      }
      else {
        id v11 = a5;
      }
    }
    if (![v11 isEqualToString:@"SynchronizedSlaveFrame"]
      || objc_msgSend((id)objc_msgSend(a4, "mediaConfigurationForAttachedMediaKey:", a5), "passthroughMode"))
    {
      uint64_t v12 = [v9 mediaPropertiesForAttachedMediaKey:v11];
      if (v12)
      {
        int v13 = (BWNodeOutputMediaProperties *)v12;
        if (([v11 isEqualToString:@"PrimaryFormat"] & 1) == 0)
        {
          uint64_t v18 = [NSString stringWithFormat:@"%@ output %@ unexpectedly has mediaPropertiesForAttachedMediaKey %@ (provided media key was %@)", self, v9, v11, a5];
          objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v18 userInfo:0]);
        }
        if (!v10) {
          goto LABEL_24;
        }
      }
      else
      {
        int v13 = objc_alloc_init(BWNodeOutputMediaProperties);
        [v9 _setMediaProperties:v13 forAttachedMediaKey:v11];
        if (!v10) {
          goto LABEL_24;
        }
      }
      if (([v11 isEqualToString:@"PrimaryFormat"] & 1) != 0
        || [v11 isEqualToString:0x1EFA742E0])
      {
        uint64_t v14 = objc_alloc_init(BWVideoFormatRequirements);
        CMVideoDimensions Dimensions = CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)[a3 formatDescription]);
        [(BWVideoFormatRequirements *)v14 setWidth:Dimensions.width];
        [(BWVideoFormatRequirements *)v14 setHeight:*(uint64_t *)&Dimensions >> 32];
        CMTimeEpoch v16 = FigCaptureEncodedByteStreamFormatForPixelFormat([a3 pixelFormat]);
        if (v16)
        {
          v20[0] = v16;
          -[BWVideoFormatRequirements setSupportedPixelFormats:](v14, "setSupportedPixelFormats:", [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1]);
        }
        if ([a3 colorSpaceProperties])
        {
          uint64_t v19 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(a3, "colorSpaceProperties"));
          -[BWVideoFormatRequirements setSupportedColorSpaceProperties:](v14, "setSupportedColorSpaceProperties:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1]);
        }
        uint64_t v17 = (void *)[v9 mediaConfigurationForAttachedMediaKey:v11];
        [v17 setFormatRequirements:v14];
        [v17 setProvidesPixelBufferPool:0];

        return;
      }
LABEL_24:
      [(BWNodeOutputMediaProperties *)v13 setResolvedFormat:a3];
    }
  }
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  v9.receiver = self;
  v9.super_class = (Class)BWIrisStagingNode;
  [(BWNode *)&v9 prepareForCurrentConfigurationToBecomeLive];
  pthread_mutex_lock(*(pthread_mutex_t **)&self->_emittedIrisRequestCount);
  HIDWORD(self->_motionDataTimeMachine) = 0;
  BYTE1(self->_subjectRelightingResult) = 0;
  if (SLODWORD(self->_masterClock) > 0 || BYTE4(self->_masterClock))
  {
    *(void *)&self->_vitalityScoringSmartCameraPipelineVersion.minor = objc_alloc_init(FigIrisAutoTrimmer);
    CMTimeMake(&time, self->_targetFrameDuration.timescale, self->_targetFrameDuration.value);
    [*(id *)&self->_vitalityScoringSmartCameraPipelineVersion.minor setVideoFrameRate:CMTimeGetSeconds(&time)];
    CMTime bufferingTime = (CMTime)self->_bufferingTime;
    [*(id *)&self->_vitalityScoringSmartCameraPipelineVersion.minor setBufferHistorySeconds:CMTimeGetSeconds(&bufferingTime) * 2.0 + 0.5];
    CMTime bufferingTime = (CMTime)self->_bufferingTime;
    CMTimeMultiplyByRatio(&v6, &bufferingTime, 1, 2);
    unint64_t v3 = *(void **)&self->_vitalityScoringSmartCameraPipelineVersion.minor;
    CMTime v5 = v6;
    [v3 setMaxHoldDuration:&v5];
    [*(id *)&self->_vitalityScoringSmartCameraPipelineVersion.minor setVitalityScoringEnabled:BYTE4(self->_masterClock)];
    if (BYTE4(self->_masterClock)) {
      [*(id *)&self->_vitalityScoringSmartCameraPipelineVersion.minor setVitalityScoringSmartCameraPipelineVersion:HIWORD(self->_masterClock) | ((unint64_t)self->_trimMethod << 16)];
    }
    [*(id *)&self->_vitalityScoringSmartCameraPipelineVersion.minor startMotionProcessing];
  }
  if (!self->_stagingSuspended)
  {
    CMClockRef HostTimeClock = CMClockGetHostTimeClock();
    CMClockGetTime(&bufferingTime, HostTimeClock);
    *(CMTime *)(&self->_flushAndSuspendPending + 3) = bufferingTime;
  }
  LODWORD(self->_limitedGMErrorLogger) = 0;
  pthread_mutex_unlock(*(pthread_mutex_t **)&self->_emittedIrisRequestCount);
}

- (void)setBeginIrisMovieCaptureTime:(id *)a3
{
  pthread_mutex_lock(*(pthread_mutex_t **)&self->_emittedIrisRequestCount);
  int64_t var3 = a3->var3;
  *(_OWORD *)&self->_beginIrisMovieCaptureTime.int32_t value = *(_OWORD *)&a3->var0;
  self->_beginIrisMovieCaptureTime.CMTimeEpoch epoch = var3;
  self->_endIrisMovieCaptureTime = *($95D729B680665BEAEFA1D6FCA8238556 *)*(void *)&MEMORY[0x1E4F1F9F8];
  -[BWIrisStagingNode _resumeStaging]((uint64_t)self);
  CMTime v6 = *(pthread_mutex_t **)&self->_emittedIrisRequestCount;
  pthread_mutex_unlock(v6);
}

- (double)_resumeStaging
{
  if (a1)
  {
    FigSimpleMutexCheckIsLockedOnThisThread();
    *(unsigned char *)(a1 + 192) = 0;
    *(unsigned char *)(a1 + 193) = 0;
    CMClockRef HostTimeClock = CMClockGetHostTimeClock();
    CMClockGetTime(&v4, HostTimeClock);
    double result = *(double *)&v4.value;
    *(CMTime *)(a1 + 196) = v4;
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

- (uint64_t)_setupDepthMediaConfigurationForInput:(uint64_t)a3 attachedMediaKey:
{
  if (result)
  {
    CMTime v5 = objc_alloc_init(BWNodeInputMediaConfiguration);
    [(BWNodeInputMediaConfiguration *)v5 setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
    [(BWNodeInputMediaConfiguration *)v5 setPassthroughMode:1];
    return [a2 setMediaConfiguration:v5 forAttachedMediaKey:a3];
  }
  return result;
}

- (uint64_t)_setupDepthMediaConfigurationForOutput:(uint64_t)a3 attachedMediaKey:
{
  if (result)
  {
    CMTime v5 = objc_alloc_init(BWNodeOutputMediaConfiguration);
    [(BWNodeOutputMediaConfiguration *)v5 setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
    [(BWNodeOutputMediaConfiguration *)v5 setPassthroughMode:1];
    return [a2 setMediaConfiguration:v5 forAttachedMediaKey:a3];
  }
  return result;
}

- (uint64_t)_setupSmartStyleMediaConfigurationsForInput:(uint64_t)result
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    unint64_t v3 = BWAttachedMediaKeysRequiredBySmartStyleRenderingPipelines(1, *(unsigned __int8 *)(result + 787));
    double result = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (result)
    {
      uint64_t v4 = result;
      uint64_t v5 = *(void *)v11;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v11 != v5) {
            objc_enumerationMutation(v3);
          }
          uint64_t v7 = *(void *)(*((void *)&v10 + 1) + 8 * v6);
          float v8 = objc_alloc_init(BWNodeInputMediaConfiguration);
          objc_super v9 = objc_alloc_init(BWVideoFormatRequirements);
          -[BWNodeInputMediaConfiguration setFormatRequirements:](v8, "setFormatRequirements:", v9, (void)v10);
          [(BWNodeInputMediaConfiguration *)v8 setPassthroughMode:1];
          [a2 setMediaConfiguration:v8 forAttachedMediaKey:v7];
          ++v6;
        }
        while (v4 != v6);
        double result = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
        uint64_t v4 = result;
      }
      while (result);
    }
  }
  return result;
}

- (uint64_t)_setupSmartStyleMediaConfigurationsForOutput:(uint64_t)result
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    unint64_t v3 = BWAttachedMediaKeysRequiredBySmartStyleRenderingPipelines(1, *(unsigned __int8 *)(result + 787));
    double result = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (result)
    {
      uint64_t v4 = result;
      uint64_t v5 = *(void *)v11;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v11 != v5) {
            objc_enumerationMutation(v3);
          }
          uint64_t v7 = *(void *)(*((void *)&v10 + 1) + 8 * v6);
          float v8 = objc_alloc_init(BWNodeOutputMediaConfiguration);
          objc_super v9 = objc_alloc_init(BWVideoFormatRequirements);
          -[BWNodeOutputMediaConfiguration setFormatRequirements:](v8, "setFormatRequirements:", v9, (void)v10);
          [(BWNodeOutputMediaConfiguration *)v8 setPassthroughMode:1];
          [a2 setMediaConfiguration:v8 forAttachedMediaKey:v7];
          ++v6;
        }
        while (v4 != v6);
        double result = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
        uint64_t v4 = result;
      }
      while (result);
    }
  }
  return result;
}

- (void)dealloc
{
  firstEmittedPTSArray = self->_firstEmittedPTSArray;
  if (firstEmittedPTSArray) {
    CFRelease(firstEmittedPTSArray);
  }

  free(self->_stateMutex);
  FigSimpleMutexDestroy();

  uint64_t v4 = *(void **)&self->_additionalCompressedBufferCount;
  if (v4) {

  }
  intermediateJPEGCompressor = self->_intermediateJPEGCompressor;
  if (intermediateJPEGCompressor) {

  }
  uint64_t v6 = *(NSObject **)&self->_haveSeenFirstAudioSampleBuffer;
  if (v6)
  {
    dispatch_group_leave(v6);
  }
  free(self->_cameraInfoByPortType);

  v7.receiver = self;
  v7.super_class = (Class)BWIrisStagingNode;
  [(BWNode *)&v7 dealloc];
}

- (void)didReachEndOfDataForInput:(id)a3
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  pthread_mutex_lock(*(pthread_mutex_t **)&self->_emittedIrisRequestCount);
  uint64_t motionDataTimeMachine_high = SHIDWORD(self->_motionDataTimeMachine);
  HIDWORD(self->_motionDataTimeMachine) = motionDataTimeMachine_high + 1;
  if ([(NSArray *)[(BWNode *)self inputs] count] == motionDataTimeMachine_high + 1)
  {
    BYTE1(self->_subjectRelightingResult) = 1;
    if (LOBYTE(self->_droppedFramePTSs))
    {
      CMTime v56 = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F8];
      uint64_t v5 = (opaqueCMSampleBuffer *)objc_msgSend((id)-[NSURL objectAtIndexedSubscript:](self->_spatialOverCaptureMasterMovieURL, "objectAtIndexedSubscript:", 0), "lastObject");
      if (v5)
      {
        CMSampleBufferGetPresentationTimeStamp(&v56, v5);
        long long v57 = *(_OWORD *)&v56.value;
        *(void *)&v58[0] = v56.epoch;
        -[BWIrisStagingNode _serviceIrisRequestsForCurrentTime:emitBuffers:ensureStillImageTimesAreStaged:]((uint64_t)self, (CMTime *)&v57, 0, 0);
      }
      uint64_t v6 = (void *)[MEMORY[0x1E4F1CA48] array];
      long long v52 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      valveOpenerSettingsID = (void *)self->_valveOpenerSettingsID;
      uint64_t v8 = [valveOpenerSettingsID countByEnumeratingWithState:&v52 objects:v67 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v53;
        long long v11 = (long long *)MEMORY[0x1E4F1FA70];
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v53 != v10) {
              objc_enumerationMutation(valveOpenerSettingsID);
            }
            long long v13 = *(void **)(*((void *)&v52 + 1) + 8 * i);
            if (v13)
            {
              [v13 movieStartTime];
              if ((v50 & 0x100000000) != 0)
              {
                long long v14 = *v11;
                v58[0] = v11[1];
                uint64_t v60 = *((void *)v11 + 8);
                long long v15 = v11[2];
                long long v59 = v11[3];
                v58[1] = v15;
                long long v57 = v14;
                *(_OWORD *)((char *)v58 + 8) = *(_OWORD *)&self->_frameGovernorReferenceTime.epoch;
                *((void *)&v58[1] + 1) = *(void *)&self->_readyToEmitPTS.timescale;
                long long v64 = v58[1];
                long long v65 = v59;
                uint64_t v66 = v60;
                v63[0] = v14;
                v63[1] = v58[0];
                -[BWIrisStagingNode _emitIrisRequest:withEndingVideoSampleTimingInfo:]((uint64_t)self, v13, (uint64_t)v63);
                [v6 addObject:v13];
              }
            }
            else
            {
              uint64_t v49 = 0;
              uint64_t v50 = 0;
              uint64_t v51 = 0;
            }
          }
          uint64_t v9 = [valveOpenerSettingsID countByEnumeratingWithState:&v52 objects:v67 count:16];
        }
        while (v9);
      }
      [self->_valveOpenerSettingsID removeObjectsInArray:v6];
      if ([self->_valveOpenerSettingsID count])
      {
        [*(id *)&self->_visMotionMetadataPreloadingMode stagingNode:self valveClosedWithPendingIrisRequests:self->_valveOpenerSettingsID];
        [self->_valveOpenerSettingsID removeAllObjects];
      }
    }
    CMTimeEpoch v16 = *(void **)&self->_vitalityScoringSmartCameraPipelineVersion.minor;
    if (v16)
    {
      [v16 stopMotionProcessing];

      *(void *)&self->_vitalityScoringSmartCameraPipelineVersion.minor = 0;
    }
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    spatialOverCaptureMasterMovieURL = self->_spatialOverCaptureMasterMovieURL;
    uint64_t v18 = [(NSURL *)spatialOverCaptureMasterMovieURL countByEnumeratingWithState:&v45 objects:v62 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v46;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v46 != v20) {
            objc_enumerationMutation(spatialOverCaptureMasterMovieURL);
          }
          [*(id *)(*((void *)&v45 + 1) + 8 * j) removeAllObjects];
        }
        uint64_t v19 = [(NSURL *)spatialOverCaptureMasterMovieURL countByEnumeratingWithState:&v45 objects:v62 count:16];
      }
      while (v19);
    }
    CMTime v22 = *(void **)&self->_additionalCompressedBufferCount;
    if (v22)
    {

      *(void *)&self->_additionalCompressedBufferCount = 0;
    }
    intermediateJPEGCompressor = self->_intermediateJPEGCompressor;
    if (intermediateJPEGCompressor)
    {

      self->_intermediateJPEGCompressor = 0;
    }
    BYTE5(self->_limitedGMErrorLogger) = 0;

    *(void *)&self->_numberOfVideoFramesReceived = 0;
    self->_subjectRelightingCalculator = 0;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    int v24 = [(BWNode *)self outputs];
    uint64_t v25 = [(NSArray *)v24 countByEnumeratingWithState:&v41 objects:v61 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v42;
      do
      {
        for (uint64_t k = 0; k != v26; ++k)
        {
          if (*(void *)v42 != v27) {
            objc_enumerationMutation(v24);
          }
          [*(id *)(*((void *)&v41 + 1) + 8 * k) markEndOfLiveOutput];
        }
        uint64_t v26 = [(NSArray *)v24 countByEnumeratingWithState:&v41 objects:v61 count:16];
      }
      while (v26);
    }
    CMTimeEpoch epoch = (void *)self->_lastReceivedVideoTime.epoch;
    if (epoch)
    {
      [epoch average];
      double v31 = v30;
      [self->_lastReceivedVideoTime.epoch multiplier];
      if (v32 > 0.0)
      {
        [self->_lastReceivedVideoTime.epoch multiplier];
        double v31 = v31 / v33;
      }
      if (dword_1EB4C5070)
      {
        LODWORD(v56.value) = 0;
        os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        unsigned int value = v56.value;
        if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT)) {
          unsigned int v36 = value;
        }
        else {
          unsigned int v36 = value & 0xFFFFFFFE;
        }
        if (v36)
        {
          uint64_t v37 = [self->_lastReceivedVideoTime.epoch description];
          double v38 = 0.0;
          LODWORD(v63[0]) = 136315906;
          *(void *)((char *)v63 + 4) = "-[BWIrisStagingNode didReachEndOfDataForInput:]";
          WORD6(v63[0]) = 2048;
          *(void *)((char *)v63 + 14) = self;
          WORD3(v63[1]) = 2112;
          *((void *)&v63[1] + 1) = v37;
          if (v31 > 0.0) {
            double v38 = 1.0 / v31;
          }
          LOWORD(v64) = 2048;
          *(double *)((char *)&v64 + 2) = v38;
          LODWORD(v40) = 42;
          uint64_t v39 = v63;
          _os_log_send_and_compose_impl();
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }

      self->_lastReceivedVideoTime.CMTimeEpoch epoch = 0;
    }
    [(BWStats *)self->_valveActiveVideoFrameReceptionStats resetCurrentLoggingCounter];
  }
  pthread_mutex_unlock(*(pthread_mutex_t **)&self->_emittedIrisRequestCount);
}

- (void)_serviceIrisRequestsForCurrentTime:(int)a3 emitBuffers:(int)a4 ensureStillImageTimesAreStaged:
{
  if (a1)
  {
    uint64_t v8 = (void *)[*(id *)(a1 + 432) firstObject];
    long long v11 = *MEMORY[0x1E4F1F9F8];
    *(_OWORD *)&v16.unsigned int value = *MEMORY[0x1E4F1F9F8];
    CMTimeEpoch v9 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
    v16.CMTimeEpoch epoch = v9;
    if ((*(unsigned char *)(a1 + 308) & 1) == 0)
    {
      uint64_t v10 = v8;
      if (v8)
      {
        CMTime v15 = *a2;
        if (-[BWIrisStagingNode _haveEnoughVideoStagedToStartFirstIrisRecording:currentTime:emitEndTimeOut:](a1, v8, &v15, &v16))
        {
          -[BWIrisStagingNode _fillInStartAndTrimTimesForMasterMovieWithInfo:](a1, v10);
          [v10 movieStartTime];
          if (v14)
          {
            [v10 movieTrimStartTime];
            *(CMTime *)(a1 + 504) = v15;
            [v10 movieStartTime];
            CMTime v15 = v16;
            -[BWIrisStagingNode _prepareToEmitFramesFromStartTime:throughEndTime:](a1, &v13, (uint64_t)&v15);
          }
        }
      }
    }
    if (*(unsigned char *)(a1 + 308))
    {
      if (a4)
      {
        CMTime v15 = *a2;
      }
      else
      {
        *(_OWORD *)&v15.unsigned int value = v11;
        v15.CMTimeEpoch epoch = v9;
      }
      CMTime v12 = v15;
      -[BWIrisStagingNode _fillInRefMovieStartAndTrimTimesForStillImageTimesBeforeTime:](a1, &v12);
      CMTime v12 = *a2;
      -[BWIrisStagingNode _informDelegateOfSoonToBeEmittedIrisRequestsForTime:](a1, &v12);
      -[BWIrisStagingNode _tagStillImageVISKeyFrames](a1);
      if (a3) {
        -[BWIrisStagingNode _processQueuedVideoFrames](a1);
      }
    }
  }
}

- (uint64_t)_emitIrisRequest:(uint64_t)a3 withEndingVideoSampleTimingInfo:
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  if (!result) {
    return result;
  }
  uint64_t v5 = result;
  double result = FigSimpleMutexCheckIsLockedOnThisThread();
  if (!*(unsigned char *)(v5 + 392)) {
    return result;
  }
  objc_msgSend(a2, "setFinalEnqueuedIrisRequest:", objc_msgSend(*(id *)(v5 + 432), "lastObject") == (void)a2);
  [a2 isFinalEnqueuedIrisRequest];
  long long v53 = *(_OWORD *)(v5 + 320);
  uint64_t v54 = *(void *)(v5 + 336);
  [a2 setMasterMovieStartTime:&v53];
  if ((*(unsigned char *)(a3 + 12) & 1) == 0)
  {
    CMTimeMake(&rhs, 5, 1000);
    *(_OWORD *)&lhs.start.unsigned int value = *(_OWORD *)(v5 + 120);
    lhs.start.CMTimeEpoch epoch = *(void *)(v5 + 136);
    CMTimeSubtract(&v55[0].start, &lhs.start, &rhs);
    *(_OWORD *)a3 = *(_OWORD *)&v55[0].start.value;
    *(void *)(a3 + 16) = v55[0].start.epoch;
  }
  long long v50 = *(_OWORD *)(a3 + 24);
  uint64_t v51 = *(void *)(a3 + 40);
  [a2 setMovieEndingVideoPTS:&v50];
  *(_OWORD *)&v55[0].start.unsigned int value = *(_OWORD *)(a3 + 24);
  v55[0].start.CMTimeEpoch epoch = *(void *)(a3 + 40);
  *(_OWORD *)&lhs.start.unsigned int value = *(_OWORD *)a3;
  lhs.start.CMTimeEpoch epoch = *(void *)(a3 + 16);
  CMTimeAdd(&v49, &v55[0].start, &lhs.start);
  CMTime v48 = v49;
  [a2 setMovieEndTime:&v48];
  if (!a2)
  {
    uint64_t v45 = 0;
    uint64_t v46 = 0;
    uint64_t v47 = 0;
    uint64_t v44 = 0;
    long long v43 = 0uLL;
    goto LABEL_9;
  }
  [a2 movieTrimEndTime];
  if ((v46 & 0x100000000) == 0)
  {
    [a2 movieEndTime];
LABEL_9:
    long long v41 = v43;
    uint64_t v42 = v44;
    [a2 setMovieTrimEndTime:&v41];
  }
  [a2 setMasterMovieURL:*(void *)(v5 + 352)];
  [a2 setSpatialOverCaptureMasterMovieURL:*(void *)(v5 + 360)];
  if ([a2 isFinalEnqueuedIrisRequest]) {
    BOOL v6 = *(_DWORD *)(v5 + 448) > 0;
  }
  else {
    BOOL v6 = 0;
  }
  [a2 setFinalReferenceMovie:v6];
  if (*(unsigned char *)(v5 + 484) && ([a2 isMomentCaptureMovieRecording] & 1) == 0)
  {
    memset(v55, 0, 48);
    if (a2)
    {
      [a2 movieTrimStartTime];
      [a2 movieTrimEndTime];
      CMTimeRangeFromTimeToTime(v55, &start, &end);
      objc_super v7 = *(void **)(v5 + 496);
      [a2 stillImageCaptureTime];
    }
    else
    {
      memset(&start, 0, sizeof(start));
      memset(&end, 0, sizeof(end));
      CMTimeRangeFromTimeToTime(v55, &start, &end);
      objc_super v7 = *(void **)(v5 + 496);
      memset(v38, 0, sizeof(v38));
    }
    CMTimeRange lhs = v55[0];
    [v7 computeVitalityScoreForStillImageHostPTS:v38 movieRange:&lhs];
    objc_msgSend(a2, "setVitalityScore:");
    objc_msgSend(a2, "setVitalityScoringVersion:", objc_msgSend(*(id *)(v5 + 496), "vitalityScoringVersion"));
    objc_msgSend(a2, "setVitalityScoreValid:", objc_msgSend(a2, "vitalityScoringVersion") != 0);
  }
  if ([a2 isFinalEnqueuedIrisRequest])
  {
    if (a2)
    {
      [a2 movieEndingVideoPTS];
      [a2 stillImageCaptureTime];
    }
    else
    {
      memset(&time1, 0, sizeof(time1));
      memset(&time2, 0, sizeof(time2));
    }
    if (CMTimeCompare(&time1, &time2) <= 0)
    {
      if (dword_1EB4C5070)
      {
        unsigned int v35 = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      *(void *)(v5 + 560) = 0;
    }
  }
  if (*(void *)(v5 + 560))
  {
    if (a2)
    {
      [a2 movieEndTime];
      [a2 stillImageCaptureTime];
    }
    else
    {
      memset(&v33, 0, sizeof(v33));
      memset(&v32, 0, sizeof(v32));
    }
    if (CMTimeCompare(&v33, &v32) < 0 && dword_1EB4C5070)
    {
      unsigned int v35 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      CMTimeEpoch v9 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v10 = v35;
      if (os_log_type_enabled(v9, type)) {
        unsigned int v11 = v10;
      }
      else {
        unsigned int v11 = v10 & 0xFFFFFFFE;
      }
      if (v11)
      {
        uint64_t v12 = [a2 description];
        LODWORD(lhs.start.value) = 136315394;
        *(CMTimeValue *)((char *)&lhs.start.value + 4) = (CMTimeValue)"-[BWIrisStagingNode _emitIrisRequest:withEndingVid"
                                                                      "eoSampleTimingInfo:]";
        LOWORD(lhs.start.flags) = 2112;
        *(void *)((char *)&lhs.start.flags + 2) = v12;
        LODWORD(v23) = 22;
        p_CMTimeRange lhs = &lhs;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    objc_msgSend(*(id *)(v5 + 560), "adjustMovieInfoTimes:", a2, p_lhs, v23);
    if (a2)
    {
      [a2 movieEndTime];
      [a2 stillImageCaptureTime];
    }
    else
    {
      memset(&v31, 0, sizeof(v31));
      memset(&v30, 0, sizeof(v30));
    }
    if (CMTimeCompare(&v31, &v30) < 0 && dword_1EB4C5070)
    {
      unsigned int v35 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      uint64_t v17 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v18 = v35;
      if (os_log_type_enabled(v17, type)) {
        unsigned int v19 = v18;
      }
      else {
        unsigned int v19 = v18 & 0xFFFFFFFE;
      }
      if (v19)
      {
        uint64_t v20 = [a2 description];
        LODWORD(lhs.start.value) = 136315394;
        *(CMTimeValue *)((char *)&lhs.start.value + 4) = (CMTimeValue)"-[BWIrisStagingNode _emitIrisRequest:withEndingVid"
                                                                      "eoSampleTimingInfo:]";
        LOWORD(lhs.start.flags) = 2112;
        *(void *)((char *)&lhs.start.flags + 2) = v20;
        LODWORD(v23) = 22;
        p_CMTimeRange lhs = &lhs;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  else
  {
    if (a2)
    {
      [a2 movieEndTime];
      [a2 stillImageCaptureTime];
    }
    else
    {
      memset(&v29, 0, sizeof(v29));
      memset(&v28, 0, sizeof(v28));
    }
    if (CMTimeCompare(&v29, &v28) < 0 && dword_1EB4C5070)
    {
      unsigned int v35 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      long long v13 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      unsigned int v14 = v35;
      if (os_log_type_enabled(v13, type)) {
        unsigned int v15 = v14;
      }
      else {
        unsigned int v15 = v14 & 0xFFFFFFFE;
      }
      if (v15)
      {
        uint64_t v16 = [a2 description];
        LODWORD(lhs.start.value) = 136315394;
        *(CMTimeValue *)((char *)&lhs.start.value + 4) = (CMTimeValue)"-[BWIrisStagingNode _emitIrisRequest:withEndingVid"
                                                                      "eoSampleTimingInfo:]";
        LOWORD(lhs.start.flags) = 2112;
        *(void *)((char *)&lhs.start.flags + 2) = v16;
        LODWORD(v23) = 22;
        p_CMTimeRange lhs = &lhs;
        _os_log_send_and_compose_impl();
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  objc_msgSend(a2, "setStagingNodeOverallVideoFrameReceptionStats:", *(void *)(v5 + 736), p_lhs, v23);
  [a2 setStagingNodeValveActiveVideoFrameReceptionStats:*(void *)(v5 + 744)];
  if ([*(id *)(v5 + 440) containsObject:a2]) {
    [*(id *)(v5 + 440) removeObject:a2];
  }
  else {
    [*(id *)(v5 + 584) stagingNode:v5 willEmitIrisRequest:a2];
  }
  -[BWIrisStagingNode _emitIrisMovieRequestWithInfo:]((void *)v5, a2);
  ++*(_DWORD *)(v5 + 448);
  double result = [a2 isFinalEnqueuedIrisRequest];
  if (result)
  {
    *(unsigned char *)(v5 + 394) = 1;
    uint64_t v21 = MEMORY[0x1E4F1F9F8];
    *(_OWORD *)(v5 + 400) = *MEMORY[0x1E4F1F9F8];
    *(void *)(v5 + 416) = *(void *)(v21 + 16);
    if (a2) {
      [a2 movieEndingVideoPTS];
    }
    else {
      memset(&v26, 0, sizeof(v26));
    }
    CMTimeMake(&v24, 5, 1000);
    *(_OWORD *)&v55[0].start.unsigned int value = *(_OWORD *)(v5 + 120);
    v55[0].start.CMTimeEpoch epoch = *(void *)(v5 + 136);
    CMTimeSubtract(&v25, &v55[0].start, &v24);
    CMTimeSubtract(&v27, &v26, &v25);
    -[BWIrisStagingNode _emitBuffersThroughPTS:](v5, &v27);
    return -[BWIrisStagingNode _emitBuffersThroughPTS:](v5, MEMORY[0x1E4F1FA10]);
  }
  return result;
}

- (uint64_t)_feedTrimmerWithInferencesSampleBuffer:(uint64_t)result
{
  if (!result) {
    return result;
  }
  uint64_t v3 = result;
  AttachedInferenceResult = (void *)BWInferenceGetAttachedInferenceResult(a2, 101);
  double result = [AttachedInferenceResult isValid];
  if (!result) {
    return result;
  }
  memset(&v11, 0, sizeof(v11));
  CFDictionaryRef v5 = (const __CFDictionary *)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E4F530C0], 0);
  if (!v5)
  {
    CMSampleBufferGetPresentationTimeStamp(&v11, (CMSampleBufferRef)a2);
    if (AttachedInferenceResult) {
      goto LABEL_5;
    }
LABEL_7:
    memset(&time2, 0, sizeof(time2));
    goto LABEL_8;
  }
  CMTimeMakeFromDictionary(&v11, v5);
  if (!AttachedInferenceResult) {
    goto LABEL_7;
  }
LABEL_5:
  [AttachedInferenceResult timestamp];
LABEL_8:
  CMTime time1 = v11;
  CMTimeCompare(&time1, &time2);
  uint64_t v6 = [AttachedInferenceResult inferences];
  objc_super v7 = *(void **)(v3 + 496);
  if (AttachedInferenceResult) {
    [AttachedInferenceResult timestamp];
  }
  else {
    memset(v8, 0, sizeof(v8));
  }
  return [v7 processInferences:v6 forHostTime:v8];
}

- (CMTime)_emitSampleBuffer:(uint64_t)a3 forInputIndex:
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    CFDictionaryRef v5 = result;
    unsigned int v35 = objc_msgSend((id)-[CMTime outputs](result, "outputs"), "objectAtIndexedSubscript:", a3);
    CFTypeRef cf = 0;
    uint64_t v6 = *(void **)&v5[23].timescale;
    if (!v6)
    {
      BWCMSampleBufferCreateCopyIncludingMetadata(a2, (CMSampleBufferRef *)&cf);
      goto LABEL_24;
    }
    [v6 enqueueSampleBuffer:a2 forMediaTypeWithIndex:a3];
    if (!a3)
    {
      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      objc_super v7 = (void *)v5[18].value;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v53 objects:v59 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v54;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v54 != v9) {
              objc_enumerationMutation(v7);
            }
            CMTime v11 = *(void **)(*((void *)&v53 + 1) + 8 * i);
            if (v11)
            {
              [*(id *)(*((void *)&v53 + 1) + 8 * i) audioOffset];
              if ((v51 & 0x100000000) != 0) {
                continue;
              }
              CMSampleBufferGetPresentationTimeStamp(&time1, a2);
              [v11 stillImageCaptureTime];
            }
            else
            {
              uint64_t v50 = 0;
              uint64_t v51 = 0;
              uint64_t v52 = 0;
              CMSampleBufferGetPresentationTimeStamp(&time1, a2);
              memset(&time2, 0, sizeof(time2));
            }
            if (CMTimeCompare(&time1, &time2) >= 1)
            {
              memset(&v43, 0, sizeof(v43));
              uint64_t v12 = *(void **)&v5[23].timescale;
              if (v11)
              {
                [v11 stillImageCaptureTime];
                if (!v12) {
                  continue;
                }
              }
              else
              {
                memset(v47, 0, sizeof(v47));
                if (!v12) {
                  continue;
                }
              }
              [v12 audioOffsetForOriginalStillImageTime:v47];
              if (v43.flags)
              {
                CMTime v46 = v43;
                [v11 setAudioOffset:&v46];
              }
            }
          }
          uint64_t v8 = [v7 countByEnumeratingWithState:&v53 objects:v59 count:16];
        }
        while (v8);
      }
    }
LABEL_24:
    CFStringRef key = (const __CFString *)*MEMORY[0x1E4F53070];
    uint64_t v33 = *MEMORY[0x1E4F53500];
    CFTypeRef value = (CFTypeRef)*MEMORY[0x1E4F1CFD0];
    long long v13 = (void *)cf;
    while (1)
    {
      unsigned int v14 = *(void **)&v5[23].timescale;
      if (v14 || v13 == 0)
      {
        long long v13 = (void *)[v14 dequeueAndRetainAdjustedSampleBufferForMediaTypeWithIndex:a3];
        CFTypeRef cf = v13;
        if (!v13) {
          break;
        }
      }
      if (!a3)
      {
        v43.CFTypeRef value = 0;
        *(void *)&v43.CMTimeScale timescale = &v43;
        v43.CMTimeEpoch epoch = 0x3810000000;
        uint64_t v44 = "";
        memset(&v45, 0, sizeof(v45));
        CMSampleBufferGetPresentationTimeStamp(&v45, (CMSampleBufferRef)v13);
        uint64_t v16 = (void *)v5[18].value;
        v42[0] = MEMORY[0x1E4F143A8];
        v42[1] = 3221225472;
        v42[2] = __53__BWIrisStagingNode__emitSampleBuffer_forInputIndex___block_invoke;
        v42[3] = &unk_1E5C260D0;
        v42[4] = v5;
        v42[5] = &v43;
        v42[6] = cf;
        [v16 enumerateObjectsUsingBlock:v42];
        uint64_t v17 = NSNumber;
        CMClockRef HostTimeClock = CMClockGetHostTimeClock();
        CMClockGetTime(&time, HostTimeClock);
        CMTimeConvertScale(&v40, &time, 1000000000, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
        unsigned int v19 = (const void *)[v17 numberWithLongLong:v40.value];
        CMSetAttachment(cf, @"IrisStagingNodeEmissionTimeStamp", v19, 1u);
        AttachedMedia = (const void *)BWSampleBufferGetAttachedMedia(cf, 0x1EFA742E0);
        if (AttachedMedia
          || (AttachedMedia = (const void *)BWSampleBufferGetAttachedMedia(cf, @"SynchronizedSlaveFrame")) != 0)
        {
          CMSetAttachment(AttachedMedia, @"IrisStagingNodeEmissionTimeStamp", v19, 1u);
        }
        if (v5[32].value && BYTE5(v5[31].epoch))
        {
          int v21 = BYTE2(v5[32].epoch)
              ? objc_msgSend(+[FigCaptureSmartStyle createFromDictionary:](FigCaptureSmartStyle, "createFromDictionary:", objc_msgSend((id)CMGetAttachment(cf, key, 0), "objectForKeyedSubscript:", v33)), "isIdentity"): 1;
          CMTime v22 = *(const void **)&v5[32].timescale;
          if (v22)
          {
            if (v21) {
              CMSetAttachment(cf, @"SubjectRelightingResult", v22, 1u);
            }
          }
        }
        if (BYTE3(v5[32].epoch))
        {
          if (objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)v5[18].value, "firstObject"), "settings"), "smartStyleReversibilitySupported"))
          {
            BWSynchronizeSmartStyleAttachedMediaPTS((opaqueCMSampleBuffer *)cf);
          }
          else
          {
            long long v38 = 0u;
            long long v39 = 0u;
            long long v36 = 0u;
            long long v37 = 0u;
            uint64_t v23 = BWAttachedMediaKeysRequiredBySmartStyleRenderingPipelines(0, 1);
            uint64_t v24 = [v23 countByEnumeratingWithState:&v36 objects:v58 count:16];
            if (v24)
            {
              uint64_t v25 = *(void *)v37;
              do
              {
                for (uint64_t j = 0; j != v24; ++j)
                {
                  if (*(void *)v37 != v25) {
                    objc_enumerationMutation(v23);
                  }
                  BWSampleBufferRemoveAttachedMedia(cf, *(void *)(*((void *)&v36 + 1) + 8 * j));
                }
                uint64_t v24 = [v23 countByEnumeratingWithState:&v36 objects:v58 count:16];
              }
              while (v24);
            }
          }
        }
        _Block_object_dispose(&v43, 8);
        long long v13 = (void *)cf;
        if (BYTE2(v5[32].epoch))
        {
          CMTime v27 = (void *)CMGetAttachment(cf, key, 0);
          uint64_t v28 = [v27 objectForKeyedSubscript:v33];
          long long v13 = (void *)cf;
          if (!v28)
          {
            CMSetAttachment(cf, @"SampleDataToBeDropped", value, 1u);
            [v27 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:0x1EFA73EA0];
            long long v13 = (void *)cf;
          }
        }
      }
      [v35 emitSampleBuffer:v13];
      long long v13 = 0;
      if (cf)
      {
        CFRelease(cf);
        long long v13 = 0;
        CFTypeRef cf = 0;
      }
    }
    double result = (CMTime *)[(id)v5[15].epoch setObject:a2 atIndexedSubscript:a3];
    uint64_t v29 = *(void *)&v5[19].timescale;
    if ((*(unsigned char *)(v29 + 24 * a3 + 12) & 1) == 0)
    {
      double result = CMSampleBufferGetPresentationTimeStamp(&v43, a2);
      long long v30 = *(_OWORD *)&v43.value;
      uint64_t v31 = v29 + 24 * a3;
      *(void *)(v31 + 16) = v43.epoch;
      *(_OWORD *)uint64_t v31 = v30;
    }
  }
  return result;
}

- (void)handleNodeError:(id)a3 forInput:(id)a4
{
  if ([a4 index] != *(void *)&self->_trimLivePhotoMovieAtWideAndSuperWideAutoSwitching)
  {
    id v7 = -[NSArray objectAtIndexedSubscript:](-[BWNode outputs](self, "outputs"), "objectAtIndexedSubscript:", [a4 index]);
    [v7 emitNodeError:a3];
  }
}

- (int)openValveWithIrisRequest:(id)a3
{
  uint64_t v97 = *MEMORY[0x1E4F143B8];
  pthread_mutex_lock(*(pthread_mutex_t **)&self->_emittedIrisRequestCount);
  if (LOBYTE(self->_droppedFramePTSs))
  {
    if (!dword_1EB4C5070)
    {
LABEL_74:
      int v34 = 0;
      goto LABEL_81;
    }
    LODWORD(v75.value) = 0;
    LOBYTE(type.value) = 0;
    os_log_and_send_and_compose_flags_and_os_log_CMTime type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    goto LABEL_73;
  }
  uint64_t v6 = objc_alloc_init(BWStats);
  self->_overallVideoFrameReceptionStats = v6;
  [(BWStats *)v6 setMultiplier:1000.0];
  [(BWStats *)self->_overallVideoFrameReceptionStats setUnitDesignator:@"ms"];
  long long v48 = *MEMORY[0x1E4F1F9F8];
  *(_OWORD *)&v77.unsigned int value = *MEMORY[0x1E4F1F9F8];
  CMTimeEpoch v7 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  v77.CMTimeEpoch epoch = v7;
  if (self->_stagingSuspended)
  {
    [a3 isMomentCaptureMovieRecording];
    double v8 = -[BWIrisStagingNode _resumeStaging]((uint64_t)self);
    self->_flushAndSuspendPending = 1;
    if (a3) {
      objc_msgSend(a3, "stillImageCaptureHostTime", v8);
    }
    else {
      memset(&time1, 0, sizeof(time1));
    }
    CMTime v77 = time1;
  }
  else
  {
    [(BWIrisStagingNode *)(CMTime *)self _earliestAllowedStillHostPTS];
  }
  if ([a3 isMomentCaptureMovieRecording])
  {
    CMTime time1 = v77;
    CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA10];
    if (CMTimeCompare(&time1, &time2) < 0)
    {
      if (a3) {
        [a3 stillImageCaptureHostTime];
      }
      else {
        memset(&v76, 0, sizeof(v76));
      }
      CMTime time1 = v77;
      if (CMTimeCompare(&v76, &time1) < 0)
      {
        memset(&v75, 0, sizeof(v75));
        CMClockRef HostTimeClock = CMClockGetHostTimeClock();
        firstEmittedPTSArray = self->_firstEmittedPTSArray;
        CMTime time1 = v77;
        CMSyncConvertTime(&v75, &time1, HostTimeClock, firstEmittedPTSArray);
        LODWORD(type.value) = 0;
        LOBYTE(v71.value) = 0;
        CMTime v11 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        CMTime time1 = v77;
        CMTime time2 = v75;
        [a3 setMomentCaptureRecordingStillImageCaptureHostTimeOverride:&time1 stillImageCaptureTimeOverride:&time2];
      }
    }
  }
  if ((objc_msgSend(a3, "isMomentCaptureMovieRecording", v43, v45) & 1) == 0)
  {
    if (a3) {
      [a3 stillImageCaptureHostTime];
    }
    else {
      memset(&v74, 0, sizeof(v74));
    }
    CMTime time1 = v77;
    if (CMTimeCompare(&v74, &time1) < 0)
    {
      memset(&v75, 0, sizeof(v75));
      uint64_t v16 = CMClockGetHostTimeClock();
      CMClockGetTime(&v75, v16);
      memset(&type, 0, sizeof(type));
      if (a3) {
        [a3 stillImageCaptureHostTime];
      }
      else {
        memset(&v72, 0, sizeof(v72));
      }
      CMTime time1 = v75;
      CMTimeSubtract(&type, &time1, &v72);
      memset(&v71, 0, sizeof(v71));
      CMSampleBufferGetPresentationTimeStamp(&v70, (CMSampleBufferRef)objc_msgSend((id)-[NSURL objectAtIndexedSubscript:](self->_spatialOverCaptureMasterMovieURL, "objectAtIndexedSubscript:", 0), "lastObject"));
      CMTime time1 = v75;
      CMTimeSubtract(&v71, &time1, &v70);
      memset(&v69, 0, sizeof(v69));
      CMTime time1 = v75;
      CMTime time2 = *(CMTime *)(&self->_flushAndSuspendPending + 3);
      CMTimeSubtract(&v69, &time1, &time2);
      memset(&v68, 0, sizeof(v68));
      CMTimeMake(&v68, 500, 1000);
      if ((v69.flags & 1) != 0 && (time1 = v69, CMTime time2 = v68, CMTimeCompare(&time1, &time2) < 0))
      {
        int v67 = 0;
        os_log_type_t v66 = OS_LOG_TYPE_DEFAULT;
        CMTime v40 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        int v34 = -15544;
      }
      else
      {
        CMTime time1 = type;
        CMTime time2 = v71;
        if (CMTimeCompare(&time1, &time2) < 0)
        {
          if (v71.flags)
          {
            int v67 = 0;
            os_log_type_t v66 = OS_LOG_TYPE_DEFAULT;
            long long v41 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
            int v34 = -16959;
          }
          else
          {
            int v34 = -16958;
          }
        }
        else
        {
          int v34 = -16955;
        }
      }
      if (dword_1EB4C5070)
      {
        int v67 = 0;
        os_log_type_t v66 = OS_LOG_TYPE_DEFAULT;
        uint64_t v42 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      goto LABEL_81;
    }
  }
  memset(&v65, 0, sizeof(v65));
  CMSampleBufferGetPresentationTimeStamp(&v65, (CMSampleBufferRef)objc_msgSend((id)-[NSURL objectAtIndexedSubscript:](self->_spatialOverCaptureMasterMovieURL, "objectAtIndexedSubscript:", 0), "lastObject"));
  if (dword_1EB4C5070)
  {
    LODWORD(v75.value) = 0;
    LOBYTE(type.value) = 0;
    uint64_t v12 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int value = v75.value;
    if (os_log_type_enabled(v12, type.value)) {
      unsigned int v14 = value;
    }
    else {
      unsigned int v14 = value & 0xFFFFFFFE;
    }
    if (v14)
    {
      uint64_t v47 = objc_msgSend((id)objc_msgSend(a3, "settings"), "settingsID");
      if ([a3 isMomentCaptureMovieRecording]) {
        unsigned int v15 = @"Moment Capture Movie Recording";
      }
      else {
        unsigned int v15 = @"Live Photo";
      }
      if (a3) {
        [a3 stillImageCaptureTime];
      }
      else {
        memset(&v64, 0, sizeof(v64));
      }
      Float64 Seconds = CMTimeGetSeconds(&v64);
      mach_absolute_time();
      double v18 = (double)FigHostTimeToNanoseconds();
      if (a3) {
        [a3 stillImageCaptureHostTime];
      }
      else {
        memset(&v63, 0, sizeof(v63));
      }
      double v19 = v18 / 1000000000.0;
      double v20 = CMTimeGetSeconds(&v63);
      CMSampleBufferGetPresentationTimeStamp(&v62, (CMSampleBufferRef)objc_msgSend((id)-[NSURL objectAtIndexedSubscript:](self->_spatialOverCaptureMasterMovieURL, "objectAtIndexedSubscript:", 0), "firstObject"));
      Float64 v21 = CMTimeGetSeconds(&v62);
      CMTime time1 = v65;
      Float64 v22 = CMTimeGetSeconds(&time1);
      Float64 v23 = 0.0;
      Float64 v24 = 0.0;
      if (-[BWIrisStagingNode _emittingInputsCount]((uint64_t)self) != 1)
      {
        CMSampleBufferGetPresentationTimeStamp(&v61, (CMSampleBufferRef)objc_msgSend((id)-[NSURL objectAtIndexedSubscript:](self->_spatialOverCaptureMasterMovieURL, "objectAtIndexedSubscript:", 1), "firstObject"));
        Float64 v24 = CMTimeGetSeconds(&v61);
      }
      double v25 = v19 - v20;
      if (-[BWIrisStagingNode _emittingInputsCount]((uint64_t)self) != 1)
      {
        CMSampleBufferGetPresentationTimeStamp(&v60, (CMSampleBufferRef)objc_msgSend((id)-[NSURL objectAtIndexedSubscript:](self->_spatialOverCaptureMasterMovieURL, "objectAtIndexedSubscript:", 1), "lastObject"));
        Float64 v23 = CMTimeGetSeconds(&v60);
      }
      double v26 = v25 * 1000.0;
      if (a3) {
        [a3 stillImageCaptureHostTime];
      }
      else {
        memset(&lhs, 0, sizeof(lhs));
      }
      CMTime time1 = v77;
      CMTimeSubtract(&v59, &lhs, &time1);
      Float64 v27 = CMTimeGetSeconds(&v59);
      LODWORD(time2.value) = 136317698;
      *(CMTimeValue *)((char *)&time2.value + 4) = (CMTimeValue)"-[BWIrisStagingNode openValveWithIrisRequest:]";
      LOWORD(time2.flags) = 2048;
      *(void *)((char *)&time2.flags + 2) = self;
      HIWORD(time2.epoch) = 2048;
      uint64_t v79 = v47;
      __int16 v80 = 2112;
      double v81 = v15;
      __int16 v82 = 2048;
      Float64 v83 = Seconds;
      __int16 v84 = 2048;
      double v85 = v26;
      __int16 v86 = 2048;
      Float64 v87 = v21;
      __int16 v88 = 2048;
      Float64 v89 = v22;
      __int16 v90 = 2048;
      Float64 v91 = v24;
      __int16 v92 = 2048;
      Float64 v93 = v23;
      __int16 v94 = 2048;
      double v95 = v27 * 1000.0;
      LODWORD(v46) = 112;
      p_CMTime time2 = &time2;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  LOBYTE(self->_droppedFramePTSs) = 1;
  BYTE3(self->_droppedFramePTSs) = 0;
  BYTE4(self->_droppedFramePTSs) = objc_msgSend(a3, "isMomentCaptureMovieRecording", p_time2, v46);
  self->_valveDiscontinuitySearchLimit.CMTimeEpoch epoch = objc_msgSend((id)objc_msgSend(a3, "settings"), "settingsID");
  *(_OWORD *)&self->_frameGovernorReferenceTime.CMTimeEpoch epoch = v48;
  *(void *)&self->_readyToEmitPTS.CMTimeScale timescale = v7;
  *(_OWORD *)&self->_readyToEmitPTS.CMTimeEpoch epoch = v48;
  *(void *)&self->_lastProcessedVideoPTS.CMTimeScale timescale = v7;
  *(_OWORD *)&self->_lastProcessedVideoPTS.CMTimeEpoch epoch = v48;
  *(void *)&self->_masterMovieStartPTS.CMTimeScale timescale = v7;
  *(_OWORD *)&self->_trimmer = v48;
  *(void *)&self->_firstTrimStartPTS.CMTimeScale timescale = v7;
  LODWORD(self->_irisRequestsSoonToBeEmitted) = 0;
  if ([a3 isMomentCaptureMovieRecording])
  {
    self->_sequenceAdjusterBackingStore = 0;
  }
  else
  {
    motionDataPreserver = self->_motionDataPreserver;
    self->_sequenceAdjusterBackingStore = (BWIrisSequenceAdjuster *)motionDataPreserver;
    if (motionDataPreserver)
    {
      CMTime time1 = (CMTime)self->_targetFrameDuration;
      CMTimeMultiply(&v56, &time1, 5);
      CMTimeMake(&rhs, 5, 1000);
      CMTime time1 = (CMTime)self->_targetFrameDuration;
      CMTimeAdd(&v55, &time1, &rhs);
      CMTimeAdd(&v57, &v56, &v55);
      CMTime time2 = v65;
      CMTimeAdd(&time1, &time2, &v57);
      *(CMTime *)&self->_valveOpen = time1;
      goto LABEL_53;
    }
  }
  *(_OWORD *)&self->_valveOpen = v48;
  *(void *)&self->_valveDiscontinuitySearchLimit.CMTimeScale timescale = v7;
LABEL_53:

  self->_masterMovieURL = 0;
  if ([a3 isMomentCaptureMovieRecording])
  {
    self->_temporaryMovieDirectoryURL = (NSURL *)(id)objc_msgSend((id)objc_msgSend(a3, "settings"), "outputURL");
    self->_masterMovieURL = (NSURL *)(id)objc_msgSend((id)objc_msgSend(a3, "settings"), "spatialOverCaptureMovieURL");
  }
  else
  {
    if (self->_masterMovieStartPTS.epoch)
    {
      uint64_t v29 = (void *)[self->_masterMovieStartPTS.epoch URLByAppendingPathComponent:objc_msgSend(NSString, "stringWithFormat:", @"master%lld.mov", objc_msgSend((id)objc_msgSend(a3, "settings"), "settingsID")), 0 isDirectory];
    }
    else
    {
      long long v30 = objc_msgSend((id)objc_msgSend(a3, "settings"), "outputURL");
      uint64_t v29 = objc_msgSend((id)objc_msgSend(v30, "URLByDeletingLastPathComponent"), "URLByAppendingPathComponent:", objc_msgSend(NSString, "stringWithFormat:", @"%@.%@", objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29128], "UUID"), "UUIDString"), objc_msgSend(v30, "pathExtension")));
    }
    uint64_t v31 = v29;
    self->_temporaryMovieDirectoryURL = v31;
    objc_msgSend((id)objc_msgSend(a3, "settings"), "setOutputURL:", v31);
    if (objc_msgSend((id)objc_msgSend(a3, "settings"), "spatialOverCaptureMovieURL"))
    {
      CMTime v32 = isn_addVariantToURL(self->_temporaryMovieDirectoryURL);
      self->_masterMovieURL = v32;
      objc_msgSend((id)objc_msgSend(a3, "settings"), "setSpatialOverCaptureMovieURL:", v32);
    }
  }
  p_beginIrisMovieCaptureTime = &self->_beginIrisMovieCaptureTime;
  if (self->_beginIrisMovieCaptureTime.flags)
  {
    if (a3)
    {
      [a3 beginTrimMasterPTS];
      if ((v52 & 0x100000000) == 0) {
        goto LABEL_66;
      }
      [a3 beginTrimMasterPTS];
      *(_OWORD *)&time1.unsigned int value = *(_OWORD *)&p_beginIrisMovieCaptureTime->value;
      time1.CMTimeEpoch epoch = self->_beginIrisMovieCaptureTime.epoch;
      if ((CMTimeCompare(&time1, &v50) & 0x80000000) == 0) {
        goto LABEL_66;
      }
      goto LABEL_62;
    }
    uint64_t v51 = 0;
    uint64_t v52 = 0;
    uint64_t v53 = 0;
LABEL_69:
    memset(&v49, 0, sizeof(v49));
    goto LABEL_70;
  }
  if (!a3)
  {
    p_beginIrisMovieCaptureTime->unsigned int value = 0;
    *(void *)&self->_beginIrisMovieCaptureTime.CMTimeScale timescale = 0;
    self->_beginIrisMovieCaptureTime.CMTimeEpoch epoch = 0;
    goto LABEL_69;
  }
LABEL_62:
  [a3 beginTrimMasterPTS];
  *(_OWORD *)&p_beginIrisMovieCaptureTime->unsigned int value = *(_OWORD *)&time1.value;
  self->_beginIrisMovieCaptureTime.CMTimeEpoch epoch = time1.epoch;
LABEL_66:
  [a3 stillImageCaptureTime];
LABEL_70:
  CMTime time1 = (CMTime)self->_endIrisMovieCaptureTime;
  if (CMTimeCompare(&time1, &v49) <= 0)
  {
    *(_OWORD *)&self->_endIrisMovieCaptureTime.unsigned int value = v48;
    self->_endIrisMovieCaptureTime.CMTimeEpoch epoch = v7;
  }
  -[BWIrisStagingNode _enqueueIrisRequest:]((uint64_t)self, a3);
LABEL_73:
  if (LOBYTE(self->_droppedFramePTSs)) {
    goto LABEL_74;
  }
  LODWORD(v75.value) = 0;
  LOBYTE(type.value) = 0;
  unsigned int v35 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  unsigned int v36 = v75.value;
  if (os_log_type_enabled(v35, type.value)) {
    unsigned int v37 = v36;
  }
  else {
    unsigned int v37 = v36 & 0xFFFFFFFE;
  }
  if (v37)
  {
    LODWORD(time2.value) = 136315394;
    *(CMTimeValue *)((char *)&time2.value + 4) = (CMTimeValue)"-[BWIrisStagingNode openValveWithIrisRequest:]";
    LOWORD(time2.flags) = 2048;
    *(void *)((char *)&time2.flags + 2) = self;
    _os_log_send_and_compose_impl();
  }
  fig_log_call_emit_and_clean_up_after_send_and_compose();
  int v34 = -16959;
LABEL_81:
  int droppedFramePTSs_low = LOBYTE(self->_droppedFramePTSs);
  pthread_mutex_unlock(*(pthread_mutex_t **)&self->_emittedIrisRequestCount);
  if (droppedFramePTSs_low) {
    return 0;
  }
  else {
    return v34;
  }
}

- (uint64_t)_emittingInputsCount
{
  if (result)
  {
    uint64_t v1 = (void *)result;
    FigSimpleMutexCheckIsLockedOnThisThread();
    double result = objc_msgSend((id)objc_msgSend(v1, "inputs"), "count");
    if (v1[67] == result - 1) {
      --result;
    }
  }
  return result;
}

- (uint64_t)_enqueueIrisRequest:(uint64_t)result
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v3 = result;
    double result = FigSimpleMutexCheckIsLockedOnThisThread();
    if (*(unsigned char *)(v3 + 392))
    {
      if (*(void *)(v3 + 344))
      {
        uint64_t v4 = objc_msgSend((id)objc_msgSend(a2, "settings"), "settingsID");
        int v5 = [a2 isOriginalPhotoRecording];
        uint64_t v6 = &stru_1EFA403E0;
        if (v5) {
          uint64_t v6 = @"_original";
        }
        [a2 setTemporaryMovieURL:objc_msgSend(*(id *)(v3 + 344), "URLByAppendingPathComponent:isDirectory:", objc_msgSend(NSString, "stringWithFormat:", @"output%lld%@.mov", v4, v6), 0)];
        if ((int)[a2 numberOfRequestedVariants] >= 2)
        {
          uint64_t v7 = objc_msgSend((id)objc_msgSend(a2, "settings"), "settingsID");
          [a2 setTemporaryURLForSDOFOriginalMovie:objc_msgSend(*(id *)(v3 + 344), "URLByAppendingPathComponent:isDirectory:", objc_msgSend(NSString, "stringWithFormat:", @"output%lld%@.mov", v7, @"_original", 0)];
        }
        if (objc_msgSend((id)objc_msgSend(a2, "settings"), "spatialOverCaptureMovieURL")) {
          objc_msgSend(a2, "setSpatialOverCaptureTemporaryMovieURL:", isn_addVariantToURL(objc_msgSend(a2, "temporaryMovieURL")));
        }
      }
      [*(id *)(v3 + 432) addObject:a2];
      if ((unint64_t)[*(id *)(v3 + 432) count] >= 2) {
        [a2 setIsOverlappingRequest:1];
      }
      uint64_t v9 = *(void *)(v3 + 120);
      int v10 = *(_DWORD *)(v3 + 128);
      uint64_t v35 = 0;
      uint64_t v36 = 0;
      uint64_t v37 = 0;
      CMTime v11 = *(void **)(v3 + 552);
      if (v11) {
        [v11 previewFrameDuration];
      }
      if (v9)
      {
        *(float *)&double v8 = (float)v10 / (float)v9;
        [a2 setTargetFrameRate:v8];
      }
      memset(&v34, 0, sizeof(v34));
      CMSampleBufferGetPresentationTimeStamp(&v34, (CMSampleBufferRef)objc_msgSend((id)objc_msgSend(*(id *)(v3 + 368), "objectAtIndexedSubscript:", 0), "firstObject"));
      memset(&v33, 0, sizeof(v33));
      CMSampleBufferGetPresentationTimeStamp(&v33, (CMSampleBufferRef)objc_msgSend((id)objc_msgSend(*(id *)(v3 + 368), "objectAtIndexedSubscript:", 0), "lastObject"));
      memset(&v32, 0, sizeof(v32));
      if (-[BWIrisStagingNode _emittingInputsCount](v3) == 1) {
        CMTime v32 = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F8];
      }
      else {
        CMSampleBufferGetPresentationTimeStamp(&v32, (CMSampleBufferRef)objc_msgSend((id)objc_msgSend(*(id *)(v3 + 368), "objectAtIndexedSubscript:", 1), "firstObject"));
      }
      memset(&v31, 0, sizeof(v31));
      if (-[BWIrisStagingNode _emittingInputsCount](v3) == 1) {
        CMTime v31 = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F8];
      }
      else {
        CMSampleBufferGetPresentationTimeStamp(&v31, (CMSampleBufferRef)objc_msgSend((id)objc_msgSend(*(id *)(v3 + 368), "objectAtIndexedSubscript:", 1), "lastObject"));
      }
      if (a2) {
        [a2 stillImageCaptureTime];
      }
      else {
        memset(&lhs, 0, sizeof(lhs));
      }
      CMTime rhs = v34;
      CMTimeSubtract(&v30, &lhs, &rhs);
      CMTime v28 = v30;
      [a2 setStillTimeOffsetToVideoPrerollStartTime:&v28];
      if (a2) {
        [a2 stillImageCaptureTime];
      }
      else {
        memset(&v26, 0, sizeof(v26));
      }
      CMTime rhs = v33;
      CMTimeSubtract(&v27, &v26, &rhs);
      CMTime v25 = v27;
      [a2 setStillTimeOffsetToVideoPrerollStopTime:&v25];
      if (a2) {
        [a2 stillImageCaptureTime];
      }
      else {
        memset(&v23, 0, sizeof(v23));
      }
      CMTime rhs = v32;
      CMTimeSubtract(&v24, &v23, &rhs);
      CMTime v22 = v24;
      [a2 setStillTimeOffsetToAudioPrerollStartTime:&v22];
      if (a2) {
        [a2 stillImageCaptureTime];
      }
      else {
        memset(&v20, 0, sizeof(v20));
      }
      CMTime rhs = v31;
      CMTimeSubtract(&v21, &v20, &rhs);
      CMTime v19 = v21;
      double result = [a2 setStillTimeOffsetToAudioPrerollStopTime:&v19];
      if (*(void *)(v3 + 768))
      {
        if (!*(void *)(v3 + 776) && !*(unsigned char *)(v3 + 765))
        {
          double result = [a2 requiresSubjectRelightingCalculation];
          if (result)
          {
            *(unsigned char *)(v3 + 765) = 1;
            uint64_t v12 = (void *)[*(id *)(v3 + 368) objectAtIndexedSubscript:0];
            memset(&v18, 0, sizeof(v18));
            -[BWIrisStagingNode _hostPTSForSampleBuffer:]((void *)[v12 lastObject], (CMTime *)v3, (uint64_t)&v18);
            memset(&v17, 0, sizeof(v17));
            if (a2)
            {
              [a2 stillImageCaptureHostTime];
              int32_t timescale = v17.timescale;
            }
            else
            {
              int32_t timescale = 0;
            }
            memset(&v16, 0, sizeof(v16));
            CMTimeMake(&v16, timescale / 1000, timescale);
            CMTime rhs = v17;
            CMTime v38 = v16;
            CMTimeSubtract(&time2, &rhs, &v38);
            CMTime rhs = v18;
            double result = CMTimeCompare(&rhs, &time2);
            if ((int)result >= 1)
            {
              CMTime rhs = v17;
              CMTime v38 = v16;
              double result = -[BWIrisStagingNode _indexOfBufferBeforeOrEqualToHostPTS:inputIndex:tolerance:](v3, &rhs, 0, &v38);
              if (result != 0x7FFFFFFFFFFFFFFFLL)
              {
                double result = (uint64_t)(id)objc_msgSend(*(id *)(v3 + 768), "startCalculationWithJPEGSampleBuffer:stillImageRequestSettings:stillImageCaptureSettings:", objc_msgSend(v12, "objectAtIndexedSubscript:", result), objc_msgSend(a2, "stillImageRequestSettings"), objc_msgSend(a2, "stillImageCaptureSettings"));
                *(void *)(v3 + 776) = result;
              }
            }
            if (!*(void *)(v3 + 776))
            {
              if (dword_1EB4C5070)
              {
                os_log_and_send_and_compose_flags_and_os_log_CMTime type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
                return fig_log_call_emit_and_clean_up_after_send_and_compose();
              }
            }
          }
        }
      }
    }
  }
  return result;
}

- (void)closeValve
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  pthread_mutex_lock(*(pthread_mutex_t **)&self->_emittedIrisRequestCount);
  if (LOBYTE(self->_droppedFramePTSs))
  {
    if (dword_1EB4C5070)
    {
      unsigned int v26 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    overallVideoFrameReceptionStats = self->_overallVideoFrameReceptionStats;
    if (overallVideoFrameReceptionStats)
    {
      [(BWStats *)overallVideoFrameReceptionStats average];
      double v7 = v6;
      [(BWStats *)self->_overallVideoFrameReceptionStats multiplier];
      if (v8 > 0.0)
      {
        [(BWStats *)self->_overallVideoFrameReceptionStats multiplier];
        double v7 = v7 / v9;
      }
      if (dword_1EB4C5070)
      {
        unsigned int v26 = 0;
        os_log_type_t type = OS_LOG_TYPE_DEFAULT;
        int v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        unsigned int v11 = v26;
        if (os_log_type_enabled(v10, type)) {
          unsigned int v12 = v11;
        }
        else {
          unsigned int v12 = v11 & 0xFFFFFFFE;
        }
        if (v12)
        {
          id v13 = [(BWStats *)self->_overallVideoFrameReceptionStats description];
          double v14 = 0.0;
          int v27 = 136315906;
          CMTime v28 = "-[BWIrisStagingNode closeValve]";
          __int16 v29 = 2048;
          CMTime v30 = self;
          __int16 v31 = 2112;
          id v32 = v13;
          if (v7 > 0.0) {
            double v14 = 1.0 / v7;
          }
          __int16 v33 = 2048;
          double v34 = v14;
          LODWORD(v23) = 42;
          CMTime v22 = &v27;
          _os_log_send_and_compose_impl();
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }

      self->_overallVideoFrameReceptionStats = 0;
    }
    uint64_t v15 = -[BWIrisStagingNode _emittingInputsCount]((uint64_t)self);
    uint64_t v16 = MEMORY[0x1E4F1F9F8];
    if (v15)
    {
      uint64_t v17 = v15;
      uint64_t v18 = 0;
      uint64_t v19 = 0;
      long long v24 = *MEMORY[0x1E4F1F9F8];
      uint64_t v20 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
      do
      {
        -[NSMutableArray setObject:atIndexedSubscript:](self->_stagingQueues, "setObject:atIndexedSubscript:", objc_msgSend(MEMORY[0x1E4F1CA98], "null", v22, v23), v19);
        CMTime v21 = (char *)self->_stateMutex + v18;
        *(_OWORD *)CMTime v21 = v24;
        *((void *)v21 + 2) = v20;
        ++v19;
        v18 += 24;
      }
      while (v17 != v19);
    }
    LOBYTE(self->_droppedFramePTSs) = 0;
    *(_OWORD *)&self->_valveOpen = *(_OWORD *)v16;
    *(void *)&self->_valveDiscontinuitySearchLimit.int32_t timescale = *(void *)(v16 + 16);
    BYTE1(self->_droppedFramePTSs) = 0;
    BYTE2(self->_droppedFramePTSs) = 0;
    BYTE5(self->_limitedGMErrorLogger) = 0;

    self->_subjectRelightingCalculator = 0;
    [(BWIrisSequenceAdjuster *)self->_sequenceAdjusterBackingStore reset];
    self->_sequenceAdjusterBackingStore = 0;
    if ([self->_valveOpenerSettingsID count])
    {
      [*(id *)&self->_visMotionMetadataPreloadingMode stagingNode:self valveClosedWithPendingIrisRequests:self->_valveOpenerSettingsID];
      [self->_valveOpenerSettingsID removeAllObjects];
    }
    if (self->_flushAndSuspendPending) {
      -[BWIrisStagingNode _flushAndSuspendStaging]((uint64_t)self);
    }
  }
  else if (dword_1EB4C5070)
  {
    unsigned int v26 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    uint64_t v4 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  pthread_mutex_unlock(*(pthread_mutex_t **)&self->_emittedIrisRequestCount);
}

- (uint64_t)_flushAndSuspendStaging
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    FigSimpleMutexCheckIsLockedOnThisThread();
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    v2 = *(void **)(v1 + 368);
    uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v9;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v9 != v5) {
            objc_enumerationMutation(v2);
          }
          [*(id *)(*((void *)&v8 + 1) + 8 * i) removeAllObjects];
        }
        uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v4);
    }
    [*(id *)(v1 + 624) flush];
    [*(id *)(v1 + 632) flush];
    *(unsigned char *)(v1 + 192) = 1;
    uint64_t v7 = MEMORY[0x1E4F1F9F8];
    *(_OWORD *)(v1 + 196) = *MEMORY[0x1E4F1F9F8];
    *(void *)(v1 + 212) = *(void *)(v7 + 16);
    *(unsigned char *)(v1 + 193) = 0;
    return [*(id *)(v1 + 16) suspendResources];
  }
  return result;
}

- (BOOL)valveIsOpen
{
  return (BOOL)self->_droppedFramePTSs;
}

- (int)enqueueIrisRequest:(id)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  pthread_mutex_lock(*(pthread_mutex_t **)&self->_emittedIrisRequestCount);
  if (objc_msgSend((id)objc_msgSend(a3, "settings"), "settingsID") < self->_valveDiscontinuitySearchLimit.epoch)
  {
    if (dword_1EB4C5070)
    {
      unsigned int v44 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    int v7 = -16954;
    goto LABEL_11;
  }
  if (!LOBYTE(self->_droppedFramePTSs) || BYTE2(self->_droppedFramePTSs) || BYTE1(self->_droppedFramePTSs))
  {
    if (dword_1EB4C5070)
    {
      unsigned int v44 = 0;
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      double v6 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    int v7 = -16953;
    goto LABEL_11;
  }
  if (dword_1EB4C5070)
  {
    unsigned int v44 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    long long v9 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  int v42 = -[BWIrisStagingNode _momentCaptureMovieRecordingInProgress]((uint64_t)self);
  FigSimpleMutexCheckIsLockedOnThisThread();
  masterMovieURL = self->_masterMovieURL;
  long long v10 = (void *)[self->_valveOpenerSettingsID firstObject];
  uint64_t v11 = [v10 semanticStyle];
  unsigned int v12 = (void *)[a3 semanticStyle];
  uint64_t v13 = v12;
  if (v12 == (void *)v11) {
    int v14 = 0;
  }
  else {
    int v14 = [v12 isEqual:v11] ^ 1;
  }
  int v15 = objc_msgSend((id)objc_msgSend(v10, "settings", v38, v39), "smartStyleReversibilitySupported");
  int v16 = objc_msgSend((id)objc_msgSend(a3, "settings"), "smartStyleReversibilitySupported");
  if (BYTE3(self->_subjectRelightingResult)) {
    int v17 = v15 ^ v16;
  }
  else {
    int v17 = 0;
  }
  if (([a3 isMomentCaptureMovieRecording] & 1) != 0
    || v42 != [a3 isMomentCaptureMovieRecording]
    || [a3 spatialOverCaptureExpected] && !masterMovieURL)
  {
    if (!dword_1EB4C5070)
    {
LABEL_43:
      int v7 = -16957;
      goto LABEL_11;
    }
    unsigned int v44 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    uint64_t v18 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v19 = v44;
    if (os_log_type_enabled(v18, type)) {
      unsigned int v20 = v19;
    }
    else {
      unsigned int v20 = v19 & 0xFFFFFFFE;
    }
    if (v20)
    {
      uint64_t v40 = objc_msgSend((id)objc_msgSend(a3, "settings"), "settingsID");
      if ([a3 isMomentCaptureMovieRecording]) {
        int v21 = 84;
      }
      else {
        int v21 = 70;
      }
      if (v42) {
        int v22 = 84;
      }
      else {
        int v22 = 70;
      }
      int v23 = [a3 spatialOverCaptureExpected];
      int v45 = 136316674;
      uint64_t v46 = "-[BWIrisStagingNode enqueueIrisRequest:]";
      if (v23) {
        int v24 = 84;
      }
      else {
        int v24 = 70;
      }
      __int16 v47 = 2048;
      if (masterMovieURL) {
        int v25 = 84;
      }
      else {
        int v25 = 70;
      }
      long long v48 = self;
      __int16 v49 = 2048;
      uint64_t v50 = v40;
      __int16 v51 = 1024;
      int v52 = v21;
      __int16 v53 = 1024;
      int v54 = v22;
      __int16 v55 = 1024;
      int v56 = v24;
      __int16 v57 = 1024;
      int v58 = v25;
      _os_log_send_and_compose_impl();
    }
LABEL_42:
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    goto LABEL_43;
  }
  if (!v14)
  {
    if (!v17)
    {
      -[BWIrisStagingNode _enqueueIrisRequest:]((uint64_t)self, a3);
      int v7 = 0;
      goto LABEL_11;
    }
    if (!dword_1EB4C5070) {
      goto LABEL_43;
    }
    unsigned int v44 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    id v32 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v33 = v44;
    if (os_log_type_enabled(v32, type)) {
      unsigned int v34 = v33;
    }
    else {
      unsigned int v34 = v33 & 0xFFFFFFFE;
    }
    if (v34)
    {
      uint64_t v35 = objc_msgSend((id)objc_msgSend(a3, "settings"), "settingsID");
      int v45 = 136316418;
      uint64_t v46 = "-[BWIrisStagingNode enqueueIrisRequest:]";
      if (v16) {
        int v36 = 84;
      }
      else {
        int v36 = 70;
      }
      __int16 v47 = 2048;
      long long v48 = self;
      if (v15) {
        int v37 = 84;
      }
      else {
        int v37 = 70;
      }
      __int16 v49 = 2048;
      uint64_t v50 = v35;
      __int16 v51 = 1024;
      int v52 = v36;
      __int16 v53 = 1024;
      int v54 = v37;
      __int16 v55 = 1024;
      int v56 = 70;
      _os_log_send_and_compose_impl();
    }
    goto LABEL_42;
  }
  if (dword_1EB4C5070)
  {
    unsigned int v44 = 0;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    unsigned int v26 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    unsigned int v27 = v44;
    if (os_log_type_enabled(v26, type)) {
      unsigned int v28 = v27;
    }
    else {
      unsigned int v28 = v27 & 0xFFFFFFFE;
    }
    if (v28)
    {
      uint64_t v29 = objc_msgSend((id)objc_msgSend(a3, "settings"), "settingsID");
      int v45 = 136316418;
      uint64_t v46 = "-[BWIrisStagingNode enqueueIrisRequest:]";
      if (v13) {
        int v30 = 84;
      }
      else {
        int v30 = 70;
      }
      __int16 v47 = 2048;
      long long v48 = self;
      if (v11) {
        int v31 = 84;
      }
      else {
        int v31 = 70;
      }
      __int16 v49 = 2048;
      uint64_t v50 = v29;
      __int16 v51 = 1024;
      int v52 = v30;
      __int16 v53 = 1024;
      int v54 = v31;
      __int16 v55 = 1024;
      int v56 = 84;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  int v7 = -15543;
LABEL_11:
  pthread_mutex_unlock(*(pthread_mutex_t **)&self->_emittedIrisRequestCount);
  return v7;
}

- (uint64_t)_momentCaptureMovieRecordingInProgress
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    FigSimpleMutexCheckIsLockedOnThisThread();
    long long v8 = 0u;
    long long v9 = 0u;
    long long v6 = 0u;
    long long v7 = 0u;
    v2 = *(void **)(v1 + 432);
    double result = [v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
    if (result)
    {
      uint64_t v3 = result;
      uint64_t v4 = *(void *)v7;
      while (2)
      {
        uint64_t v5 = 0;
        do
        {
          if (*(void *)v7 != v4) {
            objc_enumerationMutation(v2);
          }
          if ([*(id *)(*((void *)&v6 + 1) + 8 * v5) isMomentCaptureMovieRecording]) {
            return 1;
          }
          ++v5;
        }
        while (v3 != v5);
        double result = [v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
        uint64_t v3 = result;
        if (result) {
          continue;
        }
        break;
      }
    }
  }
  return result;
}

- (void)prepareToFinishAllEnqueuedIrisRequestsWithEndTime:(id *)a3
{
  pthread_mutex_lock(*(pthread_mutex_t **)&self->_emittedIrisRequestCount);
  CMTime time1 = *(CMTime *)a3;
  $95D729B680665BEAEFA1D6FCA8238556 endIrisMovieCaptureTime = self->_endIrisMovieCaptureTime;
  if (CMTimeCompare(&time1, (CMTime *)&endIrisMovieCaptureTime) < 0)
  {
    long long v5 = *(_OWORD *)&a3->var0;
    self->_endIrisMovieCaptureTime.CMTimeEpoch epoch = a3->var3;
    *(_OWORD *)&self->_endIrisMovieCaptureTime.unsigned int value = v5;
  }
  BYTE1(self->_droppedFramePTSs) = 1;
  pthread_mutex_unlock(*(pthread_mutex_t **)&self->_emittedIrisRequestCount);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)beginIrisMovieCaptureTime
{
  retstr->var0 = 0;
  *(void *)&retstr->var1 = 0;
  retstr->int64_t var3 = 0;
  pthread_mutex_lock(*(pthread_mutex_t **)&self->_emittedIrisRequestCount);
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = self->_beginIrisMovieCaptureTime;
  long long v5 = *(pthread_mutex_t **)&self->_emittedIrisRequestCount;
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)pthread_mutex_unlock(v5);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)endIrisMovieCaptureTime
{
  retstr->var0 = 0;
  *(void *)&retstr->var1 = 0;
  retstr->int64_t var3 = 0;
  pthread_mutex_lock(*(pthread_mutex_t **)&self->_emittedIrisRequestCount);
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = self->_endIrisMovieCaptureTime;
  long long v5 = *(pthread_mutex_t **)&self->_emittedIrisRequestCount;
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)pthread_mutex_unlock(v5);
}

- (void)setEndIrisMovieCaptureTime:(id *)a3
{
  pthread_mutex_lock(*(pthread_mutex_t **)&self->_emittedIrisRequestCount);
  int64_t var3 = a3->var3;
  *(_OWORD *)&self->_endIrisMovieCaptureTime.unsigned int value = *(_OWORD *)&a3->var0;
  self->_endIrisMovieCaptureTime.CMTimeEpoch epoch = var3;
  self->_beginIrisMovieCaptureTime = *($95D729B680665BEAEFA1D6FCA8238556 *)*(void *)&MEMORY[0x1E4F1F9F8];
  -[BWIrisStagingNode _suspendStaging]((uint64_t)self);
  long long v6 = *(pthread_mutex_t **)&self->_emittedIrisRequestCount;
  pthread_mutex_unlock(v6);
}

- (uint64_t)_suspendStaging
{
  if (result)
  {
    uint64_t v1 = (unsigned char *)result;
    double result = FigSimpleMutexCheckIsLockedOnThisThread();
    if (!v1[192])
    {
      if (v1[392])
      {
        v1[193] = 1;
      }
      else
      {
        return -[BWIrisStagingNode _flushAndSuspendStaging]((uint64_t)v1);
      }
    }
  }
  return result;
}

- (void)setMomentCaptureMovieRecordingMasterEndTime:(id *)a3 forRequestWithSettingsID:(int64_t)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  pthread_mutex_lock(*(pthread_mutex_t **)&self->_emittedIrisRequestCount);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  valveOpenerSettingsID = (void *)self->_valveOpenerSettingsID;
  uint64_t v8 = [valveOpenerSettingsID countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(valveOpenerSettingsID);
        }
        unsigned int v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v12, "settings"), "settingsID") == a4)
        {
          if (dword_1EB4C5070)
          {
            int v19 = 0;
            os_log_type_t type = OS_LOG_TYPE_DEFAULT;
            os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
          }
          long long v16 = *(_OWORD *)&a3->var0;
          int64_t var3 = a3->var3;
          objc_msgSend(v12, "setMomentCaptureMovieRecordingMasterEndTime:", &v16, v14, v15);
          goto LABEL_13;
        }
      }
      uint64_t v9 = [valveOpenerSettingsID countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_13:
  pthread_mutex_unlock(*(pthread_mutex_t **)&self->_emittedIrisRequestCount);
}

- (BOOL)waitUntilReadyToReceiveRequestsWithTimeout:(float)a3
{
  pthread_mutex_lock(*(pthread_mutex_t **)&self->_emittedIrisRequestCount);
  if (BYTE2(self->_emissionMap))
  {
    pthread_mutex_unlock(*(pthread_mutex_t **)&self->_emittedIrisRequestCount);
    return 1;
  }
  else
  {
    long long v7 = *(void **)&self->_haveSeenFirstAudioSampleBuffer;
    if (v7)
    {
      uint64_t v8 = v7;
    }
    else
    {
      dispatch_group_t v9 = dispatch_group_create();
      *(void *)&self->_haveSeenFirstAudioSampleBuffer = v9;
      uint64_t v8 = v9;
      dispatch_group_enter(v8);
    }
    pthread_mutex_unlock(*(pthread_mutex_t **)&self->_emittedIrisRequestCount);
    if (v8)
    {
      mach_absolute_time();
      dispatch_time_t v10 = dispatch_time(0, (uint64_t)(float)(a3 * 1000000000.0));
      BOOL v5 = dispatch_group_wait(v8, v10) == 0;
      mach_absolute_time();

      if (dword_1EB4C5070)
      {
        os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
    }
    else
    {
      return 0;
    }
  }
  return v5;
}

- (NSURL)temporaryMovieDirectoryURL
{
  return (NSURL *)self->_masterMovieStartPTS.epoch;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)targetFrameDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[5];
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)bufferingTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[4];
  return self;
}

- (OpaqueCMClock)masterClock
{
  return (OpaqueCMClock *)self->_firstEmittedPTSArray;
}

- ($2ACC23B9A21F50F5CC728381CA870116)vitalityScoringSmartCameraPipelineVersion
{
  return ($2ACC23B9A21F50F5CC728381CA870116)(*(unsigned int *)((char *)&self->_masterClock + 6) | ((unint64_t)HIWORD(self->_trimMethod) << 32));
}

- (int)intermediateJPEGDownstreamRetainedBufferCount
{
  return LODWORD(self->_intermediateJPEGCompressionQuality);
}

- (BOOL)applyPreviewShift
{
  return (BOOL)self->_subjectRelightingResult;
}

- (uint64_t)_indexOfBufferBeforeOrEqualToHostPTS:(uint64_t)a3 inputIndex:(CMTime *)a4 tolerance:
{
  if (!a1) {
    return 0;
  }
  long long v7 = objc_msgSend(*(id *)(a1 + 368), "objectAtIndexedSubscript:");
  uint64_t v8 = [v7 count];
  if (!v8) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  unint64_t v9 = v8;
  unint64_t v10 = 0;
  while (1)
  {
    memset(&v18, 0, sizeof(v18));
    -[BWIrisStagingNode _hostPTSForSampleBuffer:]((void *)[v7 objectAtIndexedSubscript:v10], (CMTime *)a1, (uint64_t)&v18);
    memset(&v17, 0, sizeof(v17));
    CMTime lhs = v18;
    CMTime rhs = *a2;
    CMTimeSubtract(&v17, &lhs, &rhs);
    CMTime lhs = v17;
    CMTimeAbsoluteValue(&time2, &lhs);
    CMTime lhs = *a4;
    if ((CMTimeCompare(&lhs, &time2) & 0x80000000) == 0) {
      break;
    }
    CMTime lhs = v18;
    CMTime rhs = *a2;
    int32_t v11 = CMTimeCompare(&lhs, &rhs);
    if (v11 < 1) {
      ++v10;
    }
    if (v10 >= v9 || v11 >= 1)
    {
      unint64_t v12 = v10 - 1;
      if (!v10) {
        unint64_t v12 = 0;
      }
      if (v11 <= 0) {
        return 0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        return v12;
      }
    }
  }
  return v10;
}

- (CMTime)_maxPTSForIrisRequest:(uint64_t)a3@<X8>
{
  if (result)
  {
    BOOL v5 = result;
    if ([a2 isMomentCaptureMovieRecording])
    {
      if (a2)
      {
        [a2 stillImageCaptureTime];
        [a2 momentCaptureMovieRecordingMasterEndTime];
      }
      else
      {
        memset(&time1, 0, sizeof(time1));
        memset(&time2, 0, sizeof(time2));
      }
      return CMTimeMaximum((CMTime *)a3, &time1, &time2);
    }
    else
    {
      if (a2) {
        [a2 stillImageCaptureTime];
      }
      else {
        memset(&lhs, 0, sizeof(lhs));
      }
      CMTime v6 = v5[4];
      return CMTimeAdd((CMTime *)a3, &lhs, &v6);
    }
  }
  else
  {
    *(void *)a3 = 0;
    *(void *)(a3 + 8) = 0;
    *(void *)(a3 + 16) = 0;
  }
  return result;
}

- (void)_emitIrisMovieRequestWithInfo:(void *)a1
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    CMAttachmentBearerRef target = 0;
    long long v4 = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 48);
    *(_OWORD *)&sampleTimingArray.presentationTimeStamp.int32_t timescale = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 32);
    *(_OWORD *)&sampleTimingArray.decodeTimeStamp.unsigned int value = v4;
    CMTimeEpoch v5 = *(void *)(MEMORY[0x1E4F1FA70] + 64);
    long long v6 = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 16);
    *(_OWORD *)&sampleTimingArray.duration.unsigned int value = *MEMORY[0x1E4F1FA70];
    *(_OWORD *)&sampleTimingArray.duration.CMTimeEpoch epoch = v6;
    *(_OWORD *)&sampleTimingArray.presentationTimeStamp.unsigned int value = *MEMORY[0x1E4F1FA08];
    CMTimeEpoch v7 = *(void *)(MEMORY[0x1E4F1FA08] + 16);
    sampleTimingArray.decodeTimeStamp.CMTimeEpoch epoch = v5;
    sampleTimingArray.presentationTimeStamp.CMTimeEpoch epoch = v7;
    if (!CMSampleBufferCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 1u, 0, 0, 0, 0, 1, &sampleTimingArray, 0, 0, (CMSampleBufferRef *)&target))
    {
      if (dword_1EB4C5070)
      {
        os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      CMSetAttachment(target, @"IrisMovieRequest", a2, 1u);
      unint64_t v9 = (void *)[a1 output];
      [v9 emitSampleBuffer:target];
      if (target) {
        CFRelease(target);
      }
    }
  }
}

- (uint64_t)_emitBuffersThroughPTS:(uint64_t)result
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v3 = result;
    FigSimpleMutexCheckIsLockedOnThisThread();
    FigSimpleMutexCheckIsLockedOnThisThread();
    double result = objc_msgSend((id)objc_msgSend((id)v3, "inputs"), "count");
    uint64_t v4 = *(void *)(v3 + 536) == result - 1 ? result - 1 : result;
    if (v4)
    {
      uint64_t v25 = a2;
      v23[1] = v23;
      unsigned int v28 = (void *)((char *)v23 - ((8 * v4 + 15) & 0xFFFFFFFFFFFFFFF0));
      unsigned int v27 = v28;
      CMTimeEpoch v5 = (char *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
      for (uint64_t i = 0; i != v4; ++i)
      {
        CMTimeEpoch v7 = (void *)[*(id *)(v3 + 368) objectAtIndexedSubscript:i];
        uint64_t v8 = [*(id *)(v3 + 376) objectAtIndexedSubscript:i];
        if (v8 == [MEMORY[0x1E4F1CA98] null])
        {
          unint64_t v10 = 0;
        }
        else
        {
          uint64_t v9 = objc_msgSend(v7, "indexOfObjectIdenticalTo:", objc_msgSend(*(id *)(v3 + 376), "objectAtIndexedSubscript:", i));
          if (v9 == 0x7FFFFFFFFFFFFFFFLL) {
            unint64_t v10 = 0;
          }
          else {
            unint64_t v10 = v9 + 1;
          }
        }
        unint64_t v11 = [v7 count];
        v28[i] = v11;
        v27[i] = v10;
        v5[i] = v10 >= v11;
      }
      id v24 = (id)[*(id *)(v3 + 368) objectAtIndexedSubscript:0];
      uint64_t v12 = &OBJC_IVAR___FigCaptureSessionParsedConfiguration__parsedDepthDataSinkConfigurations;
      do
      {
        uint64_t v13 = v25;
        CMTime v33 = *v25;
        if (!*v5 && (unint64_t)(*v27 + 1) < *v28)
        {
          memset(&v32, 0, sizeof(v32));
          CMSampleBufferGetPresentationTimeStamp(&v32, (CMSampleBufferRef)objc_msgSend(v24, "objectAtIndexedSubscript:"));
          CMTime time1 = v32;
          CMTime time2 = *v13;
          if (CMTimeCompare(&time1, &time2) <= 0)
          {
            CMTimeMake(&rhs, v32.timescale / 1000, v32.timescale);
            CMTime time1 = v32;
            CMTimeSubtract(&v33, &time1, &rhs);
          }
        }
        CMTime v32 = v33;
        CMTime time1 = *v13;
        int32_t v14 = CMTimeCompare(&v32, &time1);
        uint64_t v15 = 0;
        int v26 = 0;
        do
        {
          uint64_t v16 = *(void *)(*(void *)(v3 + v12[104]) + 8 * v15);
          double result = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)v3, "inputs"), "objectAtIndexedSubscript:", v16), "mediaType");
          if (result == 1936684398 && !*(unsigned char *)(v3 + 395))
          {
            double result = [*(id *)(v3 + 560) readyToReleaseAudio];
            char v17 = result;
          }
          else
          {
            char v17 = 0;
          }
          if (!v5[v16])
          {
            CMTime v18 = v12;
            int v19 = &v27[v16];
            unint64_t v20 = v28[v16];
            CMTime v32 = v33;
            double result = -[BWIrisStagingNode _emitBuffersThroughPTS:forInputIndex:inOutBufferIndex:bufferCount:](v3, &v32, v16, v19, v20);
            if (*(unsigned char *)(v3 + 395))
            {
              char v21 = 1;
            }
            else if ((int)result > 0)
            {
              char v21 = v17;
            }
            else
            {
              char v21 = 0;
            }
            *(unsigned char *)(v3 + 395) = v21;
            if (v14 && result)
            {
              BOOL v22 = *v19 == v20;
              v5[v16] = v22;
              uint64_t v12 = v18;
              if (!v22) {
                ++v26;
              }
            }
            else
            {
              v5[v16] = 1;
              uint64_t v12 = v18;
            }
          }
          ++v15;
        }
        while (v4 != v15);
      }
      while (v26 > 0);
    }
  }
  return result;
}

- (uint64_t)_emitBuffersThroughPTS:(uint64_t)a3 forInputIndex:(unint64_t *)a4 inOutBufferIndex:(unint64_t)a5 bufferCount:
{
  if (!a1) {
    return 0;
  }
  unint64_t v20 = objc_msgSend(*(id *)(a1 + 368), "objectAtIndexedSubscript:");
  unint64_t v10 = *a4;
  FigSimpleMutexCheckIsLockedOnThisThread();
  if (v10 >= a5)
  {
    uint64_t v11 = 0;
  }
  else
  {
    int v19 = a4;
    uint64_t v11 = 0;
    unsigned int v18 = a5 - v10;
    while (1)
    {
      uint64_t v12 = (opaqueCMSampleBuffer *)[v20 objectAtIndexedSubscript:v10];
      memset(&v24, 0, sizeof(v24));
      CMSampleBufferGetPresentationTimeStamp(&v24, v12);
      CMTime time1 = *a2;
      CMTime time2 = v24;
      if (CMTimeCompare(&time1, &time2) < 0) {
        break;
      }
      if (!a3 && [*(id *)(a1 + 384) count])
      {
        while ([*(id *)(a1 + 384) count])
        {
          CFDictionaryRef v13 = (const __CFDictionary *)[*(id *)(a1 + 384) objectAtIndexedSubscript:0];
          memset(&time1, 0, sizeof(time1));
          CMTimeMakeFromDictionary(&time1, v13);
          int32_t v14 = *(long long **)(a1 + 464);
          CMTime time2 = time1;
          long long v15 = *v14;
          v21.CMTimeEpoch epoch = *((void *)v14 + 2);
          *(_OWORD *)&v21.unsigned int value = v15;
          if (CMTimeCompare(&time2, &v21) >= 1)
          {
            CMTime time2 = time1;
            CMTime v21 = v24;
            if (CMTimeCompare(&time2, &v21) > 0) {
              break;
            }
            CMTime time2 = time1;
            id v16 = +[BWDroppedSample newDroppedSampleWithReason:0x1EFA67EA0 pts:&time2];
            [*(id *)(a1 + 16) emitDroppedSample:v16];
          }
          [*(id *)(a1 + 384) removeObject:v13];
        }
      }
      -[BWIrisStagingNode _emitSampleBuffer:forInputIndex:]((CMTime *)a1, v12, a3);
      uint64_t v11 = (v11 + 1);
      if (++v10 == a5)
      {
        uint64_t v11 = v18;
        unint64_t v10 = a5;
        break;
      }
    }
    a4 = v19;
  }
  *a4 = v10;
  return v11;
}

uint64_t __53__BWIrisStagingNode__emitSampleBuffer_forInputIndex___block_invoke(uint64_t a1, void *a2, uint64_t a3, BOOL *a4)
{
  uint64_t result = [a2 stillImageEncoderKeyFrameEmitted];
  if ((result & 1) == 0)
  {
    memset(&v13, 0, sizeof(v13));
    if (a2) {
      [a2 stillImageCaptureTime];
    }
    uint64_t result = *(void *)(*(void *)(a1 + 32) + 560);
    if (result)
    {
      CMTime lhs = v13;
      uint64_t result = [(id)result adjustedTimeForStillImageTime:&lhs];
      CMTime v13 = v12;
    }
    if (v13.flags)
    {
      memset(&v12, 0, sizeof(v12));
      uint64_t result = (uint64_t)CMTimeMake(&v12, v13.timescale / 1000, v13.timescale);
      if ((~v13.flags & 0x11) != 0)
      {
        uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
        CMTime lhs = v13;
        CMTime v9 = v12;
        CMTimeSubtract(&time2, &lhs, &v9);
        CMTime lhs = *(CMTime *)(v8 + 32);
        uint64_t result = CMTimeCompare(&lhs, &time2);
        *a4 = (int)result < 0;
        if ((result & 0x80000000) == 0)
        {
          CMSetAttachment(*(CMAttachmentBearerRef *)(a1 + 48), (CFStringRef)*MEMORY[0x1E4F1F288], (CFTypeRef)*MEMORY[0x1E4F1CFD0], 1u);
          return [a2 setStillImageEncoderKeyFrameEmitted:1];
        }
      }
      else
      {
        *a4 = 1;
      }
    }
  }
  return result;
}

- (unint64_t)_indexOfBufferBeforeOrEqualToPTS:(id *)a3 inputIndex:(unint64_t)a4 applyFrameDropsMitigation:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v8 = (void *)[(NSURL *)self->_spatialOverCaptureMasterMovieURL objectAtIndexedSubscript:a4];
  uint64_t v9 = [v8 count];
  if (!v9) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  unint64_t v10 = v9;
  unint64_t v11 = 0;
  do
  {
    memset(&v21, 0, sizeof(v21));
    CMSampleBufferGetPresentationTimeStamp(&v21, (CMSampleBufferRef)[v8 objectAtIndexedSubscript:v11]);
    CMTime time1 = v21;
    CMTime time2 = (CMTime)*a3;
    int32_t v12 = CMTimeCompare(&time1, &time2);
    if (v12 < 1) {
      ++v11;
    }
  }
  while (v11 < v10 && v12 < 1);
  if (v12 < 1) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v11) {
    unint64_t result = v11 - 1;
  }
  else {
    unint64_t result = 0;
  }
  if (v11 && v5)
  {
    int32_t v14 = (opaqueCMSampleBuffer *)[v8 objectAtIndexedSubscript:v11 - 1];
    memset(&v21, 0, sizeof(v21));
    CMSampleBufferGetPresentationTimeStamp(&v21, v14);
    long long v15 = (opaqueCMSampleBuffer *)[v8 objectAtIndexedSubscript:v11];
    memset(&time1, 0, sizeof(time1));
    CMSampleBufferGetPresentationTimeStamp(&time1, v15);
    CMTime time2 = time1;
    CMTime rhs = v21;
    CMTimeSubtract(&v18, &time2, &rhs);
    CMTime time2 = (CMTime)self->_targetFrameDuration;
    CMTimeMultiply(&v16, &time2, 3);
    if (CMTimeCompare(&v18, &v16) <= 0) {
      return v11 - 1;
    }
    else {
      return v11;
    }
  }
  return result;
}

- (uint64_t)_processQueuedVideoFrames
{
  uint64_t v97 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    v2 = (void *)[*(id *)(result + 368) objectAtIndexedSubscript:0];
    unint64_t v3 = [v2 count];
    unint64_t v4 = v3;
    unint64_t v53 = v3;
    int v54 = v2;
    if (*(void *)(v1 + 560) && (*(unsigned char *)(v1 + 412) & 1) != 0 && v3 >= 2)
    {
      memset(&v85, 0, sizeof(v85));
      CMSampleBufferGetPresentationTimeStamp(&v85, (CMSampleBufferRef)[v2 objectAtIndexedSubscript:v3 - 1]);
      memset(&v84, 0, sizeof(v84));
      CMSampleBufferGetPresentationTimeStamp(&v84, (CMSampleBufferRef)[v2 objectAtIndexedSubscript:v4 - 2]);
      BOOL v5 = *(void **)(v1 + 552);
      time[0] = v85;
      long long time2 = *(_OWORD *)&v84.value;
      *(void *)&long long time2_16 = v84.epoch;
      int v6 = [v5 discontinuityExistsBetweenCurrentPTS:time previousPTS:&time2];
      CMTimeEpoch v7 = (long long *)(v1 + 400);
      if (v6)
      {
        uint64_t v8 = MEMORY[0x1E4F1F9F8];
        *CMTimeEpoch v7 = *MEMORY[0x1E4F1F9F8];
        *(void *)(v1 + 416) = *(void *)(v8 + 16);
        if (dword_1EB4C5070)
        {
          LODWORD(v78.value) = 0;
          LOBYTE(type.value) = 0;
          os_log_and_send_and_compose_flags_and_os_log_CMTime type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
          unint64_t v4 = v53;
        }
      }
      else
      {
        time[0] = v85;
        long long time2 = *v7;
        *(void *)&long long time2_16 = *(void *)(v1 + 416);
        if ((CMTimeCompare(time, (CMTime *)&time2) & 0x80000000) == 0)
        {
          if (dword_1EB4C5070)
          {
            LODWORD(v78.value) = 0;
            LOBYTE(type.value) = 0;
            unint64_t v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
            unint64_t v4 = v53;
          }
          uint64_t v11 = MEMORY[0x1E4F1F9F8];
          *(_OWORD *)(v1 + 400) = *MEMORY[0x1E4F1F9F8];
          *(void *)(v1 + 416) = *(void *)(v11 + 16);
        }
      }
    }
    long long v82 = 0u;
    long long v83 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    int32_t v12 = objc_msgSend(v2, "reverseObjectEnumerator", v49, v50);
    unint64_t result = [v12 countByEnumeratingWithState:&v80 objects:v93 count:16];
    if (result)
    {
      uint64_t v13 = result;
      uint64_t v14 = *(void *)v81;
      while (2)
      {
        uint64_t v15 = 0;
        unint64_t v16 = v4 - v13;
        do
        {
          if (*(void *)v81 != v14) {
            objc_enumerationMutation(v12);
          }
          char v17 = *(opaqueCMSampleBuffer **)(*((void *)&v80 + 1) + 8 * v15);
          memset(time, 0, 24);
          CMSampleBufferGetPresentationTimeStamp(time, v17);
          long long time2 = *(_OWORD *)&time[0].value;
          *(void *)&long long time2_16 = time[0].epoch;
          CMTime v85 = *(CMTime *)(v1 + 296);
          unint64_t result = CMTimeCompare((CMTime *)&time2, &v85);
          if ((int)result < 1)
          {
            unint64_t v18 = v4 - v15;
            goto LABEL_22;
          }
          ++v15;
        }
        while (v13 != v15);
        unint64_t result = [v12 countByEnumeratingWithState:&v80 objects:v93 count:16];
        uint64_t v13 = result;
        unint64_t v4 = v16;
        if (result) {
          continue;
        }
        break;
      }
      unint64_t v18 = 0;
LABEL_22:
      unint64_t v4 = v53;
      v2 = v54;
    }
    else
    {
      unint64_t v18 = 0;
    }
    if (v18 < v4)
    {
      int v19 = &OBJC_IVAR___FigCaptureSessionParsedConfiguration__parsedDepthDataSinkConfigurations;
      while (1)
      {
        unint64_t v20 = (opaqueCMSampleBuffer *)[v2 objectAtIndexedSubscript:v18];
        memset(&v85, 0, sizeof(v85));
        CMSampleBufferGetPresentationTimeStamp(&v85, v20);
        int v21 = -[BWIrisStagingNode _emissionStatusForSampleBuffer:](v1, v20);
        switch(v21)
        {
          case 1:
          case 2:
            int v22 = v21;
            long long v23 = (_OWORD *)(v1 + 272);
            if ((*(unsigned char *)(v1 + 284) & 1) == 0)
            {
              *long long v23 = *(_OWORD *)&v85.value;
              *(void *)(v1 + 288) = v85.epoch;
            }
            unint64_t v55 = v18;
            uint64_t v96 = *(void *)(MEMORY[0x1E4F1FA70] + 64);
            long long v24 = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 48);
            *(_OWORD *)&time[1].int32_t timescale = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 32);
            long long v95 = v24;
            long long v25 = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 16);
            *(_OWORD *)&time[0].unsigned int value = *MEMORY[0x1E4F1FA70];
            *(_OWORD *)&time[0].CMTimeEpoch epoch = v25;
            time[1].CMTimeEpoch epoch = *(void *)(v1 + 288);
            *(_OWORD *)&time[1].unsigned int value = *v23;
            CMTimeMake(&rhs, 5, 1000);
            long long time2 = *(_OWORD *)(v1 + 120);
            *(void *)&long long time2_16 = *(void *)(v1 + 136);
            CMTimeSubtract(time, (CMTime *)&time2, &rhs);
            memset(&v84, 0, sizeof(v84));
            long long time2 = *(_OWORD *)&time[1].value;
            *(void *)&long long time2_16 = time[1].epoch;
            CMTime v78 = time[0];
            CMTimeAdd(&v84, (CMTime *)&time2, &v78);
            if (*(_DWORD *)(v1 + 480) == 2)
            {
              long long v76 = 0uLL;
              long long v77 = 0uLL;
              long long v74 = 0uLL;
              long long v75 = 0uLL;
              int v26 = *(void **)(v1 + 432);
              uint64_t v27 = [v26 countByEnumeratingWithState:&v74 objects:v92 count:16];
              if (!v27)
              {
LABEL_52:
                CMTime v78 = v85;
                long long v89 = *(_OWORD *)&time[1].timescale;
                long long v90 = v95;
                uint64_t v91 = v96;
                long long time2 = *(_OWORD *)&time[0].value;
                long long time2_16 = *(_OWORD *)&time[0].epoch;
                -[BWIrisStagingNode _emitIrisRequestsOlderThanTime:withEndingVideoSampleTimingInfo:](v1, (uint64_t)&v78, &time2);
                unint64_t v4 = v53;
                v2 = v54;
                int v19 = &OBJC_IVAR___FigCaptureSessionParsedConfiguration__parsedDepthDataSinkConfigurations;
                goto LABEL_77;
              }
              uint64_t v28 = v27;
              uint64_t v29 = *(void *)v75;
              while (2)
              {
                uint64_t v30 = 0;
LABEL_33:
                if (*(void *)v75 != v29) {
                  objc_enumerationMutation(v26);
                }
                int v31 = *(void **)(*((void *)&v74 + 1) + 8 * v30);
                if (v31) {
                  [*(id *)(*((void *)&v74 + 1) + 8 * v30) stillImageCaptureTime];
                }
                else {
                  memset(&time1, 0, sizeof(time1));
                }
                long long time2 = *(_OWORD *)&v84.value;
                *(void *)&long long time2_16 = v84.epoch;
                if ((CMTimeCompare(&time1, (CMTime *)&time2) & 0x80000000) == 0)
                {
                  if (v31) {
                    [v31 movieStartTime];
                  }
                  else {
                    memset(&v72, 0, sizeof(v72));
                  }
                  long long time2 = *(_OWORD *)&v84.value;
                  *(void *)&long long time2_16 = v84.epoch;
                  int32_t v32 = CMTimeCompare(&v72, (CMTime *)&time2);
                  if (v22 == 2 && v32 < 0)
                  {
                    long long time2 = *(_OWORD *)&v85.value;
                    *(void *)&long long time2_16 = v85.epoch;
                    CMTime v78 = *(CMTime *)(v1 + 272);
                    CMTimeSubtract(&lhs, (CMTime *)&time2, &v78);
                    CMTimeMake(&v70, 5, 1000);
                    CMTimeSubtract((CMTime *)&time2, &lhs, &v70);
                    time[0].CMTimeEpoch epoch = time2_16;
                    *(_OWORD *)&time[0].unsigned int value = time2;
                    CMTime v78 = time[1];
                    *(_OWORD *)&type.unsigned int value = time2;
                    type.CMTimeEpoch epoch = time2_16;
                    CMTimeAdd((CMTime *)&time2, &v78, &type);
                    *(_OWORD *)&v84.unsigned int value = time2;
                    v84.CMTimeEpoch epoch = time2_16;
                    break;
                  }
LABEL_50:
                  if (v28 == ++v30)
                  {
                    uint64_t v28 = [v26 countByEnumeratingWithState:&v74 objects:v92 count:16];
                    if (!v28) {
                      goto LABEL_52;
                    }
                    continue;
                  }
                  goto LABEL_33;
                }
                break;
              }
              if (v31)
              {
                [v31 movieTrimEndTime];
                if ((v67 & 0x100000000) != 0) {
                  goto LABEL_50;
                }
              }
              else
              {
                uint64_t v66 = 0;
                uint64_t v67 = 0;
                uint64_t v68 = 0;
              }
              CMTime v65 = v84;
              [v31 setMovieTrimEndTime:&v65];
              goto LABEL_50;
            }
            long long v63 = 0uLL;
            long long v64 = 0uLL;
            long long v62 = 0uLL;
            long long v61 = 0uLL;
            int v36 = *(void **)(v1 + 432);
            uint64_t v37 = [v36 countByEnumeratingWithState:&v61 objects:v86 count:16];
            if (v37)
            {
              uint64_t v38 = v37;
              uint64_t v39 = *(void *)v62;
              uint64_t v40 = 0;
              while (2)
              {
                uint64_t v41 = 0;
                uint64_t v51 = v40;
                uint64_t v52 = v40 + v38;
                do
                {
                  if (*(void *)v62 != v39) {
                    objc_enumerationMutation(v36);
                  }
                  int v42 = *(void **)(*((void *)&v61 + 1) + 8 * v41);
                  if (v42) {
                    [*(id *)(*((void *)&v61 + 1) + 8 * v41) stillImageCaptureTime];
                  }
                  else {
                    memset(&v60, 0, sizeof(v60));
                  }
                  long long time2 = *(_OWORD *)&v84.value;
                  *(void *)&long long time2_16 = v84.epoch;
                  if ((CMTimeCompare(&v60, (CMTime *)&time2) & 0x80000000) == 0)
                  {
                    if (v42) {
                      [v42 movieStartTime];
                    }
                    else {
                      memset(&v59, 0, sizeof(v59));
                    }
                    long long time2 = *(_OWORD *)&v84.value;
                    *(void *)&long long time2_16 = v84.epoch;
                    int32_t v43 = CMTimeCompare(&v59, (CMTime *)&time2);
                    if (v22 != 2 || (v43 & 0x80000000) == 0)
                    {
                      uint64_t v44 = v51 + v41;
                      goto LABEL_74;
                    }
                    long long time2 = *(_OWORD *)&v85.value;
                    *(void *)&long long time2_16 = v85.epoch;
                    CMTime v78 = *(CMTime *)(v1 + 272);
                    CMTimeSubtract(&v58, (CMTime *)&time2, &v78);
                    CMTimeMake(&v57, 5, 1000);
                    CMTimeSubtract((CMTime *)&time2, &v58, &v57);
                    time[0].CMTimeEpoch epoch = time2_16;
                    *(_OWORD *)&time[0].unsigned int value = time2;
                    CMTime v78 = time[1];
                    *(_OWORD *)&type.unsigned int value = time2;
                    type.CMTimeEpoch epoch = time2_16;
                    CMTimeAdd((CMTime *)&time2, &v78, &type);
                    *(_OWORD *)&v84.unsigned int value = time2;
                    v84.CMTimeEpoch epoch = time2_16;
                  }
                  long long v89 = *(_OWORD *)&time[1].timescale;
                  long long v90 = v95;
                  uint64_t v91 = v96;
                  long long time2 = *(_OWORD *)&time[0].value;
                  long long time2_16 = *(_OWORD *)&time[0].epoch;
                  -[BWIrisStagingNode _emitIrisRequest:withEndingVideoSampleTimingInfo:](v1, v42, (uint64_t)&time2);
                  ++v41;
                }
                while (v38 != v41);
                uint64_t v38 = [v36 countByEnumeratingWithState:&v61 objects:v86 count:16];
                uint64_t v44 = v52;
                uint64_t v40 = v52;
                if (v38) {
                  continue;
                }
                break;
              }
LABEL_74:
              unint64_t v4 = v53;
              v2 = v54;
              if (v44) {
                [*(id *)(v1 + 432) removeObjectsInRange:0];
              }
            }
            int v19 = &OBJC_IVAR___FigCaptureSessionParsedConfiguration__parsedDepthDataSinkConfigurations;
            if (![*(id *)(v1 + 432) count]) {
              goto LABEL_78;
            }
LABEL_77:
            *(CMTime *)(v1 + 272) = v85;
LABEL_78:
            unint64_t v18 = v55;
LABEL_79:
            *(CMTime *)(v1 + 296) = v85;
            unint64_t result = [*(id *)(v1 + v19[78]) count];
            if (!result) {
              return result;
            }
            if (++v18 == v4) {
              goto LABEL_81;
            }
            break;
          case 3:
            CMTime v33 = *(void **)(v1 + 584);
            time[0] = v85;
            [v33 stagingNode:v1 waitingToEmitFrameWithPTS:time];
            goto LABEL_79;
          case 4:
            uint64_t v96 = *(void *)(MEMORY[0x1E4F1FA70] + 64);
            long long v34 = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 48);
            *(_OWORD *)&time[1].int32_t timescale = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 32);
            long long v95 = v34;
            long long v35 = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 16);
            *(_OWORD *)&time[0].unsigned int value = *MEMORY[0x1E4F1FA70];
            *(_OWORD *)&time[0].CMTimeEpoch epoch = v35;
            time[1] = *(CMTime *)(v1 + 272);
            CMTime v84 = v85;
            long long v89 = *(_OWORD *)&time[1].timescale;
            long long v90 = v95;
            uint64_t v91 = v96;
            long long time2 = *(_OWORD *)&time[0].value;
            long long time2_16 = *(_OWORD *)&time[0].epoch;
            -[BWIrisStagingNode _emitIrisRequestsOlderThanTime:withEndingVideoSampleTimingInfo:](v1, (uint64_t)&v84, &time2);
            int v19 = &OBJC_IVAR___FigCaptureSessionParsedConfiguration__parsedDepthDataSinkConfigurations;
            *(CMTime *)(v1 + 272) = v85;
            goto LABEL_79;
          case 5:
            long long v48 = *(void **)(v1 + 584);
            time[0] = v85;
            unint64_t result = [v48 stagingNode:v1 waitingToEmitFrameWithPTS:time];
            goto LABEL_81;
          default:
            goto LABEL_79;
        }
      }
    }
LABEL_81:
    int v45 = (_OWORD *)(v1 + 272);
    if (*(unsigned char *)(v1 + 284))
    {
      memset(time, 0, 24);
      if (*(void *)(v1 + 496) && !*(unsigned char *)(v1 + 396))
      {
        *(_OWORD *)&time[0].unsigned int value = *v45;
        time[0].CMTimeEpoch epoch = *(void *)(v1 + 288);
      }
      else
      {
        CMTimeMake(&v56, 150, 1000);
        long long time2 = *v45;
        *(void *)&long long time2_16 = *(void *)(v1 + 288);
        unint64_t result = (uint64_t)CMTimeSubtract(time, (CMTime *)&time2, &v56);
      }
      if ((*(unsigned char *)(v1 + 412) & 1) == 0) {
        goto LABEL_92;
      }
      uint64_t v46 = [v2 count];
      unint64_t result = [*(id *)(v1 + 560) maximumNumberOfPreDiscontinuityFramesNeededToSatisfyAllDropFrameRecipes];
      if (v46 + ~result < 0)
      {
        *(_OWORD *)&time[0].unsigned int value = *MEMORY[0x1E4F1F9F8];
        CMTimeEpoch v47 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
      }
      else
      {
        long long time2 = 0uLL;
        *(void *)&long long time2_16 = 0;
        CMSampleBufferGetPresentationTimeStamp((CMTime *)&time2, (CMSampleBufferRef)[v2 objectAtIndexedSubscript:v46 + ~result]);
        CMTime v85 = time[0];
        *(_OWORD *)&v84.unsigned int value = time2;
        v84.CMTimeEpoch epoch = time2_16;
        unint64_t result = CMTimeCompare(&v85, &v84);
        if ((result & 0x80000000) != 0) {
          goto LABEL_92;
        }
        *(_OWORD *)&time[0].unsigned int value = time2;
        CMTimeEpoch v47 = time2_16;
      }
      time[0].CMTimeEpoch epoch = v47;
LABEL_92:
      if (time[0].flags)
      {
        long long time2 = *(_OWORD *)&time[0].value;
        *(void *)&long long time2_16 = time[0].epoch;
        return -[BWIrisStagingNode _emitBuffersThroughPTS:](v1, (CMTime *)&time2);
      }
    }
  }
  return result;
}

- (uint64_t)_emissionStatusForSampleBuffer:(uint64_t)result
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v3 = result;
    memset(&v9, 0, sizeof(v9));
    CMSampleBufferGetPresentationTimeStamp(&v9, sbuf);
    memset(&v8, 0, sizeof(v8));
    CMTime lhs = v9;
    CMTime rhs = *(CMTime *)(v3 + 120);
    CMTimeAdd(&v8, &lhs, &rhs);
    CMTime lhs = v8;
    CMTime rhs = *(CMTime *)(v3 + 168);
    if (CMTimeCompare(&lhs, &rhs) >= 1
      && ((unint64_t v4 = (void *)[*(id *)(v3 + 432) lastObject]) == 0
       || ([v4 stillImageCaptureTime], CMTime lhs = *(CMTime *)(v3 + 168), CMTimeCompare(&time1, &lhs) < 0)))
    {
      return 1;
    }
    else
    {
      if (-[BWIrisStagingNode _momentCaptureMovieRecordingInProgress](v3)) {
        return 4;
      }
      if (objc_msgSend((id)CMGetAttachment(sbuf, @"BufferRequiresCuttingInLivePhotoMovie", 0), "BOOLValue"))
      {
        if (dword_1EB4C5070)
        {
          os_log_and_send_and_compose_flags_and_os_log_CMTime type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        return 2;
      }
      else
      {
        if (!*(_DWORD *)(v3 + 480)) {
          return 4;
        }
        memset(&lhs, 0, sizeof(lhs));
        [(BWIrisStagingNode *)sbuf _hostPTSForSampleBuffer:(uint64_t)&lhs];
        int v6 = *(void **)(v3 + 496);
        CMTime rhs = lhs;
        return [v6 emissionStatusForHostPTS:&rhs];
      }
    }
  }
  return result;
}

- (uint64_t)_emitIrisRequestsOlderThanTime:(long long *)a3 withEndingVideoSampleTimingInfo:
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v5 = result;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id obj = *(id *)(result + 432);
    unint64_t result = [obj countByEnumeratingWithState:&v30 objects:v38 count:16];
    if (result)
    {
      uint64_t v6 = result;
      uint64_t v7 = 0;
      uint64_t v8 = *(void *)v31;
      CMTime v9 = (long long *)MEMORY[0x1E4F1FA70];
      uint64_t v20 = *(void *)v31;
      uint64_t v21 = v5;
      while (2)
      {
        uint64_t v10 = 0;
        uint64_t v18 = v7 + v6;
        uint64_t v19 = v7;
        uint64_t v22 = v6;
        do
        {
          if (*(void *)v31 != v8) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void **)(*((void *)&v30 + 1) + 8 * v10);
          long long v28 = 0uLL;
          uint64_t v29 = 0;
          [(BWIrisStagingNode *)(CMTime *)v5 _maxPTSForIrisRequest:(uint64_t)&v28];
          *(_OWORD *)CMTime time1 = *(_OWORD *)a2;
          *(void *)&time1[16] = *(void *)(a2 + 16);
          long long time2 = v28;
          *(void *)long long time2_16 = v29;
          unint64_t result = CMTimeCompare((CMTime *)time1, (CMTime *)&time2);
          if ((result & 0x80000000) != 0)
          {
            uint64_t v17 = v19 + v10;
            goto LABEL_15;
          }
          long long v12 = v9[3];
          *(_OWORD *)&time2_16[16] = v9[2];
          long long v26 = v12;
          uint64_t v27 = *((void *)v9 + 8);
          long long v13 = v9[1];
          long long time2 = *v9;
          *(_OWORD *)long long time2_16 = v13;
          if ([v11 isMomentCaptureMovieRecording])
          {
            *(_OWORD *)&time2_16[8] = v28;
            *(void *)&time2_16[24] = v29;
            os_log_and_send_and_compose_flags_and_os_log_CMTime type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
            uint64_t v8 = v20;
            uint64_t v6 = v22;
            fig_log_call_emit_and_clean_up_after_send_and_compose();
            uint64_t v5 = v21;
          }
          else
          {
            long long v15 = a3[3];
            *(_OWORD *)&time2_16[16] = a3[2];
            long long v26 = v15;
            uint64_t v27 = *((void *)a3 + 8);
            long long v16 = a3[1];
            long long time2 = *a3;
            *(_OWORD *)long long time2_16 = v16;
          }
          long long v35 = *(_OWORD *)&time2_16[16];
          long long v36 = v26;
          uint64_t v37 = v27;
          *(_OWORD *)CMTime time1 = time2;
          *(_OWORD *)&time1[16] = *(_OWORD *)time2_16;
          -[BWIrisStagingNode _emitIrisRequest:withEndingVideoSampleTimingInfo:](v5, v11, (uint64_t)time1);
          ++v10;
        }
        while (v6 != v10);
        unint64_t result = [obj countByEnumeratingWithState:&v30 objects:v38 count:16];
        uint64_t v6 = result;
        uint64_t v17 = v18;
        uint64_t v7 = v18;
        if (result) {
          continue;
        }
        break;
      }
LABEL_15:
      if (v17 >= 1) {
        return [*(id *)(v5 + 432) removeObjectsInRange:0];
      }
    }
  }
  return result;
}

- (CMTime)_adjustedStartTimeForTrimmedStartTime:(CMTime *)a3@<X2> ensuringAtLeast3FramesBeforeStillTime:(int)a4@<W3> ensuringFrameIsAfterTrimmedStartTime:(CMTime *)a5@<X4> butNotEarlierThanOriginalStartTime:(uint64_t *)a6@<X5> adjustedStartBufferIndexOut:(uint64_t)a7@<X8>
{
  if (result)
  {
    long long v12 = (id *)result;
    uint64_t v13 = MEMORY[0x1E4F1F9F8];
    *(_OWORD *)a7 = *MEMORY[0x1E4F1F9F8];
    *(void *)(a7 + 16) = *(void *)(v13 + 16);
    CMTime v18 = *a3;
    uint64_t v14 = [(CMTime *)result _indexOfBufferBeforeOrEqualToPTS:&v18 inputIndex:0 applyFrameDropsMitigation:0];
    CMTime v18 = *a2;
    uint64_t v15 = [v12 _indexOfBufferBeforeOrEqualToPTS:&v18 inputIndex:0 applyFrameDropsMitigation:0];
    CMTime v18 = *a5;
    uint64_t v16 = [v12 _indexOfBufferBeforeOrEqualToPTS:&v18 inputIndex:0 applyFrameDropsMitigation:0];
    if (v14 == 0x7FFFFFFFFFFFFFFFLL) {
      return (CMTime *)FigDebugAssert3();
    }
    if (v15 == 0x7FFFFFFFFFFFFFFFLL) {
      return (CMTime *)FigDebugAssert3();
    }
    uint64_t v17 = v16;
    if (v16 == 0x7FFFFFFFFFFFFFFFLL)
    {
      return (CMTime *)FigDebugAssert3();
    }
    else
    {
      if (a4
        && v15 + 1 < (unint64_t)objc_msgSend((id)objc_msgSend(v12[46], "objectAtIndexedSubscript:", 0), "count"))
      {
        ++v15;
      }
      if (v14 - v15 <= 2)
      {
        if (v14 - 3 <= v17) {
          uint64_t v15 = v17;
        }
        else {
          uint64_t v15 = v14 - 3;
        }
      }
      unint64_t result = CMSampleBufferGetPresentationTimeStamp(&v18, (CMSampleBufferRef)objc_msgSend((id)objc_msgSend(v12[46], "objectAtIndexedSubscript:", 0), "objectAtIndexedSubscript:", v15));
      *(CMTime *)a7 = v18;
      if (a6) {
        *a6 = v15;
      }
    }
  }
  else
  {
    *(void *)a7 = 0;
    *(void *)(a7 + 8) = 0;
    *(void *)(a7 + 16) = 0;
  }
  return result;
}

- (uint64_t)_fillInStartAndTrimTimesForMasterMovieWithInfo:(uint64_t)result
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v3 = result;
    memset(&v53, 0, sizeof(v53));
    if (a2) {
      [a2 stillImageCaptureTime];
    }
    else {
      memset(&lhs, 0, sizeof(lhs));
    }
    CMTime rhs = *(CMTime *)(v3 + 96);
    CMTimeSubtract(&v53, &lhs, &rhs);
    CMTimeValue v4 = *MEMORY[0x1E4F1F9F8];
    CMTimeValue value = *MEMORY[0x1E4F1F9F8];
    CMTimeScale v6 = *(_DWORD *)(MEMORY[0x1E4F1F9F8] + 8);
    CMTimeFlags flags = *(_DWORD *)(MEMORY[0x1E4F1F9F8] + 12);
    CMTimeScale timescale = v6;
    CMTimeEpoch epoch = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
    CMTime v51 = v53;
    int v8 = *(_DWORD *)(v3 + 480);
    if ((v8 - 1) >= 2)
    {
      if (!v8)
      {
        CMTimeValue value = v53.value;
        CMTimeFlags flags = v53.flags;
        CMTimeScale timescale = v53.timescale;
        CMTimeEpoch epoch = v53.epoch;
      }
    }
    else
    {
      memset(&rhs, 0, sizeof(rhs));
      if (a2) {
        [a2 stillImageCaptureHostTime];
      }
      else {
        memset(&v50, 0, sizeof(v50));
      }
      CMTime time2 = *(CMTime *)(v3 + 96);
      CMTimeSubtract(&rhs, &v50, &time2);
      memset(&time2, 0, sizeof(time2));
      if (a2) {
        [a2 stillImageCaptureHostTime];
      }
      memset(&v49, 0, sizeof(v49));
      CMTime v9 = *(void **)(v3 + 496);
      if (v9
        && (CMTime v48 = time2,
            CMTime time = rhs,
            [v9 beginTrimmingForStillImageHostPTS:&v48 minimumPTS:&time],
            (v49.flags & 1) != 0))
      {
        CMClockRef HostTimeClock = CMClockGetHostTimeClock();
        uint64_t v11 = *(const void **)(v3 + 472);
        CMTime time = v49;
        CMSyncConvertTime(&v48, &time, HostTimeClock, v11);
        CMTimeValue value = v48.value;
        CMTimeFlags v12 = v48.flags;
        CMTimeScale timescale = v48.timescale;
        CMTimeEpoch v13 = v48.epoch;
        if (a2) {
          [a2 stillImageCaptureTime];
        }
        else {
          memset(&v46, 0, sizeof(v46));
        }
        time.CMTimeValue value = value;
        time.CMTimeScale timescale = timescale;
        time.CMTimeFlags flags = v12;
        time.CMTimeEpoch epoch = v13;
        CMTime v45 = v53;
        [(BWIrisStagingNode *)(CMTime *)v3 _adjustedStartTimeForTrimmedStartTime:&v46 ensuringAtLeast3FramesBeforeStillTime:0 ensuringFrameIsAfterTrimmedStartTime:&v45 butNotEarlierThanOriginalStartTime:0 adjustedStartBufferIndexOut:(uint64_t)&v48];
        CMTimeValue value = v48.value;
        CMTimeFlags flags = v48.flags;
        CMTimeScale timescale = v48.timescale;
        CMTimeEpoch epoch = v48.epoch;
      }
      else
      {
        CMTimeValue value = v4;
        CMTimeScale timescale = v6;
      }
      if (*(_DWORD *)(v3 + 480) == 1)
      {
        v53.CMTimeValue value = value;
        v53.CMTimeScale timescale = timescale;
        v53.CMTimeFlags flags = flags;
        v53.CMTimeEpoch epoch = epoch;
      }
    }
    if (flags)
    {
      CMTime rhs = v53;
      uint64_t v44 = [(id)v3 _indexOfBufferBeforeOrEqualToPTS:&rhs inputIndex:0 applyFrameDropsMitigation:1];
      if (v44 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v14 = &OBJC_IVAR___FigCaptureSessionParsedConfiguration__parsedDepthDataSinkConfigurations;
        CMSampleBufferGetPresentationTimeStamp(&rhs, (CMSampleBufferRef)objc_msgSend((id)objc_msgSend(*(id *)(v3 + 368), "objectAtIndexedSubscript:", 0), "objectAtIndexedSubscript:", v44));
        CMTime v53 = rhs;
        if (*(unsigned char *)(v3 + 156))
        {
          CMTime rhs = v53;
          CMTime time2 = *(CMTime *)(v3 + 144);
          if (CMTimeCompare(&rhs, &time2) < 0)
          {
            if (a2) {
              [a2 stillImageCaptureTime];
            }
            else {
              memset(&v43, 0, sizeof(v43));
            }
            CMTime time2 = *(CMTime *)(v3 + 144);
            CMTime v49 = v51;
            [(BWIrisStagingNode *)(CMTime *)v3 _adjustedStartTimeForTrimmedStartTime:&v43 ensuringAtLeast3FramesBeforeStillTime:1 ensuringFrameIsAfterTrimmedStartTime:&v49 butNotEarlierThanOriginalStartTime:&v44 adjustedStartBufferIndexOut:(uint64_t)&rhs];
            CMTime v53 = rhs;
            [a2 setMovieStartTimeRequiresCutting:1];
          }
        }
        uint64_t v42 = 0x7FFFFFFFFFFFFFFFLL;
        memset(&v41, 0, sizeof(v41));
        if (a2) {
          [a2 stillImageCaptureTime];
        }
        else {
          memset(&v40, 0, sizeof(v40));
        }
        [(BWIrisStagingNode *)(CMTime *)v3 _mostRecentCuttingBufferPTSBeforePTS:&v42 cuttingBufferIndexOut:(uint64_t)&v41];
        if (v41.flags)
        {
          CMTime rhs = v53;
          CMTime time2 = v41;
          if (CMTimeCompare(&rhs, &time2) < 0)
          {
            CMTime v49 = v53;
            CMTime v53 = v41;
            uint64_t v44 = v42;
            [a2 setMovieStartTimeRequiresCutting:1];
            if (dword_1EB4C5070)
            {
              LODWORD(v48.value) = 0;
              LOBYTE(time.value) = 0;
              os_log_and_send_and_compose_flags_and_os_log_CMTime type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              unsigned int v16 = v48.value;
              if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, time.value)) {
                unsigned int v17 = v16;
              }
              else {
                unsigned int v17 = v16 & 0xFFFFFFFE;
              }
              if (v17)
              {
                CMTime rhs = v49;
                Float64 Seconds = CMTimeGetSeconds(&rhs);
                CMTime rhs = v53;
                Float64 v19 = CMTimeGetSeconds(&rhs);
                uint64_t v20 = objc_msgSend((id)objc_msgSend(a2, "settings"), "settingsID");
                LODWORD(time2.value) = 136315906;
                *(CMTimeValue *)((char *)&time2.value + 4) = (CMTimeValue)"-[BWIrisStagingNode _fillInStartAndTrimTimesFo"
                                                                          "rMasterMovieWithInfo:]";
                LOWORD(time2.flags) = 2048;
                *(Float64 *)((char *)&time2.flags + 2) = Seconds;
                HIWORD(time2.epoch) = 2048;
                Float64 v55 = v19;
                __int16 v56 = 2048;
                uint64_t v57 = v20;
                LODWORD(v33) = 42;
                p_CMTime time2 = &time2;
                _os_log_send_and_compose_impl();
              }
              fig_log_call_emit_and_clean_up_after_send_and_compose();
              uint64_t v14 = &OBJC_IVAR___FigCaptureSessionParsedConfiguration__parsedDepthDataSinkConfigurations;
            }
          }
        }
        if (*(unsigned char *)(v3 + 787)
          && objc_msgSend((id)objc_msgSend(a2, "settings"), "smartStyleReversibilitySupported"))
        {
          CMTime v49 = v53;
          unsigned int v21 = v44;
          int v22 = [a2 movieStartTimeRequiresCutting] ^ 1;
          if (a2) {
            [a2 stillImageCaptureTime];
          }
          else {
            memset(&v39, 0, sizeof(v39));
          }
          [(BWIrisStagingNode *)v3 _adjustedStartTimeForSmartStyle:v22 allowSearchBackward:&v39 searchEndPTS:&v44 adjustedStartBufferIndexOut:&rhs];
          CMTime v53 = rhs;
          if (dword_1EB4C5070)
          {
            LODWORD(v48.value) = 0;
            LOBYTE(time.value) = 0;
            long long v23 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            unsigned int v24 = v48.value;
            if (os_log_type_enabled(v23, time.value)) {
              unsigned int v25 = v24;
            }
            else {
              unsigned int v25 = v24 & 0xFFFFFFFE;
            }
            if (v25)
            {
              CMTime rhs = v49;
              Float64 v26 = CMTimeGetSeconds(&rhs);
              CMTime rhs = v53;
              Float64 v27 = CMTimeGetSeconds(&rhs);
              uint64_t v28 = objc_msgSend((id)objc_msgSend(a2, "settings"), "settingsID");
              LODWORD(time2.value) = 136315906;
              *(CMTimeValue *)((char *)&time2.value + 4) = (CMTimeValue)"-[BWIrisStagingNode _fillInStartAndTrimTimesForM"
                                                                        "asterMovieWithInfo:]";
              LOWORD(time2.flags) = 2048;
              *(Float64 *)((char *)&time2.flags + 2) = v26;
              HIWORD(time2.epoch) = 2048;
              Float64 v55 = v27;
              __int16 v56 = 2048;
              uint64_t v57 = v28;
              LODWORD(v33) = 42;
              p_CMTime time2 = &time2;
              _os_log_send_and_compose_impl();
            }
            fig_log_call_emit_and_clean_up_after_send_and_compose();
            uint64_t v14 = &OBJC_IVAR___FigCaptureSessionParsedConfiguration__parsedDepthDataSinkConfigurations;
          }
          -[BWIrisStagingNode _updateSmartStyleRenderingBypassedForIrisMovieInfo:startBufferIndex:](v3, a2, v44);
        }
        rhs.CMTimeValue value = value;
        rhs.CMTimeScale timescale = timescale;
        rhs.CMTimeFlags flags = flags;
        rhs.CMTimeEpoch epoch = epoch;
        CMTime time2 = v53;
        if (CMTimeCompare(&rhs, &time2) < 0)
        {
          CMTimeValue value = v53.value;
          CMTimeFlags flags = v53.flags;
          CMTimeScale timescale = v53.timescale;
          CMTimeEpoch epoch = v53.epoch;
        }
        if (*(_DWORD *)(v3 + 480) != 2)
        {
          CMTimeValue value = v53.value;
          CMTimeFlags v30 = v53.flags;
          CMTimeScale timescale = v53.timescale;
          CMTimeEpoch v31 = v53.epoch;
          goto LABEL_61;
        }
        rhs.CMTimeValue value = value;
        rhs.CMTimeScale timescale = timescale;
        rhs.CMTimeFlags flags = flags;
        rhs.CMTimeEpoch epoch = epoch;
        uint64_t v44 = [(id)v3 _indexOfBufferBeforeOrEqualToPTS:&rhs inputIndex:0 applyFrameDropsMitigation:1];
        if (v44 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v29 = (void *)[*(id *)(v3 + v14[75]) objectAtIndexedSubscript:0];
          CMSampleBufferGetPresentationTimeStamp(&rhs, (CMSampleBufferRef)[v29 objectAtIndexedSubscript:v44]);
          CMTimeValue value = rhs.value;
          CMTimeFlags v30 = rhs.flags;
          CMTimeScale timescale = rhs.timescale;
          CMTimeEpoch v31 = rhs.epoch;
LABEL_61:
          CMTime v38 = v53;
          objc_msgSend(a2, "setMovieStartTime:", &v38, p_time2, v33);
          CMTimeValue v34 = value;
          CMTimeScale v35 = timescale;
          CMTimeFlags v36 = v30;
          CMTimeEpoch v37 = v31;
          [a2 setMovieTrimStartTime:&v34];
          return 1;
        }
        FigDebugAssert3();
      }
    }
    return 0;
  }
  return result;
}

- (CMTime)_mostRecentCuttingBufferPTSBeforePTS:(uint64_t *)a3@<X2> cuttingBufferIndexOut:(uint64_t)a4@<X8>
{
  if (result)
  {
    CMTimeScale v6 = result;
    uint64_t v7 = MEMORY[0x1E4F1F9F8];
    *(_OWORD *)a4 = *MEMORY[0x1E4F1F9F8];
    *(void *)(a4 + 16) = *(void *)(v7 + 16);
    CMTime v13 = *a2;
    uint64_t v8 = [(CMTime *)result _indexOfBufferBeforeOrEqualToPTS:&v13 inputIndex:0 applyFrameDropsMitigation:0];
    if (v8 == 0x7FFFFFFFFFFFFFFFLL) {
      return (CMTime *)FigDebugAssert3();
    }
    uint64_t v9 = v8;
    uint64_t v10 = (void *)[*(id *)&v6[15].timescale objectAtIndexedSubscript:0];
    unint64_t result = (CMTime *)[v10 count];
    if (v9 >= (unint64_t)result)
    {
      return (CMTime *)FigDebugAssert3();
    }
    else if ((v9 & 0x8000000000000000) == 0)
    {
      while (1)
      {
        uint64_t v11 = (void *)[v10 objectAtIndexedSubscript:v9];
        unint64_t result = (CMTime *)objc_msgSend((id)CMGetAttachment(v11, @"BufferRequiresCuttingInLivePhotoMovie", 0), "BOOLValue");
        if (result) {
          break;
        }
        if (v9-- <= 0) {
          return result;
        }
      }
      unint64_t result = CMSampleBufferGetPresentationTimeStamp(&v13, (CMSampleBufferRef)v11);
      *(CMTime *)a4 = v13;
      if (a3) {
        *a3 = v9;
      }
    }
  }
  else
  {
    *(void *)a4 = 0;
    *(void *)(a4 + 8) = 0;
    *(void *)(a4 + 16) = 0;
  }
  return result;
}

- (uint64_t)_adjustedStartTimeForSmartStyle:(int)a3@<W2> allowSearchBackward:(CMTime *)a4@<X3> searchEndPTS:(uint64_t *)a5@<X4> adjustedStartBufferIndexOut:(CMTime *)a6@<X8>
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v11 = result;
    CMTimeFlags v12 = (opaqueCMSampleBuffer *)objc_msgSend((id)objc_msgSend(*(id *)(result + 368), "objectAtIndexedSubscript:", 0), "objectAtIndexedSubscript:", (int)a2);
    memset(&v31, 0, sizeof(v31));
    CMSampleBufferGetPresentationTimeStamp(&v31, v12);
    *a6 = v31;
    uint64_t v13 = MEMORY[0x1E4F1F9F8];
    *(_OWORD *)&v30.CMTimeValue value = *MEMORY[0x1E4F1F9F8];
    CMTimeEpoch v14 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
    v30.CMTimeEpoch epoch = v14;
    *(_OWORD *)&v29.CMTimeValue value = *(_OWORD *)&v30.value;
    v29.CMTimeEpoch epoch = v14;
    unint64_t result = -[BWIrisStagingNode _sbufHasSmartStyleReversibilityAttachedMedia:](v11, v12);
    if ((result & 1) == 0)
    {
      long long v23 = a5;
      CMTimeValue value = *(void *)v13;
      CMTimeFlags v15 = *(_DWORD *)(v13 + 12);
      CMTimeScale timescale = *(_DWORD *)(v13 + 8);
      CMTimeValue v32 = value;
      CMTimeScale v33 = timescale;
      if (a3)
      {
        uint64_t v16 = a2;
        while ((int)v16 >= 1)
        {
          unsigned int v17 = (opaqueCMSampleBuffer *)objc_msgSend((id)objc_msgSend(*(id *)(v11 + 368), "objectAtIndexedSubscript:", 0), "objectAtIndexedSubscript:", --v16);
          if (-[BWIrisStagingNode _sbufHasSmartStyleReversibilityAttachedMedia:](v11, v17))
          {
            CMSampleBufferGetPresentationTimeStamp(&lhs, v17);
            CMTimeValue value = lhs.value;
            CMTimeFlags flags = lhs.flags;
            CMTimeScale timescale = lhs.timescale;
            CMTimeEpoch epoch = lhs.epoch;
            goto LABEL_9;
          }
        }
      }
      uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
      CMTimeFlags flags = v15;
      CMTimeEpoch epoch = v14;
LABEL_9:
      LODWORD(v20) = a2 + 1;
      if (objc_msgSend((id)objc_msgSend(*(id *)(v11 + 368), "objectAtIndexedSubscript:", 0), "count") <= (unint64_t)(int)v20)
      {
        uint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else
      {
        CMTimeEpoch v22 = epoch;
        uint64_t v20 = (int)v20;
        while (1)
        {
          unsigned int v21 = (opaqueCMSampleBuffer *)objc_msgSend((id)objc_msgSend(*(id *)(v11 + 368), "objectAtIndexedSubscript:", 0), "objectAtIndexedSubscript:", v20);
          memset(&lhs, 0, sizeof(lhs));
          CMSampleBufferGetPresentationTimeStamp(&lhs, v21);
          CMTime time1 = lhs;
          CMTime time2 = *a4;
          if ((CMTimeCompare(&time1, &time2) & 0x80000000) == 0)
          {
LABEL_14:
            uint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
            goto LABEL_17;
          }
          if (-[BWIrisStagingNode _sbufHasSmartStyleReversibilityAttachedMedia:](v11, v21)) {
            break;
          }
          if (objc_msgSend((id)objc_msgSend(*(id *)(v11 + 368), "objectAtIndexedSubscript:", 0), "count") <= (unint64_t)++v20) {
            goto LABEL_14;
          }
        }
        CMSampleBufferGetPresentationTimeStamp(&time1, v21);
        CMTimeValue v32 = time1.value;
        CMTimeFlags v15 = time1.flags;
        CMTimeScale v33 = time1.timescale;
        CMTimeEpoch v14 = time1.epoch;
LABEL_17:
        CMTimeEpoch epoch = v22;
      }
      if ((flags | v15))
      {
        CMTime lhs = v31;
        time1.CMTimeValue value = value;
        time1.CMTimeScale timescale = timescale;
        time1.CMTimeFlags flags = flags;
        time1.CMTimeEpoch epoch = epoch;
        CMTimeSubtract(&time, &lhs, &time1);
        CMTimeAbsoluteValue(&v30, &time);
        lhs.CMTimeValue value = v32;
        lhs.CMTimeScale timescale = v33;
        lhs.CMTimeFlags flags = v15;
        lhs.CMTimeEpoch epoch = v14;
        CMTime time1 = v31;
        CMTimeSubtract(&v24, &lhs, &time1);
        CMTimeAbsoluteValue(&v29, &v24);
        CMTime lhs = v30;
        CMTime time1 = v29;
        unint64_t result = CMTimeCompare(&lhs, &time1);
        if ((int)result <= 0)
        {
          a6->CMTimeValue value = value;
          a6->CMTimeScale timescale = timescale;
          a6->CMTimeFlags flags = flags;
          a6->CMTimeEpoch epoch = epoch;
          if (v23) {
            *long long v23 = v16;
          }
        }
        else
        {
          a6->CMTimeValue value = v32;
          a6->CMTimeScale timescale = v33;
          a6->CMTimeFlags flags = v15;
          a6->CMTimeEpoch epoch = v14;
          if (v23) {
            *long long v23 = v20;
          }
        }
      }
      else
      {
        return FigDebugAssert3();
      }
    }
  }
  else
  {
    a6->CMTimeValue value = 0;
    *(void *)&a6->CMTimeScale timescale = 0;
    a6->CMTimeEpoch epoch = 0;
  }
  return result;
}

- (uint64_t)_updateSmartStyleRenderingBypassedForIrisMovieInfo:(uint64_t)a3 startBufferIndex:
{
  if (result)
  {
    if (!a2 || a3 == 0x7FFFFFFFFFFFFFFFLL)
    {
      return FigDebugAssert3();
    }
    else
    {
      uint64_t ShouldBeBypassed = BWSmartStyleRenderingShouldBeBypassed((const void *)objc_msgSend((id)objc_msgSend(*(id *)(result + 368), "objectAtIndexedSubscript:", 0), "objectAtIndexedSubscript:", a3));
      uint64_t v5 = (void *)[a2 settings];
      return [v5 setSmartStyleRenderingBypassed:ShouldBeBypassed];
    }
  }
  return result;
}

- (uint64_t)_fillInRefMovieStartAndTrimTimesForStillImageTimesBeforeTime:(uint64_t)result
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  if (!result) {
    return result;
  }
  uint64_t v3 = result;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id obj = *(id *)(result + 432);
  uint64_t v4 = [obj countByEnumeratingWithState:&v65 objects:v74 count:16];
  if (!v4) {
    return 1;
  }
  uint64_t v5 = v4;
  CMTimeScale v6 = &OBJC_IVAR___FigCaptureSessionParsedConfiguration__parsedDepthDataSinkConfigurations;
  uint64_t v7 = *(void *)v66;
  uint64_t v36 = (const void *)*MEMORY[0x1E4F1CFD0];
  CFStringRef v37 = (const __CFString *)*MEMORY[0x1E4F1F288];
  uint64_t v38 = *(void *)v66;
  while (2)
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v66 != v7) {
        objc_enumerationMutation(obj);
      }
      uint64_t v9 = *(void **)(*((void *)&v65 + 1) + 8 * i);
      if (v9)
      {
        [*(id *)(*((void *)&v65 + 1) + 8 * i) movieStartTime];
        if ((v63 & 0x100000000) != 0) {
          continue;
        }
        [v9 stillImageCaptureTime];
      }
      else
      {
        uint64_t v63 = 0;
        uint64_t v62 = 0;
        uint64_t v64 = 0;
        memset(&time1, 0, sizeof(time1));
      }
      CMTime time2 = *a2;
      if (CMTimeCompare(&time1, &time2) > 0) {
        return 1;
      }
      memset(&v60, 0, sizeof(v60));
      if (v9) {
        [v9 stillImageCaptureTime];
      }
      else {
        memset(&lhs, 0, sizeof(lhs));
      }
      CMTime time2 = *(CMTime *)(v3 + 96);
      CMTimeSubtract(&v60, &lhs, &time2);
      uint64_t v58 = 0;
      CMTime time2 = v60;
      uint64_t v58 = [(id)v3 _indexOfBufferBeforeOrEqualToPTS:&time2 inputIndex:0 applyFrameDropsMitigation:1];
      if (v58 == 0x7FFFFFFFFFFFFFFFLL) {
        return 0;
      }
      uint64_t v10 = (void *)[*(id *)(v3 + v6[75]) objectAtIndexedSubscript:0];
      CMSampleBufferGetPresentationTimeStamp(&time2, (CMSampleBufferRef)[v10 objectAtIndexedSubscript:v58]);
      CMTime v60 = time2;
      if (*(unsigned char *)(v3 + 156))
      {
        CMTime time2 = v60;
        CMTime v69 = *(CMTime *)(v3 + 144);
        if (CMTimeCompare(&time2, &v69) < 0)
        {
          if (v9) {
            [v9 stillImageCaptureTime];
          }
          else {
            memset(&v57, 0, sizeof(v57));
          }
          CMTime v69 = *(CMTime *)(v3 + 144);
          CMTime v56 = v60;
          [(BWIrisStagingNode *)(CMTime *)v3 _adjustedStartTimeForTrimmedStartTime:&v57 ensuringAtLeast3FramesBeforeStillTime:1 ensuringFrameIsAfterTrimmedStartTime:&v56 butNotEarlierThanOriginalStartTime:&v58 adjustedStartBufferIndexOut:(uint64_t)&time2];
          CMTime v60 = time2;
          [v9 setMovieStartTimeRequiresCutting:1];
        }
      }
      uint64_t v55 = 0x7FFFFFFFFFFFFFFFLL;
      memset(&v56, 0, sizeof(v56));
      if (v9) {
        [v9 stillImageCaptureTime];
      }
      else {
        memset(&v54, 0, sizeof(v54));
      }
      [(BWIrisStagingNode *)(CMTime *)v3 _mostRecentCuttingBufferPTSBeforePTS:&v55 cuttingBufferIndexOut:(uint64_t)&v56];
      if (v56.flags)
      {
        CMTime time2 = v60;
        CMTime v69 = v56;
        if (CMTimeCompare(&time2, &v69) < 0)
        {
          CMTime v53 = v60;
          CMTime v60 = v56;
          uint64_t v58 = v55;
          [v9 setMovieStartTimeRequiresCutting:1];
          if (dword_1EB4C5070)
          {
            *(_DWORD *)uint64_t v52 = 0;
            os_log_type_t type = OS_LOG_TYPE_DEFAULT;
            os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            unsigned int v12 = *(_DWORD *)v52;
            if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type)) {
              unsigned int v13 = v12;
            }
            else {
              unsigned int v13 = v12 & 0xFFFFFFFE;
            }
            if (v13)
            {
              CMTime time2 = v53;
              Float64 Seconds = CMTimeGetSeconds(&time2);
              CMTime time2 = v60;
              Float64 v15 = CMTimeGetSeconds(&time2);
              uint64_t v16 = objc_msgSend((id)objc_msgSend(v9, "settings"), "settingsID");
              LODWORD(v69.value) = 136315906;
              *(CMTimeValue *)((char *)&v69.value + 4) = (CMTimeValue)"-[BWIrisStagingNode _fillInRefMovieStartAndTrimTim"
                                                                      "esForStillImageTimesBeforeTime:]";
              LOWORD(v69.flags) = 2048;
              *(Float64 *)((char *)&v69.flags + 2) = Seconds;
              HIWORD(v69.epoch) = 2048;
              Float64 v70 = v15;
              __int16 v71 = 2048;
              uint64_t v72 = v16;
              LODWORD(v35) = 42;
              CMTimeValue v34 = &v69;
              _os_log_send_and_compose_impl();
            }
            fig_log_call_emit_and_clean_up_after_send_and_compose();
            CMTimeScale v6 = &OBJC_IVAR___FigCaptureSessionParsedConfiguration__parsedDepthDataSinkConfigurations;
          }
        }
      }
      if (*(unsigned char *)(v3 + 787)
        && objc_msgSend((id)objc_msgSend(v9, "settings"), "smartStyleReversibilitySupported"))
      {
        CMTime v53 = v60;
        unsigned int v17 = v58;
        int v18 = [v9 movieStartTimeRequiresCutting];
        if (v9) {
          [v9 stillImageCaptureTime];
        }
        else {
          memset(&v50, 0, sizeof(v50));
        }
        [(BWIrisStagingNode *)v3 _adjustedStartTimeForSmartStyle:v18 ^ 1 allowSearchBackward:&v50 searchEndPTS:&v58 adjustedStartBufferIndexOut:&time2];
        CMTime v60 = time2;
        uint64_t v7 = v38;
        if (dword_1EB4C5070)
        {
          *(_DWORD *)uint64_t v52 = 0;
          os_log_type_t type = OS_LOG_TYPE_DEFAULT;
          Float64 v19 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          unsigned int v20 = *(_DWORD *)v52;
          if (os_log_type_enabled(v19, type)) {
            unsigned int v21 = v20;
          }
          else {
            unsigned int v21 = v20 & 0xFFFFFFFE;
          }
          if (v21)
          {
            CMTime time2 = v53;
            Float64 v22 = CMTimeGetSeconds(&time2);
            CMTime time2 = v60;
            Float64 v23 = CMTimeGetSeconds(&time2);
            uint64_t v24 = objc_msgSend((id)objc_msgSend(v9, "settings"), "settingsID");
            LODWORD(v69.value) = 136315906;
            *(CMTimeValue *)((char *)&v69.value + 4) = (CMTimeValue)"-[BWIrisStagingNode _fillInRefMovieStartAndTrimTimes"
                                                                    "ForStillImageTimesBeforeTime:]";
            LOWORD(v69.flags) = 2048;
            *(Float64 *)((char *)&v69.flags + 2) = v22;
            HIWORD(v69.epoch) = 2048;
            Float64 v70 = v23;
            __int16 v71 = 2048;
            uint64_t v72 = v24;
            LODWORD(v35) = 42;
            CMTimeValue v34 = &v69;
            _os_log_send_and_compose_impl();
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();
          CMTimeScale v6 = &OBJC_IVAR___FigCaptureSessionParsedConfiguration__parsedDepthDataSinkConfigurations;
        }
        -[BWIrisStagingNode _updateSmartStyleRenderingBypassedForIrisMovieInfo:startBufferIndex:](v3, v9, v58);
      }
      if (objc_msgSend(v9, "movieStartTimeRequiresCutting", v34, v35))
      {
        if (v58 != 0x7FFFFFFFFFFFFFFFLL)
        {
          unsigned int v25 = (void *)[*(id *)(v3 + v6[75]) objectAtIndexedSubscript:0];
          Float64 v26 = (void *)[v25 objectAtIndexedSubscript:v58];
          CMSetAttachment(v26, v37, v36, 1u);
          if (dword_1EB4C5070)
          {
            LODWORD(v53.value) = 0;
            v52[0] = OS_LOG_TYPE_DEFAULT;
            Float64 v27 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            unsigned int value = v53.value;
            if (os_log_type_enabled(v27, v52[0])) {
              unsigned int v29 = value;
            }
            else {
              unsigned int v29 = value & 0xFFFFFFFE;
            }
            if (v29)
            {
              CMSampleBufferGetPresentationTimeStamp(&time, (CMSampleBufferRef)v26);
              Float64 v30 = CMTimeGetSeconds(&time);
              uint64_t v31 = objc_msgSend((id)objc_msgSend(v9, "settings"), "settingsID");
              LODWORD(v69.value) = 136315650;
              *(CMTimeValue *)((char *)&v69.value + 4) = (CMTimeValue)"-[BWIrisStagingNode _fillInRefMovieStartAndTrimTim"
                                                                      "esForStillImageTimesBeforeTime:]";
              LOWORD(v69.flags) = 2048;
              *(Float64 *)((char *)&v69.flags + 2) = v30;
              HIWORD(v69.epoch) = 2048;
              Float64 v70 = *(double *)&v31;
              LODWORD(v35) = 32;
              CMTimeValue v34 = &v69;
              _os_log_send_and_compose_impl();
            }
            fig_log_call_emit_and_clean_up_after_send_and_compose();
            CMTimeScale v6 = &OBJC_IVAR___FigCaptureSessionParsedConfiguration__parsedDepthDataSinkConfigurations;
            uint64_t v7 = v38;
          }
        }
      }
      int v32 = *(_DWORD *)(v3 + 480);
      if (v32 == 2)
      {
        CMTime v42 = v60;
        [v9 setMovieStartTime:&v42];
        CMTime time2 = v60;
        CMTime v69 = *(CMTime *)(v3 + 504);
        CMTimeMaximum(&v41, &time2, &v69);
        CMTime v40 = v41;
        [v9 setMovieTrimStartTime:&v40];
      }
      else
      {
        if (v32 == 1)
        {
          CMTime time2 = v60;
          CMTime v69 = *(CMTime *)(v3 + 504);
          CMTimeMaximum(&v45, &time2, &v69);
          CMTime v44 = v45;
          [v9 setMovieTrimStartTime:&v44];
          CMTime v43 = v45;
          CMTimeScale v33 = &v43;
        }
        else
        {
          if (v32) {
            continue;
          }
          CMTime v48 = v60;
          CMTime v47 = v60;
          [v9 setMovieTrimStartTime:&v47];
          CMTime v46 = v48;
          CMTimeScale v33 = &v46;
        }
        objc_msgSend(v9, "setMovieStartTime:", v33, v34, v35);
      }
    }
    uint64_t v5 = [obj countByEnumeratingWithState:&v65 objects:v74 count:16];
    if (v5) {
      continue;
    }
    break;
  }
  return 1;
}

- (uint64_t)_tagStillImageVISKeyFrames
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = MEMORY[0x1E4F1F9F8];
    uint64_t v46 = *(void *)(MEMORY[0x1E4F1F9F8] + 12);
    int epoch_high = *(_DWORD *)(MEMORY[0x1E4F1F9F8] + 20);
    long long v3 = *MEMORY[0x1E4F1F9F8];
    v42.CMTimeEpoch epoch = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    *(_OWORD *)&v42.CMTimeValue value = v3;
    uint64_t v4 = *(void **)(result + 432);
    unint64_t result = [v4 countByEnumeratingWithState:&v38 objects:v45 count:16];
    if (result)
    {
      uint64_t v5 = result;
      unsigned int v29 = 0;
      Float64 v30 = 0;
      CMTimeScale timescale = *(_DWORD *)(v2 + 8);
      CMTimeValue value = *(void *)v2;
      uint64_t v6 = *(void *)v39;
      CFStringRef key = (const __CFString *)*MEMORY[0x1E4F53070];
      uint64_t v34 = *MEMORY[0x1E4F55D10];
      uint64_t v33 = *MEMORY[0x1E4F52DC0];
      uint64_t v28 = *MEMORY[0x1E4F54068];
      uint64_t v26 = *MEMORY[0x1E4F54128];
      uint64_t v25 = *MEMORY[0x1E4F52DD8];
      uint64_t v24 = *MEMORY[0x1E4F52C78];
      uint64_t v23 = *MEMORY[0x1E4F52DE8];
      Float64 v27 = v4;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v39 != v6) {
            objc_enumerationMutation(v4);
          }
          uint64_t v8 = *(void **)(*((void *)&v38 + 1) + 8 * v7);
          if (([v8 isMomentCaptureMovieRecording] & 1) == 0
            && ([v8 stillImageVISKeyFrameTagged] & 1) == 0)
          {
            if (!v30)
            {
              unsigned int v29 = (void *)[*(id *)(v1 + 368) objectAtIndexedSubscript:0];
              Float64 v30 = objc_msgSend(v29, "objectAtIndexedSubscript:", objc_msgSend(v29, "count") - 1);
              [(BWIrisStagingNode *)v30 _hostPTSForSampleBuffer:(uint64_t)&lhs];
              uint64_t v46 = *(void *)&lhs.flags;
              int epoch_high = HIDWORD(lhs.epoch);
              CMTimeScale timescale = lhs.timescale;
              CMTimeValue value = lhs.value;
              CMTimeMake(&v42, lhs.timescale / 1000, lhs.timescale);
            }
            memset(&v37, 0, sizeof(v37));
            if (v8) {
              [v8 stillImageCaptureHostTime];
            }
            CMTime lhs = v37;
            CMTime rhs = v42;
            CMTimeSubtract(&time2, &lhs, &rhs);
            lhs.CMTimeValue value = value;
            lhs.CMTimeScale timescale = timescale;
            *(void *)&lhs.CMTimeFlags flags = v46;
            HIDWORD(lhs.epoch) = epoch_high;
            unint64_t result = CMTimeCompare(&lhs, &time2);
            if ((result & 0x80000000) != 0) {
              return result;
            }
            CMTime lhs = v37;
            CMTime rhs = v42;
            unint64_t result = -[BWIrisStagingNode _indexOfBufferBeforeOrEqualToHostPTS:inputIndex:tolerance:](v1, &lhs, 0, &rhs);
            if (result == 0x7FFFFFFFFFFFFFFFLL) {
              return result;
            }
            uint64_t v9 = (const void *)[v29 objectAtIndexedSubscript:result];
            uint64_t v10 = (void *)CMGetAttachment(v9, key, 0);
            [v10 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v34];
            objc_msgSend(v10, "setObject:forKeyedSubscript:", objc_msgSend(v8, "livePhotoMetadataStillImageKeyFrameSettingsID"), v33);
            [v8 setStillImageVISKeyFrameTagged:1];
            objc_msgSend(v8, "setStillImageCaptureLuxLevel:", objc_msgSend((id)objc_msgSend(v10, "objectForKeyedSubscript:", v28), "intValue"));
            if (!*(unsigned char *)(v1 + 784))
            {
              uint64_t v11 = (void *)CMGetAttachment(v9, @"TotalZoomFactor", 0);
              if (v11)
              {
                [v11 floatValue];
                float v13 = v12;
              }
              else
              {
                float v13 = 1.0;
              }
              CMTimeEpoch v14 = (void *)[v10 objectForKeyedSubscript:v26];
              objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(v1 + 648), "objectForKeyedSubscript:", v25), "objectForKeyedSubscript:", v24), "floatValue");
              float v16 = v15;
              int v17 = [v14 isEqualToString:v23];
              uint64_t v4 = v27;
              if (v17)
              {
                if (v16 > 0.0 && v13 >= v16) {
                  [v8 setLimitStillImageTransformDuringVitalityPlayback:1];
                }
              }
            }
            if (*(void *)(v1 + 768) && [v8 requiresSubjectRelightingCalculation])
            {
              if (!*(void *)(v1 + 776))
              {
                *(void *)(v1 + 776) = (id)objc_msgSend(*(id *)(v1 + 768), "startCalculationWithJPEGSampleBuffer:stillImageRequestSettings:stillImageCaptureSettings:", v9, objc_msgSend(v8, "stillImageRequestSettings"), objc_msgSend(v8, "stillImageCaptureSettings"));
                if (dword_1EB4C5070)
                {
                  os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                  os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
                  fig_log_call_emit_and_clean_up_after_send_and_compose();
                }
                uint64_t v4 = v27;
              }
              objc_msgSend(v8, "setSubjectRelightingResult:", v21, v22);
            }
            AttachedMedia = (const void *)BWSampleBufferGetAttachedMedia(v9, 0x1EFA742E0);
            if (AttachedMedia
              || (AttachedMedia = (const void *)BWSampleBufferGetAttachedMedia(v9, @"SynchronizedSlaveFrame")) != 0)
            {
              unsigned int v20 = (void *)CMGetAttachment(AttachedMedia, key, 0);
              objc_msgSend(v20, "setObject:forKeyedSubscript:", objc_msgSend(v10, "objectForKeyedSubscript:", v34), v34);
              objc_msgSend(v20, "setObject:forKeyedSubscript:", objc_msgSend(v10, "objectForKeyedSubscript:", v33), v33);
            }
          }
          ++v7;
        }
        while (v5 != v7);
        unint64_t result = [v4 countByEnumeratingWithState:&v38 objects:v45 count:16];
        uint64_t v5 = result;
      }
      while (result);
    }
  }
  return result;
}

- (__n128)_prepareToEmitFramesFromStartTime:(uint64_t)a3 throughEndTime:
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return result;
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = *(id *)(a1 + 368);
  uint64_t v5 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (!v5) {
    goto LABEL_13;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v27;
  uint64_t v8 = -1;
  uint64_t v9 = MEMORY[0x1E4F1F9F8];
  do
  {
    uint64_t v10 = 0;
    uint64_t v11 = 24 * v8 + 24;
    do
    {
      if (*(void *)v27 != v7) {
        objc_enumerationMutation(obj);
      }
      float v12 = *(void **)(*((void *)&v26 + 1) + 8 * v10);
      long long v24 = *a2;
      uint64_t v25 = *((void *)a2 + 2);
      uint64_t v13 = [(id)a1 _indexOfBufferBeforeOrEqualToPTS:&v24 inputIndex:v8 + v10 + 1 applyFrameDropsMitigation:0];
      if (v13)
      {
        if (v13 == 0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_11;
        }
        objc_msgSend(*(id *)(a1 + 376), "setObject:atIndexedSubscript:", objc_msgSend(v12, "objectAtIndexedSubscript:", v13 - 1), v8 + v10 + 1);
      }
      uint64_t v14 = *(void *)(a1 + 464) + v11;
      *(_OWORD *)uint64_t v14 = *(_OWORD *)v9;
      *(void *)(v14 + 16) = *(void *)(v9 + 16);
LABEL_11:
      ++v10;
      v11 += 24;
    }
    while (v6 != v10);
    uint64_t v6 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    v8 += v10;
  }
  while (v6);
LABEL_13:
  uint64_t v15 = *((void *)a2 + 2);
  *(_OWORD *)(a1 + 320) = *a2;
  *(void *)(a1 + 336) = v15;
  float v16 = *(void **)(a1 + 560);
  if (v16)
  {
    long long v22 = *a2;
    uint64_t v23 = *((void *)a2 + 2);
    [v16 setMasterMovieOriginalStartTime:&v22];
  }
  uint64_t v17 = *(void *)(a3 + 16);
  *(_OWORD *)(a1 + 296) = *(_OWORD *)a3;
  *(void *)(a1 + 312) = v17;
  uint64_t v18 = *(void *)(a3 + 16);
  __n128 result = *(__n128 *)a3;
  *(_OWORD *)(a1 + 272) = *(_OWORD *)a3;
  *(void *)(a1 + 288) = v18;
  return result;
}

- (BOOL)_haveEnoughVideoStagedToStartFirstIrisRecording:(CMTime *)a3 currentTime:(CMTime *)a4 emitEndTimeOut:
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v7 = result;
    CMTime v28 = *a3;
    memset(&v27, 0, sizeof(v27));
    if (a2)
    {
      [a2 stillImageCaptureHostTime];
      [a2 stillImageCaptureHostTime];
      CMTimeMake(&v27, (int)v25 / 1000, timescale[0]);
      [a2 stillImageCaptureHostTime];
    }
    else
    {
      uint64_t v24 = 0;
      uint64_t v25 = 0;
      uint64_t v26 = 0;
      *(void *)CMTimeScale timescale = 0;
      uint64_t v23 = 0;
      uint64_t v21 = 0;
      CMTimeMake(&v27, 0, 0);
      memset(&v20, 0, sizeof(v20));
    }
    CMTime time1 = v27;
    uint64_t v8 = -[BWIrisStagingNode _indexOfBufferBeforeOrEqualToHostPTS:inputIndex:tolerance:](v7, &v20, 0, &time1);
    uint64_t v9 = (void *)[*(id *)(v7 + 368) objectAtIndexedSubscript:0];
    uint64_t v10 = *(void **)(v7 + 560);
    if (v10 && *(void *)(v7 + 496) && !*(unsigned char *)(v7 + 785)) {
      uint64_t v11 = (int)[v10 audioOffsetForOriginalStillImageTimeMaximumFrameLatency];
    }
    else {
      uint64_t v11 = 1;
    }
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (a2) {
        [a2 stillImageCaptureTime];
      }
      else {
        memset(&v16, 0, sizeof(v16));
      }
      CMTime time1 = *a3;
      __n128 result = CMTimeCompare(&time1, &v16) > 0;
      if (a4) {
        goto LABEL_22;
      }
    }
    else
    {
      if ([v9 count] <= (unint64_t)(v11 + v8))
      {
        __n128 result = 0;
        if (!a4) {
          return result;
        }
        goto LABEL_22;
      }
      if (v8 + 1 < (unint64_t)[v9 count])
      {
        do
        {
          float v12 = (opaqueCMSampleBuffer *)objc_msgSend((id)objc_msgSend(*(id *)(v7 + 368), "objectAtIndexedSubscript:", 0), "objectAtIndexedSubscript:", v8);
          memset(&v19, 0, sizeof(v19));
          CMSampleBufferGetPresentationTimeStamp(&v19, v12);
          CMTime time1 = v19;
          CMTime time2 = *a3;
          if ((CMTimeCompare(&time1, &time2) & 0x80000000) == 0) {
            break;
          }
          if (objc_msgSend((id)CMGetAttachment((CMAttachmentBearerRef)objc_msgSend((id)objc_msgSend(*(id *)(v7 + 368), "objectAtIndexedSubscript:", 0), "objectAtIndexedSubscript:", v8 + 1), @"BufferRequiresCuttingInLivePhotoMovie", 0), "BOOLValue"))
          {
            CMTime v28 = v19;
            if (dword_1EB4C5070)
            {
              int v18 = 0;
              os_log_type_t type = OS_LOG_TYPE_DEFAULT;
              os_log_and_send_and_compose_flags_and_os_log_os_log_type_t type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
              fig_log_call_emit_and_clean_up_after_send_and_compose();
            }
            break;
          }
          unint64_t v13 = [v9 count];
          unint64_t v14 = v8 + 2;
          ++v8;
        }
        while (v14 < v13);
      }
      __n128 result = 1;
      if (a4) {
LABEL_22:
      }
        *a4 = v28;
    }
  }
  return result;
}

- (uint64_t)_informDelegateOfSoonToBeEmittedIrisRequestsForTime:(uint64_t)result
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v3 = result;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v4 = *(void **)(result + 432);
    __n128 result = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (result)
    {
      uint64_t v5 = result;
      uint64_t v6 = *(void *)v13;
LABEL_4:
      uint64_t v7 = 0;
      while (1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v12 + 1) + 8 * v7);
        memset(&v11, 0, sizeof(v11));
        [(BWIrisStagingNode *)(CMTime *)v3 _maxPTSForIrisRequest:(uint64_t)&v11];
        CMTime time1 = *a2;
        CMTime v9 = v11;
        __n128 result = CMTimeCompare(&time1, &v9);
        if ((result & 0x80000000) != 0) {
          break;
        }
        if (([*(id *)(v3 + 440) containsObject:v8] & 1) == 0)
        {
          [*(id *)(v3 + 440) addObject:v8];
          [*(id *)(v3 + 584) stagingNode:v3 willEmitIrisRequest:v8];
        }
        if (v5 == ++v7)
        {
          __n128 result = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
          uint64_t v5 = result;
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

- (uint64_t)_sbufHasSmartStyleReversibilityAttachedMedia:(uint64_t)a1
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = 1;
  uint64_t v4 = BWAttachedMediaKeysRequiredBySmartStyleRenderingPipelines(1, 1);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
LABEL_4:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v12 != v7) {
        objc_enumerationMutation(v4);
      }
      CMTime v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
      if ((!BWSmartStyleRenderingShouldBeBypassed(a2)
         || (objc_msgSend(v9, "isEqualToString:", 0x1EFA74840, (void)v11) & 1) == 0)
        && !BWSampleBufferGetAttachedMedia(a2, (uint64_t)v9))
      {
        return 0;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v6) {
          goto LABEL_4;
        }
        return 1;
      }
    }
  }
  return v3;
}

- (void)setStagingQueues:(id)a3
{
  self->_spatialOverCaptureMasterMovieURL = (NSURL *)a3;
}

@end