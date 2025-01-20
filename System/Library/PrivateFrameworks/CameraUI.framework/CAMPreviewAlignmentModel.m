@interface CAMPreviewAlignmentModel
+ (double)desiredUpdateInterval;
- (BOOL)isAligned;
- (CAMPreviewAlignmentModel)init;
- (CAMPreviewAlignmentModelObserver)observer;
- (CATransform3D)alignmentTransform;
- (CMDeviceMotion)_referenceDeviceMotion;
- (double)opacity;
- (void)_setAligned:(BOOL)a3;
- (void)_setAlignmentTransform:(CATransform3D *)a3;
- (void)_setOpacity:(double)a3;
- (void)_setReferenceDeviceMotion:(id)a3;
- (void)applyDeviceMotion:(id)a3;
- (void)reset;
- (void)setObserver:(id)a3;
@end

@implementation CAMPreviewAlignmentModel

- (CAMPreviewAlignmentModel)init
{
  v10.receiver = self;
  v10.super_class = (Class)CAMPreviewAlignmentModel;
  v2 = [(CAMPreviewAlignmentModel *)&v10 init];
  v3 = v2;
  if (v2)
  {
    long long v4 = *(_OWORD *)(MEMORY[0x263F15740] + 80);
    v9[4] = *(_OWORD *)(MEMORY[0x263F15740] + 64);
    v9[5] = v4;
    long long v5 = *(_OWORD *)(MEMORY[0x263F15740] + 112);
    v9[6] = *(_OWORD *)(MEMORY[0x263F15740] + 96);
    v9[7] = v5;
    long long v6 = *(_OWORD *)(MEMORY[0x263F15740] + 16);
    v9[0] = *MEMORY[0x263F15740];
    v9[1] = v6;
    long long v7 = *(_OWORD *)(MEMORY[0x263F15740] + 48);
    v9[2] = *(_OWORD *)(MEMORY[0x263F15740] + 32);
    v9[3] = v7;
    [(CAMPreviewAlignmentModel *)v2 _setAlignmentTransform:v9];
    [(CAMPreviewAlignmentModel *)v3 _setAligned:1];
  }
  return v3;
}

+ (double)desiredUpdateInterval
{
  return 0.0166666667;
}

- (void)applyDeviceMotion:(id)a3
{
  id v4 = a3;
  long long v5 = [(CAMPreviewAlignmentModel *)self _referenceDeviceMotion];

  if (v5)
  {
    long long v6 = [v4 attitude];

    id v4 = (id)[v6 copy];
    long long v7 = [(CAMPreviewAlignmentModel *)self _referenceDeviceMotion];
    v8 = [v7 attitude];
    [v4 multiplyByInverseOfAttitude:v8];

    [v4 pitch];
    long double v10 = v9;
    [v4 roll];
    double v12 = v11;
    [v4 yaw];
    double v14 = v13;
    double v15 = sqrt(v12 * v12 + v10 * v10 + v14 * v14);
    CEKProgressClamped();
    double v17 = v16;
    LODWORD(v16) = 1.0;
    LODWORD(v18) = 1.0;
    LODWORD(v19) = 1.0;
    v20 = [MEMORY[0x263F15808] functionWithControlPoints:v16 :0.0 :v18 :v19];
    *(float *)&double v21 = v17;
    [v20 _solveForInput:v21];
    double v23 = v22;

    [(CAMPreviewAlignmentModel *)self opacity];
    if (vabdd_f64(v23, v24) > 0.001)
    {
      [(CAMPreviewAlignmentModel *)self opacity];
      [(CAMPreviewAlignmentModel *)self opacity];
      CEKClamp();
      -[CAMPreviewAlignmentModel _setOpacity:](self, "_setOpacity:");
      v25 = [(CAMPreviewAlignmentModel *)self observer];
      [v25 previewAlignmentModelDidChangeOpacity:self];
    }
    BOOL v26 = [(CAMPreviewAlignmentModel *)self isAligned];
    if (v15 >= 0.0144 || !v26)
    {
      BOOL v27 = [(CAMPreviewAlignmentModel *)self isAligned];
      if (v15 >= 0.012 || v27)
      {
        double v33 = -v12;
        [(CAMPreviewAlignmentModel *)self _setAligned:0];
        memset(&v44, 0, sizeof(v44));
        CATransform3DMakeRotation(&v44, v10, 1.0, 0.0, 0.0);
        memset(&v43, 0, sizeof(v43));
        CATransform3DMakeRotation(&v43, v33, 0.0, 1.0, 0.0);
        memset(&v42, 0, sizeof(v42));
        CATransform3DMakeRotation(&v42, v14, 0.0, 0.0, 1.0);
        memset(&v41, 0, sizeof(v41));
        CATransform3D a = v44;
        CATransform3D b = v42;
        CATransform3DConcat(&v41, &a, &b);
        memset(&a, 0, sizeof(a));
        CATransform3D b = v41;
        CATransform3D v38 = v43;
        CATransform3DConcat(&a, &b, &v38);
        CGFloat v34 = sin(v33) * -200.0;
        long double v35 = sin(v10);
        memset(&b, 0, sizeof(b));
        CATransform3D v38 = a;
        CATransform3DTranslate(&b, &v38, v34, v35 * 200.0, sqrt(v35 * 200.0 * (v35 * 200.0) + v34 * v34));
        CATransform3D v37 = b;
        v32 = &v37;
      }
      else
      {
        [(CAMPreviewAlignmentModel *)self _setAligned:1];
        long long v28 = *(_OWORD *)(MEMORY[0x263F15740] + 80);
        v45[4] = *(_OWORD *)(MEMORY[0x263F15740] + 64);
        v45[5] = v28;
        long long v29 = *(_OWORD *)(MEMORY[0x263F15740] + 112);
        v45[6] = *(_OWORD *)(MEMORY[0x263F15740] + 96);
        v45[7] = v29;
        long long v30 = *(_OWORD *)(MEMORY[0x263F15740] + 16);
        v45[0] = *MEMORY[0x263F15740];
        v45[1] = v30;
        long long v31 = *(_OWORD *)(MEMORY[0x263F15740] + 48);
        v45[2] = *(_OWORD *)(MEMORY[0x263F15740] + 32);
        v45[3] = v31;
        v32 = (CATransform3D *)v45;
      }
      -[CAMPreviewAlignmentModel _setAlignmentTransform:](self, "_setAlignmentTransform:", v32, *(_OWORD *)&v37.m11, *(_OWORD *)&v37.m13, *(_OWORD *)&v37.m21, *(_OWORD *)&v37.m23, *(_OWORD *)&v37.m31, *(_OWORD *)&v37.m33, *(_OWORD *)&v37.m41, *(_OWORD *)&v37.m43);
      v36 = [(CAMPreviewAlignmentModel *)self observer];
      [v36 previewAlignmentModelDidChangeAlignmentTransform:self];
    }
  }
  else
  {
    [(CAMPreviewAlignmentModel *)self _setReferenceDeviceMotion:v4];
  }
}

- (void)reset
{
  [(CAMPreviewAlignmentModel *)self _setReferenceDeviceMotion:0];
  long long v3 = *(_OWORD *)(MEMORY[0x263F15740] + 80);
  v9[4] = *(_OWORD *)(MEMORY[0x263F15740] + 64);
  v9[5] = v3;
  long long v4 = *(_OWORD *)(MEMORY[0x263F15740] + 112);
  v9[6] = *(_OWORD *)(MEMORY[0x263F15740] + 96);
  v9[7] = v4;
  long long v5 = *(_OWORD *)(MEMORY[0x263F15740] + 16);
  v9[0] = *MEMORY[0x263F15740];
  v9[1] = v5;
  long long v6 = *(_OWORD *)(MEMORY[0x263F15740] + 48);
  v9[2] = *(_OWORD *)(MEMORY[0x263F15740] + 32);
  v9[3] = v6;
  [(CAMPreviewAlignmentModel *)self _setAlignmentTransform:v9];
  [(CAMPreviewAlignmentModel *)self _setAligned:1];
  [(CAMPreviewAlignmentModel *)self _setOpacity:0.0];
  long long v7 = [(CAMPreviewAlignmentModel *)self observer];
  [v7 previewAlignmentModelDidChangeAlignmentTransform:self];

  v8 = [(CAMPreviewAlignmentModel *)self observer];
  [v8 previewAlignmentModelDidChangeOpacity:self];
}

- (CAMPreviewAlignmentModelObserver)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  return (CAMPreviewAlignmentModelObserver *)WeakRetained;
}

- (void)setObserver:(id)a3
{
}

- (CATransform3D)alignmentTransform
{
  long long v3 = *(_OWORD *)&self->m44;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&self->m42;
  *(_OWORD *)&retstr->m33 = v3;
  long long v4 = *(_OWORD *)&self[1].m14;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&self[1].m12;
  *(_OWORD *)&retstr->m43 = v4;
  long long v5 = *(_OWORD *)&self->m24;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&self->m22;
  *(_OWORD *)&retstr->m13 = v5;
  long long v6 = *(_OWORD *)&self->m34;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&self->m32;
  *(_OWORD *)&retstr->m23 = v6;
  return self;
}

- (void)_setAlignmentTransform:(CATransform3D *)a3
{
  long long v3 = *(_OWORD *)&a3->m11;
  long long v4 = *(_OWORD *)&a3->m13;
  long long v5 = *(_OWORD *)&a3->m21;
  *(_OWORD *)&self->_alignmentTransform.m23 = *(_OWORD *)&a3->m23;
  *(_OWORD *)&self->_alignmentTransform.m21 = v5;
  *(_OWORD *)&self->_alignmentTransform.m13 = v4;
  *(_OWORD *)&self->_alignmentTransform.m11 = v3;
  long long v6 = *(_OWORD *)&a3->m31;
  long long v7 = *(_OWORD *)&a3->m33;
  long long v8 = *(_OWORD *)&a3->m41;
  *(_OWORD *)&self->_alignmentTransform.m43 = *(_OWORD *)&a3->m43;
  *(_OWORD *)&self->_alignmentTransform.m41 = v8;
  *(_OWORD *)&self->_alignmentTransform.m33 = v7;
  *(_OWORD *)&self->_alignmentTransform.m31 = v6;
}

- (BOOL)isAligned
{
  return self->_aligned;
}

- (void)_setAligned:(BOOL)a3
{
  self->_aligned = a3;
}

- (double)opacity
{
  return self->_opacity;
}

- (void)_setOpacity:(double)a3
{
  self->_opacity = a3;
}

- (CMDeviceMotion)_referenceDeviceMotion
{
  return self->__referenceDeviceMotion;
}

- (void)_setReferenceDeviceMotion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__referenceDeviceMotion, 0);
  objc_destroyWeak((id *)&self->_observer);
}

@end