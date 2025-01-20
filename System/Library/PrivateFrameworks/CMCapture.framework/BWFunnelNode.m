@interface BWFunnelNode
+ (void)initialize;
- (BWFunnelNode)initWithNumberOfInputs:(int)a3 mediaType:(unsigned int)a4;
- (BWFunnelNode)initWithNumberOfInputs:(int)a3 mediaType:(unsigned int)a4 holdMessages:(BOOL)a5;
- (void)_deliverQueuedMessages;
- (void)_handleMessage:(id)a3 fromInput:(id)a4;
- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5;
- (void)dealloc;
- (void)didReachEndOfDataForInput:(id)a3;
- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5;
- (void)handleDroppedSample:(id)a3 forInput:(id)a4;
- (void)handleNodeError:(id)a3 forInput:(id)a4;
- (void)handleStillImageReferenceFrameBracketedCaptureSequenceNumber:(int)a3 forInput:(id)a4;
- (void)prepareForCurrentConfigurationToBecomeLive;
- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4;
@end

@implementation BWFunnelNode

- (void)didSelectFormat:(id)a3 forInput:(id)a4 forAttachedMediaKey:(id)a5
{
  v8 = -[BWNodeOutput mediaPropertiesForAttachedMediaKey:](self->super._output, "mediaPropertiesForAttachedMediaKey:", a5, a4);
  if (!v8)
  {
    v8 = objc_alloc_init(BWNodeOutputMediaProperties);
    [(BWNodeOutput *)self->super._output _setMediaProperties:v8 forAttachedMediaKey:a5];
  }
  [(BWNodeOutputMediaProperties *)v8 setResolvedFormat:a3];
}

- (BWFunnelNode)initWithNumberOfInputs:(int)a3 mediaType:(unsigned int)a4 holdMessages:(BOOL)a5
{
  if (a3 <= 0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Non-positive fan in count" userInfo:0]);
  }
  BOOL v5 = a5;
  uint64_t v6 = *(void *)&a4;
  int v7 = a3;
  v15.receiver = self;
  v15.super_class = (Class)BWFunnelNode;
  v8 = [(BWNode *)&v15 init];
  v9 = v8;
  if (v8)
  {
    [(BWNode *)v8 setSupportsConcurrentLiveInputCallbacks:0];
    v9->_holdMessagesUntilAllInputsAreLive = v5;
    if (v5)
    {
      v9->_queuedMessages = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v9->_inputsForQueuedMessages = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    do
    {
      v10 = [[BWNodeInput alloc] initWithMediaType:v6 node:v9];
      if (v6 == 1986618469)
      {
        v11 = objc_alloc_init(BWVideoFormatRequirements);
        [(BWNodeInput *)v10 setFormatRequirements:v11];
      }
      [(BWNodeInput *)v10 setPassthroughMode:1];
      [(BWNode *)v9 addInput:v10];

      --v7;
    }
    while (v7);
    v12 = [[BWNodeOutput alloc] initWithMediaType:v6 node:v9];
    if (v6 == 1986618469)
    {
      v13 = objc_alloc_init(BWVideoFormatRequirements);
      [(BWNodeOutput *)v12 setFormatRequirements:v13];
    }
    v9->_stateLock._os_unfair_lock_opaque = 0;
    [(BWNodeOutput *)v12 setPassthroughMode:1];
    [(BWNode *)v9 addOutput:v12];
  }
  return v9;
}

- (void)_handleMessage:(id)a3 fromInput:(id)a4
{
  if (!self->_holdMessagesUntilAllInputsAreLive) {
    goto LABEL_4;
  }
  if ([(BWNode *)self allInputsHaveReachedState:1])
  {
    -[BWFunnelNode _deliverQueuedMessages]((uint64_t)self);
LABEL_4:
    v8.receiver = self;
    v8.super_class = (Class)BWFunnelNode;
    [(BWNode *)&v8 _handleMessage:a3 fromInput:a4];
    return;
  }
  [(NSMutableArray *)self->_queuedMessages addObject:a3];
  inputsForQueuedMessages = self->_inputsForQueuedMessages;
  [(NSMutableArray *)inputsForQueuedMessages addObject:a4];
}

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  if (-[BWNode allInputsHaveReachedState:](self, "allInputsHaveReachedState:", 1, a4, a5))
  {
    if (![(BWNodeOutput *)self->super._output liveFormat])
    {
      [(BWNodeOutput *)self->super._output makeConfiguredFormatLive];
      self->_running = 1;
    }
  }
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
}

- (void)handleDroppedSample:(id)a3 forInput:(id)a4
{
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v3 = [(BWNode *)self inputs];
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_super v8 = *(BWNodeInput **)(*((void *)&v10 + 1) + 8 * i);
        if (v8 != self->super._input) {
          [(BWFormat *)[(BWNodeInput *)v8 format] isEqual:[(BWNodeInput *)self->super._input format]];
        }
      }
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  v9.receiver = self;
  v9.super_class = (Class)BWFunnelNode;
  [(BWNode *)&v9 prepareForCurrentConfigurationToBecomeLive];
}

- (BWFunnelNode)initWithNumberOfInputs:(int)a3 mediaType:(unsigned int)a4
{
  return [(BWFunnelNode *)self initWithNumberOfInputs:*(void *)&a3 mediaType:*(void *)&a4 holdMessages:0];
}

+ (void)initialize
{
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWFunnelNode;
  [(BWNode *)&v3 dealloc];
}

- (void)_deliverQueuedMessages
{
  if (a1)
  {
    if ([*(id *)(a1 + 104) count])
    {
      unint64_t v2 = 0;
      do
      {
        uint64_t v3 = [*(id *)(a1 + 104) objectAtIndexedSubscript:v2];
        uint64_t v4 = [*(id *)(a1 + 112) objectAtIndexedSubscript:v2];
        v5.receiver = (id)a1;
        v5.super_class = (Class)BWFunnelNode;
        objc_msgSendSuper2(&v5, sel__handleMessage_fromInput_, v3, v4);
        ++v2;
      }
      while (v2 < [*(id *)(a1 + 104) count]);
    }
    [*(id *)(a1 + 104) removeAllObjects];

    *(void *)(a1 + 104) = 0;
    [*(id *)(a1 + 112) removeAllObjects];

    *(void *)(a1 + 112) = 0;
    *(unsigned char *)(a1 + 96) = 0;
  }
}

- (void)didReachEndOfDataForInput:(id)a3
{
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  if ([(BWNode *)self allInputsHaveReachedState:0] && self->_running)
  {
    self->_running = 0;
    os_unfair_lock_unlock(p_stateLock);
    output = self->super._output;
    [(BWNodeOutput *)output markEndOfLiveOutput];
  }
  else
  {
    os_unfair_lock_unlock(p_stateLock);
  }
}

- (void)handleNodeError:(id)a3 forInput:(id)a4
{
}

- (void)handleStillImageReferenceFrameBracketedCaptureSequenceNumber:(int)a3 forInput:(id)a4
{
}

@end