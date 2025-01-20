@interface SCNHitTestResult
+ (id)hitTestResultsFromHitTestResultRef:(__CFArray *)a3;
- (CGPoint)textureCoordinate;
- (CGPoint)textureCoordinatesWithMappingChannel:(NSInteger)channel;
- (NSInteger)faceIndex;
- (NSInteger)geometryIndex;
- (SCNHitTestResult)initWithResult:(__C3DHitTestResult *)a3;
- (SCNMatrix4)modelTransform;
- (SCNNode)boneNode;
- (SCNNode)node;
- (SCNVector3)localCoordinates;
- (SCNVector3)localNormal;
- (SCNVector3)worldCoordinates;
- (SCNVector3)worldNormal;
- (id)description;
- (simd_float3)simdLocalCoordinates;
- (simd_float3)simdLocalNormal;
- (simd_float3)simdWorldCoordinates;
- (simd_float3)simdWorldNormal;
- (simd_float4x4)simdModelTransform;
- (void)dealloc;
@end

@implementation SCNHitTestResult

- (SCNHitTestResult)initWithResult:(__C3DHitTestResult *)a3
{
  v3 = self;
  if (a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)SCNHitTestResult;
    v3 = [(SCNHitTestResult *)&v6 init];
    if (v3) {
      v3->_result = (__C3DHitTestResult *)CFRetain(a3);
    }
  }
  return v3;
}

- (void)dealloc
{
  result = self->_result;
  if (result)
  {
    CFRelease(result);
    self->_result = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SCNHitTestResult;
  [(SCNHitTestResult *)&v4 dealloc];
}

- (SCNNode)node
{
  result = (SCNNode *)C3DHitTestResultGetNode((uint64_t)self->_result);
  if (result)
  {
    return +[SCNNode nodeWithNodeRef:result];
  }
  return result;
}

- (SCNNode)boneNode
{
  result = (SCNNode *)C3DHitTestResultGetJoint((uint64_t)self->_result);
  if (result)
  {
    return +[SCNNode nodeWithNodeRef:result];
  }
  return result;
}

- (NSInteger)geometryIndex
{
  return C3DHitTestResultGetGeometryElementIndex((uint64_t)self->_result);
}

- (NSInteger)faceIndex
{
  return C3DHitTestResultGetPrimitiveIndex((uint64_t)self->_result);
}

- (SCNVector3)localCoordinates
{
  [(SCNHitTestResult *)self simdLocalCoordinates];
  float v4 = v3;
  float v6 = v5;
  result.z = v6;
  result.y = v4;
  result.x = v2;
  return result;
}

- (SCNVector3)worldCoordinates
{
  [(SCNHitTestResult *)self simdWorldCoordinates];
  float v4 = v3;
  float v6 = v5;
  result.z = v6;
  result.y = v4;
  result.x = v2;
  return result;
}

- (SCNVector3)localNormal
{
  [(SCNHitTestResult *)self simdLocalNormal];
  float v4 = v3;
  float v6 = v5;
  result.z = v6;
  result.y = v4;
  result.x = v2;
  return result;
}

- (SCNVector3)worldNormal
{
  [(SCNHitTestResult *)self simdWorldNormal];
  float v4 = v3;
  float v6 = v5;
  result.z = v6;
  result.y = v4;
  result.x = v2;
  return result;
}

- (CGPoint)textureCoordinatesWithMappingChannel:(NSInteger)channel
{
  float64x2_t v3 = vcvtq_f64_f32(COERCE_FLOAT32X2_T(C3DHitTestResultGetTextureCoordinates((uint64_t)self->_result, channel)));
  double v4 = v3.f64[1];
  result.x = v3.f64[0];
  result.y = v4;
  return result;
}

- (CGPoint)textureCoordinate
{
  NSLog(&cfstr_Texturecoordin_0.isa, a2);

  [(SCNHitTestResult *)self textureCoordinatesWithMappingChannel:0];
  result.y = v4;
  result.x = v3;
  return result;
}

- (SCNMatrix4)modelTransform
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  ModelTransform = (long long *)C3DHitTestResultGetModelTransform((uint64_t)self->_result);
  if (ModelTransform)
  {
    long long v5 = *ModelTransform;
    long long v6 = ModelTransform[1];
    long long v7 = ModelTransform[3];
    long long v11 = ModelTransform[2];
    long long v12 = v7;
    long long v9 = v5;
    long long v10 = v6;
  }
  else
  {
    C3DMatrix4x4MakeIdentity((uint64_t)&v9);
  }
  *(_OWORD *)&retstr->m31 = 0u;
  *(_OWORD *)&retstr->m41 = 0u;
  *(_OWORD *)&retstr->m11 = 0u;
  *(_OWORD *)&retstr->m21 = 0u;
  C3DMatrix4x4ToSCNMatrix4((uint64_t)&v9, retstr);
  return result;
}

+ (id)hitTestResultsFromHitTestResultRef:(__CFArray *)a3
{
  uint64_t v4 = [(__CFArray *)a3 count];
  long long v5 = (void *)[MEMORY[0x263EFF980] arrayWithCapacity:v4];
  if (v4)
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      long long v7 = [[SCNHitTestResult alloc] initWithResult:[(__CFArray *)a3 objectAtIndex:i]];
      [v5 addObject:v7];
    }
  }
  return v5;
}

- (id)description
{
  [(SCNHitTestResult *)self worldCoordinates];
  float v4 = v3;
  float v6 = v5;
  float v8 = v7;
  long long v9 = NSString;
  long long v10 = (objc_class *)objc_opt_class();
  return (id)[v9 stringWithFormat:@"<%@: %p <%f,%f,%f> | geometryIndex=%d node=%@ bone=%@>", NSStringFromClass(v10), self, v4, v6, v8, -[SCNHitTestResult geometryIndex](self, "geometryIndex"), -[SCNHitTestResult node](self, "node"), -[SCNHitTestResult boneNode](self, "boneNode")];
}

- (simd_float3)simdLocalCoordinates
{
  LocalPosition = (simd_float3 *)C3DHitTestResultGetLocalPosition((uint64_t)self->_result);
  if (LocalPosition) {
    return *LocalPosition;
  }
  else {
    return (simd_float3)0;
  }
}

- (simd_float3)simdWorldCoordinates
{
  WorldPosition = (simd_float3 *)C3DHitTestResultGetWorldPosition((uint64_t)self->_result);
  if (WorldPosition) {
    return *WorldPosition;
  }
  else {
    return (simd_float3)0;
  }
}

- (simd_float3)simdLocalNormal
{
  LocalNormal = (simd_float3 *)C3DHitTestResultGetLocalNormal((uint64_t)self->_result);
  if (LocalNormal) {
    return *LocalNormal;
  }
  else {
    return (simd_float3)0;
  }
}

- (simd_float3)simdWorldNormal
{
  *(double *)result.i64 = C3DHitTestResultGetWorldNormal((float32x4_t *)self->_result);
  return result;
}

- (simd_float4x4)simdModelTransform
{
  uint64_t ModelTransform = C3DHitTestResultGetModelTransform((uint64_t)self->_result);
  float v3 = (simd_float4 *)MEMORY[0x263EF89A8];
  if (ModelTransform) {
    float v3 = (simd_float4 *)ModelTransform;
  }
  simd_float4 v4 = *v3;
  simd_float4 v5 = v3[1];
  simd_float4 v6 = v3[2];
  simd_float4 v7 = v3[3];
  result.columns[3] = v7;
  result.columns[2] = v6;
  result.columns[1] = v5;
  result.columns[0] = v4;
  return result;
}

@end