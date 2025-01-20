@interface NTKAlaskanChronoSubdialViewOptions
- (CGSize)largeTickSize;
- (CGSize)smallTickSize;
- (UIFont)markersFont;
- (double)markersDiameter;
- (double)ticksContentInset;
- (id)largerTicksTestBlock;
- (id)markerTextBlock;
- (id)visibleMarkersTestBlock;
- (unint64_t)markersCount;
- (unint64_t)ticksCount;
- (void)setLargeTickSize:(CGSize)a3;
- (void)setLargerTicksTestBlock:(id)a3;
- (void)setMarkerTextBlock:(id)a3;
- (void)setMarkersCount:(unint64_t)a3;
- (void)setMarkersDiameter:(double)a3;
- (void)setMarkersFont:(id)a3;
- (void)setSmallTickSize:(CGSize)a3;
- (void)setTicksContentInset:(double)a3;
- (void)setTicksCount:(unint64_t)a3;
- (void)setVisibleMarkersTestBlock:(id)a3;
@end

@implementation NTKAlaskanChronoSubdialViewOptions

- (unint64_t)ticksCount
{
  return self->_ticksCount;
}

- (void)setTicksCount:(unint64_t)a3
{
  self->_ticksCount = a3;
}

- (id)largerTicksTestBlock
{
  return self->_largerTicksTestBlock;
}

- (void)setLargerTicksTestBlock:(id)a3
{
}

- (CGSize)largeTickSize
{
  double width = self->_largeTickSize.width;
  double height = self->_largeTickSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setLargeTickSize:(CGSize)a3
{
  self->_largeTickSize = a3;
}

- (CGSize)smallTickSize
{
  double width = self->_smallTickSize.width;
  double height = self->_smallTickSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSmallTickSize:(CGSize)a3
{
  self->_smallTickSize = a3;
}

- (double)ticksContentInset
{
  return self->_ticksContentInset;
}

- (void)setTicksContentInset:(double)a3
{
  self->_ticksContentInset = a3;
}

- (unint64_t)markersCount
{
  return self->_markersCount;
}

- (void)setMarkersCount:(unint64_t)a3
{
  self->_markersCount = a3;
}

- (id)visibleMarkersTestBlock
{
  return self->_visibleMarkersTestBlock;
}

- (void)setVisibleMarkersTestBlock:(id)a3
{
}

- (id)markerTextBlock
{
  return self->_markerTextBlock;
}

- (void)setMarkerTextBlock:(id)a3
{
}

- (UIFont)markersFont
{
  return self->_markersFont;
}

- (void)setMarkersFont:(id)a3
{
}

- (double)markersDiameter
{
  return self->_markersDiameter;
}

- (void)setMarkersDiameter:(double)a3
{
  self->_markersDiameter = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_markersFont, 0);
  objc_storeStrong(&self->_markerTextBlock, 0);
  objc_storeStrong(&self->_visibleMarkersTestBlock, 0);

  objc_storeStrong(&self->_largerTicksTestBlock, 0);
}

@end