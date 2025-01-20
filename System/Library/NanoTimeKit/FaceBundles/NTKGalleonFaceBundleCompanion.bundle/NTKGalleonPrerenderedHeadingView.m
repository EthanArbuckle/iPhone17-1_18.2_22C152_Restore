@interface NTKGalleonPrerenderedHeadingView
- (CGSize)sizeThatFits:(CGSize)a3;
- (NTKGalleonPrerenderedHeadingView)initWithCoder:(id)a3;
- (NTKGalleonPrerenderedHeadingView)initWithFrame:(CGRect)a3;
- (unint64_t)heading;
- (void)_commonInit;
- (void)galleon_setHeading:(double)a3;
- (void)layoutSubviews;
- (void)setHeading:(unint64_t)a3;
- (void)setTextColor:(id)a3;
@end

@implementation NTKGalleonPrerenderedHeadingView

- (void)setTextColor:(id)a3
{
  headingLayer = self->_headingLayer;
  id v4 = a3;
  uint64_t v9 = objc_msgSend_CGColor(v4, v5, v6, v7);

  objc_msgSend_setContentsMultiplyColor_(headingLayer, v8, v9, v10);
}

- (NTKGalleonPrerenderedHeadingView)initWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)NTKGalleonPrerenderedHeadingView;
  v3 = [(NTKGalleonPrerenderedHeadingView *)&v9 initWithCoder:a3];
  uint64_t v7 = v3;
  if (v3) {
    objc_msgSend__commonInit(v3, v4, v5, v6);
  }
  return v7;
}

- (NTKGalleonPrerenderedHeadingView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)NTKGalleonPrerenderedHeadingView;
  v3 = -[NTKGalleonPrerenderedHeadingView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  uint64_t v7 = v3;
  if (v3) {
    objc_msgSend__commonInit(v3, v4, v5, v6);
  }
  return v7;
}

- (void)layoutSubviews
{
  v28.receiver = self;
  v28.super_class = (Class)NTKGalleonPrerenderedHeadingView;
  [(NTKGalleonPrerenderedHeadingView *)&v28 layoutSubviews];
  objc_msgSend_bounds(self, v3, v4, v5);
  CGFloat x = v29.origin.x;
  CGFloat y = v29.origin.y;
  CGFloat width = v29.size.width;
  CGFloat height = v29.size.height;
  double MidX = CGRectGetMidX(v29);
  v30.origin.CGFloat x = x;
  v30.origin.CGFloat y = y;
  v30.size.CGFloat width = width;
  v30.size.CGFloat height = height;
  CGFloat MidY = CGRectGetMidY(v30);
  objc_msgSend_setPosition_(self->_headingLayer, v12, v13, v14, MidX, MidY);
  headingLayer = self->_headingLayer;
  objc_msgSend_size(self->_headingImage, v16, v17, v18);
  double v20 = v19;
  objc_msgSend_size(self->_headingImage, v21, v22, v23);
  objc_msgSend_setBounds_(headingLayer, v24, v25, v26, 0.0, 0.0, v20, v27);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  objc_msgSend_size(self->_headingImage, a2, v3, v4, a3.width, a3.height);
  result.CGFloat height = v6;
  result.CGFloat width = v5;
  return result;
}

- (void)_commonInit
{
  objc_msgSend_sharedGenerator(NTKGalleonHeadingImageGenerator, a2, v2, v3);
  double v5 = (NTKGalleonHeadingImageGenerator *)objc_claimAutoreleasedReturnValue();
  imageGenerator = self->_imageGenerator;
  self->_imageGenerator = v5;

  objc_msgSend_sharedGenerator(NTKGalleonHeadingGenerator, v7, v8, v9);
  uint64_t v10 = (NTKGalleonHeadingGenerator *)objc_claimAutoreleasedReturnValue();
  headingGenerator = self->_headingGenerator;
  self->_headingGenerator = v10;

  objc_msgSend_imageForHeading_(self->_imageGenerator, v12, 0, v13);
  uint64_t v14 = (UIImage *)objc_claimAutoreleasedReturnValue();
  headingImage = self->_headingImage;
  self->_headingImage = v14;
  v16 = v14;

  objc_msgSend_layer(MEMORY[0x263F157E8], v17, v18, v19);
  double v20 = (CALayer *)objc_claimAutoreleasedReturnValue();
  headingLayer = self->_headingLayer;
  self->_headingLayer = v20;

  objc_msgSend_tintColor(self, v22, v23, v24);
  id v25 = objc_claimAutoreleasedReturnValue();
  uint64_t v29 = objc_msgSend_CGColor(v25, v26, v27, v28);

  objc_msgSend_setContentsMultiplyColor_(self->_headingLayer, v30, v29, v31);
  v32 = self->_headingLayer;
  v33 = v16;
  uint64_t v37 = objc_msgSend_CGImage(v33, v34, v35, v36);
  objc_msgSend_setContents_(v32, v38, v37, v39);
  objc_msgSend_setContentsFormat_(self->_headingLayer, v40, *MEMORY[0x263F159C0], v41);
  objc_msgSend_layer(self, v42, v43, v44);
  id v47 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addSublayer_(v47, v45, (uint64_t)self->_headingLayer, v46);
}

- (void)galleon_setHeading:(double)a3
{
  uint64_t v6 = vcvtmd_u64_f64(a3);
  if (objc_msgSend_heading(self, a2, v3, v4) != v6)
  {
    objc_msgSend_stringForHeading_(self->_headingGenerator, v7, v6, v8);
    id v38 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setAccessibilityLabel_(self, v9, (uint64_t)v38, v10);
    objc_msgSend_setHeading_(self, v11, v6, v12);
    objc_msgSend_imageForHeading_(self->_imageGenerator, v13, v6, v14);
    v15 = (UIImage *)objc_claimAutoreleasedReturnValue();
    headingImage = self->_headingImage;
    self->_headingImage = v15;

    double v20 = (CGImage *)objc_msgSend_CGImage(self->_headingImage, v17, v18, v19);
    uint64_t v24 = (CGImage *)objc_msgSend_contents(self->_headingLayer, v21, v22, v23);
    objc_msgSend_setContents_(self->_headingLayer, v25, (uint64_t)v20, v26);
    double Width = (double)CGImageGetWidth(v20);
    double Height = (double)CGImageGetHeight(v20);
    double v29 = (double)CGImageGetWidth(v24);
    double v33 = (double)CGImageGetHeight(v24);
    if (Width != v29 || Height != v33)
    {
      objc_msgSend_setNeedsLayout(self, v30, v31, v32);
      objc_msgSend_invalidateIntrinsicContentSize(self, v35, v36, v37);
    }
  }
}

- (unint64_t)heading
{
  return self->_heading;
}

- (void)setHeading:(unint64_t)a3
{
  self->_heading = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headingLayer, 0);
  objc_storeStrong((id *)&self->_headingImage, 0);
  objc_storeStrong((id *)&self->_headingGenerator, 0);

  objc_storeStrong((id *)&self->_imageGenerator, 0);
}

@end