@interface NUIGridArrangement
- (BOOL)isBaselineRelativeArrangement;
- (CGRect)frameForColumns:(_NSRange)a3 rows:(_NSRange)a4 inBounds:(CGRect)a5;
- (CGRect)layoutFrameForArrangedSubview:(id)a3 withProposedContentFrame:(CGRect)a4;
- (CGRect)unionFrameForItemsInColumns:(_NSRange)a3 rows:(_NSRange)a4 inBounds:(CGRect)a5;
- (CGSize)contentLayoutSizeFittingSize:(CGSize)a3 forArrangedSubview:(id)a4;
- (CGSize)layoutSizeFittingSize:(CGSize)a3;
- (NUIArrangementContainer)container;
- (NUIGridArrangement)initWithContainer:(id)a3 dataSource:(id)a4;
- (NUIGridArrangementDataSource)dataSource;
- (double)_cacheDisplayScaleIfNeeded;
- (id).cxx_construct;
- (int64_t)horizontalDistribution;
- (int64_t)verticalDistribution;
- (void)dealloc;
- (void)populateGridArrangementCells:(void *)a3;
- (void)populateGridArrangementDimension:(void *)a3 withCells:(const void *)a4 axis:(int64_t)a5;
- (void)positionItemsInBounds:(CGRect)a3 block:(id)a4;
- (void)positionItemsInColumns:(_NSRange)a3 rows:(_NSRange)a4 inBounds:(CGRect)a5 block:(id)a6;
- (void)reloadData;
- (void)setBaselineRelativeArrangement:(BOOL)a3;
- (void)setHorizontalDistribution:(int64_t)a3;
- (void)setVerticalDistribution:(int64_t)a3;
@end

@implementation NUIGridArrangement

- (NUIGridArrangement)initWithContainer:(id)a3 dataSource:(id)a4
{
  if (_NUIEnableAPIMisuseAssertions)
  {
    if (a3) {
      goto LABEL_10;
    }
  }
  else
  {
    char v10 = _NUIIsDebuggerAttached();
    if (a3 || (v10 & 1) == 0) {
      goto LABEL_9;
    }
  }
  uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AppSupportUI/AppSupportUI/NUIGridArrangement.mm"];
  if (v8) {
    v9 = (__CFString *)v8;
  }
  else {
    v9 = @"<Unknown File>";
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v9, 34, @"Invalid parameter not satisfying: %@", @"container != nil");
LABEL_9:
  if (!_NUIEnableAPIMisuseAssertions)
  {
    char v16 = _NUIIsDebuggerAttached();
    if (a4 || (v16 & 1) == 0) {
      goto LABEL_11;
    }
    goto LABEL_22;
  }
LABEL_10:
  if (a4) {
    goto LABEL_11;
  }
LABEL_22:
  uint64_t v17 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AppSupportUI/AppSupportUI/NUIGridArrangement.mm"];
  if (v17) {
    v18 = (__CFString *)v17;
  }
  else {
    v18 = @"<Unknown File>";
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v18, 35, @"Invalid parameter not satisfying: %@", @"dataSource != nil");
LABEL_11:
  v19.receiver = self;
  v19.super_class = (Class)NUIGridArrangement;
  v11 = [(NUIGridArrangement *)&v19 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_container, a3);
    objc_storeWeak((id *)&v12->_dataSource, a4);
    *(unsigned char *)&v12->_flags = *(unsigned char *)&v12->_flags & 0xFE | objc_opt_respondsToSelector() & 1;
    if (objc_opt_respondsToSelector()) {
      char v13 = 2;
    }
    else {
      char v13 = 0;
    }
    *(unsigned char *)&v12->_flags = *(unsigned char *)&v12->_flags & 0xFD | v13;
    if (objc_opt_respondsToSelector()) {
      char v14 = 4;
    }
    else {
      char v14 = 0;
    }
    *(unsigned char *)&v12->_flags = *(unsigned char *)&v12->_flags & 0xFB | v14;
    v12->_arrangement.container = (_NUIGridArrangementContainer *)v12;
  }
  return v12;
}

- (void)dealloc
{
  _NUIGridArrangement::resetForInvalidation(&self->_arrangement, -1);
  objc_storeWeak((id *)&self->_container, 0);
  objc_storeWeak((id *)&self->_dataSource, 0);
  v3.receiver = self;
  v3.super_class = (Class)NUIGridArrangement;
  [(NUIGridArrangement *)&v3 dealloc];
}

- (NUIArrangementContainer)container
{
  return (NUIArrangementContainer *)objc_loadWeak((id *)&self->_container);
}

- (NUIGridArrangementDataSource)dataSource
{
  return (NUIGridArrangementDataSource *)objc_loadWeak((id *)&self->_dataSource);
}

- (BOOL)isBaselineRelativeArrangement
{
  return self->_arrangement.baselineRelative;
}

- (void)setBaselineRelativeArrangement:(BOOL)a3
{
  self->_arrangement.baselineRelative = a3;
}

- (int64_t)horizontalDistribution
{
  return *((char *)&self->_arrangement + 8);
}

- (void)setHorizontalDistribution:(int64_t)a3
{
  *((unsigned char *)&self->_arrangement + 8) = a3;
}

- (int64_t)verticalDistribution
{
  return *((char *)&self->_arrangement + 9);
}

- (void)setVerticalDistribution:(int64_t)a3
{
  *((unsigned char *)&self->_arrangement + 9) = a3;
}

- (void)reloadData
{
  self->_scale = 0.0;
}

- (CGSize)layoutSizeFittingSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  p_arrangement = &self->_arrangement;
  _NUIGridArrangement::resetForInvalidation(&self->_arrangement, 0);
  CGFloat v6 = width;
  CGFloat v7 = height;
  _NUIGridArrangement::measureCells(p_arrangement, 0, *(CGSize *)&v6);
  result.CGFloat height = v9;
  result.CGFloat width = v8;
  return result;
}

- (double)_cacheDisplayScaleIfNeeded
{
  if (result)
  {
    v1 = result;
    if (result[17] <= 0.0)
    {
      [result container];
      if (objc_opt_respondsToSelector()) {
        CGSize result = (double *)objc_msgSend((id)objc_msgSend(v1, "container"), "displayScale");
      }
      else {
        CGSize result = (double *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42D90], "mainScreen"), "scale");
      }
      *((void *)v1 + 17) = v2;
    }
  }
  return result;
}

- (void)positionItemsInBounds:(CGRect)a3 block:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  -[NUIGridArrangement _cacheDisplayScaleIfNeeded]((double *)self);
  _NUIGridArrangement::resetForInvalidation(&self->_arrangement, 0);
  v11.double width = width;
  v11.double height = height;
  _NUIGridArrangement::measureCells(&self->_arrangement, 1, v11);
  self->_bounds.origin.double x = x;
  self->_bounds.origin.double y = y;
  self->_bounds.size.double width = width;
  self->_bounds.size.double height = height;
  _NUIGridArrangement::positionCells((uint64_t)&self->_arrangement, (uint64_t)a4, x, y, width, height);
}

- (void)positionItemsInColumns:(_NSRange)a3 rows:(_NSRange)a4 inBounds:(CGRect)a5 block:(id)a6
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  NSUInteger v13 = a3.length;
  NSUInteger v14 = a3.location;
  -[NUIGridArrangement _cacheDisplayScaleIfNeeded]((double *)self);
  _NUIGridArrangement::resetForInvalidation(&self->_arrangement, 0);
  v17.double width = width;
  v17.double height = height;
  _NUIGridArrangement::measureCells(&self->_arrangement, 1, v17);
  self->_bounds.origin.double x = x;
  self->_bounds.origin.double y = y;
  self->_bounds.size.double width = width;
  self->_bounds.size.double height = height;
  _NUIGridArrangement::positionSubsetCells((uint64_t)&self->_arrangement, v14, v13, location, length, (uint64_t)a6, x, y, width, height);
}

- (CGRect)unionFrameForItemsInColumns:(_NSRange)a3 rows:(_NSRange)a4 inBounds:(CGRect)a5
{
  double v5 = _NUIGridArrangement::unionFrameForSubsetCells(&self->_arrangement, a3, a4, a5);
  result.size.double height = v8;
  result.size.double width = v7;
  result.origin.double y = v6;
  result.origin.double x = v5;
  return result;
}

- (CGRect)frameForColumns:(_NSRange)a3 rows:(_NSRange)a4 inBounds:(CGRect)a5
{
  double v5 = _NUIGridArrangement::frameForColumnsAndRows(&self->_arrangement, a3, a4, a5);
  result.size.double height = v8;
  result.size.double width = v7;
  result.origin.double y = v6;
  result.origin.double x = v5;
  return result;
}

- (void)populateGridArrangementCells:(void *)a3
{
  double v5 = [(NUIGridArrangement *)self dataSource];
  uint64_t v6 = [(NUIGridArrangementDataSource *)v5 numberOfItemsInGridArrangement:self];
  if (v6 >= 1)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    long long v12 = xmmword_1AE675740;
    do
    {
      uint64_t v17 = v8;
      uint64_t v18 = 1;
      long long v16 = v12;
      uint64_t v14 = 1;
      uint64_t v15 = 1;
      uint64_t v13 = 0;
      uint64_t v9 = -[NUIGridArrangementDataSource gridArrangement:itemAtIndex:columns:rows:horizontalAlignment:verticalAlignment:](v5, "gridArrangement:itemAtIndex:columns:rows:horizontalAlignment:verticalAlignment:", self, v8, &v17, &v16, &v15, &v14, v12);
      uint64_t v13 = v9;
      unint64_t v10 = *((void *)a3 + 1);
      if (v10 >= *((void *)a3 + 2))
      {
        CGSize v11 = std::vector<_NUIGridArrangementCell>::__emplace_back_slow_path<objc_object  {objcproto18NUIArrangementItem}*&,_NSRange &,_NSRange,NUIContainerAlignment &,NUIContainerAlignment>((void **)a3, &v13, &v17, (uint64_t *)&v16, &v15, &v14);
      }
      else
      {
        _NUIGridArrangementCell::_NUIGridArrangementCell(*((void *)a3 + 1), v9, v17, v18, v16, *((uint64_t *)&v16 + 1), v15, v14);
        CGSize v11 = (void *)(v10 + 112);
        *((void *)a3 + 1) = v10 + 112;
      }
      *((void *)a3 + 1) = v11;
      ++v8;
    }
    while (v7 != v8);
  }
}

- (void)populateGridArrangementDimension:(void *)a3 withCells:(const void *)a4 axis:(int64_t)a5
{
  v37 = [(NUIGridArrangement *)self dataSource];
  uint64_t v9 = *(void *)a4;
  uint64_t v10 = *((void *)a4 + 1);
  if (*(void *)a4 != v10)
  {
    unsigned __int16 v11 = 0;
    do
    {
      if (a5) {
        uint64_t v12 = 80;
      }
      else {
        uint64_t v12 = 64;
      }
      if (a5) {
        uint64_t v13 = 72;
      }
      else {
        uint64_t v13 = 56;
      }
      unint64_t v14 = *(void *)(v9 + v12) + *(void *)(v9 + v13);
      if (v14 > v11) {
        unsigned __int16 v11 = v14;
      }
      v9 += 112;
    }
    while (v9 != v10);
    uint64_t v15 = v11;
    if (v11)
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        double v38 = 0.0;
        double v17 = 1.79769313e308;
        if (a5)
        {
          if ((*(unsigned char *)&self->_flags & 2) != 0)
          {
            [(NUIGridArrangementDataSource *)v37 gridArrangement:self heightOfRowAtIndex:i spacingAfter:&v38];
LABEL_19:
            double v17 = v18;
          }
        }
        else if (*(unsigned char *)&self->_flags)
        {
          [(NUIGridArrangementDataSource *)v37 gridArrangement:self widthOfColumnAtIndex:i spacingAfter:&v38];
          goto LABEL_19;
        }
        unint64_t v20 = *((void *)a3 + 1);
        unint64_t v19 = *((void *)a3 + 2);
        if (v20 >= v19)
        {
          uint64_t v22 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v20 - *(void *)a3) >> 3);
          unint64_t v23 = v22 + 1;
          if ((unint64_t)(v22 + 1) > 0x492492492492492) {
            abort();
          }
          unint64_t v24 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v19 - *(void *)a3) >> 3);
          if (2 * v24 > v23) {
            unint64_t v23 = 2 * v24;
          }
          if (v24 >= 0x249249249249249) {
            unint64_t v25 = 0x492492492492492;
          }
          else {
            unint64_t v25 = v23;
          }
          if (v25)
          {
            v26 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<_NUIGridArrangementDimension>>((uint64_t)a3 + 16, v25);
            uint64_t v28 = v27;
          }
          else
          {
            v26 = 0;
            uint64_t v28 = 0;
          }
          _NUIGridArrangementDimension::_NUIGridArrangementDimension((_NUIGridArrangementDimension *)&v26[56 * v22], i, v17);
          v31 = *(char **)a3;
          v30 = (char *)*((void *)a3 + 1);
          uint64_t v32 = v29;
          if (v30 != *(char **)a3)
          {
            do
            {
              long long v33 = *(_OWORD *)(v30 - 56);
              long long v34 = *(_OWORD *)(v30 - 40);
              long long v35 = *(_OWORD *)(v30 - 24);
              *(void *)(v32 - 8) = *((void *)v30 - 1);
              *(_OWORD *)(v32 - 24) = v35;
              *(_OWORD *)(v32 - 40) = v34;
              *(_OWORD *)(v32 - 56) = v33;
              v32 -= 56;
              v30 -= 56;
            }
            while (v30 != v31);
            v30 = *(char **)a3;
          }
          unint64_t v21 = v29 + 56;
          *(void *)a3 = v32;
          *((void *)a3 + 1) = v29 + 56;
          *((void *)a3 + 2) = &v26[56 * v28];
          if (v30) {
            operator delete(v30);
          }
        }
        else
        {
          _NUIGridArrangementDimension::_NUIGridArrangementDimension(*((_NUIGridArrangementDimension **)a3 + 1), i, v17);
          unint64_t v21 = v20 + 56;
          *((void *)a3 + 1) = v20 + 56;
        }
        *((void *)a3 + 1) = v21;
        double v36 = v38;
        if (i >= v15 - 1) {
          double v36 = 0.0;
        }
        *(double *)(*(void *)a3 + 56 * i) = v36;
      }
    }
  }
}

- (CGSize)contentLayoutSizeFittingSize:(CGSize)a3 forArrangedSubview:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v7 = [(NUIGridArrangement *)self container];
  -[NUIArrangementContainer contentLayoutSizeFittingSize:forArrangedSubview:](v7, "contentLayoutSizeFittingSize:forArrangedSubview:", a4, width, height);
  result.double height = v9;
  result.double width = v8;
  return result;
}

- (CGRect)layoutFrameForArrangedSubview:(id)a3 withProposedContentFrame:(CGRect)a4
{
  -[NUIArrangementContainer layoutFrameForArrangedSubview:withProposedContentFrame:]([(NUIGridArrangement *)self container], "layoutFrameForArrangedSubview:withProposedContentFrame:", a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  CGFloat x = v58.origin.x;
  CGFloat y = v58.origin.y;
  CGFloat width = v58.size.width;
  CGFloat height = v58.size.height;
  double scale = self->_scale;
  double MinX = CGRectGetMinX(v58);
  if (scale == 1.0)
  {
    double v11 = ceil(MinX);
    double v12 = v11 - MinX;
    double v13 = floor(MinX);
    if (v12 >= 0.001) {
      double v14 = v13;
    }
    else {
      double v14 = v11;
    }
    v59.origin.CGFloat x = x;
    v59.origin.CGFloat y = y;
    v59.size.CGFloat width = width;
    v59.size.CGFloat height = height;
    double MinY = CGRectGetMinY(v59);
    double v16 = ceil(MinY);
    double v17 = v16 - MinY;
    double v18 = floor(MinY);
    if (v17 >= 0.001) {
      double v19 = v18;
    }
    else {
      double v19 = v16;
    }
    v60.origin.CGFloat x = x;
    v60.origin.CGFloat y = y;
    v60.size.CGFloat width = width;
    v60.size.CGFloat height = height;
    double v20 = CGRectGetWidth(v60);
    double v21 = floor(v20);
    double v22 = v20 - v21;
    double v23 = ceil(v20);
    if (v22 >= 0.001) {
      double v24 = v23;
    }
    else {
      double v24 = v21;
    }
    v61.origin.CGFloat x = x;
    v61.origin.CGFloat y = y;
    v61.size.CGFloat width = width;
    v61.size.CGFloat height = height;
    double v25 = CGRectGetHeight(v61);
    double v26 = floor(v25);
    double v27 = v25 - v26;
    double v28 = ceil(v25);
    if (v27 >= 0.001) {
      double v29 = v28;
    }
    else {
      double v29 = v26;
    }
  }
  else
  {
    double v30 = scale * MinX;
    double v31 = ceil(v30);
    double v32 = v31 - v30;
    double v33 = floor(v30);
    if (v32 < 0.001) {
      double v33 = v31;
    }
    double v55 = v33 / scale;
    v62.origin.CGFloat x = x;
    v62.origin.CGFloat y = y;
    v62.size.CGFloat width = width;
    v62.size.CGFloat height = height;
    double v34 = scale * CGRectGetMinY(v62);
    double v35 = ceil(v34);
    double v36 = v35 - v34;
    double v37 = floor(v34);
    if (v36 < 0.001) {
      double v37 = v35;
    }
    double v19 = v37 / scale;
    v63.origin.CGFloat x = x;
    v63.origin.CGFloat y = y;
    v63.size.CGFloat width = width;
    v63.size.CGFloat height = height;
    double v38 = scale * CGRectGetWidth(v63);
    double v39 = floor(v38);
    double v40 = v38 - v39;
    double v41 = ceil(v38);
    if (v40 < 0.001) {
      double v41 = v39;
    }
    double v24 = v41 / scale;
    v64.origin.CGFloat x = x;
    v64.origin.CGFloat y = y;
    v64.size.CGFloat width = width;
    v64.size.CGFloat height = height;
    double v42 = scale * CGRectGetHeight(v64);
    double v43 = floor(v42);
    double v44 = v42 - v43;
    double v45 = ceil(v42);
    double v14 = v55;
    if (v44 < 0.001) {
      double v45 = v43;
    }
    double v29 = v45 / scale;
  }
  if ((*(unsigned char *)&self->_flags & 4) != 0
    && [(NUIArrangementContainer *)self->_container effectiveUserInterfaceLayoutDirection] == 1)
  {
    CGFloat v46 = self->_bounds.origin.x;
    CGFloat v47 = self->_bounds.origin.y;
    CGFloat v48 = self->_bounds.size.width;
    CGFloat v49 = self->_bounds.size.height;
    v65.origin.CGFloat x = v14;
    v65.origin.CGFloat y = v19;
    v65.size.CGFloat width = v24;
    v65.size.CGFloat height = v29;
    double v56 = CGRectGetMinX(v65);
    v66.origin.CGFloat x = v46;
    v66.origin.CGFloat y = v47;
    v66.size.CGFloat width = v48;
    v66.size.CGFloat height = v49;
    double v57 = v56 - CGRectGetMinX(v66);
    v67.origin.CGFloat x = v46;
    v67.origin.CGFloat y = v47;
    v67.size.CGFloat width = v48;
    v67.size.CGFloat height = v49;
    double MaxX = CGRectGetMaxX(v67);
    v68.origin.CGFloat x = v14;
    v68.origin.CGFloat y = v19;
    v68.size.CGFloat width = v24;
    v68.size.CGFloat height = v29;
    double v14 = MaxX - (v57 + CGRectGetWidth(v68));
  }
  double v51 = v14;
  double v52 = v19;
  double v53 = v24;
  double v54 = v29;
  result.size.CGFloat height = v54;
  result.size.CGFloat width = v53;
  result.origin.CGFloat y = v52;
  result.origin.CGFloat x = v51;
  return result;
}

- (void).cxx_destruct
{
  begin = self->_arrangement.viewFrames.__begin_;
  if (begin)
  {
    self->_arrangement.viewFrames.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->_arrangement.rows.__begin_;
  if (v4)
  {
    self->_arrangement.rows.__end_ = v4;
    operator delete(v4);
  }
  double v5 = self->_arrangement.columns.__begin_;
  if (v5)
  {
    self->_arrangement.columns.__end_ = v5;
    operator delete(v5);
  }
  uint64_t v6 = self->_arrangement.cells.__begin_;
  if (v6)
  {
    self->_arrangement.cells.__end_ = v6;
    operator delete(v6);
  }
}

- (id).cxx_construct
{
  return self;
}

@end