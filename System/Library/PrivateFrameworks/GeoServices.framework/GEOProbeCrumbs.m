@interface GEOProbeCrumbs
- (BOOL)enabled;
- (GEOProbeCrumbs)init;
- (GEOProbeCrumbs)initWithRoute:(id)a3;
- (id).cxx_construct;
- (id)_encodedDataForIntegersCount:(unsigned int)a3 valueCallback:(id)a4;
- (id)recentLocationHistory;
- (void)addLocation:(id)a3 polyCoordinate:(PolylineCoordinate)a4 timestamp:(unint64_t)a5;
- (void)clearCache;
- (void)dealloc;
- (void)resetStateWithRoute:(id)a3;
@end

@implementation GEOProbeCrumbs

- (GEOProbeCrumbs)init
{
  result = (GEOProbeCrumbs *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (GEOProbeCrumbs)initWithRoute:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOProbeCrumbs;
  v5 = [(GEOProbeCrumbs *)&v9 init];
  v6 = v5;
  if (v5)
  {
    [(GEOProbeCrumbs *)v5 resetStateWithRoute:v4];
    v7 = v6;
  }

  return v6;
}

- (void)dealloc
{
  [(GEOProbeCrumbs *)self clearCache];
  v3.receiver = self;
  v3.super_class = (Class)GEOProbeCrumbs;
  [(GEOProbeCrumbs *)&v3 dealloc];
}

- (void)addLocation:(id)a3 polyCoordinate:(PolylineCoordinate)a4 timestamp:(unint64_t)a5
{
  uint64_t v135 = *MEMORY[0x1E4F143B8];
  $F24F406B2B787EFB06265DBA3D28CBD5 v130 = a3;
  if (!self->_enabled)
  {
    v14 = GEOGetGEOProbeCrumbsLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_188D96000, v14, OS_LOG_TYPE_DEBUG, "addLocation - ignored (disabled)", buf, 2u);
    }

    return;
  }
  double var1 = a3.var1;
  double var0 = a3.var0;
  ++self->_crumbCounter;
  unint64_t UInteger = GEOConfigGetUInteger(GeoServicesConfig_ProbeCrumbFrequency, (uint64_t)off_1E9114E18);
  if (self->_crumbCounter % UInteger)
  {
    unint64_t v11 = UInteger;
    v12 = GEOGetGEOProbeCrumbsLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      unint64_t crumbCounter = self->_crumbCounter;
      *(_DWORD *)buf = 134218240;
      *(void *)v132 = crumbCounter;
      *(_WORD *)&v132[8] = 2048;
      *(void *)&v132[10] = v11;
      _os_log_impl(&dword_188D96000, v12, OS_LOG_TYPE_DEBUG, "addLocation - ignored (counter=%lu, frequency=%lu)", buf, 0x16u);
    }

    return;
  }
  unint64_t value = self->_locations.__size_.__value_;
  int v129 = +[GEOLatLngE7 toE7Coordinate:var0];
  int v128 = +[GEOLatLngE7 toE7Coordinate:var1];
  v16 = GEOGetGEOProbeCrumbsLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68158467;
    *(_DWORD *)v132 = 16;
    *(_WORD *)&v132[4] = 2097;
    *(void *)&v132[6] = &v130;
    *(_WORD *)&v132[14] = 1025;
    *(_DWORD *)&v132[16] = v129;
    __int16 v133 = 1025;
    int v134 = v128;
    _os_log_impl(&dword_188D96000, v16, OS_LOG_TYPE_DEBUG, "addLocation - raw:%{private,geo:coordinate}.*P\te7:%{private}d,%{private}d", buf, 0x1Eu);
  }

  [(GEOComposedRoute *)self->_route distanceToEndFromRouteCoordinate:a4];
  double v18 = v17;
  end = self->_locations.__map_.__end_;
  begin = self->_locations.__map_.__begin_;
  unint64_t v21 = end - begin;
  if (end == begin) {
    uint64_t v22 = 0;
  }
  else {
    uint64_t v22 = 170 * v21 - 1;
  }
  unint64_t start = self->_locations.__start_;
  unint64_t v24 = self->_locations.__size_.__value_ + start;
  if (v22 == v24)
  {
    if (start < 0xAA)
    {
      v39 = self->_locations.__map_.__end_cap_.__value_;
      first = self->_locations.__map_.__first_;
      if (v21 >= v39 - first)
      {
        if (v39 == first) {
          unint64_t v43 = 1;
        }
        else {
          unint64_t v43 = ((char *)v39 - (char *)first) >> 2;
        }
        v44 = (_GEOProbeCrumbsLocation **)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<google::protobuf::Message>>>(v43);
        uint64_t v46 = v45;
        unint64_t v127 = value;
        v47 = (_GEOProbeCrumbsLocation *)operator new(0xFF0uLL);
        v48 = &v44[v21];
        v49 = &v44[v46];
        if (v21 == v46)
        {
          uint64_t v50 = 8 * v21;
          if ((char *)end - (char *)begin < 1)
          {
            v93 = v47;
            uint64_t v94 = v50 >> 2;
            if (end == begin) {
              unint64_t v95 = 1;
            }
            else {
              unint64_t v95 = v94;
            }
            v96 = (_GEOProbeCrumbsLocation **)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<google::protobuf::Message>>>(v95);
            v48 = &v96[v95 >> 2];
            v49 = &v96[v97];
            if (v44) {
              operator delete(v44);
            }
            v44 = v96;
            v47 = v93;
          }
          else
          {
            uint64_t v51 = v50 >> 3;
            if (v51 >= -1) {
              unint64_t v52 = v51 + 1;
            }
            else {
              unint64_t v52 = v51 + 2;
            }
            v48 -= v52 >> 1;
          }
        }
        *v48 = v47;
        v98 = v48 + 1;
        for (i = self->_locations.__map_.__end_; i != self->_locations.__map_.__begin_; --i)
        {
          if (v48 == v44)
          {
            if (v98 >= v49)
            {
              if (v49 == v44) {
                unint64_t v104 = 1;
              }
              else {
                unint64_t v104 = ((char *)v49 - (char *)v44) >> 2;
              }
              v105 = (_GEOProbeCrumbsLocation **)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<google::protobuf::Message>>>(v104);
              v107 = v105;
              v48 = (_GEOProbeCrumbsLocation **)((char *)v105 + ((2 * v104 + 6) & 0xFFFFFFFFFFFFFFF8));
              uint64_t v108 = (char *)v98 - (char *)v44;
              BOOL v53 = v98 == v44;
              v98 = v48;
              if (!v53)
              {
                v98 = (_GEOProbeCrumbsLocation **)((char *)v48 + (v108 & 0xFFFFFFFFFFFFFFF8));
                uint64_t v109 = 8 * (v108 >> 3);
                v110 = v48;
                v111 = v44;
                do
                {
                  v112 = *v111++;
                  *v110++ = v112;
                  v109 -= 8;
                }
                while (v109);
              }
              v49 = &v105[v106];
              if (v44) {
                operator delete(v44);
              }
              v44 = v107;
            }
            else
            {
              uint64_t v100 = v49 - v98;
              if (v100 >= -1) {
                uint64_t v101 = v100 + 1;
              }
              else {
                uint64_t v101 = v100 + 2;
              }
              uint64_t v102 = v101 >> 1;
              v48 = &v44[v101 >> 1];
              v103 = v44;
              if (v98 != v44)
              {
                memmove(v48, v44, (char *)v98 - (char *)v44);
                v103 = v98;
              }
              v98 = &v103[v102];
            }
          }
          v113 = *(i - 1);
          *--v48 = v113;
        }
        v114 = self->_locations.__map_.__first_;
        self->_locations.__map_.__first_ = v44;
        self->_locations.__map_.__begin_ = v48;
        self->_locations.__map_.__end_ = v98;
        self->_locations.__map_.__end_cap_.__value_ = v49;
        unint64_t value = v127;
        if (v114) {
          operator delete(v114);
        }
        goto LABEL_46;
      }
      v41 = (_GEOProbeCrumbsLocation *)operator new(0xFF0uLL);
      v42 = v41;
      if (v39 == end)
      {
        if (begin == first)
        {
          if (end == begin) {
            unint64_t v71 = 1;
          }
          else {
            unint64_t v71 = ((char *)v39 - (char *)begin) >> 2;
          }
          v72 = (_GEOProbeCrumbsLocation **)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<google::protobuf::Message>>>(v71);
          begin = &v72[(v71 + 3) >> 2];
          v74 = self->_locations.__map_.__begin_;
          v75 = begin;
          uint64_t v76 = (char *)self->_locations.__map_.__end_ - (char *)v74;
          if (v76)
          {
            v75 = (_GEOProbeCrumbsLocation **)((char *)begin + (v76 & 0xFFFFFFFFFFFFFFF8));
            uint64_t v77 = 8 * (v76 >> 3);
            v78 = &v72[(v71 + 3) >> 2];
            do
            {
              v79 = *v74++;
              *v78++ = v79;
              v77 -= 8;
            }
            while (v77);
          }
          v80 = self->_locations.__map_.__first_;
          self->_locations.__map_.__first_ = v72;
          self->_locations.__map_.__begin_ = begin;
          self->_locations.__map_.__end_ = v75;
          self->_locations.__map_.__end_cap_.__value_ = &v72[v73];
          if (v80)
          {
            operator delete(v80);
            begin = self->_locations.__map_.__begin_;
          }
        }
        *(begin - 1) = v42;
        v81 = self->_locations.__map_.__begin_;
        v82 = self->_locations.__map_.__end_;
        self->_locations.__map_.__begin_ = v81 - 1;
        v83 = *(v81 - 1);
        self->_locations.__map_.__begin_ = v81;
        if (v82 == self->_locations.__map_.__end_cap_.__value_)
        {
          v84 = self->_locations.__map_.__first_;
          uint64_t v85 = (char *)v81 - (char *)v84;
          if (v81 <= v84)
          {
            uint64_t v115 = (char *)v82 - (char *)v84;
            BOOL v53 = v115 == 0;
            uint64_t v116 = v115 >> 2;
            if (v53) {
              unint64_t v117 = 1;
            }
            else {
              unint64_t v117 = v116;
            }
            v118 = (_GEOProbeCrumbsLocation **)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<google::protobuf::Message>>>(v117);
            v120 = &v118[v117 >> 2];
            v121 = self->_locations.__map_.__begin_;
            v82 = v120;
            uint64_t v122 = (char *)self->_locations.__map_.__end_ - (char *)v121;
            if (v122)
            {
              v82 = (_GEOProbeCrumbsLocation **)((char *)v120 + (v122 & 0xFFFFFFFFFFFFFFF8));
              uint64_t v123 = 8 * (v122 >> 3);
              v124 = &v118[v117 >> 2];
              do
              {
                v125 = *v121++;
                *v124++ = v125;
                v123 -= 8;
              }
              while (v123);
            }
            v126 = self->_locations.__map_.__first_;
            self->_locations.__map_.__first_ = v118;
            self->_locations.__map_.__begin_ = v120;
            self->_locations.__map_.__end_ = v82;
            self->_locations.__map_.__end_cap_.__value_ = &v118[v119];
            if (v126)
            {
              operator delete(v126);
              v82 = self->_locations.__map_.__end_;
            }
          }
          else
          {
            uint64_t v86 = v85 >> 3;
            BOOL v31 = v85 >> 3 < -1;
            uint64_t v87 = (v85 >> 3) + 2;
            if (v31) {
              uint64_t v88 = v87;
            }
            else {
              uint64_t v88 = v86 + 1;
            }
            uint64_t v89 = -(v88 >> 1);
            uint64_t v90 = v88 >> 1;
            v91 = &v81[-v90];
            int64_t v92 = (char *)v82 - (char *)v81;
            if (v82 != v81)
            {
              memmove(&v81[-v90], v81, (char *)v82 - (char *)v81);
              v81 = self->_locations.__map_.__begin_;
            }
            v82 = (_GEOProbeCrumbsLocation **)((char *)v91 + v92);
            self->_locations.__map_.__begin_ = &v81[v89];
            self->_locations.__map_.__end_ = (_GEOProbeCrumbsLocation **)((char *)v91 + v92);
          }
        }
        *v82 = v83;
      }
      else
      {
        *end = v41;
      }
    }
    else
    {
      self->_locations.__start_ = start - 170;
      v27 = *begin;
      v25 = begin + 1;
      v26 = v27;
      self->_locations.__map_.__begin_ = v25;
      if (end == self->_locations.__map_.__end_cap_.__value_)
      {
        v28 = self->_locations.__map_.__first_;
        uint64_t v29 = (char *)v25 - (char *)v28;
        if (v25 <= v28)
        {
          uint64_t v54 = (char *)end - (char *)v28;
          BOOL v53 = v54 == 0;
          uint64_t v55 = v54 >> 2;
          if (v53) {
            unint64_t v56 = 1;
          }
          else {
            unint64_t v56 = v55;
          }
          v57 = (_GEOProbeCrumbsLocation **)std::__allocate_at_least[abi:ne180100]<std::allocator<std::unique_ptr<google::protobuf::Message>>>(v56);
          v59 = &v57[v56 >> 2];
          v60 = self->_locations.__map_.__begin_;
          end = v59;
          uint64_t v61 = (char *)self->_locations.__map_.__end_ - (char *)v60;
          if (v61)
          {
            end = (_GEOProbeCrumbsLocation **)((char *)v59 + (v61 & 0xFFFFFFFFFFFFFFF8));
            uint64_t v62 = 8 * (v61 >> 3);
            v63 = &v57[v56 >> 2];
            do
            {
              v64 = *v60++;
              *v63++ = v64;
              v62 -= 8;
            }
            while (v62);
          }
          v65 = self->_locations.__map_.__first_;
          self->_locations.__map_.__first_ = v57;
          self->_locations.__map_.__begin_ = v59;
          self->_locations.__map_.__end_ = end;
          self->_locations.__map_.__end_cap_.__value_ = &v57[v58];
          if (v65)
          {
            operator delete(v65);
            end = self->_locations.__map_.__end_;
          }
        }
        else
        {
          uint64_t v30 = v29 >> 3;
          BOOL v31 = v29 >> 3 < -1;
          uint64_t v32 = (v29 >> 3) + 2;
          if (v31) {
            uint64_t v33 = v32;
          }
          else {
            uint64_t v33 = v30 + 1;
          }
          uint64_t v34 = -(v33 >> 1);
          uint64_t v35 = v33 >> 1;
          v36 = &v25[-v35];
          int64_t v37 = (char *)end - (char *)v25;
          if (end != v25)
          {
            memmove(&v25[-v35], v25, (char *)end - (char *)v25);
            end = self->_locations.__map_.__begin_;
          }
          v38 = &end[v34];
          end = (_GEOProbeCrumbsLocation **)((char *)v36 + v37);
          self->_locations.__map_.__begin_ = v38;
          self->_locations.__map_.__end_ = (_GEOProbeCrumbsLocation **)((char *)v36 + v37);
        }
      }
      *end = v26;
    }
    ++self->_locations.__map_.__end_;
LABEL_46:
    begin = self->_locations.__map_.__begin_;
    unint64_t v24 = self->_locations.__size_.__value_ + self->_locations.__start_;
  }
  unint64_t v66 = (unint64_t)begin[v24 / 0xAA] + 24 * (v24 % 0xAA);
  *(void *)unint64_t v66 = a5;
  *(_DWORD *)(v66 + 8) = v129;
  *(_DWORD *)(v66 + 12) = v128;
  *(void *)(v66 + 16) = (int)(v18 * 100.0);
  unint64_t v67 = self->_locations.__size_.__value_ + 1;
  self->_locations.__size_.__value_ = v67;
  unint64_t maxCrumbs = self->_maxCrumbs;
  if (v67 >= maxCrumbs)
  {
    unint64_t v69 = self->_locations.__start_;
    do
    {
      --v67;
      self->_locations.__start_ = ++v69;
      self->_locations.__size_.__value_ = v67;
      if (v69 >= 0x154)
      {
        operator delete(*(void **)self->_locations.__map_.__begin_);
        ++self->_locations.__map_.__begin_;
        unint64_t v67 = self->_locations.__size_.__value_;
        unint64_t v69 = self->_locations.__start_ - 170;
        self->_locations.__start_ = v69;
        unint64_t maxCrumbs = self->_maxCrumbs;
      }
    }
    while (v67 >= maxCrumbs);
  }
  else
  {
    if (value) {
      return;
    }
    unint64_t v69 = self->_locations.__start_;
  }
  v70 = (char *)self->_locations.__map_.__begin_[v69 / 0xAA] + 24 * (v69 % 0xAA);
  self->_baseE7Lat = *((_DWORD *)v70 + 2);
  self->_baseE7Lng = *((_DWORD *)v70 + 3);
  self->_baseTimestamp = *(void *)v70;
  self->_baseDistance = *((_DWORD *)v70 + 4);
}

- (void)clearCache
{
  objc_super v3 = GEOGetGEOProbeCrumbsLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)objc_super v9 = 0;
    _os_log_impl(&dword_188D96000, v3, OS_LOG_TYPE_DEBUG, "_clearCache", v9, 2u);
  }

  begin = self->_locations.__map_.__begin_;
  end = self->_locations.__map_.__end_;
  self->_locations.__size_.__value_ = 0;
  unint64_t v6 = (char *)end - (char *)begin;
  if (v6 >= 0x11)
  {
    do
    {
      operator delete(*begin);
      v7 = self->_locations.__map_.__end_;
      begin = self->_locations.__map_.__begin_ + 1;
      self->_locations.__map_.__begin_ = begin;
      unint64_t v6 = (char *)v7 - (char *)begin;
    }
    while (v6 > 0x10);
  }
  if (v6 >> 3 == 1)
  {
    unint64_t v8 = 85;
  }
  else
  {
    if (v6 >> 3 != 2) {
      return;
    }
    unint64_t v8 = 170;
  }
  self->_locations.__start_ = v8;
}

- (void)resetStateWithRoute:(id)a3
{
  id v5 = a3;
  unint64_t v6 = GEOGetGEOProbeCrumbsLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_188D96000, v6, OS_LOG_TYPE_DEBUG, "resetState", buf, 2u);
  }

  [(GEOProbeCrumbs *)self clearCache];
  objc_storeStrong((id *)&self->_route, a3);
  if (GEOConfigGetBOOL(GeoServicesConfig_ProbeCrumbsEnabled, (uint64_t)off_1E9114DF8))
  {
    uint64_t UInteger = GEOConfigGetUInteger(GeoServicesConfig_ProbeCrumbFrequency, (uint64_t)off_1E9114E18);
    self->_enabled = UInteger != 0;
    if (UInteger)
    {
      unint64_t v8 = GEOGetGEOProbeCrumbsLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_188D96000, v8, OS_LOG_TYPE_DEBUG, "enabled", v12, 2u);
      }

      unint64_t v9 = GEOConfigGetUInteger(GeoServicesConfig_ProbeCrumbDuration, (uint64_t)off_1E9114E08);
      self->_unint64_t maxCrumbs = v9 / GEOConfigGetUInteger(GeoServicesConfig_ProbeCrumbFrequency, (uint64_t)off_1E9114E18) + 1;
      goto LABEL_12;
    }
  }
  else
  {
    self->_enabled = 0;
  }
  v10 = GEOGetGEOProbeCrumbsLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)unint64_t v11 = 0;
    _os_log_impl(&dword_188D96000, v10, OS_LOG_TYPE_DEBUG, "disabled", v11, 2u);
  }

LABEL_12:
}

- (id)recentLocationHistory
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (!self->_enabled)
  {
    id v4 = GEOGetGEOProbeCrumbsLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_188D96000, v4, OS_LOG_TYPE_DEBUG, "recentLocationHistory - ignored (disabled)", buf, 2u);
    }
    goto LABEL_11;
  }
  unint64_t value = self->_locations.__size_.__value_;
  id v4 = GEOGetGEOProbeCrumbsLog();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (!value)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_188D96000, v4, OS_LOG_TYPE_DEBUG, "recentLocationHistory - ignored (nothing recorded)", buf, 2u);
    }
LABEL_11:

    v7 = 0;
    goto LABEL_12;
  }
  if (v5)
  {
    unint64_t v6 = self->_locations.__size_.__value_;
    *(_DWORD *)buf = 67109120;
    int v20 = v6;
    _os_log_impl(&dword_188D96000, v4, OS_LOG_TYPE_DEBUG, "recentLocationHistory - %d locations", buf, 8u);
  }

  v7 = objc_alloc_init(GEORecentLocationHistory);
  unint64_t v8 = [[GEOLatLngE7 alloc] initWithE7Latitude:self->_baseE7Lat longitude:self->_baseE7Lng];
  [(GEORecentLocationHistory *)v7 setBaseLocation:v8];

  [(GEORecentLocationHistory *)v7 setBaseTimestamp:self->_baseTimestamp];
  [(GEORecentLocationHistory *)v7 setLatlngCount:LODWORD(self->_locations.__size_.__value_)];
  uint64_t value_low = LODWORD(self->_locations.__size_.__value_);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __39__GEOProbeCrumbs_recentLocationHistory__block_invoke;
  v18[3] = &unk_1E53EDA90;
  v18[4] = self;
  v10 = [(GEOProbeCrumbs *)self _encodedDataForIntegersCount:value_low valueCallback:v18];
  [(GEORecentLocationHistory *)v7 setEncodedLats:v10];

  uint64_t v11 = LODWORD(self->_locations.__size_.__value_);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __39__GEOProbeCrumbs_recentLocationHistory__block_invoke_2;
  v17[3] = &unk_1E53EDA90;
  v17[4] = self;
  v12 = [(GEOProbeCrumbs *)self _encodedDataForIntegersCount:v11 valueCallback:v17];
  [(GEORecentLocationHistory *)v7 setEncodedLngs:v12];

  [(GEORecentLocationHistory *)v7 setTimeResolution:GEOConfigGetUInteger(GeoServicesConfig_ProbeCrumbFrequency, (uint64_t)off_1E9114E18)];
  [(GEORecentLocationHistory *)v7 setBaseDistanceToDestination:self->_baseDistance];
  uint64_t v13 = LODWORD(self->_locations.__size_.__value_);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __39__GEOProbeCrumbs_recentLocationHistory__block_invoke_3;
  v16[3] = &unk_1E53EDA90;
  v16[4] = self;
  v14 = [(GEOProbeCrumbs *)self _encodedDataForIntegersCount:v13 valueCallback:v16];
  [(GEORecentLocationHistory *)v7 setEncodedDistancesToDestination:v14];

LABEL_12:

  return v7;
}

uint64_t __39__GEOProbeCrumbs_recentLocationHistory__block_invoke(uint64_t a1, uint64_t a2)
{
  return *(unsigned int *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 72)
                                     + 8 * ((*(void *)(*(void *)(a1 + 32) + 96) + a2) / 0xAAuLL))
                         + 24 * ((*(void *)(*(void *)(a1 + 32) + 96) + a2) % 0xAAuLL)
                         + 8);
}

uint64_t __39__GEOProbeCrumbs_recentLocationHistory__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return *(unsigned int *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 72)
                                     + 8 * ((*(void *)(*(void *)(a1 + 32) + 96) + a2) / 0xAAuLL))
                         + 24 * ((*(void *)(*(void *)(a1 + 32) + 96) + a2) % 0xAAuLL)
                         + 12);
}

uint64_t __39__GEOProbeCrumbs_recentLocationHistory__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return *(unsigned int *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 72)
                                     + 8 * ((*(void *)(*(void *)(a1 + 32) + 96) + a2) / 0xAAuLL))
                         + 24 * ((*(void *)(*(void *)(a1 + 32) + 96) + a2) % 0xAAuLL)
                         + 16);
}

- (id)_encodedDataForIntegersCount:(unsigned int)a3 valueCallback:(id)a4
{
  BOOL v5 = (unsigned int (**)(id, void))a4;
  if (a3 >= 2)
  {
    maps::path_codec::geo3::RiceEncodedIntegers::RiceEncodedIntegers((maps::path_codec::geo3::RiceEncodedIntegers *)v43, 0);
    unsigned int v49 = 0;
    v45 &= ~2u;
    if ((uint64_t *)v48 != &google::protobuf::internal::fixed_address_empty_string)
    {
      unint64_t v7 = v48 & 0xFFFFFFFFFFFFFFFELL;
      if (*(char *)((v48 & 0xFFFFFFFFFFFFFFFELL) + 23) < 0)
      {
        **(unsigned char **)unint64_t v7 = 0;
        *(void *)(v7 + 8) = 0;
      }
      else
      {
        *(unsigned char *)unint64_t v7 = 0;
        *(unsigned char *)(v7 + 23) = 0;
      }
    }
    v45 &= ~1u;
    v46[0] = 0;
    int v8 = 0;
    int v9 = 0;
    int v10 = 0;
    unsigned int v41 = a3 - 1;
    unsigned int v11 = v5[2](v5, 0) >> 31;
    uint64_t v12 = 1;
    uint64_t v13 = a3;
    do
    {
      unsigned int v14 = v5[2](v5, v12);
      uint64_t v15 = v12 - 1;
      int v16 = v14 - ((uint64_t (*)(id, uint64_t))v5[2])(v5, v12 - 1);
      if (v16 >= 0) {
        int v17 = v16;
      }
      else {
        int v17 = -v16;
      }
      if ((v11 & 1) != v16 >> 31)
      {
        unsigned int v11 = v16 >> 31;
        int32x4_t v18 = (int32x4_t)vandq_s8((int8x16_t)vcgtq_u32((uint32x4_t)vdupq_n_s32((int)v12 - v10), (uint32x4_t)xmmword_18A6402B0), (int8x16_t)xmmword_18A6402C0);
        v18.i32[0] = vaddvq_s32(v18) & 0xF;
        *(int8x8_t *)v18.i8 = vcnt_s8(*(int8x8_t *)v18.i8);
        v18.i16[0] = vaddlv_u8(*(uint8x8_t *)v18.i8);
        v9 += v18.i32[0] + 1;
        int v10 = v12;
      }
      v8 += v17;
      ++v12;
    }
    while (v15 + 2 != v13);
    double v19 = log2(fmax((double)v8 / (double)v41 * 0.69, 2.0));
    unsigned int v40 = 8 * v9;
    if (8 * v9 > v41) {
      int v20 = 1;
    }
    else {
      int v20 = 2;
    }
    v45 |= 4u;
    int v50 = v20;
    unsigned int v49 = v5[2](v5, 0);
    v45 |= 3u;
    uint64_t v21 = (google::protobuf::internal::ArenaImpl *)(v44 & 0xFFFFFFFFFFFFFFFELL);
    if (v44) {
      uint64_t v21 = *(google::protobuf::internal::ArenaImpl **)v21;
    }
    uint64_t v22 = (char *)v48;
    if ((uint64_t *)v48 == &google::protobuf::internal::fixed_address_empty_string) {
      uint64_t v22 = google::protobuf::internal::ArenaStringPtr::MutableSlow<>((char **)&v48, v21);
    }
    *(_OWORD *)&v42.__r_.__value_.__l.__data_ = (unint64_t)v22;
    double v23 = ceil(v19) + 2.0;
    double v24 = 0.0;
    if (v40 > v41) {
      double v24 = 1.0;
    }
    maps::path_codec::BitStream::reserve((std::string **)&v42, (unint64_t)((v23 + v24) * (double)v41 * 0.125));
    int v39 = vcvtad_u64_f64(v19);
    maps::path_codec::BitStream::write((maps::path_codec::BitStream *)&v42, 5u, v39);
    int v25 = 0;
    unsigned int v26 = v49 >> 31;
    uint64_t v27 = 1;
    do
    {
      unsigned int v28 = v5[2](v5, v27);
      uint64_t v29 = v27 - 1;
      int v30 = v28 - ((uint64_t (*)(id, uint64_t))v5[2])(v5, v27 - 1);
      if (v40 <= v41)
      {
        if ((v26 & 1) != v30 >> 31)
        {
          int v31 = v27 - v25;
          uint64_t v32 = v46[0];
          if (v46[0] == v46[1])
          {
            unsigned int v33 = v46[0] + 1;
            google::protobuf::RepeatedField<int>::Reserve(v46, v46[0] + 1);
            *(_DWORD *)(v47 + 4 * v32) = v31;
          }
          else
          {
            *(_DWORD *)(v47 + 4 * v46[0]) = v31;
            unsigned int v33 = v32 + 1;
          }
          v46[0] = v33;
          LOBYTE(v26) = v26 ^ 1;
          int v25 = v27;
        }
      }
      else
      {
        maps::path_codec::BitStream::write((maps::path_codec::BitStream *)&v42, 1u, v30 >> 31);
      }
      if (v30 >= 0) {
        unsigned int v34 = v30;
      }
      else {
        unsigned int v34 = -v30;
      }
      maps::path_codec::BitStream::write_rice((maps::path_codec::BitStream *)&v42, v39, v34);
      ++v27;
    }
    while (v29 + 2 != v13);
    uint64_t v35 = (void *)v42.__r_.__value_.__r.__words[0];
    std::string::resize((std::string *)v42.__r_.__value_.__l.__data_, (LODWORD(v42.__r_.__value_.__r.__words[1]) + 7) >> 3, 0);
    std::string::shrink_to_fit[abi:ne180100](v35);
    memset(&v42, 0, sizeof(v42));
    google::protobuf::MessageLite::AppendPartialToString((uint64_t)v43, &v42);
    if ((v42.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      v36 = &v42;
    }
    else {
      v36 = (std::string *)v42.__r_.__value_.__r.__words[0];
    }
    if ((v42.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type size = HIBYTE(v42.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type size = v42.__r_.__value_.__l.__size_;
    }
    unint64_t v6 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v36, size, &v48);
    if (SHIBYTE(v42.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v42.__r_.__value_.__l.__data_);
    }
    maps::path_codec::geo3::RiceEncodedIntegers::~RiceEncodedIntegers((maps::path_codec::geo3::RiceEncodedIntegers *)v43);
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void).cxx_destruct
{
  begin = self->_locations.__map_.__begin_;
  end = self->_locations.__map_.__end_;
  self->_locations.__size_.__value_ = 0;
  unint64_t v5 = (char *)end - (char *)begin;
  if ((unint64_t)((char *)end - (char *)begin) >= 0x11)
  {
    do
    {
      operator delete(*begin);
      end = self->_locations.__map_.__end_;
      begin = self->_locations.__map_.__begin_ + 1;
      self->_locations.__map_.__begin_ = begin;
      unint64_t v5 = (char *)end - (char *)begin;
    }
    while ((unint64_t)((char *)end - (char *)begin) > 0x10);
  }
  unint64_t v6 = v5 >> 3;
  if (v6 == 1)
  {
    unint64_t v7 = 85;
    goto LABEL_7;
  }
  if (v6 == 2)
  {
    unint64_t v7 = 170;
LABEL_7:
    self->_locations.__start_ = v7;
  }
  if (begin != end)
  {
    do
    {
      int v8 = *begin++;
      operator delete(v8);
    }
    while (begin != end);
    int v10 = self->_locations.__map_.__begin_;
    int v9 = self->_locations.__map_.__end_;
    if (v9 != v10) {
      self->_locations.__map_.__end_ = (_GEOProbeCrumbsLocation **)((char *)v9
    }
                                                                  + (((char *)v10 - (char *)v9 + 7) & 0xFFFFFFFFFFFFFFF8));
  }
  first = self->_locations.__map_.__first_;
  if (first) {
    operator delete(first);
  }

  objc_storeStrong((id *)&self->_route, 0);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 6) = 0u;
  *((_OWORD *)self + 4) = 0u;
  return self;
}

@end