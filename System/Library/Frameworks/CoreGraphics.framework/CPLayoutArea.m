@interface CPLayoutArea
- (BOOL)hasRotatedCharacters;
- (BOOL)isBoxRegion;
- (BOOL)isFirstLayout;
- (BOOL)isGraphicalRegion;
- (BOOL)isImageRegion;
- (BOOL)isRowRegion;
- (BOOL)isShapeRegion;
- (BOOL)isSimilarTo:(id)a3;
- (CGRect)layoutAreaBounds;
- (CPLayoutArea)init;
- (double)selectionBottom;
- (id)description;
- (id)properties;
- (void)accept:(id)a3;
- (void)addColumnBreaks;
- (void)setHasRotatedCharacters:(BOOL)a3;
- (void)setIsFirstLayout:(BOOL)a3;
@end

@implementation CPLayoutArea

- (id)description
{
  return (id)[NSString stringWithFormat:@"LayoutArea[%@...]", objc_msgSend(-[CPObject firstChild](self, "firstChild"), "description")];
}

- (id)properties
{
  v2 = NSString;
  [(CPLayoutArea *)self layoutAreaBounds];
  return (id)[v2 stringWithFormat:@"layoutAreaBounds=%@", objc_msgSend(NSString, "stringWithFormat:", @"CGRect{{%f, %f}, {%f, %f}}", v3, v4, v5, v6)];
}

- (BOOL)hasRotatedCharacters
{
  return *(&self->super.dirtyNormalizedBounds + 2);
}

- (void)setHasRotatedCharacters:(BOOL)a3
{
  *(&self->super.dirtyNormalizedBounds + 2) = a3;
}

- (double)selectionBottom
{
  unsigned int v3 = [(CPObject *)self count];
  if (!v3) {
    return 0.0;
  }
  int v4 = v3;
  objc_msgSend(-[CPObject childAtIndex:](self, "childAtIndex:", 0), "selectionBottom");
  double v6 = v5;
  if (v4 >= 2)
  {
    uint64_t v7 = 1;
    do
    {
      objc_msgSend(-[CPObject childAtIndex:](self, "childAtIndex:", v7), "selectionBottom");
      if (v8 < v6) {
        double v6 = v8;
      }
      uint64_t v7 = (v7 + 1);
    }
    while (v4 != v7);
  }
  return v6;
}

- (CGRect)layoutAreaBounds
{
  BOOL v3 = [(CPChunk *)self shrinksWithChildren];
  [(CPChunk *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  if (v3)
  {
    if ([(CPObject *)self count])
    {
      id v12 = [(CPObject *)self firstChild];
      id v13 = [(CPObject *)self lastChild];
      [v12 leftPad];
      double v15 = v14;
      [v13 rightPad];
      if (v15 + v16 > 0.0)
      {
        double v17 = -0.0;
        if (v15 > 0.0) {
          double v17 = v15;
        }
        double v9 = v9 + v17;
        double v5 = v5 - fmax(v15, 0.0);
        if (v16 > 0.0) {
          double v9 = v16 + v9;
        }
      }
    }
  }
  double v18 = v5;
  double v19 = v7;
  double v20 = v9;
  double v21 = v11;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (BOOL)isShapeRegion
{
  return 0;
}

- (BOOL)isImageRegion
{
  return 0;
}

- (BOOL)isRowRegion
{
  return 0;
}

- (BOOL)isGraphicalRegion
{
  return 0;
}

- (BOOL)isBoxRegion
{
  return 0;
}

- (void)addColumnBreaks
{
  int v3 = [(CPObject *)self count];
  uint64_t v4 = (v3 - 1);
  if (v3 > 1)
  {
    uint64_t v5 = 0;
    do
      objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->super.super.super.super.children, "objectAtIndex:", v5++), "setHasColumnBreak:", 1);
    while (v4 != v5);
  }
  if (v3 >= 1)
  {
    double v6 = (void *)[(NSMutableArray *)self->super.super.super.super.children objectAtIndex:v4];
    [v6 setHasColumnBreak:0];
  }
}

- (void)setIsFirstLayout:(BOOL)a3
{
  *(&self->super.dirtyNormalizedBounds + 1) = a3;
}

- (BOOL)isFirstLayout
{
  return *(&self->super.dirtyNormalizedBounds + 1);
}

- (BOOL)isSimilarTo:(id)a3
{
  return 0;
}

- (void)accept:(id)a3
{
}

- (CPLayoutArea)init
{
  v3.receiver = self;
  v3.super_class = (Class)CPLayoutArea;
  CGRect result = [(CPRotatedRegion *)&v3 init];
  if (result) {
    *(&result->super.dirtyNormalizedBounds + 1) = 0;
  }
  return result;
}

@end