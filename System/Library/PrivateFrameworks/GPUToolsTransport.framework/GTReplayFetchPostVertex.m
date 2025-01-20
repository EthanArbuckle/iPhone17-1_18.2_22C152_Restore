@interface GTReplayFetchPostVertex
+ (BOOL)supportsSecureCoding;
- ($71565B17A5F3ED2E4525C95CCD99C39E)dispatchUID;
- (BOOL)objectShaderThreadgroupBoundsPresent;
- (GTPoint3D)objectShaderThreadgroupBeginBounds;
- (GTPoint3D)objectShaderThreadgroupEndBounds;
- (GTReplayFetchPostVertex)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setDispatchUID:(id)a3;
- (void)setObjectShaderThreadgroupBeginBounds:(GTPoint3D *)a3;
- (void)setObjectShaderThreadgroupBoundsPresent:(BOOL)a3;
- (void)setObjectShaderThreadgroupEndBounds:(GTPoint3D *)a3;
@end

@implementation GTReplayFetchPostVertex

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GTReplayFetchPostVertex)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GTReplayFetchPostVertex;
  v5 = [(GTReplayRequest *)&v10 initWithCoder:v4];
  if (v5)
  {
    v5[16] = [v4 decodeBoolForKey:@"objectShaderThreadgroupBoundsPresent"];
    GTPoint3DDecode(v4, @"objectShaderThreadgroupBeginBounds", &v8);
    *((_OWORD *)v5 + 2) = v8;
    *((void *)v5 + 6) = v9;
    GTPoint3DDecode(v4, @"objectShaderThreadgroupEndBounds", &v8);
    *(_OWORD *)(v5 + 56) = v8;
    *((void *)v5 + 9) = v9;
    *((void *)v5 + 3) = GTDispatchUIDDecode(v4, @"dispatchUID");
    v6 = v5;
  }

  return (GTReplayFetchPostVertex *)v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)GTReplayFetchPostVertex;
  id v4 = a3;
  [(GTReplayRequest *)&v6 encodeWithCoder:v4];
  [v4 encodeBool:self->_objectShaderThreadgroupBoundsPresent forKey:@"objectShaderThreadgroupBoundsPresent"];
  GTPoint3D objectShaderThreadgroupBeginBounds = self->_objectShaderThreadgroupBeginBounds;
  GTPoint3DEncode(v4, (uint64_t *)&objectShaderThreadgroupBeginBounds, @"objectShaderThreadgroupBeginBounds");
  GTPoint3D objectShaderThreadgroupBeginBounds = self->_objectShaderThreadgroupEndBounds;
  GTPoint3DEncode(v4, (uint64_t *)&objectShaderThreadgroupBeginBounds, @"objectShaderThreadgroupEndBounds");
  GTDispatchUIDEncode(v4, self->_dispatchUID.uid, @"dispatchUID");
}

- ($71565B17A5F3ED2E4525C95CCD99C39E)dispatchUID
{
  return ($71565B17A5F3ED2E4525C95CCD99C39E)self->_dispatchUID.uid;
}

- (void)setDispatchUID:(id)a3
{
  self->_dispatchUID.uid = a3.var1;
}

- (BOOL)objectShaderThreadgroupBoundsPresent
{
  return self->_objectShaderThreadgroupBoundsPresent;
}

- (void)setObjectShaderThreadgroupBoundsPresent:(BOOL)a3
{
  self->_objectShaderThreadgroupBoundsPresent = a3;
}

- (GTPoint3D)objectShaderThreadgroupBeginBounds
{
  *retstr = *(GTPoint3D *)((char *)self + 32);
  return self;
}

- (void)setObjectShaderThreadgroupBeginBounds:(GTPoint3D *)a3
{
  unint64_t z = a3->z;
  *(_OWORD *)&self->_objectShaderThreadgroupBeginBounds.x = *(_OWORD *)&a3->x;
  self->_objectShaderThreadgroupBeginBounds.unint64_t z = z;
}

- (GTPoint3D)objectShaderThreadgroupEndBounds
{
  *retstr = *(GTPoint3D *)((char *)self + 56);
  return self;
}

- (void)setObjectShaderThreadgroupEndBounds:(GTPoint3D *)a3
{
  unint64_t z = a3->z;
  *(_OWORD *)&self->_objectShaderThreadgroupEndBounds.x = *(_OWORD *)&a3->x;
  self->_objectShaderThreadgroupEndBounds.unint64_t z = z;
}

@end