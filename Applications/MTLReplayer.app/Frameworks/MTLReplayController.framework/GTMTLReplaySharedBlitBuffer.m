@interface GTMTLReplaySharedBlitBuffer
- (BOOL)commitCommandBuffer;
- (BOOL)commitCommandBufferWithLog:(id)a3;
- (GTMTLReplaySharedBlitBuffer)bufferWithLength:(unint64_t)a3 alignment:(unint64_t)a4;
- (GTMTLReplaySharedBlitBuffer)initWithCommandQueue:(id)a3 resourcePool:(id)a4;
- (id)accelerationStructureCommandEncoder;
- (id)blitCommandEncoder;
- (id)commandBuffer;
- (id)renderCommandEncoderWithDescriptor:(id)a3;
- (id)resourcePool;
- (void)clearCommandBuffer;
- (void)dealloc;
- (void)releaseBuffer;
@end

@implementation GTMTLReplaySharedBlitBuffer

- (void).cxx_destruct
{
  retainArray = self->_bufferArray.retainArray;
}

- (void)releaseBuffer
{
}

- (void)clearCommandBuffer
{
  id v3 = SharedBufferArray_retainArray((uint64_t)&self->_bufferArray);

  SharedCommandBuffer_clearCommandBuffer((uint64_t)&self->_commandBuffer);
}

- (BOOL)commitCommandBufferWithLog:(id)a3
{
  p_commandBuffer = &self->_commandBuffer;
  [a3 logSharedCommandBuffer:self->_commandBuffer.commandBuffer];
  SharedBufferArray_retainArray((uint64_t)&self->_bufferArray);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = self->_commandBuffer.commandBuffer;
  SharedCommandBuffer_clearCommandBuffer((uint64_t)p_commandBuffer);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = __SharedCommandBuffer_commitCommandBuffer_block_invoke;
  v9[3] = &unk_746210;
  id v10 = v5;
  id v7 = v5;
  [(MTLCommandBuffer *)v6 addCompletedHandler:v9];
  GTMTLReplay_commitCommandBuffer(v6);

  return v6 != 0;
}

- (BOOL)commitCommandBuffer
{
  return [(GTMTLReplaySharedBlitBuffer *)self commitCommandBufferWithLog:g_activityLog];
}

- (id)renderCommandEncoderWithDescriptor:(id)a3
{
  id v4 = a3;
  p_commandEncoder = &self->_commandBuffer.commandEncoder;
  v6 = self->_commandBuffer.commandEncoder;
  if (v6)
  {
    id v7 = v6;
    [(MTLCommandEncoder *)v6 endEncoding];
  }
  v8 = SharedCommandBuffer_commandBuffer((uint64_t)&self->_commandBuffer);
  v9 = [v8 renderCommandEncoderWithDescriptor:v4];
  objc_storeStrong((id *)p_commandEncoder, v9);

  return v9;
}

- (id)accelerationStructureCommandEncoder
{
  p_commandEncoder = &self->_commandBuffer.commandEncoder;
  id v3 = self->_commandBuffer.commandEncoder;
  if (v3)
  {
    id v4 = v3;
    if ([(MTLCommandEncoder *)v3 conformsToProtocol:&OBJC_PROTOCOL___MTLAccelerationStructureCommandEncoder])goto LABEL_5; {
    [v4 endEncoding];
    }
  }
  id v5 = SharedCommandBuffer_commandBuffer((uint64_t)(p_commandEncoder - 2));
  id v4 = [v5 accelerationStructureCommandEncoder];
  objc_storeStrong((id *)p_commandEncoder, v4);

LABEL_5:

  return v4;
}

- (id)blitCommandEncoder
{
  p_commandEncoder = &self->_commandBuffer.commandEncoder;
  id v3 = self->_commandBuffer.commandEncoder;
  if (v3)
  {
    id v4 = v3;
    if ([(MTLCommandEncoder *)v3 conformsToProtocol:&OBJC_PROTOCOL___MTLBlitCommandEncoder])goto LABEL_5; {
    [v4 endEncoding];
    }
  }
  id v5 = SharedCommandBuffer_commandBuffer((uint64_t)(p_commandEncoder - 2));
  id v4 = InternalBlitCommandEncoder(v5, *(p_commandEncoder - 2));
  objc_storeStrong((id *)p_commandEncoder, v4);

LABEL_5:

  return v4;
}

- (id)commandBuffer
{
  return SharedCommandBuffer_commandBuffer((uint64_t)&self->_commandBuffer);
}

- (id)resourcePool
{
  return self->_bufferArray.resourcePool;
}

- (GTMTLReplaySharedBlitBuffer)bufferWithLength:(unint64_t)a3 alignment:(unint64_t)a4
{
  id v7 = [(NSMutableArray *)self->_bufferArray.retainArray lastObject];
  if (v7)
  {
    id v8 = v7;
    unint64_t v9 = (a4 + self->_bufferArray.bufferOffset - 1) & -(uint64_t)a4;
    id v10 = [v7 buffer];
    id v11 = [v10 length];

    if ((unint64_t)v11 >= v9 + a3) {
      goto LABEL_7;
    }
  }
  unint64_t v12 = [(GTMTLReplaySharedResourcePool *)self->_bufferArray.resourcePool defaultBufferCapacity];
  unint64_t v13 = a3;
  if (v12 > a3) {
    unint64_t v13 = [(GTMTLReplaySharedResourcePool *)self->_bufferArray.resourcePool defaultBufferCapacity];
  }
  id v8 = [(GTMTLReplaySharedResourcePool *)self->_bufferArray.resourcePool newBufferHeapWithLength:v13];
  [(NSMutableArray *)self->_bufferArray.retainArray addObject:v8];
  unint64_t v9 = 0;
LABEL_7:
  self->_bufferArray.bufferOffset = v9 + a3;
  v14 = -[GTMTLReplaySharedBufferRange initWithHeap:range:]([GTMTLReplaySharedBufferRange alloc], "initWithHeap:range:", v8, v9, a3);

  return (GTMTLReplaySharedBlitBuffer *)v14;
}

- (void)dealloc
{
  SharedCommandBuffer_clearCommandBuffer((uint64_t)&self->_commandBuffer);
  commandQueue = self->_commandBuffer.commandQueue;
  self->_commandBuffer.commandQueue = 0;

  resourcePool = self->_bufferArray.resourcePool;
  self->_bufferArray.resourcePool = 0;

  retainArray = self->_bufferArray.retainArray;
  self->_bufferArray.retainArray = 0;

  v6.receiver = self;
  v6.super_class = (Class)GTMTLReplaySharedBlitBuffer;
  [(GTMTLReplaySharedBlitBuffer *)&v6 dealloc];
}

- (GTMTLReplaySharedBlitBuffer)initWithCommandQueue:(id)a3 resourcePool:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)GTMTLReplaySharedBlitBuffer;
  unint64_t v9 = [(GTMTLReplaySharedBlitBuffer *)&v17 init];
  if (v9)
  {
    id v10 = (GTMTLReplaySharedResourcePool *)v8;
    id v11 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:4];
    resourcePool = v9->_bufferArray.resourcePool;
    v9->_bufferArray.resourcePool = v10;

    retainArray = v9->_bufferArray.retainArray;
    v9->_bufferArray.retainArray = v11;

    v9->_bufferArray.bufferOffset = 0;
    objc_storeStrong((id *)&v9->_commandBuffer.commandQueue, a3);
    commandBuffer = v9->_commandBuffer.commandBuffer;
    v9->_commandBuffer.commandBuffer = 0;

    commandEncoder = v9->_commandBuffer.commandEncoder;
    v9->_commandBuffer.commandEncoder = 0;
  }
  return v9;
}

@end