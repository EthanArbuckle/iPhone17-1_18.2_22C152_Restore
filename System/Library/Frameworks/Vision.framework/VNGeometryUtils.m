@interface VNGeometryUtils
+ (BOOL)calculateArea:(double *)area forContour:(VNContour *)contour orientedArea:(BOOL)orientedArea error:(NSError *)error;
+ (BOOL)calculatePerimeter:(double *)perimeter forContour:(VNContour *)contour error:(NSError *)error;
+ (VNCircle)boundingCircleForContour:(VNContour *)contour error:(NSError *)error;
+ (VNCircle)boundingCircleForPoints:(NSArray *)points error:(NSError *)error;
+ (VNCircle)boundingCircleForSIMDPoints:(const simd_float2 *)points pointCount:(NSInteger)pointCount error:(NSError *)error;
@end

@implementation VNGeometryUtils

+ (BOOL)calculatePerimeter:(double *)perimeter forContour:(VNContour *)contour error:(NSError *)error
{
  v7 = contour;
  self;
  v8 = -[VNContour createNormalizedPointsCorrectedForAspectRatio](v7);
  if (v8)
  {
    v9 = v7;
    v10 = [(VNContour *)v9 normalizedPoints];
    uint64_t v11 = [(VNContour *)v9 pointCount];
    self;
    if (perimeter)
    {
      if (v10)
      {
        if (v11 > 0)
        {
          if (v11 == 1)
          {
            *perimeter = 0.0;
          }
          else
          {
            simd_float2 v15 = *v10;
            v16 = [[VNPoint alloc] initWithX:v15.f32[0] y:v15.f32[1]];
            double v17 = 0.0;
            for (uint64_t i = 1; i != v11; ++i)
            {
              simd_float2 v19 = v10[i];
              v20 = [[VNPoint alloc] initWithX:v19.f32[0] y:v19.f32[1]];
              [(VNPoint *)v16 distanceToPoint:v20];
              double v17 = v17 + v21;

              v16 = v20;
            }
            v22 = [[VNPoint alloc] initWithX:COERCE_FLOAT(*v10) y:COERCE_FLOAT(HIDWORD(*(unint64_t *)v10))];
            simd_float2 v23 = v10[v11 - 1];
            v24 = [[VNPoint alloc] initWithX:v23.f32[0] y:v23.f32[1]];
            [(VNPoint *)v22 distanceToPoint:v24];
            double v26 = v25;

            *perimeter = v17 + v26;
          }
          BOOL v12 = 1;
          goto LABEL_22;
        }
        if (error)
        {
          v14 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid points count %ld", v11);
          *error = +[VNError errorForInvalidArgumentWithLocalizedDescription:v14];
        }
        goto LABEL_17;
      }
      if (error)
      {
        v13 = +[VNError errorForInvalidArgumentWithLocalizedDescription:@"null points array"];
        goto LABEL_13;
      }
    }
    else if (error)
    {
      v13 = +[VNError errorForInvalidArgumentWithLocalizedDescription:@"null perimeter pointer"];
LABEL_13:
      BOOL v12 = 0;
      *error = (NSError *)v13;
LABEL_22:
      free(v8);
      goto LABEL_23;
    }
LABEL_17:
    BOOL v12 = 0;
    goto LABEL_22;
  }
  if (error)
  {
    +[VNError errorForInvalidArgumentWithLocalizedDescription:@"Invalid contour passed in"];
    BOOL v12 = 0;
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v12 = 0;
  }
LABEL_23:

  return v12;
}

+ (BOOL)calculateArea:(double *)area forContour:(VNContour *)contour orientedArea:(BOOL)orientedArea error:(NSError *)error
{
  BOOL v7 = orientedArea;
  v9 = contour;
  self;
  v10 = -[VNContour createNormalizedPointsCorrectedForAspectRatio](v9);
  if (v10)
  {
    uint64_t v11 = [(VNContour *)v9 pointCount];
    self;
    if (area)
    {
      if (v11 > 0)
      {
        uint64_t v12 = v10[v11 - 1];
        double v13 = 0.0;
        v14 = v10;
        do
        {
          uint64_t v15 = *v14++;
          double v13 = v13 + vmlas_n_f32((float)-*((float *)&v12 + 1) * *(float *)&v15, *((float *)&v15 + 1), *(float *)&v12);
          uint64_t v12 = v15;
          --v11;
        }
        while (v11);
        double v16 = v13 * 0.5;
        double v17 = fabs(v16);
        if (!v7) {
          double v16 = v17;
        }
        *area = v16;
        BOOL v18 = 1;
        goto LABEL_16;
      }
      if (error)
      {
        simd_float2 v19 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid points count %ld", v11);
        *error = +[VNError errorForInvalidArgumentWithLocalizedDescription:v19];
      }
    }
    else if (error)
    {
      +[VNError errorForInvalidArgumentWithLocalizedDescription:@"null area pointer"];
      BOOL v18 = 0;
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
LABEL_16:
      free(v10);
      goto LABEL_17;
    }
    BOOL v18 = 0;
    goto LABEL_16;
  }
  if (error)
  {
    +[VNError errorForInvalidArgumentWithLocalizedDescription:@"Invalid contour passed in"];
    BOOL v18 = 0;
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v18 = 0;
  }
LABEL_17:

  return v18;
}

+ (VNCircle)boundingCircleForSIMDPoints:(const simd_float2 *)points pointCount:(NSInteger)pointCount error:(NSError *)error
{
  self;

  return (VNCircle *)+[VNBoundingCircleAlgorithm boundingCircleForSIMDPoints:pointCount:aspectRatioForCentroid:error:](1.0, (uint64_t)VNBoundingCircleAlgorithm, (float32x2_t *)points, pointCount, error);
}

+ (VNCircle)boundingCircleForPoints:(NSArray *)points error:(NSError *)error
{
  v5 = points;
  self;
  if ([(NSArray *)v5 count])
  {
    v6 = v5;
    self;
    unint64_t v7 = [(NSArray *)v6 count];
    long long v22 = 0uLL;
    std::vector<CGPoint>::vector(&__p, v7, &v22);
    if (v7)
    {
      uint64_t v8 = 0;
      for (uint64_t i = 0; i != v7; ++i)
      {
        v10 = [(NSArray *)v6 objectAtIndexedSubscript:i];
        [v10 location];
        uint64_t v11 = (char *)__p + v8;
        *uint64_t v11 = v12;
        v11[1] = v13;

        v8 += 16;
      }
    }
    unsigned int rep = std::chrono::system_clock::now().__d_.__rep_;
    unsigned int v15 = rep + ((rep / 0x7FFFFFFF) | ((rep / 0x7FFFFFFF) << 31));
    if (v15 <= 1) {
      unsigned int v15 = 1;
    }
    LODWORD(v22) = v15;
    std::__shuffle[abi:ne180100]<std::_ClassicAlgPolicy,std::__wrap_iter<CGPoint *>,std::__wrap_iter<CGPoint *>,std::linear_congruential_engine<unsigned int,48271u,0u,2147483647u>>((unint64_t)__p, (uint64_t)v21, (uint64_t)&v22);

    double v16 = +[VNBoundingCircleAlgorithm _boundingCircleForPoints:aspectRatioForCentroid:](1.0, (uint64_t)VNBoundingCircleAlgorithm, (double **)&__p);
    double v17 = v16;
    if (v16)
    {
      id v18 = v16;
    }
    else if (error)
    {
      *error = +[VNError errorForInternalErrorWithLocalizedDescription:@"Cannot calculate minimum enclosing circle for the given set of points"];
    }

    if (__p)
    {
      double v21 = __p;
      operator delete(__p);
    }
  }
  else if (error)
  {
    +[VNError errorForInvalidArgumentWithLocalizedDescription:@"Invalid number of points passed for minimum enclosing circle calculation"];
    double v17 = 0;
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    double v17 = 0;
  }

  return (VNCircle *)v17;
}

+ (VNCircle)boundingCircleForContour:(VNContour *)contour error:(NSError *)error
{
  v5 = contour;
  v6 = (float32x2_t *)-[VNContour createNormalizedPointsCorrectedForAspectRatio](v5);
  if (v6)
  {
    int64_t v7 = [(VNContour *)v5 pointCount];
    [(VNContour *)v5 aspectRatio];
    float v9 = v8;
    self;
    v10 = +[VNBoundingCircleAlgorithm boundingCircleForSIMDPoints:pointCount:aspectRatioForCentroid:error:](v9, (uint64_t)VNBoundingCircleAlgorithm, v6, v7, error);
    free(v6);
  }
  else if (error)
  {
    +[VNError errorForInvalidArgumentWithLocalizedDescription:@"Invalid contour passed in"];
    v10 = 0;
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return (VNCircle *)v10;
}

@end