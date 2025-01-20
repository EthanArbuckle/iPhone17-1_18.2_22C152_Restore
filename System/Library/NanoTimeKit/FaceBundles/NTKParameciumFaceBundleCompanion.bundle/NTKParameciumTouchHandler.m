@interface NTKParameciumTouchHandler
- (NTKParameciumTouchHandler)init;
- (void)clearTouches;
- (void)iterateTouchesWithBlock:(id)a3;
- (void)rotateTouchesByAngle:(float)a3;
- (void)startWaveAtX:(float)a3 y:(float)a4 atTime:(double)a5;
@end

@implementation NTKParameciumTouchHandler

- (NTKParameciumTouchHandler)init
{
  v5.receiver = self;
  v5.super_class = (Class)NTKParameciumTouchHandler;
  v2 = [(NTKParameciumTouchHandler *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->_touchIndex = 0;
    memset_pattern16(v2->_touchTimes, &unk_BBA0, 0x28uLL);
  }
  return v3;
}

- (void)startWaveAtX:(float)a3 y:(float)a4 atTime:(double)a5
{
  unint64_t v5 = (self->_touchIndex + 1) % 0xA;
  if (a5 - self->_touchTimes[v5] > 1.75)
  {
    self->_touchIndex = v5;
    float v6 = a5 + 0.05;
    self->_touchTimes[v5] = v6;
    *(void *)&self->_touchCoords[8 * v5] = *(void *)&a3;
  }
}

- (void)clearTouches
{
  for (uint64_t i = 0; i != 10; ++i)
  {
    self->_touchTimes[i] = -3.4028e38;
    *(void *)&self->_touchCoords[8 * self->_touchIndex] = 0;
  }
}

- (void)iterateTouchesWithBlock:(id)a3
{
  uint64_t v4 = 0;
  touchTimes = self->_touchTimes;
  do
  {
    (*((void (**)(id, uint64_t, float, double))a3 + 2))(a3, v4, touchTimes[v4], *(double *)&touchTimes[2 * v4 - 20]);
    ++v4;
  }
  while (v4 != 10);
}

- (void)rotateTouchesByAngle:(float)a3
{
  __float2 v4 = __sincosf_stret(a3);
  v5.f32[0] = -v4.__sinval;
  v5.i32[1] = LODWORD(v4.__cosval);
  for (uint64_t i = 16; i != 96; i += 8)
  {
    float32x2_t v7 = vadd_f32(*(float32x2_t *)((char *)&self->super.isa + i), (float32x2_t)0xBF000000BF000000);
    *(float32x2_t *)((char *)&self->super.isa + i) = vadd_f32(vmla_lane_f32(vmul_n_f32((float32x2_t)__PAIR64__(LODWORD(v4.__sinval), LODWORD(v4.__cosval)), v7.f32[0]), v5, v7, 1), (float32x2_t)0x3F0000003F000000);
  }
}

@end