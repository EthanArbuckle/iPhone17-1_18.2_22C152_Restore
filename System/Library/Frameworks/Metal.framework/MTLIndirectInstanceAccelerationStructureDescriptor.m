@interface MTLIndirectInstanceAccelerationStructureDescriptor
+ (MTLIndirectInstanceAccelerationStructureDescriptor)descriptor;
- (BOOL)isEqual:(id)a3;
- (BOOL)isInstanceDescriptor;
- (MTLAccelerationStructureInstanceDescriptorType)instanceDescriptorType;
- (MTLIndirectInstanceAccelerationStructureDescriptor)init;
- (NSUInteger)instanceCountBufferOffset;
- (NSUInteger)instanceDescriptorBufferOffset;
- (NSUInteger)instanceDescriptorStride;
- (NSUInteger)maxInstanceCount;
- (NSUInteger)maxMotionTransformCount;
- (NSUInteger)motionTransformBufferOffset;
- (NSUInteger)motionTransformCountBufferOffset;
- (id)copyWithZone:(_NSZone *)a3;
- (id)instanceCountBuffer;
- (id)instanceDescriptorBuffer;
- (id)motionTransformBuffer;
- (id)motionTransformCountBuffer;
- (int64_t)instanceTransformationMatrixLayout;
- (int64_t)motionTransformType;
- (unint64_t)hash;
- (unint64_t)motionTransformStride;
- (void)dealloc;
- (void)setInstanceCountBuffer:(id)instanceCountBuffer;
- (void)setInstanceCountBufferOffset:(NSUInteger)instanceCountBufferOffset;
- (void)setInstanceDescriptorBuffer:(id)instanceDescriptorBuffer;
- (void)setInstanceDescriptorBufferOffset:(NSUInteger)instanceDescriptorBufferOffset;
- (void)setInstanceDescriptorStride:(NSUInteger)instanceDescriptorStride;
- (void)setInstanceDescriptorType:(MTLAccelerationStructureInstanceDescriptorType)instanceDescriptorType;
- (void)setInstanceTransformationMatrixLayout:(int64_t)a3;
- (void)setMaxInstanceCount:(NSUInteger)maxInstanceCount;
- (void)setMaxMotionTransformCount:(NSUInteger)maxMotionTransformCount;
- (void)setMotionTransformBuffer:(id)motionTransformBuffer;
- (void)setMotionTransformBufferOffset:(NSUInteger)motionTransformBufferOffset;
- (void)setMotionTransformCountBuffer:(id)motionTransformCountBuffer;
- (void)setMotionTransformCountBufferOffset:(NSUInteger)motionTransformCountBufferOffset;
- (void)setMotionTransformStride:(unint64_t)a3;
- (void)setMotionTransformType:(int64_t)a3;
@end

@implementation MTLIndirectInstanceAccelerationStructureDescriptor

+ (MTLIndirectInstanceAccelerationStructureDescriptor)descriptor
{
  v2 = objc_alloc_init(MTLIndirectInstanceAccelerationStructureDescriptor);

  return v2;
}

- (MTLIndirectInstanceAccelerationStructureDescriptor)init
{
  v3.receiver = self;
  v3.super_class = (Class)MTLIndirectInstanceAccelerationStructureDescriptor;
  result = [(MTLIndirectInstanceAccelerationStructureDescriptor *)&v3 init];
  if (result)
  {
    result->_instanceDescriptorType = 3;
    result->_instanceTransformationMatrixLayout = 0;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MTLIndirectInstanceAccelerationStructureDescriptor;
  [(MTLIndirectInstanceAccelerationStructureDescriptor *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MTLIndirectInstanceAccelerationStructureDescriptor;
  id v4 = [(MTLAccelerationStructureDescriptor *)&v6 copyWithZone:a3];
  [v4 setInstanceDescriptorBuffer:self->_instanceDescriptorBuffer];
  [v4 setInstanceDescriptorBufferOffset:self->_instanceDescriptorBufferOffset];
  [v4 setMaxInstanceCount:self->_maxInstanceCount];
  [v4 setInstanceCountBuffer:self->_instanceCountBuffer];
  [v4 setInstanceCountBufferOffset:self->_instanceCountBufferOffset];
  [v4 setInstanceDescriptorType:self->_instanceDescriptorType];
  [v4 setMotionTransformBuffer:self->_motionTransformBuffer];
  [v4 setMotionTransformBufferOffset:self->_motionTransformBufferOffset];
  [v4 setMaxMotionTransformCount:self->_maxMotionTransformCount];
  [v4 setMotionTransformType:self->_motionTransformType];
  [v4 setMotionTransformStride:self->_motionTransformStride];
  [v4 setMotionTransformCountBuffer:self->_motionTransformCountBuffer];
  [v4 setMotionTransformCountBufferOffset:self->_motionTransformCountBufferOffset];
  [v4 setInstanceTransformationMatrixLayout:self->_instanceTransformationMatrixLayout];
  *((unsigned char *)v4 + 16) = self->_overriddenInstanceDescriptorStride;
  *((void *)v4 + 3) = self->_instanceDescriptorStride;
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
    uint64_t v26 = v3;
    uint64_t v27 = v4;
    Class = object_getClass(self);
    if (Class != object_getClass(a3)) {
      goto LABEL_3;
    }
    v25.receiver = self;
    v25.super_class = (Class)MTLIndirectInstanceAccelerationStructureDescriptor;
    BOOL v8 = [(MTLAccelerationStructureDescriptor *)&v25 isEqual:a3];
    if (!v8) {
      return v8;
    }
    id v9 = [(MTLIndirectInstanceAccelerationStructureDescriptor *)self instanceDescriptorBuffer];
    if (v9 != (id)[a3 instanceDescriptorBuffer]) {
      goto LABEL_3;
    }
    NSUInteger v10 = [(MTLIndirectInstanceAccelerationStructureDescriptor *)self instanceDescriptorBufferOffset];
    if (v10 != [a3 instanceDescriptorBufferOffset]) {
      goto LABEL_3;
    }
    NSUInteger v11 = [(MTLIndirectInstanceAccelerationStructureDescriptor *)self instanceDescriptorStride];
    if (v11 != [a3 instanceDescriptorStride]) {
      goto LABEL_3;
    }
    NSUInteger v12 = [(MTLIndirectInstanceAccelerationStructureDescriptor *)self maxInstanceCount];
    if (v12 != [a3 maxInstanceCount]) {
      goto LABEL_3;
    }
    id v13 = [(MTLIndirectInstanceAccelerationStructureDescriptor *)self instanceCountBuffer];
    if (v13 != (id)[a3 instanceCountBuffer]) {
      goto LABEL_3;
    }
    NSUInteger v14 = [(MTLIndirectInstanceAccelerationStructureDescriptor *)self instanceCountBufferOffset];
    if (v14 != [a3 instanceCountBufferOffset]) {
      goto LABEL_3;
    }
    MTLAccelerationStructureInstanceDescriptorType v15 = [(MTLIndirectInstanceAccelerationStructureDescriptor *)self instanceDescriptorType];
    if (v15 != [a3 instanceDescriptorType]) {
      goto LABEL_3;
    }
    id v16 = [(MTLIndirectInstanceAccelerationStructureDescriptor *)self motionTransformBuffer];
    if (v16 == (id)[a3 motionTransformBuffer]
      && (NSUInteger v17 = -[MTLIndirectInstanceAccelerationStructureDescriptor motionTransformBufferOffset](self, "motionTransformBufferOffset"), v17 == [a3 motionTransformBufferOffset])&& (v18 = -[MTLIndirectInstanceAccelerationStructureDescriptor maxMotionTransformCount](self, "maxMotionTransformCount"), v18 == objc_msgSend(a3, "maxMotionTransformCount"))&& (v19 = -[MTLIndirectInstanceAccelerationStructureDescriptor motionTransformType](self, "motionTransformType"), v19 == objc_msgSend(a3, "motionTransformType"))&& (v20 = -[MTLIndirectInstanceAccelerationStructureDescriptor motionTransformStride](self, "motionTransformStride"), v20 == objc_msgSend(a3, "motionTransformStride"))&& (v21 = -[MTLIndirectInstanceAccelerationStructureDescriptor motionTransformCountBuffer](self, "motionTransformCountBuffer"), v21 == (id)objc_msgSend(a3, "motionTransformCountBuffer"))&& (v22 = -[MTLIndirectInstanceAccelerationStructureDescriptor motionTransformCountBufferOffset](self,
                  "motionTransformCountBufferOffset"),
          v22 == [a3 motionTransformCountBufferOffset]))
    {
      int64_t v23 = [(MTLIndirectInstanceAccelerationStructureDescriptor *)self instanceTransformationMatrixLayout];
      LOBYTE(v8) = v23 == [a3 instanceTransformationMatrixLayout];
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
  bzero(v5, 0x80uLL);
  v4.receiver = self;
  v4.super_class = (Class)MTLIndirectInstanceAccelerationStructureDescriptor;
  v5[0] = [(MTLAccelerationStructureDescriptor *)&v4 hash];
  v5[1] = objc_msgSend(-[MTLIndirectInstanceAccelerationStructureDescriptor instanceDescriptorBuffer](self, "instanceDescriptorBuffer"), "hash");
  v5[2] = [(MTLIndirectInstanceAccelerationStructureDescriptor *)self instanceDescriptorBufferOffset];
  v5[3] = [(MTLIndirectInstanceAccelerationStructureDescriptor *)self instanceDescriptorStride];
  v5[4] = [(MTLIndirectInstanceAccelerationStructureDescriptor *)self maxInstanceCount];
  v5[5] = objc_msgSend(-[MTLIndirectInstanceAccelerationStructureDescriptor instanceCountBuffer](self, "instanceCountBuffer"), "hash");
  v5[6] = [(MTLIndirectInstanceAccelerationStructureDescriptor *)self instanceCountBufferOffset];
  v5[7] = [(MTLIndirectInstanceAccelerationStructureDescriptor *)self instanceDescriptorType];
  v5[8] = objc_msgSend(-[MTLIndirectInstanceAccelerationStructureDescriptor motionTransformBuffer](self, "motionTransformBuffer"), "hash");
  v5[9] = [(MTLIndirectInstanceAccelerationStructureDescriptor *)self motionTransformBufferOffset];
  v5[10] = [(MTLIndirectInstanceAccelerationStructureDescriptor *)self maxMotionTransformCount];
  v5[11] = [(MTLIndirectInstanceAccelerationStructureDescriptor *)self motionTransformType];
  v5[12] = [(MTLIndirectInstanceAccelerationStructureDescriptor *)self motionTransformStride];
  v5[13] = objc_msgSend(-[MTLIndirectInstanceAccelerationStructureDescriptor motionTransformCountBuffer](self, "motionTransformCountBuffer"), "hash");
  v5[14] = [(MTLIndirectInstanceAccelerationStructureDescriptor *)self motionTransformCountBufferOffset];
  v5[15] = [(MTLIndirectInstanceAccelerationStructureDescriptor *)self instanceTransformationMatrixLayout];
  return _MTLHashState((int *)v5, 0x80uLL);
}

- (NSUInteger)instanceDescriptorStride
{
  if (self->_overriddenInstanceDescriptorStride) {
    return self->_instanceDescriptorStride;
  }
  unint64_t instanceDescriptorType = self->_instanceDescriptorType;
  if (instanceDescriptorType == 3) {
    return 72;
  }
  if (instanceDescriptorType == 4) {
    return 48;
  }
  MTLReportFailure(0, "-[MTLIndirectInstanceAccelerationStructureDescriptor instanceDescriptorStride]", 1609, @"Invalid instance descriptor type", v2, v3, v4, v5, vars0);
  return 0;
}

- (void)setInstanceDescriptorStride:(NSUInteger)instanceDescriptorStride
{
  self->_instanceDescriptorStride = instanceDescriptorStride;
  self->_overriddenInstanceDescriptorStride = 1;
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

- (NSUInteger)maxInstanceCount
{
  return self->_maxInstanceCount;
}

- (void)setMaxInstanceCount:(NSUInteger)maxInstanceCount
{
  self->_maxInstanceCount = maxInstanceCount;
}

- (id)instanceCountBuffer
{
  return self->_instanceCountBuffer;
}

- (void)setInstanceCountBuffer:(id)instanceCountBuffer
{
}

- (NSUInteger)instanceCountBufferOffset
{
  return self->_instanceCountBufferOffset;
}

- (void)setInstanceCountBufferOffset:(NSUInteger)instanceCountBufferOffset
{
  self->_instanceCountBufferOffset = instanceCountBufferOffset;
}

- (MTLAccelerationStructureInstanceDescriptorType)instanceDescriptorType
{
  return self->_instanceDescriptorType;
}

- (void)setInstanceDescriptorType:(MTLAccelerationStructureInstanceDescriptorType)instanceDescriptorType
{
  self->_unint64_t instanceDescriptorType = instanceDescriptorType;
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

- (NSUInteger)maxMotionTransformCount
{
  return self->_maxMotionTransformCount;
}

- (void)setMaxMotionTransformCount:(NSUInteger)maxMotionTransformCount
{
  self->_maxMotionTransformCount = maxMotionTransformCount;
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

- (id)motionTransformCountBuffer
{
  return self->_motionTransformCountBuffer;
}

- (void)setMotionTransformCountBuffer:(id)motionTransformCountBuffer
{
}

- (NSUInteger)motionTransformCountBufferOffset
{
  return self->_motionTransformCountBufferOffset;
}

- (void)setMotionTransformCountBufferOffset:(NSUInteger)motionTransformCountBufferOffset
{
  self->_motionTransformCountBufferOffset = motionTransformCountBufferOffset;
}

- (int64_t)instanceTransformationMatrixLayout
{
  return self->_instanceTransformationMatrixLayout;
}

- (void)setInstanceTransformationMatrixLayout:(int64_t)a3
{
  self->_instanceTransformationMatrixLayout = a3;
}

@end