@interface GEOMatchedPathSegment
- ($1AB5FA073B851C12C2339EC22442E995)endLocationCoordinate;
- ($1AB5FA073B851C12C2339EC22442E995)locationCoordinateAt:(unint64_t)a3;
- ($1AB5FA073B851C12C2339EC22442E995)locationCoordinateForRouteCoordinate:(PolylineCoordinate)a3;
- ($1AB5FA073B851C12C2339EC22442E995)startLocationCoordinate;
- (BOOL)isDivergentSegment;
- (BOOL)isFailedSegment;
- (BOOL)isPartialEnd;
- (BOOL)isPartialStart;
- (GEOComposedRoute)route;
- (GEOMapFeatureRoad)road;
- (GEOMatchedPathSegment)init;
- (GEOMatchedPathSegment)initWithRoute:(id)a3 road:(id)a4 coordinates:(const void *)a5 roadRange:(GEOPolylineCoordinateRange)a6;
- (GEOPolylineCoordinateRange)range;
- (GEOPolylineCoordinateRange)roadRange;
- (PolylineCoordinate)_roadPolylineCoordinateForCoordinate:(id)a3 segmentCoordinateIndex:(unint64_t)a4 trimRange:(GEOPolylineCoordinateRange)a5;
- (PolylineCoordinate)endRouteCoordinate;
- (PolylineCoordinate)routeCoordinateAt:(unint64_t)a3;
- (PolylineCoordinate)startRouteCoordinate;
- (id).cxx_construct;
- (id)debugDescription;
- (id)description;
- (id)initUnmatchedSegmentWithRoute:(id)a3 range:(GEOPolylineCoordinateRange)a4 isFailedSegment:(BOOL)a5;
- (id)trimmedSegmentWithinRange:(GEOPolylineCoordinateRange)a3;
- (pair<GEOLocationCoordinate3D,)_interpolatedCoordinateFrom:(GEOMatchedPathSegment *)self routeCoordinate:(SEL)a3;
- (unint64_t)pointCount;
- (void)setIsDivergentSegment:(BOOL)a3;
@end

@implementation GEOMatchedPathSegment

- (GEOMatchedPathSegment)init
{
  result = (GEOMatchedPathSegment *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (GEOMatchedPathSegment)initWithRoute:(id)a3 road:(id)a4 coordinates:(const void *)a5 roadRange:(GEOPolylineCoordinateRange)a6
{
  PolylineCoordinate end = a6.end;
  PolylineCoordinate start = a6.start;
  id v12 = a3;
  id v13 = a4;
  v48.receiver = self;
  v48.super_class = (Class)GEOMatchedPathSegment;
  v14 = [(GEOMatchedPathSegment *)&v48 init];
  v15 = v14;
  v16 = v14;
  if (!v14) {
    goto LABEL_41;
  }
  objc_storeStrong((id *)&v14->_route, a3);
  objc_storeStrong((id *)&v15->_road, a4);
  p_coordinates = &v15->_coordinates;
  if (&v15->_coordinates != a5)
  {
    id v47 = v13;
    id v19 = v12;
    v21 = *(long long **)a5;
    v20 = (long long *)*((void *)a5 + 1);
    uint64_t v22 = (uint64_t)v20 - *(void *)a5;
    unint64_t v23 = v22 >> 5;
    uint64_t value = (uint64_t)v16->_coordinates.__end_cap_.__value_;
    begin = v16->_coordinates.__begin_;
    if (v22 >> 5 <= (unint64_t)((value - (uint64_t)begin) >> 5))
    {
      p_PolylineCoordinate end = &v16->_coordinates.__end_;
      v33 = v16->_coordinates.__end_;
      unint64_t v34 = (v33 - (unsigned char *)begin) >> 5;
      if (v34 < v23)
      {
        v35 = &v21[2 * v34];
        id v12 = v19;
        id v13 = v47;
        if (v33 != (unsigned char *)begin)
        {
          do
          {
            long long v17 = *v21;
            begin[2] = *((void *)v21 + 2);
            *(_OWORD *)begin = v17;
            begin[3] = *((void *)v21 + 3);
            v21 += 2;
            begin += 4;
          }
          while (v21 != v35);
          begin = *p_end;
        }
        v36 = (char *)begin;
        if (v35 != v20)
        {
          v36 = (char *)begin;
          v37 = begin;
          do
          {
            long long v17 = *v35;
            long long v38 = v35[1];
            v35 += 2;
            _OWORD *v37 = v17;
            v37[1] = v38;
            v37 += 2;
            v36 += 32;
          }
          while (v35 != v20);
        }
        int64_t v39 = v36 - (char *)begin;
        goto LABEL_29;
      }
      id v12 = v19;
      id v13 = v47;
      v30 = (char *)v16->_coordinates.__begin_;
      if (v21 != v20)
      {
        v40 = v16->_coordinates.__begin_;
        do
        {
          long long v17 = *v21;
          v40[2] = *((void *)v21 + 2);
          *(_OWORD *)v40 = v17;
          v40[3] = *((void *)v21 + 3);
          v30 += 32;
          v21 += 2;
          v40 += 4;
        }
        while (v21 != v20);
      }
    }
    else
    {
      if (begin)
      {
        v16->_coordinates.__end_ = begin;
        operator delete(begin);
        uint64_t value = 0;
        p_coordinates->__begin_ = 0;
        p_coordinates->__end_ = 0;
        p_coordinates->__end_cap_.__value_ = 0;
      }
      if (v22 < 0) {
        goto LABEL_42;
      }
      uint64_t v26 = value >> 4;
      if (value >> 4 <= v23) {
        uint64_t v26 = v22 >> 5;
      }
      unint64_t v27 = (unint64_t)value >= 0x7FFFFFFFFFFFFFE0 ? 0x7FFFFFFFFFFFFFFLL : v26;
      if (v27 >> 59) {
LABEL_42:
      }
        std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
      id v12 = v19;
      id v13 = v47;
      begin = std::__allocate_at_least[abi:ne180100]<std::allocator<zilch::ControlPoint>>((uint64_t)&v16->_coordinates.__end_cap_, v27);
      v16->_coordinates.__end_ = begin;
      p_PolylineCoordinate end = &v16->_coordinates.__end_;
      v16->_coordinates.__begin_ = begin;
      v16->_coordinates.__end_cap_.__value_ = &begin[4 * v29];
      v30 = (char *)begin;
      if (v21 != v20)
      {
        v30 = (char *)begin;
        v31 = begin;
        do
        {
          long long v17 = *v21;
          long long v32 = v21[1];
          v21 += 2;
          _OWORD *v31 = v17;
          v31[1] = v32;
          v31 += 2;
          v30 += 32;
        }
        while (v21 != v20);
      }
    }
    int64_t v39 = v30 - (char *)begin;
LABEL_29:
    *p_PolylineCoordinate end = (char *)begin + v39;
  }
  v16->_roadRange.PolylineCoordinate start = start;
  v16->_roadRange.PolylineCoordinate end = end;
  *(float *)&long long v17 = start.offset;
  BOOL v41 = start.offset > 0.0;
  if (start.offset == 0.0) {
    BOOL v41 = 0;
  }
  if (start.index) {
    char v42 = 1;
  }
  else {
    char v42 = v41;
  }
  v16->_isPartialStart = v42;
  unsigned int v43 = [(GEOMapFeatureLine *)v16->_road coordinateCount] - 1;
  BOOL v44 = end.offset < 0.0;
  if (end.offset == 0.0) {
    BOOL v44 = 0;
  }
  if (v43 == end.index) {
    BOOL v45 = v44;
  }
  else {
    BOOL v45 = v43 > end.index;
  }
  v16->_isPartialEnd = v45;
LABEL_41:

  return v16;
}

- (id)initUnmatchedSegmentWithRoute:(id)a3 range:(GEOPolylineCoordinateRange)a4 isFailedSegment:(BOOL)a5
{
  PolylineCoordinate end = a4.end;
  PolylineCoordinate start = a4.start;
  id v10 = a3;
  v85.receiver = self;
  v85.super_class = (Class)GEOMatchedPathSegment;
  v11 = [(GEOMatchedPathSegment *)&v85 init];
  id v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_route, a3);
    v12->_roadRange = (GEOPolylineCoordinateRange)GEOPolylineCoordinateRangeInvalid;
    *(_WORD *)&v12->_isPartialStart = 0;
    v12->_isFailedSegment = a5;
    float v13 = start.offset - floorf(start.offset);
    unsigned int v14 = vcvtms_u32_f32(start.offset) + start.index;
    if (start.offset >= 0.0) {
      uint64_t v15 = v14;
    }
    else {
      uint64_t v15 = 0;
    }
    if (start.offset >= 0.0) {
      float v16 = v13;
    }
    else {
      float v16 = -1.0;
    }
    float v17 = end.offset - floorf(end.offset);
    unsigned int v18 = vcvtms_u32_f32(end.offset) + end.index;
    if (end.offset >= 0.0) {
      uint64_t v19 = v18;
    }
    else {
      uint64_t v19 = 0;
    }
    if (end.offset >= 0.0) {
      float v20 = v17;
    }
    else {
      float v20 = -1.0;
    }
    if (v16 > 0.0)
    {
      unint64_t v21 = v15 | ((unint64_t)LODWORD(v16) << 32);
      [v10 pointAtRouteCoordinate:v21];
      uint64_t v25 = v22;
      uint64_t v26 = v23;
      uint64_t v27 = v24;
      unint64_t value = (unint64_t)v12->_coordinates.__end_cap_.__value_;
      uint64_t v29 = v12->_coordinates.__end_;
      if ((unint64_t)v29 >= value)
      {
        begin = v12->_coordinates.__begin_;
        uint64_t v32 = ((char *)v29 - begin) >> 5;
        unint64_t v33 = v32 + 1;
        if ((unint64_t)(v32 + 1) >> 59) {
          std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v34 = value - (void)begin;
        if (v34 >> 4 > v33) {
          unint64_t v33 = v34 >> 4;
        }
        if ((unint64_t)v34 >= 0x7FFFFFFFFFFFFFE0) {
          unint64_t v35 = 0x7FFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v35 = v33;
        }
        if (v35) {
          v36 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zilch::ControlPoint>>((uint64_t)&v12->_coordinates.__end_cap_, v35);
        }
        else {
          v36 = 0;
        }
        v37 = &v36[32 * v32];
        long long v38 = &v36[32 * v35];
        *(void *)v37 = v25;
        *((void *)v37 + 1) = v26;
        *((void *)v37 + 2) = v27;
        *((void *)v37 + 3) = v21;
        v30 = v37 + 32;
        v40 = (char *)v12->_coordinates.__begin_;
        int64_t v39 = (char *)v12->_coordinates.__end_;
        if (v39 != v40)
        {
          do
          {
            long long v41 = *((_OWORD *)v39 - 1);
            *((_OWORD *)v37 - 2) = *((_OWORD *)v39 - 2);
            *((_OWORD *)v37 - 1) = v41;
            v37 -= 32;
            v39 -= 32;
          }
          while (v39 != v40);
          int64_t v39 = (char *)v12->_coordinates.__begin_;
        }
        v12->_coordinates.__begin_ = v37;
        v12->_coordinates.__end_ = v30;
        v12->_coordinates.__end_cap_.__value_ = v38;
        if (v39) {
          operator delete(v39);
        }
      }
      else
      {
        *uint64_t v29 = v22;
        v29[1] = v23;
        v29[2] = v24;
        v30 = v29 + 4;
        v29[3] = v21;
      }
      v12->_coordinates.__end_ = v30;
      LODWORD(v15) = v15 + 1;
    }
    if (v15 <= v19)
    {
      p_coordinates = &v12->_coordinates;
      do
      {
        [v10 pointAtRouteCoordinate:v15];
        uint64_t v46 = v43;
        uint64_t v47 = v44;
        uint64_t v48 = v45;
        v49 = v12->_coordinates.__end_;
        unint64_t v50 = (unint64_t)v12->_coordinates.__end_cap_.__value_;
        if ((unint64_t)v49 >= v50)
        {
          uint64_t v52 = ((char *)v49 - (char *)p_coordinates->__begin_) >> 5;
          unint64_t v53 = v52 + 1;
          if ((unint64_t)(v52 + 1) >> 59) {
            std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v54 = v50 - (unint64_t)p_coordinates->__begin_;
          if (v54 >> 4 > v53) {
            unint64_t v53 = v54 >> 4;
          }
          if ((unint64_t)v54 >= 0x7FFFFFFFFFFFFFE0) {
            unint64_t v55 = 0x7FFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v55 = v53;
          }
          if (v55) {
            v56 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zilch::ControlPoint>>((uint64_t)&v12->_coordinates.__end_cap_, v55);
          }
          else {
            v56 = 0;
          }
          v57 = &v56[32 * v52];
          *(void *)v57 = v46;
          *((void *)v57 + 1) = v47;
          *((void *)v57 + 2) = v48;
          *((void *)v57 + 3) = v15;
          v59 = (char *)v12->_coordinates.__begin_;
          v58 = (char *)v12->_coordinates.__end_;
          v60 = v57;
          if (v58 != v59)
          {
            do
            {
              long long v61 = *((_OWORD *)v58 - 1);
              *((_OWORD *)v60 - 2) = *((_OWORD *)v58 - 2);
              *((_OWORD *)v60 - 1) = v61;
              v60 -= 32;
              v58 -= 32;
            }
            while (v58 != v59);
            v58 = (char *)p_coordinates->__begin_;
          }
          v51 = v57 + 32;
          v12->_coordinates.__begin_ = v60;
          v12->_coordinates.__end_ = v57 + 32;
          v12->_coordinates.__end_cap_.__value_ = &v56[32 * v55];
          if (v58) {
            operator delete(v58);
          }
        }
        else
        {
          void *v49 = v43;
          v49[1] = v44;
          v49[2] = v45;
          v51 = v49 + 4;
          v49[3] = v15;
        }
        v12->_coordinates.__end_ = v51;
        LODWORD(v15) = v15 + 1;
      }
      while (v15 <= v19);
    }
    if (v20 > 0.0)
    {
      unint64_t v62 = ((unint64_t)LODWORD(v20) << 32) | v19;
      [v10 pointAtRouteCoordinate:v62];
      uint64_t v66 = v63;
      uint64_t v67 = v64;
      uint64_t v68 = v65;
      unint64_t v69 = (unint64_t)v12->_coordinates.__end_cap_.__value_;
      v70 = v12->_coordinates.__end_;
      if ((unint64_t)v70 >= v69)
      {
        v72 = v12->_coordinates.__begin_;
        uint64_t v73 = ((char *)v70 - v72) >> 5;
        unint64_t v74 = v73 + 1;
        if ((unint64_t)(v73 + 1) >> 59) {
          std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v75 = v69 - (void)v72;
        if (v75 >> 4 > v74) {
          unint64_t v74 = v75 >> 4;
        }
        if ((unint64_t)v75 >= 0x7FFFFFFFFFFFFFE0) {
          unint64_t v76 = 0x7FFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v76 = v74;
        }
        if (v76) {
          v77 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zilch::ControlPoint>>((uint64_t)&v12->_coordinates.__end_cap_, v76);
        }
        else {
          v77 = 0;
        }
        v78 = &v77[32 * v73];
        v79 = &v77[32 * v76];
        *(void *)v78 = v66;
        *((void *)v78 + 1) = v67;
        *((void *)v78 + 2) = v68;
        *((void *)v78 + 3) = v62;
        v71 = v78 + 32;
        v81 = (char *)v12->_coordinates.__begin_;
        v80 = (char *)v12->_coordinates.__end_;
        if (v80 != v81)
        {
          do
          {
            long long v82 = *((_OWORD *)v80 - 1);
            *((_OWORD *)v78 - 2) = *((_OWORD *)v80 - 2);
            *((_OWORD *)v78 - 1) = v82;
            v78 -= 32;
            v80 -= 32;
          }
          while (v80 != v81);
          v80 = (char *)v12->_coordinates.__begin_;
        }
        v12->_coordinates.__begin_ = v78;
        v12->_coordinates.__end_ = v71;
        v12->_coordinates.__end_cap_.__value_ = v79;
        if (v80) {
          operator delete(v80);
        }
      }
      else
      {
        void *v70 = v63;
        v70[1] = v64;
        v70[2] = v65;
        v71 = v70 + 4;
        v70[3] = v62;
      }
      v12->_coordinates.__end_ = v71;
    }
    v83 = v12;
  }

  return v12;
}

- (id)trimmedSegmentWithinRange:(GEOPolylineCoordinateRange)a3
{
  PolylineCoordinate end = a3.end;
  PolylineCoordinate start = a3.start;
  GEOPolylineCoordinateRange v79 = a3;
  if (![(GEOMatchedPathSegment *)self pointCount]) {
    goto LABEL_18;
  }
  PolylineCoordinate v6 = [(GEOMatchedPathSegment *)self startRouteCoordinate];
  PolylineCoordinate v7 = [(GEOMatchedPathSegment *)self endRouteCoordinate];
  float v10 = v6.offset - floorf(v6.offset);
  unsigned int v11 = vcvtms_u32_f32(v6.offset) + v6.index;
  *(float *)&long long v12 = v7.offset - floorf(v7.offset);
  if (v7.offset < 0.0) {
    *(float *)&long long v12 = -1.0;
  }
  if (v6.offset >= 0.0) {
    *(float *)&long long v8 = v10;
  }
  else {
    *(float *)&long long v8 = -1.0;
  }
  if (v6.offset >= 0.0) {
    unsigned int v13 = v11;
  }
  else {
    unsigned int v13 = 0;
  }
  if (v13 == end.index)
  {
    if (*(float *)&v8 >= end.offset) {
      goto LABEL_18;
    }
  }
  else if (v13 > end.index)
  {
LABEL_18:
    uint64_t v15 = 0;
    goto LABEL_19;
  }
  unsigned int v14 = vcvtms_u32_f32(v7.offset) + v7.index;
  if (v7.offset < 0.0) {
    unsigned int v14 = 0;
  }
  *(float *)&double v9 = start.offset;
  if (v14 == start.index)
  {
    if (*(float *)&v12 <= start.offset) {
      goto LABEL_18;
    }
  }
  else if (v14 < start.index)
  {
    goto LABEL_18;
  }
  if (v13 == start.index)
  {
    if (*(float *)&v8 < start.offset) {
      goto LABEL_39;
    }
  }
  else if (v13 <= start.index)
  {
    goto LABEL_39;
  }
  if (v13 == end.index)
  {
    if (*(float *)&v8 > end.offset) {
      goto LABEL_39;
    }
  }
  else if (v13 >= end.index)
  {
    goto LABEL_39;
  }
  if (v14 == start.index)
  {
    if (*(float *)&v12 < start.offset) {
      goto LABEL_39;
    }
  }
  else if (v14 <= start.index)
  {
    goto LABEL_39;
  }
  if (v14 == end.index)
  {
    *(float *)&long long v8 = end.offset;
    if (*(float *)&v12 <= end.offset)
    {
LABEL_37:
      uint64_t v15 = self;
      goto LABEL_19;
    }
  }
  else if (v14 < end.index)
  {
    goto LABEL_37;
  }
LABEL_39:
  __p = 0;
  v77 = 0;
  v78 = 0;
  PolylineCoordinate v17 = self->_roadRange.start;
  PolylineCoordinate v18 = self->_roadRange.end;
  begin = self->_coordinates.__begin_;
  uint64_t v19 = self->_coordinates.__end_;
  if ((unint64_t)(v19 - begin) < 0x21) {
    goto LABEL_133;
  }
  PolylineCoordinate v73 = self->_roadRange.end;
  uint64_t v21 = 1;
  while (1)
  {
    uint64_t v22 = &begin[32 * v21];
    uint64_t v24 = *((void *)v22 + 3);
    uint64_t v23 = v22 + 24;
    *(float *)&long long v12 = v79.start.offset;
    BOOL v25 = v24 >= v79.start.index;
    if (v24 != v79.start.index) {
      break;
    }
    LODWORD(v8) = HIDWORD(*((void *)v22 + 3));
    if (*(float *)&v8 > v79.start.offset) {
      goto LABEL_46;
    }
LABEL_112:
    if (++v21 >= (unint64_t)((v19 - begin) >> 5))
    {
      PolylineCoordinate v18 = v73;
      goto LABEL_133;
    }
  }
  if (!v25) {
    goto LABEL_112;
  }
LABEL_46:
  uint64_t v26 = &begin[32 * v21 - 32];
  uint64_t v27 = *((void *)v26 + 3);
  if (v27 == v79.start.index)
  {
    LODWORD(v8) = HIDWORD(*((void *)v26 + 3));
    if (*((float *)&v27 + 1) >= v79.start.offset) {
      goto LABEL_48;
    }
LABEL_51:
    -[GEOMatchedPathSegment _interpolatedCoordinateFrom:routeCoordinate:](self, "_interpolatedCoordinateFrom:routeCoordinate:", v21 - 1, &v79, *(double *)&v12, *(double *)&v8, v9);
    v30 = v77;
    if (v77 >= v78)
    {
      long long v38 = (char *)__p;
      uint64_t v39 = (v77 - (unsigned char *)__p) >> 5;
      unint64_t v40 = v39 + 1;
      if ((unint64_t)(v39 + 1) >> 59) {
        std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
      }
      uint64_t v41 = v78 - (unsigned char *)__p;
      if ((v78 - (unsigned char *)__p) >> 4 > v40) {
        unint64_t v40 = v41 >> 4;
      }
      if ((unint64_t)v41 >= 0x7FFFFFFFFFFFFFE0) {
        unint64_t v42 = 0x7FFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v42 = v40;
      }
      if (v42)
      {
        uint64_t v43 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zilch::ControlPoint>>((uint64_t)&v78, v42);
        long long v38 = (char *)__p;
        v30 = v77;
      }
      else
      {
        uint64_t v43 = 0;
      }
      *(void *)&long long v12 = v74;
      *(void *)&long long v8 = v75;
      uint64_t v47 = &v43[32 * v39];
      *(_OWORD *)uint64_t v47 = v74;
      *((_OWORD *)v47 + 1) = v75;
      if (v30 == v38)
      {
        v49 = &v43[32 * v39];
      }
      else
      {
        uint64_t v48 = &v43[32 * v39];
        do
        {
          v49 = v48 - 32;
          long long v12 = *((_OWORD *)v30 - 2);
          long long v8 = *((_OWORD *)v30 - 1);
          *((_OWORD *)v48 - 2) = v12;
          *((_OWORD *)v48 - 1) = v8;
          v30 -= 32;
          v48 -= 32;
        }
        while (v30 != v38);
      }
      v31 = v47 + 32;
      __p = v49;
      v77 = v47 + 32;
      v78 = &v43[32 * v42];
      if (v38) {
        operator delete(v38);
      }
    }
    else
    {
      *(void *)&long long v12 = v74;
      *(void *)&long long v8 = v75;
      *(_OWORD *)v77 = v74;
      *((_OWORD *)v30 + 1) = v75;
      v31 = v30 + 32;
    }
    v77 = v31;
    if (self->_road) {
      PolylineCoordinate v17 = -[GEOMatchedPathSegment _roadPolylineCoordinateForCoordinate:segmentCoordinateIndex:trimRange:](self, "_roadPolylineCoordinateForCoordinate:segmentCoordinateIndex:trimRange:", v21, *(void *)&v79.start, *(void *)&v79.end, v74, *(double *)&v75);
    }
  }
  else
  {
    if (v27 < v79.start.index) {
      goto LABEL_51;
    }
LABEL_48:
    v28 = v77;
    if (v77 >= v78)
    {
      uint64_t v32 = (char *)__p;
      uint64_t v33 = (v77 - (unsigned char *)__p) >> 5;
      unint64_t v34 = v33 + 1;
      if ((unint64_t)(v33 + 1) >> 59) {
        goto LABEL_135;
      }
      uint64_t v35 = v78 - (unsigned char *)__p;
      if ((v78 - (unsigned char *)__p) >> 4 > v34) {
        unint64_t v34 = v35 >> 4;
      }
      if ((unint64_t)v35 >= 0x7FFFFFFFFFFFFFE0) {
        unint64_t v36 = 0x7FFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v36 = v34;
      }
      if (v36)
      {
        v37 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zilch::ControlPoint>>((uint64_t)&v78, v36);
        uint64_t v32 = (char *)__p;
        v28 = v77;
      }
      else
      {
        v37 = 0;
      }
      long long v12 = *(_OWORD *)v26;
      long long v8 = *((_OWORD *)v26 + 1);
      uint64_t v44 = &v37[32 * v33];
      *(_OWORD *)uint64_t v44 = *(_OWORD *)v26;
      *((_OWORD *)v44 + 1) = v8;
      if (v28 == v32)
      {
        uint64_t v46 = &v37[32 * v33];
      }
      else
      {
        uint64_t v45 = &v37[32 * v33];
        do
        {
          uint64_t v46 = v45 - 32;
          long long v12 = *((_OWORD *)v28 - 2);
          long long v8 = *((_OWORD *)v28 - 1);
          *((_OWORD *)v45 - 2) = v12;
          *((_OWORD *)v45 - 1) = v8;
          v28 -= 32;
          v45 -= 32;
        }
        while (v28 != v32);
      }
      uint64_t v29 = v44 + 32;
      __p = v46;
      v77 = v44 + 32;
      v78 = &v37[32 * v36];
      if (v32) {
        operator delete(v32);
      }
    }
    else
    {
      long long v12 = *(_OWORD *)v26;
      long long v8 = *((_OWORD *)v26 + 1);
      *(_OWORD *)v77 = *(_OWORD *)v26;
      *((_OWORD *)v28 + 1) = v8;
      uint64_t v29 = v28 + 32;
    }
    v77 = v29;
  }
  if (v79.end.index == *v23)
  {
    LODWORD(v12) = HIDWORD(*v23);
    *(float *)&long long v8 = v79.end.offset;
    if (v79.end.offset <= *(float *)&v12) {
      goto LABEL_114;
    }
    goto LABEL_92;
  }
  if (v79.end.index >= *v23)
  {
LABEL_92:
    begin = self->_coordinates.__begin_;
    uint64_t v19 = self->_coordinates.__end_;
    if (v21 == ((v19 - begin) >> 5) - 1)
    {
      unint64_t v50 = v77;
      if (v77 >= v78)
      {
        uint64_t v52 = (char *)__p;
        uint64_t v53 = (v77 - (unsigned char *)__p) >> 5;
        unint64_t v54 = v53 + 1;
        if ((unint64_t)(v53 + 1) >> 59) {
LABEL_135:
        }
          std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
        uint64_t v55 = v78 - (unsigned char *)__p;
        if ((v78 - (unsigned char *)__p) >> 4 > v54) {
          unint64_t v54 = v55 >> 4;
        }
        if ((unint64_t)v55 >= 0x7FFFFFFFFFFFFFE0) {
          unint64_t v56 = 0x7FFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v56 = v54;
        }
        if (v56)
        {
          v57 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zilch::ControlPoint>>((uint64_t)&v78, v56);
          uint64_t v52 = (char *)__p;
          unint64_t v50 = v77;
        }
        else
        {
          v57 = 0;
        }
        long long v12 = *(_OWORD *)v22;
        long long v8 = *((_OWORD *)v22 + 1);
        v58 = &v57[32 * v53];
        *(_OWORD *)v58 = *(_OWORD *)v22;
        *((_OWORD *)v58 + 1) = v8;
        if (v50 == v52)
        {
          v60 = &v57[32 * v53];
        }
        else
        {
          v59 = &v57[32 * v53];
          do
          {
            v60 = v59 - 32;
            long long v12 = *((_OWORD *)v50 - 2);
            long long v8 = *((_OWORD *)v50 - 1);
            *((_OWORD *)v59 - 2) = v12;
            *((_OWORD *)v59 - 1) = v8;
            v50 -= 32;
            v59 -= 32;
          }
          while (v50 != v52);
        }
        v51 = v58 + 32;
        __p = v60;
        v77 = v58 + 32;
        v78 = &v57[32 * v56];
        if (v52) {
          operator delete(v52);
        }
      }
      else
      {
        long long v12 = *(_OWORD *)v22;
        long long v8 = *((_OWORD *)v22 + 1);
        *(_OWORD *)v77 = *(_OWORD *)v22;
        *((_OWORD *)v50 + 1) = v8;
        v51 = v50 + 32;
      }
      v77 = v51;
      begin = self->_coordinates.__begin_;
      uint64_t v19 = self->_coordinates.__end_;
    }
    goto LABEL_112;
  }
LABEL_114:
  -[GEOMatchedPathSegment _interpolatedCoordinateFrom:routeCoordinate:](self, "_interpolatedCoordinateFrom:routeCoordinate:", v21 - 1, &v79.end, *(double *)&v12, *(double *)&v8, v9);
  PolylineCoordinate v18 = v73;
  long long v61 = v77;
  if (v77 >= v78)
  {
    uint64_t v63 = (char *)__p;
    uint64_t v64 = (v77 - (unsigned char *)__p) >> 5;
    unint64_t v65 = v64 + 1;
    if ((unint64_t)(v64 + 1) >> 59) {
      std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v66 = v78 - (unsigned char *)__p;
    if ((v78 - (unsigned char *)__p) >> 4 > v65) {
      unint64_t v65 = v66 >> 4;
    }
    if ((unint64_t)v66 >= 0x7FFFFFFFFFFFFFE0) {
      unint64_t v67 = 0x7FFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v67 = v65;
    }
    if (v67)
    {
      uint64_t v68 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zilch::ControlPoint>>((uint64_t)&v78, v67);
      uint64_t v63 = (char *)__p;
      long long v61 = v77;
    }
    else
    {
      uint64_t v68 = 0;
    }
    unint64_t v69 = &v68[32 * v64];
    v70 = &v68[32 * v67];
    *(_OWORD *)unint64_t v69 = v74;
    *((_OWORD *)v69 + 1) = v75;
    unint64_t v62 = v69 + 32;
    if (v61 == v63)
    {
      v71 = v69;
    }
    else
    {
      do
      {
        v71 = v69 - 32;
        long long v72 = *((_OWORD *)v61 - 1);
        *((_OWORD *)v69 - 2) = *((_OWORD *)v61 - 2);
        *((_OWORD *)v69 - 1) = v72;
        v61 -= 32;
        v69 -= 32;
      }
      while (v61 != v63);
    }
    __p = v71;
    v77 = v62;
    v78 = v70;
    if (v63) {
      operator delete(v63);
    }
  }
  else
  {
    *(_OWORD *)v77 = v74;
    *((_OWORD *)v61 + 1) = v75;
    unint64_t v62 = v61 + 32;
  }
  v77 = v62;
  if (self->_road) {
    PolylineCoordinate v18 = -[GEOMatchedPathSegment _roadPolylineCoordinateForCoordinate:segmentCoordinateIndex:trimRange:](self, "_roadPolylineCoordinateForCoordinate:segmentCoordinateIndex:trimRange:", v21, *(void *)&v79.start, *(void *)&v79.end, v74, *(double *)&v75);
  }
LABEL_133:
  uint64_t v15 = -[GEOMatchedPathSegment initWithRoute:road:coordinates:roadRange:]([GEOMatchedPathSegment alloc], "initWithRoute:road:coordinates:roadRange:", self->_route, self->_road, &__p, v17, v18);
  if (__p)
  {
    v77 = (char *)__p;
    operator delete(__p);
  }
LABEL_19:

  return v15;
}

- (unint64_t)pointCount
{
  return ((char *)self->_coordinates.__end_ - (char *)self->_coordinates.__begin_) >> 5;
}

- ($1AB5FA073B851C12C2339EC22442E995)locationCoordinateAt:(unint64_t)a3
{
  if ([(GEOMatchedPathSegment *)self pointCount] <= a3)
  {
    BOOL v9 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
    double v6 = -180.0;
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: index < self.pointCount", buf, 2u);
      double v6 = -180.0;
    }
    double v8 = 1.79769313e308;
    double v7 = -180.0;
  }
  else
  {
    v5 = (double *)((char *)self->_coordinates.__begin_ + 32 * a3);
    double v6 = *v5;
    double v7 = v5[1];
    double v8 = v5[2];
  }
  result.var2 = v8;
  result.var1 = v7;
  result.var0 = v6;
  return result;
}

- (PolylineCoordinate)routeCoordinateAt:(unint64_t)a3
{
  if ([(GEOMatchedPathSegment *)self pointCount] <= a3)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)double v7 = 0;
      _os_log_fault_impl(&dword_188D96000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Assertion failed: index < self.pointCount", v7, 2u);
    }
    v5 = (PolylineCoordinate *)&GEOPolylineCoordinateInvalid;
  }
  else
  {
    v5 = (PolylineCoordinate *)((char *)self->_coordinates.__begin_ + 32 * a3 + 24);
  }
  return *v5;
}

- ($1AB5FA073B851C12C2339EC22442E995)startLocationCoordinate
{
  [(GEOMatchedPathSegment *)self locationCoordinateAt:0];
  result.var2 = v4;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- ($1AB5FA073B851C12C2339EC22442E995)endLocationCoordinate
{
  unint64_t v3 = [(GEOMatchedPathSegment *)self pointCount] - 1;

  [(GEOMatchedPathSegment *)self locationCoordinateAt:v3];
  result.var2 = v6;
  result.var1 = v5;
  result.var0 = v4;
  return result;
}

- (PolylineCoordinate)startRouteCoordinate
{
  begin = (PolylineCoordinate *)self->_coordinates.__begin_;
  if (self->_coordinates.__end_ == begin) {
    unint64_t v3 = (PolylineCoordinate *)&GEOPolylineCoordinateInvalid;
  }
  else {
    unint64_t v3 = begin + 3;
  }
  return *v3;
}

- (PolylineCoordinate)endRouteCoordinate
{
  PolylineCoordinate end = (char *)self->_coordinates.__end_;
  if (end == self->_coordinates.__begin_) {
    unint64_t v3 = (PolylineCoordinate *)&GEOPolylineCoordinateInvalid;
  }
  else {
    unint64_t v3 = (PolylineCoordinate *)(end - 8);
  }
  return *v3;
}

- (GEOPolylineCoordinateRange)range
{
  PolylineCoordinate v3 = [(GEOMatchedPathSegment *)self startRouteCoordinate];
  PolylineCoordinate v4 = [(GEOMatchedPathSegment *)self endRouteCoordinate];
  PolylineCoordinate v5 = v3;
  result.PolylineCoordinate end = v4;
  result.PolylineCoordinate start = v5;
  return result;
}

- ($1AB5FA073B851C12C2339EC22442E995)locationCoordinateForRouteCoordinate:(PolylineCoordinate)a3
{
  PolylineCoordinate v18 = a3;
  begin = (float *)self->_coordinates.__begin_;
  PolylineCoordinate end = (float *)self->_coordinates.__end_;
  if (end == begin) {
    goto LABEL_11;
  }
  *(float *)&double v3 = a3.offset;
  unint64_t v6 = ((char *)end - (char *)begin) >> 5;
  double v7 = (float *)self->_coordinates.__begin_;
  do
  {
    unint64_t v8 = v6 >> 1;
    BOOL v9 = &v7[8 * (v6 >> 1)];
    unsigned int v10 = *((_DWORD *)v9 + 6);
    if (v10 < a3.index || v10 == a3.index && v7[8 * v8 + 7] < a3.offset)
    {
      double v7 = v9 + 8;
      unint64_t v8 = v6 + ~v8;
    }
    unint64_t v6 = v8;
  }
  while (v8);
  uint64_t v11 = (char *)v7 - (char *)begin;
  if (!v11)
  {
LABEL_11:
    [(GEOMatchedPathSegment *)self startLocationCoordinate];
  }
  else if (v7 == end)
  {
    [(GEOMatchedPathSegment *)self endLocationCoordinate];
  }
  else
  {
    -[GEOMatchedPathSegment _interpolatedCoordinateFrom:routeCoordinate:](self, "_interpolatedCoordinateFrom:routeCoordinate:", (v11 >> 5) - 1, &v18, v3);
    double v12 = v15;
    double v13 = v16;
    double v14 = v17;
  }
  result.var2 = v14;
  result.var1 = v13;
  result.var0 = v12;
  return result;
}

- (pair<GEOLocationCoordinate3D,)_interpolatedCoordinateFrom:(GEOMatchedPathSegment *)self routeCoordinate:(SEL)a3
{
  int v5 = a4;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  begin = (char *)self->_coordinates.__begin_;
  if ((((char *)self->_coordinates.__end_ - (char *)begin) >> 5) - 1 <= a4)
  {
    double v17 = GEOGetGEOPathMatcherLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      unint64_t v18 = (unint64_t)((char *)self->_coordinates.__end_ - (char *)self->_coordinates.__begin_) >> 5;
      int v33 = 67109376;
      *(_DWORD *)unint64_t v34 = v5;
      *(_WORD *)&v34[4] = 1024;
      *(_DWORD *)&v34[6] = v18;
      _os_log_impl(&dword_188D96000, v17, OS_LOG_TYPE_FAULT, "startIndex (%d) passed into _interpolatedCoordinateFrom: is outside _coordinates bounds (size: %d)", (uint8_t *)&v33, 0xEu);
    }

    goto LABEL_17;
  }
  unsigned int v10 = &begin[32 * a4];
  uint64_t v12 = *((void *)v10 + 3);
  uint64_t v11 = (uint64_t *)(v10 + 24);
  unsigned int index = a5->index;
  uint64_t v14 = *((void *)v10 + 7);
  float offset = a5->offset;
  BOOL v16 = v12 >= index;
  if (v12 == index)
  {
    if (COERCE_FLOAT(HIDWORD(*((void *)v10 + 3))) > offset) {
      goto LABEL_14;
    }
  }
  else if (v16)
  {
    goto LABEL_14;
  }
  if (index == v14)
  {
    if (offset <= *((float *)&v14 + 1)) {
      goto LABEL_11;
    }
LABEL_14:
    BOOL v25 = GEOGetGEOPathMatcherLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
    {
      GEOPolylineCoordinateAsString((uint64_t)*a5, 1, 0, v26);
      id v27 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v29 = GEOPolylineCoordinateAsString(*v11, 1, 0, v28);
      v31 = GEOPolylineCoordinateAsString(*((void *)v10 + 7), 1, 0, v30);
      int v33 = 138413314;
      *(void *)unint64_t v34 = v27;
      *(_WORD *)&v34[8] = 1024;
      int v35 = v5;
      __int16 v36 = 2112;
      v37 = v29;
      __int16 v38 = 1024;
      int v39 = v5 + 1;
      __int16 v40 = 2112;
      uint64_t v41 = v31;
      _os_log_impl(&dword_188D96000, v25, OS_LOG_TYPE_FAULT, "routeCoordinate [%@] passed into _interpolatedCoordinateFrom: is not between start (%d)[%@] and end (%d)[%@]", (uint8_t *)&v33, 0x2Cu);
    }
LABEL_17:
    *(_OWORD *)&retstr->var0.var0 = kGEOLocationCoordinate3DInvalid;
    retstr->var0.var2 = 1.79769313e308;
    retstr->var1 = (PolylineCoordinate)0xBF80000000000000;
    return result;
  }
  if (index >= v14) {
    goto LABEL_14;
  }
LABEL_11:
  $1AB5FA073B851C12C2339EC22442E995 result = (pair<GEOLocationCoordinate3D, geo::PolylineCoordinate> *)-[GEOComposedRoute distanceBetweenRouteCoordinate:andRouteCoordinate:](self->_route, "distanceBetweenRouteCoordinate:andRouteCoordinate:");
  if (v20 <= 0.0)
  {
    long long v32 = *((_OWORD *)v10 + 1);
    *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)v10;
    *(_OWORD *)&retstr->var0.var2 = v32;
  }
  else
  {
    double v21 = v20;
    $1AB5FA073B851C12C2339EC22442E995 result = (pair<GEOLocationCoordinate3D, geo::PolylineCoordinate> *)[(GEOComposedRoute *)self->_route distanceBetweenRouteCoordinate:*v11 andRouteCoordinate:*a5];
    double v23 = v22 / v21;
    double v24 = *((double *)v10 + 2) + (*((double *)v10 + 6) - *((double *)v10 + 2)) * v23;
    *(float64x2_t *)&retstr->var0.var0 = vmlaq_n_f64(*(float64x2_t *)v10, vsubq_f64(*((float64x2_t *)v10 + 2), *(float64x2_t *)v10), v23);
    retstr->var0.var2 = v24;
    retstr->var1 = *a5;
  }
  return result;
}

- (PolylineCoordinate)_roadPolylineCoordinateForCoordinate:(id)a3 segmentCoordinateIndex:(unint64_t)a4 trimRange:(GEOPolylineCoordinateRange)a5
{
  uint64_t end = (uint64_t)a5.end;
  uint64_t start = (uint64_t)a5.start;
  int v7 = a4;
  double var1 = a3.var1;
  double var0 = a3.var0;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  unint64_t v11 = self->_roadRange.start.index + a4;
  uint64_t v12 = v11 - 1;
  if (v11 - 1 >= [(GEOMapFeatureLine *)self->_road coordinateCount]
    || v11 >= [(GEOMapFeatureLine *)self->_road coordinateCount])
  {
    uint64_t v12 = GEOGetGEOPathMatcherLog();
    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_FAULT))
    {
      int v19 = [(GEOMapFeatureLine *)self->_road coordinateCount];
      double v21 = GEOPolylineCoordinateRangeAsString(*(void *)&self->_roadRange.start, *(void *)&self->_roadRange.end, v20);
      double v23 = GEOPolylineCoordinateRangeAsString(start, end, v22);
      v25[0] = 67110402;
      v25[1] = v11;
      __int16 v26 = 1024;
      int v27 = v19;
      __int16 v28 = 2112;
      uint64_t v29 = v21;
      __int16 v30 = 1024;
      int v31 = v7;
      __int16 v32 = 2112;
      int v33 = v23;
      __int16 v34 = 2112;
      int v35 = self;
      _os_log_impl(&dword_188D96000, (os_log_t)v12, OS_LOG_TYPE_FAULT, "roadIndexB (%d) is greater than coordinate count on road (%d). Road range: %@, segmentCoordinateIndex: %d, trim range: %@ | %@", (uint8_t *)v25, 0x32u);
    }
    LODWORD(v12) = [(GEOMapFeatureLine *)self->_road coordinateCount] - 1;
    float v18 = 0.0;
  }
  else
  {
    double v13 = [(GEOMapFeatureLine *)self->_road coordinates3d] + 24 * v12;
    double v14 = v13->var0;
    double v15 = v13->var1;
    BOOL v16 = [(GEOMapFeatureLine *)self->_road coordinates3d];
    double v17 = GEOCalculateDistanceRadius(v14, v15, v16[v11].var0, v16[v11].var1, 6367000.0);
    float v18 = GEOCalculateDistanceRadius(v14, v15, var0, var1, 6367000.0) / v17;
    if (v18 >= 1.0)
    {
      LODWORD(v12) = vcvtms_u32_f32(v18) + v12;
      float v18 = v18 - (float)floorf(v18);
    }
  }
  return (PolylineCoordinate)(v12 | ((unint64_t)LODWORD(v18) << 32));
}

- (id)description
{
  [(GEOMatchedPathSegment *)self locationCoordinateAt:0];
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  [(GEOMatchedPathSegment *)self locationCoordinateAt:[(GEOMatchedPathSegment *)self pointCount] - 1];
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  PolylineCoordinate v11 = [(GEOMatchedPathSegment *)self routeCoordinateAt:0];
  PolylineCoordinate v12 = [(GEOMatchedPathSegment *)self routeCoordinateAt:[(GEOMatchedPathSegment *)self pointCount] - 1];
  double v13 = NSString;
  double v14 = [(GEOMapFeatureRoad *)self->_road internalRoadName];
  unint64_t v15 = [(GEOMatchedPathSegment *)self pointCount];
  double v17 = GEOPolylineCoordinateAsString(*(void *)&v11, 1, 0, v16);
  int v19 = GEOPolylineCoordinateAsString(*(void *)&v12, 1, 0, v18);
  double v20 = [v13 stringWithFormat:@"%@ | %d points - [%@] - [%@] (%f, %f) - (%f, %f)", v14, v15, v17, v19, v4, v6, v8, v10];

  return v20;
}

- (id)debugDescription
{
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[GEOMatchedPathSegment pointCount](self, "pointCount"));
  unint64_t v4 = 0;
  uint64_t v5 = ((int)log10((double)[(GEOMatchedPathSegment *)self pointCount]) + 1);
  while (v4 < [(GEOMatchedPathSegment *)self pointCount])
  {
    [(GEOMatchedPathSegment *)self locationCoordinateAt:v4];
    double v7 = v6;
    double v9 = v8;
    PolylineCoordinate v10 = [(GEOMatchedPathSegment *)self routeCoordinateAt:v4];
    [(GEOComposedRoute *)self->_route pointAtRouteCoordinate:v10];
    double v12 = v11;
    double v14 = v13;
    unint64_t v15 = NSString;
    double v16 = GEOPolylineCoordinateAsString(*(void *)&v10, 1, 1, v11);
    double v17 = [v15 stringWithFormat:@"%*d: [%@] %f, %f (%0.1fm)", v5, v4, v16, *(void *)&v7, *(void *)&v9, GEOCalculateDistanceRadius(v7, v9, v12, v14, 6367000.0)];

    [v3 addObject:v17];
    ++v4;
  }
  double v18 = [v3 componentsJoinedByString:@"\n"];
  int v19 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v20 = [(GEOMapFeatureRoad *)self->_road internalRoadName];
  double v21 = (void *)v20;
  if (v20) {
    double v22 = (__CFString *)v20;
  }
  else {
    double v22 = @"(No road name)";
  }
  [v19 addObject:v22];

  double v23 = NSString;
  [(GEOMapFeatureLine *)self->_road length];
  BOOL v25 = objc_msgSend(v23, "stringWithFormat:", @"%0.1f meters", v24);
  [v19 addObject:v25];

  __int16 v26 = NSString;
  __int16 v28 = GEOPolylineCoordinateRangeAsString(*(void *)&self->_roadRange.start, *(void *)&self->_roadRange.end, v27);
  uint64_t v29 = [v26 stringWithFormat:@"Road range: %@", v28];
  [v19 addObject:v29];

  if (self->_isPartialStart)
  {
    if (self->_isPartialEnd) {
      __int16 v30 = @"partial start and end";
    }
    else {
      __int16 v30 = @"partial start";
    }
  }
  else
  {
    if (!self->_isPartialEnd) {
      goto LABEL_14;
    }
    __int16 v30 = @"partial end";
  }
  [v19 addObject:v30];
LABEL_14:
  if (self->_isDivergentSegment) {
    [v19 addObject:@"Error: segment diverges from route"];
  }
  if (self->_isFailedSegment) {
    [v19 addObject:@"Error: failed segment"];
  }
  int v31 = objc_msgSend(NSString, "stringWithFormat:", @"%d points:\n", -[GEOMatchedPathSegment pointCount](self, "pointCount"));
  [v19 addObject:v31];

  __int16 v32 = NSString;
  int v33 = [v19 componentsJoinedByString:@" | "];
  __int16 v34 = [v32 stringWithFormat:@"%@%@", v33, v18];

  return v34;
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (GEOMapFeatureRoad)road
{
  return self->_road;
}

- (GEOPolylineCoordinateRange)roadRange
{
  PolylineCoordinate end = self->_roadRange.end;
  PolylineCoordinate start = self->_roadRange.start;
  result.PolylineCoordinate end = end;
  result.PolylineCoordinate start = start;
  return result;
}

- (BOOL)isPartialStart
{
  return self->_isPartialStart;
}

- (BOOL)isPartialEnd
{
  return self->_isPartialEnd;
}

- (BOOL)isDivergentSegment
{
  return self->_isDivergentSegment;
}

- (void)setIsDivergentSegment:(BOOL)a3
{
  self->_isDivergentSegment = a3;
}

- (BOOL)isFailedSegment
{
  return self->_isFailedSegment;
}

- (void).cxx_destruct
{
  begin = self->_coordinates.__begin_;
  if (begin)
  {
    self->_coordinates.__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_road, 0);

  objc_storeStrong((id *)&self->_route, 0);
}

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  *((void *)self + 4) = 0;
  *((void *)self + 5) = 0;
  *((void *)self + 6) = 0xBF80000000000000;
  *((void *)self + 7) = 0xBF80000000000000;
  return self;
}

@end