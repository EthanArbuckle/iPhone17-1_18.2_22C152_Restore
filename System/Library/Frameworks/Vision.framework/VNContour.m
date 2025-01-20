@interface VNContour
- (BOOL)isEqual:(id)a3;
- (CGPath)normalizedPathInTopLeftOrigin:(BOOL)a3 orientation:(unsigned int)a4;
- (CGPathRef)normalizedPath;
- (NSArray)childContours;
- (NSIndexPath)indexPath;
- (NSInteger)childContourCount;
- (NSInteger)pointCount;
- (VNContour)childContourAtIndex:(NSUInteger)childContourIndex error:(NSError *)error;
- (VNContour)initWithPoints:(const void *)a3 topLevelIndex:(unint64_t)a4 indexPath:(id)a5 aspectRatio:(float)a6;
- (VNContour)polygonApproximationWithEpsilon:(float)epsilon error:(NSError *)error;
- (const)normalizedPoints;
- (float)aspectRatio;
- (float)aspectRatioInOrientation:(unsigned int)a3;
- (id).cxx_construct;
- (id)debugQuickLookObject;
- (id)initWithObservation:(void *)a3 topLevelIndex:(void *)a4 indexPath:(float)a5 aspectRatio:;
- (uint64_t)normalizedPointsInTopLeftOrigin:(unsigned int)a3 orientation:(uint64_t)a4;
- (unint64_t)hash;
- (unint64_t)requestRevision;
- (unint64_t)topLevelIndex;
- (void)createNormalizedPointsCorrectedForAspectRatio;
- (void)dealloc;
@end

@implementation VNContour

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  *((void *)self + 4) = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexPath, 0);
  v3 = *(void **)self->_anon_10;
  if (v3)
  {
    *(void *)&self->_anon_10[8] = v3;
    operator delete(v3);
  }

  objc_storeStrong((id *)&self->_observation, 0);
}

- (float)aspectRatio
{
  return self->_aspectRatio;
}

- (unint64_t)topLevelIndex
{
  return self->_topLevelIndex;
}

- (id)debugQuickLookObject
{
  [(VNContour *)self aspectRatio];
  double v4 = v3 * 1000.0;
  v5 = [(VNContour *)self normalizedPath];

  return VNDebugPathFromNormalizedCGPath((uint64_t)v5, 1000.0, v4);
}

- (unint64_t)requestRevision
{
  unint64_t result = (unint64_t)self->_observation;
  if (result) {
    return [(id)result requestRevision];
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (VNContour *)a3;
  if (self == v4)
  {
    BOOL v22 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      unint64_t v6 = [(VNContour *)self requestRevision];
      if (v6 == [(VNContour *)v5 requestRevision])
      {
        v7 = [(VNContour *)self indexPath];
        v8 = [(VNContour *)v5 indexPath];
        char v9 = [v7 isEqual:v8];

        if (v9)
        {
          NSInteger v10 = [(VNContour *)self pointCount];
          if (v10 == [(VNContour *)v5 pointCount])
          {
            v11 = self;
            v12 = [(VNContour *)v11 normalizedPoints];
            v13 = v5;
            v14 = [(VNContour *)v13 normalizedPoints];
            if (v10)
            {
              uint64_t v15 = 8 * v10;
              float32x2_t v16 = (float32x2_t)vdup_n_s32(0x358637BDu);
              while (1)
              {
                int8x8_t v17 = vmvn_s8((int8x8_t)vcge_f32(v16, vabd_f32(*v12, *v14)));
                if ((v17.i32[0] | v17.i32[1])) {
                  break;
                }
                ++v12;
                ++v14;
                v15 -= 8;
                if (!v15) {
                  goto LABEL_10;
                }
              }
            }
            else
            {
LABEL_10:
              uint64_t v18 = [(VNContour *)v11 childContourCount];
              if (v18 == [(VNContour *)v13 childContourCount])
              {
                [(VNContour *)v11 aspectRatio];
                float v20 = v19;
                [(VNContour *)v13 aspectRatio];
                BOOL v22 = v20 == v21;
LABEL_15:

                goto LABEL_16;
              }
            }
          }
        }
      }
      BOOL v22 = 0;
      goto LABEL_15;
    }
    BOOL v22 = 0;
  }
LABEL_16:

  return v22;
}

- (unint64_t)hash
{
  v17.receiver = self;
  v17.super_class = (Class)VNContour;
  id v3 = [(VNContour *)&v17 hash];
  unint64_t v4 = [(VNContour *)self requestRevision];
  v5 = [(VNContour *)self indexPath];
  uint64_t v6 = [v5 hash] ^ __ROR8__(v4 ^ __ROR8__(v3, 51), 51);

  unint64_t v7 = [(VNContour *)self topLevelIndex] ^ __ROR8__(v6, 51);
  v8 = self;
  char v9 = [(VNContour *)v8 normalizedPoints];
  uint64_t v10 = [(VNContour *)v8 pointCount];
  if (v10)
  {
    uint64_t v11 = 2 * v10;
    if ((unint64_t)(2 * v10) <= 1) {
      uint64_t v11 = 1;
    }
    do
    {
      unsigned __int32 v12 = v9->i32[0];
      char v9 = (const simd_float2 *)((char *)v9 + 4);
      unint64_t v7 = v12 ^ __ROR8__(v7, 51);
      --v11;
    }
    while (v11);
  }
  v13 = [(VNContoursObservation *)v8->_observation childContourIndicesAtIndex:v8->_topLevelIndex];
  for (i = *v13; i != v13[1]; ++i)
  {
    unsigned int v15 = *i;
    unint64_t v7 = v15 ^ __ROR8__(v7, 51);
  }
  return v7;
}

- (CGPathRef)normalizedPath
{
  p_pathLock = &self->_pathLock;
  os_unfair_lock_lock(&self->_pathLock);
  if (!self->_normalizedPath)
  {
    observation = self->_observation;
    if (observation)
    {
      v5 = [(VNContoursObservation *)observation polygonList];
      var2 = v5->var2;
      unint64_t topLevelIndex = self->_topLevelIndex;
      apple::vision::libraries::autotrace::ContourToPath::ContourToPath((apple::vision::libraries::autotrace::ContourToPath *)v21, v8);
      if (apple::vision::libraries::autotrace::ContourToPath::autoTrace((apple::vision::libraries::autotrace::ContourToPath *)v21, (const apple::vision::libraries::autotrace::EPolygonList *)v5, (const apple::vision::libraries::autotrace::EPolygon *)((char *)var2 + 40 * topLevelIndex), v9, v10, v11, v12, v13))
      {
        Mutable = v22;
        BOOL v22 = 0;
      }
      else
      {
        Mutable = 0;
      }
      apple::vision::libraries::autotrace::ContourToPath::~ContourToPath(v21);
    }
    else
    {
      Mutable = CGPathCreateMutable();
      unint64_t v15 = [(VNContour *)self pointCount];
      if (v15)
      {
        float32x2_t v16 = [(VNContour *)self normalizedPoints];
        objc_super v17 = v16;
        if (v16)
        {
          CGPathMoveToPoint(Mutable, 0, COERCE_FLOAT(*v16), COERCE_FLOAT(HIDWORD(*(unint64_t *)v16)));
          if (v15 >= 2)
          {
            unint64_t v18 = v15 - 1;
            float v19 = v17 + 1;
            do
            {
              CGPathAddLineToPoint(Mutable, 0, COERCE_FLOAT(*v19), COERCE_FLOAT(HIDWORD(*(unint64_t *)v19)));
              ++v19;
              --v18;
            }
            while (v18);
          }
        }
      }
    }
    self->_normalizedPath = Mutable;
  }
  os_unfair_lock_unlock(p_pathLock);
  return self->_normalizedPath;
}

- (VNContour)polygonApproximationWithEpsilon:(float)epsilon error:(NSError *)error
{
  uint64_t v7 = [(VNContour *)self pointCount];
  if (v7 <= 1)
  {
    if (error)
    {
      +[VNError errorForInvalidArgumentWithLocalizedDescription:@"The contour is too small for polygon approximation"];
      float v8 = 0;
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
    goto LABEL_11;
  }
  if (epsilon <= 0.0)
  {
    if (error)
    {
      float v21 = objc_msgSend(NSString, "stringWithFormat:", @"The value for epsilon is invalid. It needs to be bigger than zero but it is %f", epsilon);
      *error = +[VNError errorForInvalidArgumentWithLocalizedDescription:v21];
    }
LABEL_11:
    float v8 = 0;
    goto LABEL_17;
  }
  unint64_t v9 = v7;
  [(VNContour *)self aspectRatio];
  float v11 = v10;
  uint64_t v12 = -[VNContour createNormalizedPointsCorrectedForAspectRatio](self);
  if (v9 >> 61) {
    std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v13 = v12;
  v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v9);
  v29[0] = v14;
  v29[2] = &v14[8 * v15];
  memmove(v14, v13, 8 * v9);
  v29[1] = &v14[8 * v9];
  __p = 0;
  v27 = 0;
  uint64_t v28 = 0;
  RamerDouglasPeucker((uint64_t)v29, &__p, epsilon, v16, v17, v18);
  float v19 = (float *)__p;
  float v20 = v27;
  while (v19 != v20)
  {
    v19[1] = v11 * v19[1];
    v19 += 2;
  }
  BOOL v22 = [VNContour alloc];
  v23 = [MEMORY[0x1E4F28D58] indexPathWithIndex:0];
  [(VNContour *)self aspectRatio];
  v24 = -[VNContour initWithPoints:topLevelIndex:indexPath:aspectRatio:](v22, "initWithPoints:topLevelIndex:indexPath:aspectRatio:", &__p, 0, v23);

  free(v13);
  float v8 = v24;
  if (__p)
  {
    v27 = (float *)__p;
    operator delete(__p);
  }
  if (v14) {
    operator delete(v14);
  }

LABEL_17:

  return v8;
}

- (void)createNormalizedPointsCorrectedForAspectRatio
{
  if (!a1) {
    return 0;
  }
  uint64_t v2 = [a1 pointCount];
  id v3 = malloc_type_malloc(8 * v2, 0x100004000313F17uLL);
  id v4 = a1;
  uint64_t v5 = [v4 normalizedPoints];
  [v4 aspectRatio];
  if (v3 && v2 >= 1)
  {
    for (uint64_t i = 0; i != v2; ++i)
    {
      LODWORD(v8) = HIDWORD(*(void *)(v5 + 8 * i));
      objc_msgSend(v4, "aspectRatio", *(void *)(v5 + 8 * i), v6);
      LODWORD(v9) = v12;
      *((float *)&v9 + 1) = v8 / v10;
      v3[i] = v9;
    }
  }
  return v3;
}

- (const)normalizedPoints
{
  observation = self->_observation;
  if (observation) {
    anon_10 = (unsigned __int8 *)((void)[(VNContoursObservation *)observation polygonList][8]
  }
                                + 40 * self->_topLevelIndex
                                + 8);
  else {
    anon_10 = self->_anon_10;
  }
  return *(const simd_float2 **)anon_10;
}

- (NSInteger)pointCount
{
  observation = self->_observation;
  if (observation) {
    return *(int *)((void)[(VNContoursObservation *)observation polygonList][8]
  }
                  + 40 * self->_topLevelIndex);
  else {
    return (uint64_t)(*(void *)&self->_anon_10[8] - *(void *)self->_anon_10) >> 3;
  }
}

- (VNContour)childContourAtIndex:(NSUInteger)childContourIndex error:(NSError *)error
{
  uint64_t v7 = [(VNContoursObservation *)self->_observation childContourIndicesAtIndex:self->_topLevelIndex];
  if (childContourIndex < (uint64_t)(v7[1] - *v7) >> 2)
  {
    float v8 = v7;
    uint64_t v9 = [(VNContour *)self indexPath];
    float v10 = [v9 indexPathByAddingIndex:childContourIndex];

    float v11 = -[VNContour initWithObservation:topLevelIndex:indexPath:aspectRatio:]((id *)[VNContour alloc], self->_observation, (void *)*(unsigned int *)(*v8 + 4 * childContourIndex), v10, self->_aspectRatio);
LABEL_5:

    goto LABEL_6;
  }
  if (error)
  {
    float v10 = [NSNumber numberWithUnsignedInteger:childContourIndex];
    +[VNError errorForInvalidArgument:v10 named:@"childIndex"];
    float v11 = 0;
    *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  float v11 = 0;
LABEL_6:

  return (VNContour *)v11;
}

- (id)initWithObservation:(void *)a3 topLevelIndex:(void *)a4 indexPath:(float)a5 aspectRatio:
{
  id v10 = a2;
  id v11 = a4;
  if (a1)
  {
    v14.receiver = a1;
    v14.super_class = (Class)VNContour;
    int v12 = (id *)objc_msgSendSuper2(&v14, sel_init);
    a1 = v12;
    if (v12)
    {
      objc_storeStrong(v12 + 1, a2);
      a1[5] = a3;
      objc_storeStrong(a1 + 9, a4);
      *((_DWORD *)a1 + 12) = 0;
      *((float *)a1 + 16) = a5;
    }
  }

  return a1;
}

- (NSArray)childContours
{
  if (self->_observation)
  {
    id v3 = (void *)MEMORY[0x1A6257080]();
    id v4 = [(VNContoursObservation *)self->_observation childContourIndicesAtIndex:self->_topLevelIndex];
    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:(uint64_t)(v4[1] - *v4) >> 2];
    uint64_t v6 = [(VNContour *)self indexPath];
    uint64_t v7 = v4[1] - *v4;
    if (v7)
    {
      uint64_t v8 = 0;
      unint64_t v9 = v7 >> 2;
      if (v9 <= 1) {
        uint64_t v10 = 1;
      }
      else {
        uint64_t v10 = v9;
      }
      do
      {
        id v11 = [v6 indexPathByAddingIndex:v8];
        int v12 = -[VNContour initWithObservation:topLevelIndex:indexPath:aspectRatio:]((id *)[VNContour alloc], self->_observation, (void *)*(unsigned int *)(*v4 + 4 * v8), v11, self->_aspectRatio);
        [v5 addObject:v12];

        ++v8;
      }
      while (v10 != v8);
    }
  }
  else
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return (NSArray *)v5;
}

- (NSInteger)childContourCount
{
  NSInteger result = (NSInteger)self->_observation;
  if (result)
  {
    id v4 = (void *)[(id)result childContourIndicesAtIndex:self->_topLevelIndex];
    return (uint64_t)(v4[1] - *v4) >> 2;
  }
  return result;
}

- (NSIndexPath)indexPath
{
  return self->_indexPath;
}

- (void)dealloc
{
  CGPathRelease(self->_normalizedPath);
  v3.receiver = self;
  v3.super_class = (Class)VNContour;
  [(VNContour *)&v3 dealloc];
}

- (VNContour)initWithPoints:(const void *)a3 topLevelIndex:(unint64_t)a4 indexPath:(id)a5 aspectRatio:(float)a6
{
  id v11 = a5;
  v31.receiver = self;
  v31.super_class = (Class)VNContour;
  int v12 = [(VNContour *)&v31 init];
  uint64_t v13 = v12;
  if (v12)
  {
    objc_super v14 = v12 + 16;
    if (v12 + 16 == a3)
    {
LABEL_22:
      *((void *)v13 + 5) = a4;
      objc_storeStrong((id *)v13 + 9, a5);
      *((_DWORD *)v13 + 12) = 0;
      *((float *)v13 + 16) = a6;
      goto LABEL_23;
    }
    uint64_t v15 = *(char **)a3;
    double v16 = (char *)*((void *)a3 + 1);
    int64_t v17 = (int64_t)&v16[-*(void *)a3];
    unint64_t v18 = v17 >> 3;
    uint64_t v19 = *((void *)v12 + 4);
    float v20 = (char *)*((void *)v12 + 2);
    if (v17 >> 3 <= (unint64_t)((v19 - (uint64_t)v20) >> 3))
    {
      unint64_t v23 = a4;
      v24 = (void **)(v12 + 24);
      v25 = (unsigned char *)*((void *)v12 + 3);
      unint64_t v26 = (v25 - v20) >> 3;
      if (v26 < v18)
      {
        v27 = &v15[8 * v26];
        if (v25 != v20)
        {
          memmove(*((void **)v12 + 2), v15, v25 - v20);
          float v20 = (char *)*v24;
        }
        int64_t v17 = v16 - v27;
        if (v16 == v27) {
          goto LABEL_21;
        }
        uint64_t v28 = v20;
        v29 = v27;
        goto LABEL_20;
      }
    }
    else
    {
      if (v20)
      {
        *((void *)v12 + 3) = v20;
        operator delete(v20);
        uint64_t v19 = 0;
        void *v14 = 0;
        *((void *)v13 + 3) = 0;
        *((void *)v13 + 4) = 0;
      }
      if (v17 < 0) {
        std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v21 = v19 >> 2;
      if (v19 >> 2 <= v18) {
        uint64_t v21 = v17 >> 3;
      }
      if ((unint64_t)v19 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v22 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v22 = v21;
      }
      std::vector<long long>::__vallocate[abi:ne180100]((void *)v13 + 2, v22);
      unint64_t v23 = a4;
      v24 = (void **)(v13 + 24);
      float v20 = (char *)*((void *)v13 + 3);
    }
    if (v16 == v15)
    {
LABEL_21:
      VNContour *v24 = &v20[v17];
      a4 = v23;
      goto LABEL_22;
    }
    uint64_t v28 = v20;
    v29 = v15;
LABEL_20:
    memmove(v28, v29, v17);
    goto LABEL_21;
  }
LABEL_23:

  return (VNContour *)v13;
}

- (float)aspectRatioInOrientation:(unsigned int)a3
{
  [(VNContour *)self aspectRatio];
  if (result != 0.0 && a3 <= 7 && ((1 << a3) & 0xB4) != 0) {
    return 1.0 / result;
  }
  return result;
}

- (CGPath)normalizedPathInTopLeftOrigin:(BOOL)a3 orientation:(unsigned int)a4
{
  memset(v7, 0, sizeof(v7));
  VNAffineTransformForVisionToTopLeftOriginOrientation(a3, a4, (uint64_t)v7);
  uint64_t v5 = (const void *)MEMORY[0x1A62553C0]([(VNContour *)self normalizedPath], v7);
  CFAutorelease(v5);
  return (CGPath *)v5;
}

- (uint64_t)normalizedPointsInTopLeftOrigin:(unsigned int)a3 orientation:(uint64_t)a4
{
  int v4 = a4;
  if (a4 - 2) < 7 || (a3)
  {
    unint64_t v9 = objc_msgSend([NSString alloc], "initWithFormat:", @"%d_%d", a4, a3);
    id v10 = a1;
    objc_sync_enter(v10);
    objc_getAssociatedObject(v10, (const void *)-[VNContour(OrientationAdditions) normalizedPointsInTopLeftOrigin:orientation:]::kNormalizedPointsDictionaryAssociatedObjectKey);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      objc_setAssociatedObject(v10, (const void *)-[VNContour(OrientationAdditions) normalizedPointsInTopLeftOrigin:orientation:]::kNormalizedPointsDictionaryAssociatedObjectKey, v11, (void *)1);
    }
    int v12 = [v11 objectForKey:v9];
    if (!v12)
    {
      uint64_t v13 = (void *)MEMORY[0x1A6257080]();
      uint64_t v14 = [v10 pointCount];
      id v15 = (id) [objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:8 * v14];
      double v16 = (float32x2_t *)[v15 mutableBytes];
      float64x2_t v25 = 0u;
      float64x2_t v26 = 0u;
      float64x2_t v24 = 0u;
      VNAffineTransformForVisionToTopLeftOriginOrientation(a3, v4, (uint64_t)&v24);
      int64_t v17 = (uint64_t *)[v10 normalizedPoints];
      if (v14)
      {
        float64x2_t v18 = v24;
        float64x2_t v19 = v25;
        float64x2_t v20 = v26;
        do
        {
          uint64_t v21 = *v17++;
          *v16++ = vcvt_f32_f64(vaddq_f64(v20, vmlaq_n_f64(vmulq_n_f64(v19, *(float *)&v21), v18, *(float *)&v21)));
          --v14;
        }
        while (v14);
      }
      int v12 = (void *)[v15 copy];
      [v11 setObject:v12 forKey:v9];
    }
    id v22 = v12;
    uint64_t v23 = [v22 bytes];

    objc_sync_exit(v10);
    return v23;
  }
  else
  {
    id v7 = a1;
    return [v7 normalizedPoints];
  }
}

@end