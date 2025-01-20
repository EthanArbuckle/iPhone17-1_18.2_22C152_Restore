@interface AVMobileTitlebarView
- (AVMobileChromelessControlsStyleSheet)styleSheet;
- (AVMobileContentTag)contentTag;
- (AVMobileTitlebarView)initWithStyleSheet:(id)a3;
- (AVMobileTitlebarViewDelegate)delegate;
- (BOOL)showsContentTag;
- (BOOL)showsInfoAffordance;
- (BOOL)showsSubtitle;
- (BOOL)showsTitle;
- (CGSize)intrinsicContentSize;
- (NSAttributedString)subtitle;
- (NSAttributedString)title;
- (double)titleLabelCenterYOffset;
- (void)_infoAffordancePressed:(id)a3;
- (void)_setUpInfoAffordanceIfNeeded;
- (void)_setUpSubtitleLabelIfNeeded;
- (void)_setUpTitleLabelIfNeeded;
- (void)_updateFonts;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setContentTag:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setShowsContentTag:(BOOL)a3;
- (void)setShowsInfoAffordance:(BOOL)a3;
- (void)setShowsSubtitle:(BOOL)a3;
- (void)setShowsTitle:(BOOL)a3;
- (void)setStyleSheet:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation AVMobileTitlebarView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_styleSheet, 0);
  objc_storeStrong((id *)&self->_contentTag, 0);
  objc_storeStrong((id *)&self->_subtitleLabelString, 0);
  objc_storeStrong((id *)&self->_titleLabelString, 0);
  objc_storeStrong((id *)&self->_infoAffordance, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_contentTagView, 0);
  objc_storeStrong((id *)&self->_contentContainerViewMask, 0);

  objc_storeStrong((id *)&self->_contentContainerView, 0);
}

- (void)setShowsContentTag:(BOOL)a3
{
  self->_showsContentTag = a3;
}

- (BOOL)showsContentTag
{
  return self->_showsContentTag;
}

- (void)setShowsSubtitle:(BOOL)a3
{
  self->_showsSubtitle = a3;
}

- (BOOL)showsSubtitle
{
  return self->_showsSubtitle;
}

- (void)setShowsTitle:(BOOL)a3
{
  self->_showsTitle = a3;
}

- (BOOL)showsTitle
{
  return self->_showsTitle;
}

- (void)setDelegate:(id)a3
{
}

- (AVMobileTitlebarViewDelegate)delegate
{
  return self->_delegate;
}

- (NSAttributedString)title
{
  return self->_title;
}

- (NSAttributedString)subtitle
{
  return self->_subtitle;
}

- (AVMobileChromelessControlsStyleSheet)styleSheet
{
  return self->_styleSheet;
}

- (BOOL)showsInfoAffordance
{
  return self->_showsInfoAffordance;
}

- (AVMobileContentTag)contentTag
{
  return self->_contentTag;
}

- (void)_infoAffordancePressed:(id)a3
{
  id v4 = [(AVMobileTitlebarView *)self delegate];
  [v4 titleBarViewInfoAffordanceWasPressed:self];
}

- (void)layoutSubviews
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  v88.receiver = self;
  v88.super_class = (Class)AVMobileTitlebarView;
  [(AVView *)&v88 layoutSubviews];
  [(AVMobileTitlebarView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v7 = v3;
  uint64_t v8 = [(AVMobileTitlebarView *)self effectiveUserInterfaceLayoutDirection];
  double v9 = *MEMORY[0x1E4F1DB30];
  double v10 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  BOOL v11 = [(AVMobileTitlebarView *)self showsContentTag];
  BOOL v12 = [(AVMobileTitlebarView *)self showsSubtitle];
  BOOL v13 = [(AVMobileTitlebarView *)self showsTitle];
  unint64_t v14 = 0x1E9B32000uLL;
  if (v11 && self->_contentTag && (contentTagView = self->_contentTagView) != 0)
  {
    [(AVMobileContentTagView *)contentTagView intrinsicContentSize];
    double v18 = v16;
    double v19 = v17;
    BOOL v20 = v17 > v6;
    if (v16 <= v4 + -15.0)
    {
      if (v17 <= v6)
      {
        double v82 = v16 + 5.0;
        unint64_t v69 = [(AVMobileContentTag *)self->_contentTag placement];
        if (v69)
        {
          if (v69 == 1)
          {
            BOOL v20 = 0;
            int v21 = 0;
            double v7 = v4 - (v82 + 2.0);
            double v22 = v7;
            double v87 = 0.0;
            double v82 = v82 + 2.0;
            double v83 = v82;
            double v78 = v19;
            goto LABEL_7;
          }
          v70 = _AVLog();
          if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
          {
            unint64_t v72 = [(AVMobileContentTag *)self->_contentTag placement];
            LODWORD(buf) = 134217984;
            *(void *)((char *)&buf + 4) = v72;
            _os_log_error_impl(&dword_1B05B7000, v70, OS_LOG_TYPE_ERROR, "Error: Unrecognized content tag placement - %ld", (uint8_t *)&buf, 0xCu);
          }
        }
        double v78 = 0.0;
        BOOL v20 = 0;
        int v21 = 0;
        double v22 = v4 - v82;
        double v83 = 0.0;
        double v87 = v19;
        goto LABEL_7;
      }
      double v78 = 0.0;
      int v21 = 0;
      BOOL v20 = 1;
    }
    else
    {
      double v78 = 0.0;
      int v21 = 1;
    }
    double v82 = 0.0;
    double v83 = 0.0;
    double v22 = v7;
    double v87 = 0.0;
  }
  else
  {
    double v78 = 0.0;
    BOOL v20 = 0;
    int v21 = 0;
    double v82 = 0.0;
    double v83 = 0.0;
    double v22 = v7;
    double v87 = 0.0;
    double v19 = v10;
    double v18 = v9;
  }
LABEL_7:
  if (v12 && (!self->_subtitleLabelString ? (char v23 = 1) : (char v23 = v21), (v23 & 1) == 0))
  {
    [(UILabel *)self->_subtitleLabel intrinsicContentSize];
    double v25 = v87;
    if (v87 >= v24) {
      double v26 = v87;
    }
    else {
      double v26 = v24;
    }
    double v74 = v24;
    if (v24 <= v6 && v22 >= 30.0) {
      double v25 = v26;
    }
    double v87 = v25;
  }
  else
  {
    double v74 = v10;
  }
  unsigned int v86 = !v11;
  unsigned int v84 = !v12;
  double v80 = v19;
  double v77 = v4;
  double v75 = v18;
  if (v13)
  {
    if (self->_titleLabelString) {
      int v28 = v20;
    }
    else {
      int v28 = 1;
    }
    double v29 = v10;
    double v30 = v9;
    if (((v21 | v28) & 1) == 0)
    {
      [(UILabel *)self->_titleLabel intrinsicContentSize];
      double v29 = v31;
    }
    double v73 = v30;
    double v85 = 2.0;
    if (self->_showsInfoAffordance)
    {
      [(AVButton *)self->_infoAffordance intrinsicContentSize];
      double v10 = v32;
      double v76 = v33;
      double v34 = v33 + 4.0;
      double v35 = v22 - v34;
      double v36 = v7 - v34;
      BOOL v37 = v10 <= v6;
      if (v35 < 30.0) {
        BOOL v37 = 0;
      }
      int v38 = v37 && v36 >= 30.0;
      if (v38)
      {
        double v7 = v36;
        double v22 = v35;
      }
      double v81 = v22;
      char v39 = v38 ^ 1;
    }
    else
    {
      double v81 = v22;
      double v76 = v9;
      char v39 = 1;
    }
  }
  else
  {
    double v81 = v22;
    double v40 = 30.0;
    char v39 = 1;
    double v85 = 0.0;
    double v76 = v9;
    double v73 = v9;
    double v29 = v10;
    uint64_t v41 = 1;
    uint64_t v42 = 1;
    double v43 = 0.0;
    double v44 = 0.0;
    double v45 = 0.0;
    if (!v11 && !v12)
    {
      if (v11) {
        goto LABEL_62;
      }
      goto LABEL_72;
    }
  }
  double v46 = 0.0;
  double v47 = v10;
  if ((v84 & v86) != 0) {
    double v48 = 0.0;
  }
  else {
    double v48 = v85;
  }
  double v49 = v48 + v87 + v29;
  if (v82 + v81 >= v83 + v7) {
    double v50 = v82 + v81;
  }
  else {
    double v50 = v83 + v7;
  }
  if (v78 >= v49) {
    double v49 = v78;
  }
  double v79 = v47;
  if (v49 >= v47) {
    double v43 = v49;
  }
  else {
    double v43 = v47;
  }
  double v85 = v6 - v43;
  uint64_t v51 = v8;
  -[UIView avkit_setFrame:inLayoutDirection:](self->_contentContainerView, "avkit_setFrame:inLayoutDirection:", v8, 0.0, *(void *)&v73);
  uint64_t v52 = [(AVMobileTitlebarView *)self effectiveUserInterfaceLayoutDirection];
  id v53 = [MEMORY[0x1E4FB1618] blackColor];
  v54 = [v53 CGColor];

  id v55 = [MEMORY[0x1E4FB1618] clearColor];
  v56 = [v55 CGColor];

  [(UIView *)self->_contentContainerView bounds];
  double v58 = v57;
  double v60 = v59;
  float v61 = 15.0 / v57;
  double v62 = v61;
  if (v52)
  {
    *(void *)&long long buf = v56;
    v63 = v54;
  }
  else
  {
    double v46 = 1.0 - v62;
    *(void *)&long long buf = v54;
    v63 = v56;
    double v62 = 1.0;
  }
  *((void *)&buf + 1) = v63;
  v64 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:");
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  -[CAGradientLayer setStartPoint:](self->_contentContainerViewMask, "setStartPoint:", v46, 0.5);
  -[CAGradientLayer setEndPoint:](self->_contentContainerViewMask, "setEndPoint:", v62, 0.5);
  [(CAGradientLayer *)self->_contentContainerViewMask setColors:v64];
  -[CAGradientLayer setFrame:](self->_contentContainerViewMask, "setFrame:", 0.0, 0.0, v58, v60);
  [MEMORY[0x1E4F39CF8] commit];

  double v45 = v43 - v87 - v48;
  double v44 = v43 - v29;
  if (v13)
  {
    uint64_t v8 = v51;
    double v10 = v79;
    if (((v12 | v86) & 1) == 0 && [(AVMobileContentTag *)self->_contentTag placement] == 1) {
      double v44 = v44 + (v80 - v29) * -0.5;
    }
    unint64_t v14 = 0x1E9B32000;
    double v45 = v45 - v29;
  }
  else
  {
    uint64_t v8 = v51;
    double v10 = v79;
    if (v11 && [(AVMobileContentTag *)self->_contentTag placement] == 1) {
      double v45 = (v80 - v87) * 0.5 + v43 - v80;
    }
    unint64_t v14 = 0x1E9B32000uLL;
  }
  uint64_t v41 = !v13;
  uint64_t v42 = 0;
  double v40 = v50 + 30.0;
  if (v11)
  {
LABEL_62:
    unint64_t v65 = [(AVMobileContentTag *)self->_contentTag placement];
    if (v65)
    {
      if (v65 == 1)
      {
        double v66 = v43 - v80 + (v43 - v80) * -0.25;
        if ((v41 | v84)) {
          double v66 = v43 - v80;
        }
        goto LABEL_71;
      }
      v67 = _AVLog();
      if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
      {
        unint64_t v71 = [(AVMobileContentTag *)self->_contentTag placement];
        LODWORD(buf) = 134217984;
        *(void *)((char *)&buf + 4) = v71;
        _os_log_error_impl(&dword_1B05B7000, v67, OS_LOG_TYPE_ERROR, "Error: Unrecognized content tag placement - %ld", (uint8_t *)&buf, 0xCu);
      }
    }
    double v66 = (v87 - v80) * 0.5 + v45;
LABEL_71:
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + *(int *)(v14 + 3488)), "avkit_setFrame:inLayoutDirection:", v8, 0.0, v66, v75);
  }
LABEL_72:
  if (v12)
  {
    [(UILabel *)self->_subtitleLabel setPreferredMaxLayoutWidth:v81];
    -[UILabel avkit_setFrame:inLayoutDirection:](self->_subtitleLabel, "avkit_setFrame:inLayoutDirection:", v8, v82, (v87 - v74) * 0.5 + v45, v40);
  }
  if (v13) {
    -[UILabel avkit_setFrame:inLayoutDirection:](self->_titleLabel, "avkit_setFrame:inLayoutDirection:", v8, v83, v44, v40, v29);
  }
  if ((v39 & 1) == 0)
  {
    double v68 = v83 + v73 + 4.0;
    if (v68 >= v77 - v76) {
      double v68 = v77 - v76;
    }
    -[UIView avkit_setFrame:inLayoutDirection:](self->_infoAffordance, "avkit_setFrame:inLayoutDirection:", v8, v68, v85 + v44 + (v10 - v29) * -0.5 + 1.0, v76, v10, *(void *)&v73);
  }
  -[UIView setHidden:](self->_contentContainerView, "setHidden:", v42, *(void *)&v73);
  [*(id *)((char *)&self->super.super.super.super.isa + *(int *)(v14 + 3488)) setHidden:v86];
  [(UILabel *)self->_subtitleLabel setHidden:v84];
  [(UILabel *)self->_titleLabel setHidden:v41];
  [(AVButton *)self->_infoAffordance setHidden:v39 & 1];
}

- (CGSize)intrinsicContentSize
{
  [(AVMobileContentTagView *)self->_contentTagView intrinsicContentSize];
  double v4 = v3;
  double v6 = v5;
  [(UILabel *)self->_titleLabel intrinsicContentSize];
  double v8 = v7;
  double v10 = v9;
  [(UILabel *)self->_subtitleLabel intrinsicContentSize];
  double v12 = v11;
  double v14 = v13;
  [(AVButton *)self->_infoAffordance intrinsicContentSize];
  double v16 = v15;
  double v18 = v17;
  contentTag = self->_contentTag;
  if (contentTag && ![(AVMobileContentTag *)contentTag placement])
  {
    if (v14 < v6) {
      double v14 = v6;
    }
    if (v12 <= 0.0) {
      double v12 = v4 + v12;
    }
    else {
      double v12 = v4 + v12 + 5.0;
    }
  }
  if (v12 >= v8) {
    double v8 = v12;
  }
  if (v10 <= 0.0 || v14 <= 0.0) {
    double v21 = v10 + v14;
  }
  else {
    double v21 = v10 + v14 + 2.0;
  }
  if (self->_contentTagView)
  {
    unint64_t v22 = [(AVMobileContentTag *)self->_contentTag placement];
    double v23 = v21 >= v6 ? v21 : v6;
    if (v22 == 1)
    {
      double v21 = v23;
      double v8 = v4 + 5.0 + 2.0 + v8;
    }
  }
  if (self->_titleLabelString || self->_subtitleLabelString || self->_contentTag)
  {
    if (v21 >= v18) {
      double v24 = v21;
    }
    else {
      double v24 = v18;
    }
    if (self->_showsInfoAffordance)
    {
      double v21 = v24;
      double v8 = v16 + 4.0 + v8;
    }
  }
  double v25 = v8;
  double v26 = v21;
  result.height = v26;
  result.width = v25;
  return result;
}

- (void)didMoveToWindow
{
  -[AVMobileTitlebarView _setUpTitleLabelIfNeeded]((uint64_t)self);
  -[AVMobileTitlebarView _setUpSubtitleLabelIfNeeded]((uint64_t)self);
  -[AVMobileTitlebarView _setUpInfoAffordanceIfNeeded]((uint64_t)self);

  -[AVMobileTitlebarView _updateFonts]((uint64_t)self);
}

- (void)_setUpTitleLabelIfNeeded
{
  if (a1)
  {
    if (!*(void *)(a1 + 480))
    {
      v2 = [(id)a1 window];
      if (v2)
      {
        uint64_t v3 = *(void *)(a1 + 504);

        if (v3)
        {
          id v4 = objc_alloc_init(MEMORY[0x1E4FB1930]);
          double v5 = *(void **)(a1 + 480);
          *(void *)(a1 + 480) = v4;

          [*(id *)(a1 + 480) setAccessibilityIdentifier:@"Title"];
          double v6 = *(void **)(a1 + 480);
          double v7 = AVLocalizedString(@"Title");
          [v6 setAccessibilityLabel:v7];

          [*(id *)(a1 + 480) setIsAccessibilityElement:1];
          [*(id *)(a1 + 480) setLineBreakMode:2];
          [*(id *)(a1 + 480) setAutoresizingMask:0];
          [*(id *)(a1 + 480) setHidden:1];
          [*(id *)(a1 + 480) setAttributedText:*(void *)(a1 + 504)];
          double v8 = *(void **)(a1 + 480);
          double v9 = [*(id *)(a1 + 536) titleFont];
          [v8 setFont:v9];

          double v10 = *(void **)(a1 + 480);
          double v11 = [MEMORY[0x1E4FB1618] whiteColor];
          [v10 setTextColor:v11];

          double v12 = *(void **)(a1 + 456);
          uint64_t v13 = *(void *)(a1 + 480);
          [v12 addSubview:v13];
        }
      }
    }
  }
}

- (void)_setUpSubtitleLabelIfNeeded
{
  if (a1)
  {
    if (!*(void *)(a1 + 488))
    {
      v2 = [(id)a1 window];
      if (v2)
      {
        uint64_t v3 = *(void *)(a1 + 512);

        if (v3)
        {
          id v4 = objc_alloc_init(MEMORY[0x1E4FB1930]);
          double v5 = *(void **)(a1 + 488);
          *(void *)(a1 + 488) = v4;

          [*(id *)(a1 + 488) setAccessibilityIdentifier:@"Sub-title"];
          double v6 = *(void **)(a1 + 488);
          double v7 = AVLocalizedString(@"Sub-title");
          [v6 setAccessibilityLabel:v7];

          [*(id *)(a1 + 488) setIsAccessibilityElement:1];
          [*(id *)(a1 + 488) setAutoresizingMask:0];
          [*(id *)(a1 + 488) setHidden:1];
          [*(id *)(a1 + 488) setAttributedText:*(void *)(a1 + 512)];
          double v8 = *(void **)(a1 + 488);
          double v9 = [*(id *)(a1 + 536) subtitleFont];
          [v8 setFont:v9];

          double v10 = *(void **)(a1 + 488);
          double v11 = [MEMORY[0x1E4FB1618] whiteColor];
          [v10 setTextColor:v11];

          [*(id *)(a1 + 488) setNumberOfLines:2];
          [*(id *)(a1 + 488) setLineBreakMode:0];
          double v12 = *(void **)(a1 + 456);
          uint64_t v13 = *(void *)(a1 + 488);
          [v12 addSubview:v13];
        }
      }
    }
  }
}

- (void)_setUpInfoAffordanceIfNeeded
{
  if (a1)
  {
    if (!*(void *)(a1 + 496))
    {
      v2 = [(id)a1 window];
      if (v2)
      {
        int v3 = *(unsigned __int8 *)(a1 + 520);

        if (v3)
        {
          uint64_t v4 = +[AVButton buttonWithAccessibilityIdentifier:@"More Info" isSecondGeneration:1];
          double v5 = *(void **)(a1 + 496);
          *(void *)(a1 + 496) = v4;

          [*(id *)(a1 + 496) setAutoresizingMask:0];
          double v6 = *(void **)(a1 + 496);
          double v7 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
          [v6 setTintColor:v7];

          [*(id *)(a1 + 496) setHidden:1];
          double v8 = *(void **)(a1 + 496);
          double v9 = [*(id *)(a1 + 536) infoAffordanceButtonFont];
          [v8 setInlineFont:v9];

          [*(id *)(a1 + 496) setImageName:@"chevron.right"];
          [*(id *)(a1 + 496) addTarget:a1 action:sel__infoAffordancePressed_ forControlEvents:64];
          uint64_t v10 = *(void *)(a1 + 496);
          [(id)a1 addSubview:v10];
        }
      }
    }
  }
}

- (void)_updateFonts
{
  if (a1)
  {
    v2 = *(void **)(a1 + 480);
    int v3 = [*(id *)(a1 + 536) titleFont];
    [v2 setFont:v3];

    uint64_t v4 = *(void **)(a1 + 488);
    id v5 = [*(id *)(a1 + 536) subtitleFont];
    [v4 setFont:v5];
  }
}

- (double)titleLabelCenterYOffset
{
  [(UILabel *)self->_titleLabel intrinsicContentSize];
  uint64_t v4 = v3;
  double v6 = v5;
  [(AVMobileTitlebarView *)self intrinsicContentSize];
  double v8 = v7 - v6;
  uint64_t v9 = 0;
  uint64_t v10 = v4;
  double v11 = v6;

  return CGRectGetMidY(*(CGRect *)&v9);
}

- (void)setTitle:(id)a3
{
  p_title = &self->_title;
  id v13 = a3;
  if (!-[NSAttributedString isEqualToAttributedString:](*p_title, "isEqualToAttributedString:"))
  {
    objc_storeStrong((id *)&self->_title, a3);
    double v6 = (NSMutableAttributedString *)[(NSAttributedString *)*p_title mutableCopy];
    titleLabelString = self->_titleLabelString;
    self->_titleLabelString = v6;

    double v8 = [(NSMutableAttributedString *)self->_titleLabelString mutableString];
    uint64_t v9 = [(NSMutableAttributedString *)self->_titleLabelString string];
    uint64_t v10 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    double v11 = [v9 stringByTrimmingCharactersInSet:v10];
    [v8 setString:v11];

    if (![(NSMutableAttributedString *)self->_titleLabelString length])
    {
      double v12 = self->_titleLabelString;
      self->_titleLabelString = 0;
    }
    -[AVMobileTitlebarView _setUpTitleLabelIfNeeded]((uint64_t)self);
    [(UILabel *)self->_titleLabel setAttributedText:self->_titleLabelString];
    [(AVMobileTitlebarView *)self setNeedsLayout];
  }
}

- (void)setSubtitle:(id)a3
{
  p_subtitle = &self->_subtitle;
  id v13 = a3;
  if (!-[NSAttributedString isEqualToAttributedString:](*p_subtitle, "isEqualToAttributedString:"))
  {
    objc_storeStrong((id *)&self->_subtitle, a3);
    double v6 = (NSMutableAttributedString *)[(NSAttributedString *)*p_subtitle mutableCopy];
    subtitleLabelString = self->_subtitleLabelString;
    self->_subtitleLabelString = v6;

    double v8 = [(NSMutableAttributedString *)self->_subtitleLabelString mutableString];
    uint64_t v9 = [(NSMutableAttributedString *)self->_subtitleLabelString string];
    uint64_t v10 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    double v11 = [v9 stringByTrimmingCharactersInSet:v10];
    [v8 setString:v11];

    if (![(NSMutableAttributedString *)self->_subtitleLabelString length])
    {
      double v12 = self->_subtitleLabelString;
      self->_subtitleLabelString = 0;
    }
    -[AVMobileTitlebarView _setUpSubtitleLabelIfNeeded]((uint64_t)self);
    [(UILabel *)self->_subtitleLabel setAttributedText:self->_subtitleLabelString];
    [(AVMobileTitlebarView *)self setNeedsLayout];
  }
}

- (void)setStyleSheet:(id)a3
{
  double v5 = (AVMobileChromelessControlsStyleSheet *)a3;
  p_styleSheet = &self->_styleSheet;
  if (self->_styleSheet != v5)
  {
    double v7 = v5;
    objc_storeStrong((id *)p_styleSheet, a3);
    -[AVMobileTitlebarView _updateFonts]((uint64_t)self);
    p_styleSheet = (AVMobileChromelessControlsStyleSheet **)[(AVMobileTitlebarView *)self setNeedsLayout];
    double v5 = v7;
  }

  MEMORY[0x1F41817F8](p_styleSheet, v5);
}

- (void)setShowsInfoAffordance:(BOOL)a3
{
  if (self->_showsInfoAffordance != a3)
  {
    self->_showsInfoAffordance = a3;
    -[AVMobileTitlebarView _setUpInfoAffordanceIfNeeded]((uint64_t)self);
    [(AVMobileTitlebarView *)self setNeedsLayout];
  }
}

- (void)setContentTag:(id)a3
{
  double v5 = (AVMobileContentTag *)a3;
  p_contentTag = &self->_contentTag;
  if (self->_contentTag != v5)
  {
    double v11 = v5;
    objc_storeStrong((id *)&self->_contentTag, a3);
    if (*p_contentTag)
    {
      if (!self->_contentTagView)
      {
        double v7 = [(AVMobileTitlebarView *)self window];
        if (v7)
        {
          double v8 = *p_contentTag;

          if (v8)
          {
            uint64_t v9 = [[AVMobileContentTagView alloc] initWithContentTag:*p_contentTag withStyleSheet:self->_styleSheet];
            contentTagView = self->_contentTagView;
            self->_contentTagView = v9;

            [(AVMobileContentTagView *)self->_contentTagView setHidden:1];
            [(AVMobileContentTagView *)self->_contentTagView setAutoresizingMask:0];
            [(UIView *)self->_contentContainerView addSubview:self->_contentTagView];
          }
        }
      }
      [(AVMobileContentTagView *)self->_contentTagView setContentTag:*p_contentTag];
    }
    [(AVMobileTitlebarView *)self setNeedsLayout];
    double v5 = v11;
  }
}

- (AVMobileTitlebarView)initWithStyleSheet:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AVMobileTitlebarView;
  double v6 = -[AVView initWithFrame:](&v14, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  double v7 = v6;
  if (v6)
  {
    v6->_showsContentTag = 1;
    v6->_showsSubtitle = 1;
    v6->_showsTitle = 1;
    objc_storeStrong((id *)&v6->_styleSheet, a3);
    double v8 = (CAGradientLayer *)objc_alloc_init(MEMORY[0x1E4F39BD0]);
    contentContainerViewMask = v7->_contentContainerViewMask;
    v7->_contentContainerViewMask = v8;

    uint64_t v10 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    contentContainerView = v7->_contentContainerView;
    v7->_contentContainerView = v10;

    [(UIView *)v7->_contentContainerView setAutoresizingMask:0];
    double v12 = [(UIView *)v7->_contentContainerView layer];
    [v12 setMask:v7->_contentContainerViewMask];

    [(AVMobileTitlebarView *)v7 addSubview:v7->_contentContainerView];
    [(AVView *)v7 setIgnoresTouches:1];
  }

  return v7;
}

@end