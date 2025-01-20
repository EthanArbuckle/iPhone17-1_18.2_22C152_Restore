@interface CKBrowserCell
+ (Class)classForItemType:(int64_t)a3;
+ (id)reuseIdentifier;
- (BOOL)jitter;
- (BOOL)shouldShowLabel;
- (CGRect)browserCellIconFrame;
- (CGRect)selectionFrame;
- (CKBadgeView)badgeView;
- (CKBrowserCell)initWithFrame:(CGRect)a3;
- (CKBrowserCellDelegate)delegate;
- (CKBrowserSelectionLabelAccessoryView)shinyStatusView;
- (UIImageView)borderView;
- (UILabel)browserLabel;
- (UIView)iconView;
- (double)browserCellSelectionBorderOutset;
- (unint64_t)shinyStatus;
- (void)applyLayoutAttributes:(id)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setBadgeView:(id)a3;
- (void)setBorderStyle:(int64_t)a3;
- (void)setBorderView:(id)a3;
- (void)setBrowserLabel:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setJitter:(BOOL)a3;
- (void)setSelectionFrame:(CGRect)a3;
- (void)setShinyStatus:(unint64_t)a3;
- (void)setShinyStatusView:(id)a3;
- (void)setShouldShowLabel:(BOOL)a3;
@end

@implementation CKBrowserCell

+ (id)reuseIdentifier
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"CKBrowserCell.m" lineNumber:50 description:@"Please override +reuseIdentifier in your subclass"];

  return NSStringFromClass((Class)a1);
}

+ (Class)classForItemType:(int64_t)a3
{
  if ((unint64_t)a3 >= 3) {
    _IMWarn();
  }
  v3 = objc_opt_class();

  return (Class)v3;
}

- (CKBrowserCell)initWithFrame:(CGRect)a3
{
  v32.receiver = self;
  v32.super_class = (Class)CKBrowserCell;
  v3 = -[CKBrowserCell initWithFrame:](&v32, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4F428B8] clearColor];
    [(CKBrowserCell *)v3 setBackgroundColor:v4];

    v5 = [(CKBrowserCell *)v3 contentView];
    v6 = [(CKBrowserCell *)v3 iconView];
    [v5 addSubview:v6];

    id v7 = objc_alloc(MEMORY[0x1E4F42B38]);
    double v8 = *MEMORY[0x1E4F1DB28];
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    v12 = objc_msgSend(v7, "initWithFrame:", *MEMORY[0x1E4F1DB28], v9, v10, v11);
    [(CKBrowserCell *)v3 setBrowserLabel:v12];

    v13 = [(CKBrowserCell *)v3 browserLabel];
    [v13 setTextAlignment:1];

    v14 = [(CKBrowserCell *)v3 browserLabel];
    [v14 setLineBreakMode:4];

    v15 = [(CKBrowserCell *)v3 browserLabel];
    [v15 setNumberOfLines:1];

    v16 = [(CKBrowserCell *)v3 browserLabel];
    [v16 setAllowsDefaultTighteningForTruncation:1];

    v17 = [(CKBrowserCell *)v3 browserLabel];
    v18 = +[CKUIBehavior sharedBehaviors];
    v19 = [v18 browserCellFont];
    [v17 setFont:v19];

    v20 = [(CKBrowserCell *)v3 contentView];
    v21 = [(CKBrowserCell *)v3 browserLabel];
    [v20 addSubview:v21];

    v22 = -[CKBadgeView initWithFrame:]([CKBadgeView alloc], "initWithFrame:", v8, v9, v10, v11);
    [(CKBrowserCell *)v3 setBadgeView:v22];

    v23 = [(CKBrowserCell *)v3 contentView];
    v24 = [(CKBrowserCell *)v3 badgeView];
    [v23 addSubview:v24];

    id v25 = objc_alloc_init(MEMORY[0x1E4F42AA0]);
    [(CKBrowserCell *)v3 setBorderView:v25];

    v26 = [(CKBrowserCell *)v3 borderView];
    v27 = [MEMORY[0x1E4F428B8] whiteColor];
    v28 = [v27 colorWithAlphaComponent:0.25];
    [v26 setTintColor:v28];

    v29 = [(CKBrowserCell *)v3 contentView];
    v30 = [(CKBrowserCell *)v3 borderView];
    [v29 addSubview:v30];

    v3->_shouldShowLabel = 1;
  }
  return v3;
}

- (void)layoutSubviews
{
  v122.receiver = self;
  v122.super_class = (Class)CKBrowserCell;
  [(CKBrowserCell *)&v122 layoutSubviews];
  v3 = [(CKBrowserCell *)self contentView];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  CGFloat v109 = v5;
  v123.origin.x = v5;
  v123.origin.y = v7;
  v123.size.width = v9;
  v123.size.height = v11;
  double Width = CGRectGetWidth(v123);
  [(CKBrowserCell *)self browserCellIconFrame];
  double v14 = v13;
  double v120 = v15;
  double v17 = v16;
  double v19 = v18;
  double v20 = v16 + v13 * 2.0;
  v21 = [(CKBrowserCell *)self browserLabel];
  v22 = v21;
  double v114 = Width;
  CGFloat v110 = v9;
  CGFloat v111 = v11;
  if (Width <= v20)
  {
    [v21 setAlpha:0.0];

    v26 = [(CKBrowserCell *)self shinyStatusView];
    [v26 setAlpha:0.0];

    v27 = [(CKBrowserCell *)self badgeView];
    [v27 setAlpha:0.0];

    double v25 = v120;
  }
  else
  {
    [v21 setAlpha:1.0];

    v23 = [(CKBrowserCell *)self shinyStatusView];
    [v23 setAlpha:1.0];

    v24 = [(CKBrowserCell *)self badgeView];
    [v24 setAlpha:1.0];

    double v14 = 12.0;
    double v25 = 5.0;
    double v17 = 60.0;
    double v19 = 45.0;
  }
  v28 = [(CKBrowserCell *)self iconView];
  objc_msgSend(v28, "setFrame:", v14, v25, v17, v19);

  [(CKBrowserCell *)self browserCellSelectionBorderOutset];
  CGFloat v30 = -v29;
  CGFloat v119 = v14;
  CGFloat v121 = v25;
  v124.origin.x = v14;
  v124.origin.y = v25;
  CGFloat v117 = v19;
  CGFloat v118 = v17;
  v124.size.width = v17;
  v124.size.height = v19;
  CGRect v125 = CGRectInset(v124, v30, v30);
  -[CKBrowserCell setSelectionFrame:](self, "setSelectionFrame:", v125.origin.x, v125.origin.y, v125.size.width, v125.size.height);
  v31 = [(CKBrowserCell *)self shinyStatusView];
  [v31 sizeToFit];
  [v31 frame];
  double v32 = CGRectGetWidth(v126);
  v33 = [(CKBrowserCell *)self contentView];
  [v33 bounds];
  double v34 = CGRectGetWidth(v127) + -3.0;

  double v112 = v32;
  double v35 = v32 + 2.0;
  double v36 = 0.0;
  if (v31) {
    double v36 = v32 + 2.0;
  }
  double v37 = v34 - v36;
  v38 = [(CKBrowserCell *)self browserLabel];
  [v38 sizeToFit];

  v39 = [(CKBrowserCell *)self browserLabel];
  v40 = [(CKBrowserCell *)self iconView];
  [v40 frame];
  [v39 _setFirstLineBaselineFrameOriginY:CGRectGetMaxY(v128) + 13.0];

  v41 = [(CKBrowserCell *)self browserLabel];
  [v41 frame];
  CGFloat v43 = v42;
  double v45 = v44;
  CGFloat v47 = v46;
  double v49 = v48;

  v129.origin.x = v43;
  v129.origin.y = v45;
  v129.size.width = v47;
  v129.size.height = v49;
  double v50 = CGRectGetWidth(v129);
  if (v37 >= v50) {
    double v51 = v50;
  }
  else {
    double v51 = v37;
  }
  v130.origin.x = v43;
  v130.origin.y = v45;
  v130.size.width = v51;
  v130.size.height = v49;
  double v52 = CGRectGetWidth(v130);
  if (v31)
  {
    [v31 frame];
    double v54 = v53;
    double v56 = v55;
    if (CKMainScreenScale_once_44 != -1) {
      dispatch_once(&CKMainScreenScale_once_44, &__block_literal_global_113);
    }
    double v57 = 1.0;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_44 == 0.0) {
      double v58 = 1.0;
    }
    else {
      double v58 = *(double *)&CKMainScreenScale_sMainScreenScale_44;
    }
    double v59 = v56 * v58;
    double v60 = 1.0 / v58;
    double v61 = 1.0 / v58 * (v45 * v58 + floor((v49 * v58 - v56 * v58) * 0.5));
    double v62 = v54 * v58 * (1.0 / v58);
    double v108 = v61;
    if (v114 * 0.5 - (v112 + v52 * 0.5 + 2.0) >= 2.0)
    {
      double v107 = v59 * v60;
      double v116 = v62;
      v133.origin.x = v109;
      v133.origin.y = v7;
      v133.size.width = v110;
      v133.size.height = v111;
      double MidX = CGRectGetMidX(v133);
      v134.origin.x = v109;
      v134.origin.y = v7;
      v134.size.width = v110;
      v134.size.height = v111;
      CGRectGetMidY(v134);
      if (CKMainScreenScale_once_44 != -1) {
        dispatch_once(&CKMainScreenScale_once_44, &__block_literal_global_113);
      }
      double v76 = *(double *)&CKMainScreenScale_sMainScreenScale_44;
      if (*(double *)&CKMainScreenScale_sMainScreenScale_44 == 0.0) {
        double v76 = 1.0;
      }
      double v71 = MidX - round(v52 * 0.5 * v76) / v76;
      v135.origin.x = v71;
      v135.origin.y = v45;
      v135.size.width = v51;
      v135.size.height = v49;
      CGFloat MinX = CGRectGetMinX(v135);
      double v73 = v116;
      double v64 = MinX + -2.0 - v112;
      double v74 = v107;
      double v72 = v108;
    }
    else
    {
      double v63 = fmax((v114 - (v35 + v52)) * 0.5, 2.0);
      if (*(double *)&CKMainScreenScale_sMainScreenScale_44 != 0.0) {
        double v57 = *(double *)&CKMainScreenScale_sMainScreenScale_44;
      }
      double v64 = round(v63 * v57) / v57;
      double v65 = v64;
      double v66 = v62;
      double v67 = v59 * v60;
      double v68 = v59 * v60;
      double v69 = CGRectGetMaxX(*(CGRect *)(&v61 - 1)) + 2.0;
      if (CKMainScreenScale_once_44 != -1) {
        dispatch_once(&CKMainScreenScale_once_44, &__block_literal_global_113);
      }
      double v70 = *(double *)&CKMainScreenScale_sMainScreenScale_44;
      if (*(double *)&CKMainScreenScale_sMainScreenScale_44 == 0.0) {
        double v70 = 1.0;
      }
      double v71 = round(v69 * v70) / v70;
      double v72 = v108;
      double v73 = v66;
      double v74 = v67;
    }
    objc_msgSend(v31, "setFrame:", v64, v72, v73, v74);
  }
  else
  {
    v131.origin.x = v109;
    v131.origin.y = v7;
    v131.size.width = v110;
    v131.size.height = v111;
    double v115 = CGRectGetMidX(v131);
    v132.origin.x = v109;
    v132.origin.y = v7;
    v132.size.width = v110;
    v132.size.height = v111;
    CGRectGetMidY(v132);
    if (CKMainScreenScale_once_44 != -1) {
      dispatch_once(&CKMainScreenScale_once_44, &__block_literal_global_113);
    }
    double v75 = *(double *)&CKMainScreenScale_sMainScreenScale_44;
    if (*(double *)&CKMainScreenScale_sMainScreenScale_44 == 0.0) {
      double v75 = 1.0;
    }
    double v71 = v115 - round(v52 * 0.5 * v75) / v75;
  }
  v78 = [(CKBrowserCell *)self browserLabel];
  objc_msgSend(v78, "setFrame:", v71, v45, v51, v49);

  v79 = [(CKBrowserCell *)self badgeView];
  [v79 sizeToFit];

  v80 = [(CKBrowserCell *)self badgeView];
  [v80 frame];
  CGFloat v82 = v81;
  CGFloat v84 = v83;
  double v86 = v85;
  double v88 = v87;

  v136.origin.x = v119;
  v136.origin.y = v121;
  v136.size.width = v118;
  v136.size.height = v117;
  double MaxX = CGRectGetMaxX(v136);
  v137.origin.x = v82;
  v137.origin.y = v84;
  v137.size.width = v86;
  v137.size.height = v88;
  double v89 = CGRectGetWidth(v137);
  v138.origin.x = v119;
  v138.origin.y = v121;
  v138.size.width = v118;
  v138.size.height = v117;
  double MinY = CGRectGetMinY(v138);
  if (CKMainScreenScale_once_44 != -1) {
    dispatch_once(&CKMainScreenScale_once_44, &__block_literal_global_113);
  }
  double v91 = MinY + -1.0;
  double v92 = *(double *)&CKMainScreenScale_sMainScreenScale_44;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_44 == 0.0) {
    double v92 = 1.0;
  }
  double v93 = round((MaxX + v89 * -0.5 + -5.0) * v92) / v92;
  double v94 = round(v91 * v92) / v92;
  v95 = [(CKBrowserCell *)self badgeView];
  objc_msgSend(v95, "setFrame:", v93, v94, v86, v88);

  v96 = [(CKBrowserCell *)self iconView];
  [v96 frame];
  double v98 = v97;
  double v100 = v99;
  double v102 = v101;
  double v104 = v103;
  v105 = [(CKBrowserCell *)self borderView];
  objc_msgSend(v105, "setFrame:", v98, v100, v102, v104);
}

- (CGRect)browserCellIconFrame
{
  if (objc_msgSend(MEMORY[0x1E4F42B08], "__ck_isUsingCompactHeightPredictionBar")
    && (+[CKUIBehavior sharedBehaviors],
        v2 = objc_claimAutoreleasedReturnValue(),
        char v3 = [v2 isAppStripInKeyboard],
        v2,
        (v3 & 1) != 0))
  {
    double v4 = 4.5;
    double v5 = 7.0;
    double v6 = 28.5;
    uint64_t v7 = 0x4043000000000000;
  }
  else
  {
    double v6 = 30.0;
    double v4 = 4.0;
    double v5 = 6.0;
    uint64_t v7 = 0x4044000000000000;
  }
  double v8 = *(double *)&v7;
  result.size.height = v6;
  result.size.width = v8;
  result.origin.y = v4;
  result.origin.x = v5;
  return result;
}

- (double)browserCellSelectionBorderOutset
{
  int v2 = objc_msgSend(MEMORY[0x1E4F42B08], "__ck_isUsingCompactHeightPredictionBar");
  double result = 3.0;
  if (v2)
  {
    double v4 = +[CKUIBehavior sharedBehaviors];
    int v5 = [v4 isAppStripInKeyboard];

    double result = 3.0;
    if (v5) {
      return 2.0;
    }
  }
  return result;
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CKBrowserCell;
  [(CKBrowserCell *)&v7 applyLayoutAttributes:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if ([v5 showsBorder])
    {
      if ([v5 appStripSize]) {
        uint64_t v6 = 1;
      }
      else {
        uint64_t v6 = 2;
      }
    }
    else
    {
      uint64_t v6 = 0;
    }
    [(CKBrowserCell *)self setBorderStyle:v6];
  }
}

- (void)setBorderStyle:(int64_t)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__CKBrowserCell_setBorderStyle___block_invoke;
  block[3] = &unk_1E5620C40;
  block[4] = self;
  if (setBorderStyle__onceToken != -1) {
    dispatch_once(&setBorderStyle__onceToken, block);
  }
  if (a3 == 2)
  {
    double v8 = [(CKBrowserCell *)self borderView];
    CGFloat v9 = v8;
    uint64_t v10 = setBorderStyle__twoPxBorderImage;
LABEL_9:
    [v8 setImage:v10];

    id v5 = [(CKBrowserCell *)self borderView];
    uint64_t v6 = v5;
    double v7 = 1.0;
    goto LABEL_10;
  }
  if (a3 == 1)
  {
    double v8 = [(CKBrowserCell *)self borderView];
    CGFloat v9 = v8;
    uint64_t v10 = setBorderStyle__onePxBorderImage;
    goto LABEL_9;
  }
  if (a3) {
    return;
  }
  id v5 = [(CKBrowserCell *)self borderView];
  uint64_t v6 = v5;
  double v7 = 0.0;
LABEL_10:
  [v5 setAlpha:v7];
}

void __32__CKBrowserCell_setBorderStyle___block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F42A80];
  v1 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  int v2 = [v0 imageNamed:@"BorderPath-1px" inBundle:v1];
  uint64_t v3 = [v2 imageWithRenderingMode:2];
  id v4 = (void *)setBorderStyle__onePxBorderImage;
  setBorderStyle__onePxBorderImage = v3;

  id v5 = (void *)MEMORY[0x1E4F42A80];
  id v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v6 = [v5 imageNamed:@"BorderPath" inBundle:v9];
  uint64_t v7 = [v6 imageWithRenderingMode:2];
  double v8 = (void *)setBorderStyle__twoPxBorderImage;
  setBorderStyle__twoPxBorderImage = v7;
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)CKBrowserCell;
  [(CKBrowserCell *)&v4 prepareForReuse];
  uint64_t v3 = [(CKBrowserCell *)self badgeView];
  [v3 setValue:0];
}

- (CKBrowserCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKBrowserCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CKBadgeView)badgeView
{
  return self->_badgeView;
}

- (void)setBadgeView:(id)a3
{
}

- (BOOL)jitter
{
  return self->_jitter;
}

- (void)setJitter:(BOOL)a3
{
  self->_jitter = a3;
}

- (BOOL)shouldShowLabel
{
  return self->_shouldShowLabel;
}

- (void)setShouldShowLabel:(BOOL)a3
{
  self->_shouldShowLabel = a3;
}

- (unint64_t)shinyStatus
{
  return self->_shinyStatus;
}

- (void)setShinyStatus:(unint64_t)a3
{
  self->_shinyStatus = a3;
}

- (CKBrowserSelectionLabelAccessoryView)shinyStatusView
{
  return self->_shinyStatusView;
}

- (void)setShinyStatusView:(id)a3
{
}

- (UILabel)browserLabel
{
  return self->_browserLabel;
}

- (void)setBrowserLabel:(id)a3
{
}

- (UIImageView)borderView
{
  return self->_borderView;
}

- (void)setBorderView:(id)a3
{
}

- (CGRect)selectionFrame
{
  double x = self->_selectionFrame.origin.x;
  double y = self->_selectionFrame.origin.y;
  double width = self->_selectionFrame.size.width;
  double height = self->_selectionFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setSelectionFrame:(CGRect)a3
{
  self->_selectionFrame = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_borderView, 0);
  objc_storeStrong((id *)&self->_browserLabel, 0);
  objc_storeStrong((id *)&self->_shinyStatusView, 0);
  objc_storeStrong((id *)&self->_badgeView, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (UIView)iconView
{
  return 0;
}

@end