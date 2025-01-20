@interface CKMentionRippler
- (BOOL)finishedForGlyphIndex:(unint64_t)a3 numberOfGlyphs:(unint64_t)a4 timeIndex:(unint64_t)a5;
- (CGSize)currentOffsetForGlyphIndex:(unint64_t)a3 numberOfGlyphs:(unint64_t)a4 timeIndex:(unint64_t)a5;
- (CKMentionRippler)init;
- (double)currentScaleForGlyphIndex:(unint64_t)a3 numberOfGlyphs:(unint64_t)a4 timeIndex:(unint64_t)a5;
- (id)currentColorForGlyphIndex:(unint64_t)a3 numberOfGlyphs:(unint64_t)a4 timeIndex:(unint64_t)a5;
- (id)currentShadowColorForGlyphIndex:(unint64_t)a3 numberOfGlyphs:(unint64_t)a4 timeIndex:(unint64_t)a5;
- (unint64_t)currentIndexForGlyphIndex:(unint64_t)a3 numberOfGlyphs:(unint64_t)a4 timeIndex:(unint64_t)a5 isFinished:(BOOL *)a6;
- (unint64_t)currentTimeIndex;
- (unint64_t)finishedTimeIndex;
- (void)generateValues;
- (void)start;
@end

@implementation CKMentionRippler

- (void)generateValues
{
  v54[1] = *(double *)MEMORY[0x1E4F143B8];
  uint64_t v47 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v48 = [MEMORY[0x1E4F1CA48] array];
  v50 = [MEMORY[0x1E4F1CA48] array];
  v51 = [MEMORY[0x1E4F1CA48] array];
  unint64_t v3 = self->_animateFrames + self->_preFrames + self->_postFrames;
  v4 = (double *)((char *)&v45 - ((8 * v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  bzero(v4, 8 * v3);
  v5 = v4;
  bzero(v4, 8 * v3);
  v6 = v4;
  bzero(v4, 8 * v3);
  v7 = v4;
  bzero(v4, 8 * v3);
  v8 = +[CKUIBehavior sharedBehaviors];
  v9 = [v8 theme];
  v10 = [v9 entryFieldConfirmedMentionColor];

  double v53 = 0.0;
  v54[0] = 0.0;
  double v52 = 0.0;
  id v46 = v10;
  [v10 getRed:v54 green:&v53 blue:&v52 alpha:0];
  if (v3)
  {
    bzero(v4, 8 * v3);
    bzero(v4, 8 * v3);
    bzero(v4, 8 * v3);
    memset_pattern16(v4, &unk_18F81C860, 8 * v3);
  }
  unint64_t preFrames = self->_preFrames;
  unint64_t animateFrames = self->_animateFrames;
  v49 = self;
  unint64_t v45 = animateFrames + preFrames;
  if (preFrames < animateFrames + preFrames)
  {
    bzero(&v4[preFrames], 8 * animateFrames);
    unint64_t v13 = 0;
    v14 = &v4[preFrames];
    do
    {
      double v15 = (double)v13 / (double)animateFrames;
      double v16 = exp(v15 * -4.0);
      __double2 v17 = __sincos_stret(v15 * 13.6);
      double v18 = 1.0 - v16 * (v17.__cosval + v17.__sinval * 0.3);
      v14[v13] = v18;
      v14[v13] = v18;
      v14[v13++] = v16 * 0.3 * v17.__sinval + 1.0;
    }
    while (animateFrames != v13);
  }
  unint64_t postFrames = v49->_postFrames;
  unint64_t v20 = v45;
  if (v20 < postFrames + v20)
  {
    size_t v21 = 8 * postFrames;
    bzero(&v4[v45], 8 * postFrames);
    memset_pattern16(&v4[v20], &unk_18F81C860, v21);
    memset_pattern16(&v4[v20], &unk_18F81C860, v21);
    memset_pattern16(&v4[v20], &unk_18F81C860, v21);
  }
  v22 = (NSArray *)v47;
  for (i = (NSArray *)v48; v3; --v3)
  {
    double v24 = *v4++;
    double v25 = v24 * v54[0];
    double v26 = v24 * v53;
    double v27 = v24 * v52;
    v28 = objc_msgSend(MEMORY[0x1E4F428B8], "colorWithRed:green:blue:alpha:", v24 * v54[0], v24 * v53, v24 * v52, 1.0, v45);
    [(NSArray *)v22 addObject:v28];

    double v29 = *v7++;
    v30 = [MEMORY[0x1E4F428B8] colorWithRed:v25 green:v26 blue:v27 alpha:v29];
    [(NSArray *)i addObject:v30];

    double v31 = *v5++;
    v32 = [NSNumber numberWithDouble:v31];
    [(NSArray *)v50 addObject:v32];

    double v33 = *v6++;
    v34 = [NSNumber numberWithDouble:v33];
    [(NSArray *)v51 addObject:v34];
  }
  v35 = v49;
  colors = v49->_colors;
  v49->_colors = v22;
  v37 = v22;

  shadowColors = v35->_shadowColors;
  v35->_shadowColors = i;
  v39 = i;

  v40 = v35;
  scales = v35->_scales;
  v42 = v50;
  v40->_scales = v50;
  v43 = v42;

  offsets = v40->_offsets;
  v40->_offsets = v51;
}

- (void)start
{
  self->_startTime = CFAbsoluteTimeGetCurrent();
  self->_reduceMotion = UIAccessibilityIsReduceMotionEnabled();
}

- (CKMentionRippler)init
{
  v5.receiver = self;
  v5.super_class = (Class)CKMentionRippler;
  v2 = [(CKMentionRippler *)&v5 init];
  unint64_t v3 = v2;
  if (v2)
  {
    *(_OWORD *)&v2->_unint64_t preFrames = xmmword_18F81C840;
    *(_OWORD *)&v2->_unint64_t postFrames = xmmword_18F81C850;
    [(CKMentionRippler *)v2 generateValues];
    [(CKMentionRippler *)v3 start];
  }
  return v3;
}

- (unint64_t)currentTimeIndex
{
  return (unint64_t)((CFAbsoluteTimeGetCurrent() - self->_startTime) * 60.0);
}

- (unint64_t)finishedTimeIndex
{
  return self->_animateFrames + self->_preFrames + self->_postFrames;
}

- (unint64_t)currentIndexForGlyphIndex:(unint64_t)a3 numberOfGlyphs:(unint64_t)a4 timeIndex:(unint64_t)a5 isFinished:(BOOL *)a6
{
  unint64_t delayFrames = self->_delayFrames;
  unint64_t v7 = self->_animateFrames + self->_preFrames + self->_postFrames;
  unint64_t v8 = a5 % (2 * (v7 + delayFrames * a4));
  unint64_t v9 = delayFrames + delayFrames * a3;
  unint64_t v10 = v7 - 1;
  if (v8 < v9) {
    unint64_t v10 = 0;
  }
  unint64_t v11 = v9 + v7;
  BOOL v12 = v8 < v9 || v8 >= v11;
  BOOL v13 = v12 && v8 >= v9;
  if (v12) {
    unint64_t result = v10;
  }
  else {
    unint64_t result = v8 - v9;
  }
  if (a6) {
    *a6 = v13;
  }
  return result;
}

- (id)currentColorForGlyphIndex:(unint64_t)a3 numberOfGlyphs:(unint64_t)a4 timeIndex:(unint64_t)a5
{
  colors = self->_colors;
  unint64_t v6 = [(CKMentionRippler *)self currentIndexForGlyphIndex:a3 numberOfGlyphs:a4 timeIndex:a5 isFinished:0];

  return [(NSArray *)colors objectAtIndex:v6];
}

- (id)currentShadowColorForGlyphIndex:(unint64_t)a3 numberOfGlyphs:(unint64_t)a4 timeIndex:(unint64_t)a5
{
  shadowColors = self->_shadowColors;
  unint64_t v6 = [(CKMentionRippler *)self currentIndexForGlyphIndex:a3 numberOfGlyphs:a4 timeIndex:a5 isFinished:0];

  return [(NSArray *)shadowColors objectAtIndex:v6];
}

- (double)currentScaleForGlyphIndex:(unint64_t)a3 numberOfGlyphs:(unint64_t)a4 timeIndex:(unint64_t)a5
{
  if (self->_reduceMotion) {
    return 1.0;
  }
  unint64_t v6 = [(NSArray *)self->_scales objectAtIndex:[(CKMentionRippler *)self currentIndexForGlyphIndex:a3 numberOfGlyphs:a4 timeIndex:a5 isFinished:0]];
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
    unint64_t v6 = [(NSArray *)self->_offsets objectAtIndex:[(CKMentionRippler *)self currentIndexForGlyphIndex:a3 numberOfGlyphs:a4 timeIndex:a5 isFinished:0]];
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
  [(CKMentionRippler *)self currentIndexForGlyphIndex:a3 numberOfGlyphs:a4 timeIndex:a5 isFinished:&v6];
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offsets, 0);
  objc_storeStrong((id *)&self->_scales, 0);
  objc_storeStrong((id *)&self->_shadowColors, 0);

  objc_storeStrong((id *)&self->_colors, 0);
}

@end