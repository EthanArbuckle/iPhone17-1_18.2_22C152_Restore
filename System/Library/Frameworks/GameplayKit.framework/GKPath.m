@interface GKPath
+ (GKPath)pathWithFloat3Points:(vector_float3 *)points count:(size_t)count radius:(float)radius cyclical:(BOOL)cyclical;
+ (GKPath)pathWithGraphNodes:(NSArray *)graphNodes radius:(float)radius;
+ (GKPath)pathWithPoints:(vector_float2 *)points count:(size_t)count radius:(float)radius cyclical:(BOOL)cyclical;
- (BOOL)_cyclical;
- (GKPath)initWithFloat3Points:(vector_float3 *)points count:(size_t)count radius:(float)radius cyclical:(BOOL)cyclical;
- (GKPath)initWithGraphNodes:(NSArray *)graphNodes radius:(float)radius;
- (GKPath)initWithPoints:(vector_float2 *)points count:(size_t)count radius:(float)radius cyclical:(BOOL)cyclical;
- (NSUInteger)numPoints;
- (PolylinePathway)pathway;
- (float)radius;
- (id).cxx_construct;
- (vector_float2)float2AtIndex:(NSUInteger)index;
- (vector_float2)pointAtIndex:(NSUInteger)index;
- (vector_float3)float3AtIndex:(NSUInteger)index;
- (void)setRadius:(float)radius;
- (void)set_cyclical:(BOOL)a3;
@end

@implementation GKPath

- (void)set_cyclical:(BOOL)a3
{
  self->_pathway.cyclic = a3;
}

- (BOOL)_cyclical
{
  return self->_pathway.cyclic;
}

- (PolylinePathway)pathway
{
  return &self->_pathway;
}

- (void)setRadius:(float)radius
{
  *(float *)([(GKPath *)self pathway] + 24) = radius;
}

- (float)radius
{
  return (float)[(GKPath *)self pathway][24];
}

- (NSUInteger)numPoints
{
  uint64_t v3 = (int)[(GKPath *)self pathway][8];
  return v3 - [(GKPath *)self isCyclical];
}

+ (GKPath)pathWithPoints:(vector_float2 *)points count:(size_t)count radius:(float)radius cyclical:(BOOL)cyclical
{
  BOOL v6 = cyclical;
  v10 = [GKPath alloc];
  *(float *)&double v11 = radius;
  v12 = [(GKPath *)v10 initWithPoints:points count:count radius:v6 cyclical:v11];

  return v12;
}

- (GKPath)initWithPoints:(vector_float2 *)points count:(size_t)count radius:(float)radius cyclical:(BOOL)cyclical
{
  BOOL v6 = cyclical;
  v29.receiver = self;
  v29.super_class = (Class)GKPath;
  v10 = [(GKPath *)&v29 init];
  double v11 = v10;
  if (count > 1)
  {
    if (!v10) {
      return v11;
    }
    v25 = v10;
    if (count > 0x1555555555555555) {
      _ZNKSt3__16vectorI12GKCRTreeNodeI8NSObjectDv2_fENS_9allocatorIS4_EEE20__throw_length_errorB8ne180100Ev();
    }
    int v24 = v6;
    v12 = (Vec3 *)operator new(12 * count);
    uint64_t v14 = 0;
    __p = v12;
    v28 = &v12[count];
    while (1)
    {
      *(vector_float2 *)&long long v13 = points[v14];
      float v16 = *((float *)&v13 + 1);
      if (v12 < v28)
      {
        LODWORD(v12->x) = v13;
        v12->y = 0.0;
        v15 = v12 + 1;
        v12->float z = *((float *)&v13 + 1);
      }
      else
      {
        unint64_t v17 = 0xAAAAAAAAAAAAAAABLL * (((char *)v12 - (char *)__p) >> 2) + 1;
        if (v17 > 0x1555555555555555) {
          _ZNKSt3__16vectorI12GKCRTreeNodeI8NSObjectDv2_fENS_9allocatorIS4_EEE20__throw_length_errorB8ne180100Ev();
        }
        if (0x5555555555555556 * (((char *)v28 - (char *)__p) >> 2) > v17) {
          unint64_t v17 = 0x5555555555555556 * (((char *)v28 - (char *)__p) >> 2);
        }
        if (0xAAAAAAAAAAAAAAABLL * (((char *)v28 - (char *)__p) >> 2) >= 0xAAAAAAAAAAAAAAALL) {
          unint64_t v18 = 0x1555555555555555;
        }
        else {
          unint64_t v18 = v17;
        }
        if (v18)
        {
          long long v26 = v13;
          if (v18 > 0x1555555555555555) {
            std::__throw_bad_array_new_length[abi:ne180100]();
          }
          v19 = (char *)operator new(12 * v18);
          long long v13 = v26;
        }
        else
        {
          v19 = 0;
        }
        v20 = (Vec3 *)&v19[4 * (((char *)v12 - (char *)__p) >> 2)];
        LODWORD(v20->x) = v13;
        v20->y = 0.0;
        v20->float z = v16;
        v15 = v20 + 1;
        if (v12 == __p)
        {
          __p = (const Vec3 *)&v19[4 * (((char *)v12 - (char *)__p) >> 2)];
          v28 = (Vec3 *)&v19[12 * v18];
LABEL_24:
          operator delete(v12);
          goto LABEL_7;
        }
        do
        {
          uint64_t v21 = *(void *)&v12[-1].x;
          --v12;
          float z = v12->z;
          *(void *)&v20[-1].x = v21;
          --v20;
          v20->float z = z;
        }
        while (v12 != __p);
        v12 = (Vec3 *)__p;
        __p = v20;
        v28 = (Vec3 *)&v19[12 * v18];
        if (v12) {
          goto LABEL_24;
        }
      }
LABEL_7:
      ++v14;
      v12 = v15;
      if (v14 == count) {
        OpenSteer::PolylinePathway::initialize((OpenSteer::PolylinePathway *)[(GKPath *)v25 pathway], count, __p, radius, v24);
      }
    }
  }
  [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"GKPathLessThanTwoPointsException: GKPaths MUST be initialized with 2 or more points.  Single point paths are not allowed"];
  return v11;
}

+ (GKPath)pathWithGraphNodes:(NSArray *)graphNodes radius:(float)radius
{
  v5 = graphNodes;
  BOOL v6 = [GKPath alloc];
  *(float *)&double v7 = radius;
  v8 = [(GKPath *)v6 initWithGraphNodes:v5 radius:v7];

  return v8;
}

- (GKPath)initWithGraphNodes:(NSArray *)graphNodes radius:(float)radius
{
  BOOL v6 = graphNodes;
  if ([(NSArray *)v6 count] > 1)
  {
    v8 = [(NSArray *)v6 objectAtIndexedSubscript:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      __p = 0;
      long long v26 = 0;
      uint64_t v27 = 0;
      unint64_t v9 = [(NSArray *)v6 count];
      if (v9) {
        _ZNSt3__16vectorIDv2_fNS_9allocatorIS1_EEE8__appendEm((char **)&__p, v9);
      }
      for (unint64_t i = 0; [(NSArray *)v6 count] > i; ++i)
      {
        double v11 = [(NSArray *)v6 objectAtIndexedSubscript:i];
        [v11 position];
        *((void *)__p + i) = v12;
      }
      unint64_t v17 = __p;
      uint64_t v18 = [(NSArray *)v6 count];
      *(float *)&double v19 = radius;
      v20 = [(GKPath *)self initWithPoints:v17 count:v18 radius:0 cyclical:v19];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"GKPath: only GKGraphNode2D and GKGraphNode3D are accepted by initWithGraphNodes:radius:"];
        double v7 = 0;
LABEL_21:

        goto LABEL_22;
      }
      __p = 0;
      long long v26 = 0;
      uint64_t v27 = 0;
      unint64_t v13 = [(NSArray *)v6 count];
      if (v13) {
        _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE8__appendEm((char **)&__p, v13);
      }
      for (unint64_t j = 0; [(NSArray *)v6 count] > j; ++j)
      {
        v15 = [(NSArray *)v6 objectAtIndexedSubscript:j];
        [v15 position];
        *((_OWORD *)__p + j) = v16;
      }
      uint64_t v21 = __p;
      uint64_t v22 = [(NSArray *)v6 count];
      *(float *)&double v23 = radius;
      v20 = [(GKPath *)self initWithFloat3Points:v21 count:v22 radius:0 cyclical:v23];
    }
    self = v20;
    if (__p)
    {
      long long v26 = __p;
      operator delete(__p);
    }
    double v7 = self;
    goto LABEL_21;
  }
  [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"GKPath: must be initialized with 2 or more graph nodes.  Single node paths are not allowed"];
  self = [(GKPath *)self init];
  double v7 = self;
LABEL_22:

  return v7;
}

+ (GKPath)pathWithFloat3Points:(vector_float3 *)points count:(size_t)count radius:(float)radius cyclical:(BOOL)cyclical
{
  BOOL v6 = cyclical;
  v10 = [GKPath alloc];
  *(float *)&double v11 = radius;
  uint64_t v12 = [(GKPath *)v10 initWithFloat3Points:points count:count radius:v6 cyclical:v11];

  return v12;
}

- (GKPath)initWithFloat3Points:(vector_float3 *)points count:(size_t)count radius:(float)radius cyclical:(BOOL)cyclical
{
  BOOL v6 = cyclical;
  v30.receiver = self;
  v30.super_class = (Class)GKPath;
  v10 = [(GKPath *)&v30 init];
  double v11 = v10;
  if (count > 1)
  {
    if (!v10) {
      return v11;
    }
    uint64_t v27 = v10;
    if (count > 0x1555555555555555) {
      _ZNKSt3__16vectorI12GKCRTreeNodeI8NSObjectDv2_fENS_9allocatorIS4_EEE20__throw_length_errorB8ne180100Ev();
    }
    int v26 = v6;
    uint64_t v12 = (Vec3 *)operator new(12 * count);
    uint64_t v13 = 0;
    __p = v12;
    objc_super v29 = &v12[count];
    while (1)
    {
      v15 = &points[v13];
      __int32 v17 = v15->i32[0];
      __int32 v16 = v15->i32[1];
      __int32 v18 = v15->i32[2];
      if (v12 < v29)
      {
        LODWORD(v12->x) = v17;
        LODWORD(v12->y) = v16;
        uint64_t v14 = v12 + 1;
        LODWORD(v12->z) = v18;
      }
      else
      {
        unint64_t v19 = 0xAAAAAAAAAAAAAAABLL * (((char *)v12 - (char *)__p) >> 2) + 1;
        if (v19 > 0x1555555555555555) {
          _ZNKSt3__16vectorI12GKCRTreeNodeI8NSObjectDv2_fENS_9allocatorIS4_EEE20__throw_length_errorB8ne180100Ev();
        }
        if (0x5555555555555556 * (((char *)v29 - (char *)__p) >> 2) > v19) {
          unint64_t v19 = 0x5555555555555556 * (((char *)v29 - (char *)__p) >> 2);
        }
        if (0xAAAAAAAAAAAAAAABLL * (((char *)v29 - (char *)__p) >> 2) >= 0xAAAAAAAAAAAAAAALL) {
          unint64_t v20 = 0x1555555555555555;
        }
        else {
          unint64_t v20 = v19;
        }
        if (v20)
        {
          if (v20 > 0x1555555555555555) {
            std::__throw_bad_array_new_length[abi:ne180100]();
          }
          uint64_t v21 = (char *)operator new(12 * v20);
        }
        else
        {
          uint64_t v21 = 0;
        }
        uint64_t v22 = (Vec3 *)&v21[4 * (((char *)v12 - (char *)__p) >> 2)];
        LODWORD(v22->x) = v17;
        LODWORD(v22->y) = v16;
        LODWORD(v22->z) = v18;
        uint64_t v14 = v22 + 1;
        if (v12 == __p)
        {
          __p = (const Vec3 *)&v21[4 * (((char *)v12 - (char *)__p) >> 2)];
          objc_super v29 = (Vec3 *)&v21[12 * v20];
LABEL_24:
          operator delete(v12);
          goto LABEL_7;
        }
        do
        {
          uint64_t v23 = *(void *)&v12[-1].x;
          --v12;
          float z = v12->z;
          *(void *)&v22[-1].x = v23;
          --v22;
          v22->float z = z;
        }
        while (v12 != __p);
        uint64_t v12 = (Vec3 *)__p;
        __p = v22;
        objc_super v29 = (Vec3 *)&v21[12 * v20];
        if (v12) {
          goto LABEL_24;
        }
      }
LABEL_7:
      ++v13;
      uint64_t v12 = v14;
      if (v13 == count) {
        OpenSteer::PolylinePathway::initialize((OpenSteer::PolylinePathway *)[(GKPath *)v27 pathway], count, __p, radius, v26);
      }
    }
  }
  [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498] format:@"GKPathLessThanTwoPointsException: GKPaths MUST be initialized with 2 or more points.  Single point paths are not allowed"];
  return v11;
}

- (vector_float2)pointAtIndex:(NSUInteger)index
{
  NSUInteger v5 = [(GKPath *)self numPoints];
  vector_float2 result = 0;
  if (v5 > index)
  {
    NSUInteger v7 = index;
    __int32 v9 = *(_DWORD *)((void)[(GKPath *)self pathway][16] + v7 * 12);
    v8 = [(GKPath *)self pathway];
    result.i32[0] = v9;
    result.i32[1] = LODWORD(v8->points[v7].z);
  }
  return result;
}

- (vector_float2)float2AtIndex:(NSUInteger)index
{
  NSUInteger v5 = [(GKPath *)self numPoints];
  vector_float2 result = 0;
  if (v5 > index)
  {
    NSUInteger v7 = index;
    __int32 v9 = *(_DWORD *)((void)[(GKPath *)self pathway][16] + v7 * 12);
    v8 = [(GKPath *)self pathway];
    result.i32[0] = v9;
    result.i32[1] = LODWORD(v8->points[v7].z);
  }
  return result;
}

- (vector_float3)float3AtIndex:(NSUInteger)index
{
  NSUInteger v5 = [(GKPath *)self numPoints];
  if ((unint64_t)v5 > index)
  {
    [(GKPath *)self pathway];
    [(GKPath *)self pathway];
    NSUInteger v5 = [(GKPath *)self pathway];
  }
  result.i64[1] = v6;
  result.i64[0] = (uint64_t)v5;
  return result;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 1) = &unk_26E943368;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_DWORD *)self + 20) = 0;
  return self;
}

@end