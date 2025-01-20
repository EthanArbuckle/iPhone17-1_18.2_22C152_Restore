@interface HUMosaicLayoutGeometry
- (BOOL)isPortrait;
- (HUGridSize)gridSize;
- (double)cellSize;
- (double)cellSpacing;
- (id)description;
- (void)setCellSize:(double)a3;
- (void)setCellSpacing:(double)a3;
- (void)setGridSize:(HUGridSize)a3;
- (void)setIsPortrait:(BOOL)a3;
@end

@implementation HUMosaicLayoutGeometry

- (id)description
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F7A0D0]) initWithObject:self];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  v12 = __37__HUMosaicLayoutGeometry_description__block_invoke;
  v13 = &unk_1E63850E0;
  id v14 = v3;
  v15 = self;
  id v4 = v3;
  [v4 appendBodySectionWithName:@"gridSize" multilinePrefix:@"\t" block:&v10];
  [(HUMosaicLayoutGeometry *)self cellSize];
  id v5 = (id)objc_msgSend(v4, "appendDouble:withName:decimalPrecision:", @"cellSize", 0);
  [(HUMosaicLayoutGeometry *)self cellSpacing];
  id v6 = (id)objc_msgSend(v4, "appendDouble:withName:decimalPrecision:", @"cellSpacing", 0);
  id v7 = (id)objc_msgSend(v4, "appendBool:withName:", -[HUMosaicLayoutGeometry isPortrait](self, "isPortrait"), @"isPortrait");
  v8 = [v4 build];

  return v8;
}

id __37__HUMosaicLayoutGeometry_description__block_invoke(uint64_t a1)
{
  id v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendInt64:withName:", objc_msgSend(*(id *)(a1 + 40), "gridSize"), @"rowsDown");
  v3 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) gridSize];
  return (id)[v3 appendInt64:v4 withName:@"columnsAcross"];
}

- (HUGridSize)gridSize
{
  int64_t columnsAcross = self->_gridSize.columnsAcross;
  int64_t rowsDown = self->_gridSize.rowsDown;
  result.int64_t columnsAcross = columnsAcross;
  result.int64_t rowsDown = rowsDown;
  return result;
}

- (void)setGridSize:(HUGridSize)a3
{
  self->_gridSize = a3;
}

- (double)cellSize
{
  return self->_cellSize;
}

- (void)setCellSize:(double)a3
{
  self->_cellSize = a3;
}

- (double)cellSpacing
{
  return self->_cellSpacing;
}

- (void)setCellSpacing:(double)a3
{
  self->_cellSpacing = a3;
}

- (BOOL)isPortrait
{
  return self->_isPortrait;
}

- (void)setIsPortrait:(BOOL)a3
{
  self->_isPortrait = a3;
}

@end