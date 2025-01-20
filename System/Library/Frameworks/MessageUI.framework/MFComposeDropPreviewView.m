@interface MFComposeDropPreviewView
- (MFComposeDropPreviewView)initWithFrame:(CGRect)a3;
- (UIBezierPath)previewClippingPath;
- (UIImage)finalImage;
- (UIImageView)imageView;
- (UIView)previewView;
- (void)setFinalImage:(id)a3;
- (void)setImageView:(id)a3;
- (void)setPreviewClippingPath:(id)a3;
- (void)setPreviewView:(id)a3;
@end

@implementation MFComposeDropPreviewView

- (MFComposeDropPreviewView)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)MFComposeDropPreviewView;
  v3 = -[MFComposeDropPreviewView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4FB1618] mailGeneralBackgroundColor];
    [(MFComposeDropPreviewView *)v3 setBackgroundColor:v4];

    [(MFComposeDropPreviewView *)v3 setClipsToBounds:1];
    [(MFComposeDropPreviewView *)v3 setOpaque:1];
    id v5 = objc_alloc(MEMORY[0x1E4FB1838]);
    [(MFComposeDropPreviewView *)v3 bounds];
    v6 = objc_msgSend(v5, "initWithFrame:");
    [(MFComposeDropPreviewView *)v3 setImageView:v6];

    v7 = [(MFComposeDropPreviewView *)v3 imageView];
    [v7 setContentMode:0];

    v8 = [(MFComposeDropPreviewView *)v3 imageView];
    [v8 setAutoresizingMask:18];

    v9 = [(MFComposeDropPreviewView *)v3 imageView];
    [(MFComposeDropPreviewView *)v3 addSubview:v9];
  }
  return v3;
}

- (void)setPreviewView:(id)a3
{
  id v5 = (UIView *)a3;
  if (self->_previewView != v5)
  {
    objc_storeStrong((id *)&self->_previewView, a3);
    v6 = (void *)MEMORY[0x1E4FB1EB0];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __43__MFComposeDropPreviewView_setPreviewView___block_invoke;
    v7[3] = &unk_1E5F79038;
    v8 = v5;
    v9 = self;
    [v6 performWithoutAnimation:v7];
  }
}

uint64_t __43__MFComposeDropPreviewView_setPreviewView___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 40) bounds];
  objc_msgSend(*(id *)(a1 + 32), "setFrame:");
  [*(id *)(a1 + 32) setAutoresizingMask:18];
  uint64_t v3 = *(void *)(a1 + 32);
  v2 = *(void **)(a1 + 40);

  return [v2 addSubview:v3];
}

- (void)setPreviewClippingPath:(id)a3
{
  id v5 = (UIBezierPath *)a3;
  if (self->_previewClippingPath != v5)
  {
    objc_storeStrong((id *)&self->_previewClippingPath, a3);
    if (self->_previewClippingPath)
    {
      v6 = [(MFComposeDropPreviewView *)self previewClippingPath];
      [v6 bounds];
      double v8 = v7;
      double v10 = v9;
      double v12 = v11;
      double v14 = v13;

      v15 = [(MFComposeDropPreviewView *)self previewView];
      objc_msgSend(v15, "convertRect:toView:", self, v8, v10, v12, v14);
      CGFloat v17 = v16;
      CGFloat v19 = v18;
      CGFloat v21 = v20;
      CGFloat v23 = v22;

      [(MFComposeDropPreviewView *)self bounds];
      CGFloat x = v44.origin.x;
      CGFloat y = v44.origin.y;
      CGFloat width = v44.size.width;
      CGFloat height = v44.size.height;
      double MidX = CGRectGetMidX(v44);
      v45.origin.CGFloat x = v17;
      v45.origin.CGFloat y = v19;
      v45.size.CGFloat width = v21;
      v45.size.CGFloat height = v23;
      double v37 = CGRectGetMidX(v45);
      v46.origin.CGFloat x = x;
      v46.origin.CGFloat y = y;
      v46.size.CGFloat width = width;
      v46.size.CGFloat height = height;
      double MidY = CGRectGetMidY(v46);
      v47.origin.CGFloat x = v17;
      v47.origin.CGFloat y = v19;
      v47.size.CGFloat width = v21;
      v47.size.CGFloat height = v23;
      double v35 = CGRectGetMidY(v47);
      v48.origin.CGFloat x = x;
      v48.origin.CGFloat y = y;
      v48.size.CGFloat width = width;
      v48.size.CGFloat height = height;
      double v34 = CGRectGetWidth(v48);
      v49.origin.CGFloat x = v17;
      v49.origin.CGFloat y = v19;
      v49.size.CGFloat width = v21;
      v49.size.CGFloat height = v23;
      double v33 = CGRectGetWidth(v49);
      v50.origin.CGFloat x = x;
      v50.origin.CGFloat y = y;
      v50.size.CGFloat width = width;
      v50.size.CGFloat height = height;
      double v28 = CGRectGetHeight(v50);
      v51.origin.CGFloat x = v17;
      v51.origin.CGFloat y = v19;
      v51.size.CGFloat width = v21;
      v51.size.CGFloat height = v23;
      CGFloat v29 = CGRectGetHeight(v51);
      *(void *)&long long v30 = -1;
      *((void *)&v30 + 1) = -1;
      *(_OWORD *)&v43.c = v30;
      *(_OWORD *)&v43.tCGFloat x = v30;
      *(_OWORD *)&v43.a = v30;
      double v31 = v28 / v29;
      CGAffineTransformMakeScale(&v43, v34 / v33, v28 / v29);
      CGAffineTransform v41 = v43;
      CGAffineTransformTranslate(&v42, &v41, (MidX - v37) / (v34 / v33), (MidY - v35) / v31);
      CGAffineTransform v43 = v42;
      CGAffineTransform v40 = v42;
      v32 = [(MFComposeDropPreviewView *)self previewView];
      CGAffineTransform v39 = v40;
      [v32 setTransform:&v39];
    }
  }
}

- (void)setFinalImage:(id)a3
{
  id v5 = (UIImage *)a3;
  if (self->_finalImage != v5)
  {
    objc_storeStrong((id *)&self->_finalImage, a3);
    v6 = [(MFComposeDropPreviewView *)self imageView];
    [v6 setImage:v5];

    double v7 = [(MFComposeDropPreviewView *)self previewView];

    if (v7)
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __42__MFComposeDropPreviewView_setFinalImage___block_invoke;
      v8[3] = &unk_1E5F79088;
      v8[4] = self;
      [MEMORY[0x1E4FB1EB0] animateWithDuration:v8 animations:0.25];
    }
  }
}

void __42__MFComposeDropPreviewView_setFinalImage___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) previewView];
  [v1 setAlpha:0.0];
}

- (UIView)previewView
{
  return self->_previewView;
}

- (UIBezierPath)previewClippingPath
{
  return self->_previewClippingPath;
}

- (UIImage)finalImage
{
  return self->_finalImage;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_finalImage, 0);
  objc_storeStrong((id *)&self->_previewClippingPath, 0);

  objc_storeStrong((id *)&self->_previewView, 0);
}

@end