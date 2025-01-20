@interface MKStarRatingView
+ (id)colorForRating:(double)a3;
+ (id)emptyStarTextAttachmentWithFont:(id)a3;
+ (id)fullStarTextAttachmentWithFont:(id)a3;
+ (id)halfStarTextAttachmentWithFont:(id)a3;
+ (id)ratingAsAttributedString:(double)a3 baseFont:(id)a4 style:(int64_t)a5 theme:(id)a6;
+ (id)ratingShortAsAttributedString:(double)a3 baseFont:(id)a4 theme:(id)a5;
+ (id)textAttachmentimageNamed:(id)a3 font:(id)a4;
- (BOOL)isHighlighted;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MKStarRatingView)initWithCoder:(id)a3;
- (MKStarRatingView)initWithFrame:(CGRect)a3;
- (MKStarRatingView)initWithStyle:(int64_t)a3;
- (UIEdgeInsets)alignmentRectInsets;
- (UIImage)emptyStarHighlightedImage;
- (UIImage)emptyStarImage;
- (UIImage)fullStarHighlightedImage;
- (UIImage)fullStarImage;
- (UIImage)halfStarHighlightedImage;
- (UIImage)halfStarImage;
- (double)rating;
- (double)verticalAlignmentCenterPercentage;
- (id)imageWithName:(id)a3 andColor:(id)a4;
- (int64_t)starStyle;
- (unint64_t)numberOfRatingLevels;
- (void)_commonInit;
- (void)_layoutStarViewsCreatingIfNeeded:(BOOL)a3;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setEmptyStarHighlightedImage:(id)a3;
- (void)setEmptyStarImage:(id)a3;
- (void)setFullStarHighlightedImage:(id)a3;
- (void)setFullStarImage:(id)a3;
- (void)setHalfStarHighlightedImage:(id)a3;
- (void)setHalfStarImage:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setNumberOfRatingLevels:(unint64_t)a3;
- (void)setPadding:(double)a3;
- (void)setRating:(double)a3;
- (void)setStarStyle:(int64_t)a3;
@end

@implementation MKStarRatingView

- (MKStarRatingView)initWithFrame:(CGRect)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MKStarRatingView;
  v3 = -[MKStarRatingView initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(MKStarRatingView *)v3 _commonInit];
  [(MKStarRatingView *)v3 setStarStyle:0];
  return v3;
}

- (MKStarRatingView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MKStarRatingView;
  v3 = [(MKStarRatingView *)&v5 initWithCoder:a3];
  [(MKStarRatingView *)v3 _commonInit];
  [(MKStarRatingView *)v3 setStarStyle:0];
  return v3;
}

- (MKStarRatingView)initWithStyle:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MKStarRatingView;
  v4 = -[MKStarRatingView initWithFrame:](&v6, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(MKStarRatingView *)v4 _commonInit];
  [(MKStarRatingView *)v4 setNumberOfRatingLevels:5];
  [(MKStarRatingView *)v4 setStarStyle:a3];
  return v4;
}

- (void)_commonInit
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  ratingViews = self->_ratingViews;
  self->_ratingViews = v3;

  self->_numReviews = 0x7FFFFFFFFFFFFFFFLL;
  self->_starStyle = 0;
  if (MKApplicationLayoutDirectionIsRightToLeft())
  {
    CATransform3DMakeScale(&v7, -1.0, 1.0, 1.0);
    objc_super v5 = [(MKStarRatingView *)self layer];
    CATransform3D v6 = v7;
    [v5 setTransform:&v6];
  }
}

- (id)imageWithName:(id)a3 andColor:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  v8 = v7;
  if (v6)
  {
    v8 = objc_msgSend(v7, "stringByAppendingFormat:", @"_%lu", objc_msgSend(v6, "hash"));
  }
  v9 = [0 objectForKeyedSubscript:v8];
  if (!v9)
  {
    if (v6
      && (objc_msgSend(MEMORY[0x1E4F42A80], "_mapkit_imageNamed:", v7),
          v10 = objc_claimAutoreleasedReturnValue(),
          [v10 _flatImageWithColor:v6],
          v9 = objc_claimAutoreleasedReturnValue(),
          v10,
          v9)
      || (objc_msgSend(MEMORY[0x1E4F42A80], "_mapkit_imageNamed:", v7),
          (v9 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      [0 setObject:v9 forKeyedSubscript:v8];
    }
  }

  return v9;
}

- (CGSize)intrinsicContentSize
{
  [(MKStarRatingView *)self frame];

  -[MKStarRatingView sizeThatFits:](self, "sizeThatFits:", v3, v4);
  result.height = v6;
  result.width = v5;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3 = self->_fullStarImage;
  [(UIImage *)v3 size];
  [(UIImage *)v3 size];

  UIRoundToViewScale();
  double v5 = v4;
  UIRoundToViewScale();
  double v7 = v6;
  double v8 = v5;
  result.height = v7;
  result.width = v8;
  return result;
}

- (double)verticalAlignmentCenterPercentage
{
  return 1.08000004;
}

- (UIEdgeInsets)alignmentRectInsets
{
  double v2 = 0.5;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)_layoutStarViewsCreatingIfNeeded:(BOOL)a3
{
  if (a3)
  {
    [(NSMutableArray *)self->_ratingViews makeObjectsPerformSelector:sel_removeFromSuperview];
    [(NSMutableArray *)self->_ratingViews removeAllObjects];
  }
  [(UIImage *)self->_fullStarImage size];
  double rect = v5;
  double v7 = v6;
  [(MKStarRatingView *)self _currentScreenScale];
  double v9 = v8;
  double rating = self->_rating;
  if ([(MKStarRatingView *)self numberOfRatingLevels])
  {
    unint64_t v11 = 0;
    double v12 = *MEMORY[0x1E4F1DAD8];
    double v13 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    double v14 = round(rating + rating) * 0.5;
    do
    {
      if (v14 >= 1.0
        || ((fullStarImage = self->_halfStarImage, v14 == 0.5) ? (BOOL v16 = fullStarImage == 0) : (BOOL v16 = 0), v16))
      {
        if (!self->_highlighted || (fullStarImage = self->_fullStarHighlightedImage) == 0) {
          fullStarImage = self->_fullStarImage;
        }
      }
      else if (v14 != 0.5 || fullStarImage == 0)
      {
        if (!self->_highlighted || (fullStarImage = self->_emptyStarHighlightedImage) == 0) {
          fullStarImage = self->_emptyStarImage;
        }
      }
      else if (self->_highlighted && self->_halfStarHighlightedImage)
      {
        fullStarImage = self->_halfStarHighlightedImage;
      }
      v18 = fullStarImage;
      if (v11 >= [(NSMutableArray *)self->_ratingViews count])
      {
        v20 = 0;
      }
      else
      {
        uint64_t v19 = [(NSMutableArray *)self->_ratingViews objectAtIndexedSubscript:v11];
        v20 = (void *)v19;
        if (!a3 && v19) {
          goto LABEL_27;
        }
      }
      id v21 = objc_alloc_init(MEMORY[0x1E4F42AA0]);

      v20 = v21;
LABEL_27:
      [v20 setImage:v18];
      v22 = [v20 superview];

      if (!v22)
      {
        [(MKStarRatingView *)self addSubview:v20];
        if ([(NSMutableArray *)self->_ratingViews indexOfObject:v20] == 0x7FFFFFFFFFFFFFFFLL) {
          [(NSMutableArray *)self->_ratingViews addObject:v20];
        }
      }
      v24.origin.x = v9 * v12;
      v24.origin.y = v13 * v9;
      v24.size.width = rect * v9;
      v24.size.height = v7 * v9;
      CGRect v25 = CGRectIntegral(v24);
      objc_msgSend(v20, "setFrame:", v25.origin.x / v9, v25.origin.y / v9, v25.size.width / v9, v25.size.height / v9);
      v26.origin.x = v12;
      v26.origin.y = v13;
      v26.size.width = rect;
      v26.size.height = v7;
      double v12 = v12 + CGRectGetWidth(v26) + self->_padding;
      double v14 = v14 + -1.0;

      ++v11;
    }
    while (v11 < [(MKStarRatingView *)self numberOfRatingLevels]);
  }
}

- (void)layoutSubviews
{
  [(MKStarRatingView *)self _layoutStarViewsCreatingIfNeeded:0];
  v3.receiver = self;
  v3.super_class = (Class)MKStarRatingView;
  [(MKStarRatingView *)&v3 layoutSubviews];
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)MKStarRatingView;
  [(MKStarRatingView *)&v3 didMoveToWindow];
  [(MKStarRatingView *)self setNeedsLayout];
}

- (void)setPadding:(double)a3
{
  self->_padding = a3;
  [(MKStarRatingView *)self invalidateIntrinsicContentSize];
}

- (void)setNumberOfRatingLevels:(unint64_t)a3
{
  if (self->_numLevels != a3)
  {
    self->_numLevels = a3;
    [(MKStarRatingView *)self _layoutStarViewsCreatingIfNeeded:1];
    [(MKStarRatingView *)self invalidateIntrinsicContentSize];
  }
}

- (void)setHighlighted:(BOOL)a3
{
  if (self->_highlighted != a3)
  {
    self->_highlighted = a3;
    [(MKStarRatingView *)self _layoutStarViewsCreatingIfNeeded:0];
    [(MKStarRatingView *)self invalidateIntrinsicContentSize];
  }
}

- (void)setRating:(double)a3
{
  if (self->_rating != a3)
  {
    self->_double rating = a3;
    [(MKStarRatingView *)self _layoutStarViewsCreatingIfNeeded:0];
    [(MKStarRatingView *)self invalidateIntrinsicContentSize];
  }
}

+ (id)colorForRating:(double)a3
{
  unint64_t v3 = vcvtpd_s64_f64(a3);
  if (v3 > 4) {
    double v4 = 0.450980395;
  }
  else {
    double v4 = dbl_18BD1C518[v3];
  }
  double v5 = [MEMORY[0x1E4F428B8] colorWithRed:1.0 green:v4 blue:0.0 alpha:1.0];

  return v5;
}

+ (id)fullStarTextAttachmentWithFont:(id)a3
{
  return (id)[a1 textAttachmentimageNamed:@"star.fill" font:a3];
}

+ (id)emptyStarTextAttachmentWithFont:(id)a3
{
  return (id)[a1 textAttachmentimageNamed:@"star" font:a3];
}

+ (id)halfStarTextAttachmentWithFont:(id)a3
{
  return (id)[a1 textAttachmentimageNamed:@"star.leadinghalf.fill" font:a3];
}

+ (id)textAttachmentimageNamed:(id)a3 font:(id)a4
{
  double v5 = (void *)MEMORY[0x1E4F42A80];
  id v6 = a4;
  double v7 = [v5 systemImageNamed:a3];
  double v8 = (void *)MEMORY[0x1E4F42A98];
  [v6 pointSize];
  double v10 = v9;

  unint64_t v11 = [v8 configurationWithPointSize:2 weight:1 scale:v10];
  double v12 = [v7 imageWithSymbolConfiguration:v11];

  double v13 = [v12 imageWithRenderingMode:2];

  id v14 = objc_alloc_init(MEMORY[0x1E4F42698]);
  [v14 setImage:v13];

  return v14;
}

+ (id)ratingShortAsAttributedString:(double)a3 baseFont:(id)a4 theme:(id)a5
{
  v27[2] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  double v8 = [a1 colorForRating:a3];
  double v9 = [a1 fullStarTextAttachmentWithFont:v7];
  double v10 = objc_msgSend(v7, "_mapkit_fontWithWeight:", *MEMORY[0x1E4F43908]);
  uint64_t v12 = *MEMORY[0x1E4F42510];
  v26[0] = *MEMORY[0x1E4F42508];
  uint64_t v11 = v26[0];
  v26[1] = v12;
  v27[0] = v7;
  v27[1] = v8;
  double v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:2];
  v24[0] = v11;
  v24[1] = v12;
  v25[0] = v10;
  v25[1] = v8;
  id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:2];
  v15 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v9];
  BOOL v16 = (void *)[v15 mutableCopy];

  objc_msgSend(v16, "addAttributes:range:", v13, 0, objc_msgSend(v16, "length"));
  id v17 = objc_alloc_init(MEMORY[0x1E4F28E48]);
  [v17 appendAttributedString:v16];
  v18 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@" " attributes:0];
  [v17 appendAttributedString:v18];

  id v19 = objc_alloc(MEMORY[0x1E4F28B18]);
  v20 = objc_msgSend(NSString, "stringWithFormat:", @"%.1f", *(void *)&a3);

  id v21 = (void *)[v19 initWithString:v20 attributes:v14];
  [v17 appendAttributedString:v21];

  v22 = (void *)[v17 copy];

  return v22;
}

+ (id)ratingAsAttributedString:(double)a3 baseFont:(id)a4 style:(int64_t)a5 theme:(id)a6
{
  v48[2] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a6;
  if (!v10)
  {
    uint64_t v12 = +[MKFontManager sharedManager];
    id v10 = [v12 subtitleFont];
  }
  if (a5 == 3)
  {
    double v13 = [a1 ratingShortAsAttributedString:v10 baseFont:v11 theme:a3];
    goto LABEL_32;
  }
  int IsRightToLeft = MKApplicationLayoutDirectionIsRightToLeft();
  if (a5 != 1)
  {
    id v15 = [MEMORY[0x1E4F428B8] tertiaryLabelColor];
LABEL_9:
    id v17 = [a1 colorForRating:a3];
    if (!v17)
    {
      id v17 = v15;
      id v15 = v17;
    }
    BOOL v16 = v17;
    goto LABEL_12;
  }
  id v15 = [MEMORY[0x1E4F428B8] colorWithRed:1.0 green:0.588235319 blue:0.0 alpha:1.0];
  BOOL v16 = v15;
  if (!v15) {
    goto LABEL_9;
  }
LABEL_12:
  id v18 = v10;
  id v19 = v18;
  double v13 = 0;
  if (!v18 || !v16 || !v15) {
    goto LABEL_31;
  }
  int v39 = IsRightToLeft;
  id v41 = v10;
  id v42 = v11;
  uint64_t v21 = *MEMORY[0x1E4F42510];
  v47[0] = *MEMORY[0x1E4F42508];
  uint64_t v20 = v47[0];
  v47[1] = v21;
  v48[0] = v18;
  v48[1] = v16;
  v38 = v16;
  v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:v47 count:2];
  v45[0] = v20;
  v45[1] = v21;
  v46[0] = v19;
  v46[1] = v15;
  id v40 = v15;
  v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:v45 count:2];
  id v23 = objc_alloc_init(MEMORY[0x1E4F28E48]);
  double v24 = round(a3 + a3) * 0.5;
  uint64_t v25 = 5;
  int64_t v44 = a5;
  do
  {
    if (v24 >= 1.0)
    {
      CGRect v26 = (void *)MEMORY[0x1E4F28B18];
      uint64_t v27 = [a1 fullStarTextAttachmentWithFont:v19];
      goto LABEL_20;
    }
    if (v24 == 0.5)
    {
      CGRect v26 = (void *)MEMORY[0x1E4F28B18];
      uint64_t v27 = [a1 halfStarTextAttachmentWithFont:v19];
LABEL_20:
      v28 = (void *)v27;
      v29 = [v26 attributedStringWithAttachment:v27];
      id v30 = (id)[v29 mutableCopy];

      objc_msgSend(v30, "addAttributes:range:", v22, 0, objc_msgSend(v30, "length"));
      [v23 appendAttributedString:v30];
      goto LABEL_21;
    }
    if (a5 == 1)
    {
      v31 = [a1 emptyStarTextAttachmentWithFont:v19];
      v32 = v22;
    }
    else
    {
      v31 = [a1 fullStarTextAttachmentWithFont:v19];
      v32 = v43;
    }
    v33 = (void *)MEMORY[0x1E4F28B18];
    id v30 = v32;
    v34 = [v33 attributedStringWithAttachment:v31];
    v35 = (void *)[v34 mutableCopy];

    objc_msgSend(v35, "addAttributes:range:", v30, 0, objc_msgSend(v35, "length"));
    [v23 appendAttributedString:v35];

    a5 = v44;
LABEL_21:

    double v24 = v24 + -1.0;
    --v25;
  }
  while (v25);
  if (v39) {
    v36 = &unk_1ED97F5F0;
  }
  else {
    v36 = &unk_1ED97F608;
  }
  objc_msgSend(v23, "addAttribute:value:range:", *MEMORY[0x1E4F425E0], v36, 0, objc_msgSend(v23, "length"));
  double v13 = (void *)[v23 copy];

  id v10 = v41;
  id v11 = v42;
  id v15 = v40;
  BOOL v16 = v38;
LABEL_31:

LABEL_32:

  return v13;
}

- (int64_t)starStyle
{
  return self->_starStyle;
}

- (void)setStarStyle:(int64_t)a3
{
  self->_starStyle = a3;
}

- (unint64_t)numberOfRatingLevels
{
  return self->_numLevels;
}

- (double)rating
{
  return self->_rating;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (UIImage)fullStarImage
{
  return self->_fullStarImage;
}

- (void)setFullStarImage:(id)a3
{
}

- (UIImage)halfStarImage
{
  return self->_halfStarImage;
}

- (void)setHalfStarImage:(id)a3
{
}

- (UIImage)emptyStarImage
{
  return self->_emptyStarImage;
}

- (void)setEmptyStarImage:(id)a3
{
}

- (UIImage)fullStarHighlightedImage
{
  return self->_fullStarHighlightedImage;
}

- (void)setFullStarHighlightedImage:(id)a3
{
}

- (UIImage)halfStarHighlightedImage
{
  return self->_halfStarHighlightedImage;
}

- (void)setHalfStarHighlightedImage:(id)a3
{
}

- (UIImage)emptyStarHighlightedImage
{
  return self->_emptyStarHighlightedImage;
}

- (void)setEmptyStarHighlightedImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emptyStarHighlightedImage, 0);
  objc_storeStrong((id *)&self->_halfStarHighlightedImage, 0);
  objc_storeStrong((id *)&self->_fullStarHighlightedImage, 0);
  objc_storeStrong((id *)&self->_emptyStarImage, 0);
  objc_storeStrong((id *)&self->_halfStarImage, 0);
  objc_storeStrong((id *)&self->_fullStarImage, 0);

  objc_storeStrong((id *)&self->_ratingViews, 0);
}

@end