@interface GEOMapAccessTransitLink
- (GEOMapAccessTransitLink)initWithMap:(id)a3 transitEdge:(shared_ptr<geo::MapEdgeTransit>)a4;
- (GEOMapTransitStop)stopFrom;
- (GEOMapTransitStop)stopTo;
- (NSString)description;
- (NSString)internalLineName;
- (double)distanceInMetersFrom:(id)a3 outClosestCoordinateOnLine:(id *)a4;
- (id).cxx_construct;
- (unint64_t)transitLineID;
- (unsigned)minimumTravelTime;
@end

@implementation GEOMapAccessTransitLink

- (GEOMapAccessTransitLink)initWithMap:(id)a3 transitEdge:(shared_ptr<geo::MapEdgeTransit>)a4
{
  ptr = a4.__ptr_;
  id v6 = a3;
  v7 = (std::__shared_weak_count *)*((void *)ptr + 1);
  v35 = *(MapEdgeTransit **)ptr;
  v36 = v7;
  if (v7) {
    atomic_fetch_add_explicit(&v7->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v34.receiver = self;
  v34.super_class = (Class)GEOMapAccessTransitLink;
  v8 = [(GEOMapAccessLine *)&v34 initWithMap:v6 edge:&v35];
  if (v36) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v36);
  }
  if (v8)
  {
    p_transitEdge = &v8->_transitEdge;
    v10 = *(MapEdgeTransit **)ptr;
    uint64_t v11 = *((void *)ptr + 1);
    if (v11) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v11 + 8), 1uLL, memory_order_relaxed);
    }
    cntrl = (std::__shared_weak_count *)v8->_transitEdge.__cntrl_;
    p_transitEdge->__ptr_ = v10;
    v8->_transitEdge.__cntrl_ = (__shared_weak_count *)v11;
    if (cntrl)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100](cntrl);
      v10 = p_transitEdge->__ptr_;
    }
    uint64_t v14 = *((void *)v10 + 1);
    v13 = (std::__shared_weak_count *)*((void *)v10 + 2);
    if (v13)
    {
      atomic_fetch_add_explicit(&v13->__shared_owners_, 1uLL, memory_order_relaxed);
      std::__shared_weak_count::__release_shared[abi:ne180100](v13);
    }
    if (v14)
    {
      v15 = [GEOMapAccessTransitStop alloc];
      map = v8->super._map;
      uint64_t v17 = *(void *)(*(void *)ptr + 8);
      v18 = *(std::__shared_weak_count **)(*(void *)ptr + 16);
      if (v18)
      {
        atomic_fetch_add_explicit(&v18->__shared_owners_, 1uLL, memory_order_relaxed);
        uint64_t v32 = v17;
        v33 = v18;
        atomic_fetch_add_explicit(&v18->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      else
      {
        uint64_t v32 = *(void *)(*(void *)ptr + 8);
        v33 = 0;
      }
      uint64_t v19 = [(GEOMapAccessTransitNodeBase *)v15 initWithMap:map node:&v32];
      stopFrom = v8->_stopFrom;
      v8->_stopFrom = (GEOMapTransitStop *)v19;

      if (v33) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v33);
      }
      if (v18) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v18);
      }
    }
    uint64_t v22 = *(void *)(*(void *)ptr + 24);
    v21 = *(std::__shared_weak_count **)(*(void *)ptr + 32);
    if (v21)
    {
      atomic_fetch_add_explicit(&v21->__shared_owners_, 1uLL, memory_order_relaxed);
      std::__shared_weak_count::__release_shared[abi:ne180100](v21);
    }
    if (v22)
    {
      v23 = [GEOMapAccessTransitStop alloc];
      v24 = v8->super._map;
      uint64_t v25 = *(void *)(*(void *)ptr + 24);
      v26 = *(std::__shared_weak_count **)(*(void *)ptr + 32);
      if (v26)
      {
        atomic_fetch_add_explicit(&v26->__shared_owners_, 1uLL, memory_order_relaxed);
        uint64_t v30 = v25;
        v31 = v26;
        atomic_fetch_add_explicit(&v26->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      else
      {
        uint64_t v30 = *(void *)(*(void *)ptr + 24);
        v31 = 0;
      }
      uint64_t v27 = [(GEOMapAccessTransitNodeBase *)v23 initWithMap:v24 node:&v30];
      stopTo = v8->_stopTo;
      v8->_stopTo = (GEOMapTransitStop *)v27;

      if (v31) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v31);
      }
      if (v26) {
        std::__shared_weak_count::__release_shared[abi:ne180100](v26);
      }
    }
  }

  return v8;
}

- (unint64_t)transitLineID
{
  return geo::MapEdgeTransit::lineID((geo::MapEdgeTransit *)self->_transitEdge.__ptr_);
}

- (NSString)internalLineName
{
  v2 = (*(void (**)(MapEdgeTransit *, SEL))(*(void *)self->_transitEdge.__ptr_ + 64))(self->_transitEdge.__ptr_, a2);
  uint64_t v3 = [v2 name];

  if (v3)
  {
    v4 = [NSString stringWithUTF8String:v3];
  }
  else
  {
    v4 = 0;
  }

  return (NSString *)v4;
}

- (unsigned)minimumTravelTime
{
  return *(_DWORD *)(*(void *)(*((void *)self->_transitEdge.__ptr_ + 6)
                               + ((*((void *)self->_transitEdge.__ptr_ + 9) >> 4) & 0xFFFFFFFFFFFFFF8))
                   + 32 * (*((void *)self->_transitEdge.__ptr_ + 9) & 0x7FLL)
                   + 24);
}

- (NSString)description
{
  v2 = NSString;
  (*(void (**)(void **__return_ptr))(*(void *)self->_transitEdge.__ptr_ + 88))(__p);
  if (v7 >= 0) {
    uint64_t v3 = __p;
  }
  else {
    uint64_t v3 = (void **)__p[0];
  }
  v4 = [v2 stringWithUTF8String:v3];
  if (v7 < 0) {
    operator delete(__p[0]);
  }

  return (NSString *)v4;
}

- (double)distanceInMetersFrom:(id)a3 outClosestCoordinateOnLine:(id *)a4
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  if (![(GEOMapAccessLine *)self coordinateCount]) {
    return 1.79769313e308;
  }
  if ([(GEOMapAccessLine *)self coordinateCount] == 1)
  {
    v10 = [(GEOMapAccessLine *)self coordinates];
    double v4 = v10->var0;
    double v5 = v10->var1;
    double v11 = GEOCalculateDistanceRadius(v10->var0, v5, var0, var1, 6367000.0);
  }
  else
  {
    double v11 = 1.79769313e308;
  }
  if ([(GEOMapAccessLine *)self coordinateCount] >= 2)
  {
    uint64_t v12 = 0;
    unint64_t v13 = 1;
    do
    {
      uint64_t v14 = [(GEOMapAccessLine *)self coordinates] + v12 * 16;
      v15 = [(GEOMapAccessLine *)self coordinates];
      double v18 = GEOClosestCoordinateOnLineSegmentFromCoordinate(v14->var0, v14->var1, v15[v12 + 1].var0, v15[v12 + 1].var1, var0, var1, v16, v17);
      double v20 = v19;
      double v21 = GEOCalculateDistanceRadius(var0, var1, v18, v19, 6367000.0);
      if (v21 < v11)
      {
        double v11 = v21;
        double v4 = v18;
        double v5 = v20;
      }
      ++v13;
      ++v12;
    }
    while (v13 < [(GEOMapAccessLine *)self coordinateCount]);
  }
  if (a4)
  {
    a4->double var0 = v4;
    a4->double var1 = v5;
  }
  return v11;
}

- (GEOMapTransitStop)stopFrom
{
  return self->_stopFrom;
}

- (GEOMapTransitStop)stopTo
{
  return self->_stopTo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stopTo, 0);
  objc_storeStrong((id *)&self->_stopFrom, 0);
  begin = self->_coords.__begin_;
  if (begin)
  {
    self->_coords.__end_ = begin;
    operator delete(begin);
  }
  cntrl = self->_transitEdge.__cntrl_;
  if (cntrl)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (id).cxx_construct
{
  *((void *)self + 7) = 0;
  *((void *)self + 8) = 0;
  *((void *)self + 10) = 0;
  *((void *)self + 11) = 0;
  *((void *)self + 9) = 0;
  return self;
}

@end