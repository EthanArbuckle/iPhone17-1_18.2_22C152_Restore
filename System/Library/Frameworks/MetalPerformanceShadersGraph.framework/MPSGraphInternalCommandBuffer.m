@interface MPSGraphInternalCommandBuffer
- (BOOL)respondsToSelector:(SEL)a3;
- (MPSCommandBufferDescriptor)mpsCommandBufferDescriptor;
- (MPSGraphInternalCommandBuffer)initWithMPSCommandBuffer:(id)a3 executableExecutionDescriptor:(id)a4;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)commit;
- (void)commitAndContinue;
- (void)forwardInvocation:(id)a3;
@end

@implementation MPSGraphInternalCommandBuffer

- (MPSGraphInternalCommandBuffer)initWithMPSCommandBuffer:(id)a3 executableExecutionDescriptor:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MPSGraphInternalCommandBuffer;
  v9 = [(MPSCommandBuffer *)&v13 initWithCommandBuffer:v7];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_original, a3);
    objc_storeStrong((id *)&v10->_executableExecutionDescriptor, a4);
    v10->_commandBufferIndex = 0;
    v11 = v10;
  }

  return v10;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  if (objc_opt_respondsToSelector()) {
    return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)MPSGraphInternalCommandBuffer;
  return [(MPSCommandBuffer *)&v6 respondsToSelector:a3];
}

- (void)forwardInvocation:(id)a3
{
  id v4 = a3;
  [v4 selector];
  if (objc_opt_respondsToSelector())
  {
    [v4 invokeWithTarget:self->_original];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)MPSGraphInternalCommandBuffer;
    [(MPSGraphInternalCommandBuffer *)&v5 forwardInvocation:v4];
  }
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MPSGraphInternalCommandBuffer;
  objc_super v5 = -[MPSGraphInternalCommandBuffer methodSignatureForSelector:](&v7, sel_methodSignatureForSelector_);
  if (v5)
  {
  }
  else
  {
    objc_super v5 = [(MPSCommandBuffer *)self->_original methodSignatureForSelector:a3];
  }
  return v5;
}

- (void)commitAndContinue
{
  if (!self->_commandBufferIndex)
  {
    unint64_t profilingBitmap = self->_executableExecutionDescriptor->_profilingBitmap;
    if ((profilingBitmap & 4) != 0)
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __50__MPSGraphInternalCommandBuffer_commitAndContinue__block_invoke;
      v7[3] = &unk_1E4FC12D0;
      v7[4] = self;
      [(MPSGraphInternalCommandBuffer *)self addScheduledHandler:v7];
      unint64_t profilingBitmap = self->_executableExecutionDescriptor->_profilingBitmap;
    }
    if (profilingBitmap)
    {
      id v4 = [NSNumber numberWithUnsignedLongLong:mach_absolute_time()];
      [(NSMutableDictionary *)self->_executableExecutionDescriptor->_profilingDictionary setObject:v4 forKeyedSubscript:@"MPSGRAPH_PROFILING_BEFORE_FIRST_COMMIT_TIMESTAMP"];
    }
  }
  [(MPSCommandBuffer *)self->_original commitAndContinue];
  unsigned int commandBufferIndex = self->_commandBufferIndex;
  if (!commandBufferIndex)
  {
    if ((self->_executableExecutionDescriptor->_profilingBitmap & 2) != 0)
    {
      objc_super v6 = [NSNumber numberWithUnsignedLongLong:mach_absolute_time()];
      [(NSMutableDictionary *)self->_executableExecutionDescriptor->_profilingDictionary setObject:v6 forKeyedSubscript:@"MPSGRAPH_PROFILING_AFTER_FIRST_COMMIT_TIMESTAMP"];

      unsigned int commandBufferIndex = self->_commandBufferIndex;
    }
    else
    {
      unsigned int commandBufferIndex = 0;
    }
  }
  self->_unsigned int commandBufferIndex = commandBufferIndex + 1;
}

void __50__MPSGraphInternalCommandBuffer_commitAndContinue__block_invoke(uint64_t a1)
{
  id v2 = [NSNumber numberWithUnsignedLongLong:mach_absolute_time()];
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 80) + 40), "setObject:forKeyedSubscript:");
}

- (void)commit
{
  if (!self->_commandBufferIndex)
  {
    unint64_t profilingBitmap = self->_executableExecutionDescriptor->_profilingBitmap;
    if ((profilingBitmap & 4) != 0)
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __39__MPSGraphInternalCommandBuffer_commit__block_invoke;
      v7[3] = &unk_1E4FC12D0;
      v7[4] = self;
      [(MPSGraphInternalCommandBuffer *)self addScheduledHandler:v7];
      unint64_t profilingBitmap = self->_executableExecutionDescriptor->_profilingBitmap;
    }
    if (profilingBitmap)
    {
      id v4 = [NSNumber numberWithUnsignedLongLong:mach_absolute_time()];
      [(NSMutableDictionary *)self->_executableExecutionDescriptor->_profilingDictionary setObject:v4 forKeyedSubscript:@"MPSGRAPH_PROFILING_BEFORE_FIRST_COMMIT_TIMESTAMP"];
    }
  }
  [(MPSCommandBuffer *)self->_original commit];
  unsigned int commandBufferIndex = self->_commandBufferIndex;
  if (!commandBufferIndex)
  {
    if ((self->_executableExecutionDescriptor->_profilingBitmap & 2) != 0)
    {
      objc_super v6 = [NSNumber numberWithUnsignedLongLong:mach_absolute_time()];
      [(NSMutableDictionary *)self->_executableExecutionDescriptor->_profilingDictionary setObject:v6 forKeyedSubscript:@"MPSGRAPH_PROFILING_AFTER_FIRST_COMMIT_TIMESTAMP"];

      unsigned int commandBufferIndex = self->_commandBufferIndex;
    }
    else
    {
      unsigned int commandBufferIndex = 0;
    }
  }
  self->_unsigned int commandBufferIndex = commandBufferIndex + 1;
}

void __39__MPSGraphInternalCommandBuffer_commit__block_invoke(uint64_t a1)
{
  id v2 = [NSNumber numberWithUnsignedLongLong:mach_absolute_time()];
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 80) + 40), "setObject:forKeyedSubscript:");
}

- (MPSCommandBufferDescriptor)mpsCommandBufferDescriptor
{
  result = (MPSCommandBufferDescriptor *)self->_original;
  if (result) {
    return (MPSCommandBufferDescriptor *)[(MPSCommandBufferDescriptor *)result mpsCommandBufferDescriptor];
  }
  retstr->encoderCount = 0;
  retstr->producedValues = 0;
  retstr->numberOfCommitsMade = 0;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executableExecutionDescriptor, 0);

  objc_storeStrong((id *)&self->_original, 0);
}

@end