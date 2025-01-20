@interface BWSynchronizerNode
+ (void)initialize;
- (BWSynchronizerNode)initWithMediaType:(unsigned int)a3;
- (CMSampleBufferRef)_newRetimedVideoSampleBuffer:(int)a3 updatePTSSyncHistory:;
- (OpaqueCMClock)masterClock;
- (OpaqueCMClock)sourceClock;
- (__n128)_updatePTSSyncHistoryWithSourceTime:(__n128 *)a3 syncedTime:;
- (id)nodeSubType;
- (id)nodeType;
- (uint64_t)_synchronizeDetectedFaces:(void *)a3 metadata:(int32_t)a4 timescale:;
- (void)_getSyncedTimeForSourceTime:(uint64_t)a3@<X8>;
- (void)dealloc;
- (void)didSelectFormat:(id)a3 forInput:(id)a4;
- (void)handleDroppedSample:(id)a3 forInput:(id)a4;
- (void)prepareForCurrentConfigurationToBecomeLive;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
- (void)setMasterClock:(OpaqueCMClock *)a3;
- (void)setSourceClock:(OpaqueCMClock *)a3;
@end

@implementation BWSynchronizerNode

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
}

- (id)nodeType
{
  return @"Effect";
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  if (!self->_masterClock || !self->_sourceClock) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"master and source clock must be set" userInfo:0]);
  }
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  v5 = a3;
  if (!a3)
  {
    fig_log_get_emitter();
    uint64_t v11 = v4;
    LODWORD(v10) = 0;
    FigDebugAssert3();
    goto LABEL_3;
  }
  if (FigCFEqual())
  {
LABEL_3:
    CMSampleBufferRef v7 = 0;
LABEL_4:
    CMSampleBufferRef v8 = 0;
    goto LABEL_11;
  }
  CMSampleBufferRef v7 = -[BWSynchronizerNode _newRetimedVideoSampleBuffer:updatePTSSyncHistory:]((CMSampleBufferRef)self, v5, 1);
  if (!v7)
  {
    fig_log_get_emitter();
    uint64_t v11 = v4;
    LODWORD(v10) = 0;
    FigDebugAssert3();
    goto LABEL_4;
  }
  AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(v5, @"SynchronizedSlaveFrame");
  if (!AttachedMedia)
  {
    CMSampleBufferRef v8 = 0;
    goto LABEL_10;
  }
  CMSampleBufferRef v8 = -[BWSynchronizerNode _newRetimedVideoSampleBuffer:updatePTSSyncHistory:]((CMSampleBufferRef)self, AttachedMedia, 0);
  if (v8)
  {
    BWSampleBufferSetAttachedMedia(v7, @"SynchronizedSlaveFrame", (uint64_t)v8);
LABEL_10:
    BWSynchronizeSmartStyleAttachedMediaPTS(v7);
    v5 = v7;
    goto LABEL_11;
  }
  fig_log_get_emitter();
  uint64_t v11 = v4;
  LODWORD(v10) = 0;
  FigDebugAssert3();
LABEL_11:
  -[BWNodeOutput emitSampleBuffer:](self->super._output, "emitSampleBuffer:", v5, v10, v11);
  if (v7) {
    CFRelease(v7);
  }
  if (v8)
  {
    CFRelease(v8);
  }
}

- (CMSampleBufferRef)_newRetimedVideoSampleBuffer:(int)a3 updatePTSSyncHistory:
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  uint64_t v28 = (uint64_t)result;
  if (result)
  {
    CMSampleBufferRef sampleBufferOut = 0;
    memset(&timingArrayOut, 0, sizeof(timingArrayOut));
    memset(&v41, 0, sizeof(v41));
    if (CMSampleBufferGetSampleTimingInfoArray(sbuf, 1, &timingArrayOut, 0))
    {
      fig_log_get_emitter();
    }
    else
    {
      CMTime presentationTimeStamp = timingArrayOut.presentationTimeStamp;
      if (timingArrayOut.duration.flags)
      {
        CMTime lhs = timingArrayOut.duration;
        CMTime rhs = timingArrayOut.presentationTimeStamp;
        CMTimeAdd(&v41, &lhs, &rhs);
      }
      if (timingArrayOut.presentationTimeStamp.flags)
      {
        CMTime lhs = timingArrayOut.presentationTimeStamp;
        v5 = *(const void **)(v28 + 96);
        v6 = *(const void **)(v28 + 104);
        CMTime time = timingArrayOut.presentationTimeStamp;
        CMSyncConvertTime(&rhs, &time, v5, v6);
        timingArrayOut.CMTime presentationTimeStamp = rhs;
        if (a3)
        {
          CMTime rhs = lhs;
          CMTime time = timingArrayOut.presentationTimeStamp;
          -[BWSynchronizerNode _updatePTSSyncHistoryWithSourceTime:syncedTime:](v28, &rhs, (__n128 *)&time);
        }
      }
      if (timingArrayOut.decodeTimeStamp.flags)
      {
        CMSampleBufferRef v7 = *(const void **)(v28 + 96);
        CMSampleBufferRef v8 = *(const void **)(v28 + 104);
        CMTime rhs = timingArrayOut.decodeTimeStamp;
        CMSyncConvertTime(&lhs, &rhs, v7, v8);
        timingArrayOut.decodeTimeStamp = lhs;
      }
      if (timingArrayOut.duration.flags)
      {
        v9 = *(const void **)(v28 + 96);
        uint64_t v10 = *(const void **)(v28 + 104);
        CMTime rhs = v41;
        CMSyncConvertTime(&lhs, &rhs, v9, v10);
        CMTime v41 = lhs;
        CMTime rhs = lhs;
        CMTime time = timingArrayOut.presentationTimeStamp;
        CMTimeSubtract(&lhs, &rhs, &time);
        timingArrayOut.duration = lhs;
      }
      CFAllocatorRef v11 = CFGetAllocator(sbuf);
      if (!CMSampleBufferCreateCopyWithNewTiming(v11, sbuf, 1, &timingArrayOut, &sampleBufferOut))
      {
        CFAllocatorRef v12 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
        CMTime lhs = presentationTimeStamp;
        CFDictionaryRef v13 = CMTimeCopyAsDictionary(&lhs, v12);
        CMSetAttachment(sampleBufferOut, (CFStringRef)*MEMORY[0x1E4F530C0], v13, 1u);
        CFRelease(v13);
        v14 = (void *)CMGetAttachment(sbuf, (CFStringRef)*MEMORY[0x1E4F53070], 0);
        if (v14)
        {
          v15 = v14;
          v16 = (void *)[v14 objectForKeyedSubscript:*MEMORY[0x1E4F558C8]];
          if (v16)
          {
            v17 = v16;
            if ([v16 count])
            {
              CMSampleBufferGetPresentationTimeStamp(&v36, sbuf);
              -[BWSynchronizerNode _synchronizeDetectedFaces:metadata:timescale:](v28, v17, v15, v36.timescale);
            }
          }
          v18 = (void *)[v15 objectForKeyedSubscript:*MEMORY[0x1E4F53DC8]];
          long long v32 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          long long v35 = 0u;
          uint64_t v19 = [v18 countByEnumeratingWithState:&v32 objects:v44 count:16];
          if (v19)
          {
            uint64_t v20 = v19;
            uint64_t v21 = *(void *)v33;
            uint64_t v22 = *MEMORY[0x1E4F54348];
            uint64_t v23 = *MEMORY[0x1E4F53900];
            do
            {
              for (uint64_t i = 0; i != v20; ++i)
              {
                if (*(void *)v33 != v21) {
                  objc_enumerationMutation(v18);
                }
                uint64_t v25 = *(void *)(*((void *)&v32 + 1) + 8 * i);
                memset(&lhs, 0, sizeof(lhs));
                objc_msgSend((id)objc_msgSend((id)objc_msgSend(v18, "objectForKeyedSubscript:", v25), "objectForKeyedSubscript:", v22), "longLongValue");
                int64_t v26 = FigHostTimeToNanoseconds();
                CMTimeMake(&v31, v26, 1000000000);
                CMSampleBufferGetPresentationTimeStamp(&v30, sbuf);
                CMTimeConvertScale(&lhs, &v31, v30.timescale, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
                memset(&rhs, 0, sizeof(rhs));
                CMTime time = lhs;
                [(BWSynchronizerNode *)v28 _getSyncedTimeForSourceTime:(uint64_t)&rhs];
                CMTime time = rhs;
                CMTimeConvertScale(&v29, &time, 1000000000, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
                uint64_t v27 = [NSNumber numberWithLongLong:FigNanosecondsToHostTime()];
                objc_msgSend((id)objc_msgSend(v18, "objectForKeyedSubscript:", v25), "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(v18, "objectForKeyedSubscript:", v25), "objectForKeyedSubscript:", v22), v23);
                objc_msgSend((id)objc_msgSend(v18, "objectForKeyedSubscript:", v25), "setObject:forKeyedSubscript:", v27, v22);
              }
              uint64_t v20 = [v18 countByEnumeratingWithState:&v32 objects:v44 count:16];
            }
            while (v20);
          }
        }
        return sampleBufferOut;
      }
      fig_log_get_emitter();
    }
    FigDebugAssert3();
    if (sampleBufferOut)
    {
      CFRelease(sampleBufferOut);
      return 0;
    }
    return sampleBufferOut;
  }
  return result;
}

- (__n128)_updatePTSSyncHistoryWithSourceTime:(__n128 *)a3 syncedTime:
{
  if (a1)
  {
    if (*(_DWORD *)(a1 + 880) == -1) {
      goto LABEL_12;
    }
    v6 = (CMTime *)(a1 + 112 + 48 * *(int *)(a1 + 884));
    CMTime time1 = *a2;
    CMTime v23 = *v6;
    int32_t v7 = CMTimeCompare(&time1, &v23);
    if (!v7) {
      return result;
    }
    if (v7 < 0)
    {
LABEL_12:
      *(_DWORD *)(a1 + 880) = 0;
      *(_DWORD *)(a1 + 884) = 0;
    }
    else
    {
      int v9 = *(_DWORD *)(a1 + 884) + 1;
      int v10 = v9 & 0xF;
      int v12 = -v9;
      BOOL v11 = v12 < 0;
      int v13 = v12 & 0xF;
      if (v11) {
        int v14 = v10;
      }
      else {
        int v14 = -v13;
      }
      *(_DWORD *)(a1 + 884) = v14;
      int v15 = *(_DWORD *)(a1 + 884);
      if (v15 == *(_DWORD *)(a1 + 880))
      {
        int v16 = v15 + 1;
        BOOL v11 = -v16 < 0;
        int v17 = -v16 & 0xF;
        int v18 = v16 & 0xF;
        if (!v11) {
          int v18 = -v17;
        }
        *(_DWORD *)(a1 + 880) = v18;
      }
    }
    uint64_t v19 = a1 + 112 + 48 * *(int *)(a1 + 884);
    CMTimeEpoch epoch = a2->epoch;
    *(_OWORD *)uint64_t v19 = *(_OWORD *)&a2->value;
    *(void *)(v19 + 16) = epoch;
    uint64_t v21 = a1 + 112 + 48 * *(int *)(a1 + 884);
    unint64_t v22 = a3[1].n128_u64[0];
    __n128 result = *a3;
    *(__n128 *)(v21 + 24) = *a3;
    *(void *)(v21 + 40) = v22;
  }
  return result;
}

- (void)_getSyncedTimeForSourceTime:(uint64_t)a3@<X8>
{
  if (a1)
  {
    if (*(_DWORD *)(a1 + 880) == -1)
    {
LABEL_15:
      int v15 = *(const void **)(a1 + 96);
      int v16 = *(const void **)(a1 + 104);
      CMTime time1 = *a2;
      CMSyncConvertTime((CMTime *)a3, &time1, v15, v16);
    }
    else
    {
      int v6 = *(_DWORD *)(a1 + 884);
      int v7 = -1;
      while (1)
      {
        int v8 = v6;
        CMTime time1 = *a2;
        CMTime time2 = *(CMTime *)(a1 + 112 + 48 * v6);
        int32_t v9 = CMTimeCompare(&time1, &time2);
        if (!v9) {
          goto LABEL_13;
        }
        if (v9 >= 1) {
          break;
        }
        if (v6 >= 1) {
          int v10 = -1;
        }
        else {
          int v10 = 15;
        }
        int v7 = v6;
        v6 += v10;
        if (v8 == *(_DWORD *)(a1 + 880)) {
          goto LABEL_15;
        }
      }
      if (v7 == -1) {
        goto LABEL_15;
      }
      CMTime time1 = *(CMTime *)(a1 + 112 + 48 * v6);
      double Seconds = CMTimeGetSeconds(&time1);
      CMTime time1 = *(CMTime *)(a1 + 112 + 48 * v7);
      double v12 = CMTimeGetSeconds(&time1);
      CMTime time1 = *a2;
      double v13 = (CMTimeGetSeconds(&time1) - Seconds) / (v12 - Seconds);
      if (v13 < 0.01)
      {
LABEL_13:
        uint64_t v14 = a1 + 112 + 48 * v6;
LABEL_14:
        *(_OWORD *)a3 = *(_OWORD *)(v14 + 24);
        *(void *)(a3 + 16) = *(void *)(v14 + 40);
        return;
      }
      uint64_t v17 = a1 + 112;
      if (v13 > 0.99)
      {
        uint64_t v14 = v17 + 48 * v7;
        goto LABEL_14;
      }
      CMTime time1 = *(CMTime *)(v17 + 48 * v6 + 24);
      double v18 = CMTimeGetSeconds(&time1);
      CMTime time1 = *(CMTime *)(a1 + 112 + 48 * v7 + 24);
      Float64 v19 = CMTimeGetSeconds(&time1);
      uint64_t v20 = (CMTime *)(a1 + 112 + 48 * v6);
      int32_t timescale = v20[1].timescale;
      *(void *)(a3 + 8) = 0;
      *(void *)(a3 + 16) = 0;
      *(void *)a3 = 0;
      CMTimeMake(&rhs, (uint64_t)(v13 * (v19 - v18) * (double)timescale), timescale);
      CMTime time1 = v20[1];
      CMTimeAdd((CMTime *)a3, &time1, &rhs);
    }
  }
  else
  {
    *(void *)a3 = 0;
    *(void *)(a3 + 8) = 0;
    *(void *)(a3 + 16) = 0;
  }
}

- (void)handleDroppedSample:(id)a3 forInput:(id)a4
{
  if (FigCFEqual()) {
    goto LABEL_2;
  }
  memset(&v13, 0, sizeof(v13));
  if (a3) {
    [a3 pts];
  }
  memset(&v12, 0, sizeof(v12));
  sourceClock = self->_sourceClock;
  masterClock = self->_masterClock;
  CMTime time = v13;
  CMSyncConvertTime(&v12, &time, sourceClock, masterClock);
  CMTime time = v13;
  CMTime v10 = v12;
  if (!CMTimeCompare(&time, &v10))
  {
LABEL_2:
    [(BWNodeOutput *)self->super._output emitDroppedSample:a3];
  }
  else
  {
    uint64_t v8 = [a3 reason];
    CMTime time = v12;
    id v9 = +[BWDroppedSample newDroppedSampleWithReason:v8 pts:&time];
    [(BWNodeOutput *)self->super._output emitDroppedSample:v9];
  }
}

- (void)setSourceClock:(OpaqueCMClock *)a3
{
  sourceClock = self->_sourceClock;
  self->_sourceClock = a3;
  if (a3) {
    CFRetain(a3);
  }
  if (sourceClock)
  {
    CFRelease(sourceClock);
  }
}

- (BWSynchronizerNode)initWithMediaType:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v10.receiver = self;
  v10.super_class = (Class)BWSynchronizerNode;
  uint64_t v4 = [(BWNode *)&v10 init];
  if (v4)
  {
    v5 = [[BWNodeInput alloc] initWithMediaType:v3 node:v4];
    if (v3 == 1986618469)
    {
      int v6 = objc_alloc_init(BWVideoFormatRequirements);
      [(BWNodeInput *)v5 setFormatRequirements:v6];
    }
    [(BWNodeInput *)v5 setPassthroughMode:1];
    [(BWNode *)v4 addInput:v5];

    int v7 = [[BWNodeOutput alloc] initWithMediaType:v3 node:v4];
    if (v3 == 1986618469)
    {
      uint64_t v8 = objc_alloc_init(BWVideoFormatRequirements);
      [(BWNodeOutput *)v7 setFormatRequirements:v8];
    }
    [(BWNodeOutput *)v7 setPassthroughMode:1];
    [(BWNodeOutput *)v7 setDropsSampleBuffersWithUnexpectedPTS:1];
    v4->_oldestPTSSyncHistoryElement = -1;
    v4->_newestPTSSyncHistoryElement = -1;
    [(BWNode *)v4 addOutput:v7];
  }
  return v4;
}

- (void)setMasterClock:(OpaqueCMClock *)a3
{
  masterClock = self->_masterClock;
  self->_masterClock = a3;
  if (a3) {
    CFRetain(a3);
  }
  if (masterClock)
  {
    CFRelease(masterClock);
  }
}

+ (void)initialize
{
}

- (void)dealloc
{
  sourceClock = self->_sourceClock;
  if (sourceClock) {
    CFRelease(sourceClock);
  }
  masterClock = self->_masterClock;
  if (masterClock) {
    CFRelease(masterClock);
  }
  v5.receiver = self;
  v5.super_class = (Class)BWSynchronizerNode;
  [(BWNode *)&v5 dealloc];
}

- (OpaqueCMClock)sourceClock
{
  sourceClock = self->_sourceClock;
  if (sourceClock)
  {
    CFRetain(self->_sourceClock);
    CFAutorelease(sourceClock);
  }
  return sourceClock;
}

- (OpaqueCMClock)masterClock
{
  masterClock = self->_masterClock;
  if (masterClock)
  {
    CFRetain(self->_masterClock);
    CFAutorelease(masterClock);
  }
  return masterClock;
}

- (id)nodeSubType
{
  return @"GenericSynchronizer";
}

- (uint64_t)_synchronizeDetectedFaces:(void *)a3 metadata:(int32_t)a4 timescale:
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v19 = result;
  if (result)
  {
    objc_super v5 = a2;
    int v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(a2, "count"));
    CMTime v33 = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F8];
    CMTime v32 = v33;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v7 = [v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v29;
      uint64_t v10 = *MEMORY[0x1E4F54348];
      uint64_t v20 = *MEMORY[0x1E4F53900];
      uint64_t v21 = v5;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v29 != v9) {
            objc_enumerationMutation(v5);
          }
          CMTime v12 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          CMTime v13 = (void *)[v12 objectForKeyedSubscript:v10];
          if (!v13) {
            goto LABEL_14;
          }
          uint64_t v14 = v13;
          memset(&v27, 0, sizeof(v27));
          [v13 longLongValue];
          int64_t v15 = FigHostTimeToNanoseconds();
          CMTimeMake(&time, v15, 1000000000);
          CMTimeConvertScale(&v27, &time, a4, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
          if ((v27.flags & 1) == 0) {
            goto LABEL_14;
          }
          memset(&v25, 0, sizeof(v25));
          CMTime time1 = v33;
          CMTime time2 = v27;
          if (CMTimeCompare(&time1, &time2))
          {
            CMTime time1 = v27;
            [(BWSynchronizerNode *)v19 _getSyncedTimeForSourceTime:(uint64_t)&v25];
            CMTime v33 = v27;
            CMTime v32 = v25;
          }
          else
          {
            CMTime v25 = v32;
          }
          CMTime time1 = v25;
          CMTimeConvertScale(&v22, &time1, 1000000000, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
          uint64_t v16 = [NSNumber numberWithLongLong:FigNanosecondsToHostTime()];
          uint64_t v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v12, "count") + 1);
          [v17 addEntriesFromDictionary:v12];
          [v17 setObject:v16 forKeyedSubscript:v10];
          [v17 setObject:v14 forKeyedSubscript:v20];
          objc_super v5 = v21;
          if (v17)
          {
            [v6 addObject:v17];
          }
          else
          {
LABEL_14:
            [v6 addObject:v12];
          }
        }
        uint64_t v8 = [v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
      }
      while (v8);
    }
    return [a3 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F558C8]];
  }
  return result;
}

@end