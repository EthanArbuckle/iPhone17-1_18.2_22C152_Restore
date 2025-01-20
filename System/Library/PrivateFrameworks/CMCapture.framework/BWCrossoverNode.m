@interface BWCrossoverNode
+ (void)initialize;
- (BWCrossoverNode)initWithMediaType:(unsigned int)a3 numberOfInputs:(unsigned int)a4;
- (id)nodeSubType;
- (id)nodeType;
- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5;
- (void)didReachEndOfDataForInput:(id)a3;
- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5;
- (void)handleDroppedSample:(id)a3 forInput:(id)a4;
- (void)handleNodeError:(id)a3 forInput:(id)a4;
- (void)handleStillImageReferenceFrameBracketedCaptureSequenceNumber:(int)a3 forInput:(id)a4;
- (void)prepareForCurrentConfigurationToBecomeLive;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
@end

@implementation BWCrossoverNode

- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5
{
  v7 = [(BWNode *)self output];
  v8 = [(BWNodeOutput *)v7 mediaPropertiesForAttachedMediaKey:a5];
  if (!v8)
  {
    v8 = objc_alloc_init(BWNodeOutputMediaProperties);
    [(BWNodeOutput *)v7 _setMediaProperties:v8 forAttachedMediaKey:a5];
  }
  [(BWNodeOutputMediaProperties *)v8 setResolvedFormat:a3];
}

- (id)nodeType
{
  return @"Muxer";
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  if (objc_msgSend((id)objc_msgSend((id)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0), "objectForKeyedSubscript:", *MEMORY[0x1E4F542E0]), "BOOLValue"))
  {
    if (a3) {
      CFRetain(a3);
    }
    os_unfair_lock_lock(&self->_bufferServicingLock);
    [(BWNodeOutput *)self->super._output emitSampleBuffer:a3];
    if (a3) {
      CFRelease(a3);
    }
    os_unfair_lock_unlock(&self->_bufferServicingLock);
  }
}

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  p_bufferServicingLock = &self->_bufferServicingLock;
  os_unfair_lock_lock(&self->_bufferServicingLock);
  if (![(BWNodeOutput *)self->super._output liveFormat]) {
    [(BWNodeOutput *)self->super._output makeConfiguredFormatLive];
  }
  os_unfair_lock_unlock(p_bufferServicingLock);
}

- (BWCrossoverNode)initWithMediaType:(unsigned int)a3 numberOfInputs:(unsigned int)a4
{
  uint64_t v5 = *(void *)&a3;
  v16.receiver = self;
  v16.super_class = (Class)BWCrossoverNode;
  v6 = [(BWNode *)&v16 init];
  v7 = v6;
  if (v6)
  {
    [(BWNode *)v6 setSupportsConcurrentLiveInputCallbacks:1];
    v8 = (void *)[MEMORY[0x1E4F1CA48] array];
    if (a4)
    {
      uint64_t v9 = 0;
      uint64_t v10 = a4;
      do
      {
        v11 = [[BWNodeInput alloc] initWithMediaType:v5 node:v7 index:v9];
        v12 = objc_alloc_init(BWVideoFormatRequirements);
        [(BWNodeInputMediaConfiguration *)[(BWNodeInput *)v11 primaryMediaConfiguration] setFormatRequirements:v12];

        [(BWNodeInputMediaConfiguration *)[(BWNodeInput *)v11 primaryMediaConfiguration] setPassthroughMode:1];
        [(BWNode *)v7 addInput:v11];

        objc_msgSend(v8, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v9++));
      }
      while (v10 != v9);
    }
    v13 = [[BWNodeOutput alloc] initWithMediaType:v5 node:v7];
    v14 = objc_alloc_init(BWVideoFormatRequirements);
    [(BWNodeOutputMediaConfiguration *)[(BWNodeOutput *)v13 primaryMediaConfiguration] setFormatRequirements:v14];

    [(BWNodeOutputMediaConfiguration *)[(BWNodeOutput *)v13 primaryMediaConfiguration] setPassthroughMode:1];
    [(BWNodeOutputMediaConfiguration *)[(BWNodeOutput *)v13 primaryMediaConfiguration] setIndexesOfInputsWhichDrivesThisOutput:v8];
    [(BWNode *)v7 addOutput:v13];

    v7->_bufferServicingLock._os_unfair_lock_opaque = 0;
  }
  return v7;
}

+ (void)initialize
{
}

- (id)nodeSubType
{
  return @"Crossover";
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  BWUtilitiesWarnIfInputFormatsMismatch([(BWNode *)self inputs], self->super._input);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  obj = [(BWNode *)self inputs];
  uint64_t v12 = [(NSArray *)obj countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v12)
  {
    uint64_t v11 = *(void *)v19;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(obj);
        }
        v4 = *(BWNodeInput **)(*((void *)&v18 + 1) + 8 * v3);
        if (v4 != self->super._input)
        {
          long long v16 = 0u;
          long long v17 = 0u;
          long long v14 = 0u;
          long long v15 = 0u;
          uint64_t v5 = [(BWNodeInput *)v4 resolvedAttachedMediaKeys];
          uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v22 count:16];
          if (v6)
          {
            uint64_t v7 = v6;
            uint64_t v8 = *(void *)v15;
            do
            {
              uint64_t v9 = 0;
              do
              {
                if (*(void *)v15 != v8) {
                  objc_enumerationMutation(v5);
                }
                objc_msgSend((id)objc_msgSend(-[BWNodeInput mediaPropertiesForAttachedMediaKey:](v4, "mediaPropertiesForAttachedMediaKey:", *(void *)(*((void *)&v14 + 1) + 8 * v9)), "resolvedFormat"), "isEqual:", objc_msgSend(-[BWNodeInput mediaPropertiesForAttachedMediaKey:](self->super._input, "mediaPropertiesForAttachedMediaKey:", *(void *)(*((void *)&v14 + 1) + 8 * v9)), "resolvedFormat"));
                ++v9;
              }
              while (v7 != v9);
              uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v22 count:16];
            }
            while (v7);
          }
        }
        ++v3;
      }
      while (v3 != v12);
      uint64_t v12 = [(NSArray *)obj countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v12);
  }
  v13.receiver = self;
  v13.super_class = (Class)BWCrossoverNode;
  [(BWNode *)&v13 prepareForCurrentConfigurationToBecomeLive];
}

- (void)didReachEndOfDataForInput:(id)a3
{
  unsigned int v4 = atomic_fetch_add_explicit(&self->_numEODMessagesReceived, 1u, memory_order_relaxed) + 1;
  if ([(NSArray *)[(BWNode *)self inputs] count] == v4)
  {
    os_unfair_lock_lock(&self->_bufferServicingLock);
    [(BWNodeOutput *)self->super._output markEndOfLiveOutput];
    os_unfair_lock_unlock(&self->_bufferServicingLock);
    self->_numEODMessagesReceived = 0;
  }
}

- (void)handleNodeError:(id)a3 forInput:(id)a4
{
  p_bufferServicingLock = &self->_bufferServicingLock;
  os_unfair_lock_lock(&self->_bufferServicingLock);
  [(BWNodeOutput *)self->super._output emitNodeError:a3];
  os_unfair_lock_unlock(p_bufferServicingLock);
}

- (void)handleDroppedSample:(id)a3 forInput:(id)a4
{
  p_bufferServicingLock = &self->_bufferServicingLock;
  os_unfair_lock_lock(&self->_bufferServicingLock);
  [(BWNodeOutput *)self->super._output emitDroppedSample:a3];
  os_unfair_lock_unlock(p_bufferServicingLock);
}

- (void)handleStillImageReferenceFrameBracketedCaptureSequenceNumber:(int)a3 forInput:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  p_bufferServicingLock = &self->_bufferServicingLock;
  os_unfair_lock_lock(&self->_bufferServicingLock);
  [(BWNodeOutput *)self->super._output emitStillImageReferenceFrameBracketedCaptureSequenceNumberMessageWithSequenceNumber:v4];
  os_unfair_lock_unlock(p_bufferServicingLock);
}

@end