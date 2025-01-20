@interface MTLPrimitiveAccelerationStructureDescriptor
+ (MTLPrimitiveAccelerationStructureDescriptor)descriptor;
- (BOOL)isEqual:(id)a3;
- (MTLMotionBorderMode)motionEndBorderMode;
- (MTLMotionBorderMode)motionStartBorderMode;
- (MTLPrimitiveAccelerationStructureDescriptor)init;
- (NSArray)geometryDescriptors;
- (NSUInteger)motionKeyframeCount;
- (float)motionEndTime;
- (float)motionStartTime;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)dealloc;
- (void)setGeometryDescriptors:(NSArray *)geometryDescriptors;
- (void)setMotionEndBorderMode:(MTLMotionBorderMode)motionEndBorderMode;
- (void)setMotionEndTime:(float)motionEndTime;
- (void)setMotionKeyframeCount:(NSUInteger)motionKeyframeCount;
- (void)setMotionStartBorderMode:(MTLMotionBorderMode)motionStartBorderMode;
- (void)setMotionStartTime:(float)motionStartTime;
@end

@implementation MTLPrimitiveAccelerationStructureDescriptor

+ (MTLPrimitiveAccelerationStructureDescriptor)descriptor
{
  v2 = objc_alloc_init(MTLPrimitiveAccelerationStructureDescriptor);

  return v2;
}

- (MTLPrimitiveAccelerationStructureDescriptor)init
{
  v3.receiver = self;
  v3.super_class = (Class)MTLPrimitiveAccelerationStructureDescriptor;
  result = [(MTLPrimitiveAccelerationStructureDescriptor *)&v3 init];
  if (result)
  {
    result->_motionStartBorderMode = 0;
    result->_motionEndBorderMode = 0;
    result->_motionStartTime = 0.0;
    result->_motionEndTime = 1.0;
    result->_motionKeyframeCount = 1;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MTLPrimitiveAccelerationStructureDescriptor;
  [(MTLPrimitiveAccelerationStructureDescriptor *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)MTLPrimitiveAccelerationStructureDescriptor;
  id v4 = [(MTLAccelerationStructureDescriptor *)&v9 copyWithZone:a3];
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:self->_geometryDescriptors copyItems:1];
  [v4 setGeometryDescriptors:v5];

  [v4 setMotionStartBorderMode:self->_motionStartBorderMode];
  [v4 setMotionEndBorderMode:self->_motionEndBorderMode];
  *(float *)&double v6 = self->_motionStartTime;
  [v4 setMotionStartTime:v6];
  *(float *)&double v7 = self->_motionEndTime;
  [v4 setMotionEndTime:v7];
  [v4 setMotionKeyframeCount:self->_motionKeyframeCount];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v10) = 1;
    return v10;
  }
  uint64_t v23 = v6;
  uint64_t v24 = v5;
  uint64_t v25 = v3;
  uint64_t v26 = v4;
  Class = object_getClass(self);
  if (Class != object_getClass(a3)) {
    goto LABEL_3;
  }
  v22.receiver = self;
  v22.super_class = (Class)MTLPrimitiveAccelerationStructureDescriptor;
  BOOL v10 = [(MTLAccelerationStructureDescriptor *)&v22 isEqual:a3];
  if (v10)
  {
    int v11 = MTLCompareArray(-[MTLPrimitiveAccelerationStructureDescriptor geometryDescriptors](self, "geometryDescriptors"), (void *)[a3 geometryDescriptors], 1, 0);
    LOBYTE(v10) = 0;
    if (v11)
    {
      MTLMotionBorderMode v12 = [(MTLPrimitiveAccelerationStructureDescriptor *)self motionStartBorderMode];
      if (v12 == [a3 motionStartBorderMode])
      {
        MTLMotionBorderMode v13 = [(MTLPrimitiveAccelerationStructureDescriptor *)self motionEndBorderMode];
        if (v13 == [a3 motionEndBorderMode])
        {
          [(MTLPrimitiveAccelerationStructureDescriptor *)self motionStartTime];
          float v15 = v14;
          [a3 motionStartTime];
          if (v15 == v16)
          {
            [(MTLPrimitiveAccelerationStructureDescriptor *)self motionEndTime];
            float v18 = v17;
            [a3 motionEndTime];
            if (v18 == v19)
            {
              NSUInteger v20 = [(MTLPrimitiveAccelerationStructureDescriptor *)self motionKeyframeCount];
              LOBYTE(v10) = v20 == [a3 motionKeyframeCount];
              return v10;
            }
          }
        }
      }
LABEL_3:
      LOBYTE(v10) = 0;
    }
  }
  return v10;
}

- (unint64_t)hash
{
  bzero(v9, 0x30uLL);
  v8.receiver = self;
  v8.super_class = (Class)MTLPrimitiveAccelerationStructureDescriptor;
  v9[0] = [(MTLAccelerationStructureDescriptor *)&v8 hash];
  uint64_t v3 = MTLHashArray([(MTLPrimitiveAccelerationStructureDescriptor *)self geometryDescriptors], 1, 0);
  uint64_t motionStartBorderMode = self->_motionStartBorderMode;
  v9[1] = v3;
  v9[2] = motionStartBorderMode;
  float motionStartTime = self->_motionStartTime;
  v9[3] = self->_motionEndBorderMode;
  float motionEndTime = self->_motionEndTime;
  float v10 = motionStartTime;
  float v11 = motionEndTime;
  unint64_t motionKeyframeCount = self->_motionKeyframeCount;
  return _MTLHashState((int *)v9, 0x30uLL);
}

- (NSArray)geometryDescriptors
{
  return self->_geometryDescriptors;
}

- (void)setGeometryDescriptors:(NSArray *)geometryDescriptors
{
}

- (MTLMotionBorderMode)motionStartBorderMode
{
  return self->_motionStartBorderMode;
}

- (void)setMotionStartBorderMode:(MTLMotionBorderMode)motionStartBorderMode
{
  self->_uint64_t motionStartBorderMode = motionStartBorderMode;
}

- (MTLMotionBorderMode)motionEndBorderMode
{
  return self->_motionEndBorderMode;
}

- (void)setMotionEndBorderMode:(MTLMotionBorderMode)motionEndBorderMode
{
  self->_motionEndBorderMode = motionEndBorderMode;
}

- (float)motionStartTime
{
  return self->_motionStartTime;
}

- (void)setMotionStartTime:(float)motionStartTime
{
  self->_float motionStartTime = motionStartTime;
}

- (float)motionEndTime
{
  return self->_motionEndTime;
}

- (void)setMotionEndTime:(float)motionEndTime
{
  self->_float motionEndTime = motionEndTime;
}

- (NSUInteger)motionKeyframeCount
{
  return self->_motionKeyframeCount;
}

- (void)setMotionKeyframeCount:(NSUInteger)motionKeyframeCount
{
  self->_unint64_t motionKeyframeCount = motionKeyframeCount;
}

@end