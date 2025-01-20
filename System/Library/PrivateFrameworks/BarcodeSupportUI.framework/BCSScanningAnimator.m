@interface BCSScanningAnimator
- (BCSImageQuad)imageQuad;
- (BCSVisualCode)targetCode;
- (CGPoint)_appclipCodeScaleFactor;
- (CGPoint)_qrImagePopScaleFactor;
- (CGPoint)_restPosition;
- (CGRect)_platterInitialFrameWithDefaultSize:(double)a3;
- (CGRect)_restRect;
- (UIImageView)targetQRImage;
- (UIView)focusIndicator;
- (id)_meshTransform:(BOOL)a3;
- (id)_perspectiveCorrectedImage;
- (void)_animateCircularReveal;
- (void)_animateFocusIndicator:(BOOL)a3 duration:(double)a4 position:(CGPoint)a5;
- (void)_performCircularMeshTransform:(BOOL)a3 completion:(id)a4;
- (void)_performSquareMeshTransform:(BOOL)a3 completion:(id)a4;
- (void)_performSquareMeshTransformWithoutAnimating;
- (void)_revealCircularView;
- (void)_setUpBlurViewIfNeeded;
- (void)animateAppClipCodeBounceWithCompletion:(id)a3 shouldAnimate:(BOOL)a4;
- (void)animatePopWithAppImageBlock:(id)a3 completion:(id)a4;
- (void)animatePushWithCompletion:(id)a3 shouldAnimate:(BOOL)a4;
- (void)prepareCenterGlyphWithImage:(id)a3;
- (void)reset;
- (void)setFocusIndicator:(id)a3;
- (void)setImageQuad:(id)a3;
- (void)setTargetCode:(id)a3;
- (void)setTargetQRImage:(id)a3;
- (void)showCoverView;
@end

@implementation BCSScanningAnimator

- (id)_perspectiveCorrectedImage
{
  return 0;
}

- (id)_meshTransform:(BOOL)a3
{
  v5 = [MEMORY[0x263F15830] meshTransform];
  v6 = (void *)[(BCSImageQuad *)self->_imageQuad copy];
  [v6 adjustOrientationInImageSpace:0];
  if (a3)
  {
    uint64_t v7 = 0;
    double v8 = 1.0;
    double v9 = 1.0;
    double v10 = 1.0;
    uint64_t v11 = 0;
    double v12 = 1.0;
    uint64_t v13 = 0;
    uint64_t v14 = 0;
  }
  else
  {
    [v6 topLeft];
    uint64_t v14 = v15;
    [v6 topLeft];
    uint64_t v13 = v16;
    [v6 topRight];
    double v12 = v17;
    [v6 topRight];
    uint64_t v11 = v18;
    [v6 bottomRight];
    double v10 = v19;
    [v6 bottomRight];
    double v9 = v20;
    [v6 bottomLeft];
    uint64_t v7 = v21;
    [v6 bottomLeft];
    double v8 = v22;
  }
  v44[0] = 0;
  v44[1] = 0;
  v44[2] = v14;
  v44[3] = v13;
  v44[4] = 0;
  [v5 addVertex:v44];
  long long v40 = xmmword_248AEDB70;
  double v41 = v12;
  uint64_t v42 = v11;
  uint64_t v43 = 0;
  [v5 addVertex:&v40];
  __asm { FMOV            V0.2D, #1.0 }
  long long v36 = _Q0;
  double v37 = v10;
  double v38 = v9;
  uint64_t v39 = 0;
  [v5 addVertex:&v36];
  long long v32 = xmmword_248AEDB80;
  uint64_t v33 = v7;
  double v34 = v8;
  uint64_t v35 = 0;
  [v5 addVertex:&v32];
  long long v29 = xmmword_248AEDB90;
  uint64_t v30 = 0;
  uint64_t v31 = 0;
  [v5 addFace:&v29];
  [v5 setSubdivisionSteps:0];

  return v5;
}

- (CGPoint)_restPosition
{
  [(UIView *)self->_focusIndicator frame];
  CGFloat x = v10.origin.x;
  CGFloat y = v10.origin.y;
  CGFloat width = v10.size.width;
  CGFloat height = v10.size.height;
  CGRectGetMidX(v10);
  v11.origin.CGFloat x = x;
  v11.origin.CGFloat y = y;
  v11.size.CGFloat width = width;
  v11.size.CGFloat height = height;
  CGRectGetMidY(v11);

  _bcs_roundPointToPixels();
  result.CGFloat y = v7;
  result.CGFloat x = v6;
  return result;
}

- (CGRect)_restRect
{
  [(BCSImageQuad *)self->_imageQuad perspectiveCorrectedSize];
  double v4 = v3;
  double v6 = v5;
  [(BCSImageQuad *)self->_imageQuad bounds];
  double v7 = v4 * CGRectGetWidth(v16);
  [(BCSImageQuad *)self->_imageQuad bounds];
  double v8 = v6 * CGRectGetHeight(v17);
  if (v7 < 160.0) {
    double v7 = 160.0;
  }
  if (v8 >= 160.0) {
    double v9 = v8;
  }
  else {
    double v9 = 160.0;
  }
  [(BCSScanningAnimator *)self _restPosition];
  double v11 = v10 - v7 * 0.5;
  double v13 = v12 - v9 * 0.5;
  double v14 = v7;
  double v15 = v9;
  result.size.CGFloat height = v15;
  result.size.CGFloat width = v14;
  result.origin.CGFloat y = v13;
  result.origin.CGFloat x = v11;
  return result;
}

- (CGRect)_platterInitialFrameWithDefaultSize:(double)a3
{
  _bcs_deviceIsPad();
  [(UIImageView *)self->_targetQRImage frame];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  double v12 = (void *)[(BCSImageQuad *)self->_imageQuad copy];
  [(BCSImageQuad *)self->_imageQuad bounds];
  objc_msgSend(v12, "setBounds:");
  [v12 denormalize];
  [v12 perspectiveCorrectedSize];
  v25.origin.CGFloat x = v5;
  v25.origin.CGFloat y = v7;
  v25.size.CGFloat width = v9;
  v25.size.CGFloat height = v11;
  CGRectGetMidX(v25);
  v26.origin.CGFloat x = v5;
  v26.origin.CGFloat y = v7;
  v26.size.CGFloat width = v9;
  v26.size.CGFloat height = v11;
  CGRectGetMidY(v26);
  _bcs_roundRectToPixels();
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  double v21 = v14;
  double v22 = v16;
  double v23 = v18;
  double v24 = v20;
  result.size.CGFloat height = v24;
  result.size.CGFloat width = v23;
  result.origin.CGFloat y = v22;
  result.origin.CGFloat x = v21;
  return result;
}

- (CGPoint)_qrImagePopScaleFactor
{
  [(BCSDissolveEffectView *)self->_platterView frame];
  double v4 = v3;
  double v6 = v5;
  [(UIImageView *)self->_targetQRImage frame];
  double v8 = (v4 + -20.0) / v7;
  double v10 = (v6 + -20.0) / v9;
  result.CGFloat y = v10;
  result.CGFloat x = v8;
  return result;
}

- (CGPoint)_appclipCodeScaleFactor
{
  [(UIView *)self->_circularContainerView frame];
  double v4 = v3;
  double v6 = v5;
  [(UIImageView *)self->_targetQRImage bounds];
  double v8 = v4 / v7;
  double v10 = v6 / v9;
  result.CGFloat y = v10;
  result.CGFloat x = v8;
  return result;
}

- (void)_animateFocusIndicator:(BOOL)a3 duration:(double)a4 position:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  BOOL v8 = a3;
  v52[3] = *MEMORY[0x263EF8340];
  double v10 = self->_focusIndicator;
  _bcs_mainScreenScale();
  double v12 = v11;
  double v13 = [(UIView *)v10 layer];
  [v13 setRasterizationScale:v12];

  double v14 = [MEMORY[0x263F15760] animationWithKeyPath:@"meshTransform"];
  double v15 = [(BCSScanningAnimator *)self _meshTransform:v8 ^ 1];
  [v14 setFromValue:v15];

  double v16 = [(BCSScanningAnimator *)self _meshTransform:v8];
  [v14 setToValue:v16];

  [v14 setDuration:a4];
  uint64_t v17 = *MEMORY[0x263F15AA8];
  [v14 setFillMode:*MEMORY[0x263F15AA8]];
  [v14 setRemovedOnCompletion:0];
  uint64_t v18 = *MEMORY[0x263F15EC0];
  double v19 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EC0]];
  [v14 setTimingFunction:v19];

  double v20 = [(UIView *)v10 layer];
  [v20 addAnimation:v14 forKey:@"meshTransform"];

  [(BCSImageQuad *)self->_imageQuad bounds];
  double Width = CGRectGetWidth(v53);
  [(UIView *)v10 bounds];
  double v22 = CGRectGetWidth(v54);
  [(BCSImageQuad *)self->_imageQuad bounds];
  double Height = CGRectGetHeight(v55);
  [(UIView *)v10 bounds];
  double v24 = CGRectGetHeight(v56);
  if (!v8)
  {
    double v25 = v24;
    CGRect v26 = [MEMORY[0x263F157D8] animationWithKeyPath:@"transform.scale.x"];
    double v27 = Width / v22;
    v52[0] = &unk_26FCC64E0;
    v28 = [NSNumber numberWithDouble:v27 * 1.05];
    v52[1] = v28;
    long long v29 = [NSNumber numberWithDouble:v27 * 1.25];
    v52[2] = v29;
    uint64_t v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:v52 count:3];
    [v26 setValues:v30];

    [v26 setKeyTimes:&unk_26FCC65D8];
    [v26 setDuration:a4];
    [v26 setFillMode:v17];
    [v26 setRemovedOnCompletion:0];
    uint64_t v31 = [MEMORY[0x263F15808] functionWithName:v18];
    [v26 setTimingFunction:v31];

    long long v32 = [(UIView *)v10 layer];
    [v32 addAnimation:v26 forKey:@"transform.scale.x"];

    uint64_t v33 = [MEMORY[0x263F157D8] animationWithKeyPath:@"transform.scale.y"];

    double v34 = Height / v25;
    v51[0] = &unk_26FCC64E0;
    uint64_t v35 = [NSNumber numberWithDouble:v34 * 1.05];
    v51[1] = v35;
    long long v36 = [NSNumber numberWithDouble:v34 * 1.25];
    v51[2] = v36;
    double v37 = [MEMORY[0x263EFF8C0] arrayWithObjects:v51 count:3];
    [v33 setValues:v37];

    [v33 setKeyTimes:&unk_26FCC65F0];
    [v33 setDuration:a4];
    [v33 setFillMode:v17];
    [v33 setRemovedOnCompletion:0];
    double v38 = [MEMORY[0x263F15808] functionWithName:v18];
    [v33 setTimingFunction:v38];

    uint64_t v39 = [(UIView *)v10 layer];
    [v39 addAnimation:v33 forKey:@"transform.scale.y"];
  }
  long long v40 = objc_msgSend(MEMORY[0x263F15760], "animationWithKeyPath:", @"position", v24);
  double v41 = (void *)MEMORY[0x263F08D40];
  double v42 = y;
  double v43 = x;
  if (!v8) {
    [(UIView *)v10 position];
  }
  v44 = objc_msgSend(v41, "valueWithCGPoint:", v43, v42);
  [v40 setFromValue:v44];

  v45 = (void *)MEMORY[0x263F08D40];
  if (v8)
  {
    [(UIView *)v10 position];
    double x = v46;
    double y = v47;
  }
  v48 = objc_msgSend(v45, "valueWithCGPoint:", x, y);
  [v40 setToValue:v48];

  [v40 setDuration:a4];
  [v40 setFillMode:v17];
  [v40 setRemovedOnCompletion:0];
  v49 = [MEMORY[0x263F15808] functionWithName:v18];
  [v40 setTimingFunction:v49];

  v50 = [(UIView *)v10 layer];
  [v50 addAnimation:v40 forKey:@"position"];
}

- (void)_performSquareMeshTransformWithoutAnimating
{
  double v3 = self->_focusIndicator;
  _bcs_mainScreenScale();
  double v5 = v4;
  double v6 = [(UIImageView *)self->_targetQRImage layer];
  [v6 setRasterizationScale:v5];

  [(BCSImageQuad *)self->_imageQuad bounds];
  double Width = CGRectGetWidth(v43);
  [(UIView *)v3 bounds];
  double v8 = CGRectGetWidth(v44);
  [(BCSImageQuad *)self->_imageQuad bounds];
  double Height = CGRectGetHeight(v45);
  [(UIView *)v3 bounds];
  CGFloat v10 = CGRectGetHeight(v46);
  memset(&v42, 0, sizeof(v42));
  CGAffineTransformMakeScale(&v42, Width / v8 * 1.25, Height / v10 * 1.25);
  [(BCSImageQuad *)self->_imageQuad bounds];
  double MidX = CGRectGetMidX(v47);
  [(UIView *)v3 center];
  double v13 = v12;
  [(BCSImageQuad *)self->_imageQuad bounds];
  double MidY = CGRectGetMidY(v48);
  [(UIView *)v3 center];
  memset(&v41, 0, sizeof(v41));
  CGAffineTransformMakeTranslation(&v41, MidX - v13, MidY - v15);
  CGAffineTransform t1 = v42;
  CGAffineTransform t2 = v41;
  CGAffineTransformConcat(&v40, &t1, &t2);
  CGAffineTransform v37 = v40;
  [(UIView *)v3 setTransform:&v37];
  double v16 = [(BCSScanningAnimator *)self _meshTransform:0];
  uint64_t v17 = [(UIView *)v3 layer];
  [v17 setMeshTransform:v16];

  [(BCSScanningAnimator *)self _restPosition];
  double v19 = v18;
  double v21 = v20;
  double v22 = [(BCSDissolveEffectView *)self->_platterView layer];
  objc_msgSend(v22, "setPosition:", v19, v21);

  long long v23 = *(_OWORD *)(MEMORY[0x263F15740] + 80);
  long long v33 = *(_OWORD *)(MEMORY[0x263F15740] + 64);
  long long v34 = v23;
  long long v24 = *(_OWORD *)(MEMORY[0x263F15740] + 112);
  long long v35 = *(_OWORD *)(MEMORY[0x263F15740] + 96);
  long long v36 = v24;
  long long v25 = *(_OWORD *)(MEMORY[0x263F15740] + 16);
  long long v29 = *MEMORY[0x263F15740];
  long long v30 = v25;
  long long v26 = *(_OWORD *)(MEMORY[0x263F15740] + 48);
  long long v31 = *(_OWORD *)(MEMORY[0x263F15740] + 32);
  long long v32 = v26;
  double v27 = [(BCSDissolveEffectView *)self->_platterView layer];
  v28[4] = v33;
  v28[5] = v34;
  v28[6] = v35;
  v28[7] = v36;
  v28[0] = v29;
  v28[1] = v30;
  v28[2] = v31;
  v28[3] = v32;
  [v27 setTransform:v28];
}

- (void)_performSquareMeshTransform:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  v85[3] = *MEMORY[0x263EF8340];
  id v69 = a4;
  if (v4) {
    double v6 = 0.6;
  }
  else {
    double v6 = 0.4;
  }
  double v7 = self->_focusIndicator;
  long long v8 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v82[0] = *MEMORY[0x263F000D0];
  v82[1] = v8;
  v82[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  v70 = v7;
  [(UIView *)v7 setTransform:v82];
  _bcs_mainScreenScale();
  double v10 = v9;
  double v11 = [(UIImageView *)self->_targetQRImage layer];
  [v11 setRasterizationScale:v10];

  [MEMORY[0x263F158F8] begin];
  double v12 = (void *)MEMORY[0x263F158F8];
  v80[0] = MEMORY[0x263EF8330];
  v80[1] = 3221225472;
  v80[2] = __62__BCSScanningAnimator__performSquareMeshTransform_completion___block_invoke;
  v80[3] = &unk_26524C250;
  id v68 = v69;
  id v81 = v68;
  [v12 setCompletionBlock:v80];
  [(BCSImageQuad *)self->_imageQuad bounds];
  double MidX = CGRectGetMidX(v86);
  [(BCSImageQuad *)self->_imageQuad bounds];
  -[BCSScanningAnimator _animateFocusIndicator:duration:position:](self, "_animateFocusIndicator:duration:position:", v4, v6, MidX, CGRectGetMidY(v87));
  double v14 = [MEMORY[0x263F157D8] animationWithKeyPath:@"transform.scale"];
  if (v4)
  {
    double v15 = [NSNumber numberWithDouble:1.05];
    v85[0] = v15;
    v85[1] = &unk_26FCC64E0;
    double v16 = [NSNumber numberWithDouble:1.0];
    v85[2] = v16;
    uint64_t v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v85 count:3];
  }
  else
  {
    v84[0] = &unk_26FCC64E0;
    v84[1] = &unk_26FCC6568;
    double v15 = [NSNumber numberWithDouble:1.05];
    v84[2] = v15;
    uint64_t v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v84 count:3];
    double v16 = (void *)v17;
  }
  double v18 = (void *)v17;
  [v14 setValues:v17];
  if (v4)
  {

    double v19 = &unk_26FCC6608;
  }
  else
  {
    double v19 = &unk_26FCC6620;
  }

  [v14 setKeyTimes:v19];
  [v14 setDuration:v6];
  uint64_t v20 = *MEMORY[0x263F15AA8];
  [v14 setFillMode:*MEMORY[0x263F15AA8]];
  [v14 setRemovedOnCompletion:0];
  uint64_t v21 = *MEMORY[0x263F15EB8];
  double v22 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EB8]];
  v83 = v22;
  long long v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v83 count:1];
  [v14 setTimingFunctions:v23];

  long long v24 = [(UIImageView *)self->_targetQRImage layer];
  [v24 addAnimation:v14 forKey:@"transform"];

  long long v25 = [MEMORY[0x263F157D8] animationWithKeyPath:@"opacity"];
  if (v4)
  {
    [v25 setValues:&unk_26FCC6698];
    [v25 setKeyTimes:&unk_26FCC66B0];
    [v25 setDuration:0.6];
    [v25 setRemovedOnCompletion:0];
    [v25 setFillMode:v20];
    long long v26 = [MEMORY[0x263F15808] functionWithName:v21];
    [v25 setTimingFunction:v26];

    double v27 = [(UIView *)v70 layer];
    [v27 addAnimation:v25 forKey:@"opacity"];

    v28 = [MEMORY[0x263F15760] animationWithKeyPath:@"meshTransform"];
    long long v29 = [(BCSScanningAnimator *)self _meshTransform:0];
    [v28 setFromValue:v29];

    long long v30 = [(BCSScanningAnimator *)self _meshTransform:1];
    [v28 setToValue:v30];

    [v28 setDuration:0.6];
    [v28 setFillMode:v20];
    [v28 setRemovedOnCompletion:0];
    long long v31 = [MEMORY[0x263F15808] functionWithName:v21];
    [v28 setTimingFunction:v31];

    long long v32 = [(UIImageView *)self->_targetQRImage layer];
    [v32 addAnimation:v28 forKey:@"meshTransform"];

    long long v33 = [(BCSScanningAnimator *)self _meshTransform:1];
    long long v34 = [(UIImageView *)self->_targetQRImage layer];
    [v34 setMeshTransform:v33];

    long long v35 = [MEMORY[0x263F15760] animationWithKeyPath:@"position"];
    long long v36 = (void *)MEMORY[0x263F08D40];
    CGAffineTransform v37 = [(BCSDissolveEffectView *)self->_platterView layer];
    [v37 position];
    double v38 = objc_msgSend(v36, "valueWithCGPoint:");
    [v35 setFromValue:v38];

    uint64_t v39 = (void *)MEMORY[0x263F08D40];
    [(BCSScanningAnimator *)self _restPosition];
    CGAffineTransform v40 = objc_msgSend(v39, "valueWithCGPoint:");
    [v35 setToValue:v40];

    [v35 setDuration:0.6];
    [v35 setFillMode:v20];
    [v35 setRemovedOnCompletion:0];
    CGAffineTransform v41 = [MEMORY[0x263F15808] functionWithName:v21];
    [v35 setTimingFunction:v41];

    CGAffineTransform v42 = [(BCSDissolveEffectView *)self->_platterView layer];
    [v42 addAnimation:v35 forKey:@"position"];

    [(BCSScanningAnimator *)self _qrImagePopScaleFactor];
    double v44 = v43;
    double v46 = v45;
    CGRect v47 = [MEMORY[0x263F15760] animationWithKeyPath:@"transform.scale.x"];
    [v47 setFromValue:&unk_26FCC64E0];
    CGRect v48 = [NSNumber numberWithDouble:v44];
    [v47 setToValue:v48];

    [v47 setDuration:0.6];
    [v47 setFillMode:v20];
    [v47 setRemovedOnCompletion:0];
    v49 = [MEMORY[0x263F15808] functionWithName:v21];
    [v47 setTimingFunction:v49];

    v50 = [(UIImageView *)self->_targetQRImage layer];
    [v50 addAnimation:v47 forKey:@"transform.scale.x"];

    v51 = [MEMORY[0x263F15760] animationWithKeyPath:@"transform.scale.y"];
    [v51 setFromValue:&unk_26FCC64E0];
    v52 = [NSNumber numberWithDouble:v46];
    [v51 setToValue:v52];

    [v51 setDuration:0.6];
    [v51 setFillMode:v20];
    [v51 setRemovedOnCompletion:0];
    CGRect v53 = [MEMORY[0x263F15808] functionWithName:v21];
    [v51 setTimingFunction:v53];

    CGRect v54 = [(UIImageView *)self->_targetQRImage layer];
    [v54 addAnimation:v51 forKey:@"transform.scale.y"];

    [(BCSScanningAnimator *)self _restPosition];
    double v56 = v55;
    double v58 = v57;
    v59 = [(BCSDissolveEffectView *)self->_platterView layer];
    objc_msgSend(v59, "setPosition:", v56, v58);

    long long v60 = *(_OWORD *)(MEMORY[0x263F15740] + 80);
    long long v76 = *(_OWORD *)(MEMORY[0x263F15740] + 64);
    long long v77 = v60;
    long long v61 = *(_OWORD *)(MEMORY[0x263F15740] + 112);
    long long v78 = *(_OWORD *)(MEMORY[0x263F15740] + 96);
    long long v79 = v61;
    long long v62 = *(_OWORD *)(MEMORY[0x263F15740] + 16);
    long long v72 = *MEMORY[0x263F15740];
    long long v73 = v62;
    long long v63 = *(_OWORD *)(MEMORY[0x263F15740] + 48);
    long long v74 = *(_OWORD *)(MEMORY[0x263F15740] + 32);
    long long v75 = v63;
    v64 = [(BCSDissolveEffectView *)self->_platterView layer];
    v71[4] = v76;
    v71[5] = v77;
    v71[6] = v78;
    v71[7] = v79;
    v71[0] = v72;
    v71[1] = v73;
    v71[2] = v74;
    v71[3] = v75;
    [v64 setTransform:v71];
  }
  else
  {
    [v25 setValues:&unk_26FCC6638];
    [v25 setKeyTimes:&unk_26FCC6650];
    [v25 setDuration:0.4];
    [v25 setRemovedOnCompletion:0];
    [v25 setFillMode:v20];
    v65 = [MEMORY[0x263F15808] functionWithName:v21];
    [v25 setTimingFunction:v65];

    v66 = [(BCSDissolveEffectView *)self->_platterView layer];
    [v66 addAnimation:v25 forKey:@"opacity"];

    v28 = [MEMORY[0x263F157D8] animationWithKeyPath:@"opacity"];
    [v28 setValues:&unk_26FCC6668];
    [v28 setKeyTimes:&unk_26FCC6680];
    [v28 setDuration:0.4];
    [v28 setRemovedOnCompletion:0];
    [v28 setFillMode:v20];
    v67 = [MEMORY[0x263F15808] functionWithName:v21];
    [v28 setTimingFunction:v67];

    long long v35 = [(UIVisualEffectView *)self->_blurView layer];
    [v35 addAnimation:v28 forKey:@"opacity"];
  }

  [MEMORY[0x263F158F8] commit];
}

uint64_t __62__BCSScanningAnimator__performSquareMeshTransform_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_performCircularMeshTransform:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  double v7 = self->_focusIndicator;
  _bcs_mainScreenScale();
  double v9 = v8;
  double v10 = [(UIView *)v7 layer];
  [v10 setRasterizationScale:v9];

  _bcs_mainScreenScale();
  double v12 = v11;
  double v13 = [(UIImageView *)self->_targetQRImage layer];
  [v13 setRasterizationScale:v12];

  _bcs_mainScreenScale();
  double v15 = v14;
  double v16 = [(UIView *)self->_backgroundView layer];
  [v16 setRasterizationScale:v15];

  [MEMORY[0x263F158F8] begin];
  uint64_t v17 = (void *)MEMORY[0x263F158F8];
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __64__BCSScanningAnimator__performCircularMeshTransform_completion___block_invoke;
  v35[3] = &unk_26524C250;
  id v18 = v6;
  id v36 = v18;
  [v17 setCompletionBlock:v35];
  [(BCSImageQuad *)self->_imageQuad bounds];
  double MidX = CGRectGetMidX(v37);
  [(BCSImageQuad *)self->_imageQuad bounds];
  double MidY = CGRectGetMidY(v38);
  if (!v4)
  {
    [(UIView *)v7 position];
    double v22 = v21;
    [(UIView *)v7 position];
    double MidX = (MidX + v22) * 0.5;
    double MidY = (MidY + v23) * 0.5;
  }
  -[BCSScanningAnimator _animateFocusIndicator:duration:position:](self, "_animateFocusIndicator:duration:position:", v4, 0.4, MidX, MidY);
  if (!v4)
  {
    long long v24 = [MEMORY[0x263F157D8] animationWithKeyPath:@"opacity"];
    [v24 setValues:&unk_26FCC66C8];
    [v24 setKeyTimes:&unk_26FCC66E0];
    [v24 setDuration:0.4];
    [v24 setRemovedOnCompletion:0];
    uint64_t v25 = *MEMORY[0x263F15AA8];
    [v24 setFillMode:*MEMORY[0x263F15AA8]];
    long long v26 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EC0]];
    [v24 setTimingFunction:v26];

    double v27 = [(UIView *)self->_circularContainerView layer];
    [v27 addAnimation:v24 forKey:@"opacity"];

    v28 = [MEMORY[0x263F157D8] animationWithKeyPath:@"opacity"];
    [v28 setValues:&unk_26FCC66F8];
    [v28 setKeyTimes:&unk_26FCC6710];
    [v28 setDuration:0.4];
    [v28 setRemovedOnCompletion:0];
    [v28 setFillMode:v25];
    uint64_t v29 = *MEMORY[0x263F15EB8];
    long long v30 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EB8]];
    [v28 setTimingFunction:v30];

    long long v31 = [(UIVisualEffectView *)self->_blurView layer];
    [v31 addAnimation:v28 forKey:@"opacity"];

    long long v32 = [MEMORY[0x263F15890] animationWithKeyPath:@"opacity"];
    [v32 setFromValue:&unk_26FCC64E0];
    [v32 setToValue:&unk_26FCC64F8];
    [v32 setDuration:0.4];
    [v32 setRemovedOnCompletion:0];
    [v32 setFillMode:v25];
    long long v33 = [MEMORY[0x263F15808] functionWithName:v29];
    [v32 setTimingFunction:v33];

    long long v34 = [(UIView *)v7 layer];
    [v34 addAnimation:v32 forKey:@"opacity"];

    [(BCSScanningAnimator *)self _animateCircularReveal];
  }
  [MEMORY[0x263F158F8] commit];
}

uint64_t __64__BCSScanningAnimator__performCircularMeshTransform_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_revealCircularView
{
  p_backgroundView = &self->_backgroundView;
  [(UIView *)self->_backgroundView removeFromSuperview];
  [(UIView *)*(p_backgroundView - 2) bounds];
  double Width = CGRectGetWidth(v33);
  double v5 = objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", 0.0, 0.0, Width, Width);
  [(UIView *)*(p_backgroundView - 2) bounds];
  double MidX = CGRectGetMidX(v34);
  [(UIView *)self->_circularContainerView bounds];
  objc_msgSend(v5, "setPosition:", MidX, CGRectGetMidY(v35));
  double v7 = [MEMORY[0x263F825C8] whiteColor];
  [v5 setBackgroundColor:v7];

  double v8 = [v5 layer];
  [v8 setCornerRadius:Width * 0.5];

  objc_storeStrong((id *)p_backgroundView, v5);
  [(UIView *)self->_circularContainerView insertSubview:v5 below:self->_circularEffectView];
  [(BCSScanningAnimator *)self _restPosition];
  double v10 = v9;
  double v12 = v11;
  double v13 = [(UIView *)self->_circularContainerView layer];
  objc_msgSend(v13, "setPosition:", v10, v12);

  long long v14 = *(_OWORD *)(MEMORY[0x263F15740] + 80);
  long long v29 = *(_OWORD *)(MEMORY[0x263F15740] + 64);
  long long v30 = v14;
  long long v15 = *(_OWORD *)(MEMORY[0x263F15740] + 112);
  long long v31 = *(_OWORD *)(MEMORY[0x263F15740] + 96);
  long long v32 = v15;
  long long v16 = *(_OWORD *)(MEMORY[0x263F15740] + 16);
  long long v25 = *MEMORY[0x263F15740];
  long long v26 = v16;
  long long v17 = *(_OWORD *)(MEMORY[0x263F15740] + 48);
  long long v27 = *(_OWORD *)(MEMORY[0x263F15740] + 32);
  long long v28 = v17;
  id v18 = [(UIView *)self->_circularContainerView layer];
  v24[4] = v29;
  v24[5] = v30;
  v24[6] = v31;
  v24[7] = v32;
  v24[0] = v25;
  v24[1] = v26;
  v24[2] = v27;
  v24[3] = v28;
  [v18 setTransform:v24];

  [(BCSScanningAnimator *)self _appclipCodeScaleFactor];
  CGAffineTransformMakeScale(&v23, v19, v20);
  circularEffectView = self->_circularEffectView;
  CGAffineTransform v22 = v23;
  [(BCSCircularEffectView *)circularEffectView setTransform:&v22];
  [(BCSCircularEffectView *)self->_circularEffectView revealCenterGlyphAndRings];
}

- (void)_animateCircularReveal
{
  double v3 = CACurrentMediaTime();
  [MEMORY[0x263F158F8] begin];
  v49[0] = MEMORY[0x263EF8330];
  v49[1] = 3221225472;
  v49[2] = __45__BCSScanningAnimator__animateCircularReveal__block_invoke;
  v49[3] = &unk_26524BFA8;
  v49[4] = self;
  [MEMORY[0x263F158F8] setCompletionBlock:v49];
  BOOL v4 = [MEMORY[0x263F15890] animationWithKeyPath:@"meshTransform"];
  [v4 setDamping:27.0];
  [v4 setStiffness:225.0];
  double v5 = [(BCSScanningAnimator *)self _meshTransform:0];
  [v4 setFromValue:v5];

  id v6 = [(BCSScanningAnimator *)self _meshTransform:1];
  [v4 setToValue:v6];

  [v4 setDuration:0.6];
  uint64_t v7 = *MEMORY[0x263F15AA8];
  [v4 setFillMode:*MEMORY[0x263F15AA8]];
  [v4 setRemovedOnCompletion:0];
  uint64_t v8 = *MEMORY[0x263F15EB8];
  double v9 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EB8]];
  [v4 setTimingFunction:v9];

  double v10 = [(UIImageView *)self->_targetQRImage layer];
  [v10 addAnimation:v4 forKey:@"meshTransform"];

  double v11 = [(BCSScanningAnimator *)self _meshTransform:1];
  double v12 = [(UIImageView *)self->_targetQRImage layer];
  [v12 setMeshTransform:v11];

  double v13 = [(UIView *)self->_backgroundView layer];
  [v13 addAnimation:v4 forKey:@"meshTransform"];

  long long v14 = [(BCSScanningAnimator *)self _meshTransform:1];
  long long v15 = [(UIView *)self->_backgroundView layer];
  [v15 setMeshTransform:v14];

  [(BCSScanningAnimator *)self _appclipCodeScaleFactor];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __45__BCSScanningAnimator__animateCircularReveal__block_invoke_2;
  aBlock[3] = &__block_descriptor_48_e16_v16__0__UIView_8l;
  aBlock[4] = v16;
  aBlock[5] = v17;
  id v18 = (void (**)(void *, BCSCircularEffectView *))_Block_copy(aBlock);
  v18[2](v18, self->_circularEffectView);
  v18[2](v18, (BCSCircularEffectView *)self->_backgroundView);
  v18[2](v18, (BCSCircularEffectView *)self->_targetQRImage);
  CGFloat v19 = [MEMORY[0x263F15760] animationWithKeyPath:@"transform.scale"];
  [v19 setFromValue:&unk_26FCC64E0];
  [v19 setToValue:&unk_26FCC64F8];
  [v19 setDuration:0.4];
  [v19 setBeginTime:v3 + 0.2];
  [v19 setFillMode:v7];
  [v19 setRemovedOnCompletion:0];
  CGFloat v20 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EC0]];
  [v19 setTimingFunction:v20];

  [(CALayer *)self->_ringLayer addAnimation:v19 forKey:@"transform.scale"];
  double v21 = [MEMORY[0x263F15890] animationWithKeyPath:@"position"];
  [v21 setDamping:27.0];
  [v21 setStiffness:225.0];
  CGAffineTransform v22 = (void *)MEMORY[0x263F08D40];
  CGAffineTransform v23 = [(UIView *)self->_circularContainerView layer];
  [v23 position];
  long long v24 = objc_msgSend(v22, "valueWithCGPoint:");
  [v21 setFromValue:v24];

  long long v25 = (void *)MEMORY[0x263F08D40];
  [(BCSScanningAnimator *)self _restPosition];
  long long v26 = objc_msgSend(v25, "valueWithCGPoint:");
  [v21 setToValue:v26];

  [v21 setDuration:0.6];
  [v21 setFillMode:v7];
  [v21 setRemovedOnCompletion:0];
  long long v27 = [MEMORY[0x263F15808] functionWithName:v8];
  [v21 setTimingFunction:v27];

  long long v28 = [(UIView *)self->_circularContainerView layer];
  [v28 addAnimation:v21 forKey:@"position"];

  [MEMORY[0x263F158F8] commit];
  [(BCSCircularEffectView *)self->_circularEffectView animateCenterGlyphAndRings];
  [(BCSScanningAnimator *)self _restPosition];
  double v30 = v29;
  double v32 = v31;
  CGRect v33 = [(UIView *)self->_circularContainerView layer];
  objc_msgSend(v33, "setPosition:", v30, v32);

  long long v34 = *(_OWORD *)(MEMORY[0x263F15740] + 80);
  long long v44 = *(_OWORD *)(MEMORY[0x263F15740] + 64);
  long long v45 = v34;
  long long v35 = *(_OWORD *)(MEMORY[0x263F15740] + 112);
  long long v46 = *(_OWORD *)(MEMORY[0x263F15740] + 96);
  long long v47 = v35;
  long long v36 = *(_OWORD *)(MEMORY[0x263F15740] + 16);
  long long v40 = *MEMORY[0x263F15740];
  long long v41 = v36;
  long long v37 = *(_OWORD *)(MEMORY[0x263F15740] + 48);
  long long v42 = *(_OWORD *)(MEMORY[0x263F15740] + 32);
  long long v43 = v37;
  CGRect v38 = [(UIView *)self->_circularContainerView layer];
  v39[4] = v44;
  v39[5] = v45;
  v39[6] = v46;
  v39[7] = v47;
  v39[0] = v40;
  v39[1] = v41;
  v39[2] = v42;
  v39[3] = v43;
  [v38 setTransform:v39];
}

void __45__BCSScanningAnimator__animateCircularReveal__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 32) bounds];
  double Width = CGRectGetWidth(v10);
  double v3 = objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", 0.0, 0.0, Width, Width);
  [*(id *)(*(void *)(a1 + 32) + 32) bounds];
  double MidX = CGRectGetMidX(v11);
  [*(id *)(*(void *)(a1 + 32) + 32) bounds];
  objc_msgSend(v3, "setPosition:", MidX, CGRectGetMidY(v12));
  double v5 = [MEMORY[0x263F825C8] whiteColor];
  [v3 setBackgroundColor:v5];

  id v6 = [v3 layer];
  [v6 setCornerRadius:Width * 0.5];

  [*(id *)(*(void *)(a1 + 32) + 48) removeFromSuperview];
  [*(id *)(*(void *)(a1 + 32) + 32) insertSubview:v3 below:*(void *)(*(void *)(a1 + 32) + 56)];
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void **)(v7 + 48);
  *(void *)(v7 + 48) = v3;
}

void __45__BCSScanningAnimator__animateCircularReveal__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [MEMORY[0x263F15890] animationWithKeyPath:@"transform.scale.x"];
  [v4 setDamping:27.0];
  [v4 setStiffness:225.0];
  double v5 = NSNumber;
  if (v3)
  {
    [v3 transform];
    double v6 = *(double *)&v20;
  }
  else
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    double v6 = 0.0;
  }
  uint64_t v7 = objc_msgSend(v5, "numberWithDouble:", v6, v20, (void)v22);
  [v4 setFromValue:v7];

  uint64_t v8 = [NSNumber numberWithDouble:*(double *)(a1 + 32)];
  [v4 setToValue:v8];

  [v4 setDuration:0.6];
  uint64_t v9 = *MEMORY[0x263F15AA8];
  [v4 setFillMode:*MEMORY[0x263F15AA8]];
  [v4 setRemovedOnCompletion:0];
  uint64_t v10 = *MEMORY[0x263F15EB8];
  CGRect v11 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EB8]];
  [v4 setTimingFunction:v11];

  CGRect v12 = [v3 layer];
  [v12 addAnimation:v4 forKey:@"transform.scale.x"];

  double v13 = [MEMORY[0x263F15890] animationWithKeyPath:@"transform.scale.y"];
  [v13 setDamping:27.0];
  [v13 setStiffness:225.0];
  long long v14 = NSNumber;
  if (v3)
  {
    [v3 transform];
    double v15 = *((double *)&v22 + 1);
  }
  else
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v21 = 0u;
    double v15 = 0.0;
  }
  uint64_t v16 = objc_msgSend(v14, "numberWithDouble:", v15, v21, v22, v23);
  [v13 setFromValue:v16];

  uint64_t v17 = [NSNumber numberWithDouble:*(double *)(a1 + 40)];
  [v13 setToValue:v17];

  [v13 setDuration:0.6];
  [v13 setFillMode:v9];
  [v13 setRemovedOnCompletion:0];
  id v18 = [MEMORY[0x263F15808] functionWithName:v10];
  [v13 setTimingFunction:v18];

  CGFloat v19 = [v3 layer];
  [v19 addAnimation:v13 forKey:@"transform.scale.y"];
}

- (void)_setUpBlurViewIfNeeded
{
  v24[4] = *MEMORY[0x263EF8340];
  if (!self->_blurView)
  {
    id v3 = [(UIView *)self->_focusIndicator superview];
    platterView = self->_platterView;
    if (!platterView) {
      platterView = (BCSDissolveEffectView *)self->_circularContainerView;
    }
    long long v22 = platterView;
    long long v23 = [MEMORY[0x263F824D8] _effectWithBlurRadius:10.0 scale:0.25];
    double v5 = (UIVisualEffectView *)[objc_alloc(MEMORY[0x263F82E50]) initWithEffect:v23];
    blurView = self->_blurView;
    self->_blurView = v5;

    [(UIVisualEffectView *)self->_blurView setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v7 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.3];
    [(UIVisualEffectView *)self->_blurView setBackgroundColor:v7];

    [v3 insertSubview:self->_blurView below:v22];
    uint64_t v8 = (void *)MEMORY[0x263F08938];
    long long v21 = [(UIVisualEffectView *)self->_blurView topAnchor];
    CGFloat v19 = [v3 topAnchor];
    id v18 = objc_msgSend(v21, "constraintEqualToAnchor:");
    v24[0] = v18;
    long long v20 = [(UIVisualEffectView *)self->_blurView bottomAnchor];
    uint64_t v17 = [v3 bottomAnchor];
    uint64_t v16 = objc_msgSend(v20, "constraintEqualToAnchor:");
    v24[1] = v16;
    uint64_t v9 = [(UIVisualEffectView *)self->_blurView leftAnchor];
    uint64_t v10 = [v3 leftAnchor];
    CGRect v11 = [v9 constraintEqualToAnchor:v10];
    v24[2] = v11;
    CGRect v12 = [(UIVisualEffectView *)self->_blurView rightAnchor];
    double v13 = [v3 rightAnchor];
    long long v14 = [v12 constraintEqualToAnchor:v13];
    v24[3] = v14;
    double v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:4];
    [v8 activateConstraints:v15];

    [(UIVisualEffectView *)self->_blurView setAlpha:0.0];
  }
}

- (void)animatePushWithCompletion:(id)a3 shouldAnimate:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = [(UIView *)self->_focusIndicator superview];
  if (!self->_platterView)
  {
    uint64_t v8 = [BCSDissolveEffectView alloc];
    [(BCSScanningAnimator *)self _platterInitialFrameWithDefaultSize:144.0];
    uint64_t v9 = -[BCSDissolveEffectView initWithFrame:](v8, "initWithFrame:");
    platterView = self->_platterView;
    self->_platterView = v9;

    [(BCSDissolveEffectView *)self->_platterView setContentView:self->_targetQRImage];
    [(BCSDissolveEffectView *)self->_platterView setAutoresizingMask:45];
    [(BCSDissolveEffectView *)self->_platterView bounds];
    double MidX = CGRectGetMidX(v16);
    [(BCSDissolveEffectView *)self->_platterView bounds];
    -[UIImageView setPosition:](self->_targetQRImage, "setPosition:", MidX, CGRectGetMidY(v17));
    [(BCSDissolveEffectView *)self->_platterView addSubview:self->_targetQRImage];
    [v7 insertSubview:self->_platterView below:self->_focusIndicator];
  }
  CGRect v12 = [(BCSScanningAnimator *)self _meshTransform:0];
  double v13 = [(UIImageView *)self->_targetQRImage layer];
  [v13 setMeshTransform:v12];

  [(BCSScanningAnimator *)self _setUpBlurViewIfNeeded];
  if (a4)
  {
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __63__BCSScanningAnimator_animatePushWithCompletion_shouldAnimate___block_invoke;
    v14[3] = &unk_26524C298;
    id v15 = v6;
    [(BCSScanningAnimator *)self _performSquareMeshTransform:0 completion:v14];
  }
  else
  {
    [(BCSScanningAnimator *)self _performSquareMeshTransformWithoutAnimating];
    [(UIVisualEffectView *)self->_blurView setAlpha:1.0];
    (*((void (**)(id, uint64_t))v6 + 2))(v6, 1);
  }
}

uint64_t __63__BCSScanningAnimator_animatePushWithCompletion_shouldAnimate___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)animatePopWithAppImageBlock:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __62__BCSScanningAnimator_animatePopWithAppImageBlock_completion___block_invoke;
  v10[3] = &unk_26524C2E8;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(BCSScanningAnimator *)self _performSquareMeshTransform:1 completion:v10];
}

void __62__BCSScanningAnimator_animatePopWithAppImageBlock_completion___block_invoke(uint64_t a1, char a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  BOOL v4 = *(void **)(*(void *)(a1 + 32) + 16);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __62__BCSScanningAnimator_animatePopWithAppImageBlock_completion___block_invoke_2;
  v5[3] = &unk_26524C2C0;
  id v6 = *(id *)(a1 + 48);
  char v7 = a2;
  [v4 startAnimationWithDuration:v3 appImageBlock:v5 completion:0.4];
}

uint64_t __62__BCSScanningAnimator_animatePopWithAppImageBlock_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)animateAppClipCodeBounceWithCompletion:(id)a3 shouldAnimate:(BOOL)a4
{
  id v6 = a3;
  char v7 = [(UIView *)self->_focusIndicator superview];
  if (!self->_circularContainerView)
  {
    id v8 = objc_alloc(MEMORY[0x263F82E00]);
    [(BCSScanningAnimator *)self _platterInitialFrameWithDefaultSize:200.0];
    id v9 = (UIView *)objc_msgSend(v8, "initWithFrame:");
    circularContainerView = self->_circularContainerView;
    self->_circularContainerView = v9;

    [(UIView *)self->_circularContainerView setAutoresizingMask:45];
    [(UIView *)self->_circularContainerView setAccessibilityIgnoresInvertColors:1];
    [(UIView *)self->_circularContainerView bounds];
    double MidX = CGRectGetMidX(v42);
    [(UIView *)self->_circularContainerView bounds];
    -[UIImageView setPosition:](self->_targetQRImage, "setPosition:", MidX, CGRectGetMidY(v43));
    [(UIView *)self->_circularContainerView addSubview:self->_targetQRImage];
    [v7 insertSubview:self->_circularContainerView below:self->_focusIndicator];
  }
  id v12 = [(BCSScanningAnimator *)self _meshTransform:0];
  double v13 = [(UIImageView *)self->_targetQRImage layer];
  [v13 setMeshTransform:v12];

  [(UIImageView *)self->_targetQRImage bounds];
  double Width = CGRectGetWidth(v44);
  id v15 = objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", 0.0, 0.0, Width, Width);
  [(UIImageView *)self->_targetQRImage position];
  objc_msgSend(v15, "setPosition:");
  CGRect v16 = [MEMORY[0x263F825C8] whiteColor];
  [v15 setBackgroundColor:v16];

  CGRect v17 = [v15 layer];
  double v18 = Width * 0.5;
  [v17 setCornerRadius:v18];

  targetQRImage = self->_targetQRImage;
  if (targetQRImage)
  {
    [(UIImageView *)targetQRImage transform];
  }
  else
  {
    long long v40 = 0u;
    long long v41 = 0u;
    long long v39 = 0u;
  }
  v38[0] = v39;
  v38[1] = v40;
  v38[2] = v41;
  [v15 setTransform:v38];
  [(UIView *)self->_circularContainerView addSubview:v15];
  objc_storeStrong((id *)&self->_backgroundView, v15);
  id v20 = objc_alloc(MEMORY[0x263F82E00]);
  [v15 bounds];
  long long v21 = objc_msgSend(v20, "initWithFrame:");
  long long v22 = [v21 layer];
  [v22 setCornerRadius:v18];

  long long v23 = [MEMORY[0x263F825C8] whiteColor];
  [v21 setBackgroundColor:v23];

  [v15 addSubview:v21];
  long long v24 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15B90]];
  long long v25 = [v21 layer];
  [v25 setCompositingFilter:v24];

  long long v26 = [v21 layer];
  ringLayer = self->_ringLayer;
  self->_ringLayer = v26;

  long long v28 = [(BCSScanningAnimator *)self _meshTransform:0];
  double v29 = [v15 layer];
  [v29 setMeshTransform:v28];

  double v30 = [BCSCircularEffectView alloc];
  [(UIImageView *)self->_targetQRImage bounds];
  double v31 = -[BCSCircularEffectView initWithFrame:](v30, "initWithFrame:");
  circularEffectView = self->_circularEffectView;
  self->_circularEffectView = v31;

  [(UIView *)self->_circularContainerView addSubview:self->_circularEffectView];
  [(UIImageView *)self->_targetQRImage position];
  -[BCSCircularEffectView setPosition:](self->_circularEffectView, "setPosition:");
  [(BCSScanningAnimator *)self _setUpBlurViewIfNeeded];
  if (a4)
  {
    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __76__BCSScanningAnimator_animateAppClipCodeBounceWithCompletion_shouldAnimate___block_invoke;
    v34[3] = &unk_26524C310;
    v34[4] = self;
    id v35 = v6;
    [(BCSScanningAnimator *)self _performCircularMeshTransform:0 completion:v34];
  }
  else
  {
    CGAffineTransformMakeScale(&v37, 0.0, 0.0);
    focusIndicator = self->_focusIndicator;
    CGAffineTransform v36 = v37;
    [(UIView *)focusIndicator setTransform:&v36];
    [(BCSScanningAnimator *)self _revealCircularView];
    (*((void (**)(id, uint64_t))v6 + 2))(v6, 1);
  }
}

void __76__BCSScanningAnimator_animateAppClipCodeBounceWithCompletion_shouldAnimate___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    v2 = *(void **)(*(void *)(a1 + 32) + 56);
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __76__BCSScanningAnimator_animateAppClipCodeBounceWithCompletion_shouldAnimate___block_invoke_2;
    v3[3] = &unk_26524C298;
    id v4 = *(id *)(a1 + 40);
    [v2 animateRingsRotationWithCompletion:v3];
  }
}

uint64_t __76__BCSScanningAnimator_animateAppClipCodeBounceWithCompletion_shouldAnimate___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)prepareCenterGlyphWithImage:(id)a3
{
}

- (void)showCoverView
{
  if (!self->_coverView && !self->_suppressCoverView)
  {
    uint64_t v3 = [(UIView *)self->_focusIndicator superview];
    id v4 = [MEMORY[0x263F824D8] _effectWithBlurRadius:10.0 scale:0.35];
    id v5 = objc_alloc(MEMORY[0x263F82E50]);
    id v6 = (UIVisualEffectView *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    coverView = self->_coverView;
    self->_coverView = v6;

    [(UIVisualEffectView *)self->_coverView setAutoresizingMask:18];
    [(UIVisualEffectView *)self->_blurView frame];
    -[UIVisualEffectView setFrame:](self->_coverView, "setFrame:");
    [v3 addSubview:self->_coverView];
    id v8 = (void *)MEMORY[0x263F82E00];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __36__BCSScanningAnimator_showCoverView__block_invoke;
    v10[3] = &unk_26524C338;
    v10[4] = self;
    id v9 = v4;
    id v11 = v9;
    [v8 animateWithDuration:v10 animations:0.35];
  }
}

uint64_t __36__BCSScanningAnimator_showCoverView__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) setEffect:*(void *)(a1 + 40)];
}

- (void)reset
{
  [(UIVisualEffectView *)self->_blurView removeFromSuperview];
  blurView = self->_blurView;
  self->_blurView = 0;

  [(BCSDissolveEffectView *)self->_platterView removeFromSuperview];
  platterView = self->_platterView;
  self->_platterView = 0;

  [(UIVisualEffectView *)self->_coverView removeFromSuperview];
  coverView = self->_coverView;
  self->_coverView = 0;

  [(UIView *)self->_circularContainerView removeFromSuperview];
  circularContainerView = self->_circularContainerView;
  self->_circularContainerView = 0;
}

- (UIView)focusIndicator
{
  return self->_focusIndicator;
}

- (void)setFocusIndicator:(id)a3
{
}

- (BCSImageQuad)imageQuad
{
  return self->_imageQuad;
}

- (void)setImageQuad:(id)a3
{
}

- (UIImageView)targetQRImage
{
  return self->_targetQRImage;
}

- (void)setTargetQRImage:(id)a3
{
}

- (BCSVisualCode)targetCode
{
  return self->_targetCode;
}

- (void)setTargetCode:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetCode, 0);
  objc_storeStrong((id *)&self->_targetQRImage, 0);
  objc_storeStrong((id *)&self->_imageQuad, 0);
  objc_storeStrong((id *)&self->_focusIndicator, 0);
  objc_storeStrong((id *)&self->_circularEffectView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_ringLayer, 0);
  objc_storeStrong((id *)&self->_circularContainerView, 0);
  objc_storeStrong((id *)&self->_coverView, 0);
  objc_storeStrong((id *)&self->_platterView, 0);

  objc_storeStrong((id *)&self->_blurView, 0);
}

@end