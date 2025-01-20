@interface CKEntryViewButton
+ (id)entryViewButtonImageForType:(int64_t)a3;
+ (id)entryViewButtonImageForType:(int64_t)a3 color:(char)a4;
+ (id)entryViewButtonImageWithName:(id)a3 tintColor:(char)a4 shouldSuppressHairline:(BOOL)a5;
+ (id)entryViewButtonOfType:(int64_t)a3;
+ (id)entryViewButtonOfType:(int64_t)a3 wantsVibrancy:(BOOL)a4;
+ (id)imageNameForEntryViewButtonType:(int64_t)a3;
+ (id)overlayImageForImageNamed:(id)a3 tintColor:(char)a4;
+ (void)prewarmEntryViewButtons;
- (BOOL)isEnabled;
- (BOOL)needsOversizedBlurContainer;
- (BOOL)wantsVibrancy;
- (CGSize)intrinsicContentSize;
- (CKEntryViewBlurrableButtonContainer)blurrableButtonContainer;
- (CKEntryViewButton)initWithFrame:(CGRect)a3 wantsVibrancy:(BOOL)a4;
- (UIButton)button;
- (UIVisualEffectView)vibrancyView;
- (char)ckTintColor;
- (double)blurRadius;
- (id)pointerInteraction:(id)a3 regionForLocation:(CGPoint)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4 modifiers:(int64_t)a5;
- (int64_t)_preferredEntryViewButtonType;
- (int64_t)entryViewButtonType;
- (void)configureForAnimatableBlur;
- (void)layoutSubviews;
- (void)setBlurRadius:(double)a3;
- (void)setBlurrableButtonContainer:(id)a3;
- (void)setButton:(id)a3;
- (void)setCkTintColor:(char)a3;
- (void)setDefaultImage;
- (void)setEnabled:(BOOL)a3;
- (void)setEntryViewButtonType:(int64_t)a3;
- (void)setNeedsOversizedBlurContainer:(BOOL)a3;
- (void)setTintedImageForButtonType:(int64_t)a3 tintColor:(char)a4;
- (void)setVibrancyView:(id)a3;
- (void)setWantsVibrancy:(BOOL)a3;
- (void)setupCompositeFilterForButton;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CKEntryViewButton

+ (id)entryViewButtonOfType:(int64_t)a3 wantsVibrancy:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = [CKEntryViewButton alloc];
  v7 = -[CKEntryViewButton initWithFrame:wantsVibrancy:](v6, "initWithFrame:wantsVibrancy:", v4, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(CKEntryViewButton *)v7 setEntryViewButtonType:a3];
  if (a3 == 5) {
    [(CKEntryViewButton *)v7 setCkTintColor:3];
  }

  return v7;
}

+ (id)entryViewButtonOfType:(int64_t)a3
{
  BOOL v4 = [CKEntryViewButton alloc];
  v5 = +[CKUIBehavior sharedBehaviors];
  uint64_t v6 = [v5 entryViewButtonWantsVibrancy];
  v7 = -[CKEntryViewButton initWithFrame:wantsVibrancy:](v4, "initWithFrame:wantsVibrancy:", v6, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));

  [(CKEntryViewButton *)v7 setEntryViewButtonType:a3];

  return v7;
}

+ (id)imageNameForEntryViewButtonType:(int64_t)a3
{
  v3 = 0;
  switch(a3)
  {
    case 0:
      BOOL v4 = +[CKUIBehavior sharedBehaviors];
      uint64_t v5 = [v4 entryViewPhotoButtonName];
      goto LABEL_10;
    case 1:
      BOOL v4 = +[CKUIBehavior sharedBehaviors];
      uint64_t v5 = [v4 entryViewArrowButtonName];
      goto LABEL_10;
    case 2:
      BOOL v4 = +[CKUIBehavior sharedBehaviors];
      uint64_t v5 = [v4 entryViewAppButtonName];
      goto LABEL_10;
    case 3:
      BOOL v4 = +[CKUIBehavior sharedBehaviors];
      uint64_t v5 = [v4 entryViewPlusButtonName];
      goto LABEL_10;
    case 4:
      BOOL v4 = +[CKUIBehavior sharedBehaviors];
      uint64_t v5 = [v4 entryViewSendButtonName];
      goto LABEL_10;
    case 5:
      BOOL v4 = +[CKUIBehavior sharedBehaviors];
      uint64_t v5 = [v4 entryViewAudioButtonName];
      goto LABEL_10;
    case 8:
      BOOL v4 = +[CKUIBehavior sharedBehaviors];
      uint64_t v5 = [v4 entryViewDictationButtonName];
      goto LABEL_10;
    case 9:
      BOOL v4 = +[CKUIBehavior sharedBehaviors];
      uint64_t v5 = [v4 entryViewKeyboardButtonName];
LABEL_10:
      v3 = (void *)v5;

      break;
    default:
      break;
  }

  return v3;
}

+ (void)prewarmEntryViewButtons
{
  v3 = [(id)objc_opt_class() imageNameForEntryViewButtonType:5];
  BOOL v4 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v5 = [v4 isAudioMessagesEntryViewRecordingEnabled];

  if (v5) {
    uint64_t v6 = 3;
  }
  else {
    uint64_t v6 = 0xFFFFFFFFLL;
  }
  id v7 = (id)[a1 entryViewButtonImageWithName:v3 tintColor:v6 shouldSuppressHairline:1];
  v8 = [(id)objc_opt_class() imageNameForEntryViewButtonType:0];

  id v9 = (id)[a1 entryViewButtonImageWithName:v8 tintColor:0xFFFFFFFFLL shouldSuppressHairline:1];
  v10 = [(id)objc_opt_class() imageNameForEntryViewButtonType:3];

  id v11 = (id)[a1 entryViewButtonImageWithName:v10 tintColor:0xFFFFFFFFLL shouldSuppressHairline:1];
  v12 = [(id)objc_opt_class() imageNameForEntryViewButtonType:2];

  id v13 = (id)[a1 entryViewButtonImageWithName:v12 tintColor:0xFFFFFFFFLL shouldSuppressHairline:1];
  v14 = [(id)objc_opt_class() imageNameForEntryViewButtonType:4];

  id v15 = (id)[a1 entryViewButtonImageWithName:v14 tintColor:1 shouldSuppressHairline:1];
  v16 = [(id)objc_opt_class() imageNameForEntryViewButtonType:4];

  id v17 = (id)[a1 entryViewButtonImageWithName:v16 tintColor:0 shouldSuppressHairline:1];
  if (CKIsRunningInMacCatalyst())
  {
    v18 = [(id)objc_opt_class() imageNameForEntryViewButtonType:6];

    id v19 = (id)[a1 entryViewButtonImageWithName:v18 tintColor:0xFFFFFFFFLL shouldSuppressHairline:0];
    v16 = [(id)objc_opt_class() imageNameForEntryViewButtonType:7];

    id v20 = (id)[a1 entryViewButtonImageWithName:v16 tintColor:3 shouldSuppressHairline:0];
  }
  v21 = +[CKUIBehavior sharedBehaviors];
  id v23 = [v21 entryViewDictationButtonName];

  id v22 = (id)[a1 entryViewButtonImageWithName:v23 tintColor:0xFFFFFFFFLL shouldSuppressHairline:0];
}

+ (id)entryViewButtonImageForType:(int64_t)a3
{
  BOOL v4 = [(id)objc_opt_class() imageNameForEntryViewButtonType:a3];
  int v5 = [a1 entryViewButtonImageWithName:v4 tintColor:0xFFFFFFFFLL shouldSuppressHairline:1];

  return v5;
}

+ (id)entryViewButtonImageForType:(int64_t)a3 color:(char)a4
{
  uint64_t v4 = a4;
  uint64_t v6 = [(id)objc_opt_class() imageNameForEntryViewButtonType:a3];
  id v7 = [a1 entryViewButtonImageWithName:v6 tintColor:v4 shouldSuppressHairline:1];

  return v7;
}

- (CKEntryViewButton)initWithFrame:(CGRect)a3 wantsVibrancy:(BOOL)a4
{
  BOOL v4 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CKEntryViewButton;
  int v5 = -[CKEntryViewButton initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v5)
  {
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F43028]) initWithEffect:0];
    [(CKEntryViewButton *)v5 addSubview:v6];
    [(CKEntryViewButton *)v5 setVibrancyView:v6];
    [(CKEntryViewButton *)v5 setWantsVibrancy:v4];
    uint64_t v7 = [(CKEntryViewButton *)v5 _preferredEntryViewButtonType];
    v8 = [MEMORY[0x1E4F427E0] buttonWithType:v7];
    id v9 = v8;
    if (!v7) {
      [v8 setAdjustsImageWhenDisabled:0];
    }
    v10 = [v9 imageView];
    [v10 setContentMode:1];

    id v11 = objc_alloc_init(CKEntryViewBlurrableButtonContainer);
    [(CKEntryViewBlurrableButtonContainer *)v11 addSubview:v9];
    v12 = [v6 contentView];
    [v12 addSubview:v11];

    [(CKEntryViewButton *)v5 setButton:v9];
    [(CKEntryViewButton *)v5 setBlurrableButtonContainer:v11];
    id v13 = (void *)[objc_alloc(MEMORY[0x1E4F42CA0]) initWithDelegate:v5];
    [(CKEntryViewButton *)v5 addInteraction:v13];
  }
  return v5;
}

- (int64_t)_preferredEntryViewButtonType
{
  return CKIsRunningInMacCatalyst() == 0;
}

- (void)layoutSubviews
{
  v28.receiver = self;
  v28.super_class = (Class)CKEntryViewButton;
  [(CKEntryViewButton *)&v28 layoutSubviews];
  [(CKEntryViewButton *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v11 = [(CKEntryViewButton *)self vibrancyView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  if (self->_needsOversizedBlurContainer)
  {
    v12 = [(CKEntryViewButton *)self blurrableButtonContainer];
    id v13 = v12;
    double v14 = v4 + -30.0;
    double v15 = v6 + -30.0;
    double v16 = v8 + 60.0;
    double v17 = v10 + 60.0;
  }
  else
  {
    v12 = [(CKEntryViewButton *)self blurrableButtonContainer];
    id v13 = v12;
    double v14 = v4;
    double v15 = v6;
    double v16 = v8;
    double v17 = v10;
  }
  objc_msgSend(v12, "setFrame:", v14, v15, v16, v17);

  v18 = [(CKEntryViewButton *)self blurrableButtonContainer];
  -[CKEntryViewButton convertRect:toView:](self, "convertRect:toView:", v18, v4, v6, v8, v10);
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;

  v27 = [(CKEntryViewButton *)self button];
  objc_msgSend(v27, "setFrame:", v20, v22, v24, v26);
}

+ (id)entryViewButtonImageWithName:(id)a3 tintColor:(char)a4 shouldSuppressHairline:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = a4;
  id v8 = a3;
  if (entryViewButtonImageWithName_tintColor_shouldSuppressHairline__onceToken != -1) {
    dispatch_once(&entryViewButtonImageWithName_tintColor_shouldSuppressHairline__onceToken, &__block_literal_global_126);
  }
  double v9 = +[CKUIBehavior sharedBehaviors];
  double v10 = [v9 theme];
  id v11 = v10;
  if (v6 == -1) {
    [v10 entryFieldButtonColor];
  }
  else {
  id v12 = [v10 sendButtonColorForColorType:v6];
  }

  id v13 = NSString;
  double v14 = [v12 description];
  double v15 = [v13 stringWithFormat:@"%@-%@", v8, v14];

  double v16 = [(id)entryViewButtonImageWithName_tintColor_shouldSuppressHairline__sDictionary objectForKey:v15];
  if (v16) {
    goto LABEL_91;
  }
  id v102 = a1;
  unsigned int v105 = v6;
  double v17 = +[CKEntryViewButton imageNameForEntryViewButtonType:7];
  v112 = +[CKEntryViewButton imageNameForEntryViewButtonType:6];
  v18 = +[CKEntryViewButton imageNameForEntryViewButtonType:2];
  uint64_t v19 = +[CKEntryViewButton imageNameForEntryViewButtonType:5];
  double v20 = +[CKEntryViewButton imageNameForEntryViewButtonType:4];
  v111 = +[CKEntryViewButton imageNameForEntryViewButtonType:8];
  v107 = +[CKEntryViewButton imageNameForEntryViewButtonType:9];
  v113 = (void *)v19;
  BOOL v104 = v5;
  if ([v8 isEqualToString:v19]
    || [v8 isEqualToString:v20])
  {
    uint64_t v21 = [MEMORY[0x1E4F42A80] ckImageNamed:v8];
  }
  else if (([v8 isEqualToString:v111] & 1) != 0 {
         || [v8 isEqualToString:v107])
  }
  {
    uint64_t v21 = [MEMORY[0x1E4F42A80] systemImageNamed:v8];
  }
  else
  {
    uint64_t v21 = [MEMORY[0x1E4F42A80] _systemImageNamed:v8];
  }
  double v22 = (void *)v21;
  v109 = +[CKEntryViewButton imageNameForEntryViewButtonType:1];
  uint64_t v23 = +[CKEntryViewButton imageNameForEntryViewButtonType:0];
  v110 = +[CKEntryViewButton imageNameForEntryViewButtonType:3];
  v106 = (void *)v23;
  if ([v8 isEqualToString:v23])
  {
    double v24 = [MEMORY[0x1E4F42A98] configurationWithPointSize:6 weight:3 scale:32.0];
    uint64_t v25 = [v22 imageWithSymbolConfiguration:v24];

    double v22 = (void *)v25;
  }
  v108 = v20;
  if ([v8 isEqualToString:v110])
  {
    double v26 = [MEMORY[0x1E4F42A98] configurationWithPointSize:3 weight:3 scale:32.0];
    v27 = [MEMORY[0x1E4F42A98] configurationWithHierarchicalColor:v12];
    [v26 configurationByApplyingConfiguration:v27];
    v29 = objc_super v28 = v17;
    uint64_t v30 = [v22 imageWithSymbolConfiguration:v29];

    double v17 = v28;
    double v20 = v108;

    double v22 = (void *)v30;
  }
  if ([v8 isEqualToString:v109])
  {
    v31 = [MEMORY[0x1E4F42A98] configurationWithPointSize:6 weight:3 scale:20.0];
    uint64_t v32 = [v22 imageWithSymbolConfiguration:v31];

    double v22 = (void *)v32;
  }
  if ([v8 isEqualToString:v17])
  {
    uint64_t v33 = [MEMORY[0x1E4F42A80] systemImageNamed:@"stop.circle"];

    double v22 = (void *)v33;
  }
  if ([v8 isEqualToString:v112])
  {
    uint64_t v34 = [MEMORY[0x1E4F42A80] systemImageNamed:@"xmark.circle.fill"];

    double v22 = (void *)v34;
  }
  if ([v8 isEqualToString:v18] && CKIsRunningInMacCatalyst())
  {
    v35 = [MEMORY[0x1E4F42A80] _systemImageNamed:v8];
    v36 = [MEMORY[0x1E4F42A98] configurationWithPointSize:4 weight:3 scale:16.0];
    uint64_t v37 = [v35 imageWithSymbolConfiguration:v36];

    double v22 = (void *)v37;
  }
  if ([v8 isEqualToString:v18])
  {
    v38 = +[CKUIBehavior sharedBehaviors];
    [v38 entryViewAppButtonImagePointSize];
    double v40 = v39;

    v41 = [MEMORY[0x1E4F42A98] configurationWithPointSize:4 weight:3 scale:v40];
    uint64_t v42 = [v22 imageWithSymbolConfiguration:v41];

    double v22 = (void *)v42;
  }
  v43 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  char v44 = [v43 isAudioMessagesEntryViewRecordingEnabled];

  if ((v44 & 1) == 0
    && [v8 isEqualToString:v113]
    && CKIsRunningInMacCatalyst())
  {
    v45 = [MEMORY[0x1E4F42A98] configurationWithPointSize:6 weight:3 scale:16.0];
    v46 = [MEMORY[0x1E4F42A80] _systemImageNamed:v8];
    uint64_t v47 = [v46 imageWithSymbolConfiguration:v45];

    double v22 = (void *)v47;
  }
  v48 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v49 = [v48 isAudioMessagesEntryViewRecordingEnabled];

  if (v49
    && (([v8 isEqualToString:v111] & 1) != 0 || objc_msgSend(v8, "isEqualToString:", v107)))
  {
    v101 = [MEMORY[0x1E4F42A98] configurationWithPointSize:5 weight:-1 scale:15.5];
    v50 = +[CKUIBehavior sharedBehaviors];
    v51 = [v50 entryViewDictationButtonColor];

    v52 = [MEMORY[0x1E4F42A98] configurationWithHierarchicalColor:v51];
    [v101 configurationByApplyingConfiguration:v52];
    v53 = v18;
    id v54 = v12;
    v55 = v15;
    v57 = v56 = v17;
    uint64_t v58 = [v22 imageWithSymbolConfiguration:v57];

    double v17 = v56;
    double v15 = v55;
    id v12 = v54;
    v18 = v53;

    double v22 = (void *)v58;
    double v20 = v108;
  }
  if (!v22)
  {
    _IMWarn();
    double v16 = 0;
    goto LABEL_90;
  }
  char v59 = [v8 isEqualToString:v18];
  if (v105 == 1) {
    char v60 = v59;
  }
  else {
    char v60 = 0;
  }
  v61 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v62 = [v61 isAudioMessagesEntryViewRecordingEnabled];

  unsigned __int8 v63 = v62 | v60;
  if (v62 && (v60 & 1) == 0) {
    unsigned __int8 v63 = [v8 isEqualToString:v113];
  }
  if (((CKIsRunningInMacCatalyst() == 0) & v63) != 0) {
    uint64_t v64 = 1;
  }
  else {
    uint64_t v64 = 2;
  }
  double v16 = [v22 imageWithRenderingMode:v64];
  [v22 size];
  double v66 = v65;
  double v68 = v67;
  if ((([v8 isEqualToString:v20] & 1) != 0 || objc_msgSend(v8, "isEqualToString:", v113))
    && !CKIsRunningInMacCatalyst())
  {
    v69 = +[CKUIBehavior sharedBehaviors];
    [v69 sendButtonSize];
    double v66 = v70;

    double v68 = v66;
  }
  v71 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v72 = [v71 isAudioMessagesEntryViewRecordingEnabled];

  if (v72)
  {
    if ([v8 isEqualToString:v111])
    {
      v73 = +[CKUIBehavior sharedBehaviors];
      [v73 dictationButtonSize];
      double v66 = v74;
      double v68 = v75;

      goto LABEL_57;
    }
    if ([v8 isEqualToString:v113])
    {
      v76 = +[CKUIBehavior sharedBehaviors];
      [v76 audioButtonSize];
      double v66 = v77;
      double v68 = v78;
LABEL_58:

      goto LABEL_59;
    }
    if ([v8 isEqualToString:v107])
    {
LABEL_57:
      v76 = +[CKUIBehavior sharedBehaviors];
      v79 = [v76 entryViewDictationButtonColor];
      uint64_t v80 = [v16 imageWithTintColor:v79];

      double v16 = (void *)v80;
      double v20 = v108;
      goto LABEL_58;
    }
  }
LABEL_59:
  int v81 = [v8 isEqualToString:v20];
  if (CKIsRunningInMacCatalyst() && ([v8 isEqualToString:v17] | v81) == 1)
  {
    v82 = +[CKUIBehavior sharedBehaviors];
    [v82 stopButtonSize];
    double v66 = v83;

    double v68 = v66;
  }
  if (CKIsRunningInMacCatalyst() && [v8 isEqualToString:v112])
  {
    v84 = +[CKUIBehavior sharedBehaviors];
    [v84 cancelButtonSize];
    double v66 = v85;
    double v68 = v86;
  }
  if (CKIsRunningInMacCatalyst())
  {
    if ([v8 isEqualToString:v18] & 1) != 0 || (objc_msgSend(v8, "isEqualToString:", v113)) {
      int v87 = 0;
    }
    else {
      int v87 = [v8 isEqualToString:v110] ^ 1;
    }
  }
  else
  {
    int v87 = 1;
  }
  v88 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v89 = [v88 isAudioMessagesEntryViewRecordingEnabled];

  if (v89)
  {
    if (([v8 isEqualToString:v113] & 1) != 0
      || ([v8 isEqualToString:v111] & 1) != 0
      || ([v8 isEqualToString:v107] & 1) != 0
      || ((v87 ^ 1) & 1) != 0)
    {
      goto LABEL_85;
    }
LABEL_78:
    [v22 scale];
    CGFloat v91 = v90;
    v115.width = v66;
    v115.height = v68;
    UIGraphicsBeginImageContextWithOptions(v115, 0, v91);
    [v12 set];
    objc_msgSend(v16, "drawInRect:", 0.0, 0.0, v66, v68);
    v92 = [v102 overlayImageForImageNamed:v8 tintColor:v105];
    if (v92)
    {
      v103 = v17;
      v93 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
      int v94 = [v93 isScheduledMessagesCoreEnabled];

      if (v94)
      {
        v95 = +[CKUIBehavior sharedBehaviors];
        v96 = [v95 theme];
        v97 = [v96 sendButtonArrowColorForColorType:v105];
        [v97 set];
      }
      else
      {
        v95 = [MEMORY[0x1E4F428B8] whiteColor];
        [v95 set];
      }

      objc_msgSend(v92, "drawInRect:", 0.0, 0.0, v66, v68);
      double v17 = v103;
    }
    uint64_t v98 = UIGraphicsGetImageFromCurrentImageContext();

    UIGraphicsEndImageContext();
    double v16 = (void *)v98;
    goto LABEL_85;
  }
  if (v87) {
    goto LABEL_78;
  }
LABEL_85:
  double v20 = v108;
  if (!CKIsRunningInMacCatalyst() && v104) {
    [v16 _suppressesAccessibilityHairlineThickening];
  }
  if (v16) {
    [(id)entryViewButtonImageWithName_tintColor_shouldSuppressHairline__sDictionary setObject:v16 forKey:v15];
  }
LABEL_90:

  if (v22)
  {
LABEL_91:
    v99 = [v16 imageWithRenderingMode:1];
    goto LABEL_92;
  }
  v99 = 0;
LABEL_92:

  return v99;
}

void __83__CKEntryViewButton_entryViewButtonImageWithName_tintColor_shouldSuppressHairline___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v1 = (void *)entryViewButtonImageWithName_tintColor_shouldSuppressHairline__sDictionary;
  entryViewButtonImageWithName_tintColor_shouldSuppressHairline__sDictionary = (uint64_t)v0;
}

+ (id)overlayImageForImageNamed:(id)a3 tintColor:(char)a4
{
  unsigned int v4 = a4;
  id v5 = a3;
  uint64_t v6 = 0;
  if (v4 <= 0xF && ((1 << v4) & 0x8003) != 0)
  {
    double v7 = +[CKUIBehavior sharedBehaviors];
    id v8 = [v7 entryViewSendButtonName];
    int v9 = [v5 isEqualToString:v8];

    if (v9)
    {
      uint64_t v6 = [MEMORY[0x1E4F42A80] ckImageNamed:@"SendButtonPunchout"];
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  double v10 = [v6 imageWithRenderingMode:2];

  return v10;
}

- (void)setCkTintColor:(char)a3
{
  if (self->_ckTintColor != a3)
  {
    self->_ckTintColor = a3;
    [(CKEntryViewButton *)self setDefaultImage];
  }
}

- (void)setWantsVibrancy:(BOOL)a3
{
  if (self->_wantsVibrancy != a3)
  {
    BOOL v3 = a3;
    id v5 = +[CKUIBehavior sharedBehaviors];
    int v6 = [v5 entryViewButtonWantsVibrancy];

    if (v6)
    {
      self->_wantsVibrancy = v3;
      if (v3)
      {
        id v9 = [MEMORY[0x1E4F427D8] effectWithStyle:1100];
        double v7 = objc_msgSend(MEMORY[0x1E4F42FE8], "_effectForBlurEffect:vibrancyStyle:");
        id v8 = [(CKEntryViewButton *)self vibrancyView];
        [v8 setEffect:v7];
      }
      else
      {
        id v9 = [(CKEntryViewButton *)self vibrancyView];
        [v9 setEffect:0];
      }
    }
  }
}

- (void)configureForAnimatableBlur
{
  self->_needsOversizedBlurContainer = 1;
  [(CKEntryViewButton *)self setNeedsLayout];
}

- (void)setBlurRadius:(double)a3
{
  id v4 = [(CKEntryViewButton *)self blurrableButtonContainer];
  [v4 setBlurRadius:a3];
}

- (double)blurRadius
{
  v2 = [(CKEntryViewButton *)self blurrableButtonContainer];
  [v2 blurRadius];
  double v4 = v3;

  return v4;
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CKEntryViewButton *)self button];
  [v4 setEnabled:v3];
}

- (BOOL)isEnabled
{
  v2 = [(CKEntryViewButton *)self button];
  char v3 = [v2 isEnabled];

  return v3;
}

- (void)setDefaultImage
{
  int64_t v3 = [(CKEntryViewButton *)self entryViewButtonType];
  uint64_t ckTintColor = self->_ckTintColor;

  [(CKEntryViewButton *)self setTintedImageForButtonType:v3 tintColor:ckTintColor];
}

- (void)setTintedImageForButtonType:(int64_t)a3 tintColor:(char)a4
{
  uint64_t v4 = a4;
  +[CKEntryViewButton imageNameForEntryViewButtonType:](CKEntryViewButton, "imageNameForEntryViewButtonType:");
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  [(CKEntryViewButton *)self setupCompositeFilterForButton];
  double v7 = [(id)objc_opt_class() entryViewButtonImageWithName:v12 tintColor:v4 shouldSuppressHairline:1];
  id v8 = [(CKEntryViewButton *)self button];
  [v8 setImage:v7 forState:0];

  if (a3 == 4) {
    id v9 = v7;
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;
  id v11 = [(CKEntryViewButton *)self button];
  [v11 setImage:v10 forState:4];
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CKEntryViewButton;
  [(CKEntryViewButton *)&v4 traitCollectionDidChange:a3];
  [(CKEntryViewButton *)self setupCompositeFilterForButton];
}

- (void)setupCompositeFilterForButton
{
  int64_t v3 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v4 = [v3 isAudioMessagesEntryViewRecordingEnabled];

  if (v4
    && ([(CKEntryViewButton *)self entryViewButtonType] == 8
     || [(CKEntryViewButton *)self entryViewButtonType] == 9))
  {
    id v14 = (id)*MEMORY[0x1E4F3A2E0];
    id v5 = [(CKEntryViewButton *)self traitCollection];
    uint64_t v6 = [v5 userInterfaceStyle];

    if (v6 == 2)
    {
      id v7 = (id)*MEMORY[0x1E4F3A2E8];

      id v14 = v7;
    }
    id v8 = [(CKEntryViewButton *)self button];
    id v9 = [v8 layer];
    id v10 = [MEMORY[0x1E4F39BC0] filterWithType:v14];
    [v9 setCompositingFilter:v10];

    id v11 = [(CKEntryViewButton *)self button];
    id v12 = [v11 superview];
    id v13 = [v12 layer];
    [v13 setAllowsGroupBlending:0];
  }
}

- (CGSize)intrinsicContentSize
{
  int64_t v3 = [(CKEntryViewButton *)self button];
  [v3 sizeToFit];

  int v4 = [(CKEntryViewButton *)self button];
  [v4 frame];
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (id)pointerInteraction:(id)a3 regionForLocation:(CGPoint)a4 defaultRegion:(id)a5
{
  id v5 = a5;

  return v5;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4 modifiers:(int64_t)a5
{
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F42ED8]) initWithView:self];
  double v6 = [MEMORY[0x1E4F42CA8] effectWithPreview:v5];
  double v7 = [MEMORY[0x1E4F42CC0] styleWithEffect:v6 shape:0];

  return v7;
}

- (UIButton)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
}

- (char)ckTintColor
{
  return self->_ckTintColor;
}

- (BOOL)wantsVibrancy
{
  return self->_wantsVibrancy;
}

- (int64_t)entryViewButtonType
{
  return self->_entryViewButtonType;
}

- (void)setEntryViewButtonType:(int64_t)a3
{
  self->_entryViewButtonType = a3;
}

- (CKEntryViewBlurrableButtonContainer)blurrableButtonContainer
{
  return self->_blurrableButtonContainer;
}

- (void)setBlurrableButtonContainer:(id)a3
{
}

- (UIVisualEffectView)vibrancyView
{
  return self->_vibrancyView;
}

- (void)setVibrancyView:(id)a3
{
}

- (BOOL)needsOversizedBlurContainer
{
  return self->_needsOversizedBlurContainer;
}

- (void)setNeedsOversizedBlurContainer:(BOOL)a3
{
  self->_needsOversizedBlurContainer = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vibrancyView, 0);
  objc_storeStrong((id *)&self->_blurrableButtonContainer, 0);

  objc_storeStrong((id *)&self->_button, 0);
}

@end