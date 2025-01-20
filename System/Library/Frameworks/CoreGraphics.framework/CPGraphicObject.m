@interface CPGraphicObject
- (BOOL)canBeContainer;
- (BOOL)isInZoneBorder;
- (BOOL)isIndivisible;
- (BOOL)isNarrow;
- (BOOL)isVisible;
- (CGRect)renderedBounds;
- (CPGraphicObject)init;
- (CPParagraph)anchoringParagraph;
- (id)anchoringTextLine;
- (id)user;
- (int)zoneGraphicType;
- (unsigned)clipIndex;
- (unsigned)unicode;
- (void)dealloc;
- (void)setAnchoringParagraph:(id)a3;
- (void)setAnchoringTextLine:(id)a3;
- (void)setClipIndex:(unsigned int)a3;
- (void)setIsInZoneBorder:(BOOL)a3;
- (void)setUser:(id)a3;
- (void)setZoneGraphicType:(int)a3;
@end

@implementation CPGraphicObject

- (void)setAnchoringParagraph:(id)a3
{
}

- (CPParagraph)anchoringParagraph
{
  return self->anchoringParagraph;
}

- (void)setClipIndex:(unsigned int)a3
{
  self->clipIndex = a3;
}

- (unsigned)clipIndex
{
  return self->clipIndex;
}

- (id)user
{
  return self->user;
}

- (void)setUser:(id)a3
{
  if (self->user != a3)
  {
    if (a3) {
      [a3 incrementUsedGraphicCount];
    }
    self->user = (CPGraphicUser *)a3;
  }
}

- (id)anchoringTextLine
{
  return self->anchoringTextLine;
}

- (void)setAnchoringTextLine:(id)a3
{
  self->anchoringTextLine = (CPTextLine *)a3;
}

- (void)setZoneGraphicType:(int)a3
{
  self->zoneGraphicType = a3;
}

- (int)zoneGraphicType
{
  return self->zoneGraphicType;
}

- (void)setIsInZoneBorder:(BOOL)a3
{
  self->isInZoneBorder = a3;
}

- (BOOL)isInZoneBorder
{
  return self->isInZoneBorder;
}

- (BOOL)isIndivisible
{
  return 1;
}

- (BOOL)isVisible
{
  return 0;
}

- (BOOL)canBeContainer
{
  [(CPGraphicObject *)self renderedBounds];
  return v3 >= 9.0 && v2 >= 9.0;
}

- (BOOL)isNarrow
{
  [(CPGraphicObject *)self renderedBounds];
  if (v3 == v2) {
    return 0;
  }
  if (v3 > 6.0 && v2 > 6.0) {
    return 0;
  }
  if (v3 <= 3.0 || v2 <= 3.0) {
    return 1;
  }
  if (v3 > v2 * 8.0) {
    return 1;
  }
  return v2 > v3 * 8.0;
}

- (unsigned)unicode
{
  return 0;
}

- (CGRect)renderedBounds
{
  p_renderedBounds = &self->renderedBounds;
  double x = self->renderedBounds.origin.x;
  double y = self->renderedBounds.origin.y;
  if (x == INFINITY || y == INFINITY)
  {
    v8.receiver = self;
    v8.super_class = (Class)CPGraphicObject;
    [(CPChunk *)&v8 renderedBounds];
    p_renderedBounds->origin.double x = x;
    p_renderedBounds->origin.double y = y;
    p_renderedBounds->size.double width = width;
    p_renderedBounds->size.double height = height;
  }
  else
  {
    double width = self->renderedBounds.size.width;
    double height = self->renderedBounds.size.height;
  }
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)dealloc
{
  self->anchoringParagraph = 0;
  v3.receiver = self;
  v3.super_class = (Class)CPGraphicObject;
  [(CPObject *)&v3 dealloc];
}

- (CPGraphicObject)init
{
  v3.receiver = self;
  v3.super_class = (Class)CPGraphicObject;
  CGRect result = [(CPChunk *)&v3 init];
  if (result)
  {
    result->renderedBounds = CGRectNull;
    result->isInZoneBorder = 0;
    result->zoneGraphicType = 0;
  }
  return result;
}

@end