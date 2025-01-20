@interface GEOMapEdgeRoadFinder
- (BOOL)_checkEdgeForDuplicates:(const void *)a3;
- (GEOMapEdgeRoadFinder)initWithMap:(id)a3 center:(id)a4 radius:(double)a5;
- (id).cxx_construct;
- (void)_buildersInTile:(id)a3 localPoint:(const void *)a4 localRadiusSqr:(float)a5 localSearch:(const void *)a6 handler:(id)a7;
- (void)dealloc;
@end

@implementation GEOMapEdgeRoadFinder

- (GEOMapEdgeRoadFinder)initWithMap:(id)a3 center:(id)a4 radius:(double)a5
{
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v9 = a3;
  v14.receiver = self;
  v14.super_class = (Class)GEOMapEdgeRoadFinder;
  v10 = -[GEOMapEdgeFinder initWithMap:center:radius:](&v14, sel_initWithMap_center_radius_, v9, var0, var1, a5);
  if (v10)
  {
    uint64_t v11 = +[GEOMapTileFinder realisticTileFinderForMap:center:radius:](GEOMapTileFinder, "realisticTileFinderForMap:center:radius:", v9, var0, var1, a5);
    tileFinder = v10->super._tileFinder;
    v10->super._tileFinder = (GEOMapTileFinder *)v11;
  }
  return v10;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)GEOMapEdgeRoadFinder;
  [(GEOMapRequest *)&v2 dealloc];
}

- (void)_buildersInTile:(id)a3 localPoint:(const void *)a4 localRadiusSqr:(float)a5 localSearch:(const void *)a6 handler:(id)a7
{
  id v12 = a7;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __86__GEOMapEdgeRoadFinder__buildersInTile_localPoint_localRadiusSqr_localSearch_handler___block_invoke;
  v14[3] = &unk_1E53E6648;
  v16 = a6;
  v17 = a4;
  float v18 = a5;
  v14[4] = self;
  id v15 = v12;
  id v13 = v12;
  [a3 forEachRoad:v14];
}

void __86__GEOMapEdgeRoadFinder__buildersInTile_localPoint_localRadiusSqr_localSearch_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  v4 = [v3 feature];
  v5 = [v4 containingTile];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __86__GEOMapEdgeRoadFinder__buildersInTile_localPoint_localRadiusSqr_localSearch_handler___block_invoke_2;
  v13[3] = &unk_1E53E6620;
  uint64_t v6 = *(void *)(a1 + 32);
  long long v14 = *(_OWORD *)(a1 + 48);
  int v15 = *(_DWORD *)(a1 + 64);
  v13[4] = v6;
  v13[5] = &v16;
  [v5 forEachEdgeInRoad:v3 visitTwice:1 visitor:v13];

  if (*((unsigned char *)v17 + 24))
  {
    v7 = [GEOMapEdgeRoadBuilder alloc];
    v8 = [*(id *)(a1 + 32) map];
    id v9 = [(GEOMapEdgeRoadBuilder *)v7 initWithMap:v8 roadFeature:v3 shouldFlip:0];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    v10 = [GEOMapEdgeRoadBuilder alloc];
    uint64_t v11 = [*(id *)(a1 + 32) map];
    id v12 = [(GEOMapEdgeRoadBuilder *)v10 initWithMap:v11 roadFeature:v3 shouldFlip:1];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  _Block_object_dispose(&v16, 8);
}

void __86__GEOMapEdgeRoadFinder__buildersInTile_localPoint_localRadiusSqr_localSearch_handler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(int8x8_t **)(a1 + 32);
  unint64_t v5 = std::hash<GEORoadEdge * {__strong}>::operator()(v3);
  uint64_t v6 = v4 + 11;
  int8x8_t v7 = v4[12];
  if (v7)
  {
    unint64_t v8 = v5;
    uint8x8_t v9 = (uint8x8_t)vcnt_s8(v7);
    v9.i16[0] = vaddlv_u8(v9);
    unint64_t v10 = v9.u32[0];
    if (v9.u32[0] > 1uLL)
    {
      unint64_t v11 = v5;
      if (v5 >= *(void *)&v7) {
        unint64_t v11 = v5 % *(void *)&v7;
      }
    }
    else
    {
      unint64_t v11 = (*(void *)&v7 - 1) & v5;
    }
    id v12 = *(uint64_t ****)(*(void *)v6 + 8 * v11);
    if (v12)
    {
      for (i = *v12; i; i = (uint64_t **)*i)
      {
        unint64_t v14 = (unint64_t)i[1];
        if (v14 == v8)
        {
          if (std::equal_to<GEORoadEdge * {__strong}>::operator()(i[2], v3)) {
            goto LABEL_45;
          }
        }
        else
        {
          if (v10 > 1)
          {
            if (v14 >= *(void *)&v7) {
              v14 %= *(void *)&v7;
            }
          }
          else
          {
            v14 &= *(void *)&v7 - 1;
          }
          if (v14 != v11) {
            break;
          }
        }
      }
    }
  }
  id v15 = v3;
  uint64_t v50 = 0;
  uint64_t v16 = [v15 road];
  v17 = GEOMultiSectionFeaturePoints(v16, 0, &v50);

  unint64_t v18 = [v15 vertexIndexA];
  if (v18 >= [v15 vertexIndexB]) {
    uint64_t v19 = [v15 vertexIndexB];
  }
  else {
    uint64_t v19 = [v15 vertexIndexA];
  }
  unint64_t v20 = v19;
  unint64_t v21 = [v15 vertexIndexA];
  if (v21 >= [v15 vertexIndexB]) {
    unint64_t v22 = [v15 vertexIndexA];
  }
  else {
    unint64_t v22 = [v15 vertexIndexB];
  }
  float32x4_t v23 = (float32x4_t)xmmword_18A62BFC0;
  while (v20 <= v22)
  {
    v24.i64[0] = v17[v20];
    v24.i64[1] = v24.i64[0];
    v25.i32[0] = vmovn_s32(vcgtq_f32(v24, v23)).u32[0];
    v25.i32[1] = vmovn_s32(vcgtq_f32(v23, v24)).i32[1];
    float32x4_t v23 = (float32x4_t)vbslq_s8((int8x16_t)vmovl_s16(v25), (int8x16_t)v23, (int8x16_t)v24);
    ++v20;
  }
  float32x4_t v48 = v23;

  uint64_t v26 = 0;
  float32x4_t v49 = v48;
  uint64_t v27 = *(void *)(a1 + 48);
  char v28 = 1;
  while (v49.f32[v26 + 2] > *(float *)(v27 + 4 * v26) && v49.f32[v26] < *(float *)(v27 + 8 + 4 * v26))
  {
    char v29 = v28;
    char v28 = 0;
    uint64_t v26 = 1;
    if ((v29 & 1) == 0)
    {
      v30 = *(float **)(a1 + 56);
      float v31 = *(float *)(a1 + 64);
      id v32 = v15;
      uint64_t v50 = 0;
      v33 = [v32 road];
      v34 = GEOMultiSectionFeaturePoints(v33, 0, &v50);

      unint64_t v35 = [v32 vertexIndexA];
      if (v35 >= [v32 vertexIndexB]) {
        uint64_t v36 = [v32 vertexIndexB];
      }
      else {
        uint64_t v36 = [v32 vertexIndexA];
      }
      unint64_t v37 = v36;
      unint64_t v38 = objc_msgSend(v32, "vertexIndexA", *(_OWORD *)&v48, *(_OWORD *)&v49);
      if (v38 >= [v32 vertexIndexB]) {
        unint64_t v39 = [v32 vertexIndexA];
      }
      else {
        unint64_t v39 = [v32 vertexIndexB];
      }
      unint64_t v40 = v39;
      if (v37 <= v39) {
        unint64_t v41 = v39;
      }
      else {
        unint64_t v41 = v37;
      }
      v42 = (float *)&v34[v37 + 1];
      do
      {
        if (v41 == v37)
        {

          goto LABEL_45;
        }
        float v43 = gm::Matrix<float,2,1>::nearestPointOffsetAlongLineSegment<int,void>(v30, v42 - 2, v42);
        float v44 = *(v42 - 2);
        float v45 = *(v42 - 1);
        float v46 = *v42;
        float v47 = v42[1];
        v42 += 2;
        ++v37;
      }
      while ((float)((float)((float)((float)(*v30 - (float)(v44 + (float)((float)(v46 - v44) * v43)))
                                    * (float)(*v30 - (float)(v44 + (float)((float)(v46 - v44) * v43))))
                            + 0.0)
                    + (float)((float)(v30[1] - (float)(v45 + (float)((float)(v47 - v45) * v43)))
                            * (float)(v30[1] - (float)(v45 + (float)((float)(v47 - v45) * v43))))) > v31);

      if (v37 - 1 < v40) {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      }
      break;
    }
  }
LABEL_45:
}

- (BOOL)_checkEdgeForDuplicates:(const void *)a3
{
  if ((*(unsigned int (**)(void, SEL))(**(void **)a3 + 24))(*(void *)a3, a2)) {
    return 0;
  }
  unint64_t v8 = *(id **)(*(void *)a3 + 40);
  int8x8_t v7 = *(id **)(*(void *)a3 + 48);
  for (i = v7; ; int8x8_t v7 = i)
  {
    if (v8 == v7) {
      return 0;
    }
    id v9 = *v8;
    unint64_t v10 = [v9 road];

    if (!v10) {
      break;
    }
    unint64_t v11 = std::hash<GEORoadEdge * {__strong}>::operator()(v9);
    unint64_t v12 = v11;
    p_roadsConsidered = &self->_roadsConsidered;
    unint64_t value = self->_roadsConsidered.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
    if (value)
    {
      uint8x8_t v15 = (uint8x8_t)vcnt_s8((int8x8_t)value);
      v15.i16[0] = vaddlv_u8(v15);
      unint64_t v16 = v15.u32[0];
      if (v15.u32[0] > 1uLL)
      {
        unint64_t v3 = v11;
        if (v11 >= value) {
          unint64_t v3 = v11 % value;
        }
      }
      else
      {
        unint64_t v3 = (value - 1) & v11;
      }
      v17 = (uint64_t ***)p_roadsConsidered->__table_.__bucket_list_.__ptr_.__value_[v3];
      if (v17)
      {
        for (j = *v17; j; j = (uint64_t **)*j)
        {
          unint64_t v19 = (unint64_t)j[1];
          if (v19 == v12)
          {
            if (std::equal_to<GEORoadEdge * {__strong}>::operator()(j[2], v9)) {
              goto LABEL_87;
            }
          }
          else
          {
            if (v16 > 1)
            {
              if (v19 >= value) {
                v19 %= value;
              }
            }
            else
            {
              v19 &= value - 1;
            }
            if (v19 != v3) {
              break;
            }
          }
        }
      }
    }
    unint64_t v20 = operator new(0x18uLL);
    p_p1 = &self->_roadsConsidered.__table_.__p1_;
    *unint64_t v20 = 0;
    v20[1] = v12;
    id v22 = v9;
    v20[2] = v22;
    float v23 = (float)(self->_roadsConsidered.__table_.__p2_.__value_ + 1);
    float v24 = self->_roadsConsidered.__table_.__p3_.__value_;
    if (!value || (float)(v24 * (float)value) < v23)
    {
      BOOL v25 = (value & (value - 1)) != 0;
      if (value < 3) {
        BOOL v25 = 1;
      }
      unint64_t v26 = v25 | (2 * value);
      unint64_t v27 = vcvtps_u32_f32(v23 / v24);
      if (v26 <= v27) {
        int8x8_t prime = (int8x8_t)v27;
      }
      else {
        int8x8_t prime = (int8x8_t)v26;
      }
      if (*(void *)&prime == 1)
      {
        int8x8_t prime = (int8x8_t)2;
      }
      else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
      {
        int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
      }
      unint64_t value = self->_roadsConsidered.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
      if (*(void *)&prime <= value)
      {
        if (*(void *)&prime < value)
        {
          unint64_t v35 = vcvtps_u32_f32((float)self->_roadsConsidered.__table_.__p2_.__value_ / self->_roadsConsidered.__table_.__p3_.__value_);
          if (value < 3 || (uint8x8_t v36 = (uint8x8_t)vcnt_s8((int8x8_t)value), v36.i16[0] = vaddlv_u8(v36), v36.u32[0] > 1uLL))
          {
            unint64_t v35 = std::__next_prime(v35);
          }
          else
          {
            uint64_t v37 = 1 << -(char)__clz(v35 - 1);
            if (v35 >= 2) {
              unint64_t v35 = v37;
            }
          }
          if (*(void *)&prime <= v35) {
            int8x8_t prime = (int8x8_t)v35;
          }
          if (*(void *)&prime >= value)
          {
            unint64_t value = self->_roadsConsidered.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
          }
          else
          {
            if (prime) {
              goto LABEL_34;
            }
            float v43 = p_roadsConsidered->__table_.__bucket_list_.__ptr_.__value_;
            p_roadsConsidered->__table_.__bucket_list_.__ptr_.__value_ = 0;
            if (v43) {
              operator delete(v43);
            }
            unint64_t value = 0;
            self->_roadsConsidered.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_ = 0;
          }
        }
      }
      else
      {
LABEL_34:
        if (*(void *)&prime >> 61) {
          std::__throw_bad_array_new_length[abi:ne180100]();
        }
        char v29 = (void **)operator new(8 * *(void *)&prime);
        v30 = p_roadsConsidered->__table_.__bucket_list_.__ptr_.__value_;
        p_roadsConsidered->__table_.__bucket_list_.__ptr_.__value_ = v29;
        if (v30) {
          operator delete(v30);
        }
        uint64_t v31 = 0;
        self->_roadsConsidered.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_ = (unint64_t)prime;
        do
          p_roadsConsidered->__table_.__bucket_list_.__ptr_.__value_[v31++] = 0;
        while (*(void *)&prime != v31);
        next = p_p1->__value_.__next_;
        if (p_p1->__value_.__next_)
        {
          unint64_t v33 = next[1];
          uint8x8_t v34 = (uint8x8_t)vcnt_s8(prime);
          v34.i16[0] = vaddlv_u8(v34);
          if (v34.u32[0] > 1uLL)
          {
            if (v33 >= *(void *)&prime) {
              v33 %= *(void *)&prime;
            }
          }
          else
          {
            v33 &= *(void *)&prime - 1;
          }
          p_roadsConsidered->__table_.__bucket_list_.__ptr_.__value_[v33] = p_p1;
          unint64_t v38 = (void *)*next;
          if (*next)
          {
            do
            {
              unint64_t v39 = v38[1];
              if (v34.u32[0] > 1uLL)
              {
                if (v39 >= *(void *)&prime) {
                  v39 %= *(void *)&prime;
                }
              }
              else
              {
                v39 &= *(void *)&prime - 1;
              }
              if (v39 != v33)
              {
                if (!p_roadsConsidered->__table_.__bucket_list_.__ptr_.__value_[v39])
                {
                  p_roadsConsidered->__table_.__bucket_list_.__ptr_.__value_[v39] = next;
                  goto LABEL_59;
                }
                void *next = *v38;
                *unint64_t v38 = *(void *)p_roadsConsidered->__table_.__bucket_list_.__ptr_.__value_[v39];
                *(void *)p_roadsConsidered->__table_.__bucket_list_.__ptr_.__value_[v39] = v38;
                unint64_t v38 = next;
              }
              unint64_t v39 = v33;
LABEL_59:
              next = v38;
              unint64_t v38 = (void *)*v38;
              unint64_t v33 = v39;
            }
            while (v38);
          }
        }
        unint64_t value = (unint64_t)prime;
      }
      if ((value & (value - 1)) != 0)
      {
        if (v12 >= value) {
          unint64_t v3 = v12 % value;
        }
        else {
          unint64_t v3 = v12;
        }
      }
      else
      {
        unint64_t v3 = (value - 1) & v12;
      }
    }
    unint64_t v40 = p_roadsConsidered->__table_.__bucket_list_.__ptr_.__value_;
    unint64_t v41 = (void **)p_roadsConsidered->__table_.__bucket_list_.__ptr_.__value_[v3];
    if (v41)
    {
      *unint64_t v20 = *v41;
    }
    else
    {
      *unint64_t v20 = p_p1->__value_.__next_;
      p_p1->__value_.__next_ = v20;
      v40[v3] = p_p1;
      if (!*v20) {
        goto LABEL_77;
      }
      unint64_t v42 = *(void *)(*v20 + 8);
      if ((value & (value - 1)) != 0)
      {
        if (v42 >= value) {
          v42 %= value;
        }
      }
      else
      {
        v42 &= value - 1;
      }
      unint64_t v41 = &p_roadsConsidered->__table_.__bucket_list_.__ptr_.__value_[v42];
    }
    *unint64_t v41 = v20;
LABEL_77:
    ++self->_roadsConsidered.__table_.__p2_.__value_;

    ++v8;
  }
LABEL_87:

  return 1;
}

- (void).cxx_destruct
{
  p_roadsConsidered = &self->_roadsConsidered;
  next = (id *)self->_roadsConsidered.__table_.__p1_.__value_.__next_;
  if (next)
  {
    do
    {
      v4 = (id *)*next;

      operator delete(next);
      next = v4;
    }
    while (v4);
  }
  unint64_t value = p_roadsConsidered->__table_.__bucket_list_.__ptr_.__value_;
  p_roadsConsidered->__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (value)
  {
    operator delete(value);
  }
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 104) = 0u;
  *((_DWORD *)self + 30) = 1065353216;
  return self;
}

@end