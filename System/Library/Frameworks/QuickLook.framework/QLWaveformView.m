@interface QLWaveformView
- (AVAsset)asset;
- (CGRect)visibleRect;
- (UIImage)placeholderImage;
- (void)_expandWaveform;
- (void)_updateWithWaveformImage:(id)a3;
- (void)layoutSubviews;
- (void)setAsset:(id)a3;
- (void)setPlaceholderImage:(id)a3;
- (void)setVisibleRect:(CGRect)a3;
- (void)updateImage;
@end

@implementation QLWaveformView

- (void)setAsset:(id)a3
{
  v5 = (AVAsset *)a3;
  p_asset = &self->_asset;
  if (self->_asset != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_asset, a3);
    p_asset = (AVAsset **)[(QLWaveformView *)self updateImage];
    v5 = v7;
  }

  MEMORY[0x270F9A758](p_asset, v5);
}

- (void)updateImage
{
  v37[4] = *MEMORY[0x263EF8340];
  v3 = (NSObject **)MEMORY[0x263F62940];
  v4 = *MEMORY[0x263F62940];
  if (!*MEMORY[0x263F62940])
  {
    QLSInitLogging();
    v4 = *v3;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_217F61000, v4, OS_LOG_TYPE_DEFAULT, "Updating waveform image #Waveform", buf, 2u);
  }
  if (!self->_asset
    || (p_waveSize = &self->_waveSize, self->_waveSize.height == 0.0)
    || (double v6 = p_waveSize->width, p_waveSize->width == 0.0))
  {
    waveImage = self->_waveImage;
    self->_waveImage = 0;
  }
  else
  {
    if (!self->_lineView)
    {
      v8 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", 0.0, self->_waveSize.height * 0.5 + -0.5, p_waveSize->width, 1.0);
      lineView = self->_lineView;
      self->_lineView = v8;

      v10 = [MEMORY[0x263F825C8] systemGrayColor];
      [(UIView *)self->_lineView setBackgroundColor:v10];

      [(QLWaveformView *)self addSubview:self->_lineView];
    }
    waveView = self->_waveView;
    if (!waveView)
    {
      id v12 = objc_alloc(MEMORY[0x263F82828]);
      v13 = (UIImageView *)objc_msgSend(v12, "initWithFrame:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
      v14 = self->_waveView;
      self->_waveView = v13;

      [(UIImageView *)self->_waveView setTranslatesAutoresizingMaskIntoConstraints:0];
      [(QLWaveformView *)self addSubview:self->_waveView];
      v31 = [(UIImageView *)self->_waveView leftAnchor];
      v30 = [(QLWaveformView *)self leftAnchor];
      v29 = [v31 constraintEqualToAnchor:v30];
      v37[0] = v29;
      v28 = [(UIImageView *)self->_waveView rightAnchor];
      v27 = [(QLWaveformView *)self rightAnchor];
      v26 = [v28 constraintEqualToAnchor:v27];
      v37[1] = v26;
      v15 = [(UIImageView *)self->_waveView bottomAnchor];
      v16 = [(QLWaveformView *)self bottomAnchor];
      v17 = [v15 constraintEqualToAnchor:v16];
      v37[2] = v17;
      v18 = [(UIImageView *)self->_waveView topAnchor];
      v19 = [(QLWaveformView *)self topAnchor];
      v20 = [v18 constraintEqualToAnchor:v19];
      v37[3] = v20;
      v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:4];
      [(QLWaveformView *)self addConstraints:v21];

      waveView = self->_waveView;
    }
    v22 = [(UIImageView *)waveView image];
    BOOL v23 = v22 == 0;

    if (v23)
    {
      *(void *)buf = 0;
      v34 = buf;
      uint64_t v35 = 0x2020000000;
      char v36 = 1;
      double width = p_waveSize->width;
      v25 = [(QLWaveformView *)self asset];
      v32[0] = MEMORY[0x263EF8330];
      v32[1] = 3221225472;
      v32[2] = __29__QLWaveformView_updateImage__block_invoke;
      v32[3] = &unk_2642F63B0;
      v32[4] = self;
      v32[5] = buf;
      +[QLWaveformScrubberViewProvider generateWaveformForWidth:v25 asset:v32 updateHandler:width];

      _Block_object_dispose(buf, 8);
    }
  }
}

void __29__QLWaveformView_updateImage__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  double v6 = (NSObject **)MEMORY[0x263F62940];
  v7 = *MEMORY[0x263F62940];
  if (!*MEMORY[0x263F62940])
  {
    QLSInitLogging();
    v7 = *v6;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_217F61000, v7, OS_LOG_TYPE_DEFAULT, "Waveform image delivered #Waveform", v8, 2u);
  }
  [*(id *)(a1 + 32) _updateWithWaveformImage:v5];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    [*(id *)(a1 + 32) _expandWaveform];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
}

- (void)_expandWaveform
{
  [(UIImageView *)self->_waveView setAlpha:0.0];
  long long v3 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&v8.a = *MEMORY[0x263F000D0];
  *(_OWORD *)&v8.c = v3;
  *(_OWORD *)&v8.tx = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  CGAffineTransformScale(&v9, &v8, 1.0, 0.0);
  waveView = self->_waveView;
  CGAffineTransform v7 = v9;
  [(UIImageView *)waveView setTransform:&v7];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __33__QLWaveformView__expandWaveform__block_invoke;
  v6[3] = &unk_2642F5430;
  v6[4] = self;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __33__QLWaveformView__expandWaveform__block_invoke_2;
  v5[3] = &unk_2642F5458;
  v5[4] = self;
  [MEMORY[0x263F82E00] animateWithDuration:0 delay:v6 usingSpringWithDamping:v5 initialSpringVelocity:0.3 options:0.0 animations:0.98 completion:40.0];
}

uint64_t __33__QLWaveformView__expandWaveform__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 424) setAlpha:0.0];
  [*(id *)(*(void *)(a1 + 32) + 440) setAlpha:1.0];
  v2 = *(void **)(*(void *)(a1 + 32) + 440);
  long long v3 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v5[0] = *MEMORY[0x263F000D0];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  return [v2 setTransform:v5];
}

void __33__QLWaveformView__expandWaveform__block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 424) removeFromSuperview];
  uint64_t v2 = *(void *)(a1 + 32);
  long long v3 = *(void **)(v2 + 424);
  *(void *)(v2 + 424) = 0;
}

- (void)_updateWithWaveformImage:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x263F82E00];
  waveView = self->_waveView;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __43__QLWaveformView__updateWithWaveformImage___block_invoke;
  v8[3] = &unk_2642F50C8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v5 transitionWithView:waveView duration:5242880 options:v8 animations:0 completion:0.25];
}

void __43__QLWaveformView__updateWithWaveformImage___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 440) setImage:*(void *)(a1 + 40)];
  v1 = (NSObject **)MEMORY[0x263F62940];
  uint64_t v2 = *MEMORY[0x263F62940];
  if (!*MEMORY[0x263F62940])
  {
    QLSInitLogging();
    uint64_t v2 = *v1;
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long v3 = 0;
    _os_log_impl(&dword_217F61000, v2, OS_LOG_TYPE_DEFAULT, "Waveform image was updated. #Waveform", v3, 2u);
  }
}

- (void)layoutSubviews
{
  p_waveSize = &self->_waveSize;
  [(QLWaveformView *)self frame];
  double height = p_waveSize->height;
  if (p_waveSize->width != v6 || height != v4)
  {
    [(QLWaveformView *)self frame];
    p_waveSize->double width = v8;
    p_waveSize->double height = v9;
    [(QLWaveformView *)self updateImage];
  }
  v10.receiver = self;
  v10.super_class = (Class)QLWaveformView;
  [(QLWaveformView *)&v10 layoutSubviews];
}

- (AVAsset)asset
{
  return self->_asset;
}

- (UIImage)placeholderImage
{
  return self->placeholderImage;
}

- (void)setPlaceholderImage:(id)a3
{
}

- (CGRect)visibleRect
{
  double x = self->visibleRect.origin.x;
  double y = self->visibleRect.origin.y;
  double width = self->visibleRect.size.width;
  double height = self->visibleRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setVisibleRect:(CGRect)a3
{
  self->visibleRect = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->placeholderImage, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_waveView, 0);
  objc_storeStrong((id *)&self->_waveImage, 0);

  objc_storeStrong((id *)&self->_lineView, 0);
}

@end