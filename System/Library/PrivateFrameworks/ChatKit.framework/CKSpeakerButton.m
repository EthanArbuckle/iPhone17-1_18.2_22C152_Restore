@interface CKSpeakerButton
+ (id)speakerImageWithEnabledState:(BOOL)a3;
+ (id)speakerImageWithOrientation:(char)a3 speakerEnabled:(BOOL)a4 shouldShowText:(BOOL)a5;
- (BOOL)isSpeakerEnabled;
- (BOOL)shouldShowText;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CKSpeakerButton)initWithFrame:(CGRect)a3;
- (char)orientation;
- (void)hideSpeakerText;
- (void)setOrientation:(char)a3;
- (void)setShouldShowText:(BOOL)a3;
- (void)setSpeakerEnabled:(BOOL)a3;
- (void)touchUpInside:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateSpeakerImage;
@end

@implementation CKSpeakerButton

- (CKSpeakerButton)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CKSpeakerButton;
  v3 = -[CKSpeakerButton initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(CKSpeakerButton *)v3 addTarget:v3 action:sel_touchUpInside_ forControlEvents:64];
    v4->_speakerEnabled = 1;
    [(CKSpeakerButton *)v4 updateSpeakerImage];
  }
  return v4;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CKSpeakerButton;
  -[CKSpeakerButton sizeThatFits:](&v5, sel_sizeThatFits_, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setOrientation:(char)a3
{
  if (self->_orientation != a3)
  {
    self->_orientation = a3;
    [(CKSpeakerButton *)self updateSpeakerImage];
  }
}

- (void)setSpeakerEnabled:(BOOL)a3
{
  if (self->_speakerEnabled != a3)
  {
    self->_speakerEnabled = a3;
    [(CKSpeakerButton *)self updateSpeakerImage];
  }
}

+ (id)speakerImageWithOrientation:(char)a3 speakerEnabled:(BOOL)a4 shouldShowText:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  int v7 = a3;
  v96[1] = *MEMORY[0x1E4F143B8];
  if (speakerImageWithOrientation_speakerEnabled_shouldShowText__once != -1) {
    dispatch_once(&speakerImageWithOrientation_speakerEnabled_shouldShowText__once, &__block_literal_global_242);
  }
  v90[0] = v7;
  v90[1] = v6;
  v90[2] = v5;
  v8 = [MEMORY[0x1E4F29238] value:v90 withObjCType:"{?=cBB}"];
  v9 = [(id)speakerImageWithOrientation_speakerEnabled_shouldShowText__sSpeakerImageCache objectForKey:v8];
  if (!v9)
  {
    BOOL v88 = v6;
    uint64_t v10 = [MEMORY[0x1E4F42A98] configurationWithPointSize:4 weight:17.0];
    v11 = [MEMORY[0x1E4F42A80] systemImageNamed:@"speaker.wave.3.fill"];
    v89 = (void *)v10;
    v12 = [v11 imageWithSymbolConfiguration:v10];
    v13 = [MEMORY[0x1E4F428B8] tertiaryLabelColor];
    v14 = [v12 imageWithTintColor:v13];
    v15 = [MEMORY[0x1E4F428B8] systemGrayColor];
    v16 = [v14 imageWithTintColor:v15];

    [v16 size];
    double v18 = v17;
    double v20 = v19;
    CKPreferredContentSizeCategory();
    v21 = (NSString *)objc_claimAutoreleasedReturnValue();
    NSComparisonResult v22 = UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)speakerImageWithOrientation_speakerEnabled_shouldShowText__sContentSizeCategory_SpeakerTextWidth, v21);
    v23 = &quickSavePinImage_sBehavior;
    v24 = &quickSavePinImage_sBehavior;
    v25 = off_1E561E000;
    v26 = (uint64_t *)MEMORY[0x1E4FB06F8];
    if (v22)
    {
      v27 = CKFrameworkBundle();
      v28 = [v27 localizedStringForKey:@"AUDIO_MESSAGE_SPEAKER_ON" value:&stru_1EDE4CA38 table:@"ChatKit"];
      uint64_t v95 = *MEMORY[0x1E4FB06F8];
      uint64_t v29 = v95;
      +[CKUIBehavior sharedBehaviors];
      v30 = v86 = v16;
      v31 = [v30 transcriptBoldFont];
      v96[0] = v31;
      v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v96 forKeys:&v95 count:1];
      [v28 sizeWithAttributes:v32];
      double v34 = v33;
      double v36 = v35;

      v37 = CKFrameworkBundle();
      v38 = [v37 localizedStringForKey:@"AUDIO_MESSAGE_SPEAKER_OFF" value:&stru_1EDE4CA38 table:@"ChatKit"];
      uint64_t v93 = v29;
      v26 = (uint64_t *)MEMORY[0x1E4FB06F8];
      v39 = +[CKUIBehavior sharedBehaviors];
      v40 = [v39 transcriptBoldFont];
      v94 = v40;
      v41 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v94 forKeys:&v93 count:1];
      [v38 sizeWithAttributes:v41];
      double v43 = v42;
      double v45 = v44;

      v23 = &quickSavePinImage_sBehavior;
      v16 = v86;

      v25 = off_1E561E000;
      v24 = &quickSavePinImage_sBehavior;
      speakerImageWithOrientation_speakerEnabled_shouldShowText__sSpeakerTextMaxWidth = fmax(v34, v43);
      speakerImageWithOrientation_speakerEnabled_shouldShowText__sSpeakerTextMaxHeight = fmax(v36, v45);
      objc_storeStrong((id *)&speakerImageWithOrientation_speakerEnabled_shouldShowText__sContentSizeCategory_SpeakerTextWidth, v21);
    }
    double v46 = *((double *)v23 + 387);
    uint64_t v47 = v24[388];

    double v48 = v18 + 5.0 + v46;
    v98.width = v48;
    v98.height = v20;
    UIGraphicsBeginImageContextWithOptions(v98, 0, 0.0);
    double v49 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    if (v7)
    {
      v99.origin.x = 0.0;
      v99.origin.y = 0.0;
      v99.size.width = v18 + 5.0 + v46;
      v99.size.height = v20;
      double v50 = CGRectGetMaxX(v99) - v18;
    }
    else
    {
      double v50 = *MEMORY[0x1E4F1DAD8];
    }
    objc_msgSend(v16, "drawInRect:", v50, v49, v18, v20);
    if (v5)
    {
      double v85 = v20;
      double v87 = v18 + 5.0 + v46;
      v51 = v16;
      if (v7)
      {
        double v52 = v50 + -5.0 - v46;
      }
      else
      {
        v100.origin.x = v50;
        v100.origin.y = v49;
        v100.size.width = v18;
        v100.size.height = v20;
        double v52 = CGRectGetMaxX(v100) + 5.0;
      }
      v53 = v25;
      v54 = [(__objc2_class *)v25[134] sharedBehaviors];
      [v54 transcriptBoldTextAlignmentInsets];
      double v56 = v55;
      double v58 = v57;
      double v60 = v59;
      double v62 = v61;

      double v63 = v52 + v58;
      double v64 = v58 + v62;
      double v65 = v46 - v64;
      double v66 = v56 + v60;
      double v67 = v84 - v66;
      if (CKMainScreenScale_once_94 != -1) {
        dispatch_once(&CKMainScreenScale_once_94, &__block_literal_global_96);
      }
      double v68 = *(double *)&CKMainScreenScale_sMainScreenScale_94;
      if (*(double *)&CKMainScreenScale_sMainScreenScale_94 == 0.0) {
        double v68 = 1.0;
      }
      double v69 = 1.0 / v68 * (v49 * v68 + floor((v85 * v68 - v67 * v68) * 0.5));
      double v70 = v63 - v58;
      double v20 = v85;
      double v71 = v69 - v56;
      double v72 = v66 + v67;
      v73 = CKFrameworkBundle();
      v74 = v73;
      if (v88) {
        v75 = @"AUDIO_MESSAGE_SPEAKER_ON";
      }
      else {
        v75 = @"AUDIO_MESSAGE_SPEAKER_OFF";
      }
      v76 = [v73 localizedStringForKey:v75 value:&stru_1EDE4CA38 table:@"ChatKit"];

      uint64_t v91 = *v26;
      v77 = [(__objc2_class *)v53[134] sharedBehaviors];
      v78 = [v77 transcriptBoldFont];
      v92 = v78;
      v79 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v92 forKeys:&v91 count:1];
      objc_msgSend(v76, "drawInRect:withAttributes:", v79, v70, v71, v64 + v65, v72);

      v16 = v51;
      double v48 = v87;
    }
    if (v88)
    {
      v80 = [MEMORY[0x1E4F428B8] blackColor];
      uint64_t v81 = 2;
    }
    else
    {
      v80 = [MEMORY[0x1E4F428B8] systemGrayColor];
      uint64_t v81 = 1;
    }
    [v80 set];
    v101.origin.x = 0.0;
    v101.origin.y = 0.0;
    v101.size.width = v48;
    v101.size.height = v20;
    UIRectFillUsingBlendMode(v101, kCGBlendModeSourceIn);
    v82 = UIGraphicsGetImageFromCurrentImageContext();

    v9 = [v82 imageWithRenderingMode:v81];

    UIGraphicsEndImageContext();
    [(id)speakerImageWithOrientation_speakerEnabled_shouldShowText__sSpeakerImageCache setObject:v9 forKey:v8];
  }

  return v9;
}

void __77__CKSpeakerButton_speakerImageWithOrientation_speakerEnabled_shouldShowText___block_invoke()
{
  uint64_t v0 = CKDefaultCacheLimit();
  uint64_t v1 = CKCreateCache(v0);
  v2 = (void *)speakerImageWithOrientation_speakerEnabled_shouldShowText__sSpeakerImageCache;
  speakerImageWithOrientation_speakerEnabled_shouldShowText__sSpeakerImageCache = v1;
}

- (void)updateSpeakerImage
{
  id v4 = [MEMORY[0x1E4F427E8] plainButtonConfiguration];
  double v3 = +[CKSpeakerButton speakerImageWithEnabledState:[(CKSpeakerButton *)self isSpeakerEnabled]];
  [v4 setImage:v3];

  [(CKSpeakerButton *)self setConfiguration:v4];
}

- (void)setShouldShowText:(BOOL)a3
{
  if (self->_shouldShowText != a3)
  {
    self->_shouldShowText = 0;
    [(CKSpeakerButton *)self updateSpeakerImage];
  }
}

- (void)touchUpInside:(id)a3
{
  uint64_t v4 = [(CKSpeakerButton *)self isSpeakerEnabled] ^ 1;

  [(CKSpeakerButton *)self setSpeakerEnabled:v4];
}

- (void)hideSpeakerText
{
}

uint64_t __34__CKSpeakerButton_hideSpeakerText__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setShouldShowText:0];
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CKSpeakerButton;
  [(CKSpeakerButton *)&v4 traitCollectionDidChange:a3];
  [(CKSpeakerButton *)self updateSpeakerImage];
}

+ (id)speakerImageWithEnabledState:(BOOL)a3
{
  if (speakerImageWithEnabledState__once != -1) {
    dispatch_once(&speakerImageWithEnabledState__once, &__block_literal_global_60);
  }
  v28[0] = a3;
  objc_super v4 = [MEMORY[0x1E4F42F80] currentTraitCollection];
  v28[1] = [v4 userInterfaceStyle];

  BOOL v5 = [MEMORY[0x1E4F29238] value:v28 withObjCType:"{?=Bq}"];
  BOOL v6 = [(id)speakerImageWithEnabledState__sSpeakerImageCache objectForKey:v5];
  if (v6)
  {
    id v7 = v6;
    v8 = v7;
  }
  else
  {
    v9 = [MEMORY[0x1E4F42A98] configurationWithPointSize:4 weight:14.0];
    uint64_t v10 = [MEMORY[0x1E4F42A80] systemImageNamed:@"speaker.wave.3.fill"];
    v11 = [v10 imageWithSymbolConfiguration:v9];

    v12 = [v11 imageWithRenderingMode:1];

    if (a3) {
      [MEMORY[0x1E4F428B8] systemBlueColor];
    }
    else {
    v13 = [MEMORY[0x1E4F428B8] systemGrayColor];
    }
    v14 = [v12 imageWithTintColor:v13];

    [v14 size];
    double v17 = v15;
    double v18 = v16;
    if (v15 + 12.0 >= v16 + 12.0) {
      double v19 = v15 + 12.0;
    }
    else {
      double v19 = v16 + 12.0;
    }
    double v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42A58]), "initWithSize:", v19, v19);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __48__CKSpeakerButton_speakerImageWithEnabledState___block_invoke_2;
    v22[3] = &unk_1E5626FF0;
    double v24 = v19;
    double v25 = v19;
    double v26 = v17;
    double v27 = v18;
    id v7 = v14;
    id v23 = v7;
    v8 = [v20 imageWithActions:v22];
    [(id)speakerImageWithEnabledState__sSpeakerImageCache setObject:v8 forKey:v5];
  }

  return v8;
}

void __48__CKSpeakerButton_speakerImageWithEnabledState___block_invoke()
{
  uint64_t v0 = CKDefaultCacheLimit();
  uint64_t v1 = CKCreateCache(v0);
  v2 = (void *)speakerImageWithEnabledState__sSpeakerImageCache;
  speakerImageWithEnabledState__sSpeakerImageCache = v1;
}

void __48__CKSpeakerButton_speakerImageWithEnabledState___block_invoke_2(uint64_t a1)
{
  __asm { FMOV            V1.2D, #0.5 }
  objc_msgSend(*(id *)(a1 + 32), "drawAtPoint:", vsubq_f64(vmulq_f64(*(float64x2_t *)(a1 + 40), _Q1), vmulq_f64(*(float64x2_t *)(a1 + 56), _Q1)));
  id v10 = [MEMORY[0x1E4F427D0] bezierPath];
  [v10 setLineWidth:1.0];
  [v10 setLineJoinStyle:1];
  objc_msgSend(v10, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, *(double *)(a1 + 40) * 0.5, *(double *)(a1 + 48) * 0.5, *(double *)(a1 + 48) * 0.5 + -1.0, 0.0, 6.28318531);
  id v7 = +[CKUIBehavior sharedBehaviors];
  v8 = [v7 theme];
  v9 = [v8 quickActionButtonStrokeColor];
  [v9 setStroke];

  [v10 stroke];
}

- (char)orientation
{
  return self->_orientation;
}

- (BOOL)isSpeakerEnabled
{
  return self->_speakerEnabled;
}

- (BOOL)shouldShowText
{
  return self->_shouldShowText;
}

@end