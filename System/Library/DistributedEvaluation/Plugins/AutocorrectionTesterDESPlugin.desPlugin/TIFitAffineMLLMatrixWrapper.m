@interface TIFitAffineMLLMatrixWrapper
- (CGPoint)transformedPoint:(CGPoint)a3;
- (TIFitAffineMLLMatrixWrapper)init;
- (void)calcMatrix;
- (void)dealloc;
- (void)setMatrix:(void *)a3;
- (void)setRotation:(double)a3;
- (void)setSkewRotation:(double)a3;
- (void)setXScale:(double)a3 yScale:(double)a4;
- (void)setXTrans:(double)a3 yTrans:(double)a4;
@end

@implementation TIFitAffineMLLMatrixWrapper

- (TIFitAffineMLLMatrixWrapper)init
{
  v3.receiver = self;
  v3.super_class = (Class)TIFitAffineMLLMatrixWrapper;
  if ([(TIFitAffineMLLMatrixWrapper *)&v3 init]) {
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  pMatrix = (void **)self->_pMatrix;
  if (pMatrix)
  {
    sub_55214((uint64_t)(pMatrix + 2), pMatrix[3]);
    operator delete();
  }
  v3.receiver = self;
  v3.super_class = (Class)TIFitAffineMLLMatrixWrapper;
  [(TIFitAffineMLLMatrixWrapper *)&v3 dealloc];
}

- (void)setMatrix:(void *)a3
{
  pMatrix = (void **)self->_pMatrix;
  if (pMatrix)
  {
    sub_55214((uint64_t)(pMatrix + 2), pMatrix[3]);
    operator delete();
  }
  operator new();
}

- (void)setXScale:(double)a3 yScale:(double)a4
{
  pMatrix = (void **)self->_pMatrix;
  if (pMatrix)
  {
    sub_55214((uint64_t)(pMatrix + 2), pMatrix[3]);
    operator delete();
  }
  self->_pMatrix = 0;
  pScaleMatrix = (void **)self->_pScaleMatrix;
  if (pScaleMatrix)
  {
    sub_55214((uint64_t)(pScaleMatrix + 2), pScaleMatrix[3]);
    operator delete();
  }
  operator new();
}

- (void)setRotation:(double)a3
{
  pMatrix = (void **)self->_pMatrix;
  if (pMatrix)
  {
    sub_55214((uint64_t)(pMatrix + 2), pMatrix[3]);
    operator delete();
  }
  self->_pMatrix = 0;
  pRotationMatrix = (void **)self->_pRotationMatrix;
  if (pRotationMatrix)
  {
    sub_55214((uint64_t)(pRotationMatrix + 2), pRotationMatrix[3]);
    operator delete();
  }
  __sincos_stret(a3);
  operator new();
}

- (void)setSkewRotation:(double)a3
{
  pMatrix = (void **)self->_pMatrix;
  if (pMatrix)
  {
    sub_55214((uint64_t)(pMatrix + 2), pMatrix[3]);
    operator delete();
  }
  self->_pMatrix = 0;
  pSkewMatrix = (void **)self->_pSkewMatrix;
  if (pSkewMatrix)
  {
    sub_55214((uint64_t)(pSkewMatrix + 2), pSkewMatrix[3]);
    operator delete();
  }
  operator new();
}

- (void)setXTrans:(double)a3 yTrans:(double)a4
{
  pMatrix = (void **)self->_pMatrix;
  if (pMatrix)
  {
    sub_55214((uint64_t)(pMatrix + 2), pMatrix[3]);
    operator delete();
  }
  self->_pMatrix = 0;
  pTransMatrix = (void **)self->_pTransMatrix;
  if (pTransMatrix)
  {
    sub_55214((uint64_t)(pTransMatrix + 2), pTransMatrix[3]);
    operator delete();
  }
  operator new();
}

- (void)calcMatrix
{
  if (!self->_pMatrix)
  {
    pScaleMatrix = (const TIFitAffineMLLMatrix *)self->_pScaleMatrix;
    if (pScaleMatrix) {
      TIFitAffineMLLMatrix::TIFitAffineMLLMatrix((TIFitAffineMLLMatrix *)v11, pScaleMatrix);
    }
    else {
      TIFitAffineMLLMatrix::identity(v11, (TIFitAffineMLLMatrix *)((char *)&def_3B118 + 2), 0);
    }
    pRotationMatrix = (const TIFitAffineMLLMatrix *)self->_pRotationMatrix;
    if (pRotationMatrix) {
      TIFitAffineMLLMatrix::TIFitAffineMLLMatrix((TIFitAffineMLLMatrix *)v10, pRotationMatrix);
    }
    else {
      TIFitAffineMLLMatrix::identity(v10, (TIFitAffineMLLMatrix *)((char *)&def_3B118 + 2), 0);
    }
    pSkewMatrix = (const TIFitAffineMLLMatrix *)self->_pSkewMatrix;
    if (pSkewMatrix) {
      TIFitAffineMLLMatrix::TIFitAffineMLLMatrix((TIFitAffineMLLMatrix *)v9, pSkewMatrix);
    }
    else {
      TIFitAffineMLLMatrix::identity(v9, (TIFitAffineMLLMatrix *)((char *)&def_3B118 + 2), 0);
    }
    pTransMatrix = (const TIFitAffineMLLMatrix *)self->_pTransMatrix;
    if (pTransMatrix)
    {
      TIFitAffineMLLMatrix::TIFitAffineMLLMatrix((TIFitAffineMLLMatrix *)v8, pTransMatrix);
    }
    else
    {
      v11[7] = 0;
      v11[8] = 0;
      TIFitAffineMLLMatrix::TIFitAffineMLLMatrix();
    }
    TIFitAffineMLLMatrix::operator*();
    TIFitAffineMLLMatrix::operator*();
    sub_55214((uint64_t)v7, v7[1]);
    operator new();
  }
}

- (CGPoint)transformedPoint:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(TIFitAffineMLLMatrixWrapper *)self calcMatrix];
  uint64_t v10[3] = *(void **)&x;
  v10[4] = *(void **)&y;
  v10[5] = (void *)0x3FF0000000000000;
  TIFitAffineMLLMatrix::TIFitAffineMLLMatrix();
  TIFitAffineMLLMatrix::operator*();
  sub_55214((uint64_t)v9, v9[1]);
  double v5 = *(double *)TIFitAffineMLLMatrix::operator()();
  double v6 = *(double *)TIFitAffineMLLMatrix::operator()();
  sub_55214((uint64_t)v10, v10[1]);
  double v7 = v5;
  double v8 = v6;
  result.CGFloat y = v8;
  result.CGFloat x = v7;
  return result;
}

@end