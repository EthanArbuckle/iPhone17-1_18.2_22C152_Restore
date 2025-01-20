@interface CPTable
- (CGColor)backgroundColor;
- (CGRect)tableBounds;
- (CPTable)initWithBounds:(CGRect)a3;
- (double)columnX;
- (double)rowY;
- (id)backgroundGraphicAtIndex:(unsigned int)a3;
- (unsigned)backgroundGraphicCount;
- (unsigned)columnCount;
- (unsigned)rowCount;
- (unsigned)usedGraphicCount;
- (void)dealloc;
- (void)dispose;
- (void)finalize;
- (void)incrementUsedGraphicCount;
- (void)setBackgroundGraphics:(id)a3;
- (void)setColumnCount:(unsigned int)a3;
- (void)setRowCount:(unsigned int)a3;
@end

@implementation CPTable

- (unsigned)backgroundGraphicCount
{
  return self->backgroundGraphicCount;
}

- (double)columnX
{
  return self->columnX;
}

- (double)rowY
{
  return self->rowY;
}

- (CGRect)tableBounds
{
  double x = self->tableBounds.origin.x;
  double y = self->tableBounds.origin.y;
  double width = self->tableBounds.size.width;
  double height = self->tableBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (unsigned)usedGraphicCount
{
  return self->usedGraphicCount;
}

- (void)incrementUsedGraphicCount
{
}

- (id)backgroundGraphicAtIndex:(unsigned int)a3
{
  if (self->backgroundGraphicCount <= a3) {
    return 0;
  }
  else {
    return self->backgroundGraphics[a3];
  }
}

- (void)setBackgroundGraphics:(id)a3
{
  backgroundGraphics = self->backgroundGraphics;
  if (backgroundGraphics)
  {
    if (self->backgroundGraphicCount)
    {
      unint64_t v6 = 0;
      do

      while (v6 < self->backgroundGraphicCount);
      backgroundGraphics = self->backgroundGraphics;
    }
    free(backgroundGraphics);
    self->backgroundGraphics = 0;
  }
  self->backgroundGraphicCount = 0;
  if (a3)
  {
    unsigned int v7 = [a3 count];
    self->backgroundGraphicCount = v7;
    if (v7)
    {
      self->backgroundGraphics = (id *)malloc_type_malloc(8 * v7, 0x80040B8603338uLL);
      if (self->backgroundGraphicCount)
      {
        unint64_t v8 = 0;
        do
        {
          self->backgroundGraphics[v8] = (id)[a3 objectAtIndex:v8];
          ++v8;
        }
        while (v8 < self->backgroundGraphicCount);
      }
    }
  }
}

- (CGColor)backgroundColor
{
  backgroundColor = self->backgroundColor;
  if (!backgroundColor)
  {
    if (self->backgroundGraphicCount == 1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v4 = (CGColor *)[*self->backgroundGraphics fillColor];
      if (v4)
      {
        backgroundColor = v4;
        CFRetain(v4);
        self->backgroundColor = backgroundColor;
      }
      else
      {
        return self->backgroundColor;
      }
    }
    else
    {
      backgroundColor = CGColorCreateSRGB(1.0, 1.0, 1.0, 1.0);
      self->backgroundColor = backgroundColor;
    }
  }
  return backgroundColor;
}

- (unsigned)columnCount
{
  return self->columnCount;
}

- (void)setColumnCount:(unsigned int)a3
{
  self->columnCount = a3;
  columnX = self->columnX;
  if (columnX)
  {
    free(columnX);
    self->columnX = 0;
  }
  self->columnX = (double *)malloc_type_calloc(a3 + 1, 8uLL, 0x100004000313F17uLL);
}

- (unsigned)rowCount
{
  return self->rowCount;
}

- (void)setRowCount:(unsigned int)a3
{
  self->rowCount = a3;
  rowY = self->rowY;
  if (rowY)
  {
    free(rowY);
    self->rowY = 0;
  }
  self->rowY = (double *)malloc_type_calloc(a3 + 1, 8uLL, 0x100004000313F17uLL);
}

- (void)dealloc
{
  [(CPTable *)self dispose];
  v3.receiver = self;
  v3.super_class = (Class)CPTable;
  [(CPObject *)&v3 dealloc];
}

- (void)finalize
{
  [(CPTable *)self dispose];
  v3.receiver = self;
  v3.super_class = (Class)CPTable;
  [(CPTable *)&v3 finalize];
}

- (void)dispose
{
  if (!self->disposed)
  {
    free(self->rowY);
    self->rowY = 0;
    free(self->columnX);
    self->columnX = 0;
    backgroundColor = self->backgroundColor;
    if (backgroundColor) {
      CFRelease(backgroundColor);
    }
    self->backgroundColor = 0;
    backgroundGraphics = self->backgroundGraphics;
    if (backgroundGraphics)
    {
      if (self->backgroundGraphicCount)
      {
        unint64_t v5 = 0;
        do

        while (v5 < self->backgroundGraphicCount);
        backgroundGraphics = self->backgroundGraphics;
      }
      free(backgroundGraphics);
      self->backgroundGraphics = 0;
    }
    self->backgroundGraphicCount = 0;
    self->disposed = 1;
  }
}

- (CPTable)initWithBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)CPTable;
  CGRect result = [(CPChunk *)&v8 init];
  if (result)
  {
    result->tableBounds.origin.CGFloat x = x;
    result->tableBounds.origin.CGFloat y = y;
    result->tableBounds.size.CGFloat width = width;
    result->tableBounds.size.CGFloat height = height;
  }
  return result;
}

@end