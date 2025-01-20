@interface PKFreeTransformGestureRecognizer
- (BOOL)allowSingleTouchDrag;
- (BOOL)axisAligned;
- (BOOL)canBegin;
- (BOOL)isPanning;
- (BOOL)isScaling;
- (BOOL)scaleIsGrowing;
- (BOOL)scaleIsShrinking;
- (BOOL)touchesMovedPastScaleThreshold:(double)a3;
- (BOOL)touchesMovedPastThreshold:(double)a3;
- (CGAffineTransform)accumulatedTransform;
- (CGAffineTransform)clampTransform:(SEL)a3 minScale:(CGAffineTransform *)a4 maxScale:(double)a5;
- (CGAffineTransform)freeTransform;
- (CGAffineTransform)unscaledFreeTransform;
- (CGPoint)locationInView:(id)a3;
- (NSMapTable)actualTouchStartLocations;
- (NSMapTable)touchStartLocations;
- (NSMutableOrderedSet)touches;
- (PKFreeTransformGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (double)cancelThreshold;
- (double)deltaScale;
- (double)maxScale;
- (double)minScale;
- (double)previousScale;
- (double)scale;
- (double)scaleDamping;
- (double)scaleThreshold;
- (double)startThreshold;
- (unint64_t)allowedPanEdges;
- (void)clearTouches;
- (void)reset;
- (void)resetAndAccumulateTransform;
- (void)resetStartingTouches;
- (void)setAccumulatedTransform:(CGAffineTransform *)a3;
- (void)setActualTouchStartLocations:(id)a3;
- (void)setAllowSingleTouchDrag:(BOOL)a3;
- (void)setAllowedPanEdges:(unint64_t)a3;
- (void)setAxisAligned:(BOOL)a3;
- (void)setCanBegin:(BOOL)a3;
- (void)setCancelThreshold:(double)a3;
- (void)setDeltaScale:(double)a3;
- (void)setIsPanning:(BOOL)a3;
- (void)setIsScaling:(BOOL)a3;
- (void)setMaxScale:(double)a3;
- (void)setMinScale:(double)a3;
- (void)setPreviousScale:(double)a3;
- (void)setScaleDamping:(double)a3;
- (void)setScaleThreshold:(double)a3;
- (void)setStartThreshold:(double)a3;
- (void)setTouchStartLocations:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesBegan:(id)a3 withEvent:(id)a4 rejectExcessTouches:(BOOL)a5;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation PKFreeTransformGestureRecognizer

- (PKFreeTransformGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v9.receiver = self;
  v9.super_class = (Class)PKFreeTransformGestureRecognizer;
  v4 = [(PKFreeTransformGestureRecognizer *)&v9 initWithTarget:a3 action:a4];
  v5 = (PKFreeTransformGestureRecognizer *)v4;
  if (v4)
  {
    *((void *)v4 + 35) = 0x4024000000000000;
    *((void *)v4 + 37) = 0x4024000000000000;
    uint64_t v6 = MEMORY[0x1E4F1DAB8];
    long long v7 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)(v4 + 376) = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)(v4 + 392) = v7;
    *(_OWORD *)(v4 + 408) = *(_OWORD *)(v6 + 32);
    *((void *)v4 + 41) = 0x3FE0000000000000;
    *((void *)v4 + 38) = 15;
    [v4 setRequiresExclusiveTouchType:0];
    [(PKFreeTransformGestureRecognizer *)v5 clearTouches];
  }
  return v5;
}

- (BOOL)scaleIsGrowing
{
  [(PKFreeTransformGestureRecognizer *)self deltaScale];
  return v2 > 0.01;
}

- (BOOL)scaleIsShrinking
{
  [(PKFreeTransformGestureRecognizer *)self deltaScale];
  return v2 < -0.1;
}

- (double)scale
{
  [(PKFreeTransformGestureRecognizer *)self freeTransform];
  return sqrt(v4 * v4 + v3 * v3);
}

- (CGAffineTransform)clampTransform:(SEL)a3 minScale:(CGAffineTransform *)a4 maxScale:(double)a5
{
  double v10 = sqrt(a4->b * a4->b + a4->a * a4->a);
  if (v10 < a5)
  {
    [(CGAffineTransform *)self scaleDamping];
    CGFloat v12 = ((v10 - a5) * v11 * 0.5 + a5) / v10;
    CGAffineTransformMakeScale(&v21, v12, v12);
    long long v13 = *(_OWORD *)&a4->c;
    *(_OWORD *)&t2.a = *(_OWORD *)&a4->a;
    *(_OWORD *)&t2.c = v13;
    *(_OWORD *)&t2.tx = *(_OWORD *)&a4->tx;
    v14 = &v21;
LABEL_5:
    self = CGAffineTransformConcat(&v22, v14, &t2);
    long long v17 = *(_OWORD *)&v22.c;
    *(_OWORD *)&a4->a = *(_OWORD *)&v22.a;
    *(_OWORD *)&a4->c = v17;
    *(_OWORD *)&a4->tx = *(_OWORD *)&v22.tx;
    goto LABEL_6;
  }
  if (v10 > a6)
  {
    [(CGAffineTransform *)self scaleDamping];
    CGAffineTransformMakeScale(&v19, (a6 + (v10 - a6) * v15) / v10, (a6 + (v10 - a6) * v15) / v10);
    long long v16 = *(_OWORD *)&a4->c;
    *(_OWORD *)&t2.a = *(_OWORD *)&a4->a;
    *(_OWORD *)&t2.c = v16;
    *(_OWORD *)&t2.tx = *(_OWORD *)&a4->tx;
    v14 = &v19;
    goto LABEL_5;
  }
LABEL_6:
  long long v18 = *(_OWORD *)&a4->c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&a4->a;
  *(_OWORD *)&retstr->c = v18;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&a4->tx;
  return self;
}

- (CGAffineTransform)freeTransform
{
  v5 = [(PKFreeTransformGestureRecognizer *)self touches];
  if ([v5 count] == 2)
  {
    BOOL v6 = [(PKFreeTransformGestureRecognizer *)self isScaling];

    if (!v6)
    {
      return [(PKFreeTransformGestureRecognizer *)self unscaledFreeTransform];
    }
  }
  else
  {
  }
  uint64_t v8 = MEMORY[0x1E4F1DAB8];
  long long v9 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&retstr->c = v9;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v8 + 32);
  if ([(PKFreeTransformGestureRecognizer *)self allowSingleTouchDrag]
    && ([(PKFreeTransformGestureRecognizer *)self touches],
        double v10 = objc_claimAutoreleasedReturnValue(),
        uint64_t v11 = [v10 count],
        v10,
        v11 == 1))
  {
    CGFloat v12 = [(PKFreeTransformGestureRecognizer *)self touchStartLocations];
    long long v13 = [(PKFreeTransformGestureRecognizer *)self touches];
    v14 = [v13 firstObject];
    double v15 = [v12 objectForKey:v14];
    [v15 CGPointValue];
    double v17 = v16;
    double v19 = v18;

    v20 = [(PKFreeTransformGestureRecognizer *)self touches];
    CGAffineTransform v21 = [v20 objectAtIndexedSubscript:0];
    CGAffineTransform v22 = [(PKFreeTransformGestureRecognizer *)self view];
    v23 = [v22 superview];
    [v21 locationInView:v23];
    double v25 = v24;
    double v27 = v26;

    CGAffineTransformMakeTranslation(retstr, v25 - v17, v27 - v19);
    if ([(PKFreeTransformGestureRecognizer *)self axisAligned])
    {
      [(PKFreeTransformGestureRecognizer *)self accumulatedTransform];
      double v28 = sqrt(v92 * v92 + v91 * v91);
      [(PKFreeTransformGestureRecognizer *)self minScale];
      double v30 = v29 / v28;
      [(PKFreeTransformGestureRecognizer *)self maxScale];
      long long v31 = *(_OWORD *)&retstr->c;
      *(_OWORD *)&t2.a = *(_OWORD *)&retstr->a;
      *(_OWORD *)&t2.c = v31;
      *(_OWORD *)&t2.tx = *(_OWORD *)&retstr->tx;
      [(PKFreeTransformGestureRecognizer *)self clampTransform:&t2 minScale:v30 maxScale:v32 / v28];
      long long v33 = *(_OWORD *)&v90.c;
      *(_OWORD *)&retstr->a = *(_OWORD *)&v90.a;
      *(_OWORD *)&retstr->c = v33;
      *(_OWORD *)&retstr->tx = *(_OWORD *)&v90.tx;
    }
  }
  else
  {
    v34 = [(PKFreeTransformGestureRecognizer *)self touches];
    uint64_t v35 = [v34 count];

    if (v35 == 2)
    {
      v36 = [(PKFreeTransformGestureRecognizer *)self touchStartLocations];
      v37 = [(PKFreeTransformGestureRecognizer *)self touches];
      v38 = [v37 objectAtIndexedSubscript:0];
      v39 = [v36 objectForKey:v38];
      [v39 CGPointValue];
      double v41 = v40;
      double v43 = v42;

      v44 = [(PKFreeTransformGestureRecognizer *)self touchStartLocations];
      v45 = [(PKFreeTransformGestureRecognizer *)self touches];
      v46 = [v45 objectAtIndexedSubscript:1];
      v47 = [v44 objectForKey:v46];
      [v47 CGPointValue];
      double v49 = v48;
      double v51 = v50;

      v52 = [(PKFreeTransformGestureRecognizer *)self touches];
      v53 = [v52 objectAtIndexedSubscript:0];
      v54 = [(PKFreeTransformGestureRecognizer *)self view];
      v55 = [v54 superview];
      [v53 locationInView:v55];
      CGFloat v57 = v56;
      CGFloat v59 = v58;

      v60 = [(PKFreeTransformGestureRecognizer *)self touches];
      v61 = [v60 objectAtIndexedSubscript:1];
      v62 = [(PKFreeTransformGestureRecognizer *)self view];
      v63 = [v62 superview];
      [v61 locationInView:v63];
      double v65 = v64;
      double v67 = v66;

      if ([(PKFreeTransformGestureRecognizer *)self axisAligned])
      {
        [(PKFreeTransformGestureRecognizer *)self accumulatedTransform];
        double v84 = v51;
        double v85 = v59;
        double v68 = v43;
        double v69 = sqrt(v88 * v88 + v87 * v87);
        [(PKFreeTransformGestureRecognizer *)self minScale];
        double v70 = v57;
        double v71 = v49;
        double v72 = v41;
        *(double *)&uint64_t v74 = v73 / v69;
        [(PKFreeTransformGestureRecognizer *)self maxScale];
        *(double *)&uint64_t v76 = v75 / v69;
        [(PKFreeTransformGestureRecognizer *)self scaleDamping];
        DKDTransformMakeAxisAligned((uint64_t)retstr, v72, v68, v71, v84, v70, v85, v65, v67, v74, v76, v77);
      }
      else
      {
        DKDTransformMakeFree(0, (uint64_t)retstr, v41, v43, v49, v51, v57, v59, v65, v67);
      }
      double v78 = sqrt(retstr->b * retstr->b + retstr->a * retstr->a);
      [(PKFreeTransformGestureRecognizer *)self previousScale];
      double v80 = v78 - v79;
      [(PKFreeTransformGestureRecognizer *)self setPreviousScale:v78];
      [(PKFreeTransformGestureRecognizer *)self deltaScale];
      [(PKFreeTransformGestureRecognizer *)self setDeltaScale:v81 * 0.6 + v80 * 0.4];
    }
  }
  [(PKFreeTransformGestureRecognizer *)self accumulatedTransform];
  long long v82 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&t2.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&t2.c = v82;
  *(_OWORD *)&t2.tx = *(_OWORD *)&retstr->tx;
  result = CGAffineTransformConcat(&v90, &t1, &t2);
  long long v83 = *(_OWORD *)&v90.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v90.a;
  *(_OWORD *)&retstr->c = v83;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v90.tx;
  return result;
}

- (CGAffineTransform)unscaledFreeTransform
{
  uint64_t v5 = MEMORY[0x1E4F1DAB8];
  long long v6 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&retstr->c = v6;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v5 + 32);
  long long v7 = [(PKFreeTransformGestureRecognizer *)self touches];
  uint64_t v8 = [v7 count];

  if (v8 != 2)
  {
    result = [(PKFreeTransformGestureRecognizer *)self freeTransform];
LABEL_8:
    long long v52 = *(_OWORD *)&v61.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v61.a;
    *(_OWORD *)&retstr->c = v52;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v61.tx;
    return result;
  }
  long long v9 = [(PKFreeTransformGestureRecognizer *)self touchStartLocations];
  double v10 = [(PKFreeTransformGestureRecognizer *)self touches];
  uint64_t v11 = [v10 objectAtIndexedSubscript:0];
  CGFloat v12 = [v9 objectForKey:v11];
  [v12 CGPointValue];
  double v14 = v13;
  double v16 = v15;

  double v17 = [(PKFreeTransformGestureRecognizer *)self touchStartLocations];
  double v18 = [(PKFreeTransformGestureRecognizer *)self touches];
  double v19 = [v18 objectAtIndexedSubscript:1];
  v20 = [v17 objectForKey:v19];
  [v20 CGPointValue];
  double v22 = v21;
  double v24 = v23;

  double v25 = [(PKFreeTransformGestureRecognizer *)self touches];
  double v26 = [v25 objectAtIndexedSubscript:0];
  double v27 = [(PKFreeTransformGestureRecognizer *)self view];
  double v28 = [v27 superview];
  [v26 locationInView:v28];
  double v55 = v30;
  double v56 = v29;

  long long v31 = [(PKFreeTransformGestureRecognizer *)self touches];
  double v32 = [v31 objectAtIndexedSubscript:1];
  long long v33 = [(PKFreeTransformGestureRecognizer *)self view];
  v34 = [v33 superview];
  [v32 locationInView:v34];
  double v36 = v35;
  double v38 = v37;

  double v39 = v14;
  double v40 = v22;
  double v41 = (v14 + v22) * 0.5;
  double v42 = v24;
  double v43 = (v16 + v24) * 0.5;
  double v53 = (v55 + v38) * 0.5;
  double v54 = (v56 + v36) * 0.5;
  if (![(PKFreeTransformGestureRecognizer *)self axisAligned])
  {
    double v45 = atan2(v16 - v42, v39 - v40);
    double v46 = atan2(v55 - v38, v56 - v36);
    CGAffineTransformMakeTranslation(retstr, -v41, -v43);
    CGAffineTransformMakeRotation(&t2, v46 - v45);
    long long v47 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&t1.c = v47;
    *(_OWORD *)&t1.tx = *(_OWORD *)&retstr->tx;
    CGAffineTransformConcat(&v61, &t1, &t2);
    long long v48 = *(_OWORD *)&v61.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v61.a;
    *(_OWORD *)&retstr->c = v48;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v61.tx;
    CGAffineTransformMakeTranslation(&v58, v54, v53);
    long long v49 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&t1.c = v49;
    *(_OWORD *)&t1.tx = *(_OWORD *)&retstr->tx;
    CGAffineTransformConcat(&v61, &t1, &v58);
    long long v50 = *(_OWORD *)&v61.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&v61.a;
    *(_OWORD *)&retstr->c = v50;
    *(_OWORD *)&retstr->tx = *(_OWORD *)&v61.tx;
    [(PKFreeTransformGestureRecognizer *)self accumulatedTransform];
    long long v51 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&t1.c = v51;
    *(_OWORD *)&t1.tx = *(_OWORD *)&retstr->tx;
    result = CGAffineTransformConcat(&v61, &v57, &t1);
    goto LABEL_8;
  }

  return CGAffineTransformMakeTranslation(retstr, v54 - v41, v53 - v43);
}

- (CGPoint)locationInView:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v6 = *MEMORY[0x1E4F1DAD8];
  double v5 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v7 = [(PKFreeTransformGestureRecognizer *)self touches];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v20 + 1) + 8 * v11) locationInView:v4];
        double v6 = v6 + v12;
        double v5 = v5 + v13;
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }

  double v14 = [(PKFreeTransformGestureRecognizer *)self touches];
  uint64_t v15 = [v14 count];

  if (v15)
  {
    double v16 = [(PKFreeTransformGestureRecognizer *)self touches];
    double v17 = 1.0 / (double)(unint64_t)[v16 count];
    double v6 = v6 * v17;
    double v5 = v5 * v17;
  }
  double v18 = v6;
  double v19 = v5;
  result.y = v19;
  result.x = v18;
  return result;
}

- (void)resetStartingTouches
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v20[0] = *MEMORY[0x1E4F1DAB8];
  v20[1] = v3;
  v20[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [(PKFreeTransformGestureRecognizer *)self setAccumulatedTransform:v20];
  id v4 = [(PKFreeTransformGestureRecognizer *)self touchStartLocations];
  [v4 removeAllObjects];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id obj = [(PKFreeTransformGestureRecognizer *)self touches];
  uint64_t v5 = [obj countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v16 + 1) + 8 * v8);
        uint64_t v10 = [(PKFreeTransformGestureRecognizer *)self touchStartLocations];
        uint64_t v11 = (void *)MEMORY[0x1E4F29238];
        double v12 = [(PKFreeTransformGestureRecognizer *)self view];
        double v13 = [v12 superview];
        [v9 locationInView:v13];
        double v14 = objc_msgSend(v11, "valueWithCGPoint:");
        [v10 setObject:v14 forKey:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [obj countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v6);
  }
}

- (void)reset
{
  v6.receiver = self;
  v6.super_class = (Class)PKFreeTransformGestureRecognizer;
  [(PKFreeTransformGestureRecognizer *)&v6 reset];
  [(PKFreeTransformGestureRecognizer *)self clearTouches];
  [(PKFreeTransformGestureRecognizer *)self setCanBegin:0];
  [(PKFreeTransformGestureRecognizer *)self scaleThreshold];
  [(PKFreeTransformGestureRecognizer *)self setIsScaling:v3 <= 0.0];
  [(PKFreeTransformGestureRecognizer *)self setIsPanning:0];
  [(PKFreeTransformGestureRecognizer *)self setDeltaScale:0.0];
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v5[0] = *MEMORY[0x1E4F1DAB8];
  v5[1] = v4;
  v5[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [(PKFreeTransformGestureRecognizer *)self setAccumulatedTransform:v5];
}

- (void)resetAndAccumulateTransform
{
  long long v5 = 0u;
  long long v6 = 0u;
  long long v4 = 0u;
  [(PKFreeTransformGestureRecognizer *)self freeTransform];
  [(PKFreeTransformGestureRecognizer *)self resetStartingTouches];
  v3[0] = v4;
  v3[1] = v5;
  v3[2] = v6;
  [(PKFreeTransformGestureRecognizer *)self setAccumulatedTransform:v3];
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4 rejectExcessTouches:(BOOL)a5
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(PKFreeTransformGestureRecognizer *)self touches];
  uint64_t v11 = [v10 count];
  unint64_t v12 = [v8 count] + v11;

  if (v12 >= 3 && !a5)
  {
    double v13 = self;
    uint64_t v14 = 5;
LABEL_6:
    [(PKFreeTransformGestureRecognizer *)v13 setState:v14];
    goto LABEL_7;
  }
  uint64_t v15 = [v8 objectsPassingTest:&__block_literal_global_8];
  uint64_t v16 = [v15 count];

  if (v16)
  {
    double v13 = self;
    uint64_t v14 = 3;
    goto LABEL_6;
  }
  long long v17 = [(PKFreeTransformGestureRecognizer *)self touches];
  uint64_t v18 = [v17 count];
  unint64_t v19 = [v8 count] + v18;

  if (v19 < 3)
  {
    id v41 = v9;
    if ([(PKFreeTransformGestureRecognizer *)self state] == 1
      || [(PKFreeTransformGestureRecognizer *)self state] == 2)
    {
      [(PKFreeTransformGestureRecognizer *)self resetAndAccumulateTransform];
    }
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v42 = v8;
    id v25 = v8;
    uint64_t v26 = [v25 countByEnumeratingWithState:&v43 objects:v51 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v27; ++i)
        {
          if (*(void *)v44 != v28) {
            objc_enumerationMutation(v25);
          }
          double v30 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          long long v31 = [(PKFreeTransformGestureRecognizer *)self touches];
          [v31 addObject:v30];

          double v32 = (void *)MEMORY[0x1E4F29238];
          long long v33 = [(PKFreeTransformGestureRecognizer *)self view];
          v34 = [v33 superview];
          [v30 locationInView:v34];
          double v35 = objc_msgSend(v32, "valueWithCGPoint:");

          double v36 = [(PKFreeTransformGestureRecognizer *)self touchStartLocations];
          [v36 setObject:v35 forKey:v30];

          double v37 = [(PKFreeTransformGestureRecognizer *)self actualTouchStartLocations];
          [v37 setObject:v35 forKey:v30];
        }
        uint64_t v27 = [v25 countByEnumeratingWithState:&v43 objects:v51 count:16];
      }
      while (v27);
    }

    id v9 = v41;
    id v8 = v42;
    if (![(PKFreeTransformGestureRecognizer *)self state])
    {
      double v38 = [(PKFreeTransformGestureRecognizer *)self touches];
      if ([v38 count] == 2)
      {
      }
      else
      {
        BOOL v39 = [(PKFreeTransformGestureRecognizer *)self allowSingleTouchDrag];

        if (!v39) {
          goto LABEL_7;
        }
      }
      [(PKFreeTransformGestureRecognizer *)self startThreshold];
      double v13 = self;
      if (v40 > 0.0)
      {
        [(PKFreeTransformGestureRecognizer *)self setCanBegin:1];
        goto LABEL_7;
      }
      uint64_t v14 = 1;
      goto LABEL_6;
    }
  }
  else
  {
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v20 = v8;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v47 objects:v52 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v48;
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v48 != v23) {
            objc_enumerationMutation(v20);
          }
          [(PKFreeTransformGestureRecognizer *)self ignoreTouch:*(void *)(*((void *)&v47 + 1) + 8 * j) forEvent:v9];
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v47 objects:v52 count:16];
      }
      while (v22);
    }
  }
LABEL_7:
}

BOOL __79__PKFreeTransformGestureRecognizer_touchesBegan_withEvent_rejectExcessTouches___block_invoke(uint64_t a1, void *a2)
{
  return [a2 type] == 2;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
}

- (BOOL)touchesMovedPastThreshold:(double)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v5 = [(PKFreeTransformGestureRecognizer *)self touches];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    char v8 = 0;
    uint64_t v9 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        unint64_t v12 = [(PKFreeTransformGestureRecognizer *)self view];
        uint64_t v13 = [v12 superview];
        [v11 locationInView:v13];
        double v15 = v14;
        double v17 = v16;

        uint64_t v18 = [(PKFreeTransformGestureRecognizer *)self touchStartLocations];
        unint64_t v19 = [v18 objectForKey:v11];
        [v19 CGPointValue];
        LOBYTE(v13) = sqrt((v17 - v21) * (v17 - v21) + (v15 - v20) * (v15 - v20)) > a3;

        v8 |= v13;
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v7);
  }
  else
  {
    char v8 = 0;
  }

  return v8 & 1;
}

- (BOOL)touchesMovedPastScaleThreshold:(double)a3
{
  long long v5 = [(PKFreeTransformGestureRecognizer *)self touches];
  unint64_t v6 = [v5 count];

  if (v6 < 2) {
    return 0;
  }
  double v46 = a3;
  uint64_t v7 = [(PKFreeTransformGestureRecognizer *)self actualTouchStartLocations];
  char v8 = [(PKFreeTransformGestureRecognizer *)self touches];
  uint64_t v9 = [v8 objectAtIndexedSubscript:0];
  uint64_t v10 = [v7 objectForKey:v9];
  [v10 CGPointValue];
  double v12 = v11;
  double v14 = v13;

  double v15 = [(PKFreeTransformGestureRecognizer *)self actualTouchStartLocations];
  double v16 = [(PKFreeTransformGestureRecognizer *)self touches];
  double v17 = [v16 objectAtIndexedSubscript:1];
  uint64_t v18 = [v15 objectForKey:v17];
  [v18 CGPointValue];
  double v20 = v19;
  double v22 = v21;

  long long v23 = [(PKFreeTransformGestureRecognizer *)self touches];
  long long v24 = [v23 objectAtIndexedSubscript:0];
  long long v25 = [(PKFreeTransformGestureRecognizer *)self view];
  long long v26 = [v25 superview];
  [v24 locationInView:v26];
  double v28 = v27;
  double v30 = v29;

  long long v31 = [(PKFreeTransformGestureRecognizer *)self touches];
  double v32 = [v31 objectAtIndexedSubscript:1];
  long long v33 = [(PKFreeTransformGestureRecognizer *)self view];
  v34 = [v33 superview];
  [v32 locationInView:v34];
  double v36 = v35;
  double v38 = v37;

  double v39 = vabdd_f64(sqrt((v14 - v22) * (v14 - v22) + (v12 - v20) * (v12 - v20)), sqrt((v30 - v38) * (v30 - v38) + (v28 - v36) * (v28 - v36)));
  double v40 = (v12 + v20) * 0.5 - (v28 + v36) * 0.5;
  double v41 = (v14 + v22) * 0.5 - (v30 + v38) * 0.5;
  double v42 = sqrt(v41 * v41 + v40 * v40);
  double v43 = 1.0;
  double v44 = v42 / (v39 * 2.0 + 1.0);
  if (v44 >= 1.0)
  {
    double v43 = v44;
    if (v44 > 2.0) {
      double v43 = 2.0;
    }
  }
  return v39 > v43 * v46;
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PKFreeTransformGestureRecognizer;
  [(PKFreeTransformGestureRecognizer *)&v5 touchesMoved:a3 withEvent:a4];
  [(PKFreeTransformGestureRecognizer *)self freeTransform];
  if (![(PKFreeTransformGestureRecognizer *)self state])
  {
    if ([(PKFreeTransformGestureRecognizer *)self canBegin]
      && ([(PKFreeTransformGestureRecognizer *)self startThreshold],
          -[PKFreeTransformGestureRecognizer touchesMovedPastThreshold:](self, "touchesMovedPastThreshold:")))
    {
      [(PKFreeTransformGestureRecognizer *)self setState:1];
      [(PKFreeTransformGestureRecognizer *)self resetStartingTouches];
    }
    else
    {
      [(PKFreeTransformGestureRecognizer *)self cancelThreshold];
      if (-[PKFreeTransformGestureRecognizer touchesMovedPastThreshold:](self, "touchesMovedPastThreshold:")) {
        [(PKFreeTransformGestureRecognizer *)self setState:5];
      }
    }
  }
  if (![(PKFreeTransformGestureRecognizer *)self isScaling])
  {
    [(PKFreeTransformGestureRecognizer *)self scaleThreshold];
    if (-[PKFreeTransformGestureRecognizer touchesMovedPastScaleThreshold:](self, "touchesMovedPastScaleThreshold:"))
    {
      [(PKFreeTransformGestureRecognizer *)self resetAndAccumulateTransform];
      [(PKFreeTransformGestureRecognizer *)self setIsScaling:1];
    }
  }
  if (![(PKFreeTransformGestureRecognizer *)self isPanning]
    && ![(PKFreeTransformGestureRecognizer *)self isScaling]
    && ([(PKFreeTransformGestureRecognizer *)self state] == 1
     || [(PKFreeTransformGestureRecognizer *)self state] == 2))
  {
    if ([(PKFreeTransformGestureRecognizer *)self allowedPanEdges]) {
      [(PKFreeTransformGestureRecognizer *)self setIsPanning:1];
    }
    else {
      [(PKFreeTransformGestureRecognizer *)self setState:4];
    }
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  unint64_t v6 = [(PKFreeTransformGestureRecognizer *)self touches];
  uint64_t v7 = [v6 count];
  if (v7 - [v5 count] == 1
    && [(PKFreeTransformGestureRecognizer *)self allowSingleTouchDrag])
  {
    BOOL v8 = [(PKFreeTransformGestureRecognizer *)self axisAligned];

    if (!v8)
    {
      [(PKFreeTransformGestureRecognizer *)self resetAndAccumulateTransform];
      int v9 = 0;
      goto LABEL_7;
    }
  }
  else
  {
  }
  int v9 = 1;
LABEL_7:
  if ([(PKFreeTransformGestureRecognizer *)self axisAligned])
  {
    [(PKFreeTransformGestureRecognizer *)self setScaleDamping:0.0];
    [(PKFreeTransformGestureRecognizer *)self resetAndAccumulateTransform];
    [(PKFreeTransformGestureRecognizer *)self setScaleDamping:0.5];
  }
  uint64_t v10 = [(PKFreeTransformGestureRecognizer *)self touches];
  [v10 minusSet:v5];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v11 = v5;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        double v17 = [(PKFreeTransformGestureRecognizer *)self touchStartLocations];
        [v17 removeObjectForKey:v16];

        uint64_t v18 = [(PKFreeTransformGestureRecognizer *)self actualTouchStartLocations];
        [v18 removeObjectForKey:v16];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v13);
  }

  if (v9)
  {
    if ([(PKFreeTransformGestureRecognizer *)self state] == 1)
    {
      uint64_t v19 = 3;
    }
    else if ([(PKFreeTransformGestureRecognizer *)self state] == 2)
    {
      uint64_t v19 = 3;
    }
    else
    {
      uint64_t v19 = 5;
    }
    -[PKFreeTransformGestureRecognizer setState:](self, "setState:", v19, (void)v20);
  }
}

- (void)clearTouches
{
  double v3 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
  touches = self->_touches;
  self->_touches = v3;

  id v5 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  touchStartLocations = self->_touchStartLocations;
  self->_touchStartLocations = v5;

  uint64_t v7 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  actualTouchStartLocations = self->_actualTouchStartLocations;
  self->_actualTouchStartLocations = v7;
}

- (double)startThreshold
{
  return self->_startThreshold;
}

- (void)setStartThreshold:(double)a3
{
  self->_startThreshold = a3;
}

- (double)scaleThreshold
{
  return self->_scaleThreshold;
}

- (void)setScaleThreshold:(double)a3
{
  self->_scaleThreshold = a3;
}

- (double)cancelThreshold
{
  return self->_cancelThreshold;
}

- (void)setCancelThreshold:(double)a3
{
  self->_cancelThreshold = a3;
}

- (unint64_t)allowedPanEdges
{
  return self->_allowedPanEdges;
}

- (void)setAllowedPanEdges:(unint64_t)a3
{
  self->_allowedPanEdges = a3;
}

- (BOOL)allowSingleTouchDrag
{
  return self->_allowSingleTouchDrag;
}

- (void)setAllowSingleTouchDrag:(BOOL)a3
{
  self->_allowSingleTouchDrag = a3;
}

- (BOOL)axisAligned
{
  return self->_axisAligned;
}

- (void)setAxisAligned:(BOOL)a3
{
  self->_axisAligned = a3;
}

- (double)minScale
{
  return self->_minScale;
}

- (void)setMinScale:(double)a3
{
  self->_minScale = a3;
}

- (double)maxScale
{
  return self->_maxScale;
}

- (void)setMaxScale:(double)a3
{
  self->_maxScale = a3;
}

- (double)scaleDamping
{
  return self->_scaleDamping;
}

- (void)setScaleDamping:(double)a3
{
  self->_scaleDamping = a3;
}

- (double)previousScale
{
  return self->_previousScale;
}

- (void)setPreviousScale:(double)a3
{
  self->_previousScale = a3;
}

- (NSMutableOrderedSet)touches
{
  return self->_touches;
}

- (BOOL)canBegin
{
  return self->_canBegin;
}

- (void)setCanBegin:(BOOL)a3
{
  self->_canBegin = a3;
}

- (BOOL)isScaling
{
  return self->_isScaling;
}

- (void)setIsScaling:(BOOL)a3
{
  self->_isScaling = a3;
}

- (BOOL)isPanning
{
  return self->_isPanning;
}

- (void)setIsPanning:(BOOL)a3
{
  self->_isPanning = a3;
}

- (double)deltaScale
{
  return self->_deltaScale;
}

- (void)setDeltaScale:(double)a3
{
  self->_deltaScale = a3;
}

- (CGAffineTransform)accumulatedTransform
{
  long long v3 = *(_OWORD *)&self[8].b;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[7].ty;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[8].d;
  return self;
}

- (void)setAccumulatedTransform:(CGAffineTransform *)a3
{
  long long v4 = *(_OWORD *)&a3->c;
  long long v3 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_accumulatedTransform.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_accumulatedTransform.c = v4;
  *(_OWORD *)&self->_accumulatedTransform.tx = v3;
}

- (NSMapTable)touchStartLocations
{
  return self->_touchStartLocations;
}

- (void)setTouchStartLocations:(id)a3
{
}

- (NSMapTable)actualTouchStartLocations
{
  return self->_actualTouchStartLocations;
}

- (void)setActualTouchStartLocations:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actualTouchStartLocations, 0);
  objc_storeStrong((id *)&self->_touchStartLocations, 0);

  objc_storeStrong((id *)&self->_touches, 0);
}

@end