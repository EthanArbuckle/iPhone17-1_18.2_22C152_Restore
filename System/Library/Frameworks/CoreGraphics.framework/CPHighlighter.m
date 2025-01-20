@interface CPHighlighter
+ (BOOL)reconstructHighlightFor:(id)a3;
- (CGColor)color;
- (CPHighlighter)initWithTextLine:(id)a3 inZone:(id)a4 ofColor:(CGColor *)a5;
- (CPPDFStyle)highlightedStyle;
- (CPPDFStyle)style;
- (void)highlight;
- (void)setHighlightedStyle:(CPPDFStyle *)a3;
- (void)setStyle:(CPPDFStyle *)a3;
@end

@implementation CPHighlighter

- (void)setHighlightedStyle:(CPPDFStyle *)a3
{
  self->highlightedStyle = a3;
}

- (CPPDFStyle)highlightedStyle
{
  return self->highlightedStyle;
}

- (void)setStyle:(CPPDFStyle *)a3
{
  self->style = a3;
}

- (CPPDFStyle)style
{
  return self->style;
}

- (CGColor)color
{
  return self->color;
}

- (void)highlight
{
  id v3 = [(CPTextLine *)self->textLine charSequence];
  [v3 map:styleWithHighlight passing:self];
  id v4 = [(CPObject *)self->boundingZone parent];
  v5 = (void *)[v4 parent];
  v6 = (void *)[v5 charactersInZone];
  if (v6)
  {
    [v6 addCharsFromSequence:v3];
  }
  else
  {
    v7 = (void *)[v3 copy];
    [v5 setCharactersInZone:v7];
  }
  unsigned int v8 = [(CPObject *)self->boundingZone count];
  if (v8)
  {
    uint64_t v9 = v8 - 1;
    do
    {
      objc_msgSend(v5, "add:", -[CPObject childAtIndex:](self->boundingZone, "childAtIndex:", v9));
      uint64_t v9 = (v9 - 1);
    }
    while (v9 != -1);
  }
  boundingZone = self->boundingZone;
  uint64_t v11 = [(CPObject *)boundingZone ancestorOfClass:objc_opt_class()];
  if (v11)
  {
    uint64_t v12 = v11;
    id v13 = [(CPZone *)boundingZone zoneBorders];
    uint64_t v14 = [v13 count];
    if (v14)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        v16 = (void *)[v13 objectAtIndex:i];
        v17 = (void *)[v16 graphicObjects];
        uint64_t v18 = [v17 count];
        if (v18)
        {
          for (uint64_t j = 0; j != v18; ++j)
          {
            v20 = (void *)[v17 objectAtIndex:j];
            if ([v20 parent] && !objc_msgSend(v20, "user")) {
              [v20 setUser:v12];
            }
          }
        }
        int v21 = [v16 neighborCount];
        if (v21)
        {
          int v22 = v21;
          uint64_t v23 = 0;
          do
          {
            v24 = objc_msgSend((id)objc_msgSend(v16, "neighborAtIndex:", v23), "neighborShape");
            if (![v24 user]) {
              [v24 setUser:v12];
            }
            uint64_t v23 = (v23 + 1);
          }
          while (v22 != v23);
        }
      }
    }
  }

  [v4 remove];
}

- (CPHighlighter)initWithTextLine:(id)a3 inZone:(id)a4 ofColor:(CGColor *)a5
{
  v9.receiver = self;
  v9.super_class = (Class)CPHighlighter;
  result = [(CPHighlighter *)&v9 init];
  if (result)
  {
    result->boundingZone = (CPZone *)a4;
    result->textLine = (CPTextLine *)a3;
    result->color = a5;
  }
  return result;
}

+ (BOOL)reconstructHighlightFor:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
LABEL_2:
    LOBYTE(v4) = 0;
    return v4;
  }
  LODWORD(v4) = [a3 isRectangular];
  if (v4)
  {
    uint64_t v4 = [a3 parent];
    if (v4)
    {
      v5 = (void *)v4;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_2;
      }
      uint64_t v4 = [v5 parent];
      if (!v4) {
        return v4;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_2;
      }
      v6 = (void *)[a3 textLinesInZone];
      if ([v6 count] != 1) {
        goto LABEL_2;
      }
      if ([v5 countOfClass:objc_opt_class()] != 1) {
        goto LABEL_2;
      }
      v7 = (void *)[v6 objectAtIndex:0];
      [a3 zoneBounds];
      double v9 = v8;
      [v7 bounds];
      if (v9 > v10 * 3.0) {
        goto LABEL_2;
      }
      LODWORD(v4) = objc_msgSend((id)objc_msgSend(v7, "charSequence"), "map:passing:", canBeHighlighted, 0);
      if (v4)
      {
        uint64_t v4 = [a3 newBackgroundColor];
        if (v4)
        {
          uint64_t v11 = (const void *)v4;
          uint64_t v12 = [[CPHighlighter alloc] initWithTextLine:v7 inZone:a3 ofColor:v4];
          [(CPHighlighter *)v12 highlight];

          CFRelease(v11);
          LOBYTE(v4) = 1;
        }
      }
    }
  }
  return v4;
}

@end