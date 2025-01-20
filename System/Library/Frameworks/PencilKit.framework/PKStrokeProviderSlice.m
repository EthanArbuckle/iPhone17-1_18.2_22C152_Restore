@interface PKStrokeProviderSlice
- (BOOL)isEqual:(id)a3;
- (BOOL)isFinished;
- (CGPoint)_interpolatedPointForSplineSegment:(int64_t)a3 t:(double)a4 transform:(CGAffineTransform *)a5;
- (CGPoint)_splineControlPoint:(int64_t)a3 transform:(CGAffineTransform *)a4;
- (CGRect)bounds;
- (CHEncodedStrokeIdentifier)encodedStrokeIdentifier;
- (CHStrokeIdentifier)strokeIdentifier;
- (NSString)description;
- (PKStroke)stroke;
- (PKStrokeProviderSlice)initWithIdentifier:(id)a3;
- (PKStrokeProviderSlice)initWithStroke:(id)a3 tStart:(double)a4 tEnd:(double)a5;
- (PKStrokeProviderSliceIdentifier)identifier;
- (double)_interpolatedTimeForSplineSegment:(int64_t)a3 t:(double)a4;
- (double)_lengthOfSplineSegment:(unint64_t)a3 transform:(CGAffineTransform *)a4;
- (double)_strokeLength;
- (double)endTimestamp;
- (double)startTimestamp;
- (int64_t)_firstPointIndex;
- (int64_t)_lastPointIndex;
- (int64_t)compareTo:(id)a3;
- (unint64_t)hash;
- (unint64_t)strokeAttributes;
- (void)enumeratePointsWithDataStep:(double)a3 usingBlock:(id)a4;
- (void)enumeratePointsWithDistanceStep:(double)a3 usingBlock:(id)a4;
- (void)enumeratePointsWithTimestep:(double)a3 usingBlock:(id)a4;
@end

@implementation PKStrokeProviderSlice

- (PKStrokeProviderSlice)initWithStroke:(id)a3 tStart:(double)a4 tEnd:(double)a5
{
  id v9 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKStrokeProviderSlice;
  v10 = [(PKStrokeProviderSlice *)&v15 init];
  CGSize v11 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
  v10->_bounds.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
  v10->_bounds.size = v11;
  objc_storeStrong((id *)&v10->_stroke, a3);
  uint64_t v12 = [v9 sliceIdentifierForTStart:a4 tEnd:a5];
  identifier = v10->_identifier;
  v10->_identifier = (PKStrokeProviderSliceIdentifier *)v12;

  return v10;
}

- (PKStrokeProviderSlice)initWithIdentifier:(id)a3
{
  v4 = (PKStrokeProviderSliceIdentifier *)a3;
  v9.receiver = self;
  v9.super_class = (Class)PKStrokeProviderSlice;
  v5 = [(PKStrokeProviderSlice *)&v9 init];
  CGSize v6 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
  v5->_bounds.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
  v5->_bounds.size = v6;
  identifier = v5->_identifier;
  v5->_identifier = v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(PKStrokeProviderSlice *)self identifier];
    CGSize v6 = [v4 identifier];
    char v7 = [v5 isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(PKStrokeProviderSlice *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (CHStrokeIdentifier)strokeIdentifier
{
  return (CHStrokeIdentifier *)self->_identifier;
}

- (BOOL)isFinished
{
  return ![(PKStroke *)self->_stroke _isInProgressScribbleStroke];
}

- (CHEncodedStrokeIdentifier)encodedStrokeIdentifier
{
  v2 = self;
  objc_sync_enter(v2);
  encodedStrokeIdentifier = v2->_encodedStrokeIdentifier;
  if (!encodedStrokeIdentifier)
  {
    id v4 = (void *)MEMORY[0x1E4F28DB0];
    v5 = [(PKStrokeProviderSlice *)v2 strokeIdentifier];
    id v12 = 0;
    CGSize v6 = [v4 archivedDataWithRootObject:v5 requiringSecureCoding:1 error:&v12];
    id v7 = v12;

    if (v6)
    {
      uint64_t v8 = [objc_alloc(MEMORY[0x1E4F5C048]) initWithData:v6];
      objc_super v9 = v2->_encodedStrokeIdentifier;
      v2->_encodedStrokeIdentifier = (CHEncodedStrokeIdentifier *)v8;
    }
    encodedStrokeIdentifier = v2->_encodedStrokeIdentifier;
  }
  v10 = encodedStrokeIdentifier;
  objc_sync_exit(v2);

  return v10;
}

- (CGRect)bounds
{
  v2 = self;
  objc_sync_enter(v2);
  if (CGRectIsNull(v2->_bounds)
    && ([(PKStrokeProviderSlice *)v2 stroke],
        unint64_t v3 = objc_claimAutoreleasedReturnValue(),
        uint64_t v4 = [v3 _pointsCount],
        v3,
        v4))
  {
    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x2020000000;
    uint64_t v29 = 0x7FEFFFFFFFFFFFFFLL;
    uint64_t v22 = 0;
    v23 = (double *)&v22;
    uint64_t v24 = 0x2020000000;
    unint64_t v25 = 0xFFEFFFFFFFFFFFFFLL;
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x2020000000;
    uint64_t v21 = 0x7FEFFFFFFFFFFFFFLL;
    uint64_t v14 = 0;
    objc_super v15 = (double *)&v14;
    uint64_t v16 = 0x2020000000;
    unint64_t v17 = 0xFFEFFFFFFFFFFFFFLL;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __31__PKStrokeProviderSlice_bounds__block_invoke;
    v13[3] = &unk_1E64C6170;
    v13[4] = &v26;
    v13[5] = &v22;
    v13[6] = &v18;
    v13[7] = &v14;
    [(PKStrokeProviderSlice *)v2 enumeratePointsWithDataStep:v13 usingBlock:0.25];
    *(void *)&v30.origin.CGFloat x = v27[3];
    *(void *)&v30.origin.CGFloat y = v19[3];
    v30.size.CGFloat width = v23[3] - v30.origin.x;
    v30.size.CGFloat height = v15[3] - v30.origin.y;
    CGRect v31 = CGRectInset(v30, -1.0, -1.0);
    CGRect v32 = CGRectIntegral(v31);
    CGFloat x = v32.origin.x;
    CGFloat y = v32.origin.y;
    CGFloat width = v32.size.width;
    CGFloat height = v32.size.height;
    v2->_bounds = v32;
    _Block_object_dispose(&v14, 8);
    _Block_object_dispose(&v18, 8);
    _Block_object_dispose(&v22, 8);
    _Block_object_dispose(&v26, 8);
  }
  else
  {
    CGFloat x = v2->_bounds.origin.x;
    CGFloat y = v2->_bounds.origin.y;
    CGFloat width = v2->_bounds.size.width;
    CGFloat height = v2->_bounds.size.height;
  }
  objc_sync_exit(v2);

  double v9 = x;
  double v10 = y;
  double v11 = width;
  double v12 = height;
  result.size.CGFloat height = v12;
  result.size.CGFloat width = v11;
  result.origin.CGFloat y = v10;
  result.origin.CGFloat x = v9;
  return result;
}

void *__31__PKStrokeProviderSlice_bounds__block_invoke(void *result, double a2, double a3)
{
  uint64_t v3 = *(void *)(result[4] + 8);
  double v4 = *(double *)(v3 + 24);
  if (v4 >= a2) {
    double v4 = a2;
  }
  *(double *)(v3 + 24) = v4;
  uint64_t v5 = *(void *)(result[5] + 8);
  if (*(double *)(v5 + 24) >= a2) {
    a2 = *(double *)(v5 + 24);
  }
  *(double *)(v5 + 24) = a2;
  uint64_t v6 = *(void *)(result[6] + 8);
  double v7 = *(double *)(v6 + 24);
  if (v7 >= a3) {
    double v7 = a3;
  }
  *(double *)(v6 + 24) = v7;
  uint64_t v8 = *(void *)(result[7] + 8);
  double v9 = *(double *)(v8 + 24);
  if (v9 < a3) {
    double v9 = a3;
  }
  *(double *)(v8 + 24) = v9;
  return result;
}

- (double)startTimestamp
{
  uint64_t v3 = [(PKStrokeProviderSlice *)self stroke];
  double v4 = [v3 path];
  uint64_t v5 = [v4 creationDate];
  [v5 timeIntervalSinceReferenceDate];
  double v7 = v6;
  uint64_t v8 = [(PKStrokeProviderSlice *)self stroke];
  double v9 = [v8 path];
  double v10 = [(PKStrokeProviderSlice *)self identifier];
  [v10 tStart];
  objc_msgSend(v9, "interpolatedTimeoffsetAt:");
  double v12 = v7 + v11;

  return v12;
}

- (double)endTimestamp
{
  uint64_t v3 = [(PKStrokeProviderSlice *)self stroke];
  double v4 = [v3 path];
  uint64_t v5 = [v4 creationDate];
  [v5 timeIntervalSinceReferenceDate];
  double v7 = v6;
  uint64_t v8 = [(PKStrokeProviderSlice *)self stroke];
  double v9 = [v8 _strokeData];
  double v10 = [(PKStrokeProviderSlice *)self identifier];
  [v10 tEnd];
  objc_msgSend(v9, "interpolatedTimeoffsetAt:");
  double v12 = v7 + v11;

  return v12;
}

- (unint64_t)strokeAttributes
{
  uint64_t v3 = [(PKStrokeProviderSlice *)self stroke];
  uint64_t v4 = [v3 _shapeType];

  uint64_t v5 = [(PKStrokeProviderSlice *)self stroke];
  int v6 = [v5 _isSynthesizedInk];

  double v7 = [(PKStrokeProviderSlice *)self stroke];
  uint64_t v8 = [v7 _inputType];

  double v9 = [(PKStrokeProviderSlice *)self stroke];
  if ([v9 _isSynthesizedInk])
  {
    int v10 = 1;
  }
  else
  {
    double v11 = [(PKStrokeProviderSlice *)self stroke];
    if ([v11 _isPastedStroke])
    {
      int v10 = 1;
    }
    else
    {
      double v12 = [(PKStrokeProviderSlice *)self stroke];
      int v10 = [v12 _isSharedStroke];
    }
  }

  v13 = [(PKStrokeProviderSlice *)self stroke];
  int v14 = [v13 _isSafeForStyleInventory];

  objc_super v15 = [(PKStrokeProviderSlice *)self stroke];
  int v16 = [v15 _isPastedStroke];

  unint64_t v17 = [(PKStrokeProviderSlice *)self stroke];
  int v18 = [v17 _isSharedStroke];
  if (v6) {
    uint64_t v19 = (2 * (v4 != 0)) | 4;
  }
  else {
    uint64_t v19 = 2 * (v4 != 0);
  }
  if (!v8) {
    v19 |= 8uLL;
  }
  if (v14 | v10) {
    uint64_t v20 = v19;
  }
  else {
    uint64_t v20 = v19 | 0x40;
  }
  if (v16) {
    uint64_t v21 = v20 | 0x10;
  }
  else {
    uint64_t v21 = v20;
  }

  unint64_t v22 = v21 | 0x20;
  if (!v18) {
    unint64_t v22 = v21;
  }
  if (v22 <= 1) {
    return 1;
  }
  else {
    return v22;
  }
}

- (int64_t)compareTo:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PKStrokeProviderSlice *)self stroke];
  int v6 = [v4 stroke];
  int64_t v7 = [v5 compareToStroke:v6];

  if (!v7)
  {
    uint64_t v8 = [(PKStrokeProviderSlice *)self identifier];
    [v8 tStart];
    double v10 = v9;
    double v11 = [v4 identifier];
    [v11 tStart];
    double v13 = v12;

    if (v10 >= v13)
    {
      int v14 = [(PKStrokeProviderSlice *)self identifier];
      [v14 tStart];
      double v16 = v15;
      unint64_t v17 = [v4 identifier];
      [v17 tStart];
      double v19 = v18;

      int64_t v7 = v16 > v19;
    }
    else
    {
      int64_t v7 = -1;
    }
  }

  return v7;
}

- (CGPoint)_splineControlPoint:(int64_t)a3 transform:(CGAffineTransform *)a4
{
  int64_t v7 = [(PKStrokeProviderSlice *)self stroke];
  uint64_t v8 = [v7 _strokeData];

  double v9 = [(PKStrokeProviderSlice *)self stroke];
  unint64_t v10 = [v9 _pointsCount];

  if (a3 < 0)
  {
    [v8 locationAtIndex:0];
    double v30 = v14;
    double v32 = v13;
    float64x2_t v27 = *(float64x2_t *)&a4->c;
    float64x2_t v28 = *(float64x2_t *)&a4->tx;
    float64x2_t v29 = *(float64x2_t *)&a4->a;
    [v8 locationAtIndex:1];
LABEL_6:
    float64x2_t v19 = vnegq_f64(vaddq_f64(*(float64x2_t *)&a4->tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&a4->c, v16), *(float64x2_t *)&a4->a, v15)));
    __asm { FMOV            V0.2D, #2.0 }
    float64x2_t v31 = vmlaq_f64(v19, _Q0, vaddq_f64(v28, vmlaq_n_f64(vmulq_n_f64(v27, v30), v29, v32)));
    goto LABEL_7;
  }
  if (v10 <= a3)
  {
    [v8 locationAtIndex:v10 - 1];
    double v30 = v18;
    double v32 = v17;
    float64x2_t v27 = *(float64x2_t *)&a4->c;
    float64x2_t v28 = *(float64x2_t *)&a4->tx;
    float64x2_t v29 = *(float64x2_t *)&a4->a;
    [v8 locationAtIndex:v10 - 2];
    goto LABEL_6;
  }
  [v8 locationAtIndex:a3];
  float64x2_t v31 = vaddq_f64(*(float64x2_t *)&a4->tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&a4->c, v11), *(float64x2_t *)&a4->a, v12));
LABEL_7:

  double v26 = v31.f64[1];
  double v25 = v31.f64[0];
  result.CGFloat y = v26;
  result.CGFloat x = v25;
  return result;
}

- (CGPoint)_interpolatedPointForSplineSegment:(int64_t)a3 t:(double)a4 transform:(CGAffineTransform *)a5
{
  uint64_t v8 = 0;
  int64_t v9 = a3 - 1;
  double v11 = *MEMORY[0x1E4F1DAD8];
  double v10 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  double v12 = 0.0;
  do
  {
    long long v13 = *(_OWORD *)&a5->c;
    v21[0] = *(_OWORD *)&a5->a;
    v21[1] = v13;
    v21[2] = *(_OWORD *)&a5->tx;
    [(PKStrokeProviderSlice *)self _splineControlPoint:v9 + v8 transform:v21];
    double v15 = v14;
    double v17 = v16;
    double v18 = b((int)v8 - 2, a4);
    double v11 = v11 + v18 * v15;
    double v10 = v10 + v18 * v17;
    double v12 = v12 + v18;
    ++v8;
  }
  while (v8 != 4);
  double v19 = v11 / v12;
  double v20 = v10 / v12;
  result.CGFloat y = v20;
  result.CGFloat x = v19;
  return result;
}

- (double)_interpolatedTimeForSplineSegment:(int64_t)a3 t:(double)a4
{
  int v6 = [(PKStrokeProviderSlice *)self stroke];
  int64_t v7 = [v6 _strokeData];
  [v7 timestampAtIndex:a3];
  double v9 = v8;

  double v10 = [(PKStrokeProviderSlice *)self stroke];
  double v11 = [v10 _strokeData];
  [v11 timestampAtIndex:a3 + 1];
  double v13 = v12;

  return v9 + (v13 - v9) * (double)a3;
}

- (double)_lengthOfSplineSegment:(unint64_t)a3 transform:(CGAffineTransform *)a4
{
  long long v7 = *(_OWORD *)&a4->c;
  v29[0] = *(_OWORD *)&a4->a;
  v29[1] = v7;
  v29[2] = *(_OWORD *)&a4->tx;
  [(PKStrokeProviderSlice *)self _splineControlPoint:a3 - 1 transform:v29];
  double v9 = v8;
  double v11 = v10;
  long long v12 = *(_OWORD *)&a4->c;
  v28[0] = *(_OWORD *)&a4->a;
  v28[1] = v12;
  v28[2] = *(_OWORD *)&a4->tx;
  [(PKStrokeProviderSlice *)self _splineControlPoint:a3 transform:v28];
  double v14 = v13;
  double v16 = v15;
  long long v17 = *(_OWORD *)&a4->c;
  v27[0] = *(_OWORD *)&a4->a;
  v27[1] = v17;
  v27[2] = *(_OWORD *)&a4->tx;
  [(PKStrokeProviderSlice *)self _splineControlPoint:a3 + 1 transform:v27];
  double v19 = v18;
  double v21 = v20;
  long long v22 = *(_OWORD *)&a4->c;
  v26[0] = *(_OWORD *)&a4->a;
  v26[1] = v22;
  v26[2] = *(_OWORD *)&a4->tx;
  [(PKStrokeProviderSlice *)self _splineControlPoint:a3 + 2 transform:v26];
  return approximateSplineLength(v9, v11, v14, v16, v19, v21, v23, v24);
}

- (int64_t)_firstPointIndex
{
  v2 = [(PKStrokeProviderSlice *)self identifier];
  [v2 tStart];
  int64_t v4 = (uint64_t)v3;

  return v4;
}

- (int64_t)_lastPointIndex
{
  int64_t v3 = [(PKStrokeProviderSlice *)self _firstPointIndex];
  int64_t v4 = [(PKStrokeProviderSlice *)self identifier];
  [v4 tEnd];
  double v6 = v5;

  long long v7 = [(PKStrokeProviderSlice *)self stroke];
  unint64_t v8 = [v7 _pointsCount] - 1;

  if (v8 >= (uint64_t)v6) {
    int64_t v9 = (uint64_t)v6;
  }
  else {
    int64_t v9 = v8;
  }
  if (v9 <= v3) {
    return v3;
  }
  else {
    return v9;
  }
}

- (double)_strokeLength
{
  int64_t v3 = [(PKStrokeProviderSlice *)self stroke];
  uint64_t v4 = [v3 _pointsCount];

  double v5 = 0.0;
  if (v4 != 1)
  {
    int64_t v6 = [(PKStrokeProviderSlice *)self _lastPointIndex];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v14 = 0u;
    long long v7 = [(PKStrokeProviderSlice *)self stroke];
    unint64_t v8 = v7;
    if (v7)
    {
      [v7 transform];
    }
    else
    {
      long long v15 = 0u;
      long long v16 = 0u;
      long long v14 = 0u;
    }

    int64_t v9 = [(PKStrokeProviderSlice *)self _firstPointIndex];
    if (v9 < v6)
    {
      int64_t v10 = v9;
      do
      {
        v13[0] = v14;
        v13[1] = v15;
        v13[2] = v16;
        [(PKStrokeProviderSlice *)self _lengthOfSplineSegment:v10 transform:v13];
        double v5 = v5 + v11;
        ++v10;
      }
      while (v6 != v10);
    }
  }
  return v5;
}

- (void)enumeratePointsWithTimestep:(double)a3 usingBlock:(id)a4
{
  int64_t v6 = (void (**)(id, unsigned char *))a4;
  if (v6)
  {
    long long v7 = [(PKStrokeProviderSlice *)self stroke];
    unint64_t v8 = [v7 _strokeData];

    int64_t v9 = [(PKStrokeProviderSlice *)self stroke];
    uint64_t v10 = [v9 _pointsCount];

    int64_t v11 = [(PKStrokeProviderSlice *)self _firstPointIndex];
    float64x2_t v44 = 0u;
    float64x2_t v45 = 0u;
    float64x2_t v43 = 0u;
    long long v12 = [(PKStrokeProviderSlice *)self stroke];
    double v13 = v12;
    if (v12)
    {
      [v12 transform];
    }
    else
    {
      float64x2_t v44 = 0u;
      float64x2_t v45 = 0u;
      float64x2_t v43 = 0u;
    }

    [v8 timestampAtIndex:v11];
    double v15 = v14;
    unint64_t v16 = v10 - 1;
    if (v10 == 1)
    {
      char v42 = 0;
      [v8 locationAtIndex:v11];
      float64x2_t v19 = vaddq_f64(v45, vmlaq_n_f64(vmulq_n_f64(v44, v17), v43, v18));
      double v20 = v19.f64[1];
      __n128 v40 = (__n128)v19;
      v6[2](v6, &v42);
      if (!v42) {
        ((void (*)(void (**)(id, unsigned char *), char *, __n128, double, double))v6[2])(v6, &v42, v40, v20, v15);
      }
    }
    else
    {
      double v21 = [(PKStrokeProviderSlice *)self stroke];
      long long v22 = [v21 _strokeData];
      char v23 = [v22 hasValidPointTimestampData];

      if (v23)
      {
        int64_t v24 = [(PKStrokeProviderSlice *)self _lastPointIndex];
        [v8 timestampAtIndex:v11];
        double v26 = v25;
        [v8 timestampAtIndex:v24];
        double v28 = v27;
        unint64_t v29 = [(PKStrokeProviderSlice *)self _firstPointIndex];
        while (v15 < v28)
        {
          if (v29 >= v16)
          {
            double v36 = v15 - v26;
            double v35 = 0.0;
          }
          else
          {
            while (1)
            {
              [v8 timestampAtIndex:v29];
              double v26 = v30;
              unint64_t v31 = v29 + 1;
              [v8 timestampAtIndex:v29 + 1];
              double v33 = v32;
              [v8 timestampAtIndex:v29];
              double v35 = v33 - v34;
              double v36 = v15 - v26;
              if (v15 - v26 < v35) {
                break;
              }
              ++v29;
              if (v16 == v31)
              {
                unint64_t v29 = v16;
                break;
              }
            }
          }
          v41[0] = v43;
          v41[1] = v44;
          v41[2] = v45;
          [(PKStrokeProviderSlice *)self _interpolatedPointForSplineSegment:v29 t:v41 transform:v36 / v35];
          char v42 = 0;
          v6[2](v6, &v42);
          double v15 = v15 + a3;
          if (v42) {
            goto LABEL_20;
          }
        }
        char v42 = 0;
        [v8 locationAtIndex:v24];
        __n128 v39 = (__n128)vaddq_f64(v45, vmlaq_n_f64(vmulq_n_f64(v44, v37), v43, v38));
        ((void (*)(void (**)(id, unsigned char *), char *, __n128, double, double))v6[2])(v6, &v42, v39, v39.n128_f64[1], v28);
      }
      else
      {
        [(PKStrokeProviderSlice *)self enumeratePointsWithDistanceStep:v6 usingBlock:a3 * 240.0];
      }
    }
LABEL_20:
  }
}

- (void)enumeratePointsWithDistanceStep:(double)a3 usingBlock:(id)a4
{
  int64_t v6 = (void (**)(id, unsigned char *, double, double, double))a4;
  if (v6)
  {
    long long v7 = [(PKStrokeProviderSlice *)self stroke];
    unint64_t v8 = [v7 _strokeData];

    int64_t v9 = [(PKStrokeProviderSlice *)self stroke];
    uint64_t v10 = [v9 _pointsCount];

    unint64_t v11 = [(PKStrokeProviderSlice *)self _firstPointIndex];
    int64_t v12 = [(PKStrokeProviderSlice *)self _lastPointIndex];
    [(PKStrokeProviderSlice *)self _strokeLength];
    double v14 = v13;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v46 = 0u;
    double v15 = [(PKStrokeProviderSlice *)self stroke];
    unint64_t v16 = v15;
    if (v15)
    {
      [v15 transform];
    }
    else
    {
      long long v47 = 0u;
      long long v48 = 0u;
      long long v46 = 0u;
    }

    unint64_t v17 = v10 - 1;
    if (!v17 || v14 == 0.0)
    {
      char v45 = 0;
      [v8 locationAtIndex:v11];
      double v28 = v27;
      double v30 = v29;
      long long v31 = v46;
      long long v32 = v47;
      long long v33 = v48;
      [v8 timestampAtIndex:v11];
      v6[2](v6, &v45, *(double *)&v33 + v30 * *(double *)&v32 + *(double *)&v31 * v28, *((double *)&v33 + 1) + v30 * *((double *)&v32 + 1) + *((double *)&v31 + 1) * v28, v34);
      if (v45)
      {
LABEL_17:

        goto LABEL_18;
      }
    }
    else
    {
      double v18 = 0.0;
      double v19 = 0.0;
      while (v18 < v14)
      {
        double v20 = 0.0;
        if (v11 < v17)
        {
          while (1)
          {
            v44[0] = v46;
            v44[1] = v47;
            v44[2] = v48;
            [(PKStrokeProviderSlice *)self _lengthOfSplineSegment:v11 transform:v44];
            if (v18 - v19 < v20) {
              break;
            }
            double v19 = v19 + v20;
            if (v17 == ++v11)
            {
              unint64_t v11 = v17;
              break;
            }
          }
        }
        v43[0] = v46;
        v43[1] = v47;
        v43[2] = v48;
        double v21 = (v18 - v19) / v20;
        [(PKStrokeProviderSlice *)self _interpolatedPointForSplineSegment:v11 t:v43 transform:v21];
        double v23 = v22;
        double v25 = v24;
        [(PKStrokeProviderSlice *)self _interpolatedTimeForSplineSegment:v11 t:v21];
        char v45 = 0;
        v6[2](v6, &v45, v23, v25, v26);
        double v18 = v18 + a3;
        if (v45) {
          goto LABEL_17;
        }
      }
    }
    char v45 = 0;
    [v8 locationAtIndex:v12];
    double v36 = v35;
    double v38 = v37;
    long long v39 = v46;
    long long v40 = v47;
    long long v41 = v48;
    [v8 timestampAtIndex:v12];
    v6[2](v6, &v45, *(double *)&v41 + v38 * *(double *)&v40 + *(double *)&v39 * v36, *((double *)&v41 + 1) + v38 * *((double *)&v40 + 1) + *((double *)&v39 + 1) * v36, v42);
    goto LABEL_17;
  }
LABEL_18:
}

- (void)enumeratePointsWithDataStep:(double)a3 usingBlock:(id)a4
{
  int64_t v6 = (void (**)(void, __n128, double))a4;
  long long v7 = [(PKStrokeProviderSlice *)self stroke];
  uint64_t v8 = [v7 _pointsCount];

  if (v6)
  {
    int64_t v9 = [(PKStrokeProviderSlice *)self stroke];
    uint64_t v10 = [v9 _strokeData];

    uint64_t v11 = [(PKStrokeProviderSlice *)self _firstPointIndex];
    uint64_t v12 = [(PKStrokeProviderSlice *)self _lastPointIndex];
    float64x2_t v24 = 0u;
    float64x2_t v25 = 0u;
    float64x2_t v23 = 0u;
    double v13 = [(PKStrokeProviderSlice *)self stroke];
    double v14 = v13;
    if (v13)
    {
      [v13 transform];
    }
    else
    {
      float64x2_t v24 = 0u;
      float64x2_t v25 = 0u;
      float64x2_t v23 = 0u;
    }

    if (v8 == 1)
    {
      [v10 locationAtIndex:v11];
      __n128 v17 = (__n128)vaddq_f64(v25, vmlaq_n_f64(vmulq_n_f64(v24, v15), v23, v16));
      v6[2](v6, v17, v17.n128_f64[1]);
    }
    else
    {
      for (double i = (double)v11; i < (double)v12; double i = i + a3)
      {
        v22[0] = v23;
        v22[1] = v24;
        v22[2] = v25;
        [(PKStrokeProviderSlice *)self _interpolatedPointForSplineSegment:(uint64_t)i t:v22 transform:i - (double)(uint64_t)i];
        ((void (*)(void (**)(void, __n128, double)))v6[2])(v6);
      }
    }
    [v10 locationAtIndex:v12];
    __n128 v21 = (__n128)vaddq_f64(v25, vmlaq_n_f64(vmulq_n_f64(v24, v19), v23, v20));
    v6[2](v6, v21, v21.n128_f64[1]);
  }
}

- (NSString)description
{
  int64_t v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  double v5 = NSStringFromClass(v4);
  int64_t v6 = [(PKStrokeProviderSlice *)self identifier];
  long long v7 = [(PKStrokeProviderSlice *)self stroke];
  uint64_t v8 = [v3 stringWithFormat:@"<%@: %p id=%@ stroke=%@>", v5, self, v6, v7];

  return (NSString *)v8;
}

- (PKStrokeProviderSliceIdentifier)identifier
{
  return self->_identifier;
}

- (PKStroke)stroke
{
  return self->_stroke;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stroke, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_encodedStrokeIdentifier, 0);
}

@end