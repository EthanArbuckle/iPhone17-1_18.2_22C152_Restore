@interface _UNMediaPlayPauseButton
- (MTMaterialView)backgroundCircle;
- (UIButton)invisibleButton;
- (_UNMaterialButton)button;
- (_UNMediaPlayPauseButton)initWithFrame:(CGRect)a3 type:(int64_t)a4;
- (int64_t)type;
- (void)_buttonTouchUpInside:(id)a3;
- (void)_updateBackground;
- (void)_updateBackgroundForAudioStyle;
- (void)_updateBackgroundForMovieStyle;
- (void)_updateSelected;
- (void)_updateSelectedForAudioStyle;
- (void)_updateSelectedForMovieStyle;
- (void)_updateSize;
- (void)_updateSizeForAudioStyle;
- (void)_updateSizeForMovieStyle;
- (void)_updateStyle;
- (void)_updateStyleForAudioStyle;
- (void)_updateStyleForMovieStyle;
- (void)_updateType;
- (void)layoutSubviews;
- (void)setBackgroundCircle:(id)a3;
- (void)setButton:(id)a3;
- (void)setInvisibleButton:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setType:(int64_t)a3;
- (void)tintColorDidChange;
@end

@implementation _UNMediaPlayPauseButton

- (_UNMediaPlayPauseButton)initWithFrame:(CGRect)a3 type:(int64_t)a4
{
  v16.receiver = self;
  v16.super_class = (Class)_UNMediaPlayPauseButton;
  v5 = -[_UNMediaPlayPauseButton initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v5)
  {
    v6 = [_UNMaterialButton alloc];
    double v7 = *MEMORY[0x263F001A8];
    double v8 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v9 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v10 = *(double *)(MEMORY[0x263F001A8] + 24);
    uint64_t v11 = -[_UNMaterialButton initWithFrame:](v6, "initWithFrame:", *MEMORY[0x263F001A8], v8, v9, v10);
    button = v5->_button;
    v5->_button = (_UNMaterialButton *)v11;

    [(_UNMaterialButton *)v5->_button setContentMode:0];
    [(_UNMaterialButton *)v5->_button setContentHorizontalAlignment:3];
    [(_UNMaterialButton *)v5->_button setContentVerticalAlignment:3];
    [(_UNMaterialButton *)v5->_button addTarget:v5 action:sel__buttonTouchUpInside_ forControlEvents:64];
    [(_UNMediaPlayPauseButton *)v5 addSubview:v5->_button];
    uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x263F1C488]), "initWithFrame:", v7, v8, v9, v10);
    invisibleButton = v5->_invisibleButton;
    v5->_invisibleButton = (UIButton *)v13;

    [(UIButton *)v5->_invisibleButton addTarget:v5 action:sel__buttonTouchUpInside_ forControlEvents:64];
    [(_UNMediaPlayPauseButton *)v5 addSubview:v5->_invisibleButton];
    v5->_type = a4;
    [(_UNMediaPlayPauseButton *)v5 setNeedsLayout];
  }
  return v5;
}

- (void)layoutSubviews
{
  [(_UNMediaPlayPauseButton *)self _updateBackground];
  [(_UNMediaPlayPauseButton *)self _updateSize];
  [(_UNMediaPlayPauseButton *)self _updateStyle];

  [(_UNMediaPlayPauseButton *)self _updateSelected];
}

- (void)_updateType
{
  v3 = [(_UNMediaPlayPauseButton *)self button];
  [v3 setImage:0 forState:0];

  v4 = [(_UNMediaPlayPauseButton *)self button];
  [v4 setImage:0 forState:4];

  [(_UNMediaPlayPauseButton *)self setNeedsLayout];
}

- (void)_updateBackground
{
  int64_t v3 = [(_UNMediaPlayPauseButton *)self type];
  if (v3 == 1)
  {
    [(_UNMediaPlayPauseButton *)self _updateBackgroundForMovieStyle];
  }
  else if (!v3)
  {
    [(_UNMediaPlayPauseButton *)self _updateBackgroundForAudioStyle];
  }
}

- (void)_updateBackgroundForAudioStyle
{
  int64_t v3 = [(_UNMediaPlayPauseButton *)self backgroundCircle];

  if (v3)
  {
    v4 = [(_UNMediaPlayPauseButton *)self backgroundCircle];
    [v4 removeFromSuperview];

    [(_UNMediaPlayPauseButton *)self setBackgroundCircle:0];
  }
}

- (void)_updateBackgroundForMovieStyle
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  [(_UNMediaPlayPauseButton *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v7 = [(_UNMediaPlayPauseButton *)self backgroundCircle];

  if (!v7)
  {
    uint64_t v28 = 0;
    v29 = &v28;
    uint64_t v30 = 0x2050000000;
    double v8 = (void *)getMTMaterialViewClass_softClass;
    uint64_t v31 = getMTMaterialViewClass_softClass;
    if (!getMTMaterialViewClass_softClass)
    {
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __getMTMaterialViewClass_block_invoke;
      v27[3] = &unk_264603648;
      v27[4] = &v28;
      __getMTMaterialViewClass_block_invoke((uint64_t)v27);
      double v8 = (void *)v29[3];
    }
    id v9 = v8;
    _Block_object_dispose(&v28, 8);
    double v10 = [v9 materialViewWithRecipe:1];
    backgroundCircle = self->_backgroundCircle;
    self->_backgroundCircle = v10;

    [(_UNMediaPlayPauseButton *)self addSubview:self->_backgroundCircle];
    [(_UNMediaPlayPauseButton *)self sendSubviewToBack:self->_backgroundCircle];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v12 = [(_UNMediaPlayPauseButton *)self button];
    uint64_t v13 = [v12 requiredVisualStyleCategories];

    uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v32 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v24;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v24 != v15) {
            objc_enumerationMutation(v13);
          }
          uint64_t v17 = [*(id *)(*((void *)&v23 + 1) + 8 * v16) integerValue];
          v18 = [(_UNMediaPlayPauseButton *)self button];
          v19 = [(MTMaterialView *)self->_backgroundCircle visualStylingProviderForCategory:v17];
          [v18 setVisualStylingProvider:v19 forCategory:v17];

          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v32 count:16];
      }
      while (v14);
    }
  }
  v20 = [(_UNMediaPlayPauseButton *)self backgroundCircle];
  double v21 = fmin(v4, v6);
  objc_msgSend(v20, "setFrame:", (v4 - v21) * 0.5, (v6 - v21) * 0.5, v21, v21);

  v22 = [(_UNMediaPlayPauseButton *)self backgroundCircle];
  [v22 _setContinuousCornerRadius:v21 * 0.5];
}

- (void)_updateSize
{
  int64_t v3 = [(_UNMediaPlayPauseButton *)self type];
  if (v3 == 1)
  {
    [(_UNMediaPlayPauseButton *)self _updateSizeForMovieStyle];
  }
  else if (!v3)
  {
    [(_UNMediaPlayPauseButton *)self _updateSizeForAudioStyle];
  }
}

- (void)_updateSizeForAudioStyle
{
  id v15 = [MEMORY[0x263F1C6B0] _systemImageNamed:@"play.fill"];
  int64_t v3 = [MEMORY[0x263F1C6B0] _systemImageNamed:@"pause.fill"];
  [(_UNMediaPlayPauseButton *)self bounds];
  double v6 = fmin(v4, v5);
  double v7 = (v4 - v6) * 0.5;
  double v8 = (v5 - v6) * 0.5;
  id v9 = [(_UNMediaPlayPauseButton *)self button];
  [v9 setImage:v15 forState:0];

  double v10 = [(_UNMediaPlayPauseButton *)self button];
  [v10 setImage:v3 forState:4];

  uint64_t v11 = [(_UNMediaPlayPauseButton *)self button];
  objc_msgSend(v11, "setFrame:", v7, v8, v6, v6);

  v12 = [(_UNMediaPlayPauseButton *)self button];
  BSRectWithSize();
  objc_msgSend(v12, "setBounds:");

  uint64_t v13 = [(_UNMediaPlayPauseButton *)self button];
  objc_msgSend(v13, "setContentEdgeInsets:", *MEMORY[0x263F1D1C0], *(double *)(MEMORY[0x263F1D1C0] + 8), *(double *)(MEMORY[0x263F1D1C0] + 16), *(double *)(MEMORY[0x263F1D1C0] + 24));

  uint64_t v14 = [(_UNMediaPlayPauseButton *)self invisibleButton];
  objc_msgSend(v14, "setBounds:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
}

- (void)_updateSizeForMovieStyle
{
  int64_t v3 = [MEMORY[0x263F1C6B0] _systemImageNamed:@"play.fill"];
  [(_UNMediaPlayPauseButton *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v8 = fmin(v4, v6);
  CGAffineTransformMakeScale(&v16, 0.471428571, 0.471428571);
  double v9 = v8 * v16.c + v16.a * v8;
  double v10 = v8 * v16.d + v16.b * v8;
  uint64_t v11 = [(_UNMediaPlayPauseButton *)self button];
  [v11 setImage:v3 forState:0];

  v12 = [(_UNMediaPlayPauseButton *)self button];
  [v12 setImage:0 forState:4];

  uint64_t v13 = [(_UNMediaPlayPauseButton *)self button];
  objc_msgSend(v13, "setFrame:", (v5 - v8) * 0.5, (v7 - v8) * 0.5, v8, v8);

  uint64_t v14 = [(_UNMediaPlayPauseButton *)self button];
  objc_msgSend(v14, "setContentEdgeInsets:", (v8 - v10) * 0.5, (v8 - v9) * 0.56, (v8 - v10) * 0.5, (v8 - v9) * 0.44);

  id v15 = [(_UNMediaPlayPauseButton *)self invisibleButton];
  [(_UNMediaPlayPauseButton *)self bounds];
  objc_msgSend(v15, "setBounds:");
}

- (void)_updateStyle
{
  int64_t v3 = [(_UNMediaPlayPauseButton *)self type];
  if (v3 == 1)
  {
    [(_UNMediaPlayPauseButton *)self _updateStyleForMovieStyle];
  }
  else if (!v3)
  {
    [(_UNMediaPlayPauseButton *)self _updateStyleForAudioStyle];
  }
}

- (void)_updateStyleForAudioStyle
{
  int64_t v3 = [(_UNMediaPlayPauseButton *)self button];
  [v3 setImageViewStyle:-1 forState:0];

  double v4 = [(_UNMediaPlayPauseButton *)self button];
  [v4 setImageViewStyle:-1 forState:1];

  double v5 = [(_UNMediaPlayPauseButton *)self button];
  [v5 setImageViewStyle:-1 forState:4];

  id v7 = [(_UNMediaPlayPauseButton *)self button];
  double v6 = [(_UNMediaPlayPauseButton *)self tintColor];
  [v7 setTintColor:v6];
}

- (void)_updateStyleForMovieStyle
{
  int64_t v3 = [(_UNMediaPlayPauseButton *)self button];
  [v3 setImageViewStyle:1 forState:0];

  double v4 = [(_UNMediaPlayPauseButton *)self button];
  [v4 setImageViewStyle:0 forState:1];

  double v5 = [(_UNMediaPlayPauseButton *)self button];
  [v5 setImageViewStyle:-1 forState:4];

  id v6 = [(_UNMediaPlayPauseButton *)self button];
  [v6 setTintColor:0];
}

- (void)_updateSelected
{
  int64_t v3 = [(_UNMediaPlayPauseButton *)self type];
  if (v3 == 1)
  {
    [(_UNMediaPlayPauseButton *)self _updateSelectedForMovieStyle];
  }
  else if (!v3)
  {
    [(_UNMediaPlayPauseButton *)self _updateSelectedForAudioStyle];
  }
}

- (void)_updateSelectedForAudioStyle
{
  int64_t v3 = [(_UNMediaPlayPauseButton *)self button];
  objc_msgSend(v3, "setSelected:", -[_UNMediaPlayPauseButton isSelected](self, "isSelected"));

  id v4 = [(_UNMediaPlayPauseButton *)self invisibleButton];
  [v4 setHidden:1];
}

- (void)_updateSelectedForMovieStyle
{
  int v3 = [(_UNMediaPlayPauseButton *)self isSelected];
  id v4 = [(_UNMediaPlayPauseButton *)self button];
  double v5 = v4;
  if (v3)
  {
    [v4 setHidden:1];

    id v6 = [(_UNMediaPlayPauseButton *)self backgroundCircle];
    [v6 setHidden:1];

    id v7 = [(_UNMediaPlayPauseButton *)self invisibleButton];
    id v10 = v7;
    uint64_t v8 = 0;
  }
  else
  {
    [v4 setHidden:0];

    double v9 = [(_UNMediaPlayPauseButton *)self backgroundCircle];
    [v9 setHidden:0];

    id v7 = [(_UNMediaPlayPauseButton *)self invisibleButton];
    id v10 = v7;
    uint64_t v8 = 1;
  }
  [v7 setHidden:v8];
}

- (void)setType:(int64_t)a3
{
  if (self->_type != a3)
  {
    self->_type = a3;
    [(_UNMediaPlayPauseButton *)self _updateType];
  }
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(_UNMediaPlayPauseButton *)self isSelected] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)_UNMediaPlayPauseButton;
    [(_UNMediaPlayPauseButton *)&v5 setSelected:v3];
    [(_UNMediaPlayPauseButton *)self _updateSelected];
  }
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)_UNMediaPlayPauseButton;
  [(_UNMediaPlayPauseButton *)&v3 tintColorDidChange];
  [(_UNMediaPlayPauseButton *)self _updateStyle];
}

- (void)_buttonTouchUpInside:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (_UNMaterialButton)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
}

- (UIButton)invisibleButton
{
  return self->_invisibleButton;
}

- (void)setInvisibleButton:(id)a3
{
}

- (MTMaterialView)backgroundCircle
{
  return self->_backgroundCircle;
}

- (void)setBackgroundCircle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundCircle, 0);
  objc_storeStrong((id *)&self->_invisibleButton, 0);

  objc_storeStrong((id *)&self->_button, 0);
}

@end