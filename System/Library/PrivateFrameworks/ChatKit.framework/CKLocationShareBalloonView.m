@interface CKLocationShareBalloonView
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (CGSize)sizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4;
- (CKLocationShareBalloonView)initWithFrame:(CGRect)a3;
- (NSString)locationString;
- (NSString)titleString;
- (UIButton)ignoreButton;
- (UIButton)startSharingButton;
- (UIImageView)chevron;
- (UILabel)locationLabel;
- (UILabel)titleLabel;
- (UIView)horizontalSeparator;
- (UIView)verticalSeparator;
- (UIVisualEffectView)effectView;
- (int64_t)offerState;
- (void)_ignoreButtonHit:(id)a3;
- (void)addFilter:(id)a3;
- (void)clearFilters;
- (void)configureForLocationShareOfferChatItem:(id)a3;
- (void)layoutSubviews;
- (void)prepareForDisplay;
- (void)setChevron:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEffectView:(id)a3;
- (void)setHorizontalSeparator:(id)a3;
- (void)setIgnoreButton:(id)a3;
- (void)setLocationLabel:(id)a3;
- (void)setLocationString:(id)a3;
- (void)setOfferState:(int64_t)a3;
- (void)setStartSharingButton:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTitleString:(id)a3;
- (void)setVerticalSeparator:(id)a3;
@end

@implementation CKLocationShareBalloonView

- (CKLocationShareBalloonView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CKLocationShareBalloonView;
  v3 = -[CKImageBalloonView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(CKLocationShareBalloonView *)v3 setClipsToBounds:1];
    [(CKLocationShareBalloonView *)v4 setContentMode:5];
  }
  return v4;
}

- (void)layoutSubviews
{
  v89.receiver = self;
  v89.super_class = (Class)CKLocationShareBalloonView;
  [(CKImageBalloonView *)&v89 layoutSubviews];
  [(CKLocationShareBalloonView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  v7 = +[CKUIBehavior sharedBehaviors];
  [v7 locationShareBalloonButtonHeight];
  double v9 = v8;
  v10 = +[CKUIBehavior sharedBehaviors];
  objc_msgSend(v10, "locationShareBalloonLabelMaxHeightForOfferState:", -[CKLocationShareBalloonView offerState](self, "offerState"));
  double v12 = v9 + v11;

  v13 = [(CKLocationShareBalloonView *)self effectView];
  objc_msgSend(v13, "setFrame:", 0.0, v6 - v12, v4, v12);

  v14 = +[CKUIBehavior sharedBehaviors];
  [v14 balloonMaskTailSizeForTailShape:1];
  double v16 = v15;

  v17 = +[CKUIBehavior sharedBehaviors];
  [v17 locationShareBalloonButtonHeight];
  double v19 = v18;

  v20 = +[CKUIBehavior sharedBehaviors];
  objc_msgSend(v20, "locationShareBalloonLabelMaxHeightForOfferState:", -[CKLocationShareBalloonView offerState](self, "offerState"));
  double v22 = v21;

  [(CKLocationShareBalloonView *)self bounds];
  double v24 = v23 - v16 + -20.0;
  double v25 = v16 + 10.0;
  if ([(CKLocationShareBalloonView *)self offerState])
  {
    if ([(CKLocationShareBalloonView *)self offerState] == 1)
    {
      v26 = [(CKLocationShareBalloonView *)self titleLabel];
      objc_msgSend(v26, "sizeThatFits:", v24, v22);
      double v28 = v27;
      double v30 = v29;

      [(CKLocationShareBalloonView *)self bounds];
      CGFloat v32 = v22 - v30 + v31 - v19;
      v33 = [(CKLocationShareBalloonView *)self titleLabel];
      objc_msgSend(v33, "setFrame:", v25, v32, v28, v30);

      v34 = [(CKLocationShareBalloonView *)self locationLabel];
      objc_msgSend(v34, "sizeThatFits:", v24, v22);
      double v36 = v35;
      double v38 = v37;

      v90.origin.x = v25;
      v90.origin.y = v32;
      v90.size.width = v28;
      v90.size.height = v30;
      double MaxY = CGRectGetMaxY(v90);
      v40 = [(CKLocationShareBalloonView *)self locationLabel];
      objc_msgSend(v40, "setFrame:", v25, MaxY, v36, v38);

      v41 = [(CKLocationShareBalloonView *)self chevron];
      v42 = [v41 image];
      [v42 size];
      double v44 = v43;
      double v46 = v45;

      [(CKLocationShareBalloonView *)self bounds];
      double v47 = CGRectGetMaxX(v91) - v44 + -10.0;
      [(CKLocationShareBalloonView *)self bounds];
      double v49 = v48 - v19;
      double v50 = (v19 - v46) * 0.5;
      if (CKMainScreenScale_once_8 != -1) {
        dispatch_once(&CKMainScreenScale_once_8, &__block_literal_global_18);
      }
      double v51 = *(double *)&CKMainScreenScale_sMainScreenScale_8;
      if (*(double *)&CKMainScreenScale_sMainScreenScale_8 == 0.0) {
        double v51 = 1.0;
      }
      double v52 = v49 + ceil(v50 * v51) / v51;
      v53 = v41;
      double v54 = v47;
      double v55 = v44;
      double v56 = v46;
    }
    else
    {
      if ([(CKLocationShareBalloonView *)self offerState] != 2) {
        return;
      }
      v82 = [(CKLocationShareBalloonView *)self titleLabel];
      objc_msgSend(v82, "sizeThatFits:", v24, v22);
      double v84 = v83;
      double v86 = v85;

      [(CKLocationShareBalloonView *)self bounds];
      double v88 = v87 - v22;
      v53 = [(CKLocationShareBalloonView *)self titleLabel];
      v41 = v53;
      double v54 = v25;
      double v52 = v88;
      double v55 = v84;
      double v56 = v86;
    }
  }
  else
  {
    double v57 = v22 + -6.0;
    [(CKLocationShareBalloonView *)self bounds];
    double v59 = v58 - v19 - v22 + 3.0;
    v60 = [(CKLocationShareBalloonView *)self titleLabel];
    objc_msgSend(v60, "setFrame:", v16 + 10.0, v59, v24, v57);

    [(CKLocationShareBalloonView *)self bounds];
    double v62 = (v61 - v16) * 0.5;
    if (CKMainScreenScale_once_8 != -1) {
      dispatch_once(&CKMainScreenScale_once_8, &__block_literal_global_18);
    }
    double v63 = *(double *)&CKMainScreenScale_sMainScreenScale_8;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_8 == 0.0) {
      double v63 = 1.0;
    }
    double v64 = ceil(v62 * v63) / v63;
    v65 = +[CKUIBehavior sharedBehaviors];
    [v65 locationShareBalloonButtonHeight];
    double v67 = v66;

    [(CKLocationShareBalloonView *)self bounds];
    double v69 = v68 - v19;
    v70 = [(CKLocationShareBalloonView *)self ignoreButton];
    objc_msgSend(v70, "setFrame:", v16, v69, v64, v67);

    double v71 = v16 + v64;
    v72 = [(CKLocationShareBalloonView *)self startSharingButton];
    objc_msgSend(v72, "setFrame:", v16 + v64, v69, v64, v67);

    [(CKLocationShareBalloonView *)self bounds];
    double v74 = v73 - v19;
    [(CKLocationShareBalloonView *)self bounds];
    double v76 = v75 - v16;
    if (CKMainScreenScale_once_8 != -1) {
      dispatch_once(&CKMainScreenScale_once_8, &__block_literal_global_18);
    }
    double v77 = *(double *)&CKMainScreenScale_sMainScreenScale_8;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_8 == 0.0) {
      double v77 = 1.0;
    }
    double v78 = ceil(v77 * 0.5) / v77;
    v79 = [(CKLocationShareBalloonView *)self horizontalSeparator];
    objc_msgSend(v79, "setFrame:", v16, v74, v76, v78);

    if (CKMainScreenScale_once_8 != -1) {
      dispatch_once(&CKMainScreenScale_once_8, &__block_literal_global_18);
    }
    double v80 = *(double *)&CKMainScreenScale_sMainScreenScale_8;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_8 == 0.0) {
      double v80 = 1.0;
    }
    double v81 = ceil(v80 * 0.5) / v80;
    v53 = [(CKLocationShareBalloonView *)self verticalSeparator];
    v41 = v53;
    double v54 = v71;
    double v52 = v74;
    double v55 = v81;
    double v56 = v19;
  }
  objc_msgSend(v53, "setFrame:", v54, v52, v55, v56);
}

- (CGSize)sizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  double width = a3.width;
  double v6 = +[CKUIBehavior sharedBehaviors];
  v7 = [(CKImageBalloonView *)self image];
  [v7 size];
  double v9 = v8;

  if (width >= v9) {
    double width = v9;
  }
  objc_msgSend(v6, "locationShareBalloonSizeForWidth:offerState:", -[CKLocationShareBalloonView offerState](self, "offerState"), width);
  double v11 = v10;
  double v13 = v12;

  double v14 = v11;
  double v15 = v13;
  result.height = v15;
  result.double width = v14;
  return result;
}

- (void)addFilter:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CKLocationShareBalloonView;
  [(CKImageBalloonView *)&v5 addFilter:a3];
  double v4 = [(CKLocationShareBalloonView *)self effectView];
  [v4 setHidden:1];
}

- (void)clearFilters
{
  v4.receiver = self;
  v4.super_class = (Class)CKLocationShareBalloonView;
  [(CKImageBalloonView *)&v4 clearFilters];
  double v3 = [(CKLocationShareBalloonView *)self effectView];
  [v3 setHidden:0];
}

- (void)prepareForDisplay
{
  v82.receiver = self;
  v82.super_class = (Class)CKLocationShareBalloonView;
  [(CKImageBalloonView *)&v82 prepareForDisplay];
  double v3 = [(CKLocationShareBalloonView *)self effectView];

  if (!v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F43028]);
    objc_super v5 = [MEMORY[0x1E4F427D8] effectWithStyle:6];
    double v6 = (void *)[v4 initWithEffect:v5];
    [(CKLocationShareBalloonView *)self setEffectView:v6];

    v7 = [(CKLocationShareBalloonView *)self effectView];
    [(CKLocationShareBalloonView *)self addSubview:v7];
  }
  double v8 = [(CKLocationShareBalloonView *)self effectView];
  [(CKLocationShareBalloonView *)self sendSubviewToBack:v8];

  double v9 = [(CKLocationShareBalloonView *)self titleLabel];

  if (!v9)
  {
    id v10 = objc_alloc(MEMORY[0x1E4F42B38]);
    double v11 = objc_msgSend(v10, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [v11 setOpaque:0];
    [v11 setBackgroundColor:0];
    double v12 = +[CKUIBehavior sharedBehaviors];
    double v13 = [v12 previewTitleFont];
    [v11 setFont:v13];

    [v11 setTextAlignment:4];
    double v14 = [(CKLocationShareBalloonView *)self titleString];
    [v11 setText:v14];

    [(CKLocationShareBalloonView *)self setTitleLabel:v11];
  }
  double v15 = [(CKLocationShareBalloonView *)self titleLabel];
  double v16 = [(CKLocationShareBalloonView *)self titleString];
  [v15 setText:v16];

  v17 = [(CKLocationShareBalloonView *)self titleLabel];
  [(CKLocationShareBalloonView *)self addSubview:v17];

  if ([(CKLocationShareBalloonView *)self offerState])
  {
    if ([(CKLocationShareBalloonView *)self offerState] == 1)
    {
      double v18 = [(CKLocationShareBalloonView *)self titleLabel];
      [v18 setLineBreakMode:4];

      double v19 = [(CKLocationShareBalloonView *)self titleLabel];
      [v19 setNumberOfLines:1];

      v20 = [(CKLocationShareBalloonView *)self locationLabel];

      if (!v20)
      {
        id v21 = objc_alloc(MEMORY[0x1E4F42B38]);
        double v22 = objc_msgSend(v21, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
        [v22 setOpaque:0];
        [v22 setBackgroundColor:0];
        double v23 = [(CKLocationShareBalloonView *)self locationString];
        [v22 setText:v23];

        [v22 setAlpha:0.400000006];
        double v24 = +[CKUIBehavior sharedBehaviors];
        double v25 = [v24 previewTitleFont];
        [v22 setFont:v25];

        [(CKLocationShareBalloonView *)self setLocationLabel:v22];
      }
      v26 = [(CKLocationShareBalloonView *)self chevron];

      if (!v26)
      {
        id v27 = objc_alloc(MEMORY[0x1E4F42AA0]);
        double v28 = +[CKUIBehavior sharedBehaviors];
        double v29 = [v28 chevronImageForColorType:0xFFFFFFFFLL];
        double v30 = (void *)[v27 initWithImage:v29];

        [v30 setContentMode:4];
        [(CKLocationShareBalloonView *)self setChevron:v30];
      }
      double v31 = [(CKLocationShareBalloonView *)self locationLabel];
      CGFloat v32 = [(CKLocationShareBalloonView *)self locationString];
      [v31 setText:v32];

      v33 = [(CKLocationShareBalloonView *)self locationLabel];
      [(CKLocationShareBalloonView *)self addSubview:v33];

      v34 = [(CKLocationShareBalloonView *)self chevron];
      [(CKLocationShareBalloonView *)self addSubview:v34];

      double v35 = [(CKLocationShareBalloonView *)self startSharingButton];
      [v35 removeFromSuperview];

      double v36 = [(CKLocationShareBalloonView *)self ignoreButton];
      [v36 removeFromSuperview];

      double v37 = [(CKLocationShareBalloonView *)self horizontalSeparator];
      [v37 removeFromSuperview];

      double v38 = [(CKLocationShareBalloonView *)self verticalSeparator];
      goto LABEL_24;
    }
    if ([(CKLocationShareBalloonView *)self offerState] != 2) {
      return;
    }
    double v75 = [(CKLocationShareBalloonView *)self titleLabel];
    [v75 setLineBreakMode:4];

    double v76 = [(CKLocationShareBalloonView *)self titleLabel];
    [v76 setNumberOfLines:1];

    double v77 = [(CKLocationShareBalloonView *)self startSharingButton];
    [v77 removeFromSuperview];

    double v78 = [(CKLocationShareBalloonView *)self ignoreButton];
    [v78 removeFromSuperview];

    v79 = [(CKLocationShareBalloonView *)self horizontalSeparator];
    [v79 removeFromSuperview];

    double v74 = [(CKLocationShareBalloonView *)self verticalSeparator];
    [v74 removeFromSuperview];
  }
  else
  {
    v39 = [(CKLocationShareBalloonView *)self titleLabel];
    [v39 setLineBreakMode:0];

    v40 = [(CKLocationShareBalloonView *)self titleLabel];
    [v40 setNumberOfLines:0];

    v41 = [(CKLocationShareBalloonView *)self startSharingButton];

    if (!v41)
    {
      v42 = [MEMORY[0x1E4F427E0] buttonWithType:1];
      [v42 addTarget:self action:sel__shareButtonHit_ forControlEvents:64];
      double v43 = CKFrameworkBundle();
      double v44 = [v43 localizedStringForKey:@"SHARE_BUTTON_START" value:&stru_1EDE4CA38 table:@"ChatKit"];
      [v42 setTitle:v44 forState:0];

      double v45 = [v42 titleLabel];
      [v45 setTextAlignment:1];

      double v46 = [v42 titleLabel];
      double v47 = +[CKUIBehavior sharedBehaviors];
      double v48 = [v47 locationBoldButtonFont];
      [v46 setFont:v48];

      double v49 = [v42 titleLabel];
      double v50 = [MEMORY[0x1E4F428B8] systemBlueColor];
      [v49 setTextColor:v50];

      double v51 = [(CKBalloonView *)self delegate];
      double v52 = [v51 sharingMenu];
      [v42 setMenu:v52];

      [v42 setContextMenuIsPrimary:1];
      [v42 setEnabled:1];
      [(CKLocationShareBalloonView *)self setStartSharingButton:v42];
    }
    v53 = [(CKLocationShareBalloonView *)self ignoreButton];

    if (!v53)
    {
      double v54 = [MEMORY[0x1E4F427E0] buttonWithType:1];
      [v54 addTarget:self action:sel__ignoreButtonHit_ forControlEvents:64];
      double v55 = CKFrameworkBundle();
      double v56 = [v55 localizedStringForKey:@"SHARE_BUTTON_IGNORE" value:&stru_1EDE4CA38 table:@"ChatKit"];
      [v54 setTitle:v56 forState:0];

      double v57 = [v54 titleLabel];
      [v57 setTextAlignment:1];

      double v58 = [v54 titleLabel];
      double v59 = +[CKUIBehavior sharedBehaviors];
      v60 = [v59 locationButtonFont];
      [v58 setFont:v60];

      double v61 = [v54 titleLabel];
      double v62 = [MEMORY[0x1E4F428B8] systemBlueColor];
      [v61 setTextColor:v62];

      [(CKLocationShareBalloonView *)self setIgnoreButton:v54];
    }
    double v63 = [(CKLocationShareBalloonView *)self horizontalSeparator];

    if (!v63)
    {
      id v64 = objc_alloc(MEMORY[0x1E4F42FF0]);
      v65 = objc_msgSend(v64, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      double v66 = [MEMORY[0x1E4F428B8] opaqueSeparatorColor];
      [v65 setBackgroundColor:v66];

      [(CKLocationShareBalloonView *)self setHorizontalSeparator:v65];
    }
    double v67 = [(CKLocationShareBalloonView *)self verticalSeparator];

    if (!v67)
    {
      id v68 = objc_alloc(MEMORY[0x1E4F42FF0]);
      double v69 = objc_msgSend(v68, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      v70 = [MEMORY[0x1E4F428B8] opaqueSeparatorColor];
      [v69 setBackgroundColor:v70];

      [(CKLocationShareBalloonView *)self setVerticalSeparator:v69];
    }
    double v71 = [(CKLocationShareBalloonView *)self startSharingButton];
    [(CKLocationShareBalloonView *)self addSubview:v71];

    v72 = [(CKLocationShareBalloonView *)self ignoreButton];
    [(CKLocationShareBalloonView *)self addSubview:v72];

    double v73 = [(CKLocationShareBalloonView *)self horizontalSeparator];
    [(CKLocationShareBalloonView *)self addSubview:v73];

    double v74 = [(CKLocationShareBalloonView *)self verticalSeparator];
    [(CKLocationShareBalloonView *)self addSubview:v74];
  }

  double v80 = [(CKLocationShareBalloonView *)self locationLabel];
  [v80 removeFromSuperview];

  double v38 = [(CKLocationShareBalloonView *)self chevron];
LABEL_24:
  double v81 = v38;
  [v38 removeFromSuperview];
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  objc_super v5 = objc_msgSend(a4, "view", a3);
  if ([v5 isEqual:self->_startSharingButton]) {
    LOBYTE(v6) = 0;
  }
  else {
    int v6 = [v5 isEqual:self->_ignoreButton] ^ 1;
  }

  return v6;
}

- (void)setOfferState:(int64_t)a3
{
  if (self->_offerState != a3)
  {
    self->_offerState = a3;
    [(CKBalloonView *)self setNeedsPrepareForDisplay];
  }
}

- (void)setTitleString:(id)a3
{
  id v6 = a3;
  if (!-[NSString isEqualToString:](self->_titleString, "isEqualToString:"))
  {
    id v4 = (NSString *)[v6 copy];
    titleString = self->_titleString;
    self->_titleString = v4;

    [(CKBalloonView *)self setNeedsPrepareForDisplay];
  }
}

- (void)setLocationString:(id)a3
{
  id v6 = a3;
  if (!-[NSString isEqualToString:](self->_locationString, "isEqualToString:"))
  {
    id v4 = (NSString *)[v6 copy];
    locationString = self->_locationString;
    self->_locationString = v4;

    [(CKBalloonView *)self setNeedsPrepareForDisplay];
  }
}

- (void)setDelegate:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CKLocationShareBalloonView;
  id v4 = a3;
  [(CKBalloonView *)&v7 setDelegate:v4];
  objc_super v5 = [(CKLocationShareBalloonView *)self startSharingButton];
  id v6 = [v4 sharingMenu];

  [v5 setMenu:v6];
}

- (void)_ignoreButtonHit:(id)a3
{
  id v4 = [(CKBalloonView *)self delegate];
  [v4 locationShareBalloonViewIgnoreButtonTapped:self];
}

- (int64_t)offerState
{
  return self->_offerState;
}

- (NSString)titleString
{
  return self->_titleString;
}

- (NSString)locationString
{
  return self->_locationString;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)locationLabel
{
  return self->_locationLabel;
}

- (void)setLocationLabel:(id)a3
{
}

- (UIButton)startSharingButton
{
  return self->_startSharingButton;
}

- (void)setStartSharingButton:(id)a3
{
}

- (UIButton)ignoreButton
{
  return self->_ignoreButton;
}

- (void)setIgnoreButton:(id)a3
{
}

- (UIView)horizontalSeparator
{
  return self->_horizontalSeparator;
}

- (void)setHorizontalSeparator:(id)a3
{
}

- (UIView)verticalSeparator
{
  return self->_verticalSeparator;
}

- (void)setVerticalSeparator:(id)a3
{
}

- (UIImageView)chevron
{
  return self->_chevron;
}

- (void)setChevron:(id)a3
{
}

- (UIVisualEffectView)effectView
{
  return self->_effectView;
}

- (void)setEffectView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectView, 0);
  objc_storeStrong((id *)&self->_chevron, 0);
  objc_storeStrong((id *)&self->_verticalSeparator, 0);
  objc_storeStrong((id *)&self->_horizontalSeparator, 0);
  objc_storeStrong((id *)&self->_ignoreButton, 0);
  objc_storeStrong((id *)&self->_startSharingButton, 0);
  objc_storeStrong((id *)&self->_locationLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_locationString, 0);

  objc_storeStrong((id *)&self->_titleString, 0);
}

- (void)configureForLocationShareOfferChatItem:(id)a3
{
  id v4 = a3;
  -[CKBalloonView setOrientation:](self, "setOrientation:", [v4 balloonOrientation]);
  -[CKImageBalloonView setHasTail:](self, "setHasTail:", [v4 hasTail]);
  -[CKBalloonView setBalloonCorners:](self, "setBalloonCorners:", [v4 balloonCorners]);
  [v4 textAlignmentInsets];
  -[CKBalloonView setTextAlignmentInsets:](self, "setTextAlignmentInsets:");
  -[CKLocationShareBalloonView setOfferState:](self, "setOfferState:", [v4 offerState]);
  objc_super v5 = [v4 titleText];
  [(CKLocationShareBalloonView *)self setTitleString:v5];

  id v6 = [v4 locationText];
  [(CKLocationShareBalloonView *)self setLocationString:v6];

  id v9 = +[CKUIBehavior sharedBehaviors];
  [v9 mapPreviewMaxWidth];
  double v8 = objc_msgSend(v4, "previewForWidth:orientation:", -[CKBalloonView orientation](self, "orientation"), v7);

  [(CKImageBalloonView *)self setImage:v8];
}

@end