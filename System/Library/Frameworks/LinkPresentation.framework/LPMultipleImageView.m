@interface LPMultipleImageView
- (CGRect)_computeRectForImageAtIndex:(unint64_t)a3 fittingSize:(CGSize *)a4 width:(double *)a5 height:(double *)a6 size:(CGSize)a7 multipleImageLayout:(unint64_t)a8;
- (CGSize)_availableSizeForImageNumber:(unint64_t)a3 withLayout:(unint64_t)a4 withinSize:(CGSize)result applyingLayout:(BOOL)a6;
- (CGSize)layoutImagesForSize:(CGSize)a3 applyingLayout:(BOOL)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (LPMultipleImageView)initWithHost:(id)a3;
- (LPMultipleImageView)initWithHost:(id)a3 images:(id)a4 style:(id)a5;
- (void)ensureImageViews;
- (void)layoutComponentView;
@end

@implementation LPMultipleImageView

- (LPMultipleImageView)initWithHost:(id)a3
{
  return 0;
}

- (LPMultipleImageView)initWithHost:(id)a3 images:(id)a4 style:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)LPMultipleImageView;
  v11 = [(LPComponentView *)&v18 initWithHost:v8];
  v12 = v11;
  if (v11)
  {
    p_images = (id *)&v11->_images;
    objc_storeStrong((id *)&v11->_images, a4);
    objc_storeStrong((id *)&v12->_style, a5);
    if ((unint64_t)[*p_images count] >= 5)
    {
      uint64_t v14 = objc_msgSend(*p_images, "subarrayWithRange:", 0, 4);
      id v15 = *p_images;
      id *p_images = (id)v14;
    }
    v16 = v12;
  }

  return v12;
}

- (void)ensureImageViews
{
  if (!self->_imageViews)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    imageViews = self->_imageViews;
    self->_imageViews = v3;

    uint64_t v5 = computeMultipleImageLayoutForImages(self->_images);
    v26 = [[LPPointUnit alloc] initWithValue:1.0];
    unint64_t v6 = 0;
    uint64_t v7 = v5 - 1;
    while (v6 < [(NSArray *)self->_images count])
    {
      id v8 = [(NSArray *)self->_images objectAtIndexedSubscript:v6];
      id v9 = (void *)[(LPImageViewStyle *)self->_style copy];
      id v10 = +[LPPointUnit zero];
      v11 = [v9 padding];
      [v11 setBottom:v10];

      v12 = +[LPPointUnit zero];
      v13 = [v9 padding];
      [v13 setTop:v12];

      uint64_t v14 = +[LPPointUnit zero];
      id v15 = [v9 padding];
      [v15 setTrailing:v14];

      v16 = +[LPPointUnit zero];
      v17 = [v9 padding];
      [v17 setLeading:v16];

      switch(v7)
      {
        case 0:
          objc_super v18 = [v9 padding];
          if (v6) {
            [v18 setTop:v26];
          }
          else {
            [v18 setBottom:v26];
          }
          goto LABEL_23;
        case 1:
          objc_super v18 = [v9 padding];
          if (v6) {
            [v18 setLeading:v26];
          }
          else {
            [v18 setTrailing:v26];
          }
          goto LABEL_23;
        case 2:
          if (v6 == 1) {
            goto LABEL_18;
          }
          if (!v6) {
            goto LABEL_11;
          }
          goto LABEL_22;
        case 3:
          if (v6 == 2)
          {
            v20 = [v9 padding];
            [v20 setLeading:v26];

            v21 = [v9 padding];
            [v21 setTop:v26];

            objc_super v18 = [v9 padding];
            [v18 setBottom:v26];
          }
          else if (v6 == 1)
          {
LABEL_18:
            v19 = [v9 padding];
            [v19 setLeading:v26];

            objc_super v18 = [v9 padding];
            [v18 setBottom:v26];
          }
          else if (v6)
          {
LABEL_22:
            v22 = [v9 padding];
            [v22 setLeading:v26];

            objc_super v18 = [v9 padding];
            [v18 setTop:v26];
          }
          else
          {
LABEL_11:
            objc_super v18 = [v9 padding];
            [v18 setTrailing:v26];
          }
LABEL_23:

LABEL_24:
          [v9 setScalingMode:2];
          v23 = [LPImageView alloc];
          v24 = [(LPComponentView *)self host];
          v25 = [(LPImageView *)v23 initWithHost:v24 image:v8 properties:0 style:v9];

          [(NSMutableArray *)self->_imageViews addObject:v25];
          [(LPMultipleImageView *)self addSubview:v25];

          ++v6;
          break;
        default:
          goto LABEL_24;
      }
    }
  }
}

- (CGRect)_computeRectForImageAtIndex:(unint64_t)a3 fittingSize:(CGSize *)a4 width:(double *)a5 height:(double *)a6 size:(CGSize)a7 multipleImageLayout:(unint64_t)a8
{
  double height = a7.height;
  double width = a7.width;
  BOOL v15 = [(UIView *)self _lp_isLTR];
  double v16 = *MEMORY[0x1E4F1DB28];
  double v17 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v18 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  switch(a3)
  {
    case 0uLL:
      if (a8 == 1)
      {
        double v19 = a4->width;
        double v18 = a4->height;
        double v17 = 0.0;
LABEL_20:
        double v16 = 0.0;
        goto LABEL_21;
      }
      if (v15)
      {
        double v19 = a4->width;
        double v18 = a4->height;
        double v17 = 0.0;
        double width = a4->width;
        goto LABEL_20;
      }
      double v19 = a4->width;
      if (a8)
      {
        double v16 = width - v19;
        double v18 = a4->height;
        double v17 = 0.0;
        double width = a4->width;
      }
      else
      {
        double width = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      }
LABEL_21:
      *a5 = v19 + *a5;
      *a6 = a4->height + *a6;
LABEL_29:
      double v22 = width;
      result.size.double height = v18;
      result.size.double width = v22;
      result.origin.y = v17;
      result.origin.x = v16;
      return result;
    case 1uLL:
      if (a8 == 1)
      {
        double v17 = *a6;
        double v18 = a4->height;
        *a6 = *a6 + v18;
        goto LABEL_28;
      }
      double v21 = a4->width;
      if (v15)
      {
        double v16 = width - v21;
        double v18 = a4->height;
        *a5 = v21 + *a5;
        double v17 = 0.0;
        goto LABEL_16;
      }
      double v18 = a4->height;
      *a5 = v21 + *a5;
      double v17 = 0.0;
      double width = v21;
      goto LABEL_28;
    case 2uLL:
      if (a8 == 3 && v15) {
        goto LABEL_15;
      }
      if (a8 == 3) {
        goto LABEL_17;
      }
      if (v15)
      {
        double v21 = a4->width;
        double v18 = a4->height;
        double v16 = width - a4->width;
        double v17 = height + v18 * -2.0;
        goto LABEL_16;
      }
      double width = a4->width;
      double v18 = a4->height;
      double v17 = height + v18 * -2.0;
      goto LABEL_28;
    case 3uLL:
      if (v15)
      {
LABEL_15:
        double v21 = a4->width;
        double v18 = a4->height;
        double v16 = width - a4->width;
        double v17 = height - v18;
LABEL_16:
        double width = v21;
      }
      else
      {
LABEL_17:
        double width = a4->width;
        double v18 = a4->height;
        double v17 = height - v18;
LABEL_28:
        double v16 = 0.0;
      }
      goto LABEL_29;
    default:
      double width = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      goto LABEL_29;
  }
}

- (CGSize)_availableSizeForImageNumber:(unint64_t)a3 withLayout:(unint64_t)a4 withinSize:(CGSize)result applyingLayout:(BOOL)a6
{
  double height = result.height;
  double width = result.width;
  double v8 = fmin(result.width, result.height);
  if (a6) {
    double v8 = width;
  }
  else {
    result.double height = v8;
  }
  switch(a4)
  {
    case 1uLL:
      result.double height = height * 0.5;
      break;
    case 2uLL:
      double v9 = 0.5;
      goto LABEL_13;
    case 3uLL:
      double v8 = width * 0.5;
      if (a3) {
        result.double height = result.height * 0.5;
      }
      break;
    case 4uLL:
      if (a3)
      {
        double v8 = width * 0.333333333;
        result.double height = result.height * 0.333333333;
      }
      else
      {
        double v9 = 0.666666667;
LABEL_13:
        double v8 = width * v9;
      }
      break;
    default:
      break;
  }
  result.double width = v8;
  return result;
}

- (CGSize)layoutImagesForSize:(CGSize)a3 applyingLayout:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.height;
  double width = a3.width;
  uint64_t v27 = 0;
  double v28 = 0.0;
  uint64_t v8 = computeMultipleImageLayoutForImages(self->_images);
  if ([(NSArray *)self->_images count])
  {
    unint64_t v9 = 0;
    do
    {
      id v10 = -[NSArray objectAtIndexedSubscript:](self->_images, "objectAtIndexedSubscript:", v9, *(void *)&v25, v26);
      v11 = [(NSMutableArray *)self->_imageViews objectAtIndexedSubscript:v9];
      -[LPMultipleImageView _availableSizeForImageNumber:withLayout:withinSize:applyingLayout:](self, "_availableSizeForImageNumber:withLayout:withinSize:applyingLayout:", v9, v8, v4, width, height);
      double v14 = v12;
      double v25 = 0.0;
      uint64_t v26 = 0;
      if (v4)
      {
        double v25 = v12;
        uint64_t v26 = v13;
      }
      else
      {
        if (v8 == 1)
        {
          BOOL v15 = objc_msgSend(v10, "platformImage", *(void *)&v25, v26);
          objc_msgSend(v15, "_lp_pixelSize");
          sizeFittingInsideSizeMaintainingAspectRatio(v16, v17, width, 1.79769313e308);
        }
        else
        {
          BOOL v15 = objc_msgSend(v10, "platformImage", *(void *)&v25, v26, v27);
          objc_msgSend(v15, "_lp_pixelSize");
          double v18 = minimumSizeByComponent(v20, v21, v14);
        }
        double v25 = v18;
        uint64_t v26 = v19;
      }
      -[LPMultipleImageView _computeRectForImageAtIndex:fittingSize:width:height:size:multipleImageLayout:](self, "_computeRectForImageAtIndex:fittingSize:width:height:size:multipleImageLayout:", v9, &v25, &v28, &v27, v8, width, height);
      if (v4) {
        objc_msgSend(v11, "setFrame:");
      }

      ++v9;
    }
    while (v9 < [(NSArray *)self->_images count]);
    double v22 = v28;
  }
  else
  {
    double v22 = 0.0;
  }
  double v23 = minimumSizeByComponent(width, height, v22);
  result.double height = v24;
  result.double width = v23;
  return result;
}

- (void)layoutComponentView
{
  [(LPMultipleImageView *)self ensureImageViews];
  [(LPMultipleImageView *)self bounds];

  -[LPMultipleImageView layoutImagesForSize:applyingLayout:](self, "layoutImagesForSize:applyingLayout:", 1, v3, v4);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  unint64_t v6 = [(LPImageViewStyle *)self->_style padding];
  objc_msgSend(v6, "asInsetsForLTR:", -[UIView _lp_isLTR](self, "_lp_isLTR"));
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  -[LPMultipleImageView layoutImagesForSize:applyingLayout:](self, "layoutImagesForSize:applyingLayout:", 0, width - (v10 + v14), height - (v8 + v12));
  double v17 = ceil(v15) - (-v14 - v10);
  double v18 = ceil(v16) - (-v12 - v8);
  result.double height = v18;
  result.double width = v17;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageViews, 0);
  objc_storeStrong((id *)&self->_style, 0);

  objc_storeStrong((id *)&self->_images, 0);
}

@end