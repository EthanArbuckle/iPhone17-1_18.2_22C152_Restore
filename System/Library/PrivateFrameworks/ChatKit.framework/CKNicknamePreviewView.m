@interface CKNicknamePreviewView
- (BOOL)shouldStopAnimation;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CKCNSharingProfileAvatarItemProvider)avatarItemProvider;
- (CKNicknamePreviewView)initWithContact:(id)a3 avatarRecord:(id)a4;
- (CKTextBalloonView)balloonView;
- (CNContact)contact;
- (CNSharingProfileAvatarItemProviderConfiguration)avatarItemProviderConfiguration;
- (NSArray)avatarViews;
- (NSArray)senderStrings;
- (UILabel)senderLabel;
- (id)balloonImageFromMask:(id)a3 withColor:(id)a4;
- (id)balloonText;
- (id)flipAnimation;
- (id)imageForAvatarType:(int64_t)a3;
- (id)senderStringForAvatarType:(int64_t)a3;
- (void)avatarDidFinishTransitionToAvatarAtIndex:(unint64_t)a3;
- (void)beginAnimation;
- (void)layoutSubviews;
- (void)runFlipAnimationOnAvatarView:(id)a3 completion:(id)a4;
- (void)setAvatarItemProvider:(id)a3;
- (void)setAvatarViews:(id)a3;
- (void)setBalloonView:(id)a3;
- (void)setContact:(id)a3;
- (void)setSenderLabel:(id)a3;
- (void)setSenderLabelVisible:(BOOL)a3 completion:(id)a4;
- (void)setSenderStrings:(id)a3;
- (void)setShouldStopAnimation:(BOOL)a3;
- (void)updateBalloonTraitCollection;
@end

@implementation CKNicknamePreviewView

- (CKNicknamePreviewView)initWithContact:(id)a3 avatarRecord:(id)a4
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v52 = a3;
  id v50 = a4;
  v55.receiver = self;
  v55.super_class = (Class)CKNicknamePreviewView;
  v6 = [(CKNicknamePreviewView *)&v55 init];
  if (v6)
  {
    if (_ContactsUIForwardDeclareInit_onceToken_0 != -1) {
      dispatch_once(&_ContactsUIForwardDeclareInit_onceToken_0, &__block_literal_global_194);
    }
    v7 = (void *)[objc_alloc((Class)_CKCNSharingProfileAvatarItemProvider) initWithContact:v52 avatarRecord:v50 logger:0];
    [(CKNicknamePreviewView *)v6 setAvatarItemProvider:v7];

    v8 = [(CKNicknamePreviewView *)v6 avatarItemProvider];
    [v8 setShouldIncludeSilhouette:1];

    [(CKNicknamePreviewView *)v6 setContact:v52];
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    for (uint64_t i = 0; i != 4; ++i)
    {
      v12 = [(CKNicknamePreviewView *)v6 imageForAvatarType:i];
      if (v12)
      {
        v13 = [(CKNicknamePreviewView *)v6 senderStringForAvatarType:i];
        id v14 = objc_alloc_init(MEMORY[0x1E4F42AA0]);
        v15 = [v14 layer];
        [v15 setCornerRadius:22.0];

        v16 = [v14 layer];
        [v16 setMasksToBounds:1];

        [v14 setImage:v12];
        [v9 addObject:v14];
        [(CKNicknamePreviewView *)v6 addSubview:v14];
        CATransform3DMakeRotation(&v54, -1.57079633, 0.0, 1.0, 0.0);
        v17 = [v14 layer];
        CATransform3D v53 = v54;
        [v17 setTransform:&v53];

        [v10 addObject:v13];
      }
      else if (IMOSLoggingEnabled())
      {
        v18 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          LODWORD(buf) = 134217984;
          *(void *)((char *)&buf + 4) = i;
          _os_log_impl(&dword_18EF18000, v18, OS_LOG_TYPE_INFO, "Didn't get an avatar image for type %li", (uint8_t *)&buf, 0xCu);
        }
      }
    }
    v19 = (void *)[v9 copy];
    [(CKNicknamePreviewView *)v6 setAvatarViews:v19];

    v20 = (void *)[v10 copy];
    [(CKNicknamePreviewView *)v6 setSenderStrings:v20];

    id v51 = objc_alloc_init(MEMORY[0x1E4F42B38]);
    v21 = [(CKNicknamePreviewView *)v6 senderStrings];
    v22 = [v21 firstObject];
    [v51 setAttributedText:v22];

    [(CKNicknamePreviewView *)v6 addSubview:v51];
    [(CKNicknamePreviewView *)v6 setSenderLabel:v51];
    v23 = [CKOnboardingBalloonView alloc];
    v24 = -[CKTextBalloonView initWithFrame:](v23, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(CKNicknamePreviewView *)v6 addSubview:v24];
    [(CKColoredBalloonView *)v24 setColor:0xFFFFFFFFLL];
    v25 = [(CKNicknamePreviewView *)v6 balloonView];
    v26 = [(CKNicknamePreviewView *)v6 traitCollection];
    [v25 updateBalloonForTraitCollection:v26];

    [(CKBalloonView *)v24 setOrientation:0];
    [(CKColoredBalloonView *)v24 setHasTail:1];
    [(CKBalloonView *)v24 setBalloonCorners:-1];
    [(CKColoredBalloonView *)v24 setCanUseOpaqueMask:0];
    v27 = [(CKNicknamePreviewView *)v6 traitCollection];
    uint64_t v28 = [v27 userInterfaceStyle];

    v29 = [(CKNicknamePreviewView *)v6 traitCollection];
    uint64_t v30 = CKBackgroundLevelForTraitCollection(v29);

    LOWORD(buf) = 256;
    *(void *)((char *)&buf + 2) = 0;
    *((void *)&buf + 1) = 0;
    char v57 = -1;
    long long v58 = 0u;
    memset(v59, 0, sizeof(v59));
    uint64_t v60 = v28;
    uint64_t v61 = v30;
    int v62 = 256;
    int v63 = 0;
    [(CKColoredBalloonView *)v24 setBalloonDescriptor:&buf];
    id v31 = objc_alloc(MEMORY[0x1E4F28E48]);
    v32 = CKFrameworkBundle();
    v33 = [v32 localizedStringForKey:@"WHATS_NEW_NAME_AND_PHOTO_SHARING_HI_ITS_ME" value:&stru_1EDE4CA38 table:@"ChatKit"];
    v34 = (void *)[v31 initWithString:v33];

    v35 = objc_msgSend(MEMORY[0x1E4FB08E0], "__ck_shortPreferredFontForTextStyle:size:", *MEMORY[0x1E4F43870], 19.0);
    uint64_t v36 = [v34 length];
    objc_msgSend(v34, "addAttribute:value:range:", *MEMORY[0x1E4FB06F8], v35, 0, v36);

    v37 = [NSNumber numberWithDouble:0.57];
    uint64_t v38 = [v34 length];
    objc_msgSend(v34, "addAttribute:value:range:", *MEMORY[0x1E4FB0710], v37, 0, v38);

    [(CKTextBalloonView *)v24 setAttributedText:v34];
    v39 = +[CKUIBehavior sharedBehaviors];
    [v39 balloonMaskAlignmentRectInsetsWithTailShape:1];
    double v41 = v40;
    double v43 = v42;

    v44 = [(CKNicknamePreviewView *)v6 traitCollection];
    [v44 displayScale];
    LOWORD(buf) = 256;
    *(void *)((char *)&buf + 2) = 0;
    *((void *)&buf + 1) = 0;
    char v57 = -1;
    long long v58 = 0u;
    memset(v59, 0, sizeof(v59));
    uint64_t v60 = v28;
    uint64_t v61 = v30;
    int v62 = 256;
    int v63 = 0;
    v46 = CKResizableBalloonMaskWithMinHeight((uint64_t)&buf, v43 + v41 + 19.0, v45);

    LOWORD(buf) = 256;
    *(void *)((char *)&buf + 2) = 0;
    *((void *)&buf + 1) = 0;
    char v57 = -1;
    long long v58 = 0u;
    memset(v59, 0, sizeof(v59));
    uint64_t v60 = v28;
    uint64_t v61 = v30;
    int v62 = 256;
    int v63 = 0;
    v47 = CKResolvedColorForBalloonDescriptor((uint64_t)&buf);
    v48 = [(CKNicknamePreviewView *)v6 balloonImageFromMask:v46 withColor:v47];

    [(CKOnboardingBalloonView *)v24 setLargeBalloonImage:v48];
    [(CKBalloonView *)v24 setNeedsPrepareForDisplay];
    [(CKBalloonView *)v24 prepareForDisplayIfNeeded];
    [(CKNicknamePreviewView *)v6 setBalloonView:v24];
  }
  return v6;
}

- (id)balloonImageFromMask:(id)a3 withColor:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  [v6 capInsets];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  [v6 alignmentRectInsets];
  double v35 = v16;
  double v36 = v15;
  double v18 = v17;
  double v20 = v19;
  [v6 size];
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  [v6 scale];
  CGFloat v26 = v25;
  v38.width = v22;
  v38.height = v24;
  UIGraphicsBeginImageContextWithOptions(v38, 0, v26);
  [v6 size];
  double v28 = v27;
  [v6 size];
  double v30 = v29;
  [v5 set];

  v39.origin.x = 0.0;
  v39.origin.y = 0.0;
  v39.size.width = v28;
  v39.size.height = v30;
  UIRectFill(v39);
  objc_msgSend(v6, "drawInRect:blendMode:alpha:", 22, 0.0, 0.0, v28, v30, 1.0);

  id v31 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  v32 = objc_msgSend(v31, "resizableImageWithCapInsets:", v8, v10, v12, v14);

  v33 = objc_msgSend(v32, "imageWithAlignmentRectInsets:", v36, v35, v18, v20);

  return v33;
}

- (id)balloonText
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E48]);
  v4 = CKFrameworkBundle();
  id v5 = [v4 localizedStringForKey:@"WHATS_NEW_NAME_AND_PHOTO_SHARING_HI_ITS_ME" value:&stru_1EDE4CA38 table:@"ChatKit"];
  id v6 = (void *)[v3 initWithString:v5];

  uint64_t v7 = [v6 length];
  uint64_t v8 = *MEMORY[0x1E4FB06F8];
  double v9 = objc_msgSend(MEMORY[0x1E4FB08E0], "__ck_shortPreferredFontForTextStyle:size:", *MEMORY[0x1E4F43870], 19.0);
  objc_msgSend(v6, "addAttribute:value:range:", v8, v9, 0, v7);

  uint64_t v10 = *MEMORY[0x1E4FB0700];
  double v11 = +[CKUIBehavior sharedBehaviors];
  double v12 = [v11 theme];
  double v13 = [(CKNicknamePreviewView *)self balloonView];
  double v14 = objc_msgSend(v12, "balloonTextColorForColorType:", objc_msgSend(v13, "color"));
  objc_msgSend(v6, "addAttribute:value:range:", v10, v14, 0, v7);

  uint64_t v15 = *MEMORY[0x1E4FB0710];
  double v16 = [NSNumber numberWithDouble:0.57];
  objc_msgSend(v6, "addAttribute:value:range:", v15, v16, 0, objc_msgSend(v6, "length"));

  return v6;
}

- (void)updateBalloonTraitCollection
{
  id v3 = [(CKNicknamePreviewView *)self balloonView];
  v4 = [(CKNicknamePreviewView *)self traitCollection];
  [v3 updateBalloonForTraitCollection:v4];

  id v5 = [(CKNicknamePreviewView *)self balloonView];
  id v6 = [(CKNicknamePreviewView *)self balloonText];
  [v5 setAttributedText:v6];

  uint64_t v7 = [(CKNicknamePreviewView *)self balloonView];
  [v7 setNeedsPrepareForDisplay];

  id v8 = [(CKNicknamePreviewView *)self balloonView];
  [v8 prepareForDisplayIfNeeded];
}

- (void)beginAnimation
{
  id v3 = [(CKNicknamePreviewView *)self avatarViews];
  -[CKNicknamePreviewView avatarDidFinishTransitionToAvatarAtIndex:](self, "avatarDidFinishTransitionToAvatarAtIndex:", [v3 count] - 1);
}

- (void)layoutSubviews
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v3 = [(CKNicknamePreviewView *)self senderLabel];
  [v3 sizeToFit];

  v4 = [(CKNicknamePreviewView *)self senderLabel];
  [v4 frame];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  double v10 = v9;

  v56.origin.y = 0.0;
  v56.origin.x = v6;
  v56.size.width = v8;
  v56.size.height = v10;
  double Height = CGRectGetHeight(v56);
  double v12 = [(CKNicknamePreviewView *)self senderLabel];
  [v12 _lastLineBaseline];
  double v14 = v13;

  long long v15 = *(_OWORD *)(MEMORY[0x1E4F437F8] + 16);
  long long v52 = *MEMORY[0x1E4F437F8];
  long long v53 = v15;
  double v16 = [(CKNicknamePreviewView *)self balloonView];
  objc_msgSend(v16, "sizeThatFits:textAlignmentInsets:", &v52, 320.0, 1.79769313e308);
  double v18 = v17;
  double v20 = v19;

  double v21 = [(CKNicknamePreviewView *)self balloonView];
  objc_msgSend(v21, "setTextAlignmentInsets:", v52, v53);

  double v22 = *MEMORY[0x1E4F1DB28];
  v57.origin.y = 0.0;
  v57.origin.x = v6;
  v57.size.width = v8;
  v57.size.height = v10;
  CGFloat v23 = v14 - Height + CGRectGetMaxY(v57) + 5.0;
  CGFloat v24 = v22 + 56.0;
  double v25 = [(CKNicknamePreviewView *)self balloonView];
  objc_msgSend(v25, "setFrame:", v22 + 56.0, v23, v18, v20);

  CGFloat v26 = [(CKNicknamePreviewView *)self balloonView];
  [v26 alignmentRectInsets];
  CGFloat v28 = v22 + 56.0 + v27;

  [(CKNicknamePreviewView *)self frame];
  double Width = CGRectGetWidth(v58);
  v59.origin.y = 0.0;
  v59.origin.x = v28;
  v59.size.width = v8;
  v59.size.height = v10;
  double v30 = Width - CGRectGetMinX(v59);
  id v31 = [(CKNicknamePreviewView *)self senderLabel];
  objc_msgSend(v31, "setFrame:", v28, 0.0, v30, v10);

  v32 = [(CKNicknamePreviewView *)self avatarViews];
  v33 = [v32 firstObject];
  [v33 frame];
  CGFloat v35 = v34;
  CGFloat v37 = v36;
  CGFloat v39 = v38;

  v60.origin.x = v24;
  v60.origin.y = v23;
  v60.size.width = v18;
  v60.size.height = v20;
  double MidY = CGRectGetMidY(v60);
  v61.origin.x = 0.0;
  v61.origin.y = v35;
  v61.size.width = v37;
  v61.size.height = v39;
  double v41 = CGRectGetHeight(v61);
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  double v42 = [(CKNicknamePreviewView *)self avatarViews];
  uint64_t v43 = [v42 countByEnumeratingWithState:&v48 objects:v54 count:16];
  if (v43)
  {
    uint64_t v44 = v43;
    double v45 = MidY + v41 * -0.5;
    uint64_t v46 = *(void *)v49;
    do
    {
      uint64_t v47 = 0;
      do
      {
        if (*(void *)v49 != v46) {
          objc_enumerationMutation(v42);
        }
        objc_msgSend(*(id *)(*((void *)&v48 + 1) + 8 * v47++), "setFrame:", 0.0, v45, 44.0, 44.0);
      }
      while (v44 != v47);
      uint64_t v44 = [v42 countByEnumeratingWithState:&v48 objects:v54 count:16];
    }
    while (v44);
  }

  [(CKNicknamePreviewView *)self setShouldStopAnimation:0];
}

- (void)avatarDidFinishTransitionToAvatarAtIndex:(unint64_t)a3
{
  id v21 = [(CKNicknamePreviewView *)self avatarViews];
  if ([v21 count] <= a3)
  {
  }
  else
  {
    BOOL v5 = [(CKNicknamePreviewView *)self shouldStopAnimation];

    if (!v5)
    {
      CGFloat v6 = [(CKNicknamePreviewView *)self avatarViews];
      unint64_t v7 = (a3 + 1) % [v6 count];

      CGFloat v8 = [(CKNicknamePreviewView *)self avatarViews];
      double v9 = [v8 objectAtIndexedSubscript:v7];

      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __66__CKNicknamePreviewView_avatarDidFinishTransitionToAvatarAtIndex___block_invoke;
      v26[3] = &unk_1E5622950;
      v26[4] = self;
      v26[5] = v7;
      [(CKNicknamePreviewView *)self runFlipAnimationOnAvatarView:v9 completion:v26];
      unint64_t v10 = a3 + 2;
      double v11 = [(CKNicknamePreviewView *)self senderStrings];
      unint64_t v12 = v10 % [v11 count];

      double v13 = [(CKNicknamePreviewView *)self senderStrings];
      double v14 = [v13 objectAtIndexedSubscript:v7];

      long long v15 = [(CKNicknamePreviewView *)self senderStrings];
      double v16 = [v15 objectAtIndexedSubscript:v12];

      double v17 = [v14 string];
      double v18 = [v16 string];
      char v19 = [v17 isEqualToString:v18];

      if ((v19 & 1) == 0)
      {
        id location = 0;
        objc_initWeak(&location, self);
        dispatch_time_t v20 = dispatch_time(0, 1700000000);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __66__CKNicknamePreviewView_avatarDidFinishTransitionToAvatarAtIndex___block_invoke_2;
        block[3] = &unk_1E5622778;
        block[4] = self;
        objc_copyWeak(&v24, &location);
        id v23 = v16;
        dispatch_after(v20, MEMORY[0x1E4F14428], block);

        objc_destroyWeak(&v24);
        objc_destroyWeak(&location);
      }
    }
  }
}

uint64_t __66__CKNicknamePreviewView_avatarDidFinishTransitionToAvatarAtIndex___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) avatarDidFinishTransitionToAvatarAtIndex:*(void *)(a1 + 40)];
}

void __66__CKNicknamePreviewView_avatarDidFinishTransitionToAvatarAtIndex___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __66__CKNicknamePreviewView_avatarDidFinishTransitionToAvatarAtIndex___block_invoke_3;
  v3[3] = &unk_1E5622AB8;
  objc_copyWeak(&v5, (id *)(a1 + 48));
  id v4 = *(id *)(a1 + 40);
  [v2 setSenderLabelVisible:0 completion:v3];

  objc_destroyWeak(&v5);
}

void __66__CKNicknamePreviewView_avatarDidFinishTransitionToAvatarAtIndex___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained senderLabel];
  [v4 setAttributedText:v1];

  id v5 = objc_loadWeakRetained(v2);
  [v5 setSenderLabelVisible:1 completion:0];
}

- (void)setSenderLabelVisible:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  CGFloat v6 = (void *)MEMORY[0x1E4F39CF8];
  id v7 = a4;
  [v6 begin];
  [MEMORY[0x1E4F39CF8] setCompletionBlock:v7];

  id v19 = [MEMORY[0x1E4F39B48] animation];
  [v19 setKeyPath:@"opacity"];
  [v19 setDuration:0.1];
  CGFloat v8 = NSNumber;
  double v9 = [(CKNicknamePreviewView *)self senderLabel];
  unint64_t v10 = [v9 layer];
  [v10 opacity];
  double v11 = objc_msgSend(v8, "numberWithFloat:");
  [v19 setFromValue:v11];

  if (v4) {
    double v12 = 1.0;
  }
  else {
    double v12 = 0.0;
  }
  double v13 = [NSNumber numberWithDouble:v12];
  [v19 setToValue:v13];

  long long v15 = [(CKNicknamePreviewView *)self senderLabel];
  double v16 = [v15 layer];
  float v14 = v12;
  *(float *)&double v17 = v14;
  [v16 setOpacity:v17];

  double v18 = [(CKNicknamePreviewView *)self senderLabel];
  [v18 addAnimation:v19 forKey:@"fadeAnimation"];

  [MEMORY[0x1E4F39CF8] commit];
}

- (void)runFlipAnimationOnAvatarView:(id)a3 completion:(id)a4
{
  CGFloat v6 = (void *)MEMORY[0x1E4F39CF8];
  id v7 = a4;
  id v8 = a3;
  [v6 begin];
  [MEMORY[0x1E4F39CF8] setCompletionBlock:v7];

  id v10 = [(CKNicknamePreviewView *)self flipAnimation];
  double v9 = [v8 layer];

  [v9 addAnimation:v10 forKey:@"flipAnimation"];
  [MEMORY[0x1E4F39CF8] commit];
}

- (id)flipAnimation
{
  v15[3] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"transform.rotation.y"];
  [v2 setValues:&unk_1EDF15740];
  [v2 setKeyTimes:&unk_1EDF15758];
  LODWORD(v3) = 0.25;
  LODWORD(v4) = 0.25;
  LODWORD(v5) = 1.0;
  CGFloat v6 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v3 :v4 :0.0 :v5];
  id v7 = objc_msgSend(MEMORY[0x1E4F39C10], "functionWithName:", *MEMORY[0x1E4F3A4A0], v6);
  v15[1] = v7;
  LODWORD(v8) = 1011129254;
  LODWORD(v9) = 1.0;
  LODWORD(v10) = 0.75;
  LODWORD(v11) = 0.75;
  double v12 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v9 :v8 :v10 :v11];
  v15[2] = v12;
  double v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:3];
  [v2 setTimingFunctions:v13];

  [v2 setDuration:1.9];

  return v2;
}

- (id)imageForAvatarType:(int64_t)a3
{
  switch(a3)
  {
    case 0:
      double v3 = [(CKNicknamePreviewView *)self avatarItemProvider];
      uint64_t v4 = [v3 silhouetteItem];
      goto LABEL_6;
    case 1:
      double v3 = [(CKNicknamePreviewView *)self avatarItemProvider];
      uint64_t v4 = [v3 animojiItem];
      goto LABEL_6;
    case 2:
      double v3 = [(CKNicknamePreviewView *)self avatarItemProvider];
      uint64_t v4 = [v3 photoItem];
      goto LABEL_6;
    case 3:
      double v3 = [(CKNicknamePreviewView *)self avatarItemProvider];
      uint64_t v4 = [v3 monogramItem];
LABEL_6:
      double v5 = (void *)v4;

      if (!v5) {
        goto LABEL_8;
      }
      CGFloat v6 = [v5 imageProvider];
      id v7 = v6[2](44.0, 44.0);

      break;
    default:
LABEL_8:
      id v7 = 0;
      break;
  }

  return v7;
}

- (id)senderStringForAvatarType:(int64_t)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  double v5 = [MEMORY[0x1E4F6BDC0] iMessageService];
  CGFloat v6 = IMPreferredAccountForService();
  id v7 = [v6 displayName];
  double v8 = v7;
  if ((unint64_t)(a3 - 1) >= 3)
  {
    if (a3) {
      double v11 = 0;
    }
    else {
      double v11 = v7;
    }
  }
  else
  {
    double v9 = (void *)MEMORY[0x1E4F1B910];
    double v10 = [(CKNicknamePreviewView *)self contact];
    double v11 = [v9 stringFromContact:v10 style:0];
  }
  if ([(__CFString *)v11 length])
  {
    if (v11) {
      goto LABEL_15;
    }
  }
  else
  {
    double v12 = v8;

    double v11 = v12;
    if (v12) {
      goto LABEL_15;
    }
  }
  if (IMOSLoggingEnabled())
  {
    double v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v23 = 134218498;
      int64_t v24 = a3;
      __int16 v25 = 2112;
      CGFloat v26 = v6;
      __int16 v27 = 2112;
      CGFloat v28 = v8;
      _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_INFO, "senderStringForAvatarType %li is nil. Account: %@, Display name: %@", (uint8_t *)&v23, 0x20u);
    }
  }
  double v11 = &stru_1EDE4CA38;
LABEL_15:
  float v14 = +[CKUIBehavior sharedBehaviors];
  long long v15 = [v14 senderTranscriptTextAttributes];
  double v16 = (void *)[v15 mutableCopy];

  int v17 = CKIsRunningInMacCatalyst();
  double v18 = (void *)MEMORY[0x1E4F43890];
  if (v17) {
    double v18 = (void *)MEMORY[0x1E4F43878];
  }
  id v19 = objc_msgSend(MEMORY[0x1E4FB08E0], "__ck_preferredFontForStyle:", *v18);
  [v16 setObject:v19 forKeyedSubscript:*MEMORY[0x1E4FB06F8]];

  id v20 = objc_alloc_init(MEMORY[0x1E4FB0848]);
  [v20 setLineBreakMode:4];
  [v16 setObject:v20 forKeyedSubscript:*MEMORY[0x1E4FB0738]];
  id v21 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v11 attributes:v16];

  return v21;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  uint64_t v4 = [(CKNicknamePreviewView *)self balloonView];
  [v4 frame];
  CGFloat MaxX = CGRectGetMaxX(v11);

  CGFloat v6 = [(CKNicknamePreviewView *)self balloonView];
  [v6 frame];
  CGFloat MaxY = CGRectGetMaxY(v12);

  double v8 = MaxX;
  double v9 = MaxY;
  result.height = v9;
  result.width = v8;
  return result;
}

- (CNSharingProfileAvatarItemProviderConfiguration)avatarItemProviderConfiguration
{
  v2 = [(CKNicknamePreviewView *)self avatarItemProvider];
  double v3 = [v2 configuration];

  return (CNSharingProfileAvatarItemProviderConfiguration *)v3;
}

- (BOOL)shouldStopAnimation
{
  return self->_shouldStopAnimation;
}

- (void)setShouldStopAnimation:(BOOL)a3
{
  self->_shouldStopAnimation = a3;
}

- (UILabel)senderLabel
{
  return self->_senderLabel;
}

- (void)setSenderLabel:(id)a3
{
}

- (NSArray)avatarViews
{
  return self->_avatarViews;
}

- (void)setAvatarViews:(id)a3
{
}

- (CKTextBalloonView)balloonView
{
  return self->_balloonView;
}

- (void)setBalloonView:(id)a3
{
}

- (NSArray)senderStrings
{
  return self->_senderStrings;
}

- (void)setSenderStrings:(id)a3
{
}

- (CKCNSharingProfileAvatarItemProvider)avatarItemProvider
{
  return self->_avatarItemProvider;
}

- (void)setAvatarItemProvider:(id)a3
{
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_avatarItemProvider, 0);
  objc_storeStrong((id *)&self->_senderStrings, 0);
  objc_storeStrong((id *)&self->_balloonView, 0);
  objc_storeStrong((id *)&self->_avatarViews, 0);

  objc_storeStrong((id *)&self->_senderLabel, 0);
}

@end