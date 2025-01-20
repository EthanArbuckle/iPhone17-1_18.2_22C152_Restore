@interface HUMosaicCellSize
+ (id)createMosaicCellSizeForSizeDescription:(unint64_t)a3;
- (unint64_t)numCols;
- (unint64_t)numRows;
- (unint64_t)sizeDescription;
- (void)setNumCols:(unint64_t)a3;
- (void)setNumRows:(unint64_t)a3;
- (void)setSizeDescription:(unint64_t)a3;
@end

@implementation HUMosaicCellSize

+ (id)createMosaicCellSizeForSizeDescription:(unint64_t)a3
{
  v4 = objc_alloc_init(HUMosaicCellSize);
  [(HUMosaicCellSize *)v4 setSizeDescription:a3];
  unint64_t v5 = a3 - 1;
  if (a3 - 1 <= 3)
  {
    uint64_t v6 = qword_1BEA1A8C8[v5];
    [(HUMosaicCellSize *)v4 setNumCols:qword_1BEA1A8A8[v5]];
    [(HUMosaicCellSize *)v4 setNumRows:v6];
  }

  return v4;
}

- (unint64_t)sizeDescription
{
  return self->_sizeDescription;
}

- (void)setSizeDescription:(unint64_t)a3
{
  self->_sizeDescription = a3;
}

- (unint64_t)numRows
{
  return self->_numRows;
}

- (void)setNumRows:(unint64_t)a3
{
  self->_numRows = a3;
}

- (unint64_t)numCols
{
  return self->_numCols;
}

- (void)setNumCols:(unint64_t)a3
{
  self->_numCols = a3;
}

@end