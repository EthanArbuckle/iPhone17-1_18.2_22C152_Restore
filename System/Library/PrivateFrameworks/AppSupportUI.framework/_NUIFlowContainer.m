@interface _NUIFlowContainer
- (BOOL)canCancelMeasurementForCompression;
- (BOOL)shouldCancelMeasurementForCompressionInAxis:(int64_t)a3;
- (CGSize)contentLayoutSizeFittingSize:(CGSize)a3 forArrangedSubview:(id)a4;
- (id).cxx_construct;
- (uint64_t)canUseSimpleGrid;
- (uint64_t)initWithFlowArrangement:(uint64_t)result;
- (void)dealloc;
- (void)populateGridArrangementCells:(void *)a3;
- (void)populateGridArrangementDimension:(void *)a3 withCells:(const void *)a4 axis:(int64_t)a5;
@end

@implementation _NUIFlowContainer

- (uint64_t)initWithFlowArrangement:(uint64_t)result
{
  if (result)
  {
    result = [(id)result init];
    if (result)
    {
      *(void *)(result + 120) = a2;
      *(unsigned char *)(result + 17) = *(unsigned char *)(a2 + 9);
      *(void *)(result + 8) = result;
    }
  }
  return result;
}

- (uint64_t)canUseSimpleGrid
{
  if (result) {
    return (*(void *)(*(void *)(result + 120) + 16) != 0) & (objc_opt_respondsToSelector() ^ 1);
  }
  return result;
}

- (void)dealloc
{
  _NUIGridArrangement::resetForInvalidation(&self->_gridArrangement, -1);
  v3.receiver = self;
  v3.super_class = (Class)_NUIFlowContainer;
  [(_NUIFlowContainer *)&v3 dealloc];
}

- (CGSize)contentLayoutSizeFittingSize:(CGSize)a3 forArrangedSubview:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  if (-[_NUIFlowContainer canUseSimpleGrid]((uint64_t)self))
  {
    if ((id)+[_NUIFlowArrangementDummyItem sharedDummyItem]() == a4)
    {
      double v8 = *MEMORY[0x1E4F1DB30];
      double v9 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    }
    else
    {
      objc_msgSend(*(id *)self->_flowArrangement, "contentLayoutSizeFittingSize:forArrangedSubview:", a4, width, height);
    }
  }
  else
  {
    v10 = (_NUIGridArrangement *)((char *)a4 + 8);
    _NUIGridArrangement::resetForInvalidation(v10, 0);
    v11.double width = width;
    v11.double height = height;
    _NUIGridArrangement::measureCells(v10, 0, v11);
  }
  result.double height = v9;
  result.double width = v8;
  return result;
}

- (void)populateGridArrangementCells:(void *)a3
{
  int v5 = -[_NUIFlowContainer canUseSimpleGrid]((uint64_t)self);
  flowArrangement = self->_flowArrangement;
  if (v5)
  {
    unint64_t v7 = *((void *)flowArrangement + 2);
    double v8 = (uint64_t *)*((void *)flowArrangement + 7);
    double v9 = (uint64_t *)*((void *)flowArrangement + 8);
    if (v8 == v9)
    {
      unint64_t v10 = 0;
    }
    else
    {
      unint64_t v10 = 0;
      CGSize v11 = *(void **)flowArrangement;
      do
      {
        uint64_t v30 = *v8;
        *(void *)&long long v29 = v10 % v7;
        *((void *)&v29 + 1) = 1;
        uint64_t v27 = v10 / v7;
        uint64_t v28 = 1;
        uint64_t v26 = [v11 alignmentForCell:v8 inAxis:0];
        uint64_t v12 = [v11 alignmentForCell:v8 inAxis:1];
        uint64_t v25 = v12;
        unint64_t v13 = *((void *)a3 + 1);
        if (v13 >= *((void *)a3 + 2))
        {
          v14 = std::vector<_NUIGridArrangementCell>::__emplace_back_slow_path<objc_object  {objcproto18NUIArrangementItem}*,_NSRange,objc_object  {objcproto18NUIArrangementItem}*,NUIContainerAlignment,_NSRange>((void **)a3, &v30, (uint64_t *)&v29, &v27, &v26, &v25);
        }
        else
        {
          _NUIGridArrangementCell::_NUIGridArrangementCell(*((void *)a3 + 1), v30, v29, *((uint64_t *)&v29 + 1), v27, v28, v26, v12);
          v14 = (void *)(v13 + 112);
          *((void *)a3 + 1) = v13 + 112;
        }
        *((void *)a3 + 1) = v14;
        ++v10;
        v8 += 8;
      }
      while (v8 != v9);
    }
    uint64_t v19 = v10 / v7;
    uint64_t v20 = v10 % v7;
    uint64_t v21 = (v7 - v10 % v7) % v7;
    if (v21)
    {
      uint64_t v22 = +[_NUIFlowArrangementDummyItem sharedDummyItem]();
      uint64_t v30 = v22;
      *(void *)&long long v29 = v10 % v7;
      *((void *)&v29 + 1) = (v7 - v10 % v7) % v7;
      uint64_t v27 = v10 / v7;
      uint64_t v28 = 1;
      uint64_t v25 = 0;
      uint64_t v26 = 0;
      unint64_t v23 = *((void *)a3 + 1);
      if (v23 >= *((void *)a3 + 2))
      {
        v24 = std::vector<_NUIGridArrangementCell>::__emplace_back_slow_path<_NUIFlowArrangementDummyItem *,_NSRange,_NSRange,NUIContainerAlignment,NUIContainerAlignment>((void **)a3, &v30, (uint64_t *)&v29, &v27, &v26, &v25);
      }
      else
      {
        _NUIGridArrangementCell::_NUIGridArrangementCell(*((void *)a3 + 1), v22, v20, v21, v19, 1, 0, 0);
        v24 = (void *)(v23 + 112);
        *((void *)a3 + 1) = v23 + 112;
      }
      *((void *)a3 + 1) = v24;
    }
  }
  else
  {
    v15 = (uint64_t *)*((void *)flowArrangement + 10);
    v16 = (uint64_t *)*((void *)flowArrangement + 11);
    if (v15 != v16)
    {
      uint64_t v17 = 0;
      v18 = (char *)*((void *)a3 + 1);
      do
      {
        long long v29 = xmmword_1AE675740;
        uint64_t v27 = v17;
        uint64_t v28 = 1;
        uint64_t v30 = 0;
        uint64_t v26 = 3;
        if ((unint64_t)v18 >= *((void *)a3 + 2))
        {
          v18 = (char *)std::vector<_NUIGridArrangementCell>::__emplace_back_slow_path<_NUIFlowRowContainer * const&,_NSRange,_NSRange,NUIContainerAlignment,NUIContainerAlignment>((void **)a3, v15, (uint64_t *)&v29, &v27, &v30, &v26);
        }
        else
        {
          std::vector<_NUIGridArrangementCell>::__construct_one_at_end[abi:nn180100]<_NUIFlowRowContainer * const&,_NSRange,_NSRange,NUIContainerAlignment,NUIContainerAlignment>((uint64_t)a3, v15, (uint64_t *)&v29, &v27, &v30, &v26);
          v18 += 112;
        }
        *((void *)a3 + 1) = v18;
        ++v17;
        ++v15;
      }
      while (v15 != v16);
    }
  }
}

- (void)populateGridArrangementDimension:(void *)a3 withCells:(const void *)a4 axis:(int64_t)a5
{
  double v8 = self;
  int v9 = -[_NUIFlowContainer canUseSimpleGrid]((uint64_t)self);
  v91 = v8;
  if (a5)
  {
    flowArrangement = v8->_flowArrangement;
    if (v9)
    {
      unint64_t v11 = flowArrangement[2];
      if (v11 <= v11 - 1 + 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*((void *)a4 + 1) - *(void *)a4) >> 4))
      {
        unint64_t v12 = 0;
        unint64_t v13 = (char *)a3 + 16;
        v14 = (_NUIGridArrangementDimension *)*((void *)a3 + 1);
        do
        {
          v15 = (double *)v8->_flowArrangement;
          if ((unint64_t)v14 >= *v13)
          {
            uint64_t v16 = 0x6DB6DB6DB6DB6DB7 * (((uint64_t)v14 - *(void *)a3) >> 3);
            unint64_t v17 = v16 + 1;
            if ((unint64_t)(v16 + 1) > 0x492492492492492) {
              goto LABEL_89;
            }
            if (0xDB6DB6DB6DB6DB6ELL * ((uint64_t)(*v13 - *(void *)a3) >> 3) > v17) {
              unint64_t v17 = 0xDB6DB6DB6DB6DB6ELL * ((uint64_t)(*v13 - *(void *)a3) >> 3);
            }
            if ((unint64_t)(0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*v13 - *(void *)a3) >> 3)) >= 0x249249249249249) {
              unint64_t v18 = 0x492492492492492;
            }
            else {
              unint64_t v18 = v17;
            }
            if (v18)
            {
              uint64_t v19 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<_NUIGridArrangementDimension>>((uint64_t)a3 + 16, v18);
              uint64_t v21 = v20;
            }
            else
            {
              uint64_t v19 = 0;
              uint64_t v21 = 0;
            }
            _NUIGridArrangementDimension::_NUIGridArrangementDimension((_NUIGridArrangementDimension *)&v19[56 * v16], v12, v15[5]);
            v24 = *(_NUIGridArrangementDimension **)a3;
            unint64_t v23 = (_NUIGridArrangementDimension *)*((void *)a3 + 1);
            double v8 = v91;
            uint64_t v25 = v22;
            if (v23 != *(_NUIGridArrangementDimension **)a3)
            {
              do
              {
                long long v26 = *(_OWORD *)((char *)v23 - 56);
                long long v27 = *(_OWORD *)((char *)v23 - 40);
                long long v28 = *(_OWORD *)((char *)v23 - 24);
                *(void *)(v25 - 8) = *((void *)v23 - 1);
                *(_OWORD *)(v25 - 24) = v28;
                *(_OWORD *)(v25 - 40) = v27;
                *(_OWORD *)(v25 - 56) = v26;
                v25 -= 56;
                unint64_t v23 = (_NUIGridArrangementDimension *)((char *)v23 - 56);
              }
              while (v23 != v24);
              unint64_t v23 = *(_NUIGridArrangementDimension **)a3;
            }
            long long v29 = &v19[56 * v21];
            v14 = (_NUIGridArrangementDimension *)(v22 + 56);
            *(void *)a3 = v25;
            *((void *)a3 + 1) = v22 + 56;
            *((void *)a3 + 2) = v29;
            if (v23) {
              operator delete(v23);
            }
          }
          else
          {
            _NUIGridArrangementDimension::_NUIGridArrangementDimension(v14, v12, v15[5]);
            v14 = (_NUIGridArrangementDimension *)((char *)v14 + 56);
            *((void *)a3 + 1) = v14;
          }
          *((void *)a3 + 1) = v14;
          ++v12;
        }
        while (v12 < (v11 - 1 + 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*((void *)a4 + 1) - *(void *)a4) >> 4)) / v11);
      }
    }
    else
    {
      uint64_t v49 = flowArrangement[10];
      uint64_t v50 = flowArrangement[11];
      if (v49 != v50)
      {
        __int16 v51 = 0;
        v52 = (char *)a3 + 16;
        v53 = (_NUIGridArrangementDimension *)*((void *)a3 + 1);
        do
        {
          v54 = (double *)v8->_flowArrangement;
          if ((unint64_t)v53 >= *v52)
          {
            uint64_t v55 = 0x6DB6DB6DB6DB6DB7 * (((uint64_t)v53 - *(void *)a3) >> 3);
            unint64_t v56 = v55 + 1;
            if ((unint64_t)(v55 + 1) > 0x492492492492492) {
              goto LABEL_89;
            }
            if (0xDB6DB6DB6DB6DB6ELL * ((uint64_t)(*v52 - *(void *)a3) >> 3) > v56) {
              unint64_t v56 = 0xDB6DB6DB6DB6DB6ELL * ((uint64_t)(*v52 - *(void *)a3) >> 3);
            }
            if ((unint64_t)(0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*v52 - *(void *)a3) >> 3)) >= 0x249249249249249) {
              unint64_t v57 = 0x492492492492492;
            }
            else {
              unint64_t v57 = v56;
            }
            if (v57)
            {
              v58 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<_NUIGridArrangementDimension>>((uint64_t)a3 + 16, v57);
              uint64_t v60 = v59;
            }
            else
            {
              v58 = 0;
              uint64_t v60 = 0;
            }
            _NUIGridArrangementDimension::_NUIGridArrangementDimension((_NUIGridArrangementDimension *)&v58[56 * v55], v51, v54[5]);
            v63 = *(_NUIGridArrangementDimension **)a3;
            v62 = (char *)*((void *)a3 + 1);
            double v8 = v91;
            uint64_t v64 = v61;
            if (v62 != *(char **)a3)
            {
              do
              {
                long long v65 = *(_OWORD *)(v62 - 56);
                long long v66 = *(_OWORD *)(v62 - 40);
                long long v67 = *(_OWORD *)(v62 - 24);
                *(void *)(v64 - 8) = *((void *)v62 - 1);
                *(_OWORD *)(v64 - 24) = v67;
                *(_OWORD *)(v64 - 40) = v66;
                *(_OWORD *)(v64 - 56) = v65;
                v64 -= 56;
                v62 -= 56;
              }
              while (v62 != (char *)v63);
              v62 = *(char **)a3;
            }
            v68 = &v58[56 * v60];
            v53 = (_NUIGridArrangementDimension *)(v61 + 56);
            *(void *)a3 = v64;
            *((void *)a3 + 1) = v61 + 56;
            *((void *)a3 + 2) = v68;
            if (v62) {
              operator delete(v62);
            }
          }
          else
          {
            _NUIGridArrangementDimension::_NUIGridArrangementDimension(v53, v51, v54[5]);
            v53 = (_NUIGridArrangementDimension *)((char *)v53 + 56);
            *((void *)a3 + 1) = v53;
          }
          *((void *)a3 + 1) = v53;
          ++v51;
          v49 += 8;
        }
        while (v49 != v50);
      }
    }
    v70 = *(_NUIGridArrangementDimension **)a3;
    v69 = (_NUIGridArrangementDimension *)*((void *)a3 + 1);
    if (*(_NUIGridArrangementDimension **)a3 != v69)
    {
      uint64_t v71 = *((void *)v8->_flowArrangement + 3);
      do
      {
        *(void *)v70 = v71;
        v70 = (_NUIGridArrangementDimension *)((char *)v70 + 56);
      }
      while (v70 != v69);
    }
    *((void *)v69 - 7) = 0;
  }
  else if (v9)
  {
    uint64_t v30 = *((void *)v8->_flowArrangement + 2);
    if (v30)
    {
      uint64_t v31 = 0;
      v32 = (char *)a3 + 16;
      v33 = (_NUIGridArrangementDimension *)*((void *)a3 + 1);
      do
      {
        v34 = (double *)v8->_flowArrangement;
        if ((unint64_t)v33 >= *v32)
        {
          uint64_t v35 = 0x6DB6DB6DB6DB6DB7 * (((uint64_t)v33 - *(void *)a3) >> 3);
          unint64_t v36 = v35 + 1;
          if ((unint64_t)(v35 + 1) > 0x492492492492492) {
            goto LABEL_89;
          }
          if (0xDB6DB6DB6DB6DB6ELL * ((uint64_t)(*v32 - *(void *)a3) >> 3) > v36) {
            unint64_t v36 = 0xDB6DB6DB6DB6DB6ELL * ((uint64_t)(*v32 - *(void *)a3) >> 3);
          }
          if ((unint64_t)(0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*v32 - *(void *)a3) >> 3)) >= 0x249249249249249) {
            unint64_t v37 = 0x492492492492492;
          }
          else {
            unint64_t v37 = v36;
          }
          if (v37)
          {
            v38 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<_NUIGridArrangementDimension>>((uint64_t)a3 + 16, v37);
            uint64_t v40 = v39;
          }
          else
          {
            v38 = 0;
            uint64_t v40 = 0;
          }
          _NUIGridArrangementDimension::_NUIGridArrangementDimension((_NUIGridArrangementDimension *)&v38[56 * v35], v31, v34[6]);
          v43 = *(_NUIGridArrangementDimension **)a3;
          v42 = (char *)*((void *)a3 + 1);
          uint64_t v44 = v41;
          if (v42 != *(char **)a3)
          {
            do
            {
              long long v45 = *(_OWORD *)(v42 - 56);
              long long v46 = *(_OWORD *)(v42 - 40);
              long long v47 = *(_OWORD *)(v42 - 24);
              *(void *)(v44 - 8) = *((void *)v42 - 1);
              *(_OWORD *)(v44 - 24) = v47;
              *(_OWORD *)(v44 - 40) = v46;
              *(_OWORD *)(v44 - 56) = v45;
              v44 -= 56;
              v42 -= 56;
            }
            while (v42 != (char *)v43);
            v42 = *(char **)a3;
          }
          v48 = &v38[56 * v40];
          v33 = (_NUIGridArrangementDimension *)(v41 + 56);
          *(void *)a3 = v44;
          *((void *)a3 + 1) = v41 + 56;
          *((void *)a3 + 2) = v48;
          if (v42) {
            operator delete(v42);
          }
        }
        else
        {
          _NUIGridArrangementDimension::_NUIGridArrangementDimension(v33, v31, v34[6]);
          v33 = (_NUIGridArrangementDimension *)((char *)v33 + 56);
          *((void *)a3 + 1) = v33;
        }
        *((void *)a3 + 1) = v33;
        ++v31;
      }
      while (v31 != v30);
    }
    else
    {
      v33 = (_NUIGridArrangementDimension *)*((void *)a3 + 1);
    }
    v82 = *(_NUIGridArrangementDimension **)a3;
    if (*(_NUIGridArrangementDimension **)a3 != v33)
    {
      uint64_t v83 = *((void *)v8->_flowArrangement + 4);
      do
      {
        *(void *)v82 = v83;
        v82 = (_NUIGridArrangementDimension *)((char *)v82 + 56);
      }
      while (v82 != v33);
    }
    *((void *)v33 - 7) = 0;
  }
  else
  {
    unint64_t v72 = *((void *)a3 + 2);
    unint64_t v73 = *((void *)a3 + 1);
    if (v73 >= v72)
    {
      uint64_t v75 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v73 - *(void *)a3) >> 3);
      if ((unint64_t)(v75 + 1) > 0x492492492492492) {
LABEL_89:
      }
        abort();
      unint64_t v76 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v72 - *(void *)a3) >> 3);
      uint64_t v77 = 2 * v76;
      if (2 * v76 <= v75 + 1) {
        uint64_t v77 = v75 + 1;
      }
      if (v76 >= 0x249249249249249) {
        unint64_t v78 = 0x492492492492492;
      }
      else {
        unint64_t v78 = v77;
      }
      if (v78)
      {
        v79 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<_NUIGridArrangementDimension>>((uint64_t)a3 + 16, v78);
        uint64_t v81 = v80;
      }
      else
      {
        v79 = 0;
        uint64_t v81 = 0;
      }
      _NUIGridArrangementDimension::_NUIGridArrangementDimension((_NUIGridArrangementDimension *)&v79[56 * v75], 0, 1.79769313e308);
      v85 = &v79[56 * v81];
      unint64_t v74 = v84 + 56;
      v87 = *(_NUIGridArrangementDimension **)a3;
      v86 = (char *)*((void *)a3 + 1);
      if (v86 != *(char **)a3)
      {
        do
        {
          long long v88 = *(_OWORD *)(v86 - 56);
          long long v89 = *(_OWORD *)(v86 - 40);
          long long v90 = *(_OWORD *)(v86 - 24);
          *(void *)(v84 - 8) = *((void *)v86 - 1);
          *(_OWORD *)(v84 - 24) = v90;
          *(_OWORD *)(v84 - 40) = v89;
          *(_OWORD *)(v84 - 56) = v88;
          v84 -= 56;
          v86 -= 56;
        }
        while (v86 != (char *)v87);
        v86 = *(char **)a3;
      }
      *(void *)a3 = v84;
      *((void *)a3 + 1) = v74;
      *((void *)a3 + 2) = v85;
      if (v86) {
        operator delete(v86);
      }
    }
    else
    {
      _NUIGridArrangementDimension::_NUIGridArrangementDimension(*((_NUIGridArrangementDimension **)a3 + 1), 0, 1.79769313e308);
      unint64_t v74 = v73 + 56;
      *((void *)a3 + 1) = v73 + 56;
    }
    *((void *)a3 + 1) = v74;
  }
}

- (BOOL)canCancelMeasurementForCompression
{
  return [*(id *)self->_flowArrangement canCancelMeasurementForCompression];
}

- (BOOL)shouldCancelMeasurementForCompressionInAxis:(int64_t)a3
{
  return [*(id *)self->_flowArrangement shouldCancelMeasurementForCompressionInAxis:a3];
}

- (void).cxx_destruct
{
  begin = self->_gridArrangement.viewFrames.__begin_;
  if (begin)
  {
    self->_gridArrangement.viewFrames.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->_gridArrangement.rows.__begin_;
  if (v4)
  {
    self->_gridArrangement.rows.__end_ = v4;
    operator delete(v4);
  }
  int v5 = self->_gridArrangement.columns.__begin_;
  if (v5)
  {
    self->_gridArrangement.columns.__end_ = v5;
    operator delete(v5);
  }
  v6 = self->_gridArrangement.cells.__begin_;
  if (v6)
  {
    self->_gridArrangement.cells.__end_ = v6;
    operator delete(v6);
  }
}

- (id).cxx_construct
{
  return self;
}

@end