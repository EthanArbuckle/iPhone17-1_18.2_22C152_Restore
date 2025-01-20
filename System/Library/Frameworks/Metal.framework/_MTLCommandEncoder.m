@interface _MTLCommandEncoder
- (MTLDevice)device;
- (_MTLCommandEncoder)initWithCommandBuffer:(id)a3;
- (id)commandBuffer;
- (id)description;
- (id)endEncodingAndRetrieveProgramAddressTable;
- (id)formattedDescription:(unint64_t)a3;
- (unint64_t)dispatchType;
- (unint64_t)getType;
- (unint64_t)globalTraceObjectID;
- (unint64_t)numThisEncoder;
- (void)dealloc;
- (void)drawMeshThreadgroups:(id *)a3 threadsPerObjectThreadgroup:(id *)a4 threadsPerMeshThreadgroup:(id *)a5;
- (void)drawMeshThreadgroupsWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4 threadsPerObjectThreadgroup:(id *)a5 threadsPerMeshThreadgroup:(id *)a6;
- (void)drawMeshThreads:(id *)a3 threadsPerObjectThreadgroup:(id *)a4 threadsPerMeshThreadgroup:(id *)a5;
- (void)endEncoding;
- (void)insertDebugSignpost:(id)a3;
- (void)invalidateCompressedTexture:(id)a3;
- (void)invalidateCompressedTexture:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5;
- (void)memoryBarrierNotificationWithResources:(const void *)a3 count:(unint64_t)a4;
- (void)memoryBarrierNotificationWithScope:(unint64_t)a3;
- (void)preEndEncoding;
- (void)pushDebugGroup:(id)a3;
- (void)setAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setBuffer:(id)a3 offset:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6;
- (void)setBufferOffset:(unint64_t)a3 attributeStride:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setBuffers:(const void *)a3 offsets:(const unint64_t *)a4 attributeStrides:(const unint64_t *)a5 withRange:(_NSRange)a6;
- (void)setBytes:(const void *)a3 length:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6;
- (void)setFragmentAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setMeshAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setMeshBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setMeshBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setMeshBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5;
- (void)setMeshBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setMeshIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setMeshIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
- (void)setMeshSamplerState:(id)a3 atIndex:(unint64_t)a4;
- (void)setMeshSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6;
- (void)setMeshSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6;
- (void)setMeshSamplerStates:(const void *)a3 withRange:(_NSRange)a4;
- (void)setMeshTexture:(id)a3 atIndex:(unint64_t)a4;
- (void)setMeshTextures:(const void *)a3 withRange:(_NSRange)a4;
- (void)setMeshVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setMeshVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
- (void)setNumThisEncoder:(unint64_t)a3;
- (void)setObjectAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setObjectBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setObjectBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setObjectBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5;
- (void)setObjectBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setObjectIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setObjectIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
- (void)setObjectSamplerState:(id)a3 atIndex:(unint64_t)a4;
- (void)setObjectSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6;
- (void)setObjectSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6;
- (void)setObjectSamplerStates:(const void *)a3 withRange:(_NSRange)a4;
- (void)setObjectTexture:(id)a3 atIndex:(unint64_t)a4;
- (void)setObjectTextures:(const void *)a3 withRange:(_NSRange)a4;
- (void)setObjectThreadgroupMemoryLength:(unint64_t)a3 atIndex:(unint64_t)a4;
- (void)setObjectVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setObjectVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4;
- (void)setThreadgroupPackingDisabled:(BOOL)a3;
- (void)setTileAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setVertexAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4;
- (void)setVertexBuffer:(id)a3 offset:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6;
- (void)setVertexBufferOffset:(unint64_t)a3 attributeStride:(unint64_t)a4 atIndex:(unint64_t)a5;
- (void)setVertexBuffers:(const void *)a3 offsets:(const unint64_t *)a4 attributeStrides:(const unint64_t *)a5 withRange:(_NSRange)a6;
- (void)setVertexBytes:(const void *)a3 length:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6;
- (void)useResidencySet:(id)a3;
- (void)useResidencySets:(const void *)a3 count:(unint64_t)a4;
@end

@implementation _MTLCommandEncoder

- (MTLDevice)device
{
  return self->_device;
}

- (void)endEncoding
{
  [(MTLCommandBuffer *)self->_commandBuffer executeSynchronizationNotifications:1];
  [(MTLCommandBuffer *)self->_commandBuffer setCurrentCommandEncoder:0];
  if (!self->_isProgressTrackingEncoder)
  {
    if (([(MTLCommandBuffer *)self->_commandBuffer errorOptions] & 1) != 0
      && self->_needsFrameworkAssistedErrorTracking)
    {
      if ([(_MTLCommandEncoder *)self getType] || !*((unsigned char *)self->_device + 328))
      {
        if ([(_MTLCommandEncoder *)self getType] == 1 && *((unsigned char *)self->_device + 328))
        {
          v3 = (void *)[(MTLCommandBuffer *)self->_commandBuffer progressTrackingComputeCommandEncoder];
          [v3 waitForFence:self->_progressFence];
          [v3 setComputePipelineState:*((void *)self->_device + 43)];
          commandBuffer = self->_commandBuffer;
          uint64_t v5 = *((void *)commandBuffer + 64);
          int v6 = *((_DWORD *)commandBuffer + 130);
          *((_DWORD *)commandBuffer + 130) = v6 + 1;
          [v3 setBuffer:v5 offset:(4 * v6) atIndex:0];
          int64x2_t v19 = vdupq_n_s64(1uLL);
          uint64_t v20 = 1;
          int64x2_t v17 = v19;
          uint64_t v18 = 1;
          [v3 dispatchThreadgroups:&v19 threadsPerThreadgroup:&v17];
        }
        else
        {
          v3 = (void *)[(MTLCommandBuffer *)self->_commandBuffer progressTrackingBlitCommandEncoder];
          [v3 waitForFence:self->_progressFence];
          v7 = self->_commandBuffer;
          uint64_t v8 = *((void *)v7 + 64);
          int v9 = *((_DWORD *)v7 + 130);
          *((_DWORD *)v7 + 130) = v9 + 1;
          objc_msgSend(v3, "fillBuffer:range:value:", v8, (4 * v9), 4, 255);
        }
      }
      else
      {
        v3 = (void *)[(MTLCommandBuffer *)self->_commandBuffer progressTrackingRenderCommandEncoder];
        [v3 waitForFence:self->_progressFence beforeStages:1];
        [v3 setRenderPipelineState:*((void *)self->_device + 42)];
        v10 = self->_commandBuffer;
        uint64_t v11 = *((void *)v10 + 64);
        int v12 = *((_DWORD *)v10 + 130);
        *((_DWORD *)v10 + 130) = v12 + 1;
        [v3 setVertexBuffer:v11 offset:(4 * v12) atIndex:0];
        [v3 drawPrimitives:0 vertexStart:0 vertexCount:1];
      }
      [v3 endEncoding];
      progressFence = self->_progressFence;
      if ([(MTLCommandBuffer *)self->_commandBuffer retainedReferences])
      {
      }
      else
      {
        v14 = self->_commandBuffer;
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __33___MTLCommandEncoder_endEncoding__block_invoke;
        v16[3] = &unk_1E521FA10;
        v16[4] = progressFence;
        [(MTLCommandBuffer *)v14 addCompletedHandler:v16];
      }
      self->_progressFence = 0;
    }
    if ([(MTLCommandBuffer *)self->_commandBuffer errorOptions])
    {
      v15 = objc_opt_new();
      objc_msgSend(v15, "setUniqueID:", -[_MTLCommandEncoder getDriverUniqueID](self, "getDriverUniqueID"));
      objc_msgSend(v15, "setLabel:", -[_MTLObjectWithLabel label](self, "label"));
      [v15 setDebugSignposts:self->_debugSignposts];

      self->_debugSignposts = 0;
      [v15 setErrorState:0];
      [*((id *)self->_commandBuffer + 66) addObject:v15];
    }
  }

  self->_commandBuffer = 0;
}

- (_MTLCommandEncoder)initWithCommandBuffer:(id)a3
{
  if (a3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    v21 = @"commandBuffer is not a MTLCommandBuffer.";
    unint64_t v22 = 1;
    uint64_t v23 = 38;
  }
  else
  {
    v21 = @"commandBuffer must not be nil.";
    unint64_t v22 = 0;
    uint64_t v23 = 35;
  }
  MTLReportFailure(v22, "-[_MTLCommandEncoder initWithCommandBuffer:]", v23, (uint64_t)v21, v3, v4, v5, v6, v24.i64[0]);
LABEL_3:
  v28.receiver = self;
  v28.super_class = (Class)_MTLCommandEncoder;
  int v9 = [(_MTLObjectWithLabel *)&v28 init];
  if (v9)
  {
    v9->_device = (MTLDevice *)(id)[a3 device];
    v9->_commandBuffer = (MTLCommandBuffer *)a3;
    v9->_needsFrameworkAssistedErrorTracking = [(MTLDevice *)v9->_device getSupportedCommandBufferErrorOptions] == 0;
    v9->_isProgressTrackingEncoder = *((unsigned char *)a3 + 524);
    if (([(MTLCommandBuffer *)v9->_commandBuffer errorOptions] & 1) != 0
      && !v9->_isProgressTrackingEncoder)
    {
      [(MTLCommandBuffer *)v9->_commandBuffer initProgressTracking];
      if (v9->_needsFrameworkAssistedErrorTracking)
      {
        v9->_progressFence = (MTLFence *)[(MTLDevice *)v9->_device newFence];
        if ([(_MTLCommandEncoder *)v9 getType] || !*((unsigned char *)v9->_device + 328))
        {
          if ([(_MTLCommandEncoder *)v9 getType] == 1 && *((unsigned char *)v9->_device + 328))
          {
            v10 = (void *)[(MTLCommandBuffer *)v9->_commandBuffer progressTrackingComputeCommandEncoder];
            [v10 setComputePipelineState:*((void *)v9->_device + 43)];
            commandBuffer = v9->_commandBuffer;
            uint64_t v12 = *((void *)commandBuffer + 64);
            int v13 = *((_DWORD *)commandBuffer + 130);
            *((_DWORD *)commandBuffer + 130) = v13 + 1;
            [v10 setBuffer:v12 offset:(4 * v13) atIndex:0];
            int64x2_t v26 = vdupq_n_s64(1uLL);
            uint64_t v27 = 1;
            int64x2_t v24 = v26;
            uint64_t v25 = 1;
            [v10 dispatchThreadgroups:&v26 threadsPerThreadgroup:&v24];
          }
          else
          {
            v10 = (void *)[(MTLCommandBuffer *)v9->_commandBuffer progressTrackingBlitCommandEncoder];
            v14 = v9->_commandBuffer;
            uint64_t v15 = *((void *)v14 + 64);
            int v16 = *((_DWORD *)v14 + 130);
            *((_DWORD *)v14 + 130) = v16 + 1;
            objc_msgSend(v10, "fillBuffer:range:value:", v15, (4 * v16), 4, 255);
          }
          [v10 updateFence:v9->_progressFence];
        }
        else
        {
          v10 = (void *)[(MTLCommandBuffer *)v9->_commandBuffer progressTrackingRenderCommandEncoder];
          [v10 setRenderPipelineState:*((void *)v9->_device + 42)];
          int64x2_t v17 = v9->_commandBuffer;
          uint64_t v18 = *((void *)v17 + 64);
          int v19 = *((_DWORD *)v17 + 130);
          *((_DWORD *)v17 + 130) = v19 + 1;
          [v10 setVertexBuffer:v18 offset:(4 * v19) atIndex:0];
          [v10 drawPrimitives:0 vertexStart:0 vertexCount:1];
          [v10 updateFence:v9->_progressFence afterStages:2];
        }
        [v10 endEncoding];
      }
    }
    [(MTLCommandBuffer *)v9->_commandBuffer setCurrentCommandEncoder:v9];
    if ([(MTLCommandBuffer *)v9->_commandBuffer isStatEnabled]) {
      v9->_numThisEncoder = [(MTLCommandBuffer *)v9->_commandBuffer getAndIncrementNumEncoders];
    }
  }
  return v9;
}

- (void)dealloc
{
  self->_device = 0;
  self->_progressFence = 0;

  self->_debugSignposts = 0;
  if (self->_commandBuffer) {
    MTLReportFailure(0, "-[_MTLCommandEncoder dealloc]", 134, @"Command encoder released without endEncoding", v3, v4, v5, v6, (uint64_t)v7.receiver);
  }
  v7.receiver = self;
  v7.super_class = (Class)_MTLCommandEncoder;
  [(_MTLObjectWithLabel *)&v7 dealloc];
}

- (unint64_t)numThisEncoder
{
  return self->_numThisEncoder;
}

- (void)pushDebugGroup:(id)a3
{
  if (!a3)
  {
    uint64_t v8 = @"string must not be nil.";
    unint64_t v9 = 0;
    uint64_t v10 = 330;
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v8 = @"string is not a NSString.";
    unint64_t v9 = 1;
    uint64_t v10 = 333;
LABEL_6:
    MTLReportFailure(v9, "-[_MTLCommandEncoder pushDebugGroup:]", v10, (uint64_t)v8, v3, v4, v5, v6, v12);
  }
}

- (id)formattedDescription:(unint64_t)a3
{
  v15[6] = *MEMORY[0x1E4F143B8];
  unint64_t v4 = a3 + 4;
  uint64_t v5 = [@"\n" stringByPaddingToLength:a3 + 4 withString:@" " startingAtIndex:0];
  uint64_t v6 = [(_MTLObjectWithLabel *)self retainedLabel];
  uint64_t v7 = NSString;
  v14.receiver = self;
  v14.super_class = (Class)_MTLCommandEncoder;
  id v8 = [(_MTLCommandEncoder *)&v14 description];
  v15[0] = v5;
  v15[1] = @"label =";
  if (v6) {
    unint64_t v9 = v6;
  }
  else {
    unint64_t v9 = @"<none>";
  }
  v15[2] = v9;
  v15[3] = v5;
  v15[4] = @"device =";
  device = self->_device;
  if (device) {
    uint64_t v11 = (__CFString *)[(MTLDevice *)device formattedDescription:v4];
  }
  else {
    uint64_t v11 = @"<null>";
  }
  v15[5] = v11;
  uint64_t v12 = (void *)[v7 stringWithFormat:@"%@%@", v8, objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v15, 6), "componentsJoinedByString:", @" "];

  return v12;
}

- (id)description
{
  return [(_MTLCommandEncoder *)self formattedDescription:0];
}

- (id)commandBuffer
{
  return self->_commandBuffer;
}

- (void)preEndEncoding
{
  if (([(MTLCommandBuffer *)self->_commandBuffer errorOptions] & 1) != 0
    && !self->_isProgressTrackingEncoder
    && self->_needsFrameworkAssistedErrorTracking)
  {
    unint64_t v3 = [(_MTLCommandEncoder *)self getType];
    progressFence = self->_progressFence;
    if (v3)
    {
      [(_MTLCommandEncoder *)self waitForFence:progressFence];
      uint64_t v5 = self->_progressFence;
      [(_MTLCommandEncoder *)self updateFence:v5];
    }
    else
    {
      [(_MTLCommandEncoder *)self waitForFence:progressFence beforeStages:1];
      uint64_t v6 = self->_progressFence;
      [(_MTLCommandEncoder *)self updateFence:v6 afterStages:2];
    }
  }
}

- (id)endEncodingAndRetrieveProgramAddressTable
{
  return 0;
}

- (void)insertDebugSignpost:(id)a3
{
  if (a3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    uint64_t v10 = @"string is not a NSString.";
    unint64_t v11 = 1;
    uint64_t v12 = 316;
  }
  else
  {
    uint64_t v10 = @"string must not be nil.";
    unint64_t v11 = 0;
    uint64_t v12 = 313;
  }
  MTLReportFailure(v11, "-[_MTLCommandEncoder insertDebugSignpost:]", v12, (uint64_t)v10, v3, v4, v5, v6, v13);
LABEL_3:
  if ([(MTLCommandBuffer *)self->_commandBuffer errorOptions])
  {
    debugSignposts = self->_debugSignposts;
    if (!debugSignposts)
    {
      debugSignposts = (NSMutableArray *)objc_opt_new();
      self->_debugSignposts = debugSignposts;
    }
    [(NSMutableArray *)debugSignposts addObject:a3];
  }
}

- (unint64_t)getType
{
  return 0;
}

- (void)memoryBarrierNotificationWithScope:(unint64_t)a3
{
}

- (void)memoryBarrierNotificationWithResources:(const void *)a3 count:(unint64_t)a4
{
}

- (unint64_t)dispatchType
{
  return 0;
}

- (void)setAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
  if ([(_MTLCommandEncoder *)self getType] == 1
    && ([(MTLDevice *)[(_MTLCommandEncoder *)self device] requiresRaytracingEmulation] & 1) != 0)
  {
    uint64_t v8 = [a3 buffer];
    uint64_t v9 = [a3 bufferOffset];
    [(_MTLCommandEncoder *)self setBuffer:v8 offset:v9 atIndex:a4];
  }
  else
  {
    [(_MTLCommandEncoder *)self doesNotRecognizeSelector:a2];
  }
}

- (void)setVertexAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
  if ([(_MTLCommandEncoder *)self getType]
    || ([(MTLDevice *)[(_MTLCommandEncoder *)self device] requiresRaytracingEmulation] & 1) == 0)
  {
    [(_MTLCommandEncoder *)self doesNotRecognizeSelector:a2];
  }
  else
  {
    uint64_t v8 = [a3 buffer];
    uint64_t v9 = [a3 bufferOffset];
    [(_MTLCommandEncoder *)self setVertexBuffer:v8 offset:v9 atIndex:a4];
  }
}

- (void)setFragmentAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
  if ([(_MTLCommandEncoder *)self getType]
    || ([(MTLDevice *)[(_MTLCommandEncoder *)self device] requiresRaytracingEmulation] & 1) == 0)
  {
    [(_MTLCommandEncoder *)self doesNotRecognizeSelector:a2];
  }
  else
  {
    uint64_t v8 = [a3 buffer];
    uint64_t v9 = [a3 bufferOffset];
    [(_MTLCommandEncoder *)self setFragmentBuffer:v8 offset:v9 atIndex:a4];
  }
}

- (void)setTileAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
  if ([(_MTLCommandEncoder *)self getType]
    || ([(MTLDevice *)[(_MTLCommandEncoder *)self device] requiresRaytracingEmulation] & 1) == 0)
  {
    [(_MTLCommandEncoder *)self doesNotRecognizeSelector:a2];
  }
  else
  {
    uint64_t v8 = [a3 buffer];
    uint64_t v9 = [a3 bufferOffset];
    [(_MTLCommandEncoder *)self setTileBuffer:v8 offset:v9 atIndex:a4];
  }
}

- (void)setObjectBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
}

- (void)setObjectBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
}

- (void)setObjectBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
}

- (void)setObjectBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
}

- (void)setObjectTexture:(id)a3 atIndex:(unint64_t)a4
{
}

- (void)setObjectTextures:(const void *)a3 withRange:(_NSRange)a4
{
}

- (void)setObjectSamplerState:(id)a3 atIndex:(unint64_t)a4
{
}

- (void)setObjectSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
}

- (void)setObjectSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6
{
}

- (void)setObjectSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6
{
}

- (void)setObjectThreadgroupMemoryLength:(unint64_t)a3 atIndex:(unint64_t)a4
{
}

- (void)setMeshBytes:(const void *)a3 length:(unint64_t)a4 atIndex:(unint64_t)a5
{
}

- (void)setMeshBuffer:(id)a3 offset:(unint64_t)a4 atIndex:(unint64_t)a5
{
}

- (void)setMeshBufferOffset:(unint64_t)a3 atIndex:(unint64_t)a4
{
}

- (void)setMeshBuffers:(const void *)a3 offsets:(const unint64_t *)a4 withRange:(_NSRange)a5
{
}

- (void)setMeshTexture:(id)a3 atIndex:(unint64_t)a4
{
}

- (void)setMeshTextures:(const void *)a3 withRange:(_NSRange)a4
{
}

- (void)setMeshSamplerState:(id)a3 atIndex:(unint64_t)a4
{
}

- (void)setMeshSamplerStates:(const void *)a3 withRange:(_NSRange)a4
{
}

- (void)setMeshSamplerState:(id)a3 lodMinClamp:(float)a4 lodMaxClamp:(float)a5 atIndex:(unint64_t)a6
{
}

- (void)setMeshSamplerStates:(const void *)a3 lodMinClamps:(const float *)a4 lodMaxClamps:(const float *)a5 withRange:(_NSRange)a6
{
}

- (void)drawMeshThreadgroups:(id *)a3 threadsPerObjectThreadgroup:(id *)a4 threadsPerMeshThreadgroup:(id *)a5
{
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v7 = *a3;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v6 = *a4;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v5 = *a5;
  [(_MTLCommandEncoder *)self drawMeshThreadgroups:&v7 threadsPerObjectThreadgroup:&v6 threadsPerMeshThreadgroup:&v5];
}

- (void)drawMeshThreads:(id *)a3 threadsPerObjectThreadgroup:(id *)a4 threadsPerMeshThreadgroup:(id *)a5
{
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v7 = *a3;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v6 = *a4;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v5 = *a5;
  [(_MTLCommandEncoder *)self drawMeshThreads:&v7 threadsPerObjectThreadgroup:&v6 threadsPerMeshThreadgroup:&v5];
}

- (void)drawMeshThreadgroupsWithIndirectBuffer:(id)a3 indirectBufferOffset:(unint64_t)a4 threadsPerObjectThreadgroup:(id *)a5 threadsPerMeshThreadgroup:(id *)a6
{
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v7 = *a5;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v6 = *a6;
  [(_MTLCommandEncoder *)self drawMeshThreadgroupsWithIndirectBuffer:a3 indirectBufferOffset:a4 threadsPerObjectThreadgroup:&v7 threadsPerMeshThreadgroup:&v6];
}

- (void)setObjectVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
}

- (void)setObjectVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
}

- (void)setMeshVisibleFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
}

- (void)setMeshVisibleFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
}

- (void)setObjectIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
}

- (void)setObjectIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
}

- (void)setObjectAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
}

- (void)setMeshIntersectionFunctionTable:(id)a3 atBufferIndex:(unint64_t)a4
{
}

- (void)setMeshIntersectionFunctionTables:(const void *)a3 withBufferRange:(_NSRange)a4
{
}

- (void)setMeshAccelerationStructure:(id)a3 atBufferIndex:(unint64_t)a4
{
}

- (void)invalidateCompressedTexture:(id)a3
{
}

- (void)invalidateCompressedTexture:(id)a3 slice:(unint64_t)a4 level:(unint64_t)a5
{
}

- (void)setThreadgroupPackingDisabled:(BOOL)a3
{
}

- (void)setBuffer:(id)a3 offset:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6
{
}

- (void)setBuffers:(const void *)a3 offsets:(const unint64_t *)a4 attributeStrides:(const unint64_t *)a5 withRange:(_NSRange)a6
{
}

- (void)setBufferOffset:(unint64_t)a3 attributeStride:(unint64_t)a4 atIndex:(unint64_t)a5
{
}

- (void)setBytes:(const void *)a3 length:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6
{
}

- (void)setVertexBuffer:(id)a3 offset:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6
{
}

- (void)setVertexBuffers:(const void *)a3 offsets:(const unint64_t *)a4 attributeStrides:(const unint64_t *)a5 withRange:(_NSRange)a6
{
}

- (void)setVertexBufferOffset:(unint64_t)a3 attributeStride:(unint64_t)a4 atIndex:(unint64_t)a5
{
}

- (void)setVertexBytes:(const void *)a3 length:(unint64_t)a4 attributeStride:(unint64_t)a5 atIndex:(unint64_t)a6
{
}

- (void)useResidencySet:(id)a3
{
}

- (void)useResidencySets:(const void *)a3 count:(unint64_t)a4
{
}

- (unint64_t)globalTraceObjectID
{
  return self->_globalTraceObjectID;
}

- (void)setNumThisEncoder:(unint64_t)a3
{
  self->_numThisEncoder = a3;
}

@end