@interface BWFanOutNode
+ (void)initialize;
- (BOOL)hasNonLiveConfigurationChanges;
- (BWFanOutNode)initWithFanOutCount:(int)a3 mediaType:(unsigned int)a4;
- (id)nodeSubType;
- (id)nodeType;
- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5;
- (void)dealloc;
- (void)didReachEndOfDataForInput:(id)a3;
- (void)didSelectFormat:(id)a3 forInput:(id)a4;
- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5;
- (void)handleDroppedSample:(id)a3 forInput:(id)a4;
- (void)handleNodeError:(id)a3 forInput:(id)a4;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
- (void)setAllowedAttachedMediaKeys:(id)a3 forOutputIndex:(int)a4;
- (void)setDisallowedAttachedMediaKeys:(id)a3 forOutputIndex:(int)a4;
- (void)setDiscardsAttachedMedia:(BOOL)a3 forOutputIndex:(int)a4;
@end

@implementation BWFanOutNode

- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5
{
  if ([a5 isEqualToString:@"PrimaryFormat"])
  {
    [(BWFanOutNode *)self didSelectFormat:a3 forInput:a4];
  }
  else
  {
    v9 = [(BWNode *)self outputs];
    if ([(NSArray *)v9 count])
    {
      unint64_t v10 = 0;
      do
      {
        id v11 = [(NSArray *)v9 objectAtIndexedSubscript:v10];
        uint64_t v12 = objc_msgSend(v11, "attachedMediaKeyDrivenByInputAttachedMediaKey:inputIndex:", a5, objc_msgSend(a4, "index"));
        if (v12)
        {
          uint64_t v13 = v12;
          if ((!objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_outputsAllowedAttachedMediaKeys, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v10)), "count")|| objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_outputsAllowedAttachedMediaKeys, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v10)), "containsObject:", a5))&& (objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_outputsDisallowedAttachedMediaKeys, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v10)), "containsObject:", a5) & 1) == 0)
          {
            v14 = (BWNodeOutputMediaProperties *)[v11 mediaPropertiesForAttachedMediaKey:v13];
            if (!v14)
            {
              v14 = objc_alloc_init(BWNodeOutputMediaProperties);
              [v11 _setMediaProperties:v14 forAttachedMediaKey:v13];
            }
            [(BWNodeOutputMediaProperties *)v14 setResolvedFormat:a3];
          }
        }
        ++v10;
      }
      while (v10 < [(NSArray *)v9 count]);
    }
  }
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = [(BWNode *)self outputs];
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) setFormat:a3];
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (BWFanOutNode)initWithFanOutCount:(int)a3 mediaType:(unsigned int)a4
{
  if (a3 < 0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Negative fan count" userInfo:0]);
  }
  uint64_t v4 = *(void *)&a4;
  v14.receiver = self;
  v14.super_class = (Class)BWFanOutNode;
  uint64_t v6 = [(BWNode *)&v14 init];
  if (v6)
  {
    uint64_t v7 = [[BWNodeInput alloc] initWithMediaType:v4 node:v6];
    if (v4 == 1986618469)
    {
      uint64_t v8 = objc_alloc_init(BWVideoFormatRequirements);
      [(BWNodeInput *)v7 setFormatRequirements:v8];
    }
    [(BWNodeInput *)v7 setPassthroughMode:1];
    [(BWNode *)v6 addInput:v7];

    uint64_t v9 = a3;
    v6->_outputsCArray = (id *)malloc_type_malloc(8 * a3, 0x80040B8603338uLL);
    v6->_outputsDiscardsAttachedMedia = (BOOL *)malloc_type_malloc(a3, 0x100004077774924uLL);
    v6->_outputsAllowedAttachedMediaKeys = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:a3];
    v6->_outputsCount = a3;
    if (a3)
    {
      uint64_t v10 = 0;
      do
      {
        long long v11 = [[BWNodeOutput alloc] initWithMediaType:v4 node:v6];
        if (v4 == 1986618469)
        {
          long long v12 = objc_alloc_init(BWVideoFormatRequirements);
          [(BWNodeOutput *)v11 setFormatRequirements:v12];
        }
        [(BWNodeOutput *)v11 setPassthroughMode:1];
        [(BWNodeOutput *)v11 setIndexOfInputWhichDrivesThisOutput:0];
        [(BWNode *)v6 addOutput:v11];

        v6->_outputsCArray[v10] = v11;
        v6->_outputsDiscardsAttachedMedia[v10++] = 0;
      }
      while (v9 != v10);
    }
    [(BWNode *)v6 setSupportsLiveReconfiguration:1];
  }
  return v6;
}

- (id)nodeType
{
  return @"Demuxer";
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  if (self->_outputsCount >= 1)
  {
    uint64_t v4 = a3;
    uint64_t v6 = 0;
    do
    {
      if ((objc_msgSend(self->_outputsCArray[v6], "discardsSampleData", a3, a4) & 1) == 0)
      {
        CFTypeRef cf = 0;
        if (v4)
        {
          if (v6 >= self->_outputsCount - 1) {
            CFTypeRef cf = CFRetain(v4);
          }
          else {
            BWCMSampleBufferCreateCopyIncludingMetadata(v4, (CMSampleBufferRef *)&cf);
          }
          if (self->_outputsDiscardsAttachedMedia[v6])
          {
            BWSampleBufferRemoveAllAttachedMedia(cf);
          }
          else if (-[NSMutableDictionary objectForKeyedSubscript:](self->_outputsAllowedAttachedMediaKeys, "objectForKeyedSubscript:", [NSNumber numberWithInt:v6]))
          {
            BWSampleBufferFilterWithAllowedAttachedMedia(cf, (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_outputsAllowedAttachedMediaKeys, "objectForKeyedSubscript:", [NSNumber numberWithInt:v6]));
          }
          else if (-[NSMutableDictionary objectForKeyedSubscript:](self->_outputsDisallowedAttachedMediaKeys, "objectForKeyedSubscript:", [NSNumber numberWithInt:v6]))
          {
            BWSampleBufferFilterWithDisallowedAttachedMedia(cf, (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_outputsDisallowedAttachedMediaKeys, "objectForKeyedSubscript:", [NSNumber numberWithInt:v6]));
          }
          a3 = (opaqueCMSampleBuffer *)cf;
          if (cf)
          {
            objc_msgSend(self->_outputsCArray[v6], "emitSampleBuffer:");
            if (cf) {
              CFRelease(cf);
            }
          }
        }
      }
      ++v6;
    }
    while (v6 < self->_outputsCount);
  }
}

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  if (self->_outputsCount >= 1)
  {
    uint64_t v6 = 0;
    do
      objc_msgSend(self->_outputsCArray[v6++], "makeConfiguredFormatLive", a3, a4, a5);
    while (v6 < self->_outputsCount);
  }
}

- (void)handleDroppedSample:(id)a3 forInput:(id)a4
{
  if (self->_outputsCount >= 1)
  {
    uint64_t v6 = 0;
    do
      objc_msgSend(self->_outputsCArray[v6++], "emitDroppedSample:", a3, a4);
    while (v6 < self->_outputsCount);
  }
}

- (void)setDiscardsAttachedMedia:(BOOL)a3 forOutputIndex:(int)a4
{
  BOOL v5 = a3;
  id v7 = [(NSArray *)[(BWNode *)self outputs] objectAtIndexedSubscript:a4];
  uint64_t v8 = v7;
  if (v5 && ![v7 unspecifiedAttachedMediaConfiguration]) {
    [v8 setUnspecifiedAttachedMediaConfiguration:objc_alloc_init(BWNodeOutputMediaConfiguration)];
  }
  self->_outputsDiscardsAttachedMedia[a4] = v5;
  uint64_t v9 = (void *)[v8 unspecifiedAttachedMediaConfiguration];
  [v9 setPassthroughMode:!v5];
}

+ (void)initialize
{
}

- (void)dealloc
{
  free(self->_outputsCArray);
  free(self->_outputsDiscardsAttachedMedia);

  v3.receiver = self;
  v3.super_class = (Class)BWFanOutNode;
  [(BWNode *)&v3 dealloc];
}

- (void)setAllowedAttachedMediaKeys:(id)a3 forOutputIndex:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ([a3 count])
  {
    id v7 = [(NSArray *)[(BWNode *)self outputs] objectAtIndexedSubscript:(int)v4];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v8 = [a3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(a3);
          }
          uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * v11);
          long long v13 = objc_alloc_init(BWNodeOutputMediaConfiguration);
          [(BWNodeOutputMediaConfiguration *)v13 setPassthroughMode:1];
          [v7 setMediaConfiguration:v13 forAttachedMediaKey:v12];
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [a3 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }
    if (![v7 unspecifiedAttachedMediaConfiguration]) {
      [v7 setUnspecifiedAttachedMediaConfiguration:objc_alloc_init(BWNodeOutputMediaConfiguration)];
    }
    objc_msgSend((id)objc_msgSend(v7, "unspecifiedAttachedMediaConfiguration"), "setPassthroughMode:", 0);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_outputsAllowedAttachedMediaKeys, "setObject:forKeyedSubscript:", a3, [NSNumber numberWithInt:v4]);
  }
}

- (void)setDisallowedAttachedMediaKeys:(id)a3 forOutputIndex:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  if ([a3 count])
  {
    outputsDisallowedAttachedMediaKeys = self->_outputsDisallowedAttachedMediaKeys;
    if (!outputsDisallowedAttachedMediaKeys)
    {
      outputsDisallowedAttachedMediaKeys = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      self->_outputsDisallowedAttachedMediaKeys = outputsDisallowedAttachedMediaKeys;
    }
    uint64_t v8 = [NSNumber numberWithInt:v4];
    [(NSMutableDictionary *)outputsDisallowedAttachedMediaKeys setObject:a3 forKeyedSubscript:v8];
  }
}

- (id)nodeSubType
{
  return @"FanOut";
}

- (BOOL)hasNonLiveConfigurationChanges
{
  return 0;
}

- (void)didReachEndOfDataForInput:(id)a3
{
  if (self->_outputsCount >= 1)
  {
    uint64_t v4 = 0;
    do
      objc_msgSend(self->_outputsCArray[v4++], "markEndOfLiveOutput", a3);
    while (v4 < self->_outputsCount);
  }
}

- (void)handleNodeError:(id)a3 forInput:(id)a4
{
  if (self->_outputsCount >= 1)
  {
    uint64_t v6 = 0;
    do
      objc_msgSend(self->_outputsCArray[v6++], "emitNodeError:", a3, a4);
    while (v6 < self->_outputsCount);
  }
}

@end