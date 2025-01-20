@interface BWAttachedMediaTimeMachineSinkNode
+ (void)initialize;
- (BWAttachedMediaTimeMachineSinkNode)initWithTimeMachineCapacity:(int)a3 attachedMediaKeys:(id)a4 metadataKeys:(id)a5 sinkID:(id)a6;
- (CFTypeRef)_newOutputSampleBufferFromSampleBuffer:(__CVBuffer *)a3 pixelBuffer:(uint64_t)a4 additionalMetadata:(CFTypeRef *)a5 formatDescriptionInOut:;
- (CFTypeRef)_newSampleBufferfromSbuf:(uint64_t)a1;
- (id)getMetadataDictionaryForPts:(id *)a3;
- (id)nodeSubType;
- (opaqueCMSampleBuffer)copyAttachedMediaSampleBufferForPts:(id *)a3 attachedMediaKey:(id)a4;
- (uint64_t)_indexOfMetadataClosestToPTS:(uint64_t)a1;
- (uint64_t)_indexOfSampleBufferClosestToPTS:(uint64_t)a3 attachedMediaKey:;
- (void)dealloc;
- (void)didReachEndOfDataForInput:(id)a3;
- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
@end

@implementation BWAttachedMediaTimeMachineSinkNode

+ (void)initialize
{
}

- (BWAttachedMediaTimeMachineSinkNode)initWithTimeMachineCapacity:(int)a3 attachedMediaKeys:(id)a4 metadataKeys:(id)a5 sinkID:(id)a6
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (![a4 count]) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"The attachedMediaKeys array needs to have at least one element" userInfo:0]);
  }
  v27.receiver = self;
  v27.super_class = (Class)BWAttachedMediaTimeMachineSinkNode;
  v11 = [(BWSinkNode *)&v27 initWithSinkID:a6];
  if (v11)
  {
    v12 = [[BWNodeInput alloc] initWithMediaType:1986618469 node:v11];
    [(BWNodeInput *)v12 setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
    v11->_timeMachineCapacity = a3;
    [(BWNode *)v11 addInput:v12];
    v11->_timeMachineFrames = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v11->_timeMachineLock._os_unfair_lock_opaque = 0;
    if (a4)
    {
      v13 = (NSArray *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:a4];
      v11->_attachedMediaKeys = v13;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v23 objects:v28 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v24;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v24 != v16) {
              objc_enumerationMutation(v13);
            }
            v18 = *(void **)(*((void *)&v23 + 1) + 8 * i);
            if (([v18 isEqualToString:@"PrimaryFormat"] & 1) == 0)
            {
              v19 = objc_alloc_init(BWNodeInputMediaConfiguration);
              [(BWNodeInput *)v11->super.super._input formatRequirements];
              [(BWNodeInputMediaConfiguration *)v19 setFormatRequirements:objc_alloc_init((Class)objc_opt_class())];
              [(BWNodeInputMediaConfiguration *)v19 setPassthroughMode:0];
              [(BWNodeInput *)v11->super.super._input setMediaConfiguration:v19 forAttachedMediaKey:v18];
              [(NSMutableDictionary *)v11->_timeMachineFrames setObject:objc_alloc_init(MEMORY[0x1E4F1CA48]) forKeyedSubscript:v18];
            }
          }
          uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v23 objects:v28 count:16];
        }
        while (v15);
      }
      [(BWNodeInputMediaConfiguration *)[(BWNodeInput *)v11->super.super._input primaryMediaConfiguration] setPassthroughMode:0];
      v20 = objc_alloc_init(BWNodeInputMediaConfiguration);
      [(BWNodeInputMediaConfiguration *)v20 setFormatRequirements:objc_alloc_init(BWVideoFormatRequirements)];
      [(BWNodeInputMediaConfiguration *)v20 setPassthroughMode:0];
      [(BWNodeInput *)v11->super.super._input setUnspecifiedAttachedMediaConfiguration:v20];
      if (a5)
      {
        v11->_metadataKeys = (NSArray *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:a5];
        id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        [(NSMutableDictionary *)v11->_timeMachineFrames setObject:v21 forKeyedSubscript:*MEMORY[0x1E4F53070]];
        return v11;
      }
      fig_log_get_emitter();
    }
    else
    {
      fig_log_get_emitter();
    }
    FigDebugAssert3();
  }
  return v11;
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5
{
  if (a3 && a4)
  {
    v5.receiver = self;
    v5.super_class = (Class)BWAttachedMediaTimeMachineSinkNode;
    -[BWNode didSelectFormat:forInput:forAttachedMediaKey:](&v5, sel_didSelectFormat_forInput_forAttachedMediaKey_);
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
}

- (void)dealloc
{
  formatDescription = self->_formatDescription;
  if (formatDescription) {
    CFRelease(formatDescription);
  }
  v4.receiver = self;
  v4.super_class = (Class)BWAttachedMediaTimeMachineSinkNode;
  [(BWSinkNode *)&v4 dealloc];
}

- (id)nodeSubType
{
  return @"AttachedMediaTimeMachine";
}

- (void)didReachEndOfDataForInput:(id)a3
{
  p_timeMachineLock = &self->_timeMachineLock;
  os_unfair_lock_lock(&self->_timeMachineLock);

  self->_timeMachineFrames = 0;
  os_unfair_lock_unlock(p_timeMachineLock);
  v6.receiver = self;
  v6.super_class = (Class)BWAttachedMediaTimeMachineSinkNode;
  [(BWSinkNode *)&v6 didReachEndOfDataForInput:a3];
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  objc_super v4 = a3;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  CFStringRef key = (const __CFString *)*MEMORY[0x1E4F53070];
  objc_super v6 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  uint64_t v7 = *MEMORY[0x1E4F542E0];
  if ((objc_msgSend((id)objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E4F542E0]), "BOOLValue") & 1) == 0)
  {
    AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(v4, @"SynchronizedSlaveFrame");
    if (AttachedMedia)
    {
      v9 = AttachedMedia;
      if (objc_msgSend((id)objc_msgSend((id)CMGetAttachment(AttachedMedia, key, 0), "objectForKeyedSubscript:", v7), "BOOLValue"))objc_super v4 = v9; {
    }
      }
  }
  os_unfair_lock_lock(&self->_timeMachineLock);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  attachedMediaKeys = self->_attachedMediaKeys;
  uint64_t v11 = [(NSArray *)attachedMediaKeys countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v36 != v13) {
          objc_enumerationMutation(attachedMediaKeys);
        }
        uint64_t v15 = *(void *)(*((void *)&v35 + 1) + 8 * i);
        uint64_t v16 = BWSampleBufferGetAttachedMedia(v4, v15);
        if (v16)
        {
          v17 = (opaqueCMSampleBuffer *)v16;
          uint64_t v18 = [(NSMutableDictionary *)self->_timeMachineFrames objectForKeyedSubscript:v15];
          if (!v18) {
            goto LABEL_29;
          }
          v19 = (void *)v18;
          CFTypeRef v20 = -[BWAttachedMediaTimeMachineSinkNode _newSampleBufferfromSbuf:]((uint64_t)self, v17);
          if (!v20) {
            goto LABEL_29;
          }
          id v21 = v20;
          [v19 addObject:v20];
          if ([v19 count] > (unint64_t)self->_timeMachineCapacity) {
            [v19 removeObjectAtIndex:0];
          }
          CFRelease(v21);
        }
      }
      uint64_t v12 = [(NSArray *)attachedMediaKeys countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v12);
  }
  if (self->_metadataKeys)
  {
    CFTypeRef v22 = CMGetAttachment(v4, key, 0);
    if (v22)
    {
      long long v23 = (void *)v22;
      long long v24 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      metadataKeys = self->_metadataKeys;
      uint64_t v26 = [(NSArray *)metadataKeys countByEnumeratingWithState:&v31 objects:v39 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)v32;
        do
        {
          for (uint64_t j = 0; j != v27; ++j)
          {
            if (*(void *)v32 != v28) {
              objc_enumerationMutation(metadataKeys);
            }
            objc_msgSend(v24, "setObject:forKeyedSubscript:", objc_msgSend(v23, "objectForKeyedSubscript:", *(void *)(*((void *)&v31 + 1) + 8 * j)), *(void *)(*((void *)&v31 + 1) + 8 * j));
          }
          uint64_t v27 = [(NSArray *)metadataKeys countByEnumeratingWithState:&v31 objects:v39 count:16];
        }
        while (v27);
      }
      objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_timeMachineFrames, "objectForKeyedSubscript:", key), "addObject:", v24);
      if (objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_timeMachineFrames, "objectForKeyedSubscript:", key), "count") > (unint64_t)self->_timeMachineCapacity)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_timeMachineFrames, "objectForKeyedSubscript:", key), "removeObjectAtIndex:", 0); {
    }
      }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
  }
LABEL_29:
  os_unfair_lock_unlock(&self->_timeMachineLock);
}

- (CFTypeRef)_newSampleBufferfromSbuf:(uint64_t)a1
{
  v23[3] = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  CFTypeRef cf = 0;
  ImageBuffer = CMSampleBufferGetImageBuffer(sbuf);
  uint64_t PixelFormatType = CVPixelBufferGetPixelFormatType(ImageBuffer);
  objc_super v6 = CMSampleBufferGetImageBuffer(sbuf);
  size_t Width = CVPixelBufferGetWidth(v6);
  v8 = CMSampleBufferGetImageBuffer(sbuf);
  size_t Height = CVPixelBufferGetHeight(v8);
  v22[0] = *MEMORY[0x1E4F2EFC0];
  uint64_t v10 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "memoryPool"), "poolIdentifier"));
  uint64_t v11 = *MEMORY[0x1E4F2EFE8];
  v23[0] = v10;
  v23[1] = &unk_1EFAFFC90;
  uint64_t v12 = *MEMORY[0x1E4F2F130];
  v22[1] = v11;
  v22[2] = v12;
  v23[2] = MEMORY[0x1E4F1CC38];
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:3];
  v20[0] = *MEMORY[0x1E4F24D70];
  v21[0] = [NSNumber numberWithUnsignedInt:PixelFormatType];
  v20[1] = *MEMORY[0x1E4F24E10];
  v21[1] = [NSNumber numberWithUnsignedLong:Width];
  v20[2] = *MEMORY[0x1E4F24D08];
  uint64_t v14 = [NSNumber numberWithUnsignedLong:Height];
  v20[3] = *MEMORY[0x1E4F24D20];
  v21[2] = v14;
  v21[3] = v13;
  CFDictionaryRef v15 = (const __CFDictionary *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:4];
  CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], Width, Height, PixelFormatType, v15, (CVPixelBufferRef *)&cf);
  if (!cf) {
    return 0;
  }
  CMSampleBufferGetImageBuffer(sbuf);
  if (CopyPixelBuffer()) {
    CFTypeRef v17 = 0;
  }
  else {
    CFTypeRef v17 = -[BWAttachedMediaTimeMachineSinkNode _newOutputSampleBufferFromSampleBuffer:pixelBuffer:additionalMetadata:formatDescriptionInOut:](a1, sbuf, (__CVBuffer *)cf, v16, (CFTypeRef *)(a1 + 184));
  }
  if (cf) {
    CFRelease(cf);
  }
  return v17;
}

- (id)getMetadataDictionaryForPts:(id *)a3
{
  p_timeMachineLock = &self->_timeMachineLock;
  os_unfair_lock_lock(&self->_timeMachineLock);
  if (self->_metadataKeys
    && (uint64_t v6 = -[NSMutableDictionary objectForKeyedSubscript:](self->_timeMachineFrames, "objectForKeyedSubscript:", *MEMORY[0x1E4F53070])) != 0&& (v7 = (void *)v6, v11 = *a3, v8 = -[BWAttachedMediaTimeMachineSinkNode _indexOfMetadataClosestToPTS:]((uint64_t)self, (CMTime *)&v11), v8 < [v7 count]))
  {
    v9 = (void *)[v7 objectAtIndexedSubscript:v8];
  }
  else
  {
    v9 = 0;
  }
  os_unfair_lock_unlock(p_timeMachineLock);
  return v9;
}

- (uint64_t)_indexOfMetadataClosestToPTS:(uint64_t)a1
{
  uint64_t v2 = a1;
  if (a1)
  {
    memset(&v20, 0, sizeof(v20));
    CMTimeMake(&v20, 1, 1000);
    memset(&v19, 0, sizeof(v19));
    *(_OWORD *)&v13.start.value = *(_OWORD *)&a2->value;
    v13.start.epoch = a2->epoch;
    CMTime rhs = v20;
    CMTimeSubtract(&start, &v13.start, &rhs);
    v13.CMTime start = v20;
    CMTimeMultiply(&duration, &v13.start, 2);
    CMTimeRangeMake(&v19, &start, &duration);
    os_unfair_lock_assert_owner((const os_unfair_lock *)(v2 + 176));
    objc_super v4 = (void *)[*(id *)(v2 + 168) objectForKeyedSubscript:*MEMORY[0x1E4F53070]];
    if ([v4 count])
    {
      uint64_t v5 = 0;
      uint64_t v2 = 0;
      uint64_t v6 = *MEMORY[0x1E4F530C0];
      float v7 = 3.4028e38;
      while (1)
      {
        unint64_t v8 = (void *)[v4 objectAtIndexedSubscript:v5];
        if (v8)
        {
          v9 = v8;
          if ([v8 objectForKeyedSubscript:v6])
          {
            memset(&rhs, 0, sizeof(rhs));
            CMTimeMakeFromDictionary(&rhs, (CFDictionaryRef)[v9 objectForKeyedSubscript:v6]);
            *(_OWORD *)&v13.start.value = *(_OWORD *)&a2->value;
            v13.start.epoch = a2->epoch;
            CMTime time2 = rhs;
            CMTimeSubtract(&time, &v13.start, &time2);
            double Seconds = CMTimeGetSeconds(&time);
            CMTimeRange v13 = v19;
            CMTime time2 = rhs;
            if (CMTimeRangeContainsTime(&v13, &time2)) {
              return v5;
            }
            v13.CMTime start = rhs;
            CMTime time2 = *a2;
            if (!CMTimeCompare(&v13.start, &time2)) {
              return v5;
            }
            float v11 = Seconds;
            if (fabsf(v11) < fabsf(v7))
            {
              uint64_t v2 = v5;
              float v7 = Seconds;
            }
          }
        }
        if (++v5 >= (unint64_t)[v4 count]) {
          return v2;
        }
      }
    }
    return 0;
  }
  return v2;
}

- (opaqueCMSampleBuffer)copyAttachedMediaSampleBufferForPts:(id *)a3 attachedMediaKey:(id)a4
{
  p_timeMachineLock = &self->_timeMachineLock;
  os_unfair_lock_lock(&self->_timeMachineLock);
  uint64_t v8 = [(NSMutableDictionary *)self->_timeMachineFrames objectForKeyedSubscript:a4];
  if (v8
    && (v9 = (void *)v8,
        $3CC8671D27C23BF42ADDB32F2B5E48AE v14 = *a3,
        v10 = -[BWAttachedMediaTimeMachineSinkNode _indexOfSampleBufferClosestToPTS:attachedMediaKey:]((uint64_t)self, (CMTime *)&v14, (uint64_t)a4), v10 < [v9 count])&& (float v11 = (opaqueCMSampleBuffer *)objc_msgSend(v9, "objectAtIndexedSubscript:", v10)) != 0)
  {
    uint64_t v12 = (opaqueCMSampleBuffer *)-[BWAttachedMediaTimeMachineSinkNode _newSampleBufferfromSbuf:]((uint64_t)self, v11);
  }
  else
  {
    uint64_t v12 = 0;
  }
  os_unfair_lock_unlock(p_timeMachineLock);
  return v12;
}

- (uint64_t)_indexOfSampleBufferClosestToPTS:(uint64_t)a3 attachedMediaKey:
{
  if (!a1) {
    return 0;
  }
  memset(&v19, 0, sizeof(v19));
  CMTimeMake(&v19, 1, 1000);
  memset(&v18, 0, sizeof(v18));
  *(_OWORD *)&v12.start.value = *(_OWORD *)&a2->value;
  v12.start.epoch = a2->epoch;
  CMTime rhs = v19;
  CMTimeSubtract(&start, &v12.start, &rhs);
  v12.CMTime start = v19;
  CMTimeMultiply(&duration, &v12.start, 2);
  CMTimeRangeMake(&v18, &start, &duration);
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 176));
  if (!objc_msgSend((id)objc_msgSend(*(id *)(a1 + 168), "objectForKeyedSubscript:", a3), "count")) {
    return 0;
  }
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  float v8 = 3.4028e38;
  while (1)
  {
    memset(&rhs, 0, sizeof(rhs));
    CMSampleBufferGetPresentationTimeStamp(&rhs, (CMSampleBufferRef)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 168), "objectForKeyedSubscript:", a3), "objectAtIndexedSubscript:", v6));
    *(_OWORD *)&v12.start.value = *(_OWORD *)&a2->value;
    v12.start.epoch = a2->epoch;
    CMTime time2 = rhs;
    CMTimeSubtract(&time, &v12.start, &time2);
    double Seconds = CMTimeGetSeconds(&time);
    CMTimeRange v12 = v18;
    CMTime time2 = rhs;
    if (CMTimeRangeContainsTime(&v12, &time2)) {
      break;
    }
    v12.CMTime start = rhs;
    CMTime time2 = *a2;
    if (!CMTimeCompare(&v12.start, &time2)) {
      break;
    }
    float v10 = Seconds;
    if (fabsf(v10) < fabsf(v8))
    {
      uint64_t v7 = v6;
      float v8 = Seconds;
    }
    if (++v6 >= (unint64_t)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 168), "objectForKeyedSubscript:", a3), "count"))return v7; {
  }
    }
  return v6;
}

- (CFTypeRef)_newOutputSampleBufferFromSampleBuffer:(__CVBuffer *)a3 pixelBuffer:(uint64_t)a4 additionalMetadata:(CFTypeRef *)a5 formatDescriptionInOut:
{
  if (!a1) {
    return 0;
  }
  CFTypeRef v6 = 0;
  CFTypeRef cf = 0;
  if (a2 && a3)
  {
    int CopyWithNewPixelBuffer = BWCMSampleBufferCreateCopyWithNewPixelBuffer(a2, a3, a5, (CMSampleBufferRef *)&cf);
    CFTypeRef v6 = cf;
    if (!CopyWithNewPixelBuffer)
    {
      int CopyWithNewPixelBuffer = BWCMSampleBufferCopyMetadataToSampleBuffer(a2, cf);
      CFTypeRef v6 = cf;
    }
    if (CopyWithNewPixelBuffer && v6)
    {
      CFRelease(v6);
      return 0;
    }
  }
  return v6;
}

@end