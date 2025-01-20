@interface CPTextLine
- ($F82BA7CF80F7A1221027BFFB2739E57F)firstWord;
- ($F82BA7CF80F7A1221027BFFB2739E57F)lastWord;
- ($F82BA7CF80F7A1221027BFFB2739E57F)wordArray;
- ($F82BA7CF80F7A1221027BFFB2739E57F)wordArrayOfSize:(unsigned int)a3;
- ($F82BA7CF80F7A1221027BFFB2739E57F)wordAtIndex:(unsigned int)a3;
- (BOOL)changesFontAt:(id)a3;
- (BOOL)hasBeenProcessed;
- (BOOL)hasBeenSplit;
- (BOOL)hasDropCap;
- (BOOL)hasJustifiedAlignment;
- (BOOL)hasTabs;
- (BOOL)hyphenated;
- (BOOL)irregular;
- (BOOL)isIndivisible;
- (BOOL)isListItem;
- (BOOL)isMonospaced;
- (BOOL)lineBreakAfter;
- (BOOL)mapToWordPairs:(void *)a3 passing:(void *)a4;
- (BOOL)mapToWordPairsWithIndex:(void *)a3 passing:(void *)a4;
- (BOOL)mapToWords:(void *)a3 passing:(void *)a4;
- (BOOL)mapToWordsWithIndex:(void *)a3 passing:(void *)a4;
- (BOOL)overlapsHorizontally:(CGRect)a3;
- (BOOL)overlapsWith:(id)a3;
- (BOOL)removeTextLines:(id)a3 whereTrue:(void *)a4 passing:(void *)a5;
- (BOOL)styleIsUniform:(CPPDFStyle *)a3 styleFlags:(unsigned __int16)a4;
- (CGPoint)anchor;
- (CGRect)bounds;
- (CGRect)boundsOfWordAtIndex:(unsigned int)a3;
- (CGRect)normalizedBounds;
- (CPInlineContainer)inlineList;
- (CPTextLine)init;
- (double)baseline;
- (double)medianFontSize;
- (double)monospaceWidth;
- (double)rotationAngle;
- (float)maximumLetterGap;
- (float)maximumWordGap;
- (id)attributes;
- (id)charSequence;
- (id)columnBreaks;
- (id)copyWithZone:(_NSZone *)a3;
- (id)newTextLineFromWordAt:(unsigned int)a3 lengthInWords:(unsigned int)a4;
- (id)properties;
- (int)align;
- (int)levels;
- (int)tabsBefore;
- (int64_t)baseLineAscending:(id)a3;
- (int64_t)baseLineDescending:(id)a3;
- (int64_t)baseLineDescendingApprox:(id)a3;
- (int64_t)topIsAbove:(id)a3;
- (int64_t)zOrder;
- (unsigned)inlineCount;
- (unsigned)leftSpacerIndex;
- (unsigned)listSpacerIndex;
- (unsigned)rightSpacerIndex;
- (unsigned)spacesBeforeWordAtIndex:(unsigned int)a3;
- (unsigned)wordCount;
- (void)accept:(id)a3;
- (void)anchorChunk:(id)a3 atWordIndex:(unsigned int)a4;
- (void)dealloc;
- (void)dispose;
- (void)finalize;
- (void)recomputeBaseline;
- (void)recomputeLevels;
- (void)setBaseline:(double)a3;
- (void)setBaselineToNull;
- (void)setCharSequence:(id)a3;
- (void)setColumnBreaks:(id)a3;
- (void)setHasBeenProcessed:(BOOL)a3;
- (void)setHasBeenSplit:(BOOL)a3;
- (void)setHasTabs:(BOOL)a3;
- (void)setIrregular:(BOOL)a3;
- (void)setIsListItem:(BOOL)a3;
- (void)setLeftSpacerIndex:(unsigned int)a3;
- (void)setLevels:(int)a3;
- (void)setLineBreakAfter:(BOOL)a3;
- (void)setListSpacerIndex:(unsigned int)a3;
- (void)setMaximumLetterGap:(float)a3;
- (void)setMaximumWordGap:(float)a3;
- (void)setRightSpacerIndex:(unsigned int)a3;
- (void)setSpaces:(unsigned int)a3 beforeWordAtIndex:(unsigned int)a4;
- (void)setTabsBefore:(int)a3;
- (void)translateObjectYBy:(double)a3;
@end

@implementation CPTextLine

- (void)setLineBreakAfter:(BOOL)a3
{
  self->lineBreakAfter = a3;
}

- (BOOL)lineBreakAfter
{
  return self->lineBreakAfter;
}

- (void)setListSpacerIndex:(unsigned int)a3
{
  self->listSpacerIndex = a3;
}

- (unsigned)listSpacerIndex
{
  return self->listSpacerIndex;
}

- (void)setIsListItem:(BOOL)a3
{
  self->isListItem = a3;
}

- (BOOL)isListItem
{
  return self->isListItem;
}

- (void)setRightSpacerIndex:(unsigned int)a3
{
  self->rightSpacerIndex = a3;
}

- (unsigned)rightSpacerIndex
{
  return self->rightSpacerIndex;
}

- (void)setLeftSpacerIndex:(unsigned int)a3
{
  self->leftSpacerIndex = a3;
}

- (unsigned)leftSpacerIndex
{
  return self->leftSpacerIndex;
}

- (CGRect)normalizedBounds
{
  p_normalizedBounds = &self->normalizedBounds;
  double x = self->normalizedBounds.origin.x;
  double y = self->normalizedBounds.origin.y;
  if (x == INFINITY || y == INFINITY)
  {
    [(CPCharSequence *)self->charSequence normalizedBounds];
    p_normalizedBounds->origin.double x = x;
    p_normalizedBounds->origin.double y = y;
    p_normalizedBounds->size.double width = width;
    p_normalizedBounds->size.double height = height;
  }
  else
  {
    double width = self->normalizedBounds.size.width;
    double height = self->normalizedBounds.size.height;
  }
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (double)rotationAngle
{
  [(CPCharSequence *)self->charSequence averageRotation];
  return result;
}

- (double)medianFontSize
{
  unsigned int v3 = [(CPCharSequence *)self->charSequence length];
  if (!v3) {
    return 0.0;
  }
  unsigned int v4 = v3;
  v5 = (float *)malloc_type_malloc(4 * v3, 0x100004052888210uLL);
  for (uint64_t i = 0; i != v4; v5[i++] = v7)
    float v7 = *(double *)((void)[(CPCharSequence *)self->charSequence charAtIndex:i][160] + 72);
  unsigned int v8 = v4 - 1;
  unsigned int v9 = (v4 - 1) >> 1;
  if (v4 - 1 < 2)
  {
    unsigned int v10 = 0;
  }
  else
  {
    unsigned int v10 = 0;
    LODWORD(v11) = 1;
    do
    {
      uint64_t v12 = (v8 + v10) >> 1;
      float v13 = v5[v12];
      float v14 = v5[v8];
      if (v13 <= v14)
      {
        float v13 = v5[v8];
      }
      else
      {
        v5[v12] = v14;
        v5[v8] = v13;
      }
      float v15 = v5[v10];
      if (v15 > v13)
      {
        v5[v10] = v13;
        v5[v8] = v15;
        float v15 = v5[v10];
      }
      float v16 = v5[v12];
      if (v16 > v15)
      {
        v5[v12] = v15;
        v5[v10] = v16;
        float v16 = v5[v12];
      }
      v5[v12] = v5[v11];
      v5[v11] = v16;
      float v17 = v5[v10];
      LODWORD(v12) = v8;
      while (1)
      {
        do
        {
          uint64_t v11 = (v11 + 1);
          float v18 = v5[v11];
        }
        while (v18 < v17);
        do
        {
          int v19 = v12;
          uint64_t v12 = (v12 - 1);
          float v20 = v5[v12];
        }
        while (v20 > v17);
        if (v12 < v11) {
          break;
        }
        v5[v11] = v20;
        v5[v12] = v18;
      }
      v5[v10] = v20;
      v5[v12] = v17;
      if (v12 <= v9) {
        unsigned int v10 = v11;
      }
      if (v12 >= v9) {
        unsigned int v8 = v19 - 2;
      }
      LODWORD(v11) = v10 + 1;
    }
    while (v8 > v10 + 1);
  }
  if (v8 <= v10)
  {
    float v24 = v5[v9];
  }
  else
  {
    float v22 = v5[v10];
    float v23 = v5[v8];
    if (v22 > v23)
    {
      v5[v10] = v23;
      v5[v8] = v22;
      float v23 = v22;
      float v22 = v5[v10];
    }
    float v24 = (float)(v22 + v23) * 0.5;
  }
  double v21 = v24;
  free(v5);
  return v21;
}

- (BOOL)hasDropCap
{
  if (!self->wordCount) {
    return 0;
  }
  unsigned int v3 = [(CPTextLine *)self wordAtIndex:0];
  BOOL result = 0;
  if (v3->var1 != 1)
  {
    v5 = [(CPCharSequence *)self->charSequence charAtIndex:v3->var0];
    v6 = [(CPCharSequence *)self->charSequence charAtIndex:v3->var0 + 1];
    double var11 = v5->var7->var11;
    double v8 = v6->var7->var11;
    return var11 > v8 + v8 || v8 > var11 + var11;
  }
  return result;
}

- (int64_t)topIsAbove:(id)a3
{
  [(CPCharSequence *)self->charSequence bounds];
  double v8 = v5;
  double v9 = v7;
  if (v6 < 0.0 || v7 < 0.0)
  {
    *(CGRect *)&double v4 = CGRectStandardize(*(CGRect *)&v4);
    double v8 = v10;
    double v9 = v11;
  }
  objc_msgSend(*((id *)a3 + 16), "bounds", v4);
  if (v14 < 0.0 || v15 < 0.0) {
    *(CGRect *)(&v13 - 1) = CGRectStandardize(*(CGRect *)&v12);
  }
  double v16 = v13 + v15;
  if (v8 + v9 > v16) {
    return -1;
  }
  else {
    return v8 + v9 < v16;
  }
}

- (id)attributes
{
  return @"result";
}

- (void)setIrregular:(BOOL)a3
{
  self->irregular = a3;
}

- (BOOL)irregular
{
  return self->irregular;
}

- (void)setMaximumWordGap:(float)a3
{
  self->maximumWordGap = a3;
}

- (float)maximumWordGap
{
  return self->maximumWordGap;
}

- (void)setMaximumLetterGap:(float)a3
{
  self->maximumLetterGap = a3;
}

- (float)maximumLetterGap
{
  return self->maximumLetterGap;
}

- (void)recomputeLevels
{
  if (self->wordCount)
  {
    int v3 = 0;
    [(CPTextLine *)self mapToWordsWithIndex:getMaxLevel passing:&v3];
    self->levels = v3 + 1;
  }
  else
  {
    self->levels = 0;
  }
}

- (void)setLevels:(int)a3
{
  self->levels = a3;
}

- (int)levels
{
  return self->levels;
}

- (void)setSpaces:(unsigned int)a3 beforeWordAtIndex:(unsigned int)a4
{
  uint64_t wordCount = self->wordCount;
  if (wordCount > a4)
  {
    if (a4) {
      BOOL v7 = a3 == 0;
    }
    else {
      BOOL v7 = 0;
    }
    if (v7) {
      unsigned int v8 = 1;
    }
    else {
      unsigned int v8 = a3;
    }
    spacesBefore = self->spacesBefore;
    if (spacesBefore) {
      goto LABEL_9;
    }
    if (a4) {
      BOOL v10 = v8 == 1;
    }
    else {
      BOOL v10 = 0;
    }
    char v11 = v10;
    if (v8 | a4 && (v11 & 1) == 0)
    {
      spacesBefore = (unsigned int *)malloc_type_malloc(4 * wordCount, 0x100004052888210uLL);
      self->spacesBefore = spacesBefore;
      unsigned int *spacesBefore = 0;
      if (self->wordCount >= 2)
      {
        unint64_t v12 = 1;
        do
          spacesBefore[v12++] = 1;
        while (v12 < self->wordCount);
      }
LABEL_9:
      spacesBefore[a4] = v8;
    }
  }
}

- (unsigned)spacesBeforeWordAtIndex:(unsigned int)a3
{
  if (self->wordCount <= a3) {
    return 0;
  }
  spacesBefore = self->spacesBefore;
  if (spacesBefore) {
    return spacesBefore[a3];
  }
  else {
    return a3 != 0;
  }
}

- (double)monospaceWidth
{
  double monospaceWidth = self->monospaceWidth;
  if (monospaceWidth == 0.0)
  {
    unsigned int v4 = [(CPCharSequence *)self->charSequence length];
    double monospaceWidth = 0.0;
    if (v4)
    {
      uint64_t wordCount = self->wordCount;
      double v6 = self->monospaceWidth;
      if (wordCount)
      {
        p_size = &self->wordArray->var4.size;
        do
        {
          double width = p_size->width;
          p_size += 3;
          double v6 = width + v6;
          self->double monospaceWidth = v6;
          --wordCount;
        }
        while (wordCount);
      }
      double v9 = v6 / (double)v4;
      self->double monospaceWidth = v9;
      if (v9 < 4.0) {
        goto LABEL_9;
      }
      double v10 = v9 * 0.0625;
      double v11 = (v10 + v10) / (double)v4;
      unint64_t v12 = [(CPCharSequence *)self->charSequence charAtIndex:0];
      double v13 = self->monospaceWidth;
      v15[0] = *(void *)&v12->var0.var0.origin.x;
      *(double *)&v15[1] = v13;
      *(double *)&v15[2] = v10;
      *(double *)&v15[3] = v11;
      if ([(CPCharSequence *)self->charSequence map:isAtWidthMultiple passing:v15]) {
        return self->monospaceWidth;
      }
      else {
LABEL_9:
      }
        self->double monospaceWidth = 0.0;
    }
  }
  return monospaceWidth;
}

- (BOOL)isMonospaced
{
  [(CPTextLine *)self monospaceWidth];
  return v2 != 0.0;
}

- (BOOL)styleIsUniform:(CPPDFStyle *)a3 styleFlags:(unsigned __int16)a4
{
  uniformStyle = self->uniformStyle;
  if (uniformStyle && self->uniformStyleFlags == a4)
  {
    if (a3) {
      *a3 = uniformStyle;
    }
    return 1;
  }
  self->uniformStyleFlags = a4;
  if (![(CPCharSequence *)self->charSequence length])
  {
    self->uniformStyle = 0;
    if (a3) {
      *a3 = 0;
    }
    return 1;
  }
  BOOL v7 = (CPPDFStyle *)[(CPCharSequence *)self->charSequence charAtIndex:0][160];
  self->uniformStyle = v7;
  double v9 = v7;
  uint64_t v10 = 0;
  LOWORD(v10) = self->uniformStyleFlags;
  BOOL result = [(CPCharSequence *)self->charSequence map:sameStyle passing:&v9];
  if (!result) {
    self->uniformStyle = 0;
  }
  if (a3) {
    *a3 = self->uniformStyle;
  }
  return result;
}

- (void)recomputeBaseline
{
  unsigned int wordCount = self->wordCount;
  if (wordCount)
  {
    double v4 = (double)[(CPCharSequence *)self->charSequence charAtIndex:self->wordArray->var0][104];
    if (wordCount >= 3)
    {
      double v5 = [(CPCharSequence *)self->charSequence charAtIndex:self->wordArray[1].var0];
      if (v4 == self->baseline) {
        return;
      }
      if (self->wordCount)
      {
        uint64_t v6 = 0;
        unint64_t v7 = 0;
        double y = v5->var4.y;
        unsigned int v9 = 1;
        do
        {
          if (vabdd_f64(v4, (double)[(CPCharSequence *)self->charSequence charAtIndex:self->wordArray[v6].var0][104]) < 2.0)++v9; {
          ++v7;
          }
          unint64_t v10 = self->wordCount;
          ++v6;
        }
        while (v7 < v10);
        if (v9 <= v10 >> 1) {
          double v4 = y;
        }
      }
    }
    [(CPTextLine *)self setBaseline:v4];
  }
}

- (void)translateObjectYBy:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CPTextLine;
  -[CPTextObject translateObjectYBy:](&v5, sel_translateObjectYBy_);
  self->baseline = self->baseline + a3;
}

- (BOOL)isIndivisible
{
  return 1;
}

- (void)setBaselineToNull
{
  self->baseLineIsNull = 1;
}

- (void)setBaseline:(double)a3
{
  self->baseLineIsNull = 1;
  self->baseline = a3;
}

- (double)baseline
{
  if (self->baseLineIsNull)
  {
    unsigned int v3 = [(CPCharSequence *)self->charSequence length];
    double v4 = malloc_type_malloc(8 * v3, 0x100004000313F17uLL);
    if (v3)
    {
      for (uint64_t i = 0; i != v3; ++i)
        v4[i] = (void)[(CPCharSequence *)self->charSequence charAtIndex:i][104];
      double v6 = medianDouble((uint64_t)v4, v3);
    }
    else
    {
      double v6 = 0.0;
    }
    self->baseline = v6;
    self->baseLineIsNull = 0;
    free(v4);
  }
  return self->baseline;
}

- (BOOL)hyphenated
{
  return 0;
}

- (CGPoint)anchor
{
  if (self->wordCount)
  {
    double v2 = [(CPCharSequence *)self->charSequence charAtIndex:self->wordArray->var0];
    p_var4 = &v2->var4;
    p_double y = &v2->var4.y;
  }
  else
  {
    p_var4 = &CGPointZero;
    p_double y = &CGPointZero.y;
  }
  double v5 = *p_y;
  double x = p_var4->x;
  result.double y = v5;
  result.double x = x;
  return result;
}

- (BOOL)overlapsHorizontally:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  CGFloat rect = a3.origin.y;
  double x = a3.origin.x;
  [(CPTextLine *)self bounds];
  double v10 = v6;
  CGFloat v11 = v7;
  CGFloat v12 = v8;
  CGFloat v13 = v9;
  BOOL v14 = v9 < 0.0 || v8 < 0.0;
  if (v14) {
    *(CGRect *)&double v6 = CGRectStandardize(*(CGRect *)&v6);
  }
  double v15 = v6 + v8;
  BOOL v16 = height < 0.0 || width < 0.0;
  double v17 = x;
  if (v16)
  {
    CGFloat v18 = rect;
    double v19 = width;
    double v20 = height;
    *(void *)&double v17 = (unint64_t)CGRectStandardize(*(CGRect *)&v17);
  }
  if (v15 < v17) {
    return 0;
  }
  if (v14)
  {
    v23.origin.double x = v10;
    v23.origin.double y = v11;
    v23.size.double width = v12;
    v23.size.double height = v13;
    *(void *)&double v10 = (unint64_t)CGRectStandardize(v23);
  }
  if (v16)
  {
    v24.origin.double x = x;
    v24.origin.double y = rect;
    v24.size.double width = width;
    v24.size.double height = height;
    CGRect v25 = CGRectStandardize(v24);
    double x = v25.origin.x;
    double width = v25.size.width;
  }
  return v10 <= x + width;
}

- (BOOL)overlapsWith:(id)a3
{
  [a3 bounds];

  return -[CPTextLine overlapsHorizontally:](self, "overlapsHorizontally:");
}

- (int64_t)baseLineDescendingApprox:(id)a3
{
  [(CPChunk *)self->super.super.super.page bounds];
  double v6 = v5;
  [(CPTextLine *)self baseline];
  double v8 = v7;
  [a3 baseline];
  if (vabdd_f64(v8, v9) >= v6 * 0.005)
  {
    if (v8 < v9) {
      return 1;
    }
    else {
      return -1;
    }
  }
  else
  {
    [(CPTextLine *)self normalizedBounds];
    double v14 = v10;
    if (v12 < 0.0 || v13 < 0.0) {
      *(void *)&double v14 = (unint64_t)CGRectStandardize(*(CGRect *)&v10);
    }
    [a3 normalizedBounds];
    if (v17 < 0.0 || v18 < 0.0) {
      *(void *)&double v15 = (unint64_t)CGRectStandardize(*(CGRect *)&v15);
    }
    if (v14 >= v15) {
      return 1;
    }
    else {
      return -1;
    }
  }
}

- (int64_t)baseLineDescending:(id)a3
{
  [(CPTextLine *)self baseline];
  double v5 = v4;
  [a3 baseline];
  int64_t v7 = -1;
  if (v5 < v6) {
    int64_t v7 = 1;
  }
  if (v5 == v6) {
    return 0;
  }
  else {
    return v7;
  }
}

- (int64_t)baseLineAscending:(id)a3
{
  [(CPTextLine *)self baseline];
  double v5 = v4;
  [a3 baseline];
  int64_t v7 = -1;
  if (v5 >= v6) {
    int64_t v7 = 1;
  }
  if (v5 == v6) {
    return 0;
  }
  else {
    return v7;
  }
}

- (CGRect)bounds
{
  p_bounds = &self->super.super.bounds;
  double x = self->super.super.bounds.origin.x;
  double y = self->super.super.bounds.origin.y;
  if (x == INFINITY || y == INFINITY)
  {
    uint64_t wordCount = self->wordCount;
    double width = self->super.super.bounds.size.width;
    double height = self->super.super.bounds.size.height;
    if (wordCount)
    {
      p_double height = &self->wordArray->var4.size.height;
      do
      {
        *(CGRect *)&double x = CGRectUnion(*(CGRect *)&x, *(CGRect *)(p_height - 3));
        p_bounds->origin.double x = x;
        p_bounds->origin.double y = y;
        p_bounds->size.double width = width;
        p_bounds->size.double height = height;
        p_height += 6;
        --wordCount;
      }
      while (wordCount);
    }
  }
  else
  {
    double width = self->super.super.bounds.size.width;
    double height = self->super.super.bounds.size.height;
  }
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (int)tabsBefore
{
  return self->tabsBefore;
}

- (void)setTabsBefore:(int)a3
{
  self->tabsBefore = a3;
}

- (BOOL)hasTabs
{
  return self->hasTabs;
}

- (void)setHasTabs:(BOOL)a3
{
  self->hasTabs = a3;
}

- (void)accept:(id)a3
{
}

- (void)setColumnBreaks:(id)a3
{
  columnBreaks = self->columnBreaks;
  if (columnBreaks != a3)
  {

    self->columnBreaks = (NSArray *)a3;
  }
}

- (id)columnBreaks
{
  return self->columnBreaks;
}

- (BOOL)hasBeenProcessed
{
  return self->hasBeenProcessed;
}

- (void)setHasBeenProcessed:(BOOL)a3
{
  self->hasBeenProcessed = a3;
}

- (BOOL)hasBeenSplit
{
  return self->hasBeenSplit;
}

- (void)setHasBeenSplit:(BOOL)a3
{
  self->hasBeenSplit = a3;
}

- (id)properties
{
  return @"Hello";
}

- (BOOL)mapToWordPairsWithIndex:(void *)a3 passing:(void *)a4
{
  unsigned int wordCount = self->wordCount;
  if (wordCount >= 2)
  {
    uint64_t v9 = 0;
    wordArradouble y = self->wordArray;
    unint64_t v11 = (unint64_t)&wordArray[wordCount];
    do
    {
      int v5 = ((uint64_t (*)(uint64_t, $F82BA7CF80F7A1221027BFFB2739E57F *, $F82BA7CF80F7A1221027BFFB2739E57F *, CPCharSequence *, void *))a3)(v9, wordArray, &wordArray[1], self->charSequence, a4);
      uint64_t v9 = (v9 + 1);
      if (v5) {
        BOOL v12 = (unint64_t)&wordArray[2] >= v11;
      }
      else {
        BOOL v12 = 1;
      }
      ++wordArray;
    }
    while (!v12);
  }
  else
  {
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (BOOL)mapToWordPairs:(void *)a3 passing:(void *)a4
{
  unsigned int wordCount = self->wordCount;
  if (wordCount >= 2)
  {
    wordArradouble y = self->wordArray;
    unint64_t v10 = (unint64_t)&wordArray[wordCount];
    do
    {
      int v5 = ((uint64_t (*)($F82BA7CF80F7A1221027BFFB2739E57F *, $F82BA7CF80F7A1221027BFFB2739E57F *, CPCharSequence *, void *))a3)(wordArray, &wordArray[1], self->charSequence, a4);
      if (v5) {
        BOOL v11 = (unint64_t)&wordArray[2] >= v10;
      }
      else {
        BOOL v11 = 1;
      }
      ++wordArray;
    }
    while (!v11);
  }
  else
  {
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (BOOL)mapToWordsWithIndex:(void *)a3 passing:(void *)a4
{
  if (self->wordCount)
  {
    uint64_t v7 = 0;
    wordArradouble y = self->wordArray;
    do
    {
      int v9 = ((uint64_t (*)(uint64_t, $F82BA7CF80F7A1221027BFFB2739E57F *, CPCharSequence *, void *))a3)(v7, wordArray, self->charSequence, a4);
      if (!v9) {
        break;
      }
      ++wordArray;
      uint64_t v7 = (v7 + 1);
    }
    while (v7 < self->wordCount);
  }
  else
  {
    LOBYTE(v9) = 1;
  }
  return v9;
}

- (BOOL)mapToWords:(void *)a3 passing:(void *)a4
{
  unsigned int wordCount = self->wordCount;
  if (wordCount)
  {
    wordArradouble y = self->wordArray;
    int v9 = &wordArray[wordCount];
    do
    {
      int v10 = ((uint64_t (*)($F82BA7CF80F7A1221027BFFB2739E57F *, CPCharSequence *, void *))a3)(wordArray++, self->charSequence, a4);
      if (v10) {
        BOOL v11 = wordArray >= v9;
      }
      else {
        BOOL v11 = 1;
      }
    }
    while (!v11);
  }
  else
  {
    LOBYTE(v10) = 1;
  }
  return v10;
}

- (BOOL)removeTextLines:(id)a3 whereTrue:(void *)a4 passing:(void *)a5
{
  if (self->wordCount < 2) {
    return 0;
  }
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  int v11 = 0;
  uint64_t v12 = 1;
  do
  {
    int v13 = v11;
    uint64_t v14 = v10;
    uint64_t v15 = v9;
    unint64_t v16 = v8 + 1;
    int v17 = ((uint64_t (*)($F82BA7CF80F7A1221027BFFB2739E57F *, $F82BA7CF80F7A1221027BFFB2739E57F *, void *))a4)(&self->wordArray[v12 - 1], &self->wordArray[v12], a5);
    int v11 = v17 | v13;
    if (v17) {
      uint64_t v10 = v16;
    }
    else {
      uint64_t v10 = v14;
    }
    if (v17) {
      uint64_t v9 = v16;
    }
    else {
      uint64_t v9 = v9;
    }
    if (v17 && (v13 & 1) != 0)
    {
      id v18 = [(CPTextLine *)self newTextLineFromWordAt:v14 lengthInWords:(v8 - v14 + 1)];
      if (v18)
      {
        double v19 = v18;
        [a3 addObject:v18];
        [v19 recomputeBaseline];
      }
      int v11 = 1;
      uint64_t v10 = v8 + 1;
      uint64_t v9 = v15;
    }
    unsigned int wordCount = self->wordCount;
    ++v12;
    ++v8;
  }
  while (v16 < wordCount - 1);
  if ((v11 & 1) == 0) {
    return 0;
  }
  id v21 = [(CPTextLine *)self newTextLineFromWordAt:v10 lengthInWords:wordCount - v10];
  if (v21)
  {
    float v22 = v21;
    [a3 addObject:v21];
    [v22 recomputeBaseline];
  }
  wordArradouble y = self->wordArray;
  if (!wordArray) {
    __assert_rtn("-[CPTextLine removeTextLines:whereTrue:passing:]", "CPTextLine.m", 365, "wordArray");
  }
  [(CPCharSequence *)self->charSequence removeFrom:wordArray[v9].var0];
  self->unsigned int wordCount = v9;
  self->super.super.bounds = CGRectNull;
  self->normalizedBounds = CGRectNull;
  [(CPTextLine *)self recomputeLevels];
  return 1;
}

- (id)newTextLineFromWordAt:(unsigned int)a3 lengthInWords:(unsigned int)a4
{
  if (!self->wordArray) {
    return 0;
  }
  uint64_t v4 = *(void *)&a4;
  uint64_t v7 = objc_alloc_init(CPTextLine);
  [(CPObject *)v7 setPage:self->super.super.super.page];
  id v8 = -[CPCharSequence newSubsequenceFrom:length:](self->charSequence, "newSubsequenceFrom:length:");
  [(CPTextLine *)v7 setCharSequence:v8];

  uint64_t v9 = [(CPTextLine *)v7 wordArrayOfSize:v4];
  if (v4)
  {
    unsigned int var0 = self->wordArray[a3].var0;
    uint64_t v11 = v4;
    do
    {
      uint64_t v12 = &self->wordArray[a3];
      CGSize size = v12->var4.size;
      long long v14 = *(_OWORD *)&v12->var0;
      v9->var4.origin = v12->var4.origin;
      v9->var4.CGSize size = size;
      *(_OWORD *)&v9->unsigned int var0 = v14;
      v9->var0 -= var0;
      ++v9;
      ++a3;
      --v11;
    }
    while (v11);
  }
  v7->leftSpacerIndedouble x = self->leftSpacerIndex;
  v7->rightSpacerIndedouble x = self->rightSpacerIndex;
  v7->uniformStyle = self->uniformStyle;
  v7->uniformStyleFlags = self->uniformStyleFlags;
  v7->double monospaceWidth = self->monospaceWidth;
  [(CPTextLine *)v7 recomputeLevels];
  return v7;
}

- (BOOL)changesFontAt:(id)a3
{
  unsigned int v5 = [(CPCharSequence *)self->charSequence length];
  int v6 = [*((id *)a3 + 16) length];
  if (v5) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  BOOL result = 0;
  if (!v7)
  {
    id v8 = [(CPCharSequence *)self->charSequence charAtIndex:v5 - 1];
    uint64_t v9 = [*((id *)a3 + 16) charAtIndex:0];
    var7 = v8->var7;
    uint64_t v11 = *(CPPDFStyle **)(v9 + 160);
    if (var7 != v11)
    {
      if (!var7 || v11 == 0) {
        return 1;
      }
      id var10 = var7->var10;
      if (var10 != v11->var10 && !objc_msgSend(var10, "isSameFontAs:")) {
        return 1;
      }
    }
  }
  return result;
}

- (BOOL)hasJustifiedAlignment
{
  char v2 = [(CPTextLine *)self align];
  return (v2 & 0xA) != 0 && (v2 & 5) != 0;
}

- (int)align
{
  unsigned int v3 = [(CPTextLine *)self firstWord];
  uint64_t v4 = [(CPTextLine *)self lastWord];
  if (!v3)
  {
    int v5 = 0;
    if (v4) {
      goto LABEL_3;
    }
LABEL_5:
    int v6 = 0;
    return v6 | v5;
  }
  int v5 = v3->var3 & 0x55;
  if (!v4) {
    goto LABEL_5;
  }
LABEL_3:
  int v6 = v4->var3 & 0xAA;
  return v6 | v5;
}

- (int64_t)zOrder
{
  self->super.super.super.zOrder = 0;
  p_zOrder = &self->super.super.super.zOrder;
  [(CPCharSequence *)self->charSequence map:maxInsertionOrder passing:&self->super.super.super.zOrder];
  return *p_zOrder;
}

- (void)anchorChunk:(id)a3 atWordIndex:(unsigned int)a4
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([a3 anchoringTextLine]) {
      return;
    }
    [a3 setAnchoringTextLine:self];
  }
  BOOL v7 = (CPInlineContainer *)malloc_type_malloc(0x18uLL, 0x10A0040C385777EuLL);
  v7->unsigned int var0 = a4;
  v7->var1 = a3;
  v7->var2 = 0;
  [a3 anchor];
  p_inlineList = &self->inlineList;
  var2 = *p_inlineList;
  if (*p_inlineList)
  {
    unsigned int var0 = var2->var0;
    if (var2->var0 <= a4)
    {
      double v13 = v8;
      double v14 = v9;
      uint64_t v15 = 0;
      while (1)
      {
        unint64_t v16 = var2;
        if (var0 == a4)
        {
          [var2->var1 anchor];
          BOOL v18 = v13 == v17;
          if (v14 <= v19) {
            BOOL v18 = 0;
          }
          if (v13 < v17 || v18) {
            break;
          }
        }
        var2 = v16->var2;
        if (var2)
        {
          unsigned int var0 = var2->var0;
          uint64_t v15 = v16;
          if (var2->var0 <= a4) {
            continue;
          }
        }
        v7->var2 = var2;
        uint64_t v15 = v16;
LABEL_17:
        p_inlineList = &v15->var2;
        goto LABEL_18;
      }
      v7->var2 = v16;
      if (v15) {
        goto LABEL_17;
      }
    }
    else
    {
      v7->var2 = var2;
    }
  }
  else
  {
    v7->var2 = 0;
  }
LABEL_18:
  *p_inlineList = v7;
}

- (CPInlineContainer)inlineList
{
  return self->inlineList;
}

- (unsigned)inlineCount
{
  inlineList = self->inlineList;
  if (!inlineList) {
    return 0;
  }
  unsigned int result = 0;
  do
  {
    inlineList = inlineList->var2;
    ++result;
  }
  while (inlineList);
  return result;
}

- ($F82BA7CF80F7A1221027BFFB2739E57F)lastWord
{
  unsigned int wordCount = self->wordCount;
  if (wordCount) {
    return &self->wordArray[wordCount - 1];
  }
  else {
    return 0;
  }
}

- ($F82BA7CF80F7A1221027BFFB2739E57F)firstWord
{
  if (self->wordCount) {
    return self->wordArray;
  }
  else {
    return 0;
  }
}

- ($F82BA7CF80F7A1221027BFFB2739E57F)wordAtIndex:(unsigned int)a3
{
  if (self->wordCount <= a3) {
    __assert_rtn("-[CPTextLine wordAtIndex:]", "CPTextLine.m", 166, "index < wordCount");
  }
  return &self->wordArray[a3];
}

- (CGRect)boundsOfWordAtIndex:(unsigned int)a3
{
  if (self->wordCount <= a3) {
    __assert_rtn("-[CPTextLine boundsOfWordAtIndex:]", "CPTextLine.m", 160, "index < wordCount");
  }
  unsigned int v3 = &self->wordArray[a3];
  double x = v3->var4.origin.x;
  double y = v3->var4.origin.y;
  double width = v3->var4.size.width;
  double height = v3->var4.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (unsigned)wordCount
{
  return self->wordCount;
}

- ($F82BA7CF80F7A1221027BFFB2739E57F)wordArrayOfSize:(unsigned int)a3
{
  CGRect result = self->wordArray;
  if (!result)
  {
    if (!a3)
    {
      CGRect result = 0;
      goto LABEL_8;
    }
    CGRect result = ($F82BA7CF80F7A1221027BFFB2739E57F *)malloc_type_malloc(48 * a3, 0x1000040EED21634uLL);
    goto LABEL_6;
  }
  if (self->wordCount < a3)
  {
    CGRect result = ($F82BA7CF80F7A1221027BFFB2739E57F *)malloc_type_realloc(result, 48 * a3, 0x1000040EED21634uLL);
LABEL_6:
    self->wordArradouble y = result;
  }
LABEL_8:
  self->unsigned int wordCount = a3;
  return result;
}

- ($F82BA7CF80F7A1221027BFFB2739E57F)wordArray
{
  return self->wordArray;
}

- (id)charSequence
{
  return self->charSequence;
}

- (void)setCharSequence:(id)a3
{
  charSequence = self->charSequence;
  if (charSequence != a3)
  {

    self->charSequence = (CPCharSequence *)a3;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CPTextLine;
  int v5 = -[CPChunk copyWithZone:](&v10, sel_copyWithZone_);
  int v6 = v5;
  if (v5)
  {
    v5[1] = 0;
    v5[28] = [objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:self->columnBreaks];
    v6[16] = [(CPCharSequence *)self->charSequence copyWithZone:a3];
    uint64_t wordCount = self->wordCount;
    if (wordCount)
    {
      double v8 = malloc_type_malloc(48 * wordCount, 0x1000040EED21634uLL);
      v6[17] = v8;
      memcpy(v8, self->wordArray, 48 * self->wordCount);
    }
  }
  return v6;
}

- (void)dealloc
{
  [(CPTextLine *)self dispose];

  v3.receiver = self;
  v3.super_class = (Class)CPTextLine;
  [(CPObject *)&v3 dealloc];
}

- (void)finalize
{
  [(CPTextLine *)self dispose];
  v3.receiver = self;
  v3.super_class = (Class)CPTextLine;
  [(CPTextLine *)&v3 finalize];
}

- (void)dispose
{
  if (!self->disposed)
  {
    [(CPCharSequence *)self->charSequence dispose];
    free(self->wordArray);
    inlineList = self->inlineList;
    if (inlineList)
    {
      do
      {
        var2 = inlineList->var2;
        free(inlineList);
        self->inlineList = var2;
        inlineList = var2;
      }
      while (var2);
    }
    free(self->spacesBefore);
    self->disposed = 1;
  }
}

- (CPTextLine)init
{
  v3.receiver = self;
  v3.super_class = (Class)CPTextLine;
  CGRect result = [(CPChunk *)&v3 init];
  if (result)
  {
    result->hasTabs = 0;
    result->baseLineIsNull = 1;
    result->normalizedBounds = CGRectNull;
    result->hasBeenProcessed = 0;
    result->hasBeenSplit = 0;
    result->levels = 0;
    result->maximumLetterGap = 0.0;
    result->maximumWordGap = 0.0;
    result->tabsBefore = 0;
    result->irregular = 0;
    result->wordArradouble y = 0;
    result->uint64_t wordCount = 0;
  }
  return result;
}

@end