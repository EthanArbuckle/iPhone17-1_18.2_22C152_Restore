@interface EKCustomTitleView
- (BOOL)animating;
- (BOOL)isAccessibilityElement;
- (BOOL)showSubtitle;
- (CGRect)_centerAndClipFrame:(CGRect)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (EKCustomTitleView)initWithTitle:(id)a3 subTitle:(id)a4 eventViewController:(id)a5;
- (UIImageView)originalImage;
- (UIImageView)titleImage;
- (UILabel)originalTitle;
- (UILabel)subTitle;
- (UILabel)title;
- (id)accessibilityElementAtIndex:(int64_t)a3;
- (int64_t)accessibilityElementCount;
- (int64_t)indexOfAccessibilityElement:(id)a3;
- (void)animateInWithCompletionBlock:(id)a3;
- (void)animateOutWithCompletionBlock:(id)a3;
- (void)layoutSubviews;
- (void)setAnimating:(BOOL)a3;
- (void)setOriginalImage:(id)a3;
- (void)setOriginalTitle:(id)a3;
- (void)setShowSubtitle:(BOOL)a3;
- (void)setSubTitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleImage:(id)a3;
@end

@implementation EKCustomTitleView

- (EKCustomTitleView)initWithTitle:(id)a3 subTitle:(id)a4 eventViewController:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  v32.receiver = self;
  v32.super_class = (Class)EKCustomTitleView;
  v9 = [(EKCustomTitleView *)&v32 init];
  if (v9)
  {
    uint64_t v10 = objc_opt_new();
    originalTitle = v9->_originalTitle;
    v9->_originalTitle = (UILabel *)v10;

    [(UILabel *)v9->_originalTitle setText:v7];
    double v12 = *MEMORY[0x1E4FB09E0];
    v13 = [MEMORY[0x1E4FB08E0] systemFontOfSize:17.0 weight:*MEMORY[0x1E4FB09E0]];
    [(UILabel *)v9->_originalTitle setFont:v13];

    v14 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)v9->_originalTitle setTextColor:v14];

    [(UILabel *)v9->_originalTitle setTextAlignment:1];
    [(EKCustomTitleView *)v9 addSubview:v9->_originalTitle];
    [(UILabel *)v9->_originalTitle sizeToFit];
    id v15 = objc_alloc(MEMORY[0x1E4FB1838]);
    v16 = captureImageFromView(v9->_originalTitle, 0);
    uint64_t v17 = [v15 initWithImage:v16];
    originalImage = v9->_originalImage;
    v9->_originalImage = (UIImageView *)v17;

    [(EKCustomTitleView *)v9 addSubview:v9->_originalImage];
    [(UILabel *)v9->_originalTitle setAlpha:0.0];
    uint64_t v19 = objc_opt_new();
    title = v9->_title;
    v9->_title = (UILabel *)v19;

    [(UILabel *)v9->_title setText:v7];
    v21 = [MEMORY[0x1E4FB08E0] systemFontOfSize:15.0 weight:v12];
    [(UILabel *)v9->_title setFont:v21];

    v22 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)v9->_title setTextColor:v22];

    [(UILabel *)v9->_title setTextAlignment:1];
    [(EKCustomTitleView *)v9 addSubview:v9->_title];
    [(UILabel *)v9->_title sizeToFit];
    id v23 = objc_alloc(MEMORY[0x1E4FB1838]);
    v24 = captureImageFromView(v9->_title, 0);
    uint64_t v25 = [v23 initWithImage:v24];
    titleImage = v9->_titleImage;
    v9->_titleImage = (UIImageView *)v25;

    [(EKCustomTitleView *)v9 addSubview:v9->_titleImage];
    [(UILabel *)v9->_title setAlpha:0.0];
    uint64_t v27 = objc_opt_new();
    subTitle = v9->_subTitle;
    v9->_subTitle = (UILabel *)v27;

    [(UILabel *)v9->_subTitle setText:v8];
    v29 = [MEMORY[0x1E4FB08E0] systemFontOfSize:11.0 weight:*MEMORY[0x1E4FB09D0]];
    [(UILabel *)v9->_subTitle setFont:v29];

    v30 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)v9->_subTitle setTextColor:v30];

    [(UILabel *)v9->_subTitle setTextAlignment:1];
    [(UILabel *)v9->_subTitle setAlpha:0.0];
    [(EKCustomTitleView *)v9 addSubview:v9->_subTitle];
  }
  [(EKCustomTitleView *)v9 sizeToFit];

  return v9;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  -[UILabel sizeThatFits:](self->_originalTitle, "sizeThatFits:");
  double v7 = v6;
  -[UILabel sizeThatFits:](self->_subTitle, "sizeThatFits:", width, height);
  if (v7 >= v8) {
    double v8 = v7;
  }
  double v9 = 44.0;
  result.double height = v9;
  result.double width = v8;
  return result;
}

- (CGRect)_centerAndClipFrame:(CGRect)a3
{
  CGFloat rect = a3.origin.x;
  CGFloat rect_8 = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  v5 = [(EKCustomTitleView *)self window];
  [v5 bounds];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;

  [(EKCustomTitleView *)self bounds];
  double v16 = v15;
  CGFloat rect_16 = v17;
  CGFloat rect_24 = v18;
  CGFloat v19 = v14;
  if (width >= v14) {
    double width = v14;
  }
  v42.origin.x = v7;
  v42.origin.CGFloat y = v9;
  v42.size.double width = v11;
  v42.size.double height = v13;
  double MinX = CGRectGetMinX(v42);
  v43.origin.x = v7;
  v43.origin.CGFloat y = v9;
  v43.size.double width = v11;
  CGFloat v21 = v16;
  v43.size.double height = v13;
  double v22 = CGRectGetWidth(v43);
  v44.origin.x = rect;
  v44.origin.CGFloat y = y;
  v44.size.double width = width;
  v44.size.double height = rect_8;
  double v23 = MinX + (v22 - CGRectGetWidth(v44)) * 0.5;
  [(EKCustomTitleView *)self contentScaleFactor];
  double v25 = EKRoundWithScale(v23, v24);
  v26 = [(EKCustomTitleView *)self window];
  double v27 = 0.0;
  objc_msgSend(v26, "convertPoint:toView:", self, v25, 0.0);
  CGFloat v29 = v28;

  v45.origin.x = v29;
  v45.origin.CGFloat y = y;
  v45.size.double width = width;
  v45.size.double height = rect_8;
  double v30 = CGRectGetMinX(v45);
  v46.origin.x = v21;
  v46.origin.CGFloat y = rect_16;
  v46.size.double height = rect_24;
  v46.size.double width = v19;
  if (v30 >= CGRectGetMinX(v46))
  {
    v47.origin.x = v29;
    v47.origin.CGFloat y = y;
    v47.size.double width = width;
    v47.size.double height = rect_8;
    double MaxX = CGRectGetMaxX(v47);
    v48.origin.x = v21;
    v48.origin.CGFloat y = rect_16;
    v48.size.double width = v19;
    v48.size.double height = rect_24;
    if (MaxX <= CGRectGetMaxX(v48))
    {
      double v27 = v29;
    }
    else
    {
      v49.origin.x = v21;
      v49.origin.CGFloat y = rect_16;
      v49.size.double width = v19;
      v49.size.double height = rect_24;
      double v32 = CGRectGetMaxX(v49);
      v50.origin.x = v29;
      v50.origin.CGFloat y = y;
      v50.size.double width = width;
      v50.size.double height = rect_8;
      double v27 = v32 - CGRectGetWidth(v50);
    }
  }
  double v33 = v27;
  double v34 = y;
  double v35 = width;
  double v36 = rect_8;
  result.size.double height = v36;
  result.size.double width = v35;
  result.origin.CGFloat y = v34;
  result.origin.x = v33;
  return result;
}

- (void)layoutSubviews
{
  [(EKCustomTitleView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  v52.receiver = self;
  v52.super_class = (Class)EKCustomTitleView;
  [(EKCustomTitleView *)&v52 layoutSubviews];
  CGFloat v7 = [(EKCustomTitleView *)self window];

  if (v7)
  {
    if (self->_showSubtitle)
    {
      double v8 = [(UILabel *)self->_title font];
      -[UILabel sizeThatFits:](self->_title, "sizeThatFits:", v4, v6);
      double v10 = v9;
      double v12 = v11;
      [v8 ascender];
      double v14 = v13;
      [(EKCustomTitleView *)self contentScaleFactor];
      double v16 = 19.0 - EKRoundWithScale(v14, v15);
      double v17 = 1.0;
      double v18 = 0.0;
    }
    else
    {
      double v8 = [(UILabel *)self->_originalTitle font];
      -[UILabel sizeThatFits:](self->_originalTitle, "sizeThatFits:", v4, v6);
      double v10 = v19;
      double v12 = v20;
      [(EKCustomTitleView *)self bounds];
      double v22 = (v21 - v12) * 0.5;
      [(EKCustomTitleView *)self contentScaleFactor];
      double v16 = EKRoundWithScale(v22, v23);
      double v17 = 0.0;
      double v18 = 1.0;
    }
    [(UIImageView *)self->_originalImage setAlpha:v18];
    [(UIImageView *)self->_titleImage setAlpha:v17];
    [(UILabel *)self->_subTitle setAlpha:v17];
    -[UILabel sizeThatFits:](self->_subTitle, "sizeThatFits:", v4, v6);
    double v25 = v24;
    double v27 = v26;
    [v8 descender];
    double v29 = v28;
    double v30 = [(UILabel *)self->_subTitle font];
    [v30 ascender];
    double v32 = v31 - v29;
    [(EKCustomTitleView *)self contentScaleFactor];
    double v34 = 16.0 - EKRoundWithScale(v32, v33);

    v53.origin.x = 0.0;
    v53.origin.CGFloat y = v16;
    v53.size.double width = v10;
    v53.size.double height = v12;
    double v35 = v34 + CGRectGetMaxY(v53);
    -[EKCustomTitleView _centerAndClipFrame:](self, "_centerAndClipFrame:", 0.0, v16, v10, v12);
    double v37 = v36;
    double v39 = v38;
    double v41 = v40;
    double v43 = v42;
    -[EKCustomTitleView _centerAndClipFrame:](self, "_centerAndClipFrame:", 0.0, v35, v25, v27);
    double v45 = v44;
    double v47 = v46;
    double v49 = v48;
    double v51 = v50;
    -[UILabel setFrame:](self->_title, "setFrame:", v37, v39, v41, v43);
    -[UIImageView setFrame:](self->_originalImage, "setFrame:", v37, v39, v41, v43);
    -[UIImageView setFrame:](self->_titleImage, "setFrame:", v37, v39, v41, v43);
    -[UILabel setFrame:](self->_subTitle, "setFrame:", v45, v47, v49, v51);
  }
}

- (void)animateInWithCompletionBlock:(id)a3
{
  id v4 = a3;
  [(EKCustomTitleView *)self layoutIfNeeded];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__EKCustomTitleView_animateInWithCompletionBlock___block_invoke;
  v5[3] = &unk_1E6087570;
  v5[4] = self;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:v5 animations:v4 completion:0.300000012];
}

uint64_t __50__EKCustomTitleView_animateInWithCompletionBlock___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 408) = 1;
  [*(id *)(a1 + 32) setNeedsLayout];
  v2 = *(void **)(a1 + 32);

  return [v2 layoutIfNeeded];
}

- (void)animateOutWithCompletionBlock:(id)a3
{
  id v4 = a3;
  [(EKCustomTitleView *)self layoutIfNeeded];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__EKCustomTitleView_animateOutWithCompletionBlock___block_invoke;
  v5[3] = &unk_1E6087570;
  v5[4] = self;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:v5 animations:v4 completion:0.300000012];
}

uint64_t __51__EKCustomTitleView_animateOutWithCompletionBlock___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 408) = 0;
  [*(id *)(a1 + 32) setNeedsLayout];
  v2 = *(void **)(a1 + 32);

  return [v2 layoutIfNeeded];
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (int64_t)accessibilityElementCount
{
  return 2;
}

- (id)accessibilityElementAtIndex:(int64_t)a3
{
  double v3 = &OBJC_IVAR___EKCustomTitleView__subTitle;
  if (!a3) {
    double v3 = &OBJC_IVAR___EKCustomTitleView__title;
  }
  return *(id *)((char *)&self->super.super.super.isa + *v3);
}

- (int64_t)indexOfAccessibilityElement:(id)a3
{
  return self->_title != a3;
}

- (UILabel)originalTitle
{
  return (UILabel *)objc_getProperty(self, a2, 416, 1);
}

- (void)setOriginalTitle:(id)a3
{
}

- (UILabel)title
{
  return (UILabel *)objc_getProperty(self, a2, 424, 1);
}

- (void)setTitle:(id)a3
{
}

- (UIImageView)originalImage
{
  return (UIImageView *)objc_getProperty(self, a2, 432, 1);
}

- (void)setOriginalImage:(id)a3
{
}

- (UIImageView)titleImage
{
  return (UIImageView *)objc_getProperty(self, a2, 440, 1);
}

- (void)setTitleImage:(id)a3
{
}

- (UILabel)subTitle
{
  return (UILabel *)objc_getProperty(self, a2, 448, 1);
}

- (void)setSubTitle:(id)a3
{
}

- (BOOL)showSubtitle
{
  return self->_showSubtitle;
}

- (void)setShowSubtitle:(BOOL)a3
{
  self->_showSubtitle = a3;
}

- (BOOL)animating
{
  return self->_animating;
}

- (void)setAnimating:(BOOL)a3
{
  self->_animating = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subTitle, 0);
  objc_storeStrong((id *)&self->_titleImage, 0);
  objc_storeStrong((id *)&self->_originalImage, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_originalTitle, 0);
}

@end