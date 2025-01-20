@interface GKCollectionViewLayoutAttributes
- (BOOL)allSectionItemsVisible;
- (BOOL)doesAbutLeftOfCollectionView;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPartOfGlobalPinningGroup;
- (BOOL)isPinned;
- (GKCollectionViewLayoutAttributes)init;
- (GKSectionMetrics)sectionMetrics;
- (GKSupplementaryViewMetrics)supplementaryMetrics;
- (UICollectionViewDataSource)dataSource;
- (double)leadingMargin;
- (double)trailingMargin;
- (double)unpinnedY;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)currentTotalItemCount;
- (unint64_t)currentVisibleItemCount;
- (unint64_t)gridLayoutLocation;
- (unint64_t)hash;
- (unint64_t)maxTotalItemCount;
- (void)setAllSectionItemsVisible:(BOOL)a3;
- (void)setCurrentTotalItemCount:(unint64_t)a3;
- (void)setCurrentVisibleItemCount:(unint64_t)a3;
- (void)setDataSource:(id)a3;
- (void)setDoesAbutLeftOfCollectionView:(BOOL)a3;
- (void)setGridLayoutLocation:(unint64_t)a3;
- (void)setIsPartOfGlobalPinningGroup:(BOOL)a3;
- (void)setIsPinned:(BOOL)a3;
- (void)setLeadingMargin:(double)a3;
- (void)setMaxTotalItemCount:(unint64_t)a3;
- (void)setSectionMetrics:(id)a3;
- (void)setSupplementaryMetrics:(id)a3;
- (void)setTrailingMargin:(double)a3;
- (void)setUnpinnedY:(double)a3;
@end

@implementation GKCollectionViewLayoutAttributes

- (GKCollectionViewLayoutAttributes)init
{
  v3.receiver = self;
  v3.super_class = (Class)GKCollectionViewLayoutAttributes;
  result = [(UICollectionViewLayoutAttributes *)&v3 init];
  if (result) {
    result->_allSectionItemsVisible = 1;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GKCollectionViewLayoutAttributes;
  id v4 = [(UICollectionViewLayoutAttributes *)&v7 copyWithZone:a3];
  v5 = v4;
  if (v4)
  {
    [v4 setAllSectionItemsVisible:self->_allSectionItemsVisible];
    [v5 setIsPinned:self->_isPinned];
    [v5 setIsPartOfGlobalPinningGroup:self->_isPartOfGlobalPinningGroup];
    [v5 setUnpinnedY:self->_unpinnedY];
    [v5 setDataSource:self->_dataSource];
    [v5 setSectionMetrics:self->_sectionMetrics];
    [v5 setSupplementaryMetrics:self->_supplementaryMetrics];
    [v5 setCurrentVisibleItemCount:self->_currentVisibleItemCount];
    [v5 setCurrentTotalItemCount:self->_currentTotalItemCount];
    [v5 setMaxTotalItemCount:self->_maxTotalItemCount];
    [v5 setGridLayoutLocation:self->_gridLayoutLocation];
    [v5 setDoesAbutLeftOfCollectionView:self->_doesAbutLeftOfCollectionView];
    [v5 setLeadingMargin:self->_leadingMargin];
    [v5 setTrailingMargin:self->_trailingMargin];
  }
  return v5;
}

- (id)description
{
  v28 = NSString;
  v31.receiver = self;
  v31.super_class = (Class)GKCollectionViewLayoutAttributes;
  uint64_t v30 = [(UICollectionViewLayoutAttributes *)&v31 description];
  double leadingMargin = self->_leadingMargin;
  if (leadingMargin == 0.0)
  {
    v29 = &stru_1F07B2408;
  }
  else
  {
    id v4 = NSString;
    uint64_t v5 = _gkBeautifyVariableName();
    v26 = [NSNumber numberWithDouble:self->_leadingMargin];
    v27 = (void *)v5;
    v29 = [v4 stringWithFormat:@" %@: %@", v5, v26];
  }
  if (self->_isPinned) {
    v6 = @"pinned";
  }
  else {
    v6 = &stru_1F07B2408;
  }
  if (self->_allSectionItemsVisible) {
    objc_super v7 = @"allvis";
  }
  else {
    objc_super v7 = &stru_1F07B2408;
  }
  dataSource = self->_dataSource;
  if (dataSource)
  {
    v9 = NSString;
    uint64_t v10 = _gkBeautifyVariableName();
    v24 = [NSString stringWithFormat:@"<%@ %p>", objc_opt_class(), self->_dataSource];
    v25 = (void *)v10;
    v11 = [v9 stringWithFormat:@" %@: %@", v10, v24];
  }
  else
  {
    v11 = &stru_1F07B2408;
  }
  if (self->_sectionMetrics)
  {
    v12 = NSString;
    v13 = _gkBeautifyVariableName();
    v14 = [NSString stringWithFormat:@"<%@ %p>", objc_opt_class(), self->_sectionMetrics];
    v15 = [v12 stringWithFormat:@" %@: %@", v13, v14];
    v22 = v7;
    v16 = v29;
    v20 = v6;
    v17 = (void *)v30;
    v18 = [v28 stringWithFormat:@"%@%@%@%@%@%@%@", v30, v29, v20, v22, &stru_1F07B2408, v11, v15];

    if (!dataSource) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  v23 = v7;
  v16 = v29;
  v21 = v6;
  v17 = (void *)v30;
  v18 = [v28 stringWithFormat:@"%@%@%@%@%@%@%@", v30, v29, v21, v23, &stru_1F07B2408, v11, &stru_1F07B2408];
  if (dataSource)
  {
LABEL_15:
  }
LABEL_16:
  if (leadingMargin != 0.0)
  {
  }

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v26.receiver = self;
    v26.super_class = (Class)GKCollectionViewLayoutAttributes;
    unsigned __int8 v5 = [(UICollectionViewLayoutAttributes *)&v26 isEqual:v4];
    id v6 = v4;
    unint64_t v7 = [(GKCollectionViewLayoutAttributes *)self maxTotalItemCount];
    if (v7 == [v6 maxTotalItemCount]) {
      unsigned __int8 v8 = v5;
    }
    else {
      unsigned __int8 v8 = 0;
    }
    unint64_t v9 = [(GKCollectionViewLayoutAttributes *)self currentVisibleItemCount];
    if (v9 != [v6 currentVisibleItemCount]) {
      unsigned __int8 v8 = 0;
    }
    unint64_t v10 = [(GKCollectionViewLayoutAttributes *)self currentTotalItemCount];
    if (v10 == [v6 currentTotalItemCount]) {
      unsigned __int8 v11 = v8;
    }
    else {
      unsigned __int8 v11 = 0;
    }
    [(GKCollectionViewLayoutAttributes *)self leadingMargin];
    double v13 = v12;
    [v6 leadingMargin];
    if (v13 != v14) {
      unsigned __int8 v11 = 0;
    }
    [(GKCollectionViewLayoutAttributes *)self trailingMargin];
    double v16 = v15;
    [v6 trailingMargin];
    if (v16 == v17) {
      BOOL v18 = v11;
    }
    else {
      BOOL v18 = 0;
    }
    v19 = [(GKCollectionViewLayoutAttributes *)self sectionMetrics];
    [v19 calculatedItemHeight];
    double v21 = v20;
    v22 = [v6 sectionMetrics];

    [v22 calculatedItemHeight];
    BOOL v24 = v21 == v23 && v18;
  }
  else
  {
    BOOL v24 = 0;
  }

  return v24;
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)GKCollectionViewLayoutAttributes;
  return [(UICollectionViewLayoutAttributes *)&v3 hash];
}

- (BOOL)allSectionItemsVisible
{
  return self->_allSectionItemsVisible;
}

- (void)setAllSectionItemsVisible:(BOOL)a3
{
  self->_allSectionItemsVisible = a3;
}

- (BOOL)isPinned
{
  return self->_isPinned;
}

- (void)setIsPinned:(BOOL)a3
{
  self->_isPinned = a3;
}

- (double)unpinnedY
{
  return self->_unpinnedY;
}

- (void)setUnpinnedY:(double)a3
{
  self->_unpinnedY = a3;
}

- (UICollectionViewDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (GKSectionMetrics)sectionMetrics
{
  return self->_sectionMetrics;
}

- (void)setSectionMetrics:(id)a3
{
}

- (GKSupplementaryViewMetrics)supplementaryMetrics
{
  return self->_supplementaryMetrics;
}

- (void)setSupplementaryMetrics:(id)a3
{
}

- (unint64_t)currentVisibleItemCount
{
  return self->_currentVisibleItemCount;
}

- (void)setCurrentVisibleItemCount:(unint64_t)a3
{
  self->_currentVisibleItemCount = a3;
}

- (unint64_t)currentTotalItemCount
{
  return self->_currentTotalItemCount;
}

- (void)setCurrentTotalItemCount:(unint64_t)a3
{
  self->_currentTotalItemCount = a3;
}

- (unint64_t)maxTotalItemCount
{
  return self->_maxTotalItemCount;
}

- (void)setMaxTotalItemCount:(unint64_t)a3
{
  self->_maxTotalItemCount = a3;
}

- (double)leadingMargin
{
  return self->_leadingMargin;
}

- (void)setLeadingMargin:(double)a3
{
  self->_double leadingMargin = a3;
}

- (double)trailingMargin
{
  return self->_trailingMargin;
}

- (void)setTrailingMargin:(double)a3
{
  self->_trailingMargin = a3;
}

- (BOOL)isPartOfGlobalPinningGroup
{
  return self->_isPartOfGlobalPinningGroup;
}

- (void)setIsPartOfGlobalPinningGroup:(BOOL)a3
{
  self->_isPartOfGlobalPinningGroup = a3;
}

- (unint64_t)gridLayoutLocation
{
  return self->_gridLayoutLocation;
}

- (void)setGridLayoutLocation:(unint64_t)a3
{
  self->_gridLayoutLocation = a3;
}

- (BOOL)doesAbutLeftOfCollectionView
{
  return self->_doesAbutLeftOfCollectionView;
}

- (void)setDoesAbutLeftOfCollectionView:(BOOL)a3
{
  self->_doesAbutLeftOfCollectionView = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supplementaryMetrics, 0);
  objc_storeStrong((id *)&self->_sectionMetrics, 0);

  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end