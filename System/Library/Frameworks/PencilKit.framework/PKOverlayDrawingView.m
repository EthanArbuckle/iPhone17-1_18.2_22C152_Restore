@interface PKOverlayDrawingView
- (PKOverlayDrawingView)initWithFrame:(CGRect)a3;
- (id)imageView;
- (void)hideImageViewWithDuration:(double)a3;
- (void)showImageView:(uint64_t)a3 frame:(double)a4 animationType:(double)a5 animationDuration:(double)a6;
@end

@implementation PKOverlayDrawingView

- (PKOverlayDrawingView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKOverlayDrawingView;
  v3 = -[PKOverlayDrawingView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(PKOverlayDrawingView *)v3 setUserInteractionEnabled:1];
    [(PKOverlayDrawingView *)v4 setClipsToBounds:0];
  }
  return v4;
}

- (id)imageView
{
  if (WeakRetained)
  {
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 51);
    uint64_t v1 = vars8;
  }
  return WeakRetained;
}

- (void)showImageView:(uint64_t)a3 frame:(double)a4 animationType:(double)a5 animationDuration:(double)a6
{
  id v14 = a2;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 51);
    [a1 frame];
    double v17 = v16 - a4;
    double v19 = v18 - a5;
    objc_storeWeak(a1 + 51, v14);
    if (a3 == 1) {
      double v20 = a7 * 1.5 + 0.0;
    }
    else {
      double v20 = 0.0;
    }
    v21 = (void *)MEMORY[0x1E4FB1EB0];
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __76__PKOverlayDrawingView_showImageView_frame_animationType_animationDuration___block_invoke;
    v41[3] = &unk_1E64C8AF0;
    v41[4] = a1;
    double v44 = a4;
    double v45 = a5;
    double v46 = a6;
    double v47 = a7;
    id v22 = WeakRetained;
    id v42 = v22;
    double v48 = v17;
    double v49 = v19;
    id v23 = v14;
    id v43 = v23;
    uint64_t v50 = 0;
    double v51 = v20;
    double v52 = a6;
    double v53 = a7;
    [v21 performWithoutAnimation:v41];
    v24 = (void *)MEMORY[0x1E4FB1EB0];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __76__PKOverlayDrawingView_showImageView_frame_animationType_animationDuration___block_invoke_2;
    v34[3] = &unk_1E64C8B18;
    uint64_t v37 = 0;
    uint64_t v38 = 0;
    id v35 = v23;
    double v39 = a6;
    double v40 = a7;
    id v36 = v22;
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __76__PKOverlayDrawingView_showImageView_frame_animationType_animationDuration___block_invoke_3;
    v27[3] = &unk_1E64C8B40;
    id v28 = v36;
    uint64_t v30 = 0;
    uint64_t v31 = 0;
    id v29 = v35;
    double v32 = a6;
    double v33 = a7;
    id v25 = v36;
    [v24 _animateUsingSpringWithDuration:0 delay:v34 options:v27 mass:a8 stiffness:0.0 damping:1.0 initialVelocity:400.0 animations:20.0 completion:0.0];
  }
}

uint64_t __76__PKOverlayDrawingView_showImageView_frame_animationType_animationDuration___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  v2 = *(void **)(a1 + 40);
  if (v2)
  {
    [v2 frame];
    objc_msgSend(*(id *)(a1 + 40), "setFrame:", *(double *)(a1 + 88) + v3, v4 + *(double *)(a1 + 96));
  }
  double v5 = *(double *)(a1 + 104);
  double v6 = *(double *)(a1 + 112);
  double v7 = *(double *)(a1 + 120);
  double v8 = *(double *)(a1 + 128);
  v9 = *(void **)(a1 + 48);

  return objc_msgSend(v9, "setFrame:", v5, v6, v7, v8);
}

uint64_t __76__PKOverlayDrawingView_showImageView_frame_animationType_animationDuration___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  [*(id *)(a1 + 32) setAlpha:1.0];
  v2 = *(void **)(a1 + 40);

  return [v2 setAlpha:0.0];
}

uint64_t __76__PKOverlayDrawingView_showImageView_frame_animationType_animationDuration___block_invoke_3(uint64_t a1)
{
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  [*(id *)(a1 + 32) removeFromSuperview];
  objc_msgSend(*(id *)(a1 + 40), "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  v2 = (void *)MEMORY[0x1E4F39CF8];

  return [v2 commit];
}

- (void)hideImageViewWithDuration:(double)a3
{
  if (a1)
  {
    objc_setProperty_nonatomic_copy((id)a1, a2, &stru_1F1FB2C00, 424);
    long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DB20] + 16);
    *(_OWORD *)(a1 + 432) = *MEMORY[0x1E4F1DB20];
    *(_OWORD *)(a1 + 448) = v5;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 408));
    double v7 = WeakRetained;
    if (WeakRetained)
    {
      double v8 = (void *)MEMORY[0x1E4FB1EB0];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __50__PKOverlayDrawingView_hideImageViewWithDuration___block_invoke;
      v11[3] = &unk_1E64C61C0;
      id v12 = WeakRetained;
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __50__PKOverlayDrawingView_hideImageViewWithDuration___block_invoke_2;
      v9[3] = &unk_1E64C6730;
      id v10 = v12;
      [v8 animateWithDuration:v11 animations:v9 completion:a3];
    }
  }
}

uint64_t __50__PKOverlayDrawingView_hideImageViewWithDuration___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __50__PKOverlayDrawingView_hideImageViewWithDuration___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setImage:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentContent, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_destroyWeak((id *)&self->_imageView);
}

@end