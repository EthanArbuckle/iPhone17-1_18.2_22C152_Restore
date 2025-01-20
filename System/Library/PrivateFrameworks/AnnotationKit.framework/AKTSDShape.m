@interface AKTSDShape
- (AKTSDBezierPath)path;
- (AKTSDBrushStroke)stroke;
- (AKTSDLineEnd)headLineEnd;
- (AKTSDLineEnd)tailLineEnd;
- (AKTSDShape)init;
- (CGPoint)headLineEndPoint;
- (CGPoint)tailLineEndPoint;
- (double)headLineEndAngle;
- (double)lineEndScale;
- (double)tailLineEndAngle;
- (id)_newClippedPath;
- (id)clippedPathForLineEnds;
- (id)strokeHeadLineEnd;
- (id)strokeTailLineEnd;
- (void)drawInContext:(CGContext *)a3;
- (void)p_computeAngle:(double *)a3 point:(CGPoint *)a4 cutSegment:(int64_t *)a5 cutT:(double *)a6 forLineEndAtHead:(BOOL)a7;
- (void)p_drawLineEndForHead:(BOOL)a3 withDelta:(CGPoint)a4 inContext:(CGContext *)a5 useFastDrawing:(BOOL)a6;
- (void)p_invalidateClippedPath;
- (void)p_invalidateHead;
- (void)p_invalidateTail;
- (void)p_validateHeadAndTail;
- (void)p_validateHeadLineEnd;
- (void)p_validateTailLineEnd;
- (void)setHeadLineEnd:(id)a3;
- (void)setPath:(id)a3;
- (void)setStroke:(id)a3;
- (void)setTailLineEnd:(id)a3;
@end

@implementation AKTSDShape

- (AKTSDShape)init
{
  v3.receiver = self;
  v3.super_class = (Class)AKTSDShape;
  result = [(AKTSDShape *)&v3 init];
  if (result) {
    *(_WORD *)&result->mShapeInvalidFlags |= 0x3FFu;
  }
  return result;
}

- (void)drawInContext:(CGContext *)a3
{
  v5 = [(AKTSDShape *)self stroke];
  v6 = [(AKTSDShape *)self clippedPathForLineEnds];
  [v5 brushPath:v6 inContext:a3];

  double v7 = *MEMORY[0x263F00148];
  double v8 = *(double *)(MEMORY[0x263F00148] + 8);
  -[AKTSDShape p_drawLineEndForHead:withDelta:inContext:useFastDrawing:](self, "p_drawLineEndForHead:withDelta:inContext:useFastDrawing:", 1, a3, 0, *MEMORY[0x263F00148], v8);

  -[AKTSDShape p_drawLineEndForHead:withDelta:inContext:useFastDrawing:](self, "p_drawLineEndForHead:withDelta:inContext:useFastDrawing:", 0, a3, 0, v7, v8);
}

- (void)p_drawLineEndForHead:(BOOL)a3 withDelta:(CGPoint)a4 inContext:(CGContext *)a5 useFastDrawing:(BOOL)a6
{
  BOOL v6 = a6;
  double x = a4.x;
  if (a3)
  {
    uint64_t v10 = [(AKTSDShape *)self strokeHeadLineEnd];
    if (!v10) {
      return;
    }
    id v25 = (id)v10;
    [(AKTSDShape *)self headLineEndPoint];
    double v12 = v11;
    double v14 = v13;
    [(AKTSDShape *)self headLineEndAngle];
  }
  else
  {
    uint64_t v16 = [(AKTSDShape *)self strokeTailLineEnd];
    if (!v16) {
      return;
    }
    id v25 = (id)v16;
    [(AKTSDShape *)self tailLineEndPoint];
    double v12 = v17;
    double v14 = v18;
    [(AKTSDShape *)self tailLineEndAngle];
  }
  double v19 = v15;
  double v20 = sub_237684604(v12, v14, x);
  double v22 = v21;
  v23 = [(AKTSDShape *)self stroke];
  [(AKTSDShape *)self lineEndScale];
  objc_msgSend(v23, "paintLineEnd:atPoint:atAngle:withScale:inContext:useFastDrawing:", v25, a5, v6, v20, v22, v19, v24);
}

- (id)strokeHeadLineEnd
{
  objc_super v3 = [(AKTSDShape *)self headLineEnd];
  if (v3)
  {
    v4 = [(AKTSDShape *)self stroke];
    v5 = [(AKTSDShape *)self headLineEnd];
    BOOL v6 = [v4 strokeLineEnd:v5];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)strokeTailLineEnd
{
  objc_super v3 = [(AKTSDShape *)self tailLineEnd];
  if (v3)
  {
    v4 = [(AKTSDShape *)self stroke];
    v5 = [(AKTSDShape *)self tailLineEnd];
    BOOL v6 = [v4 strokeLineEnd:v5];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (double)lineEndScale
{
  v2 = [(AKTSDShape *)self stroke];
  [v2 width];
  double v4 = v3;

  double result = (v4 + -1.0) * 0.6 + 1.0;
  if (v4 <= 1.0) {
    return v4;
  }
  return result;
}

- (CGPoint)headLineEndPoint
{
  [(AKTSDShape *)self p_validateHeadLineEnd];
  double x = self->mHeadLineEndPoint.x;
  double y = self->mHeadLineEndPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)tailLineEndPoint
{
  [(AKTSDShape *)self p_validateTailLineEnd];
  double x = self->mTailLineEndPoint.x;
  double y = self->mTailLineEndPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (double)headLineEndAngle
{
  return self->mHeadLineEndAngle;
}

- (double)tailLineEndAngle
{
  return self->mTailLineEndAngle;
}

- (id)clippedPathForLineEnds
{
  if ((*(_WORD *)&self->mShapeInvalidFlags & 0x200) != 0)
  {
    double v3 = [(AKTSDShape *)self _newClippedPath];
    mCachedClippedPath = self->mCachedClippedPath;
    self->mCachedClippedPath = v3;

    *(_WORD *)&self->mShapeInvalidFlags &= ~0x200u;
  }
  v5 = self->mCachedClippedPath;

  return v5;
}

- (void)p_invalidateHead
{
  *(_WORD *)&self->mShapeInvalidFlags |= 0xC0u;
  MEMORY[0x270F9A6D0](self, sel_p_invalidateClippedPath);
}

- (void)p_invalidateTail
{
  *(_WORD *)&self->mShapeInvalidFlags |= 0x140u;
  MEMORY[0x270F9A6D0](self, sel_p_invalidateClippedPath);
}

- (void)p_invalidateClippedPath
{
  *(_WORD *)&self->mShapeInvalidFlags |= 0x200u;
  self->mCachedClippedPath = 0;
  MEMORY[0x270F9A758]();
}

- (void)p_validateHeadAndTail
{
  __int16 mShapeInvalidFlags = (__int16)self->mShapeInvalidFlags;
  if ((mShapeInvalidFlags & 0x40) != 0)
  {
    *(_WORD *)&self->__int16 mShapeInvalidFlags = mShapeInvalidFlags & 0xFFBF;
    id v4 = [(AKTSDShape *)self path];
    [v4 getStartPoint:&self->mTailPoint andEndPoint:&self->mHeadPoint];
  }
}

- (void)p_validateHeadLineEnd
{
  [(AKTSDShape *)self p_validateHeadAndTail];
  __int16 mShapeInvalidFlags = (__int16)self->mShapeInvalidFlags;
  if ((mShapeInvalidFlags & 0x80) != 0)
  {
    *(_WORD *)&self->__int16 mShapeInvalidFlags = mShapeInvalidFlags & 0xFF7F;
    MEMORY[0x270F9A6D0](self, sel_p_computeAngle_point_cutSegment_cutT_forLineEndAtHead_);
  }
}

- (void)p_validateTailLineEnd
{
  if ((*(_WORD *)&self->mShapeInvalidFlags & 0x100) != 0)
  {
    *(_WORD *)&self->mShapeInvalidFlags &= ~0x100u;
    MEMORY[0x270F9A6D0](self, sel_p_computeAngle_point_cutSegment_cutT_forLineEndAtHead_);
  }
}

- (void)p_computeAngle:(double *)a3 point:(CGPoint *)a4 cutSegment:(int64_t *)a5 cutT:(double *)a6 forLineEndAtHead:(BOOL)a7
{
  BOOL v7 = a7;
  [(AKTSDShape *)self p_validateHeadAndTail];
  uint64_t v13 = 40;
  if (v7) {
    uint64_t v13 = 24;
  }
  uint64_t v14 = 32;
  if (v7) {
    uint64_t v14 = 16;
  }
  double v15 = *(double *)((char *)&self->super.isa + v14);
  double v16 = *(double *)((char *)&self->super.isa + v13);
  if (v7) {
    [(AKTSDShape *)self strokeHeadLineEnd];
  }
  else {
  double v17 = [(AKTSDShape *)self strokeTailLineEnd];
  }
  if (v17 && (v40 = v17, ([v17 isNone] & 1) == 0))
  {
    BoundingBodouble x = CGPathGetBoundingBox((CGPathRef)[v40 path]);
    double MaxY = CGRectGetMaxY(BoundingBox);
    [v40 endPoint];
    double v20 = MaxY - v19;
    if (![v40 isFilled]) {
      double v20 = v20 + 0.75;
    }
    [(AKTSDShape *)self lineEndScale];
    double v22 = v21 * v20;
    v23 = +[AKTSDBezierPath bezierPathWithOvalInRect:](AKTSDBezierPath, "bezierPathWithOvalInRect:", v15 - v22, v16 - v22, v22 + v22, v22 + v22);
    id v24 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v25 = [(AKTSDShape *)self path];
    [v25 addIntersectionsWithPath:v23 to:v24 allIntersections:0 reversed:v7];

    if ([v24 count])
    {
      [v24 sortUsingSelector:sel_compareSegmentAndT_];
      if (v7) {
        [v24 lastObject];
      }
      else {
      v26 = [v24 objectAtIndex:0];
      }
      [v26 point];
      double x = v29;
      double y = v30;
    }
    else if (v7)
    {
      v26 = 0;
      double x = self->mTailPoint.x;
      double y = self->mTailPoint.y;
    }
    else
    {
      v26 = 0;
      double x = self->mHeadPoint.x;
      double y = self->mHeadPoint.y;
    }
    double v31 = sub_237684610(v15, v16, x);
    *a3 = sub_237684688(v31, v32) + -1.57079633;
    double v33 = sub_237684610(x, y, v15);
    double v35 = *MEMORY[0x263F00148];
    if (v33 != *MEMORY[0x263F00148] || v34 != *(double *)(MEMORY[0x263F00148] + 8))
    {
      double v36 = sub_23768465C(v33, v34);
      double v35 = sub_23768461C(v36, v37, v22);
    }
    a4->double x = sub_237684604(v15, v16, v35);
    a4->double y = v38;
    if (v26)
    {
      *a5 = [v26 segment];
      [v26 t];
    }
    else
    {
      *a5 = 0;
      uint64_t v39 = 0;
    }
    *(void *)a6 = v39;
  }
  else
  {
    *a3 = 1.57079633;
    a4->double x = v15;
    a4->double y = v16;
    *a5 = -1;
    *a6 = 0.0;
  }

  MEMORY[0x270F9A758]();
}

- (id)_newClippedPath
{
  [(AKTSDShape *)self p_validateHeadLineEnd];
  [(AKTSDShape *)self p_validateTailLineEnd];
  if ((self->mHeadCutSegment & 0x8000000000000000) == 0 || (self->mTailCutSegment & 0x8000000000000000) == 0)
  {
    double v3 = [(AKTSDShape *)self stroke];
    [v3 width];
    double v5 = v4;

    BOOL v6 = objc_alloc_init(AKTSDBezierPath);
    double v7 = sub_237684698(self->mTailLineEndAngle + 1.57079633);
    double v8 = v5 * 0.0;
    double v10 = sub_23768461C(v7, v9, v8);
    double x = self->mTailLineEndPoint.x;
    double y = self->mTailLineEndPoint.y;
    double v13 = sub_237684604(x, y, v10);
    double v15 = v14;
    double v16 = sub_237684698(self->mHeadLineEndAngle + 1.57079633);
    double v18 = sub_23768461C(v16, v17, v8);
    double v19 = sub_237684604(self->mHeadLineEndPoint.x, self->mHeadLineEndPoint.y, v18);
    double v21 = v20;
    int64_t mHeadCutSegment = self->mHeadCutSegment;
    int64_t mTailCutSegment = self->mTailCutSegment;
    if ((mHeadCutSegment < 0 || mHeadCutSegment >= mTailCutSegment)
      && (mHeadCutSegment != mTailCutSegment || self->mHeadCutT >= self->mTailCutT))
    {
      if (mTailCutSegment < 0)
      {
        -[AKTSDBezierPath moveToPoint:](v6, "moveToPoint:", x, y);
      }
      else
      {
        -[AKTSDBezierPath moveToPoint:](v6, "moveToPoint:", v13, v15);
        -[AKTSDBezierPath lineToPoint:](v6, "lineToPoint:", self->mTailLineEndPoint.x, self->mTailLineEndPoint.y);
      }
      id v24 = [(AKTSDShape *)self path];
      [(AKTSDBezierPath *)v6 appendBezierPath:v24 fromSegment:self->mTailCutSegment t:self->mHeadCutSegment toSegment:1 t:self->mTailCutT withoutMove:self->mHeadCutT];

      if (self->mHeadCutSegment < 0) {
        goto LABEL_14;
      }
    }
    else
    {
      -[AKTSDBezierPath moveToPoint:](v6, "moveToPoint:", v13, v15);
    }
    -[AKTSDBezierPath lineToPoint:](v6, "lineToPoint:", v19, v21);
LABEL_14:

    return v6;
  }
  [(AKTSDShape *)self path];
  return (id)objc_claimAutoreleasedReturnValue();
}

- (AKTSDBezierPath)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
}

- (AKTSDBrushStroke)stroke
{
  return self->_stroke;
}

- (void)setStroke:(id)a3
{
}

- (AKTSDLineEnd)headLineEnd
{
  return self->_headLineEnd;
}

- (void)setHeadLineEnd:(id)a3
{
}

- (AKTSDLineEnd)tailLineEnd
{
  return self->_tailLineEnd;
}

- (void)setTailLineEnd:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tailLineEnd, 0);
  objc_storeStrong((id *)&self->_headLineEnd, 0);
  objc_storeStrong((id *)&self->_stroke, 0);
  objc_storeStrong((id *)&self->_path, 0);

  objc_storeStrong((id *)&self->mCachedClippedPath, 0);
}

@end