@interface _PKInkThicknessButton
- (CGSize)sizeThatFits:(CGSize)a3;
- (id)backgroundColorForIsSelected:(int)a3 highlighted:;
- (id)imageTintColorForIsSelected:(int)a3 highlighted:;
- (id)initWithAssetImage:(double)a3 weight:(double)a4 buttonSize:(double)a5;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (void)didTouchUpInside;
- (void)layoutSubviews;
- (void)setHighlighted:(BOOL)a3;
- (void)setImageTintColorOverride:(uint64_t)a1;
- (void)setSelected:(BOOL)a3;
- (void)setSelected:(int)a3 animated:;
@end

@implementation _PKInkThicknessButton

- (id)initWithAssetImage:(double)a3 weight:(double)a4 buttonSize:(double)a5
{
  id v10 = a2;
  if (a1)
  {
    v21.receiver = a1;
    v21.super_class = (Class)_PKInkThicknessButton;
    double v11 = *MEMORY[0x1E4F1DB28];
    double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    a1 = (id *)objc_msgSendSuper2(&v21, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], v12, v13, v14);
    if (a1)
    {
      if (!v10)
      {
        v15 = os_log_create("com.apple.pencilkit", "InkPicker");
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          v20[0] = 0;
          _os_log_impl(&dword_1C44F8000, v15, OS_LOG_TYPE_DEFAULT, "Should not pass nil assetImage to _PKInkThicknessButton.", (uint8_t *)v20, 2u);
        }
      }
      objc_storeStrong(a1 + 96, a2);
      *((double *)a1 + 93) = a3;
      *((double *)a1 + 97) = a4;
      *((double *)a1 + 98) = a5;
      uint64_t v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1838]), "initWithFrame:", v11, v12, v13, v14);
      id v17 = a1[95];
      a1[95] = (id)v16;

      [a1 addSubview:a1[95]];
      [a1 addTarget:a1 action:sel_didTouchUpInside forControlEvents:64];
      [a1 _setContinuousCornerRadius:9.0];
      v18 = (void *)[objc_alloc(MEMORY[0x1E4FB1AC8]) initWithDelegate:a1];
      [a1 addInteraction:v18];
    }
  }

  return a1;
}

- (void)layoutSubviews
{
  v23.receiver = self;
  v23.super_class = (Class)_PKInkThicknessButton;
  [(_PKInkThicknessButton *)&v23 layoutSubviews];
  [(_PKInkThicknessButton *)self bounds];
  if (self)
  {
    -[UIImageView setFrame:](self->_inkImageView, "setFrame:");
    inkImageView = self->_inkImageView;
  }
  else
  {
    objc_msgSend(0, "setFrame:");
    inkImageView = 0;
  }
  v4 = inkImageView;
  [(UIImageView *)v4 bounds];
  if (self)
  {
    CGFloat x = self->_lastRenderedBounds.origin.x;
    CGFloat y = self->_lastRenderedBounds.origin.y;
    CGFloat width = self->_lastRenderedBounds.size.width;
    CGFloat height = self->_lastRenderedBounds.size.height;
  }
  else
  {
    CGFloat y = 0.0;
    CGFloat width = 0.0;
    CGFloat height = 0.0;
    CGFloat x = 0.0;
  }
  BOOL v13 = CGRectEqualToRect(*(CGRect *)&v5, *(CGRect *)&x);

  if (!v13)
  {
    if (self) {
      double v14 = self->_inkImageView;
    }
    else {
      double v14 = 0;
    }
    v15 = v14;
    [(UIImageView *)v15 bounds];
    if (self)
    {
      self->_lastRenderedBounds.origin.CGFloat x = v16;
      self->_lastRenderedBounds.origin.CGFloat y = v17;
      self->_lastRenderedBounds.size.CGFloat width = v18;
      self->_lastRenderedBounds.size.CGFloat height = v19;
    }

    [(UIImageView *)self->_inkImageView setImage:self->_assetImage];
  }
  v20 = -[_PKInkThicknessButton backgroundColorForIsSelected:highlighted:](self, [(_PKInkThicknessButton *)self isSelected], 0);
  [(_PKInkThicknessButton *)self setBackgroundColor:v20];

  objc_super v21 = -[_PKInkThicknessButton imageTintColorForIsSelected:highlighted:]((uint64_t)self, [(_PKInkThicknessButton *)self isSelected], 0);
  if (self) {
    v22 = self->_inkImageView;
  }
  else {
    v22 = 0;
  }
  [(UIImageView *)v22 setTintColor:v21];
}

- (id)backgroundColorForIsSelected:(int)a3 highlighted:
{
  if (a1)
  {
    if (a3)
    {
      if (a2)
      {
        a1 = objc_msgSend(MEMORY[0x1E4FB1618], "pk_thicknessButtonLightGrayUseSystemColor:", 1);
LABEL_8:
        uint64_t v3 = vars8;
        goto LABEL_9;
      }
    }
    else if (a2)
    {
      a1 = objc_msgSend(MEMORY[0x1E4FB1618], "pk_thicknessButtonBackgroundUseSystemColor:", 1);
      goto LABEL_8;
    }
    a1 = [MEMORY[0x1E4FB1618] clearColor];
    goto LABEL_8;
  }
LABEL_9:
  return a1;
}

- (id)imageTintColorForIsSelected:(int)a3 highlighted:
{
  if (a1)
  {
    if (a3)
    {
      uint64_t v3 = (void *)MEMORY[0x1E4FB1618];
      if (!a2)
      {
        uint64_t v4 = objc_msgSend(MEMORY[0x1E4FB1618], "pk_thicknessButtonLightGrayUseSystemColor:", 1);
LABEL_8:
        uint64_t v5 = (void *)v4;
        goto LABEL_13;
      }
    }
    else
    {
      if (!a2)
      {
        id v6 = *(id *)(a1 + 752);
        v7 = v6;
        if (v6)
        {
          id v8 = v6;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E4FB1618], "pk_thicknessButtonBlackUseSystemColor:", 1);
          id v8 = (id)objc_claimAutoreleasedReturnValue();
        }
        uint64_t v5 = v8;

        goto LABEL_13;
      }
      uint64_t v3 = (void *)MEMORY[0x1E4FB1618];
    }
    uint64_t v4 = objc_msgSend(v3, "pk_thicknessButtonWhiteUseSystemColor:", 1);
    goto LABEL_8;
  }
  uint64_t v5 = 0;
LABEL_13:

  return v5;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = self->_buttonSize.width;
  double height = self->_buttonSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setHighlighted:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_PKInkThicknessButton;
  -[_PKInkThicknessButton setHighlighted:](&v5, sel_setHighlighted_);
  if (self)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __52___PKInkThicknessButton__animateToHighlightedState___block_invoke;
    v6[3] = &unk_1E64C8030;
    v6[4] = self;
    BOOL v7 = a3;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:327684 delay:v6 options:&__block_literal_global_83 animations:0.3 completion:0.0];
  }
}

- (void)setSelected:(BOOL)a3
{
}

- (void)setSelected:(int)a3 animated:
{
  if (a1 && [a1 isSelected] != a2)
  {
    v10.receiver = a1;
    v10.super_class = (Class)_PKInkThicknessButton;
    objc_msgSendSuper2(&v10, sel_setSelected_, a2);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __46___PKInkThicknessButton_setSelected_animated___block_invoke;
    v8[3] = &unk_1E64C8030;
    v8[4] = a1;
    char v9 = a2;
    id v6 = _Block_copy(v8);
    BOOL v7 = v6;
    if (a3) {
      [MEMORY[0x1E4FB1EB0] animateWithDuration:327684 delay:v6 options:0 animations:0.3 completion:0.0];
    }
    else {
      (*((void (**)(void *))v6 + 2))(v6);
    }
  }
}

- (void)didTouchUpInside
{
  uint64_t v3 = [(_PKInkThicknessButton *)self isSelected] ^ 1;

  -[_PKInkThicknessButton setSelected:animated:](self, v3, 1);
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  objc_super v5 = (void *)MEMORY[0x1E4FB1AD8];
  [(_PKInkThicknessButton *)self bounds];

  return (id)objc_msgSend(v5, "regionWithRect:identifier:", 0);
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4FB1D48]) initWithView:self];
  objc_super v5 = [MEMORY[0x1E4FB1AC0] effectWithPreview:v4];
  id v6 = [MEMORY[0x1E4FB1AE8] styleWithEffect:v5 shape:0];

  return v6;
}

- (void)setImageTintColorOverride:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 752), a2);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetImage, 0);
  objc_storeStrong((id *)&self->_inkImageView, 0);

  objc_storeStrong((id *)&self->_imageTintColorOverride, 0);
}

@end