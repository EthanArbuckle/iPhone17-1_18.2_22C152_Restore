@interface BWNodeInput
+ (opaqueCMSampleBuffer)newSampleDataToBeDroppedMarkerBufferFromSampleBuffer:(opaqueCMSampleBuffer *)a3;
+ (void)initialize;
- (BOOL)conversionToPassthroughModeNeverAllowed;
- (BOOL)discardsSampleDataTaggedToBeDropped;
- (BOOL)isEnabled;
- (BOOL)mediaTypeIsPointCloud;
- (BOOL)mediaTypeIsVideo;
- (BWFormat)format;
- (BWFormat)liveFormat;
- (BWFormatRequirements)formatRequirements;
- (BWNode)node;
- (BWNodeConnection)connection;
- (BWNodeInput)initWithMediaType:(unsigned int)a3 node:(id)a4;
- (BWNodeInput)initWithMediaType:(unsigned int)a3 node:(id)a4 index:(unint64_t)a5;
- (BWNodeInputMediaConfiguration)primaryMediaConfiguration;
- (BWNodeInputMediaConfiguration)unspecifiedAttachedMediaConfiguration;
- (BWNodeInputMediaProperties)primaryMediaProperties;
- (BWVideoFormat)videoFormat;
- (NSArray)resolvedAttachedMediaKeys;
- (NSArray)specifiedAttachedMediaKeys;
- (NSString)description;
- (NSString)name;
- (id)mediaConfigurationForAttachedMediaKey:(id)a3;
- (id)mediaPropertiesByAttachedMediaKey;
- (id)mediaPropertiesForAttachedMediaKey:(id)a3;
- (id)osStatePropertyList;
- (int)_passthroughModeForAttachedMediaKey:(id)a3;
- (int)_passthroughModeForUnspecifiedAttachedMedia;
- (int)delayedBufferCount;
- (int)indefinitelyHeldBufferCount;
- (int)passthroughMode;
- (int)retainedBufferCount;
- (int64_t)configurationID;
- (int64_t)liveConfigurationID;
- (uint64_t)_handleConfigurationLiveMessage:(uint64_t)result;
- (unint64_t)index;
- (unsigned)mediaType;
- (unsigned)numberOfBuffersDropped;
- (unsigned)numberOfBuffersReceived;
- (void)_clearAllMediaProperties;
- (void)_setMediaProperties:(id)a3 forAttachedMediaKey:(id)a4;
- (void)dealloc;
- (void)handleMessage:(id)a3;
- (void)invalidate;
- (void)setConfigurationID:(int64_t)a3;
- (void)setConnection:(id)a3;
- (void)setConversionToPassthroughModeNeverAllowed:(BOOL)a3;
- (void)setDelayedBufferCount:(int)a3;
- (void)setDiscardsSampleDataTaggedToBeDropped:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setFormat:(id)a3;
- (void)setFormatRequirements:(id)a3;
- (void)setIndefinitelyHeldBufferCount:(int)a3;
- (void)setMediaConfiguration:(id)a3 forAttachedMediaKey:(id)a4;
- (void)setName:(id)a3;
- (void)setPassthroughMode:(int)a3;
- (void)setRetainedBufferCount:(int)a3;
- (void)setUnspecifiedAttachedMediaConfiguration:(id)a3;
@end

@implementation BWNodeInput

- (unint64_t)index
{
  return self->_index;
}

- (int)_passthroughModeForUnspecifiedAttachedMedia
{
  unspecifiedAttachedMediaConfiguration = self->_unspecifiedAttachedMediaConfiguration;
  if (unspecifiedAttachedMediaConfiguration) {
    return [(BWNodeInputMediaConfiguration *)unspecifiedAttachedMediaConfiguration passthroughMode];
  }
  else {
    return 1;
  }
}

- (unsigned)mediaType
{
  return self->_mediaType;
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

- (int)_passthroughModeForAttachedMediaKey:(id)a3
{
  if (!a3) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Cannot get passthrough mode for nil attachedMediaKey" userInfo:0]);
  }
  if ([a3 isEqualToString:@"PrimaryFormat"])
  {
    primaryMediaConfiguration = self->_primaryMediaConfiguration;
LABEL_5:
    return [(BWNodeInputMediaConfiguration *)primaryMediaConfiguration passthroughMode];
  }
  primaryMediaConfiguration = (BWNodeInputMediaConfiguration *)[(NSMutableDictionary *)self->_attachedMediaConfigurations objectForKeyedSubscript:a3];
  if (primaryMediaConfiguration) {
    goto LABEL_5;
  }
  return [(BWNodeInput *)self _passthroughModeForUnspecifiedAttachedMedia];
}

- (NSArray)specifiedAttachedMediaKeys
{
  return (NSArray *)[(NSMutableDictionary *)self->_attachedMediaConfigurations allKeys];
}

- (BWNode)node
{
  return self->_node;
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

- (BWNodeConnection)connection
{
  return self->_connection;
}

- (void)_setMediaProperties:(id)a3 forAttachedMediaKey:(id)a4
{
  if (!a4)
  {
    v8 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v9 = *MEMORY[0x1E4F1C3C8];
    v10 = @"Cannot set media properties for nil attachedMediaKey";
    goto LABEL_14;
  }
  if ([a4 isEqualToString:@"PrimaryFormat"])
  {
    v8 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v9 = *MEMORY[0x1E4F1C3C8];
    v10 = @"Cannot set media properties for primary media";
    goto LABEL_14;
  }
  if (!a3)
  {
    v8 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v9 = *MEMORY[0x1E4F1C3C8];
    v10 = @"Cannot set media properties to nil -- call _clearAllMediaProperties to clear all media property state";
LABEL_14:
    objc_exception_throw((id)[v8 exceptionWithName:v9 reason:v10 userInfo:0]);
  }
  attachedMediaProperties = self->_attachedMediaProperties;
  if (attachedMediaProperties)
  {
    if ([(NSMutableDictionary *)attachedMediaProperties objectForKeyedSubscript:a4])
    {
      v8 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v9 = *MEMORY[0x1E4F1C3C8];
      v10 = @"Can only set media properties once -- call _clearAllMediaProperties to clear all media property state";
      goto LABEL_14;
    }
  }
  else
  {
    self->_attachedMediaProperties = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  [a3 _setOwningNodeInput:self associatedAttachedMediaKey:a4];
  v11 = self->_attachedMediaProperties;
  [(NSMutableDictionary *)v11 setObject:a3 forKeyedSubscript:a4];
}

- (BWNodeInputMediaConfiguration)unspecifiedAttachedMediaConfiguration
{
  return self->_unspecifiedAttachedMediaConfiguration;
}

- (void)setFormat:(id)a3
{
}

- (void)setFormatRequirements:(id)a3
{
}

- (void)setPassthroughMode:(int)a3
{
}

- (BWNodeInput)initWithMediaType:(unsigned int)a3 node:(id)a4
{
  return [(BWNodeInput *)self initWithMediaType:*(void *)&a3 node:a4 index:0];
}

- (BWNodeInputMediaConfiguration)primaryMediaConfiguration
{
  return self->_primaryMediaConfiguration;
}

- (void)setUnspecifiedAttachedMediaConfiguration:(id)a3
{
}

- (void)setMediaConfiguration:(id)a3 forAttachedMediaKey:(id)a4
{
  if (!a4)
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v10 = *MEMORY[0x1E4F1C3C8];
    v11 = @"Cannot set media configuration for nil attachedMediaKey";
    goto LABEL_14;
  }
  if ([a4 isEqualToString:@"PrimaryFormat"])
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F1CA00];
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

- (BWNodeInput)initWithMediaType:(unsigned int)a3 node:(id)a4 index:(unint64_t)a5
{
  v13.receiver = self;
  v13.super_class = (Class)BWNodeInput;
  v8 = [(BWNodeInput *)&v13 init];
  uint64_t v9 = v8;
  if (v8)
  {
    v8->_mediaType = a3;
    v8->_mediaTypeIsVideo = a3 == 1986618469;
    v8->_mediaTypeIsPointCloud = a3 == 1885564004;
    v8->_node = (BWNode *)a4;
    v8->_enabled = 1;
    v8->_index = a5;
    uint64_t v10 = objc_alloc_init(BWNodeInputMediaConfiguration);
    v9->_primaryMediaConfiguration = v10;
    [(BWNodeInputMediaConfiguration *)v10 _setAssociatedAttachedMediaKey:@"PrimaryFormat"];
    v11 = objc_alloc_init(BWNodeInputMediaProperties);
    [(BWNodeInputMediaProperties *)v11 _setOwningNodeInput:v9 associatedAttachedMediaKey:@"PrimaryFormat"];
    v9->_primaryMediaProperties = v11;
  }
  return v9;
}

- (BOOL)mediaTypeIsVideo
{
  return self->_mediaTypeIsVideo;
}

- (BWVideoFormat)videoFormat
{
  return [(BWNodeInputMediaProperties *)self->_primaryMediaProperties resolvedVideoFormat];
}

- (void)setConnection:(id)a3
{
  self->_connection = (BWNodeConnection *)a3;
}

- (void)handleMessage:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int v5 = *((_DWORD *)a3 + 2);
  int v6 = *((_DWORD *)a3 + 3);
  if (v5 == 1)
  {
    if (v6 == 4)
    {
      [(BWNodeInputMediaProperties *)[(BWNodeInput *)self primaryMediaProperties] setLiveFormat:0];
    }
    else if (v6 == 3)
    {
      -[BWNodeInput _handleConfigurationLiveMessage:]((uint64_t)self, a3);
    }
    goto LABEL_15;
  }
  if (v5 == 2)
  {
    if (self->_enabled)
    {
      if (!self->_discardsSampleDataTaggedToBeDropped
        || v6 != 1
        || (v7 = (opaqueCMSampleBuffer *)[a3 sampleBuffer]) == 0
        || (v8 = v7, CMSampleBufferGetImageBuffer(v7))
        || CMSampleBufferGetDataBuffer(v8)
        || CMGetAttachment(v8, @"SampleDataToBeDropped", 0) != (CFTypeRef)*MEMORY[0x1E4F1CFD0])
      {
        ++self->_numberOfBuffersReceived;
        goto LABEL_15;
      }
      uint64_t v10 = (void *)CMGetAttachment(v8, @"SampleDataToBeDroppedEmitSampleBufferSemaphores", 0);
      long long v15 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v16;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v16 != v13) {
              objc_enumerationMutation(v10);
            }
            dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*((void *)&v15 + 1) + 8 * i));
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
        }
        while (v12);
      }
    }
    ++self->_numberOfBuffersDropped;
    return;
  }
LABEL_15:
  node = self->_node;
  [(BWNode *)node _handleMessage:a3 fromInput:self];
}

- (BWFormat)liveFormat
{
  return [(BWNodeInputMediaProperties *)self->_primaryMediaProperties liveFormat];
}

- (uint64_t)_handleConfigurationLiveMessage:(uint64_t)result
{
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = [a2 updatedFormat];
    if (v4)
    {
      int v5 = (void *)v4;
      if (objc_msgSend((id)objc_msgSend((id)v3, "primaryMediaProperties"), "liveFormat"))
      {
        result = objc_msgSend(v5, "isEqual:", objc_msgSend((id)objc_msgSend((id)v3, "primaryMediaProperties"), "liveFormat"));
        if (result) {
          return result;
        }
      }
      if (*(_DWORD *)(v3 + 32) == 1936684398) {
        [(id)v3 setFormat:v5];
      }
      else {
        objc_msgSend(v5, "isEqual:", objc_msgSend((id)v3, "format"));
      }
      objc_msgSend((id)objc_msgSend((id)v3, "primaryMediaProperties"), "setLiveFormat:", v5);
    }
    *(void *)(v3 + 72) = [a2 configurationID];
    int v6 = *(void **)(v3 + 112);
    return [v6 liveFormat];
  }
  return result;
}

- (BWNodeInputMediaProperties)primaryMediaProperties
{
  return self->_primaryMediaProperties;
}

- (BWFormat)format
{
  return [(BWNodeInputMediaProperties *)self->_primaryMediaProperties resolvedFormat];
}

- (void)setConfigurationID:(int64_t)a3
{
  self->_configurationID = a3;
}

- (int)passthroughMode
{
  return [(BWNodeInputMediaConfiguration *)self->_primaryMediaConfiguration passthroughMode];
}

- (void)setDiscardsSampleDataTaggedToBeDropped:(BOOL)a3
{
  self->_discardsSampleDataTaggedToBeDropped = a3;
}

- (id)mediaPropertiesByAttachedMediaKey
{
  v2 = (void *)[(NSMutableDictionary *)self->_attachedMediaProperties copy];
  return v2;
}

- (BWFormatRequirements)formatRequirements
{
  return [(BWNodeInputMediaConfiguration *)self->_primaryMediaConfiguration formatRequirements];
}

- (void)setIndefinitelyHeldBufferCount:(int)a3
{
}

- (void)setDelayedBufferCount:(int)a3
{
}

- (void)setConversionToPassthroughModeNeverAllowed:(BOOL)a3
{
}

- (void)setRetainedBufferCount:(int)a3
{
}

- (void)setName:(id)a3
{
}

+ (void)initialize
{
}

+ (opaqueCMSampleBuffer)newSampleDataToBeDroppedMarkerBufferFromSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  CMSampleBufferRef v13 = 0;
  CFTypeRef v4 = CMGetAttachment(a3, @"SampleDataToBeDropped", 0);
  if (v4 == (CFTypeRef)*MEMORY[0x1E4F1CFD0])
  {
    int v5 = v4;
    FormatDescription = CMSampleBufferGetFormatDescription(a3);
    long long v7 = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 48);
    *(_OWORD *)&sampleTimingArray.presentationTimeStamp.timescale = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 32);
    *(_OWORD *)&sampleTimingArray.decodeTimeStamp.value = v7;
    sampleTimingArray.decodeTimeStamp.epoch = *(void *)(MEMORY[0x1E4F1FA70] + 64);
    long long v8 = *(_OWORD *)(MEMORY[0x1E4F1FA70] + 16);
    *(_OWORD *)&sampleTimingArray.duration.value = *MEMORY[0x1E4F1FA70];
    *(_OWORD *)&sampleTimingArray.duration.epoch = v8;
    CMSampleBufferGetPresentationTimeStamp(&sampleTimingArray.presentationTimeStamp, a3);
    OSStatus v9 = CMSampleBufferCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, 1u, 0, 0, FormatDescription, 1, 1, &sampleTimingArray, 0, 0, &v13);
    result = v13;
    if (!v9 && v13)
    {
      CMSetAttachment(v13, @"SampleDataToBeDropped", v5, 1u);
      CFTypeRef v11 = CMGetAttachment(a3, @"SampleDataToBeDroppedEmitSampleBufferSemaphores", 0);
      result = v13;
      if (v11)
      {
        CMSetAttachment(v13, @"SampleDataToBeDroppedEmitSampleBufferSemaphores", v11, 1u);
        return v13;
      }
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
  return result;
}

- (void)invalidate
{
  self->_node = 0;
}

- (void)dealloc
{
  [(BWNodeInput *)self _clearAllMediaProperties];
  v3.receiver = self;
  v3.super_class = (Class)BWNodeInput;
  [(BWNodeInput *)&v3 dealloc];
}

- (NSString)description
{
  NSUInteger v3 = [(NSArray *)[[(BWNodeInput *)self node] inputs] indexOfObject:self];
  CFTypeRef v4 = NSString;
  uint64_t v5 = objc_opt_class();
  return (NSString *)[v4 stringWithFormat:@"<%@ %p> '%@' (idx: %u, owner: %@)", v5, self, BWStringForOSType(self->_mediaType), v3, -[BWNodeInput node](self, "node")];
}

- (void)_clearAllMediaProperties
{
  self->_primaryMediaProperties = 0;
  self->_attachedMediaProperties = 0;
}

- (NSArray)resolvedAttachedMediaKeys
{
  return (NSArray *)[(NSMutableDictionary *)self->_attachedMediaProperties allKeys];
}

- (id)osStatePropertyList
{
  NSUInteger v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  [v3 setObject:self->_name forKeyedSubscript:@"name"];
  [v3 setObject:BWStringForOSType(self->_mediaType) forKeyedSubscript:@"mediaType"];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithLongLong:", self->_liveConfigurationID), @"liveConfigurationID");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", -[BWFormat description](-[BWNodeInput liveFormat](self, "liveFormat"), "description"), @"liveFormat");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", -[BWNode osStatePropertyListWithVerbose:](-[BWNodeOutput node](-[BWNodeConnection output](-[BWNodeInput connection](self, "connection"), "output"), "node"), "osStatePropertyListWithVerbose:", 0), @"node");
  return v3;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)mediaTypeIsPointCloud
{
  return self->_mediaTypeIsPointCloud;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)discardsSampleDataTaggedToBeDropped
{
  return self->_discardsSampleDataTaggedToBeDropped;
}

- (int64_t)configurationID
{
  return self->_configurationID;
}

- (int64_t)liveConfigurationID
{
  return self->_liveConfigurationID;
}

- (unsigned)numberOfBuffersReceived
{
  return self->_numberOfBuffersReceived;
}

- (unsigned)numberOfBuffersDropped
{
  return self->_numberOfBuffersDropped;
}

- (BOOL)conversionToPassthroughModeNeverAllowed
{
  return [(BWNodeInputMediaConfiguration *)self->_primaryMediaConfiguration conversionToPassthroughModeNeverAllowed];
}

- (int)retainedBufferCount
{
  return [(BWNodeInputMediaConfiguration *)self->_primaryMediaConfiguration retainedBufferCount];
}

- (int)delayedBufferCount
{
  return [(BWNodeInputMediaConfiguration *)self->_primaryMediaConfiguration delayedBufferCount];
}

- (int)indefinitelyHeldBufferCount
{
  return [(BWNodeInputMediaConfiguration *)self->_primaryMediaConfiguration indefinitelyHeldBufferCount];
}

@end