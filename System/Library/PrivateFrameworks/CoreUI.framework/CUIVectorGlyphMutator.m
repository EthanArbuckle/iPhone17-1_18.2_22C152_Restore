@interface CUIVectorGlyphMutator
+ ($57208586A15A58339C904728178D1914)deltaArrayFrom:(id)a3 to:(id)a4;
+ ($57208586A15A58339C904728178D1914)pointArrayFromPath:(CGPath *)a3;
+ ($F24F406B2B787EFB06265DBA3D28CBD5)_scalarsForGlyphContinuousWeight:(double)a3 inDictionary:(id)a4 shouldClamp:(BOOL)a5;
+ ($F24F406B2B787EFB06265DBA3D28CBD5)scalarsForGlyphContinuousWeight:(double)a3 glyphContinuousSize:(double)a4;
+ ($F24F406B2B787EFB06265DBA3D28CBD5)scalarsForGlyphWeight:(int64_t)a3 glyphSize:(int64_t)a4;
+ ($F24F406B2B787EFB06265DBA3D28CBD5)transformForGlyphContinuousSize:(double)a3;
+ ($F24F406B2B787EFB06265DBA3D28CBD5)transformForGlyphSize:(int64_t)a3;
+ (double)realloc_cgfloat_array:(double *)a3 withNewCount:(unint64_t)a4;
+ (id)_interpolationData;
- ($57208586A15A58339C904728178D1914)applyDeltasWithScalars:(id)a3;
- ($57208586A15A58339C904728178D1914)applyDeltasWithScalars:(id)a3 andTransform:(id)a4;
- ($57208586A15A58339C904728178D1914)blackDeltas;
- ($57208586A15A58339C904728178D1914)originPoints;
- ($57208586A15A58339C904728178D1914)ultralightDeltas;
- (CGPath)cgPathFrom:(id)a3;
- (CUIVectorGlyphMutator)initWithPointSize:(double)a3 regular:(id)a4 ultralight:(id)a5 black:(id)a6;
- (CUIVectorGlyphPath)blackPath;
- (CUIVectorGlyphPath)originPath;
- (CUIVectorGlyphPath)ultralightPath;
- (NSData)blackClipStrokeKeyframes;
- (NSData)originClipStrokeKeyframes;
- (NSData)ultralightClipStrokeKeyframes;
- (double)pointSize;
- (id)clipStrokeKeyframesForPath:(id)a3 scalars:(id)a4;
- (id)pathForScalars:(id)a3;
- (id)pathForScalars:(id)a3 andTransform:(id)a4;
- (void)convertDistance0:(float)a3 distance1:(float)a4 elementIndex0Out:(unint64_t *)a5 distance0Out:(float *)a6 elementIndex1Out:(unint64_t *)a7 distance1Out:(float *)a8 forSubpath:(unint64_t)a9 data:(CUIVectorGlyphPathLengthData *)a10;
- (void)dealloc;
- (void)setBlackClipStrokeKeyframes:(id)a3;
- (void)setBlackDeltas:(id)a3;
- (void)setBlackPath:(id)a3;
- (void)setOriginClipStrokeKeyframes:(id)a3;
- (void)setOriginPath:(id)a3;
- (void)setOriginPoints:(id)a3;
- (void)setPointSize:(double)a3;
- (void)setUltralightClipStrokeKeyframes:(id)a3;
- (void)setUltralightDeltas:(id)a3;
- (void)setUltralightPath:(id)a3;
@end

@implementation CUIVectorGlyphMutator

+ ($F24F406B2B787EFB06265DBA3D28CBD5)_scalarsForGlyphContinuousWeight:(double)a3 inDictionary:(id)a4 shouldClamp:(BOOL)a5
{
  if (!a4) {
    +[CUIVectorGlyphMutator _scalarsForGlyphContinuousWeight:inDictionary:shouldClamp:]();
  }
  id v7 = objc_msgSend(a4, "objectForKeyedSubscript:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a4, a5));
  if (v7) {
    goto LABEL_5;
  }
  double v9 = _segmentForGlyphContinuousWeight(0, a3);
  double v10 = v8;
  if (vabdd_f64(v8, v9) < 2.22044605e-16)
  {
    id v7 = objc_msgSend(a4, "objectForKeyedSubscript:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v9));
    if (!v7) {
      +[CUIVectorGlyphMutator _scalarsForGlyphContinuousWeight:inDictionary:shouldClamp:]();
    }
LABEL_5:
    [v7 deltaScalarsValue];
    goto LABEL_20;
  }
  id v13 = objc_msgSend(a4, "objectForKeyedSubscript:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v8));
  id v14 = objc_msgSend(a4, "objectForKeyedSubscript:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v9));
  if (!v13) {
    +[CUIVectorGlyphMutator _scalarsForGlyphContinuousWeight:inDictionary:shouldClamp:]();
  }
  v15 = v14;
  if (!v14) {
    +[CUIVectorGlyphMutator _scalarsForGlyphContinuousWeight:inDictionary:shouldClamp:].cold.4();
  }
  [v13 deltaScalarsValue];
  double v17 = v16;
  double v19 = v18;
  [v15 deltaScalarsValue];
  double v22 = (a3 - v9) / (v10 - v9);
  double v23 = v20 + (v17 - v20) * v22;
  double v24 = v21 + (v19 - v21) * v22;
  double v25 = (a3 - v10) / (v10 - v9) + 1.0;
  double v26 = v20 + (v17 - v20) * v25;
  if (v10 < a3) {
    double v24 = v21 + (v19 - v21) * v25;
  }
  else {
    double v26 = v23;
  }
  double v27 = (v9 - a3) / (v10 - v9) + 1.0;
  double v11 = v17 + (v20 - v17) * v27;
  double v12 = v19 + (v21 - v19) * v27;
  if (v9 <= a3)
  {
    double v11 = v26;
    double v12 = v24;
  }
LABEL_20:
  result.var1 = v12;
  result.var0 = v11;
  return result;
}

+ ($F24F406B2B787EFB06265DBA3D28CBD5)scalarsForGlyphContinuousWeight:(double)a3 glyphContinuousSize:(double)a4
{
  id v7 = [a1 _interpolationData];
  id v8 = objc_msgSend(v7, "objectForKeyedSubscript:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a4));
  if (v8)
  {
    id v9 = v8;
    id v10 = a1;
    double v11 = a3;
  }
  else
  {
    double v12 = _segmentForGlyphContinuousSize(0, a4);
    double v14 = v13;
    id v15 = objc_msgSend(v7, "objectForKeyedSubscript:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v13));
    id v16 = objc_msgSend(v7, "objectForKeyedSubscript:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v12));
    if (!v15) {
      +[CUIVectorGlyphMutator scalarsForGlyphContinuousWeight:glyphContinuousSize:]();
    }
    id v17 = v16;
    if (!v16) {
      +[CUIVectorGlyphMutator scalarsForGlyphContinuousWeight:glyphContinuousSize:]();
    }
    double v18 = v14 - v12;
    if (fabs(v14 - v12) >= 2.22044605e-16)
    {
      [a1 _scalarsForGlyphContinuousWeight:v15 inDictionary:0 shouldClamp:a3];
      double v22 = v21;
      double v24 = v23;
      [a1 _scalarsForGlyphContinuousWeight:v17 inDictionary:0 shouldClamp:a3];
      double v25 = (a4 - v12) / v18;
      double v19 = v26 + (v22 - v26) * v25;
      double v20 = v27 + (v24 - v27) * v25;
      goto LABEL_13;
    }
    id v10 = a1;
    double v11 = a3;
    id v9 = v17;
  }
  [v10 _scalarsForGlyphContinuousWeight:v9 inDictionary:0 shouldClamp:v11];
LABEL_13:
  result.var1 = v20;
  result.var0 = v19;
  return result;
}

+ (id)_interpolationData
{
  if (_interpolationData_once != -1) {
    dispatch_once(&_interpolationData_once, &__block_literal_global_10);
  }
  return (id)_interpolationData_interpolationData;
}

+ ($F24F406B2B787EFB06265DBA3D28CBD5)transformForGlyphContinuousSize:(double)a3
{
  uint64_t v3 = 0;
  while (*(double *)&kCoreThemeContinuousGlyphSizes[v3] != a3)
  {
    if (++v3 == 3) {
      goto LABEL_7;
    }
  }
  if (kCoreThemeDiscreteGlyphSizes[v3])
  {
    objc_msgSend(a1, "transformForGlyphSize:");
    goto LABEL_8;
  }
LABEL_7:
  double v4 = a3 * -0.352294922 + 0.352294922;
LABEL_8:
  result.var1 = v4;
  result.var0 = a3;
  return result;
}

+ ($F24F406B2B787EFB06265DBA3D28CBD5)transformForGlyphSize:(int64_t)a3
{
  double v3 = 0.0;
  if ((unint64_t)a3 < 2)
  {
    double v4 = 1.0;
  }
  else
  {
    if (a3 == 2)
    {
      v5 = &_CUIVectorGlyphContinuousSizeMedium;
      goto LABEL_7;
    }
    double v4 = 0.0;
    if (a3 == 3)
    {
      v5 = &_CUIVectorGlyphContinuousSizeLarge;
LABEL_7:
      double v4 = *(double *)v5;
      double v3 = *(double *)v5 * -0.352294922 + 0.352294922;
    }
  }
  result.var1 = v3;
  result.var0 = v4;
  return result;
}

- (id)pathForScalars:(id)a3 andTransform:(id)a4
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  id v7 = -[CUIVectorGlyphMutator applyDeltasWithScalars:andTransform:](self, "applyDeltasWithScalars:andTransform:", a3.var0, a3.var1, a4.var0, a4.var1);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = __53__CUIVectorGlyphMutator_pathForScalars_andTransform___block_invoke;
  v10[3] = &unk_1E5A58558;
  v10[4] = self;
  *(double *)&v10[5] = var0;
  *(double *)&v10[6] = var1;
  return +[CUIVectorGlyphPath createWithPath:clipStrokeKeyframeProvider:](CUIVectorGlyphPath, "createWithPath:clipStrokeKeyframeProvider:", -[CUIVectorGlyphMutator cgPathFrom:](self, "cgPathFrom:", v7, v8), v10);
}

- (void)dealloc
{
  free([(CUIVectorGlyphMutator *)self originPoints]);
  free([(CUIVectorGlyphMutator *)self ultralightDeltas]);
  free([(CUIVectorGlyphMutator *)self blackDeltas]);

  v3.receiver = self;
  v3.super_class = (Class)CUIVectorGlyphMutator;
  [(CUIVectorGlyphMutator *)&v3 dealloc];
}

- ($57208586A15A58339C904728178D1914)ultralightDeltas
{
  unint64_t numDeltas = self->_ultralightDeltas.numDeltas;
  deltaComponents = self->_ultralightDeltas.deltaComponents;
  result.double var1 = numDeltas;
  result.double var0 = deltaComponents;
  return result;
}

- ($57208586A15A58339C904728178D1914)originPoints
{
  unint64_t numPoints = self->_originPoints.numPoints;
  pointComponents = self->_originPoints.pointComponents;
  result.double var1 = numPoints;
  result.double var0 = pointComponents;
  return result;
}

- (CGPath)cgPathFrom:(id)a3
{
  double var0 = a3.var0;
  CGMutablePathRef Mutable = CGPathCreateMutable();
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  int v10 = 0;
  v6 = [(CUIVectorGlyphPath *)self->_originPath path];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __36__CUIVectorGlyphMutator_cgPathFrom___block_invoke;
  block[3] = &unk_1E5A585A8;
  block[5] = Mutable;
  block[6] = var0;
  block[4] = v9;
  CGPathApplyWithBlock(v6, block);
  free(var0);
  CFAutorelease(Mutable);
  _Block_object_dispose(v9, 8);
  return Mutable;
}

- ($57208586A15A58339C904728178D1914)blackDeltas
{
  unint64_t numDeltas = self->_blackDeltas.numDeltas;
  deltaComponents = self->_blackDeltas.deltaComponents;
  result.double var1 = numDeltas;
  result.double var0 = deltaComponents;
  return result;
}

- ($57208586A15A58339C904728178D1914)applyDeltasWithScalars:(id)a3 andTransform:(id)a4
{
  $F24F406B2B787EFB06265DBA3D28CBD5 __B = a3;
  $F24F406B2B787EFB06265DBA3D28CBD5 v14 = a4;
  unint64_t numDeltas = self->_ultralightDeltas.numDeltas;
  vDSP_Length v6 = 2 * numDeltas;
  id v7 = &v13 - 2 * numDeltas;
  vDSP_vsmsmaD(self->_ultralightDeltas.deltaComponents, 1, &__B.var0, self->_blackDeltas.deltaComponents, 1, &__B.var1, v7, 1, 2 * numDeltas);
  uint64_t v8 = malloc_type_malloc(16 * numDeltas, 0x100004000313F17uLL);
  vDSP_vaddD(self->_originPoints.pointComponents, 1, v7, 1, (double *)v8, 1, v6);
  vDSP_vsmulD((const double *)v8, 1, &v14.var0, (double *)v8, 1, v6);
  double var1 = v14.var1;
  [(CUIVectorGlyphMutator *)self pointSize];
  double v13 = var1 * v10;
  vDSP_vsaddD((const double *)v8 + 1, 2, &v13, (double *)v8 + 1, 2, self->_originPoints.numPoints);
  unint64_t numPoints = self->_originPoints.numPoints;
  double v12 = (double *)v8;
  result.double var1 = numPoints;
  result.double var0 = v12;
  return result;
}

- (double)pointSize
{
  return self->_pointSize;
}

void __36__CUIVectorGlyphMutator_cgPathFrom___block_invoke(uint64_t a1, _DWORD *a2)
{
  switch(*a2)
  {
    case 0:
      int v3 = *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
      CGPathMoveToPoint(*(CGMutablePathRef *)(a1 + 40), 0, *(CGFloat *)(*(void *)(a1 + 48) + 8 * (2 * v3)), *(CGFloat *)(*(void *)(a1 + 48) + 8 * ((2 * v3) | 1u)));
      goto LABEL_4;
    case 1:
      int v4 = *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
      CGPathAddLineToPoint(*(CGMutablePathRef *)(a1 + 40), 0, *(CGFloat *)(*(void *)(a1 + 48) + 8 * (2 * v4)), *(CGFloat *)(*(void *)(a1 + 48) + 8 * ((2 * v4) | 1u)));
LABEL_4:
      uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
      int v6 = *(_DWORD *)(v5 + 24) + 1;
      goto LABEL_7;
    case 2:
      unsigned int v7 = 2 * *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
      CGPathAddQuadCurveToPoint(*(CGMutablePathRef *)(a1 + 40), 0, *(CGFloat *)(*(void *)(a1 + 48) + 8 * v7), *(CGFloat *)(*(void *)(a1 + 48) + 8 * (v7 | 1)), *(CGFloat *)(*(void *)(a1 + 48) + 8 * (v7 + 2)), *(CGFloat *)(*(void *)(a1 + 48) + 8 * (v7 + 3)));
      uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
      int v6 = *(_DWORD *)(v5 + 24) + 2;
      goto LABEL_7;
    case 3:
      uint64_t v8 = *(void *)(a1 + 48);
      unsigned int v9 = 2 * *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
      CGPathAddCurveToPoint(*(CGMutablePathRef *)(a1 + 40), 0, *(CGFloat *)(v8 + 8 * v9), *(CGFloat *)(v8 + 8 * (v9 | 1)), *(CGFloat *)(v8 + 8 * (v9 + 2)), *(CGFloat *)(v8 + 8 * (v9 + 3)), *(CGFloat *)(v8 + 8 * (v9 + 4)), *(CGFloat *)(v8 + 8 * (v9 + 5)));
      uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
      int v6 = *(_DWORD *)(v5 + 24) + 3;
LABEL_7:
      *(_DWORD *)(v5 + 24) = v6;
      break;
    case 4:
      double v10 = *(CGPath **)(a1 + 40);
      CGPathCloseSubpath(v10);
      break;
    default:
      return;
  }
}

char *__44__CUIVectorGlyphMutator_pointArrayFromPath___block_invoke(char *result, uint64_t a2)
{
  int v3 = result;
  switch(*(_DWORD *)a2)
  {
    case 0:
    case 1:
      int v4 = result + 40;
      uint64_t v5 = *(void *)(*(void *)(*((void *)result + 5) + 8) + 24);
      unint64_t v6 = *(void *)(*(void *)(*((void *)result + 6) + 8) + 24);
      if (v5 + 1 > v6)
      {
        $57208586A15A58339C904728178D1914 result = (char *)objc_msgSend(*((id *)result + 4), "realloc_cgfloat_array:withNewCount:", *(void *)(*(void *)(*((void *)result + 7) + 8) + 24), 2 * (*((void *)result + 8) + v6));
        uint64_t v7 = v3[8];
        *(void *)(*(void *)(v3[7] + 8) + 24) = result;
        *(void *)(*(void *)(v3[6] + 8) + 24) += v7;
        uint64_t v5 = *(void *)(*(void *)(v3[5] + 8) + 24);
      }
      uint64_t v8 = *(void **)(a2 + 8);
      *(void *)(*(void *)(*(void *)(v3[7] + 8) + 24) + 16 * v5) = *v8;
      *(void *)(*(void *)(*(void *)(v3[7] + 8) + 24) + 16 * *(void *)(*(void *)(v3[5] + 8) + 24) + 8) = v8[1];
      uint64_t v9 = 1;
      goto LABEL_11;
    case 2:
      int v4 = result + 40;
      uint64_t v10 = *(void *)(*(void *)(*((void *)result + 5) + 8) + 24);
      unint64_t v11 = *(void *)(*(void *)(*((void *)result + 6) + 8) + 24);
      if (v10 + 2 > v11)
      {
        $57208586A15A58339C904728178D1914 result = (char *)objc_msgSend(*((id *)result + 4), "realloc_cgfloat_array:withNewCount:", *(void *)(*(void *)(*((void *)result + 7) + 8) + 24), 2 * (*((void *)result + 8) + v11));
        uint64_t v12 = v3[8];
        *(void *)(*(void *)(v3[7] + 8) + 24) = result;
        *(void *)(*(void *)(v3[6] + 8) + 24) += v12;
        uint64_t v10 = *(void *)(*(void *)(v3[5] + 8) + 24);
      }
      double v13 = *(void **)(a2 + 8);
      *(void *)(*(void *)(*(void *)(v3[7] + 8) + 24) + 16 * v10) = *v13;
      *(void *)(*(void *)(*(void *)(v3[7] + 8) + 24) + 16 * *(void *)(*(void *)(v3[5] + 8) + 24) + 8) = v13[1];
      *(void *)(*(void *)(*(void *)(v3[7] + 8) + 24) + 16 * *(void *)(*(void *)(v3[5] + 8) + 24) + 16) = v13[2];
      *(void *)(*(void *)(*(void *)(v3[7] + 8) + 24) + 16 * *(void *)(*(void *)(v3[5] + 8) + 24) + 24) = v13[3];
      uint64_t v9 = 2;
      goto LABEL_11;
    case 3:
      int v4 = result + 40;
      uint64_t v14 = *(void *)(*(void *)(*((void *)result + 5) + 8) + 24);
      unint64_t v15 = *(void *)(*(void *)(*((void *)result + 6) + 8) + 24);
      if (v14 + 3 > v15)
      {
        $57208586A15A58339C904728178D1914 result = (char *)objc_msgSend(*((id *)result + 4), "realloc_cgfloat_array:withNewCount:", *(void *)(*(void *)(*((void *)result + 7) + 8) + 24), 2 * (*((void *)result + 8) + v15));
        uint64_t v16 = v3[8];
        *(void *)(*(void *)(v3[7] + 8) + 24) = result;
        *(void *)(*(void *)(v3[6] + 8) + 24) += v16;
        uint64_t v14 = *(void *)(*(void *)(v3[5] + 8) + 24);
      }
      id v17 = *(void **)(a2 + 8);
      *(void *)(*(void *)(*(void *)(v3[7] + 8) + 24) + 16 * v14) = *v17;
      *(void *)(*(void *)(*(void *)(v3[7] + 8) + 24) + 16 * *(void *)(*(void *)(v3[5] + 8) + 24) + 8) = v17[1];
      *(void *)(*(void *)(*(void *)(v3[7] + 8) + 24) + 16 * *(void *)(*(void *)(v3[5] + 8) + 24) + 16) = v17[2];
      *(void *)(*(void *)(*(void *)(v3[7] + 8) + 24) + 16 * *(void *)(*(void *)(v3[5] + 8) + 24) + 24) = v17[3];
      *(void *)(*(void *)(*(void *)(v3[7] + 8) + 24) + 16 * *(void *)(*(void *)(v3[5] + 8) + 24) + 32) = v17[4];
      *(void *)(*(void *)(*(void *)(v3[7] + 8) + 24) + 16 * *(void *)(*(void *)(v3[5] + 8) + 24) + 40) = v17[5];
      uint64_t v9 = 3;
LABEL_11:
      *(void *)(*(void *)(*(void *)v4 + 8) + 24) += v9;
      break;
    default:
      return result;
  }
  return result;
}

- (CUIVectorGlyphMutator)initWithPointSize:(double)a3 regular:(id)a4 ultralight:(id)a5 black:(id)a6
{
  v42.receiver = self;
  v42.super_class = (Class)CUIVectorGlyphMutator;
  uint64_t v10 = [(CUIVectorGlyphMutator *)&v42 init];
  if (v10)
  {
    v10->_originPath = (CUIVectorGlyphPath *)a4;
    v10->_ultralightPath = (CUIVectorGlyphPath *)a5;
    v10->_blackPath = (CUIVectorGlyphPath *)a6;
    [(CUIVectorGlyphMutator *)v10 setPointSize:a3];
    id v38 = a4;
    id v11 = +[CUIVectorGlyphMutator pointArrayFromPath:](CUIVectorGlyphMutator, "pointArrayFromPath:", [a4 path]);
    uint64_t v13 = v12;
    id v14 = a5;
    id v15 = +[CUIVectorGlyphMutator pointArrayFromPath:](CUIVectorGlyphMutator, "pointArrayFromPath:", [a5 path]);
    uint64_t v17 = v16;
    id v18 = a6;
    id v19 = +[CUIVectorGlyphMutator pointArrayFromPath:](CUIVectorGlyphMutator, "pointArrayFromPath:", [a6 path]);
    uint64_t v21 = v20;
    -[CUIVectorGlyphMutator setOriginPoints:](v10, "setOriginPoints:", v11, v13);
    id v22 = +[CUIVectorGlyphMutator deltaArrayFrom:to:](CUIVectorGlyphMutator, "deltaArrayFrom:to:", v10->_originPoints.pointComponents, v10->_originPoints.numPoints, v15, v17);
    -[CUIVectorGlyphMutator setUltralightDeltas:](v10, "setUltralightDeltas:", v22, v23);
    id v24 = +[CUIVectorGlyphMutator deltaArrayFrom:to:](CUIVectorGlyphMutator, "deltaArrayFrom:to:", v10->_originPoints.pointComponents, v10->_originPoints.numPoints, v19, v21);
    -[CUIVectorGlyphMutator setBlackDeltas:](v10, "setBlackDeltas:", v24, v25);
    free(v15);
    free(v19);
    unint64_t numPoints = v10->_originPoints.numPoints;
    if (numPoints != v10->_ultralightDeltas.numDeltas) {
      -[CUIVectorGlyphMutator initWithPointSize:regular:ultralight:black:]();
    }
    if (numPoints != v10->_blackDeltas.numDeltas) {
      -[CUIVectorGlyphMutator initWithPointSize:regular:ultralight:black:]();
    }
    if ([v38 clipStrokeKeyframes])
    {
      if ([v14 clipStrokeKeyframes])
      {
        if ([v18 clipStrokeKeyframes])
        {
          if (objc_msgSend(objc_msgSend(v38, "clipStrokeKeyframes"), "length"))
          {
            if (((unint64_t)objc_msgSend(objc_msgSend(v38, "clipStrokeKeyframes"), "length") & 0xF) == 0)
            {
              id v27 = objc_msgSend(objc_msgSend(v38, "clipStrokeKeyframes"), "length");
              if (v27 == objc_msgSend(objc_msgSend(v14, "clipStrokeKeyframes"), "length"))
              {
                id v28 = objc_msgSend(objc_msgSend(v38, "clipStrokeKeyframes"), "length");
                if (v28 == objc_msgSend(objc_msgSend(v18, "clipStrokeKeyframes"), "length"))
                {
                  if (objc_msgSend(objc_msgSend(v38, "clipStrokeKeyframes"), "length"))
                  {
                    unint64_t v29 = 0;
                    while (1)
                    {
                      uint64_t v40 = 0;
                      uint64_t v41 = 0;
                      uint64_t v39 = 0;
                      objc_msgSend(objc_msgSend(v38, "clipStrokeKeyframes"), "getBytes:range:", (char *)&v41 + 4, v29, 4);
                      objc_msgSend(objc_msgSend(v14, "clipStrokeKeyframes"), "getBytes:range:", &v41, v29, 4);
                      LODWORD(v30) = HIDWORD(v41);
                      if (*((float *)&v41 + 1) != *(float *)&v41) {
                        break;
                      }
                      objc_msgSend(objc_msgSend(v18, "clipStrokeKeyframes", v30), "getBytes:range:", &v41, v29, 4);
                      LODWORD(v31) = HIDWORD(v41);
                      if (*((float *)&v41 + 1) != *(float *)&v41) {
                        break;
                      }
                      unint64_t v32 = v29 + 4;
                      objc_msgSend(objc_msgSend(v38, "clipStrokeKeyframes", v31), "getBytes:range:", (char *)&v40 + 4, v32, 4);
                      objc_msgSend(objc_msgSend(v14, "clipStrokeKeyframes"), "getBytes:range:", &v40, v32, 4);
                      LODWORD(v33) = HIDWORD(v40);
                      if (*((float *)&v40 + 1) != *(float *)&v40) {
                        break;
                      }
                      objc_msgSend(objc_msgSend(v18, "clipStrokeKeyframes", v33), "getBytes:range:", &v40, v32, 4);
                      LODWORD(v34) = HIDWORD(v40);
                      if (*((float *)&v40 + 1) != *(float *)&v40) {
                        break;
                      }
                      unint64_t v35 = v32 + 4;
                      objc_msgSend(objc_msgSend(v38, "clipStrokeKeyframes", v34), "getBytes:range:", (char *)&v39 + 4, v35, 4);
                      objc_msgSend(objc_msgSend(v14, "clipStrokeKeyframes"), "getBytes:range:", &v39, v35, 4);
                      if (floorf(*((float *)&v39 + 1)) != floorf(*(float *)&v39)) {
                        break;
                      }
                      objc_msgSend(objc_msgSend(v18, "clipStrokeKeyframes"), "getBytes:range:", &v39, v35, 4);
                      if (floorf(*((float *)&v39 + 1)) != floorf(*(float *)&v39)) {
                        break;
                      }
                      unint64_t v36 = v35 + 4;
                      objc_msgSend(objc_msgSend(v38, "clipStrokeKeyframes"), "getBytes:range:", (char *)&v39 + 4, v36, 4);
                      objc_msgSend(objc_msgSend(v14, "clipStrokeKeyframes"), "getBytes:range:", &v39, v36, 4);
                      if (floorf(*((float *)&v39 + 1)) != floorf(*(float *)&v39)) {
                        break;
                      }
                      objc_msgSend(objc_msgSend(v18, "clipStrokeKeyframes"), "getBytes:range:", &v39, v36, 4);
                      if (floorf(*((float *)&v39 + 1)) != floorf(*(float *)&v39)) {
                        break;
                      }
                      unint64_t v29 = v36 + 4;
                      if (v29 >= (unint64_t)objc_msgSend(objc_msgSend(v38, "clipStrokeKeyframes"), "length")) {
                        goto LABEL_22;
                      }
                    }
                  }
                  else
                  {
LABEL_22:
                    v10->_originClipStrokeKeyframes = (NSData *)[v38 clipStrokeKeyframes];
                    v10->_ultralightClipStrokeKeyframes = (NSData *)[v14 clipStrokeKeyframes];
                    v10->_blackClipStrokeKeyframes = (NSData *)[v18 clipStrokeKeyframes];
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return v10;
}

+ ($57208586A15A58339C904728178D1914)pointArrayFromPath:(CGPath *)a3
{
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  id v22 = 0;
  id v22 = malloc_type_calloc(0x64uLL, 8uLL, 0x100004000313F17uLL);
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 50;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __44__CUIVectorGlyphMutator_pointArrayFromPath___block_invoke;
  block[3] = &unk_1E5A58580;
  block[6] = &v15;
  void block[7] = &v19;
  block[4] = a1;
  block[5] = &v11;
  block[8] = 50;
  CGPathApplyWithBlock(a3, block);
  unint64_t v5 = v16[3];
  uint64_t v6 = v12[3];
  uint64_t v7 = (double *)v20[3];
  if (v5 != v6)
  {
    uint64_t v7 = (double *)objc_msgSend(a1, "realloc_cgfloat_array:withNewCount:", v20[3], 2 * v6);
    v20[3] = (uint64_t)v7;
    unint64_t v5 = v12[3];
  }
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);
  uint64_t v8 = v7;
  unint64_t v9 = v5;
  result.double var1 = v9;
  result.double var0 = v8;
  return result;
}

+ (double)realloc_cgfloat_array:(double *)a3 withNewCount:(unint64_t)a4
{
  $57208586A15A58339C904728178D1914 result = (double *)malloc_type_realloc(a3, 8 * a4, 0x100004000313F17uLL);
  if (!result)
  {
    free(a3);
    +[NSException raise:@"FailedRealloc" format:@"Requested size was not available"];
    return a3;
  }
  return result;
}

+ ($57208586A15A58339C904728178D1914)deltaArrayFrom:(id)a3 to:(id)a4
{
  if (a3.var1 != a4.var1) {
    +[CUIVectorGlyphMutator deltaArrayFrom:to:]();
  }
  double var0 = a4.var0;
  unint64_t var1 = a3.var1;
  uint64_t v6 = a3.var0;
  vDSP_Length v7 = 2 * a3.var1;
  uint64_t v8 = (double *)malloc_type_malloc(16 * a3.var1, 0x100004000313F17uLL);
  vDSP_vsubD(v6, 1, var0, 1, v8, 1, v7);
  unint64_t v9 = v8;
  unint64_t v10 = var1;
  result.unint64_t var1 = v10;
  result.double var0 = v9;
  return result;
}

- (void)setUltralightDeltas:(id)a3
{
  self->_ultralightDeltas = ($73760B565FA833B9811E339F2D9A23FA)a3;
}

- (void)setPointSize:(double)a3
{
  self->_pointSize = a3;
}

- (void)setOriginPoints:(id)a3
{
  self->_originPoints = ($F954F316BB7F473710547896A635F93A)a3;
}

- (void)setBlackDeltas:(id)a3
{
  self->_blackDeltas = ($73760B565FA833B9811E339F2D9A23FA)a3;
}

id __53__CUIVectorGlyphMutator_pathForScalars_andTransform___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "clipStrokeKeyframesForPath:scalars:", a2, *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (id)clipStrokeKeyframesForPath:(id)a3 scalars:(id)a4
{
  if (!self->_originClipStrokeKeyframes) {
    return 0;
  }
  double var1 = a4.var1;
  double var0 = a4.var0;
  id v6 = a3;
  if (a3)
  {
    [a3 lengthData];
    uint64_t v8 = *((void *)&v107 + 1);
  }
  else
  {
    uint64_t v8 = 0;
    long long v108 = 0u;
    long long v109 = 0u;
    long long v107 = 0u;
  }
  originPath = self->_originPath;
  if (originPath)
  {
    [(CUIVectorGlyphPath *)originPath lengthData];
    uint64_t v10 = *((void *)&v104 + 1);
  }
  else
  {
    uint64_t v10 = 0;
    long long v105 = 0u;
    long long v106 = 0u;
    long long v104 = 0u;
  }
  ultralightPath = self->_ultralightPath;
  if (ultralightPath)
  {
    [(CUIVectorGlyphPath *)ultralightPath lengthData];
    uint64_t v12 = *((void *)&v101 + 1);
  }
  else
  {
    uint64_t v12 = 0;
    long long v102 = 0u;
    long long v103 = 0u;
    long long v101 = 0u;
  }
  blackPath = self->_blackPath;
  if (blackPath)
  {
    [(CUIVectorGlyphPath *)blackPath lengthData];
    BOOL v14 = *((void *)&v98 + 1) != 0;
  }
  else
  {
    BOOL v14 = 0;
    long long v99 = 0u;
    long long v100 = 0u;
    long long v98 = 0u;
  }
  uint64_t v15 = 0;
  if (!v8 || !v10 || !v12 || !v14) {
    return v15;
  }
  if (v6)
  {
    [v6 lengthData];
    uint64_t v16 = v96;
  }
  else
  {
    uint64_t v16 = 0;
    long long v96 = 0u;
    long long v97 = 0u;
    long long v95 = 0u;
  }
  uint64_t v17 = self->_originPath;
  if (v17)
  {
    [(CUIVectorGlyphPath *)v17 lengthData];
    uint64_t v18 = v93;
  }
  else
  {
    uint64_t v18 = 0;
    long long v93 = 0u;
    long long v94 = 0u;
    long long v92 = 0u;
  }
  uint64_t v19 = self->_ultralightPath;
  if (v19)
  {
    [(CUIVectorGlyphPath *)v19 lengthData];
    uint64_t v20 = v90;
  }
  else
  {
    uint64_t v20 = 0;
    long long v90 = 0u;
    long long v91 = 0u;
    long long v89 = 0u;
  }
  uint64_t v21 = self->_blackPath;
  if (!v21) {
    return 0;
  }
  [(CUIVectorGlyphPath *)v21 lengthData];
  uint64_t v15 = 0;
  if (!v16 || !v18 || !v20 || !v88) {
    return v15;
  }
  if (v6)
  {
    [v6 lengthData];
    id v6 = (id)*((void *)&v86 + 1);
  }
  else
  {
    long long v86 = 0u;
    long long v87 = 0u;
    long long v85 = 0u;
  }
  id v22 = self->_originPath;
  if (v22)
  {
    [(CUIVectorGlyphPath *)v22 lengthData];
    uint64_t v23 = *((void *)&v83 + 1);
  }
  else
  {
    uint64_t v23 = 0;
    long long v83 = 0u;
    long long v84 = 0u;
    long long v82 = 0u;
  }
  id v24 = self->_ultralightPath;
  if (v24)
  {
    [(CUIVectorGlyphPath *)v24 lengthData];
    uint64_t v25 = *((void *)&v80 + 1);
  }
  else
  {
    uint64_t v25 = 0;
    long long v80 = 0u;
    long long v81 = 0u;
    long long v79 = 0u;
  }
  double v26 = self->_blackPath;
  if (!v26) {
    return 0;
  }
  [(CUIVectorGlyphPath *)v26 lengthData];
  uint64_t v15 = 0;
  if (v6)
  {
    if (v23)
    {
      if (v25)
      {
        if (v78[4])
        {
          uint64_t v15 = +[NSMutableData dataWithCapacity:[(NSData *)self->_originClipStrokeKeyframes length]];
          if ([(NSData *)self->_originClipStrokeKeyframes length])
          {
            unint64_t v27 = 0;
            while (1)
            {
              uint64_t v77 = 0;
              v78[0] = 0;
              uint64_t v76 = 0;
              -[NSData getBytes:range:](self->_originClipStrokeKeyframes, "getBytes:range:", (char *)v78 + 4, v27, 4);
              [(NSMutableData *)v15 appendBytes:(char *)v78 + 4 length:4];
              -[NSData getBytes:range:](self->_originClipStrokeKeyframes, "getBytes:range:", v78, v27 + 4, 4);
              [(NSMutableData *)v15 appendBytes:v78 length:4];
              unint64_t v28 = v27 + 8;
              -[NSData getBytes:range:](self->_originClipStrokeKeyframes, "getBytes:range:", (char *)&v77 + 4, v27 + 8, 4);
              unint64_t v29 = v27 + 12;
              -[NSData getBytes:range:](self->_originClipStrokeKeyframes, "getBytes:range:", &v77, v29, 4);
              uint64_t v31 = v77;
              uint64_t v74 = 0;
              uint64_t v75 = 0;
              uint64_t v72 = 0;
              uint64_t v73 = 0;
              uint64_t v70 = 0;
              uint64_t v71 = 0;
              float v68 = -1.0;
              float v69 = -1.0;
              float v66 = -1.0;
              float v67 = -1.0;
              float v64 = -1.0;
              float v65 = -1.0;
              unint64_t v32 = self->_originPath;
              if (v32)
              {
                [(CUIVectorGlyphPath *)v32 lengthData];
              }
              else
              {
                HIDWORD(v33) = 0;
                long long v62 = 0u;
                long long v63 = 0u;
                long long v61 = 0u;
              }
              unint64_t v34 = vcvtms_u32_f32(*((float *)&v31 + 1));
              LODWORD(v33) = HIDWORD(v31);
              LODWORD(v30) = v31;
              [(CUIVectorGlyphMutator *)self convertDistance0:&v75 distance1:&v69 elementIndex0Out:&v74 distance0Out:&v68 elementIndex1Out:v34 distance1Out:&v61 forSubpath:v33 data:v30];
              if (v69 == -1.0) {
                break;
              }
              *(float *)&double v35 = v68;
              if (v68 == -1.0) {
                break;
              }
              -[NSData getBytes:range:](self->_ultralightClipStrokeKeyframes, "getBytes:range:", (char *)&v76 + 4, v28, 4, v35);
              -[NSData getBytes:range:](self->_ultralightClipStrokeKeyframes, "getBytes:range:", &v76, v29, 4);
              uint64_t v37 = v76;
              id v38 = self->_ultralightPath;
              if (v38)
              {
                [(CUIVectorGlyphPath *)v38 lengthData];
              }
              else
              {
                HIDWORD(v39) = 0;
                long long v59 = 0u;
                long long v60 = 0u;
                long long v58 = 0u;
              }
              LODWORD(v39) = HIDWORD(v37);
              LODWORD(v36) = v37;
              [(CUIVectorGlyphMutator *)self convertDistance0:&v73 distance1:&v67 elementIndex0Out:&v72 distance0Out:&v66 elementIndex1Out:v34 distance1Out:&v58 forSubpath:v39 data:v36];
              if (v67 == -1.0) {
                break;
              }
              *(float *)&double v40 = v66;
              if (v66 == -1.0) {
                break;
              }
              -[NSData getBytes:range:](self->_blackClipStrokeKeyframes, "getBytes:range:", (char *)&v76 + 4, v28, 4, v40);
              -[NSData getBytes:range:](self->_blackClipStrokeKeyframes, "getBytes:range:", &v76, v29, 4);
              uint64_t v42 = v76;
              v43 = self->_blackPath;
              if (v43)
              {
                [(CUIVectorGlyphPath *)v43 lengthData];
              }
              else
              {
                HIDWORD(v44) = 0;
                long long v56 = 0u;
                long long v57 = 0u;
                long long v55 = 0u;
              }
              LODWORD(v44) = HIDWORD(v42);
              LODWORD(v41) = v42;
              [(CUIVectorGlyphMutator *)self convertDistance0:&v71 distance1:&v65 elementIndex0Out:&v70 distance0Out:&v64 elementIndex1Out:v34 distance1Out:&v55 forSubpath:v44 data:v41];
              if (v65 == -1.0 || v64 == -1.0) {
                break;
              }
              float v45 = *(float *)(v8 + 4 * v34);
              float v46 = fabsf(v45);
              float v47 = 0.0;
              if (v46 >= 0.00000011921)
              {
                float v48 = *(float *)(v16 + 8 * v75) + (float)(*(float *)(v16 + 8 * v75 + 4) * v69);
                float v49 = v48
                    + var0
                    * (float)((float)(*(float *)(v16 + 8 * v73) + (float)(*(float *)(v16 + 8 * v73 + 4) * v67)) - v48)
                    + var1
                    * (float)((float)(*(float *)(v16 + 8 * v71) + (float)(*(float *)(v16 + 8 * v71 + 4) * v65)) - v48);
                float v47 = v49 / v45;
              }
              float v50 = *(float *)(v16 + 8 * v74) + (float)(*(float *)(v16 + 8 * v74 + 4) * v68);
              float v51 = v50
                  + var0
                  * (float)((float)(*(float *)(v16 + 8 * v72) + (float)(*(float *)(v16 + 8 * v72 + 4) * v66)) - v50)
                  + var1
                  * (float)((float)(*(float *)(v16 + 8 * v70) + (float)(*(float *)(v16 + 8 * v70 + 4) * v64)) - v50);
              float v52 = v51 / v45;
              if (v46 >= 0.00000011921) {
                float v53 = v52;
              }
              else {
                float v53 = 0.0;
              }
              *(float *)&uint64_t v77 = v53 + (float)v34;
              *((float *)&v77 + 1) = v47 + (float)v34;
              -[NSMutableData appendBytes:length:](v15, "appendBytes:length:", (char *)&v77 + 4, 4, v55, v56, v57, v58, v59, v60, v61, v62, v63);
              [(NSMutableData *)v15 appendBytes:&v77 length:4];
              unint64_t v27 = v29 + 4;
              if (v27 >= [(NSData *)self->_originClipStrokeKeyframes length]) {
                return v15;
              }
            }
            return 0;
          }
        }
      }
    }
  }
  return v15;
}

- (void)convertDistance0:(float)a3 distance1:(float)a4 elementIndex0Out:(unint64_t *)a5 distance0Out:(float *)a6 elementIndex1Out:(unint64_t *)a7 distance1Out:(float *)a8 forSubpath:(unint64_t)a9 data:(CUIVectorGlyphPathLengthData *)a10
{
  unint64_t numElements = a10->numElements;
  if (numElements)
  {
    unint64_t v11 = 0;
    double v12 = a10->subpathLengths[a9];
    float v13 = (a3 - floor(a3)) * v12;
    float v14 = (a4 - floor(a4)) * v12;
    elementToSubpath = a10->elementToSubpath;
    do
    {
      unint64_t v16 = elementToSubpath[v11];
      if (v16 >= a9)
      {
        uint64_t v17 = &a10->elementLengths[v11];
        float var0 = v17->var0;
        float var1 = v17->var1;
        float v20 = v17->var0 + var1;
        BOOL v21 = *a6 != -1.0 || v20 <= v13;
        float v22 = fabsf(var1);
        if (!v21)
        {
          float v23 = 0.0;
          if (v22 >= 0.00000011921) {
            float v23 = (float)(v13 - var0) / var1;
          }
          *a5 = v11;
          *a6 = v23;
        }
        if (*a8 == -1.0 && v20 > v14)
        {
          float v25 = 0.0;
          if (v22 >= 0.00000011921) {
            float v25 = (float)(v14 - var0) / var1;
          }
          *a7 = v11;
          *a8 = v25;
        }
        if (v16 > a9) {
          return;
        }
        unint64_t numElements = a10->numElements;
      }
      ++v11;
    }
    while (v11 < numElements);
  }
}

id __43__CUIVectorGlyphMutator__interpolationData__block_invoke()
{
  id v0 = objc_alloc((Class)NSDictionary);
  v14[0] = +[NSNumber numberWithDouble:0.2];
  v12[0] = +[NSNumber numberWithDouble:-0.8];
  v13[0] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", 0.0115, 0.0221);
  v12[1] = +[NSNumber numberWithDouble:-0.6];
  v13[1] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", 0.0, 0.0661);
  v12[2] = +[NSNumber numberWithDouble:-0.4];
  v13[2] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", 0.0, 0.435);
  v12[3] = +[NSNumber numberWithDouble:0.0];
  v13[3] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", 0.0, 0.6924);
  v12[4] = +[NSNumber numberWithDouble:0.23];
  v13[4] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", 0.0, 0.8145);
  v12[5] = +[NSNumber numberWithDouble:0.3];
  v13[5] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", 0.0, 0.9057);
  v12[6] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v13[6] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", -0.006, 0.9609);
  v12[7] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v13[7] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", 0.0, 1.1061);
  v12[8] = +[NSNumber numberWithDouble:0.62];
  v13[8] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", -0.1324, 1.132);
  v15[0] = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:9];
  v14[1] = +[NSNumber numberWithDouble:0.5];
  v10[0] = +[NSNumber numberWithDouble:-0.8];
  v11[0] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", 0.6338, 0.0);
  v10[1] = +[NSNumber numberWithDouble:-0.6];
  v11[1] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", 0.2328, 0.0);
  v10[2] = +[NSNumber numberWithDouble:-0.4];
  v11[2] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", -0.0528, 0.2287);
  v10[3] = +[NSNumber numberWithDouble:0.0];
  v11[3] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", -0.0715, 0.4969);
  v10[4] = +[NSNumber numberWithDouble:0.23];
  v11[4] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", -0.0715, 0.6859);
  v10[5] = +[NSNumber numberWithDouble:0.3];
  v11[5] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", -0.0715, 0.7909);
  v10[6] = +[NSNumber numberWithDouble:0.4];
  v11[6] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", -0.0739, 0.8937);
  void v10[7] = +[NSNumber numberWithDouble:0.56];
  v11[7] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", -0.076, 1.08);
  v10[8] = +[NSNumber numberWithDouble:0.62];
  v11[8] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", -0.1325, 1.1847);
  v15[1] = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:9];
  v14[2] = +[NSNumber numberWithDouble:1.0];
  v8[0] = +[NSNumber numberWithDouble:-0.8];
  v9[0] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", 1.0, 0.0);
  v8[1] = +[NSNumber numberWithDouble:-0.6];
  v9[1] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", 0.774193548, 0.0);
  v8[2] = +[NSNumber numberWithDouble:-0.4];
  v9[2] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", 0.333333333, 0.0);
  v8[3] = +[NSNumber numberWithDouble:0.0];
  void v9[3] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", 0.0, 0.0);
  v8[4] = +[NSNumber numberWithDouble:0.23];
  v9[4] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", 0.0, 0.18);
  v8[5] = +[NSNumber numberWithDouble:0.3];
  v9[5] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", 0.0, 0.318);
  v8[6] = +[NSNumber numberWithDouble:0.4];
  v9[6] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", 0.0, 0.5);
  v8[7] = +[NSNumber numberWithDouble:0.56];
  v9[7] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", 0.0, 0.763978947);
  v8[8] = +[NSNumber numberWithDouble:0.62];
  v9[8] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", 0.0, 1.0);
  v15[2] = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:9];
  v14[3] = +[NSNumber numberWithDouble:1.276];
  v6[0] = +[NSNumber numberWithDouble:-0.8];
  v7[0] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", 1.06801437, 0.0);
  v6[1] = +[NSNumber numberWithDouble:-0.6];
  v7[1] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", 0.86796777, 0.0);
  v6[2] = +[NSNumber numberWithDouble:-0.4];
  v7[2] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", 0.477400592, 0.0);
  v6[3] = +[NSNumber numberWithDouble:0.0];
  v7[3] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", 0.1820937, 0.0);
  v6[4] = +[NSNumber numberWithDouble:0.23];
  v7[4] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", 0.148437509, 0.164952978);
  v6[5] = +[NSNumber numberWithDouble:0.3];
  v7[5] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", 0.122634428, 0.291416928);
  v6[6] = +[NSNumber numberWithDouble:0.4];
  v7[6] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", 0.0886042787, 0.458202717);
  v6[7] = +[NSNumber numberWithDouble:0.56];
  v7[7] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", 0.0392418641, 0.700133751);
  v6[8] = +[NSNumber numberWithDouble:0.62];
  v7[8] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", -0.00488514296, 0.916405434);
  v15[3] = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:9];
  v14[4] = +[NSNumber numberWithDouble:1.647];
  v4[0] = +[NSNumber numberWithDouble:-0.8];
  v5[0] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", 1.1353466, 0.0);
  v4[1] = +[NSNumber numberWithDouble:-0.6];
  v5[1] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", 0.962479273, 0.0);
  v4[2] = +[NSNumber numberWithDouble:-0.4];
  v5[2] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", 0.624976402, 0.0);
  v4[3] = +[NSNumber numberWithDouble:0.0];
  v5[3] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", 0.369791304, 0.0);
  v4[4] = +[NSNumber numberWithDouble:0.23];
  v5[4] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", 0.300349522, 0.130728598);
  v4[5] = +[NSNumber numberWithDouble:0.3];
  v5[5] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", 0.247110822, 0.230953856);
  v4[6] = +[NSNumber numberWithDouble:0.4];
  v5[6] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", 0.176897463, 0.363134994);
  v4[7] = +[NSNumber numberWithDouble:0.56];
  v5[7] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", 0.0750495154, 0.554870272);
  v4[8] = +[NSNumber numberWithDouble:0.62];
  v5[8] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", 0.0159963775, 0.726269989);
  v15[4] = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:9];
  v14[5] = +[NSNumber numberWithDouble:2.0];
  v2[0] = +[NSNumber numberWithDouble:-0.8];
  v3[0] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", 1.1162, -0.0495);
  v2[1] = +[NSNumber numberWithDouble:-0.6];
  v3[1] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", 1.0524, -0.0104);
  v2[2] = +[NSNumber numberWithDouble:-0.4];
  v3[2] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", 0.7878, 0.0);
  v2[3] = +[NSNumber numberWithDouble:0.0];
  v3[3] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", 0.5464, 0.0);
  v2[4] = +[NSNumber numberWithDouble:0.23];
  v3[4] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", 0.4641, 0.1072);
  v2[5] = +[NSNumber numberWithDouble:0.3];
  v3[5] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", 0.3875, 0.2173);
  v2[6] = +[NSNumber numberWithDouble:0.4];
  v3[6] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", 0.2925, 0.352);
  v2[7] = +[NSNumber numberWithDouble:0.56];
  v3[7] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", 0.1862, 0.5134);
  v2[8] = +[NSNumber numberWithDouble:0.62];
  v3[8] = +[NSValue valueWithDeltaScalars:](NSValue, "valueWithDeltaScalars:", 0.1176, 0.707);
  v15[5] = +[NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:9];
  id result = objc_msgSend(v0, "initWithDictionary:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, v14, 6));
  _interpolationData_interpolationData = (uint64_t)result;
  return result;
}

- ($57208586A15A58339C904728178D1914)applyDeltasWithScalars:(id)a3
{
  int v3 = (double *)-[CUIVectorGlyphMutator applyDeltasWithScalars:andTransform:](self, "applyDeltasWithScalars:andTransform:", a3.var0, a3.var1, 1.0, 0.0);
  result.float var1 = v4;
  result.float var0 = v3;
  return result;
}

- (id)pathForScalars:(id)a3
{
  return -[CUIVectorGlyphMutator pathForScalars:andTransform:](self, "pathForScalars:andTransform:", a3.var0, a3.var1, 1.0, 0.0);
}

+ ($F24F406B2B787EFB06265DBA3D28CBD5)scalarsForGlyphWeight:(int64_t)a3 glyphSize:(int64_t)a4
{
  [a1 transformForGlyphSize:a4];
  switch(a3)
  {
    case 0:
    case 4:
      uint64_t v8 = &_CUIVectorGlyphContinuousWeightRegular;
      goto LABEL_11;
    case 1:
      uint64_t v8 = &_CUIVectorGlyphContinuousWeightUltralight;
      goto LABEL_11;
    case 2:
      uint64_t v8 = &_CUIVectorGlyphContinuousWeightThin;
      goto LABEL_11;
    case 3:
      uint64_t v8 = &_CUIVectorGlyphContinuousWeightLight;
      goto LABEL_11;
    case 5:
      uint64_t v8 = &_CUIVectorGlyphContinuousWeightMedium;
      goto LABEL_11;
    case 6:
      uint64_t v8 = &_CUIVectorGlyphContinuousWeightSemibold;
      goto LABEL_11;
    case 7:
      uint64_t v8 = &_CUIVectorGlyphContinuousWeightBold;
      goto LABEL_11;
    case 8:
      uint64_t v8 = &_CUIVectorGlyphContinuousWeightHeavy;
      goto LABEL_11;
    case 9:
      uint64_t v8 = &_CUIVectorGlyphContinuousWeightBlack;
LABEL_11:
      double v4 = *(double *)v8;
      break;
    default:
      break;
  }
  id v9 = objc_msgSend(objc_msgSend(a1, "_interpolationData"), "objectForKeyedSubscript:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v7));
  if (!v9) {
    +[CUIVectorGlyphMutator scalarsForGlyphWeight:glyphSize:]();
  }
  [a1 _scalarsForGlyphContinuousWeight:v9 inDictionary:1 shouldClamp:v4];
  result.float var1 = v11;
  result.float var0 = v10;
  return result;
}

- (CUIVectorGlyphPath)originPath
{
  return self->_originPath;
}

- (void)setOriginPath:(id)a3
{
}

- (CUIVectorGlyphPath)ultralightPath
{
  return self->_ultralightPath;
}

- (void)setUltralightPath:(id)a3
{
}

- (CUIVectorGlyphPath)blackPath
{
  return self->_blackPath;
}

- (void)setBlackPath:(id)a3
{
}

- (NSData)originClipStrokeKeyframes
{
  return self->_originClipStrokeKeyframes;
}

- (void)setOriginClipStrokeKeyframes:(id)a3
{
}

- (NSData)ultralightClipStrokeKeyframes
{
  return self->_ultralightClipStrokeKeyframes;
}

- (void)setUltralightClipStrokeKeyframes:(id)a3
{
}

- (NSData)blackClipStrokeKeyframes
{
  return self->_blackClipStrokeKeyframes;
}

- (void)setBlackClipStrokeKeyframes:(id)a3
{
}

- (void)initWithPointSize:regular:ultralight:black:.cold.1()
{
  __assert_rtn("-[CUIVectorGlyphMutator initWithPointSize:regular:ultralight:black:]", "CUIVectorGlyphMutator.m", 114, "_originPoints.numPoints == _blackDeltas.numDeltas");
}

- (void)initWithPointSize:regular:ultralight:black:.cold.2()
{
  __assert_rtn("-[CUIVectorGlyphMutator initWithPointSize:regular:ultralight:black:]", "CUIVectorGlyphMutator.m", 113, "_originPoints.numPoints == _ultralightDeltas.numDeltas");
}

+ (void)deltaArrayFrom:to:.cold.1()
{
  __assert_rtn("+[CUIVectorGlyphMutator deltaArrayFrom:to:]", "CUIVectorGlyphMutator.m", 557, "start.numPoints == end.numPoints");
}

+ (void)_scalarsForGlyphContinuousWeight:inDictionary:shouldClamp:.cold.1()
{
}

+ (void)_scalarsForGlyphContinuousWeight:inDictionary:shouldClamp:.cold.2()
{
}

+ (void)_scalarsForGlyphContinuousWeight:inDictionary:shouldClamp:.cold.3()
{
}

+ (void)_scalarsForGlyphContinuousWeight:inDictionary:shouldClamp:.cold.4()
{
}

+ (void)scalarsForGlyphContinuousWeight:glyphContinuousSize:.cold.1()
{
}

+ (void)scalarsForGlyphContinuousWeight:glyphContinuousSize:.cold.2()
{
}

+ (void)scalarsForGlyphWeight:glyphSize:.cold.1()
{
}

@end