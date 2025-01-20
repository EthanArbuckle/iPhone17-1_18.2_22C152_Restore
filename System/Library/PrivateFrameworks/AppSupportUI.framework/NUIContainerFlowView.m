@interface NUIContainerFlowView
+ (id)containerFlowViewWithArrangedSubviews:(id)a3;
+ (id)containerFlowViewWithNumberOfColumns:(int64_t)a3 arrangedSubviews:(id)a4;
- (BOOL)isLayoutSizeDependentOnPerpendicularAxis;
- (BOOL)respondsToSelector:(SEL)a3;
- (CGSize)calculateArrangedSizeFittingSize:(CGSize)a3;
- (CGSize)fittingSizeForCell:(const _NUIFlowArrangementCell *)a3 withProposedSize:(CGSize)a4;
- (NUIContainerFlowView)initWithArrangedSubviews:(id)a3;
- (NUIContainerFlowView)initWithFrame:(CGRect)a3;
- (_WORD)_effectiveAlignmentForArrangedSubview:(uint64_t)a3 inAxis:;
- (double)_calculateArrangedSizeFittingSize:(CGFloat)a3 forLayout:(CGFloat)a4;
- (double)itemSpacing;
- (double)itemWidth;
- (double)rowHeight;
- (double)rowSpacing;
- (id).cxx_construct;
- (id)arrangedDebugDescription;
- (id)calculateViewForFirstBaselineLayout;
- (id)calculateViewForLastBaselineLayout;
- (id)debugDictionary;
- (int64_t)alignmentForCell:(const _NUIFlowArrangementCell *)a3 inAxis:(int64_t)a4;
- (int64_t)distributionForRowAtIndex:(int64_t)a3 ofTotalRowCount:(int64_t)a4 withCells:(const void *)a5;
- (int64_t)horizontalAlignment;
- (int64_t)horizontalDistribution;
- (int64_t)numberOfColumns;
- (int64_t)verticalAlignment;
- (int64_t)verticalDistribution;
- (void)dealloc;
- (void)invalidateInternalStateForInvalidation:(int64_t)a3;
- (void)layoutArrangedSubviewsInBounds:(CGRect)a3;
- (void)populateFlowArrangementCells:(void *)a3;
- (void)setHorizontalAlignment:(int64_t)a3;
- (void)setHorizontalDistribution:(int64_t)a3;
- (void)setItemSpacing:(double)a3;
- (void)setItemWidth:(double)a3;
- (void)setNumberOfColumns:(int64_t)a3;
- (void)setRowHeight:(double)a3;
- (void)setRowSpacing:(double)a3;
- (void)setVerticalAlignment:(int64_t)a3;
- (void)setVerticalDistribution:(int64_t)a3;
@end

@implementation NUIContainerFlowView

+ (id)containerFlowViewWithArrangedSubviews:(id)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithArrangedSubviews:a3];
  return v3;
}

+ (id)containerFlowViewWithNumberOfColumns:(int64_t)a3 arrangedSubviews:(id)a4
{
  v5 = (void *)[objc_alloc((Class)a1) initWithArrangedSubviews:a4];
  [v5 setNumberOfColumns:a3];
  [v5 setHorizontalDistribution:3];
  return v5;
}

- (NUIContainerFlowView)initWithFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NUIContainerFlowView;
  result = -[NUIContainerView initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
  {
    result->_arrangement.container = (_NUIFlowArrangementContainer *)result;
    *(_WORD *)&result->_flowFlags = *((unsigned __int8 *)&result->_flowFlags + 1) << 8;
    *((unsigned char *)&result->_flowFlags + 1) = 2;
  }
  return result;
}

- (NUIContainerFlowView)initWithArrangedSubviews:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NUIContainerFlowView;
  result = [(NUIContainerView *)&v4 initWithArrangedSubviews:a3];
  if (result)
  {
    result->_arrangement.container = (_NUIFlowArrangementContainer *)result;
    *(_WORD *)&result->_flowFlags = *((unsigned __int8 *)&result->_flowFlags + 1) << 8;
    *((unsigned char *)&result->_flowFlags + 1) = 2;
  }
  return result;
}

- (void)dealloc
{
  _NUIFlowArrangement::resetForInvalidation(&self->_arrangement, -1);
  v3.receiver = self;
  v3.super_class = (Class)NUIContainerFlowView;
  [(NUIContainerView *)&v3 dealloc];
}

- (int64_t)numberOfColumns
{
  return self->_arrangement.columns;
}

- (void)setNumberOfColumns:(int64_t)a3
{
  if (self->_arrangement.columns != a3)
  {
    self->_arrangement.columns = (int)a3;
    [(NUIContainerView *)self setNeedsInvalidation:2];
  }
}

- (int64_t)horizontalAlignment
{
  return (int64_t)self->_flowFlags;
}

- (void)setHorizontalAlignment:(int64_t)a3
{
  __int16 flowFlags = (__int16)self->_flowFlags;
  if ((char)flowFlags != a3)
  {
    *(_WORD *)&self->___int16 flowFlags = flowFlags & 0xFF00 | a3;
    [(NUIContainerView *)self setNeedsInvalidation:1];
  }
}

- (int64_t)verticalAlignment
{
  return (int64_t)self->_flowFlags;
}

- (void)setVerticalAlignment:(int64_t)a3
{
  if ((uint64_t)*(_WORD *)&self->_flowFlags >> 8 != a3)
  {
    *(_WORD *)&self->___int16 flowFlags = *(_WORD *)&self->_flowFlags | (unsigned __int16)((_WORD)a3 << 8);
    [(NUIContainerView *)self setNeedsInvalidation:1];
  }
}

- (int64_t)alignmentForCell:(const _NUIFlowArrangementCell *)a3 inAxis:(int64_t)a4
{
  int64_t result = -[NUIContainerView alignmentForView:inAxis:](self, "alignmentForView:inAxis:", a3->var0);
  if (result == -1)
  {
    if (a4)
    {
      return [(NUIContainerFlowView *)self verticalAlignment];
    }
    else
    {
      return [(NUIContainerFlowView *)self horizontalAlignment];
    }
  }
  return result;
}

- (int64_t)horizontalDistribution
{
  return *((char *)&self->_arrangement + 8);
}

- (void)setHorizontalDistribution:(int64_t)a3
{
  __int16 v3 = *((_WORD *)&self->_arrangement + 4);
  if ((char)v3 != a3)
  {
    *((_WORD *)&self->_arrangement + 4) = v3 & 0xFF00 | a3;
    [(NUIContainerView *)self setNeedsInvalidation:4];
  }
}

- (int64_t)verticalDistribution
{
  return *((char *)&self->_arrangement + 9);
}

- (void)setVerticalDistribution:(int64_t)a3
{
  if ((uint64_t)*((__int16 *)&self->_arrangement + 4) >> 8 != a3)
  {
    *((_WORD *)&self->_arrangement + 4) = *((_WORD *)&self->_arrangement + 4) | (unsigned __int16)((_WORD)a3 << 8);
    [(NUIContainerView *)self setNeedsInvalidation:1];
  }
}

- (double)itemSpacing
{
  return self->_arrangement.itemSpacing;
}

- (void)setItemSpacing:(double)a3
{
  if (self->_arrangement.itemSpacing != a3)
  {
    self->_arrangement.itemSpacing = a3;
    [(NUIContainerView *)self setNeedsInvalidation:2];
  }
}

- (double)rowSpacing
{
  return self->_arrangement.rowSpacing;
}

- (void)setRowSpacing:(double)a3
{
  if (self->_arrangement.rowSpacing != a3)
  {
    self->_arrangement.rowSpacing = a3;
    [(NUIContainerView *)self setNeedsInvalidation:2];
  }
}

- (double)itemWidth
{
  return self->_arrangement.itemWidth;
}

- (void)setItemWidth:(double)a3
{
  if (self->_arrangement.itemWidth != a3)
  {
    self->_arrangement.itemWidth = a3;
    [(NUIContainerView *)self setNeedsInvalidation:2];
  }
}

- (double)rowHeight
{
  return self->_arrangement.rowHeight;
}

- (void)setRowHeight:(double)a3
{
  if (self->_arrangement.rowHeight != a3)
  {
    self->_arrangement.rowHeight = a3;
    [(NUIContainerView *)self setNeedsInvalidation:2];
  }
}

- (BOOL)isLayoutSizeDependentOnPerpendicularAxis
{
  if (!self->_arrangement.columns) {
    return 1;
  }
  v3.receiver = self;
  v3.super_class = (Class)NUIContainerFlowView;
  return [(NUIContainerView *)&v3 isLayoutSizeDependentOnPerpendicularAxis];
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
        v9 = *(NUIContainerFlowView **)(*((void *)&v12 + 1) + 8 * i);
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
        v9 = *(NUIContainerFlowView **)(*((void *)&v12 + 1) + 8 * i);
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

- (_WORD)_effectiveAlignmentForArrangedSubview:(uint64_t)a3 inAxis:
{
  if (result)
  {
    uint64_t v4 = result;
    int64_t result = (_WORD *)[result alignmentForView:a2 inAxis:a3];
    if (result == (_WORD *)-1)
    {
      __int16 v5 = v4[352];
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

- (void)populateFlowArrangementCells:(void *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  __int16 v5 = [(NUIContainerView *)self visibleArrangedSubviews];
  *((void *)a3 + 1) = *(void *)a3;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v26;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v29 = 0;
        uint64_t v29 = *(void *)(*((void *)&v25 + 1) + 8 * v9);
        if (_NUIIsDebuggerAttached())
        {
          [(NUIContainerView *)self minimumSpacingAdjacentToView:v29];
          double v11 = v10;
          double v13 = v12;
          double v15 = v14;
          if (!NUIContainerViewLengthIsDefault(v16)
            || !NUIContainerViewLengthIsDefault(v11)
            || !NUIContainerViewLengthIsDefault(v13)
            || !NUIContainerViewLengthIsDefault(v15))
          {
            uint64_t v17 = _NUILog();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
              [(NUIContainerFlowView *)&buf populateFlowArrangementCells:v17];
            }
          }
        }
        uint64_t v22 = 0;
        if (self)
        {
          int64_t flowFlags = [(NUIContainerView *)self alignmentForView:v29 inAxis:0];
          if (flowFlags == -1) {
            int64_t flowFlags = (int64_t)self->_flowFlags;
          }
          int64_t v19 = -[NUIContainerView alignmentForView:inAxis:](self, "alignmentForView:inAxis:", v29, 1, 0, flowFlags);
          if (v19 == -1) {
            int64_t v19 = *((char *)&self->_flowFlags + 1);
          }
        }
        else
        {
          int64_t v19 = 0;
        }
        int64_t v21 = v19;
        std::vector<_NUIFlowArrangementCell>::emplace_back<UIView *&,NUIContainerAlignment &,NUIContainerAlignment &>((void **)a3, &v29, &v22, &v21);
        ++v9;
      }
      while (v7 != v9);
      uint64_t v20 = [(NSArray *)v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
      uint64_t v7 = v20;
    }
    while (v20);
  }
}

- (void)invalidateInternalStateForInvalidation:(int64_t)a3
{
}

- (double)_calculateArrangedSizeFittingSize:(CGFloat)a3 forLayout:(CGFloat)a4
{
  if (!a1) {
    return 0.0;
  }
  do
  {
    _NUIFlowArrangement::resetForInvalidation((_NUIFlowArrangement *)(a1 + 544), 0);
    v11.width = a3;
    v11.height = a4;
    _NUIFlowArrangement::measureCells((_NUIFlowArrangement *)(a1 + 544), a2, v11);
    double v9 = v8;
  }
  while (([(id)a1 mustRestartMeasurement] & 1) != 0);
  return v9;
}

- (CGSize)calculateArrangedSizeFittingSize:(CGSize)a3
{
  double v3 = [(NUIContainerFlowView *)(uint64_t)self _calculateArrangedSizeFittingSize:a3.width forLayout:a3.height];
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
  [(NUIContainerFlowView *)(uint64_t)self _calculateArrangedSizeFittingSize:a3.size.width forLayout:a3.size.height];
  _NUIFlowArrangement::positionCells((uint64_t)&self->_arrangement, (uint64_t)&__block_literal_global_4, x, y, width, height);
}

uint64_t __55__NUIContainerFlowView_layoutArrangedSubviewsInBounds___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setUntransformedFrame:");
}

- (id)arrangedDebugDescription
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v20.receiver = self;
  v20.super_class = (Class)NUIContainerFlowView;
  double v15 = (void *)[MEMORY[0x1E4F28E78] stringWithFormat:@"%@ alignments = ", -[NUIContainerView arrangedDebugDescription](&v20, sel_arrangedDebugDescription)];
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
          int64_t flowFlags = [(NUIContainerView *)self alignmentForView:*(void *)(*((void *)&v16 + 1) + 8 * v6) inAxis:0];
          if (flowFlags == -1) {
            int64_t flowFlags = (int64_t)self->_flowFlags;
          }
        }
        else
        {
          int64_t flowFlags = 0;
        }
        if (NUIStringFromAlignment(NUIContainerAlignment)::onceToken != -1) {
          dispatch_once(&NUIStringFromAlignment(NUIContainerAlignment)::onceToken, &__block_literal_global_162);
        }
        uint64_t v9 = objc_msgSend((id)NUIStringFromAlignment(NUIContainerAlignment)::dict, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", flowFlags));
        if (!v9) {
          uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"Unknown(%ld)", flowFlags);
        }
        if (self)
        {
          int64_t v10 = [(NUIContainerView *)self alignmentForView:v7 inAxis:1];
          if (v10 == -1) {
            int64_t v10 = *((char *)&self->_flowFlags + 1);
          }
        }
        else
        {
          int64_t v10 = 0;
        }
        if (NUIStringFromAlignment(NUIContainerAlignment)::onceToken != -1) {
          dispatch_once(&NUIStringFromAlignment(NUIContainerAlignment)::onceToken, &__block_literal_global_162);
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
  v9.super_class = (Class)NUIContainerFlowView;
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithDictionary:", -[NUIContainerView debugDictionary](&v9, sel_debugDictionary));
  v10[0] = @"horizontal";
  uint64_t flowFlags = (uint64_t)self->_flowFlags;
  if (NUIStringFromAlignment(NUIContainerAlignment)::onceToken != -1) {
    dispatch_once(&NUIStringFromAlignment(NUIContainerAlignment)::onceToken, &__block_literal_global_162);
  }
  uint64_t v5 = objc_msgSend((id)NUIStringFromAlignment(NUIContainerAlignment)::dict, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", flowFlags));
  if (!v5) {
    uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"Unknown(%ld)", flowFlags);
  }
  v10[1] = @"vertical";
  v11[0] = v5;
  uint64_t v6 = *((char *)&self->_flowFlags + 1);
  if (NUIStringFromAlignment(NUIContainerAlignment)::onceToken != -1) {
    dispatch_once(&NUIStringFromAlignment(NUIContainerAlignment)::onceToken, &__block_literal_global_162);
  }
  uint64_t v7 = objc_msgSend((id)NUIStringFromAlignment(NUIContainerAlignment)::dict, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", v6));
  if (!v7) {
    uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"Unknown(%ld)", v6);
  }
  v11[1] = v7;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v11, v10, 2), @"alignmnets");
  [v3 setObject:_NUIFlowArrangement::debugDictionary(&self->_arrangement) forKeyedSubscript:@"arrangement"];
  return (id)[v3 copy];
}

- (BOOL)respondsToSelector:(SEL)a3
{
  if (sel_fittingSizeForCell_withProposedSize_ == a3)
  {
    uint64_t v4 = sel_fittingSizeForFlowPositioningOfArrangedSubview_withProposedSize_;
  }
  else
  {
    if (sel_distributionForRowAtIndex_ofTotalRowCount_withCells_ != a3)
    {
      v6.receiver = self;
      v6.super_class = (Class)NUIContainerFlowView;
      return -[NUIContainerFlowView respondsToSelector:](&v6, sel_respondsToSelector_);
    }
    uint64_t v4 = sel_distributionForRowAtIndex_ofTotalRowCount_withArrangedSubviews_;
  }
  uint64_t v5 = [(NUIContainerFlowView *)self methodForSelector:v4];
  return v5 != [(id)objc_opt_class() instanceMethodForSelector:v4];
}

- (CGSize)fittingSizeForCell:(const _NUIFlowArrangementCell *)a3 withProposedSize:(CGSize)a4
{
  -[NUIContainerFlowView fittingSizeForFlowPositioningOfArrangedSubview:withProposedSize:](self, "fittingSizeForFlowPositioningOfArrangedSubview:withProposedSize:", a3->var0, a4.width, a4.height);
  result.double height = v5;
  result.double width = v4;
  return result;
}

- (int64_t)distributionForRowAtIndex:(int64_t)a3 ofTotalRowCount:(int64_t)a4 withCells:(const void *)a5
{
  v14[1] = *MEMORY[0x1E4F143B8];
  objc_super v9 = *(void **)a5;
  double v8 = (void *)*((void *)a5 + 1);
  ((void (*)())MEMORY[0x1F4188790])();
  uint64_t v11 = (char *)v14 - v10;
  for (uint64_t i = 0; v9 != v8; v9 += 8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      *(void *)&v11[8 * i++] = *v9;
    }
  }
  return -[NUIContainerFlowView distributionForRowAtIndex:ofTotalRowCount:withArrangedSubviews:](self, "distributionForRowAtIndex:ofTotalRowCount:withArrangedSubviews:", a3, a4, [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:i]);
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  return self;
}

- (void)populateFlowArrangementCells:(os_log_t)log .cold.1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *uint8_t buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&dword_1AE653000, log, OS_LOG_TYPE_DEBUG, "Non default minimum spacing adjecent to arranged subview is not yet supported by NUIContainerFlowView.", buf, 2u);
}

@end