@interface _MTLParallelRenderCommandEncoder
- (BOOL)isMemorylessRender;
- (MTLDevice)device;
- (NSString)description;
- (_MTLParallelRenderCommandEncoder)initWithCommandBuffer:(id)a3 renderPassDescriptor:(id)a4;
- (id)_renderCommandEncoderCommon;
- (id)commandBuffer;
- (id)endEncodingAndRetrieveProgramAddressTable;
- (id)formattedDescription:(unint64_t)a3;
- (id)renderCommandEncoder;
- (id)sampledRenderCommandEncoderWithProgramInfoBuffer:(id *)a3 capacity:(unint64_t)a4;
- (unint64_t)globalTraceObjectID;
- (void)dealloc;
- (void)endEncoding;
- (void)initializeEnhancedCommandBufferErrors;
- (void)insertDebugSignpost:(id)a3;
- (void)preEndEncoding;
- (void)setColorStoreAction:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setDepthStoreAction:(unint64_t)a3;
- (void)setStencilStoreAction:(unint64_t)a3;
@end

@implementation _MTLParallelRenderCommandEncoder

- (_MTLParallelRenderCommandEncoder)initWithCommandBuffer:(id)a3 renderPassDescriptor:(id)a4
{
  if (a3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (a4) {
        goto LABEL_4;
      }
LABEL_12:
      v17 = @"framebuffer must not be nil.";
      unint64_t v18 = 0;
      uint64_t v19 = 40;
LABEL_14:
      MTLReportFailure(v18, "-[_MTLParallelRenderCommandEncoder initWithCommandBuffer:renderPassDescriptor:]", v19, (uint64_t)v17, v4, v5, v6, v7, (uint64_t)v20.receiver);
      goto LABEL_5;
    }
    v14 = @"commandBuffer is not a MTLCommandBuffer.";
    unint64_t v15 = 1;
    uint64_t v16 = 37;
  }
  else
  {
    v14 = @"commandBuffer must not be nil.";
    unint64_t v15 = 0;
    uint64_t v16 = 34;
  }
  MTLReportFailure(v15, "-[_MTLParallelRenderCommandEncoder initWithCommandBuffer:renderPassDescriptor:]", v16, (uint64_t)v14, v4, v5, v6, v7, (uint64_t)v20.receiver);
  if (!a4) {
    goto LABEL_12;
  }
LABEL_4:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v17 = @"render pass descriptor is not an MTLRenderPassDescriptor.";
    unint64_t v18 = 1;
    uint64_t v19 = 43;
    goto LABEL_14;
  }
LABEL_5:
  v20.receiver = self;
  v20.super_class = (Class)_MTLParallelRenderCommandEncoder;
  v11 = [(_MTLObjectWithLabel *)&v20 init];
  if (v11)
  {
    v11->_device = (MTLDevice *)(id)[a3 device];
    v11->_queue = (MTLCommandQueue *)(id)[a3 commandQueue];
    v11->_commandBuffer = (MTLCommandBuffer *)a3;
    v11->_renderPassDescriptor = (MTLRenderPassDescriptor *)[a4 copy];
    [(_MTLParallelRenderCommandEncoder *)v11 initializeEnhancedCommandBufferErrors];
    [(MTLCommandBuffer *)v11->_commandBuffer setCurrentCommandEncoder:v11];
    pthread_mutex_init(&v11->_lock, 0);
    v11->_retainedReferences = [(MTLCommandBuffer *)v11->_commandBuffer retainedReferences];
    v11->_commandBuffersSize = 16;
    v11->_commandBuffers = (id *)malloc_type_malloc(0x80uLL, 0x80040B8603338uLL);
    int v12 = [(MTLCommandBuffer *)v11->_commandBuffer isStatEnabled];
    v11->_StatEnabled = v12;
    if (v12) {
      v11->_numThisEncoder = [(MTLCommandBuffer *)v11->_commandBuffer getAndIncrementNumEncoders];
    }
  }
  return v11;
}

- (void)initializeEnhancedCommandBufferErrors
{
  self->_needsFrameworkAssistedErrorTracking = [(MTLDevice *)self->_device getSupportedCommandBufferErrorOptions] == 0;
  if ([(MTLCommandBuffer *)self->_commandBuffer errorOptions])
  {
    [(MTLCommandBuffer *)self->_commandBuffer initProgressTracking];
    if (self->_needsFrameworkAssistedErrorTracking)
    {
      self->_progressFence = (MTLFence *)[(MTLDevice *)self->_device newFence];
      commandBuffer = self->_commandBuffer;
      if (*((unsigned char *)self->_device + 328))
      {
        uint64_t v4 = (void *)[(MTLCommandBuffer *)commandBuffer progressTrackingRenderCommandEncoder];
        [v4 setRenderPipelineState:*((void *)self->_device + 42)];
        uint64_t v5 = self->_commandBuffer;
        uint64_t v6 = *((void *)v5 + 64);
        int v7 = *((_DWORD *)v5 + 130);
        *((_DWORD *)v5 + 130) = v7 + 1;
        [v4 setVertexBuffer:v6 offset:(4 * v7) atIndex:0];
        [v4 drawPrimitives:0 vertexStart:0 vertexCount:1];
        [v4 updateFence:self->_progressFence afterStages:1];
      }
      else
      {
        uint64_t v4 = (void *)[(MTLCommandBuffer *)commandBuffer progressTrackingBlitCommandEncoder];
        v8 = self->_commandBuffer;
        uint64_t v9 = *((void *)v8 + 64);
        int v10 = *((_DWORD *)v8 + 130);
        *((_DWORD *)v8 + 130) = v10 + 1;
        objc_msgSend(v4, "fillBuffer:range:value:", v9, (4 * v10), 4, 255);
        [v4 updateFence:self->_progressFence];
      }
      [v4 endEncoding];
    }
  }
}

- (void)dealloc
{
  self->_device = 0;
  self->_queue = 0;

  self->_renderPassDescriptor = 0;
  if (self->_commandBuffersCount)
  {
    unint64_t v3 = 0;
    do

    while (v3 < self->_commandBuffersCount);
  }
  free(self->_commandBuffers);
  v4.receiver = self;
  v4.super_class = (Class)_MTLParallelRenderCommandEncoder;
  [(_MTLObjectWithLabel *)&v4 dealloc];
}

- (id)formattedDescription:(unint64_t)a3
{
  v15[6] = *MEMORY[0x1E4F143B8];
  unint64_t v4 = a3 + 4;
  uint64_t v5 = [@"\n" stringByPaddingToLength:a3 + 4 withString:@" " startingAtIndex:0];
  uint64_t v6 = [(_MTLObjectWithLabel *)self retainedLabel];
  int v7 = NSString;
  v14.receiver = self;
  v14.super_class = (Class)_MTLParallelRenderCommandEncoder;
  v8 = [(_MTLParallelRenderCommandEncoder *)&v14 description];
  v15[0] = v5;
  v15[1] = @"label =";
  if (v6) {
    uint64_t v9 = v6;
  }
  else {
    uint64_t v9 = @"<none>";
  }
  v15[2] = v9;
  v15[3] = v5;
  v15[4] = @"device =";
  device = self->_device;
  if (device) {
    v11 = (__CFString *)[(MTLDevice *)device formattedDescription:v4];
  }
  else {
    v11 = @"<null>";
  }
  v15[5] = v11;
  int v12 = (void *)[v7 stringWithFormat:@"%@%@", v8, objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v15, 6), "componentsJoinedByString:", @" "];

  return v12;
}

- (NSString)description
{
  return (NSString *)[(_MTLParallelRenderCommandEncoder *)self formattedDescription:0];
}

- (id)commandBuffer
{
  return self->_commandBuffer;
}

- (id)_renderCommandEncoderCommon
{
  BOOL retainedReferences = self->_retainedReferences;
  queue = self->_queue;
  if (retainedReferences) {
    uint64_t v5 = (void *)[(MTLCommandQueue *)queue commandBuffer];
  }
  else {
    uint64_t v5 = (void *)[(MTLCommandQueue *)queue commandBufferWithUnretainedReferences];
  }
  id v6 = v5;
  [v6 signalCommandBufferAvailable];
  [v6 setOwnedByParallelEncoder:1];
  [v6 setErrorOptions:0];
  commandBuffer = self->_commandBuffer;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __63___MTLParallelRenderCommandEncoder__renderCommandEncoderCommon__block_invoke;
  v11[3] = &unk_1E521FA10;
  v11[4] = v6;
  [(MTLCommandBuffer *)commandBuffer addCompletedHandler:v11];
  if (self->_StatEnabled)
  {
    objc_msgSend(v6, "setNumEncoders:", -[MTLCommandBuffer getAndIncrementNumEncoders](self->_commandBuffer, "getAndIncrementNumEncoders") - 1);
    objc_msgSend(v6, "setNumThisCommandBuffer:", -[MTLCommandBuffer numThisCommandBuffer](self->_commandBuffer, "numThisCommandBuffer"));
  }
  pthread_mutex_lock(&self->_lock);
  unint64_t commandBuffersCount = self->_commandBuffersCount;
  if (commandBuffersCount == self->_commandBuffersSize)
  {
    self->_commandBuffersSize = 2 * commandBuffersCount;
    commandBuffers = (id *)malloc_type_realloc(self->_commandBuffers, 16 * commandBuffersCount, 0x80040B8603338uLL);
    self->_commandBuffers = commandBuffers;
    unint64_t commandBuffersCount = self->_commandBuffersCount;
  }
  else
  {
    commandBuffers = self->_commandBuffers;
  }
  self->_unint64_t commandBuffersCount = commandBuffersCount + 1;
  commandBuffers[commandBuffersCount] = v6;
  pthread_mutex_unlock(&self->_lock);
  return v6;
}

- (id)renderCommandEncoder
{
  unint64_t v3 = objc_msgSend(-[_MTLParallelRenderCommandEncoder _renderCommandEncoderCommon](self, "_renderCommandEncoderCommon"), "renderCommandEncoderWithDescriptor:", self->_renderPassDescriptor);
  if (MTLTraceEnabled())
  {
    [(_MTLParallelRenderCommandEncoder *)self globalTraceObjectID];
    [v3 globalTraceObjectID];
    kdebug_trace();
  }
  return v3;
}

- (id)sampledRenderCommandEncoderWithProgramInfoBuffer:(id *)a3 capacity:(unint64_t)a4
{
  uint64_t v5 = objc_msgSend(-[_MTLParallelRenderCommandEncoder _renderCommandEncoderCommon](self, "_renderCommandEncoderCommon"), "sampledRenderCommandEncoderWithDescriptor:programInfoBuffer:capacity:", self->_renderPassDescriptor, a3, a4);
  if (MTLTraceEnabled())
  {
    [(_MTLParallelRenderCommandEncoder *)self globalTraceObjectID];
    [v5 globalTraceObjectID];
    kdebug_trace();
  }
  return v5;
}

- (void)preEndEncoding
{
  if (([(MTLCommandBuffer *)self->_commandBuffer errorOptions] & 1) != 0
    && self->_needsFrameworkAssistedErrorTracking)
  {
    id v3 = [(_MTLParallelRenderCommandEncoder *)self renderCommandEncoder];
    [v3 waitForFence:self->_progressFence beforeStages:1];
    [v3 updateFence:self->_progressFence afterStages:2];
    [v3 endEncoding];
  }
}

- (id)endEncodingAndRetrieveProgramAddressTable
{
  return 0;
}

- (void)endEncoding
{
  [(MTLCommandBuffer *)self->_commandBuffer setCurrentCommandEncoder:0];
  if (([(MTLCommandBuffer *)self->_commandBuffer errorOptions] & 1) != 0
    && self->_needsFrameworkAssistedErrorTracking)
  {
    commandBuffer = self->_commandBuffer;
    if (*((unsigned char *)self->_device + 328))
    {
      unint64_t v4 = (void *)[(MTLCommandBuffer *)commandBuffer progressTrackingRenderCommandEncoder];
      [v4 waitForFence:self->_progressFence beforeStages:1];
      [v4 setRenderPipelineState:*((void *)self->_device + 42)];
      uint64_t v5 = self->_commandBuffer;
      uint64_t v6 = *((void *)v5 + 64);
      int v7 = *((_DWORD *)v5 + 130);
      *((_DWORD *)v5 + 130) = v7 + 1;
      [v4 setVertexBuffer:v6 offset:(4 * v7) atIndex:0];
      [v4 drawPrimitives:0 vertexStart:0 vertexCount:1];
    }
    else
    {
      unint64_t v4 = (void *)[(MTLCommandBuffer *)commandBuffer progressTrackingBlitCommandEncoder];
      [v4 waitForFence:self->_progressFence];
      v8 = self->_commandBuffer;
      uint64_t v9 = *((void *)v8 + 64);
      int v10 = *((_DWORD *)v8 + 130);
      *((_DWORD *)v8 + 130) = v10 + 1;
      objc_msgSend(v4, "fillBuffer:range:value:", v9, (4 * v10), 4, 255);
    }
    [v4 endEncoding];
    progressFence = self->_progressFence;
    if ([(MTLCommandBuffer *)self->_commandBuffer retainedReferences])
    {
    }
    else
    {
      int v12 = self->_commandBuffer;
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __47___MTLParallelRenderCommandEncoder_endEncoding__block_invoke;
      v14[3] = &unk_1E521FA10;
      v14[4] = progressFence;
      [(MTLCommandBuffer *)v12 addCompletedHandler:v14];
    }
    self->_progressFence = 0;
  }
  if ([(MTLCommandBuffer *)self->_commandBuffer errorOptions])
  {
    v13 = objc_opt_new();
    objc_msgSend(v13, "setUniqueID:", -[_MTLParallelRenderCommandEncoder getDriverUniqueID](self, "getDriverUniqueID"));
    objc_msgSend(v13, "setLabel:", -[_MTLObjectWithLabel label](self, "label"));
    [v13 setDebugSignposts:self->_debugSignposts];
    [v13 setErrorState:0];
    [*((id *)self->_commandBuffer + 66) addObject:v13];
  }
  self->_commandBuffer = 0;
}

- (void)insertDebugSignpost:(id)a3
{
  if ([(MTLCommandBuffer *)self->_commandBuffer errorOptions])
  {
    debugSignposts = self->_debugSignposts;
    if (!debugSignposts)
    {
      debugSignposts = (NSMutableArray *)[MEMORY[0x1E4F1CA48] array];
      self->_debugSignposts = debugSignposts;
    }
    [(NSMutableArray *)debugSignposts addObject:a3];
  }
}

- (void)setColorStoreAction:(unint64_t)a3 atIndex:(unint64_t)a4
{
}

- (void)setDepthStoreAction:(unint64_t)a3
{
}

- (void)setStencilStoreAction:(unint64_t)a3
{
}

- (BOOL)isMemorylessRender
{
  return 0;
}

- (MTLDevice)device
{
  return self->_device;
}

- (unint64_t)globalTraceObjectID
{
  return self->_globalTraceObjectID;
}

@end