@interface CPTextObject
- (double)maxFontLineHeight;
- (float)maxFontSize;
- (void)calculateMetrics;
- (void)clearCachedInfo;
- (void)translateObjectYBy:(double)a3;
@end

@implementation CPTextObject

- (void)translateObjectYBy:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CPTextObject;
  -[CPChunk translateObjectYBy:](&v5, sel_translateObjectYBy_);
  self->anchor.y = self->anchor.y + a3;
}

- (void)clearCachedInfo
{
  self->maxFontSize = 0.0;
  self->maxFontLineHeight = 0.0;
  self->metricInfoCalculated = 0;
}

- (double)maxFontLineHeight
{
  if (!self->metricInfoCalculated) {
    [(CPTextObject *)self calculateMetrics];
  }
  return self->maxFontLineHeight;
}

- (float)maxFontSize
{
  if (!self->metricInfoCalculated) {
    [(CPTextObject *)self calculateMetrics];
  }
  return self->maxFontSize;
}

- (void)calculateMetrics
{
  self->maxFontSize = 0.0;
  self->float maxFontLineHeight = 0.0;
  int v3 = [(CPObject *)self count];
  if (v3 >= 1)
  {
    int v4 = v3;
    uint64_t v5 = 0;
    do
    {
      id v6 = [(CPObject *)self childAtIndex:v5];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v6 maxFontSize];
        self->maxFontSize = fmaxf(v7, self->maxFontSize);
        [v6 maxFontLineHeight];
        *(float *)&double v8 = v8;
        float maxFontLineHeight = self->maxFontLineHeight;
        self->float maxFontLineHeight = fmaxf(*(float *)&v8, maxFontLineHeight);
      }
      uint64_t v5 = (v5 + 1);
    }
    while (v4 != v5);
  }
  self->metricInfoCalculated = 1;
}

@end