@interface SCATMenuStyleAttributes
+ (CGSize)itemSize;
+ (id)dockStyleAttributes;
+ (id)popoverStyleAttributes;
- (CGSize)itemSpacingLandscape;
- (CGSize)itemSpacingPortrait;
- (unint64_t)maxItemsPerRow;
- (unint64_t)maxRows;
- (void)setItemSpacingLandscape:(CGSize)a3;
- (void)setItemSpacingPortrait:(CGSize)a3;
- (void)setMaxItemsPerRow:(unint64_t)a3;
- (void)setMaxRows:(unint64_t)a3;
@end

@implementation SCATMenuStyleAttributes

+ (CGSize)itemSize
{
  +[SCATMenuItemCell maxCellSize];
  result.height = v3;
  result.width = v2;
  return result;
}

+ (id)popoverStyleAttributes
{
  double v2 = objc_alloc_init(SCATMenuStyleAttributes);
  -[SCATMenuStyleAttributes setItemSpacingLandscape:](v2, "setItemSpacingLandscape:", 5.0, 12.0);
  -[SCATMenuStyleAttributes setItemSpacingPortrait:](v2, "setItemSpacingPortrait:", 5.0, 12.0);
  if (AXDeviceIsPad()) {
    uint64_t v3 = 6;
  }
  else {
    uint64_t v3 = 4;
  }
  [(SCATMenuStyleAttributes *)v2 setMaxItemsPerRow:v3];
  if (AXDeviceIsPad()) {
    uint64_t v4 = 4;
  }
  else {
    uint64_t v4 = 3;
  }
  [(SCATMenuStyleAttributes *)v2 setMaxRows:v4];

  return v2;
}

+ (id)dockStyleAttributes
{
  uint64_t v3 = objc_alloc_init(SCATMenuStyleAttributes);
  if (AXDeviceIsPad()) {
    double v4 = 40.0;
  }
  else {
    double v4 = 5.0;
  }
  if (AXDeviceIsPad()) {
    double v5 = 30.0;
  }
  else {
    double v5 = 5.0;
  }
  [(SCATMenuStyleAttributes *)v3 setMaxItemsPerRow:100];
  [(SCATMenuStyleAttributes *)v3 setMaxRows:1];
  v6 = +[UIScreen mainScreen];
  [v6 scale];
  if (v7 == 1.0) {
    double v8 = 15.0;
  }
  else {
    double v8 = 16.0;
  }

  v9 = +[UIScreen mainScreen];
  [v9 bounds];
  double v11 = v10;
  double v13 = v12;

  double v14 = fmax(v11, v13) + -30.0;
  double v15 = fmin(v11, v13) + v8 * -2.0;
  [a1 itemSize];
  double v17 = ceil((v14 - v4) / (v4 + v16));
  double v18 = ceil((v15 - v5) / (v5 + v16));
  double v19 = (v14 - v16 * v17) / (v17 + 1.0);
  double v20 = (v15 - v16 * v18) / (v18 + 1.0);
  if (v19 >= v4) {
    double v21 = v4;
  }
  else {
    double v21 = v19;
  }
  if (v21 < 5.0) {
    double v21 = 5.0;
  }
  if (v20 >= v5) {
    double v22 = v5;
  }
  else {
    double v22 = v20;
  }
  if (v22 >= 5.0) {
    double v23 = v22;
  }
  else {
    double v23 = 5.0;
  }
  -[SCATMenuStyleAttributes setItemSpacingLandscape:](v3, "setItemSpacingLandscape:", v21, 0.0);
  -[SCATMenuStyleAttributes setItemSpacingPortrait:](v3, "setItemSpacingPortrait:", v23, 0.0);

  return v3;
}

- (CGSize)itemSpacingLandscape
{
  double width = self->_itemSpacingLandscape.width;
  double height = self->_itemSpacingLandscape.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setItemSpacingLandscape:(CGSize)a3
{
  self->_itemSpacingLandscape = a3;
}

- (CGSize)itemSpacingPortrait
{
  double width = self->_itemSpacingPortrait.width;
  double height = self->_itemSpacingPortrait.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setItemSpacingPortrait:(CGSize)a3
{
  self->_itemSpacingPortrait = a3;
}

- (unint64_t)maxItemsPerRow
{
  return self->_maxItemsPerRow;
}

- (void)setMaxItemsPerRow:(unint64_t)a3
{
  self->_maxItemsPerRow = a3;
}

- (unint64_t)maxRows
{
  return self->_maxRows;
}

- (void)setMaxRows:(unint64_t)a3
{
  self->_maxRows = a3;
}

@end