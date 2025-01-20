@interface NUIBoxArrangement
- (CGRect)layoutFrameForArrangedSubview:(id)a3 withProposedContentFrame:(CGRect)a4;
- (CGSize)contentLayoutSizeFittingSize:(CGSize)a3 forArrangedSubview:(id)a4;
- (CGSize)layoutSizeFittingSize:(CGSize)a3;
- (NUIArrangementContainer)container;
- (NUIBoxArrangement)initWithContainer:(id)a3 dataSource:(id)a4;
- (NUIBoxArrangementDataSource)dataSource;
- (double)_cacheDisplayScaleIfNeeded;
- (id).cxx_construct;
- (void)dealloc;
- (void)populateBoxArrangementCells:(void *)a3;
- (void)positionItemsInBounds:(CGRect)a3 block:(id)a4;
- (void)reloadData;
@end

@implementation NUIBoxArrangement

- (NUIBoxArrangement)initWithContainer:(id)a3 dataSource:(id)a4
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
  uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AppSupportUI/AppSupportUI/NUIBoxArrangement.mm"];
  if (v8) {
    v9 = (__CFString *)v8;
  }
  else {
    v9 = @"<Unknown File>";
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v9, 32, @"Invalid parameter not satisfying: %@", @"container != nil");
LABEL_9:
  if (_NUIEnableAPIMisuseAssertions)
  {
LABEL_10:
    if (a4) {
      goto LABEL_11;
    }
LABEL_16:
    uint64_t v15 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AppSupportUI/AppSupportUI/NUIBoxArrangement.mm"];
    if (v15) {
      v16 = (__CFString *)v15;
    }
    else {
      v16 = @"<Unknown File>";
    }
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v16, 33, @"Invalid parameter not satisfying: %@", @"dataSource != nil");
    goto LABEL_11;
  }
  char v14 = _NUIIsDebuggerAttached();
  if (!a4 && (v14 & 1) != 0) {
    goto LABEL_16;
  }
LABEL_11:
  v17.receiver = self;
  v17.super_class = (Class)NUIBoxArrangement;
  v11 = [(NUIBoxArrangement *)&v17 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_container, a3);
    objc_storeWeak((id *)&v12->_dataSource, a4);
    v12->_arrangement.container = (_NUIBoxArrangementContainer *)v12;
    *(unsigned char *)&v12->_flags = *(unsigned char *)&v12->_flags & 0xFE | objc_opt_respondsToSelector() & 1;
  }
  return v12;
}

- (void)dealloc
{
  _NUIBoxArrangement::resetForInvalidation(&self->_arrangement, -1);
  objc_storeWeak((id *)&self->_container, 0);
  objc_storeWeak((id *)&self->_dataSource, 0);
  v3.receiver = self;
  v3.super_class = (Class)NUIBoxArrangement;
  [(NUIBoxArrangement *)&v3 dealloc];
}

- (NUIArrangementContainer)container
{
  return (NUIArrangementContainer *)objc_loadWeak((id *)&self->_container);
}

- (NUIBoxArrangementDataSource)dataSource
{
  return (NUIBoxArrangementDataSource *)objc_loadWeak((id *)&self->_dataSource);
}

- (void)reloadData
{
}

- (void)populateBoxArrangementCells:(void *)a3
{
  v5 = self->_dataSource;
  uint64_t v6 = [(NUIBoxArrangementDataSource *)v5 numberOfItemsInBoxArrangement:self];
  if (v6)
  {
    uint64_t v7 = v6;
    for (uint64_t i = 0; i != v7; ++i)
    {
      uint64_t v10 = 3;
      uint64_t v11 = 3;
      uint64_t v9 = 0;
      uint64_t v9 = [(NUIBoxArrangementDataSource *)v5 boxArrangement:self itemAtIndex:i horizontalAlignment:&v11 verticalAlignment:&v10];
      std::vector<_NUIBoxArrangementCell>::emplace_back<objc_object  {objcproto18NUIArrangementItem}*&,NUIContainerAlignment &,NUIContainerAlignment>((void **)a3, &v9, &v11, &v10);
    }
  }
}

- (CGSize)layoutSizeFittingSize:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  p_arrangement = &self->_arrangement;
  _NUIBoxArrangement::resetForInvalidation(&self->_arrangement, 0);
  CGFloat v6 = width;
  CGFloat v7 = height;
  double v8 = _NUIBoxArrangement::measureCells(p_arrangement, *(CGSize *)&v6);
  result.CGFloat height = v9;
  result.CGFloat width = v8;
  return result;
}

- (double)_cacheDisplayScaleIfNeeded
{
  if (result)
  {
    v1 = result;
    if (result[18] <= 0.0)
    {
      [result container];
      if (objc_opt_respondsToSelector()) {
        CGSize result = (double *)objc_msgSend((id)objc_msgSend(v1, "container"), "displayScale");
      }
      else {
        CGSize result = (double *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42D90], "mainScreen"), "scale");
      }
      *((void *)v1 + 18) = v2;
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
  -[NUIBoxArrangement _cacheDisplayScaleIfNeeded]((double *)self);
  _NUIBoxArrangement::resetForInvalidation(&self->_arrangement, 0);
  v11.double width = width;
  v11.double height = height;
  _NUIBoxArrangement::measureCells(&self->_arrangement, v11);
  self->_bounds.origin.double x = x;
  self->_bounds.origin.double y = y;
  self->_bounds.size.double width = width;
  self->_bounds.size.double height = height;
  _NUIBoxArrangement::positionCells((uint64_t)&self->_arrangement, (uint64_t)a4, x, y, width, height);
}

- (CGSize)contentLayoutSizeFittingSize:(CGSize)a3 forArrangedSubview:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  CGFloat v7 = [(NUIBoxArrangement *)self container];
  -[NUIArrangementContainer contentLayoutSizeFittingSize:forArrangedSubview:](v7, "contentLayoutSizeFittingSize:forArrangedSubview:", a4, width, height);
  result.double height = v9;
  result.double width = v8;
  return result;
}

- (CGRect)layoutFrameForArrangedSubview:(id)a3 withProposedContentFrame:(CGRect)a4
{
  -[NUIArrangementContainer layoutFrameForArrangedSubview:withProposedContentFrame:]([(NUIBoxArrangement *)self container], "layoutFrameForArrangedSubview:withProposedContentFrame:", a3, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
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
  if ((*(unsigned char *)&self->_flags & 1) != 0
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
  v4 = self->_arrangement.cells.__begin_;
  if (v4)
  {
    self->_arrangement.cells.__end_ = v4;
    operator delete(v4);
  }
}

- (id).cxx_construct
{
  return self;
}

@end