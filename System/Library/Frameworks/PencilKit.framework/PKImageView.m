@interface PKImageView
- (PKImageView)initWithFrame:(CGRect)a3;
- (PKImageView)initWithImage:(id)a3;
- (UIImage)addImage;
- (UIImage)image;
- (UIImage)mulImage;
- (id)_createViewWithImage:(id)a3 compositingFiler:(id)a4;
- (void)_updateAddLayer;
- (void)_updateImageLayer;
- (void)_updateLayerFrames;
- (void)_updateMulLayer;
- (void)setAddImage:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setImage:(id)a3;
- (void)setMulImage:(id)a3;
- (void)setupWithDrawing:(id)a3 imageSize:(CGSize)a4 scale:(double)a5 strokeSpaceClipRect:(CGRect)a6 sixChannel:(BOOL)a7;
@end

@implementation PKImageView

- (PKImageView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PKImageView;
  v3 = -[PKImageView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(PKImageView *)v3 layer];
    [v5 setAllowsGroupBlending:0];

    v6 = [(PKImageView *)v4 layer];
    [v6 setAllowsGroupOpacity:0];
  }
  return v4;
}

- (PKImageView)initWithImage:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKImageView;
  v6 = [(PKImageView *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_super v8 = [(PKImageView *)v6 layer];
    [v8 setAllowsGroupBlending:0];

    v9 = [(PKImageView *)v7 layer];
    [v9 setAllowsGroupOpacity:0];

    objc_storeStrong((id *)&v7->_image, a3);
    [(PKImageView *)v7 _updateImageLayer];
  }

  return v7;
}

- (void)setupWithDrawing:(id)a3 imageSize:(CGSize)a4 scale:(double)a5 strokeSpaceClipRect:(CGRect)a6 sixChannel:(BOOL)a7
{
  BOOL v7 = a7;
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  double v13 = a4.height;
  double v14 = a4.width;
  id v16 = a3;
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__8;
  v40 = __Block_byref_object_dispose__8;
  id v41 = 0;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__8;
  v34 = __Block_byref_object_dispose__8;
  id v35 = 0;
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__8;
  v28 = __Block_byref_object_dispose__8;
  id v29 = 0;
  v17 = -[PKImageRenderer initWithSize:scale:renderQueue:sixChannelBlending:]([PKImageRenderer alloc], "initWithSize:scale:renderQueue:sixChannelBlending:", 0, v7, v14, v13, a5);
  v18 = [MEMORY[0x1E4FB1E20] currentTraitCollection];
  -[PKImageRenderer setInvertColors:](v17, "setInvertColors:", [v18 userInterfaceStyle] == 2);

  dispatch_semaphore_t v19 = dispatch_semaphore_create(0);
  v20 = v19;
  if (v7)
  {
    v21 = v23;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __79__PKImageView_setupWithDrawing_imageSize_scale_strokeSpaceClipRect_sixChannel___block_invoke;
    v23[3] = &unk_1E64C72B8;
    v23[5] = &v30;
    v23[6] = &v24;
    v23[4] = v19;
    -[PKImageRenderer sixChannelCGRenderDrawing:clippedToStrokeSpaceRect:scale:completion:](v17, "sixChannelCGRenderDrawing:clippedToStrokeSpaceRect:scale:completion:", v16, v23, x, y, width, height, a5);
  }
  else
  {
    v21 = v22;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __79__PKImageView_setupWithDrawing_imageSize_scale_strokeSpaceClipRect_sixChannel___block_invoke_2;
    v22[3] = &unk_1E64C72E0;
    v22[5] = &v36;
    v22[4] = v19;
    -[PKImageRenderer renderDrawing:clippedToStrokeSpaceRect:scale:completion:](v17, "renderDrawing:clippedToStrokeSpaceRect:scale:completion:", v16, v22, x, y, width, height, a5);
  }

  dispatch_semaphore_wait(v20, 0xFFFFFFFFFFFFFFFFLL);
  [(PKImageView *)self setImage:v37[5]];
  [(PKImageView *)self setMulImage:v25[5]];
  [(PKImageView *)self setAddImage:v31[5]];

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  _Block_object_dispose(&v36, 8);
}

intptr_t __79__PKImageView_setupWithDrawing_imageSize_scale_strokeSpaceClipRect_sixChannel___block_invoke(void *a1, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    uint64_t v5 = [MEMORY[0x1E4FB1818] imageWithCGImage:a2];
    uint64_t v6 = *(void *)(a1[5] + 8);
    BOOL v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
  if (a3)
  {
    uint64_t v8 = [MEMORY[0x1E4FB1818] imageWithCGImage:a3];
    uint64_t v9 = *(void *)(a1[6] + 8);
    v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
  objc_super v11 = a1[4];

  return dispatch_semaphore_signal(v11);
}

void __79__PKImageView_setupWithDrawing_imageSize_scale_strokeSpaceClipRect_sixChannel___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)setFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKImageView;
  -[PKImageView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(PKImageView *)self _updateLayerFrames];
}

- (void)setImage:(id)a3
{
  uint64_t v5 = (UIImage *)a3;
  if (self->_image != v5)
  {
    uint64_t v6 = v5;
    objc_storeStrong((id *)&self->_image, a3);
    [MEMORY[0x1E4F39CF8] begin];
    [MEMORY[0x1E4F39CF8] setDisableActions:1];
    [(PKImageView *)self _updateImageLayer];
    [MEMORY[0x1E4F39CF8] commit];
    uint64_t v5 = v6;
  }
}

- (void)setAddImage:(id)a3
{
  uint64_t v5 = (UIImage *)a3;
  if (self->_addImage != v5)
  {
    uint64_t v6 = v5;
    objc_storeStrong((id *)&self->_addImage, a3);
    [MEMORY[0x1E4F39CF8] begin];
    [MEMORY[0x1E4F39CF8] setDisableActions:1];
    [(PKImageView *)self _updateAddLayer];
    [MEMORY[0x1E4F39CF8] commit];
    uint64_t v5 = v6;
  }
}

- (void)setMulImage:(id)a3
{
  uint64_t v5 = (UIImage *)a3;
  if (self->_mulImage != v5)
  {
    uint64_t v6 = v5;
    objc_storeStrong((id *)&self->_mulImage, a3);
    [MEMORY[0x1E4F39CF8] begin];
    [MEMORY[0x1E4F39CF8] setDisableActions:1];
    [(PKImageView *)self _updateMulLayer];
    [MEMORY[0x1E4F39CF8] commit];
    uint64_t v5 = v6;
  }
}

- (id)_createViewWithImage:(id)a3 compositingFiler:(id)a4
{
  uint64_t v6 = (objc_class *)MEMORY[0x1E4FB1EB0];
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_alloc_init(v6);
  v10 = [v9 layer];
  [(PKImageView *)self bounds];
  objc_msgSend(v10, "setFrame:");
  [v10 setOpaque:0];
  [v10 setAllowsGroupOpacity:0];
  [v10 setAllowsGroupBlending:0];
  objc_super v11 = [MEMORY[0x1E4F39BC0] filterWithType:v7];

  [v10 setCompositingFilter:v11];
  id v12 = v8;
  uint64_t v13 = [v12 CGImage];

  [v10 setContents:v13];

  return v9;
}

- (void)_updateImageLayer
{
  image = self->_image;
  imageView = self->_imageView;
  if (!image)
  {
    [(UIView *)imageView removeFromSuperview];
    uint64_t v6 = self->_imageView;
    self->_imageView = 0;
    goto LABEL_5;
  }
  if (imageView)
  {
    uint64_t v5 = [(UIImage *)image CGImage];
    v10 = [(UIView *)self->_imageView layer];
    [(UIView *)v10 setContents:v5];
    uint64_t v6 = v10;
LABEL_5:

    return;
  }
  -[PKImageView _createViewWithImage:compositingFiler:](self, "_createViewWithImage:compositingFiler:");
  id v7 = (UIView *)objc_claimAutoreleasedReturnValue();
  id v8 = self->_imageView;
  self->_imageView = v7;

  id v9 = self->_imageView;

  [(PKImageView *)self insertSubview:v9 atIndex:0];
}

- (void)_updateAddLayer
{
  addImage = self->_addImage;
  addView = self->_addView;
  if (!addImage)
  {
    [(UIView *)addView removeFromSuperview];
    uint64_t v6 = self->_addView;
    self->_addView = 0;
    goto LABEL_5;
  }
  if (addView)
  {
    uint64_t v5 = [(UIImage *)addImage CGImage];
    v10 = [(UIView *)self->_addView layer];
    [(UIView *)v10 setContents:v5];
    uint64_t v6 = v10;
LABEL_5:

    return;
  }
  -[PKImageView _createViewWithImage:compositingFiler:](self, "_createViewWithImage:compositingFiler:");
  id v7 = (UIView *)objc_claimAutoreleasedReturnValue();
  id v8 = self->_addView;
  self->_addView = v7;

  id v9 = self->_addView;
  if (self->_mulView)
  {
    -[PKImageView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", v9);
  }
  else
  {
    [(PKImageView *)self addSubview:v9];
  }
}

- (void)_updateMulLayer
{
  mulImage = self->_mulImage;
  mulView = self->_mulView;
  if (!mulImage)
  {
    [(UIView *)mulView removeFromSuperview];
    uint64_t v6 = self->_mulView;
    self->_mulView = 0;
    goto LABEL_5;
  }
  if (mulView)
  {
    uint64_t v5 = [(UIImage *)mulImage CGImage];
    v10 = [(UIView *)self->_mulView layer];
    [(UIView *)v10 setContents:v5];
    uint64_t v6 = v10;
LABEL_5:

    return;
  }
  -[PKImageView _createViewWithImage:compositingFiler:](self, "_createViewWithImage:compositingFiler:");
  id v7 = (UIView *)objc_claimAutoreleasedReturnValue();
  id v8 = self->_mulView;
  self->_mulView = v7;

  id v9 = self->_mulView;
  if (self->_addView)
  {
    -[PKImageView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v9);
  }
  else
  {
    [(PKImageView *)self addSubview:v9];
  }
}

- (void)_updateLayerFrames
{
  [(PKImageView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[UIView setFrame:](self->_imageView, "setFrame:");
  -[UIView setFrame:](self->_addView, "setFrame:", v4, v6, v8, v10);
  mulView = self->_mulView;

  -[UIView setFrame:](mulView, "setFrame:", v4, v6, v8, v10);
}

- (UIImage)image
{
  return self->_image;
}

- (UIImage)addImage
{
  return self->_addImage;
}

- (UIImage)mulImage
{
  return self->_mulImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mulImage, 0);
  objc_storeStrong((id *)&self->_addImage, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_mulView, 0);
  objc_storeStrong((id *)&self->_addView, 0);

  objc_storeStrong((id *)&self->_imageView, 0);
}

@end