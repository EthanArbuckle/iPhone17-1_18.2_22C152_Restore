@interface CAMeshTransform
+ (BOOL)supportsSecureCoding;
+ (CAMeshTransform)meshTransformWithVertexCount:(unint64_t)a3 vertices:(const CAMeshVertex *)a4 faceCount:(unint64_t)a5 faces:(const CAMeshFace *)a6 depthNormalization:(id)a7;
+ (void)CAMLParserEndElement:(id)a3 content:(id)a4;
+ (void)CAMLParserStartElement:(id)a3;
- (BOOL)_constructWithData:(id)a3;
- (BOOL)replicatesEdges;
- (CAMeshFace)faceAtIndex:(SEL)a3;
- (CAMeshTransform)init;
- (CAMeshTransform)initWithCoder:(id)a3;
- (CAMeshTransform)initWithVertexCount:(unint64_t)a3 vertices:(const CAMeshVertex *)a4 faceCount:(unint64_t)a5 faces:(const CAMeshFace *)a6 depthNormalization:(id)a7;
- (CAMeshVertex)vertexAtIndex:(SEL)a3;
- (NSString)depthNormalization;
- (Object)CA_copyRenderValue;
- (double)CA_distanceToValue:(id)a3;
- (id)CA_interpolateValue:(id)a3 byFraction:(float)a4;
- (id)CA_interpolateValues:(id)a3 :(id)a4 :(id)a5 interpolator:(const ValueInterpolator *)a6;
- (id)_data;
- (id)_init;
- (id)_initWithMeshTransform:(id)a3;
- (id)_subdivideToDepth:(int64_t)a3;
- (id)inverseMesh;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)subdividedMesh:(int)a3;
- (int)subdivisionSteps;
- (unint64_t)CA_copyNumericValue:(double *)a3;
- (unint64_t)CA_numericValueCount;
- (unint64_t)faceCount;
- (unint64_t)vertexCount;
- (void)dealloc;
- (void)encodeWithCAMLWriter:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CAMeshTransform

- (Object)CA_copyRenderValue
{
  result = (Object *)self->_impl;
  if (result)
  {
    p_var1 = &result->var1;
    if (!atomic_fetch_add(&result->var1.var0.var0, 1u))
    {
      result = 0;
      atomic_fetch_add(&p_var1->var0.var0, 0xFFFFFFFF);
    }
  }
  return result;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  impl = (atomic_uint *)self->_impl;
  if (impl && atomic_fetch_add(impl + 2, 0xFFFFFFFF) == 1) {
    (*(void (**)(atomic_uint *, SEL))(*(void *)impl + 16))(impl, a2);
  }
  v4.receiver = self;
  v4.super_class = (Class)CAMeshTransform;
  [(CAMeshTransform *)&v4 dealloc];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  objc_super v4 = [CAMutableMeshTransform alloc];

  return [(CAMeshTransform *)v4 _initWithMeshTransform:self];
}

+ (CAMeshTransform)meshTransformWithVertexCount:(unint64_t)a3 vertices:(const CAMeshVertex *)a4 faceCount:(unint64_t)a5 faces:(const CAMeshFace *)a6 depthNormalization:(id)a7
{
  v7 = (void *)[objc_alloc((Class)a1) initWithVertexCount:a3 vertices:a4 faceCount:a5 faces:a6 depthNormalization:a7];

  return (CAMeshTransform *)v7;
}

- (CAMeshTransform)initWithVertexCount:(unint64_t)a3 vertices:(const CAMeshVertex *)a4 faceCount:(unint64_t)a5 faces:(const CAMeshFace *)a6 depthNormalization:(id)a7
{
  id v12 = [(CAMeshTransform *)self _init];
  if (v12)
  {
    malloc_zone = (malloc_zone_t *)get_malloc_zone();
    v14 = (CA::Render::MeshTransform *)malloc_type_zone_calloc(malloc_zone, 1uLL, 0xD0uLL, 0x743898A5uLL);
    if (v14)
    {
      v15 = (int32x2_t *)v14;
      CA::Render::MeshTransform::MeshTransform(v14, a3, a5, -1);
      if (a3)
      {
        v16 = (float *)(*(void *)&v15[3] + 28);
        p_var1 = (float64x2_t *)&a4->var1;
        do
        {
          *(float32x2_t *)(v16 - 7) = vcvt_f32_f64(p_var1[-1]);
          *(float32x2_t *)(v16 - 3) = vcvt_f32_f64(*p_var1);
          float v18 = p_var1[1].f64[0];
          *(v16 - 1) = v18;
          float *v16 = 1.0;
          v16 += 8;
          p_var1 = (float64x2_t *)((char *)p_var1 + 40);
          --a3;
        }
        while (a3);
      }
      if (a5)
      {
        uint64_t v19 = 0;
        int32x2_t v20 = v15[6];
        uint64_t v21 = *(void *)&v15[9] + 4;
        do
        {
          for (uint64_t i = 0; i != 4; ++i)
          {
            *(_DWORD *)(*(void *)&v20 + i * 4) = a6->var0[i];
            *(float *)(v21 + 1 * i) = a6->var1[i];
          }
          ++v19;
          v21 += 64;
          ++a6;
          *(void *)&v20 += 16;
        }
        while (v19 != a5);
      }
      setDepthNormalization((CAMeshTransform *)v12, (NSString *)a7);
      v15[1].i32[1] &= 0xFFFFD4FF;
      *((void *)v12 + 1) = v15;
      v15[12] = vmovn_s64(*((int64x2_t *)v12 + 1));
      v15[13].i8[4] = *((unsigned char *)v12 + 32);
    }
    else
    {

      return 0;
    }
  }
  return (CAMeshTransform *)v12;
}

- (id)_initWithMeshTransform:(id)a3
{
  objc_super v4 = [(CAMeshTransform *)self _init];
  if (v4)
  {
    uint64_t v5 = (const CA::Render::MeshTransform *)*((void *)a3 + 1);
    if (v5
      && (malloc_zone = (malloc_zone_t *)get_malloc_zone(),
          (v7 = (CA::Render::MeshTransform *)malloc_type_zone_calloc(malloc_zone, 1uLL, 0xD0uLL, 0x743898A5uLL)) != 0))
    {
      v8 = CA::Render::MeshTransform::MeshTransform(v7, v5);
      uint64_t v9 = *((unsigned int *)v8 + 24);
      uint64_t v10 = *((int *)v8 + 25);
      v4[1] = v8;
      v4[2] = v9;
      v4[3] = v10;
      *((unsigned char *)v4 + 32) = *((unsigned char *)v8 + 108);
    }
    else
    {

      return 0;
    }
  }
  return v4;
}

- (id)_init
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)CAMeshTransform;
  id result = [(CAMeshTransform *)&v3 init];
  if (result) {
    *((_OWORD *)result + 1) = xmmword_184997E50;
  }
  return result;
}

- (double)CA_distanceToValue:(id)a3
{
  (*(void (**)(void *, void))(*(void *)self->_impl + 72))(self->_impl, *((void *)a3 + 1));
  return result;
}

- (id)CA_interpolateValues:(id)a3 :(id)a4 :(id)a5 interpolator:(const ValueInterpolator *)a6
{
  v13[1] = *(CA::Render::Object **)MEMORY[0x1E4F143B8];
  if (a3) {
    unint64_t v7 = *((void *)a3 + 1);
  }
  else {
    unint64_t v7 = 0;
  }
  impl = (atomic_uint *)self->_impl;
  uint64_t v9 = (atomic_uint *)*((void *)a4 + 1);
  if (a5) {
    a5 = (id)*((void *)a5 + 1);
  }
  v13[0] = 0;
  CA::Render::mix_objects((atomic_uint **)v13, v7, impl, v9, (unint64_t)a5, (const CA::Render::ValueInterpolator *)a6);
  uint64_t v10 = interpolatedMeshTransform((CAMeshTransform *)a4, (atomic_uint *)v13[0]);
  v11 = v13[0];
  if (v13[0] && atomic_fetch_add((atomic_uint *volatile)v13[0] + 2, 0xFFFFFFFF) == 1) {
    (*(void (**)(CA::Render::Object *))(*(void *)v11 + 16))(v11);
  }
  return v10;
}

+ (void)CAMLParserEndElement:(id)a3 content:(id)a4
{
  v6 = (void *)[a3 elementValue];
  if (v6 && !v6[1] && (objc_msgSend(v6, "_constructWithData:", objc_msgSend(a4, "dataUsingEncoding:", 4)) & 1) == 0)
  {
    [a3 setElementValue:0];
  }
}

+ (void)CAMLParserStartElement:(id)a3
{
  uint64_t v4 = [a3 attributeForKey:@"src" remove:1];
  if (v4)
  {
    uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CB10]), "initWithString:relativeToURL:", v4, objc_msgSend(a3, "baseURL"));
    if (v5)
    {
      v6 = (void *)v5;
      uint64_t v7 = [a3 willLoadResourceFromURL:v5];
      if (v7 && (uint64_t v8 = v7, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        [a3 setElementValue:v8];
      }
      else
      {
        uint64_t v9 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfURL:v6];
        if (v9)
        {
          uint64_t v10 = (void *)v9;
          id v11 = [[CAMeshTransform alloc] _init];
          if ([v11 _constructWithData:v10])
          {

            if (v11)
            {
              [a3 setElementValue:v11];
              [a3 didLoadResource:v11 fromURL:v6];
            }
          }
          else
          {
          }
        }
      }
    }
  }
  id v12 = (id)[a3 elementValue];
  if (!v12)
  {
    id v12 = [[CAMeshTransform alloc] _init];
    [a3 setElementValue:v12];
  }
  v13 = (void *)[a3 attributeForKey:@"subdivisionSteps" remove:1];
  if (v13) {
    *((void *)v12 + 3) = (int)[v13 intValue];
  }
  v14 = (void *)[a3 attributeForKey:@"replicatesEdges" remove:1];
  if (v14) {
    *((unsigned char *)v12 + 32) = [v14 BOOLValue];
  }
  v15 = (NSString *)[a3 attributeForKey:@"depthNormalization" remove:1];
  if (v15) {
    setDepthNormalization((CAMeshTransform *)v12, v15);
  }
  v16 = (int32x2_t *)*((void *)v12 + 1);
  if (v16)
  {
    v16[12] = vmovn_s64(*((int64x2_t *)v12 + 1));
    v16[13].i8[4] = *((unsigned char *)v12 + 32);
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)CA_interpolateValue:(id)a3 byFraction:(float)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v9.var0 = a4;
  memset(&v9.var1, 0, 112);
  uint64_t v8 = 0;
  CA::Render::mix_objects((uint64_t)&v8, (atomic_uint *)self->_impl, *((atomic_uint **)a3 + 1), &v9);
  uint64_t v5 = interpolatedMeshTransform((CAMeshTransform *)a3, (atomic_uint *)v8);
  v6 = v8;
  if (v8 && atomic_fetch_add((atomic_uint *volatile)v8 + 2, 0xFFFFFFFF) == 1) {
    (*(void (**)(CA::Render::Object *))(*(void *)v6 + 16))(v6);
  }
  return v5;
}

- (void)encodeWithCAMLWriter:(id)a3
{
  uint64_t v5 = [a3 URLStringForResource:self];
  if (v5)
  {
    [a3 setElementAttribute:v5 forKey:@"src"];
  }
  else
  {
    if (self->_normalization != 1) {
      objc_msgSend(a3, "setElementAttribute:forKey:", -[CAMeshTransform depthNormalization](self, "depthNormalization"), @"depthNormalization");
    }
    if ((self->_subdivisionSteps & 0x8000000000000000) == 0)
    {
      v6 = objc_msgSend([NSString alloc], "initWithFormat:", @"%d", self->_subdivisionSteps);
      [a3 setElementAttribute:v6 forKey:@"subdivisionSteps"];
    }
    if (self->_replicatesEdges) {
      [a3 setElementAttribute:@"1" forKey:@"replicatesEdges"];
    }
    id v7 = [(CAMeshTransform *)self _data];
    id v8 = (id)[[NSString alloc] initWithData:v7 encoding:4];
    [a3 setElementContent:v8];
  }
}

- (CAMeshTransform)initWithCoder:(id)a3
{
  uint64_t v4 = [(CAMeshTransform *)self _init];
  if (v4)
  {
    if ([a3 containsValueForKey:@"subdivisionSteps"]) {
      v4->_subdivisionSteps = (int)[a3 decodeIntForKey:@"subdivisionSteps"];
    }
    if ([a3 containsValueForKey:@"replicatesEdges"]) {
      v4->_replicatesEdges = [a3 decodeBoolForKey:@"replicatesEdges"];
    }
    uint64_t v5 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"meshData"];
    if (v5 && [(CAMeshTransform *)v4 _constructWithData:v5])
    {
      v6 = (NSString *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"depthNormalization"];
      setDepthNormalization(v4, v6);
    }
    else
    {

      return 0;
    }
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", -[CAMeshTransform _data](self, "_data"), @"meshData");
  if (self->_normalization != 1) {
    objc_msgSend(a3, "encodeObject:forKey:", -[CAMeshTransform depthNormalization](self, "depthNormalization"), @"depthNormalization");
  }
  if ((self->_subdivisionSteps & 0x8000000000000000) == 0) {
    objc_msgSend(a3, "encodeInt:forKey:");
  }
  if (self->_replicatesEdges)
  {
    [a3 encodeBool:1 forKey:@"replicatesEdges"];
  }
}

- (id)inverseMesh
{
  uint64_t v3 = [objc_alloc((Class)objc_opt_class()) _init];
  impl = (const CA::Render::MeshTransform *)self->_impl;
  malloc_zone = (malloc_zone_t *)get_malloc_zone();
  v6 = (CA::Render::MeshTransform *)malloc_type_zone_calloc(malloc_zone, 1uLL, 0xD0uLL, 0x743898A5uLL);
  if (v6) {
    v6 = CA::Render::MeshTransform::MeshTransform(v6, impl);
  }
  id v7 = (void *)*((void *)v6 + 3);
  id v8 = (void *)*((void *)v6 + 4);
  while (v7 != v8)
  {
    uint64_t v9 = v7[2];
    v7[2] = *v7;
    void *v7 = v9;
    v7 += 4;
  }
  *((_DWORD *)v6 + 3) &= 0xFFFFFAFF;
  uint64_t v10 = *((unsigned int *)v6 + 24);
  uint64_t v11 = *((int *)v6 + 25);
  *(void *)(v3 + 8) = v6;
  *(void *)(v3 + 16) = v10;
  *(void *)(v3 + 24) = v11;
  *(unsigned char *)(v3 + 32) = *((unsigned char *)v6 + 108);

  return (id)v3;
}

- (id)subdividedMesh:(int)a3
{
  return [(CAMeshTransform *)self _subdivideToDepth:a3];
}

- (id)_subdivideToDepth:(int64_t)a3
{
  uint64_t v3 = self;
  uint64_t v4 = CA::Render::MeshTransform::retain_subdivided_mesh((os_unfair_lock_s *)self->_impl, a3);
  if (!v4) {
    return 0;
  }
  uint64_t v5 = v4;
  if (v4 != v3->_impl)
  {
    uint64_t v6 = [objc_alloc((Class)objc_opt_class()) _init];
    if (atomic_fetch_add((atomic_uint *volatile)&v5[2], 1u))
    {
      uint64_t os_unfair_lock_opaque = (int)v5[25]._os_unfair_lock_opaque;
      *(void *)(v6 + 16) = v5[24]._os_unfair_lock_opaque;
      *(void *)(v6 + 24) = os_unfair_lock_opaque;
      *(unsigned char *)(v6 + 32) = v5[27]._os_unfair_lock_opaque;
      id v8 = v5;
    }
    else
    {
      id v8 = 0;
      atomic_fetch_add((atomic_uint *volatile)&v5[2], 0xFFFFFFFF);
    }
    *(void *)(v6 + 8) = v8;
    uint64_t v3 = (CAMeshTransform *)(id)v6;
  }
  if (atomic_fetch_add((atomic_uint *volatile)&v5[2], 0xFFFFFFFF) == 1) {
    (*(void (**)(os_unfair_lock_s *))(*(void *)&v5->_os_unfair_lock_opaque + 16))(v5);
  }
  return v3;
}

- (id)_data
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  impl = self->_impl;
  if (!impl) {
    return 0;
  }
  Mutable = CFStringCreateMutable(0, 0);
  uint64_t v4 = impl[3];
  if (impl[4] != v4)
  {
    unint64_t v5 = 0;
    uint64_t v6 = 16;
    do
    {
      CFStringRef v7 = CACreateStringWithFloatArray(v4 + v6 - 16, 2uLL, 1.0e-10);
      CFStringRef v8 = CACreateStringWithFloatArray(impl[3] + v6, 3uLL, 1.0e-10);
      CFStringAppendFormat(Mutable, 0, @"[%@] [%@] v ", v7, v8);
      CFRelease(v8);
      CFRelease(v7);
      ++v5;
      uint64_t v4 = impl[3];
      v6 += 32;
    }
    while (v5 < (impl[4] - v4) >> 5);
  }
  uint64_t v9 = impl[6];
  if (impl[7] != v9)
  {
    uint64_t v10 = 0;
    unint64_t v11 = 0;
    do
    {
      float32x4_t v19 = vcvtq_f32_u32(*(uint32x4_t *)(v9 + 16 * v11));
      id v12 = (_DWORD *)(impl[9] + v10);
      int v13 = v12[5];
      v20[0] = v12[1];
      v20[1] = v13;
      int v14 = v12[13];
      v20[2] = v12[9];
      v20[3] = v14;
      CFStringRef v15 = CACreateStringWithFloatArray((uint64_t)&v19, 4uLL, 1.0e-10);
      CFStringRef v16 = CACreateStringWithFloatArray((uint64_t)v20, 4uLL, 1.0e-10);
      CFStringAppendFormat(Mutable, 0, @"[%@] [%@] f ", v15, v16);
      CFRelease(v16);
      CFRelease(v15);
      ++v11;
      uint64_t v9 = impl[6];
      v10 += 64;
    }
    while (v11 < (impl[7] - v9) >> 4);
  }
  v17 = (void *)[(__CFString *)Mutable dataUsingEncoding:4];
  CFRelease(Mutable);
  return v17;
}

- (BOOL)_constructWithData:(id)a3
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  malloc_zone = (malloc_zone_t *)get_malloc_zone();
  uint64_t v6 = (char *)malloc_type_zone_calloc(malloc_zone, 1uLL, 0xD0uLL, 0x743898A5uLL);
  if (!v6) {
    return (char)v6;
  }
  CFStringRef v7 = (int32x2_t *)v6;
  *((_DWORD *)v6 + 2) = 1;
  ++dword_1EB2ADE4C;
  *(void *)uint64_t v6 = &unk_1ED02DBE8;
  *(void *)(v6 + 12) = 33;
  *(_OWORD *)(v6 + 24) = 0u;
  CFStringRef v8 = (char **)(v6 + 24);
  *(_OWORD *)(v6 + 40) = 0u;
  *(_OWORD *)(v6 + 56) = 0u;
  *(_OWORD *)(v6 + 72) = 0u;
  *(_OWORD *)(v6 + 84) = 0u;
  *(void *)(v6 + 100) = 0xFFFFFFFFLL;
  v6[108] = 0;
  *((void *)v6 + 25) = 0;
  uint64_t v9 = [a3 length];
  uint64_t v10 = [a3 bytes];
  v73 = (const char *)v10;
  if (v9 < 1) {
    goto LABEL_77;
  }
  uint64_t v11 = v10;
  uint64_t v12 = 0;
  v71 = (const char *)(v10 + v9);
  uint64_t v72 = -v10;
  while (2)
  {
    int v13 = (const char *)(v72 + v10);
    while (1)
    {
      unsigned int v14 = *(char *)v10;
      if (v14 <= 0x2E)
      {
        if (((1 << v14) & 0x100100003600) != 0) {
          goto LABEL_10;
        }
        if (((1 << v14) & 0x680000000000) != 0) {
          goto LABEL_13;
        }
      }
      uint64_t v15 = v14 - 48;
      if (v15 > 0x39) {
        goto LABEL_24;
      }
      if (((1 << (v14 - 48)) & 0x280000000000) == 0) {
        break;
      }
LABEL_10:
      v73 = (const char *)++v10;
      if ((uint64_t)++v13 >= v9) {
        goto LABEL_77;
      }
    }
    if (((1 << (v14 - 48)) & 0x2000000020003FFLL) == 0)
    {
      if (v15 == 54)
      {
        if (v12 != 4 && v12 != 8)
        {
          NSLog(&cfstr_InvalidNumberO_1.isa);
          goto LABEL_81;
        }
        long long v76 = 0u;
        long long v77 = 0u;
        float v16 = 0.0;
        long long v74 = 0u;
        long long v75 = 0u;
        if (v12 == 8)
        {
          float v17 = *(double *)&v80;
          float v18 = *((double *)&v80 + 1);
          *((float *)&v74 + 1) = v17;
          *((float *)&v75 + 1) = v18;
          float v19 = *(double *)&v81;
          *((float *)&v76 + 1) = v19;
          float v16 = *((double *)&v81 + 1);
        }
        unsigned int v20 = *((double *)&v78 + 1);
        unsigned int v21 = *(double *)&v79;
        unsigned int v22 = *((double *)&v79 + 1);
        *((float *)&v77 + 1) = v16;
        v23 = (_DWORD *)v7[7];
        unint64_t v24 = (unint64_t)v7[8];
        if ((unint64_t)v23 >= v24)
        {
          unsigned int v69 = *(double *)&v78;
          unsigned int v70 = *((double *)&v78 + 1);
          int32x2_t v34 = v7[6];
          uint64_t v35 = ((uint64_t)v23 - *(void *)&v34) >> 4;
          unint64_t v36 = v35 + 1;
          if ((unint64_t)(v35 + 1) >> 60) {
            abort();
          }
          uint64_t v37 = v24 - *(void *)&v34;
          if (v37 >> 3 > v36) {
            unint64_t v36 = v37 >> 3;
          }
          if ((unint64_t)v37 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v38 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v38 = v36;
          }
          if (v38) {
            unint64_t v38 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<CA::Render::MeshFace>>(v38);
          }
          else {
            uint64_t v39 = 0;
          }
          v45 = (unsigned int *)(v38 + 16 * v35);
          unsigned int *v45 = v69;
          v45[1] = v70;
          v45[2] = v21;
          v45[3] = v22;
          v47 = (char *)v7[6];
          v46 = (char *)v7[7];
          v48 = v45;
          if (v46 != v47)
          {
            do
            {
              *((_OWORD *)v48 - 1) = *((_OWORD *)v46 - 1);
              v48 -= 4;
              v46 -= 16;
            }
            while (v46 != v47);
            v46 = (char *)v7[6];
          }
          v25 = v45 + 4;
          v7[6] = (int32x2_t)v48;
          v7[7] = (int32x2_t)(v45 + 4);
          v7[8] = (int32x2_t)(v38 + 16 * v39);
          if (v46) {
            operator delete(v46);
          }
        }
        else
        {
          _DWORD *v23 = *(double *)&v78;
          v23[1] = v20;
          v25 = v23 + 4;
          v23[2] = v21;
          v23[3] = v22;
        }
        uint64_t v49 = 0;
        v7[7] = (int32x2_t)v25;
        v50 = (long long *)v7[10];
        do
        {
          v51 = &v74 + v49;
          unint64_t v52 = (unint64_t)v7[11];
          if ((unint64_t)v50 >= v52)
          {
            int32x2_t v53 = v7[9];
            uint64_t v54 = ((uint64_t)v50 - *(void *)&v53) >> 4;
            if ((unint64_t)(v54 + 1) >> 60) {
              abort();
            }
            uint64_t v55 = v52 - *(void *)&v53;
            uint64_t v56 = v55 >> 3;
            if (v55 >> 3 <= (unint64_t)(v54 + 1)) {
              uint64_t v56 = v54 + 1;
            }
            if ((unint64_t)v55 >= 0x7FFFFFFFFFFFFFF0) {
              unint64_t v57 = 0xFFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v57 = v56;
            }
            if (v57) {
              unint64_t v57 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<CA::Render::MeshFace>>(v57);
            }
            else {
              uint64_t v58 = 0;
            }
            v59 = (long long *)(v57 + 16 * v54);
            long long *v59 = *v51;
            v61 = (char *)v7[9];
            v60 = (char *)v7[10];
            v62 = v59;
            if (v60 != v61)
            {
              do
              {
                *--v62 = *((_OWORD *)v60 - 1);
                v60 -= 16;
              }
              while (v60 != v61);
              v60 = (char *)v7[9];
            }
            v50 = v59 + 1;
            v7[9] = (int32x2_t)v62;
            v7[10] = (int32x2_t)(v59 + 1);
            v7[11] = (int32x2_t)(v57 + 16 * v58);
            if (v60) {
              operator delete(v60);
            }
          }
          else
          {
            *v50++ = *v51;
          }
          v7[10] = (int32x2_t)v50;
          ++v49;
        }
        while (v49 != 4);
        uint64_t v12 = 0;
      }
      else
      {
LABEL_24:
        if (v14 != 118)
        {
          NSLog(&cfstr_InvalidMeshOpe.isa, *(char *)v10);
LABEL_81:
          (*(void (**)(int32x2_t *))(*(void *)v7 + 8))(v7);
          LOBYTE(v6) = 0;
          return (char)v6;
        }
        if (v12 != 5)
        {
          NSLog(&cfstr_InvalidNumberO_0.isa);
          goto LABEL_81;
        }
        float v26 = *(double *)&v78;
        float v27 = *((double *)&v78 + 1);
        float v28 = *(double *)&v79;
        float v29 = *((double *)&v79 + 1);
        float v30 = *(double *)&v80;
        int32x2_t v31 = v7[4];
        int32x2_t v32 = v7[5];
        if (*(void *)&v31 >= *(void *)&v32)
        {
          uint64_t v40 = (uint64_t)(*(void *)&v31 - (void)*v8) >> 5;
          unint64_t v41 = v40 + 1;
          if ((unint64_t)(v40 + 1) >> 59) {
            abort();
          }
          uint64_t v42 = *(void *)&v32 - (void)*v8;
          if (v42 >> 4 > v41) {
            unint64_t v41 = v42 >> 4;
          }
          if ((unint64_t)v42 >= 0x7FFFFFFFFFFFFFE0) {
            unint64_t v43 = 0x7FFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v43 = v41;
          }
          if (v43) {
            unint64_t v43 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<CA::Render::MeshVertex>>(v43);
          }
          else {
            uint64_t v44 = 0;
          }
          unint64_t v63 = v43 + 32 * v40;
          *(float *)unint64_t v63 = v26;
          *(float *)(v63 + 4) = v27;
          *(void *)(v63 + 8) = 0;
          *(float *)(v63 + 16) = v28;
          *(float *)(v63 + 20) = v29;
          *(float *)(v63 + 24) = v30;
          *(_DWORD *)(v63 + 28) = 1065353216;
          v65 = (char *)v7[3];
          v64 = (char *)v7[4];
          int32x2_t v66 = (int32x2_t)v63;
          if (v64 != v65)
          {
            do
            {
              long long v67 = *((_OWORD *)v64 - 1);
              *(_OWORD *)(*(void *)&v66 - 32) = *((_OWORD *)v64 - 2);
              *(_OWORD *)(*(void *)&v66 - 16) = v67;
              *(void *)&v66 -= 32;
              v64 -= 32;
            }
            while (v64 != v65);
            v64 = *v8;
          }
          int32x2_t v33 = (int32x2_t)(v63 + 32);
          v7[3] = v66;
          v7[4] = (int32x2_t)(v63 + 32);
          v7[5] = (int32x2_t)(v43 + 32 * v44);
          if (v64) {
            operator delete(v64);
          }
        }
        else
        {
          *(float *)v31.i32[0] = v26;
          *(float *)(*(void *)&v31 + 4) = v27;
          *(void *)(*(void *)&v31 + 8) = 0;
          *(float *)(*(void *)&v31 + 16) = v28;
          *(float *)(*(void *)&v31 + 20) = v29;
          *(float *)(*(void *)&v31 + 24) = v30;
          int32x2_t v33 = (int32x2_t)(*(void *)&v31 + 32);
          *(_DWORD *)(*(void *)&v31 + 28) = 1065353216;
        }
        uint64_t v12 = 0;
        v7[4] = v33;
      }
      uint64_t v10 = (uint64_t)++v73;
      goto LABEL_15;
    }
LABEL_13:
    if (v12 == 16)
    {
      NSLog(&cfstr_InvalidNumberO.isa);
      goto LABEL_81;
    }
    *((double *)&v78 + v12++) = x_strtod((const char *)v10, &v73, v71);
    uint64_t v10 = (uint64_t)v73;
LABEL_15:
    if (v10 - v11 < v9) {
      continue;
    }
    break;
  }
LABEL_77:
  self->_impl = v7;
  v7[12] = vmovn_s64(*(int64x2_t *)&self->_normalization);
  v7[13].i8[4] = self->_replicatesEdges;
  LOBYTE(v6) = 1;
  return (char)v6;
}

- (unint64_t)CA_copyNumericValue:(double *)a3
{
  impl = self->_impl;
  unint64_t v5 = (float32x2_t *)impl[3];
  uint64_t v4 = impl[4];
  uint64_t v6 = impl[6];
  uint64_t v7 = impl[7];
  double v8 = 0.0;
  unint64_t v9 = 1.0;
  if (*((unsigned char *)impl + 108)) {
    double v8 = 1.0;
  }
  LODWORD(v9) = *((_DWORD *)impl + 24);
  double v10 = (double)*((int *)impl + 25);
  a3[2] = (double)v9;
  a3[3] = v10;
  a3[4] = v8;
  uint64_t v11 = (float64x2_t *)(a3 + 5);
  uint64_t v13 = v4 - (void)v5;
  BOOL v12 = v13 == 0;
  unint64_t v14 = v13 >> 5;
  double v15 = (double)(unint64_t)(v13 >> 5);
  unint64_t v16 = (v7 - v6) >> 4;
  *a3 = v15;
  a3[1] = (double)v16;
  if (!v12)
  {
    if (v14 <= 1) {
      unint64_t v14 = 1;
    }
    float v17 = v5 + 2;
    do
    {
      float64_t v18 = v17[-2].f32[1];
      v11->f64[0] = v17[-2].f32[0];
      v11->f64[1] = v18;
      v11[1] = vcvtq_f64_f32(*v17);
      v11[2].f64[0] = v17[1].f32[0];
      uint64_t v11 = (float64x2_t *)((char *)v11 + 40);
      v17 += 4;
      --v14;
    }
    while (v14);
  }
  if (v7 != v6)
  {
    if (v16 <= 1) {
      uint64_t v19 = 1;
    }
    else {
      uint64_t v19 = (v7 - v6) >> 4;
    }
    unsigned int v20 = (void *)(v6 + 8);
    do
    {
      uint64_t v21 = *(v20 - 1);
      v22.i64[0] = v21;
      v22.i64[1] = HIDWORD(v21);
      float64x2_t v23 = vcvtq_f64_u64(v22);
      unint64_t v24 = v11 + 2;
      v22.i64[0] = *v20;
      v22.i64[1] = HIDWORD(*v20);
      float64x2_t *v11 = v23;
      v11[1] = vcvtq_f64_u64(v22);
      v20 += 2;
      v11 += 2;
      --v19;
    }
    while (v19);
    uint64_t v11 = v24;
  }
  return ((char *)v11 - (char *)a3) >> 3;
}

- (unint64_t)CA_numericValueCount
{
  impl = self->_impl;
  uint64_t v3 = impl[4] - impl[3];
  return (v3 >> 3) + (v3 >> 5) + ((uint64_t)(impl[7] - impl[6]) >> 2) + 5;
}

- (BOOL)replicatesEdges
{
  return self->_replicatesEdges;
}

- (int)subdivisionSteps
{
  return self->_subdivisionSteps;
}

- (NSString)depthNormalization
{
  unint64_t v2 = self->_normalization - 2;
  if (v2 > 4) {
    return (NSString *)@"none";
  }
  else {
    return (NSString *)*((void *)&off_1E5272DF0 + v2);
  }
}

- (CAMeshFace)faceAtIndex:(SEL)a3
{
  uint64_t v4 = 0;
  uint64_t v5 = *(void *)&self->var0[2];
  uint64_t v6 = *(void *)(v5 + 48);
  uint64_t v7 = *(void *)(v5 + 72);
  *(void *)&retstr->var1[2] = 0;
  *(_OWORD *)retstr->var0 = *(_OWORD *)(v6 + 16 * a4);
  *(void *)retstr->var1 = 0;
  var1 = retstr->var1;
  unint64_t v9 = v7 + (a4 << 6) + 4;
  do
  {
    var1[v4] = *(float *)(v9 + 1 * v4);
    ++v4;
  }
  while (v4 != 4);
  return self;
}

- (unint64_t)faceCount
{
  return (uint64_t)(*((void *)self->_impl + 7) - *((void *)self->_impl + 6)) >> 4;
}

- (CAMeshVertex)vertexAtIndex:(SEL)a3
{
  uint64_t v4 = (float32x2_t *)(*(void *)(*(void *)&self->var0.y + 24) + 32 * a4);
  float64x2_t v5 = vcvtq_f64_f32(v4[2]);
  retstr->var0 = (CGPoint)vcvtq_f64_f32(*v4);
  *(float64x2_t *)&retstr->var1.x = v5;
  retstr->var1.z = v4[3].f32[0];
  return self;
}

- (unint64_t)vertexCount
{
  return (uint64_t)(*((void *)self->_impl + 4) - *((void *)self->_impl + 3)) >> 5;
}

- (CAMeshTransform)init
{
  return 0;
}

@end