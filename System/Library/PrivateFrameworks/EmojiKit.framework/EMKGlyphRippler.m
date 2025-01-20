@interface EMKGlyphRippler
- (BOOL)finishedForGlyphIndex:(unint64_t)a3 numberOfGlyphs:(unint64_t)a4 timeIndex:(unint64_t)a5;
- (CGSize)currentOffsetForGlyphIndex:(unint64_t)a3 numberOfGlyphs:(unint64_t)a4 timeIndex:(unint64_t)a5;
- (EMKGlyphRippler)init;
- (double)currentScaleForGlyphIndex:(unint64_t)a3 numberOfGlyphs:(unint64_t)a4 timeIndex:(unint64_t)a5;
- (id)currentColorForGlyphIndex:(unint64_t)a3 numberOfGlyphs:(unint64_t)a4 timeIndex:(unint64_t)a5;
- (id)currentShadowColorForGlyphIndex:(unint64_t)a3 numberOfGlyphs:(unint64_t)a4 timeIndex:(unint64_t)a5;
- (unint64_t)currentIndexForGlyphIndex:(unint64_t)a3 numberOfGlyphs:(unint64_t)a4 timeIndex:(unint64_t)a5 isFinished:(BOOL *)a6;
- (unint64_t)currentTimeIndex;
- (void)generateValues;
- (void)setDelayFrames:(unint64_t)a3;
- (void)setPostFrames:(unint64_t)a3;
- (void)setPreFrames:(unint64_t)a3;
- (void)start;
- (void)startWithDarkMode:(BOOL)a3;
@end

@implementation EMKGlyphRippler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offsets, 0);
  objc_storeStrong((id *)&self->_scales, 0);
  objc_storeStrong((id *)&self->_darkModeShadowColors, 0);
  objc_storeStrong((id *)&self->_shadowColors, 0);
  objc_storeStrong((id *)&self->_darkModeColors, 0);
  objc_storeStrong((id *)&self->_colors, 0);
}

- (EMKGlyphRippler)init
{
  v5.receiver = self;
  v5.super_class = (Class)EMKGlyphRippler;
  v2 = [(EMKGlyphRippler *)&v5 init];
  v3 = v2;
  if (v2)
  {
    *(_OWORD *)&v2->_preFrames = xmmword_1E4A6DFE0;
    *(_OWORD *)&v2->_postFrames = xmmword_1E4A6DFF0;
    [(EMKGlyphRippler *)v2 generateValues];
    [(EMKGlyphRippler *)v3 start];
  }
  return v3;
}

- (void)start
{
}

- (void)startWithDarkMode:(BOOL)a3
{
  self->_startTime = CFAbsoluteTimeGetCurrent();
  self->_reduceMotion = UIAccessibilityIsReduceMotionEnabled();
  self->_darkMode = a3;
}

- (void)generateValues
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  uint64_t v56 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v57 = [MEMORY[0x1E4F1CA48] array];
  v60 = [MEMORY[0x1E4F1CA48] array];
  v61 = [MEMORY[0x1E4F1CA48] array];
  v62 = [MEMORY[0x1E4F1CA48] array];
  v63 = [MEMORY[0x1E4F1CA48] array];
  unint64_t preFrames = self->_preFrames;
  unint64_t v4 = self->_animateFrames + preFrames + self->_postFrames;
  unint64_t v5 = (8 * v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  v6 = (double *)((char *)&v55 - v5);
  v7 = (double *)((char *)&v55 - v5);
  v8 = (double *)((char *)&v55 - v5);
  v9 = (double *)((char *)&v55 - v5);
  if (preFrames)
  {
    bzero((char *)&v55 - v5, 8 * preFrames);
    bzero(v9, 8 * preFrames);
    bzero(v8, 8 * preFrames);
    memset_pattern16(v7, &unk_1E4A6E000, 8 * preFrames);
  }
  unint64_t animateFrames = self->_animateFrames;
  v58 = self;
  *(void *)&double v59 = animateFrames + preFrames;
  if (preFrames < animateFrames + preFrames)
  {
    bzero(&v8[preFrames], 8 * animateFrames);
    unint64_t v11 = 0;
    v12 = &v7[preFrames];
    v13 = &v6[preFrames];
    v14 = &v9[preFrames];
    do
    {
      double v15 = (double)v11 / (double)animateFrames;
      double v16 = exp(v15 * -4.0);
      __double2 v17 = __sincos_stret(v15 * 13.6);
      double v18 = 1.0 - v16 * (v17.__cosval + v17.__sinval * 0.3);
      v14[v11] = v18;
      v13[v11] = v18;
      v12[v11++] = v16 * 0.3 * v17.__sinval + 1.0;
    }
    while (animateFrames != v11);
  }
  double v19 = v59;
  unint64_t postFrames = v58->_postFrames;
  if (*(void *)&v19 < postFrames + *(void *)&v19)
  {
    size_t v21 = 8 * postFrames;
    bzero(&v8[*(void *)&v59], 8 * postFrames);
    memset_pattern16(&v6[*(void *)&v19], &unk_1E4A6E000, v21);
    memset_pattern16(&v9[*(void *)&v19], &unk_1E4A6E000, v21);
    memset_pattern16(&v7[*(void *)&v19], &unk_1E4A6E000, v21);
  }
  v22 = (NSArray *)v56;
  v23 = (NSArray *)v57;
  if (v4)
  {
    double v59 = 127.0;
    do
    {
      double v24 = *v6++;
      double v25 = v24 * 255.0 / 255.0;
      double v26 = v24 * v59 / 255.0;
      double v27 = v24 * 0.0 / 255.0;
      double v28 = 1.0 - v24 + v25;
      double v29 = 1.0 - v24 + v26;
      double v30 = 1.0 - v24 + v27;
      v31 = [MEMORY[0x1E4F428B8] colorWithRed:v25 green:v26 blue:v27 alpha:1.0];
      [(NSArray *)v22 addObject:v31];

      v32 = [MEMORY[0x1E4F428B8] colorWithRed:v28 green:v29 blue:v30 alpha:1.0];
      [(NSArray *)v23 addObject:v32];

      double v33 = *v9++;
      v34 = [MEMORY[0x1E4F428B8] colorWithRed:v25 green:v26 blue:v27 alpha:v33];
      [(NSArray *)v60 addObject:v34];

      v35 = [MEMORY[0x1E4F428B8] colorWithRed:v28 green:v29 blue:v30 alpha:v33];
      [(NSArray *)v61 addObject:v35];

      double v36 = *v7++;
      v37 = [NSNumber numberWithDouble:v36];
      [(NSArray *)v62 addObject:v37];

      double v38 = *v8++;
      v39 = [NSNumber numberWithDouble:v38];
      [(NSArray *)v63 addObject:v39];

      --v4;
    }
    while (v4);
  }
  v40 = v58;
  colors = v58->_colors;
  v58->_colors = v22;
  double v59 = COERCE_DOUBLE(v22);

  darkModeColors = v40->_darkModeColors;
  v40->_darkModeColors = v23;
  v43 = v23;

  shadowColors = v40->_shadowColors;
  v45 = v60;
  v40->_shadowColors = v60;
  v46 = v45;

  darkModeShadowColors = v40->_darkModeShadowColors;
  v48 = v61;
  v40->_darkModeShadowColors = v61;
  v49 = v48;

  scales = v40->_scales;
  v51 = v62;
  v40->_scales = v62;
  v52 = v51;

  offsets = v40->_offsets;
  v40->_offsets = v63;

  double v54 = v59;
}

- (unint64_t)currentTimeIndex
{
  return (unint64_t)((CFAbsoluteTimeGetCurrent() - self->_startTime) * 60.0);
}

- (unint64_t)currentIndexForGlyphIndex:(unint64_t)a3 numberOfGlyphs:(unint64_t)a4 timeIndex:(unint64_t)a5 isFinished:(BOOL *)a6
{
  unint64_t v6 = self->_animateFrames + self->_preFrames + self->_postFrames;
  unint64_t v7 = self->_delayFrames + self->_delayFrames * a3;
  unint64_t v8 = v6 - 1;
  if (a5 < v7) {
    unint64_t v8 = 0;
  }
  unint64_t v9 = v7 + v6;
  BOOL v10 = a5 >= v7 && v9 > a5;
  BOOL v11 = !v10 && a5 >= v7;
  if (v10) {
    unint64_t result = a5 - v7;
  }
  else {
    unint64_t result = v8;
  }
  if (a6) {
    *a6 = v11;
  }
  return result;
}

- (id)currentColorForGlyphIndex:(unint64_t)a3 numberOfGlyphs:(unint64_t)a4 timeIndex:(unint64_t)a5
{
  uint64_t v9 = 16;
  if (!self->_darkMode) {
    uint64_t v9 = 8;
  }
  id v10 = *(id *)((char *)&self->super.isa + v9);
  BOOL v11 = objc_msgSend(v10, "objectAtIndex:", -[EMKGlyphRippler currentIndexForGlyphIndex:numberOfGlyphs:timeIndex:isFinished:](self, "currentIndexForGlyphIndex:numberOfGlyphs:timeIndex:isFinished:", a3, a4, a5, 0));

  return v11;
}

- (id)currentShadowColorForGlyphIndex:(unint64_t)a3 numberOfGlyphs:(unint64_t)a4 timeIndex:(unint64_t)a5
{
  uint64_t v9 = 32;
  if (!self->_darkMode) {
    uint64_t v9 = 24;
  }
  id v10 = *(id *)((char *)&self->super.isa + v9);
  BOOL v11 = objc_msgSend(v10, "objectAtIndex:", -[EMKGlyphRippler currentIndexForGlyphIndex:numberOfGlyphs:timeIndex:isFinished:](self, "currentIndexForGlyphIndex:numberOfGlyphs:timeIndex:isFinished:", a3, a4, a5, 0));

  return v11;
}

- (double)currentScaleForGlyphIndex:(unint64_t)a3 numberOfGlyphs:(unint64_t)a4 timeIndex:(unint64_t)a5
{
  if (self->_reduceMotion) {
    return 1.0;
  }
  unint64_t v6 = [(NSArray *)self->_scales objectAtIndex:[(EMKGlyphRippler *)self currentIndexForGlyphIndex:a3 numberOfGlyphs:a4 timeIndex:a5 isFinished:0]];
  [v6 doubleValue];
  double v8 = v7;

  return v8;
}

- (CGSize)currentOffsetForGlyphIndex:(unint64_t)a3 numberOfGlyphs:(unint64_t)a4 timeIndex:(unint64_t)a5
{
  if (self->_reduceMotion)
  {
    double v5 = 0.0;
  }
  else
  {
    unint64_t v6 = [(NSArray *)self->_offsets objectAtIndex:[(EMKGlyphRippler *)self currentIndexForGlyphIndex:a3 numberOfGlyphs:a4 timeIndex:a5 isFinished:0]];
    [v6 doubleValue];
    double v5 = v7;
  }
  double v8 = 0.0;
  double v9 = v5;
  result.height = v9;
  result.width = v8;
  return result;
}

- (BOOL)finishedForGlyphIndex:(unint64_t)a3 numberOfGlyphs:(unint64_t)a4 timeIndex:(unint64_t)a5
{
  BOOL v6 = 0;
  [(EMKGlyphRippler *)self currentIndexForGlyphIndex:a3 numberOfGlyphs:a4 timeIndex:a5 isFinished:&v6];
  return v6;
}

- (void)setPreFrames:(unint64_t)a3
{
  if (a3 <= 1) {
    unint64_t v3 = 1;
  }
  else {
    unint64_t v3 = a3;
  }
  self->_unint64_t preFrames = v3;
  [(EMKGlyphRippler *)self generateValues];
}

- (void)setPostFrames:(unint64_t)a3
{
  if (a3 <= 1) {
    unint64_t v3 = 1;
  }
  else {
    unint64_t v3 = a3;
  }
  self->_unint64_t postFrames = v3;
  [(EMKGlyphRippler *)self generateValues];
}

- (void)setDelayFrames:(unint64_t)a3
{
  if (a3 <= 1) {
    unint64_t v3 = 1;
  }
  else {
    unint64_t v3 = a3;
  }
  self->_delayFrames = v3;
  [(EMKGlyphRippler *)self generateValues];
}

@end