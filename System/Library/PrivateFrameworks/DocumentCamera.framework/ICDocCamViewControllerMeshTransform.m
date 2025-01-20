@interface ICDocCamViewControllerMeshTransform
- (CGRect)frameForImageInImageViewFrame:(CGRect)a3;
- (CGRect)imageViewFrame;
- (CGRect)previewViewFrame;
- (CGSize)imageSize;
- (ICDocCamImageQuad)imageQuad;
- (ICDocCamViewControllerMeshTransform)initWithImage:(id)a3 backgroundImage:(id)a4 imageViewFrame:(CGRect)a5 view:(id)a6 imageQuad:(id)a7 previewView:(id)a8 previewBounds:(CGRect)a9 scrimView:(id)a10;
- (UIImageView)animationImageView;
- (UIView)scrimView;
- (id)imageMeshAnimationCompletionBlock;
- (id)imageMeshTransformWithImageQuad:(id)a3 imageViewFrame:(CGRect)a4 previewBounds:(CGRect)a5 finalTransform:(BOOL)a6;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)hide;
- (void)setAnimationImageView:(id)a3;
- (void)setImageMeshAnimationCompletionBlock:(id)a3;
- (void)setImageQuad:(id)a3;
- (void)setImageSize:(CGSize)a3;
- (void)setImageViewFrame:(CGRect)a3;
- (void)setPreviewViewFrame:(CGRect)a3;
- (void)setScrimView:(id)a3;
- (void)startWithCompletionBlock:(id)a3;
@end

@implementation ICDocCamViewControllerMeshTransform

- (ICDocCamViewControllerMeshTransform)initWithImage:(id)a3 backgroundImage:(id)a4 imageViewFrame:(CGRect)a5 view:(id)a6 imageQuad:(id)a7 previewView:(id)a8 previewBounds:(CGRect)a9 scrimView:(id)a10
{
  double height = a9.size.height;
  double width = a9.size.width;
  double y = a9.origin.y;
  double x = a9.origin.x;
  double v17 = a5.size.height;
  double v18 = a5.size.width;
  double v19 = a5.origin.y;
  double v20 = a5.origin.x;
  id v22 = a3;
  id v23 = a6;
  id v24 = a7;
  id v25 = a10;
  v44.receiver = self;
  v44.super_class = (Class)ICDocCamViewControllerMeshTransform;
  v26 = [(ICDocCamViewControllerMeshTransform *)&v44 init];
  v27 = v26;
  if (v26)
  {
    -[ICDocCamViewControllerMeshTransform setImageViewFrame:](v26, "setImageViewFrame:", v20, v19, v18, v17);
    [(ICDocCamViewControllerMeshTransform *)v27 setImageQuad:v24];
    -[ICDocCamViewControllerMeshTransform setPreviewViewFrame:](v27, "setPreviewViewFrame:", x, y, width, height);
    id v28 = objc_alloc(MEMORY[0x263F1C6D0]);
    [v23 bounds];
    v29 = objc_msgSend(v28, "initWithFrame:");
    [(ICDocCamViewControllerMeshTransform *)v27 setAnimationImageView:v29];

    v30 = [(ICDocCamViewControllerMeshTransform *)v27 animationImageView];
    [v30 setContentMode:0];

    v31 = [(ICDocCamViewControllerMeshTransform *)v27 animationImageView];
    v32 = [v31 layer];
    LODWORD(v33) = 1.0;
    [v32 setOpacity:v33];

    v34 = [(ICDocCamViewControllerMeshTransform *)v27 animationImageView];
    [v34 setImage:v22];

    v35 = [(ICDocCamViewControllerMeshTransform *)v27 animationImageView];
    [v35 setHidden:0];

    [(ICDocCamViewControllerMeshTransform *)v27 setScrimView:v25];
    v36 = [MEMORY[0x263F1C550] colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
    v37 = [(ICDocCamViewControllerMeshTransform *)v27 scrimView];
    [v37 setBackgroundColor:v36];

    v38 = [(ICDocCamViewControllerMeshTransform *)v27 scrimView];
    v39 = [v38 layer];
    [v39 setOpacity:0.0];

    v40 = [(ICDocCamViewControllerMeshTransform *)v27 scrimView];
    [v40 setHidden:0];

    v41 = [(ICDocCamViewControllerMeshTransform *)v27 animationImageView];
    v42 = [(ICDocCamViewControllerMeshTransform *)v27 scrimView];
    [v23 insertSubview:v41 aboveSubview:v42];
  }
  return v27;
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  v5 = [(ICDocCamViewControllerMeshTransform *)self scrimView];
  v6 = [v5 layer];
  [v6 removeAllAnimations];

  id v20 = [MEMORY[0x263F15760] animationWithKeyPath:@"opacity"];
  [v20 setDuration:0.32];
  LODWORD(v7) = 1051361018;
  LODWORD(v8) = 1.0;
  LODWORD(v9) = 1045220557;
  v10 = [MEMORY[0x263F15808] functionWithControlPoints:v7 :0.0 :v9 :v8];
  [v20 setTimingFunction:v10];

  LODWORD(v11) = 1045220557;
  v12 = [NSNumber numberWithFloat:v11];
  [v20 setFromValue:v12];

  v13 = [NSNumber numberWithFloat:0.0];
  [v20 setToValue:v13];

  [v20 setFillMode:*MEMORY[0x263F15AA8]];
  [v20 setRemovedOnCompletion:0];
  v14 = [(ICDocCamViewControllerMeshTransform *)self scrimView];
  v15 = [v14 layer];
  [v15 addAnimation:v20 forKey:@"three"];

  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  v16 = [(ICDocCamViewControllerMeshTransform *)self scrimView];
  double v17 = [v16 layer];
  [v17 setOpacity:0.0];

  [MEMORY[0x263F158F8] commit];
  double v18 = [(ICDocCamViewControllerMeshTransform *)self imageMeshAnimationCompletionBlock];

  if (v18)
  {
    double v19 = [(ICDocCamViewControllerMeshTransform *)self imageMeshAnimationCompletionBlock];
    v19[2]();

    [(ICDocCamViewControllerMeshTransform *)self setImageMeshAnimationCompletionBlock:0];
  }
}

- (void)hide
{
  v3 = [(ICDocCamViewControllerMeshTransform *)self animationImageView];
  [v3 removeFromSuperview];

  v4 = [(ICDocCamViewControllerMeshTransform *)self animationImageView];
  [v4 setHidden:1];

  v5 = [(ICDocCamViewControllerMeshTransform *)self animationImageView];
  [v5 setImage:0];

  [(ICDocCamViewControllerMeshTransform *)self setAnimationImageView:0];
}

- (CGRect)frameForImageInImageViewFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v7 = (void *)MEMORY[0x263F1C6B0];
  double v8 = [(ICDocCamViewControllerMeshTransform *)self animationImageView];
  double v9 = [v8 image];
  [v9 size];
  objc_msgSend(v7, "dc_aspectFitImageFrameForViewWithFrame:imageSize:", x, y, width, height, v10, v11);
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;

  double v20 = v13;
  double v21 = v15;
  double v22 = v17;
  double v23 = v19;
  result.size.double height = v23;
  result.size.double width = v22;
  result.origin.double y = v21;
  result.origin.double x = v20;
  return result;
}

- (void)startWithCompletionBlock:(id)a3
{
  v35[2] = *MEMORY[0x263EF8340];
  [(ICDocCamViewControllerMeshTransform *)self setImageMeshAnimationCompletionBlock:a3];
  v4 = [MEMORY[0x263F15750] animation];
  [v4 setDelegate:self];
  [v4 setDuration:0.8];
  [v4 setAnimations:MEMORY[0x263EFFA68]];
  uint64_t v5 = *MEMORY[0x263F15AA8];
  [v4 setFillMode:*MEMORY[0x263F15AA8]];
  v6 = [MEMORY[0x263F15760] animationWithKeyPath:@"meshTransform"];
  [(ICDocCamViewControllerMeshTransform *)self previewViewFrame];
  double v7 = [(ICDocCamViewControllerMeshTransform *)self imageQuad];
  [(ICDocCamViewControllerMeshTransform *)self imageViewFrame];
  double v8 = -[ICDocCamViewControllerMeshTransform imageMeshTransformWithImageQuad:imageViewFrame:previewBounds:finalTransform:](self, "imageMeshTransformWithImageQuad:imageViewFrame:previewBounds:finalTransform:", v7, 0);
  [v6 setFromValue:v8];

  [(ICDocCamViewControllerMeshTransform *)self imageViewFrame];
  double v9 = -[ICDocCamViewControllerMeshTransform imageMeshTransformWithImageQuad:imageViewFrame:previewBounds:finalTransform:](self, "imageMeshTransformWithImageQuad:imageViewFrame:previewBounds:finalTransform:", v7, 1);
  [v6 setToValue:v9];

  [v6 setDuration:0.45];
  [v6 setFillMode:v5];
  LODWORD(v10) = 1.0;
  LODWORD(v11) = 1051361018;
  LODWORD(v12) = 1045220557;
  double v13 = [MEMORY[0x263F15808] functionWithControlPoints:v11 :0.0 :v12 :v10];
  [v6 setTimingFunction:v13];

  double v14 = [MEMORY[0x263F157D8] animationWithKeyPath:@"opacity"];
  [v14 setFillMode:v5];
  [v14 setKeyTimes:&unk_26C7ED970];
  [v14 setValues:&unk_26C7ED988];
  [v14 setDuration:0.55];
  double v15 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EB8]];
  [v14 setTimingFunction:v15];

  v35[0] = v6;
  v35[1] = v14;
  double v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:2];
  [v4 setAnimations:v16];

  double v17 = [(ICDocCamViewControllerMeshTransform *)self animationImageView];
  double v18 = [v17 layer];
  [v18 addAnimation:v4 forKey:@"one"];

  double v19 = [MEMORY[0x263F15760] animationWithKeyPath:@"opacity"];
  [v19 setDuration:0.32];
  LODWORD(v20) = 1.0;
  LODWORD(v21) = 1051361018;
  LODWORD(v22) = 1045220557;
  double v23 = [MEMORY[0x263F15808] functionWithControlPoints:v21 :0.0 :v22 :v20];
  [v19 setTimingFunction:v23];

  id v24 = [NSNumber numberWithFloat:0.0];
  [v19 setFromValue:v24];

  LODWORD(v25) = 1045220557;
  v26 = [NSNumber numberWithFloat:v25];
  [v19 setToValue:v26];

  [v19 setFillMode:v5];
  [v19 setRemovedOnCompletion:0];
  v27 = [(ICDocCamViewControllerMeshTransform *)self scrimView];
  id v28 = [v27 layer];
  [v28 addAnimation:v19 forKey:@"two"];

  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  v29 = [v6 toValue];
  v30 = [(ICDocCamViewControllerMeshTransform *)self animationImageView];
  v31 = [v30 layer];
  [v31 setMeshTransform:v29];

  [MEMORY[0x263F158F8] commit];
  v32 = [(ICDocCamViewControllerMeshTransform *)self scrimView];
  double v33 = [v32 layer];
  LODWORD(v34) = 1045220557;
  [v33 setOpacity:v34];
}

- (id)imageMeshTransformWithImageQuad:(id)a3 imageViewFrame:(CGRect)a4 previewBounds:(CGRect)a5 finalTransform:(BOOL)a6
{
  BOOL v6 = a6;
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  double v11 = a4.size.height;
  double v12 = a4.size.width;
  double v13 = a4.origin.y;
  double v14 = a4.origin.x;
  uint64_t v101 = *MEMORY[0x263EF8340];
  id v16 = a3;
  double v17 = [MEMORY[0x263F15830] meshTransform];
  if (v6)
  {
    -[ICDocCamViewControllerMeshTransform frameForImageInImageViewFrame:](self, "frameForImageInImageViewFrame:", v14, v13, v12, v11);
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    CGFloat v23 = v22;
    CGFloat v25 = v24;
    CGFloat v79 = v24;
    v26 = [(ICDocCamViewControllerMeshTransform *)self animationImageView];
    [v26 bounds];
    CGFloat v28 = v27;
    CGFloat v30 = v29;
    CGFloat v81 = v29;
    CGFloat v32 = v31;
    CGFloat v34 = v33;

    v103.origin.CGFloat x = v19;
    v103.origin.CGFloat y = v21;
    v103.size.CGFloat width = v23;
    v103.size.CGFloat height = v25;
    double MinX = CGRectGetMinX(v103);
    v104.origin.CGFloat x = v28;
    v104.origin.CGFloat y = v30;
    v104.size.CGFloat width = v32;
    v104.size.CGFloat height = v34;
    double v88 = MinX / CGRectGetWidth(v104);
    v105.origin.CGFloat x = v19;
    v105.origin.CGFloat y = v21;
    v105.size.CGFloat width = v23;
    v105.size.CGFloat height = v79;
    double MaxX = CGRectGetMaxX(v105);
    v106.origin.CGFloat x = v28;
    v106.origin.CGFloat y = v81;
    v106.size.CGFloat width = v32;
    v106.size.CGFloat height = v34;
    double v86 = MaxX / CGRectGetWidth(v106);
    v107.origin.CGFloat x = v19;
    CGFloat v37 = v19;
    v107.origin.CGFloat y = v21;
    v107.size.CGFloat width = v23;
    v107.size.CGFloat height = v79;
    double MinY = CGRectGetMinY(v107);
    v108.origin.CGFloat x = v28;
    v108.origin.CGFloat y = v81;
    v108.size.CGFloat width = v32;
    v108.size.CGFloat height = v34;
    double v84 = MinY / CGRectGetHeight(v108);
    v109.origin.CGFloat x = v37;
    v109.origin.CGFloat y = v21;
    v109.size.CGFloat width = v23;
    v109.size.CGFloat height = v79;
    double MaxY = CGRectGetMaxY(v109);
    v110.origin.CGFloat x = v28;
    v110.origin.CGFloat y = v81;
    v110.size.CGFloat width = v32;
    v110.size.CGFloat height = v34;
    long long v94 = xmmword_21791AA30;
    double v40 = MaxY / CGRectGetHeight(v110);
    double v95 = v88;
    double v96 = v40;
    double v97 = 0.0;
    [v17 addVertex:&v94];
    __asm { FMOV            V0.2D, #1.0 }
    long long v94 = _Q0;
    double v95 = v86;
    double v96 = v40;
    double v97 = 0.0;
    [v17 addVertex:&v94];
    long long v94 = xmmword_21791AA40;
    double v95 = v86;
    double v96 = v84;
    double v97 = 0.0;
    [v17 addVertex:&v94];
    long long v94 = 0uLL;
    double v95 = v88;
    double v96 = v84;
    double v97 = 0.0;
    v46 = &v94;
  }
  else
  {
    [v16 bottomLeft];
    uint64_t v85 = v48;
    uint64_t v87 = v47;
    [v16 bottomRight];
    double v80 = v50;
    double v82 = v49;
    [v16 topRight];
    double v89 = x;
    double v52 = v51;
    double rect = width;
    double v54 = v53;
    [v16 topLeft];
    double v55 = height;
    double v57 = v56;
    double v58 = y;
    double v60 = v59;
    v61 = [(ICDocCamViewControllerMeshTransform *)self animationImageView];
    [v61 bounds];
    double v63 = v62;
    double v65 = v64;

    uint64_t v66 = 0;
    *(void *)&long long v94 = v87;
    *((void *)&v94 + 1) = v85;
    double v95 = v82;
    double v96 = v80;
    double v97 = v52;
    double v98 = v54;
    double v99 = v57;
    double v100 = v60;
    v67.f64[0] = rect / v63;
    v67.f64[1] = v55 / v65;
    v68.f64[0] = v89 / v63;
    v68.f64[1] = v58 / v65;
    do
    {
      v69 = (float64x2_t *)((char *)&v94 + v66);
      float64x2_t v70 = vaddq_f64(v68, vmulq_f64(v67, *(float64x2_t *)((char *)&v94 + v66 + 16)));
      float64x2_t *v69 = vaddq_f64(v68, vmulq_f64(v67, *(float64x2_t *)((char *)&v94 + v66)));
      v69[1] = v70;
      v66 += 32;
    }
    while (v66 != 64);
    double v71 = v95;
    double v72 = v97;
    double v73 = v99;
    double v74 = 1.0 - v96;
    double v75 = 1.0 - v98;
    double v76 = 1.0 - v100;
    long long v90 = xmmword_21791AA30;
    double v91 = *(double *)&v94;
    double v92 = 1.0 - *((double *)&v94 + 1);
    uint64_t v93 = 0;
    [v17 addVertex:&v90];
    __asm { FMOV            V0.2D, #1.0 }
    long long v90 = _Q0;
    double v91 = v71;
    double v92 = v74;
    uint64_t v93 = 0;
    [v17 addVertex:&v90];
    long long v90 = xmmword_21791AA40;
    double v91 = v72;
    double v92 = v75;
    uint64_t v93 = 0;
    [v17 addVertex:&v90];
    long long v90 = 0uLL;
    double v91 = v73;
    double v92 = v76;
    uint64_t v93 = 0;
    v46 = &v90;
  }
  [v17 addVertex:v46];
  double v95 = 0.0;
  double v96 = 0.0;
  long long v94 = xmmword_21791AA50;
  [v17 addFace:&v94];
  [v17 setSubdivisionSteps:0];

  return v17;
}

- (UIImageView)animationImageView
{
  return self->_animationImageView;
}

- (void)setAnimationImageView:(id)a3
{
}

- (UIView)scrimView
{
  return self->_scrimView;
}

- (void)setScrimView:(id)a3
{
}

- (CGRect)imageViewFrame
{
  double x = self->_imageViewFrame.origin.x;
  double y = self->_imageViewFrame.origin.y;
  double width = self->_imageViewFrame.size.width;
  double height = self->_imageViewFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setImageViewFrame:(CGRect)a3
{
  self->_imageViewFrame = a3;
}

- (CGRect)previewViewFrame
{
  double x = self->_previewViewFrame.origin.x;
  double y = self->_previewViewFrame.origin.y;
  double width = self->_previewViewFrame.size.width;
  double height = self->_previewViewFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setPreviewViewFrame:(CGRect)a3
{
  self->_previewViewFrame = a3;
}

- (CGSize)imageSize
{
  double width = self->_imageSize.width;
  double height = self->_imageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setImageSize:(CGSize)a3
{
  self->_imageSize = a3;
}

- (ICDocCamImageQuad)imageQuad
{
  return self->_imageQuad;
}

- (void)setImageQuad:(id)a3
{
}

- (id)imageMeshAnimationCompletionBlock
{
  return self->_imageMeshAnimationCompletionBlock;
}

- (void)setImageMeshAnimationCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_imageMeshAnimationCompletionBlock, 0);
  objc_storeStrong((id *)&self->_imageQuad, 0);
  objc_storeStrong((id *)&self->_scrimView, 0);

  objc_storeStrong((id *)&self->_animationImageView, 0);
}

@end