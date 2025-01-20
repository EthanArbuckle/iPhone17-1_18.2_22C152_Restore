_NUIViewContainerViewInfo *_NUIContainerViewInfoCreateIfNeeded(objc_object *a1, int a2)
{
  _NUIViewContainerViewInfo *AssociatedObject;
  _NUIViewContainerViewInfo *v5;

  AssociatedObject = (_NUIViewContainerViewInfo *)objc_getAssociatedObject(a1, "containerViewInfoKey");
  if (!AssociatedObject
    || (v5 = AssociatedObject, a2)
    && AssociatedObject == (_NUIViewContainerViewInfo *)_NUIContainerViewInfoCreateIfNeeded(objc_object *,BOOL)::defaultInfo)
  {
    if (a2)
    {
      v5 = objc_alloc_init(_NUIViewContainerViewInfo);
      objc_setAssociatedObject(a1, "containerViewInfoKey", v5, (void *)1);
    }
    else
    {
      if (_NUIContainerViewInfoCreateIfNeeded(objc_object *,BOOL)::onceToken != -1) {
        dispatch_once(&_NUIContainerViewInfoCreateIfNeeded(objc_object *,BOOL)::onceToken, &__block_literal_global);
      }
      return (_NUIViewContainerViewInfo *)_NUIContainerViewInfoCreateIfNeeded(objc_object *,BOOL)::defaultInfo;
    }
  }
  return v5;
}

_NUIGridArrangement *_NUIGridArrangement::resetForInvalidation(_NUIGridArrangement *this, char a2)
{
  if ((a2 & 4) != 0)
  {
    this->cells.__end_ = this->cells.__begin_;
  }
  else
  {
    begin = this->cells.__begin_;
    end = this->cells.__end_;
    if (begin != end)
    {
      v4 = (_OWORD *)MEMORY[0x1E4F1DB30];
      do
      {
        *(_OWORD *)((char *)begin + 24) = *v4;
        *(_OWORD *)((char *)begin + 40) = *v4;
        *((void *)begin + 11) = 0;
        *((void *)begin + 12) = 0;
        begin = (_NUIGridArrangementCell *)((char *)begin + 112);
      }
      while (begin != end);
    }
  }
  this->hasValidMeasurement = 0;
  this->columns.__end_ = this->columns.__begin_;
  this->rows.__end_ = this->rows.__begin_;
  this->viewFrames.__end_ = this->viewFrames.__begin_;
  return this;
}

uint64_t _NUIIsDebuggerAttached()
{
  if (_NUIIsDebuggerAttached::onceToken != -1) {
    dispatch_once(&_NUIIsDebuggerAttached::onceToken, &__block_literal_global_1);
  }
  return _NUIIsDebuggerAttached::isDebugged;
}

void _NUIGridArrangement::measureCells(_NUIGridArrangement *this, int a2, CGSize a3)
{
  double height = a3.height;
  double width = a3.width;
  p_cells = (uint64_t *)&this->cells;
  if (this->cells.__end_ == this->cells.__begin_)
  {
    [(_NUIGridArrangementContainer *)this->container populateGridArrangementCells:p_cells];
    begin = this->cells.__begin_;
    end = this->cells.__end_;
    if (end == begin) {
      return;
    }
    do
    {
      [*(id *)begin contentCompressionResistancePriorityForAxis:0];
      int v11 = v10;
      [*(id *)begin contentCompressionResistancePriorityForAxis:1];
      *((_DWORD *)begin + 2) = v11;
      *((_DWORD *)begin + 3) = v12;
      [*(id *)begin contentHuggingPriorityForAxis:0];
      int v14 = v13;
      [*(id *)begin contentHuggingPriorityForAxis:1];
      *((_DWORD *)begin + 4) = v14;
      *((_DWORD *)begin + 5) = v15;
      begin = (_NUIGridArrangementCell *)((char *)begin + 112);
    }
    while (begin != end);
  }
  if (this->columns.__end_ == this->columns.__begin_) {
    [(_NUIGridArrangementContainer *)this->container populateGridArrangementDimension:&this->columns withCells:p_cells axis:0];
  }
  v16 = this->rows.__begin_;
  v17 = this->rows.__end_;
  p_rows = &this->rows;
  int v58 = a2;
  if (v17 == v16)
  {
    [(_NUIGridArrangementContainer *)this->container populateGridArrangementDimension:&this->rows withCells:p_cells axis:1];
    v16 = this->rows.__begin_;
    v17 = this->rows.__end_;
  }
  uint64_t v19 = (v17 - v16) >> 3;
  int v20 = -1227133513 * v19;
  unint64_t v21 = (unsigned __int16)(28087 * ((LODWORD(this->columns.__end_) - LODWORD(this->columns.__begin_)) >> 3));
  unint64_t v22 = (unsigned __int16)(28087 * v19);
  v23 = this->cells.__begin_;
  for (i = this->cells.__end_; v23 != i; v23 = (_NUIGridArrangementCell *)((char *)v23 + 112))
  {
    BOOL v25 = !this->baselineRelative || *((void *)v23 + 9) == 0;
    if (!v25 || *((unsigned __int8 *)v23 + 105) << 8 == 512)
    {
      [*(id *)v23 effectiveFirstBaselineOffsetFromContentTop];
      *((double *)v23 + 11) = v26;
      if (v26 != 2.22507386e-308)
      {
        uint64_t v27 = (uint64_t)p_rows->__begin_ + 56 * *((void *)v23 + 9);
        if (*(double *)(v27 + 32) > v26) {
          double v26 = *(double *)(v27 + 32);
        }
        *(double *)(v27 + 32) = v26;
      }
    }
    if (this->baselineRelative && *((void *)v23 + 10) + *((void *)v23 + 9) < v22
      || *((unsigned __int8 *)v23 + 105) << 8 == 1280)
    {
      [*(id *)v23 effectiveBaselineOffsetFromContentBottom];
      *((double *)v23 + 12) = v28;
      if (v28 != 2.22507386e-308)
      {
        uint64_t v29 = (uint64_t)p_rows->__begin_ + 56 * *((void *)v23 + 9) + 56 * *((void *)v23 + 10);
        if (*(double *)(v29 - 16) > v28) {
          double v28 = *(double *)(v29 - 16);
        }
        *(double *)(v29 - 16) = v28;
      }
    }
  }
  double v30 = 0.0;
  double v31 = 0.0;
  unint64_t v32 = v21 - 1;
  if (v21 != 1)
  {
    v33 = this->columns.__begin_;
    do
    {
      double v31 = v31 + *(double *)v33;
      if (this->baselineRelative) {
        double v31 = v31 - *((double *)v33 + 11) - *((double *)v33 + 5);
      }
      v33 = (_NUIGridArrangementDimension *)((char *)v33 + 56);
      --v32;
    }
    while (v32);
  }
  unint64_t v34 = v22 - 1;
  if (v22 != 1)
  {
    v35 = (double *)p_rows->__begin_;
    double v30 = 0.0;
    do
    {
      double v30 = v30 + *v35;
      if (this->baselineRelative) {
        double v30 = v30 - v35[11] - v35[5];
      }
      v35 += 7;
      --v34;
    }
    while (v34);
  }
  double v36 = width - v31;
  if (v36 > 0.0)
  {
    double v37 = height - v30;
    if (v37 > 0.0)
    {
      if (objc_opt_respondsToSelector()) {
        int v39 = [(_NUIGridArrangementContainer *)this->container canCancelMeasurementForCompression];
      }
      else {
        int v39 = 0;
      }
      int v40 = v20 << 16;
      v38.n128_f64[0] = v36;
      v41.n128_f64[0] = _NUIGridArrangementHelper::calculateDimensionMinMax((uint64_t)this->container, v39, 1, p_cells, (uint64_t *)&this->rows, (uint64_t *)&this->columns, this->baselineRelative, v38, v37);
      int v42 = *((unsigned __int8 *)this + 8);
      if (v42 == 1)
      {
        v43 = this->columns.__begin_;
        v44 = this->columns.__end_;
        if (v43 == v44)
        {
          v41.n128_u64[0] = 0;
        }
        else
        {
          double v45 = 0.0;
          v46 = this->columns.__begin_;
          do
          {
            if (v45 <= *((double *)v46 + 1)) {
              double v45 = *((double *)v46 + 1);
            }
            v46 = (_NUIGridArrangementDimension *)((char *)v46 + 56);
          }
          while (v46 != v44);
          v41.n128_u64[0] = 0;
          do
          {
            if (*((float *)v43 + 7) >= 1000.0)
            {
              double v47 = *((double *)v43 + 1);
            }
            else
            {
              *((double *)v43 + 1) = v45;
              double v47 = v45;
            }
            v41.n128_f64[0] = v41.n128_f64[0] + v47;
            v43 = (_NUIGridArrangementDimension *)((char *)v43 + 56);
          }
          while (v43 != v44);
          LOWORD(v42) = *((_WORD *)this + 4);
        }
      }
      unint64_t v48 = v40 & 0xFFFF0000 | v21;
      _NUIGridArrangementHelper::compressDimensionIfNeeded(this->container, v39, 1, (char)v42, v48, &this->columns.__begin_, v41, v36, v37);
      if (v49.n128_f64[0] >= 0.0)
      {
        if (v58) {
          _NUIGridArrangementHelper::expandDimensionIfNeeded(1, *((char *)this + 8), v48, (double **)&this->columns, v49, v36, v37);
        }
        v49.n128_f64[0] = v36;
        v50.n128_f64[0] = _NUIGridArrangementHelper::calculateDimensionMinMax((uint64_t)this->container, v39, 0, p_cells, (uint64_t *)&this->rows, (uint64_t *)&this->columns, this->baselineRelative, v49, v37);
        __int16 v51 = *((_WORD *)this + 4);
        if ((v51 & 0xFF00) == 0x100)
        {
          v52 = this->rows.__begin_;
          v53 = this->rows.__end_;
          if (v52 == v53)
          {
            v50.n128_u64[0] = 0;
          }
          else
          {
            double v54 = 0.0;
            v55 = this->rows.__begin_;
            do
            {
              if (v54 <= *((double *)v55 + 1)) {
                double v54 = *((double *)v55 + 1);
              }
              v55 = (_NUIGridArrangementDimension *)((char *)v55 + 56);
            }
            while (v55 != v53);
            v50.n128_u64[0] = 0;
            do
            {
              if (*((float *)v52 + 7) >= 1000.0)
              {
                double v56 = *((double *)v52 + 1);
              }
              else
              {
                *((double *)v52 + 1) = v54;
                double v56 = v54;
              }
              v50.n128_f64[0] = v50.n128_f64[0] + v56;
              v52 = (_NUIGridArrangementDimension *)((char *)v52 + 56);
            }
            while (v52 != v53);
            __int16 v51 = *((_WORD *)this + 4);
          }
        }
        _NUIGridArrangementHelper::compressDimensionIfNeeded(this->container, v39, 0, (char)v51, v48, &this->rows.__begin_, v50, v36, v37);
        if (v57.n128_f64[0] >= 0.0)
        {
          if (v58) {
            _NUIGridArrangementHelper::expandDimensionIfNeeded(0, *((char *)this + 9), v48, (double **)&this->rows, v57, v36, v37);
          }
          this->hasValidMeasurement = 1;
        }
      }
    }
  }
}

void _NUIGridArrangementHelper::compressDimensionIfNeeded(void *a1, int a2, int a3, uint64_t a4, unint64_t a5, void *a6, __n128 a7, double a8, double a9)
{
  double v9 = a7.n128_f64[0];
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    a8 = a9;
  }
  a7.n128_f64[0] = a8 - a7.n128_f64[0];
  if (a7.n128_f64[0] < -0.001)
  {
    if (!a2
      || (char v15 = [a1 shouldCancelMeasurementForCompressionInAxis:a3 ^ 1u],
          a7.n128_u64[0] = -1.0,
          (v15 & 1) == 0))
    {
      double v16 = v9 - a8;
      if (a3) {
        LOWORD(v17) = a5;
      }
      else {
        unint64_t v17 = a5 >> 16;
      }
      MEMORY[0x1F4188790](a7);
      uint64_t v19 = (int8x8_t *)((char *)&v71 - v18);
      bzero((char *)&v71 - v18, (8 * (unint64_t)(unsigned __int16)v17 + 504) >> 6);
      unint64_t v76 = (unsigned __int16)v17;
      v77 = v19;
      bzero(v19, (8 * (unint64_t)(unsigned __int16)v17 + 504) >> 6);
      unint64_t v21 = (unsigned __int16)v17 - 64;
      if ((unsigned __int16)v17 < 0x40uLL)
      {
        unint64_t v23 = 0;
        char v24 = v17;
      }
      else
      {
        unint64_t v22 = v21 >> 6;
        memset(v19, 255, 8 * (v21 >> 6) + 8);
        unint64_t v23 = v22 + 1;
        char v24 = v17 & 0x3F;
      }
      *(void *)&v19[v23] |= ~(-1 << v24);
      MEMORY[0x1F4188790](v20);
      double v26 = (int8x8_t *)((char *)&v71 - v25);
      bzero((char *)&v71 - v25, (8 * (unint64_t)(unsigned __int16)v17 + 504) >> 6);
      unint64_t v74 = (unsigned __int16)v17;
      v75 = v26;
      bzero(v26, (8 * (unint64_t)(unsigned __int16)v17 + 504) >> 6);
      while (v16 > 0.001)
      {
        if (v76 + 63 < 0x40) {
          break;
        }
        uint64_t v27 = 0;
        unint64_t v28 = (v76 + 63) >> 6;
        uint64_t v29 = v77;
        do
        {
          int8x8_t v30 = *v29++;
          uint8x8_t v31 = (uint8x8_t)vcnt_s8(v30);
          v31.i16[0] = vaddlv_u8(v31);
          v27 += v31.u32[0];
          --v28;
        }
        while (v28);
        if (!v27) {
          break;
        }
        nui::stack_bitset::begin((nui::stack_bitset *)&v76);
        unint64_t v34 = v33;
        v72 = &v76;
        unint64_t v73 = v33;
        unint64_t v35 = v76;
        if (v33 != v76)
        {
          float v36 = 2000.0;
          do
          {
            float v37 = *(float *)(*a6 + 56 * v34 + 24);
            if (v37 <= v36)
            {
              if (v37 < v36)
              {
                __n128 v38 = v75;
                if (v74 + 63 >= 0x40) {
                  bzero(v75, ((v74 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                float v36 = v37;
              }
              else
              {
                __n128 v38 = v75;
              }
              *(void *)((char *)v38 + ((v34 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v34;
            }
            nui::stack_bitset::iterator::operator++((uint64_t)&v72);
            unint64_t v34 = v73;
          }
          while (v73 != v35 || v72 != &v76);
          unint64_t v34 = v76;
        }
        if (v34 + 63 >= 0x40)
        {
          unint64_t v39 = (v34 + 63) >> 6;
          int v40 = v75;
          __n128 v41 = v77;
          do
          {
            uint64_t v42 = (uint64_t)*v40++;
            *(void *)v41++ &= ~v42;
            --v39;
          }
          while (v39);
        }
        while (v16 > 0.001)
        {
          if (v74 + 63 < 0x40) {
            break;
          }
          uint64_t v43 = 0;
          unint64_t v44 = (v74 + 63) >> 6;
          double v45 = v75;
          do
          {
            int8x8_t v46 = *v45++;
            v32.n128_u64[0] = (unint64_t)vcnt_s8(v46);
            v32.n128_u16[0] = vaddlv_u8((uint8x8_t)v32.n128_u64[0]);
            v43 += v32.n128_u32[0];
            --v44;
          }
          while (v44);
          if (!v43) {
            break;
          }
          MEMORY[0x1F4188790](v32);
          unint64_t v48 = (char *)&v71 - v47;
          if (a4 == 2)
          {
            nui::stack_bitset::begin((nui::stack_bitset *)&v74);
            v72 = &v74;
            unint64_t v73 = v49;
            unint64_t v50 = v74;
            if (v49 == v74)
            {
              double v51 = 0.0;
            }
            else
            {
              double v51 = 0.0;
              do
              {
                do
                {
                  double v51 = v51 + *(double *)(*a6 + 56 * v49 + 16);
                  nui::stack_bitset::iterator::operator++((uint64_t)&v72);
                  unint64_t v49 = v73;
                }
                while (v73 != v50);
              }
              while (v72 != &v74);
            }
            nui::stack_bitset::begin((nui::stack_bitset *)&v74);
            v52 = &v74;
            unint64_t v54 = v53;
            v72 = &v74;
            unint64_t v73 = v53;
            if (v53 != v74)
            {
              do
              {
                double v55 = *(double *)(*a6 + 56 * v54 + 8);
                if (v55 <= 0.001)
                {
                  v52 = (unint64_t *)nui::stack_bitset::erase(&v74, (uint64_t)v52, v54);
                  unint64_t v54 = v56;
                  v72 = v52;
                  unint64_t v73 = v56;
                }
                else
                {
                  if (v16 * (v55 / v51) < v55) {
                    double v55 = v16 * (v55 / v51);
                  }
                  *(double *)&v48[8 * v54] = v55;
                  nui::stack_bitset::iterator::operator++((uint64_t)&v72);
                  v52 = v72;
                  unint64_t v54 = v73;
                }
              }
              while (v54 != v74 || v52 != &v74);
            }
          }
          else
          {
            if (v74 + 63 >= 0x40)
            {
              unint64_t v57 = 0;
              unint64_t v58 = (v74 + 63) >> 6;
              v59 = v75;
              do
              {
                int8x8_t v60 = *v59++;
                uint8x8_t v61 = (uint8x8_t)vcnt_s8(v60);
                v61.i16[0] = vaddlv_u8(v61);
                v57 += v61.u32[0];
                --v58;
              }
              while (v58);
            }
            else
            {
              unint64_t v57 = 0;
            }
            nui::stack_bitset::begin((nui::stack_bitset *)&v74);
            v72 = &v74;
            unint64_t v73 = v62;
            if (v62 != v74)
            {
              v63 = &v74;
              unint64_t v64 = v62;
              double v65 = v16 / (double)v57;
              do
              {
                double v66 = *(double *)(*a6 + 56 * v64 + 8);
                if (v66 <= 0.001)
                {
                  v63 = (unint64_t *)nui::stack_bitset::erase(&v74, (uint64_t)v63, v64);
                  unint64_t v64 = v67;
                  v72 = v63;
                  unint64_t v73 = v67;
                }
                else
                {
                  if (v65 >= v66) {
                    double v65 = *(double *)(*a6 + 56 * v64 + 8);
                  }
                  *(double *)&v48[8 * v64] = v65;
                  nui::stack_bitset::iterator::operator++((uint64_t)&v72);
                  v63 = v72;
                  unint64_t v64 = v73;
                }
              }
              while (v64 != v74 || v63 != &v74);
            }
          }
          nui::stack_bitset::begin((nui::stack_bitset *)&v74);
          v72 = &v74;
          unint64_t v73 = v68;
          unint64_t v69 = v74;
          if (v68 != v74)
          {
            do
            {
              do
              {
                double v70 = *(double *)&v48[8 * v68];
                double v16 = v16 - v70;
                *(double *)(*a6 + 56 * v68 + 8) = *(double *)(*a6 + 56 * v68 + 8) - v70;
                nui::stack_bitset::iterator::operator++((uint64_t)&v72);
                unint64_t v68 = v73;
              }
              while (v73 != v69);
            }
            while (v72 != &v74);
          }
        }
      }
    }
  }
}

double _NUIGridArrangementHelper::calculateDimensionMinMax(uint64_t a1, int a2, int a3, uint64_t *a4, uint64_t *a5, uint64_t *a6, int a7, __n128 a8, double a9)
{
  int v27 = a7;
  unint64_t v28 = a4;
  unint64_t v13 = a8.n128_u64[0];
  double v26 = *(double *)&a1;
  v34[8] = *MEMORY[0x1E4F143B8];
  if (a3) {
    char v15 = a6;
  }
  else {
    char v15 = a5;
  }
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x4012000000;
  v34[3] = __Block_byref_object_copy__122;
  v34[4] = __Block_byref_object_dispose__123;
  v34[5] = &unk_1AE6778DD;
  uint64_t v16 = 0x6DB6DB6DB6DB6DB7 * ((v15[1] - *v15) >> 3);
  size_t v17 = (unint64_t)(0x6DB6DB6DB6DB6DB8 * ((v15[1] - *v15) >> 3) + 504) >> 6;
  MEMORY[0x1F4188790](a8);
  uint64_t v18 = (v17 + 15) & 0x7FFFFFFFFFFFFF0;
  v34[6] = v16;
  v34[7] = (char *)&v26 - v18;
  bzero((char *)&v26 - v18, v17);
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x4012000000;
  v33[3] = __Block_byref_object_copy__122;
  v33[4] = __Block_byref_object_dispose__123;
  v33[5] = &unk_1AE6778DD;
  MEMORY[0x1F4188790](v19);
  v33[6] = v16;
  v33[7] = (char *)&v26 - v18;
  bzero((char *)&v26 - v18, v17);
  *(void *)&v29[0] = MEMORY[0x1E4F143A8];
  v20.n128_u64[0] = 3221225472;
  *(void *)&v29[1] = 3221225472;
  *(void *)&v29[2] = ___ZN25_NUIGridArrangementHelper24calculateDimensionMinMaxEPU39objcproto28_NUIGridArrangementContainer11objc_objectbbRNSt3__16vectorI23_NUIGridArrangementCellNS2_9allocatorIS4_EEEERNS3_I28_NUIGridArrangementDimensionNS5_IS9_EEEESC_6CGSizeb_block_invoke;
  *(void *)&v29[3] = &unk_1E5EFF318;
  char v30 = a3;
  char v31 = v27;
  *(void *)&v29[8] = v13;
  v29[9] = a9;
  char v32 = a3 & ~(_BYTE)a2;
  *(void *)&v29[10] = a5;
  *(void *)&v29[11] = a6;
  v29[4] = v26;
  *(void *)&v29[5] = v34;
  *(void *)&v29[7] = v15;
  *(void *)&v29[6] = v33;
  _NUIGridArrangementHelper::enumerateCellRanges(v28, a3, a3 & ~a2, (uint64_t)v29, v20);
  uint64_t v21 = *v15;
  uint64_t v22 = v15[1];
  double v23 = 0.0;
  while (v21 != v22)
  {
    if (NUIContainerViewLengthIsDefault(*(double *)(v21 + 8)))
    {
      double v24 = *(double *)(v21 + 16);
      *(double *)(v21 + 8) = v24;
    }
    else
    {
      double v24 = *(double *)(v21 + 8);
    }
    double v23 = v23 + v24;
    v21 += 56;
  }
  _Block_object_dispose(v33, 8);
  _Block_object_dispose(v34, 8);
  return v23;
}

void sub_1AE656B4C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 256), 8);
  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Unwind_Resume(a1);
}

uint64_t _NUIGridArrangementHelper::enumerateCellRanges(uint64_t *a1, int a2, int a3, uint64_t a4, __n128 a5)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = *a1;
  uint64_t v8 = a1[1];
  MEMORY[0x1F4188790](a5);
  int v11 = &v22[-v10];
  bzero(&v22[-v10], v12);
  if (v8 == v9)
  {
    unint64_t v13 = 0;
  }
  else
  {
    unint64_t v13 = 0;
    int v14 = v11 + 1;
    do
    {
      if (a2) {
        uint64_t v15 = 56;
      }
      else {
        uint64_t v15 = 72;
      }
      long long v16 = *(_OWORD *)(v9 + v15);
      *((void *)v14 - 1) = v9;
      *int v14 = v16;
      int v14 = (_OWORD *)((char *)v14 + 24);
      ++v13;
      v9 += 112;
    }
    while (v9 != v8);
  }
  size_t v17 = &v11[3 * v13];
  if (a3) {
    __int16 v18 = 256;
  }
  else {
    __int16 v18 = 0;
  }
  __int16 v23 = v18 | a2;
  unint64_t v19 = 126 - 2 * __clz(v13);
  if (v13) {
    uint64_t v20 = v19;
  }
  else {
    uint64_t v20 = 0;
  }
  uint64_t result = std::__introsort<std::_ClassicAlgPolicy,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::{lambda(_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&)#1} &,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell*,false>((uint64_t)v11, (__n128 *)&v11[3 * v13], (unsigned __int8 *)&v23, v20, 1);
  if (v13)
  {
    do
    {
      uint64_t result = (*(uint64_t (**)(uint64_t, void, void, void))(a4 + 16))(a4, *v11, v11[1], v11[2]);
      v11 += 3;
    }
    while (v11 != v17);
  }
  return result;
}

void ___ZN25_NUIGridArrangementHelper24calculateDimensionMinMaxEPU39objcproto28_NUIGridArrangementContainer11objc_objectbbRNSt3__16vectorI23_NUIGridArrangementCellNS2_9allocatorIS4_EEEERNS3_I28_NUIGridArrangementDimensionNS5_IS9_EEEESC_6CGSizeb_block_invoke(uint64_t a1, void *a2, unint64_t a3, unint64_t a4)
{
  unint64_t v4 = a4;
  int v8 = *(unsigned __int8 *)(a1 + 96);
  uint64_t v9 = (float *)(a2 + 1);
  if (!*(unsigned char *)(a1 + 96)) {
    uint64_t v9 = (float *)a2 + 3;
  }
  float v10 = *v9;
  int v11 = (float *)(a2 + 2);
  if (!*(unsigned char *)(a1 + 96)) {
    int v11 = (float *)a2 + 5;
  }
  float v12 = *v11;
  unint64_t v13 = a4 - 1;
  if (a4 == 1)
  {
    if (!NUIContainerViewLengthIsDefault(*(double *)(**(void **)(a1 + 56) + 56 * a3 + 8)))
    {
      double v56 = *(double *)(**(void **)(a1 + 56) + 56 * a3 + 8);
      goto LABEL_80;
    }
    int v8 = *(unsigned __int8 *)(a1 + 96);
  }
  if (v8) {
    BOOL v14 = 0;
  }
  else {
    BOOL v14 = *(unsigned char *)(a1 + 97) != 0;
  }
  uint64_t v15 = *(uint64_t **)(a1 + 56);
  double v16 = 0.0;
  if (a3 < a3 + v4 - 1)
  {
    size_t v17 = (double *)(*v15 + 56 * a3);
    do
    {
      double v16 = v16 + *v17;
      if (v14) {
        double v16 = v16 - v17[11] - v17[5];
      }
      v17 += 7;
      --v13;
    }
    while (v13);
  }
  double v19 = *(double *)(a1 + 64);
  double v18 = *(double *)(a1 + 72);
  if (v8)
  {
    if (v19 < 1.70141173e38)
    {
      double v20 = v16 + v19;
      double v21 = 0.0;
      if (*(unsigned char *)(a1 + 98))
      {
        uint64_t v22 = *v15;
        uint64_t v23 = v15[1];
        if (*v15 != v23)
        {
          unint64_t v24 = 0;
          do
          {
            BOOL v26 = v24 - a3 < v4 && a3 <= v24 || *(float *)(v22 + 24) <= v10;
            if (!v26 && !NUIContainerViewLengthIsDefault(*(double *)(v22 + 16))) {
              double v21 = v21 + *(double *)(v22 + 16);
            }
            ++v24;
            v22 += 56;
          }
          while (v22 != v23);
        }
      }
      double v19 = v20 - v21;
    }
    if (v18 < 1.70141173e38)
    {
      unint64_t v27 = a2[9];
      uint64_t v28 = a2[10];
      double v29 = 0.0;
      if (v27 < v27 + v28 - 1)
      {
        char v30 = (double *)(**(void **)(a1 + 80) + 56 * v27);
        uint64_t v31 = v28 - 1;
        do
        {
          double v29 = v29 + *v30;
          if (*(unsigned char *)(a1 + 97)) {
            double v29 = v29 - v30[11] - v30[5];
          }
          v30 += 7;
          --v31;
        }
        while (v31);
      }
      double v18 = v18 + v29;
    }
  }
  else
  {
    if (v19 < 1.70141173e38)
    {
      unint64_t v32 = a2[7];
      uint64_t v33 = a2[8];
      unint64_t v34 = *(void **)(a1 + 88);
      double v35 = 0.0;
      double v36 = 0.0;
      if (v32 < v33 + v32)
      {
        float v37 = (double *)(*v34 + 56 * v32 + 8);
        uint64_t v38 = a2[8];
        do
        {
          double v39 = *v37;
          v37 += 7;
          double v36 = v36 + v39;
          --v38;
        }
        while (v38);
      }
      if (v32 < v33 + v32 - 1)
      {
        uint64_t v40 = v33 - 1;
        __n128 v41 = (double *)(*v34 + 56 * v32);
        double v35 = 0.0;
        do
        {
          double v42 = *v41;
          v41 += 7;
          double v35 = v35 + v42;
          --v40;
        }
        while (v40);
      }
      double v19 = v36 + v35;
    }
    if (v18 < 1.70141173e38)
    {
      double v43 = v16 + v18;
      double v44 = 0.0;
      if (*(unsigned char *)(a1 + 98))
      {
        uint64_t v45 = *v15;
        uint64_t v46 = v15[1];
        if (*v15 != v46)
        {
          unint64_t v47 = 0;
          do
          {
            BOOL v49 = v47 - a3 < v4 && a3 <= v47 || *(float *)(v45 + 24) <= v10;
            if (!v49 && !NUIContainerViewLengthIsDefault(*(double *)(v45 + 16))) {
              double v44 = v44 + *(double *)(v45 + 16);
            }
            ++v47;
            v45 += 56;
          }
          while (v45 != v46);
        }
      }
      double v18 = v43 - v44;
    }
  }
  unint64_t v50 = *(void **)(a1 + 32);
  double v51 = *((double *)a2 + 5);
  if (vabdd_f64(v51, *MEMORY[0x1E4F1DB30]) >= 0.001
    || vabdd_f64(*((double *)a2 + 6), *(double *)(MEMORY[0x1E4F1DB30] + 8)) >= 0.001)
  {
    if (vabdd_f64(v51, v19) < 0.001)
    {
      if (vabdd_f64(*((double *)a2 + 6), v18) < 0.001)
      {
        double v52 = *((double *)a2 + 4);
        goto LABEL_75;
      }
LABEL_73:
      double v52 = *((double *)a2 + 4);
      if (v18 - v52 >= -0.001) {
        goto LABEL_75;
      }
      goto LABEL_74;
    }
    double v53 = v19 - *((double *)a2 + 3);
    char v54 = [(id)*a2 isLayoutSizeDependentOnPerpendicularAxis];
    if (v53 < -0.001) {
      char v55 = 1;
    }
    else {
      char v55 = v54;
    }
    if ((v55 & 1) == 0) {
      goto LABEL_73;
    }
  }
LABEL_74:
  objc_msgSend(v50, "contentLayoutSizeFittingSize:forArrangedSubview:", *a2, v19, v18);
  a2[3] = v57;
  *((double *)a2 + 4) = v52;
  *((double *)a2 + 5) = v19;
  *((double *)a2 + 6) = v18;
LABEL_75:
  double v58 = *((double *)a2 + 3);
  if (!*(unsigned char *)(a1 + 96)) {
    double v58 = v52;
  }
  double v59 = 0.0;
  if (!*(unsigned char *)(a1 + 96))
  {
    int v99 = *((unsigned __int8 *)a2 + 105) << 8;
    if (v99 == 1280)
    {
      double v101 = *((double *)a2 + 12);
      if (v101 != 2.22507386e-308) {
        double v59 = *(double *)(**(void **)(a1 + 80) + 56 * (a2[9] + a2[10]) - 16) - v101;
      }
    }
    else if (v99 == 512)
    {
      double v100 = *((double *)a2 + 11);
      if (v100 != 2.22507386e-308)
      {
        double v60 = *(double *)(**(void **)(a1 + 80) + 56 * a2[9] + 32) - v100;
        goto LABEL_79;
      }
    }
  }
  double v60 = 0.0;
LABEL_79:
  double v56 = v58 + v60 + v59 - v16;
LABEL_80:
  uint64_t v61 = *(void *)(*(void *)(a1 + 40) + 8);
  unint64_t v62 = *(void *)(v61 + 48) + 63;
  if (v62 >= 0x40) {
    bzero(*(void **)(v61 + 56), (v62 >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  if (a3 < a3 + v4)
  {
    uint64_t v63 = 56 * a3;
    unint64_t v64 = v4;
    unint64_t v65 = a3;
    do
    {
      uint64_t v66 = **(void **)(a1 + 56) + v63;
      if (*(double *)(v66 + 16) >= v56) {
        double v67 = v56;
      }
      else {
        double v67 = *(double *)(v66 + 16);
      }
      if (NUIContainerViewLengthIsDefault(*(double *)(v66 + 8)))
      {
        uint64_t v68 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 56);
        *(void *)(v68 + ((v65 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v65;
      }
      double v56 = v56 - v67;
      ++v65;
      v63 += 56;
      --v64;
    }
    while (v64);
  }
  if (v56 > 0.001)
  {
    uint64_t v69 = *(void *)(*(void *)(a1 + 48) + 8);
    unint64_t v70 = *(void *)(v69 + 48) + 63;
    if (v70 >= 0x40) {
      bzero(*(void **)(v69 + 56), (v70 >> 3) & 0x1FFFFFFFFFFFFFF8);
    }
    uint64_t v71 = (nui::stack_bitset *)(*(void *)(*(void *)(a1 + 40) + 8) + 48);
    nui::stack_bitset::begin(v71);
    v102 = v71;
    unint64_t v103 = v72;
    uint64_t v73 = *(void *)v71;
    if (v72 != *(void *)v71)
    {
      unint64_t v74 = v72;
      float v75 = 2000.0;
      do
      {
        float v76 = *(float *)(**(void **)(a1 + 56) + 56 * v74 + 28);
        if (v76 <= v75)
        {
          uint64_t v77 = *(void *)(a1 + 48);
          if (v76 < v75)
          {
            uint64_t v78 = *(void *)(v77 + 8);
            unint64_t v79 = *(void *)(v78 + 48) + 63;
            if (v79 >= 0x40)
            {
              bzero(*(void **)(v78 + 56), (v79 >> 3) & 0x1FFFFFFFFFFFFFF8);
              uint64_t v77 = *(void *)(a1 + 48);
            }
          }
          else
          {
            float v76 = v75;
          }
          *(void *)(*(void *)(*(void *)(v77 + 8) + 56) + ((v74 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v74;
          float v75 = v76;
        }
        nui::stack_bitset::iterator::operator++((uint64_t)&v102);
        unint64_t v74 = v103;
      }
      while (v103 != v73 || v102 != v71);
    }
    uint64_t v81 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v83 = *(void *)(v81 + 48);
    v82 = (nui::stack_bitset *)(v81 + 48);
    unint64_t v84 = v83 + 63;
    double v85 = 0.0;
    if ((unint64_t)(v83 + 63) >= 0x40)
    {
      unint64_t v86 = 0;
      unint64_t v87 = v84 >> 6;
      v88 = *(int8x8_t **)(*(void *)(*(void *)(a1 + 48) + 8) + 56);
      do
      {
        int8x8_t v89 = *v88++;
        uint8x8_t v90 = (uint8x8_t)vcnt_s8(v89);
        v90.i16[0] = vaddlv_u8(v90);
        v86 += v90.u32[0];
        --v87;
      }
      while (v87);
      double v85 = (double)v86;
    }
    double v91 = v56 / v85;
    nui::stack_bitset::begin(v82);
    v102 = v82;
    unint64_t v103 = v92;
    uint64_t v93 = *(void *)v82;
    if (v92 != *(void *)v82)
    {
      do
      {
        uint64_t v94 = **(void **)(a1 + 56) + 56 * v92;
        *(double *)(v94 + 16) = v91 + *(double *)(v94 + 16);
        nui::stack_bitset::iterator::operator++((uint64_t)&v102);
        unint64_t v92 = v103;
      }
      while (v103 != v93 || v102 != v82);
    }
  }
  if (a3 < a3 + v4)
  {
    v96 = (float *)(**(void **)(a1 + 56) + 56 * a3 + 28);
    do
    {
      if (*(v96 - 1) <= v10) {
        float v97 = v10;
      }
      else {
        float v97 = *(v96 - 1);
      }
      float v98 = *v96;
      if (*v96 <= v12) {
        float v98 = v12;
      }
      *(v96 - 1) = v97;
      float *v96 = v98;
      v96 += 14;
      --v4;
    }
    while (v4);
  }
}

BOOL NUIContainerViewLengthIsDefault(double a1)
{
  return a1 >= 1.79769313e308;
}

unint64_t *nui::stack_bitset::iterator::operator++(uint64_t a1)
{
  uint64_t v1 = *(unint64_t **)a1;
  unint64_t v2 = *(void *)(a1 + 8) + 1;
  unint64_t v3 = **(void **)a1;
  if (v2 < v3)
  {
    unint64_t v4 = v1[1];
    while ((*(void *)(v4 + ((v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) & (-1 << v2)) == 0)
    {
      unint64_t v2 = (v2 & 0xFFFFFFFFFFFFFFC0) + 64;
      if (v2 >= v3) {
        goto LABEL_7;
      }
    }
    unint64_t v2 = __clz(__rbit64(*(void *)(v4 + ((v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) & (-1 << v2))) | v2 & 0xFFFFFFFFFFFFFFC0;
  }
LABEL_7:
  if (v2 >= v3) {
    unint64_t v5 = **(void **)a1;
  }
  else {
    unint64_t v5 = v2;
  }
  *(void *)(a1 + 8) = v5;
  return v1;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> nui::stack_bitset::begin(nui::stack_bitset *this)
{
  v1[1] = 0;
  if ((**((unsigned char **)this + 1) & 1) == 0) {
    nui::stack_bitset::iterator::operator++((uint64_t)v1);
  }
}

uint64_t nui_size_cache::find_size(nui_size_cache *this, CGSize a2, char a3, CGSize *a4)
{
  begin = (double *)this->__begin_;
  end = this->__end_;
  if (this->__begin_ == end) {
    return 0;
  }
  while (1)
  {
    double v6 = *begin;
    if (vabdd_f64(*begin, a2.width) < 0.001
      || (v6 - a2.width < -0.001 ? (char v7 = a3) : (char v7 = 0),
          (v7 & 1) == 0 && (double v8 = begin[2], v8 - v6 < -0.001) && v8 - a2.width < 0.001))
    {
      double v9 = begin[1];
      if (vabdd_f64(v9, a2.height) < 0.001) {
        break;
      }
      double v10 = begin[3];
      if (v10 - v9 < -0.001 && v10 - a2.height < 0.001) {
        break;
      }
    }
    begin += 4;
    if (begin == end) {
      return 0;
    }
  }
  *a4 = *(CGSize *)(begin + 2);
  return 1;
}

uint64_t std::__introsort<std::_ClassicAlgPolicy,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::{lambda(_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&)#1} &,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell*,false>(uint64_t result, __n128 *a2, unsigned __int8 *a3, uint64_t a4, char a5)
{
  double v10 = (uint64_t *)result;
LABEL_2:
  int v11 = (__n128 *)v10;
LABEL_3:
  uint64_t v12 = 1 - a4;
  while (1)
  {
    double v10 = (uint64_t *)v11;
    uint64_t v13 = v12;
    uint64_t v14 = (char *)a2 - (char *)v11;
    unint64_t v15 = 0xAAAAAAAAAAAAAAABLL * (((char *)a2 - (char *)v11) >> 3);
    if (!(!v6 & v5))
    {
      switch(v15)
      {
        case 0uLL:
        case 1uLL:
          return result;
        case 2uLL:
          unint64_t v36 = a2[-2].n128_u64[1];
          double v35 = &a2[-2].n128_i8[8];
          unint64_t v34 = v36;
          uint64_t v37 = 8;
          if (!*a3) {
            uint64_t v37 = 12;
          }
          float v38 = *(float *)(v34 + v37) - *(float *)(v11->n128_u64[0] + v37);
          uint64_t v39 = *((void *)v35 + 2);
          unint64_t v40 = v11[1].n128_u64[0];
          uint64_t v41 = v39 - v40;
          if (a3[1])
          {
            BOOL v42 = v41 < 0;
            if (v38 != 0.0) {
              BOOL v42 = v38 > 0.0;
            }
            if (!v42) {
              return result;
            }
          }
          else
          {
            BOOL v43 = v41 < 0;
            if (v39 == v40) {
              BOOL v44 = v38 > 0.0;
            }
            else {
              BOOL v44 = v43;
            }
            if (!v44) {
              return result;
            }
          }
          unint64_t v49 = v11[1].n128_u64[0];
          __n128 v47 = *v11;
          __n128 v45 = *(__n128 *)v35;
          v11[1].n128_u64[0] = *((void *)v35 + 2);
          *int v11 = v45;
          *(__n128 *)double v35 = v47;
          *((void *)v35 + 2) = v49;
          return result;
        case 3uLL:
          return std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::{lambda(_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&)#1} &,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell*>(v11, &v11[1].n128_u64[1], &a2[-2].n128_u64[1], a3);
        case 4uLL:
          return std::__sort4[abi:nn180100]<std::_ClassicAlgPolicy,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::{lambda(_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&)#1} &,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell*>(v11, &v11[1].n128_u64[1], (__n128 *)v11[3].n128_u64, &a2[-2].n128_u64[1], a3);
        case 5uLL:
          return std::__sort5[abi:nn180100]<std::_ClassicAlgPolicy,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::{lambda(_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&)#1} &,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell*>(v11, &v11[1].n128_u64[1], (__n128 *)v11[3].n128_u64, &v11[4].n128_u64[1], &a2[-2].n128_u64[1], a3);
        default:
          JUMPOUT(0);
      }
    }
    if (v14 <= 575) {
      break;
    }
    if (v13 == 1)
    {
      if (v11 != a2)
      {
        return (uint64_t)std::__partial_sort_impl[abi:nn180100]<std::_ClassicAlgPolicy,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::{lambda(_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&)#1} &,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell*,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell*>(v11, a2, a2, a3);
      }
      return result;
    }
    unint64_t v16 = v15 >> 1;
    size_t v17 = &v11->n128_u64[3 * (v15 >> 1)];
    if ((unint64_t)v14 >= 0xC01)
    {
      std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::{lambda(_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&)#1} &,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell*>(v11, &v11->n128_u64[3 * (v15 >> 1)], &a2[-2].n128_u64[1], a3);
      uint64_t v18 = 3 * v16;
      double v19 = (void *)&v11[-1] + 3 * v16 - 1;
      std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::{lambda(_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&)#1} &,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell*>(&v11[1].n128_u64[1], v19, (__n128 *)a2[-3].n128_u64, a3);
      double v20 = v11 + 3;
      double v21 = &v11[1].n128_u64[v18 + 1];
      std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::{lambda(_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&)#1} &,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell*>(v20, v21, &a2[-5].n128_u64[1], a3);
      std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::{lambda(_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&)#1} &,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell*>(v19, v17, v21, a3);
      uint64_t v48 = v10[2];
      long long v46 = *(_OWORD *)v10;
      long long v22 = *(_OWORD *)v17;
      v10[2] = v17[2];
      *(_OWORD *)double v10 = v22;
      v17[2] = v48;
      *(_OWORD *)size_t v17 = v46;
      if (a5) {
        goto LABEL_24;
      }
    }
    else
    {
      std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::{lambda(_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&)#1} &,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell*>(&v11->n128_u64[3 * (v15 >> 1)], v11, &a2[-2].n128_u64[1], a3);
      if (a5) {
        goto LABEL_24;
      }
    }
    uint64_t v23 = 8;
    if (!*a3) {
      uint64_t v23 = 12;
    }
    float v24 = *(float *)(*(v10 - 3) + v23) - *(float *)(*v10 + v23);
    uint64_t v25 = *(v10 - 1);
    uint64_t v26 = v10[2];
    uint64_t v27 = v25 - v26;
    if (a3[1])
    {
      BOOL v28 = v27 < 0;
      if (v24 != 0.0) {
        BOOL v28 = v24 > 0.0;
      }
      if (!v28)
      {
LABEL_28:
        uint64_t result = (uint64_t)std::__partition_with_equals_on_left[abi:nn180100]<std::_ClassicAlgPolicy,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell *,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::{lambda(_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&)#1} &>(v10, a2, a3);
        int v11 = (__n128 *)result;
        goto LABEL_29;
      }
    }
    else
    {
      BOOL v29 = v27 < 0;
      if (v25 == v26) {
        BOOL v30 = v24 > 0.0;
      }
      else {
        BOOL v30 = v29;
      }
      if (!v30) {
        goto LABEL_28;
      }
    }
LABEL_24:
    uint64_t v31 = (void *)std::__partition_with_equals_on_right[abi:nn180100]<std::_ClassicAlgPolicy,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell *,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::{lambda(_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&)#1} &>(v10, a2, a3);
    if ((v32 & 1) == 0) {
      goto LABEL_27;
    }
    BOOL v33 = std::__insertion_sort_incomplete[abi:nn180100]<std::_ClassicAlgPolicy,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::{lambda(_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&)#1} &,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell*>(v10, v31, a3);
    int v11 = (__n128 *)(v31 + 3);
    uint64_t result = std::__insertion_sort_incomplete[abi:nn180100]<std::_ClassicAlgPolicy,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::{lambda(_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&)#1} &,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell*>(v31 + 3, a2, a3);
    if (result)
    {
      a4 = -v13;
      a2 = (__n128 *)v31;
      if (v33) {
        return result;
      }
      goto LABEL_2;
    }
    uint64_t v12 = v13 + 1;
    if (!v33)
    {
LABEL_27:
      uint64_t result = std::__introsort<std::_ClassicAlgPolicy,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::{lambda(_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&)#1} &,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell*,false>(v10, v31, a3, -v13, a5 & 1);
      int v11 = (__n128 *)(v31 + 3);
LABEL_29:
      a5 = 0;
      a4 = -v13;
      goto LABEL_3;
    }
  }
  if (a5)
  {
    return (uint64_t)std::__insertion_sort[abi:nn180100]<std::_ClassicAlgPolicy,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::{lambda(_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&)#1} &,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell*>(v11, a2, a3);
  }
  else
  {
    return (uint64_t)std::__insertion_sort_unguarded[abi:nn180100]<std::_ClassicAlgPolicy,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::{lambda(_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&)#1} &,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell*>(v11, a2, a3);
  }
}

double _NUIGridArrangementHelper::expandDimensionIfNeeded(int a1, uint64_t a2, unint64_t a3, double **a4, __n128 a5, double a6, double a7)
{
  double v7 = a5.n128_f64[0];
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  if (a1) {
    a5.n128_f64[0] = a6;
  }
  else {
    a5.n128_f64[0] = a7;
  }
  if (v7 - a5.n128_f64[0] < -0.001 && (unint64_t)(a2 - 6) >= 3)
  {
    double v10 = a5.n128_f64[0] - v7;
    if ((unint64_t)(a2 - 3) <= 2)
    {
      int v11 = *a4;
      int64_t v12 = (char *)a4[1] - (char *)*a4;
      if (v12 == 56)
      {
        v11[1] = v10 + v11[1];
      }
      else
      {
        uint64_t v13 = v12 / 56 - 1;
        if (a2 != 3)
        {
          int v26 = MEMORY[0x1F4188790](a5);
          unint64_t v34 = (char *)&v98 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
          double v35 = *a4;
          double v36 = (*a4)[1];
          double v37 = (*a4)[7 * v29 + 1];
          if (a2 == 5)
          {
            double v38 = v37 - v36;
            if (v37 - v36 < 0.0) {
              double v38 = 0.0;
            }
            double v10 = v10 - v38;
            if (v36 < v37) {
              double v37 = (*a4)[1];
            }
            double v39 = v37;
          }
          else
          {
            double v39 = (*a4)[1];
          }
          double v61 = 0.0;
          double v62 = 0.0;
          if (v27 >= 1)
          {
            uint64_t v63 = v35 + 1;
            uint64_t v64 = v31;
            do
            {
              double v65 = *v63;
              v63 += 7;
              double v62 = v62 + v65;
              --v64;
            }
            while (v64);
          }
          int v66 = v28 & ~v26;
          if (v32 != v30)
          {
            double v61 = 0.0;
            uint64_t v67 = v31;
            uint64_t v68 = *a4;
            do
            {
              double v61 = v61 + *v68;
              if (v66) {
                double v61 = v61 - v68[11] - v68[5];
              }
              v68 += 7;
              --v67;
            }
            while (v67);
          }
          if (v29)
          {
            uint64_t v69 = 0;
            uint64_t v70 = v31 - 2;
            double v71 = (v10 + v62 + v61 - (v37 * 0.5 + v39 * 0.5)) / (double)v29;
            double v72 = v36 - v39;
            do
            {
              double v73 = v39;
              if (v69) {
                double v73 = v35[7 * v69 + 1];
              }
              double v74 = v37;
              if (v69 != v70) {
                double v74 = v35[7 * v69 + 8];
              }
              float v75 = &v35[7 * v69];
              *(double *)&v34[8 * v69] = *v75;
              double v76 = 0.0;
              if (v69 >= 1)
              {
                uint64_t v77 = v35 + 1;
                uint64_t v78 = v69;
                do
                {
                  double v79 = *v77;
                  v77 += 7;
                  double v76 = v76 + v79;
                  --v78;
                }
                while (v78);
              }
              if (v69)
              {
                double v80 = 0.0;
                uint64_t v81 = v69;
                v82 = v35;
                do
                {
                  double v80 = v80 + *v82;
                  if (v66) {
                    double v80 = v80 - v82[11] - v82[5];
                  }
                  v82 += 7;
                  --v81;
                }
                while (v81);
                double *v75 = v71 + v73 * 0.5 + v76 + v80 - (v73 * 0.5 + v76 + v80) - (v73 * 0.5 + v74 * 0.5);
              }
              else
              {
                double *v75 = v71 + v73 * 0.5 + v76 + 0.0 - (v73 * 0.5 + v76 + 0.0) - (v73 * 0.5 + v74 * 0.5);
                double *v35 = *v35 - v72;
              }
              ++v69;
            }
            while (v69 != v29);
            if (v31 == 2) {
              return v10 + v7;
            }
          }
          else
          {
            uint64_t v70 = -1;
          }
          uint64_t v83 = v70;
          do
          {
            while (1)
            {
              unint64_t v84 = &v35[7 * v83];
              double v85 = *(double *)&v34[8 * v83];
              double v86 = *v84 - v85;
              if (v86 >= 0.001) {
                break;
              }
              *unint64_t v84 = v85;
              --v83;
              v35[7 * v83] = v86 + v35[7 * v83];
              if (!v83) {
                goto LABEL_85;
              }
            }
            --v83;
          }
          while (v83);
LABEL_85:
          uint64_t v87 = 0;
          do
          {
            v88 = &v35[7 * v87];
            double v89 = *(double *)&v34[8 * v87];
            double v90 = *v88 - v89;
            if (v90 >= 0.001)
            {
              ++v87;
            }
            else
            {
              double *v88 = v89;
              ++v87;
              v35[7 * v87] = v90 + v35[7 * v87];
            }
          }
          while (v87 != v70);
          return v10 + v7;
        }
        if (v12 / 56 != 1)
        {
          double v14 = v10 / (double)(unint64_t)v13;
          do
          {
            *int v11 = v14 + *v11;
            v11 += 7;
            --v13;
          }
          while (v13);
        }
      }
      return v10 + v7;
    }
    if (a1) {
      LOWORD(v15) = a3;
    }
    else {
      unint64_t v15 = a3 >> 16;
    }
    uint64_t v16 = (unsigned __int16)v15;
    size_t v17 = (8 * (unint64_t)(unsigned __int16)v15 + 504) >> 6;
    MEMORY[0x1F4188790](a5);
    double v19 = (int8x8_t *)((char *)&v98 - v18);
    bzero((char *)&v98 - v18, v17);
    unint64_t v102 = (unsigned __int16)v15;
    unint64_t v103 = v19;
    size_t v20 = v17;
    bzero(v19, v20);
    unint64_t v22 = (unsigned __int16)v15 - 64;
    if ((unsigned __int16)v15 < 0x40uLL)
    {
      unint64_t v24 = 0;
      char v25 = v15;
    }
    else
    {
      unint64_t v23 = v22 >> 6;
      memset(v19, 255, 8 * (v22 >> 6) + 8);
      unint64_t v24 = v23 + 1;
      char v25 = v15 & 0x3F;
    }
    *(void *)&v19[v24] |= ~(-1 << v25);
    MEMORY[0x1F4188790](v21);
    uint64_t v41 = (int8x8_t *)((char *)&v98 - v40);
    bzero((char *)&v98 - v40, v17);
    v101[0] = v16;
    v101[1] = v41;
    bzero(v41, v20);
    if (v10 > 0.001)
    {
      if (v16)
      {
        uint64_t v42 = 0;
        unint64_t v43 = (unint64_t)(v16 + 63) >> 6;
        unint64_t v44 = v43;
        do
        {
          int8x8_t v45 = *v19++;
          uint8x8_t v46 = (uint8x8_t)vcnt_s8(v45);
          v46.i16[0] = vaddlv_u8(v46);
          v42 += v46.u32[0];
          --v44;
        }
        while (v44);
        if (v42)
        {
          nui::stack_bitset::begin((nui::stack_bitset *)&v102);
          unint64_t v48 = v47;
          int v99 = &v102;
          unint64_t v100 = v47;
          unint64_t v49 = v102;
          if (v47 != v102)
          {
            float v50 = 2000.0;
            do
            {
              float v51 = *((float *)&(*a4)[7 * v48 + 3] + 1);
              if (v51 <= v50)
              {
                if (v51 < v50)
                {
                  bzero(v41, ((unint64_t)(v16 + 63) >> 3) & 0x3FF8);
                  float v50 = v51;
                }
                *(void *)((char *)v41 + ((v48 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v48;
              }
              nui::stack_bitset::iterator::operator++((uint64_t)&v99);
              unint64_t v48 = v100;
            }
            while (v100 != v49 || v99 != &v102);
            unint64_t v48 = v102;
          }
          if (v48 + 63 >= 0x40)
          {
            unint64_t v52 = (v48 + 63) >> 6;
            double v53 = v103;
            char v54 = v41;
            do
            {
              uint64_t v55 = (uint64_t)*v54++;
              *(void *)v53++ &= ~v55;
              --v52;
            }
            while (v52);
          }
          if (a2 == 2)
          {
            nui::stack_bitset::begin((nui::stack_bitset *)v101);
            int v99 = v101;
            unint64_t v100 = v56;
            uint64_t v57 = v101[0];
            double v58 = 0.0;
            if (v56 != v101[0])
            {
              do
              {
                do
                {
                  double v58 = v58 + (*a4)[7 * v56 + 2];
                  nui::stack_bitset::iterator::operator++((uint64_t)&v99);
                  unint64_t v56 = v100;
                }
                while (v100 != v57);
              }
              while (v99 != v101);
            }
            nui::stack_bitset::begin((nui::stack_bitset *)v101);
            int v99 = v101;
            unint64_t v100 = v59;
            uint64_t v60 = v101[0];
            if (v59 != v101[0])
            {
              do
              {
                do
                {
                  (*a4)[7 * v59 + 1] = (*a4)[7 * v59 + 1] + v10 * ((*a4)[7 * v59 + 1] / v58);
                  nui::stack_bitset::iterator::operator++((uint64_t)&v99);
                  unint64_t v59 = v100;
                }
                while (v100 != v60);
              }
              while (v99 != v101);
            }
          }
          else
          {
            unint64_t v92 = 0;
            do
            {
              int8x8_t v93 = *v41++;
              uint8x8_t v94 = (uint8x8_t)vcnt_s8(v93);
              v94.i16[0] = vaddlv_u8(v94);
              v92 += v94.u32[0];
              --v43;
            }
            while (v43);
            double v95 = v10 / (double)v92;
            nui::stack_bitset::begin((nui::stack_bitset *)v101);
            int v99 = v101;
            unint64_t v100 = v96;
            uint64_t v97 = v101[0];
            if (v96 != v101[0])
            {
              do
              {
                do
                {
                  (*a4)[7 * v96 + 1] = v95 + (*a4)[7 * v96 + 1];
                  nui::stack_bitset::iterator::operator++((uint64_t)&v99);
                  unint64_t v96 = v100;
                }
                while (v100 != v97);
              }
              while (v99 != v101);
            }
          }
          return v10 + v7;
        }
      }
    }
  }
  return v7;
}

char *nui_size_cache::insert_size(nui_size_cache *this, CGSize a2, CGSize a3)
{
  v10[0] = a2;
  v10[1] = a3;
  begin = (char *)this->__begin_;
  end = (char *)this->__end_;
  if (end != this->__begin_)
  {
    unint64_t v6 = (end - (char *)this->__begin_) >> 5;
    do
    {
      double v7 = (double *)&begin[32 * (v6 >> 1)];
      BOOL v8 = std::__less<void,void>::operator()[abi:nn180100]<std::pair<CGSize,CGSize>,std::pair<CGSize,CGSize>>((uint64_t)&v11, v7, &v10[0].width);
      if (v8) {
        v6 += ~(v6 >> 1);
      }
      else {
        v6 >>= 1;
      }
      if (v8) {
        begin = (char *)(v7 + 4);
      }
    }
    while (v6);
    end = begin;
  }
  return std::vector<std::pair<CGSize,CGSize>>::insert((char **)this, end, v10);
}

char *std::vector<std::pair<CGSize,CGSize>>::insert(char **a1, char *a2, _OWORD *a3)
{
  unint64_t v3 = a3;
  unint64_t v6 = *a1;
  char v5 = a1[1];
  uint64_t v7 = a2 - *a1;
  uint64_t v8 = v7 >> 5;
  double v9 = &(*a1)[v7 & 0xFFFFFFFFFFFFFFE0];
  uint64_t v11 = (uint64_t)(a1 + 2);
  unint64_t v10 = (unint64_t)a1[2];
  if ((unint64_t)v5 >= v10)
  {
    unint64_t v17 = ((v5 - v6) >> 5) + 1;
    if (v17 >> 59) {
      abort();
    }
    uint64_t v19 = v10 - (void)v6;
    if (v19 >> 4 > v17) {
      unint64_t v17 = v19 >> 4;
    }
    if ((unint64_t)v19 >= 0x7FFFFFFFFFFFFFE0) {
      unint64_t v20 = 0x7FFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v20 = v17;
    }
    if (v20) {
      __n128 v21 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<CGSize,CGSize>>>((uint64_t)(a1 + 2), v20);
    }
    else {
      __n128 v21 = 0;
    }
    int v26 = &v21[32 * v8];
    uint64_t v27 = &v21[32 * v20];
    if (v8 == v20)
    {
      if (v7 < 1)
      {
        if (v6 == a2) {
          unint64_t v29 = 1;
        }
        else {
          unint64_t v29 = v7 >> 4;
        }
        uint64_t v30 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<CGSize,CGSize>>>(v11, v29);
        int v26 = &v30[32 * (v29 >> 2)];
        uint64_t v27 = &v30[32 * v31];
        if (v21)
        {
          uint64_t v32 = &v30[32 * v31];
          operator delete(v21);
          uint64_t v27 = v32;
        }
      }
      else
      {
        unint64_t v28 = v8 + 2;
        if (v8 >= -1) {
          unint64_t v28 = v8 + 1;
        }
        v26 -= 32 * (v28 >> 1);
      }
    }
    long long v33 = v3[1];
    *(_OWORD *)int v26 = *v3;
    *((_OWORD *)v26 + 1) = v33;
    unint64_t v34 = v26 + 32;
    double v35 = *a1;
    double v36 = v26;
    if (*a1 != v9)
    {
      double v37 = v9;
      double v38 = v26;
      do
      {
        double v36 = v38 - 32;
        long long v39 = *((_OWORD *)v37 - 1);
        *((_OWORD *)v38 - 2) = *((_OWORD *)v37 - 2);
        *((_OWORD *)v38 - 1) = v39;
        v37 -= 32;
        v38 -= 32;
      }
      while (v37 != v35);
    }
    for (i = a1[1]; v9 != i; v34 += 32)
    {
      long long v41 = *(_OWORD *)v9;
      long long v42 = *((_OWORD *)v9 + 1);
      v9 += 32;
      *(_OWORD *)unint64_t v34 = v41;
      *((_OWORD *)v34 + 1) = v42;
    }
    unint64_t v43 = *a1;
    *a1 = v36;
    a1[1] = v34;
    a1[2] = v27;
    if (v43) {
      operator delete(v43);
    }
    return v26;
  }
  else if (v9 == v5)
  {
    long long v25 = a3[1];
    *(_OWORD *)double v9 = *a3;
    *((_OWORD *)v9 + 1) = v25;
    a1[1] = v9 + 32;
  }
  else
  {
    int64_t v12 = v9 + 32;
    uint64_t v13 = v5 - 32;
    double v14 = a1[1];
    while (v13 < v5)
    {
      long long v15 = *(_OWORD *)v13;
      long long v16 = *((_OWORD *)v13 + 1);
      v13 += 32;
      *(_OWORD *)double v14 = v15;
      *((_OWORD *)v14 + 1) = v16;
      v14 += 32;
    }
    a1[1] = v14;
    if (v5 != v12)
    {
      uint64_t v22 = 32 * ((v5 - v12) >> 5);
      unint64_t v23 = v5 - 16;
      uint64_t v24 = (uint64_t)&v6[32 * v8 - 16];
      do
      {
        *((_OWORD *)v23 - 1) = *(_OWORD *)(v24 + v22 - 16);
        *(_OWORD *)unint64_t v23 = *(_OWORD *)(v24 + v22);
        v23 -= 32;
        v22 -= 32;
      }
      while (v22);
    }
    if (v9 <= (char *)a3) {
      unint64_t v3 = &a3[2 * (a1[1] > (char *)a3)];
    }
    *(_OWORD *)double v9 = *v3;
    *(_OWORD *)&v6[32 * v8 + 16] = v3[1];
  }
  return v9;
}

void sub_1AE658AB8(_Unwind_Exception *exception_object)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<CGSize,CGSize>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 59) {
    std::__throw_bad_array_new_length[abi:nn180100]();
  }
  return operator new(32 * a2);
}

BOOL std::__less<void,void>::operator()[abi:nn180100]<std::pair<CGSize,CGSize>,std::pair<CGSize,CGSize>>(uint64_t a1, double *a2, double *a3)
{
  double v3 = *a2 - *a3;
  if (v3 < -0.001 || fabs(v3) < 0.001 && a2[1] - a3[1] < -0.001) {
    return 1;
  }
  double v4 = *a3 - *a2;
  if (v4 < -0.001 || fabs(v4) < 0.001 && a3[1] - a2[1] < -0.001) {
    return 0;
  }
  double v6 = a2[2] - a3[2];
  if (v6 < -0.001) {
    return 1;
  }
  if (fabs(v6) >= 0.001) {
    return 0;
  }
  return a2[3] - a3[3] < -0.001;
}

void *std::__insertion_sort[abi:nn180100]<std::_ClassicAlgPolicy,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::{lambda(_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&)#1} &,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell*>(void *result, void *a2, unsigned char *a3)
{
  if (result == a2) {
    return result;
  }
  double v3 = result + 3;
  if (result + 3 == a2) {
    return result;
  }
  uint64_t v4 = 0;
  char v5 = result;
  do
  {
    double v6 = v5;
    char v5 = v3;
    if (*a3) {
      uint64_t v7 = 8;
    }
    else {
      uint64_t v7 = 12;
    }
    uint64_t v9 = v6[2];
    uint64_t v8 = v6[3];
    float v10 = *(float *)(v8 + v7) - *(float *)(*v6 + v7);
    uint64_t v11 = v6[5];
    uint64_t v12 = v11 - v9;
    if (a3[1])
    {
      BOOL v13 = v12 < 0;
      if (v10 != 0.0) {
        BOOL v13 = v10 > 0.0;
      }
      if (!v13) {
        goto LABEL_34;
      }
    }
    else
    {
      BOOL v14 = v12 < 0;
      if (v11 == v9) {
        BOOL v15 = v10 > 0.0;
      }
      else {
        BOOL v15 = v14;
      }
      if (!v15) {
        goto LABEL_34;
      }
    }
    uint64_t v16 = v6[4];
    *(_OWORD *)char v5 = *(_OWORD *)v6;
    v5[2] = v6[2];
    unint64_t v17 = result;
    if (v6 == result) {
      goto LABEL_33;
    }
    uint64_t v18 = v4;
    while (1)
    {
      uint64_t v19 = (char *)result + v18;
      if (*a3) {
        uint64_t v20 = 8;
      }
      else {
        uint64_t v20 = 12;
      }
      float v21 = *(float *)(v8 + v20) - *(float *)(*(void *)((char *)result + v18 - 24) + v20);
      uint64_t v22 = *((void *)v19 - 1);
      uint64_t v23 = v11 - v22;
      if (a3[1])
      {
        BOOL v24 = v23 < 0;
        if (v21 != 0.0) {
          BOOL v24 = v21 > 0.0;
        }
        if (!v24)
        {
          unint64_t v17 = v6;
          goto LABEL_33;
        }
        goto LABEL_30;
      }
      BOOL v25 = v23 < 0;
      int v26 = v11 == v22 ? v21 > 0.0 : v25;
      if (v26 != 1) {
        break;
      }
LABEL_30:
      v6 -= 3;
      *(_OWORD *)uint64_t v19 = *(_OWORD *)((char *)result + v18 - 24);
      *((void *)v19 + 2) = *(void *)((char *)result + v18 - 8);
      v18 -= 24;
      if (!v18)
      {
        unint64_t v17 = result;
        goto LABEL_33;
      }
    }
    unint64_t v17 = (void *)((char *)result + v18);
LABEL_33:
    void *v17 = v8;
    v17[1] = v16;
    v17[2] = v11;
LABEL_34:
    double v3 = v5 + 3;
    v4 += 24;
  }
  while (v5 + 3 != a2);
  return result;
}

void sub_1AE659944(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,void *a32)
{
  _Block_object_dispose(&a25, 8);
  std::__tree<UIView *>::destroy(v32, a32);
  _Unwind_Resume(a1);
}

void std::__tree<UIView *>::destroy(uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__tree<UIView *>::destroy(a1, *a2);
    std::__tree<UIView *>::destroy(a1, a2[1]);
    operator delete(a2);
  }
}

uint64_t **std::__tree<std::__value_type<UIView *,_NUIContainerViewArrangedSubview>,std::__map_value_compare<UIView *,std::__value_type<UIView *,_NUIContainerViewArrangedSubview>,std::less<UIView *>,true>,std::allocator<std::__value_type<UIView *,_NUIContainerViewArrangedSubview>>>::__emplace_unique_key_args<UIView *,std::piecewise_construct_t const&,std::tuple<UIView * const&>,std::tuple<>>(uint64_t **a1, unint64_t *a2, uint64_t a3, void **a4)
{
  uint64_t v7 = a1 + 1;
  double v6 = a1[1];
  if (v6)
  {
    unint64_t v8 = *a2;
    while (1)
    {
      while (1)
      {
        uint64_t v9 = (uint64_t **)v6;
        unint64_t v10 = v6[4];
        if (v8 >= v10) {
          break;
        }
        double v6 = *v9;
        uint64_t v7 = v9;
        if (!*v9) {
          goto LABEL_10;
        }
      }
      if (v10 >= v8) {
        break;
      }
      double v6 = v9[1];
      if (!v6)
      {
        uint64_t v7 = v9 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    uint64_t v9 = a1 + 1;
LABEL_10:
    uint64_t v11 = (char *)operator new(0x60uLL);
    *((void *)v11 + 4) = **a4;
    *(_OWORD *)(v11 + 40) = *MEMORY[0x1E4F1DAD8];
    *(_OWORD *)(v11 + 72) = unk_1AE6757E8;
    *(_OWORD *)(v11 + 56) = NUIContainerViewInsetsUseDefault;
    *((_WORD *)v11 + 44) = -1;
    std::__tree<UIView *>::__insert_node_at(a1, (uint64_t)v9, v7, (uint64_t *)v11);
    return (uint64_t **)v11;
  }
  return v9;
}

uint64_t *std::__tree<UIView *>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  char v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  uint64_t result = std::__tree_balance_after_insert[abi:nn180100]<std::__tree_node_base<void *> *>(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

uint64_t *std::__tree_balance_after_insert[abi:nn180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  *((unsigned char *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      unint64_t v2 = (uint64_t *)a2[2];
      if (*((unsigned char *)v2 + 24)) {
        return result;
      }
      double v3 = (uint64_t *)v2[2];
      uint64_t v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (int v8 = *(unsigned __int8 *)(v7 + 24), v5 = (unsigned char *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            uint64_t v9 = (uint64_t **)a2[2];
          }
          else
          {
            uint64_t v9 = (uint64_t **)v2[1];
            unint64_t v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              CGSize v10[2] = (uint64_t)v2;
              double v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = v9;
            *uint64_t v9 = v2;
            v2[2] = (uint64_t)v9;
            double v3 = v9[2];
            unint64_t v2 = (uint64_t *)*v3;
          }
          *((unsigned char *)v9 + 24) = 1;
          *((unsigned char *)v3 + 24) = 0;
          uint64_t v13 = v2[1];
          *double v3 = v13;
          if (v13) {
            *(void *)(v13 + 16) = v3;
          }
          v2[2] = v3[2];
          *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), char v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          uint64_t v11 = a2[1];
          *unint64_t v2 = v11;
          if (v11)
          {
            *(void *)(v11 + 16) = v2;
            double v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(void *)(v2[2] + 8 * (*(void *)v2[2] != (void)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          double v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((unsigned char *)a2 + 24) = 1;
        *((unsigned char *)v3 + 24) = 0;
        unint64_t v2 = (uint64_t *)v3[1];
        uint64_t v12 = *v2;
        v3[1] = *v2;
        if (v12) {
          *(void *)(v12 + 16) = v3;
        }
        v2[2] = v3[2];
        *(void *)(v3[2] + 8 * (*(void *)v3[2] != (void)v3)) = v2;
        *unint64_t v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((unsigned char *)v2 + 24) = 1;
      a2 = v3;
      *((unsigned char *)v3 + 24) = v3 == result;
      *char v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

uint64_t std::__tree<UIView *>::__erase_unique<UIView *>(uint64_t a1, unint64_t *a2)
{
  unint64_t v2 = *(void **)(a1 + 8);
  if (!v2) {
    return 0;
  }
  unint64_t v3 = *a2;
  uint64_t v4 = (uint64_t *)(a1 + 8);
  do
  {
    unint64_t v5 = v2[4];
    BOOL v6 = v5 >= v3;
    if (v5 >= v3) {
      uint64_t v7 = v2;
    }
    else {
      uint64_t v7 = v2 + 1;
    }
    if (v6) {
      uint64_t v4 = v2;
    }
    unint64_t v2 = (void *)*v7;
  }
  while (*v7);
  if (v4 == (uint64_t *)(a1 + 8) || v3 < v4[4]) {
    return 0;
  }
  std::__tree<UIView *>::__remove_node_pointer((uint64_t **)a1, v4);
  operator delete(v4);
  return 1;
}

void sub_1AE65AF2C(_Unwind_Exception *a1)
{
  *(void *)(v2 + 8) = v1;
  _Unwind_Resume(a1);
}

__n128 _NUIGridArrangementCell::_NUIGridArrangementCell(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned __int8 a7, __int16 a8)
{
  *(void *)a1 = a2;
  *(void *)(a1 + 56) = a3;
  *(void *)(a1 + 64) = a4;
  *(void *)(a1 + 72) = a5;
  *(void *)(a1 + 80) = a6;
  *(_WORD *)(a1 + 104) = a7 | (unsigned __int16)(a8 << 8);
  __n128 result = *(__n128 *)MEMORY[0x1E4F1DB30];
  *(_OWORD *)(a1 + 24) = *MEMORY[0x1E4F1DB30];
  *(__n128 *)(a1 + 40) = result;
  *(void *)(a1 + 88) = 0;
  *(void *)(a1 + 96) = 0;
  return result;
}

void sub_1AE65B850(_Unwind_Exception *exception_object)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(exception_object);
}

void sub_1AE65C28C(_Unwind_Exception *exception_object)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

void _NUIGridArrangementDimension::_NUIGridArrangementDimension(_NUIGridArrangementDimension *this, __int16 a2, double a3)
{
  *(void *)this = 0;
  *((double *)this + 1) = a3;
  *((_OWORD *)this + 1) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *((_WORD *)this + 24) = a2;
}

BOOL NUIContainerViewLengthIsSystem(double *a1, double a2)
{
  if (a2 <= -1048576.0 && a1 != 0)
  {
    double v3 = (a2 + 1048576.0) * -0.00390625;
    if (a2 == -1.79769313e308) {
      double v3 = 1.0;
    }
    *a1 = v3;
  }
  return a2 <= -1048576.0;
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<_NUIGridArrangementDimension>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x492492492492493) {
    std::__throw_bad_array_new_length[abi:nn180100]();
  }
  return operator new(56 * a2);
}

void std::vector<_NUIGridArrangementDimension>::reserve(void **a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (0x6DB6DB6DB6DB6DB7 * ((v4 - (unsigned char *)*a1) >> 3) < a2)
  {
    if (a2 >= 0x492492492492493) {
      abort();
    }
    uint64_t v5 = ((unsigned char *)a1[1] - (unsigned char *)*a1) / 56;
    BOOL v6 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<_NUIGridArrangementDimension>>(v3, a2);
    uint64_t v7 = &v6[56 * v5];
    uint64_t v9 = &v6[56 * v8];
    uint64_t v11 = (char *)*a1;
    unint64_t v10 = (char *)a1[1];
    uint64_t v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        long long v13 = *(_OWORD *)(v10 - 56);
        long long v14 = *(_OWORD *)(v10 - 40);
        long long v15 = *(_OWORD *)(v10 - 24);
        *((void *)v12 - 1) = *((void *)v10 - 1);
        *(_OWORD *)(v12 - 24) = v15;
        *(_OWORD *)(v12 - 40) = v14;
        *(_OWORD *)(v12 - 56) = v13;
        v12 -= 56;
        v10 -= 56;
      }
      while (v10 != v11);
      unint64_t v10 = (char *)*a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
    {
      operator delete(v10);
    }
  }
}

void std::vector<_NUIGridArrangementCell>::reserve(void **a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (0x6DB6DB6DB6DB6DB7 * ((v4 - (unsigned char *)*a1) >> 4) < a2)
  {
    if (a2 >= 0x24924924924924ALL) {
      abort();
    }
    uint64_t v5 = ((unsigned char *)a1[1] - (unsigned char *)*a1) / 112;
    BOOL v6 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<_NUIGridArrangementCell>>(v3, a2);
    uint64_t v7 = &v6[112 * v5];
    uint64_t v9 = &v6[112 * v8];
    uint64_t v11 = (char *)*a1;
    unint64_t v10 = (char *)a1[1];
    uint64_t v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        long long v13 = *((_OWORD *)v10 - 7);
        long long v14 = *((_OWORD *)v10 - 5);
        *((_OWORD *)v12 - 6) = *((_OWORD *)v10 - 6);
        *((_OWORD *)v12 - 5) = v14;
        *((_OWORD *)v12 - 7) = v13;
        long long v15 = *((_OWORD *)v10 - 4);
        long long v16 = *((_OWORD *)v10 - 3);
        long long v17 = *((_OWORD *)v10 - 1);
        *((_OWORD *)v12 - 2) = *((_OWORD *)v10 - 2);
        *((_OWORD *)v12 - 1) = v17;
        *((_OWORD *)v12 - 4) = v15;
        *((_OWORD *)v12 - 3) = v16;
        v12 -= 112;
        v10 -= 112;
      }
      while (v10 != v11);
      unint64_t v10 = (char *)*a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
    {
      operator delete(v10);
    }
  }
}

void sub_1AE65CD34(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void *std::vector<_NUIGridArrangementCell>::__emplace_back_slow_path<UIView *&,_NSRange &,_NSRange &,NUIContainerAlignment,NUIContainerAlignment&>(void **a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, void *a5, void *a6)
{
  BOOL v6 = (char *)*a1;
  uint64_t v7 = 0x6DB6DB6DB6DB6DB7 * (((unsigned char *)a1[1] - (unsigned char *)*a1) >> 4);
  unint64_t v8 = v7 + 1;
  if ((unint64_t)(v7 + 1) > 0x249249249249249) {
    abort();
  }
  long long v16 = a1[2];
  uint64_t v15 = (uint64_t)(a1 + 2);
  unint64_t v17 = 0x6DB6DB6DB6DB6DB7 * ((v16 - v6) >> 4);
  if (2 * v17 > v8) {
    unint64_t v8 = 2 * v17;
  }
  if (v17 >= 0x124924924924924) {
    unint64_t v18 = 0x249249249249249;
  }
  else {
    unint64_t v18 = v8;
  }
  if (v18)
  {
    uint64_t v19 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<_NUIGridArrangementCell>>(v15, v18);
    uint64_t v21 = v20;
  }
  else
  {
    uint64_t v19 = 0;
    uint64_t v21 = 0;
  }
  _NUIGridArrangementCell::_NUIGridArrangementCell((uint64_t)&v19[112 * v7], *a2, *a3, a3[1], *a4, a4[1], *a5, *a6);
  uint64_t v23 = v22 + 112;
  BOOL v25 = (char *)*a1;
  BOOL v24 = (char *)a1[1];
  if (v24 != *a1)
  {
    do
    {
      long long v26 = *((_OWORD *)v24 - 7);
      long long v27 = *((_OWORD *)v24 - 5);
      *((_OWORD *)v22 - 6) = *((_OWORD *)v24 - 6);
      *((_OWORD *)v22 - 5) = v27;
      *((_OWORD *)v22 - 7) = v26;
      long long v28 = *((_OWORD *)v24 - 4);
      long long v29 = *((_OWORD *)v24 - 3);
      long long v30 = *((_OWORD *)v24 - 1);
      *((_OWORD *)v22 - 2) = *((_OWORD *)v24 - 2);
      *((_OWORD *)v22 - 1) = v30;
      *((_OWORD *)v22 - 4) = v28;
      *((_OWORD *)v22 - 3) = v29;
      v22 -= 112;
      v24 -= 112;
    }
    while (v24 != v25);
    BOOL v24 = (char *)*a1;
  }
  *a1 = v22;
  a1[1] = v23;
  a1[2] = &v19[112 * v21];
  if (v24) {
    operator delete(v24);
  }
  return v23;
}

void sub_1AE65CEAC(_Unwind_Exception *exception_object)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<_NUIGridArrangementCell>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x24924924924924ALL) {
    std::__throw_bad_array_new_length[abi:nn180100]();
  }
  return operator new(112 * a2);
}

void *std::vector<_NUIGridArrangementCell>::__emplace_back_slow_path<UIView *&,_NSRange &,_NSRange &,NUIContainerAlignment &,NUIContainerAlignment>(void **a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, void *a5, void *a6)
{
  BOOL v6 = (char *)*a1;
  uint64_t v7 = 0x6DB6DB6DB6DB6DB7 * (((unsigned char *)a1[1] - (unsigned char *)*a1) >> 4);
  unint64_t v8 = v7 + 1;
  if ((unint64_t)(v7 + 1) > 0x249249249249249) {
    abort();
  }
  long long v16 = a1[2];
  uint64_t v15 = (uint64_t)(a1 + 2);
  unint64_t v17 = 0x6DB6DB6DB6DB6DB7 * ((v16 - v6) >> 4);
  if (2 * v17 > v8) {
    unint64_t v8 = 2 * v17;
  }
  if (v17 >= 0x124924924924924) {
    unint64_t v18 = 0x249249249249249;
  }
  else {
    unint64_t v18 = v8;
  }
  if (v18)
  {
    uint64_t v19 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<_NUIGridArrangementCell>>(v15, v18);
    uint64_t v21 = v20;
  }
  else
  {
    uint64_t v19 = 0;
    uint64_t v21 = 0;
  }
  _NUIGridArrangementCell::_NUIGridArrangementCell((uint64_t)&v19[112 * v7], *a2, *a3, a3[1], *a4, a4[1], *a5, *a6);
  uint64_t v23 = v22 + 112;
  BOOL v25 = (char *)*a1;
  BOOL v24 = (char *)a1[1];
  if (v24 != *a1)
  {
    do
    {
      long long v26 = *((_OWORD *)v24 - 7);
      long long v27 = *((_OWORD *)v24 - 5);
      *((_OWORD *)v22 - 6) = *((_OWORD *)v24 - 6);
      *((_OWORD *)v22 - 5) = v27;
      *((_OWORD *)v22 - 7) = v26;
      long long v28 = *((_OWORD *)v24 - 4);
      long long v29 = *((_OWORD *)v24 - 3);
      long long v30 = *((_OWORD *)v24 - 1);
      *((_OWORD *)v22 - 2) = *((_OWORD *)v24 - 2);
      *((_OWORD *)v22 - 1) = v30;
      *((_OWORD *)v22 - 4) = v28;
      *((_OWORD *)v22 - 3) = v29;
      v22 -= 112;
      v24 -= 112;
    }
    while (v24 != v25);
    BOOL v24 = (char *)*a1;
  }
  *a1 = v22;
  a1[1] = v23;
  a1[2] = &v19[112 * v21];
  if (v24) {
    operator delete(v24);
  }
  return v23;
}

void sub_1AE65D078(_Unwind_Exception *exception_object)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

NSMutableArray *_NUIContainerViewCommonInit(NUIContainerView *a1)
{
  -[NUIContainerView setDebugBoundingBoxesEnabled:](a1, "setDebugBoundingBoxesEnabled:", [(id)objc_opt_class() isDebugBoundingBoxesEnabled]);
  __n128 result = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  a1->_arrangedSubviews = result;
  return result;
}

NSMutableArray *_NUIContainerGridViewCommonInit(NUIContainerGridView *a1)
{
  a1->_viewRows = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  a1->_arrangement.container = (_NUIGridArrangementContainer *)a1;
  a1->_columnWidth = 1.79769313e308;
  a1->_rowHeight = 1.79769313e308;
  __asm { FMOV            V0.2D, #6.0 }
  a1->_spacing = _Q0;
  *(unsigned char *)&a1->_gridViewFlags = 1;
  *((unsigned char *)&a1->_gridViewFlags + 1) = 1;
  a1->_columns = (NSMutableArray *)objc_opt_new();
  __n128 result = (NSMutableArray *)objc_opt_new();
  a1->_rows = result;
  return result;
}

void _NUIGridArrangement::positionSubsetCells(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, double a7, double a8, double a9, double a10)
{
  if (*(unsigned char *)(a1 + 11))
  {
    BOOL v17 = a2 == 0x7FFFFFFFFFFFFFFFLL || a4 == 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v18 = a1 + 88;
    uint64_t v20 = *(void *)(a1 + 16);
    uint64_t v19 = *(double **)(a1 + 24);
    unint64_t v21 = 0x6DB6DB6DB6DB6DB7 * (((uint64_t)v19 - v20) >> 4);
    if (v21 != (uint64_t)(*(void *)(a1 + 96) - *(void *)(a1 + 88)) >> 5)
    {
      std::vector<CGRect>::resize(v18, v21);
      int v26 = *(__int16 *)(a1 + 8);
      if ((__int16)(*(_WORD *)(a1 + 8) << 8) < 1537)
      {
        double v35 = *MEMORY[0x1E4F1DB30];
      }
      else
      {
        long long v27 = *(double **)(a1 + 40);
        double v28 = 0.0;
        double v29 = 0.0;
        if (*(double **)(a1 + 48) != v27)
        {
          long long v30 = v27 + 1;
          uint64_t v31 = (*(void *)(a1 + 48) - (void)v27) / 56;
          do
          {
            double v32 = *v30;
            v30 += 7;
            double v29 = v29 + v32;
            --v31;
          }
          while (v31);
        }
        uint64_t v33 = (*(void *)(a1 + 48) - (void)v27) / 56 - 1;
        if ((*(void *)(a1 + 48) - (void)v27) / 56 != 1)
        {
          double v28 = 0.0;
          do
          {
            double v34 = *v27;
            v27 += 7;
            double v28 = v28 + v34;
            --v33;
          }
          while (v33);
        }
        double v35 = a9 - (v29 + v28);
        if (*(_WORD *)(a1 + 8) == 7) {
          double v35 = v35 * 0.5;
        }
      }
      uint64_t v53 = a3;
      if (v26 < 1792)
      {
        uint64_t v46 = a5;
        uint64_t v47 = a6;
        BOOL v48 = v17;
        double v49 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      }
      else
      {
        long long v39 = *(double **)(a1 + 64);
        double v40 = 0.0;
        double v41 = 0.0;
        if (*(double **)(a1 + 72) != v39)
        {
          long long v42 = v39 + 1;
          uint64_t v43 = (*(void *)(a1 + 72) - (void)v39) / 56;
          do
          {
            double v44 = *v42;
            v42 += 7;
            double v41 = v41 + v44;
            --v43;
          }
          while (v43);
        }
        uint64_t v45 = (*(void *)(a1 + 72) - (void)v39) / 56 - 1;
        if ((*(void *)(a1 + 72) - (void)v39) / 56 != 1)
        {
          double v40 = 0.0;
          do
          {
            double v40 = v40 + *v39;
            if (*(unsigned char *)(a1 + 10)) {
              double v40 = v40 - v39[11] - v39[5];
            }
            v39 += 7;
            --v45;
          }
          while (v45);
        }
        uint64_t v46 = a5;
        uint64_t v47 = a6;
        BOOL v48 = v17;
        double v49 = a10 - (v41 + v40);
        if ((v26 & 0xFFFFFF00) == 0x700) {
          double v49 = v49 * 0.5;
        }
      }
      v64[0] = MEMORY[0x1E4F143A8];
      v64[1] = 3221225472;
      double v65 = ___ZN19_NUIGridArrangement19positionSubsetCellsE8_NSRangeS0_6CGRectU13block_pointerFvPU29objcproto18NUIArrangementItem11objc_objectS1_E_block_invoke;
      int v66 = &__block_descriptor_88_e108_v24__0___NUIGridArrangementCell_____ff____ff__CGSize_dd__CGSize_dd___NSRange_QQ___NSRange_QQ____dd_b8b8_8Q16l;
      uint64_t v67 = a1;
      double v68 = a7;
      double v69 = a8;
      double v70 = a9;
      double v71 = a10;
      double v72 = v35;
      double v73 = v49;
      uint64_t v19 = *(double **)(a1 + 16);
      float v50 = *(double **)(a1 + 24);
      if (v19 == v50)
      {
        uint64_t v20 = *(void *)(a1 + 16);
      }
      else
      {
        uint64_t v51 = 0;
        do
        {
          v65((uint64_t)v64, v19, v51++);
          v19 += 14;
        }
        while (v19 != v50);
        uint64_t v20 = *(void *)(a1 + 16);
        uint64_t v19 = *(double **)(a1 + 24);
      }
      BOOL v17 = v48;
      a6 = v47;
      a5 = v46;
      a3 = v53;
    }
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    uint64_t v55 = ___ZN19_NUIGridArrangement19positionSubsetCellsE8_NSRangeS0_6CGRectU13block_pointerFvPU29objcproto18NUIArrangementItem11objc_objectS1_E_block_invoke_2;
    unint64_t v56 = &unk_1E5EFF2C8;
    BOOL v63 = v17;
    uint64_t v59 = a2;
    uint64_t v60 = a3;
    uint64_t v61 = a4;
    uint64_t v62 = a5;
    uint64_t v57 = a6;
    uint64_t v58 = a1;
    if ((double *)v20 != v19)
    {
      uint64_t v52 = 0;
      do
      {
        v55((uint64_t)v54, v20, v52++);
        v20 += 112;
      }
      while ((double *)v20 != v19);
    }
  }
  else
  {
    int v36 = _NUIIsDebuggerAttached();
    double v37 = _NUILog();
    double v38 = v37;
    if (v36)
    {
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
        _NUIGridArrangement::positionSubsetCells((uint64_t *)a1, v38);
      }
    }
    else if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    {
      _NUIGridArrangement::positionSubsetCells((uint64_t *)a1, v38);
    }
  }
}

uint64_t ___ZN19_NUIGridArrangement19positionSubsetCellsE8_NSRangeS0_6CGRectU13block_pointerFvPU29objcproto18NUIArrangementItem11objc_objectS1_E_block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (*(unsigned char *)(result + 80)) {
    goto LABEL_13;
  }
  unint64_t v4 = *(void *)(a2 + 56);
  unint64_t v5 = *(void *)(result + 48);
  BOOL v7 = v4 >= v5;
  unint64_t v6 = v4 - v5;
  BOOL v7 = !v7 || v6 >= *(void *)(result + 56);
  if (!v7
    || ((v8 = *(void *)(a2 + 72), v9 = *(void *)(result + 64), v7 = v8 >= v9, unint64_t v10 = v8 - v9, v7)
      ? (BOOL v11 = v10 >= *(void *)(result + 72))
      : (BOOL v11 = 1),
        !v11))
  {
LABEL_13:
    uint64_t v3 = *(void *)(result + 40);
    return (*(uint64_t (**)(double, double, double, double))(*(void *)(result + 32) + 16))(*(double *)(*(void *)(v3 + 88) + 32 * a3), *(double *)(*(void *)(v3 + 88) + 32 * a3 + 8), *(double *)(*(void *)(v3 + 88) + 32 * a3 + 16), *(double *)(*(void *)(v3 + 88) + 32 * a3 + 24));
  }
  return result;
}

void ___ZN19_NUIGridArrangement19positionSubsetCellsE8_NSRangeS0_6CGRectU13block_pointerFvPU29objcproto18NUIArrangementItem11objc_objectS1_E_block_invoke(uint64_t a1, double *a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *((void *)a2 + 7);
  double v8 = 0.0;
  double v9 = 0.0;
  if (v7 >= 1)
  {
    unint64_t v10 = (double *)(*(void *)(v6 + 40) + 8);
    uint64_t v11 = *((void *)a2 + 7);
    do
    {
      double v12 = *v10;
      v10 += 7;
      double v9 = v9 + v12;
      --v11;
    }
    while (v11);
  }
  if (v7)
  {
    long long v13 = *(double **)(v6 + 40);
    double v8 = 0.0;
    do
    {
      double v14 = *v13;
      v13 += 7;
      double v8 = v8 + v14;
      --v7;
    }
    while (v7);
  }
  double MinX = CGRectGetMinX(*(CGRect *)(a1 + 40));
  uint64_t v16 = *((void *)a2 + 9);
  double v17 = 0.0;
  double v18 = 0.0;
  if (v16 >= 1)
  {
    uint64_t v19 = (double *)(*(void *)(v6 + 64) + 8);
    uint64_t v20 = *((void *)a2 + 9);
    do
    {
      double v21 = *v19;
      v19 += 7;
      double v18 = v18 + v21;
      --v20;
    }
    while (v20);
  }
  if (v16)
  {
    uint64_t v22 = *(double **)(v6 + 64);
    double v17 = 0.0;
    do
    {
      double v17 = v17 + *v22;
      if (*(unsigned char *)(v6 + 10)) {
        double v17 = v17 - v22[11] - v22[5];
      }
      v22 += 7;
      --v16;
    }
    while (v16);
  }
  double v23 = *(double *)(a1 + 72);
  double MinY = CGRectGetMinY(*(CGRect *)(a1 + 40));
  unint64_t v25 = *((void *)a2 + 7);
  uint64_t v26 = *((void *)a2 + 8);
  double v27 = 0.0;
  double v28 = 0.0;
  if (v25 < v26 + v25)
  {
    double v29 = (double *)(*(void *)(v6 + 40) + 56 * v25 + 8);
    uint64_t v30 = *((void *)a2 + 8);
    do
    {
      double v31 = *v29;
      v29 += 7;
      double v28 = v28 + v31;
      --v30;
    }
    while (v30);
  }
  if (v25 < v26 + v25 - 1)
  {
    uint64_t v32 = v26 - 1;
    uint64_t v33 = (double *)(*(void *)(v6 + 40) + 56 * v25);
    double v27 = 0.0;
    do
    {
      double v34 = *v33;
      v33 += 7;
      double v27 = v27 + v34;
      --v32;
    }
    while (v32);
  }
  unint64_t v36 = *((void *)a2 + 9);
  uint64_t v35 = *((void *)a2 + 10);
  double v37 = 0.0;
  double v38 = 0.0;
  if (v36 < v35 + v36)
  {
    long long v39 = (double *)(*(void *)(v6 + 64) + 56 * v36 + 8);
    uint64_t v40 = *((void *)a2 + 10);
    do
    {
      double v41 = *v39;
      v39 += 7;
      double v38 = v38 + v41;
      --v40;
    }
    while (v40);
  }
  double v42 = v18 + v17 + MinY;
  if (v36 < v35 + v36 - 1)
  {
    uint64_t v43 = (double *)(*(void *)(v6 + 64) + 56 * v36);
    uint64_t v44 = v35 - 1;
    double v37 = 0.0;
    do
    {
      double v37 = v37 + *v43;
      if (*(unsigned char *)(v6 + 10)) {
        double v37 = v37 - v43[11] - v43[5];
      }
      v43 += 7;
      --v44;
    }
    while (v44);
  }
  double v45 = v9 + v8 + MinX + v23;
  double v46 = v42 + *(double *)(a1 + 80);
  double v47 = v28 + v27;
  double v48 = v38 + v37;
  unsigned int v49 = *((unsigned __int16 *)a2 + 52);
  if (v49 <= 0xFF && (unsigned __int16)((_WORD)v49 << 8) == 0)
  {
    double v56 = v45;
    double Width = v28 + v27;
    double Height = v38 + v37;
    goto LABEL_39;
  }
  int v51 = (__int16)v49;
  uint64_t v52 = (uint64_t)(__int16)((_WORD)v49 << 8) >> 8;
  id v53 = *(id *)v6;
  double v54 = a2[5];
  if (vabdd_f64(v54, *MEMORY[0x1E4F1DB30]) >= 0.001
    || vabdd_f64(a2[6], *(double *)(MEMORY[0x1E4F1DB30] + 8)) >= 0.001)
  {
    if (vabdd_f64(v54, v47) < 0.001)
    {
      if (vabdd_f64(a2[6], v48) < 0.001)
      {
        double v55 = a2[4];
        goto LABEL_46;
      }
LABEL_44:
      double v55 = a2[4];
      if (v48 - v55 >= -0.001) {
        goto LABEL_46;
      }
      goto LABEL_45;
    }
    double v64 = v47 - a2[3];
    char v65 = [*(id *)a2 isLayoutSizeDependentOnPerpendicularAxis];
    if (v64 < -0.001) {
      char v66 = 1;
    }
    else {
      char v66 = v65;
    }
    if ((v66 & 1) == 0) {
      goto LABEL_44;
    }
  }
LABEL_45:
  objc_msgSend(v53, "contentLayoutSizeFittingSize:forArrangedSubview:", *(void *)a2, v47, v48);
  *((void *)a2 + 3) = v67;
  a2[4] = v55;
  a2[5] = v47;
  a2[6] = v48;
LABEL_46:
  uint64_t v68 = *(void *)(v6 + 64) + 56 * *((void *)a2 + 9);
  double v69 = *(double *)(v68 + 40);
  double v79 = *(double *)(v68 + 32);
  double v80 = a2[11];
  double v81 = a2[12];
  double v56 = *MEMORY[0x1E4F1DB28];
  CGFloat rect = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  if (a2[3] >= v47) {
    double Width = v47;
  }
  else {
    double Width = a2[3];
  }
  if (v55 >= v48) {
    double Height = v48;
  }
  else {
    double Height = v55;
  }
  switch(v52)
  {
    case 0:
      v86.origin.x = v45;
      v86.origin.y = v46;
      v86.size.double width = v47;
      v86.size.double height = v48;
      double v56 = CGRectGetMinX(v86);
      v87.origin.x = v45;
      v87.origin.y = v46;
      v87.size.double width = v47;
      v87.size.double height = v48;
      double Width = CGRectGetWidth(v87);
      break;
    case 1:
    case 2:
      v83.origin.x = v45;
      v83.origin.y = v46;
      v83.size.double width = v47;
      v83.size.double height = v48;
      double v56 = CGRectGetMinX(v83);
      break;
    case 3:
      v88.origin.x = v45;
      v88.origin.y = v46;
      v88.size.double width = v47;
      v88.size.double height = v48;
      double MidX = CGRectGetMidX(v88);
      v89.origin.x = v56;
      v89.origin.y = rect;
      v89.size.double width = Width;
      v89.size.double height = Height;
      double v56 = MidX + CGRectGetWidth(v89) * -0.5;
      break;
    case 4:
    case 5:
      v84.origin.x = v45;
      v84.origin.y = v46;
      v84.size.double width = v47;
      v84.size.double height = v48;
      double v77 = *(double *)(v68 + 40);
      double MaxX = CGRectGetMaxX(v84);
      v85.origin.x = v56;
      v85.origin.y = rect;
      v85.size.double width = Width;
      v85.size.double height = Height;
      double v56 = MaxX - CGRectGetWidth(v85);
      double v69 = v77;
      break;
    default:
      break;
  }
  switch((uint64_t)v51 >> 8)
  {
    case 0:
      v90.origin.x = v45;
      v90.origin.y = v46;
      v90.size.double width = v47;
      v90.size.double height = v48;
      CGFloat v71 = CGRectGetMinY(v90);
      v91.origin.x = v45;
      v91.origin.y = v46;
      v91.size.double width = v47;
      v91.size.double height = v48;
      double Height = CGRectGetHeight(v91);
      double v46 = v71;
      break;
    case 1:
      goto LABEL_62;
    case 2:
      if (v80 != 2.22507386e-308)
      {
        v92.origin.x = v45;
        v92.origin.y = v46;
        v92.size.double width = v47;
        v92.size.double height = v48;
        double v72 = v79 + CGRectGetMinY(v92);
        double v73 = v80;
        goto LABEL_66;
      }
LABEL_62:
      v93.origin.x = v45;
      v93.origin.y = v46;
      v93.size.double width = v47;
      v93.size.double height = v48;
      double v46 = CGRectGetMinY(v93);
      break;
    case 3:
      v94.origin.x = v45;
      v94.origin.y = v46;
      v94.size.double width = v47;
      v94.size.double height = v48;
      double MidY = CGRectGetMidY(v94);
      v95.origin.x = v56;
      v95.origin.y = rect;
      v95.size.double width = Width;
      v95.size.double height = Height;
      double v46 = MidY + CGRectGetHeight(v95) * -0.5;
      break;
    case 4:
      goto LABEL_67;
    case 5:
      if (v81 == 2.22507386e-308)
      {
LABEL_67:
        v98.origin.x = v45;
        v98.origin.y = v46;
        v98.size.double width = v47;
        v98.size.double height = v48;
        double MaxY = CGRectGetMaxY(v98);
        v99.origin.x = v56;
        v99.origin.y = rect;
        v99.size.double width = Width;
        v99.size.double height = Height;
        double v46 = MaxY - CGRectGetHeight(v99);
      }
      else
      {
        v96.origin.x = v45;
        v96.origin.y = v46;
        v96.size.double width = v47;
        v96.size.double height = v48;
        double v75 = CGRectGetMaxY(v96);
        v97.origin.x = v56;
        v97.origin.y = rect;
        v97.size.double width = Width;
        v97.size.double height = Height;
        double v72 = v75 - CGRectGetHeight(v97);
        double v73 = v69 - v81;
LABEL_66:
        double v46 = v72 - v73;
      }
      break;
    default:
      double v46 = rect;
      break;
  }
LABEL_39:
  objc_msgSend(*(id *)v6, "layoutFrameForArrangedSubview:withProposedContentFrame:", *(void *)a2, v56, v46, Width, Height);
  uint64_t v59 = (void *)(*(void *)(v6 + 88) + 32 * a3);
  void *v59 = v60;
  v59[1] = v61;
  v59[2] = v62;
  v59[3] = v63;
}

double NUIRectRoundToScale(CGRect a1, double a2)
{
  CGFloat height = a1.size.height;
  CGFloat width = a1.size.width;
  CGFloat y = a1.origin.y;
  CGFloat x = a1.origin.x;
  double MinX = CGRectGetMinX(a1);
  if (a2 == 1.0)
  {
    double v8 = ceil(MinX);
    double v9 = v8 - MinX;
    double v10 = floor(MinX);
    if (v9 >= 0.001) {
      double v11 = v10;
    }
    else {
      double v11 = v8;
    }
    v18.origin.CGFloat x = x;
    v18.origin.CGFloat y = y;
    v18.size.CGFloat width = width;
    v18.size.CGFloat height = height;
    CGRectGetMinY(v18);
    v19.origin.CGFloat x = x;
    v19.origin.CGFloat y = y;
    v19.size.CGFloat width = width;
    v19.size.CGFloat height = height;
    CGRectGetWidth(v19);
    v20.origin.CGFloat x = x;
    v20.origin.CGFloat y = y;
    v20.size.CGFloat width = width;
    v20.size.CGFloat height = height;
    CGRectGetHeight(v20);
  }
  else
  {
    double v12 = MinX * a2;
    double v13 = ceil(v12);
    double v14 = v13 - v12;
    double v15 = floor(v12);
    if (v14 < 0.001) {
      double v15 = v13;
    }
    double v17 = v15 / a2;
    v21.origin.CGFloat x = x;
    v21.origin.CGFloat y = y;
    v21.size.CGFloat width = width;
    v21.size.CGFloat height = height;
    CGRectGetMinY(v21);
    v22.origin.CGFloat x = x;
    v22.origin.CGFloat y = y;
    v22.size.CGFloat width = width;
    v22.size.CGFloat height = height;
    CGRectGetWidth(v22);
    v23.origin.CGFloat x = x;
    v23.origin.CGFloat y = y;
    v23.size.CGFloat width = width;
    v23.size.CGFloat height = height;
    CGRectGetHeight(v23);
    return v17;
  }
  return v11;
}

void std::vector<CGRect>::__append(void **a1, unint64_t a2)
{
  uint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  unint64_t v5 = v6;
  uint64_t v7 = *(char **)(v4 - 8);
  if (a2 <= (v6 - v7) >> 5)
  {
    if (a2)
    {
      bzero(*(void **)(v4 - 8), 32 * a2);
      v7 += 32 * a2;
    }
    a1[1] = v7;
  }
  else
  {
    uint64_t v8 = v7 - (unsigned char *)*a1;
    unint64_t v9 = a2 + (v8 >> 5);
    if (v9 >> 59) {
      abort();
    }
    uint64_t v10 = v8 >> 5;
    uint64_t v11 = v5 - (unsigned char *)*a1;
    if (v11 >> 4 > v9) {
      unint64_t v9 = v11 >> 4;
    }
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFE0) {
      unint64_t v12 = 0x7FFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v9;
    }
    if (v12) {
      double v13 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::pair<CGSize,CGSize>>>(v4, v12);
    }
    else {
      double v13 = 0;
    }
    double v14 = &v13[32 * v10];
    double v15 = &v13[32 * v12];
    bzero(v14, 32 * a2);
    uint64_t v16 = &v14[32 * a2];
    CGRect v18 = (char *)*a1;
    double v17 = (char *)a1[1];
    if (v17 != *a1)
    {
      do
      {
        long long v19 = *((_OWORD *)v17 - 1);
        *((_OWORD *)v14 - 2) = *((_OWORD *)v17 - 2);
        *((_OWORD *)v14 - 1) = v19;
        v14 -= 32;
        v17 -= 32;
      }
      while (v17 != v18);
      double v17 = (char *)*a1;
    }
    *a1 = v14;
    a1[1] = v16;
    a1[2] = v15;
    if (v17)
    {
      operator delete(v17);
    }
  }
}

void std::vector<CGRect>::resize(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 5;
  if (a2 <= v2)
  {
    if (a2 < v2) {
      *(void *)(a1 + 8) = *(void *)a1 + 32 * a2;
    }
  }
  else
  {
    std::vector<CGRect>::__append((void **)a1, a2 - v2);
  }
}

void _NUIGridArrangement::positionCells(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6)
{
}

void _NUIGridArrangement::_NUIGridArrangement(_NUIGridArrangement *this)
{
  this->container = 0;
  *((_WORD *)this + 4) = 0;
  this->baselineRelative = 0;
  *(_OWORD *)&this->cells.__begin_ = 0u;
  *(_OWORD *)&this->cells.__end_cap_.__value_ = 0u;
  *(_OWORD *)&this->columns.__end_ = 0u;
  *(_OWORD *)&this->rows.__begin_ = 0u;
  *(_OWORD *)&this->rows.__end_cap_.__value_ = 0u;
  *(_OWORD *)&this->viewFrames.__end_ = 0u;
}

uint64_t std::__sort4[abi:nn180100]<std::_ClassicAlgPolicy,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::{lambda(_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&)#1} &,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell*>(void *a1, void *a2, void *a3, void *a4, unsigned char *a5)
{
  uint64_t result = std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::{lambda(_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&)#1} &,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell*>(a1, a2, a3, a5);
  uint64_t v11 = 8;
  if (!*a5) {
    uint64_t v11 = 12;
  }
  float v12 = *(float *)(*a4 + v11) - *(float *)(*a3 + v11);
  uint64_t v13 = a4[2];
  uint64_t v14 = a3[2];
  uint64_t v15 = v13 - v14;
  if (!a5[1])
  {
    BOOL v17 = v15 < 0;
    if (v13 == v14) {
      BOOL v18 = v12 > 0.0;
    }
    else {
      BOOL v18 = v17;
    }
    if (!v18) {
      return result;
    }
LABEL_12:
    uint64_t v19 = a3[2];
    long long v20 = *(_OWORD *)a3;
    uint64_t v21 = a4[2];
    *(_OWORD *)a3 = *(_OWORD *)a4;
    a3[2] = v21;
    *(_OWORD *)a4 = v20;
    a4[2] = v19;
    uint64_t v22 = 8;
    if (!*a5) {
      uint64_t v22 = 12;
    }
    float v23 = *(float *)(*a3 + v22) - *(float *)(*a2 + v22);
    uint64_t v24 = a3[2];
    uint64_t v25 = a2[2];
    uint64_t v26 = v24 - v25;
    if (a5[1])
    {
      BOOL v27 = v26 < 0;
      if (v23 != 0.0) {
        BOOL v27 = v23 > 0.0;
      }
      if (!v27) {
        return result;
      }
    }
    else
    {
      BOOL v28 = v26 < 0;
      if (v24 == v25) {
        BOOL v29 = v23 > 0.0;
      }
      else {
        BOOL v29 = v28;
      }
      if (!v29) {
        return result;
      }
    }
    uint64_t v30 = a2[2];
    long long v31 = *(_OWORD *)a2;
    uint64_t v32 = a3[2];
    *(_OWORD *)a2 = *(_OWORD *)a3;
    a2[2] = v32;
    *(_OWORD *)a3 = v31;
    a3[2] = v30;
    uint64_t v33 = 8;
    if (!*a5) {
      uint64_t v33 = 12;
    }
    float v34 = *(float *)(*a2 + v33) - *(float *)(*a1 + v33);
    uint64_t v35 = a2[2];
    uint64_t v36 = a1[2];
    uint64_t v37 = v35 - v36;
    if (a5[1])
    {
      BOOL v38 = v37 < 0;
      if (v34 != 0.0) {
        BOOL v38 = v34 > 0.0;
      }
      if (!v38) {
        return result;
      }
    }
    else
    {
      BOOL v42 = v37 < 0;
      if (v35 == v36) {
        BOOL v43 = v34 > 0.0;
      }
      else {
        BOOL v43 = v42;
      }
      if (!v43) {
        return result;
      }
    }
    uint64_t v39 = a1[2];
    long long v40 = *(_OWORD *)a1;
    uint64_t v41 = a2[2];
    *(_OWORD *)a1 = *(_OWORD *)a2;
    a1[2] = v41;
    *(_OWORD *)a2 = v40;
    a2[2] = v39;
    return result;
  }
  BOOL v16 = v15 < 0;
  if (v12 != 0.0) {
    BOOL v16 = v12 > 0.0;
  }
  if (v16) {
    goto LABEL_12;
  }
  return result;
}

uint64_t std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::{lambda(_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&)#1} &,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell*>(void *a1, void *a2, void *a3, unsigned char *a4)
{
  if (*a4) {
    uint64_t v4 = 8;
  }
  else {
    uint64_t v4 = 12;
  }
  float v5 = *(float *)(*a2 + v4);
  float v6 = v5 - *(float *)(*a1 + v4);
  uint64_t v7 = a2[2];
  uint64_t v8 = a1[2];
  uint64_t v9 = v7 - v8;
  float v10 = *(float *)(*a3 + v4) - v5;
  uint64_t v11 = a3[2];
  uint64_t v12 = v11 - v7;
  if (!a4[1])
  {
    BOOL v18 = v9 < 0;
    if (v7 == v8) {
      BOOL v19 = v6 > 0.0;
    }
    else {
      BOOL v19 = v18;
    }
    BOOL v20 = v12 < 0;
    if (v11 == v7) {
      BOOL v21 = v10 > 0.0;
    }
    else {
      BOOL v21 = v20;
    }
    if (v19)
    {
      if (v21) {
        goto LABEL_11;
      }
      goto LABEL_20;
    }
    if (v21)
    {
LABEL_28:
      uint64_t v31 = a2[2];
      long long v32 = *(_OWORD *)a2;
      uint64_t v33 = a3[2];
      *(_OWORD *)a2 = *(_OWORD *)a3;
      a2[2] = v33;
      *(_OWORD *)a3 = v32;
      a3[2] = v31;
      uint64_t v34 = 8;
      if (!*a4) {
        uint64_t v34 = 12;
      }
      float v35 = *(float *)(*a2 + v34) - *(float *)(*a1 + v34);
      uint64_t v36 = a2[2];
      uint64_t v37 = a1[2];
      uint64_t v38 = v36 - v37;
      if (a4[1])
      {
        BOOL v39 = v38 < 0;
        if (v35 != 0.0) {
          BOOL v39 = v35 > 0.0;
        }
        if (!v39) {
          return 1;
        }
      }
      else
      {
        BOOL v46 = v38 < 0;
        if (v36 == v37) {
          BOOL v47 = v35 > 0.0;
        }
        else {
          BOOL v47 = v46;
        }
        if (!v47) {
          return 1;
        }
      }
      uint64_t v48 = a1[2];
      long long v49 = *(_OWORD *)a1;
      uint64_t v50 = a2[2];
      *(_OWORD *)a1 = *(_OWORD *)a2;
      a1[2] = v50;
      *(_OWORD *)a2 = v49;
      a2[2] = v48;
      return 2;
    }
    return 0;
  }
  BOOL v13 = v6 > 0.0;
  if (v6 == 0.0) {
    BOOL v13 = v9 < 0;
  }
  BOOL v14 = v12 < 0;
  if (v10 != 0.0) {
    BOOL v14 = v10 > 0.0;
  }
  if (!v13)
  {
    if (v14) {
      goto LABEL_28;
    }
    return 0;
  }
  if (!v14)
  {
LABEL_20:
    uint64_t v22 = a1[2];
    long long v23 = *(_OWORD *)a1;
    uint64_t v24 = a2[2];
    *(_OWORD *)a1 = *(_OWORD *)a2;
    a1[2] = v24;
    *(_OWORD *)a2 = v23;
    a2[2] = v22;
    uint64_t v25 = 8;
    if (!*a4) {
      uint64_t v25 = 12;
    }
    float v26 = *(float *)(*a3 + v25) - *(float *)(*a2 + v25);
    uint64_t v27 = a3[2];
    uint64_t v28 = a2[2];
    uint64_t v29 = v27 - v28;
    if (a4[1])
    {
      BOOL v30 = v29 < 0;
      if (v26 != 0.0) {
        BOOL v30 = v26 > 0.0;
      }
      if (!v30) {
        return 1;
      }
    }
    else
    {
      BOOL v41 = v29 < 0;
      if (v27 == v28) {
        BOOL v42 = v26 > 0.0;
      }
      else {
        BOOL v42 = v41;
      }
      if (!v42) {
        return 1;
      }
    }
    uint64_t v43 = a2[2];
    long long v44 = *(_OWORD *)a2;
    uint64_t v45 = a3[2];
    *(_OWORD *)a2 = *(_OWORD *)a3;
    a2[2] = v45;
    *(_OWORD *)a3 = v44;
    a3[2] = v43;
    return 2;
  }
LABEL_11:
  uint64_t v15 = a1[2];
  long long v16 = *(_OWORD *)a1;
  uint64_t v17 = a3[2];
  *(_OWORD *)a1 = *(_OWORD *)a3;
  a1[2] = v17;
  *(_OWORD *)a3 = v16;
  a3[2] = v15;
  return 1;
}

_NUIViewContainerViewInfo *___ZL35_NUIContainerViewInfoCreateIfNeededP11objc_objectb_block_invoke()
{
  uint64_t result = objc_alloc_init(_NUIViewContainerViewInfo);
  _NUIContainerViewInfoCreateIfNeeded(objc_object *,BOOL)::defaultInfo = (uint64_t)result;
  return result;
}

void sub_1AE662304(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 120), 8);
  _Unwind_Resume(a1);
}

uint64_t ___ZL30_NUIViewIsSwiftUISPICompatibleP6UIView_block_invoke()
{
  _NUIViewIsSwiftUISPICompatible(UIView *)::checkedSet = (uint64_t)(id)[MEMORY[0x1E4F28D30] weakObjectsHashTable];
  uint64_t result = [MEMORY[0x1E4F42FF0] instanceMethodForSelector:sel__layoutSizeThatFits_fixedAxes_];
  _NUIViewIsSwiftUISPICompatible(UIView *)::baseLayoutSizeImp = result;
  return result;
}

uint64_t **std::__tree<std::__value_type<UIView *,std::pair<_NSRange,_NSRange> const>,std::__map_value_compare<UIView *,std::__value_type<UIView *,std::pair<_NSRange,_NSRange> const>,std::less<UIView *>,true>,std::allocator<std::__value_type<UIView *,std::pair<_NSRange,_NSRange> const>>>::__emplace_unique_key_args<UIView *,UIView * const&,std::pair<_NSRange,_NSRange>>(uint64_t **a1, unint64_t *a2, void *a3, _OWORD *a4)
{
  uint64_t v8 = a1 + 1;
  uint64_t v7 = a1[1];
  if (v7)
  {
    unint64_t v9 = *a2;
    while (1)
    {
      while (1)
      {
        float v10 = (uint64_t **)v7;
        unint64_t v11 = v7[4];
        if (v9 >= v11) {
          break;
        }
        uint64_t v7 = *v10;
        uint64_t v8 = v10;
        if (!*v10) {
          goto LABEL_10;
        }
      }
      if (v11 >= v9) {
        break;
      }
      uint64_t v7 = v10[1];
      if (!v7)
      {
        uint64_t v8 = v10 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    float v10 = a1 + 1;
LABEL_10:
    uint64_t v12 = (char *)operator new(0x48uLL);
    *((void *)v12 + 4) = *a3;
    long long v13 = a4[1];
    *(_OWORD *)(v12 + 40) = *a4;
    *(_OWORD *)(v12 + 56) = v13;
    std::__tree<UIView *>::__insert_node_at(a1, (uint64_t)v10, v8, (uint64_t *)v12);
    return (uint64_t **)v12;
  }
  return v10;
}

void std::__throw_bad_array_new_length[abi:nn180100]()
{
}

void _NUIFlowArrangement::_NUIFlowArrangement(_NUIFlowArrangement *this)
{
  this->container = 0;
  *((_WORD *)this + 4) = 6;
  this->columns = 0;
  __asm { FMOV            V0.2D, #6.0 }
  *(_OWORD *)&this->rowSpacing = _Q0;
  this->rowdouble Height = 1.79769313e308;
  this->itemdouble Width = 1.79769313e308;
  *(_OWORD *)&this->cells.__begin_ = 0u;
  this->viewFrames.__begin_ = 0;
  this->viewFrames.__end_ = 0;
  this->viewFrames.__end_cap_.__value_ = 0;
  *(_OWORD *)&this->cells.__end_cap_.__value_ = 0u;
  *(_OWORD *)&this->rows.var0 = 0u;
  uint64_t v7 = [_NUIFlowContainer alloc];
  if (v7)
  {
    uint64_t v7 = [(_NUIFlowContainer *)v7 init];
    if (v7)
    {
      v7->_flowArrangement = this;
      *((unsigned char *)&v7->_gridArrangement + 9) = *((unsigned char *)this + 9);
      v7->_gridArrangement.container = (_NUIGridArrangementContainer *)v7;
    }
  }
  this->flowContainer = v7;
}

void sub_1AE663134(_Unwind_Exception *a1)
{
  float v5 = v4;
  uint64_t v7 = *v5;
  if (*v5)
  {
    *(void *)(v1 + 128) = v7;
    operator delete(v7);
  }
  _NUIFlowArrangement::_NUIFlowArrangement(v3, v2, v1);
  _Unwind_Resume(a1);
}

void _NUIFlowArrangement::~_NUIFlowArrangement(_NUIFlowArrangement *this)
{
  _NUIFlowArrangement::resetForInvalidation(this, -1);

  begin = this->viewFrames.__begin_;
  if (begin)
  {
    this->viewFrames.__end_ = begin;
    operator delete(begin);
  }
  uint64_t v3 = this->rows.__begin_;
  if (v3)
  {
    this->rows.var0 = v3;
    operator delete(v3);
  }
  uint64_t v4 = this->cells.__begin_;
  if (v4)
  {
    this->cells.__end_ = v4;
    operator delete(v4);
  }
}

void sub_1AE66320C(_Unwind_Exception *a1)
{
  uint64_t v3 = (void *)v1[15];
  if (v3)
  {
    v1[16] = v3;
    operator delete(v3);
  }
  _NUIFlowArrangement::~_NUIFlowArrangement(v1);
  _Unwind_Resume(a1);
}

_NUIGridArrangement *_NUIFlowArrangement::resetForInvalidation(_NUIFlowArrangement *this, uint64_t a2)
{
  if ((a2 & 7) != 0)
  {
    begin = this->rows.__begin_;
    var0 = this->rows.var0;
    if (begin != var0)
    {
      do
      {
        float v5 = *begin++;
      }
      while (begin != var0);
      begin = this->rows.__begin_;
    }
    this->rows.var0 = begin;
    this->cells.__end_ = this->cells.__begin_;
    LOBYTE(a2) = -1;
  }
  else if (a2)
  {
    uint64_t v8 = this->cells.__begin_;
    end = this->cells.__end_;
    if (v8 != end)
    {
      unint64_t v9 = (CGSize *)MEMORY[0x1E4F1DB30];
      do
      {
        v8->var1 = *v9;
        v8->var2 = *v9;
        v8->var3.var0 = 0.0;
        v8->var3.var1 = 0.0;
        ++v8;
      }
      while (v8 != end);
    }
  }
  uint64_t result = _NUIGridArrangement::resetForInvalidation(&this->flowContainer->_gridArrangement, a2);
  this->viewFrames.__end_ = this->viewFrames.__begin_;
  return result;
}

__n128 _NUIFlowArrangementCell::_NUIFlowArrangementCell(uint64_t a1, uint64_t a2, unsigned __int8 a3, __int16 a4)
{
  *(void *)a1 = a2;
  uint64_t v4 = (__n128 *)MEMORY[0x1E4F1DB30];
  *(_OWORD *)(a1 + 8) = *MEMORY[0x1E4F1DB30];
  __n128 result = *v4;
  *(__n128 *)(a1 + 24) = *v4;
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 48) = 0;
  *(_WORD *)(a1 + 56) = a3 | (unsigned __int16)(a4 << 8);
  return result;
}

void _NUIFlowArrangement::measureCells(_NUIFlowArrangement *this, int a2, CGSize a3)
{
  double height = a3.height;
  CGFloat width = a3.width;
  if (a3.width != this->measuredWidth)
  {
    _NUIFlowArrangement::resetForInvalidation(this, 2);
    this->measureddouble Width = width;
  }
  if (this->cells.__end_ != this->cells.__begin_
    || ([(_NUIFlowArrangementContainer *)this->container populateFlowArrangementCells:&this->cells], this->cells.__end_ != this->cells.__begin_))
  {
    if (this->rows.var0 != this->rows.__begin_)
    {
LABEL_116:
      _NUIGridArrangement::resetForInvalidation(&this->flowContainer->_gridArrangement, 0);
      *((unsigned char *)&this->flowContainer->_gridArrangement + 9) = *((unsigned char *)this + 9);
      v111.CGFloat width = width;
      v111.double height = height;
      _NUIGridArrangement::measureCells(&this->flowContainer->_gridArrangement, a2, v111);
      return;
    }
    if (-[_NUIFlowContainer canUseSimpleGrid]((uint64_t)this->flowContainer))
    {
      *((unsigned char *)&this->flowContainer->_gridArrangement + 8) = *((unsigned char *)this + 8);
      *((unsigned char *)&this->flowContainer->_gridArrangement + 9) = *((unsigned char *)this + 9);
      goto LABEL_116;
    }
    unint64_t columns = this->columns;
    if (columns)
    {
      int64_t v8 = (char *)this->cells.__end_ - (char *)this->cells.__begin_;
      if (v8)
      {
        unint64_t v9 = 0;
        unint64_t v10 = v8 >> 6;
        do
        {
          unint64_t v11 = columns + v9;
          if (v10 >= v11) {
            unint64_t v12 = v11;
          }
          else {
            unint64_t v12 = v10;
          }
          long long v13 = [_NUIFlowRowContainer alloc];
          if (v13)
          {
            BOOL v14 = [(_NUIFlowRowContainer *)v13 init];
            uint64_t v15 = (__end_ *)v14;
            if (v14)
            {
              v14->_range.length = v12 - v9;
              v14->_flowArrangement = this;
              v14->_range.location = v9;
              v14->_gridArrangement.container = (_NUIGridArrangementContainer *)v14;
            }
          }
          else
          {
            uint64_t v15 = 0;
          }
          var0 = this->rows.var0;
          value = this->rows.var1.__value_;
          if (var0 >= (__end_cap_ **)value)
          {
            begin = this->rows.__begin_;
            uint64_t v20 = var0 - begin;
            if ((unint64_t)(v20 + 1) >> 61) {
              goto LABEL_120;
            }
            uint64_t v21 = (char *)value - (char *)begin;
            uint64_t v22 = v21 >> 2;
            if (v21 >> 2 <= (unint64_t)(v20 + 1)) {
              uint64_t v22 = v20 + 1;
            }
            if ((unint64_t)v21 >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v23 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v23 = v22;
            }
            if (v23) {
              uint64_t v24 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<_NUIFlowRowContainer *>>((uint64_t)&this->rows.var1, v23);
            }
            else {
              uint64_t v24 = 0;
            }
            uint64_t v25 = (__end_ **)&v24[8 * v20];
            *uint64_t v25 = v15;
            BOOL v18 = v25 + 1;
            uint64_t v27 = this->rows.__begin_;
            float v26 = this->rows.var0;
            if (v26 != v27)
            {
              do
              {
                uint64_t v28 = *--v26;
                *--uint64_t v25 = v28;
              }
              while (v26 != v27);
              float v26 = this->rows.__begin_;
            }
            this->rows.__begin_ = v25;
            this->rows.var0 = v18;
            this->rows.var1.__value_ = (id *)&v24[8 * v23];
            if (v26) {
              operator delete(v26);
            }
          }
          else
          {
            *var0 = v15;
            BOOL v18 = var0 + 1;
          }
          this->rows.var0 = v18;
          unint64_t columns = this->columns;
          v9 += columns;
          unint64_t v10 = this->cells.__end_ - this->cells.__begin_;
        }
        while (v9 < v10);
      }
      goto LABEL_108;
    }
    char v29 = objc_opt_respondsToSelector();
    BOOL v30 = this->cells.__begin_;
    if (this->cells.__end_ == v30)
    {
LABEL_108:
      if (objc_opt_respondsToSelector())
      {
        CGRect v95 = this->rows.__begin_;
        CGRect v96 = this->rows.var0;
        if (v95 != v96)
        {
          uint64_t v97 = 0;
          uint64_t v98 = 0;
          do
          {
            CGRect v99 = this->cells.__begin_;
            unint64_t v100 = v95[v98];
            uint64_t v102 = *((void *)v100 + 15);
            unint64_t v101 = *((void *)v100 + 16);
            v109 = 0;
            uint64_t v110 = 0;
            __p = 0;
            std::vector<_NUIFlowArrangementCell>::__init_with_size[abi:nn180100]<std::__wrap_iter<_NUIFlowArrangementCell*>,std::__wrap_iter<_NUIFlowArrangementCell*>>((char *)&__p, (long long *)&v99[v102], (long long *)&v99[v101 + v102], v101);
            *((unsigned char *)v95[v98] + 16) = [(_NUIFlowArrangementContainer *)this->container distributionForRowAtIndex:v98 ofTotalRowCount:this->rows.var0 - this->rows.__begin_ withCells:&__p];
            if (__p)
            {
              v109 = __p;
              operator delete(__p);
            }
            ++v97;
            ++v98;
          }
          while (&v95[v97] != v96);
        }
      }
      else if (!this->columns)
      {
        unint64_t v103 = this->rows.__begin_;
        uint64_t v104 = this->rows.var0;
        while (v103 != v104)
        {
          uint64_t v105 = (uint64_t)*v103++;
          *(unsigned char *)(v105 + 16) = *((unsigned char *)this + 8);
        }
      }
      goto LABEL_116;
    }
    char v31 = v29;
    unint64_t v32 = 0;
    unint64_t v33 = 0;
    double v34 = 1.79769313e308;
    p_var1 = &this->rows.var1;
    float v35 = (double *)MEMORY[0x1E4F1DB30];
    double v36 = 0.001;
    double v37 = width;
    while (1)
    {
      itemdouble Width = this->itemWidth;
      if (itemWidth != v34) {
        goto LABEL_55;
      }
      p_var0 = &v30[v33].var0;
      container = this->container;
      if (v31)
      {
        -[_NUIFlowArrangementContainer fittingSizeForCell:withProposedSize:](this->container, "fittingSizeForCell:withProposedSize:", &v30[v33], width, height);
        double v42 = v41;
        double v44 = v43;
        container = this->container;
      }
      else
      {
        double v44 = height;
        double v42 = width;
      }
      uint64_t v45 = &v30[v33];
      double v47 = v45->var2.width;
      p_CGFloat width = &v45->var2.width;
      double v48 = v47;
      if (vabdd_f64(v47, *v35) < v36 && vabdd_f64(v30[v33].var2.height, v35[1]) < v36)
      {
LABEL_53:
        -[_NUIFlowArrangementContainer contentLayoutSizeFittingSize:forArrangedSubview:](container, "contentLayoutSizeFittingSize:forArrangedSubview:", *p_var0, v42, v44);
        uint64_t v59 = &v30[v33];
        v59->var1.CGFloat width = v60;
        v59->var1.double height = v61;
        *p_CGFloat width = v42;
        v59->var2.double height = v44;
        goto LABEL_54;
      }
      long long v49 = &v30[v33];
      if (vabdd_f64(v48, v42) >= v36)
      {
        double v107 = v44;
        double v50 = v37;
        double v51 = width;
        double v52 = v36;
        double v53 = height;
        double v54 = v34;
        double v55 = v42 - v49->var1.width;
        char v56 = [*p_var0 isLayoutSizeDependentOnPerpendicularAxis];
        BOOL v57 = v55 < -0.001;
        double v34 = v54;
        double height = v53;
        double v36 = v52;
        CGFloat width = v51;
        double v37 = v50;
        double v44 = v107;
        if (v57) {
          char v58 = 1;
        }
        else {
          char v58 = v56;
        }
        if (v58) {
          goto LABEL_53;
        }
      }
      else if (vabdd_f64(v49->var2.height, v44) < v36)
      {
        goto LABEL_54;
      }
      if (v44 - v30[v33].var1.height < -0.001) {
        goto LABEL_53;
      }
LABEL_54:
      itemdouble Width = v30[v33].var1.width;
LABEL_55:
      if (v33 > v32) {
        itemdouble Width = itemWidth + this->itemSpacing;
      }
      if (itemWidth > v37)
      {
        if (v33 == v32) {
          uint64_t v62 = 1;
        }
        else {
          uint64_t v62 = v33 - v32;
        }
        uint64_t v63 = [_NUIFlowRowContainer alloc];
        if (v63)
        {
          double v64 = [(_NUIFlowRowContainer *)v63 init];
          char v65 = (__end_ *)v64;
          if (v64)
          {
            v64->_range.length = v62;
            v64->_flowArrangement = this;
            v64->_range.location = v32;
            v64->_gridArrangement.container = (_NUIGridArrangementContainer *)v64;
          }
        }
        else
        {
          char v65 = 0;
        }
        uint64_t v67 = this->rows.var0;
        char v66 = this->rows.var1.__value_;
        if (v67 >= (__end_cap_ **)v66)
        {
          double v75 = this->rows.__begin_;
          uint64_t v76 = v67 - v75;
          if ((unint64_t)(v76 + 1) >> 61) {
            goto LABEL_120;
          }
          uint64_t v77 = (char *)v66 - (char *)v75;
          uint64_t v78 = v77 >> 2;
          if (v77 >> 2 <= (unint64_t)(v76 + 1)) {
            uint64_t v78 = v76 + 1;
          }
          if ((unint64_t)v77 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v79 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v79 = v78;
          }
          if (v79) {
            double v80 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<_NUIFlowRowContainer *>>((uint64_t)p_var1, v79);
          }
          else {
            double v80 = 0;
          }
          CGRect v87 = (__end_ **)&v80[8 * v76];
          *CGRect v87 = v65;
          uint64_t v68 = v87 + 1;
          CGRect v89 = this->rows.__begin_;
          CGRect v88 = this->rows.var0;
          if (v88 != v89)
          {
            do
            {
              CGRect v90 = *--v88;
              *--CGRect v87 = v90;
            }
            while (v88 != v89);
            CGRect v88 = this->rows.__begin_;
          }
          this->rows.__begin_ = v87;
          this->rows.var0 = v68;
          this->rows.var1.__value_ = (id *)&v80[8 * v79];
          if (v88) {
            operator delete(v88);
          }
        }
        else
        {
          *uint64_t v67 = v65;
          uint64_t v68 = v67 + 1;
        }
        this->rows.var0 = v68;
        unint64_t v33 = v62 + v32;
LABEL_103:
        double v37 = width;
        unint64_t v32 = v33;
        goto LABEL_104;
      }
      if (v33 == this->cells.__end_ - this->cells.__begin_ - 1)
      {
        ++v33;
        double v69 = [_NUIFlowRowContainer alloc];
        if (v69)
        {
          double v70 = [(_NUIFlowRowContainer *)v69 init];
          CGFloat v71 = (__end_ *)v70;
          if (v70)
          {
            v70->_range.length = v33 - v32;
            v70->_flowArrangement = this;
            v70->_range.location = v32;
            v70->_gridArrangement.container = (_NUIGridArrangementContainer *)v70;
          }
        }
        else
        {
          CGFloat v71 = 0;
        }
        double v73 = this->rows.var0;
        double v72 = this->rows.var1.__value_;
        if (v73 >= (__end_cap_ **)v72)
        {
          double v81 = this->rows.__begin_;
          uint64_t v82 = v73 - v81;
          if ((unint64_t)(v82 + 1) >> 61) {
LABEL_120:
          }
            abort();
          uint64_t v83 = (char *)v72 - (char *)v81;
          uint64_t v84 = v83 >> 2;
          if (v83 >> 2 <= (unint64_t)(v82 + 1)) {
            uint64_t v84 = v82 + 1;
          }
          if ((unint64_t)v83 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v85 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v85 = v84;
          }
          if (v85) {
            CGRect v86 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<_NUIFlowRowContainer *>>((uint64_t)p_var1, v85);
          }
          else {
            CGRect v86 = 0;
          }
          CGRect v91 = (__end_ **)&v86[8 * v82];
          *CGRect v91 = v71;
          double v74 = v91 + 1;
          CGRect v93 = this->rows.__begin_;
          CGRect v92 = this->rows.var0;
          if (v92 != v93)
          {
            do
            {
              CGRect v94 = *--v92;
              *--CGRect v91 = v94;
            }
            while (v92 != v93);
            CGRect v92 = this->rows.__begin_;
          }
          this->rows.__begin_ = v91;
          this->rows.var0 = v74;
          this->rows.var1.__value_ = (id *)&v86[8 * v85];
          if (v92) {
            operator delete(v92);
          }
        }
        else
        {
          *double v73 = v71;
          double v74 = v73 + 1;
        }
        this->rows.var0 = v74;
        goto LABEL_103;
      }
      double v37 = v37 - itemWidth;
      ++v33;
LABEL_104:
      BOOL v30 = this->cells.__begin_;
      if (v33 >= this->cells.__end_ - v30) {
        goto LABEL_108;
      }
    }
  }
}

void sub_1AE6639EC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void _NUIFlowArrangement::positionCells(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6)
{
  uint64_t v6 = *(void *)(a1 + 104);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = ___ZN19_NUIFlowArrangement13positionCellsE6CGRectU13block_pointerFvPU29objcproto18NUIArrangementItem11objc_objectS0_E_block_invoke;
  v7[3] = &unk_1E5EFF230;
  *(double *)&v7[6] = a3;
  *(double *)&v7[7] = a4;
  *(double *)&v7[8] = a5;
  *(double *)&v7[9] = a6;
  v7[4] = a2;
  v7[5] = a1;
  _NUIGridArrangement::positionCells(v6 + 8, (uint64_t)v7, a3, a4, a5, a6);
}

void ___ZN19_NUIFlowArrangement13positionCellsE6CGRectU13block_pointerFvPU29objcproto18NUIArrangementItem11objc_objectS0_E_block_invoke(double *a1, uint64_t a2, double a3, double a4, CGFloat a5, CGFloat a6)
{
  uint64_t v12 = *((void *)a1 + 5);
  if (-[_NUIFlowContainer canUseSimpleGrid](*(void *)(v12 + 104)))
  {
    uint64_t v13 = *(void *)(v12 + 104) + 8;
    double v14 = a1[6];
    double v15 = a1[7];
    double v16 = a1[8];
    double v17 = a1[9];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = ___ZN19_NUIFlowArrangement13positionCellsE6CGRectU13block_pointerFvPU29objcproto18NUIArrangementItem11objc_objectS0_E_block_invoke_2;
    v21[3] = &unk_1E5EFF208;
    *(double *)&v21[4] = a1[4];
    BOOL v18 = v21;
LABEL_5:
    _NUIGridArrangement::positionCells(v13, (uint64_t)v18, v14, v15, v16, v17);
    return;
  }
  _NUIGridArrangement::resetForInvalidation((_NUIGridArrangement *)(a2 + 8), 0);
  v23.CGFloat width = a5;
  v23.double height = a6;
  _NUIGridArrangement::measureCells((_NUIGridArrangement *)(a2 + 8), 1, v23);
  if (*(unsigned char *)(a2 + 16) == 1)
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = ___ZN19_NUIFlowArrangement13positionCellsE6CGRectU13block_pointerFvPU29objcproto18NUIArrangementItem11objc_objectS0_E_block_invoke_3;
    v20[3] = &unk_1E5EFF208;
    *(double *)&v20[4] = a1[4];
    BOOL v18 = v20;
    uint64_t v13 = a2 + 8;
    double v14 = a3;
    double v15 = a4;
    double v16 = a5;
    double v17 = a6;
    goto LABEL_5;
  }
  uint64_t v19 = *((void *)a1 + 4);
  _NUIGridArrangement::positionCells(a2 + 8, v19, a3, a4, a5, a6);
}

uint64_t ___ZN19_NUIFlowArrangement13positionCellsE6CGRectU13block_pointerFvPU29objcproto18NUIArrangementItem11objc_objectS0_E_block_invoke_2(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6)
{
  uint64_t result = +[_NUIFlowArrangementDummyItem sharedDummyItem]();
  if (result != a2)
  {
    double v17 = *(uint64_t (**)(__n128, __n128, __n128, __n128))(*(void *)(a1 + 32) + 16);
    v13.n128_f64[0] = a3;
    v14.n128_f64[0] = a4;
    v15.n128_f64[0] = a5;
    v16.n128_f64[0] = a6;
    return v17(v13, v14, v15, v16);
  }
  return result;
}

uint64_t ___ZN19_NUIFlowArrangement13positionCellsE6CGRectU13block_pointerFvPU29objcproto18NUIArrangementItem11objc_objectS0_E_block_invoke_3(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6)
{
  uint64_t result = +[_NUIFlowArrangementDummyItem sharedDummyItem]();
  if (result != a2)
  {
    double v17 = *(uint64_t (**)(__n128, __n128, __n128, __n128))(*(void *)(a1 + 32) + 16);
    v13.n128_f64[0] = a3;
    v14.n128_f64[0] = a4;
    v15.n128_f64[0] = a5;
    v16.n128_f64[0] = a6;
    return v17(v13, v14, v15, v16);
  }
  return result;
}

void *_NUIFlowArrangementCell::debugDictionary(_NUIFlowArrangementCell *this)
{
  v20[2] = *MEMORY[0x1E4F143B8];
  unint64_t v2 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithObject:this->var0 forKey:@"item"];
  if (this->var1.width != *MEMORY[0x1E4F1DB30] || this->var1.height != *(double *)(MEMORY[0x1E4F1DB30] + 8)) {
    objc_msgSend(v2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F29238], "value:withObjCType:", &this->var1, "{CGSize=dd}"), @"size");
  }
  double var0 = this->var3.var0;
  double var1 = this->var3.var1;
  if (var0 != 0.0 && var0 != 2.22507386e-308)
  {
    if (var1 != 0.0 && var1 != 2.22507386e-308)
    {
      v19[0] = @"topOffset";
      v19[1] = @"bottomOffset";
      v20[0] = objc_msgSend(NSNumber, "numberWithDouble:");
      v20[1] = [NSNumber numberWithDouble:var1];
      int64_t v8 = (void *)MEMORY[0x1E4F1C9E8];
      unint64_t v9 = v20;
      unint64_t v10 = (__CFString **)v19;
      uint64_t v12 = 2;
      goto LABEL_23;
    }
    double v17 = @"topOffset";
    uint64_t v18 = objc_msgSend(NSNumber, "numberWithDouble:");
    int64_t v8 = (void *)MEMORY[0x1E4F1C9E8];
    unint64_t v9 = &v18;
    unint64_t v10 = &v17;
LABEL_22:
    uint64_t v12 = 1;
LABEL_23:
    uint64_t v13 = [v8 dictionaryWithObjects:v9 forKeys:v10 count:v12];
    if (v13) {
      [v2 setObject:v13 forKeyedSubscript:@"baselines"];
    }
    return v2;
  }
  if (var1 != 0.0 && var1 != 2.22507386e-308)
  {
    __n128 v15 = @"bottomOffset";
    uint64_t v16 = [NSNumber numberWithDouble:var1];
    int64_t v8 = (void *)MEMORY[0x1E4F1C9E8];
    unint64_t v9 = &v16;
    unint64_t v10 = &v15;
    goto LABEL_22;
  }
  return v2;
}

void *_NUIFlowArrangement::debugDictionary(_NUIFlowArrangement *this)
{
  v22[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithObject:@"_NUIFlowArrangement" forKey:@"class"];
  double baseLineFromTop = this->maxBaseLinePair.baseLineFromTop;
  double baseLineFromBottom = this->maxBaseLinePair.baseLineFromBottom;
  if (baseLineFromTop == 0.0 || baseLineFromTop == 2.22507386e-308)
  {
    if (baseLineFromBottom == 0.0 || baseLineFromBottom == 2.22507386e-308) {
      goto LABEL_20;
    }
    double v17 = @"bottomOffset";
    uint64_t v18 = [NSNumber numberWithDouble:baseLineFromBottom];
    int64_t v8 = (void *)MEMORY[0x1E4F1C9E8];
    unint64_t v9 = &v18;
    unint64_t v10 = &v17;
  }
  else
  {
    if (baseLineFromBottom != 0.0 && baseLineFromBottom != 2.22507386e-308)
    {
      v21[0] = @"topOffset";
      v21[1] = @"bottomOffset";
      v22[0] = objc_msgSend(NSNumber, "numberWithDouble:");
      v22[1] = [NSNumber numberWithDouble:baseLineFromBottom];
      int64_t v8 = (void *)MEMORY[0x1E4F1C9E8];
      unint64_t v9 = v22;
      unint64_t v10 = (__CFString **)v21;
      uint64_t v12 = 2;
      goto LABEL_18;
    }
    uint64_t v19 = @"topOffset";
    uint64_t v20 = objc_msgSend(NSNumber, "numberWithDouble:");
    int64_t v8 = (void *)MEMORY[0x1E4F1C9E8];
    unint64_t v9 = &v20;
    unint64_t v10 = &v19;
  }
  uint64_t v12 = 1;
LABEL_18:
  uint64_t v2 = [v8 dictionaryWithObjects:v9 forKeys:v10 count:v12];
  if (v2) {
    [v3 setObject:v2 forKeyedSubscript:@"maxBaselines"];
  }
LABEL_20:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", v2, this->rowSpacing), @"rowSpacing");
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", this->itemSpacing), @"itemSpacing");
  if (this->cells.__end_ != this->cells.__begin_)
  {
    uint64_t v13 = (void *)[MEMORY[0x1E4F1CA48] array];
    begin = this->cells.__begin_;
    end = this->cells.__end_;
    while (begin != end)
      [v13 addObject:_NUIFlowArrangementCell::debugDictionary(begin++)];
    [v3 setObject:v13 forKeyedSubscript:@"cells"];
  }
  return v3;
}

void sub_1AE664570(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void sub_1AE664578(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void sub_1AE6648D0(_Unwind_Exception *exception_object)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_1AE665004(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void sub_1AE66500C(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void sub_1AE66569C(_Unwind_Exception *exception_object)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<_NUIFlowRowContainer *>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::__throw_bad_array_new_length[abi:nn180100]();
  }
  return operator new(8 * a2);
}

char *std::vector<_NUIFlowArrangementCell>::__init_with_size[abi:nn180100]<std::__wrap_iter<_NUIFlowArrangementCell*>,std::__wrap_iter<_NUIFlowArrangementCell*>>(char *result, long long *a2, long long *a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    uint64_t result = std::vector<_NUIFlowArrangementCell>::__vallocate[abi:nn180100](result, a4);
    uint64_t v7 = (_OWORD *)*((void *)v6 + 1);
    while (a2 != a3)
    {
      long long v8 = *a2;
      long long v9 = a2[1];
      long long v10 = a2[3];
      v7[2] = a2[2];
      v7[3] = v10;
      *uint64_t v7 = v8;
      v7[1] = v9;
      v7 += 4;
      a2 += 4;
    }
    *((void *)v6 + 1) = v7;
  }
  return result;
}

char *std::vector<_NUIFlowArrangementCell>::__vallocate[abi:nn180100](void *a1, unint64_t a2)
{
  if (a2 >> 58) {
    abort();
  }
  uint64_t result = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<_NUIFlowArrangementCell>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[64 * v4];
  return result;
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<_NUIFlowArrangementCell>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 58) {
    std::__throw_bad_array_new_length[abi:nn180100]();
  }
  return operator new(a2 << 6);
}

void *std::vector<_NUIGridArrangementCell>::__emplace_back_slow_path<objc_object  {objcproto18NUIArrangementItem}*,_NSRange,objc_object  {objcproto18NUIArrangementItem}*,NUIContainerAlignment,_NSRange>(void **a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, void *a5, void *a6)
{
  uint64_t v6 = (char *)*a1;
  uint64_t v7 = 0x6DB6DB6DB6DB6DB7 * (((unsigned char *)a1[1] - (unsigned char *)*a1) >> 4);
  unint64_t v8 = v7 + 1;
  if ((unint64_t)(v7 + 1) > 0x249249249249249) {
    abort();
  }
  uint64_t v16 = a1[2];
  uint64_t v15 = (uint64_t)(a1 + 2);
  unint64_t v17 = 0x6DB6DB6DB6DB6DB7 * ((v16 - v6) >> 4);
  if (2 * v17 > v8) {
    unint64_t v8 = 2 * v17;
  }
  if (v17 >= 0x124924924924924) {
    unint64_t v18 = 0x249249249249249;
  }
  else {
    unint64_t v18 = v8;
  }
  if (v18)
  {
    uint64_t v19 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<_NUIGridArrangementCell>>(v15, v18);
    uint64_t v21 = v20;
  }
  else
  {
    uint64_t v19 = 0;
    uint64_t v21 = 0;
  }
  _NUIGridArrangementCell::_NUIGridArrangementCell((uint64_t)&v19[112 * v7], *a2, *a3, a3[1], *a4, a4[1], *a5, *a6);
  CGSize v23 = v22 + 112;
  uint64_t v25 = (char *)*a1;
  uint64_t v24 = (char *)a1[1];
  if (v24 != *a1)
  {
    do
    {
      long long v26 = *((_OWORD *)v24 - 7);
      long long v27 = *((_OWORD *)v24 - 5);
      *((_OWORD *)v22 - 6) = *((_OWORD *)v24 - 6);
      *((_OWORD *)v22 - 5) = v27;
      *((_OWORD *)v22 - 7) = v26;
      long long v28 = *((_OWORD *)v24 - 4);
      long long v29 = *((_OWORD *)v24 - 3);
      long long v30 = *((_OWORD *)v24 - 1);
      *((_OWORD *)v22 - 2) = *((_OWORD *)v24 - 2);
      *((_OWORD *)v22 - 1) = v30;
      *((_OWORD *)v22 - 4) = v28;
      *((_OWORD *)v22 - 3) = v29;
      v22 -= 112;
      v24 -= 112;
    }
    while (v24 != v25);
    uint64_t v24 = (char *)*a1;
  }
  *a1 = v22;
  a1[1] = v23;
  a1[2] = &v19[112 * v21];
  if (v24) {
    operator delete(v24);
  }
  return v23;
}

void sub_1AE665A3C(_Unwind_Exception *exception_object)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

void *std::vector<_NUIGridArrangementCell>::__emplace_back_slow_path<_NUIFlowArrangementDummyItem *,_NSRange,_NSRange,NUIContainerAlignment,NUIContainerAlignment>(void **a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, void *a5, void *a6)
{
  uint64_t v6 = (char *)*a1;
  uint64_t v7 = 0x6DB6DB6DB6DB6DB7 * (((unsigned char *)a1[1] - (unsigned char *)*a1) >> 4);
  unint64_t v8 = v7 + 1;
  if ((unint64_t)(v7 + 1) > 0x249249249249249) {
    abort();
  }
  uint64_t v16 = a1[2];
  uint64_t v15 = (uint64_t)(a1 + 2);
  unint64_t v17 = 0x6DB6DB6DB6DB6DB7 * ((v16 - v6) >> 4);
  if (2 * v17 > v8) {
    unint64_t v8 = 2 * v17;
  }
  if (v17 >= 0x124924924924924) {
    unint64_t v18 = 0x249249249249249;
  }
  else {
    unint64_t v18 = v8;
  }
  if (v18)
  {
    uint64_t v19 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<_NUIGridArrangementCell>>(v15, v18);
    uint64_t v21 = v20;
  }
  else
  {
    uint64_t v19 = 0;
    uint64_t v21 = 0;
  }
  _NUIGridArrangementCell::_NUIGridArrangementCell((uint64_t)&v19[112 * v7], *a2, *a3, a3[1], *a4, a4[1], *a5, *a6);
  CGSize v23 = v22 + 112;
  uint64_t v25 = (char *)*a1;
  uint64_t v24 = (char *)a1[1];
  if (v24 != *a1)
  {
    do
    {
      long long v26 = *((_OWORD *)v24 - 7);
      long long v27 = *((_OWORD *)v24 - 5);
      *((_OWORD *)v22 - 6) = *((_OWORD *)v24 - 6);
      *((_OWORD *)v22 - 5) = v27;
      *((_OWORD *)v22 - 7) = v26;
      long long v28 = *((_OWORD *)v24 - 4);
      long long v29 = *((_OWORD *)v24 - 3);
      long long v30 = *((_OWORD *)v24 - 1);
      *((_OWORD *)v22 - 2) = *((_OWORD *)v24 - 2);
      *((_OWORD *)v22 - 1) = v30;
      *((_OWORD *)v22 - 4) = v28;
      *((_OWORD *)v22 - 3) = v29;
      v22 -= 112;
      v24 -= 112;
    }
    while (v24 != v25);
    uint64_t v24 = (char *)*a1;
  }
  *a1 = v22;
  a1[1] = v23;
  a1[2] = &v19[112 * v21];
  if (v24) {
    operator delete(v24);
  }
  return v23;
}

void sub_1AE665BBC(_Unwind_Exception *exception_object)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

void std::vector<_NUIGridArrangementCell>::__construct_one_at_end[abi:nn180100]<_NUIFlowRowContainer * const&,_NSRange,_NSRange,NUIContainerAlignment,NUIContainerAlignment>(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, void *a5, void *a6)
{
  uint64_t v7 = *(void *)(a1 + 8);
  _NUIGridArrangementCell::_NUIGridArrangementCell(v7, *a2, *a3, a3[1], *a4, a4[1], *a5, *a6);
  *(void *)(a1 + 8) = v7 + 112;
}

void sub_1AE665C2C(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void *std::vector<_NUIGridArrangementCell>::__emplace_back_slow_path<_NUIFlowRowContainer * const&,_NSRange,_NSRange,NUIContainerAlignment,NUIContainerAlignment>(void **a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, void *a5, void *a6)
{
  uint64_t v6 = (char *)*a1;
  uint64_t v7 = 0x6DB6DB6DB6DB6DB7 * (((unsigned char *)a1[1] - (unsigned char *)*a1) >> 4);
  unint64_t v8 = v7 + 1;
  if ((unint64_t)(v7 + 1) > 0x249249249249249) {
    abort();
  }
  uint64_t v16 = a1[2];
  uint64_t v15 = (uint64_t)(a1 + 2);
  unint64_t v17 = 0x6DB6DB6DB6DB6DB7 * ((v16 - v6) >> 4);
  if (2 * v17 > v8) {
    unint64_t v8 = 2 * v17;
  }
  if (v17 >= 0x124924924924924) {
    unint64_t v18 = 0x249249249249249;
  }
  else {
    unint64_t v18 = v8;
  }
  if (v18)
  {
    uint64_t v19 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<_NUIGridArrangementCell>>(v15, v18);
    uint64_t v21 = v20;
  }
  else
  {
    uint64_t v19 = 0;
    uint64_t v21 = 0;
  }
  _NUIGridArrangementCell::_NUIGridArrangementCell((uint64_t)&v19[112 * v7], *a2, *a3, a3[1], *a4, a4[1], *a5, *a6);
  CGSize v23 = v22 + 112;
  uint64_t v25 = (char *)*a1;
  uint64_t v24 = (char *)a1[1];
  if (v24 != *a1)
  {
    do
    {
      long long v26 = *((_OWORD *)v24 - 7);
      long long v27 = *((_OWORD *)v24 - 5);
      *((_OWORD *)v22 - 6) = *((_OWORD *)v24 - 6);
      *((_OWORD *)v22 - 5) = v27;
      *((_OWORD *)v22 - 7) = v26;
      long long v28 = *((_OWORD *)v24 - 4);
      long long v29 = *((_OWORD *)v24 - 3);
      long long v30 = *((_OWORD *)v24 - 1);
      *((_OWORD *)v22 - 2) = *((_OWORD *)v24 - 2);
      *((_OWORD *)v22 - 1) = v30;
      *((_OWORD *)v22 - 4) = v28;
      *((_OWORD *)v22 - 3) = v29;
      v22 -= 112;
      v24 -= 112;
    }
    while (v24 != v25);
    uint64_t v24 = (char *)*a1;
  }
  *a1 = v22;
  a1[1] = v23;
  a1[2] = &v19[112 * v21];
  if (v24) {
    operator delete(v24);
  }
  return v23;
}

void sub_1AE665D9C(_Unwind_Exception *exception_object)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

void _NUIArrangementInvalidRect(uint64_t a1, uint64_t a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (_NUIArrangementLogger(void)::onceToken != -1) {
    dispatch_once(&_NUIArrangementLogger(void)::onceToken, &__block_literal_global_0);
  }
  uint64_t v12 = _NUIArrangementLogger(void)::_log;
  if (os_log_type_enabled((os_log_t)_NUIArrangementLogger(void)::_log, OS_LOG_TYPE_ERROR))
  {
    v20.origin.CGFloat x = a3;
    v20.origin.CGFloat y = a4;
    v20.size.CGFloat width = a5;
    v20.size.double height = a6;
    int v13 = 138412802;
    uint64_t v14 = a1;
    __int16 v15 = 2112;
    uint64_t v16 = NSStringFromCGRect(v20);
    __int16 v17 = 2112;
    uint64_t v18 = a2;
    _os_log_error_impl(&dword_1AE653000, v12, OS_LOG_TYPE_ERROR, "A container %@ has an invalid rect %@ for item %@. Break on _NUIArrangementInvalidRect to debug.", (uint8_t *)&v13, 0x20u);
  }
}

void _NUIArrangementInvalidSize(uint64_t a1, double a2, double a3)
{
  if (_NUIArrangementLogger(void)::onceToken != -1) {
    dispatch_once(&_NUIArrangementLogger(void)::onceToken, &__block_literal_global_0);
  }
  uint64_t v6 = _NUIArrangementLogger(void)::_log;
  if (os_log_type_enabled((os_log_t)_NUIArrangementLogger(void)::_log, OS_LOG_TYPE_ERROR)) {
    _NUIArrangementInvalidSize_cold_1(a1, v6, a2, a3);
  }
}

double _NUIGridArrangement::unionFrameForSubsetCells(_NUIGridArrangement *this, _NSRange a2, _NSRange a3, CGRect a4)
{
  uint64_t v8 = 0;
  long long v9 = (double *)&v8;
  uint64_t v10 = 0x5012000000;
  unint64_t v11 = __Block_byref_object_copy_;
  uint64_t v12 = __Block_byref_object_dispose_;
  int v13 = &unk_1AE6778DD;
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  long long v14 = *MEMORY[0x1E4F1DB28];
  long long v15 = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = ___ZN19_NUIGridArrangement24unionFrameForSubsetCellsE8_NSRangeS0_6CGRect_block_invoke;
  v7[3] = &unk_1E5EFF2F0;
  v7[4] = &v8;
  _NUIGridArrangement::positionSubsetCells((uint64_t)this, a2.location, a2.length, a3.location, a3.length, (uint64_t)v7, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  double v5 = v9[6];
  _Block_object_dispose(&v8, 8);
  return v5;
}

void sub_1AE6663A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)(a2 + 48);
  long long v3 = *(_OWORD *)(a2 + 64);
  *(__n128 *)(a1 + 48) = result;
  *(_OWORD *)(a1 + 64) = v3;
  return result;
}

void ___ZN19_NUIGridArrangement24unionFrameForSubsetCellsE8_NSRangeS0_6CGRect_block_invoke(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  v5.size.double height = a5;
  v5.size.CGFloat width = a4;
  v5.origin.CGFloat y = a3;
  v5.origin.CGFloat x = a2;
  *(CGRect *)(*(void *)(*(void *)(a1 + 32) + 8) + 48) = CGRectUnion(*(CGRect *)(*(void *)(*(void *)(a1 + 32) + 8)+ 48), v5);
}

double _NUIGridArrangement::frameForColumnsAndRows(_NUIGridArrangement *this, _NSRange a2, _NSRange a3, CGRect a4)
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  NSUInteger v10 = a2.length;
  NSUInteger v11 = a2.location;
  double v13 = 0.0;
  double v14 = 0.0;
  if ((uint64_t)a2.location >= 1)
  {
    long long v15 = (double *)((char *)this->columns.__begin_ + 8);
    NSUInteger v16 = a2.location;
    do
    {
      double v17 = *v15;
      v15 += 7;
      double v14 = v14 + v17;
      --v16;
    }
    while (v16);
  }
  if (a2.location)
  {
    begin = this->columns.__begin_;
    double v13 = 0.0;
    NSUInteger v19 = a2.location;
    do
    {
      double v20 = *(double *)begin;
      begin = (_NUIGridArrangementDimension *)((char *)begin + 56);
      double v13 = v13 + v20;
      --v19;
    }
    while (v19);
  }
  double MinX = CGRectGetMinX(a4);
  double v21 = 0.0;
  if ((uint64_t)location >= 1)
  {
    uint64_t v22 = (double *)((char *)this->rows.__begin_ + 8);
    NSUInteger v23 = location;
    do
    {
      double v24 = *v22;
      v22 += 7;
      double v21 = v21 + v24;
      --v23;
    }
    while (v23);
  }
  if (location)
  {
    uint64_t v25 = this->rows.__begin_;
    double v26 = 0.0;
    NSUInteger v27 = location;
    do
    {
      double v26 = v26 + *(double *)v25;
      if (this->baselineRelative) {
        double v26 = v26 - *((double *)v25 + 11) - *((double *)v25 + 5);
      }
      uint64_t v25 = (_NUIGridArrangementDimension *)((char *)v25 + 56);
      --v27;
    }
    while (v27);
  }
  v45.origin.CGFloat x = x;
  v45.origin.CGFloat y = y;
  v45.size.CGFloat width = width;
  v45.size.CGFloat height = height;
  CGRectGetMinY(v45);
  double v28 = 0.0;
  if (v11 < v11 + v10)
  {
    long long v29 = (double *)((char *)this->columns.__begin_ + 56 * v11 + 8);
    NSUInteger v30 = v10;
    do
    {
      double v31 = *v29;
      v29 += 7;
      double v28 = v28 + v31;
      --v30;
    }
    while (v30);
  }
  if (v11 < v10 + v11 - 1)
  {
    NSUInteger v32 = v10 - 1;
    unint64_t v33 = (double *)((char *)this->columns.__begin_ + 56 * v11);
    double v34 = 0.0;
    do
    {
      double v35 = *v33;
      v33 += 7;
      double v34 = v34 + v35;
      --v32;
    }
    while (v32);
  }
  double v36 = 0.0;
  if (location < location + length)
  {
    double v37 = (double *)((char *)this->rows.__begin_ + 56 * location + 8);
    NSUInteger v38 = length;
    do
    {
      double v39 = *v37;
      v37 += 7;
      double v36 = v36 + v39;
      --v38;
    }
    while (v38);
  }
  if (location < length + location - 1)
  {
    long long v40 = (double *)((char *)this->rows.__begin_ + 56 * location);
    NSUInteger v41 = length - 1;
    double v42 = 0.0;
    do
    {
      double v42 = v42 + *v40;
      if (this->baselineRelative) {
        double v42 = v42 - v40[11] - v40[5];
      }
      v40 += 7;
      --v41;
    }
    while (v41);
  }
  return v14 + v13 + MinX;
}

uint64_t _NUIGridArrangement::enumerateCells(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(long long **)(result + 16);
  for (i = *(long long **)(result + 24); v2 != i; v2 += 7)
  {
    long long v5 = *v2;
    long long v6 = v2[2];
    v10[1] = v2[1];
    CGSize v10[2] = v6;
    v10[0] = v5;
    long long v7 = v2[3];
    long long v8 = v2[4];
    long long v9 = v2[6];
    v10[5] = v2[5];
    v10[6] = v9;
    v10[3] = v7;
    v10[4] = v8;
    __n128 result = (*(uint64_t (**)(uint64_t, _OWORD *))(a2 + 16))(a2, v10);
  }
  return result;
}

void *_NUIGridArrangementCell::debugDictionary(_NUIGridArrangementCell *this)
{
  v23[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithObject:*(void *)this forKey:@"item"];
  if (*((double *)this + 3) != *MEMORY[0x1E4F1DB30] || *((double *)this + 4) != *(double *)(MEMORY[0x1E4F1DB30] + 8)) {
    objc_msgSend(v2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F29238], "value:withObjCType:", (char *)this + 24, "{CGSize=dd}"), @"size");
  }
  v16[0] = @"column";
  uint64_t v4 = *((void *)this + 7);
  if (*((void *)this + 8) < 2uLL) {
    uint64_t v5 = [NSNumber numberWithUnsignedInteger:v4];
  }
  else {
    uint64_t v5 = [MEMORY[0x1E4F29238] valueWithRange:v4];
  }
  v16[1] = @"row";
  v17[0] = v5;
  uint64_t v6 = *((void *)this + 9);
  if (*((void *)this + 10) < 2uLL) {
    uint64_t v7 = [NSNumber numberWithUnsignedInteger:v6];
  }
  else {
    uint64_t v7 = [MEMORY[0x1E4F29238] valueWithRange:v6];
  }
  v17[1] = v7;
  objc_msgSend(v2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v17, v16, 2), @"span");
  double v8 = *((double *)this + 11);
  double v9 = *((double *)this + 12);
  if (v8 == 0.0 || v8 == 2.22507386e-308)
  {
    if (v9 == 0.0 || v9 == 2.22507386e-308) {
      return v2;
    }
    uint64_t v18 = @"bottomOffset";
    uint64_t v19 = objc_msgSend(NSNumber, "numberWithDouble:", v9, 2.22507386e-308);
    NSUInteger v10 = (void *)MEMORY[0x1E4F1C9E8];
    NSUInteger v11 = &v19;
    uint64_t v12 = &v18;
  }
  else
  {
    if (v9 != 0.0 && v9 != 2.22507386e-308)
    {
      v22[0] = @"topOffset";
      v23[0] = objc_msgSend(NSNumber, "numberWithDouble:");
      v22[1] = @"bottomOffset";
      v23[1] = [NSNumber numberWithDouble:v9];
      NSUInteger v10 = (void *)MEMORY[0x1E4F1C9E8];
      NSUInteger v11 = v23;
      uint64_t v12 = (__CFString **)v22;
      uint64_t v13 = 2;
      goto LABEL_22;
    }
    double v20 = @"topOffset";
    uint64_t v21 = objc_msgSend(NSNumber, "numberWithDouble:");
    NSUInteger v10 = (void *)MEMORY[0x1E4F1C9E8];
    NSUInteger v11 = &v21;
    uint64_t v12 = &v20;
  }
  uint64_t v13 = 1;
LABEL_22:
  uint64_t v14 = [v10 dictionaryWithObjects:v11 forKeys:v12 count:v13];
  if (v14) {
    [v2 setObject:v14 forKeyedSubscript:@"baselines"];
  }
  return v2;
}

void *_NUIGridArrangementDimension::debugDictionary(_NUIGridArrangementDimension *this)
{
  v20[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", *((unsigned __int16 *)this + 24)), @"index");
  objc_msgSend(v2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", *((double *)this + 1)), @"length");
  double v3 = *(double *)this;
  if (*(double *)this != 0.0) {
    objc_msgSend(v2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithDouble:", v3), @"spacingAfter");
  }
  v13[0] = @"hugging";
  LODWORD(v3) = *((_DWORD *)this + 7);
  v13[1] = @"compression";
  v14[0] = [NSNumber numberWithFloat:v3];
  LODWORD(v4) = *((_DWORD *)this + 6);
  v14[1] = [NSNumber numberWithFloat:v4];
  objc_msgSend(v2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v14, v13, 2), @"priorities");
  double v5 = *((double *)this + 4);
  double v6 = *((double *)this + 5);
  if (v5 == 0.0 || v5 == 2.22507386e-308)
  {
    if (v6 == 0.0 || v6 == 2.22507386e-308) {
      return v2;
    }
    long long v15 = @"bottomOffset";
    uint64_t v16 = objc_msgSend(NSNumber, "numberWithDouble:", v6, 2.22507386e-308);
    uint64_t v7 = (void *)MEMORY[0x1E4F1C9E8];
    double v8 = &v16;
    double v9 = &v15;
  }
  else
  {
    if (v6 != 0.0 && v6 != 2.22507386e-308)
    {
      v19[0] = @"topOffset";
      v20[0] = objc_msgSend(NSNumber, "numberWithDouble:");
      v19[1] = @"bottomOffset";
      v20[1] = [NSNumber numberWithDouble:v6];
      uint64_t v7 = (void *)MEMORY[0x1E4F1C9E8];
      double v8 = v20;
      double v9 = (__CFString **)v19;
      uint64_t v10 = 2;
      goto LABEL_13;
    }
    double v17 = @"topOffset";
    uint64_t v18 = objc_msgSend(NSNumber, "numberWithDouble:");
    uint64_t v7 = (void *)MEMORY[0x1E4F1C9E8];
    double v8 = &v18;
    double v9 = &v17;
  }
  uint64_t v10 = 1;
LABEL_13:
  uint64_t v11 = [v7 dictionaryWithObjects:v8 forKeys:v9 count:v10];
  if (v11) {
    [v2 setObject:v11 forKeyedSubscript:@"baselines"];
  }
  return v2;
}

void *_NUIGridArrangement::debugDictionary(_NUIGridArrangement *this)
{
  v18[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithObject:@"_NUIGridArrangement" forKey:@"class"];
  objc_msgSend(v2, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", this->baselineRelative), @"baselineRelative");
  v17[0] = @"horizontal";
  uint64_t v3 = *((char *)this + 8);
  if (NUIStringFromDistribution(NUIContainerDistribution)::onceToken != -1) {
    dispatch_once(&NUIStringFromDistribution(NUIContainerDistribution)::onceToken, &__block_literal_global_134);
  }
  uint64_t v4 = objc_msgSend((id)NUIStringFromDistribution(NUIContainerDistribution)::dict, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", v3));
  if (!v4) {
    uint64_t v4 = objc_msgSend(NSString, "stringWithFormat:", @"Unknown(%ld)", v3, v17[0]);
  }
  v17[1] = @"vertical";
  v18[0] = v4;
  uint64_t v5 = *((char *)this + 9);
  if (NUIStringFromDistribution(NUIContainerDistribution)::onceToken != -1) {
    dispatch_once(&NUIStringFromDistribution(NUIContainerDistribution)::onceToken, &__block_literal_global_134);
  }
  uint64_t v6 = objc_msgSend((id)NUIStringFromDistribution(NUIContainerDistribution)::dict, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", v5));
  if (!v6) {
    uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"Unknown(%ld)", v5);
  }
  v18[1] = v6;
  objc_msgSend(v2, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v18, v17, 2), @"distributions");
  if (this->cells.__end_ != this->cells.__begin_)
  {
    uint64_t v7 = (void *)[MEMORY[0x1E4F1CA48] array];
    begin = this->cells.__begin_;
    end = this->cells.__end_;
    while (begin != end)
    {
      [v7 addObject:_NUIGridArrangementCell::debugDictionary(begin)];
      begin = (_NUIGridArrangementCell *)((char *)begin + 112);
    }
    [v2 setObject:v7 forKeyedSubscript:@"cells"];
  }
  if (this->columns.__end_ != this->columns.__begin_)
  {
    uint64_t v10 = (void *)[MEMORY[0x1E4F1CA48] array];
    uint64_t v11 = this->columns.__begin_;
    uint64_t v12 = this->columns.__end_;
    while (v11 != v12)
    {
      [v10 addObject:_NUIGridArrangementDimension::debugDictionary(v11)];
      uint64_t v11 = (_NUIGridArrangementDimension *)((char *)v11 + 56);
    }
    [v2 setObject:v10 forKeyedSubscript:@"columns"];
  }
  if (this->rows.__end_ != this->rows.__begin_)
  {
    uint64_t v13 = (void *)[MEMORY[0x1E4F1CA48] array];
    long long v15 = this->rows.__begin_;
    uint64_t v14 = this->rows.__end_;
    while (v15 != v14)
    {
      [v13 addObject:_NUIGridArrangementDimension::debugDictionary(v15)];
      long long v15 = (_NUIGridArrangementDimension *)((char *)v15 + 56);
    }
    [v2 setObject:v13 forKeyedSubscript:@"rows"];
  }
  return v2;
}

os_log_t ___ZL21_NUIArrangementLoggerv_block_invoke()
{
  os_log_t result = os_log_create("com.apple.AppSupportUI", "arrangement");
  _NUIArrangementLogger(void)::_log = (uint64_t)result;
  return result;
}

__n128 __Block_byref_object_copy__122(__n128 *a1, __n128 *a2)
{
  __n128 result = a2[3];
  a1[3] = result;
  return result;
}

void *std::__insertion_sort_unguarded[abi:nn180100]<std::_ClassicAlgPolicy,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::{lambda(_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&)#1} &,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell*>(void *result, void *a2, unsigned __int8 *a3)
{
  if (result != a2)
  {
    uint64_t v3 = result + 3;
    if (result + 3 != a2)
    {
      int v4 = *a3;
      int v5 = a3[1];
      do
      {
        uint64_t v6 = result;
        __n128 result = v3;
        if (v4) {
          uint64_t v7 = 8;
        }
        else {
          uint64_t v7 = 12;
        }
        uint64_t v9 = v6[2];
        uint64_t v8 = v6[3];
        float v10 = *(float *)(v8 + v7) - *(float *)(*v6 + v7);
        uint64_t v11 = v6[5];
        uint64_t v12 = v11 - v9;
        if (v5)
        {
          BOOL v13 = v12 < 0;
          if (v10 != 0.0) {
            BOOL v13 = v10 > 0.0;
          }
          if (v13) {
            goto LABEL_15;
          }
        }
        else
        {
          BOOL v14 = v10 > 0.0;
          BOOL v15 = v12 < 0;
          if (v11 != v9) {
            BOOL v14 = v15;
          }
          if (v14)
          {
LABEL_15:
            uint64_t v16 = v6[4];
            do
            {
              while (1)
              {
                double v17 = v6;
                *(_OWORD *)(v6 + 3) = *(_OWORD *)v6;
                uint64_t v18 = v6[2];
                uint64_t v20 = *(v6 - 3);
                v6 -= 3;
                uint64_t v19 = v20;
                v17[5] = v18;
                int v4 = *a3;
                uint64_t v21 = *a3 ? 8 : 12;
                float v22 = *(float *)(v8 + v21) - *(float *)(v19 + v21);
                uint64_t v23 = *(v17 - 1);
                uint64_t v24 = v11 - v23;
                int v5 = a3[1];
                if (!a3[1]) {
                  break;
                }
                BOOL v25 = v24 < 0;
                if (v22 != 0.0) {
                  BOOL v25 = v22 > 0.0;
                }
                if (!v25) {
                  goto LABEL_28;
                }
              }
              BOOL v26 = v24 < 0;
              if (v11 == v23) {
                BOOL v27 = v22 > 0.0;
              }
              else {
                BOOL v27 = v26;
              }
            }
            while (v27);
LABEL_28:
            void *v17 = v8;
            v17[1] = v16;
            void v17[2] = v11;
            goto LABEL_30;
          }
          int v5 = 0;
        }
LABEL_30:
        uint64_t v3 = result + 3;
      }
      while (result + 3 != a2);
    }
  }
  return result;
}

void *std::__partition_with_equals_on_left[abi:nn180100]<std::_ClassicAlgPolicy,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell *,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::{lambda(_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&)#1} &>(uint64_t *a1, void *a2, unsigned char *a3)
{
  uint64_t v3 = *a1;
  uint64_t v4 = a1[2];
  uint64_t v5 = 8;
  if (!*a3) {
    uint64_t v5 = 12;
  }
  float v6 = *(float *)(v3 + v5);
  uint64_t v7 = *(a2 - 3);
  float v8 = v6 - *(float *)(v7 + v5);
  uint64_t v9 = *(a2 - 1);
  uint64_t v10 = v4 - v9;
  if (a3[1])
  {
    BOOL v11 = v10 < 0;
    if (v8 != 0.0) {
      BOOL v11 = v8 > 0.0;
    }
    if (v11) {
      goto LABEL_7;
    }
  }
  else
  {
    BOOL v22 = v10 < 0;
    if (v4 == v9) {
      BOOL v22 = v8 > 0.0;
    }
    if (v22)
    {
LABEL_7:
      uint64_t v12 = a1 + 3;
      do
      {
        while (1)
        {
          i = v12;
          uint64_t v14 = *v12;
          uint64_t v15 = *a3 ? 8 : 12;
          float v16 = v6 - *(float *)(v14 + v15);
          uint64_t v17 = i[2];
          uint64_t v18 = v4 - v17;
          uint64_t v12 = i + 3;
          if (a3[1]) {
            break;
          }
          BOOL v20 = v18 < 0;
          if (v4 == v17) {
            BOOL v21 = v16 > 0.0;
          }
          else {
            BOOL v21 = v20;
          }
          if (v21) {
            goto LABEL_38;
          }
        }
        BOOL v19 = v18 < 0;
        if (v16 != 0.0) {
          BOOL v19 = v16 > 0.0;
        }
      }
      while (!v19);
      goto LABEL_38;
    }
  }
  for (i = a1 + 3; i < a2; i += 3)
  {
    if (*a3) {
      uint64_t v23 = 8;
    }
    else {
      uint64_t v23 = 12;
    }
    float v24 = v6 - *(float *)(*i + v23);
    uint64_t v25 = i[2];
    uint64_t v26 = v4 - v25;
    if (a3[1])
    {
      BOOL v27 = v26 < 0;
      if (v24 != 0.0) {
        BOOL v27 = v24 > 0.0;
      }
      if (v27) {
        break;
      }
    }
    else
    {
      BOOL v28 = v26 < 0;
      if (v4 == v25) {
        BOOL v29 = v24 > 0.0;
      }
      else {
        BOOL v29 = v28;
      }
      if (v29) {
        break;
      }
    }
  }
LABEL_38:
  if (i < a2)
  {
    for (a2 -= 3; ; uint64_t v9 = a2[2])
    {
      if (*a3) {
        uint64_t v30 = 8;
      }
      else {
        uint64_t v30 = 12;
      }
      float v31 = v6 - *(float *)(v7 + v30);
      uint64_t v32 = v4 - v9;
      if (a3[1])
      {
        BOOL v33 = v32 < 0;
        if (v31 != 0.0) {
          BOOL v33 = v31 > 0.0;
        }
        if (!v33) {
          break;
        }
      }
      else
      {
        BOOL v34 = v32 < 0;
        if (v4 == v9) {
          BOOL v35 = v31 > 0.0;
        }
        else {
          BOOL v35 = v34;
        }
        if (!v35) {
          break;
        }
      }
      uint64_t v36 = *(a2 - 3);
      a2 -= 3;
      uint64_t v7 = v36;
    }
  }
  uint64_t v37 = a1[1];
  while (i < a2)
  {
    uint64_t v62 = i[2];
    long long v61 = *(_OWORD *)i;
    long long v38 = *(_OWORD *)a2;
    i[2] = a2[2];
    *(_OWORD *)i = v38;
    a2[2] = v62;
    *(_OWORD *)a2 = v61;
    if (*a3) {
      uint64_t v39 = 8;
    }
    else {
      uint64_t v39 = 12;
    }
    float v40 = *(float *)(v3 + v39);
    NSUInteger v41 = i + 3;
    do
    {
      while (1)
      {
        i = v41;
        uint64_t v42 = *v41;
        uint64_t v43 = *a3 ? 8 : 12;
        float v44 = v40 - *(float *)(v42 + v43);
        uint64_t v45 = i[2];
        uint64_t v46 = v4 - v45;
        NSUInteger v41 = i + 3;
        if (a3[1]) {
          break;
        }
        BOOL v48 = v46 < 0;
        if (v4 == v45) {
          BOOL v49 = v44 > 0.0;
        }
        else {
          BOOL v49 = v48;
        }
        if (v49) {
          goto LABEL_70;
        }
      }
      BOOL v47 = v46 < 0;
      if (v44 != 0.0) {
        BOOL v47 = v44 > 0.0;
      }
    }
    while (!v47);
LABEL_70:
    double v50 = a2 - 3;
    do
    {
      while (1)
      {
        a2 = v50;
        uint64_t v51 = *v50;
        uint64_t v52 = *a3 ? 8 : 12;
        float v53 = v40 - *(float *)(v51 + v52);
        uint64_t v54 = a2[2];
        uint64_t v55 = v4 - v54;
        double v50 = a2 - 3;
        if (a3[1]) {
          break;
        }
        BOOL v57 = v55 < 0;
        if (v4 == v54) {
          BOOL v58 = v53 > 0.0;
        }
        else {
          BOOL v58 = v57;
        }
        if (!v58) {
          goto LABEL_83;
        }
      }
      BOOL v56 = v55 < 0;
      if (v53 != 0.0) {
        BOOL v56 = v53 > 0.0;
      }
    }
    while (v56);
LABEL_83:
    ;
  }
  if (i - 3 != a1)
  {
    long long v59 = *(_OWORD *)(i - 3);
    a1[2] = *(i - 1);
    *(_OWORD *)a1 = v59;
  }
  *(i - 3) = v3;
  *(i - 2) = v37;
  *(i - 1) = v4;
  return i;
}

unint64_t std::__partition_with_equals_on_right[abi:nn180100]<std::_ClassicAlgPolicy,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell *,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::{lambda(_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&)#1} &>(uint64_t *a1, void *a2, unsigned char *a3)
{
  uint64_t v3 = 0;
  uint64_t v4 = *a1;
  uint64_t v5 = a1[1];
  uint64_t v6 = a1[2];
  if (*a3) {
    uint64_t v7 = 8;
  }
  else {
    uint64_t v7 = 12;
  }
  float v8 = *(float *)(v4 + v7);
  while (1)
  {
    uint64_t v9 = *a3 ? 8 : 12;
    float v10 = *(float *)(a1[v3 + 3] + v9) - v8;
    uint64_t v11 = a1[v3 + 5];
    uint64_t v12 = v11 - v6;
    if (a3[1]) {
      break;
    }
    BOOL v14 = v12 < 0;
    if (v11 == v6) {
      BOOL v15 = v10 > 0.0;
    }
    else {
      BOOL v15 = v14;
    }
    if (!v15) {
      goto LABEL_18;
    }
LABEL_17:
    v3 += 3;
  }
  BOOL v13 = v12 < 0;
  if (v10 != 0.0) {
    BOOL v13 = v10 > 0.0;
  }
  if (v13) {
    goto LABEL_17;
  }
LABEL_18:
  unint64_t v16 = (unint64_t)&a1[v3 + 3];
  if (v3 * 8)
  {
    uint64_t v17 = a2 - 3;
    do
    {
      while (1)
      {
        a2 = v17;
        uint64_t v18 = *v17;
        uint64_t v19 = *a3 ? 8 : 12;
        float v20 = *(float *)(v18 + v19) - v8;
        uint64_t v21 = a2[2];
        uint64_t v22 = v21 - v6;
        uint64_t v17 = a2 - 3;
        if (a3[1]) {
          break;
        }
        BOOL v24 = v22 < 0;
        if (v21 == v6) {
          BOOL v25 = v20 > 0.0;
        }
        else {
          BOOL v25 = v24;
        }
        if (v25) {
          goto LABEL_49;
        }
      }
      BOOL v23 = v22 < 0;
      if (v20 != 0.0) {
        BOOL v23 = v20 > 0.0;
      }
    }
    while (!v23);
  }
  else if (v16 < (unint64_t)a2)
  {
    for (a2 -= 3; ; a2 -= 3)
    {
      uint64_t v26 = *a3 ? 8 : 12;
      float v27 = *(float *)(*a2 + v26) - v8;
      uint64_t v28 = a2[2];
      uint64_t v29 = v28 - v6;
      if (a3[1])
      {
        int v30 = v29 >= 0;
        if (v27 != 0.0) {
          int v30 = v27 <= 0.0;
        }
      }
      else
      {
        BOOL v31 = v29 >= 0;
        int v30 = v28 == v6 ? v27 <= 0.0 : v31;
      }
      if (v30 != 1 || v16 >= (unint64_t)a2) {
        break;
      }
    }
  }
LABEL_49:
  if (v16 >= (unint64_t)a2)
  {
    unint64_t v33 = (unint64_t)&a1[v3 + 3];
  }
  else
  {
    unint64_t v33 = (unint64_t)&a1[v3 + 3];
    BOOL v34 = a2;
    do
    {
      uint64_t v59 = *(void *)(v33 + 16);
      long long v58 = *(_OWORD *)v33;
      long long v35 = *(_OWORD *)v34;
      *(void *)(v33 + 16) = v34[2];
      *(_OWORD *)unint64_t v33 = v35;
      v34[2] = v59;
      *(_OWORD *)BOOL v34 = v58;
      if (*a3) {
        uint64_t v36 = 8;
      }
      else {
        uint64_t v36 = 12;
      }
      float v37 = *(float *)(v4 + v36);
      long long v38 = (uint64_t *)(v33 + 24);
      do
      {
        while (1)
        {
          unint64_t v33 = (unint64_t)v38;
          uint64_t v39 = *v38;
          uint64_t v40 = *a3 ? 8 : 12;
          float v41 = *(float *)(v39 + v40) - v37;
          uint64_t v42 = *(void *)(v33 + 16);
          uint64_t v43 = v42 - v6;
          long long v38 = (uint64_t *)(v33 + 24);
          if (a3[1]) {
            break;
          }
          BOOL v45 = v43 < 0;
          if (v42 == v6) {
            BOOL v46 = v41 > 0.0;
          }
          else {
            BOOL v46 = v45;
          }
          if (!v46) {
            goto LABEL_67;
          }
        }
        BOOL v44 = v43 < 0;
        if (v41 != 0.0) {
          BOOL v44 = v41 > 0.0;
        }
      }
      while (v44);
LABEL_67:
      BOOL v47 = v34 - 3;
      do
      {
        while (1)
        {
          BOOL v34 = v47;
          uint64_t v48 = *v47;
          uint64_t v49 = *a3 ? 8 : 12;
          float v50 = *(float *)(v48 + v49) - v37;
          uint64_t v51 = v34[2];
          uint64_t v52 = v51 - v6;
          BOOL v47 = v34 - 3;
          if (a3[1]) {
            break;
          }
          BOOL v54 = v52 < 0;
          if (v51 == v6) {
            BOOL v55 = v50 > 0.0;
          }
          else {
            BOOL v55 = v54;
          }
          if (v55) {
            goto LABEL_80;
          }
        }
        BOOL v53 = v52 < 0;
        if (v50 != 0.0) {
          BOOL v53 = v50 > 0.0;
        }
      }
      while (!v53);
LABEL_80:
      ;
    }
    while (v33 < (unint64_t)v34);
  }
  if ((uint64_t *)(v33 - 24) != a1)
  {
    long long v56 = *(_OWORD *)(v33 - 24);
    a1[2] = *(void *)(v33 - 8);
    *(_OWORD *)a1 = v56;
  }
  *(void *)(v33 - 24) = v4;
  *(void *)(v33 - 16) = v5;
  *(void *)(v33 - 8) = v6;
  return v33 - 24;
}

BOOL std::__insertion_sort_incomplete[abi:nn180100]<std::_ClassicAlgPolicy,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::{lambda(_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&)#1} &,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell*>(void *a1, void *a2, unsigned char *a3)
{
  uint64_t v6 = a2 - a1;
  BOOL result = 1;
  switch(0xAAAAAAAAAAAAAAABLL * v6)
  {
    case 0uLL:
    case 1uLL:
      return result;
    case 2uLL:
      float v8 = a2 - 3;
      uint64_t v9 = 8;
      if (!*a3) {
        uint64_t v9 = 12;
      }
      float v10 = *(float *)(*(a2 - 3) + v9) - *(float *)(*a1 + v9);
      uint64_t v11 = *(a2 - 1);
      uint64_t v12 = a1[2];
      uint64_t v13 = v11 - v12;
      if (a3[1])
      {
        BOOL v14 = v13 < 0;
        if (v10 != 0.0) {
          BOOL v14 = v10 > 0.0;
        }
        if (v14)
        {
LABEL_52:
          uint64_t v40 = a1[2];
          long long v41 = *(_OWORD *)a1;
          uint64_t v42 = *(a2 - 1);
          *(_OWORD *)a1 = *v8;
          a1[2] = v42;
          *float v8 = v41;
          *(a2 - 1) = v40;
        }
      }
      else
      {
        BOOL v38 = v13 < 0;
        if (v11 == v12) {
          BOOL v39 = v10 > 0.0;
        }
        else {
          BOOL v39 = v38;
        }
        if (v39) {
          goto LABEL_52;
        }
      }
      return result;
    case 3uLL:
      std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::{lambda(_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&)#1} &,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell*>(a1, a1 + 3, a2 - 3, a3);
      return 1;
    case 4uLL:
      std::__sort4[abi:nn180100]<std::_ClassicAlgPolicy,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::{lambda(_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&)#1} &,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell*>(a1, a1 + 3, a1 + 6, a2 - 3, a3);
      return 1;
    case 5uLL:
      std::__sort5[abi:nn180100]<std::_ClassicAlgPolicy,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::{lambda(_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&)#1} &,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell*>(a1, a1 + 3, a1 + 6, a1 + 9, a2 - 3, a3);
      return 1;
    default:
      BOOL v15 = a1 + 6;
      std::__sort3[abi:nn180100]<std::_ClassicAlgPolicy,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::{lambda(_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&)#1} &,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell*>(a1, a1 + 3, a1 + 6, a3);
      unint64_t v16 = a1 + 9;
      if (a1 + 9 == a2) {
        return 1;
      }
      uint64_t v17 = 0;
      int v18 = 0;
      break;
  }
LABEL_11:
  uint64_t v19 = *v16;
  if (*a3) {
    uint64_t v20 = 8;
  }
  else {
    uint64_t v20 = 12;
  }
  float v21 = *(float *)(v19 + v20) - *(float *)(*v15 + v20);
  uint64_t v22 = v16[2];
  uint64_t v23 = v15[2];
  uint64_t v24 = v22 - v23;
  if (a3[1])
  {
    BOOL v25 = v24 < 0;
    if (v21 != 0.0) {
      BOOL v25 = v21 > 0.0;
    }
    if (!v25) {
      goto LABEL_41;
    }
  }
  else
  {
    BOOL v26 = v24 < 0;
    if (v22 == v23) {
      BOOL v27 = v21 > 0.0;
    }
    else {
      BOOL v27 = v26;
    }
    if (!v27) {
      goto LABEL_41;
    }
  }
  uint64_t v28 = v16[1];
  *(_OWORD *)unint64_t v16 = *(_OWORD *)v15;
  void v16[2] = v15[2];
  uint64_t v29 = a1;
  if (v15 == a1) {
    goto LABEL_40;
  }
  uint64_t v30 = v17;
  while (1)
  {
    if (*a3) {
      uint64_t v31 = 8;
    }
    else {
      uint64_t v31 = 12;
    }
    float v32 = *(float *)(v19 + v31) - *(float *)(*(void *)((char *)a1 + v30 + 24) + v31);
    uint64_t v33 = *(void *)((char *)a1 + v30 + 40);
    uint64_t v34 = v22 - v33;
    if (a3[1])
    {
      BOOL v35 = v34 < 0;
      if (v32 != 0.0) {
        BOOL v35 = v32 > 0.0;
      }
      if (!v35)
      {
        uint64_t v29 = v15;
        goto LABEL_40;
      }
    }
    else
    {
      BOOL v36 = v34 < 0;
      if (v22 == v33) {
        BOOL v37 = v32 > 0.0;
      }
      else {
        BOOL v37 = v36;
      }
      if (!v37)
      {
        uint64_t v29 = (void *)((char *)a1 + v30 + 48);
LABEL_40:
        *uint64_t v29 = v19;
        v29[1] = v28;
        v29[2] = v22;
        if (++v18 == 8) {
          return v16 + 3 == a2;
        }
LABEL_41:
        BOOL v15 = v16;
        v17 += 24;
        v16 += 3;
        if (v16 == a2) {
          return 1;
        }
        goto LABEL_11;
      }
    }
    v15 -= 3;
    *(_OWORD *)((char *)a1 + v30 + 48) = *(_OWORD *)((char *)a1 + v30 + 24);
    *(void *)((char *)a1 + v30 + 64) = *(void *)((char *)a1 + v30 + 40);
    v30 -= 24;
    if (v30 == -48)
    {
      uint64_t v29 = a1;
      goto LABEL_40;
    }
  }
}

uint64_t std::__sort5[abi:nn180100]<std::_ClassicAlgPolicy,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::{lambda(_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&)#1} &,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell*>(void *a1, void *a2, void *a3, void *a4, void *a5, unsigned char *a6)
{
  uint64_t result = std::__sort4[abi:nn180100]<std::_ClassicAlgPolicy,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::{lambda(_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&)#1} &,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell*>(a1, a2, a3, a4, a6);
  uint64_t v13 = 8;
  if (!*a6) {
    uint64_t v13 = 12;
  }
  float v14 = *(float *)(*a5 + v13) - *(float *)(*a4 + v13);
  uint64_t v15 = a5[2];
  uint64_t v16 = a4[2];
  uint64_t v17 = v15 - v16;
  if (!a6[1])
  {
    BOOL v19 = v17 < 0;
    if (v15 == v16) {
      BOOL v20 = v14 > 0.0;
    }
    else {
      BOOL v20 = v19;
    }
    if (!v20) {
      return result;
    }
LABEL_12:
    uint64_t v21 = a4[2];
    long long v22 = *(_OWORD *)a4;
    uint64_t v23 = a5[2];
    *(_OWORD *)a4 = *(_OWORD *)a5;
    a4[2] = v23;
    *(_OWORD *)a5 = v22;
    a5[2] = v21;
    uint64_t v24 = 8;
    if (!*a6) {
      uint64_t v24 = 12;
    }
    float v25 = *(float *)(*a4 + v24) - *(float *)(*a3 + v24);
    uint64_t v26 = a4[2];
    uint64_t v27 = a3[2];
    uint64_t v28 = v26 - v27;
    if (a6[1])
    {
      BOOL v29 = v28 < 0;
      if (v25 != 0.0) {
        BOOL v29 = v25 > 0.0;
      }
      if (!v29) {
        return result;
      }
    }
    else
    {
      BOOL v30 = v28 < 0;
      if (v26 == v27) {
        BOOL v31 = v25 > 0.0;
      }
      else {
        BOOL v31 = v30;
      }
      if (!v31) {
        return result;
      }
    }
    uint64_t v32 = a3[2];
    long long v33 = *(_OWORD *)a3;
    uint64_t v34 = a4[2];
    *(_OWORD *)a3 = *(_OWORD *)a4;
    a3[2] = v34;
    *(_OWORD *)a4 = v33;
    a4[2] = v32;
    uint64_t v35 = 8;
    if (!*a6) {
      uint64_t v35 = 12;
    }
    float v36 = *(float *)(*a3 + v35) - *(float *)(*a2 + v35);
    uint64_t v37 = a3[2];
    uint64_t v38 = a2[2];
    uint64_t v39 = v37 - v38;
    if (a6[1])
    {
      BOOL v40 = v39 < 0;
      if (v36 != 0.0) {
        BOOL v40 = v36 > 0.0;
      }
      if (!v40) {
        return result;
      }
    }
    else
    {
      BOOL v41 = v39 < 0;
      if (v37 == v38) {
        BOOL v42 = v36 > 0.0;
      }
      else {
        BOOL v42 = v41;
      }
      if (!v42) {
        return result;
      }
    }
    uint64_t v43 = a2[2];
    long long v44 = *(_OWORD *)a2;
    uint64_t v45 = a3[2];
    *(_OWORD *)a2 = *(_OWORD *)a3;
    a2[2] = v45;
    *(_OWORD *)a3 = v44;
    a3[2] = v43;
    uint64_t v46 = 8;
    if (!*a6) {
      uint64_t v46 = 12;
    }
    float v47 = *(float *)(*a2 + v46) - *(float *)(*a1 + v46);
    uint64_t v48 = a2[2];
    uint64_t v49 = a1[2];
    uint64_t v50 = v48 - v49;
    if (a6[1])
    {
      BOOL v51 = v50 < 0;
      if (v47 != 0.0) {
        BOOL v51 = v47 > 0.0;
      }
      if (!v51) {
        return result;
      }
    }
    else
    {
      BOOL v55 = v50 < 0;
      if (v48 == v49) {
        BOOL v56 = v47 > 0.0;
      }
      else {
        BOOL v56 = v55;
      }
      if (!v56) {
        return result;
      }
    }
    uint64_t v52 = a1[2];
    long long v53 = *(_OWORD *)a1;
    uint64_t v54 = a2[2];
    *(_OWORD *)a1 = *(_OWORD *)a2;
    a1[2] = v54;
    *(_OWORD *)a2 = v53;
    a2[2] = v52;
    return result;
  }
  BOOL v18 = v17 < 0;
  if (v14 != 0.0) {
    BOOL v18 = v14 > 0.0;
  }
  if (v18) {
    goto LABEL_12;
  }
  return result;
}

__n128 *std::__partial_sort_impl[abi:nn180100]<std::_ClassicAlgPolicy,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::{lambda(_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&)#1} &,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell*,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell*>(__n128 *a1, __n128 *a2, __n128 *a3, unsigned char *a4)
{
  if (a1 != a2)
  {
    uint64_t v8 = (char *)a2 - (char *)a1;
    uint64_t v9 = ((char *)a2 - (char *)a1) / 24;
    if ((char *)a2 - (char *)a1 >= 25)
    {
      unint64_t v10 = (unint64_t)(v9 - 2) >> 1;
      unint64_t v11 = v10 + 1;
      uint64_t v12 = (uint64_t *)a1 + 3 * v10;
      do
      {
        std::__sift_down[abi:nn180100]<std::_ClassicAlgPolicy,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::{lambda(_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&)#1} &,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell*>((uint64_t)a1, a4, v9, v12);
        v12 -= 3;
        --v11;
      }
      while (v11);
    }
    uint64_t v13 = a2;
    if (a2 != a3)
    {
      float v14 = a2;
      while (1)
      {
        if (*a4) {
          uint64_t v15 = 8;
        }
        else {
          uint64_t v15 = 12;
        }
        float v16 = *(float *)(v14->n128_u64[0] + v15) - *(float *)(a1->n128_u64[0] + v15);
        uint64_t v17 = v14[1].n128_i64[0];
        unint64_t v18 = a1[1].n128_u64[0];
        uint64_t v19 = v17 - v18;
        if (a4[1])
        {
          BOOL v20 = v19 < 0;
          if (v16 != 0.0) {
            BOOL v20 = v16 > 0.0;
          }
          if (!v20) {
            goto LABEL_15;
          }
        }
        else
        {
          BOOL v24 = v19 < 0;
          if (v17 == v18) {
            BOOL v25 = v16 > 0.0;
          }
          else {
            BOOL v25 = v24;
          }
          if (!v25) {
            goto LABEL_15;
          }
        }
        unint64_t v21 = v14[1].n128_u64[0];
        __n128 v22 = *v14;
        unint64_t v23 = a1[1].n128_u64[0];
        *float v14 = *a1;
        v14[1].n128_u64[0] = v23;
        *a1 = v22;
        a1[1].n128_u64[0] = v21;
        std::__sift_down[abi:nn180100]<std::_ClassicAlgPolicy,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::{lambda(_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&)#1} &,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell*>((uint64_t)a1, a4, v9, (uint64_t *)a1);
LABEL_15:
        float v14 = (__n128 *)((char *)v14 + 24);
        if (v14 == a3)
        {
          uint64_t v13 = a3;
          break;
        }
      }
    }
    if (v8 >= 25)
    {
      int64_t v26 = v8 / 0x18uLL;
      uint64_t v27 = (__n128 *)((char *)a2 - 24);
      do
      {
        __n128 v32 = *a1;
        unint64_t v33 = a1[1].n128_u64[0];
        std::__floyd_sift_down[abi:nn180100]<std::_ClassicAlgPolicy,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::{lambda(_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&)#1} &,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell*>(a1, a4, v26);
        if (v27 == v28)
        {
          *uint64_t v28 = v32;
          v28[1].n128_u64[0] = v33;
        }
        else
        {
          __n128 v29 = *v27;
          v28[1].n128_u64[0] = v27[1].n128_u64[0];
          *uint64_t v28 = v29;
          *uint64_t v27 = v32;
          v27[1].n128_u64[0] = v33;
          std::__sift_up[abi:nn180100]<std::_ClassicAlgPolicy,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::{lambda(_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&)#1} &,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell*>((uint64_t)a1, (uint64_t)&v28[1].n128_i64[1], a4, 0xAAAAAAAAAAAAAAABLL * ((&v28[1].n128_i8[8] - (__int8 *)a1) >> 3));
        }
        uint64_t v27 = (__n128 *)((char *)v27 - 24);
      }
      while (v26-- > 2);
    }
    return v13;
  }
  return a3;
}

uint64_t std::__sift_down[abi:nn180100]<std::_ClassicAlgPolicy,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::{lambda(_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&)#1} &,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell*>(uint64_t result, unsigned char *a2, uint64_t a3, uint64_t *a4)
{
  if (a3 < 2) {
    return result;
  }
  int64_t v4 = (unint64_t)(a3 - 2) >> 1;
  if (v4 < (uint64_t)(0xAAAAAAAAAAAAAAABLL * (((uint64_t)a4 - result) >> 3))) {
    return result;
  }
  uint64_t v5 = (0x5555555555555556 * (((uint64_t)a4 - result) >> 3)) | 1;
  uint64_t v6 = (void *)(result + 24 * v5);
  if (0x5555555555555556 * (((uint64_t)a4 - result) >> 3) + 2 >= a3)
  {
    int v12 = a2[1];
    goto LABEL_18;
  }
  uint64_t v7 = 8;
  if (!*a2) {
    uint64_t v7 = 12;
  }
  float v8 = *(float *)(*v6 + v7) - *(float *)(v6[3] + v7);
  uint64_t v9 = *(void *)(result + 24 * v5 + 16);
  uint64_t v10 = v6[5];
  uint64_t v11 = v9 - v10;
  int v12 = a2[1];
  if (a2[1])
  {
    BOOL v13 = v11 < 0;
    if (v8 != 0.0) {
      BOOL v13 = v8 > 0.0;
    }
    if (!v13)
    {
      int v12 = 1;
      goto LABEL_18;
    }
    goto LABEL_16;
  }
  BOOL v14 = v11 < 0;
  if (v9 == v10) {
    BOOL v15 = v8 > 0.0;
  }
  else {
    BOOL v15 = v14;
  }
  if (v15)
  {
LABEL_16:
    v6 += 3;
    uint64_t v5 = 0x5555555555555556 * (((uint64_t)a4 - result) >> 3) + 2;
    goto LABEL_18;
  }
  int v12 = 0;
LABEL_18:
  uint64_t v16 = 12;
  if (*a2) {
    uint64_t v16 = 8;
  }
  uint64_t v17 = *a4;
  float v18 = *(float *)(*v6 + v16) - *(float *)(*a4 + v16);
  uint64_t v19 = v6[2];
  uint64_t v20 = a4[2];
  uint64_t v21 = v19 - v20;
  if (v12)
  {
    BOOL v22 = v21 < 0;
    if (v18 != 0.0) {
      BOOL v22 = v18 > 0.0;
    }
    if (v22) {
      return result;
    }
  }
  else
  {
    BOOL v23 = v18 > 0.0;
    BOOL v24 = v21 < 0;
    if (v19 != v20) {
      BOOL v23 = v24;
    }
    if (v23) {
      return result;
    }
  }
  uint64_t v25 = a4[1];
  long long v26 = *(_OWORD *)v6;
  a4[2] = v6[2];
  *(_OWORD *)a4 = v26;
  if (v4 >= v5)
  {
    while (1)
    {
      uint64_t v28 = 2 * v5;
      uint64_t v5 = (2 * v5) | 1;
      uint64_t v27 = (void *)(result + 24 * v5);
      if (v28 + 2 >= a3) {
        goto LABEL_41;
      }
      if (*a2) {
        uint64_t v29 = 8;
      }
      else {
        uint64_t v29 = 12;
      }
      float v30 = *(float *)(*v27 + v29) - *(float *)(v27[3] + v29);
      uint64_t v31 = *(void *)(result + 24 * v5 + 16);
      uint64_t v32 = v27[5];
      uint64_t v33 = v31 - v32;
      if (a2[1])
      {
        BOOL v34 = v33 < 0;
        if (v30 != 0.0) {
          BOOL v34 = v30 > 0.0;
        }
        if (v34)
        {
LABEL_40:
          v27 += 3;
          uint64_t v5 = v28 + 2;
        }
      }
      else
      {
        BOOL v43 = v33 < 0;
        if (v31 == v32) {
          BOOL v44 = v30 > 0.0;
        }
        else {
          BOOL v44 = v43;
        }
        if (v44) {
          goto LABEL_40;
        }
      }
LABEL_41:
      if (*a2) {
        uint64_t v35 = 8;
      }
      else {
        uint64_t v35 = 12;
      }
      float v36 = *(float *)(*v27 + v35) - *(float *)(v17 + v35);
      uint64_t v37 = v27[2];
      uint64_t v38 = v37 - v20;
      if (a2[1])
      {
        BOOL v39 = v38 < 0;
        if (v36 != 0.0) {
          BOOL v39 = v36 > 0.0;
        }
        if (v39) {
          break;
        }
      }
      else
      {
        BOOL v40 = v36 > 0.0;
        BOOL v41 = v38 < 0;
        if (v37 != v20) {
          BOOL v40 = v41;
        }
        if (v40) {
          break;
        }
      }
      long long v42 = *(_OWORD *)v27;
      v6[2] = v27[2];
      *(_OWORD *)uint64_t v6 = v42;
      uint64_t v6 = v27;
      if (v4 < v5) {
        goto LABEL_30;
      }
    }
  }
  uint64_t v27 = v6;
LABEL_30:
  *uint64_t v27 = v17;
  v27[1] = v25;
  v27[2] = v20;
  return result;
}

__n128 std::__floyd_sift_down[abi:nn180100]<std::_ClassicAlgPolicy,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::{lambda(_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&)#1} &,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell*>(__n128 *a1, unsigned char *a2, uint64_t a3)
{
  uint64_t v3 = 0;
  uint64_t v4 = a3 - 2;
  if (a3 < 2) {
    uint64_t v4 = a3 - 1;
  }
  uint64_t v5 = v4 >> 1;
  do
  {
    uint64_t v6 = a1;
    uint64_t v7 = v3 + 1;
    a1 = (__n128 *)((char *)a1 + 24 * v3 + 24);
    uint64_t v8 = 2 * v3;
    uint64_t v3 = (2 * v3) | 1;
    uint64_t v9 = v8 + 2;
    if (v9 >= a3) {
      goto LABEL_13;
    }
    if (*a2) {
      uint64_t v10 = 8;
    }
    else {
      uint64_t v10 = 12;
    }
    float v11 = *(float *)(a1->n128_u64[0] + v10) - *(float *)(a1[1].n128_u64[1] + v10);
    unint64_t v12 = v6[1].n128_u64[3 * v7];
    unint64_t v13 = a1[2].n128_u64[1];
    uint64_t v14 = v12 - v13;
    if (a2[1])
    {
      BOOL v15 = v14 < 0;
      if (v11 != 0.0) {
        BOOL v15 = v11 > 0.0;
      }
      if (v15) {
        goto LABEL_12;
      }
    }
    else
    {
      BOOL v17 = v14 < 0;
      if (v12 == v13) {
        BOOL v18 = v11 > 0.0;
      }
      else {
        BOOL v18 = v17;
      }
      if (v18)
      {
LABEL_12:
        a1 = (__n128 *)((char *)a1 + 24);
        uint64_t v3 = v9;
      }
    }
LABEL_13:
    __n128 result = *a1;
    v6[1].n128_u64[0] = a1[1].n128_u64[0];
    *uint64_t v6 = result;
  }
  while (v3 <= v5);
  return result;
}

uint64_t std::__sift_up[abi:nn180100]<std::_ClassicAlgPolicy,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::{lambda(_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell const&)#1} &,_NUIGridArrangementHelper::enumerateCellRanges(std::vector<_NUIGridArrangementCell> &,BOOL,BOOL,void({block_pointer})(_NUIGridArrangementCell&,_NSRange))::_NUISortedCell*>(uint64_t result, uint64_t a2, unsigned char *a3, uint64_t a4)
{
  unint64_t v4 = a4 - 2;
  if (a4 < 2) {
    return result;
  }
  unint64_t v5 = v4 >> 1;
  uint64_t v6 = (void *)(result + 24 * (v4 >> 1));
  uint64_t v7 = *(void *)(a2 - 24);
  uint64_t v8 = 8;
  if (!*a3) {
    uint64_t v8 = 12;
  }
  float v9 = *(float *)(*v6 + v8) - *(float *)(v7 + v8);
  uint64_t v10 = v6[2];
  uint64_t v11 = *(void *)(a2 - 8);
  uint64_t v12 = v10 - v11;
  if (a3[1])
  {
    BOOL v13 = v12 < 0;
    if (v9 != 0.0) {
      BOOL v13 = v9 > 0.0;
    }
    if (!v13) {
      return result;
    }
  }
  else
  {
    BOOL v14 = v12 < 0;
    if (v10 == v11) {
      BOOL v15 = v9 > 0.0;
    }
    else {
      BOOL v15 = v14;
    }
    if (!v15) {
      return result;
    }
  }
  uint64_t v16 = *(void *)(a2 - 16);
  long long v17 = *(_OWORD *)v6;
  *(void *)(a2 - 8) = v6[2];
  *(_OWORD *)(a2 - 24) = v17;
  if (v4 >= 2)
  {
    while (1)
    {
      unint64_t v19 = v5 - 1;
      unint64_t v5 = (v5 - 1) >> 1;
      BOOL v18 = (void *)(result + 24 * v5);
      if (*a3) {
        uint64_t v20 = 8;
      }
      else {
        uint64_t v20 = 12;
      }
      float v21 = *(float *)(*v18 + v20) - *(float *)(v7 + v20);
      uint64_t v22 = v18[2];
      uint64_t v23 = v22 - v11;
      if (a3[1])
      {
        BOOL v24 = v23 < 0;
        if (v21 != 0.0) {
          BOOL v24 = v21 > 0.0;
        }
        if (!v24) {
          break;
        }
      }
      else
      {
        BOOL v25 = v23 < 0;
        if (v22 == v11) {
          BOOL v26 = v21 > 0.0;
        }
        else {
          BOOL v26 = v25;
        }
        if (!v26) {
          break;
        }
      }
      long long v27 = *(_OWORD *)v18;
      v6[2] = v18[2];
      *(_OWORD *)uint64_t v6 = v27;
      uint64_t v6 = (void *)(result + 24 * v5);
      if (v19 <= 1) {
        goto LABEL_28;
      }
    }
  }
  BOOL v18 = v6;
LABEL_28:
  *BOOL v18 = v7;
  v18[1] = v16;
  v18[2] = v11;
  return result;
}

uint64_t nui::stack_bitset::erase(unint64_t *a1, uint64_t a2, unint64_t a3)
{
  v4[0] = a2;
  v4[1] = a3;
  if (a3 < *a1)
  {
    *(void *)(a1[1] + ((a3 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= ~(1 << a3);
    nui::stack_bitset::iterator::operator++((uint64_t)v4);
    return v4[0];
  }
  return a2;
}

uint64_t ___ZL25NUIStringFromDistribution24NUIContainerDistribution_block_invoke()
{
  uint64_t result = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", @"Default", &unk_1F060D978, @"Fill", &unk_1F060D990, @"FillEqual", &unk_1F060D9A8, @"FillProp", &unk_1F060D9C0, @"EqualSpacing", &unk_1F060D9D8, @"EqualCentering", &unk_1F060D9F0, @"EqualGrouping", &unk_1F060DA08, @"StackLeading", &unk_1F060DA20, @"StackCenter",
             &unk_1F060DA38,
             @"StackTrailing",
             &unk_1F060DA50,
             0);
  NUIStringFromDistribution(NUIContainerDistribution)::dict = result;
  return result;
}

uint64_t _NUILog()
{
  if (_NUILog::onceToken != -1) {
    dispatch_once(&_NUILog::onceToken, &__block_literal_global_2);
  }
  return _NUILog::log;
}

double NUIContainerViewLengthMakeSystem(double a1)
{
  return a1 * -256.0 + -1048576.0;
}

void *__Block_byref_object_copy__0(void *result, void *a2)
{
  result[6] = a2[6];
  uint64_t v2 = a2 + 7;
  uint64_t v3 = a2[7];
  result[7] = v3;
  unint64_t v4 = result + 7;
  uint64_t v5 = a2[8];
  result[8] = v5;
  if (v5)
  {
    *(void *)(v3 + 16) = v4;
    a2[6] = v2;
    *uint64_t v2 = 0;
    a2[8] = 0;
  }
  else
  {
    result[6] = v4;
  }
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

uint64_t ___ZL22NUIStringFromAlignment21NUIContainerAlignment_block_invoke()
{
  uint64_t result = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", @"Default", &unk_1F060DA68, @"Fill", &unk_1F060DA80, @"Top/Lead", &unk_1F060DA98, @"FirstBL", &unk_1F060DAB0, @"Center", &unk_1F060DAC8, @"Bottom/Trail", &unk_1F060DAE0, @"LastBL", &unk_1F060DAF8, 0);
  NUIStringFromAlignment(NUIContainerAlignment)::dict = result;
  return result;
}

uint64_t *std::__tree<UIView *>::__emplace_unique_key_args<UIView *,UIView *&>(uint64_t **a1, unint64_t *a2, uint64_t *a3)
{
  uint64_t v6 = a1 + 1;
  uint64_t v5 = a1[1];
  if (v5)
  {
    unint64_t v7 = *a2;
    while (1)
    {
      while (1)
      {
        uint64_t v8 = (uint64_t **)v5;
        unint64_t v9 = v5[4];
        if (v7 >= v9) {
          break;
        }
        uint64_t v5 = *v8;
        uint64_t v6 = v8;
        if (!*v8) {
          goto LABEL_10;
        }
      }
      if (v9 >= v7) {
        break;
      }
      uint64_t v5 = v8[1];
      if (!v5)
      {
        uint64_t v6 = v8 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    uint64_t v8 = a1 + 1;
LABEL_10:
    uint64_t v10 = (uint64_t *)operator new(0x28uLL);
    v10[4] = *a3;
    std::__tree<UIView *>::__insert_node_at(a1, (uint64_t)v8, v6, v10);
    return v10;
  }
  return (uint64_t *)v8;
}

uint64_t *std::__tree<UIView *>::__remove_node_pointer(uint64_t **a1, uint64_t *a2)
{
  uint64_t v2 = (uint64_t *)a2[1];
  if (v2)
  {
    do
    {
      uint64_t v3 = v2;
      uint64_t v2 = (uint64_t *)*v2;
    }
    while (v2);
  }
  else
  {
    unint64_t v4 = a2;
    do
    {
      uint64_t v3 = (uint64_t *)v4[2];
      BOOL v5 = *v3 == (void)v4;
      unint64_t v4 = v3;
    }
    while (!v5);
  }
  if (*a1 == a2) {
    *a1 = v3;
  }
  uint64_t v6 = a1[1];
  a1[2] = (uint64_t *)((char *)a1[2] - 1);
  std::__tree_remove[abi:nn180100]<std::__tree_node_base<void *> *>(v6, a2);
  return v3;
}

uint64_t *std::__tree_remove[abi:nn180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  uint64_t v3 = a2;
  if (*a2)
  {
    unint64_t v4 = (uint64_t *)a2[1];
    if (!v4)
    {
      uint64_t v3 = a2;
      goto LABEL_7;
    }
    do
    {
      uint64_t v3 = v4;
      unint64_t v4 = (uint64_t *)*v4;
    }
    while (v4);
  }
  uint64_t v2 = v3[1];
  if (v2)
  {
LABEL_7:
    int v5 = 0;
    *(void *)(v2 + 16) = v3[2];
    goto LABEL_8;
  }
  int v5 = 1;
LABEL_8:
  uint64_t v6 = (uint64_t **)v3[2];
  unint64_t v7 = *v6;
  if (*v6 == v3)
  {
    *uint64_t v6 = (uint64_t *)v2;
    if (v3 == result)
    {
      unint64_t v7 = 0;
      uint64_t result = (uint64_t *)v2;
    }
    else
    {
      unint64_t v7 = v6[1];
    }
  }
  else
  {
    v6[1] = (uint64_t *)v2;
  }
  int v8 = *((unsigned __int8 *)v3 + 24);
  if (v3 != a2)
  {
    uint64_t v9 = a2[2];
    v3[2] = v9;
    *(void *)(v9 + 8 * (*(void *)a2[2] != (void)a2)) = v3;
    uint64_t v11 = *a2;
    uint64_t v10 = a2[1];
    *(void *)(v11 + 16) = v3;
    *uint64_t v3 = v11;
    v3[1] = v10;
    if (v10) {
      *(void *)(v10 + 16) = v3;
    }
    *((unsigned char *)v3 + 24) = *((unsigned char *)a2 + 24);
    if (result == a2) {
      uint64_t result = v3;
    }
  }
  if (!v8 || !result) {
    return result;
  }
  if (!v5)
  {
    *(unsigned char *)(v2 + 24) = 1;
    return result;
  }
  while (1)
  {
    uint64_t v12 = v7[2];
    if (*(uint64_t **)v12 == v7) {
      break;
    }
    if (!*((unsigned char *)v7 + 24))
    {
      *((unsigned char *)v7 + 24) = 1;
      *(unsigned char *)(v12 + 24) = 0;
      BOOL v13 = *(uint64_t **)(v12 + 8);
      uint64_t v14 = *v13;
      *(void *)(v12 + 8) = *v13;
      if (v14) {
        *(void *)(v14 + 16) = v12;
      }
      void v13[2] = *(void *)(v12 + 16);
      *(void *)(*(void *)(v12 + 16) + 8 * (**(void **)(v12 + 16) != v12)) = v13;
      *BOOL v13 = v12;
      *(void *)(v12 + 16) = v13;
      if (result == (uint64_t *)*v7) {
        uint64_t result = v7;
      }
      unint64_t v7 = *(uint64_t **)(*v7 + 8);
    }
    BOOL v15 = (void *)*v7;
    if (*v7 && !*((unsigned char *)v15 + 24))
    {
      uint64_t v16 = (uint64_t *)v7[1];
      if (!v16) {
        goto LABEL_56;
      }
LABEL_55:
      if (*((unsigned char *)v16 + 24))
      {
LABEL_56:
        *((unsigned char *)v15 + 24) = 1;
        *((unsigned char *)v7 + 24) = 0;
        uint64_t v22 = v15[1];
        *unint64_t v7 = v22;
        if (v22) {
          *(void *)(v22 + 16) = v7;
        }
        v15[2] = v7[2];
        *(void *)(v7[2] + 8 * (*(void *)v7[2] != (void)v7)) = v15;
        v15[1] = v7;
        v7[2] = (uint64_t)v15;
        uint64_t v16 = v7;
      }
      else
      {
        BOOL v15 = v7;
      }
      uint64_t v23 = v15[2];
      *((unsigned char *)v15 + 24) = *(unsigned char *)(v23 + 24);
      *(unsigned char *)(v23 + 24) = 1;
      *((unsigned char *)v16 + 24) = 1;
      BOOL v24 = *(uint64_t **)(v23 + 8);
      uint64_t v25 = *v24;
      *(void *)(v23 + 8) = *v24;
      if (v25) {
        *(void *)(v25 + 16) = v23;
      }
      v24[2] = *(void *)(v23 + 16);
      *(void *)(*(void *)(v23 + 16) + 8 * (**(void **)(v23 + 16) != v23)) = v24;
      *BOOL v24 = v23;
      goto LABEL_72;
    }
    uint64_t v16 = (uint64_t *)v7[1];
    if (v16 && !*((unsigned char *)v16 + 24)) {
      goto LABEL_55;
    }
    *((unsigned char *)v7 + 24) = 0;
    long long v17 = (uint64_t *)v7[2];
    if (v17 == result)
    {
      long long v17 = result;
LABEL_53:
      *((unsigned char *)v17 + 24) = 1;
      return result;
    }
    if (!*((unsigned char *)v17 + 24)) {
      goto LABEL_53;
    }
LABEL_49:
    unint64_t v7 = *(uint64_t **)(v17[2] + 8 * (*(void *)v17[2] == (void)v17));
  }
  if (!*((unsigned char *)v7 + 24))
  {
    *((unsigned char *)v7 + 24) = 1;
    *(unsigned char *)(v12 + 24) = 0;
    uint64_t v18 = v7[1];
    *(void *)uint64_t v12 = v18;
    if (v18) {
      *(void *)(v18 + 16) = v12;
    }
    v7[2] = *(void *)(v12 + 16);
    *(void *)(*(void *)(v12 + 16) + 8 * (**(void **)(v12 + 16) != v12)) = v7;
    v7[1] = v12;
    *(void *)(v12 + 16) = v7;
    if (result == (uint64_t *)v12) {
      uint64_t result = v7;
    }
    unint64_t v7 = *(uint64_t **)v12;
  }
  unint64_t v19 = (void *)*v7;
  if (*v7 && !*((unsigned char *)v19 + 24)) {
    goto LABEL_68;
  }
  uint64_t v20 = (uint64_t *)v7[1];
  if (!v20 || *((unsigned char *)v20 + 24))
  {
    *((unsigned char *)v7 + 24) = 0;
    long long v17 = (uint64_t *)v7[2];
    if (*((unsigned char *)v17 + 24)) {
      BOOL v21 = v17 == result;
    }
    else {
      BOOL v21 = 1;
    }
    if (v21) {
      goto LABEL_53;
    }
    goto LABEL_49;
  }
  if (v19 && !*((unsigned char *)v19 + 24))
  {
LABEL_68:
    uint64_t v20 = v7;
  }
  else
  {
    *((unsigned char *)v20 + 24) = 1;
    *((unsigned char *)v7 + 24) = 0;
    uint64_t v26 = *v20;
    v7[1] = *v20;
    if (v26) {
      *(void *)(v26 + 16) = v7;
    }
    v20[2] = v7[2];
    *(void *)(v7[2] + 8 * (*(void *)v7[2] != (void)v7)) = v20;
    *uint64_t v20 = (uint64_t)v7;
    v7[2] = (uint64_t)v20;
    unint64_t v19 = v7;
  }
  uint64_t v23 = v20[2];
  *((unsigned char *)v20 + 24) = *(unsigned char *)(v23 + 24);
  *(unsigned char *)(v23 + 24) = 1;
  *((unsigned char *)v19 + 24) = 1;
  BOOL v24 = *(uint64_t **)v23;
  uint64_t v27 = *(void *)(*(void *)v23 + 8);
  *(void *)uint64_t v23 = v27;
  if (v27) {
    *(void *)(v27 + 16) = v23;
  }
  v24[2] = *(void *)(v23 + 16);
  *(void *)(*(void *)(v23 + 16) + 8 * (**(void **)(v23 + 16) != v23)) = v24;
  v24[1] = v23;
LABEL_72:
  *(void *)(v23 + 16) = v24;
  return result;
}

void sub_1AE66C95C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, _NUIGridArrangement *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
}

void _NUIGridArrangement::~_NUIGridArrangement(_NUIGridArrangement *this)
{
  begin = this->viewFrames.__begin_;
  if (begin)
  {
    this->viewFrames.__end_ = begin;
    operator delete(begin);
  }
  uint64_t v3 = this->rows.__begin_;
  if (v3)
  {
    this->rows.__end_ = v3;
    operator delete(v3);
  }
  unint64_t v4 = this->columns.__begin_;
  if (v4)
  {
    this->columns.__end_ = v4;
    operator delete(v4);
  }
  int v5 = this->cells.__begin_;
  if (v5)
  {
    this->cells.__end_ = v5;
    operator delete(v5);
  }
}

__n128 __Block_byref_object_copy__1(__n128 *a1, __n128 *a2)
{
  __n128 result = a2[3];
  a1[3] = result;
  return result;
}

uint64_t ___ZL22NUIStringFromAlignment21NUIContainerAlignment_block_invoke_0()
{
  uint64_t result = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", @"Default", &unk_1F060DB10, @"Fill", &unk_1F060DB28, @"Top/Lead", &unk_1F060DB40, @"FirstBL", &unk_1F060DB58, @"Center", &unk_1F060DB70, @"Bottom/Trail", &unk_1F060DB88, @"LastBL", &unk_1F060DBA0, 0);
  NUIStringFromAlignment(NUIContainerAlignment)::dict = result;
  return result;
}

void *std::vector<_NUIGridArrangementCell>::__emplace_back_slow_path<UIView  {__kindof}*&,_NSRange,_NSRange,NUIContainerAlignment,NUIContainerAlignment>(void **a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, void *a5, void *a6)
{
  uint64_t v6 = (char *)*a1;
  uint64_t v7 = 0x6DB6DB6DB6DB6DB7 * (((unsigned char *)a1[1] - (unsigned char *)*a1) >> 4);
  unint64_t v8 = v7 + 1;
  if ((unint64_t)(v7 + 1) > 0x249249249249249) {
    abort();
  }
  uint64_t v16 = a1[2];
  uint64_t v15 = (uint64_t)(a1 + 2);
  unint64_t v17 = 0x6DB6DB6DB6DB6DB7 * ((v16 - v6) >> 4);
  if (2 * v17 > v8) {
    unint64_t v8 = 2 * v17;
  }
  if (v17 >= 0x124924924924924) {
    unint64_t v18 = 0x249249249249249;
  }
  else {
    unint64_t v18 = v8;
  }
  if (v18)
  {
    unint64_t v19 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<_NUIGridArrangementCell>>(v15, v18);
    uint64_t v21 = v20;
  }
  else
  {
    unint64_t v19 = 0;
    uint64_t v21 = 0;
  }
  _NUIGridArrangementCell::_NUIGridArrangementCell((uint64_t)&v19[112 * v7], *a2, *a3, a3[1], *a4, a4[1], *a5, *a6);
  uint64_t v23 = v22 + 112;
  uint64_t v25 = (char *)*a1;
  BOOL v24 = (char *)a1[1];
  if (v24 != *a1)
  {
    do
    {
      long long v26 = *((_OWORD *)v24 - 7);
      long long v27 = *((_OWORD *)v24 - 5);
      *((_OWORD *)v22 - 6) = *((_OWORD *)v24 - 6);
      *((_OWORD *)v22 - 5) = v27;
      *((_OWORD *)v22 - 7) = v26;
      long long v28 = *((_OWORD *)v24 - 4);
      long long v29 = *((_OWORD *)v24 - 3);
      long long v30 = *((_OWORD *)v24 - 1);
      *((_OWORD *)v22 - 2) = *((_OWORD *)v24 - 2);
      *((_OWORD *)v22 - 1) = v30;
      *((_OWORD *)v22 - 4) = v28;
      *((_OWORD *)v22 - 3) = v29;
      v22 -= 112;
      v24 -= 112;
    }
    while (v24 != v25);
    BOOL v24 = (char *)*a1;
  }
  *a1 = v22;
  a1[1] = v23;
  a1[2] = &v19[112 * v21];
  if (v24) {
    operator delete(v24);
  }
  return v23;
}

void sub_1AE66D6B4(_Unwind_Exception *exception_object)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZL25NUIStringFromDistribution24NUIContainerDistribution_block_invoke_0()
{
  uint64_t result = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", @"Default", &unk_1F060DBB8, @"Fill", &unk_1F060DBD0, @"FillEqual", &unk_1F060DBE8, @"FillProp", &unk_1F060DC00, @"EqualSpacing", &unk_1F060DC18, @"EqualCentering", &unk_1F060DC30, @"EqualGrouping", &unk_1F060DC48, @"StackLeading", &unk_1F060DC60, @"StackCenter",
             &unk_1F060DC78,
             @"StackTrailing",
             &unk_1F060DC90,
             0);
  NUIStringFromDistribution(NUIContainerDistribution)::dict = result;
  return result;
}

uint64_t ___ZL22NUIStringFromAlignment21NUIContainerAlignment_block_invoke_1()
{
  uint64_t result = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", @"Default", &unk_1F060DBB8, @"Fill", &unk_1F060DBD0, @"Top/Lead", &unk_1F060DBE8, @"FirstBL", &unk_1F060DC00, @"Center", &unk_1F060DC18, @"Bottom/Trail", &unk_1F060DC30, @"LastBL", &unk_1F060DC48, 0);
  NUIStringFromAlignment(NUIContainerAlignment)::dict = result;
  return result;
}

uint64_t *std::__tree<std::__value_type<UIView *,double>,std::__map_value_compare<UIView *,std::__value_type<UIView *,double>,std::less<UIView *>,true>,std::allocator<std::__value_type<UIView *,double>>>::__emplace_unique_key_args<UIView *,std::piecewise_construct_t const&,std::tuple<UIView * const&>,std::tuple<>>(uint64_t **a1, unint64_t *a2, uint64_t a3, uint64_t **a4)
{
  uint64_t v7 = a1 + 1;
  uint64_t v6 = a1[1];
  if (v6)
  {
    unint64_t v8 = *a2;
    while (1)
    {
      while (1)
      {
        uint64_t v9 = (uint64_t **)v6;
        unint64_t v10 = v6[4];
        if (v8 >= v10) {
          break;
        }
        uint64_t v6 = *v9;
        uint64_t v7 = v9;
        if (!*v9) {
          goto LABEL_10;
        }
      }
      if (v10 >= v8) {
        break;
      }
      uint64_t v6 = v9[1];
      if (!v6)
      {
        uint64_t v7 = v9 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    uint64_t v9 = a1 + 1;
LABEL_10:
    uint64_t v11 = (uint64_t *)operator new(0x30uLL);
    v11[4] = **a4;
    v11[5] = 0;
    std::__tree<UIView *>::__insert_node_at(a1, (uint64_t)v9, v7, v11);
    return v11;
  }
  return (uint64_t *)v9;
}

void std::vector<_NUIBoxArrangementCell>::emplace_back<objc_object  {objcproto18NUIArrangementItem}*&,NUIContainerAlignment &,NUIContainerAlignment>(void **a1, uint64_t *a2, void *a3, void *a4)
{
  unint64_t v10 = a1[2];
  uint64_t v8 = (uint64_t)(a1 + 2);
  uint64_t v9 = v10;
  unint64_t v11 = *(void *)(v8 - 8);
  if (v11 >= (unint64_t)v10)
  {
    uint64_t v13 = (uint64_t)(v11 - (void)*a1) >> 6;
    if ((unint64_t)(v13 + 1) >> 58) {
      abort();
    }
    uint64_t v14 = v9 - (unsigned char *)*a1;
    uint64_t v15 = v14 >> 5;
    if (v14 >> 5 <= (unint64_t)(v13 + 1)) {
      uint64_t v15 = v13 + 1;
    }
    if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFC0) {
      unint64_t v16 = 0x3FFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v16 = v15;
    }
    if (v16)
    {
      unint64_t v17 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<_NUIFlowArrangementCell>>(v8, v16);
      uint64_t v19 = v18;
    }
    else
    {
      unint64_t v17 = 0;
      uint64_t v19 = 0;
    }
    _NUIFlowArrangementCell::_NUIFlowArrangementCell((uint64_t)&v17[64 * v13], *a2, *a3, *a4);
    uint64_t v12 = v20 + 64;
    uint64_t v22 = (char *)*a1;
    uint64_t v21 = (char *)a1[1];
    if (v21 != *a1)
    {
      do
      {
        long long v23 = *((_OWORD *)v21 - 4);
        long long v24 = *((_OWORD *)v21 - 3);
        long long v25 = *((_OWORD *)v21 - 1);
        *((_OWORD *)v20 - 2) = *((_OWORD *)v21 - 2);
        *((_OWORD *)v20 - 1) = v25;
        *((_OWORD *)v20 - 4) = v23;
        *((_OWORD *)v20 - 3) = v24;
        v20 -= 64;
        v21 -= 64;
      }
      while (v21 != v22);
      uint64_t v21 = (char *)*a1;
    }
    *a1 = v20;
    a1[1] = v12;
    a1[2] = &v17[64 * v19];
    if (v21) {
      operator delete(v21);
    }
  }
  else
  {
    _NUIFlowArrangementCell::_NUIFlowArrangementCell(*(void *)(v8 - 8), *a2, *a3, *a4);
    uint64_t v12 = (void *)(v11 + 64);
    a1[1] = (void *)(v11 + 64);
  }
  a1[1] = v12;
}

void sub_1AE66E6AC(_Unwind_Exception *exception_object)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

void _NUIBoxArrangement::_NUIBoxArrangement(_NUIBoxArrangement *this)
{
  this->cells.__begin_ = 0;
  this->cells.__end_ = 0;
  this->cells.__end_cap_.__value_ = 0;
  this->viewFrames.__end_ = 0;
  this->viewFrames.__end_cap_.__value_ = 0;
  this->viewFrames.__begin_ = 0;
  this->horzDist = 0;
  this->vertDist = 0;
  this->container = 0;
}

_NUIBoxArrangement *_NUIBoxArrangement::resetForInvalidation(_NUIBoxArrangement *this, char a2)
{
  if ((a2 & 5) != 0)
  {
    this->cells.__end_ = this->cells.__begin_;
  }
  else
  {
    begin = this->cells.__begin_;
    end = this->cells.__end_;
    if (begin != end)
    {
      unint64_t v4 = (_OWORD *)MEMORY[0x1E4F1DB30];
      do
      {
        *(_OWORD *)((char *)begin + 8) = *v4;
        *(_OWORD *)((char *)begin + 24) = *v4;
        *((void *)begin + 5) = 0;
        *((void *)begin + 6) = 0;
        begin = (_NUIBoxArrangementCell *)((char *)begin + 64);
      }
      while (begin != end);
    }
  }
  this->viewFrames.__end_ = this->viewFrames.__begin_;
  this->hasValidMeasurement = 0;
  return this;
}

double _NUIBoxArrangement::measureCells(_NUIBoxArrangement *this, CGSize a2)
{
  double height = a2.height;
  double width = a2.width;
  begin = this->cells.__begin_;
  end = this->cells.__end_;
  p_cells = &this->cells;
  if (end == begin)
  {
    uint64_t v7 = MEMORY[0x1E4F1DB30];
    this->measureSize = (CGSize)*MEMORY[0x1E4F1DB30];
    [(_NUIBoxArrangementContainer *)this->container populateBoxArrangementCells:p_cells];
    begin = this->cells.__begin_;
    end = this->cells.__end_;
    if (end == begin) {
      return *(double *)v7;
    }
  }
  this->maxBaseLinePair.double baseLineFromTop = 0.0;
  this->maxBaseLinePair.double baseLineFromBottom = 0.0;
  for (i = &this->maxBaseLinePair; begin != end; begin = (_NUIBoxArrangementCell *)((char *)begin + 64))
  {
    uint64_t v9 = *((char *)begin + 57);
    if (v9 == 5)
    {
      objc_msgSend(*(id *)begin, "effectiveBaselineOffsetFromContentBottom", p_cells);
      *((double *)begin + 6) = baseLineFromBottom;
      if (baseLineFromBottom != 2.22507386e-308)
      {
        if (this->maxBaseLinePair.baseLineFromBottom > baseLineFromBottom) {
          double baseLineFromBottom = this->maxBaseLinePair.baseLineFromBottom;
        }
        this->maxBaseLinePair.double baseLineFromBottom = baseLineFromBottom;
      }
    }
    else if (v9 == 2)
    {
      objc_msgSend(*(id *)begin, "effectiveFirstBaselineOffsetFromContentTop", p_cells);
      *((double *)begin + 5) = baseLineFromTop;
      if (baseLineFromTop != 2.22507386e-308)
      {
        if (i->baseLineFromTop > baseLineFromTop) {
          double baseLineFromTop = i->baseLineFromTop;
        }
        i->double baseLineFromTop = baseLineFromTop;
      }
    }
  }
  if (objc_opt_respondsToSelector()) {
    char v12 = [(_NUIBoxArrangementContainer *)this->container canCancelMeasurementForCompression];
  }
  else {
    char v12 = 0;
  }
  uint64_t v13 = this->cells.__begin_;
  uint64_t v14 = this->cells.__end_;
  if (v13 != v14)
  {
    double v15 = -0.0;
    unint64_t v16 = (double *)MEMORY[0x1E4F1DB30];
    double v17 = -0.0;
    while (1)
    {
      double v18 = *((double *)v13 + 5);
      double v19 = *((double *)v13 + 6);
      double v20 = this->maxBaseLinePair.baseLineFromTop - v18 + 0.0;
      if (v18 == 2.22507386e-308) {
        double v20 = 0.0;
      }
      double v21 = this->maxBaseLinePair.baseLineFromBottom - v19;
      if (v19 == 2.22507386e-308) {
        double v21 = -0.0;
      }
      double v22 = v20 + v21;
      double v23 = height - (v20 + v21);
      uint64_t v24 = *(void *)v13;
      container = this->container;
      if ((v12 & 1) == 0) {
        goto LABEL_31;
      }
      -[_NUIBoxArrangementContainer contentLayoutSizeFittingSize:forArrangedSubview:](container, "contentLayoutSizeFittingSize:forArrangedSubview:", *(void *)v13, 10000.0, 10000.0);
      *((double *)v13 + 1) = v26;
      *((double *)v13 + 2) = v27;
      if (v26 > width) {
        break;
      }
      if (v27 > v23)
      {
        long long v28 = this->container;
        uint64_t v29 = 1;
        goto LABEL_29;
      }
LABEL_32:
      double v30 = v22 + v27;
      if (v26 > v15) {
        double v15 = v26;
      }
      if (v30 > v17) {
        double v17 = v30;
      }
      uint64_t v13 = (_NUIBoxArrangementCell *)((char *)v13 + 64);
      if (v13 == v14) {
        goto LABEL_39;
      }
    }
    long long v28 = this->container;
    uint64_t v29 = 0;
LABEL_29:
    if ([(_NUIBoxArrangementContainer *)v28 shouldCancelMeasurementForCompressionInAxis:v29])return *v16; {
    uint64_t v24 = *(void *)v13;
    }
    container = this->container;
LABEL_31:
    -[_NUIBoxArrangementContainer contentLayoutSizeFittingSize:forArrangedSubview:](container, "contentLayoutSizeFittingSize:forArrangedSubview:", v24, width, v23);
    *((double *)v13 + 1) = v26;
    *((double *)v13 + 2) = v27;
    goto LABEL_32;
  }
  double v15 = -0.0;
LABEL_39:
  this->hasValidMeasurement = 1;
  return v15;
}

void _NUIBoxArrangement::positionCells(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6)
{
  if (*(unsigned char *)(a1 + 24))
  {
    uint64_t v8 = a1 + 72;
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    unint64_t v11 = (v9 - v10) >> 6;
    if (v11 != (uint64_t)(*(void *)(a1 + 80) - *(void *)(a1 + 72)) >> 5)
    {
      std::vector<CGRect>::resize(v8, v11);
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      long long v28 = ___ZN18_NUIBoxArrangement13positionCellsE6CGRectU13block_pointerFvPU29objcproto18NUIArrangementItem11objc_objectS0_E_block_invoke;
      uint64_t v29 = &__block_descriptor_72_e69_v24__0___NUIBoxArrangementCell___CGSize_dd__CGSize_dd____dd_b8b8_8Q16l;
      uint64_t v30 = a1;
      double v31 = a3;
      double v32 = a4;
      double v33 = a5;
      double v34 = a6;
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v16 = *(void *)(a1 + 40);
      if (v9 == v16)
      {
        uint64_t v10 = *(void *)(a1 + 32);
      }
      else
      {
        uint64_t v17 = 0;
        do
        {
          v28((uint64_t)v27, v9, v17++);
          v9 += 64;
        }
        while (v9 != v16);
        uint64_t v10 = *(void *)(a1 + 32);
        uint64_t v9 = *(void *)(a1 + 40);
      }
    }
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    double v23 = ___ZN18_NUIBoxArrangement13positionCellsE6CGRectU13block_pointerFvPU29objcproto18NUIArrangementItem11objc_objectS0_E_block_invoke_2;
    uint64_t v24 = &unk_1E5EFF508;
    uint64_t v25 = a2;
    uint64_t v26 = a1;
    if (v10 != v9)
    {
      uint64_t v21 = 0;
      do
      {
        v23((uint64_t)v22, v10, v21++);
        v10 += 64;
      }
      while (v10 != v9);
    }
  }
  else
  {
    int v18 = _NUIIsDebuggerAttached();
    double v19 = _NUILog();
    double v20 = v19;
    if (v18)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        _NUIBoxArrangement::positionCells((uint64_t *)a1, v20);
      }
    }
    else if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      _NUIBoxArrangement::positionCells((uint64_t *)a1, v20);
    }
  }
}

void ___ZN18_NUIBoxArrangement13positionCellsE6CGRectU13block_pointerFvPU29objcproto18NUIArrangementItem11objc_objectS0_E_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  CGFloat v7 = *(double *)(a1 + 40);
  CGFloat v6 = *(double *)(a1 + 48);
  double v9 = *(double *)(a1 + 56);
  double v8 = *(double *)(a1 + 64);
  uint64_t v10 = (uint64_t)*(__int16 *)(a2 + 56) >> 8;
  double v30 = *(double *)(v5 + 96);
  double v31 = *(double *)(v5 + 104);
  double v32 = *(double *)(a2 + 40);
  double v33 = *(double *)(a2 + 48);
  double MinX = *MEMORY[0x1E4F1DB28];
  double MinY = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  if (*(double *)(a2 + 8) >= v9) {
    double Width = *(double *)(a1 + 56);
  }
  else {
    double Width = *(double *)(a2 + 8);
  }
  if (*(double *)(a2 + 16) >= v8) {
    CGFloat v14 = *(double *)(a1 + 64);
  }
  else {
    CGFloat v14 = *(double *)(a2 + 16);
  }
  CGFloat v34 = v14;
  switch(*(_WORD *)(a2 + 56))
  {
    case 0u:
      double MinX = CGRectGetMinX(*(CGRect *)(a1 + 40));
      v36.origin.CGFloat x = v7;
      v36.origin.CGFloat y = v6;
      v36.size.double width = v9;
      v36.size.double height = v8;
      double Width = CGRectGetWidth(v36);
      break;
    case 1u:
    case 2u:
      double MinX = CGRectGetMinX(*(CGRect *)(a1 + 40));
      break;
    case 3u:
      double MidX = CGRectGetMidX(*(CGRect *)(a1 + 40));
      v37.origin.CGFloat x = MinX;
      v37.origin.CGFloat y = MinY;
      v37.size.double width = Width;
      v37.size.double height = v14;
      double MinX = MidX + CGRectGetWidth(v37) * -0.5;
      break;
    case 4u:
    case 5u:
      CGFloat MaxX = CGRectGetMaxX(*(CGRect *)(a1 + 40));
      v35.size.double height = v14;
      double v16 = MaxX;
      v35.origin.CGFloat x = MinX;
      v35.origin.CGFloat y = MinY;
      v35.size.double width = Width;
      double MinX = v16 - CGRectGetWidth(v35);
      break;
    default:
      break;
  }
  switch(v10)
  {
    case 0:
      v38.origin.CGFloat x = v7;
      v38.origin.CGFloat y = v6;
      v38.size.double width = v9;
      v38.size.double height = v8;
      double MinY = CGRectGetMinY(v38);
      v39.origin.CGFloat x = v7;
      v39.origin.CGFloat y = v6;
      v39.size.double width = v9;
      v39.size.double height = v8;
      double Height = CGRectGetHeight(v39);
      break;
    case 1:
      goto LABEL_16;
    case 2:
      if (v32 == 2.22507386e-308)
      {
LABEL_16:
        v41.origin.CGFloat x = v7;
        v41.origin.CGFloat y = v6;
        v41.size.double width = v9;
        v41.size.double height = v8;
        double MinY = CGRectGetMinY(v41);
      }
      else
      {
        v40.origin.CGFloat x = v7;
        v40.origin.CGFloat y = v6;
        v40.size.double width = v9;
        v40.size.double height = v8;
        double MinY = v30 + CGRectGetMinY(v40) - v32;
      }
      goto LABEL_17;
    case 3:
      v42.origin.CGFloat x = v7;
      v42.origin.CGFloat y = v6;
      v42.size.double width = v9;
      v42.size.double height = v8;
      CGFloat v18 = Width;
      double MidY = CGRectGetMidY(v42);
      v43.origin.CGFloat x = MinX;
      v43.origin.CGFloat y = MinY;
      v43.size.double width = v18;
      double Height = v34;
      v43.size.double height = v34;
      double MinY = MidY + CGRectGetHeight(v43) * -0.5;
      goto LABEL_22;
    case 4:
      goto LABEL_21;
    case 5:
      if (v33 == 2.22507386e-308)
      {
LABEL_21:
        v46.origin.CGFloat x = v7;
        v46.origin.CGFloat y = v6;
        v46.size.double width = v9;
        v46.size.double height = v8;
        CGFloat v18 = Width;
        double MaxY = CGRectGetMaxY(v46);
        v47.origin.CGFloat x = MinX;
        v47.origin.CGFloat y = MinY;
        v47.size.double width = v18;
        double Height = v34;
        v47.size.double height = v34;
        double MinY = MaxY - CGRectGetHeight(v47);
LABEL_22:
        double Width = v18;
      }
      else
      {
        v44.origin.CGFloat x = v7;
        v44.origin.CGFloat y = v6;
        v44.size.double width = v9;
        v44.size.double height = v8;
        CGFloat v20 = Width;
        double v21 = CGRectGetMaxY(v44);
        v45.origin.CGFloat x = MinX;
        v45.origin.CGFloat y = MinY;
        v45.size.double width = v20;
        double Height = v34;
        v45.size.double height = v34;
        double v22 = v21 - CGRectGetHeight(v45);
        double Width = v20;
        double MinY = v22 - (v31 - v33);
      }
      break;
    default:
LABEL_17:
      double Height = v34;
      break;
  }
  objc_msgSend(*(id *)v5, "layoutFrameForArrangedSubview:withProposedContentFrame:", *(void *)a2, MinX, MinY, Width, Height, *(void *)&MidX);
  uint64_t v24 = (void *)(*(void *)(v5 + 72) + 32 * a3);
  *uint64_t v24 = v25;
  v24[1] = v26;
  v24[2] = v27;
  v24[3] = v28;
}

uint64_t ___ZN18_NUIBoxArrangement13positionCellsE6CGRectU13block_pointerFvPU29objcproto18NUIArrangementItem11objc_objectS0_E_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = (double *)(*(void *)(*(void *)(a1 + 40) + 72) + 32 * a3);
  return (*(uint64_t (**)(double, double, double, double))(*(void *)(a1 + 32) + 16))(*v3, v3[1], v3[2], v3[3]);
}

void *_NUIBoxArrangement::debugDictionary(_NUIBoxArrangement *this)
{
  void v22[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithObject:@"_NUIBoxArrangement" forKey:@"class"];
  double baseLineFromTop = this->maxBaseLinePair.baseLineFromTop;
  double baseLineFromBottom = this->maxBaseLinePair.baseLineFromBottom;
  if (baseLineFromTop == 0.0 || baseLineFromTop == 2.22507386e-308)
  {
    if (baseLineFromBottom == 0.0 || baseLineFromBottom == 2.22507386e-308) {
      goto LABEL_20;
    }
    uint64_t v17 = @"bottomOffset";
    uint64_t v18 = [NSNumber numberWithDouble:baseLineFromBottom];
    double v8 = (void *)MEMORY[0x1E4F1C9E8];
    double v9 = &v18;
    uint64_t v10 = &v17;
  }
  else
  {
    if (baseLineFromBottom != 0.0 && baseLineFromBottom != 2.22507386e-308)
    {
      v21[0] = @"topOffset";
      v21[1] = @"bottomOffset";
      v22[0] = objc_msgSend(NSNumber, "numberWithDouble:");
      v22[1] = [NSNumber numberWithDouble:baseLineFromBottom];
      double v8 = (void *)MEMORY[0x1E4F1C9E8];
      double v9 = v22;
      uint64_t v10 = (__CFString **)v21;
      uint64_t v12 = 2;
      goto LABEL_18;
    }
    double v19 = @"topOffset";
    uint64_t v20 = objc_msgSend(NSNumber, "numberWithDouble:");
    double v8 = (void *)MEMORY[0x1E4F1C9E8];
    double v9 = &v20;
    uint64_t v10 = &v19;
  }
  uint64_t v12 = 1;
LABEL_18:
  uint64_t v2 = [v8 dictionaryWithObjects:v9 forKeys:v10 count:v12];
  if (v2) {
    [v3 setObject:v2 forKeyedSubscript:@"maxBaselines"];
  }
LABEL_20:
  if (this->cells.__end_ != this->cells.__begin_)
  {
    uint64_t v13 = objc_msgSend(MEMORY[0x1E4F1CA48], "array", v2);
    begin = this->cells.__begin_;
    end = this->cells.__end_;
    while (begin != end)
    {
      [v13 addObject:_NUIFlowArrangementCell::debugDictionary((_NUIFlowArrangementCell *)begin)];
      begin = (_NUIBoxArrangementCell *)((char *)begin + 64);
    }
    [v3 setObject:v13 forKeyedSubscript:@"cells"];
  }
  return v3;
}

void std::vector<_NUIFlowArrangementCell>::emplace_back<UIView *&,NUIContainerAlignment &,NUIContainerAlignment &>(void **a1, uint64_t *a2, void *a3, void *a4)
{
  uint64_t v10 = a1[2];
  uint64_t v8 = (uint64_t)(a1 + 2);
  double v9 = v10;
  unint64_t v11 = *(void *)(v8 - 8);
  if (v11 >= (unint64_t)v10)
  {
    uint64_t v13 = (uint64_t)(v11 - (void)*a1) >> 6;
    if ((unint64_t)(v13 + 1) >> 58) {
      abort();
    }
    uint64_t v14 = v9 - (unsigned char *)*a1;
    uint64_t v15 = v14 >> 5;
    if (v14 >> 5 <= (unint64_t)(v13 + 1)) {
      uint64_t v15 = v13 + 1;
    }
    if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFC0) {
      unint64_t v16 = 0x3FFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v16 = v15;
    }
    if (v16)
    {
      uint64_t v17 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<_NUIFlowArrangementCell>>(v8, v16);
      uint64_t v19 = v18;
    }
    else
    {
      uint64_t v17 = 0;
      uint64_t v19 = 0;
    }
    _NUIFlowArrangementCell::_NUIFlowArrangementCell((uint64_t)&v17[64 * v13], *a2, *a3, *a4);
    uint64_t v12 = v20 + 64;
    double v22 = (char *)*a1;
    double v21 = (char *)a1[1];
    if (v21 != *a1)
    {
      do
      {
        long long v23 = *((_OWORD *)v21 - 4);
        long long v24 = *((_OWORD *)v21 - 3);
        long long v25 = *((_OWORD *)v21 - 1);
        *((_OWORD *)v20 - 2) = *((_OWORD *)v21 - 2);
        *((_OWORD *)v20 - 1) = v25;
        *((_OWORD *)v20 - 4) = v23;
        *((_OWORD *)v20 - 3) = v24;
        v20 -= 64;
        v21 -= 64;
      }
      while (v21 != v22);
      double v21 = (char *)*a1;
    }
    *a1 = v20;
    a1[1] = v12;
    a1[2] = &v17[64 * v19];
    if (v21) {
      operator delete(v21);
    }
  }
  else
  {
    _NUIFlowArrangementCell::_NUIFlowArrangementCell(*(void *)(v8 - 8), *a2, *a3, *a4);
    uint64_t v12 = (void *)(v11 + 64);
    a1[1] = (void *)(v11 + 64);
  }
  a1[1] = v12;
}

void sub_1AE670108(_Unwind_Exception *exception_object)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZL22NUIStringFromAlignment21NUIContainerAlignment_block_invoke_2()
{
  uint64_t result = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", @"Default", &unk_1F060DCA8, @"Fill", &unk_1F060DCC0, @"Top/Lead", &unk_1F060DCD8, @"FirstBL", &unk_1F060DCF0, @"Center", &unk_1F060DD08, @"Bottom/Trail", &unk_1F060DD20, @"LastBL", &unk_1F060DD38, 0);
  NUIStringFromAlignment(NUIContainerAlignment)::dict = result;
  return result;
}

void std::vector<_NUIBoxArrangementCell>::emplace_back<UIView *&,NUIContainerAlignment &,NUIContainerAlignment &>(void **a1, uint64_t *a2, void *a3, void *a4)
{
  uint64_t v10 = a1[2];
  uint64_t v8 = (uint64_t)(a1 + 2);
  double v9 = v10;
  unint64_t v11 = *(void *)(v8 - 8);
  if (v11 >= (unint64_t)v10)
  {
    uint64_t v13 = (uint64_t)(v11 - (void)*a1) >> 6;
    if ((unint64_t)(v13 + 1) >> 58) {
      abort();
    }
    uint64_t v14 = v9 - (unsigned char *)*a1;
    uint64_t v15 = v14 >> 5;
    if (v14 >> 5 <= (unint64_t)(v13 + 1)) {
      uint64_t v15 = v13 + 1;
    }
    if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFC0) {
      unint64_t v16 = 0x3FFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v16 = v15;
    }
    if (v16)
    {
      uint64_t v17 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<_NUIFlowArrangementCell>>(v8, v16);
      uint64_t v19 = v18;
    }
    else
    {
      uint64_t v17 = 0;
      uint64_t v19 = 0;
    }
    _NUIFlowArrangementCell::_NUIFlowArrangementCell((uint64_t)&v17[64 * v13], *a2, *a3, *a4);
    uint64_t v12 = v20 + 64;
    double v22 = (char *)*a1;
    double v21 = (char *)a1[1];
    if (v21 != *a1)
    {
      do
      {
        long long v23 = *((_OWORD *)v21 - 4);
        long long v24 = *((_OWORD *)v21 - 3);
        long long v25 = *((_OWORD *)v21 - 1);
        *((_OWORD *)v20 - 2) = *((_OWORD *)v21 - 2);
        *((_OWORD *)v20 - 1) = v25;
        *((_OWORD *)v20 - 4) = v23;
        *((_OWORD *)v20 - 3) = v24;
        v20 -= 64;
        v21 -= 64;
      }
      while (v21 != v22);
      double v21 = (char *)*a1;
    }
    *a1 = v20;
    a1[1] = v12;
    a1[2] = &v17[64 * v19];
    if (v21) {
      operator delete(v21);
    }
  }
  else
  {
    _NUIFlowArrangementCell::_NUIFlowArrangementCell(*(void *)(v8 - 8), *a2, *a3, *a4);
    uint64_t v12 = (void *)(v11 + 64);
    a1[1] = (void *)(v11 + 64);
  }
  a1[1] = v12;
}

void sub_1AE6711C4(_Unwind_Exception *exception_object)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZL22NUIStringFromAlignment21NUIContainerAlignment_block_invoke_3()
{
  uint64_t result = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", @"Default", &unk_1F060DD50, @"Fill", &unk_1F060DD68, @"Top/Lead", &unk_1F060DD80, @"FirstBL", &unk_1F060DD98, @"Center", &unk_1F060DDB0, @"Bottom/Trail", &unk_1F060DDC8, @"LastBL", &unk_1F060DDE0, 0);
  NUIStringFromAlignment(NUIContainerAlignment)::dict = result;
  return result;
}

void sub_1AE67297C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AE672A44(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AE673120(_Unwind_Exception *a1)
{
  *(void *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void sub_1AE6733C8(_Unwind_Exception *exception_object)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

void *std::vector<_NUIGridArrangementCell>::__emplace_back_slow_path<objc_object  {objcproto18NUIArrangementItem}*&,_NSRange &,_NSRange,NUIContainerAlignment &,NUIContainerAlignment>(void **a1, uint64_t *a2, uint64_t *a3, uint64_t *a4, void *a5, void *a6)
{
  CGFloat v6 = (char *)*a1;
  uint64_t v7 = 0x6DB6DB6DB6DB6DB7 * (((unsigned char *)a1[1] - (unsigned char *)*a1) >> 4);
  unint64_t v8 = v7 + 1;
  if ((unint64_t)(v7 + 1) > 0x249249249249249) {
    abort();
  }
  unint64_t v16 = a1[2];
  uint64_t v15 = (uint64_t)(a1 + 2);
  unint64_t v17 = 0x6DB6DB6DB6DB6DB7 * ((v16 - v6) >> 4);
  if (2 * v17 > v8) {
    unint64_t v8 = 2 * v17;
  }
  if (v17 >= 0x124924924924924) {
    unint64_t v18 = 0x249249249249249;
  }
  else {
    unint64_t v18 = v8;
  }
  if (v18)
  {
    uint64_t v19 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<_NUIGridArrangementCell>>(v15, v18);
    uint64_t v21 = v20;
  }
  else
  {
    uint64_t v19 = 0;
    uint64_t v21 = 0;
  }
  _NUIGridArrangementCell::_NUIGridArrangementCell((uint64_t)&v19[112 * v7], *a2, *a3, a3[1], *a4, a4[1], *a5, *a6);
  long long v23 = v22 + 112;
  long long v25 = (char *)*a1;
  long long v24 = (char *)a1[1];
  if (v24 != *a1)
  {
    do
    {
      long long v26 = *((_OWORD *)v24 - 7);
      long long v27 = *((_OWORD *)v24 - 5);
      *((_OWORD *)v22 - 6) = *((_OWORD *)v24 - 6);
      *((_OWORD *)v22 - 5) = v27;
      *((_OWORD *)v22 - 7) = v26;
      long long v28 = *((_OWORD *)v24 - 4);
      long long v29 = *((_OWORD *)v24 - 3);
      long long v30 = *((_OWORD *)v24 - 1);
      *((_OWORD *)v22 - 2) = *((_OWORD *)v24 - 2);
      *((_OWORD *)v22 - 1) = v30;
      *((_OWORD *)v22 - 4) = v28;
      *((_OWORD *)v22 - 3) = v29;
      v22 -= 112;
      v24 -= 112;
    }
    while (v24 != v25);
    long long v24 = (char *)*a1;
  }
  *a1 = v22;
  a1[1] = v23;
  a1[2] = &v19[112 * v21];
  if (v24) {
    operator delete(v24);
  }
  return v23;
}

void sub_1AE6738D8(_Unwind_Exception *exception_object)
{
  if (v1) {
    operator delete(v1);
  }
  _Unwind_Resume(exception_object);
}

void _NUIFlowArrangement::_NUIFlowArrangement(void **a1, void **a2, uint64_t a3)
{
  uint64_t v5 = *a1;
  if (v5)
  {
    *(void *)(a3 + 88) = v5;
    operator delete(v5);
  }
  CGFloat v6 = *a2;
  if (*a2)
  {
    *(void *)(a3 + 64) = v6;
    operator delete(v6);
  }
}

void _NUIFlowArrangement::~_NUIFlowArrangement(void *a1)
{
  uint64_t v2 = (void *)a1[10];
  if (v2)
  {
    a1[11] = v2;
    operator delete(v2);
  }
  uint64_t v3 = (void *)a1[7];
  if (v3)
  {
    a1[8] = v3;
    operator delete(v3);
  }
}

void _NUIArrangementInvalidSize_cold_1(uint64_t a1, NSObject *a2, double a3, double a4)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v5 = 138412546;
  uint64_t v6 = a1;
  __int16 v7 = 2112;
  unint64_t v8 = NSStringFromCGSize(*(CGSize *)&a3);
  _os_log_error_impl(&dword_1AE653000, a2, OS_LOG_TYPE_ERROR, "An item %@ returned an invalid size %@. Break on _NUIArrangementInvalidSize to debug.", (uint8_t *)&v5, 0x16u);
}

void _NUIGridArrangement::positionSubsetCells(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1AE653000, a2, OS_LOG_TYPE_ERROR, "Grid arrangement does not have valid measurement for %@", (uint8_t *)&v3, 0xCu);
}

{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1AE653000, a2, OS_LOG_TYPE_DEBUG, "Grid arrangement does not have valid measurement for %@", (uint8_t *)&v3, 0xCu);
}

void _NUIBoxArrangement::positionCells(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1AE653000, a2, OS_LOG_TYPE_ERROR, "Box arrangement does not have valid measurement for %@", (uint8_t *)&v3, 0xCu);
}

{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1AE653000, a2, OS_LOG_TYPE_DEBUG, "Box arrangement does not have valid measurement for %@", (uint8_t *)&v3, 0xCu);
}

BOOL CATransform3DIsIdentity(CATransform3D *t)
{
  return MEMORY[0x1F40F4D08](t);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1F40DB248]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x1F40DB250]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  MEMORY[0x1F40DB268]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  MEMORY[0x1F40DB270]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x1F40DB280]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x1F40DB288]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x1F40DB298]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x1F40DB2A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x1F40DB2A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  MEMORY[0x1F40DB310]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v2;
  return result;
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x1F4102AF8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x1F4102B00]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD20](__b, *(void *)&__c, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1F4181718](object, key);
}

id objc_loadWeak(id *location)
{
  return (id)MEMORY[0x1F4181778](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1F40CD650]();
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1F40CE3C0](a1, *(void *)&a2, a3, a4, a5, a6);
}