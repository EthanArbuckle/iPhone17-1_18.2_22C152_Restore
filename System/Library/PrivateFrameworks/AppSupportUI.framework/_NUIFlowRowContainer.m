@interface _NUIFlowRowContainer
- (BOOL)isLayoutSizeDependentOnPerpendicularAxis;
- (CGRect)layoutFrameForArrangedSubview:(id)a3 withProposedContentFrame:(CGRect)a4;
- (CGSize)contentLayoutSizeFittingSize:(CGSize)a3 forArrangedSubview:(id)a4;
- (double)effectiveBaselineOffsetFromContentBottom;
- (double)effectiveFirstBaselineOffsetFromContentTop;
- (float)contentCompressionResistancePriorityForAxis:(int64_t)a3;
- (float)contentHuggingPriorityForAxis:(int64_t)a3;
- (id).cxx_construct;
- (void)dealloc;
- (void)initWithFlowArrangement:(uint64_t)a3 cellRange:(uint64_t)a4;
- (void)populateGridArrangementCells:(void *)a3;
- (void)populateGridArrangementDimension:(void *)a3 withCells:(const void *)a4 axis:(int64_t)a5;
@end

@implementation _NUIFlowRowContainer

- (void)initWithFlowArrangement:(uint64_t)a3 cellRange:(uint64_t)a4
{
  if (result)
  {
    result = (void *)[result init];
    if (result)
    {
      result[16] = a4;
      result[17] = a2;
      result[15] = a3;
      result[1] = result;
    }
  }
  return result;
}

- (void)dealloc
{
  _NUIGridArrangement::resetForInvalidation(&self->_gridArrangement, -1);
  v3.receiver = self;
  v3.super_class = (Class)_NUIFlowRowContainer;
  [(_NUIFlowRowContainer *)&v3 dealloc];
}

- (CGSize)contentLayoutSizeFittingSize:(CGSize)a3 forArrangedSubview:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  if ((id)+[_NUIFlowArrangementDummyItem sharedDummyItem]() == a4)
  {
    double v8 = 1.0;
    double v9 = 1.0;
  }
  else
  {
    objc_msgSend(*(id *)self->_flowArrangement, "contentLayoutSizeFittingSize:forArrangedSubview:", a4, width, height);
  }
  result.double height = v9;
  result.double width = v8;
  return result;
}

- (CGRect)layoutFrameForArrangedSubview:(id)a3 withProposedContentFrame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  if ((id)+[_NUIFlowArrangementDummyItem sharedDummyItem]() != a3)
  {
    objc_msgSend(*(id *)self->_flowArrangement, "layoutFrameForArrangedSubview:withProposedContentFrame:", a3, x, y, width, height);
    double x = v10;
    double y = v11;
    double width = v12;
    double height = v13;
  }
  double v14 = x;
  double v15 = y;
  double v16 = width;
  double v17 = height;
  result.size.double height = v17;
  result.size.double width = v16;
  result.origin.double y = v15;
  result.origin.double x = v14;
  return result;
}

- (void)populateGridArrangementCells:(void *)a3
{
  NSUInteger location = self->_range.location;
  NSUInteger length = self->_range.length;
  if (location < length + location)
  {
    v7 = (char *)*((void *)a3 + 1);
    NSUInteger v8 = location << 6;
    NSUInteger v9 = self->_range.location;
    do
    {
      NSUInteger v10 = *((void *)self->_flowArrangement + 7) + v8;
      uint64_t v11 = *(void *)v10;
      uint64_t v24 = *(void *)v10;
      NSUInteger v22 = v9 - location;
      uint64_t v23 = 1;
      long long v21 = xmmword_1AE675740;
      signed __int8 v12 = *(unsigned char *)(v10 + 56);
      uint64_t v20 = v12;
      __int16 v13 = *(char *)(v10 + 57);
      uint64_t v19 = *(char *)(v10 + 57);
      if ((unint64_t)v7 >= *((void *)a3 + 2))
      {
        v7 = (char *)std::vector<_NUIGridArrangementCell>::__emplace_back_slow_path<objc_object  {objcproto18NUIArrangementItem}*,_NSRange,objc_object  {objcproto18NUIArrangementItem}*,NUIContainerAlignment,_NSRange>((void **)a3, &v24, (uint64_t *)&v22, (uint64_t *)&v21, &v20, &v19);
      }
      else
      {
        _NUIGridArrangementCell::_NUIGridArrangementCell((uint64_t)v7, v11, v9 - location, 1, 0, 1, v12, v13);
        v7 += 112;
        *((void *)a3 + 1) = v7;
      }
      *((void *)a3 + 1) = v7;
      ++v9;
      NSUInteger location = self->_range.location;
      NSUInteger length = self->_range.length;
      v8 += 64;
    }
    while (v9 < length + location);
  }
  if (*((unsigned char *)&self->_gridArrangement + 8) == 1 && length < *((void *)self->_flowArrangement + 2))
  {
    uint64_t v14 = +[_NUIFlowArrangementDummyItem sharedDummyItem]();
    uint64_t v24 = v14;
    NSUInteger v15 = self->_range.length;
    uint64_t v16 = *((void *)self->_flowArrangement + 2) - v15;
    NSUInteger v22 = v15;
    uint64_t v23 = v16;
    long long v21 = xmmword_1AE675740;
    uint64_t v19 = 3;
    uint64_t v20 = 3;
    unint64_t v17 = *((void *)a3 + 1);
    if (v17 >= *((void *)a3 + 2))
    {
      v18 = std::vector<_NUIGridArrangementCell>::__emplace_back_slow_path<_NUIFlowArrangementDummyItem *,_NSRange,_NSRange,NUIContainerAlignment,NUIContainerAlignment>((void **)a3, &v24, (uint64_t *)&v22, (uint64_t *)&v21, &v20, &v19);
    }
    else
    {
      _NUIGridArrangementCell::_NUIGridArrangementCell(*((void *)a3 + 1), v14, v15, v16, 0, 1, 3u, 3);
      v18 = (void *)(v17 + 112);
      *((void *)a3 + 1) = v17 + 112;
    }
    *((void *)a3 + 1) = v18;
  }
}

- (void)populateGridArrangementDimension:(void *)a3 withCells:(const void *)a4 axis:(int64_t)a5
{
  if (a5)
  {
    unint64_t v6 = *((void *)a3 + 2);
    unint64_t v7 = *((void *)a3 + 1);
    if (v7 >= v6)
    {
      uint64_t v33 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v7 - *(void *)a3) >> 3);
      if ((unint64_t)(v33 + 1) > 0x492492492492492) {
LABEL_45:
      }
        abort();
      unint64_t v34 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v6 - *(void *)a3) >> 3);
      uint64_t v35 = 2 * v34;
      if (2 * v34 <= v33 + 1) {
        uint64_t v35 = v33 + 1;
      }
      if (v34 >= 0x249249249249249) {
        unint64_t v36 = 0x492492492492492;
      }
      else {
        unint64_t v36 = v35;
      }
      if (v36)
      {
        v37 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<_NUIGridArrangementDimension>>((uint64_t)a3 + 16, v36);
        uint64_t v39 = v38;
      }
      else
      {
        v37 = 0;
        uint64_t v39 = 0;
      }
      _NUIGridArrangementDimension::_NUIGridArrangementDimension((_NUIGridArrangementDimension *)&v37[56 * v33], 0, 1.79769313e308);
      v41 = &v37[56 * v39];
      unint64_t v8 = v40 + 56;
      v43 = *(char **)a3;
      v42 = (char *)*((void *)a3 + 1);
      if (v42 != *(char **)a3)
      {
        do
        {
          long long v44 = *(_OWORD *)(v42 - 56);
          long long v45 = *(_OWORD *)(v42 - 40);
          long long v46 = *(_OWORD *)(v42 - 24);
          *(void *)(v40 - 8) = *((void *)v42 - 1);
          *(_OWORD *)(v40 - 24) = v46;
          *(_OWORD *)(v40 - 40) = v45;
          *(_OWORD *)(v40 - 56) = v44;
          v40 -= 56;
          v42 -= 56;
        }
        while (v42 != v43);
        v42 = *(char **)a3;
      }
      *(void *)a3 = v40;
      *((void *)a3 + 1) = v8;
      *((void *)a3 + 2) = v41;
      if (v42) {
        operator delete(v42);
      }
    }
    else
    {
      _NUIGridArrangementDimension::_NUIGridArrangementDimension(*((_NUIGridArrangementDimension **)a3 + 1), 0, 1.79769313e308);
      unint64_t v8 = v7 + 56;
      *((void *)a3 + 1) = v7 + 56;
    }
    *((void *)a3 + 1) = v8;
  }
  else
  {
    uint64_t v10 = *(void *)a4;
    uint64_t v47 = *((void *)a4 + 1);
    if (*(void *)a4 != v47)
    {
      __int16 v11 = 0;
      signed __int8 v12 = (char *)a3 + 16;
      do
      {
        if (*(void *)(v10 + 64))
        {
          unint64_t v13 = 0;
          uint64_t v14 = (_NUIGridArrangementDimension *)*((void *)a3 + 1);
          do
          {
            flowArrangement = (double *)self->_flowArrangement;
            if ((unint64_t)v14 >= *v12)
            {
              uint64_t v16 = 0x6DB6DB6DB6DB6DB7 * (((uint64_t)v14 - *(void *)a3) >> 3);
              unint64_t v17 = v16 + 1;
              if ((unint64_t)(v16 + 1) > 0x492492492492492) {
                goto LABEL_45;
              }
              if (0xDB6DB6DB6DB6DB6ELL * ((uint64_t)(*v12 - *(void *)a3) >> 3) > v17) {
                unint64_t v17 = 0xDB6DB6DB6DB6DB6ELL * ((uint64_t)(*v12 - *(void *)a3) >> 3);
              }
              if ((unint64_t)(0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*v12 - *(void *)a3) >> 3)) >= 0x249249249249249) {
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
              _NUIGridArrangementDimension::_NUIGridArrangementDimension((_NUIGridArrangementDimension *)&v19[56 * v16], v11, flowArrangement[6]);
              uint64_t v24 = *(char **)a3;
              uint64_t v23 = (char *)*((void *)a3 + 1);
              uint64_t v25 = v22;
              if (v23 != *(char **)a3)
              {
                do
                {
                  long long v26 = *(_OWORD *)(v23 - 56);
                  long long v27 = *(_OWORD *)(v23 - 40);
                  long long v28 = *(_OWORD *)(v23 - 24);
                  *(void *)(v25 - 8) = *((void *)v23 - 1);
                  *(_OWORD *)(v25 - 24) = v28;
                  *(_OWORD *)(v25 - 40) = v27;
                  *(_OWORD *)(v25 - 56) = v26;
                  v25 -= 56;
                  v23 -= 56;
                }
                while (v23 != v24);
                uint64_t v23 = *(char **)a3;
              }
              v29 = &v19[56 * v21];
              uint64_t v14 = (_NUIGridArrangementDimension *)(v22 + 56);
              *(void *)a3 = v25;
              *((void *)a3 + 1) = v22 + 56;
              *((void *)a3 + 2) = v29;
              if (v23) {
                operator delete(v23);
              }
            }
            else
            {
              _NUIGridArrangementDimension::_NUIGridArrangementDimension(v14, v11, flowArrangement[6]);
              uint64_t v14 = (_NUIGridArrangementDimension *)((char *)v14 + 56);
              *((void *)a3 + 1) = v14;
            }
            *((void *)a3 + 1) = v14;
            ++v11;
            ++v13;
          }
          while (v13 < *(void *)(v10 + 64));
        }
        v10 += 112;
      }
      while (v10 != v47);
    }
    v31 = *(char **)a3;
    v30 = (char *)*((void *)a3 + 1);
    if (*(char **)a3 != v30)
    {
      uint64_t v32 = *((void *)self->_flowArrangement + 4);
      do
      {
        *(void *)v31 = v32;
        v31 += 56;
      }
      while (v31 != v30);
    }
    *((void *)v30 - 7) = 0;
  }
}

- (float)contentCompressionResistancePriorityForAxis:(int64_t)a3
{
  NSUInteger location = self->_range.location;
  double v4 = 0.0;
  if (location < self->_range.length + location)
  {
    NSUInteger v7 = location << 6;
    do
    {
      [*(id *)(*((void *)self->_flowArrangement + 7) + v7) contentCompressionResistancePriorityForAxis:a3];
      if (v4 <= v8)
      {
        [*(id *)(*((void *)self->_flowArrangement + 7) + v7) contentCompressionResistancePriorityForAxis:a3];
        double v4 = v9;
      }
      ++location;
      v7 += 64;
    }
    while (location < self->_range.length + self->_range.location);
  }
  return v4;
}

- (float)contentHuggingPriorityForAxis:(int64_t)a3
{
  NSUInteger location = self->_range.location;
  double v4 = 0.0;
  if (location < self->_range.length + location)
  {
    NSUInteger v7 = location << 6;
    do
    {
      [*(id *)(*((void *)self->_flowArrangement + 7) + v7) contentHuggingPriorityForAxis:a3];
      if (v4 <= v8)
      {
        [*(id *)(*((void *)self->_flowArrangement + 7) + v7) contentHuggingPriorityForAxis:a3];
        double v4 = v9;
      }
      ++location;
      v7 += 64;
    }
    while (location < self->_range.length + self->_range.location);
  }
  return v4;
}

- (double)effectiveBaselineOffsetFromContentBottom
{
  NSUInteger location = self->_range.location;
  double v3 = 0.0;
  if (location < self->_range.length + location)
  {
    NSUInteger v5 = location << 6;
    do
    {
      [*(id *)(*((void *)self->_flowArrangement + 7) + v5) effectiveBaselineOffsetFromContentBottom];
      if (v3 <= v6)
      {
        [*(id *)(*((void *)self->_flowArrangement + 7) + v5) effectiveBaselineOffsetFromContentBottom];
        double v3 = v7;
      }
      ++location;
      v5 += 64;
    }
    while (location < self->_range.length + self->_range.location);
  }
  return v3;
}

- (double)effectiveFirstBaselineOffsetFromContentTop
{
  NSUInteger location = self->_range.location;
  double v3 = 0.0;
  if (location < self->_range.length + location)
  {
    NSUInteger v5 = location << 6;
    do
    {
      [*(id *)(*((void *)self->_flowArrangement + 7) + v5) effectiveFirstBaselineOffsetFromContentTop];
      if (v3 <= v6)
      {
        [*(id *)(*((void *)self->_flowArrangement + 7) + v5) effectiveFirstBaselineOffsetFromContentTop];
        double v3 = v7;
      }
      ++location;
      v5 += 64;
    }
    while (location < self->_range.length + self->_range.location);
  }
  return v3;
}

- (BOOL)isLayoutSizeDependentOnPerpendicularAxis
{
  NSUInteger location = self->_range.location;
  if (location >= self->_range.length + location)
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    NSUInteger v4 = location << 6;
    do
    {
      int v5 = [*(id *)(*((void *)self->_flowArrangement + 7) + v4) isLayoutSizeDependentOnPerpendicularAxis];
      if (v5) {
        break;
      }
      ++location;
      v4 += 64;
    }
    while (location < self->_range.length + self->_range.location);
  }
  return v5;
}

- (void).cxx_destruct
{
  begin = self->_gridArrangement.viewFrames.__begin_;
  if (begin)
  {
    self->_gridArrangement.viewFrames.__end_ = begin;
    operator delete(begin);
  }
  NSUInteger v4 = self->_gridArrangement.rows.__begin_;
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
  double v6 = self->_gridArrangement.cells.__begin_;
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