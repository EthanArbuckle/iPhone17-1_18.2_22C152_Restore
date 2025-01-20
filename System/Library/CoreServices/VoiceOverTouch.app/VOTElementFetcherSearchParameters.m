@interface VOTElementFetcherSearchParameters
- (BOOL)groupNavigationStyle;
- (BOOL)needsForceCacheUpdate;
- (BOOL)peeking;
- (CGPoint)hitTestPoint;
- (VOTElement)element;
- (VOTElement)fallbackLocalOpaqueParent;
- (VOTElement)fallbackOpaqueParent;
- (_NSRange)startingRange;
- (id)matchBlock;
- (id)rangeBlock;
- (int64_t)direction;
- (int64_t)searchType;
- (unint64_t)clientGeneration;
- (unint64_t)generation;
- (void)setClientGeneration:(unint64_t)a3;
- (void)setDirection:(int64_t)a3;
- (void)setElement:(id)a3;
- (void)setFallbackLocalOpaqueParent:(id)a3;
- (void)setFallbackOpaqueParent:(id)a3;
- (void)setGeneration:(unint64_t)a3;
- (void)setGroupNavigationStyle:(BOOL)a3;
- (void)setHitTestPoint:(CGPoint)a3;
- (void)setMatchBlock:(id)a3;
- (void)setNeedsForceCacheUpdate:(BOOL)a3;
- (void)setPeeking:(BOOL)a3;
- (void)setRangeBlock:(id)a3;
- (void)setSearchType:(int64_t)a3;
- (void)setStartingRange:(_NSRange)a3;
@end

@implementation VOTElementFetcherSearchParameters

- (int64_t)direction
{
  return self->_direction;
}

- (void)setDirection:(int64_t)a3
{
  self->_direction = a3;
}

- (VOTElement)element
{
  return self->_element;
}

- (void)setElement:(id)a3
{
}

- (BOOL)needsForceCacheUpdate
{
  return self->_needsForceCacheUpdate;
}

- (void)setNeedsForceCacheUpdate:(BOOL)a3
{
  self->_needsForceCacheUpdate = a3;
}

- (id)matchBlock
{
  return self->_matchBlock;
}

- (void)setMatchBlock:(id)a3
{
}

- (id)rangeBlock
{
  return self->_rangeBlock;
}

- (void)setRangeBlock:(id)a3
{
}

- (_NSRange)startingRange
{
  NSUInteger length = self->_startingRange.length;
  NSUInteger location = self->_startingRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setStartingRange:(_NSRange)a3
{
  self->_startingRange = a3;
}

- (int64_t)searchType
{
  return self->_searchType;
}

- (void)setSearchType:(int64_t)a3
{
  self->_searchType = a3;
}

- (VOTElement)fallbackOpaqueParent
{
  return self->_fallbackOpaqueParent;
}

- (void)setFallbackOpaqueParent:(id)a3
{
}

- (VOTElement)fallbackLocalOpaqueParent
{
  return self->_fallbackLocalOpaqueParent;
}

- (void)setFallbackLocalOpaqueParent:(id)a3
{
}

- (CGPoint)hitTestPoint
{
  double x = self->_hitTestPoint.x;
  double y = self->_hitTestPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setHitTestPoint:(CGPoint)a3
{
  self->_hitTestPoint = a3;
}

- (unint64_t)generation
{
  return self->_generation;
}

- (void)setGeneration:(unint64_t)a3
{
  self->_generation = a3;
}

- (unint64_t)clientGeneration
{
  return self->_clientGeneration;
}

- (void)setClientGeneration:(unint64_t)a3
{
  self->_clientGeneration = a3;
}

- (BOOL)groupNavigationStyle
{
  return self->_groupNavigationStyle;
}

- (void)setGroupNavigationStyle:(BOOL)a3
{
  self->_groupNavigationStyle = a3;
}

- (BOOL)peeking
{
  return self->_peeking;
}

- (void)setPeeking:(BOOL)a3
{
  self->_peeking = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackLocalOpaqueParent, 0);
  objc_storeStrong((id *)&self->_fallbackOpaqueParent, 0);
  objc_storeStrong(&self->_rangeBlock, 0);
  objc_storeStrong(&self->_matchBlock, 0);

  objc_storeStrong((id *)&self->_element, 0);
}

@end