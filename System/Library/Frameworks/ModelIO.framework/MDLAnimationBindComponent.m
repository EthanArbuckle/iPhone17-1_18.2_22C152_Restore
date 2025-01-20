@interface MDLAnimationBindComponent
- (MDLSkeleton)skeleton;
- (NSArray)jointPaths;
- (__n128)geometryBindTransform;
- (__n128)setGeometryBindTransform:(long long *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)jointAnimation;
- (void)setJointAnimation:(id)jointAnimation;
- (void)setJointPaths:(NSArray *)jointPaths;
- (void)setSkeleton:(MDLSkeleton *)skeleton;
@end

@implementation MDLAnimationBindComponent

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend_allocWithZone_(MDLAnimationBindComponent, a2, (uint64_t)a3);
  v7 = objc_msgSend_init(v4, v5, v6);
  objc_msgSend_setSkeleton_(v7, v8, (uint64_t)self->_skeleton);
  objc_msgSend_setJointAnimation_(v7, v9, (uint64_t)self->_jointAnimation);
  long long v10 = *(_OWORD *)&self[1]._jointAnimation;
  var10[0] = *(_OWORD *)&self[1].super.isa;
  var10[1] = v10;
  objc_msgSend_setGeometryBindTransform_(v7, v11, (uint64_t)var10);
  return v7;
}

- (MDLSkeleton)skeleton
{
  return self->_skeleton;
}

- (void)setSkeleton:(MDLSkeleton *)skeleton
{
}

- (id)jointAnimation
{
  return self->_jointAnimation;
}

- (void)setJointAnimation:(id)jointAnimation
{
}

- (NSArray)jointPaths
{
  return self->_jointPaths;
}

- (void)setJointPaths:(NSArray *)jointPaths
{
}

- (__n128)geometryBindTransform
{
  long long v2 = *(_OWORD *)(a1 + 112);
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 96);
  *(_OWORD *)(a2 + 80) = v2;
  long long v3 = *(_OWORD *)(a1 + 144);
  *(_OWORD *)(a2 + 96) = *(_OWORD *)(a1 + 128);
  *(_OWORD *)(a2 + 112) = v3;
  long long v4 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)a2 = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(a2 + 16) = v4;
  __n128 result = *(__n128 *)(a1 + 64);
  long long v6 = *(_OWORD *)(a1 + 80);
  *(__n128 *)(a2 + 32) = result;
  *(_OWORD *)(a2 + 48) = v6;
  return result;
}

- (__n128)setGeometryBindTransform:(long long *)a3
{
  long long v3 = *a3;
  long long v4 = a3[1];
  long long v5 = a3[3];
  *(_OWORD *)(a1 + 64) = a3[2];
  *(_OWORD *)(a1 + 80) = v5;
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  __n128 result = (__n128)a3[4];
  long long v7 = a3[5];
  long long v8 = a3[7];
  *(_OWORD *)(a1 + 128) = a3[6];
  *(_OWORD *)(a1 + 144) = v8;
  *(__n128 *)(a1 + 96) = result;
  *(_OWORD *)(a1 + 112) = v7;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_jointPaths, 0);
  objc_storeStrong((id *)&self->_jointAnimation, 0);

  objc_storeStrong((id *)&self->_skeleton, 0);
}

@end