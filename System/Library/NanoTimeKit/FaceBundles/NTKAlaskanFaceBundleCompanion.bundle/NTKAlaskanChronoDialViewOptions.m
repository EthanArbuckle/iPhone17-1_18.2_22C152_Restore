@interface NTKAlaskanChronoDialViewOptions
- (BOOL)hasSecondaryMarkers;
- (CGPoint)largeTicksAnchorPoint;
- (CGPoint)smallTicksAnchorPoint;
- (CGSize)largeTickSize;
- (CGSize)smallTickSize;
- (UIFont)markersFont;
- (UIFont)secondaryMarkersFont;
- (double)markersDiameter;
- (double)secondaryMarkersDiameter;
- (double)ticksContentInset;
- (id)largerTicksTestBlock;
- (id)markerTextBlock;
- (id)markersAngleProvider;
- (id)secondaryMarkerTextBlock;
- (id)tickSizeAtIndexBlock;
- (id)ticksAngleProvider;
- (id)visibleMarkersTestBlock;
- (id)visibleSecondaryMarkersTestBlock;
- (unint64_t)markersCount;
- (unint64_t)secondaryMarkersCount;
- (unint64_t)ticksCount;
- (void)setHasSecondaryMarkers:(BOOL)a3;
- (void)setLargeTickSize:(CGSize)a3;
- (void)setLargeTicksAnchorPoint:(CGPoint)a3;
- (void)setLargerTicksTestBlock:(id)a3;
- (void)setMarkerTextBlock:(id)a3;
- (void)setMarkersAngleProvider:(id)a3;
- (void)setMarkersCount:(unint64_t)a3;
- (void)setMarkersDiameter:(double)a3;
- (void)setMarkersFont:(id)a3;
- (void)setSecondaryMarkerTextBlock:(id)a3;
- (void)setSecondaryMarkersCount:(unint64_t)a3;
- (void)setSecondaryMarkersDiameter:(double)a3;
- (void)setSecondaryMarkersFont:(id)a3;
- (void)setSmallTickSize:(CGSize)a3;
- (void)setSmallTicksAnchorPoint:(CGPoint)a3;
- (void)setTickSizeAtIndexBlock:(id)a3;
- (void)setTicksAngleProvider:(id)a3;
- (void)setTicksContentInset:(double)a3;
- (void)setTicksCount:(unint64_t)a3;
- (void)setVisibleMarkersTestBlock:(id)a3;
- (void)setVisibleSecondaryMarkersTestBlock:(id)a3;
@end

@implementation NTKAlaskanChronoDialViewOptions

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

- (id)tickSizeAtIndexBlock
{
  return self->_tickSizeAtIndexBlock;
}

- (void)setTickSizeAtIndexBlock:(id)a3
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

- (CGPoint)largeTicksAnchorPoint
{
  double x = self->_largeTicksAnchorPoint.x;
  double y = self->_largeTicksAnchorPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setLargeTicksAnchorPoint:(CGPoint)a3
{
  self->_largeTicksAnchorPoint = a3;
}

- (CGPoint)smallTicksAnchorPoint
{
  double x = self->_smallTicksAnchorPoint.x;
  double y = self->_smallTicksAnchorPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setSmallTicksAnchorPoint:(CGPoint)a3
{
  self->_smallTicksAnchorPoint = a3;
}

- (id)ticksAngleProvider
{
  return self->_ticksAngleProvider;
}

- (void)setTicksAngleProvider:(id)a3
{
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

- (id)markersAngleProvider
{
  return self->_markersAngleProvider;
}

- (void)setMarkersAngleProvider:(id)a3
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

- (BOOL)hasSecondaryMarkers
{
  return self->_hasSecondaryMarkers;
}

- (void)setHasSecondaryMarkers:(BOOL)a3
{
  self->_hasSecondaryMarkers = a3;
}

- (unint64_t)secondaryMarkersCount
{
  return self->_secondaryMarkersCount;
}

- (void)setSecondaryMarkersCount:(unint64_t)a3
{
  self->_secondaryMarkersCount = a3;
}

- (id)visibleSecondaryMarkersTestBlock
{
  return self->_visibleSecondaryMarkersTestBlock;
}

- (void)setVisibleSecondaryMarkersTestBlock:(id)a3
{
}

- (id)secondaryMarkerTextBlock
{
  return self->_secondaryMarkerTextBlock;
}

- (void)setSecondaryMarkerTextBlock:(id)a3
{
}

- (UIFont)secondaryMarkersFont
{
  return self->_secondaryMarkersFont;
}

- (void)setSecondaryMarkersFont:(id)a3
{
}

- (double)secondaryMarkersDiameter
{
  return self->_secondaryMarkersDiameter;
}

- (void)setSecondaryMarkersDiameter:(double)a3
{
  self->_secondaryMarkersDiameter = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryMarkersFont, 0);
  objc_storeStrong(&self->_secondaryMarkerTextBlock, 0);
  objc_storeStrong(&self->_visibleSecondaryMarkersTestBlock, 0);
  objc_storeStrong((id *)&self->_markersFont, 0);
  objc_storeStrong(&self->_markersAngleProvider, 0);
  objc_storeStrong(&self->_markerTextBlock, 0);
  objc_storeStrong(&self->_visibleMarkersTestBlock, 0);
  objc_storeStrong(&self->_ticksAngleProvider, 0);
  objc_storeStrong(&self->_tickSizeAtIndexBlock, 0);

  objc_storeStrong(&self->_largerTicksTestBlock, 0);
}

@end