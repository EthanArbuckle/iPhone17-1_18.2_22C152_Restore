@interface ARObjectDetectionResult
- (ARReferenceObject)referenceObject;
- (BOOL)isEqual:(id)a3;
- (__n128)setVisionTransform:(__n128)a3;
- (__n128)visionTransform;
- (void)setReferenceObject:(id)a3;
@end

@implementation ARObjectDetectionResult

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(ARObjectDetectionResult *)self referenceObject];
    v7 = [v5 referenceObject];
    if ([v6 isEqual:v7])
    {
      [v5 visionTransform];
      float32x4_t v20 = v9;
      float32x4_t v21 = v8;
      float32x4_t v18 = v11;
      float32x4_t v19 = v10;
      [(ARObjectDetectionResult *)self visionTransform];
      char v16 = AREqualTransforms(v21, v20, v19, v18, v12, v13, v14, v15);
    }
    else
    {
      char v16 = 0;
    }
  }
  else
  {
    char v16 = 0;
  }

  return v16;
}

- (__n128)visionTransform
{
  return a1[1];
}

- (__n128)setVisionTransform:(__n128)a3
{
  result[1] = a2;
  result[2] = a3;
  result[3] = a4;
  result[4] = a5;
  return result;
}

- (ARReferenceObject)referenceObject
{
  return self->_referenceObject;
}

- (void)setReferenceObject:(id)a3
{
}

- (void).cxx_destruct
{
}

@end