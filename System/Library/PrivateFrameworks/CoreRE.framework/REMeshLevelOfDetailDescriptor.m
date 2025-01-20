@interface REMeshLevelOfDetailDescriptor
+ (BOOL)supportsSecureCoding;
- (BOOL)validateWithPartCount:(unint64_t)a3 error:(id *)a4;
- (MeshLodLevelInfo)lodLevelInfo;
- (REMeshLevelOfDetailDescriptor)initWithCoder:(id)a3;
- (REMeshLevelOfDetailDescriptor)initWithLodLevelInfo:(const MeshLodLevelInfo *)a3;
- (REMeshLevelOfDetailDescriptor)initWithMeshPartEndIndex:(unsigned int)a3 minScreenArea:(float)a4 maxViewDepth:(float)a5;
- (float)maxViewDepth;
- (float)minScreenArea;
- (unint64_t)estimateContainerSize;
- (unsigned)meshPartEndIndex;
- (void)encodeWithCoder:(id)a3;
@end

@implementation REMeshLevelOfDetailDescriptor

- (REMeshLevelOfDetailDescriptor)initWithLodLevelInfo:(const MeshLodLevelInfo *)a3
{
  *(float *)&double v3 = a3->var0;
  *(float *)&double v4 = a3->var1;
  return [(REMeshLevelOfDetailDescriptor *)self initWithMeshPartEndIndex:a3->var2 minScreenArea:v3 maxViewDepth:v4];
}

- (MeshLodLevelInfo)lodLevelInfo
{
  [(REMeshLevelOfDetailDescriptor *)self minScreenArea];
  unsigned int v4 = v3;
  [(REMeshLevelOfDetailDescriptor *)self maxViewDepth];
  unsigned int v6 = v5;
  unsigned int v7 = [(REMeshLevelOfDetailDescriptor *)self meshPartEndIndex];
  unint64_t v8 = v4 | ((unint64_t)v6 << 32);
  result.var0 = *(float *)&v8;
  result.var1 = *((float *)&v8 + 1);
  result.var2 = v7;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMeshLevelOfDetailDescriptor)initWithMeshPartEndIndex:(unsigned int)a3 minScreenArea:(float)a4 maxViewDepth:(float)a5
{
  v9.receiver = self;
  v9.super_class = (Class)REMeshLevelOfDetailDescriptor;
  MeshLodLevelInfo result = [(REMeshLevelOfDetailDescriptor *)&v9 init];
  if (result)
  {
    result->_meshPartEndIndex = a3;
    result->_minScreenArea = a4;
    result->_maxViewDepth = a5;
  }
  return result;
}

- (REMeshLevelOfDetailDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 decodeIntegerForKey:@"meshPartEndIndex"];
  self->_meshPartEndIndex = v5;
  [v4 decodeFloatForKey:@"minScreenArea"];
  self->_minScreenArea = v6;
  [v4 decodeFloatForKey:@"maxViewDepth"];
  self->_maxViewDepth = v8;
  if (HIDWORD(v5)) {
    objc_super v9 = {;
  }
    [v4 failWithError:v9];

    v10 = 0;
  }
  else
  {
    v10 = self;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  [v6 encodeInteger:self->_meshPartEndIndex forKey:@"meshPartEndIndex"];
  *(float *)&double v4 = self->_minScreenArea;
  [v6 encodeFloat:@"minScreenArea" forKey:v4];
  *(float *)&double v5 = self->_maxViewDepth;
  [v6 encodeFloat:@"maxViewDepth" forKey:v5];
}

- (BOOL)validateWithPartCount:(unint64_t)a3 error:(id *)a4
{
  unint64_t meshPartEndIndex = self->_meshPartEndIndex;
  if (meshPartEndIndex > a3) {
  return meshPartEndIndex <= a3;
  }
}

- (unint64_t)estimateContainerSize
{
  v2 = (objc_class *)objc_opt_class();
  return class_getInstanceSize(v2);
}

- (unsigned)meshPartEndIndex
{
  return self->_meshPartEndIndex;
}

- (float)minScreenArea
{
  return self->_minScreenArea;
}

- (float)maxViewDepth
{
  return self->_maxViewDepth;
}

@end