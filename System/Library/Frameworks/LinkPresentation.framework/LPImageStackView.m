@interface LPImageStackView
+ (void)initialize;
- (CGSize)_layoutImagesForSize:(CGSize)a3 applyingLayout:(BOOL)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (LPImageStackView)initWithHost:(id)a3;
- (LPImageStackView)initWithHost:(id)a3 images:(id)a4 style:(id)a5;
- (void)layoutComponentView;
@end

@implementation LPImageStackView

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    stackedImageVerticalOffset = 0xC018000000000000;
  }
}

- (LPImageStackView)initWithHost:(id)a3
{
  return 0;
}

- (LPImageStackView)initWithHost:(id)a3 images:(id)a4 style:(id)a5
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v34 = a4;
  id v35 = a5;
  v44.receiver = self;
  v44.super_class = (Class)LPImageStackView;
  v9 = [(LPComponentView *)&v44 initWithHost:v8];
  v10 = v9;
  v11 = v9;
  if (v9)
  {
    v12 = [(LPImageStackView *)v9 layer];
    [v12 setMasksToBounds:0];

    p_images = (id *)&v10->_images;
    objc_storeStrong((id *)&v10->_images, a4);
    p_style = (id *)&v10->_style;
    objc_storeStrong((id *)&v10->_style, a5);
    if ([(NSArray *)v10->_images count] >= 3)
    {
      uint64_t v14 = objc_msgSend(*p_images, "subarrayWithRange:", 0, 2);
      id v15 = *p_images;
      id *p_images = (id)v14;
    }
    v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    imageViews = v11->_imageViews;
    v11->_imageViews = v16;

    v38 = objc_alloc_init(LPImagePresentationProperties);
    [(LPImagePresentationProperties *)v38 setShouldApplyBackground:1];
    [(LPImagePresentationProperties *)v38 setRequireFixedSize:1];
    v39 = (void *)[*p_style copy];
    [v39 setDarkeningAmount:0.3];
    v18 = [[LPPointUnit alloc] initWithValue:3.0];
    [v39 setCornerRadius:v18];

    v19 = [LPPointUnit alloc];
    v20 = [v39 fixedFallbackImageSize];
    [v20 value];
    v22 = [(LPPointUnit *)v19 initWithValue:v21 + -8.0];
    [v39 setFixedFallbackImageSize:v22];

    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id obj = *p_images;
    uint64_t v23 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
    if (v23)
    {
      uint64_t v24 = *(void *)v41;
      char v25 = 1;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v41 != v24) {
            objc_enumerationMutation(obj);
          }
          uint64_t v27 = *(void *)(*((void *)&v40 + 1) + 8 * i);
          v28 = [LPImageView alloc];
          v29 = [(LPComponentView *)v11 host];
          id v30 = v39;
          if (v25) {
            id v30 = *p_style;
          }
          v31 = [(LPImageView *)v28 initWithHost:v29 image:v27 properties:v38 style:v30];

          [(NSMutableArray *)v11->_imageViews addObject:v31];
          [(UIView *)v11 _lp_insertSubview:v31 belowSubview:0];

          char v25 = 0;
        }
        uint64_t v23 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
        char v25 = 0;
      }
      while (v23);
    }

    v32 = v11;
  }

  return v11;
}

- (void)layoutComponentView
{
  v3 = [(NSMutableArray *)self->_imageViews lastObject];
  [v3 installDarkeningViewIfNeeded];

  [(LPImageStackView *)self bounds];

  -[LPImageStackView _layoutImagesForSize:applyingLayout:](self, "_layoutImagesForSize:applyingLayout:", 1, v4, v5);
}

- (CGSize)_layoutImagesForSize:(CGSize)a3 applyingLayout:(BOOL)a4
{
  if (a4)
  {
    [(LPImageStackView *)self bounds];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    v13 = [(NSMutableArray *)self->_imageViews firstObject];
    objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);

    v27.origin.double x = v6;
    v27.origin.y = v8;
    v27.size.double width = v10;
    v27.size.double height = v12;
    CGRect v28 = CGRectInset(v27, 4.0, 4.0);
    double x = v28.origin.x;
    double width = v28.size.width;
    double height = v28.size.height;
    double v17 = *(double *)&stackedImageVerticalOffset + v28.origin.y;
    v18 = [(NSMutableArray *)self->_imageViews lastObject];
    objc_msgSend(v18, "setFrame:", x, v17, width, height);
  }
  v19 = [(LPImageViewStyle *)self->_style fixedSize];
  [v19 asSize];
  double v21 = v20;
  double v23 = v22;

  double v24 = v21;
  double v25 = v23;
  result.double height = v25;
  result.double width = v24;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[LPImageStackView _layoutImagesForSize:applyingLayout:](self, "_layoutImagesForSize:applyingLayout:", 0, a3.width, a3.height);
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageViews, 0);
  objc_storeStrong((id *)&self->_style, 0);

  objc_storeStrong((id *)&self->_images, 0);
}

@end