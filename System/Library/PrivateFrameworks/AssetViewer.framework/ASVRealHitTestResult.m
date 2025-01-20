@interface ASVRealHitTestResult
- (ASVRealHitTestResult)initWithHitTestResult:(id)a3 imagePoint:assetPosition:cameraPosition:;
- (ASVRealHitTestResult)initWithRaycastResult:(id)a3 imagePoint:assetPosition:cameraPosition:;
- (ASVRealHitTestResult)initWithType:(__n128)a3 worldPosition:(__n128)a4 worldTransform:(__n128)a5 localPosition:(__n128)a6 imagePoint:(__n128)a7 assetPosition:(double)a8 cameraPosition:(double)a9 planeIdentifier:(uint64_t)a10 planeAlignment:(uint64_t)a11;
- (NSUUID)planeIdentifier;
- (__n128)localPosition;
- (__n128)worldTransform;
- (float)distanceFromFeaturePoint;
- (int64_t)alignment;
@end

@implementation ASVRealHitTestResult

- (ASVRealHitTestResult)initWithRaycastResult:(id)a3 imagePoint:assetPosition:cameraPosition:
{
  long long v24 = v5;
  double v25 = v4;
  double v6 = v3;
  id v8 = a3;
  unint64_t v9 = [v8 target];
  if (v9 > 2)
  {
    v16 = 0;
  }
  else
  {
    unint64_t v10 = 2 - v9;
    v11 = [v8 anchor];
    if (v11)
    {
      v12 = [v8 anchor];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        v14 = [v8 anchor];
        v11 = [v14 identifier];
        uint64_t v15 = [v14 alignment];
      }
      else
      {
        uint64_t v15 = 0;
        v11 = 0;
      }
    }
    else
    {
      uint64_t v15 = 0;
    }
    [v8 worldPosition];
    double v23 = v17;
    [v8 worldTransform];
    self = -[ASVRealHitTestResult initWithType:worldPosition:worldTransform:localPosition:imagePoint:assetPosition:cameraPosition:planeIdentifier:planeAlignment:](self, "initWithType:worldPosition:worldTransform:localPosition:imagePoint:assetPosition:cameraPosition:planeIdentifier:planeAlignment:", v10, v11, v15, v23, v18, v19, v20, v21, 0.0, v6, v25, v24);

    v16 = self;
  }

  return v16;
}

- (ASVRealHitTestResult)initWithHitTestResult:(id)a3 imagePoint:assetPosition:cameraPosition:
{
  long long v29 = v5;
  double v30 = v4;
  double v6 = v3;
  id v8 = a3;
  uint64_t v9 = [v8 type];
  switch(v9)
  {
    case 2:
      uint64_t v10 = 0;
      break;
    case 32:
      uint64_t v10 = 2;
      break;
    case 16:
      uint64_t v10 = 1;
      break;
    default:
      v16 = 0;
      goto LABEL_14;
  }
  v11 = [v8 anchor];
  if (v11)
  {
    v12 = [v8 anchor];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v14 = [v8 anchor];
      v11 = [v14 identifier];
      uint64_t v15 = [v14 alignment];
    }
    else
    {
      uint64_t v15 = 0;
      v11 = 0;
    }
  }
  else
  {
    uint64_t v15 = 0;
  }
  [v8 worldPosition];
  double v28 = v17;
  [v8 worldTransform];
  double v26 = v19;
  double v27 = v18;
  double v24 = v21;
  double v25 = v20;
  [v8 localPosition];
  self = -[ASVRealHitTestResult initWithType:worldPosition:worldTransform:localPosition:imagePoint:assetPosition:cameraPosition:planeIdentifier:planeAlignment:](self, "initWithType:worldPosition:worldTransform:localPosition:imagePoint:assetPosition:cameraPosition:planeIdentifier:planeAlignment:", v10, v11, v15, v28, v27, v26, v25, v24, v22, v6, v30, v29);

  v16 = self;
LABEL_14:

  return v16;
}

- (ASVRealHitTestResult)initWithType:(__n128)a3 worldPosition:(__n128)a4 worldTransform:(__n128)a5 localPosition:(__n128)a6 imagePoint:(__n128)a7 assetPosition:(double)a8 cameraPosition:(double)a9 planeIdentifier:(uint64_t)a10 planeAlignment:(uint64_t)a11
{
  id v22 = a12;
  v33.receiver = a1;
  v33.super_class = (Class)ASVRealHitTestResult;
  double v23 = [(ASVHitTestResult *)&v33 initWithType:a11 worldPosition:a2 imagePoint:a8 assetPosition:a9 cameraPosition:a14];
  double v24 = v23;
  if (v23)
  {
    *(__n128 *)&v23[1].super.super.isa = a3;
    *(__n128 *)v23[1].super._imagePoint = a4;
    *(__n128 *)v23[1].super._worldPosition = a5;
    *(__n128 *)v23[1].super._assetPosition = a6;
    *(__n128 *)v23->_localPosition = a7;
    objc_storeStrong((id *)&v23->_planeIdentifier, a12);
    v24->_alignment = a13;
  }

  return v24;
}

- (float)distanceFromFeaturePoint
{
  [(ASVRealHitTestResult *)self localPosition];
  float32x4_t v3 = vmulq_f32(v2, v2);
  return sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v3, 2), vaddq_f32(v3, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v3.f32, 1))).f32[0]);
}

- (NSUUID)planeIdentifier
{
  return self->_planeIdentifier;
}

- (int64_t)alignment
{
  return self->_alignment;
}

- (__n128)worldTransform
{
  return a1[9];
}

- (__n128)localPosition
{
  return a1[8];
}

- (void).cxx_destruct
{
}

@end