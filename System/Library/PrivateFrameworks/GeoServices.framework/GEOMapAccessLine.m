@interface GEOMapAccessLine
- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinates;
- (GEOMapAccessLine)initWithMap:(id)a3 edge:(shared_ptr<geo::MapEdge>)a4;
- (double)distanceFromCoordinate:(id)a3 outSegmentCoordinate:(PolylineCoordinate *)a4;
- (double)length;
- (id).cxx_construct;
- (unint64_t)coordinateCount;
@end

@implementation GEOMapAccessLine

- (GEOMapAccessLine)initWithMap:(id)a3 edge:(shared_ptr<geo::MapEdge>)a4
{
  ptr = a4.__ptr_;
  id v7 = a3;
  v18.receiver = self;
  v18.super_class = (Class)GEOMapAccessLine;
  v8 = [(GEOMapAccessLine *)&v18 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_map, a3);
    v11 = *(MapEdge **)ptr;
    uint64_t v10 = *((void *)ptr + 1);
    if (v10) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v10 + 8), 1uLL, memory_order_relaxed);
    }
    cntrl = (std::__shared_weak_count *)v9->_edge.__cntrl_;
    v9->_edge.__ptr_ = v11;
    v9->_edge.__cntrl_ = (__shared_weak_count *)v10;
    if (cntrl) {
      std::__shared_weak_count::__release_shared[abi:ne180100](cntrl);
    }
    (*(void (**)(long long *__return_ptr))(**(void **)ptr + 48))(&v16);
    begin = v9->_coordinates.__begin_;
    if (begin)
    {
      v9->_coordinates.__end_ = begin;
      operator delete(begin);
      v9->_coordinates.__begin_ = 0;
      v9->_coordinates.__end_ = 0;
      v9->_coordinates.__end_cap_.__value_ = 0;
    }
    *(_OWORD *)&v9->_coordinates.__begin_ = v16;
    v9->_coordinates.__end_cap_.__value_ = v17;
    v14 = v9;
  }

  return v9;
}

- (unint64_t)coordinateCount
{
  return (self->_coordinates.__end_ - self->_coordinates.__begin_) >> 4;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinates
{
  return ($F24F406B2B787EFB06265DBA3D28CBD5 *)self->_coordinates.__begin_;
}

- (double)length
{
  (*(void (**)(void))(*(void *)self->_edge.__ptr_ + 56))();
  return result;
}

- (double)distanceFromCoordinate:(id)a3 outSegmentCoordinate:(PolylineCoordinate *)a4
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  unsigned int v8 = [(GEOMapAccessLine *)self coordinateCount];
  if (!v8)
  {
    if (a4) {
      *a4 = (PolylineCoordinate)0xBF80000000000000;
    }
    return 1.79769313e308;
  }
  v9 = [(GEOMapAccessLine *)self coordinates];
  v12 = v9;
  if (v8 != 1)
  {
    uint64_t v17 = 0;
    double v16 = 1.79769313e308;
    double v18 = v9->var0;
    double v19 = v9->var1;
    uint64_t v20 = v8 - 1;
    p_double var1 = &v9[1].var1;
    double v38 = -180.0;
    unsigned int v22 = -1;
    double v37 = -180.0;
    do
    {
      double v23 = v18;
      double v24 = v19;
      double v18 = *(p_var1 - 1);
      double v19 = *p_var1;
      double v25 = GEOClosestCoordinateOnLineSegmentFromCoordinate3D(v23, v24, 1.79769313e308, v18, *p_var1, 1.79769313e308, v10, v11, var0, var1);
      double v27 = v26;
      double v28 = GEOCalculateDistanceRadius(var0, var1, v25, v26, 6367000.0);
      if (v16 > v28)
      {
        double v37 = v27;
        double v38 = v25;
        unsigned int v22 = v17;
        double v16 = v28;
      }
      ++v17;
      p_var1 += 2;
    }
    while (v20 != v17);
    if (!a4) {
      return v16;
    }
    double v29 = v12[v22].var0;
    double v30 = v12[v22 + 1].var0;
    if (vabdd_f64(v29, v30) <= 0.0000005)
    {
      double v33 = v12[v22].var1;
      double v34 = v12[v22 + 1].var1;
      double v35 = 0.0;
      if (vabdd_f64(v33, v34) <= 0.0000005)
      {
LABEL_21:
        float v36 = v35;
        if (v36 < 0.0) {
          float v36 = 0.0;
        }
        if (v36 > 1.0) {
          float v36 = 1.0;
        }
        a4->index = v22;
        a4->offset = v36;
        return v16;
      }
      double v31 = v37 - v33;
      double v32 = v34 - v33;
    }
    else
    {
      double v31 = v38 - v29;
      double v32 = v30 - v29;
    }
    double v35 = v31 / v32;
    goto LABEL_21;
  }
  if (a4) {
    *a4 = 0;
  }
  double v13 = v9->var0;
  double v14 = v9->var1;

  return GEOCalculateDistanceRadius(v13, v14, var0, var1, 6367000.0);
}

- (void).cxx_destruct
{
  begin = self->_coordinates.__begin_;
  if (begin)
  {
    self->_coordinates.__end_ = begin;
    operator delete(begin);
  }
  cntrl = self->_edge.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }

  objc_storeStrong((id *)&self->_map, 0);
}

- (id).cxx_construct
{
  *((void *)self + 6) = 0;
  *((_OWORD *)self + 1) = 0u;
  *((_OWORD *)self + 2) = 0u;
  return self;
}

@end