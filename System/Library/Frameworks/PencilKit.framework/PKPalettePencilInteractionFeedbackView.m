@interface PKPalettePencilInteractionFeedbackView
- (PKPalettePencilInteractionFeedbackView)init;
- (PKPaletteToolPreview)toolPreview;
- (UIView)backgroundView;
- (UIView)clippingView;
- (void)_setCornerRadius:(double)a3;
- (void)layoutSubviews;
- (void)setBackgroundView:(id)a3;
- (void)setClippingView:(id)a3;
- (void)setToolPreview:(id)a3;
- (void)showPreviewForTool:(id)a3 scalingFactor:(double)a4 animated:(BOOL)a5;
@end

@implementation PKPalettePencilInteractionFeedbackView

- (PKPalettePencilInteractionFeedbackView)init
{
  v10.receiver = self;
  v10.super_class = (Class)PKPalettePencilInteractionFeedbackView;
  v2 = [(PKPalettePencilInteractionFeedbackView *)&v10 init];
  if (v2)
  {
    v3 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    clippingView = v2->_clippingView;
    v2->_clippingView = v3;

    [(UIView *)v2->_clippingView setClipsToBounds:1];
    [(PKPalettePencilInteractionFeedbackView *)v2 addSubview:v2->_clippingView];
    uint64_t v5 = +[PKPaletteView makeBackgroundView];
    backgroundView = v2->_backgroundView;
    v2->_backgroundView = (UIView *)v5;

    if (v2->_backgroundView) {
      -[UIView addSubview:](v2->_clippingView, "addSubview:");
    }
    v7 = objc_alloc_init(PKPaletteToolPreview);
    toolPreview = v2->_toolPreview;
    v2->_toolPreview = v7;

    [(UIView *)v2->_clippingView addSubview:v2->_toolPreview];
  }
  return v2;
}

- (void)_setCornerRadius:(double)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PKPalettePencilInteractionFeedbackView;
  [(PKPalettePencilInteractionFeedbackView *)&v7 _setCornerRadius:a3];
  [(PKPalettePencilInteractionFeedbackView *)self _cornerRadius];
  double v5 = v4;
  v6 = [(PKPalettePencilInteractionFeedbackView *)self clippingView];
  [v6 _setCornerRadius:v5];
}

- (void)layoutSubviews
{
  v30.receiver = self;
  v30.super_class = (Class)PKPalettePencilInteractionFeedbackView;
  [(PKPalettePencilInteractionFeedbackView *)&v30 layoutSubviews];
  [(PKPalettePencilInteractionFeedbackView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(PKPalettePencilInteractionFeedbackView *)self clippingView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  [(PKPalettePencilInteractionFeedbackView *)self bounds];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  v20 = [(PKPalettePencilInteractionFeedbackView *)self backgroundView];
  objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);

  [(PKPalettePencilInteractionFeedbackView *)self bounds];
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  v29 = [(PKPalettePencilInteractionFeedbackView *)self toolPreview];
  objc_msgSend(v29, "setFrame:", v22, v24, v26, v28);
}

- (void)showPreviewForTool:(id)a3 scalingFactor:(double)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  double v9 = [(PKPalettePencilInteractionFeedbackView *)self toolPreview];
  [v9 setScalingFactor:a4];

  id v10 = [(PKPalettePencilInteractionFeedbackView *)self toolPreview];
  [v10 showPreviewForTool:v8 animated:v5];
}

- (UIView)clippingView
{
  return self->_clippingView;
}

- (void)setClippingView:(id)a3
{
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (PKPaletteToolPreview)toolPreview
{
  return self->_toolPreview;
}

- (void)setToolPreview:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toolPreview, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);

  objc_storeStrong((id *)&self->_clippingView, 0);
}

@end