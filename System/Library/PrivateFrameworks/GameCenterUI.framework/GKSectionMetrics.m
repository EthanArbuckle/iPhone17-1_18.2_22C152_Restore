@interface GKSectionMetrics
+ (id)metricsForIdiom:(int64_t)a3;
- (BOOL)incrementalRevealConsumesPadding;
- (BOOL)isEqual:(id)a3;
- (BOOL)sectionHeadersShouldPin;
- (BOOL)shouldAlwaysIncludeShowMore;
- (BOOL)shouldShowSectionHeadersWhenNoItems;
- (BOOL)useViewSizeForFlowMaxColumnCount;
- (CGSize)itemSizeForCollectionView:(id)a3;
- (GKSectionMetrics)init;
- (GKSectionMetrics)initWithIdiom:(int64_t)a3;
- (NSDictionary)itemHeightList;
- (UIEdgeInsets)padding;
- (double)calculatedItemHeight;
- (double)calculatedItemHeightCache;
- (double)desiredItemHeight;
- (double)desiredItemWidth;
- (double)flowColumnWidth;
- (double)interitemSpacing;
- (double)lineSpacing;
- (double)marginBetweenItems;
- (double)sectionHeaderHeight;
- (double)showMoreHeight;
- (id)copyWithZone:(_NSZone *)a3;
- (id)localDescription;
- (unint64_t)alignment;
- (unint64_t)flowMaxColumnCount;
- (unint64_t)flowMaxColumnCountForViewWidth:(double)a3;
- (unint64_t)incrementalRevealItemCount;
- (unint64_t)lastLineItemAlignment;
- (unint64_t)maximumVisibleItemCount;
- (void)setAlignment:(unint64_t)a3;
- (void)setCalculatedItemHeightCache:(double)a3;
- (void)setDesiredItemHeight:(double)a3;
- (void)setDesiredItemWidth:(double)a3;
- (void)setFlowColumnWidth:(double)a3;
- (void)setFlowMaxColumnCount:(unint64_t)a3;
- (void)setIncrementalRevealConsumesPadding:(BOOL)a3;
- (void)setIncrementalRevealItemCount:(unint64_t)a3;
- (void)setInteritemSpacing:(double)a3;
- (void)setItemHeightList:(id)a3;
- (void)setLastLineItemAlignment:(unint64_t)a3;
- (void)setLineSpacing:(double)a3;
- (void)setMarginBetweenItems:(double)a3;
- (void)setMaximumVisibleItemCount:(unint64_t)a3;
- (void)setPadding:(UIEdgeInsets)a3;
- (void)setSectionHeaderHeight:(double)a3;
- (void)setSectionHeadersShouldPin:(BOOL)a3;
- (void)setShouldAlwaysIncludeShowMore:(BOOL)a3;
- (void)setShouldShowSectionHeadersWhenNoItems:(BOOL)a3;
- (void)setShowMoreHeight:(double)a3;
- (void)setUseViewSizeForFlowMaxColumnCount:(BOOL)a3;
@end

@implementation GKSectionMetrics

+ (id)metricsForIdiom:(int64_t)a3
{
  v3 = (void *)[objc_alloc((Class)objc_opt_class()) initWithIdiom:a3];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GKSectionMetrics;
  id v4 = [(GKGridLayoutMetrics *)&v7 copyWithZone:a3];
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setPadding:", self->_padding.top, self->_padding.left, self->_padding.bottom, self->_padding.right);
    [v5 setAlignment:self->_alignment];
    [v5 setLineSpacing:self->_lineSpacing];
    [v5 setInteritemSpacing:self->_interitemSpacing];
    [v5 setDesiredItemWidth:self->_desiredItemWidth];
    [v5 setDesiredItemHeight:self->_desiredItemHeight];
    [v5 setFlowColumnWidth:self->_flowColumnWidth];
    [v5 setFlowMaxColumnCount:self->_flowMaxColumnCount];
    [v5 setUseViewSizeForFlowMaxColumnCount:self->_useViewSizeForFlowMaxColumnCount];
    [v5 setItemHeightList:self->_itemHeightList];
    [v5 setLastLineItemAlignment:self->_lastLineItemAlignment];
    [v5 setMaximumVisibleItemCount:self->_maximumVisibleItemCount];
    [v5 setIncrementalRevealItemCount:self->_incrementalRevealItemCount];
    [v5 setIncrementalRevealConsumesPadding:self->_incrementalRevealConsumesPadding];
    [v5 setShouldAlwaysIncludeShowMore:self->_shouldAlwaysIncludeShowMore];
    [v5 setMarginBetweenItems:self->_marginBetweenItems];
    [v5 setShouldShowSectionHeadersWhenNoItems:self->_shouldShowSectionHeadersWhenNoItems];
  }
  return v5;
}

- (GKSectionMetrics)init
{
  v3 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if (v4 == 1)
  {
    if (*MEMORY[0x1E4F63830]) {
      BOOL v5 = *MEMORY[0x1E4F63A38] == 0;
    }
    else {
      BOOL v5 = 0;
    }
    uint64_t v6 = !v5;
  }
  else
  {
    uint64_t v6 = 0;
  }

  return [(GKSectionMetrics *)self initWithIdiom:v6];
}

- (GKSectionMetrics)initWithIdiom:(int64_t)a3
{
  v15.receiver = self;
  v15.super_class = (Class)GKSectionMetrics;
  uint64_t v4 = [(GKGridLayoutMetrics *)&v15 init];
  BOOL v5 = v4;
  if (v4)
  {
    v4->_desiredItemWidth = 1.79769313e308;
    v4->_flowColumnWidth = 1.79769313e308;
    v4->_lastLineItemAlignment = 0;
    v4->_alignment = 1;
    v4->_maximumVisibleItemCount = -1;
    v4->_incrementalRevealItemCount = 3;
    v4->_incrementalRevealConsumesPadding = 1;
    v4->_marginBetweenItems = 20.0;
    uint64_t v6 = +[GKSupplementaryViewMetrics supplementaryMetrics];
    [v6 setKind:@"SectionHeader"];
    [v6 setShouldPin:1];
    objc_super v7 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v7 scale];
    double v9 = v8;

    p_top = &v5->_padding.top;
    *(void *)&v5->_desiredItemHeight = qword_1AF7CABB0[a3 == 1];
    if (a3 == 1)
    {
      double *p_top = 22.0;
      v5->_padding.left = 0.0;
      v5->_padding.bottom = 0.0;
      v5->_padding.right = 0.0;
      double v11 = dbl_1AF7CABC0[v9 > 1.0];
    }
    else
    {
      double v12 = 8.0;
      if (v9 > 1.0) {
        double v12 = 7.5;
      }
      double *p_top = v12;
      v5->_padding.left = 0.0;
      v5->_padding.bottom = v12;
      v5->_padding.right = 0.0;
      double v11 = 35.0;
    }
    [v6 setDesiredHeight:v11];
    [(GKGridLayoutMetrics *)v5 addSupplementaryMetrics:v6 forKey:@"HeaderMetricKey" atLocation:0];
    v13 = +[GKSupplementaryViewMetrics supplementaryMetrics];
    [v13 setKind:@"IncrementalReveal"];
    [v13 setDesiredHeight:v5->_desiredItemHeight];
    [(GKGridLayoutMetrics *)v5 insertSupplementaryMetrics:v13 forKey:@"ShowMoreMetricKey" atLocation:1];
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v5 = (float64x2_t *)v4;
    uint64_t v6 = v5;
    v11 = (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_padding.top, v5[9]), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_padding.bottom, v5[10]))), 0xFuLL))) & 1) != 0&& self->_alignment == *(void *)&v5[2].f64[1]&& self->_lineSpacing == v5[3].f64[0]&& self->_interitemSpacing == v5[3].f64[1]&& ([(GKSectionMetrics *)self calculatedItemHeight], double v8 = v7, [(float64x2_t *)v6 calculatedItemHeight], v8 == v9)&& self->_desiredItemWidth == v6[4].f64[1]&& self->_flowColumnWidth == v6[5].f64[0]&& self->_flowMaxColumnCount == *(void *)&v6[5].f64[1]&& self->_useViewSizeForFlowMaxColumnCount == LOBYTE(v6[2].f64[0])&& (itemHeightList = self->_itemHeightList, itemHeightList == *(NSDictionary **)&v6[6].f64[1])&& ([(NSDictionary *)itemHeightList isEqual:self->_itemHeightList] & 1) == 0
       && self->_lastLineItemAlignment == *(void *)&v6[7].f64[0]
       && self->_maximumVisibleItemCount == *(void *)&v6[7].f64[1]
       && self->_incrementalRevealItemCount == *(void *)&v6[8].f64[0]
       && self->_incrementalRevealConsumesPadding == BYTE1(v6[2].f64[0])
       && self->_shouldAlwaysIncludeShowMore == BYTE2(v6[2].f64[0])
       && self->_shouldShowSectionHeadersWhenNoItems == BYTE3(v6[2].f64[0]);
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (id)localDescription
{
  p_padding = (float64x2_t *)&self->_padding;
  id v4 = NSStringFromUIEdgeInsets(self->_padding);
  if (self->_desiredItemWidth == 1.79769313e308)
  {
    BOOL v5 = @"inf";
  }
  else
  {
    objc_msgSend(NSNumber, "numberWithDouble:");
    BOOL v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v25 = v5;
  if (self->_desiredItemHeight == 1.79769313e308)
  {
    v29 = @"inf";
  }
  else
  {
    objc_msgSend(NSNumber, "numberWithDouble:");
    v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v6 = (void *)0x1E4F29000;
  double v7 = NSString;
  uint64_t v8 = objc_opt_class();
  unint64_t lastLineItemAlignment = self->_lastLineItemAlignment;
  unint64_t alignment = self->_alignment;
  unint64_t maximumVisibleItemCount = self->_maximumVisibleItemCount;
  if (maximumVisibleItemCount)
  {
    objc_msgSend(NSString, "stringWithFormat:", @" maxVisItems:%ld", self->_maximumVisibleItemCount);
    v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v28 = &stru_1F07B2408;
  }
  unint64_t incrementalRevealItemCount = self->_incrementalRevealItemCount;
  if (incrementalRevealItemCount)
  {
    objc_msgSend(NSString, "stringWithFormat:", @" incReveal:%ld", self->_incrementalRevealItemCount);
    v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v27 = &stru_1F07B2408;
  }
  double lineSpacing = self->_lineSpacing;
  if (lineSpacing <= 0.0)
  {
    v26 = &stru_1F07B2408;
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @" lineSpacing:%f", *(void *)&lineSpacing);
    v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  double interitemSpacing = self->_interitemSpacing;
  uint64_t v22 = v8;
  if (interitemSpacing <= 0.0)
  {
    v13 = &stru_1F07B2408;
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @" interitemSpacing:%f ", *(void *)&interitemSpacing);
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  double flowColumnWidth = self->_flowColumnWidth;
  double desiredItemWidth = self->_desiredItemWidth;
  if (flowColumnWidth == desiredItemWidth)
  {
    v17 = &stru_1F07B2408;
  }
  else
  {
    v16 = NSString;
    uint64_t v6 = [NSNumber numberWithDouble:self->_flowColumnWidth];
    v17 = [v16 stringWithFormat:@"flowWidth:%@", v6];
  }
  if (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*p_padding, *MEMORY[0x1E4FB2848]), (int32x4_t)vceqq_f64(p_padding[1], *(float64x2_t *)(MEMORY[0x1E4FB2848] + 16)))), 0xFuLL))))
  {
    v19 = v25;
    v20 = [v7 stringWithFormat:@"<%@: %p> align:%ld lastAlign:%ld %@%@%@%@ size:{%@, %@}%@%@", v22, self, alignment, lastLineItemAlignment, v28, v27, v26, v13, v25, v29, v17, &stru_1F07B2408];
  }
  else
  {
    v18 = [NSString stringWithFormat:@" pad:%@", v4];
    v19 = v25;
    v20 = [v7 stringWithFormat:@"<%@: %p> align:%ld lastAlign:%ld %@%@%@%@ size:{%@, %@}%@%@", v22, self, alignment, lastLineItemAlignment, v28, v27, v26, v13, v25, v29, v17, v18];
  }
  if (flowColumnWidth != desiredItemWidth)
  {
  }
  if (interitemSpacing > 0.0) {

  }
  if (lineSpacing > 0.0) {
  if (incrementalRevealItemCount)
  }

  if (maximumVisibleItemCount) {

  }
  return v20;
}

- (double)sectionHeaderHeight
{
  v2 = [(GKGridLayoutMetrics *)self supplementaryMetricsForKey:@"HeaderMetricKey"];
  v3 = v2;
  if (v2)
  {
    [v2 desiredHeight];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.0;
  }

  return v5;
}

- (void)setSectionHeaderHeight:(double)a3
{
  double v4 = [(GKGridLayoutMetrics *)self supplementaryMetricsForKey:@"HeaderMetricKey"];
  id v10 = v4;
  if (!v4)
  {
    double v5 = NSString;
    uint64_t v6 = [NSString stringWithFormat:@"Assertion failed"];
    double v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKGridLayoutMetrics.m"];
    id v8 = [v7 lastPathComponent];
    double v9 = [v5 stringWithFormat:@"%@ (metrics != ((void *)0))\n[%s (%s:%d)]", v6, "-[GKSectionMetrics setSectionHeaderHeight:]", objc_msgSend(v8, "UTF8String"), 515];

    [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v9 format];
    double v4 = 0;
  }
  [v4 setDesiredHeight:a3];
}

- (double)showMoreHeight
{
  v2 = [(GKGridLayoutMetrics *)self supplementaryMetricsForKey:@"ShowMoreMetricKey"];
  v3 = v2;
  if (v2)
  {
    [v2 desiredHeight];
    double v5 = v4;
  }
  else
  {
    double v5 = 0.0;
  }

  return v5;
}

- (void)setShowMoreHeight:(double)a3
{
  double v4 = [(GKGridLayoutMetrics *)self supplementaryMetricsForKey:@"ShowMoreMetricKey"];
  id v10 = v4;
  if (!v4)
  {
    double v5 = NSString;
    uint64_t v6 = [NSString stringWithFormat:@"Assertion failed"];
    double v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKGridLayoutMetrics.m"];
    id v8 = [v7 lastPathComponent];
    double v9 = [v5 stringWithFormat:@"%@ (metrics != ((void *)0))\n[%s (%s:%d)]", v6, "-[GKSectionMetrics setShowMoreHeight:]", objc_msgSend(v8, "UTF8String"), 528];

    [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v9 format];
    double v4 = 0;
  }
  [v4 setDesiredHeight:a3];
}

- (BOOL)sectionHeadersShouldPin
{
  v2 = [(GKGridLayoutMetrics *)self supplementaryMetricsForKey:@"HeaderMetricKey"];
  v3 = v2;
  if (v2) {
    char v4 = [v2 shouldPin];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (void)setSectionHeadersShouldPin:(BOOL)a3
{
  BOOL v3 = a3;
  char v4 = [(GKGridLayoutMetrics *)self supplementaryMetricsForKey:@"HeaderMetricKey"];
  id v10 = v4;
  if (!v4)
  {
    double v5 = NSString;
    uint64_t v6 = [NSString stringWithFormat:@"Assertion failed"];
    double v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKGridLayoutMetrics.m"];
    id v8 = [v7 lastPathComponent];
    double v9 = [v5 stringWithFormat:@"%@ (metrics != ((void *)0))\n[%s (%s:%d)]", v6, "-[GKSectionMetrics setSectionHeadersShouldPin:]", objc_msgSend(v8, "UTF8String"), 541];

    [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v9 format];
    char v4 = 0;
  }
  [v4 setShouldPin:v3];
}

- (void)setItemHeightList:(id)a3
{
  double v5 = (NSDictionary *)a3;
  p_itemHeightList = &self->_itemHeightList;
  if (self->_itemHeightList != v5)
  {
    double v7 = v5;
    objc_storeStrong((id *)p_itemHeightList, a3);
    double v5 = v7;
    self->_calculatedItemHeightCache = 0.0;
  }

  MEMORY[0x1F41817F8](p_itemHeightList, v5);
}

- (double)calculatedItemHeight
{
  uint64_t v8 = 0;
  double v9 = (double *)&v8;
  double desiredItemHeight = self->_desiredItemHeight;
  uint64_t v10 = 0x2020000000;
  double calculatedItemHeightCache = desiredItemHeight;
  itemHeightList = self->_itemHeightList;
  if (itemHeightList)
  {
    double desiredItemHeight = self->_calculatedItemHeightCache;
    if (desiredItemHeight <= 0.0)
    {
      double calculatedItemHeightCache = 0.0;
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __40__GKSectionMetrics_calculatedItemHeight__block_invoke;
      v7[3] = &unk_1E5F63878;
      v7[4] = &v8;
      [(NSDictionary *)itemHeightList enumerateKeysAndObjectsUsingBlock:v7];
      double v5 = v9;
      self->_double calculatedItemHeightCache = v9[3];
      double desiredItemHeight = v5[3];
    }
    else
    {
      double calculatedItemHeightCache = self->_calculatedItemHeightCache;
    }
  }
  _Block_object_dispose(&v8, 8);
  return desiredItemHeight;
}

void __40__GKSectionMetrics_calculatedItemHeight__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  if ([v12 isEqualToString:@"GKFixedHeightSentinel"])
  {
    [v5 doubleValue];
    double v7 = v6;
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F639F8];
    [v5 doubleValue];
    double v10 = v9;

    [v8 scaledValueFromHISpecLeading:v12 forFontTextStyle:v10];
    double v7 = v11;
  }
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v7
                                                              + *(double *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                          + 24);
}

- (unint64_t)flowMaxColumnCountForViewWidth:(double)a3
{
  unint64_t v3 = 2;
  if (a3 <= 507.0) {
    unint64_t v3 = 1;
  }
  if (a3 <= 990.5) {
    return v3;
  }
  else {
    return 3;
  }
}

- (CGSize)itemSizeForCollectionView:(id)a3
{
  id v4 = a3;
  [(GKSectionMetrics *)self calculatedItemHeight];
  double v6 = v5;
  double desiredItemWidth = self->_desiredItemWidth;
  [v4 bounds];
  double v9 = v8;
  double v11 = v10;

  if (desiredItemWidth == 1.79769313e308)
  {
    [(GKSectionMetrics *)self padding];
    double v13 = v12;
    double v15 = v14;
    [(GKSectionMetrics *)self padding];
    double v17 = v16;
    [(GKSectionMetrics *)self padding];
    double desiredItemWidth = v9 - (v17 + v18);
    if (self->_flowColumnWidth != 1.79769313e308)
    {
      [(GKSectionMetrics *)self interitemSpacing];
      double flowColumnWidth = self->_flowColumnWidth;
      float v20 = v9 - (v13 + v15) - flowColumnWidth;
      double v22 = floorf(v20) / (v21 + flowColumnWidth) + 1.0;
      if ((unint64_t)v22 <= 1) {
        unint64_t v23 = 1;
      }
      else {
        unint64_t v23 = (unint64_t)v22;
      }
      if (self->_useViewSizeForFlowMaxColumnCount) {
        unint64_t flowMaxColumnCount = [(GKSectionMetrics *)self flowMaxColumnCountForViewWidth:v9];
      }
      else {
        unint64_t flowMaxColumnCount = self->_flowMaxColumnCount;
      }
      if (v23 <= flowMaxColumnCount || flowMaxColumnCount == 0) {
        unint64_t v26 = v23;
      }
      else {
        unint64_t v26 = flowMaxColumnCount;
      }
      float v27 = desiredItemWidth / (double)v26;
      double desiredItemWidth = floorf(v27);
    }
  }
  if (v6 == 1.79769313e308) {
    double v28 = v11;
  }
  else {
    double v28 = v6;
  }
  double v29 = desiredItemWidth;
  result.height = v28;
  result.width = v29;
  return result;
}

- (UIEdgeInsets)padding
{
  double top = self->_padding.top;
  double left = self->_padding.left;
  double bottom = self->_padding.bottom;
  double right = self->_padding.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setPadding:(UIEdgeInsets)a3
{
  self->_padding = a3;
}

- (unint64_t)alignment
{
  return self->_alignment;
}

- (void)setAlignment:(unint64_t)a3
{
  self->_unint64_t alignment = a3;
}

- (double)lineSpacing
{
  return self->_lineSpacing;
}

- (void)setLineSpacing:(double)a3
{
  self->_double lineSpacing = a3;
}

- (double)interitemSpacing
{
  return self->_interitemSpacing;
}

- (void)setInteritemSpacing:(double)a3
{
  self->_double interitemSpacing = a3;
}

- (double)marginBetweenItems
{
  return self->_marginBetweenItems;
}

- (void)setMarginBetweenItems:(double)a3
{
  self->_marginBetweenItems = a3;
}

- (double)desiredItemWidth
{
  return self->_desiredItemWidth;
}

- (void)setDesiredItemWidth:(double)a3
{
  self->_double desiredItemWidth = a3;
}

- (double)flowColumnWidth
{
  return self->_flowColumnWidth;
}

- (void)setFlowColumnWidth:(double)a3
{
  self->_double flowColumnWidth = a3;
}

- (BOOL)useViewSizeForFlowMaxColumnCount
{
  return self->_useViewSizeForFlowMaxColumnCount;
}

- (void)setUseViewSizeForFlowMaxColumnCount:(BOOL)a3
{
  self->_useViewSizeForFlowMaxColumnCount = a3;
}

- (unint64_t)flowMaxColumnCount
{
  return self->_flowMaxColumnCount;
}

- (void)setFlowMaxColumnCount:(unint64_t)a3
{
  self->_unint64_t flowMaxColumnCount = a3;
}

- (double)desiredItemHeight
{
  return self->_desiredItemHeight;
}

- (void)setDesiredItemHeight:(double)a3
{
  self->_double desiredItemHeight = a3;
}

- (NSDictionary)itemHeightList
{
  return self->_itemHeightList;
}

- (unint64_t)lastLineItemAlignment
{
  return self->_lastLineItemAlignment;
}

- (void)setLastLineItemAlignment:(unint64_t)a3
{
  self->_unint64_t lastLineItemAlignment = a3;
}

- (unint64_t)maximumVisibleItemCount
{
  return self->_maximumVisibleItemCount;
}

- (void)setMaximumVisibleItemCount:(unint64_t)a3
{
  self->_unint64_t maximumVisibleItemCount = a3;
}

- (unint64_t)incrementalRevealItemCount
{
  return self->_incrementalRevealItemCount;
}

- (void)setIncrementalRevealItemCount:(unint64_t)a3
{
  self->_unint64_t incrementalRevealItemCount = a3;
}

- (BOOL)incrementalRevealConsumesPadding
{
  return self->_incrementalRevealConsumesPadding;
}

- (void)setIncrementalRevealConsumesPadding:(BOOL)a3
{
  self->_incrementalRevealConsumesPadding = a3;
}

- (BOOL)shouldAlwaysIncludeShowMore
{
  return self->_shouldAlwaysIncludeShowMore;
}

- (void)setShouldAlwaysIncludeShowMore:(BOOL)a3
{
  self->_shouldAlwaysIncludeShowMore = a3;
}

- (BOOL)shouldShowSectionHeadersWhenNoItems
{
  return self->_shouldShowSectionHeadersWhenNoItems;
}

- (void)setShouldShowSectionHeadersWhenNoItems:(BOOL)a3
{
  self->_shouldShowSectionHeadersWhenNoItems = a3;
}

- (double)calculatedItemHeightCache
{
  return self->_calculatedItemHeightCache;
}

- (void)setCalculatedItemHeightCache:(double)a3
{
  self->_double calculatedItemHeightCache = a3;
}

- (void).cxx_destruct
{
}

@end