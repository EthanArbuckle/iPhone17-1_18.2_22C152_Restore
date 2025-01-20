@interface GTReplayShaderDebugMesh
+ (BOOL)supportsSecureCoding;
- (GTPoint3D)maxThreadPositionInGrid;
- (GTPoint3D)minThreadPositionInGrid;
- (GTPoint3D)objectThreadgroupPositionInGrid;
- (GTReplayShaderDebugMesh)initWithCoder:(id)a3;
- (unsigned)amplificationID;
- (void)encodeWithCoder:(id)a3;
- (void)setAmplificationID:(unsigned int)a3;
- (void)setMaxThreadPositionInGrid:(GTPoint3D *)a3;
- (void)setMinThreadPositionInGrid:(GTPoint3D *)a3;
- (void)setObjectThreadgroupPositionInGrid:(GTPoint3D *)a3;
@end

@implementation GTReplayShaderDebugMesh

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTReplayShaderDebugMesh)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GTReplayShaderDebugMesh;
  v5 = [(GTReplayShaderDebugRequest *)&v12 initWithCoder:v4];
  v6 = v5;
  if (v5)
  {
    p_minThreadPositionInGrid = &v5->_minThreadPositionInGrid;
    GTPoint3DDecode(v4, @"MinThreadPosition", &v10);
    *(_OWORD *)&p_minThreadPositionInGrid->x = v10;
    v6->_minThreadPositionInGrid.z = v11;
    GTPoint3DDecode(v4, @"MaxThreadPosition", &v10);
    *(_OWORD *)&v6->_maxThreadPositionInGrid.x = v10;
    v6->_maxThreadPositionInGrid.z = v11;
    GTPoint3DDecode(v4, @"ObjectThreadGroupPosition", &v10);
    *(_OWORD *)&v6->_objectThreadgroupPositionInGrid.x = v10;
    v6->_objectThreadgroupPositionInGrid.z = v11;
    v6->_amplificationID = [v4 decodeInt32ForKey:@"AmplificationID"];
    v8 = v6;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)GTReplayShaderDebugMesh;
  id v4 = a3;
  [(GTReplayShaderDebugRequest *)&v6 encodeWithCoder:v4];
  GTPoint3D minThreadPositionInGrid = self->_minThreadPositionInGrid;
  GTPoint3DEncode(v4, (uint64_t *)&minThreadPositionInGrid, @"MinThreadPosition");
  GTPoint3D minThreadPositionInGrid = self->_maxThreadPositionInGrid;
  GTPoint3DEncode(v4, (uint64_t *)&minThreadPositionInGrid, @"MaxThreadPosition");
  GTPoint3D minThreadPositionInGrid = self->_objectThreadgroupPositionInGrid;
  GTPoint3DEncode(v4, (uint64_t *)&minThreadPositionInGrid, @"ObjectThreadGroupPosition");
  [v4 encodeInt32:self->_amplificationID forKey:@"AmplificationID"];
}

- (GTPoint3D)minThreadPositionInGrid
{
  *retstr = *(GTPoint3D *)((char *)self + 56);
  return self;
}

- (void)setMinThreadPositionInGrid:(GTPoint3D *)a3
{
  unint64_t z = a3->z;
  *(_OWORD *)&self->_minThreadPositionInGrid.x = *(_OWORD *)&a3->x;
  self->_minThreadPositionInGrid.unint64_t z = z;
}

- (GTPoint3D)maxThreadPositionInGrid
{
  *retstr = *(GTPoint3D *)((char *)self + 80);
  return self;
}

- (void)setMaxThreadPositionInGrid:(GTPoint3D *)a3
{
  unint64_t z = a3->z;
  *(_OWORD *)&self->_maxThreadPositionInGrid.x = *(_OWORD *)&a3->x;
  self->_maxThreadPositionInGrid.unint64_t z = z;
}

- (GTPoint3D)objectThreadgroupPositionInGrid
{
  *retstr = *(GTPoint3D *)((char *)self + 104);
  return self;
}

- (void)setObjectThreadgroupPositionInGrid:(GTPoint3D *)a3
{
  unint64_t z = a3->z;
  *(_OWORD *)&self->_objectThreadgroupPositionInGrid.x = *(_OWORD *)&a3->x;
  self->_objectThreadgroupPositionInGrid.unint64_t z = z;
}

- (unsigned)amplificationID
{
  return self->_amplificationID;
}

- (void)setAmplificationID:(unsigned int)a3
{
  self->_amplificationID = a3;
}

@end