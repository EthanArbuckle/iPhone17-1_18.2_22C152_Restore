@interface BWMotionDataTimeMachine
+ (void)initialize;
- (BOOL)synchronizedSlaveMotionDataCachingEnabled;
- (BWMotionDataTimeMachine)initWithCapacity:(unint64_t)a3 synchronizedSlaveMotionDataCachingEnabled:(BOOL)a4 cacheEntireMetadataDictionary:(BOOL)a5;
- (id)copyMotionDataForSerialNumber:(unint64_t)a3;
- (id)copyMotionDataForStartingSerialNumber:(unint64_t)a3 endingSerialNumber:(unint64_t)a4;
- (unint64_t)addMotionDataToCacheForSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (unint64_t)earliestAvailableMotionDataSerialNumber;
- (unint64_t)latestAvailableMotionDataSerialNumber;
- (void)_copyMotionDataForSampleBuffer:(uint64_t)a1;
- (void)dealloc;
@end

@implementation BWMotionDataTimeMachine

- (BWMotionDataTimeMachine)initWithCapacity:(unint64_t)a3 synchronizedSlaveMotionDataCachingEnabled:(BOOL)a4 cacheEntireMetadataDictionary:(BOOL)a5
{
  v27[27] = *MEMORY[0x1E4F143B8];
  if (!a3) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Capacity must be non-zero" userInfo:0]);
  }
  v25.receiver = self;
  v25.super_class = (Class)BWMotionDataTimeMachine;
  v8 = [(BWMotionDataTimeMachine *)&v25 init];
  if (v8)
  {
    v8->_cache = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a3];
    v8->_capacity = a3;
    v8->_synchronizedSlaveMotionDataCachingEnabled = a4;
    v8->_cacheEntireMetadataDictionary = a5;
    v8->_propertyMutex = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
    id v9 = objc_alloc(MEMORY[0x1E4F1C978]);
    uint64_t v10 = *MEMORY[0x1E4F53D98];
    v27[0] = *MEMORY[0x1E4F54128];
    v27[1] = v10;
    uint64_t v11 = *MEMORY[0x1E4F54130];
    v27[2] = *MEMORY[0x1E4F54118];
    v27[3] = v11;
    uint64_t v12 = *MEMORY[0x1E4F53E30];
    v27[4] = *MEMORY[0x1E4F53CD8];
    v27[5] = v12;
    uint64_t v13 = *MEMORY[0x1E4F54218];
    v27[6] = *MEMORY[0x1E4F53F90];
    v27[7] = v13;
    uint64_t v14 = *MEMORY[0x1E4F54158];
    v27[8] = *MEMORY[0x1E4F54358];
    v27[9] = v14;
    uint64_t v15 = *MEMORY[0x1E4F54168];
    v27[10] = *MEMORY[0x1E4F54198];
    v27[11] = v15;
    uint64_t v16 = *MEMORY[0x1E4F54220];
    v27[12] = *MEMORY[0x1E4F54160];
    v27[13] = v16;
    uint64_t v17 = *MEMORY[0x1E4F53F78];
    v27[14] = *MEMORY[0x1E4F54108];
    v27[15] = v17;
    uint64_t v18 = *MEMORY[0x1E4F55D18];
    v27[16] = *MEMORY[0x1E4F54370];
    v27[17] = v18;
    uint64_t v19 = *MEMORY[0x1E4F53E48];
    v27[18] = *MEMORY[0x1E4F54280];
    v27[19] = v19;
    uint64_t v20 = *MEMORY[0x1E4F55D10];
    v27[20] = *MEMORY[0x1E4F53EE8];
    v27[21] = v20;
    uint64_t v21 = *MEMORY[0x1E4F55D08];
    v27[22] = *MEMORY[0x1E4F53F98];
    v27[23] = v21;
    uint64_t v22 = *MEMORY[0x1E4F54148];
    v27[24] = *MEMORY[0x1E4F53260];
    v27[25] = v22;
    v27[26] = *MEMORY[0x1E4F540F0];
    v8->_motionMetadataKeys = (NSArray *)objc_msgSend(v9, "initWithArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v27, 27));
    id v23 = objc_alloc(MEMORY[0x1E4F1C978]);
    v26[0] = *MEMORY[0x1E4F530C0];
    v26[1] = 0x1EFA40A00;
    v8->_sampleBufferAttachmentKeys = (NSArray *)objc_msgSend(v23, "initWithArray:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v26, 2));
  }
  return v8;
}

- (unint64_t)addMotionDataToCacheForSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  v5 = -[BWMotionDataTimeMachine _copyMotionDataForSampleBuffer:]((uint64_t)self, a3);
  if (self->_synchronizedSlaveMotionDataCachingEnabled)
  {
    AttachedMedia = (void *)BWSampleBufferGetAttachedMedia(a3, 0x1EFA742E0);
    if (AttachedMedia
      || (AttachedMedia = (void *)BWSampleBufferGetAttachedMedia(a3, @"SynchronizedSlaveFrame")) != 0)
    {
      id v7 = -[BWMotionDataTimeMachine _copyMotionDataForSampleBuffer:]((uint64_t)self, AttachedMedia);
    }
    else
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    v8 = v7;
  }
  else
  {
    v8 = 0;
    AttachedMedia = 0;
  }
  pthread_mutex_lock((pthread_mutex_t *)self->_propertyMutex);
  unint64_t earliestAvailableMotionDataSerialNumber = self->_earliestAvailableMotionDataSerialNumber;
  unint64_t latestAvailableMotionDataSerialNumber = self->_latestAvailableMotionDataSerialNumber;
  unint64_t v11 = latestAvailableMotionDataSerialNumber + 1;
  self->_unint64_t latestAvailableMotionDataSerialNumber = latestAvailableMotionDataSerialNumber + 1;
  if (earliestAvailableMotionDataSerialNumber)
  {
    if (latestAvailableMotionDataSerialNumber - earliestAvailableMotionDataSerialNumber + 2 > self->_capacity)
    {
      [(NSMutableArray *)self->_cache removeObjectAtIndex:0];
      unint64_t v11 = self->_latestAvailableMotionDataSerialNumber;
      ++self->_earliestAvailableMotionDataSerialNumber;
    }
  }
  else
  {
    self->_unint64_t earliestAvailableMotionDataSerialNumber = v11;
  }
  uint64_t v12 = [NSNumber numberWithUnsignedLongLong:v11];
  uint64_t v13 = *MEMORY[0x1E4F55720];
  [v5 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F55720]];
  objc_msgSend(v8, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", v11), v13);
  uint64_t v14 = *MEMORY[0x1E4F52F98];
  uint64_t v15 = BWSampleBufferGetAttachedMedia(a3, *MEMORY[0x1E4F52F98]);
  uint64_t v16 = (CFStringRef *)MEMORY[0x1E4F53070];
  if (v15)
  {
    uint64_t v17 = (const void *)v15;
    uint64_t v18 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0);
    CMSetAttachment(v17, (CFStringRef)*MEMORY[0x1E4F53148], (CFTypeRef)[v18 objectForKeyedSubscript:*MEMORY[0x1E4F53500]], 1u);
    [v5 setObject:v17 forKeyedSubscript:v14];
    if (v18) {
      objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E4F534F0]), *MEMORY[0x1E4F534F0]);
    }
  }
  if (AttachedMedia)
  {
    uint64_t v19 = BWSampleBufferGetAttachedMedia(AttachedMedia, v14);
    if (v19)
    {
      [v8 setObject:v19 forKeyedSubscript:v14];
      uint64_t v20 = (void *)CMGetAttachment(AttachedMedia, *v16, 0);
      if (v20) {
        objc_msgSend(v8, "setObject:forKeyedSubscript:", objc_msgSend(v20, "objectForKeyedSubscript:", *MEMORY[0x1E4F534F0]), *MEMORY[0x1E4F534F0]);
      }
    }
  }
  id v21 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  if (v8) {
    uint64_t v22 = objc_msgSend(v21, "initWithObjectsAndKeys:", v5, BWMotionDataTimeMachineKeyPrimaryMotionData, v8, BWMotionDataTimeMachineKeySynchronizedSlaveFrameMotionData, 0);
  }
  else {
    uint64_t v22 = objc_msgSend(v21, "initWithObjectsAndKeys:", v5, BWMotionDataTimeMachineKeyPrimaryMotionData, 0, v25, v26);
  }
  id v23 = (void *)v22;
  [(NSMutableArray *)self->_cache addObject:v22];
  pthread_mutex_unlock((pthread_mutex_t *)self->_propertyMutex);

  return v11;
}

- (void)_copyMotionDataForSampleBuffer:(uint64_t)a1
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  v4 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0);
  int v5 = *(unsigned __int8 *)(a1 + 57);
  id v6 = objc_alloc(MEMORY[0x1E4F1CA60]);
  if (v5)
  {
    id v7 = (void *)[v6 initWithDictionary:v4];
  }
  else
  {
    id v7 = (void *)[v6 initWithCapacity:0];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v8 = *(void **)(a1 + 16);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v33 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v32 + 1) + 8 * i);
          uint64_t v14 = [v4 objectForKeyedSubscript:v13];
          if (v14) {
            [v7 setObject:v14 forKeyedSubscript:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v32 objects:v37 count:16];
      }
      while (v10);
    }
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v15 = *(void **)(a1 + 24);
  uint64_t v16 = [v15 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v29;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v29 != v18) {
          objc_enumerationMutation(v15);
        }
        CFStringRef v20 = *(const __CFString **)(*((void *)&v28 + 1) + 8 * j);
        CFTypeRef v21 = CMGetAttachment(target, v20, 0);
        if (v21) {
          [v7 setObject:v21 forKeyedSubscript:v20];
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v17);
  }
  uint64_t v22 = *MEMORY[0x1E4F530C0];
  if (![v7 objectForKeyedSubscript:*MEMORY[0x1E4F530C0]])
  {
    memset(&v27, 0, sizeof(v27));
    CMSampleBufferGetPresentationTimeStamp(&v27, (CMSampleBufferRef)target);
    CFAllocatorRef v23 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CMTime v26 = v27;
    CFDictionaryRef v24 = CMTimeCopyAsDictionary(&v26, v23);
    [v7 setObject:v24 forKeyedSubscript:v22];
    if (v24) {
      CFRelease(v24);
    }
  }
  return v7;
}

+ (void)initialize
{
}

- (void)dealloc
{
  FigSimpleMutexDestroy();
  v3.receiver = self;
  v3.super_class = (Class)BWMotionDataTimeMachine;
  [(BWMotionDataTimeMachine *)&v3 dealloc];
}

- (BOOL)synchronizedSlaveMotionDataCachingEnabled
{
  return self->_synchronizedSlaveMotionDataCachingEnabled;
}

- (unint64_t)earliestAvailableMotionDataSerialNumber
{
  pthread_mutex_lock((pthread_mutex_t *)self->_propertyMutex);
  unint64_t earliestAvailableMotionDataSerialNumber = self->_earliestAvailableMotionDataSerialNumber;
  pthread_mutex_unlock((pthread_mutex_t *)self->_propertyMutex);
  return earliestAvailableMotionDataSerialNumber;
}

- (unint64_t)latestAvailableMotionDataSerialNumber
{
  pthread_mutex_lock((pthread_mutex_t *)self->_propertyMutex);
  unint64_t latestAvailableMotionDataSerialNumber = self->_latestAvailableMotionDataSerialNumber;
  pthread_mutex_unlock((pthread_mutex_t *)self->_propertyMutex);
  return latestAvailableMotionDataSerialNumber;
}

- (id)copyMotionDataForSerialNumber:(unint64_t)a3
{
  pthread_mutex_lock((pthread_mutex_t *)self->_propertyMutex);
  unint64_t earliestAvailableMotionDataSerialNumber = self->_earliestAvailableMotionDataSerialNumber;
  if (a3 < earliestAvailableMotionDataSerialNumber || self->_latestAvailableMotionDataSerialNumber < a3)
  {
    pthread_mutex_unlock((pthread_mutex_t *)self->_propertyMutex);
    return 0;
  }
  id v7 = (id)[(NSMutableArray *)self->_cache objectAtIndexedSubscript:a3 - earliestAvailableMotionDataSerialNumber];
  pthread_mutex_unlock((pthread_mutex_t *)self->_propertyMutex);
  if (!v7) {
    return 0;
  }
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v7];

  return v8;
}

- (id)copyMotionDataForStartingSerialNumber:(unint64_t)a3 endingSerialNumber:(unint64_t)a4
{
  unint64_t v4 = a4 - a3;
  if (a4 < a3)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
  pthread_mutex_lock((pthread_mutex_t *)self->_propertyMutex);
  unint64_t earliestAvailableMotionDataSerialNumber = self->_earliestAvailableMotionDataSerialNumber;
  BOOL v9 = a3 >= earliestAvailableMotionDataSerialNumber;
  unint64_t v10 = a3 - earliestAvailableMotionDataSerialNumber;
  if (v9 && self->_latestAvailableMotionDataSerialNumber >= a4)
  {
    unint64_t v15 = v4 + 1;
    uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v15];
    if (self->_synchronizedSlaveMotionDataCachingEnabled) {
      uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v15];
    }
    else {
      uint64_t v12 = 0;
    }
    if (v10 < v10 + v15)
    {
      do
      {
        uint64_t v16 = (void *)[(NSMutableArray *)self->_cache objectAtIndexedSubscript:v10];
        id v17 = objc_alloc(MEMORY[0x1E4F1CA60]);
        uint64_t v18 = objc_msgSend(v17, "initWithDictionary:", objc_msgSend(v16, "objectForKeyedSubscript:", BWMotionDataTimeMachineKeyPrimaryMotionData));
        [v11 addObject:v18];

        if (self->_synchronizedSlaveMotionDataCachingEnabled)
        {
          id v19 = objc_alloc(MEMORY[0x1E4F1CA60]);
          CFStringRef v20 = objc_msgSend(v19, "initWithDictionary:", objc_msgSend(v16, "objectForKeyedSubscript:", BWMotionDataTimeMachineKeySynchronizedSlaveFrameMotionData));
          [v12 addObject:v20];
        }
        ++v10;
        --v15;
      }
      while (v15);
    }
    pthread_mutex_unlock((pthread_mutex_t *)self->_propertyMutex);
    if (v11)
    {
      id v21 = objc_alloc(MEMORY[0x1E4F1C9E8]);
      if (v12) {
        uint64_t v22 = objc_msgSend(v21, "initWithObjectsAndKeys:", v11, BWMotionDataTimeMachineKeyPrimaryMotionData, v12, BWMotionDataTimeMachineKeySynchronizedSlaveFrameMotionData, 0);
      }
      else {
        uint64_t v22 = objc_msgSend(v21, "initWithObjectsAndKeys:", v11, BWMotionDataTimeMachineKeyPrimaryMotionData, 0, v23, v24);
      }
      uint64_t v13 = (void *)v22;
      goto LABEL_7;
    }
  }
  else
  {
    pthread_mutex_unlock((pthread_mutex_t *)self->_propertyMutex);
    uint64_t v11 = 0;
    uint64_t v12 = 0;
  }
  uint64_t v13 = 0;
LABEL_7:

  return v13;
}

@end