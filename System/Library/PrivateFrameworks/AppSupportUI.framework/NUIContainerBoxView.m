@interface NUIContainerBoxView
+ (id)containerBoxViewWithArrangedSubviews:(id)a3;
- (BOOL)needsBaselineDebugBoundingBoxesForArrangedSubview:(id)a3;
- (CGSize)calculateArrangedSizeFittingSize:(CGSize)a3;
- (NUIContainerBoxView)initWithArrangedSubviews:(id)a3;
- (NUIContainerBoxView)initWithFrame:(CGRect)a3;
- (_WORD)_effectiveAlignmentForArrangedSubview:(uint64_t)a3 inAxis:;
- (double)_calculateArrangedSizeFittingSize:(CGFloat)a3 forLayout:;
- (id).cxx_construct;
- (id)arrangedDebugDescription;
- (id)calculateViewForFirstBaselineLayout;
- (id)calculateViewForLastBaselineLayout;
- (id)debugDictionary;
- (int64_t)horizontalAlignment;
- (int64_t)verticalAlignment;
- (void)dealloc;
- (void)invalidateInternalStateForInvalidation:(int64_t)a3;
- (void)layoutArrangedSubviewsInBounds:(CGRect)a3;
- (void)populateBoxArrangementCells:(void *)a3;
- (void)setHorizontalAlignment:(int64_t)a3;
- (void)setVerticalAlignment:(int64_t)a3;
@end

@implementation NUIContainerBoxView

+ (id)containerBoxViewWithArrangedSubviews:(id)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithArrangedSubviews:a3];
  return v3;
}

- (BOOL)needsBaselineDebugBoundingBoxesForArrangedSubview:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NUIContainerBoxView;
  if (-[NUIContainerView needsBaselineDebugBoundingBoxesForArrangedSubview:](&v8, sel_needsBaselineDebugBoundingBoxesForArrangedSubview_))
  {
    return 1;
  }
  if (self)
  {
    int64_t v6 = [(NUIContainerView *)self alignmentForView:a3 inAxis:1];
    if (v6 == -1) {
      int64_t v6 = *((char *)&self->_boxFlags + 1);
    }
  }
  else
  {
    int64_t v6 = 0;
  }
  return v6 == 2 || v6 == 5;
}

- (_WORD)_effectiveAlignmentForArrangedSubview:(uint64_t)a3 inAxis:
{
  if (result)
  {
    v4 = result;
    result = (_WORD *)[result alignmentForView:a2 inAxis:a3];
    if (result == (_WORD *)-1)
    {
      __int16 v5 = v4[328];
      if (a3) {
        return (_WORD *)((uint64_t)v5 >> 8);
      }
      else {
        return (_WORD *)(char)v5;
      }
    }
  }
  return result;
}

- (NUIContainerBoxView)initWithFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NUIContainerBoxView;
  result = -[NUIContainerView initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result) {
    result->_arrangement.container = (_NUIBoxArrangementContainer *)result;
  }
  return result;
}

- (NUIContainerBoxView)initWithArrangedSubviews:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NUIContainerBoxView;
  result = [(NUIContainerView *)&v4 initWithArrangedSubviews:a3];
  if (result) {
    result->_arrangement.container = (_NUIBoxArrangementContainer *)result;
  }
  return result;
}

- (void)dealloc
{
  _NUIBoxArrangement::resetForInvalidation(&self->_arrangement, -1);
  v3.receiver = self;
  v3.super_class = (Class)NUIContainerBoxView;
  [(NUIContainerView *)&v3 dealloc];
}

- (int64_t)horizontalAlignment
{
  return (int64_t)self->_boxFlags;
}

- (void)setHorizontalAlignment:(int64_t)a3
{
  -[NUIContainerView _assertNotInLayoutPass:]((uint64_t)self);
  if (a3 == -1) {
    int64_t v5 = 0;
  }
  else {
    int64_t v5 = a3;
  }
  __int16 boxFlags = (__int16)self->_boxFlags;
  if (v5 != (char)boxFlags)
  {
    *(_WORD *)&self->___int16 boxFlags = boxFlags & 0xFF00 | v5;
    [(NUIContainerView *)self setNeedsInvalidation:4];
  }
}

- (int64_t)verticalAlignment
{
  return *((char *)&self->_boxFlags + 1);
}

- (void)setVerticalAlignment:(int64_t)a3
{
  -[NUIContainerView _assertNotInLayoutPass:]((uint64_t)self);
  if (a3 == -1) {
    int64_t v5 = 0;
  }
  else {
    int64_t v5 = a3;
  }
  if (v5 != *(_WORD *)&self->_boxFlags >> 8)
  {
    *(_WORD *)&self->___int16 boxFlags = *(_WORD *)&self->_boxFlags | (unsigned __int16)((_WORD)v5 << 8);
    [(NUIContainerView *)self setNeedsInvalidation:4];
  }
}

- (id)calculateViewForFirstBaselineLayout
{
  v2 = self;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  objc_super v3 = [(NUIContainerView *)self visibleArrangedSubviews];
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    double v7 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        v9 = *(NUIContainerBoxView **)(*((void *)&v12 + 1) + 8 * i);
        [(UIView *)v9 effectiveFirstBaselineOffsetFromTop];
        if (v10 > v7)
        {
          double v7 = v10;
          v2 = v9;
        }
      }
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
  return v2;
}

- (id)calculateViewForLastBaselineLayout
{
  v2 = self;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  objc_super v3 = [(NSArray *)[(NUIContainerView *)self visibleArrangedSubviews] reverseObjectEnumerator];
  uint64_t v4 = [(NSEnumerator *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    double v7 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        v9 = *(NUIContainerBoxView **)(*((void *)&v12 + 1) + 8 * i);
        [(UIView *)v9 effectiveBaselineOffsetFromBottom];
        if (v10 > v7)
        {
          double v7 = v10;
          v2 = v9;
        }
      }
      uint64_t v5 = [(NSEnumerator *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
  return v2;
}

- (void)populateBoxArrangementCells:(void *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(NUIContainerView *)self visibleArrangedSubviews];
  *((void *)a3 + 1) = *(void *)a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v19 = 0;
        uint64_t v19 = *(void *)(*((void *)&v15 + 1) + 8 * v9);
        uint64_t v14 = 0;
        if (self)
        {
          int64_t boxFlags = -[NUIContainerView alignmentForView:inAxis:](self, "alignmentForView:inAxis:");
          if (boxFlags == -1) {
            int64_t boxFlags = (int64_t)self->_boxFlags;
          }
          int64_t v11 = -[NUIContainerView alignmentForView:inAxis:](self, "alignmentForView:inAxis:", v19, 1, 0, boxFlags);
          if (v11 == -1) {
            int64_t v11 = *((char *)&self->_boxFlags + 1);
          }
        }
        else
        {
          int64_t v11 = 0;
        }
        int64_t v13 = v11;
        std::vector<_NUIBoxArrangementCell>::emplace_back<UIView *&,NUIContainerAlignment &,NUIContainerAlignment &>((void **)a3, &v19, &v14, &v13);
        ++v9;
      }
      while (v7 != v9);
      uint64_t v12 = [(NSArray *)v5 countByEnumeratingWithState:&v15 objects:v20 count:16];
      uint64_t v7 = v12;
    }
    while (v12);
  }
}

- (void)invalidateInternalStateForInvalidation:(int64_t)a3
{
}

- (double)_calculateArrangedSizeFittingSize:(CGFloat)a3 forLayout:
{
  if (!a1) {
    return 0.0;
  }
  do
  {
    _NUIBoxArrangement::resetForInvalidation((_NUIBoxArrangement *)(a1 + 544), 0);
    v8.width = a2;
    v8.height = a3;
    double v6 = _NUIBoxArrangement::measureCells((_NUIBoxArrangement *)(a1 + 544), v8);
  }
  while (([(id)a1 mustRestartMeasurement] & 1) != 0);
  return v6;
}

- (CGSize)calculateArrangedSizeFittingSize:(CGSize)a3
{
  double v3 = -[NUIContainerBoxView _calculateArrangedSizeFittingSize:forLayout:]((uint64_t)self, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutArrangedSubviewsInBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  -[NUIContainerBoxView _calculateArrangedSizeFittingSize:forLayout:]((uint64_t)self, a3.size.width, a3.size.height);
  _NUIBoxArrangement::positionCells((uint64_t)&self->_arrangement, (uint64_t)&__block_literal_global_5, x, y, width, height);
}

uint64_t __54__NUIContainerBoxView_layoutArrangedSubviewsInBounds___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setUntransformedFrame:");
}

- (id)arrangedDebugDescription
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v20.receiver = self;
  v20.super_class = (Class)NUIContainerBoxView;
  long long v15 = (void *)[MEMORY[0x1E4F28E78] stringWithFormat:@"%@ alignments = ", -[NUIContainerView arrangedDebugDescription](&v20, sel_arrangedDebugDescription)];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  obj = [(NUIContainerView *)self visibleArrangedSubviews];
  uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v17;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v16 + 1) + 8 * v6);
        if (self)
        {
          int64_t boxFlags = [(NUIContainerView *)self alignmentForView:*(void *)(*((void *)&v16 + 1) + 8 * v6) inAxis:0];
          if (boxFlags == -1) {
            int64_t boxFlags = (int64_t)self->_boxFlags;
          }
        }
        else
        {
          int64_t boxFlags = 0;
        }
        if (NUIStringFromAlignment(NUIContainerAlignment)::onceToken != -1) {
          dispatch_once(&NUIStringFromAlignment(NUIContainerAlignment)::onceToken, &__block_literal_global_124);
        }
        uint64_t v9 = objc_msgSend((id)NUIStringFromAlignment(NUIContainerAlignment)::dict, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", boxFlags));
        if (!v9) {
          uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"Unknown(%ld)", boxFlags);
        }
        if (self)
        {
          int64_t v10 = [(NUIContainerView *)self alignmentForView:v7 inAxis:1];
          if (v10 == -1) {
            int64_t v10 = *((char *)&self->_boxFlags + 1);
          }
        }
        else
        {
          int64_t v10 = 0;
        }
        if (NUIStringFromAlignment(NUIContainerAlignment)::onceToken != -1) {
          dispatch_once(&NUIStringFromAlignment(NUIContainerAlignment)::onceToken, &__block_literal_global_124);
        }
        uint64_t v11 = objc_msgSend((id)NUIStringFromAlignment(NUIContainerAlignment)::dict, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", v10));
        if (!v11) {
          uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"Unknown(%ld)", v10);
        }
        [v15 appendFormat:@"[%@|%@]", v9, v11];
        ++v6;
      }
      while (v4 != v6);
      uint64_t v12 = [(NSArray *)obj countByEnumeratingWithState:&v16 objects:v21 count:16];
      uint64_t v4 = v12;
    }
    while (v12);
  }
  return (id)[v15 stringByAppendingString:@";"];
}

- (id)debugDictionary
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)NUIContainerBoxView;
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithDictionary:", -[NUIContainerView debugDictionary](&v9, sel_debugDictionary));
  v10[0] = @"horizontal";
  uint64_t boxFlags = (uint64_t)self->_boxFlags;
  if (NUIStringFromAlignment(NUIContainerAlignment)::onceToken != -1) {
    dispatch_once(&NUIStringFromAlignment(NUIContainerAlignment)::onceToken, &__block_literal_global_124);
  }
  uint64_t v5 = objc_msgSend((id)NUIStringFromAlignment(NUIContainerAlignment)::dict, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", boxFlags));
  if (!v5) {
    uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"Unknown(%ld)", boxFlags);
  }
  v10[1] = @"vertical";
  v11[0] = v5;
  uint64_t v6 = *((char *)&self->_boxFlags + 1);
  if (NUIStringFromAlignment(NUIContainerAlignment)::onceToken != -1) {
    dispatch_once(&NUIStringFromAlignment(NUIContainerAlignment)::onceToken, &__block_literal_global_124);
  }
  uint64_t v7 = objc_msgSend((id)NUIStringFromAlignment(NUIContainerAlignment)::dict, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", v6));
  if (!v7) {
    uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"Unknown(%ld)", v6);
  }
  v11[1] = v7;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v11, v10, 2), @"alignmnets");
  [v3 setObject:_NUIBoxArrangement::debugDictionary(&self->_arrangement) forKeyedSubscript:@"arrangement"];
  return (id)[v3 copy];
}

- (void).cxx_destruct
{
  p_arrangement = &self->_arrangement;
  begin = self->_arrangement.viewFrames.__begin_;
  if (begin)
  {
    p_arrangement->viewFrames.__end_ = begin;
    operator delete(begin);
  }
  uint64_t v4 = p_arrangement->cells.__begin_;
  if (v4)
  {
    p_arrangement->cells.__end_ = v4;
    operator delete(v4);
  }
}

- (id).cxx_construct
{
  return self;
}

@end