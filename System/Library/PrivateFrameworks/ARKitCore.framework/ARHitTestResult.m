@interface ARHitTestResult
- (ARAnchor)anchor;
- (ARHitTestResult)initWithType:(unint64_t)a3;
- (ARHitTestResultType)type;
- (CGFloat)distance;
- (__n128)setLocalTransform:(__n128)a3;
- (__n128)setWorldTransform:(__n128)a3;
- (id)_description:(BOOL)a3;
- (id)debugQuickLookObject;
- (id)description;
- (simd_float4x4)localTransform;
- (simd_float4x4)worldTransform;
- (void)setAnchor:(id)a3;
- (void)setDistance:(double)a3;
@end

@implementation ARHitTestResult

- (ARHitTestResult)initWithType:(unint64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)ARHitTestResult;
  result = [(ARHitTestResult *)&v10 init];
  if (result)
  {
    result->_type = a3;
    result->_distance = 0.0;
    uint64_t v5 = MEMORY[0x1E4F149A0];
    long long v6 = *MEMORY[0x1E4F149A0];
    long long v7 = *(_OWORD *)(MEMORY[0x1E4F149A0] + 16);
    *(_OWORD *)result->_anon_20 = *MEMORY[0x1E4F149A0];
    *(_OWORD *)&result->_anon_20[16] = v7;
    long long v8 = *(_OWORD *)(v5 + 32);
    long long v9 = *(_OWORD *)(v5 + 48);
    *(_OWORD *)&result->_anon_20[32] = v8;
    *(_OWORD *)&result->_anon_20[48] = v9;
    *(_OWORD *)&result[1].super.isa = v6;
    *(_OWORD *)&result[1]._distance = v7;
    *(_OWORD *)result[1]._anon_20 = v8;
    *(_OWORD *)&result[1]._anon_20[16] = v9;
  }
  return result;
}

- (id)_description:(BOOL)a3
{
  BOOL v3 = a3;
  ARHitTestResultType v5 = [(ARHitTestResult *)self type];
  long long v6 = @"featurePoint";
  switch(v5)
  {
    case 1uLL:
      break;
    case 2uLL:
      long long v6 = @"estimatedHorizontalPlane";
      break;
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      goto LABEL_6;
    case 4uLL:
      long long v6 = @"estimatedVerticalPlane";
      break;
    case 8uLL:
      long long v6 = @"existingPlane";
      break;
    default:
      if (v5 == 16)
      {
        long long v6 = @"existingPlaneUsingExtent";
      }
      else if (v5 == 32)
      {
        long long v6 = @"existingPlaneUsingGeometry";
      }
      else
      {
LABEL_6:
        objc_msgSend(NSString, "stringWithFormat:", @"%lu", -[ARHitTestResult type](self, "type"));
        long long v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      break;
  }
  long long v7 = (void *)MEMORY[0x1E4F28E78];
  long long v8 = (objc_class *)objc_opt_class();
  long long v9 = NSStringFromClass(v8);
  [(ARHitTestResult *)self distance];
  uint64_t v11 = v10;
  [(ARHitTestResult *)self localTransform];
  v16 = ARMatrix4x4Description(v3, v12, v13, v14, v15);
  [(ARHitTestResult *)self worldTransform];
  v21 = ARMatrix4x4Description(v3, v17, v18, v19, v20);
  v22 = [v7 stringWithFormat:@"<%@: %p type=%@ distance=%f localTransform=%@ worldTransform=%@", v9, self, v6, v11, v16, v21];

  v23 = [(ARHitTestResult *)self anchor];

  if (v23)
  {
    v24 = [(ARHitTestResult *)self anchor];
    [v22 appendFormat:@" anchor=%@", v24];
  }
  [v22 appendString:@">"];

  return v22;
}

- (id)description
{
  return [(ARHitTestResult *)self _description:0];
}

- (id)debugQuickLookObject
{
  return [(ARHitTestResult *)self _description:1];
}

- (ARHitTestResultType)type
{
  return self->_type;
}

- (CGFloat)distance
{
  return self->_distance;
}

- (void)setDistance:(double)a3
{
  self->_distance = a3;
}

- (simd_float4x4)localTransform
{
  simd_float4 v2 = *(simd_float4 *)self->_anon_20;
  simd_float4 v3 = *(simd_float4 *)&self->_anon_20[16];
  simd_float4 v4 = *(simd_float4 *)&self->_anon_20[32];
  simd_float4 v5 = *(simd_float4 *)&self->_anon_20[48];
  result.columns[3] = v5;
  result.columns[2] = v4;
  result.columns[1] = v3;
  result.columns[0] = v2;
  return result;
}

- (__n128)setLocalTransform:(__n128)a3
{
  result[2] = a2;
  result[3] = a3;
  result[4] = a4;
  result[5] = a5;
  return result;
}

- (simd_float4x4)worldTransform
{
  simd_float4 v2 = *(simd_float4 *)&self[1].super.isa;
  simd_float4 v3 = *(simd_float4 *)&self[1]._distance;
  simd_float4 v4 = *(simd_float4 *)self[1]._anon_20;
  simd_float4 v5 = *(simd_float4 *)&self[1]._anon_20[16];
  result.columns[3] = v5;
  result.columns[2] = v4;
  result.columns[1] = v3;
  result.columns[0] = v2;
  return result;
}

- (__n128)setWorldTransform:(__n128)a3
{
  result[6] = a2;
  result[7] = a3;
  result[8] = a4;
  result[9] = a5;
  return result;
}

- (ARAnchor)anchor
{
  return self->_anchor;
}

- (void)setAnchor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end