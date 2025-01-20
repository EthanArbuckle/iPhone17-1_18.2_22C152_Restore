@interface GKSectionPresentationData
- (GKSectionPresentationData)initWithSection:(int64_t)a3 presentationData:(id)a4;
- (double)footerMaxY;
- (double)footerMinY;
- (double)headerMaxY;
- (double)headerMinY;
- (double)itemsMaxY;
- (double)itemsMinY;
- (double)maxY;
- (double)minY;
- (double)showMoreMaxY;
- (id)description;
- (int64_t)section;
- (unint64_t)numFooters;
- (unint64_t)numHeaders;
- (unint64_t)numItems;
- (unint64_t)numOverlays;
- (unint64_t)overlayOffset;
- (void)setFooterMaxY:(double)a3;
- (void)setFooterMinY:(double)a3;
- (void)setHeaderMaxY:(double)a3;
- (void)setHeaderMinY:(double)a3;
- (void)setItemsMaxY:(double)a3;
- (void)setItemsMinY:(double)a3;
- (void)setMaxY:(double)a3;
- (void)setMinY:(double)a3;
- (void)setNumFooters:(unint64_t)a3;
- (void)setNumHeaders:(unint64_t)a3;
- (void)setNumItems:(unint64_t)a3;
- (void)setNumOverlays:(unint64_t)a3;
- (void)setOverlayOffset:(unint64_t)a3;
- (void)setSection:(int64_t)a3;
- (void)setShowMoreMaxY:(double)a3;
- (void)updateWithLayoutAttributes:(id)a3 supplementaryLocation:(unint64_t)a4;
@end

@implementation GKSectionPresentationData

- (GKSectionPresentationData)initWithSection:(int64_t)a3 presentationData:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)GKSectionPresentationData;
  v7 = [(GKSectionPresentationData *)&v11 init];
  v8 = v7;
  if (v7)
  {
    v7->_showMoreMaxY = -1.0;
    v7->_itemsMinY = 1.79769313e308;
    v7->_minY = 1.79769313e308;
    v7->_section = a3;
    v7->_headerMinY = 1.79769313e308;
    v7->_footerMinY = 1.79769313e308;
    if (v6)
    {
      [v6 maxY];
      v8->_maxY = v9;
    }
  }

  return v8;
}

- (id)description
{
  v3 = NSString;
  v54 = [NSNumber numberWithInteger:self->_section];
  v51 = v3;
  v57 = [v3 stringWithFormat:@" section: %@", v54];
  v4 = NSString;
  double minY = self->_minY;
  if (minY == 1.79769313e308)
  {
    id v6 = &stru_1F07B2408;
  }
  else
  {
    v3 = [NSNumber numberWithDouble:self->_minY];
    v45 = [NSNumber numberWithDouble:self->_maxY];
    v46 = v3;
    id v6 = [v4 stringWithFormat:@" %@(%@-%@)", @"y", v3, v45];
  }
  double headerMinY = self->_headerMinY;
  if (headerMinY == 1.79769313e308)
  {
    double v9 = &stru_1F07B2408;
  }
  else
  {
    v3 = NSString;
    uint64_t v8 = [NSNumber numberWithDouble:self->_headerMinY];
    v43 = [NSNumber numberWithDouble:self->_headerMaxY];
    v44 = (void *)v8;
    double v9 = [v3 stringWithFormat:@" %@(%@-%@)", @"hdrY", v8, v43];
  }
  double itemsMinY = self->_itemsMinY;
  if (itemsMinY == 1.79769313e308)
  {
    v12 = &stru_1F07B2408;
  }
  else
  {
    v3 = NSString;
    uint64_t v11 = [NSNumber numberWithDouble:self->_itemsMinY];
    v41 = [NSNumber numberWithDouble:self->_itemsMaxY];
    v42 = (void *)v11;
    v12 = [v3 stringWithFormat:@" %@(%@-%@)", @"itemsY", v11, v41];
  }
  double footerMinY = self->_footerMinY;
  if (footerMinY == 1.79769313e308)
  {
    v15 = &stru_1F07B2408;
  }
  else
  {
    v3 = NSString;
    uint64_t v14 = [NSNumber numberWithDouble:self->_footerMinY];
    v39 = [NSNumber numberWithDouble:self->_footerMaxY];
    v40 = (void *)v14;
    v15 = [v3 stringWithFormat:@" %@(%@-%@)", @"ftrY", v14, v39];
  }
  double maxY = self->_maxY;
  double showMoreMaxY = self->_showMoreMaxY;
  if (showMoreMaxY <= maxY)
  {
    v19 = &stru_1F07B2408;
  }
  else
  {
    v3 = NSString;
    uint64_t v18 = _gkBeautifyVariableName();
    v33 = [NSNumber numberWithDouble:self->_showMoreMaxY];
    v34 = (void *)v18;
    v19 = [v3 stringWithFormat:@" %@: %@", v18, v33];
  }
  v47 = v19;
  v56 = [v4 stringWithFormat:@" |%@%@%@%@%@|", v6, v9, v12, v15, v19];
  unint64_t numHeaders = self->_numHeaders;
  v53 = v6;
  if (numHeaders)
  {
    v3 = NSString;
    uint64_t v20 = _gkBeautifyVariableName();
    v37 = [NSNumber numberWithUnsignedInteger:self->_numHeaders];
    v38 = (void *)v20;
    v55 = [v3 stringWithFormat:@" %@: %@", v20, v37];
  }
  else
  {
    v55 = &stru_1F07B2408;
  }
  v49 = v15;
  v50 = v12;
  unint64_t numItems = self->_numItems;
  if (numItems)
  {
    v3 = NSString;
    uint64_t v22 = _gkBeautifyVariableName();
    v35 = [NSNumber numberWithUnsignedInteger:self->_numItems];
    v36 = (void *)v22;
    v23 = [v3 stringWithFormat:@" %@: %@", v22, v35];
  }
  else
  {
    v23 = &stru_1F07B2408;
  }
  v52 = v9;
  unint64_t numFooters = self->_numFooters;
  if (numFooters)
  {
    v25 = NSString;
    _gkBeautifyVariableName();
    double v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v3 = [NSNumber numberWithUnsignedInteger:self->_numFooters];
    v26 = [v25 stringWithFormat:@" %@: %@", v9, v3];
  }
  else
  {
    v26 = &stru_1F07B2408;
  }
  if (self->_numOverlays)
  {
    v27 = NSString;
    v28 = _gkBeautifyVariableName();
    v29 = [NSNumber numberWithUnsignedInteger:self->_numOverlays];
    v30 = [v27 stringWithFormat:@" %@: %@", v28, v29];
    v31 = [v51 stringWithFormat:@"%@%@%@%@%@%@", v57, v56, v55, v23, v26, v30];
  }
  else
  {
    v31 = [v51 stringWithFormat:@"%@%@%@%@%@%@", v57, v56, v55, v23, v26, &stru_1F07B2408];
  }
  if (numFooters)
  {
  }
  if (numItems)
  {
  }
  if (numHeaders)
  {
  }
  if (showMoreMaxY > maxY)
  {
  }
  if (footerMinY != 1.79769313e308)
  {
  }
  if (itemsMinY != 1.79769313e308)
  {
  }
  if (headerMinY != 1.79769313e308)
  {
  }
  if (minY != 1.79769313e308)
  {
  }

  return v31;
}

- (double)showMoreMaxY
{
  double result = self->_showMoreMaxY;
  if (result < 0.0) {
    return self->_maxY;
  }
  return result;
}

- (double)itemsMinY
{
  double result = self->_itemsMinY;
  if (result == 1.79769313e308) {
    return self->_headerMaxY;
  }
  return result;
}

- (void)updateWithLayoutAttributes:(id)a3 supplementaryLocation:(unint64_t)a4
{
  id v23 = a3;
  [v23 frame];
  CGFloat MinY = CGRectGetMinY(v25);
  [v23 frame];
  CGFloat MaxY = CGRectGetMaxY(v26);
  uint64_t v6 = [v23 representedElementCategory];
  if (!v6)
  {
    uint64_t v14 = 40;
    uint64_t v15 = 32;
    double v7 = MaxY;
    double v8 = MinY;
LABEL_9:
    double v16 = *(double *)((char *)&self->super.isa + v15);
    if (v16 > v8) {
      double v16 = v8;
    }
    *(double *)((char *)&self->super.isa + v15) = v16;
    goto LABEL_12;
  }
  double v7 = MaxY;
  double v8 = MinY;
  if (v6 != 1) {
    goto LABEL_15;
  }
  if (!a4)
  {
    uint64_t v14 = 24;
    uint64_t v15 = 16;
    goto LABEL_9;
  }
  if (a4 != 1) {
    goto LABEL_15;
  }
  v9.f64[0] = self->_footerMinY;
  v9.f64[1] = MaxY;
  v10.f64[1] = self->_footerMaxY;
  v10.f64[0] = MinY;
  int8x16_t v11 = (int8x16_t)vcgtq_f64(v9, v10);
  v9.f64[0] = MinY;
  *(int8x16_t *)&self->_double footerMinY = vbslq_s8(v11, (int8x16_t)v9, *(int8x16_t *)&self->_footerMinY);
  v12 = [v23 representedElementKind];
  char v13 = [v12 isEqualToString:@"IncrementalReveal"];

  double v7 = MaxY;
  double v8 = MinY;
  if ((v13 & 1) == 0) {
    goto LABEL_15;
  }
  uint64_t v14 = 80;
LABEL_12:
  double v17 = *(double *)((char *)&self->super.isa + v14);
  if (v17 < v7) {
    double v17 = v7;
  }
  *(double *)((char *)&self->super.isa + v14) = v17;
LABEL_15:
  v18.f64[0] = self->_minY;
  v18.f64[1] = v7;
  v19.f64[1] = self->_maxY;
  v19.f64[0] = v8;
  int8x16_t v20 = (int8x16_t)vcgtq_f64(v18, v19);
  v18.f64[0] = v8;
  *(int8x16_t *)&self->_double minY = vbslq_s8(v20, (int8x16_t)v18, *(int8x16_t *)&self->_minY);
}

- (int64_t)section
{
  return self->_section;
}

- (void)setSection:(int64_t)a3
{
  self->_section = a3;
}

- (double)headerMinY
{
  return self->_headerMinY;
}

- (void)setHeaderMinY:(double)a3
{
  self->_double headerMinY = a3;
}

- (double)headerMaxY
{
  return self->_headerMaxY;
}

- (void)setHeaderMaxY:(double)a3
{
  self->_headerCGFloat MaxY = a3;
}

- (void)setItemsMinY:(double)a3
{
  self->_double itemsMinY = a3;
}

- (double)itemsMaxY
{
  return self->_itemsMaxY;
}

- (void)setItemsMaxY:(double)a3
{
  self->_itemsCGFloat MaxY = a3;
}

- (double)footerMinY
{
  return self->_footerMinY;
}

- (void)setFooterMinY:(double)a3
{
  self->_double footerMinY = a3;
}

- (double)footerMaxY
{
  return self->_footerMaxY;
}

- (void)setFooterMaxY:(double)a3
{
  self->_footerCGFloat MaxY = a3;
}

- (double)minY
{
  return self->_minY;
}

- (void)setMinY:(double)a3
{
  self->_double minY = a3;
}

- (double)maxY
{
  return self->_maxY;
}

- (void)setMaxY:(double)a3
{
  self->_double maxY = a3;
}

- (void)setShowMoreMaxY:(double)a3
{
  self->_double showMoreMaxY = a3;
}

- (unint64_t)numHeaders
{
  return self->_numHeaders;
}

- (void)setNumHeaders:(unint64_t)a3
{
  self->_unint64_t numHeaders = a3;
}

- (unint64_t)numFooters
{
  return self->_numFooters;
}

- (void)setNumFooters:(unint64_t)a3
{
  self->_unint64_t numFooters = a3;
}

- (unint64_t)numOverlays
{
  return self->_numOverlays;
}

- (void)setNumOverlays:(unint64_t)a3
{
  self->_numOverlays = a3;
}

- (unint64_t)numItems
{
  return self->_numItems;
}

- (void)setNumItems:(unint64_t)a3
{
  self->_unint64_t numItems = a3;
}

- (unint64_t)overlayOffset
{
  return self->_overlayOffset;
}

- (void)setOverlayOffset:(unint64_t)a3
{
  self->_overlayOffset = a3;
}

@end