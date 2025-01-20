@interface GameLayerPageGrid
- (GameLayerPageGrid)init;
- (GameLayerPageGrid)initWithContainerSize:(CGSize)a3 traitCollection:(id)a4;
- (GameLayerPageGrid)initWithSize:(CGSize)a3 traitCollection:(id)a4;
- (GameLayerPageGrid)initWithSize:(CGSize)a3 traitCollection:(id)a4 idealColumnSizeCategory:(int64_t)a5;
- (GameLayerPageGrid)initWithWidth:(double)a3 columnSizeCategory:(int64_t)a4 maxColumns:(id)a5;
- (UIEdgeInsets)centeringInsets;
- (UIEdgeInsets)minimumInsets;
- (double)columnWidth;
- (double)interColumnSpacing;
- (int64_t)columnCount;
@end

@implementation GameLayerPageGrid

- (double)columnWidth
{
  return PageGrid.columnWidth.getter();
}

- (double)interColumnSpacing
{
  return PageGrid.interColumnSpacing.getter();
}

- (int64_t)columnCount
{
  return PageGrid.columnCount.getter();
}

- (UIEdgeInsets)minimumInsets
{
  double v2 = PageGrid.minimumInsets.getter();
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (UIEdgeInsets)centeringInsets
{
  double v2 = PageGrid.centeringInsets.getter();
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (GameLayerPageGrid)initWithContainerSize:(CGSize)a3 traitCollection:(id)a4
{
  return (GameLayerPageGrid *)PageGrid.init(containerSize:traitCollection:)(a4);
}

- (GameLayerPageGrid)initWithSize:(CGSize)a3 traitCollection:(id)a4
{
  return (GameLayerPageGrid *)PageGrid.init(size:traitCollection:)(a4);
}

- (GameLayerPageGrid)initWithSize:(CGSize)a3 traitCollection:(id)a4 idealColumnSizeCategory:(int64_t)a5
{
  return (GameLayerPageGrid *)PageGrid.init(size:traitCollection:idealColumnSizeCategory:)(a4);
}

- (GameLayerPageGrid)initWithWidth:(double)a3 columnSizeCategory:(int64_t)a4 maxColumns:(id)a5
{
  int v6 = a4;
  id v7 = a5;
  return (GameLayerPageGrid *)PageGrid.init(width:columnSizeCategory:maxColumns:)(v6, a5);
}

- (GameLayerPageGrid)init
{
}

- (void).cxx_destruct
{
}

@end