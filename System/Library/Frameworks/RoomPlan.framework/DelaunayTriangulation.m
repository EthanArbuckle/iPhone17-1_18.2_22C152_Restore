@interface DelaunayTriangulation
+ (DelaunayTriangulation)shared;
- (id)computeTriangulation:(id)a3;
@end

@implementation DelaunayTriangulation

+ (DelaunayTriangulation)shared
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__DelaunayTriangulation_shared__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[DelaunayTriangulation shared]::onceToken[0] != -1) {
    dispatch_once(+[DelaunayTriangulation shared]::onceToken, block);
  }
  v2 = (void *)+[DelaunayTriangulation shared]::singleton;

  return (DelaunayTriangulation *)v2;
}

uint64_t __31__DelaunayTriangulation_shared__block_invoke()
{
  +[DelaunayTriangulation shared]::singleton = objc_opt_new();

  return MEMORY[0x270F9A758]();
}

- (id)computeTriangulation:(id)a3
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v38 = a3;
  v39 = objc_opt_new();
  __p = 0;
  v52 = 0;
  unint64_t v53 = 0;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v3 = v38;
  uint64_t v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v47, v54, 16, v38);
  if (v4)
  {
    uint64_t v5 = *(void *)v48;
    float32x2_t v6 = (float32x2_t)vdup_n_s32(0x47C35000u);
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v48 != v5) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v47 + 1) + 8 * i) value];
        int64x2_t v9 = vcvtq_s64_f64(vcvtq_f64_f32(vmul_f32(v8, v6)));
        v10 = v52;
        if ((unint64_t)v52 >= v53)
        {
          int64x2_t v40 = v9;
          v12 = (char *)__p;
          int64_t v13 = (v52 - (unsigned char *)__p) >> 4;
          unint64_t v14 = v13 + 1;
          if ((unint64_t)(v13 + 1) >> 60) {
            std::vector<PointInt64>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v15 = v53 - (void)__p;
          if ((uint64_t)(v53 - (void)__p) >> 3 > v14) {
            unint64_t v14 = v15 >> 3;
          }
          if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v16 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v16 = v14;
          }
          if (v16)
          {
            v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<PointInt64>>((uint64_t)&v53, v16);
            v12 = (char *)__p;
            v10 = v52;
          }
          else
          {
            v17 = 0;
          }
          v18 = (uint64_t *)&v17[16 * v13];
          *(int64x2_t *)v18 = v40;
          v11 = v18 + 2;
          if (v10 != v12)
          {
            do
            {
              *((_OWORD *)v18 - 1) = *((_OWORD *)v10 - 1);
              v18 -= 2;
              v10 -= 16;
            }
            while (v10 != v12);
            v12 = (char *)__p;
          }
          __p = v18;
          v52 = (char *)v11;
          unint64_t v53 = (unint64_t)&v17[16 * v16];
          if (v12) {
            operator delete(v12);
          }
        }
        else
        {
          *(int64x2_t *)v52 = v9;
          v11 = (uint64_t *)(v10 + 16);
        }
        v52 = (char *)v11;
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v47 objects:v54 count:16];
    }
    while (v4);
  }

  uint64_t v46 = 0;
  long long v44 = 0u;
  *(_OWORD *)v45 = 0u;
  *(_OWORD *)v42 = 0u;
  *(_OWORD *)v43 = 0u;
  boost::polygon::construct_voronoi<std::__wrap_iter<PointInt64 *>,boost::polygon::voronoi_diagram<double,boost::polygon::voronoi_diagram_traits<double>>>((uint64_t)__p, (uint64_t *)v52, v42);
  v19 = v43[1];
  for (j = (void *)v44; v19 != j; v19 += 4)
  {
    v20 = (uint64_t **)v19[2];
    uint64_t v21 = **v20;
    v22 = (uint64_t **)v20[4][2];
    uint64_t v23 = **v22;
    do
    {
      v22 = (uint64_t **)v22[4][2];
      uint64_t v24 = **v22;
      v25 = [DelaunayTriangle alloc];
      v26 = [v3 objectAtIndexedSubscript:v21];
      [v26 value];
      double v28 = v27;
      v29 = [v3 objectAtIndexedSubscript:v23];
      [v29 value];
      double v31 = v30;
      v32 = [v3 objectAtIndexedSubscript:v24];
      [v32 value];
      id v34 = [(DelaunayTriangle *)v25 initFirst:v28 second:v31 third:v33];

      [v34 area];
      if (v35 >= 0.00000011921) {
        [v39 addObject:v34];
      }

      uint64_t v23 = v24;
    }
    while (v24 != v21);
  }
  v36 = (void *)[v39 copy];
  if (v45[0])
  {
    v45[1] = v45[0];
    operator delete(v45[0]);
  }
  if (v43[1])
  {
    *(void **)&long long v44 = v43[1];
    operator delete(v43[1]);
  }
  if (v42[0])
  {
    v42[1] = v42[0];
    operator delete(v42[0]);
  }
  if (__p)
  {
    v52 = (char *)__p;
    operator delete(__p);
  }

  return v36;
}

@end