@interface AVTPhysicsRig
- (__n128)setConeConstraintAnchorB:(__n128)a3;
- (__n128)setConeConstraintBasis_chainParent:(__n128)a3;
- (__n128)setRestGravityVector_chainRoot:(__n128 *)result;
- (__n128)setRestPosition_chainRoot:(__n128 *)result;
- (double)coneConstraintAnchorB;
- (double)coneConstraintBasis_chainParent;
- (double)coneConstraintLength;
- (double)coneConstraintSinusAngularLimit;
- (double)downForceFactor;
- (double)restGravityVector_chainRoot;
- (double)restPosition_chainRoot;
- (uint64_t)chainRoot;
- (uint64_t)physicsBehavior;
- (uint64_t)physicsBody;
- (uint64_t)rig;
- (uint64_t)setConeConstraintLength:(uint64_t)result;
- (uint64_t)setConeConstraintSinusAngularLimit:(uint64_t)result;
- (uint64_t)setDownForceFactor:(uint64_t)result;
- (void)setChainRoot:(uint64_t)a1;
- (void)setPhysicsBehavior:(uint64_t)a1;
- (void)setPhysicsBody:(uint64_t)a1;
- (void)setRig:(uint64_t)a1;
@end

@implementation AVTPhysicsRig

- (uint64_t)rig
{
  if (result) {
    return *(void *)(result + 16);
  }
  return result;
}

- (void)setRig:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 16), a2);
  }
}

- (uint64_t)chainRoot
{
  if (result) {
    return *(void *)(result + 24);
  }
  return result;
}

- (void)setChainRoot:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

- (uint64_t)physicsBody
{
  if (result) {
    return *(void *)(result + 32);
  }
  return result;
}

- (void)setPhysicsBody:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 32), a2);
  }
}

- (uint64_t)physicsBehavior
{
  if (result) {
    return *(void *)(result + 40);
  }
  return result;
}

- (void)setPhysicsBehavior:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 40), a2);
  }
}

- (double)restPosition_chainRoot
{
  if (a1) {
    long long v1 = *(_OWORD *)(a1 + 64);
  }
  else {
    *(void *)&long long v1 = 0;
  }
  return *(double *)&v1;
}

- (__n128)setRestPosition_chainRoot:(__n128 *)result
{
  if (result) {
    result[4] = a2;
  }
  return result;
}

- (double)restGravityVector_chainRoot
{
  if (a1) {
    long long v1 = *(_OWORD *)(a1 + 80);
  }
  else {
    *(void *)&long long v1 = 0;
  }
  return *(double *)&v1;
}

- (__n128)setRestGravityVector_chainRoot:(__n128 *)result
{
  if (result) {
    result[5] = a2;
  }
  return result;
}

- (double)downForceFactor
{
  if (a1) {
    return *(double *)(a1 + 48);
  }
  else {
    return 0.0;
  }
}

- (uint64_t)setDownForceFactor:(uint64_t)result
{
  if (result) {
    *(double *)(result + 48) = a2;
  }
  return result;
}

- (double)coneConstraintLength
{
  if (!a1) {
    return 0.0;
  }
  LODWORD(result) = *(_DWORD *)(a1 + 8);
  return result;
}

- (uint64_t)setConeConstraintLength:(uint64_t)result
{
  if (result) {
    *(float *)(result + 8) = a2;
  }
  return result;
}

- (double)coneConstraintSinusAngularLimit
{
  if (!a1) {
    return 0.0;
  }
  LODWORD(result) = *(_DWORD *)(a1 + 12);
  return result;
}

- (uint64_t)setConeConstraintSinusAngularLimit:(uint64_t)result
{
  if (result) {
    *(float *)(result + 12) = a2;
  }
  return result;
}

- (double)coneConstraintBasis_chainParent
{
  if (a1) {
    long long v1 = *(_OWORD *)(a1 + 96);
  }
  else {
    *(void *)&long long v1 = 0;
  }
  return *(double *)&v1;
}

- (__n128)setConeConstraintBasis_chainParent:(__n128)a3
{
  if (result)
  {
    result[6] = a2;
    result[7] = a3;
    result[8] = a4;
  }
  return result;
}

- (double)coneConstraintAnchorB
{
  if (a1) {
    long long v1 = *(_OWORD *)(a1 + 144);
  }
  else {
    *(void *)&long long v1 = 0;
  }
  return *(double *)&v1;
}

- (__n128)setConeConstraintAnchorB:(__n128)a3
{
  if (result)
  {
    result[9] = a2;
    result[10] = a3;
    result[11] = a4;
    result[12] = a5;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_physicsBehavior, 0);
  objc_storeStrong((id *)&self->_physicsBody, 0);
  objc_storeStrong((id *)&self->_chainRoot, 0);
  objc_storeStrong((id *)&self->_rig, 0);
}

@end