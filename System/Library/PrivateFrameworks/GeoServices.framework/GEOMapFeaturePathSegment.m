@interface GEOMapFeaturePathSegment
- ($1AB5FA073B851C12C2339EC22442E995)coordinateAt:(unint64_t)a3;
- (GEOMapFeaturePathSegment)initWithRoad:(id)a3 startFraction:(double)a4 endFraction:(double)a5;
- (GEOMapFeatureRoad)road;
- (double)length;
- (id).cxx_construct;
- (id)description;
- (unint64_t)coordinateCount;
@end

@implementation GEOMapFeaturePathSegment

- (GEOMapFeaturePathSegment)initWithRoad:(id)a3 startFraction:(double)a4 endFraction:(double)a5
{
  id v9 = a3;
  v136.receiver = self;
  v136.super_class = (Class)GEOMapFeaturePathSegment;
  v10 = [(GEOMapFeaturePathSegment *)&v136 init];
  v11 = v10;
  v12 = v10;
  if (!v10) {
    goto LABEL_109;
  }
  p_road = (id *)&v10->_road;
  objc_storeStrong((id *)&v10->_road, a3);
  if ([(GEOMapFeatureLine *)v12->_road coordinateCount] < 2) {
    goto LABEL_108;
  }
  p_coordinates = (double **)&v12->_coordinates;
  v12->_coordinates.__end_ = v12->_coordinates.__begin_;
  if (fabs(a4) < 0.01 && fabs(a5 + -1.0) < 0.01)
  {
    v15 = (char *)[*p_road coordinates3d];
    uint64_t v16 = [*p_road coordinates3d];
    uint64_t v17 = [*p_road coordinateCount];
    std::vector<GEOLocationCoordinate3D>::__assign_with_size[abi:ne180100]<GEOLocationCoordinate3D*,GEOLocationCoordinate3D*>((char *)&v12->_coordinates, v15, v16 + 24 * v17, 0xAAAAAAAAAAAAAAABLL * ((v16 + 24 * v17 - (uint64_t)v15) >> 3));
    [*p_road length];
    double v19 = v18;
    goto LABEL_107;
  }
  [*p_road length];
  double v21 = v20;
  [*p_road length];
  double v133 = v22;
  double v134 = a5;
  id v135 = v9;
  if ([*p_road coordinateCount] == 1)
  {
    unint64_t v23 = 0;
    double v24 = 0.0;
    goto LABEL_48;
  }
  uint64_t v25 = 0;
  unint64_t v23 = 0;
  double v26 = v21 * a4;
  double v27 = 0.0;
  while (1)
  {
    double v24 = v27;
    uint64_t v28 = [*p_road coordinates3d];
    uint64_t v29 = [*p_road coordinates3d];
    if (vabdd_f64(v27, v26) < 0.01)
    {
      value = v12->_coordinates.__end_cap_.__value_;
      end = v12->_coordinates.__end_;
      v38 = (long long *)(v28 + v25);
      if (end < value)
      {
        long long v39 = *v38;
        *((void *)end + 2) = *((void *)v38 + 2);
        *(_OWORD *)end = v39;
        v40 = (double *)((char *)end + 24);
        goto LABEL_47;
      }
      unint64_t v47 = 0xAAAAAAAAAAAAAAABLL * ((end - ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)*p_coordinates) >> 3);
      unint64_t v48 = v47 + 1;
      if (v47 + 1 <= 0xAAAAAAAAAAAAAAALL)
      {
        unint64_t v49 = 0xAAAAAAAAAAAAAAABLL * ((value - ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)*p_coordinates) >> 3);
        if (2 * v49 > v48) {
          unint64_t v48 = 2 * v49;
        }
        if (v49 >= 0x555555555555555) {
          unint64_t v50 = 0xAAAAAAAAAAAAAAALL;
        }
        else {
          unint64_t v50 = v48;
        }
        if (v50) {
          v51 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zilch::TrafficDynamicTile::Flow>>((uint64_t)&v12->_coordinates.__end_cap_, v50);
        }
        else {
          v51 = 0;
        }
        v58 = &v51[24 * v47];
        v59 = &v51[24 * v50];
        long long v60 = *v38;
        *((void *)v58 + 2) = *((void *)v38 + 2);
        *(_OWORD *)v58 = v60;
        v40 = (double *)(v58 + 24);
        begin = (double *)v12->_coordinates.__begin_;
        v52 = (double *)v12->_coordinates.__end_;
        if (v52 != begin)
        {
          do
          {
            long long v62 = *(_OWORD *)(v52 - 3);
            *((double *)v58 - 1) = *(v52 - 1);
            *(_OWORD *)(v58 - 24) = v62;
            v58 -= 24;
            v52 -= 3;
          }
          while (v52 != begin);
          v52 = *p_coordinates;
        }
        v12->_coordinates.__begin_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v58;
        goto LABEL_45;
      }
      goto LABEL_110;
    }
    uint64_t v30 = v29;
    double v32 = *(double *)(v28 + v25);
    double v31 = *(double *)(v28 + v25 + 8);
    double v34 = *(double *)(v29 + v25 + 24);
    double v33 = *(double *)(v29 + v25 + 32);
    double v35 = GEOCalculateDistanceRadius(v32, v31, v34, v33, 6367000.0);
    double v27 = v27 + v35;
    if (v24 < v26 && v26 < v27) {
      break;
    }
    ++v23;
    v25 += 24;
    if (v23 >= [*p_road coordinateCount] - 1) {
      goto LABEL_48;
    }
  }
  if (vabdd_f64(v26, v27) < 0.01) {
    goto LABEL_48;
  }
  double v41 = (v26 - v24) / v35;
  double v42 = v32 + (v34 - v32) * v41;
  double v43 = v31 + (v33 - v31) * v41;
  double v44 = *(double *)(v28 + v25 + 16) + (*(double *)(v30 + v25 + 40) - *(double *)(v28 + v25 + 16)) * v41;
  unint64_t v45 = (unint64_t)v12->_coordinates.__end_cap_.__value_;
  v46 = (double *)v12->_coordinates.__end_;
  if ((unint64_t)v46 < v45)
  {
    double *v46 = v42;
    v46[1] = v43;
    v40 = v46 + 3;
    v46[2] = v44;
    goto LABEL_47;
  }
  v52 = *p_coordinates;
  unint64_t v53 = 0xAAAAAAAAAAAAAAABLL * (v46 - *p_coordinates);
  unint64_t v54 = v53 + 1;
  if (v53 + 1 > 0xAAAAAAAAAAAAAAALL) {
    goto LABEL_110;
  }
  unint64_t v55 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v45 - (void)v52) >> 3);
  if (2 * v55 > v54) {
    unint64_t v54 = 2 * v55;
  }
  if (v55 >= 0x555555555555555) {
    unint64_t v56 = 0xAAAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v56 = v54;
  }
  if (v56)
  {
    v57 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zilch::TrafficDynamicTile::Flow>>((uint64_t)&v12->_coordinates.__end_cap_, v56);
    v52 = (double *)v12->_coordinates.__begin_;
    v46 = (double *)v12->_coordinates.__end_;
  }
  else
  {
    v57 = 0;
  }
  v63 = (double *)&v57[24 * v53];
  v59 = &v57[24 * v56];
  double *v63 = v42;
  v63[1] = v43;
  v63[2] = v44;
  v40 = v63 + 3;
  if (v46 != v52)
  {
    do
    {
      long long v64 = *(_OWORD *)(v46 - 3);
      *(v63 - 1) = *(v46 - 1);
      *(_OWORD *)(v63 - 3) = v64;
      v63 -= 3;
      v46 -= 3;
    }
    while (v46 != v52);
    v52 = *p_coordinates;
  }
  v12->_coordinates.__begin_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v63;
LABEL_45:
  v12->_coordinates.__end_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v40;
  v12->_coordinates.__end_cap_.__value_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v59;
  if (v52) {
    operator delete(v52);
  }
LABEL_47:
  v12->_coordinates.__end_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v40;
LABEL_48:
  unint64_t v65 = [*p_road coordinateCount];
  double v66 = v134;
  unint64_t v67 = v23 + 1;
  if (v23 + 1 >= v65) {
    goto LABEL_104;
  }
  double v68 = v133 * v134;
  uint64_t p_end_cap = (uint64_t)&v11->_coordinates.__end_cap_;
  while (2)
  {
    unint64_t v70 = v67;
    v71 = (double *)(objc_msgSend(*p_road, "coordinates3d", v66) + 24 * v23);
    uint64_t v72 = [*p_road coordinates3d] + 24 * v70;
    double v74 = *v71;
    double v73 = v71[1];
    double v76 = *(double *)v72;
    double v75 = *(double *)(v72 + 8);
    double v77 = GEOCalculateDistanceRadius(*v71, v73, *(double *)v72, v75, 6367000.0);
    double v78 = v24 + v77;
    if (vabdd_f64(v68, v24 + v77) < 0.01)
    {
      v96 = v12->_coordinates.__end_;
      v95 = v12->_coordinates.__end_cap_.__value_;
      if (v96 < v95)
      {
        long long v97 = *(_OWORD *)v72;
        *((void *)v96 + 2) = *(void *)(v72 + 16);
        *(_OWORD *)v96 = v97;
        v98 = (double *)((char *)v96 + 24);
        goto LABEL_103;
      }
      unint64_t v105 = 0xAAAAAAAAAAAAAAABLL * ((v96 - ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)*p_coordinates) >> 3);
      unint64_t v106 = v105 + 1;
      if (v105 + 1 <= 0xAAAAAAAAAAAAAAALL)
      {
        unint64_t v107 = 0xAAAAAAAAAAAAAAABLL * ((v95 - ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)*p_coordinates) >> 3);
        if (2 * v107 > v106) {
          unint64_t v106 = 2 * v107;
        }
        if (v107 >= 0x555555555555555) {
          unint64_t v108 = 0xAAAAAAAAAAAAAAALL;
        }
        else {
          unint64_t v108 = v106;
        }
        if (v108) {
          v109 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zilch::TrafficDynamicTile::Flow>>(p_end_cap, v108);
        }
        else {
          v109 = 0;
        }
        v116 = &v109[24 * v105];
        v117 = &v109[24 * v108];
        long long v118 = *(_OWORD *)v72;
        *((void *)v116 + 2) = *(void *)(v72 + 16);
        *(_OWORD *)v116 = v118;
        v98 = (double *)(v116 + 24);
        v119 = (double *)v12->_coordinates.__begin_;
        v110 = (double *)v12->_coordinates.__end_;
        if (v110 != v119)
        {
          do
          {
            long long v120 = *(_OWORD *)(v110 - 3);
            *((double *)v116 - 1) = *(v110 - 1);
            *(_OWORD *)(v116 - 24) = v120;
            v116 -= 24;
            v110 -= 3;
          }
          while (v110 != v119);
          v110 = *p_coordinates;
        }
        v12->_coordinates.__begin_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v116;
        goto LABEL_101;
      }
      goto LABEL_110;
    }
    if (v24 > v68 || v68 > v78)
    {
      v80 = v12->_coordinates.__end_;
      v79 = v12->_coordinates.__end_cap_.__value_;
      if (v80 >= v79)
      {
        unint64_t v83 = 0xAAAAAAAAAAAAAAABLL * ((v80 - ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)*p_coordinates) >> 3);
        unint64_t v84 = v83 + 1;
        if (v83 + 1 > 0xAAAAAAAAAAAAAAALL) {
          goto LABEL_110;
        }
        unint64_t v85 = 0xAAAAAAAAAAAAAAABLL * ((v79 - ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)*p_coordinates) >> 3);
        if (2 * v85 > v84) {
          unint64_t v84 = 2 * v85;
        }
        if (v85 >= 0x555555555555555) {
          unint64_t v86 = 0xAAAAAAAAAAAAAAALL;
        }
        else {
          unint64_t v86 = v84;
        }
        if (v86) {
          v87 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zilch::TrafficDynamicTile::Flow>>(p_end_cap, v86);
        }
        else {
          v87 = 0;
        }
        v88 = &v87[24 * v83];
        long long v89 = *(_OWORD *)v72;
        *((void *)v88 + 2) = *(void *)(v72 + 16);
        *(_OWORD *)v88 = v89;
        v91 = (double *)v12->_coordinates.__begin_;
        v90 = (double *)v12->_coordinates.__end_;
        v92 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v88;
        if (v90 != v91)
        {
          do
          {
            long long v93 = *(_OWORD *)(v90 - 3);
            *((double *)v92 - 1) = *(v90 - 1);
            *(_OWORD *)((char *)v92 - 24) = v93;
            v92 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v92 - 24);
            v90 -= 3;
          }
          while (v90 != v91);
          v90 = *p_coordinates;
        }
        v82 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v88 + 24);
        v12->_coordinates.__begin_ = v92;
        v12->_coordinates.__end_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v88 + 24);
        v12->_coordinates.__end_cap_.__value_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v87[24 * v86];
        if (v90) {
          operator delete(v90);
        }
      }
      else
      {
        long long v81 = *(_OWORD *)v72;
        *((void *)v80 + 2) = *(void *)(v72 + 16);
        *(_OWORD *)v80 = v81;
        v82 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v80 + 24);
      }
      v12->_coordinates.__end_ = v82;
      unint64_t v94 = [(GEOMapFeatureLine *)v12->_road coordinateCount];
      unint64_t v67 = v70 + 1;
      double v24 = v78;
      unint64_t v23 = v70;
      if (v70 + 1 >= v94) {
        goto LABEL_104;
      }
      continue;
    }
    break;
  }
  double v99 = (v68 - v24) / v77;
  double v100 = v74 + (v76 - v74) * v99;
  double v101 = v73 + (v75 - v73) * v99;
  double v102 = v71[2] + (*(double *)(v72 + 16) - v71[2]) * v99;
  v104 = (double *)v12->_coordinates.__end_;
  unint64_t v103 = (unint64_t)v12->_coordinates.__end_cap_.__value_;
  if ((unint64_t)v104 < v103)
  {
    double *v104 = v100;
    v104[1] = v101;
    v98 = v104 + 3;
    v104[2] = v102;
    goto LABEL_103;
  }
  v110 = *p_coordinates;
  unint64_t v111 = 0xAAAAAAAAAAAAAAABLL * (v104 - *p_coordinates);
  unint64_t v112 = v111 + 1;
  if (v111 + 1 > 0xAAAAAAAAAAAAAAALL) {
LABEL_110:
  }
    std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
  unint64_t v113 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v103 - (void)v110) >> 3);
  if (2 * v113 > v112) {
    unint64_t v112 = 2 * v113;
  }
  if (v113 >= 0x555555555555555) {
    unint64_t v114 = 0xAAAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v114 = v112;
  }
  if (v114)
  {
    v115 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zilch::TrafficDynamicTile::Flow>>(p_end_cap, v114);
    v110 = (double *)v12->_coordinates.__begin_;
    v104 = (double *)v12->_coordinates.__end_;
  }
  else
  {
    v115 = 0;
  }
  v121 = (double *)&v115[24 * v111];
  v117 = &v115[24 * v114];
  double *v121 = v100;
  v121[1] = v101;
  v121[2] = v102;
  v98 = v121 + 3;
  if (v104 != v110)
  {
    do
    {
      long long v122 = *(_OWORD *)(v104 - 3);
      *(v121 - 1) = *(v104 - 1);
      *(_OWORD *)(v121 - 3) = v122;
      v121 -= 3;
      v104 -= 3;
    }
    while (v104 != v110);
    v110 = *p_coordinates;
  }
  v12->_coordinates.__begin_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v121;
LABEL_101:
  v12->_coordinates.__end_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v98;
  v12->_coordinates.__end_cap_.__value_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v117;
  if (v110) {
    operator delete(v110);
  }
LABEL_103:
  v12->_coordinates.__end_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v98;
LABEL_104:
  v123 = (double *)v12->_coordinates.__begin_;
  unint64_t v124 = 0xAAAAAAAAAAAAAAABLL * ((v12->_coordinates.__end_ - ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v123) >> 3);
  double v19 = 0.0;
  id v9 = v135;
  if (v124 >= 2)
  {
    double v125 = *v123;
    double v126 = v123[1];
    unint64_t v127 = v124 - 1;
    v128 = v123 + 4;
    do
    {
      double v129 = *(v128 - 1);
      double v130 = *v128;
      double v19 = v19 + GEOCalculateDistanceRadius(v125, v126, v129, *v128, 6367000.0);
      v128 += 3;
      double v126 = v130;
      double v125 = v129;
      --v127;
    }
    while (v127);
  }
LABEL_107:
  v12->_length = v19;
LABEL_108:
  v131 = v12;
LABEL_109:

  return v12;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:0xAAAAAAAAAAAAAAABLL * ((self->_coordinates.__end_ - self->_coordinates.__begin_) >> 3)];
  v4 = [NSString stringWithFormat:@"GEOMapFeaturePathSegment - %0.1f meters, %d coordinates:", *(void *)&self->_length, 0xAAAAAAAAAAAAAAABLL * ((self->_coordinates.__end_ - self->_coordinates.__begin_) >> 3)];
  [v3 addObject:v4];

  begin = self->_coordinates.__begin_;
  for (i = self->_coordinates.__end_; begin != i; begin = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + 24))
  {
    v7 = [NSString stringWithFormat:@"%f, %f", *(void *)begin, *((void *)begin + 1)];
    [v3 addObject:v7];
  }
  v8 = [v3 componentsJoinedByString:@"\n"];

  return v8;
}

- (unint64_t)coordinateCount
{
  return 0xAAAAAAAAAAAAAAABLL * ((self->_coordinates.__end_ - self->_coordinates.__begin_) >> 3);
}

- ($1AB5FA073B851C12C2339EC22442E995)coordinateAt:(unint64_t)a3
{
  begin = self->_coordinates.__begin_;
  if (0xAAAAAAAAAAAAAAABLL * ((self->_coordinates.__end_ - begin) >> 3) <= a3)
  {
    double v7 = 1.79769313e308;
    double v5 = -180.0;
    double v6 = -180.0;
  }
  else
  {
    v4 = (double *)((char *)begin + 24 * a3);
    double v5 = *v4;
    double v6 = v4[1];
    double v7 = v4[2];
  }
  result.var2 = v7;
  result.var1 = v6;
  result.var0 = v5;
  return result;
}

- (double)length
{
  return self->_length;
}

- (GEOMapFeatureRoad)road
{
  return self->_road;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_road, 0);
  begin = self->_coordinates.__begin_;
  if (begin)
  {
    self->_coordinates.__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

@end