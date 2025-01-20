@interface CPRegion
- (BOOL)isBodyZone;
- (BOOL)isBoxRegion;
- (BOOL)isCompoundShape;
- (BOOL)isGraphicalRegion;
- (BOOL)isImageRegion;
- (BOOL)isIndivisible;
- (BOOL)isListItemRegion;
- (BOOL)isParagraphRegion;
- (BOOL)isRotated;
- (BOOL)isRowRegion;
- (BOOL)isShapeRegion;
- (BOOL)isTableCellRegion;
- (BOOL)isTextRegion;
- (BOOL)isZone;
- (id)copyWithZone:(_NSZone *)a3;
- (id)link;
- (id)nextRegion;
- (int)order;
- (void)accept:(id)a3;
- (void)dealloc;
- (void)setIsCompoundShape:(BOOL)a3;
- (void)setIsImageRegion:(BOOL)a3;
- (void)setIsTextRegion:(BOOL)a3;
- (void)setLink:(id)a3;
- (void)setNextRegion:(id)a3;
- (void)setOrder:(int)a3;
@end

@implementation CPRegion

- (id)link
{
  return self->link;
}

- (void)setLink:(id)a3
{
  self->link = a3;
}

- (void)setOrder:(int)a3
{
  self->order = a3;
}

- (int)order
{
  return self->order;
}

- (void)setNextRegion:(id)a3
{
  nextRegion = self->nextRegion;
  if (nextRegion != a3)
  {

    self->nextRegion = (CPRegion *)a3;
  }
}

- (id)nextRegion
{
  return self->nextRegion;
}

- (BOOL)isIndivisible
{
  if ([(CPRegion *)self isImageRegion]
    || [(CPRegion *)self isShapeRegion]
    || [(CPRegion *)self isRowRegion]
    || [(CPRegion *)self isTableCellRegion])
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    BOOL v3 = [(CPRegion *)self isBoxRegion];
    if (v3)
    {
      LOBYTE(v3) = [(CPRegion *)self isRotated];
    }
  }
  return v3;
}

- (BOOL)isRotated
{
  [(CPChunk *)self rotationAngle];
  return 360.0 - v2 > 0.1 && v2 > 0.1;
}

- (BOOL)isZone
{
  return 0;
}

- (void)setIsCompoundShape:(BOOL)a3
{
  self->isCompoundShape = a3;
}

- (BOOL)isCompoundShape
{
  return self->isCompoundShape;
}

- (BOOL)isGraphicalRegion
{
  if ([(CPObject *)self count] != 1) {
    goto LABEL_7;
  }
  BOOL v3 = [(CPRegion *)self isBoxRegion];
  [(CPObject *)self firstChild];
  if (!v3)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    return isKindOfClass & 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_7:
    char isKindOfClass = 0;
    return isKindOfClass & 1;
  }
  id v4 = [(CPObject *)self firstChild];

  return [v4 isGraphicalRegion];
}

- (void)setIsTextRegion:(BOOL)a3
{
  self->isTextRegion = a3;
}

- (BOOL)isBodyZone
{
  return 0;
}

- (BOOL)isTableCellRegion
{
  return 0;
}

- (BOOL)isRowRegion
{
  double v2 = (void *)[(CPRegion *)self valueForKey:@"regionType"];

  return [v2 isEqualToString:@"row"];
}

- (BOOL)isListItemRegion
{
  return 0;
}

- (BOOL)isParagraphRegion
{
  return 0;
}

- (BOOL)isShapeRegion
{
  return 0;
}

- (void)setIsImageRegion:(BOOL)a3
{
  self->isImageRegion = a3;
}

- (BOOL)isImageRegion
{
  return 0;
}

- (BOOL)isBoxRegion
{
  return 0;
}

- (BOOL)isTextRegion
{
  return self->isTextRegion;
}

- (void)accept:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CPRegion;
  BOOL v3 = [(CPChunk *)&v7 copyWithZone:a3];
  id v4 = v3;
  if (v3) {
    id v5 = v3[13];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CPRegion;
  [(CPObject *)&v3 dealloc];
}

@end