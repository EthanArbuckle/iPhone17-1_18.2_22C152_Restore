@interface CAMSemanticStyleControl
- ($F24F406B2B787EFB06265DBA3D28CBD5)gradientInsets;
- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)canBecomeFirstResponder;
- (CAMSemanticStyle)semanticStyle;
- (CAMSemanticStyleControl)initWithFrame:(CGRect)a3;
- (CEKEdgeGradientView)_edgeGradients;
- (NSArray)_allSliders;
- (UIButton)_resetButton;
- (UILabel)_descriptionLabel;
- (UIView)_gradientContainer;
- (id)_createSliderForIndex:(unint64_t)a3;
- (void)_handleResetButtonReleased:(id)a3;
- (void)_handleResetMenuItem:(id)a3;
- (void)_handleSliderDidChangeValue:(id)a3;
- (void)_updateSlidersAnimated:(BOOL)a3;
- (void)_updateSubviewsVisibilityWithDuration:(double)a3 delay:(double)a4;
- (void)layoutSubviews;
- (void)setGradientInsets:(id)a3;
- (void)setSemanticStyle:(id)a3;
- (void)setSemanticStyle:(id)a3 animated:(BOOL)a4;
- (void)sliderWillCollapse:(id)a3;
- (void)sliderWillExpand:(id)a3;
@end

@implementation CAMSemanticStyleControl

- (CAMSemanticStyleControl)initWithFrame:(CGRect)a3
{
  v29.receiver = self;
  v29.super_class = (Class)CAMSemanticStyleControl;
  v3 = -[CAMSemanticStyleControl initWithFrame:](&v29, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  if (v3)
  {
    v4 = [[CAMSemanticStyle alloc] initWithPresetType:0];
    semanticStyle = v3->_semanticStyle;
    v3->_semanticStyle = v4;

    v6 = (NSArray *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:3];
    uint64_t v7 = [(CAMSemanticStyleControl *)v3 _createSliderForIndex:[(NSArray *)v6 count]];
    if (v7)
    {
      v8 = (void *)v7;
      do
      {
        [(CAMSemanticStyleControl *)v3 addSubview:v8];
        [(NSArray *)v6 addObject:v8];

        v8 = [(CAMSemanticStyleControl *)v3 _createSliderForIndex:[(NSArray *)v6 count]];
      }
      while (v8);
    }
    allSliders = v3->__allSliders;
    v3->__allSliders = v6;
    v10 = v6;

    v11 = (UIButton *)objc_alloc_init(MEMORY[0x263F824E8]);
    resetButton = v3->__resetButton;
    v3->__resetButton = v11;

    [(UIButton *)v3->__resetButton addTarget:v3 action:sel__handleResetButtonReleased_ forControlEvents:64];
    v13 = v3->__resetButton;
    v14 = (void *)MEMORY[0x263F827E8];
    v15 = [MEMORY[0x263F82818] configurationWithScale:3];
    v16 = [v14 systemImageNamed:@"arrow.trianglehead.counterclockwise" withConfiguration:v15];
    [(UIButton *)v13 setImage:v16 forState:0];

    v17 = [MEMORY[0x263F825C8] whiteColor];
    [(UIButton *)v3->__resetButton setTintColor:v17];

    [(CAMSemanticStyleControl *)v3 addSubview:v3->__resetButton];
    v18 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    descriptionLabel = v3->__descriptionLabel;
    v3->__descriptionLabel = v18;

    v20 = CAMLocalizedFrameworkString(@"SEMANTIC_STYLES_CONTROL_DESCRIPTION", 0);
    [(UILabel *)v3->__descriptionLabel setText:v20];

    [(UILabel *)v3->__descriptionLabel setTextAlignment:1];
    [(UILabel *)v3->__descriptionLabel setAdjustsFontSizeToFitWidth:1];
    [(UILabel *)v3->__descriptionLabel setNumberOfLines:1];
    v21 = CEKFontOfSizeAndStyle();
    [(UILabel *)v3->__descriptionLabel setFont:v21];

    v22 = [MEMORY[0x263F825C8] whiteColor];
    [(UILabel *)v3->__descriptionLabel setTextColor:v22];

    [(CAMSemanticStyleControl *)v3 addSubview:v3->__descriptionLabel];
    v23 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    gradientContainer = v3->__gradientContainer;
    v3->__gradientContainer = v23;

    v25 = [MEMORY[0x263F825C8] blackColor];
    [(UIView *)v3->__gradientContainer setBackgroundColor:v25];

    [(UIView *)v3->__gradientContainer setUserInteractionEnabled:0];
    v26 = (CEKEdgeGradientView *)objc_alloc_init(MEMORY[0x263F306B0]);
    edgeGradients = v3->__edgeGradients;
    v3->__edgeGradients = v26;

    [(CEKEdgeGradientView *)v3->__edgeGradients setUserInteractionEnabled:0];
    [(CEKEdgeGradientView *)v3->__edgeGradients setEdgeGradientStyleMask];
    [(UIView *)v3->__gradientContainer addSubview:v3->__edgeGradients];
    [(CAMSemanticStyleControl *)v3 setMaskView:v3->__gradientContainer];

    [(CAMSemanticStyleControl *)v3 _updateSubviewsVisibilityWithDuration:0.0 delay:0.0];
  }
  return v3;
}

- (id)_createSliderForIndex:(unint64_t)a3
{
  if (a3)
  {
    if (a3 != 1)
    {
      uint64_t v7 = 0;
      v6 = 0;
      goto LABEL_9;
    }
    v4 = @"SEMANTIC_STYLES_CONTROL_WARMTH";
  }
  else
  {
    v4 = @"SEMANTIC_STYLES_CONTROL_TONE";
  }
  v5 = CAMLocalizedFrameworkString(v4, 0);
  v6 = v5;
  if (v5)
  {
    uint64_t v7 = objc_msgSend(v5, "cam_uppercaseStringWithPreferredLocale");

    v6 = (void *)[objc_alloc(MEMORY[0x263F306B8]) initWithTitle:v7];
    [v6 setDelegate:self];
    [v6 addTarget:self action:sel__handleSliderDidChangeValue_ forControlEvents:4096];
  }
  else
  {
    uint64_t v7 = 0;
  }
LABEL_9:

  return v6;
}

- (void)layoutSubviews
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  v50.receiver = self;
  v50.super_class = (Class)CAMSemanticStyleControl;
  [(CAMSemanticStyleControl *)&v50 layoutSubviews];
  [(CAMSemanticStyleControl *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  +[CAMControlDrawerButton buttonSize];
  double v12 = v11;
  double v45 = v13;
  v14 = [(CAMSemanticStyleControl *)self _allSliders];
  v15 = [v14 firstObject];
  [v15 intrinsicContentSize];
  double v17 = v16;

  double v44 = v12;
  double v18 = v12 + 20.0;
  v19 = [(CAMSemanticStyleControl *)self _allSliders];
  unint64_t v20 = [v19 count];
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v21 = v19;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v46 objects:v51 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    double v24 = (v8 + (v12 + 20.0) * -2.0 - v17 * (double)v20) / (double)(v20 + 1);
    double v25 = v17 * 0.5 + v18 + v24;
    uint64_t v26 = *(void *)v47;
    double v27 = v17 + v24;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v47 != v26) {
          objc_enumerationMutation(v21);
        }
        objc_super v29 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        objc_msgSend(v29, "setFrame:", v4, v6, v8, v10);
        UIRoundToViewScale();
        objc_msgSend(v29, "setCollapsedCenterX:");
        double v25 = v27 + v25;
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v46 objects:v51 count:16];
    }
    while (v23);
  }

  v53.origin.x = v4;
  v53.origin.y = v6;
  v53.size.width = v8;
  v53.size.height = v10;
  CGRectGetMidY(v53);
  UIRoundToViewScale();
  double v31 = v30;
  v32 = [(CAMSemanticStyleControl *)self _descriptionLabel];
  objc_msgSend(v32, "setFrame:", v18, v31, v8 + v18 * -2.0, 17.0);

  v54.origin.x = v4;
  v54.origin.y = v6;
  v54.size.width = v8;
  v54.size.height = v10;
  CGRectGetMidY(v54);
  UIRoundToViewScale();
  double v34 = v33;
  v35 = [(CAMSemanticStyleControl *)self _resetButton];
  objc_msgSend(v35, "setFrame:", v8 - v18, v34, v44, v45);

  v36 = [(CAMSemanticStyleControl *)self _gradientContainer];
  objc_msgSend(v36, "setFrame:", v4, v6, v8, v10);

  v37 = [(CAMSemanticStyleControl *)self _edgeGradients];
  objc_msgSend(v37, "setFrame:", v4, v6, v8, v10);

  v38 = [(CAMSemanticStyleControl *)self _edgeGradients];
  objc_msgSend(v38, "setContentInsets:", 28.0, 0.0, 5.0, 0.0);

  [(CAMSemanticStyleControl *)self gradientInsets];
  double v40 = v39;
  [(CAMSemanticStyleControl *)self gradientInsets];
  double v42 = v41;
  v43 = [(CAMSemanticStyleControl *)self _edgeGradients];
  objc_msgSend(v43, "setGradientDimensions:", v40, v8 * 0.1, v8 * 0.1, v42);
}

- (void)setSemanticStyle:(id)a3
{
}

- (void)setSemanticStyle:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  if (!-[CAMSemanticStyle isEqualToSemanticStyle:](self->_semanticStyle, "isEqualToSemanticStyle:"))
  {
    objc_storeStrong((id *)&self->_semanticStyle, a3);
    [(CAMSemanticStyleControl *)self _updateSlidersAnimated:v4];
    double v7 = 0.3;
    if (!v4) {
      double v7 = 0.0;
    }
    -[CAMSemanticStyleControl _updateSubviewsVisibilityWithDuration:delay:](self, "_updateSubviewsVisibilityWithDuration:delay:", v7);
  }
}

- (void)_updateSlidersAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v28 = *MEMORY[0x263EF8340];
  double v5 = [(CAMSemanticStyleControl *)self semanticStyle];
  double v6 = [(CAMSemanticStyleControl *)self _allSliders];
  uint64_t v7 = [v5 isCustomizable];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v24;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * v12++), "setUserInteractionEnabled:", v7, (void)v23);
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v10);
  }

  double v13 = [(CAMSemanticStyleControl *)self _resetButton];
  [v13 setUserInteractionEnabled:v7];

  if (v7)
  {
    v14 = -[CAMSemanticStyle initWithPresetType:]([CAMSemanticStyle alloc], "initWithPresetType:", [v5 presetType]);
    v15 = [v8 objectAtIndexedSubscript:0];
    [v5 sceneBias];
    objc_msgSend(v15, "setValue:animated:", v3);

    double v16 = [v8 objectAtIndexedSubscript:1];
    [v5 warmthBias];
    objc_msgSend(v16, "setValue:animated:", v3);

    [(CAMSemanticStyle *)v14 sceneBias];
    double v18 = v17;
    v19 = [v8 objectAtIndexedSubscript:0];
    [v19 setMarkedValue:v18];

    [(CAMSemanticStyle *)v14 warmthBias];
    double v21 = v20;
    uint64_t v22 = [v8 objectAtIndexedSubscript:1];
    [v22 setMarkedValue:v21];
  }
}

- (void)setGradientInsets:(id)a3
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  p_gradientInsets = &self->_gradientInsets;
  if ((CEKEdgeInsetsEqualToInsets() & 1) == 0)
  {
    p_gradientInsets->startInset = var0;
    p_gradientInsets->endInset = var1;
    [(CAMSemanticStyleControl *)self setNeedsLayout];
  }
}

- (void)_updateSubviewsVisibilityWithDuration:(double)a3 delay:(double)a4
{
  uint64_t v7 = [(CAMSemanticStyleControl *)self semanticStyle];
  char v8 = [v7 isCustomizable];

  uint64_t v9 = [(CAMSemanticStyleControl *)self _allSliders];
  uint64_t v23 = 0;
  long long v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __71__CAMSemanticStyleControl__updateSubviewsVisibilityWithDuration_delay___block_invoke;
  v22[3] = &unk_263FA10B0;
  v22[4] = &v23;
  [v9 enumerateObjectsUsingBlock:v22];
  uint64_t v10 = [(CAMSemanticStyleControl *)self semanticStyle];
  char v11 = v8 ^ 1;
  if ([v10 isCustomized]) {
    BOOL v12 = *((unsigned char *)v24 + 24) == 0;
  }
  else {
    BOOL v12 = 0;
  }

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__CAMSemanticStyleControl__updateSubviewsVisibilityWithDuration_delay___block_invoke_2;
  aBlock[3] = &unk_263FA10D8;
  id v13 = v9;
  double v18 = self;
  v19 = &v23;
  char v20 = v11;
  id v17 = v13;
  BOOL v21 = v12;
  v14 = _Block_copy(aBlock);
  v15 = v14;
  if (a3 == 0.0 && a4 == 0.0) {
    (*((void (**)(void *))v14 + 2))(v14);
  }
  else {
    [MEMORY[0x263F82E00] animateWithDuration:0 delay:v14 options:0 animations:a3 completion:a4];
  }

  _Block_object_dispose(&v23, 8);
}

uint64_t __71__CAMSemanticStyleControl__updateSubviewsVisibilityWithDuration_delay___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 expanded];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void __71__CAMSemanticStyleControl__updateSubviewsVisibilityWithDuration_delay___block_invoke_2(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)
          && !objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "expanded", (void)v15)
          || *(unsigned char *)(a1 + 56))
        {
          double v8 = 0.0;
        }
        else
        {
          double v8 = 1.0;
        }
        objc_msgSend(v7, "setAlpha:", v8, (void)v15);
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v4);
  }

  if (*(unsigned char *)(a1 + 57)) {
    double v9 = 1.0;
  }
  else {
    double v9 = 0.0;
  }
  uint64_t v10 = objc_msgSend(*(id *)(a1 + 40), "_resetButton", (void)v15);
  [v10 setAlpha:v9];

  if (*(unsigned char *)(a1 + 56)) {
    double v11 = 1.0;
  }
  else {
    double v11 = 0.0;
  }
  BOOL v12 = [*(id *)(a1 + 40) _descriptionLabel];
  [v12 setAlpha:v11];

  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.0];
  }
  else {
  id v13 = [MEMORY[0x263F825C8] blackColor];
  }
  v14 = [*(id *)(a1 + 40) _gradientContainer];
  [v14 setBackgroundColor:v13];
}

- (void)_handleSliderDidChangeValue:(id)a3
{
  id v13 = [(CAMSemanticStyleControl *)self _allSliders];
  uint64_t v4 = [CAMSemanticStyle alloc];
  uint64_t v5 = [(CAMSemanticStyleControl *)self semanticStyle];
  uint64_t v6 = [v5 presetType];
  uint64_t v7 = [v13 objectAtIndexedSubscript:0];
  [v7 value];
  double v9 = v8;
  uint64_t v10 = [v13 objectAtIndexedSubscript:1];
  [v10 value];
  BOOL v12 = [(CAMSemanticStyle *)v4 initWithPresetType:v6 sceneBias:v9 warmthBias:v11];
  [(CAMSemanticStyleControl *)self setSemanticStyle:v12];

  [(CAMSemanticStyleControl *)self sendActionsForControlEvents:4096];
}

- (void)_handleResetButtonReleased:(id)a3
{
  v14[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = CAMLocalizedFrameworkString(@"SEMANTIC_STYLES_CONTROL_RESET_CONFIRM_FORMAT", 0);
  uint64_t v6 = NSString;
  uint64_t v7 = [(CAMSemanticStyleControl *)self semanticStyle];
  double v8 = [v7 presetDisplayName];
  double v9 = [v6 stringWithValidatedFormat:v5, @"%@", 0, v8 validFormatSpecifiers error];

  [(CAMSemanticStyleControl *)self becomeFirstResponder];
  uint64_t v10 = [MEMORY[0x263F82950] sharedMenuController];
  double v11 = (void *)[objc_alloc(MEMORY[0x263F82968]) initWithTitle:v9 action:sel__handleResetMenuItem_];
  v14[0] = v11;
  BOOL v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:1];
  [v10 setMenuItems:v12];

  id v13 = [v4 imageView];
  [v13 frame];
  objc_msgSend(v10, "showMenuFromView:rect:", v4);
}

- (void)_handleResetMenuItem:(id)a3
{
  id v4 = [CAMSemanticStyle alloc];
  uint64_t v5 = [(CAMSemanticStyleControl *)self semanticStyle];
  uint64_t v6 = -[CAMSemanticStyle initWithPresetType:](v4, "initWithPresetType:", [v5 presetType]);

  [(CAMSemanticStyleControl *)self setSemanticStyle:v6 animated:1];
  [(CAMSemanticStyleControl *)self sendActionsForControlEvents:4096];
}

- (BOOL)canBecomeFirstResponder
{
  id v2 = [(CAMSemanticStyleControl *)self semanticStyle];
  char v3 = [v2 isCustomized];

  return v3;
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  uint64_t v6 = (void *)MEMORY[0x263F82950];
  id v7 = a4;
  id v8 = a3;
  double v9 = [v6 sharedMenuController];
  [v9 hideMenu];

  v11.receiver = self;
  v11.super_class = (Class)CAMSemanticStyleControl;
  LOBYTE(self) = [(CAMSemanticStyleControl *)&v11 beginTrackingWithTouch:v8 withEvent:v7];

  return (char)self;
}

- (void)sliderWillExpand:(id)a3
{
  -[CAMSemanticStyleControl _updateSubviewsVisibilityWithDuration:delay:](self, "_updateSubviewsVisibilityWithDuration:delay:", a3, 0.2, 0.0);
  id v3 = [MEMORY[0x263F82950] sharedMenuController];
  [v3 hideMenu];
}

- (void)sliderWillCollapse:(id)a3
{
}

- (CAMSemanticStyle)semanticStyle
{
  return self->_semanticStyle;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)gradientInsets
{
  double startInset = self->_gradientInsets.startInset;
  double endInset = self->_gradientInsets.endInset;
  result.double var1 = endInset;
  result.double var0 = startInset;
  return result;
}

- (NSArray)_allSliders
{
  return self->__allSliders;
}

- (UILabel)_descriptionLabel
{
  return self->__descriptionLabel;
}

- (UIButton)_resetButton
{
  return self->__resetButton;
}

- (UIView)_gradientContainer
{
  return self->__gradientContainer;
}

- (CEKEdgeGradientView)_edgeGradients
{
  return self->__edgeGradients;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__edgeGradients, 0);
  objc_storeStrong((id *)&self->__gradientContainer, 0);
  objc_storeStrong((id *)&self->__resetButton, 0);
  objc_storeStrong((id *)&self->__descriptionLabel, 0);
  objc_storeStrong((id *)&self->__allSliders, 0);
  objc_storeStrong((id *)&self->_semanticStyle, 0);
}

@end