@interface GESSMathAABB
- (const)boxImpl;
- (float)maxX;
- (float)maxY;
- (float)maxZ;
- (float)minX;
- (float)minY;
- (float)minZ;
- (id).cxx_construct;
- (void)setBoxImpl:(const void *)a3;
- (void)setMaxX:(float)a3;
- (void)setMaxY:(float)a3;
- (void)setMaxZ:(float)a3;
- (void)setMinX:(float)a3;
- (void)setMinY:(float)a3;
- (void)setMinZ:(float)a3;
@end

@implementation GESSMathAABB

- (const)boxImpl
{
  return &self[1];
}

- (void)setBoxImpl:(const void *)a3
{
  self[1] = *(GESSMathAABB *)a3;
  self[2] = *((GESSMathAABB *)a3 + 1);
}

- (float)minX
{
  return *(float *)&self[1].super.isa;
}

- (void)setMinX:(float)a3
{
  *(float *)&self[1].super.isa = a3;
}

- (float)minY
{
  return *((float *)&self[1].super.isa + 1);
}

- (void)setMinY:(float)a3
{
  *((float *)&self[1].super.isa + 1) = a3;
}

- (float)minZ
{
  return *(float *)self[1]._anon_8;
}

- (void)setMinZ:(float)a3
{
  *(float *)self[1]._anon_8 = a3;
}

- (float)maxX
{
  return *(float *)&self[2].super.isa;
}

- (void)setMaxX:(float)a3
{
  *(float *)&self[2].super.isa = a3;
}

- (float)maxY
{
  return *((float *)&self[2].super.isa + 1);
}

- (void)setMaxY:(float)a3
{
  *((float *)&self[2].super.isa + 1) = a3;
}

- (float)maxZ
{
  return *(float *)self[2]._anon_8;
}

- (void)setMaxZ:(float)a3
{
  *(float *)self[2]._anon_8 = a3;
}

- (id).cxx_construct
{
  *(void *)&long long v2 = 0x80000000800000;
  *((void *)&v2 + 1) = 0x80000000800000;
  *((int32x4_t *)self + 1) = vdupq_n_s32(0x7F7FFFFFu);
  *((_OWORD *)self + 2) = v2;
  return self;
}

@end