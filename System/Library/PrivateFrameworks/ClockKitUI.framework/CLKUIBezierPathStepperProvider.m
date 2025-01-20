@interface CLKUIBezierPathStepperProvider
- (CLKUIBezierPathStepperProvider)init;
- (UIBezierPath)path;
- (void)_calculateNorthOffset;
- (void)pointAtOffset:(double)a3 outPoint:(CGPoint *)a4 outTangent:(CGVector *)a5;
- (void)setPath:(id)a3;
@end

@implementation CLKUIBezierPathStepperProvider

- (CLKUIBezierPathStepperProvider)init
{
  v6.receiver = self;
  v6.super_class = (Class)CLKUIBezierPathStepperProvider;
  v2 = [(CLKUIBezierPathStepperProvider *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(CLKUIBezierPathStepper);
    pathStepper = v2->_pathStepper;
    v2->_pathStepper = v3;

    v2->_pathLength = 0.0;
    v2->_offsetNorth = 0.0;
  }
  return v2;
}

- (void)setPath:(id)a3
{
  objc_super v6 = (UIBezierPath *)a3;
  if (self->_path != v6)
  {
    objc_storeStrong((id *)&self->_path, a3);
    [(CLKUIBezierPathStepper *)self->_pathStepper setPath:v6];
    [(CLKUIBezierPathStepper *)self->_pathStepper totalLength];
    self->_pathLength = v5;
    [(CLKUIBezierPathStepperProvider *)self _calculateNorthOffset];
  }
}

- (void)_calculateNorthOffset
{
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v20[3] = 0x7FEFFFFFFFFFFFFFLL;
  uint64_t v16 = 0;
  v17 = (double *)&v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0x7FF8000000000000;
  uint64_t v12 = 0;
  v13 = (double *)&v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0x7FF8000000000000;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  v11[3] = 0xBFF0000000000000;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__CLKUIBezierPathStepperProvider__calculateNorthOffset__block_invoke;
  aBlock[3] = &unk_1E697BCA8;
  aBlock[4] = self;
  aBlock[5] = v11;
  aBlock[6] = v20;
  aBlock[7] = &v16;
  aBlock[8] = &v12;
  v3 = (void (**)(void, double))_Block_copy(aBlock);
  if (self->_pathLength > 0.0)
  {
    double v4 = 0.0;
    do
    {
      v3[2](v3, v4);
      double v4 = v4 + 0.25;
    }
    while (v4 < self->_pathLength);
  }
  ((void (*)(void (**)(void, double)))v3[2])(v3);
  double v5 = v17[3];
  double v6 = v13[3];
  double pathLength = self->_pathLength;
  if (vabdd_f64(v6, v5) <= pathLength * 0.5)
  {
    double v9 = (v6 - v5) * 0.5;
  }
  else
  {
    if (pathLength - v5 <= v6) {
      double v8 = v6 + v5 - pathLength;
    }
    else {
      double v8 = v5 + v6 + pathLength;
    }
    double v9 = v8 * 0.5;
  }
  self->_offsetNorth = v9 / pathLength;

  _Block_object_dispose(v11, 8);
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(v20, 8);
}

void __55__CLKUIBezierPathStepperProvider__calculateNorthOffset__block_invoke(void *a1, double a2)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  double v4 = *(void **)(a1[4] + 8);
  double v5 = objc_msgSend(NSNumber, "numberWithDouble:");
  v14[0] = v5;
  double v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  v7 = [v4 mapOffsetsToPathPositions:v6];

  double v8 = [v7 firstObject];
  [v8 point];
  double v10 = *(double *)(*(void *)(a1[5] + 8) + 24);
  if (v9 < v10 && v10 >= 0.0 && v9 == *(double *)(*(void *)(a1[6] + 8) + 24))
  {
    uint64_t v12 = a1[7];
    goto LABEL_10;
  }
  if (v9 > v10 && v10 == *(double *)(*(void *)(a1[6] + 8) + 24))
  {
    uint64_t v12 = a1[8];
LABEL_10:
    *(double *)(*(void *)(v12 + 8) + 24) = a2;
  }
  uint64_t v13 = *(void *)(a1[6] + 8);
  if (v9 < *(double *)(v13 + 24)) {
    *(double *)(v13 + 24) = v9;
  }
  *(double *)(*(void *)(a1[5] + 8) + 24) = v9;
}

- (void)pointAtOffset:(double)a3 outPoint:(CGPoint *)a4 outTangent:(CGVector *)a5
{
  v19[1] = *MEMORY[0x1E4F143B8];
  double v7 = self->_offsetNorth + a3;
  if (v7 > 1.0) {
    double v7 = v7 + -1.0;
  }
  pathStepper = self->_pathStepper;
  double v9 = [NSNumber numberWithDouble:self->_pathLength * v7];
  v19[0] = v9;
  double v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  v11 = [(CLKUIBezierPathStepper *)pathStepper mapOffsetsToPathPositions:v10];

  uint64_t v12 = [v11 firstObject];
  [v12 tangent];
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  [v12 point];
  a4->x = v17;
  a4->y = v18;
  a5->dx = v14;
  a5->dy = v16;
}

- (UIBezierPath)path
{
  return self->_path;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_pathStepper, 0);
}

@end