@interface CKNavigationButtonView
- (BOOL)wantsLongPress;
- (BOOL)wantsVibrancy;
- (CKNavigationButtonView)initWithImage:(id)a3 disabledImage:(id)a4 text:(id)a5 wantsLongPress:(BOOL)a6;
- (CKNavigationButtonView)initWithImage:(id)a3 text:(id)a4 wantsLongPress:(BOOL)a5;
- (NSString)text;
- (UIButton)imageButton;
- (UIImage)defaultImage;
- (UIImage)disabledImage;
- (UIImage)image;
- (UIImageView)iconImageView;
- (UILabel)textLabel;
- (UIVisualEffect)disabledVibrancyEffect;
- (UIVisualEffect)vibrancyEffect;
- (UIVisualEffectView)vibrancyView;
- (id)_imageForCurrentState;
- (int64_t)joinButtonStyle;
- (void)_setupIconImageView;
- (void)layoutSubviews;
- (void)setDefaultImage:(id)a3;
- (void)setDisabledImage:(id)a3;
- (void)setDisabledVibrancyEffect:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setIconImageView:(id)a3;
- (void)setImage:(id)a3;
- (void)setJoinButtonStyle:(int64_t)a3;
- (void)setText:(id)a3;
- (void)setTextLabel:(id)a3;
- (void)setVibrancyEffect:(id)a3;
- (void)setVibrancyView:(id)a3;
- (void)setWantsLongPress:(BOOL)a3;
- (void)setWantsVibrancy:(BOOL)a3;
@end

@implementation CKNavigationButtonView

- (void)setDisabledImage:(id)a3
{
}

- (CKNavigationButtonView)initWithImage:(id)a3 text:(id)a4 wantsLongPress:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v37.receiver = self;
  v37.super_class = (Class)CKNavigationButtonView;
  double v10 = *MEMORY[0x1E4F1DB28];
  double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v14 = -[CKNavigationButtonView initWithFrame:](&v37, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], v11, v12, v13);
  v15 = v14;
  if (v14)
  {
    [(CKNavigationButtonView *)v14 setUserInteractionEnabled:1];
    [(CKNavigationButtonView *)v15 setClipsToBounds:0];
    [(CKNavigationButtonView *)v15 setWantsLongPress:v5];
    [(CKNavigationButtonView *)v15 setEnabled:1];
    v16 = [MEMORY[0x1E4F427D8] effectWithStyle:1100];
    v17 = [MEMORY[0x1E4F42FE8] _effectForBlurEffect:v16 vibrancyStyle:110];
    [(CKNavigationButtonView *)v15 setVibrancyEffect:v17];
    v15->_wantsVibrancy = 1;
    v18 = (void *)[objc_alloc(MEMORY[0x1E4F43028]) initWithEffect:v17];
    [v18 setUserInteractionEnabled:0];
    [(CKNavigationButtonView *)v15 setVibrancyView:v18];
    [(CKNavigationButtonView *)v15 addSubview:v18];
    if (v9)
    {
      v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42B38]), "initWithFrame:", v10, v11, v12, v13);
      [(CKNavigationButtonView *)v15 setTextLabel:v19];

      v20 = +[CKUIBehavior sharedBehaviors];
      v21 = [v20 theme];
      v22 = [v21 navBarGrayColor];
      v23 = [(CKNavigationButtonView *)v15 textLabel];
      [v23 setTextColor:v22];

      v24 = +[CKUIBehavior fontWithStyle:*MEMORY[0x1E4F43888] adjustedForMaxSizeCategory:*MEMORY[0x1E4F43798]];
      v25 = [(CKNavigationButtonView *)v15 textLabel];
      [v25 setFont:v24];

      [(CKNavigationButtonView *)v15 setText:v9];
      v26 = [(CKNavigationButtonView *)v15 textLabel];
      [v26 setText:v9];

      v27 = [(CKNavigationButtonView *)v15 textLabel];
      [v27 setTextAlignment:1];

      v28 = [v18 contentView];
      v29 = [(CKNavigationButtonView *)v15 textLabel];
      [v28 addSubview:v29];
    }
    if (v8)
    {
      v30 = (void *)MEMORY[0x1E4F42A98];
      v31 = +[CKUIBehavior sharedBehaviors];
      [v31 navbarButtonImagePointSize];
      v32 = objc_msgSend(v30, "configurationWithPointSize:");

      v33 = [v8 imageWithSymbolConfiguration:v32];
      v34 = [v33 imageWithRenderingMode:2];
      [(CKNavigationButtonView *)v15 setImage:v34];

      v35 = [(CKNavigationButtonView *)v15 image];
      [(CKNavigationButtonView *)v15 setDefaultImage:v35];

      [(CKNavigationButtonView *)v15 _setupIconImageView];
    }
  }
  return v15;
}

- (CKNavigationButtonView)initWithImage:(id)a3 disabledImage:(id)a4 text:(id)a5 wantsLongPress:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a5;
  id v11 = a3;
  double v12 = [a4 imageWithRenderingMode:2];
  disabledImage = self->_disabledImage;
  self->_disabledImage = v12;

  v14 = [(CKNavigationButtonView *)self initWithImage:v11 text:v10 wantsLongPress:v6];
  return v14;
}

- (void)_setupIconImageView
{
  v3 = [(CKNavigationButtonView *)self iconImageView];

  if (!v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F42AA0]);
    BOOL v5 = +[CKUIBehavior sharedBehaviors];
    [v5 navbarButtonImagePointSize];
    double v7 = v6;
    id v8 = +[CKUIBehavior sharedBehaviors];
    [v8 navbarButtonImagePointSize];
    id v10 = objc_msgSend(v4, "initWithFrame:", 0.0, 0.0, v7, v9);
    [(CKNavigationButtonView *)self setIconImageView:v10];

    id v11 = [(CKNavigationButtonView *)self iconImageView];
    [v11 setContentMode:1];

    double v12 = [(CKNavigationButtonView *)self iconImageView];
    double v13 = +[CKUIBehavior sharedBehaviors];
    v14 = [v13 theme];
    v15 = [v14 navBarGrayColor];
    [v12 setTintColor:v15];

    v16 = [(CKNavigationButtonView *)self vibrancyView];
    v17 = [v16 contentView];
    v18 = [(CKNavigationButtonView *)self iconImageView];
    [v17 addSubview:v18];
  }
  v19 = [(CKNavigationButtonView *)self _imageForCurrentState];
  v20 = [(CKNavigationButtonView *)self iconImageView];
  [v20 setImage:v19];

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __45__CKNavigationButtonView__setupIconImageView__block_invoke;
  v21[3] = &unk_1E5620C40;
  v21[4] = self;
  [MEMORY[0x1E4F42FF0] performWithoutAnimation:v21];
}

uint64_t __45__CKNavigationButtonView__setupIconImageView__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (id)_imageForCurrentState
{
  v3 = [(CKNavigationButtonView *)self image];
  if ([(CKNavigationButtonView *)self state] == 2)
  {
    id v4 = [(CKNavigationButtonView *)self disabledImage];

    if (v4)
    {
      uint64_t v5 = [(CKNavigationButtonView *)self disabledImage];

      v3 = (void *)v5;
    }
  }

  return v3;
}

- (void)setJoinButtonStyle:(int64_t)a3
{
  if (setJoinButtonStyle__onceToken != -1) {
    dispatch_once(&setJoinButtonStyle__onceToken, &__block_literal_global_248);
  }
  if (self->_joinButtonStyle != a3)
  {
    self->_joinButtonStyle = a3;
    uint64_t v5 = [(CKNavigationButtonView *)self iconImageView];
    [v5 removeFromSuperview];

    [(CKNavigationButtonView *)self setIconImageView:0];
    switch(self->_joinButtonStyle)
    {
      case 1:
        double v9 = +[CKUIBehavior sharedBehaviors];
        id v10 = [v9 enabledFacetimeVideoImagePill];
        id v11 = (void *)MEMORY[0x1E4F428B8];
        double v12 = @"CKSystemGreenColor";
        goto LABEL_11;
      case 2:
      case 3:
        double v6 = (void *)setJoinButtonStyle__videoImage;
        goto LABEL_8;
      case 4:
      case 5:
        double v6 = (void *)setJoinButtonStyle__audioImage;
LABEL_8:
        double v7 = (void *)MEMORY[0x1E4F428B8];
        id v8 = @"CKSystemGreenColor";
        goto LABEL_13;
      case 6:
        double v9 = +[CKUIBehavior sharedBehaviors];
        id v10 = [v9 enabledExpanseImagePill];
        id v11 = (void *)MEMORY[0x1E4F428B8];
        double v12 = @"CKSystemBlueColor";
LABEL_11:
        double v13 = [v11 ckColorNamed:v12];
        v14 = _joinPillImage(v10, v13);
        [(CKNavigationButtonView *)self setImage:v14];

        break;
      case 7:
        double v6 = (void *)setJoinButtonStyle__expanseImage;
        double v7 = (void *)MEMORY[0x1E4F428B8];
        id v8 = @"CKSystemBlueColor";
LABEL_13:
        v15 = [v7 ckColorNamed:v8];
        v16 = _circularGlyphImage(v6, v15);
        [(CKNavigationButtonView *)self setImage:v16];

        break;
      default:
        [(CKNavigationButtonView *)self setImage:self->_defaultImage];
        break;
    }
    [(CKNavigationButtonView *)self _setupIconImageView];
    [(CKNavigationButtonView *)self setNeedsLayout];
  }
}

void __45__CKNavigationButtonView_setJoinButtonStyle___block_invoke()
{
  v0 = +[CKUIBehavior sharedBehaviors];
  v1 = [v0 enabledFacetimeVideoImage];
  v2 = [MEMORY[0x1E4F428B8] ckColorNamed:@"CKSystemGreenColor"];
  uint64_t v3 = [v1 _flatImageWithColor:v2];
  id v4 = (void *)setJoinButtonStyle__videoImage;
  setJoinButtonStyle__videoImage = v3;

  uint64_t v5 = +[CKUIBehavior sharedBehaviors];
  double v6 = [v5 enabledFacetimeAudioImage];
  double v7 = [MEMORY[0x1E4F428B8] ckColorNamed:@"CKSystemGreenColor"];
  uint64_t v8 = [v6 _flatImageWithColor:v7];
  double v9 = (void *)setJoinButtonStyle__audioImage;
  setJoinButtonStyle__audioImage = v8;

  id v14 = +[CKUIBehavior sharedBehaviors];
  id v10 = [v14 enabledExpanseImage];
  id v11 = [MEMORY[0x1E4F428B8] ckColorNamed:@"CKSystemBlueColor"];
  uint64_t v12 = [v10 _flatImageWithColor:v11];
  double v13 = (void *)setJoinButtonStyle__expanseImage;
  setJoinButtonStyle__expanseImage = v12;
}

- (void)setWantsVibrancy:(BOOL)a3
{
  if (self->_wantsVibrancy != a3)
  {
    self->_wantsVibrancy = a3;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __43__CKNavigationButtonView_setWantsVibrancy___block_invoke;
    v6[3] = &unk_1E562C178;
    BOOL v7 = a3;
    v6[4] = self;
    id v4 = __43__CKNavigationButtonView_setWantsVibrancy___block_invoke((uint64_t)v6);
    uint64_t v5 = [(CKNavigationButtonView *)self vibrancyView];
    [v5 setEffect:v4];
  }
}

id __43__CKNavigationButtonView_setWantsVibrancy___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    if ([*(id *)(a1 + 32) isEnabled])
    {
      v2 = 0;
    }
    else
    {
      v2 = [*(id *)(a1 + 32) disabledVibrancyEffect];
    }
    if ([*(id *)(a1 + 32) isEnabled])
    {
      id v4 = [*(id *)(a1 + 32) vibrancyEffect];
    }
    else
    {
      id v4 = v2;
    }
    uint64_t v3 = v4;
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (void)layoutSubviews
{
  v55.receiver = self;
  v55.super_class = (Class)CKNavigationButtonView;
  [(CKNavigationButtonView *)&v55 layoutSubviews];
  [(CKNavigationButtonView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7 + 40.0;
  double v10 = v9 + -20.0;
  id v11 = [(CKNavigationButtonView *)self vibrancyView];
  objc_msgSend(v11, "setFrame:", v10, v4, v8, v6);

  uint64_t v12 = [(CKNavigationButtonView *)self vibrancyView];
  [v12 bounds];
  double v14 = v13;
  double v16 = v15;

  v17 = [(CKNavigationButtonView *)self iconImageView];

  if (v17)
  {
    v18 = [(CKNavigationButtonView *)self image];
    [v18 size];
    double v20 = v19;
    double v22 = v21;

    if (CKMainScreenScale_once_96 != -1) {
      dispatch_once(&CKMainScreenScale_once_96, &__block_literal_global_147_2);
    }
    double v23 = *(double *)&CKMainScreenScale_sMainScreenScale_96;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_96 == 0.0) {
      double v23 = 1.0;
    }
    double v24 = v20 * v23;
    double v25 = v22 * v23;
    double v26 = v14 * v23 + floor((v16 * v23 - v20 * v23) * 0.5);
    double v27 = 1.0 / v23;
    double v28 = v27 * v26;
    double v29 = v24 * v27;
    int64_t joinButtonStyle = self->_joinButtonStyle;
    double v31 = v25 * v27;
    if (joinButtonStyle == 6 || joinButtonStyle == 1) {
      double v33 = 1.5;
    }
    else {
      double v33 = 0.0;
    }
    v34 = [(CKNavigationButtonView *)self iconImageView];
    objc_msgSend(v34, "setFrame:", v28, v33, v29, v31);
  }
  v35 = [(CKNavigationButtonView *)self textLabel];

  if (v35)
  {
    v36 = +[CKUIBehavior sharedBehaviors];
    int v37 = [v36 isAccessibilityPreferredContentSizeCategory];

    v38 = [(CKNavigationButtonView *)self textLabel];
    [v38 sizeToFit];

    v39 = [(CKNavigationButtonView *)self textLabel];
    [v39 frame];
    double v41 = v40;
    double v43 = v42;

    [(CKNavigationButtonView *)self bounds];
    if (v44 < v41) {
      double v41 = v44;
    }
    if (CKMainScreenScale_once_96 != -1) {
      dispatch_once(&CKMainScreenScale_once_96, &__block_literal_global_147_2);
    }
    double v45 = *(double *)&CKMainScreenScale_sMainScreenScale_96;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_96 == 0.0) {
      double v45 = 1.0;
    }
    double v46 = v41 * v45;
    double v47 = v43 * v45;
    double v48 = v14 * v45 + floor((v16 * v45 - v41 * v45) * 0.5);
    double v49 = 1.0 / v45;
    double v50 = v49 * v48;
    double v51 = v46 * v49;
    double v52 = v47 * v49;
    if (v37) {
      double v53 = 30.0;
    }
    else {
      double v53 = 26.0;
    }
    v54 = [(CKNavigationButtonView *)self textLabel];
    objc_msgSend(v54, "setFrame:", v50, v53, v51, v52);
  }
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CKNavigationButtonView;
  -[CKNavigationButtonView setEnabled:](&v17, sel_setEnabled_);
  double v6 = [(CKNavigationButtonView *)self _imageForCurrentState];
  double v7 = [(CKNavigationButtonView *)self iconImageView];
  [v7 setImage:v6];

  if (v4)
  {
    double v8 = +[CKUIBehavior sharedBehaviors];
    double v3 = [v8 theme];
    double v9 = [v3 navBarGrayColor];
  }
  else
  {
    double v8 = [(CKNavigationButtonView *)self disabledVibrancyEffect];

    if (!v8)
    {
      double v8 = [MEMORY[0x1E4F427D8] effectWithStyle:1100];
      double v3 = [MEMORY[0x1E4F42FE8] _effectForBlurEffect:v8 vibrancyStyle:111];
      [(CKNavigationButtonView *)self setDisabledVibrancyEffect:v3];
    }
    double v9 = [MEMORY[0x1E4F428B8] systemMidGrayColor];
  }
  double v10 = [(CKNavigationButtonView *)self textLabel];
  [v10 setTextColor:v9];

  if (v4)
  {

    [(CKNavigationButtonView *)self vibrancyEffect];
  }
  else
  {
    [(CKNavigationButtonView *)self disabledVibrancyEffect];
  id v11 = };
  uint64_t v12 = [(CKNavigationButtonView *)self vibrancyView];
  [v12 setEffect:v11];

  if (v4)
  {

    if ([(CKNavigationButtonView *)self wantsVibrancy])
    {
      uint64_t v13 = [(CKNavigationButtonView *)self vibrancyEffect];
LABEL_14:
      double v14 = (void *)v13;
      int v15 = !v4;
      goto LABEL_16;
    }
  }
  else
  {

    if ([(CKNavigationButtonView *)self wantsVibrancy])
    {
      uint64_t v13 = [(CKNavigationButtonView *)self disabledVibrancyEffect];
      goto LABEL_14;
    }
  }
  BOOL v4 = 0;
  int v15 = 0;
  double v14 = 0;
LABEL_16:
  double v16 = [(CKNavigationButtonView *)self vibrancyView];
  [v16 setEffect:v14];

  if (v15) {
  if (v4)
  }
}

- (int64_t)joinButtonStyle
{
  return self->_joinButtonStyle;
}

- (BOOL)wantsVibrancy
{
  return self->_wantsVibrancy;
}

- (UIButton)imageButton
{
  return self->_imageButton;
}

- (BOOL)wantsLongPress
{
  return self->_wantsLongPress;
}

- (void)setWantsLongPress:(BOOL)a3
{
  self->_wantsLongPress = a3;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (UIImage)defaultImage
{
  return self->_defaultImage;
}

- (void)setDefaultImage:(id)a3
{
}

- (UIImage)disabledImage
{
  return self->_disabledImage;
}

- (UIImageView)iconImageView
{
  return self->_iconImageView;
}

- (void)setIconImageView:(id)a3
{
}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (void)setTextLabel:(id)a3
{
}

- (UIVisualEffectView)vibrancyView
{
  return self->_vibrancyView;
}

- (void)setVibrancyView:(id)a3
{
}

- (UIVisualEffect)vibrancyEffect
{
  return self->_vibrancyEffect;
}

- (void)setVibrancyEffect:(id)a3
{
}

- (UIVisualEffect)disabledVibrancyEffect
{
  return self->_disabledVibrancyEffect;
}

- (void)setDisabledVibrancyEffect:(id)a3
{
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_disabledVibrancyEffect, 0);
  objc_storeStrong((id *)&self->_vibrancyEffect, 0);
  objc_storeStrong((id *)&self->_vibrancyView, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_disabledImage, 0);
  objc_storeStrong((id *)&self->_defaultImage, 0);
  objc_storeStrong((id *)&self->_image, 0);

  objc_storeStrong((id *)&self->_imageButton, 0);
}

@end