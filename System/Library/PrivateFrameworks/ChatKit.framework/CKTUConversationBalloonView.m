@interface CKTUConversationBalloonView
+ (BOOL)_shouldAlwaysHideSessionImageView;
+ (BOOL)_shouldUseStackedLayout;
+ (CGSize)appIconSize;
- (BOOL)_shouldShowJoinButton;
- (BOOL)_shouldShowSessionView;
- (BOOL)animating;
- (BOOL)isUnknownSender;
- (BOOL)joinButtonIsShowingImageContent;
- (BOOL)joinButtonIsShowingTextContent;
- (BOOL)shouldRenderJoinButtonAsIcon;
- (BOOL)wantsGradient;
- (CGSize)_preferredJoinButtonSize;
- (CGSize)_preferredSessionImageViewSize;
- (CGSize)imageViewSize;
- (CGSize)joinButtonRenderedAsIconSize;
- (CGSize)layoutSizeForSize:(CGSize)a3 applyLayout:(BOOL)a4;
- (CGSize)sizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4;
- (CGSize)stackedLayoutSizeForSize:(CGSize)a3 applyLayout:(BOOL)a4;
- (CGSize)standardLayoutSizeForSize:(CGSize)a3 applyLayout:(BOOL)a4;
- (CKAvatarView)avatarView;
- (CKTUConversationBalloonView)initWithFrame:(CGRect)a3;
- (NSString)joinButtonText_TestingOverride;
- (NSUUID)tuConversationUUID;
- (UIButton)joinButton;
- (UIImageView)iconView;
- (UIImageView)sessionImageView;
- (UILabel)subtitleLabel1;
- (UILabel)subtitleLabel2;
- (UILabel)titleLabel;
- (UIView)sessionAccessoryView;
- (char)color;
- (char)orientation;
- (id)_currentCall;
- (id)_iconJoinButtonConfiguration;
- (id)_joinButtonText;
- (id)_sharePlayImageWithDiameter:(double)a3;
- (id)_textJoinButtonConfiguration;
- (id)subtitleColor;
- (id)tuConversation;
- (unint64_t)conversationAVMode;
- (unint64_t)state;
- (void)_joinButtonTapped:(id)a3;
- (void)_multiWayCallStateChanged:(id)a3;
- (void)configureForCurrentState;
- (void)configureForCurrentStateWithLayoutPass:(BOOL)a3;
- (void)configureForTUConversationChatItem:(id)a3;
- (void)configureIconView;
- (void)configureImageView;
- (void)configureJoinButton;
- (void)configureSessionAccessoryView;
- (void)configureSubtitle1;
- (void)configureSubtitle2;
- (void)configureTitle;
- (void)contentSizeCategoryDidChange:(id)a3;
- (void)formatIconViewForActivity;
- (void)formatIconViewForFaceTime;
- (void)formatImageViewForActivity;
- (void)formatImageViewForFaceTime;
- (void)layoutSubviews;
- (void)prepareForDisplay;
- (void)prepareForReuse;
- (void)setAnimating:(BOOL)a3;
- (void)setAvatarView:(id)a3;
- (void)setConversationAVMode:(unint64_t)a3;
- (void)setIconView:(id)a3;
- (void)setJoinButton:(id)a3;
- (void)setJoinButtonText_TestingOverride:(id)a3;
- (void)setOrientation:(char)a3;
- (void)setSessionAccessoryView:(id)a3;
- (void)setSessionImageView:(id)a3;
- (void)setShouldRenderJoinButtonAsIcon:(BOOL)a3;
- (void)setState:(unint64_t)a3;
- (void)setSubtitleLabel1:(id)a3;
- (void)setSubtitleLabel2:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTuConversationUUID:(id)a3;
- (void)setUnknownSender:(BOOL)a3;
@end

@implementation CKTUConversationBalloonView

+ (BOOL)_shouldUseStackedLayout
{
  v2 = +[CKUIBehavior sharedBehaviors];
  char v3 = [v2 isAccessibilityPreferredContentSizeCategory];

  return v3;
}

+ (BOOL)_shouldAlwaysHideSessionImageView
{
  v2 = CKPreferredContentSizeCategory();
  if ([v2 isEqualToString:*MEMORY[0x1E4F43768]]) {
    char v3 = 1;
  }
  else {
    char v3 = [v2 isEqualToString:*MEMORY[0x1E4F43760]];
  }

  return v3;
}

- (CKTUConversationBalloonView)initWithFrame:(CGRect)a3
{
  v33.receiver = self;
  v33.super_class = (Class)CKTUConversationBalloonView;
  char v3 = -[CKColoredBalloonView initWithFrame:](&v33, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_state = 1;
    id v5 = objc_alloc(MEMORY[0x1E4F42AA0]);
    double v6 = *MEMORY[0x1E4F1DB28];
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    v10 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], v7, v8, v9);
    [v10 setContentMode:2];
    [(CKTUConversationBalloonView *)v4 addSubview:v10];
    [(CKTUConversationBalloonView *)v4 setSessionImageView:v10];
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42AA0]), "initWithFrame:", v6, v7, v8, v9);
    [v11 setContentMode:2];
    [(CKTUConversationBalloonView *)v4 addSubview:v11];
    [(CKTUConversationBalloonView *)v4 setIconView:v11];
    v12 = -[CKAvatarView initWithFrame:]([CKAvatarView alloc], "initWithFrame:", v6, v7, v8, v9);
    [(CKAvatarView *)v12 setContentMode:2];
    [(CKTUConversationBalloonView *)v4 addSubview:v12];
    [(CKTUConversationBalloonView *)v4 setAvatarView:v12];
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42B38]), "initWithFrame:", v6, v7, v8, v9);
    v14 = (void *)MEMORY[0x1E4FB08E0];
    v15 = +[CKUIBehavior sharedBehaviors];
    v16 = [v15 tuConversationBalloonTitleFont];
    v17 = objc_msgSend(v14, "__ck_emphasizedFontFromFont:", v16);
    [v13 setFont:v17];

    [v13 setLineBreakMode:4];
    [v13 setNumberOfLines:2];
    [(CKTUConversationBalloonView *)v4 addSubview:v13];
    [(CKTUConversationBalloonView *)v4 setTitleLabel:v13];
    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42B38]), "initWithFrame:", v6, v7, v8, v9);
    v19 = +[CKUIBehavior sharedBehaviors];
    v20 = [v19 tuConversationBalloonSubtitleFont];
    [v18 setFont:v20];

    [v18 setLineBreakMode:4];
    [v18 setNumberOfLines:2];
    [(CKTUConversationBalloonView *)v4 addSubview:v18];
    [(CKTUConversationBalloonView *)v4 setSubtitleLabel1:v18];
    v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42B38]), "initWithFrame:", v6, v7, v8, v9);
    v22 = +[CKUIBehavior sharedBehaviors];
    v23 = [v22 tuConversationBalloonSubtitleFont];
    [v21 setFont:v23];

    [v21 setLineBreakMode:4];
    [v21 setNumberOfLines:2];
    [(CKTUConversationBalloonView *)v4 addSubview:v21];
    [(CKTUConversationBalloonView *)v4 setSubtitleLabel2:v21];
    v24 = [MEMORY[0x1E4F427E0] buttonWithType:0];
    [v24 addTarget:v4 action:sel__joinButtonTapped_ forControlEvents:64];
    if (CKIsRunningInMacCatalyst())
    {
      v25 = (void *)[objc_alloc(MEMORY[0x1E4F42A70]) initWithTarget:v4 action:sel_didHoverOverCell_];
      [v24 addGestureRecognizer:v25];
    }
    [(CKTUConversationBalloonView *)v4 addSubview:v24];
    [(CKTUConversationBalloonView *)v4 setJoinButton:v24];
    v26 = [(CKBalloonView *)v4 tapGestureRecognizer];
    [(CKTUConversationBalloonView *)v4 removeGestureRecognizer:v26];

    v27 = [(CKBalloonView *)v4 doubleTapGestureRecognizer];
    [(CKTUConversationBalloonView *)v4 removeGestureRecognizer:v27];

    v28 = [(CKBalloonView *)v4 longPressGestureRecognizer];
    [(CKTUConversationBalloonView *)v4 removeGestureRecognizer:v28];

    [(CKTUConversationBalloonView *)v4 setState:1];
    [(CKTUConversationBalloonView *)v4 configureForCurrentStateWithLayoutPass:0];
    v29 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v29 addObserver:v4 selector:sel__multiWayCallStateChanged_ name:*MEMORY[0x1E4F6B9C0] object:0];

    v30 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v30 addObserver:v4 selector:sel_contentSizeCategoryDidChange_ name:*MEMORY[0x1E4F43788] object:0];

    v31 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v31 addObserver:v4 selector:sel_chatParticipantsChanged_ name:*MEMORY[0x1E4F6B9C8] object:0];
  }
  return v4;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)CKTUConversationBalloonView;
  [(CKColoredBalloonView *)&v5 layoutSubviews];
  if (![(CKTUConversationBalloonView *)self animating])
  {
    [(CKTUConversationBalloonView *)self bounds];
    -[CKTUConversationBalloonView layoutSizeForSize:applyLayout:](self, "layoutSizeForSize:applyLayout:", 1, v3, v4);
  }
}

- (CGSize)layoutSizeForSize:(CGSize)a3 applyLayout:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.height;
  double width = a3.width;
  if ([(id)objc_opt_class() _shouldUseStackedLayout])
  {
    -[CKTUConversationBalloonView stackedLayoutSizeForSize:applyLayout:](self, "stackedLayoutSizeForSize:applyLayout:", v4, width, height);
  }
  else
  {
    -[CKTUConversationBalloonView standardLayoutSizeForSize:applyLayout:](self, "standardLayoutSizeForSize:applyLayout:", v4, width, height);
  }
  result.double height = v9;
  result.double width = v8;
  return result;
}

- (CGSize)_preferredSessionImageViewSize
{
  double v3 = [(CKTUConversationBalloonView *)self sessionImageView];
  char v4 = [v3 isHidden];

  double v5 = *MEMORY[0x1E4F1DB30];
  double v6 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if ((v4 & 1) == 0 && ([(id)objc_opt_class() _shouldAlwaysHideSessionImageView] & 1) == 0)
  {
    double v7 = (void *)MEMORY[0x1E4F6BCC0];
    double v8 = [(CKTUConversationBalloonView *)self tuConversation];
    LODWORD(v7) = [v7 activeTUConversationHasActivitySession:v8];

    if (v7)
    {
      double v9 = +[CKUIBehavior sharedBehaviors];
      [v9 tuConversationBalloonImageDimensions];
      double v5 = v10;
      v11 = +[CKUIBehavior sharedBehaviors];
      [v11 tuConversationBalloonImageDimensions];
      double v6 = v12;
    }
    else
    {
      double v9 = [(CKTUConversationBalloonView *)self sessionImageView];
      objc_msgSend(v9, "sizeThatFits:", *(double *)(MEMORY[0x1E4F1DB10] + 16), *(double *)(MEMORY[0x1E4F1DB10] + 24));
      double v5 = v13;
      double v6 = v14;
    }
  }
  double v15 = v5;
  double v16 = v6;
  result.double height = v16;
  result.double width = v15;
  return result;
}

- (CGSize)_preferredJoinButtonSize
{
  double v3 = [(CKTUConversationBalloonView *)self joinButton];
  int v4 = [v3 isHidden];

  if (v4)
  {
    double v5 = *MEMORY[0x1E4F1DB30];
    double v6 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  else
  {
    double v7 = [(CKTUConversationBalloonView *)self joinButton];
    objc_msgSend(v7, "sizeThatFits:", *(double *)(MEMORY[0x1E4F1DB10] + 16), *(double *)(MEMORY[0x1E4F1DB10] + 24));
    double v5 = v8;
    double v6 = v9;

    if (![(CKTUConversationBalloonView *)self shouldRenderJoinButtonAsIcon]
      || CKIsRunningInMacCatalyst())
    {
      double v10 = +[CKUIBehavior sharedBehaviors];
      [v10 tuConversationBalloonJoinButtonMinWidth];
      double v12 = v11;

      if (v5 < v12) {
        double v5 = v12;
      }
    }
  }
  double v13 = v5;
  double v14 = v6;
  result.double height = v14;
  result.double width = v13;
  return result;
}

- (CGSize)stackedLayoutSizeForSize:(CGSize)a3 applyLayout:(BOOL)a4
{
  BOOL v4 = a4;
  int v6 = [(CKTUConversationBalloonView *)self _shouldReverseLayoutDirection];
  double v7 = +[CKUIBehavior sharedBehaviors];
  [(CKTUConversationBalloonView *)self bounds];
  -[CKTUConversationBalloonView alignmentRectForFrame:](self, "alignmentRectForFrame:");
  CGFloat v106 = v9;
  CGFloat v107 = v8;
  double v11 = v10;
  [(CKTUConversationBalloonView *)self _preferredSessionImageViewSize];
  double v104 = v12;
  double v109 = v13;
  double v14 = (void *)MEMORY[0x1E4F427E0];
  double v15 = [(CKTUConversationBalloonView *)self _textJoinButtonConfiguration];
  double v16 = [v14 buttonWithConfiguration:v15 primaryAction:0];

  double v17 = *(double *)(MEMORY[0x1E4F1DB10] + 24);
  objc_msgSend(v16, "sizeThatFits:", *(double *)(MEMORY[0x1E4F1DB10] + 16), v17);
  [(CKTUConversationBalloonView *)self setShouldRenderJoinButtonAsIcon:v18 > v11];
  [(CKTUConversationBalloonView *)self configureJoinButton];
  [(CKTUConversationBalloonView *)self configureImageView];
  [(CKTUConversationBalloonView *)self _preferredJoinButtonSize];
  double v20 = v19;
  double v105 = v21;
  v22 = [(CKTUConversationBalloonView *)self titleLabel];
  objc_msgSend(v22, "sizeThatFits:", v11, v17);
  double v24 = v23;
  double v26 = v25;

  v27 = [(CKTUConversationBalloonView *)self subtitleLabel1];
  objc_msgSend(v27, "sizeThatFits:", v11, v17);
  double v29 = v28;
  double v31 = v30;

  v32 = [(CKTUConversationBalloonView *)self subtitleLabel2];
  objc_msgSend(v32, "sizeThatFits:", v11, v17);
  double v34 = v33;
  double v36 = v35;

  if (v24 >= v29) {
    double v37 = v24;
  }
  else {
    double v37 = v29;
  }
  if (v37 < v34) {
    double v37 = v34;
  }
  double v100 = v20;
  double v101 = v36;
  if (v37 >= v20) {
    double v38 = v37;
  }
  else {
    double v38 = v20;
  }
  double v102 = v31;
  double rect = v26;
  [v7 tuConversationBalloonContentTopPadding];
  double v40 = v39;
  v41 = [(CKTUConversationBalloonView *)self sessionImageView];
  char v42 = [v41 isHidden];

  if ((v42 & 1) == 0)
  {
    [v7 tuConversationBalloonContentBottomPadding];
    double v40 = v109 + v40 + v43;
  }
  [v7 tuConversationBalloonContentBottomPadding];
  double v45 = v26 + v31 + v36 + v40 + v44;
  v46 = [(CKTUConversationBalloonView *)self joinButton];
  char v47 = [v46 isHidden];

  if ((v47 & 1) == 0)
  {
    [v7 tuConversationBalloonContentBottomPadding];
    double v45 = v105 + v45 + v48;
  }
  if ([(id)objc_opt_class() _shouldAlwaysHideSessionImageView])
  {
    [v7 tuConversationBalloonContentBottomPadding];
    double v45 = v45 + v49;
  }
  if (v4)
  {
    v50 = [(CKTUConversationBalloonView *)self sessionImageView];
    if ([v50 isHidden])
    {
      v111.origin.double y = v106;
      v111.origin.x = v107;
      v111.size.double width = v11;
      v111.size.double height = v45;
      double MinY = CGRectGetMinY(v111);
    }
    else
    {
      [v7 tuConversationBalloonContentTopPadding];
      double v53 = v52;
      v112.origin.double y = v106;
      v112.origin.x = v107;
      v112.size.double width = v11;
      v112.size.double height = v45;
      double MinY = v53 + CGRectGetMinY(v112);
    }

    double v99 = v38;
    CGFloat v55 = v106;
    CGFloat v54 = v107;
    double v56 = v11;
    double v57 = v45;
    if (v6) {
      double MinX = CGRectGetMaxX(*(CGRect *)&v54) - v104;
    }
    else {
      double MinX = CGRectGetMinX(*(CGRect *)&v54);
    }
    v59 = [(CKTUConversationBalloonView *)self sessionAccessoryView];
    [v59 frame];
    double v61 = v60;
    double v96 = v62;

    v113.origin.x = MinX;
    v113.origin.double y = MinY;
    v113.size.double width = v104;
    v113.size.double height = v109;
    double v94 = CGRectGetMaxX(v113) - v61;
    v114.origin.x = MinX;
    v114.origin.double y = MinY;
    v114.size.double width = v104;
    v114.size.double height = v109;
    double v97 = v61;
    double v63 = CGRectGetMaxY(v114) - v61;
    v115.origin.x = MinX;
    v115.origin.double y = MinY;
    v115.size.double width = v104;
    v115.size.double height = v109;
    double MaxY = CGRectGetMaxY(v115);
    [v7 tuConversationBalloonContentBottomPadding];
    double v98 = MaxY + v65;
    if (v6)
    {
      v116.origin.double y = v106;
      v116.origin.x = v107;
      v116.size.double width = v11;
      v116.size.double height = v45;
      CGFloat v66 = v99;
      double v67 = CGRectGetMaxX(v116) - v99;
    }
    else
    {
      v117.origin.x = MinX;
      v117.origin.double y = MinY;
      v117.size.double width = v104;
      v117.size.double height = v109;
      double v67 = CGRectGetMinX(v117);
      CGFloat v66 = v99;
    }
    double v91 = v63 + 4.0;
    double v92 = v94 + 4.0;
    v118.origin.x = v67;
    v118.origin.double y = v98;
    v118.size.double width = v66;
    v118.size.double height = v26;
    double v68 = CGRectGetMaxY(v118);
    v119.origin.x = v67;
    v119.origin.double y = v68;
    v119.size.double width = v66;
    v119.size.double height = v102;
    v120.origin.double y = CGRectGetMaxY(v119);
    v120.origin.x = v67;
    double y = v120.origin.y;
    v120.size.double width = v66;
    v120.size.double height = v101;
    double v69 = CGRectGetMaxY(v120);
    [v7 tuConversationBalloonContentBottomPadding];
    double v95 = v69 + v70;
    if (v6)
    {
      v121.origin.double y = v106;
      v121.origin.x = v107;
      v121.size.double width = v11;
      v121.size.double height = v45;
      double v71 = v100;
      double v108 = CGRectGetMaxX(v121) - v100;
      double v72 = v104;
      double v73 = v109;
    }
    else
    {
      v122.origin.x = MinX;
      v122.origin.double y = MinY;
      double v72 = v104;
      v122.size.double width = v104;
      double v73 = v109;
      v122.size.double height = v109;
      double v108 = CGRectGetMinX(v122);
      double v71 = v100;
    }
    v74 = [(CKTUConversationBalloonView *)self sessionImageView];
    objc_msgSend(v74, "setFrame:", MinX, MinY, v72, v73);

    v75 = [(CKTUConversationBalloonView *)self sessionAccessoryView];
    objc_msgSend(v75, "setFrame:", v92, v91, v97, v96);

    v76 = [(CKTUConversationBalloonView *)self titleLabel];
    objc_msgSend(v76, "setFrame:", v67, v98, v99, rect);

    v77 = [(CKTUConversationBalloonView *)self subtitleLabel1];
    objc_msgSend(v77, "setFrame:", v67, v68, v99, v102);

    v78 = [(CKTUConversationBalloonView *)self subtitleLabel2];
    double v79 = v67;
    double v38 = v99;
    objc_msgSend(v78, "setFrame:", v79, y, v99, v101);

    v80 = [(CKTUConversationBalloonView *)self joinButton];
    objc_msgSend(v80, "setFrame:", v108, v95, v71, v105);
  }
  [(CKColoredBalloonView *)self alignmentRectInsets];
  double v82 = v38 + v81;
  [(CKColoredBalloonView *)self alignmentRectInsets];
  double v84 = v82 + v83;
  [(CKColoredBalloonView *)self alignmentRectInsets];
  double v86 = v45 + v85;
  [(CKColoredBalloonView *)self alignmentRectInsets];
  double v88 = v86 + v87;

  double v89 = v84;
  double v90 = v88;
  result.double height = v90;
  result.double width = v89;
  return result;
}

- (CGSize)standardLayoutSizeForSize:(CGSize)a3 applyLayout:(BOOL)a4
{
  BOOL v4 = a4;
  [(CKTUConversationBalloonView *)self configureJoinButton];
  int v6 = +[CKUIBehavior sharedBehaviors];
  [v6 tuConversationBalloonContentMinHeight];
  double v8 = v7;
  [(CKTUConversationBalloonView *)self bounds];
  -[CKTUConversationBalloonView alignmentRectForFrame:](self, "alignmentRectForFrame:");
  uint64_t rect = v9;
  double rect_24 = v10;
  double v12 = v11;
  int v13 = [(CKTUConversationBalloonView *)self _shouldReverseLayoutDirection];
  double v14 = *(double *)(MEMORY[0x1E4F1DB10] + 16);
  double v15 = *(double *)(MEMORY[0x1E4F1DB10] + 24);
  double v16 = [(CKTUConversationBalloonView *)self titleLabel];
  objc_msgSend(v16, "sizeThatFits:", v14, v15);
  double v18 = v17;

  double v19 = [(CKTUConversationBalloonView *)self subtitleLabel1];
  objc_msgSend(v19, "sizeThatFits:", v14, v15);
  double v21 = v20;

  v22 = [(CKTUConversationBalloonView *)self subtitleLabel2];
  objc_msgSend(v22, "sizeThatFits:", v14, v15);
  double v24 = v23;

  if (v18 >= v21) {
    double v25 = v18;
  }
  else {
    double v25 = v21;
  }
  if (v25 >= v24) {
    double v26 = v25;
  }
  else {
    double v26 = v24;
  }
  v27 = (void *)MEMORY[0x1E4F427E0];
  double v28 = [(CKTUConversationBalloonView *)self _textJoinButtonConfiguration];
  double v29 = [v27 buttonWithConfiguration:v28 primaryAction:0];

  objc_msgSend(v29, "sizeThatFits:", v14, v15);
  double v31 = v30;
  [v6 tuConversationBalloonJoinButtonMaxWidth];
  [(CKTUConversationBalloonView *)self setShouldRenderJoinButtonAsIcon:v31 > v32];
  [(CKTUConversationBalloonView *)self configureJoinButton];
  [(CKTUConversationBalloonView *)self configureImageView];
  [(CKTUConversationBalloonView *)self _preferredSessionImageViewSize];
  double v34 = v33;
  double rect_16 = v35;
  [(CKTUConversationBalloonView *)self _preferredJoinButtonSize];
  double v37 = v36;
  double rect_8 = v38;
  [v6 tuConversationBalloonLabelLeadingPadding];
  double v40 = v39;
  v41 = [(CKTUConversationBalloonView *)self sessionImageView];
  char v42 = [v41 isHidden];

  if (v42)
  {
    double v43 = 0.0;
  }
  else
  {
    double v43 = v34 + 0.0;
    [v6 tuConversationBalloonSessionImageTrailingPadding];
    double v40 = v44;
  }
  [v6 tuConversationBalloonLabelTrailingPadding];
  double v46 = v45 + v26 + v40 + v43;
  char v47 = [(CKTUConversationBalloonView *)self joinButton];
  char v48 = [v47 isHidden];

  if ((v48 & 1) == 0)
  {
    [v6 tuConversationBalloonJoinButtonLeadingPadding];
    double v46 = v37 + v46 + v49;
  }
  if (v46 >= v12) {
    double v50 = v12;
  }
  else {
    double v50 = v46;
  }
  v51 = [(CKTUConversationBalloonView *)self joinButton];
  char v52 = [v51 isHidden];

  if ((v52 & 1) == 0)
  {
    if ([(CKTUConversationBalloonView *)self shouldRenderJoinButtonAsIcon]) {
      [v6 tuConversationBalloonContentCompressedMinWidth];
    }
    else {
      [v6 tuConversationBalloonContentStandardMinWidth];
    }
    if (v50 < v53) {
      double v50 = v53;
    }
  }
  CGFloat v54 = [(CKTUConversationBalloonView *)self sessionImageView];
  int v55 = [v54 isHidden];

  double v136 = v40;
  if (v55) {
    double v56 = v50;
  }
  else {
    double v56 = v50 - v34 - v40;
  }
  [v6 tuConversationBalloonLabelTrailingPadding];
  double v58 = v56 - v57;
  v59 = [(CKTUConversationBalloonView *)self joinButton];
  char v60 = [v59 isHidden];

  double v139 = v37;
  if ((v60 & 1) == 0)
  {
    [v6 tuConversationBalloonJoinButtonLeadingPadding];
    double v58 = v58 - v61 - v37;
  }
  double v62 = [(CKTUConversationBalloonView *)self titleLabel];
  objc_msgSend(v62, "sizeThatFits:", v58, 1.79769313e308);
  double v64 = v63;

  double v65 = [(CKTUConversationBalloonView *)self subtitleLabel1];
  objc_msgSend(v65, "sizeThatFits:", v58, 1.79769313e308);
  double v67 = v66;

  double v68 = [(CKTUConversationBalloonView *)self subtitleLabel2];
  objc_msgSend(v68, "sizeThatFits:", v58, 1.79769313e308);
  double v70 = v69;

  double v134 = v67;
  double v135 = v70;
  double v140 = v64;
  double v71 = v64 + v67 + v70;
  if (v71 >= rect_16) {
    double v72 = v71;
  }
  else {
    double v72 = rect_16;
  }
  [v6 tuConversationBalloonContentTopPadding];
  double v74 = v73 + v72;
  [v6 tuConversationBalloonContentBottomPadding];
  double v76 = v75 + v74;
  if (v76 >= v8) {
    double v8 = v76;
  }
  if (v4)
  {
    double v138 = v34;
    double v132 = v50;
    double v77 = rect_24 + floor((v8 - rect_16) * 0.5);
    double v133 = v12;
    uint64_t v78 = rect;
    double v79 = rect_24;
    double v80 = v12;
    double v81 = v8;
    if (v13) {
      double MinX = CGRectGetMaxX(*(CGRect *)&v78) - v34;
    }
    else {
      double MinX = CGRectGetMinX(*(CGRect *)&v78);
    }
    double v83 = v8;
    double v84 = [(CKTUConversationBalloonView *)self sessionAccessoryView];
    [v84 frame];
    double v86 = v85;
    double v129 = v87;

    v148.origin.x = MinX;
    v148.origin.double y = v77;
    v148.size.double width = v34;
    double v88 = rect_16;
    v148.size.double height = rect_16;
    double v126 = CGRectGetMaxX(v148) - v86;
    v149.origin.x = MinX;
    v149.origin.double y = v77;
    v149.size.double width = v34;
    v149.size.double height = rect_16;
    CGFloat MaxY = CGRectGetMaxY(v149);
    double v90 = v77;
    double v130 = v86;
    double v91 = MaxY - v86;
    double v92 = rect_24 + floor((v83 - v71) * 0.5);
    double v8 = v83;
    double v131 = v90;
    double v128 = MinX;
    double v93 = MinX;
    double v94 = v34;
    double v95 = rect_16;
    if (v13) {
      double v96 = CGRectGetMinX(*(CGRect *)&v93) - v136 - v58;
    }
    else {
      double v96 = v136 + CGRectGetMaxX(*(CGRect *)&v93);
    }
    double v125 = v126 + 4.0;
    v150.origin.x = v96;
    double rect_16a = v92;
    v150.origin.double y = v92;
    v150.size.double width = v58;
    v150.size.double height = v140;
    double v97 = CGRectGetMaxY(v150);
    [v6 tuConversationBalloonInteritemSpacing];
    double v99 = v97 + v98;
    v151.origin.x = v96;
    v151.origin.double y = v99;
    v151.size.double width = v58;
    v151.size.double height = v134;
    double v100 = CGRectGetMaxY(v151);
    [v6 tuConversationBalloonInteritemSpacing];
    double v127 = v100 + v101;
    double v102 = rect_24;
    double v137 = rect_24 + floor((v8 - rect_8) * 0.5);
    uint64_t v103 = rect;
    double v104 = v133;
    double v105 = v8;
    if (v13)
    {
      double rect_24a = CGRectGetMinX(*(CGRect *)&v103);
      double v106 = v139;
    }
    else
    {
      double v106 = v139;
      CGFloat v107 = CGRectGetMaxX(*(CGRect *)&v103) - v139;
      [v6 tuConversationBalloonJoinButtonTrailingPadding];
      double rect_24a = v107 - v108;
    }
    double v109 = [(CKTUConversationBalloonView *)self sessionImageView];
    objc_msgSend(v109, "setFrame:", v128, v131, v138, v88);

    v110 = [(CKTUConversationBalloonView *)self sessionAccessoryView];
    objc_msgSend(v110, "setFrame:", v125, v91 + 4.0, v130, v129);

    CGRect v111 = [(CKTUConversationBalloonView *)self titleLabel];
    objc_msgSend(v111, "setFrame:", v96, rect_16a, v58, v140);

    CGRect v112 = [(CKTUConversationBalloonView *)self subtitleLabel1];
    objc_msgSend(v112, "setFrame:", v96, v99, v58, v134);

    CGRect v113 = [(CKTUConversationBalloonView *)self subtitleLabel2];
    objc_msgSend(v113, "setFrame:", v96, v127, v58, v135);

    CGRect v114 = [(CKTUConversationBalloonView *)self joinButton];
    objc_msgSend(v114, "setFrame:", rect_24a, v137, v106, rect_8);

    double v50 = v132;
  }
  [(CKColoredBalloonView *)self alignmentRectInsets];
  double v116 = v50 + v115;
  [(CKColoredBalloonView *)self alignmentRectInsets];
  double v118 = v116 + v117;
  [(CKColoredBalloonView *)self alignmentRectInsets];
  double v120 = v8 + v119;
  [(CKColoredBalloonView *)self alignmentRectInsets];
  double v122 = v120 + v121;

  double v123 = v118;
  double v124 = v122;
  result.double height = v124;
  result.double width = v123;
  return result;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)CKTUConversationBalloonView;
  [(CKColoredBalloonView *)&v3 prepareForReuse];
  [(CKTUConversationBalloonView *)self setAnimating:0];
}

- (void)prepareForDisplay
{
  v3.receiver = self;
  v3.super_class = (Class)CKTUConversationBalloonView;
  [(CKColoredBalloonView *)&v3 prepareForDisplay];
  [(CKTUConversationBalloonView *)self configureForCurrentStateWithLayoutPass:0];
}

- (CGSize)sizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  double height = a3.height;
  double width = a3.width;
  [(CKTUConversationBalloonView *)self configureForCurrentStateWithLayoutPass:0];

  -[CKTUConversationBalloonView layoutSizeForSize:applyLayout:](self, "layoutSizeForSize:applyLayout:", 0, width, height);
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (char)color
{
  if ([(CKTUConversationBalloonView *)self conversationAVMode]) {
    return 7;
  }
  else {
    return -1;
  }
}

- (void)setOrientation:(char)a3
{
  self->_orientation = a3;
}

- (void)setTuConversationUUID:(id)a3
{
}

- (unint64_t)conversationAVMode
{
  objc_super v3 = [(CKTUConversationBalloonView *)self tuConversation];
  BOOL v4 = v3;
  if (v3) {
    uint64_t conversationAVMode = [v3 avMode];
  }
  else {
    uint64_t conversationAVMode = self->_conversationAVMode;
  }

  return conversationAVMode;
}

- (BOOL)wantsGradient
{
  return 0;
}

- (id)tuConversation
{
  objc_super v3 = [MEMORY[0x1E4F6BC40] sharedRegistry];
  BOOL v4 = [(CKTUConversationBalloonView *)self tuConversationUUID];
  double v5 = [v3 existingConversationForTelephonyConversationUUID:v4];

  return v5;
}

- (void)configureForCurrentState
{
}

- (void)configureForCurrentStateWithLayoutPass:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(CKTUConversationBalloonView *)self tuConversation];
  [(CKTUConversationBalloonView *)self setState:+[CKTUConversationViewUtilities ckTUConversationStateForTUConversation:v5]];

  [(CKTUConversationBalloonView *)self configureImageView];
  [(CKTUConversationBalloonView *)self configureSessionAccessoryView];
  [(CKTUConversationBalloonView *)self configureTitle];
  [(CKTUConversationBalloonView *)self configureSubtitle1];
  [(CKTUConversationBalloonView *)self configureSubtitle2];
  [(CKTUConversationBalloonView *)self configureJoinButton];
  if (v3)
  {
    [(CKTUConversationBalloonView *)self setNeedsLayout];
    [(CKTUConversationBalloonView *)self layoutIfNeeded];
  }
}

- (BOOL)_shouldShowSessionView
{
  if ([(id)objc_opt_class() _shouldAlwaysHideSessionImageView]) {
    return 0;
  }
  if (![(CKTUConversationBalloonView *)self _shouldShowJoinButton]
    || ![(CKTUConversationBalloonView *)self shouldRenderJoinButtonAsIcon])
  {
    return 1;
  }
  BOOL v4 = (void *)MEMORY[0x1E4F6BCC0];
  double v5 = [(CKTUConversationBalloonView *)self tuConversation];
  LOBYTE(v4) = [v4 activeTUConversationHasActivitySession:v5];

  return (char)v4;
}

- (void)configureImageView
{
  BOOL v3 = [(CKTUConversationBalloonView *)self _shouldShowSessionView];
  BOOL v4 = [(CKTUConversationBalloonView *)self sessionImageView];
  id v7 = v4;
  if (v3)
  {
    [v4 setHidden:0];

    double v5 = (void *)MEMORY[0x1E4F6BCC0];
    int v6 = [(CKTUConversationBalloonView *)self tuConversation];
    LODWORD(v5) = [v5 activeTUConversationHasActivitySession:v6];

    if (v5)
    {
      [(CKTUConversationBalloonView *)self formatImageViewForActivity];
    }
    else
    {
      [(CKTUConversationBalloonView *)self formatImageViewForFaceTime];
    }
  }
  else
  {
    [v4 setHidden:1];
  }
}

- (void)configureIconView
{
  unint64_t state = self->_state;
  BOOL v3 = state >= 3;
  unint64_t v4 = state - 3;
  if (v3)
  {
    if (v4 < 2) {
      [(CKTUConversationBalloonView *)self formatIconViewForActivity];
    }
  }
  else
  {
    [(CKTUConversationBalloonView *)self formatIconViewForFaceTime];
  }
}

- (void)configureSessionAccessoryView
{
  BOOL v3 = [(CKTUConversationBalloonView *)self sessionAccessoryView];
  [v3 removeFromSuperview];

  unint64_t v4 = (void *)MEMORY[0x1E4F6BCC0];
  double v5 = [(CKTUConversationBalloonView *)self tuConversation];
  LODWORD(v4) = [v4 isScreenShareActivityForTUConversation:v5];

  if (v4)
  {
    uint64_t v6 = [(CKTUConversationBalloonView *)self avatarView];
  }
  else
  {
    id v7 = (void *)MEMORY[0x1E4F6BCC0];
    double v8 = [(CKTUConversationBalloonView *)self tuConversation];
    LODWORD(v7) = [v7 activeTUConversationHasActivitySession:v8];

    if (!v7) {
      return;
    }
    [(CKTUConversationBalloonView *)self configureIconView];
    uint64_t v6 = [(CKTUConversationBalloonView *)self iconView];
  }
  uint64_t v9 = (void *)v6;
  [(CKTUConversationBalloonView *)self setSessionAccessoryView:v6];

  id v10 = [(CKTUConversationBalloonView *)self sessionAccessoryView];
  [(CKTUConversationBalloonView *)self addSubview:v10];
}

- (void)configureTitle
{
  unint64_t v3 = [(CKTUConversationBalloonView *)self conversationAVMode];
  unint64_t v4 = +[CKUIBehavior sharedBehaviors];
  double v5 = [v4 theme];
  uint64_t v6 = v5;
  if (v3) {
    [v5 multiwayTitleTextColor];
  }
  else {
  id v18 = [v5 sharePlayTitleTextColor];
  }

  id v7 = [(CKTUConversationBalloonView *)self titleLabel];
  [v7 setTextColor:v18];

  unint64_t state = self->_state;
  if (state - 1 < 2)
  {
    double v12 = [(CKTUConversationBalloonView *)self titleLabel];
    double v14 = [(CKTUConversationBalloonView *)self tuConversation];
    uint64_t v16 = +[CKTUConversationViewUtilities activityTitleForTUConversation:v14];
LABEL_11:
    double v17 = (void *)v16;
    [v12 setText:v16];

    goto LABEL_14;
  }
  if (state - 3 < 2)
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F6BCC0];
    id v10 = [(CKTUConversationBalloonView *)self tuConversation];
    int v11 = [v9 isScreenShareActivityForTUConversation:v10];

    double v12 = [(CKTUConversationBalloonView *)self titleLabel];
    int v13 = CKFrameworkBundle();
    double v14 = v13;
    if (v11) {
      double v15 = @"EXPANSE_SCREENSHARE_DEFAULT";
    }
    else {
      double v15 = @"EXPANSE_DEFAULT";
    }
    uint64_t v16 = [v13 localizedStringForKey:v15 value:&stru_1EDE4CA38 table:@"ChatKit"];
    goto LABEL_11;
  }
  if (state) {
    goto LABEL_15;
  }
  double v12 = [(CKTUConversationBalloonView *)self titleLabel];
  double v14 = +[CKTUConversationViewUtilities titleForAVMode:[(CKTUConversationBalloonView *)self conversationAVMode]];
  [v12 setText:v14];
LABEL_14:

LABEL_15:
}

- (id)subtitleColor
{
  unint64_t v2 = [(CKTUConversationBalloonView *)self conversationAVMode];
  unint64_t v3 = +[CKUIBehavior sharedBehaviors];
  unint64_t v4 = [v3 theme];
  double v5 = v4;
  if (v2) {
    [v4 multiwayCaptionTextColor];
  }
  else {
  uint64_t v6 = [v4 sharePlayCaptionTextColor];
  }

  return v6;
}

- (void)configureSubtitle1
{
  unint64_t v3 = [(CKTUConversationBalloonView *)self subtitleColor];
  unint64_t v4 = [(CKTUConversationBalloonView *)self subtitleLabel1];
  [v4 setTextColor:v3];

  unint64_t state = self->_state;
  if (state - 1 < 2)
  {
    id v16 = [(CKTUConversationBalloonView *)self subtitleLabel1];
    double v8 = [(CKTUConversationBalloonView *)self tuConversation];
    uint64_t v10 = +[CKTUConversationViewUtilities joinStateStatusStringForTUConversation:v8];
  }
  else
  {
    if (state - 3 < 2)
    {
      uint64_t v6 = [(CKTUConversationBalloonView *)self tuConversation];
      id v16 = +[CKTUConversationViewUtilities activityTitleForTUConversation:v6];

      id v7 = [(CKTUConversationBalloonView *)self tuConversation];
      double v8 = +[CKTUConversationViewUtilities activityTextForTUConversation:v7];

      uint64_t v9 = [(CKTUConversationBalloonView *)self subtitleLabel1];
      if (v8) {
        [NSString stringWithFormat:@"%@ ⋅ %@", v16, v8];
      }
      else {
      double v14 = [NSString stringWithFormat:@"%@", v16, v15];
      }
      [v9 setText:v14];

      goto LABEL_15;
    }
    if (state) {
      return;
    }
    unint64_t v11 = [(CKTUConversationBalloonView *)self conversationAVMode];
    id v16 = [(CKTUConversationBalloonView *)self subtitleLabel1];
    double v12 = CKFrameworkBundle();
    double v8 = v12;
    if (v11) {
      int v13 = @"CALL_ENDED";
    }
    else {
      int v13 = @"ENDED";
    }
    uint64_t v10 = [v12 localizedStringForKey:v13 value:&stru_1EDE4CA38 table:@"ChatKit"];
  }
  uint64_t v9 = (void *)v10;
  [v16 setText:v10];
LABEL_15:
}

- (void)configureSubtitle2
{
  unint64_t v3 = [(CKTUConversationBalloonView *)self subtitleColor];
  unint64_t v4 = [(CKTUConversationBalloonView *)self subtitleLabel2];
  [v4 setTextColor:v3];

  unint64_t state = self->_state;
  BOOL v6 = state >= 3;
  unint64_t v7 = state - 3;
  if (v6)
  {
    if (v7 >= 2) {
      return;
    }
    uint64_t v9 = [(CKTUConversationBalloonView *)self subtitleLabel2];
    [v9 setHidden:0];

    id v12 = [(CKTUConversationBalloonView *)self subtitleLabel2];
    uint64_t v10 = [(CKTUConversationBalloonView *)self tuConversation];
    unint64_t v11 = +[CKTUConversationViewUtilities joinStateStatusStringForTUConversation:v10];
    [v12 setText:v11];
  }
  else
  {
    double v8 = [(CKTUConversationBalloonView *)self subtitleLabel2];
    [v8 setHidden:1];

    id v12 = [(CKTUConversationBalloonView *)self subtitleLabel2];
    [v12 setText:0];
  }
}

- (void)configureJoinButton
{
  unint64_t state = self->_state;
  if (state <= 4)
  {
    if (((1 << state) & 0x15) != 0)
    {
      id v9 = [(CKTUConversationBalloonView *)self joinButton];
      [v9 setHidden:1];
    }
    else
    {
      unint64_t v4 = [(CKTUConversationBalloonView *)self joinButton];
      [v4 setHidden:0];

      double v5 = [(CKTUConversationBalloonView *)self joinButton];
      BOOL v6 = CKFrameworkBundle();
      unint64_t v7 = [v6 localizedStringForKey:@"JOIN" value:&stru_1EDE4CA38 table:@"ChatKit"];
      [v5 setAccessibilityLabel:v7];

      if ([(CKTUConversationBalloonView *)self shouldRenderJoinButtonAsIcon]) {
        [(CKTUConversationBalloonView *)self _iconJoinButtonConfiguration];
      }
      else {
      id v9 = [(CKTUConversationBalloonView *)self _textJoinButtonConfiguration];
      }
      double v8 = [(CKTUConversationBalloonView *)self joinButton];
      [v8 setConfiguration:v9];
    }
  }
}

- (BOOL)_shouldShowJoinButton
{
  return ((self->_state - 1) & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

- (id)_textJoinButtonConfiguration
{
  int v3 = CKIsRunningInMacCatalyst();
  unint64_t v4 = [MEMORY[0x1E4F427E8] filledButtonConfiguration];
  double v5 = v4;
  if (v3)
  {
    [v4 setMacIdiomStyle:1];
  }
  else
  {
    [v4 setButtonSize:1];
    [v5 setCornerStyle:4];
  }
  int v6 = [(id)objc_opt_class() _shouldUseStackedLayout];
  unint64_t v7 = +[CKUIBehavior sharedBehaviors];
  double v8 = v7;
  if (v6) {
    [v7 tuConversationBalloonContentStackedLayoutJoinButtonInsets];
  }
  else {
    [v7 tuConversationBalloonContentStandardLayoutJoinButtonInsets];
  }
  objc_msgSend(v5, "setContentInsets:");

  id v9 = [(CKTUConversationBalloonView *)self _joinButtonText];
  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v9];
  uint64_t v11 = *MEMORY[0x1E4FB06F8];
  id v12 = +[CKUIBehavior sharedBehaviors];
  int v13 = [v12 tuConversationBalloonActionButtonFont];
  objc_msgSend(v10, "addAttribute:value:range:", v11, v13, 0, objc_msgSend(v9, "length"));

  [v5 setAttributedTitle:v10];
  double v14 = +[CKUIBehavior sharedBehaviors];
  uint64_t v15 = [v14 theme];
  id v16 = [v15 multiwayButtonColor];
  [v5 setBaseBackgroundColor:v16];

  return v5;
}

- (id)_iconJoinButtonConfiguration
{
  int v3 = (void *)MEMORY[0x1E4F6BCC0];
  unint64_t v4 = [(CKTUConversationBalloonView *)self tuConversation];
  int v5 = [v3 conversationIsVideoCall:v4];

  int v6 = (void *)MEMORY[0x1E4F6BCC0];
  unint64_t v7 = [(CKTUConversationBalloonView *)self tuConversation];
  int v8 = [v6 conversationIsAVLessSharePlay:v7];

  uint64_t v9 = *MEMORY[0x1E4F438B8];
  if (CKIsRunningInMacCatalyst())
  {
    uint64_t v10 = [MEMORY[0x1E4F427E8] filledButtonConfiguration];
    [v10 setMacIdiomStyle:1];
    uint64_t v11 = +[CKUIBehavior sharedBehaviors];
    id v12 = [v11 theme];
    int v13 = [v12 multiwayButtonColor];
    [v10 setBaseBackgroundColor:v13];

    double v14 = @"phone.fill";
    if (v5) {
      double v14 = @"video.fill";
    }
    if (v8) {
      double v14 = @"shareplay";
    }
    uint64_t v15 = v14;
    id v16 = (void *)MEMORY[0x1E4F42A80];
    double v17 = [MEMORY[0x1E4F42A98] configurationWithTextStyle:v9 scale:2];
    id v18 = [v16 systemImageNamed:v15 withConfiguration:v17];

    double v19 = [v18 imageWithRenderingMode:2];

    double v20 = [MEMORY[0x1E4F428B8] whiteColor];
    uint64_t v21 = [v19 imageWithTintColor:v20];

    goto LABEL_11;
  }
  uint64_t v10 = [MEMORY[0x1E4F427E8] plainButtonConfiguration];
  v22 = @"phone.circle.fill";
  if (v5) {
    v22 = @"video.circle.fill";
  }
  double v23 = (void *)MEMORY[0x1E4F42A80];
  double v24 = (void *)MEMORY[0x1E4F42A98];
  double v25 = v22;
  double v26 = [v24 configurationWithTextStyle:v9 scale:2];
  v27 = [v23 systemImageNamed:v25 withConfiguration:v26];

  double v20 = [v27 imageWithRenderingMode:1];

  if (v8)
  {
    [v20 size];
    uint64_t v21 = [(CKTUConversationBalloonView *)self _sharePlayImageWithDiameter:v28];
LABEL_11:

    double v20 = (void *)v21;
  }
  [v10 setImage:v20];
  objc_msgSend(v10, "setContentInsets:", *MEMORY[0x1E4F424F0], *(double *)(MEMORY[0x1E4F424F0] + 8), *(double *)(MEMORY[0x1E4F424F0] + 16), *(double *)(MEMORY[0x1E4F424F0] + 24));

  return v10;
}

- (id)_sharePlayImageWithDiameter:(double)a3
{
  unint64_t v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42A58]), "initWithSize:", a3, a3);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__CKTUConversationBalloonView__sharePlayImageWithDiameter___block_invoke;
  v7[3] = &__block_descriptor_40_e40_v16__0__UIGraphicsImageRendererContext_8l;
  *(double *)&v7[4] = a3;
  int v5 = [v4 imageWithActions:v7];

  return v5;
}

void __59__CKTUConversationBalloonView__sharePlayImageWithDiameter___block_invoke(uint64_t a1, void *a2)
{
  int v3 = (void *)MEMORY[0x1E4F428B8];
  id v4 = a2;
  int v5 = [v3 systemGreenColor];
  [v5 setFill];

  int v6 = (CGContext *)[v4 CGContext];
  v14.size.double width = *(CGFloat *)(a1 + 32);
  v14.origin.x = 0.0;
  v14.origin.double y = 0.0;
  v14.size.double height = v14.size.width;
  CGContextFillEllipseInRect(v6, v14);
  unint64_t v7 = [MEMORY[0x1E4F42A80] systemImageNamed:@"shareplay"];
  int v8 = [MEMORY[0x1E4F428B8] whiteColor];
  id v12 = [v7 imageWithTintColor:v8];

  [v12 size];
  double v10 = v9;
  [v12 size];
  objc_msgSend(v12, "drawInRect:", (*(double *)(a1 + 32) - v10 / v11 * (*(double *)(a1 + 32) * 0.43)) * 0.5, (*(double *)(a1 + 32) - *(double *)(a1 + 32) * 0.43) * 0.5 + *(double *)(a1 + 32) * 0.43 * -0.16);
}

- (void)formatImageViewForFaceTime
{
  if ([(CKTUConversationBalloonView *)self conversationAVMode])
  {
    int v3 = [(CKTUConversationBalloonView *)self tuConversation];
    id v15 = +[CKTUConversationViewUtilities faceTimeIconForTUConversation:v3];

    [MEMORY[0x1E4F428B8] systemWhiteColor];
  }
  else
  {
    id v15 = +[CKTUConversationViewUtilities sharePlayIcon];
    [MEMORY[0x1E4F428B8] labelColor];
  id v4 = };
  int v5 = [(CKTUConversationBalloonView *)self sessionImageView];
  [v5 setImage:v15];

  int v6 = [(CKTUConversationBalloonView *)self sessionImageView];
  [v15 size];
  double v8 = v7;
  [v15 size];
  objc_msgSend(v6, "setBounds:", 0.0, 0.0, v8, v9);

  double v10 = [(CKTUConversationBalloonView *)self sessionImageView];
  [v10 setBackgroundColor:0];

  double v11 = [(CKTUConversationBalloonView *)self sessionImageView];
  [v11 setTintColor:v4];

  id v12 = [(CKTUConversationBalloonView *)self sessionImageView];
  [v12 _setCornerRadius:0.0];

  int v13 = [(CKTUConversationBalloonView *)self sessionImageView];
  [v13 setClipsToBounds:1];

  CGRect v14 = [(CKTUConversationBalloonView *)self sessionImageView];
  [v14 setContentMode:4];
}

- (void)formatImageViewForActivity
{
  if ([(CKTUConversationBalloonView *)self isUnknownSender])
  {
    id v22 = [(CKTUConversationBalloonView *)self sessionImageView];
    [v22 setHidden:1];
  }
  else
  {
    int v3 = [(CKTUConversationBalloonView *)self tuConversation];
    id v22 = +[CKTUConversationViewUtilities activityImageForTUConversation:v3];

    if (!v22)
    {
      id v4 = [(CKTUConversationBalloonView *)self tuConversation];
      int v5 = +[CKUIBehavior sharedBehaviors];
      [v5 tuConversationBalloonImageDimensions];
      +[CKTUConversationViewUtilities activityIconForTUConversation:iconSize:](CKTUConversationViewUtilities, "activityIconForTUConversation:iconSize:", v4);
      id v22 = (id)objc_claimAutoreleasedReturnValue();
    }
    int v6 = [(CKTUConversationBalloonView *)self sessionImageView];
    [v6 setImage:v22];

    double v7 = (void *)MEMORY[0x1E4F6BCC0];
    double v8 = [(CKTUConversationBalloonView *)self tuConversation];
    int v9 = [v7 isScreenShareActivityForTUConversation:v8];

    double v10 = [(CKTUConversationBalloonView *)self sessionImageView];
    double v11 = v10;
    if (v9)
    {
      id v12 = [MEMORY[0x1E4F428B8] systemDarkGrayColor];
      [v11 setBackgroundColor:v12];

      double v10 = [(CKTUConversationBalloonView *)self sessionImageView];
      double v11 = v10;
      uint64_t v13 = 4;
    }
    else
    {
      uint64_t v13 = 2;
    }
    [v10 setContentMode:v13];

    [(CKTUConversationBalloonView *)self imageViewSize];
    double v15 = v14;
    double v17 = v16;
    id v18 = [(CKTUConversationBalloonView *)self sessionImageView];
    objc_msgSend(v18, "setBounds:", 0.0, 0.0, v15, v17);

    double v19 = [(CKTUConversationBalloonView *)self sessionImageView];
    [v19 _setCornerRadius:5.0];

    double v20 = [(CKTUConversationBalloonView *)self sessionImageView];
    [v20 setClipsToBounds:1];

    uint64_t v21 = [(CKTUConversationBalloonView *)self sessionImageView];
    [v21 setHidden:0];
  }
}

- (id)_currentCall
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  unint64_t v2 = [MEMORY[0x1E4FADA90] sharedInstance];
  int v3 = [v2 currentAudioAndVideoCalls];

  id obj = v3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    int v6 = 0;
    uint64_t v7 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(obj);
        }
        int v9 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        double v10 = [MEMORY[0x1E4FADA90] sharedInstance];
        double v11 = [v10 activeConversationForCall:v9];

        id v12 = [v11 UUID];
        uint64_t v13 = [(CKTUConversationBalloonView *)self tuConversation];
        double v14 = [v13 UUID];
        int v15 = [v12 isEqual:v14];

        if (v15)
        {
          id v16 = v9;

          int v6 = v16;
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v5);
  }
  else
  {
    int v6 = 0;
  }

  return v6;
}

- (void)_joinButtonTapped:(id)a3
{
  uint64_t v4 = [(CKBalloonView *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CKBalloonView *)self delegate];
    [v6 tuConversationBalloonJoinButtonTapped:self];
  }
}

- (id)_joinButtonText
{
  int v3 = CKFrameworkBundle();
  uint64_t v4 = [v3 localizedStringForKey:@"JOIN" value:&stru_1EDE4CA38 table:@"ChatKit"];

  if (CKIsRunningUnitTests())
  {
    char v5 = [(CKTUConversationBalloonView *)self joinButtonText_TestingOverride];

    if (v5)
    {
      uint64_t v6 = [(CKTUConversationBalloonView *)self joinButtonText_TestingOverride];

      uint64_t v4 = (void *)v6;
    }
  }

  return v4;
}

- (BOOL)joinButtonIsShowingImageContent
{
  unint64_t v2 = [(CKTUConversationBalloonView *)self joinButton];
  int v3 = [v2 imageForState:0];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)joinButtonIsShowingTextContent
{
  unint64_t v2 = [(CKTUConversationBalloonView *)self joinButton];
  int v3 = [v2 titleForState:0];

  return v3 != 0;
}

- (CGSize)imageViewSize
{
  unint64_t v2 = +[CKUIBehavior sharedBehaviors];
  [v2 tuConversationBalloonImageDimensions];
  double v4 = v3;

  char v5 = +[CKUIBehavior sharedBehaviors];
  int v6 = [v5 isAccessibilityPreferredContentSizeCategory];

  if (v6)
  {
    uint64_t v7 = [MEMORY[0x1E4F42A40] metricsForTextStyle:*MEMORY[0x1E4F43890]];
    [v7 scaledValueForValue:v4];
    double v4 = v8;
  }
  double v9 = v4;
  double v10 = v4;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (CGSize)joinButtonRenderedAsIconSize
{
  unint64_t v2 = +[CKUIBehavior sharedBehaviors];
  [v2 tuConversationBalloonButtonAsIconSize];
  double v4 = v3;

  char v5 = [MEMORY[0x1E4F42A40] metricsForTextStyle:*MEMORY[0x1E4F438B8]];
  [v5 scaledValueForValue:v4];
  double v7 = v6;

  double v8 = v7;
  double v9 = v7;
  result.double height = v9;
  result.double width = v8;
  return result;
}

+ (CGSize)appIconSize
{
  unint64_t v2 = +[CKUIBehavior sharedBehaviors];
  [v2 tuConversationBalloonIconDimensions];
  double v4 = v3;

  char v5 = +[CKUIBehavior sharedBehaviors];
  int v6 = [v5 isAccessibilityPreferredContentSizeCategory];

  if (v6)
  {
    double v7 = [MEMORY[0x1E4F42A40] metricsForTextStyle:*MEMORY[0x1E4F43890]];
    [v7 scaledValueForValue:v4];
    double v4 = v8;
  }
  double v9 = v4;
  double v10 = v4;
  result.double height = v10;
  result.double width = v9;
  return result;
}

- (void)formatIconViewForFaceTime
{
  double v3 = [(CKTUConversationBalloonView *)self iconView];
  [v3 setHidden:1];

  id v4 = [(CKTUConversationBalloonView *)self avatarView];
  [v4 setHidden:1];
}

- (void)formatIconViewForActivity
{
  if (([(id)objc_opt_class() _shouldUseStackedLayout] & 1) != 0
    || ([(CKTUConversationBalloonView *)self tuConversation],
        double v3 = objc_claimAutoreleasedReturnValue(),
        BOOL v4 = +[CKTUConversationViewUtilities activityHasImageForTUConversation:v3], v3, !v4))
  {
    id v17 = [(CKTUConversationBalloonView *)self iconView];
    [v17 setHidden:1];
    goto LABEL_13;
  }
  id v17 = [(CKTUConversationBalloonView *)self tuConversation];
  if (!objc_msgSend(MEMORY[0x1E4F6BCC0], "isScreenShareActivityForTUConversation:"))
  {
    if (![(CKTUConversationBalloonView *)self isUnknownSender])
    {
      double v7 = +[CKUIBehavior sharedBehaviors];
      [v7 tuConversationBalloonIconDimensions];
      int v6 = +[CKTUConversationViewUtilities activityIconForTUConversation:iconSize:](CKTUConversationViewUtilities, "activityIconForTUConversation:iconSize:", v17);

      if (v6)
      {
        double v8 = +[CKUIBehavior sharedBehaviors];
        [v8 tuConversationBalloonIconDimensions];
        double v10 = v9;

        double v11 = [(CKTUConversationBalloonView *)self iconView];
        objc_msgSend(v11, "setHidden:", objc_msgSend(MEMORY[0x1E4F6BCC0], "isScreenShareActivityForTUConversation:", v17));

        id v12 = [(CKTUConversationBalloonView *)self iconView];
        [v12 setContentMode:1];

        uint64_t v13 = [(CKTUConversationBalloonView *)self iconView];
        [v13 setImage:v6];

        double v14 = [(CKTUConversationBalloonView *)self iconView];
        objc_msgSend(v14, "setBounds:", 0.0, 0.0, v10, v10);

        int v15 = [(CKTUConversationBalloonView *)self iconView];
        [v15 setBackgroundColor:0];
      }
      else
      {
        int v15 = [(CKTUConversationBalloonView *)self iconView];
        [v15 setHidden:1];
      }

      id v16 = [(CKTUConversationBalloonView *)self avatarView];
      [v16 setHidden:1];

      goto LABEL_12;
    }
    char v5 = [(CKTUConversationBalloonView *)self iconView];
    [v5 setHidden:1];
  }
  int v6 = [(CKTUConversationBalloonView *)self avatarView];
  [v6 setHidden:1];
LABEL_12:

LABEL_13:
}

- (void)_multiWayCallStateChanged:(id)a3
{
  BOOL v4 = [a3 userInfo];
  id v11 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F6B9B8]];

  char v5 = [MEMORY[0x1E4F6BC40] sharedRegistry];
  int v6 = [v5 existingConversationForTelephonyConversationUUID:v11];

  double v7 = [v6 UUID];
  double v8 = [(CKTUConversationBalloonView *)self tuConversation];
  double v9 = [v8 UUID];
  int v10 = [v7 isEqual:v9];

  if (v10) {
    [(CKTUConversationBalloonView *)self configureForCurrentState];
  }
}

- (void)contentSizeCategoryDidChange:(id)a3
{
  [(CKTUConversationBalloonView *)self setNeedsLayout];

  [(CKTUConversationBalloonView *)self layoutIfNeeded];
}

- (char)orientation
{
  return self->_orientation;
}

- (void)setConversationAVMode:(unint64_t)a3
{
  self->_uint64_t conversationAVMode = a3;
}

- (NSUUID)tuConversationUUID
{
  return self->_tuConversationUUID;
}

- (BOOL)isUnknownSender
{
  return self->_unknownSender;
}

- (void)setUnknownSender:(BOOL)a3
{
  self->_unknownSender = a3;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_unint64_t state = a3;
}

- (UIImageView)sessionImageView
{
  return self->_sessionImageView;
}

- (void)setSessionImageView:(id)a3
{
}

- (UIView)sessionAccessoryView
{
  return self->_sessionAccessoryView;
}

- (void)setSessionAccessoryView:(id)a3
{
}

- (UIImageView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
}

- (CKAvatarView)avatarView
{
  return self->_avatarView;
}

- (void)setAvatarView:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)subtitleLabel1
{
  return self->_subtitleLabel1;
}

- (void)setSubtitleLabel1:(id)a3
{
}

- (UILabel)subtitleLabel2
{
  return self->_subtitleLabel2;
}

- (void)setSubtitleLabel2:(id)a3
{
}

- (UIButton)joinButton
{
  return self->_joinButton;
}

- (void)setJoinButton:(id)a3
{
}

- (BOOL)animating
{
  return self->_animating;
}

- (void)setAnimating:(BOOL)a3
{
  self->_animating = a3;
}

- (BOOL)shouldRenderJoinButtonAsIcon
{
  return self->_shouldRenderJoinButtonAsIcon;
}

- (void)setShouldRenderJoinButtonAsIcon:(BOOL)a3
{
  self->_shouldRenderJoinButtonAsIcon = a3;
}

- (NSString)joinButtonText_TestingOverride
{
  return self->_joinButtonText_TestingOverride;
}

- (void)setJoinButtonText_TestingOverride:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_joinButtonText_TestingOverride, 0);
  objc_storeStrong((id *)&self->_joinButton, 0);
  objc_storeStrong((id *)&self->_subtitleLabel2, 0);
  objc_storeStrong((id *)&self->_subtitleLabel1, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_avatarView, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_sessionAccessoryView, 0);
  objc_storeStrong((id *)&self->_sessionImageView, 0);

  objc_storeStrong((id *)&self->_tuConversationUUID, 0);
}

- (void)configureForTUConversationChatItem:(id)a3
{
  id v4 = a3;
  -[CKTUConversationBalloonView setOrientation:](self, "setOrientation:", [v4 balloonOrientation]);
  -[CKColoredBalloonView setHasTail:](self, "setHasTail:", [v4 hasTail]);
  [v4 textAlignmentInsets];
  -[CKBalloonView setTextAlignmentInsets:](self, "setTextAlignmentInsets:");
  -[CKBalloonView setBalloonCorners:](self, "setBalloonCorners:", [v4 balloonCorners]);
  [(CKBalloonView *)self setBalloonStyle:0];
  -[CKColoredBalloonView setColor:](self, "setColor:", [v4 color]);
  char v5 = [v4 tuConversationUUID];
  [(CKTUConversationBalloonView *)self setTuConversationUUID:v5];

  -[CKTUConversationBalloonView setUnknownSender:](self, "setUnknownSender:", [v4 isSenderUnknown]);
  uint64_t v6 = [v4 conversationAVMode];

  [(CKTUConversationBalloonView *)self setConversationAVMode:v6];
}

@end