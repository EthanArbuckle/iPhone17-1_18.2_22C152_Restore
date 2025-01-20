@interface GEOMapEdgeTransitFinder
- (BOOL)_checkEdgeForDuplicates:(const void *)a3;
- (GEOMapEdgeTransitFinder)initWithMap:(id)a3 center:(id)a4 radius:(double)a5;
- (id).cxx_construct;
- (void)_buildersInTile:(id)a3 localPoint:(const void *)a4 localRadiusSqr:(float)a5 localSearch:(const void *)a6 handler:(id)a7;
@end

@implementation GEOMapEdgeTransitFinder

- (GEOMapEdgeTransitFinder)initWithMap:(id)a3 center:(id)a4 radius:(double)a5
{
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v9 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GEOMapEdgeTransitFinder;
  v10 = -[GEOMapEdgeFinder initWithMap:center:radius:](&v15, sel_initWithMap_center_radius_, v9, var0, var1, a5);
  if (v10)
  {
    v10->super._centerPoint.x = GEOTilePointForCoordinate(var0, var1, 20.0);
    v10->super._centerPoint.y = v11;
    v10->super._mapRadius = GEOMapPointsPerMeterAtLatitude(var0) * a5;
    uint64_t v12 = +[GEOMapTileFinder detailedTransitTileFinderForMap:center:radius:](GEOMapTileFinder, "detailedTransitTileFinderForMap:center:radius:", v9, var0, var1, a5);
    tileFinder = v10->super._tileFinder;
    v10->super._tileFinder = (GEOMapTileFinder *)v12;
  }
  return v10;
}

- (void)_buildersInTile:(id)a3 localPoint:(const void *)a4 localRadiusSqr:(float)a5 localSearch:(const void *)a6 handler:(id)a7
{
  id v11 = a3;
  id v38 = a7;
  unint64_t v41 = 0;
  id v39 = v11;
  while (v41 < [v11 transitLinkCount])
  {
    uint64_t v12 = [v11 transitLinks];
    v13 = [v12 objectAtIndex:v41];

    id v14 = v13;
    unint64_t v15 = 0;
    v46[0] = xmmword_18A62BFC0;
    uint64_t v45 = 0;
    while (v15 < [v14 sectionCount])
    {
      uint64_t v16 = GEOTransitLinkPoints(v14, v15, &v45);
      uint64_t v17 = v45;
      if (v45)
      {
        uint64_t v18 = 0;
        do
        {
          uint64_t v19 = 0;
          char v21 = 1;
          do
          {
            char v22 = v21;
            uint64_t v20 = v16 + 8 * v18;
            float v23 = *(float *)(v20 + 4 * v19);
            float v24 = *((float *)v46 + v19);
            if (v23 < v24) {
              float v24 = *(float *)(v20 + 4 * v19);
            }
            *((float *)v46 + v19) = v24;
            if (*((float *)v46 + v19 + 2) >= v23) {
              float v23 = *((float *)v46 + v19 + 2);
            }
            *((float *)v46 + v19 + 2) = v23;
            uint64_t v19 = 1;
            char v21 = 0;
          }
          while ((v22 & 1) != 0);
          ++v18;
        }
        while (v18 != v17);
      }
      ++v15;
    }

    uint64_t v25 = 0;
    long long v44 = v46[0];
    char v26 = 1;
    while (*((float *)&v44 + v25 + 2) > *((float *)a6 + v25))
    {
      char v27 = v26;
      if (*((float *)&v44 + v25) >= *((float *)a6 + v25 + 2)) {
        break;
      }
      char v26 = 0;
      uint64_t v25 = 1;
      if ((v27 & 1) == 0)
      {
        id v28 = v14;
        unint64_t v29 = 0;
        *(void *)&v46[0] = 0;
        v40 = v28;
        while (v29 < [v28 sectionCount])
        {
          v30 = (float *)(GEOTransitLinkPoints(v28, v29, v46) + 8);
          uint64_t v31 = -1;
          while ((unint64_t)++v31 < *(void *)&v46[0])
          {
            float v32 = gm::Matrix<float,2,1>::nearestPointOffsetAlongLineSegment<int,void>((float *)a4, v30 - 2, v30);
            float v33 = *(v30 - 2);
            float v34 = *(v30 - 1);
            float v35 = *v30;
            float v36 = v30[1];
            v30 += 2;
            if ((float)((float)((float)((float)(*(float *)a4 - (float)(v33 + (float)((float)(v35 - v33) * v32)))
                                       * (float)(*(float *)a4 - (float)(v33 + (float)((float)(v35 - v33) * v32))))
                               + 0.0)
                       + (float)((float)(*((float *)a4 + 1) - (float)(v34 + (float)((float)(v36 - v34) * v32)))
                               * (float)(*((float *)a4 + 1) - (float)(v34 + (float)((float)(v36 - v34) * v32))))) <= a5)
            {

              v42[0] = MEMORY[0x1E4F143A8];
              v42[1] = 3221225472;
              v42[2] = __89__GEOMapEdgeTransitFinder__buildersInTile_localPoint_localRadiusSqr_localSearch_handler___block_invoke;
              v42[3] = &unk_1E53D80E8;
              v42[4] = self;
              id v43 = v38;
              geo::TransitEdgePiece::findPiecesForLink(v40, v42);

              id v11 = v39;
              goto LABEL_26;
            }
          }
          ++v29;
          id v11 = v39;
          id v28 = v40;
        }

        break;
      }
    }
LABEL_26:

    ++v41;
  }
}

void __89__GEOMapEdgeTransitFinder__buildersInTile_localPoint_localRadiusSqr_localSearch_handler___block_invoke(uint64_t a1, uint64_t a2)
{
  v4 = (void *)(*(void *)(a1 + 32) + 88);
  unint64_t v5 = std::hash<geo::TransitEdgePiece>::operator()(a2);
  int8x8_t v6 = (int8x8_t)v4[1];
  if (v6)
  {
    unint64_t v7 = v5;
    uint8x8_t v8 = (uint8x8_t)vcnt_s8(v6);
    v8.i16[0] = vaddlv_u8(v8);
    unint64_t v9 = v8.u32[0];
    if (v8.u32[0] > 1uLL)
    {
      unint64_t v10 = v5;
      if (v5 >= *(void *)&v6) {
        unint64_t v10 = v5 % *(void *)&v6;
      }
    }
    else
    {
      unint64_t v10 = (*(void *)&v6 - 1) & v5;
    }
    id v11 = *(void **)(*v4 + 8 * v10);
    if (v11)
    {
      uint64_t v12 = (void *)*v11;
      if (*v11)
      {
        do
        {
          unint64_t v13 = v12[1];
          if (v13 == v7)
          {
            if (std::equal_to<geo::TransitEdgePiece>::operator()((uint64_t)(v12 + 2), a2)) {
              return;
            }
          }
          else
          {
            if (v9 > 1)
            {
              if (v13 >= *(void *)&v6) {
                v13 %= *(void *)&v6;
              }
            }
            else
            {
              v13 &= *(void *)&v6 - 1;
            }
            if (v13 != v10) {
              break;
            }
          }
          uint64_t v12 = (void *)*v12;
        }
        while (v12);
      }
    }
  }
  uint64_t v14 = *(void *)(a1 + 40);
  unint64_t v15 = [GEOMapEdgeTransitBuilder alloc];
  id v17 = [*(id *)(a1 + 32) map];
  uint64_t v16 = -[GEOMapEdgeTransitBuilder initWithMap:firstPiece:](v15, "initWithMap:firstPiece:");
  (*(void (**)(uint64_t, GEOMapEdgeTransitBuilder *))(v14 + 16))(v14, v16);
}

- (BOOL)_checkEdgeForDuplicates:(const void *)a3
{
  if ((*(unsigned int (**)(void, SEL))(**(void **)a3 + 24))(*(void *)a3, a2) == 1)
  {
    uint64_t v6 = *(void *)a3;
    uint64_t v7 = *(void *)(*(void *)a3 + 48);
    if (*(void *)(*(void *)a3 + 56) != v7)
    {
      unint64_t v8 = *(void *)(v6 + 72);
      unint64_t v9 = (void *)(v7 + 8 * (v8 >> 7));
      uint64_t v10 = *v9 + 32 * (v8 & 0x7F);
      uint64_t v11 = *(void *)(v7 + (((*(void *)(v6 + 80) + v8) >> 4) & 0xFFFFFFFFFFFFFF8))
          + 32 * ((*(void *)(v6 + 80) + v8) & 0x7F);
      if (v10 != v11)
      {
        p_piecesConsidered = &self->_piecesConsidered;
        p_p1 = &self->_piecesConsidered.__table_.__p1_;
        while (1)
        {
          unint64_t v14 = std::hash<geo::TransitEdgePiece>::operator()(v10);
          unint64_t v15 = v14;
          unint64_t value = p_piecesConsidered->__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
          if (value)
          {
            uint8x8_t v17 = (uint8x8_t)vcnt_s8((int8x8_t)value);
            v17.i16[0] = vaddlv_u8(v17);
            unint64_t v18 = v17.u32[0];
            if (v17.u32[0] > 1uLL)
            {
              unint64_t v3 = v14;
              if (v14 >= value) {
                unint64_t v3 = v14 % value;
              }
            }
            else
            {
              unint64_t v3 = (value - 1) & v14;
            }
            uint64_t v19 = p_piecesConsidered->__table_.__bucket_list_.__ptr_.__value_[v3];
            if (v19)
            {
              uint64_t v20 = (void *)*v19;
              if (*v19)
              {
                do
                {
                  unint64_t v21 = v20[1];
                  if (v21 == v15)
                  {
                    if (std::equal_to<geo::TransitEdgePiece>::operator()((uint64_t)(v20 + 2), v10)) {
                      return 1;
                    }
                  }
                  else
                  {
                    if (v18 > 1)
                    {
                      if (v21 >= value) {
                        v21 %= value;
                      }
                    }
                    else
                    {
                      v21 &= value - 1;
                    }
                    if (v21 != v3) {
                      break;
                    }
                  }
                  uint64_t v20 = (void *)*v20;
                }
                while (v20);
              }
            }
          }
          char v22 = operator new(0x30uLL);
          *char v22 = 0;
          v22[1] = v15;
          id v23 = *(id *)v10;
          uint64_t v24 = *(void *)(v10 + 8);
          uint64_t v25 = *(void **)(v10 + 16);
          v22[2] = v23;
          v22[3] = v24;
          v22[4] = v25;
          char v26 = *(unsigned char *)(v10 + 28);
          *((_DWORD *)v22 + 10) = *(_DWORD *)(v10 + 24);
          *((unsigned char *)v22 + 44) = v26;
          float v27 = (float)(p_piecesConsidered->__table_.__p2_.__value_ + 1);
          float v28 = p_piecesConsidered->__table_.__p3_.__value_;
          if (!value || (float)(v28 * (float)value) < v27) {
            break;
          }
LABEL_67:
          long long v44 = p_piecesConsidered->__table_.__bucket_list_.__ptr_.__value_;
          uint64_t v45 = (void **)p_piecesConsidered->__table_.__bucket_list_.__ptr_.__value_[v3];
          if (v45)
          {
            *char v22 = *v45;
LABEL_75:
            *uint64_t v45 = v22;
            goto LABEL_76;
          }
          *char v22 = p_p1->__value_.__next_;
          p_p1->__value_.__next_ = v22;
          v44[v3] = p_p1;
          if (*v22)
          {
            unint64_t v46 = *(void *)(*v22 + 8);
            if ((value & (value - 1)) != 0)
            {
              if (v46 >= value) {
                v46 %= value;
              }
            }
            else
            {
              v46 &= value - 1;
            }
            uint64_t v45 = &p_piecesConsidered->__table_.__bucket_list_.__ptr_.__value_[v46];
            goto LABEL_75;
          }
LABEL_76:
          ++p_piecesConsidered->__table_.__p2_.__value_;
          v10 += 32;
          if (v10 - *v9 == 4096)
          {
            uint64_t v47 = v9[1];
            ++v9;
            uint64_t v10 = v47;
          }
          if (v10 == v11) {
            return 0;
          }
        }
        BOOL v29 = (value & (value - 1)) != 0;
        if (value < 3) {
          BOOL v29 = 1;
        }
        unint64_t v30 = v29 | (2 * value);
        unint64_t v31 = vcvtps_u32_f32(v27 / v28);
        if (v30 <= v31) {
          int8x8_t prime = (int8x8_t)v31;
        }
        else {
          int8x8_t prime = (int8x8_t)v30;
        }
        if (*(void *)&prime == 1)
        {
          int8x8_t prime = (int8x8_t)2;
        }
        else if ((*(void *)&prime & (*(void *)&prime - 1)) != 0)
        {
          int8x8_t prime = (int8x8_t)std::__next_prime(*(void *)&prime);
        }
        unint64_t value = p_piecesConsidered->__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
        if (*(void *)&prime > value) {
          goto LABEL_33;
        }
        if (*(void *)&prime < value)
        {
          unint64_t v39 = vcvtps_u32_f32((float)p_piecesConsidered->__table_.__p2_.__value_ / p_piecesConsidered->__table_.__p3_.__value_);
          if (value < 3 || (uint8x8_t v40 = (uint8x8_t)vcnt_s8((int8x8_t)value), v40.i16[0] = vaddlv_u8(v40), v40.u32[0] > 1uLL))
          {
            unint64_t v39 = std::__next_prime(v39);
          }
          else
          {
            uint64_t v41 = 1 << -(char)__clz(v39 - 1);
            if (v39 >= 2) {
              unint64_t v39 = v41;
            }
          }
          if (*(void *)&prime <= v39) {
            int8x8_t prime = (int8x8_t)v39;
          }
          if (*(void *)&prime >= value)
          {
            unint64_t value = p_piecesConsidered->__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
          }
          else
          {
            if (prime)
            {
LABEL_33:
              if (*(void *)&prime >> 61) {
                std::__throw_bad_array_new_length[abi:ne180100]();
              }
              float v33 = (void **)operator new(8 * *(void *)&prime);
              float v34 = p_piecesConsidered->__table_.__bucket_list_.__ptr_.__value_;
              p_piecesConsidered->__table_.__bucket_list_.__ptr_.__value_ = v33;
              if (v34) {
                operator delete(v34);
              }
              uint64_t v35 = 0;
              p_piecesConsidered->__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_ = (unint64_t)prime;
              do
                p_piecesConsidered->__table_.__bucket_list_.__ptr_.__value_[v35++] = 0;
              while (*(void *)&prime != v35);
              next = p_p1->__value_.__next_;
              if (p_p1->__value_.__next_)
              {
                unint64_t v37 = next[1];
                uint8x8_t v38 = (uint8x8_t)vcnt_s8(prime);
                v38.i16[0] = vaddlv_u8(v38);
                if (v38.u32[0] > 1uLL)
                {
                  if (v37 >= *(void *)&prime) {
                    v37 %= *(void *)&prime;
                  }
                }
                else
                {
                  v37 &= *(void *)&prime - 1;
                }
                p_piecesConsidered->__table_.__bucket_list_.__ptr_.__value_[v37] = p_p1;
                v42 = (void *)*next;
                if (*next)
                {
                  do
                  {
                    unint64_t v43 = v42[1];
                    if (v38.u32[0] > 1uLL)
                    {
                      if (v43 >= *(void *)&prime) {
                        v43 %= *(void *)&prime;
                      }
                    }
                    else
                    {
                      v43 &= *(void *)&prime - 1;
                    }
                    if (v43 != v37)
                    {
                      if (!p_piecesConsidered->__table_.__bucket_list_.__ptr_.__value_[v43])
                      {
                        p_piecesConsidered->__table_.__bucket_list_.__ptr_.__value_[v43] = next;
                        goto LABEL_58;
                      }
                      void *next = *v42;
                      void *v42 = *(void *)p_piecesConsidered->__table_.__bucket_list_.__ptr_.__value_[v43];
                      *(void *)p_piecesConsidered->__table_.__bucket_list_.__ptr_.__value_[v43] = v42;
                      v42 = next;
                    }
                    unint64_t v43 = v37;
LABEL_58:
                    next = v42;
                    v42 = (void *)*v42;
                    unint64_t v37 = v43;
                  }
                  while (v42);
                }
              }
              unint64_t value = (unint64_t)prime;
              goto LABEL_62;
            }
            v48 = p_piecesConsidered->__table_.__bucket_list_.__ptr_.__value_;
            p_piecesConsidered->__table_.__bucket_list_.__ptr_.__value_ = 0;
            if (v48) {
              operator delete(v48);
            }
            unint64_t value = 0;
            p_piecesConsidered->__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_ = 0;
          }
        }
LABEL_62:
        if ((value & (value - 1)) != 0)
        {
          if (v15 >= value) {
            unint64_t v3 = v15 % value;
          }
          else {
            unint64_t v3 = v15;
          }
        }
        else
        {
          unint64_t v3 = (value - 1) & v15;
        }
        goto LABEL_67;
      }
    }
  }
  return 0;
}

- (void).cxx_destruct
{
  p_piecesConsidered = &self->_piecesConsidered;
  next = (id *)self->_piecesConsidered.__table_.__p1_.__value_.__next_;
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
  unint64_t value = p_piecesConsidered->__table_.__bucket_list_.__ptr_.__value_;
  p_piecesConsidered->__table_.__bucket_list_.__ptr_.__value_ = 0;
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