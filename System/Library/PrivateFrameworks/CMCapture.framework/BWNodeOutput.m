@interface BWNodeOutput
+ (void)initialize;
- (BOOL)discardsSampleData;
- (BOOL)dropsSampleBuffersWithUnexpectedPTS;
- (BOOL)mediaTypeIsPointCloud;
- (BOOL)mediaTypeIsVideo;
- (BOOL)pixelBufferPoolProvidesBackPressure;
- (BOOL)pixelBufferPoolReportSlowBackPressureAllocations;
- (BOOL)poolPreallocationEnabled;
- (BOOL)providesDataBufferPool;
- (BOOL)providesPixelBufferPool;
- (BWDataBufferPool)liveDataBufferPool;
- (BWDataBufferPool)preparedDataBufferPool;
- (BWFormat)format;
- (BWFormat)liveFormat;
- (BWFormatRequirements)formatRequirements;
- (BWMemoryPool)memoryPool;
- (BWNode)node;
- (BWNodeConnection)connection;
- (BWNodeOutput)initWithMediaType:(unsigned int)a3 node:(id)a4;
- (BWNodeOutputConsumer)consumer;
- (BWNodeOutputMediaConfiguration)primaryMediaConfiguration;
- (BWNodeOutputMediaConfiguration)unspecifiedAttachedMediaConfiguration;
- (BWNodeOutputMediaProperties)primaryMediaProperties;
- (BWPixelBufferPool)livePixelBufferPool;
- (BWPixelBufferPool)preparedPixelBufferPool;
- (BWPointCloudFormat)pointCloudFormat;
- (BWVideoFormat)videoFormat;
- (NSArray)resolvedAttachedMediaKeys;
- (NSArray)specifiedAttachedMediaKeys;
- (NSString)description;
- (NSString)name;
- (_BYTE)_makeConfiguredFormatLiveForAttachedMediaKey:(unsigned char *)result;
- (_BYTE)_markEndOfLiveOutputForAttachedMediaKey:(unsigned char *)result;
- (float)maxSampleDataOutputRate;
- (id)_mediaConfigurationForBufferCountOfPossiblyUnspecifiedAttachedMediaKey:(id)a3;
- (id)_mediaConfigurationForPossiblyUnspecifiedAttachedMediaKey:(id)a3;
- (id)_mediaPropertiesForPossiblyUnspecifiedAttachedMediaKey:(id)a3;
- (id)_poolName;
- (id)_prepareForConfiguredFormatToBecomeLiveForAttachedMediaKey:(id *)result;
- (id)attachedMediaKeyDrivenByInputAttachedMediaKey:(id)a3 inputIndex:(unint64_t)a4;
- (id)mediaConfigurationForAttachedMediaKey:(id)a3;
- (id)mediaPropertiesForAttachedMediaKey:(id)a3;
- (id)osStatePropertyList;
- (int)_passthroughModeForAttachedMediaKey:(id)a3;
- (int)_passthroughModeForUnspecifiedAttachedMedia;
- (int)indexOfInputWhichDrivesThisOutput;
- (int)owningNodeRetainedBufferCount;
- (int)passthroughMode;
- (int)retainedBufferCount;
- (int64_t)configurationID;
- (int64_t)liveConfigurationID;
- (unsigned)mediaType;
- (unsigned)numberOfBuffersDropped;
- (unsigned)numberOfBuffersEmitted;
- (void)_clearAllMediaProperties;
- (void)_setMediaProperties:(id)a3 forAttachedMediaKey:(id)a4;
- (void)addPoolPreallocationCompletionHandler:(id)a3;
- (void)dealloc;
- (void)emitDroppedSample:(id)a3;
- (void)emitNodeError:(id)a3;
- (void)emitSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (void)emitStillImagePrewarmMessageWithSettings:(id)a3;
- (void)emitStillImageReferenceFrameBracketedCaptureSequenceNumberMessageWithSequenceNumber:(int)a3;
- (void)invalidate;
- (void)makeConfiguredFormatLive;
- (void)markEndOfLiveOutput;
- (void)prepareForConfiguredFormatToBecomeLive;
- (void)setConfigurationID:(int64_t)a3;
- (void)setConsumer:(id)a3;
- (void)setDiscardsSampleData:(BOOL)a3;
- (void)setDropsSampleBuffersWithUnexpectedPTS:(BOOL)a3;
- (void)setFormat:(id)a3;
- (void)setFormatRequirements:(id)a3;
- (void)setIndexOfInputWhichDrivesThisOutput:(int)a3;
- (void)setMaxSampleDataOutputRate:(float)a3;
- (void)setMediaConfiguration:(id)a3 forAttachedMediaKey:(id)a4;
- (void)setMemoryPool:(id)a3;
- (void)setName:(id)a3;
- (void)setNodePreparedDataBufferPool:(id)a3;
- (void)setNodePreparedPixelBufferPool:(id)a3;
- (void)setOwningNodeRetainedBufferCount:(int)a3;
- (void)setPassthroughMode:(int)a3;
- (void)setPixelBufferPoolProvidesBackPressure:(BOOL)a3;
- (void)setPixelBufferPoolReportSlowBackPressureAllocations:(BOOL)a3;
- (void)setPoolPreallocationEnabled:(BOOL)a3;
- (void)setPreparedSharedDataBufferPool:(id)a3;
- (void)setPreparedSharedPixelBufferPool:(id)a3;
- (void)setProvidesDataBufferPool:(BOOL)a3;
- (void)setProvidesPixelBufferPool:(BOOL)a3;
- (void)setRetainedBufferCount:(int)a3;
- (void)setUnspecifiedAttachedMediaConfiguration:(id)a3;
- (void)suspendResources;
@end

@implementation BWNodeOutput

- (void)setMediaConfiguration:(id)a3 forAttachedMediaKey:(id)a4
{
  if (!a4)
  {
    v9 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v10 = *MEMORY[0x1E4F1C3C8];
    v11 = @"Cannot set media configuration for nil attachedMediaKey";
    goto LABEL_14;
  }
  if ([a4 isEqualToString:@"PrimaryFormat"])
  {
    v9 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v10 = *MEMORY[0x1E4F1C3C8];
    v11 = @"Cannot set media configuration for BWAttachedMediaKey_PrimaryFormat";
LABEL_14:
    objc_exception_throw((id)[v9 exceptionWithName:v10 reason:v11 userInfo:0]);
  }
  attachedMediaConfigurations = self->_attachedMediaConfigurations;
  if (a3)
  {
    if (!attachedMediaConfigurations) {
      self->_attachedMediaConfigurations = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    [a3 _setAssociatedAttachedMediaKey:a4];
    v8 = self->_attachedMediaConfigurations;
    [(NSMutableDictionary *)v8 setObject:a3 forKeyedSubscript:a4];
  }
  else
  {
    [(NSMutableDictionary *)attachedMediaConfigurations removeObjectForKey:a4];
  }
}

- (BWNodeOutputMediaConfiguration)primaryMediaConfiguration
{
  return self->_primaryMediaConfiguration;
}

- (NSArray)resolvedAttachedMediaKeys
{
  return (NSArray *)[(NSMutableDictionary *)self->_attachedMediaProperties allKeys];
}

- (unsigned)mediaType
{
  return self->_mediaType;
}

- (BWNodeConnection)connection
{
  if (self->_consumerIsANodeConnection) {
    return (BWNodeConnection *)self->_consumer;
  }
  else {
    return 0;
  }
}

- (id)mediaPropertiesForAttachedMediaKey:(id)a3
{
  if (!a3) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Cannot set media configuration for nil attachedMediaKey" userInfo:0]);
  }
  if ([a3 isEqualToString:@"PrimaryFormat"]) {
    return self->_primaryMediaProperties;
  }
  attachedMediaProperties = self->_attachedMediaProperties;
  return (id)[(NSMutableDictionary *)attachedMediaProperties objectForKeyedSubscript:a3];
}

- (int)_passthroughModeForAttachedMediaKey:(id)a3
{
  if (!a3) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Cannot get passthrough mode for nil attachedMediaKey" userInfo:0]);
  }
  if ([a3 isEqualToString:@"PrimaryFormat"])
  {
    primaryMediaConfiguration = self->_primaryMediaConfiguration;
LABEL_5:
    return [(BWNodeOutputMediaConfiguration *)primaryMediaConfiguration passthroughMode];
  }
  primaryMediaConfiguration = (BWNodeOutputMediaConfiguration *)[(NSMutableDictionary *)self->_attachedMediaConfigurations objectForKeyedSubscript:a3];
  if (primaryMediaConfiguration) {
    goto LABEL_5;
  }
  return [(BWNodeOutput *)self _passthroughModeForUnspecifiedAttachedMedia];
}

- (id)attachedMediaKeyDrivenByInputAttachedMediaKey:(id)a3 inputIndex:(unint64_t)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend(-[BWNodeOutput _mediaConfigurationForPossiblyUnspecifiedAttachedMediaKey:](self, "_mediaConfigurationForPossiblyUnspecifiedAttachedMediaKey:"), "isDrivenByInputWithIndex:", a4))
  {
    v7 = @"PrimaryFormat";
    if ([a3 isEqualToString:@"PrimaryFormat"])
    {
      if (![(BWNodeOutputMediaConfiguration *)self->_primaryMediaConfiguration performsAttachedMediaRemapping])return v7; {
    }
      }
    else if (-[NSArray containsObject:](-[BWNodeOutput specifiedAttachedMediaKeys](self, "specifiedAttachedMediaKeys"), "containsObject:", a3)&& !objc_msgSend(-[BWNodeOutput mediaConfigurationForAttachedMediaKey:](self, "mediaConfigurationForAttachedMediaKey:", a3), "performsAttachedMediaRemapping"))
    {
      return a3;
    }
  }
  if (![(BWNodeOutputMediaConfiguration *)self->_primaryMediaConfiguration isDrivenByInputWithIndex:a4])goto LABEL_11; {
  v7 = @"PrimaryFormat";
  }
  BOOL v8 = [(BWNodeOutputMediaConfiguration *)self->_primaryMediaConfiguration performsAttachedMediaRemapping];
  v9 = @"PrimaryFormat";
  if (v8) {
    v9 = [(BWNodeOutputMediaConfiguration *)self->_primaryMediaConfiguration attachedMediaKeyOfInputWhichDrivesThisOutput];
  }
  if (([a3 isEqualToString:v9] & 1) == 0)
  {
LABEL_11:
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v10 = [(BWNodeOutput *)self specifiedAttachedMediaKeys];
    uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v20;
LABEL_13:
      uint64_t v14 = 0;
      while (1)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        v7 = *(__CFString **)(*((void *)&v19 + 1) + 8 * v14);
        id v15 = [(BWNodeOutput *)self mediaConfigurationForAttachedMediaKey:v7];
        if ([v15 isDrivenByInputWithIndex:a4])
        {
          int v16 = [v15 performsAttachedMediaRemapping];
          uint64_t v17 = (uint64_t)v7;
          if (v16) {
            uint64_t v17 = objc_msgSend(v15, "attachedMediaKeyOfInputWhichDrivesThisOutput", v7);
          }
          if ([a3 isEqualToString:v17]) {
            break;
          }
        }
        if (v12 == ++v14)
        {
          uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
          if (v12) {
            goto LABEL_13;
          }
          goto LABEL_22;
        }
      }
    }
    else
    {
LABEL_22:
      if (([a3 isEqualToString:@"PrimaryFormat"] & 1) != 0
        || [(NSArray *)[(BWNodeOutput *)self specifiedAttachedMediaKeys] containsObject:a3]|| ![(BWNodeOutputMediaConfiguration *)self->_primaryMediaConfiguration isDrivenByInputWithIndex:a4])
      {
        return 0;
      }
      else if ([(BWNodeOutput *)self _passthroughModeForUnspecifiedAttachedMedia])
      {
        return a3;
      }
      else
      {
        return 0;
      }
    }
  }
  return v7;
}

- (id)mediaConfigurationForAttachedMediaKey:(id)a3
{
  if (!a3) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Cannot set media configuration for nil attachedMediaKey" userInfo:0]);
  }
  if ([a3 isEqualToString:@"PrimaryFormat"]) {
    return self->_primaryMediaConfiguration;
  }
  attachedMediaConfigurations = self->_attachedMediaConfigurations;
  return (id)[(NSMutableDictionary *)attachedMediaConfigurations objectForKeyedSubscript:a3];
}

- (NSArray)specifiedAttachedMediaKeys
{
  return (NSArray *)[(NSMutableDictionary *)self->_attachedMediaConfigurations allKeys];
}

- (int)_passthroughModeForUnspecifiedAttachedMedia
{
  unspecifiedAttachedMediaConfiguration = self->_unspecifiedAttachedMediaConfiguration;
  if (unspecifiedAttachedMediaConfiguration) {
    return [(BWNodeOutputMediaConfiguration *)unspecifiedAttachedMediaConfiguration passthroughMode];
  }
  else {
    return 1;
  }
}

- (id)_mediaConfigurationForPossiblyUnspecifiedAttachedMediaKey:(id)a3
{
  if ([a3 isEqualToString:@"PrimaryFormat"]) {
    return self->_primaryMediaConfiguration;
  }
  id result = [(BWNodeOutput *)self mediaConfigurationForAttachedMediaKey:a3];
  if (!result)
  {
    id result = self->_unspecifiedAttachedMediaConfiguration;
    if (!result) {
      return self->_primaryMediaConfiguration;
    }
  }
  return result;
}

- (BWNode)node
{
  return self->_node;
}

- (BWFormat)format
{
  return [(BWNodeOutputMediaProperties *)self->_primaryMediaProperties resolvedFormat];
}

- (void)setFormatRequirements:(id)a3
{
}

- (void)setPassthroughMode:(int)a3
{
}

- (void)setIndexOfInputWhichDrivesThisOutput:(int)a3
{
}

- (BWNodeOutput)initWithMediaType:(unsigned int)a3 node:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)BWNodeOutput;
  v6 = [(BWNodeOutput *)&v12 init];
  v7 = (BWNodeOutput *)v6;
  if (v6)
  {
    *((_DWORD *)v6 + 7) = a3;
    v6[25] = a3 == 1986618469;
    v6[26] = a3 == 1885564004;
    *((void *)v6 + 5) = a4;
    uint64_t v8 = MEMORY[0x1E4F1F9F8];
    *(_OWORD *)(v6 + 100) = *MEMORY[0x1E4F1F9F8];
    *(void *)(v6 + 116) = *(void *)(v8 + 16);
    *((void *)v6 + 17) = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7->_poolPreallocationMutex = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
    v9 = objc_alloc_init(BWNodeOutputMediaConfiguration);
    v7->_primaryMediaConfiguration = v9;
    [(BWNodeOutputMediaConfiguration *)v9 _setAssociatedAttachedMediaKey:@"PrimaryFormat"];
    [(BWNodeOutputMediaConfiguration *)v7->_primaryMediaConfiguration setProvidesPixelBufferPool:v7->_mediaTypeIsVideo];
    [(BWNodeOutputMediaConfiguration *)v7->_primaryMediaConfiguration setProvidesDataBufferPool:v7->_mediaTypeIsPointCloud];
    uint64_t v10 = objc_alloc_init(BWNodeOutputMediaProperties);
    [(BWNodeOutputMediaProperties *)v10 _setOwningNodeOutput:v7 associatedAttachedMediaKey:@"PrimaryFormat"];
    v7->_primaryMediaProperties = v10;
  }
  return v7;
}

- (void)_setMediaProperties:(id)a3 forAttachedMediaKey:(id)a4
{
  if (!a4)
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v9 = *MEMORY[0x1E4F1C3C8];
    uint64_t v10 = @"Cannot set media properties for nil attachedMediaKey";
    goto LABEL_14;
  }
  if ([a4 isEqualToString:@"PrimaryFormat"])
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v9 = *MEMORY[0x1E4F1C3C8];
    uint64_t v10 = @"Cannot set media properties for primary media";
    goto LABEL_14;
  }
  if (!a3)
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v9 = *MEMORY[0x1E4F1C3C8];
    uint64_t v10 = @"Cannot set media properties to nil -- call _clearAllMediaProperties to clear all media property state";
LABEL_14:
    objc_exception_throw((id)[v8 exceptionWithName:v9 reason:v10 userInfo:0]);
  }
  attachedMediaProperties = self->_attachedMediaProperties;
  if (attachedMediaProperties)
  {
    if ([(NSMutableDictionary *)attachedMediaProperties objectForKeyedSubscript:a4])
    {
      uint64_t v8 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v9 = *MEMORY[0x1E4F1C3C8];
      uint64_t v10 = @"Can only set media properties once -- call _clearAllMediaProperties to clear all media property state";
      goto LABEL_14;
    }
  }
  else
  {
    self->_attachedMediaProperties = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  [a3 _setOwningNodeOutput:self associatedAttachedMediaKey:a4];
  uint64_t v11 = self->_attachedMediaProperties;
  [(NSMutableDictionary *)v11 setObject:a3 forKeyedSubscript:a4];
}

- (void)setName:(id)a3
{
}

- (void)setFormat:(id)a3
{
}

- (void)setDropsSampleBuffersWithUnexpectedPTS:(BOOL)a3
{
  self->_dropsSampleBuffersWithUnexpectedPTS = a3;
}

- (void)setProvidesPixelBufferPool:(BOOL)a3
{
}

- (void)setProvidesDataBufferPool:(BOOL)a3
{
}

- (BOOL)mediaTypeIsVideo
{
  return self->_mediaTypeIsVideo;
}

- (BWFormatRequirements)formatRequirements
{
  return [(BWNodeOutputMediaConfiguration *)self->_primaryMediaConfiguration formatRequirements];
}

- (void)setConsumer:(id)a3
{
  if (self->_consumer != a3)
  {
    self->_consumer = (BWNodeOutputConsumer *)a3;
    objc_opt_class();
    self->_consumerIsANodeConnection = objc_opt_isKindOfClass() & 1;
  }
}

- (BWNodeOutputConsumer)consumer
{
  return self->_consumer;
}

- (void)setMemoryPool:(id)a3
{
}

- (void)emitSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int64_t value = *MEMORY[0x1E4F1F9F8];
  CMTimeFlags flags = *(_DWORD *)(MEMORY[0x1E4F1F9F8] + 12);
  CMTimeScale timescale = *(_DWORD *)(MEMORY[0x1E4F1F9F8] + 8);
  CMTimeEpoch epoch = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  BOOL v7 = !self->_discardsSampleData;
  if (!a3)
  {
LABEL_16:
    if (!v7) {
      return;
    }
    goto LABEL_17;
  }
  if (!self->_discardsSampleData)
  {
    if (!self->_dropsSampleBuffersWithUnexpectedPTS) {
      goto LABEL_9;
    }
    CMSampleBufferGetPresentationTimeStamp(&time1, a3);
    int64_t value = time1.value;
    CMTimeFlags flags = time1.flags;
    CMTimeScale timescale = time1.timescale;
    CMTimeEpoch epoch = time1.epoch;
    CMTimeMake(&rhs, 1, 600);
    CMTime lhs = *(CMTime *)(&self->_numberOfBuffersDropped + 1);
    CMTimeAdd(&time1, &lhs, &rhs);
    CMTimeValue v17 = time1.value;
    CMTimeScale v18 = time1.timescale;
    if ((time1.flags & 1) == 0
      || (time1.int64_t value = v17,
          time1.CMTimeScale timescale = v18,
          lhs.int64_t value = value,
          lhs.CMTimeScale timescale = timescale,
          lhs.CMTimeFlags flags = flags,
          lhs.CMTimeEpoch epoch = epoch,
          CMTimeCompare(&time1, &lhs) < 0))
    {
      *(void *)(&self->_numberOfBuffersDropped + 1) = value;
      HIDWORD(self->_lastValidPTS.value) = timescale;
      self->_lastValidPTS.CMTimeScale timescale = flags;
      *(void *)&self->_lastValidPTS.CMTimeFlags flags = epoch;
      BOOL v7 = 1;
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  if (!v7) {
    return;
  }
LABEL_9:
  if (self->_maxSampleDataOutputRate > 0.0)
  {
    CFDictionaryRef v8 = (const __CFDictionary *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F530C0], 0);
    if (v8) {
      CMTimeMakeFromDictionary(&time1, v8);
    }
    else {
      CMSampleBufferGetPresentationTimeStamp(&time1, a3);
    }
    int64_t value = time1.value;
    CMTimeFlags flags = time1.flags;
    CMTimeScale timescale = time1.timescale;
    CMTimeEpoch epoch = time1.epoch;
    if (self->_lastEmittedPTS.timescale & 1) != 0 && (time1.flags)
    {
      time1.int64_t value = value;
      time1.CMTimeScale timescale = timescale;
      CMTime lhs = *(CMTime *)((char *)&self->_lastValidPTS.epoch + 4);
      CMTimeSubtract(&time, &time1, &lhs);
      float v9 = 0.95 / CMTimeGetSeconds(&time);
      BOOL v7 = self->_maxSampleDataOutputRate >= v9;
      goto LABEL_16;
    }
  }
LABEL_17:
  id v10 = +[BWNodeSampleBufferMessage newMessageWithSampleBuffer:a3];
  consumer = self->_consumer;
  if (consumer)
  {
    [(BWNodeOutputConsumer *)consumer consumeMessage:v10 fromOutput:self];
    uint64_t v12 = 68;
  }
  else
  {
    uint64_t v12 = 72;
  }

  ++*(_DWORD *)((char *)&self->super.isa + v12);
  *(int64_t *)((char *)&self->_lastValidPTS.epoch + 4) = value;
  HIDWORD(self->_lastEmittedPTS.value) = timescale;
  self->_lastEmittedPTS.CMTimeScale timescale = flags;
  *(void *)&self->_lastEmittedPTS.CMTimeFlags flags = epoch;
}

- (BOOL)discardsSampleData
{
  return self->_discardsSampleData;
}

- (void)makeConfiguredFormatLive
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  char v3 = [(BWFormat *)[(BWNodeOutputMediaProperties *)self->_primaryMediaProperties resolvedFormat] isEqual:[(BWNodeOutputMediaProperties *)self->_primaryMediaProperties liveFormat]];
  -[BWNodeOutput _makeConfiguredFormatLiveForAttachedMediaKey:](self, @"PrimaryFormat");
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v4 = [(BWNodeOutput *)self resolvedAttachedMediaKeys];
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        -[BWNodeOutput _makeConfiguredFormatLiveForAttachedMediaKey:](self, *(void *)(*((void *)&v15 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }
  node = self->_node;
  self->_int64_t liveConfigurationID = self->_configurationID;
  id v10 = [(BWNode *)node renderDelegate];
  if (v10) {
    [(BWNodeRenderDelegate *)v10 node:self->_node format:[(BWNodeOutputMediaProperties *)self->_primaryMediaProperties liveFormat] didBecomeLiveForOutput:self];
  }
  int64_t liveConfigurationID = self->_liveConfigurationID;
  if (v3) {
    uint64_t v12 = 0;
  }
  else {
    uint64_t v12 = [(BWNodeOutputMediaProperties *)self->_primaryMediaProperties liveFormat];
  }
  id v13 = +[BWNodeConfigurationLiveMessage newMessageWithConfigurationID:liveConfigurationID updatedFormat:v12];
  consumer = self->_consumer;
  if (consumer) {
    [(BWNodeOutputConsumer *)consumer consumeMessage:v13 fromOutput:self];
  }
}

- (void)prepareForConfiguredFormatToBecomeLive
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_mediaTypeIsVideo || self->_mediaTypeIsPointCloud)
  {
    -[BWNodeOutput _prepareForConfiguredFormatToBecomeLiveForAttachedMediaKey:]((id *)&self->super.isa, @"PrimaryFormat");
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    char v3 = [(BWNodeOutput *)self resolvedAttachedMediaKeys];
    uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v3);
          }
          -[BWNodeOutput _prepareForConfiguredFormatToBecomeLiveForAttachedMediaKey:]((id *)&self->super.isa, *(void *)(*((void *)&v8 + 1) + 8 * v7++));
        }
        while (v5 != v7);
        uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }
  }
}

- (id)_prepareForConfiguredFormatToBecomeLiveForAttachedMediaKey:(id *)result
{
  if (result)
  {
    char v3 = result;
    uint64_t v4 = (void *)[result mediaConfigurationForAttachedMediaKey:a2];
    uint64_t v5 = (void *)[v3 mediaPropertiesForAttachedMediaKey:a2];
    if ([v4 providesPixelBufferPool]) {
      [v5 setPreparedPixelBufferPool:0];
    }
    if ([v4 providesDataBufferPool]) {
      [v5 setPreparedDataBufferPool:0];
    }
    id result = (id *)[v4 passthroughMode];
    if (!result)
    {
      id result = (id *)[v4 providesPixelBufferPool];
      if (result)
      {
        id result = (id *)[v5 resolvedVideoFormat];
        if (result)
        {
          int v6 = [v5 resolvedRetainedBufferCount];
          if (v6 <= (int)[v4 owningNodeRetainedBufferCount]) {
            int v7 = [v4 owningNodeRetainedBufferCount];
          }
          else {
            int v7 = [v5 resolvedRetainedBufferCount];
          }
          objc_msgSend(v5, "setPreparedPixelBufferPoolSize:", v7 + objc_msgSend(v4, "owningNodeIndefinitelyHeldBufferCount") + 1);
          long long v8 = [BWPixelBufferPool alloc];
          uint64_t v9 = [v5 resolvedVideoFormat];
          uint64_t v10 = (int)[v5 preparedPixelBufferPoolSize];
          uint64_t v11 = [NSString stringWithFormat:@"%@:%@", -[BWNodeOutput _poolName](v3), a2];
          id v12 = v3[24];
          uint64_t v13 = [v4 pixelBufferPoolProvidesBackPressure];
          LOBYTE(v15) = [v4 pixelBufferPoolReportSlowBackPressureAllocations];
          uint64_t v14 = [(BWPixelBufferPool *)v8 initWithVideoFormat:v9 capacity:v10 name:v11 clientProvidesPool:0 memoryPool:v12 providesBackPressure:v13 reportSlowBackPressureAllocations:v15];
          [v5 setPreparedPixelBufferPool:v14];
          id result = (id *)[v4 owningNodeRetainedBufferCount];
          if ((int)result <= 0) {
            id result = (id *)[v4 owningNodeIndefinitelyHeldBufferCount];
          }
          if (v14)
          {
            if (*((unsigned char *)v3 + 144) || (id result = (id *)[v3[17] count]) != 0)
            {
              CFAbsoluteTimeGetCurrent();
              v16[0] = MEMORY[0x1E4F143A8];
              v16[1] = 3221225472;
              v16[2] = __75__BWNodeOutput__prepareForConfiguredFormatToBecomeLiveForAttachedMediaKey___block_invoke;
              v16[3] = &unk_1E5C25910;
              v16[4] = v3;
              return (id *)[(BWPixelBufferPool *)v14 preallocateWithCompletionHandler:v16];
            }
          }
        }
      }
    }
  }
  return result;
}

- (_BYTE)_makeConfiguredFormatLiveForAttachedMediaKey:(unsigned char *)result
{
  if (result)
  {
    char v3 = result;
    uint64_t v4 = (void *)[result mediaConfigurationForAttachedMediaKey:a2];
    uint64_t v5 = (void *)[v3 mediaPropertiesForAttachedMediaKey:a2];
    id result = (unsigned char *)objc_msgSend(v5, "setLiveFormat:", objc_msgSend(v5, "resolvedFormat"));
    if (v3[25])
    {
      objc_msgSend(v5, "setLivePixelBufferPool:", objc_msgSend(v5, "preparedPixelBufferPool"));
      [v5 setPreparedPixelBufferPool:0];
      if ([v5 preparedPixelBufferPoolSize])
      {
        uint64_t v6 = [v5 preparedPixelBufferPoolSize];
      }
      else
      {
        int v8 = [v5 resolvedRetainedBufferCount];
        if (v8 <= (int)[v4 owningNodeRetainedBufferCount]) {
          int v9 = [v4 owningNodeRetainedBufferCount];
        }
        else {
          int v9 = [v5 resolvedRetainedBufferCount];
        }
        uint64_t v6 = (v9 + 1);
      }
      [v5 setLivePixelBufferPoolSize:v6];
      return (unsigned char *)[v5 setPreparedPixelBufferPoolSize:0];
    }
    else if (v3[26])
    {
      objc_msgSend(v5, "setLiveDataBufferPool:", objc_msgSend(v5, "preparedDataBufferPool"));
      [v5 setPreparedDataBufferPool:0];
      if ([v5 preparedDataBufferPoolSize])
      {
        uint64_t v7 = [v5 preparedDataBufferPoolSize];
      }
      else
      {
        int v10 = [v5 resolvedRetainedBufferCount];
        if (v10 <= (int)[v4 owningNodeRetainedBufferCount]) {
          int v11 = [v4 owningNodeRetainedBufferCount];
        }
        else {
          int v11 = [v5 resolvedRetainedBufferCount];
        }
        uint64_t v7 = (v11 + 1);
      }
      [v5 setLiveDataBufferPoolSize:v7];
      return (unsigned char *)[v5 setPreparedDataBufferPoolSize:0];
    }
  }
  return result;
}

- (void)setConfigurationID:(int64_t)a3
{
  self->_configurationID = a3;
}

- (void)setRetainedBufferCount:(int)a3
{
}

- (BWNodeOutputMediaProperties)primaryMediaProperties
{
  return self->_primaryMediaProperties;
}

- (NSString)name
{
  return self->_name;
}

- (BWVideoFormat)videoFormat
{
  return [(BWNodeOutputMediaProperties *)self->_primaryMediaProperties resolvedVideoFormat];
}

- (void)setDiscardsSampleData:(BOOL)a3
{
  self->_discardsSampleData = a3;
}

- (int)passthroughMode
{
  return [(BWNodeOutputMediaConfiguration *)self->_primaryMediaConfiguration passthroughMode];
}

- (BWPixelBufferPool)preparedPixelBufferPool
{
  return [(BWNodeOutputMediaProperties *)self->_primaryMediaProperties preparedPixelBufferPool];
}

- (BWFormat)liveFormat
{
  return [(BWNodeOutputMediaProperties *)self->_primaryMediaProperties liveFormat];
}

- (void)emitDroppedSample:(id)a3
{
  if (!self->_discardsSampleData)
  {
    id v4 = +[BWNodeDroppedSampleMessage newMessageWithDroppedSample:a3];
    consumer = self->_consumer;
    if (consumer)
    {
      id v6 = v4;
      consumer = (BWNodeOutputConsumer *)[(BWNodeOutputConsumer *)consumer consumeMessage:v4 fromOutput:self];
      id v4 = v6;
    }
    MEMORY[0x1F41817F8](consumer, v4);
  }
}

- (int)retainedBufferCount
{
  return [(BWNodeOutputMediaProperties *)self->_primaryMediaProperties resolvedRetainedBufferCount];
}

- (BWMemoryPool)memoryPool
{
  return self->_memoryPool;
}

- (void)setNodePreparedPixelBufferPool:(id)a3
{
}

- (BOOL)providesPixelBufferPool
{
  return [(BWNodeOutputMediaConfiguration *)self->_primaryMediaConfiguration providesPixelBufferPool];
}

- (void)setNodePreparedDataBufferPool:(id)a3
{
}

- (BWPointCloudFormat)pointCloudFormat
{
  return [(BWNodeOutputMediaProperties *)self->_primaryMediaProperties resolvedPointCloudFormat];
}

- (BWPixelBufferPool)livePixelBufferPool
{
  return [(BWNodeOutputMediaProperties *)self->_primaryMediaProperties livePixelBufferPool];
}

- (id)_poolName
{
  if (result)
  {
    v1 = result;
    if ([result[5] name])
    {
      v2 = (NSString *)[v1[5] name];
    }
    else
    {
      char v3 = (objc_class *)objc_opt_class();
      v2 = NSStringFromClass(v3);
    }
    id v4 = (void *)[(NSString *)v2 mutableCopy];
    uint64_t v5 = v4;
    if (v4 && v1[1]) {
      [v4 appendFormat:@" output: %@", v1[1]];
    }
    return (id *)v5;
  }
  return result;
}

- (void)setMaxSampleDataOutputRate:(float)a3
{
  self->_maxSampleDataOutputRate = a3;
}

- (BWNodeOutputMediaConfiguration)unspecifiedAttachedMediaConfiguration
{
  return self->_unspecifiedAttachedMediaConfiguration;
}

- (void)setUnspecifiedAttachedMediaConfiguration:(id)a3
{
}

- (void)setPoolPreallocationEnabled:(BOOL)a3
{
  self->_poolPreallocationEnabled = a3;
}

- (void)setOwningNodeRetainedBufferCount:(int)a3
{
}

- (int)owningNodeRetainedBufferCount
{
  return [(BWNodeOutputMediaConfiguration *)self->_primaryMediaConfiguration owningNodeRetainedBufferCount];
}

- (void)setPixelBufferPoolReportSlowBackPressureAllocations:(BOOL)a3
{
}

- (void)setPixelBufferPoolProvidesBackPressure:(BOOL)a3
{
}

- (void)addPoolPreallocationCompletionHandler:(id)a3
{
  pthread_mutex_lock((pthread_mutex_t *)self->_poolPreallocationMutex);
  if (!self->_receivedEOD)
  {
    if (self->_poolPreallocationDone)
    {
      global_queue = dispatch_get_global_queue(0, 0);
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __54__BWNodeOutput_addPoolPreallocationCompletionHandler___block_invoke;
      v7[3] = &unk_1E5C24E50;
      v7[4] = self;
      v7[5] = a3;
      dispatch_async(global_queue, v7);
    }
    else
    {
      id v6 = (void *)[a3 copy];
      [(NSMutableArray *)self->_poolPreallocationCompletionHandlers addObject:v6];
    }
  }
  pthread_mutex_unlock((pthread_mutex_t *)self->_poolPreallocationMutex);
}

- (int)indexOfInputWhichDrivesThisOutput
{
  return [(BWNodeOutputMediaConfiguration *)self->_primaryMediaConfiguration indexOfInputWhichDrivesThisOutput];
}

- (BOOL)mediaTypeIsPointCloud
{
  return self->_mediaTypeIsPointCloud;
}

+ (void)initialize
{
}

- (void)invalidate
{
  self->_node = 0;
}

- (void)dealloc
{
  FigSimpleMutexDestroy();
  [(BWNodeOutput *)self _clearAllMediaProperties];
  v3.receiver = self;
  v3.super_class = (Class)BWNodeOutput;
  [(BWNodeOutput *)&v3 dealloc];
}

- (NSString)description
{
  NSUInteger v3 = [(NSArray *)[[(BWNodeOutput *)self node] outputs] indexOfObject:self];
  if (self->_name) {
    id v4 = (__CFString *)[NSString stringWithFormat:@"'%@'  ", self->_name];
  }
  else {
    id v4 = &stru_1EFA403E0;
  }
  uint64_t v5 = NSString;
  uint64_t v6 = objc_opt_class();
  return (NSString *)[v5 stringWithFormat:@"<%@: %p> %@('%@', idx: %u, owner: %@)", v6, self, v4, BWStringForOSType(self->_mediaType), v3, -[BWNodeOutput node](self, "node")];
}

void __75__BWNodeOutput__prepareForConfiguredFormatToBecomeLiveForAttachedMediaKey___block_invoke(uint64_t a1)
{
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__BWNodeOutput__prepareForConfiguredFormatToBecomeLiveForAttachedMediaKey___block_invoke_2;
  block[3] = &unk_1E5C24430;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(global_queue, block);
}

uint64_t __75__BWNodeOutput__prepareForConfiguredFormatToBecomeLiveForAttachedMediaKey___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  pthread_mutex_lock(*(pthread_mutex_t **)(*(void *)(a1 + 32) + 128));
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v2 + 146))
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    NSUInteger v3 = *(void **)(v2 + 136);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v10;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v3);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v9 + 1) + 8 * i) + 16))();
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v5);
    }
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 145) = 1;
  [*(id *)(*(void *)(a1 + 32) + 136) removeAllObjects];
  return pthread_mutex_unlock(*(pthread_mutex_t **)(*(void *)(a1 + 32) + 128));
}

- (void)emitNodeError:(id)a3
{
  id v4 = +[BWNodeErrorMessage newMessageWithNodeError:a3];
  consumer = self->_consumer;
  if (consumer)
  {
    id v6 = v4;
    consumer = (BWNodeOutputConsumer *)[(BWNodeOutputConsumer *)consumer consumeMessage:v4 fromOutput:self];
    id v4 = v6;
  }
  MEMORY[0x1F41817F8](consumer, v4);
}

- (void)emitStillImageReferenceFrameBracketedCaptureSequenceNumberMessageWithSequenceNumber:(int)a3
{
  id v4 = +[BWNodeStillImageReferenceFrameBracketedCaptureSequenceNumberMessage newMessageWithStillImageReferenceFrameBracketedCaptureSequenceNumber:*(void *)&a3];
  consumer = self->_consumer;
  if (consumer)
  {
    id v6 = v4;
    consumer = (BWNodeOutputConsumer *)[(BWNodeOutputConsumer *)consumer consumeMessage:v4 fromOutput:self];
    id v4 = v6;
  }
  MEMORY[0x1F41817F8](consumer, v4);
}

- (void)emitStillImagePrewarmMessageWithSettings:(id)a3
{
  id v4 = +[BWNodeStillImagePrewarmMessage newMessageWithStillImageSettings:a3];
  consumer = self->_consumer;
  if (consumer)
  {
    id v6 = v4;
    consumer = (BWNodeOutputConsumer *)[(BWNodeOutputConsumer *)consumer consumeMessage:v4 fromOutput:self];
    id v4 = v6;
  }
  MEMORY[0x1F41817F8](consumer, v4);
}

- (_BYTE)_markEndOfLiveOutputForAttachedMediaKey:(unsigned char *)result
{
  if (result)
  {
    uint64_t v2 = result;
    NSUInteger v3 = (void *)[result mediaPropertiesForAttachedMediaKey:a2];
    id result = (unsigned char *)[v3 setLiveFormat:0];
    if (v2[25])
    {
      [v3 setLivePixelBufferPool:0];
      [v3 setLivePixelBufferPoolSize:0];
      [v3 setPreparedPixelBufferPool:0];
      return (unsigned char *)[v3 setPreparedPixelBufferPoolSize:0];
    }
    else if (v2[26])
    {
      [v3 setLiveDataBufferPool:0];
      [v3 setLiveDataBufferPoolSize:0];
      [v3 setPreparedDataBufferPool:0];
      return (unsigned char *)[v3 setPreparedDataBufferPoolSize:0];
    }
  }
  return result;
}

- (void)markEndOfLiveOutput
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  pthread_mutex_lock((pthread_mutex_t *)self->_poolPreallocationMutex);
  self->_receivedEOD = 1;
  [(NSMutableArray *)self->_poolPreallocationCompletionHandlers removeAllObjects];
  pthread_mutex_unlock((pthread_mutex_t *)self->_poolPreallocationMutex);
  -[BWNodeOutput _markEndOfLiveOutputForAttachedMediaKey:](self, @"PrimaryFormat");
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  NSUInteger v3 = [(BWNodeOutput *)self resolvedAttachedMediaKeys];
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        -[BWNodeOutput _markEndOfLiveOutputForAttachedMediaKey:](self, *(void *)(*((void *)&v11 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  int v8 = [(BWNode *)self->_node renderDelegate];
  if (v8) {
    [(BWNodeRenderDelegate *)v8 node:self->_node format:0 didBecomeLiveForOutput:self];
  }
  id v9 = +[BWNodeEndOfDataMessage newMessage];
  consumer = self->_consumer;
  if (consumer) {
    [(BWNodeOutputConsumer *)consumer consumeMessage:v9 fromOutput:self];
  }
}

- (void)suspendResources
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = +[BWNodeSuspendResourcesMessage newMessage];
  consumer = self->_consumer;
  if (consumer) {
    [(BWNodeOutputConsumer *)consumer consumeMessage:v3 fromOutput:self];
  }

  [(BWPixelBufferPool *)[(BWNodeOutputMediaProperties *)self->_primaryMediaProperties livePixelBufferPool] flushToMinimumCapacity:0];
  [(BWDataBufferPool *)[(BWNodeOutputMediaProperties *)self->_primaryMediaProperties liveDataBufferPool] flushToMinimumCapacity:0];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = (void *)[(NSMutableDictionary *)self->_attachedMediaProperties allValues];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        objc_msgSend((id)objc_msgSend(v10, "livePixelBufferPool"), "flushToMinimumCapacity:", 0);
        objc_msgSend((id)objc_msgSend(v10, "liveDataBufferPool"), "flushToMinimumCapacity:", 0);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

uint64_t __54__BWNodeOutput_addPoolPreallocationCompletionHandler___block_invoke(uint64_t a1)
{
  pthread_mutex_lock(*(pthread_mutex_t **)(*(void *)(a1 + 32) + 128));
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v2 + 146))
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    uint64_t v2 = *(void *)(a1 + 32);
  }
  id v3 = *(pthread_mutex_t **)(v2 + 128);
  return pthread_mutex_unlock(v3);
}

- (void)_clearAllMediaProperties
{
  self->_primaryMediaProperties = 0;
  self->_attachedMediaProperties = 0;
}

- (id)_mediaConfigurationForBufferCountOfPossiblyUnspecifiedAttachedMediaKey:(id)a3
{
  id result = [(BWNodeOutput *)self mediaConfigurationForAttachedMediaKey:a3];
  if (!result) {
    return self->_primaryMediaConfiguration;
  }
  return result;
}

- (id)_mediaPropertiesForPossiblyUnspecifiedAttachedMediaKey:(id)a3
{
  id result = [(BWNodeOutput *)self mediaPropertiesForAttachedMediaKey:a3];
  if (!result) {
    return self->_primaryMediaProperties;
  }
  return result;
}

- (id)osStatePropertyList
{
  id v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_consumerIsANodeConnection), @"consumerIsNodeConnection");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_mediaTypeIsVideo), @"mediaTypeIsVideo");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_mediaTypeIsPointCloud), @"mediaTypeIsPointCloud");
  [v3 setObject:BWStringForOSType(self->_mediaType) forKeyedSubscript:@"mediaType"];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", -[BWFormat description](-[BWNodeOutput liveFormat](self, "liveFormat"), "description"), @"liveFormat");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", -[BWNode osStatePropertyListWithVerbose:](-[BWNodeInput node](-[BWNodeConnection input](-[BWNodeOutput connection](self, "connection"), "input"), "node"), "osStatePropertyListWithVerbose:", 0), @"node");
  return v3;
}

- (int64_t)configurationID
{
  return self->_configurationID;
}

- (float)maxSampleDataOutputRate
{
  return self->_maxSampleDataOutputRate;
}

- (BOOL)dropsSampleBuffersWithUnexpectedPTS
{
  return self->_dropsSampleBuffersWithUnexpectedPTS;
}

- (int64_t)liveConfigurationID
{
  return self->_liveConfigurationID;
}

- (BOOL)poolPreallocationEnabled
{
  return self->_poolPreallocationEnabled;
}

- (unsigned)numberOfBuffersEmitted
{
  return self->_numberOfBuffersEmitted;
}

- (unsigned)numberOfBuffersDropped
{
  return self->_numberOfBuffersDropped;
}

- (void)setPreparedSharedPixelBufferPool:(id)a3
{
}

- (BOOL)providesDataBufferPool
{
  return [(BWNodeOutputMediaConfiguration *)self->_primaryMediaConfiguration providesDataBufferPool];
}

- (BWDataBufferPool)preparedDataBufferPool
{
  return [(BWNodeOutputMediaProperties *)self->_primaryMediaProperties preparedDataBufferPool];
}

- (void)setPreparedSharedDataBufferPool:(id)a3
{
}

- (BOOL)pixelBufferPoolProvidesBackPressure
{
  return [(BWNodeOutputMediaConfiguration *)self->_primaryMediaConfiguration pixelBufferPoolProvidesBackPressure];
}

- (BOOL)pixelBufferPoolReportSlowBackPressureAllocations
{
  return [(BWNodeOutputMediaConfiguration *)self->_primaryMediaConfiguration pixelBufferPoolReportSlowBackPressureAllocations];
}

- (BWDataBufferPool)liveDataBufferPool
{
  return [(BWNodeOutputMediaProperties *)self->_primaryMediaProperties liveDataBufferPool];
}

@end