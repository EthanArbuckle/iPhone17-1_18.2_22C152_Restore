@interface MTLInstanceAccelerationStructureDescriptor
+ (MTLInstanceAccelerationStructureDescriptor)descriptor;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInstanceDescriptor;
- (MTLAccelerationStructureInstanceDescriptorType)instanceDescriptorType;
- (MTLInstanceAccelerationStructureDescriptor)init;
- (NSArray)instancedAccelerationStructures;
- (NSUInteger)instanceCount;
- (NSUInteger)instanceDescriptorBufferOffset;
- (NSUInteger)instanceDescriptorStride;
- (NSUInteger)motionTransformBufferOffset;
- (NSUInteger)motionTransformCount;
- (id)copyWithZone:(_NSZone *)a3;
- (id)instanceDescriptorBuffer;
- (id)motionTransformBuffer;
- (int64_t)instanceTransformationMatrixLayout;
- (int64_t)motionTransformType;
- (unint64_t)hash;
- (unint64_t)motionTransformStride;
- (void)dealloc;
- (void)setInstanceCount:(NSUInteger)instanceCount;
- (void)setInstanceDescriptorBuffer:(id)instanceDescriptorBuffer;
- (void)setInstanceDescriptorBufferOffset:(NSUInteger)instanceDescriptorBufferOffset;
- (void)setInstanceDescriptorStride:(NSUInteger)instanceDescriptorStride;
- (void)setInstanceDescriptorType:(MTLAccelerationStructureInstanceDescriptorType)instanceDescriptorType;
- (void)setInstanceTransformationMatrixLayout:(int64_t)a3;
- (void)setInstancedAccelerationStructures:(NSArray *)instancedAccelerationStructures;
- (void)setMotionTransformBuffer:(id)motionTransformBuffer;
- (void)setMotionTransformBufferOffset:(NSUInteger)motionTransformBufferOffset;
- (void)setMotionTransformCount:(NSUInteger)motionTransformCount;
- (void)setMotionTransformStride:(unint64_t)a3;
- (void)setMotionTransformType:(int64_t)a3;
@end

@implementation MTLInstanceAccelerationStructureDescriptor

- (NSUInteger)instanceDescriptorStride
{
  if (self->_overriddenInstanceDescriptorStride) {
    return self->_instanceDescriptorStride;
  }
  else {
    return MTLAccelerationStructureInstanceDescriptorSize((MTLAccelerationStructureInstanceDescriptorType)self->_instanceDescriptorType, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  }
}

- (void)setInstanceDescriptorStride:(NSUInteger)instanceDescriptorStride
{
  self->_instanceDescriptorStride = instanceDescriptorStride;
  self->_overriddenInstanceDescriptorStride = 1;
}

+ (MTLInstanceAccelerationStructureDescriptor)descriptor
{
  uint64_t v2 = objc_alloc_init(MTLInstanceAccelerationStructureDescriptor);

  return v2;
}

- (MTLInstanceAccelerationStructureDescriptor)init
{
  v3.receiver = self;
  v3.super_class = (Class)MTLInstanceAccelerationStructureDescriptor;
  result = [(MTLInstanceAccelerationStructureDescriptor *)&v3 init];
  if (result) {
    result->_instanceTransformationMatrixLayout = 0;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MTLInstanceAccelerationStructureDescriptor;
  [(MTLInstanceAccelerationStructureDescriptor *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MTLInstanceAccelerationStructureDescriptor;
  id v4 = [(MTLAccelerationStructureDescriptor *)&v7 copyWithZone:a3];
  [v4 setInstanceDescriptorBuffer:self->_instanceDescriptorBuffer];
  [v4 setInstanceDescriptorBufferOffset:self->_instanceDescriptorBufferOffset];
  *((unsigned char *)v4 + 16) = self->_overriddenInstanceDescriptorStride;
  *((void *)v4 + 3) = self->_instanceDescriptorStride;
  [v4 setInstanceDescriptorType:self->_instanceDescriptorType];
  [v4 setInstanceCount:self->_instanceCount];
  instancedAccelerationStructures = self->_instancedAccelerationStructures;
  if (instancedAccelerationStructures) {
    instancedAccelerationStructures = (NSArray *)objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithArray:");
  }
  [v4 setInstancedAccelerationStructures:instancedAccelerationStructures];
  [v4 setMotionTransformBuffer:self->_motionTransformBuffer];
  [v4 setMotionTransformBufferOffset:self->_motionTransformBufferOffset];
  [v4 setMotionTransformCount:self->_motionTransformCount];
  [v4 setInstanceTransformationMatrixLayout:self->_instanceTransformationMatrixLayout];
  [v4 setMotionTransformType:self->_motionTransformType];
  [v4 setMotionTransformStride:self->_motionTransformStride];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v8) = 1;
  }
  else
  {
    uint64_t v23 = v3;
    uint64_t v24 = v4;
    Class = object_getClass(self);
    if (Class != object_getClass(a3)) {
      goto LABEL_3;
    }
    v22.receiver = self;
    v22.super_class = (Class)MTLInstanceAccelerationStructureDescriptor;
    BOOL v8 = [(MTLAccelerationStructureDescriptor *)&v22 isEqual:a3];
    if (!v8) {
      return v8;
    }
    id v9 = [(MTLInstanceAccelerationStructureDescriptor *)self instanceDescriptorBuffer];
    if (v9 != (id)[a3 instanceDescriptorBuffer]) {
      goto LABEL_3;
    }
    NSUInteger v10 = [(MTLInstanceAccelerationStructureDescriptor *)self instanceDescriptorBufferOffset];
    if (v10 != [a3 instanceDescriptorBufferOffset]) {
      goto LABEL_3;
    }
    NSUInteger v11 = [(MTLInstanceAccelerationStructureDescriptor *)self instanceDescriptorStride];
    if (v11 != [a3 instanceDescriptorStride]) {
      goto LABEL_3;
    }
    MTLAccelerationStructureInstanceDescriptorType v12 = [(MTLInstanceAccelerationStructureDescriptor *)self instanceDescriptorType];
    if (v12 != [a3 instanceDescriptorType]) {
      goto LABEL_3;
    }
    NSUInteger v13 = [(MTLInstanceAccelerationStructureDescriptor *)self instanceCount];
    if (v13 != [a3 instanceCount]) {
      goto LABEL_3;
    }
    int v14 = MTLCompareArray(-[MTLInstanceAccelerationStructureDescriptor instancedAccelerationStructures](self, "instancedAccelerationStructures"), (void *)[a3 instancedAccelerationStructures], 1, 0);
    LOBYTE(v8) = 0;
    if (!v14) {
      return v8;
    }
    id v15 = [(MTLInstanceAccelerationStructureDescriptor *)self motionTransformBuffer];
    if (v15 == (id)[a3 motionTransformBuffer]
      && (NSUInteger v16 = -[MTLInstanceAccelerationStructureDescriptor motionTransformBufferOffset](self, "motionTransformBufferOffset"), v16 == [a3 motionTransformBufferOffset])&& (v17 = -[MTLInstanceAccelerationStructureDescriptor motionTransformCount](self, "motionTransformCount"), v17 == objc_msgSend(a3, "motionTransformCount"))&& (v18 = -[MTLInstanceAccelerationStructureDescriptor instanceTransformationMatrixLayout](self, "instanceTransformationMatrixLayout"), v18 == objc_msgSend(a3, "instanceTransformationMatrixLayout"))&& (v19 = -[MTLInstanceAccelerationStructureDescriptor motionTransformType](self, "motionTransformType"), v19 == objc_msgSend(a3, "motionTransformType")))
    {
      unint64_t v20 = [(MTLInstanceAccelerationStructureDescriptor *)self motionTransformStride];
      LOBYTE(v8) = v20 == [a3 motionTransformStride];
    }
    else
    {
LABEL_3:
      LOBYTE(v8) = 0;
    }
  }
  return v8;
}

- (unint64_t)hash
{
  bzero(v5, 0x68uLL);
  v4.receiver = self;
  v4.super_class = (Class)MTLInstanceAccelerationStructureDescriptor;
  v5[0] = [(MTLAccelerationStructureDescriptor *)&v4 hash];
  v5[1] = objc_msgSend(-[MTLInstanceAccelerationStructureDescriptor instanceDescriptorBuffer](self, "instanceDescriptorBuffer"), "hash");
  v5[2] = [(MTLInstanceAccelerationStructureDescriptor *)self instanceDescriptorBufferOffset];
  v5[3] = [(MTLInstanceAccelerationStructureDescriptor *)self instanceDescriptorStride];
  v5[4] = [(MTLInstanceAccelerationStructureDescriptor *)self instanceDescriptorType];
  v5[5] = [(MTLInstanceAccelerationStructureDescriptor *)self instanceCount];
  v5[6] = MTLHashArray([(MTLInstanceAccelerationStructureDescriptor *)self instancedAccelerationStructures], 1, 0);
  v5[7] = objc_msgSend(-[MTLInstanceAccelerationStructureDescriptor motionTransformBuffer](self, "motionTransformBuffer"), "hash");
  v5[8] = [(MTLInstanceAccelerationStructureDescriptor *)self motionTransformBufferOffset];
  v5[9] = [(MTLInstanceAccelerationStructureDescriptor *)self motionTransformCount];
  v5[10] = [(MTLInstanceAccelerationStructureDescriptor *)self instanceTransformationMatrixLayout];
  v5[11] = [(MTLInstanceAccelerationStructureDescriptor *)self motionTransformType];
  v5[12] = [(MTLInstanceAccelerationStructureDescriptor *)self motionTransformStride];
  return _MTLHashState((int *)v5, 0x68uLL);
}

- (BOOL)isInstanceDescriptor
{
  return 1;
}

- (id)instanceDescriptorBuffer
{
  return self->_instanceDescriptorBuffer;
}

- (void)setInstanceDescriptorBuffer:(id)instanceDescriptorBuffer
{
}

- (NSUInteger)instanceDescriptorBufferOffset
{
  return self->_instanceDescriptorBufferOffset;
}

- (void)setInstanceDescriptorBufferOffset:(NSUInteger)instanceDescriptorBufferOffset
{
  self->_instanceDescriptorBufferOffset = instanceDescriptorBufferOffset;
}

- (NSUInteger)instanceCount
{
  return self->_instanceCount;
}

- (void)setInstanceCount:(NSUInteger)instanceCount
{
  self->_instanceCount = instanceCount;
}

- (NSArray)instancedAccelerationStructures
{
  return self->_instancedAccelerationStructures;
}

- (void)setInstancedAccelerationStructures:(NSArray *)instancedAccelerationStructures
{
}

- (id)motionTransformBuffer
{
  return self->_motionTransformBuffer;
}

- (void)setMotionTransformBuffer:(id)motionTransformBuffer
{
}

- (NSUInteger)motionTransformBufferOffset
{
  return self->_motionTransformBufferOffset;
}

- (void)setMotionTransformBufferOffset:(NSUInteger)motionTransformBufferOffset
{
  self->_motionTransformBufferOffset = motionTransformBufferOffset;
}

- (NSUInteger)motionTransformCount
{
  return self->_motionTransformCount;
}

- (void)setMotionTransformCount:(NSUInteger)motionTransformCount
{
  self->_motionTransformCount = motionTransformCount;
}

- (int64_t)instanceTransformationMatrixLayout
{
  return self->_instanceTransformationMatrixLayout;
}

- (void)setInstanceTransformationMatrixLayout:(int64_t)a3
{
  self->_instanceTransformationMatrixLayout = a3;
}

- (int64_t)motionTransformType
{
  return self->_motionTransformType;
}

- (void)setMotionTransformType:(int64_t)a3
{
  self->_motionTransformType = a3;
}

- (unint64_t)motionTransformStride
{
  return self->_motionTransformStride;
}

- (void)setMotionTransformStride:(unint64_t)a3
{
  self->_motionTransformStride = a3;
}

- (MTLAccelerationStructureInstanceDescriptorType)instanceDescriptorType
{
  return self->_instanceDescriptorType;
}

- (void)setInstanceDescriptorType:(MTLAccelerationStructureInstanceDescriptorType)instanceDescriptorType
{
  self->_instanceDescriptorType = instanceDescriptorType;
}

@end