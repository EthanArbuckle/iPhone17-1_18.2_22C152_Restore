@interface AEGridConfiguration
+ (id)configurationForEnvironment:(id)a3;
- (BOOL)isOversized;
- (double)tileHeight;
- (unint64_t)rowCount;
- (void)setOversized:(BOOL)a3;
- (void)setRowCount:(unint64_t)a3;
- (void)setTileHeight:(double)a3;
@end

@implementation AEGridConfiguration

- (void)setOversized:(BOOL)a3
{
  self->_oversized = a3;
}

- (BOOL)isOversized
{
  return self->_oversized;
}

- (void)setTileHeight:(double)a3
{
  self->_tileHeight = a3;
}

- (double)tileHeight
{
  return self->_tileHeight;
}

- (void)setRowCount:(unint64_t)a3
{
  self->_rowCount = a3;
}

- (unint64_t)rowCount
{
  return self->_rowCount;
}

+ (id)configurationForEnvironment:(id)a3
{
  id v3 = a3;
  [v3 compactExtensionHeight];
  double v5 = v4;
  [v3 headerHeight];
  double v7 = v5 - v6;
  [v3 targetBottomMargin];
  double v9 = v7 - v8;
  [v3 minimumTileHeight];
  double v11 = v10;
  double v12 = v10;
  BOOL v13 = v10 * 2.0 + 1.0 > v9;
  uint64_t v14 = 2;
  do
  {
    unint64_t v15 = v14;
    BOOL v16 = v13;
    uint64_t v14 = 1;
    BOOL v13 = 0;
  }
  while (v16);
  double v17 = v9 - (double)(v15 - 1);
  if (v10 * (double)v15 < v17)
  {
    [v3 scale];
    double v12 = floor(v17 * v18 / (double)v15) / v18;
  }
  uint64_t v19 = PXFloatGreaterThanFloat();
  if (v19) {
    double v20 = v11 * 1.25;
  }
  else {
    double v20 = v12;
  }
  v21 = objc_alloc_init(AEGridConfiguration);
  [(AEGridConfiguration *)v21 setRowCount:v15];
  [(AEGridConfiguration *)v21 setTileHeight:v20];
  [(AEGridConfiguration *)v21 setOversized:v19];

  return v21;
}

@end