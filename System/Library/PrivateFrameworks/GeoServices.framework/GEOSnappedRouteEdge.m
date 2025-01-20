@interface GEOSnappedRouteEdge
- (BOOL)clippedBack;
- (BOOL)clippedFront;
- (GEOMultiSectionFeature)feature;
- (GEOSnappedRouteEdge)initWithRoadPath:(const void *)a3 sectionRect:(id *)a4;
- (GeoCodecsVectorTilePoint)points;
- (PolylineCoordinate)routeOffsetA;
- (PolylineCoordinate)routeOffsetB;
- (PolylineCoordinate)routeOffsets;
- (id).cxx_construct;
- (id)description;
- (shared_ptr<geo::MapEdgeRoad>)mapEdge;
- (unint64_t)mapEdgeOffset;
- (unint64_t)pointCount;
- (void)calculateRouteOffsetsBetweenA:(PolylineCoordinate)a3 andB:(PolylineCoordinate)a4 overLength:(float)a5 onRoute:(id)a6;
@end

@implementation GEOSnappedRouteEdge

- (GEOSnappedRouteEdge)initWithRoadPath:(const void *)a3 sectionRect:(id *)a4
{
  v103.receiver = self;
  v103.super_class = (Class)GEOSnappedRouteEdge;
  v6 = [(GEOSnappedRouteEdge *)&v103 init];
  v7 = (GEOSnappedRouteEdge *)v6;
  if (v6)
  {
    $F24F406B2B787EFB06265DBA3D28CBD5 var0 = a4->var0;
    *($F24F406B2B787EFB06265DBA3D28CBD5 *)(v6 + 24) = a4->var1;
    *($F24F406B2B787EFB06265DBA3D28CBD5 *)(v6 + 8) = var0;
    v9 = (MapEdgeRoad *)*((void *)a3 + 3);
    uint64_t v10 = *((void *)a3 + 4);
    if (v10)
    {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v10 + 8), 1uLL, memory_order_relaxed);
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v10 + 8), 1uLL, memory_order_relaxed);
    }
    v11 = (std::__shared_weak_count *)*((void *)v6 + 6);
    v7->_mapEdge.__ptr_ = v9;
    v7->_mapEdge.__cntrl_ = (__shared_weak_count *)v10;
    v93 = (std::__shared_weak_count *)v10;
    if (v11) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v11);
    }
    v12 = (zilch::GeoPolyline *)((char *)a3 + 40);
    unint64_t v13 = zilch::GeoPolyline::size((zilch::GeoPolyline *)((char *)a3 + 40));
    unint64_t v14 = v13;
    p_begin = (void **)&v7->_points.__begin_;
    begin = v7->_points.__begin_;
    uint64_t p_end_cap = (uint64_t)&v7->_points.__end_cap_;
    if (v13 > v7->_points.__end_cap_.__value_ - begin)
    {
      if (v13 >> 61) {
        std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
      }
      end = v7->_points.__end_;
      v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zilch::StringList::Entry>>(p_end_cap, v13);
      v19 = (GeoCodecsVectorTilePoint *)&v18[((char *)end - (char *)begin) & 0xFFFFFFFFFFFFFFF8];
      v21 = (GeoCodecsVectorTilePoint *)&v18[8 * v20];
      v23 = v7->_points.__begin_;
      v22 = v7->_points.__end_;
      v24 = v19;
      if (v22 != v23)
      {
        do
        {
          GeoCodecsVectorTilePoint v25 = v22[-1];
          --v22;
          v24[-1] = v25;
          --v24;
        }
        while (v22 != v23);
        v22 = (GeoCodecsVectorTilePoint *)*p_begin;
      }
      v7->_points.__begin_ = v24;
      v7->_points.__end_ = v19;
      v7->_points.__end_cap_.__value_ = v21;
      if (v22) {
        operator delete(v22);
      }
    }
    v26 = v7->_routeOffsets.__begin_;
    if (v14 > v7->_routeOffsets.__end_cap_.__value_ - v26)
    {
      if (v14 >> 61) {
        std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
      }
      v27 = v7->_routeOffsets.__end_;
      v28 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zilch::StringList::Entry>>((uint64_t)&v7->_routeOffsets.__end_cap_, v14);
      v29 = (PolylineCoordinate *)&v28[((char *)v27 - (char *)v26) & 0xFFFFFFFFFFFFFFF8];
      v31 = (PolylineCoordinate *)&v28[8 * v30];
      v33 = v7->_routeOffsets.__begin_;
      v32 = v7->_routeOffsets.__end_;
      v34 = v29;
      if (v32 != v33)
      {
        do
        {
          PolylineCoordinate v35 = v32[-1];
          --v32;
          v34[-1] = v35;
          --v34;
        }
        while (v32 != v33);
        v32 = v7->_routeOffsets.__begin_;
      }
      v7->_routeOffsets.__begin_ = v34;
      v7->_routeOffsets.__end_ = v29;
      v7->_routeOffsets.__end_cap_.__value_ = v31;
      if (v32) {
        operator delete(v32);
      }
    }
    (*(void (**)(void **__return_ptr))(*(void *)v7->_mapEdge.__ptr_ + 48))(&__p);
    v94 = (double *)__p;
    v95 = v102;
    if (v14)
    {
      unint64_t v36 = 0;
      while (1)
      {
        Point = (zilch::GeoCoordinates *)zilch::GeoPolyline::getPoint(v12, v36);
        v99.i32[0] = zilch::GeoCoordinates::y(Point);
        double v39 = zilch::Latitude::toDegrees((zilch::Latitude *)&v99, v38);
        int v100 = zilch::GeoCoordinates::x(Point);
        double v41 = zilch::Longitude::toDegrees((zilch::Longitude *)&v100, v40);
        double v43 = GEOTilePointForCoordinate(v39, v41, 20.0);
        v44.f64[0] = a4->var0.var0;
        v45.f64[1] = a4->var1.var1;
        v45.f64[0] = v43;
        v44.f64[1] = v46 - a4->var0.var1;
        float32x2_t v47 = vcvt_f32_f64(vdivq_f64(vsubq_f64(v45, v44), (float64x2_t)a4->var1));
        v49 = (char *)v7->_points.__end_;
        value = v7->_points.__end_cap_.__value_;
        if (v49 >= (char *)value)
        {
          v42 = (char *)*p_begin;
          uint64_t v51 = (v49 - (unsigned char *)*p_begin) >> 3;
          unint64_t v52 = v51 + 1;
          if ((unint64_t)(v51 + 1) >> 61) {
            std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v53 = (char *)value - v42;
          if (v53 >> 2 > v52) {
            unint64_t v52 = v53 >> 2;
          }
          if ((unint64_t)v53 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v54 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v54 = v52;
          }
          if (v54)
          {
            v55 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zilch::StringList::Entry>>(p_end_cap, v54);
            v42 = (char *)v7->_points.__begin_;
            v49 = (char *)v7->_points.__end_;
          }
          else
          {
            v55 = 0;
          }
          v56 = (GeoCodecsVectorTilePoint *)&v55[8 * v51];
          GeoCodecsVectorTilePoint *v56 = (GeoCodecsVectorTilePoint)v47;
          v50 = v56 + 1;
          if (v49 != v42)
          {
            do
            {
              GeoCodecsVectorTilePoint v57 = (GeoCodecsVectorTilePoint)*((void *)v49 - 1);
              v49 -= 8;
              v56[-1] = v57;
              --v56;
            }
            while (v49 != v42);
            v42 = (char *)*p_begin;
          }
          v7->_points.__begin_ = v56;
          v7->_points.__end_ = v50;
          v7->_points.__end_cap_.__value_ = (GeoCodecsVectorTilePoint *)&v55[8 * v54];
          if (v42) {
            operator delete(v42);
          }
        }
        else
        {
          *(float32x2_t *)v49 = v47;
          v50 = (GeoCodecsVectorTilePoint *)(v49 + 8);
        }
        v7->_points.__end_ = v50;
        if (!v36) {
          break;
        }
        if (v36 == v14 - 1)
        {
          v58 = v102;
          v59 = (zilch::Latitude *)zilch::Longitude::fromDegrees((zilch::Longitude *)v42, *(v102 - 1));
          unsigned int v60 = v59;
          unsigned int v61 = zilch::Latitude::fromDegrees(v59, *(v58 - 2));
          v62.$F24F406B2B787EFB06265DBA3D28CBD5 var0 = v60;
          v63.$F24F406B2B787EFB06265DBA3D28CBD5 var0 = v61;
          zilch::GeoCoordinates::GeoCoordinates((uint64_t)&v99, v62, v63);
          unsigned int v64 = zilch::GeoCoordinates::distanceTo(Point, (const zilch::GeoCoordinates *)&v99);
          p_clippedBack = &v7->_clippedBack;
LABEL_42:
          BOOL *p_clippedBack = v64 > 1;
        }
        if (++v36 == v14) {
          goto LABEL_44;
        }
      }
      v66 = (double *)__p;
      v67 = (zilch::Latitude *)zilch::Longitude::fromDegrees((zilch::Longitude *)v42, *((double *)__p + 1));
      unsigned int v68 = v67;
      unsigned int v69 = zilch::Latitude::fromDegrees(v67, *v66);
      v70.$F24F406B2B787EFB06265DBA3D28CBD5 var0 = v68;
      v71.$F24F406B2B787EFB06265DBA3D28CBD5 var0 = v69;
      zilch::GeoCoordinates::GeoCoordinates((uint64_t)&v99, v70, v71);
      unsigned int v64 = zilch::GeoCoordinates::distanceTo(Point, (const zilch::GeoCoordinates *)&v99);
      p_clippedBack = &v7->_clippedFront;
      goto LABEL_42;
    }
LABEL_44:
    v7->_mapEdgeOffset = 0;
    if (v7->_clippedFront)
    {
      unint64_t v72 = (char *)v95 - (char *)v94;
      unint64_t v73 = ((char *)v95 - (char *)v94) >> 4;
      if (v7->_clippedBack)
      {
        if (v72 >= 0x10)
        {
          if ((v72 & 0x8000000000000000) != 0) {
            std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
          }
          v74 = (float32x2_t *)operator new(8 * v73);
        }
        else
        {
          v74 = 0;
        }
        if (v95 != v94)
        {
          if (v73 <= 1) {
            uint64_t v75 = 1;
          }
          else {
            uint64_t v75 = ((char *)v95 - (char *)v94) >> 4;
          }
          double var1 = a4->var0.var1;
          $F24F406B2B787EFB06265DBA3D28CBD5 v97 = a4->var1;
          double v98 = a4->var0.var0;
          v77 = (double *)((char *)__p + 8);
          v78 = v74;
          do
          {
            double v79 = GEOTilePointForCoordinate(*(v77 - 1), *v77, 20.0);
            v80.f64[1] = v97.var1;
            v80.f64[0] = v79;
            v81.f64[0] = v98;
            v81.f64[1] = v82 - var1;
            *v78++ = vcvt_f32_f64(vdivq_f64(vsubq_f64(v80, v81), (float64x2_t)v97));
            v77 += 2;
            --v75;
          }
          while (v75);
        }
        v83 = (zilch::GeoCoordinates *)zilch::GeoPolyline::getPoint(v12, 0);
        v99.i32[0] = zilch::GeoCoordinates::y(v83);
        double v85 = zilch::Latitude::toDegrees((zilch::Latitude *)&v99, v84);
        int v100 = zilch::GeoCoordinates::x(v83);
        double v87 = zilch::Longitude::toDegrees((zilch::Longitude *)&v100, v86);
        double v88 = GEOTilePointForCoordinate(v85, v87, 20.0);
        v89.f64[0] = a4->var0.var0;
        v90.f64[1] = a4->var1.var1;
        v90.f64[0] = v88;
        v89.f64[1] = v91 - a4->var0.var1;
        float32x2_t v99 = vcvt_f32_f64(vdivq_f64(vsubq_f64(v90, v89), (float64x2_t)a4->var1));
        int v100 = 0;
        gm::Matrix<float,2,1>::distanceSquaredToPolyline<int,void>((float *)&v99, v73 - v14 + 1, (uint64_t)v74, &v7->_mapEdgeOffset, (float *)&v100);
        if (v74) {
          operator delete(v74);
        }
      }
      else
      {
        v7->_mapEdgeOffset = v73 - v14;
      }
    }
    if (__p)
    {
      v102 = (double *)__p;
      operator delete(__p);
    }
    if (v93) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v93);
    }
  }
  return v7;
}

- (void)calculateRouteOffsetsBetweenA:(PolylineCoordinate)a3 andB:(PolylineCoordinate)a4 overLength:(float)a5 onRoute:(id)a6
{
  PolylineCoordinate v81 = a4;
  id v79 = a6;
  begin = self->_points.__begin_;
  end = self->_points.__end_;
  if ((unint64_t)((char *)end - (char *)begin) < 9)
  {
    uint64_t v10 = 0;
    v18 = 0;
    float v14 = 0.0;
  }
  else
  {
    uint64_t v10 = 0;
    v11 = 0;
    v12 = 0;
    unint64_t v13 = 1;
    float v14 = 0.0;
    do
    {
      v15 = (float *)&begin[v13];
      float v16 = *(v15 - 1) - v15[1];
      float v17 = sqrtf((float)((float)((float)(*(v15 - 2) - *v15) * (float)(*(v15 - 2) - *v15)) + 0.0) + (float)(v16 * v16));
      if (v11 >= v12)
      {
        uint64_t v19 = v11 - v10;
        unint64_t v20 = v19 + 1;
        if ((unint64_t)(v19 + 1) >> 62) {
          std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
        }
        if (((char *)v12 - (char *)v10) >> 1 > v20) {
          unint64_t v20 = ((char *)v12 - (char *)v10) >> 1;
        }
        if ((unint64_t)((char *)v12 - (char *)v10) >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v21 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v21 = v20;
        }
        if (v21)
        {
          if (v21 >> 62) {
            std::__throw_bad_array_new_length[abi:ne180100]();
          }
          v22 = (char *)operator new(4 * v21);
        }
        else
        {
          v22 = 0;
        }
        v23 = (float *)&v22[4 * v19];
        float *v23 = v17;
        v18 = v23 + 1;
        while (v11 != v10)
        {
          int v24 = *((_DWORD *)v11-- - 1);
          *((_DWORD *)v23-- - 1) = v24;
        }
        v12 = (float *)&v22[4 * v21];
        if (v10)
        {
          operator delete(v10);
          begin = self->_points.__begin_;
          end = self->_points.__end_;
        }
        uint64_t v10 = v23;
      }
      else
      {
        float *v11 = v17;
        v18 = v11 + 1;
      }
      float v14 = v14 + v17;
      ++v13;
      v11 = v18;
    }
    while (v13 < end - begin);
  }
  __asm { FMOV            V1.2D, #0.5 }
  $D4775485B13497D55C4F339E01923D43 size = self->_localBounds.size;
  float64x2_t v30 = vaddq_f64((float64x2_t)self->_localBounds.origin, vmulq_f64((float64x2_t)size, _Q1));
  double v31 = GEOCoordinate2DForMapPoint(v30.f64[0], v30.f64[1]);
  double v32 = GEOMapPointsPerMeterAtLatitude(v31);
  uint64_t p_end_cap = &self->_routeOffsets.__end_cap_;
  value = self->_routeOffsets.__end_cap_.__value_;
  p_routeOffsets = &self->_routeOffsets;
  unint64_t v36 = self->_routeOffsets.__end_;
  if (v36 >= value)
  {
    uint64_t v38 = v36 - p_routeOffsets->__begin_;
    if ((unint64_t)(v38 + 1) >> 61) {
      goto LABEL_90;
    }
    uint64_t v39 = (char *)value - (char *)p_routeOffsets->__begin_;
    uint64_t v40 = v39 >> 2;
    if (v39 >> 2 <= (unint64_t)(v38 + 1)) {
      uint64_t v40 = v38 + 1;
    }
    if ((unint64_t)v39 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v41 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v41 = v40;
    }
    if (v41) {
      v42 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zilch::StringList::Entry>>((uint64_t)&self->_routeOffsets.__end_cap_, v41);
    }
    else {
      v42 = 0;
    }
    double v43 = (PolylineCoordinate *)&v42[8 * v38];
    float64x2_t v44 = (PolylineCoordinate *)&v42[8 * v41];
    *double v43 = a3;
    v37 = v43 + 1;
    double v46 = self->_routeOffsets.__begin_;
    float64x2_t v45 = self->_routeOffsets.__end_;
    if (v45 != v46)
    {
      do
      {
        PolylineCoordinate v47 = v45[-1];
        --v45;
        v43[-1] = v47;
        --v43;
      }
      while (v45 != v46);
      float64x2_t v45 = p_routeOffsets->__begin_;
    }
    self->_routeOffsets.__begin_ = v43;
    self->_routeOffsets.__end_ = v37;
    self->_routeOffsets.__end_cap_.__value_ = v44;
    if (v45) {
      operator delete(v45);
    }
  }
  else
  {
    *unint64_t v36 = a3;
    v37 = v36 + 1;
  }
  self->_routeOffsets.__end_ = v37;
  if ((char *)v18 - (char *)v10 != 4)
  {
    uint64_t v48 = 0;
    float v49 = a5 / v14;
    double v50 = v32 / size.width;
    double v51 = v49;
    if ((unint64_t)(v18 - v10 - 1) <= 1) {
      uint64_t v52 = 1;
    }
    else {
      uint64_t v52 = v18 - v10 - 1;
    }
    do
    {
      uint64_t v53 = objc_msgSend(v79, "coordinateAtOffset:fromRouteCoordinate:", *(void *)&p_routeOffsets->__begin_[v48], v10[v48] / v50 * v51, size);
      uint64_t v80 = v53;
      if (v81.index > v53 || v81.index == v53 && v81.offset > *((float *)&v53 + 1)) {
        unint64_t v54 = (PolylineCoordinate *)&v80;
      }
      else {
        unint64_t v54 = &v81;
      }
      v56 = self->_routeOffsets.__end_;
      v55 = self->_routeOffsets.__end_cap_.__value_;
      if (v56 >= v55)
      {
        uint64_t v57 = v56 - p_routeOffsets->__begin_;
        if ((unint64_t)(v57 + 1) >> 61) {
          std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v58 = (char *)v55 - (char *)p_routeOffsets->__begin_;
        uint64_t v59 = v58 >> 2;
        if (v58 >> 2 <= (unint64_t)(v57 + 1)) {
          uint64_t v59 = v57 + 1;
        }
        if ((unint64_t)v58 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v60 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v60 = v59;
        }
        if (v60) {
          unsigned int v61 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zilch::StringList::Entry>>((uint64_t)&self->_routeOffsets.__end_cap_, v60);
        }
        else {
          unsigned int v61 = 0;
        }
        Longitude v62 = (PolylineCoordinate *)&v61[8 * v57];
        *Longitude v62 = *v54;
        v37 = v62 + 1;
        unsigned int v64 = self->_routeOffsets.__begin_;
        Latitude v63 = self->_routeOffsets.__end_;
        if (v63 != v64)
        {
          do
          {
            PolylineCoordinate v65 = v63[-1];
            --v63;
            v62[-1] = v65;
            --v62;
          }
          while (v63 != v64);
          Latitude v63 = p_routeOffsets->__begin_;
        }
        self->_routeOffsets.__begin_ = v62;
        self->_routeOffsets.__end_ = v37;
        self->_routeOffsets.__end_cap_.__value_ = (PolylineCoordinate *)&v61[8 * v60];
        if (v63) {
          operator delete(v63);
        }
      }
      else
      {
        PolylineCoordinate *v56 = *v54;
        v37 = v56 + 1;
      }
      self->_routeOffsets.__end_ = v37;
      ++v48;
    }
    while (v48 != v52);
  }
  if (v37 < p_end_cap->__value_)
  {
    PolylineCoordinate *v37 = v81;
    v66 = v37 + 1;
    goto LABEL_82;
  }
  uint64_t v67 = v37 - p_routeOffsets->__begin_;
  if ((unint64_t)(v67 + 1) >> 61) {
LABEL_90:
  }
    std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
  uint64_t v68 = (char *)p_end_cap->__value_ - (char *)p_routeOffsets->__begin_;
  uint64_t v69 = v68 >> 2;
  if (v68 >> 2 <= (unint64_t)(v67 + 1)) {
    uint64_t v69 = v67 + 1;
  }
  if ((unint64_t)v68 >= 0x7FFFFFFFFFFFFFF8) {
    unint64_t v70 = 0x1FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v70 = v69;
  }
  if (v70) {
    Latitude v71 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zilch::StringList::Entry>>((uint64_t)&self->_routeOffsets.__end_cap_, v70);
  }
  else {
    Latitude v71 = 0;
  }
  unint64_t v72 = (PolylineCoordinate *)&v71[8 * v67];
  unint64_t v73 = (PolylineCoordinate *)&v71[8 * v70];
  *unint64_t v72 = v81;
  v66 = v72 + 1;
  uint64_t v75 = self->_routeOffsets.__begin_;
  v74 = self->_routeOffsets.__end_;
  if (v74 != v75)
  {
    do
    {
      PolylineCoordinate v76 = v74[-1];
      --v74;
      v72[-1] = v76;
      --v72;
    }
    while (v74 != v75);
    v74 = p_routeOffsets->__begin_;
  }
  self->_routeOffsets.__begin_ = v72;
  self->_routeOffsets.__end_ = v66;
  self->_routeOffsets.__end_cap_.__value_ = v73;
  if (v74) {
    operator delete(v74);
  }
LABEL_82:
  self->_routeOffsets.__end_ = v66;
  if (v10) {
    operator delete(v10);
  }
}

- (GeoCodecsVectorTilePoint)points
{
  return self->_points.__begin_;
}

- (unint64_t)pointCount
{
  return self->_points.__end_ - self->_points.__begin_;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%s (%f - %f)", geo::MapEdge::debugName((geo::MapEdge *)self->_mapEdge.__ptr_), (float)((float)-[GEOSnappedRouteEdge routeOffsetA](self, "routeOffsetA")+ COERCE_FLOAT((unint64_t)-[GEOSnappedRouteEdge routeOffsetA](self, "routeOffsetA") >> 32)), (float)((float)-[GEOSnappedRouteEdge routeOffsetB](self, "routeOffsetB")+ COERCE_FLOAT((unint64_t)-[GEOSnappedRouteEdge routeOffsetB](self, "routeOffsetB") >> 32)));
}

- (PolylineCoordinate)routeOffsets
{
  return self->_routeOffsets.__begin_;
}

- (PolylineCoordinate)routeOffsetA
{
  return *self->_routeOffsets.__begin_;
}

- (PolylineCoordinate)routeOffsetB
{
  return self->_routeOffsets.__end_[-1];
}

- (GEOMultiSectionFeature)feature
{
  return (GEOMultiSectionFeature *)geo::MapEdgeRoad::roadFeature((geo::MapEdgeRoad *)self->_mapEdge.__ptr_);
}

- (shared_ptr<geo::MapEdgeRoad>)mapEdge
{
  cntrl = self->_mapEdge.__cntrl_;
  *v2 = self->_mapEdge.__ptr_;
  v2[1] = (MapEdgeRoad *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (MapEdgeRoad *)self;
  return result;
}

- (unint64_t)mapEdgeOffset
{
  return self->_mapEdgeOffset;
}

- (BOOL)clippedFront
{
  return self->_clippedFront;
}

- (BOOL)clippedBack
{
  return self->_clippedBack;
}

- (void).cxx_destruct
{
  begin = self->_points.__begin_;
  if (begin)
  {
    self->_points.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->_routeOffsets.__begin_;
  if (v4)
  {
    self->_routeOffsets.__end_ = v4;
    operator delete(v4);
  }
  cntrl = self->_mapEdge.__cntrl_;
  if (cntrl)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (id).cxx_construct
{
  *((void *)self + 12) = 0;
  *((void *)self + 13) = 0;
  *((void *)self + 14) = 0;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *((void *)self + 9) = 0;
  return self;
}

@end