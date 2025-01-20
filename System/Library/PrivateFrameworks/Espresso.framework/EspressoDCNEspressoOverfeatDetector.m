@interface EspressoDCNEspressoOverfeatDetector
- (EspressoDCNEspressoOverfeatDetector)init;
- (EspressoDCNEspressoOverfeatDetector)initWithNetwork:(id)a3;
- (EspressoDCNEspressoOverfeatDetector)initWithOptions:(id)a3;
- (EspressoFDOverfeatNetwork)enet;
- (double)compareObject:(id)a3 withObject:(id)a4 error:(id *)a5;
- (double)confidenceThreshold;
- (double)minBoundingBoxThreshold;
- (id)getDescription;
- (id)getFacesFromNetworkResultOriginalWidth:(float)a3 originalHeight:(float)a4;
- (void)commonInit;
- (void)computeBBoxUsingProb:()shared_ptr<Espresso:(3>>)a3 :()shared_ptr<Espresso:(3>>)a4 :(float)a5 blob<float blob<float box:(float)a6 andScalefactor:(float)a7 padX:padY:;
- (void)dealloc;
- (void)fillFaceList;
- (void)mergeFaceList;
- (void)setConfidenceThreshold:(double)a3;
- (void)setEnet:(id)a3;
- (void)setMinBoundingBoxThreshold:(double)a3;
@end

@implementation EspressoDCNEspressoOverfeatDetector

- (void).cxx_destruct
{
}

- (void)setMinBoundingBoxThreshold:(double)a3
{
  self->_minBoundingBoxThreshold = a3;
}

- (double)minBoundingBoxThreshold
{
  return self->_minBoundingBoxThreshold;
}

- (void)setConfidenceThreshold:(double)a3
{
  self->_confidenceThreshold = a3;
}

- (double)confidenceThreshold
{
  return self->_confidenceThreshold;
}

- (void)setEnet:(id)a3
{
}

- (EspressoFDOverfeatNetwork)enet
{
  return self->_enet;
}

- (void)dealloc
{
  face_list = self->face_list;
  if (face_list)
  {
    std::__list_imp<int>::clear((void *)self->face_list);
    MEMORY[0x192FF16B0](face_list, 0x1020C4062D53EE8);
  }
  self->face_list = 0;
  v4.receiver = self;
  v4.super_class = (Class)EspressoDCNEspressoOverfeatDetector;
  [(EspressoDCNEspressoOverfeatDetector *)&v4 dealloc];
}

- (id)getDescription
{
  return @"DCNEspressoOverfeatDetector";
}

- (double)compareObject:(id)a3 withObject:(id)a4 error:(id *)a5
{
  if (*a5) {
    *a5 = 0;
  }
  return 1.79769313e308;
}

- (void)commonInit
{
  *(_OWORD *)&self->_confidenceThreshold = xmmword_192DCA5C0;
  *(void *)&self->tileSizeScaleFactor = 0x1C00000020;
  self->localFaceMerging = 1;
  operator new();
}

- (EspressoDCNEspressoOverfeatDetector)initWithNetwork:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)EspressoDCNEspressoOverfeatDetector;
  v6 = [(EspressoDCNEspressoOverfeatDetector *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_enet, a3);
    [(EspressoDCNEspressoOverfeatDetector *)v7 commonInit];
    v8 = v7;
  }

  return v7;
}

- (EspressoDCNEspressoOverfeatDetector)initWithOptions:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)EspressoDCNEspressoOverfeatDetector;
  id v5 = [(EspressoDCNEspressoOverfeatDetector *)&v16 init];
  v6 = v5;
  if (v5)
  {
    [(EspressoDCNEspressoOverfeatDetector *)v5 commonInit];
    v7 = [v4 objectForKey:@"Tile Dimension"];
    v6->tileDimension = [v7 unsignedIntValue];

    v8 = [v4 objectForKey:@"Confidence Threshold"];
    [v8 floatValue];
    v6->_confidenceThreshold = v9;

    objc_super v10 = [v4 objectForKey:@"Pre training tile crop size"];
    [v10 floatValue];
    v6->tileSizeScaleFactor = (int)v11;

    v12 = [v4 objectForKey:@"Mininum bounding box threshold"];
    [v12 floatValue];
    v6->_minBoundingBoxThreshold = v13;

    v14 = v6;
  }

  return v6;
}

- (EspressoDCNEspressoOverfeatDetector)init
{
  v6.receiver = self;
  v6.super_class = (Class)EspressoDCNEspressoOverfeatDetector;
  v2 = [(EspressoDCNEspressoOverfeatDetector *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(EspressoDCNEspressoOverfeatDetector *)v2 commonInit];
    id v4 = v3;
  }

  return v3;
}

- (void)mergeFaceList
{
  face_list = (uint64_t *)self->face_list;
  uint64_t v8 = face_list[1];
  if ((uint64_t *)v8 != face_list)
  {
    while (1)
    {
      float v9 = 0;
      objc_super v10 = 0;
      uint64_t v11 = v8;
      float v12 = 1.0e12;
      do
      {
        uint64_t v13 = *(void *)(v11 + 8);
        if ((uint64_t *)v13 == face_list) {
          break;
        }
        float v14 = *(float *)(v11 + 16);
        float v15 = *(float *)(v11 + 20);
        float v16 = *(float *)(v11 + 24);
        do
        {
          float v18 = *(float *)(v13 + 20);
          LODWORD(v31) = *(_DWORD *)(v13 + 16);
          float v17 = *(float *)&v31;
          *((float *)&v31 + 1) = v18;
          v2.n128_u64[0] = *(void *)(v13 + 24);
          __n128 v30 = v2;
          *((void *)&v31 + 1) = v2.n128_u64[0];
          v2.n128_f32[0] = vision::DCN::boundingbox::calculate_overlap((float *)(v11 + 16), (float *)&v31);
          __n128 v5 = v30;
          v2.n128_f32[0] = v2.n128_f32[0]
                         + (float)(sqrtf((float)((float)(v15 - v18) * (float)(v15 - v18))+ (float)((float)(v14 - v17) * (float)(v14 - v17)))/ (float)(v30.n128_f32[0] + v16));
          if (v16 >= v30.n128_f32[0]) {
            float v19 = v16;
          }
          else {
            float v19 = v30.n128_f32[0];
          }
          if (v30.n128_f32[0] >= v16) {
            *(float *)&double v4 = v16;
          }
          else {
            *(float *)&double v4 = v30.n128_f32[0];
          }
          *(float *)&double v3 = v19 / *(float *)&v4;
          if (v2.n128_f32[0] < v12 && *(float *)&v3 < 3.0)
          {
            objc_super v10 = (float32x2_t *)v13;
            float v9 = (char *)v11;
            float v12 = v2.n128_f32[0];
          }
          uint64_t v13 = *(void *)(v13 + 8);
        }
        while ((uint64_t *)v13 != face_list);
        uint64_t v11 = *(void *)(v11 + 8);
      }
      while ((uint64_t *)v11 != face_list);
      v2.n128_u32[0] = 1062600704;
      if (v12 > 0.83594 || (unint64_t)face_list[2] < 2) {
        break;
      }
      __n128 v2 = vision::DCN::FaceList::merge_bounding_boxes(face_list, v9, v10, v2.n128_f64[0], v3, v4, v5);
      uint64_t v8 = face_list[1];
      if ((uint64_t *)v8 == face_list) {
        goto LABEL_26;
      }
    }
    while ((uint64_t *)v8 != face_list)
    {
      uint64_t v20 = v8;
      while (1)
      {
        uint64_t v20 = *(void *)(v20 + 8);
        if ((uint64_t *)v20 == face_list) {
          break;
        }
        long long v31 = *(_OWORD *)(v20 + 16);
        *(float *)&double v21 = vision::DCN::boundingbox::calculate_overlap((float *)(v8 + 16), (float *)&v31);
        if (*(float *)&v21 > 0.5)
        {
          vision::DCN::FaceList::merge_bounding_boxes(face_list, (char *)v8, (float32x2_t *)v20, v21, v22, v23, v24);
          uint64_t v8 = face_list[1];
          goto LABEL_25;
        }
      }
      uint64_t v8 = *(void *)(v8 + 8);
LABEL_25:
      ;
    }
  }
LABEL_26:
  v25 = (float *)self->face_list;
  v26 = (float *)*((void *)v25 + 1);
  if (v26 != v25)
  {
    float minBoundingBoxThreshold = self->_minBoundingBoxThreshold;
    do
    {
      v28 = (float *)*((void *)v26 + 1);
      if (v26[7] < minBoundingBoxThreshold)
      {
        uint64_t v29 = *(void *)v26;
        *(void *)(v29 + 8) = v28;
        **((void **)v26 + 1) = v29;
        --*((void *)v25 + 2);
        operator delete(v26);
      }
      v26 = v28;
    }
    while (v28 != v25);
  }
}

- (void)computeBBoxUsingProb:()shared_ptr<Espresso:(3>>)a3 :()shared_ptr<Espresso:(3>>)a4 :(float)a5 blob<float blob<float box:(float)a6 andScalefactor:(float)a7 padX:padY:
{
  uint64_t v7 = *(void *)a3.var0;
  if (*(void *)a3.var0)
  {
    var1 = a3.var1;
    var0 = a3.var0;
    uint64_t v33 = *(int *)(v7 + 8);
    uint64_t v34 = *(unsigned int *)(v7 + 12);
    enet = self->_enet;
    if (enet)
    {
      [(EspressoFDOverfeatNetwork *)enet strideConfiguration];
      float v12 = v39;
      uint64_t v13 = v40;
      v38[1] = 0;
      if (__p[1]) {
        operator delete(__p[1]);
      }
    }
    else
    {
      float v12 = 0;
      uint64_t v13 = 0;
      *(_OWORD *)__p = 0u;
      v41 = 0;
      *(_OWORD *)v38 = 0u;
    }
    if (v41) {
      operator delete(v41);
    }
    if (v38[1]) {
      operator delete(v38[1]);
    }
    float v14 = self->_enet;
    if (v14)
    {
      [(EspressoFDOverfeatNetwork *)v14 strideConfiguration];
      float v15 = (int *)v41;
      if (__p[1]) {
        operator delete(__p[1]);
      }
    }
    else
    {
      float v15 = 0;
      *(_OWORD *)__p = 0u;
      *(_OWORD *)v38 = 0u;
    }
    if (v38[1]) {
      operator delete(v38[1]);
    }
    float v16 = self->_enet;
    if (v16)
    {
      [(EspressoFDOverfeatNetwork *)v16 strideConfiguration];
      float v17 = __p[1];
    }
    else
    {
      float v17 = 0;
      *(_OWORD *)v38 = 0u;
    }
    if (v38[1]) {
      operator delete(v38[1]);
    }
    long long v31 = v17;
    if ((int)((unint64_t)(v13 - (void)v12) >> 2) < 1)
    {
      int v20 = 1;
    }
    else
    {
      int v18 = 0;
      uint64_t v19 = ((unint64_t)(v13 - (void)v12) >> 2);
      int v20 = 1;
      double v21 = v12;
      double v22 = (int *)v17;
      double v23 = v15;
      do
      {
        int v25 = *v21++;
        int v24 = v25;
        int v26 = *v22++;
        v18 += (v24 / 2 - v26) * v20;
        int v27 = *v23++;
        v20 *= v27;
        --v19;
      }
      while (v19);
    }
    if ((int)v34 >= 1)
    {
      uint64_t v28 = 0;
      int v35 = v34 * v33;
      uint64_t v37 = *(void *)(*(void *)var1 + 24) + 8 * (int)v34 * (int)v33;
      uint64_t v32 = 4 * v33;
      uint64_t v36 = *(void *)(*(void *)var1 + 24);
      do
      {
        if ((int)v33 >= 1)
        {
          int v29 = 0;
          uint64_t v30 = 0;
          do
          {
            if (self->_confidenceThreshold <= *(float *)(*(void *)(*(void *)var0 + 24) + 4 * v35 + v30)) {
              operator new();
            }
            v30 += 4;
            v29 += v20;
          }
          while (4 * v33 != v30);
        }
        ++v28;
        v37 += v32;
        v36 += v32;
        v35 += v33;
      }
      while (v28 != v34);
    }
    if (v31) {
      operator delete(v31);
    }
    if (v15) {
      operator delete(v15);
    }
    if (v12) {
      operator delete(v12);
    }
  }
}

- (id)getFacesFromNetworkResultOriginalWidth:(float)a3 originalHeight:(float)a4
{
  __n128 v5 = [MEMORY[0x1E4F1CA48] array];
  [(EspressoDCNEspressoOverfeatDetector *)self fillFaceList];
  Espresso::scoped_timer::scoped_timer((Espresso::scoped_timer *)v32, "mergeFaceList", v6);
  if (a3 <= a4) {
    float v7 = a4;
  }
  else {
    float v7 = a3;
  }
  [(EspressoDCNEspressoOverfeatDetector *)self mergeFaceList];
  face_list = self->face_list;
  uint64_t v9 = face_list[1];
  if ((void *)v9 != face_list)
  {
    do
    {
      float v10 = *(float *)(v9 + 16);
      [(EspressoFDOverfeatNetwork *)self->_enet maxScale];
      float v12 = v11;
      int tileDimension = self->tileDimension;
      float v14 = *(float *)(v9 + 20);
      [(EspressoFDOverfeatNetwork *)self->_enet maxScale];
      float v16 = v15;
      int v17 = self->tileDimension;
      float v18 = *(float *)(v9 + 24);
      [(EspressoFDOverfeatNetwork *)self->_enet maxScale];
      float v20 = v19;
      int v21 = self->tileDimension;
      double v22 = [EspressoFaceDetectedObject alloc];
      *(float *)&double v23 = (float)(v7 * v10) / (float)(v12 * (float)tileDimension);
      *(float *)&double v24 = (float)(v7 * v14) / (float)(v16 * (float)v17);
      float v25 = (float)(v7 * v18) / (float)(v20 * (float)v21);
      if ((float)(*(float *)&v24 + v25) > a4) {
        *(float *)&double v24 = a4 - v25;
      }
      if ((float)(*(float *)&v24 - v25) < 0.0) {
        *(float *)&double v24 = (float)(v7 * v18) / (float)(v20 * (float)v21);
      }
      if ((float)(*(float *)&v23 + v25) > a3) {
        *(float *)&double v23 = a3 - v25;
      }
      if ((float)(*(float *)&v23 - v25) < 0.0) {
        *(float *)&double v23 = (float)(v7 * v18) / (float)(v20 * (float)v21);
      }
      int v26 = -[EspressoFaceDetectedObject initWithOptionsXloc:yloc:size:confidence:](v22, "initWithOptionsXloc:yloc:size:confidence:", v23, v24);
      [v5 addObject:v26];

      uint64_t v9 = *(void *)(v9 + 8);
    }
    while ((void *)v9 != self->face_list);
  }
  int v27 = +[EspressoMetalSingleton shared];
  char v28 = objc_msgSend(v27, "is_memory_tight");

  if (v28) {
    [(EspressoFDOverfeatNetwork *)self->_enet reset];
  }
  Espresso::scoped_timer::~scoped_timer((Espresso::scoped_timer *)v32);

  return v5;
}

- (void)fillFaceList
{
  Espresso::scoped_timer::scoped_timer((Espresso::scoped_timer *)v153, "fillFaceList", v2);
  std::__list_imp<int>::clear((void *)self->face_list);
  if (!self->localFaceMerging)
  {
    [(EspressoFDOverfeatNetwork *)self->_enet maxScale];
    float v7 = v6;
    for (uint64_t i = 0; ; ++i)
    {
      if (i >= [(EspressoFDOverfeatNetwork *)self->_enet getNumScales]) {
        goto LABEL_144;
      }
      enet = self->_enet;
      if (enet)
      {
        [(EspressoFDOverfeatNetwork *)enet resizerAtIndex:0];
        long long v133 = *(_OWORD *)(*((void *)v148[0] + 12) + 16 * i);
        if (v148[1]) {
          nitro::nitro_function::nitro_function((std::__shared_weak_count *)v148[1]);
        }
      }
      else
      {
        v148[0] = 0;
        v148[1] = 0;
        long long v133 = *(_OWORD *)(MEMORY[0x60] + 16 * i);
      }
      float v12 = self->_enet;
      if (v12)
      {
        [(EspressoFDOverfeatNetwork *)v12 probBlobForScale:i];
        uint64_t v13 = self->_enet;
        if (v13)
        {
          [(EspressoFDOverfeatNetwork *)v13 boxBlobForScale:i];
          goto LABEL_16;
        }
      }
      else
      {
        uint64_t v139 = 0;
        v140 = 0;
      }
      uint64_t v137 = 0;
      v138 = 0;
LABEL_16:
      *(float *)&double v9 = *(double *)&v133;
      *(float *)&double v10 = *((double *)&v133 + 1);
      [(EspressoDCNEspressoOverfeatDetector *)self computeBBoxUsingProb:&v139 box:&v137 andScalefactor:COERCE_DOUBLE(__PAIR64__(HIDWORD(v133), LODWORD(v7))) padX:v9 padY:v10];
      if (v138) {
        nitro::nitro_function::nitro_function(v138);
      }
      if (v140) {
        nitro::nitro_function::nitro_function(v140);
      }
      [(EspressoFDOverfeatNetwork *)self->_enet getScale:i];
      float v7 = v7 / v14;
    }
  }
  double v4 = self->_enet;
  if (v4)
  {
    [(EspressoFDOverfeatNetwork *)v4 strideConfiguration];
    __n128 v5 = (int *)v148[1];
    long long v149 = 0uLL;
    v148[1] = 0;
    if (__p[1])
    {
      *(void **)&long long v152 = __p[1];
      operator delete(__p[1]);
    }
  }
  else
  {
    __n128 v5 = 0;
    *(_OWORD *)__p = 0u;
    long long v152 = 0u;
    long long v149 = 0u;
    *(_OWORD *)v150 = 0u;
    *(_OWORD *)v148 = 0u;
  }
  if (v150[0])
  {
    v150[1] = v150[0];
    operator delete(v150[0]);
  }
  if (v148[1])
  {
    *(void **)&long long v149 = v148[1];
    operator delete(v148[1]);
  }
  float v15 = self->_enet;
  if (v15)
  {
    [(EspressoFDOverfeatNetwork *)v15 strideConfiguration];
    float v16 = (int *)v150[0];
    v150[1] = 0;
    __p[0] = 0;
    v150[0] = 0;
    if (__p[1])
    {
      *(void **)&long long v152 = __p[1];
      operator delete(__p[1]);
    }
  }
  else
  {
    float v16 = 0;
    *(_OWORD *)__p = 0u;
    long long v152 = 0u;
    long long v149 = 0u;
    *(_OWORD *)v150 = 0u;
    *(_OWORD *)v148 = 0u;
  }
  if (v148[1])
  {
    *(void **)&long long v149 = v148[1];
    operator delete(v148[1]);
  }
  int v17 = self->_enet;
  if (v17)
  {
    [(EspressoFDOverfeatNetwork *)v17 strideConfiguration];
    float v18 = (int *)__p[1];
    long long v152 = 0uLL;
    __p[1] = 0;
    if (v150[0])
    {
      v150[1] = v150[0];
      operator delete(v150[0]);
    }
  }
  else
  {
    float v18 = 0;
    *(_OWORD *)__p = 0u;
    long long v152 = 0u;
    long long v149 = 0u;
    *(_OWORD *)v150 = 0u;
    *(_OWORD *)v148 = 0u;
  }
  if (v148[1])
  {
    *(void **)&long long v149 = v148[1];
    operator delete(v148[1]);
  }
  float v19 = self->_enet;
  if (v19)
  {
    [(EspressoFDOverfeatNetwork *)v19 strideConfiguration];
    int v20 = (int)v148[0];
    if (__p[1])
    {
      *(void **)&long long v152 = __p[1];
      operator delete(__p[1]);
    }
  }
  else
  {
    int v20 = 0;
    *(_OWORD *)__p = 0u;
    long long v152 = 0u;
    long long v149 = 0u;
    *(_OWORD *)v150 = 0u;
    *(_OWORD *)v148 = 0u;
  }
  if (v150[0])
  {
    v150[1] = v150[0];
    operator delete(v150[0]);
  }
  if (v148[1])
  {
    *(void **)&long long v149 = v148[1];
    operator delete(v148[1]);
  }
  v119 = v18;
  if (v20 < 1)
  {
    int v21 = 0;
    int v22 = 1;
  }
  else
  {
    int v21 = 0;
    int v22 = 1;
    double v23 = v5;
    double v24 = v119;
    float v25 = v16;
    uint64_t v26 = v20;
    do
    {
      int v28 = *v23++;
      int v27 = v28;
      int v29 = *v24++;
      v21 += (v27 / 2 - v29) * v22;
      int v30 = *v25++;
      v22 *= v30;
      --v26;
    }
    while (v26);
  }
  [(EspressoFDOverfeatNetwork *)self->_enet maxScale];
  float v125 = v31;
  uint64_t v32 = 0;
  *(float *)v33.i32 = (float)v21;
  float32x2_t v34 = (float32x2_t)vdup_lane_s32(v33, 0);
  double v35 = 1.0;
  double v36 = 0.5;
  v122 = self;
  int v120 = v22;
  while (v32 < [(EspressoFDOverfeatNetwork *)self->_enet getNumScales])
  {
    uint64_t v37 = self->_enet;
    if (v37)
    {
      [(EspressoFDOverfeatNetwork *)v37 resizerAtIndex:0];
      float64x2_t v134 = *(float64x2_t *)(*((void *)v148[0] + 12) + 16 * v32);
      if (v148[1]) {
        nitro::nitro_function::nitro_function((std::__shared_weak_count *)v148[1]);
      }
    }
    else
    {
      v148[0] = 0;
      v148[1] = 0;
      float64x2_t v134 = *(float64x2_t *)(MEMORY[0x60] + 16 * v32);
    }
    v38 = self->_enet;
    if (!v38)
    {
      uint64_t v146 = 0;
      v147 = 0;
LABEL_61:
      uint64_t v144 = 0;
      v145 = 0;
      goto LABEL_62;
    }
    [(EspressoFDOverfeatNetwork *)v38 probBlobForScale:v32];
    v39 = self->_enet;
    if (!v39) {
      goto LABEL_61;
    }
    [(EspressoFDOverfeatNetwork *)v39 boxBlobForScale:v32];
LABEL_62:
    if (!v146) {
      goto LABEL_133;
    }
    uint64_t v41 = *(unsigned int *)(v146 + 8);
    uint64_t v40 = *(unsigned int *)(v146 + 12);
    v42 = (char *)operator new(0x58uLL);
    int v43 = v40;
    *((void *)v42 + 1) = 0;
    *((void *)v42 + 2) = 0;
    *(void *)v42 = &unk_1EE389808;
    *((void *)v42 + 3) = &unk_1EE36BE10;
    *(_OWORD *)(v42 + 56) = 0u;
    *(_OWORD *)(v42 + 72) = 0u;
    *((_DWORD *)v42 + 8) = v41;
    *((_DWORD *)v42 + 9) = v40;
    uint64_t v131 = v40;
    v44 = (Espresso *)(16 * (int)v41 * (uint64_t)(int)v40);
    v45 = v42;
    v124 = v42;
    v46 = Espresso::kern_alloc_uninitialized(v44);
    bzero(v46, (size_t)v44);
    *((void *)v45 + 5) = v46;
    v45[48] = 1;
    v47 = (char *)operator new(0x58uLL);
    *((void *)v47 + 1) = 0;
    *((void *)v47 + 2) = 0;
    *(void *)v47 = &unk_1EE389BC0;
    *((void *)v47 + 3) = &unk_1EE36C030;
    *(_OWORD *)(v47 + 56) = 0u;
    *(_OWORD *)(v47 + 72) = 0u;
    *((_DWORD *)v47 + 8) = v41;
    *((_DWORD *)v47 + 9) = v131;
    v48 = Espresso::kern_alloc_uninitialized((Espresso *)(4 * (int)v41 * (uint64_t)v43));
    uint64_t v121 = v32;
    bzero(v48, 4 * (int)v41 * (uint64_t)v43);
    *((void *)v47 + 5) = v48;
    v47[48] = 1;
    int v49 = *((_DWORD *)v47 + 8);
    int v50 = *((_DWORD *)v47 + 9);
    v123 = (std::__shared_weak_count *)v47;
    if (v50 * (uint64_t)v49) {
      memset(v48, 255, 4 * v49 * (uint64_t)v50);
    }
    bzero(*((void **)v124 + 5), 16 * *((int *)v124 + 8) * (uint64_t)*((int *)v124 + 9));
    uint64_t v52 = v131;
    int v53 = v131 * v41;
    v54 = (float *)*((void *)v124 + 5);
    v129 = v54;
    if ((int)v131 * (int)v41 >= 1)
    {
      bzero(v54, 16 * (v131 * v41));
      v54 = v129;
      uint64_t v52 = v131;
    }
    shared_weak_owners = (int *)v123[1].__shared_weak_owners_;
    uint64_t v56 = 4 * (int)v41;
    if ((int)v52 > 0)
    {
      uint64_t v57 = 0;
      float32x2_t v58 = vcvt_f32_f64(v134);
      uint64_t v59 = 4 * (v41 - 1);
      uint64_t v60 = *(void *)(v144 + 24);
      uint64_t v61 = v60 + 8 * (int)v41 * (int)v52;
      uint64_t v62 = *(void *)(v146 + 24) + 4 * v53;
      v63 = v54 + 2;
      uint64_t v64 = v60 + 4 * v53;
      uint64_t v65 = v123[1].__shared_weak_owners_;
      do
      {
        if ((int)v41 >= 1)
        {
          int v66 = 0;
          uint64_t v67 = 0;
          double confidenceThreshold = v122->_confidenceThreshold;
          v70 = v63;
          do
          {
            float v71 = *(float *)(v62 + v67);
            int tileSizeScaleFactor = v122->tileSizeScaleFactor;
            if (tileSizeScaleFactor >= 0) {
              int v73 = v122->tileSizeScaleFactor;
            }
            else {
              int v73 = tileSizeScaleFactor + 1;
            }
            if (confidenceThreshold <= v71)
            {
              float v69 = confidenceThreshold + (v35 - confidenceThreshold) * v36;
              if (v71 > v69)
              {
                if (!v67) {
                  float v71 = v71 * 1.4;
                }
                float v74 = 1.75;
                if (v67) {
                  float v74 = 1.4;
                }
                if (v59 == v67) {
                  float v75 = v74;
                }
                else {
                  float v75 = 1.0;
                }
                float v76 = v75 * v71;
                if (v59 == v67) {
                  float v74 = v74 * 1.25;
                }
                if (v57) {
                  float v77 = 1.0;
                }
                else {
                  float v77 = v74;
                }
                float v71 = v77 * v76;
                if (!v57) {
                  float v74 = v74 * 1.25;
                }
                float v78 = v74 * v71;
                if (v57 == v52 - 1) {
                  float v71 = v78;
                }
              }
              *(float *)v51.i32 = -(float)(v73 >> 1);
              v79.i32[0] = *(_DWORD *)(v60 + v67);
              v79.i32[1] = *(_DWORD *)(v64 + v67);
              float32x2_t v80 = vmla_n_f32((float32x2_t)vdup_lane_s32(v51, 0), v79, (float)tileSizeScaleFactor);
              float v81 = *(float *)(v61 + v67) * (float)tileSizeScaleFactor;
              v79.f32[0] = (float)v66;
              v79.f32[1] = (float)(v22 * v57);
              int32x2_t v51 = (int32x2_t)vmul_n_f32(vsub_f32(vadd_f32(vadd_f32(v80, v34), v79), v58), v125);
              *((int32x2_t *)v70 - 1) = v51;
              float *v70 = v125 * v81;
              v70[1] = v71;
              *(_DWORD *)(v65 + v67) = 1;
            }
            v67 += 4;
            v66 += v22;
            v70 += 4;
          }
          while (4 * v41 != v67);
        }
        ++v57;
        v61 += v56;
        v65 += v56;
        v62 += v56;
        v63 += 4 * (int)v41;
        v60 += v56;
        v64 += v56;
      }
      while (v57 != v52);
    }
    char v82 = 1;
    do
    {
      int v83 = 0;
      char v130 = v82;
      do
      {
        int v126 = v83;
        if ((int)v52 >= 1)
        {
          uint64_t v84 = 0;
          while ((int)v41 < 1)
          {
LABEL_122:
            if (++v84 == v52) {
              goto LABEL_123;
            }
          }
          uint64_t v85 = 0;
          uint64_t v127 = v84 * (int)v41;
          while (shared_weak_owners[v85 + v127] != 1)
          {
LABEL_121:
            if (++v85 == v41) {
              goto LABEL_122;
            }
          }
          uint64_t v86 = 0;
          v87 = (char *)&v54[4 * v85 + 4 * v127];
          v88 = (float32x2_t *)(v87 + 4);
          v128 = (float *)(v87 + 12);
          while (2)
          {
            if (((0x40423uLL >> v86) & 1) == 0 || ((0x404089uLL >> v86) & 1) == 0)
            {
              int v89 = dword_192DD7ADC[v86] + v84;
              if (v89 >= 0)
              {
                int v90 = dword_192DD7A78[v86] + v85;
                if (v90 >= 0 && v89 < (int)v52 && v90 < (int)v41)
                {
                  int v92 = v90 + v89 * v41;
                  if (shared_weak_owners[v92] == 1)
                  {
                    v93 = (char *)&v54[4 * v92];
                    float v94 = *(float *)v93;
                    v132 = (void *)*((void *)v93 + 1);
                    float v135 = *((float *)v93 + 1);
                    if (v130)
                    {
                      long long v143 = *(_OWORD *)v93;
                      float v95 = vision::DCN::boundingbox::calculate_overlap((float *)v87, (float *)&v143);
                      v148[0] = (void *)__PAIR64__(LODWORD(v135), LODWORD(v94));
                      v148[1] = v132;
                      float v96 = vision::DCN::boundingbox::calculate_overlap((float *)v87, (float *)v148);
                      v97.i32[0] = *(_DWORD *)v87;
                      float v98 = v135;
                      uint64_t v52 = v131;
                      v54 = v129;
                      if ((float)(v96
                                 + (float)(sqrtf((float)((float)(v88->f32[0] - v135) * (float)(v88->f32[0] - v135))+ (float)((float)(*(float *)v87 - v94) * (float)(*(float *)v87 - v94)))/ (float)(*(float *)&v132 + *((float *)v87 + 2)))) < 0.9359375&& v95 > 0.3)
                      {
                        float32x2_t v99 = (float32x2_t)v132;
                        float v100 = *v128;
                        goto LABEL_119;
                      }
                    }
                    else
                    {
                      long long v142 = *(_OWORD *)v93;
                      float v101 = vision::DCN::boundingbox::calculate_overlap((float *)v87, (float *)&v142);
                      uint64_t v52 = v131;
                      v54 = v129;
                      float v98 = v135;
                      if (v101 > 0.5)
                      {
                        float v100 = *v128;
                        v97.i32[0] = *(_DWORD *)v87;
                        float32x2_t v99 = (float32x2_t)v132;
LABEL_119:
                        float32x2_t v102 = (float32x2_t)vrev64_s32((int32x2_t)v99);
                        float v103 = vmuls_lane_f32(v94, v99, 1) + (float)(*(float *)v97.i32 * v100);
                        *(float *)v97.i32 = v100 + v99.f32[1];
                        float v104 = v103 / (float)(v100 + v99.f32[1]);
                        v99.f32[0] = v98;
                        float32x2_t v105 = vdiv_f32(vmla_n_f32(vmul_f32(v99, v102), *v88, v100), (float32x2_t)vdup_lane_s32(v97, 0));
                        *(float *)v87 = v104;
                        *(float32x2_t *)(v87 + 4) = v105;
                        *((_DWORD *)v87 + 3) = v97.i32[0];
                        shared_weak_owners[v92] = 2;
                      }
                    }
                  }
                }
              }
            }
            if (++v86 == 25) {
              goto LABEL_121;
            }
            continue;
          }
        }
LABEL_123:
        int v83 = v126 + 1;
      }
      while (v126 != 2);
      char v82 = 0;
    }
    while ((v130 & 1) != 0);
    self = v122;
    double v35 = 1.0;
    double v36 = 0.5;
    if ((int)v52 >= 1)
    {
      uint64_t v106 = 0;
      do
      {
        uint64_t v136 = v106;
        v107 = shared_weak_owners;
        v108 = v54;
        uint64_t v109 = v41;
        if ((int)v41 >= 1)
        {
          do
          {
            int v110 = *v107++;
            if (v110 == 1)
            {
              v111 = v54;
              v112 = self;
              face_list = (uint64_t *)self->face_list;
              long long v141 = *(_OWORD *)v108;
              v114 = operator new(0x20uLL);
              v114[1] = v141;
              *((void *)v114 + 1) = face_list;
              uint64_t v115 = *face_list;
              *(void *)v114 = *face_list;
              *(void *)(v115 + 8) = v114;
              uint64_t *face_list = (uint64_t)v114;
              ++face_list[2];
              uint64_t v52 = v131;
              v54 = v111;
              self = v112;
            }
            v108 += 4;
            --v109;
          }
          while (v109);
        }
        uint64_t v106 = v136 + 1;
        v54 += 4 * (int)v41;
        shared_weak_owners += (int)v41;
      }
      while (v136 + 1 != v52);
    }
    uint64_t v32 = v121;
    [(EspressoFDOverfeatNetwork *)self->_enet getScale:v121];
    *(float *)&double v116 = v125 / v116;
    float v125 = *(float *)&v116;
    nitro::nitro_function::nitro_function(v123);
    nitro::nitro_function::nitro_function((std::__shared_weak_count *)v124);
    int v22 = v120;
LABEL_133:
    if (v145) {
      nitro::nitro_function::nitro_function(v145);
    }
    if (v147) {
      nitro::nitro_function::nitro_function(v147);
    }
    ++v32;
  }
  if (v119) {
    operator delete(v119);
  }
  if (v117) {
    operator delete(v117);
  }
  if (v118) {
    operator delete(v118);
  }
LABEL_144:
  Espresso::scoped_timer::~scoped_timer((Espresso::scoped_timer *)v153);
}

@end