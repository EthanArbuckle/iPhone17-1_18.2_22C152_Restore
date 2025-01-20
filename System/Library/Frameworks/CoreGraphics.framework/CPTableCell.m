@interface CPTableCell
- ($0AC6E346AE4835514AAA8AC86D8F4844)columnSpan;
- ($0AC6E346AE4835514AAA8AC86D8F4844)rowSpan;
- (CGColor)backgroundColor;
- (CGColor)colorOfBorder:(int)a3;
- (CGRect)boundsOfBorder:(int)a3;
- (CGRect)cellBounds;
- (CPTableCell)initWithBounds:(CGRect)a3;
- (id)backgroundGraphicAtIndex:(unsigned int)a3;
- (id)graphicObjectOfBorder:(int)a3 atIndex:(unsigned int)a4;
- (int64_t)compareCellOrdinal:(id)a3;
- (unsigned)backgroundGraphicCount;
- (unsigned)graphicCountOfBorder:(int)a3;
- (void)dealloc;
- (void)dispose;
- (void)finalize;
- (void)setBackgroundGraphics:(id)a3;
- (void)setBorder:(int)a3 bounds:(CGRect)a4 graphics:(id)a5;
- (void)setColumnSpan:(id)a3;
- (void)setRowSpan:(id)a3;
@end

@implementation CPTableCell

- (unsigned)backgroundGraphicCount
{
  return self->backgroundGraphicCount;
}

- (void)setColumnSpan:(id)a3
{
  self->columnSpan = ($5CFEE62CA76FAE445C6F9DBCEE669C70)a3;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)columnSpan
{
  p_columnSpan = &self->columnSpan;
  int64_t location = self->columnSpan.location;
  int64_t length = p_columnSpan->length;
  result.var1 = length;
  result.var0 = location;
  return result;
}

- (void)setRowSpan:(id)a3
{
  self->rowSpan = ($5CFEE62CA76FAE445C6F9DBCEE669C70)a3;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)rowSpan
{
  p_rowSpan = &self->rowSpan;
  int64_t location = self->rowSpan.location;
  int64_t length = p_rowSpan->length;
  result.var1 = length;
  result.var0 = location;
  return result;
}

- (CGRect)cellBounds
{
  double x = self->cellBounds.origin.x;
  double y = self->cellBounds.origin.y;
  double width = self->cellBounds.size.width;
  double height = self->cellBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (int64_t)compareCellOrdinal:(id)a3
{
  uint64_t v5 = [(CPTableCell *)self rowSpan];
  uint64_t v6 = [a3 rowSpan];
  if (v5 < v6) {
    return -1;
  }
  if (v5 > v6) {
    return 1;
  }
  uint64_t v8 = [(CPTableCell *)self columnSpan];
  uint64_t v9 = [a3 columnSpan];
  if (v8 < v9) {
    return -1;
  }
  else {
    return v8 > v9;
  }
}

- (id)graphicObjectOfBorder:(int)a3 atIndex:(unsigned int)a4
{
  borders = self->borders;
  if (borders[a3].var2 <= a4) {
    return 0;
  }
  else {
    return borders[a3].var3[a4];
  }
}

- (unsigned)graphicCountOfBorder:(int)a3
{
  return self->borders[a3].var2;
}

- (CGColor)colorOfBorder:(int)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  borders = self->borders;
  if (!borders[a3].var1)
  {
    if (borders[a3].var2 == 1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v6 = *self->borders[a3].var3;
      if ([v6 parent] && (v7 = objc_msgSend(v6, "fillColor")) != 0
        || (v7 = (void *)[v6 strokeColor]) != 0)
      {
        CFRetain(v7);
        self->borders[a3].var1 = (CGColor *)v7;
      }
    }
    else
    {
      DeviceRGB = CGColorSpaceCreateDeviceRGB();
      v10[0] = xmmword_1852950E0;
      v10[1] = unk_1852950F0;
      self->borders[a3].var1 = CGColorCreate(DeviceRGB, (const CGFloat *)v10);
      CGColorSpaceRelease(DeviceRGB);
    }
  }
  return self->borders[a3].var1;
}

- (CGRect)boundsOfBorder:(int)a3
{
  v3 = &self->borders[a3];
  double x = v3->var0.origin.x;
  double y = v3->var0.origin.y;
  double width = v3->var0.size.width;
  double height = v3->var0.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setBorder:(int)a3 bounds:(CGRect)a4 graphics:(id)a5
{
  borders = self->borders;
  uint64_t v9 = &borders[a3];
  v9->var0 = a4;
  var3 = v9->var3;
  if (var3)
  {
    unsigned int var2 = borders[a3].var2;
    if (var2)
    {
      unsigned int v12 = var2 - 1;
      do
      {
        uint64_t v13 = v12;
      }
      while (v13);
      var3 = self->borders[a3].var3;
    }
    free(var3);
    self->borders[a3].var3 = 0;
  }
  if (a5)
  {
    unsigned int v14 = [a5 count];
    unsigned int v15 = v14;
    if (v14)
    {
      uint64_t v16 = 0;
      self->borders[a3].var3 = (id *)malloc_type_malloc(8 * v14, 0x80040B8603338uLL);
      do
      {
        self->borders[a3].var3[v16] = (id)[a5 objectAtIndex:v16];
        ++v16;
      }
      while (v15 != v16);
    }
  }
  else
  {
    unsigned int v15 = 0;
  }
  self->borders[a3].unsigned int var2 = v15;
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

- (void)dealloc
{
  [(CPTableCell *)self dispose];
  v3.receiver = self;
  v3.super_class = (Class)CPTableCell;
  [(CPObject *)&v3 dealloc];
}

- (void)finalize
{
  [(CPTableCell *)self dispose];
  v3.receiver = self;
  v3.super_class = (Class)CPTableCell;
  [(CPTableCell *)&v3 finalize];
}

- (void)dispose
{
  if (self->borders)
  {
    for (uint64_t i = 0; i != 4; ++i)
    {
      v4 = &self->borders[i];
      var1 = v4->var1;
      unsigned int var2 = v4->var2;
      var3 = v4->var3;
      if (var1) {
        CFRelease(var1);
      }
      if (var3)
      {
        if (var2)
        {
          unsigned int v8 = var2 - 1;
          do
          {
            uint64_t v9 = v8;
          }
          while (v9);
        }
        free(var3);
      }
    }
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
        unint64_t v12 = 0;
        do

        while (v12 < self->backgroundGraphicCount);
        backgroundGraphics = self->backgroundGraphics;
      }
      free(backgroundGraphics);
      self->backgroundGraphics = 0;
    }
    self->backgroundGraphicCount = 0;
    free(self->borders);
    self->borders = 0;
  }
}

- (CPTableCell)initWithBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v12.receiver = self;
  v12.super_class = (Class)CPTableCell;
  unsigned int v7 = [(CPChunk *)&v12 init];
  unsigned int v8 = v7;
  if (v7)
  {
    v7->cellBounds.origin.CGFloat x = x;
    v7->cellBounds.origin.CGFloat y = y;
    v7->cellBounds.size.CGFloat width = width;
    v7->cellBounds.size.CGFloat height = height;
    v7->rowSpan = ($5CFEE62CA76FAE445C6F9DBCEE669C70)CPRangeNull;
    v7->columnSpan = ($5CFEE62CA76FAE445C6F9DBCEE669C70)CPRangeNull;
    uint64_t v9 = ($706D99F5A9CDF7F288EC05A809D4EA59 *)malloc_type_calloc(4uLL, 0x38uLL, 0x10A0040575B0D7CuLL);
    uint64_t v10 = 0;
    v8->borders = v9;
    do
      v8->borders[v10++].var0 = CGRectNull;
    while (v10 != 4);
  }
  return v8;
}

@end